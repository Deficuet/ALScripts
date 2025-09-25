local var_0_0 = class("LoginScene", import("..base.BaseUI"))
local var_0_1 = 1

function var_0_0.getUIName(arg_1_0)
	return "LoginUI2"
end

function var_0_0.getBGM(arg_2_0)
	if arg_2_0.bgmName and arg_2_0.bgmName ~= "" then
		return arg_2_0.bgmName
	end

	return var_0_0.super.getBGM(arg_2_0)
end

function var_0_0.preload(arg_3_0, arg_3_1)
	arg_3_0.iconSpries = {
		"reources/statu_green",
		"reources/statu_gray",
		"reources/statu_red",
		"reources/statu_org"
	}

	local var_3_0 = LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value

	seriesAsync({
		function(arg_4_0)
			arg_3_0.isCriBg, arg_3_0.bgPath, arg_3_0.bgmName, arg_3_0.isOpPlay, arg_3_0.opVersion = getLoginConfig()

			if arg_3_0.isCriBg then
				LoadAndInstantiateAsync("effect", arg_3_0.bgPath, function(arg_5_0)
					arg_3_0.criBgGo = arg_5_0

					arg_4_0()
				end)
			else
				local var_4_0 = var_3_0 and "loadingbg_hx/" or "loadingbg/"

				LoadSpriteAsync(var_4_0 .. arg_3_0.bgPath, function(arg_6_0)
					arg_3_0.staticBgSprite = arg_6_0

					arg_4_0()
				end)
			end
		end
	}, arg_3_1)
end

