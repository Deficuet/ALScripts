local var_0_0 = class("SkinCoupunShoppingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.shopId
	local var_1_2 = var_1_0.cnt
	local var_1_3 = getProxy(ShipSkinProxy):GetAllSkins()
	local var_1_4 = _.detect(var_1_3, function(arg_2_0)
		return arg_2_0.id == var_1_1
	end)

	if not var_1_4 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_shopId_noFound"))

		return
	end

	if not var_1_4:canPurchase() then
		return
	end

	local var_1_5 = var_1_4:getSkinId()
	local var_1_6 = getProxy(ShipSkinProxy)
	local var_1_7 = ShipSkin.New({
		id = var_1_5
	})

	local function var_1_8(arg_3_0)
		local var_3_0 = var_1_4:getConfig("resource_num") - arg_3_0.discount

		if var_3_0 > getProxy(PlayerProxy):getRawData()[id2res(var_1_4:getConfig("resource_type"))] then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)

			return
		end

		pg.ConnectionMgr.GetInstance():Send(11202, {
			cmd = 1,
			activity_id = arg_3_0.actId,
			arg1 = var_1_1,
			arg2 = var_1_2,
			arg_list = {}
		}, 11203, function(arg_4_0)
			if arg_4_0.result == 0 then
				SkinCouponActivity.UseSkinCoupon(arg_3_0.actId)
				var_1_6:addSkin(var_1_7)

				local var_4_0 = getProxy(PlayerProxy):getData()

				var_4_0:consume({
					[id2res(var_1_4:getConfig("resource_type"))] = var_3_0
				})
				getProxy(PlayerProxy):updatePlayer(var_4_0)
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_buy_success"))
				arg_1_0:sendNotification(GAME.SKIN_COUPON_SHOPPING_DONE, {
					id = var_1_1,
					awards = {}
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_4_0.result] .. arg_4_0.result)
			end
		end)
	end

	local var_1_9 = {}
	local var_1_10 = SkinCouponActivity.GetSkinCouponActivities(var_1_1)

	if #var_1_10 == 0 then
		return
	end

	table.sort(var_1_10, CompareFuncs({
		function(arg_5_0)
			return -arg_5_0:GetDiscountPrice()
		end,
		function(arg_6_0)
			return arg_6_0.id
		end
	}))

	for iter_1_0, iter_1_1 in ipairs(var_1_10) do
		if iter_1_1:GetCanUsageCnt() > 0 then
			table.insert(var_1_9, {
				actId = iter_1_1.id,
				drop = Drop.New({
					count = 1,
					type = DROP_TYPE_VITEM,
					id = iter_1_1:GetItemId()
				}),
				discount = iter_1_1:GetDiscountPrice()
			})
		end
	end

	if SkinCouponActivity.GetSkinCouponTotalCnt(var_1_1) <= 1 then
		var_1_8(var_1_9[1])

		return
	end

	arg_1_0:sendNotification(GAME.OPEN_SKIN_COUPON_MULTI_MSG_BOX, {
		itemList = var_1_9,
		unuseItemList = var_0_0.GetAllSkinCouponList(var_1_1),
		skinId = var_1_5,
		skinName = var_1_7.skinName,
		price = var_1_4:getConfig("resource_num"),
		onYes = var_1_8
	})
end

function var_0_0.GetAllSkinCouponList(arg_7_0)
	local var_7_0 = var_0_0.GetActivitySkinCouponList(arg_7_0)
	local var_7_1 = var_0_0.GetSkinCouponList()

	table.insertto(var_7_0, var_7_1)
	table.sort(var_7_0, CompareFuncs({
		function(arg_8_0)
			return -arg_8_0.discount
		end,
		function(arg_9_0)
			return arg_9_0.id
		end
	}))

	return var_7_0
end

function var_0_0.GetActivitySkinCouponList(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = {}

	for iter_10_0, iter_10_1 in ipairs(pg.activity_template.get_id_list_by_type[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON] or {}) do
		local var_10_2 = getProxy(ActivityProxy):RawGetActivityById(iter_10_1)

		if var_10_2 and not var_10_2:isEnd() and not var_10_2:IncludeShop(arg_10_0) then
			table.insert(var_10_1, var_10_2)
		end
	end

	for iter_10_2, iter_10_3 in ipairs(var_10_1) do
		if iter_10_3:GetCanUsageCnt() > 0 then
			table.insert(var_10_0, {
				actId = iter_10_3.id,
				drop = Drop.New({
					count = 1,
					type = DROP_TYPE_VITEM,
					id = iter_10_3:GetItemId()
				}),
				discount = iter_10_3:GetDiscountPrice()
			})
		end
	end

	return var_10_0
end

function var_0_0.GetSkinCouponList()
	local var_11_0 = var_0_0.GetVoucherDropList()
	local var_11_1 = var_0_0.GetExclusiveDiscountDropList()

	if #var_11_0 <= 0 and #var_11_1 <= 0 then
		return {}
	end

	local var_11_2 = {}

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		table.insert(var_11_2, iter_11_1)
	end

	for iter_11_2, iter_11_3 in ipairs(var_11_1) do
		table.insert(var_11_2, iter_11_3.id)
	end

	return var_11_2
end

function var_0_0.GetVoucherDropList()
	local var_12_0 = {}
	local var_12_1 = getProxy(BagProxy):GetSkinShopDiscountItemList()

	for iter_12_0, iter_12_1 in pairs(var_12_1) do
		table.insert(var_12_0, {
			drop = {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = iter_12_1.id
			},
			discount = iter_12_1:getConfig("usage_arg")[2]
		})
	end

	return var_12_0
end

function var_0_0.GetExclusiveDiscountDropList()
	local var_13_0 = {}
	local var_13_1 = getProxy(BagProxy)

	for iter_13_0, iter_13_1 in pairs(var_13_1:getRawData()) do
		table.insert(var_13_0, {
			drop = {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = iter_13_1.id
			},
			discount = iter_13_1:getConfig("usage_arg")[2]
		})
	end

	return var_13_0
end

return var_0_0
