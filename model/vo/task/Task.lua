local var_0_0 = class("Task", import("..BaseVO"))

var_0_0.TYPE_SCENARIO = 1
var_0_0.TYPE_BRANCH = 2
var_0_0.TYPE_ROUTINE = 3
var_0_0.TYPE_WEEKLY = 4
var_0_0.TYPE_HIDDEN = 5
var_0_0.TYPE_ACTIVITY = 6
var_0_0.TYPE_ACTIVITY_ROUTINE = 36
var_0_0.TYPE_ACTIVITY_BRANCH = 26
var_0_0.TYPE_GUILD_WEEKLY = 12
var_0_0.TYPE_NEW_WEEKLY = 13
var_0_0.TYPE_REFLUX = 15
var_0_0.TYPE_ACTIVITY_REPEAT = 16
var_0_0.TYPE_ACTIVITY_WEEKLY = 46
var_0_0.TYPE_COMMANDER_MANUAL = 17
var_0_0.TYPE_REPEATABLE = 20

local var_0_1 = {
	"scenario",
	"branch",
	"routine",
	"weekly"
}

var_0_0.TASK_PROGRESS_UPDATE = 0
var_0_0.TASK_PROGRESS_APPEND = 1
var_0_0.MEDAL_TYPE_TROPHY = 1
var_0_0.MEDAL_TYPE_ACT = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_1.id
	arg_1_0.progress = arg_1_1.progress or 0
	arg_1_0.acceptTime = arg_1_1.accept_time
	arg_1_0.submitTime = arg_1_1.submit_time or 0
	arg_1_0._actId = nil
	arg_1_0._autoSubmit = false
end

function var_0_0.isClientTrigger(arg_2_0)
	return arg_2_0:getConfig("sub_type") > 2000 and arg_2_0:getConfig("sub_type") < 3000
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.task_data_template
end

function var_0_0.isGuildTask(arg_4_0)
	return arg_4_0:getConfig("type") == var_0_0.TYPE_GUILD_WEEKLY
end

function var_0_0.IsRoutineType(arg_5_0)
	return arg_5_0:getConfig("type") == var_0_0.TYPE_ROUTINE
end

function var_0_0.IsActRoutineType(arg_6_0)
	return arg_6_0:getConfig("type") == var_0_0.TYPE_ACTIVITY_ROUTINE
end

function var_0_0.IsActType(arg_7_0)
	return arg_7_0:getConfig("type") == var_0_0.TYPE_ACTIVITY
end

function var_0_0.IsWeeklyType(arg_8_0)
	return arg_8_0:getConfig("type") == var_0_0.TYPE_WEEKLY or arg_8_0:getConfig("type") == var_0_0.TYPE_NEW_WEEKLY
end

function var_0_0.IsBackYardInterActionType(arg_9_0)
	return arg_9_0:getConfig("sub_type") == 2010
end

function var_0_0.IsFlagShipInterActionType(arg_10_0)
	return arg_10_0:getConfig("sub_type") == 2011
end

function var_0_0.IsGuildAddLivnessType(arg_11_0)
	local var_11_0 = arg_11_0:getConfig("type")

	return var_11_0 == var_0_0.TYPE_ROUTINE or var_11_0 == var_0_0.TYPE_WEEKLY or var_11_0 == var_0_0.TYPE_GUILD_WEEKLY or var_11_0 == var_0_0.TYPE_NEW_WEEKLY
end

function var_0_0.IsCommanderManualType(arg_12_0)
	return arg_12_0:getConfig("type") == var_0_0.TYPE_COMMANDER_MANUAL
end

function var_0_0.isLock(arg_13_0)
	return getProxy(PlayerProxy):getRawData().level < arg_13_0:getConfig("level")
end

function var_0_0.isFinish(arg_14_0)
	local var_14_0 = arg_14_0:getProgress()

	if arg_14_0:getConfig("sub_type") == TASK_SUB_TYPE_REPEATABLE then
		return var_14_0 >= 1
	end

	return var_14_0 >= arg_14_0:getConfig("target_num")
end

