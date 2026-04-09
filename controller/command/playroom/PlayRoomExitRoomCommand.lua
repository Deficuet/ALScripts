local var_0_0 = class("PlayRoomExitRoomCommand", pm.SimpleCommand)

var_0_0.PLAY_ROOM_EXIT_ROOM_DONE = "PlayRoomExitRoomCommand:PLAY_ROOM_EXIT_ROOM_DONE"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(IslandProxy):GetIsland()

	pg.ConnectionMgr.GetInstance():Send(23011, {
		arg = 1
	}, 23012, function(arg_2_0)
		local var_2_0 = getProxy(PlayRoomProxy)

		var_2_0:ExitRoom()
		var_2_0:SetMatchCD(arg_2_0.time)
		arg_1_0:sendNotification(GAME.PLAY_ROOM_EXIT_ROOM_DONE)
		var_1_1:DispatchEvent(var_0_0.PLAY_ROOM_EXIT_ROOM_DONE)
	end)
end

return var_0_0
