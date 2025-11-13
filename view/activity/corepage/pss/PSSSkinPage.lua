local var_0_0 = class("PSSSkinPage", import("view.activity.CorePage.CoreLoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)
end

function var_0_0.UpdateTask(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1 + 1
	local var_2_1 = arg_2_2:Find("item")
	local var_2_2 = arg_2_0.taskGroup[arg_2_0.nday][var_2_0]
	local var_2_3 = arg_2_0.taskProxy:getTaskById(var_2_2) or arg_2_0.taskProxy:getFinishTaskById(var_2_2)

	assert(var_2_3, "without this task by id: " .. var_2_2)

	local var_2_4 = Drop.Create(var_2_3:getConfig("award_display")[1])

	updateDrop(var_2_1, var_2_4)
	onButton(arg_2_0, var_2_1, function()
		arg_2_0:emit(BaseUI.ON_DROP, var_2_4)
	end, SFX_PANEL)

	local var_2_5 = var_2_3:getProgress()
	local var_2_6 = var_2_3:getConfig("target_num")

	setText(arg_2_2:Find("description"), var_2_3:getConfig("desc"))
	setText(arg_2_2:Find("progressText"), var_2_5)
	setText(arg_2_2:Find("progressText_1"), "/" .. var_2_6)
	setSlider(arg_2_2:Find("progress"), 0, var_2_6, var_2_5)

	local var_2_7 = arg_2_2:Find("go_btn")
	local var_2_8 = arg_2_2:Find("get_btn")
	local var_2_9 = arg_2_2:Find("got_btn")

	setText(arg_2_2:Find("go_btn/Text"), i18n("island_word_go"))
	setText(arg_2_2:Find("get_btn/Text"), i18n("handbook_research_final_task_btn_claim"))
	setText(arg_2_2:Find("got_btn/Text"), i18n("handbook_research_final_task_btn_finished"))

	local var_2_10 = var_2_3:getTaskStatus()

	setActive(var_2_7, var_2_10 == 0)
	setActive(var_2_8, var_2_10 == 1)
	setActive(var_2_9, var_2_10 == 2)
	onButton(arg_2_0, var_2_7, function()
		arg_2_0:emit(ActivityMediator.ON_TASK_GO, var_2_3)
	end, SFX_PANEL)
	onButton(arg_2_0, var_2_8, function()
		local var_5_0 = {}
		local var_5_1 = var_2_3:getConfig("award_display")
		local var_5_2 = getProxy(PlayerProxy):getRawData()
		local var_5_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_5_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_5_3)
		local var_5_5, var_5_6 = Task.StaticJudgeOverflow(var_5_2.gold, var_5_2.oil, var_5_4, true, true, var_5_1)

		if var_5_5 then
			table.insert(var_5_0, function(arg_6_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_5_6,
					onYes = arg_6_0
				})
			end)
		end

		seriesAsync(var_5_0, function()
			arg_2_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_2_3)
		end)
	end, SFX_PANEL)
end

return var_0_0
