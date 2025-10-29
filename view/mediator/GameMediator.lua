local var_0_0 = class("GameMediator", pm.Mediator)

function var_0_0.listNotificationInterests(arg_1_0)
	return {
		GAME.GO_SCENE,
		GAME.GO_MINI_GAME,
		GAME.LOAD_SCENE_DONE,
		GAME.SEND_CMD_DONE
	}
end

function var_0_0.handleNotification(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1:getName()
	local var_2_1 = arg_2_1:getBody()
	local var_2_2

	if var_2_0 == GAME.GO_SCENE then
		local var_2_3 = arg_2_1:getType()
		local var_2_4 = Context.New()

		var_2_4:extendData(var_2_3)
		SCENE.SetSceneInfo(var_2_4, var_2_1)
		print("load scene: " .. var_2_1)
		arg_2_0:sendNotification(GAME.LOAD_SCENE, {
			context = var_2_4
		})
	elseif var_2_0 == GAME.GO_MINI_GAME then
		local var_2_5 = Context.New()
		local var_2_6
		local var_2_7

		if type(var_2_1) == "number" then
			var_2_6 = var_2_1
			var_2_7 = {
				miniGameId = var_2_6
			}
		else
			var_2_6 = var_2_1.id
			var_2_7 = var_2_1
			var_2_7.miniGameId = var_2_6
		end

		var_2_5:extendData(var_2_7)

		local var_2_8 = pg.mini_game[var_2_6]

		var_2_5.mediator = _G[var_2_8.mediator_name]
		var_2_5.viewComponent = _G[var_2_8.view_name]
		var_2_5.scene = var_2_8.view_name

		print("load minigame: " .. var_2_8.view_name)

		local var_2_9 = {
			context = var_2_5
		}
		local var_2_10 = arg_2_1:getType()

		table.merge(var_2_9, var_2_10)
		arg_2_0:sendNotification(GAME.LOAD_SCENE, var_2_9)
	elseif var_2_0 == GAME.LOAD_SCENE_DONE then
		print("scene loaded: ", var_2_1)

		if var_2_1 == SCENE.LOGIN then
			pg.UIMgr.GetInstance():displayLoadingBG(false)
		end
	elseif var_2_0 == GAME.SEND_CMD_DONE then
		-- block empty
	end
end

return var_0_0
