local var_0_0 = class("BasePerformPlayer")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0._anim = arg_1_0._tf:GetComponent(typeof(Animation))

	arg_1_0:Hide()
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2)
	assert(nil, "Play方法必须由子类实现")
end

function var_0_0.Show(arg_3_0)
	setActive(arg_3_0._go, true)
end

function var_0_0.Hide(arg_4_0)
	setActive(arg_4_0._go, false)
end

function var_0_0.Clear(arg_5_0)
	assert(nil, "Clear方法必须由子类实现")
end

return var_0_0
