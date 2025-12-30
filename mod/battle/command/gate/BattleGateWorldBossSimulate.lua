local var_0_0 = class("BattleGateWorldBossSimulate")

ys.Battle.BattleGateWorldBossSimulate = var_0_0
var_0_0.__name = "BattleGateWorldBossSimulate"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	if BeginStageCommand.DockOverload() then
		return
	end

	local var_1_0 = arg_1_0.actId
	local var_1_1 = getProxy(PlayerProxy)
	local var_1_2 = getProxy(BayProxy)
	local var_1_3 = {}
	local var_1_4 = 0
	local var_1_5 = 0
	local var_1_6 = nowWorld()
	local var_1_7 = var_1_6:GetBossProxy():GetFleet(arg_1_0.bossId)
	local var_1_8 = var_1_7.ships

	for iter_1_0, iter_1_1 in ipairs(var_1_8) do
		var_1_3[#var_1_3 + 1] = iter_1_1
	end

	local var_1_9 = var_1_2:getSortShipsByFleet(var_1_7)
	local var_1_10 = var_1_1:getData()
	local var_1_11 = arg_1_0.bossId
	local var_1_12 = arg_1_0.hpRate
	local var_1_13 = var_1_6:GetBossProxy()
	local var_1_14
	local var_1_15
	local var_1_16 = pg.world_joint_boss_template[var_1_11]

	if WorldBossConst.GetCurrBossID() == var_1_11 then
		var_1_15 = var_1_13.currentBossLV
		var_1_14 = var_1_16.boss_level_id + var_1_13.currentBossLV - 1
	else
		var_1_15 = 15
		var_1_14 = var_1_16.boss_level_id + 14
	end

	local var_1_17 = pg.world_boss_level[var_1_14].expedition_id

	arg_1_1.ShipVertify()

	local var_1_18 = {
		isSimulate = true,
		prefabFleet = {},
		bossId = var_1_11,
		actId = var_1_0,
		stageId = var_1_17,
		system = SYSTEM_WORLD_BOSS,
		bossLevel = var_1_15,
		bossConfigId = var_1_11,
		hpRate = var_1_12
	}

	arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_1_18)
end

function var_0_0.Exit(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.statistics._battleScore

	arg_2_0.statistics.mvpShipID = -1

	local var_2_1 = {
		result = 0,
		system = SYSTEM_WORLD_BOSS,
		statistics = arg_2_0.statistics,
		score = var_2_0,
		drops = {},
		commanderExps = {},
		extraDrops = {},
		bossId = arg_2_0.bossId,
		name = name
	}

	arg_2_1:sendNotification(GAME.FINISH_STAGE_DONE, var_2_1)
end

return var_0_0