function var_0_0.getProgress(arg_15_0)
	return switch(arg_15_0:getConfig("sub_type"), {
		[TASK_SUB_TYPE_GIVE_ITEM] = function()
			local var_16_0 = tonumber(arg_15_0:getConfig("target_id"))

			return getProxy(BagProxy):getItemCountById(tonumber(var_16_0))
		end,
		[TASK_SUB_TYPE_PT] = function()
			local var_17_0 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = tonumber(arg_15_0:getConfig("target_id"))
			})
			local var_17_1 = getProxy(ActivityProxy):GetPTActivityByRes(var_17_0)

			return var_17_1 and var_17_1:GetTotalPtCount() or 0
		end,
		[TASK_SUB_TYPE_PT_PLUS] = function()
			local var_18_0 = getProxy(ActivityProxy):getActivityById(tonumber(arg_15_0:getConfig("target_id")))

			return var_18_0 and var_18_0:GetTotalPtCount() or 0
		end,
		[TASK_SUB_TYPE_PLAYER_RES] = function()
			local var_19_0 = tonumber(arg_15_0:getConfig("target_id"))

			return getProxy(PlayerProxy):getData():getResById(var_19_0)
		end,
		[TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM] = function()
			local var_20_0 = tonumber(arg_15_0:getConfig("target_id"))

			return getProxy(ActivityProxy):getVirtualItemNumber(var_20_0)
		end,
		[TASK_SUB_TYPE_BOSS_PT] = function()
			local var_21_0 = tonumber(arg_15_0:getConfig("target_id"))

			return getProxy(PlayerProxy):getData():getResById(var_21_0)
		end,
		[TASK_SUB_STROY] = function()
			local var_22_0 = arg_15_0:getConfig("target_id")
			local var_22_1 = 0

			_.each(var_22_0, function(arg_23_0)
				if pg.NewStoryMgr.GetInstance():GetPlayedFlag(arg_23_0) then
					var_22_1 = var_22_1 + 1
				end
			end)

			return var_22_1
		end,
		[TASK_SUB_TYPE_TECHNOLOGY_POINT] = function()
			return math.min(getProxy(TechnologyNationProxy):getNationPoint(tonumber(arg_15_0:getConfig("target_id"))), arg_15_0:getConfig("target_num"))
		end,
		[TASK_SUB_TYPE_VITEM] = function()
			local var_25_0 = tonumber(arg_15_0:getConfig("target_id"))
			local var_25_1 = tonumber(arg_15_0:getConfig("target_id_2"))
			local var_25_2 = pg.activity_drop_type[var_25_0].activity_id
			local var_25_3 = getProxy(ActivityProxy):getActivityById(var_25_2)

			if var_25_3 then
				return var_25_3:getVitemNumber(var_25_1)
			end
		end,
		[TASK_SUB_TYPE_VITEMS] = function()
			local var_26_0 = tonumber(arg_15_0:getConfig("target_id"))

			if underscore.all(arg_15_0:getConfig("target_id_2"), function(arg_27_0)
				local var_27_0 = Drop.New({
					type = var_26_0,
					id = arg_27_0[1],
					count = arg_27_0[2]
				})

				return var_27_0:getOwnedCount() >= var_27_0.count
			end) then
				return 1
			end
		end,
		[TASK_SUB_TYPE_JOIN_GUILD] = function()
			return getProxy(GuildProxy):getData() and 1 or 0
		end,
		[TASK_SUB_TYPE_COLLAB_BOSS_RUSH_DEFEAT] = function()
			local var_29_0 = tonumber(arg_15_0:getConfig("target_id"))
			local var_29_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB)

			if not var_29_1 then
				return 0
			end

			local var_29_2 = var_29_1:GetCollabSeriesDataList()

			for iter_29_0, iter_29_1 in pairs(var_29_2) do
				if iter_29_1:GetCollabBossID() == var_29_0 then
					return iter_29_1:GetBossTimeStamp() ~= 0 and 1 or 0
				end
			end

			return 0
		end,
		[TASK_SUB_TYPE_REPEATABLE] = function()
			return arg_15_0.progress >= 1 and 1 or 0
		end,
		[TASK_SUB_TYPE_COMPLETE_ALL_DAILY_TASKS] = function()
			return underscore.any(getProxy(TaskProxy):getTasks(), function(arg_32_0)
				return arg_32_0:IsRoutineType() and arg_32_0:getConfig("sub_type") ~= TASK_SUB_TYPE_COMPLETE_ALL_DAILY_TASKS
			end) and 0 or 1
		end
	}, function()
		return arg_15_0.progress
	end) or 0
