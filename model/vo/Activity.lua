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
		[ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA] = VirtualBagActivity
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

function var_0_0.isEnd(arg_20_0)
	return arg_20_0.stopTime > 0 and pg.TimeMgr.GetInstance():GetServerTime() >= arg_20_0.stopTime
end

function var_0_0.increaseUsedCount(arg_21_0, arg_21_1)
	if arg_21_1 == 1 then
		arg_21_0.data1 = arg_21_0.data1 + 1
	elseif arg_21_1 == 2 then
		arg_21_0.data2 = arg_21_0.data2 + 1
	end
end

function var_0_0.readyToAchieve(arg_22_0)
	local var_22_0, var_22_1 = arg_22_0:IsShowTipById()

	if var_22_0 then
		return var_22_1
	end

	var_0_0.readyToAchieveDic = var_0_0.readyToAchieveDic or {
		[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function(arg_23_0)
			local var_23_0 = os.difftime(pg.TimeMgr.GetInstance():GetServerTime(), arg_23_0.data3)

			return math.ceil(var_23_0 / 86400) > arg_23_0.data2 and arg_23_0.data2 < arg_23_0:getConfig("config_data")[4]
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = function(arg_24_0)
			local var_24_0 = getProxy(PlayerProxy):getRawData()
			local var_24_1 = pg.activity_level_award[arg_24_0:getConfig("config_id")]

			for iter_24_0 = 1, #var_24_1.front_drops do
				local var_24_2 = var_24_1.front_drops[iter_24_0][1]

				if var_24_2 <= var_24_0.level and not _.include(arg_24_0.data1_list, var_24_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function(arg_25_0)
			local var_25_0 = getProxy(PlayerProxy):getRawData()
			local var_25_1 = pg.activity_event_chapter_award[arg_25_0:getConfig("config_id")]

			for iter_25_0 = 1, #var_25_1.chapter do
				local var_25_2 = var_25_1.chapter[iter_25_0]

				if getProxy(ChapterProxy):isClear(var_25_2) and not _.include(arg_25_0.data1_list, var_25_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASKS] = function(arg_26_0)
			local var_26_0 = getProxy(TaskProxy)
			local var_26_1 = _.flatten(arg_26_0:getConfig("config_data"))

			if _.any(var_26_1, function(arg_27_0)
				local var_27_0 = var_26_0:getTaskById(arg_27_0)

				return var_27_0 and var_27_0:isFinish() and not var_27_0:isReceive()
			end) then
				return true
			end

			local var_26_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

			if var_26_2 and not var_26_2:isEnd() and var_26_2:getConfig("config_client").linkActID == arg_26_0.id and var_26_2:readyToAchieve() then
				return true
			end

			if arg_26_0:getConfig("config_client") and arg_26_0:getConfig("config_client").decodeGameId then
				local var_26_3 = arg_26_0:getConfig("config_client").decodeGameId
				local var_26_4 = getProxy(MiniGameProxy):GetHubByGameId(var_26_3)

				if var_26_4 then
					local var_26_5 = arg_26_0:getConfig("config_data")
					local var_26_6 = var_26_5[#var_26_5]
					local var_26_7 = _.all(var_26_6, function(arg_28_0)
						return getProxy(TaskProxy):getFinishTaskById(arg_28_0) ~= nil
					end)

					if var_26_4.ultimate <= 0 and var_26_7 then
						return true
					end
				end
			end

			if arg_26_0:getConfig("config_client") and arg_26_0:getConfig("config_client").linkTaskPoolAct then
				local var_26_8 = arg_26_0:getConfig("config_client").linkTaskPoolAct
				local var_26_9 = getProxy(ActivityProxy):getActivityById(var_26_8)

				if var_26_9 and var_26_9:readyToAchieve() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_TASKS](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function(arg_30_0)
			local var_30_0 = arg_30_0:GetCountForHitMonster()

			return not (arg_30_0:GetDataConfig("hp") <= arg_30_0.data3) and var_30_0 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DODGEM] = function(arg_31_0)
			local var_31_0 = pg.TimeMgr.GetInstance()
			local var_31_1 = var_31_0:DiffDay(arg_31_0.data1, var_31_0:GetServerTime()) + 1
			local var_31_2 = arg_31_0:getConfig("config_id")

			if var_31_2 == 1 then
				return arg_31_0.data4 == 0 and arg_31_0.data2 >= 7 or defaultValue(arg_31_0.data2_list[1], 0) > 0 or defaultValue(arg_31_0.data2_list[2], 0) > 0 or arg_31_0.data2 < math.min(var_31_1, 7) or var_31_1 > arg_31_0.data3
			elseif var_31_2 == 2 then
				return arg_31_0.data4 == 0 and arg_31_0.data2 >= 7 or defaultValue(arg_31_0.data2_list[1], 0) > 0 or defaultValue(arg_31_0.data2_list[2], 0) > 0 or arg_31_0.data2 < math.min(var_31_1, 7)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function(arg_32_0)
			local var_32_0 = arg_32_0.data1
			local var_32_1 = arg_32_0.data1_list[1]
			local var_32_2 = arg_32_0.data1_list[2]
			local var_32_3 = arg_32_0.data2_list[1]
			local var_32_4 = arg_32_0.data2_list[2]
			local var_32_5 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_32_6 = math.ceil((var_32_5 - var_32_0) / 86400) * arg_32_0:getDataConfig("daily_time") + var_32_1 - var_32_2
			local var_32_7 = var_32_3 - var_32_4

			return var_32_6 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PIZZA_PT] = function(arg_33_0)
			local var_33_0 = ActivityPtData.New(arg_33_0):CanGetAward()
			local var_33_1 = true

			if arg_33_0:getConfig("config_client") then
				local var_33_2 = arg_33_0:getConfig("config_client").task_act_id

				if var_33_2 and var_33_2 ~= 0 and pg.activity_template[var_33_2] then
					local var_33_3 = pg.activity_template[var_33_2]
					local var_33_4 = _.flatten(var_33_3.config_data)

					if var_33_4 and #var_33_4 > 0 then
						local var_33_5 = getProxy(TaskProxy)

						for iter_33_0 = 1, #var_33_4 do
							local var_33_6 = var_33_5:getTaskById(var_33_4[iter_33_0])

							if var_33_6 and var_33_6:isFinish() then
								return true
							end
						end
					end
				end
			end

			local var_33_7 = false
			local var_33_8 = arg_33_0:getConfig("config_client").fireworkActID

			if var_33_8 and var_33_8 ~= 0 then
				local var_33_9 = getProxy(ActivityProxy):getActivityById(var_33_8)

				var_33_7 = var_33_9 and var_33_9:readyToAchieve() or false
			end

			local var_33_10 = arg_33_0:getConfig("config_client")[2]
			local var_33_11 = type(var_33_10) == "number" and ManualSignActivity.IsManualSignActAndAnyAwardCanGet(var_33_10)

			return var_33_0 and var_33_1 or var_33_7 or var_33_11
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_PIZZA_PT](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = function(arg_35_0)
			local var_35_0 = arg_35_0.data1

			if var_35_0 == 1 then
				local var_35_1 = pg.activity_template_headhunting[arg_35_0.id]
				local var_35_2 = var_35_1.target
				local var_35_3 = 0

				for iter_35_0, iter_35_1 in ipairs(arg_35_0:getClientList()) do
					var_35_3 = var_35_3 + iter_35_1:getPt()
				end

				local var_35_4 = 0

				for iter_35_2 = #var_35_2, 1, -1 do
					if table.contains(arg_35_0.data1_list, var_35_2[iter_35_2]) then
						var_35_4 = iter_35_2

						break
					end
				end

				local var_35_5 = var_35_1.drop_client
				local var_35_6 = math.min(var_35_4 + 1, #var_35_5)
				local var_35_7 = _.any(var_35_1.tasklist, function(arg_36_0)
					local var_36_0 = getProxy(TaskProxy):getTaskById(arg_36_0)

					return var_36_0 and var_36_0:isFinish() and not var_36_0:isReceive()
				end)

				return var_35_3 >= var_35_2[var_35_6] and var_35_4 ~= #var_35_5 or var_35_7
			elseif var_35_0 == 2 then
				local var_35_8 = getProxy(TaskProxy)
				local var_35_9 = pg.activity_template_returnner[arg_35_0.id]

				return _.any(_.flatten(var_35_9.task_list), function(arg_37_0)
					local var_37_0 = var_35_8:getTaskById(arg_37_0)

					return var_37_0 and var_37_0:isFinish()
				end)
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_38_0)
			local var_38_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_38_0:getConfig("config_id"))

			if var_38_0.count > 0 then
				return true
			end

			if var_38_0:getConfig("reward") ~= 0 and var_38_0.usedtime >= var_38_0:getConfig("reward_need") and var_38_0.ultimate == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function(arg_39_0)
			local var_39_0 = pg.activity_event_turning[arg_39_0:getConfig("config_id")]
			local var_39_1 = arg_39_0.data4

			if var_39_1 ~= 0 then
				local var_39_2 = var_39_0.task_table[var_39_1]
				local var_39_3 = getProxy(TaskProxy)

				for iter_39_0, iter_39_1 in ipairs(var_39_2) do
					if (var_39_3:getTaskById(iter_39_1) or var_39_3:getFinishTaskById(iter_39_1)):getTaskStatus() == 1 then
						return true
					end
				end

				local var_39_4 = pg.TimeMgr.GetInstance():DiffDay(arg_39_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_39_4, 1, pg.activity_event_turning[arg_39_0:getConfig("config_id")].total_num) > arg_39_0.data3 then
					for iter_39_2, iter_39_3 in ipairs(var_39_2) do
						if (var_39_3:getTaskById(iter_39_3) or var_39_3:getFinishTaskById(iter_39_3)):getTaskStatus() ~= 2 then
							return false
						end
					end

					return true
				end
			elseif var_39_1 == 0 then
				local var_39_5 = pg.TimeMgr.GetInstance():DiffDay(arg_39_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_39_5, 1, pg.activity_event_turning[arg_39_0:getConfig("config_id")].total_num) > arg_39_0.data3 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function(arg_40_0)
			return not (arg_40_0.data2 > 0)
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function(arg_41_0)
			local var_41_0 = arg_41_0:getConfig("config_client").story
			local var_41_1 = var_41_0 and #var_41_0 or 7
			local var_41_2 = pg.TimeMgr.GetInstance():DiffDay(arg_41_0.data3, pg.TimeMgr.GetInstance():GetServerTime()) + 1
			local var_41_3 = math.clamp(var_41_2, 1, var_41_1)
			local var_41_4 = pg.NewStoryMgr.GetInstance()
			local var_41_5 = math.clamp(arg_41_0.data2, 0, var_41_1)

			for iter_41_0 = 1, var_41_3 do
				local var_41_6 = var_41_0[iter_41_0][1]

				if var_41_6 and iter_41_0 <= var_41_5 and not var_41_4:IsPlayed(var_41_6) then
					return true
				end
			end

			if var_41_1 <= var_41_3 and var_41_1 <= arg_41_0.data2 and not (arg_41_0.data1 > 0) then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function(arg_42_0)
			local var_42_0 = arg_42_0:getConfig("config_client")[3]
			local var_42_1 = pg.TimeMgr.GetInstance()
			local var_42_2 = var_42_1:DiffDay(arg_42_0.data3, var_42_1:GetServerTime()) + 1 - arg_42_0.data2

			return math.clamp(var_42_2, 0, #var_42_0 - arg_42_0.data2) > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function(arg_43_0)
			local var_43_0 = arg_43_0:GetBuildingIds()

			for iter_43_0, iter_43_1 in ipairs(var_43_0) do
				local var_43_1 = arg_43_0:GetBuildingLevel(iter_43_1)
				local var_43_2 = pg.activity_event_building[iter_43_1]

				if var_43_2 and var_43_1 < #var_43_2.buff then
					local var_43_3 = var_43_2.material[var_43_1]

					if underscore.all(var_43_3, function(arg_44_0)
						local var_44_0 = arg_44_0[1]
						local var_44_1 = arg_44_0[2]
						local var_44_2 = arg_44_0[3]
						local var_44_3 = 0

						if var_44_0 == DROP_TYPE_VITEM then
							local var_44_4 = AcessWithinNull(Item.getConfigData(var_44_1), "link_id")

							assert(var_44_4 == arg_43_0.id)

							var_44_3 = arg_43_0:GetMaterialCount(var_44_1)
						elseif var_44_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_44_5 = AcessWithinNull(pg.activity_drop_type[var_44_0], "activity_id")

							assert(var_44_5)

							bagAct = getProxy(ActivityProxy):getActivityById(var_44_5)
							var_44_3 = bagAct:getVitemNumber(var_44_1)
						end

						return var_44_2 <= var_44_3
					end) then
						return true
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function(arg_45_0, ...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF](arg_45_0, ...) or arg_45_0:CanRequest()
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function(arg_46_0)
			if arg_46_0.data3 > 0 and arg_46_0.data1 ~= 0 then
				return true
			else
				for iter_46_0 = 1, #arg_46_0.data1_list do
					if not bit.band(arg_46_0.data1_list[iter_46_0], ActivityConst.EXPEDITION_TYPE_GOT) ~= 0 then
						if bit.band(arg_46_0.data1_list[iter_46_0], ActivityConst.EXPEDITION_TYPE_OPEN) ~= 0 then
							return true
						elseif bit.band(arg_46_0.data1_list[iter_46_0], ActivityConst.EXPEDITION_TYPE_BAOXIANG) ~= 0 then
							return true
						elseif bit.band(arg_46_0.data1_list[iter_46_0], ActivityConst.EXPEDITION_TYPE_BOSS) ~= 0 then
							return true
						end
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY] = function(arg_47_0)
			local var_47_0 = arg_47_0:getConfig("config_client")

			if var_47_0 and var_47_0.linkGameHubID then
				local var_47_1 = getProxy(MiniGameProxy):GetHubByHubId(var_47_0.linkGameHubID)

				if var_47_1 then
					if var_47_0.trimRed then
						if var_47_1.ultimate == 1 then
							return false
						end

						if var_47_1.usedtime == var_47_1:getConfig("reward_need") then
							return true
						end
					end

					return var_47_1.count > 0
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function(arg_48_0)
			return arg_48_0.data2 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function(arg_49_0)
			local var_49_0 = arg_49_0.data1_list
			local var_49_1 = arg_49_0.data2_list
			local var_49_2 = arg_49_0:GetPicturePuzzleIds()
			local var_49_3 = arg_49_0:getConfig("config_client").linkActID

			if var_49_3 then
				local var_49_4 = getProxy(ActivityProxy):getActivityById(var_49_3)

				if var_49_4 and var_49_4:readyToAchieve() then
					return true
				end
			end

			if _.any(var_49_2, function(arg_50_0)
				local var_50_0 = table.contains(var_49_1, arg_50_0)
				local var_50_1 = table.contains(var_49_0, arg_50_0)

				return not var_50_0 and var_50_1
			end) then
				return true
			end

			local var_49_5 = pg.activity_event_picturepuzzle[arg_49_0.id]

			if var_49_5 and var_49_5.chapter > 0 and arg_49_0.data1 < 1 then
				return true
			end

			if var_49_5 and #var_49_5.auto_finish_args > 0 and arg_49_0.data1 == 1 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = function(arg_51_0)
			return AirFightActivity.readyToAchieve(arg_51_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE] = function(arg_52_0)
			local var_52_0 = WorldInPictureActiviyData.New(arg_52_0)

			return not var_52_0:IsTravelAll() and var_52_0:GetTravelPoint() > 0 or var_52_0:GetDrawPoint() > 0 and var_52_0:AnyAreaCanDraw()
		end,
		[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function(arg_53_0)
			if arg_53_0.data1 == 0 then
				local var_53_0 = arg_53_0:getStartTime()
				local var_53_1 = pg.TimeMgr.GetInstance():GetServerTime()

				if arg_53_0:getConfig("config_client").autounlock <= var_53_1 - var_53_0 then
					return true
				end
			elseif arg_53_0.data1 ~= 0 and arg_53_0.data2 == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_POOL] = function(arg_54_0)
			local var_54_0 = arg_54_0:getConfig("config_data")
			local var_54_1 = getProxy(TaskProxy)

			if arg_54_0.data1 >= #var_54_0 then
				return false
			end

			local var_54_2 = pg.TimeMgr.GetInstance()
			local var_54_3 = (var_54_2:DiffDay(arg_54_0:getStartTime(), var_54_2:GetServerTime()) + 1) * arg_54_0:getConfig("config_id")

			var_54_3 = var_54_3 > #var_54_0 and #var_54_0 or var_54_3

			local var_54_4 = _.any(var_54_0, function(arg_55_0)
				local var_55_0 = var_54_1:getTaskById(arg_55_0)

				return var_55_0 and var_55_0:isFinish()
			end)

			return var_54_3 - arg_54_0.data1 > 0 and var_54_4
		end,
		[ActivityConst.ACTIVITY_TYPE_EVENT] = function(arg_56_0)
			local var_56_0 = getProxy(PlayerProxy):getData().id

			return PlayerPrefs.GetInt("ACTIVITY_TYPE_EVENT_" .. arg_56_0.id .. "_" .. var_56_0) == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function(arg_57_0)
			if arg_57_0.data2 and arg_57_0.data2 <= 0 and arg_57_0.data1 >= pg.activity_event_avatarframe[arg_57_0:getConfig("config_id")].target then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function(arg_58_0)
			local var_58_0, var_58_1 = arg_58_0:GetUpgradeCost()

			if arg_58_0:GetSlotCount() < arg_58_0:GetTotalSlotCount() and var_58_1 <= arg_58_0:GetCoins() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function(arg_59_0)
			local var_59_0 = arg_59_0:getConfig("config_data")[2][1]
			local var_59_1 = arg_59_0:getConfig("config_data")[2][2]
			local var_59_2 = getProxy(PlayerProxy):getRawData():getResource(var_59_0)

			if arg_59_0.data1 > 0 and var_59_1 <= var_59_2 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FLOWER_FIELD] = function(arg_60_0)
			local var_60_0 = pg.TimeMgr.GetInstance()

			return var_60_0:GetServerTime() >= var_60_0:GetTimeToNextTime(math.max(arg_60_0.data1, arg_60_0.data2))
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND] = function(arg_61_0)
			for iter_61_0, iter_61_1 in pairs(getProxy(SixthAnniversaryIslandProxy):GetNodeDic()) do
				if iter_61_1:IsVisual() and iter_61_1:RedDotHint() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function(arg_62_0)
			return Spring2Activity.readyToAchieve(arg_62_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function(arg_63_0)
			local var_63_0 = #arg_63_0.data2_list
			local var_63_1 = arg_63_0:getData1List()
			local var_63_2 = arg_63_0:getConfig("config_data")[2]

			if #var_63_1 == #var_63_2 then
				return false
			end

			local function var_63_3()
				for iter_64_0, iter_64_1 in ipairs(var_63_2) do
					if not table.contains(var_63_1, iter_64_1[1]) and var_63_0 >= iter_64_1[1] then
						return true
					end
				end

				return false
			end

			local function var_63_4()
				local var_65_0 = getProxy(PlayerProxy):getData().id

				return PlayerPrefs.GetInt("DAY_TIP_" .. arg_63_0.id .. "_" .. var_65_0 .. "_" .. arg_63_0:getDayIndex()) == 0
			end

			return var_63_3() or var_63_4()
		end,
		[ActivityConst.ACTIVITY_TYPE_SURVEY] = function(arg_66_0)
			local var_66_0, var_66_1 = getProxy(ActivityProxy):isSurveyOpen()
			local var_66_2 = getProxy(ActivityProxy):isSurveyDone()

			return var_66_0 and not var_66_2 and not SurveyPage.IsEverEnter(var_66_1)
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function(arg_67_0)
			return LaunchBallActivityMgr.GetInvitationAble(arg_67_0.id)
		end,
		[ActivityConst.ACTIVITY_TYPE_GIFT_UP] = function(arg_68_0)
			local var_68_0 = arg_68_0:getConfig("config_client").gifts[2]
			local var_68_1 = math.min(#var_68_0, arg_68_0:getNDay())

			return underscore(var_68_0):chain():first(var_68_1):any(function(arg_69_0)
				local var_69_0 = getProxy(ShopsProxy):GetGiftCommodity(arg_69_0, Goods.TYPE_GIFT_PACKAGE)

				return var_69_0:canPurchase() and var_69_0:inTime() and not var_69_0:IsGroupLimit()
			end):value()
		end,
		[ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE] = function(arg_70_0)
			if getProxy(ShopsProxy):getActivityShops() == nil then
				return false
			end

			local var_70_0 = arg_70_0:getConfig("config_client")
			local var_70_1 = getProxy(PlayerProxy):getData():getResource(var_70_0.uPtId)
			local var_70_2 = #var_70_0.goodsId + 1
			local var_70_3 = var_70_2 - _.reduce(var_70_0.goodsId, 0, function(arg_71_0, arg_71_1)
				return arg_71_0 + getProxy(ShopsProxy):getActivityShopById(var_70_0.shopId):GetCommodityById(arg_71_1):GetPurchasableCnt()
			end)
			local var_70_4 = var_70_3 < var_70_2 and pg.activity_shop_template[var_70_0.goodsId[var_70_3]] or nil

			return var_70_3 < var_70_2 and var_70_1 >= var_70_4.resource_num
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING] = function(arg_72_0)
			return arg_72_0:getData1() > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DAILY_STAGE_BONUS] = function(arg_73_0)
			return arg_73_0:NeedLoginRedPoint()
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_RYZA] = function(arg_74_0)
			local var_74_0 = getProxy(ActivityTaskProxy):getTaskById(arg_74_0.id)

			for iter_74_0, iter_74_1 in ipairs(var_74_0) do
				if iter_74_1:getTaskStatus() == 1 then
					return true
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_75_0)
			local var_75_0 = arg_75_0:getConfig("config_id")

			if getProxy(MiniGameProxy):GetHubByHubId(var_75_0).count > 0 then
				return true
			end
		end
	}

	if switch(arg_22_0:getConfig("type"), var_0_0.readyToAchieveDic, nil, arg_22_0) then
		return true
	elseif arg_22_0:getConfig("config_client").sub_act_id then
		local var_22_2 = getProxy(ActivityProxy):getActivityById(arg_22_0:getConfig("config_client").sub_act_id)

		return var_22_2 and not var_22_2:isEnd() and var_22_2:readyToAchieve()
	else
		return false
	end
