local var_0_0 = class("DexiV6FrameRePage", import("view.activity.subPages.DexiV6FramePage"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	ActivityRemasterUtil.AdapterCoreScene(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	arg_2_0:UpdateTime()
end

function var_0_0.UpdateTime(arg_3_0)
	ActivityRemasterUtil.UpdateTime(arg_3_0)
end

function var_0_0.Switch(arg_4_0, arg_4_1)
	return
end

return var_0_0
