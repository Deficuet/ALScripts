ys = ys or {}

local var_0_0 = ys

var_0_0.Battle = var_0_0.Battle or {}

local var_0_1 = {}

pg.bfConsts = var_0_1
var_0_1.DFT_CRIT_EFFECT = 1.5
var_0_1.DFT_CRIT_RATE = 0.05
var_0_1.SECONDs = 60
var_0_1.PERCENT = 0.01
var_0_1.PERCENT1 = 0.001
var_0_1.PERCENT2 = 0.0001
var_0_1.HUNDRED = 100
var_0_1.SCORE_RATE = {
	0.7,
	0.8,
	0.3
}
var_0_1.CRASH_RATE = {
	0.05,
	0.025
}
var_0_1.SUBMARINE_KAMIKAZE = {
	80,
	3.5,
	1.5,
	1,
	0.5,
	0.5,
	1,
	0.005
}
var_0_1.LEAK_RATE = {
	10,
	2.2,
	0.7,
	0.3,
	1,
	0.005,
	0.5
}
var_0_1.PLANE_LEAK_RATE = {
	1,
	1,
	0.01,
	0.5,
	0.7,
	0.3,
	1,
	0.005,
	150,
	150,
	1,
	1
}
var_0_1.METEO_RATE = {
	0.05,
	20,
	0.6,
	0.4
}
var_0_1.NUM1 = 1
var_0_1.NUM0 = 0
var_0_1.NUM10000 = 10000
var_0_1.ACCURACY = {
	0.1,
	2
}
var_0_1.DRATE = {
	25,
	0.02,
	0.0002,
	2000,
	0.1,
	0.8,
	150
}
var_0_1.SPEED_CONST = 0.02
var_0_1.HP_CONST = 1.5

local var_0_2 = singletonClass("BattleState", var_0_0.MVC.Facade)

var_0_0.Battle.BattleState = var_0_2
var_0_2.__name = "BattleState"
var_0_2.BATTLE_STATE_IDLE = "BATTLE_IDLE"
var_0_2.BATTLE_STATE_OPENING = "BATTLE_OPENING"
var_0_2.BATTLE_STATE_FIGHT = "BATTLE_FIGHT"
var_0_2.BATTLE_STATE_REPORT = "BATTLE_REPORT"

function var_0_2.Ctor(arg_1_0)
	var_0_2.super.Ctor(arg_1_0)
	arg_1_0:ChangeState(var_0_2.BATTLE_STATE_IDLE)
end

function var_0_2.GetCombatSkinKey()
	return COMBAT_SKIN_KEY or "Standard"
end

function var_0_2.IsAutoBotActive(arg_3_0)
	local var_3_0 = AutoBotCommand.GetAutoBotMark(arg_3_0)

	return PlayerPrefs.GetInt("autoBotIsAcitve" .. var_3_0, 0) == 1 and AutoBotCommand.autoBotSatisfied()
end

function var_0_2.IsAutoSubActive(arg_4_0)
	local var_4_0 = AutoSubCommand.GetAutoSubMark(arg_4_0)

	return PlayerPrefs.GetInt("autoSubIsAcitve" .. var_4_0, 0) == 1
end

function var_0_2.ChatUseable(arg_5_0)
	local var_5_0 = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)
	local var_5_1 = not var_5_0 or var_5_0 ~= 1
	local var_5_2 = arg_5_0:GetBattleType()
	local var_5_3 = arg_5_0.IsAutoBotActive(var_5_2)
	local var_5_4 = var_5_2 == SYSTEM_DUEL
	local var_5_5 = var_5_2 == SYSTEM_CARDPUZZLE

	return var_5_1 and (var_5_4 or var_5_3) and not var_5_5
end

function var_0_2.GetState(arg_6_0)
	return arg_6_0._state
end

function var_0_2.GetBattleType(arg_7_0)
	return arg_7_0._battleType
end

function var_0_2.SetBattleUI(arg_8_0, arg_8_1)
	arg_8_0._baseUI = arg_8_1
end

