local var_0_0 = class("FinishStageCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.system

	if var_0_0.CheaterVertify() then
		return
	end

	if var_1_1 == SYSTEM_WORLD_BOSS and var_1_0.isSimulate then
		var_1_1 = SYSTEM_WORLD_BOSS_SIMULATE
	end

	ys.Battle.BattleGate.Gates[var_1_1].Exit(var_1_0, arg_1_0)
end

function var_0_0.CheaterVertify()
	ys.Battle.BattleState.GenerateVertifyData()

	local var_2_0, var_2_1 = ys.Battle.BattleState.Vertify()

	if not var_2_0 then
		pg.m02:sendNotification(GAME.CHEATER_MARK, {
			reason = var_2_1
		})
	end

	return not var_2_0
end

function var_0_0.GeneralPackage(arg_3_0, arg_3_1)
	local var_3_0 = 0
	local var_3_1 = {}
	local var_3_2 = arg_3_0.system
	local var_3_3

	if arg_3_0.system == SYSTEM_DUEL then
		var_3_3 = arg_3_0.rivalId
	elseif arg_3_0.system == SYSTEM_WORLD_BOSS then
		var_3_3 = arg_3_0.bossId
	else
		var_3_3 = arg_3_0.stageId
	end

	local var_3_4 = arg_3_0.statistics._battleScore
	local var_3_5 = var_3_2 + var_3_3 + var_3_4

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		local var_3_6 = arg_3_0.statistics[iter_3_1.id]

		if var_3_6 then
			local var_3_7 = var_3_6.id
			local var_3_8 = math.floor(var_3_6.bp)
			local var_3_9 = math.floor(var_3_6.output)
			local var_3_10 = math.max(0, math.floor(var_3_6.damage))
			local var_3_11 = math.floor(var_3_6.maxDamageOnce)
			local var_3_12 = math.floor(var_3_6.gearScore)

			table.insert(var_3_1, {
				ship_id = var_3_7,
				hp_rest = var_3_8,
				damage_cause = var_3_9,
				damage_caused = var_3_10,
				max_damage_once = var_3_11,
				ship_gear_score = var_3_12
			})

			var_3_5 = var_3_5 + var_3_7 + var_3_8 + var_3_9 + var_3_11
			var_3_0 = var_3_0 + iter_3_1:getShipCombatPower()
		end
	end

	local var_3_13, var_3_14 = GetBattleCheckResult(var_3_5, arg_3_0.token, arg_3_0.statistics._totalTime)
	local var_3_15 = math.fmod(arg_3_0.statistics._autoCount, 2)
	local var_3_16 = math.fmod(var_3_15 + arg_3_0.statistics._autoInit, 2)

	return {
		system = var_3_2,
		data = var_3_3,
		score = var_3_4,
		key = var_3_13,
		statistics = var_3_1,
		kill_id_list = arg_3_0.statistics.kill_id_list,
		total_time = arg_3_0.statistics._totalTime,
		bot_percentage = arg_3_0.statistics._botPercentage,
		extra_param = var_3_0,
		file_check = var_3_14,
		boss_hp = arg_3_0.statistics._maxBossHP,
		enemy_info = {},
		data2 = {},
		auto_before = arg_3_0.statistics._autoInit,
		auto_switch_time = arg_3_0.statistics._autoCount,
		auto_after = var_3_16
	}
end

function var_0_0.SendRequest(arg_4_0, arg_4_1, arg_4_2)
	pg.ConnectionMgr.GetInstance():Send(40003, arg_4_1, 40004, function(arg_5_0)
		if arg_5_0.result == 0 or arg_5_0.result == 1030 then
			arg_4_2(arg_5_0)
		else
			arg_4_0:RequestFailStandardProcess(arg_5_0)
		end
	end)
end

function var_0_0.RequestFailStandardProcess(arg_6_0, arg_6_1)
	if arg_6_1.result == 2 then
		originalPrint("stage_finishStage error--" .. arg_6_1.result)
		pg.TipsMgr.GetInstance():ShowTips(errorTip("stage_finishStage", arg_6_1.result))
		arg_6_0:sendNotification(GAME.FINISH_STAGE_ERROR, {})
	else
		originalPrint("stage_finishStage error--" .. arg_6_1.result)
		pg.TipsMgr.GetInstance():ShowTips(errorTip("stage_finishStage", arg_6_1.result))
	end
end

function var_0_0.addShipsExp(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = getProxy(BayProxy)
	local var_7_1 = {}
	local var_7_2 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
		local var_7_3 = iter_7_1.ship_id
		local var_7_4 = iter_7_1.exp or 0
		local var_7_5 = iter_7_1.intimacy
		local var_7_6 = iter_7_1.energy

		if arg_7_1[var_7_3] then
			local var_7_7 = var_7_0:getShipById(var_7_3)

			var_7_7:addExp(var_7_4, arg_7_2)

			if arg_7_2 then
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

			var_7_0:updateShip(var_7_7)
		end
	end
end

function var_0_0.DeadShipEnergyCosume(arg_8_0, arg_8_1)
	local var_8_0 = pg.gameset.battle_dead_energy.key_value
	local var_8_1 = getProxy(BayProxy)

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		local var_8_2 = arg_8_0.statistics[iter_8_1.id]

		if var_8_2 and var_8_2.bp == 0 then
			local var_8_3 = var_8_1:getShipById(iter_8_1.id)

			var_8_3:cosumeEnergy(var_8_0)
			var_8_1:updateShip(var_8_3)
		end
	end
end

function var_0_0.GeneralPlayerCosume(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = getProxy(PlayerProxy)
	local var_9_1 = var_9_0:getData()

	var_9_1:addExp(arg_9_3)

	local var_9_2 = pg.battle_cost_template[arg_9_0]

	if var_9_2.oil_cost > 0 and arg_9_1 then
		var_9_1:consume({
			gold = 0,
			oil = arg_9_2
		})
	end

	if var_9_2.attack_count > 0 and not arg_9_4 then
		if var_9_2.attack_count == 1 then
			var_9_1:increaseAttackCount()

			if arg_9_1 then
				var_9_1:increaseAttackWinCount()
			end
		elseif var_9_2.attack_count == 2 then
			var_9_1:increasePvpCount()

			if arg_9_1 then
				var_9_1:increasePvpWinCount()
			end
		end
	end

	var_9_0:updatePlayer(var_9_1)
end

function var_0_0.GeneralLoot(arg_10_0, arg_10_1)
	local var_10_0 = {
		drops = arg_10_1.drop_info,
		extraDrops = arg_10_1.extra_drop_info
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

function var_0_0.GenerateCommanderExp(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.commander_exp
	local var_12_1 = getProxy(CommanderProxy)

	local function var_12_2(arg_13_0)
		local var_13_0 = arg_13_0:getCommanders()
		local var_13_1 = {}

		for iter_13_0, iter_13_1 in pairs(var_13_0) do
			local var_13_2 = iter_13_1.id
			local var_13_3 = var_12_1:getCommanderById(var_13_2)
			local var_13_4 = var_13_3.exp
			local var_13_5

			for iter_13_2, iter_13_3 in ipairs(var_12_0) do
				if iter_13_3.commander_id == var_13_2 then
					var_13_5 = iter_13_3

					break
				end
			end

			local var_13_6 = var_13_5 and var_13_5.exp or 0

			var_13_3:addExp(var_13_6)
			var_12_1:updateCommander(var_13_3)
			table.insert(var_13_1, {
				commander_id = var_13_2,
				exp = var_13_6,
				curExp = var_13_4
			})
		end

		return var_13_1
	end

	local var_12_3 = var_12_2(arg_12_1)
	local var_12_4 = {}

	if arg_12_2 then
		var_12_4 = var_12_2(arg_12_2)
	end

	return {
		surfaceCMD = var_12_3,
		submarineCMD = var_12_4
	}
end

return var_0_0
