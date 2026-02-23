ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = var_0_0.Battle.BattleDataFunction
local var_0_4 = class("BattleSingleChallengeCommand", var_0_0.Battle.BattleSingleDungeonCommand)

var_0_0.Battle.BattleSingleChallengeCommand = var_0_4
var_0_4.__name = "BattleSingleChallengeCommand"

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)

	arg_1_0._challengeConst = var_0_0.Battle.BattleConfig.CHALLENGE_ENHANCE
end

function var_0_4.onInitBattle(arg_2_0)
	var_0_4.super.onInitBattle(arg_2_0)

	local var_2_0 = arg_2_0._dataProxy:GetInitData().ChallengeInfo:getRound()

	arg_2_0._enhancemntP = math.max(var_2_0 - arg_2_0._challengeConst.K, 0)
	arg_2_0._enhancemntPPercent = arg_2_0._enhancemntP * 0.01

	local var_2_1 = arg_2_0._challengeConst.A * arg_2_0._enhancemntP
	local var_2_2 = arg_2_0._dataProxy:GetDungeonLevel()

	arg_2_0._dataProxy:SetDungeonLevel(var_2_2 + var_2_1)

	arg_2_0._enahanceDURAttr = arg_2_0._challengeConst.X1 * arg_2_0._enhancemntPPercent
	arg_2_0._enahanceATKAttr = arg_2_0._challengeConst.X2 * arg_2_0._enhancemntPPercent
	arg_2_0._enahanceEVDAttr = arg_2_0._challengeConst.Y1 * arg_2_0._enhancemntP
	arg_2_0._enahanceLUKAttr = arg_2_0._challengeConst.Y2 * arg_2_0._enhancemntP
end

function var_0_4.initWaveModule(arg_3_0)
	local function var_3_0(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_3_0._dataProxy:SpawnMonster(arg_4_0, arg_4_1, arg_4_2, var_0_0.Battle.BattleConfig.FOE_CODE, function(arg_5_0)
			arg_3_0:monsterEnhance(arg_5_0)
		end)
	end

	local function var_3_1(arg_6_0)
		arg_3_0._dataProxy:SpawnAirFighter(arg_6_0)
	end

	local function var_3_2()
		if arg_3_0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_3_0._vertifyFail
			})

			return
		end

		arg_3_0._dataProxy:TriggerFinishBattle()
		arg_3_0._dataProxy:CalcChallengeScore(true)
		arg_3_0._state:BattleEnd()
	end

	local function var_3_3(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
		arg_3_0._dataProxy:SpawnCubeArea(var_0_0.Battle.BattleConst.AOEField.SURFACE, -1, arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	end

	arg_3_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_3_0, var_3_1, var_3_2, var_3_3)
end

function var_0_4.DoPrologue(arg_9_0)
	pg.UIMgr.GetInstance():Marching()

	local function var_9_0()
		arg_9_0._uiMediator:OpeningEffect(function()
			local var_11_0 = getProxy(PlayerProxy)

			arg_9_0._uiMediator:ShowAutoBtn()
			arg_9_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
			arg_9_0._uiMediator:ShowTimer()
			arg_9_0._state:GetCommandByName(var_0_0.Battle.BattleControllerWeaponCommand.__name):TryAutoSub()
			arg_9_0._waveUpdater:Start()
		end)
		arg_9_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE):FleetWarcry()
		arg_9_0._dataProxy:InitAllFleetUnitsWeaponCD()
		arg_9_0._dataProxy:TirggerBattleStartBuffs()

		arg_9_0._challengeStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	end

	arg_9_0._uiMediator:SeaSurfaceShift(45, 0, nil, var_9_0)
end

function var_0_4.onPlayerShutDown(arg_12_0, arg_12_1)
	if arg_12_0._state:GetState() ~= arg_12_0._state.BATTLE_STATE_FIGHT then
		return
	end

	if arg_12_1.Data.unit == arg_12_0._userFleet:GetFlagShip() then
		arg_12_0._dataProxy:TriggerFinishBattle()
		arg_12_0._dataProxy:CalcChallengeScore(false)
		arg_12_0._state:BattleEnd()

		return
	end

	if #arg_12_0._userFleet:GetScoutList() == 0 then
		arg_12_0._dataProxy:TriggerFinishBattle()
		arg_12_0._dataProxy:CalcChallengeScore(false)
		arg_12_0._state:BattleEnd()
	end
end

function var_0_4.onUpdateCountDown(arg_13_0, arg_13_1)
	if arg_13_0._dataProxy:GetCountDown() <= 0 then
		arg_13_0._dataProxy:TriggerFinishBattle()
		arg_13_0._dataProxy:CalcChallengeScore(false)
		arg_13_0._state:BattleEnd()
	end
end

function var_0_4.monsterEnhance(arg_14_0, arg_14_1)
	var_0_0.Battle.BattleAttr.FlashByBuff(arg_14_1, "maxHP", arg_14_0._enahanceDURAttr)
	var_0_0.Battle.BattleAttr.FlashByBuff(arg_14_1, "cannonPower", arg_14_0._enahanceATKAttr)
	var_0_0.Battle.BattleAttr.FlashByBuff(arg_14_1, "torpedoPower", arg_14_0._enahanceATKAttr)
	var_0_0.Battle.BattleAttr.FlashByBuff(arg_14_1, "airPower", arg_14_0._enahanceATKAttr)
	var_0_0.Battle.BattleAttr.FlashByBuff(arg_14_1, "dodgeRate", arg_14_0._enahanceEVDAttr)
	var_0_0.Battle.BattleAttr.FlashByBuff(arg_14_1, "luck", arg_14_0._enahanceLUKAttr)
end
