local var_0_0 = class("IslandProductSystemVO", import(".IslandSystemVO"))

var_0_0.FarmlandPlaceId = 101
var_0_0.PasturePlaceId = 102
var_0_0.MilkTeaPlaceId = 601
var_0_0.MealPlaceId = 602
var_0_0.MinePlaceId = 401
var_0_0.FellingPlaceId = 402
var_0_0.TechnologyPlaceId = 702
var_0_0.CoffeePlaceId = 901
var_0_0.SlotType = {
	HandPlant = 2,
	HandCollect = 1,
	RoleDelegation = 3
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.isSelf = arg_1_0:IsSelf(arg_1_3)
	arg_1_0.productId = arg_1_1
	arg_1_0.building = arg_1_2
	arg_1_0.slotUnitDic = {}

	arg_1_0:InitCfgData()
end

function var_0_0.IsSelf(arg_2_0, arg_2_1)
	return getProxy(PlayerProxy):getRawData().id == arg_2_1
end

function var_0_0.InitCfgData(arg_3_0)
	arg_3_0.cfgData = {}
	arg_3_0.slotDic = {}

	arg_3_0:InitCommissionCfgData()
	arg_3_0:InitHandPlantCfg()
	arg_3_0:InitHandCollectCfg()
end

function var_0_0.InitHandPlantCfg(arg_4_0)
	if arg_4_0.productId ~= var_0_0.FarmlandPlaceId then
		return
	end

	for iter_4_0, iter_4_1 in ipairs(pg.island_production_farm.all) do
		local var_4_0 = pg.island_production_farm[iter_4_1]
		local var_4_1 = var_4_0.objId
		local var_4_2 = var_4_0.slotId

		arg_4_0.cfgData[var_4_2] = var_4_1
	end
end

function var_0_0.InitHandCollectCfg(arg_5_0)
	if arg_5_0.productId == var_0_0.MinePlaceId then
		return
	end

	for iter_5_0, iter_5_1 in ipairs(pg.island_production_mining.all) do
		local var_5_0 = pg.island_production_mining[iter_5_1]

		if not arg_5_0.cfgData[var_5_0.slotId] then
			arg_5_0.cfgData[var_5_0.slotId] = var_5_0.objId
		end
	end
end

function var_0_0.GetUnitDatas(arg_6_0)
	local var_6_0 = {}

	arg_6_0:GenHandCollectSlot(var_6_0)
	arg_6_0:GenHandPlantSlot(var_6_0)
	arg_6_0:GenAnimalBySlot(var_6_0)

	return var_6_0
end

function var_0_0.InitCommissionCfgData(arg_7_0)
	local var_7_0 = pg.island_production_place[arg_7_0.productId].commission_slot

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = pg.island_production_commission[iter_7_1]

		arg_7_0.slotDic[var_7_1.slot] = iter_7_1
	end
end

function var_0_0.GetCommissionSlotId(arg_8_0, arg_8_1)
	return arg_8_0.slotDic[arg_8_1]
end

function var_0_0.GenHandCollectSlot(arg_9_0, arg_9_1)
	if not arg_9_0.building then
		return
	end

	if arg_9_0.productId ~= var_0_0.MinePlaceId then
		for iter_9_0, iter_9_1 in pairs(arg_9_0.building:GetCollectSlotDatas()) do
			local var_9_0 = arg_9_0.cfgData[iter_9_1.configId]
			local var_9_1 = pg.island_production_slot[iter_9_1.configId].formula[1]
			local var_9_2 = pg.island_formula[var_9_1].unitid[1][2]
			local var_9_3 = {
				unitId = var_9_2,
				typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT,
				formula_id = var_9_1,
				slotId = iter_9_1.configId,
				slotType = var_0_0.SlotType.HandCollect
			}
			local var_9_4 = pg.island_world_objects[var_9_0] or {}
			local var_9_5 = arg_9_0:ProductSlotObj2IslandUnit(var_9_4, var_9_3)

			table.insert(arg_9_1, var_9_5)
		end

		return
	end

	for iter_9_2, iter_9_3 in pairs(arg_9_0.building:GetCollectSlotDatas()) do
		if iter_9_3:GetCanCollectTime() ~= 0 then
			local var_9_6 = iter_9_3.pos
			local var_9_7 = pg.island_production_slot[iter_9_3.configId].formula[1]
			local var_9_8 = pg.island_formula[var_9_7].unitid[1][2]
			local var_9_9 = {
				unitId = var_9_8,
				typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT,
				formula_id = var_9_7,
				slotId = iter_9_3.configId,
				slotType = var_0_0.SlotType.HandCollect
			}
			local var_9_10 = pg.island_world_objects[var_9_6] or {}
			local var_9_11 = arg_9_0:ProductSlotObj2IslandUnit(var_9_10, var_9_9)

			table.insert(arg_9_1, var_9_11)
		else
			iter_9_3:SetNeedLoadModel()
		end
	end
end

function var_0_0.GenHandPlantSlot(arg_10_0, arg_10_1)
	if arg_10_0.productId == var_0_0.FarmlandPlaceId then
		for iter_10_0, iter_10_1 in ipairs(pg.island_production_farm.all) do
			local var_10_0 = pg.island_production_farm[iter_10_1]
			local var_10_1 = var_10_0.objId
			local var_10_2 = var_10_0.slotId
			local var_10_3
			local var_10_4
			local var_10_5
			local var_10_6

			if not arg_10_0.building then
				var_10_3 = var_10_0.unlock_unit
				var_10_5 = var_0_0.SlotType.HandPlant
			else
				local var_10_7 = arg_10_0.building.handSlotData[var_10_2]

				if not var_10_7 then
					var_10_3 = var_10_0.unlock_unit
					var_10_5 = var_0_0.SlotType.HandPlant
				else
					var_10_6 = var_10_7:GetPlantFormulaId() or nil

					if var_10_6 then
						var_10_3 = var_10_0.work_unit
						var_10_5 = var_0_0.SlotType.HandPlant
					else
						local var_10_8 = pg.island_production_slot[var_10_2].exclusion_slot[1]
						local var_10_9 = arg_10_0.building:GetDelegationSlotData(var_10_8)

						if not var_10_9 then
							var_10_3 = var_10_0.idle_unit
							var_10_5 = var_0_0.SlotType.HandPlant
						elseif var_10_9:CanStartDelegation() then
							var_10_3 = var_10_0.idle_unit
							var_10_5 = var_0_0.SlotType.HandPlant
						else
							var_10_3 = var_10_0.work_unit
							var_10_5 = var_0_0.SlotType.RoleDelegation
							var_10_6 = var_10_9:GetFormulaId()
						end
					end
				end
			end

			local var_10_10 = {
				unitId = var_10_3,
				typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
				formula_id = var_10_6,
				slotId = var_10_2,
				slotType = var_10_5
			}
			local var_10_11 = pg.island_world_objects[var_10_1] or {}
			local var_10_12 = arg_10_0:ProductSlotObj2IslandUnit(var_10_11, var_10_10)

			table.insert(arg_10_1, var_10_12)
		end
	end
end

function var_0_0.GenAnimalBySlot(arg_11_0, arg_11_1)
	if not arg_11_0.building then
		return
	end

	if arg_11_0.productId ~= var_0_0.PasturePlaceId then
		return
	end

	for iter_11_0, iter_11_1 in pairs(arg_11_0.building:GetDelegationSlotDatas()) do
		local var_11_0 = pg.island_production_slot[iter_11_0]
		local var_11_1 = arg_11_0:GetCommissionSlotId(iter_11_0)
		local var_11_2 = pg.island_production_commission[var_11_1]

		for iter_11_2, iter_11_3 in ipairs(iter_11_1:GetPartList()) do
			local var_11_3 = pg.island_ranch_animal[iter_11_3]
			local var_11_4 = pg.island_world_objects[var_11_2.birthplace] or {}
			local var_11_5 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_11_4.param.position), 5)
			local var_11_6 = {
				var_11_5.x,
				var_11_5.y,
				var_11_5.z
			}
			local var_11_7 = arg_11_0:ProductAniObj2IslandUnit(var_11_3, var_11_6)

			table.insert(arg_11_1, var_11_7)
		end
	end
