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

function var_0_0.GetPlayedFlag(arg_8_0, arg_8_1)
	return arg_8_0.playedList[arg_8_1]
end

function var_0_0.GetPlayedList(arg_9_0)
	return arg_9_0.playedList
end

function var_0_0.IsPlayed(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0, var_10_1 = arg_10_0:StoryName2StoryId(arg_10_1)
	local var_10_2 = arg_10_0:GetPlayedFlag(var_10_0)
	local var_10_3 = true

	if var_10_1 and not arg_10_2 then
		var_10_3 = arg_10_0:GetPlayedFlag(var_10_1)
	end

	return var_10_2 and var_10_3
end

local function var_0_14(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0) do
		var_11_0[iter_11_1] = iter_11_0
	end

	return var_11_0
end

function var_0_0.StoryName2StoryId(arg_12_0, arg_12_1)
	if not var_0_0.indexs then
		var_0_0.indexs = var_0_14(var_0_13("index"))
	end

	if not var_0_0.againIndexs then
		var_0_0.againIndexs = var_0_14(var_0_13("index_again"))
	end

	return var_0_0.indexs[arg_12_1], var_0_0.againIndexs[arg_12_1]
end

function var_0_0.StoryId2StoryName(arg_13_0, arg_13_1)
	if not var_0_0.indexIds then
		var_0_0.indexIds = var_0_13("index")
	end

	if not var_0_0.againIndexIds then
		var_0_0.againIndexIds = var_0_13("index_again")
	end

	return var_0_0.indexIds[arg_13_1], var_0_0.againIndexIds[arg_13_1]
end

function var_0_0.StoryLinkNames(arg_14_0, arg_14_1)
	if not var_0_0.linkNames then
		var_0_0.linkNames = var_0_13("index_link")
	end

	return var_0_0.linkNames[arg_14_1]
end

function var_0_0._GetStoryPaintingsByName(arg_15_0, arg_15_1)
	return arg_15_1:GetUsingPaintingNames()
end

function var_0_0.GetStoryPaintingsByName(arg_16_0, arg_16_1)
	local var_16_0 = var_0_13(arg_16_1)

	if not var_16_0 then
		var_0_11("not exist story file")

		return {}
	end

	local var_16_1 = Story.New(var_16_0, false)

	return arg_16_0:_GetStoryPaintingsByName(var_16_1)
end

function var_0_0.GetStoryPaintingsByNameList(arg_17_0, arg_17_1)
	local var_17_0 = {}
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_1) do
		for iter_17_2, iter_17_3 in ipairs(arg_17_0:GetStoryPaintingsByName(iter_17_1)) do
			var_17_1[iter_17_3] = true
		end
	end

	for iter_17_4, iter_17_5 in pairs(var_17_1) do
		table.insert(var_17_0, iter_17_4)
	end

	return var_17_0
end

function var_0_0.GetStoryPaintingsById(arg_18_0, arg_18_1)
	return arg_18_0:GetStoryPaintingsByIdList({
		arg_18_1
	})
end

function var_0_0.GetStoryPaintingsByIdList(arg_19_0, arg_19_1)
	local var_19_0 = _.map(arg_19_1, function(arg_20_0)
		return arg_19_0:StoryId2StoryName(arg_20_0)
	end)

	return arg_19_0:GetStoryPaintingsByNameList(var_19_0)
end