function var_0_2.EnterBattle(arg_9_0, arg_9_1, arg_9_2)
	pg.TimeMgr.GetInstance():ResetCombatTime()
	arg_9_0:Active()
	arg_9_0:ResetTimer()

	arg_9_0._dataProxy = arg_9_0:AddDataProxy(var_0_0.Battle.BattleDataProxy.GetInstance())
	arg_9_0._uiMediator = arg_9_0:AddMediator(var_0_0.Battle.BattleUIMediator.New())
	arg_9_0._battleType = arg_9_1.battleType

	local var_9_0 = var_0_0.Battle.BattleFacadeGate.CommandGates[arg_9_0._battleType] or var_0_0.Battle.BattleSingleDungeonCommand

	arg_9_0._battleCommand = arg_9_0:AddCommand(var_9_0.New())
	arg_9_0._sceneMediator = arg_9_0:AddMediator(var_0_0.Battle.BattleSceneMediator.New())
	arg_9_0._weaponCommand = arg_9_0:AddCommand(var_0_0.Battle.BattleControllerWeaponCommand.New())

	arg_9_0._dataProxy:InitBattle(arg_9_1)

	if BATTLE_DEFAULT_UNIT_DETAIL then
		arg_9_0:AddMediator(var_0_0.Battle.BattleReferenceBoxMediator.New())
		arg_9_0:GetMediatorByName(var_0_0.Battle.BattleReferenceBoxMediator.__name):ActiveUnitDetail(true)
	end

	if arg_9_2 then
		-- block empty
	else
		arg_9_0:ChangeState(var_0_2.BATTLE_STATE_OPENING)
		UpdateBeat:Add(arg_9_0.Update, arg_9_0)
	end
end

function var_0_2.GetSceneMediator(arg_10_0)
	return arg_10_0._sceneMediator
end

function var_0_2.GetUIMediator(arg_11_0)
	return arg_11_0._uiMediator
end

function var_0_2.ActiveBot(arg_12_0, arg_12_1)
	arg_12_0._weaponCommand:ActiveBot(arg_12_1, true)
	arg_12_0:EnableJoystick(not arg_12_1)
end

function var_0_2.EnableJoystick(arg_13_0, arg_13_1)
	arg_13_0._uiMediator:EnableJoystick(arg_13_1)
end

function var_0_2.IsBotActive(arg_14_0)
	return arg_14_0._weaponCommand:GetWeaponBot():IsActive()
end

function var_0_2.Update(arg_15_0)
	if not arg_15_0._isPause then
		for iter_15_0, iter_15_1 in pairs(arg_15_0._mediatorList) do
			iter_15_1:Update()
		end
	else
		for iter_15_2, iter_15_3 in pairs(arg_15_0._mediatorList) do
			iter_15_3:UpdatePause()
		end
	end
end

function var_0_2.GenerateVertifyData(arg_16_0)
	return
end

function var_0_2.Vertify()
	return true, -1
end

function var_0_2.ChangeState(arg_18_0, arg_18_1)
	arg_18_0._state = arg_18_1

	if arg_18_1 == var_0_2.BATTLE_STATE_OPENING then
		arg_18_0._dataProxy:Start()

		local var_18_0 = arg_18_0._dataProxy._dungeonInfo.beginStoy

		if var_18_0 then
			pg.NewStoryMgr.GetInstance():Play(var_18_0, function()
				arg_18_0._battleCommand:DoPrologue()
			end)
		else
			arg_18_0._battleCommand:DoPrologue()
		end
	elseif arg_18_1 == var_0_2.BATTLE_STATE_FIGHT then
		arg_18_0:ActiveAutoComponentTimer()

		if not arg_18_0._dataProxy:GetFleetLegal(var_0_0.Battle.BattleConfig.FRIENDLY_CODE, arg_18_0:GetBattleType()) then
			arg_18_0._battleCommand:CalcStatistic()
			arg_18_0:BattleEnd()
		end
	elseif arg_18_1 == var_0_2.BATTLE_STATE_REPORT then
		-- block empty
	end
end

function var_0_2.GetUI(arg_20_0)
	return arg_20_0._baseUI
end

function var_0_2.ConfigBattleEndFunc(arg_21_0, arg_21_1)
	arg_21_0._endFunc = arg_21_1
end

