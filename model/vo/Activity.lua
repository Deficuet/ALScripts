local var_0_0 = class("Activity", import(".BaseVO"))
local var_0_1

function var_0_0.GetType2Class()
	if var_0_1 then
		return var_0_1
	end

	var_0_1 = {
		[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = BeatMonterNianActivity,
		[ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT] = CollectionEventActivity,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = ReturnerActivity,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = BuildingBuffActivity,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = BuildingBuff2Activity,
		[ActivityConst.ACTIVITY_TYPE_ATELIER_LINK] = AtelierActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = ActivityBossActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = BossRushActivity,
		[ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK] = BossRushRankActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = CollabrateBossRushActivity,
		[ActivityConst.ACTIVITY_TYPE_WORKBENCH] = WorkBenchActivity,
		[ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG] = VirtualBagActivity,
		[ActivityConst.ACTIVITY_TYPE_SCULPTURE] = SculptureActivity,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = SpringActivity,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = Spring2Activity,
		[ActivityConst.ACTIVITY_TYPE_TASK_RYZA] = ActivityTaskActivity,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = PuzzleActivity,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON] = SkinCouponActivity,
		[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = ManualSignActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = BossSingleActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = BossSingleVariableActivity,
		[ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE] = SingleEventActivity,
		[ActivityConst.ACTIVITY_TYPE_LINER] = LinerActivity,
		[ActivityConst.ACTIVITY_TYPE_TOWN] = TownActivity,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = AirFightActivity,
		[ActivityConst.ACTIVITY_TYPE_NOT_TRACEABLE] = NotTraceableTaskActivity,
		[ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA] = VirtualBagActivity,
		[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = VirtualBagActivity,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_DRAW_AWARD] = DrawAwardActivity
	}

	return var_0_1
end

function var_0_0.Create(arg_2_0)
	local var_2_0 = pg.activity_template[arg_2_0.id]

	return (var_0_0.GetType2Class()[var_2_0.type] or Activity).New(arg_2_0)
end

function var_0_0.Ctor(arg_3_0, arg_3_1)
	arg_3_0.id = arg_3_1.id
	arg_3_0.configId = arg_3_0.id
	arg_3_0.stopTime = arg_3_1.stop_time
	arg_3_0.data1 = defaultValue(arg_3_1.data1, 0)
	arg_3_0.data2 = defaultValue(arg_3_1.data2, 0)
	arg_3_0.data3 = defaultValue(arg_3_1.data3, 0)
	arg_3_0.data4 = defaultValue(arg_3_1.data4, 0)
	arg_3_0.str_data1 = defaultValue(arg_3_1.str_data1, "")
	arg_3_0.data1_list = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.data1_list or {}) do
		table.insert(arg_3_0.data1_list, iter_3_1)
	end

	arg_3_0.data2_list = {}

	for iter_3_2, iter_3_3 in ipairs(arg_3_1.data2_list or {}) do
		table.insert(arg_3_0.data2_list, iter_3_3)
	end

	arg_3_0.data3_list = {}

	for iter_3_4, iter_3_5 in ipairs(arg_3_1.data3_list or {}) do
		table.insert(arg_3_0.data3_list, iter_3_5)
	end

	arg_3_0.data4_list = {}

	for iter_3_6, iter_3_7 in ipairs(arg_3_1.data4_list or {}) do
		table.insert(arg_3_0.data4_list, iter_3_7)
	end

	arg_3_0.data1KeyValueList = {}

	for iter_3_8, iter_3_9 in ipairs(arg_3_1.date1_key_value_list or {}) do
		arg_3_0.data1KeyValueList[iter_3_9.key] = {}

		for iter_3_10, iter_3_11 in ipairs(iter_3_9.value_list or {}) do
			arg_3_0.data1KeyValueList[iter_3_9.key][iter_3_11.key] = iter_3_11.value
		end
	end

	arg_3_0.buffList = {}

	for iter_3_12, iter_3_13 in ipairs(arg_3_1.buff_list or {}) do
		table.insert(arg_3_0.buffList, ActivityBuff.New(arg_3_0.id, iter_3_13.id, iter_3_13.timestamp))
	end

	if arg_3_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_NEWSERVER_SHOP then
		arg_3_0.data2KeyValueList = {}

		for iter_3_14, iter_3_15 in ipairs(arg_3_1.date1_key_value_list or {}) do
			local var_3_0 = iter_3_15.key
			local var_3_1 = iter_3_15.value

			arg_3_0.data2KeyValueList[var_3_0] = {}
			arg_3_0.data2KeyValueList[var_3_0].value = var_3_1
			arg_3_0.data2KeyValueList[var_3_0].dataMap = {}

			for iter_3_16, iter_3_17 in ipairs(iter_3_15.value_list or {}) do
				local var_3_2 = iter_3_17.key
				local var_3_3 = iter_3_17.value

				arg_3_0.data2KeyValueList[var_3_0].dataMap[var_3_2] = var_3_3
			end
		end
	end

	arg_3_0.clientData1 = 0
	arg_3_0.clientList = {}
end

function var_0_0.GetBuffList(arg_4_0)
	return arg_4_0.buffList
end

function var_0_0.AddBuff(arg_5_0, arg_5_1)
	assert(isa(arg_5_1, ActivityBuff), "activityBuff should instance of ActivityBuff")
	table.insert(arg_5_0.buffList, arg_5_1)
end

function var_0_0.setClientList(arg_6_0, arg_6_1)
	arg_6_0.clientList = arg_6_1
end

function var_0_0.getClientList(arg_7_0)
	return arg_7_0.clientList
end

function var_0_0.updateDataList(arg_8_0, arg_8_1)
	table.insert(arg_8_0.data1_list, arg_8_1)
end

function var_0_0.setDataList(arg_9_0, arg_9_1)
	arg_9_0.data1_list = arg_9_1
end

