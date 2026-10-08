local var_0_0 = class("CityRebuildTasksLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CityRebuildTasksUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0:findTF("BG")
	arg_2_0.Close = arg_2_0.bg:Find("close")
	arg_2_0.list = arg_2_0.bg:Find("panel/list")
	arg_2_0.frame = arg_2_0.bg:Find("frame")
	arg_2_0.white_closebtn = arg_2_0:findTF("white_close")
	arg_2_0.UIlist = UIItemList.New(arg_2_0.list, arg_2_0.frame)
	arg_2_0.getall = arg_2_0.bg:Find("get_all")
end

function var_0_0.findTF(arg_3_0, arg_3_1, arg_3_2)
	return findTF(arg_3_2 or arg_3_0._tf, arg_3_1)
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
	onButton(arg_4_0, arg_4_0.getall, function()
		arg_4_0:GetAllAward()
	end)
	setText(arg_4_0.getall:Find("Text"), i18n("other_world_task_get_all"))
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.ShouldShowTip()
	local var_8_0 = ActivityConst.NINJA_CITY_SP_TASK
	local var_8_1 = getProxy(TaskProxy)
	local var_8_2 = getProxy(ActivityProxy):getActivityById(var_8_0)
	local var_8_3 = var_8_2:getConfig("config_data")

	if var_8_2.data3 then
		return false
	end

	local var_8_4 = var_8_2.data3

	if var_8_4 == 0 or var_8_4 == nil then
		return false
	end

	for iter_8_0 = 1, #var_8_3[var_8_4] do
		if var_8_1:getTaskVO(var_8_3[var_8_4][iter_8_0]):getTaskStatus() == 1 then
			return true
		end
	end

	local var_8_5 = ActivityConst.NINJA_CITY_NORMAL_ACTIVITY_TASK
	local var_8_6 = getProxy(ActivityProxy):getActivityById(var_8_5):getConfig("config_data")

	for iter_8_1 = 1, #var_8_6 do
		if var_8_1:getTaskVO(var_8_6[iter_8_1]):getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

function var_0_0.InitData(arg_9_0)
	arg_9_0.taskProxy = getProxy(TaskProxy)
	arg_9_0.taskActivityId = ActivityConst.NINJA_CITY_SP_TASK
	arg_9_0.taskActivityId_2 = ActivityConst.NINJA_CITY_NORMAL_ACTIVITY_TASK
	arg_9_0.activity = getProxy(ActivityProxy):getActivityById(arg_9_0.taskActivityId)
	arg_9_0.activity_2 = getProxy(ActivityProxy):getActivityById(arg_9_0.taskActivityId_2)
	arg_9_0.data = arg_9_0.activity:getConfig("config_data")
	arg_9_0.data2 = arg_9_0.activity_2:getConfig("config_data")

	updateActivityTaskStatus(arg_9_0.activity)

	arg_9_0.config_datas = {}
	arg_9_0.nday = arg_9_0.activity.data3

	if not arg_9_0.config_datas then
		table.clean(arg_9_0.config_datas)
	end

	for iter_9_0 = 1, #arg_9_0.data[arg_9_0.nday] do
		table.insert(arg_9_0.config_datas, arg_9_0.data[arg_9_0.nday][iter_9_0])
	end

	for iter_9_1 = 1, #arg_9_0.data2 do
		table.insert(arg_9_0.config_datas, arg_9_0.data2[iter_9_1])
	end

	arg_9_0:OnSort()
	arg_9_0:UpdateView()
end

function var_0_0.OnSort(arg_10_0)
	arg_10_0.config_data = {}

	if not arg_10_0.config_data then
		table.clean(arg_10_0.config_data)
	end

	for iter_10_0 = 1, #arg_10_0.config_datas do
		arg_10_0.tasks = arg_10_0.taskProxy:getTaskVO(arg_10_0.config_datas[iter_10_0])

		if arg_10_0.tasks:getTaskStatus() == 1 then
			table.insert(arg_10_0.config_data, arg_10_0.config_datas[iter_10_0])
		end
	end

	for iter_10_1 = 1, #arg_10_0.config_datas do
		arg_10_0.tasks = arg_10_0.taskProxy:getTaskVO(arg_10_0.config_datas[iter_10_1])

		if arg_10_0.tasks:getTaskStatus() == 0 then
			table.insert(arg_10_0.config_data, arg_10_0.config_datas[iter_10_1])
		end
	end

	for iter_10_2 = 1, #arg_10_0.config_datas do
		arg_10_0.tasks = arg_10_0.taskProxy:getTaskVO(arg_10_0.config_datas[iter_10_2])

		if arg_10_0.tasks:getTaskStatus() == 2 then
			table.insert(arg_10_0.config_data, arg_10_0.config_datas[iter_10_2])
		end
	end
end

function var_0_0.UpdateView(arg_11_0)
	setActive(arg_11_0.getall, arg_11_0.ShouldShowTip())
	arg_11_0.UIlist:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			arg_11_0:UpdateList(arg_12_1, arg_12_2, arg_11_0.config_data)
		end
	end)
	arg_11_0.UIlist:align(#arg_11_0.config_data)
end

function var_0_0.GetAllAward(arg_13_0)
	arg_13_0.indexTask = 0

	local var_13_0 = getProxy(PlayerProxy)
	local var_13_1 = {}
	local var_13_2 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0.config_data) do
		arg_13_0.taskvo = arg_13_0.taskProxy:getFinishTaskById(arg_13_0.config_data[iter_13_0])
		arg_13_0.task = arg_13_0.taskProxy:getTaskVO(arg_13_0.config_data[iter_13_0])

		if arg_13_0.task:getTaskStatus() == 1 then
			for iter_13_2 = 1, #arg_13_0.data2 do
				if arg_13_0.task.id == arg_13_0.data2[iter_13_2] then
					table.insert(var_13_1, arg_13_0.config_data[iter_13_0])
				end
			end

			for iter_13_3 = 1, #arg_13_0.data[arg_13_0.nday] do
				if arg_13_0.task.id == arg_13_0.data[arg_13_0.nday][iter_13_3] then
					table.insert(var_13_2, arg_13_0.task.id)
				end
			end
		end
	end

	for iter_13_4 = 1, #var_13_2 do
		arg_13_0:emit(CityRebuildTasksMediator.ON_SUBMIT_TASK, var_13_2[iter_13_4])
	end

	arg_13_0:emit(CityRebuildTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_13_0.taskActivityId_2, var_13_1)
