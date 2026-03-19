local var_0_0 = class("NewEducateUpgradeFavorCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0 and var_1_0.callback

	if getProxy(NewEducateProxy):GetCurChar():GetFSM():CheckPriorityStystem() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("child2_priority_tip"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(29027, {
		id = var_1_1
	}, 29028, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(NewEducateProxy):GetCurChar():UpgradeFavor()

			local var_2_0 = NewEducateDropHelper.HandleDrops(arg_2_0.drop)

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_UPGRADE_FAVOR_DONE, {
				drops = var_2_0,
				callback = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_UpgradeFavor: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
