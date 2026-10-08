local var_0_0 = class("SettingsAccountUSPanle", import(".SettingsBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "SettingsAccountUS"
end

function var_0_0.GetTitle(arg_2_0)
	return i18n("Settings_title_LoginJP")
end

function var_0_0.GetTitleEn(arg_3_0)
	return "  / ACCOUNT"
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.userProxy = getProxy(UserProxy)

	local var_4_0 = arg_4_0._tf

	arg_4_0.accountTwitterUI = findTF(var_4_0, "page1")

	local var_4_1 = findTF(arg_4_0.accountTwitterUI, "btn_layout/yostar_con")

	arg_4_0.yostarBtn = findTF(var_4_1, "bind_yostar")

	setText(findTF(arg_4_0.yostarBtn, "Text"), "Account Management")
	arg_4_0:OnRegisterEvent()
end

function var_0_0.OnRegisterEvent(arg_5_0)
	onButton(arg_5_0, arg_5_0.yostarBtn, function()
		pg.SdkMgr.GetInstance():YoStarShowUserCenter()
	end)
end

function var_0_0.OnUpdate(arg_7_0)
	return
end

return var_0_0
