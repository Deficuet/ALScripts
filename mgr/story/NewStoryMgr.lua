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

function var_0_0.PlayForTb(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	arg_36_0:Play(arg_36_1, arg_36_3, arg_36_4, false, false, true, arg_36_2)
end

function var_0_0.PlayForWorld(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4, arg_37_5, arg_37_6, arg_37_7, arg_37_8)
	arg_37_0.optionSelCodes = arg_37_2 or {}
	arg_37_0.autoPlayFlag = arg_37_6

	arg_37_0:Play(arg_37_1, arg_37_3, arg_37_4, arg_37_5, arg_37_7, true, arg_37_8)
end

function var_0_0.ForceAutoPlay(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4, arg_38_5)
	arg_38_0.autoPlayFlag = true

	local function var_38_0(arg_39_0, arg_39_1)
		arg_38_2(arg_39_0, arg_39_1, arg_38_0.isAutoPlay)
	end

	arg_38_0:Play(arg_38_1, var_38_0, arg_38_3, arg_38_4, true, false, arg_38_5)
end

function var_0_0.ForceManualPlay(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4, arg_40_5)
	arg_40_0.banPlayFlag = true

	local function var_40_0(arg_41_0, arg_41_1)
		arg_40_2(arg_41_0, arg_41_1, arg_40_0.isAutoPlay)
	end

	arg_40_0:Play(arg_40_1, var_40_0, arg_40_3, arg_40_4, true, false, arg_40_5)
end

function var_0_0.SeriesPlay(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4, arg_42_5, arg_42_6, arg_42_7)
	local var_42_0 = {}

	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		table.insert(var_42_0, function(arg_43_0)
			arg_42_0:SoloPlay(iter_42_1, arg_43_0, arg_42_3, arg_42_4, arg_42_5, arg_42_6, arg_42_7)
		end)
	end

	seriesAsync(var_42_0, arg_42_2)
end

function var_0_0.SoloPlay(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5, arg_44_6, arg_44_7)
	var_0_11("Play Story:", arg_44_1)

	local var_44_0 = 1

	local function var_44_1(arg_45_0, arg_45_1)
		var_44_0 = var_44_0 - 1

		if arg_44_2 and var_44_0 == 0 then
			onNextTick(function()
				arg_44_2(arg_45_0, arg_45_1)
			end)
		end
	end

	local var_44_2 = var_0_13(arg_44_1)

	if not var_44_2 then
		var_44_1(false)
		var_0_11("not exist story file")

		return nil
	end

	if arg_44_0:IsReView() then
		arg_44_3 = true
	end

	arg_44_0.storyScript = Story.New(var_44_2, arg_44_3, arg_44_0.optionSelCodes, arg_44_5, arg_44_6, arg_44_7)

	if not arg_44_0:CheckState() then
		var_0_11("story state error")
		var_44_1(false)

		return nil
	end

	if not arg_44_0.storyScript:CanPlay() then
		var_0_11("story cant be played")
		var_44_1(false)

		return nil
	end

	arg_44_0:ExecuteScript(var_44_1)
end

function var_0_0.ExecuteScript(arg_47_0, arg_47_1)
	seriesAsync({
		function(arg_48_0)
			arg_47_0:CheckResDownload(arg_47_0.storyScript, arg_48_0)
		end,
		function(arg_49_0)
			originalPrint("start load story window...")
			arg_47_0:CheckAndLoadDialogue(arg_47_0.storyScript, arg_49_0)
		end
	}, function()
		originalPrint("enter story...")
		arg_47_0:OnStart()

		local var_50_0 = {}

		arg_47_0.currPlayer = nil
		arg_47_0.progress = 0

		for iter_50_0, iter_50_1 in ipairs(arg_47_0.storyScript.steps) do
			table.insert(var_50_0, function(arg_51_0)
				arg_47_0.progress = iter_50_0

				arg_47_0:SendNotification(GAME.STORY_NEXT)

				local var_51_0 = arg_47_0.players[iter_50_1:GetMode()]

				arg_47_0.currPlayer = var_51_0

				var_51_0:Play(arg_47_0.storyScript, iter_50_0, arg_51_0)
			end)
		end

		seriesAsync(var_50_0, function()
			arg_47_0:OnEnd(arg_47_1)
		end)
	end)
end

function var_0_0.SendNotification(arg_53_0, arg_53_1, arg_53_2)
	pg.m02:sendNotification(arg_53_1, arg_53_2)
end

function var_0_0.CheckResDownload(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = arg_54_0:_GetStoryPaintingsByName(arg_54_1)
	local var_54_1 = table.concat(var_54_0, ",")

	originalPrint("start download res " .. var_54_1)

	local var_54_2 = {}

	for iter_54_0, iter_54_1 in ipairs(var_54_0) do
		PaintingGroupConst.AddPaintingNameWithFilteMap(var_54_2, iter_54_1)
	end

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_54_2,
		finishFunc = arg_54_2
	})
