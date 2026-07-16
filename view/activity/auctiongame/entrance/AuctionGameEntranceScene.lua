local var_0_0 = class("AuctionGameEntranceScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AuctionGameEntranceUI"
end

function var_0_0.init(arg_2_0)
	setText(arg_2_0.uiAuctionValueTitleText, i18n("auction_value"))
	setText(arg_2_0.uiAuctionTicketTitleText, i18n("auction_ticket"))
	setText(arg_2_0.uiAuctionMatchingText, i18n("auction_matching"))
	setText(arg_2_0.uiAuctionAssistantText, i18n("auction_assistant"))
	setText(arg_2_0.uiPreorderEndText, i18n("auction_activity_closed"))
	setText(arg_2_0.uiReliefText, i18n("auction_relief_tip"))

	arg_2_0.matchEventCom = GetComponent(arg_2_0.uiMatchBtn, typeof(DftAniEvent))

	arg_2_0.matchEventCom:SetEndEvent(function(arg_3_0)
		arg_2_0.startMatch = false

		arg_2_0:emit(PlayRoomCommonMediator.ON_CLICK_QUICK_MATCH, {
			type = pg.auction_session[arg_2_0.curSelectedID].game_type
		})
	end)
	onButton(arg_2_0, arg_2_0.uiBackBtn, function()
		arg_2_0:onBackPressed()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiHelpBtn, function()
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAuctionHelp())
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.auction_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiCollectionBtn, function()
		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameCollectionListLayer,
			mediator = AuctionGameCollectionListMediator
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiTaskBtn, function()
		if not arg_2_0.quickMatchSuccess and arg_2_0.startQuickMatch == true then
			arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
				viewComponent = AuctionGameMainMsgLayer,
				mediator = AuctionGameMainMsgMediator,
				data = {
					content = i18n("auction_main_match_exit"),
					comformCallback = function()
						arg_2_0:OnClickStopQuickMatch()
						arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
							viewComponent = AuctionGameTaskScene,
							mediator = AuctionGameTaskMediator,
							data = {}
						}))
					end,
					cancelCallback = function()
						return
					end
				}
			}))
		else
			arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
				viewComponent = AuctionGameTaskScene,
				mediator = AuctionGameTaskMediator,
				data = {}
			}))
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiPreorderBtn, function()
		if arg_2_0.startQuickMatch == true then
			return
		end

		getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME):SetPreorderTip()
		arg_2_0:RefreshPreorderTip()

		local var_10_0 = getProxy(AuctionGameBaseProxy)
		local var_10_1 = AuctionGameTools.GetPreorderCurrentyCnt()

		if var_10_1 > AuctionGameTools.GetCurrencyCnt() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auction_currency_noenough"))

			return
		end

		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameMainMsgLayer,
			mediator = AuctionGameMainMsgMediator,
			data = {
				content = i18n("auction_preorder_tips", var_10_1),
				comformCallback = function()
					arg_2_0:emit(AuctionGameEntranceMediator.CLICK_PREORDER_BOX)
				end,
				cancelCallback = function()
					return
				end
			}
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiOpenPreorderBtn, function()
		if arg_2_0.startQuickMatch == true then
			return
		end

		local var_13_0 = getProxy(AuctionGameBaseProxy)
		local var_13_1 = var_13_0:GetPreorderState()
		local var_13_2 = var_13_0:GetPreorderTimestamp()
		local var_13_3 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_13_1 == 1 and var_13_3 < var_13_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auction_preorder_tips_1"))

			return
		end

		arg_2_0:emit(AuctionGameEntranceMediator.CLICK_OPEN_BOX)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiMatchBtn, function()
		if arg_2_0.startMatch == true then
			return
		end

		if not pg.NewStoryMgr.GetInstance():IsPlayed("AUCTION_GUIDE_6") then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.AUCTION_GAME_MAIN_GUIDE)

			return
		end

		local var_14_0 = getProxy(AuctionGameBaseProxy)

		if var_14_0.serverForbidden == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auction_game_match_forbidden"))

			return
		end

		if var_14_0.isForbidden == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auction_game_match_forbidden"))

			return
		end

		if var_14_0.inactiveNum == 1 and var_14_0.isMatchWarning == 0 then
			arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
				viewComponent = AuctionGameMainMsgLayer,
				mediator = AuctionGameMainMsgMediator,
				data = {
					content = i18n("auction_game_match_warning"),
					comformCallback = function()
						return
					end,
					cancelCallback = function()
						return
					end
				}
			}))
			arg_2_0:emit(AuctionGameEntranceMediator.SHOW_WARNING_TIP)
		end

		if AuctionGameTools.GetCurrencyCnt() < pg.auction_session[arg_2_0.lastSelectedID].threshold then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auction_currency_noenough"))

			return
		end

		arg_2_0.curSelectedID = arg_2_0.lastSelectedID
		arg_2_0.startMatch = true

		quickPlayAnimation(arg_2_0.uiMatchBtn, "Anim_AuctionGameEntranceUI_matchBtn_click")
	end, AuctionGameConst.SOUND_EFFECT.START_MATCHING)
	onButton(arg_2_0, arg_2_0.uiCancelMatchBtn, function()
		arg_2_0:OnClickStopQuickMatch()
	end, AuctionGameConst.SOUND_EFFECT.CANCEL_MATCHING)
	onButton(arg_2_0, arg_2_0.uiReliefBtn, function()
		local var_18_0 = getProxy(AuctionGameBaseProxy)
		local var_18_1 = pg.gameset.auction_relief_payment_count.key_value

		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameMainMsgLayer,
			mediator = AuctionGameMainMsgMediator,
			data = {
				content = i18n("auction_relief_tip_2", var_18_1 - var_18_0.reliefCnt, var_18_1),
				comformCallback = function()
					arg_2_0:emit(AuctionGameEntranceMediator.CLICK_GET_RELIEF)
				end,
				cancelCallback = function()
					return
				end
			}
		}))
	end, SFX_PANEL)

	arg_2_0.paintingPanelView = AuctionGameEntrancePaintingPanel.New(arg_2_0.uiLeftPanel, arg_2_0)
	arg_2_0.locationItemList = {}

	for iter_2_0, iter_2_1 in ipairs(pg.auction_session.all) do
		if pg.auction_session[iter_2_1].game_type ~= 0 then
			table.insert(arg_2_0.locationItemList, AuctionGameEntranceLocationItem.New(arg_2_0[string.format("uiLocationTf%s", #arg_2_0.locationItemList + 1)], arg_2_0, iter_2_1))
		end
	end

	arg_2_0.playerPanelView = AuctionGamePlayerPanel.New(arg_2_0.uiPlayerInfo, arg_2_0)
end

function var_0_0.didEnter(arg_21_0)
	Screen.sleepTimeout = SleepTimeout.NeverSleep

	arg_21_0:OverlayPanel(arg_21_0.uiAdaptTf, {
		pbList = {
			arg_21_0.uiLocationInfoTf
		}
	})
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAuctionEnter())
	arg_21_0:OnClickStopQuickMatch()
	arg_21_0.paintingPanelView:didEnter()
	arg_21_0.playerPanelView:didEnter()

	arg_21_0.lastSelectedID = AuctionGameTools.GetLastLocationSelectedID()
	arg_21_0.eventList = {
		arg_21_0:bind(AuctionGameEntranceLocationItem.SELECTED_LOCATION, handler(arg_21_0, arg_21_0.OnSelectedLocation))
	}

	arg_21_0:RefreshUI()

	local var_21_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME)

	pg.SystemGuideMgr.GetInstance():PlayByGuideId("AUCTION_GUIDE_1", {
		var_21_0:GetTaskTip() and 1 or 0
	}, nil, true)

	if pg.NewStoryMgr.GetInstance():IsPlayed("AUCTION_GUIDE_6") then
		pg.SystemGuideMgr.GetInstance():PlayByGuideId("AUCTION_GUIDE_3")
	end

	arg_21_0:RefreshRelief()
end

function var_0_0.RefreshUI(arg_22_0)
	arg_22_0:RefreshLocationList()
	arg_22_0:RefreshPreorderBtn()
	arg_22_0:RefreshTaskTip()
	arg_22_0:RefreshPreorderTip()
	arg_22_0:RefreshOpenPreorderTip()
	arg_22_0:RefreshForbidden()
	arg_22_0:ShowWarning()
end

function var_0_0.OnUpdateCurrency(arg_23_0)
	arg_23_0:RefreshLocationList()
	arg_23_0:RefreshPreorderBtn()
	arg_23_0.playerPanelView:didEnter()
	arg_23_0:RefreshRelief()
	arg_23_0:RefreshPreorderTip()
end

function var_0_0.OnSelectedLocation(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_2 == arg_24_0.lastSelectedID then
		return
	end

	if arg_24_0.startQuickMatch == true then
		return
	end

	AuctionGameTools.SetLastLocationSelectedID(arg_24_2)

	arg_24_0.lastSelectedID = arg_24_2

	arg_24_0:RefreshLocationList()
end

function var_0_0.RefreshLocationList(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.locationItemList) do
		iter_25_1:didEnter(arg_25_0.lastSelectedID)
	end

	local var_25_0 = pg.auction_session[arg_25_0.lastSelectedID]

	setText(arg_25_0.uiAuctionValueText, var_25_0.auction_value)

	local var_25_1 = AuctionGameTools.GetCurrencyCnt() >= var_25_0.ticket

	setText(arg_25_0.uiAuctionTicketText, string.format("<color=%s>%s</color>", var_25_1 and "#393a3c" or "#bf5050", StringHelper.ForamtNumberK(var_25_0.ticket)))
end

function var_0_0.FormatMatchDuration(arg_26_0, arg_26_1)
	arg_26_1 = math.max(0, math.floor(arg_26_1 or 0))

	local var_26_0 = math.floor(arg_26_1 / 60)
	local var_26_1 = arg_26_1 % 60

	return string.format("%02d:%02d", var_26_0, var_26_1)
end

function var_0_0.OnQuickMatch(arg_27_0)
	getProxy(AuctionGameProxy):InitGameData(arg_27_0.curSelectedID)

	arg_27_0.startQuickMatch = true
	arg_27_0.startTime = pg.TimeMgr.GetInstance():GetServerTime()

	arg_27_0:AddMatchTimer()
	setActive(arg_27_0.uiMatchTimeGo, true)
	setActive(arg_27_0.uiCancelMatchBtn, true)
	setActive(arg_27_0.uiMatchBtn, false)
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAuctionMatching(0, 0, arg_27_0.curSelectedID))
end

function var_0_0.OnClickStopQuickMatch(arg_28_0)
	if arg_28_0.startQuickMatch == true then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAuctionMatching(1, pg.TimeMgr.GetInstance():GetServerTime() - arg_28_0.startTime, arg_28_0.curSelectedID))
	end

	arg_28_0:emit(PlayRoomCommonMediator.PLAY_ROOM_MATCH_STOP)
end

function var_0_0.OnQuickMatchSuccess(arg_29_0)
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildAuctionMatching(2, pg.TimeMgr.GetInstance():GetServerTime() - arg_29_0.startTime, arg_29_0.curSelectedID))

	arg_29_0.quickMatchSuccess = true

	local var_29_0 = getProxy(AuctionGameBaseProxy)

	var_29_0:AddGold(pg.auction_session[arg_29_0.curSelectedID].ticket * -1)
	var_29_0:SetNeedInitFlag(true)

	if getProxy(ContextProxy):getContextByMediator(AuctionGameMainMsgMediator) then
		LoadContextCommand.RemoveLayerByMediator(AuctionGameMainMsgMediator)
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.AUCTION_GAME_MAIN)
	arg_29_0:StopMatchTimer()