function var_0_0.init(arg_7_0)
	local var_7_0 = BundleWizard.Inst:GetGroupMgr("DEFAULT_RES")

	arg_7_0:setBg()

	arg_7_0.version = arg_7_0:findTF("version")
	arg_7_0.version:GetComponent("Text").text = "ver " .. var_7_0.CurrentVersion:ToString()
	arg_7_0.bgLay = arg_7_0:findTF("bg_lay")
	arg_7_0.accountBtn = arg_7_0:findTF("bg_lay/buttons/account_button")
	arg_7_0.repairBtn = arg_7_0:findTF("btns/repair_button")
	arg_7_0.privateBtn = arg_7_0:findTF("btns/private_btn")
	arg_7_0.licenceBtn = arg_7_0:findTF("btns/Licence_btn")
	arg_7_0.chInfo = arg_7_0:findTF("background/info")

	setActive(arg_7_0.chInfo, PLATFORM_CODE == PLATFORM_CH)

	if PLATFORM_CODE == PLATFORM_CH then
		arg_7_0.urlClick = arg_7_0:findTF("urlClick", arg_7_0.chInfo)

		onButton(arg_7_0, arg_7_0.urlClick, function()
			Application.OpenURL("https://beian.miit.gov.cn/#/home")
		end)
	end

	arg_7_0.pressToLogin = GetOrAddComponent(arg_7_0:findTF("background/press_to_login"), "CanvasGroup")

	LeanTween.alphaCanvas(arg_7_0.pressToLogin, 0.25, var_0_1):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

	arg_7_0.currentServer = arg_7_0:findTF("current_server")
	arg_7_0.serviceBtn = arg_7_0:findTF("bg_lay/buttons/service_button")
	arg_7_0.filingBtn = arg_7_0:findTF("filingBtn")

	setActive(arg_7_0.filingBtn, PLATFORM_CODE == PLATFORM_CH)

	arg_7_0.serversPanel = arg_7_0:findTF("servers")
	arg_7_0.servers = arg_7_0:findTF("panel/servers/content/server_list", arg_7_0.serversPanel)
	arg_7_0.serverTpl = arg_7_0:getTpl("server_tpl")
	arg_7_0.recentTF = arg_7_0:findTF("panel/servers/content/advice_panel/recent", arg_7_0.serversPanel)
	arg_7_0.adviceTF = arg_7_0:findTF("panel/servers/content/advice_panel/advice", arg_7_0.serversPanel)
	arg_7_0.userAgreenTF = arg_7_0:findTF("UserAgreement")
	arg_7_0.userAgreenMainTF = arg_7_0:findTF("UserAgreement/window")
	arg_7_0.closeUserAgreenTF = arg_7_0.userAgreenTF:Find("window/close_btn")
	arg_7_0.userAgreenConfirmTF = arg_7_0:findTF("UserAgreement/window/accept_btn")
	arg_7_0.userDisagreeConfirmTF = arg_7_0:findTF("UserAgreement/window/disagree_btn")
	arg_7_0.switchGatewayBtn = SwitchGatewayBtn.New(arg_7_0:findTF("servers/panel/switch_platform"))

	setActive(arg_7_0.userAgreenTF, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_7_0.userAgreenTF, arg_7_0._tf)

	arg_7_0.opBtn = arg_7_0:findTF("bg_lay/buttons/opBtn")

	if arg_7_0.opBtn then
		setActive(arg_7_0.opBtn, arg_7_0.isOpPlay)
	end

	arg_7_0.airiUidTxt = arg_7_0:findTF("airi_uid")
	arg_7_0.shareData = {}
	arg_7_0.searchAccount = arg_7_0:findTF("panel/searchAccount", arg_7_0.serversPanel)

	setText(findTF(arg_7_0.searchAccount, "text"), i18n("query_role_button"))

	arg_7_0.serverPanelCanvas = GetComponent(arg_7_0:findTF("servers/panel/servers"), typeof(CanvasGroup))

	onButton(arg_7_0, arg_7_0.searchAccount, function()
		if not arg_7_0.serversDic or arg_7_0.searching then
			return
		end

		arg_7_0:searchAountState(true)

		arg_7_0.serverPanelCanvas.interactable = false

		arg_7_0.event:emit(LoginMediator.ON_SEARCH_ACCOUNT, {
			callback = function()
				arg_7_0.serverPanelCanvas.interactable = true

				arg_7_0:searchAountState(false)
			end,
			update = function(arg_11_0)
				arg_7_0:setServerAccountData(arg_11_0)
			end
		})
	end, SFX_CONFIRM)

	arg_7_0.subViewList = {}
	arg_7_0.loginPanelView = LoginPanelView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)

	arg_7_0.loginPanelView:SetShareData(arg_7_0.shareData)

	arg_7_0.registerPanelView = RegisterPanelView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)

	arg_7_0.loginPanelView:SetShareData(arg_7_0.shareData)

	arg_7_0.tencentLoginPanelView = TencentLoginPanelView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)

	arg_7_0.loginPanelView:SetShareData(arg_7_0.shareData)

	arg_7_0.airiLoginPanelView = nil

	if PLATFORM_CODE == PLATFORM_US then
		arg_7_0.airiLoginPanelView = AiriUSLoginPanelView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)
	else
		arg_7_0.airiLoginPanelView = AiriLoginPanelView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)
	end

	arg_7_0.loginPanelView:SetShareData(arg_7_0.shareData)

	arg_7_0.transcodeAlertView = TranscodeAlertView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)

	arg_7_0.loginPanelView:SetShareData(arg_7_0.shareData)

	arg_7_0.yostarAlertView = YostarAlertView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)

	arg_7_0.loginPanelView:SetShareData(arg_7_0.shareData)

	arg_7_0.subViewList[LoginSceneConst.DEFINE.LOGIN_PANEL_VIEW] = arg_7_0.loginPanelView
	arg_7_0.subViewList[LoginSceneConst.DEFINE.REGISTER_PANEL_VIEW] = arg_7_0.registerPanelView
	arg_7_0.subViewList[LoginSceneConst.DEFINE.TENCENT_LOGIN_VIEW] = arg_7_0.tencentLoginPanelView
	arg_7_0.subViewList[LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW] = arg_7_0.airiLoginPanelView
	arg_7_0.subViewList[LoginSceneConst.DEFINE.TRANSCODE_ALERT_VIEW] = arg_7_0.transcodeAlertView
	arg_7_0.subViewList[LoginSceneConst.DEFINE.YOSTAR_ALERT_VIEW] = arg_7_0.yostarAlertView
	arg_7_0.subViewList[LoginSceneConst.DEFINE.PRESS_TO_LOGIN] = arg_7_0.pressToLogin
	arg_7_0.subViewList[LoginSceneConst.DEFINE.BG_LAY] = arg_7_0.bgLay
	arg_7_0.subViewList[LoginSceneConst.DEFINE.SERVER_PANEL] = arg_7_0.serversPanel
	arg_7_0.subViewList[LoginSceneConst.DEFINE.ACCOUNT_BTN] = arg_7_0.accountBtn
	arg_7_0.subViewList[LoginSceneConst.DEFINE.CURRENT_SERVER] = arg_7_0.currentServer
	arg_7_0.age = arg_7_0:findTF("background/age")

	if PLATFORM_CODE == PLATFORM_CH then
		onButton(arg_7_0, arg_7_0.age, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.cadpa_help.tip,
				title = pg.MsgboxMgr.TITLE_CADPA
			})
		end)
		SetActive(arg_7_0.age, true)
	end

	SetActive(arg_7_0.age, PLATFORM_CODE == PLATFORM_CH)
	setText(findTF(arg_7_0.currentServer, "server_name"), "")
	arg_7_0:switchToServer()
	arg_7_0:initEvents()
