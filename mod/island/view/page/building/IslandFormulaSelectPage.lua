local var_0_0 = class("IslandFormulaSelectPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFormulaSelectNewUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("top/back")
	arg_2_0.title = arg_2_0:findTF("top/title")
	arg_2_0.rightInfo = arg_2_0:findTF("rightInfo")
	arg_2_0.rightInfoEmpty = arg_2_0:findTF("rightInfo_empty")
	arg_2_0.currentformulaIcon = arg_2_0:findTF("rightInfo/formula/currentformula")
	arg_2_0.sureBtn = arg_2_0:findTF("rightInfo/sure")
	arg_2_0.formulaItem = arg_2_0:findTF("rightInfo/formula")
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
	arg_2_0.uiList = UIItemList.New(arg_2_0:findTF("formulaView/content"), arg_2_0:findTF("formulaView/content/tpl"))
	arg_2_0.costuiList = UIItemList.New(arg_2_0:findTF("rightInfo/formula/needItem/content"), arg_2_0:findTF("rightInfo/formula/needItem/content/IslandItemTpl"))

	setText(arg_2_0:findTF("top/title/Text"), i18n("island_select_product"))
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
	onButton(arg_5_0, arg_5_0.backBtn, function()
		arg_5_0:Hide()
		existCall(arg_5_0.cancelFunc)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.reduceBtn, function()
		arg_5_0.curSelectCount = arg_5_0.curSelectCount - 1

		local var_7_0 = arg_5_0.addDelegateFormulaTimes and arg_5_0.addDelegateFormulaTimes + 1 or 1

		arg_5_0.curSelectCount = var_7_0 > arg_5_0.curSelectCount and var_7_0 or arg_5_0.curSelectCount

		arg_5_0:RefreshCost()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.addBtn, function()
		local var_8_0 = arg_5_0.curSelectCount + 1

		if arg_5_0.addDelegateFormulaTimes then
			local var_8_1 = arg_5_0:CheckCanAddMaxTimes() + arg_5_0.addDelegateFormulaTimes

			var_8_1 = var_8_1 > arg_5_0.productMaxTime and arg_5_0.productMaxTime or var_8_1
			var_8_0 = var_8_1 < var_8_0 and var_8_1 or var_8_0

			if var_8_0 < arg_5_0.addDelegateFormulaTimes + 1 then
				var_8_0 = arg_5_0.addDelegateFormulaTimes + 1
			end

			arg_5_0.curSelectCount = var_8_0
		else
			local var_8_2 = arg_5_0:CheckCanAddMaxTimes()

			arg_5_0.curSelectCount = var_8_2 < var_8_0 and var_8_2 or var_8_0

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
	onSlider(arg_5_0, arg_5_0.curCountNumSlider, function(arg_10_0)
		if arg_5_0.addDelegateFormulaTimes then
			local var_10_0 = arg_5_0:CheckCanAddMaxTimes() + arg_5_0.addDelegateFormulaTimes

			var_10_0 = var_10_0 > arg_5_0.productMaxTime and arg_5_0.productMaxTime or var_10_0
			arg_10_0 = var_10_0 < arg_10_0 and var_10_0 or arg_10_0

			if arg_10_0 < arg_5_0.addDelegateFormulaTimes + 1 then
				arg_10_0 = arg_5_0.addDelegateFormulaTimes + 1
			end

			arg_5_0.curSelectCount = arg_10_0
		else
			local var_10_1 = arg_5_0:CheckCanAddMaxTimes()

			arg_5_0.curSelectCount = var_10_1 < arg_10_0 and var_10_1 or arg_10_0

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
	arg_5_0.uiList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventInit then
			arg_5_0:InitFormulaItem(arg_12_1, arg_12_2)
		elseif arg_12_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateFormulaItem(arg_12_1, arg_12_2)
		end
	end)
	arg_5_0.costuiList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventInit then
			arg_5_0:InitCostItem(arg_13_1, arg_13_2)
		elseif arg_13_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateCostItem(arg_13_1, arg_13_2)
		end
	end)
	arg_5_0.extraProductList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventInit then
			-- block empty
		elseif arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_14_1 < arg_5_0.extraProcess

			setActive(arg_14_2:Find("inprocess"), var_14_0)
		end
	end)
end

