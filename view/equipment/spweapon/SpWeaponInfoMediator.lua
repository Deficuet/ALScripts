local var_0_0 = class("SpWeaponInfoMediator", import("view.base.ContextMediator"))

var_0_0.ON_DESTROY = "SpWeaponInfoMediator:ON_DESTROY"
var_0_0.ON_EQUIP = "SpWeaponInfoMediator:ON_EQUIP"
var_0_0.ON_INTENSIFY = "SpWeaponInfoMediator.ON_INTENSIFY"
var_0_0.ON_CHANGE = "SpWeaponInfoMediator.ON_CHANGE"
var_0_0.ON_UNEQUIP = "SpWeaponInfoMediator:ON_UNEQUIP"
var_0_0.ON_MOVE = "SpWeaponInfoMediator:ON_MOVE"
var_0_0.ON_MODIFY = "SpWeaponInfoMediator:ON_MODIFY"
var_0_0.ON_SKIP_UNIQUE_SHIPS = "SpWeaponInfoMediator:ON_SKIP_UNIQUE_SHIPS"

function var_0_0.register(arg_1_0)
	arg_1_0:BindEvent()

	if getProxy(ContextProxy):getCurrentContext().scene == SCENE.SPWEAPON_STOREHOUSE then
		arg_1_0.viewComponent.fromEquipmentView = true
	end

	local var_1_0 = getProxy(BayProxy):getShipById()
	local var_1_1, var_1_2 = unpack(arg_1_0.contextData.shipVO and {
		arg_1_0.contextData.shipVO:GetSpWeapon(),
		arg_1_0.contextData.shipVO
	} or {
		EquipmentProxy.StaticGetSpWeapon(arg_1_0.contextData.shipId, arg_1_0.contextData.spWeaponUid)
	})

	if arg_1_0.contextData.spWeaponConfigId then
		var_1_1 = SpWeapon.New({
			id = arg_1_0.contextData.spWeaponConfigId
		})
	end

	local var_1_3, var_1_4 = EquipmentProxy.StaticGetSpWeapon(arg_1_0.contextData.oldShipId, arg_1_0.contextData.oldSpWeaponUid)

	arg_1_0.viewComponent:setShip(var_1_2, var_1_4)
	arg_1_0.viewComponent:setEquipment(var_1_1, var_1_3)

	local var_1_5 = getProxy(PlayerProxy):getData()

	arg_1_0.viewComponent:setPlayer(var_1_5)
end

function var_0_0.BindEvent(arg_2_0)
	arg_2_0:bind(var_0_0.ON_EQUIP, function(arg_3_0)
		if arg_2_0.contextData.oldShipId then
			arg_2_0:sendNotification(GAME.EQUIP_SPWEAPON_FROM_SHIP, {
				spWeaponUid = arg_2_0.contextData.oldSpWeaponUid,
				oldShipId = arg_2_0.contextData.oldShipId,
				shipId = arg_2_0.contextData.shipId
			})
		else
			arg_2_0:sendNotification(GAME.EQUIP_SPWEAPON_TO_SHIP, {
				spWeaponUid = arg_2_0.contextData.oldSpWeaponUid,
				shipId = arg_2_0.contextData.shipId
			})
		end
	end)
	arg_2_0:bind(var_0_0.ON_UNEQUIP, function(arg_4_0)
		arg_2_0:sendNotification(GAME.EQUIP_SPWEAPON_TO_SHIP, {
			shipId = arg_2_0.contextData.shipId
		})
		arg_2_0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	arg_2_0:bind(var_0_0.ON_MODIFY, function(arg_5_0)
		arg_2_0:addSubLayers(Context.New({
			mediator = SpWeaponModifyMediator,
			viewComponent = SpWeaponModifyLayer,
			data = {
				spWeaponUid = arg_2_0.contextData.spWeaponUid,
				shipId = arg_2_0.contextData.shipId
			}
		}), true)
		arg_2_0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	arg_2_0:bind(var_0_0.ON_INTENSIFY, function(arg_6_0)
		local var_6_0 = getProxy(BayProxy):getShipById(arg_2_0.contextData.shipId)

		if var_6_0 then
			local var_6_1, var_6_2 = ShipStatus.ShipStatusCheck("onModify", var_6_0)

			if not var_6_1 then
				pg.TipsMgr.GetInstance():ShowTips(var_6_2)

				return
			end
		end

		arg_2_0:addSubLayers(Context.New({
			mediator = SpWeaponUpgradeMediator,
			viewComponent = SpWeaponUpgradeLayer,
			data = {
				spWeaponUid = arg_2_0.contextData.spWeaponUid,
				shipId = arg_2_0.contextData.shipId
			}
		}), true, function()
			arg_2_0.viewComponent:emit(BaseUI.ON_CLOSE)
		end)
	end)
	arg_2_0:bind(var_0_0.ON_CHANGE, function(arg_8_0)
		local var_8_0 = getProxy(BayProxy):getShipById(arg_2_0.contextData.shipId)
		local var_8_1, var_8_2 = ShipStatus.ShipStatusCheck("onModify", var_8_0)

		if not var_8_1 then
			pg.TipsMgr.GetInstance():ShowTips(var_8_2)

			return
		end

		arg_2_0.viewComponent:emit(BaseUI.ON_CLOSE)
		arg_2_0:sendNotification(GAME.GO_SCENE, SCENE.SPWEAPON_STOREHOUSE, {
			lock = true,
			shipId = arg_2_0.contextData.shipId,
			warp = StoreHouseConst.WARP_TO_WEAPON,
			mode = StoreHouseConst.EQUIPMENT
		})
	end)
	arg_2_0:bind(var_0_0.ON_MOVE, function(arg_9_0, arg_9_1)
		arg_2_0.viewComponent:emit(BaseUI.ON_CLOSE)
		arg_2_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			page = 2,
			shipId = arg_9_1
		})
	end)
	arg_2_0:bind(var_0_0.ON_SKIP_UNIQUE_SHIPS, function(arg_10_0, arg_10_1)
		local var_10_0 = getProxy(ContextProxy):getCurrentContext()

		if var_10_0 and var_10_0.scene == SCENE.EQUIPSCENE then
			var_10_0.data.warp = StoreHouseConst.WARP_TO_WEAPON
			var_10_0.data.mode = StoreHouseConst.SPWEAPON
		end

		arg_2_0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			shipVOs = arg_10_1.shipVOs,
			mode = DockyardScene.MODE_OVERVIEW
		})
	end)
end

function var_0_0.listNotificationInterests(arg_11_0)
	return {
		GAME.EQUIP_SPWEAPON_TO_SHIP_DONE
	}
end

function var_0_0.handleNotification(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:getName()
	local var_12_1 = arg_12_1:getBody()

	if var_12_0 == GAME.EQUIP_SPWEAPON_TO_SHIP_DONE then
		arg_12_0.viewComponent:emit(BaseUI.ON_CLOSE)
	end
end

return var_0_0
