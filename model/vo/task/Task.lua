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
		end
	}, function()
		return arg_15_0.progress
	end) or 0
end

function var_0_0.getTargetNumber(arg_29_0)
	return arg_29_0:getConfig("target_num")
end

function var_0_0.isReceive(arg_30_0)
	return arg_30_0.submitTime > 0
end

function var_0_0.isCircle(arg_31_0)
	if arg_31_0:isActivityTask() then
		if arg_31_0:getConfig("type") == 16 and arg_31_0:getConfig("sub_type") == 1006 then
			return true
		elseif arg_31_0:getConfig("type") == 16 and arg_31_0:getConfig("sub_type") == 20 then
			return true
		elseif arg_31_0:getConfig("type") == 16 and arg_31_0:getConfig("sub_type") == 1007 then
			return true
		elseif arg_31_0:getConfig("type") == 16 and arg_31_0:getConfig("sub_type") == 122 then
			return true
		end
	end

	return false
end

function var_0_0.isDaily(arg_32_0)
	return arg_32_0:getConfig("sub_type") == 415 or arg_32_0:getConfig("sub_type") == 412
end

function var_0_0.getTaskStatus(arg_33_0)
	if arg_33_0:isLock() then
		return -1
	end

	if arg_33_0:isReceive() then
		return 2
	end

	if arg_33_0:isFinish() then
		return 1
	end

	return 0
end

function var_0_0.onAdded(arg_34_0)
	local function var_34_0()
		if arg_34_0:getConfig("sub_type") == 29 then
			local var_35_0 = getProxy(SkirmishProxy):getRawData()

			if _.any(var_35_0, function(arg_36_0)
				return arg_36_0:getConfig("task_id") == arg_34_0.id
			end) then
				return
			end

			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = arg_34_0
			})
		elseif arg_34_0:getConfig("added_tip") > 0 then
			local var_35_1

			if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= TaskMediator.__cname then
				function var_35_1()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = var_0_1[arg_34_0:GetRealType()]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				noText = "text_iknow",
				yesText = "text_forward",
				content = i18n("tip_add_task", arg_34_0:getConfig("name")),
				onYes = var_35_1,
				weight = LayerWeightConst.TOP_LAYER
			})
		end

		if arg_34_0:IsCommanderManualType() then
			getProxy(CommanderManualProxy):AddPageTaskDone(arg_34_0)
		end
	end

	local function var_34_1()
		local var_38_0 = getProxy(ContextProxy):getCurrentContext()

		if not table.contains({
			"LevelScene",
			"BattleScene",
			"EventListScene",
			"MilitaryExerciseScene",
			"DailyLevelScene"
		}, var_38_0.viewComponent.__cname) then
			return true
		end

		return false
	end

	local var_34_2 = arg_34_0:getConfig("story_id")

	if var_34_2 and var_34_2 ~= "" and var_34_1() then
		pg.NewStoryMgr.GetInstance():Play(var_34_2, var_34_0, true, true)
	else
		var_34_0()
	end
end

function var_0_0.updateProgress(arg_39_0, arg_39_1)
	arg_39_0.progress = arg_39_1
end

function var_0_0.isSelectable(arg_40_0)
	local var_40_0 = arg_40_0:getConfig("award_choice")

	return var_40_0 ~= nil and type(var_40_0) == "table" and #var_40_0 > 0
end

function var_0_0.judgeOverflow(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0 = arg_41_0:getTaskStatus() == 1
	local var_41_1 = arg_41_0:ShowOnTaskScene()

	return var_0_0.StaticJudgeOverflow(arg_41_1, arg_41_2, arg_41_3, var_41_0, var_41_1, arg_41_0:getConfig("award_display"))
end

function var_0_0.StaticJudgeOverflow(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4, arg_42_5)
	if arg_42_3 and arg_42_4 then
		local var_42_0 = getProxy(PlayerProxy):getData()
		local var_42_1 = pg.gameset.urpt_chapter_max.description[1]
		local var_42_2 = arg_42_0 or var_42_0.gold
		local var_42_3 = arg_42_1 or var_42_0.oil
		local var_42_4 = arg_42_2 or not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_42_1) or 0
		local var_42_5 = pg.gameset.max_gold.key_value
		local var_42_6 = pg.gameset.max_oil.key_value
		local var_42_7 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0
		local var_42_8 = false
		local var_42_9 = false
		local var_42_10 = false
		local var_42_11 = false
		local var_42_12 = false
		local var_42_13 = {}
		local var_42_14 = arg_42_5

		for iter_42_0, iter_42_1 in ipairs(var_42_14) do
			local var_42_15, var_42_16, var_42_17 = unpack(iter_42_1)

			if var_42_15 == DROP_TYPE_RESOURCE then
				if var_42_16 == PlayerConst.ResGold then
					local var_42_18 = var_42_2 + var_42_17 - var_42_5

					if var_42_18 > 0 then
						var_42_8 = true

						local var_42_19 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResGold,
							count = setColorStr(var_42_18, COLOR_RED)
						}

						table.insert(var_42_13, var_42_19)
					end
				elseif var_42_16 == PlayerConst.ResOil then
					local var_42_20 = var_42_3 + var_42_17 - var_42_6

					if var_42_20 > 0 then
						var_42_9 = true

						local var_42_21 = {
							type = DROP_TYPE_RESOURCE,
							id = PlayerConst.ResOil,
							count = setColorStr(var_42_20, COLOR_RED)
						}

						table.insert(var_42_13, var_42_21)
					end
				end
			elseif not LOCK_UR_SHIP and var_42_15 == DROP_TYPE_VITEM then
				if Item.getConfigData(var_42_16).virtual_type == 20 then
					local var_42_22 = var_42_4 + var_42_17 - var_42_7

					if var_42_22 > 0 then
						var_42_10 = true

						local var_42_23 = {
							type = DROP_TYPE_VITEM,
							id = var_42_1,
							count = setColorStr(var_42_22, COLOR_RED)
						}

						table.insert(var_42_13, var_42_23)
					end
				end
			elseif var_42_15 == DROP_TYPE_ITEM and Item.getConfigData(var_42_16).type == Item.EXP_BOOK_TYPE then
				local var_42_24 = getProxy(BagProxy):getItemCountById(var_42_16) + var_42_17
				local var_42_25 = Item.getConfigData(var_42_16).max_num

				if var_42_25 < var_42_24 then
					var_42_11 = true

					local var_42_26 = {
						type = DROP_TYPE_ITEM,
						id = var_42_16,
						count = setColorStr(math.min(var_42_17, var_42_24 - var_42_25), COLOR_RED)
					}

					table.insert(var_42_13, var_42_26)
				end
			end
		end

		return var_42_8 or var_42_9 or var_42_10 or var_42_11, var_42_13
	end
