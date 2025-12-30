local var_0_0 = class("BossRushKurskScene", import("view.base.BaseUI"))
local var_0_1 = require("Mgr/Pool/PoolPlural")

var_0_0.DISPLAY = {
	STORY = 2,
	BATTLE = 1
}

function var_0_0.getUIName(arg_1_0)
	return "BossRushKurskUI"
end

function var_0_0.GetAtalsName(arg_2_0)
	return "ui/BossRushKurskUI_atlas"
end

function var_0_0.ResUISettings(arg_3_0)
	return true
end

function var_0_0.Ctor(arg_4_0)
	var_0_0.super.Ctor(arg_4_0)

	arg_4_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_5_0, arg_5_1)
	existCall(arg_5_1)
	arg_5_0.loader:LoadBundle(arg_5_0:GetAtalsName())
end

function var_0_0.init(arg_6_0)
	arg_6_0.top = arg_6_0._tf:Find("Top")
	arg_6_0.map = arg_6_0._tf:Find("Map")
	arg_6_0.seriesNodes = _.map(_.range(arg_6_0._tf:Find("Battle/Nodes").childCount), function(arg_7_0)
		return arg_6_0._tf:Find("Battle/Nodes"):GetChild(arg_7_0 - 1)
	end)
	arg_6_0.ptText = arg_6_0._tf:Find("Battle/Reward/Text")
	arg_6_0.nodes = {}

	for iter_6_0 = 1, arg_6_0._tf:Find("Map").childCount do
		local var_6_0 = arg_6_0._tf:Find("Map"):GetChild(iter_6_0 - 1)

		arg_6_0.nodes[var_6_0.name] = {
			tfType = 1,
			trans = var_6_0
		}
	end

	for iter_6_1 = 1, arg_6_0._tf:Find("Story/Nodes").childCount do
		local var_6_1 = arg_6_0._tf:Find("Story/Nodes"):GetChild(iter_6_1 - 1)

		arg_6_0.nodes[var_6_1.name] = {
			tfType = 2,
			trans = var_6_1
		}
	end

	arg_6_0.pluralRoot = pg.PoolMgr.GetInstance().root

	local var_6_2 = go(arg_6_0._tf:Find("Link"))

	setActive(var_6_2, false)

	arg_6_0.plural = var_0_1.New(var_6_2, 32)
	arg_6_0.linksContainer = arg_6_0._tf:Find("Links")
	arg_6_0.links = {}
	arg_6_0.storyBar = arg_6_0._tf:Find("Story/StoryBar")
	arg_6_0.storyAward = arg_6_0._tf:Find("Story/PassLevel/Award")
	arg_6_0.ActionSequence = {}

	setText(arg_6_0._tf:Find("Battle/Rank/Title"), i18n("word_billboard"))
	setText(arg_6_0._tf:Find("Battle/Reward/Title"), i18n("series_enemy_reward"))
	setText(arg_6_0._tf:Find("Story/PassLevel/Title"), i18n("series_enemy_storyreward"))
	setText(arg_6_0._tf:Find("Story/PassLevel/PT/Tips"), i18n("series_enemy_storyunlock"))
end

function var_0_0.SetActivity(arg_8_0, arg_8_1)
	arg_8_0.activity = arg_8_1
end

function var_0_0.SetPtActivity(arg_9_0, arg_9_1)
	arg_9_0.ptActivity = arg_9_1

	print(arg_9_1)

	arg_9_0.ptData = ActivityPtData.New(arg_9_0.ptActivity)
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.top:Find("back_btn"), function()
		arg_10_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.top:Find("option"), function()
		arg_10_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf:Find("Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = {
				{
					info = i18n("series_enemy_help")
				}
			}
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf:Find("Battle/Rank"), function()
		arg_10_0:emit(BossRushKurskMediator.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf:Find("Battle/Reward"), function()
		arg_10_0:emit(BossRushKurskMediator.GO_ACT_SHOP, arg_10_0.ptData)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf:Find("Battle/Story"), function()
		arg_10_0:SetDisplayMode(var_0_0.DISPLAY.STORY)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf:Find("Story/Battle"), function()
		arg_10_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
	end, SFX_PANEL)

	local var_10_0 = arg_10_0.activity:getConfig("config_client").storys

	arg_10_0.storyNodesDict = {}

	_.each(var_10_0, function(arg_18_0)
		arg_10_0.storyNodesDict[arg_18_0] = BossRushStoryNode.New({
			id = arg_18_0
		})
	end)

	local var_10_1 = arg_10_0.activity:getConfig("config_client").tasks[1]

	arg_10_0.storyTask = getProxy(TaskProxy):getTaskVO(var_10_1) or Task.New({
		submitTime = 1,
		id = var_10_1
	})

	local var_10_2 = arg_10_0.contextData.displayMode or BossRushKurskScene.DISPLAY.BATTLE

	arg_10_0.contextData.displayMode = nil

	arg_10_0:SetDisplayMode(var_10_2)
