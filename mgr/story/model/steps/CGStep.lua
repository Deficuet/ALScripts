local var_0_0 = class("CGStep", import(".StoryStep"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.bgs = arg_1_1.bgs or {}
	arg_1_0.hideBgAlpha = true
	arg_1_0.reflux = arg_1_1.reflux
end

function var_0_0.GetMode(arg_2_0)
	return Story.MODE_CG
end

function var_0_0.GetBgs(arg_3_0)
	if arg_3_0.reflux then
		return getProxy(RefluxProxy):GetRefluxBgs()
	end

	return arg_3_0.bgs
end

return var_0_0
