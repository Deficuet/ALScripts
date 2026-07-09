local var_0_0 = class("NewShopMainMediator", import("...base.ContextMediator"))

var_0_0.OPEN_LAYER = "NewShopMainMediator.OPEN_LAYER"
var_0_0.SWITCH_TO_SHOP = "NewShopMainMediator.SWITCH_TO_SHOP"
var_0_0.CHARGE = "NewShopMainMediator.CHARGE"
var_0_0.BUY_ITEM = "NewShopMainMediator.BUY_ITEM"
var_0_0.CLICK_MING_SHI = "NewShopMainMediator.CLICK_MING_SHI"
var_0_0.GET_CHARGE_LIST = "NewShopMainMediator.GET_CHARGE_LIST"
var_0_0.OPEN_CHARGE_ITEM_PANEL = "NewShopMainMediator.OPEN_CHARGE_ITEM_PANEL"
var_0_0.OPEN_CHARGE_ITEM_BOX = "NewShopMainMediator.OPEN_CHARGE_ITEM_BOX"
var_0_0.OPEN_CHARGE_BIRTHDAY = "NewShopMainMediator.OPEN_CHARGE_BIRTHDAY"
var_0_0.OPEN_USER_AGREE = "NewShopMainMediator.OPEN_USER_AGREE"
var_0_0.VIEW_SKIN_PROBABILITY = "NewShopMainMediator.VIEW_SKIN_PROBABILITY"
var_0_0.OPEN_TEC_SHIP_GIFT_SELL_LAYER = "NewShopMainMediator.OPEN_TEC_SHIP_GIFT_SELL_LAYER"
var_0_0.OPEN_BATTLE_UI_SELL_LAYER = "NewShopMainMediator.OPEN_BATTLE_UI_SELL_LAYER"
var_0_0.FAST_BUILD_ITEM_ID = 61004
var_0_0.REFRESH_STREET_SHOP = "NewShopMainMediator.REFRESH_STREET_SHOP"
var_0_0.REFRESH_MILITARY_SHOP = "NewShopMainMediator.REFRESH_MILITARY_SHOP"
var_0_0.ON_SHAM_SHOPPING = "NewShopMainMediator.ON_SHAM_SHOPPING"
var_0_0.ON_FRAGMENT_SHOPPING = "NewShopMainMediator.ON_FRAGMENT_SHOPPING"
var_0_0.ON_ACT_SHOPPING = "NewShopMainMediator.ON_ACT_SHOPPING"
var_0_0.SELL_BLUEPRINT = "NewShopMainMediator.SELL_BLUEPRINT"
var_0_0.SET_PLAYER_FLAG = "NewShopMainMediator.SET_PLAYER_FLAG"
var_0_0.ON_GUILD_SHOPPING = "NewShopMainMediator.ON_GUILD_SHOPPING"
var_0_0.ON_MEDAL_SHOPPING = "NewShopMainMediator.ON_MEDAL_SHOPPING"
var_0_0.REFRESH_GUILD_SHOP = "NewShopMainMediator.REFRESH_GUILD_SHOP"
var_0_0.REFRESH_MEDAL_SHOP = "NewShopMainMediator.REFRESH_MEDAL_SHOP"
var_0_0.ON_META_SHOP = "NewShopMainMediator.ON_META_SHOP"
var_0_0.ON_ESKIN_PREVIEW = "NewShopMainMediator.ON_ESKIN_PREVIEW"
var_0_0.ON_QUOTA_SHOPPING = "NewShopMainMediator.ON_QUOTA_SHOPPING"
var_0_0.ON_MINI_GAME_SHOP_BUY = "NewShopMainMediator.ON_MINI_GAME_SHOP_BUY"
var_0_0.ON_MINI_GAME_SHOP_FLUSH = "NewShopMainMediator.ON_MINI_GAME_SHOP_FLUSH"
var_0_0.UR_EXCHANGE_TRACKING = "NewShopMainMediator.UR_EXCHANGE_TRACKING"
var_0_0.ON_ACT_OPERATION = "NewShopMainMediator.ON_ACT_OPERATION"
var_0_0.NOTI_UPDATE_CURRENT = "NewShopMainMediator.NOTI_UPDATE_CURRENT"
var_0_0.OPEN_GIFT_ACT_LAYER = "NewShopMainMediator.OPEN_GIFT_ACT_LAYER"
var_0_0.ON_SUBLAYER_EVENT = "NewShopMainMediator.ON_SUBLAYER_EVENT"

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
	arg_1_0:bind(var_0_0.OPEN_GIFT_ACT_LAYER, function(arg_33_0, arg_33_1)
		arg_1_0:OpenGiftActLayer(arg_33_1)
	end)
end

