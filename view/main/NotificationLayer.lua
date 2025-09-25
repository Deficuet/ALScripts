local var_0_0 = class("NotificationLayer", import("..base.BaseUI"))

var_0_0.InitCount = 10
var_0_0.MaxCount = 100
var_0_0.FORM_COMMON = 0
var_0_0.FORM_BATTLE = 1
var_0_0.FORM_MAIN = 2
var_0_0.ChannelBits = {
	send = ChatConst.ChannelWorld,
	recv = IndexConst.Flags2Bits({
		ChatConst.ChannelAll
	})
}

function var_0_0.getUIName(arg_1_0)
	if getProxy(SettingsProxy):IsMellowStyle() then
		return "NotificationUI4Mellow"
	else
		return "NotificationUI"
	end
end

function var_0_0.setPlayer(arg_2_0, arg_2_1)
	arg_2_0.player = arg_2_1
end

function var_0_0.setInGuild(arg_3_0, arg_3_1)
	arg_3_0.inGuild = arg_3_1
end

function var_0_0.setMessages(arg_4_0, arg_4_1)
	arg_4_0.messages = arg_4_1
end

function var_0_0.init(arg_5_0)
	arg_5_0.close = arg_5_0:findTF("close")
	arg_5_0.frame = arg_5_0:findTF("frame")
	arg_5_0.contain = arg_5_0.frame:Find("contain")

	local var_5_0 = arg_5_0.contain:Find("ListContainer/list")

	arg_5_0.content = var_5_0:Find("content")
	arg_5_0.emptySign = var_5_0:Find("EmptySign")

	setActive(arg_5_0.emptySign, false)

	arg_5_0.prefabSelf = var_5_0:Find("popo_self").gameObject
	arg_5_0.prefabOthers = var_5_0:Find("popo_other").gameObject
	arg_5_0.prefabPublic = var_5_0:Find("popo_public").gameObject
	arg_5_0.prefabWorldBoss = var_5_0:Find("popo_worldboss").gameObject
	arg_5_0.prefabWorldBossArchives = var_5_0:Find("popo_worldboss_archives").gameObject
	arg_5_0.input = arg_5_0.frame:Find("contain/ListContainer/inputbg/input"):GetComponent("InputField")

	setText(arg_5_0.frame:Find("contain/ListContainer/inputbg/input/Placeholder"), i18n("notice_input_desc"))

	arg_5_0.send = arg_5_0.frame:Find("send")
	arg_5_0.channelSend = arg_5_0.frame:Find("channel_send")
	arg_5_0.channelSendPop = arg_5_0.frame:Find("channel_pop")
	arg_5_0.scroll = var_5_0:GetComponent("ScrollRect")
	arg_5_0.topMsg = arg_5_0.contain:Find("topmsg")

	SetActive(arg_5_0.topMsg, false)

	arg_5_0.topPublic = arg_5_0:findTF("popo_public", arg_5_0.topMsg)
	arg_5_0.emoji = arg_5_0.frame:Find("contain/ListContainer/inputbg/emoji")
	arg_5_0.changeRoomPanel = arg_5_0:findTF("change_room_Panel")
	arg_5_0.roomSendBtns = arg_5_0:findTF("frame/bg/type_send", arg_5_0.changeRoomPanel)
	arg_5_0.roomRecvBtns = arg_5_0:findTF("frame/bg/type_recv", arg_5_0.changeRoomPanel)
	arg_5_0.enterRoomTip = arg_5_0.frame:Find("enter_room_tip")
	arg_5_0.enterRoomCG = arg_5_0.enterRoomTip:GetComponent(typeof(CanvasGroup))
	arg_5_0.roomBtn = arg_5_0.contain:Find("top/room")
	arg_5_0.typeBtns = arg_5_0.contain:Find("top/type")
	arg_5_0.inputTF = arg_5_0:findTF("frame/bg/InputField", arg_5_0.changeRoomPanel):GetComponent(typeof(InputField))
	arg_5_0.switchTpl = arg_5_0:findTF("switch_tpl", arg_5_0.changeRoomPanel)
	arg_5_0.switchNormalSprite = arg_5_0:findTF("switch_normal", arg_5_0.changeRoomPanel):GetComponent(typeof(Image)).sprite
	arg_5_0.switchSelectedSprite = arg_5_0:findTF("switch_selected", arg_5_0.changeRoomPanel):GetComponent(typeof(Image)).sprite

	setText(findTF(arg_5_0.changeRoomPanel, "frame/bg/label_send"), i18n("notice_label_send"))
	setText(findTF(arg_5_0.changeRoomPanel, "frame/bg/label_recv"), i18n("notice_label_recv"))
	setText(findTF(arg_5_0.changeRoomPanel, "frame/bg/label_room"), i18n("notice_label_room"))
	setText(findTF(arg_5_0.changeRoomPanel, "frame/bg/label_tip"), i18n("notice_label_tip"))
	setText(findTF(arg_5_0.changeRoomPanel, "frame/bg/InputField/Placeholder"), i18n("please_input_1_99"))
	setText(findTF(arg_5_0.changeRoomPanel, "frame/cancel/Image"), i18n("word_cancel"))
	setText(findTF(arg_5_0.changeRoomPanel, "frame/confirm/Image"), i18n("word_ok"))

	arg_5_0.resource = arg_5_0:findTF("resource")
	arg_5_0.typeTpl = arg_5_0:findTF("type_tpl", arg_5_0.resource)
	arg_5_0.normalSprite = arg_5_0:findTF("normal", arg_5_0.resource):GetComponent(typeof(Image)).sprite
	arg_5_0.selectedSprite = arg_5_0:findTF("selected", arg_5_0.resource):GetComponent(typeof(Image)).sprite
	arg_5_0.bottomChannelTpl = arg_5_0:findTF("channel_tpl", arg_5_0.resource)
	arg_5_0.bottomChannelNormalSprite = arg_5_0:findTF("channel_normal", arg_5_0.resource):GetComponent(typeof(Image)).sprite
	arg_5_0.bottomChannelSelectedSprite = arg_5_0:findTF("channel_selected", arg_5_0.resource):GetComponent(typeof(Image)).sprite

	local var_5_1 = {
		ChatConst.ChannelAll,
		ChatConst.ChannelWorld,
		ChatConst.ChannelPublic,
		ChatConst.ChannelFriend,
		ChatConst.ChannelGuild,
		ChatConst.ChannelWorldBoss
	}

	arg_5_0.textSprites = {}
	arg_5_0.textSelectedSprites = {}
	arg_5_0.bottomChannelTextSprites = {}
	arg_5_0.switchTextSprites = {}

	for iter_5_0, iter_5_1 in pairs(var_5_1) do
		local var_5_2 = ChatConst.GetChannelSprite(iter_5_0)

		arg_5_0.textSprites[iter_5_0] = arg_5_0:findTF("text_" .. var_5_2, arg_5_0.resource):GetComponent(typeof(Image)).sprite
		arg_5_0.textSelectedSprites[iter_5_0] = arg_5_0:findTF("text_" .. var_5_2 .. "_selected", arg_5_0.resource):GetComponent(typeof(Image)).sprite
		arg_5_0.switchTextSprites[iter_5_0] = arg_5_0:findTF("text_" .. var_5_2 .. "_switch", arg_5_0.changeRoomPanel):GetComponent(typeof(Image)).sprite

		if table.contains(ChatConst.SendChannels, iter_5_0) then
			arg_5_0.bottomChannelTextSprites[iter_5_0] = arg_5_0:findTF("channel_" .. var_5_2, arg_5_0.resource):GetComponent(typeof(Image)).sprite
		end
	end

	arg_5_0.prefabSelf:SetActive(false)
	arg_5_0.prefabOthers:SetActive(false)
	arg_5_0.prefabPublic:SetActive(false)

	arg_5_0.bubbleCards = {}
	arg_5_0.worldBossCards = {}
	arg_5_0.poolBubble = {
		self = {},
		public = {},
		others = {}
	}
	var_0_0.ChannelBits.recv = getProxy(SettingsProxy):GetChatFlag()