end

function var_0_0.getBGM(arg_19_0)
	local var_19_0 = pg.voice_bgm[arg_19_0.__cname]

	if not var_19_0 then
		return nil
	end

	local var_19_1 = var_19_0.bgm
	local var_19_2 = "battle-deepecho"
	local var_19_3 = arg_19_0.contextData.displayMode

	if var_19_3 == var_0_0.DISPLAY.BATTLE then
		return var_19_1
	elseif var_19_3 == var_0_0.DISPLAY.STORY then
		return var_19_2
	end
end

function var_0_0.SetDisplayMode(arg_20_0, arg_20_1)
	if arg_20_1 == arg_20_0.contextData.displayMode then
		return
	end

	arg_20_0.contextData.displayMode = arg_20_1

	arg_20_0:PlayBGM()
	arg_20_0:UpdateView()
end

function var_0_0.UpdateView(arg_21_0)
	local var_21_0 = arg_21_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_21_0._tf:Find("Battle"), var_21_0)
	setActive(arg_21_0._tf:Find("Story"), not var_21_0)
	setActive(arg_21_0._tf:Find("Links"), not var_21_0)
	arg_21_0:UpdateBattle()
	arg_21_0:UpdateStory()

	local var_21_1 = arg_21_0.contextData.displayMode

	arg_21_0:addbubbleMsgBoxList({
		function(arg_22_0)
			if arg_21_0.activity:HasPassSeries(1001) then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0036", nil, arg_22_0)

				return
			end

			arg_22_0()
		end,
		function(arg_23_0)
			local var_23_0

			if var_21_1 == var_0_0.DISPLAY.BATTLE then
				var_23_0 = arg_21_0.activity:getConfig("config_client").openActivityStory
			elseif var_21_1 == var_0_0.DISPLAY.STORY then
				var_23_0 = arg_21_0.activity:getConfig("config_client").openStory
			end

			arg_21_0:PlayStory(var_23_0, arg_23_0)
		end,
		function(arg_24_0)
			if underscore.all(underscore.values(arg_21_0.storyNodesDict), function(arg_25_0)
				return arg_25_0:IsReaded()
			end) then
				local var_24_0 = arg_21_0.activity:getConfig("config_client").endStory

				arg_21_0:PlayStory(var_24_0, function(arg_26_0)
					arg_24_0()

					if arg_26_0 then
						arg_21_0:UpdateView()
					end
				end)

				return
			end

			arg_24_0()
		end
	})
end

function var_0_0.UpdateBattle(arg_27_0)
	local var_27_0 = arg_27_0.activity
	local var_27_1 = var_27_0:GetActiveSeriesIds()

	table.Foreach(arg_27_0.seriesNodes, function(arg_28_0, arg_28_1)
		local var_28_0 = var_27_1[arg_28_0]
		local var_28_1 = BossRushSeriesData.New({
			id = var_28_0,
			actId = var_27_0.id
		})
		local var_28_2 = var_28_1:IsUnlock(var_27_0)

		setActive(arg_28_1:Find("Pin/NameBG"), var_28_2)
		setActive(arg_28_1:Find("Pin/Lock"), not var_28_2)
		setText(arg_28_1:Find("Pin/ChapterName"), var_28_1:GetSeriesCode())
		setText(arg_28_1:Find("Pin/NameBG/Name"), var_28_1:GetName())

		local var_28_3 = var_28_1:GetType() == BossRushSeriesData.TYPE.SP

		setActive(arg_28_1:Find("Pin/NameBG/BonusCount"), var_28_2 and var_28_3)

		local var_28_4 = true

		if var_28_3 then
			local var_28_5 = var_27_0:GetUsedBonus()[arg_28_0] or 0
			local var_28_6 = var_28_1:GetMaxBonusCount()

			setText(arg_28_1:Find("Pin/NameBG/BonusCount"):GetChild(0), i18n("series_enemy_SP_count"))
			setText(arg_28_1:Find("Pin/NameBG/BonusCount"):GetChild(1), math.max(0, var_28_6 - var_28_5) .. "/" .. var_28_6)

			var_28_4 = var_28_6 - var_28_5 > 0
		end

		onButton(arg_27_0, arg_28_1, function()
			if not var_28_2 then
				local var_29_0 = var_28_1:GetPreSeriesId()
				local var_29_1 = BossRushSeriesData.New({
					id = var_29_0
				})

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_29_1:GetName()))

				return
			end

			if not var_28_4 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_SP_error"))

				return
			end

			arg_27_0:emit(BossRushKurskMediator.ON_FLEET_SELECT, var_28_1)
		end, SFX_PANEL)
	end)
	print(var_27_0.id)
	setActive(arg_27_0._tf:Find("Battle/Reward/Tip"), arg_27_0.ptData:CanGetAward())
	setText(arg_27_0.ptText, arg_27_0.ptActivity.data1)
