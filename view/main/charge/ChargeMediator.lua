local var_0_0 = class("ChargeMediator", import("...base.ContextMediator"))

var_0_0.SWITCH_TO_SHOP = "ChargeMediator:SWITCH_TO_SHOP"
var_0_0.CHARGE = "ChargeMediator:CHARGE"
var_0_0.BUY_ITEM = "ChargeMediator:BUY_ITEM"
var_0_0.CLICK_MING_SHI = "ChargeMediator:CLICK_MING_SHI"
var_0_0.GET_CHARGE_LIST = "ChargeMediator:GET_CHARGE_LIST"
var_0_0.ON_SKIN_SHOP = "ChargeMediator:ON_SKIN_SHOP"
var_0_0.OPEN_CHARGE_ITEM_PANEL = "ChargeMediator:OPEN_CHARGE_ITEM_PANEL"
var_0_0.OPEN_CHARGE_ITEM_BOX = "ChargeMediator:OPEN_CHARGE_ITEM_BOX"
var_0_0.OPEN_CHARGE_BIRTHDAY = "ChargeMediator:OPEN_CHARGE_BIRTHDAY"
var_0_0.OPEN_USER_AGREE = "ChargeMediator:OPEN_USER_AGREE"
var_0_0.VIEW_SKIN_PROBABILITY = "ChargeMediator:VIEW_SKIN_PROBABILITY"
var_0_0.OPEN_TEC_SHIP_GIFT_SELL_LAYER = "ChargeMediator:OPEN_TEC_SHIP_GIFT_SELL_LAYER"
var_0_0.OPEN_BATTLE_UI_SELL_LAYER = "ChargeMediator:OPEN_BATTLE_UI_SELL_LAYER"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(PlayerProxy):getData()

	arg_1_0.viewComponent:setPlayer(var_1_0)
	arg_1_0.viewComponent:checkFreeGiftTag()
	arg_1_0:bind(var_0_0.VIEW_SKIN_PROBABILITY, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0.contextData.wrap = arg_2_2

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.PROBABILITY_SKINSHOP, {
			commodityId = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.GET_CHARGE_LIST, function(arg_3_0)
		arg_1_0:sendNotification(GAME.GET_CHARGE_LIST)
	end)
	arg_1_0:bind(var_0_0.ON_SKIN_SHOP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP)
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
end

function var_0_0.listNotificationInterests(arg_15_0)
	return {
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
		GAME.CHARGE_SUCCESS
	}
end

function var_0_0.handleNotification(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1:getName()
	local var_16_1 = arg_16_1:getBody()

	if var_16_0 == PlayerProxy.UPDATED then
		arg_16_0.viewComponent:setPlayer(var_16_1)
		arg_16_0.viewComponent:updateNoRes()
	elseif var_16_0 == ShopsProxy.FIRST_CHARGE_IDS_UPDATED then
		arg_16_0.viewComponent:setFirstChargeIds(var_16_1)
		arg_16_0.viewComponent:updateCurSubView()
	elseif var_16_0 == ShopsProxy.CHARGED_LIST_UPDATED then
		arg_16_0.viewComponent:setChargedList(var_16_1)
		arg_16_0.viewComponent:updateCurSubView()
	elseif var_16_0 == GAME.CHARGE_CONFIRM_FAILED then
		getProxy(ShopsProxy):chargeFailed(var_16_1.payId, var_16_1.bsId)
	elseif var_16_0 == GAME.SHOPPING_DONE then
		if var_16_1.awards and #var_16_1.awards > 0 then
			arg_16_0.viewComponent:unBlurView()
			arg_16_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_16_1.awards
			})
		end

		local var_16_2 = var_16_1.normalList
		local var_16_3 = var_16_1.normalGroupList

		if var_16_2 then
			arg_16_0.viewComponent:setNormalList(var_16_2)
		end

		if var_16_3 then
			arg_16_0.viewComponent:setNormalGroupList(var_16_3)
		end

		local var_16_4 = pg.shop_template[var_16_1.id]

		arg_16_0.viewComponent:checkBuyDone(var_16_1.id)
		arg_16_0.viewComponent:updateCurSubView()
		arg_16_0.viewComponent:checkFreeGiftTag()
	elseif var_16_0 == GAME.USE_ITEM_DONE then
		if #var_16_1.drops ~= 0 then
			arg_16_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_16_1.drops
			})
		end
	elseif var_16_0 == GAME.GET_CHARGE_LIST_DONE then
		local var_16_5 = var_16_1.firstChargeIds
		local var_16_6 = var_16_1.chargedList
		local var_16_7 = var_16_1.normalList
		local var_16_8 = var_16_1.normalGroupList

		if var_16_5 then
			arg_16_0.viewComponent:setFirstChargeIds(var_16_5)
		end

		if var_16_6 then
			arg_16_0.viewComponent:setChargedList(var_16_6)
		end

		if var_16_7 then
			arg_16_0.viewComponent:setNormalList(var_16_7)
		end

		if var_16_8 then
			arg_16_0.viewComponent:setNormalGroupList(var_16_8)
		end

		if var_16_5 or var_16_6 or var_16_7 or var_16_8 then
			arg_16_0.viewComponent:updateCurSubView()
		end

		arg_16_0.viewComponent:checkFreeGiftTag()
	elseif var_16_0 == GAME.CLICK_MING_SHI_SUCCESS then
		arg_16_0.viewComponent:playHeartEffect()
	elseif var_16_0 == PlayerResUI.GO_MALL then
		local var_16_9 = ChargeScene.TYPE_DIAMOND

		if var_16_1 then
			var_16_9 = var_16_1.type or ChargeScene.TYPE_DIAMOND
		end

		arg_16_0.viewComponent:switchSubViewByTogger(var_16_9)
		arg_16_0.viewComponent:updateNoRes(var_16_1 and var_16_1.noRes or nil)
	elseif var_16_0 == GAME.CHARGE_SUCCESS then
		arg_16_0.viewComponent:checkBuyDone("damonds")

		local var_16_10 = Goods.Create({
			shop_id = var_16_1.shopId
		}, Goods.TYPE_CHARGE)

		arg_16_0.viewComponent:OnChargeSuccess(var_16_10)
	end
end

return var_0_0
