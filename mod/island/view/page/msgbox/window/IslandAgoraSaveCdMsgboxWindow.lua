local var_0_0 = class("IslandAgoraUpgradeMsgboxWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBox"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)
	setText(arg_2_0:findTF("cancel/Text"), i18n("island_label_furniture_exit"))
	setText(arg_2_0:findTF("confirm/Text"), i18n("island_label_furniture_save"))
end

function var_0_0.OnShow(arg_3_0)
	var_0_0.super.OnShow(arg_3_0)

	local var_3_0 = arg_3_0.settings

	arg_3_0:AddTimer(var_3_0.duetime)
end

function var_0_0.AddTimer(arg_4_0, arg_4_1)
	arg_4_0:RemoveTimer()

	if arg_4_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_4_0:Hide()

		return
	end

	arg_4_0.timer = Timer.New(function()
		local var_5_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if arg_4_1 - var_5_0 <= 0 then
			arg_4_0:RemoveTimer()
			arg_4_0:Hide()
		else
			arg_4_0.contentTxt.text = i18n("island_label_furniture_save_tip", pg.TimeMgr.GetInstance():DescCDTime(arg_4_1 - var_5_0))
		end
	end, 1, -1)

	arg_4_0.timer:Start()
	arg_4_0.timer.func()
end

function var_0_0.RemoveTimer(arg_6_0)
	if arg_6_0.timer then
		arg_6_0.timer:Stop()

		arg_6_0.timer = nil
	end
end

function var_0_0.OnHide(arg_7_0)
	var_0_0.super.OnHide(arg_7_0)
	arg_7_0:RemoveTimer()
end

function var_0_0.FlushBtn(arg_8_0, arg_8_1)
	return
end

function var_0_0.OnDestroy(arg_9_0)
	arg_9_0:RemoveTimer()
end

return var_0_0
