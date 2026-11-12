ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20261112", var_0_0.Battle.BattleWeaponButton)

var_0_0.Battle.BattleWeaponButtonSkinElite_20261112 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20261112"

function var_0_1.ConfigSkin(arg_1_0, arg_1_1)
	var_0_1.super.ConfigSkin(arg_1_0, arg_1_1)

	arg_1_0._glowEff = arg_1_0._filled:Find("gizmos")
end

function var_0_1.SetToCombatUIPreview(arg_2_0, arg_2_1)
	if arg_2_1 ~= CombatUIPreviewer.WeaponButtonPreviewMode.UNFILLED then
		SetActive(arg_2_0._filled, true)
		SetActive(arg_2_0._unfill, false)

		arg_2_0._progressBar.fillAmount = 1

		if arg_2_0._bgEff then
			arg_2_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 1
		end

		arg_2_0._countTxt.text = "1/1"

		if arg_2_0._gizmos1 then
			SetActive(arg_2_0._gizmos1, true)
			SetActive(arg_2_0._gizmosXue, true)
		end
	else
		SetActive(arg_2_0._unfill, true)
		SetActive(arg_2_0._filled, false)

		arg_2_0._progressBar.fillAmount = 0

		if arg_2_0._bgEff then
			arg_2_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 0
		end

		arg_2_0._countTxt.text = "0/0"

		if arg_2_0._gizmos1 then
			SetActive(arg_2_0._gizmos1, false)
			SetActive(arg_2_0._gizmosXue, false)
		end
	end
end

function var_0_1.OnTotalChange(arg_3_0, arg_3_1)
	if arg_3_0._progressInfo:GetTotal() <= 0 then
		arg_3_0._block:SetActive(true)

		arg_3_0._progressBar.fillAmount = 0
		arg_3_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 0
		arg_3_0._text:GetComponent(typeof(Text)).text = "0/0"

		arg_3_0:SetControllerActive(false)
		arg_3_0:OnUnfill()
		arg_3_0:OnUnSelect()
	else
		if arg_3_0._progressInfo:GetTotal() == arg_3_0._progressInfo:GetCount() then
			SetActive(arg_3_0._glowEff, true)
		end

		arg_3_0:OnCountChange()
		arg_3_0:SetControllerActive(true)

		if arg_3_1 then
			local var_3_0 = arg_3_1.Data.index

			if var_3_0 and var_3_0 == 1 then
				arg_3_0:OnUnSelect()
			end
		end
	end
end

function var_0_1.OnFilled(arg_4_0)
	SetActive(arg_4_0._filled, true)
	SetActive(arg_4_0._unfill, false)
	SetActive(arg_4_0._gizmos1, true)
	SetActive(arg_4_0._gizmosXue, true)
end

function var_0_1.OnUnfill(arg_5_0)
	SetActive(arg_5_0._filled, false)
	SetActive(arg_5_0._unfill, true)
	SetActive(arg_5_0._gizmos1, false)
	SetActive(arg_5_0._gizmosXue, false)
end

function var_0_1.OnCountChange(arg_6_0)
	var_0_1.super.OnCountChange(arg_6_0)
	SetActive(arg_6_0._gizmosXue, arg_6_0._progressInfo:GetTotal() > 0 and arg_6_0._progressInfo:GetCount() > 0)
end

function var_0_1.OnOverLoadChange(arg_7_0, arg_7_1)
	if arg_7_0._progressInfo:IsOverLoad() then
		arg_7_0._block:SetActive(true)
		arg_7_0:OnUnfill()
	else
		arg_7_0._block:SetActive(false)
		arg_7_0:OnFilled()
	end

	if arg_7_0._progressInfo:GetCount() >= 1 and arg_7_1 and arg_7_1.Data then
		local var_7_0 = arg_7_1.Data.preCast

		if var_7_0 then
			if var_7_0 == 0 then
				quickCheckAndPlayAnimator(arg_7_0._skin, "weapon_button_progress_filled")
			elseif var_7_0 > 0 then
				quickCheckAndPlayAnimator(arg_7_0._skin, "weapon_button_progress_charge")
			end
		end
	end

	if arg_7_1 and arg_7_1.Data and arg_7_1.Data.postCast then
		quickCheckAndPlayAnimator(arg_7_0._skin, "weapon_button_progress_use")
	end

	if arg_7_0._progressInfo:GetTotal() > 0 then
		arg_7_0:updateProgressBar()
	end
end

function var_0_1.updateProgressBar(arg_8_0)
	local var_8_0 = arg_8_0._progressInfo:GetCurrent() / arg_8_0._progressInfo:GetMax()

	arg_8_0._progressBar.fillAmount = var_8_0

	if arg_8_0._progressInfo.GetCount and arg_8_0._progressInfo:GetCount() > 0 then
		arg_8_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1
	else
		arg_8_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = var_8_0
	end
end

return var_0_1
