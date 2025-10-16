local var_0_0 = class("IslandFormulaSelectPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFormulaSelectNewUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("top/back")
	arg_2_0.title = arg_2_0._tf:Find("top/title")
	arg_2_0.rightInfo = arg_2_0._tf:Find("rightInfo")
	arg_2_0.rightInfoEmpty = arg_2_0._tf:Find("rightInfo_empty")
	arg_2_0.currentformulaIcon = arg_2_0._tf:Find("rightInfo/formula/currentformula")
	arg_2_0.sureBtn = arg_2_0._tf:Find("rightInfo/sure")
	arg_2_0.formulaItem = arg_2_0._tf:Find("rightInfo/formula")
	arg_2_0.curCountTips = arg_2_0.formulaItem:Find("curCount")
	arg_2_0.addCountTips = arg_2_0.formulaItem:Find("addCount")
	arg_2_0.reduceBtn = arg_2_0.formulaItem:Find("limit/reduce")
	arg_2_0.addBtn = arg_2_0.formulaItem:Find("limit/add")
	arg_2_0.maxBtn = arg_2_0.formulaItem:Find("limit/max")
	arg_2_0.curCountNumSlider = arg_2_0.formulaItem:Find("limit/num_bg")
	arg_2_0.extraProduct = arg_2_0.formulaItem:Find("extra")
	arg_2_0.extraProductIcon = arg_2_0.extraProduct:Find("icon")
	arg_2_0.extraProductNum = arg_2_0.extraProductIcon:Find("product_count_bg/product_count")
	arg_2_0.extraProductName = arg_2_0.extraProduct:Find("Text")
	arg_2_0.extraProductAddnum = arg_2_0.extraProduct:Find("Text/addCount")
	arg_2_0.needTimeText = arg_2_0.sureBtn:Find("adapt/time/time_text")
	arg_2_0.barLimit = arg_2_0.formulaItem:Find("limit/hasLimit")
	arg_2_0.extraProductList = UIItemList.New(arg_2_0.extraProduct:Find("process"), arg_2_0.extraProduct:Find("process/item"))
	arg_2_0.uiList = UIItemList.New(arg_2_0._tf:Find("formulaView/content"), arg_2_0._tf:Find("formulaView/content/tpl"))
	arg_2_0.costuiList = UIItemList.New(arg_2_0._tf:Find("rightInfo/formula/needItem/content"), arg_2_0._tf:Find("rightInfo/formula/needItem/content/IslandItemTpl"))

	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_select_product"))
	setText(arg_2_0.formulaItem:Find("tips"), i18n("island_production_count"))

	arg_2_0.baseEffectSpeed = pg.island_set.base_efficiency.key_value_int
	arg_2_0.selectShipTf = arg_2_0.rightInfo:Find("selectShip")
	arg_2_0.selectShipName = arg_2_0.selectShipTf:Find("info/name")
	arg_2_0.selectShipLv = arg_2_0.selectShipTf:Find("info/lv")
	arg_2_0.selectShipIcon = arg_2_0.selectShipTf:Find("bg/icon")
	arg_2_0.skillTf = arg_2_0.selectShipTf:Find("skill")
	arg_2_0.skillInUse = arg_2_0.skillTf:Find("skillBg/skillTabBg/skill_bright")
	arg_2_0.skillUnUse = arg_2_0.skillTf:Find("skillBg/skillTabBg/skill_dark")
	arg_2_0.skillName = arg_2_0.skillTf:Find("skillBg/skillText"):GetComponent(typeof(Text))
	arg_2_0.energyBarTf = arg_2_0.selectShipTf:Find("ener_bar")
	arg_2_0.energyBarUseTf = arg_2_0.selectShipTf:Find("ener_bar_1")
	arg_2_0.energy_countTf = arg_2_0.selectShipTf:Find("energy_count")
	arg_2_0.enoughSureBg = arg_2_0.sureBtn:Find("okBg")
	arg_2_0.notenoughSureBg = arg_2_0.sureBtn:Find("notBg")
	arg_2_0.animationPlayer = arg_2_0.rightInfo:GetComponent(typeof(Animation))
	arg_2_0.addExpTF = arg_2_0.selectShipTf:Find("exp")
	arg_2_0.addExp = arg_2_0.selectShipTf:Find("exp/addExp")
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.RemoveListeners(arg_4_0)
	return
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_commission.tip
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		arg_5_0:Hide()
		existCall(arg_5_0.cancelFunc)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.reduceBtn, function()
		arg_5_0.curSelectCount = arg_5_0.curSelectCount - 1

		local var_8_0 = arg_5_0.addDelegateFormulaTimes and arg_5_0.addDelegateFormulaTimes + 1 or 1

		arg_5_0.curSelectCount = var_8_0 > arg_5_0.curSelectCount and var_8_0 or arg_5_0.curSelectCount

		arg_5_0:RefreshCost()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.addBtn, function()
		local var_9_0 = arg_5_0.curSelectCount + 1

		if arg_5_0.addDelegateFormulaTimes then
			local var_9_1 = arg_5_0:CheckCanAddMaxTimes() + arg_5_0.addDelegateFormulaTimes

			var_9_1 = var_9_1 > arg_5_0.productMaxTime and arg_5_0.productMaxTime or var_9_1
			var_9_0 = var_9_1 < var_9_0 and var_9_1 or var_9_0

			if var_9_0 < arg_5_0.addDelegateFormulaTimes + 1 then
				var_9_0 = arg_5_0.addDelegateFormulaTimes + 1
			end

			arg_5_0.curSelectCount = var_9_0
		else
			local var_9_2 = arg_5_0:CheckCanAddMaxTimes()

			arg_5_0.curSelectCount = var_9_2 < var_9_0 and var_9_2 or var_9_0

			if arg_5_0.curSelectCount < 1 then
				arg_5_0.curSelectCount = 1
			end
		end

		arg_5_0:RefreshCost()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.maxBtn, function()
		arg_5_0.curSelectCount = arg_5_0:CheckCanAddMaxTimes()

		if arg_5_0.curSelectCount < 1 then
			arg_5_0.curSelectCount = 1
		end

		arg_5_0:RefreshCost()
	end, SFX_PANEL)
	onSlider(arg_5_0, arg_5_0.curCountNumSlider, function(arg_11_0)
		if arg_5_0.addDelegateFormulaTimes then
			local var_11_0 = arg_5_0:CheckCanAddMaxTimes() + arg_5_0.addDelegateFormulaTimes

			var_11_0 = var_11_0 > arg_5_0.productMaxTime and arg_5_0.productMaxTime or var_11_0
			arg_11_0 = var_11_0 < arg_11_0 and var_11_0 or arg_11_0

			if arg_11_0 < arg_5_0.addDelegateFormulaTimes + 1 then
				arg_11_0 = arg_5_0.addDelegateFormulaTimes + 1
			end

			arg_5_0.curSelectCount = arg_11_0
		else
			local var_11_1 = arg_5_0:CheckCanAddMaxTimes()

			arg_5_0.curSelectCount = var_11_1 < arg_11_0 and var_11_1 or arg_11_0

			if arg_5_0.curSelectCount < 1 then
				arg_5_0.curSelectCount = 1
			end
		end

		arg_5_0:RefreshCost()
	end)
	onButton(arg_5_0, arg_5_0.skillTf, function()
		arg_5_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_SHIP_SKILL,
			skill = arg_5_0.selectedShip:GetSkill()
		})
	end, SFX_PANEL)
	arg_5_0.uiList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventInit then
			arg_5_0:InitFormulaItem(arg_13_1, arg_13_2)
		elseif arg_13_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateFormulaItem(arg_13_1, arg_13_2)
		end
	end)
	arg_5_0.costuiList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventInit then
			arg_5_0:InitCostItem(arg_14_1, arg_14_2)
		elseif arg_14_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateCostItem(arg_14_1, arg_14_2)
		end
	end)
	arg_5_0.extraProductList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventInit then
			-- block empty
		elseif arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_15_1 < arg_5_0.extraProcess

			setActive(arg_15_2:Find("inprocess"), var_15_0)
		end
	end)
