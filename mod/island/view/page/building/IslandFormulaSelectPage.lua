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
		if arg_5_0.addDelegateFormulaTimes then
			local var_10_0 = arg_5_0:CheckCanAddMaxTimes() + arg_5_0.addDelegateFormulaTimes

			arg_5_0.curSelectCount = var_10_0 > arg_5_0.productMaxTime and arg_5_0.productMaxTime or var_10_0

			if arg_5_0.curSelectCount < 1 then
				arg_5_0.curSelectCount = 1
			end
		else
			arg_5_0.curSelectCount = arg_5_0:CheckCanAddMaxTimes()

			if arg_5_0.curSelectCount < 1 then
				arg_5_0.curSelectCount = 1
			end
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
	setScrollTextWithSize(arg_19_2:Find("name"), arg_19_2:Find("scroll_name/name"), var_19_3.name, 6)
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

	if var_21_0.extraCostCount and var_21_0.extraCostCount > 0 then
		var_21_1 = string.format("%d/(%d<color=#ffae22>+%d</color>)", var_21_0.itemCount, var_21_0.costCount, var_21_0.extraCostCount)
	end

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

function var_0_0.GetAniExtraGainByConfigName(arg_24_0, arg_24_1)
	local var_24_0 = 0

	if arg_24_0.placeId ~= IslandProductConst.PasturePlaceId then
		return var_24_0
	end

	local var_24_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_24_0.placeId):GetDelegationSlotData(arg_24_0.slotId):GetPartList()

	for iter_24_0, iter_24_1 in ipairs(var_24_1) do
		var_24_0 = var_24_0 + pg.island_ranch_animal[iter_24_1][arg_24_1]
	end

	return var_24_0
end

function var_0_0.RefreshCost(arg_25_0)
	arg_25_0.commission_Cost_List = {}

	local var_25_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_25_1 = arg_25_0:GetAniExtraGainByConfigName("efficiency_cost")

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.formulaCfg.commission_cost) do
		local var_25_2 = iter_25_1[1]
		local var_25_3 = var_25_0:GetItemById(var_25_2)
		local var_25_4 = var_25_3 and var_25_3:GetCount() or 0
		local var_25_5 = arg_25_0.addDelegateFormulaTimes and arg_25_0.curSelectCount - arg_25_0.addDelegateFormulaTimes or arg_25_0.curSelectCount
		local var_25_6 = Drop.New({
			count = 0,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_25_1[1],
			itemCount = var_25_4,
			costCount = iter_25_1[2] * var_25_5,
			extraCostCount = var_25_1 * var_25_5
		})

		table.insert(arg_25_0.commission_Cost_List, var_25_6)
	end

	arg_25_0.costuiList:align(#arg_25_0.commission_Cost_List)
	arg_25_0:RefreshCurSelectCount()
	arg_25_0:RefreshShipEnergy()
	arg_25_0:RefreshCanStart()
end

function var_0_0.CheckCanAddMaxTimes(arg_26_0)
	arg_26_0.commission_Cost_List = {}

	local var_26_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_26_1 = arg_26_0.productMaxTime
	local var_26_2 = arg_26_0:GetAniExtraGainByConfigName("efficiency_cost")

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.formulaCfg.commission_cost) do
		local var_26_3 = iter_26_1[1]
		local var_26_4 = var_26_0:GetItemById(var_26_3)
		local var_26_5 = var_26_4 and var_26_4:GetCount() or 0
		local var_26_6 = iter_26_1[2] + var_26_2

		var_26_1 = math.min(var_26_1, math.floor(var_26_5 / var_26_6))
	end

	return (math.min(math.floor(arg_26_0.selectedShip:GetCurrentEnergy() / arg_26_0.formulaCfg.stamina_cost), var_26_1))
end

