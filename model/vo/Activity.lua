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
		[ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN] = ReversePacmanActivity,
		[ActivityConst.ACTIVITY_TYPE_PT_RANK] = PTRankActivity,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = PTBuffActivity,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2] = PTBuffActivity,
		[ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE] = URExchangeActivity
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
	elseif var_18_0 == ActivityConst.ACTIVITY_TYPE_PIZZA_PT or var_18_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF or var_18_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2 then
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
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = ActivityConst.ACTIVITY_TYPE_TASKS,
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
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = ActivityConst.ACTIVITY_TYPE_PIZZA_PT,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2] = ActivityConst.ACTIVITY_TYPE_PIZZA_PT,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = function(arg_37_0)
			local var_37_0 = arg_37_0.data1

			if var_37_0 == 1 then
				local var_37_1 = pg.activity_template_headhunting[arg_37_0.id]
				local var_37_2 = var_37_1.target
				local var_37_3 = 0

				for iter_37_0, iter_37_1 in ipairs(arg_37_0:getClientList()) do
					var_37_3 = var_37_3 + iter_37_1:getPt()
				end

				local var_37_4 = 0

				for iter_37_2 = #var_37_2, 1, -1 do
					if table.contains(arg_37_0.data1_list, var_37_2[iter_37_2]) then
						var_37_4 = iter_37_2

						break
					end
				end

				local var_37_5 = var_37_1.drop_client
				local var_37_6 = math.min(var_37_4 + 1, #var_37_5)
				local var_37_7 = _.any(var_37_1.tasklist, function(arg_38_0)
					local var_38_0 = getProxy(TaskProxy):getTaskById(arg_38_0)

					return var_38_0 and var_38_0:isFinish() and not var_38_0:isReceive()
				end)

				return var_37_3 >= var_37_2[var_37_6] and var_37_4 ~= #var_37_5 or var_37_7
			elseif var_37_0 == 2 then
				local var_37_8 = getProxy(TaskProxy)
				local var_37_9 = pg.activity_template_returnner[arg_37_0.id]

				return _.any(_.flatten(var_37_9.task_list), function(arg_39_0)
					local var_39_0 = var_37_8:getTaskById(arg_39_0)

					return var_39_0 and var_39_0:isFinish()
				end)
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_40_0)
			local var_40_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_40_0:getConfig("config_id"))

			if var_40_0.count > 0 then
				return true
			end

			if var_40_0:getConfig("reward") ~= 0 and var_40_0.usedtime >= var_40_0:getConfig("reward_need") and var_40_0.ultimate == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function(arg_41_0)
			local var_41_0 = pg.activity_event_turning[arg_41_0:getConfig("config_id")]
			local var_41_1 = arg_41_0.data4

			if var_41_1 ~= 0 then
				local var_41_2 = var_41_0.task_table[var_41_1]
				local var_41_3 = getProxy(TaskProxy)

				for iter_41_0, iter_41_1 in ipairs(var_41_2) do
					if (var_41_3:getTaskById(iter_41_1) or var_41_3:getFinishTaskById(iter_41_1)):getTaskStatus() == 1 then
						return true
					end
				end

				local var_41_4 = pg.TimeMgr.GetInstance():DiffDay(arg_41_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_41_4, 1, pg.activity_event_turning[arg_41_0:getConfig("config_id")].total_num) > arg_41_0.data3 then
					for iter_41_2, iter_41_3 in ipairs(var_41_2) do
						if (var_41_3:getTaskById(iter_41_3) or var_41_3:getFinishTaskById(iter_41_3)):getTaskStatus() ~= 2 then
							return false
						end
					end

					return true
				end
			elseif var_41_1 == 0 then
				local var_41_5 = pg.TimeMgr.GetInstance():DiffDay(arg_41_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_41_5, 1, pg.activity_event_turning[arg_41_0:getConfig("config_id")].total_num) > arg_41_0.data3 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function(arg_42_0)
			return not (arg_42_0.data2 > 0)
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function(arg_43_0)
			local var_43_0 = arg_43_0:getConfig("config_client").story
			local var_43_1 = var_43_0 and #var_43_0 or 7
			local var_43_2 = pg.TimeMgr.GetInstance():DiffDay(arg_43_0.data3, pg.TimeMgr.GetInstance():GetServerTime()) + 1
			local var_43_3 = math.clamp(var_43_2, 1, var_43_1)

			if var_43_0 then
				local var_43_4 = pg.NewStoryMgr.GetInstance()
				local var_43_5 = math.clamp(arg_43_0.data2, 0, var_43_1)

				for iter_43_0 = 1, var_43_3 do
					local var_43_6 = var_43_0[iter_43_0][1]

					if var_43_6 and iter_43_0 <= var_43_5 and not var_43_4:IsPlayed(var_43_6) then
						return true
					end
				end
			end

			if var_43_1 <= var_43_3 and var_43_1 <= arg_43_0.data2 and not (arg_43_0.data1 > 0) then
				return true
			end

			if Shrine2022View.IsNeedShowTipForShipCount() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function(arg_44_0)
			local var_44_0 = arg_44_0:getConfig("config_client")[3]
			local var_44_1 = pg.TimeMgr.GetInstance()
			local var_44_2 = var_44_1:DiffDay(arg_44_0.data3, var_44_1:GetServerTime()) + 1 - arg_44_0.data2

			return math.clamp(var_44_2, 0, #var_44_0 - arg_44_0.data2) > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function(arg_45_0)
			local var_45_0 = arg_45_0:GetBuildingIds()

			for iter_45_0, iter_45_1 in ipairs(var_45_0) do
				local var_45_1 = arg_45_0:GetBuildingLevel(iter_45_1)
				local var_45_2 = pg.activity_event_building[iter_45_1]

				if var_45_2 and var_45_1 < #var_45_2.buff then
					local var_45_3 = var_45_2.material[var_45_1]

					if underscore.all(var_45_3, function(arg_46_0)
						local var_46_0 = arg_46_0[1]
						local var_46_1 = arg_46_0[2]
						local var_46_2 = arg_46_0[3]
						local var_46_3 = 0

						if var_46_0 == DROP_TYPE_VITEM then
							local var_46_4 = AcessWithinNull(Item.getConfigData(var_46_1), "link_id")

							assert(var_46_4 == arg_45_0.id)

							var_46_3 = arg_45_0:GetMaterialCount(var_46_1)
						elseif var_46_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_46_5 = AcessWithinNull(pg.activity_drop_type[var_46_0], "activity_id")

							assert(var_46_5)

							bagAct = getProxy(ActivityProxy):getActivityById(var_46_5)
							var_46_3 = bagAct:getVitemNumber(var_46_1)
						end

						return var_46_2 <= var_46_3
					end) then
						return true
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function(arg_47_0, ...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF](arg_47_0, ...) or arg_47_0:CanRequest()
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function(arg_48_0)
			if arg_48_0.data3 > 0 and arg_48_0.data1 ~= 0 then
				return true
			else
				for iter_48_0 = 1, #arg_48_0.data1_list do
					if not bit.band(arg_48_0.data1_list[iter_48_0], ActivityConst.EXPEDITION_TYPE_GOT) ~= 0 then
						if bit.band(arg_48_0.data1_list[iter_48_0], ActivityConst.EXPEDITION_TYPE_OPEN) ~= 0 then
							return true
						elseif bit.band(arg_48_0.data1_list[iter_48_0], ActivityConst.EXPEDITION_TYPE_BAOXIANG) ~= 0 then
							return true
						elseif bit.band(arg_48_0.data1_list[iter_48_0], ActivityConst.EXPEDITION_TYPE_BOSS) ~= 0 then
							return true
						end
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY] = function(arg_49_0)
			local var_49_0 = arg_49_0:getConfig("config_client")

			if var_49_0 and var_49_0.linkGameHubID then
				local var_49_1 = getProxy(MiniGameProxy):GetHubByHubId(var_49_0.linkGameHubID)

				if var_49_1 then
					if var_49_0.trimRed then
						if var_49_1.ultimate == 1 then
							return false
						end

						if var_49_1.usedtime == var_49_1:getConfig("reward_need") then
							return true
						end
					end

					return var_49_1.count > 0
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function(arg_50_0)
			return arg_50_0.data2 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function(arg_51_0)
			local var_51_0 = arg_51_0.data1_list
			local var_51_1 = arg_51_0.data2_list
			local var_51_2 = arg_51_0:GetPicturePuzzleIds()
			local var_51_3 = arg_51_0:getConfig("config_client").linkActID

			if var_51_3 then
				local var_51_4 = getProxy(ActivityProxy):getActivityById(var_51_3)

				if var_51_4 and var_51_4:readyToAchieve() then
					return true
				end
			end

			if _.any(var_51_2, function(arg_52_0)
				local var_52_0 = table.contains(var_51_1, arg_52_0)
				local var_52_1 = table.contains(var_51_0, arg_52_0)

				return not var_52_0 and var_52_1
			end) then
				return true
			end

			local var_51_5 = pg.activity_event_picturepuzzle[arg_51_0.id]

			if var_51_5 and var_51_5.chapter > 0 and arg_51_0.data1 < 1 then
				return true
			end

			if var_51_5 and #var_51_5.auto_finish_args > 0 and arg_51_0.data1 == 1 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = function(arg_53_0)
			return AirFightActivity.readyToAchieve(arg_53_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE] = function(arg_54_0)
			local var_54_0 = WorldInPictureActiviyData.New(arg_54_0)

			return not var_54_0:IsTravelAll() and var_54_0:GetTravelPoint() > 0 or var_54_0:GetDrawPoint() > 0 and var_54_0:AnyAreaCanDraw()
		end,
		[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function(arg_55_0)
			if arg_55_0.data1 == 0 then
				local var_55_0 = arg_55_0:getStartTime()
				local var_55_1 = pg.TimeMgr.GetInstance():GetServerTime()

				if arg_55_0:getConfig("config_client").autounlock <= var_55_1 - var_55_0 then
					return true
				end
			elseif arg_55_0.data1 ~= 0 and arg_55_0.data2 == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_POOL] = function(arg_56_0)
			local var_56_0 = arg_56_0:getConfig("config_data")
			local var_56_1 = getProxy(TaskProxy)

			if arg_56_0.data1 >= #var_56_0 then
				return false
			end

			local var_56_2 = pg.TimeMgr.GetInstance()
			local var_56_3 = (var_56_2:DiffDay(arg_56_0:getStartTime(), var_56_2:GetServerTime()) + 1) * arg_56_0:getConfig("config_id")

			var_56_3 = var_56_3 > #var_56_0 and #var_56_0 or var_56_3

			local var_56_4 = _.any(var_56_0, function(arg_57_0)
				local var_57_0 = var_56_1:getTaskById(arg_57_0)

				return var_57_0 and var_57_0:isFinish()
			end)

			return var_56_3 - arg_56_0.data1 > 0 and var_56_4
		end,
		[ActivityConst.ACTIVITY_TYPE_EVENT] = function(arg_58_0)
			local var_58_0 = getProxy(PlayerProxy):getData().id

			return PlayerPrefs.GetInt("ACTIVITY_TYPE_EVENT_" .. arg_58_0.id .. "_" .. var_58_0) == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function(arg_59_0)
			if arg_59_0.data2 and arg_59_0.data2 <= 0 and arg_59_0.data1 >= pg.activity_event_avatarframe[arg_59_0:getConfig("config_id")].target then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function(arg_60_0)
			local var_60_0, var_60_1 = arg_60_0:GetUpgradeCost()

			if arg_60_0:GetSlotCount() < arg_60_0:GetTotalSlotCount() and var_60_1 <= arg_60_0:GetCoins() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function(arg_61_0)
			local var_61_0 = arg_61_0:getConfig("config_data")[2][1]
			local var_61_1 = arg_61_0:getConfig("config_data")[2][2]
			local var_61_2 = getProxy(PlayerProxy):getRawData():getResource(var_61_0)

			if arg_61_0.data1 > 0 and var_61_1 <= var_61_2 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FLOWER_FIELD] = function(arg_62_0)
			local var_62_0 = pg.TimeMgr.GetInstance()

			return var_62_0:GetServerTime() >= var_62_0:GetTimeToNextTime(math.max(arg_62_0.data1, arg_62_0.data2))
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND] = function(arg_63_0)
			for iter_63_0, iter_63_1 in pairs(getProxy(SixthAnniversaryIslandProxy):GetNodeDic()) do
				if iter_63_1:IsVisual() and iter_63_1:RedDotHint() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function(arg_64_0)
			return Spring2Activity.readyToAchieve(arg_64_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function(arg_65_0)
			local var_65_0 = #arg_65_0.data2_list
			local var_65_1 = arg_65_0:getData1List()
			local var_65_2 = arg_65_0:getConfig("config_data")[2]

			if #var_65_1 == #var_65_2 then
				return false
			end

			local function var_65_3()
				for iter_66_0, iter_66_1 in ipairs(var_65_2) do
					if not table.contains(var_65_1, iter_66_1[1]) and var_65_0 >= iter_66_1[1] then
						return true
					end
				end

				return false
			end

			local function var_65_4()
				local var_67_0 = getProxy(PlayerProxy):getData().id

				return PlayerPrefs.GetInt("DAY_TIP_" .. arg_65_0.id .. "_" .. var_67_0 .. "_" .. arg_65_0:getDayIndex()) == 0
			end

			return var_65_3() or var_65_4()
		end,
		[ActivityConst.ACTIVITY_TYPE_SURVEY] = function(arg_68_0)
			local var_68_0, var_68_1 = getProxy(ActivityProxy):isSurveyOpen()
			local var_68_2 = getProxy(ActivityProxy):isSurveyDone()

			return var_68_0 and not var_68_2 and not SurveyPage.IsEverEnter(var_68_1)
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function(arg_69_0)
			return LaunchBallActivityMgr.GetInvitationAble(arg_69_0.id)
		end,
		[ActivityConst.ACTIVITY_TYPE_GIFT_UP] = function(arg_70_0)
			local var_70_0 = arg_70_0:getConfig("config_client").gifts[2]
			local var_70_1 = math.min(#var_70_0, arg_70_0:getNDay())

			return underscore(var_70_0):chain():first(var_70_1):any(function(arg_71_0)
				local var_71_0 = getProxy(ShopsProxy):GetGiftCommodity(arg_71_0, Goods.TYPE_GIFT_PACKAGE)

				return var_71_0:canPurchase() and var_71_0:inTime() and not var_71_0:IsGroupLimit()
			end):value()
		end,
		[ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE] = function(arg_72_0)
			local var_72_0 = getProxy(ShopsProxy):getActivityShopById(arg_72_0:GetConfigClientSetting("shopId"))

			for iter_72_0, iter_72_1 in ipairs(arg_72_0:GetConfigClientSetting("goodsId")) do
				local var_72_1 = var_72_0:GetCommodityById(iter_72_1)

				if var_72_1:canPurchase() then
					local var_72_2 = var_72_1:GetConsume()

					if var_72_2.count <= var_72_2:getOwnedCount() then
						return true
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING] = function(arg_73_0)
			return arg_73_0:getData1() > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DAILY_STAGE_BONUS] = function(arg_74_0)
			return arg_74_0:NeedLoginRedPoint()
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_RYZA] = function(arg_75_0)
			local var_75_0 = getProxy(ActivityTaskProxy):getTaskById(arg_75_0.id)

			for iter_75_0, iter_75_1 in ipairs(var_75_0) do
				if iter_75_1:getTaskStatus() == 1 then
					return true
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_76_0)
			local var_76_0 = arg_76_0:getConfig("config_id")

			if getProxy(MiniGameProxy):GetHubByHubId(var_76_0).count > 0 then
				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function(arg_77_0)
			local var_77_0 = arg_77_0:getConfig("config_id")
			local var_77_1 = pg.activity_7_day_sign[var_77_0].front_drops
			local var_77_2 = pg.TimeMgr.GetInstance()
			local var_77_3 = var_77_2:GetServerTime()

			return arg_77_0.data1 < #var_77_1 and not var_77_2:IsSameDay(var_77_3, arg_77_0.data2) and var_77_3 > arg_77_0.data2
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_HEI5] = function(arg_78_0)
			return #arg_78_0:GetHei5UnreceiveAward() > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_TownSkinStory] = function(arg_79_0)
			local var_79_0 = pg.NewStoryMgr.GetInstance()

			if arg_79_0.data1 > 0 and underscore.any(arg_79_0:GetConfigClientSetting("story"), function(arg_80_0)
				return not var_79_0:IsPlayed(arg_80_0[1])
			end) then
				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function(arg_81_0)
			return arg_81_0:CanGetAward() or not arg_81_0:TodayIsSigned()
		end,
		[ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_MAIL] = function(arg_82_0)
			return getProxy(PlayerProxy):getRawData().level >= arg_82_0:getConfig("config_id") and arg_82_0.data1 == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_GAME_PT] = function(arg_83_0)
			local var_83_0 = pg.island_activity_pt_page[arg_83_0:getIslandConfig("config_id")].task_id
			local var_83_1 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

			return IslandGamePtTemplatePage.ShouldFirstTip(arg_83_0.id) or _.any(var_83_0, function(arg_84_0)
				local var_84_0 = var_83_1:GetTask(arg_84_0)

				return var_84_0 and var_84_0:IsFinish() and not var_83_1:IsFinishTask(arg_84_0)
			end)
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_CHEATE_TAVERN] = function(arg_85_0)
			local var_85_0 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.ISLAND_BAR_ACT_ID)

			for iter_85_0, iter_85_1 in ipairs(var_85_0) do
				if iter_85_1:getTaskStatus() == 1 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN] = function(arg_86_0)
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

