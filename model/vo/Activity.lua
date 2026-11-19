local var_0_0 = class("Activity", import(".BaseVO"))

var_0_0.MAINTAIN = 0
var_0_0.NATURAL_EXPIRE = 1

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
		[ActivityConst.ACTIVITY_TYPE_PT_HEI5] = Hei5Activity,
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
	local var_25_2 = arg_25_0:IsShowTipByClient()

	if var_25_0 then
		return var_25_1
	end

	if var_25_2 then
		return var_25_2
	end

	var_0_0.readyToAchieveDic = var_0_0.readyToAchieveDic or {
		[ActivityConst.ACTIVITY_TYPE_DONOTHING] = function(arg_26_0)
			if LevelDropUpActUtil.IsLevelDropUpAct(arg_26_0.id) then
				return LevelDropUpActUtil.ShouldTipLevelDropUpAct(arg_26_0.id)
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function(arg_27_0)
			local var_27_0 = os.difftime(pg.TimeMgr.GetInstance():GetServerTime(), arg_27_0.data3)

			return math.ceil(var_27_0 / 86400) > arg_27_0.data2 and arg_27_0.data2 < arg_27_0:getConfig("config_data")[4]
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = function(arg_28_0)
			local var_28_0 = getProxy(PlayerProxy):getRawData()
			local var_28_1 = pg.activity_level_award[arg_28_0:getConfig("config_id")]

			for iter_28_0 = 1, #var_28_1.front_drops do
				local var_28_2 = var_28_1.front_drops[iter_28_0][1]

				if var_28_2 <= var_28_0.level and not _.include(arg_28_0.data1_list, var_28_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CHARGEAWARD] = function(arg_29_0)
			return ChargeAwardPage.IsShowTip(arg_29_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function(arg_30_0)
			local var_30_0 = getProxy(PlayerProxy):getRawData()
			local var_30_1 = pg.activity_event_chapter_award[arg_30_0:getConfig("config_id")]

			for iter_30_0 = 1, #var_30_1.chapter do
				local var_30_2 = var_30_1.chapter[iter_30_0]

				if getProxy(ChapterProxy):isClear(var_30_2) and not _.include(arg_30_0.data1_list, var_30_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASKS] = function(arg_31_0)
			local var_31_0 = arg_31_0:getConfig("config_client").subType

			if var_31_0 then
				return arg_31_0:activityTasksSubTypeFunc(var_31_0)
			end

			local var_31_1 = getProxy(TaskProxy)
			local var_31_2 = _.flatten(arg_31_0:getConfig("config_data"))

			if IslandTaskActhelper.IsIslandTaskAct(arg_31_0) then
				return IslandTaskActhelper.ShouldTipIslandTask(arg_31_0)
			end

			if _.any(var_31_2, function(arg_32_0)
				local var_32_0 = var_31_1:getTaskById(arg_32_0)

				return var_32_0 and var_32_0:isFinish() and not var_32_0:isReceive()
			end) then
				return true
			end

			local var_31_3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

			if var_31_3 and not var_31_3:isEnd() and var_31_3:getConfig("config_client").linkActID == arg_31_0.id and var_31_3:readyToAchieve() then
				return true
			end

			if arg_31_0:getConfig("config_client") and arg_31_0:getConfig("config_client").decodeGameId then
				local var_31_4 = arg_31_0:getConfig("config_client").decodeGameId
				local var_31_5 = getProxy(MiniGameProxy):GetHubByGameId(var_31_4)

				if var_31_5 then
					local var_31_6 = arg_31_0:getConfig("config_data")
					local var_31_7 = var_31_6[#var_31_6]
					local var_31_8 = _.all(var_31_7, function(arg_33_0)
						return getProxy(TaskProxy):getFinishTaskById(arg_33_0) ~= nil
					end)

					if var_31_5.ultimate <= 0 and var_31_8 then
						return true
					end
				end
			end

			if arg_31_0:getConfig("config_client") and arg_31_0:getConfig("config_client").linkTaskPoolAct then
				local var_31_9 = arg_31_0:getConfig("config_client").linkTaskPoolAct
				local var_31_10 = getProxy(ActivityProxy):getActivityById(var_31_9)

				if var_31_10 and var_31_10:readyToAchieve() then
					return true
				end
			end

			if arg_31_0:getConfig("config_client") and arg_31_0:getConfig("config_client").link_act then
				local var_31_11 = arg_31_0:getConfig("config_client").link_act
				local var_31_12 = getProxy(ActivityProxy):getActivityById(var_31_11)

				if var_31_12 and var_31_12:readyToAchieve() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = ActivityConst.ACTIVITY_TYPE_TASKS,
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
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = ActivityConst.ACTIVITY_TYPE_PIZZA_PT,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2] = ActivityConst.ACTIVITY_TYPE_PIZZA_PT,
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

			if var_44_0 then
				local var_44_4 = pg.NewStoryMgr.GetInstance()
				local var_44_5 = math.clamp(arg_44_0.data2, 0, var_44_1)

				for iter_44_0 = 1, var_44_3 do
					local var_44_6 = var_44_0[iter_44_0][1]

					if var_44_6 and iter_44_0 <= var_44_5 and not var_44_4:IsPlayed(var_44_6) then
						return true
					end
				end
			end

			if var_44_1 <= var_44_3 and var_44_1 <= arg_44_0.data2 and not (arg_44_0.data1 > 0) then
				return true
			end

			if Shrine2022View.IsNeedShowTipForShipCount() then
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
			if getProxy(ShopsProxy):ShouldRefreshChargeList() then
				if not arg_71_0.requestingChargeList then
					arg_71_0.requestingChargeList = true

					pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
						callback = function()
							arg_71_0.requestingChargeList = nil

							pg.m02:sendNotification(ActivityProxy.ACTIVITY_UPDATED, arg_71_0)
						end
					})
				end

				return false
			end

			local var_71_0 = arg_71_0:getConfig("config_client").gifts[2]
			local var_71_1 = math.min(#var_71_0, arg_71_0:getNDay())

			return underscore(var_71_0):chain():first(var_71_1):any(function(arg_73_0)
				local var_73_0 = getProxy(ShopsProxy):GetGiftCommodity(arg_73_0, Goods.TYPE_GIFT_PACKAGE)

				return var_73_0:canPurchase() and var_73_0:inTime() and not var_73_0:IsGroupLimit()
			end):value()
		end,
		[ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE] = function(arg_74_0)
			local var_74_0 = getProxy(ShopsProxy):getActivityShopById(arg_74_0:GetConfigClientSetting("shopId"))

			for iter_74_0, iter_74_1 in ipairs(arg_74_0:GetConfigClientSetting("goodsId")) do
				local var_74_1 = var_74_0:GetCommodityById(iter_74_1)

				if var_74_1:canPurchase() then
					local var_74_2 = var_74_1:GetConsume()

					if var_74_2.count <= var_74_2:getOwnedCount() then
						return true
					end
				end
			end

			return false
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
		end,
		[ActivityConst.ACTIVITY_TYPE_TownSkinStory] = function(arg_81_0)
			local var_81_0 = pg.NewStoryMgr.GetInstance()

			if arg_81_0.data1 > 0 and underscore.any(arg_81_0:GetConfigClientSetting("story"), function(arg_82_0)
				return not var_81_0:IsPlayed(arg_82_0[1])
			end) then
				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function(arg_83_0)
			return arg_83_0:CanGetAward() or not arg_83_0:TodayIsSigned()
		end,
		[ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_MAIL] = function(arg_84_0)
			return getProxy(PlayerProxy):getRawData().level >= arg_84_0:getConfig("config_id") and arg_84_0.data1 == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_GAME_PT] = function(arg_85_0)
			local var_85_0 = pg.island_activity_pt_page[arg_85_0:getIslandConfig("config_id")].task_id
			local var_85_1 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

			return IslandGamePtTemplatePage.ShouldFirstTip(arg_85_0.id) or _.any(var_85_0, function(arg_86_0)
				local var_86_0 = var_85_1:GetTask(arg_86_0)

				return var_86_0 and var_86_0:IsFinish() and not var_85_1:IsFinishTask(arg_86_0)
			end)
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND_CHEATE_TAVERN] = function(arg_87_0)
			local var_87_0 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.ISLAND_BAR_ACT_ID)

			for iter_87_0, iter_87_1 in ipairs(var_87_0) do
				if iter_87_1:getTaskStatus() == 1 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN] = function(arg_88_0)
			print("TODO: 红点功能")

			return false
		end
	}

	return switch(arg_25_0:getConfig("type"), var_0_0.readyToAchieveDic, nil, arg_25_0)
