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
			local var_17_0 = getProxy(ActivityProxy):getActivityById(tonumber(arg_15_0:getConfig("target_id_2")))

			return var_17_0 and var_17_0.data1 or 0
		end,
		[TASK_SUB_TYPE_PLAYER_RES] = function()
			local var_18_0 = tonumber(arg_15_0:getConfig("target_id"))

			return getProxy(PlayerProxy):getData():getResById(var_18_0)
		end,
		[TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM] = function()
			local var_19_0 = tonumber(arg_15_0:getConfig("target_id"))

			return getProxy(ActivityProxy):getVirtualItemNumber(var_19_0)
		end,
		[TASK_SUB_TYPE_BOSS_PT] = function()
			local var_20_0 = tonumber(arg_15_0:getConfig("target_id"))

			return getProxy(PlayerProxy):getData():getResById(var_20_0)
		end,
		[TASK_SUB_STROY] = function()
			local var_21_0 = arg_15_0:getConfig("target_id")
			local var_21_1 = 0

			_.each(var_21_0, function(arg_22_0)
				if pg.NewStoryMgr.GetInstance():GetPlayedFlag(arg_22_0) then
					var_21_1 = var_21_1 + 1
				end
			end)

			return var_21_1
		end,
		[TASK_SUB_TYPE_TECHNOLOGY_POINT] = function()
			return math.min(getProxy(TechnologyNationProxy):getNationPoint(tonumber(arg_15_0:getConfig("target_id"))), arg_15_0:getConfig("target_num"))
		end,
		[TASK_SUB_TYPE_VITEM] = function()
			local var_24_0 = tonumber(arg_15_0:getConfig("target_id"))
			local var_24_1 = tonumber(arg_15_0:getConfig("target_id_2"))
			local var_24_2 = pg.activity_drop_type[var_24_0].activity_id
			local var_24_3 = getProxy(ActivityProxy):getActivityById(var_24_2)

			if var_24_3 then
				return var_24_3:getVitemNumber(var_24_1)
			end
		end,
		[TASK_SUB_TYPE_VITEMS] = function()
			local var_25_0 = tonumber(arg_15_0:getConfig("target_id"))

			if underscore.all(arg_15_0:getConfig("target_id_2"), function(arg_26_0)
				local var_26_0 = Drop.New({
					type = var_25_0,
					id = arg_26_0[1],
					count = arg_26_0[2]
				})

				return var_26_0:getOwnedCount() >= var_26_0.count
			end) then
				return 1
			end
		end,
		[TASK_SUB_TYPE_JOIN_GUILD] = function()
			return getProxy(GuildProxy):getData() and 1 or 0
		end,
		[TASK_SUB_TYPE_COLLAB_BOSS_RUSH_DEFEAT] = function()
			local var_28_0 = tonumber(arg_15_0:getConfig("target_id"))
			local var_28_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB)

			if not var_28_1 then
				return 0
			end

			local var_28_2 = var_28_1:GetCollabSeriesDataList()

			for iter_28_0, iter_28_1 in pairs(var_28_2) do
				if iter_28_1:GetCollabBossID() == var_28_0 then
					return iter_28_1:GetBossTimeStamp() ~= 0 and 1 or 0
				end
			end

			return 0
		end,
		[TASK_SUB_TYPE_REPEATABLE] = function()
			return arg_15_0.progress >= 1 and 1 or 0
		end
	}, function()
		return arg_15_0.progress
	end) or 0
end

function var_0_0.getTargetNumber(arg_31_0)
	return arg_31_0:getConfig("target_num")
end

function var_0_0.isReceive(arg_32_0)
	return arg_32_0.submitTime > 0
end

function var_0_0.isCircle(arg_33_0)
	if arg_33_0:isActivityTask() then
		if arg_33_0:getConfig("type") == 16 and arg_33_0:getConfig("sub_type") == 1006 then
			return true
		elseif arg_33_0:getConfig("type") == 16 and arg_33_0:getConfig("sub_type") == 20 then
			return true
		elseif arg_33_0:getConfig("type") == 16 and arg_33_0:getConfig("sub_type") == 1007 then
			return true
		elseif arg_33_0:getConfig("type") == 16 and arg_33_0:getConfig("sub_type") == 122 then
			return true
		end
	end

	return false
end

function var_0_0.isDaily(arg_34_0)
	return arg_34_0:getConfig("sub_type") == 415 or arg_34_0:getConfig("sub_type") == 412
end

function var_0_0.getTaskStatus(arg_35_0)
	if arg_35_0:isLock() then
		return -1
	end

	if arg_35_0:isReceive() then
		return 2
	end

	if arg_35_0:isFinish() then
		return 1
	end

	return 0
end

