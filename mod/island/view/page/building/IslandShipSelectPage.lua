local var_0_0 = class("IslandShipSelectPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipSelectUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("top/back")
	arg_2_0.title = arg_2_0:findTF("top/title/Text")

	setText(arg_2_0.title, i18n("island_select_ship"))

	arg_2_0.frameTF = arg_2_0:findTF("frame")
	arg_2_0.shipRectCom = arg_2_0:findTF("ships", arg_2_0.frameTF):GetComponent("LScrollRect")

	setText(arg_2_0.frameTF:Find("selected/Text"), i18n("island_select_ship_label_1"))

	arg_2_0.selectedTextCom = arg_2_0.frameTF:Find("selected/num"):GetComponent("Text")
	arg_2_0.benefitsTF = arg_2_0._tf:Find("benefits")
	arg_2_0.benefitTipBtn = arg_2_0.benefitsTF:Find("tip/help")

	setText(arg_2_0.benefitsTF:Find("tip/Text"), i18n("island_select_ship_overview"))

	arg_2_0.mainAttrBar = arg_2_0.benefitsTF:Find("main/slider/bar")

	setText(arg_2_0.benefitsTF:Find("main/Text"), IslandShipAttr.ATTRS_CH[1])

	arg_2_0.subAttrUIList = UIItemList.New(arg_2_0.benefitsTF:Find("subs"), arg_2_0.benefitsTF:Find("subs/tpl"))
	arg_2_0.infoEmptyTF = arg_2_0:findTF("info/empty")

	setText(arg_2_0.infoEmptyTF:Find("Image/Text"), i18n("island_select_ship"))

	arg_2_0.infoEmptyTitleTF = arg_2_0.infoEmptyTF:Find("name")
	arg_2_0.infoPanel = arg_2_0:findTF("info/content")
	arg_2_0.nameTF = arg_2_0:findTF("name", arg_2_0.infoPanel)
	arg_2_0.levelTF = arg_2_0:findTF("name/level", arg_2_0.infoPanel)
	arg_2_0.attrUIList = UIItemList.New(arg_2_0:findTF("attrs", arg_2_0.infoPanel), arg_2_0:findTF("attrs/tpl", arg_2_0.infoPanel))
	arg_2_0.skillTF = arg_2_0:findTF("skill", arg_2_0.infoPanel)
	arg_2_0.energyTFInfo = arg_2_0:findTF("selectShipEnergyInfo", arg_2_0.infoPanel)
	arg_2_0.energyTF = arg_2_0:findTF("energy", arg_2_0.energyTFInfo)
	arg_2_0.statusTF = arg_2_0:findTF("status", arg_2_0.infoPanel)
	arg_2_0.sureBtn = arg_2_0:findTF("sure")
	arg_2_0.indexBtn = arg_2_0._tf:Find("frame/filter_panel/IndexIco")
	arg_2_0.orderBtn = arg_2_0._tf:Find("frame/filter_panel/index")
	arg_2_0.orderIco = arg_2_0._tf:Find("frame/filter_panel/index/content/icon/icon")
	arg_2_0.orderTxt = arg_2_0._tf:Find("frame/filter_panel/index/content/Text"):GetComponent(typeof(Text))
	arg_2_0.shipIconTF = arg_2_0.energyTFInfo:Find("icon_mask/icon")
	arg_2_0.energyTimeTextTf = arg_2_0.energyTFInfo:Find("time_Text")
	arg_2_0.recoveryTimeTips = arg_2_0:findTF("selectShipEnergyInfo/recoveryTimeTips", arg_2_0.infoPanel)
	arg_2_0.skill = arg_2_0.infoPanel:Find("skill")
	arg_2_0.skillEmp = arg_2_0.infoPanel:Find("skillEmp")
	arg_2_0.skillEmpDes = arg_2_0.skillEmp:Find("Text")
	arg_2_0.skillInuse = arg_2_0.skill:Find("skill_tab_bg/iconBright")
	arg_2_0.skillUnuse = arg_2_0.skill:Find("skill_tab_bg/iconDark")
	arg_2_0.skillName = arg_2_0.skill:Find("name"):GetComponent(typeof(Text))
	arg_2_0.skillDes = arg_2_0.skill:Find("desc/Text"):GetComponent(typeof(Text))
	arg_2_0.shipContent = arg_2_0.frameTF:Find("ships")
	arg_2_0.shipEmpty = arg_2_0.frameTF:Find("empShip")
	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0.dftAniEvent:SetEndEvent(nil)
		arg_3_0.dftAniEvent:SetEndEvent(function()
			arg_3_0:Hide()

			if arg_3_0.cancelFunc then
				arg_3_0.cancelFunc()
			end
		end)
		arg_3_0.animationPlayer:Play("anim_IslandShipSelectUI_Out")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sureBtn, function()
		arg_3_0:Hide()

		if arg_3_0.confirmFunc then
			arg_3_0.confirmFunc(arg_3_0.selectedIds)
		end
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.indexBtn, function(arg_7_0)
		if arg_7_0 then
			arg_3_0:emit(IslandMediator.OPEN_SHIP_INDEX, {
				OnFilter = function(arg_8_0)
					arg_3_0:OnFilter(arg_8_0)
				end,
				defaultIndex = arg_3_0.sortData
			})
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.orderBtn, function()
		arg_3_0.selectAsc = not arg_3_0.selectAsc

		arg_3_0:UpdateSortBtn()
		arg_3_0:FlushShips()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.benefitTipBtn, function()
		arg_3_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_manage_help_tip")
		})
	end, SFX_PANEL)
	arg_3_0.subAttrUIList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventInit then
			local var_11_0 = IslandShipAttr.ATTRS[arg_11_1 + 1]

			arg_11_2.name = var_11_0

			setText(arg_11_2:Find("Text"), IslandShipAttr.ToChinese(var_11_0))
		elseif arg_11_0 == UIItemList.EventUpdate then
			setFillAmount(arg_11_2:Find("slider/bar"), arg_3_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[arg_11_1 + 1]))
		end
	end)

	function arg_3_0.shipRectCom.onInitItem(arg_12_0)
		arg_3_0:OnInitShip(arg_12_0)
	end

	function arg_3_0.shipRectCom.onUpdateItem(arg_13_0, arg_13_1)
		arg_3_0:OnUpdateShip(arg_13_0, arg_13_1)
	end

	arg_3_0.cards = {}
	arg_3_0.selectAsc = true
	arg_3_0.sortData = {
		sortIndex = IslandShipIndexLayer.SortLevel,
		campIndex = ShipIndexConst.CampAll,
		rarityIndex = ShipIndexConst.RarityAll,
		extraIndex = IslandShipIndexLayer.ExtraALL
	}

	arg_3_0:UpdateSortBtn()

	arg_3_0.timeMgr = pg.TimeMgr.GetInstance()
