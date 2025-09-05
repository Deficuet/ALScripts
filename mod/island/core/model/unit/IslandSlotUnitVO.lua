local var_0_0 = class("IslandSlotUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.formula_id = arg_1_1.formula_id
	arg_1_0.slotType = arg_1_1.slotType
	arg_1_0.slotId = arg_1_1.slotId
	arg_1_0.isSelfIsland = arg_1_1.isSelfIsland

	arg_1_0:BindSlotData()
	arg_1_0:InitGrowthTime()
	arg_1_0:InitProductModelId()
end

function var_0_0.GetProductModelId(arg_2_0)
	return arg_2_0.productModelId
end

function var_0_0.SetHandPlantFormulaid(arg_3_0, arg_3_1)
	arg_3_0.formula_id = arg_3_1
end

function var_0_0.StartDelegateSlotPerform(arg_4_0)
	arg_4_0.start_time = pg.TimeMgr.GetInstance():GetServerTime()

	local var_4_0 = arg_4_0.slotData:GetSlotRoleData()

	arg_4_0.end_time = var_4_0.start_time + var_4_0.cost_time_list[1]
	arg_4_0.formula_id = arg_4_0.slotData:GetFormulaId()

	arg_4_0:InitProductModelId()
end

function var_0_0.ChangeSlotType(arg_5_0, arg_5_1)
	arg_5_0.slotType = arg_5_1

	arg_5_0:BindSlotData()
end

function var_0_0.InitGrowthTime(arg_6_0)
	if arg_6_0.slotType == IslandProductSystemVO.SlotType.HandPlant then
		if arg_6_0.slotData then
			arg_6_0.start_time = arg_6_0.slotData.start_time
			arg_6_0.end_time = arg_6_0.slotData.end_time
		end
	elseif arg_6_0.slotType == IslandProductSystemVO.SlotType.RoleDelegation then
		local var_6_0 = arg_6_0.slotData:GetSlotRoleData()

		if var_6_0 then
			arg_6_0.start_time = var_6_0.start_time
			arg_6_0.end_time = var_6_0.start_time + var_6_0.cost_time_list[1]
		end
	end
end

function var_0_0.InitProductModelId(arg_7_0)
	local function var_7_0()
		if arg_7_0.formula_id then
			local var_8_0 = pg.island_formula[arg_7_0.formula_id]

			arg_7_0.unitList = var_8_0.unitid

			local var_8_1
			local var_8_2

			if arg_7_0.unitList and #arg_7_0.unitList > 1 then
				var_8_1, var_8_2 = arg_7_0:GetCurrentProduct()
			else
				var_8_1 = arg_7_0.unitList[1][2]
				var_8_2 = arg_7_0.unitList[1][1]
			end

			if var_8_2 ~= 1 then
				arg_7_0.needPercendUpdate = true
			else
				arg_7_0.needPercendUpdate = false
			end

			arg_7_0.productModelId = var_8_1
			arg_7_0.process = var_8_2
		else
			arg_7_0.needPercendUpdate = false
			arg_7_0.productModelId = nil
		end
	end

	if arg_7_0.slotType == IslandProductSystemVO.SlotType.HandPlant then
		var_7_0()
	elseif arg_7_0.slotType == IslandProductSystemVO.SlotType.RoleDelegation then
		if arg_7_0.slotData:GetSlotRoleData() then
			var_7_0()
		elseif arg_7_0.formula_id then
			local var_7_1 = pg.island_formula[arg_7_0.formula_id]
			local var_7_2 = #var_7_1.unitid

			arg_7_0.productModelId = var_7_1.unitid[var_7_2][2]
			arg_7_0.needPercendUpdate = false
		else
			arg_7_0.needPercendUpdate = false
		end
	end
end

function var_0_0.GetCurrentProduct(arg_9_0)
	local var_9_0
	local var_9_1

	if arg_9_0.unitList and #arg_9_0.unitList > 1 then
		local var_9_2 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_9_3 = math.min(1, (var_9_2 - arg_9_0.start_time) / (arg_9_0.end_time - arg_9_0.start_time))

		var_9_3 = var_9_3 < 0 and 0 or var_9_3

		for iter_9_0, iter_9_1 in ipairs(arg_9_0.unitList) do
			if var_9_3 >= iter_9_1[1] then
				var_9_0 = iter_9_1[2]
				var_9_1 = iter_9_1[1]
			end
		end
	end

	return var_9_0, var_9_1
end

function var_0_0.ChangeModel(arg_10_0)
	if arg_10_0.needPercendUpdate == false then
		return
	end

	local var_10_0, var_10_1 = arg_10_0:GetCurrentProduct()

	if var_10_1 ~= arg_10_0.process then
		arg_10_0.process = var_10_1
		arg_10_0.productModelId = var_10_0

		return true
	end

	return false
end

function var_0_0.BindSlotData(arg_11_0)
	switch(arg_11_0.slotType, {
		[IslandProductSystemVO.SlotType.HandCollect] = function()
			arg_11_0.slotData = arg_11_0:HandCollectSlotData()
		end,
		[IslandProductSystemVO.SlotType.HandPlant] = function()
			arg_11_0.slotData = arg_11_0:HandPlantSlotData()
		end,
		[IslandProductSystemVO.SlotType.RoleDelegation] = function()
			arg_11_0.slotData = arg_11_0:HandDelegationData()
		end
	})
end

function var_0_0.HandCollectSlotData(arg_15_0)
	local var_15_0

	if arg_15_0.isSelfIsland then
		var_15_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	else
		var_15_0 = getProxy(IslandProxy):GetSharedIsland():GetBuildingAgency()
	end

	local var_15_1 = arg_15_0.slotId
	local var_15_2 = pg.island_production_slot[var_15_1].place
	local var_15_3 = var_15_0:GetBuilding(var_15_2)

	if not var_15_3 then
		return nil
	end

	local var_15_4 = var_15_3:GetCollectSlotDatas()

	for iter_15_0, iter_15_1 in pairs(var_15_4) do
		if iter_15_1.pos ~= 0 and iter_15_1.pos == arg_15_0.id then
			return iter_15_1
		end
	end

	local var_15_5 = var_15_3:GetCollectSlotData(var_15_1)

	if var_15_5 then
		return var_15_5
	end
end

function var_0_0.HandPlantSlotData(arg_16_0)
	local var_16_0

	if arg_16_0.isSelfIsland then
		var_16_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	else
		var_16_0 = getProxy(IslandProxy):GetSharedIsland():GetBuildingAgency()
	end

	local var_16_1 = arg_16_0.slotId
	local var_16_2 = pg.island_production_slot[var_16_1].place
	local var_16_3 = var_16_0:GetBuilding(var_16_2)

	if not var_16_3 then
		return nil
	end

	local var_16_4 = var_16_3:GetHandPlantSlotData(var_16_1)

	if var_16_4 then
		return var_16_4
	end

	return nil
end

function var_0_0.HandDelegationData(arg_17_0)
	local var_17_0

	if arg_17_0.isSelfIsland then
		var_17_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	else
		var_17_0 = getProxy(IslandProxy):GetSharedIsland():GetBuildingAgency()
	end

	local var_17_1 = arg_17_0.slotId
	local var_17_2 = pg.island_production_slot[var_17_1].exclusion_slot[1]
	local var_17_3 = pg.island_production_slot[var_17_1].place
	local var_17_4 = var_17_0:GetBuilding(var_17_3)

	if not var_17_4 then
		return nil
	end

	local var_17_5 = var_17_4:GetDelegationSlotData(var_17_2)

	if var_17_5 then
		return var_17_5
	end

	return nil
end

function var_0_0.SetHighLight(arg_18_0, arg_18_1)
	arg_18_0.isHighLight = arg_18_1
end

function var_0_0.GetHighLight(arg_19_0, arg_19_1)
	return arg_19_0.isHighLight
end

return var_0_0
