ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleBuffSize = class("BattleBuffSize", var_0_0.Battle.BattleBuffEffect)
var_0_0.Battle.BattleBuffSize.__name = "BattleBuffSize"

local var_0_1 = var_0_0.Battle.BattleBuffSize

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_0.Battle.BattleBuffSize.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._base = arg_2_0._tempData.arg_list.number or 1
	arg_2_0._hpScale = arg_2_0._tempData.arg_list.hp_scale or 0
end

function var_0_1.onHPRatioUpdate(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:doScale(arg_3_1)
end

function var_0_1.onAttach(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:doScale(arg_4_1)
end

function var_0_1.onRemove(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {
		size = initScale
	}

	arg_5_1:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE, var_5_0))
end

function var_0_1.doScale(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1:GetHPRate()
	local var_6_1 = arg_6_0._base + var_6_0 * arg_6_0._hpScale
	local var_6_2 = {
		size = var_6_1
	}

	arg_6_1:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE, var_6_2))
end
