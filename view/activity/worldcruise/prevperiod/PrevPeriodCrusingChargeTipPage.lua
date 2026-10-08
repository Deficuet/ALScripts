local var_0_0 = class("PrevPeriodCrusingChargeTipPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "PrevPeriodCrusingChargeTipPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0._tf:Find("close")
	arg_2_0.shopBtn = arg_2_0._tf:Find("shop")
	arg_2_0.awardPage = WorldCruiseAwardPage4PrevPeriod.New(arg_2_0._tf)
	arg_2_0.chargePage = WorldCruiseChargePage4PrevPeriod.New(arg_2_0._tf)
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Destroy()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.shopBtn, function()
		arg_3_0.onClose = nil

		arg_3_0.chargePage:ExecuteAction("ShowBuyWindow")
	end, SFX_CONFIRM)
end

function var_0_0.Show(arg_6_0, arg_6_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_6_0._tf)

	arg_6_0.onClose = arg_6_1

	arg_6_0.awardPage:ExecuteAction("Flush")
end

function var_0_0.OnChargeScene(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.chargePage:ExecuteAction("ShowUnlockWindow", arg_7_1, arg_7_2)
end

function var_0_0.Hide(arg_8_0)
	var_0_0.super.Hide(arg_8_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0._tf)

	if arg_8_0.awardPage and arg_8_0.awardPage:GetLoaded() then
		arg_8_0.awardPage:OnDestroy()
	end

	arg_8_0.awardPage = nil

	if arg_8_0.chargePage and arg_8_0.chargePage:GetLoaded() then
		arg_8_0.chargePage:OnDestroy()
	end

	arg_8_0.chargePage = nil

	if arg_8_0.onClose then
		arg_8_0.onClose()

		arg_8_0.onClose = nil
	end
end

function var_0_0.OnDestroy(arg_9_0)
	if arg_9_0:isShowing() then
		arg_9_0:Hide()
	end
end

return var_0_0