function var_0_0.onAdded(arg_36_0)
	local function var_36_0()
		if arg_36_0:getConfig("sub_type") == 29 then
			local var_37_0 = getProxy(SkirmishProxy):getRawData()

			if _.any(var_37_0, function(arg_38_0)
				return arg_38_0:getConfig("task_id") == arg_36_0.id
			end) then
				return
			end

			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = arg_36_0
			})
		elseif arg_36_0:getConfig("added_tip") > 0 then
			local var_37_1

			if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= TaskMediator.__cname then
				function var_37_1()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = var_0_1[arg_36_0:GetRealType()]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				yesText = "text_forward",
				noText = "text_iknow",
				content = i18n("tip_add_task", arg_36_0:getConfig("name")),
				onYes = var_37_1
			})
		end

		if arg_36_0:IsCommanderManualType() then
			getProxy(CommanderManualProxy):AddPageTaskDone(arg_36_0)
		end
	end

	local function var_36_1()
		local var_40_0 = getProxy(ContextProxy):getCurrentContext()

		if not table.contains({
			"LevelScene",
			"BattleScene",
			"EventListScene",
			"MilitaryExerciseScene",
			"DailyLevelScene"
		}, var_40_0.viewComponent.__cname) then
			return true
		end

		return false
	end

	local var_36_2 = arg_36_0:getConfig("story_id")

	if var_36_2 and var_36_2 ~= "" and var_36_1() then
		pg.NewStoryMgr.GetInstance():Play(var_36_2, var_36_0, true, true)
	else
		var_36_0()
	end
end

function var_0_0.updateProgress(arg_41_0, arg_41_1)
	arg_41_0.progress = arg_41_1
end

function var_0_0.isSelectable(arg_42_0)
	local var_42_0 = arg_42_0:getConfig("award_choice")

	return var_42_0 ~= nil and type(var_42_0) == "table" and #var_42_0 > 0
end

function var_0_0.judgeOverflow(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = arg_43_0:getTaskStatus() == 1
	local var_43_1 = arg_43_0:ShowOnTaskScene()

	return var_0_0.StaticJudgeOverflow(arg_43_1, arg_43_2, arg_43_3, var_43_0, var_43_1, arg_43_0:getConfig("award_display"))
end

function var_0_0.StaticJudgeOverflow(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5)
	if arg_44_3 and arg_44_4 then
		local var_44_0 = getProxy(PlayerProxy):getData()
		local var_44_1 = pg.gameset.urpt_chapter_max.description[1]
		local var_44_2 = arg_44_0 or var_44_0.gold
		local var_44_3 = arg_44_1 or var_44_0.oil
		local var_44_4 = arg_44_2 or not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_44_1) or 0
		local var_44_5 = pg.gameset.max_gold.key_value
		local var_44_6 = pg.gameset.max_oil.key_value
		local var_44_7 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0
		local var_44_8 = false
		local var_44_9 = false
		local var_44_10 = false
		local var_44_11 = false
		local var_44_12 = false
		local var_44_13 = {}
		local var_44_14 = arg_44_5

		for iter_44_0, iter_44_1 in ipairs(var_44_14) do
			local var_44_15, var_44_16, var_44_17 = unpack(iter_44_1)

			if var_44_15 == DROP_TYPE_RESOURCE then
				if var_44_16 == PlayerConst.ResGold then
					local var_44_18 = var_44_2 + var_44_17 - var_44_5

					if var_44_18 > 0 then
						var_44_8 = true

						local var_44_19 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResGold,
							count = setColorStr(var_44_18, COLOR_RED)
						}

						table.insert(var_44_13, var_44_19)
					end
				elseif var_44_16 == PlayerConst.ResOil then
					local var_44_20 = var_44_3 + var_44_17 - var_44_6

					if var_44_20 > 0 then
						var_44_9 = true

						local var_44_21 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResOil,
							count = setColorStr(var_44_20, COLOR_RED)
						}

						table.insert(var_44_13, var_44_21)
					end
				end
			elseif not LOCK_UR_SHIP and var_44_15 == DROP_TYPE_VITEM then
				if Item.getConfigData(var_44_16).virtual_type == 20 then
					local var_44_22 = var_44_4 + var_44_17 - var_44_7

					if var_44_22 > 0 then
						var_44_10 = true

						local var_44_23 = {
							type = DROP_TYPE_VITEM,
							id = var_44_1,
							count = setColorStr(var_44_22, COLOR_RED)
						}

						table.insert(var_44_13, var_44_23)
					end
				end
			elseif var_44_15 == DROP_TYPE_ITEM and Item.getConfigData(var_44_16).type == Item.EXP_BOOK_TYPE then
				local var_44_24 = getProxy(BagProxy):getItemCountById(var_44_16) + var_44_17
				local var_44_25 = Item.getConfigData(var_44_16).max_num

				if var_44_25 < var_44_24 then
					var_44_11 = true

					local var_44_26 = {
						type = DROP_TYPE_ITEM,
						id = var_44_16,
						count = setColorStr(math.min(var_44_17, var_44_24 - var_44_25), COLOR_RED)
					}

					table.insert(var_44_13, var_44_26)
				end
			end
		end

		return var_44_8 or var_44_9 or var_44_10 or var_44_11, var_44_13
	end