function var_0_0.InitFormulaItem(arg_15_0, arg_15_1, arg_15_2)
	onButton(arg_15_0, arg_15_2, function()
		arg_15_0:OnSelectFormulaIndex(arg_15_1 + 1)
	end, SFX_PANEL)
end

function var_0_0.OnSelectFormulaIndex(arg_17_0, arg_17_1)
	arg_17_0.selectedIdx = arg_17_1
	arg_17_0.selectFormulaId = arg_17_0.formulaList[arg_17_0.selectedIdx]
	arg_17_0.formulaCfg = pg.island_formula[arg_17_0.selectFormulaId]
	arg_17_0.productMaxTime = arg_17_0.formulaCfg.production_limit
	arg_17_0.curSelectCount = arg_17_0.addDelegateFormulaTimes and arg_17_0.addDelegateFormulaTimes + 1 or 1

	arg_17_0.uiList:align(#arg_17_0.formulaList)
end

function var_0_0.UpdateFormulaItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_1 + 1
	local var_18_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_18_2 = arg_18_0.formulaList[arg_18_1 + 1]
	local var_18_3 = pg.island_formula[var_18_2]
	local var_18_4 = var_18_3.item_id
	local var_18_5 = var_18_1:GetItemById(var_18_4)
	local var_18_6 = var_18_5 and var_18_5:GetCount() or 0

	updateCustomDrop(arg_18_2, Drop.New({
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_18_4,
		count = var_18_6
	}))
	setActive(arg_18_0:findTF("icon_bg/count_bg", arg_18_2), true)
	setText(arg_18_0:findTF("name", arg_18_2), var_18_3.name)
	setText(arg_18_0:findTF("icon_bg/product_count_bg/product_count", arg_18_2), "×" .. var_18_3.commission_product[1][2])
	setText(arg_18_0:findTF("icon_bg/count_bg/count", arg_18_2), i18n("island_production_hold", var_18_6))

	if arg_18_0.selectedIdx == var_18_0 then
		arg_18_0:RefreshCurrentSelectFormula()
	end

	setActive(arg_18_0:findTF("selected", arg_18_2), arg_18_0.selectedIdx == var_18_0)
end

function var_0_0.InitCostItem(arg_19_0, arg_19_1, arg_19_2)
	return
end

function var_0_0.UpdateCostItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.commission_Cost_List[arg_20_1 + 1]

	updateCustomDrop(arg_20_2, var_20_0)

	local var_20_1 = string.format("%d/%d", var_20_0.itemCount, var_20_0.costCount)

	setActive(arg_20_0:findTF("icon_bg/count_bg", arg_20_2), true)
	setText(arg_20_2:Find("icon_bg/count_bg/count"), var_20_1)
end

function var_0_0.RefreshCurrentSelectFormula(arg_21_0)
	local var_21_0 = arg_21_0.formulaCfg.item_id
	local var_21_1 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_21_0
	})
	local var_21_2 = var_21_1:getConfigTable().rarity
	local var_21_3 = IslandItemRarity.Rarity2FrameName(var_21_2)
	local var_21_4 = var_21_1:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/islandframe", var_21_3, arg_21_0.currentformulaIcon:Find("icon_bg"))
	GetImageSpriteFromAtlasAsync("island/" .. var_21_4, "", arg_21_0.currentformulaIcon:Find("icon_bg/icon"))
	arg_21_0:RefreshCost()
end

function var_0_0.RefreshCost(arg_22_0)
	arg_22_0.commission_Cost_List = {}

	local var_22_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.formulaCfg.commission_cost) do
		local var_22_1 = iter_22_1[1]
		local var_22_2 = var_22_0:GetItemById(var_22_1)
		local var_22_3 = var_22_2 and var_22_2:GetCount() or 0
		local var_22_4 = arg_22_0.addDelegateFormulaTimes and arg_22_0.curSelectCount - arg_22_0.addDelegateFormulaTimes or arg_22_0.curSelectCount
		local var_22_5 = Drop.New({
			count = 0,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_22_1[1],
			itemCount = var_22_3,
			costCount = iter_22_1[2] * var_22_4
		})

		table.insert(arg_22_0.commission_Cost_List, var_22_5)
	end

	arg_22_0.costuiList:align(#arg_22_0.commission_Cost_List)
	arg_22_0:RefreshCurSelectCount()
	arg_22_0:RefreshShipEnergy()
	arg_22_0:RefreshCanStart()
end

function var_0_0.CheckCanAddMaxTimes(arg_23_0)
	arg_23_0.commission_Cost_List = {}

	local var_23_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_23_1 = arg_23_0.productMaxTime

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.formulaCfg.commission_cost) do
		local var_23_2 = iter_23_1[1]
		local var_23_3 = var_23_0:GetItemById(var_23_2)
		local var_23_4 = var_23_3 and var_23_3:GetCount() or 0
		local var_23_5 = iter_23_1[2]

		var_23_1 = math.min(var_23_1, math.floor(var_23_4 / var_23_5))
	end

	return (math.min(math.floor(arg_23_0.selectedShip:GetCurrentEnergy() / arg_23_0.formulaCfg.stamina_cost), var_23_1))
