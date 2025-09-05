ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleConfig
local var_0_3 = class("BattleMainFleetCharacter", var_0_0.Battle.BattlePlayerCharacter)

var_0_0.Battle.BattleMainFleetCharacter = var_0_3
var_0_3.__name = "BattleMainFleetCharacter"

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.Update(arg_2_0)
	var_0_3.super.Update(arg_2_0)
	arg_2_0:UpdateArrowBarPosition()
end

function var_0_3.AddArrowBar(arg_3_0, arg_3_1)
	var_0_3.super.AddArrowBar(arg_3_0, arg_3_1)

	local var_3_0 = LoadSprite("qicon/" .. arg_3_0._unitData:GetTemplate().painting) or LoadSprite("heroicon/unknown")

	setImageSprite(findTF(arg_3_0._arrowBar, "icon"), var_3_0)
end

function var_0_3.UpdateHPBarPosition(arg_4_0)
	if not arg_4_0._inViewArea then
		var_0_3.super.UpdateHPBarPosition(arg_4_0)
	end
end

function var_0_3.GetReferenceVector(arg_5_0, arg_5_1)
	if not arg_5_0._inViewArea then
		return var_0_3.super.GetReferenceVector(arg_5_0, arg_5_1)
	else
		return arg_5_0._arrowVector
	end
end
