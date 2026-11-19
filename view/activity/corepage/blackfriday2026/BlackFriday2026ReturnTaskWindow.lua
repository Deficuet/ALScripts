local var_0_0 = class("BlackFriday2026ReturnTaskWindow", import("view.activity.CorePage.OutPost.OutPostOmenTaskWindow"))

function var_0_0.getUIName(arg_1_0)
	return "BlackFriday2026ReturnTaskWindow"
end

function var_0_0.UpdateListItem(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = findTF(arg_2_2, "default")
	local var_2_1 = findTF(var_2_0, "day/dayimage")
	local var_2_2 = findTF(var_2_0, "tasks")
	local var_2_3 = findTF(var_2_2, "item_1")
	local var_2_4 = findTF(arg_2_2, "lock")
	local var_2_5 = findTF(var_2_4, "desc")
	local var_2_6 = arg_2_1 + 1

	LoadImageSpriteAtlasAsync("ui/blackfriday2026returnpage_atlas", "day_" .. var_2_6, var_2_1, true)
	arg_2_0:UpdateTaskItem(var_2_6, var_2_3)

	local var_2_7 = arg_2_0:isTaskLock(var_2_6)
	local var_2_8 = var_2_7 ~= 0

	setActive(var_2_4, var_2_8)

	GetOrAddComponent(var_2_0, typeof(CanvasGroup)).alpha = var_2_8 and 0.5 or 1

	switch(var_2_7, {
		function()
			local var_3_0, var_3_1 = arg_2_0:getDate(arg_2_0.month, arg_2_0.day + var_2_6 - arg_2_0.nday)

			setText(var_2_5, i18n("OutPostOmenPage_task_tip1", var_3_0, var_3_1))
		end,
		function()
			setText(var_2_5, i18n("OutPostOmenPage_task_tip2"))
		end
	})
end

function var_0_0.UpdateTaskItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_2:Find("item")
	local var_5_1 = arg_5_0.taskGroup[arg_5_1][1]
	local var_5_2 = arg_5_0.taskProxy:getTaskById(var_5_1) or arg_5_0.taskProxy:getFinishTaskById(var_5_1)
	local var_5_3 = pg.task_data_template[var_5_1]
	local var_5_4 = Drop.Create(var_5_3.award_display[1])

	updateDrop(var_5_0, var_5_4)
	onButton(arg_5_0, var_5_0, function()
		arg_5_0:emit(BaseUI.ON_DROP, var_5_4)
	end, SFX_PANEL)

	local var_5_5 = var_5_2 and var_5_2:getProgress() or 0
	local var_5_6 = var_5_3.target_num

	setText(arg_5_2:Find("mask/description"), var_5_3.desc)
	setSlider(arg_5_2:Find("progress"), 0, var_5_6, var_5_5)
	setText(arg_5_2:Find("progressText"), var_5_5 .. "/" .. var_5_6)
	setActive(arg_5_2:Find("got"), var_5_2 and var_5_2:getTaskStatus() == 2 or false)
end

return var_0_0
