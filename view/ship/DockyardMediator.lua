local var_0_0 = class("DockyardMediator", import("..base.ContextMediator"))

var_0_0.ON_DESTROY_SHIPS = "DockyardMediator:ON_DESTROY_SHIPS"
var_0_0.ON_SHIP_DETAIL = "DockyardMediator:ON_SHIP_DETAIL"
var_0_0.ON_SHIP_REPAIR = "DockyardMediator:ON_SHIP_REPAIR"
var_0_0.OPEN_DOCKYARD_INDEX = "DockyardMediator:OPEN_DOCKYARD_INDEX"
var_0_0.CHANGE_SKIN = "DockyardMediator.CHANGE_SKIN"
var_0_0.CHANGE_RANDOM_FLAG = "DockyardMediator.CHANGE_RANDOM_FLAG"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(BayProxy)

	if arg_1_0.contextData.shipVOs then
		arg_1_0.shipsById = {}

		for iter_1_0, iter_1_1 in ipairs(arg_1_0.contextData.shipVOs) do
			arg_1_0.shipsById[iter_1_1.id] = iter_1_1
		end
	elseif arg_1_0.contextData.mode == DockyardScene.MODE_WORLD then
		arg_1_0.shipsById = {}

		for iter_1_2, iter_1_3 in ipairs(nowWorld():GetShipVOs()) do
			arg_1_0.shipsById[iter_1_3.id] = iter_1_3
		end
	else
		arg_1_0.shipsById = {}

		for iter_1_4, iter_1_5 in pairs(var_1_0.data) do
			arg_1_0.shipsById[iter_1_4] = iter_1_5
		end
	end

	if arg_1_0.contextData.mode == DockyardScene.MODE_MOD then
		local var_1_1 = arg_1_0.contextData.ignoredIds[1]

		arg_1_0.viewComponent:setModShip(arg_1_0.shipsById[var_1_1]:clone())
	end

	arg_1_0.fleetProxy = getProxy(FleetProxy)
	arg_1_0.fleetShipIds = arg_1_0.fleetProxy:getAllShipIds()

	if arg_1_0.contextData.ignoredIds then
		for iter_1_6, iter_1_7 in ipairs(arg_1_0.contextData.ignoredIds) do
			arg_1_0.shipsById[iter_1_7] = nil
		end
	end

	arg_1_0.viewComponent:setShips(arg_1_0.shipsById)
	arg_1_0.viewComponent:setShipsCount(var_1_0:getShipCount())

	local var_1_2 = getProxy(PlayerProxy):getData()

	arg_1_0.viewComponent:setPlayer(var_1_2)
	arg_1_0:bind(var_0_0.ON_DESTROY_SHIPS, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.DESTROY_SHIPS, {
			destroyEquipment = arg_2_2,
			shipIds = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SHIP_DETAIL, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_3_1.id,
			shipVOs = arg_3_2,
			selectContextData = arg_3_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_SHIP_REPAIR, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(GAME.WORLD_SHIP_REPAIR, {
			shipIds = arg_4_1,
			totalCost = arg_4_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_DOCKYARD_INDEX, function(arg_5_0, arg_5_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = CustomIndexLayer,
			mediator = CustomIndexMediator,
			data = arg_5_1
		}))
	end)
	arg_1_0:bind(var_0_0.CHANGE_SKIN, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = SwichSkinMediator,
			viewComponent = SwichSkinLayer,
			data = {
				shipVO = arg_6_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.CHANGE_RANDOM_FLAG, function(arg_7_0, arg_7_1, arg_7_2)
		arg_1_0:sendNotification(GAME.CHANGE_RANDOM_SHIPS, {
			addList = arg_7_2 and {
				arg_7_1
			} or {},
			deleteList = not arg_7_2 and {
				arg_7_1
			} or {}
		})
	end)
end

function var_0_0.listNotificationInterests(arg_8_0)
	return {
		GAME.DESTROY_SHIP_DONE,
		FleetProxy.FLEET_UPDATED,
		GAME.EXIT_SHIP_DONE,
		GAME.UPDATE_EXERCISE_FLEET_DONE,
		GAME.CANCEL_LEARN_TACTICS_DONE,
		PlayerProxy.UPDATED,
		GAME.WORLD_SHIP_REPAIR_DONE,
		GAME.UPDATE_LOCK_DONE,
		GAME.WORLD_FLEET_REDEPLOY_DONE,
		SetShipSkinCommand.SKIN_UPDATED
	}
end

function var_0_0.handleNotification(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:getName()
	local var_9_1 = arg_9_1:getBody()

	if var_9_0 == GAME.DESTROY_SHIP_DONE then
		if not pg.m02:hasMediator(ShipMainMediator.__cname) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardMediator_destroy"))
		end

		for iter_9_0, iter_9_1 in ipairs(var_9_1.destroiedShipIds) do
			arg_9_0.viewComponent:removeShip(iter_9_1)
		end

		arg_9_0.viewComponent:updateShipCount()
		arg_9_0.viewComponent:setShipsCount(getProxy(BayProxy):getShipCount())
		arg_9_0.viewComponent:updateBarInfo()
		arg_9_0.viewComponent:updateSelected()
		arg_9_0.viewComponent:updateDestroyRes()

		local function var_9_2()
			if table.getCount(var_9_1.equipments) > 0 then
				local var_10_0 = {}

				for iter_10_0, iter_10_1 in pairs(var_9_1.equipments) do
					table.insert(var_10_0, iter_10_1)
				end

				arg_9_0:addSubLayers(Context.New({
					viewComponent = ResolveEquipmentLayer,
					mediator = ResolveEquipmentMediator,
					data = {
						Equipments = var_10_0
					}
				}))
			end
		end

		arg_9_0.viewComponent:emit(BaseUI.ON_AWARD, {
			items = var_9_1.bonus,
			title = AwardInfoLayer.TITLE.ITEM,
			removeFunc = var_9_2
		})
		arg_9_0.viewComponent:closeDestroyPanel()
	elseif var_9_0 == FleetProxy.FLEET_UPDATED then
		local var_9_3 = arg_9_0.fleetShipIds

		arg_9_0.fleetShipIds = arg_9_0.fleetProxy:getAllShipIds()

		local var_9_4 = {}

		for iter_9_2, iter_9_3 in ipairs(var_9_3) do
			var_9_4[iter_9_3] = 1
		end

		for iter_9_4, iter_9_5 in ipairs(arg_9_0.fleetShipIds) do
			if var_9_4[iter_9_5] == 1 then
				var_9_4[iter_9_5] = 2
			else
				var_9_4[iter_9_5] = 3
			end
		end

		for iter_9_6, iter_9_7 in ipairs(var_9_3) do
			if var_9_4[iter_9_7] == 1 then
				var_9_4[iter_9_7] = 0
			end
		end

		for iter_9_8, iter_9_9 in pairs(var_9_4) do
			if iter_9_9 == 0 then
				arg_9_0:setShipFlag(iter_9_8, "inFleet", false)
			elseif iter_9_9 == 3 then
				arg_9_0:setShipFlag(iter_9_8, "inFleet", true)
			end

			arg_9_0.viewComponent:updateShipStatusById(iter_9_8)
		end
	elseif var_9_0 == GAME.EXIT_SHIP_DONE then
		arg_9_0:setShipFlag(var_9_1.id, "inBackyard", false)
		arg_9_0.viewComponent:updateShipStatusById(var_9_1.id)
	elseif var_9_0 == GAME.UPDATE_LOCK_DONE then
		arg_9_0.shipsById[var_9_1.id].lockState = var_9_1.lockState

		arg_9_0.viewComponent:updateShipStatusById(var_9_1.id)
	elseif var_9_0 == GAME.CANCEL_LEARN_TACTICS_DONE then
		arg_9_0:setShipFlag(var_9_1.shipId, "inTactics", false)
		arg_9_0.viewComponent:updateShipStatusById(var_9_1.shipId)
	elseif var_9_0 == GAME.UPDATE_EXERCISE_FLEET_DONE then
		local var_9_5 = var_9_1.oldFleet
		local var_9_6 = var_9_1.newFleet

		for iter_9_10, iter_9_11 in ipairs(var_9_5.ships) do
			arg_9_0:setShipFlag(iter_9_11, "inExercise", false)
			arg_9_0.viewComponent:updateShipStatusById(iter_9_11)
		end

		for iter_9_12, iter_9_13 in ipairs(var_9_6.ships) do
			arg_9_0:setShipFlag(iter_9_13, "inExercise", true)
			arg_9_0.viewComponent:updateShipStatusById(iter_9_13)
		end
	elseif var_9_0 == PlayerProxy.UPDATED then
		arg_9_0.viewComponent:setPlayer(var_9_1)
	elseif var_9_0 == GAME.WORLD_SHIP_REPAIR_DONE then
		_.each(var_9_1.shipIds, function(arg_11_0)
			arg_9_0.viewComponent:updateShipStatusById(arg_11_0)
		end)
	elseif var_9_0 == GAME.WORLD_FLEET_REDEPLOY_DONE then
		arg_9_0.viewComponent:emit(BaseUI.ON_BACK)
	elseif var_9_0 == SetShipSkinCommand.SKIN_UPDATED then
		if arg_9_0.shipsById[var_9_1.ship.id] then
			arg_9_0.shipsById[var_9_1.ship.id] = getProxy(BayProxy):RawGetShipById(var_9_1.ship.id)
		end

		arg_9_0.viewComponent:OnShipSkinChanged(var_9_1.ship:GetShipPhantomMark())
	end
end

function var_0_0.setShipFlag(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = arg_12_0.shipsById[arg_12_1]

	if var_12_0 then
		var_12_0[arg_12_2] = arg_12_3
	end
end

return var_0_0