end

function var_0_0.OnStopMatch(arg_30_0)
	arg_30_0.startQuickMatch = false

	arg_30_0:StopMatchTimer()
	setActive(arg_30_0.uiMatchTimeGo, false)
	setActive(arg_30_0.uiCancelMatchBtn, false)
	setActive(arg_30_0.uiMatchBtn, true)
end

function var_0_0.IsQuickMatch(arg_31_0)
	return arg_31_0.startQuickMatch
end

function var_0_0.AddMatchTimer(arg_32_0)
	arg_32_0:StopMatchTimer()

	arg_32_0.matchTimer = Timer.New(function()
		local var_33_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_32_0.startTime

		setText(arg_32_0.uiMatchTimeText, arg_32_0:FormatMatchDuration(var_33_0))
	end, 1, -1)

	arg_32_0.matchTimer:Start()
	arg_32_0.matchTimer.func()
end

function var_0_0.StopMatchTimer(arg_34_0)
	if arg_34_0.matchTimer then
		arg_34_0.matchTimer:Stop()

		arg_34_0.matchTimer = nil
	end
end

function var_0_0.RefreshForbidden(arg_35_0)
	local var_35_0 = getProxy(AuctionGameBaseProxy).forbiddenTime

	if var_35_0 > pg.TimeMgr.GetInstance():GetServerTime() then
		setActive(arg_35_0.uiForbiddenGo, true)
		arg_35_0:AddForbiddenTimer(var_35_0)
	else
		setActive(arg_35_0.uiForbiddenGo, false)
	end
