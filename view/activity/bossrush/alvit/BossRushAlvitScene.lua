local var_0_0 = class("BossRushAlvitScene", import("view.base.BaseUI"))

var_0_0.DISPLAY = {
	STORY = 2,
	BATTLE = 1
}

function var_0_0.getUIName(arg_1_0)
	return "BossRushAlvitUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.top = arg_2_0._tf:Find("Top")
	arg_2_0.ptBtn = arg_2_0.top:Find("right/pt")
	arg_2_0.ptText = arg_2_0.ptBtn:Find("value/Text")
	arg_2_0.ptTip = arg_2_0.ptBtn:Find("tip")
	arg_2_0.rankBtn = arg_2_0.top:Find("right/rank")
	arg_2_0.taskBtn = arg_2_0.top:Find("right/task")
	arg_2_0.taskTip = arg_2_0.taskBtn:Find("tip")
	arg_2_0.seriesNodes = {}

	local var_2_0 = arg_2_0._tf:Find("Battle/Nodes")

	for iter_2_0 = 1, var_2_0.childCount do
		local var_2_1 = var_2_0:GetChild(iter_2_0 - 1)

		if isActive(var_2_1) then
			table.insert(arg_2_0.seriesNodes, var_2_1)
		end
	end

	arg_2_0.nodes = {}

	for iter_2_1 = 1, arg_2_0._tf:Find("Story/Nodes").childCount do
		local var_2_2 = arg_2_0._tf:Find("Story/Nodes"):GetChild(iter_2_1 - 1)

		arg_2_0.nodes[var_2_2.name] = var_2_2
	end

	arg_2_0.progressText = arg_2_0._tf:Find("Story/Desc/Text")
	arg_2_0.storyAward = arg_2_0._tf:Find("Story/Award")
	arg_2_0.ActionSequence = {}
end

function var_0_0.SetActivity(arg_3_0, arg_3_1)
	arg_3_0.activity = arg_3_1
end

function var_0_0.SetPtActivity(arg_4_0, arg_4_1)
	arg_4_0.ptActivity = arg_4_1
	arg_4_0.ptData = ActivityPtData.New(arg_4_0.ptActivity)
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.top:Find("top/back"), function()
		arg_5_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.top:Find("top/home"), function()
		arg_5_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.rankBtn, function()
		arg_5_0:emit(BossRushAlvitMediator.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.ptBtn, function()
		arg_5_0:emit(BossRushAlvitMediator.GO_SUBLAYER, Context.New({
			mediator = ChildishnessSchoolPtMediator,
			viewComponent = ChildishnessSchoolPtPage
		}))
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.taskBtn, function()
		arg_5_0:emit(BossRushAlvitMediator.GO_SUBLAYER, Context.New({
			mediator = ChildishnessSchoolTaskMediator,
			viewComponent = ChildishnessSchoolTaskPage
		}))
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Battle/Story"), function()
		arg_5_0:SetDisplayMode(var_0_0.DISPLAY.STORY)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Story/Battle"), function()
		arg_5_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
	end, SFX_PANEL)

	local var_5_0 = arg_5_0.activity:getConfig("config_client").storys or {}

	arg_5_0.storyNodesDict = {}

	_.each(var_5_0, function(arg_13_0)
		arg_5_0.storyNodesDict[arg_13_0] = BossRushStoryNode.New({
			id = arg_13_0
		})
	end)
	arg_5_0:UpdateStoryTask()

	local var_5_1 = arg_5_0.contextData.displayMode or BossRushAlvitScene.DISPLAY.BATTLE

	arg_5_0.contextData.displayMode = nil

	arg_5_0:SetDisplayMode(var_5_1)
end

function var_0_0.getBGM(arg_14_0)
	local var_14_0 = pg.voice_bgm[arg_14_0.__cname]

	if not var_14_0 then
		return nil
	end

	local var_14_1 = var_14_0.bgm
	local var_14_2 = "story-richang-11"
	local var_14_3 = arg_14_0.contextData.displayMode

	if var_14_3 == var_0_0.DISPLAY.BATTLE then
		return var_14_1
	elseif var_14_3 == var_0_0.DISPLAY.STORY then
		return var_14_2
	end
end

function var_0_0.SetDisplayMode(arg_15_0, arg_15_1)
	if arg_15_1 == arg_15_0.contextData.displayMode then
		return
	end

	arg_15_0.contextData.displayMode = arg_15_1

	arg_15_0:PlayBGM()
	arg_15_0:UpdateView()
end

