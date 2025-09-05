local var_0_0 = class("IslandRestaurant", import("model.vo.BaseVO"))

var_0_0.STATUS = {
	PREPARE = "prepare",
	END = "end",
	OPENING = "opening",
	CLOSE = "close"
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.level = arg_1_1.lv or 1
	arg_1_0.rankCfg = pg.island_manage_rank[arg_1_0.level] or 1
	arg_1_0.sales = arg_1_1.total_sell or 0

	arg_1_0:SetCommodities(arg_1_1.sell_list or {}, arg_1_1.rest_list or {})
	arg_1_0:SetAssistants(arg_1_1.post_list or {})
	arg_1_0:SetEndTime(arg_1_1.end_time or 0)
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_manage_restaurant
end

function var_0_0.SetCommodities(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.commodities = {}
	arg_3_0.sellCommodities = {}
	arg_3_0.remainCommodities = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		local var_3_0 = iter_3_1.food_id
		local var_3_1 = iter_3_1.num
		local var_3_2 = iter_3_1.sell_money

		table.insert(arg_3_0.sellCommodities, {
			id = var_3_0,
			num = var_3_1,
			price = var_3_2
		})

		arg_3_0.commodities[var_3_0] = {
			id = var_3_0,
			num = var_3_1
		}
	end

	for iter_3_2, iter_3_3 in ipairs(arg_3_2) do
		local var_3_3 = iter_3_3.food_id
		local var_3_4 = iter_3_3.num

		table.insert(arg_3_0.remainCommodities, {
			id = var_3_3,
			num = var_3_4
		})

		local var_3_5 = arg_3_0.commodities[var_3_3] and arg_3_0.commodities[var_3_3].num or 0

		arg_3_0.commodities[var_3_3] = {
			id = var_3_3,
			num = var_3_4 + var_3_5
		}
	end
end

function var_0_0.GetCommondities(arg_4_0)
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in pairs(arg_4_0.commodities) do
		table.insert(var_4_0, iter_4_1)
	end

	return var_4_0
end

function var_0_0.GetSellCommondities(arg_5_0)
	return arg_5_0.sellCommodities
end

function var_0_0.GetRemainCommodities(arg_6_0)
	return arg_6_0.remainCommodities
end

function var_0_0.SetAssistants(arg_7_0, arg_7_1)
	arg_7_0.assistants = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		table.insert(arg_7_0.assistants, {
			id = iter_7_1.post_id,
			shipId = iter_7_1.ship_id
		})
	end
end

function var_0_0.GetAssistants(arg_8_0)
	return arg_8_0.assistants
end

function var_0_0.ClearAssistantShips(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.assistants) do
		iter_9_1.shipId = 0
	end
end

function var_0_0.SetEndTime(arg_10_0, arg_10_1)
	arg_10_0.endTime = arg_10_1
end

function var_0_0.GetEndTime(arg_11_0)
	return arg_11_0.endTime
end

function var_0_0.InitRemainCnt(arg_12_0, arg_12_1)
	arg_12_0.remainCnt = arg_12_0:getConfig("opening_number") - arg_12_1
end

function var_0_0.ReduceRemainCnt(arg_13_0)
	arg_13_0.remainCnt = arg_13_0.remainCnt - 1
end

function var_0_0.GetRemainCnt(arg_14_0)
	return arg_14_0.remainCnt
end

function var_0_0.InitEventData(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.eventId = arg_15_1
	arg_15_0.eventEffects = arg_15_2
	arg_15_0.eventInfluence = 0

	if arg_15_0.eventId ~= 0 then
		arg_15_0.eventInfluence = pg.island_manage_event[arg_15_0.eventId].influence_bonus / 100
	end
end

function var_0_0.GetEventInfo(arg_16_0)
	return arg_16_0.eventId, arg_16_0.eventEffects, arg_16_0.eventInfluence
end

function var_0_0.GetStatus(arg_17_0)
	if arg_17_0.endTime ~= 0 then
		return pg.TimeMgr.GetInstance():GetServerTime() > arg_17_0.endTime and var_0_0.STATUS.CLOSE or var_0_0.STATUS.OPENING
	else
		return arg_17_0.remainCnt > 0 and var_0_0.STATUS.PREPARE or var_0_0.STATUS.END
	end
end

function var_0_0.AddSales(arg_18_0)
	local var_18_0 = 0

	for iter_18_0, iter_18_1 in pairs(arg_18_0.sellCommodities) do
		var_18_0 = var_18_0 + iter_18_1.price
	end

	IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.RESTAURANT_SALES, arg_18_0.id, var_18_0)

	arg_18_0.sales = arg_18_0.sales + var_18_0

	return arg_18_0:CheckUpgrade()
end

function var_0_0.GetSales(arg_19_0)
	return arg_19_0.sales
end

function var_0_0.CheckUpgrade(arg_20_0)
	local var_20_0 = arg_20_0:GetCanUpgradeExp()

	if var_20_0 ~= 0 and var_20_0 <= arg_20_0.sales then
		arg_20_0.level = arg_20_0.level + 1
		arg_20_0.rankCfg = pg.island_manage_rank[arg_20_0.level]

		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandRestUpgrade(arg_20_0.id, arg_20_0.level))
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.RESTAURANT_RANK)

		return true
	end

	return false
