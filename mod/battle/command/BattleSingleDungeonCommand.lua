ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleSingleDungeonCommand", var_0_0.MVC.Command)

var_0_0.Battle.BattleSingleDungeonCommand = var_0_3
var_0_3.__name = "BattleSingleDungeonCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.Initialize(arg_2_0)
	var_0_3.super.Initialize(arg_2_0)

	arg_2_0._dataProxy = arg_2_0._state:GetProxyByName(var_0_0.Battle.BattleDataProxy.__name)
	arg_2_0._uiMediator = arg_2_0._state:GetUIMediator()

	arg_2_0:Init()
	arg_2_0:InitProtocol()
	arg_2_0:AddEvent()

	arg_2_0._count = 0
end

function var_0_3.DoPrologue(arg_3_0)
	pg.UIMgr.GetInstance():Marching()

	local function var_3_0()
		arg_3_0._uiMediator:OpeningEffect(function()
			arg_3_0._uiMediator:ShowAutoBtn()
			arg_3_0._uiMediator:ShowTimer()
			arg_3_0._state:GetCommandByName(var_0_0.Battle.BattleControllerWeaponCommand.__name):TryAutoSub()
			arg_3_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
			arg_3_0._waveUpdater:Start()

			if arg_3_0._dataProxy:GetInitData().hideAllButtons then
				arg_3_0._dataProxy:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleEvent.HIDE_INTERACTABLE_BUTTONS, {
					isActive = false
				}))
			end
		end)
		arg_3_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE):FleetWarcry()
		arg_3_0._dataProxy:InitAllFleetUnitsWeaponCD()
		arg_3_0._dataProxy:TirggerBattleStartBuffs()
		arg_3_0._dataProxy:ChapterSupportBarrage(var_0_0.Battle.BattleConfig.FRIENDLY_CODE, var_0_0.Battle.BattleConfig.SubSupportDelay)
	end

	arg_3_0._uiMediator:SeaSurfaceShift(45, 0, nil, var_3_0)
end

function var_0_3.Init(arg_6_0)
	arg_6_0._unitDataList = {}

	arg_6_0:initWaveModule()
end

function var_0_3.Clear(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0._unitDataList) do
		arg_7_0:UnregisterUnitEvent(iter_7_1)

		arg_7_0._unitDataList[iter_7_0] = nil
	end

	arg_7_0._waveUpdater:Clear()
end

function var_0_3.Reinitialize(arg_8_0)
	arg_8_0._state:Deactive()
	arg_8_0:Clear()
	arg_8_0:Init()
end

function var_0_3.Dispose(arg_9_0)
	arg_9_0:Clear()
	arg_9_0:RemoveEvent()
	var_0_3.super.Dispose(arg_9_0)
end

function var_0_3.SetVertifyFail(arg_10_0, arg_10_1)
	if not arg_10_0._vertifyFail then
		arg_10_0._vertifyFail = arg_10_1
	end
end

function var_0_3.onInitBattle(arg_11_0)
	arg_11_0._userFleet = arg_11_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)

	arg_11_0._waveUpdater:SetWavesData(arg_11_0._dataProxy:GetStageInfo())
end