end

function var_0_0.IsUrTask(arg_45_0)
	if not LOCK_UR_SHIP then
		local var_45_0 = pg.gameset.urpt_chapter_max.description[1]

		do return _.any(arg_45_0:getConfig("award_display"), function(arg_46_0)
			return arg_46_0[1] == DROP_TYPE_ITEM and arg_46_0[2] == var_45_0
		end) end
		return
	end

	return false
end

function var_0_0.GetRealType(arg_47_0)
	local var_47_0 = arg_47_0:getConfig("priority_type")

	if var_47_0 == 0 then
		var_47_0 = arg_47_0:getConfig("type")
	end

	return var_47_0
end

function var_0_0.IsOverflowShipExpItem(arg_48_0)
	local function var_48_0(arg_49_0, arg_49_1)
		return getProxy(BagProxy):getItemCountById(arg_49_0) + arg_49_1 > Item.getConfigData(arg_49_0).max_num
	end

	local var_48_1 = arg_48_0:getConfig("award_display")

	for iter_48_0, iter_48_1 in ipairs(var_48_1) do
		local var_48_2 = iter_48_1[1]
		local var_48_3 = iter_48_1[2]
		local var_48_4 = iter_48_1[3]

		if var_48_2 == DROP_TYPE_ITEM and Item.getConfigData(var_48_3).type == Item.EXP_BOOK_TYPE and var_48_0(var_48_3, var_48_4) then
			return true
		end
	end

	return false
end

function var_0_0.ShowOnTaskScene(arg_50_0)
	local var_50_0 = arg_50_0:getConfig("visibility") == 1

	if arg_50_0.id == 17268 then
		var_50_0 = false

		local var_50_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.BUILDING_NEWYEAR_2022)

		if var_50_1 and not var_50_1:isEnd() then
			local var_50_2 = var_50_1.data1KeyValueList[2][17] or 1
			local var_50_3 = var_50_1.data1KeyValueList[2][18] or 1

			var_50_0 = var_50_2 >= 4 and var_50_3 >= 4
		end
	end

	return var_50_0
end

function var_0_0.setTaskFinish(arg_51_0)
	arg_51_0.submitTime = 1

	arg_51_0:updateProgress(arg_51_0:getConfig("target_num"))
end

function var_0_0.isAvatarTask(arg_52_0)
	return false
end

function var_0_0.getActId(arg_53_0)
	return arg_53_0._actId
end

function var_0_0.setActId(arg_54_0, arg_54_1)
	arg_54_0._actId = arg_54_1
end

function var_0_0.isActivityTask(arg_55_0)
	return arg_55_0._actId and arg_55_0._actId > 0
end

function var_0_0.setAutoSubmit(arg_56_0, arg_56_1)
	arg_56_0._autoSubmit = arg_56_1
end

function var_0_0.getAutoSubmit(arg_57_0)
	return arg_57_0._autoSubmit
end

function var_0_0.getGiveDrops(arg_58_0)
	local var_58_0 = {}

	if arg_58_0:getConfig("sub_type") == TASK_SUB_TYPE_VITEMS then
		local var_58_1 = tonumber(arg_58_0:getConfig("target_id"))

		for iter_58_0, iter_58_1 in ipairs(arg_58_0:getConfig("target_id_2")) do
			table.insert(var_58_0, Drop.New({
				type = var_58_1,
				id = iter_58_1[1],
				count = iter_58_1[2]
			}))
		end
	end

	return var_58_0
end

function var_0_0.OwnSpAward(arg_59_0)
	local function var_59_0(arg_60_0)
		return getProxy(DormProxy):getData():GetOwnFurnitureCount(arg_60_0) > 0
	end

	local function var_59_1(arg_61_0)
		local var_61_0 = getProxy(CollectionProxy):GetTrophyById(arg_61_0)

		return var_61_0 and (var_61_0:canClaimed() or var_61_0:isClaimed())
	end

	local function var_59_2(arg_62_0)
		local var_62_0 = getProxy(PlayerProxy):getRawData():getActivityMedalGroup()

		for iter_62_0, iter_62_1 in pairs(var_62_0) do
			if iter_62_1:OwnMedel(arg_62_0) then
				return true
			end
		end

		return false
	end

	local var_59_3 = {
		type = arg_59_0[1],
		id = arg_59_0[2],
		count = arg_59_0[3]
	}

	if var_59_3.type == DROP_TYPE_FURNITURE then
		return var_59_0(var_59_3.id)
	elseif var_59_3.type == DROP_TYPE_VITEM then
		local var_59_4 = pg.item_virtual_data_statistics[var_59_3.id].album_config

		if type(var_59_4) == "table" then
			local var_59_5 = var_59_4[1]
			local var_59_6 = var_59_4[2]

			if var_59_5 == 1 then
				return var_59_1(var_59_6)
			elseif var_59_5 == 2 then
				return var_59_2(var_59_6)
			end
		end
	end

	return false
end

return var_0_0
