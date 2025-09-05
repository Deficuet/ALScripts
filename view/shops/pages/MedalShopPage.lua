local var_0_0 = class("MedalShopPage", import(".MilitaryShopPage"))

function var_0_0.CanOpen(arg_1_0)
	return true
end

function var_0_0.CustomInit(arg_2_0)
	arg_2_0.purchaseWindow = MedalShopPurchasePanel.New(arg_2_0._tf, arg_2_0.parent.event)
	arg_2_0.multiWindow = MedalShopMultiWindow.New(arg_2_0._tf, arg_2_0.parent.event)
end

function var_0_0.UpdateShop(arg_3_0, ...)
	var_0_0.super.UpdateShop(arg_3_0, ...)

	if arg_3_0.purchaseWindow:isShowing() then
		arg_3_0.purchaseWindow:ExecuteAction("Hide")
	end

	if arg_3_0.multiWindow:isShowing() then
		arg_3_0.multiWindow:ExecuteAction("Hide")
	end
end

function var_0_0.OnUpdatePlayer(arg_4_0)
	return
end

function var_0_0.OnUpdateItems(arg_5_0)
	arg_5_0:RefreshResItemList()
end

function var_0_0.GetResDataList(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = arg_6_0.shop:GetResList()

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		local var_6_2
		local var_6_3 = arg_6_0.items[ITEM_ID_SILVER_HOOK]
		local var_6_4 = not var_6_3 and 0 or var_6_3.count

		table.insert(var_6_0, {
			type = DROP_TYPE_ITEM,
			resID = iter_6_1,
			cnt = var_6_4
		})
	end

	return var_6_0
end

function var_0_0.RefreshUI(arg_7_0)
	setActive(arg_7_0.tipTextGo, true)
	setActive(arg_7_0.helpBtn, false)
	setActive(arg_7_0.resolveBtn, false)
	setActive(arg_7_0.refreshBtn, false)
end

function var_0_0.OnInitItem(arg_8_0, arg_8_1)
	local var_8_0 = MedalGoodsCard.New(arg_8_1)

	onButton(arg_8_0, var_8_0.go, function()
		if not var_8_0.goods:CanPurchase() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

			return
		end

		arg_8_0:OnCardClick(var_8_0)
	end, SFX_PANEL)

	arg_8_0.cards[arg_8_1] = var_8_0
end

function var_0_0.OnCardClick(arg_10_0, arg_10_1)
	if arg_10_1.goods:Selectable() then
		arg_10_0.purchaseWindow:ExecuteAction("Show", {
			id = arg_10_1.goods.id,
			count = arg_10_1.goods:GetMaxCnt(),
			type = arg_10_1.goods:getConfig("type"),
			price = arg_10_1.goods:getConfig("price"),
			displays = arg_10_1.goods:getConfig("goods"),
			num = arg_10_1.goods:getConfig("num")
		})
	elseif arg_10_1.goods:getConfig("goods_type") == 1 and arg_10_1.goods:GetLimit() > 1 then
		arg_10_0.multiWindow:ExecuteAction("Show", arg_10_1.goods, function(arg_11_0)
			if not arg_10_1.goods:CanPurchaseCnt(arg_11_0) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

				return
			end

			local var_11_0 = {}
			local var_11_1 = arg_10_1.goods:getConfig("goods")[1]

			for iter_11_0 = 1, arg_11_0 do
				table.insert(var_11_0, var_11_1)
			end

			arg_10_0:emit(NewShopMainMediator.ON_MEDAL_SHOPPING, arg_10_1.goods.id, var_11_0)
		end)
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_exchange",
			content = i18n("guild_shop_exchange_tip"),
			onYes = function()
				if not arg_10_1.goods:CanPurchase() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

					return
				end

				arg_10_0:emit(NewShopMainMediator.ON_MEDAL_SHOPPING, arg_10_1.goods.id, arg_10_1.goods:GetFirstDropId())
			end
		})
	end
end

function var_0_0.AddTimer(arg_13_0)
	local var_13_0 = arg_13_0.shop.nextTime + 1

	arg_13_0.timer = Timer.New(function()
		local var_14_0 = var_13_0 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_14_0 <= 0 then
			arg_13_0:RemoveTimer()
			arg_13_0:OnTimeOut()
		else
			local var_14_1 = string.format("%02d", 1 + math.floor((var_14_0 - 1) / 86400))

			setText(arg_13_0.tipText, i18n("title_limit_time") .. i18n("shops_rest_day") .. var_14_1 .. i18n("word_date"))
		end
	end, 1, -1)

	arg_13_0.timer:Start()
	arg_13_0.timer.func()
end

function var_0_0.OnTimeOut(arg_15_0)
	arg_15_0:emit(NewShopMainMediator.REFRESH_MEDAL_SHOP, false)
end

function var_0_0.OnDestroy(arg_16_0)
	var_0_0.super.OnDestroy(arg_16_0)
	arg_16_0.purchaseWindow:Destroy()
	arg_16_0.multiWindow:Destroy()
end

return var_0_0
