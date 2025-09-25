local var_0_0 = class("AiriUSLoginPanelView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "AiriUSLoginPanelView"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.SetShareData(arg_3_0, arg_3_1)
	arg_3_0.shareData = arg_3_1
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.airijpPanel = arg_4_0._tf
	arg_4_0.airiLoginBtn = arg_4_0:findTF("airi_login", arg_4_0.airijpPanel)
	arg_4_0.clearTranscodeBtn = arg_4_0:findTF("clear_transcode", arg_4_0.airijpPanel)
	arg_4_0.jpLoginCon = arg_4_0:findTF("jp_login_btns", arg_4_0.airijpPanel)
	arg_4_0.appleLoginBtn = arg_4_0:findTF("apple_login", arg_4_0.jpLoginCon)
	arg_4_0.amazonLoginBtn = arg_4_0:findTF("amazon_login", arg_4_0.jpLoginCon)
	arg_4_0.twitterLoginBtn = arg_4_0:findTF("twitter_login", arg_4_0.jpLoginCon)
	arg_4_0.transcodeLoginBtn = arg_4_0:findTF("transcode_login", arg_4_0.jpLoginCon)
	arg_4_0.touristLoginBtn = arg_4_0:findTF("tourist_login", arg_4_0.jpLoginCon)
	arg_4_0.yostarLoginBtn = arg_4_0:findTF("yostar_login", arg_4_0.jpLoginCon)
	arg_4_0.firstAlertWin = arg_4_0:findTF("empty_alert", arg_4_0.airijpPanel)
	arg_4_0.appleToggleTf = arg_4_0:findTF("window/content_bg/apple_toggle", arg_4_0.firstAlertWin)
	arg_4_0.amazonToggleTf = arg_4_0:findTF("window/content_bg/amazon_toggle", arg_4_0.firstAlertWin)
	arg_4_0.twitterToggleTf = arg_4_0:findTF("window/content_bg/twitter_toggle", arg_4_0.firstAlertWin)
	arg_4_0.transcodeToggleTf = arg_4_0:findTF("window/content_bg/transcode_toggle", arg_4_0.firstAlertWin)
	arg_4_0.touristToggleTf = arg_4_0:findTF("window/content_bg/tourist_toggle", arg_4_0.firstAlertWin)
	arg_4_0.yostarToggleTf = arg_4_0:findTF("window/content_bg/yostar_toggle", arg_4_0.firstAlertWin)
	arg_4_0.alertCloseBtn = arg_4_0:findTF("window/top/btnBack", arg_4_0.firstAlertWin)
	arg_4_0.alertCancelBtn = arg_4_0:findTF("window/button_container/custom_button_2", arg_4_0.firstAlertWin)
	arg_4_0.alertSureBtn = arg_4_0:findTF("window/button_container/custom_button_1", arg_4_0.firstAlertWin)
	arg_4_0.enLoginCon = arg_4_0:findTF("en_login_btns", arg_4_0.airijpPanel)
	arg_4_0.twitterLoginBtn_en = arg_4_0:findTF("twitter_login_en", arg_4_0.enLoginCon)
	arg_4_0.facebookLoginBtn_en = arg_4_0:findTF("facebook_login_en", arg_4_0.enLoginCon)
	arg_4_0.yostarLoginBtn_en = arg_4_0:findTF("yostar_login_en", arg_4_0.enLoginCon)
	arg_4_0.appleLoginBtn_en = arg_4_0:findTF("apple_login_en", arg_4_0.enLoginCon)
	arg_4_0.amazonLoginBtn_en = arg_4_0:findTF("amazon_login_en", arg_4_0.enLoginCon)

	setActive(arg_4_0.clearTranscodeBtn, not LOCK_CLEAR_ACCOUNT)
	setActive(arg_4_0.transcodeLoginBtn, PLATFORM_CODE == PLATFORM_JP)
	setActive(arg_4_0.touristLoginBtn, false)
	setActive(arg_4_0.yostarLoginBtn, PLATFORM_CODE == PLATFORM_JP)
	setActive(arg_4_0.appleLoginBtn, PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "1")
	setActive(arg_4_0.appleToggleTf, PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "1")
	setActive(arg_4_0.amazonLoginBtn, PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "3")
	setActive(arg_4_0.amazonToggleTf, PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "3")

	if PLATFORM_CODE == PLATFORM_JP then
		setActive(arg_4_0.firstAlertWin, false)
	end

	setActive(arg_4_0.twitterLoginBtn_en, PLATFORM_CODE == PLATFORM_US)
	setActive(arg_4_0.facebookLoginBtn_en, PLATFORM_CODE == PLATFORM_US and pg.SdkMgr.GetInstance():GetChannelUID() ~= "3")
	setActive(arg_4_0.yostarLoginBtn_en, PLATFORM_CODE == PLATFORM_US)
	setActive(arg_4_0.appleLoginBtn_en, PLATFORM_CODE == PLATFORM_US and pg.SdkMgr.GetInstance():GetChannelUID() == "1")
	setActive(arg_4_0.amazonLoginBtn_en, PLATFORM_CODE == PLATFORM_US and pg.SdkMgr.GetInstance():GetChannelUID() == "3")
	setActive(arg_4_0.clearTranscodeBtn, PLATFORM_CODE ~= PLATFORM_US)
	setActive(arg_4_0.twitterLoginBtn, false)
	setActive(arg_4_0.twitterToggleTf, false)
	arg_4_0:InitEvent()
end

function var_0_0.InitEvent(arg_5_0)
	local function var_5_0()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_5_0.firstAlertWin, arg_5_0.airijpPanel)
		setActive(arg_5_0.firstAlertWin, false)
	end

	local function var_5_1()
		if not pg.SdkMgr.GetInstance():CheckHadAccountCache() then
			setActive(arg_5_0.firstAlertWin, true)
			pg.UIMgr.GetInstance():BlurPanel(arg_5_0.firstAlertWin)

			return true
		end

		return false
	end

	onButton(arg_5_0, arg_5_0.airiLoginBtn, function()
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)

		if getProxy(SettingsProxy):CheckNeedUserAgreement() then
			arg_5_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
		elseif not var_5_1() then
			pg.SdkMgr.GetInstance():AiriLoginSDK()
		end
	end)
	onButton(arg_5_0, arg_5_0.clearTranscodeBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("clear_transcode_cache_confirm"),
			onYes = function()
				ClearAccountCache()

				local var_10_0 = getProxy(SettingsProxy)

				var_10_0:deleteUserAreement()
				var_10_0:clearAllReadHelp()
				arg_5_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
				pg.TipsMgr.GetInstance():ShowTips(i18n("clear_transcode_cache_success"))
			end,
			onNo = function()
				return
			end
		})
	end)
	onButton(arg_5_0, arg_5_0.appleLoginBtn, function()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_APPLE)
	end)
	onButton(arg_5_0, arg_5_0.amazonLoginBtn, function()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_AMAZON)
	end)
	onButton(arg_5_0, arg_5_0.yostarLoginBtn, function()
		arg_5_0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
			LoginSceneConst.DEFINE.YOSTAR_ALERT_VIEW,
			LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN
		})
	end)
	onButton(arg_5_0, arg_5_0.transcodeLoginBtn, function()
		arg_5_0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
			LoginSceneConst.DEFINE.TRANSCODE_ALERT_VIEW,
			LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN
		})
	end)
	onButton(arg_5_0, arg_5_0.touristLoginBtn, function()
		pg.SdkMgr.GetInstance():LoginWithDevice()
	end)
	onButton(arg_5_0, arg_5_0.twitterLoginBtn_en, function()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_TWITTER)
	end)
	onButton(arg_5_0, arg_5_0.facebookLoginBtn_en, function()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_FACEBOOK)
	end)
	onButton(arg_5_0, arg_5_0.yostarLoginBtn_en, function()
		arg_5_0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
			LoginSceneConst.DEFINE.YOSTAR_ALERT_VIEW,
			LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN
		})
	end)
	onButton(arg_5_0, arg_5_0.appleLoginBtn_en, function()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_APPLE)
	end)
	onButton(arg_5_0, arg_5_0.amazonLoginBtn_en, function()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_AMAZON)
	end)
	var_5_1()
	onButton(arg_5_0, arg_5_0.alertCloseBtn, function()
		var_5_0()
	end)
	onButton(arg_5_0, arg_5_0.alertCancelBtn, function()
		var_5_0()
	end)
	onButton(arg_5_0, arg_5_0.alertSureBtn, function()
		local var_24_0 = getToggleState(arg_5_0.twitterToggleTf)
		local var_24_1 = false
		local var_24_2 = getToggleState(arg_5_0.transcodeToggleTf)
		local var_24_3 = getToggleState(arg_5_0.touristToggleTf)
		local var_24_4 = getToggleState(arg_5_0.appleToggleTf)
		local var_24_5 = getToggleState(arg_5_0.amazonToggleTf)
		local var_24_6 = getToggleState(arg_5_0.yostarToggleTf)

		if var_24_1 then
			pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_TWITTER)
		elseif var_24_2 then
			arg_5_0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
				LoginSceneConst.DEFINE.TRANSCODE_ALERT_VIEW,
				LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
				LoginSceneConst.DEFINE.PRESS_TO_LOGIN
			})
		elseif var_24_3 then
			pg.SdkMgr.GetInstance():LoginWithDevice()
		elseif var_24_4 then
			pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_APPLE)
		elseif var_24_5 then
			pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_AMAZON)
		elseif var_24_6 then
			arg_5_0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
				LoginSceneConst.DEFINE.YOSTAR_ALERT_VIEW,
				LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
				LoginSceneConst.DEFINE.PRESS_TO_LOGIN
			})
		end

		var_5_0()
	end)
end

function var_0_0.OnDestroy(arg_25_0)
	return
end

return var_0_0
