ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleAirFightCommand", var_0_0.Battle.BattleSingleDungeonCommand)

var_0_0.Battle.BattleAirFightCommand = var_0_3
var_0_3.__name = "BattleAirFightCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.AddEvent(arg_2_0, ...)
	var_0_3.super.AddEvent(arg_2_0, ...)
	arg_2_0._dataProxy:RegisterEventListener(arg_2_0, var_0_2.COMMON_DATA_INIT_FINISH, arg_2_0.onBattleDataInitFinished)
end

function var_0_3.RemoveEvent(arg_3_0, ...)
	arg_3_0._dataProxy:UnregisterEventListener(arg_3_0, var_0_2.COMMON_DATA_INIT_FINISH)
	var_0_3.super.RemoveEvent(arg_3_0, ...)
end

function var_0_3.DoPrologue(arg_4_0)
	pg.UIMgr.GetInstance():Marching()

	local function var_4_0()
		arg_4_0._uiMediator:OpeningEffect(function()
			local var_6_0 = var_0_0.Battle.BattleFormulas
			local var_6_1 = var_6_0.CreateContextCalculateDamage()

			local function var_6_2(arg_7_0, arg_7_1, ...)
				local var_7_0 = arg_7_1:GetIFF()

				if var_7_0 == var_0_0.Battle.BattleConfig.FRIENDLY_CODE then
					return 1, {
						isMiss = false,
						isCri = false,
						isDamagePrevent = false
					}
				elseif var_7_0 == var_0_0.Battle.BattleConfig.FOE_CODE then
					return var_6_1(arg_7_0, arg_7_1, ...)
				end
			end

			local function var_6_3(arg_8_0, arg_8_1)
				local var_8_0, var_8_1 = var_6_0.CalculateCrashDamage(arg_8_0, arg_8_1)
				local var_8_2 = 1

				var_8_1 = arg_8_1:GetIFF() == var_0_0.Battle.BattleConfig.FRIENDLY_CODE and 1 or var_8_1

				return var_8_2, var_8_1
			end

			arg_4_0._dataProxy:SetupCalculateDamage(var_6_2)
			arg_4_0._dataProxy:SetupDamageKamikazeShip(var_0_0.Battle.BattleFormulas.CalcDamageLockS2M)
			arg_4_0._dataProxy:SetupDamageCrush(var_6_3)
			arg_4_0._uiMediator:ShowTimer()
			arg_4_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
			arg_4_0._waveUpdater:Start()
		end, SYSTEM_AIRFIGHT)
		arg_4_0._dataProxy:InitAllFleetUnitsWeaponCD()
	end

	arg_4_0._uiMediator:SeaSurfaceShift(1, 15, nil, var_4_0)
	arg_4_0._dataProxy:AutoStatistics(0)

	local var_4_1 = arg_4_0._state:GetSceneMediator()

	arg_4_0._uiMediator:ShowAirFightScoreBar()
end

function var_0_3.initWaveModule(arg_9_0)
	local function var_9_0(arg_10_0, arg_10_1, arg_10_2)
		arg_9_0._dataProxy:SpawnMonster(arg_10_0, arg_10_1, arg_10_2, var_0_0.Battle.BattleConfig.FOE_CODE)
	end

	local function var_9_1()
		if arg_9_0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_9_0._vertifyFail
			})

			return
		end

		arg_9_0._dataProxy:TriggerFinishBattle()
		arg_9_0._dataProxy:CalcAirFightScore()
		arg_9_0._state:BattleEnd()
	end

	arg_9_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_9_0, nil, var_9_1, nil)
end

function var_0_3.onBattleDataInitFinished(arg_12_0)
	arg_12_0._dataProxy:AirFightInit()

	local var_12_0 = arg_12_0._userFleet:GetScoutList()

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		iter_12_1:HideWaveFx()
	end
end

function var_0_3.RegisterUnitEvent(arg_13_0, arg_13_1, ...)
	var_0_3.super.RegisterUnitEvent(arg_13_0, arg_13_1, ...)

	if arg_13_1:GetUnitType() == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_13_1:RegisterEventListener(arg_13_0, var_0_1.UPDATE_HP, arg_13_0.onPlayerHPUpdate)
	end
end

function var_0_3.UnregisterUnitEvent(arg_14_0, arg_14_1, ...)
	if arg_14_1:GetUnitType() == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_14_1:UnregisterEventListener(arg_14_0, var_0_1.UPDATE_HP)
	end

	var_0_3.super.UnregisterUnitEvent(arg_14_0, arg_14_1, ...)
end

var_0_3.ShipType2Point = {
	[ShipType.YuLeiTing] = 200,
	[ShipType.JinBi] = 300,
	[ShipType.ZiBao] = 3000
}
var_0_3.BeenHitDecreasePoint = 10

function var_0_3.onWillDie(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.Dispatcher
	local var_15_1 = var_15_0:GetDeathReason()
	local var_15_2 = var_15_0:GetTemplate().type

	if var_15_1 == var_0_0.Battle.BattleConst.UnitDeathReason.CRUSH or var_15_1 == var_0_0.Battle.BattleConst.UnitDeathReason.KILLED then
		local var_15_3 = var_0_3.ShipType2Point[var_15_2]

		if var_15_3 and var_15_3 > 0 then
			arg_15_0._dataProxy:AddAirFightScore(var_15_3)
		end
	end
end

function var_0_3.onPlayerHPUpdate(arg_16_0, arg_16_1)
	if arg_16_1.Data.dHP <= 0 then
		arg_16_0._dataProxy:DecreaseAirFightScore(var_0_3.BeenHitDecreasePoint * -arg_16_1.Data.dHP)
	end
end
