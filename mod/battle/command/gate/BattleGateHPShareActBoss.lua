local var_0_0 = class("BattleGateHPShareActBoss")

ys.Battle.BattleGateHPShareActBoss = var_0_0
var_0_0.__name = "BattleGateHPShareActBoss"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	if BeginStageCommand.DockOverload() then
		return
	end

	local var_1_0 = arg_1_0.actId
	local var_1_1 = getProxy(ActivityProxy):getActivityById(var_1_0)
	local var_1_2 = var_1_1:getConfig("config_id")
	local var_1_3 = pg.activity_event_worldboss[var_1_2]
	local var_1_4 = getProxy(PlayerProxy)
	local var_1_5 = getProxy(BayProxy)
	local var_1_6 = getProxy(FleetProxy)
	local var_1_7 = pg.battle_cost_template[SYSTEM_HP_SHARE_ACT_BOSS]
	local var_1_8 = var_1_7.oil_cost > 0
	local var_1_9 = {}
	local var_1_10 = 0
	local var_1_11 = 0
	local var_1_12 = 0
	local var_1_13 = 0
	local var_1_14 = arg_1_0.stageId
	local var_1_15 = arg_1_0.mainFleetId
	local var_1_16 = var_1_6:getActivityFleets()[var_1_0][var_1_15]
	local var_1_17 = var_1_5:getSortShipsByFleet(var_1_16)

	for iter_1_0, iter_1_1 in ipairs(var_1_17) do
		var_1_9[#var_1_9 + 1] = iter_1_1.id
	end

	local var_1_18 = var_1_16:getStartCost().oil
	local var_1_19 = var_1_16:GetCostSum().oil
	local var_1_20 = var_1_3.use_oil_limit[var_1_15]

	if var_1_1:IsOilLimit(var_1_14) and var_1_20[1] > 0 then
		var_1_19 = math.min(var_1_19, var_1_20[1])
	end

	local var_1_21 = var_1_4:getData()
	local var_1_22 = pg.activity_template[var_1_0]
	local var_1_23 = pg.activity_event_worldboss[var_1_22.config_id].ticket

	if var_1_4:getRawData():getResource(var_1_23) <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noTicket"))

		return
	end

	if var_1_8 and var_1_19 > var_1_21.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	local var_1_24 = pg.expedition_data_template[var_1_14].dungeon_id
	local var_1_25 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_24).fleet_prefab

	arg_1_1.ShipVertify()

	local function var_1_26(arg_2_0)
		if var_1_8 then
			var_1_21:consume({
				gold = 0,
				oil = var_1_18
			})
		end

		local var_2_0 = id2res(var_1_23)

		var_1_21:consume({
			[var_2_0] = 1
		})

		if var_1_7.enter_energy_cost > 0 then
			local var_2_1 = pg.gameset.battle_consume_energy.key_value

			for iter_2_0, iter_2_1 in ipairs(var_1_17) do
				iter_2_1:cosumeEnergy(var_2_1)
				var_1_5:updateShip(iter_2_1)
			end
		end

		var_1_4:updatePlayer(var_1_21)

		local var_2_2 = {
			mainFleetId = var_1_15,
			actId = var_1_0,
			prefabFleet = var_1_25,
			stageId = var_1_14,
			system = SYSTEM_HP_SHARE_ACT_BOSS,
			token = arg_2_0.key
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_2)
	end

	local function var_1_27(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
	end

	BeginStageCommand.SendRequest(SYSTEM_HP_SHARE_ACT_BOSS, var_1_9, {
		var_1_14
	}, var_1_26, var_1_27)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	local var_4_0 = pg.battle_cost_template[SYSTEM_HP_SHARE_ACT_BOSS]
	local var_4_1 = getProxy(FleetProxy)
	local var_4_2 = getProxy(BayProxy)
	local var_4_3 = ys.Battle.BattleConst.BattleScore.S

	arg_4_0.statistics._battleScore = var_4_3

	local var_4_4 = getProxy(ActivityProxy):getActivityById(arg_4_0.actId)
	local var_4_5 = var_4_4:getConfig("config_id")
	local var_4_6 = pg.activity_event_worldboss[var_4_5].use_oil_limit[arg_4_0.mainFleetId]
	local var_4_7 = var_4_4:IsOilLimit(arg_4_0.stageId)
	local var_4_8 = var_4_1:getActivityFleets()[arg_4_0.actId]
	local var_4_9 = var_4_8[arg_4_0.mainFleetId]
	local var_4_10
	local var_4_11 = 0
	local var_4_12 = {}
	local var_4_13 = {}
	local var_4_14 = var_4_0.oil_cost > 0

	local function var_4_15(arg_5_0, arg_5_1)
		if var_4_14 then
			local var_5_0 = arg_5_0:getEndCost().oil

			if arg_5_1 > 0 then
				local var_5_1 = arg_5_0:getStartCost().oil

				var_5_0 = math.clamp(arg_5_1 - var_5_1, 0, var_5_0)
			end

			var_4_11 = var_4_11 + var_5_0
		end

		table.insertto(var_4_12, var_4_2:getSortShipsByFleet(arg_5_0))
		table.insertto(var_4_13, arg_5_0.commanderIds)
	end

	var_4_15(var_4_9, var_4_7 and var_4_6[1] or 0)

	if arg_4_0.statistics.submarineAid then
		var_4_10 = var_4_8[arg_4_0.mainFleetId + 10]

		if var_4_10 then
			var_4_15(var_4_10, var_4_7 and var_4_6[2] or 0)
		else
			originalPrint("finish stage error: can not find submarin fleet.")
		end
	end

	local var_4_16 = arg_4_1.GeneralPackage(arg_4_0, var_4_12)

	var_4_16.commander_id_list = var_4_13

	local var_4_17 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.statistics._enemyInfoList) do
		table.insert(var_4_17, {
			enemy_id = iter_4_1.id,
			damage_taken = iter_4_1.damage,
			total_hp = iter_4_1.totalHp
		})
	end

	var_4_16.enemy_info = var_4_17

	local function var_4_18(arg_6_0)
		arg_4_1.addShipsExp(arg_6_0.ship_exp_list, arg_4_0.statistics, true)

		arg_4_0.statistics.mvpShipID = arg_6_0.mvp

		local var_6_0, var_6_1 = arg_4_1:GeneralLoot(arg_6_0)
		local var_6_2 = var_4_3 > ys.Battle.BattleConst.BattleScore.C
		local var_6_3 = arg_4_1.GenerateCommanderExp(arg_6_0, var_4_9, var_4_10)

		arg_4_1.GeneralPlayerCosume(SYSTEM_HP_SHARE_ACT_BOSS, var_6_2, var_4_11, arg_6_0.player_exp)

		local var_6_4 = {
			system = SYSTEM_HP_SHARE_ACT_BOSS,
			statistics = arg_4_0.statistics,
			score = var_4_3,
			drops = var_6_0,
			commanderExps = var_6_3,
			result = arg_6_0.result,
			extraDrops = var_6_1
		}

		var_4_4:AddStage(arg_4_0.stageId)
		getProxy(ActivityProxy):updateActivity(var_4_4)
		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_6_4)
	end

	arg_4_1:SendRequest(var_4_16, var_4_18)
end

function var_0_0.GetPreloadList(arg_7_0)
	local var_7_0, var_7_1 = ys.Battle.BattleGateActBoss.GetPreloadList(arg_7_0)

	return var_7_0, var_7_1
end

return var_0_0
