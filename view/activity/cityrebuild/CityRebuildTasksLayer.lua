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

function var_0_0.didEnter(arg_3_0)
	arg_3_0:InitData()
	setActive(arg_3_0.frame, false)
	onButton(arg_3_0, arg_3_0.Close, function()
		arg_3_0:closeView()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.white_closebtn, function()
		arg_3_0:closeView()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.getall, function()
		arg_3_0:GetAllAward()
	end)
	setText(arg_3_0.getall:Find("Text"), i18n("other_world_task_get_all"))
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.ShouldShowTip()
	local var_7_0 = ActivityConst.NINJA_CITY_SP_TASK
	local var_7_1 = getProxy(TaskProxy)
	local var_7_2 = getProxy(ActivityProxy):getActivityById(var_7_0)
	local var_7_3 = var_7_2:getConfig("config_data")

	if var_7_2.data3 then
		return false
	end

	local var_7_4 = var_7_2.data3

	if var_7_4 then
		return false
	end

	for iter_7_0 = 1, #var_7_3[var_7_4] do
		if var_7_1:getTaskVO(var_7_3[var_7_4][iter_7_0]):getTaskStatus() == 1 then
			return true
		end
	end

	local var_7_5 = ActivityConst.NINJA_CITY_NORMAL_ACTIVITY_TASK
	local var_7_6 = getProxy(ActivityProxy):getActivityById(var_7_5):getConfig("config_data")

	for iter_7_1 = 1, #var_7_6 do
		if var_7_1:getTaskVO(var_7_6[iter_7_1]):getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

function var_0_0.InitData(arg_8_0)
	arg_8_0.taskProxy = getProxy(TaskProxy)
	arg_8_0.taskActivityId = ActivityConst.NINJA_CITY_SP_TASK
	arg_8_0.taskActivityId_2 = ActivityConst.NINJA_CITY_NORMAL_ACTIVITY_TASK
	arg_8_0.activity = getProxy(ActivityProxy):getActivityById(arg_8_0.taskActivityId)
	arg_8_0.activity_2 = getProxy(ActivityProxy):getActivityById(arg_8_0.taskActivityId_2)
	arg_8_0.data = arg_8_0.activity:getConfig("config_data")
	arg_8_0.data2 = arg_8_0.activity_2:getConfig("config_data")

	updateActivityTaskStatus(arg_8_0.activity)

	arg_8_0.config_datas = {}
	arg_8_0.nday = arg_8_0.activity.data3

	if not arg_8_0.config_datas then
		table.clean(arg_8_0.config_datas)
	end

	for iter_8_0 = 1, #arg_8_0.data[arg_8_0.nday] do
		table.insert(arg_8_0.config_datas, arg_8_0.data[arg_8_0.nday][iter_8_0])
	end

	for iter_8_1 = 1, #arg_8_0.data2 do
		table.insert(arg_8_0.config_datas, arg_8_0.data2[iter_8_1])
	end

	arg_8_0:OnSort()
	arg_8_0:UpdateView()
end

function var_0_0.OnSort(arg_9_0)
	arg_9_0.config_data = {}

	if not arg_9_0.config_data then
		table.clean(arg_9_0.config_data)
	end

	for iter_9_0 = 1, #arg_9_0.config_datas do
		arg_9_0.tasks = arg_9_0.taskProxy:getTaskVO(arg_9_0.config_datas[iter_9_0])

		if arg_9_0.tasks:getTaskStatus() == 1 then
			table.insert(arg_9_0.config_data, arg_9_0.config_datas[iter_9_0])
		end
	end

	for iter_9_1 = 1, #arg_9_0.config_datas do
		arg_9_0.tasks = arg_9_0.taskProxy:getTaskVO(arg_9_0.config_datas[iter_9_1])

		if arg_9_0.tasks:getTaskStatus() == 0 then
			table.insert(arg_9_0.config_data, arg_9_0.config_datas[iter_9_1])
		end
	end

	for iter_9_2 = 1, #arg_9_0.config_datas do
		arg_9_0.tasks = arg_9_0.taskProxy:getTaskVO(arg_9_0.config_datas[iter_9_2])

		if arg_9_0.tasks:getTaskStatus() == 2 then
			table.insert(arg_9_0.config_data, arg_9_0.config_datas[iter_9_2])
		end
	end
end