end

function var_0_0.AddForbiddenTimer(arg_36_0, arg_36_1)
	arg_36_0:StopForbiddenTimer()

	arg_36_0.forbiddenTimer = Timer.New(function()
		local var_37_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_37_0 < arg_36_1 then
			setText(arg_36_0.uiForbiddenText, i18n("auction_forbidden_tip", arg_36_0:FormatPreorderDuration(arg_36_1 - var_37_0)))
		else
			arg_36_0:StopForbiddenTimer()
			arg_36_0:RefreshForbidden()
		end
	end, 1, -1)

	arg_36_0.forbiddenTimer.func()
	arg_36_0.forbiddenTimer:Start()
end

function var_0_0.StopForbiddenTimer(arg_38_0)
	if arg_38_0.forbiddenTimer then
		arg_38_0.forbiddenTimer:Stop()

		arg_38_0.forbiddenTimer = nil
	end
end

function var_0_0.RefreshPreorderBtn(arg_39_0)
	local var_39_0 = getProxy(AuctionGameBaseProxy)
	local var_39_1 = var_39_0:GetPreorderState()
	local var_39_2 = var_39_0:GetPreorderTimestamp()
	local var_39_3 = pg.TimeMgr.GetInstance():GetServerTime()

	if var_39_1 == 1 then
		setActive(arg_39_0.uiPreorderEndGo, false)

		if var_39_3 < var_39_2 then
			setActive(arg_39_0.uiPreorderBtn, false)
			setActive(arg_39_0.uiPreorderTimeGo, true)
			setActive(arg_39_0.uiOpenPreorderBtn, true)
			arg_39_0:AddPreorderTimer()
		else
			setActive(arg_39_0.uiPreorderBtn, false)
			setActive(arg_39_0.uiPreorderTimeGo, false)
			setActive(arg_39_0.uiOpenPreorderBtn, true)
			arg_39_0:StopPreorderTimer()
		end
	else
		local var_39_4 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME).stopTime
		local var_39_5 = pg.TimeMgr.GetInstance():IsSameDay(var_39_3, var_39_4)

		setActive(arg_39_0.uiPreorderBtn, not var_39_5)
		setActive(arg_39_0.uiPreorderEndGo, var_39_5)
		setActive(arg_39_0.uiPreorderTimeGo, false)
		setActive(arg_39_0.uiOpenPreorderBtn, false)

		local var_39_6 = AuctionGameTools.GetPreorderCurrentyCnt()

		setText(arg_39_0.uiPreorderPriceText, string.format("<color=%s>%s</color>", var_39_6 > AuctionGameTools.GetCurrencyCnt() and "#bf5050" or "#ffffff", StringHelper.ForamtNumberK(var_39_6)))
	end
