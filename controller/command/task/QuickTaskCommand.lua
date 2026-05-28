local var_0_0 = class("QuickTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = arg_1_1:getType()
	local var_1_2
	local var_1_3 = var_1_0
	local var_1_4 = getProxy(TaskProxy)
	local var_1_5 = var_1_4:getTaskById(var_1_3)

	if not var_1_5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_is_not_existence", var_1_3))

		if var_1_1 then
			var_1_1(false)
		end

		return
	end

	if var_1_5:getConfig("quick_finish") > getProxy(BagProxy):getItemCountById(Item.QUICK_TASK_PASS_TICKET_ID) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		if var_1_1 then
			var_1_1(false)
		end

		return
	end

	if var_1_4:isSubmitting(var_1_3) then
		return
	else
		var_1_4:addSubmittingTask(var_1_3)
	end

	local var_1_6 = {}

	if var_1_5:IsOverflowShipExpItem() then
		table.insert(var_1_6, function(arg_2_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = arg_2_0,
				onNo = function()
					var_1_4:removeSubmittingTask(var_1_3)

					if var_1_1 then
						var_1_1(false)
					end
				end
			})
		end)
	end

	seriesAsync(var_1_6, function()
		local var_4_0 = false
		local var_4_1

		if var_1_5:isActivityTask() then
			var_4_1 = var_1_5:getActId()

			local var_4_2 = pg.activity_template[var_4_1].type

			if table.contains(TotalTaskProxy.normal_task_type, var_4_2) then
				var_4_0 = true
			end
		end

		if var_4_0 then
			pg.ConnectionMgr.GetInstance():Send(20207, {
				act_id = var_4_1,
				task_id = var_1_5.id,
				item_cost = var_1_5:getConfig("quick_finish")
			}, 20208, function(arg_5_0)
				QuickTaskCommand.OnQuickTaskComplete(arg_5_0, var_1_5, var_1_1)
			end)
		else
			pg.ConnectionMgr.GetInstance():Send(20013, {
				id = var_1_5.id,
				item_cost = var_1_5:getConfig("quick_finish")
			}, 20014, function(arg_6_0)
				QuickTaskCommand.OnQuickTaskComplete(arg_6_0, var_1_5, var_1_1)
			end)
		end
	end)
end

function var_0_0.OnQuickTaskComplete(arg_7_0, arg_7_1, arg_7_2)
	getProxy(TaskProxy):removeSubmittingTask(arg_7_1.id)

	if arg_7_0.result == 0 then
		local var_7_0 = Item.QUICK_TASK_PASS_TICKET_ID
		local var_7_1 = arg_7_1:getConfig("quick_finish")

		getProxy(BagProxy):removeItemById(tonumber(var_7_0), tonumber(var_7_1))
		QuickTaskCommand.AddGuildLivness(arg_7_1)

		local var_7_2 = PlayerConst.addTranDrop(arg_7_0.award_list, {
			taskId = arg_7_1.id
		})

		SubmitTaskCommand.OnSubmitSuccess(arg_7_1)
		pg.TipsMgr.GetInstance():ShowTips(i18n("battlepass_task_quickfinish3"))
		pg.m02:sendNotification(GAME.SUBMIT_TASK_DONE, var_7_2, {
			arg_7_1.id
		})

		local var_7_3 = getProxy(ActivityProxy)
		local var_7_4 = var_7_3:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR)

		if var_7_4 and not var_7_4:isEnd() then
			local var_7_5 = var_7_4:getConfig("config_data")[1] or {}

			if table.contains(var_7_5, arg_7_1.id) then
				var_7_3:monitorTaskList(var_7_4)
			end
		end

		if arg_7_2 then
			arg_7_2(true)
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", arg_7_0.result))

		if arg_7_2 then
			arg_7_2(false)
		end
	end
end

function var_0_0.AddGuildLivness(arg_8_0)
	if arg_8_0:IsGuildAddLivnessType() then
		local var_8_0 = getProxy(GuildProxy)
		local var_8_1 = var_8_0:getData()
		local var_8_2 = 0
		local var_8_3 = false

		if var_8_1 and arg_8_0:isGuildTask() then
			var_8_1:setWeeklyTaskFlag(1)

			local var_8_4 = var_8_1:getWeeklyTask()

			if var_8_4 then
				var_8_2 = var_8_4:GetLivenessAddition()
			end

			var_8_3 = true
		elseif arg_8_0:IsRoutineType() then
			var_8_2 = pg.guildset.new_daily_task_guild_active.key_value
		elseif arg_8_0:IsWeeklyType() then
			var_8_2 = pg.guildset.new_weekly_task_guild_active.key_value
		end

		if var_8_1 and var_8_2 and var_8_2 > 0 then
			var_8_1:getMemberById(getProxy(PlayerProxy):getRawData().id):AddLiveness(var_8_2)

			var_8_3 = true
		end

		if var_8_3 then
			var_8_0:updateGuild(var_8_1)
		end
	end
end

return var_0_0
