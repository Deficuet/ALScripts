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
	local var_11_0, var_11_1 = arg_11_0:StoryName2StoryId(arg_11_1)
	local var_11_2 = arg_11_0:GetPlayedFlag(var_11_0)
	local var_11_3 = true

	if var_11_1 and not arg_11_2 then
		var_11_3 = arg_11_0:GetPlayedFlag(var_11_1)
	end

	return var_11_2 and var_11_3
end

local function var_0_14(arg_12_0)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0) do
		var_12_0[iter_12_1] = iter_12_0
	end

	return var_12_0
end

function var_0_0.StoryName2StoryId(arg_13_0, arg_13_1)
	if not var_0_0.indexs then
		var_0_0.indexs = var_0_14(var_0_13("index"))
	end

	if not var_0_0.againIndexs then
		var_0_0.againIndexs = var_0_14(var_0_13("index_again"))
	end

	return var_0_0.indexs[arg_13_1], var_0_0.againIndexs[arg_13_1]
end

function var_0_0.StoryId2StoryName(arg_14_0, arg_14_1)
	if not var_0_0.indexIds then
		var_0_0.indexIds = var_0_13("index")
	end

	if not var_0_0.againIndexIds then
		var_0_0.againIndexIds = var_0_13("index_again")
	end

	return var_0_0.indexIds[arg_14_1], var_0_0.againIndexIds[arg_14_1]
end

function var_0_0.StoryLinkNames(arg_15_0, arg_15_1)
	if not var_0_0.linkNames then
		var_0_0.linkNames = var_0_13("index_link")
	end

	return var_0_0.linkNames[arg_15_1]
end

function var_0_0._GetStoryPaintingsByName(arg_16_0, arg_16_1)
	return arg_16_1:GetUsingPaintingNames()
end

function var_0_0.GetStoryPaintingsByName(arg_17_0, arg_17_1)
	local var_17_0 = var_0_13(arg_17_1)

	if not var_17_0 then
		var_0_11("not exist story file")

		return {}
	end

	local var_17_1 = Story.New(var_17_0, false)

	return arg_17_0:_GetStoryPaintingsByName(var_17_1)
end

function var_0_0.GetStoryPaintingsByNameList(arg_18_0, arg_18_1)
	local var_18_0 = {}
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_1) do
		for iter_18_2, iter_18_3 in ipairs(arg_18_0:GetStoryPaintingsByName(iter_18_1)) do
			var_18_1[iter_18_3] = true
		end
	end

	for iter_18_4, iter_18_5 in pairs(var_18_1) do
		table.insert(var_18_0, iter_18_4)
	end

	return var_18_0
end

function var_0_0.GetStoryPaintingsById(arg_19_0, arg_19_1)
	return arg_19_0:GetStoryPaintingsByIdList({
		arg_19_1
	})
end

function var_0_0.GetStoryPaintingsByIdList(arg_20_0, arg_20_1)
	local var_20_0 = _.map(arg_20_1, function(arg_21_0)
		return arg_20_0:StoryId2StoryName(arg_21_0)
	end)

	return arg_20_0:GetStoryPaintingsByNameList(var_20_0)
end

