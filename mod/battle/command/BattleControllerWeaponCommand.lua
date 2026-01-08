ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleEvent

var_0_0.Battle.BattleControllerWeaponCommand = class("BattleControllerWeaponCommand", var_0_0.MVC.Command)
var_0_0.Battle.BattleControllerWeaponCommand.__name = "BattleControllerWeaponCommand"

local var_0_2 = var_0_0.Battle.BattleControllerWeaponCommand

function var_0_2.Ctor(arg_1_0)
	var_0_2.super.Ctor(arg_1_0)
end

function var_0_2.Initialize(arg_2_0)
	var_0_2.super.Initialize(arg_2_0)

	arg_2_0._dataProxy = arg_2_0._state:GetProxyByName(var_0_0.Battle.BattleDataProxy.__name)

	arg_2_0:InitBattleEvent()

	arg_2_0._focusBlockCast = false
end

function var_0_2.ActiveBot(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._manualWeaponAutoBot:SetActive(arg_3_1, arg_3_2)
	arg_3_0._joyStickAutoBot:SetActive(arg_3_1)
end

function var_0_2.TryAutoSub(arg_4_0)
	local var_4_0 = arg_4_0:GetState():GetBattleType()

	if var_0_0.Battle.BattleState.IsAutoSubActive(var_4_0) then
		local var_4_1 = arg_4_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)._submarineVO

		if var_4_1:GetUseable() and var_4_1:GetCount() > 0 then
			arg_4_0._dataProxy:SubmarineStrike(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)
			var_4_1:Cast()
		end
	end
end

function var_0_2.GetWeaponBot(arg_5_0)
	return arg_5_0._manualWeaponAutoBot
end

function var_0_2.GetBotActiveDuration(arg_6_0)
	return arg_6_0._manualWeaponAutoBot:GetTotalActiveDuration()
end

function var_0_2.GetStickBot(arg_7_0)
	return arg_7_0._joyStickAutoBot
end

function var_0_2.InitBattleEvent(arg_8_0)
	arg_8_0._dataProxy:RegisterEventListener(arg_8_0, var_0_1.COMMON_DATA_INIT_FINISH, arg_8_0.onUnitInitFinish)
	arg_8_0._dataProxy:RegisterEventListener(arg_8_0, var_0_1.JAMMING, arg_8_0.onJamming)
end

function var_0_2.Update(arg_9_0, arg_9_1)
	if arg_9_0._jammingFlag then
		return
	end

	if not arg_9_0._focusBlockCast then
		arg_9_0._manualWeaponAutoBot:Update()
	end

	for iter_9_0, iter_9_1 in pairs(arg_9_0._fleetList) do
		iter_9_1:UpdateManualWeaponVO(arg_9_1)
	end
end

function var_0_2.onJamming(arg_10_0, arg_10_1)
	arg_10_0._jammingFlag = arg_10_1.Data.jammingFlag
end

function var_0_2.onUnitInitFinish(arg_11_0, arg_11_1)
	arg_11_0._fleetList = arg_11_0._dataProxy:GetFleetList()

	local var_11_0 = arg_11_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)

	var_11_0:RegisterEventListener(arg_11_0, var_0_1.REFRESH_FLEET_FORMATION, arg_11_0.onFleetFormationUpdate)
	var_11_0:RegisterEventListener(arg_11_0, var_0_1.OVERRIDE_AUTO_BOT, arg_11_0.onOverrideAutoBot)

	arg_11_0._manualWeaponAutoBot = var_0_0.Battle.BattleManualWeaponAutoBot.New(var_11_0)
	arg_11_0._joyStickAutoBot = var_0_0.Battle.BattleJoyStickAutoBot.New(arg_11_0._dataProxy, var_11_0)

	if arg_11_0._dataProxy:GetInitData().battleType == SYSTEM_SCENARIO_SUB_STRIKE then
		arg_11_0._joyStickAutoBot:SwitchStrategy(arg_11_0._joyStickAutoBot.IDLE)
	else
		arg_11_0._joyStickAutoBot:SwitchStrategy(arg_11_0._joyStickAutoBot.RANDOM)
	end

	var_0_0.Battle.BattleCameraUtil.GetInstance():RegisterEventListener(arg_11_0, var_0_1.CAMERA_FOCUS, arg_11_0.onCameraFocus)
end

function var_0_2.onFleetFormationUpdate(arg_12_0, arg_12_1)
	arg_12_0._joyStickAutoBot:FleetFormationUpdate()
end

function var_0_2.onOverrideAutoBot(arg_13_0, arg_13_1)
	arg_13_0._joyStickAutoBot:SwitchStrategy(var_0_0.Battle.BattleJoyStickAutoBot.AUTO_PILOT)
end

function var_0_2.onCameraFocus(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.Data

	if var_14_0.unit ~= nil then
		arg_14_0._focusBlockCast = true
	else
		local var_14_1 = var_14_0.duration + var_14_0.extraBulletTime

		LeanTween.delayedCall(var_14_1, System.Action(function()
			arg_14_0._focusBlockCast = false
		end))
	end
end

function var_0_2.Dispose(arg_16_0)
	local var_16_0 = arg_16_0._dataProxy:GetFleetByIFF(var_0_0.Battle.BattleConfig.FRIENDLY_CODE)

	var_16_0:UnregisterEventListener(arg_16_0, var_0_1.REFRESH_FLEET_FORMATION)
	var_16_0:UnregisterEventListener(arg_16_0, var_0_1.OVERRIDE_AUTO_BOT)
	arg_16_0._dataProxy:UnregisterEventListener(arg_16_0, var_0_1.COMMON_DATA_INIT_FINISH)
	var_0_0.Battle.BattleCameraUtil.GetInstance():UnregisterEventListener(arg_16_0, var_0_1.CAMERA_FOCUS)
	arg_16_0._joyStickAutoBot:Dispose()

	arg_16_0._joyStickAutoBot = nil

	arg_16_0._manualWeaponAutoBot:Dispose()

	arg_16_0._manualWeaponAutoBot = nil

	var_0_2.super.Dispose(arg_16_0)
end
