ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = var_0_0.Battle.BattleAttr

var_0_0.Battle.BattleUnitCloakComponent = class("BattleUnitCloakComponent")
var_0_0.Battle.BattleUnitCloakComponent.__name = "BattleUnitCloakComponent"

local var_0_5 = var_0_0.Battle.BattleUnitCloakComponent

var_0_5.STATE_CLOAK = "STATE_CLOAK"
var_0_5.STATE_UNCLOAK = "STATE_UNCLOAK"

function var_0_5.Ctor(arg_1_0, arg_1_1)
	arg_1_0._client = arg_1_1

	arg_1_0:initCloak()
end

function var_0_5.Update(arg_2_0, arg_2_1)
	arg_2_0._lastCloakUpdateStamp = arg_2_0._lastCloakUpdateStamp or arg_2_1

	arg_2_0:updateCloakValue(arg_2_1)
	arg_2_0:UpdateCloakState()

	arg_2_0._lastCloakUpdateStamp = arg_2_1

	var_0_0.Battle.BattleBuffDOT.UpdateCloakLock(arg_2_0._client)
end

function var_0_5.UpdateCloakConfig(arg_3_0)
	arg_3_0._exposeBase = var_0_4.GetCurrent(arg_3_0._client, "cloakExposeBase")
	arg_3_0._exposeExtra = var_0_4.GetCurrent(arg_3_0._client, "cloakExposeExtra")
	arg_3_0._restoreValue = var_0_4.GetCurrent(arg_3_0._client, "cloakRestore")
	arg_3_0._recovery = var_0_4.GetCurrent(arg_3_0._client, "cloakRecovery")

	arg_3_0:adjustCloakAttr()
	arg_3_0._client:DispatchEvent(var_0_0.Event.New(var_0_1.UPDATE_CLOAK_CONFIG))
end

function var_0_5.SetRecoverySpeed(arg_4_0, arg_4_1)
	arg_4_0._fieldRecoveryOverride = arg_4_1
end