function var_0_0.ShouldDownloadRes(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetStoryPaintingsByName(arg_22_1)

	return _.any(var_22_0, function(arg_23_0)
		return PaintingGroupConst.VerifyPaintingFileName(arg_23_0)
	end)
end

function var_0_0.Init(arg_24_0, arg_24_1)
	arg_24_0.state = var_0_1

	LoadAndInstantiateAsync("ui", "NewStoryUI", function(arg_25_0)
		arg_24_0.UIOverlay = GameObject.Find("Overlay/UIOverlay")

		arg_25_0.transform:SetParent(arg_24_0.UIOverlay.transform, false)
		arg_24_0:_Init(arg_25_0, arg_24_1)
	end, true, true)
end

function var_0_0._Init(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.playedList = {}
	arg_26_0.playQueue = {}
	arg_26_0._go = arg_26_1
	arg_26_0._tf = tf(arg_26_0._go)
	arg_26_0.frontTr = findTF(arg_26_0._tf, "front")
	arg_26_0.skipBtn = findTF(arg_26_0._tf, "front/btns/btns/skip_button")
	arg_26_0.autoBtn = findTF(arg_26_0._tf, "front/btns/btns/auto_button")
	arg_26_0.autoBtnImg = findTF(arg_26_0._tf, "front/btns/btns/auto_button/sel"):GetComponent(typeof(Image))
	arg_26_0.alphaImage = arg_26_0._tf:GetComponent(typeof(Image))
	arg_26_0.mainImage = arg_26_0._tf:GetComponent(typeof(Image))
	arg_26_0.recordBtn = findTF(arg_26_0._tf, "front/btns/record")
	arg_26_0.dialogueContainer = findTF(arg_26_0._tf, "front/dialogue")
	arg_26_0.players = {
		AsideStoryPlayer.New(arg_26_1),
		DialogueStoryPlayer.New(arg_26_1),
		BgStoryPlayer.New(arg_26_1),
		CarouselPlayer.New(arg_26_1),
		VedioStoryPlayer.New(arg_26_1),
		CastStoryPlayer.New(arg_26_1),
		SpAnimStoryPlayer.New(arg_26_1),
		BlinkStoryPlayer.New(arg_26_1)
	}
	arg_26_0.setSpeedPanel = StorySetSpeedPanel.New(arg_26_0._tf, function(arg_27_0)
		arg_26_0:UpdatePlaySpeed(arg_27_0)
	end)
	arg_26_0.recordPanel = NewStoryRecordPanel.New()
	arg_26_0.recorder = StoryRecorder.New()

	setActive(arg_26_0._go, false)

	arg_26_0.state = var_0_2

	if arg_26_2 then
		arg_26_2()
	end
end

function var_0_0.GetPlayer(arg_28_0, arg_28_1)
	for iter_28_0, iter_28_1 in ipairs(arg_28_0.players) do
		if isa(iter_28_1, arg_28_1) then
			return iter_28_1
		end
	end

	return nil
end

function var_0_0.Play(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4, arg_29_5, arg_29_6, arg_29_7)
	table.insert(arg_29_0.playQueue, {
		arg_29_1,
		arg_29_2,
		arg_29_7
	})

	if #arg_29_0.playQueue == 1 then
		local var_29_0

		local function var_29_1()
			if #arg_29_0.playQueue == 0 then
				return
			end

			local var_30_0 = arg_29_0.playQueue[1][1]
			local var_30_1 = arg_29_0.playQueue[1][2]
			local var_30_2 = arg_29_0.playQueue[1][3]

			arg_29_0:SoloPlay(var_30_0, function(arg_31_0, arg_31_1)
				if var_30_1 then
					var_30_1(arg_31_0, arg_31_1)
				end

				table.remove(arg_29_0.playQueue, 1)
				var_29_1()
			end, arg_29_3, arg_29_4, arg_29_5, arg_29_6, var_30_2)
		end

		var_29_1()
	end
end

function var_0_0.Pause(arg_32_0)
	if arg_32_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	arg_32_0.state = var_0_4

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.players) do
		iter_32_1:Pause()
	end
end

function var_0_0.Resume(arg_33_0)
	if arg_33_0.state ~= var_0_4 then
		var_0_11("state is not 'pause'")

		return
	end

	arg_33_0.state = var_0_3

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.players) do
		iter_33_1:Resume()
	end
end

function var_0_0.Stop(arg_34_0)
	if arg_34_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	if arg_34_0.currPlayer and arg_34_0.currPlayer:WaitForEvent() then
		return
	end

	arg_34_0.state = var_0_5

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.players) do
		iter_34_1:Stop()
	end
end

