local var_0_0 = class("StreetShopPage", import(".BaseShopPage"))

function var_0_0.GenTip(arg_1_0, arg_1_1)
	local var_1_0 = ""

	if #arg_1_1 == 1 then
		local var_1_1 = arg_1_1[1]

		var_1_0 = i18n("shop_street_activity_tip", var_1_1:GetShopTime())
	elseif #arg_1_1 > 1 then
		var_1_0 = arg_1_0:GenTipForMultiAct(arg_1_1)
	end

	return var_1_0
end

function var_0_0.GenTipForMultiAct(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1[1]
	local var_2_1 = var_2_0:getStartTime()
	local var_2_2 = var_2_0.stopTime
	local var_2_3 = _.all(arg_2_1, function(arg_3_0)
		return arg_3_0:getStartTime() == var_2_1
	end)
	local var_2_4 = _.all(arg_2_1, function(arg_4_0)
		return arg_4_0.stopTime == var_2_2
	end)
	local var_2_5 = var_2_0

	if not var_2_4 then
		table.sort(arg_2_1, function(arg_5_0, arg_5_1)
			return arg_5_0.stopTime < arg_5_1.stopTime
		end)

		var_2_5 = arg_2_1[1]
	elseif not var_2_3 and var_2_4 then
		table.sort(arg_2_1, function(arg_6_0, arg_6_1)
			return arg_6_0:getStartTime() < arg_6_1:getStartTime()
		end)

		var_2_5 = arg_2_1[1]
	end

	return i18n("shop_street_activity_tip", var_2_5:GetShopTime())
end

function var_0_0.GenHelpContent(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_2:getConfig("config_data")

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = iter_7_1[1]
		local var_7_2 = pg.shop_template[var_7_1].effect_args[1]
		local var_7_3 = Item.getConfigData(var_7_2).name
		local var_7_4 = arg_7_2:GetShopTime()

		table.insert(arg_7_1, i18n("shop_street_Equipment_skin_box_help", var_7_3, var_7_4))
	end
end

function var_0_0.OnUpdatePlayer(arg_8_0)
	arg_8_0:RefreshResItemList()
end

function var_0_0.GetResDataList(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = arg_9_0.player:getResource(PlayerConst.ResGold)

	table.insert(var_9_0, {
		type = DROP_TYPE_RESOURCE,
		resID = PlayerConst.ResGold,
		cnt = var_9_1
	})

	return var_9_0
end

function var_0_0.OnSetUp(arg_10_0)
	arg_10_0:RemoveTimer()
	arg_10_0:AddTimer()
end

function var_0_0.Hide(arg_11_0)
	var_0_0.super.Hide(arg_11_0)
	arg_11_0:RemoveTimer()
end

function var_0_0.OnUpdateAll(arg_12_0)
	arg_12_0:InitCommodities()
	arg_12_0:OnSetUp()
end

function var_0_0.OnUpdateCommodity(arg_13_0, arg_13_1)
	local var_13_0

	for iter_13_0, iter_13_1 in pairs(arg_13_0.cards) do
		if iter_13_1.goodsVO.id == arg_13_1.id then
			var_13_0 = iter_13_1
		end
	end

	if var_13_0 then
		var_13_0:update(arg_13_1)
	end
end

function var_0_0.RefreshUI(arg_14_0)
	local var_14_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP_STREET)
	local var_14_1 = _.select(var_14_0, function(arg_15_0)
		return arg_15_0 and not arg_15_0:isEnd()
	end)

	setActive(arg_14_0.tipTextGo, #var_14_1 > 0)

	arg_14_0.tipText.text = arg_14_0:GenTip(var_14_1)

	setActive(arg_14_0.helpBtn, #var_14_1 > 1)

	arg_14_0.activitys = var_14_1

	setActive(arg_14_0.helpBtn, false)
	setActive(arg_14_0.resolveBtn, false)
	setActive(arg_14_0.refreshBtn, true)
	onButton(arg_14_0, arg_14_0.helpBtn, function()
		local var_16_0 = {}

		table.sort(arg_14_0.activitys, function(arg_17_0, arg_17_1)
			return arg_17_0:getStartTime() < arg_17_1:getStartTime()
		end)
		_.each(arg_14_0.activitys, function(arg_18_0)
			arg_14_0:GenHelpContent(var_16_0, arg_18_0)
		end)

		local var_16_1 = table.concat(var_16_0, "\n\n")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = var_16_1
		})
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.refreshBtn, function()
		local var_19_0 = ShoppingStreet.getRiseShopId(ShopArgs.ShoppingStreetUpgrade, arg_14_0.shop.flashCount)

		if not var_19_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("shopStreet_refresh_max_count"))

			return
		end

		local var_19_1 = pg.shop_template[var_19_0]

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			noText = "text_cancel",
			hideNo = false,
			yesText = "text_confirm",
			content = i18n("refresh_shopStreet_question", i18n("word_" .. id2res(var_19_1.resource_type) .. "_icon"), var_19_1.resource_num, arg_14_0.shop.flashCount),
			onYes = function()
				arg_14_0:emit(NewShopMainMediator.REFRESH_STREET_SHOP, var_19_0)
			end
		})
	end, SFX_PANEL)
	setButtonEnabled(arg_14_0.refreshBtn, true)