function var_0_5.AppendExpose(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0._cloakValue + arg_5_1
	local var_5_1 = arg_5_0:GetCloakBottom()

	arg_5_0._cloakValue = Mathf.Clamp(var_5_0, var_5_1, arg_5_0._exposeValue)

	arg_5_0:UpdateCloakState()
end

function var_0_5.AppendStrikeExpose(arg_6_0)
	local var_6_0 = math.min(arg_6_0._strikeExposeAdditive * arg_6_0._strikeCount, arg_6_0._strikeExposeAdditiveLimit)

	arg_6_0._strikeCount = arg_6_0._strikeCount + 1

	arg_6_0:AppendExpose(var_6_0)
end

function var_0_5.AppendBombardExpose(arg_7_0)
	local var_7_0 = math.min(arg_7_0._bombardExposeAdditive * arg_7_0._bombardCount, arg_7_0._bombardExposeAdditiveLimit)

	arg_7_0._bombardCount = arg_7_0._bombardCount + 1

	arg_7_0:AppendExpose(var_7_0)
end

function var_0_5.AppendExposeSpeed(arg_8_0, arg_8_1)
	arg_8_0._exposeSpeed = arg_8_1
end

function var_0_5.ForceToMax(arg_9_0)
	arg_9_0:ForceToRate(1)
end

function var_0_5.ForceToRate(arg_10_0, arg_10_1)
	arg_10_0._cloakValue = math.floor(arg_10_1 * arg_10_0._exposeValue)

	arg_10_0:UpdateCloakState()
end

function var_0_5.UpdateDotExpose(arg_11_0, arg_11_1)
	if arg_11_1 ~= arg_11_0._cloakBottom then
		arg_11_0._cloakBottom = arg_11_1

		arg_11_0._client:DispatchEvent(var_0_0.Event.New(var_0_1.UPDATE_CLOAK_LOCK))
	end
end

function var_0_5.UpdateTauntExpose(arg_12_0, arg_12_1)
	if arg_12_1 then
		arg_12_0._tauntCloakBottom = arg_12_0._restoreValue
	else
		arg_12_0._tauntCloakBottom = nil
	end
end

function var_0_5.UpdateCloakState(arg_13_0)
	local var_13_0

	if arg_13_0._cloakValue >= arg_13_0._exposeValue then
		var_13_0 = var_0_5.STATE_UNCLOAK
	elseif arg_13_0._cloakValue < arg_13_0._restoreValue then
		var_13_0 = var_0_5.STATE_CLOAK
	end

	if var_13_0 and var_13_0 ~= arg_13_0._currentState then
		arg_13_0._currentState = var_13_0

		if arg_13_0._currentState == var_0_5.STATE_UNCLOAK then
			var_0_4.Uncloak(arg_13_0._client)
			arg_13_0:triggerBuff()
		elseif arg_13_0._currentState == var_0_5.STATE_CLOAK then
			var_0_4.Cloak(arg_13_0._client)
			arg_13_0:triggerBuff()
		end
	end
end

function var_0_5.GetCloakValue(arg_14_0)
	return arg_14_0._cloakValue
end

function var_0_5.GetCloakMax(arg_15_0)
	return arg_15_0._exposeValue
end

function var_0_5.GetCloakLockMin(arg_16_0)
	return arg_16_0._fireLockValue
end

function var_0_5.GetCloakRestoreValue(arg_17_0)
	return arg_17_0._restoreValue
end

function var_0_5.GetCloakBottom(arg_18_0)
	if arg_18_0._tauntCloakBottom then
		return math.max(arg_18_0._tauntCloakBottom, arg_18_0._cloakBottom)
	else
		return arg_18_0._cloakBottom
	end
end

function var_0_5.GetCurrentState(arg_19_0)
	return arg_19_0._currentState
end

function var_0_5.GetExposeSpeed(arg_20_0)
	return arg_20_0._exposeSpeed
end

function var_0_5.updateCloakValue(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1 - arg_21_0._lastCloakUpdateStamp
	local var_21_1 = arg_21_0._fieldRecoveryOverride or arg_21_0._recovery
	local var_21_2 = (arg_21_0._exposeSpeed - var_21_1) * var_21_0

	arg_21_0:AppendExpose(var_21_2)
end

function var_0_5.initCloak(arg_22_0)
	arg_22_0._exposeBase = var_0_4.GetCurrent(arg_22_0._client, "cloakExposeBase")
	arg_22_0._exposeExtra = var_0_4.GetCurrent(arg_22_0._client, "cloakExposeExtra")
	arg_22_0._restoreValue = var_0_4.GetCurrent(arg_22_0._client, "cloakRestore")
	arg_22_0._fireLockValue = var_0_4.GetCurrent(arg_22_0._client, "cloakFireLock")
	arg_22_0._cloakValue = 0
	arg_22_0._exposeSpeed = 0
	arg_22_0._cloakBottom = 0

	arg_22_0:adjustCloakAttr()

	arg_22_0._recovery = var_0_4.GetCurrent(arg_22_0._client, "cloakRecovery")
	arg_22_0._strikeExposeAdditive = var_0_4.GetCurrent(arg_22_0._client, "cloakStrikeAdditive")
	arg_22_0._bombardExposeAdditive = var_0_4.GetCurrent(arg_22_0._client, "cloakBombardAdditive")
	arg_22_0._strikeCount = 0
	arg_22_0._bombardCount = 0
	arg_22_0._strikeExposeAdditiveLimit = var_0_3.CLOAK_STRIKE_ADDITIVE_LIMIT
	arg_22_0._bombardExposeAdditiveLimit = var_0_3.CLOAK_STRIKE_ADDITIVE_LIMIT
	arg_22_0._exposeDotList = {}
	arg_22_0._currentState = var_0_5.STATE_CLOAK

	var_0_4.Cloak(arg_22_0._client)
	arg_22_0:triggerBuff()
end

function var_0_5.triggerBuff(arg_23_0)
	local var_23_0 = var_0_4.GetCurrent(arg_23_0._client, "isCloak")

	arg_23_0._client:DispatchCloakStateUpdate()
end

function var_0_5.adjustCloakAttr(arg_24_0)
	arg_24_0._exposeBase = math.max(arg_24_0._exposeBase, var_0_3.CLOAK_EXPOSE_BASE_MIN)
	arg_24_0._exposeValue = math.max(arg_24_0._exposeBase + arg_24_0._exposeExtra, var_0_3.CLOAK_EXPOSE_SKILL_MIN)
	arg_24_0._restoreValue = math.max(arg_24_0._exposeValue + var_0_3.CLOAK_BASE_RESTORE_DELTA, 0)
	arg_24_0._exposeValue = math.max(arg_24_0._exposeBase + arg_24_0._exposeExtra, var_0_3.CLOAK_EXPOSE_SKILL_MIN)
	arg_24_0._cloakValue = Mathf.Clamp(arg_24_0._cloakValue, 0, arg_24_0._exposeValue)

	var_0_4.SetCurrent(arg_24_0._client, "cloakExposeBase", arg_24_0._exposeBase)
	var_0_4.SetCurrent(arg_24_0._client, "cloakRestore", arg_24_0._restoreValue)
	arg_24_0:UpdateCloakState()
end
