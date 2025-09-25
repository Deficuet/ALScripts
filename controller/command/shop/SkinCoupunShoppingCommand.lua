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

	local var_1_5 = var_1_4:GetPrice()

	if var_1_5 > getProxy(PlayerProxy):getRawData()[id2res(var_1_4:getConfig("resource_type"))] then
		GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)

		return
	end

	local var_1_6 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SKIN_COUPON)

	if not var_1_6 or var_1_6:isEnd() then
		return
	end

	local var_1_7 = var_1_4:getSkinId()
	local var_1_8 = getProxy(ShipSkinProxy)
	local var_1_9 = ShipSkin.New({
		id = var_1_7
	})

	local function var_1_10()
		pg.ConnectionMgr.GetInstance():Send(11202, {
			cmd = 1,
			activity_id = var_1_6.id,
			arg1 = var_1_1,
			arg2 = var_1_2,
			arg_list = {}
		}, 11203, function(arg_4_0)
			if arg_4_0.result == 0 then
				SkinCouponActivity.UseSkinCoupon(var_1_1)
				var_1_8:addSkin(var_1_9)

				local var_4_0 = getProxy(PlayerProxy):getData()

				var_4_0:consume({
					[id2res(var_1_4:getConfig("resource_type"))] = var_1_5
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

	SkinCouponMsgBox.New(pg.UIMgr.GetInstance().OverlayMain):ExecuteAction("Show", {
		skinName = var_1_9.skinName,
		price = var_1_5,
		drop = SkinCouponActivity.StaticGetItemDrop(var_1_1),
		onYes = var_1_10
	})
end

return var_0_0
