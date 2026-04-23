local var_0_0 = class("DOALinkIslandReMediator", import("..TemplateMV.BackHillMediatorTemplate"))

function var_0_0.register(arg_1_0)
	arg_1_0:BindEvent()
end

function var_0_0.BindEvent(arg_2_0)
	arg_2_0:bind(var_0_0.GO_SCENE, function(arg_3_0, arg_3_1, ...)
		arg_2_0:sendNotification(GAME.GO_SCENE, arg_3_1, ...)
	end)
	arg_2_0:bind(var_0_0.GO_SUBLAYER, function(arg_4_0, arg_4_1, arg_4_2)
		arg_2_0:addSubLayers(arg_4_1, nil, arg_4_2)
	end)
	arg_2_0:bind(var_0_0.MINI_GAME_OPERATOR, function(arg_5_0, ...)
		arg_2_0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
end

function var_0_0.listNotificationInterests(arg_6_0)
	return {
		GAME.SEND_MINI_GAME_OP_DONE,
		ActivityProxy.ACTIVITY_UPDATED
	}
end

function var_0_0.handleNotification(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1:getName()
	local var_7_1 = arg_7_1:getBody()

	if var_7_0 == GAME.SEND_MINI_GAME_OP_DONE then
		local var_7_2 = {
			function(arg_8_0)
				local var_8_0 = var_7_1.awards

				if #var_8_0 > 0 then
					arg_7_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_8_0, arg_8_0)
				else
					arg_8_0()
				end
			end,
			function(arg_9_0)
				arg_7_0.viewComponent:UpdateView()
			end
		}

		seriesAsync(var_7_2)
	elseif var_7_0 == ActivityProxy.ACTIVITY_UPDATED then
		arg_7_0.viewComponent:UpdateActivity(var_7_1)
	end
end

return var_0_0
