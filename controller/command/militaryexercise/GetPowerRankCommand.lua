local var_0_0 = class("GetPowerRankCommand", pm.SimpleCommand)
local var_0_1 = 100
local var_0_2 = 5

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.activityId

	assert(var_1_1, "type can not be nil")

	local var_1_3 = getProxy(BillboardProxy)

	local function var_1_4(arg_2_0, arg_2_1)
		var_1_3:setRankList(var_1_1, var_1_2, arg_2_0)
		var_1_3:setPlayerRankData(var_1_1, var_1_2, arg_2_1)
		arg_1_0:sendNotification(GAME.GET_POWERRANK_DONE, {
			list = arg_2_0,
			type = var_1_1,
			playerRankinfo = arg_2_1,
			activityId = var_1_2
		})
	end

	if var_1_1 == PowerRank.TYPE_MILITARY_RANK then
		pg.ConnectionMgr.GetInstance():Send(18006, {
			type = 0
		}, 18007, function(arg_3_0)
			local var_3_0 = {}

			for iter_3_0, iter_3_1 in ipairs(arg_3_0.arena_rank_lsit) do
				local var_3_1 = PowerRank.New(iter_3_1, var_1_1)

				var_3_1:setRank(iter_3_0)
				var_3_1:setArenaRank(SeasonInfo.getEmblem(iter_3_1.score, iter_3_0))
				table.insert(var_3_0, var_3_1)
			end

			local var_3_2 = getProxy(PlayerProxy):getData()
			local var_3_3 = getProxy(BayProxy):GetShipPhantom(var_3_2:GetFlagShipPhantomMark())
			local var_3_4 = {
				id = var_3_2.id,
				level = var_3_2.level,
				name = var_3_2.name,
				score = var_3_2.score,
				arena_rank = SeasonInfo.getEmblem(var_3_2.score, var_3_2.rank),
				icon = var_3_3:getConfig("id"),
				skin_id = var_3_3:getSkinId(),
				propose = var_3_3.propose and 1 or 0,
				remoulded = var_3_3:isRemoulded() and 1 or 0
			}
			local var_3_5 = PowerRank.New(var_3_4, var_1_1)

			var_3_5:setRank(var_3_2.rank)
			var_1_4(var_3_0, var_3_5)
		end)
	else
		local var_1_5 = {}

		local function var_1_6(arg_4_0, arg_4_1)
			if #var_1_5 < (arg_4_0 - 1) * (var_0_1 / var_0_2) then
				arg_4_1()

				return
			end

			pg.ConnectionMgr.GetInstance():Send(18201, {
				page = arg_4_0,
				type = var_1_1,
				act_id = var_1_2 or 0
			}, 18202, function(arg_5_0)
				for iter_5_0, iter_5_1 in ipairs(arg_5_0.list) do
					local var_5_0 = PowerRank.New(iter_5_1, var_1_1)

					table.insert(var_1_5, var_5_0)
				end

				arg_4_1()
			end)
		end

		local var_1_7

		local function var_1_8(arg_6_0)
			pg.ConnectionMgr.GetInstance():Send(18203, {
				type = var_1_1,
				act_id = var_1_2 or 0
			}, 18204, function(arg_7_0)
				local var_7_0 = getProxy(PlayerProxy):getData()
				local var_7_1 = getProxy(BayProxy):GetShipPhantom(var_7_0:GetFlagShipPhantomMark())
				local var_7_2

				if var_1_1 == PowerRank.TYPE_POWER then
					var_7_2 = getProxy(BayProxy):getBayPower()
				elseif var_1_1 == PowerRank.TYPE_COLLECTION then
					var_7_2 = getProxy(CollectionProxy):getCollectionCount()
				elseif var_1_1 == PowerRank.TYPE_PT or var_1_1 == PowerRank.TYPE_ACT_BOSS_BATTLE then
					assert(var_1_2)

					local var_7_3 = getProxy(ActivityProxy):getActivityById(var_1_2)

					var_7_2 = var_7_3 and var_7_3.data1 or arg_7_0.point
				elseif var_1_1 == PowerRank.TYPE_CHALLENGE then
					local var_7_4 = PowerRank:getActivityByRankType(PowerRank.TYPE_CHALLENGE)

					if getProxy(ChallengeProxy):getChallengeInfo() then
						local var_7_5 = var_7_4 and getProxy(ChallengeProxy):getChallengeInfo():getGradeList().seasonMaxScore

						var_7_2 = var_7_4 and var_7_5 or arg_7_0.point
					else
						var_7_2 = arg_7_0.point
					end
				elseif var_1_1 == PowerRank.TYPE_EXTRA_CHAPTER then
					local var_7_6 = PowerRank:getActivityByRankType(PowerRank.TYPE_EXTRA_CHAPTER)

					var_7_2 = var_7_6 and var_7_6.data1 or arg_7_0.point
				elseif var_1_1 == PowerRank.TYPE_BOSSRUSH then
					local var_7_7 = PowerRank:getActivityByRankType(PowerRank.TYPE_BOSSRUSH)

					var_7_2 = var_7_7 and var_7_7.data1 or arg_7_0.point
				else
					var_7_2 = arg_7_0.point
				end

				local var_7_8 = {
					user_id = var_7_0.id,
					point = var_7_2,
					name = var_7_0.name,
					lv = var_7_0.level,
					arena_rank = var_7_0.maxRank,
					icon = var_7_1:getConfig("id"),
					skin_id = var_7_1:getSkinId(),
					propose = var_7_1.propose and 1 or 0,
					remoulded = var_7_1:isRemoulded() and 1 or 0
				}

				var_1_7 = PowerRank.New(var_7_8, var_1_1)

				var_1_7:setRank(arg_7_0.rank)
				arg_6_0()
			end)
		end

		local var_1_9 = {}

		for iter_1_0 = 1, var_0_2 do
			table.insert(var_1_9, function(arg_8_0)
				var_1_6(iter_1_0, arg_8_0)
			end)
		end

		table.insert(var_1_9, function(arg_9_0)
			var_1_8(arg_9_0)
		end)
		seriesAsync(var_1_9, function()
			if #var_1_5 > 0 and var_1_7 then
				local var_10_0 = {}
				local var_10_1 = {}

				local function var_10_2(arg_11_0)
					local var_11_0 = table.indexof(var_10_0, arg_11_0)
					local var_11_1 = 0

					for iter_11_0 = 1, var_11_0 - 1 do
						local var_11_2 = var_10_0[iter_11_0]

						var_11_1 = var_11_1 + var_10_1[var_11_2]
					end

					return var_11_1 + 1
				end

				for iter_10_0, iter_10_1 in ipairs(var_1_5) do
					local var_10_3 = iter_10_1.power

					if not table.contains(var_10_0, var_10_3) then
						table.insert(var_10_0, var_10_3)

						var_10_1[var_10_3] = 1
					else
						var_10_1[var_10_3] = var_10_1[var_10_3] + 1
					end
				end

				table.sort(var_10_0, function(arg_12_0, arg_12_1)
					return arg_12_1 < arg_12_0
				end)

				for iter_10_2, iter_10_3 in ipairs(var_1_5) do
					local var_10_4 = iter_10_3.power
					local var_10_5 = var_10_2(var_10_4)

					iter_10_3:setRank(var_10_5)
				end
			end

			var_1_4(var_1_5, var_1_7)
		end)
	end
end

return var_0_0
