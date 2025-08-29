local var_0_0 = class("IslandGetAchvAwardCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().ids

	pg.ConnectionMgr.GetInstance():Send(21050, {
		id_list = var_1_0
	}, 21051, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetAchievementAgency():AddGotIds(var_1_0)
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.ACHIEVEMENT)

			local var_2_0 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_GET_ACHV_AWARD_DONE, {
				dropData = var_2_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
