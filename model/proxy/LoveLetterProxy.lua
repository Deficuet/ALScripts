local var_0_0 = class("LoveLetterProxy", import(".NetProxy"))

var_0_0.UPDATE_LOVE_LETTER = "LoveLetterProxy.UPDATE_LOVE_LETTER"

function var_0_0.register(arg_1_0)
	arg_1_0.letterTextContent = {}
end

function var_0_0.SetGroupList(arg_2_0, arg_2_1)
	arg_2_0.data = {}
	arg_2_0.levelAll = 0

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.medal_list) do
		arg_2_0.data[iter_2_1.group_id] = LoveLetter.New(iter_2_1)
		arg_2_0.levelAll = arg_2_0.levelAll + arg_2_0.data[iter_2_1.group_id]:GetDisplayLevel()
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.letter_list) do
		arg_2_0:GetGroupData(iter_2_3.group_id):SetUnlockLetters(iter_2_3.letter_id_list)
	end

	arg_2_0.giftRecord = {}

	for iter_2_4, iter_2_5 in ipairs(arg_2_1.converted_list) do
		table.insert(arg_2_0.giftRecord, {
			year = iter_2_5.year,
			group_id = iter_2_5.group_id,
			item_id = iter_2_5.item_id
		})
	end

	arg_2_0.rewardMarkDic = {}

	for iter_2_6, iter_2_7 in ipairs(arg_2_1.rewarded_list) do
		arg_2_0.rewardMarkDic[iter_2_7] = true
	end
end

function var_0_0.GetGroupData(arg_3_0, arg_3_1)
	if not arg_3_0.data[arg_3_1] then
		arg_3_0.data[arg_3_1] = LoveLetter.New({
			group_id = arg_3_1
		})
	end

	return arg_3_0.data[arg_3_1]
end

