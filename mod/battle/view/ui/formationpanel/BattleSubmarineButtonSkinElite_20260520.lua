ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleSubmarineButtonSkinElite_20260520", var_0_0.Battle.BattleSubmarineButton)

var_0_0.Battle.BattleSubmarineButtonSkinElite_20260520 = var_0_1
var_0_1.__name = "BattleSubmarineButtonSkinElite_20260520"

function var_0_1.ConfigSkin(arg_1_0, arg_1_1)
	var_0_1.super.ConfigSkin(arg_1_0, arg_1_1)

	arg_1_0._unfill = arg_1_0._icon:Find("unfill/unfill")
	arg_1_0._unfillShade = arg_1_0._icon:Find("unfill/unfill_1")
end

function var_0_1.OnFilled(arg_2_0)
	var_0_1.super.OnFilled(arg_2_0)
	SetActive(arg_2_0._unfillShade, false)
end

function var_0_1.OnUnfill(arg_3_0)
	var_0_1.super.OnUnfill(arg_3_0)
	SetActive(arg_3_0._unfillShade, true)
end

function var_0_1.SwitchIcon(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0, var_4_1 = var_0_1.super.SwitchIcon(arg_4_0, arg_4_1, arg_4_2)

	setImageSprite(arg_4_0._unfillShade, LoadSprite("ui/CombatUI" .. var_4_0 .. "_atlas", "weapon_unfill_" .. var_4_1))
end
