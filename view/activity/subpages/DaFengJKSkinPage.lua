local var_0_0 = class("DaFengJKSkinPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.getBtn = arg_1_0.bg:Find("available")
	arg_1_0.unavailableTF = arg_1_0.bg:Find("unavailable")
	arg_1_0.phaseTF = arg_1_0.bg:Find("phase")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.itemList = UIItemList.New(arg_1_0.items, arg_1_0.item)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskList = arg_2_0.activity:getConfig("config_data")[1]
	arg_2_0.submitVO = nil
end

function var_0_0.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.item, false)
	arg_3_0.itemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		local var_4_0 = arg_3_0.taskList[arg_4_1]
		local var_4_1 = arg_3_0.taskProxy:getTaskById(var_4_0) or arg_3_0.taskProxy:getFinishTaskById(var_4_0)

		assert(var_4_1, "without this task by id: " .. var_4_0)

		if arg_4_0 == UIItemList.EventInit then
			local var_4_2 = arg_4_2:Find("item")
			local var_4_3 = var_4_1:getConfig("award_display")[1]
			local var_4_4 = {
				type = var_4_3[1],
				id = var_4_3[2],
				count = var_4_3[3]
			}

			updateDrop(var_4_2, var_4_4)
			onButton(arg_3_0, arg_4_2, function()
				arg_3_0:emit(BaseUI.ON_DROP, var_4_4)
			end, SFX_PANEL)
		elseif arg_4_0 == UIItemList.EventUpdate then
			local var_4_5 = var_4_1:getTaskStatus()
			local var_4_6 = arg_4_2:Find("got")

			setActive(var_4_6, var_4_5 == 2)
		end
	end)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		if arg_3_0.submitVO then
			arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, arg_3_0.submitVO)
		end
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	local var_7_0 = 0
	local var_7_1 = 0

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.taskList) do
		local var_7_2 = arg_7_0.taskProxy:getTaskById(iter_7_1) or arg_7_0.taskProxy:getFinishTaskById(iter_7_1)

		assert(var_7_2, "without this task by id: " .. iter_7_1)

		if var_7_2:getTaskStatus() == 1 then
			var_7_0 = var_7_0 + 1

			if not arg_7_0.submitVO then
				arg_7_0.submitVO = var_7_2
			end
		end

		if var_7_2:getTaskStatus() == 2 then
			var_7_1 = var_7_1 + 1
		end
	end

	setActive(arg_7_0.getBtn, var_7_0 > 0)
	setActive(arg_7_0.unavailableTF, var_7_0 <= 0)
	eachChild(arg_7_0.phaseTF, function(arg_8_0)
		setActive(arg_8_0, tonumber(arg_8_0.name) <= var_7_0 + var_7_1)
	end)
	arg_7_0.itemList:align(#arg_7_0.taskList)
end

function var_0_0.OnDestroy(arg_9_0)
	return
end

return var_0_0
