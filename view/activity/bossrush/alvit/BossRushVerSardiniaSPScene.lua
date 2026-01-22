local var_0_0 = class("BossRushVerSardiniaSPScene", import("view.base.BaseUI"))

var_0_0.DISPLAY = {
	STORY = "Story",
	BATTLE = "Battle"
}

function var_0_0.getUIName(arg_1_0)
	return "BossRushVerSardiniaSPUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.top = arg_2_0._tf:Find("Top")
	arg_2_0.seriesNodes = {}

	eachChild(arg_2_0._tf:Find("Battle/Nodes"), function(arg_3_0, arg_3_1)
		arg_2_0.seriesNodes[arg_3_0.name] = arg_3_0
	end)

	arg_2_0.progressText = arg_2_0.rtStoryAward:Find("Text")

	for iter_2_0 = 1, arg_2_0.rtStoryItems.childCount do
		local var_2_0 = arg_2_0.rtStoryItems:GetChild(iter_2_0 - 1)

		var_2_0:GetComponent(typeof(LayoutElement)).preferredWidth = iter_2_0 == arg_2_0.index and arg_2_0.EXPAND_WIDTH or arg_2_0.CLOSE_WIDTH

		setCanvasGroupAlpha(var_2_0:Find("close"), iter_2_0 == arg_2_0.index and 0 or 1)
		setText(var_2_0:Find("get/Text"), i18n("SardiniaSPCoreActivityUI_unlock"))
		onButton(arg_2_0, var_2_0, function()
			if arg_2_0.blockAnim then
				return
			end

			arg_2_0:SelectItem(iter_2_0)
		end, SFX_PANEL)
	end

	arg_2_0.ActionSequence = {}
end

function var_0_0.SetActivity(arg_5_0, arg_5_1)
	arg_5_0.activity = arg_5_1
end

function var_0_0.SetPtActivity(arg_6_0, arg_6_1)
	arg_6_0.ptActivity = arg_6_1

	setText(arg_6_0.countPT, arg_6_0.ptActivity.data1)
	setActive(arg_6_0.tipPT, Activity.IsActivityReady(arg_6_0.ptActivity))
end

function var_0_0.SetStoryActivity(arg_7_0, arg_7_1)
	arg_7_0.storyActivity = arg_7_1
	arg_7_0.storyList = arg_7_1:GetConfigClientSetting("story")
end

function var_0_0.SetTasksActivity(arg_8_0, arg_8_1)
	arg_8_0.tasksActivity = arg_8_1
end

function var_0_0.SelectItem(arg_9_0, arg_9_1)
	if arg_9_0.index == arg_9_1 then
		return
	end

	arg_9_0.index = arg_9_1
	arg_9_0.blockAnim = true

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.LTList or {}) do
		LeanTween.cancel(iter_9_1)
	end

	arg_9_0.LTList = {}

	for iter_9_2 = 1, arg_9_0.rtStoryItems.childCount do
		local var_9_0 = arg_9_0.rtStoryItems:GetChild(iter_9_2 - 1)
		local var_9_1 = var_9_0:GetComponent(typeof(LayoutElement))
		local var_9_2 = var_9_1.preferredWidth
		local var_9_3 = iter_9_2 == arg_9_1 and arg_9_0.EXPAND_WIDTH or arg_9_0.CLOSE_WIDTH

		if var_9_2 ~= var_9_3 then
			local var_9_4 = math.abs(var_9_3 - var_9_2) / arg_9_0.DURATION_PARAMETER

			table.insert(arg_9_0.LTList, LeanTween.value(go(var_9_0), var_9_2, var_9_3, var_9_4):setEase(LeanTweenType.easeOutSine):setOnUpdate(System.Action_float(function(arg_10_0)
				var_9_1.preferredWidth = arg_10_0
			end)).uniqueId)
			table.insert(arg_9_0.LTList, LeanTween.alphaCanvas(var_9_0:Find("close"):GetComponent(typeof(CanvasGroup)), iter_9_2 == arg_9_1 and 0 or 1, var_9_4):setEase(LeanTweenType.easeOutSine).uniqueId)
		end
	end

	local var_9_5 = pg.NewStoryMgr.GetInstance()

	if arg_9_0.index ~= 1 and arg_9_0.storyActivity.data1 > 0 and not var_9_5:IsPlayed(arg_9_0.storyList[arg_9_0.index - 1][1]) then
		arg_9_0:emit(BossRushVerSardiniaSPMediator.ON_ACTIVITY_UNLOCKSTOIRY, arg_9_0.storyActivity.id, var_9_5:StoryName2StoryId(arg_9_0.storyList[arg_9_0.index - 1][1]))
	else
		arg_9_0:UpdataStoryState()
	end