end

function var_0_0.InitFormulaItem(arg_16_0, arg_16_1, arg_16_2)
	onButton(arg_16_0, arg_16_2, function()
		arg_16_0:OnSelectFormulaIndex(arg_16_1 + 1)
	end, SFX_PANEL)
end

function var_0_0.OnSelectFormulaIndex(arg_18_0, arg_18_1)
	arg_18_0.selectedIdx = arg_18_1
	arg_18_0.selectFormulaId = arg_18_0.formulaList[arg_18_0.selectedIdx]
	arg_18_0.formulaCfg = pg.island_formula[arg_18_0.selectFormulaId]
	arg_18_0.productMaxTime = arg_18_0.formulaCfg.production_limit
	arg_18_0.curSelectCount = arg_18_0.addDelegateFormulaTimes and arg_18_0.addDelegateFormulaTimes + 1 or 1

	arg_18_0.uiList:align(#arg_18_0.formulaList)
end

function var_0_0.UpdateFormulaItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_1 + 1
	local var_19_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_19_2 = arg_19_0.formulaList[arg_19_1 + 1]
	local var_19_3 = pg.island_formula[var_19_2]
	local var_19_4 = var_19_3.item_id
	local var_19_5 = var_19_1:GetItemById(var_19_4)
	local var_19_6 = var_19_5 and var_19_5:GetCount() or 0

	updateCustomDrop(arg_19_2, Drop.New({
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_19_4,
		count = var_19_6
	}))
	setActive(arg_19_2:Find("icon_bg/count_bg"), true)
	setText(arg_19_2:Find("name"), var_19_3.name)
	setText(arg_19_2:Find("icon_bg/product_count_bg/product_count"), "×" .. var_19_3.commission_product[1][2])
	setText(arg_19_2:Find("icon_bg/count_bg/count"), i18n("island_production_hold", var_19_6))

	if arg_19_0.selectedIdx == var_19_0 then
		arg_19_0:RefreshCurrentSelectFormula()
	end

	setActive(arg_19_2:Find("selected"), arg_19_0.selectedIdx == var_19_0)
end

function var_0_0.InitCostItem(arg_20_0, arg_20_1, arg_20_2)
	return
end

function var_0_0.UpdateCostItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.commission_Cost_List[arg_21_1 + 1]

	updateCustomDrop(arg_21_2, var_21_0)

	local var_21_1 = string.format("%d/%d", var_21_0.itemCount, var_21_0.costCount)

	setActive(arg_21_2:Find("icon_bg/count_bg"), true)
	setText(arg_21_2:Find("icon_bg/count_bg/count"), var_21_1)
end

function var_0_0.RefreshCurrentSelectFormula(arg_22_0)
	local var_22_0 = arg_22_0.formulaCfg.item_id
	local var_22_1 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_22_0
	})
	local var_22_2 = var_22_1:getConfigTable().rarity
	local var_22_3 = IslandItemRarity.Rarity2FrameName(var_22_2)
	local var_22_4 = var_22_1:getConfigTable().icon

	onButton(arg_22_0, arg_22_0.currentformulaIcon, function()
		arg_22_0:ShowMsgBox({
			title = i18n("island_word_desc"),
			type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
			dropData = var_22_1
		})
	end)
	GetImageSpriteFromAtlasAsync("island/islandframe", var_22_3, arg_22_0.currentformulaIcon:Find("icon_bg"))
	GetImageSpriteFromAtlasAsync("island/" .. var_22_4, "", arg_22_0.currentformulaIcon:Find("icon_bg/icon"))
	arg_22_0:RefreshCost()
