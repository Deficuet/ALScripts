local var_0_0 = class("NewSettingsScene", import("..base.BaseUI"))

var_0_0.PAGE_OTHER = 1
var_0_0.PAGE_OPTION = 2
var_0_0.PAGE_BATTLE = 3
var_0_0.PAGE_RES = 4
var_0_0.PAGE_3D = 5

function var_0_0.getUIName(arg_1_0)
	return "NewSettingsUI"
end

function var_0_0.OnShowDescWindow(arg_2_0, arg_2_1)
	arg_2_0.descWindow:ExecuteAction("Show", arg_2_1.desc, arg_2_1.alignment)
end

function var_0_0.OnClearExchangeCode(arg_3_0)
	if arg_3_0.pages and arg_3_0.pages[1] and arg_3_0.pages[1]:GetLoaded() then
		arg_3_0.pages[1]:OnClearExchangeCode()
	end
end

function var_0_0.OnShowTranscode(arg_4_0, arg_4_1)
	if arg_4_0.pages and arg_4_0.pages[1] and arg_4_0.pages[1]:GetLoaded() then
		arg_4_0.pages[1]:OnShowTranscode(arg_4_1)
	end
end

function var_0_0.OnCheckAllAccountState(arg_5_0)
	if arg_5_0.pages and arg_5_0.pages[1] and arg_5_0.pages[1]:GetLoaded() then
		arg_5_0.pages[1]:OnCheckAllAccountState()
	end
end

function var_0_0.OnSecondPwdStateChange(arg_6_0)
	if arg_6_0.pages and arg_6_0.pages[1] and arg_6_0.pages[1]:GetLoaded() then
		arg_6_0.pages[1]:OnSecondPwdStateChange()
	end
end

function var_0_0.OnRandomFlagShipModeUpdate(arg_7_0)
	arg_7_0:emit(SettingsRandomFlagShipAndSkinPanel.EVT_UPDTAE)
end

function var_0_0.OnSelectGraphicSettingLevel(arg_8_0)
	arg_8_0:emit(SettingsOtherGraphicsPanle.EVT_UPDTAE)
end

function var_0_0.OnSelectCustomGraphicSetting(arg_9_0)
	arg_9_0:emit(SettingsGraphicsPanle.EVT_UPDTAE)
end

function var_0_0.OnApplicationPause(arg_10_0)
	arg_10_0:emit(SettingsNotificationPanel.UPDATE_ALARM_PANEL)
end

function var_0_0.GetPage(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.pages) do
		if isa(iter_11_1, arg_11_1) then
			return iter_11_1
		end
	end
end

function var_0_0.init(arg_12_0)
	arg_12_0.backBtn = arg_12_0:findTF("blur_panel/adapt/top/back_btn")

	local var_12_0 = arg_12_0:findTF("pages")

	arg_12_0.pages = {
		SettingsOtherPage.New(var_12_0, arg_12_0.event, arg_12_0.contextData),
		SettingsOptionPage.New(var_12_0, arg_12_0.event, arg_12_0.contextData),
		SettingsBattlePage.New(var_12_0, arg_12_0.event, arg_12_0.contextData),
		SettingsResPage.New(var_12_0, arg_12_0.event, arg_12_0.contextData)
	}
	arg_12_0.toggles = {
		arg_12_0:findTF("blur_panel/adapt/left_length/other"),
		arg_12_0:findTF("blur_panel/adapt/left_length/options"),
		arg_12_0:findTF("blur_panel/adapt/left_length/battle_ui"),
		arg_12_0:findTF("blur_panel/adapt/left_length/resources")
	}

	setActive(arg_12_0.toggles[5], false)

	arg_12_0.otherTip = arg_12_0.toggles[1]:Find("tip")
	arg_12_0.logoutBtn = arg_12_0:findTF("blur_panel/adapt/left_length/logout")
	arg_12_0.helpBtn = arg_12_0:findTF("blur_panel/adapt/left_length/help_us")
	arg_12_0.descWindow = SettingsMsgBosPage.New(arg_12_0._tf, arg_12_0.event)

	setActive(arg_12_0:findTF("blur_panel/adapt/left_length/threeD"), false)
