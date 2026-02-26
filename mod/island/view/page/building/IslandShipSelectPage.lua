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
	arg_2_0.energyStutasTF = arg_2_0._tf:Find("energyStutas")
	arg_2_0.energyStutasTFNum = arg_2_0._tf:Find("energyStutas/num")
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
	arg_25_0.autoCollectionSelectShip = arg_25_1.autoCollectionSelectShip

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

function var_0_0.CheckHasSelected(arg_26_0, arg_26_1)
	if not arg_26_0.autoCollectionSelectShip then
		return false
	end

	local var_26_0 = false

	for iter_26_0, iter_26_1 in pairs(arg_26_0.autoCollectionSelectShip) do
		if arg_26_1 == iter_26_1 then
			var_26_0 = true
		end
	end

	return var_26_0
end

function var_0_0.OnInitShip(arg_27_0, arg_27_1)
	local var_27_0 = IslandSelectShipCard.New(arg_27_1)

	arg_27_0.cards[arg_27_1] = var_27_0
end

function var_0_0.OnUpdateShip(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.cards[arg_28_2]

	if not var_28_0 then
		arg_28_0:OnInitItem(arg_28_2)

		var_28_0 = arg_28_0.cards[arg_28_2]
	end

	local var_28_1 = arg_28_0.showShips[arg_28_1 + 1]
	local var_28_2 = arg_28_0.characterAgency:GetShipById(var_28_1)

	onButton(arg_28_0, var_28_0.go, function()
		if not var_28_2:IsDelegable() or arg_28_0:CheckHasSelected(var_28_1) then
			return
		end

		if arg_28_0.showId == var_28_0.id then
			arg_28_0.showId = nil
		else
			arg_28_0.showId = var_28_0.id
		end

		if table.contains(arg_28_0.selectedIds, var_28_0.id) then
			table.removebyvalue(arg_28_0.selectedIds, var_28_0.id)
		elseif arg_28_0.selectNum == 1 then
			arg_28_0.selectedIds = {
				var_28_0.id
			}
		else
			if #arg_28_0.selectedIds >= arg_28_0.selectNum then
				return
			end

			table.insert(arg_28_0.selectedIds, var_28_0.id)
		end

		for iter_29_0, iter_29_1 in pairs(arg_28_0.cards) do
			iter_29_1:UpdateSelected(arg_28_0.selectedIds)
		end

		arg_28_0:FlushInfo()
	end, SFX_PANEL)
	var_28_0:Update(var_28_1, arg_28_0.attrType, arg_28_0.placeId, arg_28_0.selectedIds, arg_28_0.autoCollectionSelectShip)
end

function var_0_0.FlushShips(arg_30_0, arg_30_1)
	arg_30_0.showShips = arg_30_0:GetShips()

	if #arg_30_0.showShips ~= 0 and arg_30_1 then
		local var_30_0 = arg_30_0:GetFristSelectableShipId()

		if var_30_0 then
			arg_30_0.showId = var_30_0

			table.insert(arg_30_0.selectedIds, var_30_0)
		end
	end

	arg_30_0.showId = arg_30_0.selectedIds[1]

	setActive(arg_30_0.shipContent, #arg_30_0.showShips ~= 0)
	setActive(arg_30_0.shipEmpty, #arg_30_0.showShips == 0)
	arg_30_0.shipRectCom:SetTotalCount(#arg_30_0.showShips)
	arg_30_0:FlushInfo()
end

function var_0_0.GetFristSelectableShipId(arg_31_0)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0.showShips) do
		if arg_31_0.characterAgency:GetShipById(iter_31_1):GetState() == IslandShip.STATE_NORMAL and not arg_31_0:CheckHasSelected(iter_31_1) then
			return iter_31_1
		end
	end

	return nilGetShipsAttrProgress
end

function var_0_0.UpdateTimer(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1 - arg_32_0.timeMgr:GetServerTime()

	setText(arg_32_0.energyTimeTextTf, arg_32_0.timeMgr:DescCDTime(var_32_0))
end

function var_0_0.StopTimer(arg_33_0)
	if arg_33_0.energyTimer ~= nil then
		arg_33_0.energyTimer:Stop()

		arg_33_0.energyTimer = nil
	end
end

function var_0_0.FlushInfo(arg_34_0)
	arg_34_0.selectedTextCom.text = #arg_34_0.selectedIds .. "/" .. arg_34_0.selectNum

	arg_34_0:FlushBenefits()
	setActive(arg_34_0.sureBtn, arg_34_0.showId)
	setActive(arg_34_0.infoPanel, arg_34_0.showId)
	setActive(arg_34_0.infoEmptyTF, not arg_34_0.showId)
	arg_34_0:FlushAddPercent()
	arg_34_0:FlushEnergyPercent()

	if not arg_34_0.showId then
		return
	end

	local var_34_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_34_0.showId)

	setText(arg_34_0.nameTF, var_34_0:GetName())
	setText(arg_34_0.levelTF, string.format("-Lv.%d", var_34_0:GetLevel()))
	arg_34_0:UpdateAttrs(var_34_0)

	local var_34_1 = IslandShip.StaticGetPrefab(var_34_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_34_1, "", arg_34_0.shipIconTF)

	local var_34_2 = var_34_0:GetCurrentEnergy()
	local var_34_3 = var_34_0:GetMaxEnergy()

	setText(arg_34_0.energyTF:Find("text"), var_34_2 .. "/" .. var_34_3)
	setSlider(arg_34_0.energyTF:Find("energy_bar"), 0, 1, var_34_2 / var_34_3)

	if var_34_2 ~= var_34_3 then
		setActive(arg_34_0.recoveryTimeTips, true)
		setActive(arg_34_0.energyTimeTextTf, true)

		local var_34_4 = var_34_0:GetEnergyMaxTime()

		arg_34_0:StopTimer()
		arg_34_0:UpdateTimer(var_34_4)

		arg_34_0.energyTimer = Timer.New(function()
			arg_34_0:UpdateTimer(var_34_4)
		end, 1, -1)

		arg_34_0.energyTimer:Start()
	else
		arg_34_0:StopTimer()
		setActive(arg_34_0.recoveryTimeTips, false)
		setActive(arg_34_0.energyTimeTextTf, false)
	end

	local var_34_5 = var_34_0:GetSkill()
	local var_34_6 = var_34_5:IsUnlock()

	setActive(arg_34_0.skill, var_34_6)
	setActive(arg_34_0.skillEmp, not var_34_6)
	setText(arg_34_0.skillEmpDes, i18n("island_need_star", var_34_0:GetSkillUnlockLevel()))

	local var_34_7 = var_34_5:IsEffectiveInPlace(arg_34_0.placeId)

	setActive(arg_34_0.skillInuse, var_34_7)
	setActive(arg_34_0.skillUnuse, not var_34_7)

	arg_34_0.skillName.text = string.format("%s - %s", var_34_5:GetName(), "[Lv." .. var_34_5:GetLevel() .. "]")
	arg_34_0.skillDes.text = var_34_5:GetEffectDesc()

	arg_34_0:FlushAddPercent()
	arg_34_0:FlushEnergyPercent()
end

function var_0_0.FlushEnergyPercent(arg_36_0)
	if not arg_36_0.showId or not arg_36_0.autoCollectionSelectShip then
		setActive(arg_36_0.energyStutasTF, false)

		return
	end

	setActive(arg_36_0.energyStutasTF, true)

	local var_36_0 = IslandAutoCollectHelper.GetAttributeReducePercent(arg_36_0.showId)
	local var_36_1 = string.format("<color=#39bfff> -%d%%</color>", var_36_0)
	local var_36_2 = i18n("island_chara_gather_skill_effect") .. var_36_1

	setText(arg_36_0.energyStutasTFNum, var_36_2)
end

function var_0_0.FlushAddPercent(arg_37_0)
	if not arg_37_0.showId or not arg_37_0.needWorkSpeed then
		setActive(arg_37_0.addStutasTF, false)
		setActive(arg_37_0.addStutasInfoPanel, false)

		return
	end

	local var_37_0, var_37_1, var_37_2, var_37_3 = IslandProductTimeHelper.GetAllAddPercent(arg_37_0.showId, arg_37_0.placeId, arg_37_0.attrType)
	local var_37_4 = var_37_0 + var_37_1 + var_37_2 + var_37_3

	setActive(arg_37_0.addStutasTF, true)
	setText(arg_37_0.addStutasNum, i18n("island_production_speed_tip1", var_37_4))

	arg_37_0.buffInfos = {}

	local var_37_5 = IslandProductTimeHelper.GetAttributeAddPercent(arg_37_0.showId, arg_37_0.attrType)

	if var_37_0 > 0 then
		local var_37_6 = IslandShipAttr.GetAtrrName(arg_37_0.attrType)

		table.insert(arg_37_0.buffInfos, {
			name = i18n("island_production_speed_addition1", IslandShipAttr.ToChinese(var_37_6)),
			effect = "+" .. var_37_0 .. "%"
		})
	end

	if var_37_1 > 0 then
		table.insert(arg_37_0.buffInfos, {
			name = i18n("island_production_speed_addition2"),
			effect = "+" .. var_37_1 .. "%"
		})
	end

	if var_37_2 > 0 then
		local var_37_7 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_37_0.showId):GetSkill():GetName()

		table.insert(arg_37_0.buffInfos, {
			name = var_37_7,
			effect = "+" .. var_37_2 .. "%"
		})
	end

	if var_37_3 > 0 then
		table.insert(arg_37_0.buffInfos, {
			name = i18n("island_production_speed_addition3"),
			effect = "+" .. var_37_3 .. "%"
		})
	end

	arg_37_0.buffInfoUIList:align(#arg_37_0.buffInfos)
	setActive(arg_37_0.buffInfoEmptyTF, #arg_37_0.buffInfos == 0)
end

function var_0_0.FlushBenefits(arg_38_0)
	setActive(arg_38_0.benefitsTF, arg_38_0.showBenefits)

	if arg_38_0.showBenefits then
		setFillAmount(arg_38_0.mainAttrBar, arg_38_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[1]))
		arg_38_0.subAttrUIList:align(#IslandShipAttr.ATTRS)
	end
end

function var_0_0.GetShipsAttrProgress(arg_39_0, arg_39_1)
	local var_39_0 = pg.island_chara_att.all[#pg.island_chara_att.all]
	local var_39_1 = var_39_0 * arg_39_0.selectNum
	local var_39_2 = 0

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.selectedIds) do
		var_39_2 = var_39_2 + (var_39_0 - arg_39_0.characterAgency:GetShipById(iter_39_1):GetAttrGrade(arg_39_1) + 1)
	end

	return var_39_2 / var_39_1
end

function var_0_0.ToVShip(arg_40_0, arg_40_1)
	if not arg_40_0.vship then
		arg_40_0.vship = {}

		function arg_40_0.vship.getNation()
			return arg_40_0.vship.config.nationality
		end

		function arg_40_0.vship.getShipType()
			return arg_40_0.vship.config.type
		end

		function arg_40_0.vship.getTeamType()
			return ShipType.GetTeamFromShipType(arg_40_0.vship.config.type)
		end

		function arg_40_0.vship.getRarity()
			return arg_40_0.vship.config.rarity
		end
	end

	arg_40_0.vship.config = arg_40_1

	return arg_40_0.vship
end

local function var_0_1(arg_45_0, arg_45_1)
	if not arg_45_1 or arg_45_1 == "" then
		return true
	end

	local var_45_0 = string.lower(string.gsub(arg_45_1, "%.", "%%."))
	local var_45_1 = IslandShip.StaticGetName(arg_45_0)

	return string.find(string.lower(var_45_1), var_45_0)
end

local function var_0_2(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_1
	local var_46_1 = ShipGroup.getDefaultShipConfig(var_46_0)
	local var_46_2 = arg_46_0:ToVShip(var_46_1)
	local var_46_3 = arg_46_0.characterAgency:GetShipById(arg_46_1)

	if ShipIndexConst.filterByCamp(var_46_2, arg_46_2.campIndex) and ShipIndexConst.filterByRarity(var_46_2, arg_46_2.rarityIndex) and IslandShipIndexLayer.filterByExtra(var_46_3, arg_46_2.extraIndex) then
		return true
	end

	return false
end

function var_0_0.GetShips(arg_47_0)
	local var_47_0 = {}
	local var_47_1 = {}
	local var_47_2 = arg_47_0.characterAgency:GetShipsContainNpc()

	for iter_47_0, iter_47_1 in ipairs(var_47_2) do
		if var_0_1(iter_47_1.id, arg_47_0.searchKey) and var_0_2(arg_47_0, iter_47_1.id, arg_47_0.sortData) then
			if arg_47_0.needWorkSpeed then
				local var_47_3 = setmetatable({
					GetWorkSpeed = function()
						local var_48_0, var_48_1, var_48_2, var_48_3 = IslandProductTimeHelper.GetAllAddPercent(iter_47_1.id, arg_47_0.placeId, arg_47_0.attrType)

						return var_48_0 + var_48_1 + var_48_2 + var_48_3
					end
				}, {
					__index = iter_47_1
				})

				table.insert(var_47_1, var_47_3)
			elseif arg_47_0.autoCollectionSelectShip then
				if iter_47_1.id ~= 1 then
					table.insert(var_47_1, iter_47_1)
				end
			else
				table.insert(var_47_1, iter_47_1)
			end
		end
	end

	local var_47_4 = IslandShipIndexLayer.getSortFuncAndName(arg_47_0.sortData.sortIndex, arg_47_0.selectAsc)

	table.sort(var_47_1, CompareFuncs(var_47_4))

	for iter_47_2, iter_47_3 in ipairs(var_47_1) do
		table.insert(var_47_0, iter_47_3.id)
	end

	return var_47_0
end

function var_0_0.OnDestroy(arg_49_0)
	ClearLScrollrect(arg_49_0.shipRectCom)
	arg_49_0:StopTimer()
	arg_49_0:OnHide()
end

function var_0_0.OnHide(arg_50_0)
	if isActive(arg_50_0.addStutasInfoPanel) then
		setActive(arg_50_0.addStutasInfoPanel, false)
	end

	arg_50_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_51_0)
	arg_51_0:OnHide()
end

return var_0_0