function var_0_0.PlayForTb(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	arg_35_0:Play(arg_35_1, arg_35_3, arg_35_4, false, false, true, arg_35_2)
end

function var_0_0.PlayForWorld(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7, arg_36_8)
	arg_36_0.optionSelCodes = arg_36_2 or {}
	arg_36_0.autoPlayFlag = arg_36_6

	arg_36_0:Play(arg_36_1, arg_36_3, arg_36_4, arg_36_5, arg_36_7, true, arg_36_8)
end

function var_0_0.ForceAutoPlay(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4, arg_37_5)
	arg_37_0.autoPlayFlag = true

	local function var_37_0(arg_38_0, arg_38_1)
		arg_37_2(arg_38_0, arg_38_1, arg_37_0.isAutoPlay)
	end

	arg_37_0:Play(arg_37_1, var_37_0, arg_37_3, arg_37_4, true, false, arg_37_5)
end

function var_0_0.ForceManualPlay(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4, arg_39_5)
	arg_39_0.banPlayFlag = true

	local function var_39_0(arg_40_0, arg_40_1)
		arg_39_2(arg_40_0, arg_40_1, arg_39_0.isAutoPlay)
	end

	arg_39_0:Play(arg_39_1, var_39_0, arg_39_3, arg_39_4, true, false, arg_39_5)
end

function var_0_0.SeriesPlay(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4, arg_41_5, arg_41_6, arg_41_7)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_1) do
		table.insert(var_41_0, function(arg_42_0)
			arg_41_0:SoloPlay(iter_41_1, arg_42_0, arg_41_3, arg_41_4, arg_41_5, arg_41_6, arg_41_7)
		end)
	end

	seriesAsync(var_41_0, arg_41_2)
end

function var_0_0.SoloPlay(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4, arg_43_5, arg_43_6, arg_43_7)
	var_0_11("Play Story:", arg_43_1)

	local var_43_0 = 1

	local function var_43_1(arg_44_0, arg_44_1)
		var_43_0 = var_43_0 - 1

		if arg_43_2 and var_43_0 == 0 then
			onNextTick(function()
				arg_43_2(arg_44_0, arg_44_1)
			end)
		end
	end

	local var_43_2 = var_0_13(arg_43_1)

	if not var_43_2 then
		var_43_1(false)
		var_0_11("not exist story file")

		return nil
	end

	if arg_43_0:IsReView() then
		arg_43_3 = true
	end

	arg_43_0.storyScript = Story.New(var_43_2, arg_43_3, arg_43_0.optionSelCodes, arg_43_5, arg_43_6, arg_43_7)

	if not arg_43_0:CheckState() then
		var_0_11("story state error")
		var_43_1(false)

		return nil
	end

	if not arg_43_0.storyScript:CanPlay() then
		var_0_11("story cant be played")
		var_43_1(false)

		return nil
	end

	arg_43_0:ExecuteScript(var_43_1)
end

function var_0_0.ExecuteScript(arg_46_0, arg_46_1)
	seriesAsync({
		function(arg_47_0)
			arg_46_0:CheckResDownload(arg_46_0.storyScript, arg_47_0)
		end,
		function(arg_48_0)
			originalPrint("start load story window...")
			arg_46_0:CheckAndLoadDialogue(arg_46_0.storyScript, arg_48_0)
		end
	}, function()
		originalPrint("enter story...")
		arg_46_0:OnStart()

		local var_49_0 = {}

		arg_46_0.currPlayer = nil
		arg_46_0.progress = 0

		for iter_49_0, iter_49_1 in ipairs(arg_46_0.storyScript.steps) do
			table.insert(var_49_0, function(arg_50_0)
				arg_46_0.progress = iter_49_0

				arg_46_0:SendNotification(GAME.STORY_NEXT)

				local var_50_0 = arg_46_0.players[iter_49_1:GetMode()]

				arg_46_0.currPlayer = var_50_0

				var_50_0:Play(arg_46_0.storyScript, iter_49_0, arg_50_0)
			end)
		end

		seriesAsync(var_49_0, function()
			arg_46_0:OnEnd(arg_46_1)
		end)
	end)
end

function var_0_0.SendNotification(arg_52_0, arg_52_1, arg_52_2)
	pg.m02:sendNotification(arg_52_1, arg_52_2)
end

function var_0_0.CheckResDownload(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = arg_53_0:_GetStoryPaintingsByName(arg_53_1)
	local var_53_1 = table.concat(var_53_0, ",")

	originalPrint("start download res " .. var_53_1)

	local var_53_2 = {}

	for iter_53_0, iter_53_1 in ipairs(var_53_0) do
		PaintingGroupConst.AddPaintingNameWithFilteMap(var_53_2, iter_53_1)
	end

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_53_2,
		finishFunc = arg_53_2
	})