function var_0_3.initWaveModule(arg_12_0)
	local function var_12_0(arg_13_0, arg_13_1, arg_13_2)
		arg_12_0._dataProxy:SpawnMonster(arg_13_0, arg_13_1, arg_13_2, var_0_0.Battle.BattleConfig.FOE_CODE)
	end

	local function var_12_1(arg_14_0)
		arg_12_0._dataProxy:SpawnAirFighter(arg_14_0)
	end

	local function var_12_2()
		if arg_12_0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_12_0._vertifyFail
			})

			return
		end

		arg_12_0._dataProxy:TriggerFinishBattle()
		arg_12_0:CalcStatistic()
		arg_12_0._state:BattleEnd()
	end

	local function var_12_3(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
		arg_12_0._dataProxy:SpawnCubeArea(var_0_0.Battle.BattleConst.AOEField.SURFACE, -1, arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	end

	arg_12_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_12_0, var_12_1, var_12_2, var_12_3)
end

function var_0_3.InitProtocol(arg_17_0)
	return
end

function var_0_3.AddEvent(arg_18_0)
	arg_18_0._dataProxy:RegisterEventListener(arg_18_0, var_0_2.ADD_UNIT, arg_18_0.onAddUnit)
	arg_18_0._dataProxy:RegisterEventListener(arg_18_0, var_0_2.REMOVE_UNIT, arg_18_0.onRemoveUnit)
	arg_18_0._dataProxy:RegisterEventListener(arg_18_0, var_0_2.STAGE_DATA_INIT_FINISH, arg_18_0.onInitBattle)
	arg_18_0._dataProxy:RegisterEventListener(arg_18_0, var_0_2.SHUT_DOWN_PLAYER, arg_18_0.onPlayerShutDown)
	arg_18_0._dataProxy:RegisterEventListener(arg_18_0, var_0_2.UPDATE_COUNT_DOWN, arg_18_0.onUpdateCountDown)
end

function var_0_3.RemoveEvent(arg_19_0)
	arg_19_0._dataProxy:UnregisterEventListener(arg_19_0, var_0_2.ADD_UNIT)
	arg_19_0._dataProxy:UnregisterEventListener(arg_19_0, var_0_2.REMOVE_UNIT)
	arg_19_0._dataProxy:UnregisterEventListener(arg_19_0, var_0_2.STAGE_DATA_INIT_FINISH)
	arg_19_0._dataProxy:UnregisterEventListener(arg_19_0, var_0_2.SHUT_DOWN_PLAYER)
	arg_19_0._dataProxy:UnregisterEventListener(arg_19_0, var_0_2.UPDATE_COUNT_DOWN)
end

function var_0_3.onAddUnit(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1.Data.type
	local var_20_1 = arg_20_1.Data.unit

	arg_20_0:RegisterUnitEvent(var_20_1)

	arg_20_0._unitDataList[var_20_1:GetUniqueID()] = var_20_1

	if var_20_0 == var_0_0.Battle.BattleConst.UnitType.ENEMY_UNIT or var_20_0 == var_0_0.Battle.BattleConst.UnitType.BOSS_UNIT then
		arg_20_0._waveUpdater:AddMonster(var_20_1)
	end
end

function var_0_3.RegisterUnitEvent(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:GetUnitType()

	if var_21_0 ~= var_0_0.Battle.BattleConst.UnitType.MINION_UNIT then
		arg_21_1:RegisterEventListener(arg_21_0, var_0_1.WILL_DIE, arg_21_0.onWillDie)
	end

	arg_21_1:RegisterEventListener(arg_21_0, var_0_1.DYING, arg_21_0.onUnitDying)

	if var_21_0 == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_21_1:RegisterEventListener(arg_21_0, var_0_1.SHUT_DOWN_PLAYER, arg_21_0.onShutDownPlayer)
	end
end

function var_0_3.UnregisterUnitEvent(arg_22_0, arg_22_1)
	arg_22_1:UnregisterEventListener(arg_22_0, var_0_1.WILL_DIE)
	arg_22_1:UnregisterEventListener(arg_22_0, var_0_1.DYING)

	if arg_22_1:GetUnitType() == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_22_1:UnregisterEventListener(arg_22_0, var_0_1.SHUT_DOWN_PLAYER)
	end
end

function var_0_3.onRemoveUnit(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1.Data.UID

	arg_23_0._waveUpdater:RemoveMonster(var_23_0)

	local var_23_1 = arg_23_0._unitDataList[var_23_0]

	if var_23_1 == nil then
		return
	end

	arg_23_0:UnregisterUnitEvent(var_23_1)

	arg_23_0._unitDataList[var_23_0] = nil
end

function var_0_3.onPlayerShutDown(arg_24_0, arg_24_1)
	if arg_24_0._state:GetState() ~= arg_24_0._state.BATTLE_STATE_FIGHT then
		return
	end

	if arg_24_1.Data.unit == arg_24_0._userFleet:GetFlagShip() and arg_24_0._dataProxy:GetInitData().battleType ~= SYSTEM_PROLOGUE and arg_24_0._dataProxy:GetInitData().battleType ~= SYSTEM_PERFORM then
		arg_24_0._dataProxy:TriggerFinishBattle()
		arg_24_0:CalcStatistic()
		arg_24_0._state:BattleEnd()

		return
	end

	if #arg_24_0._userFleet:GetScoutList() == 0 then
		arg_24_0._dataProxy:TriggerFinishBattle()
		arg_24_0:CalcStatistic()
		arg_24_0._state:BattleEnd()
	end
end

function var_0_3.onUpdateCountDown(arg_25_0, arg_25_1)
	if arg_25_0._dataProxy:GetCountDown() <= 0 then
		arg_25_0._dataProxy:EnemyEscape()
		arg_25_0:CalcStatistic()
		arg_25_0._state:BattleTimeUp()
	end
end

function var_0_3.onUnitDying(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1.Dispatcher:GetUniqueID()

	arg_26_0._dataProxy:KillUnit(var_26_0)
end

function var_0_3.onWillDie(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1.Dispatcher
	local var_27_1 = var_0_0.Battle.BattleConst.UnitDeathReason
	local var_27_2 = var_27_0:GetDeathReason()

	if var_27_2 == var_27_1.LEAVE then
		if var_27_0:GetIFF() == var_0_0.Battle.BattleConfig.FRIENDLY_CODE then
			arg_27_0._dataProxy:CalcBPWhenPlayerLeave(var_27_0)
		end
	elseif var_27_2 == var_27_1.DESTRUCT then
		arg_27_0._dataProxy:CalcBattleScoreWhenDead(var_27_0)

		if var_27_0:IsBoss() then
			arg_27_0._dataProxy:AddScoreWhenBossDestruct()
		end
	else
		arg_27_0._dataProxy:CalcBattleScoreWhenDead(var_27_0)
	end

	local var_27_3 = arg_27_0._dataProxy:IsThereBoss()

	if var_27_0:IsBoss() and not var_27_3 then
		arg_27_0._dataProxy:KillAllEnemy()
	end
end

function var_0_3.onShutDownPlayer(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.Dispatcher:GetUniqueID()

	arg_28_0._dataProxy:ShutdownPlayerUnit(var_28_0)
end

function var_0_3.GetMaxRestHPRateBossRate(arg_29_0)
	local var_29_0 = arg_29_0._waveUpdater:GetAllBossWave()

	for iter_29_0, iter_29_1 in ipairs(var_29_0) do
		if iter_29_1:GetState() == iter_29_1.STATE_DEACTIVE then
			return 10000
		end
	end

	local var_29_1 = 0

	for iter_29_2, iter_29_3 in pairs(arg_29_0._dataProxy:GetUnitList()) do
		if iter_29_3:IsBoss() and iter_29_3:IsAlive() then
			var_29_1 = math.max(var_29_1, iter_29_3:GetHPRate())
		end
	end

	return var_29_1 * 10000
end

function var_0_3.CalcStatistic(arg_30_0)
	arg_30_0._dataProxy:CalcSingleDungeonScoreAtEnd(arg_30_0._userFleet)

	local var_30_0 = arg_30_0:GetMaxRestHPRateBossRate()

	arg_30_0._dataProxy:CalcMaxRestHPRateBossRate(var_30_0)
end
