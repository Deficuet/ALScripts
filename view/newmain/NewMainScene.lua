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
var_0_0.L2D_BOUND_CHANGE = "NewMainScene:L2D_BOUND_CHANGE"
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

function var_0_0.RevertAsmrShip(arg_7_0)
	getProxy(BayProxy):ClearChangeSkinAsmr()
end

function var_0_0.PlayBgm(arg_8_0, arg_8_1)
	local var_8_0
	local var_8_1

	if underscore.any({
		function()
			if arg_8_1:IsBgmSkin() and getProxy(SettingsProxy):IsBGMEnable() then
				var_8_0 = arg_8_1:GetSkinBgm()
			end

			return tobool(var_8_0)
		end,
		function()
			if getProxy(SettingsProxy):IsEnableMainMusicPlayer() and getProxy(AppreciateProxy):CanPlayMainMusicPlayer() then
				var_8_0 = "MainMusicPlayer"
				var_8_1 = {
					loopType = getProxy(AppreciateProxy):getMusicPlayerLoopType(),
					albumName = getProxy(AppreciateProxy):getMainPlayerAlbumName()
				}
			end

			return tobool(var_8_0)
		end,
		function()
			local var_11_0, var_11_1 = MainBGView.GetBgAndBgm()

			var_8_0 = var_11_1

			return tobool(var_8_0)
		end,
		function()
			var_8_0 = var_0_0.super.getBGM(arg_8_0)

			return tobool(var_8_0)
		end
	}, function(arg_13_0)
		return arg_13_0()
	end) then
		pg.BgmMgr.GetInstance():Push(arg_8_0.__cname, var_8_0, var_8_1)
	end
end

function var_0_0.ResUISettings(arg_14_0)
	return {
		showType = PlayerResUI.TYPE_ALL,
		anim = not arg_14_0.resAnimFlag
	}
end

function var_0_0.ShowOrHideResUI(arg_15_0, arg_15_1)
	if not arg_15_0.isInit then
		return
	end

	var_0_0.super.ShowOrHideResUI(arg_15_0, arg_15_1)
end

function var_0_0.init(arg_16_0)
	arg_16_0.mainCG = GetOrAddComponent(arg_16_0._tf, typeof(CanvasGroup))
	arg_16_0.bgView = MainBGView.New(arg_16_0._tf:Find("Sea/bg"))
	arg_16_0.paintingView = MainPaintingView.New(arg_16_0._tf:Find("paint"), arg_16_0._tf:Find("paintBg"), arg_16_0.event)
	arg_16_0.effectView = MainEffectView.New(arg_16_0._tf:Find("paint/effect"))
	arg_16_0.buffDescPage = MainBuffDescPage.New(arg_16_0._tf, arg_16_0.event)
	arg_16_0.calibrationPage = MainCalibrationPage.New(arg_16_0._tf, arg_16_0.event, arg_16_0.contextData)
	arg_16_0.silentView = MainSilentView.New(arg_16_0._tf, arg_16_0.event, arg_16_0.contextData)
	arg_16_0.silentChecker = MainSilentChecker.New(arg_16_0.event)
	arg_16_0.skinExperienceDisplayPage = SkinExperienceDiplayPage.New(arg_16_0._tf, arg_16_0.event)

	if USE_OLD_MAIN_LIVE_AREA_UI then
		arg_16_0.liveAreaPage = MainLiveAreaOldPage.New(arg_16_0._tf, arg_16_0.event)
	else
		arg_16_0.liveAreaPage = MainLiveAreaPage.New(arg_16_0._tf, arg_16_0.event)
	end

	pg.redDotHelper = MainReddotView.New()
	arg_16_0.sequenceView = MainSequenceView.New()
	arg_16_0.awakeSequenceView = MainAwakeSequenceView.New()
	arg_16_0.themes = {
		[NewMainScene.THEME_CLASSIC] = NewMainClassicTheme.New(arg_16_0._tf, arg_16_0.event, arg_16_0.contextData),
		[NewMainScene.THEME_MELLOW] = NewMainMellowTheme.New(arg_16_0._tf, arg_16_0.event, arg_16_0.contextData)
	}

	for iter_16_0, iter_16_1 in pairs(arg_16_0.themes) do
		iter_16_1:RegisterView(arg_16_0)
	end

	arg_16_0:RevertAsmrShip()