function var_0_0.IsShowTipById(arg_87_0)
	var_0_0.ShowTipTableById = var_0_0.ShowTipTableById or {
		[ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE] = function(arg_88_0)
			local var_88_0 = getProxy(SkirmishProxy)

			var_88_0:UpdateSkirmishProgress()

			local var_88_1 = var_88_0:getRawData()
			local var_88_2 = 0
			local var_88_3 = 0

			for iter_88_0, iter_88_1 in ipairs(var_88_1) do
				local var_88_4 = iter_88_1:GetState()

				var_88_2 = var_88_4 > SkirmishVO.StateInactive and var_88_2 + 1 or var_88_2
				var_88_3 = var_88_4 == SkirmishVO.StateClear and var_88_3 + 1 or var_88_3
			end

			return var_88_3 < var_88_2
		end,
		[ActivityConst.POCKY_SKIN_LOGIN] = function(arg_89_0)
			local var_89_0 = arg_89_0:getConfig("config_client").linkids
			local var_89_1 = getProxy(TaskProxy)
			local var_89_2 = getProxy(ActivityProxy)
			local var_89_3 = var_89_2:getActivityById(var_89_0[1])
			local var_89_4 = var_89_2:getActivityById(var_89_0[2])
			local var_89_5 = var_89_2:getActivityById(var_89_0[3])

			assert(var_89_3 and var_89_4 and var_89_5)

			local function var_89_6()
				return var_89_3 and var_89_3:readyToAchieve()
			end

			local function var_89_7()
				return var_89_4 and var_89_4:readyToAchieve()
			end

			local function var_89_8()
				local var_92_0 = _.flatten(arg_89_0:getConfig("config_data"))

				for iter_92_0 = 1, math.min(#var_92_0, var_89_4.data3) do
					local var_92_1 = var_92_0[iter_92_0]
					local var_92_2 = var_89_1:getTaskById(var_92_1)

					if var_92_2 and var_92_2:isFinish() and not var_92_2:isReceive() then
						return true
					end
				end
			end

			local function var_89_9()
				if not (var_89_5 and var_89_5:readyToAchieve()) or not var_89_3 then
					return false
				end

				local var_93_0 = ActivityPtData.New(var_89_3)

				return var_93_0.level >= #var_93_0.targets
			end

			return var_89_8() or var_89_6() or var_89_7() or var_89_9()
		end,
		[ActivityConst.TOWERCLIMBING_SIGN] = function(arg_94_0)
			local var_94_0 = getProxy(MiniGameProxy):GetHubByHubId(9)
			local var_94_1 = var_94_0.ultimate
			local var_94_2 = var_94_0:getConfig("reward_need")
			local var_94_3 = var_94_0.usedtime

			return var_94_1 == 0 and var_94_2 <= var_94_3
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
		[ActivityConst.NINJA_CITY_MAIN_ACTIVITY_ID] = function(arg_95_0)
			if CityRebuildBookLayer.ShouldShowTip() or CityRebuildTasksLayer.ShouldShowTip() then
				return true
			end

			return false
		end,
		[ActivityConst.MALL_MAIN_ACTIVITY_ID] = function(arg_96_0)
			return AnniversaryNineMainPage.IsTip()
		end,
		[ActivityConst.SAILING_SHIP_3_SKIN_ACT_ID] = SailingShip3SkinLayer.ShouldShowTip,
		[ActivityConst.HelenaPT_ACT_ID] = function(arg_97_0)
			return HelenaScenarioPage:IsShowRed(arg_97_0)
		end,
		[ActivityConst.LOVE_LETTER_LOGIN_ID] = function(arg_98_0)
			local var_98_0 = arg_98_0:getNDay()

			for iter_98_0 = 1, var_98_0 do
				local var_98_1 = arg_98_0:getConfig("config_data")[iter_98_0]
				local var_98_2 = var_98_1 and getProxy(TaskProxy):getTaskVO(var_98_1) or nil

				if var_98_2 and var_98_2:getTaskStatus() == 1 then
					return true
				end
			end

			return false
		end
	}

	local var_87_0 = var_0_0.ShowTipTableById[arg_87_0.id]

	return tobool(var_87_0), var_87_0 and var_87_0(arg_87_0)
end

function var_0_0.activityTasksSubTypeFunc(arg_99_0, arg_99_1)
	if arg_99_1 == 1 then
		local var_99_0 = 1
		local var_99_1 = getProxy(TaskProxy)
		local var_99_2 = arg_99_0:getConfig("config_client").unlock_task
		local var_99_3 = arg_99_0:getNDay()
		local var_99_4 = #var_99_2
		local var_99_5 = math.min(var_99_3, var_99_4)
		local var_99_6 = true

		for iter_99_0 = 1, var_99_5 do
			if not var_99_6 then
				break
			end

			var_99_0 = iter_99_0

			if iter_99_0 < var_99_5 then
				for iter_99_1, iter_99_2 in ipairs(var_99_2[iter_99_0]) do
					local var_99_7 = var_99_1:getTaskById(iter_99_2) or var_99_1:getFinishTaskById(iter_99_2)

					if not var_99_7 or var_99_7:getTaskStatus() ~= 2 then
						var_99_6 = false

						break
					end
				end
			end
		end

		local var_99_8 = math.min(var_99_0, var_99_4)

		for iter_99_3, iter_99_4 in ipairs(var_99_2[var_99_8]) do
			local var_99_9 = var_99_1:getTaskById(iter_99_4) or var_99_1:getFinishTaskById(iter_99_4)

			if not var_99_9 then
				return false
			end

			if var_99_9:getTaskStatus() == 1 then
				return true
			end
		end
	end

	if arg_99_1 == TASK_SUB_TYPE_CLIENT_TRIGGER then
		local var_99_10, var_99_11 = getActivityTask(arg_99_0, true)

		return var_99_10 and (not var_99_11 or var_99_11:getTaskStatus() ~= 2)
	end

	return false
end

function var_0_0.isShow(arg_100_0)
	if LOCK_SKIN_US then
		local var_100_0 = pg.gameset.levellimit_skinstory.key_value
		local var_100_1 = pg.gameset.levellimit_skinstory.description

		if var_100_0 >= getProxy(PlayerProxy):getRawData().level and table.contains(var_100_1, arg_100_0.id) then
			return false
		end
	end

	if arg_100_0:getConfig("is_show") <= 0 then
		return false
	end

	if arg_100_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return arg_100_0.data1 ~= 0
	elseif arg_100_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY then
		local var_100_2 = arg_100_0:getConfig("config_client").display_link

		if var_100_2 then
			return underscore.any(var_100_2, function(arg_101_0)
				return arg_101_0[2] == 0 or pg.TimeMgr.GetInstance():inTime(ShopConst.GetShopConfig(arg_101_0[2]).time)
			end)
		end
	elseif arg_100_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SURVEY then
		local var_100_3 = getProxy(ActivityProxy)
		local var_100_4 = var_100_3:isSurveyOpen()
		local var_100_5 = var_100_3:isSurveyDone()

		return var_100_4 and not var_100_5
	elseif arg_100_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE then
		local var_100_6 = getProxy(ShopsProxy):getActivityShopById(arg_100_0:GetConfigClientSetting("shopId"))

		for iter_100_0, iter_100_1 in ipairs(arg_100_0:GetConfigClientSetting("goodsId")) do
			if var_100_6:GetCommodityById(iter_100_1):canPurchase() then
				return true
			end
		end

		return false
	elseif arg_100_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_RYZA and table.contains({
		ActivityConst.DORM_SIGN_ID,
		ActivityConst.DORM_SIGN_ID_2,
		ActivityConst.DORM_SIGN_ID_3
	}, arg_100_0:getConfig("id")) then
		return #getProxy(ActivityProxy):getActivityById(arg_100_0:getConfig("id")):getConfig("config_data") ~= #getProxy(ActivityTaskProxy):getFinishTaskById(arg_100_0:getConfig("id"))
	end

	return true
end

function var_0_0.isAfterShow(arg_102_0)
	if arg_102_0.configId == ActivityConst.ISLAND_SIGN_ID then
		local var_102_0 = _.flatten(arg_102_0:getConfig("config_data"))
		local var_102_1 = getProxy(ActivityTaskProxy):GetActivityTasks(arg_102_0.id)

		return _.all(var_102_0, function(arg_103_0)
			local var_103_0 = var_102_1[arg_103_0]

			return var_103_0 and var_103_0:isOver()
		end)
	end

	if arg_102_0.configId == ActivityConst.UR_TASK_ACT_ID or arg_102_0.configId == ActivityConst.SPECIAL_WEAPON_ACT_ID then
		local var_102_2 = getProxy(TaskProxy)

		return underscore.all(arg_102_0:getConfig("config_data")[1], function(arg_104_0)
			local var_104_0 = var_102_2:getTaskVO(arg_104_0)

			return var_104_0 and var_104_0:isReceive()
		end)
	end

	return false
end

function var_0_0.getPageABNames(arg_105_0)
	local var_105_0 = arg_105_0:getConfig("page_info")

	return {
		var_105_0.ui_name,
		var_105_0.ui_name2
	}
end

function var_0_0.checkPageABExist(arg_106_0)
	if not IsUnityEditor then
		return true
	end

	return underscore.all(arg_106_0:getPageABNames(), function(arg_107_0)
		return checkABExist(string.format("ui/%s", arg_107_0))
	end)
end

function var_0_0.getShowPriority(arg_108_0)
	return arg_108_0:getConfig("is_show")
end

function var_0_0.isCorePage(arg_109_0, arg_109_1)
	return arg_109_0:getConfig("page_core") == arg_109_1
end

function var_0_0.left4Day(arg_110_0)
	if arg_110_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function var_0_0.getAwardInfos(arg_111_0)
	return arg_111_0.data1KeyValueList or {}
end

function var_0_0.updateData(arg_112_0, arg_112_1, arg_112_2)
	if arg_112_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not arg_112_0:getAwardInfos()[arg_112_1] then
			arg_112_0.data1KeyValueList[arg_112_1] = {}
		end

		for iter_112_0, iter_112_1 in ipairs(arg_112_2) do
			if arg_112_0.data1KeyValueList[arg_112_1][iter_112_1] then
				arg_112_0.data1KeyValueList[arg_112_1][iter_112_1] = arg_112_0.data1KeyValueList[arg_112_1][iter_112_1] + 1
			else
				arg_112_0.data1KeyValueList[arg_112_1][iter_112_1] = 1
			end
		end
	end
end

function var_0_0.getTaskShip(arg_113_0)
	return arg_113_0:getConfig("config_client")[1]
end

function var_0_0.getNotificationMsg(arg_114_0)
	local var_114_0 = arg_114_0:getConfig("type")
	local var_114_1 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if var_114_0 == ActivityConst.ACTIVITY_TYPE_SHOP or var_114_0 == ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE or var_114_0 == ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE then
		var_114_1 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif var_114_0 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		var_114_1 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif var_114_0 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		var_114_1 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif var_114_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS or var_114_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER then
		var_114_1 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return var_114_1
end

function var_0_0.getDayIndex(arg_115_0)
	local var_115_0 = arg_115_0:getStartTime()
	local var_115_1 = pg.TimeMgr.GetInstance()
	local var_115_2 = var_115_1:GetServerTime()

	return var_115_1:DiffDay(var_115_0, var_115_2) + 1
end

function var_0_0.getStartTime(arg_116_0)
	if arg_116_0:getConfig("time") == "stop" then
		local var_116_0 = getProxy(ActivityRemasterProxy):GetActivaingReamsterData()

		if not var_116_0 then
			return ""
		end

		return var_116_0:GetStartTime(arg_116_0.id)
	else
		local var_116_1, var_116_2 = parseTimeConfig(arg_116_0:getConfig("time"))

		if var_116_2 and var_116_2[1] == "newuser" then
			return arg_116_0.stopTime - var_116_2[3] * 86400
		else
			return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_116_1[2])
		end
	end