end

function var_0_0.IsShowTipByClient(arg_89_0)
	local var_89_0 = arg_89_0:getConfig("config_client")

	if var_89_0.sub_act_id then
		local var_89_1 = getProxy(ActivityProxy):getActivityById(var_89_0.sub_act_id)

		return var_89_1 and not var_89_1:isEnd() and var_89_1:readyToAchieve()
	elseif var_89_0.is_showMedal then
		local var_89_2 = var_89_0.medal_group_id

		return ActivityMedalGroup.showTip(var_89_2)
	elseif var_89_0.is_clickOnce then
		local var_89_3 = Activity.GetPlayerActivyIDKey(arg_89_0:getConfig("id"))

		return PlayerPrefs.GetInt(var_89_3, 0) == 0
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
		end,
		[ActivityConst.WindFogCorridor_SkinStory_MainPage] = function(arg_102_0)
			local var_102_0 = pg.NewStoryMgr.GetInstance()

			if arg_102_0.data1 > 0 and underscore.any(arg_102_0:GetConfigClientSetting("story"), function(arg_103_0)
				return not var_102_0:IsPlayed(arg_103_0[1])
			end) then
				return true
			end

			return WindFogCorridorSkinPageLayer.IsShowRed()
		end
	}

	local var_90_0 = var_0_0.ShowTipTableById[arg_90_0.id]

	return tobool(var_90_0), var_90_0 and var_90_0(arg_90_0)
