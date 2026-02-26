local var_0_0 = class("IslandCollectionPanel", import("view.base.BaseSubView"))
local var_0_1 = 3
local var_0_2 = "#ff7d36"
local var_0_3 = "#39BFFF"

function var_0_0.getUIName(arg_1_0)
	return "IslandAutomaticCollectionPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uiShipList = UIItemList.New(arg_2_0.uiShipContent, arg_2_0.uiShipTpl)
	arg_2_0.uiTipList = UIItemList.New(arg_2_0.uiTipContent, arg_2_0.uiTipTpl)
end

function var_0_0.ExistHandCollection(arg_3_0)
	local var_3_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_3_1 = {
		IslandProductConst.MinePlaceId,
		IslandProductConst.FellingPlaceId
	}

	for iter_3_0, iter_3_1 in ipairs(var_3_1) do
		local var_3_2 = var_3_0:GetBuilding(iter_3_1)
		local var_3_3 = var_3_2 and var_3_2:GetBuildingCollectData() or nil

		if var_3_3 then
			local var_3_4 = var_3_3:GetCollectSlotDatasDic()

			for iter_3_2, iter_3_3 in pairs(var_3_4) do
				if iter_3_3:GetCanCollectTimeStamps() == 0 then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.ExistGather(arg_4_0)
	local var_4_0 = pg.TimeMgr.GetInstance():GetServerTime()

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.gatherDataList) do
		if iter_4_1.state == 0 or iter_4_1.state == 1 and var_4_0 > iter_4_1.refresh_time then
			return true
		end
	end

	return false
end

function var_0_0.CheckHasCollectData(arg_5_0, arg_5_1)
	if arg_5_1 == IslandAutoCollectHelper.SelectType.HandCollection then
		return arg_5_0:ExistHandCollection()
	elseif arg_5_1 == IslandAutoCollectHelper.SelectType.Gather then
		return arg_5_0:ExistGather()
	elseif arg_5_1 == IslandAutoCollectHelper.SelectType.Both then
		return arg_5_0:ExistHandCollection() or arg_5_0:ExistGather()
	end

	return false
end

function var_0_0.OnInit(arg_6_0)
	onButton(arg_6_0, arg_6_0.uiSelectConfirm, function()
		arg_6_0.contextData:ShowMsgBox({
			content = i18n("collect_chapter_is_activation"),
			onYes = function(arg_8_0, arg_8_1)
				if arg_6_0:CheckHasCollectData(arg_8_0) == false then
					pg.TipsMgr.GetInstance():ShowTips(i18n("island_chara_gather_no_target"))

					return
				end

				arg_6_0:AfterSelectType(arg_8_0)
				arg_8_1()
			end,
			type = IslandMsgBox.TYPE_COMMON_AUTO_CONFIRM
		})
	end)
	arg_6_0.uiShipList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventInit then
			arg_6_0:InitShipItem(arg_9_1, arg_9_2)
		elseif arg_9_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateShipItem(arg_9_1, arg_9_2)
		end
	end)
	arg_6_0.uiTipList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventInit then
			arg_6_0:InitItem(arg_10_1, arg_10_2)
		elseif arg_10_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateItem(arg_10_1, arg_10_2)
		end
	end)
	setText(arg_6_0.uiSelectConfirmText, i18n("island_chara_gather_range"))
	setText(arg_6_0.uiConfirmText, i18n("island_chara_gather_start"))
end

function var_0_0.InitShipItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_1 + 1

	onButton(arg_11_0, arg_11_2:Find("unlock/btn"), function()
		arg_11_0:emit(IslandMediator.OPEN_PAGE, "IslandShipSelectPage", {
			{
				attrType = IslandShipAttr.COLLECT_KEY,
				confirmFunc = function(arg_13_0)
					arg_11_0:AfterShipSelect(var_11_0, arg_13_0[1])
				end,
				autoCollectionSelectShip = arg_11_0.selectShips
			}
		})
	end)
	onButton(arg_11_0, arg_11_2:Find("unlock/ship/delete"), function()
		arg_11_0.selectShips[var_11_0] = nil

		arg_11_0:Flush()
	end)
