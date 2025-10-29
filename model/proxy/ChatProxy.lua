local var_0_0 = class("ChatProxy", import(".NetProxy"))

var_0_0.NEW_MSG = "ChatProxy public msg"

function var_0_0.InjectPublic(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1.id == 0 then
		arg_1_0.text = arg_1_1.args[1] and arg_1_1.args[1].string or ""

		return
	end

	local var_1_0 = i18n("ad_" .. arg_1_1.id)

	for iter_1_0 = 1, #arg_1_1.args do
		local var_1_1 = arg_1_1.args[iter_1_0]
		local var_1_2

		if var_1_1.type == PublicArg.TypePlayerName then
			var_1_2 = var_1_1.string
		elseif var_1_1.type == PublicArg.TypeShipId then
			local var_1_3 = pg.ship_data_statistics[var_1_1.int]
			local var_1_4 = "shiptype" .. iter_1_0
			local var_1_5 = GetSpriteFromAtlas("shiptype", shipType2print(var_1_3.type))

			arg_1_0:AddSprite(var_1_4, var_1_5)

			local var_1_6 = "shipcolor" .. iter_1_0

			var_1_0 = string.gsub(var_1_0, var_1_6, ItemRarity.Rarity2HexColor(var_1_3.rarity - 1))
			var_1_2 = var_1_3.name

			if arg_1_2 then
				local var_1_7 = false

				if PLATFORM_CODE == PLATFORM_JP then
					var_1_7, var_1_2 = contentWrap(var_1_2, 18, 1.65)
				end

				if var_1_7 then
					var_1_2 = var_1_2 .. "..." or var_1_2
				end
			end
		elseif var_1_1.type == PublicArg.TypeEquipId then
			var_1_2 = pg.equip_data_statistics[var_1_1.int].name
		elseif var_1_1.type == PublicArg.TypeItemId then
			var_1_2 = Item.getConfigData(var_1_1.int).name
		elseif var_1_1.type == PublicArg.TypeNums then
			var_1_2 = var_1_1.int
		elseif var_1_1.type == PublicArg.TypeWorldBoss then
			var_1_2 = var_1_1.string
		else
			var_1_2 = var_1_1.string
		end

		var_1_0 = string.gsub(var_1_0, "$" .. iter_1_0, var_1_2)
	end

	arg_1_0.text = var_1_0
end

function var_0_0.InjectPublicMsg(arg_2_0, arg_2_1)
	local var_2_0, var_2_1 = wordVer(arg_2_0, {
		isReplace = true
	})
	local var_2_2

	string.gsub(var_2_1, ChatConst.EmojiCodeMatch, function(arg_3_0)
		var_2_2 = tonumber(arg_3_0)
	end)

	if var_2_2 then
		local var_2_3 = pg.emoji_template[var_2_2]

		if var_2_3 then
			var_2_1 = var_2_3.desc
		else
			var_2_2 = nil
		end
	end

	return {
		player = arg_2_1,
		content = var_2_1,
		emojiId = var_2_2,
		timestamp = pg.TimeMgr.GetInstance():GetServerTime()
	}
end

function var_0_0.register(arg_4_0)
	arg_4_0:on(50101, function(arg_5_0)
		if arg_5_0.type == ChatConst.CODE_BANED then
			pg.TipsMgr.GetInstance():ShowTips(arg_5_0.content)
		elseif arg_5_0.type == ChatConst.CODE_ACTOBSS_MSG_WORD then
			local var_5_0 = {
				name = arg_5_0.player.name,
				score = arg_5_0.content
			}

			arg_4_0:sendNotification(GAME.ACTIVITY_BOSS_MSG_ADDED, var_5_0)
			table.insert(arg_4_0.actBossMsg, var_5_0)

			if #arg_4_0.actBossMsg > 6 then
				table.remove(arg_4_0.actBossMsg, 1)
			end
		else
			local var_5_1 = var_0_0.InjectPublicMsg(arg_5_0.content, Player.New(arg_5_0.player))

			arg_4_0:addNewMsg(ChatMsg.New(ChatConst.ChannelWorld, var_5_1))
		end
	end)
	arg_4_0:on(50103, function(arg_6_0)
		local var_6_0 = {}

		for iter_6_0, iter_6_1 in ipairs(arg_6_0.arg_list) do
			table.insert(var_6_0, PublicArg.New(iter_6_1))
		end

		local var_6_1 = {
			id = arg_6_0.ad_id,
			args = var_6_0,
			timestamp = pg.TimeMgr.GetInstance():GetServerTime()
		}

		arg_4_0:addNewMsg(ChatMsg.New(ChatConst.ChannelPublic, var_6_1))
	end)

	arg_4_0.informs = {}
	arg_4_0.actBossMsg = {}
end

function var_0_0.addNewMsg(arg_7_0, arg_7_1)
	if arg_7_1.id == 0 then
		arg_7_0.top = arg_7_1

		_.each(arg_7_1.args, function(arg_8_0)
			if arg_8_0.string then
				pg.TipsMgr.GetInstance():ShowTips(arg_8_0.string)
			end
		end)
	else
		table.insert(arg_7_0.data, arg_7_1)

		if #arg_7_0.data > 100 then
			table.remove(arg_7_0.data, 1)
		end
	end

	arg_7_0:sendNotification(var_0_0.NEW_MSG, arg_7_1)
end

function var_0_0.UpdateMsg(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.data) do
		if iter_9_1:IsSame(arg_9_1.uniqueId) then
			arg_9_0.data[iter_9_0] = arg_9_1
		end
	end
end

function var_0_0.GetMessagesByUniqueId(arg_10_0, arg_10_1)
	return _.select(arg_10_0.data, function(arg_11_0)
		return arg_11_0.uniqueId == arg_10_1
	end)
end

function var_0_0.clearMsg(arg_12_0)
	arg_12_0.data = {}
end

function var_0_0.loadUsedEmoji(arg_13_0)
	arg_13_0.usedEmoji = {}

	local var_13_0 = getProxy(PlayerProxy):getRawData().id
	local var_13_1 = string.split(PlayerPrefs.GetString(ChatConst.EMOJI_SAVE_TAG .. var_13_0) or "", ":")

	if #var_13_1 > 0 then
		_.each(var_13_1, function(arg_14_0)
			local var_14_0 = string.split(arg_14_0, "|")

			if #var_14_0 == 2 then
				arg_13_0.usedEmoji[tonumber(var_14_0[1])] = tonumber(var_14_0[2])
			end
		end)
	end
end

function var_0_0.saveUsedEmoji(arg_15_0)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in pairs(arg_15_0.usedEmoji) do
		table.insert(var_15_0, iter_15_0 .. "|" .. iter_15_1)
	end

	local var_15_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString(ChatConst.EMOJI_SAVE_TAG .. var_15_1, table.concat(var_15_0, ":"))
end

function var_0_0.getUsedEmoji(arg_16_0)
	if not arg_16_0.usedEmoji then
		arg_16_0:loadUsedEmoji()
	end

	return arg_16_0.usedEmoji
end

function var_0_0.addUsedEmoji(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:getUsedEmoji()

	var_17_0[arg_17_1] = (var_17_0[arg_17_1] or 0) + 1

	arg_17_0:saveUsedEmoji()
end

function var_0_0.loadUsedEmojiIcon(arg_18_0)
	arg_18_0.usedEmojiIcon = {}

	for iter_18_0 = 1, 6 do
		arg_18_0.usedEmojiIcon[iter_18_0] = pg.emoji_small_template.all[iter_18_0]
	end

	local var_18_0 = getProxy(PlayerProxy):getRawData().id
	local var_18_1 = string.split(PlayerPrefs.GetString(ChatConst.EMOJI_ICON_SAVE_TAG .. var_18_0) or "", ":")

	if #var_18_1 > 0 then
		for iter_18_1, iter_18_2 in ipairs(var_18_1) do
			arg_18_0.usedEmojiIcon[iter_18_1] = tonumber(iter_18_2)
		end
	end
end

function var_0_0.saveUsedEmojiIcon(arg_19_0)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.usedEmojiIcon) do
		table.insert(var_19_0, iter_19_1)
	end

	local var_19_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetString(ChatConst.EMOJI_ICON_SAVE_TAG .. var_19_1, table.concat(var_19_0, ":"))
end

function var_0_0.getUsedEmojiIcon(arg_20_0)
	if not arg_20_0.usedEmojiIcon then
		arg_20_0:loadUsedEmojiIcon()
	end

	return arg_20_0.usedEmojiIcon
end

function var_0_0.addUsedEmojiIcon(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:getUsedEmojiIcon()
	local var_21_1 = table.indexof(var_21_0, arg_21_1, 1)

	if var_21_1 then
		table.remove(var_21_0, var_21_1)
	else
		table.remove(var_21_0, #var_21_0)
	end

	table.insert(var_21_0, 1, arg_21_1)
	arg_21_0:saveUsedEmojiIcon()
end

function var_0_0.GetAllTypeChatMessages(arg_22_0, arg_22_1)
	local var_22_0 = {}
	local var_22_1 = getProxy(ChatProxy)

	if not var_22_1 then
		return
	end

	_.each(var_22_1:getRawData(), function(arg_23_0)
		table.insert(var_22_0, arg_23_0)
	end)

	local var_22_2 = getProxy(GuildProxy)

	if var_22_2:getRawData() then
		_.each(var_22_2:getChatMsgs(), function(arg_24_0)
			table.insert(var_22_0, arg_24_0)
		end)
	end

	local var_22_3 = getProxy(FriendProxy)

	_.each(var_22_3:getCacheMsgList(), function(arg_25_0)
		table.insert(var_22_0, arg_25_0)
	end)

	var_22_0 = _(var_22_0):chain():filter(function(arg_26_0)
		return not var_22_3:isInBlackList(arg_26_0.playerId)
	end):sort(function(arg_27_0, arg_27_1)
		return arg_27_0.timestamp < arg_27_1.timestamp
	end):value()

	local var_22_4 = NotificationLayer.ChannelBits.recv
	local var_22_5 = bit.lshift(1, ChatConst.ChannelAll)

	var_22_0 = _.filter(var_22_0, function(arg_28_0)
		return var_22_4 == var_22_5 or bit.band(var_22_4, bit.lshift(1, arg_28_0.type)) > 0
	end)
	var_22_0 = _.slice(var_22_0, #var_22_0 - arg_22_1 + 1, arg_22_1)

	return var_22_0
end

return var_0_0
