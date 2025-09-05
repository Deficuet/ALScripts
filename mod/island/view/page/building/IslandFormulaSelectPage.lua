local var_0_0 = class("IslandFormulaSelectPage", import("...base.IslandBasePage"))
local var_0_1 = 40
local var_0_2 = 5

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
	arg_2_0.reduceBtn = arg_2_0.formulaItem:Find("limit/reduce")
	arg_2_0.addBtn = arg_2_0.formulaItem:Find("limit/add")
	arg_2_0.maxBtn = arg_2_0.formulaItem:Find("limit/max")
	arg_2_0.curCountNumSlider = arg_2_0.formulaItem:Find("limit/num_bg")
	arg_2_0.extraProduct = arg_2_0.formulaItem:Find("extra")
	arg_2_0.extraProductIcon = arg_2_0.extraProduct:Find("icon")
	arg_2_0.extraProductName = arg_2_0.extraProduct:Find("Text")
	arg_2_0.needTimeText = arg_2_0.sureBtn:Find("adapt/time/time_text")
	arg_2_0.extraProductList = UIItemList.New(arg_2_0.extraProduct:Find("process"), arg_2_0.extraProduct:Find("process/item"))
	arg_2_0.uiList = UIItemList.New(arg_2_0:findTF("formulaView/content"), arg_2_0:findTF("formulaView/content/tpl"))
	arg_2_0.costuiList = UIItemList.New(arg_2_0:findTF("rightInfo/formula/needItem/content"), arg_2_0:findTF("rightInfo/formula/needItem/content/IslandItemTpl"))

	onSlider(arg_2_0, arg_2_0.curCountNumSlider, function(arg_3_0)
		arg_2_0.curSelectCount = arg_3_0

		arg_2_0:RefreshCost()
	end)
	setText(arg_2_0:findTF("top/title/Text"), i18n("island_select_product"))

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
	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
end

function var_0_0.AddListeners(arg_4_0)
	return
end

function var_0_0.RemoveListeners(arg_5_0)
	return
end

function var_0_0.OnInit(arg_6_0)
	onButton(arg_6_0, arg_6_0.backBtn, function()
		arg_6_0.dftAniEvent:SetEndEvent(nil)
		arg_6_0.dftAniEvent:SetEndEvent(function()
			arg_6_0.dftAniEvent:SetEndEvent(nil)
			arg_6_0:Hide()
			arg_6_0.cancelFunc()
		end)
		arg_6_0.animationPlayer:Play("anim_IslandFormulaSelectNewUI_Out")
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.reduceBtn, function()
		arg_6_0.curSelectCount = arg_6_0.curSelectCount - 1
		arg_6_0.curSelectCount = arg_6_0.curSelectCount < 1 and 1 or arg_6_0.curSelectCount

		arg_6_0:RefreshCost()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.addBtn, function()
		arg_6_0.curSelectCount = arg_6_0.curSelectCount + 1
		arg_6_0.curSelectCount = arg_6_0.curSelectCount > var_0_2 and var_0_2 or arg_6_0.curSelectCount

		arg_6_0:RefreshCost()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.maxBtn, function()
		arg_6_0.curSelectCount = var_0_2

		arg_6_0:RefreshCost()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.skillTf, function()
		arg_6_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_SHIP_SKILL,
			skill = arg_6_0.selectedShip:GetSkill()
		})
	end, SFX_PANEL)
	arg_6_0.uiList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventInit then
			arg_6_0:InitFormulaItem(arg_13_1, arg_13_2)
		elseif arg_13_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateFormulaItem(arg_13_1, arg_13_2)
		end
	end)
	arg_6_0.costuiList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventInit then
			arg_6_0:InitCostItem(arg_14_1, arg_14_2)
		elseif arg_14_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateCostItem(arg_14_1, arg_14_2)
		end
	end)
	arg_6_0.extraProductList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventInit then
			-- block empty
		elseif arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_15_1 < arg_6_0.extraProcess

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
	arg_18_0.curSelectCount = 1
	arg_18_0.selectedIdx = arg_18_1

	arg_18_0.uiList:align(#arg_18_0.formulaList)
end

function var_0_0.UpdateFormulaItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_1 + 1
	local var_19_1 = arg_19_0.formulaList[arg_19_1 + 1]
	local var_19_2 = pg.island_formula[var_19_1]
	local var_19_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_19_4 = var_19_2.item_id
	local var_19_5 = var_19_3:GetItemById(var_19_4)
	local var_19_6 = var_19_5 and var_19_5:GetCount() or 0

	updateCustomDrop(arg_19_2, Drop.New({
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_19_4,
		count = var_19_6
	}))
	setActive(arg_19_0:findTF("icon_bg/count_bg", arg_19_2), true)
	setText(arg_19_0:findTF("name", arg_19_2), var_19_2.name)
	setText(arg_19_0:findTF("icon_bg/product_count_bg/product_count", arg_19_2), "×" .. var_19_2.commission_product[1][2])

	if arg_19_0.selectedIdx == var_19_0 then
		arg_19_0:RefreshCurrentSelect()
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

function var_0_0.RefreshCurrentSelect(arg_22_0)
	local var_22_0 = arg_22_0.formulaList[arg_22_0.selectedIdx]
	local var_22_1 = pg.island_formula[var_22_0].item_id
	local var_22_2 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_22_1
	})
	local var_22_3 = var_22_2:getConfigTable().rarity
	local var_22_4 = IslandItemRarity.Rarity2FrameName(var_22_3)
	local var_22_5 = var_22_2:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/islandframe", var_22_4, arg_22_0.currentformulaIcon:Find("icon_bg"))
	GetImageSpriteFromAtlasAsync("island/" .. var_22_5, "", arg_22_0.currentformulaIcon:Find("icon_bg/icon"))
	arg_22_0:RefreshCost()
