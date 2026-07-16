ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleBuffShield = class("BattleBuffShield", var_0_0.Battle.BattleBuffEffect)
var_0_0.Battle.BattleBuffShield.__name = "BattleBuffShield"

local var_0_1 = var_0_0.Battle.BattleBuffShield

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.GetEffectAttachData(arg_2_0)
	return arg_2_0._shield
end

function var_0_1.SetArgs(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0._tempData.arg_list

	arg_3_0._number = var_3_0.number or 0
	arg_3_0._maxHPRatio = var_3_0.maxHPRatio or 0
	arg_3_0._curretHPRatio = var_3_0.currentHPRatio or 0
	arg_3_0._casterMaxHPRatio = var_3_0.casterMaxHPRatio or 0
	arg_3_0._casterCurrentHPRatio = var_3_0.casterCurretnHPRatio or 0
	arg_3_0._shield = arg_3_0:CalcNumber(arg_3_1)
end

function var_0_1.onStack(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._shield = arg_4_0:CalcNumber(arg_4_1)
end

function var_0_1.onTakeDamage(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_3.ignoreShield and arg_5_0:damageCheck(arg_5_3) then
		local var_5_0 = arg_5_3.damage

		arg_5_0._shield = arg_5_0._shield - var_5_0

		if arg_5_0._shield > 0 then
			arg_5_3.damage = 0
		else
			arg_5_3.damage = -arg_5_0._shield

			arg_5_2:SetToCancel()
		end
	end
end

function var_0_1.CalcNumber(arg_6_0, arg_6_1)
	local var_6_0, var_6_1 = arg_6_1:GetHP()
	local var_6_2, var_6_3 = arg_6_0._caster:GetHP()
	local var_6_4 = var_6_1 * arg_6_0._maxHPRatio + arg_6_0._casterMaxHPRatio * var_6_3 + arg_6_0._number + var_6_0 * arg_6_0._curretHPRatio + var_6_2 * arg_6_0._casterCurrentHPRatio

	return math.max(0, math.floor(var_6_4))
end
