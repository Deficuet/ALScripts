ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleBuffRecoilShield = class("BattleBuffRecoilShield", var_0_0.Battle.BattleBuffShield)
var_0_0.Battle.BattleBuffRecoilShield.__name = "BattleBuffRecoilShield"

local var_0_1 = var_0_0.Battle.BattleBuffRecoilShield

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	var_0_1.super.SetArgs(arg_2_0, arg_2_1, arg_2_2)

	arg_2_0._recoilRate = arg_2_0._tempData.arg_list.recoilRate or 1
	arg_2_0._proxy = var_0_0.Battle.BattleDataProxy.GetInstance()
end

function var_0_1.onFinishGame(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0._totalShield - arg_3_0._shield

	if var_3_0 >= 1 then
		local var_3_1 = math.floor(var_3_0 * arg_3_0._recoilRate)

		arg_3_0._proxy:HandleDirectDamage(arg_3_1, var_3_1, nil, nil, false, false, true)
	end
end

function var_0_1.onAttach(arg_4_0, arg_4_1, arg_4_2)
	var_0_1.super.onAttach(arg_4_0, arg_4_1, arg_4_2)
	arg_4_1:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_RECOIL_SHIELD))
end

function var_0_1.CalcNumber(arg_5_0, arg_5_1)
	arg_5_0._totalShield = var_0_1.super.CalcNumber(arg_5_0, arg_5_1)

	return arg_5_0._totalShield
end

function var_0_1.GetCurrentRate(arg_6_0)
	return arg_6_0._shield / arg_6_0._totalShield
end
