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
	local var_7_1 = arg_7_0:GetPlaceModelId(var_7_0)
	local var_7_2 = pg.island_world_objects[var_7_1]

	table.insert(arg_7_1, IslandDataConvertor.WorldObj2IslandUnit(var_7_2))
end

function var_0_0.GetPlaceModelId(arg_8_0, arg_8_1)
	if arg_8_1 then
		return pg.island_production_place[arg_8_0.productPlaceId].unlocked_obj
	else
		return pg.island_production_place[arg_8_0.productPlaceId].locked_obj
	end
end

function var_0_0.InitCommissionCfgData(arg_9_0)
	arg_9_0.slotCommissionDic = {}

	local var_9_0 = pg.island_production_place[arg_9_0.productPlaceId].commission_slot

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		local var_9_1 = pg.island_production_commission[iter_9_1]

		arg_9_0.slotCommissionDic[var_9_1.slot] = iter_9_1
	end
end

function var_0_0.GetCommissionSlotId(arg_10_0, arg_10_1)
	return arg_10_0.slotCommissionDic[arg_10_1]
end

function var_0_0.GenHandCollectSlot(arg_11_0, arg_11_1)
	if not arg_11_0.building then
		return
	end

	arg_11_0:GenHandCollectSlotInSlotPlace(arg_11_1)
end

