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
	return arg_14_0:getProgress() >= arg_14_0:getConfig("target_num")
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
		end
	}, function()
		return arg_15_0.progress
	end) or 0
end

function var_0_0.getTargetNumber(arg_30_0)
	return arg_30_0:getConfig("target_num")
end

function var_0_0.isReceive(arg_31_0)
	return arg_31_0.submitTime > 0
end

function var_0_0.isCircle(arg_32_0)
	if arg_32_0:isActivityTask() then
		if arg_32_0:getConfig("type") == 16 and arg_32_0:getConfig("sub_type") == 1006 then
			return true
		elseif arg_32_0:getConfig("type") == 16 and arg_32_0:getConfig("sub_type") == 20 then
			return true
		elseif arg_32_0:getConfig("type") == 16 and arg_32_0:getConfig("sub_type") == 1007 then
			return true
		elseif arg_32_0:getConfig("type") == 16 and arg_32_0:getConfig("sub_type") == 122 then
			return true
		end
	end

	return false
end

function var_0_0.isDaily(arg_33_0)
	return arg_33_0:getConfig("sub_type") == 415 or arg_33_0:getConfig("sub_type") == 412
end

function var_0_0.getTaskStatus(arg_34_0)
	if arg_34_0:isLock() then
		return -1
	end

	if arg_34_0:isReceive() then
		return 2
	end

	if arg_34_0:isFinish() then
		return 1
	end

	return 0
end

function var_0_0.onAdded(arg_35_0)
	local function var_35_0()
		if arg_35_0:getConfig("sub_type") == 29 then
			local var_36_0 = getProxy(SkirmishProxy):getRawData()

			if _.any(var_36_0, function(arg_37_0)
				return arg_37_0:getConfig("task_id") == arg_35_0.id
			end) then
				return
			end

			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = arg_35_0
			})
		elseif arg_35_0:getConfig("added_tip") > 0 then
			local var_36_1

			if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= TaskMediator.__cname then
				function var_36_1()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = var_0_1[arg_35_0:GetRealType()]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				yesText = "text_forward",
				noText = "text_iknow",
				content = i18n("tip_add_task", arg_35_0:getConfig("name")),
				onYes = var_36_1
			})
		end

		if arg_35_0:IsCommanderManualType() then
			getProxy(CommanderManualProxy):AddPageTaskDone(arg_35_0)
		end
	end

	local function var_35_1()
		local var_39_0 = getProxy(ContextProxy):getCurrentContext()

		if not table.contains({
			"LevelScene",
			"BattleScene",
			"EventListScene",
			"MilitaryExerciseScene",
			"DailyLevelScene"
		}, var_39_0.viewComponent.__cname) then
			return true
		end

		return false
	end

	local var_35_2 = arg_35_0:getConfig("story_id")

	if var_35_2 and var_35_2 ~= "" and var_35_1() then
		pg.NewStoryMgr.GetInstance():Play(var_35_2, var_35_0, true, true)
	else
		var_35_0()
	end
end

function var_0_0.updateProgress(arg_40_0, arg_40_1)
	arg_40_0.progress = arg_40_1
end

function var_0_0.isSelectable(arg_41_0)
	local var_41_0 = arg_41_0:getConfig("award_choice")

	return var_41_0 ~= nil and type(var_41_0) == "table" and #var_41_0 > 0
end

