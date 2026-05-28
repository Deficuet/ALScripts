ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleSubmarineFuncButtonSkinElite_20260520", var_0_0.Battle.BattleSubmarineFuncButton)

var_0_0.Battle.BattleSubmarineFuncButtonSkinElite_20260520 = var_0_1
var_0_1.__name = "BattleSubmarineFuncButtonSkinElite_20260520"

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

function var_0_1.updateProgressBar(arg_5_0)
	local var_5_0 = arg_5_0._progressInfo:GetCurrent() / arg_5_0._progressInfo:GetMax()

	arg_5_0._progressBar.fillAmount = var_5_0

	if arg_5_0._progressInfo.GetCount and arg_5_0._progressInfo:GetCount() > 0 then
		arg_5_0:updateProgressBG(1, arg_5_0._progressInfo:GetMax())
	else
		arg_5_0._bgEffAni.enabled = true

		arg_5_0:updateProgressBG(var_5_0, arg_5_0._progressInfo:GetMax())
	end
end

function var_0_1.updateProgressBG(arg_6_0, arg_6_1, arg_6_2)
	arg_6_1 = Mathf.Clamp01(arg_6_1)

	local var_6_0 = arg_6_0._bgEffAniClipTotalFrames - 1
	local var_6_1 = arg_6_1 * var_6_0
	local var_6_2

	if arg_6_2 and arg_6_2 > var_0_2 then
		local var_6_3 = math.floor(var_6_1)
		local var_6_4 = math.min(var_6_0, var_6_3 + 1)
		local var_6_5 = var_6_1 - var_6_3

		var_6_2 = (var_6_3 + (var_6_4 - var_6_3) * var_6_5) / var_6_0
	else
		var_6_2 = math.floor(var_6_1 + 0.5) / var_6_0
	end

	arg_6_0._bgEffAni.speed = 1

	arg_6_0._bgEffAni:Play("skinui_button_bg", 0, var_6_2)
	arg_6_0._bgEffAni:Update(0)

	arg_6_0._bgEffAni.speed = 0
end
