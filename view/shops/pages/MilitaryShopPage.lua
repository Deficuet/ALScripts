local var_0_0 = class("MilitaryShopPage", import(".BaseShopPage"))

function var_0_0.GetPaintingCommodityUpdateVoice(arg_1_0)
	return
end

function var_0_0.CanOpen(arg_2_0, arg_2_1, arg_2_2)
	return pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_2_2.level, "MilitaryExerciseMediator")
end

function var_0_0.OnUpdatePlayer(arg_3_0)
	arg_3_0:RefreshResItemList()
end

function var_0_0.GetResDataList(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = arg_4_0.shop:GetResList()

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		local var_4_2 = arg_4_0.player.exploit

		table.insert(var_4_0, {
			type = DROP_TYPE_RESOURCE,
			resID = iter_4_1,
			cnt = var_4_2
		})
	end

	return var_4_0
end

function var_0_0.OnSetUp(arg_5_0)
	arg_5_0:RemoveTimer()
	arg_5_0:AddTimer()
end

function var_0_0.Hide(arg_6_0)
	var_0_0.super.Hide(arg_6_0)
	arg_6_0:RemoveTimer()
end

function var_0_0.OnUpdateAll(arg_7_0)
	arg_7_0:InitCommodities()
	arg_7_0:OnSetUp()
end

function var_0_0.OnUpdateCommodity(arg_8_0, arg_8_1)
	local var_8_0

	for iter_8_0, iter_8_1 in pairs(arg_8_0.cards) do
		if iter_8_1.goodsVO.id == arg_8_1.id then
			var_8_0 = iter_8_1

			break
		end
	end

	if var_8_0 then
		var_8_0:update(arg_8_1)
	end
end

function var_0_0.RefreshUI(arg_9_0)
	setActive(arg_9_0.tipTextGo, false)
	setActive(arg_9_0.helpBtn, false)
	setActive(arg_9_0.resolveBtn, false)
	setActive(arg_9_0.refreshBtn, true)

	local var_9_0 = pg.arena_data_shop[1]

	onButton(arg_9_0, arg_9_0.refreshBtn, function()
		if arg_9_0.shop.refreshCount - 1 >= #var_9_0.refresh_price then
			pg.TipsMgr.GetInstance():ShowTips(i18n("shopStreet_refresh_max_count"))

			return
		end

		local var_10_0 = var_9_0.refresh_price[arg_9_0.shop.refreshCount] or var_9_0.refresh_price[#var_9_0.refresh_price]

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("refresh_shopStreet_question", i18n("word_gem_icon"), var_10_0, arg_9_0.shop.refreshCount - 1),
			onYes = function()
				if arg_9_0.player:getTotalGem() < var_10_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

					return
				else
					arg_9_0:emit(NewShopMainMediator.REFRESH_MILITARY_SHOP, true)
				end
			end
		})
	end, SFX_PANEL)
	setButtonEnabled(arg_9_0.refreshBtn, true)
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	local var_12_0 = GoodsCard.New(arg_12_1)

	onButton(arg_12_0, var_12_0.go, function()
		if not var_12_0.goodsVO:canPurchase() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

			return
		end

		arg_12_0:OnClickCommodity(var_12_0.goodsVO)
	end, SFX_PANEL)

	arg_12_0.cards[arg_12_1] = var_12_0
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.cards[arg_14_2]

	if not var_14_0 then
		arg_14_0:OnInitItem(arg_14_2)

		var_14_0 = arg_14_0.cards[arg_14_2]
	end

	local var_14_1 = arg_14_0.displays[arg_14_1 + 1]

	var_14_0:update(var_14_1)
end

function var_0_0.OnClickCommodity(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		yesText = "text_exchange",
		type = MSGBOX_TYPE_SINGLE_ITEM,
		drop = {
			id = var_15_0:getConfig("effect_args")[1],
			type = var_15_0:getConfig("type")
		},
		onYes = function()
			arg_15_0:emit(NewShopMainMediator.BUY_ITEM, var_15_0.id, 1)
		end
	})
end

function var_0_0.AddTimer(arg_17_0)
	local var_17_0 = arg_17_0.shop.nextTime + 1

	arg_17_0.timer = Timer.New(function()
		local var_18_0 = var_17_0 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_18_0 <= 0 then
			arg_17_0:RemoveTimer()
			arg_17_0:OnTimeOut()
		else
			local var_18_1 = pg.TimeMgr.GetInstance():DescCDTime(var_18_0)

			arg_17_0.timerText.text = i18n("shop_refresh_time", var_18_1)
		end
	end, 1, -1)

	arg_17_0.timer:Start()
	arg_17_0.timer.func()
end

function var_0_0.OnTimeOut(arg_19_0)
	arg_19_0:emit(NewShopMainMediator.REFRESH_MILITARY_SHOP)
end

function var_0_0.RemoveTimer(arg_20_0)
	if arg_20_0.timer then
		arg_20_0.timer:Stop()

		arg_20_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_21_0)
	var_0_0.super.OnDestroy(arg_21_0)
	arg_21_0:RemoveTimer()
end

return var_0_0
