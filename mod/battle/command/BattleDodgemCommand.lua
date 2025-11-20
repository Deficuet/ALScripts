ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleDodgemCommand", var_0_0.Battle.BattleSingleDungeonCommand)

var_0_0.Battle.BattleDodgemCommand = var_0_3
var_0_3.__name = "BattleDodgemCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.Initialize(arg_2_0)
	var_0_3.super.Initialize(arg_2_0)
	arg_2_0._dataProxy:DodgemCountInit()
end

function var_0_3.DoPrologue(arg_3_0)
	pg.UIMgr.GetInstance():Marching()

	local function var_3_0()
		arg_3_0._uiMediator:OpeningEffect(function()
			arg_3_0._dataProxy:SetupDamageKamikazeShip(var_0_0.Battle.BattleFormulas.CalcDamageLockS2M)
			arg_3_0._dataProxy:SetupDamageCrush(var_0_0.Battle.BattleFormulas.UnilateralCrush)
			arg_3_0._uiMediator:ShowTimer()
			arg_3_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
			arg_3_0._waveUpdater:Start()
		end)
		arg_3_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE):FleetWarcry()
	end

	arg_3_0._uiMediator:SeaSurfaceShift(45, 0, nil, var_3_0)
	arg_3_0._uiMediator:ShowDodgemScoreBar()
end

function var_0_3.initWaveModule(arg_6_0)
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
		arg_6_0._dataProxy:CalcDodgemScore()
		arg_6_0._state:BattleEnd()
	end

	arg_6_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_6_0, nil, var_6_1, nil)
end

function var_0_3.onWillDie(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.Dispatcher

	arg_9_0._dataProxy:CalcDodgemCount(var_9_0)

	local var_9_1 = var_9_0:GetDeathReason()

	if var_9_0:GetTemplate().type == ShipType.JinBi and var_9_1 == var_0_0.Battle.BattleConst.UnitDeathReason.CRUSH then
		local var_9_2 = arg_9_0._dataProxy:GetScorePoint()

		var_9_0:DispatchScorePoint(var_9_2)
	end
end
