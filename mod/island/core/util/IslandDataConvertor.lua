local var_0_0 = class("IslandDataConvertor")

function var_0_0.Island2SceneData(arg_1_0)
	local var_1_0 = arg_1_0:GetMapId()
	local var_1_1 = arg_1_0:GetSpawnPointId()
	local var_1_2 = arg_1_0:GetLastExitPosition()
	local var_1_3 = arg_1_0:GetVisitorAgency():GetMapVisitorList()
	local var_1_4 = pg.island_map[var_1_0]
	local var_1_5 = {}
	local var_1_6 = {}
	local var_1_7 = {}
	local var_1_8 = {}
	local var_1_9 = {}
	local var_1_10 = {}

	var_0_0.SceneData2IslandUnits(var_1_5, var_1_3, var_1_0, var_1_1, var_1_2)
	var_0_0.SystemData2IslandUnits(var_1_5, var_1_10, arg_1_0, var_1_0, var_1_9)
	var_0_0.CollectSystems(var_1_6, var_1_7, arg_1_0, var_1_0, var_1_9)
	var_0_0.CollectStrollUnits(var_1_8, arg_1_0, var_1_0)

	local var_1_11 = var_0_0.CollectCamreaZoomData(var_1_0)

	return {
		mapId = var_1_0,
		unitList = var_1_5,
		sceneName = var_1_4.sceneName,
		systemList = var_1_6,
		systemUnits = var_1_7,
		strollUnits = var_1_8,
		productSystems = var_1_9,
		giftUnits = var_1_10,
		camreaZoomData = var_1_11
	}
end

function var_0_0.Island2SceneName(arg_2_0)
	local var_2_0 = arg_2_0:GetMapId()
	local var_2_1 = pg.island_map[var_2_0]

	return var_2_1.sceneName, var_2_0, var_2_1.default_bgm
end

function var_0_0.CollectCamreaZoomData(arg_3_0)
	local var_3_0 = pg.island_map[arg_3_0].camera_zoom
	local var_3_1 = var_3_0[1]
	local var_3_2 = var_3_0[2]
	local var_3_3 = var_3_0[3] or 0.5

	return {
		min = var_3_1,
		max = var_3_2,
		value = var_3_3
	}
end

