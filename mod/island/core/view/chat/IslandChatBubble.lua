local var_0_0 = class("IslandChatBubble", import("view.main.ChatBubble"))

function var_0_0.init(arg_1_0)
	var_0_0.super.init(arg_1_0)

	arg_1_0.chatBgWidth = 655
end

function var_0_0.GetAttireFrameRes(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = AttireFrame.attireFrameRes(arg_2_1, arg_2_2, AttireConst.TYPE_CHAT_FRAME, arg_2_3)

	if var_2_0 == "0_self" then
		return "island_self"
	end

	if var_2_0 == "0_other" then
		return "island_other"
	end

	return var_2_0
end

function var_0_0.UpdateChannel(arg_3_0, arg_3_1)
	local var_3_0 = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(arg_3_1.type) .. "_mel")

	setImageSprite(arg_3_0.channel, var_3_0, true)
end

return var_0_0