end

function var_0_0.IsUrTask(arg_43_0)
	if not LOCK_UR_SHIP then
		local var_43_0 = pg.gameset.urpt_chapter_max.description[1]

		do return _.any(arg_43_0:getConfig("award_display"), function(arg_44_0)
			return arg_44_0[1] == DROP_TYPE_ITEM and arg_44_0[2] == var_43_0
		end) end
		return
	end

	return false
end

function var_0_0.GetRealType(arg_45_0)
	local var_45_0 = arg_45_0:getConfig("priority_type")

	if var_45_0 == 0 then
		var_45_0 = arg_45_0:getConfig("type")
	end

	return var_45_0
end

function var_0_0.IsOverflowShipExpItem(arg_46_0)
	local function var_46_0(arg_47_0, arg_47_1)
		return getProxy(BagProxy):getItemCountById(arg_47_0) + arg_47_1 > Item.getConfigData(arg_47_0).max_num
	end

	local var_46_1 = arg_46_0:getConfig("award_display")

	for iter_46_0, iter_46_1 in ipairs(var_46_1) do
		local var_46_2 = iter_46_1[1]
		local var_46_3 = iter_46_1[2]
		local var_46_4 = iter_46_1[3]

		if var_46_2 == DROP_TYPE_ITEM and Item.getConfigData(var_46_3).type == Item.EXP_BOOK_TYPE and var_46_0(var_46_3, var_46_4) then
			return true
		end
	end

	return false
end

function var_0_0.ShowOnTaskScene(arg_48_0)
	local var_48_0 = arg_48_0:getConfig("visibility") == 1

	if arg_48_0.id == 17268 then
		var_48_0 = false

		local var_48_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.BUILDING_NEWYEAR_2022)

		if var_48_1 and not var_48_1:isEnd() then
			local var_48_2 = var_48_1.data1KeyValueList[2][17] or 1
			local var_48_3 = var_48_1.data1KeyValueList[2][18] or 1

			var_48_0 = var_48_2 >= 4 and var_48_3 >= 4
		end
	end

	return var_48_0
end

function var_0_0.setTaskFinish(arg_49_0)
	arg_49_0.submitTime = 1

	arg_49_0:updateProgress(arg_49_0:getConfig("target_num"))
end

function var_0_0.isAvatarTask(arg_50_0)
	return false
end

function var_0_0.getActId(arg_51_0)
	return arg_51_0._actId
end

function var_0_0.setActId(arg_52_0, arg_52_1)
	arg_52_0._actId = arg_52_1
end

function var_0_0.isActivityTask(arg_53_0)
	return arg_53_0._actId and arg_53_0._actId > 0
end

function var_0_0.setAutoSubmit(arg_54_0, arg_54_1)
	arg_54_0._autoSubmit = arg_54_1
end

function var_0_0.getAutoSubmit(arg_55_0)
	return arg_55_0._autoSubmit
end

function var_0_0.getGiveDrops(arg_56_0)
	local var_56_0 = {}

	if arg_56_0:getConfig("sub_type") == TASK_SUB_TYPE_VITEMS then
		local var_56_1 = tonumber(arg_56_0:getConfig("target_id"))

		for iter_56_0, iter_56_1 in ipairs(arg_56_0:getConfig("target_id_2")) do
			table.insert(var_56_0, Drop.New({
				type = var_56_1,
				id = iter_56_1[1],
				count = iter_56_1[2]
			}))
		end
	end

	return var_56_0
end

return var_0_0