end

function var_0_0.getTargetNumber(arg_34_0)
	return arg_34_0:getConfig("target_num")
end

function var_0_0.isReceive(arg_35_0)
	return arg_35_0.submitTime > 0
end

function var_0_0.isCircle(arg_36_0)
	if arg_36_0:isActivityTask() then
		if arg_36_0:getConfig("type") == 16 and arg_36_0:getConfig("sub_type") == 1006 then
			return true
		elseif arg_36_0:getConfig("type") == 16 and arg_36_0:getConfig("sub_type") == 20 then
			return true
		elseif arg_36_0:getConfig("type") == 16 and arg_36_0:getConfig("sub_type") == 1007 then
			return true
		elseif arg_36_0:getConfig("type") == 16 and arg_36_0:getConfig("sub_type") == 122 then
			return true
		end
	end

	return false
end

function var_0_0.isDaily(arg_37_0)
	return arg_37_0:getConfig("sub_type") == 415 or arg_37_0:getConfig("sub_type") == 412
end

function var_0_0.getTaskStatus(arg_38_0)
	if arg_38_0:isLock() then
		return -1
	end

	if arg_38_0:isReceive() then
		return 2
	end

	if arg_38_0:isFinish() then
		return 1
	end

	return 0
end

function var_0_0.onAdded(arg_39_0)
	local function var_39_0()
		if arg_39_0:getConfig("sub_type") == 29 then
			local var_40_0 = getProxy(SkirmishProxy):getRawData()

			if _.any(var_40_0, function(arg_41_0)
				return arg_41_0:getConfig("task_id") == arg_39_0.id
			end) then
				return
			end

			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = arg_39_0
			})
		elseif arg_39_0:getConfig("added_tip") > 0 then
			local var_40_1

			if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= TaskMediator.__cname then
				function var_40_1()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = var_0_1[arg_39_0:GetRealType()]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				yesText = "text_forward",
				noText = "text_iknow",
				content = i18n("tip_add_task", arg_39_0:getConfig("name")),
				onYes = var_40_1
			})
		end

		if arg_39_0:IsCommanderManualType() then
			getProxy(CommanderManualProxy):AddPageTaskDone(arg_39_0)
		end
	end

	local function var_39_1()
		local var_43_0 = getProxy(ContextProxy):getCurrentContext()

		if not table.contains({
			"LevelScene",
			"BattleScene",
			"EventListScene",
			"MilitaryExerciseScene",
			"DailyLevelScene"
		}, var_43_0.viewComponent.__cname) then
			return true
		end

		return false
	end

	local var_39_2 = arg_39_0:getConfig("story_id")

	if var_39_2 and var_39_2 ~= "" and var_39_1() then
		pg.NewStoryMgr.GetInstance():Play(var_39_2, var_39_0, true, true)
	else
		var_39_0()
	end
end

function var_0_0.updateProgress(arg_44_0, arg_44_1)
	arg_44_0.progress = arg_44_1
end

function var_0_0.isSelectable(arg_45_0)
	local var_45_0 = arg_45_0:getConfig("award_choice")

	return var_45_0 ~= nil and type(var_45_0) == "table" and #var_45_0 > 0
end

