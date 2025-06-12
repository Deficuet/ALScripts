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

function var_0_0.IsPlayed(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0, var_9_1 = arg_9_0:StoryName2StoryId(arg_9_1)
	local var_9_2 = arg_9_0:GetPlayedFlag(var_9_0)
	local var_9_3 = true

	if var_9_1 and not arg_9_2 then
		var_9_3 = arg_9_0:GetPlayedFlag(var_9_1)
	end

	return var_9_2 and var_9_3
end

local function var_0_14(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0) do
		var_10_0[iter_10_1] = iter_10_0
	end

	return var_10_0
end

function var_0_0.StoryName2StoryId(arg_11_0, arg_11_1)
	if not var_0_0.indexs then
		var_0_0.indexs = var_0_14(var_0_13("index"))
	end

	if not var_0_0.againIndexs then
		var_0_0.againIndexs = var_0_14(var_0_13("index_again"))
	end

	return var_0_0.indexs[arg_11_1], var_0_0.againIndexs[arg_11_1]
end

function var_0_0.StoryId2StoryName(arg_12_0, arg_12_1)
	if not var_0_0.indexIds then
		var_0_0.indexIds = var_0_13("index")
	end

	if not var_0_0.againIndexIds then
		var_0_0.againIndexIds = var_0_13("index_again")
	end

	return var_0_0.indexIds[arg_12_1], var_0_0.againIndexIds[arg_12_1]
end

function var_0_0.StoryLinkNames(arg_13_0, arg_13_1)
	if not var_0_0.linkNames then
		var_0_0.linkNames = var_0_13("index_link")
	end

	return var_0_0.linkNames[arg_13_1]
end

function var_0_0._GetStoryPaintingsByName(arg_14_0, arg_14_1)
	return arg_14_1:GetUsingPaintingNames()
end

function var_0_0.GetStoryPaintingsByName(arg_15_0, arg_15_1)
	local var_15_0 = var_0_13(arg_15_1)

	if not var_15_0 then
		var_0_11("not exist story file")

		return {}
	end

	local var_15_1 = Story.New(var_15_0, false)

	return arg_15_0:_GetStoryPaintingsByName(var_15_1)
end

function var_0_0.GetStoryPaintingsByNameList(arg_16_0, arg_16_1)
	local var_16_0 = {}
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_1) do
		for iter_16_2, iter_16_3 in ipairs(arg_16_0:GetStoryPaintingsByName(iter_16_1)) do
			var_16_1[iter_16_3] = true
		end
	end

	for iter_16_4, iter_16_5 in pairs(var_16_1) do
		table.insert(var_16_0, iter_16_4)
	end

	return var_16_0
end

function var_0_0.GetStoryPaintingsById(arg_17_0, arg_17_1)
	return arg_17_0:GetStoryPaintingsByIdList({
		arg_17_1
	})
end

function var_0_0.GetStoryPaintingsByIdList(arg_18_0, arg_18_1)
	local var_18_0 = _.map(arg_18_1, function(arg_19_0)
		return arg_18_0:StoryId2StoryName(arg_19_0)
	end)

	return arg_18_0:GetStoryPaintingsByNameList(var_18_0)
end

