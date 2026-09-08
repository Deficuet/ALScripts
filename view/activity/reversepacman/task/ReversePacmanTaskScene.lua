local var_0_0 = class("ReversePacmanTaskScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanTaskUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBgBtn, function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.uiGetAllBtn, function()
		local var_5_0 = {}

		for iter_5_0, iter_5_1 in ipairs(arg_2_0.taskList) do
			if iter_5_1:getTaskStatus() == 1 then
				table.insert(var_5_0, iter_5_1.id)
			end
		end

		if #var_5_0 <= 0 then
			return
		end

		arg_2_0:emit(ReversePacmanTaskMediator.ON_ACTIVITY_TASK_SUBMIT_ONESTEP, arg_2_0.taskActivityID, var_5_0)
	end, SFX_PANEL)

	arg_2_0.itemList = {}
	arg_2_0.uiLScroll = GetComponent(arg_2_0.uiScroll, "LScrollRect")
	arg_2_0.onInitItemHandler = handler(arg_2_0, arg_2_0.OnInitItem)
	arg_2_0.onUpdateItemHandler = handler(arg_2_0, arg_2_0.OnUpdateItem)
	arg_2_0.uiLScroll.onInitItem = arg_2_0.onInitItemHandler
	arg_2_0.uiLScroll.onUpdateItem = arg_2_0.onUpdateItemHandler
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:BlurView()
	arg_6_0:RefreshUI()
end

function var_0_0.willExit(arg_7_0)
	arg_7_0:UnBlurView()

	arg_7_0.uiLScroll.onInitItem = nil
	arg_7_0.uiLScroll.onUpdateItem = nil
	arg_7_0.onInitItemHandler = nil
	arg_7_0.onUpdateItemHandler = nil
end

function var_0_0.BlurView(arg_8_0)
	arg_8_0:BlurPanel(arg_8_0._tf)
end

function var_0_0.UnBlurView(arg_9_0)
	arg_9_0:UnOverlayPanel(arg_9_0._tf)
end

function var_0_0.GetTaskList(arg_10_0)
	local var_10_0 = getProxy(TaskProxy)
	local var_10_1 = ReversePacmanTools.GetActivity():getConfig("config_client").taskActivityID
	local var_10_2 = getProxy(ActivityProxy):getActivityById(var_10_1)
	local var_10_3 = pg.activity_template[var_10_1].config_data

	arg_10_0.taskActivityID = var_10_1

	local var_10_4 = {}
	local var_10_5 = getProxy(TaskProxy)

	for iter_10_0, iter_10_1 in ipairs(var_10_3) do
		table.insert(var_10_4, var_10_5:getTaskVO(iter_10_1))
	end

	return var_10_4
end

function var_0_0.RefreshUI(arg_11_0)
	arg_11_0.taskList = arg_11_0:GetTaskList()

	arg_11_0:Sort(arg_11_0.taskList)
	arg_11_0.uiLScroll:SetTotalCount(#arg_11_0.taskList)

	if arg_11_0.contextData.taskID then
		arg_11_0:ScrollToTask(arg_11_0.contextData.taskID)

		arg_11_0.contextData.taskID = nil
	end

	setGray(arg_11_0.uiGetAllBtn, not arg_11_0:IsTip())
end

function var_0_0.ScrollToTask(arg_12_0, arg_12_1)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.taskList) do
		if iter_12_1.id == arg_12_1 then
			local var_12_0 = arg_12_0.uiLScroll:HeadIndexToValue(iter_12_0 - 1)

			arg_12_0.uiLScroll:ScrollTo(math.clamp(var_12_0, 0, 1))

			return
		end
	end
end

function var_0_0.OnInitItem(arg_13_0, arg_13_1)
	arg_13_0.itemList[arg_13_1] = ReversePacmanTaskItem.New(tf(arg_13_1), arg_13_0)
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.itemList[arg_14_2]

	if var_14_0 == nil then
		arg_14_0:OnInitItem(arg_14_2)

		var_14_0 = arg_14_0.itemList[arg_14_2]
	end

	local var_14_1 = arg_14_0.taskList[arg_14_1 + 1]

	var_14_0:SetData(var_14_1)
end

function var_0_0.Sort(arg_15_0)
	local function var_15_0(arg_16_0, arg_16_1, arg_16_2)
		local function var_16_0(arg_17_0)
			for iter_17_0, iter_17_1 in ipairs(arg_16_2) do
				if arg_17_0 == iter_17_1 then
					return iter_17_0
				end
			end
		end

		return var_16_0(arg_16_0) < var_16_0(arg_16_1)
	end

	table.sort(arg_15_0.taskList, function(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_0:getTaskStatus()
		local var_18_1 = arg_18_1:getTaskStatus()

		if var_18_0 == var_18_1 then
			return arg_18_0.id < arg_18_1.id
		end

		return var_15_0(var_18_0, var_18_1, {
			1,
			0,
			2,
			-1
		})
	end)
end

function var_0_0.IsTip(arg_19_0)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.taskList) do
		if iter_19_1:getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

return var_0_0