end

local function var_0_15(arg_55_0, arg_55_1)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_55_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_56_0)
		arg_55_1(arg_56_0)
	end), true, true)
end

function var_0_0.CheckAndLoadDialogue(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = arg_57_1:GetDialogueStyleName()

	if not arg_57_0.dialogueContainer:Find(var_57_0) then
		var_0_15("NewStoryDialogue" .. var_57_0, function(arg_58_0)
			Object.Instantiate(arg_58_0, arg_57_0.dialogueContainer).name = var_57_0

			arg_57_2()
		end)
	else
		arg_57_2()
	end
end

function var_0_0.CheckState(arg_59_0)
	if arg_59_0.state == var_0_3 or arg_59_0.state == var_0_1 or arg_59_0.state == var_0_4 then
		return false
	end

	return true
end

function var_0_0.RegistSkipBtn(arg_60_0)
	local function var_60_0()
		arg_60_0:TrackingSkip()
		arg_60_0.storyScript:SkipAll()
		arg_60_0.currPlayer:NextOneImmediately()
	end

	onButton(arg_60_0, arg_60_0.skipBtn, function()
		if arg_60_0:IsStopping() or arg_60_0:IsPausing() then
			return
		end

		if not arg_60_0.currPlayer:CanSkip() then
			return
		end

		if arg_60_0:IsReView() or arg_60_0.storyScript:IsPlayed() or not arg_60_0.storyScript:ShowSkipTip() then
			var_60_0()

			return
		end

		arg_60_0:Pause()

		arg_60_0.isOpenMsgbox = true

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			parent = rtf(arg_60_0._tf:Find("front")),
			content = i18n("story_skip_confirm"),
			onYes = function()
				arg_60_0:Resume()
				var_60_0()
			end,
			onNo = function()
				arg_60_0.isOpenMsgbox = false

				arg_60_0:Resume()
			end
		})
	end, SFX_PANEL)
end

function var_0_0.RegistAutoBtn(arg_65_0)
	onButton(arg_65_0, arg_65_0.autoBtn, function()
		if arg_65_0:IsStopping() or arg_65_0:IsPausing() then
			return
		end

		if arg_65_0.storyScript:GetAutoPlayFlag() then
			arg_65_0.storyScript:StopAutoPlay()
			arg_65_0.currPlayer:CancelAuto()
		else
			arg_65_0.storyScript:SetAutoPlay()
			arg_65_0.currPlayer:NextOne()
		end

		if arg_65_0.storyScript then
			arg_65_0:UpdateAutoBtn()
		end
	end, SFX_PANEL)

	local var_65_0 = arg_65_0:IsAutoPlay()

	if var_65_0 then
		arg_65_0.storyScript:SetAutoPlay()
		arg_65_0:UpdateAutoBtn()

		arg_65_0.autoPlayFlag = false
	end

	arg_65_0.banPlayFlag = false
	arg_65_0.isAutoPlay = var_65_0
end

