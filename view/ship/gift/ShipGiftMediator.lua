local var_0_0 = class("ShipGiftMediator", import("view.base.ContextMediator"))

var_0_0.SHIP_GIFT = "ShipGiftMediator:shipGift"
var_0_0.ADD_SHIP_INTIMACY = "ShipGiftMediator:addShipIntimacy"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.SHIP_GIFT, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			id = arg_2_1,
			count = arg_2_2,
			arg = {
				arg_2_3
			}
		})
	end)
	arg_1_0:bind(var_0_0.ADD_SHIP_INTIMACY, function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_3_1.id

		getProxy(BayProxy):RawGetShipById(var_3_0):addLikability(arg_3_2)
	end)
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		GAME.USE_ITEM_DONE
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == GAME.USE_ITEM_DONE then
		local var_5_2 = var_5_1.drops[1] and var_5_1.drops[1].count or 0

		arg_5_0.viewComponent:OnGiftSuccess(var_5_2)
	end
end

function var_0_0.remove(arg_6_0)
	return
end

return var_0_0