end

local function var_0_15(arg_54_0, arg_54_1)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_54_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_55_0)
		arg_54_1(arg_55_0)
	end), true, true)
end

function var_0_0.CheckAndLoadDialogue(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = arg_56_1:GetDialogueStyleName()

	if not arg_56_0.dialogueContainer:Find(var_56_0) then
		var_0_15("NewStoryDialogue" .. var_56_0, function(arg_57_0)
			Object.Instantiate(arg_57_0, arg_56_0.dialogueContainer).name = var_56_0

			arg_56_2()
		end)
	else
		arg_56_2()
	end
end

function var_0_0.CheckState(arg_58_0)
	if arg_58_0.state == var_0_3 or arg_58_0.state == var_0_1 or arg_58_0.state == var_0_4 then
		return false
	end

	return true
end

function var_0_0.RegistSkipBtn(arg_59_0)
	local function var_59_0()
		arg_59_0:TrackingSkip()
		arg_59_0.storyScript:SkipAll()
		arg_59_0.currPlayer:NextOneImmediately()
	end

	onButton(arg_59_0, arg_59_0.skipBtn, function()
		if arg_59_0:IsStopping() or arg_59_0:IsPausing() then
			return
		end

		if not arg_59_0.currPlayer:CanSkip() then
			return
		end

		if arg_59_0:IsReView() or arg_59_0.storyScript:IsPlayed() or not arg_59_0.storyScript:ShowSkipTip() then
			var_59_0()

			return
		end

		arg_59_0:Pause()

		arg_59_0.isOpenMsgbox = true

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			parent = rtf(arg_59_0._tf:Find("front")),
			content = i18n("story_skip_confirm"),
			onYes = function()
				arg_59_0:Resume()
				var_59_0()
			end,
			onNo = function()
				arg_59_0.isOpenMsgbox = false

				arg_59_0:Resume()
			end
		})
	end, SFX_PANEL)
end

function var_0_0.RegistAutoBtn(arg_64_0)
	onButton(arg_64_0, arg_64_0.autoBtn, function()
		if arg_64_0:IsStopping() or arg_64_0:IsPausing() then
			return
		end

		if arg_64_0.storyScript:GetAutoPlayFlag() then
			arg_64_0.storyScript:StopAutoPlay()
			arg_64_0.currPlayer:CancelAuto()
		else
			arg_64_0.storyScript:SetAutoPlay()
			arg_64_0.currPlayer:NextOne()
		end

		if arg_64_0.storyScript then
			arg_64_0:UpdateAutoBtn()
		end
	end, SFX_PANEL)

	local var_64_0 = arg_64_0:IsAutoPlay()

	if var_64_0 then
		arg_64_0.storyScript:SetAutoPlay()
		arg_64_0:UpdateAutoBtn()

		arg_64_0.autoPlayFlag = false
	end

	arg_64_0.banPlayFlag = false
	arg_64_0.isAutoPlay = var_64_0
end

