local var_0_0 = class("BossRushSettlementCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.body

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 2,
		activity_id = var_1_0.actId
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(ActivityProxy):getActivityById(var_1_0.actId)
			local var_2_1 = var_2_0:GetSeriesData()

			var_2_0:SetSeriesData(nil)

			local var_2_2 = PlayerConst.GetTranAwards(var_1_0, arg_2_0)
			local var_2_3 = var_1_0.actId
			local var_2_4 = getProxy(ActivityProxy):GetBossRushRuntime(var_2_3).settlementData

			getProxy(ActivityProxy):GetBossRushRuntime(var_2_0.id).settlementData = nil

			if var_2_4.win then
				var_2_0:AddPassSeries(var_2_4.seriesId)
			end

			for iter_2_0, iter_2_1 in ipairs(var_2_4) do
				table.insertto(var_2_2, iter_2_1.drops)
				table.insertto(var_2_2, iter_2_1.extraDrops)
			end

			if var_2_1 then
				var_2_1:AddFinalResults(var_2_4)
			end

			getProxy(ActivityProxy):updateActivity(var_2_0)
			seriesAsync({
				function(arg_3_0)
					local var_3_0 = {
						seriesData = var_2_1,
						activityId = var_1_0.actId,
						awards = var_2_2,
						callback = arg_3_0
					}

					if var_1_0.callback then
						var_1_0.callback(var_3_0)
					else
						arg_1_0:sendNotification(GAME.BOSSRUSH_SETTLE_DONE, var_3_0)
					end
				end,
				function(arg_4_0)
					return
				end
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

function var_0_0.ConcludeEXP(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.system
	local var_5_1 = arg_5_0.arg1
	local var_5_2

	if var_5_0 == SYSTEM_BOSS_RUSH_COLLABRATE then
		for iter_5_0, iter_5_1 in pairs(pg.extraenemy_series_template) do
			if table.contains(iter_5_1.activity_series_enemy_id, var_5_1) then
				var_5_2 = CollabrateBossRushSeriesData.New({
					id = iter_5_0,
					actId = arg_5_1.id
				})
				var_5_1 = iter_5_0

				break
			end
		end
	else
		var_5_2 = BossRushSeriesData.New({
			id = var_5_1
		})
	end

	local var_5_3 = {
		seriesId = var_5_1
	}
	local var_5_4 = true
	local var_5_5 = arg_5_2 and arg_5_2[#arg_5_0.re40004]

	if var_5_5 then
		var_5_4 = var_5_5.statistics._battleScore > ys.Battle.BattleConst.BattleScore.C
	end

	var_5_3.win = var_5_4

	for iter_5_2, iter_5_3 in ipairs(arg_5_0.re40004) do
		var_5_3[iter_5_2] = {}

		local var_5_6, var_5_7 = var_0_0.addShipsExp(iter_5_3.ship_exp_list, var_5_0 == SYSTEM_BOSS_RUSH or var_5_0 == SYSTEM_BOSS_RUSH_COLLABRATE)

		var_5_3[iter_5_2].oldShips = var_5_6
		var_5_3[iter_5_2].newShips = var_5_7

		local var_5_8, var_5_9 = var_0_0.GenerateCommanderExp(iter_5_3.commander_exp)

		var_5_3[iter_5_2].oldCmds = var_5_8
		var_5_3[iter_5_2].newCmds = var_5_9
		var_5_3[iter_5_2].mvp = iter_5_3.mvp

		local var_5_10, var_5_11 = var_0_0.GeneralLoot(iter_5_3)

		var_5_3[iter_5_2].drops = var_5_10
		var_5_3[iter_5_2].extraDrops = var_5_11

		local var_5_12 = 0

		if pg.battle_cost_template[var_5_0].oil_cost > 0 then
			local var_5_13 = {
				{
					0,
					0
				},
				{
					0,
					0
				}
			}

			table.Foreach(var_5_6, function(arg_6_0, arg_6_1)
				local var_6_0 = arg_6_1:getStartBattleExpend()
				local var_6_1 = arg_6_1:getEndBattleExpend()
				local var_6_2 = arg_6_1:getTeamType() == TeamType.Submarine and 2 or 1

				var_5_13[var_6_2][1] = var_5_13[var_6_2][1] + var_6_0
				var_5_13[var_6_2][2] = var_5_13[var_6_2][2] + var_6_1
			end)

			local var_5_14 = var_5_2:GetOilLimit()
			local var_5_15 = var_5_13[1][2]

			if var_5_14[1] > 0 then
				var_5_15 = math.clamp(var_5_14[1] - var_5_13[1][1], 0, var_5_13[1][2])
			end

			local var_5_16 = var_5_13[2][2]

			if var_5_14[1] > 0 then
				var_5_16 = math.clamp(var_5_14[2] - var_5_13[2][1], 0, var_5_13[2][2])
			end

			var_5_12 = var_5_15 + var_5_16
		end

		var_5_3[iter_5_2].playerExp = var_0_0.GeneralPlayerCosume(var_5_0, var_5_4, var_5_12, iter_5_3.player_exp)
	end

	return var_5_3
end

function var_0_0.addShipsExp(arg_7_0, arg_7_1)
	local var_7_0 = {}
	local var_7_1 = {}
	local var_7_2 = getProxy(BayProxy)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
		local var_7_3 = iter_7_1.ship_id
		local var_7_4 = iter_7_1.exp
		local var_7_5 = iter_7_1.intimacy
		local var_7_6 = iter_7_1.energy
		local var_7_7 = var_7_2:getShipById(var_7_3)

		var_7_0[var_7_3] = Clone(var_7_7)
		var_7_0[var_7_3].expAdd = var_7_4

		var_7_7:addExp(var_7_4, arg_7_1)

		if arg_7_1 then
			local var_7_8 = pg.gameset.level_get_proficency.key_value

			if (var_7_8 < var_7_7.level or var_7_7.level == var_7_8 and var_7_7.exp > 0) and pg.ship_data_template[var_7_7.configId].can_get_proficency == 1 then
				getProxy(NavalAcademyProxy):AddCourseProficiency(var_7_4)
			end
		end

		if var_7_5 then
			var_7_7:addLikability(var_7_5 - 10000)
		end

		if var_7_6 then
			var_7_7:cosumeEnergy(var_7_6)
		end

		var_7_1[var_7_3] = Clone(var_7_7)

		var_7_2:updateShip(var_7_7)
	end

	return var_7_0, var_7_1
end

function var_0_0.GenerateCommanderExp(arg_8_0)
	local var_8_0 = {}
	local var_8_1 = {}
	local var_8_2 = getProxy(CommanderProxy)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0) do
		local var_8_3 = iter_8_1.commander_id
		local var_8_4 = iter_8_1.exp
		local var_8_5 = var_8_2:getCommanderById(var_8_3)

		var_8_0[var_8_3] = Clone(var_8_5)
		var_8_0[var_8_3].expAdd = iter_8_1.exp

		var_8_5:addExp(var_8_4)

		var_8_1[var_8_3] = Clone(var_8_5)

		var_8_2:updateCommander(var_8_5)
	end

	return var_8_0, var_8_1
end

function var_0_0.GeneralLoot(arg_9_0)
	local var_9_0 = {
		drops = arg_9_0.drop_info,
		extraDrops = arg_9_0.extra_drop_info
	}

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		var_9_0[iter_9_0] = PlayerConst.addTranDrop(iter_9_1)

		underscore.each(var_9_0[iter_9_0], function(arg_10_0)
			if arg_10_0.type == DROP_TYPE_SHIP then
				local var_10_0 = pg.ship_data_template[arg_10_0.id].group_type
				local var_10_1 = getProxy(CollectionProxy)

				arg_10_0.virgin = var_10_1 and var_10_1.shipGroups[var_10_0] == nil
			end
		end)
	end

	return var_9_0.drops, var_9_0.extraDrops
end

function var_0_0.GeneralPlayerCosume(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = getProxy(PlayerProxy)
	local var_11_1 = var_11_0:getData()
	local var_11_2 = {
		oldPlayer = {
			level = var_11_1.level,
			exp = var_11_1.exp
		},
		addExp = arg_11_3
	}

	var_11_1:addExp(arg_11_3)

	local var_11_3 = pg.battle_cost_template[arg_11_0]

	if var_11_3.oil_cost > 0 and arg_11_1 then
		var_11_1:consume({
			gold = 0,
			oil = arg_11_2
		})
	end

	if var_11_3.attack_count > 0 then
		if var_11_3.attack_count == 1 then
			var_11_1:increaseAttackCount()

			if arg_11_1 then
				var_11_1:increaseAttackWinCount()
			end
		elseif var_11_3.attack_count == 2 then
			var_11_1:increasePvpCount()

			if arg_11_1 then
				var_11_1:increasePvpWinCount()
			end
		end
	end

	var_11_0:updatePlayer(var_11_1)

	var_11_2.newPlayer = Clone(var_11_1)

	return var_11_2
end

return var_0_0
