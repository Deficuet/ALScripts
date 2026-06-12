local var_0_0 = class("NewShopMainMediator", import("...base.ContextMediator"))

var_0_0.OPEN_LAYER = "NewShopMainMediator.OPEN_LAYER"
var_0_0.SWITCH_TO_SHOP = "NewShopMainMediator:SWITCH_TO_SHOP"
var_0_0.CHARGE = "NewShopMainMediator:CHARGE"
var_0_0.BUY_ITEM = "NewShopMainMediator:BUY_ITEM"
var_0_0.CLICK_MING_SHI = "NewShopMainMediator:CLICK_MING_SHI"
var_0_0.GET_CHARGE_LIST = "NewShopMainMediator:GET_CHARGE_LIST"
var_0_0.OPEN_CHARGE_ITEM_PANEL = "NewShopMainMediator:OPEN_CHARGE_ITEM_PANEL"
var_0_0.OPEN_CHARGE_ITEM_BOX = "NewShopMainMediator:OPEN_CHARGE_ITEM_BOX"
var_0_0.OPEN_CHARGE_BIRTHDAY = "NewShopMainMediator:OPEN_CHARGE_BIRTHDAY"
var_0_0.OPEN_USER_AGREE = "NewShopMainMediator:OPEN_USER_AGREE"
var_0_0.VIEW_SKIN_PROBABILITY = "NewShopMainMediator:VIEW_SKIN_PROBABILITY"
var_0_0.OPEN_TEC_SHIP_GIFT_SELL_LAYER = "NewShopMainMediator:OPEN_TEC_SHIP_GIFT_SELL_LAYER"
var_0_0.OPEN_BATTLE_UI_SELL_LAYER = "NewShopMainMediator:OPEN_BATTLE_UI_SELL_LAYER"
var_0_0.FAST_BUILD_ITEM_ID = 61004
var_0_0.REFRESH_STREET_SHOP = "NewShopMainMediator:REFRESH_STREET_SHOP"
var_0_0.REFRESH_MILITARY_SHOP = "NewShopMainMediator:REFRESH_MILITARY_SHOP"
var_0_0.ON_SHAM_SHOPPING = "NewShopMainMediator:ON_SHAM_SHOPPING"
var_0_0.ON_FRAGMENT_SHOPPING = "NewShopMainMediator:ON_FRAGMENT_SHOPPING"
var_0_0.ON_ACT_SHOPPING = "NewShopMainMediator:ON_ACT_SHOPPING"
var_0_0.SELL_BLUEPRINT = "NewShopMainMediator:SELL_BLUEPRINT"
var_0_0.SET_PLAYER_FLAG = "NewShopMainMediator:SET_PLAYER_FLAG"
var_0_0.ON_GUILD_SHOPPING = "NewShopMainMediator:ON_GUILD_SHOPPING"
var_0_0.ON_MEDAL_SHOPPING = "NewShopMainMediator:ON_MEDAL_SHOPPING"
var_0_0.REFRESH_GUILD_SHOP = "NewShopMainMediator:REFRESH_GUILD_SHOP"
var_0_0.REFRESH_MEDAL_SHOP = "NewShopMainMediator:REFRESH_MEDAL_SHOP"
var_0_0.ON_META_SHOP = "NewShopMainMediator:ON_META_SHOP"
var_0_0.ON_ESKIN_PREVIEW = "NewShopMainMediator:ON_ESKIN_PREVIEW"
var_0_0.ON_QUOTA_SHOPPING = "NewShopMainMediator:ON_QUOTA_SHOPPING"
var_0_0.ON_MINI_GAME_SHOP_BUY = "NewShopMainMediator:ON_MINI_GAME_SHOP_BUY"
var_0_0.ON_MINI_GAME_SHOP_FLUSH = "NewShopMainMediator:ON_MINI_GAME_SHOP_FLUSH"
var_0_0.UR_EXCHANGE_TRACKING = "NewShopMainMediator:UR_EXCHANGE_TRACKING"
var_0_0.ON_ACT_OPERATION = "NewShopMainMediator.ON_ACT_OPERATION"
var_0_0.NOTI_UPDATE_CURRENT = "NewShopMainMediator.NOTI_UPDATE_CURRENT"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_LAYER, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = arg_2_1,
			mediator = arg_2_2,
			data = arg_2_3
		}))
	end)

	local var_1_0 = getProxy(PlayerProxy):getData()

	arg_1_0.viewComponent:setPlayer(var_1_0)
	arg_1_0.viewComponent:SetSupplyShopList(arg_1_0.contextData.supplyShopList)
	arg_1_0.viewComponent:OnInitItems(getProxy(BagProxy):getRawData())
	arg_1_0:bind(var_0_0.VIEW_SKIN_PROBABILITY, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0.contextData.warp = arg_3_2

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.PROBABILITY_SKINSHOP, {
			commodityId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.GET_CHARGE_LIST, function(arg_4_0)
		arg_1_0:sendNotification(GAME.GET_CHARGE_LIST)
	end)
	arg_1_0:bind(var_0_0.SWITCH_TO_SHOP, function(arg_5_0, arg_5_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_5_1)
	end)
	arg_1_0:bind(var_0_0.CHARGE, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_6_1
		})
	end)
	arg_1_0:bind(var_0_0.BUY_ITEM, function(arg_7_0, arg_7_1, arg_7_2)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_7_1,
			count = arg_7_2
		})
	end)
	arg_1_0:bind(var_0_0.CLICK_MING_SHI, function(arg_8_0)
		arg_1_0:sendNotification(GAME.CLICK_MING_SHI)
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_PANEL, function(arg_9_0, arg_9_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemPanelMediator,
			viewComponent = ChargeItemPanelLayer,
			data = {
				panelConfig = arg_9_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_BOX, function(arg_10_0, arg_10_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemBoxMediator,
			viewComponent = ChargeItemBoxLayer,
			data = {
				panelConfig = arg_10_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_BIRTHDAY, function(arg_11_0, arg_11_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_USER_AGREE, function(arg_12_0, arg_12_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeJPUserAgreeMediator,
			viewComponent = ChargeJPUserAgreeLayer,
			data = {
				contentStr = arg_12_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_TEC_SHIP_GIFT_SELL_LAYER, function(arg_13_0, arg_13_1, arg_13_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeTecShipGiftSellMediator,
			viewComponent = ChargeTecShipGiftSellLayer,
			data = {
				showGoodVO = arg_13_1,
				chargedList = arg_13_2
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_BATTLE_UI_SELL_LAYER, function(arg_14_0, arg_14_1, arg_14_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBattleUISellMediator,
			viewComponent = ChargeBattleUISellLayer,
			data = {
				showGoodVO = arg_14_1,
				chargedList = arg_14_2
			}
		}))
	end)
	arg_1_0:bind(var_0_0.REFRESH_STREET_SHOP, function(arg_15_0, arg_15_1)
		if not arg_15_1 then
			arg_1_0:sendNotification(GAME.GET_SHOPSTREET)
		else
			arg_1_0:sendNotification(GAME.SHOPPING, {
				count = 1,
				id = arg_15_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.REFRESH_MILITARY_SHOP, function(arg_16_0, arg_16_1)
		if not arg_16_1 then
			arg_1_0:sendNotification(GAME.GET_MILITARY_SHOP)
		else
			arg_1_0:sendNotification(GAME.REFRESH_MILITARY_SHOP)
		end
	end)
	arg_1_0:bind(var_0_0.ON_SHAM_SHOPPING, function(arg_17_0, arg_17_1, arg_17_2)
		arg_1_0:sendNotification(GAME.SHAM_SHOPPING, {
			id = arg_17_1,
			count = arg_17_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_FRAGMENT_SHOPPING, function(arg_18_0, arg_18_1, arg_18_2)
		arg_1_0:sendNotification(GAME.FRAG_SHOPPING, {
			id = arg_18_1,
			count = arg_18_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACT_SHOPPING, function(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, {
			activity_id = arg_19_1,
			cmd = arg_19_2,
			arg1 = arg_19_3,
			arg2 = arg_19_4
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACT_OPERATION, function(arg_20_0, arg_20_1, arg_20_2)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, setmetatable({
			activity_id = arg_20_1
		}, {
			__index = arg_20_2
		}))
	end)
	arg_1_0:bind(var_0_0.SELL_BLUEPRINT, function(arg_21_0, arg_21_1)
		arg_1_0:sendNotification(GAME.FRAG_SELL, arg_21_1)
	end)
	arg_1_0:bind(var_0_0.SET_PLAYER_FLAG, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_2 then
			arg_1_0:sendNotification(GAME.COMMON_FLAG, {
				flagID = arg_22_1
			})
		else
			arg_1_0:sendNotification(GAME.CANCEL_COMMON_FLAG, {
				flagID = arg_22_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.ON_GUILD_SHOPPING, function(arg_23_0, arg_23_1, arg_23_2)
		arg_1_0:sendNotification(GAME.ON_GUILD_SHOP_PURCHASE, {
			goodsId = arg_23_1,
			selectedId = arg_23_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_MEDAL_SHOPPING, function(arg_24_0, arg_24_1, arg_24_2)
		arg_1_0:sendNotification(GAME.ON_MEDAL_SHOP_PURCHASE, {
			goodsId = arg_24_1,
			selectedId = arg_24_2
		})
	end)
	arg_1_0:bind(var_0_0.REFRESH_GUILD_SHOP, function(arg_25_0, arg_25_1)
		local var_25_0 = arg_25_1 and GuildConst.MANUAL_REFRESH or GuildConst.AUTO_REFRESH

		arg_1_0:sendNotification(GAME.GET_GUILD_SHOP, {
			type = var_25_0
		})
	end)
	arg_1_0:bind(var_0_0.REFRESH_MEDAL_SHOP, function(arg_26_0)
		arg_1_0:sendNotification(GAME.GET_MEDALSHOP, {})
	end)
	arg_1_0:bind(var_0_0.ON_META_SHOP, function(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5)
		arg_1_0:sendNotification(GAME.ON_META_SHOPPING, {
			activity_id = arg_27_1,
			cmd = arg_27_2,
			arg1 = arg_27_3,
			arg2 = arg_27_4,
			kvargs1 = arg_27_5
		})
	end)
	arg_1_0:bind(var_0_0.ON_ESKIN_PREVIEW, function(arg_28_0, arg_28_1)
		local var_28_0 = pg.equip_skin_template[arg_28_1]
		local var_28_1 = Ship.New({
			id = var_28_0.ship_config_id,
			configId = var_28_0.ship_config_id,
			skin_id = var_28_0.ship_skin_id
		})
		local var_28_2 = {}

		if var_28_0.ship_skin_id ~= 0 then
			var_28_2 = {
				equipSkinId = 0,
				shipVO = var_28_1,
				weaponIds = {}
			}
		else
			var_28_2 = {
				shipVO = var_28_1,
				weaponIds = Clone(var_28_0.weapon_ids),
				equipSkinId = arg_28_1
			}
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = ShipPreviewLayer,
			mediator = ShipPreviewMediator,
			data = var_28_2
		}))
	end)
	arg_1_0:bind(var_0_0.ON_QUOTA_SHOPPING, function(arg_29_0, arg_29_1, arg_29_2)
		arg_1_0:sendNotification(GAME.QUOTA_SHOPPING, {
			id = arg_29_1,
			count = arg_29_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_MINI_GAME_SHOP_BUY, function(arg_30_0, arg_30_1, arg_30_2)
		arg_1_0:sendNotification(GAME.MINI_GAME_SHOP_BUY, arg_30_1)
	end)
	arg_1_0:bind(var_0_0.ON_MINI_GAME_SHOP_FLUSH, function(arg_31_0, arg_31_1, arg_31_2)
		arg_1_0:sendNotification(GAME.MINI_GAME_SHOP_FLUSH, arg_31_1)
	end)
	arg_1_0:bind(var_0_0.UR_EXCHANGE_TRACKING, function(arg_32_0, arg_32_1)
		local var_32_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE)

		if var_32_0 and not var_32_0:isEnd() and getProxy(ShopsProxy):getActivityShopById(var_32_0:getConfig("config_client").shopId):GetCommodityById(var_32_0:getConfig("config_client").goodsId[1]):getConfig("commodity_id") == arg_32_1 then
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildUrRedeem(arg_32_1, 1))
		end
	end)
end

function var_0_0.listNotificationInterests(arg_33_0)
	return {
		NewShopMainScene.SHOW_OR_HIDE_UI,
		NewShopMainScene.SHOW_OR_HIDE_UI_2,
		NewShopMainScene.CLOSE_VIEW,
		PlayerProxy.UPDATED,
		ShopsProxy.FIRST_CHARGE_IDS_UPDATED,
		ShopsProxy.CHARGED_LIST_UPDATED,
		GAME.CHARGE_CONFIRM_FAILED,
		GAME.GET_CHARGE_LIST_DONE,
		GAME.SHOPPING_DONE,
		GAME.USE_ITEM_DONE,
		GAME.CLICK_MING_SHI_SUCCESS,
		GAME.REMOVE_LAYERS,
		PlayerResUI.GO_MALL,
		GAME.CHARGE_SUCCESS,
		ShopsProxy.SHOPPINGSTREET_UPDATE,
		ShopsProxy.MERITOROUS_SHOP_UPDATED,
		ShopsProxy.SHAM_SHOP_UPDATED,
		GAME.SHAM_SHOPPING_DONE,
		BagProxy.ITEM_UPDATED,
		GAME.FRAG_SHOPPING_DONE,
		ShopsProxy.FRAGMENT_SHOP_UPDATED,
		ShopsProxy.ACTIVITY_SHOP_GOODS_UPDATED,
		ShopsProxy.ACTIVITY_SHOP_UPDATED,
		GAME.FRAG_SELL_DONE,
		ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS,
		GAME.USE_ITEM_DONE,
		GAME.ON_GUILD_SHOP_PURCHASE_DONE,
		GAME.ON_MEDAL_SHOP_PURCHASE_DONE,
		ShopsProxy.GUILD_SHOP_UPDATED,
		ShopsProxy.GUILD_SHOP_ADDED,
		ShopsProxy.MEDAL_SHOP_UPDATED,
		GAME.ON_META_SHOPPING_DONE,
		ShopsProxy.META_SHOP_GOODS_UPDATED,
		ShopsProxy.QUOTA_SHOP_UPDATED,
		GAME.QUOTA_SHOPPING_DONE,
		GAME.MINI_GAME_SHOP_BUY_DONE,
		var_0_0.NOTI_UPDATE_CURRENT
	}
end

function var_0_0.handleNotification(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_1:getName()
	local var_34_1 = arg_34_1:getBody()

	if var_34_0 == NewShopMainScene.SHOW_OR_HIDE_UI then
		arg_34_0.viewComponent:ShowOrHideUI(var_34_1)
	elseif var_34_0 == NewShopMainScene.SHOW_OR_HIDE_UI_2 then
		arg_34_0.viewComponent:ShowOrHideUI2(var_34_1)
	elseif var_34_0 == NewShopMainScene.CLOSE_VIEW then
		arg_34_0.viewComponent:closeView()
	elseif var_34_0 == PlayerProxy.UPDATED then
		arg_34_0.viewComponent:setPlayer(var_34_1)
		arg_34_0.viewComponent:updateNoRes()
	elseif var_34_0 == ShopsProxy.FIRST_CHARGE_IDS_UPDATED then
		arg_34_0.viewComponent:setFirstChargeIds(var_34_1)
		arg_34_0.viewComponent:updateCurSubView()
	elseif var_34_0 == ShopsProxy.CHARGED_LIST_UPDATED then
		arg_34_0.viewComponent:setChargedList(var_34_1)
		arg_34_0.viewComponent:updateCurSubView()
	elseif var_34_0 == GAME.CHARGE_CONFIRM_FAILED then
		getProxy(ShopsProxy):chargeFailed(var_34_1.payId, var_34_1.bsId)
	elseif var_34_0 == GAME.SHOPPING_DONE then
		local var_34_2

		if var_34_1.shopType == ShopArgs.ShopStreet then
			local var_34_3 = getProxy(ShopsProxy):getShopStreet()
			local var_34_4 = var_34_3:getGoodsById(var_34_1.id)

			arg_34_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_SHOP_STREET, var_34_3, var_34_1.id)
		elseif var_34_1.shopType == ShopArgs.MilitaryShop then
			local var_34_5 = getProxy(ShopsProxy):getMeritorousShop()
			local var_34_6 = var_34_5.goods[var_34_1.id]

			arg_34_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_MILITARY_SHOP, var_34_5, var_34_1.id)
		end

		if var_34_1.awards and #var_34_1.awards > 0 then
			arg_34_0.viewComponent:unBlurView()
			arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
		end

		local var_34_7 = var_34_1.normalList
		local var_34_8 = var_34_1.normalGroupList

		if var_34_7 then
			arg_34_0.viewComponent:setNormalList(var_34_7)
		end

		if var_34_8 then
			arg_34_0.viewComponent:setNormalGroupList(var_34_8)
		end

		local var_34_9 = pg.shop_template[var_34_1.id]

		arg_34_0.viewComponent:checkBuyDone(var_34_1.id)
		arg_34_0.viewComponent:updateCurSubView()
		pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
	elseif var_34_0 == GAME.USE_ITEM_DONE then
		if #var_34_1.drops ~= 0 then
			arg_34_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_34_1.drops
			})
		end
	elseif var_34_0 == GAME.GET_CHARGE_LIST_DONE then
		local var_34_10 = var_34_1.firstChargeIds
		local var_34_11 = var_34_1.chargedList
		local var_34_12 = var_34_1.normalList
		local var_34_13 = var_34_1.normalGroupList

		if var_34_10 then
			arg_34_0.viewComponent:setFirstChargeIds(var_34_10)
		end

		if var_34_11 then
			arg_34_0.viewComponent:setChargedList(var_34_11)
		end

		if var_34_12 then
			arg_34_0.viewComponent:setNormalList(var_34_12)
		end

		if var_34_13 then
			arg_34_0.viewComponent:setNormalGroupList(var_34_13)
		end

		if var_34_10 or var_34_11 or var_34_12 or var_34_13 then
			arg_34_0.viewComponent:updateCurSubView()
		end

		pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
	elseif var_34_0 == GAME.CLICK_MING_SHI_SUCCESS then
		arg_34_0.viewComponent:playHeartEffect()
	elseif var_34_0 == PlayerResUI.GO_MALL then
		local var_34_14 = ChargeScene.TYPE_DIAMOND

		if var_34_1 then
			var_34_14 = var_34_1.type or ChargeScene.TYPE_DIAMOND
		end

		arg_34_0.viewComponent:switchSubViewByTogger(var_34_14)
		arg_34_0.viewComponent:updateNoRes(var_34_1 and var_34_1.noRes or nil)
	elseif var_34_0 == GAME.CHARGE_SUCCESS then
		arg_34_0.viewComponent:checkBuyDone("damonds")

		local var_34_15 = Goods.Create({
			shop_id = var_34_1.shopId
		}, Goods.TYPE_CHARGE)

		arg_34_0.viewComponent:OnChargeSuccess(var_34_15)
	elseif var_34_0 == ShopsProxy.SHOPPINGSTREET_UPDATE then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_SHOP_STREET, var_34_1.shopStreet)
	elseif var_34_0 == ShopsProxy.MERITOROUS_SHOP_UPDATED then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_MILITARY_SHOP, var_34_1)
	elseif var_34_0 == ShopsProxy.SHAM_SHOP_UPDATED then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_SHAM_SHOP, var_34_1)
	elseif var_34_0 == GAME.SHAM_SHOPPING_DONE then
		local var_34_16 = getProxy(ShopsProxy):getShamShop()

		arg_34_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_SHAM_SHOP, var_34_16, var_34_1.id)
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
	elseif var_34_0 == BagProxy.ITEM_UPDATED then
		local var_34_17 = getProxy(BagProxy):getRawData()

		arg_34_0.viewComponent:OnUpdateItems(var_34_17)
	elseif var_34_0 == GAME.FRAG_SHOPPING_DONE then
		local var_34_18 = getProxy(ShopsProxy):getFragmentShop()

		arg_34_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_FRAGMENT, var_34_18, var_34_1.id)
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
	elseif var_34_0 == ShopsProxy.FRAGMENT_SHOP_UPDATED then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_FRAGMENT, var_34_1)
	elseif var_34_0 == ShopsProxy.ACTIVITY_SHOP_GOODS_UPDATED then
		local var_34_19 = getProxy(ShopsProxy):getActivityShopById(var_34_1.activityId)

		arg_34_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_ACTIVITY, var_34_19, var_34_1.goodsId)
	elseif var_34_0 == ShopsProxy.META_SHOP_GOODS_UPDATED then
		local var_34_20 = getProxy(ShopsProxy):GetMetaShop()

		arg_34_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_META, var_34_20, var_34_1.goodsId)
	elseif var_34_0 == ShopsProxy.ACTIVITY_SHOP_UPDATED then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_ACTIVITY, var_34_1.shop)
	elseif var_34_0 == ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS then
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards, var_34_1.callback)
	elseif var_34_0 == GAME.USE_ITEM_DONE then
		if #var_34_1.drops ~= 0 then
			arg_34_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_34_1.drops
			})
		end
	elseif var_34_0 == GAME.FRAG_SELL_DONE then
		arg_34_0.viewComponent:OnFragmentSellUpdate()
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
	elseif var_34_0 == GAME.ON_GUILD_SHOP_PURCHASE_DONE then
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
	elseif var_34_0 == GAME.ON_MEDAL_SHOP_PURCHASE_DONE then
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
	elseif var_34_0 == ShopsProxy.GUILD_SHOP_UPDATED or var_34_0 == ShopsProxy.GUILD_SHOP_ADDED then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_GUILD, var_34_1.shop)
	elseif var_34_0 == ShopsProxy.MEDAL_SHOP_UPDATED then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_MEDAL, var_34_1)
	elseif var_34_0 == GAME.ON_META_SHOPPING_DONE then
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
	elseif var_34_0 == ShopsProxy.QUOTA_SHOP_UPDATED then
		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_QUOTA, var_34_1.shop)
	elseif var_34_0 == GAME.QUOTA_SHOPPING_DONE then
		local var_34_21 = getProxy(ShopsProxy):getQuotaShop()

		arg_34_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_QUOTA, var_34_21, var_34_1.id)
		arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_1.awards)
	elseif var_34_0 == GAME.MINI_GAME_SHOP_BUY_DONE then
		local var_34_22 = var_34_1.list

		if var_34_22 and #var_34_22 > 0 then
			arg_34_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_34_22)
		end

		local var_34_23 = getProxy(ShopsProxy):getMiniShop()

		arg_34_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_MINI_GAME, var_34_23)
	elseif var_34_0 == var_0_0.NOTI_UPDATE_CURRENT then
		arg_34_0.viewComponent:updateCurSubView()
		pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
	end
end

return var_0_0
