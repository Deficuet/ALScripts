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
	setActive(arg_19_0:findTF("icon_bg/count_bg", arg_19_2), true)
	setText(arg_19_0:findTF("name", arg_19_2), var_19_3.name)
	setText(arg_19_0:findTF("icon_bg/product_count_bg/product_count", arg_19_2), "×" .. var_19_3.commission_product[1][2])
	setText(arg_19_0:findTF("icon_bg/count_bg/count", arg_19_2), i18n("island_production_hold", var_19_6))

	if arg_19_0.selectedIdx == var_19_0 then
		arg_19_0:RefreshCurrentSelectFormula()
	end

	setActive(arg_19_0:findTF("selected", arg_19_2), arg_19_0.selectedIdx == var_19_0)
end

function var_0_0.InitCostItem(arg_20_0, arg_20_1, arg_20_2)
	return
end

function var_0_0.UpdateCostItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.commission_Cost_List[arg_21_1 + 1]

	updateCustomDrop(arg_21_2, var_21_0)

	local var_21_1 = string.format("%d/%d", var_21_0.itemCount, var_21_0.costCount)

	setActive(arg_21_0:findTF("icon_bg/count_bg", arg_21_2), true)
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

	GetImageSpriteFromAtlasAsync("island/islandframe", var_22_3, arg_22_0.currentformulaIcon:Find("icon_bg"))
	GetImageSpriteFromAtlasAsync("island/" .. var_22_4, "", arg_22_0.currentformulaIcon:Find("icon_bg/icon"))
	arg_22_0:RefreshCost()
end

function var_0_0.RefreshCost(arg_23_0)
	arg_23_0.commission_Cost_List = {}

	local var_23_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.formulaCfg.commission_cost) do
		local var_23_1 = iter_23_1[1]
		local var_23_2 = var_23_0:GetItemById(var_23_1)
		local var_23_3 = var_23_2 and var_23_2:GetCount() or 0
		local var_23_4 = arg_23_0.addDelegateFormulaTimes and arg_23_0.curSelectCount - arg_23_0.addDelegateFormulaTimes or arg_23_0.curSelectCount
		local var_23_5 = Drop.New({
			count = 0,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_23_1[1],
			itemCount = var_23_3,
			costCount = iter_23_1[2] * var_23_4
		})

		table.insert(arg_23_0.commission_Cost_List, var_23_5)
	end

	arg_23_0.costuiList:align(#arg_23_0.commission_Cost_List)
	arg_23_0:RefreshCurSelectCount()
	arg_23_0:RefreshShipEnergy()
	arg_23_0:RefreshCanStart()
end

function var_0_0.CheckCanAddMaxTimes(arg_24_0)
	arg_24_0.commission_Cost_List = {}

	local var_24_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_24_1 = arg_24_0.productMaxTime

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.formulaCfg.commission_cost) do
		local var_24_2 = iter_24_1[1]
		local var_24_3 = var_24_0:GetItemById(var_24_2)
		local var_24_4 = var_24_3 and var_24_3:GetCount() or 0
		local var_24_5 = iter_24_1[2]

		var_24_1 = math.min(var_24_1, math.floor(var_24_4 / var_24_5))
	end

	return (math.min(math.floor(arg_24_0.selectedShip:GetCurrentEnergy() / arg_24_0.formulaCfg.stamina_cost), var_24_1))
end

