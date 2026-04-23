local var_0_0 = class("PlayRoomInfoScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "IslandPlayRoomInfoUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:InitData()
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:OnClickCloseBtn()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiViewerBtn, function()
		arg_2_0:emit(PlayRoomInfoMediator.ON_CLICK_VIEWER)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiReadyBtn, function()
		arg_2_0:emit(PlayRoomInfoMediator.ON_CLICK_READY, {
			arg = 1
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiCancelReadyBtn, function()
		arg_2_0:emit(PlayRoomInfoMediator.ON_CLICK_READY, {
			arg = 0
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiStartBtn, function()
		if not PlayRoomTools.CanStartGame() then
			return
		end

		local var_7_0 = {}

		if not PlayRoomTools.IsPlayerFull() then
			table.insert(var_7_0, function(arg_8_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("island_bar_quick_addbot"),
					onYes = arg_8_0
				})
			end)
		end

		seriesAsync(var_7_0, function()
			arg_2_0:emit(PlayRoomInfoMediator.ON_CLICK_START_GAME)
		end)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiRoomSwitchBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("play_room_switch_tip"),
			onYes = function()
				arg_2_0:emit(PlayRoomInfoMediator.ON_SWITCH_ROOM_TYPE)
			end
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiSenderPanel, function()
		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = PlayRoomNotificationLayer,
			mediator = PlayRoomNotificationMediator,
			data = {
				inRoom = true
			}
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiAcceptBtn, function()
		arg_2_0:emit(PlayRoomInfoMediator.ON_MATCH_CLICK_READY, {
			arg = 1
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiCopyBtn, function()
		local var_14_0 = arg_2_0.playRoomProxy:GetRoomData().teamList

		UniPasteBoard.SetClipBoardString(var_14_0[1])
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_id_copy_ok"))
	end, SFX_PANEL)

	arg_2_0.playerItemList = {}

	local var_2_0 = getProxy(PlayRoomProxy):GetRoomData()

	if var_2_0 then
		for iter_2_0 = 1, PlayRoomTools.GetMaxTeamCnt(var_2_0.gameType) do
			arg_2_0.playerItemList[iter_2_0] = PlayRoomInfoPlayerItem.New(Object.Instantiate(arg_2_0.uiPlayerItem, arg_2_0.uiPlayerPanel), arg_2_0)
		end
	end

	setText(arg_2_0.uiReadyText, i18n("match_ui_room_ready1"))
	setText(arg_2_0.uiCancelReadyText, i18n("match_ui_room_ready2"))
	setText(arg_2_0.uiStartText, i18n("match_ui_room_startgame"))
	setText(arg_2_0.uiAcceptText, i18n("match_ui_accept"))
	setText(arg_2_0.uiMatchText, i18n("match_ui_matching"))
	setText(arg_2_0.uiLoadText, i18n("match_ui_matching_loading"))
end

function var_0_0.InitData(arg_15_0)
	arg_15_0.sceneRoomType = arg_15_0.contextData.sceneRoomType
end

function var_0_0.didEnter(arg_16_0)
	arg_16_0.playRoomProxy = getProxy(PlayRoomProxy)

	if arg_16_0.playRoomProxy:GetRoomData() == nil then
		arg_16_0.uiCloseBtn.onClick:Invoke()

		return
	end

	arg_16_0:InitUIDisplay()

	if arg_16_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.CustomRoom then
		arg_16_0:RefreshUI()
	elseif arg_16_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.MatchInfoRoom then
		arg_16_0:RefreshMatchInfoUI()
	else
		arg_16_0:RefreshLoadInfoUI()
	end

	arg_16_0:RefreshMessage()
end

function var_0_0.InitUIDisplay(arg_17_0)
	local var_17_0 = arg_17_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.CustomRoom

	setActive(arg_17_0.uiImage_2, var_17_0)
	setActive(arg_17_0.uiAcceptPanel, not var_17_0)
	setActive(arg_17_0.uiSenderPanel, var_17_0)
	setActive(arg_17_0.uiBtnList, var_17_0)
	setActive(arg_17_0.uiViewerBtn, false)
	setActive(arg_17_0.uiloadPanel, false)

	arg_17_0.isLoading = false

	if arg_17_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.CustomRoom then
		-- block empty
	elseif arg_17_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.MatchInfoRoom then
		setText(arg_17_0.uiTitleText, i18n("match_ui_point_match"))
	end
end

function var_0_0.willExit(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.playerItemList) do
		iter_18_1:willExit()
	end

	arg_18_0.playerItemList = nil

	arg_18_0:StopLeanTween()
	arg_18_0:StopLoadLeanTween()
end

function var_0_0.RefreshUI(arg_19_0)
	local var_19_0 = arg_19_0.playRoomProxy:GetRoomData()
	local var_19_1 = var_19_0.roomType
	local var_19_2 = var_19_0.playerDataList
	local var_19_3 = var_19_0.teamList
	local var_19_4 = PlayRoomTools.GetHostID()

	if var_19_1 == PlayRoomConst.PLAY_ROOM_TYPE.PERSON then
		setText(arg_19_0.uiTitleText, i18n("match_ui_room_filter6"))
	else
		setText(arg_19_0.uiTitleText, i18n("match_ui_room_filter5"))
	end

	setText(arg_19_0.uiIdText, var_19_4)
	setText(arg_19_0.uiViewerText, i18n("play_room_viewer_tip", #var_19_0.viewerList, PlayRoomTools.GetMaxViewerCnt(var_19_0.gameType)))

	local var_19_5 = getProxy(PlayerProxy):getPlayerId()
	local var_19_6 = var_19_4 == var_19_5

	setActive(arg_19_0.uiStartBtn, var_19_6)
	setActive(arg_19_0.uiRoomSwitchBtn, var_19_6)

	local var_19_7 = PlayRoomTools.IsViewer()

	setActive(arg_19_0.uiBtnList, not var_19_7)

	if not var_19_7 then
		local var_19_8 = table.contains(var_19_0.readyList, var_19_5)

		setActive(arg_19_0.uiReadyBtn, not var_19_8 and not var_19_6)
		setActive(arg_19_0.uiCancelReadyBtn, var_19_8 and not var_19_6)
	end

	arg_19_0:RefreshPlayerList()
	setGray(arg_19_0.uiStartBtn, not PlayRoomTools.CanStartGame(), true)
end

function var_0_0.RefreshPlayerList(arg_20_0)
	local var_20_0 = arg_20_0.playRoomProxy:GetRoomData()
	local var_20_1 = var_20_0.teamPosList
	local var_20_2 = getProxy(PlayerProxy):getPlayerId()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.playerItemList) do
		if var_20_1[iter_20_0] then
			local var_20_3 = var_20_1[iter_20_0][1]
			local var_20_4 = table.contains(var_20_0.readyList, var_20_2)

			iter_20_1:didEnter(var_20_0.playerDataList[var_20_3], PlayRoomTools.GetHostID(), arg_20_0.sceneRoomType, var_20_4)
		end
	end
end

function var_0_0.OnClickCloseBtn(arg_21_0)
	if arg_21_0.isLoading then
		return
	end

	if arg_21_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.MatchInfoRoom then
		arg_21_0:emit(PlayRoomInfoMediator.ON_MATCH_CLICK_READY, {
			arg = 0
		})
	end

	arg_21_0:emit(PlayRoomInfoMediator.ON_CLICK_CLOSE, {
		sceneRoomType = arg_21_0.sceneRoomType
	})
end

function var_0_0.closeView(arg_22_0)
	arg_22_0.contextData.onClose()
end

function var_0_0.RefreshMatchInfoUI(arg_23_0)
	arg_23_0:RefreshMatchInfoPlayerList()

	local var_23_0 = arg_23_0.playRoomProxy:GetMatchRoomData()

	if not var_23_0 then
		return
	end

	local var_23_1 = getProxy(PlayerProxy):getPlayerId()

	if table.contains(var_23_0.readyList, var_23_1) then
		arg_23_0:StopLeanTween()
		arg_23_0:ShowTimePanel(false)
	else
		arg_23_0:ShowTimePanel(true)
		arg_23_0:StartLeanTween(pg.TimeMgr.GetInstance():GetServerTime(), arg_23_0.playRoomProxy:GetMatchRoomData().endTimestamp)
	end

	setActive(arg_23_0.uiRoomSwitchBtn, false)
end

function var_0_0.RefreshMatchInfoPlayerList(arg_24_0)
	local var_24_0 = arg_24_0.playRoomProxy:GetMatchRoomData()

	if not var_24_0 then
		return
	end

	local var_24_1 = var_24_0.teamPosList
	local var_24_2 = getProxy(PlayerProxy):getPlayerId()

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.playerItemList) do
		local var_24_3 = var_24_1[iter_24_0][1]
		local var_24_4 = table.contains(var_24_0.readyList, var_24_2)

		iter_24_1:didEnter(var_24_0.playerDataList[var_24_3], nil, arg_24_0.sceneRoomType, var_24_4)
	end
end

function var_0_0.StartLeanTween(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0:StopLeanTween()

	if arg_25_2 <= arg_25_1 then
		return
	end

	LeanTween.value(arg_25_0._go, (arg_25_2 - arg_25_1) / pg.gameset.match_refuseCD.key_value, 0, arg_25_2 - arg_25_1):setOnUpdate(System.Action_float(function(arg_26_0)
		arg_25_0.uiSlider.value = arg_26_0

		local var_26_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_26_1 = arg_25_2 - var_26_0

		setText(arg_25_0.uiTimeText, string.format("%02d:%02d", math.floor(var_26_1 / 60), var_26_1 % 60))
	end)):setOnComplete(System.Action(function()
		arg_25_0:OnClickCloseBtn()
		arg_25_0:StopLeanTween()
	end))
end

function var_0_0.StopLeanTween(arg_28_0)
	LeanTween.cancel(arg_28_0._go)
end

function var_0_0.StartLoadLeanTween(arg_29_0, arg_29_1)
	arg_29_0:StopLoadLeanTween()
	LeanTween.value(arg_29_0._go, 0, 1, arg_29_1):setOnUpdate(System.Action_float(function(arg_30_0)
		arg_29_0.uiLoadSlider.value = arg_30_0

		for iter_30_0, iter_30_1 in ipairs(arg_29_0.playerItemList) do
			iter_30_1:RefreshSelfLoad(arg_30_0 * 100)
		end
	end)):setOnComplete(System.Action(function()
		arg_29_0:StopLoadLeanTween()
	end))
end

function var_0_0.StopLoadLeanTween(arg_32_0)
	LeanTween.cancel(arg_32_0._go)
end

function var_0_0.ShowTimePanel(arg_33_0, arg_33_1)
	setActive(arg_33_0.uiAcceptPanel, arg_33_1)
end

function var_0_0.RefreshLoadInfoUI(arg_34_0)
	local var_34_0 = arg_34_0.playRoomProxy:GetGameLoadData()

	if not var_34_0 then
		return
	end

	local var_34_1 = var_34_0.teamPosList
	local var_34_2 = getProxy(PlayerProxy):getPlayerId()
	local var_34_3 = table.contains(var_34_0.readyList, var_34_2)

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.playerItemList) do
		local var_34_4 = var_34_1[iter_34_0][1]

		iter_34_1:didEnter(var_34_0.playerDataList[var_34_4], nil, arg_34_0.sceneRoomType, var_34_3, var_34_0.loadList[var_34_4])
	end

	setActive(arg_34_0.uiSenderPanel, false)
	setActive(arg_34_0.uiBtnList, false)
	arg_34_0:StartLoadLeanTween(2)
end

function var_0_0.EnterLoadInfoUI(arg_35_0)
	arg_35_0.uiLoadSlider.value = 0

	setActive(arg_35_0.uiloadPanel, true)

	arg_35_0.isLoading = true

	arg_35_0:RefreshLoadInfoUI()
end

function var_0_0.RefreshMessage(arg_36_0)
	arg_36_0:GetMessages()

	local var_36_0 = arg_36_0.displays

	setActive(arg_36_0.uiChatItemGo, #var_36_0 > 0)

	if #var_36_0 <= 0 then
		return
	end

	local var_36_1 = var_36_0[#var_36_0]

	arg_36_0.uiChannelImage.sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(var_36_1.type) .. "_mel")

	local var_36_2 = arg_36_0.uiChatText:GetComponent("RichText")

	if var_36_1.type == ChatConst.ChannelPublic then
		var_36_2.supportRichText = true

		ChatProxy.InjectPublic(var_36_2, var_36_1, true)
	elseif var_36_1:IsWorldBossNotify() then
		var_36_2.supportRichText = true

		local var_36_3 = var_36_1.args.playerName
		local var_36_4 = var_36_1.args.bossName
		local var_36_5 = GetPerceptualSize(var_36_3 .. var_36_4) - 18

		if var_36_5 > 0 then
			local var_36_6 = GetPerceptualSize(var_36_4) - var_36_5

			var_36_4 = shortenString(var_36_4, var_36_6)
		end

		var_36_2.text = i18n("ad_4", var_36_1.args.supportType, var_36_3, var_36_4, var_36_1.args.level)
	else
		var_36_2.supportRichText = var_36_1.emojiId ~= nil
		var_36_2.text = arg_36_0:MatchEmoji(var_36_2, var_36_1)
	end
end

function var_0_0.MatchEmoji(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = false
	local var_37_1 = arg_37_2.player.name .. ": " .. arg_37_2.content
	local var_37_2 = false

	for iter_37_0 in string.gmatch(var_37_1, ChatConst.EmojiIconCodeMatch) do
		if table.contains(pg.emoji_small_template.all, tonumber(iter_37_0)) then
			var_37_2 = true

			local var_37_3 = pg.emoji_small_template[tonumber(iter_37_0)]
			local var_37_4 = LoadSprite("emoji/" .. var_37_3.pic .. "_small", nil)

			arg_37_1:AddSprite(iter_37_0, var_37_4)
		end
	end

	if not arg_37_2.emojiId then
		var_37_1 = var_37_2 and shortenString(var_37_1, 16) or shortenString(var_37_1, 20)
	end

	return (string.gsub(var_37_1, ChatConst.EmojiIconCodeMatch, function(arg_38_0)
		if table.contains(pg.emoji_small_template.all, tonumber(arg_38_0)) then
			return string.format("<icon name=%s w=0.7 h=0.7/>", arg_38_0)
		end
	end))
end

function var_0_0.GetMessages(arg_39_0)
	arg_39_0.displays = {}

	local var_39_0 = getProxy(ChatProxy)

	_.each(var_39_0:getRawData(), function(arg_40_0)
		arg_39_0:InsertMsg(arg_39_0.displays, arg_40_0)
	end)

	local var_39_1 = getProxy(GuildProxy)

	if var_39_1:getRawData() then
		_.each(var_39_1:getChatMsgs(), function(arg_41_0)
			arg_39_0:InsertMsg(arg_39_0.displays, arg_41_0)
		end)
	end

	local var_39_2 = getProxy(FriendProxy)

	_.each(var_39_2:getCacheMsgList(), function(arg_42_0)
		arg_39_0:InsertMsg(arg_39_0.displays, arg_42_0)
	end)
	_.each(getProxy(PlayRoomProxy):GetChatMsgs(), function(arg_43_0)
		arg_39_0:InsertMsg(arg_39_0.displays, arg_43_0)
	end)
	table.sort(arg_39_0.displays, function(arg_44_0, arg_44_1)
		return arg_44_0.timestamp < arg_44_1.timestamp
	end)
end

function var_0_0.InsertMsg(arg_45_0, arg_45_1, arg_45_2)
	if getProxy(FriendProxy):isInBlackList(arg_45_2.playerId) then
		return
	end

	if arg_45_2.player and arg_45_2.content then
		table.insert(arg_45_1, arg_45_2)
	end
end

function var_0_0.onBackPressed(arg_46_0)
	arg_46_0:OnClickCloseBtn()
end

return var_0_0
