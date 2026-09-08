ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20260908", var_0_0.Battle.BattleWeaponButtonSkinElite_20251218)

var_0_0.Battle.BattleWeaponButtonSkinElite_20260908 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20260908"

function var_0_1.updateProgressBar(arg_1_0)
	local var_1_0 = arg_1_0._progressInfo:GetCurrent() / arg_1_0._progressInfo:GetMax()

	arg_1_0._progressBar.fillAmount = var_1_0

	if arg_1_0._progressInfo.GetCount and arg_1_0._progressInfo:GetCount() > 0 then
		arg_1_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1
	else
		arg_1_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = var_1_0
	end
end

return var_0_1
