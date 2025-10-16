local var_0_0 = class("StoreUpgradeWindow", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "MailStoreExtendMsgboxUI"
end

function var_0_0.OnInit(arg_2_0)
	onButton(arg_2_0, arg_2_0._tf:Find("bg"), function()
		arg_2_0:Hide()
	end, SFX_PANEL)

	arg_2_0.closeBtn = arg_2_0._tf:Find("window/top/btnBack")

	onButton(arg_2_0, arg_2_0.closeBtn, function()
		arg_2_0:Hide()
	end, SFX_PANEL)

	arg_2_0.btnDiamond = arg_2_0._tf:Find("window/button_container/btn_diamond")

	onButton(arg_2_0, arg_2_0.btnDiamond, function()
		arg_2_0:emit(MailMediator.ON_EXTEND_STORE, true)
		arg_2_0:Hide()
	end, SFX_PANEL)

	arg_2_0.btnGold = arg_2_0._tf:Find("window/button_container/btn_gold")

	onButton(arg_2_0, arg_2_0.btnGold, function()
		arg_2_0:emit(MailMediator.ON_EXTEND_STORE, false)
		arg_2_0:Hide()
	end, SFX_PANEL)
	setText(arg_2_0._tf:Find("window/top/bg/infomation/title"), i18n("mail_boxroom_extend_title"))
	setText(arg_2_0._tf:Find("window/frame/tip/Text"), i18n("mail_boxroom_extend_tips"))
	setText(arg_2_0.btnGold:Find("Text"), i18n("mail_buy_button"))
	setText(arg_2_0.btnDiamond:Find("Text"), i18n("mail_buy_button"))
	setText(arg_2_0._tf:Find("window/frame/price/Text"), i18n("mail_all_price"))
end

function var_0_0.UpdateInfo(arg_7_0)
	local var_7_0 = arg_7_0._tf:Find("window/frame")
	local var_7_1 = getProxy(PlayerProxy):getRawData()
	local var_7_2 = pg.mail_storeroom[var_7_1.mailStoreLevel]
	local var_7_3 = pg.mail_storeroom[var_7_1.mailStoreLevel + 1]
	local var_7_4, var_7_5 = var_7_1:GetExtendStoreCost()

	setText(var_7_0:Find("gold/before"), var_7_2.gold_store)
	setText(var_7_0:Find("gold/after"), var_7_3.gold_store)
	setText(var_7_0:Find("oil/before"), var_7_2.oil_store)
	setText(var_7_0:Find("oil/after"), var_7_3.oil_store)
	setText(var_7_0:Find("oil/name"), i18n("mail_oil_res"))
	setText(var_7_0:Find("gold/name"), i18n("mail_gold_res"))
	setActive(var_7_0:Find("price/price_diamond"), var_7_4)
	setText(var_7_0:Find("price/price_diamond/Text"), var_7_4 and var_7_4.count or 0)
	setActive(var_7_0:Find("price/price_gold"), var_7_5)
	setText(var_7_0:Find("price/price_gold/Text"), var_7_5 and var_7_5.count or 0)
	setActive(var_7_0:Find("price/line"), var_7_4 and var_7_5)
	setActive(arg_7_0.btnDiamond, var_7_4)
	setActive(arg_7_0.btnGold, var_7_5)
end

function var_0_0.Show(arg_8_0)
	var_0_0.super.Show(arg_8_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_8_0._tf)
	arg_8_0:UpdateInfo()
end

function var_0_0.Hide(arg_9_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._tf, arg_9_0._parentTf)
	var_0_0.super.Hide(arg_9_0)
end

function var_0_0.OnDestroy(arg_10_0)
	if arg_10_0:isShowing() then
		arg_10_0:Hide()
	end
end

return var_0_0