end

function var_0_0.activityTasksSubTypeFunc(arg_104_0, arg_104_1)
	if arg_104_1 == 1 then
		local var_104_0 = 1
		local var_104_1 = getProxy(TaskProxy)
		local var_104_2 = arg_104_0:getConfig("config_client").unlock_task
		local var_104_3 = arg_104_0:getNDay()
		local var_104_4 = #var_104_2
		local var_104_5 = math.min(var_104_3, var_104_4)
		local var_104_6 = true

		for iter_104_0 = 1, var_104_5 do
			if not var_104_6 then
				break
			end

			var_104_0 = iter_104_0

			if iter_104_0 < var_104_5 then
				for iter_104_1, iter_104_2 in ipairs(var_104_2[iter_104_0]) do
					local var_104_7 = var_104_1:getTaskById(iter_104_2) or var_104_1:getFinishTaskById(iter_104_2)

					if not var_104_7 or var_104_7:getTaskStatus() ~= 2 then
						var_104_6 = false

						break
					end
				end
			end
		end

		local var_104_8 = math.min(var_104_0, var_104_4)

		for iter_104_3, iter_104_4 in ipairs(var_104_2[var_104_8]) do
			local var_104_9 = var_104_1:getTaskById(iter_104_4) or var_104_1:getFinishTaskById(iter_104_4)

			if not var_104_9 then
				return false
			end

			if var_104_9:getTaskStatus() == 1 then
				return true
			end
		end
	end

	if arg_104_1 == TASK_SUB_TYPE_CLIENT_TRIGGER then
		local var_104_10, var_104_11 = getActivityTask(arg_104_0, true)

		return var_104_10 and (not var_104_11 or var_104_11:getTaskStatus() ~= 2)
	end

	return false
