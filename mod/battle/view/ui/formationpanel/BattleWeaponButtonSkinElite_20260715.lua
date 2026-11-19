ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20260715", var_0_0.Battle.BattleWeaponButtonSkinElite_20250327)

var_0_0.Battle.BattleWeaponButtonSkinElite_20260715 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20260715"

function var_0_1.OnTotalChange(arg_1_0, arg_1_1)
	var_0_1.super.OnTotalChange(arg_1_0, arg_1_1)
	SetActive(arg_1_0._glowEff, arg_1_0._progressInfo:GetTotal() > 0)
	SetActive(arg_1_0._gizmosXue, arg_1_0._progressInfo:GetTotal() > 0)
end

function var_0_1.ConfigSkin(arg_2_0, arg_2_1)
	var_0_1.super.ConfigSkin(arg_2_0, arg_2_1)

	arg_2_0._glowEff = arg_2_0._btn:Find("gizmos_1")
end

function var_0_1.OnCountChange(arg_3_0)
	var_0_1.super.OnCountChange(arg_3_0)
	SetActive(arg_3_0._glowEff, arg_3_0._progressInfo:GetCount() > 0)
	SetActive(arg_3_0._gizmosXue, arg_3_0._progressInfo:GetCount() > 0)
end

function var_0_1.updateProgressBar(arg_4_0)
	local var_4_0 = arg_4_0._progressInfo:GetCurrent() / arg_4_0._progressInfo:GetMax()

	arg_4_0._progressBar.fillAmount = var_4_0

	if arg_4_0._progressInfo.GetCount and arg_4_0._progressInfo:GetCount() > 0 then
		arg_4_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1
	else
		arg_4_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = var_4_0
	end
end
