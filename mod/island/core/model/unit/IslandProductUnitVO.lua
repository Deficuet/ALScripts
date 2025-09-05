local var_0_0 = class("IslandProductUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	if arg_1_1.productType == 1 then
		arg_1_0.slotData = arg_1_0:HandPlantSlotData(arg_1_1)
		arg_1_0.end_time = arg_1_0.slotData.end_time
		arg_1_0.start_time = arg_1_0.slotData.start_time
	end

	arg_1_0.formuluaId = arg_1_1.formuluaId
	arg_1_0.unitList = pg.island_formula[arg_1_1.formuluaId].unitid

	local var_1_0

	if #arg_1_0.unitList > 1 then
		local var_1_1 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_1_2 = math.min(1, (var_1_1 - arg_1_0.start_time) / (arg_1_0.end_time - arg_1_0.start_time))

		var_1_2 = var_1_2 < 0 and 0 or var_1_2

		for iter_1_0, iter_1_1 in ipairs(arg_1_0.unitList) do
			if var_1_2 >= iter_1_1[1] then
				var_1_0 = iter_1_1[2]
				arg_1_0.process = iter_1_1[1]
			end
		end
	else
		var_1_0 = unitList[1][1]
	end

	arg_1_1.modelId = var_1_0

	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.HandPlantSlotData(arg_2_0, arg_2_1)
	local var_2_0 = 1001
	local var_2_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_2_2 = arg_2_1.slotId

	for iter_2_0, iter_2_1 in pairs(var_2_1:GetBuildingListByMap(var_2_0)) do
		local var_2_3 = iter_2_1:GetHandPlantSlotData(var_2_2)

		if var_2_3 then
			return var_2_3
		end
	end

	return nil
end

function var_0_0.ChangeModel(arg_3_0)
	local var_3_0

	if #arg_3_0.unitList > 1 then
		local var_3_1 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_3_2 = math.min(1, (var_3_1 - arg_3_0.start_time) / (arg_3_0.end_time - arg_3_0.start_time))

		var_3_2 = var_3_2 < 0 and 0 or var_3_2

		local var_3_3

		for iter_3_0, iter_3_1 in ipairs(arg_3_0.unitList) do
			if var_3_2 >= iter_3_1[1] then
				var_3_0 = iter_3_1[2]
				var_3_3 = iter_3_1[1]
			end
		end

		if var_3_3 ~= arg_3_0.process then
			arg_3_0.process = var_3_3
			arg_3_0.modelId = var_3_0

			return true
		end

		return false
	end

	return false
end

return var_0_0