end

function var_0_0.OnInitItem(arg_21_0, arg_21_1)
	local var_21_0 = GoodsCard.New(arg_21_1)

	onButton(arg_21_0, var_21_0.go, function()
		local var_22_0 = var_21_0.goodsVO

		if not var_22_0:canPurchase() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_exchange",
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				id = var_22_0:getConfig("effect_args")[1],
				type = var_22_0:getConfig("type"),
				count = var_22_0:getConfig("num")
			},
			onYes = function()
				arg_21_0:Purchase(var_22_0)
			end
		})
	end, SFX_PANEL)

	arg_21_0.cards[arg_21_1] = var_21_0
end

function var_0_0.OnUpdateItem(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.cards[arg_24_2]

	if not var_24_0 then
		arg_24_0:OnInitItem(arg_24_2)

		var_24_0 = arg_24_0.cards[arg_24_2]
	end

	local var_24_1 = arg_24_0.displays[arg_24_1 + 1]

	var_24_0:update(var_24_1)
end

function var_0_0.Purchase(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1:getConfig("resource_type")

	if var_25_0 == 4 or var_25_0 == 14 then
		local var_25_1 = arg_25_0.player:getResById(var_25_0)
		local var_25_2 = Item.New({
			id = arg_25_1:getConfig("effect_args")[1]
		})
		local var_25_3 = arg_25_1:getConfig("resource_num") * (arg_25_1.discount / 100)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("charge_scene_buy_confirm", var_25_3, var_25_2:getConfig("name")),
			onYes = function()
				arg_25_0:emit(NewShopMainMediator.BUY_ITEM, arg_25_1.id, 1)
			end
		})
	else
		arg_25_0:emit(NewShopMainMediator.BUY_ITEM, arg_25_1.id, 1)
	end
end

function var_0_0.RemoveTimer(arg_27_0)
	if arg_27_0.timer then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end
end

function var_0_0.AddTimer(arg_28_0)
	local var_28_0 = arg_28_0.shop

	arg_28_0.timer = Timer.New(function()
		if var_28_0:isUpdateGoods() then
			arg_28_0:RemoveTimer()
			arg_28_0:emit(NewShopMainMediator.REFRESH_STREET_SHOP)
		else
			local var_29_0 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_29_1 = var_28_0.nextFlashTime - var_29_0

			arg_28_0.timerText.text = i18n("shop_refresh_time", pg.TimeMgr.GetInstance():DescCDTime(var_29_1))
		end
	end, 1, -1)

	arg_28_0.timer:Start()
	arg_28_0.timer.func()
end

function var_0_0.OnDestroy(arg_30_0)
	arg_30_0:RemoveTimer()
	var_0_0.super.OnDestroy(arg_30_0)
end

return var_0_0
