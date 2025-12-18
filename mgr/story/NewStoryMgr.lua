pg = pg or {}

local var_0_0 = singletonClass("NewStoryMgr")

pg.NewStoryMgr = var_0_0

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5 = 5
local var_0_6 = 6
local var_0_7 = 7
local var_0_8 = Color.New(1, 0.8705, 0.4196, 1)
local var_0_9 = Color.New(1, 1, 1, 1)

require("Mgr/Story/Include")

local var_0_10 = true

local function var_0_11(...)
	if var_0_10 and IsUnityEditor then
		originalPrint(...)
	end
end

local var_0_12 = {
	"",
	"JP",
	"KR",
	"US",
	""
}

local function var_0_13(arg_2_0)
	local var_2_0 = var_0_12[PLATFORM_CODE]

	if arg_2_0 == "index" then
		arg_2_0 = arg_2_0 .. var_2_0
	end

	local var_2_1

	if PLATFORM_CODE == PLATFORM_JP then
		var_2_1 = "GameCfg.story" .. var_2_0 .. "." .. arg_2_0
	else
		var_2_1 = "GameCfg.story" .. "." .. arg_2_0
	end

	local var_2_2, var_2_3 = pcall(function()
		return require(var_2_1)
	end)

	if not var_2_2 then
		local var_2_4 = true

		if UnGamePlayState then
			local var_2_5 = "GameCfg.dungeon." .. arg_2_0

			if pcall(function()
				return require(var_2_5)
			end) then
				var_2_4 = false
			end
		end

		if var_2_4 then
			errorMsg("不存在剧情ID对应的Lua:" .. arg_2_0)
		end
	end

	return var_2_2 and var_2_3
end

function var_0_0.GetScript(arg_5_0, arg_5_1)
	return var_0_13(arg_5_1)
end

function var_0_0.SetData(arg_6_0, arg_6_1)
	arg_6_0.playedList = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		local var_6_0 = iter_6_1

		if iter_6_1 == 20008 then
			var_6_0 = 1131
		end

		if iter_6_1 == 20009 then
			var_6_0 = 1132
		end

		if iter_6_1 == 20010 then
			var_6_0 = 1133
		end

		if iter_6_1 == 20011 then
			var_6_0 = 1134
		end

		if iter_6_1 == 20012 then
			var_6_0 = 1135
		end

		if iter_6_1 == 20013 then
			var_6_0 = 1136
		end

		if iter_6_1 == 20014 then
			var_6_0 = 1137
		end

		arg_6_0.playedList[var_6_0] = true
	end
end

function var_0_0.SetPlayedFlag(arg_7_0, arg_7_1)
	var_0_11("Update story id", arg_7_1)

	arg_7_0.playedList[arg_7_1] = true
end

function var_0_0.SetPlayedFlagList(arg_8_0, arg_8_1)
	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		arg_8_0.playedList[iter_8_1] = true
	end
end

function var_0_0.GetPlayedFlag(arg_9_0, arg_9_1)
	return arg_9_0.playedList[arg_9_1]
end

function var_0_0.GetPlayedList(arg_10_0)
	return arg_10_0.playedList
end

function var_0_0.IsPlayed(arg_11_0, arg_11_1, arg_11_2)
	if type(arg_11_1) ~= "table" then
		arg_11_1 = {
			arg_11_1
		}
	end

	return underscore.any(arg_11_1, function(arg_12_0)
		local var_12_0, var_12_1 = arg_11_0:StoryName2StoryId(arg_12_0)
		local var_12_2 = arg_11_0:GetPlayedFlag(var_12_0)
		local var_12_3 = true

		if var_12_1 and not arg_11_2 then
			var_12_3 = arg_11_0:GetPlayedFlag(var_12_1)
		end

		return var_12_2 and var_12_3
	end)
end

local function var_0_14(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0) do
		var_13_0[iter_13_1] = iter_13_0
	end

	return var_13_0
end

function var_0_0.StoryName2StoryId(arg_14_0, arg_14_1)
	if not var_0_0.indexs then
		var_0_0.indexs = var_0_14(var_0_13("index"))
	end

	if not var_0_0.againIndexs then
		var_0_0.againIndexs = var_0_14(var_0_13("index_again"))
	end

	return var_0_0.indexs[arg_14_1], var_0_0.againIndexs[arg_14_1]
end

