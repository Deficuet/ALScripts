local var_0_0 = class("IslandTradegency", import(".IslandBaseAgency"))

var_0_0.WEEK_NUM_UPDATE = "IslandTradegency:WEEK_NUM_UPDATE"
var_0_0.RESET_PRICE = "IslandTradegency:RESET_PRICE"
var_0_0.INVITE_LIST_UPDATE = "IslandTradegency:INVITE_LIST_UPDATE"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.treasure or {}

	arg_1_0.weekNum = var_1_0.week_buy_num or 0
	arg_1_0.weekNumMax = pg.island_set.treasure_week_limit.key_value_varchar[1]
	arg_1_0.sellNumMax = pg.island_set.treasure_week_limit.key_value_varchar[2]
	arg_1_0.coefficient = pg.island_set.treasure_price_buy.key_value_int * 0.01
	arg_1_0.sellList = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.sell_list or {}) do
		arg_1_0.sellList[iter_1_1.island_id] = iter_1_1.num
	end

	arg_1_0.priceList = {}

	for iter_1_2, iter_1_3 in ipairs(var_1_0.price_list or {}) do
		arg_1_0.priceList[iter_1_3.timestamp] = iter_1_3.price
	end

	arg_1_0.ranks = {}
	arg_1_0.inviteList = {}

	for iter_1_4, iter_1_5 in ipairs(var_1_0.invite_list or {}) do
		table.insert(arg_1_0.inviteList, iter_1_5)
	end

	arg_1_0.cacheRankTime = 0
end

function var_0_0.IsInvited(arg_2_0, arg_2_1)
	return table.contains(arg_2_0.inviteList, arg_2_1)
end

