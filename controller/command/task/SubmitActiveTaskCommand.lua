local var_0_0 = class("SubmitActiveTaskCommand", pm.SimpleCommand)
local var_0_1 = {
	59599
}

function var_0_0.GetSubmitActivityTaskDone(arg_1_0)
	return GAME.SUBMIT_ACTIVITY_TASK_DONE
end

function var_0_0.GetSubMitActivityAwardDown(arg_2_0)
	return GAME.SUBMIT_TASK_AWARD_DOWN
end

function var_0_0.execute(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1:getBody() or {}
	local var_3_1 = var_3_0.callback
	local var_3_2 = pg.activity_template[var_3_0.act_id].type
	local var_3_3 = {}

	if table.contains(TotalTaskProxy.avatar_task_type, var_3_2) then
		-- block empty
	elseif table.contains(TotalTaskProxy.activity_task_type, var_3_2) then
		for iter_3_0, iter_3_1 in ipairs(var_3_0.task_ids) do
			local var_3_4 = getProxy(ActivityTaskProxy):getTaskVo(var_3_0.act_id, iter_3_1)

			if var_3_4 then
				table.insert(var_3_3, var_3_4)
			end
		end
	elseif table.contains(TotalTaskProxy.normal_task_type, var_3_2) then
		for iter_3_2, iter_3_3 in ipairs(var_3_0.task_ids) do
			local var_3_5 = getProxy(TaskProxy):getTaskById(iter_3_3)

			if getProxy(TaskProxy):isSubmitting(iter_3_3) then
				-- block empty
			else
				getProxy(TaskProxy):addSubmittingTask(iter_3_3)
				table.insert(var_3_3, var_3_5)
			end
		end
	end

	if not arg_3_0:InTaskScene() then
		local var_3_6, var_3_7 = arg_3_0:filterOverflowTaskVOList(var_3_3)

		if var_3_7 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = function()
					arg_3_0:submitActivity(var_3_0, var_3_3, var_3_2, var_3_1)
				end,
				onNo = function()
					if var_3_1 then
						var_3_1(false)
					end
				end
			})

			return
		end
	end

	arg_3_0:submitActivity(var_3_0, var_3_3, var_3_2, var_3_1)
end

function var_0_0.submitActivity(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	pg.ConnectionMgr.GetInstance():Send(20205, {
		act_id = arg_6_1.act_id,
		task_ids = arg_6_1.task_ids
	}, 20206, function(arg_7_0)
		if arg_7_0.result == 0 then
			local var_7_0 = {}

			if table.contains(TotalTaskProxy.avatar_task_type, arg_6_3) then
				local var_7_1 = pg.activity_template[arg_6_1.act_id].config_id
				local var_7_2 = pg.activity_event_avatarframe[var_7_1]
				local var_7_3 = Clone(var_7_2.award_display)[1]
				local var_7_4 = 0

				for iter_7_0, iter_7_1 in ipairs(arg_6_1.task_ids) do
					var_7_4 = var_7_4 + arg_6_0:getAwardNum(var_7_2, iter_7_1)
				end

				local var_7_5 = getProxy(ActivityProxy):RawGetActivityById(arg_6_1.act_id)

				if var_7_5 then
					var_7_5.data1 = var_7_5.data1 + var_7_4
				end

				var_7_3[3] = var_7_4

				local var_7_6 = Drop.Create(var_7_3)

				table.insert(var_7_0, var_7_6)
				arg_6_0:sendNotification(GAME.SUBMIT_AVATAR_TASK_DONE, {
					awards = var_7_0
				})
			elseif table.contains(TotalTaskProxy.activity_task_type, arg_6_3) then
				var_7_0 = PlayerConst.addTranDrop(arg_7_0.award_list, {})

				for iter_7_2, iter_7_3 in ipairs(arg_6_2) do
					arg_6_0:updateTaskActivityData(iter_7_3.id, arg_6_1.act_id)
					arg_6_0:updateTaskBagData(iter_7_3.id, arg_6_1.act_id)
					SubmitTaskCommand.OnSubmitSuccess(iter_7_3)
				end

				arg_6_0:sendNotification(arg_6_0:GetSubmitActivityTaskDone(), {
					awards = var_7_0
				}, arg_6_1.task_ids)
			elseif table.contains(TotalTaskProxy.normal_task_type, arg_6_3) then
				var_7_0 = PlayerConst.addTranDrop(arg_7_0.award_list, {})

				for iter_7_4 = #var_7_0, 1, -1 do
					if table.contains(var_0_1, var_7_0[iter_7_4].id) then
						table.remove(var_7_0, iter_7_4)
					end
				end

				for iter_7_5, iter_7_6 in ipairs(arg_6_2) do
					arg_6_0:updateTaskBagData(iter_7_6.id, arg_6_1.act_id)
					SubmitTaskCommand.OnSubmitSuccess(iter_7_6)
					getProxy(TaskProxy):removeSubmittingTask(iter_7_6.id)
				end

				arg_6_0:sendNotification(arg_6_0:GetSubmitActivityTaskDone(), {
					awards = var_7_0
				}, arg_6_1.task_ids)
			end

			arg_6_0:sendNotification(arg_6_0:GetSubMitActivityAwardDown(), {
				awards = var_7_0
			}, arg_6_1.task_ids)

			if arg_6_4 then
				arg_6_4(true)
			end
		else
			if arg_6_4 then
				arg_6_4(false)
			end

			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_7_0.result))
		end
	end)