function var_0_0.updateKVPList(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not arg_10_0.data1KeyValueList[arg_10_1] then
		arg_10_0.data1KeyValueList[arg_10_1] = {}
	end

	arg_10_0.data1KeyValueList[arg_10_1][arg_10_2] = arg_10_3
end

function var_0_0.getKVPList(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_0.data1KeyValueList[arg_11_1] then
		arg_11_0.data1KeyValueList[arg_11_1] = {}
	end

	return arg_11_0.data1KeyValueList[arg_11_1][arg_11_2] or 0
end

function var_0_0.getData1(arg_12_0)
	return arg_12_0.data1
end

function var_0_0.getData2(arg_13_0)
	return arg_13_0.data2
end

function var_0_0.getData3(arg_14_0)
	return arg_14_0.data3
end

function var_0_0.getStrData1(arg_15_0)
	return arg_15_0.str_data1
end

function var_0_0.getData1List(arg_16_0)
	return arg_16_0.data1_list
end

function var_0_0.bindConfigTable(arg_17_0)
	return pg.activity_template
end

function var_0_0.getDataConfigTable(arg_18_0)
	local var_18_0 = arg_18_0:getConfig("type")
	local var_18_1 = arg_18_0:getConfig("config_id")

	if var_18_0 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
		return pg.activity_event_monopoly[tonumber(var_18_1)]
	elseif var_18_0 == ActivityConst.ACTIVITY_TYPE_PIZZA_PT or var_18_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		return pg.activity_event_pt[tonumber(var_18_1)]
	elseif var_18_0 == ActivityConst.ACTIVITY_TYPE_VOTE then
		return pg.activity_vote[tonumber(var_18_1)]
	end
end

function var_0_0.getDataConfig(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0:getDataConfigTable()

	assert(var_19_0, "miss config : " .. arg_19_0.id)

	return var_19_0 and var_19_0[arg_19_1]
end

function var_0_0.getIslandConfigTable(arg_20_0)
	return pg.island_activity_template[arg_20_0.configId]
end

function var_0_0.getIslandConfig(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:getIslandConfigTable()

	assert(var_21_0, "miss config : " .. arg_21_0.id)

	return var_21_0 and var_21_0[arg_21_1] or arg_21_0:getConfig(arg_21_1)
end

function var_0_0.isIslandShow(arg_22_0)
	return arg_22_0:getIslandConfigTable() and arg_22_0:getIslandConfig("is_show") > 0
end

function var_0_0.isEnd(arg_23_0)
	return arg_23_0.stopTime > 0 and pg.TimeMgr.GetInstance():GetServerTime() >= arg_23_0.stopTime
end

function var_0_0.increaseUsedCount(arg_24_0, arg_24_1)
	if arg_24_1 == 1 then
		arg_24_0.data1 = arg_24_0.data1 + 1
	elseif arg_24_1 == 2 then
		arg_24_0.data2 = arg_24_0.data2 + 1
	end
end

function var_0_0.readyToAchieve(arg_25_0)
	local var_25_0, var_25_1 = arg_25_0:IsShowTipById()

	if var_25_0 then
		return var_25_1
	end

	var_0_0.readyToAchieveDic = var_0_0.readyToAchieveDic or {
		[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function(arg_26_0)
			local var_26_0 = os.difftime(pg.TimeMgr.GetInstance():GetServerTime(), arg_26_0.data3)

			return math.ceil(var_26_0 / 86400) > arg_26_0.data2 and arg_26_0.data2 < arg_26_0:getConfig("config_data")[4]
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = function(arg_27_0)
			local var_27_0 = getProxy(PlayerProxy):getRawData()
			local var_27_1 = pg.activity_level_award[arg_27_0:getConfig("config_id")]

			for iter_27_0 = 1, #var_27_1.front_drops do
				local var_27_2 = var_27_1.front_drops[iter_27_0][1]

				if var_27_2 <= var_27_0.level and not _.include(arg_27_0.data1_list, var_27_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function(arg_28_0)
			local var_28_0 = getProxy(PlayerProxy):getRawData()
			local var_28_1 = pg.activity_event_chapter_award[arg_28_0:getConfig("config_id")]

			for iter_28_0 = 1, #var_28_1.chapter do
				local var_28_2 = var_28_1.chapter[iter_28_0]

				if getProxy(ChapterProxy):isClear(var_28_2) and not _.include(arg_28_0.data1_list, var_28_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASKS] = function(arg_29_0)
			local var_29_0 = getProxy(TaskProxy)
			local var_29_1 = _.flatten(arg_29_0:getConfig("config_data"))

			if _.any(var_29_1, function(arg_30_0)
				local var_30_0 = var_29_0:getTaskById(arg_30_0)

				return var_30_0 and var_30_0:isFinish() and not var_30_0:isReceive()
			end) then
				return true
			end

			local var_29_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

			if var_29_2 and not var_29_2:isEnd() and var_29_2:getConfig("config_client").linkActID == arg_29_0.id and var_29_2:readyToAchieve() then
				return true
			end

			if arg_29_0:getConfig("config_client") and arg_29_0:getConfig("config_client").decodeGameId then
				local var_29_3 = arg_29_0:getConfig("config_client").decodeGameId
				local var_29_4 = getProxy(MiniGameProxy):GetHubByGameId(var_29_3)

				if var_29_4 then
					local var_29_5 = arg_29_0:getConfig("config_data")
					local var_29_6 = var_29_5[#var_29_5]
					local var_29_7 = _.all(var_29_6, function(arg_31_0)
						return getProxy(TaskProxy):getFinishTaskById(arg_31_0) ~= nil
					end)

					if var_29_4.ultimate <= 0 and var_29_7 then
						return true
					end
				end
			end

			if arg_29_0:getConfig("config_client") and arg_29_0:getConfig("config_client").linkTaskPoolAct then
				local var_29_8 = arg_29_0:getConfig("config_client").linkTaskPoolAct
				local var_29_9 = getProxy(ActivityProxy):getActivityById(var_29_8)

				if var_29_9 and var_29_9:readyToAchieve() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_TASKS](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function(arg_33_0)
			local var_33_0 = arg_33_0:GetCountForHitMonster()

			return not (arg_33_0:GetDataConfig("hp") <= arg_33_0.data3) and var_33_0 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DODGEM] = function(arg_34_0)
			local var_34_0 = pg.TimeMgr.GetInstance()
			local var_34_1 = var_34_0:DiffDay(arg_34_0.data1, var_34_0:GetServerTime()) + 1
			local var_34_2 = arg_34_0:getConfig("config_id")

			if var_34_2 == 1 then
				return arg_34_0.data4 == 0 and arg_34_0.data2 >= 7 or defaultValue(arg_34_0.data2_list[1], 0) > 0 or defaultValue(arg_34_0.data2_list[2], 0) > 0 or arg_34_0.data2 < math.min(var_34_1, 7) or var_34_1 > arg_34_0.data3
			elseif var_34_2 == 2 then
				return arg_34_0.data4 == 0 and arg_34_0.data2 >= 7 or defaultValue(arg_34_0.data2_list[1], 0) > 0 or defaultValue(arg_34_0.data2_list[2], 0) > 0 or arg_34_0.data2 < math.min(var_34_1, 7)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function(arg_35_0)
			local var_35_0 = arg_35_0.data1
			local var_35_1 = arg_35_0.data1_list[1]
			local var_35_2 = arg_35_0.data1_list[2]
			local var_35_3 = arg_35_0.data2_list[1]
			local var_35_4 = arg_35_0.data2_list[2]
			local var_35_5 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_35_6 = math.ceil((var_35_5 - var_35_0) / 86400) * arg_35_0:getDataConfig("daily_time") + var_35_1 - var_35_2
			local var_35_7 = var_35_3 - var_35_4

			return var_35_6 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PIZZA_PT] = function(arg_36_0)
			local var_36_0 = ActivityPtData.New(arg_36_0):CanGetAward()
			local var_36_1 = true

			if arg_36_0:getConfig("config_client") then
				local var_36_2 = arg_36_0:getConfig("config_client").task_act_id

				if var_36_2 and var_36_2 ~= 0 and pg.activity_template[var_36_2] then
					local var_36_3 = pg.activity_template[var_36_2]
					local var_36_4 = _.flatten(var_36_3.config_data)

					if var_36_4 and #var_36_4 > 0 then
						local var_36_5 = getProxy(TaskProxy)

						for iter_36_0 = 1, #var_36_4 do
							local var_36_6 = var_36_5:getTaskById(var_36_4[iter_36_0])

							if var_36_6 and var_36_6:isFinish() then
								return true
							end
						end
					end
				end
			end

			local var_36_7 = false
			local var_36_8 = arg_36_0:getConfig("config_client").fireworkActID

			if var_36_8 and var_36_8 ~= 0 then
				local var_36_9 = getProxy(ActivityProxy):getActivityById(var_36_8)

				var_36_7 = var_36_9 and var_36_9:readyToAchieve() or false
			end

			local var_36_10 = arg_36_0:getConfig("config_client")[2]
			local var_36_11 = type(var_36_10) == "number" and ManualSignActivity.IsManualSignActAndAnyAwardCanGet(var_36_10)

			return var_36_0 and var_36_1 or var_36_7 or var_36_11
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_PIZZA_PT](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = function(arg_38_0)
			local var_38_0 = arg_38_0.data1

			if var_38_0 == 1 then
				local var_38_1 = pg.activity_template_headhunting[arg_38_0.id]
				local var_38_2 = var_38_1.target
				local var_38_3 = 0

				for iter_38_0, iter_38_1 in ipairs(arg_38_0:getClientList()) do
					var_38_3 = var_38_3 + iter_38_1:getPt()
				end

				local var_38_4 = 0

				for iter_38_2 = #var_38_2, 1, -1 do
					if table.contains(arg_38_0.data1_list, var_38_2[iter_38_2]) then
						var_38_4 = iter_38_2

						break
					end
				end

				local var_38_5 = var_38_1.drop_client
				local var_38_6 = math.min(var_38_4 + 1, #var_38_5)
				local var_38_7 = _.any(var_38_1.tasklist, function(arg_39_0)
					local var_39_0 = getProxy(TaskProxy):getTaskById(arg_39_0)

					return var_39_0 and var_39_0:isFinish() and not var_39_0:isReceive()
				end)

				return var_38_3 >= var_38_2[var_38_6] and var_38_4 ~= #var_38_5 or var_38_7
			elseif var_38_0 == 2 then
				local var_38_8 = getProxy(TaskProxy)
				local var_38_9 = pg.activity_template_returnner[arg_38_0.id]

				return _.any(_.flatten(var_38_9.task_list), function(arg_40_0)
					local var_40_0 = var_38_8:getTaskById(arg_40_0)

					return var_40_0 and var_40_0:isFinish()
				end)
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_41_0)
			local var_41_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_41_0:getConfig("config_id"))

			if var_41_0.count > 0 then
				return true
			end

			if var_41_0:getConfig("reward") ~= 0 and var_41_0.usedtime >= var_41_0:getConfig("reward_need") and var_41_0.ultimate == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function(arg_42_0)
			local var_42_0 = pg.activity_event_turning[arg_42_0:getConfig("config_id")]
			local var_42_1 = arg_42_0.data4

			if var_42_1 ~= 0 then
				local var_42_2 = var_42_0.task_table[var_42_1]
				local var_42_3 = getProxy(TaskProxy)

				for iter_42_0, iter_42_1 in ipairs(var_42_2) do
					if (var_42_3:getTaskById(iter_42_1) or var_42_3:getFinishTaskById(iter_42_1)):getTaskStatus() == 1 then
						return true
					end
				end

				local var_42_4 = pg.TimeMgr.GetInstance():DiffDay(arg_42_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_42_4, 1, pg.activity_event_turning[arg_42_0:getConfig("config_id")].total_num) > arg_42_0.data3 then
					for iter_42_2, iter_42_3 in ipairs(var_42_2) do
						if (var_42_3:getTaskById(iter_42_3) or var_42_3:getFinishTaskById(iter_42_3)):getTaskStatus() ~= 2 then
							return false
						end
					end

					return true
				end
			elseif var_42_1 == 0 then
				local var_42_5 = pg.TimeMgr.GetInstance():DiffDay(arg_42_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_42_5, 1, pg.activity_event_turning[arg_42_0:getConfig("config_id")].total_num) > arg_42_0.data3 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function(arg_43_0)
			return not (arg_43_0.data2 > 0)
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function(arg_44_0)
			local var_44_0 = arg_44_0:getConfig("config_client").story
			local var_44_1 = var_44_0 and #var_44_0 or 7
			local var_44_2 = pg.TimeMgr.GetInstance():DiffDay(arg_44_0.data3, pg.TimeMgr.GetInstance():GetServerTime()) + 1
			local var_44_3 = math.clamp(var_44_2, 1, var_44_1)
			local var_44_4 = pg.NewStoryMgr.GetInstance()
			local var_44_5 = math.clamp(arg_44_0.data2, 0, var_44_1)

			for iter_44_0 = 1, var_44_3 do
				local var_44_6 = var_44_0[iter_44_0][1]

				if var_44_6 and iter_44_0 <= var_44_5 and not var_44_4:IsPlayed(var_44_6) then
					return true
				end
			end

			if var_44_1 <= var_44_3 and var_44_1 <= arg_44_0.data2 and not (arg_44_0.data1 > 0) then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function(arg_45_0)
			local var_45_0 = arg_45_0:getConfig("config_client")[3]
			local var_45_1 = pg.TimeMgr.GetInstance()
			local var_45_2 = var_45_1:DiffDay(arg_45_0.data3, var_45_1:GetServerTime()) + 1 - arg_45_0.data2

			return math.clamp(var_45_2, 0, #var_45_0 - arg_45_0.data2) > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function(arg_46_0)
			local var_46_0 = arg_46_0:GetBuildingIds()

			for iter_46_0, iter_46_1 in ipairs(var_46_0) do
				local var_46_1 = arg_46_0:GetBuildingLevel(iter_46_1)
				local var_46_2 = pg.activity_event_building[iter_46_1]

				if var_46_2 and var_46_1 < #var_46_2.buff then
					local var_46_3 = var_46_2.material[var_46_1]

					if underscore.all(var_46_3, function(arg_47_0)
						local var_47_0 = arg_47_0[1]
						local var_47_1 = arg_47_0[2]
						local var_47_2 = arg_47_0[3]
						local var_47_3 = 0

						if var_47_0 == DROP_TYPE_VITEM then
							local var_47_4 = AcessWithinNull(Item.getConfigData(var_47_1), "link_id")

							assert(var_47_4 == arg_46_0.id)

							var_47_3 = arg_46_0:GetMaterialCount(var_47_1)
						elseif var_47_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_47_5 = AcessWithinNull(pg.activity_drop_type[var_47_0], "activity_id")

							assert(var_47_5)

							bagAct = getProxy(ActivityProxy):getActivityById(var_47_5)
							var_47_3 = bagAct:getVitemNumber(var_47_1)
						end

						return var_47_2 <= var_47_3
					end) then
						return true
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function(arg_48_0, ...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF](arg_48_0, ...) or arg_48_0:CanRequest()
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function(arg_49_0)
			if arg_49_0.data3 > 0 and arg_49_0.data1 ~= 0 then
				return true
			else
				for iter_49_0 = 1, #arg_49_0.data1_list do
					if not bit.band(arg_49_0.data1_list[iter_49_0], ActivityConst.EXPEDITION_TYPE_GOT) ~= 0 then
						if bit.band(arg_49_0.data1_list[iter_49_0], ActivityConst.EXPEDITION_TYPE_OPEN) ~= 0 then
							return true
						elseif bit.band(arg_49_0.data1_list[iter_49_0], ActivityConst.EXPEDITION_TYPE_BAOXIANG) ~= 0 then
							return true
						elseif bit.band(arg_49_0.data1_list[iter_49_0], ActivityConst.EXPEDITION_TYPE_BOSS) ~= 0 then
							return true
						end
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY] = function(arg_50_0)
			local var_50_0 = arg_50_0:getConfig("config_client")

			if var_50_0 and var_50_0.linkGameHubID then
				local var_50_1 = getProxy(MiniGameProxy):GetHubByHubId(var_50_0.linkGameHubID)

				if var_50_1 then
					if var_50_0.trimRed then
						if var_50_1.ultimate == 1 then
							return false
						end

						if var_50_1.usedtime == var_50_1:getConfig("reward_need") then
							return true
						end
					end

					return var_50_1.count > 0
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function(arg_51_0)
			return arg_51_0.data2 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function(arg_52_0)
			local var_52_0 = arg_52_0.data1_list
			local var_52_1 = arg_52_0.data2_list
			local var_52_2 = arg_52_0:GetPicturePuzzleIds()
			local var_52_3 = arg_52_0:getConfig("config_client").linkActID

			if var_52_3 then
				local var_52_4 = getProxy(ActivityProxy):getActivityById(var_52_3)

				if var_52_4 and var_52_4:readyToAchieve() then
					return true
				end
			end

			if _.any(var_52_2, function(arg_53_0)
				local var_53_0 = table.contains(var_52_1, arg_53_0)
				local var_53_1 = table.contains(var_52_0, arg_53_0)

				return not var_53_0 and var_53_1
			end) then
				return true
			end

			local var_52_5 = pg.activity_event_picturepuzzle[arg_52_0.id]

			if var_52_5 and var_52_5.chapter > 0 and arg_52_0.data1 < 1 then
				return true
			end

			if var_52_5 and #var_52_5.auto_finish_args > 0 and arg_52_0.data1 == 1 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = function(arg_54_0)
			return AirFightActivity.readyToAchieve(arg_54_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE] = function(arg_55_0)
			local var_55_0 = WorldInPictureActiviyData.New(arg_55_0)

			return not var_55_0:IsTravelAll() and var_55_0:GetTravelPoint() > 0 or var_55_0:GetDrawPoint() > 0 and var_55_0:AnyAreaCanDraw()
		end,
		[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function(arg_56_0)
			if arg_56_0.data1 == 0 then
				local var_56_0 = arg_56_0:getStartTime()
				local var_56_1 = pg.TimeMgr.GetInstance():GetServerTime()

				if arg_56_0:getConfig("config_client").autounlock <= var_56_1 - var_56_0 then
					return true
				end
			elseif arg_56_0.data1 ~= 0 and arg_56_0.data2 == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_POOL] = function(arg_57_0)
			local var_57_0 = arg_57_0:getConfig("config_data")
			local var_57_1 = getProxy(TaskProxy)

			if arg_57_0.data1 >= #var_57_0 then
				return false
			end

			local var_57_2 = pg.TimeMgr.GetInstance()
			local var_57_3 = (var_57_2:DiffDay(arg_57_0:getStartTime(), var_57_2:GetServerTime()) + 1) * arg_57_0:getConfig("config_id")

			var_57_3 = var_57_3 > #var_57_0 and #var_57_0 or var_57_3

			local var_57_4 = _.any(var_57_0, function(arg_58_0)
				local var_58_0 = var_57_1:getTaskById(arg_58_0)

				return var_58_0 and var_58_0:isFinish()
			end)

			return var_57_3 - arg_57_0.data1 > 0 and var_57_4
		end,
		[ActivityConst.ACTIVITY_TYPE_EVENT] = function(arg_59_0)
			local var_59_0 = getProxy(PlayerProxy):getData().id

			return PlayerPrefs.GetInt("ACTIVITY_TYPE_EVENT_" .. arg_59_0.id .. "_" .. var_59_0) == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function(arg_60_0)
			if arg_60_0.data2 and arg_60_0.data2 <= 0 and arg_60_0.data1 >= pg.activity_event_avatarframe[arg_60_0:getConfig("config_id")].target then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function(arg_61_0)
			local var_61_0, var_61_1 = arg_61_0:GetUpgradeCost()

			if arg_61_0:GetSlotCount() < arg_61_0:GetTotalSlotCount() and var_61_1 <= arg_61_0:GetCoins() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function(arg_62_0)
			local var_62_0 = arg_62_0:getConfig("config_data")[2][1]
			local var_62_1 = arg_62_0:getConfig("config_data")[2][2]
			local var_62_2 = getProxy(PlayerProxy):getRawData():getResource(var_62_0)

			if arg_62_0.data1 > 0 and var_62_1 <= var_62_2 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FLOWER_FIELD] = function(arg_63_0)
			local var_63_0 = pg.TimeMgr.GetInstance()

			return var_63_0:GetServerTime() >= var_63_0:GetTimeToNextTime(math.max(arg_63_0.data1, arg_63_0.data2))
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND] = function(arg_64_0)
			for iter_64_0, iter_64_1 in pairs(getProxy(SixthAnniversaryIslandProxy):GetNodeDic()) do
				if iter_64_1:IsVisual() and iter_64_1:RedDotHint() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function(arg_65_0)
			return Spring2Activity.readyToAchieve(arg_65_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function(arg_66_0)
			local var_66_0 = #arg_66_0.data2_list
			local var_66_1 = arg_66_0:getData1List()
			local var_66_2 = arg_66_0:getConfig("config_data")[2]

			if #var_66_1 == #var_66_2 then
				return false
			end

			local function var_66_3()
				for iter_67_0, iter_67_1 in ipairs(var_66_2) do
					if not table.contains(var_66_1, iter_67_1[1]) and var_66_0 >= iter_67_1[1] then
						return true
					end
				end

				return false
			end

			local function var_66_4()
				local var_68_0 = getProxy(PlayerProxy):getData().id

				return PlayerPrefs.GetInt("DAY_TIP_" .. arg_66_0.id .. "_" .. var_68_0 .. "_" .. arg_66_0:getDayIndex()) == 0
			end

			return var_66_3() or var_66_4()
		end,
		[ActivityConst.ACTIVITY_TYPE_SURVEY] = function(arg_69_0)
			local var_69_0, var_69_1 = getProxy(ActivityProxy):isSurveyOpen()
			local var_69_2 = getProxy(ActivityProxy):isSurveyDone()

			return var_69_0 and not var_69_2 and not SurveyPage.IsEverEnter(var_69_1)
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function(arg_70_0)
			return LaunchBallActivityMgr.GetInvitationAble(arg_70_0.id)
		end,
		[ActivityConst.ACTIVITY_TYPE_GIFT_UP] = function(arg_71_0)
			local var_71_0 = arg_71_0:getConfig("config_client").gifts[2]
			local var_71_1 = math.min(#var_71_0, arg_71_0:getNDay())

			return underscore(var_71_0):chain():first(var_71_1):any(function(arg_72_0)
				local var_72_0 = getProxy(ShopsProxy):GetGiftCommodity(arg_72_0, Goods.TYPE_GIFT_PACKAGE)

				return var_72_0:canPurchase() and var_72_0:inTime() and not var_72_0:IsGroupLimit()
			end):value()
		end,
		[ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE] = function(arg_73_0)
			if getProxy(ShopsProxy):getActivityShops() == nil then
				return false
			end

			local var_73_0 = arg_73_0:getConfig("config_client")
			local var_73_1 = getProxy(PlayerProxy):getData():getResource(var_73_0.uPtId)
			local var_73_2 = #var_73_0.goodsId + 1
			local var_73_3 = var_73_2 - _.reduce(var_73_0.goodsId, 0, function(arg_74_0, arg_74_1)
				return arg_74_0 + getProxy(ShopsProxy):getActivityShopById(var_73_0.shopId):GetCommodityById(arg_74_1):GetPurchasableCnt()
			end)
			local var_73_4 = var_73_3 < var_73_2 and pg.activity_shop_template[var_73_0.goodsId[var_73_3]] or nil

			return var_73_3 < var_73_2 and var_73_1 >= var_73_4.resource_num
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING] = function(arg_75_0)
			return arg_75_0:getData1() > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DAILY_STAGE_BONUS] = function(arg_76_0)
			return arg_76_0:NeedLoginRedPoint()
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_RYZA] = function(arg_77_0)
			local var_77_0 = getProxy(ActivityTaskProxy):getTaskById(arg_77_0.id)

			for iter_77_0, iter_77_1 in ipairs(var_77_0) do
				if iter_77_1:getTaskStatus() == 1 then
					return true
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_78_0)
			local var_78_0 = arg_78_0:getConfig("config_id")

			if getProxy(MiniGameProxy):GetHubByHubId(var_78_0).count > 0 then
				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function(arg_79_0)
			local var_79_0 = arg_79_0:getConfig("config_id")
			local var_79_1 = pg.activity_7_day_sign[var_79_0].front_drops
			local var_79_2 = pg.TimeMgr.GetInstance()
			local var_79_3 = var_79_2:GetServerTime()

			return arg_79_0.data1 < #var_79_1 and not var_79_2:IsSameDay(var_79_3, arg_79_0.data2) and var_79_3 > arg_79_0.data2
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_HEI5] = function(arg_80_0)
			return #arg_80_0:GetHei5UnreceiveAward() > 0
		end
	}

	if switch(arg_25_0:getConfig("type"), var_0_0.readyToAchieveDic, nil, arg_25_0) then
		return true
	elseif arg_25_0:getConfig("config_client").sub_act_id then
		local var_25_2 = getProxy(ActivityProxy):getActivityById(arg_25_0:getConfig("config_client").sub_act_id)

		return var_25_2 and not var_25_2:isEnd() and var_25_2:readyToAchieve()
	else
		return false
	end
