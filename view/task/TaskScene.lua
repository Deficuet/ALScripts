local var_0_0 = class("TaskScene", import("..base.BaseUI"))

var_0_0.PAGE_TYPE_SCENARIO = "scenario"
var_0_0.PAGE_TYPE_BRANCH = "branch"
var_0_0.PAGE_TYPE_ROUTINE = "routine"
var_0_0.PAGE_TYPE_WEEKLY = "weekly"
var_0_0.PAGE_TYPE_ALL = "all"
var_0_0.PAGE_TYPE_ACT = "activity"

local var_0_1 = {
	[var_0_0.PAGE_TYPE_SCENARIO] = {
		[1] = true
	},
	[var_0_0.PAGE_TYPE_BRANCH] = {
		nil,
		true,
		nil,
		nil,
		true,
		true
	},
	[var_0_0.PAGE_TYPE_ROUTINE] = {
		[3] = true,
		[36] = true
	},
	[var_0_0.PAGE_TYPE_WEEKLY] = {
		[4] = true,
		[13] = true
	},
	[var_0_0.PAGE_TYPE_ALL] = {
		true,
		true,
		true,
		true,
		true,
		true,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		true,
		[36] = true,
		[26] = true
	},
	[var_0_0.PAGE_TYPE_ACT] = {
		[36] = true,
		[6] = true,
		[26] = true,
		[16] = true
	}
}

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/taskui_atlas",
		"ui/iconcolorful",
		"ui/TaskEmptyListUI",
		"ui/TaskListPage",
		"ui/TaskListForWeekPage",
		"ui/ActivitybonusWindow"
	}

	table.insertto(var_1_0, arg_1_0:GetTaskResourceList())

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.GetTaskResourceList(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = getProxy(TaskProxy)

	for iter_2_0, iter_2_1 in ipairs(var_2_1:getTasks()) do
		local var_2_2 = arg_2_0:GetTaskResource(iter_2_1)

		if var_2_2 and not table.contains(var_2_0, var_2_2) then
			table.insert(var_2_0, var_2_2)
		end
	end

	for iter_2_2, iter_2_3 in ipairs(var_2_1:getFinishTasks()) do
		local var_2_3 = arg_2_0:GetTaskResource(iter_2_3)

		if var_2_3 and not table.contains(var_2_0, var_2_3) then
			table.insert(var_2_0, var_2_3)
		end
	end

	local var_2_4 = getProxy(AvatarFrameProxy):getAllAvatarFrame()

	for iter_2_4, iter_2_5 in ipairs(var_2_4) do
		local var_2_5 = iter_2_5.tasks

		for iter_2_6, iter_2_7 in ipairs(var_2_5) do
			local var_2_6 = arg_2_0:GetTaskResource(iter_2_7)

			if var_2_6 and not table.contains(var_2_0, var_2_6) then
				table.insert(var_2_0, var_2_6)
			end
		end
	end

	return var_2_0
end

function var_0_0.GetTaskResource(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1:getConfig("story_id")

	if var_3_0 and var_3_0 ~= "" then
		local var_3_1 = arg_3_1:getConfig("story_icon")

		if not var_3_1 or var_3_1 == "" then
			return "memoryicon/task_icon_default"
		else
			return "shipmodels/" .. var_3_1
		end
	end
end

function var_0_0.getUIName(arg_4_0)
	return "TaskScene"
end

function var_0_0.setTaskVOs(arg_5_0, arg_5_1)
	arg_5_0.contextData.taskVOsById = arg_5_1
end

function var_0_0.SetWeekTaskProgressInfo(arg_6_0, arg_6_1)
	arg_6_0.contextData.weekTaskProgressInfo = arg_6_1
end

function var_0_0.init(arg_7_0)
	arg_7_0._topPanel = arg_7_0._tf:Find("blur_panel/adapt/top")
	arg_7_0._backBtn = arg_7_0._topPanel:Find("back_btn")
	arg_7_0._leftLength = arg_7_0._tf:Find("blur_panel/adapt/left_length")
	arg_7_0._tagRoot = arg_7_0._tf:Find("blur_panel/adapt/left_length/frame/tagRoot")
	arg_7_0.taskIconTpl = arg_7_0._tf:Find("taskTagOb/task_icon_default")
	arg_7_0.weekTip = arg_7_0._tagRoot:Find("weekly/tip")
	arg_7_0.oneStepBtn = arg_7_0._tf:Find("blur_panel/adapt/top/GetAllButton")
	arg_7_0.contextData.viewComponent = arg_7_0
	arg_7_0.pageTF = arg_7_0._tf:Find("pages")
end

function var_0_0.IsNewStyleTime()
	return pg.TimeMgr.GetInstance():parseTimeFromConfig({
		{
			2021,
			6,
			14
		},
		{
			0,
			0,
			0
		}
	}) <= pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.IsPassScenario()
	local var_9_0 = pg.gameset.task_first_daily_pre_id.key_value
	local var_9_1 = getProxy(TaskProxy):getData()
	local var_9_2 = _.select(_.values(var_9_1), function(arg_10_0)
		return arg_10_0:getConfig("type") == 1
	end)

	if #var_9_2 > 0 then
		table.sort(var_9_2, function(arg_11_0, arg_11_1)
			return arg_11_0.id < arg_11_1.id
		end)

		return var_9_0 < var_9_2[1].id
	else
		return true
	end
end

function var_0_0.didEnter(arg_12_0)
	local var_12_0 = TaskCommonPage.New(arg_12_0.pageTF, arg_12_0.event, arg_12_0.contextData)
	local var_12_1 = var_0_0.IsNewStyleTime() and not arg_12_0.contextData.weekTaskProgressInfo:IsMaximum() and TaskWeekPage.New(arg_12_0.pageTF, arg_12_0.event, arg_12_0.contextData) or var_12_0

	arg_12_0.emptyPage = TaskEmptyListPage.New(arg_12_0._tf, arg_12_0.event)
	arg_12_0.pages = {
		[var_0_0.PAGE_TYPE_SCENARIO] = var_12_0,
		[var_0_0.PAGE_TYPE_BRANCH] = var_12_0,
		[var_0_0.PAGE_TYPE_ROUTINE] = var_12_0,
		[var_0_0.PAGE_TYPE_WEEKLY] = var_12_1,
		[var_0_0.PAGE_TYPE_ALL] = var_12_0,
		[var_0_0.PAGE_TYPE_ACT] = var_12_0
	}
	arg_12_0.contextData.ptAwardWindow = TaskPtAwardPage.New(arg_12_0._tf, arg_12_0.event, arg_12_0.contextData)

	onButton(arg_12_0, arg_12_0._backBtn, function()
		arg_12_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	setActive(arg_12_0._tf:Find("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(arg_12_0._tf:Find("stamp"), false)
	end

	onButton(arg_12_0, arg_12_0._tf:Find("stamp"), function()
		getProxy(TaskProxy):dealMingshiTouchFlag(5)
	end, SFX_CONFIRM)

	arg_12_0.toggles = {}

	for iter_12_0, iter_12_1 in pairs(var_0_1) do
		local var_12_2 = arg_12_0._tagRoot:Find(iter_12_0)

		onToggle(arg_12_0, var_12_2, function(arg_15_0)
			if arg_15_0 then
				arg_12_0:UpdatePage(iter_12_0)
			end
		end, SFX_PANEL)

		arg_12_0.toggles[iter_12_0] = var_12_2
	end

	local var_12_3 = arg_12_0.toggles[arg_12_0.contextData.page or var_0_0.PAGE_TYPE_ALL]

	if arg_12_0.toggles and var_12_3 then
		triggerToggle(var_12_3, true)
	end

	arg_12_0:UpdateWeekTip()
end

function var_0_0.refreshPage(arg_16_0)
	arg_16_0:UpdatePage(arg_16_0._currentToggleType)
end

function var_0_0.UpdatePage(arg_17_0, arg_17_1)
	local var_17_0 = var_0_1[arg_17_1]

	local function var_17_1(arg_18_0, arg_18_1)
		if #arg_18_1 <= 0 then
			arg_17_0.emptyPage:ExecuteAction("ShowOrHide", true)
		elseif #arg_18_1 > 0 and arg_17_0.emptyPage:GetLoaded() then
			arg_17_0.emptyPage:ExecuteAction("ShowOrHide", false)
		end

		arg_17_0:updateOneStepBtn(arg_18_0)
	end

	if arg_17_0._currentToggleType and arg_17_0._currentToggleType ~= arg_17_1 then
		arg_17_0.pages[arg_17_0._currentToggleType]:ExecuteAction("Hide")
	end

	local var_17_2 = arg_17_0.pages[arg_17_1]

	var_17_2:ExecuteAction("Update", arg_17_1, var_17_0, function(arg_19_0)
		var_17_1(var_17_2, arg_19_0)
	end)

	arg_17_0._currentToggleType = arg_17_1
	arg_17_0.contextData.page = arg_17_1
end

function var_0_0.addTask(arg_20_0, arg_20_1)
	arg_20_0.contextData.taskVOsById[arg_20_1.id] = arg_20_1

	arg_20_0:UpdatePage(arg_20_0._currentToggleType)
end

function var_0_0.removeTask(arg_21_0, arg_21_1)
	arg_21_0.contextData.taskVOsById[arg_21_1.id] = nil

	arg_21_0:UpdatePage(arg_21_0._currentToggleType)
end

function var_0_0.updateTask(arg_22_0, arg_22_1)
	arg_22_0:addTask(arg_22_1)
end

function var_0_0.ResetWeekTaskPage(arg_23_0)
	local var_23_0 = arg_23_0.pages[var_0_0.PAGE_TYPE_WEEKLY]

	if var_0_0.IsNewStyleTime() and isa(var_23_0, TaskCommonPage) then
		if var_23_0:GetLoaded() and var_23_0:isShowing() then
			var_23_0:Hide()
		end

		local var_23_1 = TaskWeekPage.New(arg_23_0.pageTF, arg_23_0.event, arg_23_0.contextData)

		arg_23_0.pages[var_0_0.PAGE_TYPE_WEEKLY] = var_23_1
	end

	arg_23_0:RefreshWeekTaskPage()

	if arg_23_0._currentToggleType ~= var_0_0.PAGE_TYPE_WEEKLY then
		arg_23_0:UpdatePage(arg_23_0._currentToggleType)
	end
end

function var_0_0.RefreshWeekTaskPage(arg_24_0)
	if arg_24_0._currentToggleType == var_0_0.PAGE_TYPE_WEEKLY then
		arg_24_0:UpdatePage(arg_24_0._currentToggleType)
		arg_24_0:UpdateWeekTip()
	end
end

function var_0_0.RefreshWeekTaskPageBefore(arg_25_0, arg_25_1)
	if arg_25_0._currentToggleType == var_0_0.PAGE_TYPE_WEEKLY then
		arg_25_0.pages[arg_25_0._currentToggleType]:RefreshWeekTaskPageBefore(arg_25_1)
	end
end

function var_0_0.RefreshWeekTaskProgress(arg_26_0)
	local var_26_0 = arg_26_0.pages[arg_26_0._currentToggleType]

	if isa(var_26_0, TaskWeekPage) and arg_26_0.contextData.weekTaskProgressInfo:IsMaximum() then
		var_26_0:Destroy()

		arg_26_0.pages[var_0_0.PAGE_TYPE_WEEKLY] = arg_26_0.pages[var_0_0.PAGE_TYPE_SCENARIO]

		arg_26_0:UpdatePage(var_0_0.PAGE_TYPE_WEEKLY)
	elseif arg_26_0._currentToggleType == var_0_0.PAGE_TYPE_WEEKLY and isa(var_26_0, TaskWeekPage) then
		var_26_0:ExecuteAction("RefreshWeekProgress")
		arg_26_0:UpdateWeekTip()
	end
end

function var_0_0.UpdateWeekTip(arg_27_0)
	local var_27_0 = false

	if var_0_0.IsPassScenario() and var_0_0.IsNewStyleTime() then
		for iter_27_0, iter_27_1 in pairs(arg_27_0.contextData.taskVOsById) do
			if (iter_27_1:getConfig("type") == 4 or iter_27_1:getConfig("type") == 13) and iter_27_1:isFinish() and not iter_27_1:isReceive() and iter_27_1:ShowOnTaskScene() then
				var_27_0 = true

				break
			end
		end

		if not var_27_0 then
			local var_27_1 = arg_27_0.contextData.weekTaskProgressInfo

			if var_27_1:CanUpgrade() or var_27_1:AnySubTaskCanSubmit() then
				var_27_0 = true
			end
		end
	end

	setActive(arg_27_0.weekTip, var_27_0)
end

function var_0_0.GoToFilter(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0._tagRoot:Find(arg_28_1)

	triggerToggle(var_28_0, true)
end

function var_0_0.onSubmit(arg_29_0, arg_29_1)
	if arg_29_0.onShowAwards then
		return
	end

	arg_29_0:emit(TaskMediator.ON_TASK_SUBMIT, arg_29_1)
end

function var_0_0.onSubmitForWeek(arg_30_0, arg_30_1)
	if arg_30_0.onShowAwards then
		return
	end

	arg_30_0:emit(TaskMediator.ON_SUBMIT_WEEK_TASK, arg_30_1)
end

function var_0_0.onSubmitForAvatar(arg_31_0, arg_31_1)
	if arg_31_0.onShowAwards then
		return
	end

	arg_31_0:emit(TaskMediator.ON_SUBMIT_AVATAR_TASK, arg_31_1)
end

function var_0_0.onGo(arg_32_0, arg_32_1)
	if arg_32_0.onShowAwards then
		return
	end

	if isa(arg_32_1, AvatarFrameTask) and arg_32_1:IsActEnd() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	arg_32_0:emit(TaskMediator.ON_TASK_GO, arg_32_1)
end

function var_0_0.willExit(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.pages) do
		iter_33_1:Destroy()
	end

	if arg_33_0.emptyPage then
		arg_33_0.emptyPage:Destroy()

		arg_33_0.emptyPage = nil
	end

	arg_33_0.pages = nil

	arg_33_0.contextData.ptAwardWindow:Destroy()

	arg_33_0.contextData.ptAwardWindow = nil
	arg_33_0.contextData.taskVOsById = nil
	arg_33_0.contextData.weekTaskProgressInfo = nil
	arg_33_0.contextData.viewComponent = nil
end

function var_0_0.updateOneStepBtn(arg_34_0, arg_34_1)
	arg_34_1 = arg_34_1 or arg_34_0.pages[arg_34_0._currentToggleType]

	local var_34_0 = #arg_34_1:GetWaitToCheckList() >= 2

	if var_34_0 then
		onButton(arg_34_0, arg_34_0.oneStepBtn, function()
			arg_34_1:ExecuteOneStepSubmit()
		end, SFX_PANEL)
	else
		removeOnButton(arg_34_0.oneStepBtn)
	end

	setActive(arg_34_0.oneStepBtn, var_34_0)
end

return var_0_0
