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

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/newmainui",
		"commonbg/bg_main_night",
		"commonbg/bg_main_twilight",
		"commonbg/bg_main_day",
		"ui/mainbgview",
		"ui/lihui_qiehuan01",
		"ui/lihui_qiehuan02",
		"spinematerials",
		"effect/jiehuntexiao",
		"ui/mainuibuffdescwindow",
		"ui/maincalibrationui",
		"clutter/mainui_calibration",
		"clutter/mainui_calibration_mellow",
		"ui/mainsilentviewui",
		"ui/mainui_atlas",
		"ui/exskinlistui",
		"ui/mainliveareaoldui",
		"ui/mainliveareaui",
		"ui/livingareacoverui",
		"ui/newmainclassictheme",
		"clutter/mainui_calibration",
		"ui/mainui_atlas",
		"ui/newmainmellowtheme",
		"clutter/mainui_calibration_mellow",
		"ui/respanel",
		"ui/goldexchangewindow"
	}
	local var_2_1 = (function()
		local var_3_0 = {}
		local var_3_1, var_3_2 = MainBGView.GetBgAndBgm()
		local var_3_3 = ResPathSupport.GetSoundResList(var_3_2)
		local var_3_4 = var_0_0.super.getBGM(arg_2_0)
		local var_3_5 = ResPathSupport.GetSoundResList(var_3_4)

		return (ResPathSupport.MergeLuaArr(var_3_0, var_3_3, var_3_5))
	end)()
	local var_2_2 = (function()
		local var_4_0 = {}
		local var_4_1, var_4_2 = MainBGView.GetBgAndBgm()
		local var_4_3 = ResPathSupport.ConstPath.BG.CommonBG
		local var_4_4 = {
			ResPathSupport.CombinePath(var_4_3, var_4_1)
		}

		return (ResPathSupport.MergeLuaArr(var_4_0, var_4_4))
	end)()
	local var_2_3 = (function()
		local var_5_0 = {}
		local var_5_1 = getProxy(LivingAreaCoverProxy)
		local var_5_2 = var_5_1:GetUnlockList()
		local var_5_3 = var_5_1:GetLockList()
		local var_5_4 = ResPathSupport.ConstPath.UI.LivingAreaCover

		_.each(var_5_2, function(arg_6_0)
			local var_6_0 = arg_6_0:GetIcon()

			table.insert(var_5_0, ResPathSupport.CombinePath(var_5_4, var_6_0))
		end)
		_.each(var_5_3, function(arg_7_0)
			local var_7_0 = arg_7_0:GetIcon()

			table.insert(var_5_0, ResPathSupport.CombinePath(var_5_4, var_7_0))
		end)

		return var_5_0
	end)()
	local var_2_4 = (function()
		local var_8_0 = {}
		local var_8_1 = getProxy(ActivityProxy):getBannerDisplays()

		_.each(var_8_1, function(arg_9_0)
			local var_9_0 = var_0_0.ConstPath.UI.ActivityBanner
			local var_9_1 = arg_9_0.pic

			table.insert(var_8_0, ResPathSupport.CombinePath(var_9_0, var_9_1))
		end)

		return var_8_0
	end)()
	local var_2_5 = (function()
		local var_10_0 = {}
		local var_10_1 = MainActivityBtnView.GetActivityBtnList()

		_.each(var_10_1, function(arg_11_0)
			local var_11_0 = arg_11_0.New()
			local var_11_1 = var_11_0:ResPath()
			local var_11_2 = var_11_0:GetLinkConfig()

			if var_11_2 then
				local var_11_3 = var_11_2.pic

				if var_11_3 and #var_11_3 > 0 then
					local var_11_4 = ResPathSupport.CombinePath(var_11_1, var_11_3)
					local var_11_5 = string.lower(var_11_4)

					table.insert(var_10_0, var_11_5)
				end

				local var_11_6 = var_11_2.text_pic

				if var_11_6 and #var_11_6 > 0 then
					local var_11_7 = ResPathSupport.CombinePath(var_11_1, var_11_6)
					local var_11_8 = string.lower(var_11_7)

					table.insert(var_10_0, var_11_8)
				end
			end

			local var_11_9 = ResPathSupport.ConstPath.UI.LinkButton
			local var_11_10 = var_11_0:GetTipImage()

			if var_11_10 and #var_11_10 > 0 then
				local var_11_11 = ResPathSupport.CombinePath(var_11_9, var_11_10)
				local var_11_12 = string.lower(var_11_11)

				table.insert(var_10_0, var_11_12)
			end
		end)

		local var_10_2 = MainActivityBtnView.GetSpecailBtns()

		_.each(var_10_2, function(arg_12_0)
			local var_12_0 = arg_12_0.New()
			local var_12_1 = ResPathSupport.ConstPath.UI.Base
			local var_12_2 = var_12_0:GetUIName()

			if var_12_2 and #var_12_2 > 0 then
				local var_12_3 = ResPathSupport.CombinePath(var_12_1, var_12_2)
				local var_12_4 = string.lower(var_12_3)

				table.insert(var_10_0, var_12_4)

				local var_12_5 = var_12_4 .. "4mellow"

				table.insert(var_10_0, var_12_5)
			end
		end)

		return var_10_0
	end)()
	local var_2_6 = (function()
		local var_13_0 = {}
		local var_13_1 = MainBuffView.CollectBuffs()

		_.each(var_13_1, function(arg_14_0)
			local var_14_0 = string.lower(arg_14_0:getConfig("icon"))

			table.insert(var_13_0, var_14_0)
		end)

		return var_13_0
	end)()
	local var_2_7 = (function()
		local var_15_0 = {}
		local var_15_1 = getProxy(PlayerProxy):getData()
		local var_15_2 = PlayerVitaeShipsPage.GetAllUnlockSlotCnt()

		for iter_15_0 = 1, var_15_2 do
			local var_15_3 = var_15_1:GetFlagShip()
			local var_15_4 = ResPathSupport.GetShipAllRes(var_15_3)

			table.insert(var_15_0, var_15_4)
		end

		return _.flatten(var_15_0)
	end)()

	return ResPathSupport.MergeLuaArr(var_2_0, var_2_1, var_2_2, var_2_3, var_2_4, var_2_5, var_2_6, var_2_7)
