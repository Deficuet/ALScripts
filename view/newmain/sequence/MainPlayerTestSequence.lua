local var_0_0 = class("MainPlayerTestSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	if ISLAND_PLAYER_TESTING then
		local var_1_0 = getProxy(PlayerProxy):getRawData().id

		pg.m02:sendNotification(GAME.ISLAND_ENTER, {
			id = var_1_0
		})
	else
		arg_1_1()
	end
end

return var_0_0
