local var_0_0 = class("BossRushChapterRemasterHelper")
local var_0_1 = {
	EX = 1,
	SIA = 4,
	SEA = 3,
	SP = 2
}

function var_0_0.GetExOrSp4Filter(arg_1_0)
	if arg_1_0 == var_0_1.EX or arg_1_0 == var_0_1.SP then
		return arg_1_0
	elseif arg_1_0 == var_0_1.SEA or arg_1_0 == var_0_1.SIA then
		return var_0_1.SP
	end

	return var_0_1.EX
end

function var_0_0.IsRemasterByActivity(arg_2_0)
	local var_2_0 = pg.re_map_template[arg_2_0].activity_type

	return var_2_0 == var_0_1.SEA or var_2_0 == var_0_1.SIA
end

function var_0_0.GetRemasterByActivityId(arg_3_0)
	if not arg_3_0 then
		return nil
	end

	for iter_3_0, iter_3_1 in ipairs(pg.re_map_template.all) do
		local var_3_0 = pg.re_map_template[iter_3_1]

		if var_3_0.activity_id == arg_3_0 then
			return var_3_0
		end
	end
end

function var_0_0.GetActivityRemasterByFinalSeriesId(arg_4_0, arg_4_1)
	local var_4_0 = var_0_0.GetRemasterByActivityId(arg_4_0)

	if not var_4_0 or not var_0_0.IsRemasterByActivity(var_4_0.id) then
		return nil
	end

	local var_4_1 = var_4_0.config_data or {}

	if var_4_1[#var_4_1] == arg_4_1 then
		return var_4_0
	end
end

function var_0_0.GetMemoryGroupStoryIds(arg_5_0)
	local var_5_0 = arg_5_0 and pg.memory_group[arg_5_0]

	if not var_5_0 then
		return {}
	end

	local var_5_1 = pg.NewStoryMgr.GetInstance()
	local var_5_2 = {}
	local var_5_3 = {}

	local function var_5_4(arg_6_0)
		if not arg_6_0 or arg_6_0 == "" then
			return
		end

		local var_6_0, var_6_1 = var_5_1:StoryName2StoryId(arg_6_0)

		if var_6_0 and var_6_0 > 0 and not var_5_3[var_6_0] and not var_5_1:GetPlayedFlag(var_6_0) then
			var_5_3[var_6_0] = true

			table.insert(var_5_2, var_6_0)
		end

		if var_6_1 and var_6_1 > 0 and not var_5_3[var_6_1] and not var_5_1:GetPlayedFlag(var_6_1) then
			var_5_3[var_6_1] = true

			table.insert(var_5_2, var_6_1)
		end
	end

	for iter_5_0, iter_5_1 in ipairs(var_5_0.memories or {}) do
		local var_5_5 = pg.memory_template[iter_5_1]

		if var_5_5 then
			var_5_4(var_5_5.story)

			if type(var_5_5.unlock_pre) == "table" then
				for iter_5_2, iter_5_3 in ipairs(var_5_5.unlock_pre) do
					var_5_4(iter_5_3)
				end
			else
				var_5_4(var_5_5.unlock_pre)
			end
		end
	end

	return var_5_2
end

function var_0_0.UnlockMemoryGroupStories(arg_7_0, arg_7_1)
	arg_7_1 = arg_7_1 or {}

	local var_7_0 = var_0_0.GetMemoryGroupStoryIds(arg_7_0)

	if #var_7_0 <= 0 then
		if arg_7_1.callback then
			arg_7_1.callback()
		end

		return var_7_0
	end

	if arg_7_1.sync then
		pg.m02:sendNotification(GAME.STORY_UPDATE_LIST, {
			storyIds = var_7_0,
			callback = arg_7_1.callback
		})
	else
		pg.NewStoryMgr.GetInstance():SetPlayedFlagList(var_7_0)

		if arg_7_1.callback then
			arg_7_1.callback()
		end
	end

	return var_7_0
end

function var_0_0.ShowUnlockMemoryMsgBox(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if not arg_8_0 or not arg_8_1 or #arg_8_1 <= 0 then
		if arg_8_3 then
			arg_8_3()
		end

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		yesText = "text_go",
		content = i18n("levelScene_remaster_story_tip", pg.memory_group[arg_8_0].title),
		onYes = arg_8_2,
		onNo = arg_8_3
	})
end

function var_0_0.MarkMemoryGroupNotification(arg_9_0)
	if not arg_9_0 then
		return
	end

	local var_9_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("MEMORY_GROUP_NOTIFICATION" .. var_9_0 .. " " .. arg_9_0, 1)
	PlayerPrefs.Save()
end

