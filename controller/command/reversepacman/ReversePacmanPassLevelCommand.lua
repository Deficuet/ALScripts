local var_0_0 = class("ReversePacmanPassLevelCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.actId
	local var_1_2 = var_1_0.levelId
	local var_1_3 = var_1_0.time

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 3,
		activity_id = var_1_0.actId,
		arg1 = var_1_2,
		arg2 = var_1_3
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			ReversePacmanTools.GetActivity():UpdatePassStage(var_1_2, var_1_3)

			local var_2_0 = {}
			local var_2_1 = PlayerConst.addTranDrop(arg_2_0.award_list)

			arg_1_0:sendNotification(GAME.REVERSE_PACMAN_PASS_LEVEL_DONE, {
				awards = var_2_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0
