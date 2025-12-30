local var_0_0 = class("IslandGetNpcActionAwardCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.npcId
	local var_1_2 = var_1_0.actionId

	pg.ConnectionMgr.GetInstance():Send(21702, {
		npc_id = var_1_1,
		action_feedback_id = var_1_2
	}, 21703, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetNpcFeedbackAgency():AddNpc(var_1_1)

			local var_2_0 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_GET_NPC_ACTION_AWARD_DONE, {
				dropData = var_2_0
			})
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.ACTION_HELLO_DAILY)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
