ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20261112", var_0_0.Battle.BattleWeaponButton)

var_0_0.Battle.BattleWeaponButtonSkinElite_20261112 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20261112"

function var_0_1.ConfigSkin(arg_1_0, arg_1_1)
	var_0_1.super.ConfigSkin(arg_1_0, arg_1_1)

	arg_1_0._glowEff = arg_1_0._filled:Find("gizmos")
end

function var_0_1.OnTotalChange(arg_2_0, arg_2_1)
	if arg_2_0._progressInfo:GetTotal() <= 0 then
		arg_2_0._block:SetActive(true)

		arg_2_0._progressBar.fillAmount = 0
		arg_2_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 0
		arg_2_0._text:GetComponent(typeof(Text)).text = "0/0"

		arg_2_0:SetControllerActive(false)
		arg_2_0:OnUnfill()
		arg_2_0:OnUnSelect()
	else
		if arg_2_0._progressInfo:GetTotal() == arg_2_0._progressInfo:GetCount() then
			SetActive(arg_2_0._glowEff, true)
		end

		arg_2_0:OnCountChange()
		arg_2_0:SetControllerActive(true)

		if arg_2_1 then
			local var_2_0 = arg_2_1.Data.index

			if var_2_0 and var_2_0 == 1 then
				arg_2_0:OnUnSelect()
			end
		end
	end
end

function var_0_1.OnFilled(arg_3_0)
	SetActive(arg_3_0._filled, true)
	SetActive(arg_3_0._unfill, false)
	SetActive(arg_3_0._gizmos1, true)
	SetActive(arg_3_0._gizmosXue, true)
end

function var_0_1.OnUnfill(arg_4_0)
	SetActive(arg_4_0._filled, false)
	SetActive(arg_4_0._unfill, true)
	SetActive(arg_4_0._gizmos1, false)
	SetActive(arg_4_0._gizmosXue, false)
end

function var_0_1.OnCountChange(arg_5_0)
	var_0_1.super.OnCountChange(arg_5_0)
	SetActive(arg_5_0._gizmosXue, arg_5_0._progressInfo:GetTotal() > 0 and arg_5_0._progressInfo:GetCount() > 0)
end

function var_0_1.OnOverLoadChange(arg_6_0, arg_6_1)
	if arg_6_0._progressInfo:IsOverLoad() then
		arg_6_0._block:SetActive(true)
		arg_6_0:OnUnfill()
	else
		arg_6_0._block:SetActive(false)
		arg_6_0:OnFilled()
	end

	if arg_6_0._progressInfo:GetCount() >= 1 and arg_6_1 and arg_6_1.Data then
		local var_6_0 = arg_6_1.Data.preCast

		if var_6_0 then
			if var_6_0 == 0 then
				quickCheckAndPlayAnimator(arg_6_0._skin, "weapon_button_progress_filled")
			elseif var_6_0 > 0 then
				quickCheckAndPlayAnimator(arg_6_0._skin, "weapon_button_progress_charge")
			end
		end
	end

	if arg_6_1 and arg_6_1.Data and arg_6_1.Data.postCast then
		quickCheckAndPlayAnimator(arg_6_0._skin, "weapon_button_progress_use")
	end

	if arg_6_0._progressInfo:GetTotal() > 0 then
		arg_6_0:updateProgressBar()
	end
end

function var_0_1.updateProgressBar(arg_7_0)
	local var_7_0 = arg_7_0._progressInfo:GetCurrent() / arg_7_0._progressInfo:GetMax()

	arg_7_0._progressBar.fillAmount = var_7_0

	if arg_7_0._progressInfo.GetCount and arg_7_0._progressInfo:GetCount() > 0 then
		arg_7_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1
	else
		arg_7_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = var_7_0
	end
end

return var_0_1