function var_0_0.LevelUp(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0:GetGroupData(arg_4_1)

	arg_4_0.levelAll = arg_4_0.levelAll - var_4_0:GetDisplayLevel()

	var_4_0:MaxLevelUp()

	arg_4_0.levelAll = arg_4_0.levelAll + var_4_0:GetDisplayLevel()

	arg_4_0:sendNotification(LoveLetterProxy.UPDATE_LOVE_LETTER)
end

function var_0_0.UnlockLetter(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:GetGroupData(arg_5_1):SetUnlockLetters({
		arg_5_2
	})
end

function var_0_0.CanGetReward(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		local var_6_0 = pg.lover_reward[iter_6_1]

		assert(var_6_0)

		if arg_6_0.rewardMarkDic[iter_6_1] then
			return false
		end

		if arg_6_0.levelAll < var_6_0.total_level then
			return false
		end
	end

	return true
end

function var_0_0.MarkReward(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		arg_7_0.rewardMarkDic[iter_7_1] = true
	end
end

function var_0_0.GetLoveLetterItemDic(arg_8_0)
	if not var_0_0.letterItemDic then
		var_0_0.letterItemDic = {}
		var_0_0.letterIdMap = {}

		for iter_8_0, iter_8_1 in ipairs(pg.lover_letter_content.all) do
			local var_8_0 = pg.lover_letter_content[iter_8_1]

			var_0_0.letterIdMap[var_8_0.ship_group .. "_" .. var_8_0.year] = iter_8_1

			for iter_8_2, iter_8_3 in ipairs(var_8_0.love_item) do
				for iter_8_4, iter_8_5 in ipairs({
					0,
					var_8_0.ship_group
				}) do
					local var_8_1 = iter_8_3 .. "_" .. iter_8_5

					var_0_0.letterItemDic[var_8_1] = var_0_0.letterItemDic[var_8_1] or {}
					var_0_0.letterItemDic[var_8_1][var_8_0.year] = var_8_0.ship_group
				end
			end
		end

		var_0_0.groupChangeDic = {}

		for iter_8_6, iter_8_7 in ipairs(pg.lover_character_template.all) do
			local var_8_2 = pg.lover_character_template[iter_8_7]

			for iter_8_8, iter_8_9 in ipairs(var_8_2.relate_group_id) do
				var_0_0.groupChangeDic[iter_8_9] = iter_8_7
			end
		end
	end

	return var_0_0.letterItemDic, var_0_0.letterIdMap, var_0_0.groupChangeDic
end

function var_0_0.CanRealizeGift(arg_9_0)
	local var_9_0 = getProxy(BagProxy):GetAllLoveLetterItem()
	local var_9_1, var_9_2, var_9_3 = arg_9_0:GetLoveLetterItemDic()
	local var_9_4 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.giftRecord) do
		local var_9_5 = var_9_3[iter_9_1.group_id] or iter_9_1.group_id

		var_9_4[var_9_5] = var_9_4[var_9_5] or {}

		table.insert(var_9_4[var_9_5], iter_9_1)
	end

	for iter_9_2, iter_9_3 in pairs(var_9_4) do
		if not underscore.any(var_9_0, function(arg_10_0)
			local var_10_0, var_10_1 = unpack(arg_10_0)
			local var_10_2 = var_10_1 and var_9_3[var_10_1] or var_10_1 or 0

			for iter_10_0, iter_10_1 in pairs(var_9_1[var_10_0 .. "_" .. var_10_2]) do
				if iter_10_1 == iter_9_2 then
					return true
				end
			end

			return false
		end) then
			table.insertto(var_9_0, underscore.map(iter_9_3, function(arg_11_0)
				if pg.item_data_statistics[arg_11_0.item_id].type == Item.LOVE_LETTER_TYPE then
					return {
						arg_11_0.item_id,
						arg_11_0.group_id
					}
				else
					return {
						arg_11_0.item_id,
						0
					}
				end
			end))
		end
	end

	if #var_9_0 > #arg_9_0.giftRecord then
		return var_9_0
	else
		return false
	end
end

function var_0_0.UpdateRealizeGift(arg_12_0, arg_12_1)
	local var_12_0, var_12_1, var_12_2 = arg_12_0:GetLoveLetterItemDic()
	local var_12_3 = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		local var_12_4 = var_12_2[iter_12_1.group_id] or iter_12_1.group_id

		var_12_3[var_12_4] = var_12_3[var_12_4] or {}

		table.insert(var_12_3[var_12_4], iter_12_1)
	end

	local var_12_5 = {}

	for iter_12_2, iter_12_3 in ipairs(arg_12_0.giftRecord) do
		local var_12_6
		local var_12_7 = var_12_2[iter_12_3.group_id] or iter_12_3.group_id

		for iter_12_4, iter_12_5 in ipairs(var_12_3[var_12_7] or {}) do
			if iter_12_5.item_id == iter_12_3.item_id and iter_12_5.year == iter_12_3.year then
				var_12_6 = iter_12_4

				break
			end
		end

		if var_12_6 then
			table.remove(var_12_3[var_12_7], var_12_6)
		else
			var_12_5[var_12_7] = var_12_5[var_12_7] or {}

			table.insert(var_12_5[var_12_7], iter_12_3)
		end
	end

	for iter_12_6, iter_12_7 in pairs(var_12_3) do
		assert(#iter_12_7 >= #(var_12_5[iter_12_6] or {}))

		local var_12_8 = arg_12_0:GetGroupData(iter_12_6)

		arg_12_0.levelAll = arg_12_0.levelAll - var_12_8:GetDisplayLevel()

		var_12_8:AddGiftExp(#iter_12_7 - #(var_12_5[iter_12_6] or {}))

		arg_12_0.levelAll = arg_12_0.levelAll + var_12_8:GetDisplayLevel()

		for iter_12_8, iter_12_9 in ipairs(var_12_5[iter_12_6] or {}) do
			local var_12_9 = var_12_1[iter_12_6 .. "_" .. iter_12_9.year]

			var_12_8.unlockLetterDic[var_12_9] = var_12_8.unlockLetterDic[var_12_9] - 1
		end

		for iter_12_10, iter_12_11 in ipairs(iter_12_7) do
			local var_12_10 = var_12_1[(var_12_2[iter_12_11.group_id] or iter_12_11.group_id) .. "_" .. iter_12_11.year]

			var_12_8.unlockLetterDic[var_12_10] = defaultValue(var_12_8.unlockLetterDic[var_12_10], 0) + 1
		end
	end

	arg_12_0.giftRecord = arg_12_1
	arg_12_0.giftTip = false

	arg_12_0:sendNotification(LoveLetterProxy.UPDATE_LOVE_LETTER)
end

function var_0_0.AddLoveLetterExp(arg_13_0, arg_13_1, arg_13_2)
	arg_13_2 = arg_13_0:GetGroupData(arg_13_1):AddExp(arg_13_2)

	return arg_13_2
end

function var_0_0.GetDisplayGroupList(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_0.data) do
		if iter_14_1.exp ~= 0 then
			table.insert(var_14_0, iter_14_1.groupId)
		end
	end

	table.sort(var_14_0)

	local var_14_1 = getProxy(CollectionProxy):RawgetGroups()

	return underscore.map(var_14_0, function(arg_15_0)
		return var_14_1[arg_15_0]
	end)
end

function var_0_0.GetAllLevel(arg_16_0)
	return arg_16_0.levelAll
end

function var_0_0.GetAllLevelNextAwardIndex(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(pg.lover_reward.all) do
		if not arg_17_0.rewardMarkDic[iter_17_1] then
			return iter_17_0
		end
	end

	return nil
end

function var_0_0.GetAllLevelProgress(arg_18_0)
	local var_18_0 = arg_18_0:GetAllLevelNextAwardIndex()

	if not var_18_0 then
		return 0, 0
	else
		local var_18_1 = pg.lover_reward.all
		local var_18_2 = var_18_0 > 1 and pg.lover_reward[var_18_1[var_18_0 - 1]].total_level or 0

		return arg_18_0.levelAll - var_18_2, pg.lover_reward[var_18_1[var_18_0]].total_level - var_18_2
	end
end

function var_0_0.GetAllLevelNextAward(arg_19_0)
	local var_19_0 = pg.lover_reward.all
	local var_19_1 = var_19_0[arg_19_0:GetAllLevelNextAwardIndex() or #var_19_0]

	return underscore.map(pg.lover_reward[var_19_1].show_reward, function(arg_20_0)
		return Drop.Create(arg_20_0)
	end)
end

function var_0_0.GetAllLevelRewardMarkDic(arg_21_0)
	return arg_21_0.rewardMarkDic
end

function var_0_0.GetAllLevelReadyReward(arg_22_0)
	local var_22_0 = {}
	local var_22_1 = arg_22_0:GetAllLevelRewardMarkDic()

	for iter_22_0, iter_22_1 in ipairs(pg.lover_reward.all) do
		if pg.lover_reward[iter_22_1].total_level > arg_22_0.levelAll then
			break
		elseif not var_22_1[iter_22_1] then
			table.insert(var_22_0, iter_22_1)
		end
	end

	return var_22_0
end

function var_0_0.RecordLoveLetterContent(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.letterTextContent[arg_23_1] = HXSet.hxLan(arg_23_2)
end

function var_0_0.GetLoveLetterContent(arg_24_0, arg_24_1)
	return arg_24_0.letterTextContent[arg_24_1]
end

function var_0_0.GetDisPlayerGroupDatas(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0.data or {}) do
		if iter_25_1.exp > 0 then
			table.insert(var_25_0, iter_25_1)
		end
	end

	return var_25_0
end

function var_0_0.GetTrophyList(arg_26_0)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_0:GetDisPlayerGroupDatas()) do
		table.insertto(var_26_0, iter_26_1:GetTrophyList())
	end

	return var_26_0
end

function var_0_0.GetDisplayLetterList(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.data) do
		if iter_27_1.exp > 0 and #iter_27_1:GetDisplayLetterList() > 0 then
			table.insert(var_27_0, iter_27_0)
		end
	end

	table.sort(var_27_0, CompareFuncs({
		function(arg_28_0)
			return -arg_27_0.data[arg_28_0].level
		end,
		function(arg_29_0)
			return -arg_27_0.data[arg_29_0].exp
		end,
		function(arg_30_0)
			return arg_30_0
		end
	}))

	local var_27_1 = getProxy(CollectionProxy):RawgetGroups()

	return underscore.map(var_27_0, function(arg_31_0)
		return var_27_1[arg_31_0]
	end)
end

function var_0_0.GetRecordGiftLetters(arg_32_0, arg_32_1)
	local var_32_0 = {}
	local var_32_1, var_32_2, var_32_3 = arg_32_0:GetLoveLetterItemDic()

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.giftRecord) do
		if (var_32_3[iter_32_1.group_id] or iter_32_1.group_id) == arg_32_1 then
			table.insert(var_32_0, var_32_2[arg_32_1 .. "_" .. iter_32_1.year])
		end
	end

	return var_32_0
end

function var_0_0.IsTipRealizeGift(arg_33_0)
	if not arg_33_0.data then
		return false
	end

	if arg_33_0.giftTip == nil then
		arg_33_0.giftTip = arg_33_0:CanRealizeGift()
	end

	return arg_33_0.giftTip
end

function var_0_0.IsTipLevelUp(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.data) do
		if iter_34_1:GetDisplayLevel() < iter_34_1:GetMaxLevel() and iter_34_1:CanLevelUp() then
			return true
		end
	end

	return false
end

function var_0_0.IsTipAllLevelReward(arg_35_0)
	local var_35_0, var_35_1 = arg_35_0:GetAllLevelProgress()

	return var_35_1 > 0 and var_35_1 <= var_35_0
end

function var_0_0.IsTipUnlockLetter(arg_36_0)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.data) do
		for iter_36_2, iter_36_3 in ipairs(pg.lover_letter_content.get_id_list_by_ship_group[iter_36_0]) do
			if iter_36_1:CanUnlockLetter(iter_36_3) and not iter_36_1:GetLetterUnlock(iter_36_3) then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetSystemData(arg_37_0, arg_37_1)
	if not arg_37_0.data then
		arg_37_0:sendNotification(GAME.GET_ALL_LOVE_LETTER_DATA, {
			callback = arg_37_1
		})
	else
		arg_37_1()
	end
end

function var_0_0.remove(arg_38_0)
	arg_38_0.data = nil
end

return var_0_0
