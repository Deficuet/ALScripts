local var_0_0 = class("IslandDelegationFishBuilder", import(".IslandGenericBuilder"))

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandDelegationFishUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.LoadAsset(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1.modelId
	local var_2_1 = arg_2_1:GetAssetPath()
	local var_2_2 = arg_2_1:GetAnimator()
	local var_2_3 = arg_2_1:GetBehaviourTree()

	arg_2_0:GetPoolMgr():GetSceneDelegateItem(var_2_1, var_2_2, var_2_3, arg_2_2)
end

function var_0_0.Recycle(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_1:GetAssetPath()
	local var_3_1 = arg_3_1:GetAnimator()
	local var_3_2 = arg_3_1:GetBehaviourTree()

	arg_3_0:GetPoolMgr():ReturnSceneDelegateItem(var_3_0, var_3_1, var_3_2, arg_3_2)
end

function var_0_0.SetTag(arg_4_0, arg_4_1)
	arg_4_1.tag = IslandConst.TAG_NPC
end

return var_0_0
