ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleWorldBossCommand", var_0_0.Battle.BattleSingleDungeonCommand)

var_0_0.Battle.BattleWorldBossCommand = var_0_3
var_0_3.__name = "BattleWorldBossCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.initWaveModule(arg_2_0)
	local function var_2_0(arg_3_0, arg_3_1, arg_3_2)
		arg_2_0._dataProxy:SpawnMonster(arg_3_0, arg_3_1, arg_3_2, var_0_0.Battle.BattleConfig.FOE_CODE)
	end

	local function var_2_1(arg_4_0)
		arg_2_0._dataProxy:SpawnAirFighter(arg_4_0)
	end

	local function var_2_2()
		if arg_2_0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_2_0._vertifyFail
			})

			return
		end

		arg_2_0._dataProxy:TriggerFinishBattle()
		arg_2_0:CalcStatistic()
		arg_2_0:calcDamageData()
		arg_2_0._state:BattleEnd()
	end

	local function var_2_3(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
		arg_2_0._dataProxy:SpawnCubeArea(var_0_0.Battle.BattleConst.AOEField.SURFACE, -1, arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	end

	arg_2_0._waveUpdater = var_0_0.Battle.BattleWaveUpdater.New(var_2_0, var_2_1, var_2_2, var_2_3)
end

function var_0_3.onInitBattle(arg_7_0)
	var_0_3.super.onInitBattle(arg_7_0)

	local var_7_0 = arg_7_0._dataProxy:GetInitData()

	arg_7_0._specificEnemyList = var_0_0.Battle.BattleDataFunction.GetSpecificWorldJointEnemyList(var_7_0.ActID, var_7_0.bossConfigId, var_7_0.bossLevel)
end

function var_0_3.onAddUnit(arg_8_0, arg_8_1)
	var_0_3.super.onAddUnit(arg_8_0, arg_8_1)

	local var_8_0 = arg_8_1.Data.unit

	if table.contains(arg_8_0._specificEnemyList, var_8_0:GetTemplateID()) then
		arg_8_0._dataProxy:InitSpecificEnemyStatistics(var_8_0)
	end
end

function var_0_3.onPlayerShutDown(arg_9_0, arg_9_1)
	if arg_9_0._state:GetState() ~= arg_9_0._state.BATTLE_STATE_FIGHT then
		return
	end

	if arg_9_1.Data.unit == arg_9_0._userFleet:GetFlagShip() and arg_9_0._dataProxy:GetInitData().battleType ~= SYSTEM_PROLOGUE and arg_9_0._dataProxy:GetInitData().battleType ~= SYSTEM_PERFORM then
		arg_9_0._dataProxy:TriggerFinishBattle()
		arg_9_0:CalcStatistic()
		arg_9_0:calcDamageData()
		arg_9_0._state:BattleEnd()

		return
	end

	if #arg_9_0._userFleet:GetScoutList() == 0 then
		arg_9_0._dataProxy:TriggerFinishBattle()
		arg_9_0:CalcStatistic()
		arg_9_0:calcDamageData()
		arg_9_0._state:BattleEnd()
	end
end

function var_0_3.onUpdateCountDown(arg_10_0, arg_10_1)
	if arg_10_0._dataProxy:GetCountDown() <= 0 then
		arg_10_0._dataProxy:EnemyEscape()
		arg_10_0:CalcStatistic()
		arg_10_0:calcDamageData()
		arg_10_0._state:BattleTimeUp()
	end
end

function var_0_3.calcDamageData(arg_11_0)
	local var_11_0 = arg_11_0._dataProxy:GetInitData()

	arg_11_0._dataProxy:CalcWorldBossDamageInfo(var_11_0.ActID, var_11_0.bossConfigId, var_11_0.bossLevel)
end
