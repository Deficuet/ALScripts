local var_0_0 = class("PlayRoomChatSettingsMsgboxLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "IslandPlayRoomChatSettingsMsgBox"
end

function var_0_0.init(arg_2_0)
	arg_2_0.titleTxt = arg_2_0.rtPage:Find("title"):GetComponent(typeof(Text))
	arg_2_0.contentTxt = arg_2_0.rtPage:Find("content/Text"):GetComponent("RichText")
	arg_2_0.closeBtn = arg_2_0.rtPage:Find("close")
	arg_2_0.cancelBtn = arg_2_0.rtPage:Find("cancel")
	arg_2_0.confirmBtn = arg_2_0.rtPage:Find("confirm")
	arg_2_0.cancelTxt = arg_2_0.rtPage:Find("cancel/Text"):GetComponent(typeof(Text))
	arg_2_0.confirmTxt = arg_2_0.rtPage:Find("confirm/Text"):GetComponent(typeof(Text))
	arg_2_0.uiSendChanncelList = UIItemList.New(arg_2_0.rtPage:Find("send_channel/list"), arg_2_0.rtPage:Find("send_channel/list/tpl"))
	arg_2_0.uiChanncelList = UIItemList.New(arg_2_0.rtPage:Find("channels/list"), arg_2_0.rtPage:Find("send_channel/list/tpl"))
	arg_2_0.roomInput = arg_2_0.rtPage:Find("room/room")

	setText(arg_2_0.rtPage:Find("send_channel/Text"), i18n("notice_label_send"))
	setText(arg_2_0.rtPage:Find("channels/Text"), i18n("notice_label_recv"))
	setText(arg_2_0.rtPage:Find("room/Text"), i18n("notice_label_room"))
	setText(arg_2_0.rtPage:Find("room/tip"), i18n("notice_label_tip"))
	arg_2_0:InitSendChannel()
	arg_2_0:InitChannels()
	arg_2_0:OverlayPanel(arg_2_0._tf)
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.rtBg, function()
		local var_4_0 = arg_3_0.onNo

		arg_3_0:closeView()
		existCall(var_4_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		local var_5_0 = arg_3_0.onNo

		arg_3_0:closeView()
		existCall(var_5_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:closeView()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		local var_7_0 = arg_3_0.onYes

		arg_3_0:closeView()
		existCall(var_7_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		local var_8_0 = arg_3_0.onYes

		existCall(var_8_0, arg_3_0.sendChannelValue, arg_3_0.channelValue, tonumber(getInputText(arg_3_0.roomInput)))
		arg_3_0:closeView()
	end, SFX_PANEL)

	local var_3_0 = arg_3_0.contextData.settings

	if var_3_0.rawIconDic then
		for iter_3_0, iter_3_1 in pairs(var_3_0.rawIconDic) do
			arg_3_0.contentTxt:AddSprite(iter_3_0, iter_3_1)
		end
	end

	arg_3_0.titleTxt.text = var_3_0.title or i18n("island_msg_info")
	arg_3_0.contentTxt.text = var_3_0.content or ""
	arg_3_0.onYes = var_3_0.onYes
	arg_3_0.onNo = var_3_0.onNo
	arg_3_0.onHide = var_3_0.onHide

	arg_3_0:FlushBtn(var_3_0)

	arg_3_0.sendChannelValue = var_3_0.sendChannelValue
	arg_3_0.channelValue = var_3_0.channelValue

	arg_3_0:FlushSendChannel()
	arg_3_0:FlushChannels()
	arg_3_0:FlushRoom()
end

function var_0_0.InitSendChannel(arg_9_0)
	local var_9_0 = PlayRoomChatConst.SEND_CHANNELS

	arg_9_0.uiSendChanncelList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_0[arg_10_1 + 1]

			onButton(arg_9_0, arg_10_2, function()
				if var_10_0 == PlayRoomChatConst.CHANNEL_GUILD and getProxy(GuildProxy):getRawData() == nil then
					return
				end

				arg_9_0.sendChannelValue = var_10_0

				arg_9_0:FlushSendChannel()
			end, SFX_PANEL)
			setActive(arg_10_2:Find("line"), #var_9_0 ~= arg_10_1 + 1)
		end
	end)
	arg_9_0.uiSendChanncelList:align(#var_9_0)
end

function var_0_0.InitChannels(arg_12_0)
	local var_12_0 = PlayRoomChatConst.CHANNELS

	arg_12_0.uiChanncelList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = var_12_0[arg_13_1 + 1]

			onButton(arg_12_0, arg_13_2, function()
				arg_12_0:UpdatteChannelValue(var_13_0)
				arg_12_0:FlushChannels()
			end, SFX_PANEL)

			local var_13_1 = arg_13_1 + 1
			local var_13_2 = var_13_1 % 3 == 0
			local var_13_3 = #var_12_0 == var_13_1

			setActive(arg_13_2:Find("line"), not var_13_3 and not var_13_2)
		end
	end)
	arg_12_0.uiChanncelList:align(#var_12_0)
end

function var_0_0.FlushSendChannel(arg_15_0)
	local var_15_0 = PlayRoomChatConst.SEND_CHANNELS

	arg_15_0.uiSendChanncelList:eachActive(function(arg_16_0, arg_16_1)
		local var_16_0 = var_15_0[arg_16_0 + 1]
		local var_16_1 = var_16_0 == arg_15_0.sendChannelValue

		setActive(arg_16_1:Find("mark"), var_16_1)

		local var_16_2 = PlayRoomChatConst.CHANNEL2CN(var_16_0)

		setText(arg_16_1:Find("Text"), setColorStr(var_16_2, var_16_1 and "#FFFFFF" or "#393a3c"))
	end)
end

function var_0_0.FlushChannels(arg_17_0)
	local var_17_0 = PlayRoomChatConst.CHANNELS

	arg_17_0.uiChanncelList:eachActive(function(arg_18_0, arg_18_1)
		local var_18_0 = var_17_0[arg_18_0 + 1]
		local var_18_1 = arg_17_0.channelValue == PlayRoomChatConst.CHANNEL_ALL
		local var_18_2 = var_18_0 == PlayRoomChatConst.CHANNEL_ALL
		local var_18_3 = var_18_2 and var_18_1 or not var_18_2 and not var_18_1 and bit.band(arg_17_0.channelValue, var_18_0) > 0

		setActive(arg_18_1:Find("mark"), var_18_3)

		local var_18_4 = PlayRoomChatConst.CHANNEL2CN(var_18_0)

		setText(arg_18_1:Find("Text"), setColorStr(var_18_4, var_18_3 and "#FFFFFF" or "#393a3c"))
	end)
end

function var_0_0.FlushRoom(arg_19_0)
	local var_19_0 = getProxy(PlayerProxy):getRawData().chatRoomId

	setInputText(arg_19_0.roomInput, var_19_0)
end

function var_0_0.FlushBtn(arg_20_0, arg_20_1)
	setActive(arg_20_0.cancelBtn, not arg_20_1.hideNo)

	local var_20_0 = arg_20_1.hideNo and 880 or 420

	arg_20_0.confirmBtn.sizeDelta = Vector2(var_20_0, arg_20_0.confirmBtn.sizeDelta.y)
	arg_20_0.cancelTxt.text = arg_20_1.noText and arg_20_1.noText or i18n("word_cancel")
	arg_20_0.confirmTxt.text = arg_20_1.yesText and arg_20_1.yesText or i18n("word_ok")
end

function var_0_0.UpdatteChannelValue(arg_21_0, arg_21_1)
	if arg_21_1 == PlayRoomChatConst.CHANNEL_ALL then
		arg_21_0.channelValue = PlayRoomChatConst.CHANNEL_ALL
	else
		if bit.band(arg_21_0.channelValue, arg_21_1) > 0 then
			if arg_21_0.channelValue == PlayRoomChatConst.CHANNEL_ALL then
				arg_21_0.channelValue = arg_21_1
			else
				arg_21_0.channelValue = bit.bxor(arg_21_0.channelValue, arg_21_1)
			end
		else
			arg_21_0.channelValue = bit.bor(arg_21_0.channelValue, arg_21_1)
		end

		if arg_21_0.channelValue <= 0 then
			arg_21_0.channelValue = PlayRoomChatConst.CHANNEL_ALL
		end
	end
end

function var_0_0.willExit(arg_22_0)
	arg_22_0:UnOverlayPanel(arg_22_0._tf)

	if arg_22_0.onHide then
		arg_22_0.onHide()

		arg_22_0.onHide = nil
	end
end

return var_0_0