function var_0_2.BattleEnd(arg_22_0)
	arg_22_0:disableCommon()

	if arg_22_0._dataProxy:GetStatistics()._battleScore >= var_0_0.Battle.BattleConst.BattleScore.B then
		arg_22_0._dataProxy:CelebrateVictory(arg_22_0._dataProxy:GetFriendlyCode())
		arg_22_0:reportDelayTimer(function()
			arg_22_0:DoResult()
		end, var_0_0.Battle.BattleConfig.CelebrateDuration)
	else
		arg_22_0:DoResult()
	end
end

function var_0_2.BattleTimeUp(arg_24_0)
	arg_24_0:disableCommon()
	arg_24_0:ActiveEscape()
	arg_24_0:reportDelayTimer(function()
		arg_24_0:DeactiveEscape()
		arg_24_0:DoResult()
	end, var_0_0.Battle.BattleConfig.EscapeDuration)
end

function var_0_2.DoResult(arg_26_0)
	arg_26_0._sceneMediator:PauseCharacterAction(true)
	arg_26_0._dataProxy:BotPercentage(arg_26_0._weaponCommand:GetBotActiveDuration())
	arg_26_0._dataProxy:HPRatioStatistics()
	arg_26_0._endFunc(arg_26_0._dataProxy:GetStatistics())
end

function var_0_2.ExitBattle(arg_27_0)
	var_0_0.Battle.BattleCameraUtil.GetInstance():Clear()

	for iter_27_0, iter_27_1 in pairs(arg_27_0._mediatorList) do
		arg_27_0:RemoveMediator(iter_27_1)
	end

	for iter_27_2, iter_27_3 in pairs(arg_27_0._commandList) do
		arg_27_0:RemoveCommand(iter_27_3)
	end

	for iter_27_4, iter_27_5 in pairs(arg_27_0._proxyList) do
		arg_27_0:RemoveProxy(iter_27_5)
	end

	var_0_0.Battle.BattleConfig.BASIC_TIME_SCALE = 1

	arg_27_0:RemoveAllTimer()
	var_0_0.Battle.BattleResourceManager.GetInstance():Clear()

	arg_27_0._takeoverProcess = nil

	arg_27_0:ChangeState(var_0_2.BATTLE_STATE_IDLE)

	arg_27_0._baseUI = nil
	arg_27_0._endFunc = nil
	arg_27_0._uiMediator = nil
	arg_27_0._sceneMediator = nil
	arg_27_0._battleCommand = nil
	arg_27_0._weaponCommand = nil

	removeSingletonInstance(var_0_0.Battle.BattleDataProxy)

	arg_27_0._dataProxy = nil

	var_0_0.Battle.BattleVariable.Clear()
	var_0_0.Battle.BattleBulletFactory.DestroyFactory()
	UpdateBeat:Remove(arg_27_0.Update, arg_27_0)
	pg.EffectMgr.GetInstance():ClearBattleEffectMap()

	arg_27_0._timeScale = nil
	arg_27_0._timescalerCache = nil

	gcAll(true)
end

function var_0_2.Stop(arg_28_0, arg_28_1)
	arg_28_0:disableCommon()
	arg_28_0._baseUI:exitBattle(arg_28_1)
end

function var_0_2.disableCommon(arg_29_0)
	arg_29_0._weaponCommand:ActiveBot(false)
	arg_29_0:ScaleTimer()
	var_0_0.Battle.BattleCameraUtil.GetInstance():ResetFocus()
	arg_29_0:ChangeState(var_0_2.BATTLE_STATE_REPORT)
	arg_29_0._dataProxy:ClearAirFighterTimer()
	arg_29_0._dataProxy:KillAllAircraft()
	arg_29_0._sceneMediator:AllBulletNeutralize()
	var_0_0.Battle.BattleCameraUtil.GetInstance():StopShake()
	var_0_0.Battle.BattleCameraUtil.GetInstance():Deactive()
	arg_29_0._uiMediator:DisableComponent()
	arg_29_0:Deactive()
end

