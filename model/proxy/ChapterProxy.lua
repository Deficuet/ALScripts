local var_0_0 = class("ChapterProxy", import(".NetProxy"))

var_0_0.CHAPTER_UPDATED = "ChapterProxy:CHAPTER_UPDATED"
var_0_0.CHAPTER_TIMESUP = "ChapterProxy:CHAPTER_TIMESUP"
var_0_0.CHAPTER_CELL_UPDATED = "ChapterProxy:CHAPTER_CELL_UPDATED"
var_0_0.CHAPTER_AUTO_FIGHT_FLAG_UPDATED = "CHAPTERPROXY:CHAPTER_AUTO_FIGHT_FLAG_UPDATED"
var_0_0.CHAPTER_SKIP_PRECOMBAT_UPDATED = "CHAPTERPROXY:CHAPTER_SKIP_PRECOMBAT_UPDATED"
var_0_0.CHAPTER_REMASTER_INFO_UPDATED = "CHAPTERPROXY:CHAPTER_REMASTER_INFO_UPDATED"
var_0_0.LAST_MAP_FOR_ACTIVITY = "last_map_for_activity"
var_0_0.LAST_MAP = "last_map"

function var_0_0.register(arg_1_0)
	arg_1_0:on(13001, function(arg_2_0)
		arg_1_0.mapEliteFleetCache = {}
		arg_1_0.mapEliteCommanderCache = {}
		arg_1_0.mapSupportFleetCache = {}

		local var_2_0 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.fleet_list) do
			var_2_0[iter_2_1.map_id] = var_2_0[iter_2_1.map_id] or {}

			table.insert(var_2_0[iter_2_1.map_id], iter_2_1)
		end

		for iter_2_2, iter_2_3 in pairs(var_2_0) do
			arg_1_0.mapEliteFleetCache[iter_2_2], arg_1_0.mapEliteCommanderCache[iter_2_2], arg_1_0.mapSupportFleetCache[iter_2_2] = Chapter.BuildEliteFleetList(iter_2_3)
		end

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.chapter_list) do
			if not pg.chapter_template[iter_2_5.id] then
				errorMsg("chapter_template not exist: " .. iter_2_5.id)
			else
				local var_2_1 = Chapter.New(iter_2_5)
				local var_2_2 = var_2_1:getConfig("formation")

				var_2_1:setEliteFleetList(Clone(arg_1_0.mapEliteFleetCache[var_2_2]) or {
					{},
					{},
					{}
				})
				var_2_1:setEliteCommanders(Clone(arg_1_0.mapEliteCommanderCache[var_2_2]) or {
					{},
					{},
					{}
				})
				var_2_1:setSupportFleetList(Clone(arg_1_0.mapSupportFleetCache[var_2_2]) or {
					{}
				})
				arg_1_0:updateChapter(var_2_1)
			end
		end

		if arg_2_0.react_chapter then
			arg_1_0.remasterTickets = arg_2_0.react_chapter.count
			arg_1_0.remasterDailyCount = arg_2_0.react_chapter.daily_count
			arg_1_0.remasterTip = not (arg_1_0.remasterDailyCount > 0)
		end
	end)
	arg_1_0:on(13000, function(arg_3_0)
		arg_1_0.repairTimes = arg_3_0.daily_repair_count

		if arg_3_0.current_chapter then
			local var_3_0 = arg_3_0.current_chapter.id

			if var_3_0 > 0 then
				local var_3_1 = arg_1_0:getChapterById(var_3_0, true)

				var_3_1:update(arg_3_0.current_chapter)
				arg_1_0:updateChapter(var_3_1)
			end
		end

		Map.lastMap = arg_1_0:getLastMap(var_0_0.LAST_MAP)
		Map.lastMapForActivity = arg_1_0:getLastMap(var_0_0.LAST_MAP_FOR_ACTIVITY)

		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inChapter")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inElite")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inSupport")
	end)

	arg_1_0.timers = {}
	arg_1_0.escortChallengeTimes = 0
	arg_1_0.chaptersExtend = {}
	arg_1_0.chapterStoryGroups = {}
	arg_1_0.continuousData = {}

	arg_1_0:buildMaps()
	arg_1_0:buildRemasterInfo()
end

function var_0_0.timeCall(arg_4_0)
	return {
		[ProxyRegister.DayCall] = function(arg_5_0)
			arg_4_0:resetRepairTimes()
			arg_4_0:resetEscortChallengeTimes()

			local var_5_0 = arg_4_0:getData()

			for iter_5_0, iter_5_1 in pairs(var_5_0) do
				if iter_5_1.todayDefeatCount > 0 then
					iter_5_1.todayDefeatCount = 0

					arg_4_0:updateChapter(iter_5_1)
				end
			end

			arg_4_0:resetDailyCount()
		end
	}
end