end

function var_0_0.RefreshCost(arg_23_0)
	local var_23_0 = arg_23_0.formulaList[arg_23_0.selectedIdx]
	local var_23_1 = pg.island_formula[var_23_0]

	arg_23_0.commission_Cost_List = {}

	local var_23_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	for iter_23_0, iter_23_1 in ipairs(var_23_1.commission_cost) do
		local var_23_3 = iter_23_1[1]
		local var_23_4 = var_23_2:GetItemById(var_23_3)
		local var_23_5 = var_23_4 and var_23_4:GetCount() or 0
		local var_23_6 = Drop.New({
			count = 0,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_23_1[1],
			itemCount = var_23_5,
			costCount = iter_23_1[2] * arg_23_0.curSelectCount
		})

		table.insert(arg_23_0.commission_Cost_List, var_23_6)
	end

	arg_23_0.costuiList:align(#arg_23_0.commission_Cost_List)
	arg_23_0:RefreshCurSelectCount()
	arg_23_0:RefreshShipEnergy()
	arg_23_0:RefreshCanStart()
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

	local var_24_1 = arg_24_0.formulaList[arg_24_0.selectedIdx]
	local var_24_2 = pg.island_formula[var_24_1]

	local function var_24_3()
		if var_24_2.stamina_cost * arg_24_0.curSelectCount > arg_24_0.selectedShip:GetCurrentEnergy() then
			return false
		end

		return true
	end

	local function var_24_4()
		local var_27_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_24_0.place_Id)
		local var_27_1 = pg.island_production_slot[arg_24_0.logicCommissionId]
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

	if var_24_0() and var_24_3() then
		setActive(arg_24_0.enoughSureBg, true)
		setActive(arg_24_0.notenoughSureBg, false)
		onButton(arg_24_0, arg_24_0.sureBtn, function()
			local var_28_0, var_28_1 = var_24_4()

			if var_28_0 then
				arg_24_0:ShowMsgBox({
					content = "当前委派槽位占用的手动种植槽位正在种植中,是否中断手动种植",
					type = IslandMsgBox.TYPE_COMMON,
					onYes = function()
						pg.m02:sendNotification(GAME.ISLAND_STOP_HANDLE_PLANT_HALFWAY, {
							build_id = arg_24_0.place_Id,
							slot_list = var_28_1
						})
					end,
					onNo = function()
						return
					end
				})

				return
			end

			local var_28_2 = arg_24_0.formulaList[arg_24_0.selectedIdx]

			arg_24_0:emit(IslandMediator.START_DELEGATION, arg_24_0.place_Id, arg_24_0.logicCommissionId, arg_24_0.selectedShipId, var_28_2, arg_24_0.curSelectCount)
			arg_24_0:Hide()
		end, SFX_PANEL)
	else
		setActive(arg_24_0.enoughSureBg, false)
		setActive(arg_24_0.notenoughSureBg, true)
		onButton(arg_24_0, arg_24_0.sureBtn, function()
			pg.TipsMgr.GetInstance():ShowTips("消耗不够")
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4)
	arg_32_0.cancelFunc = arg_32_4
	arg_32_0.place_Id = arg_32_2
	arg_32_0.selectedShipId = arg_32_3
	arg_32_0.selectedShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_32_0.selectedShipId)
	arg_32_0.currentCommissionId = arg_32_1
	arg_32_0.logicCommissionId = pg.island_production_commission[arg_32_0.currentCommissionId].slot

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
	local var_33_2 = var_33_1:IsEffectiveInPlace(arg_33_0.place_Id)

	setActive(arg_33_0.skillInUse, var_33_2)
	setActive(arg_33_0.skillUnUse, not var_33_2)
	setActive(arg_33_0.skillUnUse, not var_33_2)

	arg_33_0.skillName.text = string.format("%s - %s", var_33_1:GetName(), "[Lv." .. var_33_1:GetLevel() .. "]")
end

