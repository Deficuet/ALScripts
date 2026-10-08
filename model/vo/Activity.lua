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
		[ActivityConst.ACTIVITY_TYPE_PT_CRUSING] = CrusingActivity,
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
		[ActivityConst.ACTIVITY_TYPE_TOWN2] = TownActivity2,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = AirFightActivity,
		[ActivityConst.ACTIVITY_TYPE_NOT_TRACEABLE] = NotTraceableTaskActivity,
		[ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA] = VirtualBagActivity,
		[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = VirtualBagActivity,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_DRAW_AWARD] = DrawAwardActivity,
		[ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_UP] = LoveLetterActivity,
		[ActivityConst.ACTIVITY_TYPE_MALL] = MallActivity,
		[ActivityConst.ACTIVITY_TYPE_AUCTION_GAME] = AuctionGameActivity,
		[ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN] = ReversePacmanActivity
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
		[ActivityConst.ACTIVITY_TYPE_CHARGEAWARD] = function(arg_28_0)
			return ChargeAwardPage.IsShowTip(arg_28_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function(arg_29_0)
			local var_29_0 = getProxy(PlayerProxy):getRawData()
			local var_29_1 = pg.activity_event_chapter_award[arg_29_0:getConfig("config_id")]

			for iter_29_0 = 1, #var_29_1.chapter do
				local var_29_2 = var_29_1.chapter[iter_29_0]

				if getProxy(ChapterProxy):isClear(var_29_2) and not _.include(arg_29_0.data1_list, var_29_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASKS] = function(arg_30_0)
			local var_30_0 = arg_30_0:getConfig("config_client").subType

			if var_30_0 then
				return arg_30_0:activityTasksSubTypeFunc(var_30_0)
			end

			local var_30_1 = getProxy(TaskProxy)
			local var_30_2 = _.flatten(arg_30_0:getConfig("config_data"))

			if IslandTaskActhelper.IsIslandTaskAct(arg_30_0) then
				return IslandTaskActhelper.ShouldTipIslandTask(arg_30_0)
			end

			if _.any(var_30_2, function(arg_31_0)
				local var_31_0 = var_30_1:getTaskById(arg_31_0)

				return var_31_0 and var_31_0:isFinish() and not var_31_0:isReceive()
			end) then
				return true
			end

			local var_30_3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

			if var_30_3 and not var_30_3:isEnd() and var_30_3:getConfig("config_client").linkActID == arg_30_0.id and var_30_3:readyToAchieve() then
				return true
			end

			if arg_30_0:getConfig("config_client") and arg_30_0:getConfig("config_client").decodeGameId then
				local var_30_4 = arg_30_0:getConfig("config_client").decodeGameId
				local var_30_5 = getProxy(MiniGameProxy):GetHubByGameId(var_30_4)

				if var_30_5 then
					local var_30_6 = arg_30_0:getConfig("config_data")
					local var_30_7 = var_30_6[#var_30_6]
					local var_30_8 = _.all(var_30_7, function(arg_32_0)
						return getProxy(TaskProxy):getFinishTaskById(arg_32_0) ~= nil
					end)

					if var_30_5.ultimate <= 0 and var_30_8 then
						return true
					end
				end
			end

			if arg_30_0:getConfig("config_client") and arg_30_0:getConfig("config_client").linkTaskPoolAct then
				local var_30_9 = arg_30_0:getConfig("config_client").linkTaskPoolAct
				local var_30_10 = getProxy(ActivityProxy):getActivityById(var_30_9)

				if var_30_10 and var_30_10:readyToAchieve() then
					return true
				end
			end

			if arg_30_0:getConfig("config_client") and arg_30_0:getConfig("config_client").link_act then
				local var_30_11 = arg_30_0:getConfig("config_client").link_act
				local var_30_12 = getProxy(ActivityProxy):getActivityById(var_30_11)

				if var_30_12 and var_30_12:readyToAchieve() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_TASKS](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function(arg_34_0)
			local var_34_0 = arg_34_0:GetCountForHitMonster()

			return not (arg_34_0:GetDataConfig("hp") <= arg_34_0.data3) and var_34_0 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DODGEM] = function(arg_35_0)
			local var_35_0 = pg.TimeMgr.GetInstance()
			local var_35_1 = var_35_0:DiffDay(arg_35_0.data1, var_35_0:GetServerTime()) + 1
			local var_35_2 = arg_35_0:getConfig("config_id")

			if var_35_2 == 1 then
				return arg_35_0.data4 == 0 and arg_35_0.data2 >= 7 or defaultValue(arg_35_0.data2_list[1], 0) > 0 or defaultValue(arg_35_0.data2_list[2], 0) > 0 or arg_35_0.data2 < math.min(var_35_1, 7) or var_35_1 > arg_35_0.data3
			elseif var_35_2 == 2 then
				return arg_35_0.data4 == 0 and arg_35_0.data2 >= 7 or defaultValue(arg_35_0.data2_list[1], 0) > 0 or defaultValue(arg_35_0.data2_list[2], 0) > 0 or arg_35_0.data2 < math.min(var_35_1, 7)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function(arg_36_0)
			local var_36_0 = arg_36_0.data1
			local var_36_1 = arg_36_0.data1_list[1]
			local var_36_2 = arg_36_0.data1_list[2]
			local var_36_3 = arg_36_0.data2_list[1]
			local var_36_4 = arg_36_0.data2_list[2]
			local var_36_5 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_36_6 = math.ceil((var_36_5 - var_36_0) / 86400) * arg_36_0:getDataConfig("daily_time") + var_36_1 - var_36_2
			local var_36_7 = var_36_3 - var_36_4

			return var_36_6 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PIZZA_PT] = function(arg_37_0)
			local var_37_0 = ActivityPtData.New(arg_37_0):CanGetAward()
			local var_37_1 = true

			if arg_37_0:getConfig("config_client") then
				local var_37_2 = arg_37_0:getConfig("config_client").task_act_id

				if var_37_2 and var_37_2 ~= 0 and pg.activity_template[var_37_2] then
					local var_37_3 = pg.activity_template[var_37_2]
					local var_37_4 = _.flatten(var_37_3.config_data)

					if var_37_4 and #var_37_4 > 0 then
						local var_37_5 = getProxy(TaskProxy)

						for iter_37_0 = 1, #var_37_4 do
							local var_37_6 = var_37_5:getTaskById(var_37_4[iter_37_0])

							if var_37_6 and var_37_6:isFinish() then
								return true
							end
						end
					end
				end
			end

			local var_37_7 = false
			local var_37_8 = arg_37_0:getConfig("config_client").fireworkActID

			if var_37_8 and var_37_8 ~= 0 then
				local var_37_9 = getProxy(ActivityProxy):getActivityById(var_37_8)

				var_37_7 = var_37_9 and var_37_9:readyToAchieve() or false
			end

			local var_37_10 = arg_37_0:getConfig("config_client")[2]
			local var_37_11 = type(var_37_10) == "number" and ManualSignActivity.IsManualSignActAndAnyAwardCanGet(var_37_10)

			return var_37_0 and var_37_1 or var_37_7 or var_37_11
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_PIZZA_PT](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = function(arg_39_0)
			local var_39_0 = arg_39_0.data1

			if var_39_0 == 1 then
				local var_39_1 = pg.activity_template_headhunting[arg_39_0.id]
				local var_39_2 = var_39_1.target
				local var_39_3 = 0

				for iter_39_0, iter_39_1 in ipairs(arg_39_0:getClientList()) do
					var_39_3 = var_39_3 + iter_39_1:getPt()
				end

				local var_39_4 = 0

				for iter_39_2 = #var_39_2, 1, -1 do
					if table.contains(arg_39_0.data1_list, var_39_2[iter_39_2]) then
						var_39_4 = iter_39_2

						break
					end
				end

				local var_39_5 = var_39_1.drop_client
				local var_39_6 = math.min(var_39_4 + 1, #var_39_5)
				local var_39_7 = _.any(var_39_1.tasklist, function(arg_40_0)
					local var_40_0 = getProxy(TaskProxy):getTaskById(arg_40_0)

					return var_40_0 and var_40_0:isFinish() and not var_40_0:isReceive()
				end)

				return var_39_3 >= var_39_2[var_39_6] and var_39_4 ~= #var_39_5 or var_39_7
			elseif var_39_0 == 2 then
				local var_39_8 = getProxy(TaskProxy)
				local var_39_9 = pg.activity_template_returnner[arg_39_0.id]

				return _.any(_.flatten(var_39_9.task_list), function(arg_41_0)
					local var_41_0 = var_39_8:getTaskById(arg_41_0)

					return var_41_0 and var_41_0:isFinish()
				end)
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_42_0)
			local var_42_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_42_0:getConfig("config_id"))

			if var_42_0.count > 0 then
				return true
			end

			if var_42_0:getConfig("reward") ~= 0 and var_42_0.usedtime >= var_42_0:getConfig("reward_need") and var_42_0.ultimate == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function(arg_43_0)
			local var_43_0 = pg.activity_event_turning[arg_43_0:getConfig("config_id")]
			local var_43_1 = arg_43_0.data4

			if var_43_1 ~= 0 then
				local var_43_2 = var_43_0.task_table[var_43_1]
				local var_43_3 = getProxy(TaskProxy)

				for iter_43_0, iter_43_1 in ipairs(var_43_2) do
					if (var_43_3:getTaskById(iter_43_1) or var_43_3:getFinishTaskById(iter_43_1)):getTaskStatus() == 1 then
						return true
					end
				end

				local var_43_4 = pg.TimeMgr.GetInstance():DiffDay(arg_43_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_43_4, 1, pg.activity_event_turning[arg_43_0:getConfig("config_id")].total_num) > arg_43_0.data3 then
					for iter_43_2, iter_43_3 in ipairs(var_43_2) do
						if (var_43_3:getTaskById(iter_43_3) or var_43_3:getFinishTaskById(iter_43_3)):getTaskStatus() ~= 2 then
							return false
						end
					end

					return true
				end
			elseif var_43_1 == 0 then
				local var_43_5 = pg.TimeMgr.GetInstance():DiffDay(arg_43_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_43_5, 1, pg.activity_event_turning[arg_43_0:getConfig("config_id")].total_num) > arg_43_0.data3 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function(arg_44_0)
			return not (arg_44_0.data2 > 0)
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function(arg_45_0)
			local var_45_0 = arg_45_0:getConfig("config_client").story
			local var_45_1 = var_45_0 and #var_45_0 or 7
			local var_45_2 = pg.TimeMgr.GetInstance():DiffDay(arg_45_0.data3, pg.TimeMgr.GetInstance():GetServerTime()) + 1
			local var_45_3 = math.clamp(var_45_2, 1, var_45_1)

			if var_45_0 then
				local var_45_4 = pg.NewStoryMgr.GetInstance()
				local var_45_5 = math.clamp(arg_45_0.data2, 0, var_45_1)

				for iter_45_0 = 1, var_45_3 do
					local var_45_6 = var_45_0[iter_45_0][1]

					if var_45_6 and iter_45_0 <= var_45_5 and not var_45_4:IsPlayed(var_45_6) then
						return true
					end
				end
			end

			if var_45_1 <= var_45_3 and var_45_1 <= arg_45_0.data2 and not (arg_45_0.data1 > 0) then
				return true
			end

			if Shrine2022View.IsNeedShowTipForShipCount() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function(arg_46_0)
			local var_46_0 = arg_46_0:getConfig("config_client")[3]
			local var_46_1 = pg.TimeMgr.GetInstance()
			local var_46_2 = var_46_1:DiffDay(arg_46_0.data3, var_46_1:GetServerTime()) + 1 - arg_46_0.data2

			return math.clamp(var_46_2, 0, #var_46_0 - arg_46_0.data2) > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function(arg_47_0)
			local var_47_0 = arg_47_0:GetBuildingIds()

			for iter_47_0, iter_47_1 in ipairs(var_47_0) do
				local var_47_1 = arg_47_0:GetBuildingLevel(iter_47_1)
				local var_47_2 = pg.activity_event_building[iter_47_1]

				if var_47_2 and var_47_1 < #var_47_2.buff then
					local var_47_3 = var_47_2.material[var_47_1]

					if underscore.all(var_47_3, function(arg_48_0)
						local var_48_0 = arg_48_0[1]
						local var_48_1 = arg_48_0[2]
						local var_48_2 = arg_48_0[3]
						local var_48_3 = 0

						if var_48_0 == DROP_TYPE_VITEM then
							local var_48_4 = AcessWithinNull(Item.getConfigData(var_48_1), "link_id")

							assert(var_48_4 == arg_47_0.id)

							var_48_3 = arg_47_0:GetMaterialCount(var_48_1)
						elseif var_48_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_48_5 = AcessWithinNull(pg.activity_drop_type[var_48_0], "activity_id")

							assert(var_48_5)

							bagAct = getProxy(ActivityProxy):getActivityById(var_48_5)
							var_48_3 = bagAct:getVitemNumber(var_48_1)
						end

						return var_48_2 <= var_48_3
					end) then
						return true
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function(arg_49_0, ...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF](arg_49_0, ...) or arg_49_0:CanRequest()
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function(arg_50_0)
			if arg_50_0.data3 > 0 and arg_50_0.data1 ~= 0 then
				return true
			else
				for iter_50_0 = 1, #arg_50_0.data1_list do
					if not bit.band(arg_50_0.data1_list[iter_50_0], ActivityConst.EXPEDITION_TYPE_GOT) ~= 0 then
						if bit.band(arg_50_0.data1_list[iter_50_0], ActivityConst.EXPEDITION_TYPE_OPEN) ~= 0 then
							return true
						elseif bit.band(arg_50_0.data1_list[iter_50_0], ActivityConst.EXPEDITION_TYPE_BAOXIANG) ~= 0 then
							return true
						elseif bit.band(arg_50_0.data1_list[iter_50_0], ActivityConst.EXPEDITION_TYPE_BOSS) ~= 0 then
							return true
						end
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY] = function(arg_51_0)
			local var_51_0 = arg_51_0:getConfig("config_client")

			if var_51_0 and var_51_0.linkGameHubID then
				local var_51_1 = getProxy(MiniGameProxy):GetHubByHubId(var_51_0.linkGameHubID)

				if var_51_1 then
					if var_51_0.trimRed then
						if var_51_1.ultimate == 1 then
							return false
						end

						if var_51_1.usedtime == var_51_1:getConfig("reward_need") then
							return true
						end
					end

					return var_51_1.count > 0
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function(arg_52_0)
			return arg_52_0.data2 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function(arg_53_0)
			local var_53_0 = arg_53_0.data1_list
			local var_53_1 = arg_53_0.data2_list
			local var_53_2 = arg_53_0:GetPicturePuzzleIds()
			local var_53_3 = arg_53_0:getConfig("config_client").linkActID

			if var_53_3 then
				local var_53_4 = getProxy(ActivityProxy):getActivityById(var_53_3)

				if var_53_4 and var_53_4:readyToAchieve() then
					return true
				end
			end

			if _.any(var_53_2, function(arg_54_0)
				local var_54_0 = table.contains(var_53_1, arg_54_0)
				local var_54_1 = table.contains(var_53_0, arg_54_0)

				return not var_54_0 and var_54_1
			end) then
				return true
			end

			local var_53_5 = pg.activity_event_picturepuzzle[arg_53_0.id]

			if var_53_5 and var_53_5.chapter > 0 and arg_53_0.data1 < 1 then
				return true
			end

			if var_53_5 and #var_53_5.auto_finish_args > 0 and arg_53_0.data1 == 1 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = function(arg_55_0)
			return AirFightActivity.readyToAchieve(arg_55_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE] = function(arg_56_0)
			local var_56_0 = WorldInPictureActiviyData.New(arg_56_0)

			return not var_56_0:IsTravelAll() and var_56_0:GetTravelPoint() > 0 or var_56_0:GetDrawPoint() > 0 and var_56_0:AnyAreaCanDraw()
		end,
		[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function(arg_57_0)
			if arg_57_0.data1 == 0 then
				local var_57_0 = arg_57_0:getStartTime()
				local var_57_1 = pg.TimeMgr.GetInstance():GetServerTime()

				if arg_57_0:getConfig("config_client").autounlock <= var_57_1 - var_57_0 then
					return true
				end
			elseif arg_57_0.data1 ~= 0 and arg_57_0.data2 == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_POOL] = function(arg_58_0)
			local var_58_0 = arg_58_0:getConfig("config_data")
			local var_58_1 = getProxy(TaskProxy)

			if arg_58_0.data1 >= #var_58_0 then
				return false
			end

			local var_58_2 = pg.TimeMgr.GetInstance()
			local var_58_3 = (var_58_2:DiffDay(arg_58_0:getStartTime(), var_58_2:GetServerTime()) + 1) * arg_58_0:getConfig("config_id")

			var_58_3 = var_58_3 > #var_58_0 and #var_58_0 or var_58_3

			local var_58_4 = _.any(var_58_0, function(arg_59_0)
				local var_59_0 = var_58_1:getTaskById(arg_59_0)

				return var_59_0 and var_59_0:isFinish()
			end)

			return var_58_3 - arg_58_0.data1 > 0 and var_58_4
		end,
		[ActivityConst.ACTIVITY_TYPE_EVENT] = function(arg_60_0)
			local var_60_0 = getProxy(PlayerProxy):getData().id

			return PlayerPrefs.GetInt("ACTIVITY_TYPE_EVENT_" .. arg_60_0.id .. "_" .. var_60_0) == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function(arg_61_0)
			if arg_61_0.data2 and arg_61_0.data2 <= 0 and arg_61_0.data1 >= pg.activity_event_avatarframe[arg_61_0:getConfig("config_id")].target then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function(arg_62_0)
			local var_62_0, var_62_1 = arg_62_0:GetUpgradeCost()

			if arg_62_0:GetSlotCount() < arg_62_0:GetTotalSlotCount() and var_62_1 <= arg_62_0:GetCoins() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function(arg_63_0)
			local var_63_0 = arg_63_0:getConfig("config_data")[2][1]
			local var_63_1 = arg_63_0:getConfig("config_data")[2][2]
			local var_63_2 = getProxy(PlayerProxy):getRawData():getResource(var_63_0)

			if arg_63_0.data1 > 0 and var_63_1 <= var_63_2 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FLOWER_FIELD] = function(arg_64_0)
			local var_64_0 = pg.TimeMgr.GetInstance()

			return var_64_0:GetServerTime() >= var_64_0:GetTimeToNextTime(math.max(arg_64_0.data1, arg_64_0.data2))
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND] = function(arg_65_0)
			for iter_65_0, iter_65_1 in pairs(getProxy(SixthAnniversaryIslandProxy):GetNodeDic()) do
				if iter_65_1:IsVisual() and iter_65_1:RedDotHint() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function(arg_66_0)
			return Spring2Activity.readyToAchieve(arg_66_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function(arg_67_0)
			local var_67_0 = #arg_67_0.data2_list
			local var_67_1 = arg_67_0:getData1List()
			local var_67_2 = arg_67_0:getConfig("config_data")[2]

			if #var_67_1 == #var_67_2 then
				return false
			end

			local function var_67_3()
				for iter_68_0, iter_68_1 in ipairs(var_67_2) do
					if not table.contains(var_67_1, iter_68_1[1]) and var_67_0 >= iter_68_1[1] then
						return true
					end
				end

				return false
			end

			local function var_67_4()
				local var_69_0 = getProxy(PlayerProxy):getData().id

				return PlayerPrefs.GetInt("DAY_TIP_" .. arg_67_0.id .. "_" .. var_69_0 .. "_" .. arg_67_0:getDayIndex()) == 0
			end

			return var_67_3() or var_67_4()
		end,
		[ActivityConst.ACTIVITY_TYPE_SURVEY] = function(arg_70_0)
			local var_70_0, var_70_1 = getProxy(ActivityProxy):isSurveyOpen()
			local var_70_2 = getProxy(ActivityProxy):isSurveyDone()

			return var_70_0 and not var_70_2 and not SurveyPage.IsEverEnter(var_70_1)
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function(arg_71_0)
			return LaunchBallActivityMgr.GetInvitationAble(arg_71_0.id)
		end,
		[ActivityConst.ACTIVITY_TYPE_GIFT_UP] = function(arg_72_0)
			local var_72_0 = arg_72_0:getConfig("config_client").gifts[2]
			local var_72_1 = math.min(#var_72_0, arg_72_0:getNDay())

			return underscore(var_72_0):chain():first(var_72_1):any(function(arg_73_0)
				local var_73_0 = getProxy(ShopsProxy):GetGiftCommodity(arg_73_0, Goods.TYPE_GIFT_PACKAGE)

				return var_73_0:canPurchase() and var_73_0:inTime() and not var_73_0:IsGroupLimit()
			end):value()
		end,
		[ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE] = function(arg_74_0)
			if getProxy(ShopsProxy):getActivityShops() == nil then
				return false
			end

			local var_74_0 = arg_74_0:getConfig("config_client")
			local var_74_1 = getProxy(PlayerProxy):getData():getResource(var_74_0.uPtId)
			local var_74_2 = #var_74_0.goodsId + 1
			local var_74_3 = var_74_2 - _.reduce(var_74_0.goodsId, 0, function(arg_75_0, arg_75_1)
				return arg_75_0 + getProxy(ShopsProxy):getActivityShopById(var_74_0.shopId):GetCommodityById(arg_75_1):GetPurchasableCnt()
			end)
			local var_74_4 = var_74_3 < var_74_2 and pg.activity_shop_template[var_74_0.goodsId[var_74_3]] or nil

			return var_74_3 < var_74_2 and var_74_1 >= var_74_4.resource_num
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING] = function(arg_76_0)
			return arg_76_0:getData1() > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DAILY_STAGE_BONUS] = function(arg_77_0)
			return arg_77_0:NeedLoginRedPoint()
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_RYZA] = function(arg_78_0)
			local var_78_0 = getProxy(ActivityTaskProxy):getTaskById(arg_78_0.id)

			for iter_78_0, iter_78_1 in ipairs(var_78_0) do
				if iter_78_1:getTaskStatus() == 1 then
					return true
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_79_0)
			local var_79_0 = arg_79_0:getConfig("config_id")

			if getProxy(MiniGameProxy):GetHubByHubId(var_79_0).count > 0 then
				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function(arg_80_0)
			local var_80_0 = arg_80_0:getConfig("config_id")
			local var_80_1 = pg.activity_7_day_sign[var_80_0].front_drops
			local var_80_2 = pg.TimeMgr.GetInstance()
			local var_80_3 = var_80_2:GetServerTime()

			return arg_80_0.data1 < #var_80_1 and not var_80_2:IsSameDay(var_80_3, arg_80_0.data2) and var_80_3 > arg_80_0.data2
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_HEI5] = function(arg_81_0)
			return #arg_81_0:GetHei5UnreceiveAward() > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_TownSkinStory] = function(arg_82_0)
			local var_82_0 = pg.NewStoryMgr.GetInstance()

			if arg_82_0.data1 > 0 and underscore.any(arg_82_0:GetConfigClientSetting("story"), function(arg_83_0)
				return not var_82_0:IsPlayed(arg_83_0[1])
			end) then
				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function(arg_84_0)
			return arg_84_0:CanGetAward() or not arg_84_0:TodayIsSigned()
		end,
		[ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_MAIL] = function(arg_85_0)
			return getProxy(PlayerProxy):getRawData().level >= arg_85_0:getConfig("config_id") and arg_85_0.data1 == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_GAME_PT] = function(arg_86_0)
			local var_86_0 = pg.island_activity_pt_page[arg_86_0:getIslandConfig("config_id")].task_id
			local var_86_1 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

			return IslandGamePtTemplatePage.ShouldFirstTip(arg_86_0.id) or _.any(var_86_0, function(arg_87_0)
				local var_87_0 = var_86_1:GetTask(arg_87_0)

				return var_87_0 and var_87_0:IsFinish() and not var_86_1:IsFinishTask(arg_87_0)
			end)
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_CHEATE_TAVERN] = function(arg_88_0)
			local var_88_0 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.ISLAND_BAR_ACT_ID)

			for iter_88_0, iter_88_1 in ipairs(var_88_0) do
				if iter_88_1:getTaskStatus() == 1 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN] = function(arg_89_0)
			print("TODO: 红点功能")

			return false
		end
	}

	if switch(arg_25_0:getConfig("type"), var_0_0.readyToAchieveDic, nil, arg_25_0) then
		return true
	elseif arg_25_0:getConfig("config_client").sub_act_id then
		local var_25_2 = getProxy(ActivityProxy):getActivityById(arg_25_0:getConfig("config_client").sub_act_id)

		return var_25_2 and not var_25_2:isEnd() and var_25_2:readyToAchieve()
	elseif arg_25_0:getConfig("config_client").is_showMedal then
		local var_25_3 = arg_25_0:getConfig("config_client").medal_group_id

		return ActivityMedalGroup.showTip(var_25_3)
	elseif arg_25_0:getConfig("config_client").is_clickOnce then
		local var_25_4 = arg_25_0:getConfig("id")
		local var_25_5 = Activity.GetPlayerActivyIDKey(arg_25_0:getConfig("id"))

		return PlayerPrefs.GetInt(var_25_5, 0) == 0
	else
		return false
	end
