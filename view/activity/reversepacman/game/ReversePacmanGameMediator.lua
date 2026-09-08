local var_0_0 = class("ReversePacmanGameMediator", import("view.base.ContextMediator"))

var_0_0.GO_SCENE = "ReversePacmanGameMediator.GO_SCENE"
var_0_0.GO_SUBLAYER = "ReversePacmanGameMediator.GO_SUBLAYER"
var_0_0.SETTLE_GAME = "ReversePacmanGameMediator.SETTLE_GAME"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.GO_SCENE, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_2_1, arg_2_2)
	end)
	arg_1_0:bind(var_0_0.GO_SUBLAYER, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0:addSubLayers(arg_3_1, nil, arg_3_2)
	end)
	arg_1_0:bind(var_0_0.SETTLE_GAME, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.REVERSE_PACMAN_PASS_LEVEL, {
			actId = arg_4_1.actId,
			levelId = arg_4_1.levelId,
			time = arg_4_1.time
		})
	end)
end

function var_0_0.listNotificationInterests(arg_5_0)
	return {
		GAME.REVERSE_PACMAN_PASS_LEVEL_DONE
	}
end

function var_0_0.handleNotification(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1:getName()
	local var_6_1 = arg_6_1:getBody()

	if var_6_0 == GAME.REVERSE_PACMAN_PASS_LEVEL_DONE then
		arg_6_0.viewComponent:ShowSettlePanel(var_6_1.awards)
	end
end

return var_0_0