function var_0_0.RefreshShipEnergy(arg_34_0)
	local var_34_0 = arg_34_0.formulaList[arg_34_0.selectedIdx]
	local var_34_1 = pg.island_formula[var_34_0].stamina_cost * arg_34_0.curSelectCount

	if arg_34_0.selectedShipId == 1 then
		var_34_1 = 0
	else
		arg_34_0.dftAniEvent:SetEndEvent(nil)
		arg_34_0.dftAniEvent:SetEndEvent(function()
			arg_34_0.dftAniEvent:SetEndEvent(nil)
			arg_34_0.animationPlayer:Play("anim_IslandFormulaSelectNewUI_bar_Loop")
		end)
	end

	local var_34_2 = arg_34_0.selectedShip:GetCurrentEnergy()
	local var_34_3 = arg_34_0.selectedShip:GetMaxEnergy()

	setSlider(arg_34_0.energyBarTf, 0, 1, (var_34_2 - var_34_1) / var_34_3)
	setSlider(arg_34_0.energyBarUseTf, 0, 1, var_34_2 / var_34_3)
	setText(arg_34_0.energy_countTf, string.format("%d-<color=#f7c35f>%d</color>/%d", var_34_2, var_34_1, var_34_3))
end

function var_0_0.InitUnlockedFormulaList(arg_36_0)
	arg_36_0.formulaList = {}

	for iter_36_0, iter_36_1 in ipairs(pg.island_production_slot[arg_36_0.logicCommissionId].formula or {}) do
		local var_36_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()
		local var_36_1 = pg.island_formula[iter_36_1].unlock_type == 0
		local var_36_2 = pg.island_formula[iter_36_1].unlock_type == -1
		local var_36_3 = true

		if var_36_2 then
			local var_36_4 = pg.island_combo[iter_36_1].unlock_condition
			local var_36_5 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetFormulaNums()

			for iter_36_2, iter_36_3 in ipairs(var_36_4) do
				local var_36_6 = iter_36_3[1]
				local var_36_7 = iter_36_3[2]

				if not var_36_5[var_36_6] or var_36_7 > var_36_5[var_36_6] then
					var_36_3 = false

					break
				end
			end
		end

		if var_36_1 or var_36_0:IsUnlockFormuate(iter_36_1) or var_36_2 and var_36_3 then
			table.insert(arg_36_0.formulaList, iter_36_1)
		end
	end
end

function var_0_0.RefreshCurSelectCount(arg_37_0)
	setText(arg_37_0.curCountTips, tostring(arg_37_0.curSelectCount))
	setSlider(arg_37_0.curCountNumSlider, 1, var_0_2, arg_37_0.curSelectCount)
	arg_37_0:RefreshExtraProduct()

	local var_37_0 = arg_37_0.formulaList[arg_37_0.selectedIdx]
	local var_37_1 = pg.island_formula[var_37_0]

	setText(arg_37_0.currentformulaIcon:Find("icon_bg/product_count_bg/product_count"), "×" .. var_37_1.commission_product[1][2] * arg_37_0.curSelectCount)

	local var_37_2 = arg_37_0:CacaluteProductTime()
	local var_37_3 = 0

	for iter_37_0, iter_37_1 in ipairs(var_37_2) do
		var_37_3 = var_37_3 + iter_37_1
	end

	setText(arg_37_0.needTimeText, pg.TimeMgr.GetInstance():DescCDTime(var_37_3))
end

function var_0_0.RefreshExtraProduct(arg_38_0)
	local var_38_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()
	local var_38_1 = arg_38_0.formulaList[arg_38_0.selectedIdx]
	local var_38_2 = pg.island_formula[var_38_1]

	if #var_38_2.second_product == 0 or not var_38_0:IsUnlcokSecondProduct(var_38_1) then
		setActive(arg_38_0.extraProduct, false)

		return
	end

	setActive(arg_38_0.extraProduct, true)

	local var_38_3 = var_38_2.second_product[2][2]
	local var_38_4 = pg.island_item_data_template[var_38_3]

	GetImageSpriteFromAtlasAsync("island/" .. var_38_4.icon, "", arg_38_0.extraProductIcon)

	local var_38_5 = pg.island_production_slot[arg_38_0.logicCommissionId].place
	local var_38_6 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_38_5):GetDelegationSlotData(arg_38_0.logicCommissionId):GetFromulaTatalCount(var_38_2.id)
	local var_38_7 = var_38_2.second_product[1]
	local var_38_8 = math.floor((var_38_6 + arg_38_0.curSelectCount) / var_38_7)

	arg_38_0.extraProcess = (var_38_6 + arg_38_0.curSelectCount) % var_38_7

	setText(arg_38_0.extraProductName, i18n("island_sub_product_cnt", var_38_8))
	arg_38_0.extraProductList:align(var_38_7)
end

function var_0_0.CacaluteProductTime(arg_39_0)
	local var_39_0 = arg_39_0.formulaList[arg_39_0.selectedIdx]

	return IslandProductTimeHelper.CalculateTimeToProductFormula(arg_39_0.selectedShipId, var_39_0, arg_39_0.curSelectCount, arg_39_0.place_Id)
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

function var_0_0.OnDestroy(arg_43_0)
	arg_43_0.dftAniEvent:SetEndEvent(nil)
end

return var_0_0
