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
		end,
		[IslandIllustration.TYPES.FISH] = function()
			return IslandFishIllustration.New(arg_4_2)
		end
	}, function()
		return IslandIllustration.New(arg_4_2)
	end)
end

function var_0_0.SetRecordDatas(arg_9_0, arg_9_1)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		var_9_0[iter_9_1.id] = iter_9_1.num
	end

	for iter_9_2, iter_9_3 in pairs(arg_9_0.dataMap[IslandIllustration.TYPES.ITEM] or {}) do
		iter_9_3:SetHistoryCnt(var_9_0[iter_9_3:GetLinkConfigID()] or 0)
	end
end

function var_0_0.SetPointDatas(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_1 or {}) do
		local var_10_0, var_10_1 = IslandIllustration.GetTypeAndLinkId(iter_10_1.id)

		arg_10_0.dataMap[var_10_0][var_10_1]:SetPointData(iter_10_1)
	end
end

function var_0_0.InitRuntimeTypesData(arg_11_0)
	arg_11_0:InitShipTypeData()
	arg_11_0:InitFishTypeData()
end

function var_0_0.InitShipTypeData(arg_12_0)
	local var_12_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	for iter_12_0, iter_12_1 in pairs(arg_12_0.dataMap[IslandIllustration.TYPES.CHAR] or {}) do
		if var_12_0:GetShipById(iter_12_1:GetLinkConfigID()) then
			local var_12_1 = iter_12_1:GetStatus()

			if var_12_1 == IslandIllustration.STATUS.UNLOCK then
				iter_12_1:CheckTip()
			elseif var_12_1 == IslandIllustration.STATUS.LOCK then
				iter_12_1:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
			end
		end
	end
end

function var_0_0.InitFishTypeData(arg_13_0)
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetFishingAgency()

	for iter_13_0, iter_13_1 in pairs(arg_13_0.dataMap[IslandIllustration.TYPES.FISH] or {}) do
		if var_13_0:GetFish(iter_13_1:GetLinkConfigID()) then
			local var_13_1 = iter_13_1:GetStatus()

			if var_13_1 == IslandIllustration.STATUS.UNLOCK then
				iter_13_1:CheckTip()
			elseif var_13_1 == IslandIllustration.STATUS.LOCK then
				iter_13_1:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
			end
		end
	end
end

function var_0_0.GetListByType(arg_14_0, arg_14_1)
	return underscore.values(arg_14_0.dataMap[arg_14_1])
end

function var_0_0.GetIllustration(arg_15_0, arg_15_1, arg_15_2)
	return arg_15_0.dataMap[arg_15_1] and arg_15_0.dataMap[arg_15_1][arg_15_2]
end

function var_0_0.GetTotalPoints(arg_16_0)
	local var_16_0 = 0

	for iter_16_0, iter_16_1 in pairs(arg_16_0.dataMap) do
		for iter_16_2, iter_16_3 in pairs(iter_16_1) do
			var_16_0 = var_16_0 + iter_16_3:GetPoints()
		end
	end

	return var_16_0
end

function var_0_0.GetAllPoints(arg_17_0, arg_17_1)
	local var_17_0 = 0

	for iter_17_0, iter_17_1 in pairs(arg_17_0.dataMap[arg_17_1]) do
		var_17_0 = var_17_0 + iter_17_1:GetPoints()
	end

	return var_17_0
end

function var_0_0.GetPoints(arg_18_0, arg_18_1, arg_18_2)
	return arg_18_0.dataMap[arg_18_1][arg_18_2]:GetPoints()
end

