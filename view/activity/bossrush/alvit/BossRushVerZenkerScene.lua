local var_0_0 = class("BossRushVerZenkerScene", import("view.base.BaseUI"))

var_0_0.DISPLAY = {
	STORY = "Story",
	BATTLE = "Battle"
}

function var_0_0.getUIName(arg_1_0)
	return "BossRushVerZenkerUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.top = arg_2_0._tf:Find("Top")
	arg_2_0.ptBtn = arg_2_0.top:Find("right/pt")

	setText(arg_2_0.ptBtn:Find("Text"), i18n("zengke_series_pt"))
	setText(arg_2_0.ptBtn:Find("Text/en"), i18n("zengke_series_pt_small"))

	arg_2_0.ptText = arg_2_0.ptBtn:Find("value/Text")
	arg_2_0.ptTip = arg_2_0.ptBtn:Find("tip")
	arg_2_0.rankBtn = arg_2_0.top:Find("right/rank")

	setText(arg_2_0.rankBtn:Find("Text"), i18n("zengke_series_rank"))
	setText(arg_2_0.rankBtn:Find("Text/en"), i18n("zengke_series_rank_small"))

	arg_2_0.taskBtn = arg_2_0.top:Find("right/task")

	setText(arg_2_0.taskBtn:Find("Text"), i18n("zengke_series_task"))
	setText(arg_2_0.taskBtn:Find("Text/en"), i18n("zengke_series_task_small"))

	arg_2_0.taskTip = arg_2_0.taskBtn:Find("tip")
	arg_2_0.seriesNodes = {}

	eachChild(arg_2_0._tf:Find("Battle/Nodes"), function(arg_3_0, arg_3_1)
		arg_2_0.seriesNodes[arg_3_0.name] = arg_3_0
	end)

	arg_2_0.nodes = {}

	eachChild(arg_2_0._tf:Find("Story/Nodes"), function(arg_4_0, arg_4_1)
		arg_2_0.nodes[arg_4_0.name] = arg_4_0
	end)

	arg_2_0.storyAward = arg_2_0.top:Find("bottom/Award")
	arg_2_0.progressText = arg_2_0.storyAward:Find("desc")
	arg_2_0.switchToggle = arg_2_0.top:Find("bottom/switch_toggle")
	arg_2_0.ActionSequence = {}

	arg_2_0:UpdateRatioScale()

	arg_2_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_5_0, arg_5_1)
		arg_2_0:UpdateRatioScale()
	end)
end

function var_0_0.SetActivity(arg_6_0, arg_6_1)
	arg_6_0.activity = arg_6_1
end

function var_0_0.SetPtActivity(arg_7_0, arg_7_1)
	arg_7_0.ptActivity = arg_7_1
	arg_7_0.ptData = ActivityPtData.New(arg_7_0.ptActivity)
end