function var_0_0.UpdateView(arg_10_0)
	setActive(arg_10_0.getall, arg_10_0.ShouldShowTip())
	arg_10_0.UIlist:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_10_0:UpdateList(arg_11_1, arg_11_2, arg_10_0.config_data)
		end
	end)
	arg_10_0.UIlist:align(#arg_10_0.config_data)
end

function var_0_0.GetAllAward(arg_12_0)
	arg_12_0.indexTask = 0

	local var_12_0 = getProxy(PlayerProxy)
	local var_12_1 = {}
	local var_12_2 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0.config_data) do
		arg_12_0.taskvo = arg_12_0.taskProxy:getFinishTaskById(arg_12_0.config_data[iter_12_0])
		arg_12_0.task = arg_12_0.taskProxy:getTaskVO(arg_12_0.config_data[iter_12_0])

		if arg_12_0.task:getTaskStatus() == 1 then
			for iter_12_2 = 1, #arg_12_0.data2 do
				if arg_12_0.task.id == arg_12_0.data2[iter_12_2] then
					table.insert(var_12_1, arg_12_0.config_data[iter_12_0])
				end
			end

			for iter_12_3 = 1, #arg_12_0.data[arg_12_0.nday] do
				if arg_12_0.task.id == arg_12_0.data[arg_12_0.nday][iter_12_3] then
					table.insert(var_12_2, arg_12_0.task.id)
				end
			end
		end
	end

	for iter_12_4 = 1, #var_12_2 do
		arg_12_0:emit(CityRebuildTasksMediator.ON_SUBMIT_TASK, var_12_2[iter_12_4])
	end

	arg_12_0:emit(CityRebuildTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_12_0.taskActivityId_2, var_12_1)
end

function var_0_0.UpdateList(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_1 + 1
	local var_13_1 = arg_13_2:Find("frame")
	local var_13_2 = arg_13_0.taskProxy:getTaskVO(arg_13_3[var_13_0])
	local var_13_3 = arg_13_2:Find("desc")

	setText(var_13_3, var_13_2:getConfig("desc"))

	local var_13_4 = var_13_2:getProgress()
	local var_13_5 = var_13_2:getConfig("target_num")

	setText(arg_13_2:Find("progress"), setColorStr(var_13_4, "#000000") .. "/" .. var_13_5)
	setSlider(arg_13_2:Find("slider"), 0, var_13_5, var_13_4)

	local var_13_6 = arg_13_2:GetChild(0)
	local var_13_7 = arg_13_2:Find("awards")

	arg_13_0:updateAwards(var_13_2:getConfig("award_display"), var_13_7, var_13_6)

	local var_13_8 = arg_13_2:Find("go_btn")
	local var_13_9 = arg_13_2:Find("get_btn")
	local var_13_10 = arg_13_2:Find("got_btn")
	local var_13_11 = var_13_2:getTaskStatus()

	setActive(var_13_8, var_13_11 == 0)
	setActive(var_13_9, var_13_11 == 1)
	setActive(var_13_10, var_13_11 == 2)
	SetActive(arg_13_2:Find("tip"), var_13_11 == 1)
	onButton(arg_13_0, var_13_9, function()
		for iter_14_0 = 1, #arg_13_0.data[arg_13_0.nday] do
			if var_13_2.id == arg_13_0.data[arg_13_0.nday][iter_14_0] then
				arg_13_0:emit(CityRebuildTasksMediator.ON_SUBMIT_TASK, var_13_2.id)
			end
		end

		for iter_14_1 = 1, #arg_13_0.data2 do
			if var_13_2.id == arg_13_0.data2[iter_14_1] then
				arg_13_0:emit(CityRebuildTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_13_0.taskActivityId_2, {
					var_13_2.id
				})
			end
		end
	end, SFX_PANEL)
	onButton(arg_13_0, var_13_8, function()
		arg_13_0:emit(CityRebuildTasksMediator.ON_TASK_GO, var_13_2)
	end, SFX_PANEL)
end

function var_0_0.updateAwards(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = _.slice(arg_16_1, 1, 3)

	for iter_16_0 = arg_16_2.childCount, #var_16_0 - 1 do
		cloneTplTo(arg_16_3, arg_16_2)
	end

	local var_16_1 = arg_16_2.childCount

	for iter_16_1 = 1, var_16_1 do
		local var_16_2 = arg_16_2:GetChild(iter_16_1 - 1)
		local var_16_3 = iter_16_1 <= #var_16_0

		setActive(var_16_2, var_16_3)

		if var_16_3 then
			local var_16_4 = var_16_0[iter_16_1]
			local var_16_5 = {
				type = var_16_4[1],
				id = var_16_4[2],
				count = var_16_4[3]
			}

			updateDrop(findTF(var_16_2, "mask"), var_16_5)
			onButton(arg_16_0, var_16_2:Find("mask"), function()
				arg_16_0:emit(BaseUI.ON_DROP, var_16_5)
			end, SFX_PANEL)
		end
	end
end

return var_0_0
