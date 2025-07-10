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
	arg_3_0.iconSpries = {}

	local var_3_0 = LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value

	seriesAsync({
		function(arg_4_0)
			local var_4_0 = {
				"statu_green",
				"statu_gray",
				"statu_red",
				"statu_org"
			}

			AssetBundleHelper.LoadManyAssets("ui/LoginUI2_atlas", var_4_0, typeof(Sprite), true, function(arg_5_0)
				for iter_5_0, iter_5_1 in ipairs(var_4_0) do
					table.insert(arg_3_0.iconSpries, arg_5_0[iter_5_1])
				end

				arg_4_0()
			end, true)
		end,
		function(arg_6_0)
			arg_3_0.isCriBg, arg_3_0.bgPath, arg_3_0.bgmName, arg_3_0.isOpPlay, arg_3_0.opVersion = getLoginConfig()

			if arg_3_0.isCriBg then
				LoadAndInstantiateAsync("effect", arg_3_0.bgPath, function(arg_7_0)
					arg_3_0.criBgGo = arg_7_0

					arg_6_0()
				end)
			else
				local var_6_0 = var_3_0 and "loadingbg_hx/" or "loadingbg/"

				LoadSpriteAsync(var_6_0 .. arg_3_0.bgPath, function(arg_8_0)
					arg_3_0.staticBgSprite = arg_8_0

					arg_6_0()
				end)
			end
		end
	}, arg_3_1)
end

