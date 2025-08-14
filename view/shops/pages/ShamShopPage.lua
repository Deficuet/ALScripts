local var_0_0 = class("ShamShopPage", import(".BaseShopPage"))

function var_0_0.GetPaintingCommodityUpdateVoice(arg_1_0)
	return
end

function var_0_0.CanOpen(arg_2_0, arg_2_1, arg_2_2)
	return pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_2_2.level, "ShamShop")
end

function var_0_0.OnUpdateItems(arg_3_0)
	arg_3_0:RefreshResItemList()
end

function var_0_0.GetResDataList(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = arg_4_0.shop:GetResList()

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		local var_4_2
		local var_4_3 = arg_4_0.items[ChapterConst.ShamMoneyItem]
		local var_4_4 = not var_4_3 and 0 or var_4_3.count

		table.insert(var_4_0, {
			type = DROP_TYPE_ITEM,
			resID = iter_4_1,
			cnt = var_4_4
		})
	end

	return var_4_0
end

function var_0_0.OnUpdateCommodity(arg_5_0, arg_5_1)
	local var_5_0

	for iter_5_0, iter_5_1 in pairs(arg_5_0.cards) do
		if iter_5_1.goodsVO.id == arg_5_1.id then
			var_5_0 = iter_5_1

			break
		end
	end

	if var_5_0 then
		var_5_0:update(arg_5_1)
	end
end

function var_0_0.RefreshUI(arg_6_0)
	arg_6_0:UpdateTip()
	setActive(arg_6_0.tipTextGo, true)
	setActive(arg_6_0.helpBtn, false)
	setActive(arg_6_0.resolveBtn, false)
	setActive(arg_6_0.refreshBtn, false)
end

function var_0_0.OnInitItem(arg_7_0, arg_7_1)
	local var_7_0 = ActivityGoodsCard.New(arg_7_1)

	onButton(arg_7_0, var_7_0.tf, function()
		if not var_7_0.goodsVO:canPurchase() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

			return
		end

		arg_7_0:OnClickCommodity(var_7_0.goodsVO, function(arg_9_0, arg_9_1)
			arg_7_0:OnPurchase(arg_9_0, arg_9_1)
		end)
	end, SFX_PANEL)

	arg_7_0.cards[arg_7_1] = var_7_0
end

function var_0_0.OnUpdateItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.cards[arg_10_2]

	if not var_10_0 then
		arg_10_0:OnInitItem(arg_10_2)

		var_10_0 = arg_10_0.cards[arg_10_2]
	end

	local var_10_1 = arg_10_0.displays[arg_10_1 + 1]

	var_10_0:update(var_10_1)
end

function var_0_0.OnUpdateAll(arg_11_0)
	arg_11_0:InitCommodities()
	arg_11_0:OnSetUp()
end

function var_0_0.OnSetUp(arg_12_0)
	arg_12_0:UpdateTip()
end

function var_0_0.UpdateTip(arg_13_0)
	setText(arg_13_0.tipText, i18n("title_limit_time") .. i18n("shops_rest_day") .. string.format("%02d", arg_13_0.shop:getRestDays()) .. i18n("word_date"))
end

function var_0_0.OnPurchase(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:emit(NewShopMainMediator.ON_SHAM_SHOPPING, arg_14_1.id, arg_14_2)
end

function var_0_0.OnDestroy(arg_15_0)
	var_0_0.super.OnDestroy(arg_15_0)
end

return var_0_0
