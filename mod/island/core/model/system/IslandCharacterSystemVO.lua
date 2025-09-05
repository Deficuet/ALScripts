local var_0_0 = class("IslandCharacterSystemVO", import(".IslandSystemVO"))
local var_0_1 = 0
local var_0_2 = 1

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.isSelf = arg_1_0:IsSelf(arg_1_3)
	arg_1_0.id = arg_1_1
	arg_1_0.name = "_system_" .. arg_1_0.id
	arg_1_0.slotDic = {}

	arg_1_0:InitCfgData(arg_1_0.id)

	arg_1_0.config = pg.island_production_place[arg_1_0.id]
	arg_1_0.behaviourTree = arg_1_0.config.behaviourTree
	arg_1_0.worker = 0
	arg_1_0.productSystem = arg_1_2
end

function var_0_0.IsSelf(arg_2_0, arg_2_1)
	return getProxy(PlayerProxy):getRawData().id == arg_2_1
end

function var_0_0.GetType(arg_3_0)
	return IslandConst.SYSTEM_TYPE_CHARACTER
end

function var_0_0.InitCfgData(arg_4_0, arg_4_1)
	local var_4_0 = pg.island_production_place[arg_4_1].commission_slot

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_1 = pg.island_production_commission[iter_4_1]

		arg_4_0.slotDic[var_4_1.slot] = iter_4_1
	end
end

function var_0_0.GetUnit(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = {
		402,
		602,
		601,
		702,
		102,
		101,
		901
	}

	if not arg_5_3 and not table.contains(var_5_0, arg_5_0.id) then
		return
	end

	local var_5_1 = arg_5_0.slotDic[arg_5_2]
	local var_5_2 = pg.island_production_commission[var_5_1]
	local var_5_3 = pg.island_world_objects[var_5_2.birthplace]

	if not var_5_3 then
		return nil
	end

	local var_5_4

	if arg_5_0.config.interactionType == var_0_1 and not arg_5_3 then
		local var_5_5 = arg_5_0:GetObjId(arg_5_2)
		local var_5_6 = pg.island_world_objects[var_5_5]
		local var_5_7 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_5_6.param.position), 2)

		var_5_4 = {
			var_5_7.x,
			var_5_7.y,
			var_5_7.z
		}
	else
		var_5_4 = var_5_3.param.position
	end

	local var_5_8

	if arg_5_0.isSelf then
		var_5_8 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_5_1):GetModelUnit()
	else
		var_5_8 = pg.island_chara_template[arg_5_1].unit_id
	end

	local var_5_9 = arg_5_1 == 1 and arg_5_0.config.chickenbehaviourTree or arg_5_0.config.npcbehaviourTree

	return IslandUnitVO.New({
		id = arg_5_1,
		modelId = var_5_8,
		type = IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION,
		name = "system_unit" .. arg_5_1,
		position = var_5_4,
		rotation = Vector3.zero,
		scale = Vector3.one,
		behaviourTree = var_5_9
	})
end

function var_0_0.GetObjId(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.slotDic[arg_6_1]

	return pg.island_production_commission[var_6_0].performanceObjid
end

function var_0_0.GetperformanceObjidList(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {}

	if arg_7_0.id == IslandProductSystemVO.FarmlandPlaceId then
		local var_7_1 = pg.island_production_slot[arg_7_1]

		for iter_7_0, iter_7_1 in ipairs(var_7_1.exclusion_slot) do
			local var_7_2 = arg_7_0.productSystem:GetUnitIdBySlotId(iter_7_1)
			local var_7_3 = {
				unitId = var_7_2,
				unitType = IslandConst.UNIT_LIST_OBJ
			}

			table.insert(var_7_0, var_7_3)
		end
	elseif arg_7_0.id == IslandProductSystemVO.MinePlaceId or arg_7_0.id == IslandProductSystemVO.FellingPlaceId or arg_7_0.id == IslandProductSystemVO.TechnologyPlaceId then
		local var_7_4 = arg_7_0.slotDic[arg_7_1]
		local var_7_5 = pg.island_production_commission[var_7_4]
		local var_7_6 = {
			unitId = var_7_5.performanceObjid,
			unitType = IslandConst.UNIT_LIST_OBJ
		}

		table.insert(var_7_0, var_7_6)
	elseif arg_7_0.id == IslandProductSystemVO.PasturePlaceId then
		local var_7_7 = pg.island_production_slot[arg_7_1]

		for iter_7_2, iter_7_3 in ipairs(var_7_7.animal) do
			local var_7_8 = pg.island_ranch_animal[iter_7_3]
			local var_7_9 = {
				unitId = iter_7_3,
				unitType = IslandConst.UNIT_LIST_DELEGATION_ANIMATION
			}

			table.insert(var_7_0, var_7_9)
		end
	end

	return var_7_0
end

function var_0_0.SetWorkerCnt(arg_8_0, arg_8_1)
	arg_8_0.worker = arg_8_1
end

function var_0_0.GetWorkerCnt(arg_9_0)
	return arg_9_0.worker
end

function var_0_0.SetkCurrentWorkerList(arg_10_0, arg_10_1)
	arg_10_0.workerList = arg_10_1
end

function var_0_0.GetWorkerList(arg_11_0)
	return arg_11_0.workerList
end

function var_0_0.GetBehaviourTree(arg_12_0)
	if arg_12_0.behaviourTree == "" then
		return nil
	end

	return arg_12_0.behaviourTree
end

return var_0_0
