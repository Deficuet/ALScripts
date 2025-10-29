local var_0_0 = class("IslandDelayRecycleUnitBuilder", import(".IslandBaseBuilder"))

var_0_0.RecycleType = {
	NormalSceneItem = 1,
	ProductEffect = 2
}

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandDelayRecycleUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.Load(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1:GetAssetPath()
	local var_2_1 = arg_2_1.recycleAssetType

	if var_2_1 == var_0_0.RecycleType.NormalSceneItem then
		arg_2_0:GetPoolMgr():GetSceneProductItem(var_2_0, arg_2_2)
	elseif var_2_1 == var_0_0.RecycleType.ProductEffect then
		arg_2_0:GetPoolMgr():GetSceneProductEffect(var_2_0, arg_2_2)
	end
end

function var_0_0.Recycle(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_1:GetAssetPath()
	local var_3_1 = arg_3_1.recycleAssetType

	if var_3_1 == IslandDelayRecycleUnitBuilder.RecycleType.NormalSceneItem then
		arg_3_0:GetPoolMgr():ReturnSceneProductItem(var_3_0, arg_3_2)
	elseif var_3_1 == IslandDelayRecycleUnitBuilder.RecycleType.ProductEffect then
		arg_3_0:GetPoolMgr():ReturnSceneProductEffect(var_3_0, arg_3_2)
	end
end

return var_0_0
