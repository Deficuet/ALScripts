local var_0_0 = class("IslandCheaterTavernMonitor", import("...Core.Net.IslandBaseMonitor"))

var_0_0.ADD_CHEATERTAVERN_PLAYER = "IslandCheaterTavernMonitor:ADD_CHEATERTAVERN_PLAYER"
var_0_0.INIT_PLAYER_DATA_DONE = "IslandCheaterTavernMonitor:INIT_PLAYER_DATA_DONE"

function var_0_0.register(arg_1_0)
	arg_1_0.cheaterTavernAgency = arg_1_0:GetIsland():GetCheaterTavernAgency()

	arg_1_0:on(23101, function(arg_2_0)
		arg_1_0.cheaterTavernAgency:SetIsConnecting()

		if IslandCheaterTavernConst.changeSeat then
			local var_2_0

			for iter_2_0, iter_2_1 in ipairs(arg_2_0.player_list) do
				if iter_2_1.user_id == getProxy(PlayerProxy):getRawData().id then
					var_2_0 = iter_2_1.seat
				end
			end

			local function var_2_1(arg_3_0, arg_3_1, arg_3_2)
				return (arg_3_0 - arg_3_1 + arg_3_2 - 1) % 4 + 1
			end

			for iter_2_2, iter_2_3 in ipairs(arg_2_0.player_list) do
				iter_2_3.seat = var_2_1(iter_2_3.seat, var_2_0, IslandCheaterTavernConst.currentMainSeat)
			end
		end

		onNextTick(function()
			arg_1_0:StartCheaterTevernGame(arg_2_0)
			arg_1_0:InitPlayerDate(arg_2_0)
		end)
	end)
	arg_1_0:on(23102, function(arg_5_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		arg_1_0:CheaterTevernGameEveryRound(arg_5_0)
	end)
	arg_1_0:on(23105, function(arg_6_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		arg_1_0:PlayOperateHandle(arg_6_0)
	end)
	arg_1_0:on(23108, function(arg_7_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		local var_7_0 = getProxy(ActivityProxy)
		local var_7_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND_CHEAT_BAR)
		local var_7_2

		if arg_1_0.cheaterTavernAgency:GetRoomType() == 1 then
			var_7_2 = 0
		else
			var_7_2 = arg_7_0.cur_score - var_7_1.data1
			var_7_1.data1 = arg_7_0.cur_score
			var_7_1.data2 = math.max(arg_7_0.cur_score, var_7_1.data2)

			var_7_0:updateActivity(var_7_1)
		end

		arg_1_0.cheaterTavernAgency:GetMainPlayer():SetGameData(arg_7_0.rank, var_7_2)
		pg.m02:sendNotification(GAME.ISLAND_CHEATER_END_SCORE_NOTIFY, arg_7_0)

		local var_7_3 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.ISLAND_BAR_SIGN_ACT_ID)

		if var_7_3[1] then
			pg.m02:sendNotification(GAME.MINI_GAME_TASK_PROGRESS_UPDATE, {
				progressAdd = 1,
				actId = ActivityConst.ISLAND_BAR_SIGN_ACT_ID,
				taskId = var_7_3[1].id
			})
		end
	end)
	arg_1_0:on(23116, function(arg_8_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		pg.m02:sendNotification(GAME.ISLAND_CHEATER_REAL_END_NOTIFY, arg_8_0)
	end)
	arg_1_0:on(23115, function(arg_9_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		arg_1_0.cheaterTavernAgency:UpdatePlayerDelegateState(arg_9_0.user_id, arg_9_0.state)
		pg.m02:sendNotification(GAME.ISLAND_CHEATER_DELEGATE_NOTIFY)
	end)
end

function var_0_0.InitPlayerDate(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_1.player_list or {}) do
		local var_10_0 = iter_10_1.seat
		local var_10_1 = iter_10_1.player_info
		local var_10_2 = {
			user_view = PlayRoomTools.GetGameViewID(var_10_1.user_view),
			seat = var_10_0,
			id = var_10_1.id
		}

		arg_10_0:GetIsland():DispatchEvent(IslandCheaterTavernMonitor.ADD_CHEATERTAVERN_PLAYER, var_10_2)
	end

	arg_10_0:GetIsland():DispatchEvent(IslandCheaterTavernMonitor.INIT_PLAYER_DATA_DONE)
end

function var_0_0.Init(arg_11_0)
	return
end

function var_0_0.StartCheaterTevernGame(arg_12_0, arg_12_1)
	arg_12_0.cheaterTavernAgency:SetStartGameData(arg_12_1)

	local var_12_0 = {
		user_id = arg_12_1.user_id,
		operationType = IslandCheaterTavernConst.PlayerCurrentOperateType.PutCard,
		auto_time = arg_12_1.auto_time
	}

	pg.m02:sendNotification(GAME.ISLAND_CHEATER_FIRSTROND_START, {
		operation = var_12_0
	})
end

function var_0_0.CheaterTevernGameEveryRound(arg_13_0, arg_13_1)
	arg_13_0.cheaterTavernAgency:UpdateGameDataEveryRound(arg_13_1)

	local var_13_0 = {
		user_id = arg_13_1.user_id,
		operationType = IslandCheaterTavernConst.PlayerCurrentOperateType.PutCard,
		auto_time = arg_13_1.auto_time
	}

	pg.m02:sendNotification(GAME.ISLAND_CHEATER_FIRSTROND_START, {
		operation = var_13_0
	})
end

function var_0_0.PlayOperateHandle(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.user_id
	local var_14_1 = arg_14_1.return_list
	local var_14_2 = getProxy(PlayerProxy):getRawData().id
	local var_14_3

	switch(arg_14_1.type, {
		[IslandCheaterTavernConst.PlayerOperateType.PutCard] = function()
			local var_15_0 = var_14_1[1] == 1
			local var_15_1 = var_14_1[2]

			if var_15_0 and var_14_0 == getProxy(PlayerProxy):getRawData().id then
				var_14_3 = arg_14_0.cheaterTavernAgency:GetMainPlayerAutoPutCard(var_15_1)

				arg_14_0.cheaterTavernAgency:MainPlayerPutCard(var_14_3)
			end

			arg_14_0.cheaterTavernAgency:ReducePlayerCardNum(var_14_0, var_15_1)

			if var_14_0 == var_14_2 then
				IslandCheaterTavernRecordTools.AddRoundCnt()
				IslandCheaterTavernRecordTools.StopPutCardTime()
			end
		end,
		[IslandCheaterTavernConst.PlayerOperateType.Query] = function()
			return
		end,
		[IslandCheaterTavernConst.PlayerOperateType.Shoot] = function()
			local var_17_0 = var_14_1[1]
			local var_17_1 = var_14_1[2]

			warning(tostring(var_14_0) .. "PlayOperateHandle" .. tostring(var_17_0))
			arg_14_0.cheaterTavernAgency:UpdatePlayerBombState(var_14_0, var_17_0, var_17_1)
		end
	}, function()
		return
	end)
	pg.m02:sendNotification(GAME.ISLAND_CHEATER_OPERATE_DONE_NOTIFY, {
		data = arg_14_1,
		putCard = var_14_3
	})
end

return var_0_0
