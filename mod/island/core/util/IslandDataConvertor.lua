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
	var_0_0.CollectFishPointUnits(arg_4_0, arg_4_3, arg_4_4)

	if arg_4_3:IsPrivate() then
		var_0_0.CollectOrderSystemUnits(arg_4_0, arg_4_3, arg_4_4)
	end
end

function var_0_0.CollectFishPointUnits(arg_5_0, arg_5_1, arg_5_2)
	if not pg.island_fish_point then
		return
	end

	for iter_5_0, iter_5_1 in ipairs(pg.island_fish_point.all) do
		local var_5_0 = pg.island_fish_point[iter_5_1]

		if pg.island_world_objects[var_5_0.objId].mapId == arg_5_2 then
			table.insert(arg_5_0, IslandFishPointVO.New(iter_5_1, var_5_0.objId))
		end
	end
end

function var_0_0.CollectBuildingSystemUnits(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	local var_6_0 = arg_6_2:GetBuildingAgency()
	local var_6_1 = pg.island_production_place.get_id_list_by_map_id[arg_6_3] or {}

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		if arg_6_3 == pg.island_production_place[iter_6_1].map_id then
			local var_6_2 = var_6_0:GetBuilding(iter_6_1)
			local var_6_3 = IslandProductSystemVO.New(iter_6_1, var_6_2, arg_6_2.id)

			for iter_6_2, iter_6_3 in ipairs(var_6_3:GetUnitDatas()) do
				if iter_6_3 then
					if iter_6_3.delayTime then
						table.insert(arg_6_1, iter_6_3)
					else
						table.insert(arg_6_0, iter_6_3)
					end
				end
			end

			table.insert(arg_6_4, var_6_3)
		end
	end
end

function var_0_0.CollectOrderSystemUnits(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1:GetOrderAgency():GetShipSlotList()

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		if not iter_7_1:IsLock() and iter_7_1:GetWorldObjId() > 0 then
			local var_7_1 = pg.island_world_objects[iter_7_1:GetWorldObjId()]

			if var_7_1 and var_7_1.mapId == arg_7_2 then
				local var_7_2 = {}
				local var_7_3 = var_0_0.WorldObj2IslandUnit(var_7_1, var_7_2)

				table.insert(arg_7_0, var_7_3)
			end
		end
	end
end

function var_0_0.CollectSignInSystemUnits(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = arg_8_2:GetSignInAgency()
	local var_8_1 = pg.island_world_objects.get_id_list_by_mapId[arg_8_3] or {}
	local var_8_2 = 0

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		local var_8_3 = pg.island_world_objects[iter_8_1]

		if var_8_3.unitId > 0 and var_8_3.gen_type == IslandConst.UNIT_GEN_TYPE_GIFT then
			var_8_2 = var_8_2 + 1

			local var_8_4 = var_0_0.WorldObj2IslandUnit(var_8_3, {
				index = var_8_2
			})

			table.insert(arg_8_1, var_8_4)
		end
	end
end

function var_0_0.CollectWildCollectInSystemUnits(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = arg_9_2:GetWildCollectAgency():GetUnitList()

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		local var_9_1 = pg.island_world_objects[iter_9_1.unitId]

		if var_9_1.unitId > 0 then
			local var_9_2 = var_0_0.WorldObj2IslandUnit(var_9_1, {
				index = arg_9_2.id,
				typ = iter_9_1.gatherType
			})

			table.insert(arg_9_0, var_9_2)
		end
	end
end

function var_0_0.CollectStrollUnits(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_1:GetAblityAgency()
	local var_10_1 = arg_10_1:GetCharacterAgency():GetShips()

	local function var_10_2(arg_11_0, arg_11_1)
		if arg_11_0 == -1 then
			local var_11_0 = arg_10_1:GetFollowerAgency()
			local var_11_1 = _.detect(var_10_1, function(arg_12_0)
				return not var_11_0:Following(arg_12_0.id) and arg_12_0:getConfig("unit_id") == arg_11_1
			end)

			return var_11_1 ~= nil, var_11_1 and var_11_1:GetModelUnit(), var_11_1 and var_11_1.id
		else
			return arg_11_0 == 0 or var_10_0:HasAbility(arg_11_0), nil, 0
		end
	end

	for iter_10_0, iter_10_1 in ipairs(pg.island_strollnpc.all) do
		local var_10_3 = pg.island_strollnpc[iter_10_1]

		if _.any(var_10_3.mapId, function(arg_13_0)
			return arg_13_0[1] == arg_10_2 and IslandCalcUtil.IsHappen(arg_13_0[3] or 100)
		end) then
			local var_10_4, var_10_5, var_10_6 = var_10_2(var_10_3.unlock, var_10_3.unit_id)

			if var_10_4 then
				table.insert(arg_10_0, IslandStrollUnitVO.New(var_10_6, iter_10_1, var_10_5))
			end
		end
	end

	var_0_0.DistributeAward4StrollUnits(arg_10_0, arg_10_1)
end

function var_0_0.DistributeAward4StrollUnits(arg_14_0, arg_14_1)
	if #arg_14_0 > 0 and arg_14_1:IsPrivate() then
		local var_14_0 = arg_14_1:GetNpcFeedbackAgency():GetNpcList()
		local var_14_1 = pg.island_set.island_feedback_award_times.key_value_int - #var_14_0
		local var_14_2 = {}

		for iter_14_0, iter_14_1 in ipairs(arg_14_0) do
			if pg.island_strollnpc[iter_14_1.id].action_feedback == 1 and _.all(var_14_0, function(arg_15_0)
				return iter_14_1.id ~= arg_15_0
			end) then
				table.insert(var_14_2, iter_14_1)
			end
		end

		if #var_14_2 <= 0 then
			return
		end

		shuffle(var_14_2)

		local var_14_3 = pg.island_action.get_id_list_by_type[IslandConst.ANIMATION_OP_SIGNLE]
		local var_14_4 = arg_14_1:GetActionAgency()
		local var_14_5 = _.select(var_14_3, function(arg_16_0)
			return var_14_4:ExistAction(arg_16_0)
		end)

		if #var_14_5 <= 0 then
			return
		end

		for iter_14_2 = 1, var_14_1 do
			local var_14_6 = var_14_2[iter_14_2]

			if var_14_6 then
				local var_14_7 = var_14_5[math.random(1, #var_14_5)]

				var_14_6:SetActionFeedback(var_14_7)
			end
		end
	end
end

function var_0_0.CollectFollowUnits(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0

	for iter_17_0, iter_17_1 in ipairs(arg_17_0) do
		if iter_17_1:IsPlayer() then
			var_17_0 = iter_17_1

			break
		end
	end

	if not var_17_0 then
		return
	end

	local var_17_1 = var_17_0.position
	local var_17_2 = var_17_0.rotation
	local var_17_3 = arg_17_2:GetFollowerAgency()

	for iter_17_2, iter_17_3 in ipairs(var_17_3:GetFollowers()) do
		local var_17_4 = arg_17_2:GetCharacterAgency():GetShipById(iter_17_3)
		local var_17_5 = var_17_4:GetModelUnit()

		table.insert(arg_17_1, IslandFollowerUnitVO.New(var_17_4.id, iter_17_3, var_17_5, var_17_1, var_17_2, iter_17_2 == 1))
	end
end

function var_0_0.CollectSystems(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	var_0_0.CollectPordunctSystem(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	var_0_0.CollectManageSystem(arg_18_0, arg_18_1, arg_18_2, arg_18_3)

	local var_18_0 = pg.island_map[arg_18_3]

	if var_18_0.minigame_id > 0 then
		table.insert(arg_18_0, IslandSeekGameSystemVO.New(var_18_0.minigame_id, IslandConst.SEEK_GAME_SYSTEM_ID))
	elseif arg_18_3 == IslandConst.AGORA_MAP_ID then
		table.insert(arg_18_0, IslandGroundSystemVO.New(IslandConst.AGORA_GROUND_SYSTEM_ID))
		table.insert(arg_18_0, IslandGrassLandSystemVO.New(IslandConst.AGORA_GRASSLAND))
	end
end

function var_0_0.CollectManageSystem(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = arg_19_2:GetManageAgency():GetRestaurants()

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		if iter_19_1:getConfig("map_id") == arg_19_3 then
			local var_19_1 = IslandManageSystemVO.New(iter_19_1.id, iter_19_1)

			table.insert(arg_19_0, var_19_1)

			if iter_19_1:GetStatus() == IslandRestaurant.STATUS.OPENING then
				for iter_19_2, iter_19_3 in ipairs(var_19_1:GetUnits()) do
					table.insert(arg_19_1, iter_19_3)
				end
			end
		end
	end
end

function var_0_0.CollectPordunctSystem(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0 = pg.island_production_place.get_id_list_by_map_id[arg_20_3] or {}
	local var_20_1 = arg_20_2:GetBuildingAgency()

	local function var_20_2(arg_21_0)
		local var_21_0

		for iter_21_0, iter_21_1 in ipairs(arg_20_4) do
			if iter_21_1.id == arg_21_0 then
				var_21_0 = iter_21_1
			end
		end

		return var_21_0
	end

	local var_20_3 = {
		IslandProductConst.PasturePlaceId,
		IslandProductConst.FarmlandPlaceId,
		IslandProductConst.OrchardPlaceId,
		IslandProductConst.GardenPlaceId
	}

	for iter_20_0, iter_20_1 in ipairs(IslandProductConst.FactorytPlaces) do
		table.insert(var_20_3, iter_20_1)
	end

	for iter_20_2, iter_20_3 in ipairs(var_20_0) do
		local var_20_4 = var_20_2(iter_20_3)
		local var_20_5 = IslandCharacterSystemVO.New(iter_20_3, var_20_4, arg_20_2.id)
		local var_20_6 = var_20_1:GetBuilding(iter_20_3)
		local var_20_7 = 0

		if var_20_6 then
			local var_20_8 = var_20_6:GetShipIdAndAreaIdList()

			for iter_20_4, iter_20_5 in ipairs(var_20_8) do
				if iter_20_3 ~= IslandProductConst.MinePlaceId then
					local var_20_9 = var_20_5:GetUnit(iter_20_5.ship_id, iter_20_5.area_id, table.contains(var_20_3, iter_20_3))

					table.insert(arg_20_1, var_20_9)
				end

				var_20_7 = var_20_7 + 1
			end

			var_20_5:SetkCurrentWorkerList(var_20_8)
		end

		var_20_5:SetWorkerCnt(var_20_7)
		table.insert(arg_20_0, var_20_5)

		if var_20_4 and table.contains(IslandProductConst.havePerformPlace, iter_20_3) then
			if var_20_6 then
				local var_20_10 = var_20_6:GetDelegateingSlotAndFormulaList()

				for iter_20_6, iter_20_7 in ipairs(var_20_10) do
					local var_20_11 = var_20_4:GetDelegateUnitsByBuildIdAndSlotId(iter_20_3, iter_20_7.area_id, iter_20_7.formula_id)

					for iter_20_8, iter_20_9 in ipairs(var_20_11) do
						table.insert(arg_20_1, iter_20_9)
					end

					local var_20_12 = var_20_4:GetDelegateEffectsByCommissonId(iter_20_7.area_id)

					if var_20_12 then
						local var_20_13 = var_20_4:GenUnitByDelegateEffectId(var_20_12)

						if var_20_13 then
							table.insert(arg_20_1, var_20_13)
						end
					end
				end
			end

			table.insert(arg_20_0, var_20_4)
		end
	end
end

function var_0_0.SceneData2IslandUnits(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5, arg_22_6)
	local var_22_0 = pg.island_world_objects.get_id_list_by_mapId[arg_22_3] or {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		local var_22_1 = pg.island_world_objects[iter_22_1]

		if var_22_1.unitId > 0 and (var_22_1.gen_type == IslandConst.UNIT_GEN_TYPE_STATIC or var_22_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC) then
			local var_22_2 = var_0_0.WorldObj2IslandUnit(var_22_1)

			table.insert(arg_22_0, var_22_2)
		elseif var_22_1.unitId > 0 and var_22_1.gen_type == IslandConst.UNIT_GEN_TYPE_ACTIVITY then
			local var_22_3 = var_0_0.WorldObj2IslandUnit(var_22_1)

			table.insert(arg_22_1, var_22_3)
		end
	end

	for iter_22_2, iter_22_3 in pairs(arg_22_2) do
		if iter_22_3:IsSelf() then
			local var_22_4 = var_0_0.PlayerData2IslandUnit(iter_22_3, arg_22_3, arg_22_6, arg_22_4, arg_22_5)

			table.insert(arg_22_0, var_22_4)
		end
	end

	local var_22_5 = var_0_0.TakePhotoData2IslandUnit(2)

	table.insert(arg_22_0, var_22_5)

	local var_22_6 = var_0_0.TakePhotoData2IslandUnit(3)

	table.insert(arg_22_0, var_22_6)
end

local function var_0_1(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	if arg_23_1 then
		return
	end

	if arg_23_0 ~= arg_23_2.mapId then
		return
	end

	arg_23_3.position = {
		arg_23_2.position.x,
		arg_23_2.position.y,
		arg_23_2.position.z
	}
	arg_23_3.rotation = {
		arg_23_2.rotation.x,
		arg_23_2.rotation.y,
		arg_23_2.rotation.z
	}
end

function var_0_0.PlayerData2IslandUnit(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
	local var_24_0
	local var_24_1
	local var_24_2 = pg.island_world_objects.get_id_list_by_mapId[arg_24_1] or {}

	for iter_24_0, iter_24_1 in ipairs(var_24_2) do
		local var_24_3 = pg.island_world_objects[iter_24_1]

		if var_24_3.unitId == 0 then
			var_24_0 = var_24_3

			break
		end
	end

	assert(var_24_0)

	if arg_24_0:IsSelf() then
		local var_24_4 = {
			id = arg_24_0.id,
			unitId = arg_24_0:GetModelId(),
			typ = IslandConst.UNIT_TYPE_PLAYER
		}
		local var_24_5 = arg_24_3 and pg.island_world_objects[arg_24_3] or var_24_0

		if var_24_5.mapId ~= arg_24_1 then
			var_24_5 = var_24_0
		end

		var_0_1(arg_24_1, arg_24_3, arg_24_4, var_24_4)

		var_24_1 = var_0_0.WorldObj2IslandUnit(var_24_5, var_24_4)
	else
		local var_24_6 = {
			behaviourTree = "Island/NodeCanvas/Visitor",
			id = arg_24_0.id,
			unitId = arg_24_0:GetModelId(),
			typ = IslandConst.UNIT_TYPE_VISITOR,
			islandId = arg_24_2
		}

		var_24_1 = var_0_0.WorldObj2IslandUnit(var_24_0, var_24_6)
	end

	return var_24_1
end

function var_0_0.ModelId2IslandUnit(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = pg.island_world_objects[arg_25_0] or {}
	local var_25_1

	if var_25_0.mapId == arg_25_2 then
		local var_25_2 = {
			unitId = arg_25_1,
			typ = arg_25_3
		}

		var_25_1 = var_0_0.WorldObj2IslandUnit(var_25_0, var_25_2)
	end

	return var_25_1
end

function var_0_0.WorldObj2IslandUnit(arg_26_0, arg_26_1)
	arg_26_1 = arg_26_1 or {}

	local var_26_0 = arg_26_1.typ or arg_26_0.type
	local var_26_1

	if var_26_0 == IslandConst.UNIT_TYPE_ITEM_INTERACT then
		var_26_1 = IslandInteractUnitVO
	elseif var_26_0 == IslandConst.UNIT_TYPE_ITEM_GATHER_ITEM or var_26_0 == IslandConst.UNIT_TYPE_ITEM_WILD_COLLECT_ITEM then
		var_26_1 = IslandGatherUnitVO
	elseif var_26_0 == IslandConst.UNIT_TYPE_VISITOR then
		var_26_1 = IslandVistorUnitVO
	else
		var_26_1 = IslandUnitVO
	end

	return (var_26_1.New({
		id = arg_26_1.id or arg_26_0.id,
		modelId = arg_26_1.unitId or arg_26_0.unitId,
		type = arg_26_1.typ or arg_26_0.type,
		name = arg_26_0.name,
		position = arg_26_1.position or arg_26_0.param.position,
		rotation = arg_26_1.rotation or arg_26_0.param.rotation,
		scale = arg_26_0.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_26_1.behaviourTree or arg_26_0.behaviourTree,
		genType = arg_26_0.gen_type,
		showCondition = arg_26_0.show_param or {},
		hideCondition = arg_26_0.hide_param or {},
		index = arg_26_1.index or 0,
		islandId = arg_26_1.islandId
	}))
end

function var_0_0.TakePhotoData2IslandUnit(arg_27_0)
	local var_27_0 = {
		unitId = 20024,
		id = arg_27_0,
		typ = IslandConst.UNIT_TYPE_FIRST_TAKE_PHOTO_ITEM
	}

	return (IslandUnitVO.New({
		index = 0,
		behaviourTree = "",
		genType = 1,
		id = var_27_0.id,
		modelId = var_27_0.unitId,
		type = var_27_0.typ,
		name = "TakePhoto" .. arg_27_0,
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

function var_0_0.GenDelayRecycleIslandUnit(arg_28_0)
	local var_28_0 = pg.island_world_objects[arg_28_0.id]
	local var_28_1 = {
		id = arg_28_0.id,
		unitId = arg_28_0.unitId,
		position = {
			arg_28_0.position.x,
			arg_28_0.position.y,
			arg_28_0.position.z
		},
		rotation = {
			arg_28_0.rotation.x,
			arg_28_0.rotation.y,
			arg_28_0.rotation.z
		},
		behaviourTree = arg_28_0.behaviourTree,
		recycleAssetType = arg_28_0.recycleAssetType,
		delayRecycleTime = arg_28_0.delayRecycleTime
	}

	return var_0_0.WorldObj2IslandDelayRecycleUnit(var_28_0, var_28_1)
end

function var_0_0.WorldObj2IslandDelayRecycleUnit(arg_29_0, arg_29_1)
	arg_29_1 = arg_29_1 or {}

	return (IslandDelayRecycleUnitVO.New({
		id = arg_29_1.id or arg_29_0.id,
		modelId = arg_29_1.unitId or arg_29_0.unitId,
		type = IslandConst.UNIT_TYPE_ITEM_DELAY_RECYCLE,
		name = arg_29_0.name .. "delay",
		position = arg_29_1.position or arg_29_0.param.position,
		rotation = arg_29_1.rotation or arg_29_0.param.rotation,
		scale = arg_29_0.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_29_1.behaviourTree or arg_29_0.behaviourTree,
		genType = arg_29_0.gen_type,
		showCondition = arg_29_0.show_param or {},
		hideCondition = arg_29_0.hide_param or {},
		index = arg_29_1.index or 0,
		delayRecycleTime = arg_29_1.delayRecycleTime,
		recycleAssetType = arg_29_1.recycleAssetType
	}))
end

function var_0_0.GenWildGatherUnit(arg_30_0)
	local var_30_0 = pg.island_world_objects[arg_30_0.unitId]

	return (var_0_0.WorldObj2IslandUnit(var_30_0, {
		index = arg_30_0.islandId,
		typ = arg_30_0.gatherType
	}))
end

function var_0_0.GenInteractUnitByAgoraFurniture(arg_31_0)
	return (IslandVirtualInteractUnitVO.New({
		index = 0,
		id = arg_31_0.id,
		modelId = arg_31_0.pointId,
		type = IslandConst.UNIT_TYPE_VIRTUAL_INTERACT,
		name = "AgoraInteract" .. arg_31_0.id,
		position = arg_31_0.position,
		rotation = arg_31_0.rotation,
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