function var_0_0.judgeOverflow(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = arg_46_0:getTaskStatus() == 1
	local var_46_1 = arg_46_0:ShowOnTaskScene()

	return var_0_0.StaticJudgeOverflow(arg_46_1, arg_46_2, arg_46_3, var_46_0, var_46_1, arg_46_0:getConfig("award_display"))
end

function var_0_0.StaticJudgeOverflow(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5)
	if arg_47_3 and arg_47_4 then
		local var_47_0 = getProxy(PlayerProxy):getData()
		local var_47_1 = pg.gameset.urpt_chapter_max.description[1]
		local var_47_2 = arg_47_0 or var_47_0.gold
		local var_47_3 = arg_47_1 or var_47_0.oil
		local var_47_4 = arg_47_2 or not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_47_1) or 0
		local var_47_5 = pg.gameset.max_gold.key_value
		local var_47_6 = pg.gameset.max_oil.key_value
		local var_47_7 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0
		local var_47_8 = false
		local var_47_9 = false
		local var_47_10 = false
		local var_47_11 = false
		local var_47_12 = false
		local var_47_13 = {}
		local var_47_14 = arg_47_5

		for iter_47_0, iter_47_1 in ipairs(var_47_14) do
			local var_47_15, var_47_16, var_47_17 = unpack(iter_47_1)

			if var_47_15 == DROP_TYPE_RESOURCE then
				if var_47_16 == PlayerConst.ResGold then
					local var_47_18 = var_47_2 + var_47_17 - var_47_5

					if var_47_18 > 0 then
						var_47_8 = true

						local var_47_19 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResGold,
							count = setColorStr(var_47_18, COLOR_RED)
						}

						table.insert(var_47_13, var_47_19)
					end
				elseif var_47_16 == PlayerConst.ResOil then
					local var_47_20 = var_47_3 + var_47_17 - var_47_6

					if var_47_20 > 0 then
						var_47_9 = true

						local var_47_21 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResOil,
							count = setColorStr(var_47_20, COLOR_RED)
						}

						table.insert(var_47_13, var_47_21)
					end
				end
			elseif not LOCK_UR_SHIP and var_47_15 == DROP_TYPE_VITEM then
				if Item.getConfigData(var_47_16).virtual_type == 20 then
					local var_47_22 = var_47_4 + var_47_17 - var_47_7

					if var_47_22 > 0 then
						var_47_10 = true

						local var_47_23 = {
							type = DROP_TYPE_VITEM,
							id = var_47_1,
							count = setColorStr(var_47_22, COLOR_RED)
						}

						table.insert(var_47_13, var_47_23)
					end
				end
			elseif var_47_15 == DROP_TYPE_ITEM and Item.getConfigData(var_47_16).type == Item.EXP_BOOK_TYPE then
				local var_47_24 = getProxy(BagProxy):getItemCountById(var_47_16) + var_47_17
				local var_47_25 = Item.getConfigData(var_47_16).max_num

				if var_47_25 < var_47_24 then
					var_47_11 = true

					local var_47_26 = {
						type = DROP_TYPE_ITEM,
						id = var_47_16,
						count = setColorStr(math.min(var_47_17, var_47_24 - var_47_25), COLOR_RED)
					}

					table.insert(var_47_13, var_47_26)
				end
			end
		end

		return var_47_8 or var_47_9 or var_47_10 or var_47_11, var_47_13
	end
end

function var_0_0.IsUrTask(arg_48_0)
	if not LOCK_UR_SHIP then
		local var_48_0 = pg.gameset.urpt_chapter_max.description[1]

		do return _.any(arg_48_0:getConfig("award_display"), function(arg_49_0)
			return arg_49_0[1] == DROP_TYPE_ITEM and arg_49_0[2] == var_48_0
		end) end
		return
	end

	return false
end

function var_0_0.GetRealType(arg_50_0)
	local var_50_0 = arg_50_0:getConfig("priority_type")

	if var_50_0 == 0 then
		var_50_0 = arg_50_0:getConfig("type")
	end

	return var_50_0
end

function var_0_0.IsOverflowShipExpItem(arg_51_0)
	local function var_51_0(arg_52_0, arg_52_1)
		return getProxy(BagProxy):getItemCountById(arg_52_0) + arg_52_1 > Item.getConfigData(arg_52_0).max_num
	end

	local var_51_1 = arg_51_0:getConfig("award_display")

	for iter_51_0, iter_51_1 in ipairs(var_51_1) do
		local var_51_2 = iter_51_1[1]
		local var_51_3 = iter_51_1[2]
		local var_51_4 = iter_51_1[3]

		if var_51_2 == DROP_TYPE_ITEM and Item.getConfigData(var_51_3).type == Item.EXP_BOOK_TYPE and var_51_0(var_51_3, var_51_4) then
			return true
		end
	end

	return false
end