function var_0_0.ShouldDownloadRes(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0:GetStoryPaintingsByName(arg_20_1)

	return _.any(var_20_0, function(arg_21_0)
		return PaintingGroupConst.VerifyPaintingFileName(arg_21_0)
	end)
end

function var_0_0.Init(arg_22_0, arg_22_1)
	arg_22_0.state = var_0_1

	LoadAndInstantiateAsync("ui", "NewStoryUI", function(arg_23_0)
		arg_22_0.UIOverlay = GameObject.Find("Overlay/UIOverlay")

		arg_23_0.transform:SetParent(arg_22_0.UIOverlay.transform, false)
		arg_22_0:_Init(arg_23_0, arg_22_1)
	end, true, true)
end

function var_0_0._Init(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.playedList = {}
	arg_24_0.playQueue = {}
	arg_24_0._go = arg_24_1
	arg_24_0._tf = tf(arg_24_0._go)
	arg_24_0.frontTr = findTF(arg_24_0._tf, "front")
	arg_24_0.skipBtn = findTF(arg_24_0._tf, "front/btns/btns/skip_button")
	arg_24_0.autoBtn = findTF(arg_24_0._tf, "front/btns/btns/auto_button")
	arg_24_0.autoBtnImg = findTF(arg_24_0._tf, "front/btns/btns/auto_button/sel"):GetComponent(typeof(Image))
	arg_24_0.alphaImage = arg_24_0._tf:GetComponent(typeof(Image))
	arg_24_0.mainImage = arg_24_0._tf:GetComponent(typeof(Image))
	arg_24_0.recordBtn = findTF(arg_24_0._tf, "front/btns/record")
	arg_24_0.dialogueContainer = findTF(arg_24_0._tf, "front/dialogue")
	arg_24_0.players = {
		AsideStoryPlayer.New(arg_24_1),
		DialogueStoryPlayer.New(arg_24_1),
		BgStoryPlayer.New(arg_24_1),
		CarouselPlayer.New(arg_24_1),
		VedioStoryPlayer.New(arg_24_1),
		CastStoryPlayer.New(arg_24_1),
		SpAnimStoryPlayer.New(arg_24_1),
		BlinkStoryPlayer.New(arg_24_1)
	}
	arg_24_0.setSpeedPanel = StorySetSpeedPanel.New(arg_24_0._tf, function(arg_25_0)
		arg_24_0:UpdatePlaySpeed(arg_25_0)
	end)
	arg_24_0.recordPanel = NewStoryRecordPanel.New()
	arg_24_0.recorder = StoryRecorder.New()

	setActive(arg_24_0._go, false)

	arg_24_0.state = var_0_2

	if arg_24_2 then
		arg_24_2()
	end
end

function var_0_0.GetPlayer(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.players) do
		if isa(iter_26_1, arg_26_1) then
			return iter_26_1
		end
	end

	return nil
end

function var_0_0.Play(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5, arg_27_6, arg_27_7)
	table.insert(arg_27_0.playQueue, {
		arg_27_1,
		arg_27_2,
		arg_27_7
	})

	if #arg_27_0.playQueue == 1 then
		local var_27_0

		local function var_27_1()
			if #arg_27_0.playQueue == 0 then
				return
			end

			local var_28_0 = arg_27_0.playQueue[1][1]
			local var_28_1 = arg_27_0.playQueue[1][2]
			local var_28_2 = arg_27_0.playQueue[1][3]

			arg_27_0:SoloPlay(var_28_0, function(arg_29_0, arg_29_1)
				if var_28_1 then
					var_28_1(arg_29_0, arg_29_1)
				end

				table.remove(arg_27_0.playQueue, 1)
				var_27_1()
			end, arg_27_3, arg_27_4, arg_27_5, arg_27_6, var_28_2)
		end

		var_27_1()
	end
end

function var_0_0.Puase(arg_30_0)
	if arg_30_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	arg_30_0.state = var_0_4

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.players) do
		iter_30_1:Pause()
	end
end

function var_0_0.Resume(arg_31_0)
	if arg_31_0.state ~= var_0_4 then
		var_0_11("state is not 'pause'")

		return
	end

	arg_31_0.state = var_0_3

	for iter_31_0, iter_31_1 in ipairs(arg_31_0.players) do
		iter_31_1:Resume()
	end
end

function var_0_0.Stop(arg_32_0)
	if arg_32_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	if arg_32_0.currPlayer and arg_32_0.currPlayer:WaitForEvent() then
		return
	end

	arg_32_0.state = var_0_5

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.players) do
		iter_32_1:Stop()
	end
end