end

function var_0_0.GenAnimalByAnialConfig(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = pg.island_production_slot[arg_12_2]
	local var_12_1 = arg_12_0:GetCommissionSlotId(arg_12_2)
	local var_12_2 = pg.island_production_commission[var_12_1]
	local var_12_3 = pg.island_ranch_animal[arg_12_1]
	local var_12_4 = pg.island_world_objects[var_12_2.birthplace] or {}
	local var_12_5 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_12_4.param.position), 5)
	local var_12_6 = {
		var_12_5.x,
		var_12_5.y,
		var_12_5.z
	}

	return (arg_12_0:ProductAniObj2IslandUnit(var_12_3, var_12_6))
end

function var_0_0.GenHandPlantUnitBySlotData(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_2 and 1002 or 1001
	local var_13_1 = arg_13_0:GetUnitIdBySlotId(arg_13_1)
	local var_13_2 = arg_13_0.slotUnitDic[var_13_1]

	if var_13_2 then
		var_13_2.modelId = var_13_0

		var_13_2:ChangeSlotType(var_0_0.SlotType.HandPlant)
		var_13_2:SetHandPlantFormulaid(arg_13_2)
		var_13_2:InitGrowthTime()
		var_13_2:InitProductModelId()
	else
		local var_13_3 = {
			unitId = var_13_0,
			typ = IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING,
			formula_id = arg_13_2,
			slotId = arg_13_1,
			slotType = var_0_0.SlotType.HandPlant
		}
		local var_13_4 = pg.island_world_objects[var_13_1] or {}

		var_13_2 = arg_13_0:ProductSlotObj2IslandUnit(var_13_4, var_13_3)
	end

	return var_13_2
end

function var_0_0.GetUnitIdBySlotId(arg_14_0, arg_14_1)
	return arg_14_0.cfgData[arg_14_1]
end

function var_0_0.GetUnitVOByUnitId(arg_15_0, arg_15_1)
	return arg_15_0.slotUnitDic[arg_15_1]
end

function var_0_0.ProductSlotObj2IslandUnit(arg_16_0, arg_16_1, arg_16_2)
	arg_16_2 = arg_16_2 or {}

	local var_16_0 = IslandSlotUnitVO.New({
		id = arg_16_1.id,
		modelId = arg_16_2.unitId or arg_16_1.unitId,
		type = arg_16_2.typ or arg_16_1.type,
		name = arg_16_1.name,
		position = arg_16_1.param.position,
		rotation = arg_16_1.param.rotation,
		scale = arg_16_1.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_16_1.behaviourTree,
		isDynamic = arg_16_1.gen_type == IslandConst.UNIT_GEN_TYPE_DYNAMIC,
		showCondition = arg_16_1.show_param or {},
		hideCondition = arg_16_1.hide_param or {},
		formula_id = arg_16_2.formula_id,
		slotId = arg_16_2.slotId,
		slotType = arg_16_2.slotType,
		isSelfIsland = arg_16_0.isSelf
	})

	arg_16_0.slotUnitDic[var_16_0.id] = var_16_0

	return var_16_0
end

function var_0_0.ProductAniObj2IslandUnit(arg_17_0, arg_17_1, arg_17_2)
	return IslandUnitVO.New({
		behaviourTree = "island/nodecanvas/system/system_npc_animal",
		id = arg_17_1.id,
		modelId = arg_17_1.unit_id,
		type = IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION,
		name = "system_unit" .. arg_17_1.id,
		position = arg_17_2,
		rotation = Vector3.zero,
		scale = Vector3.one
	})
end

return var_0_0
