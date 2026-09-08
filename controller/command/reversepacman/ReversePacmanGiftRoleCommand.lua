local var_0_0 = class("ReversePacmanGiftRoleCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.roleID
	local var_1_2 = var_1_0.itemID

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 2,
		activity_id = var_1_0.activityID,
		arg1 = var_1_1,
		arg2 = var_1_2
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = ReversePacmanTools.GetActivity()

			var_2_0:AddFavorability(var_1_1, 1)

			local var_2_1 = ReversePacmanTools.GetGiftItemID()

			var_2_0:AddVitemNumber(var_2_1, -1)
			arg_1_0:sendNotification(GAME.REVERSE_PACMAN_GIFT_ROLE_DONE, var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0