function var_0_0.ShouldDownloadRes(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:GetStoryPaintingsByName(arg_21_1)

	return _.any(var_21_0, function(arg_22_0)
		return PaintingGroupConst.VerifyPaintingFileName(arg_22_0)
	end)
end

function var_0_0.Init(arg_23_0, arg_23_1)
	arg_23_0.state = var_0_1

	LoadAndInstantiateAsync("ui", "NewStoryUI", function(arg_24_0)
		arg_23_0.UIOverlay = GameObject.Find("Overlay/UIOverlay")

		arg_24_0.transform:SetParent(arg_23_0.UIOverlay.transform, false)
		arg_23_0:_Init(arg_24_0, arg_23_1)
	end, true, true)
end

function var_0_0._Init(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.playedList = {}
	arg_25_0.playQueue = {}
	arg_25_0._go = arg_25_1
	arg_25_0._tf = tf(arg_25_0._go)
	arg_25_0.frontTr = findTF(arg_25_0._tf, "front")
	arg_25_0.skipBtn = findTF(arg_25_0._tf, "front/btns/btns/skip_button")
	arg_25_0.autoBtn = findTF(arg_25_0._tf, "front/btns/btns/auto_button")
	arg_25_0.autoBtnImg = findTF(arg_25_0._tf, "front/btns/btns/auto_button/sel"):GetComponent(typeof(Image))
	arg_25_0.alphaImage = arg_25_0._tf:GetComponent(typeof(Image))
	arg_25_0.mainImage = arg_25_0._tf:GetComponent(typeof(Image))
	arg_25_0.recordBtn = findTF(arg_25_0._tf, "front/btns/record")
	arg_25_0.dialogueContainer = findTF(arg_25_0._tf, "front/dialogue")
	arg_25_0.players = {
		AsideStoryPlayer.New(arg_25_1),
		DialogueStoryPlayer.New(arg_25_1),
		BgStoryPlayer.New(arg_25_1),
		CarouselPlayer.New(arg_25_1),
		VedioStoryPlayer.New(arg_25_1),
		CastStoryPlayer.New(arg_25_1),
		SpAnimStoryPlayer.New(arg_25_1),
		BlinkStoryPlayer.New(arg_25_1)
	}
	arg_25_0.setSpeedPanel = StorySetSpeedPanel.New(arg_25_0._tf, function(arg_26_0)
		arg_25_0:UpdatePlaySpeed(arg_26_0)
	end)
	arg_25_0.recordPanel = NewStoryRecordPanel.New()
	arg_25_0.recorder = StoryRecorder.New()

	setActive(arg_25_0._go, false)

	arg_25_0.state = var_0_2

	if arg_25_2 then
		arg_25_2()
	end
end

function var_0_0.GetPlayer(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.players) do
		if isa(iter_27_1, arg_27_1) then
			return iter_27_1
		end
	end

	return nil
end

function var_0_0.Play(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4, arg_28_5, arg_28_6, arg_28_7)
	table.insert(arg_28_0.playQueue, {
		arg_28_1,
		arg_28_2,
		arg_28_7
	})

	if #arg_28_0.playQueue == 1 then
		local var_28_0

		local function var_28_1()
			if #arg_28_0.playQueue == 0 then
				return
			end

			local var_29_0 = arg_28_0.playQueue[1][1]
			local var_29_1 = arg_28_0.playQueue[1][2]
			local var_29_2 = arg_28_0.playQueue[1][3]

			arg_28_0:SoloPlay(var_29_0, function(arg_30_0, arg_30_1)
				if var_29_1 then
					var_29_1(arg_30_0, arg_30_1)
				end

				table.remove(arg_28_0.playQueue, 1)
				var_28_1()
			end, arg_28_3, arg_28_4, arg_28_5, arg_28_6, var_29_2)
		end

		var_28_1()
	end
end

function var_0_0.Pause(arg_31_0)
	if arg_31_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	arg_31_0.state = var_0_4

	for iter_31_0, iter_31_1 in ipairs(arg_31_0.players) do
		iter_31_1:Pause()
	end
end

function var_0_0.Resume(arg_32_0)
	if arg_32_0.state ~= var_0_4 then
		var_0_11("state is not 'pause'")

		return
	end

	arg_32_0.state = var_0_3

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.players) do
		iter_32_1:Resume()
	end
end

function var_0_0.Stop(arg_33_0)
	if arg_33_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	if arg_33_0.currPlayer and arg_33_0.currPlayer:WaitForEvent() then
		return
	end

	arg_33_0.state = var_0_5

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.players) do
		iter_33_1:Stop()
	end
end