function var_0_0.ShowOnTaskScene(arg_53_0)
	local var_53_0 = arg_53_0:getConfig("visibility") == 1

	if arg_53_0.id == 17268 then
		var_53_0 = false

		local var_53_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.BUILDING_NEWYEAR_2022)

		if var_53_1 and not var_53_1:isEnd() then
			local var_53_2 = var_53_1.data1KeyValueList[2][17] or 1
			local var_53_3 = var_53_1.data1KeyValueList[2][18] or 1

			var_53_0 = var_53_2 >= 4 and var_53_3 >= 4
		end
	end

	return var_53_0
end

function var_0_0.setTaskFinish(arg_54_0)
	arg_54_0.submitTime = 1

	arg_54_0:updateProgress(arg_54_0:getConfig("target_num"))
end

function var_0_0.isAvatarTask(arg_55_0)
	return false
end

function var_0_0.getActId(arg_56_0)
	return arg_56_0._actId
end

function var_0_0.setActId(arg_57_0, arg_57_1)
	arg_57_0._actId = arg_57_1
end

function var_0_0.isActivityTask(arg_58_0)
	return arg_58_0._actId and arg_58_0._actId > 0
end

function var_0_0.setAutoSubmit(arg_59_0, arg_59_1)
	arg_59_0._autoSubmit = arg_59_1
end

function var_0_0.getAutoSubmit(arg_60_0)
	return arg_60_0._autoSubmit
end

function var_0_0.getGiveDrops(arg_61_0)
	local var_61_0 = {}

	if arg_61_0:getConfig("sub_type") == TASK_SUB_TYPE_VITEMS then
		local var_61_1 = tonumber(arg_61_0:getConfig("target_id"))

		for iter_61_0, iter_61_1 in ipairs(arg_61_0:getConfig("target_id_2")) do
			table.insert(var_61_0, Drop.New({
				type = var_61_1,
				id = iter_61_1[1],
				count = iter_61_1[2]
			}))
		end
	end

	return var_61_0
end

function var_0_0.OwnSpAward(arg_62_0)
	local function var_62_0(arg_63_0)
		return getProxy(DormProxy):getData():GetOwnFurnitureCount(arg_63_0) > 0
	end

	local function var_62_1(arg_64_0)
		local var_64_0 = getProxy(CollectionProxy):GetTrophyById(arg_64_0)

		return var_64_0 and (var_64_0:canClaimed() or var_64_0:isClaimed())
	end

	local function var_62_2(arg_65_0)
		local var_65_0 = getProxy(PlayerProxy):getRawData():getActivityMedalGroup()

		for iter_65_0, iter_65_1 in pairs(var_65_0) do
			if iter_65_1:OwnMedel(arg_65_0) then
				return true
			end
		end

		return false
	end

	local var_62_3 = {
		type = arg_62_0[1],
		id = arg_62_0[2],
		count = arg_62_0[3]
	}

	if var_62_3.type == DROP_TYPE_FURNITURE then
		return var_62_0(var_62_3.id)
	elseif var_62_3.type == DROP_TYPE_VITEM then
		local var_62_4 = pg.item_virtual_data_statistics[var_62_3.id].album_config

		if type(var_62_4) == "table" then
			local var_62_5 = var_62_4[1]
			local var_62_6 = var_62_4[2]

			if var_62_5 == var_0_0.MEDAL_TYPE_TROPHY then
				return var_62_1(var_62_6)
			elseif var_62_5 == var_0_0.MEDAL_TYPE_ACT then
				return var_62_2(var_62_6)
			end
		end
	end

	return false
end

function var_0_0.HasActMedalAward(arg_66_0)
	local function var_66_0(arg_67_0)
		if arg_67_0[1] == DROP_TYPE_VITEM then
			local var_67_0 = pg.item_virtual_data_statistics[arg_67_0[2]].album_config

			return type(var_67_0) == "table" and var_67_0[1] == var_0_0.MEDAL_TYPE_ACT
		end

		return false
	end

	local var_66_1 = arg_66_0:getConfig("award_display")

	return _.any(var_66_1, function(arg_68_0)
		return var_66_0(arg_68_0)
	end)
end

return var_0_0