end

function var_0_0.IsShowTipById(arg_76_0)
	var_0_0.ShowTipTableById = var_0_0.ShowTipTableById or {
		[ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE] = function()
			local var_77_0 = getProxy(SkirmishProxy)

			var_77_0:UpdateSkirmishProgress()

			local var_77_1 = var_77_0:getRawData()
			local var_77_2 = 0
			local var_77_3 = 0

			for iter_77_0, iter_77_1 in ipairs(var_77_1) do
				local var_77_4 = iter_77_1:GetState()

				var_77_2 = var_77_4 > SkirmishVO.StateInactive and var_77_2 + 1 or var_77_2
				var_77_3 = var_77_4 == SkirmishVO.StateClear and var_77_3 + 1 or var_77_3
			end

			return var_77_3 < var_77_2
		end,
		[ActivityConst.POCKY_SKIN_LOGIN] = function()
			local var_78_0 = arg_76_0:getConfig("config_client").linkids
			local var_78_1 = getProxy(TaskProxy)
			local var_78_2 = getProxy(ActivityProxy)
			local var_78_3 = var_78_2:getActivityById(var_78_0[1])
			local var_78_4 = var_78_2:getActivityById(var_78_0[2])
			local var_78_5 = var_78_2:getActivityById(var_78_0[3])

			assert(var_78_3 and var_78_4 and var_78_5)

			local function var_78_6()
				return var_78_3 and var_78_3:readyToAchieve()
			end

			local function var_78_7()
				return var_78_4 and var_78_4:readyToAchieve()
			end

			local function var_78_8()
				local var_81_0 = _.flatten(arg_76_0:getConfig("config_data"))

				for iter_81_0 = 1, math.min(#var_81_0, var_78_4.data3) do
					local var_81_1 = var_81_0[iter_81_0]
					local var_81_2 = var_78_1:getTaskById(var_81_1)

					if var_81_2 and var_81_2:isFinish() and not var_81_2:isReceive() then
						return true
					end
				end
			end

			local function var_78_9()
				if not (var_78_5 and var_78_5:readyToAchieve()) or not var_78_3 then
					return false
				end

				local var_82_0 = ActivityPtData.New(var_78_3)

				return var_82_0.level >= #var_82_0.targets
			end

			return var_78_8() or var_78_6() or var_78_7() or var_78_9()
		end,
		[ActivityConst.TOWERCLIMBING_SIGN] = function()
			local var_83_0 = getProxy(MiniGameProxy):GetHubByHubId(9)
			local var_83_1 = var_83_0.ultimate
			local var_83_2 = var_83_0:getConfig("reward_need")
			local var_83_3 = var_83_0.usedtime

			return var_83_1 == 0 and var_83_2 <= var_83_3
		end,
		[pg.activity_const.NEWYEAR_SNACK_PAGE_ID.act_id] = NewYearSnackPage.IsTip,
		[ActivityConst.WWF_TASK_ID] = WWFPtPage.IsShowRed,
		[ActivityConst.NEWMEIXIV4_SKIRMISH_ID] = NewMeixiV4SkirmishPage.IsShowRed,
		[ActivityConst.JIUJIU_YOYO_ID] = JiujiuYoyoPage.IsShowRed,
		[ActivityConst.SENRANKAGURA_TRAIN_ACT_ID] = SenrankaguraTrainScene.IsShowRed,
		[ActivityConst.DORM_SIGN_ID] = DormSignPage.IsShowRed,
		[ActivityConst.DORM_SIGN_ID_2] = DormSignTwoPage.IsShowRed,
		[ActivityConst.GOASTSTORYACTIVITY_ID] = GhostSkinPageLayer.IsShowRed,
		[ActivityConst.YUMIA_BASE_ACT_ID] = YoumiyaStrongholdLayer.ShouldShowTip
	}

	local var_76_0 = var_0_0.ShowTipTableById[arg_76_0.id]

	return tobool(var_76_0), var_76_0 and var_76_0()
end

function var_0_0.isShow(arg_84_0)
	if LOCK_SKIN_US then
		local var_84_0 = pg.gameset.levellimit_skinstory.key_value
		local var_84_1 = pg.gameset.levellimit_skinstory.description

		if var_84_0 >= getProxy(PlayerProxy):getRawData().level and table.contains(var_84_1, arg_84_0.id) then
			return false
		end
	end

	local var_84_2 = arg_84_0:getConfig("page_info")

	if arg_84_0:getConfig("is_show") <= 0 then
		return false
	elseif underscore.any({
		var_84_2.ui_name,
		var_84_2.ui_name2
	}, function(arg_85_0)
		return not checkABExist(string.format("ui/%s", arg_85_0))
	end) then
		warning(string.format("activity:%d without ui:%s", arg_84_0.id, table.concat({
			var_84_2.ui_name,
			var_84_2.ui_name2
		}, " or ")))

		return false
	end

	if arg_84_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return arg_84_0.data1 ~= 0
	elseif arg_84_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY then
		local var_84_3 = arg_84_0:getConfig("config_client").display_link

		if var_84_3 then
			return underscore.any(var_84_3, function(arg_86_0)
				return arg_86_0[2] == 0 or pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_86_0[2]].time)
			end)
		end
	elseif arg_84_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SURVEY then
		local var_84_4 = getProxy(ActivityProxy)
		local var_84_5 = var_84_4:isSurveyOpen()
		local var_84_6 = var_84_4:isSurveyDone()

		return var_84_5 and not var_84_6
	elseif arg_84_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE then
		if getProxy(ShopsProxy):getActivityShops() == nil then
			return false
		end

		local var_84_7 = arg_84_0:getConfig("config_client")
		local var_84_8 = getProxy(PlayerProxy):getData():getResource(var_84_7.uPtId)
		local var_84_9 = #var_84_7.goodsId + 1

		return var_84_9 > var_84_9 - _.reduce(var_84_7.goodsId, 0, function(arg_87_0, arg_87_1)
			return arg_87_0 + getProxy(ShopsProxy):getActivityShopById(var_84_7.shopId):GetCommodityById(arg_87_1):GetPurchasableCnt()
		end)
	elseif arg_84_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_RYZA and table.contains({
		ActivityConst.DORM_SIGN_ID,
		ActivityConst.DORM_SIGN_ID_2
	}, arg_84_0:getConfig("id")) then
		return #getProxy(ActivityProxy):getActivityById(arg_84_0:getConfig("id")):getConfig("config_data") ~= #getProxy(ActivityTaskProxy):getFinishTaskById(arg_84_0:getConfig("id"))
	end

	return true