function var_0_0.OpenGiftActLayer(arg_34_0, arg_34_1)
	local var_34_0 = getProxy(ActivityProxy):getActivityById(arg_34_1)

	switch(var_34_0:getConfig("type"), {
		[ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE] = function()
			arg_34_0.viewComponent:emit(NewShopMainMediator.OPEN_LAYER, ChargeActGiftLayer, ChargeActGiftMediator, {
				actId = var_34_0.id
			})
		end,
		[ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE] = function()
			local var_36_0 = pg.activity_giftpackage[var_34_0:getConfig("config_id")]
			local var_36_1 = Goods.Create({
				id = var_36_0.shop_id
			}, Goods.TYPE_GIFT_PACKAGE_ACT)
			local var_36_2 = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = var_36_1:getConfig("effect_args")[1]
			})
			local var_36_3 = var_36_1:GetPrice()
			local var_36_4 = {}
			local var_36_5 = getProxy(ShipSkinProxy)

			for iter_36_0, iter_36_1 in ipairs(var_36_0.skin) do
				table.insert(var_36_4, Drop.New({
					count = 1,
					type = DROP_TYPE_SKIN,
					id = iter_36_1,
					got = var_36_5:hasNonLimitSkin(iter_36_1),
					special = underscore.any(var_36_0.special_skin, function(arg_37_0)
						return iter_36_1 == arg_37_0
					end)
				}))
			end

			local var_36_6 = {
				isMonthCard = false,
				isChargeType = false,
				isLocalPrice = false,
				commodity = var_36_1,
				icon = var_36_2:getIcon(),
				name = var_36_2:getName(),
				tipExtra = i18n("charge_title_getskin"),
				extraItems = var_36_4,
				descExtra = var_36_0.desc,
				price = var_36_3,
				tagType = var_36_1:getConfig("tag"),
				onYes = function()
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("charge_scene_buy_confirm", var_36_3, var_36_2:getName()),
						onYes = function()
							arg_34_0.viewComponent:emit(NewShopMainMediator.ON_ACT_OPERATION, var_34_0.id, {
								cmd = 1,
								costDrop = Drop.New({
									type = DROP_TYPE_RESOURCE,
									id = PlayerConst.ResDiamond,
									count = var_36_3
								})
							})
						end
					})
				end
			}

			arg_34_0.viewComponent:emit(NewShopMainMediator.OPEN_CHARGE_ITEM_PANEL, var_36_6)
		end
	}, function()
		assert(false)
	end)
end