end

function var_0_0.adjustMsgListPanel(arg_6_0)
	arg_6_0.listContainerTF = arg_6_0.contain:Find("ListContainer")
	arg_6_0.listTF = arg_6_0.contain:Find("ListContainer/list")

	local var_6_0 = arg_6_0.listContainerTF.rect.size.y
	local var_6_1 = 69.01791

	GetComponent(arg_6_0.listTF, "LayoutElement").preferredHeight = var_6_0 - var_6_1
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:adjustMsgListPanel()

	arg_7_0.currentForm = arg_7_0.contextData.form
	arg_7_0.escFlag = false

	onButton(arg_7_0, arg_7_0.close, function()
		if arg_7_0.isExitPlay then
			return
		end

		arg_7_0.isExitPlay = true

		arg_7_0:PlayUIAnimation(arg_7_0._tf, "exit", function()
			if arg_7_0.currentForm == var_0_0.FORM_BATTLE then
				arg_7_0:emit(NotificationMediator.BATTLE_CHAT_CLOSE)
			end

			arg_7_0:closeView()
		end)
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.emoji, function()
		arg_7_0:displayEmojiPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.send, function()
		local var_11_0 = arg_7_0.input.text

		if var_11_0 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("main_notificationLayer_sendButton"))

			return
		end

		arg_7_0.input.text = ""

		arg_7_0:emit(NotificationMediator.ON_SEND_PUBLIC, var_0_0.ChannelBits.send, var_11_0)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.roomBtn, function()
		arg_7_0:showChangeRoomPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, findTF(arg_7_0.changeRoomPanel, "frame/cancel"), function()
		arg_7_0:closeChangeRoomPanel()
	end, SFX_CANCEL)
	onButton(arg_7_0, findTF(arg_7_0.changeRoomPanel, "frame/confirm"), function()
		arg_7_0:emit(NotificationMediator.CHANGE_ROOM, tonumber(arg_7_0.inputTF.text))
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.channelSend, function()
		setActive(arg_7_0.channelSendPop, not isActive(arg_7_0.channelSendPop))

		if isActive(arg_7_0.channelSendPop) then
			arg_7_0:updateChannelSendPop()
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf, function()
		if isActive(arg_7_0.channelSendPop) then
			setActive(arg_7_0.channelSendPop, false)
		end
	end)
	pg.DelegateInfo.Add(arg_7_0, arg_7_0.scroll.onValueChanged)
	arg_7_0.scroll.onValueChanged:AddListener(function(arg_17_0)
		if arg_7_0.index > 1 and arg_17_0.y >= 1 then
			local var_17_0 = arg_7_0.content.sizeDelta.y * arg_17_0.y
			local var_17_1 = arg_7_0.scroll.velocity
			local var_17_2 = math.max(1, arg_7_0.index - var_0_0.InitCount)

			for iter_17_0 = arg_7_0.index - 1, var_17_2, -1 do
				arg_7_0:append(arg_7_0.filteredMessages[iter_17_0], 0)
			end

			Canvas.ForceUpdateCanvases()

			arg_7_0.scroll.normalizedPosition = Vector2(0, var_17_0 / arg_7_0.content.sizeDelta.y)

			arg_7_0.scroll.onValueChanged:Invoke(arg_7_0.scroll.normalizedPosition)

			arg_7_0.scroll.velocity = var_17_1
			arg_7_0.index = var_17_2
		end
	end)
	arg_7_0:updateRoom()
	arg_7_0:updateChatChannel()
	arg_7_0:initFilter()
	arg_7_0:updateFilter()
	arg_7_0:updateAll()

	if arg_7_0.currentForm == var_0_0.FORM_BATTLE then
		arg_7_0._tf:SetParent(arg_7_0.contextData.chatViewParent, true)

		rtf(arg_7_0.frame.transform).offsetMax = Vector2(0, -120)
	else
		arg_7_0:BlurPanel()
	end

	LeanTween.delayedCall(go(arg_7_0._tf), 0.2, System.Action(function()
		scrollToBottom(arg_7_0.content.parent)
	end))

	rtf(arg_7_0._tf).offsetMax = Vector2(0, 0)
	rtf(arg_7_0._tf).offsetMin = Vector2(0, 0)
