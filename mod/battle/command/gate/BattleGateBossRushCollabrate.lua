local var_0_0 = class("BattleGateBossRushCollabrate")

ys.Battle.BattleGateBossRushCollabrate = var_0_0
var_0_0.__name = "BattleGateBossRushCollabrate"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.actId
	local var_1_1 = getProxy(PlayerProxy)
	local var_1_2 = getProxy(FleetProxy)
	local var_1_3 = getProxy(BayProxy)
	local var_1_4 = pg.battle_cost_template[SYSTEM_BOSS_RUSH_COLLABRATE]
	local var_1_5 = var_1_4.oil_cost > 0
	local var_1_6 = getProxy(ActivityProxy):getActivityById(var_1_0):GetSeriesData()
	local var_1_7 = var_1_6:GetStaegLevel() + 1
	local var_1_8 = var_1_6:GetExpeditionIds()[var_1_7]
	local var_1_9 = var_1_6:GetMode()
	local var_1_10, var_1_11 = var_1_6:GetStageFleets(var_1_9, var_1_7)
	local var_1_12 = var_1_2:getActivityFleets()[var_1_0]
	local var_1_13 = var_1_12[var_1_10]
	local var_1_14 = var_1_12[var_1_11]
	local var_1_15 = {}
	local var_1_16 = var_1_3:getSortShipsByFleet(var_1_13)

	for iter_1_0, iter_1_1 in ipairs(var_1_16) do
		var_1_15[#var_1_15 + 1] = iter_1_1.id
	end

	local var_1_17 = var_1_1:getRawData()
	local var_1_18 = var_1_13:GetCostSum().oil

	if var_1_5 and var_1_18 > var_1_17.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	arg_1_1.ShipVertify()

	local var_1_19 = var_1_13:getStartCost().oil

	local function var_1_20(arg_2_0)
		if var_1_5 then
			var_1_17:consume({
				gold = 0,
				oil = var_1_19
			})
		end

		if var_1_4.enter_energy_cost > 0 then
			local var_2_0 = pg.gameset.battle_consume_energy.key_value

			for iter_2_0, iter_2_1 in ipairs(var_1_16) do
				iter_2_1:cosumeEnergy(var_2_0)
				var_1_3:updateShip(iter_2_1)
			end
		end

		var_1_1:updatePlayer(var_1_17)

		local var_2_1 = {
			prefabFleet = {},
			stageId = var_1_8,
			system = SYSTEM_BOSS_RUSH_COLLABRATE,
			actId = var_1_0,
			token = arg_2_0.key,
			continuousBattleTimes = arg_1_0.continuousBattleTimes,
			totalBattleTimes = arg_1_0.totalBattleTimes
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_1)
	end

	local function var_1_21(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
	end

	BeginStageCommand.SendRequest(SYSTEM_BOSS_RUSH_COLLABRATE, var_1_15, {
		var_1_8
	}, var_1_20, var_1_21)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	local var_4_0 = pg.battle_cost_template[SYSTEM_BOSS_RUSH_COLLABRATE]
	local var_4_1 = getProxy(FleetProxy)
	local var_4_2 = getProxy(BayProxy)
	local var_4_3 = arg_4_0.statistics._battleScore
	local var_4_4 = 0
	local var_4_5 = {}
	local var_4_6 = {}
	local var_4_7 = false

	;(function()
		local var_5_0 = arg_4_0.actId
		local var_5_1 = getProxy(ActivityProxy):getActivityById(var_5_0):GetSeriesData()

		if not var_5_1 then
			var_4_7 = true

			return
		end

		local var_5_2 = var_5_1:GetStaegLevel() + 1
		local var_5_3 = var_5_1:GetMode()
		local var_5_4, var_5_5 = var_5_1:GetStageFleets(var_5_3, var_5_2)
		local var_5_6 = var_4_1:getActivityFleets()[var_5_0]
		local var_5_7 = var_5_6[var_5_4]
		local var_5_8 = var_5_6[var_5_5]

		local function var_5_9(arg_6_0)
			table.insertto(var_4_6, _.values(arg_6_0.commanderIds))
			table.insertto(var_4_5, var_4_2:getSortShipsByFleet(arg_6_0))
		end

		var_5_9(var_5_7)

		if arg_4_0.statistics.submarineAid then
			var_5_9(var_5_8)
		end
	end)()

	if var_4_7 then
		arg_4_1:sendNotification(GAME.FINISH_STAGE_ERROR)

		return
	end

	local var_4_8 = arg_4_1.GeneralPackage(arg_4_0, var_4_5)

	var_4_8.commander_id_list = var_4_6

	local function var_4_9(arg_7_0)
		arg_4_0.statistics.mvpShipID = arg_7_0.mvp

		local var_7_0 = {
			system = SYSTEM_BOSS_RUSH_COLLABRATE,
			statistics = arg_4_0.statistics,
			score = var_4_3,
			result = arg_7_0.result
		}
		local var_7_1 = arg_4_0.actId
		local var_7_2 = getProxy(ActivityProxy):getActivityById(var_7_1)

		var_7_2:GetSeriesData():PassStage(var_7_0)
		getProxy(ActivityProxy):updateActivity(var_7_2)
		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_7_0)
	end

	arg_4_1:SendRequest(var_4_8, var_4_9)
end

function var_0_0.GetPreloadList(arg_8_0)
	local var_8_0, var_8_1 = ys.Battle.BattleGateBossRush.GetPreloadList(arg_8_0)
	local var_8_2 = getProxy(ActivityProxy):getActivityById(arg_8_0.actId):GetSeriesData()
	local var_8_3 = var_8_2:getConfig("aid_buff")

	if var_8_2:GetBossHpRate() <= var_8_3[1] then
		t = resMgr.GetResFromBuffIDList({
			var_8_3[2]
		})

		for iter_8_0, iter_8_1 in ipairs(t) do
			table.insert(var_8_0, iter_8_1)
		end
	end

	return var_8_0, var_8_1
end

return var_0_0
