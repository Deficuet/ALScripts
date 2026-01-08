ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleScenarioSubStrikeCommand", var_0_0.Battle.BattleSingleDungeonCommand)

var_0_0.Battle.BattleScenarioSubStrikeCommand = var_0_3
var_0_3.__name = "BattleScenarioSubStrikeCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.DoPrologue(arg_2_0)
	pg.UIMgr.GetInstance():Marching()

	local function var_2_0()
		arg_2_0._uiMediator:OpeningEffect(function()
			arg_2_0._uiMediator:ShowTimer()
			arg_2_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
			arg_2_0._waveUpdater:Start()

			if arg_2_0._dataProxy:GetInitData().hideAllButtons then
				arg_2_0._dataProxy:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleEvent.HIDE_INTERACTABLE_BUTTONS, {
					isActive = false
				}))
			end

			arg_2_0._uiMediator:InitCameraGestureSlider()
			arg_2_0._uiMediator:EnableJoystick(false)
			arg_2_0._uiMediator:EnableWeaponButton(false)
		end)
		arg_2_0._dataProxy:SubmarineStrike(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)
	end

	arg_2_0._uiMediator:SeaSurfaceShift(45, 0, nil, var_2_0)
end

function var_0_3.initWaveModule(arg_5_0)
	local function var_5_0(arg_6_0, arg_6_1, arg_6_2)
		arg_5_0._dataProxy:SpawnMonster(arg_6_0, arg_6_1, arg_6_2, var_0_0.Battle.BattleConfig.FOE_CODE)
	end

	local function var_5_1(arg_7_0)
		arg_5_0._dataProxy:SpawnAirFighter(arg_7_0)
	end

	local function var_5_2()
		if arg_5_0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_5_0._vertifyFail
			})

			return
		end

		arg_5_0._dataProxy:TriggerFinishBattle()
		arg_5_0:CalcStatistic()
		arg_5_0._state:BattleEnd()
	end

	local function var_5_3(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
		arg_5_0._dataProxy:SpawnCubeArea(var_0_0.Battle.BattleConst.AOEField.SURFACE, -1, arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	end

	arg_5_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_5_0, var_5_1, var_5_2, var_5_3)
end

function var_0_3.onAddUnit(arg_10_0, arg_10_1)
	var_0_3.super.onAddUnit(arg_10_0, arg_10_1)

	if arg_10_1.Data.type == var_0_0.Battle.BattleConst.UnitType.BOSS_UNIT then
		local var_10_0 = arg_10_1.Data.unit

		arg_10_0._dataProxy:AddScenarioSubStrikeBoss(var_10_0)
	end
end

function var_0_3.onPlayerShutDown(arg_11_0, arg_11_1)
	if arg_11_0._state:GetState() ~= arg_11_0._state.BATTLE_STATE_FIGHT then
		return
	end

	if #arg_11_0._userFleet:GetSubList() == 0 then
		arg_11_0._dataProxy:TriggerFinishBattle()
		arg_11_0:CalcStatistic()
		arg_11_0._state:BattleEnd()
	end
end

function var_0_3.onUpdateCountDown(arg_12_0, arg_12_1)
	if arg_12_0._dataProxy:GetCountDown() <= 0 then
		arg_12_0._dataProxy:EnemyEscape()
		arg_12_0:CalcStatistic()
		arg_12_0._state:BattleTimeUp()
	end
end

function var_0_3.onWillDie(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.Dispatcher
	local var_13_1 = var_0_0.Battle.BattleConst.UnitDeathReason

	if var_13_0:GetDeathReason() == var_13_1.LEAVE then
		if var_13_0:GetIFF() == var_0_0.Battle.BattleConfig.FRIENDLY_CODE then
			arg_13_0._dataProxy:CalcBPWhenPlayerLeave(var_13_0)
		end
	else
		arg_13_0._dataProxy:CalcBattleScoreWhenDead(var_13_0)
	end

	local var_13_2 = arg_13_0._dataProxy:IsThereBoss()

	if var_13_0:IsBoss() and not var_13_2 then
		arg_13_0._dataProxy:KillAllEnemy()
	end
end

function var_0_3.CalcBattleEnd(arg_14_0)
	arg_14_0._dataProxy:TriggerFinishBattle()
	arg_14_0:CalcStatistic()
	arg_14_0._state:BattleEnd()
end

function var_0_3.CalcStatistic(arg_15_0)
	arg_15_0._dataProxy:CalcScenarioSubStrikeScoreAtEnd()
end
