local var_0_0 = class("EducateCharDockMediator", import("view.base.ContextMediator"))

var_0_0.GO_PROFILE = "EducateCharDockMediator:GO_PROFILE"
var_0_0.ON_SELECTED = "EducateCharDockMediator:ON_SELECTED"
var_0_0.ON_SKIN_SHOP = "EducateCharDockMediator.ON_SKIN_SHOP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_SELECTED, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.CHANGE_EDUCATE, {
			id = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_PROFILE, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.EDUCATE_PROFILE, {
			selectedCharacterId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SKIN_SHOP, function(arg_4_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP, {
			skinId = arg_4_0
		})
	end)
end

function var_0_0.listNotificationInterests(arg_5_0)
	return {
		GAME.CLEAR_EDUCATE_TIP
	}
end

function var_0_0.handleNotification(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1:getName()
	local var_6_1 = arg_6_1:getBody()

	if var_6_0 == GAME.CLEAR_EDUCATE_TIP then
		arg_6_0.viewComponent:emit(EducateCharDockScene.MSG_CLEAR_TIP, var_6_1.id)
	end
end

return var_0_0
