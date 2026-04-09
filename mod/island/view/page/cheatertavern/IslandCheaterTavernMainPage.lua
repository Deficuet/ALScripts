local var_0_0 = class("IslandCheaterTavernMainPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCheaterTavernMainUI"
end

function var_0_0.NeedCache(arg_2_0)
	return false
end

function var_0_0.CreateViews(arg_3_0)
	arg_3_0.views = {
		arg_3_0:CreateCheaterTavernStartGameView(),
		arg_3_0:CreateCheaterTavernInGamingView()
	}
end

function var_0_0.GetSubView(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.views) do
		if isa(iter_4_1, arg_4_1) then
			return iter_4_1
		end
	end

	return nil
end

function var_0_0.ExecuteAction(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:Load(arg_5_2)
	arg_5_0:ActionInvoke(arg_5_1, arg_5_2)

	arg_5_0.initShow = true
end

function var_0_0.CreateCheaterTavernStartGameView(arg_6_0)
	local var_6_0 = IslandCheaterTavernStartGameView.New(arg_6_0.uiStartGamePanel)

	var_6_0:attach(arg_6_0)

	return var_6_0
end

function var_0_0.CreateCheaterTavernInGamingView(arg_7_0)
	local var_7_0 = IslandCheaterTavernInGamingView.New(arg_7_0.uiInGamingPanel, arg_7_0)

	var_7_0:attach(arg_7_0)

	return var_7_0
end

function var_0_0.OnLoaded(arg_8_0)
	return
end

function var_0_0.Preload(arg_9_0, arg_9_1)
	arg_9_0.numDicCache = {}

	local var_9_0 = 0

	for iter_9_0 = 1, 10 do
		local var_9_1 = iter_9_0 % 10

		GetSpriteFromAtlasAsync("Island/IslandCheaterTavernIcon/" .. var_9_1, "", function(arg_10_0)
			arg_9_0.numDicCache[var_9_1] = arg_10_0
			var_9_0 = var_9_0 + 1

			if var_9_0 == 1 then
				arg_9_1()
			end
		end)
	end
end

function var_0_0.GetNumSpriteByIndex(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1 % 10

	return arg_11_0.numDicCache[var_11_0]
end

function var_0_0.AddListeners(arg_12_0)
	arg_12_0:AddListener(GAME.ISLAND_CHEATER_FIRSTROND_START, arg_12_0.OnCheaterEveryRoundStart)

	if not IslandCheaterTavernConst.putCardTest then
		arg_12_0:AddListener(GAME.ISLAND_PLAYER_CHEATER_OPERATE_DONE, arg_12_0.OnCheaterOperateDone)
		arg_12_0:AddListener(GAME.ISLAND_CHEATER_OPERATE_DONE_NOTIFY, arg_12_0.OnCheaterOperateDoneNotify)
		arg_12_0:AddListener(GAME.ISLAND_CHEATER_END_SCORE_NOTIFY, arg_12_0.OnCheaterEndScoreNotify)
		arg_12_0:AddListener(GAME.ISLAND_CHEATER_REAL_END_NOTIFY, arg_12_0.OnGameEndNotify)
		arg_12_0:AddListener(CheaterTavernEvent.FINSH_PAGE_QUIT, arg_12_0.OnCheaterFinishQuit)
		arg_12_0:AddListener(GAME.ISLAND_CHEATER_DELEGATE_NOTIFY, arg_12_0.OnCheaterDelegateNotify)
		arg_12_0:AddListener(GAME.ISLAND_CHEATER_RECONNECT, arg_12_0.OnCheaterReconected)
	end

	arg_12_0:AddListener(ChatProxy.NEW_MSG, arg_12_0.RefreshMessage)
	arg_12_0:AddListener(FriendProxy.FRIEND_NEW_MSG, arg_12_0.RefreshMessage)
	arg_12_0:AddListener(GuildProxy.NEW_MSG_ADDED, arg_12_0.RefreshMessage)
	arg_12_0:AddListener(PlayRoomProxy.CHAT_MSG_UPDATE, arg_12_0.RefreshMessage)
	arg_12_0:AddListener(GAME.CHANGE_CHAT_ROOM_DONE, arg_12_0.RefreshMessage)
end

function var_0_0.RemoveListeners(arg_13_0)
	arg_13_0:RemoveListener(GAME.ISLAND_CHEATER_FIRSTROND_START, arg_13_0.OnCheaterEveryRoundStart)

	if not IslandCheaterTavernConst.putCardTest then
		arg_13_0:RemoveListener(GAME.ISLAND_PLAYER_CHEATER_OPERATE_DONE, arg_13_0.OnCheaterOperateDone)
		arg_13_0:RemoveListener(GAME.ISLAND_CHEATER_OPERATE_DONE_NOTIFY, arg_13_0.OnCheaterOperateDoneNotify)
		arg_13_0:RemoveListener(GAME.ISLAND_CHEATER_END_SCORE_NOTIFY, arg_13_0.OnCheaterEndScoreNotify)
		arg_13_0:RemoveListener(GAME.ISLAND_CHEATER_REAL_END_NOTIFY, arg_13_0.OnGameEndNotify)
		arg_13_0:RemoveListener(CheaterTavernEvent.FINSH_PAGE_QUIT, arg_13_0.OnCheaterFinishQuit)
		arg_13_0:RemoveListener(GAME.ISLAND_CHEATER_DELEGATE_NOTIFY, arg_13_0.OnCheaterDelegateNotify)
		arg_13_0:RemoveListener(GAME.ISLAND_CHEATER_RECONNECT, arg_13_0.OnCheaterReconected)
	end

	arg_13_0:RemoveListener(ChatProxy.NEW_MSG, arg_13_0.RefreshMessage)
	arg_13_0:RemoveListener(FriendProxy.FRIEND_NEW_MSG, arg_13_0.RefreshMessage)
	arg_13_0:RemoveListener(GuildProxy.NEW_MSG_ADDED, arg_13_0.RefreshMessage)
	arg_13_0:RemoveListener(PlayRoomProxy.CHAT_MSG_UPDATE, arg_13_0.RefreshMessage)
	arg_13_0:RemoveListener(GAME.CHANGE_CHAT_ROOM_DONE, arg_13_0.RefreshMessage)
end

function var_0_0.OnCheaterFinishQuit(arg_14_0)
	arg_14_0:Hide()
	arg_14_0:emit(IslandMediator.PLAY_ROOM_MATCH_STOP)
	getProxy(PlayRoomProxy):SetPlayingGameState(false)
	IslandCheaterTavernRecordTools.RecordResult(IslandCheaterTavernRecordTools.LEAVE)
end

function var_0_0.OnCheaterEndScoreNotify(arg_15_0)
	arg_15_0:GetSubView(IslandCheaterTavernInGamingView):DestroyMainCard()

	arg_15_0.isFinish = true

	arg_15_0:emit(IslandMediator.OPEN_PAGE, "IslandCheaterTavernFinishPage", {
		IslandCheaterTavernConst.SettlementType.ByScore
	})
end

function var_0_0.OnGameEndNotify(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:GetIsland():GetCheaterTavernAgency()
	local var_16_1 = arg_16_1.win_user
	local var_16_2 = var_16_1 == getProxy(PlayerProxy):getRawData().id
	local var_16_3 = var_16_0:GetPlayerData(var_16_1)

	arg_16_0:emitCore(CheaterTavernEvent.PLAY_WIN_ANIMATION, var_16_1, var_16_2, var_16_3.seat)

	if var_16_2 then
		return
	end

	if arg_16_0:GetPage(IslandCheaterTavernFinishPage) then
		return
	end

	arg_16_0:emit(IslandMediator.OPEN_PAGE, "IslandCheaterTavernFinishPage", {
		IslandCheaterTavernConst.SettlementType.ByFinal
	})
end

function var_0_0.OnCheaterDelegateNotify(arg_17_0)
	arg_17_0:GetSubView(IslandCheaterTavernInGamingView):UpdateDelegateState()
end

function var_0_0.OnCheaterOperateDoneNotify(arg_18_0, arg_18_1)
	arg_18_0:GetSubView(IslandCheaterTavernInGamingView):OnCheaterOperateDoneNotify(arg_18_1)
end

function var_0_0.OnCheaterOperateDone(arg_19_0, arg_19_1)
	arg_19_0:GetSubView(IslandCheaterTavernInGamingView):OnCheaterOperateDone(arg_19_1)
end

function var_0_0.OnCheaterReconected(arg_20_0, arg_20_1)
	arg_20_0:GetSubView(IslandCheaterTavernInGamingView):OnCheaterReconected(arg_20_1.operation)
end

function var_0_0.OnCheaterEveryRoundStart(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.views) do
		iter_21_1:OnCheaterEveryRoundStart()
	end

	arg_21_0.animation:Play("Anim_IslandCheaterTavernMainUI_in")
	arg_21_0:RemoveEveryRondStartTimer()

	local var_21_0 = pg.gameset.bar_showcard_time.key_value

	arg_21_0.everyRondStartTimer = Timer.New(function()
		for iter_22_0, iter_22_1 in ipairs(arg_21_0.views) do
			iter_22_1:OnCheaterEveryRoundStartDone(arg_21_1.operation)
		end
	end, var_21_0, 1)

	arg_21_0.everyRondStartTimer:Start()
end

function var_0_0.RemoveEveryRondStartTimer(arg_23_0)
	if arg_23_0.everyRondStartTimer then
		arg_23_0.everyRondStartTimer:Stop()
	end
end

function var_0_0.OnInit(arg_24_0)
	onButton(arg_24_0, arg_24_0.uicloseBtn, function()
		local var_25_0 = {}
		local var_25_1 = getProxy(PlayRoomProxy):GetRoomData()

		if not arg_24_0.isFinish then
			if var_25_1.roomType == PlayRoomConst.PLAY_ROOM_TYPE.MATCH then
				table.insert(var_25_0, function(arg_26_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("bar_tips_game6"),
						onYes = arg_26_0
					})
				end)
			else
				table.insert(var_25_0, function(arg_27_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("bar_tips_game7"),
						onYes = arg_27_0
					})
				end)
			end
		end

		seriesAsync(var_25_0, function()
			arg_24_0:Hide()
			arg_24_0:emit(IslandMediator.PLAY_ROOM_MATCH_STOP)
			getProxy(PlayRoomProxy):SetPlayingGameState(false)
			IslandCheaterTavernRecordTools.RecordResult(IslandCheaterTavernRecordTools.LEAVE)
		end)
	end, SFX_PANEL)
	onButton(arg_24_0, arg_24_0.uiSenderPanel, function()
		arg_24_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = PlayRoomNotificationLayer,
			mediator = PlayRoomNotificationMediator,
			data = {
				inRoom = true
			}
		}))
	end, SFX_PANEL)
	onButton(arg_24_0, arg_24_0.uiHelpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_bar.tip
		})
	end, SFX_PANEL)

	arg_24_0.animation = arg_24_0.uiAdapt:GetComponent(typeof(Animation))
