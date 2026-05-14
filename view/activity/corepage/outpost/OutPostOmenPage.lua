local var_0_0 = class("OutPostOmenPage", import("view.activity.CorePage.CoreLoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.dayTF = arg_1_0.bg:Find("total_progress/day")
	arg_1_0.maxDayTF = arg_1_0.bg:Find("total_progress/max_day")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.btnDetail = arg_1_0.bg:Find("btn_detail")
	arg_1_0.txtDetail = arg_1_0.btnDetail:Find("detail")
	arg_1_0.btnStory = arg_1_0.bg:Find("btn_story")
	arg_1_0.scenario = OutPostScenarioPage.New(arg_1_0._tf, arg_1_0.event)

	arg_1_0.scenario:SetCoreStoryPage(arg_1_0)
	arg_1_0.scenario:RegisterView(arg_1_0.coreActivityUI)

	arg_1_0.taskWindow = OutPostOmenTaskWindow.New(arg_1_0._tf, arg_1_0.event)

	setActive(arg_1_0.item, false)

	arg_1_0.progressLabel = arg_1_0.bg:Find("total_progress/label")

	setText(arg_1_0.progressLabel, i18n("Outpost_20250904_Progress"))
	setText(arg_1_0.txtDetail, i18n("Outpost_20260514_Detail"))
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.nday = 0
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = arg_2_0.activity:getConfig("config_client").unlock_task

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	var_0_0.super.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.maxTF, #arg_3_0.taskGroup)
	onButton(arg_3_0, arg_3_0.btnDetail, function()
		arg_3_0.taskWindow:ExecuteAction("Show", arg_3_0.activity)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.btnStory, function()
		arg_3_0.scenario:Load()
		arg_3_0.scenario:SetActivity(arg_3_0.activity)
		arg_3_0.scenario:UpdateStoryTask()
		arg_3_0.scenario:ActionInvoke("UpdateView")
		arg_3_0:ShowScenarioLayer(true)
	end, SFX_PANEL)
end

function var_0_0.OnShowFlush(arg_6_0)
	var_0_0.super.OnShowFlush(arg_6_0)
end

function var_0_0.ShowScenarioLayer(arg_7_0, arg_7_1)
	if arg_7_1 then
		arg_7_0.coreActivityUI:ActiveScenarioLayer(true)
		arg_7_0.scenario:ActionInvoke("Show")
	else
		arg_7_0.scenario:Hide()
		arg_7_0.coreActivityUI:ActiveScenarioLayer(false)
	end
end

function var_0_0.IsShowingPopWindow(arg_8_0)
	return arg_8_0.scenario:isShowing()
end

function var_0_0.ClosePopWindow(arg_9_0)
	arg_9_0.scenario:Hide()
	arg_9_0:ShowScenarioLayer(false)
end

function var_0_0.OnUpdateFlush(arg_10_0)
	local var_10_0 = #arg_10_0.taskGroup

	arg_10_0.nday = arg_10_0:getTaskIdx(arg_10_0.activity)

	arg_10_0:PlayStory()

	if arg_10_0.dayTF then
		setText(arg_10_0.dayTF, "DAY " .. arg_10_0.nday)
		setText(arg_10_0.maxDayTF, "/" .. var_10_0)
	end

	arg_10_0.uilist:align(#arg_10_0.taskGroup[arg_10_0.nday])

	if arg_10_0.taskWindow:isShowing() then
		arg_10_0.taskWindow:ExecuteAction("Show", arg_10_0.activity)
	end
end

function var_0_0.getTaskIdx(arg_11_0, arg_11_1)
	local var_11_0 = 1
	local var_11_1 = arg_11_1:getNDay()
	local var_11_2 = #arg_11_0.taskGroup
	local var_11_3 = math.min(var_11_1, var_11_2)
	local var_11_4 = true

	for iter_11_0 = 1, var_11_3 do
		if not var_11_4 then
			break
		end

		var_11_0 = iter_11_0

		if iter_11_0 < var_11_3 then
			for iter_11_1, iter_11_2 in ipairs(arg_11_0.taskGroup[iter_11_0]) do
				if not arg_11_0:isTaskFinished(iter_11_2) then
					var_11_4 = false

					break
				end
			end
		end
	end

	return math.min(var_11_0, var_11_2)
end

function var_0_0.isTaskFinished(arg_12_0, arg_12_1)
	if not arg_12_0.taskProxy then
		arg_12_0.taskProxy = getProxy(TaskProxy)
	end

	local var_12_0 = arg_12_0.taskProxy:getTaskById(arg_12_1) or arg_12_0.taskProxy:getFinishTaskById(arg_12_1)

	return var_12_0 and var_12_0:getTaskStatus() == 2
end

function var_0_0.OnHideFlush(arg_13_0)
	if arg_13_0.taskWindow:isShowing() then
		arg_13_0.taskWindow:Hide()
	end
end

function var_0_0.OnDestroy(arg_14_0)
	if arg_14_0.taskWindow then
		arg_14_0.taskWindow:Hide()
		arg_14_0.taskWindow:Destroy()

		arg_14_0.taskWindow = nil
	end

	if arg_14_0.scenario:isShowing() then
		arg_14_0.scenario:Hide()
	end

	arg_14_0.scenario:Destroy()
end

return var_0_0
