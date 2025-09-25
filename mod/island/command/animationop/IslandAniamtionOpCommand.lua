local var_0_0 = class("IslandAniamtionOpCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.targetId
	local var_1_2 = var_1_0.actionId
	local var_1_3 = var_1_0.islandId

	pg.ConnectionMgr.GetInstance():Send(21700, {
		island_id = var_1_3,
		target_id = var_1_1,
		action_id = var_1_2
	})
end

return var_0_0
