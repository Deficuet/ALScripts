local var_0_0 = class("ClueMapMediator", import("view.base.ContextMediator"))

var_0_0.ON_TASK_SUBMIT_ONESTEP = "ClueMapMediator.ON_TASK_SUBMIT_ONESTEP"
var_0_0.OPEN_SINGLE_CLUE_GROUP = "ClueMapMediator.OPEN_SINGLE_CLUE_GROUP"
var_0_0.OPEN_CLUE_BOOK = "ClueMapMediator.OPEN_CLUE_BOOK"
var_0_0.OPEN_CLUE_TASk = "ClueMapMediator.OPEN_CLUE_TASk"
var_0_0.OPEN_STAGE = "ClueMapMediator.OPEN_STAGE"
var_0_0.ON_FLEET_SELECT = "ClueMapMediator.ON_FLEET_SELECT"
var_0_0.OPEN_CLUE_JUMP = "ClueMapMediator.OPEN_CLUE_JUMP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT_ONESTEP, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_2_1,
			task_ids = arg_2_2,
			callback = arg_2_3
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_SINGLE_CLUE_GROUP, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = ClueGroupSingleView,
			mediator = ClueGroupSingleMediator,
			data = {
				clueGroupId = arg_3_1,
				submitClueIds = arg_3_2
			},
			onRemoved = arg_3_3
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CLUE_BOOK, function(arg_4_0, arg_4_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = ClueBookLayer,
			mediator = ClueBookMediator,
			onRemoved = arg_4_1
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CLUE_TASk, function(arg_5_0, arg_5_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = ClueTasksLayer,
			mediator = ClueTasksMediator,
			onRemoved = arg_5_1
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_STAGE, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = ClueBuffSelectLayer,
			mediator = ClueBuffSelectMediator,
			data = {
				clueSingleEnemyID = arg_6_1
			}
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_7_0)
	return {
		var_0_0.ON_FLEET_SELECT,
		var_0_0.OPEN_CLUE_JUMP,
		PlayerProxy.UPDATED,
		GAME.SUBMIT_ACTIVITY_TASK_DONE
	}
end

function var_0_0.handleNotification(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getName()
	local var_8_1 = arg_8_1:getBody()

	if var_8_0 == var_0_0.ON_FLEET_SELECT then
		arg_8_0.viewComponent:ShowNormalFleet(var_8_1.singleID)
	elseif var_8_0 == var_0_0.OPEN_CLUE_JUMP then
		local var_8_2 = var_8_1.jumpID
		local var_8_3 = pg.activity_clue_group[var_8_2]

		arg_8_0:addSubLayers(Context.New({
			viewComponent = ClueBuffSelectLayer,
			mediator = ClueBuffSelectMediator,
			data = {
				clueSingleEnemyID = var_8_3.unlock_jump[1][1],
				preSelectedBuffList = Clone(var_8_3.unlock_jump[2])
			}
		}))

		local var_8_4 = pg.activity_single_enemy[var_8_3.unlock_jump[1][1]].type

		if var_8_4 == 1 or var_8_4 == 2 or var_8_4 == 3 then
			triggerToggle(arg_8_0.viewComponent.mapsSwitch[var_8_4], true)
		end
	elseif var_8_0 == PlayerProxy.UPDATED then
		arg_8_0.viewComponent:ShowResUI()
	elseif var_8_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		arg_8_0.viewComponent:RefreshPtAndTicket()
	end
end

return var_0_0
