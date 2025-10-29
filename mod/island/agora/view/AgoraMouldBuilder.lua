local var_0_0 = class("AgoraMouldBuilder", import("Mod.Island.Core.Builder.IslandGenericBuilder"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.root = arg_1_1.furnitureRoot
end

function var_0_0.Build(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_0:GetPoolMgr():GetAgoraRoot()

	setParent(var_2_0, arg_2_0.root)

	local var_2_1 = arg_2_0:GetModule(var_2_0, arg_2_1)

	assert(arg_2_0.unitListType)
	var_2_1:SetUnitType(arg_2_0.unitListType)

	local var_2_2

	seriesAsync({
		function(arg_3_0)
			arg_2_0:Load(arg_2_1, function(arg_4_0)
				var_2_2 = arg_4_0

				arg_3_0()
			end)
		end,
		function(arg_5_0)
			arg_2_0:SetupBT(var_2_0, arg_2_1:GetBt(), arg_5_0)
		end
	}, function()
		arg_2_0:AddTypeAndID(var_2_0, var_2_1)
		arg_2_0:AddComponents(var_2_0, arg_2_1)
		arg_2_0:SetTag(var_2_0)
		var_2_1:Init(var_2_2, arg_2_0)
		existCall(arg_2_2, var_2_1)
	end)

	return var_2_1
end

function var_0_0.SetupBT(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if not arg_7_2 or arg_7_2 == "" then
		arg_7_3()

		return
	end

	local var_7_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_7_2, "", typeof(NodeCanvas.BehaviourTrees.BehaviourTree), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_8_0)
		assert(arg_8_0, arg_7_2)

		GetOrAddComponent(arg_7_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = Object.Instantiate(arg_8_0)

		arg_7_3()
	end), true, true)

	arg_7_0:AddLoadingID(var_7_0)
end

function var_0_0.GetModule(arg_9_0, arg_9_1, arg_9_2)
	return AgoraFurnitrueMould.New(arg_9_0.view, arg_9_1, arg_9_2)
end

function var_0_0.Load(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0:GetPoolMgr():GetAgoraObj(arg_10_1:GetResPath(), arg_10_2)
end

function var_0_0.Recycle(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_2 then
		arg_11_0:GetPoolMgr():ReturnAgoraObj(arg_11_1:GetResPath(), arg_11_2)
	end
end

function var_0_0.RecycleRoot(arg_12_0, arg_12_1)
	arg_12_0:GetPoolMgr():ReturnAgoraRoot(arg_12_1)
end

return var_0_0
