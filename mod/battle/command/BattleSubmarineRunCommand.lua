ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = var_0_0.Battle.BattleConst
local var_0_4 = class("BattleSubmarineRunCommand", var_0_0.Battle.BattleSingleDungeonCommand)

var_0_0.Battle.BattleSubmarineRunCommand = var_0_4
var_0_4.__name = "BattleSubmarineRunCommand"

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
		end, SYSTEM_SUBMARINE_RUN)

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
		iter_3_1:RemoveBuff(8520)
	end

	arg_3_0._uiMediator:SeaSurfaceShift(45, 0, nil, var_3_0)
end

function var_0_4.onInitBattle(arg_6_0)
	var_0_4.super.onInitBattle(arg_6_0)
	arg_6_0._userFleet:RegisterEventListener(arg_6_0, var_0_2.MANUAL_SUBMARINE_SHIFT, arg_6_0.onSubmarineShift)
end

function var_0_4.initWaveModule(arg_7_0)
	local function var_7_0(arg_8_0, arg_8_1, arg_8_2)
		arg_7_0._dataProxy:SpawnMonster(arg_8_0, arg_8_1, arg_8_2, var_0_0.Battle.BattleConfig.FOE_CODE)
	end

	local function var_7_1()
		if arg_7_0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_7_0._vertifyFail
			})

			return
		end

		arg_7_0._dataProxy:TriggerFinishBattle()
		arg_7_0._dataProxy:CalcSubRunScore()
		arg_7_0._state:BattleEnd()
	end

	arg_7_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_7_0, nil, var_7_1, nil)
end

function var_0_4.onUpdateCountDown(arg_10_0, arg_10_1)
	if arg_10_0._dataProxy:GetCountDown() <= 0 then
		arg_10_0._dataProxy:EnemyEscape()
		arg_10_0._dataProxy:CalcSubRunTimeUp()
		arg_10_0._state:BattleTimeUp()
	end
end

function var_0_4.RemoveEvent(arg_11_0)
	arg_11_0._userFleet:UnregisterEventListener(arg_11_0, var_0_2.MANUAL_SUBMARINE_SHIFT)
	var_0_4.super.RemoveEvent(arg_11_0)
end

function var_0_4.UnregisterUnitEvent(arg_12_0, arg_12_1)
	var_0_4.super.UnregisterUnitEvent(arg_12_0, arg_12_1)
	arg_12_1:UnregisterEventListener(arg_12_0, var_0_1.ANTI_SUB_VIGILANCE_HATE_CHAIN)
end

function var_0_4.onAddUnit(arg_13_0, arg_13_1)
	var_0_4.super.onAddUnit(arg_13_0, arg_13_1)

	local var_13_0 = arg_13_1.Data.type
	local var_13_1 = arg_13_1.Data.unit

	if var_13_0 ~= var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		var_13_1:RegisterEventListener(arg_13_0, var_0_1.ANTI_SUB_VIGILANCE_HATE_CHAIN, arg_13_0.onHateChain)
	end
end

function var_0_4.onHateChain(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in pairs(arg_14_0._unitDataList) do
		iter_14_1:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_ANTI_SUB_HATE_CHAIN)
	end
end

function var_0_4.onWillDie(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.Dispatcher
	local var_15_1 = var_15_0:GetDeathReason()

	if var_15_0:GetIFF() == var_0_0.Battle.BattleConfig.FRIENDLY_CODE then
		arg_15_0._dataProxy:DelScoreWhenPlayerDead(var_15_0)
	end

	if var_15_1 == var_0_0.Battle.BattleConst.UnitDeathReason.KILLED or var_15_1 == var_0_0.Battle.BattleConst.UnitDeathReason.DESTRUCT then
		for iter_15_0, iter_15_1 in pairs(arg_15_0._unitDataList) do
			iter_15_1:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_TEAMMATE_SHIP_DYING, {
				unit = iter_15_1
			})
		end
	end

	if var_15_0:GetTemplate().type == ShipType.JinBi and var_15_1 == var_0_0.Battle.BattleConst.UnitDeathReason.KILLED then
		arg_15_0._dataProxy:CalcKillingSupplyShip()
	end

	local var_15_2 = arg_15_0._dataProxy:IsThereBoss()

	if var_15_0:IsBoss() and not var_15_2 then
		if var_15_1 == var_0_0.Battle.BattleConst.UnitDeathReason.DESTRUCT then
			arg_15_0._dataProxy:AddScoreWhenBossDestruct()
		end

		arg_15_0._dataProxy:KillAllEnemy()
	end
end

function var_0_4.onSubmarineShift(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.Data.state
	local var_16_1

	if var_16_0 == var_0_0.Battle.OxyState.STATE_FREE_DIVE then
		var_16_1 = var_0_0.Battle.BattleConst.BuffEffectType.ON_SUBMARINE_FREE_DIVE
	elseif var_16_0 == var_0_0.Battle.OxyState.STATE_FREE_FLOAT then
		var_16_1 = var_0_0.Battle.BattleConst.BuffEffectType.ON_SUBMARINE_FREE_FLOAT
	end

	for iter_16_0, iter_16_1 in pairs(arg_16_0._unitDataList) do
		iter_16_1:TriggerBuff(var_16_1)
	end
end

function var_0_4.onShutDownPlayer(arg_17_0)
	arg_17_0._dataProxy:TriggerFinishBattle()
	arg_17_0._dataProxy:CalcSubRunDead()
	arg_17_0._state:BattleEnd()
end