end

function var_0_0.updateTaskActivityData(arg_8_0, arg_8_1, arg_8_2)
	if getProxy(ActivityProxy):getActivityById(arg_8_2) then
		getProxy(ActivityTaskProxy):finishActTask(arg_8_2, arg_8_1)
	end
end

local var_0_2 = {
	{
		6,
		1006
	},
	{
		16,
		1006
	}
}
local var_0_3 = {
	{
		6,
		1007
	},
	{
		16,
		1007
	}
}

function var_0_0.updateTaskBagData(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = pg.task_data_template[arg_9_1]
	local var_9_1 = tonumber(var_9_0.target_id)
	local var_9_2 = var_9_0.type
	local var_9_3 = var_9_0.sub_type

	if pg.activity_drop_type[var_9_1] then
		for iter_9_0, iter_9_1 in ipairs(var_0_2) do
			if var_9_2 == iter_9_1[1] and var_9_3 == iter_9_1[2] then
				local var_9_4 = tonumber(var_9_0.target_id_2)
				local var_9_5 = var_9_0.target_num
				local var_9_6 = pg.activity_drop_type[var_9_1].activity_id
				local var_9_7 = getProxy(ActivityProxy):getActivityById(var_9_6)

				if var_9_7 then
					var_9_7:subVitemNumber(var_9_4, var_9_5)
					getProxy(ActivityProxy):updateActivity(var_9_7)
				end
			end
		end

		for iter_9_2, iter_9_3 in ipairs(var_0_3) do
			if var_9_2 == iter_9_3[1] and var_9_3 == iter_9_3[2] then
				local var_9_8 = pg.activity_drop_type[var_9_1].activity_id
				local var_9_9 = getProxy(ActivityProxy):getActivityById(var_9_8)

				if var_9_9 then
					local var_9_10 = var_9_0.target_id_2

					for iter_9_4, iter_9_5 in ipairs(var_9_10) do
						local var_9_11 = iter_9_5[1]
						local var_9_12 = iter_9_5[2]

						var_9_9:subVitemNumber(var_9_11, var_9_12)
					end

					getProxy(ActivityProxy):updateActivity(var_9_9)
				end
			end
		end
	end
end

function var_0_0.filterOverflowTaskVOList(arg_10_0, arg_10_1)
	local var_10_0 = {}
	local var_10_1 = getProxy(PlayerProxy):getData()
	local var_10_2 = pg.gameset.urpt_chapter_max.description[1]
	local var_10_3 = var_10_1.gold
	local var_10_4 = var_10_1.oil
	local var_10_5 = not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_10_2) or 0
	local var_10_6 = pg.gameset.max_gold.key_value
	local var_10_7 = pg.gameset.max_oil.key_value

	if LOCK_UR_SHIP or not pg.gameset.urpt_chapter_max.description[2] then
		local var_10_8 = 0
	end

	local var_10_9 = false

	for iter_10_0, iter_10_1 in pairs(arg_10_1) do
		local var_10_10 = iter_10_1:judgeOverflow(var_10_3, var_10_4, var_10_5)

		if not var_10_10 then
			table.insert(var_10_0, iter_10_1)
		end

		if var_10_10 then
			var_10_9 = true
		end
	end

	return var_10_0, var_10_9
end

function var_0_0.getAwardNum(arg_11_0, arg_11_1, arg_11_2)
	for iter_11_0 = 1, #AvatarFrameTask.fillter_task_type do
		local var_11_0 = AvatarFrameTask.fillter_task_type[iter_11_0]
		local var_11_1 = arg_11_1[var_11_0]

		for iter_11_1, iter_11_2 in ipairs(var_11_1) do
			if arg_11_2 == iter_11_2[1] then
				if var_11_0 == AvatarFrameTask.type_task_level then
					return iter_11_2[6]
				elseif var_11_0 == AvatarFrameTask.type_task_ship then
					return iter_11_2[4]
				end
			end
		end
	end

	print("找不到taskId:" .. arg_11_2)

	return 0
end

function var_0_0.InTaskScene(arg_12_0)
	return getProxy(ContextProxy):getCurrentContext().mediator == TaskMediator
end

return var_0_0
