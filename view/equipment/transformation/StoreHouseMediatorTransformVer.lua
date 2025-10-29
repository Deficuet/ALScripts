local var_0_0 = class("StoreHouseMediatorTransformVer", import("view.base.ContextMediator"))

var_0_0.ON_DESTROY = "EquipmentMediator:ON_DESTROY"
var_0_0.ON_UNEQUIP_EQUIPMENT = "EquipmentMediator:ON_UNEQUIP_EQUIPMENT"
var_0_0.OPEN_DESIGN = "EquipmentMediator:OPEN_DESIGN"
var_0_0.CLOSE_DESIGN_LAYER = "EquipmentMediator:CLOSE_DESIGN_LAYER"
var_0_0.BATCHDESTROY_MODE = "EquipmentMediator:BATCHDESTROY_MODE"
var_0_0.ON_EQUIPMENT_SKIN_INFO = "EquipmentMediator:ON_EQUIPMENT_SKIN_INFO"
var_0_0.ON_UNEQUIP_EQUIPMENT_SKIN = "EquipmentMediator:ON_UNEQUIP_EQUIPMENT_SKIN"
var_0_0.ON_USE_ITEM = "EquipmentMediator:ON_USE_ITEM"
var_0_0.NO_UPDATE = "EquipmentMediator:NO_UPDATE"
var_0_0.ITEM_GO_SCENE = "item go scene"
var_0_0.OPEN_EQUIPSKIN_INDEX_LAYER = "EquipmentMediator:OPEN_EQUIPSKIN_INDEX_LAYER"
var_0_0.OPEN_EQUIPMENT_INDEX = "OPEN_EQUIPMENT_INDEX"

function var_0_0.register(arg_1_0)
	if not arg_1_0.contextData.warp then
		local var_1_0 = getProxy(SettingsProxy):getEquipSceneIndex()

		arg_1_0.contextData.warp = var_1_0
	end

	arg_1_0:bind(var_0_0.ITEM_GO_SCENE, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_2_1, arg_2_2)
	end)
	arg_1_0:bind(var_0_0.ON_USE_ITEM, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			id = arg_3_1,
			count = arg_3_2,
			arg = arg_3_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_DESTROY, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.DESTROY_EQUIPMENTS, {
			equipments = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UNEQUIP_EQUIPMENT, function(arg_5_0)
		arg_1_0:sendNotification(GAME.UNEQUIP_FROM_SHIP, {
			shipId = arg_1_0.contextData.shipId,
			pos = arg_1_0.contextData.pos
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_DESIGN, function(arg_6_0)
		if getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(EquipmentDesignMediator) then
			return
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = EquipmentDesignLayer,
			mediator = EquipmentDesignMediator,
			data = {
				groupName = arg_1_0.viewComponent:getGroupName()
			}
		}))
	end)
	arg_1_0:bind(var_0_0.CLOSE_DESIGN_LAYER, function(arg_7_0)
		local var_7_0 = getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(EquipmentDesignMediator)

		if var_7_0 then
			arg_1_0:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_7_0
			})
		end
	end)
	arg_1_0:bind(var_0_0.ON_EQUIPMENT_SKIN_INFO, function(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
		arg_1_0:addSubLayers(Context.New({
			mediator = EquipmentSkinMediator,
			viewComponent = EquipmentSkinLayer,
			data = {
				skinId = arg_8_1,
				shipId = arg_1_0.contextData.shipId,
				mode = arg_1_0.contextData.shipId and EquipmentSkinLayer.REPLACE or EquipmentSkinLayer.DISPLAY,
				oldShipInfo = arg_8_3,
				pos = arg_8_2
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_UNEQUIP_EQUIPMENT_SKIN, function(arg_9_0)
		arg_1_0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP, {
			equipmentSkinId = 0,
			shipId = arg_1_0.contextData.shipId,
			pos = arg_1_0.contextData.pos
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_EQUIPSKIN_INDEX_LAYER, function(arg_10_0, arg_10_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = IndexMediator,
			viewComponent = IndexLayer,
			data = arg_10_1
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_EQUIPMENT_INDEX, function(arg_11_0, arg_11_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = CustomIndexLayer,
			mediator = CustomIndexMediator,
			data = arg_11_1
		}))
	end)

	arg_1_0.canUpdate = true

	arg_1_0.viewComponent:OnMediatorRegister()

	arg_1_0.equipmentProxy = getProxy(EquipmentProxy)

	local var_1_1 = arg_1_0.contextData.sourceVOs

	arg_1_0.viewComponent:setSources(var_1_1)
end

function var_0_0.listNotificationInterests(arg_12_0)
	return {
		PlayerProxy.UPDATED,
		var_0_0.NO_UPDATE
	}
end

function var_0_0.handleNotification(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:getName()
	local var_13_1 = arg_13_1:getBody()

	if var_13_0 == var_0_0.NO_UPDATE then
		arg_13_0.canUpdate = false
	end
end

function var_0_0.remove(arg_14_0)
	getProxy(SettingsProxy):setEquipSceneIndex(arg_14_0.contextData.warp)
end

return var_0_0