end

function var_0_0.isAfterShow(arg_88_0)
	if arg_88_0.configId == ActivityConst.UR_TASK_ACT_ID or arg_88_0.configId == ActivityConst.SPECIAL_WEAPON_ACT_ID then
		local var_88_0 = getProxy(TaskProxy)

		return underscore.all(arg_88_0:getConfig("config_data")[1], function(arg_89_0)
			local var_89_0 = var_88_0:getTaskVO(arg_89_0)

			return var_89_0 and var_89_0:isReceive()
		end)
	end

	return false
end

function var_0_0.getShowPriority(arg_90_0)
	return arg_90_0:getConfig("is_show")
end

function var_0_0.isCorePage(arg_91_0, arg_91_1)
	return arg_91_0:getConfig("page_core") == arg_91_1
end

function var_0_0.left4Day(arg_92_0)
	if arg_92_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function var_0_0.getAwardInfos(arg_93_0)
	return arg_93_0.data1KeyValueList or {}
end

function var_0_0.updateData(arg_94_0, arg_94_1, arg_94_2)
	if arg_94_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not arg_94_0:getAwardInfos()[arg_94_1] then
			arg_94_0.data1KeyValueList[arg_94_1] = {}
		end

		for iter_94_0, iter_94_1 in ipairs(arg_94_2) do
			if arg_94_0.data1KeyValueList[arg_94_1][iter_94_1] then
				arg_94_0.data1KeyValueList[arg_94_1][iter_94_1] = arg_94_0.data1KeyValueList[arg_94_1][iter_94_1] + 1
			else
				arg_94_0.data1KeyValueList[arg_94_1][iter_94_1] = 1
			end
		end
	end