function var_0_0.PlayForTb(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	arg_34_0:Play(arg_34_1, arg_34_3, arg_34_4, false, false, true, arg_34_2)
end

function var_0_0.PlayForWorld(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4, arg_35_5, arg_35_6, arg_35_7, arg_35_8)
	arg_35_0.optionSelCodes = arg_35_2 or {}
	arg_35_0.autoPlayFlag = arg_35_6

	arg_35_0:Play(arg_35_1, arg_35_3, arg_35_4, arg_35_5, arg_35_7, true, arg_35_8)
end

function var_0_0.ForceAutoPlay(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5)
	arg_36_0.autoPlayFlag = true

	local function var_36_0(arg_37_0, arg_37_1)
		arg_36_2(arg_37_0, arg_37_1, arg_36_0.isAutoPlay)
	end

	arg_36_0:Play(arg_36_1, var_36_0, arg_36_3, arg_36_4, true, false, arg_36_5)
end

function var_0_0.ForceManualPlay(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4, arg_38_5)
	arg_38_0.banPlayFlag = true

	local function var_38_0(arg_39_0, arg_39_1)
		arg_38_2(arg_39_0, arg_39_1, arg_38_0.isAutoPlay)
	end

	arg_38_0:Play(arg_38_1, var_38_0, arg_38_3, arg_38_4, true, false, arg_38_5)
end

function var_0_0.SeriesPlay(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4, arg_40_5, arg_40_6, arg_40_7)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in ipairs(arg_40_1) do
		table.insert(var_40_0, function(arg_41_0)
			arg_40_0:SoloPlay(iter_40_1, arg_41_0, arg_40_3, arg_40_4, arg_40_5, arg_40_6, arg_40_7)
		end)
	end

	seriesAsync(var_40_0, arg_40_2)
end

function var_0_0.SoloPlay(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4, arg_42_5, arg_42_6, arg_42_7)
	var_0_11("Play Story:", arg_42_1)

	local var_42_0 = 1

	local function var_42_1(arg_43_0, arg_43_1)
		var_42_0 = var_42_0 - 1

		if arg_42_2 and var_42_0 == 0 then
			onNextTick(function()
				arg_42_2(arg_43_0, arg_43_1)
			end)
		end
	end

	local var_42_2 = var_0_13(arg_42_1)

	if not var_42_2 then
		var_42_1(false)
		var_0_11("not exist story file")

		return nil
	end

	if arg_42_0:IsReView() then
		arg_42_3 = true
	end

	arg_42_0.storyScript = Story.New(var_42_2, arg_42_3, arg_42_0.optionSelCodes, arg_42_5, arg_42_6, arg_42_7)

	if not arg_42_0:CheckState() then
		var_0_11("story state error")
		var_42_1(false)

		return nil
	end

	if not arg_42_0.storyScript:CanPlay() then
		var_0_11("story cant be played")
		var_42_1(false)

		return nil
	end

	arg_42_0:ExecuteScript(var_42_1)
end

function var_0_0.ExecuteScript(arg_45_0, arg_45_1)
	seriesAsync({
		function(arg_46_0)
			arg_45_0:CheckResDownload(arg_45_0.storyScript, arg_46_0)
		end,
		function(arg_47_0)
			originalPrint("start load story window...")
			arg_45_0:CheckAndLoadDialogue(arg_45_0.storyScript, arg_47_0)
		end
	}, function()
		originalPrint("enter story...")
		arg_45_0:OnStart()

		local var_48_0 = {}

		arg_45_0.currPlayer = nil
		arg_45_0.progress = 0

		for iter_48_0, iter_48_1 in ipairs(arg_45_0.storyScript.steps) do
			table.insert(var_48_0, function(arg_49_0)
				arg_45_0.progress = iter_48_0

				arg_45_0:SendNotification(GAME.STORY_NEXT)

				local var_49_0 = arg_45_0.players[iter_48_1:GetMode()]

				arg_45_0.currPlayer = var_49_0

				var_49_0:Play(arg_45_0.storyScript, iter_48_0, arg_49_0)
			end)
		end

		seriesAsync(var_48_0, function()
			arg_45_0:OnEnd(arg_45_1)
		end)
	end)
end

function var_0_0.SendNotification(arg_51_0, arg_51_1, arg_51_2)
	pg.m02:sendNotification(arg_51_1, arg_51_2)
end

function var_0_0.CheckResDownload(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_0:_GetStoryPaintingsByName(arg_52_1)
	local var_52_1 = table.concat(var_52_0, ",")

	originalPrint("start download res " .. var_52_1)

	local var_52_2 = {}

	for iter_52_0, iter_52_1 in ipairs(var_52_0) do
		PaintingGroupConst.AddPaintingNameWithFilteMap(var_52_2, iter_52_1)
	end

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_52_2,
		finishFunc = arg_52_2
	})
