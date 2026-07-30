local var_0_0 = class("ItemShowPanel", import(".MsgboxSubPanel"))

function var_0_0.getUIName(arg_1_0)
	return "ItemChangeNoticeBox"
end

function var_0_0.UpdateView(arg_2_0, arg_2_1)
	arg_2_0:PreRefresh(arg_2_1)

	rtf(arg_2_0.viewParent._window).sizeDelta = Vector2.New(1000, 638)

	local var_2_0 = arg_2_0._tf:Find("title")
	local var_2_1 = arg_2_0._tf:Find("icon_origin")
	local var_2_2 = arg_2_0._tf:Find("icon_now")
	local var_2_3 = arg_2_0._tf:Find("name_origin")
	local var_2_4 = arg_2_0._tf:Find("name_now")
	local var_2_5 = arg_2_0._tf:Find("before/Text")
	local var_2_6 = arg_2_0._tf:Find("after/Text")
	local var_2_7 = arg_2_1.configData

	setText(var_2_0, i18n(var_2_7.title))
	setText(var_2_3, i18n(var_2_7.name_old))
	setText(var_2_4, i18n(var_2_7.name_new))
	setText(var_2_5, i18n(var_2_7.tip_old))
	setText(var_2_6, i18n(var_2_7.tip_new))
	setImageSprite(var_2_1, LoadSprite(var_2_7.icon_old))
	setImageSprite(var_2_2, LoadSprite(var_2_7.icon_new))
	arg_2_0:PostRefresh(arg_2_1)
end

return var_0_0
