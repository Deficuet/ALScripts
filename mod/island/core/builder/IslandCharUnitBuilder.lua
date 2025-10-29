local var_0_0 = class("IslandCharUnitBuilder", import(".IslandBaseBuilder"))

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1:GetAssetPath()
	local var_1_1 = arg_1_1:GetAnimator()
	local var_1_2 = arg_1_1:GetBehaviourTree()

	arg_1_0:GetPoolMgr():GetSceneCharacter(var_1_0, var_1_1, var_1_2, arg_1_2)
end

function var_0_0.Recycle(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1:GetAssetPath()
	local var_2_1 = arg_2_1:GetAnimator()
	local var_2_2 = arg_2_1:GetBehaviourTree()

	arg_2_0:GetPoolMgr():ReturnSceneCharacter(var_2_0, var_2_1, var_2_2, arg_2_2)
end

function var_0_0.AddComponents(arg_3_0, arg_3_1, arg_3_2)
	return
end

return var_0_0
