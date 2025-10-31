local var_0_0 = class("TranscodeAlertView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "TranscodeAlertView"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.SetShareData(arg_3_0, arg_3_1)
	arg_3_0.shareData = arg_3_1
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.transcodeAlert = arg_4_0._tf
	arg_4_0.tcSureBtn = arg_4_0.transcodeAlert:Find("transcode_sure")
	arg_4_0.uidTxt = arg_4_0.transcodeAlert:Find("uid_input_txt"):GetComponent(typeof(InputField))
	arg_4_0.transcodeTxt = arg_4_0.transcodeAlert:Find("transcode_input_txt"):GetComponent(typeof(InputField))
	arg_4_0.tcDesc = arg_4_0.transcodeAlert:Find("desc")

	setText(arg_4_0.tcDesc, i18n("transcode_desc"))
	arg_4_0:InitEvent()
end

function var_0_0.InitEvent(arg_5_0)
	onButton(arg_5_0, arg_5_0.tcSureBtn, function()
		local var_6_0 = arg_5_0.uidTxt.text
		local var_6_1 = arg_5_0.transcodeTxt.text

		if var_6_0 == "" or var_6_1 == "" then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("transcode_empty_tip")
			})
		else
			pg.SdkMgr.GetInstance():LoginWithTranscode(var_6_0, var_6_1)
		end
	end)
	onButton(arg_5_0, arg_5_0.transcodeAlert, function()
		arg_5_0:Hide()
	end)
end

function var_0_0.OnDestroy(arg_8_0)
	return
end

return var_0_0