end

function var_0_0.getTaskShip(arg_95_0)
	return arg_95_0:getConfig("config_client")[1]
end

function var_0_0.getNotificationMsg(arg_96_0)
	local var_96_0 = arg_96_0:getConfig("type")
	local var_96_1 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if var_96_0 == ActivityConst.ACTIVITY_TYPE_SHOP then
		var_96_1 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif var_96_0 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		var_96_1 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif var_96_0 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		var_96_1 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif var_96_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS or var_96_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER then
		var_96_1 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return var_96_1
end

function var_0_0.getDayIndex(arg_97_0)
	local var_97_0 = arg_97_0:getStartTime()
	local var_97_1 = pg.TimeMgr.GetInstance()
	local var_97_2 = var_97_1:GetServerTime()

	return var_97_1:DiffDay(var_97_0, var_97_2) + 1
end

function var_0_0.getStartTime(arg_98_0)
	local var_98_0, var_98_1 = parseTimeConfig(arg_98_0:getConfig("time"))

	if var_98_1 and var_98_1[1] == "newuser" then
		return arg_98_0.stopTime - var_98_1[3] * 86400
	else
		return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_98_0[2])
	end
end

function var_0_0.getNDay(arg_99_0, arg_99_1)
	arg_99_1 = arg_99_1 or arg_99_0:getStartTime()

	local var_99_0 = pg.TimeMgr.GetInstance()

	return var_99_0:DiffDay(arg_99_1, var_99_0:GetServerTime()) + 1
