local var_0_0 = class("OutPostOmenTaskWindow", import("view.base.BaseSubView"))

var_0_0.SKIP_TYPE_SCENE = 2
var_0_0.SKIP_TYPE_ACTIVITY = 3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
end

function var_0_0.getUIName(arg_2_0)
	return "OutPostOmenTaskWindow"
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.bg = arg_3_0._tf:Find("bg")
	arg_3_0.btnClose = arg_3_0._tf:Find("window/btnClose")

	onButton(arg_3_0, arg_3_0.btnClose, function()
		arg_3_0:Hide()
	end, SOUND_BACK)
	onButton(arg_3_0, arg_3_0.bg, function()
		arg_3_0:Hide()
	end, SOUND_BACK)
end

function var_0_0.OnInit(arg_6_0)
	arg_6_0.page = findTF(arg_6_0._tf, "window")
	arg_6_0.list = findTF(arg_6_0.page, "list/Viewport/Content")
	arg_6_0.list_tpl = findTF(arg_6_0.page, "list_tpl")
	arg_6_0.uilist = UIItemList.New(arg_6_0.list, arg_6_0.list_tpl)

	arg_6_0.uilist:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateListItem(arg_7_1, arg_7_2)
		end
	end)

	local var_6_0 = pg.TimeMgr.GetInstance():GetServerTime()

	arg_6_0.year, arg_6_0.month, arg_6_0.day = ChineseCalendar.GetCurrYearMonthDay(var_6_0)
end

function var_0_0.Show(arg_8_0, arg_8_1)
	var_0_0.super.Show(arg_8_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_8_0._tf, {
		staticBlur = true
	})

	arg_8_0.activity = arg_8_1
	arg_8_0.nday = arg_8_0.activity:getNDay()
	arg_8_0.taskProxy = getProxy(TaskProxy)
	arg_8_0.taskGroup = arg_8_0.activity:getConfig("config_client").unlock_task

	arg_8_0.uilist:align(#arg_8_0.taskGroup)
end

function var_0_0.UpdateListItem(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = findTF(arg_9_2, "default")
	local var_9_1 = findTF(var_9_0, "day")
	local var_9_2 = findTF(var_9_0, "tasks")
	local var_9_3 = findTF(arg_9_2, "lock")
	local var_9_4 = findTF(var_9_3, "desc")
	local var_9_5 = arg_9_1 + 1

	setText(var_9_1, "DAY " .. var_9_5)

	for iter_9_0 = 0, var_9_2.childCount - 1 do
		local var_9_6 = var_9_2:GetChild(iter_9_0)

		arg_9_0:UpdateTaskItem(var_9_5, iter_9_0, var_9_6)
	end

	local var_9_7 = arg_9_0:isTaskLock(var_9_5)
	local var_9_8 = var_9_7 ~= 0

	setActive(var_9_3, var_9_8)

	GetOrAddComponent(var_9_0, typeof(CanvasGroup)).alpha = var_9_8 and 0.5 or 1

	switch(var_9_7, {
		function()
			local var_10_0, var_10_1 = arg_9_0:getDate(arg_9_0.month, arg_9_0.day + var_9_5 - arg_9_0.nday)

			setText(var_9_4, i18n("OutPostOmenPage_task_tip1", var_10_0, var_10_1))
		end,
		function()
			setText(var_9_4, i18n("OutPostOmenPage_task_tip2"))
		end
	})
end

function var_0_0.GetProgressColor(arg_12_0)
	return nil
end

function var_0_0.UpdateTaskItem(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_2 + 1
	local var_13_1 = arg_13_3:Find("item")
	local var_13_2 = arg_13_0.taskGroup[arg_13_1][var_13_0]
	local var_13_3 = arg_13_0.taskProxy:getTaskById(var_13_2) or arg_13_0.taskProxy:getFinishTaskById(var_13_2)
	local var_13_4 = pg.task_data_template[var_13_2]
	local var_13_5 = Drop.Create(var_13_4.award_display[1])

	updateDrop(var_13_1, var_13_5)
	onButton(arg_13_0, var_13_1, function()
		arg_13_0:emit(BaseUI.ON_DROP, var_13_5)
	end, SFX_PANEL)

	local var_13_6 = var_13_3 and var_13_3:getProgress() or 0
	local var_13_7 = var_13_4.target_num

	setText(arg_13_3:Find("description"), var_13_4.desc)
	setSlider(arg_13_3:Find("progress"), 0, var_13_7, var_13_6)

	local var_13_8, var_13_9 = var_0_0:GetProgressColor()

	var_13_6 = var_13_8 and setColorStr(var_13_6, var_13_8) or var_13_6
	var_13_7 = var_13_9 and setColorStr(var_13_7, var_13_9) or var_13_7

	setText(arg_13_3:Find("progressText"), var_13_6 .. "/" .. var_13_7)
end

function var_0_0.getDate(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = pg.TimeMgr.GetInstance():CalcMonthDays(arg_15_0.year, arg_15_1)

	if var_15_0 < arg_15_2 then
		arg_15_2 = arg_15_2 - var_15_0
		arg_15_1 = arg_15_1 + 1

		if arg_15_1 > 12 then
			arg_15_1 = 1
			arg_15_0.year = arg_15_0.year + 1
		end
	end

	return arg_15_1, arg_15_2
end

function var_0_0.GetProgressColor(arg_16_0)
	return nil
end

function var_0_0.isTaskLock(arg_17_0, arg_17_1)
	if arg_17_1 > arg_17_0.nday then
		return 1
	end

	for iter_17_0 = 1, arg_17_1 - 1 do
		local var_17_0 = arg_17_0.taskGroup[iter_17_0]

		for iter_17_1, iter_17_2 in ipairs(var_17_0) do
			if (arg_17_0.taskProxy:getTaskById(iter_17_2) or arg_17_0.taskProxy:getFinishTaskById(iter_17_2)):getTaskStatus() ~= 2 then
				return 2
			end
		end
	end

	return 0
end

function var_0_0.Hide(arg_18_0)
	if arg_18_0:isShowing() then
		var_0_0.super.Hide(arg_18_0)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_18_0._tf, arg_18_0._parentTf)
	end
end

return var_0_0