end

function var_0_0.IsShowTipById(arg_81_0)
	var_0_0.ShowTipTableById = var_0_0.ShowTipTableById or {
		[ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE] = function()
			local var_82_0 = getProxy(SkirmishProxy)

			var_82_0:UpdateSkirmishProgress()

			local var_82_1 = var_82_0:getRawData()
			local var_82_2 = 0
			local var_82_3 = 0

			for iter_82_0, iter_82_1 in ipairs(var_82_1) do
				local var_82_4 = iter_82_1:GetState()

				var_82_2 = var_82_4 > SkirmishVO.StateInactive and var_82_2 + 1 or var_82_2
				var_82_3 = var_82_4 == SkirmishVO.StateClear and var_82_3 + 1 or var_82_3
			end

			return var_82_3 < var_82_2
		end,
		[ActivityConst.POCKY_SKIN_LOGIN] = function()
			local var_83_0 = arg_81_0:getConfig("config_client").linkids
			local var_83_1 = getProxy(TaskProxy)
			local var_83_2 = getProxy(ActivityProxy)
			local var_83_3 = var_83_2:getActivityById(var_83_0[1])
			local var_83_4 = var_83_2:getActivityById(var_83_0[2])
			local var_83_5 = var_83_2:getActivityById(var_83_0[3])

			assert(var_83_3 and var_83_4 and var_83_5)

			local function var_83_6()
				return var_83_3 and var_83_3:readyToAchieve()
			end

			local function var_83_7()
				return var_83_4 and var_83_4:readyToAchieve()
			end

			local function var_83_8()
				local var_86_0 = _.flatten(arg_81_0:getConfig("config_data"))

				for iter_86_0 = 1, math.min(#var_86_0, var_83_4.data3) do
					local var_86_1 = var_86_0[iter_86_0]
					local var_86_2 = var_83_1:getTaskById(var_86_1)

					if var_86_2 and var_86_2:isFinish() and not var_86_2:isReceive() then
						return true
					end
				end
			end

			local function var_83_9()
				if not (var_83_5 and var_83_5:readyToAchieve()) or not var_83_3 then
					return false
				end

				local var_87_0 = ActivityPtData.New(var_83_3)

				return var_87_0.level >= #var_87_0.targets
			end

			return var_83_8() or var_83_6() or var_83_7() or var_83_9()
		end,
		[ActivityConst.TOWERCLIMBING_SIGN] = function()
			local var_88_0 = getProxy(MiniGameProxy):GetHubByHubId(9)
			local var_88_1 = var_88_0.ultimate
			local var_88_2 = var_88_0:getConfig("reward_need")
			local var_88_3 = var_88_0.usedtime

			return var_88_1 == 0 and var_88_2 <= var_88_3
		end,
		[pg.activity_const.NEWYEAR_SNACK_PAGE_ID.act_id] = NewYearSnackPage.IsTip,
		[ActivityConst.WWF_TASK_ID] = WWFPtPage.IsShowRed,
		[ActivityConst.NEWMEIXIV4_SKIRMISH_ID] = NewMeixiV4SkirmishPage.IsShowRed,
		[ActivityConst.JIUJIU_YOYO_ID] = JiujiuYoyoPage.IsShowRed,
		[ActivityConst.SENRANKAGURA_TRAIN_ACT_ID] = SenrankaguraTrainScene.IsShowRed,
		[ActivityConst.DORM_SIGN_ID] = DormSignPage.IsShowRed,
		[ActivityConst.DORM_SIGN_ID_2] = DormSignTwoPage.IsShowRed,
		[ActivityConst.ISLAND_SIGN_ID] = IslandSignPage.IsShowRed,
		[ActivityConst.GOASTSTORYACTIVITY_ID] = GhostSkinPageLayer.IsShowRed,
		[ActivityConst.YUMIA_BASE_ACT_ID] = YoumiyaStrongholdLayer.ShouldShowTip,
		[ActivityConst.NINJA_CITY_MAIN_ACTIVITY_ID] = function()
			if CityRebuildBookLayer.ShouldShowTip() or CityRebuildTasksLayer.ShouldShowTip() then
				return true
			end

			return false
		end,
		[ActivityConst.SAILING_SHIP_3_SKIN_ACT_ID] = SailingShip3SkinLayer.ShouldShowTip,
		[ActivityConst.HelenaPT_ACT_ID] = function()
			local var_90_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.HelenaPT_ACT_ID)

			return HelenaScenarioPage:IsShowRed(var_90_0)
		end
	}

	local var_81_0 = var_0_0.ShowTipTableById[arg_81_0.id]

	return tobool(var_81_0), var_81_0 and var_81_0()