end

function var_0_0.isShow(arg_105_0)
	if LOCK_SKIN_US then
		local var_105_0 = pg.gameset.levellimit_skinstory.key_value
		local var_105_1 = pg.gameset.levellimit_skinstory.description

		if var_105_0 >= getProxy(PlayerProxy):getRawData().level and table.contains(var_105_1, arg_105_0.id) then
			return false
		end
	end

	if arg_105_0:getConfig("is_show") <= 0 then
		return false
	end

	if arg_105_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return arg_105_0.data1 ~= 0
	elseif arg_105_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY then
		local var_105_2 = arg_105_0:getConfig("config_client").display_link

		if var_105_2 then
			return underscore.any(var_105_2, function(arg_106_0)
				return arg_106_0[2] == 0 or pg.TimeMgr.GetInstance():inTime(ShopConst.GetShopConfig(arg_106_0[2]).time)
			end)
		end
	elseif arg_105_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SURVEY then
		local var_105_3 = getProxy(ActivityProxy)
		local var_105_4 = var_105_3:isSurveyOpen()
		local var_105_5 = var_105_3:isSurveyDone()

		return var_105_4 and not var_105_5
	elseif arg_105_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE then
		local var_105_6 = getProxy(ShopsProxy):getActivityShopById(arg_105_0:GetConfigClientSetting("shopId"))

		for iter_105_0, iter_105_1 in ipairs(arg_105_0:GetConfigClientSetting("goodsId")) do
			if var_105_6:GetCommodityById(iter_105_1):canPurchase() then
				return true
			end
		end

		return false
	elseif arg_105_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_RYZA and table.contains({
		ActivityConst.DORM_SIGN_ID,
		ActivityConst.DORM_SIGN_ID_2,
		ActivityConst.DORM_SIGN_ID_3
	}, arg_105_0:getConfig("id")) then
		return #getProxy(ActivityProxy):getActivityById(arg_105_0:getConfig("id")):getConfig("config_data") ~= #getProxy(ActivityTaskProxy):getFinishTaskById(arg_105_0:getConfig("id"))
	end

	return true
end

function var_0_0.isAfterShow(arg_107_0)
	if arg_107_0.configId == ActivityConst.ISLAND_SIGN_ID then
		local var_107_0 = _.flatten(arg_107_0:getConfig("config_data"))
		local var_107_1 = getProxy(ActivityTaskProxy):GetActivityTasks(arg_107_0.id)

		return _.all(var_107_0, function(arg_108_0)
			local var_108_0 = var_107_1[arg_108_0]

			return var_108_0 and var_108_0:isOver()
		end)
	end

	if arg_107_0.configId == ActivityConst.UR_TASK_ACT_ID or arg_107_0.configId == ActivityConst.SPECIAL_WEAPON_ACT_ID then
		local var_107_2 = getProxy(TaskProxy)

		return underscore.all(arg_107_0:getConfig("config_data")[1], function(arg_109_0)
			local var_109_0 = var_107_2:getTaskVO(arg_109_0)

			return var_109_0 and var_109_0:isReceive()
		end)
	end

	return false
end

function var_0_0.getPageABNames(arg_110_0)
	local var_110_0 = arg_110_0:getConfig("page_info")

	return {
		var_110_0.ui_name,
		var_110_0.ui_name2
	}
end

function var_0_0.checkPageABExist(arg_111_0)
	if not IsUnityEditor then
		return true
	end

	return underscore.all(arg_111_0:getPageABNames(), function(arg_112_0)
		return checkABExist(string.format("ui/%s", arg_112_0))
	end)
end

function var_0_0.getShowPriority(arg_113_0)
	return arg_113_0:getConfig("is_show")
end

function var_0_0.isCorePage(arg_114_0, arg_114_1)
	return arg_114_0:getConfig("page_core") == arg_114_1
end

function var_0_0.left4Day(arg_115_0)
	if arg_115_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function var_0_0.getAwardInfos(arg_116_0)
	return arg_116_0.data1KeyValueList or {}
