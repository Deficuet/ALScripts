local var_0_0 = class("StarsCityOmenPage", import("view.activity.CorePage.CoreLoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.dayTF = arg_1_0.bg:Find("total_progress/day")
	arg_1_0.maxDayTF = arg_1_0.bg:Find("total_progress/max_day")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.btnDetail = arg_1_0.bg:Find("btn_detail")
	arg_1_0.txtDetail = arg_1_0.btnDetail:Find("detail")
	arg_1_0.ruleTxt = arg_1_0.bg:Find("rule_get")
	arg_1_0.btnStory = arg_1_0.bg:Find("btn_story")
	arg_1_0.redPoint = arg_1_0.btnStory:Find("red")
	arg_1_0.scenario = arg_1_0:GetOutPostScenarioPage().New(arg_1_0._tf, arg_1_0.event)

	arg_1_0.scenario:SetCoreStoryPage(arg_1_0)
	arg_1_0.scenario:RegisterView(arg_1_0.coreActivityUI)

	arg_1_0.taskWindow = StarsCityOmenTaskWindow.New(arg_1_0._tf, arg_1_0.event)

	setActive(arg_1_0.item, false)

	arg_1_0.progressLabel = arg_1_0.bg:Find("total_progress/label")

	setText(arg_1_0.progressLabel, i18n("Outpost_20250904_Progress"))
	setText(arg_1_0.txtDetail, i18n("Outpost_20260514_Detail"))
	setText(arg_1_0.ruleTxt, i18n("Outpost_20260806_rule"))
end

function var_0_0.GetOutPostScenarioPage(arg_2_0)
	return OutPostScenarioPage_260806
end

function var_0_0.OnDataSetting(arg_3_0)
	arg_3_0.nday = 0
	arg_3_0.taskProxy = getProxy(TaskProxy)
	arg_3_0.taskGroup = arg_3_0.activity:getConfig("config_client").unlock_task

	return updateActivityTaskStatus(arg_3_0.activity)
end

function var_0_0.OnFirstFlush(arg_4_0)
	var_0_0.super.OnFirstFlush(arg_4_0)
	setActive(arg_4_0.maxTF, #arg_4_0.taskGroup)
	onButton(arg_4_0, arg_4_0.btnDetail, function()
		arg_4_0.taskWindow:ExecuteAction("Show", arg_4_0.activity)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnStory, function()
		if arg_4_0.scenario then
			arg_4_0.scenario:Load()
			arg_4_0.scenario:SetActivity(arg_4_0.activity)
			arg_4_0.scenario:UpdateStoryTask()
			arg_4_0.scenario:ActionInvoke("UpdateView")
			arg_4_0:ShowScenarioLayer(true)

			local var_6_0 = Activity.GetPlayerActivyIDKey(arg_4_0.activity.id)

			PlayerPrefs.SetInt(var_6_0, 1)
			PlayerPrefs.Save()
			arg_4_0:refreshStoryPoint()
		end
	end, SFX_PANEL)
end

function var_0_0.OnShowFlush(arg_7_0)
	var_0_0.super.OnShowFlush(arg_7_0)
end

function var_0_0.ShowScenarioLayer(arg_8_0, arg_8_1)
	if arg_8_1 then
		arg_8_0.coreActivityUI:ActiveScenarioLayer(true)

		if arg_8_0.scenario then
			arg_8_0.scenario:ActionInvoke("Show")
		end
	else
		if arg_8_0.scenario then
			arg_8_0.scenario:Hide()
		end

		arg_8_0.coreActivityUI:ActiveScenarioLayer(false)
	end
end

function var_0_0.IsShowingPopWindow(arg_9_0)
	if arg_9_0.scenario then
		return arg_9_0.scenario:isShowing()
	end
end

function var_0_0.ClosePopWindow(arg_10_0)
	if arg_10_0.scenario then
		arg_10_0.scenario:Hide()
		arg_10_0:ShowScenarioLayer(false)
	end
end

function var_0_0.OnUpdateFlush(arg_11_0)
	local var_11_0 = #arg_11_0.taskGroup

	arg_11_0.nday = arg_11_0:getTaskIdx(arg_11_0.activity)

	arg_11_0:PlayStory()
	arg_11_0:refreshStoryPoint()

	if arg_11_0.dayTF then
		setText(arg_11_0.dayTF, "DAY " .. arg_11_0.nday)
		setText(arg_11_0.maxDayTF, "/" .. var_11_0)
	end

	arg_11_0.uilist:align(#arg_11_0.taskGroup[arg_11_0.nday])

	if arg_11_0.taskWindow:isShowing() then
		arg_11_0.taskWindow:ExecuteAction("Show", arg_11_0.activity)
	end
end

function var_0_0.UpdateTask(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_1 + 1
	local var_12_1 = arg_12_2:Find("item")
	local var_12_2 = arg_12_0.taskGroup[arg_12_0.nday][var_12_0]
	local var_12_3 = arg_12_0.taskProxy:getTaskById(var_12_2) or arg_12_0.taskProxy:getFinishTaskById(var_12_2)

	assert(var_12_3, "without this task by id: " .. var_12_2)

	local var_12_4 = Drop.Create(var_12_3:getConfig("award_display")[1])

	updateDrop(var_12_1, var_12_4)
	onButton(arg_12_0, var_12_1, function()
		arg_12_0:emit(BaseUI.ON_DROP, var_12_4)
	end, SFX_PANEL)

	local var_12_5 = var_12_3:getProgress()
	local var_12_6 = var_12_3:getConfig("target_num")

	setScrollText(arg_12_2:Find("mask/description"), var_12_3:getConfig("desc"))

	local var_12_7, var_12_8 = arg_12_0:GetProgressColor()
	local var_12_9

	var_12_9 = var_12_7 and setColorStr(var_12_5, var_12_7) or var_12_5

	local var_12_10

	var_12_10 = var_12_8 and setColorStr("/" .. var_12_6, var_12_8) or "/" .. var_12_6

	setText(arg_12_2:Find("progressText"), var_12_9 .. var_12_10)
	setSlider(arg_12_2:Find("progress"), 0, var_12_6, var_12_5)

	local var_12_11 = arg_12_2:Find("go_btn")
	local var_12_12 = arg_12_2:Find("get_btn")
	local var_12_13 = arg_12_2:Find("got_btn")

	arg_12_0:SetBtnLocal(arg_12_2)

	local var_12_14 = var_12_3:getTaskStatus()

	setActive(var_12_11, var_12_14 == 0)
	setActive(var_12_12, var_12_14 == 1)
	setActive(var_12_13, var_12_14 == 2)
	onButton(arg_12_0, var_12_11, function()
		arg_12_0:emit(ActivityMediator.ON_TASK_GO, var_12_3)
	end, SFX_PANEL)
	onButton(arg_12_0, var_12_12, function()
		local var_15_0 = {}
		local var_15_1 = var_12_3:getConfig("award_display")
		local var_15_2 = getProxy(PlayerProxy):getRawData()
		local var_15_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_15_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_15_3)
		local var_15_5, var_15_6 = Task.StaticJudgeOverflow(var_15_2.gold, var_15_2.oil, var_15_4, true, true, var_15_1)

		if var_15_5 then
			table.insert(var_15_0, function(arg_16_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_15_6,
					onYes = arg_16_0
				})
			end)
		end

		seriesAsync(var_15_0, function()
			arg_12_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_12_3)
		end)
	end, SFX_PANEL)
end

function var_0_0.getTaskIdx(arg_18_0, arg_18_1)
	local var_18_0 = 1
	local var_18_1 = arg_18_1:getNDay()
	local var_18_2 = #arg_18_0.taskGroup
	local var_18_3 = math.min(var_18_1, var_18_2)
	local var_18_4 = true

	for iter_18_0 = 1, var_18_3 do
		if not var_18_4 then
			break
		end

		var_18_0 = iter_18_0

		if iter_18_0 < var_18_3 then
			for iter_18_1, iter_18_2 in ipairs(arg_18_0.taskGroup[iter_18_0]) do
				if not arg_18_0:isTaskFinished(iter_18_2) then
					var_18_4 = false

					break
				end
			end
		end
	end

	return math.min(var_18_0, var_18_2)
end

function var_0_0.isTaskFinished(arg_19_0, arg_19_1)
	if not arg_19_0.taskProxy then
		arg_19_0.taskProxy = getProxy(TaskProxy)
	end

	local var_19_0 = arg_19_0.taskProxy:getTaskById(arg_19_1) or arg_19_0.taskProxy:getFinishTaskById(arg_19_1)

	return var_19_0 and var_19_0:getTaskStatus() == 2
end

function var_0_0.refreshStoryPoint(arg_20_0)
	local var_20_0 = Activity.GetPlayerActivyIDKey(arg_20_0.activity.id)
	local var_20_1 = PlayerPrefs.GetInt(var_20_0, 0) == 0

	setActive(arg_20_0.redPoint, var_20_1)
end

function var_0_0.GetProgressColor(arg_21_0)
	return "#FFFFFF", "#C3C3C3"
end

function var_0_0.SetBtnLocal(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1:Find("get_btn")
	local var_22_1 = arg_22_1:Find("go_btn")
	local var_22_2 = arg_22_1:Find("got_btn")

	setText(var_22_0:Find("Text"), i18n("LiquorFloorTaskUI_get"))
	setText(var_22_1:Find("Text"), i18n("LiquorFloorTaskUI_go"))
	setText(var_22_2:Find("Text"), i18n("LiquorFloorTaskUI_got"))
end

function var_0_0.OnHideFlush(arg_23_0)
	if arg_23_0.taskWindow:isShowing() then
		arg_23_0.taskWindow:Hide()
	end
end

function var_0_0.OnDestroy(arg_24_0)
	if arg_24_0.taskWindow then
		arg_24_0.taskWindow:Hide()
		arg_24_0.taskWindow:Destroy()

		arg_24_0.taskWindow = nil
	end

	if arg_24_0.scenario then
		if arg_24_0.scenario:isShowing() then
			arg_24_0.scenario:Hide()
		end

		arg_24_0.scenario:Destroy()
	end
end

return var_0_0
