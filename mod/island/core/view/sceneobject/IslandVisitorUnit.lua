local var_0_0 = class("IslandVisitorUnit", import(".IslandSceneUnit"))

function var_0_0.OnAttach(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_0._go.transform
	arg_1_0._animator = arg_1_0._tf:GetChild(0):GetComponent(typeof(Animator))
end

function var_0_0.GetAnimator(arg_2_0)
	return arg_2_0._animator
end

return var_0_0
