local var_0_0 = class("HolidayVillaTasksLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "HolidayVillaTasksUI"
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
	local var_3_0 = ActivityConst.HOLIDAY_TASK
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
	arg_4_0:SortData()
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

function var_0_0.UpdateView(arg_8_0)
	for iter_8_0 = 1, #arg_8_0.config_client do
		for iter_8_1 = 1, #arg_8_0.config_client[iter_8_0] do
			arg_8_0.task = arg_8_0.taskProxy:getTaskVO(arg_8_0.config_client[iter_8_0][iter_8_1])
			arg_8_0.isGottask = arg_8_0:ISGot(arg_8_0.task, arg_8_0.config_client[iter_8_0][iter_8_1])

			if arg_8_0.isGottask ~= 2 then
				table.insert(arg_8_0.config_data, arg_8_0.config_client[iter_8_0][iter_8_1])

				break
			elseif arg_8_0.isGottask == 2 and iter_8_1 == #arg_8_0.config_client[iter_8_0] then
				table.insert(arg_8_0.config_data, arg_8_0.config_client[iter_8_0][iter_8_1])
			end
		end
	end

	arg_8_0:SortData()
	setActive(arg_8_0.getall, arg_8_0.ShouldShowTip())
	arg_8_0.UIlist:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_8_0:UpdateList(arg_9_1, arg_9_2, arg_8_0.config_data)
		end
	end)
	arg_8_0.UIlist:align(#arg_8_0.config_data)
end

function var_0_0.SortData(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = {}
	local var_10_2 = {}

	for iter_10_0 = 1, #arg_10_0.config_data do
		arg_10_0.taskvo = arg_10_0.taskProxy:getFinishTaskById(arg_10_0.config_data[iter_10_0])
		arg_10_0.task = arg_10_0.taskProxy:getTaskVO(arg_10_0.config_data[iter_10_0])

		if arg_10_0.task:getTaskStatus() == 1 then
			table.insert(var_10_0, arg_10_0.config_data[iter_10_0])
		elseif arg_10_0.task:getTaskStatus() == 0 then
			table.insert(var_10_2, arg_10_0.config_data[iter_10_0])
		elseif arg_10_0.task:getTaskStatus() == 2 then
			table.insert(var_10_1, arg_10_0.config_data[iter_10_0])
		end
	end

	for iter_10_1 = 1, #arg_10_0.config_data do
		table.remove(arg_10_0.config_data)
	end

	for iter_10_2 = 1, #var_10_0 do
		table.insert(arg_10_0.config_data, var_10_0[iter_10_2])
	end

	for iter_10_3 = 1, #var_10_2 do
		table.insert(arg_10_0.config_data, var_10_2[iter_10_3])
	end

	for iter_10_4 = 1, #var_10_1 do
		table.insert(arg_10_0.config_data, var_10_1[iter_10_4])
	end
end

function var_0_0.GetAllAward(arg_11_0)
	local var_11_0 = getProxy(PlayerProxy)
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.config_data) do
		arg_11_0.taskvo = arg_11_0.taskProxy:getFinishTaskById(arg_11_0.config_data[iter_11_0])
		arg_11_0.task = arg_11_0.taskProxy:getTaskVO(arg_11_0.config_data[iter_11_0])

		if arg_11_0.task:getTaskStatus() == 1 then
			table.insert(var_11_1, arg_11_0.config_data[iter_11_0])
		end
	end

	arg_11_0:emit(HolidayVillaTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_11_0.taskActivityId, var_11_1)
end

function var_0_0.ISGot(arg_12_0, arg_12_1, arg_12_2)
	arg_12_1 = arg_12_0.taskProxy:getTaskVO(arg_12_2)

	return arg_12_1:getTaskStatus()
end

function var_0_0.InitData(arg_13_0)
	arg_13_0.taskActivityId = ActivityConst.HOLIDAY_TASK
	arg_13_0.taskProxy = getProxy(TaskProxy)
	arg_13_0.activity = getProxy(ActivityProxy):getActivityById(arg_13_0.taskActivityId)
	arg_13_0.config_data = {}

	if #arg_13_0.config_data == 0 then
		-- block empty
	else
		for iter_13_0 = 1, #arg_13_0.config_data do
			table.remove(arg_13_0.config_data)
		end
	end

	arg_13_0.config_client = arg_13_0.activity:getConfig("config_client").task

	arg_13_0:UpdateView()
end

function var_0_0.UpdateList(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_1 + 1
	local var_14_1 = arg_14_2:Find("frame")
	local var_14_2 = arg_14_0.taskProxy:getTaskVO(arg_14_3[var_14_0])
	local var_14_3 = arg_14_2:Find("desc")

	setText(var_14_3, var_14_2:getConfig("desc"))

	local var_14_4 = var_14_2:getProgress()
	local var_14_5 = var_14_2:getConfig("target_num")

	setText(arg_14_2:Find("progress"), var_14_4 .. "/" .. var_14_5)
	setSlider(arg_14_2:Find("slider"), 0, var_14_5, var_14_4)

	local var_14_6 = arg_14_2:GetChild(0)
	local var_14_7 = arg_14_2:Find("awards")

	arg_14_0:updateAwards(var_14_2:getConfig("award_display"), var_14_7, var_14_6)

	local var_14_8 = arg_14_2:Find("go_btn")
	local var_14_9 = arg_14_2:Find("get_btn")
	local var_14_10 = arg_14_2:Find("got_btn")

	setText(arg_14_2:Find("go_btn/text"), i18n("other_world_task_go"))
	setText(arg_14_2:Find("get_btn/text"), i18n("other_world_task_get"))
	setText(arg_14_2:Find("got_btn/text"), i18n("other_world_task_got"))

	local var_14_11 = var_14_2:getTaskStatus()

	setActive(var_14_8, var_14_11 == 0)
	setActive(var_14_9, var_14_11 == 1)
	setActive(var_14_10, var_14_11 == 2)
	SetActive(arg_14_2:Find("tip"), var_14_11 == 1)
	onButton(arg_14_0, var_14_9, function()
		arg_14_0:emit(HolidayVillaTasksMediator.ON_TASK_SUBMIT_ONESTEP, arg_14_0.taskActivityId, {
			var_14_2.id
		})
	end, SFX_PANEL)
	onButton(arg_14_0, var_14_8, function()
		arg_14_0:emit(HolidayVillaTasksMediator.ON_TASK_GO, var_14_2)
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
				arg_17_0:emit(BaseUI.ON_ITEM, var_17_5)
			end, SFX_PANEL)
		end
	end
end

return var_0_0