function var_0_0.UpdateView(arg_16_0)
	local var_16_0 = arg_16_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_16_0._tf:Find("Battle"), var_16_0)
	setActive(arg_16_0._tf:Find("Story"), not var_16_0)
	arg_16_0:UpdateBattle()

	if not var_16_0 then
		arg_16_0:UpdateStory()
	end

	arg_16_0:UpdateTaskTip()

	local var_16_1 = arg_16_0.contextData.displayMode

	arg_16_0:addbubbleMsgBoxList({
		function(arg_17_0)
			local var_17_0

			if var_16_1 == var_0_0.DISPLAY.BATTLE then
				var_17_0 = arg_16_0.activity:getConfig("config_client").openActivityStory
			elseif var_16_1 == var_0_0.DISPLAY.STORY then
				var_17_0 = arg_16_0.activity:getConfig("config_client").openStory
			end

			arg_16_0:PlayStory(var_17_0, arg_17_0)
		end,
		function(arg_18_0)
			if underscore.all(underscore.values(arg_16_0.storyNodesDict), function(arg_19_0)
				return arg_19_0:IsReaded()
			end) and arg_16_0.storyTask and arg_16_0.storyTask:getTaskStatus() == 2 then
				local var_18_0 = arg_16_0.activity:getConfig("config_client").endStory

				arg_16_0:PlayStory(var_18_0, function(arg_20_0)
					arg_18_0()

					if arg_20_0 then
						arg_16_0:UpdateView()
					end
				end)

				return
			end

			arg_18_0()
		end
	})
end

function var_0_0.UpdateBattle(arg_21_0)
	local var_21_0 = arg_21_0.activity
	local var_21_1 = var_21_0:GetActiveSeriesIds()

	table.Foreach(arg_21_0.seriesNodes, function(arg_22_0, arg_22_1)
		local var_22_0 = var_21_1[arg_22_0]
		local var_22_1 = BossRushSeriesData.New({
			id = var_22_0,
			actId = var_21_0.id
		})
		local var_22_2 = var_22_1:IsUnlock(var_21_0)

		setActive(arg_22_1, var_22_2)

		local var_22_3 = var_22_1:GetType() == BossRushSeriesData.TYPE.SP
		local var_22_4 = true

		if var_22_3 then
			local var_22_5 = var_21_0:GetUsedBonus()[arg_22_0] or 0
			local var_22_6 = var_22_1:GetMaxBonusCount()

			setText(arg_22_1:Find("count/Text"), i18n("series_enemy_SP_count") .. math.max(0, var_22_6 - var_22_5) .. "/" .. var_22_6)

			var_22_4 = var_22_6 - var_22_5 > 0
		end

		local function var_22_7()
			if not var_22_2 then
				local var_23_0 = var_22_1:GetPreSeriesId()
				local var_23_1 = BossRushSeriesData.New({
					id = var_23_0
				})

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_23_1:GetName()))

				return
			end

			if not var_22_4 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_SP_error"))

				return
			end

			arg_21_0:emit(BossRushAlvitMediator.ON_FLEET_SELECT, var_22_1)
		end

		onButton(arg_21_0, arg_22_1:Find("icon"), function()
			var_22_7()
		end, SFX_PANEL)
		onButton(arg_21_0, arg_22_1:Find("text"), function()
			var_22_7()
		end, SFX_PANEL)
	end)
	setText(arg_21_0.ptText, arg_21_0.ptActivity.data1)
	arg_21_0:UpdateTpTip()
	setActive(arg_21_0._tf:Find("Battle/Story/new"), arg_21_0.storyTask and arg_21_0.storyTask:getTaskStatus() ~= 2)
end

function var_0_0.UpdateTpTip(arg_26_0)
	setActive(arg_26_0.ptTip, Activity.IsActivityReady(arg_26_0.ptActivity))
end