end

function var_0_0.isShow(arg_91_0)
	if LOCK_SKIN_US then
		local var_91_0 = pg.gameset.levellimit_skinstory.key_value
		local var_91_1 = pg.gameset.levellimit_skinstory.description

		if var_91_0 >= getProxy(PlayerProxy):getRawData().level and table.contains(var_91_1, arg_91_0.id) then
			return false
		end
	end

	local var_91_2 = arg_91_0:getConfig("page_info")

	if arg_91_0:getConfig("is_show") <= 0 then
		return false
	elseif underscore.any({
		var_91_2.ui_name,
		var_91_2.ui_name2
	}, function(arg_92_0)
		return not checkABExist(string.format("ui/%s", arg_92_0))
	end) then
		warning(string.format("activity:%d without ui:%s", arg_91_0.id, table.concat({
			var_91_2.ui_name,
			var_91_2.ui_name2
		}, " or ")))

		return false
	end

	if arg_91_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return arg_91_0.data1 ~= 0
	elseif arg_91_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY then
		local var_91_3 = arg_91_0:getConfig("config_client").display_link

		if var_91_3 then
			return underscore.any(var_91_3, function(arg_93_0)
				return arg_93_0[2] == 0 or pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_93_0[2]].time)
			end)
		end
	elseif arg_91_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SURVEY then
		local var_91_4 = getProxy(ActivityProxy)
		local var_91_5 = var_91_4:isSurveyOpen()
		local var_91_6 = var_91_4:isSurveyDone()

		return var_91_5 and not var_91_6
	elseif arg_91_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE then
		if getProxy(ShopsProxy):getActivityShops() == nil then
			return false
		end

		local var_91_7 = arg_91_0:getConfig("config_client")
		local var_91_8 = getProxy(PlayerProxy):getData():getResource(var_91_7.uPtId)
		local var_91_9 = #var_91_7.goodsId + 1

		return var_91_9 > var_91_9 - _.reduce(var_91_7.goodsId, 0, function(arg_94_0, arg_94_1)
			return arg_94_0 + getProxy(ShopsProxy):getActivityShopById(var_91_7.shopId):GetCommodityById(arg_94_1):GetPurchasableCnt()
		end)
	elseif arg_91_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_RYZA and table.contains({
		ActivityConst.DORM_SIGN_ID,
		ActivityConst.DORM_SIGN_ID_2
	}, arg_91_0:getConfig("id")) then
		return #getProxy(ActivityProxy):getActivityById(arg_91_0:getConfig("id")):getConfig("config_data") ~= #getProxy(ActivityTaskProxy):getFinishTaskById(arg_91_0:getConfig("id"))
	end

	return true