end

local function var_0_15(arg_53_0, arg_53_1)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_53_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_54_0)
		arg_53_1(arg_54_0)
	end), true, true)
end

function var_0_0.CheckAndLoadDialogue(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = arg_55_1:GetDialogueStyleName()

	if not arg_55_0.dialogueContainer:Find(var_55_0) then
		var_0_15("NewStoryDialogue" .. var_55_0, function(arg_56_0)
			Object.Instantiate(arg_56_0, arg_55_0.dialogueContainer).name = var_55_0

			arg_55_2()
		end)
	else
		arg_55_2()
	end
end

function var_0_0.CheckState(arg_57_0)
	if arg_57_0.state == var_0_3 or arg_57_0.state == var_0_1 or arg_57_0.state == var_0_4 then
		return false
	end

	return true
end

function var_0_0.RegistSkipBtn(arg_58_0)
	local function var_58_0()
		arg_58_0:TrackingSkip()
		arg_58_0.storyScript:SkipAll()
		arg_58_0.currPlayer:NextOneImmediately()
	end

	onButton(arg_58_0, arg_58_0.skipBtn, function()
		if arg_58_0:IsStopping() or arg_58_0:IsPausing() then
			return
		end

		if not arg_58_0.currPlayer:CanSkip() then
			return
		end

		if arg_58_0:IsReView() or arg_58_0.storyScript:IsPlayed() or not arg_58_0.storyScript:ShowSkipTip() then
			var_58_0()

			return
		end

		arg_58_0:Pause()

		arg_58_0.isOpenMsgbox = true

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			parent = rtf(arg_58_0._tf:Find("front")),
			content = i18n("story_skip_confirm"),
			onYes = function()
				arg_58_0:Resume()
				var_58_0()
			end,
			onNo = function()
				arg_58_0.isOpenMsgbox = false

				arg_58_0:Resume()
			end
		})
	end, SFX_PANEL)
end

function var_0_0.RegistAutoBtn(arg_63_0)
	onButton(arg_63_0, arg_63_0.autoBtn, function()
		if arg_63_0:IsStopping() or arg_63_0:IsPausing() then
			return
		end

		if arg_63_0.storyScript:GetAutoPlayFlag() then
			arg_63_0.storyScript:StopAutoPlay()
			arg_63_0.currPlayer:CancelAuto()
		else
			arg_63_0.storyScript:SetAutoPlay()
			arg_63_0.currPlayer:NextOne()
		end

		if arg_63_0.storyScript then
			arg_63_0:UpdateAutoBtn()
		end
	end, SFX_PANEL)

	local var_63_0 = arg_63_0:IsAutoPlay()

	if var_63_0 then
		arg_63_0.storyScript:SetAutoPlay()
		arg_63_0:UpdateAutoBtn()

		arg_63_0.autoPlayFlag = false
	end

	arg_63_0.banPlayFlag = false
	arg_63_0.isAutoPlay = var_63_0
end

