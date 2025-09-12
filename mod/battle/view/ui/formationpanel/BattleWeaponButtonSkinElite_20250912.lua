ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20250912", var_0_0.Battle.BattleWeaponButtonSkinNormal_20250227)

var_0_0.Battle.BattleWeaponButtonSkinElite_20250912 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20250912"

function var_0_1.OnTotalChange(arg_1_0, arg_1_1)
	if arg_1_0._progressInfo:GetTotal() <= 0 then
		arg_1_0._block:SetActive(true)

		arg_1_0._progressBar.fillAmount = 0
		arg_1_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1
		arg_1_0._text:GetComponent(typeof(Text)).text = "0/0"

		arg_1_0:SetControllerActive(false)
		SetActive(arg_1_0._glowEff, false)
		arg_1_0:OnUnfill()
		arg_1_0:OnUnSelect()
	else
		if arg_1_0._progressInfo:GetTotal() == arg_1_0._progressInfo:GetCount() then
			SetActive(arg_1_0._glowEff, true)
		end

		arg_1_0:OnCountChange()
		arg_1_0:SetControllerActive(true)

		if arg_1_1 then
			local var_1_0 = arg_1_1.Data.index

			if var_1_0 and var_1_0 == 1 then
				arg_1_0:OnUnSelect()
			end
		end
	end
end

function var_0_1.ConfigSkin(arg_2_0, arg_2_1)
	var_0_1.super.ConfigSkin(arg_2_0, arg_2_1)

	arg_2_0._glowEff = arg_2_0._btn:Find("gizmos_1")
end

function var_0_1.OnCountChange(arg_3_0)
	var_0_1.super.OnCountChange(arg_3_0)
	SetActive(arg_3_0._glowEff, arg_3_0._progressInfo:GetCount() > 0)
end

function var_0_1.OnOverLoadChange(arg_4_0, arg_4_1)
	if arg_4_0._progressInfo:IsOverLoad() then
		arg_4_0._block:SetActive(true)
		arg_4_0:OnUnfill()
	else
		arg_4_0._block:SetActive(false)
		arg_4_0:OnFilled()
	end

	if arg_4_0._progressInfo:GetCount() >= 1 and arg_4_1 and arg_4_1.Data then
		local var_4_0 = arg_4_1.Data.preCast

		if var_4_0 then
			if var_4_0 == 0 then
				quickCheckAndPlayAnimator(arg_4_0._skin, "weapon_button_progress_filled")
			elseif var_4_0 > 0 then
				quickCheckAndPlayAnimator(arg_4_0._skin, "weapon_button_progress_charge")
			end
		end
	end

	if arg_4_1 and arg_4_1.Data and arg_4_1.Data.postCast then
		quickCheckAndPlayAnimator(arg_4_0._skin, "weapon_button_progress_use")
	end

	if arg_4_0._progressInfo:GetTotal() > 0 then
		arg_4_0:updateProgressBar()
	end
end
