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

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddListener(GAME.ISLAND_FOLLOWER_OP_DONE, arg_4_0.OnFollowerOp)
end

function var_0_0.RemoveListeners(arg_5_0)
	arg_5_0:RemoveListener(GAME.ISLAND_FOLLOWER_OP_DONE, arg_5_0.OnFollowerOp)
end

function var_0_0.OnFollowerOp(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.cards) do
		if iter_6_1.id == arg_6_1 then
			iter_6_1:UpdateFollowMask()
		end
	end
end

function var_0_0.OnInit(arg_7_0)
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:Hide()
		existCall(arg_7_0.cancelFunc)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.addStutasBtn, function()
		if isActive(arg_7_0.addStutasInfoPanel) then
			setActive(arg_7_0.addStutasInfoPanel, false)
		else
			setActive(arg_7_0.addStutasInfoPanel, true)
			arg_7_0.buffInfoUIList:align(#arg_7_0.buffInfos)
			setActive(arg_7_0.buffInfoEmptyTF, #arg_7_0.buffInfos == 0)
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.sureBtn, function()
		local var_10_0 = getProxy(IslandProxy):GetIsland():GetFollowerAgency()
		local var_10_1 = {}

		for iter_10_0, iter_10_1 in ipairs(arg_7_0.selectedIds) do
			if var_10_0:Following(iter_10_1) then
				table.insert(var_10_1, iter_10_1)
			end
		end

		if #var_10_1 > 0 then
			arg_7_0:ShowMsgBox({
				type = IslandMsgBox.TYPE_COMMON,
				content = i18n("island_cancel_follow_tip"),
				onYes = function()
					local var_11_0 = {}

					for iter_11_0, iter_11_1 in ipairs(var_10_1) do
						table.insert(var_11_0, function(arg_12_0)
							arg_7_0:emit(IslandMediator.DEL_FOLLOWER, iter_11_1, arg_12_0)
						end)
					end

					seriesAsync(var_11_0, function()
						arg_7_0:Hide()
						existCall(arg_7_0.confirmFunc, arg_7_0.selectedIds)
					end)
				end
			})

			return
		end

		arg_7_0:Hide()
		existCall(arg_7_0.confirmFunc, arg_7_0.selectedIds)
	end, SFX_PANEL)
	onToggle(arg_7_0, arg_7_0.indexBtn, function(arg_14_0)
		if arg_14_0 then
			arg_7_0:emit(IslandMediator.OPEN_SHIP_INDEX, {
				OnFilter = function(arg_15_0)
					arg_7_0:OnFilter(arg_15_0)
				end,
				defaultIndex = arg_7_0.sortData,
				needWorkSpeed = arg_7_0.needWorkSpeed
			})
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.orderBtn, function()
		arg_7_0.selectAsc = not arg_7_0.selectAsc

		arg_7_0:UpdateSortBtn()
		arg_7_0:FlushShips()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.benefitTipBtn, function()
		arg_7_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_manage_help_tip")
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_commission.tip
		})
	end, SFX_PANEL)
	arg_7_0.subAttrUIList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventInit then
			local var_19_0 = IslandShipAttr.ATTRS[arg_19_1 + 1]

			arg_19_2.name = var_19_0

			setText(arg_19_2:Find("Text"), IslandShipAttr.ToChinese(var_19_0))
		elseif arg_19_0 == UIItemList.EventUpdate then
			setFillAmount(arg_19_2:Find("slider/bar"), arg_7_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[arg_19_1 + 1]))
		end
	end)

	function arg_7_0.shipRectCom.onInitItem(arg_20_0)
		arg_7_0:OnInitShip(arg_20_0)
	end

	function arg_7_0.shipRectCom.onUpdateItem(arg_21_0, arg_21_1)
		arg_7_0:OnUpdateShip(arg_21_0, arg_21_1)
	end

	arg_7_0.cards = {}
	arg_7_0.selectAsc = true
	arg_7_0.sortData = {
		sortIndex = IslandShipIndexLayer.SortLevel,
		campIndex = ShipIndexConst.CampAll,
		rarityIndex = ShipIndexConst.RarityAll,
		extraIndex = IslandShipIndexLayer.ExtraALL
	}

	arg_7_0:UpdateSortBtn()

	arg_7_0.timeMgr = pg.TimeMgr.GetInstance()