end

function var_0_0.isAfterShow(arg_95_0)
	if arg_95_0.configId == ActivityConst.UR_TASK_ACT_ID or arg_95_0.configId == ActivityConst.SPECIAL_WEAPON_ACT_ID then
		local var_95_0 = getProxy(TaskProxy)

		return underscore.all(arg_95_0:getConfig("config_data")[1], function(arg_96_0)
			local var_96_0 = var_95_0:getTaskVO(arg_96_0)

			return var_96_0 and var_96_0:isReceive()
		end)
	end

	return false
end

function var_0_0.getShowPriority(arg_97_0)
	return arg_97_0:getConfig("is_show")
end

function var_0_0.isCorePage(arg_98_0, arg_98_1)
	return arg_98_0:getConfig("page_core") == arg_98_1
end

function var_0_0.left4Day(arg_99_0)
	if arg_99_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function var_0_0.getAwardInfos(arg_100_0)
	return arg_100_0.data1KeyValueList or {}
end

function var_0_0.updateData(arg_101_0, arg_101_1, arg_101_2)
	if arg_101_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not arg_101_0:getAwardInfos()[arg_101_1] then
			arg_101_0.data1KeyValueList[arg_101_1] = {}
		end

		for iter_101_0, iter_101_1 in ipairs(arg_101_2) do
			if arg_101_0.data1KeyValueList[arg_101_1][iter_101_1] then
				arg_101_0.data1KeyValueList[arg_101_1][iter_101_1] = arg_101_0.data1KeyValueList[arg_101_1][iter_101_1] + 1
			else
				arg_101_0.data1KeyValueList[arg_101_1][iter_101_1] = 1
			end
		end
	end
