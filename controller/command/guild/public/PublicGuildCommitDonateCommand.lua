local var_0_0 = class("PublicGuildCommitDonateCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id
	local var_1_1 = getProxy(GuildProxy):GetPublicGuild()
	local var_1_2 = var_1_1:GetDonateTaskById(var_1_0)

	if not var_1_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_not_exist_donate_task"))

		return
	end

	if not var_1_2:canCommit() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	if not var_1_1:HasDonateCnt() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_donate_times_not enough"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(62002, {
		id = var_1_0
	}, 62003, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = {}

			for iter_2_0, iter_2_1 in ipairs(arg_2_0.donate_tasks) do
				local var_2_1 = GuildDonateTask.New({
					id = iter_2_1
				})

				table.insert(var_2_0, var_2_1)
			end

			var_1_1:UpdateDonateTasks(var_2_0)
			var_1_1:IncDonateCount()

			local var_2_2 = getProxy(PlayerProxy)
			local var_2_3 = var_2_2:getData()
			local var_2_4 = var_1_2:getConfig("award_contribution")

			var_2_3:addResources({
				guildCoin = var_2_4
			})
			var_2_2:updatePlayer(var_2_3)

			local var_2_5 = var_1_2:getCommitItem()

			arg_1_0:sendNotification(GAME.CONSUME_ITEM, Drop.Create(var_2_5))

			local var_2_6 = {}
			local var_2_7 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = PlayerConst.ResGuildCoin,
				count = var_2_4
			})

			table.insert(var_2_6, var_2_7)
			arg_1_0:sendNotification(GAME.PUBLIC_GUILD_COMMIT_DONATE_DONE, {
				awards = var_2_6
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_dissolve_erro", arg_2_0.result))
		end
	end)
end

return var_0_0