end

function var_0_0.needCache(arg_16_0)
	return true
end

function var_0_0.forceGC(arg_17_0)
	return true
end

function var_0_0.GetThemeStyle(arg_18_0)
	return getProxy(SettingsProxy):GetMainSceneThemeStyle()
end

function var_0_0.PlayBGM(arg_19_0)
	return
end

function var_0_0.GetFlagShip(arg_20_0)
	return (getProxy(PlayerProxy):getRawData():GetFlagShip())
end

function var_0_0.RevertAsmrShip(arg_21_0)
	getProxy(BayProxy):ClearChangeSkinAsmr()
end

function var_0_0.PlayBgm(arg_22_0, arg_22_1)
	local var_22_0
	local var_22_1

	if underscore.any({
		function()
			if arg_22_1:IsBgmSkin() and getProxy(SettingsProxy):IsBGMEnable() then
				var_22_0 = arg_22_1:GetSkinBgm()
			end

			return tobool(var_22_0)
		end,
		function()
			if getProxy(SettingsProxy):IsEnableMainMusicPlayer() and getProxy(AppreciateProxy):CanPlayMainMusicPlayer() then
				var_22_0 = "MainMusicPlayer"
				var_22_1 = {
					loopType = getProxy(AppreciateProxy):getMusicPlayerLoopType(),
					albumName = getProxy(AppreciateProxy):getMainPlayerAlbumName()
				}
			end

			return tobool(var_22_0)
		end,
		function()
			local var_25_0, var_25_1 = MainBGView.GetBgAndBgm()

			var_22_0 = var_25_1

			return tobool(var_22_0)
		end,
		function()
			var_22_0 = var_0_0.super.getBGM(arg_22_0)

			return tobool(var_22_0)
		end
	}, function(arg_27_0)
		return arg_27_0()
	end) then
		pg.BgmMgr.GetInstance():Push(arg_22_0.__cname, var_22_0, var_22_1)
	end
end

function var_0_0.ResUISettings(arg_28_0)
	return {
		showType = PlayerResUI.TYPE_ALL,
		anim = not arg_28_0.resAnimFlag
	}
end

function var_0_0.ShowOrHideResUI(arg_29_0, arg_29_1)
	if not arg_29_0.isInit then
		return
	end

	var_0_0.super.ShowOrHideResUI(arg_29_0, arg_29_1)
end

