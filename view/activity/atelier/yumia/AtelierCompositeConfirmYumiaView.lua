local var_0_0 = class("AtelierCompositeConfirmYumiaView", import("view.activity.Atelier.base.AtelierCompositeConfirmView"))

function var_0_0.InitCustom(arg_1_0)
	setText(arg_1_0:findTF("Window/titleBg/Name"), i18n("yumia_atelier_tip14"))
end

function var_0_0.didEnter(arg_2_0)
	var_0_0.super.didEnter(arg_2_0)
	onButton(arg_2_0, arg_2_0:findTF("Window/titleBg/closeBtn"), function()
		arg_2_0:HideCompositeConfirmWindow()
	end, SFX_CANCEL)
end

function var_0_0.HideCompositeConfirmWindow(arg_4_0)
	if not isActive(arg_4_0._go) then
		return
	end

	local var_4_0 = GetComponent(arg_4_0._tf, typeof(Animation))

	var_4_0:Play("Anim_AtelierCompositeYumiaUI_ConfirmWindow_Out")
	pg.UIMgr.GetInstance():LoadingOn(false)

	arg_4_0.closeTimer = FrameTimer.New(function()
		if not var_4_0:IsPlaying("Anim_AtelierCompositeYumiaUI_ConfirmWindow_Out") then
			arg_4_0:StopCloseTimer()
			pg.UIMgr.GetInstance():LoadingOff()
			var_0_0.super.HideCompositeConfirmWindow(arg_4_0)
		end
	end, 1, -1)

	arg_4_0.closeTimer:Start()

	return true
end

function var_0_0.StopCloseTimer(arg_6_0)
	if arg_6_0.closeTimer then
		arg_6_0.closeTimer:Stop()

		arg_6_0.closeTimer = nil
	end
end

function var_0_0.ShowCompositeConfirmWindow(arg_7_0, arg_7_1)
	GetComponent(arg_7_0._tf, typeof(Animation)):Play("Anim_AtelierCompositeYumiaUI_ConfirmWindow_In")
	setActive(arg_7_0._go, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf)

	local var_7_0 = 1
	local var_7_1 = {}
	local var_7_2 = {}

	_.each(arg_7_1, function(arg_8_0)
		local var_8_0 = arg_8_0.Instance:GetConfigID()

		table.insert(var_7_1, {
			key = arg_8_0.Data:GetConfigID(),
			value = var_8_0
		})

		var_7_2[var_8_0] = (var_7_2[var_8_0] or 0) + 1
	end)
	onButton(arg_7_0, arg_7_0:findTF("Window/Confirm"), function()
		arg_7_0._parentClass:emit(GAME.COMPOSITE_ATELIER_RECIPE, var_7_1, var_7_0)
		arg_7_0._parentClass:PlaySoundEffect(arg_7_0._parentClass.soundStr.compositeConfirm)
	end, SFX_PANEL)

	local var_7_3 = arg_7_0.activity:GetFormulas()[arg_7_0.contextData.formulaId]
	local var_7_4 = var_7_3:GetMaxLimit() ~= 1
	local var_7_5 = var_7_3:GetMaxLimit() > 0 and var_7_3:GetMaxLimit() - var_7_3:GetUsedCount() or 10000
	local var_7_6 = arg_7_0.activity:GetItems()

	for iter_7_0, iter_7_1 in pairs(var_7_2) do
		local var_7_7 = var_7_6[iter_7_0] and var_7_6[iter_7_0].count or 0

		var_7_5 = math.min(var_7_5, math.floor(var_7_7 / iter_7_1))
	end

	local var_7_8 = var_7_5
	local var_7_9 = {
		1,
		var_7_4 and var_7_8 or 1
	}
	local var_7_10 = Drop.New({
		type = var_7_3:GetProduction()[1],
		id = var_7_3:GetProduction()[2]
	})
	local var_7_11 = arg_7_0:findTF("Window/Icon")
	local var_7_12 = arg_7_0:findTF("Window/AtelierCommonYumiaItem")

	if var_7_10.type ~= DROP_TYPE_RYZA_DROP then
		arg_7_0._parentClass:UpdateRyzaDrop(var_7_11, var_7_10)
		setActive(var_7_11, true)
		setActive(var_7_12, false)
	else
		local var_7_13 = var_7_3:GetProduction()[2]
		local var_7_14 = AtelierMaterial.New({
			configId = var_7_13
		})

		var_7_14.count = 1

		arg_7_0._parentClass:UpdateRyzaItem(var_7_12, var_7_14)
		setActive(var_7_11, false)
		setActive(var_7_12, true)
	end

	local var_7_15 = arg_7_0:findTF("Window/Counters")
	local var_7_16 = var_7_10:getConfig("name")

	setActive(var_7_15, var_7_4)

	if var_7_4 then
		local function var_7_17()
			setText(arg_7_0:findTF("Number", var_7_15), var_7_0)
			setText(arg_7_0:findTF("Window/Text"), i18n("yumia_atelier_tip20", var_7_16, var_7_0))
			setText(arg_7_0:findTF("cntText", var_7_12), var_7_0)
		end

		var_7_17()
		onButton(arg_7_0, arg_7_0:findTF("Plus", var_7_15), function()
			local var_11_0 = var_7_0

			var_7_0 = var_7_0 + 1
			var_7_0 = math.clamp(var_7_0, var_7_9[1], var_7_9[2])

			if var_11_0 == var_7_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("yumia_atelier_tip21"))

				return
			end

			var_7_17()
		end)
		onButton(arg_7_0, arg_7_0:findTF("Minus", var_7_15), function()
			var_7_0 = var_7_0 - 1
			var_7_0 = math.clamp(var_7_0, var_7_9[1], var_7_9[2])

			var_7_17()
		end)
		onButton(arg_7_0, arg_7_0:findTF("Plus10", var_7_15), function()
			local var_13_0 = var_7_0

			var_7_0 = var_7_0 + 10
			var_7_0 = math.clamp(var_7_0, var_7_9[1], var_7_9[2])

			if var_13_0 == var_7_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("yumia_atelier_tip21"))

				return
			end

			var_7_17()
		end)
		onButton(arg_7_0, arg_7_0:findTF("Minus10", var_7_15), function()
			var_7_0 = var_7_0 - 10
			var_7_0 = math.clamp(var_7_0, var_7_9[1], var_7_9[2])

			var_7_17()
		end)
	else
		setText(arg_7_0:findTF("Window/Text"), i18n("yumia_atelier_tip19", var_7_16, var_7_0))
	end
end

return var_0_0