function var_0_0.PlayForTb(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	arg_33_0:Play(arg_33_1, arg_33_3, arg_33_4, false, false, true, arg_33_2)
end

function var_0_0.PlayForWorld(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4, arg_34_5, arg_34_6, arg_34_7, arg_34_8)
	arg_34_0.optionSelCodes = arg_34_2 or {}
	arg_34_0.autoPlayFlag = arg_34_6

	arg_34_0:Play(arg_34_1, arg_34_3, arg_34_4, arg_34_5, arg_34_7, true, arg_34_8)
end

function var_0_0.ForceAutoPlay(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4, arg_35_5)
	arg_35_0.autoPlayFlag = true

	local function var_35_0(arg_36_0, arg_36_1)
		arg_35_2(arg_36_0, arg_36_1, arg_35_0.isAutoPlay)
	end

	arg_35_0:Play(arg_35_1, var_35_0, arg_35_3, arg_35_4, true, false, arg_35_5)
end

function var_0_0.ForceManualPlay(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4, arg_37_5)
	arg_37_0.banPlayFlag = true

	local function var_37_0(arg_38_0, arg_38_1)
		arg_37_2(arg_38_0, arg_38_1, arg_37_0.isAutoPlay)
	end

	arg_37_0:Play(arg_37_1, var_37_0, arg_37_3, arg_37_4, true, false, arg_37_5)
end

function var_0_0.SeriesPlay(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4, arg_39_5, arg_39_6, arg_39_7)
	local var_39_0 = {}

	for iter_39_0, iter_39_1 in ipairs(arg_39_1) do
		table.insert(var_39_0, function(arg_40_0)
			arg_39_0:SoloPlay(iter_39_1, arg_40_0, arg_39_3, arg_39_4, arg_39_5, arg_39_6, arg_39_7)
		end)
	end

	seriesAsync(var_39_0, arg_39_2)
end

function var_0_0.SoloPlay(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4, arg_41_5, arg_41_6, arg_41_7)
	var_0_11("Play Story:", arg_41_1)

	local var_41_0 = 1

	local function var_41_1(arg_42_0, arg_42_1)
		var_41_0 = var_41_0 - 1

		if arg_41_2 and var_41_0 == 0 then
			onNextTick(function()
				arg_41_2(arg_42_0, arg_42_1)
			end)
		end
	end

	local var_41_2 = var_0_13(arg_41_1)

	if not var_41_2 then
		var_41_1(false)
		var_0_11("not exist story file")

		return nil
	end

	if arg_41_0:IsReView() then
		arg_41_3 = true
	end

	arg_41_0.storyScript = Story.New(var_41_2, arg_41_3, arg_41_0.optionSelCodes, arg_41_5, arg_41_6, arg_41_7)

	if not arg_41_0:CheckState() then
		var_0_11("story state error")
		var_41_1(false)

		return nil
	end

	if not arg_41_0.storyScript:CanPlay() then
		var_0_11("story cant be played")
		var_41_1(false)

		return nil
	end

	arg_41_0:ExecuteScript(var_41_1)
end

function var_0_0.ExecuteScript(arg_44_0, arg_44_1)
	seriesAsync({
		function(arg_45_0)
			arg_44_0:CheckResDownload(arg_44_0.storyScript, arg_45_0)
		end,
		function(arg_46_0)
			originalPrint("start load story window...")
			arg_44_0:CheckAndLoadDialogue(arg_44_0.storyScript, arg_46_0)
		end
	}, function()
		originalPrint("enter story...")
		arg_44_0:OnStart()

		local var_47_0 = {}

		arg_44_0.currPlayer = nil
		arg_44_0.progress = 0

		for iter_47_0, iter_47_1 in ipairs(arg_44_0.storyScript.steps) do
			table.insert(var_47_0, function(arg_48_0)
				arg_44_0.progress = iter_47_0

				arg_44_0:SendNotification(GAME.STORY_NEXT)

				local var_48_0 = arg_44_0.players[iter_47_1:GetMode()]

				arg_44_0.currPlayer = var_48_0

				var_48_0:Play(arg_44_0.storyScript, iter_47_0, arg_48_0)
			end)
		end

		seriesAsync(var_47_0, function()
			arg_44_0:OnEnd(arg_44_1)
		end)
	end)
end

function var_0_0.SendNotification(arg_50_0, arg_50_1, arg_50_2)
	pg.m02:sendNotification(arg_50_1, arg_50_2)
end

function var_0_0.CheckResDownload(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_0:_GetStoryPaintingsByName(arg_51_1)
	local var_51_1 = table.concat(var_51_0, ",")

	originalPrint("start download res " .. var_51_1)

	local var_51_2 = {}

	for iter_51_0, iter_51_1 in ipairs(var_51_0) do
		PaintingGroupConst.AddPaintingNameWithFilteMap(var_51_2, iter_51_1)
	end

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_51_2,
		finishFunc = arg_51_2
	})
