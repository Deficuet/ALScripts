local var_0_0 = class("ReversePacmanInterviewMediator", import("view.base.ContextMediator"))

var_0_0.CMD_HIRE = "ReversePacmanInterviewMediator::CMD_HIRE"

function var_0_0.register(arg_1_0)
	local var_1_0 = ReversePacmanTools.GetActivity().id

	arg_1_0:bind(var_0_0.CMD_HIRE, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.REVERSE_PACMAN_HIRE_ROLE, {
			activityID = var_1_0,
			roleID = arg_2_1
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_3_0)
	arg_3_0.handleDic = {
		[GAME.REVERSE_PACMAN_HIRE_ROLE_DONE] = function(arg_4_0, arg_4_1)
			local var_4_0 = arg_4_1:getBody()

			arg_4_0.viewComponent:OnRoleHireSuccess(var_4_0)
		end,
		[STORY_EVENT.OPTION_SELECTED] = function(arg_5_0, arg_5_1)
			arg_5_0.viewComponent:OnSelectedOption()
		end,
		[GAME.REVERSE_PACMAN_REFRESH_TIP] = function(arg_6_0, arg_6_1)
			arg_6_0.viewComponent:RefreshBtns()
		end
	}
end

return var_0_0