function var_0_0.OnBattleFinished(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0:getActiveChapter()

	if var_6_0 then
		local var_6_1 = 0

		local function var_6_2()
			local var_7_0 = getProxy(ContextProxy)

			if not var_7_0 then
				return
			end

			if var_7_0:getCurrentContext().mediator == LevelMediator2 then
				var_6_1 = bit.bor(var_6_1, ChapterConst.DirtyAttachment, ChapterConst.DirtyStrategy)

				arg_6_0:SetChapterAutoFlag(var_6_0.id, false)

				return
			end

			local var_7_1 = var_7_0:getContextByMediator(LevelMediator2)

			if not var_7_1 then
				return
			end

			var_7_1.data.StopAutoFightFlag = true
		end

		if _.any(arg_6_1.ai_list, function(arg_8_0)
			return arg_8_0.item_type == ChapterConst.AttachOni
		end) then
			var_6_0:onOniEnter()
			var_6_2()
		end

		if _.any(arg_6_1.map_update, function(arg_9_0)
			return arg_9_0.item_type == ChapterConst.AttachBomb_Enemy
		end) then
			var_6_0:onBombEnemyEnter()
			var_6_2()
		end

		if #arg_6_1.map_update > 0 then
			_.each(arg_6_1.map_update, function(arg_10_0)
				if arg_10_0.item_type == ChapterConst.AttachStory and arg_10_0.item_data == ChapterConst.StoryTrigger then
					local var_10_0 = ChapterCell.Line2Name(arg_10_0.pos.row, arg_10_0.pos.column)
					local var_10_1 = var_6_0:GetChapterCellAttachemnts()
					local var_10_2 = var_10_1[var_10_0]

					if var_10_2 then
						if var_10_2.flag == ChapterConst.CellFlagTriggerActive and arg_10_0.item_flag == ChapterConst.CellFlagTriggerDisabled then
							local var_10_3 = pg.map_event_template[var_10_2.attachmentId].gametip

							if var_10_3 ~= "" then
								pg.TipsMgr.GetInstance():ShowTips(i18n(var_10_3))
							end
						end

						var_10_2.attachment = arg_10_0.item_type
						var_10_2.attachmentId = arg_10_0.item_id
						var_10_2.flag = arg_10_0.item_flag
						var_10_2.data = arg_10_0.item_data
					else
						var_10_1[var_10_0] = ChapterCell.New(arg_10_0)
					end
				elseif arg_10_0.item_type ~= ChapterConst.AttachNone and arg_10_0.item_type ~= ChapterConst.AttachBorn and arg_10_0.item_type ~= ChapterConst.AttachBorn_Sub and arg_10_0.item_type ~= ChapterConst.AttachOni_Target and arg_10_0.item_type ~= ChapterConst.AttachOni then
					local var_10_4 = ChapterCell.New(arg_10_0)

					var_6_0:mergeChapterCell(var_10_4)
				end
			end)

			var_6_1 = bit.bor(var_6_1, ChapterConst.DirtyAttachment, ChapterConst.DirtyAutoAction)
		end

		if #arg_6_1.ai_list > 0 then
			_.each(arg_6_1.ai_list, function(arg_11_0)
				local var_11_0 = ChapterChampionPackage.New(arg_11_0)

				var_6_0:mergeChampion(var_11_0)
			end)

			var_6_1 = bit.bor(var_6_1, ChapterConst.DirtyChampion, ChapterConst.DirtyAutoAction)
		end

		if #arg_6_1.add_flag_list > 0 or #arg_6_1.del_flag_list > 0 then
			var_6_1 = bit.bor(var_6_1, ChapterConst.DirtyFleet, ChapterConst.DirtyStrategy, ChapterConst.DirtyCellFlag, ChapterConst.DirtyFloatItems, ChapterConst.DirtyAttachment)

			arg_6_0:updateExtraFlag(var_6_0, arg_6_1.add_flag_list, arg_6_1.del_flag_list)
		end

		if #arg_6_1.buff_list > 0 then
			var_6_0:UpdateBuffList(arg_6_1.buff_list)
		end

		if #arg_6_1.cell_flag_list > 0 then
			_.each(arg_6_1.cell_flag_list, function(arg_12_0)
				local var_12_0 = var_6_0:getChapterCell(arg_12_0.pos.row, arg_12_0.pos.column)

				if var_12_0 then
					var_12_0:updateFlagList(arg_12_0)
				else
					var_12_0 = ChapterCell.New(arg_12_0)
				end

				var_6_0:updateChapterCell(var_12_0)
			end)

			var_6_1 = bit.bor(var_6_1, ChapterConst.DirtyCellFlag)
		end

		arg_6_0:updateChapter(var_6_0, var_6_1)

		if arg_6_2 then
			arg_6_0:sendNotification(GAME.CHAPTER_OP_DONE, {
				type = ChapterConst.OpSkipBattle
			})
		end
	end
end

function var_0_0.setEliteCache(arg_13_0, arg_13_1)
	arg_13_0.mapEliteFleetCache = {}
	arg_13_0.mapEliteCommanderCache = {}
	arg_13_0.mapSupportFleetCache = {}

	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		var_13_0[iter_13_1.map_id] = var_13_0[iter_13_1.map_id] or {}

		table.insert(var_13_0[iter_13_1.map_id], iter_13_1)
	end

	for iter_13_2, iter_13_3 in pairs(var_13_0) do
		arg_13_0.mapEliteFleetCache[iter_13_2], arg_13_0.mapEliteCommanderCache[iter_13_2], arg_13_0.mapSupportFleetCache[iter_13_2] = Chapter.BuildEliteFleetList(iter_13_3)
	end

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inElite")
	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inSupport")

	for iter_13_4, iter_13_5 in pairs(arg_13_0.data) do
		local var_13_1 = iter_13_5:getConfig("formation")

		iter_13_5:setEliteFleetList(Clone(arg_13_0.mapEliteFleetCache[var_13_1]) or {
			{},
			{},
			{}
		})
		iter_13_5:setEliteCommanders(Clone(arg_13_0.mapEliteCommanderCache[var_13_1]) or {
			{},
			{},
			{}
		})
		iter_13_5:setSupportFleetList(Clone(arg_13_0.mapSupportFleetCache[var_13_1]) or {
			{},
			{},
			{}
		})
		arg_13_0:updateChapter(iter_13_5)
	end
end

function var_0_0.buildMaps(arg_14_0)
	arg_14_0:initChapters()
	arg_14_0:buildBaseMaps()
	arg_14_0:buildRemasterMaps()
end

function var_0_0.initChapters(arg_15_0)
	var_0_0.MapToChapters = table.shallowCopy(pg.chapter_template.get_id_list_by_map)

	for iter_15_0, iter_15_1 in pairs(pg.story_group.get_id_list_by_map) do
		var_0_0.MapToChapters[iter_15_0] = var_0_0.MapToChapters[iter_15_0] or {}
		var_0_0.MapToChapters[iter_15_0] = table.mergeArray(var_0_0.MapToChapters[iter_15_0], iter_15_1)
	end

	var_0_0.FormationToChapters = pg.chapter_template.get_id_list_by_formation
end

function var_0_0.buildBaseMaps(arg_16_0)
	var_0_0.ActToMaps = {}
	var_0_0.TypeToMaps = {}

	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(pg.expedition_data_by_map.all) do
		local var_16_1 = Map.New({
			id = iter_16_1,
			chapterIds = var_0_0.MapToChapters[iter_16_1]
		})

		var_16_0[iter_16_1] = var_16_1

		local var_16_2 = var_16_1:getConfig("on_activity")

		if var_16_2 ~= 0 then
			var_0_0.ActToMaps[var_16_2] = var_0_0.ActToMaps[var_16_2] or {}

			table.insert(var_0_0.ActToMaps[var_16_2], var_16_1.id)
		end

		local var_16_3 = var_16_1:getMapType()

		var_0_0.TypeToMaps[var_16_3] = var_0_0.TypeToMaps[var_16_3] or {}

		table.insert(var_0_0.TypeToMaps[var_16_3], var_16_1.id)
	end

	arg_16_0.baseMaps = var_16_0
end

function var_0_0.buildRemasterMaps(arg_17_0)
	var_0_0.RemasterToMaps = {}

	local var_17_0 = {}

	_.each(pg.re_map_template.all, function(arg_18_0)
		local var_18_0 = pg.re_map_template[arg_18_0]

		_.each(var_18_0.config_data, function(arg_19_0)
			local var_19_0 = arg_17_0.baseMaps[pg.chapter_template[arg_19_0].map]

			assert(not var_17_0[var_19_0.id] or var_17_0[var_19_0.id] == arg_18_0, "remaster chapter error:" .. arg_19_0)

			if not var_17_0[var_19_0.id] then
				var_17_0[var_19_0.id] = arg_18_0

				var_19_0:setRemaster(arg_18_0)

				var_0_0.RemasterToMaps[arg_18_0] = var_0_0.RemasterToMaps[arg_18_0] or {}

				table.insert(var_0_0.RemasterToMaps[arg_18_0], var_19_0.id)
			end
		end)
	end)
end

function var_0_0.IsChapterInRemaster(arg_20_0, arg_20_1)
	return _.detect(pg.re_map_template.all, function(arg_21_0)
		local var_21_0 = pg.re_map_template[arg_21_0]

		return _.any(var_21_0.config_data, function(arg_22_0)
			return arg_22_0 == arg_20_1
		end)
	end)
end

function var_0_0.getMaxEscortChallengeTimes(arg_23_0)
	return getProxy(ActivityProxy):getActivityParameter("escort_daily_count") or 0
end

function var_0_0.getEscortChapterIds(arg_24_0)
	return getProxy(ActivityProxy):getActivityParameter("escort_exp_id") or {}
end

function var_0_0.resetEscortChallengeTimes(arg_25_0)
	arg_25_0.escortChallengeTimes = 0
end

function var_0_0.addChapterListener(arg_26_0, arg_26_1)
	if not arg_26_1.dueTime or not arg_26_0.timers then
		return
	end

	if arg_26_0.timers[arg_26_1.id] then
		arg_26_0.timers[arg_26_1.id]:Stop()

		arg_26_0.timers[arg_26_1.id] = nil
	end

	local var_26_0 = arg_26_1.dueTime - pg.TimeMgr.GetInstance():GetServerTime()

	local function var_26_1()
		arg_26_0.data[arg_26_1.id].dueTime = nil

		arg_26_0.data[arg_26_1.id]:display("times'up")
		arg_26_0:sendNotification(var_0_0.CHAPTER_UPDATED, {
			dirty = 0,
			chapter = arg_26_0.data[arg_26_1.id]:clone()
		})
		arg_26_0:sendNotification(var_0_0.CHAPTER_TIMESUP)
	end

	if var_26_0 > 0 then
		arg_26_0.timers[arg_26_1.id] = Timer.New(function()
			var_26_1()
			arg_26_0.timers[arg_26_1.id]:Stop()

			arg_26_0.timers[arg_26_1.id] = nil
		end, var_26_0, 1)

		arg_26_0.timers[arg_26_1.id]:Start()
	else
		var_26_1()
	end
end

function var_0_0.removeChapterListener(arg_29_0, arg_29_1)
	if arg_29_0.timers[arg_29_1] then
		arg_29_0.timers[arg_29_1]:Stop()

		arg_29_0.timers[arg_29_1] = nil
	end
end

function var_0_0.remove(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.timers) do
		iter_30_1:Stop()
	end

	arg_30_0.timers = nil
end

function var_0_0.GetRawChapterById(arg_31_0, arg_31_1)
	return arg_31_0.data[arg_31_1]
end

function var_0_0.getChapterById(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.data[arg_32_1]

	if not var_32_0 then
		assert(pg.chapter_template[arg_32_1], "Not Exist Chapter ID: " .. (arg_32_1 or "NIL"))

		var_32_0 = Chapter.New({
			id = arg_32_1
		})

		local var_32_1 = var_32_0:getConfig("formation")

		if var_32_0:getConfig("type") == Chapter.CustomFleet then
			var_32_0:setEliteFleetList(Clone(arg_32_0.mapEliteFleetCache[var_32_1]) or {
				{},
				{},
				{}
			})
			var_32_0:setEliteCommanders(Clone(arg_32_0.mapEliteCommanderCache[var_32_1]) or {
				{},
				{},
				{}
			})
		elseif var_32_0:getConfig("type") == Chapter.SelectFleet then
			var_32_0:setSupportFleetList(Clone(arg_32_0.mapSupportFleetCache[var_32_1]) or {
				{},
				{},
				{}
			})
		end

		arg_32_0.data[arg_32_1] = var_32_0
	end

	return arg_32_2 and var_32_0 or var_32_0:clone()
end

function var_0_0.GetChapterItemById(arg_33_0, arg_33_1)
	if Chapter:bindConfigTable()[arg_33_1] then
		return arg_33_0:getChapterById(arg_33_1, true)
	elseif ChapterStoryGroup:bindConfigTable()[arg_33_1] then
		local var_33_0 = arg_33_0.chapterStoryGroups[arg_33_1]

		if not var_33_0 then
			var_33_0 = ChapterStoryGroup.New({
				configId = arg_33_1
			})
			arg_33_0.chapterStoryGroups[arg_33_1] = var_33_0
		end

		return var_33_0
	end
end

function var_0_0.updateChapter(arg_34_0, arg_34_1, arg_34_2)
	assert(isa(arg_34_1, Chapter), "should be an instance of Chapter")

	local var_34_0 = arg_34_0.data[arg_34_1.id]
	local var_34_1 = arg_34_1

	arg_34_0.data[arg_34_1.id] = var_34_1

	if var_34_0 then
		arg_34_0:removeChapterListener(var_34_0.id)
	end

	arg_34_0:addChapterListener(var_34_1)

	if getProxy(PlayerProxy):getInited() then
		arg_34_0.facade:sendNotification(var_0_0.CHAPTER_UPDATED, {
			chapter = var_34_1:clone(),
			dirty = defaultValue(arg_34_2, 0)
		})
	end

	if var_34_1.active and var_34_1.fleet then
		var_34_1.fleet:clearShipHpChange()
	end

	if tobool(checkExist(var_34_0, {
		"active"
	})) ~= tobool(var_34_1.active) then
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inChapter")
	end
end

function var_0_0.getMapById(arg_35_0, arg_35_1)
	return arg_35_0.baseMaps[arg_35_1]
end

function var_0_0.getNormalMaps(arg_36_0)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.baseMaps) do
		table.insert(var_36_0, iter_36_1)
	end

	return var_36_0
end

function var_0_0.getMapsByType(arg_37_0, arg_37_1)
	if var_0_0.TypeToMaps[arg_37_1] then
		return _.map(var_0_0.TypeToMaps[arg_37_1], function(arg_38_0)
			return arg_37_0:getMapById(arg_38_0)
		end)
	else
		return {}
	end
end

function var_0_0.getMapsByActId(arg_39_0, arg_39_1)
	if var_0_0.ActToMaps[arg_39_1] then
		return underscore.map(var_0_0.ActToMaps[arg_39_1], function(arg_40_0)
			return arg_39_0:getMapById(arg_40_0)
		end)
	else
		return {}
	end
end

function var_0_0.getRemasterMaps(arg_41_0, arg_41_1)
	if var_0_0.RemasterToMaps[arg_41_1] then
		return underscore.map(var_0_0.RemasterToMaps[arg_41_1], function(arg_42_0)
			return arg_41_0:getMapById(arg_42_0)
		end)
	else
		return {}
	end
end

function var_0_0.getMapsByActivities(arg_43_0, arg_43_1)
	local var_43_0 = getProxy(ActivityProxy)
	local var_43_1

	if arg_43_1 then
		var_43_1 = var_43_0:getActivityById(arg_43_1)
	else
		local var_43_2 = var_43_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT)

		table.sort(var_43_2, CompareFuncs({
			function(arg_44_0)
				return defaultValue(arg_44_0:GetConfigClientSetting("order"), 1)
			end
		}))

		var_43_1 = var_43_2[1]
	end

	if not var_43_1 then
		return {}
	end

	local var_43_3 = pg.chapter_template[var_43_1:getConfig("config_data")[1]].map
	local var_43_4 = pg.expedition_data_by_map[var_43_3].on_activity

	if getProxy(ActivityProxy):IsActivityNotEnd(var_43_4) then
		return arg_43_0:getMapsByActId(var_43_4)
	else
		return {}
	end
