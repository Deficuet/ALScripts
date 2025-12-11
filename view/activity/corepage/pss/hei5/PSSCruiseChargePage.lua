local var_0_0 = class("PSSCruiseChargePage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "PSSCruiseChargePage"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.initTplVar(arg_3_0)
	arg_3_0.descTip = "blackfriday_battlepass_pay_acquire"
	arg_3_0.payTip = "blackfriday_battlepass_pay_tip"
	arg_3_0.tplMaskName = nil
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0:initTplVar()

	arg_4_0.buyWindow = arg_4_0._tf:Find("buy_window")
	arg_4_0.cancelBtn = arg_4_0.buyWindow:Find("button_container/button_cancel")

	setText(arg_4_0.cancelBtn:Find("Image"), i18n("text_cancel"))

	arg_4_0.confirmBtn = arg_4_0.buyWindow:Find("button_container/button_ok")
	arg_4_0.priceTF = arg_4_0.confirmBtn:Find("Image")

	setText(arg_4_0.buyWindow:Find("left/got/desc"), i18n(arg_4_0.descTip))

	local var_4_0 = arg_4_0.buyWindow:Find("right/items/scrollview/list")

	setText(arg_4_0.buyWindow:Find("right/items/Text"), i18n(arg_4_0.payTip))

	arg_4_0.uiItemList = UIItemList.New(var_4_0, var_4_0:Find("tpl"))

	arg_4_0.uiItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		arg_5_1 = arg_5_1 + 1

		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_4_0.itemList[arg_5_1]

			if not arg_4_0.tplMaskName then
				updateDrop(arg_5_2, var_5_0)
			else
				updateDrop(arg_5_2:Find(arg_4_0.tplMaskName), var_5_0)
			end

			setText(arg_5_2:Find("name"), shortenString(var_5_0:getConfig("name"), 4))
			onButton(arg_4_0, arg_5_2, function()
				arg_4_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
					drop = var_5_0
				})
			end, SFX_CONFIRM)
		end
	end)
	onButton(arg_4_0, arg_4_0._tf:Find("bg"), function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.cancelBtn, function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.confirmBtn, function()
		if ChargeConst.isNeedSetBirth() then
			arg_4_0:emit(PSSHei5Mediator.EVENT_OPEN_BIRTHDAY)
		else
			pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
				shopId = arg_4_0.passId
			})
		end
	end, SFX_PANEL)
end

function var_0_0.ShowBuyWindow(arg_10_0)
	setActive(arg_10_0.buyWindow, true)
	arg_10_0:Show()

	local var_10_0 = var_0_0.GetPassID()

	if arg_10_0.passId and arg_10_0.passId == var_10_0 then
		return
	end

	arg_10_0.passId = var_0_0.GetPassID()

	local var_10_1 = Goods.Create({
		shop_id = arg_10_0.passId
	}, Goods.TYPE_CHARGE)
	local var_10_2 = Drop.Create(var_10_1:getConfig("display")[1])

	LoadImageSpriteAtlasAsync(var_10_2:getIcon(), "", arg_10_0.buyWindow:Find("left/got/award/icon"))
	setText(arg_10_0.buyWindow:Find("left/got/award/count"), "x" .. var_10_2.count)
	setText(arg_10_0.buyWindow:Find("right/tip"), var_10_1:getConfig("descrip_extra"))

	local var_10_3 = var_10_1:getConfig("money")

	if PLATFORM_CODE == PLATFORM_CHT and var_10_1:IsLocalPrice() then
		-- block empty
	else
		var_10_3 = GetMoneySymbol() .. var_10_3
	end

	setText(arg_10_0.priceTF, var_10_3)

	arg_10_0.itemList = var_10_1:GetExtraServiceItem()

	arg_10_0.uiItemList:align(#arg_10_0.itemList)
end

function var_0_0.GetPassID()
	local var_11_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5)

	if var_11_0 and not var_11_0:isEnd() then
		for iter_11_0, iter_11_1 in ipairs(pg.pay_data_display.all) do
			local var_11_1 = pg.pay_data_display[iter_11_1]

			if var_11_1.sub_display and type(var_11_1.sub_display) == "table" and var_11_1.sub_display[1] == var_11_0.id then
				return iter_11_1
			end
		end
	end
end

function var_0_0.ShowUnlockWindow(arg_12_0, arg_12_1)
	arg_12_0:Hide()
end

function var_0_0.Show(arg_13_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_13_0._tf)
	var_0_0.super.Show(arg_13_0)
end

function var_0_0.Hide(arg_14_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_14_0._tf)
	var_0_0.super.Hide(arg_14_0)
end

function var_0_0.OnDestroy(arg_15_0)
	return
end

return var_0_0