end

local var_0_2 = {
	"story_bar_green",
	"story_bar_yellow",
	"story_bar_purple"
}

function var_0_0.UpdateStory(arg_30_0)
	local var_30_0 = pg.NewStoryMgr.GetInstance()
	local var_30_1 = 0
	local var_30_2 = 0
	local var_30_3
	local var_30_4

	arg_30_0:ReturnLinks()

	local var_30_5 = false

	table.Foreach(arg_30_0.storyNodesDict, function(arg_31_0, arg_31_1)
		local var_31_0 = arg_30_0.nodes[arg_31_1:GetIconName()].trans
		local var_31_1 = arg_31_1:IsActive(arg_30_0.activity, arg_30_0.ptActivity)
		local var_31_2 = arg_31_1:IsReaded()
		local var_31_3 = arg_31_1:GetType()

		if var_31_3 == BossRushStoryNode.NODE_TYPE.NORMAL then
			arg_30_0.loader:GetSprite(arg_30_0:GetAtalsName(), var_31_1 and "story_green_active" or "story_green", var_31_0:GetChild(0), true)
		elseif var_31_3 == BossRushStoryNode.NODE_TYPE.EVENT then
			setActive(var_31_0, var_31_1)
			arg_30_0.loader:GetSprite(arg_30_0:GetAtalsName(), var_31_1 and "story_yellow_active" or "story_yellow", var_31_0:GetChild(0), true)
		elseif var_31_3 == BossRushStoryNode.NODE_TYPE.BATTLE then
			-- block empty
		end

		if var_31_1 then
			local var_31_4 = arg_30_0._tf:Find("Story"):InverseTransformPoint(var_31_0.position)

			setAnchoredPosition(arg_30_0.storyBar, var_31_4)
			setText(arg_30_0.storyBar:Find("Text"), arg_31_1:GetName())
			arg_30_0.loader:GetSprite(arg_30_0:GetAtalsName(), var_0_2[var_31_3], arg_30_0.storyBar, true)
			onButton(arg_30_0, arg_30_0.storyBar, function()
				local var_32_0 = arg_31_1:GetStory()

				arg_30_0:PlayStory(var_32_0, function()
					arg_30_0:UpdateView()
				end)
			end)

			var_30_5 = true
		end

		local var_31_5 = arg_31_1:GetActiveLink()

		;(function()
			if var_31_5 == 0 or not var_31_2 then
				return
			end

			local var_34_0 = arg_30_0.storyNodesDict[var_31_5]
			local var_34_1 = arg_30_0.nodes[var_34_0:GetIconName()].trans
			local var_34_2 = arg_30_0.plural:Dequeue()

			table.insert(arg_30_0.links, go(var_34_2))
			setActive(var_34_2, true)
			setParent(var_34_2, arg_30_0.linksContainer)

			local var_34_3 = arg_30_0.linksContainer:InverseTransformPoint(var_31_0.position)
			local var_34_4 = arg_30_0.linksContainer:InverseTransformPoint(var_34_1.position) - var_34_3
			local var_34_5 = Vector2.Magnitude(var_34_4)

			tf(var_34_2).sizeDelta = Vector2(var_34_5, 2)
			tf(var_34_2).anchoredPosition = var_34_3
			tf(var_34_2).localRotation = Quaternion.FromToRotation(Vector3.right, var_34_4)
		end)()

		local var_31_6 = arg_31_1:GetTriggers()

		_.each(var_31_6, function(arg_35_0)
			if arg_35_0.type == BossRushStoryNode.TRIGGER_TYPE.PT_GOT then
				if var_31_1 then
					var_30_4 = var_30_4 and math.max(arg_35_0.value, var_30_4) or arg_35_0.value
				else
					var_30_3 = var_30_3 and math.min(arg_35_0.value, var_30_3) or arg_35_0.value
				end
			end
		end)
	end)
	setText(arg_30_0._tf:Find("Story/PassLevel/PT/Text"), arg_30_0.ptActivity.data1 .. "/" .. (var_30_3 or var_30_4 or ""))
	setText(arg_30_0._tf:Find("Story/PassLevel/Values"):GetChild(0), var_30_1)
	setText(arg_30_0._tf:Find("Story/PassLevel/Values"):GetChild(2), var_30_2)
	setActive(arg_30_0.storyBar, var_30_5)
	setActive(arg_30_0.storyAward, tobool(arg_30_0.storyTask))

	if arg_30_0.storyTask then
		local var_30_6 = arg_30_0.storyTask:getConfig("award_display")
		local var_30_7 = {
			type = var_30_6[1][1],
			id = var_30_6[1][2],
			count = var_30_6[1][3]
		}

		updateDrop(arg_30_0.storyAward:Find("Mask"):GetChild(0), var_30_7)
		onButton(arg_30_0, arg_30_0.storyAward:Find("Mask"):GetChild(0), function()
			arg_30_0:emit(BaseUI.ON_DROP, var_30_7)
		end)

		local var_30_8 = arg_30_0.storyTask:getTaskStatus()

		setActive(arg_30_0.storyAward:Find("Got"), var_30_8 == 2)

		if var_30_8 == 1 then
			arg_30_0:emit(BossRushKurskMediator.ON_TASK_SUBMIT, arg_30_0.storyTask)
		end
	end

	setActive(arg_30_0._tf:Find("Battle/Story/New"), var_30_5)