end

function var_0_0.BlurPanel(arg_19_0)
	var_0_0.super.BlurPanel(arg_19_0, arg_19_0._tf)
end

function var_0_0.UnblurPanel(arg_20_0)
	arg_20_0:UnOverlayPanel(arg_20_0._tf)
end

function var_0_0.onBackPressed(arg_21_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_21_0.changeRoomPanel) then
		arg_21_0:closeChangeRoomPanel()
	else
		triggerButton(arg_21_0.close)
	end
end

function var_0_0.initFilter(arg_22_0)
	local var_22_0 = ChatConst.RecvChannels

	arg_22_0.recvTypes = UIItemList.New(arg_22_0.typeBtns, arg_22_0.typeTpl)

	arg_22_0.recvTypes:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = var_22_0[arg_23_1 + 1]

			setImageSprite(arg_23_2:Find("text"), arg_22_0.textSprites[var_23_0], true)
			setImageSprite(arg_23_2:Find("text_selected"), arg_22_0.textSelectedSprites[var_23_0], true)
			onButton(arg_22_0, arg_23_2, function()
				local var_24_0 = _.filter(var_22_0, function(arg_25_0)
					return arg_25_0 ~= ChatConst.ChannelGuild or arg_22_0.inGuild
				end)
				local var_24_1 = IndexConst.ToggleBits(var_0_0.ChannelBits.recv, var_24_0, ChatConst.ChannelAll, var_23_0)

				if var_0_0.ChannelBits.recv == var_24_1 then
					return
				end

				var_0_0.ChannelBits.recv = var_24_1

				arg_22_0:updateFilter()
				arg_22_0:updateAll()
				getProxy(SettingsProxy):SetChatFlag(var_0_0.ChannelBits.recv)
			end, SFX_UI_TAG)
		end
	end)
	arg_22_0.recvTypes:align(#var_22_0)
end

function var_0_0.updateFilter(arg_26_0)
	local var_26_0 = ChatConst.RecvChannels

	arg_26_0.recvTypes:each(function(arg_27_0, arg_27_1)
		local var_27_0 = var_26_0[arg_27_0 + 1]

		if var_27_0 == ChatConst.ChannelGuild and not arg_26_0.inGuild then
			setButtonEnabled(arg_27_1, false)
		end

		if bit.band(var_0_0.ChannelBits.recv, bit.lshift(1, var_27_0)) > 0 then
			setImageSprite(arg_27_1, arg_26_0.selectedSprite)
			setActive(arg_27_1:Find("text_selected"), true)
		else
			setImageSprite(arg_27_1, arg_26_0.normalSprite)
			setActive(arg_27_1:Find("text_selected"), false)
		end
	end)

	local var_26_1 = var_0_0.ChannelBits.recv
	local var_26_2 = bit.lshift(1, ChatConst.ChannelAll)

	arg_26_0.filteredMessages = _.filter(arg_26_0.messages, function(arg_28_0)
		return var_26_1 == var_26_2 or bit.band(var_26_1, bit.lshift(1, arg_28_0.type)) > 0
	end)
	arg_26_0.filteredMessages = _.slice(arg_26_0.filteredMessages, #arg_26_0.filteredMessages - var_0_0.MaxCount + 1, var_0_0.MaxCount)
end

function var_0_0.updateChatChannel(arg_29_0)
	setImageSprite(arg_29_0.channelSend:Find("Text"), arg_29_0.bottomChannelTextSprites[var_0_0.ChannelBits.send], true)
end

function var_0_0.updateChannelSendPop(arg_30_0)
	local var_30_0 = ChatConst.SendChannels
	local var_30_1 = UIItemList.New(arg_30_0.channelSendPop:Find("type_send"), arg_30_0.bottomChannelTpl)

	local function var_30_2()
		var_30_1:each(function(arg_32_0, arg_32_1)
			local var_32_0 = var_30_0[arg_32_0 + 1]

			if var_32_0 == ChatConst.ChannelGuild and not arg_30_0.inGuild then
				setButtonEnabled(arg_32_1, false)
			end

			local var_32_1 = var_0_0.ChannelBits.send == var_32_0

			if var_32_1 then
				setImageSprite(arg_32_1:Find("bottom"), arg_30_0.bottomChannelSelectedSprite, true)
			else
				setImageSprite(arg_32_1:Find("bottom"), arg_30_0.bottomChannelNormalSprite, true)
			end

			setActive(arg_32_1:Find("selected"), var_32_1)
			setActive(arg_32_1:Find("text"), not var_32_1)
		end)
	end

	var_30_1:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventUpdate then
			local var_33_0 = var_30_0[arg_33_1 + 1]

			setImageSprite(arg_33_2:Find("text"), arg_30_0.bottomChannelTextSprites[var_33_0], true)
			setImageSprite(arg_33_2:Find("selected"), arg_30_0.bottomChannelTextSprites[var_33_0], true)
			onButton(arg_30_0, arg_33_2, function()
				setActive(arg_30_0.channelSendPop, false)

				var_0_0.ChannelBits.send = var_33_0

				var_30_2()
				arg_30_0:updateChatChannel()
			end, SFX_UI_TAG)
		end
	end)
	var_30_1:align(#var_30_0)
	var_30_2()
end

function var_0_0.updateRoom(arg_35_0)
	setText(arg_35_0.enterRoomTip:Find("text"), i18n("main_notificationLayer_enter_room", arg_35_0.player.chatRoomId == 0 and "" or arg_35_0.player.chatRoomId))
	setText(arg_35_0:findTF("Text", arg_35_0.roomBtn), arg_35_0.player.chatRoomId == 0 and i18n("common_not_enter_room") or arg_35_0.player.chatRoomId)
	arg_35_0:showEnterRommTip()
end

function var_0_0.showChangeRoomPanel(arg_36_0)
	arg_36_0:UnblurPanel()
	pg.UIMgr.GetInstance():BlurPanel(arg_36_0.changeRoomPanel)

	arg_36_0.inputTF.text = tostring(arg_36_0.player.chatRoomId)
	arg_36_0.tempRoomSendBits = var_0_0.ChannelBits.send

	local var_36_0 = ChatConst.SendChannels
	local var_36_1 = UIItemList.New(arg_36_0.roomSendBtns, arg_36_0.switchTpl)

	local function var_36_2()
		var_36_1:each(function(arg_38_0, arg_38_1)
			local var_38_0 = var_36_0[arg_38_0 + 1]

			if var_38_0 == ChatConst.ChannelGuild and not arg_36_0.inGuild then
				setButtonEnabled(arg_38_1, false)
			end

			if arg_36_0.tempRoomSendBits == var_38_0 then
				setImageSprite(arg_38_1, arg_36_0.switchSelectedSprite)
			else
				setImageSprite(arg_38_1, arg_36_0.switchNormalSprite)
			end
		end)
	end

	var_36_1:make(function(arg_39_0, arg_39_1, arg_39_2)
		if arg_39_0 == UIItemList.EventUpdate then
			local var_39_0 = var_36_0[arg_39_1 + 1]

			setImageSprite(arg_39_2:Find("text"), arg_36_0.switchTextSprites[var_39_0], true)
			onButton(arg_36_0, arg_39_2, function()
				arg_36_0.tempRoomSendBits = var_39_0

				var_36_2()
			end, SFX_UI_TAG)
		end
	end)
	var_36_1:align(#var_36_0)
	var_36_2()

	arg_36_0.tempRoomRecvBits = var_0_0.ChannelBits.recv

	local var_36_3 = ChatConst.RecvChannels
	local var_36_4 = UIItemList.New(arg_36_0.roomRecvBtns, arg_36_0.switchTpl)

	local function var_36_5()
		var_36_4:each(function(arg_42_0, arg_42_1)
			local var_42_0 = var_36_3[arg_42_0 + 1]

			if var_42_0 == ChatConst.ChannelGuild and not arg_36_0.inGuild then
				setButtonEnabled(arg_42_1, false)
			end

			if bit.band(arg_36_0.tempRoomRecvBits, bit.lshift(1, var_42_0)) > 0 then
				setImageSprite(arg_42_1, arg_36_0.switchSelectedSprite)
			else
				setImageSprite(arg_42_1, arg_36_0.switchNormalSprite)
			end
		end)
	end

	var_36_4:make(function(arg_43_0, arg_43_1, arg_43_2)
		if arg_43_0 == UIItemList.EventUpdate then
			local var_43_0 = var_36_3[arg_43_1 + 1]

			setImageSprite(arg_43_2:Find("text"), arg_36_0.switchTextSprites[var_43_0], true)
			onButton(arg_36_0, arg_43_2, function()
				local var_44_0 = _.filter(var_36_3, function(arg_45_0)
					return arg_45_0 ~= ChatConst.ChannelGuild or arg_36_0.inGuild
				end)

				arg_36_0.tempRoomRecvBits = IndexConst.ToggleBits(arg_36_0.tempRoomRecvBits, var_44_0, ChatConst.ChannelAll, var_43_0)

				var_36_5()
			end, SFX_UI_TAG)
		end
	end)
	var_36_4:align(#var_36_3)
	var_36_5()
	setActive(arg_36_0.changeRoomPanel, true)
end

function var_0_0.closeChangeRoomPanel(arg_46_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_46_0.changeRoomPanel, arg_46_0._tf)

	if arg_46_0.currentForm == var_0_0.FORM_BATTLE then
		arg_46_0._tf:SetParent(arg_46_0.contextData.chatViewParent, true)

		rtf(arg_46_0.frame.transform).offsetMax = Vector2(0, -120)
	else
		arg_46_0:BlurPanel()
	end

	setActive(arg_46_0.changeRoomPanel, false)
end

function var_0_0.removeAllBubble(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.bubbleCards or {}) do
		setActive(iter_47_1.tf, false)

		local var_47_0 = arg_47_0.poolBubble.others

		if iter_47_1.__cname == "ChatBubblePublic" then
			var_47_0 = arg_47_0.poolBubble.public
		elseif iter_47_1.__cname == "ChatBubble" and iter_47_1.data.player and iter_47_1.data.player.id == arg_47_0.player.id then
			var_47_0 = arg_47_0.poolBubble.self
		end

		iter_47_1:dispose()
		table.insert(var_47_0, iter_47_1)
	end

	arg_47_0.bubbleCards = {}

	for iter_47_2, iter_47_3 in pairs(arg_47_0.worldBossCards) do
		if not IsNil(iter_47_3.tf) then
			Destroy(iter_47_3.tf)
		end
	end

	arg_47_0.worldBossCards = {}
end

function var_0_0.updateAll(arg_48_0)
	arg_48_0:removeAllBubble()

	arg_48_0.index = math.max(1, #arg_48_0.filteredMessages - var_0_0.InitCount)

	for iter_48_0 = arg_48_0.index, #arg_48_0.filteredMessages do
		arg_48_0:append(arg_48_0.filteredMessages[iter_48_0], -1)
	end

	scrollToBottom(arg_48_0.content.parent)
	setActive(arg_48_0.emptySign, PLATFORM_CODE == PLATFORM_JP and #arg_48_0.filteredMessages <= 0)
end

function var_0_0.append(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	if #arg_49_0.filteredMessages >= var_0_0.MaxCount * 2 then
		arg_49_0:updateFilter()
		arg_49_0:updateAll()
	else
		arg_49_3 = arg_49_3 and arg_49_0.scroll.normalizedPosition.y < 0.1

		if arg_49_1.type == ChatConst.ChannelPublic then
			if arg_49_1.id == 0 then
				arg_49_0:appendTopPublic(arg_49_1)
			else
				arg_49_0:appendPublic(arg_49_1, arg_49_2)
			end
		elseif arg_49_1:IsWorldBossNotify() then
			arg_49_0:appendPublic(arg_49_1, arg_49_2)
		else
			arg_49_0:appendOthers(arg_49_1, arg_49_2)
		end

		if arg_49_3 then
			scrollToBottom(arg_49_0.content.parent)
		end
	end

	setActive(arg_49_0.emptySign, PLATFORM_CODE == PLATFORM_JP and #arg_49_0.filteredMessages <= 0)
end

function var_0_0.appendOthers(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_1.player
	local var_50_1 = arg_50_0.poolBubble.others
	local var_50_2 = arg_50_0.prefabOthers

	if var_50_0.id == arg_50_0.player.id then
		var_50_1 = arg_50_0.poolBubble.self
		var_50_2 = arg_50_0.prefabSelf
		arg_50_1.isSelf = true
		arg_50_1.player = setmetatable(Clone(arg_50_0.player), {
			__index = arg_50_1.player.__index
		})
	end

	local var_50_3

	if #var_50_1 > 0 then
		var_50_3 = var_50_1[1]

		setActive(var_50_3.tf, true)
		table.remove(var_50_1, 1)
	else
		local var_50_4 = cloneTplTo(var_50_2, arg_50_0.content)

		var_50_3 = ChatBubble.New(var_50_4)
	end

	var_50_3.tf:SetSiblingIndex(arg_50_2)
	table.insert(arg_50_0.bubbleCards, var_50_3)
	var_50_3:update(arg_50_1)
	removeOnButton(var_50_3.headTF)
	onButton(arg_50_0, var_50_3.headTF, function()
		local var_51_0 = arg_50_0:findTF("shipicon/icon", var_50_3.tf).position

		arg_50_0:emit(NotificationMediator.OPEN_INFO, var_50_0, var_51_0, arg_50_1.content)
	end, SFX_PANEL)
end

function var_0_0.appendPublic(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0

	if arg_52_1.id == 4 then
		local var_52_1 = WorldBossConst.__IsCurrBoss(arg_52_1.args.wordBossConfigId) and arg_52_0.prefabWorldBoss or arg_52_0.prefabWorldBossArchives
		local var_52_2 = cloneTplTo(var_52_1, arg_52_0.content)

		var_52_0 = ChatBubbleWorldBoss.New(var_52_2, arg_52_0.currentForm ~= var_0_0.FORM_BATTLE)

		table.insert(arg_52_0.worldBossCards, var_52_0)
	else
		local var_52_3 = arg_52_0.poolBubble.public

		if #var_52_3 > 0 then
			var_52_0 = var_52_3[1]

			setActive(var_52_0.tf, true)
			table.remove(var_52_3, 1)
		else
			local var_52_4 = cloneTplTo(arg_52_0.prefabPublic, arg_52_0.content)

			var_52_0 = ChatBubblePublic.New(var_52_4)
		end

		table.insert(arg_52_0.bubbleCards, var_52_0)
	end

	var_52_0.tf:SetSiblingIndex(arg_52_2)
	var_52_0:update(arg_52_1)
end

function var_0_0.appendTopPublic(arg_53_0, arg_53_1)
	local var_53_0 = 120 - (pg.TimeMgr.GetInstance():GetServerTime() - arg_53_1.timestamp)

	if var_53_0 <= 0 then
		return
	end

	SetActive(arg_53_0.topMsg, true)
	ChatProxy.InjectPublic(findTF(arg_53_0.topPublic, "text"):GetComponent("RichText"), arg_53_1)

	findTF(arg_53_0.topPublic, "channel"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(arg_53_1.type) .. "_1920")

	if arg_53_0._topTimer then
		arg_53_0._topTimer:Stop()

		arg_53_0._topTimer = nil
	end

	arg_53_0._topTimer = Timer.New(function()
		SetActive(arg_53_0.topMsg, false)

		arg_53_0._topTimer = nil
	end, var_53_0, 1)

	arg_53_0._topTimer:Start()
end

function var_0_0.showEnterRommTip(arg_55_0)
	if arg_55_0.player.chatRoomId == 0 then
		return
	end

	if not LeanTween.isTweening(go(arg_55_0.enterRoomTip)) then
		LeanTween.value(go(arg_55_0.enterRoomTip), 1, 0, 2):setOnUpdate(System.Action_float(function(arg_56_0)
			arg_55_0.enterRoomCG.alpha = arg_56_0
		end)):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(function()
			arg_55_0.enterRoomCG.alpha = 0

			LeanTween.cancel(go(arg_55_0.enterRoomTip))
		end)):setDelay(0.5)
	end
end

function var_0_0.getPos(arg_58_0, arg_58_1)
	return
end

function var_0_0.displayEmojiPanel(arg_59_0)
	local var_59_0 = arg_59_0.emoji.position

	arg_59_0:emit(NotificationMediator.OPEN_EMOJI, function(arg_60_0)
		arg_59_0:emit(NotificationMediator.ON_SEND_PUBLIC, var_0_0.ChannelBits.send, string.gsub(ChatConst.EmojiCode, "code", arg_60_0))
	end, Vector3(var_59_0.x, var_59_0.y, 0))
end

function var_0_0.willExit(arg_61_0)
	if arg_61_0.currentForm == var_0_0.FORM_BATTLE then
		if isActive(arg_61_0.changeRoomPanel) then
			arg_61_0:closeChangeRoomPanel()
		end
	else
		arg_61_0:UnblurPanel()
	end

	LeanTween.cancel(arg_61_0._go)
	LeanTween.cancel(go(arg_61_0.enterRoomTip))

	if arg_61_0._topTimer then
		arg_61_0._topTimer:Stop()

		arg_61_0._topTimer = nil
	end

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.bubbleCards or {}) do
		iter_61_1:dispose()
	end

	for iter_61_2, iter_61_3 in ipairs(arg_61_0.worldBossCards or {}) do
		iter_61_3:dispose()
	end

	arg_61_0.worldBossCards = nil

	for iter_61_4, iter_61_5 in pairs(arg_61_0.poolBubble) do
		for iter_61_6, iter_61_7 in ipairs(iter_61_5) do
			iter_61_7:dispose()
		end
	end

	arg_61_0:removeLateUpdateListener()
	getProxy(GuildProxy):ClearNewChatMsgCnt()
end

function var_0_0.insertEmojiToInputText(arg_62_0, arg_62_1)
	arg_62_0.input.text = arg_62_0.input.text .. string.gsub(ChatConst.EmojiIconCode, "code", arg_62_1)
end

function var_0_0.addLateUpdateListener(arg_63_0)
	return
end

function var_0_0.removeLateUpdateListener(arg_64_0)
	return
end

return var_0_0