end

function var_0_0.getTaskShip(arg_102_0)
	return arg_102_0:getConfig("config_client")[1]
end

function var_0_0.getNotificationMsg(arg_103_0)
	local var_103_0 = arg_103_0:getConfig("type")
	local var_103_1 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if var_103_0 == ActivityConst.ACTIVITY_TYPE_SHOP or var_103_0 == ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE then
		var_103_1 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif var_103_0 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		var_103_1 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif var_103_0 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		var_103_1 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif var_103_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS or var_103_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER then
		var_103_1 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return var_103_1
end

function var_0_0.getDayIndex(arg_104_0)
	local var_104_0 = arg_104_0:getStartTime()
	local var_104_1 = pg.TimeMgr.GetInstance()
	local var_104_2 = var_104_1:GetServerTime()

	return var_104_1:DiffDay(var_104_0, var_104_2) + 1
end

function var_0_0.getStartTime(arg_105_0)
	local var_105_0, var_105_1 = parseTimeConfig(arg_105_0:getConfig("time"))

	if var_105_1 and var_105_1[1] == "newuser" then
		return arg_105_0.stopTime - var_105_1[3] * 86400
	else
		return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_105_0[2])
	end
end

function var_0_0.getNDay(arg_106_0, arg_106_1)
	arg_106_1 = arg_106_1 or arg_106_0:getStartTime()

	local var_106_0 = pg.TimeMgr.GetInstance()

	return var_106_0:DiffDay(arg_106_1, var_106_0:GetServerTime()) + 1
