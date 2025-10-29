local var_0_0 = class("GhostSkinStoryActPage", import(".TemplatePage.PreviewTemplatePage"))

function var_0_0.OnFirstFlush(arg_1_0)
	arg_1_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.btnList:Find("activity"), function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GHOSTSKINPAGE)
	end)
end

function var_0_0.OnUpdateFlush(arg_3_0)
	local var_3_0 = arg_3_0._tf:Find("AD/redDot")

	setActive(var_3_0, GhostSkinPageLayer.IsShowRed())
end

return var_0_0
