local var_0_0 = class("ReversePacmanAddFavorabilityCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.roleID

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 4,
		activity_id = var_1_0.activityID,
		arg1 = var_1_1
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			ReversePacmanTools.GetActivity():AddFavorability(var_1_1, 1)
			arg_1_0:sendNotification(GAME.REVERSE_PACMAN_ADD_FAVORABILITY_DONE, var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0
