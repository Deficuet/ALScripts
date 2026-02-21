local var_0_0 = class("IslandProductSystemVO", import(".IslandSystemVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.isSelf = arg_1_0:IsSelf(arg_1_3)
	arg_1_0.productPlaceId = arg_1_1
	arg_1_0.building = arg_1_2
	arg_1_0.unitDic = {}
	arg_1_0.delegateSlotUnits = {}
	arg_1_0.delegateUnitsId = 1
	arg_1_0.commissionEffectDic = {}

	arg_1_0:InitCfgData()
end

function var_0_0.GetType(arg_2_0)
	return IslandConst.SYSTEM_TYPE_PRODUCT
end

function var_0_0.GetBehaviourTree(arg_3_0)
	return nil
end

function var_0_0.IsSelf(arg_4_0, arg_4_1)
	return getProxy(PlayerProxy):getRawData().id == arg_4_1
end

function var_0_0.InitCfgData(arg_5_0)
	arg_5_0.slotToUnitDic = {}

	arg_5_0:InitCommissionCfgData()
	arg_5_0:InitHandPlantCfg()
	arg_5_0:InitHandCollectCfg()
	arg_5_0:InitCommissionEffectCfg()
end

function var_0_0.InitCommissionEffectCfg(arg_6_0)
	local var_6_0 = pg.island_set.island_fishery_bubble_vfx

	for iter_6_0, iter_6_1 in ipairs(var_6_0.key_value_varchar) do
		arg_6_0.commissionEffectDic[iter_6_1[1]] = iter_6_1[2]
	end
end

function var_0_0.InitHandPlantCfg(arg_7_0)
	local var_7_0 = {
		IslandProductConst.FarmlandPlaceId,
		IslandProductConst.OrchardPlaceId,
		IslandProductConst.GardenPlaceId
	}

	if not table.contains(var_7_0, arg_7_0.productPlaceId) then
		return
	end

	arg_7_0.workUnitDic = {}

	for iter_7_0, iter_7_1 in ipairs(pg.island_production_farm.get_id_list_by_place_id[arg_7_0.productPlaceId] or {}) do
		local var_7_1 = pg.island_production_farm[iter_7_1]
		local var_7_2 = var_7_1.objId
		local var_7_3 = var_7_1.slotId

		arg_7_0.slotToUnitDic[var_7_3] = var_7_2

		if not arg_7_0.workUnitDic[var_7_2] then
			arg_7_0.workUnitDic[var_7_2] = {}
			arg_7_0.workUnitDic[var_7_2].idle_unit = var_7_1.idle_unit
			arg_7_0.workUnitDic[var_7_2].work_unit = var_7_1.work_unit
		end
	end
end

function var_0_0.InitHandCollectCfg(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(pg.island_production_mining.all) do
		local var_8_0 = pg.island_production_mining[iter_8_1]

		if not arg_8_0.slotToUnitDic[var_8_0.slotId] then
			arg_8_0.slotToUnitDic[var_8_0.slotId] = var_8_0.objId
		end
	end
end

function var_0_0.GetUnitDatas(arg_9_0)
	local var_9_0 = {}

	arg_9_0:GenHandCollectSlot(var_9_0)
	arg_9_0:GenHandPlantSlot(var_9_0)
	arg_9_0:GenAnimalBySlot(var_9_0)
	arg_9_0:GenPlaceModelUnit(var_9_0)
	arg_9_0:GenPlaceSlotModelUnit(var_9_0)

	return var_9_0
end

function var_0_0.GenPlaceSlotModelUnit(arg_10_0, arg_10_1)
	local var_10_0 = {
		IslandProductConst.FisheryPlaceId
	}

	if not table.contains(var_10_0, arg_10_0.productPlaceId) then
		return
	end

	local var_10_1 = pg.island_production_slot.get_id_list_by_place[arg_10_0.productPlaceId] or {}

	for iter_10_0, iter_10_1 in ipairs(var_10_1) do
		if pg.island_production_slot[iter_10_1].type == 9 then
			local var_10_2 = arg_10_0:GetCommissionSlotId(iter_10_1)
			local var_10_3 = pg.island_production_commission[var_10_2].unlockObjid

			if var_10_3 ~= 0 and (arg_10_0.building == nil or arg_10_0.building:GetDelegationSlotData(iter_10_1) == nil) then
				local var_10_4 = pg.island_world_objects[var_10_3]
				local var_10_5 = IslandDataConvertor.WorldObj2IslandUnit(var_10_4)

				table.insert(arg_10_1, var_10_5)
			end
		end
	end
end

function var_0_0.GenPlaceModelUnit(arg_11_0, arg_11_1)
	if not table.contains(IslandProductConst.haveModelPlaces, arg_11_0.productPlaceId) then
		return
	end

	local var_11_0 = arg_11_0.building ~= nil
	local var_11_1 = arg_11_0:GetPlaceModelUnit(var_11_0)

	table.insert(arg_11_1, var_11_1)
end

function var_0_0.GetPlaceModelId(arg_12_0, arg_12_1)
	if arg_12_1 then
		return pg.island_production_place[arg_12_0.productPlaceId].unlocked_obj
	else
		return pg.island_production_place[arg_12_0.productPlaceId].locked_obj
	end
end

function var_0_0.GetPlaceModelUnit(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:GetPlaceModelId(arg_13_1)
	local var_13_1 = pg.island_world_objects[var_13_0]

	return IslandDataConvertor.WorldObj2IslandUnit(var_13_1)
end

function var_0_0.InitCommissionCfgData(arg_14_0)
	arg_14_0.slotCommissionDic = {}

	local var_14_0 = pg.island_production_place[arg_14_0.productPlaceId].commission_slot

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		local var_14_1 = pg.island_production_commission[iter_14_1]

		arg_14_0.slotCommissionDic[var_14_1.slot] = iter_14_1
	end
end

function var_0_0.GetCommissionSlotId(arg_15_0, arg_15_1)
	return arg_15_0.slotCommissionDic[arg_15_1]
end

function var_0_0.GenHandCollectSlot(arg_16_0, arg_16_1)
	if not arg_16_0.building or not arg_16_0.isSelf then
		return
	end

	arg_16_0:GenHandCollectSlotInSlotPlace(arg_16_1)
end

function var_0_0.GenHandCollectSlotInSlotPlace(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.building:GetBuildingCollectData()

	if not var_17_0 then
		return
	end

	local var_17_1 = var_17_0:GetCollectSlotDatasDic()

	for iter_17_0, iter_17_1 in pairs(var_17_1) do
		local var_17_2 = arg_17_0:GenHandCollectSlotByDataNew(iter_17_1)

		if var_17_2 then
			table.insert(arg_17_1, var_17_2)
		end
	end
end

function var_0_0.GetHandCollectSlotBySlotId(arg_18_0, arg_18_1)
	local var_18_0 = (arg_18_0.building or (arg_18_0.isSelf and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetBuildingAgency():GetBuilding(arg_18_0.productPlaceId)):GetBuildingCollectData():GetCollectSlotData(arg_18_1)

	return arg_18_0.slotToUnitDic[var_18_0.configId]
end

function var_0_0.GenHandCollectSlotByDataNew(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.productPlaceId == IslandProductConst.FellingPlaceId
	local var_19_1 = arg_19_0.slotToUnitDic[arg_19_1.configId]
	local var_19_2 = pg.island_production_slot[arg_19_1.configId].formula[1]
	local var_19_3 = pg.island_formula[var_19_2].unitid[1][2]

	if arg_19_1:GetCanCollectTimeStamps() == 0 or var_19_0 then
		local var_19_4 = {
			unitId = var_19_3,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT,
			slotId = arg_19_1.configId
		}
		local var_19_5 = pg.island_world_objects[var_19_1] or {}

		return (arg_19_0:CollectSlotObj2IslandUnit(var_19_5, var_19_4))
	end
end

function var_0_0.InitHandCollectSlotBySlotId(arg_20_0, arg_20_1)
	local var_20_0 = (arg_20_0.building or (arg_20_0.isSelf and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetBuildingAgency():GetBuilding(arg_20_0.productPlaceId)):GetCollectSlotData(arg_20_1)

	return arg_20_0:GenHandCollectSlotByDataNew(var_20_0)
end

function var_0_0.GenHandPlantSlot(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(pg.island_production_farm.get_id_list_by_place_id[arg_21_0.productPlaceId] or {}) do
		local var_21_0 = pg.island_production_farm[iter_21_1]
		local var_21_1 = var_21_0.objId
		local var_21_2 = var_21_0.slotId
		local var_21_3 = var_21_0.unlock_unit
		local var_21_4 = IslandProductConst.ProductSlotType.HandPlant
		local var_21_5

		if arg_21_0.building then
			local var_21_6 = arg_21_0.building.handSlotData[var_21_2]

			if var_21_6 then
				var_21_3 = var_21_0.idle_unit
				var_21_5 = var_21_6:GetPlantFormulaId() or nil

				if var_21_5 then
					var_21_3 = var_21_0.work_unit
				else
					local var_21_7 = pg.island_production_slot[var_21_2].exclusion_slot[1]
					local var_21_8 = arg_21_0.building:GetDelegationSlotData(var_21_7)

					if var_21_8 and not var_21_8:CanStartDelegation() then
						var_21_3 = var_21_0.work_unit
						var_21_4 = IslandProductConst.ProductSlotType.RoleDelegation
						var_21_5 = var_21_8:GetFormulaId()
					end
				end
			end
		end

		local var_21_9 = {
			unitId = var_21_3,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
			formula_id = var_21_5,
			slotId = var_21_2,
			slotType = var_21_4
		}
		local var_21_10 = pg.island_world_objects[var_21_1] or {}
		local var_21_11 = arg_21_0:ProductSlotObj2IslandUnit(var_21_10, var_21_9)

		table.insert(arg_21_1, var_21_11)
	end
end

function var_0_0.GenAnimalBySlot(arg_22_0, arg_22_1)
	if not arg_22_0.building then
		return
	end

	if arg_22_0.productPlaceId ~= IslandProductConst.PasturePlaceId then
		return
	end

	for iter_22_0, iter_22_1 in pairs(arg_22_0.building:GetDelegationSlotDatas()) do
		local var_22_0 = pg.island_production_slot[iter_22_0]
		local var_22_1 = arg_22_0:GetCommissionSlotId(iter_22_0)
		local var_22_2 = pg.island_production_commission[var_22_1]

		for iter_22_2, iter_22_3 in ipairs(iter_22_1:GetPartList()) do
			local var_22_3 = pg.island_ranch_animal[iter_22_3]
			local var_22_4 = pg.island_world_objects[var_22_2.birthplace] or {}
			local var_22_5 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_22_4.param.position), 5)
			local var_22_6 = {
				var_22_5.x,
				var_22_5.y,
				var_22_5.z
			}
			local var_22_7 = arg_22_0:ProductAniObj2IslandUnit(var_22_3, var_22_6)

			table.insert(arg_22_1, var_22_7)
		end
	end
end

function var_0_0.GenAnimalByAnialConfig(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0:GetCommissionSlotId(arg_23_2)
	local var_23_1 = pg.island_production_commission[var_23_0]
	local var_23_2 = pg.island_ranch_animal[arg_23_1]
	local var_23_3 = pg.island_world_objects[var_23_1.birthplace] or {}
	local var_23_4 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_23_3.param.position), 5)
	local var_23_5 = {
		var_23_4.x,
		var_23_4.y,
		var_23_4.z
	}

	return (arg_23_0:ProductAniObj2IslandUnit(var_23_2, var_23_5))
end

function var_0_0.GenHandPlantUnitBySlotData(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0:GetUnitIdBySlotId(arg_24_1)
	local var_24_1 = arg_24_0.workUnitDic[var_24_0]
	local var_24_2 = arg_24_2 and var_24_1.work_unit or var_24_1.idle_unit
	local var_24_3 = arg_24_0.unitDic[var_24_0]

	if var_24_3 then
		var_24_3.modelId = var_24_2

		var_24_3:ChangeSlotType(IslandProductConst.ProductSlotType.HandPlant)
		var_24_3:StartPlantGrowthTime(arg_24_2)
	else
		local var_24_4 = {
			unitId = var_24_2,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
			formula_id = arg_24_2,
			slotId = arg_24_1,
			slotType = IslandProductConst.ProductSlotType.HandPlant
		}
		local var_24_5 = pg.island_world_objects[var_24_0] or {}

		var_24_3 = arg_24_0:ProductSlotObj2IslandUnit(var_24_5, var_24_4)
	end

	return var_24_3
end

function var_0_0.GetUnitIdBySlotId(arg_25_0, arg_25_1)
	return arg_25_0.slotToUnitDic[arg_25_1]
end

function var_0_0.GetUnitVOByUnitId(arg_26_0, arg_26_1)
	return arg_26_0.unitDic[arg_26_1]
end

function var_0_0.ProductSlotObj2IslandUnit(arg_27_0, arg_27_1, arg_27_2)
	arg_27_2 = arg_27_2 or {}

	local var_27_0 = IslandProductSlotUnitVO.New({
		id = arg_27_1.id,
		modelId = arg_27_2.unitId or arg_27_1.unitId,
		type = arg_27_2.typ or arg_27_1.type,
		name = arg_27_1.name,
		position = arg_27_1.param.position,
		rotation = arg_27_1.param.rotation,
		scale = arg_27_1.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_27_1.behaviourTree,
		isDynamic = arg_27_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC,
		showCondition = arg_27_1.show_param or {},
		hideCondition = arg_27_1.hide_param or {},
		formula_id = arg_27_2.formula_id,
		slotId = arg_27_2.slotId,
		slotType = arg_27_2.slotType,
		isSelfIsland = arg_27_0.isSelf
	})

	arg_27_0.unitDic[var_27_0.id] = var_27_0

	return var_27_0
end

function var_0_0.CollectSlotObj2IslandUnit(arg_28_0, arg_28_1, arg_28_2)
	arg_28_2 = arg_28_2 or {}

	return (IslandCollectSlotUnitVO.New({
		id = arg_28_1.id,
		modelId = arg_28_2.unitId or arg_28_1.unitId,
		type = arg_28_2.typ or arg_28_1.type,
		name = arg_28_1.name,
		position = arg_28_1.param.position,
		rotation = arg_28_1.param.rotation,
		scale = arg_28_1.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_28_1.behaviourTree,
		isDynamic = arg_28_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC,
		showCondition = arg_28_1.show_param or {},
		hideCondition = arg_28_1.hide_param or {},
		formula_id = arg_28_2.formula_id,
		slotId = arg_28_2.slotId,
		slotType = arg_28_2.slotType,
		isSelfIsland = arg_28_0.isSelf
	}))
end

function var_0_0.ProductAniObj2IslandUnit(arg_29_0, arg_29_1, arg_29_2)
	return IslandUnitVO.New({
		behaviourTree = "island/nodecanvas/system/system_npc_animal",
		id = arg_29_1.id,
		modelId = arg_29_1.unit_id,
		type = IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION,
		name = "system_unit" .. arg_29_1.id,
		position = arg_29_2,
		rotation = Vector3.zero,
		scale = Vector3.one
	})
end

function var_0_0.GetDelegateUnitsByBuildIdAndSlotId(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = {}

	switch(arg_30_1, {
		[IslandProductConst.FisheryPlaceId] = function()
			var_30_0 = arg_30_0:GetDelegateFishUnits(arg_30_2, arg_30_3)
		end
	})

	return var_30_0
end

function var_0_0.GetDelegateEffectsByCommissonId(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:GetCommissionSlotId(arg_32_1)

	return arg_32_0.commissionEffectDic[var_32_0]
end

function var_0_0.GenUnitByDelegateEffectId(arg_33_0, arg_33_1)
	local var_33_0 = pg.island_world_objects[arg_33_1]

	if var_33_0 then
		local var_33_1 = {
			typ = IslandConst.UNIT_TYPE_ITEM
		}

		return (IslandDataConvertor.WorldObj2IslandUnit(var_33_0, var_33_1))
	end
end

function var_0_0.GetDelegateFishUnits(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = {}
	local var_34_1 = arg_34_0:GetCommissionSlotId(arg_34_1)
	local var_34_2 = pg.island_production_commission[var_34_1]
	local var_34_3 = pg.island_formula[arg_34_2]
	local var_34_4 = var_34_3.unitid[1][1]
	local var_34_5 = pg.island_world_objects[var_34_2.performanceObjid]
	local var_34_6 = math.random(var_34_3.unitid[2][1], var_34_3.unitid[2][2])
	local var_34_7 = var_34_3.unitid[2][3]

	for iter_34_0 = 1, var_34_6 do
		local var_34_8 = arg_34_0.delegateUnitsId

		arg_34_0.delegateSlotUnits[var_34_1] = arg_34_0.delegateSlotUnits[var_34_1] or {}

		table.insert(arg_34_0.delegateSlotUnits[var_34_1], var_34_8)

		arg_34_0.delegateUnitsId = arg_34_0.delegateUnitsId + 1

		local var_34_9 = arg_34_0:GenDelegateFishUnit(var_34_8, var_34_4, var_34_5, var_34_7)

		table.insert(var_34_0, var_34_9)
	end

	return var_34_0
end

function var_0_0.GetDelegatUnitsBySlotId(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0:GetCommissionSlotId(arg_35_1)

	return arg_35_0.delegateSlotUnits[var_35_0] or {}
end

function var_0_0.GetDelegateSlotUnits(arg_36_0)
	return arg_36_0.delegateSlotUnits
end

function var_0_0.GenDelegateFishUnit(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	return IslandDelegateFishVO.New({
		behaviourTree = "",
		id = arg_37_1,
		modelId = arg_37_2,
		type = IslandConst.UNIT_TYPE_DELEGATE_FISH,
		name = pg.island_unit_character[arg_37_2].id,
		position = arg_37_3.param.position,
		rotation = Vector3.zero,
		scale = Vector3.one,
		speed = arg_37_4
	})
end

return var_0_0