end

function var_0_0.OnShow(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.isFinish = false

	arg_31_0:CreateViews()

	for iter_31_0, iter_31_1 in ipairs(arg_31_0.views) do
		iter_31_1:Init()
	end

	arg_31_0:GetSubView(IslandCheaterTavernInGamingView):SetActiveState(false)
	arg_31_0:GetSubView(IslandCheaterTavernStartGameView):SetActiveState(false)
	arg_31_0:Flush()
	arg_31_0:RefreshMessage()
end

function var_0_0.Flush(arg_32_0)
	return
end

function var_0_0.OnDestroy(arg_33_0)
	var_0_0.super.OnDestroy(arg_33_0)
end

function var_0_0.OnHide(arg_34_0)
	arg_34_0:RemoveEveryRondStartTimer()

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.views) do
		iter_34_1:Hide()
	end
end

function var_0_0.RefreshMessage(arg_35_0)
	arg_35_0:GetMessages()

	local var_35_0 = arg_35_0.displays

	setActive(arg_35_0.uiChatItemGo, #var_35_0 > 0)

	if #var_35_0 <= 0 then
		return
	end

	local var_35_1 = var_35_0[#var_35_0]

	arg_35_0.uiChannelImage.sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(var_35_1.type) .. "_mel")

	local var_35_2 = arg_35_0.uiChatText:GetComponent("RichText")

	if var_35_1.type == ChatConst.ChannelPublic then
		var_35_2.supportRichText = true

		ChatProxy.InjectPublic(var_35_2, var_35_1, true)
	elseif var_35_1:IsWorldBossNotify() then
		var_35_2.supportRichText = true

		local var_35_3 = var_35_1.args.playerName
		local var_35_4 = var_35_1.args.bossName
		local var_35_5 = GetPerceptualSize(var_35_3 .. var_35_4) - 18

		if var_35_5 > 0 then
			local var_35_6 = GetPerceptualSize(var_35_4) - var_35_5

			var_35_4 = shortenString(var_35_4, var_35_6)
		end

		var_35_2.text = i18n("ad_4", var_35_1.args.supportType, var_35_3, var_35_4, var_35_1.args.level)
	else
		var_35_2.supportRichText = var_35_1.emojiId ~= nil
		var_35_2.text = arg_35_0:MatchEmoji(var_35_2, var_35_1)
	end
end

function var_0_0.MatchEmoji(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = false
	local var_36_1 = arg_36_2.player.name .. ": " .. arg_36_2.content
	local var_36_2 = false

	for iter_36_0 in string.gmatch(var_36_1, ChatConst.EmojiIconCodeMatch) do
		if table.contains(pg.emoji_small_template.all, tonumber(iter_36_0)) then
			var_36_2 = true

			local var_36_3 = pg.emoji_small_template[tonumber(iter_36_0)]
			local var_36_4 = LoadSprite("emoji/" .. var_36_3.pic .. "_small", nil)

			arg_36_1:AddSprite(iter_36_0, var_36_4)
		end
	end

	if not arg_36_2.emojiId then
		var_36_1 = var_36_2 and shortenString(var_36_1, 16) or shortenString(var_36_1, 20)
	end

	return (string.gsub(var_36_1, ChatConst.EmojiIconCodeMatch, function(arg_37_0)
		if table.contains(pg.emoji_small_template.all, tonumber(arg_37_0)) then
			return string.format("<icon name=%s w=0.7 h=0.7/>", arg_37_0)
		end
	end))
end

function var_0_0.GetMessages(arg_38_0)
	arg_38_0.displays = {}

	local var_38_0 = getProxy(ChatProxy)

	_.each(var_38_0:getRawData(), function(arg_39_0)
		arg_38_0:InsertMsg(arg_38_0.displays, arg_39_0)
	end)

	local var_38_1 = getProxy(GuildProxy)

	if var_38_1:getRawData() then
		_.each(var_38_1:getChatMsgs(), function(arg_40_0)
			arg_38_0:InsertMsg(arg_38_0.displays, arg_40_0)
		end)
	end

	local var_38_2 = getProxy(FriendProxy)

	_.each(var_38_2:getCacheMsgList(), function(arg_41_0)
		arg_38_0:InsertMsg(arg_38_0.displays, arg_41_0)
	end)
	_.each(getProxy(PlayRoomProxy):GetChatMsgs(), function(arg_42_0)
		arg_38_0:InsertMsg(arg_38_0.displays, arg_42_0)
	end)
	table.sort(arg_38_0.displays, function(arg_43_0, arg_43_1)
		return arg_43_0.timestamp < arg_43_1.timestamp
	end)
end

function var_0_0.InsertMsg(arg_44_0, arg_44_1, arg_44_2)
	if getProxy(FriendProxy):isInBlackList(arg_44_2.playerId) then
		return
	end

	if arg_44_2.player and arg_44_2.content then
		table.insert(arg_44_1, arg_44_2)
	end
end

return var_0_0