end

function var_0_0.setServerAccountData(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.id
	local var_13_1

	for iter_13_0 = 1, #arg_13_0.serversDic do
		if arg_13_0.serversDic[iter_13_0].id == var_13_0 then
			var_13_1 = arg_13_0.serversDic[iter_13_0]

			break
		end
	end

	if not var_13_1 then
		return
	end

	local var_13_2 = var_13_1.tf

	if arg_13_1 and arg_13_1.level then
		setActive(findTF(var_13_2, "mark/charactor"), true)
		setActive(findTF(var_13_2, "mark/level"), true)
		setActive(findTF(var_13_2, "mark/searching"), false)
		setText(findTF(var_13_2, "mark/level"), "lv." .. arg_13_1.level)
		setText(findTF(var_13_2, "mark/level"), setColorStr("lv." .. arg_13_1.level, "#ffffffff"))

		var_13_1.level = arg_13_1.level
	else
		setActive(findTF(var_13_2, "mark/level"), true)
		setActive(findTF(var_13_2, "mark/searching"), false)
		setActive(findTF(var_13_2, "mark/charactor"), false)

		var_13_1.level = 0

		setText(findTF(var_13_2, "mark/level"), setColorStr(i18n("query_role_none"), "#d0d0d0FF"))
	end
end

function var_0_0.searchAountState(arg_14_0, arg_14_1)
	arg_14_0.searching = arg_14_1

	for iter_14_0 = 1, #arg_14_0.serversDic do
		local var_14_0 = arg_14_0.serversDic[iter_14_0].tf
		local var_14_1 = arg_14_0.serversDic[iter_14_0].level

		setActive(findTF(var_14_0, "mark"), true)

		if arg_14_1 then
			setActive(findTF(var_14_0, "mark/charactor"), false)
			setActive(findTF(var_14_0, "mark/level"), true)
			setText(findTF(var_14_0, "mark/level"), setColorStr(i18n("query_role"), "#d0d0d0FF"))
			setActive(findTF(var_14_0, "mark/searching"), true)
		else
			if not var_14_1 then
				setText(findTF(var_14_0, "mark/level"), setColorStr(i18n("query_role_fail"), "#d0d0d0FF"))
			end

			setActive(findTF(var_14_0, "mark/searching"), false)
		end
	end
end

function var_0_0.initEvents(arg_15_0)
	arg_15_0:bind(LoginSceneConst.SWITCH_SUB_VIEW, function(arg_16_0, arg_16_1)
		arg_15_0:switchSubView(arg_16_1)
	end)
	arg_15_0:bind(LoginSceneConst.CLEAR_REGISTER_VIEW, function(arg_17_0)
		arg_15_0.registerPanelView:ActionInvoke("Clear")
	end)
end

function var_0_0.switchSubView(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.subViewList) do
		if isa(iter_18_1, BaseSubView) then
			if table.contains(arg_18_1, iter_18_0) then
				iter_18_1:CallbackInvoke(function()
					arg_18_0.repairBtn:SetAsLastSibling()
				end)
				iter_18_1:Load()
				iter_18_1:ActionInvoke("Show")
			else
				iter_18_1:ActionInvoke("Hide")
			end
		else
			setActive(iter_18_1, table.contains(arg_18_1, iter_18_0))
		end
	end

	if not table.contains(arg_18_1, LoginSceneConst.DEFINE.SERVER_PANEL) then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_18_0.serversPanel, arg_18_0._tf)
	end

	if table.contains(arg_18_1, LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW) then
		setActive(arg_18_0.airiUidTxt, false)
	end

	arg_18_0.userAgreenTF:SetAsLastSibling()
	arg_18_0.repairBtn:SetAsLastSibling()
