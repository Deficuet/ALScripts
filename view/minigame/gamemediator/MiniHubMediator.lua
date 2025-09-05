local var_0_0 = class("MiniHubMediator", import("..BaseMiniGameMediator"))

function var_0_0.register(arg_1_0)
	var_0_0.super.register(arg_1_0)

	local var_1_0 = {}

	arg_1_0.viewComponent:SetExtraData(var_1_0)
end

function var_0_0.OnMiniGameOPeration(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_0.miniGameProxy:GetHubByGameId(arg_2_0.miniGameId)

	arg_2_0:sendNotification(GAME.SEND_MINI_GAME_OP, {
		hubid = var_2_0.id,
		cmd = arg_2_1,
		args1 = arg_2_2
	})
end

function var_0_0.OnMiniGameSuccess(arg_3_0, arg_3_1)
	if arg_3_0.gameRoomData then
		if arg_3_0.gameRoonCoinCount and arg_3_0.gameRoonCoinCount == 0 then
			return
		end

		local var_3_0 = arg_3_1
		local var_3_1 = arg_3_0.gameRoonCoinCount or 1
		local var_3_2 = arg_3_0.gameRoomData.id

		arg_3_0:sendNotification(GAME.GAME_ROOM_SUCCESS, {
			roomId = var_3_2,
			times = var_3_1,
			score = var_3_0
		})
	else
		local var_3_3 = arg_3_0.miniGameProxy:GetHubByGameId(arg_3_0.miniGameId)

		if var_3_3.count <= 0 then
			return
		end

		local var_3_4

		if arg_3_1 and type(arg_3_1) == "table" then
			var_3_4 = arg_3_1
		else
			var_3_4 = {
				arg_3_1
			}
		end

		arg_3_0:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = var_3_3.id,
			cmd = MiniGameOPCommand.CMD_COMPLETE,
			args1 = var_3_4,
			id = arg_3_0.miniGameId
		})
	end
end

function var_0_0.OnMiniGameFailure(arg_4_0, arg_4_1)
	return
end

function var_0_0.listNotificationInterests(arg_5_0)
	local var_5_0 = {
		GAME.SUBMIT_ACTIVITY_TASK_DONE
	}

	table.insertto(var_5_0, var_0_0.super.listNotificationInterests(arg_5_0))

	return var_5_0
end

function var_0_0.handleNotification(arg_6_0, arg_6_1)
	var_0_0.super.handleNotification(arg_6_0, arg_6_1)

	local var_6_0 = arg_6_1:getName()
	local var_6_1 = arg_6_1:getBody()

	if var_6_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		arg_6_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_6_1.awards)

		if arg_6_0.viewComponent.ShowTask then
			arg_6_0.viewComponent:ShowTask()
		end
	elseif var_6_0 == GAME.SEND_MINI_GAME_OP_DONE and arg_6_0.viewComponent.OnSendMiniGameOPDoneShrine then
		arg_6_0.viewComponent:OnSendMiniGameOPDoneShrine()
	end
end

return var_0_0