end

function var_0_0.RefreshCanStart(arg_24_0)
	local function var_24_0()
		for iter_25_0, iter_25_1 in ipairs(arg_24_0.commission_Cost_List) do
			if iter_25_1.costCount > iter_25_1.itemCount then
				return false
			end
		end

		return true
	end

	local function var_24_1()
		local var_26_0 = arg_24_0.addDelegateFormulaTimes and arg_24_0.curSelectCount - arg_24_0.addDelegateFormulaTimes or arg_24_0.curSelectCount

		if arg_24_0.formulaCfg.stamina_cost * var_26_0 > arg_24_0.selectedShip:GetCurrentEnergy() then
			return false
		end

		return true
	end

	local function var_24_2()
		local var_27_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_24_0.placeId)
		local var_27_1 = pg.island_production_slot[arg_24_0.slotId]
		local var_27_2 = var_27_1.exclusion_slot == "" and {} or var_27_1.exclusion_slot
		local var_27_3 = {}
		local var_27_4 = false

		for iter_27_0, iter_27_1 in ipairs(var_27_2) do
			if var_27_0:GetHandPlantSlotData(iter_27_1).state == 1 then
				var_27_4 = true

				table.insert(var_27_3, iter_27_1)
			end
		end

		return var_27_4, var_27_3
	end

	if var_24_0() and var_24_1() then
		setActive(arg_24_0.enoughSureBg, true)
		setActive(arg_24_0.notenoughSureBg, false)
		onButton(arg_24_0, arg_24_0.sureBtn, function()
			if arg_24_0.addDelegateFormula then
				arg_24_0.placeId = pg.island_production_slot[arg_24_0.slotId].place

				local var_28_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_24_0.placeId):GetDelegationSlotData(arg_24_0.slotId)

				if var_28_0 and not var_28_0:GetSlotRoleData() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_additional_production_tip2"))

					return
				end
			end

			local var_28_1 = arg_24_0.formulaToActivityDic[arg_24_0.selectFormulaId]

			if var_28_1 then
				local var_28_2 = getProxy(ActivityProxy):getActivityById(var_28_1)

				if not var_28_2 or var_28_2:isEnd() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_activity_expired"))

					return
				end
			end

			local var_28_3, var_28_4 = var_24_2()

			if var_28_3 then
				arg_24_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_production_manually_cancel"),
					onYes = function()
						pg.m02:sendNotification(GAME.ISLAND_STOP_HANDLE_PLANT_HALFWAY, {
							build_id = arg_24_0.placeId,
							slot_list = var_28_4
						})
					end,
					onNo = function()
						return
					end
				})

				return
			end

			existCall(arg_24_0.unLoadCharacterFunc)

			if arg_24_0.addDelegateFormula then
				local var_28_5 = arg_24_0.curSelectCount - arg_24_0.addDelegateFormulaTimes

				arg_24_0:emit(IslandMediator.ADD_DELEGATION, arg_24_0.placeId, arg_24_0.slotId, var_28_5)
			else
				arg_24_0:emit(IslandMediator.START_DELEGATION, arg_24_0.placeId, arg_24_0.slotId, arg_24_0.selectedShipId, arg_24_0.selectFormulaId, arg_24_0.curSelectCount)
			end

			existCall(arg_24_0.confirmFunc)
			arg_24_0:Hide()
		end, SFX_PANEL)
	else
		setActive(arg_24_0.enoughSureBg, false)
		setActive(arg_24_0.notenoughSureBg, true)
		onButton(arg_24_0, arg_24_0.sureBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_cost_notenough"))
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_32_0, arg_32_1)
	arg_32_0:BlurPanel()

	arg_32_0.commissionId = arg_32_1.commissionId
	arg_32_0.selectedShipId = arg_32_1.selectedShipId
	arg_32_0.cancelFunc = arg_32_1.cancelFunc
	arg_32_0.confirmFunc = arg_32_1.confirmFunc
	arg_32_0.unLoadCharacterFunc = arg_32_1.unLoadCharacterFunc
	arg_32_0.addDelegateFormula = arg_32_1.addDelegateFormula
	arg_32_0.addDelegateFormulaTimes = arg_32_1.addDelegateFormulaTimes
	arg_32_0.canRewardTime = arg_32_1.canRewardTime

	setActive(arg_32_0.addExpTF, arg_32_0.selectedShipId ~= 1)

	if arg_32_0.addDelegateFormulaTimes then
		setActive(arg_32_0.barLimit, true)

		local var_32_0 = arg_32_0.addDelegateFormulaTimes / 5 * 352.6

		arg_32_0.barLimit.sizeDelta = Vector2(var_32_0, 22)

		setActive(arg_32_0.addCountTips, true)
	else
		setActive(arg_32_0.barLimit, false)
		setActive(arg_32_0.addCountTips, false)
	end

	local var_32_1 = arg_32_0.addDelegateFormulaTimes and i18n("island_additional_production_tip1") or i18n("island_production_start")

	setText(arg_32_0.sureBtn:Find("adapt/time/Text"), var_32_1)

	arg_32_0.slotId = pg.island_production_commission[arg_32_0.commissionId].slot
	arg_32_0.placeId = pg.island_production_slot[arg_32_0.slotId].place
	arg_32_0.selectedShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_32_0.selectedShipId)

	arg_32_0:InitUnlockedFormulaList()

	if #arg_32_0.formulaList > 0 then
		arg_32_0.uiList:align(#arg_32_0.formulaList)
		setActive(arg_32_0.rightInfo, true)
		setActive(arg_32_0.rightInfoEmpty, false)
		arg_32_0:OnSelectFormulaIndex(1)
	else
		arg_32_0.uiList:align(#arg_32_0.formulaList)
		setActive(arg_32_0.rightInfo, false)
		setActive(arg_32_0.rightInfoEmpty, true)
	end

	arg_32_0:RefreshShip()
end

function var_0_0.RefreshShip(arg_33_0)
	local var_33_0 = IslandShip.StaticGetPrefab(arg_33_0.selectedShipId)

	GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_33_0, "", arg_33_0.selectShipIcon)
	setText(arg_33_0.selectShipName, arg_33_0.selectedShip:GetName())
	setText(arg_33_0.selectShipLv, string.format("-Lv.%d", arg_33_0.selectedShip:GetLevel()))

	local var_33_1 = arg_33_0.selectedShip:GetSkill()
	local var_33_2 = var_33_1:IsEffectiveInPlace(arg_33_0.placeId)

	setActive(arg_33_0.skillInUse, var_33_2)
	setActive(arg_33_0.skillUnUse, not var_33_2)
	setActive(arg_33_0.skillUnUse, not var_33_2)

	arg_33_0.skillName.text = string.format("%s - %s", var_33_1:GetName(), "Lv." .. var_33_1:GetLevel() .. "")
end

function var_0_0.RefreshShipEnergy(arg_34_0)
	local var_34_0 = arg_34_0.addDelegateFormulaTimes and arg_34_0.curSelectCount - arg_34_0.addDelegateFormulaTimes or arg_34_0.curSelectCount
	local var_34_1 = arg_34_0.formulaCfg.stamina_cost * var_34_0

	if arg_34_0.selectedShipId == 1 then
		var_34_1 = 0
	else
		arg_34_0.animationPlayer:Play("anim_IslandFormulaSelectNewUI_bar_Loop")
	end

	setText(arg_34_0.addExp, "EXP+" .. arg_34_0.formulaCfg.ship_exp * var_34_0)

	if arg_34_0.eneryTimer then
		arg_34_0.eneryTimer:Stop()
	end

	arg_34_0.eneryTimer = Timer.New(function()
		local var_35_0 = arg_34_0.selectedShip:GetCurrentEnergy()
		local var_35_1 = arg_34_0.selectedShip:GetMaxEnergy()

		setSlider(arg_34_0.energyBarTf, 0, 1, (var_35_0 - var_34_1) / var_35_1)
		setSlider(arg_34_0.energyBarUseTf, 0, 1, var_35_0 / var_35_1)
		setText(arg_34_0.energy_countTf, string.format("%d-<color=#f7c35f>%d</color>/%d", var_35_0, var_34_1, var_35_1))
	end, 1, -1)

	arg_34_0.eneryTimer:Start()
	arg_34_0.eneryTimer.func()
end

function var_0_0.InitUnlockedFormulaList(arg_36_0)
	arg_36_0.formulaList = {}
	arg_36_0.formulaToActivityDic = {}

	if arg_36_0.addDelegateFormula then
		table.insert(arg_36_0.formulaList, arg_36_0.addDelegateFormula)

		return
	end

	local var_36_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_36_0, iter_36_1 in ipairs(pg.island_production_slot[arg_36_0.slotId].activity_formula or {}) do
		local var_36_1 = iter_36_1[1]
		local var_36_2 = iter_36_1[2]
		local var_36_3 = getProxy(ActivityProxy):getActivityById(var_36_1)

		if var_36_3 and not var_36_3:isEnd() then
			for iter_36_2, iter_36_3 in ipairs(var_36_2 or {}) do
				if pg.island_formula[iter_36_3].unlock_type == 0 or var_36_0:IsUnlockFormuate(iter_36_3) then
					table.insert(arg_36_0.formulaList, iter_36_3)

					arg_36_0.formulaToActivityDic[iter_36_3] = var_36_1
				end
			end
		end
	end

	for iter_36_4, iter_36_5 in ipairs(pg.island_production_slot[arg_36_0.slotId].formula or {}) do
		local var_36_4 = pg.island_formula[iter_36_5].unlock_type == 0
		local var_36_5 = pg.island_formula[iter_36_5].unlock_type == -1
		local var_36_6 = true

		if var_36_5 then
			local var_36_7 = pg.island_combo[iter_36_5].unlock_condition
			local var_36_8 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetFormulaNums()

			for iter_36_6, iter_36_7 in ipairs(var_36_7) do
				local var_36_9 = iter_36_7[1]
				local var_36_10 = iter_36_7[2]

				if not var_36_8[var_36_9] or var_36_10 > var_36_8[var_36_9] then
					var_36_6 = false

					break
				end
			end
		end

		if var_36_4 or var_36_0:IsUnlockFormuate(iter_36_5) or var_36_5 and var_36_6 then
			table.insert(arg_36_0.formulaList, iter_36_5)
		end
	end
end

function var_0_0.RefreshCurSelectCount(arg_37_0)
	local var_37_0 = arg_37_0.addDelegateFormulaTimes or arg_37_0.curSelectCount

	setText(arg_37_0.curCountTips, tostring(var_37_0))

	local var_37_1 = arg_37_0.addDelegateFormulaTimes and arg_37_0.curSelectCount - arg_37_0.addDelegateFormulaTimes or 0

	setText(arg_37_0.addCountTips, "+" .. var_37_1)
	setSlider(arg_37_0.curCountNumSlider, 1, arg_37_0.productMaxTime, arg_37_0.curSelectCount)
	arg_37_0:RefreshExtraProduct()
	setText(arg_37_0.currentformulaIcon:Find("icon_bg/product_count_bg/product_count"), "×" .. arg_37_0.formulaCfg.commission_product[1][2])

	local var_37_2 = arg_37_0:CacaluteProductTime()
	local var_37_3 = 0

	for iter_37_0, iter_37_1 in ipairs(var_37_2) do
		var_37_3 = var_37_3 + iter_37_1
	end

	setText(arg_37_0.needTimeText, pg.TimeMgr.GetInstance():DescCDTime(var_37_3))
end

function var_0_0.RefreshExtraProduct(arg_38_0)
	local var_38_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	if #arg_38_0.formulaCfg.second_product == 0 or not var_38_0:IsUnlcokSecondProduct(arg_38_0.selectFormulaId) then
		setActive(arg_38_0.extraProduct, false)

		return
	end

	setActive(arg_38_0.extraProduct, true)

	local var_38_1 = arg_38_0.formulaCfg.second_product_display[1][1]
	local var_38_2 = arg_38_0.formulaCfg.second_product_display[1][2]
	local var_38_3 = pg.island_item_data_template[var_38_1]

	GetImageSpriteFromAtlasAsync("island/" .. var_38_3.icon, "", arg_38_0.extraProductIcon)
	setText(arg_38_0.extraProductNum, "×" .. var_38_2)

	local var_38_4 = pg.island_production_slot[arg_38_0.slotId].place
	local var_38_5 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_38_4):GetDelegationSlotData(arg_38_0.slotId):GetFromulaTatalCount(arg_38_0.formulaCfg.id)
	local var_38_6 = arg_38_0.formulaCfg.second_product[1]
	local var_38_7 = (var_38_5 + (arg_38_0.canRewardTime or 0)) % var_38_6
	local var_38_8 = var_38_7 + (arg_38_0.addDelegateFormulaTimes and arg_38_0.curSelectCount - arg_38_0.addDelegateFormulaTimes or arg_38_0.curSelectCount)
	local var_38_9 = math.floor(var_38_8 / var_38_6)

	arg_38_0.extraProcess = var_38_8 % var_38_6

	setText(arg_38_0.extraProductName, var_38_3.name .. "×" .. var_38_9)

	if arg_38_0.addDelegateFormulaTimes then
		setActive(arg_38_0.extraProductAddnum, true)

		local var_38_10 = arg_38_0.curSelectCount - arg_38_0.addDelegateFormulaTimes
		local var_38_11 = math.floor((var_38_7 + var_38_10) / var_38_6)

		setText(arg_38_0.extraProductAddnum, "+" .. var_38_11)
	else
		setActive(arg_38_0.extraProductAddnum, false)
	end

	arg_38_0.extraProductList:align(var_38_6)
