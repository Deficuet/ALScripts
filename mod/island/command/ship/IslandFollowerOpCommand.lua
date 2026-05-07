local var_0_0 = class("IslandFollowerOpCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.shipId
	local var_1_2 = var_1_0.op
	local var_1_3 = getProxy(IslandProxy):GetIsland()
	local var_1_4 = var_1_3:GetFollowerAgency()
	local var_1_5 = var_1_3:GetCharacterAgency()

	if not var_1_5:GetShipById(var_1_1) then
		return
	end

	if var_1_2 == IslandConst.FOLLOWER_OP_ADD and not var_1_5:CanFollowPlayer(var_1_1) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_follower_state_no_normal"))

		return
	end

	if var_1_2 == IslandConst.FOLLOWER_OP_ADD and var_1_4:ReachMaxCnt() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_follower_cnt_max"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(21630, {
		ship_id = var_1_1,
		type = var_1_2
	}, 21631, function(arg_2_0)
		if arg_2_0.result == 0 then
			if var_1_2 == IslandConst.FOLLOWER_OP_ADD then
				var_1_4:AddFollower(var_1_1)
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_follow_success"))
			elseif var_1_2 == IslandConst.FOLLOWER_OP_DEL then
				var_1_4:DelFollower(var_1_1)
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_cancel_follow_success"))
			end

			arg_1_0:sendNotification(GAME.ISLAND_FOLLOWER_OP_DONE, var_1_1)

			if var_1_0.callback then
				var_1_0.callback()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
