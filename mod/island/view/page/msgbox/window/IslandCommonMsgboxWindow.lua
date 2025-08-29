local var_0_0 = class("IslandCommonMsgboxWindow", import(".IslandBaseMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBox"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.titleTxt = arg_2_0:findTF("title"):GetComponent(typeof(Text))
	arg_2_0.contentTxt = arg_2_0:findTF("content/Text"):GetComponent(typeof(Text))
	arg_2_0.closeBtn = arg_2_0:findTF("close")
	arg_2_0.cancelBtn = arg_2_0:findTF("cancel")
	arg_2_0.confirmBtn = arg_2_0:findTF("confirm")
	arg_2_0.cancelTxt = arg_2_0:findTF("cancel/Text"):GetComponent(typeof(Text))
	arg_2_0.confirmTxt = arg_2_0:findTF("confirm/Text"):GetComponent(typeof(Text))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		if arg_3_0.onNo then
			arg_3_0.onNo()
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		if arg_3_0.onYes then
			arg_3_0.onYes()
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_7_0)
	local var_7_0 = arg_7_0.settings

	arg_7_0.titleTxt.text = var_7_0.title or i18n("island_msg_info")
	arg_7_0.contentTxt.text = var_7_0.content or ""
	arg_7_0.onYes = var_7_0.onYes
	arg_7_0.onNo = var_7_0.onNo
	arg_7_0.onHide = var_7_0.onHide

	arg_7_0:FlushBtn(var_7_0)
end

function var_0_0.FlushBtn(arg_8_0, arg_8_1)
	setActive(arg_8_0.cancelBtn, not arg_8_1.hideNo)

	local var_8_0 = arg_8_1.hideNo and 880 or 420

	arg_8_0.confirmBtn.sizeDelta = Vector2(var_8_0, arg_8_0.confirmBtn.sizeDelta.y)
	arg_8_0.cancelTxt.text = arg_8_1.noText and arg_8_1.noText or i18n("word_cancel")
	arg_8_0.confirmTxt.text = arg_8_1.yesText and arg_8_1.yesText or i18n("word_ok")
end

function var_0_0.OnHide(arg_9_0)
	arg_9_0.onYes = nil
	arg_9_0.onNo = nil

	if arg_9_0.onHide then
		arg_9_0.onHide()

		arg_9_0.onHide = nil
	end
end

function var_0_0.GetMsgBoxMgr(arg_10_0)
	return arg_10_0.view
end

function var_0_0.OnDestroy(arg_11_0)
	return
end

return var_0_0