end

function var_0_0.IsShowTipById(arg_90_0)
	var_0_0.ShowTipTableById = var_0_0.ShowTipTableById or {
		[ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE] = function(arg_91_0)
			local var_91_0 = getProxy(SkirmishProxy)

			var_91_0:UpdateSkirmishProgress()

			local var_91_1 = var_91_0:getRawData()
			local var_91_2 = 0
			local var_91_3 = 0

			for iter_91_0, iter_91_1 in ipairs(var_91_1) do
				local var_91_4 = iter_91_1:GetState()

				var_91_2 = var_91_4 > SkirmishVO.StateInactive and var_91_2 + 1 or var_91_2
				var_91_3 = var_91_4 == SkirmishVO.StateClear and var_91_3 + 1 or var_91_3
			end

			return var_91_3 < var_91_2
		end,
		[ActivityConst.POCKY_SKIN_LOGIN] = function(arg_92_0)
			local var_92_0 = arg_92_0:getConfig("config_client").linkids
			local var_92_1 = getProxy(TaskProxy)
			local var_92_2 = getProxy(ActivityProxy)
			local var_92_3 = var_92_2:getActivityById(var_92_0[1])
			local var_92_4 = var_92_2:getActivityById(var_92_0[2])
			local var_92_5 = var_92_2:getActivityById(var_92_0[3])

			assert(var_92_3 and var_92_4 and var_92_5)

			local function var_92_6()
				return var_92_3 and var_92_3:readyToAchieve()
			end

			local function var_92_7()
				return var_92_4 and var_92_4:readyToAchieve()
			end

			local function var_92_8()
				local var_95_0 = _.flatten(arg_92_0:getConfig("config_data"))

				for iter_95_0 = 1, math.min(#var_95_0, var_92_4.data3) do
					local var_95_1 = var_95_0[iter_95_0]
					local var_95_2 = var_92_1:getTaskById(var_95_1)

					if var_95_2 and var_95_2:isFinish() and not var_95_2:isReceive() then
						return true
					end
				end
			end

			local function var_92_9()
				if not (var_92_5 and var_92_5:readyToAchieve()) or not var_92_3 then
					return false
				end

				local var_96_0 = ActivityPtData.New(var_92_3)

				return var_96_0.level >= #var_96_0.targets
			end

			return var_92_8() or var_92_6() or var_92_7() or var_92_9()
		end,
		[ActivityConst.TOWERCLIMBING_SIGN] = function(arg_97_0)
			local var_97_0 = getProxy(MiniGameProxy):GetHubByHubId(9)
			local var_97_1 = var_97_0.ultimate
			local var_97_2 = var_97_0:getConfig("reward_need")
			local var_97_3 = var_97_0.usedtime

			return var_97_1 == 0 and var_97_2 <= var_97_3
		end,
		[pg.activity_const.NEWYEAR_SNACK_PAGE_ID.act_id] = NewYearSnackPage.IsTip,
		[ActivityConst.WWF_TASK_ID] = WWFPtPage.IsShowRed,
		[ActivityConst.NEWMEIXIV4_SKIRMISH_ID] = NewMeixiV4SkirmishPage.IsShowRed,
		[ActivityConst.JIUJIU_YOYO_ID] = JiujiuYoyoPage.IsShowRed,
		[ActivityConst.SENRANKAGURA_TRAIN_ACT_ID] = SenrankaguraTrainScene.IsShowRed,
		[ActivityConst.DORM_SIGN_ID] = DormSignPage.IsShowRed,
		[ActivityConst.DORM_SIGN_ID_2] = DormSignTwoPage.IsShowRed,
		[ActivityConst.DORM_SIGN_ID_3] = DormSignThirdPage.IsShowRed,
		[ActivityConst.ISLAND_SIGN_ID] = IslandSignPage.IsShowRed,
		[ActivityConst.GOASTSTORYACTIVITY_ID] = GhostSkinPageLayer.IsShowRed,
		[ActivityConst.YUMIA_BASE_ACT_ID] = YoumiyaStrongholdLayer.ShouldShowTip,
		[ActivityConst.NINJA_CITY_MAIN_ACTIVITY_ID] = function(arg_98_0)
			if CityRebuildBookLayer.ShouldShowTip() or CityRebuildTasksLayer.ShouldShowTip() then
				return true
			end

			return false
		end,
		[ActivityConst.MALL_MAIN_ACTIVITY_ID] = function(arg_99_0)
			return AnniversaryNineMainPage.IsTip()
		end,
		[ActivityConst.SAILING_SHIP_3_SKIN_ACT_ID] = SailingShip3SkinLayer.ShouldShowTip,
		[ActivityConst.HelenaPT_ACT_ID] = function(arg_100_0)
			return HelenaScenarioPage:IsShowRed(arg_100_0)
		end,
		[ActivityConst.LOVE_LETTER_LOGIN_ID] = function(arg_101_0)
			local var_101_0 = arg_101_0:getNDay()

			for iter_101_0 = 1, var_101_0 do
				local var_101_1 = arg_101_0:getConfig("config_data")[iter_101_0]
				local var_101_2 = var_101_1 and getProxy(TaskProxy):getTaskVO(var_101_1) or nil

				if var_101_2 and var_101_2:getTaskStatus() == 1 then
					return true
				end
			end

			return false
		end
	}

	local var_90_0 = var_0_0.ShowTipTableById[arg_90_0.id]

	return tobool(var_90_0), var_90_0 and var_90_0(arg_90_0)
end

function var_0_0.activityTasksSubTypeFunc(arg_102_0, arg_102_1)
	if arg_102_1 == 1 then
		local var_102_0 = 1
		local var_102_1 = getProxy(TaskProxy)
		local var_102_2 = arg_102_0:getConfig("config_client").unlock_task
		local var_102_3 = arg_102_0:getNDay()
		local var_102_4 = #var_102_2
		local var_102_5 = math.min(var_102_3, var_102_4)
		local var_102_6 = true

		for iter_102_0 = 1, var_102_5 do
			if not var_102_6 then
				break
			end

			var_102_0 = iter_102_0

			if iter_102_0 < var_102_5 then
				for iter_102_1, iter_102_2 in ipairs(var_102_2[iter_102_0]) do
					local var_102_7 = var_102_1:getTaskById(iter_102_2) or var_102_1:getFinishTaskById(iter_102_2)

					if not var_102_7 or var_102_7:getTaskStatus() ~= 2 then
						var_102_6 = false

						break
					end
				end
			end
		end

		local var_102_8 = math.min(var_102_0, var_102_4)

		for iter_102_3, iter_102_4 in ipairs(var_102_2[var_102_8]) do
			local var_102_9 = var_102_1:getTaskById(iter_102_4) or var_102_1:getFinishTaskById(iter_102_4)

			if not var_102_9 then
				return false
			end

			if var_102_9:getTaskStatus() == 1 then
				return true
			end
		end
	end

	if arg_102_1 == TASK_SUB_TYPE_CLIENT_TRIGGER then
		local var_102_10, var_102_11 = getActivityTask(arg_102_0, true)

		return var_102_10 and (not var_102_11 or var_102_11:getTaskStatus() ~= 2)
	end

	return false
end

function var_0_0.isShow(arg_103_0)
	if LOCK_SKIN_US then
		local var_103_0 = pg.gameset.levellimit_skinstory.key_value
		local var_103_1 = pg.gameset.levellimit_skinstory.description

		if var_103_0 >= getProxy(PlayerProxy):getRawData().level and table.contains(var_103_1, arg_103_0.id) then
			return false
		end
	end

	if arg_103_0:getConfig("is_show") <= 0 then
		return false
	end

	if arg_103_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return arg_103_0.data1 ~= 0
	elseif arg_103_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY then
		local var_103_2 = arg_103_0:getConfig("config_client").display_link

		if var_103_2 then
			return underscore.any(var_103_2, function(arg_104_0)
				return arg_104_0[2] == 0 or pg.TimeMgr.GetInstance():inTime(ShopConst.GetShopConfig(arg_104_0[2]).time)
			end)
		end
	elseif arg_103_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SURVEY then
		local var_103_3 = getProxy(ActivityProxy)
		local var_103_4 = var_103_3:isSurveyOpen()
		local var_103_5 = var_103_3:isSurveyDone()

		return var_103_4 and not var_103_5
	elseif arg_103_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE then
		if getProxy(ShopsProxy):getActivityShops() == nil then
			return false
		end

		local var_103_6 = arg_103_0:getConfig("config_client")
		local var_103_7 = getProxy(PlayerProxy):getData():getResource(var_103_6.uPtId)
		local var_103_8 = #var_103_6.goodsId + 1

		return var_103_8 > var_103_8 - _.reduce(var_103_6.goodsId, 0, function(arg_105_0, arg_105_1)
			return arg_105_0 + getProxy(ShopsProxy):getActivityShopById(var_103_6.shopId):GetCommodityById(arg_105_1):GetPurchasableCnt()
		end)
	elseif arg_103_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_RYZA and table.contains({
		ActivityConst.DORM_SIGN_ID,
		ActivityConst.DORM_SIGN_ID_2,
		ActivityConst.DORM_SIGN_ID_3
	}, arg_103_0:getConfig("id")) then
		return #getProxy(ActivityProxy):getActivityById(arg_103_0:getConfig("id")):getConfig("config_data") ~= #getProxy(ActivityTaskProxy):getFinishTaskById(arg_103_0:getConfig("id"))
	end

	return true
end

function var_0_0.isAfterShow(arg_106_0)
	if arg_106_0.configId == ActivityConst.ISLAND_SIGN_ID then
		local var_106_0 = _.flatten(arg_106_0:getConfig("config_data"))
		local var_106_1 = getProxy(ActivityTaskProxy):GetActivityTasks(arg_106_0.id)

		return _.all(var_106_0, function(arg_107_0)
			local var_107_0 = var_106_1[arg_107_0]

			return var_107_0 and var_107_0:isOver()
		end)
	end

	if arg_106_0.configId == ActivityConst.UR_TASK_ACT_ID or arg_106_0.configId == ActivityConst.SPECIAL_WEAPON_ACT_ID then
		local var_106_2 = getProxy(TaskProxy)

		return underscore.all(arg_106_0:getConfig("config_data")[1], function(arg_108_0)
			local var_108_0 = var_106_2:getTaskVO(arg_108_0)

			return var_108_0 and var_108_0:isReceive()
		end)
	end

	return false
end

function var_0_0.getPageABNames(arg_109_0)
	local var_109_0 = arg_109_0:getConfig("page_info")

	return {
		var_109_0.ui_name,
		var_109_0.ui_name2
	}
end

function var_0_0.checkPageABExist(arg_110_0)
	if not IsUnityEditor then
		return true
	end

	return underscore.all(arg_110_0:getPageABNames(), function(arg_111_0)
		return checkABExist(string.format("ui/%s", arg_111_0))
	end)
end

function var_0_0.getShowPriority(arg_112_0)
	return arg_112_0:getConfig("is_show")
end

function var_0_0.isCorePage(arg_113_0, arg_113_1)
	return arg_113_0:getConfig("page_core") == arg_113_1
end

function var_0_0.left4Day(arg_114_0)
	if arg_114_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function var_0_0.getAwardInfos(arg_115_0)
	return arg_115_0.data1KeyValueList or {}
end

function var_0_0.updateData(arg_116_0, arg_116_1, arg_116_2)
	if arg_116_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not arg_116_0:getAwardInfos()[arg_116_1] then
			arg_116_0.data1KeyValueList[arg_116_1] = {}
		end

		for iter_116_0, iter_116_1 in ipairs(arg_116_2) do
			if arg_116_0.data1KeyValueList[arg_116_1][iter_116_1] then
				arg_116_0.data1KeyValueList[arg_116_1][iter_116_1] = arg_116_0.data1KeyValueList[arg_116_1][iter_116_1] + 1
			else
				arg_116_0.data1KeyValueList[arg_116_1][iter_116_1] = 1
			end
		end
	end
end

function var_0_0.getTaskShip(arg_117_0)
	return arg_117_0:getConfig("config_client")[1]
end

function var_0_0.getNotificationMsg(arg_118_0)
	local var_118_0 = arg_118_0:getConfig("type")
	local var_118_1 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if var_118_0 == ActivityConst.ACTIVITY_TYPE_SHOP or var_118_0 == ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE or var_118_0 == ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE then
		var_118_1 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif var_118_0 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		var_118_1 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif var_118_0 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		var_118_1 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif var_118_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS or var_118_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER then
		var_118_1 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return var_118_1
end

function var_0_0.getDayIndex(arg_119_0)
	local var_119_0 = arg_119_0:getStartTime()
	local var_119_1 = pg.TimeMgr.GetInstance()
	local var_119_2 = var_119_1:GetServerTime()

	return var_119_1:DiffDay(var_119_0, var_119_2) + 1
end

function var_0_0.getStartTime(arg_120_0)
	local var_120_0, var_120_1 = parseTimeConfig(arg_120_0:getConfig("time"))

	if var_120_1 and var_120_1[1] == "newuser" then
		return arg_120_0.stopTime - var_120_1[3] * 86400
	else
		return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_120_0[2])
	end