function var_0_2.reportDelayTimer(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0

	local function var_30_1()
		pg.TimeMgr.GetInstance():RemoveBattleTimer(var_30_0)

		var_30_0 = nil

		arg_30_1()
	end

	arg_30_0:RemoveAllTimer()
	pg.TimeMgr.GetInstance():ResumeBattleTimer()

	var_30_0 = pg.TimeMgr.GetInstance():AddBattleTimer("reportDelay", -1, arg_30_2, var_30_1)
end

function var_0_2.SetTakeoverProcess(arg_32_0, arg_32_1)
	assert(arg_32_0._takeoverProcess == nil, "已经有接管的战斗过程，暂时没有定义这种逻辑")
	assert(arg_32_1.Pause ~= nil and type(arg_32_1.Pause) == "function", "SetTakeoverProcess附加过程，必须要有Pause函数")
	assert(arg_32_1.Pause ~= nil and type(arg_32_1.Resume) == "function", "SetTakeoverProcess附加过程，必须要有Pause函数")

	arg_32_0._takeoverProcess = arg_32_1

	arg_32_0:_pause()
end

function var_0_2.ClearTakeoverProcess(arg_33_0)
	assert(arg_33_0._takeoverProcess, "没有接管的战斗过程，暂时没有定义这种逻辑")

	arg_33_0._takeoverProcess = nil

	arg_33_0:_resume()
end

function var_0_2.IsPause(arg_34_0)
	return arg_34_0._isPause
end

function var_0_2.Pause(arg_35_0)
	local var_35_0 = arg_35_0._takeoverProcess

	if var_35_0 then
		var_35_0.Pause()
	else
		arg_35_0:_pause()
	end
end

function var_0_2._pause(arg_36_0)
	arg_36_0:Deactive()
	arg_36_0._dataProxy:PausePuzzleComponent()
	arg_36_0._sceneMediator:Pause()

	if arg_36_0._timeScale ~= 1 then
		arg_36_0:CacheTimescaler(arg_36_0._timeScale)
		arg_36_0:ScaleTimer(1)
	end

	var_0_0.Battle.BattleCameraUtil.GetInstance():PauseCameraTween()
end

function var_0_2.Resume(arg_37_0)
	if arg_37_0._state == var_0_2.BATTLE_STATE_IDLE then
		arg_37_0:ChangeState(var_0_2.BATTLE_STATE_OPENING)
		UpdateBeat:Add(arg_37_0.Update, arg_37_0)
	elseif arg_37_0._state == var_0_2.BATTLE_STATE_REPORT then
		return
	end

	local var_37_0 = arg_37_0._takeoverProcess

	if var_37_0 then
		var_37_0.Resume()
	else
		arg_37_0:_resume()
	end
end

function var_0_2._resume(arg_38_0)
	arg_38_0._sceneMediator:Resume()
	arg_38_0:Active()
	arg_38_0._dataProxy:ResumePuzzleComponent()

	if arg_38_0._timescalerCache then
		arg_38_0:ScaleTimer(arg_38_0._timescalerCache)
		arg_38_0:CacheTimescaler()
	end

	var_0_0.Battle.BattleCameraUtil.GetInstance():ResumeCameraTween()
end

function var_0_2.ScaleTimer(arg_39_0, arg_39_1)
	arg_39_1 = arg_39_1 or var_0_0.Battle.BattleConfig.BASIC_TIME_SCALE

	pg.TimeMgr.GetInstance():ScaleBattleTimer(arg_39_1)

	arg_39_0._timeScale = arg_39_1
end

function var_0_2.GetTimeScaleRate(arg_40_0)
	return arg_40_0._timeScale or 1
end

function var_0_2.CacheTimescaler(arg_41_0, arg_41_1)
	arg_41_0._timescalerCache = arg_41_1
end

function var_0_0.Battle.PlayBattleSFX(arg_42_0)
	if arg_42_0 ~= "" then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/" .. arg_42_0)
	end
end

function var_0_2.OpenConsole(arg_43_0)
	arg_43_0._uiMediator:InitDebugConsole()
	arg_43_0._uiMediator:ActiveDebugConsole()
end

function var_0_2.ActiveReference(arg_44_0)
	arg_44_0._controllerCommand = arg_44_0:AddCommand(var_0_0.Battle.BattleControllerCommand.New())
end