function var_0_0.UpdateStory(arg_27_0)
	local var_27_0 = pg.NewStoryMgr.GetInstance()
	local var_27_1 = 0
	local var_27_2 = 0

	table.Foreach(arg_27_0.storyNodesDict, function(arg_28_0, arg_28_1)
		local var_28_0 = arg_27_0.nodes[tostring(arg_28_1.id)]
		local var_28_1 = isActive(var_28_0)
		local var_28_2 = arg_28_1:IsActive(arg_27_0.activity, arg_27_0.ptActivity)

		if var_28_2 then
			if not var_28_1 then
				setActive(var_28_0, true)
			end

			setActive(var_28_0, true)

			if not var_28_1 then
				var_28_0:GetComponent(typeof(Animation)):Play("anim_kinder_bossrush_story_tip")
			end
		else
			setActive(var_28_0, false)
		end

		setText(var_28_0:Find("main/Text"), arg_28_1:GetName())

		local var_28_3 = arg_28_1:GetType()

		if var_28_3 == BossRushStoryNode.NODE_TYPE.NORMAL then
			setActive(var_28_0:Find("tags/story"), true)
			setActive(var_28_0:Find("tags/battle"), false)
		elseif var_28_3 == BossRushStoryNode.NODE_TYPE.EVENT then
			-- block empty
		elseif var_28_3 == BossRushStoryNode.NODE_TYPE.BATTLE then
			setActive(var_28_0:Find("tags/story"), false)
			setActive(var_28_0:Find("tags/battle"), true)
		end

		local var_28_4 = arg_28_1:IsReaded()

		var_27_1 = var_27_1 + (var_28_4 and 1 or 0)
		var_27_2 = var_27_2 + 1

		setActive(var_28_0:Find("main"), not var_28_4)
		setActive(var_28_0:Find("finish"), var_28_4)
		setActive(var_28_0:Find("finish_tag"), var_28_4)
		onButton(arg_27_0, var_28_0, function()
			if not var_28_2 or var_28_4 then
				return
			end

			local var_29_0 = arg_28_1:GetStory()

			arg_27_0:PlayStory(var_29_0, function()
				arg_27_0:UpdateView()
			end)
		end)
	end)
	setText(arg_27_0.progressText, var_27_1 .. "/" .. var_27_2)
	setActive(arg_27_0.storyAward, tobool(arg_27_0.storyTask))

	if arg_27_0.storyTask then
		local var_27_3 = arg_27_0.storyTask:getConfig("award_display")
		local var_27_4 = Drop.New({
			type = var_27_3[1][1],
			id = var_27_3[1][2],
			count = var_27_3[1][3]
		})

		updateDrop(arg_27_0.storyAward:GetChild(0), var_27_4)

		local var_27_5 = arg_27_0.storyTask:getTaskStatus()

		setActive(arg_27_0.storyAward:Find("get"), var_27_5 == 1)
		setActive(arg_27_0.storyAward:Find("got"), var_27_5 == 2)

		if var_27_5 == 1 then
			arg_27_0:emit(BossRushAlvitMediator.ON_TASK_SUBMIT, arg_27_0.storyTask)
		end

		onButton(arg_27_0, arg_27_0.storyAward, function()
			arg_27_0:emit(BaseUI.ON_DROP, var_27_4)
		end)
	end
end

function var_0_0.PlayStory(arg_32_0, arg_32_1, arg_32_2)
	if not arg_32_1 then
		return existCall(arg_32_2)
	end

	local var_32_0 = pg.NewStoryMgr.GetInstance()
	local var_32_1 = var_32_0:IsPlayed(arg_32_1)

	seriesAsync({
		function(arg_33_0)
			if var_32_1 then
				return arg_33_0()
			end

			local var_33_0 = tonumber(arg_32_1)

			if var_33_0 and var_33_0 > 0 then
				arg_32_0:emit(BossRushAlvitMediator.ON_PERFORM_COMBAT, var_33_0)
			else
				var_32_0:Play(arg_32_1, arg_33_0)
			end
		end,
		function(arg_34_0, ...)
			existCall(arg_32_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_35_0)
	local var_35_0 = arg_35_0.activity:getConfig("config_client").tasks[1]

	arg_35_0.storyTask = getProxy(TaskProxy):getTaskVO(var_35_0) or Task.New({
		submit_time = 1,
		id = var_35_0
	})
end

function var_0_0.UpdateTaskTip(arg_36_0)
	setActive(arg_36_0.taskTip, Activity.IsActivityReady(getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_TASK_ACT_ID)))
end

function var_0_0.addbubbleMsgBoxList(arg_37_0, arg_37_1)
	local var_37_0 = #arg_37_0.ActionSequence == 0

	table.insertto(arg_37_0.ActionSequence, arg_37_1)

	if not var_37_0 then
		return
	end

	arg_37_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_38_0, arg_38_1)
	local var_38_0 = #arg_38_0.ActionSequence == 0

	table.insert(arg_38_0.ActionSequence, arg_38_1)

	if not var_38_0 then
		return
	end

	arg_38_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_39_0)
	if #arg_39_0.ActionSequence == 0 then
		return
	end

	local var_39_0

	local function var_39_1()
		local var_40_0 = arg_39_0.ActionSequence[1]

		if var_40_0 then
			var_40_0(function()
				table.remove(arg_39_0.ActionSequence, 1)
				var_39_1()
			end)
		end
	end

	var_39_1()
end

function var_0_0.onBackPressed(arg_42_0)
	arg_42_0:emit(BossRushAlvitMediator.GO_SCENE, SCENE.KINDERGARTEN, {
		isBack = true
	})
end

function var_0_0.CleanBubbleMsgbox(arg_43_0)
	table.clean(arg_43_0.ActionSequence)
end

return var_0_0