function var_0_0.init(arg_30_0)
	arg_30_0.mainCG = GetOrAddComponent(arg_30_0._tf, typeof(CanvasGroup))
	arg_30_0.bgView = MainBGView.New(arg_30_0._tf:Find("Sea/bg"))
	arg_30_0.paintingView = MainPaintingView.New(arg_30_0._tf:Find("paint"), arg_30_0._tf:Find("paintBg"), arg_30_0.event)
	arg_30_0.effectView = MainEffectView.New(arg_30_0._tf:Find("paint/effect"))
	arg_30_0.buffDescPage = MainBuffDescPage.New(arg_30_0._tf, arg_30_0.event)
	arg_30_0.calibrationPage = MainCalibrationPage.New(arg_30_0._tf, arg_30_0.event, arg_30_0.contextData)
	arg_30_0.silentView = MainSilentView.New(arg_30_0._tf, arg_30_0.event, arg_30_0.contextData)
	arg_30_0.silentChecker = MainSilentChecker.New(arg_30_0.event)
	arg_30_0.skinExperienceDisplayPage = SkinExperienceDiplayPage.New(arg_30_0._tf, arg_30_0.event)

	if USE_OLD_MAIN_LIVE_AREA_UI then
		arg_30_0.liveAreaPage = MainLiveAreaOldPage.New(arg_30_0._tf, arg_30_0.event)
	else
		arg_30_0.liveAreaPage = MainLiveAreaPage.New(arg_30_0._tf, arg_30_0.event)
	end

	arg_30_0.subMediator = MainReddotMediator.New()

	pg.m02:registerMediator(arg_30_0.subMediator)

	arg_30_0.sequenceView = MainSequenceView.New()
	arg_30_0.awakeSequenceView = MainAwakeSequenceView.New()
	arg_30_0.themes = {
		[NewMainScene.THEME_CLASSIC] = NewMainClassicTheme.New(arg_30_0._tf, arg_30_0.event, arg_30_0.contextData),
		[NewMainScene.THEME_MELLOW] = NewMainMellowTheme.New(arg_30_0._tf, arg_30_0.event, arg_30_0.contextData)
	}

	for iter_30_0, iter_30_1 in pairs(arg_30_0.themes) do
		iter_30_1:RegisterView(arg_30_0)
	end

	arg_30_0:RevertAsmrShip()
end

function var_0_0.didEnter(arg_31_0)
	arg_31_0:bind(NewMainScene.FOLD, function(arg_32_0, arg_32_1)
		arg_31_0:FoldPanels(arg_32_1)

		local var_32_0 = arg_31_0.paintingView.ship

		if not var_32_0 then
			return
		end

		arg_31_0.calibrationPage:ExecuteAction("ShowOrHide", arg_32_1, arg_31_0.bgView.ship, arg_31_0.theme:GetPaintingOffset(var_32_0), arg_31_0.theme:GetCalibrationBG())
	end)
	arg_31_0:bind(NewMainScene.HIDE, function(arg_33_0, arg_33_1)
		arg_31_0:HidePanel(arg_33_1)

		local var_33_0 = arg_31_0.paintingView.ship

		if not var_33_0 then
			return
		end

		arg_31_0.calibrationPage:ExecuteAction("ShowOrHide", arg_33_1, arg_31_0.bgView.ship, arg_31_0.theme:GetPaintingOffset(var_33_0), arg_31_0.theme:GetCalibrationBG())
	end)
	arg_31_0:bind(NewMainScene.ON_CHANGE_SKIN, function(arg_34_0)
		arg_31_0:SwitchToNextShip()
	end)
	arg_31_0:bind(NewMainScene.ENTER_SILENT_VIEW, function()
		arg_31_0:ExitCalibrationView()
		arg_31_0:FoldPanels(true)
		arg_31_0.silentView:ExecuteAction("Show")
	end)
	arg_31_0:bind(GAME.WILL_LOGOUT, function()
		arg_31_0:GameLogout()
	end)
	arg_31_0:bind(NewMainScene.EXIT_SILENT_VIEW, function()
		arg_31_0:ExitSilentView()
		arg_31_0:SetUpSilentChecker()
	end)
	arg_31_0:bind(NewMainScene.ON_SKIN_FREEUSAGE_DESC, function(arg_38_0, arg_38_1)
		arg_31_0.skinExperienceDisplayPage:ExecuteAction("Show", arg_38_1)
	end)
	arg_31_0:bind(NewMainScene.OPEN_LIVEAREA, function(arg_39_0)
		arg_31_0.liveAreaPage:ExecuteAction("Show")
	end)
	arg_31_0:bind(NewMainScene.L2D_BOUND_CHANGE, function(arg_40_0)
		arg_31_0.paintingView:OnBoundChange()
	end)
	arg_31_0:SetUp(false, true)