function var_0_0.RegistRecordBtn(arg_66_0)
	onButton(arg_66_0, arg_66_0.recordBtn, function()
		if arg_66_0.storyScript:GetAutoPlayFlag() then
			return
		end

		if not arg_66_0.recordPanel:CanOpen() then
			return
		end

		local var_67_0 = "Show"

		arg_66_0.recordPanel[var_67_0](arg_66_0.recordPanel, arg_66_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.TriggerAutoBtn(arg_68_0)
	if not arg_68_0:IsRunning() then
		return
	end

	triggerButton(arg_68_0.autoBtn)
end

function var_0_0.TriggerSkipBtn(arg_69_0)
	if not arg_69_0:IsRunning() then
		return
	end

	triggerButton(arg_69_0.skipBtn)
end

function var_0_0.ForEscPress(arg_70_0)
	if arg_70_0.recordPanel:IsShowing() then
		arg_70_0.recordPanel:Hide()
	elseif arg_70_0.currPlayer and arg_70_0.currPlayer:WaitForEvent() or arg_70_0.currPlayer and arg_70_0.storyScript and arg_70_0.storyScript.hideSkip then
		-- block empty
	else
		arg_70_0:TriggerSkipBtn()
	end
end

function var_0_0.UpdatePlaySpeed(arg_71_0, arg_71_1)
	if arg_71_0:IsRunning() and arg_71_0.storyScript then
		arg_71_0.storyScript:SetPlaySpeed(arg_71_1)
	end
end

function var_0_0.GetPlaySpeed(arg_72_0)
	if arg_72_0:IsRunning() and arg_72_0.storyScript then
		return arg_72_0.storyScript:GetPlaySpeed()
	end
end

function var_0_0.OnStart(arg_73_0)
	arg_73_0.recorder:Clear()
	removeOnButton(arg_73_0._go)
	removeOnButton(arg_73_0.skipBtn)
	removeOnButton(arg_73_0.autoBtn)
	removeOnButton(arg_73_0.recordBtn)

	arg_73_0.mainImage.color = Color(0, 0, 0, arg_73_0.storyScript:GetStoryAlpha())

	setActive(arg_73_0.recordBtn, not arg_73_0.storyScript:ShouldHideRecord())
	arg_73_0:ClearStoryEventTriggerListener()

	local var_73_0 = arg_73_0.storyScript:GetAllStepDispatcherRecallName()

	if #var_73_0 > 0 then
		arg_73_0.storyEventTriggerListener = StoryEventTriggerListener.New(var_73_0)
	end

	arg_73_0.mainImage.enabled = not arg_73_0.storyScript:CanInteraction()
	arg_73_0.state = var_0_3

	arg_73_0:TrackingStart()
	arg_73_0:SendNotification(GAME.STORY_BEGIN, arg_73_0.storyScript:GetName())

	if not arg_73_0:IsReView() then
		arg_73_0:SendNotification(GAME.STORY_UPDATE, {
			storyId = arg_73_0.storyScript:GetName()
		})
	end

	pg.DelegateInfo.New(arg_73_0)

	for iter_73_0, iter_73_1 in ipairs(arg_73_0.players) do
		iter_73_1:StoryStart(arg_73_0.storyScript)
	end

	setActive(arg_73_0._go, true)
	arg_73_0._tf:SetAsLastSibling()
	setActive(arg_73_0.skipBtn, not arg_73_0.storyScript:ShouldHideSkip())
	setActive(arg_73_0.autoBtn, not arg_73_0.storyScript:ShouldHideAutoBtn())

	arg_73_0.bgmVolumeValue = pg.CriMgr.GetInstance():getBGMVolume()

	arg_73_0:RegistSkipBtn()
	arg_73_0:RegistAutoBtn()
	arg_73_0:RegistRecordBtn()
end

function var_0_0.TrackingStart(arg_74_0)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return
	end

	arg_74_0.trackFlag = false

	if not arg_74_0.storyScript then
		return
	end

	local var_74_0 = arg_74_0:StoryName2StoryId(arg_74_0.storyScript:GetName())

	if var_74_0 and not arg_74_0:GetPlayedFlag(var_74_0) then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryStart(var_74_0, 0))

		arg_74_0.trackFlag = true
	end
end

function var_0_0.TrackingSkip(arg_75_0)
	if not arg_75_0.trackFlag or not arg_75_0.storyScript then
		return
	end

	local var_75_0 = arg_75_0:StoryName2StoryId(arg_75_0.storyScript:GetName())

	if var_75_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStorySkip(var_75_0, arg_75_0.progress or 0))
	end
end

function var_0_0.TrackingOption(arg_76_0, arg_76_1, arg_76_2)
	if not arg_76_0.storyScript or not arg_76_1 or not arg_76_2 then
		return
	end

	local var_76_0 = arg_76_0:StoryName2StoryId(arg_76_0.storyScript:GetName())

	if var_76_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryOption(var_76_0, arg_76_1 .. "_" .. (arg_76_2 or 0)))
	end
end

function var_0_0.ClearStoryEvent(arg_77_0)
	if arg_77_0.storyEventTriggerListener then
		arg_77_0.storyEventTriggerListener:Clear()
	end
end

