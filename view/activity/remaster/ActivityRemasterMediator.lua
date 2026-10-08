local var_0_0 = class("ActivityRemasterMediator", import("view.base.ContextMediator"))

var_0_0.ACTIVE_ACT = "ActivityRemasterMediator.ACTIVE_ACT"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ACTIVE_ACT, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.ACT_REMASTER_ACTIVE, {
			id = arg_2_1
		})
	end)
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		GAME.ACT_REMASTER_ACTIVE_DONE
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == GAME.ACT_REMASTER_ACTIVE_DONE then
		arg_4_0.viewComponent:emit(BaseUI.ON_BACK)
	end
end

return var_0_0
