local var_0_0 = class("BattleGateBossExperiment")

ys.Battle.BattleGateBossExperiment = var_0_0
var_0_0.__name = "BattleGateBossExperiment"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.actId
	local var_1_1 = arg_1_0.mainFleetId
	local var_1_2 = arg_1_0.stageId
	local var_1_3 = pg.expedition_data_template[var_1_2].dungeon_id
	local var_1_4 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_3).fleet_prefab
	local var_1_5 = {
		mainFleetId = var_1_1,
		actId = var_1_0,
		prefabFleet = var_1_4,
		stageId = var_1_2,
		system = SYSTEM_BOSS_EXPERIMENT
	}

	arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_1_5)
end

function var_0_0.Exit(arg_2_0, arg_2_1)
	local var_2_0 = ys.Battle.BattleConst.BattleScore.S
	local var_2_1 = {
		system = SYSTEM_BOSS_EXPERIMENT,
		statistics = arg_2_0.statistics,
		score = var_2_0,
		commanderExps = {}
	}

	arg_2_1:sendNotification(GAME.FINISH_STAGE_DONE, var_2_1)
end

function var_0_0.GetPreloadList(arg_3_0)
	local var_3_0, var_3_1 = ys.Battle.BattleGateActBoss.GetPreloadList(arg_3_0)

	return var_3_0, var_3_1
end

return var_0_0
