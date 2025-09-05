local var_0_0 = class("IslandBaseMediator", import("view.base.ContextMediator"))

var_0_0.SET_UP = "IslandBaseScene:SET_UP"
var_0_0.SWITCH_MAP = "IslandBaseMediator:SWITCH_MAP"
var_0_0.RECORD_PLAYER_POS = "IslandBaseMediator:RECORD_PLAYER_POS"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.SET_UP, function(arg_2_0)
		arg_1_0:SetUp()
	end)
	arg_1_0:bind(var_0_0.SWITCH_MAP, function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_1_0.viewComponent:GetIsland()

		if not var_3_0:GetAblityAgency():IsUnlockMap(arg_3_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_lock_map_tip"))

			return
		end

		arg_1_0:sendNotification(GAME.ISLAND_ENTER_MAP, {
			islandId = var_3_0.id,
			mapId = arg_3_1,
			callback = function()
				local var_4_0 = pg.island_world_objects[arg_3_2]

				if var_4_0 then
					local var_4_1 = BuildVector3(var_4_0.param.position)
					local var_4_2 = BuildVector3(var_4_0.param.rotation)

					arg_1_0:RecordPlayerPosition(arg_3_1, var_4_1, var_4_2)
				end

				arg_1_0:SwitchScene(arg_3_1, arg_3_2)
			end
		})
	end)
	arg_1_0:bind(var_0_0.RECORD_PLAYER_POS, function(arg_5_0)
		if not _IslandCore then
			return
		end

		local var_5_0 = _IslandCore:GetController().mapId
		local var_5_1 = _IslandCore:GetView().player

		if not var_5_1 then
			return
		end

		local var_5_2, var_5_3 = var_5_1:LastGroundedPosition()

		arg_1_0:RecordPlayerPosition(var_5_0, var_5_2, var_5_3)
	end)
	arg_1_0:_register()
end

function var_0_0.RecordPlayerPosition(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if not _IslandCore then
		return
	end

	if not _IslandCore:GetController():IsSelfIsland() then
		return
	end

	arg_6_0:sendNotification(GAME.ISLAND_RECORD_LAST_EXIT_POS, {
		islandId = arg_6_0.viewComponent:GetIsland().id,
		mapId = arg_6_1,
		position = arg_6_2,
		rotation = arg_6_3
	})
end

function var_0_0.listNotificationInterests(arg_7_0)
	return arg_7_0:_listNotificationInterests()
end

function var_0_0.handleNotification(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getName()
	local var_8_1 = arg_8_1:getBody()

	arg_8_0:_handleNotification(arg_8_1)
	arg_8_0.viewComponent:emit(var_8_0, var_8_1)
end

function var_0_0.SetUp(arg_9_0)
	local var_9_0 = arg_9_0.viewComponent:GetIsland()
	local var_9_1 = var_9_0.mapID
	local var_9_2 = var_9_0.spawnPointId

	_IslandCore = IslandCore.New(arg_9_0.viewComponent:GetPoolMgr(), var_9_0)

	arg_9_0.viewComponent:OnSetUpCore(var_9_1, var_9_2)
end

function var_0_0.SwitchScene(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.viewComponent:GetIsland()

	var_10_0:SetMapId(arg_10_1)

	if arg_10_2 then
		var_10_0:SetSpawnPointId(arg_10_2)
	end

	arg_10_0:UnloadScene()
	arg_10_0:SetUp()
end

function var_0_0.UnloadScene(arg_11_0, arg_11_1)
	arg_11_0.viewComponent:OnUnloadScene()

	if _IslandCore then
		_IslandCore:Dispose(arg_11_1)

		_IslandCore = nil
	end
end

function var_0_0.remove(arg_12_0)
	arg_12_0:UnloadScene(true)
	arg_12_0:_remove()
end

function var_0_0._register(arg_13_0)
	return
end

function var_0_0._listNotificationInterests(arg_14_0)
	return {}
end

function var_0_0._handleNotification(arg_15_0, arg_15_1)
	return
end

function var_0_0._remove(arg_16_0)
	return
end

return var_0_0
