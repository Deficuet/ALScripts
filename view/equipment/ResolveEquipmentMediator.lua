local var_0_0 = class("ResolveEquipmentMediator", import("..base.ContextMediator"))

var_0_0.ON_RESOLVE = "ResolveEquipmentMediator:ON_RESOLVE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_RESOLVE, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.DESTROY_EQUIPMENTS, {
			equipments = arg_2_1
		})
	end)

	local var_1_0 = getProxy(PlayerProxy):getData()

	arg_1_0.viewComponent:setPlayer(var_1_0)

	local var_1_1 = arg_1_0.contextData.Equipments

	assert(var_1_1, "equipmentVOs can not be nil")
	arg_1_0.viewComponent:setEquipments(var_1_1)
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		GAME.DESTROY_EQUIPMENTS_DONE,
		GAME.CANCEL_LIMITED_OPERATION
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == GAME.DESTROY_EQUIPMENTS_DONE then
		arg_4_0.viewComponent:HideDestroyCondirm()

		local var_4_2 = getProxy(ContextProxy):getCurrentContext()

		if var_4_2 and var_4_2.mediator.__cname ~= "EquipmentMediator" and table.getCount(var_4_1) ~= 0 then
			arg_4_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_4_1,
				title = AwardInfoLayer.TITLE.ITEM,
				removeFunc = function()
					arg_4_0.viewComponent:OnResolveEquipDone()
				end
			})
		else
			arg_4_0.viewComponent:OnResolveEquipDone()
		end
	elseif var_4_0 == GAME.CANCEL_LIMITED_OPERATION then
		-- block empty
	end
end

return var_0_0
