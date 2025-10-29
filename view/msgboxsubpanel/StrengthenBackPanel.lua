local var_0_0 = class("StrengthenBackPanel", import(".MsgboxSubPanel"))

var_0_0.ConfigData = {
	equipID = 96000,
	btnTxt = "text_forward",
	isOpen = true,
	icon = "equips/56000",
	content = "equipment_info_change_strengthen"
}

function var_0_0.getUIName(arg_1_0)
	return "StrengthenBackBox"
end

function var_0_0.UpdateView(arg_2_0, arg_2_1)
	arg_2_0:PreRefresh(arg_2_1)

	rtf(arg_2_0.viewParent._window).sizeDelta = Vector2.New(1000, 638)

	local var_2_0 = arg_2_0._tf:Find("info_view/Viewport/Content/Text")
	local var_2_1 = Equipment.getConfigData(var_0_0.ConfigData.equipID).name

	setText(var_2_0, i18n(var_0_0.ConfigData.content, var_2_1))

	local var_2_2 = arg_2_0._tf:Find("button_container/custom_button_1(Clone)/pic", arg_2_0._tf.parent)

	setText(var_2_2, i18n(var_0_0.ConfigData.btnTxt))

	local var_2_3 = arg_2_0._tf:Find("icon_bg/icon")

	setImageSprite(var_2_3, LoadSprite(var_0_0.ConfigData.icon))

	if arg_2_1.windowSize then
		arg_2_0._tf.parent.sizeDelta = Vector2(arg_2_1.windowSize.x, arg_2_1.windowSize.y)
	end

	arg_2_0:PostRefresh(arg_2_1)
end

return var_0_0
