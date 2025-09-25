local var_0_0 = class("IslandCollectSlotUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.isSelfIsland = arg_1_1.isSelfIsland
	arg_1_0.slotId = arg_1_1.slotId

	arg_1_0:BindSlotData()
end

function var_0_0.BindSlotData(arg_2_0)
	arg_2_0.slotData = arg_2_0:HandCollectSlotData()
end

function var_0_0.HandCollectSlotData(arg_3_0)
	local var_3_0

	if arg_3_0.isSelfIsland then
		var_3_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	else
		var_3_0 = getProxy(IslandProxy):GetSharedIsland():GetBuildingAgency()
	end

	local var_3_1 = pg.island_production_slot[arg_3_0.slotId].place
	local var_3_2 = var_3_0:GetBuilding(var_3_1)

	if not var_3_2 then
		return nil
	end

	local var_3_3 = var_3_2:GetCollectSlotData(arg_3_0.slotId)

	if var_3_3 then
		return var_3_3
	end
end

return var_0_0