end

function var_0_0.didEnter(arg_11_0)
	onButton(arg_11_0, arg_11_0.btnBack, function()
		arg_11_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.btnHome, function()
		arg_11_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("SardiniaSPCoreActivityUI_help")
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.btnRank, function()
		arg_11_0:emit(BossRushVerSardiniaSPMediator.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.btnPT, function()
		arg_11_0:emit(BossRushVerSardiniaSPMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_11_0.ptActivity.id
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.btnTask, function()
		arg_11_0:emit(BossRushVerSardiniaSPMediator.GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.switchToggle:Find("Story"), function()
		if arg_11_0.blockAnim then
			return
		end

		arg_11_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.switchToggle:Find("Battle"), function()
		if arg_11_0.blockAnim then
			return
		end

		arg_11_0:SetDisplayMode(var_0_0.DISPLAY.STORY)
	end, SFX_PANEL)
	arg_11_0:SetDisplayMode(arg_11_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE)
end

function var_0_0.SetDisplayMode(arg_20_0, arg_20_1)
	arg_20_0.contextData.displayMode = arg_20_1

	arg_20_0:UpdateView()
end

function var_0_0.UpdateView(arg_21_0)
	local var_21_0 = arg_21_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	arg_21_0.switchToggle:Find(arg_21_0.contextData.displayMode):SetAsLastSibling()
	setActive(arg_21_0.rtPageBattle, var_21_0)
	setActive(arg_21_0.rtPageStory, not var_21_0)

	if var_21_0 then
		arg_21_0:UpdateBattle()
	else
		arg_21_0:UpdateStory()
	end

	arg_21_0:UpdateTipDisplay()
end

function var_0_0.UpdateBattle(arg_22_0)
	local var_22_0 = arg_22_0.activity
	local var_22_1 = arg_22_0.contextData.showFlash and underscore.to_array(var_22_0:GetPassCounts()) or nil

	arg_22_0.contextData.showFlash = nil

	local var_22_2 = {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0:getConfig("config_data")) do
		local var_22_3 = arg_22_0.seriesNodes[tostring(iter_22_1)]
		local var_22_4 = BossRushSeriesData.New({
			id = iter_22_1,
			actId = var_22_0.id
		})

		var_22_2[iter_22_0] = var_22_4

		local var_22_5 = var_22_4:IsUnlock(var_22_0)

		setActive(var_22_3:Find("lock"), not var_22_5)

		local var_22_6 = var_22_0:HasPassSeries(var_22_4.id)

		setActive(var_22_3:Find("finish"), var_22_6)
		setActive(var_22_3:Find("finish"):GetChild(0), var_22_1 and arg_22_0.contextData.passCounts and not table.contains(arg_22_0.contextData.passCounts, var_22_4.id) and table.contains(var_22_1, var_22_4.id))

		local var_22_7 = var_22_4:GetType() == BossRushSeriesData.TYPE.SP
		local var_22_8 = true

		if var_22_7 then
			setActive(var_22_3:Find("times"), var_22_5)

			local var_22_9 = var_22_0:GetUsedBonus()[iter_22_0] or 0
			local var_22_10 = var_22_4:GetMaxBonusCount()

			var_22_8 = var_22_10 - var_22_9 > 0

			setText(var_22_3:Find("times/Text"), i18n("series_enemy_SP_count") .. setColorStr(math.max(0, var_22_10 - var_22_9) .. "/" .. var_22_10, "#f77d24"))
		end

		onButton(arg_22_0, var_22_3, function()
			if not var_22_5 then
				local var_23_0 = var_22_4:GetPreSeriesId()
				local var_23_1 = BossRushSeriesData.New({
					id = var_23_0
				})

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_23_1:GetName()))

				return
			end

			if not var_22_8 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_SP_error"))

				return
			end

			local var_23_2 = {}
			local var_23_3

			if iter_22_0 > 1 and var_22_4:IsFleetsEmpty() then
				table.insert(var_23_2, function(arg_24_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("SardiniaSPCoreActivityUI_fleetconfirm"),
						onYes = function()
							var_22_4:CopyFleetsByOther(var_22_2[iter_22_0 - 1])
							arg_24_0()
						end,
						onNo = arg_24_0
					})
				end)
			end

			seriesAsync(var_23_2, function()
				arg_22_0:emit(BossRushVerSardiniaSPMediator.ON_FLEET_SELECT, var_22_4)
			end)
		end, SFX_PANEL)
	end