end

function var_0_0.CacaluteProductTime(arg_39_0)
	local var_39_0 = arg_39_0.addDelegateFormulaTimes and arg_39_0.curSelectCount - arg_39_0.addDelegateFormulaTimes or arg_39_0.curSelectCount

	return IslandProductTimeHelper.CalculateTimeToProductFormula(arg_39_0.selectedShipId, arg_39_0.selectFormulaId, var_39_0, arg_39_0.placeId, arg_39_0.slotId)
end

function var_0_0.CheckInPlace(arg_40_0, arg_40_1, arg_40_2)
	for iter_40_0, iter_40_1 in ipairs(arg_40_2) do
		if iter_40_1 == arg_40_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetAttrGrade(arg_41_0, arg_41_1)
	local var_41_0 = pg.island_chara_att.all[#pg.island_chara_att.all]

	for iter_41_0, iter_41_1 in ipairs(pg.island_chara_att.all) do
		local var_41_1 = pg.island_chara_att[iter_41_1]
		local var_41_2 = var_41_1.range[1]
		local var_41_3 = var_41_1.range[2]

		if var_41_2 <= arg_41_1 and arg_41_1 <= var_41_3 then
			var_41_0 = iter_41_1

			break
		end
	end

	return var_41_0
end

function var_0_0.GetAttrGrowingValueByBuff(arg_42_0, arg_42_1, arg_42_2)
	for iter_42_0, iter_42_1 in ipairs(arg_42_2) do
		if iter_42_1[1] == arg_42_1 then
			return iter_42_1[2]
		end
	end

	return 0
end

function var_0_0.OnHide(arg_43_0)
	arg_43_0:UnBlurPanel()

	if arg_43_0.eneryTimer then
		arg_43_0.eneryTimer:Stop()
	end
end

function var_0_0.OnDisable(arg_44_0)
	arg_44_0:OnHide()
end

function var_0_0.OnDestroy(arg_45_0)
	return
end

function var_0_0.Show(arg_46_0, ...)
	arg_46_0:AddListeners()
	arg_46_0.islandUIController:Show(true)
	arg_46_0:OnShow(...)
end

function var_0_0.Hide(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = defaultValue(arg_47_1, true)

	local function var_47_1()
		arg_47_0:ClosePage(arg_47_0)
		arg_47_0:RemoveListeners()
		arg_47_0:OnHide()

		if not arg_47_2 then
			arg_47_0:OnExit()
		end
	end

	if var_47_0 then
		arg_47_0.islandUIController:Hide(true, var_47_1)
	else
		var_47_1()
	end
end

return var_0_0
