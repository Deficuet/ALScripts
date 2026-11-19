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

function var_0_1.ApplyCombatUIPreviewState(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = #arg_7_0.PREVIEW_LOOP_CONFIG.chargeDurations

	SetActive(arg_7_0._filled, not arg_7_3 and arg_7_1 > 0)
	SetActive(arg_7_0._unfill, arg_7_3 or arg_7_1 <= 0)
	SetActive(arg_7_0._unfillShade, arg_7_3 or arg_7_1 <= 0)

	arg_7_0._progressBar.fillAmount = arg_7_2
	arg_7_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = (arg_7_3 or arg_7_1 > 0) and 1 or 0
	arg_7_0._countTxt.text = arg_7_1 .. "/" .. var_7_0

	if arg_7_0._gizmos1 then
		SetActive(arg_7_0._gizmos1, arg_7_1 > 0)
		SetActive(arg_7_0._gizmosXue, arg_7_1 > 0)
	end

	SetActive(arg_7_0._glowEff, arg_7_1 > 0)

	arg_7_0._bgEffAni.enabled = true

	arg_7_0:updateProgressBG(arg_7_2, 5)
end

function var_0_1.updateProgressBar(arg_8_0)
	local var_8_0 = arg_8_0._progressInfo:GetCurrent() / arg_8_0._progressInfo:GetMax()

	arg_8_0._progressBar.fillAmount = var_8_0

	if arg_8_0._progressInfo.GetCount and arg_8_0._progressInfo:GetCount() > 0 then
		arg_8_0:updateProgressBG(1, arg_8_0._progressInfo:GetMax())
	else
		arg_8_0._bgEffAni.enabled = true

		arg_8_0:updateProgressBG(var_8_0, arg_8_0._progressInfo:GetMax())
	end
end

function var_0_1.updateProgressBG(arg_9_0, arg_9_1, arg_9_2)
	arg_9_1 = Mathf.Clamp01(arg_9_1)

	local var_9_0 = arg_9_0._bgEffAniClipTotalFrames - 1
	local var_9_1 = arg_9_1 * var_9_0
	local var_9_2

	if arg_9_2 and arg_9_2 > var_0_2 then
		local var_9_3 = math.floor(var_9_1)
		local var_9_4 = math.min(var_9_0, var_9_3 + 1)
		local var_9_5 = var_9_1 - var_9_3

		var_9_2 = (var_9_3 + (var_9_4 - var_9_3) * var_9_5) / var_9_0
	else
		var_9_2 = math.floor(var_9_1 + 0.5) / var_9_0
	end

	arg_9_0._bgEffAni.speed = 1

	arg_9_0._bgEffAni:Play("skinui_button_bg", 0, var_9_2)
	arg_9_0._bgEffAni:Update(0)

	arg_9_0._bgEffAni.speed = 0
end
