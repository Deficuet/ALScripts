ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleTorpedoUnit = class("BattleTorpedoUnit", var_0_0.Battle.BattleWeaponUnit)
var_0_0.Battle.BattleTorpedoUnit.__name = "BattleTorpedoUnit"

local var_0_1 = var_0_0.Battle.BattleTorpedoUnit

function var_0_1.Ctor(arg_1_0)
	var_0_0.Battle.BattleTorpedoUnit.super.Ctor(arg_1_0)
end

function var_0_1.TriggerBuffOnFire(arg_2_0)
	arg_2_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_TORPEDO_FIRE, {
		equipIndex = arg_2_0._equipmentIndex
	})
end

function var_0_1.EnterCoolDown(arg_3_0)
	if arg_3_0._isSupportWeapon then
		arg_3_0._currentState = arg_3_0.STATE_DISABLE
	else
		var_0_1.super.EnterCoolDown(arg_3_0)
	end
end

function var_0_1.TriggerBuffWhenSpawn(arg_4_0, arg_4_1)
	local var_4_0 = {
		_bullet = arg_4_1,
		equipIndex = arg_4_0._equipmentIndex,
		bulletTag = arg_4_1:GetExtraTag()
	}

	arg_4_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_BULLET_CREATE, var_4_0)
	arg_4_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_TORPEDO_BULLET_CREATE, var_4_0)
end
