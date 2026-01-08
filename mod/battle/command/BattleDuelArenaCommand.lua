ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = class("BattleDuelArenaCommand", var_0_0.MVC.Command)

var_0_0.Battle.BattleDuelArenaCommand = var_0_3
var_0_3.__name = "BattleDuelArenaCommand"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.Initialize(arg_2_0)
	arg_2_0:Init()
	var_0_3.super.Initialize(arg_2_0)

	arg_2_0._dataProxy = arg_2_0._state:GetProxyByName(var_0_0.Battle.BattleDataProxy.__name)
	arg_2_0._uiMediator = arg_2_0._state:GetMediatorByName(var_0_0.Battle.BattleUIMediator.__name)

	arg_2_0:InitProtocol()
	arg_2_0:AddEvent()
end

function var_0_3.DoPrologue(arg_3_0)
	local var_3_0 = arg_3_0._dataProxy:GetInitData()

	arg_3_0._dataProxy:InitUserShipsData(var_3_0.RivalMainUnitList, var_3_0.RivalVanguardUnitList, var_0_0.Battle.BattleConfig.FOE_CODE, {})
	arg_3_0._userFleet:SnapShot()
	arg_3_0._rivalFleet:SnapShot()

	arg_3_0._rivalWeaponBot = var_0_0.Battle.BattleManualWeaponAutoBot.New(arg_3_0._rivalFleet)
	arg_3_0._rivalJoyStickBot = var_0_0.Battle.BattleJoyStickAutoBot.New(arg_3_0._dataProxy, arg_3_0._rivalFleet)

	local var_3_1 = arg_3_0._uiMediator:InitDuelRateBar()
	local var_3_2 = getProxy(PlayerProxy):getData()

	var_3_1:SetFleetVO(arg_3_0._userFleet, {
		name = var_3_2.name,
		level = var_3_2.level
	})

	local var_3_3 = arg_3_0._dataProxy:GetInitData().RivalVO

	var_3_1:SetFleetVO(arg_3_0._rivalFleet, {
		name = var_3_3.name,
		level = var_3_3.level
	})
	arg_3_0._dataProxy:AutoStatistics(1)
	arg_3_0._uiMediator:OpeningEffect(function()
		arg_3_0._state:ChangeState(var_0_0.Battle.BattleState.BATTLE_STATE_FIGHT)
		arg_3_0._weaponCommand:ActiveBot(true, false)
		arg_3_0._rivalWeaponBot:SetActive(true, false)
		arg_3_0._rivalJoyStickBot:SetActive(true)
		arg_3_0._uiMediator:InitCameraGestureSlider()
		arg_3_0._uiMediator:ShowTimer()
		arg_3_0._uiMediator:ShowDuelBar()
		arg_3_0._uiMediator:EnableJoystick(false)
		arg_3_0._uiMediator:EnableWeaponButton(false)
	end)

	local var_3_4 = arg_3_0._dataProxy:GetFleetList()

	for iter_3_0, iter_3_1 in pairs(var_3_4) do
		iter_3_1:FleetWarcry()

		local var_3_5 = iter_3_1:GetUnitList()

		for iter_3_2, iter_3_3 in ipairs(var_3_5) do
			local var_3_6 = iter_3_3:GetTemplate().type
			local var_3_7 = var_0_0.Battle.BattleDataFunction.GetArenaBuffByShipType(var_3_6)

			for iter_3_4, iter_3_5 in ipairs(var_3_7) do
				local var_3_8 = var_0_0.Battle.BattleBuffUnit.New(iter_3_5)

				iter_3_3:AddBuff(var_3_8)
			end
		end
	end

	arg_3_0._uiMediator:EnableWeaponButton(false)
	arg_3_0._dataProxy:InitAllFleetUnitsWeaponCD()
	arg_3_0._dataProxy:TirggerBattleStartBuffs()

	local var_3_9 = arg_3_0._userFleet:GetUnitList()

	for iter_3_6, iter_3_7 in ipairs(var_3_9) do
		local var_3_10 = var_0_0.Battle.BattleBuffUnit.New(var_0_0.Battle.BattleConfig.DULE_BALANCE_BUFF)

		iter_3_7:AddBuff(var_3_10)
	end
end

function var_0_3.Update(arg_5_0)
	arg_5_0._rivalWeaponBot:Update()