function var_0_0.GenHandCollectSlotInSlotPlace(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.building:GetBuildingCollectData()

	if not var_12_0 then
		return
	end

	local var_12_1 = var_12_0:GetCollectSlotDatasDic()

	for iter_12_0, iter_12_1 in pairs(var_12_1) do
		local var_12_2 = arg_12_0:GenHandCollectSlotByDataNew(iter_12_1)

		table.insert(arg_12_1, var_12_2)
	end
end

function var_0_0.GetHandCollectSlotBySlotId(arg_13_0, arg_13_1)
	local var_13_0 = (arg_13_0.building or (arg_13_0.isSelf and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetBuildingAgency():GetBuilding(arg_13_0.productPlaceId)):GetBuildingCollectData():GetCollectSlotData(arg_13_1)

	return arg_13_0.productPlaceId == IslandProductConst.MinePlaceId and var_13_0.pos or arg_13_0.slotToUnitDic[var_13_0.configId]
end

function var_0_0.GenHandCollectSlotByDataNew(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.productPlaceId == IslandProductConst.MinePlaceId
	local var_14_1 = var_14_0 and arg_14_1.pos or arg_14_0.slotToUnitDic[arg_14_1.configId]
	local var_14_2 = pg.island_production_slot[arg_14_1.configId].formula[1]
	local var_14_3 = pg.island_formula[var_14_2].unitid[1][2]
	local var_14_4
	local var_14_5 = arg_14_1:GetCanCollectTimeStamps()

	if var_14_5 ~= 0 and var_14_0 then
		var_14_4 = var_14_5 - pg.TimeMgr.GetInstance():GetServerTime()
	end

	local var_14_6 = {
		unitId = var_14_3,
		typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT,
		slotId = arg_14_1.configId,
		delayTime = var_14_4
	}
	local var_14_7 = pg.island_world_objects[var_14_1] or {}

	return (arg_14_0:CollectSlotObj2IslandUnit(var_14_7, var_14_6))
end

function var_0_0.InitHandCollectSlotBySlotId(arg_15_0, arg_15_1)
	local var_15_0 = (arg_15_0.building or (arg_15_0.isSelf and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetBuildingAgency():GetBuilding(arg_15_0.productPlaceId)):GetCollectSlotData(arg_15_1)

	return arg_15_0:GenHandCollectSlotByDataNew(var_15_0)
end

function var_0_0.GenHandPlantSlot(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(pg.island_production_farm.get_id_list_by_place_id[arg_16_0.productPlaceId] or {}) do
		local var_16_0 = pg.island_production_farm[iter_16_1]
		local var_16_1 = var_16_0.objId
		local var_16_2 = var_16_0.slotId
		local var_16_3 = var_16_0.unlock_unit
		local var_16_4 = IslandProductConst.ProductSlotType.HandPlant
		local var_16_5

		if arg_16_0.building then
			local var_16_6 = arg_16_0.building.handSlotData[var_16_2]

			if var_16_6 then
				var_16_3 = var_16_0.idle_unit
				var_16_5 = var_16_6:GetPlantFormulaId() or nil

				if var_16_5 then
					var_16_3 = var_16_0.work_unit
				else
					local var_16_7 = pg.island_production_slot[var_16_2].exclusion_slot[1]
					local var_16_8 = arg_16_0.building:GetDelegationSlotData(var_16_7)

					if var_16_8 and not var_16_8:CanStartDelegation() then
						var_16_3 = var_16_0.work_unit
						var_16_4 = IslandProductConst.ProductSlotType.RoleDelegation
						var_16_5 = var_16_8:GetFormulaId()
					end
				end
			end
		end

		local var_16_9 = {
			unitId = var_16_3,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
			formula_id = var_16_5,
			slotId = var_16_2,
			slotType = var_16_4
		}
		local var_16_10 = pg.island_world_objects[var_16_1] or {}
		local var_16_11 = arg_16_0:ProductSlotObj2IslandUnit(var_16_10, var_16_9)

		table.insert(arg_16_1, var_16_11)
	end
end

function var_0_0.GenAnimalBySlot(arg_17_0, arg_17_1)
	if not arg_17_0.building then
		return
	end

	if arg_17_0.productPlaceId ~= IslandProductConst.PasturePlaceId then
		return
	end

	for iter_17_0, iter_17_1 in pairs(arg_17_0.building:GetDelegationSlotDatas()) do
		local var_17_0 = pg.island_production_slot[iter_17_0]
		local var_17_1 = arg_17_0:GetCommissionSlotId(iter_17_0)
		local var_17_2 = pg.island_production_commission[var_17_1]

		for iter_17_2, iter_17_3 in ipairs(iter_17_1:GetPartList()) do
			local var_17_3 = pg.island_ranch_animal[iter_17_3]
			local var_17_4 = pg.island_world_objects[var_17_2.birthplace] or {}
			local var_17_5 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_17_4.param.position), 5)
			local var_17_6 = {
				var_17_5.x,
				var_17_5.y,
				var_17_5.z
			}
			local var_17_7 = arg_17_0:ProductAniObj2IslandUnit(var_17_3, var_17_6)

			table.insert(arg_17_1, var_17_7)
		end
	end
end

function var_0_0.GenAnimalByAnialConfig(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0:GetCommissionSlotId(arg_18_2)
	local var_18_1 = pg.island_production_commission[var_18_0]
	local var_18_2 = pg.island_ranch_animal[arg_18_1]
	local var_18_3 = pg.island_world_objects[var_18_1.birthplace] or {}
	local var_18_4 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_18_3.param.position), 5)
	local var_18_5 = {
		var_18_4.x,
		var_18_4.y,
		var_18_4.z
	}

	return (arg_18_0:ProductAniObj2IslandUnit(var_18_2, var_18_5))
end

function var_0_0.GenHandPlantUnitBySlotData(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0:GetUnitIdBySlotId(arg_19_1)
	local var_19_1 = arg_19_0.workUnitDic[var_19_0]
	local var_19_2 = arg_19_2 and var_19_1.work_unit or var_19_1.idle_unit
	local var_19_3 = arg_19_0.unitDic[var_19_0]

	if var_19_3 then
		var_19_3.modelId = var_19_2

		var_19_3:ChangeSlotType(IslandProductConst.ProductSlotType.HandPlant)
		var_19_3:StartPlantGrowthTime(arg_19_2)
	else
		local var_19_4 = {
			unitId = var_19_2,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
			formula_id = arg_19_2,
			slotId = arg_19_1,
			slotType = IslandProductConst.ProductSlotType.HandPlant
		}
		local var_19_5 = pg.island_world_objects[var_19_0] or {}

		var_19_3 = arg_19_0:ProductSlotObj2IslandUnit(var_19_5, var_19_4)
	end

	return var_19_3
end

function var_0_0.GetUnitIdBySlotId(arg_20_0, arg_20_1)
	return arg_20_0.slotToUnitDic[arg_20_1]
end

function var_0_0.GetUnitVOByUnitId(arg_21_0, arg_21_1)
	return arg_21_0.unitDic[arg_21_1]
end

function var_0_0.ProductSlotObj2IslandUnit(arg_22_0, arg_22_1, arg_22_2)
	arg_22_2 = arg_22_2 or {}

	local var_22_0 = IslandProductSlotUnitVO.New({
		id = arg_22_1.id,
		modelId = arg_22_2.unitId or arg_22_1.unitId,
		type = arg_22_2.typ or arg_22_1.type,
		name = arg_22_1.name,
		position = arg_22_1.param.position,
		rotation = arg_22_1.param.rotation,
		scale = arg_22_1.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_22_1.behaviourTree,
		isDynamic = arg_22_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC,
		showCondition = arg_22_1.show_param or {},
		hideCondition = arg_22_1.hide_param or {},
		formula_id = arg_22_2.formula_id,
		slotId = arg_22_2.slotId,
		slotType = arg_22_2.slotType,
		isSelfIsland = arg_22_0.isSelf
	})

	arg_22_0.unitDic[var_22_0.id] = var_22_0

	return var_22_0
end

function var_0_0.CollectSlotObj2IslandUnit(arg_23_0, arg_23_1, arg_23_2)
	arg_23_2 = arg_23_2 or {}

	return (IslandCollectSlotUnitVO.New({
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
		isSelfIsland = arg_23_0.isSelf,
		delayTime = arg_23_2.delayTime
	}))
end

function var_0_0.ProductAniObj2IslandUnit(arg_24_0, arg_24_1, arg_24_2)
	return IslandUnitVO.New({
		behaviourTree = "island/nodecanvas/system/system_npc_animal",
		id = arg_24_1.id,
		modelId = arg_24_1.unit_id,
		type = IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION,
		name = "system_unit" .. arg_24_1.id,
		position = arg_24_2,
		rotation = Vector3.zero,
		scale = Vector3.one
	})
end

return var_0_0