end

function var_0_0.onBackPressed(arg_20_0)
	if arg_20_0.searching then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_20_0.serversPanel) then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_20_0.serversPanel, arg_20_0._tf)
		setActive(arg_20_0.serversPanel, false)

		return
	end

	if isActive(arg_20_0.userAgreenTF) then
		setActive(arg_20_0.userAgreenTF, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_20_0.userAgreenTF, arg_20_0._tf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
end

function var_0_0.setUserData(arg_21_0, arg_21_1)
	setActive(arg_21_0.airiUidTxt, true)
	setText(arg_21_0.airiUidTxt, "uid: " .. arg_21_1.arg2)
end

function var_0_0.showUserAgreement(arg_22_0, arg_22_1)
	local var_22_0

	if PLATFORM_CODE == PLATFORM_CH then
		arg_22_0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(0.7843137254901961, 0.7843137254901961, 0.7843137254901961, 0.5019607843137255)
	else
		var_22_0 = true
	end

	local var_22_1 = require("ShareCfg.UserAgreement")

	setActive(arg_22_0.userAgreenTF, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_22_0.userAgreenTF)
	setText(arg_22_0.userAgreenTF:Find("window/container/scrollrect/content/Text"), var_22_1.content)
	onButton(arg_22_0, arg_22_0.userAgreenConfirmTF, function()
		if var_22_0 then
			setActive(arg_22_0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_22_0.userAgreenTF, arg_22_0._tf)

			if arg_22_1 then
				arg_22_1()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("read_the_user_agreement"))
		end
	end)
	onScroll(arg_22_0, arg_22_0.userAgreenTF:Find("window/container/scrollrect"), function(arg_24_0)
		if arg_24_0.y <= 0.01 and not var_22_0 then
			var_22_0 = true

			if PLATFORM_CODE == PLATFORM_CH then
				arg_22_0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
			end
		end
	end)
end

function var_0_0.setBg(arg_25_0)
	arg_25_0.bgImg = arg_25_0:findTF("background/bg"):GetComponent(typeof(Image))

	if not arg_25_0.isCriBg then
		setImageSprite(arg_25_0.bgImg, arg_25_0.staticBgSprite)
	else
		arg_25_0.bgImg.enabled = false

		local var_25_0 = arg_25_0.criBgGo.transform

		var_25_0:SetParent(arg_25_0.bgImg.transform, false)
		var_25_0:SetAsFirstSibling()

		local var_25_1 = arg_25_0.criBgGo:GetComponent("AspectRatioFitter")

		if var_25_1 then
			var_25_1.enabled = true
		end
	end
end

function var_0_0.setLastLogin(arg_26_0, arg_26_1)
	arg_26_0.shareData.lastLoginUser = arg_26_1
end

function var_0_0.setAutoLogin(arg_27_0)
	arg_27_0.shareData.autoLoginEnabled = true
end

function var_0_0.setLastLoginServer(arg_28_0, arg_28_1)
	if not arg_28_1 then
		setText(findTF(arg_28_0.currentServer, "server_name"), "")

		arg_28_0.shareData.lastLoginServer = nil

		arg_28_0:updateAdviceServer()

		return
	end

	setText(findTF(arg_28_0.currentServer, "server_name"), arg_28_1.name)

	arg_28_0.shareData.lastLoginServer = arg_28_1
end