function var_0_0.RegistRecordBtn(arg_65_0)
	onButton(arg_65_0, arg_65_0.recordBtn, function()
		if arg_65_0.storyScript:GetAutoPlayFlag() then
			return
		end

		if not arg_65_0.recordPanel:CanOpen() then
			return
		end

		local var_66_0 = "Show"

		arg_65_0.recordPanel[var_66_0](arg_65_0.recordPanel, arg_65_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.TriggerAutoBtn(arg_67_0)
	if not arg_67_0:IsRunning() then
		return
	end

	triggerButton(arg_67_0.autoBtn)
end

function var_0_0.TriggerSkipBtn(arg_68_0)
	if not arg_68_0:IsRunning() then
		return
	end

	triggerButton(arg_68_0.skipBtn)
end

function var_0_0.ForEscPress(arg_69_0)
	if arg_69_0.recordPanel:IsShowing() then
		arg_69_0.recordPanel:Hide()
	elseif arg_69_0.currPlayer and arg_69_0.currPlayer:WaitForEvent() or arg_69_0.currPlayer and arg_69_0.storyScript and arg_69_0.storyScript.hideSkip then
		-- block empty
	else
		arg_69_0:TriggerSkipBtn()
	end
end

function var_0_0.UpdatePlaySpeed(arg_70_0, arg_70_1)
	if arg_70_0:IsRunning() and arg_70_0.storyScript then
		arg_70_0.storyScript:SetPlaySpeed(arg_70_1)
	end
end

function var_0_0.GetPlaySpeed(arg_71_0)
	if arg_71_0:IsRunning() and arg_71_0.storyScript then
		return arg_71_0.storyScript:GetPlaySpeed()
	end
end

function var_0_0.OnStart(arg_72_0)
	arg_72_0.recorder:Clear()
	removeOnButton(arg_72_0._go)
	removeOnButton(arg_72_0.skipBtn)
	removeOnButton(arg_72_0.autoBtn)
	removeOnButton(arg_72_0.recordBtn)

	arg_72_0.mainImage.color = Color(0, 0, 0, arg_72_0.storyScript:GetStoryAlpha())

	setActive(arg_72_0.recordBtn, not arg_72_0.storyScript:ShouldHideRecord())
	arg_72_0:ClearStoryEventTriggerListener()

	local var_72_0 = arg_72_0.storyScript:GetAllStepDispatcherRecallName()

	if #var_72_0 > 0 then
		arg_72_0.storyEventTriggerListener = StoryEventTriggerListener.New(var_72_0)
	end

	arg_72_0.mainImage.enabled = not arg_72_0.storyScript:CanInteraction()
	arg_72_0.state = var_0_3

	arg_72_0:TrackingStart()
	arg_72_0:SendNotification(GAME.STORY_BEGIN, arg_72_0.storyScript:GetName())

	if not arg_72_0:IsReView() then
		arg_72_0:SendNotification(GAME.STORY_UPDATE, {
			storyId = arg_72_0.storyScript:GetName()
		})
	end

	pg.DelegateInfo.New(arg_72_0)

	for iter_72_0, iter_72_1 in ipairs(arg_72_0.players) do
		iter_72_1:StoryStart(arg_72_0.storyScript)
	end

	setActive(arg_72_0._go, true)
	arg_72_0._tf:SetAsLastSibling()
	setActive(arg_72_0.skipBtn, not arg_72_0.storyScript:ShouldHideSkip())
	setActive(arg_72_0.autoBtn, not arg_72_0.storyScript:ShouldHideAutoBtn())

	arg_72_0.bgmVolumeValue = pg.CriMgr.GetInstance():getBGMVolume()

	arg_72_0:RegistSkipBtn()
	arg_72_0:RegistAutoBtn()
	arg_72_0:RegistRecordBtn()
end

function var_0_0.TrackingStart(arg_73_0)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return
	end

	arg_73_0.trackFlag = false

	if not arg_73_0.storyScript then
		return
	end

	local var_73_0 = arg_73_0:StoryName2StoryId(arg_73_0.storyScript:GetName())

	if var_73_0 and not arg_73_0:GetPlayedFlag(var_73_0) then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryStart(var_73_0, 0))

		arg_73_0.trackFlag = true
	end
end

function var_0_0.TrackingSkip(arg_74_0)
	if not arg_74_0.trackFlag or not arg_74_0.storyScript then
		return
	end

	local var_74_0 = arg_74_0:StoryName2StoryId(arg_74_0.storyScript:GetName())

	if var_74_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStorySkip(var_74_0, arg_74_0.progress or 0))
	end
end

function var_0_0.TrackingOption(arg_75_0, arg_75_1, arg_75_2)
	if not arg_75_0.storyScript or not arg_75_1 or not arg_75_2 then
		return
	end

	local var_75_0 = arg_75_0:StoryName2StoryId(arg_75_0.storyScript:GetName())

	if var_75_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryOption(var_75_0, arg_75_1 .. "_" .. (arg_75_2 or 0)))
	end
end

function var_0_0.ClearStoryEvent(arg_76_0)
	if arg_76_0.storyEventTriggerListener then
		arg_76_0.storyEventTriggerListener:Clear()
	end
