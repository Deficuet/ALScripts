local var_0_0 = class("MainBuffDescPage", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:bind(NewMainScene.ON_BUFF_DESC, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:ExecuteAction("Show", arg_2_1, arg_2_2)
	end)
end

function var_0_0.getUIName(arg_3_0)
	return "MainUIBuffDescWindow"
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.descTxt = arg_4_0._tf:Find("Text"):GetComponent(typeof(Text))
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2)
	var_0_0.super.Show(arg_5_0)
	arg_5_0:RemoveDescTimer()
	arg_5_0:AddCloseTimer()
	arg_5_0:UpdateDesc(arg_5_1)

	arg_5_0._tf.localPosition = arg_5_2
	arg_5_0._parentTf = arg_5_0._tf.parent

	pg.UIMgr.GetInstance():OverlayPanel(arg_5_0._tf)
end

function var_0_0.UpdateDesc(arg_6_0, arg_6_1)
	if arg_6_1:getConfig("max_time") <= 0 then
		arg_6_0.descTxt.text = arg_6_1:getConfig("desc")

		return
	end

	arg_6_0.descTimer = Timer.New(function()
		arg_6_0:UpdateDescPreSce(arg_6_1)
	end, 1, -1)

	arg_6_0.descTimer:Start()
	arg_6_0.descTimer.func()
end

function var_0_0.UpdateDescPreSce(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getConfig("desc")
	local var_8_1 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_8_2 = arg_8_1.timestamp - var_8_1

	if var_8_2 > 0 then
		local var_8_3 = pg.TimeMgr.GetInstance():DescCDTime(var_8_2)

		arg_8_0.descTxt.text = string.gsub(var_8_0, "$1", var_8_3)
	else
		arg_8_0:Hide()
	end
end

function var_0_0.RemoveDescTimer(arg_9_0)
	if arg_9_0.descTimer then
		arg_9_0.descTimer:Stop()

		arg_9_0.descTimer = nil
	end
end

function var_0_0.AddCloseTimer(arg_10_0)
	arg_10_0:RemoveCloseTimer()

	arg_10_0.timer = Timer.New(function()
		arg_10_0:Hide()
	end, 7, 1)

	arg_10_0.timer:Start()
end

function var_0_0.RemoveCloseTimer(arg_12_0)
	if arg_12_0.timer then
		arg_12_0.timer:Stop()

		arg_12_0.timer = nil
	end
end

function var_0_0.Hide(arg_13_0)
	var_0_0.super.Hide(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf, arg_13_0._parentTf)
	arg_13_0:RemoveCloseTimer()
	arg_13_0:RemoveDescTimer()
end

function var_0_0.Disable(arg_14_0)
	if arg_14_0:GetLoaded() and arg_14_0:isShowing() then
		arg_14_0:Hide()
	end
end

function var_0_0.OnDestroy(arg_15_0)
	arg_15_0:RemoveCloseTimer()
	arg_15_0:RemoveDescTimer()
end

return var_0_0
