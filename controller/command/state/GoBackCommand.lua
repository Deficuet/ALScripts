local var_0_0 = class("GoBackCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = arg_1_1:getType() or 1
	local var_1_2 = getProxy(ContextProxy)

	if var_1_2:getContextCount() > 1 then
		local var_1_3 = var_1_2:popContext()
		local var_1_4

		for iter_1_0 = 1, var_1_1 do
			if var_1_2:getContextCount() > 0 then
				var_1_4 = var_1_2:popContext()
			else
				originalPrint("could not pop more context")

				break
			end
		end

		var_1_4:extendData(var_1_0)
		SCENE.SetSceneInfo(var_1_4, var_1_4.scene)
		arg_1_0:sendNotification(GAME.LOAD_SCENE, {
			isBack = true,
			prevContext = var_1_3,
			context = var_1_4
		})
	else
		originalPrint("no more context in the stack")
	end
end

return var_0_0