end

local function var_0_15(arg_52_0, arg_52_1)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_52_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_53_0)
		arg_52_1(arg_53_0)
	end), true, true)
end

function var_0_0.CheckAndLoadDialogue(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = arg_54_1:GetDialogueStyleName()

	if not arg_54_0.dialogueContainer:Find(var_54_0) then
		var_0_15("NewStoryDialogue" .. var_54_0, function(arg_55_0)
			Object.Instantiate(arg_55_0, arg_54_0.dialogueContainer).name = var_54_0

			arg_54_2()
		end)
	else
		arg_54_2()
	end
end

function var_0_0.CheckState(arg_56_0)
	if arg_56_0.state == var_0_3 or arg_56_0.state == var_0_1 or arg_56_0.state == var_0_4 then
		return false
	end

	return true
end

function var_0_0.RegistSkipBtn(arg_57_0)
	local function var_57_0()
		arg_57_0:TrackingSkip()
		arg_57_0.storyScript:SkipAll()
		arg_57_0.currPlayer:NextOneImmediately()
	end

	onButton(arg_57_0, arg_57_0.skipBtn, function()
		if arg_57_0:IsStopping() or arg_57_0:IsPausing() then
			return
		end

		if not arg_57_0.currPlayer:CanSkip() then
			return
		end

		if arg_57_0:IsReView() or arg_57_0.storyScript:IsPlayed() or not arg_57_0.storyScript:ShowSkipTip() then
			var_57_0()

			return
		end

		arg_57_0:Puase()

		arg_57_0.isOpenMsgbox = true

		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			parent = rtf(arg_57_0._tf:Find("front")),
			content = i18n("story_skip_confirm"),
			onYes = function()
				arg_57_0:Resume()
				var_57_0()
			end,
			onNo = function()
				arg_57_0.isOpenMsgbox = false

				arg_57_0:Resume()
			end,
			weight = LayerWeightConst.TOP_LAYER
		})
	end, SFX_PANEL)
end

function var_0_0.RegistAutoBtn(arg_62_0)
	onButton(arg_62_0, arg_62_0.autoBtn, function()
		if arg_62_0:IsStopping() or arg_62_0:IsPausing() then
			return
		end

		if arg_62_0.storyScript:GetAutoPlayFlag() then
			arg_62_0.storyScript:StopAutoPlay()
			arg_62_0.currPlayer:CancelAuto()
		else
			arg_62_0.storyScript:SetAutoPlay()
			arg_62_0.currPlayer:NextOne()
		end

		if arg_62_0.storyScript then
			arg_62_0:UpdateAutoBtn()
		end
	end, SFX_PANEL)

	local var_62_0 = arg_62_0:IsAutoPlay()

	if var_62_0 then
		arg_62_0.storyScript:SetAutoPlay()
		arg_62_0:UpdateAutoBtn()

		arg_62_0.autoPlayFlag = false
	end

	arg_62_0.banPlayFlag = false
	arg_62_0.isAutoPlay = var_62_0
end

