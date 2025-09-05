local var_0_0 = class("SubmitActiveTaskCommand", pm.SimpleCommand)
local var_0_1 = {
	59599
}

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody() or {}
	local var_1_1 = var_1_0.callback
	local var_1_2 = pg.activity_template[var_1_0.act_id].type
	local var_1_3 = {}

	if table.contains(TotalTaskProxy.avatar_task_type, var_1_2) then
		-- block empty
	elseif table.contains(TotalTaskProxy.activity_task_type, var_1_2) then
		for iter_1_0, iter_1_1 in ipairs(var_1_0.task_ids) do
			local var_1_4 = getProxy(ActivityTaskProxy):getTaskVo(var_1_0.act_id, iter_1_1)

			if var_1_4 then
				table.insert(var_1_3, var_1_4)
			end
		end
	elseif table.contains(TotalTaskProxy.normal_task_type, var_1_2) then
		for iter_1_2, iter_1_3 in ipairs(var_1_0.task_ids) do
			local var_1_5 = getProxy(TaskProxy):getTaskById(iter_1_3)

			if getProxy(TaskProxy):isSubmitting(iter_1_3) then
				-- block empty
			else
				getProxy(TaskProxy):addSubmittingTask(iter_1_3)
				table.insert(var_1_3, var_1_5)
			end
		end
	end

	if not arg_1_0:InTaskScene() then
		local var_1_6, var_1_7 = arg_1_0:filterOverflowTaskVOList(var_1_3)

		if var_1_7 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = function()
					arg_1_0:submitActivity(var_1_0, var_1_3, var_1_2, var_1_1)
				end,
				onNo = function()
					if var_1_1 then
						var_1_1(false)
					end
				end
			})

			return
		end
	end

	arg_1_0:submitActivity(var_1_0, var_1_3, var_1_2, var_1_1)
end

function var_0_0.submitActivity(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	pg.ConnectionMgr.GetInstance():Send(20205, {
		act_id = arg_4_1.act_id,
		task_ids = arg_4_1.task_ids
	}, 20206, function(arg_5_0)
		if arg_5_0.result == 0 then
			local var_5_0 = {}

			if table.contains(TotalTaskProxy.avatar_task_type, arg_4_3) then
				local var_5_1 = pg.activity_template[arg_4_1.act_id].config_id
				local var_5_2 = pg.activity_event_avatarframe[var_5_1]
				local var_5_3 = Clone(var_5_2.award_display)[1]
				local var_5_4 = 0

				for iter_5_0, iter_5_1 in ipairs(arg_4_1.task_ids) do
					var_5_4 = var_5_4 + arg_4_0:getAwardNum(var_5_2, iter_5_1)
				end

				local var_5_5 = getProxy(ActivityProxy):RawGetActivityById(arg_4_1.act_id)

				if var_5_5 then
					var_5_5.data1 = var_5_5.data1 + var_5_4
				end

				var_5_3[3] = var_5_4

				local var_5_6 = Drop.Create(var_5_3)

				table.insert(var_5_0, var_5_6)
				arg_4_0:sendNotification(GAME.SUBMIT_AVATAR_TASK_DONE, {
					awards = var_5_0
				})
			elseif table.contains(TotalTaskProxy.activity_task_type, arg_4_3) then
				var_5_0 = PlayerConst.addTranDrop(arg_5_0.award_list, {})

				for iter_5_2, iter_5_3 in ipairs(arg_4_2) do
					arg_4_0:updateTaskActivityData(iter_5_3.id, arg_4_1.act_id)
					arg_4_0:updateTaskBagData(iter_5_3.id, arg_4_1.act_id)
					SubmitTaskCommand.OnSubmitSuccess(iter_5_3)
				end

				arg_4_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK_DONE, {
					awards = var_5_0
				}, arg_4_1.task_ids)
			elseif table.contains(TotalTaskProxy.normal_task_type, arg_4_3) then
				var_5_0 = PlayerConst.addTranDrop(arg_5_0.award_list, {})

				for iter_5_4 = #var_5_0, 1, -1 do
					if table.contains(var_0_1, var_5_0[iter_5_4].id) then
						table.remove(var_5_0, iter_5_4)
					end
				end

				for iter_5_5, iter_5_6 in ipairs(arg_4_2) do
					arg_4_0:updateTaskBagData(iter_5_6.id, arg_4_1.act_id)
					SubmitTaskCommand.OnSubmitSuccess(iter_5_6)
					getProxy(TaskProxy):removeSubmittingTask(iter_5_6.id)
				end

				arg_4_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK_DONE, {
					awards = var_5_0
				}, arg_4_1.task_ids)
			end

			arg_4_0:sendNotification(GAME.SUBMIT_TASK_AWARD_DOWN, {
				awards = var_5_0
			}, arg_4_1.task_ids)

			if arg_4_4 then
				arg_4_4(true)
			end
		else
			if arg_4_4 then
				arg_4_4(false)
			end

			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_5_0.result))
		end
	end)
