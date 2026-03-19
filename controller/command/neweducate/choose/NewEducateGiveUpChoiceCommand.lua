local var_0_0 = class("NewEducateGiveUpChoiceCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(29101, {
		id = var_1_0
	}, 29102, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar():GetFSM()

			var_2_0:GetPriorityState():MarkFinish()
			var_2_0:CheckPriorityStystem()

			local var_2_1 = NewEducateDropHelper.HandleDrops(arg_2_0.drop)

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_GIVE_UP_CHOICE_DONE, {
				drops = var_2_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_GiveUpChoice_Error: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
