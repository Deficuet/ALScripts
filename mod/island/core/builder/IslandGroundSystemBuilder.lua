local var_0_0 = class("IslandGroundSystemBuilder", import(".IslandSystemBuilder"))

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:CreateNode(arg_1_1, function(arg_2_0)
		arg_1_2(arg_2_0)
	end)
end

function var_0_0.CreateNode(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_3_1:GetAssetPath(), "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_4_0)
		local var_4_0 = FrameAsyncInstantiateManager.Instance:EnqueueInstantiate(arg_4_0, function(arg_5_0)
			arg_3_2(arg_5_0)
		end)

		table.insert(arg_3_0.insIdList, var_4_0)
	end), true, true)

	arg_3_0:AddLoadingID(var_3_0)
end

return var_0_0