end

function var_0_0.UpdateShipItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.curType == IslandAutoCollectHelper.SelectType.None

	setActive(arg_15_2:Find("lock"), var_15_0)
	setActive(arg_15_2:Find("unlock"), not var_15_0)

	if var_15_0 then
		return
	end

	local var_15_1 = arg_15_1 + 1
	local var_15_2 = arg_15_0.selectShips[var_15_1]
	local var_15_3 = var_15_2 ~= nil and true or false

	setActive(arg_15_2:Find("unlock/ship"), var_15_3)
	setActive(arg_15_2:Find("unlock/add"), not var_15_3)
	setActive(arg_15_2:Find("unlock/add"), not var_15_3)

	if not var_15_2 then
		return
	end

	local var_15_4 = IslandShip.StaticGetPrefab(var_15_2)

	LoadImageSpriteAsync("squareicon/" .. var_15_4, arg_15_2:Find("unlock/ship/mask/icon"))

	local var_15_5 = arg_15_0.expAddlist[var_15_1]

	if not var_15_5 then
		setActive(arg_15_2:Find("unlock/ship/exp"), false)

		return
	end

	setActive(arg_15_2:Find("unlock/ship/exp"), true)
	setText(arg_15_2:Find("unlock/ship/exp/addExp"), string.format("EXP+%d", var_15_5))
end

