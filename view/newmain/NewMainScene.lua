local var_0_0 = class("NewMainScene", import("..base.BaseUI"))

var_0_0.THEME_CLASSIC = 1
var_0_0.THEME_MELLOW = 2
var_0_0.OPEN_LIVEAREA = "NewMainScene:OPEN_LIVEAREA"
var_0_0.UPDATE_COVER = "NewMainScene:UPDATE_COVER"
var_0_0.FOLD = "NewMainScene:FOLD"
var_0_0.HIDE = "NewMainScene:HIDE"
var_0_0.CHAT_STATE_CHANGE = "NewMainScene:CHAT_STATE_CHANGE"
var_0_0.ON_CHANGE_SKIN = "NewMainScene:ON_CHANGE_SKIN"
var_0_0.ON_BUFF_DESC = "NewMainScene:ON_BUFF_DESC"
var_0_0.ON_SKIN_FREEUSAGE_DESC = "NewMainScene:ON_SKIN_FREEUSAGE_DESC"
var_0_0.ENABLE_PAITING_MOVE = "NewMainScene:ENABLE_PAITING_MOVE"
var_0_0.ENABLE_PAITING_SCALE = "NewMainScene:ENABLE_PAITING_SCALE"
var_0_0.SAVE_PART_SCALE = "NewMainScene:SAVE_PART_SCALE"
var_0_0.RESET_PAITING_SCALE = "NewMainScene:RESET_PAITING_SCALE"
var_0_0.SET_SCALE_PART_CONTENT = "NewMainScene:SET_SCALE_PART_CONTENT"
var_0_0.ON_ENTER_DONE = "NewMainScene:ON_ENTER_DONE"
var_0_0.ENTER_SILENT_VIEW = "NewMainScene:ENTER_SILENT_VIEW"
var_0_0.EXIT_SILENT_VIEW = "NewMainScene:EXIT_SILENT_VIEW"
var_0_0.RESET_L2D = "NewMainScene:RESET_L2D"

function var_0_0.getUIName(arg_1_0)
	return "NewMainUI"
end

function var_0_0.needCache(arg_2_0)
	return true
end

function var_0_0.forceGC(arg_3_0)
	return true
end

function var_0_0.GetThemeStyle(arg_4_0)
	return getProxy(SettingsProxy):GetMainSceneThemeStyle()
end

function var_0_0.PlayBGM(arg_5_0)
	return
end

function var_0_0.GetFlagShip(arg_6_0)
	return (getProxy(PlayerProxy):getRawData():GetFlagShip())
end

function var_0_0.PlayBgm(arg_7_0, arg_7_1)
	local var_7_0
	local var_7_1

	if underscore.any({
		function()
			if arg_7_1:IsBgmSkin() and getProxy(SettingsProxy):IsBGMEnable() then
				var_7_0 = arg_7_1:GetSkinBgm()
			end

			return tobool(var_7_0)
		end,
		function()
			if getProxy(SettingsProxy):IsEnableMainMusicPlayer() and getProxy(AppreciateProxy):CanPlayMainMusicPlayer() then
				var_7_0 = "MainMusicPlayer"
				var_7_1 = {
					loopType = getProxy(AppreciateProxy):getMusicPlayerLoopType(),
					albumName = getProxy(AppreciateProxy):getMainPlayerAlbumName()
				}
			end

			return tobool(var_7_0)
		end,
		function()
			local var_10_0, var_10_1 = MainBGView.GetBgAndBgm()

			var_7_0 = var_10_1

			return tobool(var_7_0)
		end,
		function()
			var_7_0 = var_0_0.super.getBGM(arg_7_0)

			return tobool(var_7_0)
		end
	}, function(arg_12_0)
		return arg_12_0()
	end) then
		pg.BgmMgr.GetInstance():Push(arg_7_0.__cname, var_7_0, var_7_1)
	end
end

function var_0_0.ResUISettings(arg_13_0)
	return {
		showType = PlayerResUI.TYPE_ALL,
		anim = not arg_13_0.resAnimFlag
	}
end

