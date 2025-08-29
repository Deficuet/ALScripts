local var_0_0 = class("IslandSettingsScene", import("view.Setting.NewSettingsScene"))

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
		Settings3DPage.New(var_12_0, arg_12_0.event, arg_12_0.contextData)
	}
	arg_12_0.toggles = {
		arg_12_0:findTF("blur_panel/adapt/left_length/other")
	}

	setActive(arg_12_0:findTF("blur_panel/adapt/left_length/other"), false)
	setActive(arg_12_0:findTF("blur_panel/adapt/left_length/options"), false)
	setActive(arg_12_0:findTF("blur_panel/adapt/left_length/battle_ui"), false)
	setActive(arg_12_0:findTF("blur_panel/adapt/left_length/resources"), false)
	setActive(arg_12_0:findTF("blur_panel/adapt/left_length/threeD"), false)

	arg_12_0.logoutBtn = arg_12_0:findTF("blur_panel/adapt/left_length/logout")

	setActive(arg_12_0.logoutBtn, false)

	arg_12_0.helpBtn = arg_12_0:findTF("blur_panel/adapt/left_length/help_us")
	arg_12_0.descWindow = SettingsMsgBosPage.New(arg_12_0._tf, arg_12_0.event)
end

function var_0_0.didEnter(arg_13_0)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		arg_13_0:closeView()
	end, SFX_CANCEL)

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
		onToggle(arg_13_0, iter_13_1, function(arg_17_0)
			if arg_17_0 then
				arg_13_0:SwitchPage(iter_13_0)
			end
		end, SFX_PANEL)
	end

	arg_13_0:EnterDefaultPage()
	arg_13_0:ExtraHandle()
end

function var_0_0.ExtraHandle(arg_18_0)
	setParent(arg_18_0._tf, arg_18_0.contextData.container)
	setActive(arg_18_0._tf:Find("blur_panel/adapt/top/option"), false)
end

function var_0_0.EnterDefaultPage(arg_19_0)
	triggerToggle(arg_19_0.toggles[1], true)
end

function var_0_0.SwitchPage(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.pages[arg_20_1]

	if arg_20_0.page and arg_20_0.page ~= var_20_0 and arg_20_0.page:GetLoaded() then
		arg_20_0.page:Hide()
	end

	var_20_0:ExecuteAction("Show")

	arg_20_0.page = var_20_0

	if isa(var_20_0, Settings3DPage) then
		arg_20_0.hasShow3d = true
	end
end

function var_0_0.OpenYostarAlertView(arg_21_0)
	arg_21_0.yostarAlertView = YostarAlertView.New(arg_21_0._tf, arg_21_0.event, {
		isDestroyOnClose = true,
		isLinkMode = true
	})

	arg_21_0.yostarAlertView:Load()
	arg_21_0.yostarAlertView:ActionInvoke("Show")
end

function var_0_0.CloseYostarAlertView(arg_22_0)
	if arg_22_0.yostarAlertView and arg_22_0.yostarAlertView:CheckState(BaseSubView.STATES.INITED) then
		arg_22_0.yostarAlertView:Destroy()
	end
end

function var_0_0.onBackPressed(arg_23_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	local var_23_0 = GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")

	if isActive(var_23_0) then
		triggerButton(var_23_0.transform:Find("dialog/title/back"))

		return
	end

	arg_23_0:closeView()
end

function var_0_0.closeView(arg_24_0)
	arg_24_0.contextData.onClose()
	GraphicSettingConst.SettingQuality()
end

function var_0_0.willExit(arg_25_0)
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
