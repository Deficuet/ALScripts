local var_0_0 = class("LeMarsReSkinPage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.displayBtn = arg_1_0.bg:Find("display_btn")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.displayBtn, function()
		local var_3_0 = {}
		local var_3_1 = {}
		local var_3_2 = arg_2_0.taskGroup[arg_2_0.nday][1]
		local var_3_3 = arg_2_0.taskProxy:getTaskById(var_3_2) or arg_2_0.taskProxy:getFinishTaskById(var_3_2)
		local var_3_4 = var_3_3:getProgress()
		local var_3_5 = arg_2_0.nday

		for iter_3_0, iter_3_1 in ipairs(arg_2_0.activity:getConfig("config_data")) do
			for iter_3_2, iter_3_3 in ipairs(iter_3_1) do
				local var_3_6 = pg.task_data_template[iter_3_3]

				if var_3_6 and var_3_6.award_display and var_3_6.award_display[1] then
					table.insert(var_3_0, var_3_6.award_display[1])
					table.insert(var_3_1, var_3_6.target_num)
				end
			end
		end

		if var_3_3:getTaskStatus() ~= 2 then
			var_3_5 = var_3_5 - 1
		end

		arg_2_0:emit(ActivityMediator.ON_AWARD_WINDOW, var_3_0, var_3_5, {
			i18n("LeMarsReSkinPage_reward_target"),
			i18n("LeMarsReSkinPage_reward_title")
		}, {
			targetList = var_3_1,
			nowGet = var_3_4
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateTask(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1 + 1
	local var_4_1 = arg_4_2:Find("award")
	local var_4_2 = arg_4_0.taskGroup[arg_4_0.nday][1]
	local var_4_3 = arg_4_0.taskProxy:getTaskById(var_4_2) or arg_4_0.taskProxy:getFinishTaskById(var_4_2)

	assert(var_4_3, "without this task by id: " .. var_4_2)

	local var_4_4 = Drop.Create(var_4_3:getConfig("award_display")[1])

	updateDrop(var_4_1, var_4_4)
	onButton(arg_4_0, var_4_1, function()
		arg_4_0:emit(BaseUI.ON_DROP, var_4_4)
	end, SFX_PANEL)

	local var_4_5 = var_4_3:getProgress()
	local var_4_6 = var_4_3:getConfig("target_num")

	setScrollText(arg_4_2:Find("mask/description"), var_4_3:getConfig("desc"))

	local var_4_7, var_4_8 = arg_4_0:GetProgressColor()
	local var_4_9

	var_4_9 = var_4_7 and setColorStr(var_4_5, var_4_7) or var_4_5

	local var_4_10

	var_4_10 = var_4_8 and setColorStr("/" .. var_4_6, var_4_8) or "/" .. var_4_6

	setText(arg_4_2:Find("progress"), var_4_9 .. var_4_10)
	setSlider(arg_4_2:Find("slider"), 0, var_4_6, var_4_5)

	local var_4_11 = arg_4_2:Find("go_btn")
	local var_4_12 = arg_4_2:Find("get_btn")
	local var_4_13 = arg_4_2:Find("got_btn")
	local var_4_14 = var_4_3:getTaskStatus()

	setActive(var_4_11, var_4_14 == 0)
	setActive(var_4_12, var_4_14 == 1)
	setActive(var_4_13, var_4_14 == 2)
	onButton(arg_4_0, var_4_11, function()
		arg_4_0:emit(ActivityMediator.ON_TASK_GO, var_4_3)
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_12, function()
		local var_7_0 = {}
		local var_7_1 = var_4_3:getConfig("award_display")
		local var_7_2 = getProxy(PlayerProxy):getRawData()
		local var_7_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_7_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_7_3)
		local var_7_5, var_7_6 = Task.StaticJudgeOverflow(var_7_2.gold, var_7_2.oil, var_7_4, true, true, var_7_1)

		if var_7_5 then
			table.insert(var_7_0, function(arg_8_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_7_6,
					onYes = arg_8_0
				})
			end)
		end

		seriesAsync(var_7_0, function()
			arg_4_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_4_3)
		end)
	end, SFX_PANEL)
end

function var_0_0.GetProgressColor(arg_10_0)
	return "#1EA2ACFF", "#3DCCD7"
end

return var_0_0
