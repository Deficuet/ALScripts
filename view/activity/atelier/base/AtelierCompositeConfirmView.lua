local var_0_0 = class("AtelierCompositeConfirmView", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject
	arg_1_0._tf = arg_1_1
	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	setActive(arg_1_0._go, false)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitCustom()
end

function var_0_0.InitCustom(arg_3_0)
	return
end

function var_0_0.SetContextData(arg_4_0, arg_4_1)
	arg_4_0.contextData = arg_4_1
end

function var_0_0.SetActivity(arg_5_0, arg_5_1)
	arg_5_0.activity = arg_5_1
end

function var_0_0.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0:findTF("BG"), function()
		arg_6_0:HideCompositeConfirmWindow()
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0:findTF("Window/Cancel"), function()
		arg_6_0:HideCompositeConfirmWindow()
	end, SFX_CANCEL)
end

local var_0_1 = 41
local var_0_2 = 5

function var_0_0.ShowCompositeConfirmWindow(arg_9_0, arg_9_1)
	setActive(arg_9_0._go, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_9_0._tf)

	local var_9_0 = 1
	local var_9_1 = {}
	local var_9_2 = {}

	_.each(arg_9_1, function(arg_10_0)
		local var_10_0 = arg_10_0.Instance:GetConfigID()

		table.insert(var_9_1, {
			key = arg_10_0.Data:GetConfigID(),
			value = var_10_0
		})

		var_9_2[var_10_0] = (var_9_2[var_10_0] or 0) + 1
	end)
	onButton(arg_9_0, arg_9_0:findTF("Window/Confirm"), function()
		arg_9_0._parentClass:emit(GAME.COMPOSITE_ATELIER_RECIPE, var_9_1, var_9_0)
		arg_9_0._parentClass:PlaySoundEffect(arg_9_0._parentClass.soundStr.compositeConfirm)
	end, SFX_PANEL)

	local var_9_3 = arg_9_0.activity:GetFormulas()[arg_9_0.contextData.formulaId]
	local var_9_4 = var_9_3:GetMaxLimit() ~= 1
	local var_9_5 = var_9_3:GetMaxLimit() > 0 and var_9_3:GetMaxLimit() - var_9_3:GetUsedCount() or 10000
	local var_9_6 = arg_9_0.activity:GetItems()

	for iter_9_0, iter_9_1 in pairs(var_9_2) do
		local var_9_7 = var_9_6[iter_9_0] and var_9_6[iter_9_0].count or 0

		var_9_5 = math.min(var_9_5, math.floor(var_9_7 / iter_9_1))
	end

	local var_9_8 = var_9_5
	local var_9_9 = {
		1,
		var_9_4 and var_9_8 or 1
	}
	local var_9_10 = Drop.New({
		type = var_9_3:GetProduction()[1],
		id = var_9_3:GetProduction()[2]
	})

	arg_9_0._parentClass:UpdateRyzaDrop(arg_9_0:findTF("Window/Icon"), var_9_10)

	local var_9_11 = arg_9_0:findTF("Window/Counters")
	local var_9_12 = var_9_10:getConfig("name")

	setActive(var_9_11, var_9_4)

	if var_9_4 then
		setAnchoredPosition(arg_9_0:findTF("Window/Icon"), {
			y = var_0_1
		})

		local function var_9_13()
			setText(arg_9_0:findTF("Number", var_9_11), var_9_0)
			setText(arg_9_0:findTF("Window/Text"), i18n("ryza_composite_confirm", var_9_12, var_9_0))
		end

		var_9_13()
		onButton(arg_9_0, arg_9_0:findTF("Plus", var_9_11), function()
			local var_13_0 = var_9_0

			var_9_0 = var_9_0 + 1
			var_9_0 = math.clamp(var_9_0, var_9_9[1], var_9_9[2])

			if var_13_0 == var_9_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_max_composite_count"))

				return
			end

			var_9_13()
		end)
		onButton(arg_9_0, arg_9_0:findTF("Minus", var_9_11), function()
			var_9_0 = var_9_0 - 1
			var_9_0 = math.clamp(var_9_0, var_9_9[1], var_9_9[2])

			var_9_13()
		end)
		onButton(arg_9_0, arg_9_0:findTF("Plus10", var_9_11), function()
			local var_15_0 = var_9_0

			var_9_0 = var_9_0 + 10
			var_9_0 = math.clamp(var_9_0, var_9_9[1], var_9_9[2])

			if var_15_0 == var_9_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_max_composite_count"))

				return
			end

			var_9_13()
		end)
		onButton(arg_9_0, arg_9_0:findTF("Minus10", var_9_11), function()
			var_9_0 = var_9_0 - 10
			var_9_0 = math.clamp(var_9_0, var_9_9[1], var_9_9[2])

			var_9_13()
		end)
	else
		setAnchoredPosition(arg_9_0:findTF("Window/Icon"), {
			y = var_0_2
		})
		setText(arg_9_0:findTF("Window/Text"), i18n("ryza_composite_confirm_single", var_9_12, var_9_0))
	end
end

function var_0_0.HideCompositeConfirmWindow(arg_17_0)
	if not isActive(arg_17_0._go) then
		return
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_17_0._tf, arg_17_0._parentClass._tf)
	setActive(arg_17_0._go, false)

	return true
end

function var_0_0.willExit(arg_18_0)
	arg_18_0:detach()
end

return var_0_0