end

function var_0_0.getNDay(arg_117_0, arg_117_1)
	arg_117_1 = arg_117_1 or arg_117_0:getStartTime()

	local var_117_0 = pg.TimeMgr.GetInstance()

	return var_117_0:DiffDay(arg_117_1, var_117_0:GetServerTime()) + 1
end

function var_0_0.isVariableTime(arg_118_0)
	local var_118_0, var_118_1 = parseTimeConfig(arg_118_0:getConfig("time"))

	return var_118_1 and var_118_1[1] == "newuser"
end

function var_0_0.setSpecialData(arg_119_0, arg_119_1, arg_119_2)
	arg_119_0.speciaData = arg_119_0.speciaData and arg_119_0.speciaData or {}
	arg_119_0.speciaData[arg_119_1] = arg_119_2
end

function var_0_0.getSpecialData(arg_120_0, arg_120_1)
	return arg_120_0.speciaData and arg_120_0.speciaData[arg_120_1] and arg_120_0.speciaData[arg_120_1] or nil
end

function var_0_0.canPermanentFinish(arg_121_0)
	local var_121_0 = arg_121_0:getConfig("type")

	if var_121_0 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		local var_121_1 = arg_121_0:getConfig("config_data")
		local var_121_2 = getProxy(TaskProxy)

		return underscore.all(underscore.flatten({
			var_121_1[#var_121_1]
		}), function(arg_122_0)
			return var_121_2:getFinishTaskById(arg_122_0) ~= nil
		end)
	elseif var_121_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF or var_121_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2 then
		local var_121_3 = ActivityPtData.New(arg_121_0)

		return var_121_3.level >= #var_121_3.targets
	end

	return false
end

function var_0_0.GetShopTime(arg_123_0)
	local var_123_0 = pg.TimeMgr.GetInstance()
	local var_123_1 = arg_123_0:getStartTime()
	local var_123_2 = arg_123_0.stopTime
	local var_123_3 = var_123_0:STimeDescS(var_123_2, "*t")

	if var_123_3.hour == 0 and var_123_3.min == 0 and var_123_3.sec == 0 then
		return var_123_0:STimeDescS(var_123_1, "%y.%m.%d") .. " - " .. string.format("%s.%s.%s", var_123_3.year, var_123_3.month, var_123_3.day - 1)
	else
		return var_123_0:STimeDescS(var_123_1, "%y.%m.%d") .. " - " .. var_123_0:STimeDescS(var_123_2, "%y.%m.%d")
	end
end

function var_0_0.GetHei5Info(arg_124_0)
	local var_124_0 = pg.black_friday_battlepass_event_pt[arg_124_0.id]
	local var_124_1 = var_124_0.pt
	local var_124_2 = {}
	local var_124_3 = {}

	for iter_124_0, iter_124_1 in ipairs(var_124_0.key_point_display) do
		var_124_3[iter_124_1] = true
	end

	for iter_124_2, iter_124_3 in ipairs(var_124_0.target) do
		table.insert(var_124_2, {
			id = iter_124_2,
			pt = iter_124_3,
			award = pg.black_friday_battlepass_event_award[var_124_0.award[iter_124_2]].drop_client,
			award_pay = pg.black_friday_battlepass_event_award[var_124_0.award_pay[iter_124_2]].drop_client,
			isImportent = var_124_3[iter_124_2]
		})
	end

	local var_124_4 = arg_124_0.data1
	local var_124_5 = arg_124_0.data2 == 1
	local var_124_6 = {}

	for iter_124_4, iter_124_5 in ipairs(arg_124_0.data1_list) do
		var_124_6[iter_124_5] = true
	end

	local var_124_7 = {}

	for iter_124_6, iter_124_7 in ipairs(arg_124_0.data2_list) do
		var_124_7[iter_124_7] = true
	end

	local var_124_8 = 0

	for iter_124_8, iter_124_9 in ipairs(var_124_2) do
		if var_124_4 < iter_124_9.pt then
			break
		else
			var_124_8 = iter_124_8
		end
	end

	return {
		ptId = var_124_1,
		awardList = var_124_2,
		pt = var_124_4,
		isPay = var_124_5,
		awardDic = var_124_6,
		awardPayDic = var_124_7,
		phase = var_124_8
	}
end

function var_0_0.GetHei5UnreceiveAward(arg_125_0)
	local var_125_0 = pg.black_friday_battlepass_event_pt[arg_125_0.id]
	local var_125_1 = {}
	local var_125_2 = {}

	for iter_125_0, iter_125_1 in ipairs(arg_125_0.data1_list) do
		var_125_2[iter_125_1] = true
	end

	for iter_125_2, iter_125_3 in ipairs(var_125_0.target) do
		if iter_125_3 > arg_125_0.data1 then
			break
		elseif not var_125_2[iter_125_3] then
			table.insert(var_125_1, Drop.Create(pg.black_friday_battlepass_event_award[var_125_0.award[iter_125_2]].drop_client))
		end
	end

	if arg_125_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_125_1)
	end

	local var_125_3 = {}

	for iter_125_4, iter_125_5 in ipairs(arg_125_0.data2_list) do
		var_125_3[iter_125_5] = true
	end

	for iter_125_6, iter_125_7 in ipairs(var_125_0.target) do
		if iter_125_7 > arg_125_0.data1 then
			break
		elseif not var_125_3[iter_125_7] then
			table.insert(var_125_1, Drop.Create(pg.black_friday_battlepass_event_award[var_125_0.award_pay[iter_125_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_125_1)
end

function var_0_0.IsActivityReady(arg_126_0)
	return arg_126_0 and not arg_126_0:isEnd() and arg_126_0:readyToAchieve()
end

function var_0_0.NeedLoginRedPoint(arg_127_0)
	return PlayerPrefs.GetString(arg_127_0:GetLoginRedPointKey(), "") ~= arg_127_0:GetLoginRedPointValue()
end

function var_0_0.SetLoginRedPoint(arg_128_0)
	PlayerPrefs.SetString(arg_128_0:GetLoginRedPointKey(), arg_128_0:GetLoginRedPointValue())
end

function var_0_0.GetLoginRedPointValue(arg_129_0)
	return pg.TimeMgr.GetInstance():STimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%Y/%m/%d")
end

function var_0_0.GetLoginRedPointKey(arg_130_0)
	local var_130_0 = arg_130_0:GetPlayerID()

	return string.format("%s_%s", var_130_0, arg_130_0.id)
end

function var_0_0.GetPlayerID(arg_131_0)
	return getProxy(PlayerProxy):getPlayerId()
end

function var_0_0.GetConfigClientSetting(arg_132_0, arg_132_1)
	return arg_132_0:getConfig("config_client")[arg_132_1]
end

function var_0_0.IsMaintenanceFinish(arg_133_0)
	return not arg_133_0:GetConfigClientSetting("no_maintenance")
end

function var_0_0.GetPlayerActivyIDKey(arg_134_0)
	local var_134_0 = getProxy(PlayerProxy):getPlayerId()

	return "Activity_PlayerPrefs_PlayerId_" .. var_134_0 .. "ActivityID_" .. arg_134_0
end

function var_0_0.GetConfigClientPTDrop(arg_135_0)
	if arg_135_0:isEnd() then
		return nil
	end

	if arg_135_0:GetConfigClientSetting("PT_ACT") then
		local var_135_0 = getProxy(ActivityProxy):getActivityById(arg_135_0:GetConfigClientSetting("PT_ACT"))

		return var_135_0 and var_135_0:GetPTDrop() or nil
	elseif arg_135_0:GetConfigClientSetting("PTID") then
		return Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = arg_135_0:GetConfigClientSetting("PTID")
		})
	elseif arg_135_0:GetConfigClientSetting("ptId") then
		return Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = arg_135_0:GetConfigClientSetting("ptId")
		})
	end

	return nil
