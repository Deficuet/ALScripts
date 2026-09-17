ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleBuffOrb", var_0_0.Battle.BattleBuffEffect)

var_0_0.Battle.BattleBuffOrb = var_0_1
var_0_1.__name = "BattleBuffOrb"

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_0._tempData.arg_list

	arg_2_0._buffID = var_2_0.buff_id
	arg_2_0._rant = var_2_0.rant or 10000
	arg_2_0._level = var_2_0.level or 1
	arg_2_0._buffLevel = var_2_0.buff_level or 1
	arg_2_0._type = var_2_0.type
end

function var_0_1.onTrigger(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_3._bullet

	if arg_3_0._type and var_3_0:GetTemplate().type ~= arg_3_0._type then
		return
	end

	arg_3_0:attachOrb(var_3_0)
	var_0_1.super.onTrigger(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
end

function var_0_1.attachOrb(arg_4_0, arg_4_1)
	local var_4_0 = {
		buff_id = arg_4_0._buffID,
		rant = arg_4_0._rant,
		level = arg_4_0._level,
		buff_level = arg_4_0._buffLevel,
		group_level = arg_4_0._level
	}

	arg_4_1:AppendAttachBuff(var_4_0)
end
