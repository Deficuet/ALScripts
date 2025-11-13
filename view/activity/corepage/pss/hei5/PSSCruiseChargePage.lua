local var_0_0 = class("PSSCruiseChargePage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "PSSCruiseChargePage"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.buyWindow = arg_3_0._tf:Find("buy_window")
	arg_3_0.cancelBtn = arg_3_0.buyWindow:Find("button_container/button_cancel")

	setText(arg_3_0.cancelBtn:Find("Image"), i18n("text_cancel"))

	arg_3_0.confirmBtn = arg_3_0.buyWindow:Find("button_container/button_ok")
	arg_3_0.priceTF = arg_3_0.confirmBtn:Find("Image")

	setText(arg_3_0.buyWindow:Find("left/got/desc"), i18n("blackfriday_battlepass_pay_acquire"))

	local var_3_0 = arg_3_0.buyWindow:Find("right/items/scrollview/list")

	setText(arg_3_0.buyWindow:Find("right/items/Text"), i18n("blackfriday_battlepass_pay_tip"))

	arg_3_0.uiItemList = UIItemList.New(var_3_0, var_3_0:Find("tpl"))

	arg_3_0.uiItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_3_0.itemList[arg_4_1]

			updateDrop(arg_4_2, var_4_0)
			setText(arg_4_2:Find("name"), shortenString(var_4_0:getConfig("name"), 4))
			onButton(arg_3_0, arg_4_2, function()
				arg_3_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
					drop = var_4_0
				})
			end, SFX_CONFIRM)
		end
	end)
	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		if ChargeConst.isNeedSetBirth() then
			arg_3_0:emit(PSSHei5Mediator.EVENT_OPEN_BIRTHDAY)
		else
			pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
				shopId = arg_3_0.passId
			})
		end
	end, SFX_PANEL)
end

function var_0_0.ShowBuyWindow(arg_9_0)
	setActive(arg_9_0.buyWindow, true)
	arg_9_0:Show()

	local var_9_0 = var_0_0.GetPassID()

	if arg_9_0.passId and arg_9_0.passId == var_9_0 then
		return
	end

	arg_9_0.passId = var_0_0.GetPassID()

	local var_9_1 = Goods.Create({
		shop_id = arg_9_0.passId
	}, Goods.TYPE_CHARGE)
	local var_9_2 = Drop.Create(var_9_1:getConfig("display")[1])

	LoadImageSpriteAtlasAsync(var_9_2:getIcon(), "", arg_9_0.buyWindow:Find("left/got/award/icon"))
	setText(arg_9_0.buyWindow:Find("left/got/award/count"), "x" .. var_9_2.count)
	setText(arg_9_0.buyWindow:Find("right/tip"), var_9_1:getConfig("descrip_extra"))

	local var_9_3 = var_9_1:getConfig("money")

	if PLATFORM_CODE == PLATFORM_CHT and var_9_1:IsLocalPrice() then
		-- block empty
	else
		var_9_3 = GetMoneySymbol() .. var_9_3
	end

	setText(arg_9_0.priceTF, var_9_3)

	arg_9_0.itemList = var_9_1:GetExtraServiceItem()

	arg_9_0.uiItemList:align(#arg_9_0.itemList)
end

function var_0_0.GetPassID()
	local var_10_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5)

	if var_10_0 and not var_10_0:isEnd() then
		for iter_10_0, iter_10_1 in ipairs(pg.pay_data_display.all) do
			local var_10_1 = pg.pay_data_display[iter_10_1]

			if var_10_1.sub_display and type(var_10_1.sub_display) == "table" and var_10_1.sub_display[1] == var_10_0.id then
				return iter_10_1
			end
		end
	end
end

function var_0_0.ShowUnlockWindow(arg_11_0, arg_11_1)
	arg_11_0:Hide()
end

function var_0_0.Show(arg_12_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
	var_0_0.super.Show(arg_12_0)
end

function var_0_0.Hide(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf)
	var_0_0.super.Hide(arg_13_0)
end

function var_0_0.OnDestroy(arg_14_0)
	return
end

return var_0_0
