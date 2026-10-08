local var_0_0 = class("WorldCruiseChargePage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "WorldCruiseChargePage"
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

	setText(arg_3_0.buyWindow:Find("left/got/desc"), i18n("battlepass_pay_acquire"))

	local var_3_0 = arg_3_0.buyWindow:Find("right/items/scrollview/list")

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

	arg_3_0.unlcokWindow = arg_3_0._tf:Find("unlock_window")

	setText(arg_3_0.unlcokWindow:Find("tip"), i18n("word_click_to_close"))

	arg_3_0.unlockItem = arg_3_0.unlcokWindow:Find("IconTpl")

	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		if ChargeConst.isNeedSetBirth() then
			arg_3_0:emit(WorldCruiseMediator.EVENT_OPEN_BIRTHDAY)
		else
			pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
				shopId = arg_3_0.passId
			})
		end
	end, SFX_PANEL)
end

function var_0_0.GetPassId(arg_9_0)
	return var_0_0.GetPassID()
end

function var_0_0.ShowBuyWindow(arg_10_0)
	setActive(arg_10_0.buyWindow, true)
	setActive(arg_10_0.unlcokWindow, false)
	arg_10_0:Show()

	local var_10_0 = arg_10_0:GetPassId()

	if arg_10_0.passId and arg_10_0.passId == var_10_0 then
		return
	end

	arg_10_0.passId = arg_10_0:GetPassId()

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
	local var_11_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_11_0 and not var_11_0:isEnd() then
		for iter_11_0, iter_11_1 in ipairs(pg.pay_data_display.all) do
			local var_11_1 = pg.pay_data_display[iter_11_1]

			if var_11_1.sub_display and type(var_11_1.sub_display) == "table" and var_11_1.sub_display[1] == var_11_0.id then
				return iter_11_1
			end
		end
	end
end

function var_0_0.ShowUnlockWindow(arg_12_0, arg_12_1, arg_12_2)
	setActive(arg_12_0.buyWindow, false)
	setActive(arg_12_0.unlcokWindow, true)
	arg_12_0:Show()

	local var_12_0 = arg_12_1:getConfig("display")
	local var_12_1 = Drop.Create(var_12_0[1])

	updateDrop(arg_12_0.unlockItem, var_12_1)
	onButton(arg_12_0, arg_12_0.unlockItem, function()
		arg_12_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_12_1
		})
	end, SFX_CONFIRM)

	arg_12_0.onHide = arg_12_2
end

function var_0_0.Show(arg_14_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_14_0._tf)
	var_0_0.super.Show(arg_14_0)
end

function var_0_0.Hide(arg_15_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_15_0._tf)
	var_0_0.super.Hide(arg_15_0)

	if arg_15_0.onHide then
		arg_15_0.onHide()

		arg_15_0.onHide = nil
	end
end

function var_0_0.OnDestroy(arg_16_0)
	if arg_16_0:isShowing() then
		arg_16_0:Hide()
	end
end

return var_0_0