end

function var_0_0.didEnter(arg_17_0)
	arg_17_0:bind(NewMainScene.FOLD, function(arg_18_0, arg_18_1)
		arg_17_0:FoldPanels(arg_18_1)

		local var_18_0 = arg_17_0.paintingView.ship

		if not var_18_0 then
			return
		end

		arg_17_0.calibrationPage:ExecuteAction("ShowOrHide", arg_18_1, arg_17_0.bgView.ship, arg_17_0.theme:GetPaintingOffset(var_18_0), arg_17_0.theme:GetCalibrationBG())
	end)
	arg_17_0:bind(NewMainScene.HIDE, function(arg_19_0, arg_19_1)
		arg_17_0:HidePanel(arg_19_1)

		local var_19_0 = arg_17_0.paintingView.ship

		if not var_19_0 then
			return
		end

		arg_17_0.calibrationPage:ExecuteAction("ShowOrHide", arg_19_1, arg_17_0.bgView.ship, arg_17_0.theme:GetPaintingOffset(var_19_0), arg_17_0.theme:GetCalibrationBG())
	end)
	arg_17_0:bind(NewMainScene.ON_CHANGE_SKIN, function(arg_20_0)
		arg_17_0:SwitchToNextShip()
	end)
	arg_17_0:bind(NewMainScene.ENTER_SILENT_VIEW, function()
		arg_17_0:ExitCalibrationView()
		arg_17_0:FoldPanels(true)
		arg_17_0.silentView:ExecuteAction("Show")
	end)
	arg_17_0:bind(GAME.WILL_LOGOUT, function()
		arg_17_0:GameLogout()
	end)
	arg_17_0:bind(NewMainScene.EXIT_SILENT_VIEW, function()
		arg_17_0:ExitSilentView()
		arg_17_0:SetUpSilentChecker()
		pg.redDotHelper:_Refresh()
	end)
	arg_17_0:bind(NewMainScene.ON_SKIN_FREEUSAGE_DESC, function(arg_24_0, arg_24_1)
		arg_17_0.skinExperienceDisplayPage:ExecuteAction("Show", arg_24_1)
	end)
	arg_17_0:bind(NewMainScene.OPEN_LIVEAREA, function(arg_25_0)
		arg_17_0.liveAreaPage:ExecuteAction("Show")
	end)
	arg_17_0:bind(NewMainScene.L2D_BOUND_CHANGE, function(arg_26_0)
		arg_17_0.paintingView:OnBoundChange()
	end)
	arg_17_0:SetUp(false, true)
end