function var_0_0.StoryId2StoryName(arg_15_0, arg_15_1)
	if not var_0_0.indexIds then
		var_0_0.indexIds = var_0_13("index")
	end

	if not var_0_0.againIndexIds then
		var_0_0.againIndexIds = var_0_13("index_again")
	end

	return var_0_0.indexIds[arg_15_1], var_0_0.againIndexIds[arg_15_1]
end

function var_0_0.StoryLinkNames(arg_16_0, arg_16_1)
	if not var_0_0.linkNames then
		var_0_0.linkNames = var_0_13("index_link")
	end

	return var_0_0.linkNames[arg_16_1]
end

function var_0_0._GetStoryPaintingsByName(arg_17_0, arg_17_1)
	return arg_17_1:GetUsingPaintingNames()
end

function var_0_0.GetStoryPaintingsByName(arg_18_0, arg_18_1)
	local var_18_0 = var_0_13(arg_18_1)

	if not var_18_0 then
		var_0_11("not exist story file")

		return {}
	end

	local var_18_1 = Story.New(var_18_0, false)

	return arg_18_0:_GetStoryPaintingsByName(var_18_1)
end

function var_0_0.GetStoryPaintingsByNameList(arg_19_0, arg_19_1)
	local var_19_0 = {}
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_1) do
		for iter_19_2, iter_19_3 in ipairs(arg_19_0:GetStoryPaintingsByName(iter_19_1)) do
			var_19_1[iter_19_3] = true
		end
	end

	for iter_19_4, iter_19_5 in pairs(var_19_1) do
		table.insert(var_19_0, iter_19_4)
	end

	return var_19_0
end

function var_0_0.GetStoryPaintingsById(arg_20_0, arg_20_1)
	return arg_20_0:GetStoryPaintingsByIdList({
		arg_20_1
	})
end

function var_0_0.GetStoryPaintingsByIdList(arg_21_0, arg_21_1)
	local var_21_0 = _.map(arg_21_1, function(arg_22_0)
		return arg_21_0:StoryId2StoryName(arg_22_0)
	end)

	return arg_21_0:GetStoryPaintingsByNameList(var_21_0)
end

