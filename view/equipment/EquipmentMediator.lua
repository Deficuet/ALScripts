local var_0_0 = class("EquipmentMediator", import("..base.ContextMediator"))

var_0_0.ON_DESTROY = "EquipmentMediator:ON_DESTROY"
var_0_0.ON_UNEQUIP_EQUIPMENT = "EquipmentMediator:ON_UNEQUIP_EQUIPMENT"
var_0_0.OPEN_DESIGN = "EquipmentMediator:OPEN_DESIGN"
var_0_0.CLOSE_DESIGN_LAYER = "EquipmentMediator:CLOSE_DESIGN_LAYER"
var_0_0.OPEN_SPWEAPON_DESIGN = "EquipmentMediator:OPEN_SPWEAPON_DESIGN"
var_0_0.CLOSE_SPWEAPON_DESIGN_LAYER = "EquipmentMediator:CLOSE_SPWEAPON_DESIGN_LAYER"
var_0_0.BATCHDESTROY_MODE = "EquipmentMediator:BATCHDESTROY_MODE"
var_0_0.SWITCH_TO_SPWEAPON_PAGE = "EquipmentMediator:SWITCH_TO_SPWEAPON_PAGE"
var_0_0.ON_EQUIPMENT_SKIN_INFO = "EquipmentMediator:ON_EQUIPMENT_SKIN_INFO"
var_0_0.ON_UNEQUIP_EQUIPMENT_SKIN = "EquipmentMediator:ON_UNEQUIP_EQUIPMENT_SKIN"
var_0_0.ON_USE_ITEM = "EquipmentMediator:ON_USE_ITEM"
var_0_0.NO_UPDATE = "EquipmentMediator:NO_UPDATE"
var_0_0.ITEM_GO_SCENE = "item go scene"
var_0_0.ITEM_ADD_LAYER = "EquipmentMediator.ITEM_ADD_LAYER"
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
	arg_1_0:bind(var_0_0.ITEM_ADD_LAYER, function(arg_3_0, arg_3_1)
		arg_1_0:addSubLayers(arg_3_1)
	end)
	arg_1_0:bind(var_0_0.ON_USE_ITEM, function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		arg_1_0:sendNotification(GAME.USE_ITEM, {
			id = arg_4_1,
			count = arg_4_2,
			arg = arg_4_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_DESTROY, function(arg_5_0, arg_5_1)
		arg_1_0:sendNotification(GAME.DESTROY_EQUIPMENTS, {
			equipments = arg_5_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UNEQUIP_EQUIPMENT, function(arg_6_0)
		arg_1_0.canUpdate = false

		arg_1_0:sendNotification(GAME.UNEQUIP_FROM_SHIP, {
			shipId = arg_1_0.contextData.shipId,
			pos = arg_1_0.contextData.pos
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_DESIGN, function(arg_7_0)
		if getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(EquipmentDesignMediator) then
			return
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = EquipmentDesignLayer,
			mediator = EquipmentDesignMediator,
			data = {
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			}
		}))
	end)
	arg_1_0:bind(var_0_0.CLOSE_DESIGN_LAYER, function(arg_8_0)
		local var_8_0 = getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(EquipmentDesignMediator)

		if var_8_0 then
			arg_1_0:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_8_0
			})
		end
	end)
	arg_1_0:bind(var_0_0.OPEN_SPWEAPON_DESIGN, function(arg_9_0)
		if getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(SpWeaponDesignMediator) then
			return
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = SpWeaponDesignLayer,
			mediator = SpWeaponDesignMediator,
			data = {
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			}
		}))
	end)
	arg_1_0:bind(var_0_0.CLOSE_SPWEAPON_DESIGN_LAYER, function(arg_10_0)
		local var_10_0 = getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(SpWeaponDesignMediator)

		if var_10_0 then
			arg_1_0:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_10_0
			})
		end
	end)
	arg_1_0:bind(var_0_0.ON_EQUIPMENT_SKIN_INFO, function(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
		arg_1_0:addSubLayers(Context.New({
			mediator = EquipmentSkinMediator,
			viewComponent = EquipmentSkinLayer,
			data = {
				skinId = arg_11_1,
				shipId = arg_1_0.contextData.shipId,
				mode = arg_1_0.contextData.shipId and EquipmentSkinLayer.REPLACE or EquipmentSkinLayer.DISPLAY,
				oldShipInfo = arg_11_3,
				pos = arg_11_2
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_UNEQUIP_EQUIPMENT_SKIN, function(arg_12_0)
		arg_1_0.canUpdate = false

		arg_1_0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP, {
			equipmentSkinId = 0,
			shipId = arg_1_0.contextData.shipId,
			pos = arg_1_0.contextData.pos
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_EQUIPSKIN_INDEX_LAYER, function(arg_13_0, arg_13_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = IndexMediator,
			viewComponent = IndexLayer,
			data = arg_13_1
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_EQUIPMENT_INDEX, function(arg_14_0, arg_14_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = CustomIndexLayer,
			mediator = CustomIndexMediator,
			data = arg_14_1
		}))
	end)

	arg_1_0.canUpdate = true

	local var_1_1 = getProxy(BayProxy)
	local var_1_2 = var_1_1:getShipById(arg_1_0.contextData.shipId)

	arg_1_0.viewComponent:setShip(var_1_2)

	if var_1_2 then
		if arg_1_0.contextData.mode == StoreHouseConst.EQUIPMENT then
			local var_1_3 = var_1_2:getEquip(arg_1_0.contextData.pos)

			arg_1_0.contextData.qiutBtn = defaultValue(var_1_3, nil)
		elseif arg_1_0.contextData.mode == StoreHouseConst.SKIN then
			local var_1_4 = var_1_2:getEquipSkin(arg_1_0.contextData.pos) ~= 0

			arg_1_0.contextData.qiutBtn = var_1_4
		end
	end

	arg_1_0.equipmentProxy = getProxy(EquipmentProxy)

	local var_1_5

	if arg_1_0.contextData.equipmentVOs then
		var_1_5 = arg_1_0.contextData.equipmentVOs
	else
		var_1_5 = arg_1_0.equipmentProxy:getEquipments(true)

		for iter_1_0, iter_1_1 in ipairs(var_1_1:getEquipsInShips()) do
			table.insert(var_1_5, iter_1_1)
		end

		for iter_1_2, iter_1_3 in pairs(arg_1_0.equipmentProxy:getEquipmentSkins()) do
			table.insert(var_1_5, {
				isSkin = true,
				id = iter_1_3.id,
				count = iter_1_3.count
			})
		end

		for iter_1_4, iter_1_5 in pairs(var_1_1:getEquipmentSkinInShips()) do
			table.insert(var_1_5, {
				isSkin = true,
				count = 1,
				id = iter_1_5.id,
				shipId = iter_1_5.shipId,
				shipPos = iter_1_5.shipPos
			})
		end
	end

	arg_1_0.viewComponent:setEquipments(var_1_5)
	arg_1_0.viewComponent:setCapacity(arg_1_0.equipmentProxy:getCapacity())
	arg_1_0:UpdateSpWeapons()

	local var_1_6 = getProxy(BagProxy):getItemsByExclude()

	arg_1_0.viewComponent:setItems(var_1_6)

	local var_1_7 = getProxy(PlayerProxy):getData()

	arg_1_0.viewComponent:setPlayer(var_1_7)
end

function var_0_0.UpdateSpWeapons(arg_15_0)
	local var_15_0 = getProxy(BayProxy):RawGetShipById(arg_15_0.contextData.shipId)
	local var_15_1 = getProxy(BayProxy):GetSpWeaponsInShips(var_15_0)
	local var_15_2 = _.values(getProxy(EquipmentProxy):GetSpWeapons())

	for iter_15_0, iter_15_1 in ipairs(var_15_2) do
		if not var_15_0 or not var_15_0:IsSpWeaponForbidden(iter_15_1) then
			table.insert(var_15_1, iter_15_1)
		end
	end

	arg_15_0.viewComponent:SetSpWeapons(var_15_1)
end

function var_0_0.listNotificationInterests(arg_16_0)
	return {
		EquipmentProxy.EQUIPMENT_UPDATED,
		BayProxy.SHIP_EQUIPMENT_ADDED,
		BayProxy.SHIP_EQUIPMENT_REMOVED,
		BayProxy.SHIP_UPDATED,
		PlayerProxy.UPDATED,
		GAME.USE_ITEM_DONE,
		GAME.DESTROY_EQUIPMENTS_DONE,
		BagProxy.ITEM_UPDATED,
		var_0_0.BATCHDESTROY_MODE,
		var_0_0.SWITCH_TO_SPWEAPON_PAGE,
		GAME.EQUIP_TO_SHIP_DONE,
		GAME.REVERT_EQUIPMENT_DONE,
		EquipmentProxy.EQUIPMENT_SKIN_UPDATED,
		GAME.UNEQUIP_FROM_SHIP_DONE,
		GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP_DONE,
		GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP_DONE,
		var_0_0.NO_UPDATE,
		GAME.FRAG_SELL_DONE,
		GAME.TRANSFORM_EQUIPMENT_AWARD_FINISHED,
		EquipmentProxy.SPWEAPONS_UPDATED,
		GAME.LOVE_ITEM_MAIL_REPAIR_DONE,
		GAME.SELL_ITEM_DONE
	}
end

function var_0_0.handleNotification(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:getName()
	local var_17_1 = arg_17_1:getBody()

	if var_17_0 == EquipmentProxy.EQUIPMENT_UPDATED then
		arg_17_0.viewComponent:setCapacity(arg_17_0.equipmentProxy:getCapacity())
		arg_17_0.viewComponent:setEquipment(var_17_1)

		if arg_17_0.canUpdate then
			arg_17_0.viewComponent:setEquipmentUpdate()
		end
	elseif var_17_0 == BayProxy.SHIP_EQUIPMENT_ADDED then
		arg_17_0.viewComponent:addShipEquipment(var_17_1)

		if arg_17_0.canUpdate then
			arg_17_0.viewComponent:setEquipmentUpdate()
		end
	elseif var_17_0 == BayProxy.SHIP_EQUIPMENT_REMOVED then
		arg_17_0.viewComponent:removeShipEquipment(var_17_1)

		if arg_17_0.canUpdate then
			arg_17_0.viewComponent:setEquipmentUpdate()
		end
	elseif var_17_0 == EquipmentProxy.EQUIPMENT_SKIN_UPDATED then
		arg_17_0.viewComponent:setCapacity(arg_17_0.equipmentProxy:getCapacity())
		arg_17_0.viewComponent:setEquipmentSkin(var_17_1)

		if arg_17_0.canUpdate then
			arg_17_0.viewComponent:setEquipmentSkinUpdate()
		end
	elseif var_17_0 == BayProxy.SHIP_UPDATED then
		if var_17_1.id == arg_17_0.contextData.shipId then
			arg_17_0.viewComponent:setShip(var_17_1)
		end
	elseif var_17_0 == PlayerProxy.UPDATED then
		arg_17_0.viewComponent:setPlayer(var_17_1)
	elseif var_17_0 == GAME.USE_ITEM_DONE then
		if #var_17_1.drops > 0 then
			arg_17_0.viewComponent:emit(BaseUI.ON_WORLD_ACHIEVE, {
				animation = true,
				items = var_17_1.drops,
				removeFunc = function()
					if var_17_1.isEquipBox then
						local var_18_0 = underscore.map(var_17_1.drops, function(arg_19_0)
							return Equipment.New({
								id = arg_19_0.id,
								count = arg_19_0.count
							})
						end)

						arg_17_0:addSubLayers(Context.New({
							viewComponent = ResolveEquipmentLayer,
							mediator = ResolveEquipmentMediator,
							data = {
								Equipments = var_18_0
							}
						}))
					end
				end
			})
		end
	elseif var_17_0 == GAME.FRAG_SELL_DONE then
		arg_17_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_17_1.awards)
	elseif var_17_0 == GAME.DESTROY_EQUIPMENTS_DONE then
		arg_17_0.canUpdate = true

		arg_17_0.viewComponent:setEquipmentUpdate()

		if #var_17_1 > 0 then
			arg_17_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_17_1
			})
		end
	elseif var_17_0 == BagProxy.ITEM_UPDATED then
		if arg_17_0.canUpdate then
			local var_17_2 = getProxy(BagProxy):getItemsByExclude()

			arg_17_0.viewComponent:setItems(var_17_2)
		end
	elseif var_17_0 == var_0_0.BATCHDESTROY_MODE then
		arg_17_0.viewComponent:SwitchToDestroy()
	elseif var_17_0 == var_0_0.SWITCH_TO_SPWEAPON_PAGE then
		arg_17_0.viewComponent:SwitchToSpWeaponStoreHouse()
	elseif var_17_0 == GAME.REVERT_EQUIPMENT_DONE then
		if #var_17_1.awards > 0 then
			arg_17_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_17_1.awards
			})
		end
	elseif var_17_0 == GAME.EQUIP_TO_SHIP_DONE or var_17_0 == GAME.UNEQUIP_FROM_SHIP_DONE then
		arg_17_0.viewComponent:emit(BaseUI.ON_BACK)
	elseif var_17_0 == GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP_DONE or var_17_0 == GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP_DONE then
		arg_17_0.viewComponent:emit(BaseUI.ON_BACK)
	elseif var_17_0 == var_0_0.NO_UPDATE then
		arg_17_0.canUpdate = false
	elseif var_17_0 == GAME.TRANSFORM_EQUIPMENT_AWARD_FINISHED then
		arg_17_0:getViewComponent():Scroll2Equip(var_17_1.newEquip)
	elseif var_17_0 == EquipmentProxy.SPWEAPONS_UPDATED then
		arg_17_0:UpdateSpWeapons()
		arg_17_0.viewComponent:SetSpWeaponUpdate()
	elseif var_17_0 == GAME.LOVE_ITEM_MAIL_REPAIR_DONE then
		if #var_17_1.awards > 0 then
			arg_17_0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = var_17_1.awards
			})
		end
	elseif var_17_0 == GAME.SELL_ITEM_DONE then
		arg_17_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_17_1.awards)
	end
end

function var_0_0.remove(arg_20_0)
	getProxy(SettingsProxy):setEquipSceneIndex(arg_20_0.contextData.warp)
end

return var_0_0