end

function var_0_0.UpdateList(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_1 + 1
	local var_14_1 = arg_14_2:Find("frame")
	local var_14_2 = arg_14_0.taskProxy:getTaskVO(arg_14_3[var_14_0])
	local var_14_3 = arg_14_2:Find("desc")

	setText(var_14_3, var_14_2:getConfig("desc"))

	local var_14_4 = var_14_2:getProgress()
	local var_14_5 = var_14_2:getConfig("target_num")

	setText(arg_14_2:Find("progress"), setColorStr(var_14_4, "#000000") .. "/" .. var_14_5)
	setSlider(arg_14_2:Find("slider"), 0, var_14_5, var_14_4)

	local var_14_6 = arg_14_2:GetChild(0)
	local var_14_7 = arg_14_2:Find("awards")

	arg_14_0:updateAwards(var_14_2:getConfig("award_display"), var_14_7, var_14_6)

	local var_14_8 = arg_14_2:Find("go_btn")
	local var_14_9 = arg_14_2:Find("get_btn")
	local var_14_10 = arg_14_2:Find("got_btn")
	local var_14_11 = var_14_2:getTaskStatus()

	setActive(var_14_8, var_14_11 == 0)
	setActive(var_14_9, var_14_11 == 1)
	setActive(var_14_10, var_14_11 == 2)
	SetActive(arg_14_2:Find("tip"), var_14_11 == 1)
	onButton(arg_14_0, var_14_9, function()
		for iter_15_0 = 1, #arg_14_0.data[arg_14_0.nday] do
			if var_14_2.id == arg_14_0.data[arg_14_0.nday][iter_15_0] then
				arg_14_0:emit(CityRebuildTasksMediator.ON_SUBMIT_TASK, var_14_2.id)
			end
		end

		for iter_15_1 = 1, #arg_14_0.data2 do
			if var_14_2.id == arg_14_0.data2[iter_15_1] then
				arg_14_0:emit(CityRebuildTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_14_0.taskActivityId_2, {
					var_14_2.id
				})
			end
		end
	end, SFX_PANEL)
	onButton(arg_14_0, var_14_8, function()
		arg_14_0:emit(CityRebuildTasksMediator.ON_TASK_GO, var_14_2)
	end, SFX_PANEL)
end

function var_0_0.updateAwards(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = _.slice(arg_17_1, 1, 3)

	for iter_17_0 = arg_17_2.childCount, #var_17_0 - 1 do
		cloneTplTo(arg_17_3, arg_17_2)
	end

	local var_17_1 = arg_17_2.childCount

	for iter_17_1 = 1, var_17_1 do
		local var_17_2 = arg_17_2:GetChild(iter_17_1 - 1)
		local var_17_3 = iter_17_1 <= #var_17_0

		setActive(var_17_2, var_17_3)

		if var_17_3 then
			local var_17_4 = var_17_0[iter_17_1]
			local var_17_5 = {
				type = var_17_4[1],
				id = var_17_4[2],
				count = var_17_4[3]
			}

			updateDrop(findTF(var_17_2, "mask"), var_17_5)
			onButton(arg_17_0, var_17_2:Find("mask"), function()
				arg_17_0:emit(BaseUI.ON_DROP, var_17_5)
			end, SFX_PANEL)
		end
	end
end

return var_0_0
