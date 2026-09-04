local var_0_0 = class("ShadowCityOmenTaskWindow", import("view.activity.CorePage.OutPost.OutPostOmenTaskWindow"))

function var_0_0.getUIName(arg_1_0)
	return "ShadowCityOmenTaskWindow"
end

function var_0_0.UpdateListItem(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = findTF(arg_2_2, "default")
	local var_2_1 = findTF(var_2_0, "day")
	local var_2_2 = findTF(var_2_0, "tasks")
	local var_2_3 = findTF(arg_2_2, "lock")
	local var_2_4 = findTF(var_2_3, "desc")
	local var_2_5 = findTF(var_2_3, "lockItem_1/desc")
	local var_2_6 = findTF(var_2_3, "lockItem_2/desc")
	local var_2_7 = arg_2_1 + 1

	setText(var_2_1, "DAY " .. var_2_7)

	for iter_2_0 = 0, var_2_2.childCount - 1 do
		local var_2_8 = var_2_2:GetChild(iter_2_0)

		arg_2_0:UpdateTaskItem(var_2_7, iter_2_0, var_2_8)
	end

	local var_2_9 = arg_2_0:isTaskLock(var_2_7)
	local var_2_10 = var_2_9 ~= 0

	setActive(var_2_3, var_2_10)

	GetOrAddComponent(var_2_0, typeof(CanvasGroup)).alpha = var_2_10 and 0.5 or 1

	switch(var_2_9, {
		function()
			local var_3_0, var_3_1 = arg_2_0:getDate(arg_2_0.month, arg_2_0.day + var_2_7 - arg_2_0.nday)

			setText(var_2_4, i18n("OutPostOmenPage_task_tip1", var_3_0, var_3_1))
			setText(var_2_5, i18n("OutPostOmenPage_task_tip1", var_3_0, var_3_1))
			setText(var_2_6, i18n("OutPostOmenPage_task_tip1", var_3_0, var_3_1))
		end,
		function()
			setText(var_2_4, i18n("OutPostOmenPage_task_tip2"))
			setText(var_2_5, i18n("OutPostOmenPage_task_tip2"))
			setText(var_2_6, i18n("OutPostOmenPage_task_tip2"))
		end
	})
end

function var_0_0.UpdateTaskItem(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_2 + 1
	local var_5_1 = arg_5_3:Find("item")
	local var_5_2 = arg_5_0.taskGroup[arg_5_1][var_5_0]
	local var_5_3 = arg_5_0.taskProxy:getTaskById(var_5_2) or arg_5_0.taskProxy:getFinishTaskById(var_5_2)
	local var_5_4 = pg.task_data_template[var_5_2]
	local var_5_5 = Drop.Create(var_5_4.award_display[1])

	updateDrop(var_5_1, var_5_5)
	onButton(arg_5_0, var_5_1, function()
		arg_5_0:emit(BaseUI.ON_DROP, var_5_5)
	end, SFX_PANEL)

	local var_5_6 = var_5_3 and var_5_3:getProgress() or 0
	local var_5_7 = var_5_4.target_num

	setText(arg_5_3:Find("description"), var_5_4.desc)
	setSlider(arg_5_3:Find("progress"), 0, var_5_7, var_5_6)

	local var_5_8, var_5_9 = var_0_0:GetProgressColor()

	var_5_6 = var_5_8 and setColorStr(var_5_6, var_5_8) or var_5_6
	var_5_7 = var_5_9 and setColorStr(var_5_7, var_5_9) or var_5_7

	setText(arg_5_3:Find("progressText"), var_5_6 .. "/" .. var_5_7)

	local var_5_10 = arg_5_3:Find("got_btn")
	local var_5_11 = var_5_3 and var_5_3:getTaskStatus() or 0

	setActive(var_5_10, var_5_11 == 2)
end

function var_0_0.GetProgressColor(arg_7_0)
	return "#25A1FF", "#393A3C"
end

return var_0_0
