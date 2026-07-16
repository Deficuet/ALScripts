local var_0_0 = class("SubmitTaskOneStepCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = var_1_0.dontSendMsg
	local var_1_3 = var_1_0.resultList
	local var_1_4 = {}
	local var_1_5 = {}
	local var_1_6 = getProxy(TaskProxy)

	for iter_1_0, iter_1_1 in ipairs(var_1_3) do
		local var_1_7 = iter_1_1.id
		local var_1_8 = {}

		if iter_1_1.choiceItemList then
			for iter_1_2, iter_1_3 in ipairs(iter_1_1.choiceItemList) do
				table.insert(var_1_8, iter_1_3)
			end
		end

		local var_1_9 = var_1_6:getTaskById(var_1_7)

		if not var_1_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("task_is_not_existence", var_1_7))

			return
		end

		if not var_1_9:isFinish() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("task_submitTask_error_notFinish"))

			return
		end

		table.insert(var_1_4, var_1_7)
	end

	pg.ConnectionMgr.GetInstance():Send(20011, {
		id_list = var_1_4
	}, 20012, function(arg_2_0)
		local var_2_0 = arg_2_0.id_list

		for iter_2_0, iter_2_1 in ipairs(var_2_0) do
			local var_2_1 = var_1_6:getTaskById(iter_2_1)

			if var_2_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
				local var_2_2 = tonumber(var_2_1:getConfig("target_id"))
				local var_2_3 = var_2_1:getConfig("target_num")

				getProxy(BagProxy):removeItemById(tonumber(var_2_2), tonumber(var_2_3))
			elseif var_2_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
				local var_2_4 = tonumber(var_2_1:getConfig("target_id"))
				local var_2_5 = var_2_1:getConfig("target_num")

				getProxy(ActivityProxy):removeVitemById(var_2_4, var_2_5)
			elseif var_2_1:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
				local var_2_6 = tonumber(var_2_1:getConfig("target_id"))
				local var_2_7 = var_2_1:getConfig("target_num")
				local var_2_8 = getProxy(PlayerProxy)
				local var_2_9 = var_2_8:getData()

				var_2_9:consume({
					[id2res(var_2_6)] = var_2_7
				})
				var_2_8:updatePlayer(var_2_9)
			end

			SubmitTaskCommand.AddGuildLivness(var_2_1)
			SubmitTaskCommand.CheckTaskType(var_2_1)

			local var_2_10 = getProxy(ActivityProxy)
			local var_2_11 = var_2_10:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR)

			if var_2_11 and not var_2_11:isEnd() then
				local var_2_12 = var_2_11:getConfig("config_data")[1] or {}

				if table.contains(var_2_12, var_2_1.id) then
					var_2_10:monitorTaskList(var_2_11)
				end
			end
		end

		var_1_5 = PlayerConst.addTranDrop(arg_2_0.award_list)

		if not var_1_2 then
			arg_1_0:sendNotification(GAME.SUBMIT_TASK_DONE, var_1_5, _.map(var_1_3, function(arg_3_0)
				return arg_3_0.id
			end))
		end

		if var_1_1 then
			var_1_1(var_1_5)
		end
	end)
end

return var_0_0