function var_0_0.AfterShipSelect(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.selectShips[arg_16_1] = arg_16_2

	arg_16_0:Flush()
end

function var_0_0.InitItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_1 + 1
	local var_17_1 = IslandAutoCollectHelper.CostTipList[var_17_0]

	setText(arg_17_2:Find("name"), var_17_1)
end

function var_0_0.UpdateItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_1 + 1
	local var_18_1 = arg_18_0.costTipList[var_18_0]

	setText(arg_18_2:Find("num"), var_18_1)
end

function var_0_0.Flush(arg_19_0)
	setActive(arg_19_0.uiSelectConfirm, arg_19_0.curType == IslandAutoCollectHelper.SelectType.None)
	setActive(arg_19_0.uiConfirmBtn, arg_19_0.curType ~= IslandAutoCollectHelper.SelectType.None)
	arg_19_0:RefreshData()

	if arg_19_0.curType ~= IslandAutoCollectHelper.SelectType.None then
		setActive(arg_19_0.uiConfirmBtn.transform:Find("blue"), arg_19_0.cheackEnough)
		setActive(arg_19_0.uiConfirmBtn.transform:Find("gray"), not arg_19_0.cheackEnough)

		if arg_19_0.cheackEnough then
			onButton(arg_19_0, arg_19_0.uiConfirmBtn, function()
				local var_20_0 = {}

				for iter_20_0, iter_20_1 in pairs(arg_19_0.selectShips) do
					table.insert(var_20_0, iter_20_1)
				end

				pg.m02:sendNotification(GAME.ISLAND_TAKE_AUTO_COLLECTION, {
					type = arg_19_0.curType,
					ship_list = var_20_0,
					gatherData = arg_19_0.gatherDataList
				})
			end)
		else
			removeOnButton(arg_19_0.uiConfirmBtn)
		end
	end

	arg_19_0.uiShipList:align(var_0_1)
	arg_19_0.uiTipList:align(#IslandAutoCollectHelper.CostTipList)
end

function var_0_0.GetCostData(arg_21_0)
	local var_21_0 = 0
	local var_21_1 = 0
	local var_21_2 = 0

	arg_21_0.autoCostList = {}

	if arg_21_0.curType == IslandAutoCollectHelper.SelectType.HandCollection or arg_21_0.curType == IslandAutoCollectHelper.SelectType.Both then
		local var_21_3 = {
			IslandProductConst.MinePlaceId,
			IslandProductConst.FellingPlaceId
		}
		local var_21_4 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()

		for iter_21_0, iter_21_1 in ipairs(var_21_3) do
			local var_21_5 = var_21_4:GetBuilding(iter_21_1)
			local var_21_6 = var_21_5 and var_21_5:GetBuildingCollectData() or nil
			local var_21_7 = arg_21_0.buildCostDic[iter_21_1]

			if var_21_6 then
				local var_21_8 = var_21_6:GetCollectSlotDatasDic()

				for iter_21_2, iter_21_3 in pairs(var_21_8) do
					if iter_21_3:GetCanCollectTimeStamps() == 0 and arg_21_0:CheckIsDefauotSlot(iter_21_1, iter_21_3.id) then
						table.insert(arg_21_0.autoCostList, {
							energyCost = var_21_7.energyCost,
							coinCost = var_21_7.coinCost,
							expAdd = var_21_7.expCost
						})
					end
				end
			end
		end
	end

	if arg_21_0.curType == IslandAutoCollectHelper.SelectType.Gather or arg_21_0.curType == IslandAutoCollectHelper.SelectType.Both then
		local var_21_9 = pg.TimeMgr.GetInstance():GetServerTime()

		for iter_21_4, iter_21_5 in ipairs(arg_21_0.gatherDataList) do
			if iter_21_5.state == 0 or iter_21_5.state == 1 and var_21_9 > iter_21_5.refresh_time then
				local var_21_10 = pg.island_wild_gather[iter_21_5.id]

				table.insert(arg_21_0.autoCostList, {
					energyCost = var_21_10.auto_parameters[2],
					coinCost = var_21_10.auto_parameters[1],
					expAdd = var_21_10.auto_parameters[3]
				})
			end
		end
	end

	for iter_21_6, iter_21_7 in ipairs(arg_21_0.autoCostList) do
		var_21_0 = var_21_0 + iter_21_7.energyCost
		var_21_1 = var_21_1 + iter_21_7.coinCost
		var_21_2 = var_21_2 + iter_21_7.expAdd
	end

	return var_21_0, var_21_1, var_21_2
end

function var_0_0.GetGatherReducePercent(arg_22_0)
	local var_22_0 = 0

	for iter_22_0, iter_22_1 in pairs(arg_22_0.selectShips) do
		var_22_0 = var_22_0 + IslandAutoCollectHelper.GetAttributeReducePercent(iter_22_1)
	end

	return var_22_0
end

function var_0_0.GetShipCount(arg_23_0)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in pairs(arg_23_0.selectShips) do
		var_23_0 = var_23_0 + 1
	end

	return var_23_0
end

function var_0_0.RefreshData(arg_24_0)
	arg_24_0.costTipList = {}
	arg_24_0.expAddlist = {}
	arg_24_0.cheackEnough = false

	local var_24_0, var_24_1, var_24_2 = arg_24_0:GetCostData()
	local var_24_3
	local var_24_4

	if arg_24_0.curType == IslandAutoCollectHelper.SelectType.None then
		var_24_3 = "/"
		var_24_4 = "/"
	elseif arg_24_0:GetShipCount() == 0 then
		var_24_3 = var_24_0
		var_24_4 = var_24_1
	else
		local var_24_5 = arg_24_0:GetGatherReducePercent()
		local var_24_6 = math.floor(var_24_0 * (1 - var_24_5 * 0.01))
		local var_24_7 = var_24_6
		local var_24_8 = 0

		for iter_24_0 = 1, 3 do
			local var_24_9 = arg_24_0.selectShips[iter_24_0]

			if var_24_9 then
				local var_24_10 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_24_9):GetCurrentEnergy()
				local var_24_11 = 0

				if var_24_10 <= var_24_7 then
					var_24_11 = var_24_10
				else
					var_24_11 = var_24_7
				end

				var_24_7 = var_24_7 - var_24_11
				var_24_8 = var_24_8 + var_24_10

				local var_24_12 = var_24_11 / var_24_6 * var_24_2

				arg_24_0.expAddlist[iter_24_0] = math.floor(var_24_12)
			end
		end

		local var_24_13 = var_24_6 <= var_24_8
		local var_24_14 = var_24_13 and var_0_3 or var_0_2

		var_24_3 = string.format("<color=%s>%d</color>/%d(-%d%%)", var_24_14, var_24_8, var_24_6, var_24_5)

		local var_24_15 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetItemById(1)
		local var_24_16 = var_24_15 and var_24_15:GetCount() or 0
		local var_24_17 = var_24_1 <= var_24_16
		local var_24_18 = var_24_17 and var_0_3 or var_0_2

		var_24_4 = string.format("<color=%s>%d</color>/%d", var_24_18, var_24_1, var_24_16)
		arg_24_0.cheackEnough = var_24_13 and var_24_17
	end

	table.insert(arg_24_0.costTipList, var_24_3)
	table.insert(arg_24_0.costTipList, var_24_4)
end

function var_0_0.OnGetCollctionDone(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1.selectType

	if var_25_0 == IslandAutoCollectHelper.SelectType.Gather or var_25_0 == IslandAutoCollectHelper.SelectType.Both then
		arg_25_0.gatherDataList = {}
	end

	arg_25_0.curType = IslandAutoCollectHelper.SelectType.None

	arg_25_0:Flush()
end

function var_0_0.AfterSelectType(arg_26_0, arg_26_1)
	arg_26_0.curType = arg_26_1

	arg_26_0:Flush()
end

function var_0_0.OnDestroy(arg_27_0)
	return
end

function var_0_0.ConfigDataHandle(arg_28_0)
	local var_28_0 = pg.island_set.mining_auto_parameters.key_value_varchar

	arg_28_0.buildCostDic = {}

	for iter_28_0, iter_28_1 in ipairs(var_28_0) do
		local var_28_1 = iter_28_1[1]

		arg_28_0.buildCostDic[var_28_1] = {}
		arg_28_0.buildCostDic[var_28_1].coinCost = iter_28_1[2]
		arg_28_0.buildCostDic[var_28_1].energyCost = iter_28_1[3]
		arg_28_0.buildCostDic[var_28_1].expCost = iter_28_1[4]
	end

	arg_28_0.buildDefaultList = {}

	local var_28_2 = pg.island_set.mining_default_slot.key_value_varchar

	for iter_28_2, iter_28_3 in ipairs(var_28_2) do
		local var_28_3 = iter_28_3[1]

		arg_28_0.buildDefaultList[var_28_3] = {}

		for iter_28_4, iter_28_5 in ipairs(iter_28_3[2]) do
			table.insert(arg_28_0.buildDefaultList[var_28_3], iter_28_5)
		end
	end
end

function var_0_0.CheckIsDefauotSlot(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_0.buildDefaultList[arg_29_1] or {}

	for iter_29_0, iter_29_1 in ipairs(var_29_0) do
		if iter_29_1 == arg_29_2 then
			return true
		end
	end

	return false
end

function var_0_0.Show(arg_30_0, arg_30_1)
	var_0_0.super.Show(arg_30_0)
	arg_30_0:ConfigDataHandle()

	arg_30_0.gatherDataList = {}

	for iter_30_0, iter_30_1 in ipairs(arg_30_1.gather_list) do
		table.insert(arg_30_0.gatherDataList, IslandWildGatherData.New(iter_30_1))
	end

	arg_30_0.curType = IslandAutoCollectHelper.SelectType.None
	arg_30_0.selectShips = {}
	arg_30_0.uiItemTipList = {}

	arg_30_0:Flush()
end

return var_0_0