function var_0_0.ShouldDownloadRes(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:GetStoryPaintingsByName(arg_23_1)

	return _.any(var_23_0, function(arg_24_0)
		return PaintingGroupConst.VerifyPaintingFileName(arg_24_0)
	end)
end

function var_0_0.Init(arg_25_0, arg_25_1)
	arg_25_0.state = var_0_1

	LoadAndInstantiateAsync("ui", "NewStoryUI", function(arg_26_0)
		arg_25_0.UIOverlay = GameObject.Find("Overlay/UIOverlay")

		arg_26_0.transform:SetParent(arg_25_0.UIOverlay.transform, false)
		arg_25_0:_Init(arg_26_0, arg_25_1)
	end, true, true)
end

function var_0_0._Init(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.playedList = {}
	arg_27_0.playQueue = {}
	arg_27_0._go = arg_27_1
	arg_27_0._tf = tf(arg_27_0._go)
	arg_27_0.frontTr = findTF(arg_27_0._tf, "front")
	arg_27_0.frontEvtTr = findTF(arg_27_0._tf, "block")
	arg_27_0.skipBtn = findTF(arg_27_0._tf, "front/btns/btns/skip_button")
	arg_27_0.autoBtn = findTF(arg_27_0._tf, "front/btns/btns/auto_button")
	arg_27_0.autoBtnImg = findTF(arg_27_0._tf, "front/btns/btns/auto_button/sel"):GetComponent(typeof(Image))
	arg_27_0.alphaImage = arg_27_0._tf:GetComponent(typeof(Image))
	arg_27_0.mainImage = arg_27_0._tf:GetComponent(typeof(Image))
	arg_27_0.recordBtn = findTF(arg_27_0._tf, "front/btns/record")
	arg_27_0.hideUIBtn = findTF(arg_27_0._tf, "front/btns/btns/hide_ui_button")
	arg_27_0.dialogueContainer = findTF(arg_27_0._tf, "front/dialogue")
	arg_27_0.players = {
		AsideStoryPlayer.New(arg_27_1),
		DialogueStoryPlayer.New(arg_27_1),
		BgStoryPlayer.New(arg_27_1),
		CarouselPlayer.New(arg_27_1),
		VedioStoryPlayer.New(arg_27_1),
		CastStoryPlayer.New(arg_27_1),
		SpAnimStoryPlayer.New(arg_27_1),
		BlinkStoryPlayer.New(arg_27_1)
	}
	arg_27_0.setSpeedPanel = StorySetSpeedPanel.New(arg_27_0._tf, function(arg_28_0)
		arg_27_0:UpdatePlaySpeed(arg_28_0)
	end)
	arg_27_0.recordPanel = NewStoryRecordPanel.New()
	arg_27_0.recorder = StoryRecorder.New()

	setActive(arg_27_0._go, false)

	arg_27_0.state = var_0_2

	if arg_27_2 then
		arg_27_2()
	end
end

function var_0_0.GetPlayer(arg_29_0, arg_29_1)
	for iter_29_0, iter_29_1 in ipairs(arg_29_0.players) do
		if isa(iter_29_1, arg_29_1) then
			return iter_29_1
		end
	end

	return nil
end

function var_0_0.Play(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4, arg_30_5, arg_30_6, arg_30_7)
	table.insert(arg_30_0.playQueue, {
		arg_30_1,
		arg_30_2,
		arg_30_7
	})

	if #arg_30_0.playQueue == 1 then
		local var_30_0

		local function var_30_1()
			if #arg_30_0.playQueue == 0 then
				return
			end

			local var_31_0 = arg_30_0.playQueue[1][1]
			local var_31_1 = arg_30_0.playQueue[1][2]
			local var_31_2 = arg_30_0.playQueue[1][3]

			arg_30_0:SoloPlay(var_31_0, function(arg_32_0, arg_32_1)
				if var_31_1 then
					var_31_1(arg_32_0, arg_32_1)
				end

				table.remove(arg_30_0.playQueue, 1)
				var_30_1()
			end, arg_30_3, arg_30_4, arg_30_5, arg_30_6, var_31_2)
		end

		var_30_1()
	end
end

function var_0_0.Pause(arg_33_0)
	if arg_33_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	arg_33_0.state = var_0_4

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.players) do
		iter_33_1:Pause()
	end
end

function var_0_0.Resume(arg_34_0)
	if arg_34_0.state ~= var_0_4 then
		var_0_11("state is not 'pause'")

		return
	end

	arg_34_0.state = var_0_3

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.players) do
		iter_34_1:Resume()
	end
end

function var_0_0.Stop(arg_35_0)
	if arg_35_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	if arg_35_0.currPlayer and arg_35_0.currPlayer:WaitForEvent() then
		return
	end

	arg_35_0.state = var_0_5

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.players) do
		iter_35_1:Stop()
	end
end

function var_0_0.PlayForAcivitySpStory(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7)
	local function var_36_0()
		_.each(arg_36_0.branchSelectCache, function(arg_38_0)
			local var_38_0 = ActivitySpStoryNode.GetOptionBranchByStoryName(arg_36_1, arg_38_0)

			if var_38_0 then
				local var_38_1 = var_0_13(var_38_0.story).id

				arg_36_0:SendNotification(GAME.STORY_UPDATE, {
					storyId = var_38_1
				})
			end
		end)

		arg_36_0.branchSelectCache = nil

		arg_36_2()
	end

	arg_36_0:Play(arg_36_1, var_36_0, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7)
end

