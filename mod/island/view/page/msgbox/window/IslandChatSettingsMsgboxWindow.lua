local var_0_0 = class("IslandChatSettingsMsgboxWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandChatSettingsMsgBox"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.uiSendChanncelList = UIItemList.New(arg_2_0._tf:Find("send_channel/list"), arg_2_0._tf:Find("send_channel/list/tpl"))
	arg_2_0.uiChanncelList = UIItemList.New(arg_2_0._tf:Find("channels/list"), arg_2_0._tf:Find("send_channel/list/tpl"))
	arg_2_0.roomInput = arg_2_0._tf:Find("room/room")

	setText(arg_2_0._tf:Find("send_channel/Text"), i18n("notice_label_send"))
	setText(arg_2_0._tf:Find("channels/Text"), i18n("notice_label_recv"))
	setText(arg_2_0._tf:Find("room/Text"), i18n("notice_label_room"))
	setText(arg_2_0._tf:Find("room/tip"), i18n("notice_label_tip"))
	arg_2_0:InitSendChannel()
	arg_2_0:InitChannels()
end

function var_0_0.OnInit(arg_3_0)
	var_0_0.super.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		if arg_3_0.onYes then
			local var_4_0 = getInputText(arg_3_0.roomInput)

			arg_3_0.onYes(arg_3_0.sendChannelValue, arg_3_0.channelValue, tonumber(var_4_0))
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_5_0)
	var_0_0.super.OnShow(arg_5_0)

	local var_5_0 = arg_5_0.settings

	arg_5_0.sendChannelValue = var_5_0.sendChannelValue
	arg_5_0.channelValue = var_5_0.channelValue

	arg_5_0:FlushSendChannel()
	arg_5_0:FlushChannels()
	arg_5_0:FlushRoom()
end

function var_0_0.InitSendChannel(arg_6_0)
	local var_6_0 = IslandChatConst.SEND_CHANNELS

	arg_6_0.uiSendChanncelList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = var_6_0[arg_7_1 + 1]

			onButton(arg_6_0, arg_7_2, function()
				if var_7_0 == IslandChatConst.CHANNEL_GUILD and getProxy(GuildProxy):getRawData() == nil then
					return
				end

				arg_6_0.sendChannelValue = var_7_0

				arg_6_0:FlushSendChannel()
			end, SFX_PANEL)
			setActive(arg_7_2:Find("line"), #var_6_0 ~= arg_7_1 + 1)
		end
	end)
	arg_6_0.uiSendChanncelList:align(#var_6_0)
end

function var_0_0.InitChannels(arg_9_0)
	local var_9_0 = IslandChatConst.CHANNELS

	arg_9_0.uiChanncelList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_0[arg_10_1 + 1]

			onButton(arg_9_0, arg_10_2, function()
				arg_9_0:UpdatteChannelValue(var_10_0)
				arg_9_0:FlushChannels()
			end, SFX_PANEL)

			local var_10_1 = arg_10_1 + 1
			local var_10_2 = var_10_1 % 3 == 0
			local var_10_3 = #var_9_0 == var_10_1

			setActive(arg_10_2:Find("line"), not var_10_3 and not var_10_2)
		end
	end)
	arg_9_0.uiChanncelList:align(#var_9_0)
end

function var_0_0.FlushSendChannel(arg_12_0)
	local var_12_0 = IslandChatConst.SEND_CHANNELS

	arg_12_0.uiSendChanncelList:eachActive(function(arg_13_0, arg_13_1)
		local var_13_0 = var_12_0[arg_13_0 + 1]
		local var_13_1 = var_13_0 == arg_12_0.sendChannelValue

		setActive(arg_13_1:Find("mark"), var_13_1)

		local var_13_2 = IslandChatConst.CHANNEL2CN(var_13_0)

		setText(arg_13_1:Find("Text"), setColorStr(var_13_2, var_13_1 and "#FFFFFF" or "#393a3c"))
	end)
end

function var_0_0.FlushChannels(arg_14_0)
	local var_14_0 = IslandChatConst.CHANNELS

	arg_14_0.uiChanncelList:eachActive(function(arg_15_0, arg_15_1)
		local var_15_0 = var_14_0[arg_15_0 + 1]
		local var_15_1 = arg_14_0.channelValue == IslandChatConst.CHANNEL_ALL
		local var_15_2 = var_15_0 == IslandChatConst.CHANNEL_ALL
		local var_15_3 = var_15_2 and var_15_1 or not var_15_2 and not var_15_1 and bit.band(arg_14_0.channelValue, var_15_0) > 0

		setActive(arg_15_1:Find("mark"), var_15_3)

		local var_15_4 = IslandChatConst.CHANNEL2CN(var_15_0)

		setText(arg_15_1:Find("Text"), setColorStr(var_15_4, var_15_3 and "#FFFFFF" or "#393a3c"))
	end)
end

function var_0_0.FlushRoom(arg_16_0)
	local var_16_0 = getProxy(PlayerProxy):getRawData().chatRoomId

	setInputText(arg_16_0.roomInput, var_16_0)
end

function var_0_0.UpdatteChannelValue(arg_17_0, arg_17_1)
	if arg_17_1 == IslandChatConst.CHANNEL_ALL then
		arg_17_0.channelValue = IslandChatConst.CHANNEL_ALL
	else
		if bit.band(arg_17_0.channelValue, arg_17_1) > 0 then
			if arg_17_0.channelValue == IslandChatConst.CHANNEL_ALL then
				arg_17_0.channelValue = arg_17_1
			else
				arg_17_0.channelValue = bit.bxor(arg_17_0.channelValue, arg_17_1)
			end
		else
			arg_17_0.channelValue = bit.bor(arg_17_0.channelValue, arg_17_1)
		end

		if arg_17_0.channelValue <= 0 then
			arg_17_0.channelValue = IslandChatConst.CHANNEL_ALL
		end
	end
end

return var_0_0