end

function var_0_3.Init(arg_6_0)
	arg_6_0._unitDataList = {}
end

function var_0_3.Clear(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0._unitDataList) do
		arg_7_0:UnregisterUnitEvent(iter_7_1)

		arg_7_0._unitDataList[iter_7_0] = nil
	end
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

function var_0_3.onInitBattle(arg_10_0)
	arg_10_0._weaponCommand = arg_10_0._state:GetCommandByName(var_0_0.Battle.BattleControllerWeaponCommand.__name)
	arg_10_0._userFleet = arg_10_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)
	arg_10_0._rivalFleet = arg_10_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FOE_CODE)
end

function var_0_3.InitProtocol(arg_11_0)
	return
end

function var_0_3.AddEvent(arg_12_0)
	arg_12_0._dataProxy:RegisterEventListener(arg_12_0, var_0_2.ADD_UNIT, arg_12_0.onAddUnit)
	arg_12_0._dataProxy:RegisterEventListener(arg_12_0, var_0_2.REMOVE_UNIT, arg_12_0.onRemoveUnit)
	arg_12_0._dataProxy:RegisterEventListener(arg_12_0, var_0_2.STAGE_DATA_INIT_FINISH, arg_12_0.onInitBattle)
	arg_12_0._dataProxy:RegisterEventListener(arg_12_0, var_0_2.SHUT_DOWN_PLAYER, arg_12_0.onPlayerShutDown)
	arg_12_0._dataProxy:RegisterEventListener(arg_12_0, var_0_2.UPDATE_COUNT_DOWN, arg_12_0.onUpdateCountDown)
end

function var_0_3.RemoveEvent(arg_13_0)
	arg_13_0._dataProxy:UnregisterEventListener(arg_13_0, var_0_2.ADD_UNIT)
	arg_13_0._dataProxy:UnregisterEventListener(arg_13_0, var_0_2.REMOVE_UNIT)
	arg_13_0._dataProxy:UnregisterEventListener(arg_13_0, var_0_2.STAGE_DATA_INIT_FINISH)
	arg_13_0._dataProxy:UnregisterEventListener(arg_13_0, var_0_2.SHUT_DOWN_PLAYER)
	arg_13_0._dataProxy:UnregisterEventListener(arg_13_0, var_0_2.UPDATE_COUNT_DOWN)
end