function var_0_0.RegistRecordBtn(arg_67_0)
	onButton(arg_67_0, arg_67_0.recordBtn, function()
		if arg_67_0.storyScript:GetAutoPlayFlag() then
			return
		end

		if not arg_67_0.recordPanel:CanOpen() then
			return
		end

		local var_68_0 = "Show"

		arg_67_0.recordPanel[var_68_0](arg_67_0.recordPanel, arg_67_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.TriggerAutoBtn(arg_69_0)
	if not arg_69_0:IsRunning() then
		return
	end

	triggerButton(arg_69_0.autoBtn)
end

function var_0_0.TriggerSkipBtn(arg_70_0)
	if not arg_70_0:IsRunning() then
		return
	end

	triggerButton(arg_70_0.skipBtn)
end

function var_0_0.ForEscPress(arg_71_0)
	if arg_71_0.recordPanel:IsShowing() then
		arg_71_0.recordPanel:Hide()
	elseif arg_71_0.currPlayer and arg_71_0.currPlayer:WaitForEvent() or arg_71_0.currPlayer and arg_71_0.storyScript and arg_71_0.storyScript.hideSkip then
		-- block empty
	else
		arg_71_0:TriggerSkipBtn()
	end
end

function var_0_0.UpdatePlaySpeed(arg_72_0, arg_72_1)
	if arg_72_0:IsRunning() and arg_72_0.storyScript then
		arg_72_0.storyScript:SetPlaySpeed(arg_72_1)
	end
end

function var_0_0.GetPlaySpeed(arg_73_0)
	if arg_73_0:IsRunning() and arg_73_0.storyScript then
		return arg_73_0.storyScript:GetPlaySpeed()
	end
end

function var_0_0.OnStart(arg_74_0)
	arg_74_0.recorder:Clear()
	removeOnButton(arg_74_0._go)
	removeOnButton(arg_74_0.skipBtn)
	removeOnButton(arg_74_0.autoBtn)
	removeOnButton(arg_74_0.recordBtn)

	arg_74_0.mainImage.color = Color(0, 0, 0, arg_74_0.storyScript:GetStoryAlpha())

	setActive(arg_74_0.recordBtn, not arg_74_0.storyScript:ShouldHideRecord())
	arg_74_0:ClearStoryEventTriggerListener()

	local var_74_0 = arg_74_0.storyScript:GetAllStepDispatcherRecallName()

	if #var_74_0 > 0 then
		arg_74_0.storyEventTriggerListener = StoryEventTriggerListener.New(var_74_0)
	end

	arg_74_0.mainImage.enabled = not arg_74_0.storyScript:CanInteraction()
	arg_74_0.state = var_0_3

	arg_74_0:TrackingStart()
	arg_74_0:SendNotification(GAME.STORY_BEGIN, arg_74_0.storyScript:GetName())

	if not arg_74_0:IsReView() then
		arg_74_0:SendNotification(GAME.STORY_UPDATE, {
			storyId = arg_74_0.storyScript:GetName()
		})
	end

	pg.DelegateInfo.New(arg_74_0)

	for iter_74_0, iter_74_1 in ipairs(arg_74_0.players) do
		iter_74_1:StoryStart(arg_74_0.storyScript)
	end

	setActive(arg_74_0._go, true)
	arg_74_0._tf:SetAsLastSibling()
	setActive(arg_74_0.skipBtn, not arg_74_0.storyScript:ShouldHideSkip())
	setActive(arg_74_0.autoBtn, not arg_74_0.storyScript:ShouldHideAutoBtn())

	arg_74_0.bgmVolumeValue = pg.CriMgr.GetInstance():getBGMVolume()

	arg_74_0:RegistSkipBtn()
	arg_74_0:RegistAutoBtn()
	arg_74_0:RegistRecordBtn()
	arg_74_0:RegistHideUIBtn()
end

function var_0_0.RegistHideUIBtn(arg_75_0)
	onButton(arg_75_0, arg_75_0.hideUIBtn, function()
		if arg_75_0.storyScript:GetAutoPlayFlag() then
			arg_75_0.storyScript:StopAutoPlay()
			arg_75_0.currPlayer:CancelAuto()
			arg_75_0:UpdateAutoBtn()
		end

		setActiveByCanvasGroup(arg_75_0.frontTr, false)
		setActive(arg_75_0.frontEvtTr, true)
	end, SFX_PANEL)
	onButton(arg_75_0, arg_75_0.frontEvtTr, function()
		setActiveByCanvasGroup(arg_75_0.frontTr, true)
		setActive(arg_75_0.frontEvtTr, false)
	end, SFX_PANEL)
end

function var_0_0.TrackingStart(arg_78_0)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return
	end

	arg_78_0.trackFlag = false

	if not arg_78_0.storyScript then
		return
	end

	local var_78_0 = arg_78_0:StoryName2StoryId(arg_78_0.storyScript:GetName())

	if var_78_0 and not arg_78_0:GetPlayedFlag(var_78_0) then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryStart(var_78_0, 0))

		arg_78_0.trackFlag = true
	end
end

function var_0_0.TrackingSkip(arg_79_0)
	if not arg_79_0.trackFlag or not arg_79_0.storyScript then
		return
	end

	local var_79_0 = arg_79_0:StoryName2StoryId(arg_79_0.storyScript:GetName())

	if var_79_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStorySkip(var_79_0, arg_79_0.progress or 0))
	end
end