function var_0_0.PlayForTb(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	arg_39_0:Play(arg_39_1, arg_39_3, arg_39_4, false, false, true, arg_39_2)
end

function var_0_0.PlayForWorld(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4, arg_40_5, arg_40_6, arg_40_7, arg_40_8)
	arg_40_0.optionSelCodes = arg_40_2 or {}
	arg_40_0.autoPlayFlag = arg_40_6

	arg_40_0:Play(arg_40_1, arg_40_3, arg_40_4, arg_40_5, arg_40_7, true, arg_40_8)
end

function var_0_0.ForceAutoPlay(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4, arg_41_5)
	arg_41_0.autoPlayFlag = true

	local function var_41_0(arg_42_0, arg_42_1)
		arg_41_2(arg_42_0, arg_42_1, arg_41_0.isAutoPlay)
	end

	arg_41_0:Play(arg_41_1, var_41_0, arg_41_3, arg_41_4, true, false, arg_41_5)
end

function var_0_0.ForceManualPlay(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4, arg_43_5)
	arg_43_0.banPlayFlag = true

	local function var_43_0(arg_44_0, arg_44_1)
		arg_43_2(arg_44_0, arg_44_1, arg_43_0.isAutoPlay)
	end

	arg_43_0:Play(arg_43_1, var_43_0, arg_43_3, arg_43_4, true, false, arg_43_5)
end

function var_0_0.SeriesPlay(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5, arg_45_6, arg_45_7)
	local var_45_0 = {}

	for iter_45_0, iter_45_1 in ipairs(arg_45_1) do
		table.insert(var_45_0, function(arg_46_0)
			arg_45_0:SoloPlay(iter_45_1, arg_46_0, arg_45_3, arg_45_4, arg_45_5, arg_45_6, arg_45_7)
		end)
	end

	seriesAsync(var_45_0, arg_45_2)
end

function var_0_0.SoloPlay(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5, arg_47_6, arg_47_7)
	var_0_11("Play Story:", arg_47_1)

	local var_47_0 = 1

	local function var_47_1(arg_48_0, arg_48_1)
		var_47_0 = var_47_0 - 1

		if arg_47_2 and var_47_0 == 0 then
			onNextTick(function()
				arg_47_2(arg_48_0, arg_48_1)
			end)
		end
	end

	local var_47_2 = var_0_13(arg_47_1)

	if not var_47_2 then
		var_47_1(false)
		var_0_11("not exist story file")

		return nil
	end

	if arg_47_0:IsReView() then
		arg_47_3 = true
	end

	arg_47_0.storyScript = Story.New(var_47_2, arg_47_3, arg_47_0.optionSelCodes, arg_47_5, arg_47_6, arg_47_7)

	if not arg_47_0:CheckState() then
		var_0_11("story state error")
		var_47_1(false)

		return nil
	end

	if not arg_47_0.storyScript:CanPlay() then
		var_0_11("story cant be played")
		var_47_1(false)

		return nil
	end

	arg_47_0:ExecuteScript(var_47_1)
end

function var_0_0.ExecuteScript(arg_50_0, arg_50_1)
	seriesAsync({
		function(arg_51_0)
			arg_50_0:CheckResDownload(arg_50_0.storyScript, arg_51_0)
		end,
		function(arg_52_0)
			originalPrint("start load story window...")
			arg_50_0:CheckAndLoadDialogue(arg_50_0.storyScript, arg_52_0)
		end
	}, function()
		originalPrint("enter story...")
		arg_50_0:OnStart()

		local var_53_0 = {}

		arg_50_0.currPlayer = nil
		arg_50_0.progress = 0

		for iter_53_0, iter_53_1 in ipairs(arg_50_0.storyScript.steps) do
			table.insert(var_53_0, function(arg_54_0)
				arg_50_0.progress = iter_53_0

				arg_50_0:SendNotification(GAME.STORY_NEXT)

				local var_54_0 = arg_50_0.players[iter_53_1:GetMode()]

				arg_50_0.currPlayer = var_54_0

				var_54_0:Play(arg_50_0.storyScript, iter_53_0, arg_54_0)
			end)
		end

		seriesAsync(var_53_0, function()
			arg_50_0:OnEnd(arg_50_1)
		end)
	end)
end

function var_0_0.SendNotification(arg_56_0, arg_56_1, arg_56_2)
	pg.m02:sendNotification(arg_56_1, arg_56_2)
end

function var_0_0.CheckResDownload(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = arg_57_0:_GetStoryPaintingsByName(arg_57_1)
	local var_57_1 = table.concat(var_57_0, ",")

	originalPrint("start download res " .. var_57_1)

	local var_57_2 = {}

	for iter_57_0, iter_57_1 in ipairs(var_57_0) do
		PaintingGroupConst.AddPaintingNameWithFilteMap(var_57_2, iter_57_1)
	end

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_57_2,
		finishFunc = arg_57_2
	})
end

local function var_0_15(arg_58_0, arg_58_1)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_58_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_59_0)
		arg_58_1(arg_59_0)
	end), true, true)
end

