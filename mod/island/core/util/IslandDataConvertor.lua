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
	local var_1_11 = {}
	local var_1_12 = {}
	local var_1_13 = {}

	var_0_0.SceneData2IslandUnits(var_1_5, var_1_13, var_1_3, var_1_0, var_1_1, var_1_2, arg_1_0.id)
	var_0_0.SystemData2IslandUnits(var_1_5, var_1_11, var_1_10, arg_1_0, var_1_0, var_1_9)
	var_0_0.CollectSystems(var_1_6, var_1_7, arg_1_0, var_1_0, var_1_9)
	var_0_0.CollectStrollUnits(var_1_8, arg_1_0, var_1_0)
	var_0_0.CollectFollowUnits(var_1_5, var_1_12, arg_1_0, var_1_0)

	local var_1_14 = var_0_0.CollectCamreaZoomData(var_1_0)

	return {
		mapId = var_1_0,
		unitList = var_1_5,
		sceneName = var_1_4.sceneName,
		systemList = var_1_6,
		systemUnits = var_1_7,
		strollUnits = var_1_8,
		productSystems = var_1_9,
		giftUnits = var_1_10,
		followUnits = var_1_12,
		delayInitUnits = var_1_11,
		activityUnits = var_1_13,
		camreaZoomData = var_1_14
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

function var_0_0.SystemData2IslandUnits(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
	var_0_0.CollectSignInSystemUnits(arg_4_0, arg_4_2, arg_4_3, arg_4_4)
	var_0_0.CollectWildCollectInSystemUnits(arg_4_0, arg_4_2, arg_4_3, arg_4_4)
	var_0_0.CollectBuildingSystemUnits(arg_4_0, arg_4_1, arg_4_3, arg_4_4, arg_4_5)

	if arg_4_3:IsPrivate() then
		var_0_0.CollectOrderSystemUnits(arg_4_0, arg_4_3, arg_4_4)
	end
end

function var_0_0.CollectBuildingSystemUnits(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0 = arg_5_2:GetBuildingAgency()
	local var_5_1 = pg.island_production_place.get_id_list_by_map_id[arg_5_3] or {}

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		if arg_5_3 == pg.island_production_place[iter_5_1].map_id then
			local var_5_2 = var_5_0:GetBuilding(iter_5_1)
			local var_5_3 = IslandProductSystemVO.New(iter_5_1, var_5_2, arg_5_2.id)

			for iter_5_2, iter_5_3 in ipairs(var_5_3:GetUnitDatas()) do
				if iter_5_3 then
					if iter_5_3.delayTime then
						table.insert(arg_5_1, iter_5_3)
					else
						table.insert(arg_5_0, iter_5_3)
					end
				end
			end

			table.insert(arg_5_4, var_5_3)
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
			local var_10_0 = arg_9_1:GetFollowerAgency()
			local var_10_1 = _.detect(var_9_1, function(arg_11_0)
				return not var_10_0:Following(arg_11_0.id) and arg_11_0:getConfig("unit_id") == arg_10_1
			end)

			return var_10_1 ~= nil, var_10_1 and var_10_1:GetModelUnit(), var_10_1 and var_10_1.id
		else
			return arg_10_0 == 0 or var_9_0:HasAbility(arg_10_0), nil, 0
		end
	end

	for iter_9_0, iter_9_1 in ipairs(pg.island_strollnpc.all) do
		local var_9_3 = pg.island_strollnpc[iter_9_1]

		if _.any(var_9_3.mapId, function(arg_12_0)
			return arg_12_0[1] == arg_9_2 and IslandCalcUtil.IsHappen(arg_12_0[3] or 100)
		end) then
			local var_9_4, var_9_5, var_9_6 = var_9_2(var_9_3.unlock, var_9_3.unit_id)

			if var_9_4 then
				table.insert(arg_9_0, IslandStrollUnitVO.New(var_9_6, iter_9_1, var_9_5))
			end
		end
	end

	var_0_0.DistributeAward4StrollUnits(arg_9_0, arg_9_1)
end

function var_0_0.DistributeAward4StrollUnits(arg_13_0, arg_13_1)
	if #arg_13_0 > 0 and arg_13_1:IsPrivate() then
		local var_13_0 = arg_13_1:GetNpcFeedbackAgency():GetNpcList()
		local var_13_1 = pg.island_set.island_feedback_award_times.key_value_int - #var_13_0
		local var_13_2 = {}

		for iter_13_0, iter_13_1 in ipairs(arg_13_0) do
			if pg.island_strollnpc[iter_13_1.id].action_feedback == 1 and _.all(var_13_0, function(arg_14_0)
				return iter_13_1.id ~= arg_14_0
			end) then
				table.insert(var_13_2, iter_13_1)
			end
		end

		if #var_13_2 <= 0 then
			return
		end

		shuffle(var_13_2)

		local var_13_3 = pg.island_action.get_id_list_by_type[IslandConst.ANIMATION_OP_SIGNLE]
		local var_13_4 = arg_13_1:GetActionAgency()
		local var_13_5 = _.select(var_13_3, function(arg_15_0)
			return var_13_4:ExistAction(arg_15_0)
		end)

		if #var_13_5 <= 0 then
			return
		end

		for iter_13_2 = 1, var_13_1 do
			local var_13_6 = var_13_2[iter_13_2]

			if var_13_6 then
				local var_13_7 = var_13_5[math.random(1, #var_13_5)]

				var_13_6:SetActionFeedback(var_13_7)
			end
		end
	end
end

function var_0_0.CollectFollowUnits(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0

	for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
		if iter_16_1:IsPlayer() then
			var_16_0 = iter_16_1

			break
		end
	end

	if not var_16_0 then
		return
	end

	local var_16_1 = var_16_0.position
	local var_16_2 = var_16_0.rotation
	local var_16_3 = arg_16_2:GetFollowerAgency()

	for iter_16_2, iter_16_3 in ipairs(var_16_3:GetFollowers()) do
		local var_16_4 = arg_16_2:GetCharacterAgency():GetShipById(iter_16_3)
		local var_16_5 = var_16_4:GetModelUnit()

		table.insert(arg_16_1, IslandFollowerUnitVO.New(var_16_4.id, iter_16_3, var_16_5, var_16_1, var_16_2, iter_16_2 == 1))
	end
end

function var_0_0.CollectSystems(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	var_0_0.CollectPordunctSystem(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	var_0_0.CollectManageSystem(arg_17_0, arg_17_1, arg_17_2, arg_17_3)

	local var_17_0 = pg.island_map[arg_17_3]

	if var_17_0.minigame_id > 0 then
		table.insert(arg_17_0, IslandSeekGameSystemVO.New(var_17_0.minigame_id, IslandConst.SEEK_GAME_SYSTEM_ID))
	elseif arg_17_3 == IslandConst.AGORA_MAP_ID then
		table.insert(arg_17_0, IslandGroundSystemVO.New(IslandConst.AGORA_GROUND_SYSTEM_ID))
		table.insert(arg_17_0, IslandGrassLandSystemVO.New(IslandConst.AGORA_GRASSLAND))
	end
end

function var_0_0.CollectManageSystem(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_2:GetManageAgency():GetRestaurants()

	for iter_18_0, iter_18_1 in pairs(var_18_0) do
		if iter_18_1:getConfig("map_id") == arg_18_3 then
			local var_18_1 = IslandManageSystemVO.New(iter_18_1.id, iter_18_1)

			table.insert(arg_18_0, var_18_1)

			if iter_18_1:GetStatus() == IslandRestaurant.STATUS.OPENING then
				for iter_18_2, iter_18_3 in ipairs(var_18_1:GetUnits()) do
					table.insert(arg_18_1, iter_18_3)
				end
			end
		end
	end
end

function var_0_0.CollectPordunctSystem(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	local var_19_0 = pg.island_production_place.get_id_list_by_map_id[arg_19_3] or {}
	local var_19_1 = arg_19_2:GetBuildingAgency()

	local function var_19_2(arg_20_0)
		local var_20_0

		for iter_20_0, iter_20_1 in ipairs(arg_19_4) do
			if iter_20_1.id == arg_20_0 then
				var_20_0 = iter_20_1
			end
		end

		return var_20_0
	end

	local var_19_3 = {
		IslandProductConst.PasturePlaceId,
		IslandProductConst.FarmlandPlaceId,
		IslandProductConst.OrchardPlaceId,
		IslandProductConst.GardenPlaceId
	}

	for iter_19_0, iter_19_1 in ipairs(IslandProductConst.FactorytPlaces) do
		table.insert(var_19_3, iter_19_1)
	end

	for iter_19_2, iter_19_3 in ipairs(var_19_0) do
		local var_19_4 = var_19_2(iter_19_3)
		local var_19_5 = IslandCharacterSystemVO.New(iter_19_3, var_19_4, arg_19_2.id)
		local var_19_6 = var_19_1:GetBuilding(iter_19_3)
		local var_19_7 = 0

		if var_19_6 then
			local var_19_8 = var_19_6:GetShipIdAndAreaIdList()

			for iter_19_4, iter_19_5 in ipairs(var_19_8) do
				local var_19_9 = var_19_5:GetUnit(iter_19_5.ship_id, iter_19_5.area_id, table.contains(var_19_3, iter_19_3))

				table.insert(arg_19_1, var_19_9)

				var_19_7 = var_19_7 + 1
			end

			var_19_5:SetkCurrentWorkerList(var_19_8)
		end

		var_19_5:SetWorkerCnt(var_19_7)
		table.insert(arg_19_0, var_19_5)
	end
end

function var_0_0.SceneData2IslandUnits(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4, arg_21_5, arg_21_6)
	local var_21_0 = pg.island_world_objects.get_id_list_by_mapId[arg_21_3] or {}

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		local var_21_1 = pg.island_world_objects[iter_21_1]

		if var_21_1.unitId > 0 and (var_21_1.gen_type == IslandConst.UNIT_GEN_TYPE_STATIC or var_21_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC) then
			local var_21_2 = var_0_0.WorldObj2IslandUnit(var_21_1)

			table.insert(arg_21_0, var_21_2)
		elseif var_21_1.unitId > 0 and var_21_1.gen_type == IslandConst.UNIT_GEN_TYPE_ACTIVITY then
			local var_21_3 = var_0_0.WorldObj2IslandUnit(var_21_1)

			table.insert(arg_21_1, var_21_3)
		end
	end

	for iter_21_2, iter_21_3 in pairs(arg_21_2) do
		local var_21_4 = var_0_0.PlayerData2IslandUnit(iter_21_3, arg_21_3, arg_21_6, arg_21_4, arg_21_5)

		table.insert(arg_21_0, var_21_4)
	end

	local var_21_5 = var_0_0.TakePhotoData2IslandUnit(2)

	table.insert(arg_21_0, var_21_5)

	local var_21_6 = var_0_0.TakePhotoData2IslandUnit(3)

	table.insert(arg_21_0, var_21_6)
end

local function var_0_1(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if arg_22_1 then
		return
	end

	if arg_22_0 ~= arg_22_2.mapId then
		return
	end

	arg_22_3.position = {
		arg_22_2.position.x,
		arg_22_2.position.y,
		arg_22_2.position.z
	}
	arg_22_3.rotation = {
		arg_22_2.rotation.x,
		arg_22_2.rotation.y,
		arg_22_2.rotation.z
	}
end

function var_0_0.PlayerData2IslandUnit(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	local var_23_0
	local var_23_1
	local var_23_2 = pg.island_world_objects.get_id_list_by_mapId[arg_23_1] or {}

	for iter_23_0, iter_23_1 in ipairs(var_23_2) do
		local var_23_3 = pg.island_world_objects[iter_23_1]

		if var_23_3.unitId == 0 then
			var_23_0 = var_23_3

			break
		end
	end

	assert(var_23_0)

	if arg_23_0:IsSelf() then
		local var_23_4 = {
			id = arg_23_0.id,
			unitId = arg_23_0:GetModelId(),
			typ = IslandConst.UNIT_TYPE_PLAYER
		}
		local var_23_5 = arg_23_3 and pg.island_world_objects[arg_23_3] or var_23_0

		if var_23_5.mapId ~= arg_23_1 then
			var_23_5 = var_23_0
		end

		var_0_1(arg_23_1, arg_23_3, arg_23_4, var_23_4)

		var_23_1 = var_0_0.WorldObj2IslandUnit(var_23_5, var_23_4)
	else
		local var_23_6 = {
			behaviourTree = "Island/NodeCanvas/Visitor",
			id = arg_23_0.id,
			unitId = arg_23_0:GetModelId(),
			typ = IslandConst.UNIT_TYPE_VISITOR,
			islandId = arg_23_2
		}

		var_23_1 = var_0_0.WorldObj2IslandUnit(var_23_0, var_23_6)
	end

	return var_23_1
end

function var_0_0.ModelId2IslandUnit(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = pg.island_world_objects[arg_24_0] or {}
	local var_24_1

	if var_24_0.mapId == arg_24_2 then
		local var_24_2 = {
			unitId = arg_24_1,
			typ = arg_24_3
		}

		var_24_1 = var_0_0.WorldObj2IslandUnit(var_24_0, var_24_2)
	end

	return var_24_1
end

function var_0_0.WorldObj2IslandUnit(arg_25_0, arg_25_1)
	arg_25_1 = arg_25_1 or {}

	local var_25_0 = arg_25_1.typ or arg_25_0.type
	local var_25_1

	if var_25_0 == IslandConst.UNIT_TYPE_ITEM_INTERACT then
		var_25_1 = IslandInteractUnitVO
	elseif var_25_0 == IslandConst.UNIT_TYPE_ITEM_GATHER_ITEM or var_25_0 == IslandConst.UNIT_TYPE_ITEM_WILD_COLLECT_ITEM then
		var_25_1 = IslandGatherUnitVO
	elseif var_25_0 == IslandConst.UNIT_TYPE_VISITOR then
		var_25_1 = IslandVistorUnitVO
	else
		var_25_1 = IslandUnitVO
	end

	return (var_25_1.New({
		id = arg_25_1.id or arg_25_0.id,
		modelId = arg_25_1.unitId or arg_25_0.unitId,
		type = arg_25_1.typ or arg_25_0.type,
		name = arg_25_0.name,
		position = arg_25_1.position or arg_25_0.param.position,
		rotation = arg_25_1.rotation or arg_25_0.param.rotation,
		scale = arg_25_0.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_25_1.behaviourTree or arg_25_0.behaviourTree,
		genType = arg_25_0.gen_type,
		showCondition = arg_25_0.show_param or {},
		hideCondition = arg_25_0.hide_param or {},
		index = arg_25_1.index or 0,
		islandId = arg_25_1.islandId
	}))
end

function var_0_0.TakePhotoData2IslandUnit(arg_26_0)
	local var_26_0 = {
		unitId = 20024,
		id = arg_26_0,
		typ = IslandConst.UNIT_TYPE_FIRST_TAKE_PHOTO_ITEM
	}

	return (IslandUnitVO.New({
		index = 0,
		behaviourTree = "",
		genType = 1,
		id = var_26_0.id,
		modelId = var_26_0.unitId,
		type = var_26_0.typ,
		name = "TakePhoto" .. arg_26_0,
		position = {
			0,
			0,
			0
		},
		rotation = {
			0,
			0,
			0
		},
		scale = {
			1,
			1,
			1
		},
		showCondition = {},
		hideCondition = {}
	}))
end

function var_0_0.GenDelayRecycleIslandUnit(arg_27_0)
	local var_27_0 = pg.island_world_objects[arg_27_0.id]
	local var_27_1 = {
		id = arg_27_0.id,
		unitId = arg_27_0.unitId,
		position = {
			arg_27_0.position.x,
			arg_27_0.position.y,
			arg_27_0.position.z
		},
		rotation = {
			arg_27_0.rotation.x,
			arg_27_0.rotation.y,
			arg_27_0.rotation.z
		},
		behaviourTree = arg_27_0.behaviourTree,
		recycleAssetType = arg_27_0.recycleAssetType,
		delayRecycleTime = arg_27_0.delayRecycleTime
	}

	return var_0_0.WorldObj2IslandDelayRecycleUnit(var_27_0, var_27_1)
end

function var_0_0.WorldObj2IslandDelayRecycleUnit(arg_28_0, arg_28_1)
	arg_28_1 = arg_28_1 or {}

	return (IslandDelayRecycleUnitVO.New({
		id = arg_28_1.id or arg_28_0.id,
		modelId = arg_28_1.unitId or arg_28_0.unitId,
		type = IslandConst.UNIT_TYPE_ITEM_DELAY_RECYCLE,
		name = arg_28_0.name .. "delay",
		position = arg_28_1.position or arg_28_0.param.position,
		rotation = arg_28_1.rotation or arg_28_0.param.rotation,
		scale = arg_28_0.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_28_1.behaviourTree or arg_28_0.behaviourTree,
		genType = arg_28_0.gen_type,
		showCondition = arg_28_0.show_param or {},
		hideCondition = arg_28_0.hide_param or {},
		index = arg_28_1.index or 0,
		delayRecycleTime = arg_28_1.delayRecycleTime,
		recycleAssetType = arg_28_1.recycleAssetType
	}))
end

function var_0_0.GenWildGatherUnit(arg_29_0)
	local var_29_0 = pg.island_world_objects[arg_29_0.unitId]

	return (var_0_0.WorldObj2IslandUnit(var_29_0, {
		index = arg_29_0.islandId,
		typ = arg_29_0.gatherType
	}))
end

function var_0_0.GenInteractUnitByAgoraFurniture(arg_30_0)
	return (IslandVirtualInteractUnitVO.New({
		index = 0,
		id = arg_30_0.id,
		modelId = arg_30_0.pointId,
		type = IslandConst.UNIT_TYPE_VIRTUAL_INTERACT,
		name = "AgoraInteract" .. arg_30_0.id,
		position = arg_30_0.position,
		rotation = arg_30_0.rotation,
		scale = {
			1,
			1,
			1
		},
		genType = IslandConst.UNIT_GEN_TYPE_SYSTEM,
		showCondition = {},
		hideCondition = {}
	}))
end

return var_0_0