function var_0_0.RegistRecordBtn(arg_64_0)
	onButton(arg_64_0, arg_64_0.recordBtn, function()
		if arg_64_0.storyScript:GetAutoPlayFlag() then
			return
		end

		if not arg_64_0.recordPanel:CanOpen() then
			return
		end

		local var_65_0 = "Show"

		arg_64_0.recordPanel[var_65_0](arg_64_0.recordPanel, arg_64_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.TriggerAutoBtn(arg_66_0)
	if not arg_66_0:IsRunning() then
		return
	end

	triggerButton(arg_66_0.autoBtn)
end

function var_0_0.TriggerSkipBtn(arg_67_0)
	if not arg_67_0:IsRunning() then
		return
	end

	triggerButton(arg_67_0.skipBtn)
end

function var_0_0.ForEscPress(arg_68_0)
	if arg_68_0.recordPanel:IsShowing() then
		arg_68_0.recordPanel:Hide()
	elseif arg_68_0.currPlayer and arg_68_0.currPlayer:WaitForEvent() or arg_68_0.currPlayer and arg_68_0.storyScript and arg_68_0.storyScript.hideSkip then
		-- block empty
	else
		arg_68_0:TriggerSkipBtn()
	end
end

function var_0_0.UpdatePlaySpeed(arg_69_0, arg_69_1)
	if arg_69_0:IsRunning() and arg_69_0.storyScript then
		arg_69_0.storyScript:SetPlaySpeed(arg_69_1)
	end
end

function var_0_0.GetPlaySpeed(arg_70_0)
	if arg_70_0:IsRunning() and arg_70_0.storyScript then
		return arg_70_0.storyScript:GetPlaySpeed()
	end
end

function var_0_0.OnStart(arg_71_0)
	arg_71_0.recorder:Clear()
	removeOnButton(arg_71_0._go)
	removeOnButton(arg_71_0.skipBtn)
	removeOnButton(arg_71_0.autoBtn)
	removeOnButton(arg_71_0.recordBtn)

	arg_71_0.mainImage.color = Color(0, 0, 0, arg_71_0.storyScript:GetStoryAlpha())

	setActive(arg_71_0.recordBtn, not arg_71_0.storyScript:ShouldHideRecord())
	arg_71_0:ClearStoryEventTriggerListener()

	local var_71_0 = arg_71_0.storyScript:GetAllStepDispatcherRecallName()

	if #var_71_0 > 0 then
		arg_71_0.storyEventTriggerListener = StoryEventTriggerListener.New(var_71_0)
	end

	arg_71_0.mainImage.enabled = not arg_71_0.storyScript:CanInteraction()
	arg_71_0.state = var_0_3

	arg_71_0:TrackingStart()
	arg_71_0:SendNotification(GAME.STORY_BEGIN, arg_71_0.storyScript:GetName())

	if not arg_71_0:IsReView() then
		arg_71_0:SendNotification(GAME.STORY_UPDATE, {
			storyId = arg_71_0.storyScript:GetName()
		})
	end

	pg.DelegateInfo.New(arg_71_0)

	for iter_71_0, iter_71_1 in ipairs(arg_71_0.players) do
		iter_71_1:StoryStart(arg_71_0.storyScript)
	end

	setActive(arg_71_0._go, true)
	arg_71_0._tf:SetAsLastSibling()
	setActive(arg_71_0.skipBtn, not arg_71_0.storyScript:ShouldHideSkip())
	setActive(arg_71_0.autoBtn, not arg_71_0.storyScript:ShouldHideAutoBtn())

	arg_71_0.bgmVolumeValue = pg.CriMgr.GetInstance():getBGMVolume()

	arg_71_0:RegistSkipBtn()
	arg_71_0:RegistAutoBtn()
	arg_71_0:RegistRecordBtn()
end

function var_0_0.TrackingStart(arg_72_0)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return
	end

	arg_72_0.trackFlag = false

	if not arg_72_0.storyScript then
		return
	end

	local var_72_0 = arg_72_0:StoryName2StoryId(arg_72_0.storyScript:GetName())

	if var_72_0 and not arg_72_0:GetPlayedFlag(var_72_0) then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryStart(var_72_0, 0))

		arg_72_0.trackFlag = true
	end
end

function var_0_0.TrackingSkip(arg_73_0)
	if not arg_73_0.trackFlag or not arg_73_0.storyScript then
		return
	end

	local var_73_0 = arg_73_0:StoryName2StoryId(arg_73_0.storyScript:GetName())

	if var_73_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStorySkip(var_73_0, arg_73_0.progress or 0))
	end
end

function var_0_0.TrackingOption(arg_74_0, arg_74_1, arg_74_2)
	if not arg_74_0.storyScript or not arg_74_1 or not arg_74_2 then
		return
	end

	local var_74_0 = arg_74_0:StoryName2StoryId(arg_74_0.storyScript:GetName())

	if var_74_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryOption(var_74_0, arg_74_1 .. "_" .. (arg_74_2 or 0)))
	end
end

function var_0_0.ClearStoryEvent(arg_75_0)
	if arg_75_0.storyEventTriggerListener then
		arg_75_0.storyEventTriggerListener:Clear()
	end
