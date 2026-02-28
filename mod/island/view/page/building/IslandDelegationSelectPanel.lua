local var_0_0 = class("IslandDelegationSelectPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandDelegationSelectPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0._tf:Find("close")
	arg_2_0.layoutTF = arg_2_0._tf:Find("layout")

	local var_2_0 = arg_2_0._tf:Find("layout/select_container/selectInfo")

	arg_2_0.slotNameTF = var_2_0:Find("slotName")
	arg_2_0.unlockSlot = var_2_0:Find("unlock")
	arg_2_0.lockSlot = var_2_0:Find("lock")
	arg_2_0.emptyAddShipTF = arg_2_0.unlockSlot:Find("empty")
	arg_2_0.quickBtn = arg_2_0.unlockSlot:Find("emptyBtn")
	arg_2_0.contentTF = arg_2_0.unlockSlot:Find("content")
	arg_2_0.processTF = arg_2_0.contentTF:Find("process")
	arg_2_0.selectShipTF = arg_2_0.processTF:Find("ship/selectShip")
	arg_2_0.selectShipBtn = arg_2_0.selectShipTF:Find("selectShipButton")
	arg_2_0.energySliderTF = arg_2_0.selectShipTF:Find("energy/energy_bar")
	arg_2_0.energyTFText = arg_2_0.selectShipTF:Find("energy/Text")
	arg_2_0.seletShipName = arg_2_0.selectShipTF:Find("name")
	arg_2_0.shipIconTF = arg_2_0.selectShipTF:Find("icon_mask/icon")
	arg_2_0.expGetTF = arg_2_0.selectShipTF:Find("exp_get")

	setActive(arg_2_0.expGetTF, false)

	arg_2_0.selectFormulaBtn = arg_2_0.processTF:Find("selectFormula")
	arg_2_0.inprocessFormulaTF = arg_2_0.processTF:Find("inprocess")
	arg_2_0.inproduction = arg_2_0.inprocessFormulaTF:Find("inproduction")
	arg_2_0.speedupBtn = arg_2_0.inproduction:Find("quick")
	arg_2_0.timeTF = arg_2_0.inproduction:Find("time/Text")
	arg_2_0.roleDelegationSliderTF = arg_2_0.inproduction:Find("time/time_bar")
	arg_2_0.currentFormula = arg_2_0.inprocessFormulaTF:Find("formulalayout/formula")
	arg_2_0.currentFormulaIcon = arg_2_0.currentFormula:Find("curformula")
	arg_2_0.currentFormulaNum = arg_2_0.currentFormulaIcon:Find("product_count_bg/product_count")
	arg_2_0.currentFormulaLastNum = arg_2_0.currentFormula:Find("tips_num")
	arg_2_0.formulaProcess = arg_2_0.currentFormula:Find("process"):GetComponent(typeof(Image))
	arg_2_0.extraProduct = arg_2_0.inprocessFormulaTF:Find("formulalayout/second_formula")
	arg_2_0.extraProductIcon = arg_2_0.extraProduct:Find("bg/icon")
	arg_2_0.extraProductName = arg_2_0.extraProduct:Find("name")
	arg_2_0.extraProductNum = arg_2_0.extraProductIcon:Find("product_count_bg/product_count")
	arg_2_0.extraProductLastNum = arg_2_0.extraProduct:Find("name/num")
	arg_2_0.currentExtroFormula = arg_2_0.inprocessFormulaTF:Find("formulalayout/second_formula")
	arg_2_0.finishTF = arg_2_0.contentTF:Find("finish")
	arg_2_0.finishFurmalaIcon = arg_2_0.finishTF:Find("formulalayout/formula/curformula")

	setText(arg_2_0.finishTF:Find("formulalayout/formula/tips"), i18n("island_production_finish"))

	arg_2_0.stopBtn = arg_2_0.contentTF:Find("btns/stop")
	arg_2_0.getBtn = arg_2_0.contentTF:Find("btns/get")
	arg_2_0.addBtn = arg_2_0.contentTF:Find("btns/add")
	arg_2_0.canRewardIcon = arg_2_0.getBtn:Find("hasicon")
	arg_2_0.canRewardNum = arg_2_0.getBtn:Find("num")
	arg_2_0.canExtraRewardIcon = arg_2_0.getBtn:Find("extraIcon")
	arg_2_0.canExtraRewardNum = arg_2_0.getBtn:Find("extraNum")
	arg_2_0.shipDetailsBtn = arg_2_0.processTF:Find("ship/details")
	arg_2_0.shipDetailsPanel = arg_2_0._tf:Find("layout/ship_container")
	arg_2_0.shipDetailBack = arg_2_0.shipDetailsPanel:Find("back")
	arg_2_0.shipSkillEmp = arg_2_0.shipDetailsPanel:Find("skillEmp")
	arg_2_0.shipSkillEmpDes = arg_2_0.shipDetailsPanel:Find("skillEmp/Text")
	arg_2_0.shipSkillDetails = arg_2_0.shipDetailsPanel:Find("skill")
	arg_2_0.shipDetailsIcon = arg_2_0.shipSkillDetails:Find("icon")
	arg_2_0.shipDetailsName = arg_2_0.shipSkillDetails:Find("name"):GetComponent(typeof(Text))
	arg_2_0.shipDetailsDes = arg_2_0.shipSkillDetails:Find("desc/Text"):GetComponent(typeof(Text))

	setText(arg_2_0.shipDetailsPanel:Find("title"), i18n("island_production_character_info"))
	setText(arg_2_0.getBtn:Find("Text"), i18n("island_production_collect"))
	setText(arg_2_0.addBtn:Find("num"), i18n("island_additional_production_tip1"))
	setText(arg_2_0.currentFormula:Find("tips"), i18n("island_production_count"))
	setText(arg_2_0.quickBtn:Find("Text"), i18n("island_quick_delegation"))
	arg_2_0:ApplyDiff()

	arg_2_0.extraProductList = UIItemList.New(arg_2_0.extraProduct:Find("process"), arg_2_0.extraProduct:Find("process/item"))
end

function var_0_0.ApplyDiff(arg_3_0)
	if arg_3_0.contextData and arg_3_0.contextData.isPermanent then
		setActive(arg_3_0.closeBtn, false)
	end

	if arg_3_0.contextData and arg_3_0.contextData.alignRight then
		arg_3_0.layoutTF.anchorMin = Vector2(1, 0.5)
		arg_3_0.layoutTF.anchorMax = Vector2(1, 0.5)
		arg_3_0.layoutTF.pivot = Vector2(1, 0.5)

		setAnchoredPosition(arg_3_0.layoutTF, {
			x = -35,
			y = 0
		})
	end
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0.closeBtn, function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.shipDetailsBtn, function()
		arg_4_0:ShowDetailPanel()
	end)
	onButton(arg_4_0, arg_4_0.shipDetailBack, function()
		arg_4_0:HideDetailPanel()
	end)
	onButton(arg_4_0, arg_4_0.emptyAddShipTF, function()
		arg_4_0:OpenShipSelectPage()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.selectShipBtn, function()
		arg_4_0:OpenShipSelectPage()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.selectFormulaBtn, function()
		arg_4_0:OpenFormulaSelectPage()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.getBtn, function()
		local var_11_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_4_0.placeId):GetDelegationSlotData(arg_4_0.slotId)

		if not var_11_0 then
			return
		end

		local var_11_1 = not var_11_0:GetSlotRoleData() and var_11_0:GetSlotRewardData() and 2 or 1

		arg_4_0:emit(IslandMediator.GET_DELEGATION_AWARD, arg_4_0.placeId, arg_4_0.slotId, var_11_1, nil, arg_4_0.contextData.isPost)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.stopBtn, function()
		arg_4_0:emit(IslandMediator.STOP_DELEGATION, arg_4_0.placeId, arg_4_0.slotId)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.speedupBtn, function()
		arg_4_0:emit(IslandMediator.OPEN_PAGE, "IslandTicketUsePage", {
			IslandUseTicketCommand.TYPES.APPOINT,
			arg_4_0.slotId
		})
	end, SFX_PANEL)
	arg_4_0.extraProductList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventInit then
			-- block empty
		elseif arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_14_1 < arg_4_0.extraProcess

			setActive(arg_14_2:Find("inprocess"), var_14_0)
		end
	end)
	onButton(arg_4_0, arg_4_0.quickBtn, function()
		local var_15_0, var_15_1 = (function()
			local var_16_0 = IslandStartDelegationCommand.GetLocalKeyForLastData(arg_4_0.slotId)
			local var_16_1 = PlayerPrefs.GetString(var_16_0, "")

			return UnpackIntFromString(var_16_1)
		end)()
		local var_15_2 = pg.island_formula[var_15_1]
		local var_15_3 = math.floor(var_15_2.stamina_cost * (1 - IslandProductCostHelper.GetReducePercentInPlace(var_15_0, arg_4_0.placeId)))
		local var_15_4 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_15_0)

		if not var_15_4:IsDelegable() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_quick_delegation_notenough_onduty", var_15_4:GetName()))

			arg_4_0.selectedShipId = 1
		elseif var_15_3 > var_15_4:GetCurrentEnergy() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_quick_delegation_notenough_encourage", var_15_4:GetName()))

			arg_4_0.selectedShipId = 1
		else
			arg_4_0.selectedShipId = var_15_0
		end

		arg_4_0:OpenFormulaSelectPage(nil, nil, nil, nil, var_15_1)
	end, SFX_PANEL)
