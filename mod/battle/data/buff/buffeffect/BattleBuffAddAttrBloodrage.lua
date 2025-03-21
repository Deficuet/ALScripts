ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleBuffAddAttrBloodrage", var_0_0.Battle.BattleBuffAddAttr)

var_0_0.Battle.BattleBuffAddAttrBloodrage = var_0_1
var_0_1.__name = "BattleBuffAddAttrBloodrage"

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.GetEffectType(arg_2_0)
	return var_0_0.Battle.BattleBuffEffect.FX_TYPE_MOD_ATTR
end

function var_0_1.SetArgs(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._group = arg_3_0._tempData.arg_list.group or arg_3_2:GetID()
	arg_3_0._attr = arg_3_0._tempData.arg_list.attr
	arg_3_0._threshold = arg_3_0._tempData.arg_list.threshold
	arg_3_0._value = arg_3_0._tempData.arg_list.value
	arg_3_0._attrBound = arg_3_0._tempData.arg_list.attrBound
	arg_3_0._number = 0
end

function var_0_1.calcBloodRageNumber(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:GetHPRate()

	if var_4_0 > arg_4_0._threshold then
		arg_4_0._number = 0
	else
		arg_4_0._number = (arg_4_0._threshold - var_4_0) / arg_4_0._value

		if arg_4_0._attrBound then
			arg_4_0._number = math.min(arg_4_0._number, arg_4_0._attrBound)
		end
	end
end

function var_0_1.doOnHPRatioUpdate(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:calcBloodRageNumber(arg_5_1)
	arg_5_0:UpdateAttr(arg_5_1)
end

function var_0_1.onRemove(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._number = 0

	arg_6_0:UpdateAttr(arg_6_1)
end
