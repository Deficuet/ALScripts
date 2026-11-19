ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButton")

var_0_0.Battle.BattleWeaponButton = var_0_1
var_0_1.__name = "BattleWeaponButton"
var_0_1.ICON_BY_INDEX = {
	"cannon",
	"torpedo",
	"aircraft",
	"submarine",
	"dive",
	"rise",
	"boost",
	"switch",
	"special",
	"aamissile",
	"meteor",
	"pointairstrike"
}

function var_0_1.Ctor(arg_1_0)
	var_0_0.EventListener.AttachEventListener(arg_1_0)

	arg_1_0.eventTriggers = {}
end

function var_0_1.ConfigCallback(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0._downFunc = arg_2_1
	arg_2_0._upFunc = arg_2_2
	arg_2_0._cancelFunc = arg_2_3
	arg_2_0._emptyFunc = arg_2_4
end

function var_0_1.SetActive(arg_3_0, arg_3_1)
	SetActive(arg_3_0._skin, arg_3_1)
end

function var_0_1.SetJam(arg_4_0, arg_4_1)
	SetActive(arg_4_0._jam, arg_4_1)
	SetActive(arg_4_0._icon, not arg_4_1)
	SetActive(arg_4_0._progress, not arg_4_1)
end

function var_0_1.SwitchIcon(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._iconIndex = arg_5_1

	local var_5_0 = var_0_1.ICON_BY_INDEX[arg_5_1]
	local var_5_1 = arg_5_2 or var_0_0.Battle.BattleState.GetCombatSkinKey()

	if var_5_1 ~= "Standard" then
		var_5_1 = ""
	end

	setImageSprite(arg_5_0._unfill, LoadSprite("ui/CombatUI" .. var_5_1 .. "_atlas", "weapon_unfill_" .. var_5_0))
	setImageSprite(arg_5_0._filled, LoadSprite("ui/CombatUI" .. var_5_1 .. "_atlas", "filled_combined_" .. var_5_0))

	return var_5_1, var_5_0
end

function var_0_1.SwitchIconEffect(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = var_0_1.ICON_BY_INDEX[arg_6_1]
	local var_6_1 = arg_6_2 or var_0_0.Battle.BattleState.GetCombatSkinKey()

	if var_6_1 ~= "Standard" then
		var_6_1 = ""
	end

	setImageSprite(arg_6_0._filledEffect, LoadSprite("ui/CombatUI" .. var_6_1 .. "_atlas", "filled_effect_" .. var_6_0), true)
	setImageSprite(arg_6_0._jam, LoadSprite("ui/CombatUI" .. var_6_1 .. "_atlas", "skill_jam_" .. var_6_0), true)
end

function var_0_1.ConfigSkin(arg_7_0, arg_7_1)
	arg_7_0._skin = arg_7_1
	arg_7_0._btn = arg_7_1:Find("ActCtl")
	arg_7_0._block = arg_7_1:Find("ActCtl/block").gameObject
	arg_7_0._progress = arg_7_1:Find("ActCtl/skill_progress")
	arg_7_0._progressBar = arg_7_0._progress:GetComponent(typeof(Image))
	arg_7_0._icon = arg_7_1:Find("ActCtl/skill_icon")
	arg_7_0._filled = arg_7_0._icon:Find("filled")
	arg_7_0._unfill = arg_7_0._icon:Find("unfill")
	arg_7_0._count = arg_7_1:Find("ActCtl/Count")
	arg_7_0._text = arg_7_0._count:Find("CountText")
	arg_7_0._selected = arg_7_1:Find("ActCtl/selected")
	arg_7_0._unSelect = arg_7_1:Find("ActCtl/unselect")
	arg_7_0._filledEffect = arg_7_1:Find("ActCtl/filledEffect")
	arg_7_0._jam = arg_7_1:Find("ActCtl/jam")
	arg_7_0._countTxt = arg_7_0._text:GetComponent(typeof(Text))

	arg_7_1.gameObject:SetActive(true)
	arg_7_0._block:SetActive(false)
	arg_7_0._progress.gameObject:SetActive(true)

	local var_7_0 = arg_7_0._filledEffect.gameObject

	var_7_0:SetActive(false)
	var_7_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_8_0)
		SetActive(arg_7_0._filledEffect, false)
	end)

	arg_7_0._animtor = arg_7_1:GetComponent(typeof(Animator))
	arg_7_0._bgEff = arg_7_1:Find("ActCtl/bg_eff")
	arg_7_0._gizmos1 = arg_7_1:Find("ActCtl/gizmos_1")
	arg_7_0._gizmosXue = arg_7_1:Find("ActCtl/gizmos_xue")
end

function var_0_1.GetSkin(arg_9_0)
	return arg_9_0._skin
end

function var_0_1.Enabled(arg_10_0, arg_10_1)
	local var_10_0 = GetComponent(arg_10_0._btn, "EventTriggerListener")
	local var_10_1 = GetComponent(arg_10_0._block, "EventTriggerListener")

	arg_10_0.eventTriggers[var_10_0] = true
	arg_10_0.eventTriggers[var_10_1] = true
	var_10_0.enabled = arg_10_1
	var_10_1.enabled = arg_10_1
end

function var_0_1.Disable(arg_11_0)
	if arg_11_0._cancelFunc then
		arg_11_0._cancelFunc()
	end

	arg_11_0:OnUnSelect()

	local var_11_0 = GetComponent(arg_11_0._btn, "EventTriggerListener")
	local var_11_1 = GetComponent(arg_11_0._block, "EventTriggerListener")

	var_11_0.enabled = false
	var_11_1.enabled = false
end

function var_0_1.OnSelected(arg_12_0)
	SetActive(arg_12_0._unSelect, false)
	SetActive(arg_12_0._selected, true)
end

function var_0_1.OnUnSelect(arg_13_0)
	SetActive(arg_13_0._selected, false)
	SetActive(arg_13_0._unSelect, true)
end

function var_0_1.OnFilled(arg_14_0)
	SetActive(arg_14_0._filled, true)
	SetActive(arg_14_0._unfill, false)
end

function var_0_1.OnUnfill(arg_15_0)
	SetActive(arg_15_0._filled, false)
	SetActive(arg_15_0._unfill, true)
end

function var_0_1.OnfilledEffect(arg_16_0)
	SetActive(arg_16_0._filledEffect, true)
end

function var_0_1.OnOverLoadChange(arg_17_0, arg_17_1)
	if arg_17_0._progressInfo:IsOverLoad() then
		arg_17_0._block:SetActive(true)
		arg_17_0:OnUnfill()
	else
		arg_17_0._block:SetActive(false)
		arg_17_0:OnFilled()

		if arg_17_1 and arg_17_1.Data then
			local var_17_0 = arg_17_1.Data.preCast

			if var_17_0 then
				if var_17_0 == 0 then
					quickCheckAndPlayAnimator(arg_17_0._skin, "weapon_button_progress_filled")
				elseif var_17_0 > 0 then
					quickCheckAndPlayAnimator(arg_17_0._skin, "weapon_button_progress_charge")
				end
			end
		end
	end

	if arg_17_1 and arg_17_1.Data and arg_17_1.Data.postCast then
		quickCheckAndPlayAnimator(arg_17_0._skin, "weapon_button_progress_use")
	end

	if arg_17_0._progressInfo:GetTotal() > 0 then
		arg_17_0:updateProgressBar()
	end
end

function var_0_1.SetProgressActive(arg_18_0, arg_18_1)
	arg_18_0._progress.gameObject:SetActive(arg_18_1)
end

function var_0_1.SetTextActive(arg_19_0, arg_19_1)
	SetActive(arg_19_0._count, arg_19_1)
end

function var_0_1.SetProgressInfo(arg_20_0, arg_20_1)
	arg_20_0._progressInfo = arg_20_1

	arg_20_0._progressInfo:RegisterEventListener(arg_20_0, var_0_0.Battle.BattleEvent.WEAPON_TOTAL_CHANGE, arg_20_0.OnTotalChange)
	arg_20_0._progressInfo:RegisterEventListener(arg_20_0, var_0_0.Battle.BattleEvent.WEAPON_COUNT_PLUS, arg_20_0.OnfilledEffect)
	arg_20_0._progressInfo:RegisterEventListener(arg_20_0, var_0_0.Battle.BattleEvent.OVER_LOAD_CHANGE, arg_20_0.OnOverLoadChange)
	arg_20_0._progressInfo:RegisterEventListener(arg_20_0, var_0_0.Battle.BattleEvent.COUNT_CHANGE, arg_20_0.OnCountChange)
	arg_20_0:OnTotalChange()
	arg_20_0:OnOverLoadChange()
end

function var_0_1.OnCountChange(arg_21_0)
	local var_21_0 = arg_21_0._progressInfo:GetCount()
	local var_21_1 = arg_21_0._progressInfo:GetTotal()

	arg_21_0._countTxt.text = string.format("%d/%d", var_21_0, var_21_1)

	local var_21_2 = arg_21_0._progressInfo:GetCurrentWeaponIconIndex()

	if var_21_2 ~= arg_21_0._iconIndex then
		arg_21_0:SwitchIcon(var_21_2)
		arg_21_0:SwitchIconEffect(var_21_2)
	end

	if arg_21_0._gizmos1 then
		SetActive(arg_21_0._gizmos1, var_21_0 > 0)
		SetActive(arg_21_0._gizmosXue, var_21_0 == var_21_1)
	end
end

function var_0_1.OnTotalChange(arg_22_0, arg_22_1)
	if arg_22_0._progressInfo:GetTotal() <= 0 then
		arg_22_0._block:SetActive(true)

		arg_22_0._progressBar.fillAmount = 0

		if arg_22_0._bgEff then
			arg_22_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 0
		end

		arg_22_0._text:GetComponent(typeof(Text)).text = "0/0"

		arg_22_0:SetControllerActive(false)
		arg_22_0:OnUnfill()
		arg_22_0:OnUnSelect()
	else
		arg_22_0:OnCountChange()
		arg_22_0:SetControllerActive(true)

		if arg_22_1 then
			local var_22_0 = arg_22_1.Data.index

			if var_22_0 and var_22_0 == 1 then
				arg_22_0:OnUnSelect()
			end
		end
	end
end

function var_0_1.SetControllerActive(arg_23_0, arg_23_1)
	if arg_23_0._isActive == arg_23_1 then
		return
	end

	arg_23_0._isActive = arg_23_1

	local var_23_0 = GetComponent(arg_23_0._btn, "EventTriggerListener")
	local var_23_1 = GetComponent(arg_23_0._block, "EventTriggerListener")

	if arg_23_1 then
		local var_23_2

		if arg_23_0._downFunc ~= nil then
			var_23_0:AddPointDownFunc(function()
				var_23_2 = true

				arg_23_0._downFunc()
				arg_23_0:OnSelected()
			end)
		end

		if arg_23_0._upFunc ~= nil then
			var_23_0:AddPointUpFunc(function()
				if var_23_2 then
					var_23_2 = false

					arg_23_0._upFunc()
					arg_23_0:OnUnSelect()
				end
			end)
		end

		if arg_23_0._cancelFunc ~= nil then
			var_23_0:AddPointExitFunc(function()
				if var_23_2 then
					var_23_2 = false

					arg_23_0._cancelFunc()
					arg_23_0:OnUnSelect()
				end
			end)
		end

		var_23_1:RemovePointDownFunc()
	else
		var_23_1:AddPointDownFunc(arg_23_0._emptyFunc)
		var_23_0:RemovePointDownFunc()
		var_23_0:RemovePointUpFunc()
		var_23_0:RemovePointExitFunc()
	end
end

function var_0_1.InitialAnima(arg_27_0, arg_27_1)
	SetActive(arg_27_0._btn, false)

	arg_27_0._leanID = LeanTween.delayedCall(arg_27_1, System.Action(function()
		arg_27_0._skin:GetComponent("Animator").enabled = true
		arg_27_0._leanID = nil
	end))
end

function var_0_1.Update(arg_29_0)
	local var_29_0 = arg_29_0._progressInfo:GetCurrent()
	local var_29_1 = arg_29_0._progressInfo:GetMax()

	if arg_29_0._progressInfo:GetTotal() > 0 and var_29_0 < var_29_1 then
		arg_29_0:updateProgressBar()
	end
end

function var_0_1.SetToCombatUIPreview(arg_30_0, arg_30_1)
	local var_30_0 = CombatUIPreviewer.WeaponButtonPreviewMode

	switch(arg_30_1, {
		[var_30_0.UNFILLED] = function()
			SetActive(arg_30_0._unfill, true)
			SetActive(arg_30_0._filled, false)

			arg_30_0._progressBar.fillAmount = 0

			if arg_30_0._bgEff then
				arg_30_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 0
			end

			arg_30_0._countTxt.text = "0/0"

			if arg_30_0._gizmos1 then
				SetActive(arg_30_0._gizmos1, false)
				SetActive(arg_30_0._gizmosXue, false)
			end
		end,
		[var_30_0.FILLED] = function()
			SetActive(arg_30_0._filled, true)
			SetActive(arg_30_0._unfill, false)

			arg_30_0._progressBar.fillAmount = 1

			if arg_30_0._bgEff then
				arg_30_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 1
			end

			arg_30_0._countTxt.text = "1/1"

			if arg_30_0._gizmos1 then
				SetActive(arg_30_0._gizmos1, true)
				SetActive(arg_30_0._gizmosXue, true)
			end
		end,
		[var_30_0.LOOP] = function()
			arg_30_0:SetToCombatUIPreview(var_30_0.FILLED)
		end,
		[var_30_0.USABLE] = function()
			local var_34_0 = arg_30_0:GetProgressFaker(1)

			var_34_0.current = var_34_0.max
			var_34_0.count = 1
			arg_30_0._progressInfo = var_34_0

			arg_30_0:OnCountChange()
			arg_30_0:OnOverLoadChange()
		end
	})
end

var_0_1.PREVIEW_LOOP_CONFIG = {
	useInterval = 1.5,
	usableDuration = 2,
	restartDelay = 1.5,
	chargeDurations = {
		4,
		2
	}
}

local var_0_2 = 0.033
local var_0_3 = {
	USE = 3,
	USABLE = 2,
	CHARGE = 1
}

function var_0_1.getPreviewGCD(arg_35_0)
	local var_35_0 = arg_35_0.PREVIEW_LOOP_CONFIG

	if var_35_0.gcd then
		return var_35_0.gcd
	end

	local var_35_1 = var_0_0.Battle.BattleConfig

	return ({
		var_35_1.ChargeWeaponConfig.GCD,
		var_35_1.TorpedoCFG.GCD,
		var_35_1.AirAssistCFG.GCD
	})[arg_35_0._iconIndex] or var_35_1.TorpedoCFG.GCD
end

function var_0_1.GetProgressFaker(arg_36_0, arg_36_1)
	local var_36_0 = {
		current = 0,
		count = 0,
		max = 1,
		total = arg_36_1 or 1
	}

	function var_36_0.GetCurrent()
		return var_36_0.current
	end

	function var_36_0.GetMax()
		return var_36_0.max
	end

	function var_36_0.GetCount()
		return var_36_0.count
	end

	function var_36_0.GetTotal()
		return var_36_0.total
	end

	function var_36_0.IsOverLoad()
		return var_36_0.current < var_36_0.max or var_36_0.count < 1
	end

	function var_36_0.GetCurrentWeaponIconIndex()
		return arg_36_0._iconIndex
	end

	function var_36_0.RegisterEventListener()
		return
	end

	function var_36_0.UnregisterEventListener()
		return
	end

	return var_36_0
end

function var_0_1.StartCombatUIPreviewLoop(arg_45_0)
	local var_45_0 = arg_45_0.PREVIEW_LOOP_CONFIG
	local var_45_1 = arg_45_0:GetProgressFaker(#var_45_0.chargeDurations)

	arg_45_0._progressInfo = var_45_1
	arg_45_0._previewProgress = var_45_1

	arg_45_0:enterCombatUIPreviewStep(var_0_3.CHARGE)
end

function var_0_1.StopCombatUIPreviewLoop(arg_46_0)
	arg_46_0._previewStep = nil
	arg_46_0._previewElapsed = nil
	arg_46_0._previewProgress = nil
end

function var_0_1.previewPlus(arg_47_0)
	local var_47_0 = arg_47_0._previewProgress
	local var_47_1 = var_47_0.count

	var_47_0.count = var_47_0.count + 1
	var_47_0.current = 1
	var_47_0.max = 1

	arg_47_0:OnCountChange()
	arg_47_0:OnfilledEffect()
	arg_47_0:OnOverLoadChange({
		Data = {
			preCast = var_47_1
		}
	})
end

function var_0_1.previewDeduct(arg_48_0)
	local var_48_0 = arg_48_0._previewProgress

	var_48_0.count = math.max(var_48_0.count - 1, 0)

	if var_48_0.count > 0 then
		var_48_0.max = arg_48_0:getPreviewGCD()
	end

	var_48_0.current = 0

	arg_48_0:OnCountChange()
	arg_48_0:OnOverLoadChange({
		Data = {
			postCast = true
		}
	})
end

function var_0_1.updatePreviewGCD(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_0._previewProgress

	if var_49_0.count <= 0 or var_49_0.current >= var_49_0.max then
		return
	end

	var_49_0.current = var_49_0.current + arg_49_1

	if var_49_0.current >= var_49_0.max then
		var_49_0.current = var_49_0.max

		arg_49_0:OnOverLoadChange()
	else
		arg_49_0:updateProgressBar()
	end
end

function var_0_1.enterCombatUIPreviewStep(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0._previewProgress

	arg_50_0._previewStep = arg_50_1
	arg_50_0._previewElapsed = 0

	switch(arg_50_1, {
		[var_0_3.CHARGE] = function()
			var_50_0.count = 0
			var_50_0.current = 0
			var_50_0.max = arg_50_0.PREVIEW_LOOP_CONFIG.chargeDurations[1]
			arg_50_0._previewLayer = 1

			arg_50_0:OnCountChange()
			arg_50_0:OnOverLoadChange()
		end,
		[var_0_3.USABLE] = function()
			return
		end,
		[var_0_3.USE] = function()
			arg_50_0._previewUseTimes = 1

			arg_50_0:previewDeduct()
		end
	})
end

function var_0_1.UpdateCombatUIPreviewLoop(arg_54_0, arg_54_1)
	if not arg_54_0._previewStep then
		return
	end

	arg_54_1 = arg_54_1 or var_0_2

	local var_54_0 = arg_54_0.PREVIEW_LOOP_CONFIG
	local var_54_1 = arg_54_0._previewProgress

	arg_54_0._previewElapsed = arg_54_0._previewElapsed + arg_54_1

	switch(arg_54_0._previewStep, {
		[var_0_3.CHARGE] = function()
			local var_55_0 = var_54_0.chargeDurations[arg_54_0._previewLayer]

			if var_54_1.count == 0 then
				var_54_1.current = math.min(arg_54_0._previewElapsed, var_54_1.max)

				arg_54_0:updateProgressBar()
			end

			if var_55_0 <= arg_54_0._previewElapsed then
				arg_54_0._previewElapsed = arg_54_0._previewElapsed - var_55_0
				arg_54_0._previewLayer = arg_54_0._previewLayer + 1

				arg_54_0:previewPlus()

				if var_54_1.count >= var_54_1.total then
					arg_54_0:enterCombatUIPreviewStep(var_0_3.USABLE)
				end
			end
		end,
		[var_0_3.USABLE] = function()
			if arg_54_0._previewElapsed >= var_54_0.usableDuration then
				arg_54_0:enterCombatUIPreviewStep(var_0_3.USE)
			end
		end,
		[var_0_3.USE] = function()
			arg_54_0:updatePreviewGCD(arg_54_1)

			if arg_54_0._previewUseTimes < var_54_1.total then
				if arg_54_0._previewElapsed >= var_54_0.useInterval then
					arg_54_0._previewElapsed = arg_54_0._previewElapsed - var_54_0.useInterval
					arg_54_0._previewUseTimes = arg_54_0._previewUseTimes + 1

					arg_54_0:previewDeduct()
				end
			elseif arg_54_0._previewElapsed >= var_54_0.restartDelay then
				arg_54_0:enterCombatUIPreviewStep(var_0_3.CHARGE)
			end
		end
	})
end

function var_0_1.updateProgressBar(arg_58_0)
	local var_58_0 = arg_58_0._progressInfo:GetCurrent() / arg_58_0._progressInfo:GetMax()

	arg_58_0._progressBar.fillAmount = var_58_0

	if arg_58_0._bgEff then
		if arg_58_0._progressInfo.GetCount and arg_58_0._progressInfo:GetCount() > 0 then
			arg_58_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1
		else
			arg_58_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = var_58_0
		end
	end
end

function var_0_1.Dispose(arg_59_0)
	if arg_59_0.eventTriggers then
		for iter_59_0, iter_59_1 in pairs(arg_59_0.eventTriggers) do
			ClearEventTrigger(iter_59_0)
		end

		arg_59_0.eventTriggers = nil
	end

	arg_59_0._progress = nil
	arg_59_0._progressBar = nil

	arg_59_0._progressInfo:UnregisterEventListener(arg_59_0, var_0_0.Battle.BattleEvent.OVER_LOAD_CHANGE)
	arg_59_0._progressInfo:UnregisterEventListener(arg_59_0, var_0_0.Battle.BattleEvent.WEAPON_TOTAL_CHANGE)
	arg_59_0._progressInfo:UnregisterEventListener(arg_59_0, var_0_0.Battle.BattleEvent.WEAPON_COUNT_PLUS)
	arg_59_0._progressInfo:UnregisterEventListener(arg_59_0, var_0_0.Battle.BattleEvent.COUNT_CHANGE)
	var_0_0.EventListener.DetachEventListener(arg_59_0)
end
