pg = pg or {}
pg.NewGuideMgr = singletonClass("NewGuideMgr")

local var_0_0 = pg.NewGuideMgr

var_0_0.ENABLE_GUIDE = true

require("Mgr/Guide/Include")

local var_0_1 = true
local var_0_2 = 0
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3
local var_0_6 = 4
local var_0_7 = 5

local function var_0_8(...)
	if not var_0_1 then
		return
	end

	print(...)
end

local function var_0_9(arg_2_0, arg_2_1)
	arg_2_0.players = {
		[GuideStep.TYPE_DOFUNC] = GuideDoFunctionPlayer.New(arg_2_1),
		[GuideStep.TYPE_DONOTHING] = GuideDoNothingPlayer.New(arg_2_1),
		[GuideStep.TYPE_FINDUI] = GuideFindUIPlayer.New(arg_2_1),
		[GuideStep.TYPE_HIDEUI] = GuideHideUIPlayer.New(arg_2_1),
		[GuideStep.TYPE_SENDNOTIFIES] = GuideSendNotifiesPlayer.New(arg_2_1),
		[GuideStep.TYPE_SHOWSIGN] = GuideShowSignPlayer.New(arg_2_1),
		[GuideStep.TYPE_STORY] = GuideStoryPlayer.New(arg_2_1)
	}
end

local function var_0_10(arg_3_0)
	local var_3_0 = require("GameCfg.guide.newguide.segments." .. arg_3_0)

	return Guide.New(var_3_0)
end

function var_0_0.Init(arg_4_0, arg_4_1)
	arg_4_0.sceneRecords = {}
	arg_4_0.state = var_0_2

	LoadAndInstantiateAsync("ui", "NewGuideUI", function(arg_5_0)
		arg_4_0._go = arg_5_0
		arg_4_0._tf = arg_4_0._go.transform

		arg_4_0._go:SetActive(false)
		arg_4_0._go.transform:SetParent(pg.UIMgr.GetInstance().OverlayToast, false)

		arg_4_0.uiFinder = GuideUIFinder.New(arg_4_0._tf)
		arg_4_0.uiDuplicator = GuideUIDuplicator.New(arg_4_0._tf:Find("target"))
		arg_4_0.uiLoader = GuideUILoader.New(arg_4_0._tf:Find("target"))
		arg_4_0.uiFloatCollctor = GuideUIFloatCollector.New(arg_4_0._tf:Find("target"))
		arg_4_0.dialogueWindows = {
			[GuideStep.DIALOGUE_BLUE] = arg_4_0._tf:Find("windows/window_1")
		}
		arg_4_0.counsellors = {}
		arg_4_0.state = var_0_3
		arg_4_0.uiLongPress = GetOrAddComponent(arg_4_0._tf:Find("BG/close_btn"), typeof(UILongPressTrigger))
		arg_4_0.uiLongPress.longPressThreshold = 10

		var_0_9(arg_4_0, arg_4_0._tf)
		arg_4_1()
	end, true, true)
end

function var_0_0.PlayNothing(arg_6_0)
	SetActive(arg_6_0._go, true)
end

function var_0_0.StopNothing(arg_7_0)
	SetActive(arg_7_0._go, false)
end