end

function var_0_0.OnFilter(arg_14_0, arg_14_1)
	arg_14_0.sortData = arg_14_1

	arg_14_0:UpdateSortBtn()
	arg_14_0:FlushShips()
end

function var_0_0.UpdateSortBtn(arg_15_0)
	arg_15_0.orderIco.localScale = arg_15_0.selectAsc and Vector3(1, -1, 1) or Vector3(1, 1, 1)

	local var_15_0, var_15_1 = IslandShipIndexLayer.getSortFuncAndName(arg_15_0.sortData.sortIndex, arg_15_0.selectAsc)

	arg_15_0.orderTxt.text = i18n(var_15_1)
end

function var_0_0.UpdateAttrs(arg_16_0, arg_16_1)
	local var_16_0 = IslandShipAttr.ATTRS

	arg_16_0.attrUIList:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			local var_17_0 = arg_17_1 + 1

			arg_16_0:UpdateAttr(arg_17_2, var_16_0, var_17_0, arg_16_1)
		end
	end)
	arg_16_0.attrUIList:align(#var_16_0)
end

function var_0_0.UpdateAttr(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	local var_18_0 = arg_18_2[arg_18_3]
	local var_18_1 = arg_18_4:GetAttr(var_18_0)

	setText(arg_18_1:Find("name"), IslandShipAttr.ToChinese(var_18_0))
	setText(arg_18_1:Find("value"), var_18_1)

	local var_18_2 = arg_18_4:GetAttrGrade(var_18_0)
	local var_18_3 = IslandShipAttr.Grade2Img(var_18_2)

	arg_18_1:Find("grade"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_18_3[1])
	arg_18_1:Find("grade_bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_18_3[2])
end

function var_0_0.OnShow(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5, arg_19_6)
	pg.UIMgr.GetInstance():BlurPanel(arg_19_0._tf)

	arg_19_0.selectNum = arg_19_1
	arg_19_0.selectedIds = arg_19_2
	arg_19_0.attrType = arg_19_3
	arg_19_0.confirmFunc = arg_19_4
	arg_19_0.cancelFunc = arg_19_5
	arg_19_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	arg_19_0.place_Id = arg_19_6 and arg_19_6.place_Id
	arg_19_0.showBenefits = arg_19_6 and arg_19_6.showBenefits

	local var_19_0 = arg_19_6 and arg_19_6.emptyInfoTitle and arg_19_6.emptyInfoTitle or ""

	setText(arg_19_0.infoEmptyTitleTF, var_19_0)

	local var_19_1 = #arg_19_0.selectedIds == 0 and arg_19_0.selectNum == 1

	arg_19_0:FlushShips(var_19_1)
end

function var_0_0.OnInitShip(arg_20_0, arg_20_1)
	local var_20_0 = IslandSelectShipCard.New(arg_20_1)

	arg_20_0.cards[arg_20_1] = var_20_0
end

function var_0_0.OnUpdateShip(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.cards[arg_21_2]

	if not var_21_0 then
		arg_21_0:OnInitItem(arg_21_2)

		var_21_0 = arg_21_0.cards[arg_21_2]
	end

	local var_21_1 = arg_21_0.showShips[arg_21_1 + 1]
	local var_21_2 = arg_21_0.characterAgency:GetShipById(var_21_1)

	onButton(arg_21_0, var_21_0.go, function()
		if var_21_2:GetState() ~= IslandShip.STATE_NORMAL then
			return
		end

		if arg_21_0.showId == var_21_0.id then
			arg_21_0.showId = nil
		else
			arg_21_0.showId = var_21_0.id
		end

		if table.contains(arg_21_0.selectedIds, var_21_0.id) then
			table.removebyvalue(arg_21_0.selectedIds, var_21_0.id)
		elseif arg_21_0.selectNum == 1 then
			arg_21_0.selectedIds = {
				var_21_0.id
			}
		else
			if #arg_21_0.selectedIds >= arg_21_0.selectNum then
				return
			end

			table.insert(arg_21_0.selectedIds, var_21_0.id)
		end

		for iter_22_0, iter_22_1 in pairs(arg_21_0.cards) do
			iter_22_1:UpdateSelected(arg_21_0.selectedIds)
		end

		arg_21_0:FlushInfo()
	end, SFX_PANEL)
	var_21_0:Update(var_21_1, arg_21_0.attrType, arg_21_0.place_Id, arg_21_0.selectedIds)
end

function var_0_0.FlushShips(arg_23_0, arg_23_1)
	arg_23_0.showShips = arg_23_0:GetShips()

	if #arg_23_0.showShips ~= 0 and arg_23_1 then
		local var_23_0 = arg_23_0:GetFristSelectableShipId()

		if var_23_0 then
			arg_23_0.showId = var_23_0

			table.insert(arg_23_0.selectedIds, var_23_0)
		end
	end

	arg_23_0.showId = arg_23_0.selectedIds[1]

	setActive(arg_23_0.shipContent, #arg_23_0.showShips ~= 0)
	setActive(arg_23_0.shipEmpty, #arg_23_0.showShips == 0)
	arg_23_0.shipRectCom:SetTotalCount(#arg_23_0.showShips)
	arg_23_0:FlushInfo()
end

function var_0_0.GetFristSelectableShipId(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.showShips) do
		if arg_24_0.characterAgency:GetShipById(iter_24_1):GetState() == IslandShip.STATE_NORMAL then
			return iter_24_1
		end
	end

	return nil
end

function var_0_0.UpdateTimer(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1 - arg_25_0.timeMgr:GetServerTime()

	setText(arg_25_0.energyTimeTextTf, arg_25_0.timeMgr:DescCDTime(var_25_0))
end

function var_0_0.StopTimer(arg_26_0)
	if arg_26_0.energyTimer ~= nil then
		arg_26_0.energyTimer:Stop()

		arg_26_0.energyTimer = nil
	end
end

function var_0_0.FlushInfo(arg_27_0)
	arg_27_0.selectedTextCom.text = #arg_27_0.selectedIds .. "/" .. arg_27_0.selectNum

	arg_27_0:FlushBenefits()
	setActive(arg_27_0.sureBtn, arg_27_0.showId)
	setActive(arg_27_0.infoPanel, arg_27_0.showId)
	setActive(arg_27_0.infoEmptyTF, not arg_27_0.showId)

	if not arg_27_0.showId then
		return
	end

	local var_27_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_27_0.showId)

	setText(arg_27_0.nameTF, var_27_0:GetName())
	setText(arg_27_0.levelTF, string.format("-Lv.%d", var_27_0:GetLevel()))
	arg_27_0:UpdateAttrs(var_27_0)

	local var_27_1 = IslandShip.StaticGetPrefab(var_27_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_27_1, "", arg_27_0.shipIconTF)

	local var_27_2 = var_27_0:GetCurrentEnergy()
	local var_27_3 = var_27_0:GetMaxEnergy()

	setText(arg_27_0:findTF("text", arg_27_0.energyTF), var_27_2 .. "/" .. var_27_3)
	setSlider(arg_27_0:findTF("energy_bar", arg_27_0.energyTF), 0, 1, var_27_2 / var_27_3)

	if var_27_2 ~= var_27_3 then
		setActive(arg_27_0.recoveryTimeTips, true)
		setActive(arg_27_0.energyTimeTextTf, true)

		local var_27_4 = var_27_0:GetEnergyMaxTime()

		arg_27_0:StopTimer()
		arg_27_0:UpdateTimer(var_27_4)

		arg_27_0.energyTimer = Timer.New(function()
			arg_27_0:UpdateTimer(var_27_4)
		end, 1, -1)

		arg_27_0.energyTimer:Start()
	else
		arg_27_0:StopTimer()
		setActive(arg_27_0.recoveryTimeTips, false)
		setActive(arg_27_0.energyTimeTextTf, false)
	end

	local var_27_5 = var_27_0:GetSkill()
	local var_27_6 = var_27_5:IsUnlock()

	setActive(arg_27_0.skill, var_27_6)
	setActive(arg_27_0.skillEmp, not var_27_6)
	setText(arg_27_0.skillEmpDes, i18n("island_need_star", var_27_0:GetSkillUnlockLevel()))

	local var_27_7 = var_27_5:IsEffectiveInPlace(arg_27_0.place_Id)

	setActive(arg_27_0.skillInuse, var_27_7)
	setActive(arg_27_0.skillUnuse, not var_27_7)

	arg_27_0.skillName.text = string.format("%s - %s", var_27_5:GetName(), "[Lv." .. var_27_5:GetLevel() .. "]")
	arg_27_0.skillDes.text = var_27_5:GetEffectDesc()
end

function var_0_0.FlushBenefits(arg_29_0)
	setActive(arg_29_0.benefitsTF, arg_29_0.showBenefits)

	if arg_29_0.showBenefits then
		setFillAmount(arg_29_0.mainAttrBar, arg_29_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[1]))
		arg_29_0.subAttrUIList:align(#IslandShipAttr.ATTRS)
	end
end

function var_0_0.GetShipsAttrProgress(arg_30_0, arg_30_1)
	local var_30_0 = pg.island_chara_att.all[#pg.island_chara_att.all]
	local var_30_1 = var_30_0 * arg_30_0.selectNum
	local var_30_2 = 0

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.selectedIds) do
		var_30_2 = var_30_2 + (var_30_0 - arg_30_0.characterAgency:GetShipById(iter_30_1):GetAttrGrade(arg_30_1) + 1)
	end

	return var_30_2 / var_30_1
end

function var_0_0.ToVShip(arg_31_0, arg_31_1)
	if not arg_31_0.vship then
		arg_31_0.vship = {}

		function arg_31_0.vship.getNation()
			return arg_31_0.vship.config.nationality
		end

		function arg_31_0.vship.getShipType()
			return arg_31_0.vship.config.type
		end

		function arg_31_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_31_0.vship.config.type)
		end

		function arg_31_0.vship.getRarity()
			return arg_31_0.vship.config.rarity
		end
	end

	arg_31_0.vship.config = arg_31_1

	return arg_31_0.vship
end

local function var_0_1(arg_36_0, arg_36_1)
	if not arg_36_1 or arg_36_1 == "" then
		return true
	end

	local var_36_0 = string.lower(string.gsub(arg_36_1, "%.", "%%."))
	local var_36_1 = IslandShip.StaticGetName(arg_36_0)

	return string.find(string.lower(var_36_1), var_36_0)
end

local function var_0_2(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_1
	local var_37_1 = ShipGroup.getDefaultShipConfig(var_37_0)
	local var_37_2 = arg_37_0:ToVShip(var_37_1)
	local var_37_3 = arg_37_0.characterAgency:GetShipById(arg_37_1)

	if ShipIndexConst.filterByCamp(var_37_2, arg_37_2.campIndex) and ShipIndexConst.filterByRarity(var_37_2, arg_37_2.rarityIndex) and IslandShipIndexLayer.filterByExtra(var_37_3, arg_37_2.extraIndex) then
		return true
	end

	return false
end

function var_0_0.GetShips(arg_38_0)
	local var_38_0 = {}
	local var_38_1 = arg_38_0.characterAgency:GetShipsContainNpc()

	for iter_38_0, iter_38_1 in ipairs(var_38_1) do
		if var_0_1(iter_38_1.id, arg_38_0.searchKey) and var_0_2(arg_38_0, iter_38_1.id, arg_38_0.sortData) then
			table.insert(var_38_0, iter_38_1.id)
		end
	end

	local var_38_2 = IslandShipIndexLayer.getSortFuncAndName(arg_38_0.sortData.sortIndex, arg_38_0.selectAsc)

	table.sort(var_38_0, CompareFuncs(var_38_2))

	return var_38_0
end

function var_0_0.OnDestroy(arg_39_0)
	arg_39_0:StopTimer()
	arg_39_0.dftAniEvent:SetEndEvent(nil)
end

function var_0_0.OnHide(arg_40_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_40_0._tf)
end

return var_0_0
