local var_0_0 = class("IslandGetSeasonRankCommand", pm.SimpleCommand)
local var_0_1 = 100
local var_0_2 = 5

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.seasonId
	local var_1_3 = {}

	local function var_1_4(arg_2_0, arg_2_1)
		if #var_1_3 < (arg_2_0 - 1) * (var_0_1 / var_0_2) then
			arg_2_1()

			return
		end

		pg.ConnectionMgr.GetInstance():Send(18201, {
			page = arg_2_0,
			type = var_1_1,
			act_id = var_1_2
		}, 18202, function(arg_3_0)
			for iter_3_0, iter_3_1 in ipairs(arg_3_0.list) do
				local var_3_0 = PowerRank.New(iter_3_1, var_1_1)

				table.insert(var_1_3, var_3_0)
			end

			arg_2_1()
		end)
	end

	local var_1_5

	local function var_1_6(arg_4_0)
		pg.ConnectionMgr.GetInstance():Send(18203, {
			type = var_1_1,
			act_id = var_1_2
		}, 18204, function(arg_5_0)
			local var_5_0 = getProxy(PlayerProxy):getData()
			local var_5_1 = getProxy(BayProxy):getShipById(var_5_0.character)
			local var_5_2 = {
				user_id = var_5_0.id,
				point = arg_5_0.point,
				name = var_5_0.name,
				lv = var_5_0.level,
				arena_rank = var_5_0.maxRank,
				icon = var_5_1:getConfig("id"),
				skin_id = var_5_1.skinId,
				propose = var_5_1.propose and 1 or 0,
				remoulded = var_5_1:isRemoulded() and 1 or 0
			}

			var_1_5 = PowerRank.New(var_5_2, var_1_1)

			var_1_5:setRank(arg_5_0.rank)
			arg_4_0()
		end)
	end

	local var_1_7 = {}

	for iter_1_0 = 1, var_0_2 do
		table.insert(var_1_7, function(arg_6_0)
			var_1_4(iter_1_0, arg_6_0)
		end)
	end

	table.insert(var_1_7, function(arg_7_0)
		var_1_6(arg_7_0)
	end)
	seriesAsync(var_1_7, function()
		if #var_1_3 > 0 then
			arg_1_0:HandleSamePoint(var_1_2, var_1_3)
		end

		local var_8_0 = getProxy(BillboardProxy)

		var_8_0:setRankList(var_1_1, var_1_2, var_1_3)
		var_8_0:setPlayerRankData(var_1_1, var_1_2, var_1_5)
		arg_1_0:sendNotification(GAME.ISLAND_GET_SEASON_RANK_DONE, {
			seasonId = var_1_2,
			list = var_1_3,
			playerInfo = var_1_5
		})
	end)
end

function var_0_0.HandleSamePoint(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = {}
	local var_9_1 = {}

	local function var_9_2(arg_10_0)
		local var_10_0 = table.indexof(var_9_0, arg_10_0)
		local var_10_1 = 0

		for iter_10_0 = 1, var_10_0 - 1 do
			local var_10_2 = var_9_0[iter_10_0]

			var_10_1 = var_10_1 + var_9_1[var_10_2]
		end

		return var_10_1 + 1
	end

	for iter_9_0, iter_9_1 in ipairs(arg_9_2) do
		local var_9_3 = iter_9_1.power

		if not table.contains(var_9_0, var_9_3) then
			table.insert(var_9_0, var_9_3)

			var_9_1[var_9_3] = 1
		else
			var_9_1[var_9_3] = var_9_1[var_9_3] + 1
		end
	end

	table.sort(var_9_0, function(arg_11_0, arg_11_1)
		return arg_11_1 < arg_11_0
	end)

	for iter_9_2, iter_9_3 in ipairs(arg_9_2) do
		local var_9_4 = iter_9_3.power
		local var_9_5 = var_9_2(var_9_4)

		iter_9_3:setRank(var_9_5)
	end
end

return var_0_0