function var_0_0.RefreshCanStart(arg_27_0)
	local function var_27_0()
		for iter_28_0, iter_28_1 in ipairs(arg_27_0.commission_Cost_List) do
			if iter_28_1.costCount + iter_28_1.extraCostCount > iter_28_1.itemCount then
				return false
			end
		end

		return true
	end

	local function var_27_1()
		local var_29_0 = arg_27_0.addDelegateFormulaTimes and arg_27_0.curSelectCount - arg_27_0.addDelegateFormulaTimes or arg_27_0.curSelectCount

		if arg_27_0.formulaCfg.stamina_cost * var_29_0 > arg_27_0.selectedShip:GetCurrentEnergy() then
			return false
		end

		return true
	end

	local function var_27_2()
		local var_30_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_27_0.placeId)
		local var_30_1 = pg.island_production_slot[arg_27_0.slotId]
		local var_30_2 = var_30_1.exclusion_slot == "" and {} or var_30_1.exclusion_slot
		local var_30_3 = {}
		local var_30_4 = false

		for iter_30_0, iter_30_1 in ipairs(var_30_2) do
			if var_30_0:GetHandPlantSlotData(iter_30_1).state == 1 then
				var_30_4 = true

				table.insert(var_30_3, iter_30_1)
			end
		end

		return var_30_4, var_30_3
	end

	if var_27_0() and var_27_1() then
		setActive(arg_27_0.enoughSureBg, true)
		setActive(arg_27_0.notenoughSureBg, false)
		onButton(arg_27_0, arg_27_0.sureBtn, function()
			if arg_27_0.addDelegateFormula then
				arg_27_0.placeId = pg.island_production_slot[arg_27_0.slotId].place

				local var_31_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_27_0.placeId):GetDelegationSlotData(arg_27_0.slotId)

				if var_31_0 and not var_31_0:GetSlotRoleData() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_additional_production_tip2"))

					return
				end
			end

			local var_31_1 = arg_27_0.formulaToActivityDic[arg_27_0.selectFormulaId]

			if var_31_1 then
				local var_31_2 = getProxy(ActivityProxy):getActivityById(var_31_1)

				if not var_31_2 or var_31_2:isEnd() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_activity_expired"))

					return
				end
			end

			local var_31_3, var_31_4 = var_27_2()

			if var_31_3 then
				arg_27_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_production_manually_cancel"),
					onYes = function()
						pg.m02:sendNotification(GAME.ISLAND_STOP_HANDLE_PLANT_HALFWAY, {
							build_id = arg_27_0.placeId,
							slot_list = var_31_4
						})
						existCall(arg_27_0.unLoadCharacterFunc)

						local var_32_0 = arg_27_0:GetAniExtraGainByConfigName("efficiency_cost")

						if arg_27_0.addDelegateFormula then
							local var_32_1 = arg_27_0.curSelectCount - arg_27_0.addDelegateFormulaTimes

							arg_27_0:emit(IslandMediator.ADD_DELEGATION, arg_27_0.placeId, arg_27_0.slotId, var_32_1, var_32_0)
						else
							arg_27_0:emit(IslandMediator.START_DELEGATION, arg_27_0.placeId, arg_27_0.slotId, arg_27_0.selectedShipId, arg_27_0.selectFormulaId, arg_27_0.curSelectCount, var_32_0)
						end

						existCall(arg_27_0.confirmFunc)
						arg_27_0:Hide()
					end,
					onNo = function()
						return
					end
				})

				return
			end

			existCall(arg_27_0.unLoadCharacterFunc)

			local var_31_5 = arg_27_0:GetAniExtraGainByConfigName("efficiency_cost")

			if arg_27_0.addDelegateFormula then
				local var_31_6 = arg_27_0.curSelectCount - arg_27_0.addDelegateFormulaTimes

				arg_27_0:emit(IslandMediator.ADD_DELEGATION, arg_27_0.placeId, arg_27_0.slotId, var_31_6, var_31_5)
			else
				arg_27_0:emit(IslandMediator.START_DELEGATION, arg_27_0.placeId, arg_27_0.slotId, arg_27_0.selectedShipId, arg_27_0.selectFormulaId, arg_27_0.curSelectCount, var_31_5)
			end

			existCall(arg_27_0.confirmFunc)
			arg_27_0:Hide()
		end, SFX_PANEL)
	else
		setActive(arg_27_0.enoughSureBg, false)
		setActive(arg_27_0.notenoughSureBg, true)
		onButton(arg_27_0, arg_27_0.sureBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_cost_notenough"))
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_35_0, arg_35_1)
	arg_35_0:BlurPanel()

	arg_35_0.commissionId = arg_35_1.commissionId
	arg_35_0.selectedShipId = arg_35_1.selectedShipId
	arg_35_0.cancelFunc = arg_35_1.cancelFunc
	arg_35_0.confirmFunc = arg_35_1.confirmFunc
	arg_35_0.unLoadCharacterFunc = arg_35_1.unLoadCharacterFunc
	arg_35_0.addDelegateFormula = arg_35_1.addDelegateFormula
	arg_35_0.addDelegateFormulaTimes = arg_35_1.addDelegateFormulaTimes
	arg_35_0.canRewardTime = arg_35_1.canRewardTime

	setActive(arg_35_0.addExpTF, arg_35_0.selectedShipId ~= 1)

	if arg_35_0.addDelegateFormulaTimes then
		setActive(arg_35_0.barLimit, true)

		local var_35_0 = pg.island_formula[arg_35_0.addDelegateFormula].production_limit or 5
		local var_35_1 = arg_35_0.addDelegateFormulaTimes / var_35_0 * 352.6

		arg_35_0.barLimit.sizeDelta = Vector2(var_35_1, 22)

		setActive(arg_35_0.addCountTips, true)
	else
		setActive(arg_35_0.barLimit, false)
		setActive(arg_35_0.addCountTips, false)
	end

	local var_35_2 = arg_35_0.addDelegateFormulaTimes and i18n("island_additional_production_tip1") or i18n("island_production_start")

	setText(arg_35_0.sureBtn:Find("adapt/time/Text"), var_35_2)

	arg_35_0.slotId = pg.island_production_commission[arg_35_0.commissionId].slot
	arg_35_0.placeId = pg.island_production_slot[arg_35_0.slotId].place
	arg_35_0.selectedShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_35_0.selectedShipId)

	arg_35_0:InitUnlockedFormulaList()

	if #arg_35_0.formulaList > 0 then
		arg_35_0.uiList:align(#arg_35_0.formulaList)
		setActive(arg_35_0.rightInfo, true)
		setActive(arg_35_0.rightInfoEmpty, false)
		arg_35_0:OnSelectFormulaIndex(1)
	else
		arg_35_0.uiList:align(#arg_35_0.formulaList)
		setActive(arg_35_0.rightInfo, false)
		setActive(arg_35_0.rightInfoEmpty, true)
	end

	arg_35_0:RefreshShip()
end

function var_0_0.RefreshShip(arg_36_0)
	local var_36_0 = IslandShip.StaticGetPrefab(arg_36_0.selectedShipId)

	GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_36_0, "", arg_36_0.selectShipIcon)
	setText(arg_36_0.selectShipName, arg_36_0.selectedShip:GetName())
	setText(arg_36_0.selectShipLv, string.format("-Lv.%d", arg_36_0.selectedShip:GetLevel()))

	local var_36_1 = arg_36_0.selectedShip:GetSkill()
	local var_36_2 = var_36_1:IsEffectiveInPlace(arg_36_0.placeId)

	setActive(arg_36_0.skillInUse, var_36_2)
	setActive(arg_36_0.skillUnUse, not var_36_2)
	setActive(arg_36_0.skillUnUse, not var_36_2)

	arg_36_0.skillName.text = string.format("%s - %s", var_36_1:GetName(), "Lv." .. var_36_1:GetLevel() .. "")
end

function var_0_0.RefreshShipEnergy(arg_37_0)
	local var_37_0 = arg_37_0.addDelegateFormulaTimes and arg_37_0.curSelectCount - arg_37_0.addDelegateFormulaTimes or arg_37_0.curSelectCount
	local var_37_1 = arg_37_0.formulaCfg.stamina_cost * var_37_0

	if arg_37_0.selectedShipId == 1 then
		var_37_1 = 0
	else
		arg_37_0.animationPlayer:Play("anim_IslandFormulaSelectNewUI_bar_Loop")
	end

	setText(arg_37_0.addExp, "EXP+" .. arg_37_0.formulaCfg.ship_exp * var_37_0)

	if arg_37_0.eneryTimer then
		arg_37_0.eneryTimer:Stop()
	end

	arg_37_0.eneryTimer = Timer.New(function()
		local var_38_0 = arg_37_0.selectedShip:GetCurrentEnergy()
		local var_38_1 = arg_37_0.selectedShip:GetMaxEnergy()

		setSlider(arg_37_0.energyBarTf, 0, 1, (var_38_0 - var_37_1) / var_38_1)
		setSlider(arg_37_0.energyBarUseTf, 0, 1, var_38_0 / var_38_1)
		setText(arg_37_0.energy_countTf, string.format("%d-<color=#f7c35f>%d</color>/%d", var_38_0, var_37_1, var_38_1))
	end, 1, -1)

	arg_37_0.eneryTimer:Start()
	arg_37_0.eneryTimer.func()
end

function var_0_0.InitUnlockedFormulaList(arg_39_0)
	arg_39_0.formulaList = {}
	arg_39_0.formulaToActivityDic = {}

	if arg_39_0.addDelegateFormula then
		table.insert(arg_39_0.formulaList, arg_39_0.addDelegateFormula)

		return
	end

	local var_39_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_39_0, iter_39_1 in ipairs(pg.island_production_slot[arg_39_0.slotId].activity_formula or {}) do
		local var_39_1 = iter_39_1[1]
		local var_39_2 = iter_39_1[2]
		local var_39_3 = getProxy(ActivityProxy):getActivityById(var_39_1)

		if var_39_3 and not var_39_3:isEnd() then
			for iter_39_2, iter_39_3 in ipairs(var_39_2 or {}) do
				if pg.island_formula[iter_39_3].unlock_type == 0 or var_39_0:IsUnlockFormuate(iter_39_3) then
					table.insert(arg_39_0.formulaList, iter_39_3)

					arg_39_0.formulaToActivityDic[iter_39_3] = var_39_1
				end
			end
		end
	end

	for iter_39_4, iter_39_5 in ipairs(pg.island_production_slot[arg_39_0.slotId].formula or {}) do
		local var_39_4 = pg.island_formula[iter_39_5].unlock_type == 0
		local var_39_5 = pg.island_formula[iter_39_5].unlock_type == -1
		local var_39_6 = true

		if var_39_5 then
			local var_39_7 = pg.island_combo[iter_39_5].unlock_condition
			local var_39_8 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetFormulaNums()

			for iter_39_6, iter_39_7 in ipairs(var_39_7) do
				local var_39_9 = iter_39_7[1]
				local var_39_10 = iter_39_7[2]

				if not var_39_8[var_39_9] or var_39_10 > var_39_8[var_39_9] then
					var_39_6 = false

					break
				end
			end
		end

		if var_39_4 or var_39_0:IsUnlockFormuate(iter_39_5) or var_39_5 and var_39_6 then
			table.insert(arg_39_0.formulaList, iter_39_5)
		end
	end
end

function var_0_0.RefreshCurSelectCount(arg_40_0)
	local var_40_0 = arg_40_0.addDelegateFormulaTimes or arg_40_0.curSelectCount

	setText(arg_40_0.curCountTips, tostring(var_40_0))

	local var_40_1 = arg_40_0.addDelegateFormulaTimes and arg_40_0.curSelectCount - arg_40_0.addDelegateFormulaTimes or 0

	setText(arg_40_0.addCountTips, "+" .. var_40_1)
	setSlider(arg_40_0.curCountNumSlider, 1, arg_40_0.productMaxTime, arg_40_0.curSelectCount)
	arg_40_0:RefreshExtraProduct()

	local var_40_2 = "×" .. arg_40_0.formulaCfg.commission_product[1][2]
	local var_40_3 = arg_40_0:GetAniExtraGainByConfigName("efficiency_gains_num")

	if var_40_3 > 0 then
		var_40_2 = string.format("×(%s<color=#7df39f>+%d</color>)", arg_40_0.formulaCfg.commission_product[1][2], var_40_3)
	end

	setText(arg_40_0.currentformulaIcon:Find("icon_bg/product_count_bg/product_count"), var_40_2 .. i18n("island_production_tip"))

	local var_40_4, var_40_5 = arg_40_0:CacaluteProductTime()
	local var_40_6 = 0

	for iter_40_0, iter_40_1 in ipairs(var_40_4) do
		var_40_6 = var_40_6 + iter_40_1
	end

	local var_40_7 = var_40_5 - var_40_6
	local var_40_8 = pg.TimeMgr.GetInstance():DescCDTime(var_40_6)

	if var_40_7 > 0 then
		var_40_8 = string.format("%s(<color=#7df39f>-%s</color>)", var_40_8, pg.TimeMgr.GetInstance():DescCDTime(var_40_7))
	end

	setText(arg_40_0.needTimeText, var_40_8)
end

function var_0_0.RefreshExtraProduct(arg_41_0)
	local var_41_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	if #arg_41_0.formulaCfg.second_product == 0 or not var_41_0:IsUnlcokSecondProduct(arg_41_0.selectFormulaId) then
		setActive(arg_41_0.extraProduct, false)

		return
	end

	setActive(arg_41_0.extraProduct, true)

	local var_41_1 = arg_41_0.formulaCfg.second_product_display[1][1]
	local var_41_2 = arg_41_0.formulaCfg.second_product_display[1][2]
	local var_41_3 = pg.island_item_data_template[var_41_1]
	local var_41_4 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_41_1
	})

	onButton(arg_41_0, arg_41_0.extraProductIcon, function()
		arg_41_0:ShowMsgBox({
			title = i18n("island_word_desc"),
			type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
			dropData = var_41_4
		})
	end)
	GetImageSpriteFromAtlasAsync("island/" .. var_41_3.icon, "", arg_41_0.extraProductIcon)

	local var_41_5 = "×" .. var_41_2
	local var_41_6 = arg_41_0:GetAniExtraGainByConfigName("efficiency_gains_bonus_num")

	if var_41_6 > 0 then
		var_41_5 = string.format("×(%s<color=#7df39f>+%d</color>)", var_41_2, var_41_6)
	end

	setText(arg_41_0.extraProductNum, var_41_5 .. i18n("island_production_tip"))
	setText(arg_41_0.currentformulaIcon:Find("icon_bg/product_count_bg/product_count"), curCountStr)

	local var_41_7 = pg.island_production_slot[arg_41_0.slotId].place
	local var_41_8 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_41_7):GetDelegationSlotData(arg_41_0.slotId):GetFromulaTatalCount(arg_41_0.formulaCfg.id)
	local var_41_9 = arg_41_0.formulaCfg.second_product[1]
	local var_41_10 = (var_41_8 + (arg_41_0.canRewardTime or 0)) % var_41_9
	local var_41_11 = var_41_10 + (arg_41_0.addDelegateFormulaTimes and arg_41_0.curSelectCount - arg_41_0.addDelegateFormulaTimes or arg_41_0.curSelectCount)
	local var_41_12 = math.floor(var_41_11 / var_41_9)

	arg_41_0.extraProcess = var_41_11 % var_41_9

	setText(arg_41_0.extraProductName, var_41_3.name .. "×" .. var_41_12)

	if arg_41_0.addDelegateFormulaTimes then
		setActive(arg_41_0.extraProductAddnum, true)

		local var_41_13 = arg_41_0.curSelectCount - arg_41_0.addDelegateFormulaTimes
		local var_41_14 = math.floor((var_41_10 + var_41_13) / var_41_9)

		setText(arg_41_0.extraProductAddnum, "+" .. var_41_14)
	else
		setActive(arg_41_0.extraProductAddnum, false)
	end

	arg_41_0.extraProductList:align(var_41_9)
