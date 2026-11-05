local var_0_0 = class("IslandHeartBeatCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	pg.ConnectionMgr.GetInstance():Send(21215, {
		island_id = var_1_0.islandId
	})
end

return var_0_0
