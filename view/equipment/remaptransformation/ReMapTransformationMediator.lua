local var_0_0 = class("ReMapTransformationMediator", import("view.base.ContextMediator"))

var_0_0.ON_USE_ITEM = "EquipmentMediator:ON_USE_ITEM"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_USE_ITEM, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			id = arg_2_1,
			count = arg_2_2,
			arg = {
				arg_2_3
			}
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_3_0)
	arg_3_0.handleDic = {
		[BagProxy.ITEM_UPDATED] = function(arg_4_0, arg_4_1)
			local var_4_0 = arg_4_1:getBody()
			local var_4_1 = arg_4_0.viewComponent.itemVO

			if var_4_0.id == var_4_1.id then
				if var_4_0.count <= 0 or var_4_1.extra and not getProxy(BagProxy):hasExtraData(var_4_1.id, var_4_1.extra) then
					arg_4_0.viewComponent:closeView()
				else
					arg_4_0.viewComponent:update(Drop.New({
						type = DROP_TYPE_ITEM,
						id = var_4_0.id,
						count = var_4_0.count,
						extra = var_4_0.extra
					}):getSubClass())
				end
			end
		end
	}
end

function var_0_0.remove(arg_5_0)
	return
end

return var_0_0
