local var_0_0 = class("ActivityPermanentMediator", import("..base.ContextMediator"))

var_0_0.START_SELECT = "ActivityPermanentMediator.START_SELECT"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.START_SELECT, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_PERMANENT_START, {
			activity_id = arg_2_1
		})
	end)
	arg_1_0.viewComponent:setActivitys(getProxy(ActivityPermanentProxy):getActivityIdsByType(ActivityPermanentProxy.TYPE_NORMAL_ACTIVITY))
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		GAME.ACTIVITY_PERMANENT_START_DONE,
		GAME.ACTIVITY_PERMANENT_FINISH_DONE
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()
	local var_4_2 = var_4_1 and (var_4_1.id or var_4_1.activity_id)

	if var_4_0 == GAME.ACTIVITY_PERMANENT_START_DONE or var_4_0 == GAME.ACTIVITY_PERMANENT_FINISH_DONE then
		if not getProxy(ActivityPermanentProxy):IsNormalActivityId(var_4_2) then
			return
		end

		arg_4_0.viewComponent:closeView()
	end
end

return var_0_0