end

function var_0_0.ReturnLinks(arg_37_0, arg_37_1)
	for iter_37_0, iter_37_1 in ipairs(arg_37_0.links) do
		if not arg_37_0.plural:Enqueue(iter_37_1, arg_37_1) then
			setParent(iter_37_1, arg_37_0.pluralRoot)
		end
	end

	table.clean(arg_37_0.links)
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
				arg_38_0:emit(BossRushKurskMediator.ON_PERFORM_COMBAT, var_39_0)
			else
				var_38_0:Play(arg_38_1, arg_39_0)
			end
		end,
		function(arg_40_0, ...)
			existCall(arg_38_2, ...)
		end
	})
end

function var_0_0.UpdateTasks(arg_41_0, arg_41_1)
	if _.any(arg_41_1, function(arg_42_0)
		return arg_41_0.storyTask and arg_41_0.storyTask.id == arg_42_0
	end) then
		arg_41_0.storyTask.submitTime = 1

		arg_41_0:UpdateView()
	end
end

function var_0_0.addbubbleMsgBoxList(arg_43_0, arg_43_1)
	local var_43_0 = #arg_43_0.ActionSequence == 0

	table.insertto(arg_43_0.ActionSequence, arg_43_1)

	if not var_43_0 then
		return
	end

	arg_43_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_44_0, arg_44_1)
	local var_44_0 = #arg_44_0.ActionSequence == 0

	table.insert(arg_44_0.ActionSequence, arg_44_1)

	if not var_44_0 then
		return
	end

	arg_44_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_45_0)
	if #arg_45_0.ActionSequence == 0 then
		return
	end

	local var_45_0

	local function var_45_1()
		local var_46_0 = arg_45_0.ActionSequence[1]

		if var_46_0 then
			var_46_0(function()
				table.remove(arg_45_0.ActionSequence, 1)
				var_45_1()
			end)
		end
	end

	var_45_1()
end

function var_0_0.CleanBubbleMsgbox(arg_48_0)
	table.clean(arg_48_0.ActionSequence)
end

function var_0_0.willExit(arg_49_0)
	arg_49_0:ReturnLinks(true)
	arg_49_0.loader:Clear()
	var_0_0.super.willExit(arg_49_0)
end

return var_0_0
