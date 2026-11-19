ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleWeaponButtonSkinElite_20260226", var_0_0.Battle.BattleWeaponButtonSkinElite_20250520)

var_0_0.Battle.BattleWeaponButtonSkinElite_20260226 = var_0_1
var_0_1.__name = "BattleWeaponButtonSkinElite_20260226"

function var_0_1.ConfigSkin(arg_1_0, arg_1_1)
	var_0_1.super.ConfigSkin(arg_1_0, arg_1_1)

	arg_1_0._books = arg_1_0._selected:Find("usdfx/fx/up/book/book/book1")
	arg_1_0._bookList = {}

	for iter_1_0 = 1, 4 do
		table.insert(arg_1_0._bookList, arg_1_0._books:Find("text_" .. iter_1_0))
	end
end

function var_0_1.OnCountChange(arg_2_0)
	var_0_1.super.OnCountChange(arg_2_0)
	SetActive(arg_2_0._gizmos1, arg_2_0._progressInfo:GetCount() > 0)
	SetActive(arg_2_0._gizmosXue, arg_2_0._progressInfo:GetCount() > 0)
end

function var_0_1.OnOverLoadChange(arg_3_0, arg_3_1)
	if arg_3_1 and arg_3_1.Data and arg_3_1.Data.postCast then
		local var_3_0 = math.random(4)

		for iter_3_0, iter_3_1 in ipairs(arg_3_0._bookList) do
			SetActive(iter_3_1, iter_3_0 == var_3_0)
		end
	end

	var_0_1.super.OnOverLoadChange(arg_3_0, arg_3_1)
end

function var_0_1.updateProgressBar(arg_4_0)
	local var_4_0 = arg_4_0._progressInfo:GetCurrent() / arg_4_0._progressInfo:GetMax()

	arg_4_0._progressBar.fillAmount = var_4_0

	if arg_4_0._bgEff then
		if arg_4_0._progressInfo.GetCount and arg_4_0._progressInfo:GetCount() > 0 then
			arg_4_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 0
		else
			arg_4_0._bgEff:GetComponent(typeof(CanvasGroup)).alpha = 1 - var_4_0
		end
	end
end

function var_0_1.SetToCombatUIPreview(arg_5_0, arg_5_1)
	local var_5_0 = CombatUIPreviewer.WeaponButtonPreviewMode

	switch(arg_5_1, {
		[var_5_0.UNFILLED] = function()
			SetActive(arg_5_0._unfill, true)
			SetActive(arg_5_0._filled, false)

			arg_5_0._progressBar.fillAmount = 0

			if arg_5_0._bgEff then
				arg_5_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 1
			end

			arg_5_0._countTxt.text = "0/0"

			if arg_5_0._gizmos1 then
				SetActive(arg_5_0._gizmos1, false)
				SetActive(arg_5_0._gizmosXue, false)
			end
		end,
		[var_5_0.FILLED] = function()
			SetActive(arg_5_0._filled, true)
			SetActive(arg_5_0._unfill, false)

			arg_5_0._progressBar.fillAmount = 1

			if arg_5_0._bgEff then
				arg_5_0._skin:Find("ActCtl/bg_eff"):GetComponent(typeof(CanvasGroup)).alpha = 0
			end

			arg_5_0._countTxt.text = "1/1"

			if arg_5_0._gizmos1 then
				SetActive(arg_5_0._gizmos1, true)
				SetActive(arg_5_0._gizmosXue, true)
			end
		end,
		[var_5_0.LOOP] = function()
			arg_5_0:SetToCombatUIPreview(var_5_0.FILLED)
		end,
		[var_5_0.USABLE] = function()
			local var_9_0 = arg_5_0:GetProgressFaker(1)

			var_9_0.current = var_9_0.max
			var_9_0.count = 1
			arg_5_0._progressInfo = var_9_0

			arg_5_0:OnCountChange()
			arg_5_0:OnOverLoadChange()
		end
	})
end
