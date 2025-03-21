local var_0_0 = class("WorldMediaCollectionMediator", ContextMediator)

var_0_0.BEGIN_STAGE = "WorldMediaCollectionMediator BEGIN_STAGE"
var_0_0.ON_ADD_SUBLAYER = "WorldMediaCollectionMediator.ON_ADD_SUBLAYER"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.BEGIN_STAGE, function(arg_2_0, arg_2_1)
		arg_1_0.contextData.revertBgm = pg.CriMgr.GetInstance().bgmNow

		arg_1_0:sendNotification(GAME.BEGIN_STAGE, arg_2_1)
	end)
	arg_1_0:bind(var_0_0.ON_ADD_SUBLAYER, function(arg_3_0, arg_3_1)
		arg_1_0:addSubLayers(arg_3_1)
	end)
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_DONE
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == PlayerProxy.UPDATED then
		arg_5_0.viewComponent:UpdateView()
	elseif var_5_0 == GAME.BEGIN_STAGE_DONE then
		arg_5_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_5_1)
	end
end

return var_0_0
