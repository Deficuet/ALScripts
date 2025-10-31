local var_0_0 = class("EquipUpgradeMediator", import("..base.ContextMediator"))

var_0_0.EQUIPMENT_UPGRDE = "EquipUpgradeMediator:EQUIPMENT_UPGRDE"
var_0_0.REPLACE_EQUIP = "EquipUpgradeMediator:REPLACE_EQUIP"
var_0_0.ON_ITEM = "EquipUpgradeMediator:ON_ITEM"

function var_0_0.register(arg_1_0)
	arg_1_0.bagProxy = getProxy(BagProxy)

	local var_1_0 = arg_1_0.bagProxy:getData()

	arg_1_0.viewComponent:setItems(var_1_0)

	local var_1_1 = getProxy(PlayerProxy)

	arg_1_0.viewComponent:updateRes(var_1_1:getData())
	arg_1_0:bind(var_0_0.EQUIPMENT_UPGRDE, function(arg_2_0)
		pg.UIMgr.GetInstance():LoadingOn()
		arg_1_0:sendNotification(GAME.UPGRADE_EQUIPMENTS, {
			shipId = arg_1_0.contextData.shipId,
			pos = arg_1_0.contextData.pos,
			equipmentId = arg_1_0.contextData.equipmentId
		})
	end)
	arg_1_0:bind(var_0_0.ON_ITEM, function(arg_3_0, arg_3_1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = "",
			yesText = "text_confirm",
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_3_1,
				cfg = Item.getConfigData(arg_3_1)
			}
		})
	end)

	local var_1_2 = arg_1_0.contextData.shipId

	if var_1_2 ~= nil then
		local var_1_3 = getProxy(BayProxy):getShipById(var_1_2)

		arg_1_0.contextData.shipVO = var_1_3
		arg_1_0.contextData.equipmentVO = var_1_3:getEquip(arg_1_0.contextData.pos)
	else
		local var_1_4 = arg_1_0.contextData.equipmentId

		if var_1_4 ~= nil then
			local var_1_5 = getProxy(EquipmentProxy)

			arg_1_0.contextData.equipmentVO = var_1_5:getEquipmentById(var_1_4)
		end
	end
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		GAME.UPGRADE_EQUIPMENTS_DONE,
		BagProxy.ITEM_UPDATED,
		PlayerProxy.UPDATED
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == GAME.UPGRADE_EQUIPMENTS_DONE then
		local var_5_2 = var_5_1.ship
		local var_5_3 = var_5_1.equip
		local var_5_4 = var_5_1.newEquip

		arg_5_0.contextData.shipVO = var_5_2
		arg_5_0.contextData.equipmentVO = var_5_4

		arg_5_0.viewComponent:updateAll()
		arg_5_0.viewComponent:upgradeFinish(var_5_3, var_5_4)
		pg.UIMgr.GetInstance():LoadingOff()
	elseif var_5_0 == BagProxy.ITEM_UPDATED then
		arg_5_0.viewComponent:setItems(arg_5_0.bagProxy:getData())
	elseif var_5_0 == PlayerProxy.UPDATED then
		local var_5_5 = getProxy(PlayerProxy)

		arg_5_0.viewComponent:updateRes(var_5_5:getData())
	end
end

return var_0_0
