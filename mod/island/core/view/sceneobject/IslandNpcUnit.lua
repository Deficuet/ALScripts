local var_0_0 = class("IslandNpcUnit", import(".IslandNavigableUnit"))
local var_0_1 = {
	JumpHandle = 1,
	LoadToolHandle = 2
}

function var_0_0.OnAttach(arg_1_0, arg_1_1)
	var_0_0.super.OnAttach(arg_1_0, arg_1_1)

	arg_1_0.characterHandleController = arg_1_0._go:GetComponent(typeof(CharacterHandleController))

	arg_1_0.characterHandleController:AddStateEnterFunc(function(arg_2_0, arg_2_1)
		arg_1_0:StateEnterHandle(arg_2_0, arg_2_1)
	end)
	arg_1_0.characterHandleController:AddStateExitFunc(function(arg_3_0, arg_3_1)
		arg_1_0:StateExitHandle(arg_3_0, arg_3_1)
	end)
	arg_1_0.characterHandleController:AddStateEnterFixCompleteFunc(function(arg_4_0, arg_4_1)
		arg_1_0:StateEnterFixHandle(arg_4_0, arg_4_1)
	end)
	arg_1_0.characterHandleController:AddStateExitFixCompleteFunc(function(arg_5_0, arg_5_1)
		return
	end)

	arg_1_0.objTfList = {}
	arg_1_0.toolIdMap = {}

	if arg_1_0.behaviourTreeOwner then
		local var_1_0, var_1_1 = arg_1_0:GetDataVO():GetPersonality()

		LuaHelper.NodeCanvasSetIntVariableValue(arg_1_0.behaviourTreeOwner, "personality", var_1_0)
		LuaHelper.NodeCanvasSetIntVariableValue(arg_1_0.behaviourTreeOwner, "proactive", var_1_1)
	end
end

function var_0_0.StateEnterHandle(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_1 == var_0_1.LoadToolHandle then
		arg_6_0:LoadInteractiveTool(arg_6_2)
	end
end

function var_0_0.StateEnterFixHandle(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 == var_0_1.LoadToolHandle then
		local var_7_0 = arg_7_0.toolIdMap[arg_7_2] or arg_7_0.currentToolId or arg_7_0:GetToolId(arg_7_2)

		if var_7_0 and arg_7_0.objTfList[var_7_0] then
			pg.ViewUtils.SetLayer(arg_7_0.objTfList[var_7_0], Layer.Default)
		end
	end
end

function var_0_0.StateExitHandle(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 == var_0_1.LoadToolHandle then
		arg_8_0:UnLoadInteractiveTool(arg_8_2)
	end
end

function var_0_0.GetToolId(arg_9_0, arg_9_1)
	if arg_9_1 ~= 0 then
		return arg_9_1
	end
end

function var_0_0.LoadInteractiveTool(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1

	arg_10_1 = IslandAnimationAttachmentHelper.ResolveId(arg_10_0:GetAnimator(), arg_10_1)
	arg_10_0.currentToolId = arg_10_1
	arg_10_0.toolIdMap[var_10_0] = arg_10_1

	local var_10_1 = arg_10_0.objTfList[arg_10_1]

	if var_10_1 then
		setActive(var_10_1, true)
		setParent(var_10_1, arg_10_0._tf)
		pg.ViewUtils.SetLayer(var_10_1, Layer.UIHidden)

		return
	end

	local var_10_2 = pg.island_animation_attachments[arg_10_1]
	local var_10_3 = var_10_2.model

	if arg_10_1 == pg.island_set.island_manage_animation_extroversion.key_value_int or arg_10_1 == pg.island_set.island_manage_animation_introverted.key_value_int then
		local var_10_4 = arg_10_0.behaviourTreeOwner.graph.blackboard:GetVariable("systemId").value

		if var_10_4 ~= 0 then
			var_10_3 = pg.island_manage_restaurant[var_10_4].performance_param
		end
	end

	local var_10_5 = LoadAny(var_10_3, nil)
	local var_10_6 = Object.Instantiate(var_10_5)

	arg_10_0.objTfList[arg_10_1] = var_10_6.transform

	local var_10_7 = LoadAny(var_10_2.animator, nil, typeof(RuntimeAnimatorController))

	GetOrAddComponent(arg_10_0.objTfList[arg_10_1], typeof(Animator)).runtimeAnimatorController = var_10_7

	setParent(arg_10_0.objTfList[arg_10_1], arg_10_0._tf)
	pg.ViewUtils.SetLayer(arg_10_0.objTfList[arg_10_1], Layer.UIHidden)
end

function var_0_0.UnLoadInteractiveTool(arg_11_0, arg_11_1)
	arg_11_1 = arg_11_0.toolIdMap[arg_11_1] or IslandAnimationAttachmentHelper.ResolveId(arg_11_0:GetAnimator(), arg_11_1)

	if arg_11_0.objTfList[arg_11_1] then
		setActive(arg_11_0.objTfList[arg_11_1], false)
	end
end

function var_0_0.DestroyInteractiveTools(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.objTfList) do
		Object.Destroy(iter_12_1.gameObject)
	end

	arg_12_0.objTfList = {}
end

return var_0_0