end

function var_0_0.ShowDetailPanel(arg_17_0)
	setActive(arg_17_0.shipDetailsPanel, true)

	local var_17_0 = arg_17_0.showShip:GetSkill()
	local var_17_1 = var_17_0:IsUnlock()

	setActive(arg_17_0.shipSkillDetails, var_17_1)
	setActive(arg_17_0.shipSkillEmp, not var_17_1)
	setText(arg_17_0.shipSkillEmpDes, i18n("island_need_star", arg_17_0.showShip:GetSkillUnlockLevel()))
	GetImageSpriteFromAtlasAsync("island/IslandSkillIcon/" .. var_17_0:GetIcon(), "", arg_17_0.shipDetailsIcon)

	arg_17_0.shipDetailsName.text = string.format("%s - %s", var_17_0:GetName(), "[Lv." .. var_17_0:GetLevel() .. "]")
	arg_17_0.shipDetailsDes.text = var_17_0:GetEffectDesc()
end

function var_0_0.HideDetailPanel(arg_18_0)
	setActive(arg_18_0.shipDetailsPanel, false)
end

function var_0_0.Show(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	arg_19_0.super.Show(arg_19_0)

	arg_19_0.loadCharacterFunc = arg_19_3
	arg_19_0.unLoadCharacterFunc = arg_19_4
	arg_19_0.selectedShipId = arg_19_2
	arg_19_0.commissionId = arg_19_1 or arg_19_0.commissionId
	arg_19_0.slotId = pg.island_production_commission[arg_19_0.commissionId].slot
	arg_19_0.placeId = pg.island_production_slot[arg_19_0.slotId].place

	if arg_19_0.placeId == IslandProductConst.PasturePlaceId then
		IslandGuideChecker.CheckGuide("ISLAND_GUIDE_24")
	end

	arg_19_0.timeMgr = pg.TimeMgr.GetInstance()

	arg_19_0:HideDetailPanel()
	arg_19_0:Flush()
end

function var_0_0.Flush(arg_20_0)
	arg_20_0:FlushInfos()
	arg_20_0:StopTimer()
	arg_20_0:StartTimer()
end

function var_0_0.FlushInfos(arg_21_0)
	arg_21_0.slotData = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_21_0.placeId):GetDelegationSlotData(arg_21_0.slotId)

	local var_21_0 = pg.island_production_place[arg_21_0.placeId].name

	setText(arg_21_0.slotNameTF, var_21_0 .. "-" .. pg.island_production_commission[arg_21_0.commissionId].name)
	setActive(arg_21_0.lockSlot, not arg_21_0.slotData)
	setActive(arg_21_0.unlockSlot, arg_21_0.slotData)
	setActive(arg_21_0.addBtn, false)
	setActive(arg_21_0.canExtraRewardIcon, false)
	setActive(arg_21_0.canExtraRewardNum, false)

	if not arg_21_0.slotData then
		return
	end

	if arg_21_0.slotData:CanStartDelegation() then
		setActive(arg_21_0.finishTF, false)
		setActive(arg_21_0.emptyAddShipTF, not arg_21_0.selectedShipId)
		setActive(arg_21_0.contentTF, arg_21_0.selectedShipId)

		local var_21_1 = IslandStartDelegationCommand.GetLocalKeyForLastData(arg_21_0.slotId)

		if PlayerPrefs.GetString(var_21_1, "") ~= "" then
			setActive(arg_21_0.quickBtn, true)
		else
			setActive(arg_21_0.quickBtn, false)
		end

		setActive(arg_21_0.processTF, arg_21_0.selectedShipId)
		setActive(arg_21_0.selectShipBtn, arg_21_0.selectedShipId)
		setActive(arg_21_0.selectFormulaBtn, arg_21_0.selectedShipId)
		setActive(arg_21_0.inprocessFormulaTF, false)

		if arg_21_0.selectedShipId then
			arg_21_0.showShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_21_0.selectedShipId)

			local var_21_2 = arg_21_0.showShip:GetCurrentEnergy()
			local var_21_3 = arg_21_0.showShip:GetMaxEnergy()

			setText(arg_21_0.energyTFText, var_21_2 .. "/" .. var_21_3)
			setSlider(arg_21_0.energySliderTF, 0, 1, var_21_2 / var_21_3)
			setText(arg_21_0.seletShipName, arg_21_0.showShip:GetName())

			local var_21_4 = IslandShip.StaticGetPrefab(arg_21_0.selectedShipId)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_21_4, "", arg_21_0.shipIconTF)
		end

		setActive(arg_21_0.stopBtn, false)
		setActive(arg_21_0.getBtn, false)
	else
		setActive(arg_21_0.contentTF, true)
		setActive(arg_21_0.emptyAddShipTF, false)
		setActive(arg_21_0.quickBtn, false)
		setActive(arg_21_0.selectShipBtn, false)
		setActive(arg_21_0.selectFormulaBtn, false)

		local var_21_5 = arg_21_0.slotData:GetSlotRoleData()
		local var_21_6 = arg_21_0.slotData:GetSlotRewardData()
		local var_21_7 = not var_21_5 and var_21_6

		setActive(arg_21_0.processTF, not var_21_7)
		setActive(arg_21_0.finishTF, var_21_7)
		setActive(arg_21_0.getBtn, var_21_7)
		setActive(arg_21_0.stopBtn, not var_21_7)
		setActive(arg_21_0.inprocessFormulaTF, not var_21_7)

		if var_21_7 then
			local var_21_8 = var_21_6.formula_id
			local var_21_9 = pg.island_formula[var_21_8].commission_product
			local var_21_10 = var_21_9[1][1]
			local var_21_11 = var_21_6.formula_drop_list[1].num * var_21_9[1][2]
			local var_21_12 = Drop.New({
				count = 0,
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_21_10
			}):getConfigTable().icon

			GetImageSpriteFromAtlasAsync("island/" .. var_21_12, "", arg_21_0.canRewardIcon)

			local var_21_13 = var_21_6.main_num or 0
			local var_21_14 = "×" .. var_21_11 + var_21_13

			if var_21_13 > 0 then
				setTextColor(arg_21_0.canRewardNum, Color.NewHex("#7df39f"))
			else
				setTextColor(arg_21_0.canRewardNum, Color.NewHex("#FFFFFF"))
			end

			setText(arg_21_0.canRewardNum, var_21_14)

			local var_21_15 = pg.island_formula[var_21_8].item_id
			local var_21_16 = pg.island_item_data_template[var_21_15]

			GetImageSpriteFromAtlasAsync("island/" .. var_21_16.icon, "", arg_21_0.finishFurmalaIcon)

			if var_21_6.formula_drop_list[2] then
				setActive(arg_21_0.canExtraRewardIcon, true)
				setActive(arg_21_0.canExtraRewardNum, true)

				local var_21_17 = pg.island_formula[var_21_8].second_product_display[1][1]
				local var_21_18 = var_21_6.formula_drop_list[2].num * pg.island_formula[var_21_8].second_product_display[1][2]
				local var_21_19 = Drop.New({
					count = 0,
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_21_17
				}):getConfigTable().icon

				GetImageSpriteFromAtlasAsync("island/" .. var_21_19, "", arg_21_0.canExtraRewardIcon)

				local var_21_20 = var_21_6.other_num or 0
				local var_21_21 = "×" .. var_21_18 + var_21_20

				if var_21_20 > 0 then
					setTextColor(arg_21_0.canExtraRewardNum, Color.NewHex("#7df39f"))
				else
					setTextColor(arg_21_0.canExtraRewardNum, Color.NewHex("#FFFFFF"))
				end

				setText(arg_21_0.canExtraRewardNum, var_21_21)
			end
		end

		if var_21_5 then
			arg_21_0.showShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_21_5.ship_id)

			local var_21_22 = arg_21_0.showShip:GetCurrentEnergy()
			local var_21_23 = arg_21_0.showShip:GetMaxEnergy()

			setText(arg_21_0.energyTFText, var_21_22 .. "/" .. var_21_23)
			setSlider(arg_21_0.energySliderTF, 0, 1, var_21_22 / var_21_23)
			setText(arg_21_0.seletShipName, arg_21_0.showShip:GetName())

			local var_21_24 = IslandShip.StaticGetPrefab(var_21_5.ship_id)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_21_24, "", arg_21_0.shipIconTF)

			local var_21_25 = var_21_5.formula_id
			local var_21_26 = pg.island_formula[var_21_25]
			local var_21_27 = var_21_26.commission_product[1][1]
			local var_21_28 = pg.island_item_data_template[var_21_27]
			local var_21_29 = Drop.New({
				count = 0,
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_21_27
			})

			onButton(arg_21_0, arg_21_0.currentFormulaIcon, function()
				arg_21_0.contextData:ShowMsgBox({
					title = i18n("island_word_desc"),
					type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
					dropData = var_21_29
				})
			end)
			GetImageSpriteFromAtlasAsync("island/" .. var_21_28.icon, "", arg_21_0.currentFormulaIcon)
			setText(arg_21_0.currentFormulaNum, "×" .. var_21_26.commission_product[1][2])
			GetImageSpriteFromAtlasAsync("island/" .. var_21_28.icon, "", arg_21_0.canRewardIcon)

			local var_21_30 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

			if #var_21_26.second_product == 0 or not var_21_30:IsUnlcokSecondProduct(var_21_25) then
				setActive(arg_21_0.extraProduct, false)
				setActive(arg_21_0.canExtraRewardIcon, false)
				setActive(arg_21_0.canExtraRewardNum, false)
			else
				setActive(arg_21_0.extraProduct, true)

				local var_21_31 = var_21_26.second_product_display
				local var_21_32 = var_21_31[1][1]
				local var_21_33 = pg.island_item_data_template[var_21_32]

				GetImageSpriteFromAtlasAsync("island/" .. var_21_33.icon, "", arg_21_0.extraProductIcon)
				GetImageSpriteFromAtlasAsync("island/" .. var_21_33.icon, "", arg_21_0.canExtraRewardIcon)
				setText(arg_21_0.extraProductName, var_21_33.name)
				setText(arg_21_0.extraProductNum, "×" .. var_21_31[1][2])

				local var_21_34 = Drop.New({
					count = 0,
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_21_32
				})

				onButton(arg_21_0, arg_21_0.extraProductIcon, function()
					arg_21_0.contextData:ShowMsgBox({
						title = i18n("island_word_desc"),
						type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
						dropData = var_21_34
					})
				end)
			end
		end
	end
