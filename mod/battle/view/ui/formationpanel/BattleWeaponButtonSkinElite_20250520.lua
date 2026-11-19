ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20250520", var_0_0.Battle.BattleWeaponButtonSkinNormal_20250227)

var_0_0.Battle.BattleWeaponButtonSkinElite_20250520 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20250520"

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

function var_0_1.OnCountChange(arg_2_0)
	var_0_1.super.OnCountChange(arg_2_0)
	SetActive(arg_2_0._gizmos1, arg_2_0._progressInfo:GetCount() > 0)
end

function var_0_1.OnOverLoadChange(arg_3_0, arg_3_1)
	if arg_3_0._progressInfo:IsOverLoad() then
		arg_3_0._block:SetActive(true)
		arg_3_0:OnUnfill()
	else
		arg_3_0._block:SetActive(false)
		arg_3_0:OnFilled()
	end

	if arg_3_0._progressInfo:GetCount() >= 1 and arg_3_1 and arg_3_1.Data then
		local var_3_0 = arg_3_1.Data.preCast

		if var_3_0 then
			if var_3_0 == 0 then
				quickCheckAndPlayAnimator(arg_3_0._skin, "weapon_button_progress_filled")
			elseif var_3_0 > 0 then
				quickCheckAndPlayAnimator(arg_3_0._skin, "weapon_button_progress_charge")
			end
		end
	end

	if arg_3_1 and arg_3_1.Data and arg_3_1.Data.postCast then
		quickCheckAndPlayAnimator(arg_3_0._skin, "weapon_button_progress_use")
	end

	if arg_3_0._progressInfo:GetTotal() > 0 then
		arg_3_0:updateProgressBar()
	end
end

function var_0_1.SetToCombatUIPreview(arg_4_0, arg_4_1)
	local var_4_0 = CombatUIPreviewer.WeaponButtonPreviewMode

	switch(arg_4_1, {
		[var_4_0.UNFILLED] = function()
			SetActive(arg_4_0._unfill, true)
			SetActive(arg_4_0._filled, false)

			arg_4_0._progressBar.fillAmount = 0

			if arg_4_0._bgEff then
				arg_4_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 1
			end

			arg_4_0._countTxt.text = "0/0"

			if arg_4_0._gizmos1 then
				SetActive(arg_4_0._gizmos1, false)
				SetActive(arg_4_0._gizmosXue, false)
			end
		end,
		[var_4_0.FILLED] = function()
			SetActive(arg_4_0._filled, true)
			SetActive(arg_4_0._unfill, false)

			arg_4_0._progressBar.fillAmount = 1

			if arg_4_0._bgEff then
				arg_4_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 0
			end

			arg_4_0._countTxt.text = "1/1"

			if arg_4_0._gizmos1 then
				SetActive(arg_4_0._gizmos1, true)
				SetActive(arg_4_0._gizmosXue, true)
			end
		end,
		[var_4_0.LOOP] = function()
			arg_4_0:SetToCombatUIPreview(var_4_0.FILLED)
		end,
		[var_4_0.USABLE] = function()
			local var_8_0 = arg_4_0:GetProgressFaker(1)

			var_8_0.current = var_8_0.max
			var_8_0.count = 1
			arg_4_0._progressInfo = var_8_0

			arg_4_0:OnCountChange()
			arg_4_0:OnOverLoadChange()
		end
	})
end
