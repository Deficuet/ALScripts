local var_0_0 = class("EquipmentDesignMediator", import("..base.ContextMediator"))

var_0_0.MAKE_EQUIPMENT = "EquipmentDesignMediator:MAKE_EQUIPMENT"
var_0_0.OPEN_EQUIPMENTDESIGN_INDEX = "EquipmentDesignMediator:OPEN_EQUIPMENTDESIGN_INDEX"

function var_0_0.register(arg_1_0)
	arg_1_0.bagProxy = getProxy(BagProxy)

	arg_1_0.viewComponent:setItems(arg_1_0.bagProxy:getData())

	arg_1_0.equipmentProxy = getProxy(EquipmentProxy)

	local var_1_0 = arg_1_0.equipmentProxy:getCapacity()

	arg_1_0.viewComponent:setCapacity(var_1_0)

	arg_1_0.playerProxy = getProxy(PlayerProxy)

	local var_1_1 = arg_1_0.playerProxy:getData()

	arg_1_0.viewComponent:setPlayer(var_1_1)

	local var_1_2 = arg_1_0:getFacade():retrieveMediator(EquipmentMediator.__cname):getViewComponent()

	arg_1_0.viewComponent:SetParentTF(var_1_2._tf)
	arg_1_0.viewComponent:SetTopContainer(var_1_2.topPanel)
	arg_1_0:bind(var_0_0.MAKE_EQUIPMENT, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.COMPOSITE_EQUIPMENT, {
			id = arg_2_1,
			count = arg_2_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_EQUIPMENTDESIGN_INDEX, function(arg_3_0, arg_3_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = CustomIndexLayer,
			mediator = CustomIndexMediator,
			data = arg_3_1
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		GAME.COMPOSITE_EQUIPMENT_DONE,
		BagProxy.ITEM_UPDATED,
		PlayerProxy.UPDATED,
		EquipmentProxy.EQUIPMENT_UPDATED,
		GAME.TOGGLE_ALL_DESIGN_EQUIPMENT
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == GAME.COMPOSITE_EQUIPMENT_DONE then
		local var_5_2 = var_5_1.equipment
		local var_5_3 = var_5_1.count

		arg_5_0.viewComponent:filter(arg_5_0.contextData.index or 1, true)

		local var_5_4 = var_5_2:getConfig("name")

		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_newEquipLayer_getNewEquip", var_5_4 .. " X" .. var_5_3))
	elseif var_5_0 == BagProxy.ITEM_UPDATED then
		arg_5_0.viewComponent:setItems(arg_5_0.bagProxy:getData())
	elseif var_5_0 == PlayerProxy.UPDATED then
		arg_5_0.viewComponent:setPlayer(arg_5_0.playerProxy:getData())
	elseif var_5_0 == EquipmentProxy.EQUIPMENT_UPDATED then
		arg_5_0.viewComponent:setCapacity(arg_5_0.equipmentProxy:getCapacity())
	elseif var_5_0 == GAME.TOGGLE_ALL_DESIGN_EQUIPMENT then
		arg_5_0.contextData.isShowAllDesign = var_5_1

		arg_5_0.viewComponent:filter(arg_5_0.contextData.index or 1, true)
	end
end

return var_0_0
