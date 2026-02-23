local var_0_0 = class("BattleGateActBossSP")

ys.Battle.BattleGateActBossSP = var_0_0
var_0_0.__name = "BattleGateActBossSP"
var_0_0.BattleSystem = SYSTEM_ACT_BOSS_SP

function var_0_0.Entrance(arg_1_0, arg_1_1)
	if BeginStageCommand.DockOverload() then
		return
	end

	local var_1_0 = arg_1_0.actId
	local var_1_1 = getProxy(ActivityProxy):getActivityById(var_1_0)
	local var_1_2 = getProxy(PlayerProxy)
	local var_1_3 = var_1_2:getData()
	local var_1_4 = getProxy(BayProxy)
	local var_1_5 = getProxy(FleetProxy)
	local var_1_6 = getProxy(ActivityProxy):GetActivityBossRuntime(var_1_0).buffIds
	local var_1_7 = arg_1_0.stageId
	local var_1_8 = pg.expedition_data_template[var_1_7].dungeon_id
	local var_1_9 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_8).fleet_prefab
	local var_1_10 = arg_1_0.mainFleetId
	local var_1_11 = var_1_5:getActivityFleets()[var_1_0][var_1_10]
	local var_1_12 = {}
	local var_1_13 = var_1_4:getSortShipsByFleet(var_1_11)

	for iter_1_0, iter_1_1 in ipairs(var_1_13) do
		var_1_12[#var_1_12 + 1] = iter_1_1.id
	end

	local var_1_14 = pg.battle_cost_template[var_0_0.BattleSystem]
	local var_1_15 = var_1_14.oil_cost > 0
	local var_1_16 = 0
	local var_1_17 = 0

	if var_1_15 then
		var_1_16 = var_1_11:getStartCost().oil
		var_1_17 = var_1_11:GetCostSum().oil
	end

	if var_1_17 > var_1_3.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	arg_1_1.ShipVertify()

	local function var_1_18(arg_2_0)
		if var_1_15 then
			var_1_3:consume({
				gold = 0,
				oil = var_1_16
			})
		end

		if var_1_14.enter_energy_cost > 0 then
			local var_2_0 = pg.gameset.battle_consume_energy.key_value

			for iter_2_0, iter_2_1 in ipairs(var_1_13) do
				iter_2_1:cosumeEnergy(var_2_0)
				var_1_4:updateShip(iter_2_1)
			end
		end

		var_1_2:updatePlayer(var_1_3)

		var_1_1 = getProxy(ActivityProxy):getActivityById(var_1_0)

		var_1_1:UpdateHistoryBuffs(var_1_6)
		getProxy(ActivityProxy):updateActivity(var_1_1)

		local var_2_1 = {
			mainFleetId = var_1_10,
			actId = var_1_0,
			prefabFleet = var_1_9,
			stageId = var_1_7,
			system = var_0_0.BattleSystem,
			token = arg_2_0.key
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_1)
	end

	local function var_1_19(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
	end

	BeginStageCommand.SendRequest(var_0_0.BattleSystem, var_1_12, {
		var_1_7,
		var_1_6
	}, var_1_18, var_1_19)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	local var_4_0 = pg.battle_cost_template[var_0_0.BattleSystem]
	local var_4_1 = getProxy(FleetProxy)
	local var_4_2 = getProxy(BayProxy)
	local var_4_3 = arg_4_0.statistics._battleScore
	local var_4_4 = getProxy(ActivityProxy):getActivityById(arg_4_0.actId):getConfig("config_id")
	local var_4_5 = pg.activity_event_worldboss[var_4_4]
	local var_4_6 = var_4_1:getActivityFleets()[arg_4_0.actId]
	local var_4_7 = var_4_6[arg_4_0.mainFleetId]
	local var_4_8
	local var_4_9 = 0
	local var_4_10 = {}
	local var_4_11 = {}
	local var_4_12 = var_4_0.oil_cost > 0

	local function var_4_13(arg_5_0, arg_5_1)
		if var_4_12 then
			local var_5_0 = arg_5_0:getEndCost().oil

			if arg_5_1 > 0 then
				local var_5_1 = arg_5_0:getStartCost().oil

				var_5_0 = math.clamp(arg_5_1 - var_5_1, 0, var_5_0)
			end

			var_4_9 = var_4_9 + var_5_0
		end

		table.insertto(var_4_10, var_4_2:getSortShipsByFleet(arg_5_0))
		table.insertto(var_4_11, arg_5_0.commanderIds)
	end

	var_4_13(var_4_7, 0)

	if arg_4_0.statistics.submarineAid then
		local var_4_14 = var_4_6[arg_4_0.mainFleetId + 10]

		if var_4_14 then
			var_4_13(var_4_14, 0)
		else
			originalPrint("finish stage error: can not find submarin fleet.")
		end
	end

	local var_4_15 = arg_4_1.GeneralPackage(arg_4_0, var_4_10)

	var_4_15.commander_id_list = var_4_11

	local function var_4_16(arg_6_0)
		arg_4_1.addShipsExp(arg_6_0.ship_exp_list, arg_4_0.statistics, true)

		arg_4_0.statistics.mvpShipID = arg_6_0.mvp

		local var_6_0, var_6_1 = arg_4_1:GeneralLoot(arg_6_0)
		local var_6_2 = var_4_3 > ys.Battle.BattleConst.BattleScore.C
		local var_6_3 = arg_4_1.GenerateCommanderExp(arg_6_0, var_4_7, var_4_6[arg_4_0.mainFleetId + 10])

		arg_4_1.GeneralPlayerCosume(var_0_0.BattleSystem, var_6_2, var_4_9, arg_6_0.player_exp)

		local var_6_4 = {
			system = var_0_0.BattleSystem,
			statistics = arg_4_0.statistics,
			score = var_4_3,
			drops = var_6_0,
			commanderExps = var_6_3,
			result = arg_6_0.result,
			extraDrops = var_6_1
		}

		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_6_4)
	end

	arg_4_1:SendRequest(var_4_15, var_4_16)
end

function var_0_0.GetPreloadList(arg_7_0)
	local var_7_0, var_7_1 = ys.Battle.BattleGateActBoss.GetPreloadList(arg_7_0)
	local var_7_2 = ys.Battle.BattleResourceManager.GetInstance()
	local var_7_3 = getProxy(ActivityProxy):GetActivityBossRuntime(arg_7_0.actId).buffIds
	local var_7_4 = _.map(var_7_3, function(arg_8_0)
		return ActivityBossBuff.New({
			configId = arg_8_0
		}):GetBuffID()
	end)
	local var_7_5 = var_7_2.GetResFromBuffIDList(var_7_4)

	for iter_7_0, iter_7_1 in ipairs(var_7_5) do
		table.insert(var_7_0, iter_7_1)
	end

	return var_7_0, var_7_1
end

return var_0_0
