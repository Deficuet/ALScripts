local var_0_0 = class("IslandShipSelectPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipSelectUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("top/back")
	arg_2_0.title = arg_2_0._tf:Find("top/title/Text")

	setText(arg_2_0.title, i18n("island_select_ship"))

	arg_2_0.frameTF = arg_2_0._tf:Find("frame")
	arg_2_0.shipRectCom = arg_2_0.frameTF:Find("ships"):GetComponent("LScrollRect")

	setText(arg_2_0.frameTF:Find("selected/Text"), i18n("island_select_ship_label_1"))

	arg_2_0.selectedTextCom = arg_2_0.frameTF:Find("selected/num"):GetComponent("Text")
	arg_2_0.benefitsTF = arg_2_0._tf:Find("benefits")
	arg_2_0.benefitTipBtn = arg_2_0.benefitsTF:Find("tip/help")

	setText(arg_2_0.benefitsTF:Find("tip/Text"), i18n("island_select_ship_overview"))

	arg_2_0.mainAttrBar = arg_2_0.benefitsTF:Find("main/slider/bar")

	setText(arg_2_0.benefitsTF:Find("main/Text"), IslandShipAttr.ATTRS_CH[IslandShipAttr.MANAGE_KEY])

	arg_2_0.subAttrUIList = UIItemList.New(arg_2_0.benefitsTF:Find("subs"), arg_2_0.benefitsTF:Find("subs/tpl"))
	arg_2_0.infoEmptyTF = arg_2_0._tf:Find("info/empty")

	setText(arg_2_0.infoEmptyTF:Find("Image/Text"), i18n("island_select_ship"))

	arg_2_0.infoEmptyTitleTF = arg_2_0.infoEmptyTF:Find("name")
	arg_2_0.infoPanel = arg_2_0._tf:Find("info/content")
	arg_2_0.nameTF = arg_2_0.infoPanel:Find("name")
	arg_2_0.levelTF = arg_2_0.infoPanel:Find("name/level")
	arg_2_0.attrUIList = UIItemList.New(arg_2_0.infoPanel:Find("attrs"), arg_2_0.infoPanel:Find("attrs/tpl"))
	arg_2_0.skillTF = arg_2_0.infoPanel:Find("skill")
	arg_2_0.energyTFInfo = arg_2_0.infoPanel:Find("selectShipEnergyInfo")
	arg_2_0.energyTF = arg_2_0.energyTFInfo:Find("energy")
	arg_2_0.statusTF = arg_2_0.infoPanel:Find("status")
	arg_2_0.sureBtn = arg_2_0._tf:Find("sure")

	setText(arg_2_0.sureBtn:Find("Text"), i18n("island_shipselect_confirm"))

	arg_2_0.indexBtn = arg_2_0._tf:Find("frame/filter_panel/IndexIco")
	arg_2_0.orderBtn = arg_2_0._tf:Find("frame/filter_panel/index")
	arg_2_0.orderIco = arg_2_0._tf:Find("frame/filter_panel/index/content/icon/icon")
	arg_2_0.orderTxt = arg_2_0._tf:Find("frame/filter_panel/index/content/Text"):GetComponent(typeof(Text))
	arg_2_0.shipIconTF = arg_2_0.energyTFInfo:Find("icon_mask/icon")
	arg_2_0.energyTimeTextTf = arg_2_0.energyTFInfo:Find("time_Text")
	arg_2_0.recoveryTimeTips = arg_2_0.infoPanel:Find("selectShipEnergyInfo/recoveryTimeTips")
	arg_2_0.skill = arg_2_0.infoPanel:Find("skill")
	arg_2_0.skillEmp = arg_2_0.infoPanel:Find("skillEmp")
	arg_2_0.skillEmpDes = arg_2_0.skillEmp:Find("Text")
	arg_2_0.skillInuse = arg_2_0.skill:Find("skill_tab_bg/iconBright")
	arg_2_0.skillUnuse = arg_2_0.skill:Find("skill_tab_bg/iconDark")
	arg_2_0.skillName = arg_2_0.skill:Find("name"):GetComponent(typeof(Text))
	arg_2_0.skillDes = arg_2_0.skill:Find("desc/Text"):GetComponent(typeof(Text))
	arg_2_0.shipContent = arg_2_0.frameTF:Find("ships")
	arg_2_0.shipEmpty = arg_2_0.frameTF:Find("empShip")
	arg_2_0.addStutasTF = arg_2_0._tf:Find("addStutas")
	arg_2_0.addStutasNum = arg_2_0._tf:Find("addStutas/num")
	arg_2_0.addStutasBtn = arg_2_0._tf:Find("addStutas/num/tipbtn")
	arg_2_0.addStutasInfoPanel = arg_2_0._tf:Find("addinfo_panel")
	arg_2_0.buffInfoUIList = UIItemList.New(arg_2_0.addStutasInfoPanel:Find("effects"), arg_2_0.addStutasInfoPanel:Find("effects/tpl"))

	setText(arg_2_0.addStutasInfoPanel:Find("Text"), i18n("island_production_speed_tip2"))

	arg_2_0.buffInfoEmptyTF = arg_2_0.addStutasInfoPanel:Find("empty")

	setText(arg_2_0.buffInfoEmptyTF:Find("Text"), i18n("island_manage_no_addition"))
	arg_2_0.buffInfoUIList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = arg_2_0.buffInfos[arg_3_1 + 1]

			setText(arg_3_2:Find("bg/name"), var_3_0.name)
			setText(arg_3_2:Find("bg/effect"), var_3_0.effect)
		end
	end)
	setText(arg_2_0.shipEmpty:Find("Text"), i18n("island_production_selected_tip2"))
	setText(arg_2_0.recoveryTimeTips, i18n("island_ship_energy_recoverytips"))
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0:Hide()
		existCall(arg_4_0.cancelFunc)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.addStutasBtn, function()
		if isActive(arg_4_0.addStutasInfoPanel) then
			setActive(arg_4_0.addStutasInfoPanel, false)
		else
			setActive(arg_4_0.addStutasInfoPanel, true)
			arg_4_0.buffInfoUIList:align(#arg_4_0.buffInfos)
			setActive(arg_4_0.buffInfoEmptyTF, #arg_4_0.buffInfos == 0)
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.sureBtn, function()
		local var_7_0 = getProxy(IslandProxy):GetIsland():GetFollowerAgency()
		local var_7_1 = {}

		for iter_7_0, iter_7_1 in ipairs(arg_4_0.selectedIds) do
			if var_7_0:Following(iter_7_1) then
				table.insert(var_7_1, iter_7_1)
			end
		end

		if #var_7_1 > 0 then
			arg_4_0:ShowMsgBox({
				type = IslandMsgBox.TYPE_COMMON,
				content = i18n("island_cancel_follow_tip"),
				onYes = function()
					for iter_8_0, iter_8_1 in ipairs(var_7_1) do
						arg_4_0:emitCore(ISLAND_EVT.WILL_DEL_FOLLOWER, iter_8_1)
					end

					arg_4_0:Hide()
					existCall(arg_4_0.confirmFunc, arg_4_0.selectedIds)
				end,
				onNo = function()
					return
				end
			})

			return
		end

		arg_4_0:Hide()
		existCall(arg_4_0.confirmFunc, arg_4_0.selectedIds)
	end, SFX_PANEL)
	onToggle(arg_4_0, arg_4_0.indexBtn, function(arg_10_0)
		if arg_10_0 then
			arg_4_0:emit(IslandMediator.OPEN_SHIP_INDEX, {
				OnFilter = function(arg_11_0)
					arg_4_0:OnFilter(arg_11_0)
				end,
				defaultIndex = arg_4_0.sortData,
				needWorkSpeed = arg_4_0.needWorkSpeed
			})
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.orderBtn, function()
		arg_4_0.selectAsc = not arg_4_0.selectAsc

		arg_4_0:UpdateSortBtn()
		arg_4_0:FlushShips()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.benefitTipBtn, function()
		arg_4_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_manage_help_tip")
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_commission.tip
		})
	end, SFX_PANEL)
	arg_4_0.subAttrUIList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventInit then
			local var_15_0 = IslandShipAttr.ATTRS[arg_15_1 + 1]

			arg_15_2.name = var_15_0

			setText(arg_15_2:Find("Text"), IslandShipAttr.ToChinese(var_15_0))
		elseif arg_15_0 == UIItemList.EventUpdate then
			setFillAmount(arg_15_2:Find("slider/bar"), arg_4_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[arg_15_1 + 1]))
		end
	end)

	function arg_4_0.shipRectCom.onInitItem(arg_16_0)
		arg_4_0:OnInitShip(arg_16_0)
	end

	function arg_4_0.shipRectCom.onUpdateItem(arg_17_0, arg_17_1)
		arg_4_0:OnUpdateShip(arg_17_0, arg_17_1)
	end

	arg_4_0.cards = {}
	arg_4_0.selectAsc = true
	arg_4_0.sortData = {
		sortIndex = IslandShipIndexLayer.SortLevel,
		campIndex = ShipIndexConst.CampAll,
		rarityIndex = ShipIndexConst.RarityAll,
		extraIndex = IslandShipIndexLayer.ExtraALL
	}

	arg_4_0:UpdateSortBtn()

	arg_4_0.timeMgr = pg.TimeMgr.GetInstance()
