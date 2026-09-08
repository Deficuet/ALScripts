local var_0_0 = class("MainBasePanel", import(".MainBaseView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.contextData = arg_1_3
	arg_1_0.btns = arg_1_0:GetBtns()

	arg_1_0:Register()
end

function var_0_0.Init(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.btns) do
		onButton(arg_2_0, iter_2_1:GetTarget(), function()
			iter_2_1:OnClick()
		end, SFX_PANEL)
		iter_2_1:Flush(true)
	end
end

function var_0_0.Register(arg_4_0)
	arg_4_0:bind(PlayerProxy.UPDATED, function(arg_5_0)
		arg_4_0:Refresh()
	end)
end

function var_0_0.Refresh(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.btns) do
		iter_6_1:Flush(false)
	end
end

function var_0_0.ShowOrHideBtnEffect(arg_7_0)
	return
end

function var_0_0.Dispose(arg_8_0)
	var_0_0.super.Dispose(arg_8_0)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.btns) do
		iter_8_1:Dispose()
	end

	arg_8_0.btns = {}

	arg_8_0:OnDispose()
end

function var_0_0.GetBtns(arg_9_0)
	return {}
end

function var_0_0.OnDispose(arg_10_0)
	return
end

return var_0_0
