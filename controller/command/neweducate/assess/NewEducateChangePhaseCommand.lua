local var_0_0 = class("NewEducateChangePhaseCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(29025, {
		id = var_1_0
	}, 29026, function(arg_2_0)
		if arg_2_0.result == 0 then
			NewEducateHelper.TrackRoundEnd()

			local var_2_0 = getProxy(NewEducateProxy):GetCurChar()

			var_2_0:GetFSM():SetCurNode(arg_2_0.first_node)
			var_2_0:GetFSM():SetSystemNo(NewEducateFSM.SYSTEM.PHASE)
			getProxy(NewEducateProxy):NextRound()

			local var_2_1 = NewEducateDropHelper.HandleDrops(arg_2_0.drop)

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_CHANGE_PHASE_DONE, {
				drops = var_2_1,
				node = arg_2_0.first_node
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_ChangePhase: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
