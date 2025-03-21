ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleAttr

var_0_0.Battle.RaidOxyState = class("RaidOxyState", var_0_0.Battle.IOxyState)
var_0_0.Battle.RaidOxyState.__name = "RaidOxyState"

local var_0_3 = var_0_0.Battle.RaidOxyState

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.GetWeaponUseableList(arg_2_0)
	return {
		var_0_1.OXY_STATE.DIVE
	}
end

function var_0_3.UpdateCldData(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_2:GetDiveState()
	local var_3_1 = arg_3_0:GetDiveState()

	arg_3_1:GetCldData().Surface = var_3_1

	if var_3_0 ~= var_3_1 then
		var_0_2.UnitCldImmune(arg_3_1)
	end
end

function var_0_3.GetDiveState(arg_4_0)
	return var_0_1.OXY_STATE.DIVE
end

function var_0_3.GetBubbleFlag(arg_5_0)
	return true
end

function var_0_3.IsVisible(arg_6_0)
	return false
end

function var_0_3.GetBarVisible(arg_7_0)
	return true
end

function var_0_3.RunMode(arg_8_0)
	return false
end

function var_0_3.DoUpdateOxy(arg_9_0, arg_9_1)
	arg_9_1:OxyConsume()
end
