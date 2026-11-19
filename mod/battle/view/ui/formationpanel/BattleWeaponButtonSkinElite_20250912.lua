ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20250912", var_0_0.Battle.BattleWeaponButtonSkinElite_20250520)

var_0_0.Battle.BattleWeaponButtonSkinElite_20250912 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20250912"

function var_0_1.SetToCombatUIPreview(arg_1_0, arg_1_1)
	local var_1_0 = CombatUIPreviewer.WeaponButtonPreviewMode

	switch(arg_1_1, {
		[var_1_0.UNFILLED] = function()
			SetActive(arg_1_0._unfill, true)
			SetActive(arg_1_0._filled, false)

			arg_1_0._progressBar.fillAmount = 0

			if arg_1_0._bgEff then
				arg_1_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 1
			end

			arg_1_0._countTxt.text = "0/0"

			if arg_1_0._gizmos1 then
				SetActive(arg_1_0._gizmos1, false)
				SetActive(arg_1_0._gizmosXue, false)
			end
		end,
		[var_1_0.FILLED] = function()
			SetActive(arg_1_0._filled, true)
			SetActive(arg_1_0._unfill, false)

			arg_1_0._progressBar.fillAmount = 1

			if arg_1_0._bgEff then
				arg_1_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 0
			end

			arg_1_0._countTxt.text = "1/1"

			if arg_1_0._gizmos1 then
				SetActive(arg_1_0._gizmos1, true)
				SetActive(arg_1_0._gizmosXue, true)
			end
		end,
		[var_1_0.LOOP] = function()
			arg_1_0:SetToCombatUIPreview(var_1_0.FILLED)
		end,
		[var_1_0.USABLE] = function()
			local var_5_0 = arg_1_0:GetProgressFaker(1)

			var_5_0.current = var_5_0.max
			var_5_0.count = 1
			arg_1_0._progressInfo = var_5_0

			arg_1_0:OnCountChange()
			arg_1_0:OnOverLoadChange()
		end
	})
end