function var_0_0.GetCurLevelPointAwardId(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.pointAwardIdsMaps[arg_19_1]) do
		if not table.contains(arg_19_0.pointAwardGotMaps[arg_19_1], iter_19_1) then
			return iter_19_1
		end
	end

	return arg_19_0.pointAwardIdsMaps[arg_19_1][#arg_19_0.pointAwardIdsMaps[arg_19_1]]
end

function var_0_0.GetPointAwardIds(arg_20_0, arg_20_1)
	return arg_20_0.pointAwardIdsMaps[arg_20_1]
end

function var_0_0.GetPointAwardGotIds(arg_21_0, arg_21_1)
	return arg_21_0.pointAwardGotMaps[arg_21_1]
end

function var_0_0.IsGotAllPointAward(arg_22_0, arg_22_1)
	return table.contains(arg_22_0.pointAwardGotMaps[arg_22_1], arg_22_0.pointAwardIdsMaps[arg_22_1][#arg_22_0.pointAwardIdsMaps[arg_22_1]])
end

function var_0_0.GetCurPointInfos(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:GetCurLevelPointAwardId(arg_23_1)

	return arg_23_0:GetAllPoints(arg_23_1), pg.island_collection_reward[var_23_0].need_exp
end

function var_0_0.AddCanUnlock(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.dataMap[arg_24_1][arg_24_2]:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
end

function var_0_0.HandlePushData(arg_25_0, arg_25_1)
	local var_25_0 = IslandIllustration.TYPES.ITEM

	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		local var_25_1 = arg_25_0.dataMap[var_25_0][iter_25_1.id]

		if var_25_1 then
			if var_25_1:GetStatus() == IslandIllustration.STATUS.LOCK then
				arg_25_0:AddCanUnlock(var_25_0, iter_25_1.id)
			end

			var_25_1:AddHistoryCnt(iter_25_1.num)
			var_25_1:CheckTip()
		end
	end
end

function var_0_0.AddUnlock(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_1) do
		local var_26_0, var_26_1 = IslandIllustration.GetTypeAndLinkId(iter_26_1)

		arg_26_0.dataMap[var_26_0][var_26_1]:SetStatus(IslandIllustration.STATUS.UNLOCK)
		arg_26_0.dataMap[var_26_0][var_26_1]:CheckTip()
	end
end

function var_0_0.AddPointAwardGotId(arg_27_0, arg_27_1)
	local var_27_0 = pg.island_collection_reward[arg_27_1].type

	table.insert(arg_27_0.pointAwardGotMaps[var_27_0], arg_27_1)
end

function var_0_0.OnGetPointDone(arg_28_0, arg_28_1)
	arg_28_0:SetPointDatas(arg_28_1)

	for iter_28_0, iter_28_1 in ipairs(arg_28_1 or {}) do
		local var_28_0, var_28_1 = IslandIllustration.GetTypeAndLinkId(iter_28_1.id)

		arg_28_0.dataMap[var_28_0][var_28_1]:CheckTip()
	end
end

function var_0_0.OnAddNewShip(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.dataMap[IslandIllustration.TYPES.CHAR][arg_29_1]

	if var_29_0 then
		var_29_0:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
	end
end

function var_0_0.OnShipUpgradeOrBreakOut(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.dataMap[IslandIllustration.TYPES.CHAR][arg_30_1]

	if var_30_0 then
		var_30_0:CheckTip()
	end
end

function var_0_0.OnFishingEnd(arg_31_0, arg_31_1)
	if not arg_31_0.dataMap[IslandIllustration.TYPES.FISH] then
		arg_31_0.dataMap[IslandIllustration.TYPES.FISH] = {}
	end

	local var_31_0 = arg_31_0.dataMap[IslandIllustration.TYPES.FISH][arg_31_1]

	if var_31_0 then
		if var_31_0:GetStatus() == IslandIllustration.STATUS.LOCK then
			arg_31_0:AddCanUnlock(IslandIllustration.TYPES.FISH, arg_31_1)
		end

		var_31_0:CheckTip()
	end
end

function var_0_0.IsTipFromTypes(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in ipairs(arg_32_1) do
		if iter_32_1 ~= IslandIllustration.TYPES.FISH or IslandMainBtnTipHelper.IsUnlock("book_fish") then
			local var_32_0, var_32_1 = arg_32_0:GetCurPointInfos(iter_32_1)

			if not arg_32_0:IsGotAllPointAward(iter_32_1) and var_32_1 <= var_32_0 then
				return true
			end

			for iter_32_2, iter_32_3 in pairs(arg_32_0.dataMap[iter_32_1] or {}) do
				if iter_32_3:IsTip() then
					return true
				end
			end
		end
	end

	return false
end

return var_0_0
