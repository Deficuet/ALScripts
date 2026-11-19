ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20260908", var_0_0.Battle.BattleWeaponButtonSkinElite_20251218)

var_0_0.Battle.BattleWeaponButtonSkinElite_20260908 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20260908"

function var_0_1.ConfigSkin(arg_1_0, arg_1_1)
	arg_1_0._skin = arg_1_1
	arg_1_0._btn = arg_1_1:Find("ActCtl")
	arg_1_0._block = arg_1_1:Find("ActCtl/block").gameObject
	arg_1_0._progress = arg_1_1:Find("ActCtl/skill_progress")
	arg_1_0._progressBar = arg_1_0._progress:GetComponent(typeof(Image))
	arg_1_0._icon = arg_1_1:Find("ActCtl/skill_icon")
	arg_1_0._filled = arg_1_0._icon:Find("filled")
	arg_1_0._unfill = arg_1_0._icon:Find("unfill")
	arg_1_0._count = arg_1_1:Find("ActCtl/Count")
	arg_1_0._text = arg_1_0._count:Find("CountText")
	arg_1_0._selected = arg_1_1:Find("ActCtl/selected")
	arg_1_0._unSelect = arg_1_1:Find("ActCtl/unselect")
	arg_1_0._filledEffect = arg_1_1:Find("ActCtl/filledEffect")
	arg_1_0._jam = arg_1_1:Find("ActCtl/jam")
	arg_1_0._countTxt = arg_1_0._text:GetComponent(typeof(Text))

	arg_1_1.gameObject:SetActive(true)
	arg_1_0._block:SetActive(false)
	arg_1_0._progress.gameObject:SetActive(true)

	local var_1_0 = arg_1_0._filledEffect.gameObject

	var_1_0:SetActive(false)
	var_1_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_2_0)
		SetActive(arg_1_0._filledEffect, false)
	end)

	arg_1_0._animtor = arg_1_1:GetComponent(typeof(Animator))
	arg_1_0._bgEff = arg_1_1:Find("ActCtl/bg_eff")
	arg_1_0._gizmos1 = arg_1_1:Find("ActCtl/gizmos_1")
	arg_1_0._gizmosXue = arg_1_1:Find("ActCtl/gizmos_xue")
end

function var_0_1.OnTotalChange(arg_3_0, arg_3_1)
	if arg_3_0._progressInfo:GetTotal() <= 0 then
		arg_3_0._block:SetActive(true)

		arg_3_0._progressBar.fillAmount = 0

		if arg_3_0._bgEff then
			arg_3_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 0
		end

		arg_3_0._text:GetComponent(typeof(Text)).text = "0/0"

		arg_3_0:SetControllerActive(false)
		arg_3_0:OnUnfill()
		arg_3_0:OnUnSelect()
	else
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

function var_0_1.updateProgressBar(arg_4_0)
	local var_4_0 = arg_4_0._progressInfo:GetCurrent() / arg_4_0._progressInfo:GetMax()

	arg_4_0._progressBar.fillAmount = var_4_0

	if arg_4_0._progressInfo.GetCount and arg_4_0._progressInfo:GetCount() > 0 then
		arg_4_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1
	else
		arg_4_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = var_4_0
	end
end

return var_0_1
