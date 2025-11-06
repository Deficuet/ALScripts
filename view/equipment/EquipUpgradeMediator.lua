local var_0_0 = class("EquipUpgradeMediator", import("..base.ContextMediator"))

var_0_0.EQUIPMENT_UPGRDE = "EquipUpgradeMediator:EQUIPMENT_UPGRDE"
var_0_0.REPLACE_EQUIP = "EquipUpgradeMediator:REPLACE_EQUIP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.EQUIPMENT_UPGRDE, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		pg.UIMgr.GetInstance():LoadingOn()
		arg_1_0:sendNotification(GAME.UPGRADE_EQUIPMENTS, {
			shipId = arg_1_0.contextData.shipId,
			pos = arg_1_0.contextData.pos,
			equipmentId = arg_1_0.contextData.equipmentId,
			target = arg_2_1,
			materials = arg_2_2,
			consume = arg_2_3
		})
	end)

	local var_1_0 = arg_1_0.contextData.shipId

	if var_1_0 ~= nil then
		local var_1_1 = getProxy(BayProxy):getShipById(var_1_0)

		arg_1_0.contextData.shipVO = var_1_1
		arg_1_0.contextData.equipmentVO = var_1_1:getEquip(arg_1_0.contextData.pos)
	else
		local var_1_2 = arg_1_0.contextData.equipmentId

		if var_1_2 ~= nil then
			local var_1_3 = getProxy(EquipmentProxy)

			arg_1_0.contextData.equipmentVO = var_1_3:getEquipmentById(var_1_2)
		end
	end
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		GAME.UPGRADE_EQUIPMENTS_DONE
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == GAME.UPGRADE_EQUIPMENTS_DONE then
		local var_4_2 = var_4_1.ship
		local var_4_3 = var_4_1.equip
		local var_4_4 = var_4_1.newEquip

		arg_4_0.contextData.shipVO = var_4_2
		arg_4_0.contextData.equipmentVO = var_4_4

		arg_4_0.viewComponent:updateAll()
		arg_4_0.viewComponent:upgradeFinish(var_4_3, var_4_4)
		pg.UIMgr.GetInstance():LoadingOff()
	end
end

return var_0_0
