local var_0_0 = class("IslandGatherUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.nowIslandId = arg_1_0.index
	arg_1_0.gatherType = arg_1_0:GetType()

	arg_1_0:BindGatherData()
end

function var_0_0.BindGatherData(arg_2_0)
	local var_2_0 = (arg_2_0.nowIslandId == getProxy(IslandProxy):GetIsland().id and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetWildCollectAgency()

	if arg_2_0.gatherType == IslandConst.UNIT_TYPE_ITEM_GATHER_ITEM then
		arg_2_0.gatherData = var_2_0:GetGatherDataByUnitId(arg_2_0.id)
	else
		arg_2_0.gatherData = var_2_0:GetCollectDataByUnitId(arg_2_0.id)
	end
end

function var_0_0.GetGatherData(arg_3_0)
	return arg_3_0.gatherData
end

return var_0_0
