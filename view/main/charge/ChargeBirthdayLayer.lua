local var_0_0 = class("ChargeBirthdayLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ChargeBirthdayUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
	arg_2_0:initUIText()
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
end

function var_0_0.initData(arg_5_0)
	return
end

function var_0_0.initUIText(arg_6_0)
	arg_6_0.inputSC.text = ""
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.bg = arg_7_0:findTF("bg")
	arg_7_0.window = arg_7_0:findTF("window")
	arg_7_0.inputField = arg_7_0:findTF("birthday_input_panel/InputField", arg_7_0.window)
	arg_7_0.inputSC = GetComponent(arg_7_0.inputField, typeof(InputField))
	arg_7_0.cancelBtn = arg_7_0:findTF("birthday_input_panel/btns/cancel_btn", arg_7_0.window)
	arg_7_0.confirmBtn = arg_7_0:findTF("birthday_input_panel/btns/confirm_btn", arg_7_0.window)
	arg_7_0.closeBtn = arg_7_0:findTF("top/btnBack", arg_7_0.window)
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:closeView()
	end)
	onButton(arg_8_0, arg_8_0.cancelBtn, function()
		arg_8_0:closeView()
	end)
	onButton(arg_8_0, arg_8_0.closeBtn, function()
		arg_8_0:closeView()
	end)
	onButton(arg_8_0, arg_8_0.confirmBtn, function()
		if not checkBirthFormat(arg_8_0.inputSC.text) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("set_birth_empty_tip"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				title = i18n("set_birth_title"),
				content = i18n("set_birth_confirm_tip", arg_8_0.inputSC.text),
				onYes = function()
					pg.SdkMgr.GetInstance():SetBirth(arg_8_0.inputSC.text)
					arg_8_0:closeView()
				end
			})
		end
	end)
end

return var_0_0
