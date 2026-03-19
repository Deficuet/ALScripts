local var_0_0 = class("NewEducateUpgradeEntryCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.entryId

	pg.ConnectionMgr.GetInstance():Send(29122, {
		id = var_1_1,
		affixid = var_1_2
	}, 29123, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar():GetFSM()

			var_2_0:GetPriorityState():MarkFinish()
			var_2_0:CheckPriorityStystem()

			local var_2_1 = NewEducateDropHelper.HandleDrops(arg_2_0.drop)

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_UPGRADE_ENTRY_DONE, {
				entryId = var_1_2,
				drops = var_2_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_UpgradeEntry_Error: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