end

function var_0_0.AfterShipSelect(arg_24_0, arg_24_1)
	arg_24_0.selectedShipId = arg_24_1

	arg_24_0:Flush()
	existCall(arg_24_0.loadCharacterFunc, arg_24_0.selectedShipId)
	arg_24_0:OpenFormulaSelectPage()
end

function var_0_0.OpenShipSelectPage(arg_25_0)
	local var_25_0 = pg.island_production_slot[arg_25_0.slotId].attribute

	arg_25_0:emit(IslandMediator.OPEN_PAGE, "IslandShipSelectPage", {
		{
			needWorkSpeed = true,
			attrType = var_25_0,
			confirmFunc = function(arg_26_0)
				arg_25_0:AfterShipSelect(arg_26_0[1])
			end,
			placeId = arg_25_0.placeId
		}
	})
end

function var_0_0.OpenFormulaSelectPage(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5)
	arg_27_0:emit(IslandMediator.OPEN_PAGE, "IslandFormulaSelectPage", {
		{
			commissionId = arg_27_0.commissionId,
			selectedShipId = arg_27_4 or arg_27_0.selectedShipId,
			unLoadCharacterFunc = arg_27_0.unLoadCharacterFunc,
			addDelegateFormula = arg_27_1,
			addDelegateFormulaTimes = arg_27_2,
			canRewardTime = arg_27_3,
			selectFormulaId = arg_27_5,
			confirmFunc = function()
				if arg_27_0.contextData and arg_27_0.contextData.isPermanent then
					return
				end

				arg_27_0:Hide()
			end
		}
	})
	arg_27_0:HideDetailPanel()
