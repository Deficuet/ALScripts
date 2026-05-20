ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20260520", var_0_0.Battle.BattleWeaponButtonSkinElite_20250520)

var_0_0.Battle.BattleWeaponButtonSkinElite_20260520 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20260520"

local var_0_2 = 1

function var_0_1.ConfigSkin(arg_1_0, arg_1_1)
	var_0_1.super.ConfigSkin(arg_1_0, arg_1_1)

	arg_1_0._bgEffAni = arg_1_0._bgEff:GetComponent(typeof(Animator))

	local var_1_0 = arg_1_0._bgEffAni.runtimeAnimatorController.animationClips[0]

	arg_1_0._bgEffAniClipTotalFrames = math.max(1, math.floor(var_1_0.length * var_1_0.frameRate + 0.5))
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

function var_0_1.OnTotalChange(arg_5_0, arg_5_1)
	if arg_5_0._progressInfo:GetTotal() <= 0 then
		arg_5_0._block:SetActive(true)

		arg_5_0._progressBar.fillAmount = 0
		arg_5_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 0
		arg_5_0._text:GetComponent(typeof(Text)).text = "0/0"

		arg_5_0:SetControllerActive(false)
		SetActive(arg_5_0._glowEff, false)
		arg_5_0:OnUnfill()
		arg_5_0:OnUnSelect()
		SetActive(arg_5_0._gizmos1, false)
		SetActive(arg_5_0._gizmosXue, false)
	else
		arg_5_0:OnCountChange()
		arg_5_0:SetControllerActive(true)

		if arg_5_1 then
			local var_5_0 = arg_5_1.Data.index

			if var_5_0 and var_5_0 == 1 then
				arg_5_0:OnUnSelect()
			end
		end
	end
end

function var_0_1.OnCountChange(arg_6_0)
	var_0_1.super.OnCountChange(arg_6_0)
	SetActive(arg_6_0._gizmosXue, arg_6_0._progressInfo:GetCount() > 0)
	SetActive(arg_6_0._glowEff, arg_6_0._progressInfo:GetCount() > 0)
end

function var_0_1.StopCombatUIPreviewLoop(arg_7_0)
	if arg_7_0._skin then
		LeanTween.cancel(go(arg_7_0._skin))
	end
end

function var_0_1.ApplyCombatUIPreviewState(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = 2

	SetActive(arg_8_0._filled, not arg_8_3 and arg_8_1 > 0)
	SetActive(arg_8_0._unfill, arg_8_3 or arg_8_1 <= 0)
	SetActive(arg_8_0._unfillShade, arg_8_3 or arg_8_1 <= 0)

	arg_8_0._progressBar.fillAmount = arg_8_2
	arg_8_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = (arg_8_3 or arg_8_1 > 0) and 1 or 0
	arg_8_0._countTxt.text = arg_8_1 .. "/" .. var_8_0

	if arg_8_0._gizmos1 then
		SetActive(arg_8_0._gizmos1, arg_8_1 > 0)
		SetActive(arg_8_0._gizmosXue, arg_8_1 > 0)
	end

	SetActive(arg_8_0._glowEff, arg_8_1 > 0)

	arg_8_0._bgEffAni.enabled = true

	arg_8_0:updateProgressBG(arg_8_2, 5)
end

function var_0_1.StartCombatUIPreviewLoop(arg_9_0)
	local var_9_0 = go(arg_9_0._skin)

	local function var_9_1()
		arg_9_0:ApplyCombatUIPreviewState(0, 0, true)
		LeanTween.value(var_9_0, 0, 1, 5):setOnUpdate(System.Action_float(function(arg_11_0)
			arg_9_0:ApplyCombatUIPreviewState(0, arg_11_0, true)
		end)):setOnComplete(System.Action(function()
			arg_9_0:ApplyCombatUIPreviewState(2, 1, false)
			quickCheckAndPlayAnimator(arg_9_0._skin, "weapon_button_progress_filled")
			LeanTween.delayedCall(var_9_0, 3, System.Action(function()
				arg_9_0:ApplyCombatUIPreviewState(1, 1, false)
				quickCheckAndPlayAnimator(arg_9_0._skin, "weapon_button_progress_use")
				LeanTween.delayedCall(var_9_0, 3, System.Action(function()
					arg_9_0:ApplyCombatUIPreviewState(0, 0, false)
					quickCheckAndPlayAnimator(arg_9_0._skin, "weapon_button_progress_use")
					LeanTween.delayedCall(var_9_0, 3, System.Action(function()
						var_9_1()
					end))
				end))
			end))
		end))
	end

	var_9_1()
end

function var_0_1.SetToCombatUIPreview(arg_16_0, arg_16_1)
	arg_16_0:StopCombatUIPreviewLoop()

	local var_16_0 = CombatUIPreviewer.WeaponButtonPreviewMode

	if arg_16_1 == var_16_0.LOOP then
		arg_16_0:StartCombatUIPreviewLoop()

		return
	end

	if arg_16_1 ~= var_16_0.UNFILLED then
		arg_16_0:ApplyCombatUIPreviewState(2, 1, false)
		quickCheckAndPlayAnimator(arg_16_0._skin, "weapon_button_progress_filled")
	else
		arg_16_0:ApplyCombatUIPreviewState(0, 0, false)
	end
end

function var_0_1.updateProgressBar(arg_17_0)
	local var_17_0 = arg_17_0._progressInfo:GetCurrent() / arg_17_0._progressInfo:GetMax()

	arg_17_0._progressBar.fillAmount = var_17_0

	if arg_17_0._progressInfo.GetCount and arg_17_0._progressInfo:GetCount() > 0 then
		arg_17_0:updateProgressBG(1, arg_17_0._progressInfo:GetMax())
	else
		arg_17_0._bgEffAni.enabled = true

		arg_17_0:updateProgressBG(var_17_0, arg_17_0._progressInfo:GetMax())
	end
end

function var_0_1.updateProgressBG(arg_18_0, arg_18_1, arg_18_2)
	arg_18_1 = Mathf.Clamp01(arg_18_1)

	local var_18_0 = arg_18_0._bgEffAniClipTotalFrames - 1
	local var_18_1 = arg_18_1 * var_18_0
	local var_18_2

	if arg_18_2 and arg_18_2 > var_0_2 then
		local var_18_3 = math.floor(var_18_1)
		local var_18_4 = math.min(var_18_0, var_18_3 + 1)
		local var_18_5 = var_18_1 - var_18_3

		var_18_2 = (var_18_3 + (var_18_4 - var_18_3) * var_18_5) / var_18_0
	else
		var_18_2 = math.floor(var_18_1 + 0.5) / var_18_0
	end

	arg_18_0._bgEffAni.speed = 1

	arg_18_0._bgEffAni:Play("skinui_button_bg", 0, var_18_2)
	arg_18_0._bgEffAni:Update(0)

	arg_18_0._bgEffAni.speed = 0
end

function var_0_1.Dispose(arg_19_0)
	arg_19_0:StopCombatUIPreviewLoop()
	var_0_1.super.Dispose(arg_19_0)
end
