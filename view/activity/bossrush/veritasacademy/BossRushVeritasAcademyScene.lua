local var_0_0 = class("BossRushVeritasAcademyScene", import("view.activity.BossRush.BossRushBaseScene"))

var_0_0.DISPLAY = {
	STORY = "Story",
	BATTLE = "Battle"
}
var_0_0.STORY_ICON2_NODE_IDS = {
	[202] = true,
	[204] = true,
	[203] = true
}

function var_0_0.getUIName(arg_1_0)
	return "BossRushVeritasAcademyUI"
end

function var_0_0.GetAtalsName(arg_2_0)
	return "ui/" .. arg_2_0:getUIName() .. "_atlas"
end

function var_0_0.SetActivity(arg_3_0, arg_3_1)
	arg_3_0.activity = arg_3_1
end

function var_0_0.SetPtActivity(arg_4_0, arg_4_1)
	arg_4_0.ptActivity = arg_4_1
	arg_4_0.ptData = ActivityPtData.New(arg_4_0.ptActivity)
end

function var_0_0.init(arg_5_0)
	arg_5_0.top = arg_5_0._tf:Find("Top")
	arg_5_0.ptBtn = arg_5_0.top:Find("right/pt")
	arg_5_0.ptTip = arg_5_0.ptBtn:Find("tip")
	arg_5_0.rankBtn = arg_5_0.top:Find("right/rank")
	arg_5_0.taskBtn = arg_5_0.top:Find("right/task")
	arg_5_0.taskTip = arg_5_0.taskBtn:Find("tip")
	arg_5_0.rightPanel = arg_5_0.top:Find("right")
	arg_5_0.storyAward = arg_5_0.top:Find("bottom/Award")
	arg_5_0.progressText = arg_5_0.storyAward:Find("desc")
	arg_5_0.seriesNodes = {}

	eachChild(arg_5_0._tf:Find("Battle/Nodes"), function(arg_6_0, arg_6_1)
		arg_5_0.seriesNodes[arg_6_0.name] = arg_6_0
	end)

	arg_5_0.nodes = {}
	arg_5_0.storyScrollRect = arg_5_0._tf:Find("Story/View"):GetComponent(typeof(ScrollRect))

	eachChild(arg_5_0._tf:Find("Story/View/Nodes"), function(arg_7_0, arg_7_1)
		setActive(arg_7_0, false)
		eachChild(arg_7_0, function(arg_8_0, arg_8_1)
			arg_5_0.nodes[arg_8_0.name] = arg_8_0
		end)
	end)

	arg_5_0.switchToggle = arg_5_0.top:Find("bottom/switch_toggle")
	arg_5_0.ActionSequence = {}

	arg_5_0:UpdateRatioScale()

	arg_5_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_9_0, arg_9_1)
		arg_5_0:UpdateRatioScale()
	end)
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.top:Find("top/back"), function()
		arg_10_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.top:Find("top/home"), function()
		arg_10_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.top:Find("top/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("zhenli_series_help")
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.rankBtn, function()
		arg_10_0:emit(BossRushVeritasAcademyMediator.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.ptBtn, function()
		arg_10_0:emit(BossRushVeritasAcademyMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_10_0.ptActivity.id
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.taskBtn, function()
		arg_10_0:emit(BossRushVeritasAcademyMediator.GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.switchToggle:Find("Story"), function(arg_17_0)
		if arg_17_0 then
			arg_10_0:SetDisplayMode(var_0_0.DISPLAY.STORY)
		end
	end, SFX_PANEL)
	onToggle(arg_10_0, arg_10_0.switchToggle:Find("Battle"), function(arg_18_0)
		if arg_18_0 then
			arg_10_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
		end
	end, SFX_PANEL)

	arg_10_0.storyNodesDict = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.activity:getConfig("config_client").storys) do
		arg_10_0.storyNodesDict[iter_10_1] = BossRushStoryNode.New({
			id = iter_10_1
		})
	end

	triggerToggle(arg_10_0.switchToggle:Find(arg_10_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE), true)
end

function var_0_0.getBGM(arg_19_0)
	return arg_19_0.contextData.displayMode == var_0_0.DISPLAY.STORY and "story-richang-afterschool" or "story-enzecheng-theme"
end

function var_0_0.getBG(arg_20_0)
	return arg_20_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE and "bg1" or "bg2"
end

function var_0_0.SetDisplayMode(arg_21_0, arg_21_1)
	arg_21_0.contextData.displayMode = arg_21_1

	arg_21_0:UpdateView()
end

function var_0_0.UpdateRatioScale(arg_22_0, arg_22_1)
	local var_22_0

	for iter_22_0, iter_22_1 in ipairs({
		"Mask",
		"Battle",
		"Story"
	}) do
		local var_22_1 = arg_22_0._tf:Find(iter_22_1)
		local var_22_2 = var_22_1.rect.height

		var_22_0 = var_22_0 or var_22_2 > 1440 and var_22_2 / 1440 or 1

		setLocalScale(var_22_1, {
			x = var_22_0,
			y = var_22_0
		})
	end
end

function var_0_0.UpdateView(arg_23_0)
	local var_23_0 = arg_23_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_23_0._tf:Find("Battle"), var_23_0)
	setActive(arg_23_0._tf:Find("Story"), not var_23_0)
	setActive(arg_23_0.storyAward, not var_23_0)
	setActive(arg_23_0.rightPanel, var_23_0)

	if var_23_0 then
		arg_23_0:UpdateBattle()
	else
		arg_23_0:UpdateStory()
	end

	arg_23_0:UpdateStoryTask()
	arg_23_0:CheckStoryTask()

	local var_23_1 = arg_23_0:getBG()

	eachChild(arg_23_0._tf:Find("Mask"), function(arg_24_0, arg_24_1)
		setActive(arg_24_0, arg_24_0.name == var_23_1)
	end)
	arg_23_0:PlayBGM()
	setText(arg_23_0.ptBtn:Find("value/Text"), arg_23_0.ptActivity.data1)
	setActive(arg_23_0.ptTip, Activity.IsActivityReady(arg_23_0.ptActivity))

	local var_23_2 = arg_23_0.contextData.displayMode

	arg_23_0:addbubbleMsgBoxList({
		function(arg_25_0)
			local var_25_0

			if var_23_2 == var_0_0.DISPLAY.BATTLE then
				var_25_0 = arg_23_0.activity:getConfig("config_client").openActivityStory
			elseif var_23_2 == var_0_0.DISPLAY.STORY then
				var_25_0 = arg_23_0.activity:getConfig("config_client").openStory
			end

			arg_23_0:PlayStory(var_25_0, arg_25_0)
		end,
		function(arg_26_0)
			if underscore.all(underscore.values(arg_23_0.storyNodesDict), function(arg_27_0)
				return arg_27_0:IsReaded()
			end) and arg_23_0.storyTask and arg_23_0.storyTask:getTaskStatus() == 2 then
				local var_26_0 = arg_23_0.activity:getConfig("config_client").endStory

				arg_23_0:PlayStory(var_26_0, arg_26_0)
			else
				arg_26_0()
			end
		end
	})
end

function var_0_0.UpdateBattle(arg_28_0)
	local var_28_0 = arg_28_0.activity
	local var_28_1 = var_28_0:GetActiveSeriesIds()

	for iter_28_0, iter_28_1 in ipairs(var_28_1) do
		local var_28_2 = arg_28_0.seriesNodes[tostring(iter_28_1)]
		local var_28_3 = BossRushSeriesData.New({
			id = iter_28_1,
			actId = var_28_0.id
		})
		local var_28_4 = var_28_3:IsUnlock(var_28_0)

		setActive(var_28_2, var_28_4)

		local var_28_5 = var_28_2:Find("main")

		setText(var_28_5:Find("Text"), var_28_3:GetName())

		if var_28_3:GetType() == BossRushSeriesData.TYPE.SP and not IsNil(var_28_5:Find("times")) then
			local var_28_6 = var_28_0:GetUsedBonus()[iter_28_0] or 0
			local var_28_7 = var_28_3:GetMaxBonusCount()

			setText(var_28_5:Find("times/Text"), i18n("series_enemy_SP_count") .. math.max(0, var_28_7 - var_28_6) .. "/" .. var_28_7)
		end

		onButton(arg_28_0, var_28_2, function()
			if not var_28_4 then
				local var_29_0 = var_28_3:GetPreSeriesId()
				local var_29_1 = BossRushSeriesData.New({
					id = var_29_0
				})

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_29_1:GetName()))

				return
			end

			arg_28_0:emit(BossRushVeritasAcademyMediator.ON_FLEET_SELECT, var_28_3)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateStoryIcon(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_2:Find("main/icon")
	local var_30_1 = var_30_0:Find("story")
	local var_30_2 = var_30_0:Find("battle")

	if var_0_0.STORY_ICON2_NODE_IDS[arg_30_1.id] then
		setActive(var_30_1, true)
		setActive(var_30_2, false)
		GetImageSpriteFromAtlasAsync(arg_30_0:GetAtalsName(), "icon_story_2", var_30_1)

		return
	end

	local var_30_3 = arg_30_1:GetType()

	setActive(var_30_1, var_30_3 == BossRushStoryNode.NODE_TYPE.NORMAL)
	setActive(var_30_2, var_30_3 == BossRushStoryNode.NODE_TYPE.BATTLE)
end

function var_0_0.UpdateStory(arg_31_0)
	local var_31_0 = pg.NewStoryMgr.GetInstance()
	local var_31_1 = 0
	local var_31_2 = 0

	for iter_31_0, iter_31_1 in pairs(arg_31_0.storyNodesDict) do
		local var_31_3 = arg_31_0.nodes[tostring(iter_31_1.id)]
		local var_31_4 = iter_31_1:IsActive(arg_31_0.activity, arg_31_0.ptActivity)

		setActive(var_31_3, var_31_4)

		if var_31_4 then
			setActive(var_31_3.parent, true)
		end

		setText(var_31_3:Find("main/Text"), iter_31_1:GetName())

		local var_31_5 = iter_31_1:IsReaded()
		local var_31_6 = iter_31_1:IsLockBranchType(arg_31_0.activity, arg_31_0.ptActivity)

		var_31_1 = var_31_1 + (var_31_5 and 1 or 0)
		var_31_2 = var_31_2 + 1

		setActive(var_31_3:Find("main/bg/normal"), not var_31_5 and not var_31_6)
		setActive(var_31_3:Find("main/bg/finished"), var_31_5)
		setActive(var_31_3:Find("main/bg/lock"), var_31_6)
		setActive(var_31_3:Find("main/icon"), not var_31_6)
		arg_31_0:UpdateStoryIcon(iter_31_1, var_31_3)
		eachChild(var_31_3:Find("line"), function(arg_32_0, arg_32_1)
			eachChild(arg_32_0, function(arg_33_0, arg_33_1)
				setImageColor(arg_33_0, Color.NewHex(var_31_5 and "#0056b9" or "#45556f"))
				setImageAlpha(arg_33_0, var_31_6 and 0.5 or 1)
			end)
		end)
		onButton(arg_31_0, var_31_3, function()
			if not var_31_4 then
				return
			end

			local var_34_0 = iter_31_1:GetStory()

			arg_31_0:PlayStory(var_34_0, function()
				arg_31_0:UpdateView()
			end, iter_31_1, true)
		end)
	end

	setText(arg_31_0.progressText, i18n("guaitan_story_reward_count"))
	setText(findTF(arg_31_0.progressText, "progress"), setColorStr(var_31_1, "#ffffff") .. "/" .. var_31_2)
	arg_31_0:UpdateStoryTask()
	scrollTo(arg_31_0.storyScrollRect, 1, 0)
end

function var_0_0.PlayStory(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	if not arg_36_1 then
		return existCall(arg_36_2)
	end

	local var_36_0 = pg.NewStoryMgr.GetInstance()

	seriesAsync({
		function(arg_37_0)
			local var_37_0 = tonumber(arg_36_1)

			if var_37_0 and var_37_0 > 0 then
				arg_36_0:emit(BossRushVeritasAcademyMediator.ON_PERFORM_COMBAT, var_37_0)
			else
				var_36_0:Play(arg_36_1, function(arg_38_0, arg_38_1)
					if arg_36_3 and arg_38_1 then
						BossRushStoryNode.SetLocalBranchFlag(arg_36_0.activity.id, arg_36_3.id, arg_38_1)
					end

					arg_37_0()
				end, arg_36_4)
			end
		end
	}, arg_36_2)
end

function var_0_0.UpdateStoryTask(arg_39_0)
	local var_39_0 = arg_39_0.activity:getConfig("config_client").tasks[1]

	arg_39_0.storyTask = getProxy(TaskProxy):getTaskVO(var_39_0) or Task.New({
		submit_time = 1,
		id = var_39_0
	})

	setActive(arg_39_0.switchToggle:Find("Story/tip"), arg_39_0.storyTask and arg_39_0.storyTask:getTaskStatus() ~= 2)
	setActive(arg_39_0.taskTip, Activity.IsActivityReady(getProxy(ActivityProxy):getActivityById(ActivityConst.VERITASACADEMY_BOSS_RUSH_TASK_ACT_ID)))

	local var_39_1 = arg_39_0.storyTask:getConfig("award_display")
	local var_39_2 = Drop.Create(var_39_1[1])
	local var_39_3 = arg_39_0.storyAward:Find("award_bg")

	updateDrop(var_39_3:Find("IconTpl"), var_39_2)

	local var_39_4 = arg_39_0.storyTask:getTaskStatus()

	setActive(var_39_3:Find("get"), var_39_4 == 1)
	setActive(var_39_3:Find("got"), var_39_4 == 2)
end

function var_0_0.CheckStoryTask(arg_40_0)
	if arg_40_0.storyTask:getTaskStatus() == 1 then
		arg_40_0:emit(BossRushVeritasAcademyMediator.ON_TASK_SUBMIT, arg_40_0.storyTask)
	end
end

function var_0_0.addbubbleMsgBoxList(arg_41_0, arg_41_1)
	local var_41_0 = #arg_41_0.ActionSequence == 0

	table.insertto(arg_41_0.ActionSequence, arg_41_1)

	if not var_41_0 then
		return
	end

	arg_41_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_42_0, arg_42_1)
	local var_42_0 = #arg_42_0.ActionSequence == 0

	table.insert(arg_42_0.ActionSequence, arg_42_1)

	if not var_42_0 then
		return
	end

	arg_42_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_43_0)
	if #arg_43_0.ActionSequence == 0 then
		return
	end

	local var_43_0

	local function var_43_1()
		local var_44_0 = arg_43_0.ActionSequence[1]

		if var_44_0 then
			var_44_0(function()
				table.remove(arg_43_0.ActionSequence, 1)
				var_43_1()
			end)
		end
	end

	var_43_1()
end

function var_0_0.CleanBubbleMsgbox(arg_46_0)
	table.clean(arg_46_0.ActionSequence)
end

function var_0_0.willExit(arg_47_0)
	if arg_47_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_47_0.camEventId)

		arg_47_0.camEventId = nil
	end
end

return var_0_0
