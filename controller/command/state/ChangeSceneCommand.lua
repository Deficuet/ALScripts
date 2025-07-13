local var_0_0 = class("ChangeSceneCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = arg_1_1:getType()
	local var_1_2 = getProxy(ContextProxy):popContext()
	local var_1_3 = Context.New()

	var_1_3:extendData(var_1_1)
	SCENE.SetSceneInfo(var_1_3, var_1_0)
	arg_1_0:sendNotification(GAME.LOAD_SCENE, {
		prevContext = var_1_2,
		context = var_1_3
	})
end

return var_0_0
