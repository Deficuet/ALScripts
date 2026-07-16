local var_0_0 = class("AuctionGameMainScene", import("view.base.BaseUI"))

var_0_0.SHOW_FILTER_EVENT = "AuctionGameMainScene::SHOW_FILTER_EVENT"

function var_0_0.getUIName(arg_1_0)
	return "AuctionGameMainUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.leftPanelView = AuctionGameMainLeftView.New(arg_2_0.uiLeftPanel, arg_2_0)

	arg_2_0:InitRightView()
	setText(arg_2_0.uiCdText, "--")
	arg_2_0:RefreshRoundText(1)
	setText(arg_2_0.uiCollectionText, i18n("auction_main_handbook"))
	setText(arg_2_0.uiBoardText, i18n("auction_main_public_notice"))
	onButton(arg_2_0, arg_2_0.uiCollectionBtn, function()
		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameCollectionListLayer,
			mediator = AuctionGameCollectionListMediator
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiBoardBtn, function()
		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameMainNoticeBoardLayer,
			mediator = AuctionGameMainNoticeBoardMediator
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiHideBtn, function()
		arg_2_0:HideFilterEventPanel()
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_6_0)
	Screen.sleepTimeout = SleepTimeout.NeverSleep

	arg_6_0.leftPanelView:didEnter()
	arg_6_0.rightPanelView:didEnter()

	local var_6_0 = getProxy(AuctionGameProxy)

	if var_6_0:GetRound() < 1 then
		if table.keyof(var_6_0:GetLeaverList(), getProxy(PlayerProxy):getPlayerId()) then
			arg_6_0:OnKick()
		else
			arg_6_0:RefreshReadyPanel()
		end
	else
		arg_6_0:RefreshRound()
	end

	arg_6_0.eventList = {
		arg_6_0:bind(var_0_0.SHOW_FILTER_EVENT, handler(arg_6_0, arg_6_0.OnShowFilterEventPanel))
	}
end

function var_0_0.InitRightView(arg_7_0)
	arg_7_0.rightPanelView = AuctionGameMainRightView.New(arg_7_0.uiRightPanel, arg_7_0)
end

function var_0_0.OnStartBid(arg_8_0)
	pg.TipsMgr.GetInstance():ShowTips(i18n("auction_game_bid_phase"))
	arg_8_0.rightPanelView:StartBid()
	arg_8_0:AddTimer()
end

function var_0_0.OnBidDone(arg_9_0, arg_9_1)
	arg_9_0.rightPanelView:RefreshBidDone(arg_9_1)
end

function var_0_0.OnStartRoundOver(arg_10_0)
	arg_10_0:HideFilterEventPanel()
	arg_10_0:AddTimer()

	if getProxy(AuctionGameProxy):GetTimestamp() - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
		arg_10_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameMainRoundOverLayer,
			mediator = AuctionGameMainRoundOverMediator
		}))
	end
end

function var_0_0.OnKick(arg_11_0)
	local var_11_0 = getProxy(AuctionGameProxy)

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAuctionExit(var_11_0:GetAuctionID(), var_11_0:GetRound()))
	arg_11_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
		viewComponent = AuctionGameMainMsgLayer,
		mediator = AuctionGameMainMsgMediator,
		data = {
			content = i18n("auction_game_kick"),
			comformCallback = function()
				arg_11_0:closeView()
			end,
			cancelCallback = function()
				arg_11_0:closeView()
			end
		}
	}))
end

function var_0_0.OnNoBid(arg_14_0)
	local var_14_0 = getProxy(AuctionGameProxy)

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAuctionFinish(var_14_0:GetAuctionID(), var_14_0:GetRound(), 1))
	arg_14_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
		viewComponent = AuctionGameMainMsgLayer,
		mediator = AuctionGameMainMsgMediator,
		data = {
			content = i18n("auction_game_nobid_tip"),
			comformCallback = function()
				arg_14_0:emit(AuctionGameMainMediator.EXIT)
			end,
			cancelCallback = function()
				arg_14_0:emit(AuctionGameMainMediator.EXIT)
			end
		}
	}))