end

function var_0_0.AddPreorderTimer(arg_40_0)
	arg_40_0:StopPreorderTimer()

	local var_40_0 = getProxy(AuctionGameBaseProxy):GetPreorderTimestamp()

	arg_40_0.preorderTimer = Timer.New(function()
		local var_41_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_41_0 >= var_40_0 then
			arg_40_0:StopPreorderTimer()
			arg_40_0:RefreshPreorderBtn()
		else
			setText(arg_40_0.uiPreorderTimeText, arg_40_0:FormatPreorderDuration(var_40_0 - var_41_0))
		end
	end, 1, -1)

	arg_40_0.preorderTimer:Start()
	arg_40_0.preorderTimer.func()
end

function var_0_0.FormatPreorderDuration(arg_42_0, arg_42_1)
	arg_42_1 = math.max(0, math.floor(arg_42_1 or 0))

	local var_42_0 = math.floor(arg_42_1 / 3600)
	local var_42_1 = math.floor(arg_42_1 / 60) % 60
	local var_42_2 = arg_42_1 % 60

	return string.format("%02d:%02d:%02d", var_42_0, var_42_1, var_42_2)
end

function var_0_0.StopPreorderTimer(arg_43_0)
	if arg_43_0.preorderTimer then
		arg_43_0.preorderTimer:Stop()

		arg_43_0.preorderTimer = nil
	end
