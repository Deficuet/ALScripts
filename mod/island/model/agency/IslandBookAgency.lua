local var_0_0 = class("IslandBookAgency", import(".IslandBaseAgency"))

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.view_book
	local var_1_1 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.book_list) do
		table.insert(var_1_1, iter_1_1)
	end

	local var_1_2 = {}

	for iter_1_2, iter_1_3 in ipairs(var_1_0.cond_list) do
		if not var_1_2[iter_1_3.type] then
			var_1_2[iter_1_3.type] = {}
		end

		for iter_1_4, iter_1_5 in ipairs(iter_1_3.unlock_ids) do
			var_1_2[iter_1_3.type][iter_1_5] = true
		end
	end

	arg_1_0.dataMap = {}

	for iter_1_6, iter_1_7 in ipairs(pg.island_illustrated_guide.all) do
		local var_1_3, var_1_4 = IslandIllustration.GetTypeAndLinkId(iter_1_7)

		if not arg_1_0.dataMap[var_1_3] then
			arg_1_0.dataMap[var_1_3] = {}
		end

		local var_1_5 = arg_1_0:CreateClass(var_1_3, iter_1_7)

		if table.contains(var_1_1, iter_1_7) then
			var_1_5:SetStatus(IslandIllustration.STATUS.UNLOCK)
		elseif var_1_2[var_1_3] and var_1_2[var_1_3][var_1_4] then
			var_1_5:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
		end

		arg_1_0.dataMap[var_1_3][var_1_4] = var_1_5
	end

	arg_1_0:SetPointDatas(var_1_0.book_collects)
	arg_1_0:SetRecordDatas(var_1_0.item_list or {})

	arg_1_0.pointAwardGotMaps = {}
	arg_1_0.pointAwardIdsMaps = {}

	for iter_1_8, iter_1_9 in ipairs(pg.island_collection_reward.get_id_list_by_type) do
		arg_1_0.pointAwardGotMaps[iter_1_8] = {}
		arg_1_0.pointAwardIdsMaps[iter_1_8] = iter_1_9

		table.sort(arg_1_0.pointAwardIdsMaps[iter_1_8], CompareFuncs({
			function(arg_2_0)
				return pg.island_collection_reward[arg_2_0].level
			end,
			function(arg_3_0)
				return arg_3_0
			end
		}))
	end

	local var_1_6 = pg.island_collection_reward

	for iter_1_10, iter_1_11 in ipairs(var_1_0.book_awards) do
		local var_1_7 = var_1_6[iter_1_11].type

		table.insert(arg_1_0.pointAwardGotMaps[var_1_7], iter_1_11)
	end
end

function var_0_0.CreateClass(arg_4_0, arg_4_1, arg_4_2)
	return switch(arg_4_1, {
		[IslandIllustration.TYPES.CHAR] = function()
			return IslandCharIllustration.New(arg_4_2)
		end,
		[IslandIllustration.TYPES.ITEM] = function()
			return IslandItemIllustration.New(arg_4_2)
		end
	}, function()
		return IslandIllustration.New(arg_4_2)
	end)
end

function var_0_0.SetRecordDatas(arg_8_0, arg_8_1)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		var_8_0[iter_8_1.id] = iter_8_1.num
	end

	for iter_8_2, iter_8_3 in pairs(arg_8_0.dataMap[IslandIllustration.TYPES.ITEM] or {}) do
		iter_8_3:SetHistoryCnt(var_8_0[iter_8_3:GetLinkConfigID()] or 0)
	end
end

function var_0_0.SetPointDatas(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_1 or {}) do
		local var_9_0, var_9_1 = IslandIllustration.GetTypeAndLinkId(iter_9_1.id)

		arg_9_0.dataMap[var_9_0][var_9_1]:SetPointData(iter_9_1)
	end
end

function var_0_0.InitShipTypeData(arg_10_0)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	for iter_10_0, iter_10_1 in pairs(arg_10_0.dataMap[IslandIllustration.TYPES.CHAR] or {}) do
		if var_10_0:GetShipById(iter_10_1:GetLinkConfigID()) then
			local var_10_1 = iter_10_1:GetStatus()

			if var_10_1 == IslandIllustration.STATUS.UNLOCK then
				iter_10_1:CheckTip()
			elseif var_10_1 == IslandIllustration.STATUS.LOCK then
				iter_10_1:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
			end
		end
	end
end

function var_0_0.GetListByType(arg_11_0, arg_11_1)
	return underscore.values(arg_11_0.dataMap[arg_11_1])
end

function var_0_0.GetIllustration(arg_12_0, arg_12_1, arg_12_2)
	return arg_12_0.dataMap[arg_12_1] and arg_12_0.dataMap[arg_12_1][arg_12_2]
end

