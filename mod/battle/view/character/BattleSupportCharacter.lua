ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleConfig
local var_0_3 = var_0_0.Battle.BattleUnitEvent

var_0_0.Battle.BattleSupportCharacter = class("BattleSupportCharacter", var_0_0.Battle.BattleCharacter)
var_0_0.Battle.BattleSupportCharacter.__name = "BattleSupportCharacter"

local var_0_4 = var_0_0.Battle.BattleSupportCharacter

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)

	arg_1_0._preCastBound = false
end

function var_0_4.RegisterWeaponListener(arg_2_0, arg_2_1)
	var_0_4.super.RegisterWeaponListener(arg_2_0, arg_2_1)
	arg_2_1:RegisterEventListener(arg_2_0, var_0_3.WEAPON_PRE_CAST, arg_2_0.onWeaponPreCast)
	arg_2_1:RegisterEventListener(arg_2_0, var_0_3.WEAPON_PRE_CAST_FINISH, arg_2_0.onWeaponPrecastFinish)
end

function var_0_4.UnregisterWeaponListener(arg_3_0, arg_3_1)
	var_0_4.super.UnregisterWeaponListener(arg_3_0, arg_3_1)
	arg_3_1:UnregisterEventListener(arg_3_0, var_0_3.WEAPON_PRE_CAST)
	arg_3_1:UnregisterEventListener(arg_3_0, var_0_3.WEAPON_PRE_CAST_FINISH)
end

function var_0_4.Update(arg_4_0)
	return
end

function var_0_4.UpdateHPBarPosition(arg_5_0)
	return
end

function var_0_4.SpawnBullet(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	local var_6_0 = arg_6_0._bulletFactoryList[arg_6_1:GetTemplate().type]
	local var_6_1 = arg_6_0._unitData:GetPosition()

	var_6_0:CreateBullet(arg_6_0._tf, arg_6_1, var_6_1, arg_6_3, arg_6_0._unitData:GetDirection())
end

function var_0_4.AddFX(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	if arg_7_4 then
		arg_7_4()
	end
end

function var_0_4.updateComponentVisible(arg_8_0)
	if arg_8_0._unitData:GetIFF() ~= var_0_2.FOE_CODE then
		return
	end

	local var_8_0 = arg_8_0._unitData:GetExposed()
	local var_8_1 = arg_8_0._unitData:GetDiveDetected()
	local var_8_2 = arg_8_0._unitData:GetDiveInvisible()
	local var_8_3 = var_8_0 and (not var_8_2 or not not var_8_1)

	SetActive(arg_8_0._HPBarTf, var_8_3)
	SetActive(arg_8_0._FXAttachPoint, var_8_3)
end

function var_0_4.updateComponentDiveInvisible(arg_9_0)
	local var_9_0 = arg_9_0._unitData:GetDiveDetected() and arg_9_0._unitData:GetIFF() == var_0_2.FOE_CODE
	local var_9_1 = arg_9_0._unitData:GetDiveInvisible()
	local var_9_2
	local var_9_3 = (var_9_0 or not var_9_1) and true or false

	SetActive(arg_9_0._HPBarTf, var_9_3)
	SetActive(arg_9_0._FXAttachPoint, var_9_3)
end

function var_0_4.Dispose(arg_10_0)
	arg_10_0:AddShaderColor()
	var_0_4.super.Dispose(arg_10_0)
end

function var_0_4.GetModleID(arg_11_0)
	return arg_11_0._unitData:GetTemplate().prefab
end

function var_0_4.OnAnimatorTrigger(arg_12_0)
	arg_12_0._unitData:CharacterActionTriggerCallback()
end

function var_0_4.OnAnimatorEnd(arg_13_0)
	arg_13_0._unitData:CharacterActionEndCallback()
end

function var_0_4.OnAnimatorStart(arg_14_0)
	arg_14_0._unitData:CharacterActionStartCallback()
end

function var_0_4.UpdateAimBiasBar(arg_15_0)
	var_0_4.super.UpdateAimBiasBar(arg_15_0)

	if arg_15_0._fogFx then
		local var_15_0 = arg_15_0:GetUnitData():GetAimBias():GetCurrentRate()

		arg_15_0._fogFx.transform.localScale = Vector3(var_15_0, var_15_0, 1)
	end
end