end

function var_0_0.updateData(arg_117_0, arg_117_1, arg_117_2)
	if arg_117_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not arg_117_0:getAwardInfos()[arg_117_1] then
			arg_117_0.data1KeyValueList[arg_117_1] = {}
		end

		for iter_117_0, iter_117_1 in ipairs(arg_117_2) do
			if arg_117_0.data1KeyValueList[arg_117_1][iter_117_1] then
				arg_117_0.data1KeyValueList[arg_117_1][iter_117_1] = arg_117_0.data1KeyValueList[arg_117_1][iter_117_1] + 1
			else
				arg_117_0.data1KeyValueList[arg_117_1][iter_117_1] = 1
			end
		end
	end
end

function var_0_0.getTaskShip(arg_118_0)
	return arg_118_0:getConfig("config_client")[1]
end

function var_0_0.getNotificationMsg(arg_119_0)
	local var_119_0 = arg_119_0:getConfig("type")
	local var_119_1 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if var_119_0 == ActivityConst.ACTIVITY_TYPE_SHOP or var_119_0 == ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE or var_119_0 == ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE then
		var_119_1 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif var_119_0 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		var_119_1 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif var_119_0 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		var_119_1 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif var_119_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS or var_119_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER then
		var_119_1 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return var_119_1
end

function var_0_0.getDayIndex(arg_120_0)
	local var_120_0 = arg_120_0:getStartTime()
	local var_120_1 = pg.TimeMgr.GetInstance()
	local var_120_2 = var_120_1:GetServerTime()

	return var_120_1:DiffDay(var_120_0, var_120_2) + 1
end

function var_0_0.getStartTime(arg_121_0)
	local var_121_0 = arg_121_0:getStartTimeTable()

	return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_121_0)
end

function var_0_0.getStartTimeTable(arg_122_0)
	local var_122_0
	local var_122_1

	if arg_122_0:getConfig("time") == "stop" then
		local var_122_2 = getProxy(ActivityRemasterProxy):GetActivaingReamsterData()

		if var_122_2 then
			var_122_0 = var_122_2:GetStartTimeTable(arg_122_0.id)
		end
	else
		local var_122_3, var_122_4 = parseTimeConfig(arg_122_0:getConfig("time"))

		if var_122_4 and var_122_4[1] == "newuser" then
			var_122_1 = arg_122_0.stopTime - var_122_4[3] * 86400
		else
			var_122_0 = var_122_3[2]
		end
	end

	if var_122_0 and var_122_0 ~= "" then
		return var_122_0
	end

	local var_122_5 = pg.TimeMgr.GetInstance()
	local var_122_6 = var_122_5:STimeDescS(var_122_1 or var_122_5:GetServerTime(), "*t")

	return {
		{
			var_122_6.year,
			var_122_6.month,
			var_122_6.day
		},
		{
			var_122_6.hour,
			var_122_6.min,
			var_122_6.sec
		}
	}
end

function var_0_0.getNDay(arg_123_0, arg_123_1)
	arg_123_1 = arg_123_1 or arg_123_0:getStartTime()

	local var_123_0 = pg.TimeMgr.GetInstance()

	return var_123_0:DiffDay(arg_123_1, var_123_0:GetServerTime()) + 1
end

function var_0_0.isVariableTime(arg_124_0)
	local var_124_0, var_124_1 = parseTimeConfig(arg_124_0:getConfig("time"))

	return var_124_1 and var_124_1[1] == "newuser"
end

function var_0_0.setSpecialData(arg_125_0, arg_125_1, arg_125_2)
	arg_125_0.speciaData = arg_125_0.speciaData and arg_125_0.speciaData or {}
	arg_125_0.speciaData[arg_125_1] = arg_125_2
end

function var_0_0.getSpecialData(arg_126_0, arg_126_1)
	return arg_126_0.speciaData and arg_126_0.speciaData[arg_126_1] and arg_126_0.speciaData[arg_126_1] or nil
