local var_0_0 = class("AiriLoginPanelView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "AiriLoginPanelView"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.SetShareData(arg_3_0, arg_3_1)
	arg_3_0.shareData = arg_3_1
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.airiLoginBtn = arg_4_0._tf:Find("airi_login")
	arg_4_0.clearTranscodeBtn = arg_4_0._tf:Find("clear_transcode")
	arg_4_0.jpLoginCon = arg_4_0._tf:Find("jp_login_btns")
	arg_4_0.jpYoStarLoginBtn = arg_4_0.jpLoginCon:Find("yostar_login")
	arg_4_0.jpTransBtn = arg_4_0.jpLoginCon:Find("yostar_trans")
	arg_4_0.usLoginCon = arg_4_0._tf:Find("en_login_btns")
	arg_4_0.usYoStarLoginBtn = arg_4_0.usLoginCon:Find("yostar_login")
	arg_4_0.usTransBtn = arg_4_0.usLoginCon:Find("yostar_trans")
	arg_4_0.usLogOutBtn = arg_4_0.usLoginCon:Find("yostar_logout")

	setActive(arg_4_0.clearTranscodeBtn, false)
	setText(arg_4_0.jpYoStarLoginBtn:Find("Text"), i18n("yostar_login_btn"))
	setText(arg_4_0.jpTransBtn:Find("Text"), i18n("yostar_trans_btn"))
	setActive(arg_4_0.jpYoStarLoginBtn, PLATFORM_CODE == PLATFORM_JP)
	setActive(arg_4_0.jpTransBtn, PLATFORM_CODE == PLATFORM_JP)
	setActive(arg_4_0.usLoginCon, PLATFORM_CODE == PLATFORM_US)
	arg_4_0:InitEvent()
end

function var_0_0.InitEvent(arg_5_0)
	onButton(arg_5_0, arg_5_0.airiLoginBtn, function()
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
		pg.SdkMgr.GetInstance():YoStarLoginSDK()
	end)
	onButton(arg_5_0, arg_5_0.clearTranscodeBtn, function()
		return
	end)

	if PLATFORM_CODE == PLATFORM_JP then
		onButton(arg_5_0, arg_5_0.jpYoStarLoginBtn, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
			pg.SdkMgr.GetInstance():YoStarLoginSDK()
		end)
		onButton(arg_5_0, arg_5_0.jpTransBtn, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
			Application.OpenURL("https://migration.yostar.co.jp?pid=JP-AZURLANE")
		end)
	elseif PLATFORM_CODE == PLATFORM_US then
		onButton(arg_5_0, arg_5_0.usTransBtn, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
			Application.OpenURL("https://migration.yo-star.com/?pid=US-AZURLANE")
		end)
		onButton(arg_5_0, arg_5_0.usLogOutBtn, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
			pg.SdkMgr.GetInstance():YoStarShowSwitchAccount()
		end)
	end

	arg_5_0:RefreshUI(false)
	triggerButton(arg_5_0.airiLoginBtn)
end

function var_0_0.RefreshUI(arg_12_0, arg_12_1)
	setActive(arg_12_0.usLogOutBtn, arg_12_1)
end

function var_0_0.OnDestroy(arg_13_0)
	return
end

return var_0_0
