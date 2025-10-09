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

	setText(arg_2_0.benefitsTF:Find("main/Text"), IslandShipAttr.ATTRS_CH[IslandShipAttr.MANAGE_KEY])

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

	setText(arg_2_0.sureBtn:Find("Text"), i18n("island_shipselect_confirm"))

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

	setText(arg_2_0.shipEmpty:Find("Text"), i18n("island_production_selected_tip2"))
	setText(arg_2_0.recoveryTimeTips, i18n("island_ship_energy_recoverytips"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
		existCall(arg_3_0.cancelFunc)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sureBtn, function()
		local var_5_0 = getProxy(IslandProxy):GetIsland():GetFollowerAgency()
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in ipairs(arg_3_0.selectedIds) do
			if var_5_0:Following(iter_5_1) then
				table.insert(var_5_1, iter_5_1)
			end
		end

		if #var_5_1 > 0 then
			arg_3_0:ShowMsgBox({
				type = IslandMsgBox.TYPE_COMMON,
				content = i18n("island_cancel_follow_tip"),
				onYes = function()
					for iter_6_0, iter_6_1 in ipairs(var_5_1) do
						arg_3_0:emit(IslandMediator.DEL_FOLLOWER, iter_6_1)
					end

					arg_3_0:Hide()
					existCall(arg_3_0.confirmFunc, arg_3_0.selectedIds)
				end,
				onNo = function()
					return
				end
			})

			return
		end

		arg_3_0:Hide()
		existCall(arg_3_0.confirmFunc, arg_3_0.selectedIds)
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.indexBtn, function(arg_8_0)
		if arg_8_0 then
			arg_3_0:emit(IslandMediator.OPEN_SHIP_INDEX, {
				OnFilter = function(arg_9_0)
					arg_3_0:OnFilter(arg_9_0)
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
	onButton(arg_3_0, arg_3_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_commission.tip
		})
	end, SFX_PANEL)
	arg_3_0.subAttrUIList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventInit then
			local var_13_0 = IslandShipAttr.ATTRS[arg_13_1 + 1]

			arg_13_2.name = var_13_0

			setText(arg_13_2:Find("Text"), IslandShipAttr.ToChinese(var_13_0))
		elseif arg_13_0 == UIItemList.EventUpdate then
			setFillAmount(arg_13_2:Find("slider/bar"), arg_3_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[arg_13_1 + 1]))
		end
	end)

	function arg_3_0.shipRectCom.onInitItem(arg_14_0)
		arg_3_0:OnInitShip(arg_14_0)
	end

	function arg_3_0.shipRectCom.onUpdateItem(arg_15_0, arg_15_1)
		arg_3_0:OnUpdateShip(arg_15_0, arg_15_1)
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

function var_0_0.OnFilter(arg_16_0, arg_16_1)
	arg_16_0.sortData = arg_16_1

	arg_16_0:UpdateSortBtn()
	arg_16_0:FlushShips()
end

function var_0_0.UpdateSortBtn(arg_17_0)
	arg_17_0.orderIco.localScale = arg_17_0.selectAsc and Vector3(1, -1, 1) or Vector3(1, 1, 1)

	local var_17_0, var_17_1 = IslandShipIndexLayer.getSortFuncAndName(arg_17_0.sortData.sortIndex, arg_17_0.selectAsc)

	arg_17_0.orderTxt.text = i18n(var_17_1)
end