end

function var_0_0.RefreshTaskTip(arg_44_0)
	local var_44_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME)

	setActive(arg_44_0.uiTaskTipGo, var_44_0:GetTaskTip())
end

function var_0_0.RefreshPreorderTip(arg_45_0)
	local var_45_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME)

	setActive(arg_45_0.uiPreorderTipGo, var_45_0:GetPreorderTip())
end

function var_0_0.RefreshOpenPreorderTip(arg_46_0)
	local var_46_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME)

	setActive(arg_46_0.uiOpenPreorderTipGo, var_46_0:GetOpenPreorderTip())
end

function var_0_0.RefreshLocationTip(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.locationItemList) do
		iter_47_1:RefreshState()
	end
end

function var_0_0.RefreshRelief(arg_48_0)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		setActive(arg_48_0.uiReliefBtn, false)

		return
	end

	local var_48_0 = getProxy(AuctionGameBaseProxy)
	local var_48_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME):GetReliefTip()

	setActive(arg_48_0.uiReliefBtn, var_48_1)
end

function var_0_0.ShowWarning(arg_49_0)
	local var_49_0 = getProxy(AuctionGameBaseProxy)
	local var_49_1 = pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
	local var_49_2 = getProxy(PlayerProxy):getPlayerId()
	local var_49_3 = PlayerPrefs.GetInt(string.format("AUCTION_GAME_WARNING_%s_%s", var_49_2, var_49_1), 0)

	if var_49_0.inactiveNum ~= var_49_3 then
		arg_49_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameMainMsgLayer,
			mediator = AuctionGameMainMsgMediator,
			data = {
				content = i18n("auction_game_punishment", var_49_0.inactiveNum),
				comformCallback = function()
					return
				end,
				cancelCallback = function()
					return
				end
			}
		}))
	end

	PlayerPrefs.SetInt(string.format("AUCTION_GAME_WARNING_%s_%s", var_49_2, var_49_1), var_49_0.inactiveNum)
end

function var_0_0.willExit(arg_52_0)
	local var_52_0 = getProxy(SettingsProxy):GetMainSceneScreenSleepTime()

	Screen.sleepTimeout = var_52_0

	arg_52_0:UnOverlayPanel(arg_52_0.uiAdaptTf, arg_52_0._tf)
	arg_52_0:StopMatchTimer()
	arg_52_0:StopPreorderTimer()
	arg_52_0:StopForbiddenTimer()
	arg_52_0.matchEventCom:SetEndEvent(nil)

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.eventList) do
		arg_52_0:disconnect(iter_52_1)
	end

	arg_52_0.eventList = nil

	arg_52_0.paintingPanelView:willExit()

	arg_52_0.paintingPanelView = nil

	for iter_52_2, iter_52_3 in ipairs(arg_52_0.locationItemList) do
		iter_52_3:willExit()
	end

	arg_52_0.locationItemList = nil

	arg_52_0.playerPanelView:willExit()

	arg_52_0.playerPanelView = nil
end

function var_0_0.onBackPressed(arg_53_0)
	if not arg_53_0.quickMatchSuccess and arg_53_0.startQuickMatch == true then
		arg_53_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = AuctionGameMainMsgLayer,
			mediator = AuctionGameMainMsgMediator,
			data = {
				content = i18n("auction_main_match_exit"),
				comformCallback = function()
					arg_53_0:OnClickStopQuickMatch()
					var_0_0.super.onBackPressed(arg_53_0)
				end,
				cancelCallback = function()
					return
				end
			}
		}))
	else
		var_0_0.super.onBackPressed(arg_53_0)
	end
end

return var_0_0