function var_0_0.didEnter(arg_8_0)
	onButton(arg_8_0, arg_8_0.top:Find("top/back"), function()
		arg_8_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.top:Find("top/home"), function()
		arg_8_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.top:Find("top/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("zengke_series_help")
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.rankBtn, function()
		arg_8_0:emit(BossRushVerZenkerMediator.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.ptBtn, function()
		arg_8_0:emit(BossRushVerZenkerMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_8_0.ptActivity.id
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.taskBtn, function()
		arg_8_0:emit(BossRushVerZenkerMediator.GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onToggle(arg_8_0, arg_8_0.switchToggle:Find("Story"), function(arg_15_0)
		if arg_15_0 then
			if arg_8_0.blockAnim then
				arg_8_0.blockAnim = false
			else
				quickPlayAnimation(arg_8_0._tf, "anim_BRVZ_change")
			end

			arg_8_0:SetDisplayMode(var_0_0.DISPLAY.STORY)
		end
	end, SFX_PANEL)
	onToggle(arg_8_0, arg_8_0.switchToggle:Find("Battle"), function(arg_16_0)
		if arg_16_0 then
			if arg_8_0.blockAnim then
				arg_8_0.blockAnim = false
			else
				quickPlayAnimation(arg_8_0._tf, "anim_BRVZ_change")
			end

			arg_8_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
		end
	end, SFX_PANEL)

	arg_8_0.storyNodesDict = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.activity:getConfig("config_client").storys) do
		arg_8_0.storyNodesDict[iter_8_1] = BossRushStoryNode.New({
			id = iter_8_1
		})
	end

	arg_8_0.blockAnim = true

	triggerToggle(arg_8_0.switchToggle:Find(arg_8_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE), true)
end

function var_0_0.getBGM(arg_17_0)
	if arg_17_0.contextData.displayMode ~= var_0_0.DISPLAY.STORY then
		return var_0_0.super.getBGM(arg_17_0)
	else
		local var_17_0 = arg_17_0.activity:getConfig("config_client").storybgm
		local var_17_1 = pg.TimeMgr.GetInstance():GetServerHour()
		local var_17_2 = var_17_0[#var_17_0][2]

		for iter_17_0, iter_17_1 in ipairs(var_17_0) do
			if var_17_1 < iter_17_1[1] then
				break
			else
				var_17_2 = iter_17_1[2]
			end
		end

		return var_17_2
	end
end

function var_0_0.getBG(arg_18_0)
	if arg_18_0.contextData.displayMode ~= var_0_0.DISPLAY.STORY then
		local var_18_0 = arg_18_0.activity:getConfig("config_client").levelbg
		local var_18_1 = pg.TimeMgr.GetInstance():GetServerHour()
		local var_18_2 = var_18_0[#var_18_0][2]

		for iter_18_0, iter_18_1 in ipairs(var_18_0) do
			if var_18_1 < iter_18_1[1] then
				break
			else
				var_18_2 = iter_18_1[2]
			end
		end

		return var_18_2
	else
		local var_18_3 = arg_18_0.activity:getConfig("config_client").storybg
		local var_18_4
		local var_18_5 = pg.NewStoryMgr.GetInstance()

		for iter_18_2, iter_18_3 in ipairs(var_18_3) do
			if iter_18_3[1] == "default" or var_18_5:IsPlayed(iter_18_3[1]) then
				var_18_4 = iter_18_3[2]
			else
				break
			end
		end

		return var_18_4
	end
end

function var_0_0.SetDisplayMode(arg_19_0, arg_19_1)
	arg_19_0.contextData.displayMode = arg_19_1

	arg_19_0:UpdateView()
end

function var_0_0.UpdateRatioScale(arg_20_0, arg_20_1)
	local var_20_0

	for iter_20_0, iter_20_1 in ipairs({
		"Mask",
		"Battle",
		"Story"
	}) do
		local var_20_1 = arg_20_0._tf:Find(iter_20_1)
		local var_20_2 = var_20_1.rect.height

		var_20_0 = var_20_0 or var_20_2 > 1440 and var_20_2 / 1440 or 1

		setLocalScale(var_20_1, {
			x = var_20_0,
			y = var_20_0
		})
	end
end

function var_0_0.UpdateView(arg_21_0)
	local var_21_0 = arg_21_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_21_0._tf:Find("Battle"), var_21_0)
	setActive(arg_21_0._tf:Find("Story"), not var_21_0)
	setActive(arg_21_0.storyAward, not var_21_0)

	if var_21_0 then
		arg_21_0:UpdateBattle()
	else
		arg_21_0:UpdateStory()
	end

	arg_21_0:UpdateStoryTask()

	local var_21_1 = arg_21_0:getBG()

	eachChild(arg_21_0._tf:Find("Mask"), function(arg_22_0, arg_22_1)
		setActive(arg_22_0, arg_22_0.name == var_21_1 or arg_22_0.name == "FX")
	end)
	arg_21_0:PlayBGM()
	setText(arg_21_0.ptText, arg_21_0.ptActivity.data1)
	setActive(arg_21_0.ptTip, Activity.IsActivityReady(arg_21_0.ptActivity))

	local var_21_2 = arg_21_0.contextData.displayMode

	arg_21_0:addbubbleMsgBoxList({
		function(arg_23_0)
			local var_23_0

			if var_21_2 == var_0_0.DISPLAY.BATTLE then
				var_23_0 = arg_21_0.activity:getConfig("config_client").openActivityStory
			elseif var_21_2 == var_0_0.DISPLAY.STORY then
				var_23_0 = arg_21_0.activity:getConfig("config_client").openStory
			end

			arg_21_0:PlayStory(var_23_0, arg_23_0)
		end,
		function(arg_24_0)
			if underscore.all(underscore.values(arg_21_0.storyNodesDict), function(arg_25_0)
				return arg_25_0:IsReaded()
			end) and arg_21_0.storyTask and arg_21_0.storyTask:getTaskStatus() == 2 then
				local var_24_0 = arg_21_0.activity:getConfig("config_client").endStory

				arg_21_0:PlayStory(var_24_0, arg_24_0)
			else
				arg_24_0()
			end
		end
	})
end

function var_0_0.UpdateBattle(arg_26_0)
	local var_26_0 = arg_26_0.activity

	for iter_26_0, iter_26_1 in ipairs(var_26_0:GetActiveSeriesIds()) do
		local var_26_1 = arg_26_0.seriesNodes[tostring(iter_26_1)]
		local var_26_2 = BossRushSeriesData.New({
			id = iter_26_1,
			actId = var_26_0.id
		})
		local var_26_3 = var_26_2:IsUnlock(var_26_0)

		setActive(var_26_1, var_26_3)

		local var_26_4 = var_26_2:GetType()

		setActive(var_26_1:Find("blue"), var_26_4 == BossRushSeriesData.TYPE.NORMAL)
		setActive(var_26_1:Find("red"), var_26_4 ~= BossRushSeriesData.TYPE.NORMAL)

		local var_26_5

		if var_26_4 == BossRushSeriesData.TYPE.NORMAL then
			var_26_5 = var_26_1:Find("blue")
		else
			var_26_5 = var_26_1:Find("red")
		end

		setText(var_26_5:Find("Text"), var_26_2:GetName())
		setText(var_26_5:Find("diff/Text"), switch(iter_26_1, {
			[3001] = function()
				return i18n("zengke_series_easy")
			end,
			[3002] = function()
				return i18n("zengke_series_normal")
			end,
			[3003] = function()
				return i18n("zengke_series_hard")
			end,
			[3004] = function()
				return i18n("zengke_series_sp")
			end,
			[3005] = function()
				return i18n("zengke_series_ex")
			end
		}))

		local var_26_6 = var_26_4 == BossRushSeriesData.TYPE.SP

		setActive(var_26_1:Find("times"), var_26_6)

		local var_26_7 = true

		if var_26_6 then
			local var_26_8 = var_26_0:GetUsedBonus()[iter_26_0] or 0
			local var_26_9 = var_26_2:GetMaxBonusCount()

			var_26_7 = var_26_9 - var_26_8 > 0

			setText(var_26_1:Find("times/Text"), i18n("series_enemy_SP_count") .. setColorStr(math.max(0, var_26_9 - var_26_8) .. "/" .. var_26_9, var_26_7 and "#6EE868" or "#7f7f7f"))
		end

		onButton(arg_26_0, var_26_1, function()
			if not var_26_3 then
				local var_32_0 = var_26_2:GetPreSeriesId()
				local var_32_1 = BossRushSeriesData.New({
					id = var_32_0
				})

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_32_1:GetName()))

				return
			end

			if not var_26_7 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_SP_error"))

				return
			end

			arg_26_0:emit(BossRushVerZenkerMediator.ON_FLEET_SELECT, var_26_2)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateStory(arg_33_0)
	local var_33_0 = pg.NewStoryMgr.GetInstance()
	local var_33_1 = 0
	local var_33_2 = 0

	for iter_33_0, iter_33_1 in pairs(arg_33_0.storyNodesDict) do
		local var_33_3 = arg_33_0.nodes[tostring(iter_33_1.id)]
		local var_33_4 = iter_33_1:IsActive(arg_33_0.activity, arg_33_0.ptActivity)

		setActive(var_33_3, var_33_3)
		setText(var_33_3:Find("main/char/bg/Text"), iter_33_1:GetName())

		local var_33_5 = iter_33_1:IsReaded()

		var_33_1 = var_33_1 + (var_33_5 and 1 or 0)
		var_33_2 = var_33_2 + 1

		setActive(var_33_3:Find("main/char"), not var_33_5)
		setActive(var_33_3:Find("main/talk"), var_33_5)
		onButton(arg_33_0, var_33_3, function()
			if not var_33_4 or var_33_5 then
				return
			end

			local var_34_0 = iter_33_1:GetStory()

			arg_33_0:PlayStory(var_34_0, function()
				arg_33_0:UpdateView()
			end)
		end)
	end

	setText(arg_33_0.progressText, i18n("zengke_story_reward_count") .. var_33_1 .. "/" .. var_33_2)
	setActive(arg_33_0.storyAward, tobool(arg_33_0.storyTask))

	if arg_33_0.storyTask then
		local var_33_6 = arg_33_0.storyTask:getConfig("award_display")
		local var_33_7 = Drop.Create(var_33_6[1])
		local var_33_8 = arg_33_0.storyAward:Find("award_bg")

		updateDrop(var_33_8:Find("IconTpl"), var_33_7)
		onButton(arg_33_0, var_33_8, function()
			arg_33_0:emit(BaseUI.ON_DROP, var_33_7)
		end, SFX_PANEL)

		local var_33_9 = arg_33_0.storyTask:getTaskStatus()

		setActive(var_33_8:Find("get"), var_33_9 == 1)
		setActive(var_33_8:Find("got"), var_33_9 == 2)

		if var_33_9 == 1 then
			arg_33_0:emit(BossRushVerZenkerMediator.ON_TASK_SUBMIT, arg_33_0.storyTask)
		end
	end
end

function var_0_0.PlayStory(arg_37_0, arg_37_1, arg_37_2)
	if not arg_37_1 then
		return existCall(arg_37_2)
	end

	local var_37_0 = pg.NewStoryMgr.GetInstance()
	local var_37_1 = var_37_0:IsPlayed(arg_37_1)

	seriesAsync({
		function(arg_38_0)
			if var_37_1 then
				return arg_38_0()
			end

			local var_38_0 = tonumber(arg_37_1)

			if var_38_0 and var_38_0 > 0 then
				arg_37_0:emit(BossRushVerZenkerMediator.ON_PERFORM_COMBAT, var_38_0)
			else
				var_37_0:Play(arg_37_1, arg_38_0)
			end
		end
	}, arg_37_2)
end

function var_0_0.UpdateStoryTask(arg_39_0)
	local var_39_0 = arg_39_0.activity:getConfig("config_client").tasks[1]

	arg_39_0.storyTask = getProxy(TaskProxy):getTaskVO(var_39_0) or Task.New({
		submit_time = 1,
		id = var_39_0
	})

	setActive(arg_39_0.switchToggle:Find("Story/new"), arg_39_0.storyTask and arg_39_0.storyTask:getTaskStatus() ~= 2)
	setActive(arg_39_0.taskTip, Activity.IsActivityReady(getProxy(ActivityProxy):getActivityById(ActivityConst.ZENGKEHAIJUNSHANGJIANG_TASK_ACT_ID)))

	local var_39_1 = arg_39_0.storyTask:getConfig("award_display")
	local var_39_2 = Drop.Create(var_39_1[1])
	local var_39_3 = arg_39_0.storyAward:Find("award_bg")

	updateDrop(var_39_3:Find("IconTpl"), var_39_2)
	onButton(arg_39_0, var_39_3, function()
		arg_39_0:emit(BaseUI.ON_DROP, var_39_2)
	end, SFX_PANEL)

	local var_39_4 = arg_39_0.storyTask:getTaskStatus()

	setActive(var_39_3:Find("get"), var_39_4 == 1)
	setActive(var_39_3:Find("got"), var_39_4 == 2)

	if var_39_4 == 1 then
		arg_39_0:emit(BossRushVerZenkerMediator.ON_TASK_SUBMIT, arg_39_0.storyTask)
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
