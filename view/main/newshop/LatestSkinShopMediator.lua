local var_0_0 = class("LatestSkinShopMediator", import("...base.ContextMediator"))

var_0_0.ON_RECORD_ANIM_PREVIEW_BTN = "LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN"
var_0_0.OPEN_ACTIVITY = "LatestSkinShopMediator.OPEN_ACTIVITY"
var_0_0.ON_SHOPPING_BY_ACT = "LatestSkinShopMediator.ON_SHOPPING_BY_ACT"
var_0_0.ON_SHOPPING = "LatestSkinShopMediator.ON_SHOPPING"
var_0_0.ON_ITEM_PURCHASE = "LatestSkinShopMediator.ON_ITEM_PURCHASE"
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
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
			warp = NewShopsScene.TYPE_ACTIVITY,
			actId = arg_7_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_SCENE, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_8_1[1], arg_8_1[2])
	end)
	arg_1_0:bind(var_0_0.ON_BACKYARD_SHOP, function(arg_9_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = NewBackYardShopMediator,
			viewComponent = NewBackYardShopLayer,
			data = {
				topLayer = true,
				page = 5
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_ITEM_EXPERIENCE, function(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			id = arg_10_1,
			count = arg_10_3,
			arg = {
				arg_10_2
			}
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_OWN_SKIN_LAYER, function(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = NewSkinAtlasLayer,
			mediator = NewSkinAtlasMediator
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_GIFT_PACK_LAYER, function(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.PROBABILITY_SKINSHOP, {
			giftPackCommodity = arg_12_1,
			skinCommodities = arg_12_2,
			skinProbabilitys = arg_12_3
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_BIRTHDAY, function(arg_13_0, arg_13_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	end)
	arg_1_0:bind(var_0_0.CHARGE, function(arg_14_0, arg_14_1)
		arg_1_0:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_14_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_PANEL, function(arg_15_0, arg_15_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemPanelMediator,
			viewComponent = ChargeItemPanelLayer,
			data = {
				panelConfig = arg_15_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_BOX, function(arg_16_0, arg_16_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemBoxMediator,
			viewComponent = ChargeItemBoxLayer,
			data = {
				panelConfig = arg_16_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.BUY_ITEM, function(arg_17_0, arg_17_1, arg_17_2)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_17_1,
			count = arg_17_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_GIFT_ACT_LAYER, function(arg_18_0, arg_18_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeActGiftMediator,
			viewComponent = ChargeActGiftLayer,
			data = {
				actId = arg_18_1
			}
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_19_0)
	return {
		NewShopMainScene.CLOSE_ALL_LAYER,
		PlayerProxy.UPDATED,
		GAME.SKIN_SHOPPIGN_DONE,
		GAME.SKIN_COUPON_SHOPPING_DONE,
		GAME.BUY_FURNITURE_DONE,
		NewShopMainMediator.NOTI_UPDATE_CURRENT
	}
end

function var_0_0.handleNotification(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1:getName()
	local var_20_1 = arg_20_1:getBody()
	local var_20_2 = arg_20_1:getType()

	if var_20_0 == NewShopMainScene.CLOSE_ALL_LAYER then
		arg_20_0.viewComponent:closeView()
	elseif var_20_0 == PlayerProxy.UPDATED then
		arg_20_0.viewComponent:SetResource()
	elseif var_20_0 == GAME.SKIN_SHOPPIGN_DONE or var_20_0 == GAME.SKIN_COUPON_SHOPPING_DONE then
		local var_20_3 = pg.shop_template[var_20_1.id]

		if var_20_3 and (var_20_3.genre == ShopArgs.SkinShop or var_20_3.genre == ShopArgs.SkinShopTimeLimit) then
			local var_20_4 = var_20_3.effect_args[1]

			if pg.ship_skin_template[var_20_4].skin_type == ShipSkin.SKIN_TYPE_TB then
				arg_20_0:addSubLayers(Context.New({
					mediator = NewSkinTBMediator,
					viewComponent = NewSkinTBLayer,
					data = {
						skinId = var_20_3.effect_args[1],
						timeLimit = var_20_3.genre == ShopArgs.SkinShopTimeLimit
					}
				}))
			else
				local function var_20_5()
					arg_20_0:addSubLayers(Context.New({
						mediator = NewSkinMediator,
						viewComponent = NewSkinLayer,
						data = {
							skinId = var_20_3.effect_args[1],
							timeLimit = var_20_3.genre == ShopArgs.SkinShopTimeLimit
						}
					}))
				end

				if PaintingShowScene.GetSkinShowAble(var_20_4) then
					arg_20_0:addSubLayers(Context.New({
						mediator = PaintingShowMediator,
						viewComponent = PaintingShowScene,
						data = {
							skinId = var_20_4,
							callback = var_20_5
						}
					}))
				else
					var_20_5()
				end
			end

			arg_20_0.viewComponent:OnShopping(var_20_1.id)
			pg.EasyRedDotMgr.GetInstance():TriggerMarks("specialShop")
		end
	elseif var_20_0 == GAME.BUY_FURNITURE_DONE then
		arg_20_0.viewComponent:OnFurnitureUpdate(var_20_2[1])
	elseif var_20_0 == NewShopMainMediator.NOTI_UPDATE_CURRENT then
		arg_20_0.viewComponent:GetAllCommodities()
		arg_20_0.viewComponent:Refresh(true)
	end
end

return var_0_0