function var_0_0.CheckStoryEvent(arg_78_0, arg_78_1)
	if arg_78_0.storyEventTriggerListener then
		return arg_78_0.storyEventTriggerListener:ExistCache(arg_78_1)
	end

	return false
end

function var_0_0.GetStoryEventArg(arg_79_0, arg_79_1)
	if not arg_79_0:CheckStoryEvent(arg_79_1) then
		return nil
	end

	if arg_79_0.storyEventTriggerListener and arg_79_0.storyEventTriggerListener:ExistArg(arg_79_1) then
		return arg_79_0.storyEventTriggerListener:GetArg(arg_79_1)
	end

	return nil
end

function var_0_0.UpdateAutoBtn(arg_80_0)
	local var_80_0 = arg_80_0.storyScript:GetAutoPlayFlag()

	arg_80_0:ClearAutoBtn(var_80_0)
end

function var_0_0.ClearAutoBtn(arg_81_0, arg_81_1)
	arg_81_0.autoBtnImg.color = arg_81_1 and var_0_8 or var_0_9
	arg_81_0.isAutoPlay = arg_81_1

	local var_81_0 = arg_81_1 and "Show" or "Hide"

	arg_81_0.setSpeedPanel[var_81_0](arg_81_0.setSpeedPanel, arg_81_0.storyScript)
end

function var_0_0.ClearStoryEventTriggerListener(arg_82_0)
	if arg_82_0.storyEventTriggerListener then
		arg_82_0.storyEventTriggerListener:Dispose()

		arg_82_0.storyEventTriggerListener = nil
	end
end

function var_0_0.Clear(arg_83_0)
	arg_83_0.progress = 0

	arg_83_0:ClearStoryEventTriggerListener()

	arg_83_0.mainImage.enabled = true

	arg_83_0.recorder:Clear()
	arg_83_0.recordPanel:Hide()

	arg_83_0.autoPlayFlag = false
	arg_83_0.banPlayFlag = false

	removeOnButton(arg_83_0._go)
	removeOnButton(arg_83_0.skipBtn)
	removeOnButton(arg_83_0.recordBtn)
	removeOnButton(arg_83_0.autoBtn)
	arg_83_0:ClearAutoBtn(false)

	if isActive(arg_83_0._go) then
		pg.DelegateInfo.Dispose(arg_83_0)
	end

	if arg_83_0.setSpeedPanel then
		arg_83_0.setSpeedPanel:Clear()
	end

	setActive(arg_83_0.skipBtn, false)
	setActive(arg_83_0._go, false)

	for iter_83_0, iter_83_1 in ipairs(arg_83_0.players) do
		iter_83_1:StoryEnd(arg_83_0.storyScript)
	end

	arg_83_0.optionSelCodes = nil

	arg_83_0:SendNotification(GAME.STORY_END)

	if arg_83_0.isOpenMsgbox then
		pg.MsgboxMgr.GetInstance():hide()
	end

	arg_83_0:RevertBgmVolumeValue()
end

