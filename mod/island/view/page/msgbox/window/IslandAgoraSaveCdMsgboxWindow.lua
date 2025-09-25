local var_0_0 = class("IslandAgoraUpgradeMsgboxWindow", import(".IslandCommonMsgboxEXWindow"))

function var_0_0.OnLoaded(arg_1_0)
	var_0_0.super.OnLoaded(arg_1_0)
	setText(arg_1_0:findTF("cancel/Text"), i18n("island_label_furniture_exit"))
	setText(arg_1_0:findTF("confirm/Text"), i18n("island_label_furniture_save"))
end

function var_0_0.OnShow(arg_2_0)
	var_0_0.super.OnShow(arg_2_0)

	local var_2_0 = arg_2_0.settings

	arg_2_0:AddTimer(var_2_0.duetime)
end

function var_0_0.AddTimer(arg_3_0, arg_3_1)
	arg_3_0:RemoveTimer()

	if arg_3_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_3_0:Hide()

		return
	end

	arg_3_0.timer = Timer.New(function()
		local var_4_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if arg_3_1 - var_4_0 <= 0 then
			arg_3_0:RemoveTimer()
			arg_3_0:Hide()
		else
			arg_3_0.contentTxt.text = i18n("island_label_furniture_save_tip", pg.TimeMgr.GetInstance():DescCDTime(arg_3_1 - var_4_0))
		end
	end, 1, -1)

	arg_3_0.timer:Start()
	arg_3_0.timer.func()
end

function var_0_0.RemoveTimer(arg_5_0)
	if arg_5_0.timer then
		arg_5_0.timer:Stop()

		arg_5_0.timer = nil
	end
end

function var_0_0.OnHide(arg_6_0)
	var_0_0.super.OnHide(arg_6_0)
	arg_6_0:RemoveTimer()
end

function var_0_0.FlushBtn(arg_7_0, arg_7_1)
	return
end

function var_0_0.OnDestroy(arg_8_0)
	arg_8_0:RemoveTimer()
end

return var_0_0
