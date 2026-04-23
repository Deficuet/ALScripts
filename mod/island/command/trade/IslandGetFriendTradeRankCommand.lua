local var_0_0 = class("IslandGetFriendTradeRankCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().callback
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetTradeAgency()

	if not var_1_1:ShouldRefreshRank() then
		if var_1_0 then
			var_1_0()
		end

		return
	end

	local var_1_2 = GetZeroTime()
	local var_1_3 = GetZeroTime()

	if pg.TimeMgr.GetInstance():GetServerHour() <= 2 then
		var_1_3 = var_1_3 - 86400
	end

	local var_1_4 = var_1_3 + 10800
	local var_1_5 = arg_1_0:CollectFirends()

	if #var_1_5 <= 0 then
		if var_1_0 then
			var_1_0()
		end

		return
	end

	local var_1_6 = {}
	local var_1_7 = {}

	for iter_1_0, iter_1_1 in pairs(var_1_5) do
		table.insert(var_1_6, function(arg_2_0)
			arg_1_0:Send(iter_1_1, function(arg_3_0)
				table.insert(var_1_7, arg_3_0)
				arg_2_0()
			end)
		end)
	end

	seriesAsync(var_1_6, function()
		var_1_1:SetRanks(var_1_7, var_1_4)

		if var_1_0 then
			var_1_0()
		end
	end)
end

function var_0_0.CollectFirends(arg_5_0)
	local var_5_0 = getProxy(FriendProxy):getAllFriends()

	return _.map(var_5_0, function(arg_6_0)
		return arg_6_0.id
	end)
end

function var_0_0.Send(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = pg.TimeMgr.GetInstance():GetServerTime()

	pg.ConnectionMgr.GetInstance():Send(21243, {
		island_id = arg_7_1
	}, 21244, function(arg_8_0)
		local var_8_0 = arg_8_0.today_price.timestamp <= var_7_0 and 0 or arg_8_0.today_price.price
		local var_8_1 = getProxy(FriendProxy):getFriend(arg_7_1)
		local var_8_2 = IslandTradeRank.New({
			id = arg_7_1,
			value = var_8_0,
			skinId = var_8_1 and var_8_1.skinId or 100000,
			islandLevel = arg_8_0.island_lv,
			name = var_8_1 and var_8_1.name or ""
		})

		arg_7_2(var_8_2)
	end)
end

return var_0_0