end

function var_0_0.CacaluteProductTime(arg_43_0)
	local var_43_0 = arg_43_0.addDelegateFormulaTimes and arg_43_0.curSelectCount - arg_43_0.addDelegateFormulaTimes or arg_43_0.curSelectCount
	local var_43_1 = pg.island_set.base_efficiency.key_value_int
	local var_43_2 = math.ceil(arg_43_0.formulaCfg.workload / var_43_1)

	return IslandProductTimeHelper.CalculateTimeToProductFormula(arg_43_0.selectedShipId, arg_43_0.selectFormulaId, var_43_0, arg_43_0.placeId, arg_43_0.slotId), var_43_2 * var_43_0
end

function var_0_0.CheckInPlace(arg_44_0, arg_44_1, arg_44_2)
	for iter_44_0, iter_44_1 in ipairs(arg_44_2) do
		if iter_44_1 == arg_44_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetAttrGrade(arg_45_0, arg_45_1)
	local var_45_0 = pg.island_chara_att.all[#pg.island_chara_att.all]

	for iter_45_0, iter_45_1 in ipairs(pg.island_chara_att.all) do
		local var_45_1 = pg.island_chara_att[iter_45_1]
		local var_45_2 = var_45_1.range[1]
		local var_45_3 = var_45_1.range[2]

		if var_45_2 <= arg_45_1 and arg_45_1 <= var_45_3 then
			var_45_0 = iter_45_1

			break
		end
	end

	return var_45_0
end

function var_0_0.GetAttrGrowingValueByBuff(arg_46_0, arg_46_1, arg_46_2)
	for iter_46_0, iter_46_1 in ipairs(arg_46_2) do
		if iter_46_1[1] == arg_46_1 then
			return iter_46_1[2]
		end
	end

	return 0
end

function var_0_0.OnHide(arg_47_0)
	arg_47_0:UnBlurPanel()

	if arg_47_0.eneryTimer then
		arg_47_0.eneryTimer:Stop()
	end
end

function var_0_0.OnDisable(arg_48_0)
	arg_48_0:OnHide()
end

function var_0_0.OnDestroy(arg_49_0)
	arg_49_0:OnHide()
end

function var_0_0.Show(arg_50_0, ...)
	arg_50_0:AddListeners()
	arg_50_0.islandUIController:Show(true)
	arg_50_0:OnShow(...)
end

function var_0_0.Hide(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = defaultValue(arg_51_1, true)

	local function var_51_1()
		arg_51_0:ClosePage(arg_51_0)
		arg_51_0:RemoveListeners()
		arg_51_0:OnHide()

		if not arg_51_2 then
			arg_51_0:OnExit()
		end
	end

	if var_51_0 then
		arg_51_0.islandUIController:Hide(true, var_51_1)
	else
		var_51_1()
	end
end

return var_0_0
