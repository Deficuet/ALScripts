local var_0_0 = class("SailingShip3SkinActPage", import("view.activity.CorePage.CorePreviewTemplatePage"))

function var_0_0.OnFirstFlush(arg_1_0)
	arg_1_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.btnList:Find("activity"), function()
		arg_1_0:emit(ActivityMediator.OPEN_LAYER, Context.New({
			mediator = SailingShip3SkinMediator,
			viewComponent = SailingShip3SkinLayer
		}))
	end)
end

function var_0_0.OnUpdateFlush(arg_3_0)
	local var_3_0 = arg_3_0._tf:Find("AD/redDot")

	setActive(var_3_0, SailingShip3SkinLayer.ShouldShowTip())
end

return var_0_0