function var_0_0.GetTotalPoints(arg_13_0)
	local var_13_0 = 0

	for iter_13_0, iter_13_1 in pairs(arg_13_0.dataMap) do
		for iter_13_2, iter_13_3 in pairs(iter_13_1) do
			var_13_0 = var_13_0 + iter_13_3:GetPoints()
		end
	end

	return var_13_0
end

function var_0_0.GetAllPoints(arg_14_0, arg_14_1)
	local var_14_0 = 0

	for iter_14_0, iter_14_1 in pairs(arg_14_0.dataMap[arg_14_1]) do
		var_14_0 = var_14_0 + iter_14_1:GetPoints()
	end

	return var_14_0
end

function var_0_0.GetPoints(arg_15_0, arg_15_1, arg_15_2)
	return arg_15_0.dataMap[arg_15_1][arg_15_2]:GetPoints()
end

function var_0_0.GetCurLevelPointAwardId(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.pointAwardIdsMaps[arg_16_1]) do
		if not table.contains(arg_16_0.pointAwardGotMaps[arg_16_1], iter_16_1) then
			return iter_16_1
		end
	end

	return arg_16_0.pointAwardIdsMaps[arg_16_1][#arg_16_0.pointAwardIdsMaps[arg_16_1]]
end

function var_0_0.GetPointAwardIds(arg_17_0, arg_17_1)
	return arg_17_0.pointAwardIdsMaps[arg_17_1]
end

function var_0_0.GetPointAwardGotIds(arg_18_0, arg_18_1)
	return arg_18_0.pointAwardGotMaps[arg_18_1]
end

function var_0_0.IsGotAllPointAward(arg_19_0, arg_19_1)
	return table.contains(arg_19_0.pointAwardGotMaps[arg_19_1], arg_19_0.pointAwardIdsMaps[arg_19_1][#arg_19_0.pointAwardIdsMaps[arg_19_1]])
end

function var_0_0.GetCurPointInfos(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0:GetCurLevelPointAwardId(arg_20_1)

	return arg_20_0:GetAllPoints(arg_20_1), pg.island_collection_reward[var_20_0].need_exp
end

function var_0_0.AddCanUnlock(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.dataMap[arg_21_1][arg_21_2]:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
end

function var_0_0.HandlePushData(arg_22_0, arg_22_1)
	local var_22_0 = IslandIllustration.TYPES.ITEM

	for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
		local var_22_1 = arg_22_0.dataMap[var_22_0][iter_22_1.id]

		if var_22_1 then
			if var_22_1:GetStatus() == IslandIllustration.STATUS.LOCK then
				arg_22_0:AddCanUnlock(var_22_0, iter_22_1.id)
			end

			var_22_1:AddHistoryCnt(iter_22_1.num)
			var_22_1:CheckTip()
		end
	end
end

function var_0_0.AddUnlock(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		local var_23_0, var_23_1 = IslandIllustration.GetTypeAndLinkId(iter_23_1)

		arg_23_0.dataMap[var_23_0][var_23_1]:SetStatus(IslandIllustration.STATUS.UNLOCK)
		arg_23_0.dataMap[var_23_0][var_23_1]:CheckTip()
	end
end

function var_0_0.AddPointAwardGotId(arg_24_0, arg_24_1)
	local var_24_0 = pg.island_collection_reward[arg_24_1].type

	table.insert(arg_24_0.pointAwardGotMaps[var_24_0], arg_24_1)
end

function var_0_0.OnGetPointDone(arg_25_0, arg_25_1)
	arg_25_0:SetPointDatas(arg_25_1)

	for iter_25_0, iter_25_1 in ipairs(arg_25_1 or {}) do
		local var_25_0, var_25_1 = IslandIllustration.GetTypeAndLinkId(iter_25_1.id)

		arg_25_0.dataMap[var_25_0][var_25_1]:CheckTip()
	end
end

function var_0_0.OnAddNewShip(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.dataMap[IslandIllustration.TYPES.CHAR][arg_26_1]

	if var_26_0 then
		var_26_0:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
	end
end

function var_0_0.OnShipUpgradeOrBreakOut(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.dataMap[IslandIllustration.TYPES.CHAR][arg_27_1]

	if var_27_0 then
		var_27_0:CheckTip()
	end
end

function var_0_0.IsTipFromTypes(arg_28_0, arg_28_1)
	for iter_28_0, iter_28_1 in ipairs(arg_28_1) do
		local var_28_0, var_28_1 = arg_28_0:GetCurPointInfos(iter_28_1)

		if not arg_28_0:IsGotAllPointAward(iter_28_1) and var_28_1 <= var_28_0 then
			return true
		end

		for iter_28_2, iter_28_3 in pairs(arg_28_0.dataMap[iter_28_1] or {}) do
			if iter_28_3:IsTip() then
				return true
			end
		end
	end

	return false
end

return var_0_0
