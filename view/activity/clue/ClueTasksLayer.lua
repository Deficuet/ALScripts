local var_0_0 = class("ClueTasksLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ClueTasksUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.white_closebtn = arg_2_0._tf:Find("white_close")
	arg_2_0.bg = arg_2_0._tf:Find("BG")
	arg_2_0.Close = arg_2_0.bg:Find("close")
	arg_2_0.list = arg_2_0.bg:Find("panel/list")
	arg_2_0.frame = arg_2_0.bg:Find("frame")
	arg_2_0.UIlist = UIItemList.New(arg_2_0.list, arg_2_0.frame)
	arg_2_0.getall = arg_2_0.bg:Find("get_all")
end

function var_0_0.ShouldShowTip()
	local var_3_0 = ActivityConst.Valleyhospital_TASK
	local var_3_1 = getProxy(TaskProxy)
	local var_3_2 = getProxy(ActivityProxy):getActivityById(var_3_0):getConfig("config_data")

	for iter_3_0 = 1, #var_3_2 do
		if var_3_1:getTaskVO(var_3_2[iter_3_0]):getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:InitData()
	setActive(arg_4_0.frame, false)
	onButton(arg_4_0, arg_4_0.Close, function()
		arg_4_0:closeView()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.white_closebtn, function()
		arg_4_0:closeView()
	end, SFX_PANEL)
	arg_4_0:UpdateView()
	onButton(arg_4_0, arg_4_0.getall, function()
		arg_4_0:GetAllAward()
	end)
	setText(arg_4_0.getall:Find("Text"), i18n("other_world_task_get_all"))
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.UpdateView(arg_8_0)
	setActive(arg_8_0.getall, arg_8_0.ShouldShowTip())
	arg_8_0.UIlist:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_8_0:UpdateList(arg_9_1, arg_9_2, arg_8_0.config_data)
		end
	end)
	arg_8_0.UIlist:align(#arg_8_0.config_data)
end

function var_0_0.GetAllAward(arg_10_0)
	local var_10_0 = getProxy(PlayerProxy)
	local var_10_1 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.config_data) do
		arg_10_0.taskvo = arg_10_0.taskProxy:getFinishTaskById(arg_10_0.config_data[iter_10_0])
		arg_10_0.task = arg_10_0.taskProxy:getTaskVO(arg_10_0.config_data[iter_10_0])

		if arg_10_0.task:getTaskStatus() == 1 then
			table.insert(var_10_1, arg_10_0.config_data[iter_10_0])
		end
	end

	arg_10_0:emit(ClueTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_10_0.taskActivityId, var_10_1)
end

function var_0_0.InitData(arg_11_0)
	arg_11_0.taskActivityId = ActivityConst.Valleyhospital_TASK
	arg_11_0.taskProxy = getProxy(TaskProxy)
	arg_11_0.activity = getProxy(ActivityProxy):getActivityById(arg_11_0.taskActivityId)
	arg_11_0.config_data = arg_11_0.activity:getConfig("config_data")
end

function var_0_0.UpdateList(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = arg_12_1 + 1
	local var_12_1 = arg_12_2:Find("frame")
	local var_12_2 = arg_12_0.taskProxy:getTaskVO(arg_12_3[var_12_0])
	local var_12_3 = arg_12_2:Find("desc")

	setText(var_12_3, var_12_2:getConfig("desc"))

	local var_12_4 = var_12_2:getProgress()
	local var_12_5 = var_12_2:getConfig("target_num")

	setText(arg_12_2:Find("progress"), var_12_4 .. "/" .. var_12_5)
	setSlider(arg_12_2:Find("slider"), 0, var_12_5, var_12_4)

	local var_12_6 = arg_12_2:GetChild(0)
	local var_12_7 = arg_12_2:Find("awards")

	arg_12_0:updateAwards(var_12_2:getConfig("award_display"), var_12_7, var_12_6)

	local var_12_8 = arg_12_2:Find("go_btn")
	local var_12_9 = arg_12_2:Find("get_btn")
	local var_12_10 = arg_12_2:Find("got_btn")
	local var_12_11 = var_12_2:getTaskStatus()

	setActive(var_12_8, var_12_11 == 0)
	setActive(var_12_9, var_12_11 == 1)
	setActive(var_12_10, var_12_11 == 2)
	SetActive(arg_12_2:Find("tip"), var_12_11 == 1)
	onButton(arg_12_0, var_12_9, function()
		arg_12_0:emit(ClueTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_12_0.taskActivityId, {
			var_12_2.id
		})
	end, SFX_PANEL)
	onButton(arg_12_0, var_12_8, function()
		arg_12_0:emit(ClueTasksMediator.ON_TASK_GO, var_12_2)
	end, SFX_PANEL)
end

function var_0_0.updateAwards(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = _.slice(arg_15_1, 1, 3)

	for iter_15_0 = arg_15_2.childCount, #var_15_0 - 1 do
		cloneTplTo(arg_15_3, arg_15_2)
	end

	local var_15_1 = arg_15_2.childCount

	for iter_15_1 = 1, var_15_1 do
		local var_15_2 = arg_15_2:GetChild(iter_15_1 - 1)
		local var_15_3 = iter_15_1 <= #var_15_0

		setActive(var_15_2, var_15_3)

		if var_15_3 then
			local var_15_4 = var_15_0[iter_15_1]
			local var_15_5 = {
				type = var_15_4[1],
				id = var_15_4[2],
				count = var_15_4[3]
			}

			updateDrop(findTF(var_15_2, "mask"), var_15_5)
			onButton(arg_15_0, var_15_2:Find("mask"), function()
				arg_15_0:emit(BaseUI.ON_DROP, var_15_5)
			end, SFX_PANEL)
		end
	end
end

return var_0_0
