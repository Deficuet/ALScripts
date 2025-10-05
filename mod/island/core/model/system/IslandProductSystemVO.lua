local var_0_0 = class("IslandProductSystemVO", import(".IslandSystemVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.isSelf = arg_1_0:IsSelf(arg_1_3)
	arg_1_0.productPlaceId = arg_1_1
	arg_1_0.building = arg_1_2
	arg_1_0.unitDic = {}

	arg_1_0:InitCfgData()
end

function var_0_0.IsSelf(arg_2_0, arg_2_1)
	return getProxy(PlayerProxy):getRawData().id == arg_2_1
end

function var_0_0.InitCfgData(arg_3_0)
	arg_3_0.slotToUnitDic = {}

	arg_3_0:InitCommissionCfgData()
	arg_3_0:InitHandPlantCfg()
	arg_3_0:InitHandCollectCfg()
end

function var_0_0.InitHandPlantCfg(arg_4_0)
	local var_4_0 = {
		IslandProductConst.FarmlandPlaceId,
		IslandProductConst.OrchardPlaceId,
		IslandProductConst.GardenPlaceId
	}

	if not table.contains(var_4_0, arg_4_0.productPlaceId) then
		return
	end

	arg_4_0.workUnitDic = {}

	for iter_4_0, iter_4_1 in ipairs(pg.island_production_farm.get_id_list_by_place_id[arg_4_0.productPlaceId] or {}) do
		local var_4_1 = pg.island_production_farm[iter_4_1]
		local var_4_2 = var_4_1.objId
		local var_4_3 = var_4_1.slotId

		arg_4_0.slotToUnitDic[var_4_3] = var_4_2

		if not arg_4_0.workUnitDic[var_4_2] then
			arg_4_0.workUnitDic[var_4_2] = {}
			arg_4_0.workUnitDic[var_4_2].idle_unit = var_4_1.idle_unit
			arg_4_0.workUnitDic[var_4_2].work_unit = var_4_1.work_unit
		end
	end
end

function var_0_0.InitHandCollectCfg(arg_5_0)
	if arg_5_0.productPlaceId == IslandProductConst.MinePlaceId then
		return
	end

	for iter_5_0, iter_5_1 in ipairs(pg.island_production_mining.all) do
		local var_5_0 = pg.island_production_mining[iter_5_1]

		if not arg_5_0.slotToUnitDic[var_5_0.slotId] then
			arg_5_0.slotToUnitDic[var_5_0.slotId] = var_5_0.objId
		end
	end
end

function var_0_0.GetUnitDatas(arg_6_0)
	local var_6_0 = {}

	arg_6_0:GenHandCollectSlot(var_6_0)
	arg_6_0:GenHandPlantSlot(var_6_0)
	arg_6_0:GenAnimalBySlot(var_6_0)
	arg_6_0:GenPlaceModelUnit(var_6_0)

	return var_6_0
end

function var_0_0.GenPlaceModelUnit(arg_7_0, arg_7_1)
	if not table.contains(IslandProductConst.haveModelPlaces, arg_7_0.productPlaceId) then
		return
	end

	local var_7_0 = arg_7_0.building ~= nil
	local var_7_1 = arg_7_0:GetPlaceModelUnit(var_7_0)

	table.insert(arg_7_1, var_7_1)
end

function var_0_0.GetPlaceModelId(arg_8_0, arg_8_1)
	if arg_8_1 then
		return pg.island_production_place[arg_8_0.productPlaceId].unlocked_obj
	else
		return pg.island_production_place[arg_8_0.productPlaceId].locked_obj
	end
end

function var_0_0.GetPlaceModelUnit(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:GetPlaceModelId(arg_9_1)
	local var_9_1 = pg.island_world_objects[var_9_0]

	return IslandDataConvertor.WorldObj2IslandUnit(var_9_1)
end

function var_0_0.InitCommissionCfgData(arg_10_0)
	arg_10_0.slotCommissionDic = {}

	local var_10_0 = pg.island_production_place[arg_10_0.productPlaceId].commission_slot

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_1 = pg.island_production_commission[iter_10_1]

		arg_10_0.slotCommissionDic[var_10_1.slot] = iter_10_1
	end
end

function var_0_0.GetCommissionSlotId(arg_11_0, arg_11_1)
	return arg_11_0.slotCommissionDic[arg_11_1]
end

function var_0_0.GenHandCollectSlot(arg_12_0, arg_12_1)
	if not arg_12_0.building or not arg_12_0.isSelf then
		return
	end

	arg_12_0:GenHandCollectSlotInSlotPlace(arg_12_1)
end

function var_0_0.GenHandCollectSlotInSlotPlace(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.building:GetBuildingCollectData()

	if not var_13_0 then
		return
	end

	local var_13_1 = var_13_0:GetCollectSlotDatasDic()

	for iter_13_0, iter_13_1 in pairs(var_13_1) do
		local var_13_2 = arg_13_0:GenHandCollectSlotByDataNew(iter_13_1)

		table.insert(arg_13_1, var_13_2)
	end
end

function var_0_0.GetHandCollectSlotBySlotId(arg_14_0, arg_14_1)
	local var_14_0 = (arg_14_0.building or (arg_14_0.isSelf and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetBuildingAgency():GetBuilding(arg_14_0.productPlaceId)):GetBuildingCollectData():GetCollectSlotData(arg_14_1)

	return arg_14_0.productPlaceId == IslandProductConst.MinePlaceId and var_14_0.pos or arg_14_0.slotToUnitDic[var_14_0.configId]
end

function var_0_0.GenHandCollectSlotByDataNew(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.productPlaceId == IslandProductConst.MinePlaceId
	local var_15_1 = var_15_0 and arg_15_1.pos or arg_15_0.slotToUnitDic[arg_15_1.configId]
	local var_15_2 = pg.island_production_slot[arg_15_1.configId].formula[1]
	local var_15_3 = pg.island_formula[var_15_2].unitid[1][2]
	local var_15_4
	local var_15_5 = arg_15_1:GetCanCollectTimeStamps()

	if var_15_5 ~= 0 and var_15_0 then
		var_15_4 = var_15_5 - pg.TimeMgr.GetInstance():GetServerTime()
	end

	local var_15_6 = {
		unitId = var_15_3,
		typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT,
		slotId = arg_15_1.configId,
		delayTime = var_15_4
	}
	local var_15_7 = pg.island_world_objects[var_15_1] or {}

	return (arg_15_0:CollectSlotObj2IslandUnit(var_15_7, var_15_6))
end

function var_0_0.InitHandCollectSlotBySlotId(arg_16_0, arg_16_1)
	local var_16_0 = (arg_16_0.building or (arg_16_0.isSelf and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetBuildingAgency():GetBuilding(arg_16_0.productPlaceId)):GetCollectSlotData(arg_16_1)

	return arg_16_0:GenHandCollectSlotByDataNew(var_16_0)
end

function var_0_0.GenHandPlantSlot(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in ipairs(pg.island_production_farm.get_id_list_by_place_id[arg_17_0.productPlaceId] or {}) do
		local var_17_0 = pg.island_production_farm[iter_17_1]
		local var_17_1 = var_17_0.objId
		local var_17_2 = var_17_0.slotId
		local var_17_3 = var_17_0.unlock_unit
		local var_17_4 = IslandProductConst.ProductSlotType.HandPlant
		local var_17_5

		if arg_17_0.building then
			local var_17_6 = arg_17_0.building.handSlotData[var_17_2]

			if var_17_6 then
				var_17_3 = var_17_0.idle_unit
				var_17_5 = var_17_6:GetPlantFormulaId() or nil

				if var_17_5 then
					var_17_3 = var_17_0.work_unit
				else
					local var_17_7 = pg.island_production_slot[var_17_2].exclusion_slot[1]
					local var_17_8 = arg_17_0.building:GetDelegationSlotData(var_17_7)

					if var_17_8 and not var_17_8:CanStartDelegation() then
						var_17_3 = var_17_0.work_unit
						var_17_4 = IslandProductConst.ProductSlotType.RoleDelegation
						var_17_5 = var_17_8:GetFormulaId()
					end
				end
			end
		end

		local var_17_9 = {
			unitId = var_17_3,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
			formula_id = var_17_5,
			slotId = var_17_2,
			slotType = var_17_4
		}
		local var_17_10 = pg.island_world_objects[var_17_1] or {}
		local var_17_11 = arg_17_0:ProductSlotObj2IslandUnit(var_17_10, var_17_9)

		table.insert(arg_17_1, var_17_11)
	end
end

function var_0_0.GenAnimalBySlot(arg_18_0, arg_18_1)
	if not arg_18_0.building then
		return
	end

	if arg_18_0.productPlaceId ~= IslandProductConst.PasturePlaceId then
		return
	end

	for iter_18_0, iter_18_1 in pairs(arg_18_0.building:GetDelegationSlotDatas()) do
		local var_18_0 = pg.island_production_slot[iter_18_0]
		local var_18_1 = arg_18_0:GetCommissionSlotId(iter_18_0)
		local var_18_2 = pg.island_production_commission[var_18_1]

		for iter_18_2, iter_18_3 in ipairs(iter_18_1:GetPartList()) do
			local var_18_3 = pg.island_ranch_animal[iter_18_3]
			local var_18_4 = pg.island_world_objects[var_18_2.birthplace] or {}
			local var_18_5 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_18_4.param.position), 5)
			local var_18_6 = {
				var_18_5.x,
				var_18_5.y,
				var_18_5.z
			}
			local var_18_7 = arg_18_0:ProductAniObj2IslandUnit(var_18_3, var_18_6)

			table.insert(arg_18_1, var_18_7)
		end
	end
end

function var_0_0.GenAnimalByAnialConfig(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0:GetCommissionSlotId(arg_19_2)
	local var_19_1 = pg.island_production_commission[var_19_0]
	local var_19_2 = pg.island_ranch_animal[arg_19_1]
	local var_19_3 = pg.island_world_objects[var_19_1.birthplace] or {}
	local var_19_4 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_19_3.param.position), 5)
	local var_19_5 = {
		var_19_4.x,
		var_19_4.y,
		var_19_4.z
	}

	return (arg_19_0:ProductAniObj2IslandUnit(var_19_2, var_19_5))
end

function var_0_0.GenHandPlantUnitBySlotData(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0:GetUnitIdBySlotId(arg_20_1)
	local var_20_1 = arg_20_0.workUnitDic[var_20_0]
	local var_20_2 = arg_20_2 and var_20_1.work_unit or var_20_1.idle_unit
	local var_20_3 = arg_20_0.unitDic[var_20_0]

	if var_20_3 then
		var_20_3.modelId = var_20_2

		var_20_3:ChangeSlotType(IslandProductConst.ProductSlotType.HandPlant)
		var_20_3:StartPlantGrowthTime(arg_20_2)
	else
		local var_20_4 = {
			unitId = var_20_2,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
			formula_id = arg_20_2,
			slotId = arg_20_1,
			slotType = IslandProductConst.ProductSlotType.HandPlant
		}
		local var_20_5 = pg.island_world_objects[var_20_0] or {}

		var_20_3 = arg_20_0:ProductSlotObj2IslandUnit(var_20_5, var_20_4)
	end

	return var_20_3
end

function var_0_0.GetUnitIdBySlotId(arg_21_0, arg_21_1)
	return arg_21_0.slotToUnitDic[arg_21_1]
end

function var_0_0.GetUnitVOByUnitId(arg_22_0, arg_22_1)
	return arg_22_0.unitDic[arg_22_1]
end

function var_0_0.ProductSlotObj2IslandUnit(arg_23_0, arg_23_1, arg_23_2)
	arg_23_2 = arg_23_2 or {}

	local var_23_0 = IslandProductSlotUnitVO.New({
		id = arg_23_1.id,
		modelId = arg_23_2.unitId or arg_23_1.unitId,
		type = arg_23_2.typ or arg_23_1.type,
		name = arg_23_1.name,
		position = arg_23_1.param.position,
		rotation = arg_23_1.param.rotation,
		scale = arg_23_1.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_23_1.behaviourTree,
		isDynamic = arg_23_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC,
		showCondition = arg_23_1.show_param or {},
		hideCondition = arg_23_1.hide_param or {},
		formula_id = arg_23_2.formula_id,
		slotId = arg_23_2.slotId,
		slotType = arg_23_2.slotType,
		isSelfIsland = arg_23_0.isSelf
	})

	arg_23_0.unitDic[var_23_0.id] = var_23_0

	return var_23_0
end

function var_0_0.CollectSlotObj2IslandUnit(arg_24_0, arg_24_1, arg_24_2)
	arg_24_2 = arg_24_2 or {}

	return (IslandCollectSlotUnitVO.New({
		id = arg_24_1.id,
		modelId = arg_24_2.unitId or arg_24_1.unitId,
		type = arg_24_2.typ or arg_24_1.type,
		name = arg_24_1.name,
		position = arg_24_1.param.position,
		rotation = arg_24_1.param.rotation,
		scale = arg_24_1.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_24_1.behaviourTree,
		isDynamic = arg_24_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC,
		showCondition = arg_24_1.show_param or {},
		hideCondition = arg_24_1.hide_param or {},
		formula_id = arg_24_2.formula_id,
		slotId = arg_24_2.slotId,
		slotType = arg_24_2.slotType,
		isSelfIsland = arg_24_0.isSelf,
		delayTime = arg_24_2.delayTime
	}))
end

function var_0_0.ProductAniObj2IslandUnit(arg_25_0, arg_25_1, arg_25_2)
	return IslandUnitVO.New({
		behaviourTree = "island/nodecanvas/system/system_npc_animal",
		id = arg_25_1.id,
		modelId = arg_25_1.unit_id,
		type = IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION,
		name = "system_unit" .. arg_25_1.id,
		position = arg_25_2,
		rotation = Vector3.zero,
		scale = Vector3.one
	})
end

return var_0_0
