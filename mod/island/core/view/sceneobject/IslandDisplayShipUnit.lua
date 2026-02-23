local var_0_0 = class("IslandDisplayShipUnit")
local var_0_1 = 2

function var_0_0.OnAttach(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.toolContainer = arg_1_2
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_0._go.transform
	arg_1_0.characterHandleController = GetOrAddComponent(arg_1_0._go, typeof(CharacterHandleController))

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
		arg_1_0:StateExitFixHandle(arg_5_0, arg_5_1)
	end)

	arg_1_0.objTfList = {}
end

function var_0_0.LoadInteractiveTool(arg_6_0, arg_6_1)
	arg_6_0.toolId = arg_6_1

	local var_6_0 = arg_6_0.objTfList[arg_6_0.toolId]

	if not IsNil(var_6_0) then
		setActive(var_6_0, true)
		setParent(var_6_0, arg_6_0._tf)
		pg.ViewUtils.SetLayer(var_6_0, Layer.Character3D)

		return
	end

	local var_6_1 = pg.island_animation_attachments[arg_6_0.toolId]
	local var_6_2 = LoadAny(var_6_1.model, nil)
	local var_6_3 = Object.Instantiate(var_6_2)

	arg_6_0.objTfList[arg_6_0.toolId] = var_6_3.transform

	local var_6_4 = LoadAny(var_6_1.animator, nil, typeof(RuntimeAnimatorController))

	GetOrAddComponent(arg_6_0.objTfList[arg_6_0.toolId], typeof(Animator)).runtimeAnimatorController = var_6_4

	setParent(arg_6_0.objTfList[arg_6_0.toolId], arg_6_0._tf)
	pg.ViewUtils.SetLayer(arg_6_0.objTfList[arg_6_0.toolId], Layer.Character3D)
end

function var_0_0.UnLoadInteractiveTool(arg_7_0)
	local var_7_0 = arg_7_0.objTfList[arg_7_0.toolId]

	if var_7_0 then
		setActive(var_7_0, false)
		setParent(var_7_0, arg_7_0.toolContainer)
	end
end

function var_0_0.StateEnterHandle(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 == var_0_1 then
		arg_8_0:LoadInteractiveTool(arg_8_2)
	end
end

function var_0_0.StateEnterFixHandle(arg_9_0, arg_9_1, arg_9_2)
	pg.ViewUtils.SetLayer(arg_9_0.objTfList[arg_9_0.toolId], Layer.Character3D)
end

function var_0_0.StateExitFixHandle(arg_10_0, arg_10_1, arg_10_2)
	pg.ViewUtils.SetLayer(arg_10_0.objTfList[arg_10_0.toolId], Layer.Default)
end

function var_0_0.StateExitHandle(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_1 == var_0_1 then
		arg_11_0:UnLoadInteractiveTool(arg_11_2)
	end
end

function var_0_0.OnClearItemAnimator(arg_12_0)
	if arg_12_0.toolId then
		arg_12_0:UnLoadInteractiveTool(arg_12_0.toolId)
	end
end

function var_0_0.ClearAnimationTools(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.objTfList or {}) do
		Object.Destroy(iter_13_1.gameObject)
	end

	arg_13_0.objTfList = {}
end

function var_0_0.OnDetach(arg_14_0)
	arg_14_0:ClearAnimationTools()
end

return var_0_0