end

function var_0_0.CheckStoryEvent(arg_76_0, arg_76_1)
	if arg_76_0.storyEventTriggerListener then
		return arg_76_0.storyEventTriggerListener:ExistCache(arg_76_1)
	end

	return false
end

function var_0_0.GetStoryEventArg(arg_77_0, arg_77_1)
	if not arg_77_0:CheckStoryEvent(arg_77_1) then
		return nil
	end

	if arg_77_0.storyEventTriggerListener and arg_77_0.storyEventTriggerListener:ExistArg(arg_77_1) then
		return arg_77_0.storyEventTriggerListener:GetArg(arg_77_1)
	end

	return nil
end

function var_0_0.UpdateAutoBtn(arg_78_0)
	local var_78_0 = arg_78_0.storyScript:GetAutoPlayFlag()

	arg_78_0:ClearAutoBtn(var_78_0)
end

function var_0_0.ClearAutoBtn(arg_79_0, arg_79_1)
	arg_79_0.autoBtnImg.color = arg_79_1 and var_0_8 or var_0_9
	arg_79_0.isAutoPlay = arg_79_1

	local var_79_0 = arg_79_1 and "Show" or "Hide"

	arg_79_0.setSpeedPanel[var_79_0](arg_79_0.setSpeedPanel, arg_79_0.storyScript)
end

function var_0_0.ClearStoryEventTriggerListener(arg_80_0)
	if arg_80_0.storyEventTriggerListener then
		arg_80_0.storyEventTriggerListener:Dispose()

		arg_80_0.storyEventTriggerListener = nil
	end
end

function var_0_0.Clear(arg_81_0)
	arg_81_0.progress = 0

	arg_81_0:ClearStoryEventTriggerListener()

	arg_81_0.mainImage.enabled = true

	arg_81_0.recorder:Clear()
	arg_81_0.recordPanel:Hide()

	arg_81_0.autoPlayFlag = false
	arg_81_0.banPlayFlag = false

	removeOnButton(arg_81_0._go)
	removeOnButton(arg_81_0.skipBtn)
	removeOnButton(arg_81_0.recordBtn)
	removeOnButton(arg_81_0.autoBtn)
	arg_81_0:ClearAutoBtn(false)

	if isActive(arg_81_0._go) then
		pg.DelegateInfo.Dispose(arg_81_0)
	end

	if arg_81_0.setSpeedPanel then
		arg_81_0.setSpeedPanel:Clear()
	end

	setActive(arg_81_0.skipBtn, false)
	setActive(arg_81_0._go, false)

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.players) do
		iter_81_1:StoryEnd(arg_81_0.storyScript)
	end

	arg_81_0.optionSelCodes = nil

	arg_81_0:SendNotification(GAME.STORY_END)

	if arg_81_0.isOpenMsgbox then
		pg.MsgboxMgr:GetInstance():hide()
	end

	arg_81_0:RevertBgmVolumeValue()
end

