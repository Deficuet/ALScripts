local var_0_0 = class("BattleGateDuel")

ys.Battle.BattleGateDuel = var_0_0
var_0_0.__name = "BattleGateDuel"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.mainFleetId

	if not arg_1_1.LegalFleet(arg_1_0.mainFleetId) then
		return
	end

	if not getProxy(MilitaryExerciseProxy):getSeasonInfo():canExercise() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("exercise_count_insufficient"))

		return
	end

	local var_1_1 = getProxy(PlayerProxy)
	local var_1_2 = getProxy(BayProxy)
	local var_1_3 = getProxy(FleetProxy)
	local var_1_4
	local var_1_5
	local var_1_6 = arg_1_0.rivalId
	local var_1_7 = getProxy(MilitaryExerciseProxy):getRivalById(var_1_6)
	local var_1_8 = pg.battle_cost_template[SYSTEM_DUEL]
	local var_1_9 = var_1_8.oil_cost > 0
	local var_1_10 = {}
	local var_1_11 = 0
	local var_1_12 = 0
	local var_1_13 = 0
	local var_1_14 = 0
	local var_1_15 = var_1_3:getFleetById(var_1_0)
	local var_1_16 = var_1_2:getSortShipsByFleet(var_1_15)

	for iter_1_0, iter_1_1 in ipairs(var_1_16) do
		var_1_10[#var_1_10 + 1] = iter_1_1.id
	end

	local var_1_17 = var_1_1:getData()

	if var_1_9 and var_1_14 > var_1_17.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	local var_1_18 = 0

	for iter_1_2, iter_1_3 in ipairs(var_1_7.mainShips) do
		var_1_18 = var_1_18 + iter_1_3.level
	end

	for iter_1_4, iter_1_5 in ipairs(var_1_7.vanguardShips) do
		var_1_18 = var_1_18 + iter_1_5.level
	end

	RivalLevelVertiry = var_1_18

	arg_1_1.ShipVertify()

	local function var_1_19(arg_2_0)
		if var_1_9 then
			var_1_17:consume({
				gold = 0,
				oil = var_1_12
			})
		end

		if var_1_8.enter_energy_cost > 0 then
			local var_2_0 = pg.gameset.battle_consume_energy.key_value

			for iter_2_0, iter_2_1 in ipairs(var_1_16) do
				iter_2_1:cosumeEnergy(var_2_0)
				var_1_2:updateShip(iter_2_1)
			end
		end

		local var_2_1 = ys.Battle.BattleConfig.ARENA_LIST
		local var_2_2 = var_2_1[math.random(#var_2_1)]

		var_1_1:updatePlayer(var_1_17)

		local var_2_3 = {
			mainFleetId = var_1_0,
			prefabFleet = {},
			stageId = var_2_2,
			system = SYSTEM_DUEL,
			rivalId = var_1_6,
			token = arg_2_0.key,
			mode = mode
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_3)
	end

	local function var_1_20(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
	end

	BeginStageCommand.SendRequest(SYSTEM_DUEL, var_1_10, {
		var_1_6
	}, var_1_19, var_1_20)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	local var_4_0 = pg.battle_cost_template[SYSTEM_DUEL]
	local var_4_1 = getProxy(FleetProxy)
	local var_4_2 = getProxy(BayProxy)
	local var_4_3 = arg_4_0.statistics._battleScore
	local var_4_4 = 0
	local var_4_5 = {}
	local var_4_6 = var_4_1:getFleetById(arg_4_0.mainFleetId)
	local var_4_7 = var_4_2:getSortShipsByFleet(var_4_6)
	local var_4_8 = var_4_6:getEndCost().oil
	local var_4_9 = arg_4_1.GeneralPackage(arg_4_0, var_4_7)

	local function var_4_10(arg_5_0)
		arg_4_1.addShipsExp(arg_5_0.ship_exp_list, arg_4_0.statistics, false)

		arg_4_0.statistics.mvpShipID = arg_5_0.mvp

		local var_5_0, var_5_1 = arg_4_1:GeneralLoot(arg_5_0)
		local var_5_2 = var_4_3 > ys.Battle.BattleConst.BattleScore.C

		arg_4_1.GeneralPlayerCosume(SYSTEM_DUEL, var_5_2, var_4_8, arg_5_0.player_exp, exFlag)
		getProxy(MilitaryExerciseProxy):reduceExerciseCount()

		local var_5_3 = {
			system = SYSTEM_DUEL,
			statistics = arg_4_0.statistics,
			score = var_4_3,
			drops = var_5_0,
			commanderExps = {},
			result = arg_5_0.result,
			extraDrops = var_5_1
		}

		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_5_3)
	end

	arg_4_1:SendRequest(var_4_9, var_4_10)
end

function var_0_0.GetPreloadList(arg_6_0)
	local var_6_0 = {}
	local var_6_1
	local var_6_2 = getProxy(FleetProxy)
	local var_6_3 = getProxy(BayProxy)
	local var_6_4 = var_6_2:getFleetById(arg_6_0.mainFleetId)
	local var_6_5 = var_6_3:getShipsByFleet(var_6_4)

	for iter_6_0, iter_6_1 in ipairs(var_6_5) do
		table.insert(var_6_0, iter_6_1)
	end

	local var_6_6 = getProxy(MilitaryExerciseProxy):getRivalById(arg_6_0.rivalId):getShips()

	for iter_6_2, iter_6_3 in ipairs(var_6_6) do
		table.insert(var_6_0, iter_6_3)
	end

	local var_6_7, var_6_8 = ys.Battle.BattleResourceManager.GetInstance().GetPlayerShipResource(var_6_0, arg_6_0.system)

	return var_6_7, var_6_8
end

return var_0_0
