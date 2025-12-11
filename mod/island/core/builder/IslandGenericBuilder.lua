local var_0_0 = class("IslandGenericBuilder", import(".IslandBaseBuilder"))

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1

	table.insert(var_1_0, function(arg_2_0)
		arg_1_0:LoadAsset(arg_1_1, function(arg_3_0)
			var_1_1 = arg_3_0

			arg_2_0()
		end)
	end)
	table.insert(var_1_0, function(arg_4_0)
		arg_1_0:SetupBT(var_1_1, arg_1_1:GetBehaviourTree(), arg_4_0)
	end)
	seriesAsync(var_1_0, function()
		arg_1_2(var_1_1)
	end)
end

function var_0_0.LoadAsset(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_6_1:GetAssetPath(), "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_7_0)
		local var_7_0 = FrameAsyncInstantiateManager.Instance:EnqueueInstantiate(arg_7_0, function(arg_8_0)
			arg_6_2(arg_8_0)
		end)

		table.insert(arg_6_0.insIdList, var_7_0)
	end), true, true)

	arg_6_0:AddLoadingID(var_6_0)
end

function var_0_0.SetupBT(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if not arg_9_2 or arg_9_2 == "" then
		arg_9_3()

		return
	end

	local var_9_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_9_2, "", typeof(NodeCanvas.BehaviourTrees.BehaviourTree), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_10_0)
		assert(arg_10_0, arg_9_2)

		GetOrAddComponent(arg_9_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = arg_10_0

		arg_9_3()
	end), true, true)

	arg_9_0:AddLoadingID(var_9_0)
end

function var_0_0.Recycle(arg_11_0, arg_11_1, arg_11_2)
	Object.Destroy(arg_11_2)
end

return var_0_0