function var_0_0.didEnter(arg_29_0)
	onButton(arg_29_0, arg_29_0.closeUserAgreenTF, function()
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			setActive(arg_29_0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0.userAgreenTF, arg_29_0._tf)
		else
			setActive(arg_29_0.userAgreenMainTF, false)
			onNextTick(function()
				setActive(arg_29_0.userAgreenMainTF, true)
			end)
		end
	end, SFX_CANCEL)
	onButton(arg_29_0, arg_29_0.privateBtn, function()
		pg.SdkMgr.GetInstance():ShowPrivate()
	end, SFX_PANEL)
	onButton(arg_29_0, arg_29_0.licenceBtn, function()
		pg.SdkMgr.GetInstance():ShowLicence()
	end, SFX_PANEL)
	setActive(arg_29_0.privateBtn, PLATFORM_CODE == PLATFORM_CH)
	setActive(arg_29_0.licenceBtn, PLATFORM_CODE == PLATFORM_CH)

	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		onButton(arg_29_0, arg_29_0.userDisagreeConfirmTF, function()
			setActive(arg_29_0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0.userAgreenTF, arg_29_0._tf)
		end)
	end

	setActive(arg_29_0.serviceBtn, PLATFORM_CODE == PLATFORM_KR)
	onButton(arg_29_0, arg_29_0.serviceBtn, function()
		if PLATFORM_CODE == PLATFORM_KR then
			pg.SdkMgr.GetInstance():UserCenter()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
		end
	end, SFX_MAIN)
	onButton(arg_29_0, arg_29_0.accountBtn, function()
		local var_36_0 = pg.SdkMgr.GetInstance():GetLoginType() ~= LoginType.PLATFORM_INNER

		if not var_36_0 then
			arg_29_0:switchToLogin()
		elseif var_36_0 and PLATFORM_KR == PLATFORM_CODE then
			pg.SdkMgr.GetInstance():SwitchAccount()
		end
	end, SFX_MAIN)
	onButton(arg_29_0, arg_29_0.repairBtn, function()
		pg.RepairResMgr.GetInstance():Repair()
	end)

	local function var_29_0()
		local var_38_0 = pg.SdkMgr.GetInstance():GetLoginType()

		if var_38_0 == LoginType.PLATFORM then
			pg.SdkMgr.GetInstance():LoginSdk()
		elseif var_38_0 == LoginType.PLATFORM_TENCENT then
			arg_29_0:switchToTencentLogin()
		elseif var_38_0 == LoginType.PLATFORM_INNER then
			arg_29_0:switchToLogin()
		end
	end

	onButton(arg_29_0, arg_29_0.filingBtn, function()
		Application.OpenURL("http://sq.ccm.gov.cn:80/ccnt/sczr/service/business/emark/gameNetTag/4028c08b58bd467b0158bd8bd80d062a")
	end, SFX_PANEL)
	onButton(arg_29_0, arg_29_0.currentServer, function()
		if table.getCount(arg_29_0.serverList or {}) == 0 then
			var_29_0()
		else
			pg.UIMgr.GetInstance():BlurPanel(arg_29_0.serversPanel)
			setActive(arg_29_0.serversPanel, true)
		end
	end, SFX_PANEL)
	onButton(arg_29_0, arg_29_0.serversPanel, function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0.serversPanel, arg_29_0._tf)
		setActive(arg_29_0.serversPanel, false)
	end, SFX_CANCEL)
	onButton(arg_29_0, arg_29_0:findTF("background"), function()
		if pg.CpkPlayMgr.GetInstance():OnPlaying() then
			return
		end

		if not arg_29_0.initFinished then
			return
		end

		if arg_29_0.isNeedResCheck then
			arg_29_0.event:emit(LoginMediator.CHECK_RES)

			return
		end

		if getProxy(SettingsProxy):CheckNeedUserAgreement() then
			arg_29_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)

			return
		end

		if go(arg_29_0.pressToLogin).activeSelf then
			if table.getCount(arg_29_0.serverList or {}) == 0 then
				var_29_0()

				return
			end

			if not arg_29_0.shareData.lastLoginServer then
				pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_choiseServer"))

				return
			end

			if arg_29_0.shareData.lastLoginServer.status == Server.STATUS.VINDICATE or arg_29_0.shareData.lastLoginServer.status == Server.STATUS.FULL then
				ServerStateChecker.New():Execute(function(arg_43_0)
					if arg_43_0 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_disabled"))
					else
						arg_29_0.event:emit(LoginMediator.ON_SERVER, arg_29_0.shareData.lastLoginServer)
						pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
					end
				end)

				return
			end

			arg_29_0.event:emit(LoginMediator.ON_SERVER, arg_29_0.shareData.lastLoginServer)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
		end
	end)

	if arg_29_0.isOpPlay then
		onButton(arg_29_0, arg_29_0.opBtn, function()
			if arg_29_0.initFinished and not pg.CpkPlayMgr.GetInstance():OnPlaying() then
				arg_29_0:playOpening()
			end
		end)

		if PLATFORM_CODE ~= PLATFORM_JP and PlayerPrefs.GetString("op_ver", "") ~= arg_29_0.opVersion then
			arg_29_0:playOpening(function()
				PlayerPrefs.SetString("op_ver", arg_29_0.opVersion)
				arg_29_0:playExtraVoice()

				arg_29_0.initFinished = true

				arg_29_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
			end)

			return
		end

		arg_29_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
	else
		arg_29_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
	end

	arg_29_0:playExtraVoice()

	arg_29_0.initFinished = true

	arg_29_0:InitPrivateAndLicence()
