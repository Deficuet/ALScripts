local var_0_0 = class("ReversePacmanTaskMediator", import("view.base.ContextMediator"))

var_0_0.ON_TASK_GO = "ReversePacmanTaskMediator::ON_TASK_GO"
var_0_0.ON_TASK_SUBMIT = "ReversePacmanTaskMediator::ON_TASK_SUBMIT"
var_0_0.ON_ACTIVITY_TASK_SUBMIT_ONESTEP = "ReversePacmanTaskMediator::ON_ACTIVITY_TASK_SUBMIT_ONESTEP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_TASK_GO, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_3_1.id)
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVITY_TASK_SUBMIT_ONESTEP, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_4_1,
			task_ids = arg_4_2
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_5_0)
	arg_5_0.handleDic = {
		[GAME.SUBMIT_TASK_DONE] = function(arg_6_0, arg_6_1)
			arg_6_0.viewComponent:emit(BaseUI.ON_ACHIEVE, arg_6_1:getBody().awards)
			arg_6_0.viewComponent:RefreshUI()
			arg_6_0:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
		end,
		[GAME.SUBMIT_ACTIVITY_TASK_DONE] = function(arg_7_0, arg_7_1)
			arg_7_0.viewComponent:emit(BaseUI.ON_ACHIEVE, arg_7_1:getBody().awards)
			arg_7_0.viewComponent:RefreshUI()
			arg_7_0:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
		end,
		[GAME.TOTAL_TASK_UPDATED] = function(arg_8_0, arg_8_1)
			arg_8_0.viewComponent:RefreshUI()
			arg_8_0:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
		end
	}
end

function var_0_0.remove(arg_9_0)
	return
end

return var_0_0
