local var_0_0 = class("ProposeMediator", import("..base.ContextMediator"))

var_0_0.ON_PROPOSE = "ProposeMediator.ON_PROPOSE"
var_0_0.RENAME_SHIP = "ProposeMediator.RENAME_SHIP"
var_0_0.HIDE_SHIP_MAIN_WORD = "ShipMainMediator.HIDE_SHIP_MAIN_WORD"
var_0_0.EXCHANGE_TIARA = "ProposeMediator.EXCHANGE_TIARA"
var_0_0.REGISTER_SHIP = "ProposeMediator.REGISTER_SHIP"
var_0_0.GIFT_SHIP = "ProposeMediaotr.GIFT_SHIP"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(BayProxy)

	if arg_1_0.contextData.shipId then
		local var_1_1 = var_1_0:getShipById(arg_1_0.contextData.shipId)

		arg_1_0.viewComponent:setShip(var_1_1)
	elseif arg_1_0.contextData.review then
		arg_1_0.viewComponent:setShipGroupID(arg_1_0.contextData.group.id)
		arg_1_0.viewComponent:setWeddingReviewSkinID(arg_1_0.contextData.skinID)
	end

	local var_1_2 = getProxy(BagProxy)

	arg_1_0.viewComponent:setBagProxy(var_1_2)

	local var_1_3 = getProxy(PlayerProxy):getData()

	arg_1_0.viewComponent:setPlayer(var_1_3)
	arg_1_0:bind(var_0_0.ON_PROPOSE, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.PROPOSE_SHIP, {
			shipId = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.RENAME_SHIP, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0:sendNotification(GAME.RENAME_SHIP, {
			shipId = arg_3_1,
			name = arg_3_2
		})
	end)
	arg_1_0:bind(var_0_0.HIDE_SHIP_MAIN_WORD, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(GAME.HIDE_Ship_MAIN_SCENE_WORD)
	end)
	arg_1_0:bind(var_0_0.EXCHANGE_TIARA, function(arg_5_0)
		arg_1_0:sendNotification(GAME.PROPOSE_EXCHANGE_RING)
	end)
	arg_1_0:bind(var_0_0.REGISTER_SHIP, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.PROPOSE_REGISTER_SHIP, {
			shipId = arg_6_1
		})
	end)
	arg_1_0:bind(var_0_0.GIFT_SHIP, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIP_GIFT, {
			shipID = arg_7_1
		})
	end)
end

function var_0_0.listNotificationInterests(arg_8_0)
	return {
		GAME.PROPOSE_SHIP_DONE,
		GAME.RENAME_SHIP_DONE,
		GAME.PROPOSE_EXCHANGE_RING_DONE,
		GAME.PROPOSE_REGISTER_SHIP_DONE
	}
end

function var_0_0.handleNotification(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:getName()
	local var_9_1 = arg_9_1:getBody()

	if var_9_0 == GAME.PROPOSE_SHIP_DONE then
		local var_9_2 = var_9_1.ship:getProposeSkin()

		if var_9_2 then
			arg_9_0:sendNotification(GAME.SET_SHIP_SKIN, {
				hideTip = true,
				phantomId = 0,
				shipId = var_9_1.ship.id,
				skinId = var_9_2.id
			})
		end

		arg_9_0.viewComponent:setShip(var_9_1.ship)
		arg_9_0.viewComponent:RingFadeout()
	elseif var_9_0 == GAME.RENAME_SHIP_DONE then
		arg_9_0.viewComponent:closeView()
	elseif var_9_0 == GAME.PROPOSE_EXCHANGE_RING_DONE then
		arg_9_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_9_1.items, function()
			arg_9_0.viewComponent:onUpdateItemCount()
		end)
	elseif var_9_0 == GAME.PROPOSE_REGISTER_SHIP_DONE and arg_9_0.viewComponent.afterRegisterCall then
		arg_9_0.viewComponent.afterRegisterCall()
	end
end

return var_0_0
