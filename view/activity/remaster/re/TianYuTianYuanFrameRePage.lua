local var_0_0 = class("TianYuTianYuanFrameRePage", import("view.activity.CorePage.TianYuTianYuan.TianYuTianYuanFramePage"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	ActivityRemasterUtil.AdapterCoreScene(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)

	arg_2_0.inPhase2 = true

	arg_2_0:UpdateTime()
end

function var_0_0.UpdateTime(arg_3_0)
	ActivityRemasterUtil.UpdateTime(arg_3_0)
end

function var_0_0.CheckSwitch2Phase2(arg_4_0)
	local var_4_0 = arg_4_0.phases[1]
	local var_4_1 = arg_4_0.phases[2]

	GetOrAddComponent(var_4_0, typeof(CanvasGroup)).alpha = 0
	GetOrAddComponent(var_4_1, typeof(CanvasGroup)).alpha = 1
end

return var_0_0
