local var_0_0 = class("IslandBuildingAgency", import(".IslandBaseAgency"))

var_0_0.SlOT_UNIT_INIT = "IslandBuildingAgency:SlOT_UNIT_INIT"
var_0_0.SLOT_UNIT_REMOVE = "IslandBuildingAgency:SLOT_UNIT_REMOVE"
var_0_0.SLOT_HANDPLABT_SLOT_UNIT_CHANGE = "IslandBuildingAgency:SLOT_HANDPLABT_SLOT_UNIT_CHANGE"
var_0_0.SLOT_RESET_DELEGATION_STATE_DONE = "IslandBuildingAgency:SLOT_RESET_DELEGATION_STATE_DONE"
var_0_0.GEN_ANIMAL_INT = "IslandBuildingAgency:GEN_ANIMAL_INT"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.buildings = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.build_list or {}) do
		local var_1_0 = IslandBuilding.New(iter_1_1, arg_1_0:IsSelf(arg_1_1.id))

		arg_1_0.buildings[iter_1_1.id] = var_1_0
	end
end

function var_0_0.InitPrivateData(arg_2_0, arg_2_1)
	arg_2_0.formulaNums = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.formula_num or {}) do
		arg_2_0.formulaNums[iter_2_1.id] = iter_2_1.num
	end
end

function var_0_0.IsSelf(arg_3_0, arg_3_1)
	return arg_3_1 == getProxy(PlayerProxy):getRawData().id
end

function var_0_0.GetBuilding(arg_4_0, arg_4_1)
	return arg_4_0.buildings[arg_4_1]
end

function var_0_0.GetBuildings(arg_5_0)
	return arg_5_0.buildings
end

function var_0_0.GetBuildingList(arg_6_0)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0.buildings) do
		table.insert(var_6_0, iter_6_1)
	end

	return var_6_0
end

function var_0_0.UpdateBuilding(arg_7_0, arg_7_1)
	arg_7_0.buildings[arg_7_1.id] = arg_7_1
end

function var_0_0.UpdatePerSecond(arg_8_0)
	for iter_8_0, iter_8_1 in pairs(arg_8_0.buildings) do
		iter_8_1:UpdatePerSecond()
	end
end

function var_0_0.InitSlotDataByAbility(arg_9_0, arg_9_1)
	local var_9_0 = pg.island_ability_template[arg_9_1].effect
	local var_9_1 = pg.island_production_slot[var_9_0]
	local var_9_2 = var_9_1.place
	local var_9_3 = arg_9_0:GetBuilding(var_9_2)

	if not var_9_3 then
		warning("需要先解锁产地,再解锁产地上的槽位")

		return
	end

	if var_9_1.type == 1 then
		var_9_3:InitSlotHandPlantByAbility(var_9_0)
		getProxy(IslandProxy):GetIsland():DispatchEvent(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, {
			build_id = var_9_2,
			slotId = var_9_0
		})
	elseif var_9_1.type == 9 or var_9_1.type == 3 then
		var_9_3:InitSlotRoleDataByAbility(var_9_0)
	end
end

function var_0_0.InitBuildData(arg_10_0, arg_10_1)
	if arg_10_0.buildings[arg_10_1.id] then
		warning("产地已经解锁过了,下发的产地id是" .. arg_10_1.id)

		return
	end

	local var_10_0 = IslandBuilding.New(arg_10_1, true)

	arg_10_0.buildings[arg_10_1.id] = var_10_0

	for iter_10_0, iter_10_1 in ipairs(arg_10_1.collect_list or {}) do
		var_10_0:GetCollectSlotData(iter_10_1.id):SetNeedLoadModel()
	end

	for iter_10_2, iter_10_3 in ipairs(arg_10_1.hand_list or {}) do
		getProxy(IslandProxy):GetIsland():DispatchEvent(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, {
			build_id = arg_10_1.id,
			slotId = iter_10_3.id
		})
	end

	for iter_10_4, iter_10_5 in ipairs(arg_10_1.appoint_list or {}) do
		local var_10_1 = {}

		for iter_10_6, iter_10_7 in ipairs(iter_10_5.part_list) do
			table.insert(var_10_1, iter_10_7)
		end

		if #var_10_1 > 0 then
			getProxy(IslandProxy):GetIsland():DispatchEvent(IslandBuildingAgency.GEN_ANIMAL_INT, {
				aniList = var_10_1,
				slotId = iter_10_5.id
			})
		end
	end
end

function var_0_0.InitBuildAnimalDataByAbility(arg_11_0, arg_11_1)
	local var_11_0 = pg.island_ranch_animal[arg_11_1].slot_id
	local var_11_1 = pg.island_production_slot[var_11_0].place
	local var_11_2 = arg_11_0.buildings[var_11_1]

	if not var_11_2 then
		return
	end

	local var_11_3 = var_11_2:GetDelegationSlotData(var_11_0)

	if not var_11_3 then
		return
	end

	var_11_3:AddAnimal(arg_11_1)
	getProxy(IslandProxy):GetIsland():DispatchEvent(IslandBuildingAgency.GEN_ANIMAL_INT, {
		aniList = {
			arg_11_1
		},
		slotId = var_11_0
	})
end

function var_0_0.InitHandSlotData(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.id
	local var_12_1 = pg.island_production_slot[var_12_0].place
	local var_12_2 = arg_12_0:GetBuilding(var_12_1)

	if not var_12_2 then
		warning("需要先解锁产地,再解锁产地上的槽位")

		return
	end

	var_12_2:InitHandSlotData(arg_12_1)
end

function var_0_0.GetMinimumDelegationCompletionTimeByMapId(arg_13_0, arg_13_1)
	local var_13_0 = pg.island_production_place.get_id_list_by_map_id[arg_13_1] or {}
	local var_13_1

	for iter_13_0, iter_13_1 in ipairs(var_13_0) do
		local var_13_2 = arg_13_0.buildings[iter_13_1]

		if var_13_2 then
			local var_13_3 = var_13_2:GetMinRoleDeleGationTime()

			if var_13_3 ~= -1 then
				var_13_1 = var_13_1 and math.min(var_13_3, var_13_1) or var_13_3
			end
		end
	end

	return var_13_1 and var_13_1 or -1
end

function var_0_0.GetDelegationSlotDataByTechId(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.buildings[IslandTechnologyAgency.PLACE_ID]

	if not var_14_0 then
		return
	end

	local var_14_1 = pg.island_technology_template[arg_14_1].formula_id

	return var_14_0:GetDelegationSlotDataByFormulaId(var_14_1)
end

function var_0_0.GetBuildingListByMap(arg_15_0, arg_15_1)
	local var_15_0 = pg.island_production_place.get_id_list_by_map_id[arg_15_1] or {}
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_2 = arg_15_0.buildings[iter_15_1]

		table.insert(var_15_1, var_15_2)
	end

	return var_15_1
end

function var_0_0.OnSeasonReset(arg_16_0)
	return
end

function var_0_0.GetFormulaNums(arg_17_0)
	return arg_17_0.formulaNums
end

function var_0_0.AddFormulaNum(arg_18_0, arg_18_1, arg_18_2)
	if pg.island_formula[arg_18_1].is_condition ~= 1 then
		return
	end

	if arg_18_0.formulaNums[arg_18_1] then
		arg_18_0.formulaNums[arg_18_1] = arg_18_0.formulaNums[arg_18_1] + arg_18_2
	else
		arg_18_0.formulaNums[arg_18_1] = arg_18_2
	end
end

return var_0_0