end

function var_0_0.SetUp(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0.mainCG.blocksRaycasts = false
	arg_41_0.isInit = false
	arg_41_0.resAnimFlag = false

	local var_41_0

	seriesAsync({
		function(arg_42_0)
			arg_41_0.awakeSequenceView:Execute(arg_42_0)
		end,
		function(arg_43_0)
			var_41_0 = arg_41_0:GetFlagShip()

			arg_41_0.bgView:Init(var_41_0)
			onNextTick(arg_43_0)
		end,
		function(arg_44_0)
			arg_41_0.theme = arg_41_0.themes[arg_41_0:GetThemeStyle()]

			arg_41_0.theme:ExecuteAction("Show", arg_44_0)
		end,
		function(arg_45_0)
			onNextTick(arg_45_0)
		end,
		function(arg_46_0)
			arg_41_0.isInit = true

			arg_41_0.theme:PlayEnterAnimation(var_41_0, arg_46_0)

			local var_46_0 = arg_41_0.theme:GetPaintingOffset(var_41_0)

			arg_41_0.paintingView:Init(var_41_0, var_46_0, arg_41_1)

			arg_41_0.resAnimFlag = true
		end,
		function(arg_47_0)
			arg_41_0:PlayBgm(var_41_0)
			arg_41_0.effectView:Init(var_41_0)
			arg_41_0.theme:init(var_41_0)
			onNextTick(arg_47_0)
		end,
		function(arg_48_0)
			arg_41_0:ShowOrHideResUI(arg_41_0.theme:ApplyDefaultResUI())
			arg_41_0.sequenceView:Execute(arg_48_0)
		end
	}, function()
		arg_41_0:SetUpSilentChecker()
		arg_41_0:emit(NewMainScene.ON_ENTER_DONE)

		arg_41_0.mainCG.blocksRaycasts = true

		if arg_41_2 then
			gcAll()
		end
	end)
end

function var_0_0.SetUpSilentChecker(arg_50_0)
	local var_50_0 = getProxy(SettingsProxy):GetMainSceneScreenSleepTime()

	arg_50_0.defaultSleepTimeout = Screen.sleepTimeout
	Screen.sleepTimeout = var_50_0

	if SettingsMainScenePanel.IsEnableStandbyMode() then
		arg_50_0.silentChecker:SetUp()
	end
end

function var_0_0.RevertSleepTimeout(arg_51_0)
	if arg_51_0.defaultSleepTimeout and Screen.sleepTimeout ~= arg_51_0.defaultSleepTimeout then
		Screen.sleepTimeout = arg_51_0.defaultSleepTimeout
	end

	arg_51_0.defaultSleepTimeout = nil
end

function var_0_0.FoldPanels(arg_52_0, arg_52_1)
	if not arg_52_0.theme then
		return
	end

	arg_52_0.foldFlag = arg_52_1

	arg_52_0.theme:OnFoldPanels(arg_52_1)
	arg_52_0.paintingView:Fold(arg_52_1, 0.5)
	pg.playerResUI:Fold(arg_52_1, 0.5)
	arg_52_0:SetEffectPanelVisible(not arg_52_1)
end

function var_0_0.HidePanel(arg_53_0, arg_53_1)
	if not arg_53_0.theme then
		return
	end

	if arg_53_0.foldFlag == arg_53_1 then
		return
	end

	arg_53_0.foldFlag = arg_53_1

	arg_53_0.theme:OnFoldPanels(arg_53_1)

	if arg_53_0._asmrTurnning then
		if arg_53_0.foldFlag == true then
			pg.playerResUI:Fold(arg_53_1, 0.5)
		end
	else
		pg.playerResUI:Fold(arg_53_1, 0.5)
	end

	if not arg_53_1 and arg_53_0._asmrTurnning then
		arg_53_0:SetEffectPanelVisible(false)
	else
		arg_53_0:SetEffectPanelVisible(not arg_53_1)
	end
end

function var_0_0.AsmrTurning(arg_54_0, arg_54_1)
	arg_54_0._asmrTurnning = arg_54_1

	arg_54_0.paintingView:OnAsmrTurnning(arg_54_1)
	arg_54_0.theme:OnAsmrTurnning(arg_54_1)
	arg_54_0.silentChecker:SetSilentRun(not arg_54_1)

	if not arg_54_0._asmrTurnning then
		arg_54_0:SetUpSilentChecker()
		pg.BgmMgr.GetInstance():ContinuePlay()
	else
		pg.BgmMgr.GetInstance():StopPlay()
	end
end

function var_0_0.SwitchToNextShip(arg_55_0)
	if arg_55_0.paintingView:IsLoading() or arg_55_0.bgView:IsLoading() or not arg_55_0.theme then
		return
	end

	local var_55_0 = getProxy(PlayerProxy):getRawData():GetNextFlagShip()

	if arg_55_0.bgView.ship:getSkinId() ~= var_55_0:getSkinId() or arg_55_0.bgView.ship.id ~= var_55_0.id then
		arg_55_0.bgView:Refresh(var_55_0)
		arg_55_0:PlayBgm(var_55_0)
		arg_55_0.paintingView:Refresh(var_55_0, arg_55_0.theme:GetPaintingOffset(var_55_0))
		arg_55_0.effectView:Refresh(var_55_0)
		arg_55_0.theme:OnSwitchToNextShip(var_55_0)
	end
end

function var_0_0.UpdateFlagShip(arg_56_0, arg_56_1, arg_56_2)
	if arg_56_0.paintingView:IsLoading() or arg_56_0.bgView:IsLoading() or not arg_56_0.theme then
		return
	end

	local var_56_0 = arg_56_2.callback

	arg_56_0.bgView:Refresh(arg_56_1)
	arg_56_0:PlayBgm(arg_56_1)
	arg_56_0.paintingView:SetOnceLoadedCall(var_56_0)
	arg_56_0.paintingView:Refresh(arg_56_1, arg_56_0.theme:GetPaintingOffset(arg_56_1))
	arg_56_0.effectView:Refresh(arg_56_1)
	arg_56_0.theme:OnSwitchToNextShip(arg_56_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_57_0, arg_57_1)
	arg_57_0.paintingView:PlayChangeSkinActionOut(arg_57_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_58_0, arg_58_1)
	arg_58_0.paintingView:PlayChangeSkinActionIn(arg_58_1)
end

function var_0_0.CheckAndReplayBgm(arg_59_0)
	local var_59_0 = arg_59_0:GetFlagShip()

	arg_59_0.theme:Refresh(var_59_0)
	arg_59_0:PlayBgm(var_59_0)
end

function var_0_0.SetEffectPanelVisible(arg_60_0, arg_60_1)
	if arg_60_0.theme then
		arg_60_0.theme:SetEffectPanelVisible(arg_60_1)
	end
end

function var_0_0.OnVisible(arg_61_0)
	arg_61_0:RevertAsmrShip()

	local var_61_0 = arg_61_0.themes[arg_61_0:GetThemeStyle()]

	if not (not arg_61_0.theme or var_61_0 ~= arg_61_0.theme) then
		arg_61_0:Refresh()
	else
		arg_61_0:UnloadTheme()
		arg_61_0:SetUp(true)
	end
end

function var_0_0.Refresh(arg_62_0)
	arg_62_0.mainCG.blocksRaycasts = false

	seriesAsync({
		function(arg_63_0)
			arg_62_0.awakeSequenceView:Execute(arg_63_0)
		end,
		function(arg_64_0)
			arg_62_0.isInit = true

			arg_62_0:ShowOrHideResUI(arg_62_0.theme:ApplyDefaultResUI())

			local var_64_0 = arg_62_0:GetFlagShip()

			arg_62_0.bgView:Refresh(var_64_0)
			arg_62_0.paintingView:Refresh(var_64_0, arg_62_0.theme:GetPaintingOffset(var_64_0))
			arg_62_0.effectView:Refresh(var_64_0)
			arg_62_0.theme:Refresh(var_64_0)
			arg_62_0:PlayBgm(var_64_0)
			arg_64_0()
		end,
		function(arg_65_0)
			arg_62_0.sequenceView:Execute(arg_65_0)
		end
	}, function()
		arg_62_0:SetUpSilentChecker()
		arg_62_0:emit(NewMainScene.ON_ENTER_DONE)

		arg_62_0.mainCG.blocksRaycasts = true
	end)
end

function var_0_0.OnDisVisible(arg_67_0)
	arg_67_0:FoldPanels(false)
	arg_67_0.paintingView:Disable()
	arg_67_0.bgView:Disable()
	arg_67_0.sequenceView:Disable()
	arg_67_0.awakeSequenceView:Disable()

	if arg_67_0.theme then
		arg_67_0.theme:Disable()
	end

	arg_67_0.buffDescPage:Disable()
	arg_67_0.silentChecker:Disable()

	if arg_67_0.silentView and arg_67_0.silentView:isShowing() then
		arg_67_0:ExitSilentView()
	end

	arg_67_0.calibrationPage:Destroy()
	arg_67_0.calibrationPage:Reset()
	arg_67_0.skinExperienceDisplayPage:Destroy()
	arg_67_0.skinExperienceDisplayPage:Reset()
	arg_67_0.liveAreaPage:Destroy()
	arg_67_0.liveAreaPage:Reset()

	arg_67_0.isInit = false

	arg_67_0:RevertSleepTimeout()
	arg_67_0:RevertAsmrShip()
end

function var_0_0.UnloadTheme(arg_68_0)
	if arg_68_0.theme then
		arg_68_0.theme:Destroy()
		arg_68_0.theme:Reset()

		arg_68_0.theme = nil
	end
end

function var_0_0.ExitCalibrationView(arg_69_0)
	if arg_69_0.calibrationPage and arg_69_0.calibrationPage:GetLoaded() and arg_69_0.calibrationPage:isShowing() then
		triggerButton(arg_69_0.calibrationPage.backBtn)
	end
end

function var_0_0.ExitSilentView(arg_70_0)
	if arg_70_0.silentView and arg_70_0.silentView:isShowing() then
		arg_70_0:FoldPanels(false)
		arg_70_0.silentView:Destroy()
		arg_70_0.silentView:Reset()
	end
end

function var_0_0.GameLogout(arg_71_0)
	arg_71_0:ExitCalibrationView()
	arg_71_0:ExitSilentView()
end

function var_0_0.onBackPressed(arg_72_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_72_0.silentView and arg_72_0.silentView:isShowing() then
		arg_72_0:ExitSilentView()

		return
	end

	if arg_72_0.liveAreaPage and arg_72_0.liveAreaPage:GetLoaded() and arg_72_0.liveAreaPage:isShowing() then
		arg_72_0.liveAreaPage:Hide()

		return
	end

	if arg_72_0.calibrationPage and arg_72_0.calibrationPage:GetLoaded() and arg_72_0.calibrationPage:isShowing() then
		triggerButton(arg_72_0.calibrationPage._parentTf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
	pg.PushNotificationMgr.GetInstance():PushAll()
end

function var_0_0.willExit(arg_73_0)
	arg_73_0.bgView:Dispose()

	arg_73_0.bgView = nil

	arg_73_0:UnloadTheme()

	if arg_73_0.calibrationPage then
		arg_73_0.calibrationPage:Destroy()

		arg_73_0.calibrationPage = nil
	end

	if arg_73_0.silentView then
		arg_73_0.silentView:Destroy()

		arg_73_0.silentView = nil
	end

	arg_73_0.paintingView:Dispose()

	arg_73_0.paintingView = nil

	arg_73_0.liveAreaPage:Destroy()

	arg_73_0.liveAreaPage = nil

	arg_73_0.sequenceView:Dispose()

	arg_73_0.sequenceView = nil

	arg_73_0.awakeSequenceView:Dispose()

	arg_73_0.awakeSequenceView = nil

	arg_73_0.effectView:Dispose()

	arg_73_0.effectView = nil

	pg.m02:removeMediator(arg_73_0.subMediator.__cname)

	arg_73_0.subMediator = nil

	arg_73_0.buffDescPage:Destroy()

	arg_73_0.buffDescPage = nil

	arg_73_0.silentChecker:Dispose()

	arg_73_0.silentChecker = nil

	arg_73_0.skinExperienceDisplayPage:Destroy()

	arg_73_0.skinExperienceDisplayPage = nil

	arg_73_0:RevertSleepTimeout()
end

return var_0_0