end

function var_0_0.RefreshCost(arg_24_0)
	arg_24_0.commission_Cost_List = {}

	local var_24_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.formulaCfg.commission_cost) do
		local var_24_1 = iter_24_1[1]
		local var_24_2 = var_24_0:GetItemById(var_24_1)
		local var_24_3 = var_24_2 and var_24_2:GetCount() or 0
		local var_24_4 = arg_24_0.addDelegateFormulaTimes and arg_24_0.curSelectCount - arg_24_0.addDelegateFormulaTimes or arg_24_0.curSelectCount
		local var_24_5 = Drop.New({
			count = 0,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_24_1[1],
			itemCount = var_24_3,
			costCount = iter_24_1[2] * var_24_4
		})

		table.insert(arg_24_0.commission_Cost_List, var_24_5)
	end

	arg_24_0.costuiList:align(#arg_24_0.commission_Cost_List)
	arg_24_0:RefreshCurSelectCount()
	arg_24_0:RefreshShipEnergy()
	arg_24_0:RefreshCanStart()
end

function var_0_0.CheckCanAddMaxTimes(arg_25_0)
	arg_25_0.commission_Cost_List = {}

	local var_25_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_25_1 = arg_25_0.productMaxTime

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.formulaCfg.commission_cost) do
		local var_25_2 = iter_25_1[1]
		local var_25_3 = var_25_0:GetItemById(var_25_2)
		local var_25_4 = var_25_3 and var_25_3:GetCount() or 0
		local var_25_5 = iter_25_1[2]

		var_25_1 = math.min(var_25_1, math.floor(var_25_4 / var_25_5))
	end

	return (math.min(math.floor(arg_25_0.selectedShip:GetCurrentEnergy() / arg_25_0.formulaCfg.stamina_cost), var_25_1))