function var_0_0.Play(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
	if not arg_8_0:CanPlay() then
		var_0_8("can not play guide " .. arg_8_1)
		arg_8_3()

		return
	end

	var_0_8("play guide : " .. arg_8_1)

	arg_8_0.currentGuideName = arg_8_1

	local var_8_0 = var_0_10(arg_8_1)

	arg_8_0:PlayScript(var_8_0, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
end

function var_0_0._Play(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = Guide.New(arg_9_1)

	arg_9_0:PlayScript(var_9_0, arg_9_2, arg_9_3, arg_9_4, onStep)
end

function var_0_0.PlayScript(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	if not arg_10_1 then
		var_0_8("should exist guide file ")
		arg_10_3()

		return
	end

	arg_10_0.OnFailed = arg_10_4

	arg_10_0:OnStart()

	local var_10_0 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_1:GetStepsWithCode(arg_10_2)) do
		local var_10_1 = iter_10_0

		table.insert(var_10_0, function(arg_11_0)
			if arg_10_0:IsStop() then
				return
			end

			local var_11_0 = arg_10_0.players[iter_10_1:GetType()]
			local var_11_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_11_0:Execute(iter_10_1, function()
				if arg_10_5 then
					arg_10_5(var_10_1, var_11_1)
				end

				arg_11_0()
			end)

			arg_10_0.player = var_11_0
		end)
	end

	seriesAsync(var_10_0, function()
		arg_10_0:OnEnd(arg_10_3)
	end)
end

function var_0_0.CanPlay(arg_14_0)
	if pg.MsgboxMgr.GetInstance()._go.activeSelf or pg.NewStoryMgr.GetInstance():IsRunning() or not var_0_0.ENABLE_GUIDE or not arg_14_0:IsLoaded() or arg_14_0:IsPause() or arg_14_0:IsBusy() then
		return false
	end

	return true
end

function var_0_0.OnStart(arg_15_0)
	pg.DelegateInfo.New(arg_15_0)

	arg_15_0.state = var_0_4

	pg.m02:sendNotification(GAME.START_GUIDE)
	arg_15_0._go.transform:SetAsLastSibling()
	arg_15_0._go:SetActive(true)
	arg_15_0.uiLongPress.onLongPressed:AddListener(function()
		arg_15_0:Stop()
	end)
end

function var_0_0.OnEnd(arg_17_0, arg_17_1)
	arg_17_0.currentGuideName = nil

	arg_17_0.uiLongPress.onLongPressed:RemoveAllListeners()
	pg.DelegateInfo.Dispose(arg_17_0)

	arg_17_0.state = var_0_3

	arg_17_0:Clear()

	if arg_17_1 then
		arg_17_1()
	end
end

function var_0_0.Pause(arg_18_0)
	if arg_18_0:IsBusy() then
		arg_18_0.state = var_0_6

		SetActive(arg_18_0._go, false)
	end
end

function var_0_0.Resume(arg_19_0)
	if arg_19_0:IsPause() then
		arg_19_0.state = var_0_4

		SetActive(arg_19_0._go, true)
	end
end

function var_0_0.Stop(arg_20_0)
	if arg_20_0.state ~= var_0_5 then
		if arg_20_0.OnFailed then
			arg_20_0.OnFailed()
		end

		arg_20_0.state = var_0_5

		arg_20_0.uiFinder:Clear()
		arg_20_0.uiDuplicator:Clear()
		arg_20_0.uiLoader:Clear()
		arg_20_0.uiFloatCollctor:Clear()
		arg_20_0:Clear()
	end
end

function var_0_0.NextStep(arg_21_0)
	if arg_21_0.state == var_0_4 and arg_21_0.player then
		arg_21_0.player:NextOne()
	end
end

function var_0_0.Clear(arg_22_0)
	arg_22_0.OnFailed = nil
	arg_22_0.sceneRecords = {}

	arg_22_0._go:SetActive(false)

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.players) do
		iter_22_1:Clear()
	end

	if arg_22_0.player then
		arg_22_0.player = nil
	end

	pg.m02:sendNotification(GAME.END_GUIDE)
end

function var_0_0.IsPause(arg_23_0)
	return arg_23_0.state and arg_23_0.state == var_0_6
end

function var_0_0.IsBusy(arg_24_0)
	return arg_24_0.state and arg_24_0.state == var_0_4
end

function var_0_0.IsLoaded(arg_25_0)
	return arg_25_0.state and arg_25_0.state > var_0_2
end

function var_0_0.IsStop(arg_26_0)
	return arg_26_0.state and arg_26_0.state == var_0_5
end

function var_0_0.OnSceneEnter(arg_27_0, arg_27_1)
	if not arg_27_0:IsLoaded() then
		return
	end

	if not table.contains(arg_27_0.sceneRecords, arg_27_1.view) then
		table.insert(arg_27_0.sceneRecords, arg_27_1.view)
	end

	if arg_27_0.player then
		arg_27_0.player:OnSceneEnter()
	end
end

function var_0_0.OnSceneExit(arg_28_0, arg_28_1)
	if not arg_28_0:IsLoaded() then
		return
	end

	if table.contains(arg_28_0.sceneRecords, arg_28_1.view) then
		table.removebyvalue(arg_28_0.sceneRecords, arg_28_1.view)
	end
end

function var_0_0.ExistScene(arg_29_0, arg_29_1)
	return table.contains(arg_29_0.sceneRecords, arg_29_1)
end

function var_0_0.GetCurrentGuideName(arg_30_0)
	return arg_30_0.currentGuideName
end

function var_0_0.Exit(arg_31_0)
	arg_31_0:Clear()
	arg_31_0.uiFinder:Clear()
	arg_31_0.uiDuplicator:Clear()
	arg_31_0.uiLoader:Clear()
	arg_31_0.uiFloatCollctor:Clear()

	arg_31_0.state = var_0_7
end
