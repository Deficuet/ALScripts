local var_0_0 = class("GuildCommitDonateCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().taskId
	local var_1_1 = getProxy(GuildProxy)
	local var_1_2 = var_1_1:getData()

	if not var_1_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_no_exist"))

		return
	end

	local var_1_3 = var_1_2:getDonateTaskById(var_1_0)

	if not var_1_3 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_not_exist_donate_task"))

		return
	end

	if not var_1_3:canCommit() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	if not var_1_2:canDonate() then
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

			local var_2_2 = getProxy(PlayerProxy)
			local var_2_3 = var_2_2:getData()
			local var_2_4 = var_1_1:getData()

			var_2_4:getMemberById(var_2_3.id):AddLiveness(var_1_3:GetLivenessAddition())
			var_2_4:updateDonateTasks(var_2_0)
			var_2_4:updateDonateCount()
			var_1_1:updateGuild(var_2_4)

			local var_2_5 = var_1_3:getConfig("award_contribution")

			var_2_3:addResources({
				guildCoin = var_2_5
			})
			var_2_2:updatePlayer(var_2_3)

			local var_2_6 = var_1_3:getCommitItem()

			arg_1_0:sendNotification(GAME.CONSUME_ITEM, Drop.Create(var_2_6))

			local var_2_7 = {}
			local var_2_8 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = PlayerConst.ResGuildCoin,
				count = var_2_5
			})

			table.insert(var_2_7, var_2_8)

			local var_2_9 = var_1_3:getConfig("award_capital")
			local var_2_10 = var_1_3:getConfig("award_tech_exp")

			arg_1_0:sendNotification(GAME.GUILD_COMMIT_DONATE_DONE, {
				awards = var_2_7,
				capital = var_2_9,
				techPoint = var_2_10
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_dissolve_erro", arg_2_0.result))
		end
	end)
end

return var_0_0