function var_0_0.UpdateAttrs(arg_18_0, arg_18_1)
	local var_18_0 = IslandShipAttr.ATTRS

	arg_18_0.attrUIList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = arg_19_1 + 1

			arg_18_0:UpdateAttr(arg_19_2, var_18_0, var_19_0, arg_18_1)
		end
	end)
	arg_18_0.attrUIList:align(#var_18_0)
end

function var_0_0.UpdateAttr(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0 = arg_20_2[arg_20_3]
	local var_20_1 = arg_20_4:GetAttr(var_20_0)

	setText(arg_20_1:Find("name"), IslandShipAttr.ToChinese(var_20_0))
	setText(arg_20_1:Find("value"), var_20_1)

	local var_20_2 = arg_20_4:GetAttrGrade(var_20_0)
	local var_20_3 = IslandShipAttr.Grade2Img(var_20_2)

	arg_20_1:Find("grade"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_20_3[1])
	arg_20_1:Find("grade_bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_20_3[2])
end

function var_0_0.OnShow(arg_21_0, arg_21_1)
	arg_21_0:BlurPanel()

	arg_21_0.selectNum = arg_21_1.selectNum or 1
	arg_21_0.selectedIds = arg_21_1.selectedIds or {}
	arg_21_0.attrType = arg_21_1.attrType
	arg_21_0.confirmFunc = arg_21_1.confirmFunc
	arg_21_0.cancelFunc = arg_21_1.cancelFunc
	arg_21_0.placeId = arg_21_1.placeId
	arg_21_0.showBenefits = arg_21_1.showBenefits

	local var_21_0 = arg_21_1.emptyInfoTitle or ""

	setText(arg_21_0.infoEmptyTitleTF, var_21_0)

	arg_21_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	local var_21_1 = #arg_21_0.selectedIds == 0 and arg_21_0.selectNum == 1

	arg_21_0:FlushShips(var_21_1)
end

function var_0_0.OnInitShip(arg_22_0, arg_22_1)
	local var_22_0 = IslandSelectShipCard.New(arg_22_1)

	arg_22_0.cards[arg_22_1] = var_22_0
end

function var_0_0.OnUpdateShip(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.cards[arg_23_2]

	if not var_23_0 then
		arg_23_0:OnInitItem(arg_23_2)

		var_23_0 = arg_23_0.cards[arg_23_2]
	end

	local var_23_1 = arg_23_0.showShips[arg_23_1 + 1]
	local var_23_2 = arg_23_0.characterAgency:GetShipById(var_23_1)

	onButton(arg_23_0, var_23_0.go, function()
		if var_23_2:GetState() ~= IslandShip.STATE_NORMAL then
			return
		end

		if arg_23_0.showId == var_23_0.id then
			arg_23_0.showId = nil
		else
			arg_23_0.showId = var_23_0.id
		end

		if table.contains(arg_23_0.selectedIds, var_23_0.id) then
			table.removebyvalue(arg_23_0.selectedIds, var_23_0.id)
		elseif arg_23_0.selectNum == 1 then
			arg_23_0.selectedIds = {
				var_23_0.id
			}
		else
			if #arg_23_0.selectedIds >= arg_23_0.selectNum then
				return
			end

			table.insert(arg_23_0.selectedIds, var_23_0.id)
		end

		for iter_24_0, iter_24_1 in pairs(arg_23_0.cards) do
			iter_24_1:UpdateSelected(arg_23_0.selectedIds)
		end

		arg_23_0:FlushInfo()
	end, SFX_PANEL)
	var_23_0:Update(var_23_1, arg_23_0.attrType, arg_23_0.placeId, arg_23_0.selectedIds)
end

function var_0_0.FlushShips(arg_25_0, arg_25_1)
	arg_25_0.showShips = arg_25_0:GetShips()

	if #arg_25_0.showShips ~= 0 and arg_25_1 then
		local var_25_0 = arg_25_0:GetFristSelectableShipId()

		if var_25_0 then
			arg_25_0.showId = var_25_0

			table.insert(arg_25_0.selectedIds, var_25_0)
		end
	end

	arg_25_0.showId = arg_25_0.selectedIds[1]

	setActive(arg_25_0.shipContent, #arg_25_0.showShips ~= 0)
	setActive(arg_25_0.shipEmpty, #arg_25_0.showShips == 0)
	arg_25_0.shipRectCom:SetTotalCount(#arg_25_0.showShips)
	arg_25_0:FlushInfo()
end

function var_0_0.GetFristSelectableShipId(arg_26_0)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.showShips) do
		if arg_26_0.characterAgency:GetShipById(iter_26_1):GetState() == IslandShip.STATE_NORMAL then
			return iter_26_1
		end
	end

	return nil
end

function var_0_0.UpdateTimer(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1 - arg_27_0.timeMgr:GetServerTime()

	setText(arg_27_0.energyTimeTextTf, arg_27_0.timeMgr:DescCDTime(var_27_0))
end

function var_0_0.StopTimer(arg_28_0)
	if arg_28_0.energyTimer ~= nil then
		arg_28_0.energyTimer:Stop()

		arg_28_0.energyTimer = nil
	end
end

function var_0_0.FlushInfo(arg_29_0)
	arg_29_0.selectedTextCom.text = #arg_29_0.selectedIds .. "/" .. arg_29_0.selectNum

	arg_29_0:FlushBenefits()
	setActive(arg_29_0.sureBtn, arg_29_0.showId)
	setActive(arg_29_0.infoPanel, arg_29_0.showId)
	setActive(arg_29_0.infoEmptyTF, not arg_29_0.showId)

	if not arg_29_0.showId then
		return
	end

	local var_29_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_29_0.showId)

	setText(arg_29_0.nameTF, var_29_0:GetName())
	setText(arg_29_0.levelTF, string.format("-Lv.%d", var_29_0:GetLevel()))
	arg_29_0:UpdateAttrs(var_29_0)

	local var_29_1 = IslandShip.StaticGetPrefab(var_29_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_29_1, "", arg_29_0.shipIconTF)

	local var_29_2 = var_29_0:GetCurrentEnergy()
	local var_29_3 = var_29_0:GetMaxEnergy()

	setText(arg_29_0:findTF("text", arg_29_0.energyTF), var_29_2 .. "/" .. var_29_3)
	setSlider(arg_29_0:findTF("energy_bar", arg_29_0.energyTF), 0, 1, var_29_2 / var_29_3)

	if var_29_2 ~= var_29_3 then
		setActive(arg_29_0.recoveryTimeTips, true)
		setActive(arg_29_0.energyTimeTextTf, true)

		local var_29_4 = var_29_0:GetEnergyMaxTime()

		arg_29_0:StopTimer()
		arg_29_0:UpdateTimer(var_29_4)

		arg_29_0.energyTimer = Timer.New(function()
			arg_29_0:UpdateTimer(var_29_4)
		end, 1, -1)

		arg_29_0.energyTimer:Start()
	else
		arg_29_0:StopTimer()
		setActive(arg_29_0.recoveryTimeTips, false)
		setActive(arg_29_0.energyTimeTextTf, false)
	end

	local var_29_5 = var_29_0:GetSkill()
	local var_29_6 = var_29_5:IsUnlock()

	setActive(arg_29_0.skill, var_29_6)
	setActive(arg_29_0.skillEmp, not var_29_6)
	setText(arg_29_0.skillEmpDes, i18n("island_need_star", var_29_0:GetSkillUnlockLevel()))

	local var_29_7 = var_29_5:IsEffectiveInPlace(arg_29_0.placeId)

	setActive(arg_29_0.skillInuse, var_29_7)
	setActive(arg_29_0.skillUnuse, not var_29_7)

	arg_29_0.skillName.text = string.format("%s - %s", var_29_5:GetName(), "[Lv." .. var_29_5:GetLevel() .. "]")
	arg_29_0.skillDes.text = var_29_5:GetEffectDesc()
end

function var_0_0.FlushBenefits(arg_31_0)
	setActive(arg_31_0.benefitsTF, arg_31_0.showBenefits)

	if arg_31_0.showBenefits then
		setFillAmount(arg_31_0.mainAttrBar, arg_31_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[1]))
		arg_31_0.subAttrUIList:align(#IslandShipAttr.ATTRS)
	end
end

function var_0_0.GetShipsAttrProgress(arg_32_0, arg_32_1)
	local var_32_0 = pg.island_chara_att.all[#pg.island_chara_att.all]
	local var_32_1 = var_32_0 * arg_32_0.selectNum
	local var_32_2 = 0

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.selectedIds) do
		var_32_2 = var_32_2 + (var_32_0 - arg_32_0.characterAgency:GetShipById(iter_32_1):GetAttrGrade(arg_32_1) + 1)
	end

	return var_32_2 / var_32_1
end

function var_0_0.ToVShip(arg_33_0, arg_33_1)
	if not arg_33_0.vship then
		arg_33_0.vship = {}

		function arg_33_0.vship.getNation()
			return arg_33_0.vship.config.nationality
		end

		function arg_33_0.vship.getShipType()
			return arg_33_0.vship.config.type
		end

		function arg_33_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_33_0.vship.config.type)
		end

		function arg_33_0.vship.getRarity()
			return arg_33_0.vship.config.rarity
		end
	end

	arg_33_0.vship.config = arg_33_1

	return arg_33_0.vship
end

local function var_0_1(arg_38_0, arg_38_1)
	if not arg_38_1 or arg_38_1 == "" then
		return true
	end

	local var_38_0 = string.lower(string.gsub(arg_38_1, "%.", "%%."))
	local var_38_1 = IslandShip.StaticGetName(arg_38_0)

	return string.find(string.lower(var_38_1), var_38_0)
end

local function var_0_2(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_1
	local var_39_1 = ShipGroup.getDefaultShipConfig(var_39_0)
	local var_39_2 = arg_39_0:ToVShip(var_39_1)
	local var_39_3 = arg_39_0.characterAgency:GetShipById(arg_39_1)

	if ShipIndexConst.filterByCamp(var_39_2, arg_39_2.campIndex) and ShipIndexConst.filterByRarity(var_39_2, arg_39_2.rarityIndex) and IslandShipIndexLayer.filterByExtra(var_39_3, arg_39_2.extraIndex) then
		return true
	end

	return false
end

function var_0_0.GetShips(arg_40_0)
	local var_40_0 = {}
	local var_40_1 = arg_40_0.characterAgency:GetShipsContainNpc()

	for iter_40_0, iter_40_1 in ipairs(var_40_1) do
		if var_0_1(iter_40_1.id, arg_40_0.searchKey) and var_0_2(arg_40_0, iter_40_1.id, arg_40_0.sortData) then
			table.insert(var_40_0, iter_40_1.id)
		end
	end

	local var_40_2 = IslandShipIndexLayer.getSortFuncAndName(arg_40_0.sortData.sortIndex, arg_40_0.selectAsc)

	table.sort(var_40_0, CompareFuncs(var_40_2))

	return var_40_0
end

function var_0_0.OnDestroy(arg_41_0)
	ClearLScrollrect(arg_41_0.shipRectCom)
	arg_41_0:StopTimer()
end

function var_0_0.OnHide(arg_42_0)
	arg_42_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_43_0)
	arg_43_0:OnHide()
end

return var_0_0
