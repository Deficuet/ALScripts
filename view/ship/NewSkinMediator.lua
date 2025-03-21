local var_0_0 = class("NewSkinMediator", import("..base.ContextMediator"))

var_0_0.SET_SKIN = "NewSkinMediator:SET_SKIN"
var_0_0.ON_EXIT = "NewSkinMediator:ON_EXIT"

function var_0_0.register(arg_1_0)
	arg_1_0.viewComponent:setSkin(arg_1_0.contextData.skinId)
	arg_1_0:bind(var_0_0.SET_SKIN, function(arg_2_0, arg_2_1, arg_2_2)
		for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
			arg_1_0:sendNotification(GAME.SET_SHIP_SKIN, {
				shipId = iter_2_1,
				skinId = arg_1_0.contextData.skinId
			})
		end

		getProxy(SettingsProxy):SetFlagShip(arg_2_2)

		if arg_2_2 then
			local var_2_0 = arg_2_1[1]

			arg_1_0:sendNotification(GAME.CHANGE_PLAYER_ICON, {
				skinPage = true,
				characterId = var_2_0
			})
		end

		arg_1_0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)

	local var_1_0 = getProxy(BayProxy):getData()

	arg_1_0.viewComponent:setShipVOs(var_1_0)
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()
end

return var_0_0