function var_0_0.CheckAndLoadDialogue(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = arg_60_1:GetDialogueStyleName()

	if not arg_60_0.dialogueContainer:Find(var_60_0) then
		var_0_15("NewStoryDialogue" .. var_60_0, function(arg_61_0)
			Object.Instantiate(arg_61_0, arg_60_0.dialogueContainer).name = var_60_0

			arg_60_2()
		end)
	else
		arg_60_2()
	end
end

function var_0_0.CheckState(arg_62_0)
	if arg_62_0.state == var_0_3 or arg_62_0.state == var_0_1 or arg_62_0.state == var_0_4 then
		return false
	end

	return true
end

function var_0_0.RegistSkipBtn(arg_63_0)
	local function var_63_0()
		arg_63_0:TrackingSkip()
		arg_63_0.storyScript:SkipAll()
		arg_63_0.currPlayer:NextOneImmediately()
	end

	onButton(arg_63_0, arg_63_0.skipBtn, function()
		if arg_63_0:IsStopping() or arg_63_0:IsPausing() then
			return
		end

		if not arg_63_0.currPlayer:CanSkip() then
			return
		end

		if arg_63_0:IsReView() or arg_63_0.storyScript:IsPlayed() or not arg_63_0.storyScript:ShowSkipTip() then
			var_63_0()

			return
		end

		arg_63_0:Pause()

		arg_63_0.isOpenMsgbox = true

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			parent = rtf(arg_63_0._tf:Find("front")),
			content = i18n("story_skip_confirm"),
			onYes = function()
				arg_63_0:Resume()
				var_63_0()
			end,
			onNo = function()
				arg_63_0.isOpenMsgbox = false

				arg_63_0:Resume()
			end
		})
	end, SFX_PANEL)
end

function var_0_0.RegistAutoBtn(arg_68_0)
	onButton(arg_68_0, arg_68_0.autoBtn, function()
		if arg_68_0:IsStopping() or arg_68_0:IsPausing() then
			return
		end

		if arg_68_0.storyScript:GetAutoPlayFlag() then
			arg_68_0.storyScript:StopAutoPlay()
			arg_68_0.currPlayer:CancelAuto()
		else
			arg_68_0.storyScript:SetAutoPlay()
			arg_68_0.currPlayer:NextOne()
		end

		if arg_68_0.storyScript then
			arg_68_0:UpdateAutoBtn()
		end
	end, SFX_PANEL)

	local var_68_0 = arg_68_0:IsAutoPlay()

	if var_68_0 then
		arg_68_0.storyScript:SetAutoPlay()
		arg_68_0:UpdateAutoBtn()

		arg_68_0.autoPlayFlag = false
	end

	arg_68_0.banPlayFlag = false
	arg_68_0.isAutoPlay = var_68_0
end

