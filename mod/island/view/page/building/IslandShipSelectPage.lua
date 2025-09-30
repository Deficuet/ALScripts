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
	arg_3_0.subAttrUIList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventInit then
			local var_12_0 = IslandShipAttr.ATTRS[arg_12_1 + 1]

			arg_12_2.name = var_12_0

			setText(arg_12_2:Find("Text"), IslandShipAttr.ToChinese(var_12_0))
		elseif arg_12_0 == UIItemList.EventUpdate then
			setFillAmount(arg_12_2:Find("slider/bar"), arg_3_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[arg_12_1 + 1]))
		end
	end)

	function arg_3_0.shipRectCom.onInitItem(arg_13_0)
		arg_3_0:OnInitShip(arg_13_0)
	end

	function arg_3_0.shipRectCom.onUpdateItem(arg_14_0, arg_14_1)
		arg_3_0:OnUpdateShip(arg_14_0, arg_14_1)
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

function var_0_0.OnFilter(arg_15_0, arg_15_1)
	arg_15_0.sortData = arg_15_1

	arg_15_0:UpdateSortBtn()
	arg_15_0:FlushShips()
end

function var_0_0.UpdateSortBtn(arg_16_0)
	arg_16_0.orderIco.localScale = arg_16_0.selectAsc and Vector3(1, -1, 1) or Vector3(1, 1, 1)

	local var_16_0, var_16_1 = IslandShipIndexLayer.getSortFuncAndName(arg_16_0.sortData.sortIndex, arg_16_0.selectAsc)

	arg_16_0.orderTxt.text = i18n(var_16_1)
end