end

function var_0_0.isVariableTime(arg_107_0)
	local var_107_0, var_107_1 = parseTimeConfig(arg_107_0:getConfig("time"))

	return var_107_1 and var_107_1[1] == "newuser"
end

function var_0_0.setSpecialData(arg_108_0, arg_108_1, arg_108_2)
	arg_108_0.speciaData = arg_108_0.speciaData and arg_108_0.speciaData or {}
	arg_108_0.speciaData[arg_108_1] = arg_108_2
end

function var_0_0.getSpecialData(arg_109_0, arg_109_1)
	return arg_109_0.speciaData and arg_109_0.speciaData[arg_109_1] and arg_109_0.speciaData[arg_109_1] or nil
end

function var_0_0.canPermanentFinish(arg_110_0)
	local var_110_0 = arg_110_0:getConfig("type")

	if var_110_0 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		local var_110_1 = arg_110_0:getConfig("config_data")
		local var_110_2 = getProxy(TaskProxy)

		return underscore.all(underscore.flatten({
			var_110_1[#var_110_1]
		}), function(arg_111_0)
			return var_110_2:getFinishTaskById(arg_111_0) ~= nil
		end)
	elseif var_110_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		local var_110_3 = ActivityPtData.New(arg_110_0)

		return var_110_3.level >= #var_110_3.targets
	end

	return false
end

function var_0_0.GetShopTime(arg_112_0)
	local var_112_0 = pg.TimeMgr.GetInstance()
	local var_112_1 = arg_112_0:getStartTime()
	local var_112_2 = arg_112_0.stopTime

	return var_112_0:STimeDescS(var_112_1, "%y.%m.%d") .. " - " .. var_112_0:STimeDescS(var_112_2, "%y.%m.%d")
end

function var_0_0.GetCrusingUnreceiveAward(arg_113_0)
	assert(arg_113_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_113_0 = pg.battlepass_event_pt[arg_113_0.id]
	local var_113_1 = {}
	local var_113_2 = {}

	for iter_113_0, iter_113_1 in ipairs(arg_113_0.data1_list) do
		var_113_2[iter_113_1] = true
	end

	for iter_113_2, iter_113_3 in ipairs(var_113_0.target) do
		if iter_113_3 > arg_113_0.data1 then
			break
		elseif not var_113_2[iter_113_3] then
			table.insert(var_113_1, Drop.Create(pg.battlepass_event_award[var_113_0.award[iter_113_2]].drop_client))
		end
	end

	if arg_113_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_113_1)
	end

	local var_113_3 = {}

	for iter_113_4, iter_113_5 in ipairs(arg_113_0.data2_list) do
		var_113_3[iter_113_5] = true
	end

	for iter_113_6, iter_113_7 in ipairs(var_113_0.target) do
		if iter_113_7 > arg_113_0.data1 then
			break
		elseif not var_113_3[iter_113_7] then
			table.insert(var_113_1, Drop.Create(pg.battlepass_event_award[var_113_0.award_pay[iter_113_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_113_1)
end

function var_0_0.GetCrusingInfo(arg_114_0)
	assert(arg_114_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_114_0 = pg.battlepass_event_pt[arg_114_0.id]
	local var_114_1 = var_114_0.pt
	local var_114_2 = {}
	local var_114_3 = {}

	for iter_114_0, iter_114_1 in ipairs(var_114_0.key_point_display) do
		var_114_3[iter_114_1] = true
	end

	for iter_114_2, iter_114_3 in ipairs(var_114_0.target) do
		table.insert(var_114_2, {
			id = iter_114_2,
			pt = iter_114_3,
			award = pg.battlepass_event_award[var_114_0.award[iter_114_2]].drop_client,
			award_pay = pg.battlepass_event_award[var_114_0.award_pay[iter_114_2]].drop_client,
			isImportent = var_114_3[iter_114_2]
		})
	end

	local var_114_4 = arg_114_0.data1
	local var_114_5 = arg_114_0.data2 == 1
	local var_114_6 = {}

	for iter_114_4, iter_114_5 in ipairs(arg_114_0.data1_list) do
		var_114_6[iter_114_5] = true
	end

	local var_114_7 = {}

	for iter_114_6, iter_114_7 in ipairs(arg_114_0.data2_list) do
		var_114_7[iter_114_7] = true
	end

	local var_114_8 = 0

	for iter_114_8, iter_114_9 in ipairs(var_114_2) do
		if var_114_4 < iter_114_9.pt then
			break
		else
			var_114_8 = iter_114_8
		end
	end

	return {
		ptId = var_114_1,
		awardList = var_114_2,
		pt = var_114_4,
		isPay = var_114_5,
		awardDic = var_114_6,
		awardPayDic = var_114_7,
		phase = var_114_8
	}
end

function var_0_0.GetHei5Info(arg_115_0)
	local var_115_0 = pg.black_friday_battlepass_event_pt[arg_115_0.id]
	local var_115_1 = var_115_0.pt
	local var_115_2 = {}
	local var_115_3 = {}

	for iter_115_0, iter_115_1 in ipairs(var_115_0.key_point_display) do
		var_115_3[iter_115_1] = true
	end

	for iter_115_2, iter_115_3 in ipairs(var_115_0.target) do
		table.insert(var_115_2, {
			id = iter_115_2,
			pt = iter_115_3,
			award = pg.black_friday_battlepass_event_award[var_115_0.award[iter_115_2]].drop_client,
			award_pay = pg.black_friday_battlepass_event_award[var_115_0.award_pay[iter_115_2]].drop_client,
			isImportent = var_115_3[iter_115_2]
		})
	end

	local var_115_4 = arg_115_0.data1
	local var_115_5 = arg_115_0.data2 == 1
	local var_115_6 = {}

	for iter_115_4, iter_115_5 in ipairs(arg_115_0.data1_list) do
		var_115_6[iter_115_5] = true
	end

	local var_115_7 = {}

	for iter_115_6, iter_115_7 in ipairs(arg_115_0.data2_list) do
		var_115_7[iter_115_7] = true
	end

	local var_115_8 = 0

	for iter_115_8, iter_115_9 in ipairs(var_115_2) do
		if var_115_4 < iter_115_9.pt then
			break
		else
			var_115_8 = iter_115_8
		end
	end

	return {
		ptId = var_115_1,
		awardList = var_115_2,
		pt = var_115_4,
		isPay = var_115_5,
		awardDic = var_115_6,
		awardPayDic = var_115_7,
		phase = var_115_8
	}
end

function var_0_0.GetHei5UnreceiveAward(arg_116_0)
	local var_116_0 = pg.black_friday_battlepass_event_pt[arg_116_0.id]
	local var_116_1 = {}
	local var_116_2 = {}

	for iter_116_0, iter_116_1 in ipairs(arg_116_0.data1_list) do
		var_116_2[iter_116_1] = true
	end

	for iter_116_2, iter_116_3 in ipairs(var_116_0.target) do
		if iter_116_3 > arg_116_0.data1 then
			break
		elseif not var_116_2[iter_116_3] then
			table.insert(var_116_1, Drop.Create(pg.black_friday_battlepass_event_award[var_116_0.award[iter_116_2]].drop_client))
		end
	end

	if arg_116_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_116_1)
	end

	local var_116_3 = {}

	for iter_116_4, iter_116_5 in ipairs(arg_116_0.data2_list) do
		var_116_3[iter_116_5] = true
	end

	for iter_116_6, iter_116_7 in ipairs(var_116_0.target) do
		if iter_116_7 > arg_116_0.data1 then
			break
		elseif not var_116_3[iter_116_7] then
			table.insert(var_116_1, Drop.Create(pg.black_friday_battlepass_event_award[var_116_0.award_pay[iter_116_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_116_1)
end

function var_0_0.IsActivityReady(arg_117_0)
	return arg_117_0 and not arg_117_0:isEnd() and arg_117_0:readyToAchieve()
end

function var_0_0.NeedLoginRedPoint(arg_118_0)
	return PlayerPrefs.GetString(arg_118_0:GetLoginRedPointKey(), "") ~= arg_118_0:GetLoginRedPointValue()
end

function var_0_0.SetLoginRedPoint(arg_119_0)
	PlayerPrefs.SetString(arg_119_0:GetLoginRedPointKey(), arg_119_0:GetLoginRedPointValue())
end

function var_0_0.GetLoginRedPointValue(arg_120_0)
	return pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
end

function var_0_0.GetLoginRedPointKey(arg_121_0)
	local var_121_0 = arg_121_0:GetPlayerID()

	return string.format("%s_%s", var_121_0, arg_121_0.id)
end

function var_0_0.GetPlayerID(arg_122_0)
	return getProxy(PlayerProxy):getPlayerId()
end

function var_0_0.GetConfigClientSetting(arg_123_0, arg_123_1)
	return arg_123_0:getConfig("config_client")[arg_123_1]
end

return var_0_0