function var_0_0.UnlockMemoryGroupStoriesAndShowMsgBox(arg_10_0, arg_10_1)
	local var_10_0 = var_0_0.UnlockMemoryGroupStories(arg_10_0)

	if #var_10_0 <= 0 then
		return false
	end

	var_0_0.ShowUnlockMemoryMsgBox(arg_10_0, var_10_0, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_MEMORTY,
			memoryGroup = arg_10_0
		})
	end, function()
		var_0_0.MarkMemoryGroupNotification(arg_10_0)

		if arg_10_1 then
			arg_10_1(var_10_0)
		end
	end)

	return true
end

function var_0_0.GetPermanentActivityTicketCost(arg_13_0, arg_13_1)
	if not arg_13_0 or not arg_13_1 or not pg.activity_task_permanent[arg_13_0] then
		return 0
	end

	local var_13_0 = var_0_0.GetRemasterByActivityId(arg_13_0)

	if not var_13_0 then
		return 0
	end

	for iter_13_0, iter_13_1 in ipairs(var_13_0.config_data or {}) do
		if iter_13_1 == arg_13_1 then
			return var_13_0.tickets[iter_13_0] or 0
		end
	end

	return 0
end

function var_0_0.GetChapterIds(arg_14_0)
	if var_0_0.IsRemasterByActivity(arg_14_0) then
		return {}
	else
		local var_14_0 = pg.re_map_template[arg_14_0]

		return var_14_0 and var_14_0.config_data or {}
	end
end

function var_0_0.GetAllNonActivityIds()
	local var_15_0 = {}

	_.each(pg.re_map_template.all, function(arg_16_0)
		if not var_0_0.IsRemasterByActivity(arg_16_0) then
			table.insert(var_15_0, arg_16_0)
		end
	end)

	return var_15_0
end

function var_0_0.GetProgress(arg_17_0)
	if not arg_17_0 then
		return 0
	end

	if var_0_0.IsRemasterByActivity(arg_17_0) then
		local var_17_0 = pg.re_map_template[arg_17_0]
		local var_17_1 = var_17_0 and getProxy(ActivityProxy):getActivityById(var_17_0.activity_id)

		if not var_17_1 then
			return 0
		end

		local var_17_2 = 0

		for iter_17_0, iter_17_1 in ipairs(var_17_0.config_data) do
			if var_17_1:HasPassSeries(iter_17_1) then
				var_17_2 = math.max(var_17_2, var_17_0.chapter_progress[iter_17_0])
			end
		end

		return var_17_2
	else
		local var_17_3 = getProxy(ChapterProxy)
		local var_17_4 = pg.re_map_template[arg_17_0]
		local var_17_5 = 0

		for iter_17_2, iter_17_3 in ipairs(var_17_4.config_data) do
			if var_17_3:getChapterById(iter_17_3):isClear() then
				var_17_5 = math.max(var_17_5, var_17_4.chapter_progress[iter_17_2])
			end
		end

		return var_17_5
	end
end

function var_0_0.ChapterAwardInfo(arg_18_0, arg_18_1)
	if not arg_18_0 then
		return nil
	end

	local var_18_0
	local var_18_1 = getProxy(ChapterProxy)
	local var_18_2 = pg.re_map_template[arg_18_0]

	arg_18_1 = arg_18_1 or var_18_2.activity_id or 0

	if arg_18_0 and #var_18_2.drop_gain > 0 then
		for iter_18_0, iter_18_1 in ipairs(var_18_2.drop_gain) do
			local var_18_3 = #iter_18_1 > 0 and var_18_1:getRemasterInfo(arg_18_1, iter_18_1[1], iter_18_0)

			if var_18_3 and var_18_3.receive == false then
				var_18_0 = {
					iter_18_0,
					iter_18_1,
					arg_18_1
				}

				break
			end
		end
	end

	return var_18_0
end

function var_0_0.ExistCanGetAward(arg_19_0, arg_19_1)
	if not arg_19_0 then
		return false
	end

	local var_19_0 = getProxy(ChapterProxy)
	local var_19_1 = pg.re_map_template[arg_19_0]

	arg_19_1 = arg_19_1 or var_19_1.activity_id or 0

	for iter_19_0, iter_19_1 in ipairs(var_19_1.drop_gain) do
		if #iter_19_1 > 0 then
			local var_19_2, var_19_3, var_19_4, var_19_5 = unpack(iter_19_1)
			local var_19_6 = var_19_0:getRemasterInfo(arg_19_1, var_19_2, iter_19_0)

			if var_19_6 and not var_19_6.receive and var_19_5 <= var_19_6.count then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetAwardName(arg_20_0, arg_20_1)
	if arg_20_0 and arg_20_0 > 0 then
		local var_20_0 = pg.activity_series_enemy and pg.activity_series_enemy[arg_20_1] or pg.extraenemy_series_template and pg.extraenemy_series_template[arg_20_1]

		return var_20_0 and (var_20_0.name or var_20_0.chapter_name2 or var_20_0.chapter_name) or ""
	end

	return pg.chapter_template[arg_20_1].chapter_name
end

return var_0_0
