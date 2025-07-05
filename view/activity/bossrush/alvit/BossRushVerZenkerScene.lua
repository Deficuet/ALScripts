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
			local var_24_0 = true

			for iter_24_0, iter_24_1 in pairs(arg_21_0.storyNodesDict) do
				local var_24_1 = iter_24_1:GetStory()

				if var_24_1 and var_24_1 ~= "" then
					var_24_0 = var_24_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_24_1)
				end

				if not var_24_0 then
					break
				end
			end

			if not var_21_0 and var_24_0 and arg_21_0.storyTask and arg_21_0.storyTask:getTaskStatus() == 2 then
				local var_24_2 = arg_21_0.activity:getConfig("config_client").endStory

				arg_21_0:PlayStory(var_24_2, arg_24_0)
			else
				arg_24_0()
			end
		end
	})
end

function var_0_0.UpdateBattle(arg_25_0)
	local var_25_0 = arg_25_0.activity

	for iter_25_0, iter_25_1 in ipairs(var_25_0:GetActiveSeriesIds()) do
		local var_25_1 = arg_25_0.seriesNodes[tostring(iter_25_1)]
		local var_25_2 = BossRushSeriesData.New({
			id = iter_25_1,
			actId = var_25_0.id
		})
		local var_25_3 = var_25_2:IsUnlock(var_25_0)

		setActive(var_25_1, var_25_3)

		local var_25_4 = var_25_2:GetType()

		setActive(var_25_1:Find("blue"), var_25_4 == BossRushSeriesData.TYPE.NORMAL)
		setActive(var_25_1:Find("red"), var_25_4 ~= BossRushSeriesData.TYPE.NORMAL)

		local var_25_5

		if var_25_4 == BossRushSeriesData.TYPE.NORMAL then
			var_25_5 = var_25_1:Find("blue")
		else
			var_25_5 = var_25_1:Find("red")
		end

		setText(var_25_5:Find("Text"), var_25_2:GetName())
		setText(var_25_5:Find("diff/Text"), switch(iter_25_1, {
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

		local var_25_6 = var_25_4 == BossRushSeriesData.TYPE.SP

		setActive(var_25_1:Find("times"), var_25_6)

		local var_25_7 = true

		if var_25_6 then
			local var_25_8 = var_25_0:GetUsedBonus()[iter_25_0] or 0
			local var_25_9 = var_25_2:GetMaxBonusCount()

			var_25_7 = var_25_9 - var_25_8 > 0

			setText(var_25_1:Find("times/Text"), i18n("series_enemy_SP_count") .. setColorStr(math.max(0, var_25_9 - var_25_8) .. "/" .. var_25_9, var_25_7 and "#6EE868" or "#7f7f7f"))
		end

		onButton(arg_25_0, var_25_1, function()
			if not var_25_3 then
				local var_31_0 = var_25_2:GetPreSeriesId()
				local var_31_1 = BossRushSeriesData.New({
					id = var_31_0
				})

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_31_1:GetName()))

				return
			end

			if not var_25_7 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_SP_error"))

				return
			end

			arg_25_0:emit(BossRushVerZenkerMediator.ON_FLEET_SELECT, var_25_2)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateStory(arg_32_0)
	local var_32_0 = {}
	local var_32_1 = pg.NewStoryMgr.GetInstance()
	local var_32_2 = 1
	local var_32_3 = 2
	local var_32_4 = 3
	local var_32_5 = 0
	local var_32_6 = 0

	for iter_32_0, iter_32_1 in pairs(arg_32_0.storyNodesDict) do
		var_32_0[iter_32_0] = {}

		local var_32_7 = iter_32_1:GetStory()
		local var_32_8 = true

		if var_32_7 and var_32_7 ~= "" then
			var_32_8 = var_32_1:IsPlayed(var_32_7)
			var_32_5 = var_32_5 + (var_32_8 and 1 or 0)
			var_32_6 = var_32_6 + 1
		end

		var_32_0[iter_32_0].status = var_32_8 and var_32_4 or var_32_2
	end

	setText(arg_32_0.progressText, i18n("zengke_story_reward_count") .. string.format("(" .. setColorStr("%d/%d", "#AEB2E3") .. ")", var_32_5, var_32_6))
	underscore(arg_32_0.storyNodesDict):chain():values():sort(CompareFuncs({
		function(arg_33_0)
			return arg_33_0.id
		end
	})):each(function(arg_34_0)
		local var_34_0 = arg_34_0:GetTriggers()

		if var_32_0[arg_34_0.id].status == var_32_4 then
			return
		end

		if not _.any(var_34_0, function(arg_35_0)
			if arg_35_0.type == BossRushStoryNode.TRIGGER_TYPE.PT_GOT then
				return arg_32_0.ptActivity.data1 < arg_35_0.value
			elseif arg_35_0.type == BossRushStoryNode.TRIGGER_TYPE.SERIES_PASSED then
				return not BossRushSeriesData.New({
					id = arg_35_0.value,
					actId = arg_32_0.activity.id
				}):IsUnlock(arg_32_0.activity)
			elseif arg_35_0.type == BossRushStoryNode.TRIGGER_TYPE.STORY_READED then
				return var_32_0[arg_35_0.value].status < var_32_4
			end
		end) then
			var_32_0[arg_34_0.id].status = var_32_3
		end
	end)

	for iter_32_2, iter_32_3 in pairs(arg_32_0.storyNodesDict) do
		local var_32_9 = arg_32_0.nodes[tostring(iter_32_3.id)]

		setActive(var_32_9, var_32_2 < var_32_0[iter_32_2].status)
		setText(var_32_9:Find("main/char/bg/Text"), iter_32_3:GetName())

		local var_32_10 = var_32_0[iter_32_2].status == var_32_4

		setActive(var_32_9:Find("main/char"), not var_32_10)
		setActive(var_32_9:Find("main/talk"), var_32_10)
		onButton(arg_32_0, var_32_9, function()
			if not isActive or var_32_10 then
				return
			end

			local var_36_0 = iter_32_3:GetStory()

			arg_32_0:PlayStory(var_36_0, function()
				arg_32_0:UpdateView()
			end)
		end)
	end
end

function var_0_0.PlayStory(arg_38_0, arg_38_1, arg_38_2)
	if not arg_38_1 then
		return existCall(arg_38_2)
	end

	local var_38_0 = pg.NewStoryMgr.GetInstance()
	local var_38_1 = var_38_0:IsPlayed(arg_38_1)

	seriesAsync({
		function(arg_39_0)
			if var_38_1 then
				return arg_39_0()
			end

			local var_39_0 = tonumber(arg_38_1)

			if var_39_0 and var_39_0 > 0 then
				arg_38_0:emit(BossRushVerZenkerMediator.ON_PERFORM_COMBAT, var_39_0)
			else
				var_38_0:Play(arg_38_1, arg_39_0)
			end
		end
	}, arg_38_2)
end

function var_0_0.UpdateStoryTask(arg_40_0)
	local var_40_0 = arg_40_0.activity:getConfig("config_client").tasks[1]

	arg_40_0.storyTask = getProxy(TaskProxy):getTaskVO(var_40_0) or Task.New({
		submit_time = 1,
		id = var_40_0
	})

	setActive(arg_40_0.switchToggle:Find("Story/new"), arg_40_0.storyTask and arg_40_0.storyTask:getTaskStatus() ~= 2)
	setActive(arg_40_0.taskTip, Activity.IsActivityReady(getProxy(ActivityProxy):getActivityById(ActivityConst.ZENGKEHAIJUNSHANGJIANG_TASK_ACT_ID)))

	local var_40_1 = arg_40_0.storyTask:getConfig("award_display")
	local var_40_2 = Drop.Create(var_40_1[1])
	local var_40_3 = arg_40_0.storyAward:Find("award_bg")

	updateDrop(var_40_3:Find("IconTpl"), var_40_2)
	onButton(arg_40_0, var_40_3, function()
		arg_40_0:emit(BaseUI.ON_DROP, var_40_2)
	end, SFX_PANEL)

	local var_40_4 = arg_40_0.storyTask:getTaskStatus()

	setActive(var_40_3:Find("get"), var_40_4 == 1)
	setActive(var_40_3:Find("got"), var_40_4 == 2)

	if var_40_4 == 1 then
		arg_40_0:emit(BossRushVerZenkerMediator.ON_TASK_SUBMIT, arg_40_0.storyTask)
	end
end

function var_0_0.addbubbleMsgBoxList(arg_42_0, arg_42_1)
	local var_42_0 = #arg_42_0.ActionSequence == 0

	table.insertto(arg_42_0.ActionSequence, arg_42_1)

	if not var_42_0 then
		return
	end

	arg_42_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_43_0, arg_43_1)
	local var_43_0 = #arg_43_0.ActionSequence == 0

	table.insert(arg_43_0.ActionSequence, arg_43_1)

	if not var_43_0 then
		return
	end

	arg_43_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_44_0)
	if #arg_44_0.ActionSequence == 0 then
		return
	end

	local var_44_0

	local function var_44_1()
		local var_45_0 = arg_44_0.ActionSequence[1]

		if var_45_0 then
			var_45_0(function()
				table.remove(arg_44_0.ActionSequence, 1)
				var_44_1()
			end)
		end
	end

	var_44_1()
end

function var_0_0.CleanBubbleMsgbox(arg_47_0)
	table.clean(arg_47_0.ActionSequence)
end

function var_0_0.willExit(arg_48_0)
	if arg_48_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_48_0.camEventId)

		arg_48_0.camEventId = nil
	end
end

return var_0_0
