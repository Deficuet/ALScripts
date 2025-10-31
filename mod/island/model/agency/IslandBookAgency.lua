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

		local var_1_5 = var_1_3 == IslandIllustration.TYPES.CHAR and IslandCharIllustration.New(iter_1_7) or IslandIllustration.New(iter_1_7)

		if table.contains(var_1_1, iter_1_7) then
			var_1_5:SetStatus(IslandIllustration.STATUS.UNLOCK)
		elseif var_1_2[var_1_3] and var_1_2[var_1_3][var_1_4] then
			var_1_5:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
		end

		arg_1_0.dataMap[var_1_3][var_1_4] = var_1_5
	end

	arg_1_0:SetPointDatas(var_1_0.book_collects)

	arg_1_0.pointAwardGotIds = {}

	for iter_1_8, iter_1_9 in ipairs(var_1_0.book_awards) do
		table.insert(arg_1_0.pointAwardGotIds, iter_1_9)
	end

	arg_1_0.pointAwardIds = Clone(pg.island_collection_reward.all)

	table.sort(arg_1_0.pointAwardIds, CompareFuncs({
		function(arg_2_0)
			return pg.island_collection_reward[arg_2_0].level
		end,
		function(arg_3_0)
			return arg_3_0
		end
	}))
end

function var_0_0.SetPointDatas(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_1 or {}) do
		local var_4_0, var_4_1 = IslandIllustration.GetTypeAndLinkId(iter_4_1.id)

		arg_4_0.dataMap[var_4_0][var_4_1]:SetPointData(iter_4_1)
	end
end

function var_0_0.InitShipTypeData(arg_5_0)
	local var_5_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	for iter_5_0, iter_5_1 in pairs(arg_5_0.dataMap[IslandIllustration.TYPES.CHAR] or {}) do
		if var_5_0:GetShipById(iter_5_1:GetLinkConfigID()) then
			local var_5_1 = iter_5_1:GetStatus()

			if var_5_1 == IslandIllustration.STATUS.UNLOCK then
				iter_5_1:CheckTip()
			elseif var_5_1 == IslandIllustration.STATUS.LOCK then
				iter_5_1:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
			end
		end
	end
end

function var_0_0.GetListByType(arg_6_0, arg_6_1)
	return underscore.values(arg_6_0.dataMap[arg_6_1])
end

function var_0_0.GetIllustration(arg_7_0, arg_7_1, arg_7_2)
	return arg_7_0.dataMap[arg_7_1] and arg_7_0.dataMap[arg_7_1][arg_7_2]
end

function var_0_0.GetAllPoints(arg_8_0)
	local var_8_0 = 0

	for iter_8_0, iter_8_1 in pairs(arg_8_0.dataMap[IslandIllustration.TYPES.CHAR]) do
		var_8_0 = var_8_0 + iter_8_1:GetPoints()
	end

	return var_8_0
end

function var_0_0.GetPoints(arg_9_0, arg_9_1, arg_9_2)
	return arg_9_0.dataMap[arg_9_1][arg_9_2]:GetPoints()
end

function var_0_0.GetCurLevelPointAwardId(arg_10_0)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.pointAwardIds) do
		if not table.contains(arg_10_0.pointAwardGotIds, iter_10_1) then
			return iter_10_1
		end
	end

	return arg_10_0.pointAwardIds[#arg_10_0.pointAwardIds]
end

function var_0_0.GetPointAwardGotIds(arg_11_0)
	return arg_11_0.pointAwardGotIds
end

function var_0_0.IsGotAllPointAward(arg_12_0)
	return table.contains(arg_12_0.pointAwardGotIds, arg_12_0.pointAwardIds[#arg_12_0.pointAwardIds])
end

function var_0_0.GetCurPointInfos(arg_13_0)
	local var_13_0 = arg_13_0:GetCurLevelPointAwardId()

	return arg_13_0:GetAllPoints(), pg.island_collection_reward[var_13_0].need_exp
end

function var_0_0.AddCanUnlock(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.dataMap[arg_14_1][arg_14_2]:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
end

function var_0_0.AddCanUnlockItems(arg_15_0, arg_15_1)
	local var_15_0 = IslandIllustration.TYPES.ITEM

	for iter_15_0, iter_15_1 in ipairs(arg_15_1 or {}) do
		arg_15_0:AddCanUnlock(var_15_0, iter_15_1)
	end
end

function var_0_0.AddUnlock(arg_16_0, arg_16_1)
	local var_16_0, var_16_1 = IslandIllustration.GetTypeAndLinkId(arg_16_1)

	arg_16_0.dataMap[var_16_0][var_16_1]:SetStatus(IslandIllustration.STATUS.UNLOCK)
	arg_16_0.dataMap[var_16_0][var_16_1]:CheckTip()
end

function var_0_0.AddPointAwardGotId(arg_17_0, arg_17_1)
	table.insert(arg_17_0.pointAwardGotIds, arg_17_1)
end

function var_0_0.OnGetPointDone(arg_18_0, arg_18_1)
	arg_18_0:SetPointDatas(arg_18_1)

	for iter_18_0, iter_18_1 in ipairs(arg_18_1 or {}) do
		local var_18_0, var_18_1 = IslandIllustration.GetTypeAndLinkId(iter_18_1.id)

		arg_18_0.dataMap[var_18_0][var_18_1]:CheckTip()
	end
end

function var_0_0.OnAddNewShip(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.dataMap[IslandIllustration.TYPES.CHAR][arg_19_1]

	if var_19_0 then
		var_19_0:SetStatus(IslandIllustration.STATUS.CAN_UNLOCK)
	end
end

function var_0_0.OnShipUpgradeOrBreakOut(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.dataMap[IslandIllustration.TYPES.CHAR][arg_20_1]

	if var_20_0 then
		var_20_0:CheckTip()
	end
end

function var_0_0.IsTipFromTypes(arg_21_0, arg_21_1)
	local var_21_0, var_21_1 = arg_21_0:GetCurPointInfos()
	local var_21_2 = not arg_21_0:IsGotAllPointAward() and var_21_1 <= var_21_0

	if table.contains(arg_21_1, IslandIllustration.TYPES.CHAR) and var_21_2 then
		return true
	end

	for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
		for iter_21_2, iter_21_3 in pairs(arg_21_0.dataMap[iter_21_1] or {}) do
			if iter_21_3:IsTip() then
				return true
			end
		end
	end

	return false
end

return var_0_0