function var_0_0.UpdateAttrs(arg_17_0, arg_17_1)
	local var_17_0 = IslandShipAttr.ATTRS

	arg_17_0.attrUIList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = arg_18_1 + 1

			arg_17_0:UpdateAttr(arg_18_2, var_17_0, var_18_0, arg_17_1)
		end
	end)
	arg_17_0.attrUIList:align(#var_17_0)
end

function var_0_0.UpdateAttr(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	local var_19_0 = arg_19_2[arg_19_3]
	local var_19_1 = arg_19_4:GetAttr(var_19_0)

	setText(arg_19_1:Find("name"), IslandShipAttr.ToChinese(var_19_0))
	setText(arg_19_1:Find("value"), var_19_1)

	local var_19_2 = arg_19_4:GetAttrGrade(var_19_0)
	local var_19_3 = IslandShipAttr.Grade2Img(var_19_2)

	arg_19_1:Find("grade"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_19_3[1])
	arg_19_1:Find("grade_bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_19_3[2])
end

function var_0_0.OnShow(arg_20_0, arg_20_1)
	arg_20_0:BlurPanel()

	arg_20_0.selectNum = arg_20_1.selectNum or 1
	arg_20_0.selectedIds = arg_20_1.selectedIds or {}
	arg_20_0.attrType = arg_20_1.attrType
	arg_20_0.confirmFunc = arg_20_1.confirmFunc
	arg_20_0.cancelFunc = arg_20_1.cancelFunc
	arg_20_0.placeId = arg_20_1.placeId
	arg_20_0.showBenefits = arg_20_1.showBenefits

	local var_20_0 = arg_20_1.emptyInfoTitle or ""

	setText(arg_20_0.infoEmptyTitleTF, var_20_0)

	arg_20_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	local var_20_1 = #arg_20_0.selectedIds == 0 and arg_20_0.selectNum == 1

	arg_20_0:FlushShips(var_20_1)
end

function var_0_0.OnInitShip(arg_21_0, arg_21_1)
	local var_21_0 = IslandSelectShipCard.New(arg_21_1)

	arg_21_0.cards[arg_21_1] = var_21_0
end

function var_0_0.OnUpdateShip(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.cards[arg_22_2]

	if not var_22_0 then
		arg_22_0:OnInitItem(arg_22_2)

		var_22_0 = arg_22_0.cards[arg_22_2]
	end

	local var_22_1 = arg_22_0.showShips[arg_22_1 + 1]
	local var_22_2 = arg_22_0.characterAgency:GetShipById(var_22_1)

	onButton(arg_22_0, var_22_0.go, function()
		if var_22_2:GetState() ~= IslandShip.STATE_NORMAL then
			return
		end

		if arg_22_0.showId == var_22_0.id then
			arg_22_0.showId = nil
		else
			arg_22_0.showId = var_22_0.id
		end

		if table.contains(arg_22_0.selectedIds, var_22_0.id) then
			table.removebyvalue(arg_22_0.selectedIds, var_22_0.id)
		elseif arg_22_0.selectNum == 1 then
			arg_22_0.selectedIds = {
				var_22_0.id
			}
		else
			if #arg_22_0.selectedIds >= arg_22_0.selectNum then
				return
			end

			table.insert(arg_22_0.selectedIds, var_22_0.id)
		end

		for iter_23_0, iter_23_1 in pairs(arg_22_0.cards) do
			iter_23_1:UpdateSelected(arg_22_0.selectedIds)
		end

		arg_22_0:FlushInfo()
	end, SFX_PANEL)
	var_22_0:Update(var_22_1, arg_22_0.attrType, arg_22_0.placeId, arg_22_0.selectedIds)
end

function var_0_0.FlushShips(arg_24_0, arg_24_1)
	arg_24_0.showShips = arg_24_0:GetShips()

	if #arg_24_0.showShips ~= 0 and arg_24_1 then
		local var_24_0 = arg_24_0:GetFristSelectableShipId()

		if var_24_0 then
			arg_24_0.showId = var_24_0

			table.insert(arg_24_0.selectedIds, var_24_0)
		end
	end

	arg_24_0.showId = arg_24_0.selectedIds[1]

	setActive(arg_24_0.shipContent, #arg_24_0.showShips ~= 0)
	setActive(arg_24_0.shipEmpty, #arg_24_0.showShips == 0)
	arg_24_0.shipRectCom:SetTotalCount(#arg_24_0.showShips)
	arg_24_0:FlushInfo()
end

function var_0_0.GetFristSelectableShipId(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.showShips) do
		if arg_25_0.characterAgency:GetShipById(iter_25_1):GetState() == IslandShip.STATE_NORMAL then
			return iter_25_1
		end
	end

	return nil
end

function var_0_0.UpdateTimer(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1 - arg_26_0.timeMgr:GetServerTime()

	setText(arg_26_0.energyTimeTextTf, arg_26_0.timeMgr:DescCDTime(var_26_0))
end

function var_0_0.StopTimer(arg_27_0)
	if arg_27_0.energyTimer ~= nil then
		arg_27_0.energyTimer:Stop()

		arg_27_0.energyTimer = nil
	end
end

function var_0_0.FlushInfo(arg_28_0)
	arg_28_0.selectedTextCom.text = #arg_28_0.selectedIds .. "/" .. arg_28_0.selectNum

	arg_28_0:FlushBenefits()
	setActive(arg_28_0.sureBtn, arg_28_0.showId)
	setActive(arg_28_0.infoPanel, arg_28_0.showId)
	setActive(arg_28_0.infoEmptyTF, not arg_28_0.showId)

	if not arg_28_0.showId then
		return
	end

	local var_28_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_28_0.showId)

	setText(arg_28_0.nameTF, var_28_0:GetName())
	setText(arg_28_0.levelTF, string.format("-Lv.%d", var_28_0:GetLevel()))
	arg_28_0:UpdateAttrs(var_28_0)

	local var_28_1 = IslandShip.StaticGetPrefab(var_28_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_28_1, "", arg_28_0.shipIconTF)

	local var_28_2 = var_28_0:GetCurrentEnergy()
	local var_28_3 = var_28_0:GetMaxEnergy()

	setText(arg_28_0:findTF("text", arg_28_0.energyTF), var_28_2 .. "/" .. var_28_3)
	setSlider(arg_28_0:findTF("energy_bar", arg_28_0.energyTF), 0, 1, var_28_2 / var_28_3)

	if var_28_2 ~= var_28_3 then
		setActive(arg_28_0.recoveryTimeTips, true)
		setActive(arg_28_0.energyTimeTextTf, true)

		local var_28_4 = var_28_0:GetEnergyMaxTime()

		arg_28_0:StopTimer()
		arg_28_0:UpdateTimer(var_28_4)

		arg_28_0.energyTimer = Timer.New(function()
			arg_28_0:UpdateTimer(var_28_4)
		end, 1, -1)

		arg_28_0.energyTimer:Start()
	else
		arg_28_0:StopTimer()
		setActive(arg_28_0.recoveryTimeTips, false)
		setActive(arg_28_0.energyTimeTextTf, false)
	end

	local var_28_5 = var_28_0:GetSkill()
	local var_28_6 = var_28_5:IsUnlock()

	setActive(arg_28_0.skill, var_28_6)
	setActive(arg_28_0.skillEmp, not var_28_6)
	setText(arg_28_0.skillEmpDes, i18n("island_need_star", var_28_0:GetSkillUnlockLevel()))

	local var_28_7 = var_28_5:IsEffectiveInPlace(arg_28_0.placeId)

	setActive(arg_28_0.skillInuse, var_28_7)
	setActive(arg_28_0.skillUnuse, not var_28_7)

	arg_28_0.skillName.text = string.format("%s - %s", var_28_5:GetName(), "[Lv." .. var_28_5:GetLevel() .. "]")
	arg_28_0.skillDes.text = var_28_5:GetEffectDesc()
end

function var_0_0.FlushBenefits(arg_30_0)
	setActive(arg_30_0.benefitsTF, arg_30_0.showBenefits)

	if arg_30_0.showBenefits then
		setFillAmount(arg_30_0.mainAttrBar, arg_30_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[1]))
		arg_30_0.subAttrUIList:align(#IslandShipAttr.ATTRS)
	end
end

function var_0_0.GetShipsAttrProgress(arg_31_0, arg_31_1)
	local var_31_0 = pg.island_chara_att.all[#pg.island_chara_att.all]
	local var_31_1 = var_31_0 * arg_31_0.selectNum
	local var_31_2 = 0

	for iter_31_0, iter_31_1 in ipairs(arg_31_0.selectedIds) do
		var_31_2 = var_31_2 + (var_31_0 - arg_31_0.characterAgency:GetShipById(iter_31_1):GetAttrGrade(arg_31_1) + 1)
	end

	return var_31_2 / var_31_1
end

function var_0_0.ToVShip(arg_32_0, arg_32_1)
	if not arg_32_0.vship then
		arg_32_0.vship = {}

		function arg_32_0.vship.getNation()
			return arg_32_0.vship.config.nationality
		end

		function arg_32_0.vship.getShipType()
			return arg_32_0.vship.config.type
		end

		function arg_32_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_32_0.vship.config.type)
		end

		function arg_32_0.vship.getRarity()
			return arg_32_0.vship.config.rarity
		end
	end

	arg_32_0.vship.config = arg_32_1

	return arg_32_0.vship
end

local function var_0_1(arg_37_0, arg_37_1)
	if not arg_37_1 or arg_37_1 == "" then
		return true
	end

	local var_37_0 = string.lower(string.gsub(arg_37_1, "%.", "%%."))
	local var_37_1 = IslandShip.StaticGetName(arg_37_0)

	return string.find(string.lower(var_37_1), var_37_0)
end

local function var_0_2(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_1
	local var_38_1 = ShipGroup.getDefaultShipConfig(var_38_0)
	local var_38_2 = arg_38_0:ToVShip(var_38_1)
	local var_38_3 = arg_38_0.characterAgency:GetShipById(arg_38_1)

	if ShipIndexConst.filterByCamp(var_38_2, arg_38_2.campIndex) and ShipIndexConst.filterByRarity(var_38_2, arg_38_2.rarityIndex) and IslandShipIndexLayer.filterByExtra(var_38_3, arg_38_2.extraIndex) then
		return true
	end

	return false
end

function var_0_0.GetShips(arg_39_0)
	local var_39_0 = {}
	local var_39_1 = arg_39_0.characterAgency:GetShipsContainNpc()

	for iter_39_0, iter_39_1 in ipairs(var_39_1) do
		if var_0_1(iter_39_1.id, arg_39_0.searchKey) and var_0_2(arg_39_0, iter_39_1.id, arg_39_0.sortData) then
			table.insert(var_39_0, iter_39_1.id)
		end
	end

	local var_39_2 = IslandShipIndexLayer.getSortFuncAndName(arg_39_0.sortData.sortIndex, arg_39_0.selectAsc)

	table.sort(var_39_0, CompareFuncs(var_39_2))

	return var_39_0
end

function var_0_0.OnDestroy(arg_40_0)
	ClearLScrollrect(arg_40_0.shipRectCom)
	arg_40_0:StopTimer()
end

function var_0_0.OnHide(arg_41_0)
	arg_41_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_42_0)
	arg_42_0:OnHide()
end

return var_0_0