function var_0_0.TrackingOption(arg_80_0, arg_80_1, arg_80_2)
	if not arg_80_0.storyScript or not arg_80_1 or not arg_80_2 then
		return
	end

	local var_80_0 = arg_80_0:StoryName2StoryId(arg_80_0.storyScript:GetName())

	if var_80_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryOption(var_80_0, arg_80_1 .. "_" .. (arg_80_2 or 0)))
	end
end

function var_0_0.ClearStoryEvent(arg_81_0)
	if arg_81_0.storyEventTriggerListener then
		arg_81_0.storyEventTriggerListener:Clear()
	end
end

function var_0_0.CheckStoryEvent(arg_82_0, arg_82_1)
	if arg_82_0.storyEventTriggerListener then
		return arg_82_0.storyEventTriggerListener:ExistCache(arg_82_1)
	end

	return false
end

function var_0_0.GetStoryEventArg(arg_83_0, arg_83_1)
	if not arg_83_0:CheckStoryEvent(arg_83_1) then
		return nil
	end

	if arg_83_0.storyEventTriggerListener and arg_83_0.storyEventTriggerListener:ExistArg(arg_83_1) then
		return arg_83_0.storyEventTriggerListener:GetArg(arg_83_1)
	end

	return nil
end

function var_0_0.UpdateAutoBtn(arg_84_0)
	local var_84_0 = arg_84_0.storyScript:GetAutoPlayFlag()

	arg_84_0:ClearAutoBtn(var_84_0)
end

function var_0_0.ClearAutoBtn(arg_85_0, arg_85_1)
	arg_85_0.autoBtnImg.color = arg_85_1 and var_0_8 or var_0_9
	arg_85_0.isAutoPlay = arg_85_1

	local var_85_0 = arg_85_1 and "Show" or "Hide"

	arg_85_0.setSpeedPanel[var_85_0](arg_85_0.setSpeedPanel, arg_85_0.storyScript)
end

function var_0_0.ClearStoryEventTriggerListener(arg_86_0)
	if arg_86_0.storyEventTriggerListener then
		arg_86_0.storyEventTriggerListener:Dispose()

		arg_86_0.storyEventTriggerListener = nil
	end
end

function var_0_0.Clear(arg_87_0)
	arg_87_0.progress = 0

	arg_87_0:ClearStoryEventTriggerListener()

	arg_87_0.mainImage.enabled = true

	arg_87_0.recorder:Clear()
	arg_87_0.recordPanel:Hide()

	arg_87_0.autoPlayFlag = false
	arg_87_0.banPlayFlag = false

	removeOnButton(arg_87_0._go)
	removeOnButton(arg_87_0.skipBtn)
	removeOnButton(arg_87_0.recordBtn)
	removeOnButton(arg_87_0.autoBtn)
	removeOnButton(arg_87_0.hideUIBtn)
	removeOnButton(arg_87_0.frontEvtTr)
	arg_87_0:ClearAutoBtn(false)

	if isActive(arg_87_0._go) then
		pg.DelegateInfo.Dispose(arg_87_0)
	end

	if arg_87_0.setSpeedPanel then
		arg_87_0.setSpeedPanel:Clear()
	end

	setActive(arg_87_0.skipBtn, false)
	setActive(arg_87_0._go, false)

	for iter_87_0, iter_87_1 in ipairs(arg_87_0.players) do
		iter_87_1:StoryEnd(arg_87_0.storyScript)
	end

	arg_87_0.optionSelCodes = nil

	arg_87_0:SendNotification(GAME.STORY_END)

	if arg_87_0.isOpenMsgbox then
		pg.MsgboxMgr.GetInstance():hide()
	end

	arg_87_0:RevertBgmVolumeValue()
end

