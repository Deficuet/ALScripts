local var_0_0 = class("IslandPlayerBuilder", import(".IslandGenericBuilder"))

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandPlayerUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.SetTag(arg_2_0, arg_2_1)
	arg_2_1.tag = IslandConst.TAG_PLAYER
end

function var_0_0.AddComponents(arg_3_0, arg_3_1, arg_3_2)
	arg_3_1:GetComponent(typeof(WorldObjectItem)).isPlayer = true

	local var_3_0 = GetOrAddComponent(arg_3_1, typeof(CharacterController))

	var_3_0.slopeLimit = 50
	var_3_0.stepOffset = 0.3
	var_3_0.stepOffset = 0.08
	var_3_0.minMoveDistance = 0
	var_3_0.height = 1.76
	var_3_0.stepOffset = 0.4
	var_3_0.center = Vector3(0, 0.96, 0)

	GetOrAddComponent(arg_3_1, typeof(CharacterHandleController))
end

function var_0_0.LoadAsset(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1.modelId

	arg_4_0:GetPoolMgr():GetCommanderModel({
		model = arg_4_1:GetAssetPath(),
		animator = arg_4_1:GetAnimator()
	}, arg_4_2)
end

function var_0_0.LoadOtherPart(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	ResourceMgr.Inst:getAssetAsync("island/jumpcurve/jumpcurve", "", typeof(JumpCurve), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_6_0)
		arg_5_2:InitJump(arg_6_0.curve)
		arg_5_4()
	end), true, true)
end

function var_0_0.Recycle(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0:GetPoolMgr():ReturnCommanderModel(arg_7_2)
end

return var_0_0
