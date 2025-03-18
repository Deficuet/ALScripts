ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleSkillDamage = class("BattleSkillDamage", var_0_0.Battle.BattleSkillEffect)
var_0_0.Battle.BattleSkillDamage.__name = "BattleSkillDamage"

function var_0_0.Battle.BattleSkillDamage.Ctor(arg_1_0, arg_1_1)
	var_0_0.Battle.BattleSkillDamage.super.Ctor(arg_1_0, arg_1_1, lv)

	arg_1_0._number = arg_1_0._tempData.arg_list.number or 0
	arg_1_0._currentHPRate = arg_1_0._tempData.arg_list.current_hp_rate or 0
	arg_1_0._maxHPRate = arg_1_0._tempData.arg_list.rate or 0
	arg_1_0._proxy = var_0_0.Battle.BattleDataProxy.GetInstance()
end

function var_0_0.Battle.BattleSkillDamage.DoDataEffect(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0, var_2_1 = arg_2_2:GetHP()
	local var_2_2 = math.floor(var_2_1 * arg_2_0._maxHPRate) + math.floor(var_2_0 * arg_2_0._currentHPRate) + arg_2_0._number

	arg_2_0._proxy:HandleDirectDamage(arg_2_2, var_2_2, arg_2_1)

	if not arg_2_2:IsAlive() then
		var_0_0.Battle.BattleAttr.Spirit(arg_2_2)
		var_0_0.Battle.BattleAttr.AppendInvincible(arg_2_2)
	end
end
