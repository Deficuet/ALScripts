ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleSubmarineButton", var_0_0.Battle.BattleWeaponButton)

var_0_0.Battle.BattleSubmarineButton = var_0_1
var_0_1.__name = "BattleSubmarineButton"

function var_0_1.Ctor(arg_1_0)
	var_0_1.super.Ctor(arg_1_0)
end

function var_0_1.OnCountChange(arg_2_0)
	local var_2_0 = arg_2_0._progressInfo:GetCount()
	local var_2_1 = arg_2_0._progressInfo:GetTotal()

	arg_2_0._countTxt.text = string.format("%d", var_2_0)
end

function var_0_1.ConfigSkin(arg_3_0, arg_3_1)
	var_0_1.super.ConfigSkin(arg_3_0, arg_3_1)
	arg_3_0._progress.gameObject:SetActive(false)
	arg_3_0._filledEffect.gameObject:SetActive(false)
end

function var_0_1.ConfigCallback(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	local function var_4_0()
		arg_4_2()
	end

	var_0_1.super.ConfigCallback(arg_4_0, arg_4_1, var_4_0, arg_4_3, arg_4_4)
end

function var_0_1.OnOverLoadChange(arg_6_0, arg_6_1)
	var_0_1.super.OnOverLoadChange(arg_6_0, arg_6_1)

	if arg_6_0._progressInfo:GetTotal() == arg_6_0._progressInfo:GetCount() then
		quickCheckAndPlayAnimator(arg_6_0._skin, "weapon_button_into")
	elseif arg_6_0._progressInfo:GetCount() == 0 then
		quickCheckAndPlayAnimator(arg_6_0._skin, "weapon_button_use")
	end
end

function var_0_1.Update(arg_7_0)
	return
end

function var_0_1.updateProgressBar(arg_8_0)
	return
end

function var_0_1.OnfilledEffect(arg_9_0)
	return
end