function var_0_0.RegistRecordBtn(arg_70_0)
	onButton(arg_70_0, arg_70_0.recordBtn, function()
		if arg_70_0.storyScript:GetAutoPlayFlag() then
			return
		end

		if not arg_70_0.recordPanel:CanOpen() then
			return
		end

		local var_71_0 = "Show"

		arg_70_0.recordPanel[var_71_0](arg_70_0.recordPanel, arg_70_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.TriggerAutoBtn(arg_72_0)
	if not arg_72_0:IsRunning() then
		return
	end

	triggerButton(arg_72_0.autoBtn)
end

function var_0_0.TriggerSkipBtn(arg_73_0)
	if not arg_73_0:IsRunning() then
		return
	end

	triggerButton(arg_73_0.skipBtn)
end

function var_0_0.ForEscPress(arg_74_0)
	if arg_74_0.recordPanel:IsShowing() then
		arg_74_0.recordPanel:Hide()
	elseif arg_74_0.currPlayer and arg_74_0.currPlayer:WaitForEvent() or arg_74_0.currPlayer and arg_74_0.storyScript and arg_74_0.storyScript.hideSkip then
		-- block empty
	else
		arg_74_0:TriggerSkipBtn()
	end
end

function var_0_0.UpdatePlaySpeed(arg_75_0, arg_75_1)
	if arg_75_0:IsRunning() and arg_75_0.storyScript then
		arg_75_0.storyScript:SetPlaySpeed(arg_75_1)
	end
end

function var_0_0.GetPlaySpeed(arg_76_0)
	if arg_76_0:IsRunning() and arg_76_0.storyScript then
		return arg_76_0.storyScript:GetPlaySpeed()
	end
end

function var_0_0.OnStart(arg_77_0)
	arg_77_0.recorder:Clear()
	removeOnButton(arg_77_0._go)
	removeOnButton(arg_77_0.skipBtn)
	removeOnButton(arg_77_0.autoBtn)
	removeOnButton(arg_77_0.recordBtn)

	arg_77_0.mainImage.color = Color(0, 0, 0, arg_77_0.storyScript:GetStoryAlpha())

	setActive(arg_77_0.recordBtn, not arg_77_0.storyScript:ShouldHideRecord())
	arg_77_0:ClearStoryEventTriggerListener()

	local var_77_0 = arg_77_0.storyScript:GetAllStepDispatcherRecallName()

	if #var_77_0 > 0 then
		arg_77_0.storyEventTriggerListener = StoryEventTriggerListener.New(var_77_0)
	end

	arg_77_0.mainImage.enabled = not arg_77_0.storyScript:CanInteraction()
	arg_77_0.state = var_0_3

	arg_77_0:TrackingStart()
	arg_77_0:SendNotification(GAME.STORY_BEGIN, arg_77_0.storyScript:GetName())

	if not arg_77_0:IsReView() then
		arg_77_0:SendNotification(GAME.STORY_UPDATE, {
			storyId = arg_77_0.storyScript:GetName()
		})
	end

	pg.DelegateInfo.New(arg_77_0)

	for iter_77_0, iter_77_1 in ipairs(arg_77_0.players) do
		iter_77_1:StoryStart(arg_77_0.storyScript)
	end

	setActive(arg_77_0._go, true)
	arg_77_0._tf:SetAsLastSibling()
	setActive(arg_77_0.skipBtn, not arg_77_0.storyScript:ShouldHideSkip())
	setActive(arg_77_0.autoBtn, not arg_77_0.storyScript:ShouldHideAutoBtn())

	arg_77_0.bgmVolumeValue = pg.CriMgr.GetInstance():getBGMVolume()

	arg_77_0:RegistSkipBtn()
	arg_77_0:RegistAutoBtn()
	arg_77_0:RegistRecordBtn()
	arg_77_0:RegistHideUIBtn()
end

function var_0_0.RegistHideUIBtn(arg_78_0)
	onButton(arg_78_0, arg_78_0.hideUIBtn, function()
		if arg_78_0.storyScript:GetAutoPlayFlag() then
			arg_78_0.storyScript:StopAutoPlay()
			arg_78_0.currPlayer:CancelAuto()
			arg_78_0:UpdateAutoBtn()
		end

		setActiveByCanvasGroup(arg_78_0.frontTr, false)
		setActive(arg_78_0.frontEvtTr, true)
	end, SFX_PANEL)
	onButton(arg_78_0, arg_78_0.frontEvtTr, function()
		setActiveByCanvasGroup(arg_78_0.frontTr, true)
		setActive(arg_78_0.frontEvtTr, false)
	end, SFX_PANEL)
end

function var_0_0.TrackingStart(arg_81_0)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return
	end

	arg_81_0.trackFlag = false

	if not arg_81_0.storyScript then
		return
	end

	local var_81_0 = arg_81_0:StoryName2StoryId(arg_81_0.storyScript:GetName())

	if var_81_0 and not arg_81_0:GetPlayedFlag(var_81_0) then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryStart(var_81_0, 0))

		arg_81_0.trackFlag = true
	end
end

function var_0_0.TrackingSkip(arg_82_0)
	if not arg_82_0.trackFlag or not arg_82_0.storyScript then
		return
	end

	local var_82_0 = arg_82_0:StoryName2StoryId(arg_82_0.storyScript:GetName())

	if var_82_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStorySkip(var_82_0, arg_82_0.progress or 0))
	end
end

function var_0_0.TrackingOption(arg_83_0, arg_83_1, arg_83_2)
	if not arg_83_0.storyScript or not arg_83_1 or not arg_83_2 then
		return
	end

	local var_83_0 = arg_83_0:StoryName2StoryId(arg_83_0.storyScript:GetName())

	if var_83_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryOption(var_83_0, arg_83_1 .. "_" .. (arg_83_2 or 0)))
	end
end

function var_0_0.ClearStoryEvent(arg_84_0)
	if arg_84_0.storyEventTriggerListener then
		arg_84_0.storyEventTriggerListener:Clear()
	end
end

function var_0_0.CheckStoryEvent(arg_85_0, arg_85_1)
	if arg_85_0.storyEventTriggerListener then
		return arg_85_0.storyEventTriggerListener:ExistCache(arg_85_1)
	end

	return false
end