function var_0_0.judgeOverflow(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local var_42_0 = arg_42_0:getTaskStatus() == 1
	local var_42_1 = arg_42_0:ShowOnTaskScene()

	return var_0_0.StaticJudgeOverflow(arg_42_1, arg_42_2, arg_42_3, var_42_0, var_42_1, arg_42_0:getConfig("award_display"))
end

function var_0_0.StaticJudgeOverflow(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4, arg_43_5)
	if arg_43_3 and arg_43_4 then
		local var_43_0 = getProxy(PlayerProxy):getData()
		local var_43_1 = pg.gameset.urpt_chapter_max.description[1]
		local var_43_2 = arg_43_0 or var_43_0.gold
		local var_43_3 = arg_43_1 or var_43_0.oil
		local var_43_4 = arg_43_2 or not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_43_1) or 0
		local var_43_5 = pg.gameset.max_gold.key_value
		local var_43_6 = pg.gameset.max_oil.key_value
		local var_43_7 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0
		local var_43_8 = false
		local var_43_9 = false
		local var_43_10 = false
		local var_43_11 = false
		local var_43_12 = false
		local var_43_13 = {}
		local var_43_14 = arg_43_5

		for iter_43_0, iter_43_1 in ipairs(var_43_14) do
			local var_43_15, var_43_16, var_43_17 = unpack(iter_43_1)

			if var_43_15 == DROP_TYPE_RESOURCE then
				if var_43_16 == PlayerConst.ResGold then
					local var_43_18 = var_43_2 + var_43_17 - var_43_5

					if var_43_18 > 0 then
						var_43_8 = true

						local var_43_19 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResGold,
							count = setColorStr(var_43_18, COLOR_RED)
						}

						table.insert(var_43_13, var_43_19)
					end
				elseif var_43_16 == PlayerConst.ResOil then
					local var_43_20 = var_43_3 + var_43_17 - var_43_6

					if var_43_20 > 0 then
						var_43_9 = true

						local var_43_21 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResOil,
							count = setColorStr(var_43_20, COLOR_RED)
						}

						table.insert(var_43_13, var_43_21)
					end
				end
			elseif not LOCK_UR_SHIP and var_43_15 == DROP_TYPE_VITEM then
				if Item.getConfigData(var_43_16).virtual_type == 20 then
					local var_43_22 = var_43_4 + var_43_17 - var_43_7

					if var_43_22 > 0 then
						var_43_10 = true

						local var_43_23 = {
							type = DROP_TYPE_VITEM,
							id = var_43_1,
							count = setColorStr(var_43_22, COLOR_RED)
						}

						table.insert(var_43_13, var_43_23)
					end
				end
			elseif var_43_15 == DROP_TYPE_ITEM and Item.getConfigData(var_43_16).type == Item.EXP_BOOK_TYPE then
				local var_43_24 = getProxy(BagProxy):getItemCountById(var_43_16) + var_43_17
				local var_43_25 = Item.getConfigData(var_43_16).max_num

				if var_43_25 < var_43_24 then
					var_43_11 = true

					local var_43_26 = {
						type = DROP_TYPE_ITEM,
						id = var_43_16,
						count = setColorStr(math.min(var_43_17, var_43_24 - var_43_25), COLOR_RED)
					}

					table.insert(var_43_13, var_43_26)
				end
			end
		end

		return var_43_8 or var_43_9 or var_43_10 or var_43_11, var_43_13
	end
end

function var_0_0.IsUrTask(arg_44_0)
	if not LOCK_UR_SHIP then
		local var_44_0 = pg.gameset.urpt_chapter_max.description[1]

		do return _.any(arg_44_0:getConfig("award_display"), function(arg_45_0)
			return arg_45_0[1] == DROP_TYPE_ITEM and arg_45_0[2] == var_44_0
		end) end
		return
	end

	return false
end

function var_0_0.GetRealType(arg_46_0)
	local var_46_0 = arg_46_0:getConfig("priority_type")

	if var_46_0 == 0 then
		var_46_0 = arg_46_0:getConfig("type")
	end

	return var_46_0
end