end

function var_0_0.OnFilter(arg_22_0, arg_22_1)
	arg_22_0.sortData = arg_22_1

	arg_22_0:UpdateSortBtn()
	arg_22_0:FlushShips()
end

function var_0_0.UpdateSortBtn(arg_23_0)
	arg_23_0.orderIco.localScale = arg_23_0.selectAsc and Vector3(1, 1, 1) or Vector3(1, -1, 1)

	local var_23_0, var_23_1 = IslandShipIndexLayer.getSortFuncAndName(arg_23_0.sortData.sortIndex, arg_23_0.selectAsc)

	arg_23_0.orderTxt.text = i18n(var_23_1)
end

function var_0_0.UpdateAttrs(arg_24_0, arg_24_1)
	local var_24_0 = IslandShipAttr.ATTRS

	arg_24_0.attrUIList:make(function(arg_25_0, arg_25_1, arg_25_2)
		if arg_25_0 == UIItemList.EventUpdate then
			local var_25_0 = arg_25_1 + 1

			arg_24_0:UpdateAttr(arg_25_2, var_24_0, var_25_0, arg_24_1)
		end
	end)
	arg_24_0.attrUIList:align(#var_24_0)
end

function var_0_0.UpdateAttr(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = arg_26_2[arg_26_3]
	local var_26_1 = arg_26_4:GetAttr(var_26_0)

	setText(arg_26_1:Find("name"), IslandShipAttr.ToChinese(var_26_0))

	local var_26_2 = IslandProductTimeHelper.GetAttributeAddPercentByAttribute(arg_26_4.id, arg_26_3)
	local var_26_3
	local var_26_4 = var_26_2 > 0 and "#00B91E" or var_26_2 < 0 and "#FF6767" or "#393A3C"

	setTextColor(arg_26_1:Find("value"), Color.NewHex(var_26_4))

	local var_26_5 = var_26_2 ~= 0 and math.floor(var_26_1 * (1 + 0.01 * var_26_2)) or var_26_1

	setText(arg_26_1:Find("value"), var_26_5)

	if var_26_2 ~= 0 then
		local var_26_6 = arg_26_4:GetDisplayStatus()
		local var_26_7 = _.select(var_26_6, function(arg_27_0)
			return arg_27_0:GetBuffType() == IslandBuffType.SHIP_ATTR
		end)

		onButton(arg_26_0, arg_26_1, function()
			arg_26_0:ShowMsgBox({
				hideNo = true,
				type = IslandMsgBox.TYPE_SHIP_OWN_STATUS,
				title = i18n("island_word_ship_buff_desc"),
				statusList = var_26_7
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_26_1)
	end

	local var_26_8 = arg_26_4:GetAttrGradeByValue(var_26_5)
	local var_26_9 = IslandShipAttr.Grade2Img(var_26_8)

	arg_26_1:Find("grade"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_26_9[1])
	arg_26_1:Find("grade_bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_26_9[2])

	setActive(arg_26_1:Find("vx_tpl"), arg_26_0.attrType == arg_26_3)
end

function var_0_0.OnShow(arg_29_0, arg_29_1)
	arg_29_0:BlurPanel()

	arg_29_0.selectNum = arg_29_1.selectNum or 1
	arg_29_0.selectedIds = arg_29_1.selectedIds or {}
	arg_29_0.attrType = arg_29_1.attrType
	arg_29_0.confirmFunc = arg_29_1.confirmFunc
	arg_29_0.cancelFunc = arg_29_1.cancelFunc
	arg_29_0.placeId = arg_29_1.placeId
	arg_29_0.showBenefits = arg_29_1.showBenefits
	arg_29_0.needWorkSpeed = arg_29_1.needWorkSpeed or false
	arg_29_0.autoCollectionSelectShip = arg_29_1.autoCollectionSelectShip

	local var_29_0 = arg_29_1.emptyInfoTitle or ""

	setText(arg_29_0.infoEmptyTitleTF, var_29_0)

	arg_29_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	if arg_29_0.needWorkSpeed then
		arg_29_0.sortData.sortIndex = IslandShipIndexLayer.SortWorkSpeed
	else
		arg_29_0.sortData.sortIndex = IslandShipIndexLayer.SortLevel
	end

	arg_29_0:UpdateSortBtn()

	local var_29_1 = #arg_29_0.selectedIds == 0 and arg_29_0.selectNum == 1

	arg_29_0:FlushShips(var_29_1)
end

function var_0_0.CheckHasSelected(arg_30_0, arg_30_1)
	if not arg_30_0.autoCollectionSelectShip then
		return false
	end

	local var_30_0 = false

	for iter_30_0, iter_30_1 in pairs(arg_30_0.autoCollectionSelectShip) do
		if arg_30_1 == iter_30_1 then
			var_30_0 = true
		end
	end

	return var_30_0
end

function var_0_0.OnInitShip(arg_31_0, arg_31_1)
	local var_31_0 = IslandSelectShipCard.New(arg_31_1)

	arg_31_0.cards[arg_31_1] = var_31_0
end

function var_0_0.OnUpdateShip(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.cards[arg_32_2]

	if not var_32_0 then
		arg_32_0:OnInitItem(arg_32_2)

		var_32_0 = arg_32_0.cards[arg_32_2]
	end

	local var_32_1 = arg_32_0.showShips[arg_32_1 + 1]
	local var_32_2 = arg_32_0.characterAgency:GetShipById(var_32_1)

	onButton(arg_32_0, var_32_0.go, function()
		if arg_32_0:CheckHasSelected(var_32_1) then
			return
		end

		if getProxy(IslandProxy):GetIsland():GetFollowerAgency():Following(var_32_1) then
			arg_32_0:ShowMsgBox({
				content = i18n("island_cancel_follow_tip"),
				onYes = function()
					arg_32_0:emit(IslandMediator.DEL_FOLLOWER, var_32_1)
				end
			})

			return
		end

		if not var_32_2:IsDelegable() then
			return
		end

		if arg_32_0.showId == var_32_0.id then
			arg_32_0.showId = nil
		else
			arg_32_0.showId = var_32_0.id
		end

		if table.contains(arg_32_0.selectedIds, var_32_0.id) then
			table.removebyvalue(arg_32_0.selectedIds, var_32_0.id)
		elseif arg_32_0.selectNum == 1 then
			arg_32_0.selectedIds = {
				var_32_0.id
			}
		else
			if #arg_32_0.selectedIds >= arg_32_0.selectNum then
				return
			end

			table.insert(arg_32_0.selectedIds, var_32_0.id)
		end

		for iter_33_0, iter_33_1 in pairs(arg_32_0.cards) do
			iter_33_1:UpdateSelected(arg_32_0.selectedIds)
		end

		arg_32_0:FlushInfo()
	end, SFX_PANEL)
	var_32_0:Update(var_32_1, arg_32_0.attrType, arg_32_0.placeId, arg_32_0.selectedIds, arg_32_0.autoCollectionSelectShip)
end

function var_0_0.FlushShips(arg_35_0, arg_35_1)
	arg_35_0.showShips = arg_35_0:GetShips()

	if #arg_35_0.showShips ~= 0 and arg_35_1 then
		local var_35_0 = arg_35_0:GetFristSelectableShipId()

		if var_35_0 then
			arg_35_0.showId = var_35_0

			table.insert(arg_35_0.selectedIds, var_35_0)
		end
	end

	arg_35_0.showId = arg_35_0.selectedIds[1]

	setActive(arg_35_0.shipContent, #arg_35_0.showShips ~= 0)
	setActive(arg_35_0.shipEmpty, #arg_35_0.showShips == 0)
	arg_35_0.shipRectCom:SetTotalCount(#arg_35_0.showShips)
	arg_35_0:FlushInfo()
end

function var_0_0.GetFristSelectableShipId(arg_36_0)
	for iter_36_0, iter_36_1 in ipairs(arg_36_0.showShips) do
		if arg_36_0.characterAgency:GetShipById(iter_36_1):GetState() == IslandShip.STATE_NORMAL and not arg_36_0:CheckHasSelected(iter_36_1) then
			return iter_36_1
		end
	end

	return nilGetShipsAttrProgress
end

function var_0_0.UpdateTimer(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1 - arg_37_0.timeMgr:GetServerTime()

	setText(arg_37_0.energyTimeTextTf, arg_37_0.timeMgr:DescCDTime(var_37_0))
end

function var_0_0.StopTimer(arg_38_0)
	if arg_38_0.energyTimer ~= nil then
		arg_38_0.energyTimer:Stop()

		arg_38_0.energyTimer = nil
	end
end

function var_0_0.FlushInfo(arg_39_0)
	arg_39_0.selectedTextCom.text = #arg_39_0.selectedIds .. "/" .. arg_39_0.selectNum

	arg_39_0:FlushBenefits()
	setActive(arg_39_0.sureBtn, arg_39_0.showId)
	setActive(arg_39_0.infoPanel, arg_39_0.showId)
	setActive(arg_39_0.infoEmptyTF, not arg_39_0.showId)
	arg_39_0:FlushAddPercent()
	arg_39_0:FlushEnergyPercent()

	if not arg_39_0.showId then
		return
	end

	local var_39_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_39_0.showId)

	setText(arg_39_0.nameTF, var_39_0:GetName())
	setText(arg_39_0.levelTF, string.format("-Lv.%d", var_39_0:GetLevel()))
	arg_39_0:UpdateAttrs(var_39_0)

	local var_39_1 = IslandShip.StaticGetPrefab(var_39_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_39_1, "", arg_39_0.shipIconTF)

	local var_39_2 = var_39_0:GetCurrentEnergy()
	local var_39_3 = var_39_0:GetMaxEnergy()

	setText(arg_39_0.energyTF:Find("text"), var_39_2 .. "/" .. var_39_3)
	setSlider(arg_39_0.energyTF:Find("energy_bar"), 0, 1, var_39_2 / var_39_3)

	if var_39_2 ~= var_39_3 then
		setActive(arg_39_0.recoveryTimeTips, true)
		setActive(arg_39_0.energyTimeTextTf, true)

		local var_39_4 = var_39_0:GetEnergyMaxTime()

		arg_39_0:StopTimer()
		arg_39_0:UpdateTimer(var_39_4)

		arg_39_0.energyTimer = Timer.New(function()
			arg_39_0:UpdateTimer(var_39_4)
		end, 1, -1)

		arg_39_0.energyTimer:Start()
	else
		arg_39_0:StopTimer()
		setActive(arg_39_0.recoveryTimeTips, false)
		setActive(arg_39_0.energyTimeTextTf, false)
	end

	local var_39_5 = var_39_0:GetSkill()
	local var_39_6 = var_39_5:IsUnlock()

	setActive(arg_39_0.skill, var_39_6)
	setActive(arg_39_0.skillEmp, not var_39_6)
	setText(arg_39_0.skillEmpDes, i18n("island_need_star", var_39_0:GetSkillUnlockLevel()))

	local var_39_7 = var_39_5:IsEffectiveInPlace(arg_39_0.placeId)

	setActive(arg_39_0.skillInuse, var_39_7)
	setActive(arg_39_0.skillUnuse, not var_39_7)

	arg_39_0.skillName.text = string.format("%s - %s", var_39_5:GetName(), "[Lv." .. var_39_5:GetLevel() .. "]")
	arg_39_0.skillDes.text = var_39_5:GetEffectDesc()

	arg_39_0:FlushAddPercent()
	arg_39_0:FlushEnergyPercent()
end

function var_0_0.FlushEnergyPercent(arg_41_0)
	if not arg_41_0.showId or not arg_41_0.autoCollectionSelectShip then
		setActive(arg_41_0.energyStutasTF, false)

		return
	end

	setActive(arg_41_0.energyStutasTF, true)

	local var_41_0 = IslandAutoCollectHelper.GetAttributeReducePercent(arg_41_0.showId)
	local var_41_1 = string.format("<color=#39bfff> -%d%%</color>", var_41_0)
	local var_41_2 = i18n("island_chara_gather_skill_effect") .. var_41_1

	setText(arg_41_0.energyStutasTFNum, var_41_2)
end

function var_0_0.FlushAddPercent(arg_42_0)
	if not arg_42_0.showId or not arg_42_0.needWorkSpeed then
		setActive(arg_42_0.addStutasTF, false)
		setActive(arg_42_0.addStutasInfoPanel, false)

		return
	end

	local var_42_0, var_42_1, var_42_2, var_42_3 = IslandProductTimeHelper.GetAllAddPercent(arg_42_0.showId, arg_42_0.placeId, arg_42_0.attrType)
	local var_42_4 = var_42_0 + var_42_1 + var_42_2 + var_42_3

	setActive(arg_42_0.addStutasTF, true)
	setText(arg_42_0.addStutasNum, i18n("island_production_speed_tip1", var_42_4))

	arg_42_0.buffInfos = {}

	local var_42_5 = IslandProductTimeHelper.GetAttributeAddPercent(arg_42_0.showId, arg_42_0.attrType)

	if var_42_0 > 0 then
		local var_42_6 = IslandShipAttr.GetAtrrName(arg_42_0.attrType)

		table.insert(arg_42_0.buffInfos, {
			name = i18n("island_production_speed_addition1", IslandShipAttr.ToChinese(var_42_6)),
			effect = "+" .. var_42_0 .. "%"
		})
	end

	if var_42_1 > 0 then
		table.insert(arg_42_0.buffInfos, {
			name = i18n("island_production_speed_addition2"),
			effect = "+" .. var_42_1 .. "%"
		})
	end

	if var_42_2 > 0 then
		local var_42_7 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_42_0.showId):GetSkill():GetName()

		table.insert(arg_42_0.buffInfos, {
			name = var_42_7,
			effect = "+" .. var_42_2 .. "%"
		})
	end

	if var_42_3 > 0 then
		table.insert(arg_42_0.buffInfos, {
			name = i18n("island_production_speed_addition3"),
			effect = "+" .. var_42_3 .. "%"
		})
	end

	arg_42_0.buffInfoUIList:align(#arg_42_0.buffInfos)
	setActive(arg_42_0.buffInfoEmptyTF, #arg_42_0.buffInfos == 0)
end

function var_0_0.FlushBenefits(arg_43_0)
	setActive(arg_43_0.benefitsTF, arg_43_0.showBenefits)

	if arg_43_0.showBenefits then
		setFillAmount(arg_43_0.mainAttrBar, arg_43_0:GetShipsAttrProgress(IslandShipAttr.ATTRS[1]))
		arg_43_0.subAttrUIList:align(#IslandShipAttr.ATTRS)
	end
end

function var_0_0.GetShipsAttrProgress(arg_44_0, arg_44_1)
	local var_44_0 = pg.island_chara_att.all[#pg.island_chara_att.all]
	local var_44_1 = var_44_0 * arg_44_0.selectNum
	local var_44_2 = 0

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.selectedIds) do
		var_44_2 = var_44_2 + (var_44_0 - arg_44_0.characterAgency:GetShipById(iter_44_1):GetAttrGrade(arg_44_1) + 1)
	end

	return var_44_2 / var_44_1
end

function var_0_0.ToVShip(arg_45_0, arg_45_1)
	if not arg_45_0.vship then
		arg_45_0.vship = {}

		function arg_45_0.vship.getNation()
			return arg_45_0.vship.config.nationality
		end

		function arg_45_0.vship.getShipType()
			return arg_45_0.vship.config.type
		end

		function arg_45_0.vship.getTeamType()
			return ShipType.GetTeamFromShipType(arg_45_0.vship.config.type)
		end

		function arg_45_0.vship.getRarity()
			return arg_45_0.vship.config.rarity
		end
	end

	arg_45_0.vship.config = arg_45_1

	return arg_45_0.vship
end

local function var_0_1(arg_50_0, arg_50_1)
	if not arg_50_1 or arg_50_1 == "" then
		return true
	end

	local var_50_0 = string.lower(string.gsub(arg_50_1, "%.", "%%."))
	local var_50_1 = IslandShip.StaticGetName(arg_50_0)

	return string.find(string.lower(var_50_1), var_50_0)
end

local function var_0_2(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_1
	local var_51_1 = ShipGroup.getDefaultShipConfig(var_51_0)
	local var_51_2 = arg_51_0:ToVShip(var_51_1)
	local var_51_3 = arg_51_0.characterAgency:GetShipById(arg_51_1)

	if ShipIndexConst.filterByCamp(var_51_2, arg_51_2.campIndex) and ShipIndexConst.filterByRarity(var_51_2, arg_51_2.rarityIndex) and IslandShipIndexLayer.filterByExtra(var_51_3, arg_51_2.extraIndex) then
		return true
	end

	return false
end

function var_0_0.GetShips(arg_52_0)
	local var_52_0 = {}
	local var_52_1 = {}
	local var_52_2 = arg_52_0.characterAgency:GetShipsContainNpc()

	for iter_52_0, iter_52_1 in ipairs(var_52_2) do
		if var_0_1(iter_52_1.id, arg_52_0.searchKey) and var_0_2(arg_52_0, iter_52_1.id, arg_52_0.sortData) then
			if arg_52_0.needWorkSpeed then
				local var_52_3 = setmetatable({
					GetWorkSpeed = function()
						local var_53_0, var_53_1, var_53_2, var_53_3 = IslandProductTimeHelper.GetAllAddPercent(iter_52_1.id, arg_52_0.placeId, arg_52_0.attrType)

						return var_53_0 + var_53_1 + var_53_2 + var_53_3
					end
				}, {
					__index = iter_52_1
				})

				table.insert(var_52_1, var_52_3)
			elseif arg_52_0.autoCollectionSelectShip then
				if iter_52_1.id ~= 1 then
					table.insert(var_52_1, iter_52_1)
				end
			else
				table.insert(var_52_1, iter_52_1)
			end
		end
	end

	local var_52_4 = IslandShipIndexLayer.getSortFuncAndName(arg_52_0.sortData.sortIndex, arg_52_0.selectAsc)

	table.sort(var_52_1, CompareFuncs(var_52_4))

	for iter_52_2, iter_52_3 in ipairs(var_52_1) do
		table.insert(var_52_0, iter_52_3.id)
	end

	return var_52_0
end

function var_0_0.OnDestroy(arg_54_0)
	ClearLScrollrect(arg_54_0.shipRectCom)
	arg_54_0:StopTimer()
	arg_54_0:OnHide()
end

function var_0_0.OnHide(arg_55_0)
	if isActive(arg_55_0.addStutasInfoPanel) then
		setActive(arg_55_0.addStutasInfoPanel, false)
	end

	arg_55_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_56_0)
	arg_56_0:OnHide()
end

return var_0_0