function var_0_3.onAddUnit(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.Data.type
	local var_14_1 = arg_14_1.Data.unit

	arg_14_0:RegisterUnitEvent(var_14_1)

	arg_14_0._unitDataList[var_14_1:GetUniqueID()] = var_14_1
end

function var_0_3.RegisterUnitEvent(arg_15_0, arg_15_1)
	arg_15_1:RegisterEventListener(arg_15_0, var_0_1.DYING, arg_15_0.onUnitDying)
	arg_15_1:RegisterEventListener(arg_15_0, var_0_1.UPDATE_HP, arg_15_0.onUpdateUnitHP)

	if arg_15_1:GetUnitType() == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_15_1:RegisterEventListener(arg_15_0, var_0_1.SHUT_DOWN_PLAYER, arg_15_0.onShutDownPlayer)
	end
end

function var_0_3.UnregisterUnitEvent(arg_16_0, arg_16_1)
	arg_16_1:UnregisterEventListener(arg_16_0, var_0_1.DYING)
	arg_16_1:UnregisterEventListener(arg_16_0, var_0_1.UPDATE_HP)

	if arg_16_1:GetUnitType() == var_0_0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		arg_16_1:UnregisterEventListener(arg_16_0, var_0_1.SHUT_DOWN_PLAYER)
	end
end

function var_0_3.onRemoveUnit(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.Data.UID
	local var_17_1 = arg_17_0._unitDataList[var_17_0]

	if var_17_1 == nil then
		return
	end

	arg_17_0:UnregisterUnitEvent(var_17_1)

	arg_17_0._unitDataList[var_17_0] = nil
end

function var_0_3.onPlayerShutDown(arg_18_0, arg_18_1)
	if arg_18_0._state:GetState() ~= arg_18_0._state.BATTLE_STATE_FIGHT then
		return
	end

	if arg_18_0._failReason == nil then
		var_0_0.Battle.BattleState.GenerateVertifyData(1)

		local var_18_0, var_18_1 = var_0_0.Battle.BattleState.Vertify()

		if not var_18_0 then
			arg_18_0._failReason = 900 + var_18_1
		end
	end

	if #arg_18_0._userFleet:GetUnitList() == 0 or #arg_18_0._rivalFleet:GetUnitList() == 0 then
		arg_18_0._dataProxy:CalcDuelScoreAtEnd(arg_18_0._userFleet, arg_18_0._rivalFleet)

		if arg_18_0._failReason then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = arg_18_0._failReason
			})

			return
		end

		arg_18_0._failReason = nil

		arg_18_0._dataProxy:TriggerFinishBattle()
		arg_18_0._state:BattleEnd()
	end

	local var_18_2 = #arg_18_0._userFleet:GetScoutList()
	local var_18_3 = #arg_18_0._rivalFleet:GetScoutList()

	if var_18_2 == 0 and var_18_3 ~= 0 then
		arg_18_0._dataProxy:ShiftFleetBound(arg_18_0._rivalFleet, var_0_0.Battle.BattleConfig.FRIENDLY_CODE)
		arg_18_0._rivalJoyStickBot:UpdateFleetArea()
		arg_18_0._rivalJoyStickBot:SwitchStrategy(var_0_0.Battle.BattleJoyStickAutoBot.COUNTER_MAIN)
	end

	if var_18_3 == 0 and var_18_2 ~= 0 then
		arg_18_0._dataProxy:ShiftFleetBound(arg_18_0._userFleet, var_0_0.Battle.BattleConfig.FOE_CODE)
		arg_18_0._weaponCommand:GetStickBot():UpdateFleetArea()
		arg_18_0._weaponCommand:GetStickBot():SwitchStrategy(var_0_0.Battle.BattleJoyStickAutoBot.COUNTER_MAIN)
	end

	if not arg_18_1.Data.unit:IsMainFleetUnit() and var_18_2 == 0 and var_18_3 == 0 then
		local var_18_4 = arg_18_0._userFleet:GetMainList()
		local var_18_5 = arg_18_0._rivalFleet:GetMainList()

		for iter_18_0, iter_18_1 in ipairs(var_18_4) do
			local var_18_6 = var_0_0.Battle.BattleBuffUnit.New(var_0_0.Battle.BattleConfig.DUEL_MAIN_RAGE_BUFF)

			iter_18_1:AddBuff(var_18_6)
		end

		for iter_18_2, iter_18_3 in ipairs(var_18_5) do
			local var_18_7 = var_0_0.Battle.BattleBuffUnit.New(var_0_0.Battle.BattleConfig.DUEL_MAIN_RAGE_BUFF)

			iter_18_3:AddBuff(var_18_7)
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("battle_duel_main_rage"))
	end
end

function var_0_3.onUpdateCountDown(arg_19_0, arg_19_1)
	if arg_19_0._dataProxy:GetCountDown() <= 0 then
		local var_19_0, var_19_1 = arg_19_0._userFleet:GetDamageRatioResult()
		local var_19_2, var_19_3 = arg_19_0._rivalFleet:GetDamageRatioResult()

		arg_19_0._dataProxy:TriggerFinishBattle()
		arg_19_0._dataProxy:CalcDuelScoreAtTimesUp(var_19_0, var_19_2, var_19_1, var_19_3)
		arg_19_0._state:BattleEnd()
	end
end

function var_0_3.onUpdateUnitHP(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1.Dispatcher:GetFleetVO()

	if var_20_0 then
		local var_20_1 = arg_20_1.Data.validDHP

		var_20_0:UpdateFleetDamage(var_20_1)
	end
end

function var_0_3.onUnitDying(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.Dispatcher
	local var_21_1 = var_21_0:GetUniqueID()

	if var_21_0:GetUnitType() ~= var_0_0.Battle.BattleConst.UnitType.MINION_UNIT then
		arg_21_0._dataProxy:CalcBattleScoreWhenDead(var_21_0)
	end

	arg_21_0._dataProxy:KillUnit(var_21_1)
end

function var_0_3.onShutDownPlayer(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.Dispatcher
	local var_22_1 = var_22_0:GetUniqueID()

	var_22_0:GetFleetVO():UpdateFleetOverDamage(var_22_0)
	arg_22_0._dataProxy:ShutdownPlayerUnit(var_22_1)
end
