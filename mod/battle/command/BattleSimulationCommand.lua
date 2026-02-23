ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleSimulationCommand", var_0_0.MVC.Command)

var_0_0.Battle.BattleSimulationCommand = var_0_3
var_0_3.__name = "BattleSimulationCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.ConfigBattleData(arg_2_0, arg_2_1)
	arg_2_0._battleInitData = arg_2_1
end

function var_0_3.Initialize(arg_3_0)
	arg_3_0:Init()
	var_0_3.super.Initialize(arg_3_0)

	arg_3_0._dataProxy = arg_3_0._state:GetProxyByName(var_0_0.Battle.BattleDataProxy.__name)
	arg_3_0._uiMediator = arg_3_0._state:GetMediatorByName(var_0_0.Battle.BattleUIMediator.__name)

	arg_3_0:InitProtocol()
	arg_3_0:AddEvent()
end

function var_0_3.DoPrologue(arg_4_0)
	arg_4_0._dataProxy:InitUserShipsData(arg_4_0._battleInitData.RivalMainUnitList, arg_4_0._battleInitData.RivalVanguardUnitList, var_0_0.Battle.BattleConfig.FOE_CODE, {})
	arg_4_0._userFleet:SnapShot()
	arg_4_0._rivalFleet:SnapShot()

	arg_4_0._rivalWeaponBot = var_0_0.Battle.BattleManualWeaponAutoBot.New(arg_4_0._rivalFleet)
	arg_4_0._rivalJoyStickBot = var_0_0.Battle.BattleJoyStickAutoBot.New(arg_4_0._dataProxy, arg_4_0._rivalFleet)
	arg_4_0._buffView = arg_4_0._uiMediator:InitSimulationBuffCounting()

	arg_4_0._uiMediator:OpeningEffect(function()
		arg_4_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
		arg_4_0._uiMediator:ShowAutoBtn()
		arg_4_0._rivalWeaponBot:SetActive(true, false)
		arg_4_0._rivalJoyStickBot:SetActive(true)
		arg_4_0._uiMediator:ShowTimer()
		arg_4_0._uiMediator:ShowSimulationView()
	end)
	arg_4_0._userFleet:FleetWarcry()
	arg_4_0._dataProxy:InitAllFleetUnitsWeaponCD()
	arg_4_0._dataProxy:TirggerBattleStartBuffs()

	local var_4_0 = arg_4_0._userFleet:GetUnitList()

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_1 = var_0_0.Battle.BattleBuffUnit.New(var_0_0.Battle.BattleConfig.SIMULATION_BALANCE_BUFF)

		iter_4_1:AddBuff(var_4_1)
	end

	local var_4_2 = #arg_4_0._rivalFleet:GetScoutList()
	local var_4_3 = arg_4_0._rivalFleet:GetMainList()
	local var_4_4

	if var_4_2 == 0 then
		arg_4_0:rivalMainUnitPhase()
	elseif var_4_2 > 0 then
		local var_4_5 = var_0_0.Battle.BattleConfig.SIMULATION_ADVANTAGE_BUFF

		arg_4_0._rivalDisadvatage = false

		for iter_4_2, iter_4_3 in ipairs(var_4_3) do
			local var_4_6 = var_0_0.Battle.BattleBuffUnit.New(var_4_5)

			iter_4_3:AddBuff(var_4_6)
		end
	end

	arg_4_0:startBuffCount()
	arg_4_0._dataProxy:RivalInit(arg_4_0._rivalFleet:GetUnitList())
end

function var_0_3.Update(arg_6_0)
	arg_6_0._rivalWeaponBot:Update()
end

function var_0_3.Init(arg_7_0)
	arg_7_0._unitDataList = {}
end

function var_0_3.Clear(arg_8_0)
	for iter_8_0, iter_8_1 in pairs(arg_8_0._unitDataList) do
		arg_8_0:UnregisterUnitEvent(iter_8_1)

		arg_8_0._unitDataList[iter_8_0] = nil
	end
end

function var_0_3.Reinitialize(arg_9_0)
	arg_9_0._state:Deactive()
	arg_9_0:Clear()
	arg_9_0:Init()
end

function var_0_3.Dispose(arg_10_0)
	arg_10_0:Clear()
	arg_10_0:RemoveEvent()
	var_0_3.super.Dispose(arg_10_0)