end

function var_0_0.updateTaskActivityData(arg_6_0, arg_6_1, arg_6_2)
	if getProxy(ActivityProxy):getActivityById(arg_6_2) then
		getProxy(ActivityTaskProxy):finishActTask(arg_6_2, arg_6_1)
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

function var_0_0.updateTaskBagData(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = pg.task_data_template[arg_7_1]
	local var_7_1 = tonumber(var_7_0.target_id)
	local var_7_2 = var_7_0.type
	local var_7_3 = var_7_0.sub_type

	if pg.activity_drop_type[var_7_1] then
		for iter_7_0, iter_7_1 in ipairs(var_0_2) do
			if var_7_2 == iter_7_1[1] and var_7_3 == iter_7_1[2] then
				local var_7_4 = tonumber(var_7_0.target_id_2)
				local var_7_5 = var_7_0.target_num
				local var_7_6 = pg.activity_drop_type[var_7_1].activity_id
				local var_7_7 = getProxy(ActivityProxy):getActivityById(var_7_6)

				if var_7_7 then
					var_7_7:subVitemNumber(var_7_4, var_7_5)
					getProxy(ActivityProxy):updateActivity(var_7_7)
				end
			end
		end

		for iter_7_2, iter_7_3 in ipairs(var_0_3) do
			if var_7_2 == iter_7_3[1] and var_7_3 == iter_7_3[2] then
				local var_7_8 = pg.activity_drop_type[var_7_1].activity_id
				local var_7_9 = getProxy(ActivityProxy):getActivityById(var_7_8)

				if var_7_9 then
					local var_7_10 = var_7_0.target_id_2

					for iter_7_4, iter_7_5 in ipairs(var_7_10) do
						local var_7_11 = iter_7_5[1]
						local var_7_12 = iter_7_5[2]

						var_7_9:subVitemNumber(var_7_11, var_7_12)
					end

					getProxy(ActivityProxy):updateActivity(var_7_9)
				end
			end
		end
	end
end

function var_0_0.filterOverflowTaskVOList(arg_8_0, arg_8_1)
	local var_8_0 = {}
	local var_8_1 = getProxy(PlayerProxy):getData()
	local var_8_2 = pg.gameset.urpt_chapter_max.description[1]
	local var_8_3 = var_8_1.gold
	local var_8_4 = var_8_1.oil
	local var_8_5 = not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_8_2) or 0
	local var_8_6 = pg.gameset.max_gold.key_value
	local var_8_7 = pg.gameset.max_oil.key_value

	if LOCK_UR_SHIP or not pg.gameset.urpt_chapter_max.description[2] then
		local var_8_8 = 0
	end

	local var_8_9 = false

	for iter_8_0, iter_8_1 in pairs(arg_8_1) do
		local var_8_10 = iter_8_1:judgeOverflow(var_8_3, var_8_4, var_8_5)

		if not var_8_10 then
			table.insert(var_8_0, iter_8_1)
		end

		if var_8_10 then
			var_8_9 = true
		end
	end

	return var_8_0, var_8_9
end

function var_0_0.getAwardNum(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0 = 1, #AvatarFrameTask.fillter_task_type do
		local var_9_0 = AvatarFrameTask.fillter_task_type[iter_9_0]
		local var_9_1 = arg_9_1[var_9_0]

		for iter_9_1, iter_9_2 in ipairs(var_9_1) do
			if arg_9_2 == iter_9_2[1] then
				if var_9_0 == AvatarFrameTask.type_task_level then
					return iter_9_2[6]
				elseif var_9_0 == AvatarFrameTask.type_task_ship then
					return iter_9_2[4]
				end
			end
		end
	end

	print("找不到taskId:" .. arg_9_2)

	return 0
end

function var_0_0.InTaskScene(arg_10_0)
	return getProxy(ContextProxy):getCurrentContext().mediator == TaskMediator
end

return var_0_0
