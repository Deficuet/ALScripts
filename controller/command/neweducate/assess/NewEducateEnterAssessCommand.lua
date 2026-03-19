local var_0_0 = class("NewEducateEnterAssessCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0 and var_1_0.callback
	local var_1_2 = var_1_0.id

	pg.ConnectionMgr.GetInstance():Send(29050, {
		id = var_1_2
	}, 29051, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar():GetFSM()

			var_2_0:SetCurNode(0)
			var_2_0:SetSystemNo(NewEducateFSM.SYSTEM.ASSESS)

			local var_2_1 = getProxy(NewEducateProxy):GetCurChar():GetAssessRankIdx()
			local var_2_2 = NewEducateAssessState.New({
				is_finished = var_2_1 == 0 and 1 or 0
			})

			var_2_0:SetState(NewEducateFSM.SYSTEM.ASSESS, var_2_2)

			local var_2_3 = NewEducateDropHelper.HandleDrops(arg_2_0.drop)

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_ENTER_ASSESS_DONE, {
				drops = var_2_3,
				callback = var_1_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_EnterAssess: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
