local var_0_0 = class("FormationSuggestionShipInfoMediator", import("view.base.ContextMediator"))

var_0_0.JUMP_TO_SCENE = "FormationSuggestionShipInfoMediator::JUMP_TO_SCENE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.JUMP_TO_SCENE, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.JUMP_TO_SCENE, arg_2_1)
	end)
	arg_1_0:sendNotification(GAME.FORMATION_SUGGESTION_OPEN_SHIP_INFO)
end

function var_0_0.initNotificationHandleDic(arg_3_0)
	arg_3_0.handleDic = {
		[GAME.FORMATION_SUGGESTION_CLOSE_SHIP_INFO] = function(arg_4_0, arg_4_1)
			arg_4_0.viewComponent:closeView()
		end
	}
end

return var_0_0
