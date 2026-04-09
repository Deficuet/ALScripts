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

function var_0_0.OnBackPressed(arg_21_0)
	arg_21_0:OnClickCloseBtn()
end

function var_0_0.OnClickCloseBtn(arg_22_0)
	if arg_22_0.isLoading then
		return
	end

	if arg_22_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.MatchInfoRoom then
		arg_22_0:emit(PlayRoomInfoMediator.ON_MATCH_CLICK_READY, {
			arg = 0
		})
	end

	arg_22_0:emit(PlayRoomInfoMediator.ON_CLICK_CLOSE, {
		sceneRoomType = arg_22_0.sceneRoomType
	})
end

function var_0_0.closeView(arg_23_0)
	arg_23_0.contextData.onClose()
end

function var_0_0.RefreshMatchInfoUI(arg_24_0)
	arg_24_0:RefreshMatchInfoPlayerList()

	local var_24_0 = arg_24_0.playRoomProxy:GetMatchRoomData()

	if not var_24_0 then
		return
	end

	local var_24_1 = getProxy(PlayerProxy):getPlayerId()

	if table.contains(var_24_0.readyList, var_24_1) then
		arg_24_0:StopLeanTween()
		arg_24_0:ShowTimePanel(false)
	else
		arg_24_0:ShowTimePanel(true)
		arg_24_0:StartLeanTween(pg.TimeMgr.GetInstance():GetServerTime(), arg_24_0.playRoomProxy:GetMatchRoomData().endTimestamp)
	end

	setActive(arg_24_0.uiRoomSwitchBtn, false)
end

function var_0_0.RefreshMatchInfoPlayerList(arg_25_0)
	local var_25_0 = arg_25_0.playRoomProxy:GetMatchRoomData()

	if not var_25_0 then
		return
	end

	local var_25_1 = var_25_0.teamPosList
	local var_25_2 = getProxy(PlayerProxy):getPlayerId()

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.playerItemList) do
		local var_25_3 = var_25_1[iter_25_0][1]
		local var_25_4 = table.contains(var_25_0.readyList, var_25_2)

		iter_25_1:didEnter(var_25_0.playerDataList[var_25_3], nil, arg_25_0.sceneRoomType, var_25_4)
	end
end

function var_0_0.StartLeanTween(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0:StopLeanTween()

	if arg_26_2 <= arg_26_1 then
		return
	end

	LeanTween.value(arg_26_0._go, (arg_26_2 - arg_26_1) / pg.gameset.match_refuseCD.key_value, 0, arg_26_2 - arg_26_1):setOnUpdate(System.Action_float(function(arg_27_0)
		arg_26_0.uiSlider.value = arg_27_0

		local var_27_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_27_1 = arg_26_2 - var_27_0

		setText(arg_26_0.uiTimeText, string.format("%02d:%02d", math.floor(var_27_1 / 60), var_27_1 % 60))
	end)):setOnComplete(System.Action(function()
		arg_26_0:OnBackPressed()
		arg_26_0:StopLeanTween()
	end))
end

function var_0_0.StopLeanTween(arg_29_0)
	LeanTween.cancel(arg_29_0._go)
end

function var_0_0.StartLoadLeanTween(arg_30_0, arg_30_1)
	arg_30_0:StopLoadLeanTween()
	LeanTween.value(arg_30_0._go, 0, 1, arg_30_1):setOnUpdate(System.Action_float(function(arg_31_0)
		arg_30_0.uiLoadSlider.value = arg_31_0

		for iter_31_0, iter_31_1 in ipairs(arg_30_0.playerItemList) do
			iter_31_1:RefreshSelfLoad(arg_31_0 * 100)
		end
	end)):setOnComplete(System.Action(function()
		arg_30_0:StopLoadLeanTween()
	end))
end

function var_0_0.StopLoadLeanTween(arg_33_0)
	LeanTween.cancel(arg_33_0._go)
end

function var_0_0.ShowTimePanel(arg_34_0, arg_34_1)
	setActive(arg_34_0.uiAcceptPanel, arg_34_1)
end

function var_0_0.RefreshLoadInfoUI(arg_35_0)
	local var_35_0 = arg_35_0.playRoomProxy:GetGameLoadData()

	if not var_35_0 then
		return
	end

	local var_35_1 = var_35_0.teamPosList
	local var_35_2 = getProxy(PlayerProxy):getPlayerId()
	local var_35_3 = table.contains(var_35_0.readyList, var_35_2)

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.playerItemList) do
		local var_35_4 = var_35_1[iter_35_0][1]

		iter_35_1:didEnter(var_35_0.playerDataList[var_35_4], nil, arg_35_0.sceneRoomType, var_35_3, var_35_0.loadList[var_35_4])
	end

	setActive(arg_35_0.uiSenderPanel, false)
	setActive(arg_35_0.uiBtnList, false)
	arg_35_0:StartLoadLeanTween(2)