end

function var_0_0.RefreshCanStart(arg_26_0)
	local function var_26_0()
		for iter_27_0, iter_27_1 in ipairs(arg_26_0.commission_Cost_List) do
			if iter_27_1.costCount > iter_27_1.itemCount then
				return false
			end
		end

		return true
	end

	local function var_26_1()
		local var_28_0 = arg_26_0.addDelegateFormulaTimes and arg_26_0.curSelectCount - arg_26_0.addDelegateFormulaTimes or arg_26_0.curSelectCount

		if arg_26_0.formulaCfg.stamina_cost * var_28_0 > arg_26_0.selectedShip:GetCurrentEnergy() then
			return false
		end

		return true
	end

	local function var_26_2()
		local var_29_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_26_0.placeId)
		local var_29_1 = pg.island_production_slot[arg_26_0.slotId]
		local var_29_2 = var_29_1.exclusion_slot == "" and {} or var_29_1.exclusion_slot
		local var_29_3 = {}
		local var_29_4 = false

		for iter_29_0, iter_29_1 in ipairs(var_29_2) do
			if var_29_0:GetHandPlantSlotData(iter_29_1).state == 1 then
				var_29_4 = true

				table.insert(var_29_3, iter_29_1)
			end
		end

		return var_29_4, var_29_3
	end

	if var_26_0() and var_26_1() then
		setActive(arg_26_0.enoughSureBg, true)
		setActive(arg_26_0.notenoughSureBg, false)
		onButton(arg_26_0, arg_26_0.sureBtn, function()
			if arg_26_0.addDelegateFormula then
				arg_26_0.placeId = pg.island_production_slot[arg_26_0.slotId].place

				local var_30_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_26_0.placeId):GetDelegationSlotData(arg_26_0.slotId)

				if var_30_0 and not var_30_0:GetSlotRoleData() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_additional_production_tip2"))

					return
				end
			end

			local var_30_1 = arg_26_0.formulaToActivityDic[arg_26_0.selectFormulaId]

			if var_30_1 then
				local var_30_2 = getProxy(ActivityProxy):getActivityById(var_30_1)

				if not var_30_2 or var_30_2:isEnd() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_activity_expired"))

					return
				end
			end

			local var_30_3, var_30_4 = var_26_2()

			if var_30_3 then
				arg_26_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_production_manually_cancel"),
					onYes = function()
						pg.m02:sendNotification(GAME.ISLAND_STOP_HANDLE_PLANT_HALFWAY, {
							build_id = arg_26_0.placeId,
							slot_list = var_30_4
						})
						existCall(arg_26_0.unLoadCharacterFunc)

						if arg_26_0.addDelegateFormula then
							local var_31_0 = arg_26_0.curSelectCount - arg_26_0.addDelegateFormulaTimes

							arg_26_0:emit(IslandMediator.ADD_DELEGATION, arg_26_0.placeId, arg_26_0.slotId, var_31_0)
						else
							arg_26_0:emit(IslandMediator.START_DELEGATION, arg_26_0.placeId, arg_26_0.slotId, arg_26_0.selectedShipId, arg_26_0.selectFormulaId, arg_26_0.curSelectCount)
						end

						existCall(arg_26_0.confirmFunc)
						arg_26_0:Hide()
					end,
					onNo = function()
						return
					end
				})

				return
			end

			existCall(arg_26_0.unLoadCharacterFunc)

			if arg_26_0.addDelegateFormula then
				local var_30_5 = arg_26_0.curSelectCount - arg_26_0.addDelegateFormulaTimes

				arg_26_0:emit(IslandMediator.ADD_DELEGATION, arg_26_0.placeId, arg_26_0.slotId, var_30_5)
			else
				arg_26_0:emit(IslandMediator.START_DELEGATION, arg_26_0.placeId, arg_26_0.slotId, arg_26_0.selectedShipId, arg_26_0.selectFormulaId, arg_26_0.curSelectCount)
			end

			existCall(arg_26_0.confirmFunc)
			arg_26_0:Hide()
		end, SFX_PANEL)
	else
		setActive(arg_26_0.enoughSureBg, false)
		setActive(arg_26_0.notenoughSureBg, true)
		onButton(arg_26_0, arg_26_0.sureBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_cost_notenough"))
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_34_0, arg_34_1)
	arg_34_0:BlurPanel()

	arg_34_0.commissionId = arg_34_1.commissionId
	arg_34_0.selectedShipId = arg_34_1.selectedShipId
	arg_34_0.cancelFunc = arg_34_1.cancelFunc
	arg_34_0.confirmFunc = arg_34_1.confirmFunc
	arg_34_0.unLoadCharacterFunc = arg_34_1.unLoadCharacterFunc
	arg_34_0.addDelegateFormula = arg_34_1.addDelegateFormula
	arg_34_0.addDelegateFormulaTimes = arg_34_1.addDelegateFormulaTimes
	arg_34_0.canRewardTime = arg_34_1.canRewardTime

	setActive(arg_34_0.addExpTF, arg_34_0.selectedShipId ~= 1)

	if arg_34_0.addDelegateFormulaTimes then
		setActive(arg_34_0.barLimit, true)

		local var_34_0 = arg_34_0.addDelegateFormulaTimes / 5 * 352.6

		arg_34_0.barLimit.sizeDelta = Vector2(var_34_0, 22)

		setActive(arg_34_0.addCountTips, true)
	else
		setActive(arg_34_0.barLimit, false)
		setActive(arg_34_0.addCountTips, false)
	end

	local var_34_1 = arg_34_0.addDelegateFormulaTimes and i18n("island_additional_production_tip1") or i18n("island_production_start")

	setText(arg_34_0.sureBtn:Find("adapt/time/Text"), var_34_1)

	arg_34_0.slotId = pg.island_production_commission[arg_34_0.commissionId].slot
	arg_34_0.placeId = pg.island_production_slot[arg_34_0.slotId].place
	arg_34_0.selectedShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_34_0.selectedShipId)

	arg_34_0:InitUnlockedFormulaList()

	if #arg_34_0.formulaList > 0 then
		arg_34_0.uiList:align(#arg_34_0.formulaList)
		setActive(arg_34_0.rightInfo, true)
		setActive(arg_34_0.rightInfoEmpty, false)
		arg_34_0:OnSelectFormulaIndex(1)
	else
		arg_34_0.uiList:align(#arg_34_0.formulaList)
		setActive(arg_34_0.rightInfo, false)
		setActive(arg_34_0.rightInfoEmpty, true)
	end

	arg_34_0:RefreshShip()
end

function var_0_0.RefreshShip(arg_35_0)
	local var_35_0 = IslandShip.StaticGetPrefab(arg_35_0.selectedShipId)

	GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_35_0, "", arg_35_0.selectShipIcon)
	setText(arg_35_0.selectShipName, arg_35_0.selectedShip:GetName())
	setText(arg_35_0.selectShipLv, string.format("-Lv.%d", arg_35_0.selectedShip:GetLevel()))

	local var_35_1 = arg_35_0.selectedShip:GetSkill()
	local var_35_2 = var_35_1:IsEffectiveInPlace(arg_35_0.placeId)

	setActive(arg_35_0.skillInUse, var_35_2)
	setActive(arg_35_0.skillUnUse, not var_35_2)
	setActive(arg_35_0.skillUnUse, not var_35_2)

	arg_35_0.skillName.text = string.format("%s - %s", var_35_1:GetName(), "Lv." .. var_35_1:GetLevel() .. "")
end

function var_0_0.RefreshShipEnergy(arg_36_0)
	local var_36_0 = arg_36_0.addDelegateFormulaTimes and arg_36_0.curSelectCount - arg_36_0.addDelegateFormulaTimes or arg_36_0.curSelectCount
	local var_36_1 = arg_36_0.formulaCfg.stamina_cost * var_36_0

	if arg_36_0.selectedShipId == 1 then
		var_36_1 = 0
	else
		arg_36_0.animationPlayer:Play("anim_IslandFormulaSelectNewUI_bar_Loop")
	end

	setText(arg_36_0.addExp, "EXP+" .. arg_36_0.formulaCfg.ship_exp * var_36_0)

	if arg_36_0.eneryTimer then
		arg_36_0.eneryTimer:Stop()
	end

	arg_36_0.eneryTimer = Timer.New(function()
		local var_37_0 = arg_36_0.selectedShip:GetCurrentEnergy()
		local var_37_1 = arg_36_0.selectedShip:GetMaxEnergy()

		setSlider(arg_36_0.energyBarTf, 0, 1, (var_37_0 - var_36_1) / var_37_1)
		setSlider(arg_36_0.energyBarUseTf, 0, 1, var_37_0 / var_37_1)
		setText(arg_36_0.energy_countTf, string.format("%d-<color=#f7c35f>%d</color>/%d", var_37_0, var_36_1, var_37_1))
	end, 1, -1)

	arg_36_0.eneryTimer:Start()
	arg_36_0.eneryTimer.func()
end

function var_0_0.InitUnlockedFormulaList(arg_38_0)
	arg_38_0.formulaList = {}
	arg_38_0.formulaToActivityDic = {}

	if arg_38_0.addDelegateFormula then
		table.insert(arg_38_0.formulaList, arg_38_0.addDelegateFormula)

		return
	end

	local var_38_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_38_0, iter_38_1 in ipairs(pg.island_production_slot[arg_38_0.slotId].activity_formula or {}) do
		local var_38_1 = iter_38_1[1]
		local var_38_2 = iter_38_1[2]
		local var_38_3 = getProxy(ActivityProxy):getActivityById(var_38_1)

		if var_38_3 and not var_38_3:isEnd() then
			for iter_38_2, iter_38_3 in ipairs(var_38_2 or {}) do
				if pg.island_formula[iter_38_3].unlock_type == 0 or var_38_0:IsUnlockFormuate(iter_38_3) then
					table.insert(arg_38_0.formulaList, iter_38_3)

					arg_38_0.formulaToActivityDic[iter_38_3] = var_38_1
				end
			end
		end
	end

	for iter_38_4, iter_38_5 in ipairs(pg.island_production_slot[arg_38_0.slotId].formula or {}) do
		local var_38_4 = pg.island_formula[iter_38_5].unlock_type == 0
		local var_38_5 = pg.island_formula[iter_38_5].unlock_type == -1
		local var_38_6 = true

		if var_38_5 then
			local var_38_7 = pg.island_combo[iter_38_5].unlock_condition
			local var_38_8 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetFormulaNums()

			for iter_38_6, iter_38_7 in ipairs(var_38_7) do
				local var_38_9 = iter_38_7[1]
				local var_38_10 = iter_38_7[2]

				if not var_38_8[var_38_9] or var_38_10 > var_38_8[var_38_9] then
					var_38_6 = false

					break
				end
			end
		end

		if var_38_4 or var_38_0:IsUnlockFormuate(iter_38_5) or var_38_5 and var_38_6 then
			table.insert(arg_38_0.formulaList, iter_38_5)
		end
	end
end

function var_0_0.RefreshCurSelectCount(arg_39_0)
	local var_39_0 = arg_39_0.addDelegateFormulaTimes or arg_39_0.curSelectCount

	setText(arg_39_0.curCountTips, tostring(var_39_0))

	local var_39_1 = arg_39_0.addDelegateFormulaTimes and arg_39_0.curSelectCount - arg_39_0.addDelegateFormulaTimes or 0

	setText(arg_39_0.addCountTips, "+" .. var_39_1)
	setSlider(arg_39_0.curCountNumSlider, 1, arg_39_0.productMaxTime, arg_39_0.curSelectCount)
	arg_39_0:RefreshExtraProduct()
	setText(arg_39_0.currentformulaIcon:Find("icon_bg/product_count_bg/product_count"), "×" .. arg_39_0.formulaCfg.commission_product[1][2])

	local var_39_2 = arg_39_0:CacaluteProductTime()
	local var_39_3 = 0

	for iter_39_0, iter_39_1 in ipairs(var_39_2) do
		var_39_3 = var_39_3 + iter_39_1
	end

	setText(arg_39_0.needTimeText, pg.TimeMgr.GetInstance():DescCDTime(var_39_3))
end

function var_0_0.RefreshExtraProduct(arg_40_0)
	local var_40_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	if #arg_40_0.formulaCfg.second_product == 0 or not var_40_0:IsUnlcokSecondProduct(arg_40_0.selectFormulaId) then
		setActive(arg_40_0.extraProduct, false)

		return
	end

	setActive(arg_40_0.extraProduct, true)

	local var_40_1 = arg_40_0.formulaCfg.second_product_display[1][1]
	local var_40_2 = arg_40_0.formulaCfg.second_product_display[1][2]
	local var_40_3 = pg.island_item_data_template[var_40_1]
	local var_40_4 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_40_1
	})

	onButton(arg_40_0, arg_40_0.extraProductIcon, function()
		arg_40_0:ShowMsgBox({
			title = i18n("island_word_desc"),
			type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
			dropData = var_40_4
		})
	end)
	GetImageSpriteFromAtlasAsync("island/" .. var_40_3.icon, "", arg_40_0.extraProductIcon)
	setText(arg_40_0.extraProductNum, "×" .. var_40_2)

	local var_40_5 = pg.island_production_slot[arg_40_0.slotId].place
	local var_40_6 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_40_5):GetDelegationSlotData(arg_40_0.slotId):GetFromulaTatalCount(arg_40_0.formulaCfg.id)
	local var_40_7 = arg_40_0.formulaCfg.second_product[1]
	local var_40_8 = (var_40_6 + (arg_40_0.canRewardTime or 0)) % var_40_7
	local var_40_9 = var_40_8 + (arg_40_0.addDelegateFormulaTimes and arg_40_0.curSelectCount - arg_40_0.addDelegateFormulaTimes or arg_40_0.curSelectCount)
	local var_40_10 = math.floor(var_40_9 / var_40_7)

	arg_40_0.extraProcess = var_40_9 % var_40_7

	setText(arg_40_0.extraProductName, var_40_3.name .. "×" .. var_40_10)

	if arg_40_0.addDelegateFormulaTimes then
		setActive(arg_40_0.extraProductAddnum, true)

		local var_40_11 = arg_40_0.curSelectCount - arg_40_0.addDelegateFormulaTimes
		local var_40_12 = math.floor((var_40_8 + var_40_11) / var_40_7)

		setText(arg_40_0.extraProductAddnum, "+" .. var_40_12)
	else
		setActive(arg_40_0.extraProductAddnum, false)
	end

	arg_40_0.extraProductList:align(var_40_7)