function var_0_0.IsOverflowShipExpItem(arg_47_0)
	local function var_47_0(arg_48_0, arg_48_1)
		return getProxy(BagProxy):getItemCountById(arg_48_0) + arg_48_1 > Item.getConfigData(arg_48_0).max_num
	end

	local var_47_1 = arg_47_0:getConfig("award_display")

	for iter_47_0, iter_47_1 in ipairs(var_47_1) do
		local var_47_2 = iter_47_1[1]
		local var_47_3 = iter_47_1[2]
		local var_47_4 = iter_47_1[3]

		if var_47_2 == DROP_TYPE_ITEM and Item.getConfigData(var_47_3).type == Item.EXP_BOOK_TYPE and var_47_0(var_47_3, var_47_4) then
			return true
		end
	end

	return false
end

function var_0_0.ShowOnTaskScene(arg_49_0)
	local var_49_0 = arg_49_0:getConfig("visibility") == 1

	if arg_49_0.id == 17268 then
		var_49_0 = false

		local var_49_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.BUILDING_NEWYEAR_2022)

		if var_49_1 and not var_49_1:isEnd() then
			local var_49_2 = var_49_1.data1KeyValueList[2][17] or 1
			local var_49_3 = var_49_1.data1KeyValueList[2][18] or 1

			var_49_0 = var_49_2 >= 4 and var_49_3 >= 4
		end
	end

	return var_49_0
end

function var_0_0.setTaskFinish(arg_50_0)
	arg_50_0.submitTime = 1

	arg_50_0:updateProgress(arg_50_0:getConfig("target_num"))
end

function var_0_0.isAvatarTask(arg_51_0)
	return false
end

function var_0_0.getActId(arg_52_0)
	return arg_52_0._actId
end

function var_0_0.setActId(arg_53_0, arg_53_1)
	arg_53_0._actId = arg_53_1
end

function var_0_0.isActivityTask(arg_54_0)
	return arg_54_0._actId and arg_54_0._actId > 0
end

function var_0_0.setAutoSubmit(arg_55_0, arg_55_1)
	arg_55_0._autoSubmit = arg_55_1
end

function var_0_0.getAutoSubmit(arg_56_0)
	return arg_56_0._autoSubmit
end

function var_0_0.getGiveDrops(arg_57_0)
	local var_57_0 = {}

	if arg_57_0:getConfig("sub_type") == TASK_SUB_TYPE_VITEMS then
		local var_57_1 = tonumber(arg_57_0:getConfig("target_id"))

		for iter_57_0, iter_57_1 in ipairs(arg_57_0:getConfig("target_id_2")) do
			table.insert(var_57_0, Drop.New({
				type = var_57_1,
				id = iter_57_1[1],
				count = iter_57_1[2]
			}))
		end
	end

	return var_57_0
end

function var_0_0.OwnSpAward(arg_58_0)
	local function var_58_0(arg_59_0)
		return getProxy(DormProxy):getData():GetOwnFurnitureCount(arg_59_0) > 0
	end

	local function var_58_1(arg_60_0)
		local var_60_0 = getProxy(CollectionProxy):GetTrophyById(arg_60_0)

		return var_60_0 and (var_60_0:canClaimed() or var_60_0:isClaimed())
	end

	local function var_58_2(arg_61_0)
		local var_61_0 = getProxy(PlayerProxy):getRawData():getActivityMedalGroup()

		for iter_61_0, iter_61_1 in pairs(var_61_0) do
			if iter_61_1:OwnMedel(arg_61_0) then
				return true
			end
		end

		return false
	end

	local var_58_3 = {
		type = arg_58_0[1],
		id = arg_58_0[2],
		count = arg_58_0[3]
	}

	if var_58_3.type == DROP_TYPE_FURNITURE then
		return var_58_0(var_58_3.id)
	elseif var_58_3.type == DROP_TYPE_VITEM then
		local var_58_4 = pg.item_virtual_data_statistics[var_58_3.id].album_config

		if type(var_58_4) == "table" then
			local var_58_5 = var_58_4[1]
			local var_58_6 = var_58_4[2]

			if var_58_5 == 1 then
				return var_58_1(var_58_6)
			elseif var_58_5 == 2 then
				return var_58_2(var_58_6)
			end
		end
	end

	return false
end

return var_0_0
