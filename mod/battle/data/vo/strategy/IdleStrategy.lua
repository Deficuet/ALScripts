ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleFormulas
local var_0_2 = var_0_0.Battle.BattleConfig

var_0_0.Battle.IdleStrategy = class("IdleStrategy", var_0_0.Battle.BattleJoyStickBotBaseStrategy)

local var_0_3 = var_0_0.Battle.IdleStrategy

var_0_3.__name = "IdleStrategy"

function var_0_3.Ctor(arg_1_0, arg_1_1)
	var_0_3.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_3.GetStrategyType(arg_2_0)
	return var_0_0.Battle.BattleJoyStickAutoBot.IDLE
end

function var_0_3.analysis(arg_3_0)
	arg_3_0._hrz = 0
	arg_3_0._vtc = 0
end