end

function var_0_0.CheckStoryEvent(arg_77_0, arg_77_1)
	if arg_77_0.storyEventTriggerListener then
		return arg_77_0.storyEventTriggerListener:ExistCache(arg_77_1)
	end

	return false
end

function var_0_0.GetStoryEventArg(arg_78_0, arg_78_1)
	if not arg_78_0:CheckStoryEvent(arg_78_1) then
		return nil
	end

	if arg_78_0.storyEventTriggerListener and arg_78_0.storyEventTriggerListener:ExistArg(arg_78_1) then
		return arg_78_0.storyEventTriggerListener:GetArg(arg_78_1)
	end

	return nil
end

function var_0_0.UpdateAutoBtn(arg_79_0)
	local var_79_0 = arg_79_0.storyScript:GetAutoPlayFlag()

	arg_79_0:ClearAutoBtn(var_79_0)
end

function var_0_0.ClearAutoBtn(arg_80_0, arg_80_1)
	arg_80_0.autoBtnImg.color = arg_80_1 and var_0_8 or var_0_9
	arg_80_0.isAutoPlay = arg_80_1

	local var_80_0 = arg_80_1 and "Show" or "Hide"

	arg_80_0.setSpeedPanel[var_80_0](arg_80_0.setSpeedPanel, arg_80_0.storyScript)
end

function var_0_0.ClearStoryEventTriggerListener(arg_81_0)
	if arg_81_0.storyEventTriggerListener then
		arg_81_0.storyEventTriggerListener:Dispose()

		arg_81_0.storyEventTriggerListener = nil
	end
end

function var_0_0.Clear(arg_82_0)
	arg_82_0.progress = 0

	arg_82_0:ClearStoryEventTriggerListener()

	arg_82_0.mainImage.enabled = true

	arg_82_0.recorder:Clear()
	arg_82_0.recordPanel:Hide()

	arg_82_0.autoPlayFlag = false
	arg_82_0.banPlayFlag = false

	removeOnButton(arg_82_0._go)
	removeOnButton(arg_82_0.skipBtn)
	removeOnButton(arg_82_0.recordBtn)
	removeOnButton(arg_82_0.autoBtn)
	arg_82_0:ClearAutoBtn(false)

	if isActive(arg_82_0._go) then
		pg.DelegateInfo.Dispose(arg_82_0)
	end

	if arg_82_0.setSpeedPanel then
		arg_82_0.setSpeedPanel:Clear()
	end

	setActive(arg_82_0.skipBtn, false)
	setActive(arg_82_0._go, false)

	for iter_82_0, iter_82_1 in ipairs(arg_82_0.players) do
		iter_82_1:StoryEnd(arg_82_0.storyScript)
	end

	arg_82_0.optionSelCodes = nil

	arg_82_0:SendNotification(GAME.STORY_END)

	if arg_82_0.isOpenMsgbox then
		pg.MsgboxMgr.GetInstance():hide()
	end

	arg_82_0:RevertBgmVolumeValue()
end

