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
		arg_1_0:SetupBT(var_1_1, arg_1_1, arg_4_0)
	end)
	seriesAsync(var_1_0, function()
		arg_1_2(var_1_1)
	end)
end

function var_0_0.LoadAsset(arg_6_0, arg_6_1, arg_6_2)
	ResourceMgr.Inst:getAssetAsync(arg_6_1:GetAssetPath(), "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_7_0)
		local var_7_0 = Object.Instantiate(arg_7_0)

		arg_6_2(var_7_0)
	end), true, true)
end

function var_0_0.SetupBT(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = arg_8_2:GetBehaviourTree()

	if not var_8_0 or var_8_0 == "" then
		arg_8_3()

		return
	end

	ResourceMgr.Inst:getAssetAsync(var_8_0, "", typeof(NodeCanvas.BehaviourTrees.BehaviourTree), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_9_0)
		assert(arg_9_0, var_8_0)

		GetOrAddComponent(arg_8_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = Object.Instantiate(arg_9_0)

		arg_8_3()
	end), true, true)
end

function var_0_0.Recycle(arg_10_0, arg_10_1, arg_10_2)
	Object.Destroy(arg_10_2)
end

return var_0_0