function var_0_0.ShowOrHideResUI(arg_14_0, arg_14_1)
	if not arg_14_0.isInit then
		return
	end

	var_0_0.super.ShowOrHideResUI(arg_14_0, arg_14_1)
end

function var_0_0.init(arg_15_0)
	arg_15_0.mainCG = GetOrAddComponent(arg_15_0._tf, typeof(CanvasGroup))
	arg_15_0.bgView = MainBGView.New(arg_15_0:findTF("Sea/bg"))
	arg_15_0.paintingView = MainPaintingView.New(arg_15_0:findTF("paint"), arg_15_0:findTF("paintBg"), arg_15_0.event)
	arg_15_0.effectView = MainEffectView.New(arg_15_0:findTF("paint/effect"))
	arg_15_0.buffDescPage = MainBuffDescPage.New(arg_15_0._tf, arg_15_0.event)
	arg_15_0.calibrationPage = MainCalibrationPage.New(arg_15_0._tf, arg_15_0.event, arg_15_0.contextData)
	arg_15_0.silentView = MainSilentView.New(arg_15_0._tf, arg_15_0.event, arg_15_0.contextData)
	arg_15_0.silentChecker = MainSilentChecker.New(arg_15_0.event)
	arg_15_0.skinExperienceDisplayPage = SkinExperienceDiplayPage.New(arg_15_0._tf, arg_15_0.event)

	if USE_OLD_MAIN_LIVE_AREA_UI then
		arg_15_0.liveAreaPage = MainLiveAreaOldPage.New(arg_15_0._tf, arg_15_0.event)
	else
		arg_15_0.liveAreaPage = MainLiveAreaPage.New(arg_15_0._tf, arg_15_0.event)
	end

	pg.redDotHelper = MainReddotView.New()
	arg_15_0.sequenceView = MainSequenceView.New()
	arg_15_0.awakeSequenceView = MainAwakeSequenceView.New()
	arg_15_0.themes = {
		[var_0_0.THEME_CLASSIC] = NewMainClassicTheme.New(arg_15_0._tf, arg_15_0.event, arg_15_0.contextData),
		[var_0_0.THEME_MELLOW] = NewMainMellowTheme.New(arg_15_0._tf, arg_15_0.event, arg_15_0.contextData)
	}

	for iter_15_0, iter_15_1 in pairs(arg_15_0.themes) do
		iter_15_1:RegisterView(arg_15_0)
	end
end

function var_0_0.didEnter(arg_16_0)
	arg_16_0:bind(var_0_0.FOLD, function(arg_17_0, arg_17_1)
		arg_16_0:FoldPanels(arg_17_1)

		local var_17_0 = arg_16_0.paintingView.ship

		if not var_17_0 then
			return
		end

		arg_16_0.calibrationPage:ExecuteAction("ShowOrHide", arg_17_1, arg_16_0.bgView.ship, arg_16_0.theme:GetPaintingOffset(var_17_0), arg_16_0.theme:GetCalibrationBG())
	end)
	arg_16_0:bind(var_0_0.HIDE, function(arg_18_0, arg_18_1)
		arg_16_0:HidePanel(arg_18_1)

		local var_18_0 = arg_16_0.paintingView.ship

		if not var_18_0 then
			return
		end

		arg_16_0.calibrationPage:ExecuteAction("ShowOrHide", arg_18_1, arg_16_0.bgView.ship, arg_16_0.theme:GetPaintingOffset(var_18_0), arg_16_0.theme:GetCalibrationBG())
	end)
	arg_16_0:bind(var_0_0.ON_CHANGE_SKIN, function(arg_19_0)
		arg_16_0:SwitchToNextShip()
	end)
	arg_16_0:bind(var_0_0.ENTER_SILENT_VIEW, function()
		arg_16_0:ExitCalibrationView()
		arg_16_0:FoldPanels(true)
		arg_16_0.silentView:ExecuteAction("Show")
	end)
	arg_16_0:bind(GAME.WILL_LOGOUT, function()
		arg_16_0:GameLogout()
	end)
	arg_16_0:bind(var_0_0.EXIT_SILENT_VIEW, function()
		arg_16_0:ExitSilentView()
		arg_16_0:SetUpSilentChecker()
		pg.redDotHelper:_Refresh()
	end)
	arg_16_0:bind(var_0_0.ON_SKIN_FREEUSAGE_DESC, function(arg_23_0, arg_23_1)
		arg_16_0.skinExperienceDisplayPage:ExecuteAction("Show", arg_23_1)
	end)
	arg_16_0:bind(NewMainScene.OPEN_LIVEAREA, function(arg_24_0)
		arg_16_0.liveAreaPage:ExecuteAction("Show")
	end)
	arg_16_0:SetUp(false, true)