end

function var_0_0.OnFilter(arg_18_0, arg_18_1)
	arg_18_0.sortData = arg_18_1

	arg_18_0:UpdateSortBtn()
	arg_18_0:FlushShips()
end

function var_0_0.UpdateSortBtn(arg_19_0)
	arg_19_0.orderIco.localScale = arg_19_0.selectAsc and Vector3(1, 1, 1) or Vector3(1, -1, 1)

	local var_19_0, var_19_1 = IslandShipIndexLayer.getSortFuncAndName(arg_19_0.sortData.sortIndex, arg_19_0.selectAsc)

	arg_19_0.orderTxt.text = i18n(var_19_1)
end

function var_0_0.UpdateAttrs(arg_20_0, arg_20_1)
	local var_20_0 = IslandShipAttr.ATTRS

	arg_20_0.attrUIList:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = arg_21_1 + 1

			arg_20_0:UpdateAttr(arg_21_2, var_20_0, var_21_0, arg_20_1)
		end
	end)
	arg_20_0.attrUIList:align(#var_20_0)
end

function var_0_0.UpdateAttr(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	local var_22_0 = arg_22_2[arg_22_3]
	local var_22_1 = arg_22_4:GetAttr(var_22_0)

	setText(arg_22_1:Find("name"), IslandShipAttr.ToChinese(var_22_0))

	local var_22_2 = IslandProductTimeHelper.GetAttributeAddPercentByAttribute(arg_22_4.id, arg_22_3)
	local var_22_3
	local var_22_4 = var_22_2 > 0 and "#00B91E" or var_22_2 < 0 and "#FF6767" or "#393A3C"

	setTextColor(arg_22_1:Find("value"), Color.NewHex(var_22_4))

	local var_22_5 = var_22_2 ~= 0 and math.floor(var_22_1 * (1 + 0.01 * var_22_2)) or var_22_1

	setText(arg_22_1:Find("value"), var_22_5)

	if var_22_2 ~= 0 then
		local var_22_6 = arg_22_4:GetDisplayStatus()
		local var_22_7 = _.select(var_22_6, function(arg_23_0)
			return arg_23_0:GetBuffType() == IslandBuffType.SHIP_ATTR
		end)

		onButton(arg_22_0, arg_22_1, function()
			arg_22_0:ShowMsgBox({
				hideNo = true,
				type = IslandMsgBox.TYPE_SHIP_OWN_STATUS,
				title = i18n("island_word_ship_buff_desc"),
				statusList = var_22_7
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_22_1)
	end

	local var_22_8 = arg_22_4:GetAttrGradeByValue(var_22_5)
	local var_22_9 = IslandShipAttr.Grade2Img(var_22_8)

	arg_22_1:Find("grade"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_22_9[1])
	arg_22_1:Find("grade_bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_22_9[2])

	setActive(arg_22_1:Find("vx_tpl"), arg_22_0.attrType == arg_22_3)
end

function var_0_0.OnShow(arg_25_0, arg_25_1)
	arg_25_0:BlurPanel()

	arg_25_0.selectNum = arg_25_1.selectNum or 1
	arg_25_0.selectedIds = arg_25_1.selectedIds or {}
	arg_25_0.attrType = arg_25_1.attrType
	arg_25_0.confirmFunc = arg_25_1.confirmFunc
	arg_25_0.cancelFunc = arg_25_1.cancelFunc
	arg_25_0.placeId = arg_25_1.placeId
	arg_25_0.showBenefits = arg_25_1.showBenefits
	arg_25_0.needWorkSpeed = arg_25_1.needWorkSpeed or false

	local var_25_0 = arg_25_1.emptyInfoTitle or ""

	setText(arg_25_0.infoEmptyTitleTF, var_25_0)

	arg_25_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	if arg_25_0.needWorkSpeed then
		arg_25_0.sortData.sortIndex = IslandShipIndexLayer.SortWorkSpeed
	else
		arg_25_0.sortData.sortIndex = IslandShipIndexLayer.SortLevel
	end

	arg_25_0:UpdateSortBtn()

	local var_25_1 = #arg_25_0.selectedIds == 0 and arg_25_0.selectNum == 1

	arg_25_0:FlushShips(var_25_1)
end

function var_0_0.OnInitShip(arg_26_0, arg_26_1)
	local var_26_0 = IslandSelectShipCard.New(arg_26_1)

	arg_26_0.cards[arg_26_1] = var_26_0
end

function var_0_0.OnUpdateShip(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_0.cards[arg_27_2]

	if not var_27_0 then
		arg_27_0:OnInitItem(arg_27_2)

		var_27_0 = arg_27_0.cards[arg_27_2]
	end

	local var_27_1 = arg_27_0.showShips[arg_27_1 + 1]
	local var_27_2 = arg_27_0.characterAgency:GetShipById(var_27_1)

	onButton(arg_27_0, var_27_0.go, function()
		if var_27_2:GetState() ~= IslandShip.STATE_NORMAL then
			return
		end

		if arg_27_0.showId == var_27_0.id then
			arg_27_0.showId = nil
		else
			arg_27_0.showId = var_27_0.id
		end

		if table.contains(arg_27_0.selectedIds, var_27_0.id) then
			table.removebyvalue(arg_27_0.selectedIds, var_27_0.id)
		elseif arg_27_0.selectNum == 1 then
			arg_27_0.selectedIds = {
				var_27_0.id
			}
		else
			if #arg_27_0.selectedIds >= arg_27_0.selectNum then
				return
			end

			table.insert(arg_27_0.selectedIds, var_27_0.id)
		end

		for iter_28_0, iter_28_1 in pairs(arg_27_0.cards) do
			iter_28_1:UpdateSelected(arg_27_0.selectedIds)
		end

		arg_27_0:FlushInfo()
	end, SFX_PANEL)
	var_27_0:Update(var_27_1, arg_27_0.attrType, arg_27_0.placeId, arg_27_0.selectedIds)
end

function var_0_0.FlushShips(arg_29_0, arg_29_1)
	arg_29_0.showShips = arg_29_0:GetShips()

	if #arg_29_0.showShips ~= 0 and arg_29_1 then
		local var_29_0 = arg_29_0:GetFristSelectableShipId()

		if var_29_0 then
			arg_29_0.showId = var_29_0

			table.insert(arg_29_0.selectedIds, var_29_0)
		end
	end

	arg_29_0.showId = arg_29_0.selectedIds[1]

	setActive(arg_29_0.shipContent, #arg_29_0.showShips ~= 0)
	setActive(arg_29_0.shipEmpty, #arg_29_0.showShips == 0)
	arg_29_0.shipRectCom:SetTotalCount(#arg_29_0.showShips)
	arg_29_0:FlushInfo()
end

function var_0_0.GetFristSelectableShipId(arg_30_0)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0.showShips) do
		if arg_30_0.characterAgency:GetShipById(iter_30_1):GetState() == IslandShip.STATE_NORMAL then
			return iter_30_1
		end
	end

	return nilGetShipsAttrProgress
end

function var_0_0.UpdateTimer(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1 - arg_31_0.timeMgr:GetServerTime()

	setText(arg_31_0.energyTimeTextTf, arg_31_0.timeMgr:DescCDTime(var_31_0))
end

function var_0_0.StopTimer(arg_32_0)
	if arg_32_0.energyTimer ~= nil then
		arg_32_0.energyTimer:Stop()

		arg_32_0.energyTimer = nil
	end
end

function var_0_0.FlushInfo(arg_33_0)
	arg_33_0.selectedTextCom.text = #arg_33_0.selectedIds .. "/" .. arg_33_0.selectNum

	arg_33_0:FlushBenefits()
	setActive(arg_33_0.sureBtn, arg_33_0.showId)
	setActive(arg_33_0.infoPanel, arg_33_0.showId)
	setActive(arg_33_0.infoEmptyTF, not arg_33_0.showId)
	arg_33_0:FlushAddPercent()

	if not arg_33_0.showId then
		return
	end

	local var_33_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_33_0.showId)

	setText(arg_33_0.nameTF, var_33_0:GetName())
	setText(arg_33_0.levelTF, string.format("-Lv.%d", var_33_0:GetLevel()))
	arg_33_0:UpdateAttrs(var_33_0)

	local var_33_1 = IslandShip.StaticGetPrefab(var_33_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_33_1, "", arg_33_0.shipIconTF)

	local var_33_2 = var_33_0:GetCurrentEnergy()
	local var_33_3 = var_33_0:GetMaxEnergy()

	setText(arg_33_0.energyTF:Find("text"), var_33_2 .. "/" .. var_33_3)
	setSlider(arg_33_0.energyTF:Find("energy_bar"), 0, 1, var_33_2 / var_33_3)

	if var_33_2 ~= var_33_3 then
		setActive(arg_33_0.recoveryTimeTips, true)
		setActive(arg_33_0.energyTimeTextTf, true)

		local var_33_4 = var_33_0:GetEnergyMaxTime()

		arg_33_0:StopTimer()
		arg_33_0:UpdateTimer(var_33_4)

		arg_33_0.energyTimer = Timer.New(function()
			arg_33_0:UpdateTimer(var_33_4)
		end, 1, -1)

		arg_33_0.energyTimer:Start()
	else
		arg_33_0:StopTimer()
		setActive(arg_33_0.recoveryTimeTips, false)
		setActive(arg_33_0.energyTimeTextTf, false)
	end

	local var_33_5 = var_33_0:GetSkill()
	local var_33_6 = var_33_5:IsUnlock()

	setActive(arg_33_0.skill, var_33_6)
	setActive(arg_33_0.skillEmp, not var_33_6)
	setText(arg_33_0.skillEmpDes, i18n("island_need_star", var_33_0:GetSkillUnlockLevel()))

	local var_33_7 = var_33_5:IsEffectiveInPlace(arg_33_0.placeId)

	setActive(arg_33_0.skillInuse, var_33_7)
	setActive(arg_33_0.skillUnuse, not var_33_7)

	arg_33_0.skillName.text = string.format("%s - %s", var_33_5:GetName(), "[Lv." .. var_33_5:GetLevel() .. "]")
	arg_33_0.skillDes.text = var_33_5:GetEffectDesc()

	arg_33_0:FlushAddPercent()
end

function var_0_0.FlushAddPercent(arg_35_0)
	if not arg_35_0.showId or not arg_35_0.needWorkSpeed then
		setActive(arg_35_0.addStutasTF, false)
		setActive(arg_35_0.addStutasInfoPanel, false)

		return
	end

	local var_35_0, var_35_1, var_35_2, var_35_3 = IslandProductTimeHelper.GetAllAddPercent(arg_35_0.showId, arg_35_0.placeId, arg_35_0.attrType)
	local var_35_4 = var_35_0 + var_35_1 + var_35_2 + var_35_3

	setActive(arg_35_0.addStutasTF, true)
	setText(arg_35_0.addStutasNum, i18n("island_production_speed_tip1", var_35_4))

	arg_35_0.buffInfos = {}

	local var_35_5 = IslandProductTimeHelper.GetAttributeAddPercent(arg_35_0.showId, arg_35_0.attrType)

	if var_35_0 > 0 then
		local var_35_6 = IslandShipAttr.GetAtrrName(arg_35_0.attrType)

		table.insert(arg_35_0.buffInfos, {
			name = i18n("island_production_speed_addition1", IslandShipAttr.ToChinese(var_35_6)),
			effect = "+" .. var_35_0 .. "%"
		})
	end

	if var_35_1 > 0 then
		table.insert(arg_35_0.buffInfos, {
			name = i18n("island_production_speed_addition2"),
			effect = "+" .. var_35_1 .. "%"
		})
	end

	if var_35_2 > 0 then
		local var_35_7 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_35_0.showId):GetSkill():GetName()

		table.insert(arg_35_0.buffInfos, {
			name = var_35_7,
			effect = "+" .. var_35_2 .. "%"
		})
	end

	if var_35_3 > 0 then
		table.insert(arg_35_0.buffInfos, {
			name = i18n("island_production_speed_addition3"),
			effect = "+" .. var_35_3 .. "%"
		})
	end

	arg_35_0.buffInfoUIList:align(#arg_35_0.buffInfos)
	setActive(arg_35_0.buffInfoEmptyTF, #arg_35_0.buffInfos == 0)
end

function var_0_0.FlushBenefits(arg_36_0)
	setActive(arg_36_0.benefitsTF, arg_36_0.showBenefits)

	if arg_36_0.showBenefits then
		setFillAmount(arg_36_0.mainAttrBar, arg_36_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[1]))
		arg_36_0.subAttrUIList:align(#IslandShipAttr.ATTRS)
	end
end

function var_0_0.GetShipsAttrProgress(arg_37_0, arg_37_1)
	local var_37_0 = pg.island_chara_att.all[#pg.island_chara_att.all]
	local var_37_1 = var_37_0 * arg_37_0.selectNum
	local var_37_2 = 0

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.selectedIds) do
		var_37_2 = var_37_2 + (var_37_0 - arg_37_0.characterAgency:GetShipById(iter_37_1):GetAttrGrade(arg_37_1) + 1)
	end

	return var_37_2 / var_37_1
end

function var_0_0.ToVShip(arg_38_0, arg_38_1)
	if not arg_38_0.vship then
		arg_38_0.vship = {}

		function arg_38_0.vship.getNation()
			return arg_38_0.vship.config.nationality
		end

		function arg_38_0.vship.getShipType()
			return arg_38_0.vship.config.type
		end

		function arg_38_0.vship.getTeamType()
			return ShipType.GetTeamFromShipType(arg_38_0.vship.config.type)
		end

		function arg_38_0.vship.getRarity()
			return arg_38_0.vship.config.rarity
		end
	end

	arg_38_0.vship.config = arg_38_1

	return arg_38_0.vship
end

local function var_0_1(arg_43_0, arg_43_1)
	if not arg_43_1 or arg_43_1 == "" then
		return true
	end

	local var_43_0 = string.lower(string.gsub(arg_43_1, "%.", "%%."))
	local var_43_1 = IslandShip.StaticGetName(arg_43_0)

	return string.find(string.lower(var_43_1), var_43_0)
end

local function var_0_2(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_1
	local var_44_1 = ShipGroup.getDefaultShipConfig(var_44_0)
	local var_44_2 = arg_44_0:ToVShip(var_44_1)
	local var_44_3 = arg_44_0.characterAgency:GetShipById(arg_44_1)

	if ShipIndexConst.filterByCamp(var_44_2, arg_44_2.campIndex) and ShipIndexConst.filterByRarity(var_44_2, arg_44_2.rarityIndex) and IslandShipIndexLayer.filterByExtra(var_44_3, arg_44_2.extraIndex) then
		return true
	end

	return false
end

function var_0_0.GetShips(arg_45_0)
	local var_45_0 = {}
	local var_45_1 = {}
	local var_45_2 = arg_45_0.characterAgency:GetShipsContainNpc()

	for iter_45_0, iter_45_1 in ipairs(var_45_2) do
		if var_0_1(iter_45_1.id, arg_45_0.searchKey) and var_0_2(arg_45_0, iter_45_1.id, arg_45_0.sortData) then
			if arg_45_0.needWorkSpeed then
				local var_45_3 = setmetatable({
					GetWorkSpeed = function()
						local var_46_0, var_46_1, var_46_2, var_46_3 = IslandProductTimeHelper.GetAllAddPercent(iter_45_1.id, arg_45_0.placeId, arg_45_0.attrType)

						return var_46_0 + var_46_1 + var_46_2 + var_46_3
					end
				}, {
					__index = iter_45_1
				})

				table.insert(var_45_1, var_45_3)
			else
				table.insert(var_45_1, iter_45_1)
			end
		end
	end

	local var_45_4 = IslandShipIndexLayer.getSortFuncAndName(arg_45_0.sortData.sortIndex, arg_45_0.selectAsc)

	table.sort(var_45_1, CompareFuncs(var_45_4))

	for iter_45_2, iter_45_3 in ipairs(var_45_1) do
		table.insert(var_45_0, iter_45_3.id)
	end

	return var_45_0
end

function var_0_0.OnDestroy(arg_47_0)
	ClearLScrollrect(arg_47_0.shipRectCom)
	arg_47_0:StopTimer()
	arg_47_0:OnHide()
end

function var_0_0.OnHide(arg_48_0)
	if isActive(arg_48_0.addStutasInfoPanel) then
		setActive(arg_48_0.addStutasInfoPanel, false)
	end

	arg_48_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_49_0)
	arg_49_0:OnHide()
end

return var_0_0
