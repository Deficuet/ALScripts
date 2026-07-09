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

			local var_2_5

			if var_2_4.win then
				var_2_0:AddPassSeries(var_2_4.seriesId)
				getProxy(ChapterProxy):addRemasterPassCount(var_2_4.seriesId, var_1_0.actId)

				local var_2_6 = BossRushChapterRemasterHelper.GetActivityRemasterByFinalSeriesId(var_1_0.actId, var_2_4.seriesId)

				var_2_5 = var_2_6 and var_2_6.memory_group

				if var_2_0:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
					var_2_0:AddUsedBonus(var_2_4.seriesId)
				end
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
				function(arg_3_0, arg_3_1)
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
					if not BossRushChapterRemasterHelper.UnlockMemoryGroupStoriesAndShowMsgBox(var_2_5, function(arg_5_0)
						arg_4_0(arg_5_0)
					end) then
						arg_4_0({})
					end
				end
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

function var_0_0.ConcludeEXP(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.system
	local var_6_1 = arg_6_0.arg1
	local var_6_2

	if var_6_0 == SYSTEM_BOSS_RUSH_COLLABRATE then
		for iter_6_0, iter_6_1 in ipairs(pg.extraenemy_series_template) do
			local var_6_3 = pg.extraenemy_series_template[iter_6_1]

			if table.contains(var_6_3.activity_series_enemy_id, var_6_1) then
				var_6_2 = CollabrateBossRushSeriesData.New({
					id = iter_6_1,
					actId = arg_6_1.id
				})
				var_6_1 = iter_6_1

				break
			end
		end
	else
		var_6_2 = BossRushSeriesData.New({
			id = var_6_1
		})
	end

	local var_6_4 = {
		seriesId = var_6_1
	}
	local var_6_5 = true
	local var_6_6 = arg_6_2 and arg_6_2[#arg_6_0.re40004]

	if var_6_6 then
		var_6_5 = var_6_6.statistics._battleScore > ys.Battle.BattleConst.BattleScore.C
	end

	var_6_4.win = var_6_5

	for iter_6_2, iter_6_3 in ipairs(arg_6_0.re40004) do
		var_6_4[iter_6_2] = {}

		local var_6_7, var_6_8 = var_0_0.addShipsExp(iter_6_3.ship_exp_list, var_6_0 == SYSTEM_BOSS_RUSH or var_6_0 == SYSTEM_BOSS_RUSH_COLLABRATE)

		var_6_4[iter_6_2].oldShips = var_6_7
		var_6_4[iter_6_2].newShips = var_6_8

		local var_6_9, var_6_10 = var_0_0.GenerateCommanderExp(iter_6_3.commander_exp)

		var_6_4[iter_6_2].oldCmds = var_6_9
		var_6_4[iter_6_2].newCmds = var_6_10
		var_6_4[iter_6_2].mvp = iter_6_3.mvp

		local var_6_11, var_6_12 = var_0_0.GeneralLoot(iter_6_3)

		var_6_4[iter_6_2].drops = var_6_11
		var_6_4[iter_6_2].extraDrops = var_6_12

		local var_6_13 = 0

		if pg.battle_cost_template[var_6_0].oil_cost > 0 then
			local var_6_14 = {
				{
					0,
					0
				},
				{
					0,
					0
				}
			}

			table.Foreach(var_6_7, function(arg_7_0, arg_7_1)
				local var_7_0 = arg_7_1:getStartBattleExpend()
				local var_7_1 = arg_7_1:getEndBattleExpend()
				local var_7_2 = arg_7_1:getTeamType() == TeamType.Submarine and 2 or 1

				var_6_14[var_7_2][1] = var_6_14[var_7_2][1] + var_7_0
				var_6_14[var_7_2][2] = var_6_14[var_7_2][2] + var_7_1
			end)

			local var_6_15 = var_6_2:GetOilLimit()
			local var_6_16 = var_6_14[1][2]

			if var_6_15[1] > 0 then
				var_6_16 = math.clamp(var_6_15[1] - var_6_14[1][1], 0, var_6_14[1][2])
			end

			local var_6_17 = var_6_14[2][2]

			if var_6_15[1] > 0 then
				var_6_17 = math.clamp(var_6_15[2] - var_6_14[2][1], 0, var_6_14[2][2])
			end

			var_6_13 = var_6_16 + var_6_17
		end

		var_6_4[iter_6_2].playerExp = var_0_0.GeneralPlayerCosume(var_6_0, var_6_5, var_6_13, iter_6_3.player_exp)
	end

	return var_6_4
end

function var_0_0.addShipsExp(arg_8_0, arg_8_1)
	local var_8_0 = {}
	local var_8_1 = {}
	local var_8_2 = getProxy(BayProxy)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0) do
		local var_8_3 = iter_8_1.ship_id
		local var_8_4 = iter_8_1.exp
		local var_8_5 = iter_8_1.intimacy
		local var_8_6 = iter_8_1.energy
		local var_8_7 = var_8_2:getShipById(var_8_3)

		var_8_0[var_8_3] = Clone(var_8_7)
		var_8_0[var_8_3].expAdd = var_8_4

		var_8_7:addExp(var_8_4, arg_8_1)

		if arg_8_1 then
			local var_8_8 = pg.gameset.level_get_proficency.key_value

			if (var_8_8 < var_8_7.level or var_8_7.level == var_8_8 and var_8_7.exp > 0) and pg.ship_data_template[var_8_7.configId].can_get_proficency == 1 then
				getProxy(NavalAcademyProxy):AddCourseProficiency(var_8_4)
			end
		end

		if var_8_5 then
			var_8_7:addLikability(var_8_5 - 10000)
		end

		if var_8_6 then
			var_8_7:cosumeEnergy(var_8_6)
		end

		var_8_1[var_8_3] = Clone(var_8_7)

		var_8_2:updateShip(var_8_7)
	end

	return var_8_0, var_8_1
end

function var_0_0.GenerateCommanderExp(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = {}
	local var_9_2 = getProxy(CommanderProxy)

	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		local var_9_3 = iter_9_1.commander_id
		local var_9_4 = iter_9_1.exp
		local var_9_5 = var_9_2:getCommanderById(var_9_3)

		var_9_0[var_9_3] = Clone(var_9_5)
		var_9_0[var_9_3].expAdd = iter_9_1.exp

		var_9_5:addExp(var_9_4)

		var_9_1[var_9_3] = Clone(var_9_5)

		var_9_2:updateCommander(var_9_5)
	end

	return var_9_0, var_9_1
end

function var_0_0.GeneralLoot(arg_10_0)
	local var_10_0 = {
		drops = arg_10_0.drop_info,
		extraDrops = arg_10_0.extra_drop_info
	}

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		var_10_0[iter_10_0] = PlayerConst.addTranDrop(iter_10_1)

		underscore.each(var_10_0[iter_10_0], function(arg_11_0)
			if arg_11_0.type == DROP_TYPE_SHIP then
				local var_11_0 = pg.ship_data_template[arg_11_0.id].group_type
				local var_11_1 = getProxy(CollectionProxy)

				arg_11_0.virgin = var_11_1 and var_11_1.shipGroups[var_11_0] == nil
			end
		end)
	end

	return var_10_0.drops, var_10_0.extraDrops
end

function var_0_0.GeneralPlayerCosume(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = getProxy(PlayerProxy)
	local var_12_1 = var_12_0:getData()
	local var_12_2 = {
		oldPlayer = {
			level = var_12_1.level,
			exp = var_12_1.exp
		},
		addExp = arg_12_3
	}

	var_12_1:addExp(arg_12_3)

	local var_12_3 = pg.battle_cost_template[arg_12_0]

	if var_12_3.oil_cost > 0 and arg_12_1 then
		var_12_1:consume({
			gold = 0,
			oil = arg_12_2
		})
	end

	if var_12_3.attack_count > 0 then
		if var_12_3.attack_count == 1 then
			var_12_1:increaseAttackCount()

			if arg_12_1 then
				var_12_1:increaseAttackWinCount()
			end
		elseif var_12_3.attack_count == 2 then
			var_12_1:increasePvpCount()

			if arg_12_1 then
				var_12_1:increasePvpWinCount()
			end
		end
	end

	var_12_0:updatePlayer(var_12_1)

	var_12_2.newPlayer = Clone(var_12_1)

	return var_12_2
end

return var_0_0