function var_0_0.UpdateInviteList(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		table.insert(arg_3_0.inviteList, iter_3_1)
	end

	arg_3_0:DispatchEvent(var_0_0.INVITE_LIST_UPDATE)
end

function var_0_0.ClearInviteList(arg_4_0)
	arg_4_0.inviteList = {}

	arg_4_0:DispatchEvent(var_0_0.INVITE_LIST_UPDATE)
end

function var_0_0.GetSellLimit(arg_5_0, arg_5_1)
	return arg_5_0.sellList[arg_5_1] or 0
end

function var_0_0.UpdateSellLimit(arg_6_0, arg_6_1, arg_6_2)
	if not arg_6_0.sellList[arg_6_1] then
		arg_6_0.sellList[arg_6_1] = 0
	end

	arg_6_0.sellList[arg_6_1] = arg_6_0.sellList[arg_6_1] + arg_6_2
end

function var_0_0.GetSellLimitMax(arg_7_0)
	return arg_7_0.sellNumMax
end

function var_0_0.GetCanSellCnt(arg_8_0, arg_8_1)
	local var_8_0 = getProxy(IslandProxy):GetIsland()
	local var_8_1 = var_8_0:GetInventoryAgency():GetOwnCount(IslandItem.PEARL_ID)

	if var_8_0.id == arg_8_1 then
		return var_8_1
	end

	return math.min(var_8_1, arg_8_0.sellNumMax - arg_8_0:GetSellLimit(arg_8_1))
end

function var_0_0.GetCanPurchaseCnt(arg_9_0)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOwnCount(IslandItem.GOLD_ID)
	local var_9_1 = arg_9_0:GetTodayPrice()
	local var_9_2 = math.floor(var_9_0 / var_9_1)

	return math.min(var_9_2, arg_9_0.weekNumMax - arg_9_0.weekNum)
end

function var_0_0.GetWeekNum(arg_10_0)
	return arg_10_0.weekNum
end

function var_0_0.GetWeekNumMax(arg_11_0)
	return arg_11_0.weekNumMax
end

function var_0_0.UpdateWeekNum(arg_12_0, arg_12_1)
	arg_12_0.weekNum = arg_12_0.weekNum + arg_12_1

	arg_12_0:DispatchEvent(var_0_0.WEEK_NUM_UPDATE)
end

function var_0_0.ResetWeekNum(arg_13_0)
	arg_13_0.weekNum = 0

	arg_13_0:DispatchEvent(var_0_0.WEEK_NUM_UPDATE)
end

function var_0_0.ShouldRefreshRank(arg_14_0)
	if #arg_14_0.ranks <= 0 then
		return true
	end

	return arg_14_0.cacheRankTime < pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.SetRanks(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.ranks = arg_15_1
	arg_15_0.cacheRankTime = arg_15_2
end

function var_0_0.GetRanks(arg_16_0)
	local var_16_0 = arg_16_0:GetSelfRank()

	var_16_0:SetValue(math.floor(var_16_0.value * arg_16_0.coefficient))

	return _.map(arg_16_0.ranks, function(arg_17_0)
		local var_17_0 = Clone(arg_17_0)

		var_17_0:SetValue(math.floor(arg_17_0.value * arg_16_0.coefficient))

		return var_17_0
	end), var_16_0
end

function var_0_0.GetSelfRank(arg_18_0)
	local var_18_0 = getProxy(PlayerProxy):getRawData()
	local var_18_1 = getProxy(IslandProxy):GetIsland()
	local var_18_2 = var_18_1:GetLevel()
	local var_18_3 = var_18_1:GetTradeAgency():GetTodaySellPrice()

	return (IslandTradeRank.New({
		id = var_18_0.id,
		value = var_18_3,
		skinId = var_18_0.skinId,
		islandLevel = var_18_2,
		name = var_18_0.name or ""
	}))
end

function var_0_0.GetSellRanks(arg_19_0)
	local var_19_0 = arg_19_0:GetSelfRank()

	return arg_19_0.ranks, var_19_0
end

function var_0_0.GetLatestTime(arg_20_0)
	local var_20_0 = {}

	for iter_20_0, iter_20_1 in pairs(arg_20_0.priceList) do
		table.insert(var_20_0, iter_20_0)
	end

	table.sort(var_20_0, function(arg_21_0, arg_21_1)
		return arg_21_1 < arg_21_0
	end)

	return var_20_0[1] or -1
end

function var_0_0.CanPurchase(arg_22_0)
	return pg.TimeMgr.GetInstance():GetServerTime() <= arg_22_0:GetLatestTime()
end

function var_0_0.GetTodayPrice(arg_23_0)
	local var_23_0 = arg_23_0:GetTodaySellPrice()

	return math.floor(var_23_0 * arg_23_0.coefficient)
end

function var_0_0.GetTodaySellPrice(arg_24_0)
	local var_24_0 = arg_24_0:GetLatestTime()

	return arg_24_0.priceList[var_24_0] or 0
end

function var_0_0.UpdateTodayPrice(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.priceList[arg_25_1] = arg_25_2

	arg_25_0:ClearInviteList()

	arg_25_0.sellList = {}

	arg_25_0:DispatchEvent(var_0_0.RESET_PRICE)
end

function var_0_0.GetPriceTrend(arg_26_0)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0.priceList) do
		var_26_0[iter_26_0 - 86400] = math.floor(iter_26_1 * arg_26_0.coefficient)
	end

	return var_26_0
end

function var_0_0.GetSellPriceTrend(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.priceList) do
		var_27_0[iter_27_0 - 86400] = iter_27_1
	end

	return var_27_0
end

function var_0_0.ExistTrade(arg_28_0, arg_28_1)
	return arg_28_0:GetPriceTrend()[arg_28_1] ~= nil
end

function var_0_0.UpdatePerHour(arg_29_0, arg_29_1)
	if pg.TimeMgr.GetInstance():GetServerWeek() == 1 and arg_29_1 == 3 then
		arg_29_0:ResetWeekNum()
	end

	if arg_29_1 == 3 then
		-- block empty
	end
end

return var_0_0