end

function var_0_0.InitPrivateAndLicence(arg_46_0)
	local var_46_0 = PLATFORM_CODE == PLATFORM_CH or IsUnityEditor

	setActive(arg_46_0.privateBtn, var_46_0)
	setActive(arg_46_0.licenceBtn, var_46_0)

	if var_46_0 then
		onButton(arg_46_0, arg_46_0.privateBtn, function()
			pg.SdkMgr.GetInstance():ShowPrivate()
		end, SFX_PANEL)
		onButton(arg_46_0, arg_46_0.licenceBtn, function()
			pg.SdkMgr.GetInstance():ShowLicence()
		end, SFX_PANEL)
	end
end

local function var_0_2()
	local var_49_0 = pg.gameset.login_extra_voice.description

	if var_49_0 and #var_49_0 > 0 then
		local var_49_1 = var_49_0[math.clamp(math.floor(math.random() * #var_49_0) + 1, 1, #var_49_0)]

		return "cv-" .. var_49_1, "extra"
	end

	return nil, nil
end

local function var_0_3(arg_50_0)
	local var_50_0 = arg_50_0.description[1]
	local var_50_1 = arg_50_0.description[2]
	local var_50_2 = arg_50_0.description[3]

	if pg.TimeMgr.GetInstance():inTime(var_50_1) then
		local var_50_3 = math.random(1, var_50_2)

		return var_50_0, "extra" .. var_50_3
	end

	return nil, nil
end

function var_0_0.GetExtraVoiceSheetAndCue(arg_51_0)
	local var_51_0
	local var_51_1
	local var_51_2 = pg.gameset.new_login_extra_voice

	if var_51_2 then
		var_51_0, var_51_1 = var_0_3(var_51_2)
	end

	if not var_51_0 or not var_51_1 then
		var_51_0, var_51_1 = var_0_2()
	end

	return var_51_0, var_51_1
end

function var_0_0.playExtraVoice(arg_52_0)
	local var_52_0, var_52_1 = arg_52_0:GetExtraVoiceSheetAndCue()

	if var_52_0 and var_52_1 then
		arg_52_0.loginCueSheet = var_52_0

		pg.CriMgr.GetInstance():PlayCV_V3(var_52_0, var_52_1)
	end
end

function var_0_0.unloadExtraVoice(arg_53_0)
	if arg_53_0.loginCueSheet then
		pg.CriMgr.GetInstance():UnloadCueSheet(arg_53_0.loginCueSheet)

		arg_53_0.loginCueSheet = nil
	end
end

function var_0_0.autoLogin(arg_54_0)
	if arg_54_0.shareData.lastLoginUser then
		if arg_54_0.shareData.autoLoginEnabled then
			arg_54_0.event:emit(LoginMediator.ON_LOGIN, arg_54_0.shareData.lastLoginUser)
		end

		if arg_54_0.loginPanelView:GetLoaded() then
			if arg_54_0.shareData.lastLoginUser.type == 1 then
				arg_54_0.loginPanelView:SetContent(arg_54_0.shareData.lastLoginUser.arg2, arg_54_0.shareData.lastLoginUser.arg3)
			elseif arg_54_0.shareData.lastLoginUser.type == 2 then
				arg_54_0.loginPanelView:SetContent(arg_54_0.shareData.lastLoginUser.arg1, arg_54_0.shareData.lastLoginUser.arg2)
			end
		end
	end
end

local var_0_4 = {
	{
		0.403921568627451,
		1,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		0.6078431372549019,
		0.6078431372549019,
		0.6078431372549019,
		0.6274509803921569
	},
	{
		1,
		0.3607843137254902,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		1,
		0.6588235294117647,
		0.2196078431372549,
		0.6274509803921569
	}
}

function var_0_0.updateServerTF(arg_55_0, arg_55_1, arg_55_2)
	setText(findTF(arg_55_1, "name"), "-  " .. arg_55_2.name .. "  -")
	arg_55_0:setSpriteTo(arg_55_0.iconSpries[arg_55_2.status + 1], findTF(arg_55_1, "statu"), true)

	findTF(arg_55_1, "statu_1"):GetComponent("Image").color = Color.New(var_0_4[arg_55_2.status + 1][1], var_0_4[arg_55_2.status + 1][2], var_0_4[arg_55_2.status + 1][3], var_0_4[arg_55_2.status + 1][4])

	setActive(findTF(arg_55_1, "mark"), arg_55_2.isLogined)
	setActive(arg_55_0:findTF("tag_new", arg_55_1), arg_55_2.isNew)
	setActive(arg_55_0:findTF("tag_hot", arg_55_1), arg_55_2.isHot)
	onButton(arg_55_0, arg_55_1, function()
		if arg_55_2.status == Server.STATUS.VINDICATE then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_vindicate"))

			return
		end

		if arg_55_2.status == Server.STATUS.FULL then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_full"))

			return
		end

		arg_55_0:setLastLoginServer(arg_55_2)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_55_0.serversPanel, arg_55_0._tf)
		setActive(arg_55_0.serversPanel, false)
	end, SFX_CONFIRM)
end

function var_0_0.updateAdviceServer(arg_57_0)
	if not arg_57_0.recentTF or not arg_57_0.adviceTF then
		return
	end

	setActive(arg_57_0.recentTF, arg_57_0.shareData.lastLoginServer)

	if arg_57_0.shareData.lastLoginServer then
		local var_57_0 = findTF(arg_57_0.recentTF, "server")

		arg_57_0:updateServerTF(var_57_0, arg_57_0.shareData.lastLoginServer)
	end

	local var_57_1 = getProxy(ServerProxy).firstServer

	setActive(arg_57_0.adviceTF, var_57_1)

	if var_57_1 then
		local var_57_2 = findTF(arg_57_0.adviceTF, "server")

		arg_57_0:updateServerTF(var_57_2, var_57_1)
	end
end

function var_0_0.updateServerList(arg_58_0, arg_58_1)
	arg_58_0.serverList = arg_58_1

	local var_58_0 = _.sort(_.values(arg_58_1), function(arg_59_0, arg_59_1)
		return arg_59_0.sortIndex < arg_59_1.sortIndex
	end)

	removeAllChildren(arg_58_0.servers)

	if IsUnityEditor then
		table.sort(var_58_0, function(arg_60_0, arg_60_1)
			local var_60_0 = string.lower(arg_60_0.name)
			local var_60_1 = string.lower(arg_60_1.name)

			return string.byte(var_60_0, 1) > string.byte(var_60_1, 1)
		end)
	end

	arg_58_0.serversDic = {}

	for iter_58_0, iter_58_1 in pairs(var_58_0) do
		local var_58_1 = cloneTplTo(arg_58_0.serverTpl, arg_58_0.servers)

		arg_58_0:updateServerTF(var_58_1, iter_58_1)
		table.insert(arg_58_0.serversDic, {
			server = iter_58_1,
			tf = var_58_1,
			id = iter_58_1.id
		})
	end
end

function var_0_0.fillterRefundServer(arg_61_0)
	local var_61_0 = getProxy(UserProxy)
	local var_61_1 = {}

	if var_61_0.data.limitServerIds and #var_61_0.data.limitServerIds > 0 and arg_61_0.serverList and #arg_61_0.serverList > 0 then
		local var_61_2 = var_61_0.data.limitServerIds
		local var_61_3

		for iter_61_0, iter_61_1 in pairs(arg_61_0.serverList) do
			local var_61_4 = iter_61_1.id
			local var_61_5 = false

			for iter_61_2, iter_61_3 in pairs(var_61_2) do
				if var_61_2[iter_61_2] == var_61_4 and not var_61_5 then
					if not var_61_3 then
						var_61_3 = "\n" .. iter_61_1.name
					else
						var_61_3 = var_61_3 .. "," .. iter_61_1.name
					end

					table.insert(var_61_1, iter_61_1)

					var_61_5 = true
				end
			end
		end

		arg_61_0:updateServerList(var_61_1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			hideClose = true,
			content = i18n("login_arrears_tips", var_61_3),
			onYes = function()
				return
			end
		})
	end
end

function var_0_0.switchToTencentLogin(arg_63_0)
	arg_63_0:switchSubView({
		LoginSceneConst.DEFINE.TENCENT_LOGIN_VIEW
	})
end

function var_0_0.switchToAiriLogin(arg_64_0)
	arg_64_0:switchSubView({
		LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
		LoginSceneConst.DEFINE.PRESS_TO_LOGIN
	})
end

function var_0_0.switchToLogin(arg_65_0)
	arg_65_0:switchSubView({
		LoginSceneConst.DEFINE.LOGIN_PANEL_VIEW
	})
end

function var_0_0.switchToRegister(arg_66_0)
	arg_66_0:switchSubView({
		LoginSceneConst.DEFINE.REGISTER_PANEL_VIEW
	})
end

function var_0_0.switchToServer(arg_67_0)
	arg_67_0:updateAdviceServer()

	if pg.SdkMgr.GetInstance():GetLoginType() ~= LoginType.PLATFORM_INNER and PLATFORM_CODE ~= PLATFORM_KR then
		arg_67_0:switchSubView({
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN,
			LoginSceneConst.DEFINE.CURRENT_SERVER,
			LoginSceneConst.DEFINE.BG_LAY
		})
	else
		arg_67_0:switchSubView({
			LoginSceneConst.DEFINE.ACCOUNT_BTN,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN,
			LoginSceneConst.DEFINE.CURRENT_SERVER,
			LoginSceneConst.DEFINE.BG_LAY
		})
	end
end

function var_0_0.SwitchToWaitPanel(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_0:findTF("Msgbox")
	local var_68_1 = arg_68_0:findTF("window/content", var_68_0)

	arg_68_0.waitTimer = nil

	local var_68_2 = 0
	local var_68_3 = arg_68_1

	arg_68_0.waitTimer = Timer.New(function()
		setText(var_68_1, i18n("login_wait_tip", var_68_3))

		arg_68_1 = arg_68_1 - 1

		if math.random(0, 1) == 1 then
			var_68_3 = arg_68_1
		end

		if arg_68_1 <= 0 then
			triggerButton(arg_68_0:findTF("background"))
			arg_68_0.waitTimer:Stop()

			arg_68_0.waitTimer = nil
		end
	end, 1, -1)

	arg_68_0.waitTimer:Start()
	arg_68_0.waitTimer.func()
	setActive(var_68_0, true)
end

function var_0_0.willExit(arg_70_0)
	if arg_70_0.waitTimer then
		arg_70_0.waitTimer:Stop()

		arg_70_0.waitTimer = nil
	end

	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()
	arg_70_0.loginPanelView:Destroy()
	arg_70_0.registerPanelView:Destroy()
	arg_70_0.tencentLoginPanelView:Destroy()
	arg_70_0.airiLoginPanelView:Destroy()
	arg_70_0.transcodeAlertView:Destroy()
	arg_70_0.yostarAlertView:Destroy()
	arg_70_0.switchGatewayBtn:Dispose()

	arg_70_0.iconSpries = nil
end

function var_0_0.playOpening(arg_71_0, arg_71_1)
	pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
		if not arg_71_0.cg then
			arg_71_0.cg = GetOrAddComponent(arg_71_0._tf, "CanvasGroup")
		end

		arg_71_0.cg.alpha = 0
	end, function()
		arg_71_0.cg.alpha = 1

		if arg_71_1 then
			arg_71_1()
		end
	end, "ui", "opening", true, false)

	arg_71_0.onPlayingOP = true
end

function var_0_0.closeYostarAlertView(arg_74_0)
	if arg_74_0.yostarAlertView and arg_74_0.yostarAlertView:CheckState(BaseSubView.STATES.INITED) then
		arg_74_0.yostarAlertView:Destroy()
	end
end

function var_0_0.onLoadDataDone(arg_75_0)
	arg_75_0:unloadExtraVoice()

	if getProxy(PlayerProxy) then
		getProxy(PlayerProxy):setFlag("login", true)
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MAINUI, {
			isFromLogin = true
		})
	end
end

return var_0_0
