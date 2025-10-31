local var_0_0 = class("MonopolyCar2024Page", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.startBtn = arg_1_0._tf:Find("AD/start")
	arg_1_0.leftCountTxt = arg_1_0.startBtn:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.turnCntTxt = arg_1_0._tf:Find("AD/turn"):GetComponent(typeof(Text))
	arg_1_0.progressTxt = arg_1_0._tf:Find("AD/progress"):GetComponent(typeof(Text))
	arg_1_0.turnAwards = {
		arg_1_0._tf:Find("AD/turn_awards/award_1"),
		arg_1_0._tf:Find("AD/turn_awards/award_2"),
		arg_1_0._tf:Find("AD/turn_awards/award_3")
	}
	arg_1_0.turnGoBtn = arg_1_0._tf:Find("AD/turn_awards/battle_btn")
	arg_1_0.turnGetBtn = arg_1_0._tf:Find("AD/turn_awards/get_btn")
	arg_1_0.progressImage = arg_1_0._tf:Find("AD/turn_awards/progress/bar")

	onButton(arg_1_0, arg_1_0.startBtn, function()
		if not arg_1_0.activity or arg_1_0.activity:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		for iter_2_0, iter_2_1 in ipairs(arg_1_0.turnAwards) do
			setActive(iter_2_1:Find("mark/get"), false)
		end

		arg_1_0:emit(ActivityMediator.GO_MONOPOLY2024, arg_1_0.activity.id, function()
			for iter_3_0, iter_3_1 in ipairs(arg_1_0.turnAwards) do
				setActive(iter_3_1:Find("mark/get"), true)
			end
		end)
	end, SFX_PANEL)

	arg_1_0.taskGoBtn = arg_1_0._tf:Find("AD/battle_btn")
	arg_1_0.taskGetBtn = arg_1_0._tf:Find("AD/get_btn")
	arg_1_0.taskGotBtn = arg_1_0._tf:Find("AD/got_btn")
	arg_1_0.taskDesc = arg_1_0._tf:Find("AD/Text"):GetComponent(typeof(Text))
	arg_1_0.taskAward = arg_1_0._tf:Find("AD/award")
	arg_1_0.taskProgress = arg_1_0._tf:Find("AD/taskProgress")
end

function var_0_0.OnDataSetting(arg_4_0)
	return
end

function var_0_0.OnFirstFlush(arg_5_0)
	return
end

function var_0_0.OnUpdateFlush(arg_6_0)
	arg_6_0:UpdateTurnAwards()
	arg_6_0:UpdateTask()
end

function var_0_0.UpdateTurnAwards(arg_7_0)
	local var_7_0 = arg_7_0.activity
	local var_7_1 = 3
	local var_7_2 = (var_7_0.data1_list[3] or 1) - 1
	local var_7_3 = var_7_0.data1_list[6] or 0

	arg_7_0.turnCntTxt.text = var_7_2 .. "/" .. var_7_1

	local var_7_4 = (math.max(var_7_0.data2, 1) - 1) / #(var_7_0:getDataConfig("map") or {})

	if var_7_4 == 0 and var_7_2 > 0 then
		var_7_4 = 1
	end

	arg_7_0.progressTxt.text = string.format("%.1f", var_7_4 * 100) .. "%"

	local var_7_5 = var_7_3 + 1
	local var_7_6 = var_7_0:getDataConfig("sum_lap_reward_show")

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.turnAwards) do
		local var_7_7 = var_7_6[iter_7_0]
		local var_7_8 = Drop.New({
			type = var_7_7[1],
			id = var_7_7[2],
			count = var_7_7[3]
		})

		updateDrop(iter_7_1:Find("mask"), var_7_8)
		onButton(arg_7_0, iter_7_1, function()
			arg_7_0:emit(BaseUI.ON_DROP, var_7_8)
		end, SFX_PANEL)
		setActive(iter_7_1:Find("mark"), iter_7_0 == var_7_5)
		setActive(iter_7_1:Find("got"), iter_7_0 <= var_7_3)
	end

	local var_7_9 = var_7_1 < var_7_5
	local var_7_10 = var_7_5 <= var_7_2

	setActive(arg_7_0.turnGoBtn, not var_7_10 and not var_7_9)
	setActive(arg_7_0.turnGetBtn, var_7_10 and not var_7_9)

	local var_7_11 = {
		0.183,
		0.587,
		1
	}

	if var_7_2 <= 0 then
		setFillAmount(arg_7_0.progressImage, 0)
	else
		setFillAmount(arg_7_0.progressImage, var_7_11[var_7_2] or 1)
	end

	local var_7_12 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_7_13 = var_7_0.data1
	local var_7_14 = math.ceil((var_7_12 - var_7_13) / 86400) * var_7_0:getDataConfig("daily_time") + (var_7_0.data1_list[1] or 0) - (var_7_0.data1_list[2] or 0)

	arg_7_0.leftCountTxt.text = i18n("MonopolyCar2024Game_total_num_tip", var_7_14)

	onButton(arg_7_0, arg_7_0.turnGetBtn, function()
		pg.m02:sendNotification(GAME.MONOPOLY_OP, {
			activity_id = var_7_0.id,
			arg1 = var_7_5,
			cmd = ActivityConst.MONOPOLY_OP_ROUND_AWD
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateTask(arg_10_0)
	local var_10_0 = pg.activity_const.MONOPOLY_TASK_ACT_ID.act_id
	local var_10_1 = getProxy(ActivityProxy):getActivityById(var_10_0)

	if not var_10_1 or var_10_1:isEnd() then
		return
	end

	local var_10_2 = var_10_1:getConfig("config_data")[1]
	local var_10_3 = getProxy(TaskProxy)
	local var_10_4 = var_10_3:getTaskById(var_10_2) or var_10_3:getFinishTaskById(var_10_2) or Task.New({
		id = var_10_2
	})
	local var_10_5 = var_10_3:getTaskById(var_10_2)
	local var_10_6 = var_10_4:getConfig("award_display")[1]
	local var_10_7 = Drop.New({
		type = var_10_6[1],
		id = var_10_6[2],
		count = var_10_6[3]
	})

	updateDrop(arg_10_0.taskAward:Find("mask"), var_10_7)
	onButton(arg_10_0, arg_10_0.taskAward, function()
		arg_10_0:emit(BaseUI.ON_DROP, var_10_7)
	end, SFX_PANEL)

	local var_10_8 = var_10_4:getConfig("target_num")

	if var_10_5 ~= nil then
		local var_10_9 = math.min(var_10_4:getProgress(), var_10_8)

		setSlider(arg_10_0.taskProgress, 0, var_10_8, var_10_9)

		local var_10_10 = var_10_4:getConfig("desc")

		for iter_10_0, iter_10_1 in ipairs({
			var_10_9
		}) do
			var_10_10 = string.gsub(var_10_10, "$" .. iter_10_0, iter_10_1)
		end

		arg_10_0.taskDesc.text = var_10_10

		local var_10_11 = var_10_4:isFinish()
		local var_10_12 = var_10_4:isReceive()

		setActive(arg_10_0.taskGoBtn, not var_10_11 and not var_10_12)
		setActive(arg_10_0.taskGetBtn, var_10_11 and not var_10_12)
		setActive(arg_10_0.taskGotBtn, var_10_12)
	else
		local var_10_13 = var_10_8

		setSlider(arg_10_0.taskProgress, 0, var_10_8, var_10_13)

		local var_10_14 = var_10_4:getConfig("desc")

		for iter_10_2, iter_10_3 in ipairs({
			var_10_13
		}) do
			var_10_14 = string.gsub(var_10_14, "$" .. iter_10_2, iter_10_3)
		end

		arg_10_0.taskDesc.text = var_10_14

		setActive(arg_10_0.taskGoBtn, false)
		setActive(arg_10_0.taskGetBtn, false)
		setActive(arg_10_0.taskGotBtn, true)
	end

	onButton(arg_10_0, arg_10_0.taskGetBtn, function()
		arg_10_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_10_4, function(arg_13_0)
			if arg_13_0 then
				arg_10_0:OnUpdateFlush()
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.OnHideFlush(arg_14_0)
	return
end

function var_0_0.OnDestroy(arg_15_0)
	return
end

return var_0_0