function var_0_0.RefreshCanStart(arg_25_0)
	local function var_25_0()
		for iter_26_0, iter_26_1 in ipairs(arg_25_0.commission_Cost_List) do
			if iter_26_1.costCount > iter_26_1.itemCount then
				return false
			end
		end

		return true
	end

	local function var_25_1()
		local var_27_0 = arg_25_0.addDelegateFormulaTimes and arg_25_0.curSelectCount - arg_25_0.addDelegateFormulaTimes or arg_25_0.curSelectCount

		if arg_25_0.formulaCfg.stamina_cost * var_27_0 > arg_25_0.selectedShip:GetCurrentEnergy() then
			return false
		end

		return true
	end

	local function var_25_2()
		local var_28_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_25_0.placeId)
		local var_28_1 = pg.island_production_slot[arg_25_0.slotId]
		local var_28_2 = var_28_1.exclusion_slot == "" and {} or var_28_1.exclusion_slot
		local var_28_3 = {}
		local var_28_4 = false

		for iter_28_0, iter_28_1 in ipairs(var_28_2) do
			if var_28_0:GetHandPlantSlotData(iter_28_1).state == 1 then
				var_28_4 = true

				table.insert(var_28_3, iter_28_1)
			end
		end

		return var_28_4, var_28_3
	end

	if var_25_0() and var_25_1() then
		setActive(arg_25_0.enoughSureBg, true)
		setActive(arg_25_0.notenoughSureBg, false)
		onButton(arg_25_0, arg_25_0.sureBtn, function()
			if arg_25_0.addDelegateFormula then
				arg_25_0.placeId = pg.island_production_slot[arg_25_0.slotId].place

				local var_29_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_25_0.placeId):GetDelegationSlotData(arg_25_0.slotId)

				if var_29_0 and not var_29_0:GetSlotRoleData() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_additional_production_tip2"))

					return
				end
			end

			local var_29_1 = arg_25_0.formulaToActivityDic[arg_25_0.selectFormulaId]

			if var_29_1 then
				local var_29_2 = getProxy(ActivityProxy):getActivityById(var_29_1)

				if not var_29_2 or var_29_2:isEnd() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_activity_expired"))

					return
				end
			end

			local var_29_3, var_29_4 = var_25_2()

			if var_29_3 then
				arg_25_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_production_manually_cancel"),
					onYes = function()
						pg.m02:sendNotification(GAME.ISLAND_STOP_HANDLE_PLANT_HALFWAY, {
							build_id = arg_25_0.placeId,
							slot_list = var_29_4
						})
					end,
					onNo = function()
						return
					end
				})

				return
			end

			existCall(arg_25_0.unLoadCharacterFunc)

			if arg_25_0.addDelegateFormula then
				local var_29_5 = arg_25_0.curSelectCount - arg_25_0.addDelegateFormulaTimes

				arg_25_0:emit(IslandMediator.ADD_DELEGATION, arg_25_0.placeId, arg_25_0.slotId, var_29_5)
			else
				arg_25_0:emit(IslandMediator.START_DELEGATION, arg_25_0.placeId, arg_25_0.slotId, arg_25_0.selectedShipId, arg_25_0.selectFormulaId, arg_25_0.curSelectCount)
			end

			existCall(arg_25_0.confirmFunc)
			arg_25_0:Hide()
		end, SFX_PANEL)
	else
		setActive(arg_25_0.enoughSureBg, false)
		setActive(arg_25_0.notenoughSureBg, true)
		onButton(arg_25_0, arg_25_0.sureBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_cost_notenough"))
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_33_0, arg_33_1)
	arg_33_0:BlurPanel()

	arg_33_0.commissionId = arg_33_1.commissionId
	arg_33_0.selectedShipId = arg_33_1.selectedShipId
	arg_33_0.cancelFunc = arg_33_1.cancelFunc
	arg_33_0.confirmFunc = arg_33_1.confirmFunc
	arg_33_0.unLoadCharacterFunc = arg_33_1.unLoadCharacterFunc
	arg_33_0.addDelegateFormula = arg_33_1.addDelegateFormula
	arg_33_0.addDelegateFormulaTimes = arg_33_1.addDelegateFormulaTimes
	arg_33_0.canRewardTime = arg_33_1.canRewardTime

	setActive(arg_33_0.addExpTF, arg_33_0.selectedShipId ~= 1)

	if arg_33_0.addDelegateFormulaTimes then
		setActive(arg_33_0.barLimit, true)

		local var_33_0 = arg_33_0.addDelegateFormulaTimes / 5 * 352.6

		arg_33_0.barLimit.sizeDelta = Vector2(var_33_0, 22)

		setActive(arg_33_0.addCountTips, true)
	else
		setActive(arg_33_0.barLimit, false)
		setActive(arg_33_0.addCountTips, false)
	end

	local var_33_1 = arg_33_0.addDelegateFormulaTimes and i18n("island_additional_production_tip1") or i18n("island_production_start")

	setText(arg_33_0.sureBtn:Find("adapt/time/Text"), var_33_1)

	arg_33_0.slotId = pg.island_production_commission[arg_33_0.commissionId].slot
	arg_33_0.placeId = pg.island_production_slot[arg_33_0.slotId].place
	arg_33_0.selectedShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_33_0.selectedShipId)

	arg_33_0:InitUnlockedFormulaList()

	if #arg_33_0.formulaList > 0 then
		arg_33_0.uiList:align(#arg_33_0.formulaList)
		setActive(arg_33_0.rightInfo, true)
		setActive(arg_33_0.rightInfoEmpty, false)
		arg_33_0:OnSelectFormulaIndex(1)
	else
		arg_33_0.uiList:align(#arg_33_0.formulaList)
		setActive(arg_33_0.rightInfo, false)
		setActive(arg_33_0.rightInfoEmpty, true)
	end

	arg_33_0:RefreshShip()
end

function var_0_0.RefreshShip(arg_34_0)
	local var_34_0 = IslandShip.StaticGetPrefab(arg_34_0.selectedShipId)

	GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_34_0, "", arg_34_0.selectShipIcon)
	setText(arg_34_0.selectShipName, arg_34_0.selectedShip:GetName())
	setText(arg_34_0.selectShipLv, string.format("-Lv.%d", arg_34_0.selectedShip:GetLevel()))

	local var_34_1 = arg_34_0.selectedShip:GetSkill()
	local var_34_2 = var_34_1:IsEffectiveInPlace(arg_34_0.placeId)

	setActive(arg_34_0.skillInUse, var_34_2)
	setActive(arg_34_0.skillUnUse, not var_34_2)
	setActive(arg_34_0.skillUnUse, not var_34_2)

	arg_34_0.skillName.text = string.format("%s - %s", var_34_1:GetName(), "Lv." .. var_34_1:GetLevel() .. "")
end

function var_0_0.RefreshShipEnergy(arg_35_0)
	local var_35_0 = arg_35_0.addDelegateFormulaTimes and arg_35_0.curSelectCount - arg_35_0.addDelegateFormulaTimes or arg_35_0.curSelectCount
	local var_35_1 = arg_35_0.formulaCfg.stamina_cost * var_35_0

	if arg_35_0.selectedShipId == 1 then
		var_35_1 = 0
	else
		arg_35_0.animationPlayer:Play("anim_IslandFormulaSelectNewUI_bar_Loop")
	end

	setText(arg_35_0.addExp, "EXP+" .. arg_35_0.formulaCfg.ship_exp * var_35_0)

	if arg_35_0.eneryTimer then
		arg_35_0.eneryTimer:Stop()
	end

	arg_35_0.eneryTimer = Timer.New(function()
		local var_36_0 = arg_35_0.selectedShip:GetCurrentEnergy()
		local var_36_1 = arg_35_0.selectedShip:GetMaxEnergy()

		setSlider(arg_35_0.energyBarTf, 0, 1, (var_36_0 - var_35_1) / var_36_1)
		setSlider(arg_35_0.energyBarUseTf, 0, 1, var_36_0 / var_36_1)
		setText(arg_35_0.energy_countTf, string.format("%d-<color=#f7c35f>%d</color>/%d", var_36_0, var_35_1, var_36_1))
	end, 1, -1)

	arg_35_0.eneryTimer:Start()
	arg_35_0.eneryTimer.func()
end

function var_0_0.InitUnlockedFormulaList(arg_37_0)
	arg_37_0.formulaList = {}
	arg_37_0.formulaToActivityDic = {}

	if arg_37_0.addDelegateFormula then
		table.insert(arg_37_0.formulaList, arg_37_0.addDelegateFormula)

		return
	end

	local var_37_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_37_0, iter_37_1 in ipairs(pg.island_production_slot[arg_37_0.slotId].activity_formula or {}) do
		local var_37_1 = iter_37_1[1]
		local var_37_2 = iter_37_1[2]
		local var_37_3 = getProxy(ActivityProxy):getActivityById(var_37_1)

		if var_37_3 and not var_37_3:isEnd() then
			for iter_37_2, iter_37_3 in ipairs(var_37_2 or {}) do
				if pg.island_formula[iter_37_3].unlock_type == 0 or var_37_0:IsUnlockFormuate(iter_37_3) then
					table.insert(arg_37_0.formulaList, iter_37_3)

					arg_37_0.formulaToActivityDic[iter_37_3] = var_37_1
				end
			end
		end
	end

	for iter_37_4, iter_37_5 in ipairs(pg.island_production_slot[arg_37_0.slotId].formula or {}) do
		local var_37_4 = pg.island_formula[iter_37_5].unlock_type == 0
		local var_37_5 = pg.island_formula[iter_37_5].unlock_type == -1
		local var_37_6 = true

		if var_37_5 then
			local var_37_7 = pg.island_combo[iter_37_5].unlock_condition
			local var_37_8 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetFormulaNums()

			for iter_37_6, iter_37_7 in ipairs(var_37_7) do
				local var_37_9 = iter_37_7[1]
				local var_37_10 = iter_37_7[2]

				if not var_37_8[var_37_9] or var_37_10 > var_37_8[var_37_9] then
					var_37_6 = false

					break
				end
			end
		end

		if var_37_4 or var_37_0:IsUnlockFormuate(iter_37_5) or var_37_5 and var_37_6 then
			table.insert(arg_37_0.formulaList, iter_37_5)
		end
	end
end

function var_0_0.RefreshCurSelectCount(arg_38_0)
	local var_38_0 = arg_38_0.addDelegateFormulaTimes or arg_38_0.curSelectCount

	setText(arg_38_0.curCountTips, tostring(var_38_0))

	local var_38_1 = arg_38_0.addDelegateFormulaTimes and arg_38_0.curSelectCount - arg_38_0.addDelegateFormulaTimes or 0

	setText(arg_38_0.addCountTips, "+" .. var_38_1)
	setSlider(arg_38_0.curCountNumSlider, 1, arg_38_0.productMaxTime, arg_38_0.curSelectCount)
	arg_38_0:RefreshExtraProduct()
	setText(arg_38_0.currentformulaIcon:Find("icon_bg/product_count_bg/product_count"), "×" .. arg_38_0.formulaCfg.commission_product[1][2])

	local var_38_2 = arg_38_0:CacaluteProductTime()
	local var_38_3 = 0

	for iter_38_0, iter_38_1 in ipairs(var_38_2) do
		var_38_3 = var_38_3 + iter_38_1
	end

	setText(arg_38_0.needTimeText, pg.TimeMgr.GetInstance():DescCDTime(var_38_3))
end

function var_0_0.RefreshExtraProduct(arg_39_0)
	local var_39_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	if #arg_39_0.formulaCfg.second_product == 0 or not var_39_0:IsUnlcokSecondProduct(arg_39_0.selectFormulaId) then
		setActive(arg_39_0.extraProduct, false)

		return
	end

	setActive(arg_39_0.extraProduct, true)

	local var_39_1 = arg_39_0.formulaCfg.second_product_display[1][1]
	local var_39_2 = arg_39_0.formulaCfg.second_product_display[1][2]
	local var_39_3 = pg.island_item_data_template[var_39_1]

	GetImageSpriteFromAtlasAsync("island/" .. var_39_3.icon, "", arg_39_0.extraProductIcon)
	setText(arg_39_0.extraProductNum, "×" .. var_39_2)

	local var_39_4 = pg.island_production_slot[arg_39_0.slotId].place
	local var_39_5 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_39_4):GetDelegationSlotData(arg_39_0.slotId):GetFromulaTatalCount(arg_39_0.formulaCfg.id)
	local var_39_6 = arg_39_0.formulaCfg.second_product[1]
	local var_39_7 = (var_39_5 + (arg_39_0.canRewardTime or 0)) % var_39_6
	local var_39_8 = var_39_7 + (arg_39_0.addDelegateFormulaTimes and arg_39_0.curSelectCount - arg_39_0.addDelegateFormulaTimes or arg_39_0.curSelectCount)
	local var_39_9 = math.floor(var_39_8 / var_39_6)

	arg_39_0.extraProcess = var_39_8 % var_39_6

	setText(arg_39_0.extraProductName, var_39_3.name .. "×" .. var_39_9)

	if arg_39_0.addDelegateFormulaTimes then
		setActive(arg_39_0.extraProductAddnum, true)

		local var_39_10 = arg_39_0.curSelectCount - arg_39_0.addDelegateFormulaTimes
		local var_39_11 = math.floor((var_39_7 + var_39_10) / var_39_6)

		setText(arg_39_0.extraProductAddnum, "+" .. var_39_11)
	else
		setActive(arg_39_0.extraProductAddnum, false)
	end

	arg_39_0.extraProductList:align(var_39_6)
