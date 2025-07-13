local var_0_0 = class("GuildGetDonateListCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().callback

	pg.ConnectionMgr.GetInstance():Send(62031, {
		type = 0
	}, 62032, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = {}

			for iter_2_0, iter_2_1 in ipairs(arg_2_0.donate_tasks) do
				local var_2_1 = GuildDonateTask.New({
					id = iter_2_1
				})

				table.insert(var_2_0, var_2_1)
				print("donate id : ", var_2_1.id)
			end

			local var_2_2 = getProxy(GuildProxy)
			local var_2_3 = var_2_2:getData()

			var_2_3:updateDonateTasks(var_2_0)
			var_2_2:updateGuild(var_2_3)
			arg_1_0:sendNotification(GAME.GUILD_DONATE_LIST_UPDATE_DONE)

			getProxy(GuildProxy).shouldRefreshDonateList = false
			getProxy(GuildProxy).refreshDonateListFailed = false

			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_donate_list_updated"))
		elseif arg_2_0.result == 4 then
			getProxy(GuildProxy).refreshDonateListFailed = true

			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_donate_list_update_failed"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end

		if var_1_0 then
			var_1_0()
		end
	end)
end

return var_0_0