function var_0_0.init(arg_9_0)
	local var_9_0 = BundleWizard.Inst:GetGroupMgr("DEFAULT_RES")

	arg_9_0:setBg()

	arg_9_0.version = arg_9_0:findTF("version")
	arg_9_0.version:GetComponent("Text").text = "ver " .. var_9_0.CurrentVersion:ToString()
	arg_9_0.bgLay = arg_9_0:findTF("bg_lay")
	arg_9_0.accountBtn = arg_9_0:findTF("bg_lay/buttons/account_button")
	arg_9_0.repairBtn = arg_9_0:findTF("btns/repair_button")
	arg_9_0.privateBtn = arg_9_0:findTF("btns/private_btn")
	arg_9_0.licenceBtn = arg_9_0:findTF("btns/Licence_btn")
	arg_9_0.chInfo = arg_9_0:findTF("background/info")

	setActive(arg_9_0.chInfo, PLATFORM_CODE == PLATFORM_CH)

	if PLATFORM_CODE == PLATFORM_CH then
		arg_9_0.urlClick = arg_9_0:findTF("urlClick", arg_9_0.chInfo)

		onButton(arg_9_0, arg_9_0.urlClick, function()
			Application.OpenURL("https://beian.miit.gov.cn/#/home")
		end)
	end

	arg_9_0.pressToLogin = GetOrAddComponent(arg_9_0:findTF("background/press_to_login"), "CanvasGroup")

	LeanTween.alphaCanvas(arg_9_0.pressToLogin, 0.25, var_0_1):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

	arg_9_0.currentServer = arg_9_0:findTF("current_server")
	arg_9_0.serviceBtn = arg_9_0:findTF("bg_lay/buttons/service_button")
	arg_9_0.filingBtn = arg_9_0:findTF("filingBtn")

	setActive(arg_9_0.filingBtn, PLATFORM_CODE == PLATFORM_CH)

	arg_9_0.serversPanel = arg_9_0:findTF("servers")
	arg_9_0.servers = arg_9_0:findTF("panel/servers/content/server_list", arg_9_0.serversPanel)
	arg_9_0.serverTpl = arg_9_0:getTpl("server_tpl")
	arg_9_0.recentTF = arg_9_0:findTF("panel/servers/content/advice_panel/recent", arg_9_0.serversPanel)
	arg_9_0.adviceTF = arg_9_0:findTF("panel/servers/content/advice_panel/advice", arg_9_0.serversPanel)
	arg_9_0.userAgreenTF = arg_9_0:findTF("UserAgreement")
	arg_9_0.userAgreenMainTF = arg_9_0:findTF("UserAgreement/window")
	arg_9_0.closeUserAgreenTF = arg_9_0.userAgreenTF:Find("window/close_btn")
	arg_9_0.userAgreenConfirmTF = arg_9_0:findTF("UserAgreement/window/accept_btn")
	arg_9_0.userDisagreeConfirmTF = arg_9_0:findTF("UserAgreement/window/disagree_btn")
	arg_9_0.switchGatewayBtn = SwitchGatewayBtn.New(arg_9_0:findTF("servers/panel/switch_platform"))

	setActive(arg_9_0.userAgreenTF, false)
	pg.UIMgr.GetInstance():UnblurPanel(arg_9_0.userAgreenTF, arg_9_0._tf)

	arg_9_0.opBtn = arg_9_0:findTF("bg_lay/buttons/opBtn")

	if arg_9_0.opBtn then
		setActive(arg_9_0.opBtn, arg_9_0.isOpPlay)
	end

	arg_9_0.airiUidTxt = arg_9_0:findTF("airi_uid")
	arg_9_0.shareData = {}
	arg_9_0.searchAccount = arg_9_0:findTF("panel/searchAccount", arg_9_0.serversPanel)

	setText(findTF(arg_9_0.searchAccount, "text"), i18n("query_role_button"))

	arg_9_0.serverPanelCanvas = GetComponent(arg_9_0:findTF("servers/panel/servers"), typeof(CanvasGroup))

	onButton(arg_9_0, arg_9_0.searchAccount, function()
		if not arg_9_0.serversDic or arg_9_0.searching then
			return
		end

		arg_9_0:searchAountState(true)

		arg_9_0.serverPanelCanvas.interactable = false

		arg_9_0.event:emit(LoginMediator.ON_SEARCH_ACCOUNT, {
			callback = function()
				arg_9_0.serverPanelCanvas.interactable = true

				arg_9_0:searchAountState(false)
			end,
			update = function(arg_13_0)
				arg_9_0:setServerAccountData(arg_13_0)
			end
		})
	end, SFX_CONFIRM)

	arg_9_0.subViewList = {}
	arg_9_0.loginPanelView = LoginPanelView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)

	arg_9_0.loginPanelView:SetShareData(arg_9_0.shareData)

	arg_9_0.registerPanelView = RegisterPanelView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)

	arg_9_0.loginPanelView:SetShareData(arg_9_0.shareData)

	arg_9_0.tencentLoginPanelView = TencentLoginPanelView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)

	arg_9_0.loginPanelView:SetShareData(arg_9_0.shareData)

	arg_9_0.airiLoginPanelView = nil

	if PLATFORM_CODE == PLATFORM_US then
		arg_9_0.airiLoginPanelView = AiriUSLoginPanelView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)
	else
		arg_9_0.airiLoginPanelView = AiriLoginPanelView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)
	end

	arg_9_0.loginPanelView:SetShareData(arg_9_0.shareData)

	arg_9_0.transcodeAlertView = TranscodeAlertView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)

	arg_9_0.loginPanelView:SetShareData(arg_9_0.shareData)

	arg_9_0.yostarAlertView = YostarAlertView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)

	arg_9_0.loginPanelView:SetShareData(arg_9_0.shareData)

	arg_9_0.subViewList[LoginSceneConst.DEFINE.LOGIN_PANEL_VIEW] = arg_9_0.loginPanelView
	arg_9_0.subViewList[LoginSceneConst.DEFINE.REGISTER_PANEL_VIEW] = arg_9_0.registerPanelView
	arg_9_0.subViewList[LoginSceneConst.DEFINE.TENCENT_LOGIN_VIEW] = arg_9_0.tencentLoginPanelView
	arg_9_0.subViewList[LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW] = arg_9_0.airiLoginPanelView
	arg_9_0.subViewList[LoginSceneConst.DEFINE.TRANSCODE_ALERT_VIEW] = arg_9_0.transcodeAlertView
	arg_9_0.subViewList[LoginSceneConst.DEFINE.YOSTAR_ALERT_VIEW] = arg_9_0.yostarAlertView
	arg_9_0.subViewList[LoginSceneConst.DEFINE.PRESS_TO_LOGIN] = arg_9_0.pressToLogin
	arg_9_0.subViewList[LoginSceneConst.DEFINE.BG_LAY] = arg_9_0.bgLay
	arg_9_0.subViewList[LoginSceneConst.DEFINE.SERVER_PANEL] = arg_9_0.serversPanel
	arg_9_0.subViewList[LoginSceneConst.DEFINE.ACCOUNT_BTN] = arg_9_0.accountBtn
	arg_9_0.subViewList[LoginSceneConst.DEFINE.CURRENT_SERVER] = arg_9_0.currentServer
	arg_9_0.age = arg_9_0:findTF("background/age")

	if PLATFORM_CODE == PLATFORM_CH then
		onButton(arg_9_0, arg_9_0.age, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.cadpa_help.tip,
				title = pg.MsgboxMgr.TITLE_CADPA
			})
		end)
		SetActive(arg_9_0.age, true)
	end

	SetActive(arg_9_0.age, PLATFORM_CODE == PLATFORM_CH)
	setText(findTF(arg_9_0.currentServer, "server_name"), "")
	arg_9_0:switchToServer()
	arg_9_0:initEvents()