end

var_0_0.EXPAND_WIDTH = 628
var_0_0.CLOSE_WIDTH = 136
var_0_0.DURATION_PARAMETER = 1500

function var_0_0.UpdateStory(arg_27_0)
	if not arg_27_0.index then
		arg_27_0:SelectItem(1)
	else
		arg_27_0:UpdataStoryState()
	end
end

function var_0_0.UpdataStoryState(arg_28_0, arg_28_1)
	local var_28_0 = pg.NewStoryMgr.GetInstance()
	local var_28_1 = arg_28_1 and var_28_0:StoryId2StoryName(arg_28_1) or nil

	assert(not arg_28_1 or arg_28_0.storyList[arg_28_0.index - 1][1] == var_28_1)
	eachChild(arg_28_0.rtStoryItems, function(arg_29_0, arg_29_1)
		arg_29_1 = arg_29_1 + 1

		local var_29_0
		local var_29_1
		local var_29_2

		if arg_29_1 == 1 then
			var_29_0 = false
			var_29_2 = false
		else
			var_29_0 = arg_28_0.index == arg_29_1 and arg_28_1
			var_29_0 = var_29_0 or var_28_0:IsPlayed(arg_28_0.storyList[arg_29_1 - 1][1])
			var_29_2 = arg_28_0.storyActivity.data1 > 0
		end

		setActive(arg_29_0:Find("got"), var_29_0)
		setActive(arg_29_0:Find("get"), not var_29_0 and var_29_2)
	end)

	local var_28_2 = {}

	if arg_28_0.index == 1 then
		local var_28_3 = arg_28_0.activity:GetConfigClientSetting("openStory")

		if not var_28_0:IsPlayed(var_28_3) then
			table.insert(var_28_2, function(arg_30_0)
				var_28_0:Play(var_28_3, arg_30_0)
			end)
		end
	end

	if var_28_1 and not var_28_0:IsPlayed(var_28_1) then
		table.insert(var_28_2, function(arg_31_0)
			var_28_0:Play(var_28_1, arg_31_0)
		end)
	end

	local var_28_4 = arg_28_0.activity:GetConfigClientSetting("endStory")

	if not var_28_0:IsPlayed(var_28_4) and underscore.all(arg_28_0.storyList, function(arg_32_0)
		return var_28_0:IsPlayed(arg_32_0[1]) or arg_32_0[1] == var_28_1
	end) then
		table.insert(var_28_2, function(arg_33_0)
			var_28_0:Play(var_28_4, arg_33_0)
		end)
	end

	arg_28_0.blockAnim = false

	seriesAsync(var_28_2, function()
		arg_28_0:UpdateStoryTask()
	end)
end

function var_0_0.PlayStory(arg_35_0, arg_35_1, arg_35_2)
	if not arg_35_1 then
		return existCall(arg_35_2)
	end

	local var_35_0 = pg.NewStoryMgr.GetInstance()
	local var_35_1 = var_35_0:IsPlayed(arg_35_1)

	seriesAsync({
		function(arg_36_0)
			if var_35_1 then
				return arg_36_0()
			end

			local var_36_0 = tonumber(arg_35_1)

			if var_36_0 and var_36_0 > 0 then
				arg_35_0:emit(BossRushVerSardiniaSPMediator.ON_PERFORM_COMBAT, var_36_0)
			else
				var_35_0:Play(arg_35_1, arg_36_0)
			end
		end
	}, arg_35_2)
