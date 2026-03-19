local var_0_0 = class("NewEducateSelEndingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.endingId
	local var_1_3 = var_1_0.isMain

	pg.ConnectionMgr.GetInstance():Send(29005, {
		id = var_1_1,
		ending_id = var_1_2
	}, 29006, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy)

			var_2_0:AddFinishedEnding(var_1_2)
			var_2_0:GetCurChar():GetFSM():GetState(NewEducateFSM.SYSTEM.ENDING):SelEnding(var_1_2)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_ENDING_DONE, {
				id = var_1_2,
				isMain = var_1_3
			})

			local var_2_1 = var_2_0:GetCurChar():GetGameCnt()

			pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataEnding(var_1_1, var_2_1, var_1_2))
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_SelTalent: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