end

function var_0_0.SetUp(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.mainCG.blocksRaycasts = false
	arg_25_0.isInit = false
	arg_25_0.resAnimFlag = false

	local var_25_0

	seriesAsync({
		function(arg_26_0)
			arg_25_0.awakeSequenceView:Execute(arg_26_0)
		end,
		function(arg_27_0)
			var_25_0 = arg_25_0:GetFlagShip()

			arg_25_0.bgView:Init(var_25_0)
			onNextTick(arg_27_0)
		end,
		function(arg_28_0)
			arg_25_0.theme = arg_25_0.themes[arg_25_0:GetThemeStyle()]

			arg_25_0.theme:ExecuteAction("Show", arg_28_0)
		end,
		function(arg_29_0)
			onNextTick(arg_29_0)
		end,
		function(arg_30_0)
			arg_25_0.isInit = true

			arg_25_0.theme:PlayEnterAnimation(var_25_0, arg_30_0)

			local var_30_0 = arg_25_0.theme:GetPaintingOffset(var_25_0)

			arg_25_0.paintingView:Init(var_25_0, var_30_0, arg_25_1)

			arg_25_0.resAnimFlag = true
		end,
		function(arg_31_0)
			arg_25_0:PlayBgm(var_25_0)
			arg_25_0.effectView:Init(var_25_0)
			arg_25_0.theme:init(var_25_0)
			onNextTick(arg_31_0)
		end,
		function(arg_32_0)
			arg_25_0:ShowOrHideResUI(arg_25_0.theme:ApplyDefaultResUI())
			arg_25_0.sequenceView:Execute(arg_32_0)
		end
	}, function()
		arg_25_0:SetUpSilentChecker()
		arg_25_0:emit(var_0_0.ON_ENTER_DONE)

		arg_25_0.mainCG.blocksRaycasts = true

		if arg_25_2 then
			gcAll()
		end
	end)
end

function var_0_0.SetUpSilentChecker(arg_34_0)
	local var_34_0 = getProxy(SettingsProxy):GetMainSceneScreenSleepTime()

	arg_34_0.defaultSleepTimeout = Screen.sleepTimeout
	Screen.sleepTimeout = var_34_0

	if SettingsMainScenePanel.IsEnableStandbyMode() then
		arg_34_0.silentChecker:SetUp()
	end
end

function var_0_0.RevertSleepTimeout(arg_35_0)
	if arg_35_0.defaultSleepTimeout and Screen.sleepTimeout ~= arg_35_0.defaultSleepTimeout then
		Screen.sleepTimeout = arg_35_0.defaultSleepTimeout
	end

	arg_35_0.defaultSleepTimeout = nil
end

function var_0_0.FoldPanels(arg_36_0, arg_36_1)
	if not arg_36_0.theme then
		return
	end

	arg_36_0.foldFlag = arg_36_1

	arg_36_0.theme:OnFoldPanels(arg_36_1)
	arg_36_0.paintingView:Fold(arg_36_1, 0.5)
	pg.playerResUI:Fold(arg_36_1, 0.5)
end

function var_0_0.HidePanel(arg_37_0, arg_37_1)
	if not arg_37_0.theme then
		return
	end

	if arg_37_0.foldFlag == arg_37_1 then
		return
	end

	arg_37_0.foldFlag = arg_37_1

	arg_37_0.theme:OnFoldPanels(arg_37_1)
	pg.playerResUI:Fold(arg_37_1, 0.5)
end

function var_0_0.SwitchToNextShip(arg_38_0)
	if arg_38_0.paintingView:IsLoading() or arg_38_0.bgView:IsLoading() or not arg_38_0.theme then
		return
	end

	local var_38_0 = getProxy(PlayerProxy):getRawData():GetNextFlagShip()

	if arg_38_0.bgView.ship:getSkinId() ~= var_38_0:getSkinId() or arg_38_0.bgView.ship.id ~= var_38_0.id then
		arg_38_0.bgView:Refresh(var_38_0)
		arg_38_0:PlayBgm(var_38_0)
		arg_38_0.paintingView:Refresh(var_38_0, arg_38_0.theme:GetPaintingOffset(var_38_0))
		arg_38_0.effectView:Refresh(var_38_0)
		arg_38_0.theme:OnSwitchToNextShip(var_38_0)
	end
end

function var_0_0.UpdateFlagShip(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_0.paintingView:IsLoading() or arg_39_0.bgView:IsLoading() or not arg_39_0.theme then
		return
	end

	local var_39_0 = arg_39_2.callback

	arg_39_0.bgView:Refresh(arg_39_1)
	arg_39_0:PlayBgm(arg_39_1)
	arg_39_0.paintingView:SetOnceLoadedCall(var_39_0)
	arg_39_0.paintingView:Refresh(arg_39_1, arg_39_0.theme:GetPaintingOffset(arg_39_1))
	arg_39_0.effectView:Refresh(arg_39_1)
	arg_39_0.theme:OnSwitchToNextShip(arg_39_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_40_0, arg_40_1)
	arg_40_0.paintingView:PlayChangeSkinActionOut(arg_40_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_41_0, arg_41_1)
	arg_41_0.paintingView:PlayChangeSkinActionIn(arg_41_1)
end

function var_0_0.CheckAndReplayBgm(arg_42_0)
	local var_42_0 = arg_42_0:GetFlagShip()

	arg_42_0.theme:Refresh(var_42_0)
	arg_42_0:PlayBgm(var_42_0)
end

function var_0_0.SetEffectPanelVisible(arg_43_0, arg_43_1)
	if arg_43_0.theme then
		arg_43_0.theme:SetEffectPanelVisible(arg_43_1)
	end
end

function var_0_0.OnVisible(arg_44_0)
	local var_44_0 = arg_44_0.themes[arg_44_0:GetThemeStyle()]

	if not (not arg_44_0.theme or var_44_0 ~= arg_44_0.theme) then
		arg_44_0:Refresh()
	else
		arg_44_0:UnloadTheme()
		arg_44_0:SetUp(true)
	end
end

function var_0_0.Refresh(arg_45_0)
	arg_45_0.mainCG.blocksRaycasts = false

	seriesAsync({
		function(arg_46_0)
			arg_45_0.awakeSequenceView:Execute(arg_46_0)
		end,
		function(arg_47_0)
			arg_45_0.isInit = true

			arg_45_0:ShowOrHideResUI(arg_45_0.theme:ApplyDefaultResUI())

			local var_47_0 = arg_45_0:GetFlagShip()

			arg_45_0.bgView:Refresh(var_47_0)
			arg_45_0.paintingView:Refresh(var_47_0, arg_45_0.theme:GetPaintingOffset(var_47_0))
			arg_45_0.effectView:Refresh(var_47_0)
			arg_45_0.theme:Refresh(var_47_0)
			arg_45_0:PlayBgm(var_47_0)
			pg.redDotHelper:Refresh()
			arg_47_0()
		end,
		function(arg_48_0)
			arg_45_0.sequenceView:Execute(arg_48_0)
		end
	}, function()
		arg_45_0:SetUpSilentChecker()
		arg_45_0:emit(var_0_0.ON_ENTER_DONE)

		arg_45_0.mainCG.blocksRaycasts = true
	end)
end

function var_0_0.OnDisVisible(arg_50_0)
	arg_50_0:FoldPanels(false)
	arg_50_0.paintingView:Disable()
	arg_50_0.bgView:Disable()
	arg_50_0.sequenceView:Disable()
	arg_50_0.awakeSequenceView:Disable()

	if arg_50_0.theme then
		arg_50_0.theme:Disable()
	end

	pg.redDotHelper:Disable()
	arg_50_0.buffDescPage:Disable()
	arg_50_0.silentChecker:Disable()

	if arg_50_0.silentView and arg_50_0.silentView:isShowing() then
		arg_50_0:ExitSilentView()
	end

	arg_50_0.calibrationPage:Destroy()
	arg_50_0.calibrationPage:Reset()
	arg_50_0.skinExperienceDisplayPage:Destroy()
	arg_50_0.skinExperienceDisplayPage:Reset()
	arg_50_0.liveAreaPage:Destroy()
	arg_50_0.liveAreaPage:Reset()

	arg_50_0.isInit = false

	arg_50_0:RevertSleepTimeout()
end

function var_0_0.UnloadTheme(arg_51_0)
	if arg_51_0.theme then
		arg_51_0.theme:Destroy()
		arg_51_0.theme:Reset()

		arg_51_0.theme = nil
	end
end

function var_0_0.ExitCalibrationView(arg_52_0)
	if arg_52_0.calibrationPage and arg_52_0.calibrationPage:GetLoaded() and arg_52_0.calibrationPage:isShowing() then
		triggerButton(arg_52_0.calibrationPage.backBtn)
	end
end

function var_0_0.ExitSilentView(arg_53_0)
	if arg_53_0.silentView and arg_53_0.silentView:isShowing() then
		arg_53_0:FoldPanels(false)
		arg_53_0.silentView:Destroy()
		arg_53_0.silentView:Reset()
	end
end

function var_0_0.GameLogout(arg_54_0)
	arg_54_0:ExitCalibrationView()
	arg_54_0:ExitSilentView()
end

function var_0_0.onBackPressed(arg_55_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_55_0.silentView and arg_55_0.silentView:isShowing() then
		arg_55_0:ExitSilentView()

		return
	end

	if arg_55_0.liveAreaPage and arg_55_0.liveAreaPage:GetLoaded() and arg_55_0.liveAreaPage:isShowing() then
		arg_55_0.liveAreaPage:Hide()

		return
	end

	if arg_55_0.calibrationPage and arg_55_0.calibrationPage:GetLoaded() and arg_55_0.calibrationPage:isShowing() then
		triggerButton(arg_55_0.calibrationPage._parentTf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
	pg.PushNotificationMgr.GetInstance():PushAll()
end

function var_0_0.willExit(arg_56_0)
	arg_56_0.bgView:Dispose()

	arg_56_0.bgView = nil

	arg_56_0:UnloadTheme()

	if arg_56_0.calibrationPage then
		arg_56_0.calibrationPage:Destroy()

		arg_56_0.calibrationPage = nil
	end

	if arg_56_0.silentView then
		arg_56_0.silentView:Destroy()

		arg_56_0.silentView = nil
	end

	arg_56_0.paintingView:Dispose()

	arg_56_0.paintingView = nil

	arg_56_0.liveAreaPage:Destroy()

	arg_56_0.liveAreaPage = nil

	arg_56_0.sequenceView:Dispose()

	arg_56_0.sequenceView = nil

	arg_56_0.awakeSequenceView:Dispose()

	arg_56_0.awakeSequenceView = nil

	arg_56_0.effectView:Dispose()

	arg_56_0.effectView = nil

	pg.redDotHelper:Dispose()

	pg.redDotHelper = nil

	arg_56_0.buffDescPage:Destroy()

	arg_56_0.buffDescPage = nil

	arg_56_0.silentChecker:Dispose()

	arg_56_0.silentChecker = nil

	arg_56_0.skinExperienceDisplayPage:Destroy()

	arg_56_0.skinExperienceDisplayPage = nil

	arg_56_0:RevertSleepTimeout()
end

return var_0_0
