local var_0_0 = class("ChatConst")

var_0_0.CODE_BANED = 100
var_0_0.CODE_ACTOBSS_MSG_WORD = 1000
var_0_0.ChannelAll = 1
var_0_0.ChannelWorld = 2
var_0_0.ChannelPublic = 3
var_0_0.ChannelFriend = 4
var_0_0.ChannelGuild = 5
var_0_0.ChannelWorldBoss = 6
var_0_0.ChannelIsland = 7
var_0_0.SendChannels = {
	var_0_0.ChannelWorld,
	var_0_0.ChannelGuild
}
var_0_0.RecvChannels = {
	var_0_0.ChannelAll,
	var_0_0.ChannelWorld,
	var_0_0.ChannelPublic,
	var_0_0.ChannelFriend,
	var_0_0.ChannelGuild,
	var_0_0.ChannelWorldBoss
}

function var_0_0.GetChannelName(arg_1_0)
	return i18n("channel_name_" .. arg_1_0)
end

function var_0_0.GetChannelSprite(arg_2_0)
	if arg_2_0 == var_0_0.ChannelWorld then
		return "world"
	elseif arg_2_0 == var_0_0.ChannelPublic then
		return "public"
	elseif arg_2_0 == var_0_0.ChannelFriend then
		return "friend"
	elseif arg_2_0 == var_0_0.ChannelGuild then
		return "guild"
	elseif arg_2_0 == var_0_0.ChannelAll then
		return "total"
	elseif arg_2_0 == var_0_0.ChannelWorldBoss then
		return "worldboss"
	elseif arg_2_0 == var_0_0.ChannelIsland then
		return "island"
	end

	assert(false)
end

var_0_0.EmojiCommon = 0
var_0_0.EmojiDefault = 1
var_0_0.EmojiAnimate = 2
var_0_0.EmojiPixel = 3
var_0_0.EmojiIcon = 4
var_0_0.EmojiTypes = {
	var_0_0.EmojiCommon,
	var_0_0.EmojiDefault,
	var_0_0.EmojiAnimate,
	var_0_0.EmojiPixel,
	var_0_0.EmojiIcon
}

function var_0_0.GetEmojiSprite(arg_3_0)
	if arg_3_0 == var_0_0.EmojiCommon then
		return "tab_casual"
	elseif arg_3_0 == var_0_0.EmojiDefault then
		return "tab_default"
	elseif arg_3_0 == var_0_0.EmojiAnimate then
		return "tab_motive"
	elseif arg_3_0 == var_0_0.EmojiPixel then
		return "tab_pixel"
	end

	assert(false)
end

var_0_0.EmojiCode = "{777#code#777}"
var_0_0.EmojiCodeMatch = "{777#(%d+)#777}"
var_0_0.EmojiIconCode = "#code#"
var_0_0.EmojiIconCodeMatch = "#(%d+)#"
var_0_0.EMOJI_SAVE_TAG = "emoji_regular_used_"
var_0_0.EMOJI_ICON_SAVE_TAG = "emoji_icon_regular_used_"

return var_0_0