function var_0_0.RevertBgmVolumeValue(arg_82_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_82_0 = pg.CriMgr.GetInstance():getBGMVolume()

	if arg_82_0.bgmVolumeValue and arg_82_0.bgmVolumeValue ~= var_82_0 then
		pg.CriMgr.GetInstance():setBGMVolume(arg_82_0.bgmVolumeValue)
	end

	arg_82_0.bgmVolumeValue = nil
end

function var_0_0.OnEnd(arg_83_0, arg_83_1)
	arg_83_0:Clear()

	if arg_83_0.state == var_0_3 or arg_83_0.state == var_0_5 then
		arg_83_0.state = var_0_6

		local var_83_0 = arg_83_0.storyScript:GetNextScriptName()

		if var_83_0 and not arg_83_0:IsReView() then
			arg_83_0.storyScript = nil

			arg_83_0:Play(var_83_0, arg_83_1)
		else
			local var_83_1 = arg_83_0.storyScript:GetBranchCode()

			arg_83_0.storyScript = nil

			if arg_83_1 then
				arg_83_1(true, var_83_1)
			end
		end
	else
		arg_83_0.state = var_0_6

		local var_83_2 = arg_83_0.storyScript:GetBranchCode()

		if arg_83_1 then
			arg_83_1(true, var_83_2)
		end
	end
end

function var_0_0.OnSceneEnter(arg_84_0, arg_84_1)
	if not arg_84_0.scenes then
		arg_84_0.scenes = {}
	end

	arg_84_0.scenes[arg_84_1.view] = true
end

function var_0_0.OnSceneExit(arg_85_0, arg_85_1)
	if not arg_85_0.scenes then
		return
	end

	arg_85_0.scenes[arg_85_1.view] = nil
end

function var_0_0.IsReView(arg_86_0)
	if getProxy(ContextProxy) == nil then
		return false
	end

	local var_86_0 = getProxy(ContextProxy):GetPrevContext(1)

	return arg_86_0.scenes[WorldMediaCollectionScene.__cname] == true or var_86_0 and var_86_0.mediator == WorldMediaCollectionMediator
end

function var_0_0.IsRunning(arg_87_0)
	return arg_87_0.state == var_0_3
end

function var_0_0.IsStopping(arg_88_0)
	return arg_88_0.state == var_0_5
end

function var_0_0.IsPausing(arg_89_0)
	return arg_89_0.state == var_0_4
end

function var_0_0.IsAutoPlay(arg_90_0)
	if arg_90_0.banPlayFlag then
		return false
	end

	return getProxy(SettingsProxy):GetStoryAutoPlayFlag() or arg_90_0.autoPlayFlag == true
end

function var_0_0.GetRectSize(arg_91_0)
	return Vector2(arg_91_0._tf.rect.width, arg_91_0._tf.rect.height)
end

function var_0_0.AddRecord(arg_92_0, arg_92_1)
	arg_92_0.recorder:Add(arg_92_1)
end

function var_0_0.Quit(arg_93_0)
	arg_93_0.recorder:Dispose()
	arg_93_0.recordPanel:Dispose()
	arg_93_0.setSpeedPanel:Dispose()

	if arg_93_0.currPlayer and arg_93_0.currPlayer:WaitForEvent() then
		arg_93_0:Clear()
	end

	arg_93_0.state = var_0_7
	arg_93_0.storyScript = nil
	arg_93_0.currPlayer = nil
	arg_93_0.playQueue = {}
	arg_93_0.playedList = {}
	arg_93_0.scenes = {}
end

function var_0_0.Fix(arg_94_0)
	local var_94_0 = getProxy(PlayerProxy):getRawData():GetRegisterTime()
	local var_94_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig({
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
	local var_94_2 = {
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027
	}

	if var_94_0 <= var_94_1 then
		_.each(var_94_2, function(arg_95_0)
			arg_94_0.playedList[arg_95_0] = true
		end)
	end

	local var_94_3 = 5001
	local var_94_4 = 5020
	local var_94_5 = getProxy(TaskProxy)
	local var_94_6 = 0

	for iter_94_0 = var_94_3, var_94_4, -1 do
		if var_94_5:getFinishTaskById(iter_94_0) or var_94_5:getTaskById(iter_94_0) then
			var_94_6 = iter_94_0

			break
		end
	end

	for iter_94_1 = var_94_6, var_94_4, -1 do
		local var_94_7 = pg.task_data_template[iter_94_1]

		if var_94_7 then
			local var_94_8 = var_94_7.story_id

			if var_94_8 and #var_94_8 > 0 and not arg_94_0:IsPlayed(var_94_8) then
				arg_94_0.playedList[var_94_8] = true
			end
		end
	end

	local var_94_9 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

	if var_94_9 and not var_94_9:isEnd() then
		local var_94_10 = _.flatten(var_94_9:getConfig("config_data"))
		local var_94_11

		for iter_94_2 = #var_94_10, 1, -1 do
			local var_94_12 = pg.task_data_template[var_94_10[iter_94_2]].story_id

			if var_94_12 and #var_94_12 > 0 then
				local var_94_13 = arg_94_0:IsPlayed(var_94_12)

				if var_94_11 then
					if not var_94_13 then
						arg_94_0.playedList[var_94_12] = true
					end
				elseif var_94_13 then
					var_94_11 = iter_94_2
				end
			end
		end
	end
end
