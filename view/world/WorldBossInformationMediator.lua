local var_0_0 = class("WorldBossInformationMediator", import("..base.ContextMediator"))

var_0_0.RETREAT_FLEET = "WorldBossInformationMediator:RETREAT_FLEET"
var_0_0.OnOpenSublayer = "WorldBossInformationMediator:OpenSublayer"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.RETREAT_FLEET, function()
		arg_1_0:sendNotification(GAME.WORLD_RETREAT_FLEET)
	end)
	arg_1_0:bind(var_0_0.OnOpenSublayer, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0:addSubLayers(arg_3_1, arg_3_2, arg_3_3)
	end)
	arg_1_0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		PlayerProxy.UPDATED,
		GAME.WORLD_MAP_OP_DONE,
		GAME.BEGIN_STAGE_DONE
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == PlayerProxy.UPDATED then
		arg_5_0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
	elseif var_5_0 == GAME.WORLD_MAP_OP_DONE then
		-- block empty
	elseif var_5_0 == GAME.BEGIN_STAGE_DONE then
		arg_5_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_5_1)
	end
end

return var_0_0
