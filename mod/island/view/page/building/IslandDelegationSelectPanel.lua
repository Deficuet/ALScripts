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
	arg_2_0.emptyBtn = arg_2_0.unlockSlot:Find("emptyBtn")
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
end

function var_0_0.ShowDetailPanel(arg_15_0)
	setActive(arg_15_0.shipDetailsPanel, true)

	local var_15_0 = arg_15_0.showShip:GetSkill()
	local var_15_1 = var_15_0:IsUnlock()

	setActive(arg_15_0.shipSkillDetails, var_15_1)
	setActive(arg_15_0.shipSkillEmp, not var_15_1)
	setText(arg_15_0.shipSkillEmpDes, i18n("island_need_star", arg_15_0.showShip:GetSkillUnlockLevel()))
	GetImageSpriteFromAtlasAsync("island/IslandSkillIcon/" .. var_15_0:GetIcon(), "", arg_15_0.shipDetailsIcon)

	arg_15_0.shipDetailsName.text = string.format("%s - %s", var_15_0:GetName(), "[Lv." .. var_15_0:GetLevel() .. "]")
	arg_15_0.shipDetailsDes.text = var_15_0:GetEffectDesc()
end

function var_0_0.HideDetailPanel(arg_16_0)
	setActive(arg_16_0.shipDetailsPanel, false)
end

function var_0_0.Show(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_0.super.Show(arg_17_0)

	arg_17_0.loadCharacterFunc = arg_17_3
	arg_17_0.unLoadCharacterFunc = arg_17_4
	arg_17_0.selectedShipId = arg_17_2
	arg_17_0.commissionId = arg_17_1 or arg_17_0.commissionId
	arg_17_0.slotId = pg.island_production_commission[arg_17_0.commissionId].slot
	arg_17_0.placeId = pg.island_production_slot[arg_17_0.slotId].place

	if arg_17_0.placeId == IslandProductConst.PasturePlaceId then
		IslandGuideChecker.CheckGuide("ISLAND_GUIDE_24")
	end

	arg_17_0.timeMgr = pg.TimeMgr.GetInstance()

	arg_17_0:HideDetailPanel()
	arg_17_0:Flush()
end

function var_0_0.Flush(arg_18_0)
	arg_18_0:FlushInfos()
	arg_18_0:StopTimer()
	arg_18_0:StartTimer()
end

function var_0_0.FlushInfos(arg_19_0)
	arg_19_0.slotData = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_19_0.placeId):GetDelegationSlotData(arg_19_0.slotId)

	local var_19_0 = pg.island_production_place[arg_19_0.placeId].name

	setText(arg_19_0.slotNameTF, var_19_0 .. "-" .. pg.island_production_commission[arg_19_0.commissionId].name)
	setActive(arg_19_0.lockSlot, not arg_19_0.slotData)
	setActive(arg_19_0.unlockSlot, arg_19_0.slotData)
	setActive(arg_19_0.addBtn, false)

	if not arg_19_0.slotData then
		return
	end

	if arg_19_0.slotData:CanStartDelegation() then
		setActive(arg_19_0.finishTF, false)
		setActive(arg_19_0.emptyAddShipTF, not arg_19_0.selectedShipId)
		setActive(arg_19_0.contentTF, arg_19_0.selectedShipId)
		setActive(arg_19_0.emptyBtn, not arg_19_0.selectedShipId)
		setActive(arg_19_0.processTF, arg_19_0.selectedShipId)
		setActive(arg_19_0.selectShipBtn, arg_19_0.selectedShipId)
		setActive(arg_19_0.selectFormulaBtn, arg_19_0.selectedShipId)
		setActive(arg_19_0.inprocessFormulaTF, false)

		if arg_19_0.selectedShipId then
			arg_19_0.showShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_19_0.selectedShipId)

			local var_19_1 = arg_19_0.showShip:GetCurrentEnergy()
			local var_19_2 = arg_19_0.showShip:GetMaxEnergy()

			setText(arg_19_0.energyTFText, var_19_1 .. "/" .. var_19_2)
			setSlider(arg_19_0.energySliderTF, 0, 1, var_19_1 / var_19_2)
			setText(arg_19_0.seletShipName, arg_19_0.showShip:GetName())

			local var_19_3 = IslandShip.StaticGetPrefab(arg_19_0.selectedShipId)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_19_3, "", arg_19_0.shipIconTF)
		end

		setActive(arg_19_0.stopBtn, false)
		setActive(arg_19_0.getBtn, false)
	else
		setActive(arg_19_0.contentTF, true)
		setActive(arg_19_0.emptyAddShipTF, false)
		setActive(arg_19_0.emptyBtn, false)
		setActive(arg_19_0.selectShipBtn, false)
		setActive(arg_19_0.selectFormulaBtn, false)

		local var_19_4 = arg_19_0.slotData:GetSlotRoleData()
		local var_19_5 = arg_19_0.slotData:GetSlotRewardData()
		local var_19_6 = not var_19_4 and var_19_5

		setActive(arg_19_0.processTF, not var_19_6)
		setActive(arg_19_0.finishTF, var_19_6)
		setActive(arg_19_0.getBtn, var_19_6)
		setActive(arg_19_0.stopBtn, not var_19_6)
		setActive(arg_19_0.inprocessFormulaTF, not var_19_6)

		if var_19_6 then
			local var_19_7 = var_19_5.formula_id
			local var_19_8 = pg.island_formula[var_19_7].commission_product
			local var_19_9 = var_19_8[1][1]
			local var_19_10 = var_19_5.formula_drop_list[1].num * var_19_8[1][2]
			local var_19_11 = Drop.New({
				count = 0,
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_19_9
			}):getConfigTable().icon

			GetImageSpriteFromAtlasAsync("island/" .. var_19_11, "", arg_19_0.canRewardIcon)

			local var_19_12 = "×" .. var_19_10
			local var_19_13 = var_19_5.main_num

			if var_19_13 and var_19_13 > 0 then
				var_19_12 = string.format("%s+%d", var_19_12, var_19_13)
			end

			setText(arg_19_0.canRewardNum, var_19_12)

			local var_19_14 = pg.island_formula[var_19_7].item_id
			local var_19_15 = pg.island_item_data_template[var_19_14]

			GetImageSpriteFromAtlasAsync("island/" .. var_19_15.icon, "", arg_19_0.finishFurmalaIcon)
		end

		if var_19_4 then
			arg_19_0.showShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_19_4.ship_id)

			local var_19_16 = arg_19_0.showShip:GetCurrentEnergy()
			local var_19_17 = arg_19_0.showShip:GetMaxEnergy()

			setText(arg_19_0.energyTFText, var_19_16 .. "/" .. var_19_17)
			setSlider(arg_19_0.energySliderTF, 0, 1, var_19_16 / var_19_17)
			setText(arg_19_0.seletShipName, arg_19_0.showShip:GetName())

			local var_19_18 = IslandShip.StaticGetPrefab(var_19_4.ship_id)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_19_18, "", arg_19_0.shipIconTF)

			local var_19_19 = var_19_4.formula_id
			local var_19_20 = pg.island_formula[var_19_19]
			local var_19_21 = var_19_20.commission_product[1][1]
			local var_19_22 = pg.island_item_data_template[var_19_21]
			local var_19_23 = Drop.New({
				count = 0,
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_19_21
			})

			onButton(arg_19_0, arg_19_0.currentFormulaIcon, function()
				arg_19_0.contextData:ShowMsgBox({
					title = i18n("island_word_desc"),
					type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
					dropData = var_19_23
				})
			end)
			GetImageSpriteFromAtlasAsync("island/" .. var_19_22.icon, "", arg_19_0.currentFormulaIcon)
			setText(arg_19_0.currentFormulaNum, "×" .. var_19_20.commission_product[1][2])

			local var_19_24 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

			if #var_19_20.second_product == 0 or not var_19_24:IsUnlcokSecondProduct(var_19_19) then
				setActive(arg_19_0.extraProduct, false)
			else
				setActive(arg_19_0.extraProduct, true)

				local var_19_25 = var_19_20.second_product_display
				local var_19_26 = var_19_25[1][1]
				local var_19_27 = pg.island_item_data_template[var_19_26]

				GetImageSpriteFromAtlasAsync("island/" .. var_19_27.icon, "", arg_19_0.extraProductIcon)
				setText(arg_19_0.extraProductName, var_19_27.name)
				setText(arg_19_0.extraProductNum, "×" .. var_19_25[1][2])

				local var_19_28 = Drop.New({
					count = 0,
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_19_26
				})

				onButton(arg_19_0, arg_19_0.extraProductIcon, function()
					arg_19_0.contextData:ShowMsgBox({
						title = i18n("island_word_desc"),
						type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
						dropData = var_19_28
					})
				end)
			end
		end
	end