function var_0_0.SetUp(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.mainCG.blocksRaycasts = false
	arg_27_0.isInit = false
	arg_27_0.resAnimFlag = false

	local var_27_0

	seriesAsync({
		function(arg_28_0)
			arg_27_0.awakeSequenceView:Execute(arg_28_0)
		end,
		function(arg_29_0)
			var_27_0 = arg_27_0:GetFlagShip()

			arg_27_0.bgView:Init(var_27_0)
			onNextTick(arg_29_0)
		end,
		function(arg_30_0)
			arg_27_0.theme = arg_27_0.themes[arg_27_0:GetThemeStyle()]

			arg_27_0.theme:ExecuteAction("Show", arg_30_0)
		end,
		function(arg_31_0)
			onNextTick(arg_31_0)
		end,
		function(arg_32_0)
			arg_27_0.isInit = true

			arg_27_0.theme:PlayEnterAnimation(var_27_0, arg_32_0)

			local var_32_0 = arg_27_0.theme:GetPaintingOffset(var_27_0)

			arg_27_0.paintingView:Init(var_27_0, var_32_0, arg_27_1)

			arg_27_0.resAnimFlag = true
		end,
		function(arg_33_0)
			arg_27_0:PlayBgm(var_27_0)
			arg_27_0.effectView:Init(var_27_0)
			arg_27_0.theme:init(var_27_0)
			onNextTick(arg_33_0)
		end,
		function(arg_34_0)
			arg_27_0:ShowOrHideResUI(arg_27_0.theme:ApplyDefaultResUI())
			arg_27_0.sequenceView:Execute(arg_34_0)
		end
	}, function()
		arg_27_0:SetUpSilentChecker()
		arg_27_0:emit(NewMainScene.ON_ENTER_DONE)

		arg_27_0.mainCG.blocksRaycasts = true

		if arg_27_2 then
			gcAll()
		end
	end)
end

function var_0_0.SetUpSilentChecker(arg_36_0)
	local var_36_0 = getProxy(SettingsProxy):GetMainSceneScreenSleepTime()

	arg_36_0.defaultSleepTimeout = Screen.sleepTimeout
	Screen.sleepTimeout = var_36_0

	if SettingsMainScenePanel.IsEnableStandbyMode() then
		arg_36_0.silentChecker:SetUp()
	end
end

function var_0_0.RevertSleepTimeout(arg_37_0)
	if arg_37_0.defaultSleepTimeout and Screen.sleepTimeout ~= arg_37_0.defaultSleepTimeout then
		Screen.sleepTimeout = arg_37_0.defaultSleepTimeout
	end

	arg_37_0.defaultSleepTimeout = nil
end

function var_0_0.FoldPanels(arg_38_0, arg_38_1)
	if not arg_38_0.theme then
		return
	end

	arg_38_0.foldFlag = arg_38_1

	arg_38_0.theme:OnFoldPanels(arg_38_1)
	arg_38_0.paintingView:Fold(arg_38_1, 0.5)
	pg.playerResUI:Fold(arg_38_1, 0.5)
	arg_38_0:SetEffectPanelVisible(not arg_38_1)
end

function var_0_0.HidePanel(arg_39_0, arg_39_1)
	if not arg_39_0.theme then
		return
	end

	if arg_39_0.foldFlag == arg_39_1 then
		return
	end

	arg_39_0.foldFlag = arg_39_1

	arg_39_0.theme:OnFoldPanels(arg_39_1)

	if arg_39_0._asmrTurnning then
		if arg_39_0.foldFlag == true then
			pg.playerResUI:Fold(arg_39_1, 0.5)
		end
	else
		pg.playerResUI:Fold(arg_39_1, 0.5)
	end

	if not arg_39_1 and arg_39_0._asmrTurnning then
		arg_39_0:SetEffectPanelVisible(false)
	else
		arg_39_0:SetEffectPanelVisible(not arg_39_1)
	end
end

function var_0_0.AsmrTurning(arg_40_0, arg_40_1)
	arg_40_0._asmrTurnning = arg_40_1

	arg_40_0.paintingView:OnAsmrTurnning(arg_40_1)
	arg_40_0.theme:OnAsmrTurnning(arg_40_1)
	arg_40_0.silentChecker:SetSilentRun(not arg_40_1)

	if not arg_40_0._asmrTurnning then
		arg_40_0:SetUpSilentChecker()
		pg.BgmMgr.GetInstance():ContinuePlay()
	else
		pg.BgmMgr.GetInstance():StopPlay()
	end
end

function var_0_0.SwitchToNextShip(arg_41_0)
	if arg_41_0.paintingView:IsLoading() or arg_41_0.bgView:IsLoading() or not arg_41_0.theme then
		return
	end

	local var_41_0 = getProxy(PlayerProxy):getRawData():GetNextFlagShip()

	if arg_41_0.bgView.ship:getSkinId() ~= var_41_0:getSkinId() or arg_41_0.bgView.ship.id ~= var_41_0.id then
		arg_41_0.bgView:Refresh(var_41_0)
		arg_41_0:PlayBgm(var_41_0)
		arg_41_0.paintingView:Refresh(var_41_0, arg_41_0.theme:GetPaintingOffset(var_41_0))
		arg_41_0.effectView:Refresh(var_41_0)
		arg_41_0.theme:OnSwitchToNextShip(var_41_0)
	end
end

function var_0_0.UpdateFlagShip(arg_42_0, arg_42_1, arg_42_2)
	if arg_42_0.paintingView:IsLoading() or arg_42_0.bgView:IsLoading() or not arg_42_0.theme then
		return
	end

	local var_42_0 = arg_42_2.callback

	arg_42_0.bgView:Refresh(arg_42_1)
	arg_42_0:PlayBgm(arg_42_1)
	arg_42_0.paintingView:SetOnceLoadedCall(var_42_0)
	arg_42_0.paintingView:Refresh(arg_42_1, arg_42_0.theme:GetPaintingOffset(arg_42_1))
	arg_42_0.effectView:Refresh(arg_42_1)
	arg_42_0.theme:OnSwitchToNextShip(arg_42_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_43_0, arg_43_1)
	arg_43_0.paintingView:PlayChangeSkinActionOut(arg_43_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_44_0, arg_44_1)
	arg_44_0.paintingView:PlayChangeSkinActionIn(arg_44_1)
end

function var_0_0.CheckAndReplayBgm(arg_45_0)
	local var_45_0 = arg_45_0:GetFlagShip()

	arg_45_0.theme:Refresh(var_45_0)
	arg_45_0:PlayBgm(var_45_0)
end

function var_0_0.SetEffectPanelVisible(arg_46_0, arg_46_1)
	if arg_46_0.theme then
		arg_46_0.theme:SetEffectPanelVisible(arg_46_1)
	end
end

function var_0_0.OnVisible(arg_47_0)
	arg_47_0:RevertAsmrShip()

	local var_47_0 = arg_47_0.themes[arg_47_0:GetThemeStyle()]

	if not (not arg_47_0.theme or var_47_0 ~= arg_47_0.theme) then
		arg_47_0:Refresh()
	else
		arg_47_0:UnloadTheme()
		arg_47_0:SetUp(true)
	end
end

function var_0_0.Refresh(arg_48_0)
	arg_48_0.mainCG.blocksRaycasts = false

	seriesAsync({
		function(arg_49_0)
			arg_48_0.awakeSequenceView:Execute(arg_49_0)
		end,
		function(arg_50_0)
			arg_48_0.isInit = true

			arg_48_0:ShowOrHideResUI(arg_48_0.theme:ApplyDefaultResUI())

			local var_50_0 = arg_48_0:GetFlagShip()

			arg_48_0.bgView:Refresh(var_50_0)
			arg_48_0.paintingView:Refresh(var_50_0, arg_48_0.theme:GetPaintingOffset(var_50_0))
			arg_48_0.effectView:Refresh(var_50_0)
			arg_48_0.theme:Refresh(var_50_0)
			arg_48_0:PlayBgm(var_50_0)
			pg.redDotHelper:Refresh()
			arg_50_0()
		end,
		function(arg_51_0)
			arg_48_0.sequenceView:Execute(arg_51_0)
		end
	}, function()
		arg_48_0:SetUpSilentChecker()
		arg_48_0:emit(NewMainScene.ON_ENTER_DONE)

		arg_48_0.mainCG.blocksRaycasts = true
	end)
end

function var_0_0.OnDisVisible(arg_53_0)
	arg_53_0:FoldPanels(false)
	arg_53_0.paintingView:Disable()
	arg_53_0.bgView:Disable()
	arg_53_0.sequenceView:Disable()
	arg_53_0.awakeSequenceView:Disable()

	if arg_53_0.theme then
		arg_53_0.theme:Disable()
	end

	pg.redDotHelper:Disable()
	arg_53_0.buffDescPage:Disable()
	arg_53_0.silentChecker:Disable()

	if arg_53_0.silentView and arg_53_0.silentView:isShowing() then
		arg_53_0:ExitSilentView()
	end

	arg_53_0.calibrationPage:Destroy()
	arg_53_0.calibrationPage:Reset()
	arg_53_0.skinExperienceDisplayPage:Destroy()
	arg_53_0.skinExperienceDisplayPage:Reset()
	arg_53_0.liveAreaPage:Destroy()
	arg_53_0.liveAreaPage:Reset()

	arg_53_0.isInit = false

	arg_53_0:RevertSleepTimeout()
	arg_53_0:RevertAsmrShip()
end

function var_0_0.UnloadTheme(arg_54_0)
	if arg_54_0.theme then
		arg_54_0.theme:Destroy()
		arg_54_0.theme:Reset()

		arg_54_0.theme = nil
	end
end

function var_0_0.ExitCalibrationView(arg_55_0)
	if arg_55_0.calibrationPage and arg_55_0.calibrationPage:GetLoaded() and arg_55_0.calibrationPage:isShowing() then
		triggerButton(arg_55_0.calibrationPage.backBtn)
	end
end

function var_0_0.ExitSilentView(arg_56_0)
	if arg_56_0.silentView and arg_56_0.silentView:isShowing() then
		arg_56_0:FoldPanels(false)
		arg_56_0.silentView:Destroy()
		arg_56_0.silentView:Reset()
	end
end

function var_0_0.GameLogout(arg_57_0)
	arg_57_0:ExitCalibrationView()
	arg_57_0:ExitSilentView()
end

function var_0_0.onBackPressed(arg_58_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_58_0.silentView and arg_58_0.silentView:isShowing() then
		arg_58_0:ExitSilentView()

		return
	end

	if arg_58_0.liveAreaPage and arg_58_0.liveAreaPage:GetLoaded() and arg_58_0.liveAreaPage:isShowing() then
		arg_58_0.liveAreaPage:Hide()

		return
	end

	if arg_58_0.calibrationPage and arg_58_0.calibrationPage:GetLoaded() and arg_58_0.calibrationPage:isShowing() then
		triggerButton(arg_58_0.calibrationPage._parentTf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
	pg.PushNotificationMgr.GetInstance():PushAll()
end

function var_0_0.willExit(arg_59_0)
	arg_59_0.bgView:Dispose()

	arg_59_0.bgView = nil

	arg_59_0:UnloadTheme()

	if arg_59_0.calibrationPage then
		arg_59_0.calibrationPage:Destroy()

		arg_59_0.calibrationPage = nil
	end

	if arg_59_0.silentView then
		arg_59_0.silentView:Destroy()

		arg_59_0.silentView = nil
	end

	arg_59_0.paintingView:Dispose()

	arg_59_0.paintingView = nil

	arg_59_0.liveAreaPage:Destroy()

	arg_59_0.liveAreaPage = nil

	arg_59_0.sequenceView:Dispose()

	arg_59_0.sequenceView = nil

	arg_59_0.awakeSequenceView:Dispose()

	arg_59_0.awakeSequenceView = nil

	arg_59_0.effectView:Dispose()

	arg_59_0.effectView = nil

	pg.redDotHelper:Dispose()

	pg.redDotHelper = nil

	arg_59_0.buffDescPage:Destroy()

	arg_59_0.buffDescPage = nil

	arg_59_0.silentChecker:Dispose()

	arg_59_0.silentChecker = nil

	arg_59_0.skinExperienceDisplayPage:Destroy()

	arg_59_0.skinExperienceDisplayPage = nil

	arg_59_0:RevertSleepTimeout()
end

return var_0_0