end

function var_0_0.setServerAccountData(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.id
	local var_15_1

	for iter_15_0 = 1, #arg_15_0.serversDic do
		if arg_15_0.serversDic[iter_15_0].id == var_15_0 then
			var_15_1 = arg_15_0.serversDic[iter_15_0]

			break
		end
	end

	if not var_15_1 then
		return
	end

	local var_15_2 = var_15_1.tf

	if arg_15_1 and arg_15_1.level then
		setActive(findTF(var_15_2, "mark/charactor"), true)
		setActive(findTF(var_15_2, "mark/level"), true)
		setActive(findTF(var_15_2, "mark/searching"), false)
		setText(findTF(var_15_2, "mark/level"), "lv." .. arg_15_1.level)
		setText(findTF(var_15_2, "mark/level"), setColorStr("lv." .. arg_15_1.level, "#ffffffff"))

		var_15_1.level = arg_15_1.level
	else
		setActive(findTF(var_15_2, "mark/level"), true)
		setActive(findTF(var_15_2, "mark/searching"), false)
		setActive(findTF(var_15_2, "mark/charactor"), false)

		var_15_1.level = 0

		setText(findTF(var_15_2, "mark/level"), setColorStr(i18n("query_role_none"), "#d0d0d0FF"))
	end
end

function var_0_0.searchAountState(arg_16_0, arg_16_1)
	arg_16_0.searching = arg_16_1

	for iter_16_0 = 1, #arg_16_0.serversDic do
		local var_16_0 = arg_16_0.serversDic[iter_16_0].tf
		local var_16_1 = arg_16_0.serversDic[iter_16_0].level

		setActive(findTF(var_16_0, "mark"), true)

		if arg_16_1 then
			setActive(findTF(var_16_0, "mark/charactor"), false)
			setActive(findTF(var_16_0, "mark/level"), true)
			setText(findTF(var_16_0, "mark/level"), setColorStr(i18n("query_role"), "#d0d0d0FF"))
			setActive(findTF(var_16_0, "mark/searching"), true)
		else
			if not var_16_1 then
				setText(findTF(var_16_0, "mark/level"), setColorStr(i18n("query_role_fail"), "#d0d0d0FF"))
			end

			setActive(findTF(var_16_0, "mark/searching"), false)
		end
	end
end

function var_0_0.initEvents(arg_17_0)
	arg_17_0:bind(LoginSceneConst.SWITCH_SUB_VIEW, function(arg_18_0, arg_18_1)
		arg_17_0:switchSubView(arg_18_1)
	end)
	arg_17_0:bind(LoginSceneConst.CLEAR_REGISTER_VIEW, function(arg_19_0)
		arg_17_0.registerPanelView:ActionInvoke("Clear")
	end)
end

function var_0_0.switchSubView(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.subViewList) do
		if isa(iter_20_1, BaseSubView) then
			if table.contains(arg_20_1, iter_20_0) then
				iter_20_1:CallbackInvoke(function()
					arg_20_0.repairBtn:SetAsLastSibling()
				end)
				iter_20_1:Load()
				iter_20_1:ActionInvoke("Show")
			else
				iter_20_1:ActionInvoke("Hide")
			end
		else
			setActive(iter_20_1, table.contains(arg_20_1, iter_20_0))
		end
	end

	if not table.contains(arg_20_1, LoginSceneConst.DEFINE.SERVER_PANEL) then
		pg.UIMgr.GetInstance():UnblurPanel(arg_20_0.serversPanel, arg_20_0._tf)
	end

	if table.contains(arg_20_1, LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW) then
		setActive(arg_20_0.airiUidTxt, false)
	end

	arg_20_0.userAgreenTF:SetAsLastSibling()
	arg_20_0.repairBtn:SetAsLastSibling()
end

function var_0_0.onBackPressed(arg_22_0)
	if arg_22_0.searching then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_22_0.serversPanel) then
		pg.UIMgr.GetInstance():UnblurPanel(arg_22_0.serversPanel, arg_22_0._tf)
		setActive(arg_22_0.serversPanel, false)

		return
	end

	if isActive(arg_22_0.userAgreenTF) then
		setActive(arg_22_0.userAgreenTF, false)
		pg.UIMgr.GetInstance():UnblurPanel(arg_22_0.userAgreenTF, arg_22_0._tf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
end

function var_0_0.setUserData(arg_23_0, arg_23_1)
	setActive(arg_23_0.airiUidTxt, true)
	setText(arg_23_0.airiUidTxt, "uid: " .. arg_23_1.arg2)
end

function var_0_0.showUserAgreement(arg_24_0, arg_24_1)
	local var_24_0

	if PLATFORM_CODE == PLATFORM_CH then
		arg_24_0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(0.7843137254901961, 0.7843137254901961, 0.7843137254901961, 0.5019607843137255)
	else
		var_24_0 = true
	end

	local var_24_1 = require("ShareCfg.UserAgreement")

	setActive(arg_24_0.userAgreenTF, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_24_0.userAgreenTF, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
	setText(arg_24_0.userAgreenTF:Find("window/container/scrollrect/content/Text"), var_24_1.content)
	onButton(arg_24_0, arg_24_0.userAgreenConfirmTF, function()
		if var_24_0 then
			setActive(arg_24_0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(arg_24_0.userAgreenTF, arg_24_0._tf)

			if arg_24_1 then
				arg_24_1()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("read_the_user_agreement"))
		end
	end)
	onScroll(arg_24_0, arg_24_0.userAgreenTF:Find("window/container/scrollrect"), function(arg_26_0)
		if arg_26_0.y <= 0.01 and not var_24_0 then
			var_24_0 = true

			if PLATFORM_CODE == PLATFORM_CH then
				arg_24_0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
			end
		end
	end)
end

function var_0_0.setBg(arg_27_0)
	arg_27_0.bgImg = arg_27_0:findTF("background/bg"):GetComponent(typeof(Image))

	if not arg_27_0.isCriBg then
		setImageSprite(arg_27_0.bgImg, arg_27_0.staticBgSprite)
	else
		arg_27_0.bgImg.enabled = false

		local var_27_0 = arg_27_0.criBgGo.transform

		var_27_0:SetParent(arg_27_0.bgImg.transform, false)
		var_27_0:SetAsFirstSibling()

		local var_27_1 = arg_27_0.criBgGo:GetComponent("AspectRatioFitter")

		if var_27_1 then
			var_27_1.enabled = true
		end
	end
end

function var_0_0.setLastLogin(arg_28_0, arg_28_1)
	arg_28_0.shareData.lastLoginUser = arg_28_1
end

function var_0_0.setAutoLogin(arg_29_0)
	arg_29_0.shareData.autoLoginEnabled = true
end

function var_0_0.setLastLoginServer(arg_30_0, arg_30_1)
	if not arg_30_1 then
		setText(findTF(arg_30_0.currentServer, "server_name"), "")

		arg_30_0.shareData.lastLoginServer = nil

		arg_30_0:updateAdviceServer()

		return
	end

	setText(findTF(arg_30_0.currentServer, "server_name"), arg_30_1.name)

	arg_30_0.shareData.lastLoginServer = arg_30_1
end

function var_0_0.didEnter(arg_31_0)
	onButton(arg_31_0, arg_31_0.closeUserAgreenTF, function()
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			setActive(arg_31_0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(arg_31_0.userAgreenTF, arg_31_0._tf)
		else
			setActive(arg_31_0.userAgreenMainTF, false)
			onNextTick(function()
				setActive(arg_31_0.userAgreenMainTF, true)
			end)
		end
	end, SFX_CANCEL)
	onButton(arg_31_0, arg_31_0.privateBtn, function()
		pg.SdkMgr.GetInstance():ShowPrivate()
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0.licenceBtn, function()
		pg.SdkMgr.GetInstance():ShowLicence()
	end, SFX_PANEL)
	setActive(arg_31_0.privateBtn, PLATFORM_CODE == PLATFORM_CH)
	setActive(arg_31_0.licenceBtn, PLATFORM_CODE == PLATFORM_CH)

	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		onButton(arg_31_0, arg_31_0.userDisagreeConfirmTF, function()
			setActive(arg_31_0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(arg_31_0.userAgreenTF, arg_31_0._tf)
		end)
	end

	setActive(arg_31_0.serviceBtn, PLATFORM_CODE == PLATFORM_KR)
	onButton(arg_31_0, arg_31_0.serviceBtn, function()
		if PLATFORM_CODE == PLATFORM_KR then
			pg.SdkMgr.GetInstance():UserCenter()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
		end
	end, SFX_MAIN)
	onButton(arg_31_0, arg_31_0.accountBtn, function()
		local var_38_0 = pg.SdkMgr.GetInstance():GetLoginType() ~= LoginType.PLATFORM_INNER

		if not var_38_0 then
			arg_31_0:switchToLogin()
		elseif var_38_0 and PLATFORM_KR == PLATFORM_CODE then
			pg.SdkMgr.GetInstance():SwitchAccount()
		end
	end, SFX_MAIN)
	onButton(arg_31_0, arg_31_0.repairBtn, function()
		pg.RepairResMgr.GetInstance():Repair()
	end)

	local function var_31_0()
		local var_40_0 = pg.SdkMgr.GetInstance():GetLoginType()

		if var_40_0 == LoginType.PLATFORM then
			pg.SdkMgr.GetInstance():LoginSdk()
		elseif var_40_0 == LoginType.PLATFORM_TENCENT then
			arg_31_0:switchToTencentLogin()
		elseif var_40_0 == LoginType.PLATFORM_INNER then
			arg_31_0:switchToLogin()
		end
	end

	onButton(arg_31_0, arg_31_0.filingBtn, function()
		Application.OpenURL("http://sq.ccm.gov.cn:80/ccnt/sczr/service/business/emark/gameNetTag/4028c08b58bd467b0158bd8bd80d062a")
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0.currentServer, function()
		if table.getCount(arg_31_0.serverList or {}) == 0 then
			var_31_0()
		else
			pg.UIMgr.GetInstance():BlurPanel(arg_31_0.serversPanel)
			setActive(arg_31_0.serversPanel, true)
		end
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0.serversPanel, function()
		pg.UIMgr.GetInstance():UnblurPanel(arg_31_0.serversPanel, arg_31_0._tf)
		setActive(arg_31_0.serversPanel, false)
	end, SFX_CANCEL)
	onButton(arg_31_0, arg_31_0:findTF("background"), function()
		if pg.CpkPlayMgr.GetInstance():OnPlaying() then
			return
		end

		if not arg_31_0.initFinished then
			return
		end

		if arg_31_0.isNeedResCheck then
			arg_31_0.event:emit(LoginMediator.CHECK_RES)

			return
		end

		if getProxy(SettingsProxy):CheckNeedUserAgreement() then
			arg_31_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)

			return
		end

		if go(arg_31_0.pressToLogin).activeSelf then
			if table.getCount(arg_31_0.serverList or {}) == 0 then
				var_31_0()

				return
			end

			if not arg_31_0.shareData.lastLoginServer then
				pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_choiseServer"))

				return
			end

			if arg_31_0.shareData.lastLoginServer.status == Server.STATUS.VINDICATE or arg_31_0.shareData.lastLoginServer.status == Server.STATUS.FULL then
				ServerStateChecker.New():Execute(function(arg_45_0)
					if arg_45_0 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_disabled"))
					else
						arg_31_0.event:emit(LoginMediator.ON_SERVER, arg_31_0.shareData.lastLoginServer)
						pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
					end
				end)

				return
			end

			arg_31_0.event:emit(LoginMediator.ON_SERVER, arg_31_0.shareData.lastLoginServer)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CONFIRM)
		end
	end)

	if arg_31_0.isOpPlay then
		onButton(arg_31_0, arg_31_0.opBtn, function()
			if arg_31_0.initFinished and not pg.CpkPlayMgr.GetInstance():OnPlaying() then
				arg_31_0:playOpening()
			end
		end)

		if PLATFORM_CODE ~= PLATFORM_JP and PlayerPrefs.GetString("op_ver", "") ~= arg_31_0.opVersion then
			arg_31_0:playOpening(function()
				PlayerPrefs.SetString("op_ver", arg_31_0.opVersion)
				arg_31_0:playExtraVoice()

				arg_31_0.initFinished = true

				arg_31_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
			end)

			return
		end

		arg_31_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
	else
		arg_31_0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
	end

	arg_31_0:playExtraVoice()

	arg_31_0.initFinished = true

	arg_31_0:InitPrivateAndLicence()
end

function var_0_0.InitPrivateAndLicence(arg_48_0)
	local var_48_0 = PLATFORM_CODE == PLATFORM_CH or IsUnityEditor

	setActive(arg_48_0.privateBtn, var_48_0)
	setActive(arg_48_0.licenceBtn, var_48_0)

	if var_48_0 then
		onButton(arg_48_0, arg_48_0.privateBtn, function()
			pg.SdkMgr.GetInstance():ShowPrivate()
		end, SFX_PANEL)
		onButton(arg_48_0, arg_48_0.licenceBtn, function()
			pg.SdkMgr.GetInstance():ShowLicence()
		end, SFX_PANEL)
	end
end

local function var_0_2()
	local var_51_0 = pg.gameset.login_extra_voice.description

	if var_51_0 and #var_51_0 > 0 then
		local var_51_1 = var_51_0[math.clamp(math.floor(math.random() * #var_51_0) + 1, 1, #var_51_0)]

		return "cv-" .. var_51_1, "extra"
	end

	return nil, nil
end

local function var_0_3(arg_52_0)
	local var_52_0 = arg_52_0.description[1]
	local var_52_1 = arg_52_0.description[2]
	local var_52_2 = arg_52_0.description[3]

	if pg.TimeMgr.GetInstance():inTime(var_52_1) then
		local var_52_3 = math.random(1, var_52_2)

		return var_52_0, "extra" .. var_52_3
	end

	return nil, nil
end

function var_0_0.GetExtraVoiceSheetAndCue(arg_53_0)
	local var_53_0
	local var_53_1
	local var_53_2 = pg.gameset.new_login_extra_voice

	if var_53_2 then
		var_53_0, var_53_1 = var_0_3(var_53_2)
	end

	if not var_53_0 or not var_53_1 then
		var_53_0, var_53_1 = var_0_2()
	end

	return var_53_0, var_53_1
end

function var_0_0.playExtraVoice(arg_54_0)
	local var_54_0, var_54_1 = arg_54_0:GetExtraVoiceSheetAndCue()

	if var_54_0 and var_54_1 then
		arg_54_0.loginCueSheet = var_54_0

		pg.CriMgr.GetInstance():PlayCV_V3(var_54_0, var_54_1)
	end
end

function var_0_0.unloadExtraVoice(arg_55_0)
	if arg_55_0.loginCueSheet then
		pg.CriMgr.GetInstance():UnloadCueSheet(arg_55_0.loginCueSheet)

		arg_55_0.loginCueSheet = nil
	end
end

function var_0_0.autoLogin(arg_56_0)
	if arg_56_0.shareData.lastLoginUser then
		if arg_56_0.shareData.autoLoginEnabled then
			arg_56_0.event:emit(LoginMediator.ON_LOGIN, arg_56_0.shareData.lastLoginUser)
		end

		if arg_56_0.loginPanelView:GetLoaded() then
			if arg_56_0.shareData.lastLoginUser.type == 1 then
				arg_56_0.loginPanelView:SetContent(arg_56_0.shareData.lastLoginUser.arg2, arg_56_0.shareData.lastLoginUser.arg3)
			elseif arg_56_0.shareData.lastLoginUser.type == 2 then
				arg_56_0.loginPanelView:SetContent(arg_56_0.shareData.lastLoginUser.arg1, arg_56_0.shareData.lastLoginUser.arg2)
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

function var_0_0.updateServerTF(arg_57_0, arg_57_1, arg_57_2)
	setText(findTF(arg_57_1, "name"), "-  " .. arg_57_2.name .. "  -")
	setImageSprite(findTF(arg_57_1, "statu"), arg_57_0.iconSpries[arg_57_2.status + 1], true)

	findTF(arg_57_1, "statu_1"):GetComponent("Image").color = Color.New(var_0_4[arg_57_2.status + 1][1], var_0_4[arg_57_2.status + 1][2], var_0_4[arg_57_2.status + 1][3], var_0_4[arg_57_2.status + 1][4])

	setActive(findTF(arg_57_1, "mark"), arg_57_2.isLogined)
	setActive(arg_57_0:findTF("tag_new", arg_57_1), arg_57_2.isNew)
	setActive(arg_57_0:findTF("tag_hot", arg_57_1), arg_57_2.isHot)
	onButton(arg_57_0, arg_57_1, function()
		if arg_57_2.status == Server.STATUS.VINDICATE then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_vindicate"))

			return
		end

		if arg_57_2.status == Server.STATUS.FULL then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_full"))

			return
		end

		arg_57_0:setLastLoginServer(arg_57_2)
		pg.UIMgr.GetInstance():UnblurPanel(arg_57_0.serversPanel, arg_57_0._tf)
		setActive(arg_57_0.serversPanel, false)
	end, SFX_CONFIRM)
end

function var_0_0.updateAdviceServer(arg_59_0)
	if not arg_59_0.recentTF or not arg_59_0.adviceTF then
		return
	end

	setActive(arg_59_0.recentTF, arg_59_0.shareData.lastLoginServer)

	if arg_59_0.shareData.lastLoginServer then
		local var_59_0 = findTF(arg_59_0.recentTF, "server")

		arg_59_0:updateServerTF(var_59_0, arg_59_0.shareData.lastLoginServer)
	end

	local var_59_1 = getProxy(ServerProxy).firstServer

	setActive(arg_59_0.adviceTF, var_59_1)

	if var_59_1 then
		local var_59_2 = findTF(arg_59_0.adviceTF, "server")

		arg_59_0:updateServerTF(var_59_2, var_59_1)
	end
end

function var_0_0.updateServerList(arg_60_0, arg_60_1)
	arg_60_0.serverList = arg_60_1

	local var_60_0 = _.sort(_.values(arg_60_1), function(arg_61_0, arg_61_1)
		return arg_61_0.sortIndex < arg_61_1.sortIndex
	end)

	removeAllChildren(arg_60_0.servers)

	if IsUnityEditor then
		table.sort(var_60_0, function(arg_62_0, arg_62_1)
			local var_62_0 = string.lower(arg_62_0.name)
			local var_62_1 = string.lower(arg_62_1.name)

			return string.byte(var_62_0, 1) > string.byte(var_62_1, 1)
		end)
	end

	arg_60_0.serversDic = {}

	for iter_60_0, iter_60_1 in pairs(var_60_0) do
		local var_60_1 = cloneTplTo(arg_60_0.serverTpl, arg_60_0.servers)

		arg_60_0:updateServerTF(var_60_1, iter_60_1)
		table.insert(arg_60_0.serversDic, {
			server = iter_60_1,
			tf = var_60_1,
			id = iter_60_1.id
		})
	end
end

function var_0_0.fillterRefundServer(arg_63_0)
	local var_63_0 = getProxy(UserProxy)
	local var_63_1 = {}

	if var_63_0.data.limitServerIds and #var_63_0.data.limitServerIds > 0 and arg_63_0.serverList and #arg_63_0.serverList > 0 then
		local var_63_2 = var_63_0.data.limitServerIds
		local var_63_3

		for iter_63_0, iter_63_1 in pairs(arg_63_0.serverList) do
			local var_63_4 = iter_63_1.id
			local var_63_5 = false

			for iter_63_2, iter_63_3 in pairs(var_63_2) do
				if var_63_2[iter_63_2] == var_63_4 and not var_63_5 then
					if not var_63_3 then
						var_63_3 = "\n" .. iter_63_1.name
					else
						var_63_3 = var_63_3 .. "," .. iter_63_1.name
					end

					table.insert(var_63_1, iter_63_1)

					var_63_5 = true
				end
			end
		end

		arg_63_0:updateServerList(var_63_1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			hideClose = true,
			content = i18n("login_arrears_tips", var_63_3),
			onYes = function()
				return
			end
		})
	end
end

function var_0_0.switchToTencentLogin(arg_65_0)
	arg_65_0:switchSubView({
		LoginSceneConst.DEFINE.TENCENT_LOGIN_VIEW
	})
end

function var_0_0.switchToAiriLogin(arg_66_0)
	arg_66_0:switchSubView({
		LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
		LoginSceneConst.DEFINE.PRESS_TO_LOGIN
	})
end

function var_0_0.switchToLogin(arg_67_0)
	arg_67_0:switchSubView({
		LoginSceneConst.DEFINE.LOGIN_PANEL_VIEW
	})
end

function var_0_0.switchToRegister(arg_68_0)
	arg_68_0:switchSubView({
		LoginSceneConst.DEFINE.REGISTER_PANEL_VIEW
	})
end

function var_0_0.switchToServer(arg_69_0)
	arg_69_0:updateAdviceServer()

	if pg.SdkMgr.GetInstance():GetLoginType() ~= LoginType.PLATFORM_INNER and PLATFORM_CODE ~= PLATFORM_KR then
		arg_69_0:switchSubView({
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN,
			LoginSceneConst.DEFINE.CURRENT_SERVER,
			LoginSceneConst.DEFINE.BG_LAY
		})
	else
		arg_69_0:switchSubView({
			LoginSceneConst.DEFINE.ACCOUNT_BTN,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN,
			LoginSceneConst.DEFINE.CURRENT_SERVER,
			LoginSceneConst.DEFINE.BG_LAY
		})
	end
end

function var_0_0.SwitchToWaitPanel(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0:findTF("Msgbox")
	local var_70_1 = arg_70_0:findTF("window/content", var_70_0)

	arg_70_0.waitTimer = nil

	local var_70_2 = 0
	local var_70_3 = arg_70_1

	arg_70_0.waitTimer = Timer.New(function()
		setText(var_70_1, i18n("login_wait_tip", var_70_3))

		arg_70_1 = arg_70_1 - 1

		if math.random(0, 1) == 1 then
			var_70_3 = arg_70_1
		end

		if arg_70_1 <= 0 then
			triggerButton(arg_70_0:findTF("background"))
			arg_70_0.waitTimer:Stop()

			arg_70_0.waitTimer = nil
		end
	end, 1, -1)

	arg_70_0.waitTimer:Start()
	arg_70_0.waitTimer.func()
	setActive(var_70_0, true)
end

function var_0_0.willExit(arg_72_0)
	if arg_72_0.waitTimer then
		arg_72_0.waitTimer:Stop()

		arg_72_0.waitTimer = nil
	end

	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()
	arg_72_0.loginPanelView:Destroy()
	arg_72_0.registerPanelView:Destroy()
	arg_72_0.tencentLoginPanelView:Destroy()
	arg_72_0.airiLoginPanelView:Destroy()
	arg_72_0.transcodeAlertView:Destroy()
	arg_72_0.yostarAlertView:Destroy()
	arg_72_0.switchGatewayBtn:Dispose()
end

function var_0_0.playOpening(arg_73_0, arg_73_1)
	pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
		if not arg_73_0.cg then
			arg_73_0.cg = GetOrAddComponent(arg_73_0._tf, "CanvasGroup")
		end

		arg_73_0.cg.alpha = 0
	end, function()
		arg_73_0.cg.alpha = 1

		if arg_73_1 then
			arg_73_1()
		end
	end, "ui", "opening", true, false, nil)

	arg_73_0.onPlayingOP = true
end

function var_0_0.closeYostarAlertView(arg_76_0)
	if arg_76_0.yostarAlertView and arg_76_0.yostarAlertView:CheckState(BaseSubView.STATES.INITED) then
		arg_76_0.yostarAlertView:Destroy()
	end
end

function var_0_0.onLoadDataDone(arg_77_0)
	arg_77_0:unloadExtraVoice()

	if getProxy(PlayerProxy) then
		getProxy(PlayerProxy):setFlag("login", true)
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MAINUI, {
			isFromLogin = true
		})
	end
end

return var_0_0