end

function var_0_0.GetConfigClientPTActivity(arg_136_0)
	if arg_136_0:isEnd() then
		return nil
	end

	if arg_136_0:GetConfigClientSetting("PT_ACT") then
		return getProxy(ActivityProxy):getActivityById(arg_136_0:GetConfigClientSetting("PT_ACT"))
	else
		local var_136_0 = arg_136_0:GetConfigClientPTDrop()

		return var_136_0 and getProxy(ActivityProxy):GetPTActivityByRes(var_136_0) or nil
	end
end

local function var_0_2(arg_137_0)
	local var_137_0 = pg.TimeMgr.GetInstance():STimeDescC(arg_137_0.stopTime, "%Y/%m/%d/%H/%M/%S")
	local var_137_1 = string.split(var_137_0, "/")
	local var_137_2 = pg.TimeMgr.GetInstance():STimeDescC(arg_137_0:getStartTime(), "%Y/%m/%d/%H/%M/%S")
	local var_137_3 = string.split(var_137_2, "/")
	local var_137_4 = (arg_137_0:getConfig("config_client").is_maintain or 0) == ActivityRemasterData.MAINTAIN

	return GetActTimeDesc(false, var_137_4, var_137_3[2], var_137_3[3], var_137_1[2], var_137_1[3], var_137_1[4], var_137_1[5], var_137_1[6])
end

function var_0_0.GetActivityTimeStr(arg_138_0, arg_138_1)
	local var_138_0 = arg_138_0

	if var_138_0:getConfig("time") == "stop" then
		local var_138_1 = getProxy(ActivityRemasterProxy):GetActivaingReamsterData()

		if not var_138_1 then
			return ""
		end

		return var_138_1:GetActivityTimeDesc(var_138_0.id)
	elseif arg_138_1 then
		return ""
	else
		return var_0_2(var_138_0)
	end
end

return var_0_0
