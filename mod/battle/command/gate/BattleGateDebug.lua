local var_0_0 = class("BattleGateDebug")

ys.Battle.BattleGateDebug = var_0_0
var_0_0.__name = "BattleGateDebug"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(FleetProxy):getFleetById(1)

	if var_1_0 == nil or var_1_0:isEmpty() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_fleetEmpty"))

		return
	end

	local var_1_1 = PROLOGUE_DUNGEON
	local var_1_2 = {
		mainFleetId = 1,
		prefabFleet = {},
		stageId = var_1_1,
		system = SYSTEM_DEBUG
	}

	arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_1_2)
end

function var_0_0.Exit()
	return
end

function var_0_0.GetPreloadList(arg_3_0)
	local var_3_0 = ys.Battle.BattleResourceManager.GetInstance()
	local var_3_1 = getProxy(FleetProxy)
	local var_3_2 = getProxy(BayProxy)
	local var_3_3 = {}
	local var_3_4 = var_3_1:getFleetById(arg_3_0.mainFleetId)
	local var_3_5 = var_3_2:getShipsByFleet(var_3_4)

	for iter_3_0, iter_3_1 in ipairs(var_3_5) do
		table.insert(var_3_3, iter_3_1)
	end

	local var_3_6 = var_3_1:getFleetById(11)
	local var_3_7 = var_3_6:getTeamByName(TeamType.Submarine)

	for iter_3_2, iter_3_3 in ipairs(var_3_7) do
		local var_3_8 = var_3_2:getShipById(iter_3_3)

		table.insert(var_3_3, var_3_8)
	end

	local var_3_9, var_3_10 = var_3_0.GetPlayerShipResource(var_3_3, arg_3_0.system)
	local var_3_11 = var_3_0.GetCommanderBuffRes(var_3_6:buildBattleBuffList())

	for iter_3_4, iter_3_5 in ipairs(var_3_11) do
		table.insert(var_3_9, iter_3_5)
	end

	local var_3_12 = pg.aircraft_template.all

	for iter_3_6, iter_3_7 in ipairs(var_3_12) do
		local var_3_13 = var_3_0.GetAircraftResource(iter_3_7, {})

		for iter_3_8, iter_3_9 in ipairs(var_3_13) do
			table.insert(var_3_9, iter_3_9)
		end
	end

	return var_3_9, var_3_10
end

return var_0_0