function var_0_0.GetStoryEventArg(arg_86_0, arg_86_1)
	if not arg_86_0:CheckStoryEvent(arg_86_1) then
		return nil
	end

	if arg_86_0.storyEventTriggerListener and arg_86_0.storyEventTriggerListener:ExistArg(arg_86_1) then
		return arg_86_0.storyEventTriggerListener:GetArg(arg_86_1)
	end

	return nil
end

function var_0_0.UpdateAutoBtn(arg_87_0)
	local var_87_0 = arg_87_0.storyScript:GetAutoPlayFlag()

	arg_87_0:ClearAutoBtn(var_87_0)
end

function var_0_0.ClearAutoBtn(arg_88_0, arg_88_1)
	arg_88_0.autoBtnImg.color = arg_88_1 and var_0_8 or var_0_9
	arg_88_0.isAutoPlay = arg_88_1

	local var_88_0 = arg_88_1 and "Show" or "Hide"

	arg_88_0.setSpeedPanel[var_88_0](arg_88_0.setSpeedPanel, arg_88_0.storyScript)
end

function var_0_0.ClearStoryEventTriggerListener(arg_89_0)
	if arg_89_0.storyEventTriggerListener then
		arg_89_0.storyEventTriggerListener:Dispose()

		arg_89_0.storyEventTriggerListener = nil
	end
end

function var_0_0.Clear(arg_90_0)
	arg_90_0.progress = 0

	arg_90_0:ClearStoryEventTriggerListener()

	arg_90_0.mainImage.enabled = true

	arg_90_0.recorder:Clear()
	arg_90_0.recordPanel:Hide()

	arg_90_0.autoPlayFlag = false
	arg_90_0.banPlayFlag = false

	removeOnButton(arg_90_0._go)
	removeOnButton(arg_90_0.skipBtn)
	removeOnButton(arg_90_0.recordBtn)
	removeOnButton(arg_90_0.autoBtn)
	removeOnButton(arg_90_0.hideUIBtn)
	removeOnButton(arg_90_0.frontEvtTr)
	arg_90_0:ClearAutoBtn(false)

	if isActive(arg_90_0._go) then
		pg.DelegateInfo.Dispose(arg_90_0)
	end

	if arg_90_0.setSpeedPanel then
		arg_90_0.setSpeedPanel:Clear()
	end

	setActive(arg_90_0.skipBtn, false)
	setActive(arg_90_0._go, false)

	arg_90_0.branchSelectCache = {}

	_.each(arg_90_0.players, function(arg_91_0)
		for iter_91_0, iter_91_1 in pairs(arg_91_0.branchCodeList) do
			_.each(iter_91_1, function(arg_92_0)
				table.insert(arg_90_0.branchSelectCache, arg_92_0)
			end)
		end
	end)

	for iter_90_0, iter_90_1 in ipairs(arg_90_0.players) do
		iter_90_1:StoryEnd(arg_90_0.storyScript)
	end

	arg_90_0.optionSelCodes = nil

	arg_90_0:SendNotification(GAME.STORY_END)

	if arg_90_0.isOpenMsgbox then
		pg.MsgboxMgr.GetInstance():hide()
	end

	arg_90_0:RevertBgmVolumeValue()
end