end

function var_0_0.didEnter(arg_13_0)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		arg_13_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.logoutBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("main_settingsScene_quest_exist"),
			onYes = function()
				arg_13_0:emit(NewSettingsMediator.ON_LOGOUT)
			end
		})
	end, SFX_PANEL)

	if PLATFORM_CODE == PLATFORM_US then
		setActive(arg_13_0.helpBtn, true)
		onButton(arg_13_0, arg_13_0.helpBtn, function()
			pg.SdkMgr.GetInstance():OpenYostarHelp()
		end, SFX_PANEL)
	elseif PLATFORM_CODE == PLATFORM_KR then
		setActive(arg_13_0.helpBtn, true)
		onButton(arg_13_0, arg_13_0.helpBtn, function()
			pg.SdkMgr.GetInstance():BugReport()
		end, SFX_CANCEL)
		arg_13_0.helpBtn:SetAsFirstSibling()
	end

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.toggles) do
		onToggle(arg_13_0, iter_13_1, function(arg_19_0)
			if arg_19_0 then
				arg_13_0:SwitchPage(iter_13_0)
			end
		end, SFX_PANEL)
	end

	setActive(arg_13_0.otherTip, PlayerPrefs.GetInt("firstIntoOtherPanel", 0) == 0)
	arg_13_0:EnterDefaultPage()
end

function var_0_0.EnterDefaultPage(arg_20_0)
	local var_20_0
	local var_20_1 = arg_20_0.contextData.toggle

	if var_20_1 and type(var_20_1) == "string" then
		if var_20_1 == "sound" or var_20_1 == "res" then
			var_20_0 = var_0_0.PAGE_RES
		else
			var_20_0 = table.indexof({
				"other",
				"options",
				"interface",
				"res"
			}, var_20_1)
		end
	end

	local var_20_2 = arg_20_0.contextData.page or var_20_0 or var_0_0.PAGE_RES

	triggerToggle(arg_20_0.toggles[var_20_2], true)
end

function var_0_0.SwitchPage(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.pages[arg_21_1]

	if arg_21_0.page and arg_21_0.page ~= var_21_0 and arg_21_0.page:GetLoaded() then
		arg_21_0.page:Hide()
	end

	var_21_0:ExecuteAction("Show")

	arg_21_0.page = var_21_0

	if isa(var_21_0, Settings3DPage) then
		arg_21_0.hasShow3d = true
	end

	if isa(var_21_0, SettingsOtherPage) and isActive(arg_21_0.otherTip) then
		setActive(arg_21_0.otherTip, false)
	end
end

function var_0_0.OpenYostarAlertView(arg_22_0)
	arg_22_0.yostarAlertView = YostarAlertView.New(arg_22_0._tf, arg_22_0.event, {
		isDestroyOnClose = true,
		isLinkMode = true
	})

	arg_22_0.yostarAlertView:Load()
	arg_22_0.yostarAlertView:ActionInvoke("Show")
end

function var_0_0.CloseYostarAlertView(arg_23_0)
	if arg_23_0.yostarAlertView and arg_23_0.yostarAlertView:CheckState(BaseSubView.STATES.INITED) then
		arg_23_0.yostarAlertView:Destroy()
	end
end

function var_0_0.onBackPressed(arg_24_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	local var_24_0 = GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")

	if isActive(var_24_0) then
		triggerButton(var_24_0.transform:Find("dialog/title/back"))

		return
	end

	arg_24_0:emit(var_0_0.ON_BACK)
end

function var_0_0.willExit(arg_25_0)
	if arg_25_0.hasShow3d then
		GraphicSettingConst.SettingQuality()
	end

	for iter_25_0, iter_25_1 in pairs(arg_25_0.pages) do
		iter_25_1:Destroy()
	end

	if arg_25_0.descWindow then
		arg_25_0.descWindow:Destroy()

		arg_25_0.descWindow = nil
	end

	arg_25_0.page = nil
	arg_25_0.pages = nil
end

return var_0_0