function var_0_0.RevertBgmVolumeValue(arg_84_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_84_0 = pg.CriMgr.GetInstance():getBGMVolume()

	if arg_84_0.bgmVolumeValue and arg_84_0.bgmVolumeValue ~= var_84_0 then
		pg.CriMgr.GetInstance():setBGMVolume(arg_84_0.bgmVolumeValue)
	end

	arg_84_0.bgmVolumeValue = nil
end

function var_0_0.OnEnd(arg_85_0, arg_85_1)
	arg_85_0:Clear()

	if arg_85_0.state == var_0_3 or arg_85_0.state == var_0_5 then
		arg_85_0.state = var_0_6

		local var_85_0 = arg_85_0.storyScript:GetNextScriptName()

		if var_85_0 and not arg_85_0:IsReView() then
			arg_85_0.storyScript = nil

			arg_85_0:Play(var_85_0, arg_85_1)
		else
			local var_85_1 = arg_85_0.storyScript:GetBranchCode()

			arg_85_0.storyScript = nil

			if arg_85_1 then
				arg_85_1(true, var_85_1)
			end
		end
	else
		arg_85_0.state = var_0_6

		local var_85_2 = arg_85_0.storyScript:GetBranchCode()

		if arg_85_1 then
			arg_85_1(true, var_85_2)
		end
	end
end

function var_0_0.OnSceneEnter(arg_86_0, arg_86_1)
	if not arg_86_0.scenes then
		arg_86_0.scenes = {}
	end

	arg_86_0.scenes[arg_86_1.view] = true
end

function var_0_0.OnSceneExit(arg_87_0, arg_87_1)
	if not arg_87_0.scenes then
		return
	end

	arg_87_0.scenes[arg_87_1.view] = nil
end

function var_0_0.IsReView(arg_88_0)
	if getProxy(ContextProxy) == nil then
		return false
	end

	local var_88_0 = getProxy(ContextProxy):GetPrevContext(1)

	return arg_88_0.scenes[WorldMediaCollectionScene.__cname] == true or var_88_0 and var_88_0.mediator == WorldMediaCollectionMediator
end

function var_0_0.IsRunning(arg_89_0)
	return arg_89_0.state == var_0_3
end

function var_0_0.IsStopping(arg_90_0)
	return arg_90_0.state == var_0_5
end

function var_0_0.IsPausing(arg_91_0)
	return arg_91_0.state == var_0_4
end

function var_0_0.IsAutoPlay(arg_92_0)
	if arg_92_0.banPlayFlag then
		return false
	end

	return getProxy(SettingsProxy):GetStoryAutoPlayFlag() or arg_92_0.autoPlayFlag == true
end

function var_0_0.GetRectSize(arg_93_0)
	return Vector2(arg_93_0._tf.rect.width, arg_93_0._tf.rect.height)
end

function var_0_0.AddRecord(arg_94_0, arg_94_1)
	arg_94_0.recorder:Add(arg_94_1)
end

function var_0_0.Quit(arg_95_0)
	arg_95_0.recorder:Dispose()
	arg_95_0.recordPanel:Dispose()
	arg_95_0.setSpeedPanel:Dispose()

	if arg_95_0.currPlayer and arg_95_0.currPlayer:WaitForEvent() then
		arg_95_0:Clear()
	end

	arg_95_0.state = var_0_7
	arg_95_0.storyScript = nil
	arg_95_0.currPlayer = nil
	arg_95_0.playQueue = {}
	arg_95_0.playedList = {}
	arg_95_0.scenes = {}
end

function var_0_0.Fix(arg_96_0)
	local var_96_0 = getProxy(PlayerProxy):getRawData():GetRegisterTime()
	local var_96_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig({
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
	local var_96_2 = {
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027
	}

	if var_96_0 <= var_96_1 then
		_.each(var_96_2, function(arg_97_0)
			arg_96_0.playedList[arg_97_0] = true
		end)
	end

	local var_96_3 = 5001
	local var_96_4 = 5020
	local var_96_5 = getProxy(TaskProxy)
	local var_96_6 = 0

	for iter_96_0 = var_96_3, var_96_4, -1 do
		if var_96_5:getFinishTaskById(iter_96_0) or var_96_5:getTaskById(iter_96_0) then
			var_96_6 = iter_96_0

			break
		end
	end

	for iter_96_1 = var_96_6, var_96_4, -1 do
		local var_96_7 = pg.task_data_template[iter_96_1]

		if var_96_7 then
			local var_96_8 = var_96_7.story_id

			if var_96_8 and #var_96_8 > 0 and not arg_96_0:IsPlayed(var_96_8) then
				arg_96_0.playedList[var_96_8] = true
			end
		end
	end

	local var_96_9 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

	if var_96_9 and not var_96_9:isEnd() then
		local var_96_10 = _.flatten(var_96_9:getConfig("config_data"))
		local var_96_11

		for iter_96_2 = #var_96_10, 1, -1 do
			local var_96_12 = pg.task_data_template[var_96_10[iter_96_2]].story_id

			if var_96_12 and #var_96_12 > 0 then
				local var_96_13 = arg_96_0:IsPlayed(var_96_12)

				if var_96_11 then
					if not var_96_13 then
						arg_96_0.playedList[var_96_12] = true
					end
				elseif var_96_13 then
					var_96_11 = iter_96_2
				end
			end
		end
	end
end