end

function var_0_0.CacaluteProductTime(arg_42_0)
	local var_42_0 = arg_42_0.addDelegateFormulaTimes and arg_42_0.curSelectCount - arg_42_0.addDelegateFormulaTimes or arg_42_0.curSelectCount

	return IslandProductTimeHelper.CalculateTimeToProductFormula(arg_42_0.selectedShipId, arg_42_0.selectFormulaId, var_42_0, arg_42_0.placeId, arg_42_0.slotId)
end

function var_0_0.CheckInPlace(arg_43_0, arg_43_1, arg_43_2)
	for iter_43_0, iter_43_1 in ipairs(arg_43_2) do
		if iter_43_1 == arg_43_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetAttrGrade(arg_44_0, arg_44_1)
	local var_44_0 = pg.island_chara_att.all[#pg.island_chara_att.all]

	for iter_44_0, iter_44_1 in ipairs(pg.island_chara_att.all) do
		local var_44_1 = pg.island_chara_att[iter_44_1]
		local var_44_2 = var_44_1.range[1]
		local var_44_3 = var_44_1.range[2]

		if var_44_2 <= arg_44_1 and arg_44_1 <= var_44_3 then
			var_44_0 = iter_44_1

			break
		end
	end

	return var_44_0
end

function var_0_0.GetAttrGrowingValueByBuff(arg_45_0, arg_45_1, arg_45_2)
	for iter_45_0, iter_45_1 in ipairs(arg_45_2) do
		if iter_45_1[1] == arg_45_1 then
			return iter_45_1[2]
		end
	end

	return 0
end

function var_0_0.OnHide(arg_46_0)
	arg_46_0:UnBlurPanel()

	if arg_46_0.eneryTimer then
		arg_46_0.eneryTimer:Stop()
	end
end

function var_0_0.OnDisable(arg_47_0)
	arg_47_0:OnHide()
end

function var_0_0.OnDestroy(arg_48_0)
	return
end

function var_0_0.Show(arg_49_0, ...)
	arg_49_0:AddListeners()
	arg_49_0.islandUIController:Show(true)
	arg_49_0:OnShow(...)
end

function var_0_0.Hide(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = defaultValue(arg_50_1, true)

	local function var_50_1()
		arg_50_0:ClosePage(arg_50_0)
		arg_50_0:RemoveListeners()
		arg_50_0:OnHide()

		if not arg_50_2 then
			arg_50_0:OnExit()
		end
	end

	if var_50_0 then
		arg_50_0.islandUIController:Hide(true, var_50_1)
	else
		var_50_1()
	end
end

return var_0_0