end

function var_0_0.getLastUnlockMap(arg_45_0)
	local var_45_0

	for iter_45_0, iter_45_1 in ipairs(arg_45_0:getNormalMaps()) do
		if not iter_45_1:isUnlock() then
			break
		end

		var_45_0 = iter_45_1
	end

	return var_45_0
end

function var_0_0.updateExtraFlag(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	local var_46_0 = arg_46_1:updateExtraFlags(arg_46_2, arg_46_3)

	if not arg_46_4 and not var_46_0 then
		return
	end

	local var_46_1 = {}

	for iter_46_0, iter_46_1 in ipairs(arg_46_2) do
		table.insert(var_46_1, iter_46_1)
	end

	arg_46_0:SetExtendChapterData(arg_46_1.id, "extraFlagUpdate", var_46_1)

	return true
end

function var_0_0.extraFlagUpdated(arg_47_0, arg_47_1)
	arg_47_0:RemoveExtendChapterData(arg_47_1, "extraFlagUpdate")
end

function var_0_0.getUpdatedExtraFlags(arg_48_0, arg_48_1)
	return arg_48_0:GetExtendChapterData(arg_48_1, "extraFlagUpdate")
end

function var_0_0.SetExtendChapterData(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	assert(arg_49_1, "Missing Chapter ID")

	arg_49_0.chaptersExtend[arg_49_1] = arg_49_0.chaptersExtend[arg_49_1] or {}
	arg_49_0.chaptersExtend[arg_49_1][arg_49_2] = arg_49_3
end

function var_0_0.AddExtendChapterDataArray(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
	assert(arg_50_1, "Missing Chapter ID")

	arg_50_0.chaptersExtend[arg_50_1] = arg_50_0.chaptersExtend[arg_50_1] or {}

	if type(arg_50_0.chaptersExtend[arg_50_1][arg_50_2]) ~= "table" then
		assert(arg_50_0.chaptersExtend[arg_50_1][arg_50_2] == nil, "Changing NonEmpty ExtendData " .. arg_50_2 .. " to Table ID: " .. arg_50_1)

		arg_50_0.chaptersExtend[arg_50_1][arg_50_2] = {}
	end

	arg_50_4 = arg_50_4 or #arg_50_0.chaptersExtend[arg_50_1][arg_50_2] + 1
	arg_50_0.chaptersExtend[arg_50_1][arg_50_2][arg_50_4] = arg_50_3
end

function var_0_0.AddExtendChapterDataTable(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4)
	assert(arg_51_1, "Missing Chapter ID")

	arg_51_0.chaptersExtend[arg_51_1] = arg_51_0.chaptersExtend[arg_51_1] or {}

	if type(arg_51_0.chaptersExtend[arg_51_1][arg_51_2]) ~= "table" then
		assert(arg_51_0.chaptersExtend[arg_51_1][arg_51_2] == nil, "Changing NonEmpty ExtendData " .. arg_51_2 .. " to Table ID: " .. arg_51_1)

		arg_51_0.chaptersExtend[arg_51_1][arg_51_2] = {}
	end

	assert(arg_51_3, "Missing Index on Set HashData")

	arg_51_0.chaptersExtend[arg_51_1][arg_51_2][arg_51_3] = arg_51_4
end

function var_0_0.GetExtendChapterData(arg_52_0, arg_52_1, arg_52_2)
	assert(arg_52_1, "Missing Chapter ID")
	assert(arg_52_2, "Requesting Empty key")

	if not arg_52_2 or not arg_52_0.chaptersExtend[arg_52_1] then
		return
	end

	return arg_52_0.chaptersExtend[arg_52_1][arg_52_2]
end

function var_0_0.RemoveExtendChapterData(arg_53_0, arg_53_1, arg_53_2)
	assert(arg_53_1, "Missing Chapter ID")

	if not arg_53_2 or not arg_53_0.chaptersExtend[arg_53_1] then
		return
	end

	arg_53_0.chaptersExtend[arg_53_1][arg_53_2] = nil

	if next(arg_53_0.chaptersExtend[arg_53_1]) then
		return
	end

	arg_53_0:RemoveExtendChapter(arg_53_1)
end

function var_0_0.GetExtendChapter(arg_54_0, arg_54_1)
	assert(arg_54_1, "Missing Chapter ID")

	return arg_54_0.chaptersExtend[arg_54_1]
end

function var_0_0.RemoveExtendChapter(arg_55_0, arg_55_1)
	assert(arg_55_1, "Missing Chapter ID")

	if not arg_55_0.chaptersExtend[arg_55_1] then
		return
	end

	arg_55_0.chaptersExtend[arg_55_1] = nil
end

function var_0_0.duplicateEliteFleet(arg_56_0, arg_56_1)
	if arg_56_1:getConfig("type") ~= Chapter.CustomFleet then
		return
	end

	local var_56_0 = arg_56_1:getEliteFleetList()
	local var_56_1 = arg_56_1:getEliteFleetCommanders()
	local var_56_2 = arg_56_1:getConfig("formation")

	arg_56_0.mapEliteFleetCache[var_56_2] = Clone(var_56_0)
	arg_56_0.mapEliteCommanderCache[var_56_2] = Clone(var_56_1)

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inElite")

	for iter_56_0, iter_56_1 in ipairs(var_0_0.FormationToChapters[var_56_2]) do
		local var_56_3 = arg_56_0:getChapterById(iter_56_1, true)

		if var_56_3.configId ~= arg_56_1.configId then
			var_56_3:setEliteFleetList(Clone(var_56_0))
			var_56_3:setEliteCommanders(Clone(var_56_1))
			arg_56_0:updateChapter(var_56_3)
		end
	end
end

function var_0_0.duplicateSupportFleet(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_1:getSupportFleet()
	local var_57_1 = arg_57_1:getConfig("formation")

	arg_57_0.mapSupportFleetCache[var_57_1] = {
		Clone(var_57_0)
	}

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inSupport")

	for iter_57_0, iter_57_1 in ipairs(var_0_0.FormationToChapters[var_57_1]) do
		local var_57_2 = arg_57_0:getChapterById(iter_57_1, true)

		if var_57_2.configId ~= arg_57_1.configId then
			var_57_2:setSupportFleetList({
				Clone(var_57_0)
			})
			arg_57_0:updateChapter(var_57_2)
		end
	end
end

function var_0_0.CheckUnitInSupportFleet(arg_58_0, arg_58_1)
	local var_58_0 = {}
	local var_58_1 = arg_58_1.id

	for iter_58_0, iter_58_1 in pairs(arg_58_0.mapSupportFleetCache) do
		for iter_58_2, iter_58_3 in ipairs(iter_58_1) do
			if table.contains(iter_58_3, var_58_1) then
				var_58_0[iter_58_0] = true

				break
			end
		end
	end

	return next(var_58_0), var_58_0
end

function var_0_0.RemoveUnitFromSupportFleet(arg_59_0, arg_59_1)
	arg_59_0:sendNotification(GAME.REMOVE_ELITE_TARGET_SHIP, {
		shipId = arg_59_1.id,
		callback = next
	})
end

function var_0_0.getActiveChapter(arg_60_0, arg_60_1)
	for iter_60_0, iter_60_1 in pairs(arg_60_0.data) do
		if iter_60_1.active then
			return arg_60_1 and iter_60_1 or iter_60_1:clone()
		end
	end
end

function var_0_0.GetLastNormalMap(arg_61_0)
	local var_61_0 = Map.lastMap and arg_61_0:getMapById(Map.lastMap)

	if var_61_0 and var_61_0:isUnlock() and var_61_0:getMapType() == Map.SCENARIO then
		return Map.lastMap
	end

	return arg_61_0:getLastUnlockMap().id
end

function var_0_0.getLastMapForActivity(arg_62_0, arg_62_1)
	local var_62_0
	local var_62_1
	local var_62_2 = arg_62_0:getActiveChapter()

	if var_62_2 then
		local var_62_3 = arg_62_0:getMapById(var_62_2:getConfig("map"))

		if var_62_3:isActivity() and not var_62_3:isRemaster() then
			return var_62_3.id, var_62_2.id
		end
	end

	local var_62_4 = Map.lastMapForActivity and arg_62_0:getMapById(Map.lastMapForActivity)

	if var_62_4 and not var_62_4:isRemaster() and var_62_4:isUnlock() and (not arg_62_1 or var_62_4:getConfig("on_activity") == arg_62_1) then
		return Map.lastMapForActivity
	end

	if Map.lastMapForActivity then
		arg_62_0:recordLastMap(var_0_0.LAST_MAP_FOR_ACTIVITY, 0)
	end

	return arg_62_0:getActivityLastUnlockMap(arg_62_1)
end

function var_0_0.getActivityLastUnlockMap(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0:getMapsByActivities(arg_63_1)

	if not _.all(var_63_0, function(arg_64_0)
		return arg_64_0:getConfig("type") == Map.EVENT
	end) then
		for iter_63_0, iter_63_1 in ipairs({
			Map.ACTIVITY_EASY,
			Map.ACTIVITY_HARD
		}) do
			local var_63_1 = underscore.filter(var_63_0, function(arg_65_0)
				return arg_65_0:getMapType() == iter_63_1
			end)

			if #var_63_1 > 0 and underscore.any(var_63_1, function(arg_66_0)
				return not arg_66_0:isClearForActivity()
			end) then
				var_63_0 = var_63_1

				break
			end
		end
	end

	for iter_63_2 = #var_63_0, 1, -1 do
		local var_63_2 = var_63_0[iter_63_2]

		if var_63_2:isUnlock() then
			return var_63_2.id
		end
	end

	if #var_63_0 > 0 then
		return var_63_0[1].id
	end
end

function var_0_0.updateActiveChapterShips(arg_67_0)
	local var_67_0 = arg_67_0:getActiveChapter(true)

	if var_67_0 then
		_.each(var_67_0.fleets, function(arg_68_0)
			arg_68_0:flushShips()
		end)
		arg_67_0:updateChapter(var_67_0, ChapterConst.DirtyFleet)
	end
end

function var_0_0.resetRepairTimes(arg_69_0)
	arg_69_0.repairTimes = 0
end

function var_0_0.getUseableEliteMap(arg_70_0)
	local var_70_0 = {}

	for iter_70_0, iter_70_1 in ipairs(arg_70_0:getMapsByType(Map.ELITE)) do
		if iter_70_1:isEliteEnabled() then
			var_70_0[#var_70_0 + 1] = iter_70_1
		end
	end

	return var_70_0
end

function var_0_0.getUseableMaxEliteMap(arg_71_0)
	local var_71_0 = arg_71_0:getUseableEliteMap()

	if #var_71_0 == 0 then
		return false
	else
		local var_71_1

		for iter_71_0, iter_71_1 in ipairs(var_71_0) do
			if not var_71_1 or var_71_1.id < iter_71_1.id then
				var_71_1 = iter_71_1
			end
		end

		return var_71_1
	end
end

function var_0_0.getHigestClearChapterAndMap(arg_72_0)
	local var_72_0 = arg_72_0.baseMaps[1]

	for iter_72_0, iter_72_1 in ipairs(arg_72_0:getNormalMaps()) do
		if not iter_72_1:isAnyChapterClear() then
			break
		end

		var_72_0 = iter_72_1
	end

	local var_72_1 = arg_72_0:getChapterById(var_72_0.chapterIds[1])

	for iter_72_2, iter_72_3 in ipairs(var_72_0:getChapters()) do
		if not iter_72_3:isClear() then
			break
		end

		var_72_1 = iter_72_3
	end

	return var_72_1, var_72_0
end

function var_0_0.SortRecommendLimitation(arg_73_0)
	table.sort(arg_73_0, CompareFuncs({
		function(arg_74_0)
			if type(arg_74_0) == "number" then
				if arg_74_0 == 0 then
					return 1
				else
					return -arg_74_0
				end
			elseif type(arg_74_0) == "string" then
				return 0
			else
				assert(false)
			end
		end
	}))
end

function var_0_0.eliteFleetRecommend(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_1:getEliteFleetList()[arg_75_2]
	local var_75_1 = arg_75_1:getConfig("limitation")[arg_75_2]
	local var_75_2 = var_75_1 and Clone(var_75_1[1]) or {
		0,
		0,
		0
	}
	local var_75_3 = var_75_1 and Clone(var_75_1[2]) or {
		0,
		0,
		0
	}
	local var_75_4 = {
		0,
		0,
		0
	}

	var_0_0.SortRecommendLimitation(var_75_2)
	var_0_0.SortRecommendLimitation(var_75_3)
	var_0_0.SortRecommendLimitation(var_75_4)

	local var_75_5 = {}

	for iter_75_0, iter_75_1 in ipairs(arg_75_1:getEliteFleetList()) do
		for iter_75_2, iter_75_3 in ipairs(iter_75_1) do
			var_75_5[#var_75_5 + 1] = iter_75_3
		end
	end

	local var_75_6

	if arg_75_2 > 2 then
		var_75_6 = {
			[TeamType.Submarine] = var_75_4
		}
	else
		var_75_6 = {
			[TeamType.Main] = var_75_2,
			[TeamType.Vanguard] = var_75_3
		}
	end

	local var_75_7 = arg_75_0:FleetRecommend(var_75_0, var_75_5, var_75_6, function(arg_76_0)
		return ShipStatus.ShipStatusCheck("inElite", arg_76_0, nil, {
			inElite = arg_75_1:getConfig("formation")
		})
	end)

	table.clean(var_75_0)
	table.insertto(var_75_0, var_75_7)
end

function var_0_0.SupportFleetRecommend(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = arg_77_1:getSupportFleet()
	local var_77_1 = {
		[TeamType.Main] = {
			"hang",
			"hang",
			"hang"
		}
	}
	local var_77_2 = table.shallowCopy(var_77_0)
	local var_77_3 = arg_77_0:FleetRecommend(var_77_0, var_77_2, var_77_1, function(arg_78_0)
		return ShipStatus.ShipStatusCheck("inSupport", arg_78_0, nil, {
			inSupport = arg_77_1:getConfig("formation")
		})
	end)

	table.clean(var_77_0)
	table.insertto(var_77_0, var_77_3)
end

function var_0_0.FleetRecommend(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4)
	arg_79_1 = table.shallowCopy(arg_79_1)
	arg_79_2 = table.shallowCopy(arg_79_2)

	local var_79_0 = getProxy(BayProxy)
	local var_79_1 = getProxy(BayProxy):getRawData()

	for iter_79_0, iter_79_1 in ipairs(arg_79_1) do
		local var_79_2 = var_79_1[iter_79_1]:getShipType()
		local var_79_3 = TeamType.GetTeamFromShipType(var_79_2)
		local var_79_4 = 0
		local var_79_5 = arg_79_3[var_79_3]

		for iter_79_2, iter_79_3 in ipairs(var_79_5) do
			if ShipType.ContainInLimitBundle(iter_79_3, var_79_2) then
				var_79_4 = iter_79_3

				break
			end
		end

		for iter_79_4, iter_79_5 in ipairs(var_79_5) do
			if iter_79_5 == var_79_4 then
				table.remove(var_79_5, iter_79_4)

				break
			end
		end
	end

	local function var_79_6(arg_80_0, arg_80_1)
		local var_80_0 = underscore.filter(TeamType.GetShipTypeListFromTeam(arg_80_1), function(arg_81_0)
			return ShipType.ContainInLimitBundle(arg_80_0, arg_81_0)
		end)
		local var_80_1 = var_79_0:GetRecommendShip(var_80_0, arg_79_2, arg_79_4)

		if var_80_1 then
			local var_80_2 = var_80_1.id

			arg_79_2[#arg_79_2 + 1] = var_80_2
			arg_79_1[#arg_79_1 + 1] = var_80_2
		end
	end

	for iter_79_6, iter_79_7 in pairs(arg_79_3) do
		for iter_79_8, iter_79_9 in ipairs(iter_79_7) do
			var_79_6(iter_79_9, iter_79_6)
		end
	end

	return arg_79_1
end

function var_0_0.isClear(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_0:GetChapterItemById(arg_82_1)

	if not var_82_0 then
		return false
	end

	return var_82_0:isClear()
end

function var_0_0.recordLastMap(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = false

	if arg_83_1 == var_0_0.LAST_MAP_FOR_ACTIVITY and arg_83_2 ~= Map.lastMapForActivity then
		Map.lastMapForActivity = arg_83_2
		var_83_0 = true
	elseif arg_83_1 == var_0_0.LAST_MAP and arg_83_2 ~= Map.lastMap then
		Map.lastMap = arg_83_2
		var_83_0 = true
	end

	if var_83_0 then
		local var_83_1 = getProxy(PlayerProxy):getRawData()

		PlayerPrefs.SetInt(arg_83_1 .. var_83_1.id, arg_83_2)
		PlayerPrefs.Save()
	end
end

function var_0_0.getLastMap(arg_84_0, arg_84_1)
	local var_84_0 = getProxy(PlayerProxy):getRawData()
	local var_84_1 = PlayerPrefs.GetInt(arg_84_1 .. var_84_0.id)

	if var_84_1 ~= 0 then
		return var_84_1
	end
end

function var_0_0.IsActivitySPChapterActive(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_0:getMapsByActivities(arg_85_1)
	local var_85_1 = _.reduce(var_85_0, {}, function(arg_86_0, arg_86_1)
		table.insertto(arg_86_0, _.select(arg_86_1:getChapters(), function(arg_87_0)
			return arg_87_0:IsSpChapter()
		end))

		return arg_86_0
	end)

	return _.any(var_85_1, function(arg_88_0)
		return arg_88_0:isUnlock() and arg_88_0:isPlayerLVUnlock() and arg_88_0:enoughTimes2Start()
	end)
end

function var_0_0.getSubAidFlag(arg_89_0, arg_89_1)
	local var_89_0 = ys.Battle.BattleConst.SubAidFlag
	local var_89_1 = arg_89_0.fleet
	local var_89_2 = false
	local var_89_3 = _.detect(arg_89_0.fleets, function(arg_90_0)
		return arg_90_0:getFleetType() == FleetType.Submarine and arg_90_0:isValid()
	end)

	if var_89_3 then
		if var_89_3:inHuntingRange(var_89_1.line.row, var_89_1.line.column) then
			var_89_2 = true
		else
			local var_89_4 = var_89_3:getStrategies()
			local var_89_5 = _.detect(var_89_4, function(arg_91_0)
				return arg_91_0.id == ChapterConst.StrategyCallSubOutofRange
			end)

			if var_89_5 and var_89_5.count > 0 then
				var_89_2 = true
			end
		end
	end

	if var_89_2 then
		local var_89_6 = getProxy(PlayerProxy):getRawData()
		local var_89_7, var_89_8 = arg_89_0:getFleetCost(var_89_1, arg_89_1)
		local var_89_9, var_89_10 = arg_89_0:getFleetAmmo(var_89_3)
		local var_89_11 = 0

		for iter_89_0, iter_89_1 in ipairs({
			arg_89_0:getFleetCost(var_89_3, arg_89_1)
		}) do
			var_89_11 = var_89_11 + iter_89_1.oil
		end

		if var_89_10 <= 0 then
			return var_89_0.AMMO_EMPTY
		elseif var_89_11 + var_89_8.oil >= var_89_6.oil then
			return var_89_0.OIL_EMPTY
		else
			return true, var_89_3
		end
	else
		return var_89_0.AID_EMPTY
	end
end

function var_0_0.GetChapterAuraBuffs(arg_92_0)
	local var_92_0 = {}

	for iter_92_0, iter_92_1 in ipairs(arg_92_0.fleets) do
		if iter_92_1:getFleetType() ~= FleetType.Support then
			local var_92_1 = iter_92_1:getMapAura()

			for iter_92_2, iter_92_3 in ipairs(var_92_1) do
				table.insert(var_92_0, iter_92_3)
			end
		end
	end

	return var_92_0
end

function var_0_0.GetChapterAidBuffs(arg_93_0)
	local var_93_0 = {}

	for iter_93_0, iter_93_1 in ipairs(arg_93_0.fleets) do
		if iter_93_1 ~= arg_93_0.fleet and iter_93_1:getFleetType() ~= FleetType.Support then
			local var_93_1 = iter_93_1:getMapAid()

			for iter_93_2, iter_93_3 in pairs(var_93_1) do
				var_93_0[iter_93_2] = iter_93_3
			end
		end
	end

	return var_93_0
end

function var_0_0.RecordComboHistory(arg_94_0, arg_94_1, arg_94_2)
	if arg_94_2 ~= nil then
		arg_94_0:SetExtendChapterData(arg_94_1, "comboHistoryBuffer", arg_94_2)
	else
		arg_94_0:RemoveExtendChapterData(arg_94_1, "comboHistoryBuffer")
	end
end

function var_0_0.GetComboHistory(arg_95_0, arg_95_1)
	return arg_95_0:GetExtendChapterData(arg_95_1, "comboHistoryBuffer")
end

function var_0_0.RecordJustClearChapters(arg_96_0, arg_96_1, arg_96_2)
	if arg_96_2 ~= nil then
		arg_96_0:SetExtendChapterData(arg_96_1, "justClearChapters", arg_96_2)
	else
		arg_96_0:RemoveExtendChapterData(arg_96_1, "justClearChapters")
	end
end

function var_0_0.GetJustClearChapters(arg_97_0, arg_97_1)
	return arg_97_0:GetExtendChapterData(arg_97_1, "justClearChapters")
end

function var_0_0.RecordLastDefeatedEnemy(arg_98_0, arg_98_1, arg_98_2)
	if arg_98_2 ~= nil then
		arg_98_0:SetExtendChapterData(arg_98_1, "defeatedEnemiesBuffer", arg_98_2)
	else
		arg_98_0:RemoveExtendChapterData(arg_98_1, "defeatedEnemiesBuffer")
	end
end

function var_0_0.GetLastDefeatedEnemy(arg_99_0, arg_99_1)
	return arg_99_0:GetExtendChapterData(arg_99_1, "defeatedEnemiesBuffer")
end

function var_0_0.ifShowRemasterTip(arg_100_0)
	return arg_100_0.remasterTip
end

function var_0_0.setRemasterTip(arg_101_0, arg_101_1)
	arg_101_0.remasterTip = arg_101_1
end

function var_0_0.updateRemasterTicketsNum(arg_102_0, arg_102_1)
	arg_102_0.remasterTickets = arg_102_1
end

function var_0_0.resetDailyCount(arg_103_0)
	arg_103_0.remasterDailyCount = 0
end

function var_0_0.updateDailyCount(arg_104_0)
	arg_104_0.remasterDailyCount = arg_104_0.remasterDailyCount + pg.gameset.reactivity_ticket_daily.key_value
end

function var_0_0.GetSkipPrecombat(arg_105_0)
	if arg_105_0.skipPrecombat == nil then
		arg_105_0.skipPrecombat = PlayerPrefs.GetInt("chapter_skip_precombat", 0)
	end

	return arg_105_0.skipPrecombat > 0
end

function var_0_0.UpdateSkipPrecombat(arg_106_0, arg_106_1)
	arg_106_1 = tobool(arg_106_1) and 1 or 0

	if arg_106_1 ~= arg_106_0:GetSkipPrecombat() then
		PlayerPrefs.SetInt("chapter_skip_precombat", arg_106_1)

		arg_106_0.skipPrecombat = arg_106_1

		arg_106_0:sendNotification(var_0_0.CHAPTER_SKIP_PRECOMBAT_UPDATED, arg_106_1)
	end
end

function var_0_0.GetChapterAutoFlag(arg_107_0, arg_107_1)
	return arg_107_0:GetExtendChapterData(arg_107_1, "AutoFightFlag")
end

function var_0_0.SetChapterAutoFlag(arg_108_0, arg_108_1, arg_108_2, arg_108_3)
	arg_108_2 = tobool(arg_108_2)

	if arg_108_2 == (arg_108_0:GetChapterAutoFlag(arg_108_1) == 1) then
		return
	end

	arg_108_0:SetExtendChapterData(arg_108_1, "AutoFightFlag", arg_108_2 and 1 or 0)

	if arg_108_2 then
		arg_108_0:UpdateSkipPrecombat(true)

		if AutoBotCommand.autoBotSatisfied() then
			PlayerPrefs.SetInt("autoBotIsAcitve" .. AutoBotCommand.GetAutoBotMark(), 1)
		end

		getProxy(MetaCharacterProxy):setMetaTacticsInfoOnStart()
		pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(true)

		if not LOCK_BATTERY_SAVEMODE and PlayerPrefs.GetInt(AUTOFIGHT_BATTERY_SAVEMODE, 0) == 1 and pg.BrightnessMgr.GetInstance():IsPermissionGranted() then
			pg.BrightnessMgr.GetInstance():EnterManualMode()

			if PlayerPrefs.GetInt(AUTOFIGHT_DOWN_FRAME, 0) == 1 then
				getProxy(SettingsProxy):RecordFrameRate()

				Application.targetFrameRate = 30
			end
		end
	else
		arg_108_0:StopContinuousOperation(SYSTEM_SCENARIO, arg_108_3)
		pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(false)

		if not LOCK_BATTERY_SAVEMODE then
			pg.BrightnessMgr.GetInstance():ExitManualMode()
			getProxy(SettingsProxy):RestoreFrameRate()
		end
	end

	arg_108_0.facade:sendNotification(var_0_0.CHAPTER_AUTO_FIGHT_FLAG_UPDATED, arg_108_2 and 1 or 0)
	arg_108_0.facade:sendNotification(PlayerResUI.CHANGE_TOUCH_ABLE, not arg_108_2)
end

function var_0_0.StopAutoFight(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_0:getActiveChapter(true)

	if not var_109_0 then
		return
	end

	arg_109_0:SetChapterAutoFlag(var_109_0.id, false, arg_109_1)
end

function var_0_0.FinishAutoFight(arg_110_0, arg_110_1)
	if arg_110_0:GetChapterAutoFlag(arg_110_1) == 1 then
		pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(false)

		if not LOCK_BATTERY_SAVEMODE then
			pg.BrightnessMgr.GetInstance():ExitManualMode()
			getProxy(SettingsProxy):RestoreFrameRate()
		end

		arg_110_0.facade:sendNotification(PlayerResUI.CHANGE_TOUCH_ABLE, true)
	end

	local var_110_0 = arg_110_0:GetExtendChapter(arg_110_1)

	arg_110_0:RemoveExtendChapter(arg_110_1)

	return var_110_0
end

function var_0_0.buildRemasterInfo(arg_111_0)
	arg_111_0.remasterInfo = {}

	for iter_111_0, iter_111_1 in ipairs(pg.re_map_template.all) do
		for iter_111_2, iter_111_3 in ipairs(pg.re_map_template[iter_111_1].drop_gain) do
			if #iter_111_3 > 0 then
				local var_111_0, var_111_1, var_111_2, var_111_3 = unpack(iter_111_3)

				arg_111_0.remasterInfo[var_111_0] = defaultValue(arg_111_0.remasterInfo[var_111_0], {})
				arg_111_0.remasterInfo[var_111_0][iter_111_2] = {
					count = 0,
					receive = false,
					max = var_111_3
				}
			end
		end
	end
end

function var_0_0.checkRemasterInfomation(arg_112_0)
	if not arg_112_0.checkRemaster then
		arg_112_0.checkRemaster = true

		arg_112_0:sendNotification(GAME.CHAPTER_REMASTER_INFO_REQUEST)
	end
end

function var_0_0.addRemasterPassCount(arg_113_0, arg_113_1)
	if not arg_113_0.remasterInfo[arg_113_1] then
		return
	end

	local var_113_0

	for iter_113_0, iter_113_1 in pairs(arg_113_0.remasterInfo[arg_113_1]) do
		if iter_113_1.count < iter_113_1.max then
			iter_113_1.count = iter_113_1.count + 1
			var_113_0 = true
		end
	end

	if var_113_0 then
		arg_113_0:sendNotification(var_0_0.CHAPTER_REMASTER_INFO_UPDATED)
	end
end

function var_0_0.markRemasterPassReceive(arg_114_0, arg_114_1, arg_114_2)
	local var_114_0 = arg_114_0.remasterInfo[arg_114_1][arg_114_2]

	if not arg_114_0.remasterInfo[arg_114_1][arg_114_2] then
		return
	end

	if not var_114_0.receive then
		var_114_0.receive = true

		arg_114_0:sendNotification(var_0_0.CHAPTER_REMASTER_INFO_UPDATED)
	end
end

function var_0_0.anyRemasterAwardCanReceive(arg_115_0)
	for iter_115_0, iter_115_1 in pairs(arg_115_0.remasterInfo) do
		for iter_115_2, iter_115_3 in pairs(iter_115_1) do
			if not iter_115_3.receive and iter_115_3.count >= iter_115_3.max then
				return true
			end
		end
	end

	return false
end

function var_0_0.AddActBossRewards(arg_116_0, arg_116_1)
	arg_116_0.actBossItems = arg_116_0.actBossItems or {}

	table.insertto(arg_116_0.actBossItems, arg_116_1)
end

function var_0_0.PopActBossRewards(arg_117_0)
	local var_117_0 = arg_117_0.actBossItems or {}

	arg_117_0.actBossItems = nil

	return var_117_0
end

function var_0_0.AddBossSingleRewards(arg_118_0, arg_118_1)
	arg_118_0.bossSingleItems = arg_118_0.bossSingleItems or {}

	table.insertto(arg_118_0.bossSingleItems, arg_118_1)
end

function var_0_0.PopBossSingleRewards(arg_119_0)
	local var_119_0 = arg_119_0.bossSingleItems or {}

	arg_119_0.bossSingleItems = nil

	return var_119_0
end

function var_0_0.WriteBackOnExitBattleResult(arg_120_0)
	local var_120_0 = arg_120_0:getActiveChapter()

	if var_120_0 then
		if var_120_0:existOni() then
			var_120_0:clearSubmarineFleet()
			arg_120_0:updateChapter(var_120_0)
		elseif var_120_0:isPlayingWithBombEnemy() then
			var_120_0.fleets = {
				var_120_0.fleet
			}
			var_120_0.findex = 1

			arg_120_0:updateChapter(var_120_0)
		end
	end
end

function var_0_0.GetContinuousData(arg_121_0, arg_121_1)
	return arg_121_0.continuousData[arg_121_1]
end

function var_0_0.InitContinuousTime(arg_122_0, arg_122_1, arg_122_2)
	local var_122_0 = ContinuousOperationRuntimeData.New({
		system = arg_122_1,
		totalBattleTime = arg_122_2,
		battleTime = arg_122_2
	})

	arg_122_0.continuousData[arg_122_1] = var_122_0
end

function var_0_0.StopContinuousOperation(arg_123_0, arg_123_1, arg_123_2)
	local var_123_0 = arg_123_0:GetContinuousData(arg_123_1)

	if not var_123_0 or not var_123_0:IsActive() then
		return
	end

	if arg_123_2 == ChapterConst.AUTOFIGHT_STOP_REASON.MANUAL and arg_123_1 == SYSTEM_SCENARIO then
		pg.TipsMgr.GetInstance():ShowTips(i18n("multiple_sorties_stop"))
	end

	var_123_0:Stop(arg_123_2)
end

function var_0_0.PopContinuousData(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_0.continuousData[arg_124_1]

	arg_124_0.continuousData[arg_124_1] = nil

	return var_124_0
end

function var_0_0.SetLastFleetIndex(arg_125_0, arg_125_1, arg_125_2)
	if arg_125_2 and arg_125_0.lastFleetIndex then
		return
	end

	arg_125_0.lastFleetIndex = arg_125_1
end

function var_0_0.GetLastFleetIndex(arg_126_0)
	return arg_126_0.lastFleetIndex
end

return var_0_0