end

function var_0_0.UnlockNewAssistant(arg_21_0, arg_21_1)
	table.insert(arg_21_0.assistants, {
		shipId = 0,
		id = arg_21_1
	})
end

function var_0_0.GetRankLevel(arg_22_0)
	return arg_22_0.level
end

function var_0_0.GetShelfCnt(arg_23_0)
	return arg_23_0.rankCfg.slot_num[1]
end

function var_0_0.GetBaseShelfCapacity(arg_24_0)
	return arg_24_0.rankCfg.slot_num[2]
end

function var_0_0.GetRandomSaleCntBound(arg_25_0)
	local var_25_0 = math.huge
	local var_25_1 = -math.huge

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.rankCfg.random_range) do
		if iter_25_1 < var_25_0 then
			var_25_0 = iter_25_1
		end

		if var_25_1 < iter_25_1 then
			var_25_1 = iter_25_1
		end
	end

	return var_25_0, var_25_1
end

function var_0_0.GetCanUpgradeExp(arg_26_0)
	return underscore.detect(arg_26_0.rankCfg.level_up_exp, function(arg_27_0)
		return arg_27_0[1] == arg_26_0.id
	end)[2]
end

function var_0_0.GetRankFactor(arg_28_0)
	return arg_28_0.rankCfg.bonus_coefficient / 100
end

function var_0_0.GetRankIcon(arg_29_0)
	return arg_29_0.rankCfg.icon
end

function var_0_0.UpdateData(arg_30_0, arg_30_1)
	arg_30_0.level = arg_30_1.lv or 1
	arg_30_0.rankCfg = pg.island_manage_rank[arg_30_0.level] or 1
	arg_30_0.sales = arg_30_1.total_sell or 0

	arg_30_0:SetCommodities(arg_30_1.sell_list or {}, arg_30_1.rest_list or {})
	arg_30_0:SetAssistants(arg_30_1.post_list or {})
	arg_30_0:SetEndTime(arg_30_1.end_time or 0)
end

function var_0_0.GET_RNAK_EXPS(arg_31_0)
	local var_31_0 = {}
	local var_31_1 = pg.island_manage_rank

	for iter_31_0, iter_31_1 in ipairs(var_31_1.all) do
		var_31_0[iter_31_1] = underscore.detect(var_31_1[iter_31_1].level_up_exp, function(arg_32_0)
			return arg_32_0[1] == arg_31_0
		end)[2]
	end

	return var_31_0
end

return var_0_0
