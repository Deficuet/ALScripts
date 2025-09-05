local var_0_0 = class("IslandGroundSystemBuilder", import(".IslandSystemBuilder"))

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:CreateNode(arg_1_1, function(arg_2_0)
		arg_1_2(arg_2_0)
	end)
end

function var_0_0.CreateNode(arg_3_0, arg_3_1, arg_3_2)
	ResourceMgr.Inst:getAssetAsync(arg_3_1:GetAssetPath(), "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_4_0)
		local var_4_0 = GameObject.Instantiate(arg_4_0)

		arg_3_2(var_4_0)
	end), true, true)
end

return var_0_0
