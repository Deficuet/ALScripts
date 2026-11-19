local var_0_0 = class("LatestSkinShopMediator", import("...base.ContextMediator"))

var_0_0.ON_RECORD_ANIM_PREVIEW_BTN = "LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN"
var_0_0.OPEN_ACTIVITY = "LatestSkinShopMediator.OPEN_ACTIVITY"
var_0_0.ON_SHOPPING_BY_ACT = "LatestSkinShopMediator.ON_SHOPPING_BY_ACT"
var_0_0.ON_SHOPPING = "LatestSkinShopMediator.ON_SHOPPING"
var_0_0.ON_ITEM_PURCHASE = "LatestSkinShopMediator.ON_ITEM_PURCHASE"
var_0_0.ON_ITEM_PURCHASE_4_MESHIMAGE = "LatestSkinShopMediator.ON_ITEM_PURCHASE_4_MESHIMAGE"
var_0_0.GO_SHOPS_LAYER = "LatestSkinShopMediator.GO_SHOPS_LAYER"
var_0_0.OPEN_SCENE = "LatestSkinShopMediator.OPEN_SCENE"
var_0_0.ON_BACKYARD_SHOP = "LatestSkinShopMediator.ON_BACKYARD_SHOP"
var_0_0.ON_ITEM_EXPERIENCE = "LatestSkinShopMediator.ON_ITEM_EXPERIENCE"
var_0_0.OPEN_OWN_SKIN_LAYER = "LatestSkinShopMediator.OPEN_OWN_SKIN_LAYER"
var_0_0.OPEN_GIFT_PACK_LAYER = "LatestSkinShopMediator.OPEN_GIFT_PACK_LAYER"
var_0_0.OPEN_CHARGE_BIRTHDAY = "LatestSkinShopMediator:OPEN_CHARGE_BIRTHDAY"
var_0_0.CHARGE = "LatestSkinShopMediator:CHARGE"
var_0_0.OPEN_CHARGE_ITEM_PANEL = "LatestSkinShopMediator:OPEN_CHARGE_ITEM_PANEL"
var_0_0.OPEN_CHARGE_ITEM_BOX = "LatestSkinShopMediator:OPEN_CHARGE_ITEM_BOX"
var_0_0.BUY_ITEM = "LatestSkinShopMediator:BUY_ITEM"
var_0_0.OPEN_GIFT_ACT_LAYER = "LatestSkinShopMediator.OPEN_GIFT_ACT_LAYER"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_RECORD_ANIM_PREVIEW_BTN, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.RECORD_SKIN_ANIM_PREVIEW, {
			isOpen = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_ACTIVITY, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SHOPPING_BY_ACT, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(GAME.SKIN_COUPON_SHOPPING, {
			shopId = arg_4_1,
			cnt = arg_4_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_SHOPPING, function(arg_5_0, arg_5_1, arg_5_2)
		arg_1_0:sendNotification(GAME.SKIN_SHOPPIGN, {
			id = arg_5_1,
			count = arg_5_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_ITEM_PURCHASE, function(arg_6_0, arg_6_1, arg_6_2)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			count = 1,
			id = arg_6_1,
			arg = {
				arg_6_2
			}
		})
	end)
	arg_1_0:bind(var_0_0.ON_ITEM_PURCHASE_4_MESHIMAGE, function(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			count = 1,
			id = arg_7_1,
			arg = {
				arg_7_2,
				arg_7_3
			}
		})
	end)
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
			warp = NewShopsScene.TYPE_ACTIVITY,
			actId = arg_8_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_SCENE, function(arg_9_0, arg_9_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_9_1[1], arg_9_1[2])
	end)
	arg_1_0:bind(var_0_0.ON_BACKYARD_SHOP, function(arg_10_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = NewBackYardShopMediator,
			viewComponent = NewBackYardShopLayer,
			data = {
				topLayer = true,
				page = 5
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_ITEM_EXPERIENCE, function(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			id = arg_11_1,
			count = arg_11_3,
			arg = {
				arg_11_2
			}
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_OWN_SKIN_LAYER, function(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = NewSkinAtlasLayer,
			mediator = NewSkinAtlasMediator
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_GIFT_PACK_LAYER, function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.PROBABILITY_SKINSHOP, {
			giftPackCommodity = arg_13_1,
			skinCommodities = arg_13_2,
			skinProbabilitys = arg_13_3
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_BIRTHDAY, function(arg_14_0, arg_14_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	end)
	arg_1_0:bind(var_0_0.CHARGE, function(arg_15_0, arg_15_1)
		arg_1_0:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_15_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_PANEL, function(arg_16_0, arg_16_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemPanelMediator,
			viewComponent = ChargeItemPanelLayer,
			data = {
				panelConfig = arg_16_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_BOX, function(arg_17_0, arg_17_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemBoxMediator,
			viewComponent = ChargeItemBoxLayer,
			data = {
				panelConfig = arg_17_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.BUY_ITEM, function(arg_18_0, arg_18_1, arg_18_2)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_18_1,
			count = arg_18_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_GIFT_ACT_LAYER, function(arg_19_0, arg_19_1)
		arg_1_0:sendNotification(NewShopMainMediator.ON_SUBLAYER_EVENT, {
			NewShopMainMediator.OPEN_GIFT_ACT_LAYER,
			arg_19_1
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_20_0)
	arg_20_0.handleDic = {
		[NewShopMainScene.CLOSE_ALL_LAYER] = function(arg_21_0, arg_21_1)
			arg_21_0.viewComponent:closeView()
		end,
		[PlayerProxy.UPDATED] = function(arg_22_0, arg_22_1)
			arg_22_0.viewComponent:SetResource()
		end,
		[GAME.SKIN_SHOPPIGN_DONE] = function(arg_23_0, arg_23_1)
			local var_23_0 = arg_23_1:getBody()
			local var_23_1 = ShopConst.GetShopConfig(var_23_0.id)

			if var_23_1 and (var_23_1.genre == ShopArgs.SkinShop or var_23_1.genre == ShopArgs.SkinShopTimeLimit) then
				local var_23_2 = var_23_1.effect_args[1]
				local var_23_3 = var_23_1.genre == ShopArgs.SkinShopTimeLimit

				arg_23_0:HandleNewSkin(var_23_0.id, var_23_2, var_23_3)
			end
		end,
		[GAME.SKIN_BY_CHARGE_DONE] = function(arg_24_0, arg_24_1)
			local var_24_0 = arg_24_1:getBody()
			local var_24_1 = arg_24_0.viewComponent.commodities or {}
			local var_24_2 = 0

			for iter_24_0, iter_24_1 in ipairs(var_24_1) do
				if var_24_0.skinId == iter_24_1:getSkinId() then
					var_24_2 = iter_24_1.id

					break
				end
			end

			print(var_24_0.skinId, var_24_2)

			if var_24_2 > 0 then
				arg_24_0:HandleNewSkin(var_24_2, var_24_0.skinId, false)
			end
		end,
		[GAME.SKIN_COUPON_SHOPPING_DONE] = GAME.SKIN_SHOPPIGN_DONE,
		[GAME.BUY_FURNITURE_DONE] = function(arg_25_0, arg_25_1)
			local var_25_0 = arg_25_1:getType()

			arg_25_0.viewComponent:OnFurnitureUpdate(var_25_0[1])
		end,
		[NewShopMainMediator.NOTI_UPDATE_CURRENT] = function(arg_26_0, arg_26_1)
			arg_26_0.viewComponent:GetAllCommodities()
			arg_26_0.viewComponent:Refresh(true)
		end,
		[GAME.CHARGE_OPERATION_DONE] = function(arg_27_0, arg_27_1)
			local var_27_0 = arg_27_1:getBody().shopId

			if not getProxy(ShopsProxy):IsSkinTypeCharge(var_27_0) then
				arg_27_0.viewComponent:closeView()
			end
		end,
		[GAME.OPEN_SKIN_COUPON_MULTI_MSG_BOX] = function(arg_28_0, arg_28_1)
			arg_28_0.viewComponent:OnOpenSkinCouponMultiMsgBox(arg_28_1:getBody())
		end
	}
end

function var_0_0.HandleNewSkin(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if pg.ship_skin_template[arg_29_2].skin_type == ShipSkin.SKIN_TYPE_TB then
		arg_29_0:addSubLayers(Context.New({
			mediator = NewSkinTBMediator,
			viewComponent = NewSkinTBLayer,
			data = {
				skinId = arg_29_2,
				timeLimit = arg_29_3
			}
		}))
	elseif PaintingShowScene.GetSkinShowAble(arg_29_2) then
		arg_29_0:addSubLayers(Context.New({
			mediator = PaintingShowMediator,
			viewComponent = PaintingShowNewSkinScene,
			data = {
				is_shop = true,
				skinId = arg_29_2,
				timeLimit = arg_29_3
			}
		}))
	else
		arg_29_0:addSubLayers(Context.New({
			mediator = NewSkinMediator,
			viewComponent = NewSkinLayer,
			data = {
				skinId = arg_29_2,
				timeLimit = arg_29_3
			}
		}))
	end

	arg_29_0.viewComponent:OnShopping(arg_29_1)
	pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
end

return var_0_0
