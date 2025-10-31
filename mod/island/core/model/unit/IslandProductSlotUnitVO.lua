local var_0_0 = class("IslandProductSlotUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.slotId = arg_1_1.slotId
	arg_1_0.isSelfIsland = arg_1_1.isSelfIsland

	arg_1_0:ChangeSlotType(arg_1_1.slotType)
	arg_1_0:StartPlantGrowthTime(arg_1_1.formula_id)
end

function var_0_0.ChangeSlotType(arg_2_0, arg_2_1)
	arg_2_0.slotType = arg_2_1

	arg_2_0:BindSlotData()
	arg_2_0:InitGrowthEndTime()
end

function var_0_0.InitGrowthEndTime(arg_3_0)
	if not arg_3_0.slotData then
		return
	end

	switch(arg_3_0.slotType, {
		[IslandProductConst.ProductSlotType.HandPlant] = function()
			arg_3_0.logic_startTime = arg_3_0.slotData.start_time
			arg_3_0.end_time = arg_3_0.slotData.end_time
		end,
		[IslandProductConst.ProductSlotType.RoleDelegation] = function()
			local var_5_0 = arg_3_0.slotData:GetSlotRoleData()

			if var_5_0 then
				arg_3_0.logic_startTime = var_5_0.start_time
				arg_3_0.end_time = arg_3_0.logic_startTime + var_5_0.cost_time_list[1]
			else
				arg_3_0.logic_startTime = pg.TimeMgr.GetInstance():GetServerTime()
				arg_3_0.end_time = arg_3_0.logic_startTime
			end
		end
	})
end

function var_0_0.GetEndProductEndTime(arg_6_0)
	if not arg_6_0.slotData then
		return
	end

	if arg_6_0.slotType == IslandProductConst.ProductSlotType.HandPlant then
		return arg_6_0.slotData.end_time
	else
		return arg_6_0.slotData.end_time
	end
end

function var_0_0.StartPlantGrowthTime(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.formula_id = arg_7_1

	if not arg_7_0.formula_id then
		arg_7_0.productProcess = {}

		return
	end

	arg_7_0.startGrowthTime = arg_7_2 or arg_7_0.logic_startTime

	local var_7_0 = pg.island_formula[arg_7_0.formula_id].unitid

	arg_7_0.productProcess = {}

	local var_7_1 = arg_7_0.end_time - arg_7_0.startGrowthTime

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_2 = math.floor(iter_7_1[1] * var_7_1) + arg_7_0.startGrowthTime
		local var_7_3 = iter_7_1[2]

		table.insert(arg_7_0.productProcess, {
			startTime = var_7_2,
			model = var_7_3
		})
	end
end

function var_0_0.StartDelegateSlotPerform(arg_8_0)
	local var_8_0 = arg_8_0.slotData:GetFormulaId()

	arg_8_0:StartPlantGrowthTime(var_8_0, pg.TimeMgr.GetInstance():GetServerTime())
end

function var_0_0.BindSlotData(arg_9_0)
	switch(arg_9_0.slotType, {
		[IslandProductConst.ProductSlotType.HandPlant] = function()
			arg_9_0.slotData = arg_9_0:HandPlantSlotData()
		end,
		[IslandProductConst.ProductSlotType.RoleDelegation] = function()
			arg_9_0.slotData = arg_9_0:HandDelegationData()
		end
	})
end

function var_0_0.GetProductProcess(arg_12_0)
	return arg_12_0.productProcess
end

function var_0_0.HandPlantSlotData(arg_13_0)
	local var_13_0

	if arg_13_0.isSelfIsland then
		var_13_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	else
		var_13_0 = getProxy(IslandProxy):GetSharedIsland():GetBuildingAgency()
	end

	local var_13_1 = arg_13_0.slotId
	local var_13_2 = pg.island_production_slot[var_13_1].place
	local var_13_3 = var_13_0:GetBuilding(var_13_2)

	if not var_13_3 then
		return nil
	end

	local var_13_4 = var_13_3:GetHandPlantSlotData(var_13_1)

	if var_13_4 then
		return var_13_4
	end

	return nil
end

function var_0_0.HandDelegationData(arg_14_0)
	local var_14_0

	if arg_14_0.isSelfIsland then
		var_14_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	else
		var_14_0 = getProxy(IslandProxy):GetSharedIsland():GetBuildingAgency()
	end

	local var_14_1 = arg_14_0.slotId
	local var_14_2 = pg.island_production_slot[var_14_1].exclusion_slot[1]
	local var_14_3 = pg.island_production_slot[var_14_1].place
	local var_14_4 = var_14_0:GetBuilding(var_14_3)

	if not var_14_4 then
		return nil
	end

	local var_14_5 = var_14_4:GetDelegationSlotData(var_14_2)

	if var_14_5 then
		return var_14_5
	end

	return nil
end

function var_0_0.SetHighLight(arg_15_0, arg_15_1)
	arg_15_0.isHighLight = arg_15_1
end

function var_0_0.GetHighLight(arg_16_0, arg_16_1)
	return arg_16_0.isHighLight
end

return var_0_0