end

function var_0_0.EnterLoadInfoUI(arg_36_0)
	arg_36_0.uiLoadSlider.value = 0

	setActive(arg_36_0.uiloadPanel, true)

	arg_36_0.isLoading = true

	arg_36_0:RefreshLoadInfoUI()
end

function var_0_0.RefreshMessage(arg_37_0)
	arg_37_0:GetMessages()

	local var_37_0 = arg_37_0.displays

	setActive(arg_37_0.uiChatItemGo, #var_37_0 > 0)

	if #var_37_0 <= 0 then
		return
	end

	local var_37_1 = var_37_0[#var_37_0]

	arg_37_0.uiChannelImage.sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(var_37_1.type) .. "_mel")

	local var_37_2 = arg_37_0.uiChatText:GetComponent("RichText")

	if var_37_1.type == ChatConst.ChannelPublic then
		var_37_2.supportRichText = true

		ChatProxy.InjectPublic(var_37_2, var_37_1, true)
	elseif var_37_1:IsWorldBossNotify() then
		var_37_2.supportRichText = true

		local var_37_3 = var_37_1.args.playerName
		local var_37_4 = var_37_1.args.bossName
		local var_37_5 = GetPerceptualSize(var_37_3 .. var_37_4) - 18

		if var_37_5 > 0 then
			local var_37_6 = GetPerceptualSize(var_37_4) - var_37_5

			var_37_4 = shortenString(var_37_4, var_37_6)
		end

		var_37_2.text = i18n("ad_4", var_37_1.args.supportType, var_37_3, var_37_4, var_37_1.args.level)
	else
		var_37_2.supportRichText = var_37_1.emojiId ~= nil
		var_37_2.text = arg_37_0:MatchEmoji(var_37_2, var_37_1)
	end
end

function var_0_0.MatchEmoji(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = false
	local var_38_1 = arg_38_2.player.name .. ": " .. arg_38_2.content
	local var_38_2 = false

	for iter_38_0 in string.gmatch(var_38_1, ChatConst.EmojiIconCodeMatch) do
		if table.contains(pg.emoji_small_template.all, tonumber(iter_38_0)) then
			var_38_2 = true

			local var_38_3 = pg.emoji_small_template[tonumber(iter_38_0)]
			local var_38_4 = LoadSprite("emoji/" .. var_38_3.pic .. "_small", nil)

			arg_38_1:AddSprite(iter_38_0, var_38_4)
		end
	end

	if not arg_38_2.emojiId then
		var_38_1 = var_38_2 and shortenString(var_38_1, 16) or shortenString(var_38_1, 20)
	end

	return (string.gsub(var_38_1, ChatConst.EmojiIconCodeMatch, function(arg_39_0)
		if table.contains(pg.emoji_small_template.all, tonumber(arg_39_0)) then
			return string.format("<icon name=%s w=0.7 h=0.7/>", arg_39_0)
		end
	end))
end

function var_0_0.GetMessages(arg_40_0)
	arg_40_0.displays = {}

	local var_40_0 = getProxy(ChatProxy)

	_.each(var_40_0:getRawData(), function(arg_41_0)
		arg_40_0:InsertMsg(arg_40_0.displays, arg_41_0)
	end)

	local var_40_1 = getProxy(GuildProxy)

	if var_40_1:getRawData() then
		_.each(var_40_1:getChatMsgs(), function(arg_42_0)
			arg_40_0:InsertMsg(arg_40_0.displays, arg_42_0)
		end)
	end

	local var_40_2 = getProxy(FriendProxy)

	_.each(var_40_2:getCacheMsgList(), function(arg_43_0)
		arg_40_0:InsertMsg(arg_40_0.displays, arg_43_0)
	end)
	_.each(getProxy(PlayRoomProxy):GetChatMsgs(), function(arg_44_0)
		arg_40_0:InsertMsg(arg_40_0.displays, arg_44_0)
	end)
	table.sort(arg_40_0.displays, function(arg_45_0, arg_45_1)
		return arg_45_0.timestamp < arg_45_1.timestamp
	end)
end

function var_0_0.InsertMsg(arg_46_0, arg_46_1, arg_46_2)
	if getProxy(FriendProxy):isInBlackList(arg_46_2.playerId) then
		return
	end

	if arg_46_2.player and arg_46_2.content then
		table.insert(arg_46_1, arg_46_2)
	end
end

return var_0_0
