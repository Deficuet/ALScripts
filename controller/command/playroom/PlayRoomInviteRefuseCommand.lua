local var_0_0 = class("PlayRoomInviteRefuseCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	getProxy(PlayRoomProxy):RefuseInvite(var_1_0)
end

return var_0_0