function var_0_0.RevertBgmVolumeValue(arg_88_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_88_0 = pg.CriMgr.GetInstance():getBGMVolume()

	if arg_88_0.bgmVolumeValue and arg_88_0.bgmVolumeValue ~= var_88_0 then
		pg.CriMgr.GetInstance():setBGMVolume(arg_88_0.bgmVolumeValue)
	end

	arg_88_0.bgmVolumeValue = nil
end

function var_0_0.OnEnd(arg_89_0, arg_89_1)
	arg_89_0:Clear()

	if arg_89_0.state == var_0_3 or arg_89_0.state == var_0_5 then
		arg_89_0.state = var_0_6

		local var_89_0 = arg_89_0.storyScript:GetNextScriptName()

		if var_89_0 and not arg_89_0:IsReView() then
			arg_89_0.storyScript = nil

			arg_89_0:SoloPlay(var_89_0, arg_89_1, true)
		else
			local var_89_1 = arg_89_0.storyScript:GetBranchCode()

			arg_89_0.storyScript = nil

			if arg_89_1 then
				arg_89_1(true, var_89_1)
			end
		end
	else
		arg_89_0.state = var_0_6

		local var_89_2 = arg_89_0.storyScript:GetBranchCode()

		if arg_89_1 then
			arg_89_1(true, var_89_2)
		end
	end
end

function var_0_0.OnSceneEnter(arg_90_0, arg_90_1)
	if not arg_90_0.scenes then
		arg_90_0.scenes = {}
	end

	arg_90_0.scenes[arg_90_1.view] = true
end

function var_0_0.OnSceneExit(arg_91_0, arg_91_1)
	if not arg_91_0.scenes then
		return
	end

	arg_91_0.scenes[arg_91_1.view] = nil
end

function var_0_0.IsReView(arg_92_0)
	if getProxy(ContextProxy) == nil then
		return false
	end

	local var_92_0 = getProxy(ContextProxy):GetPrevContext(1)

	return arg_92_0.scenes[WorldMediaCollectionScene.__cname] == true or var_92_0 and var_92_0.mediator == WorldMediaCollectionMediator
end

function var_0_0.IsRunning(arg_93_0)
	return arg_93_0.state == var_0_3
end

function var_0_0.IsStopping(arg_94_0)
	return arg_94_0.state == var_0_5
end

function var_0_0.IsPausing(arg_95_0)
	return arg_95_0.state == var_0_4
end

function var_0_0.IsAutoPlay(arg_96_0)
	if arg_96_0.banPlayFlag then
		return false
	end

	return getProxy(SettingsProxy):GetStoryAutoPlayFlag() or arg_96_0.autoPlayFlag == true
end

function var_0_0.GetRectSize(arg_97_0)
	return Vector2(arg_97_0._tf.rect.width, arg_97_0._tf.rect.height)
end

function var_0_0.AddRecord(arg_98_0, arg_98_1)
	arg_98_0.recorder:Add(arg_98_1)
end

function var_0_0.Quit(arg_99_0)
	arg_99_0.recorder:Dispose()
	arg_99_0.recordPanel:Dispose()
	arg_99_0.setSpeedPanel:Dispose()

	if arg_99_0.currPlayer and arg_99_0.currPlayer:WaitForEvent() then
		arg_99_0:Clear()
	end

	arg_99_0.state = var_0_7
	arg_99_0.storyScript = nil
	arg_99_0.currPlayer = nil
	arg_99_0.playQueue = {}
	arg_99_0.playedList = {}
	arg_99_0.scenes = {}
end

function var_0_0.Fix(arg_100_0)
	local var_100_0 = getProxy(PlayerProxy):getRawData():GetRegisterTime()
	local var_100_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig({
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
	local var_100_2 = {
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027
	}

	if var_100_0 <= var_100_1 then
		_.each(var_100_2, function(arg_101_0)
			arg_100_0.playedList[arg_101_0] = true
		end)
	end

	local var_100_3 = 5001
	local var_100_4 = 5020
	local var_100_5 = getProxy(TaskProxy)
	local var_100_6 = 0

	for iter_100_0 = var_100_3, var_100_4, -1 do
		if var_100_5:getFinishTaskById(iter_100_0) or var_100_5:getTaskById(iter_100_0) then
			var_100_6 = iter_100_0

			break
		end
	end

	for iter_100_1 = var_100_6, var_100_4, -1 do
		local var_100_7 = pg.task_data_template[iter_100_1]

		if var_100_7 then
			local var_100_8 = var_100_7.story_id

			if var_100_8 and #var_100_8 > 0 and not arg_100_0:IsPlayed(var_100_8) then
				arg_100_0.playedList[var_100_8] = true
			end
		end
	end

	local var_100_9 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

	if var_100_9 and not var_100_9:isEnd() then
		local var_100_10 = _.flatten(var_100_9:getConfig("config_data"))
		local var_100_11

		for iter_100_2 = #var_100_10, 1, -1 do
			local var_100_12 = pg.task_data_template[var_100_10[iter_100_2]].story_id

			if var_100_12 and #var_100_12 > 0 then
				local var_100_13 = arg_100_0:IsPlayed(var_100_12)

				if var_100_11 then
					if not var_100_13 then
						arg_100_0.playedList[var_100_12] = true
					end
				elseif var_100_13 then
					var_100_11 = iter_100_2
				end
			end
		end
	end
end