end

function var_0_0.UpdateStoryTask(arg_37_0)
	local var_37_0 = arg_37_0.activity:GetConfigClientSetting("tasks")[1]

	arg_37_0.storyTask = getProxy(TaskProxy):getTaskVO(var_37_0) or Task.New({
		submit_time = 1,
		id = var_37_0
	})

	local var_37_1 = arg_37_0.storyTask:getProgress()
	local var_37_2 = arg_37_0.storyTask:getTargetNumber()

	setText(arg_37_0.progressText, i18n("SardiniaSPCoreActivityUI_story_reward_count", arg_37_0.storyActivity.data1, var_37_1))

	local var_37_3 = arg_37_0.storyTask:getConfig("award_display")
	local var_37_4 = Drop.Create(var_37_3[1])
	local var_37_5 = arg_37_0.rtStoryAward:Find("IconTpl")

	updateDrop(var_37_5, var_37_4)
	onButton(arg_37_0, var_37_5, function()
		arg_37_0:emit(BaseUI.ON_DROP, var_37_4)
	end, SFX_PANEL)

	local var_37_6 = arg_37_0.storyTask:getTaskStatus()

	setActive(var_37_5:Find("get"), var_37_6 == 1)
	setActive(var_37_5:Find("got"), var_37_6 == 2)

	if var_37_6 == 1 then
		arg_37_0:emit(BossRushVerSardiniaSPMediator.ON_TASK_SUBMIT, arg_37_0.storyTask)
	end
end

function var_0_0.addbubbleMsgBoxList(arg_39_0, arg_39_1)
	local var_39_0 = #arg_39_0.ActionSequence == 0

	table.insertto(arg_39_0.ActionSequence, arg_39_1)

	if not var_39_0 then
		return
	end

	arg_39_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_40_0, arg_40_1)
	local var_40_0 = #arg_40_0.ActionSequence == 0

	table.insert(arg_40_0.ActionSequence, arg_40_1)

	if not var_40_0 then
		return
	end

	arg_40_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_41_0)
	if #arg_41_0.ActionSequence == 0 then
		return
	end

	local var_41_0

	local function var_41_1()
		local var_42_0 = arg_41_0.ActionSequence[1]

		if var_42_0 then
			var_42_0(function()
				table.remove(arg_41_0.ActionSequence, 1)
				var_41_1()
			end)
		end
	end

	var_41_1()
end

function var_0_0.CleanBubbleMsgbox(arg_44_0)
	table.clean(arg_44_0.ActionSequence)
end

function var_0_0.UpdateTipDisplay(arg_45_0)
	setActive(arg_45_0.rtToggleTip, arg_45_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE and arg_45_0:IsStoryTip())
	warning(arg_45_0.tasksActivity, Activity.IsActivityReady(arg_45_0.tasksActivity))
	setActive(arg_45_0.btnTask:Find("tip"), Activity.IsActivityReady(arg_45_0.tasksActivity))
end

function var_0_0.IsStoryTip(arg_46_0)
	local var_46_0 = pg.NewStoryMgr.GetInstance()

	if not var_46_0:IsPlayed(arg_46_0.activity:GetConfigClientSetting("openStory")) then
		return true
	end

	if Activity.IsActivityReady(arg_46_0.storyActivity) then
		return true
	end

	if not var_46_0:IsPlayed(arg_46_0.activity:GetConfigClientSetting("endStory")) and underscore.all(arg_46_0.storyList, function(arg_47_0)
		return var_46_0:IsPlayed(arg_47_0[1])
	end) then
		return true
	end

	local var_46_1 = arg_46_0.activity:GetConfigClientSetting("tasks")[1]
	local var_46_2 = var_46_1 and getProxy(TaskProxy):getTaskVO(var_46_1)

	if var_46_2 and var_46_2:getTaskStatus() == 1 then
		return true
	end

	return false
end

function var_0_0.willExit(arg_48_0)
	arg_48_0.contextData.passCounts = underscore.to_array(arg_48_0.activity:GetPassCounts())
end

return var_0_0