end

function var_0_3.onInitBattle(arg_11_0)
	arg_11_0._weaponCommand = arg_11_0._state:GetCommandByName(var_0_0.Battle.BattleControllerWeaponCommand.__name)
	arg_11_0._userFleet = arg_11_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)
	arg_11_0._rivalFleet = arg_11_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FOE_CODE)
end

function var_0_3.InitProtocol(arg_12_0)
	return
end

function var_0_3.AddEvent(arg_13_0)
	arg_13_0._dataProxy:RegisterEventListener(arg_13_0, var_0_2.ADD_UNIT, arg_13_0.onAddUnit)
	arg_13_0._dataProxy:RegisterEventListener(arg_13_0, var_0_2.REMOVE_UNIT, arg_13_0.onRemoveUnit)
	arg_13_0._dataProxy:RegisterEventListener(arg_13_0, var_0_2.STAGE_DATA_INIT_FINISH, arg_13_0.onInitBattle)
	arg_13_0._dataProxy:RegisterEventListener(arg_13_0, var_0_2.SHUT_DOWN_PLAYER, arg_13_0.onPlayerShutDown)
	arg_13_0._dataProxy:RegisterEventListener(arg_13_0, var_0_2.UPDATE_COUNT_DOWN, arg_13_0.onUpdateCountDown)
end

function var_0_3.RemoveEvent(arg_14_0)
	arg_14_0._dataProxy:UnregisterEventListener(arg_14_0, var_0_2.ADD_UNIT)
	arg_14_0._dataProxy:UnregisterEventListener(arg_14_0, var_0_2.REMOVE_UNIT)
	arg_14_0._dataProxy:UnregisterEventListener(arg_14_0, var_0_2.STAGE_DATA_INIT_FINISH)
	arg_14_0._dataProxy:UnregisterEventListener(arg_14_0, var_0_2.SHUT_DOWN_PLAYER)
	arg_14_0._dataProxy:UnregisterEventListener(arg_14_0, var_0_2.UPDATE_COUNT_DOWN)
end

function var_0_3.onAddUnit(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.Data.type
	local var_15_1 = arg_15_1.Data.unit

	arg_15_0:RegisterUnitEvent(var_15_1)

	arg_15_0._unitDataList[var_15_1:GetUniqueID()] = var_15_1
end

function var_0_3.RegisterUnitEvent(arg_16_0, arg_16_1)
	arg_16_1:RegisterEventListener(arg_16_0, var_0_1.DYING, arg_16_0.onUnitDying)
	arg_16_1:RegisterEventListener(arg_16_0, var_0_1.UPDATE_HP, arg_16_0.onUpdateUnitHP)

	if arg_16_1:GetUnitType() == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_16_1:RegisterEventListener(arg_16_0, var_0_1.SHUT_DOWN_PLAYER, arg_16_0.onShutDownPlayer)
	end
end

function var_0_3.UnregisterUnitEvent(arg_17_0, arg_17_1)
	arg_17_1:UnregisterEventListener(arg_17_0, var_0_1.DYING)
	arg_17_1:UnregisterEventListener(arg_17_0, var_0_1.UPDATE_HP)

	if arg_17_1:GetUnitType() == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_17_1:UnregisterEventListener(arg_17_0, var_0_1.SHUT_DOWN_PLAYER)
	end
end

function var_0_3.onRemoveUnit(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.Data.UID
	local var_18_1 = arg_18_0._unitDataList[var_18_0]

	if var_18_1 == nil then
		return
	end

	arg_18_0:UnregisterUnitEvent(var_18_1)

	arg_18_0._unitDataList[var_18_0] = nil
end

function var_0_3.onPlayerShutDown(arg_19_0, arg_19_1)
	if arg_19_0._state:GetState() ~= arg_19_0._state.BATTLE_STATE_FIGHT then
		return
	end

	if arg_19_0._failReason == nil then
		var_0_0.Battle.BattleState.GenerateVertifyData(1)

		local var_19_0, var_19_1 = var_0_0.Battle.BattleState.Vertify()

		if not var_19_0 then
			arg_19_0._failReason = 900 + var_19_1
		end
	end

	if #arg_19_0._rivalFleet:GetUnitList() == 0 then
		arg_19_0._dataProxy:CalcSimulationScoreAtEnd(arg_19_0._userFleet, arg_19_0._rivalFleet)

		if arg_19_0._failReason then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_19_0._failReason
			})

			return
		end

		arg_19_0._failReason = nil

		arg_19_0._dataProxy:TriggerFinishBattle()
		arg_19_0._state:BattleEnd()
	end

	if arg_19_1.Data.unit == arg_19_0._userFleet:GetFlagShip() then
		arg_19_0._dataProxy:TriggerFinishBattle()
		arg_19_0._dataProxy:CalcSimulationScoreAtEnd(arg_19_0._userFleet, arg_19_0._rivalFleet)
		arg_19_0._state:BattleEnd()

		return
	end

	if #arg_19_0._userFleet:GetScoutList() == 0 then
		arg_19_0._dataProxy:TriggerFinishBattle()
		arg_19_0._dataProxy:CalcSimulationScoreAtEnd(arg_19_0._userFleet, arg_19_0._rivalFleet)
		arg_19_0._state:BattleEnd()
	end

	if #arg_19_0._rivalFleet:GetScoutList() == 0 and not arg_19_0._rivalDisadvatage then
		arg_19_0:rivalMainUnitPhase()
	end
