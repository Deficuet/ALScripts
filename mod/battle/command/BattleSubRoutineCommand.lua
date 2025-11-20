ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = var_0_0.Battle.BattleConst
local var_0_4 = class("BattleSubRoutineCommand", var_0_0.Battle.BattleSubmarineRunCommand)

var_0_0.Battle.BattleSubRoutineCommand = var_0_4
var_0_4.__name = "BattleSubRoutineCommand"

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)
end

function var_0_4.Initialize(arg_2_0)
	var_0_4.super.Initialize(arg_2_0)
	arg_2_0._dataProxy:SubmarineRunInit()
end

function var_0_4.DoPrologue(arg_3_0)
	pg.UIMgr.GetInstance():Marching()

	local function var_3_0()
		arg_3_0._uiMediator:OpeningEffect(function()
			arg_3_0._uiMediator:ShowTimer()
			arg_3_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
			arg_3_0._waveUpdater:Start()
		end, SYSTEM_SUB_ROUTINE)

		local var_4_0 = arg_3_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)

		var_4_0:FleetWarcry()
		var_4_0:ChangeSubmarineState(var_0_0.Battle.OxyState.STATE_FREE_DIVE)
		var_4_0:GetSubBoostVO():ResetCurrent()
		arg_3_0._dataProxy:InitAllFleetUnitsWeaponCD()
		arg_3_0._dataProxy:TirggerBattleStartBuffs()
	end

	arg_3_0._dataProxy:AutoStatistics(0)

	local var_3_1 = arg_3_0._userFleet:GetUnitList()

	for iter_3_0, iter_3_1 in ipairs(var_3_1) do
		local var_3_2 = var_0_0.Battle.BattleBuffUnit.New(9040)

		iter_3_1:AddBuff(var_3_2)
		iter_3_1:RemoveBuff(8520)
	end

	arg_3_0._uiMediator:SeaSurfaceShift(45, 0, nil, var_3_0)
end

function var_0_4.initWaveModule(arg_6_0)
	local function var_6_0(arg_7_0, arg_7_1, arg_7_2)
		arg_6_0._dataProxy:SpawnMonster(arg_7_0, arg_7_1, arg_7_2, var_0_0.Battle.BattleConfig.FOE_CODE)
	end

	local function var_6_1()
		if arg_6_0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_6_0._vertifyFail
			})

			return
		end

		arg_6_0._dataProxy:TriggerFinishBattle()
		arg_6_0._dataProxy:CalcSubRoutineScore()
		arg_6_0._state:BattleEnd()
	end

	arg_6_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_6_0, nil, var_6_1, nil)
end

function var_0_4.onUpdateCountDown(arg_9_0, arg_9_1)
	if arg_9_0._dataProxy:GetCountDown() <= 0 then
		arg_9_0._dataProxy:EnemyEscape()
		arg_9_0._dataProxy:CalcSubRountineTimeUp()
		arg_9_0._state:BattleTimeUp()
	end
end

function var_0_4.onShutDownPlayer(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.Dispatcher:GetUniqueID()

	arg_10_0._dataProxy:ShutdownPlayerUnit(var_10_0)
end

function var_0_4.onPlayerShutDown(arg_11_0, arg_11_1)
	if arg_11_0._state:GetState() ~= arg_11_0._state.BATTLE_STATE_FIGHT then
		return
	end

	local var_11_0 = arg_11_1.Data.unit

	if #arg_11_0._userFleet:GetSubBench() > 0 then
		arg_11_0._userFleet:ShiftManualSub()
	else
		arg_11_0._dataProxy:TriggerFinishBattle()
		arg_11_0._dataProxy:CalcSubRountineElimate()
		arg_11_0._state:BattleEnd()
	end
end