function var_0_0.initNotificationHandleDic(arg_41_0)
	arg_41_0.handleDic = {
		[NewShopMainScene.SHOW_OR_HIDE_UI] = function(arg_42_0, arg_42_1)
			arg_42_0.viewComponent:ShowOrHideUI(arg_42_1:getBody())
		end,
		[NewShopMainScene.SHOW_OR_HIDE_UI_2] = function(arg_43_0, arg_43_1)
			arg_43_0.viewComponent:ShowOrHideUI2(arg_43_1:getBody())
		end,
		[NewShopMainScene.CLOSE_VIEW] = function(arg_44_0, arg_44_1)
			arg_44_0.viewComponent:closeView()
		end,
		[PlayerProxy.UPDATED] = function(arg_45_0, arg_45_1)
			local var_45_0 = arg_45_1:getBody()

			arg_45_0.viewComponent:setPlayer(var_45_0)
			arg_45_0.viewComponent:updateNoRes()
		end,
		[ShopsProxy.FIRST_CHARGE_IDS_UPDATED] = function(arg_46_0, arg_46_1)
			arg_46_0.viewComponent:setFirstChargeIds(arg_46_1:getBody())
			arg_46_0.viewComponent:updateCurSubView()
		end,
		[ShopsProxy.CHARGED_LIST_UPDATED] = function(arg_47_0, arg_47_1)
			arg_47_0.viewComponent:setChargedList(arg_47_1:getBody())
			arg_47_0.viewComponent:updateCurSubView()
		end,
		[GAME.CHARGE_CONFIRM_FAILED] = function(arg_48_0, arg_48_1)
			local var_48_0 = arg_48_1:getBody()

			getProxy(ShopsProxy):chargeFailed(var_48_0.payId, var_48_0.bsId)
		end,
		[GAME.SHOPPING_DONE] = function(arg_49_0, arg_49_1)
			local var_49_0 = arg_49_1:getBody()
			local var_49_1

			if var_49_0.shopType == ShopArgs.ShopStreet then
				local var_49_2 = getProxy(ShopsProxy):getShopStreet()
				local var_49_3 = var_49_2:getGoodsById(var_49_0.id)

				arg_49_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_SHOP_STREET, var_49_2, var_49_0.id)
			elseif var_49_0.shopType == ShopArgs.MilitaryShop then
				local var_49_4 = getProxy(ShopsProxy):getMeritorousShop()
				local var_49_5 = var_49_4.goods[var_49_0.id]

				arg_49_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_MILITARY_SHOP, var_49_4, var_49_0.id)
			end

			if var_49_0.awards and #var_49_0.awards > 0 then
				arg_49_0.viewComponent:unBlurView()
				arg_49_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_49_0.awards)
			end

			local var_49_6 = var_49_0.normalList
			local var_49_7 = var_49_0.normalGroupList

			if var_49_6 then
				arg_49_0.viewComponent:setNormalList(var_49_6)
			end

			if var_49_7 then
				arg_49_0.viewComponent:setNormalGroupList(var_49_7)
			end

			local var_49_8 = pg.shop_template[var_49_0.id]

			arg_49_0.viewComponent:checkBuyDone(var_49_0.id)
			arg_49_0.viewComponent:updateCurSubView()
			pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
		end,
		[GAME.USE_ITEM_DONE] = function(arg_50_0, arg_50_1)
			local var_50_0 = arg_50_1:getBody()

			if #var_50_0.drops ~= 0 then
				arg_50_0.viewComponent:emit(BaseUI.ON_AWARD, {
					items = var_50_0.drops
				})
			end
		end,
		[GAME.GET_CHARGE_LIST_DONE] = function(arg_51_0, arg_51_1)
			local var_51_0 = arg_51_1:getBody()
			local var_51_1 = var_51_0.firstChargeIds
			local var_51_2 = var_51_0.chargedList
			local var_51_3 = var_51_0.normalList
			local var_51_4 = var_51_0.normalGroupList

			if var_51_1 then
				arg_51_0.viewComponent:setFirstChargeIds(var_51_1)
			end

			if var_51_2 then
				arg_51_0.viewComponent:setChargedList(var_51_2)
			end

			if var_51_3 then
				arg_51_0.viewComponent:setNormalList(var_51_3)
			end

			if var_51_4 then
				arg_51_0.viewComponent:setNormalGroupList(var_51_4)
			end

			if var_51_1 or var_51_2 or var_51_3 or var_51_4 then
				arg_51_0.viewComponent:updateCurSubView()
			end

			pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
		end,
		[GAME.CLICK_MING_SHI_SUCCESS] = function(arg_52_0, arg_52_1)
			arg_52_0.viewComponent:playHeartEffect()
		end,
		[PlayerResUI.GO_MALL] = function(arg_53_0, arg_53_1)
			local var_53_0 = arg_53_1:getBody()
			local var_53_1 = ChargeScene.TYPE_DIAMOND

			if var_53_0 then
				var_53_1 = var_53_0.type or ChargeScene.TYPE_DIAMOND
			end

			arg_53_0.viewComponent:switchSubViewByTogger(var_53_1)
			arg_53_0.viewComponent:updateNoRes(var_53_0 and var_53_0.noRes or nil)
		end,
		[GAME.CHARGE_SUCCESS] = function(arg_54_0, arg_54_1)
			local var_54_0 = arg_54_1:getBody()

			arg_54_0.viewComponent:checkBuyDone("damonds")

			local var_54_1 = Goods.Create({
				shop_id = var_54_0.shopId
			}, Goods.TYPE_CHARGE)

			arg_54_0.viewComponent:OnChargeSuccess(var_54_1)
		end,
		[ShopsProxy.SHOPPINGSTREET_UPDATE] = function(arg_55_0, arg_55_1)
			local var_55_0 = arg_55_1:getBody()

			arg_55_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_SHOP_STREET, var_55_0.shopStreet)
		end,
		[ShopsProxy.MERITOROUS_SHOP_UPDATED] = function(arg_56_0, arg_56_1)
			arg_56_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_MILITARY_SHOP, arg_56_1:getBody())
		end,
		[ShopsProxy.SHAM_SHOP_UPDATED] = function(arg_57_0, arg_57_1)
			arg_57_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_SHAM_SHOP, arg_57_1:getBody())
		end,
		[GAME.SHAM_SHOPPING_DONE] = function(arg_58_0, arg_58_1)
			local var_58_0 = arg_58_1:getBody()
			local var_58_1 = getProxy(ShopsProxy):getShamShop()

			arg_58_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_SHAM_SHOP, var_58_1, var_58_0.id)
			arg_58_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_58_0.awards)
		end,
		[BagProxy.ITEM_UPDATED] = function(arg_59_0, arg_59_1)
			local var_59_0 = getProxy(BagProxy):getRawData()

			arg_59_0.viewComponent:OnUpdateItems(var_59_0)
		end,
		[GAME.FRAG_SHOPPING_DONE] = function(arg_60_0, arg_60_1)
			local var_60_0 = arg_60_1:getBody()
			local var_60_1 = getProxy(ShopsProxy):getFragmentShop()

			arg_60_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_FRAGMENT, var_60_1, var_60_0.id)
			arg_60_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_60_0.awards)
		end,
		[ShopsProxy.FRAGMENT_SHOP_UPDATED] = function(arg_61_0, arg_61_1)
			arg_61_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_FRAGMENT, arg_61_1:getBody())
		end,
		[ShopsProxy.ACTIVITY_SHOP_GOODS_UPDATED] = function(arg_62_0, arg_62_1)
			local var_62_0 = arg_62_1:getBody()
			local var_62_1 = getProxy(ShopsProxy):getActivityShopById(var_62_0.activityId)

			arg_62_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_ACTIVITY, var_62_1, var_62_0.goodsId)
		end,
		[ShopsProxy.META_SHOP_GOODS_UPDATED] = function(arg_63_0, arg_63_1)
			local var_63_0 = arg_63_1:getBody()
			local var_63_1 = getProxy(ShopsProxy):GetMetaShop()

			arg_63_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_META, var_63_1, var_63_0.goodsId)
		end,
		[ShopsProxy.ACTIVITY_SHOP_UPDATED] = function(arg_64_0, arg_64_1)
			local var_64_0 = arg_64_1:getBody()

			arg_64_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_ACTIVITY, var_64_0.shop)
		end,
		[ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS] = function(arg_65_0, arg_65_1)
			local var_65_0 = arg_65_1:getBody()

			arg_65_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_65_0.awards, var_65_0.callback)
		end,
		[GAME.FRAG_SELL_DONE] = function(arg_66_0, arg_66_1)
			local var_66_0 = arg_66_1:getBody()

			arg_66_0.viewComponent:OnFragmentSellUpdate()
			arg_66_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_66_0.awards)
		end,
		[GAME.ON_GUILD_SHOP_PURCHASE_DONE] = function(arg_67_0, arg_67_1)
			local var_67_0 = arg_67_1:getBody()

			arg_67_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_67_0.awards)
		end,
		[GAME.ON_MEDAL_SHOP_PURCHASE_DONE] = function(arg_68_0, arg_68_1)
			local var_68_0 = arg_68_1:getBody()

			arg_68_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_68_0.awards)
		end,
		[ShopsProxy.GUILD_SHOP_UPDATED] = function(arg_69_0, arg_69_1)
			local var_69_0 = arg_69_1:getBody()

			arg_69_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_GUILD, var_69_0.shop)
		end,
		[ShopsProxy.GUILD_SHOP_ADDED] = function(arg_70_0, arg_70_1)
			local var_70_0 = arg_70_1:getBody()

			arg_70_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_GUILD, var_70_0.shop)
		end,
		[ShopsProxy.MEDAL_SHOP_UPDATED] = function(arg_71_0, arg_71_1)
			arg_71_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_MEDAL, arg_71_1:getBody())
		end,
		[GAME.ON_META_SHOPPING_DONE] = function(arg_72_0, arg_72_1)
			local var_72_0 = arg_72_1:getBody()

			arg_72_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_72_0.awards)
		end,
		[ShopsProxy.QUOTA_SHOP_UPDATED] = function(arg_73_0, arg_73_1)
			local var_73_0 = arg_73_1:getBody()

			arg_73_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_QUOTA, var_73_0.shop)
		end,
		[GAME.QUOTA_SHOPPING_DONE] = function(arg_74_0, arg_74_1)
			local var_74_0 = arg_74_1:getBody()
			local var_74_1 = getProxy(ShopsProxy):getQuotaShop()

			arg_74_0.viewComponent:OnUpdateCommodity(NewShopsScene.TYPE_QUOTA, var_74_1, var_74_0.id)
			arg_74_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_74_0.awards)
		end,
		[GAME.MINI_GAME_SHOP_BUY_DONE] = function(arg_75_0, arg_75_1)
			local var_75_0 = arg_75_1:getBody().list

			if var_75_0 and #var_75_0 > 0 then
				arg_75_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_75_0)
			end

			local var_75_1 = getProxy(ShopsProxy):getMiniShop()

			arg_75_0.viewComponent:OnUpdateShop(NewShopsScene.TYPE_MINI_GAME, var_75_1)
		end,
		[var_0_0.NOTI_UPDATE_CURRENT] = function(arg_76_0, arg_76_1)
			arg_76_0.viewComponent:updateCurSubView()
			pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
		end,
		[var_0_0.ON_SUBLAYER_EVENT] = function(arg_77_0, arg_77_1)
			local var_77_0 = arg_77_1:getBody()

			arg_77_0.viewComponent:emit(unpackEx(var_77_0))
		end
	}
end

return var_0_0