end

function var_0_0.isVariableTime(arg_100_0)
	local var_100_0, var_100_1 = parseTimeConfig(arg_100_0:getConfig("time"))

	return var_100_1 and var_100_1[1] == "newuser"
end

function var_0_0.setSpecialData(arg_101_0, arg_101_1, arg_101_2)
	arg_101_0.speciaData = arg_101_0.speciaData and arg_101_0.speciaData or {}
	arg_101_0.speciaData[arg_101_1] = arg_101_2
end

function var_0_0.getSpecialData(arg_102_0, arg_102_1)
	return arg_102_0.speciaData and arg_102_0.speciaData[arg_102_1] and arg_102_0.speciaData[arg_102_1] or nil
end

function var_0_0.canPermanentFinish(arg_103_0)
	local var_103_0 = arg_103_0:getConfig("type")

	if var_103_0 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		local var_103_1 = arg_103_0:getConfig("config_data")
		local var_103_2 = getProxy(TaskProxy)

		return underscore.all(underscore.flatten({
			var_103_1[#var_103_1]
		}), function(arg_104_0)
			return var_103_2:getFinishTaskById(arg_104_0) ~= nil
		end)
	elseif var_103_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		local var_103_3 = ActivityPtData.New(arg_103_0)

		return var_103_3.level >= #var_103_3.targets
	end

	return false
end

function var_0_0.GetShopTime(arg_105_0)
	local var_105_0 = pg.TimeMgr.GetInstance()
	local var_105_1 = arg_105_0:getStartTime()
	local var_105_2 = arg_105_0.stopTime

	return var_105_0:STimeDescS(var_105_1, "%y.%m.%d") .. " - " .. var_105_0:STimeDescS(var_105_2, "%y.%m.%d")
end

function var_0_0.GetCrusingUnreceiveAward(arg_106_0)
	assert(arg_106_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_106_0 = pg.battlepass_event_pt[arg_106_0.id]
	local var_106_1 = {}
	local var_106_2 = {}

	for iter_106_0, iter_106_1 in ipairs(arg_106_0.data1_list) do
		var_106_2[iter_106_1] = true
	end

	for iter_106_2, iter_106_3 in ipairs(var_106_0.target) do
		if iter_106_3 > arg_106_0.data1 then
			break
		elseif not var_106_2[iter_106_3] then
			table.insert(var_106_1, Drop.Create(pg.battlepass_event_award[var_106_0.award[iter_106_2]].drop_client))
		end
	end

	if arg_106_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_106_1)
	end

	local var_106_3 = {}

	for iter_106_4, iter_106_5 in ipairs(arg_106_0.data2_list) do
		var_106_3[iter_106_5] = true
	end

	for iter_106_6, iter_106_7 in ipairs(var_106_0.target) do
		if iter_106_7 > arg_106_0.data1 then
			break
		elseif not var_106_3[iter_106_7] then
			table.insert(var_106_1, Drop.Create(pg.battlepass_event_award[var_106_0.award_pay[iter_106_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_106_1)
end

function var_0_0.GetCrusingInfo(arg_107_0)
	assert(arg_107_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_107_0 = pg.battlepass_event_pt[arg_107_0.id]
	local var_107_1 = var_107_0.pt
	local var_107_2 = {}
	local var_107_3 = {}

	for iter_107_0, iter_107_1 in ipairs(var_107_0.key_point_display) do
		var_107_3[iter_107_1] = true
	end

	for iter_107_2, iter_107_3 in ipairs(var_107_0.target) do
		table.insert(var_107_2, {
			id = iter_107_2,
			pt = iter_107_3,
			award = pg.battlepass_event_award[var_107_0.award[iter_107_2]].drop_client,
			award_pay = pg.battlepass_event_award[var_107_0.award_pay[iter_107_2]].drop_client,
			isImportent = var_107_3[iter_107_2]
		})
	end

	local var_107_4 = arg_107_0.data1
	local var_107_5 = arg_107_0.data2 == 1
	local var_107_6 = {}

	for iter_107_4, iter_107_5 in ipairs(arg_107_0.data1_list) do
		var_107_6[iter_107_5] = true
	end

	local var_107_7 = {}

	for iter_107_6, iter_107_7 in ipairs(arg_107_0.data2_list) do
		var_107_7[iter_107_7] = true
	end

	local var_107_8 = 0

	for iter_107_8, iter_107_9 in ipairs(var_107_2) do
		if var_107_4 < iter_107_9.pt then
			break
		else
			var_107_8 = iter_107_8
		end
	end

	return {
		ptId = var_107_1,
		awardList = var_107_2,
		pt = var_107_4,
		isPay = var_107_5,
		awardDic = var_107_6,
		awardPayDic = var_107_7,
		phase = var_107_8
	}
end

function var_0_0.IsActivityReady(arg_108_0)
	return arg_108_0 and not arg_108_0:isEnd() and arg_108_0:readyToAchieve()
end

function var_0_0.NeedLoginRedPoint(arg_109_0)
	return PlayerPrefs.GetString(arg_109_0:GetLoginRedPointKey(), "") ~= arg_109_0:GetLoginRedPointValue()
end

function var_0_0.SetLoginRedPoint(arg_110_0)
	PlayerPrefs.SetString(arg_110_0:GetLoginRedPointKey(), arg_110_0:GetLoginRedPointValue())
end

function var_0_0.GetLoginRedPointValue(arg_111_0)
	return pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
end

function var_0_0.GetLoginRedPointKey(arg_112_0)
	local var_112_0 = arg_112_0:GetPlayerID()

	return string.format("%s_%s", var_112_0, arg_112_0.id)
end

function var_0_0.GetPlayerID(arg_113_0)
	return getProxy(PlayerProxy):getPlayerId()
end

function var_0_0.GetConfigClientSetting(arg_114_0, arg_114_1)
	return arg_114_0:getConfig("config_client")[arg_114_1]
end

return var_0_0
