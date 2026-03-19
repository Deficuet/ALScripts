local var_0_0 = class("NewEducateScheduleSkipCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(29046, {
		id = var_1_0
	}, 29047, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(NewEducateProxy):GetCurChar():GetFSM():GetState(NewEducateFSM.SYSTEM.PLAN):MarkFinish()

			local var_2_0 = NewEducateDropHelper.HandleDrops(arg_2_0.drop)

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_GET_EXTRA_DROP, {
				id = var_1_0,
				scheduleDrops = var_2_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_Schedule_Skip: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
