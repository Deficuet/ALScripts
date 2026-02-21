local var_0_0 = class("BattleGateScenarioSubStrike")

ys.Battle.BattleGateScenarioSubStrike = var_0_0
var_0_0.__name = "BattleGateScenarioSubStrike"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(ChapterProxy):getActiveChapter():getConfigMiscArg("submarine_support")
	local var_1_1 = {
		prefabFleet = {},
		stageId = var_1_0,
		system = SYSTEM_SCENARIO_SUB_STRIKE
	}

	arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_1_1)
end

function var_0_0.Exit(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ChapterProxy):getActiveChapter()
	local var_2_1 = arg_2_0.statistics._battleScore >= ys.Battle.BattleConst.BattleScore.S

	var_2_0:writeBack(var_2_1, arg_2_0)

	local function var_2_2()
		arg_2_1:sendNotification(GAME.FINISH_STAGE_DONE, {
			statistics = arg_2_0.statistics,
			score = arg_2_0.statistics._battleScore,
			system = SYSTEM_SCENARIO_SUB_STRIKE
		})
	end

	arg_2_1:sendNotification(GAME.CHAPTER_OP, {
		type = ChapterConst.OPSubStrike,
		arg1 = arg_2_0.statistics._battleScore,
		callback = var_2_2
	})
end

return var_0_0
