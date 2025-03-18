local var_0_0 = class("NewEducateSelEndingMediator", import("view.newEducate.base.NewEducateContextMediator"))

var_0_0.ON_SELECT_ENDING = "NewEducateSelEndingMediator:ON_SELECT_ENDING"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_SELECT_ENDING, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_ENDING, {
			id = arg_1_0.contextData.char.id,
			endingId = arg_2_1
		})
	end)
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		GAME.NEW_EDUCATE_SEL_ENDING_DONE
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == GAME.NEW_EDUCATE_SEL_ENDING_DONE then
		arg_4_0.viewComponent:OnSelDone(var_4_1.id)
	end
end

return var_0_0
