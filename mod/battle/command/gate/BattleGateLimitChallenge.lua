local var_0_0 = class("BattleGateLimitChallenge")

ys.Battle.BattleGateLimitChallenge = var_0_0
var_0_0.__name = "BattleGateLimitChallenge"
var_0_0.BattleSystem = SYSTEM_LIMIT_CHALLENGE

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = FleetProxy.CHALLENGE_FLEET_ID

	if not arg_1_1.LegalFleet(var_1_0) then
		return
	end

	local var_1_1 = getProxy(PlayerProxy)
	local var_1_2 = var_1_1:getData()
	local var_1_3 = getProxy(FleetProxy)
	local var_1_4 = getProxy(BayProxy)
	local var_1_5 = getProxy(LimitChallengeProxy)
	local var_1_6 = arg_1_0.stageId
	local var_1_7 = pg.expedition_data_template[var_1_6].dungeon_id
	local var_1_8 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_7).fleet_prefab
	local var_1_9 = var_1_3:getFleetById(FleetProxy.CHALLENGE_FLEET_ID)
	local var_1_10 = {}
	local var_1_11 = var_1_4:getSortShipsByFleet(var_1_9)

	for iter_1_0, iter_1_1 in ipairs(var_1_11) do
		var_1_10[#var_1_10 + 1] = iter_1_1.id
	end

	local var_1_12 = pg.battle_cost_template[var_0_0.BattleSystem]
	local var_1_13 = var_1_12.oil_cost > 0
	local var_1_14 = 0
	local var_1_15 = 0

	if var_1_13 then
		var_1_14 = var_1_9:getStartCost().oil
		var_1_15 = var_1_9:GetCostSum().oil
	end

	if var_1_13 and var_1_15 > var_1_2.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	arg_1_1.ShipVertify()

	local function var_1_16(arg_2_0)
		if var_1_13 then
			var_1_2:consume({
				gold = 0,
				oil = var_1_14
			})
		end

		if var_1_12.enter_energy_cost > 0 then
			local var_2_0 = pg.gameset.battle_consume_energy.key_value

			for iter_2_0, iter_2_1 in ipairs(var_1_11) do
				iter_2_1:cosumeEnergy(var_2_0)
				var_1_4:updateShip(iter_2_1)
			end
		end

		var_1_1:updatePlayer(var_1_2)

		local var_2_1 = {
			mainFleetId = mainFleetID,
			prefabFleet = var_1_8,
			stageId = var_1_6,
			system = var_0_0.BattleSystem,
			token = arg_2_0.key
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_1)
	end

	local function var_1_17(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
	end

	BeginStageCommand.SendRequest(var_0_0.BattleSystem, var_1_10, {
		var_1_6
	}, var_1_16, var_1_17)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	local var_4_0 = pg.battle_cost_template[var_0_0.BattleSystem]
	local var_4_1 = getProxy(FleetProxy)
	local var_4_2 = getProxy(BayProxy)
	local var_4_3 = arg_4_0.statistics._battleScore
	local var_4_4 = 0
	local var_4_5 = {}
	local var_4_6 = {}
	local var_4_7 = arg_4_0.stageId
	local var_4_8 = var_4_1:getFleetById(FleetProxy.CHALLENGE_FLEET_ID)
	local var_4_9

	if arg_4_0.statistics.submarineAid then
		var_4_9 = var_4_1:getFleetById(FleetProxy.CHALLENGE_SUB_FLEET_ID)
	end

	;(function()
		local function var_5_0(arg_6_0)
			local var_6_0 = arg_6_0:getEndCost().oil

			var_4_4 = var_4_4 + var_6_0

			table.insertto(var_4_6, _.values(arg_6_0.commanderIds))
			table.insertto(var_4_5, var_4_2:getSortShipsByFleet(arg_6_0))
		end

		var_5_0(var_4_8)

		if arg_4_0.statistics.submarineAid then
			var_5_0(var_4_9)
		end
	end)()

	local var_4_10 = arg_4_1.GeneralPackage(arg_4_0, var_4_5)

	var_4_10.commander_id_list = var_4_6

	local function var_4_11(arg_7_0)
		arg_4_1.addShipsExp(arg_7_0.ship_exp_list, arg_4_0.statistics, true)

		arg_4_0.statistics.mvpShipID = arg_7_0.mvp

		local var_7_0, var_7_1 = arg_4_1:GeneralLoot(arg_7_0)
		local var_7_2 = var_4_3 > ys.Battle.BattleConst.BattleScore.C
		local var_7_3 = arg_4_1.GenerateCommanderExp(arg_7_0, var_4_8, var_4_9)

		arg_4_1.GeneralPlayerCosume(var_0_0.BattleSystem, var_7_2, var_4_4, arg_7_0.player_exp)

		local var_7_4 = {
			system = var_0_0.BattleSystem,
			statistics = arg_4_0.statistics,
			score = var_4_3,
			drops = var_7_0,
			commanderExps = var_7_3,
			result = arg_7_0.result,
			extraDrops = var_7_1
		}

		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_7_4)

		if var_7_2 then
			local var_7_5 = LimitChallengeConst.GetChallengeIDByStageID(var_4_7)
			local var_7_6 = arg_4_0.statistics._totalTime

			getProxy(LimitChallengeProxy):setPassTime(var_7_5, var_7_6)
		end
	end

	arg_4_1:SendRequest(var_4_10, var_4_11)
end

function var_0_0.GetPreloadList(arg_8_0)
	local var_8_0 = {}
	local var_8_1 = {}
	local var_8_2
	local var_8_3 = ys.Battle.BattleResourceManager.GetInstance()
	local var_8_4 = FleetProxy.CHALLENGE_FLEET_ID
	local var_8_5 = FleetProxy.CHALLENGE_SUB_FLEET_ID
	local var_8_6 = getProxy(FleetProxy)
	local var_8_7 = var_8_6:getFleetById(var_8_4)
	local var_8_8 = var_8_6:getFleetById(var_8_5)
	local var_8_9 = getProxy(BayProxy)

	if var_8_7 then
		local var_8_10 = var_8_7:GetRawShipIds()

		for iter_8_0, iter_8_1 in ipairs(var_8_10) do
			table.insert(var_8_0, var_8_9:getShipById(iter_8_1))
		end

		var_8_1 = var_8_7:buildBattleBuffList()
	end

	if var_8_8 then
		local var_8_11 = var_8_8:GetRawShipIds()

		for iter_8_2, iter_8_3 in ipairs(var_8_11) do
			table.insert(var_8_0, var_8_9:getShipById(iter_8_3))
		end

		for iter_8_4, iter_8_5 in ipairs(var_8_8:buildBattleBuffList()) do
			table.insert(var_8_1, iter_8_5)
		end
	end

	local var_8_12, var_8_13 = var_8_3.GetPlayerShipResource(var_8_0, arg_8_0.system)
	local var_8_14 = var_8_3.GetCommanderBuffRes(var_8_1)

	for iter_8_6, iter_8_7 in ipairs(var_8_14) do
		table.insert(var_8_12, iter_8_7)
	end

	local var_8_15 = LimitChallengeConst.GetChallengeIDByStageID(arg_8_0.stageId)
	local var_8_16 = AcessWithinNull(pg.expedition_constellation_challenge_template[var_8_15], "buff_id")

	if var_8_16 then
		for iter_8_8, iter_8_9 in ipairs(var_8_16) do
			local var_8_17 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_8_9.ID, iter_8_9.LV, {})

			for iter_8_10, iter_8_11 in ipairs(var_8_17) do
				table.insert(var_8_12, iter_8_11)
			end
		end
	end

	return var_8_12, var_8_13
end

return var_0_0