end

function var_0_0.CacaluteProductTime(arg_40_0)
	local var_40_0 = arg_40_0.addDelegateFormulaTimes and arg_40_0.curSelectCount - arg_40_0.addDelegateFormulaTimes or arg_40_0.curSelectCount

	return IslandProductTimeHelper.CalculateTimeToProductFormula(arg_40_0.selectedShipId, arg_40_0.selectFormulaId, var_40_0, arg_40_0.placeId, arg_40_0.slotId)
end

function var_0_0.CheckInPlace(arg_41_0, arg_41_1, arg_41_2)
	for iter_41_0, iter_41_1 in ipairs(arg_41_2) do
		if iter_41_1 == arg_41_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetAttrGrade(arg_42_0, arg_42_1)
	local var_42_0 = pg.island_chara_att.all[#pg.island_chara_att.all]

	for iter_42_0, iter_42_1 in ipairs(pg.island_chara_att.all) do
		local var_42_1 = pg.island_chara_att[iter_42_1]
		local var_42_2 = var_42_1.range[1]
		local var_42_3 = var_42_1.range[2]

		if var_42_2 <= arg_42_1 and arg_42_1 <= var_42_3 then
			var_42_0 = iter_42_1

			break
		end
	end

	return var_42_0
end

function var_0_0.GetAttrGrowingValueByBuff(arg_43_0, arg_43_1, arg_43_2)
	for iter_43_0, iter_43_1 in ipairs(arg_43_2) do
		if iter_43_1[1] == arg_43_1 then
			return iter_43_1[2]
		end
	end

	return 0
end

function var_0_0.OnHide(arg_44_0)
	arg_44_0:UnBlurPanel()

	if arg_44_0.eneryTimer then
		arg_44_0.eneryTimer:Stop()
	end
end

function var_0_0.OnDisable(arg_45_0)
	arg_45_0:OnHide()
end

function var_0_0.OnDestroy(arg_46_0)
	return
end

function var_0_0.Show(arg_47_0, ...)
	arg_47_0:AddListeners()
	arg_47_0.islandUIController:Show(true)
	arg_47_0:OnShow(...)
end

function var_0_0.Hide(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = defaultValue(arg_48_1, true)

	local function var_48_1()
		arg_48_0:ClosePage(arg_48_0)
		arg_48_0:RemoveListeners()
		arg_48_0:OnHide()

		if not arg_48_2 then
			arg_48_0:OnExit()
		end
	end

	if var_48_0 then
		arg_48_0.islandUIController:Hide(true, var_48_1)
	else
		var_48_1()
	end
end

return var_0_0
