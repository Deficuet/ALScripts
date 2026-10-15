local var_0_0 = class("FormationSuggestionMediator", import("view.base.ContextMediator"))

var_0_0.ON_CLOSE_SHIP_INFO = "FormationSuggestionMediator::ON_CLOSE_SHIP_INFO"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_CLOSE_SHIP_INFO, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.FORMATION_SUGGESTION_CLOSE_SHIP_INFO)
	end)
end

function var_0_0.initNotificationHandleDic(arg_3_0)
	arg_3_0.handleDic = {
		[GAME.FORMATION_SUGGESTION_OPEN_SHIP_INFO] = function(arg_4_0, arg_4_1)
			arg_4_0.viewComponent:OnOpenShipInfo()
		end,
		[GAME.FORMATION_SUGGESTION_EXIT_SHIP_INFO] = function(arg_5_0, arg_5_1)
			arg_5_0.viewComponent:OnCloseShipInfo()
		end
	}
end

function var_0_0.remove(arg_6_0)
	return
end

return var_0_0