end

function var_0_0.AfterShipSelect(arg_22_0, arg_22_1)
	arg_22_0.selectedShipId = arg_22_1

	arg_22_0:Flush()
	existCall(arg_22_0.loadCharacterFunc, arg_22_0.selectedShipId)
	arg_22_0:OpenFormulaSelectPage()
end

function var_0_0.OpenShipSelectPage(arg_23_0)
	local var_23_0 = pg.island_production_slot[arg_23_0.slotId].attribute

	arg_23_0:emit(IslandMediator.OPEN_PAGE, "IslandShipSelectPage", {
		{
			attrType = var_23_0,
			confirmFunc = function(arg_24_0)
				arg_23_0:AfterShipSelect(arg_24_0[1])
			end,
			placeId = arg_23_0.placeId
		}
	})
end

function var_0_0.OpenFormulaSelectPage(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	arg_25_0:emit(IslandMediator.OPEN_PAGE, "IslandFormulaSelectPage", {
		{
			commissionId = arg_25_0.commissionId,
			selectedShipId = arg_25_4 or arg_25_0.selectedShipId,
			unLoadCharacterFunc = arg_25_0.unLoadCharacterFunc,
			addDelegateFormula = arg_25_1,
			addDelegateFormulaTimes = arg_25_2,
			canRewardTime = arg_25_3,
			confirmFunc = function()
				if arg_25_0.contextData and arg_25_0.contextData.isPermanent then
					return
				end

				arg_25_0:Hide()
			end
		}
	})
	arg_25_0:HideDetailPanel()
end

function var_0_0.UpdateTime(arg_27_0)
	local var_27_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_27_0.placeId):GetDelegationSlotData(arg_27_0.slotId)

	if not var_27_0 then
		arg_27_0:FlushInfos()

		return
	end

	local var_27_1 = var_27_0:GetSlotRoleData()
	local var_27_2 = var_27_0:GetSlotRewardData()

	if not var_27_1 then
		arg_27_0:FlushInfos()

		return
	end

	local var_27_3 = var_27_1:GetFinishTime() - arg_27_0.timeMgr:GetServerTime()

	setText(arg_27_0.timeTF, arg_27_0.timeMgr:DescCDTime(var_27_3))
	setSlider(arg_27_0.roleDelegationSliderTF, 0, 1, 1 - var_27_3 / var_27_1:GetAllTime())

	local var_27_4 = var_27_1:CanRewardTimes()
	local var_27_5 = var_27_1.formula_id
	local var_27_6 = pg.island_formula[var_27_5]
	local var_27_7 = var_27_1:GetCurrentCanRewardExtraMainNum()
	local var_27_8 = "×" .. tostring(var_27_6.commission_product[1][2] * var_27_4)

	if var_27_7 and var_27_7 > 0 then
		var_27_8 = string.format("%s+%d", var_27_8, var_27_7)
	end

	setText(arg_27_0.canRewardNum, var_27_8)

	local var_27_9 = var_27_1:InCurrentTime()
	local var_27_10 = arg_27_0.timeMgr:GetServerTime() - var_27_1:InCurrentTimeStart(var_27_9)

	arg_27_0.formulaProcess.fillAmount = var_27_10 / var_27_1:CurrentTimeNeed(var_27_9)

	local var_27_11 = var_27_6.commission_product[1][1]
	local var_27_12 = pg.island_item_data_template[var_27_11]

	GetImageSpriteFromAtlasAsync("island/" .. var_27_12.icon, "", arg_27_0.canRewardIcon)

	local var_27_13 = var_27_1:LastTimes()

	setText(arg_27_0.currentFormulaLastNum, var_27_13)

	local var_27_14 = var_27_1:GetExtraMainProduct(var_27_9)
	local var_27_15 = "×" .. var_27_6.commission_product[1][2]

	if var_27_14 > 0 then
		var_27_15 = string.format("×(%s<color=#7df39f>+%d</color>)", var_27_6.commission_product[1][2], var_27_14)
	end

	setText(arg_27_0.currentFormulaNum, var_27_15)

	if #var_27_6.second_product > 0 and getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlcokSecondProduct(var_27_5) then
		local var_27_16 = var_27_1:GetExtraExtraProduct(var_27_9)
		local var_27_17 = "×" .. var_27_6.second_product_display[1][2]

		if var_27_16 > 0 then
			var_27_17 = string.format("×(%s<color=#7df39f>+%d</color>)", var_27_6.second_product_display[1][2], var_27_16)
		end

		setText(arg_27_0.extraProductNum, var_27_17)
	end

	if var_27_4 > 0 then
		setActive(arg_27_0.getBtn, true)
		setActive(arg_27_0.addBtn, false)
	else
		setActive(arg_27_0.addBtn, var_27_13 < 5)
		onButton(arg_27_0, arg_27_0.addBtn, function()
			arg_27_0:OpenFormulaSelectPage(var_27_5, var_27_13, var_27_4, var_27_1.ship_id)
		end, SFX_PANEL)
	end

	if #var_27_6.second_product == 0 then
		return
	end

	local var_27_18 = var_27_0:GetFromulaTatalCount(var_27_6.id) + var_27_4
	local var_27_19 = var_27_6.second_product[1]
	local var_27_20 = math.floor(var_27_18 / var_27_19)
	local var_27_21 = var_27_18 % var_27_19

	if var_27_21 ~= arg_27_0.extraProcess then
		arg_27_0.extraProcess = var_27_21

		arg_27_0.extraProductList:align(var_27_19)
	end

	local var_27_22 = math.floor((var_27_13 + var_27_21) / var_27_19)

	setText(arg_27_0.extraProductLastNum, "×" .. var_27_22)
end

function var_0_0.StartTimer(arg_29_0)
	arg_29_0.timer = Timer.New(function()
		arg_29_0:UpdateTime()
	end, 1, -1)

	arg_29_0.timer:Start()
	arg_29_0:UpdateTime()
end

function var_0_0.StopTimer(arg_31_0)
	if arg_31_0.timer ~= nil then
		arg_31_0.timer:Stop()

		arg_31_0.timer = nil
	end
end

function var_0_0.Hide(arg_32_0)
	arg_32_0.super.Hide(arg_32_0)
	arg_32_0:OnHide()
end

function var_0_0.OnHide(arg_33_0)
	arg_33_0:StopTimer()
end

function var_0_0.OnDestroy(arg_34_0)
	arg_34_0:OnHide()
end

return var_0_0