function var_0_0.SystemData2IslandUnits(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	var_0_0.CollectSignInSystemUnits(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	var_0_0.CollectWildCollectInSystemUnits(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	var_0_0.CollectBuildingSystemUnits(arg_4_0, arg_4_2, arg_4_3, arg_4_4)

	if arg_4_2:IsPrivate() then
		var_0_0.CollectOrderSystemUnits(arg_4_0, arg_4_2, arg_4_3)
	end
end

function var_0_0.CollectBuildingSystemUnits(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_1:GetBuildingAgency()
	local var_5_1 = pg.island_production_place.get_id_list_by_map_id[arg_5_2] or {}

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		if arg_5_2 == pg.island_production_place[iter_5_1].map_id then
			local var_5_2 = var_5_0:GetBuilding(iter_5_1)
			local var_5_3 = IslandProductSystemVO.New(iter_5_1, var_5_2, arg_5_1.id)

			for iter_5_2, iter_5_3 in ipairs(var_5_3:GetUnitDatas()) do
				if iter_5_3 then
					table.insert(arg_5_0, iter_5_3)
				end
			end

			table.insert(arg_5_3, var_5_3)
		end
	end
end

function var_0_0.CollectOrderSystemUnits(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetOrderAgency():GetShipSlotList()

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		if not iter_6_1:IsLock() and iter_6_1:GetWorldObjId() > 0 then
			local var_6_1 = pg.island_world_objects[iter_6_1:GetWorldObjId()]

			if var_6_1 and var_6_1.mapId == arg_6_2 then
				local var_6_2 = {}
				local var_6_3 = var_0_0.WorldObj2IslandUnit(var_6_1, var_6_2)

				table.insert(arg_6_0, var_6_3)
			end
		end
	end
end

function var_0_0.CollectSignInSystemUnits(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_2:GetSignInAgency()
	local var_7_1 = pg.island_world_objects.get_id_list_by_mapId[arg_7_3] or {}
	local var_7_2 = 0

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		local var_7_3 = pg.island_world_objects[iter_7_1]

		if var_7_3.unitId > 0 and var_7_3.gen_type == IslandConst.UNIT_GEN_TYPE_GIFT then
			var_7_2 = var_7_2 + 1

			local var_7_4 = var_0_0.WorldObj2IslandUnit(var_7_3, {
				index = var_7_2
			})

			table.insert(arg_7_1, var_7_4)
		end
	end
end

function var_0_0.CollectWildCollectInSystemUnits(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = arg_8_2:GetWildCollectAgency():GetUnitList()

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		local var_8_1 = pg.island_world_objects[iter_8_1.unitId]

		if var_8_1.unitId > 0 then
			local var_8_2 = var_0_0.WorldObj2IslandUnit(var_8_1, {
				index = arg_8_2.id,
				typ = iter_8_1.gatherType
			})

			table.insert(arg_8_0, var_8_2)
		end
	end
end

function var_0_0.CollectStrollUnits(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_1:GetAblityAgency()
	local var_9_1 = arg_9_1:GetCharacterAgency():GetShips()

	local function var_9_2(arg_10_0, arg_10_1)
		if arg_10_0 == -1 then
			local var_10_0 = _.detect(var_9_1, function(arg_11_0)
				return arg_11_0:getConfig("unit_id") == arg_10_1
			end)

			return var_10_0 ~= nil, var_10_0 and var_10_0:GetModelUnit()
		else
			return arg_10_0 == 0 or var_9_0:HasAbility(arg_10_0), nil
		end
	end

	for iter_9_0, iter_9_1 in ipairs(pg.island_strollnpc.all) do
		local var_9_3 = pg.island_strollnpc[iter_9_1]

		if _.any(var_9_3.mapId, function(arg_12_0)
			return arg_12_0[1] == arg_9_2
		end) then
			local var_9_4, var_9_5 = var_9_2(var_9_3.unlock, var_9_3.unit_id)

			if var_9_4 then
				table.insert(arg_9_0, IslandStrollUnitVO.New(iter_9_1, var_9_5))
			end
		end
	end
end

function var_0_0.CollectSystems(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0 = pg.island_production_place.get_id_list_by_map_id[arg_13_3] or {}
	local var_13_1 = arg_13_2:GetBuildingAgency()

	local function var_13_2(arg_14_0)
		local var_14_0

		for iter_14_0, iter_14_1 in ipairs(arg_13_4) do
			if iter_14_1.id == arg_14_0 then
				var_14_0 = iter_14_1
			end
		end

		return var_14_0
	end

	local var_13_3 = {
		IslandProductSystemVO.PasturePlaceId,
		IslandProductSystemVO.FarmlandPlaceId
	}

	for iter_13_0, iter_13_1 in ipairs(var_13_0) do
		local var_13_4 = var_13_2(iter_13_1)
		local var_13_5 = IslandCharacterSystemVO.New(iter_13_1, var_13_4, arg_13_2.id)
		local var_13_6 = var_13_1:GetBuilding(iter_13_1)
		local var_13_7 = 0

		if var_13_6 then
			local var_13_8 = var_13_6:GetShipIdAndAreaIdList()

			for iter_13_2, iter_13_3 in ipairs(var_13_8) do
				local var_13_9 = var_13_5:GetUnit(iter_13_3.ship_id, iter_13_3.area_id, table.contains(var_13_3, iter_13_1))

				table.insert(arg_13_1, var_13_9)

				var_13_7 = var_13_7 + 1
			end

			var_13_5:SetkCurrentWorkerList(var_13_8)
		end

		var_13_5:SetWorkerCnt(var_13_7)
		table.insert(arg_13_0, var_13_5)
	end

	local var_13_10 = pg.island_map[arg_13_3]

	if var_13_10.minigame_id > 0 then
		table.insert(arg_13_0, IslandSeekGameSystemVO.New(var_13_10.minigame_id, IslandConst.SEEK_GAME_SYSTEM_ID))
	elseif arg_13_3 == IslandConst.AGORA_MAP_ID then
		table.insert(arg_13_0, IslandGroundSystemVO.New(IslandConst.AGORA_GROUND_SYSTEM_ID))
	end

	local var_13_11 = arg_13_2:GetManageAgency():GetRestaurants()

	for iter_13_4, iter_13_5 in pairs(var_13_11) do
		if iter_13_5:getConfig("map_id") == arg_13_3 then
			local var_13_12 = IslandManageSystemVO.New(iter_13_5.id, iter_13_5)

			table.insert(arg_13_0, var_13_12)

			if iter_13_5:GetStatus() == IslandRestaurant.STATUS.OPENING then
				for iter_13_6, iter_13_7 in ipairs(var_13_12:GetUnits()) do
					table.insert(arg_13_1, iter_13_7)
				end
			end
		end
	end
end

function var_0_0.SceneData2IslandUnits(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = pg.island_world_objects.get_id_list_by_mapId[arg_15_2] or {}

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_1 = pg.island_world_objects[iter_15_1]

		if var_15_1.unitId > 0 and (var_15_1.gen_type == IslandConst.UNIT_GEN_TYPE_STATIC or var_15_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC) then
			local var_15_2 = var_0_0.WorldObj2IslandUnit(var_15_1)

			table.insert(arg_15_0, var_15_2)
		end
	end

	for iter_15_2, iter_15_3 in pairs(arg_15_1) do
		local var_15_3 = var_0_0.PlayerData2IslandUnit(iter_15_3, arg_15_2, arg_15_3, arg_15_4)

		table.insert(arg_15_0, var_15_3)
	end
end

local function var_0_1(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_1 then
		return
	end

	if arg_16_0 ~= arg_16_2.mapId then
		return
	end

	arg_16_3.position = {
		arg_16_2.position.x,
		arg_16_2.position.y,
		arg_16_2.position.z
	}
	arg_16_3.rotation = {
		arg_16_2.rotation.x,
		arg_16_2.rotation.y,
		arg_16_2.rotation.z
	}
end

function var_0_0.PlayerData2IslandUnit(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0
	local var_17_1
	local var_17_2 = pg.island_world_objects.get_id_list_by_mapId[arg_17_1] or {}

	for iter_17_0, iter_17_1 in ipairs(var_17_2) do
		local var_17_3 = pg.island_world_objects[iter_17_1]

		if var_17_3.unitId == 0 then
			var_17_0 = var_17_3

			break
		end
	end

	assert(var_17_0)

	if arg_17_0:IsSelf() then
		local var_17_4 = {
			id = arg_17_0.id,
			unitId = arg_17_0:GetModelId(),
			typ = IslandConst.UNIT_TYPE_PLAYER
		}
		local var_17_5 = arg_17_2 and pg.island_world_objects[arg_17_2] or var_17_0

		if var_17_5.mapId ~= arg_17_1 then
			var_17_5 = var_17_0
		end

		var_0_1(arg_17_1, arg_17_2, arg_17_3, var_17_4)

		var_17_1 = var_0_0.WorldObj2IslandUnit(var_17_5, var_17_4)
	else
		local var_17_6 = {
			id = arg_17_0.id,
			unitId = arg_17_0:GetModelId(),
			typ = IslandConst.UNIT_TYPE_VISITOR
		}

		var_17_1 = var_0_0.WorldObj2IslandUnit(var_17_0, var_17_6)
	end

	return var_17_1
end

function var_0_0.ModelId2IslandUnit(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = pg.island_world_objects[arg_18_0] or {}
	local var_18_1

	if var_18_0.mapId == arg_18_2 then
		local var_18_2 = {
			unitId = arg_18_1,
			typ = arg_18_3
		}

		var_18_1 = var_0_0.WorldObj2IslandUnit(var_18_0, var_18_2)
	end

	return var_18_1
end

function var_0_0.WorldObj2IslandUnit(arg_19_0, arg_19_1)
	arg_19_1 = arg_19_1 or {}

	local var_19_0 = arg_19_1.typ or arg_19_0.type
	local var_19_1

	if var_19_0 == IslandConst.UNIT_TYPE_ITEM_INTERACT then
		var_19_1 = IslandInteractUnitVO
	elseif var_19_0 == IslandConst.UNIT_TYPE_ITEM_GATHER_ITEM or var_19_0 == IslandConst.UNIT_TYPE_ITEM_WILD_COLLECT_ITEM then
		var_19_1 = IslandGatherUnitVO
	else
		var_19_1 = IslandUnitVO
	end

	return (var_19_1.New({
		id = arg_19_1.id or arg_19_0.id,
		modelId = arg_19_1.unitId or arg_19_0.unitId,
		type = arg_19_1.typ or arg_19_0.type,
		name = arg_19_0.name,
		position = arg_19_1.position or arg_19_0.param.position,
		rotation = arg_19_1.rotation or arg_19_0.param.rotation,
		scale = arg_19_0.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_19_0.behaviourTree,
		genType = arg_19_0.gen_type,
		showCondition = arg_19_0.show_param or {},
		hideCondition = arg_19_0.hide_param or {},
		index = arg_19_1.index or 0
	}))
end

return var_0_0