function var_0_0.RevertBgmVolumeValue(arg_83_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_83_0 = pg.CriMgr.GetInstance():getBGMVolume()

	if arg_83_0.bgmVolumeValue and arg_83_0.bgmVolumeValue ~= var_83_0 then
		pg.CriMgr.GetInstance():setBGMVolume(arg_83_0.bgmVolumeValue)
	end

	arg_83_0.bgmVolumeValue = nil
end

function var_0_0.OnEnd(arg_84_0, arg_84_1)
	arg_84_0:Clear()

	if arg_84_0.state == var_0_3 or arg_84_0.state == var_0_5 then
		arg_84_0.state = var_0_6

		local var_84_0 = arg_84_0.storyScript:GetNextScriptName()

		if var_84_0 and not arg_84_0:IsReView() then
			arg_84_0.storyScript = nil

			arg_84_0:Play(var_84_0, arg_84_1)
		else
			local var_84_1 = arg_84_0.storyScript:GetBranchCode()

			arg_84_0.storyScript = nil

			if arg_84_1 then
				arg_84_1(true, var_84_1)
			end
		end
	else
		arg_84_0.state = var_0_6

		local var_84_2 = arg_84_0.storyScript:GetBranchCode()

		if arg_84_1 then
			arg_84_1(true, var_84_2)
		end
	end
end

function var_0_0.OnSceneEnter(arg_85_0, arg_85_1)
	if not arg_85_0.scenes then
		arg_85_0.scenes = {}
	end

	arg_85_0.scenes[arg_85_1.view] = true
end

function var_0_0.OnSceneExit(arg_86_0, arg_86_1)
	if not arg_86_0.scenes then
		return
	end

	arg_86_0.scenes[arg_86_1.view] = nil
end

function var_0_0.IsReView(arg_87_0)
	if getProxy(ContextProxy) == nil then
		return false
	end

	local var_87_0 = getProxy(ContextProxy):GetPrevContext(1)

	return arg_87_0.scenes[WorldMediaCollectionScene.__cname] == true or var_87_0 and var_87_0.mediator == WorldMediaCollectionMediator
end

function var_0_0.IsRunning(arg_88_0)
	return arg_88_0.state == var_0_3
end

function var_0_0.IsStopping(arg_89_0)
	return arg_89_0.state == var_0_5
end

function var_0_0.IsPausing(arg_90_0)
	return arg_90_0.state == var_0_4
end

function var_0_0.IsAutoPlay(arg_91_0)
	if arg_91_0.banPlayFlag then
		return false
	end

	return getProxy(SettingsProxy):GetStoryAutoPlayFlag() or arg_91_0.autoPlayFlag == true
end

function var_0_0.GetRectSize(arg_92_0)
	return Vector2(arg_92_0._tf.rect.width, arg_92_0._tf.rect.height)
end

function var_0_0.AddRecord(arg_93_0, arg_93_1)
	arg_93_0.recorder:Add(arg_93_1)
end

function var_0_0.Quit(arg_94_0)
	arg_94_0.recorder:Dispose()
	arg_94_0.recordPanel:Dispose()
	arg_94_0.setSpeedPanel:Dispose()

	if arg_94_0.currPlayer and arg_94_0.currPlayer:WaitForEvent() then
		arg_94_0:Clear()
	end

	arg_94_0.state = var_0_7
	arg_94_0.storyScript = nil
	arg_94_0.currPlayer = nil
	arg_94_0.playQueue = {}
	arg_94_0.playedList = {}
	arg_94_0.scenes = {}
end

function var_0_0.Fix(arg_95_0)
	local var_95_0 = getProxy(PlayerProxy):getRawData():GetRegisterTime()
	local var_95_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig({
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
	local var_95_2 = {
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027
	}

	if var_95_0 <= var_95_1 then
		_.each(var_95_2, function(arg_96_0)
			arg_95_0.playedList[arg_96_0] = true
		end)
	end

	local var_95_3 = 5001
	local var_95_4 = 5020
	local var_95_5 = getProxy(TaskProxy)
	local var_95_6 = 0

	for iter_95_0 = var_95_3, var_95_4, -1 do
		if var_95_5:getFinishTaskById(iter_95_0) or var_95_5:getTaskById(iter_95_0) then
			var_95_6 = iter_95_0

			break
		end
	end

	for iter_95_1 = var_95_6, var_95_4, -1 do
		local var_95_7 = pg.task_data_template[iter_95_1]

		if var_95_7 then
			local var_95_8 = var_95_7.story_id

			if var_95_8 and #var_95_8 > 0 and not arg_95_0:IsPlayed(var_95_8) then
				arg_95_0.playedList[var_95_8] = true
			end
		end
	end

	local var_95_9 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

	if var_95_9 and not var_95_9:isEnd() then
		local var_95_10 = _.flatten(var_95_9:getConfig("config_data"))
		local var_95_11

		for iter_95_2 = #var_95_10, 1, -1 do
			local var_95_12 = pg.task_data_template[var_95_10[iter_95_2]].story_id

			if var_95_12 and #var_95_12 > 0 then
				local var_95_13 = arg_95_0:IsPlayed(var_95_12)

				if var_95_11 then
					if not var_95_13 then
						arg_95_0.playedList[var_95_12] = true
					end
				elseif var_95_13 then
					var_95_11 = iter_95_2
				end
			end
		end
	end
end