end

function var_0_0.canPermanentFinish(arg_127_0)
	local var_127_0 = arg_127_0:getConfig("type")

	if var_127_0 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		local var_127_1 = arg_127_0:getConfig("config_data")
		local var_127_2 = getProxy(TaskProxy)

		return underscore.all(underscore.flatten({
			var_127_1[#var_127_1]
		}), function(arg_128_0)
			return var_127_2:getFinishTaskById(arg_128_0) ~= nil
		end)
	elseif var_127_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF or var_127_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2 then
		local var_127_3 = ActivityPtData.New(arg_127_0)

		return var_127_3.level >= #var_127_3.targets
	end

	return false
end

function var_0_0.GetShopTime(arg_129_0)
	local var_129_0 = pg.TimeMgr.GetInstance()
	local var_129_1 = arg_129_0:getStartTime()
	local var_129_2 = arg_129_0.stopTime
	local var_129_3 = var_129_0:STimeDescS(var_129_2, "*t")

	if var_129_3.hour == 0 and var_129_3.min == 0 and var_129_3.sec == 0 then
		return var_129_0:STimeDescS(var_129_1, "%y.%m.%d") .. " - " .. string.format("%s.%s.%s", var_129_3.year, var_129_3.month, var_129_3.day - 1)
	else
		return var_129_0:STimeDescS(var_129_1, "%y.%m.%d") .. " - " .. var_129_0:STimeDescS(var_129_2, "%y.%m.%d")
	end
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

function var_0_0.GetConfigClientPTDrop(arg_139_0)
	if arg_139_0:isEnd() then
		return nil
	end

	if arg_139_0:GetConfigClientSetting("PT_ACT") then
		local var_139_0 = getProxy(ActivityProxy):getActivityById(arg_139_0:GetConfigClientSetting("PT_ACT"))

		return var_139_0 and var_139_0:GetPTDrop() or nil
	elseif arg_139_0:GetConfigClientSetting("PTID") then
		return Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = arg_139_0:GetConfigClientSetting("PTID")
		})
	elseif arg_139_0:GetConfigClientSetting("ptId") then
		return Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = arg_139_0:GetConfigClientSetting("ptId")
		})
	end

	return nil
end

function var_0_0.GetConfigClientPTActivity(arg_140_0)
	if arg_140_0:isEnd() then
		return nil
	end

	if arg_140_0:GetConfigClientSetting("PT_ACT") then
		return getProxy(ActivityProxy):getActivityById(arg_140_0:GetConfigClientSetting("PT_ACT"))
	else
		local var_140_0 = arg_140_0:GetConfigClientPTDrop()

		return var_140_0 and getProxy(ActivityProxy):GetPTActivityByRes(var_140_0) or nil
	end
end

local function var_0_2(arg_141_0)
	local var_141_0 = pg.TimeMgr.GetInstance():STimeDescC(arg_141_0.stopTime, "%Y/%m/%d/%H/%M/%S")
	local var_141_1 = string.split(var_141_0, "/")
	local var_141_2 = arg_141_0:getStartTimeTable()
	local var_141_3 = (arg_141_0:getConfig("config_client").natural_expire or 0) == var_0_0.MAINTAIN

	return GetActTimeDesc(false, var_141_3, var_141_2[1][2], var_141_2[1][3], var_141_1[2], var_141_1[3], var_141_1[4], var_141_1[5], var_141_1[6])
end

function var_0_0.GetActivityTimeStr(arg_142_0, arg_142_1)
	local var_142_0 = arg_142_0

	if var_142_0:getConfig("time") == "stop" then
		local var_142_1 = getProxy(ActivityRemasterProxy):GetActivaingReamsterData()

		if not var_142_1 then
			return ""
		end

		return var_142_1:GetActivityTimeDesc(var_142_0.id)
	elseif arg_142_1 then
		return ""
	else
		return var_0_2(var_142_0)
	end
end

return var_0_0