end

function var_0_0.getNDay(arg_121_0, arg_121_1)
	arg_121_1 = arg_121_1 or arg_121_0:getStartTime()

	local var_121_0 = pg.TimeMgr.GetInstance()

	return var_121_0:DiffDay(arg_121_1, var_121_0:GetServerTime()) + 1
end

function var_0_0.isVariableTime(arg_122_0)
	local var_122_0, var_122_1 = parseTimeConfig(arg_122_0:getConfig("time"))

	return var_122_1 and var_122_1[1] == "newuser"
end

function var_0_0.setSpecialData(arg_123_0, arg_123_1, arg_123_2)
	arg_123_0.speciaData = arg_123_0.speciaData and arg_123_0.speciaData or {}
	arg_123_0.speciaData[arg_123_1] = arg_123_2
end

function var_0_0.getSpecialData(arg_124_0, arg_124_1)
	return arg_124_0.speciaData and arg_124_0.speciaData[arg_124_1] and arg_124_0.speciaData[arg_124_1] or nil
end

function var_0_0.canPermanentFinish(arg_125_0)
	local var_125_0 = arg_125_0:getConfig("type")

	if var_125_0 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		local var_125_1 = arg_125_0:getConfig("config_data")
		local var_125_2 = getProxy(TaskProxy)

		return underscore.all(underscore.flatten({
			var_125_1[#var_125_1]
		}), function(arg_126_0)
			return var_125_2:getFinishTaskById(arg_126_0) ~= nil
		end)
	elseif var_125_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		local var_125_3 = ActivityPtData.New(arg_125_0)

		return var_125_3.level >= #var_125_3.targets
	end

	return false
end

function var_0_0.GetShopTime(arg_127_0)
	local var_127_0 = pg.TimeMgr.GetInstance()
	local var_127_1 = arg_127_0:getStartTime()
	local var_127_2 = arg_127_0.stopTime

	return var_127_0:STimeDescS(var_127_1, "%y.%m.%d") .. " - " .. var_127_0:STimeDescS(var_127_2, "%y.%m.%d")
end

function var_0_0.GetHei5Info(arg_128_0)
	local var_128_0 = pg.black_friday_battlepass_event_pt[arg_128_0.id]
	local var_128_1 = var_128_0.pt
	local var_128_2 = {}
	local var_128_3 = {}

	for iter_128_0, iter_128_1 in ipairs(var_128_0.key_point_display) do
		var_128_3[iter_128_1] = true
	end

	for iter_128_2, iter_128_3 in ipairs(var_128_0.target) do
		table.insert(var_128_2, {
			id = iter_128_2,
			pt = iter_128_3,
			award = pg.black_friday_battlepass_event_award[var_128_0.award[iter_128_2]].drop_client,
			award_pay = pg.black_friday_battlepass_event_award[var_128_0.award_pay[iter_128_2]].drop_client,
			isImportent = var_128_3[iter_128_2]
		})
	end

	local var_128_4 = arg_128_0.data1
	local var_128_5 = arg_128_0.data2 == 1
	local var_128_6 = {}

	for iter_128_4, iter_128_5 in ipairs(arg_128_0.data1_list) do
		var_128_6[iter_128_5] = true
	end

	local var_128_7 = {}

	for iter_128_6, iter_128_7 in ipairs(arg_128_0.data2_list) do
		var_128_7[iter_128_7] = true
	end

	local var_128_8 = 0

	for iter_128_8, iter_128_9 in ipairs(var_128_2) do
		if var_128_4 < iter_128_9.pt then
			break
		else
			var_128_8 = iter_128_8
		end
	end

	return {
		ptId = var_128_1,
		awardList = var_128_2,
		pt = var_128_4,
		isPay = var_128_5,
		awardDic = var_128_6,
		awardPayDic = var_128_7,
		phase = var_128_8
	}
end

function var_0_0.GetHei5UnreceiveAward(arg_129_0)
	local var_129_0 = pg.black_friday_battlepass_event_pt[arg_129_0.id]
	local var_129_1 = {}
	local var_129_2 = {}

	for iter_129_0, iter_129_1 in ipairs(arg_129_0.data1_list) do
		var_129_2[iter_129_1] = true
	end

	for iter_129_2, iter_129_3 in ipairs(var_129_0.target) do
		if iter_129_3 > arg_129_0.data1 then
			break
		elseif not var_129_2[iter_129_3] then
			table.insert(var_129_1, Drop.Create(pg.black_friday_battlepass_event_award[var_129_0.award[iter_129_2]].drop_client))
		end
	end

	if arg_129_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_129_1)
	end

	local var_129_3 = {}

	for iter_129_4, iter_129_5 in ipairs(arg_129_0.data2_list) do
		var_129_3[iter_129_5] = true
	end

	for iter_129_6, iter_129_7 in ipairs(var_129_0.target) do
		if iter_129_7 > arg_129_0.data1 then
			break
		elseif not var_129_3[iter_129_7] then
			table.insert(var_129_1, Drop.Create(pg.black_friday_battlepass_event_award[var_129_0.award_pay[iter_129_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_129_1)
end

function var_0_0.IsActivityReady(arg_130_0)
	return arg_130_0 and not arg_130_0:isEnd() and arg_130_0:readyToAchieve()
end

function var_0_0.NeedLoginRedPoint(arg_131_0)
	return PlayerPrefs.GetString(arg_131_0:GetLoginRedPointKey(), "") ~= arg_131_0:GetLoginRedPointValue()
end

function var_0_0.SetLoginRedPoint(arg_132_0)
	PlayerPrefs.SetString(arg_132_0:GetLoginRedPointKey(), arg_132_0:GetLoginRedPointValue())
end

function var_0_0.GetLoginRedPointValue(arg_133_0)
	return pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
end

function var_0_0.GetLoginRedPointKey(arg_134_0)
	local var_134_0 = arg_134_0:GetPlayerID()

	return string.format("%s_%s", var_134_0, arg_134_0.id)
end

function var_0_0.GetPlayerID(arg_135_0)
	return getProxy(PlayerProxy):getPlayerId()
end

function var_0_0.GetConfigClientSetting(arg_136_0, arg_136_1)
	return arg_136_0:getConfig("config_client")[arg_136_1]
end

function var_0_0.IsMaintenanceFinish(arg_137_0)
	return not arg_137_0:GetConfigClientSetting("no_maintenance")
end

function var_0_0.GetPlayerActivyIDKey(arg_138_0)
	local var_138_0 = getProxy(PlayerProxy):getPlayerId()

	return "Activity_PlayerPrefs_PlayerId_" .. var_138_0 .. "ActivityID_" .. arg_138_0
end

return var_0_0