function var_0_0.RevertBgmVolumeValue(arg_93_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_93_0 = pg.CriMgr.GetInstance():getBGMVolume()

	if arg_93_0.bgmVolumeValue and arg_93_0.bgmVolumeValue ~= var_93_0 then
		pg.CriMgr.GetInstance():setBGMVolume(arg_93_0.bgmVolumeValue)
	end

	arg_93_0.bgmVolumeValue = nil
end

function var_0_0.OnEnd(arg_94_0, arg_94_1)
	arg_94_0:Clear()

	if arg_94_0.state == var_0_3 or arg_94_0.state == var_0_5 then
		arg_94_0.state = var_0_6

		local var_94_0 = arg_94_0.storyScript:GetNextScriptName()

		if var_94_0 and not arg_94_0:IsReView() then
			arg_94_0.storyScript = nil

			arg_94_0:SoloPlay(var_94_0, arg_94_1, true)
		else
			local var_94_1 = arg_94_0.storyScript:GetBranchCode()

			arg_94_0.storyScript = nil

			if arg_94_1 then
				arg_94_1(true, var_94_1)
			end
		end
	else
		arg_94_0.state = var_0_6

		local var_94_2 = arg_94_0.storyScript:GetBranchCode()

		if arg_94_1 then
			arg_94_1(true, var_94_2)
		end
	end
end

function var_0_0.OnSceneEnter(arg_95_0, arg_95_1)
	if not arg_95_0.scenes then
		arg_95_0.scenes = {}
	end

	arg_95_0.scenes[arg_95_1.view] = true
end

function var_0_0.OnSceneExit(arg_96_0, arg_96_1)
	if not arg_96_0.scenes then
		return
	end

	arg_96_0.scenes[arg_96_1.view] = nil
end

function var_0_0.IsReView(arg_97_0)
	if getProxy(ContextProxy) == nil then
		return false
	end

	local var_97_0 = getProxy(ContextProxy):GetPrevContext(1)

	return arg_97_0.scenes[WorldMediaCollectionScene.__cname] == true or var_97_0 and var_97_0.mediator == WorldMediaCollectionMediator
end

function var_0_0.IsRunning(arg_98_0)
	return arg_98_0.state == var_0_3
end

function var_0_0.IsStopping(arg_99_0)
	return arg_99_0.state == var_0_5
end

function var_0_0.IsPausing(arg_100_0)
	return arg_100_0.state == var_0_4
end

function var_0_0.IsAutoPlay(arg_101_0)
	if arg_101_0.banPlayFlag then
		return false
	end

	return getProxy(SettingsProxy):GetStoryAutoPlayFlag() or arg_101_0.autoPlayFlag == true
end

function var_0_0.GetRectSize(arg_102_0)
	return Vector2(arg_102_0._tf.rect.width, arg_102_0._tf.rect.height)
end

function var_0_0.AddRecord(arg_103_0, arg_103_1)
	arg_103_0.recorder:Add(arg_103_1)
end

function var_0_0.Quit(arg_104_0)
	arg_104_0.recorder:Dispose()
	arg_104_0.recordPanel:Dispose()
	arg_104_0.setSpeedPanel:Dispose()

	if arg_104_0.currPlayer and arg_104_0.currPlayer:WaitForEvent() then
		arg_104_0:Clear()
	end

	arg_104_0.state = var_0_7
	arg_104_0.storyScript = nil
	arg_104_0.currPlayer = nil
	arg_104_0.playQueue = {}
	arg_104_0.playedList = {}
	arg_104_0.scenes = {}
end

function var_0_0.Fix(arg_105_0)
	local var_105_0 = getProxy(PlayerProxy):getRawData():GetRegisterTime()
	local var_105_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig({
		{
			2021,
			4,
			8
		},
		{
			9,
			0,
			0
		}
	})
	local var_105_2 = {
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027
	}

	if var_105_0 <= var_105_1 then
		_.each(var_105_2, function(arg_106_0)
			arg_105_0.playedList[arg_106_0] = true
		end)
	end

	local var_105_3 = 5001
	local var_105_4 = 5020
	local var_105_5 = getProxy(TaskProxy)
	local var_105_6 = 0

	for iter_105_0 = var_105_3, var_105_4, -1 do
		if var_105_5:getFinishTaskById(iter_105_0) or var_105_5:getTaskById(iter_105_0) then
			var_105_6 = iter_105_0

			break
		end
	end

	for iter_105_1 = var_105_6, var_105_4, -1 do
		local var_105_7 = pg.task_data_template[iter_105_1]

		if var_105_7 then
			local var_105_8 = var_105_7.story_id

			if var_105_8 and #var_105_8 > 0 and not arg_105_0:IsPlayed(var_105_8) then
				arg_105_0.playedList[var_105_8] = true
			end
		end
	end

	local var_105_9 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

	if var_105_9 and not var_105_9:isEnd() then
		local var_105_10 = _.flatten(var_105_9:getConfig("config_data"))
		local var_105_11

		for iter_105_2 = #var_105_10, 1, -1 do
			local var_105_12 = pg.task_data_template[var_105_10[iter_105_2]].story_id

			if var_105_12 and #var_105_12 > 0 then
				local var_105_13 = arg_105_0:IsPlayed(var_105_12)

				if var_105_11 then
					if not var_105_13 then
						arg_105_0.playedList[var_105_12] = true
					end
				elseif var_105_13 then
					var_105_11 = iter_105_2
				end
			end
		end
	end
end
