local var_0_0 = class("BattleGatePerform")

ys.Battle.BattleGatePerform = var_0_0
var_0_0.__name = "BattleGatePerform"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.stageId
	local var_1_1 = pg.expedition_data_template[var_1_0].dungeon_id
	local var_1_2 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_1).fleet_prefab or {}
	local var_1_3 = {}

	if arg_1_0.mainFleetId then
		local var_1_4 = getProxy(BayProxy)
		local var_1_5 = getProxy(FleetProxy)

		if not arg_1_1.LegalFleet(arg_1_0.mainFleetId) then
			return
		end

		local var_1_6 = var_1_5:getFleetById(arg_1_0.mainFleetId)
		local var_1_7 = var_1_4:getSortShipsByFleet(var_1_6)

		for iter_1_0, iter_1_1 in ipairs(var_1_7) do
			var_1_3[#var_1_3 + 1] = iter_1_1.id
		end
	end

	local var_1_8 = {
		stageId = var_1_0,
		system = SYSTEM_PERFORM,
		memory = arg_1_0.memory,
		exitCallback = arg_1_0.exitCallback,
		prefabFleet = var_1_2,
		mainFleetId = arg_1_0.mainFleetId
	}

	if arg_1_0.memory then
		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_1_8)
	else
		local function var_1_9(arg_2_0)
			arg_1_1:sendNotification(GAME.STORY_UPDATE, {
				storyId = tostring(var_1_0)
			})

			var_1_8.token = arg_2_0.key

			arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_1_8)
		end

		local function var_1_10(arg_3_0)
			arg_1_1:RequestFailStandardProcess(arg_3_0)
		end

		BeginStageCommand.SendRequest(SYSTEM_PERFORM, var_1_3, {
			var_1_0
		}, var_1_9, var_1_10)
	end
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	if arg_4_0.memory then
		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_PERFORM
		})
	else
		local var_4_0 = arg_4_1.GeneralPackage(arg_4_0, {})

		local function var_4_1(arg_5_0)
			print(arg_4_0.exitCallback)
			arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, {
				system = SYSTEM_PERFORM,
				exitCallback = arg_4_0.exitCallback
			})
		end

		local function var_4_2(arg_6_0)
			arg_4_1:RequestFailStandardProcess(arg_6_0)
		end

		arg_4_1:SendRequest(var_4_0, var_4_1, var_4_2)
	end
end

return var_0_0