end

function var_0_0.RefreshReadyPanel(arg_17_0)
	arg_17_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
		viewComponent = AuctionGameMainReadyLayer,
		mediator = AuctionGameMainReadyMediator
	}))
end

function var_0_0.RefreshRound(arg_18_0)
	local var_18_0 = getProxy(AuctionGameProxy):GetRound()

	if var_18_0 == 1 then
		SetParent(arg_18_0.uiTopPanel, pg.UIMgr.GetInstance().OverlayMain)
	end

	arg_18_0:RefreshRoundText(var_18_0)
	arg_18_0.leftPanelView:RefreshRound()
	arg_18_0.rightPanelView:RefreshRound()
	arg_18_0:AddTimer()
end

function var_0_0.RefreshRoundText(arg_19_0, arg_19_1)
	local var_19_0 = pg.auction_round[arg_19_1]

	LoadSpriteAtlasAsync("ui/auctiongameui_atlas", string.format("main_round_%s", arg_19_1), function(arg_20_0)
		if not IsNil(arg_19_0.uiRoundImage) then
			arg_19_0.uiRoundImage.sprite = arg_20_0
		end
	end)
end

function var_0_0.AddTimer(arg_21_0)
	arg_21_0:StopTimer()

	arg_21_0.timer = Timer.New(function()
		local var_22_0 = getProxy(AuctionGameProxy):GetTimestamp() - pg.TimeMgr.GetInstance():GetServerTime()

		if var_22_0 < 0 then
			var_22_0 = 0

			if getProxy(AuctionGameProxy):GetAuctionState() == AuctionGameConst.AUCTION_PHASE.ROUND_OVER and AuctionGameTools.IsNoBid() then
				arg_21_0:StopTimer()
				arg_21_0:OnNoBid()
			end
		end

		if var_22_0 < 10 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(AuctionGameConst.SOUND_EFFECT.COUNTDOWN)
		end

		setText(arg_21_0.uiCdText, var_22_0 .. "<size=30>s</size>")
	end, 1, -1)

	arg_21_0.timer:Start()
	arg_21_0.timer.func()
end

function var_0_0.StopTimer(arg_23_0)
	if arg_23_0.timer then
		arg_23_0.timer:Stop()

		arg_23_0.timer = nil
	end
end

function var_0_0.OnShowFilterEventPanel(arg_24_0, arg_24_1, arg_24_2)
	setActive(arg_24_0.uiHideBtn, true)
	setParent(arg_24_2, arg_24_0.uiHideBtn, true)
	setParent(arg_24_0.uiHideBtn, pg.UIMgr.GetInstance().OverlayMain)
end

function var_0_0.HideFilterEventPanel(arg_25_0)
	setActive(arg_25_0.uiHideBtn, false)
end

function var_0_0.willExit(arg_26_0)
	setParent(arg_26_0.uiHideBtn, arg_26_0._tf)

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.eventList) do
		arg_26_0:disconnect(iter_26_1)
	end

	arg_26_0.eventList = nil

	local var_26_0 = getProxy(SettingsProxy):GetMainSceneScreenSleepTime()

	Screen.sleepTimeout = var_26_0

	arg_26_0:StopTimer()
	SetParent(arg_26_0.uiTopPanel, arg_26_0._tf)
	arg_26_0.leftPanelView:willExit()

	arg_26_0.leftPanelView = nil

	arg_26_0.rightPanelView:willExit()

	arg_26_0.rightPanelView = nil
end

function var_0_0.onBackPressed(arg_27_0)
	if getProxy(AuctionGameProxy):GetForfeit() then
		arg_27_0:emit(PlayRoomCommonMediator.PLAY_ROOM_MATCH_STOP)
		arg_27_0:emit(AuctionGameMainMediator.EXIT)
	end
end

return var_0_0