end

function var_0_0.UpdateTime(arg_29_0)
	local var_29_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_29_0.placeId):GetDelegationSlotData(arg_29_0.slotId)

	if not var_29_0 then
		arg_29_0:FlushInfos()

		return
	end

	local var_29_1 = var_29_0:GetSlotRoleData()

	if not var_29_1 then
		arg_29_0:FlushInfos()

		return
	end

	local var_29_2 = var_29_1:GetFinishTime() - arg_29_0.timeMgr:GetServerTime()

	setText(arg_29_0.timeTF, arg_29_0.timeMgr:DescCDTime(var_29_2))
	setSlider(arg_29_0.roleDelegationSliderTF, 0, 1, 1 - var_29_2 / var_29_1:GetAllTime())

	local var_29_3 = var_29_1:CanRewardTimes()
	local var_29_4 = var_29_1.formula_id
	local var_29_5 = pg.island_formula[var_29_4]
	local var_29_6 = var_29_1:GetCurrentCanRewardExtraMainNum()
	local var_29_7 = "×" .. tostring(var_29_5.commission_product[1][2] * var_29_3 + var_29_6)

	if var_29_6 and var_29_6 > 0 then
		setTextColor(arg_29_0.canRewardNum, Color.NewHex("#7df39f"))
	else
		setTextColor(arg_29_0.canRewardNum, Color.NewHex("#FFFFFF"))
	end

	setText(arg_29_0.canRewardNum, var_29_7)

	local var_29_8 = var_29_1:InCurrentTime()
	local var_29_9 = arg_29_0.timeMgr:GetServerTime() - var_29_1:InCurrentTimeStart(var_29_8)

	arg_29_0.formulaProcess.fillAmount = var_29_9 / var_29_1:CurrentTimeNeed(var_29_8)

	local var_29_10 = var_29_1:LastTimes()

	setText(arg_29_0.currentFormulaLastNum, var_29_10)

	local var_29_11 = var_29_1:GetExtraMainProduct(var_29_8)
	local var_29_12 = "×" .. var_29_5.commission_product[1][2]

	if var_29_11 > 0 then
		var_29_12 = string.format("×(%s<color=#7df39f>+%d</color>)", var_29_5.commission_product[1][2], var_29_11)
	end

	setText(arg_29_0.currentFormulaNum, var_29_12 .. i18n("island_production_tip"))

	if var_29_3 > 0 then
		setActive(arg_29_0.getBtn, true)
		setActive(arg_29_0.addBtn, false)
	else
		local var_29_13 = var_29_5.production_limit or 5

		setActive(arg_29_0.addBtn, var_29_10 < var_29_13)
		onButton(arg_29_0, arg_29_0.addBtn, function()
			arg_29_0:OpenFormulaSelectPage(var_29_4, var_29_10, var_29_3, var_29_1.ship_id)
		end, SFX_PANEL)
	end

	if #var_29_5.second_product == 0 or not getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlcokSecondProduct(var_29_4) then
		return
	end

	local var_29_14 = var_29_1:GetExtraExtraProduct(var_29_8)
	local var_29_15 = "×" .. var_29_5.second_product_display[1][2]

	if var_29_14 > 0 then
		var_29_15 = string.format("×(%s<color=#7df39f>+%d</color>)", var_29_5.second_product_display[1][2], var_29_14)
	end

	setText(arg_29_0.extraProductNum, var_29_15 .. i18n("island_production_tip"))

	local var_29_16 = var_29_0:GetFromulaTatalCount(var_29_5.id)
	local var_29_17 = var_29_16 + var_29_3
	local var_29_18 = var_29_5.second_product[1]
	local var_29_19 = var_29_17 % var_29_18

	if var_29_19 ~= arg_29_0.extraProcess then
		arg_29_0.extraProcess = var_29_19

		arg_29_0.extraProductList:align(var_29_18)
	end

	local var_29_20 = math.floor((var_29_10 + var_29_19) / var_29_18)

	setText(arg_29_0.extraProductLastNum, "×" .. var_29_20)

	local var_29_21 = math.floor(var_29_16 / var_29_18)
	local var_29_22 = math.floor(var_29_17 / var_29_18) - var_29_21

	setActive(arg_29_0.canExtraRewardIcon, var_29_22 > 0)
	setActive(arg_29_0.canExtraRewardNum, var_29_22 > 0)

	if var_29_22 > 0 then
		local var_29_23 = var_29_16 % var_29_18
		local var_29_24 = 0

		for iter_29_0 = 1, var_29_22 do
			local var_29_25 = var_29_8 - (iter_29_0 - 1) * var_29_18
			local var_29_26 = math.floor((var_29_25 + var_29_23) / var_29_18) * var_29_18 - var_29_23

			var_29_24 = var_29_24 + var_29_1:GetExtraExtraProduct(var_29_26)
		end

		local var_29_27 = "×" .. var_29_5.second_product_display[1][2] * var_29_22 + var_29_24

		if var_29_24 > 0 then
			setTextColor(arg_29_0.canExtraRewardNum, Color.NewHex("#7df39f"))
		else
			setTextColor(arg_29_0.canExtraRewardNum, Color.NewHex("#FFFFFF"))
		end

		setText(arg_29_0.canExtraRewardNum, var_29_27)
	end
end

function var_0_0.StartTimer(arg_31_0)
	arg_31_0.timer = Timer.New(function()
		arg_31_0:UpdateTime()
	end, 1, -1)

	arg_31_0.timer:Start()
	arg_31_0:UpdateTime()
end

function var_0_0.StopTimer(arg_33_0)
	if arg_33_0.timer ~= nil then
		arg_33_0.timer:Stop()

		arg_33_0.timer = nil
	end
end

function var_0_0.Hide(arg_34_0)
	arg_34_0.super.Hide(arg_34_0)
	arg_34_0:OnHide()
end

function var_0_0.OnHide(arg_35_0)
	arg_35_0:StopTimer()
end

function var_0_0.OnDestroy(arg_36_0)
	arg_36_0:OnHide()
end

return var_0_0