end

function var_0_3.rivalMainUnitPhase(arg_20_0)
	arg_20_0:startBuffCount()

	arg_20_0._rivalDisadvatage = true

	arg_20_0._rivalJoyStickBot:SetActive(false)
	arg_20_0._rivalFleet:FreeMainUnit(var_0_0.Battle.BattleConfig.SIMULATION_FREE_BUFF)

	local var_20_0 = arg_20_0._rivalFleet:GetMainList()

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		for iter_20_2, iter_20_3 in ipairs(var_0_0.Battle.BattleConfig.SIMULATION_ADVANTAGE_CANCEL_LIST) do
			iter_20_1:RemoveBuff(iter_20_3)
		end

		local var_20_1 = var_0_0.Battle.BattleBuffUnit.New(var_0_0.Battle.BattleConfig.SIMULATION_DISADVANTAGE_BUFF)

		iter_20_1:AddBuff(var_20_1)
	end
end

function var_0_3.onUpdateCountDown(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0._dataProxy:GetCountDown()

	if arg_21_0._buffStartTime then
		local var_21_1 = var_0_0.Battle.BattleConfig.SIMULATION_RIVAL_RAGE_TOTAL_COUNT - (arg_21_0._buffStartTime - var_21_0)

		if var_21_1 <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("simulation_enhancing"))

			arg_21_0._buffStartTime = nil

			arg_21_0._buffView:SetEnhancedText()
		else
			arg_21_0._buffView:SetCountDownText(var_21_1)
		end
	end

	if var_21_0 <= 0 then
		local var_21_2, var_21_3 = arg_21_0._userFleet:GetDamageRatioResult()
		local var_21_4, var_21_5 = arg_21_0._rivalFleet:GetDamageRatioResult()

		arg_21_0._dataProxy:TriggerFinishBattle()
		arg_21_0._dataProxy:CalcSimulationScoreAtTimesUp(var_21_2, var_21_4, var_21_3, var_21_5, arg_21_0._rivalFleet)
		arg_21_0._state:BattleEnd()
	end
end

function var_0_3.onUpdateUnitHP(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.Dispatcher:GetFleetVO()

	if var_22_0 then
		local var_22_1 = arg_22_1.Data.validDHP

		var_22_0:UpdateFleetDamage(var_22_1)
	end
end

function var_0_3.onUnitDying(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1.Dispatcher
	local var_23_1 = var_23_0:GetUniqueID()

	arg_23_0._dataProxy:CalcBattleScoreWhenDead(var_23_0)
	arg_23_0._dataProxy:KillUnit(var_23_1)
end

function var_0_3.onShutDownPlayer(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1.Dispatcher
	local var_24_1 = var_24_0:GetUniqueID()

	var_24_0:GetFleetVO():UpdateFleetOverDamage(var_24_0)
	arg_24_0._dataProxy:ShutdownPlayerUnit(var_24_1)
end

function var_0_3.startBuffCount(arg_25_0)
	arg_25_0._buffStartTime = arg_25_0._dataProxy:GetCountDown()
end
