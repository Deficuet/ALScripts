local var_0_0 = class("IslandOtherCardAttach", import(".external.IslandOtherCardLayer"))

function var_0_0.didEnter(arg_1_0)
	var_0_0.super.didEnter(arg_1_0)
	onNextTick(function()
		arg_1_0:ExtraHandle()
	end)
end

function var_0_0.ExtraHandle(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.closeView(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf, arg_4_0.contextData.container)
	arg_4_0.contextData.onClose()
end

return var_0_0
