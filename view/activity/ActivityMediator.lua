local var_0_0 = class("ActivityMediator", import("..base.ContextMediator"))

var_0_0.EVENT_GO_SCENE = "event go scene"
var_0_0.EVENT_OPERATION = "event operation"
var_0_0.GO_SHOPS_LAYER = "event go shop layer"
var_0_0.GO_SHOPS_LAYER_STEEET = "event go shop layer in shopstreet"
var_0_0.BATTLE_OPERA = "event difficult sel"
var_0_0.GO_BACKYARD = "event go backyard"
var_0_0.GO_LOTTERY = "event go lottery"
var_0_0.EVENT_COLORING_ACHIEVE = "event coloring achieve"
var_0_0.ON_TASK_SUBMIT = "event on task submit"
var_0_0.ON_TASK_SUBMIT_ONESTEP = "event on task submit one step"
var_0_0.ON_TASK_GO = "event on task go"
var_0_0.OPEN_LAYER = "event OPEN_LAYER"
var_0_0.CLOSE_LAYER = "event CLOSE_LAYER"
var_0_0.EVENT_PT_OPERATION = "event pt op"
var_0_0.BLACKWHITEGRID = "black white grid"
var_0_0.MEMORYBOOK = "memory book"
var_0_0.RETURN_AWARD_OP = "event return award op"
var_0_0.SHOW_AWARD_WINDOW = "event show award window"
var_0_0.GO_DODGEM = "event go dodgem"
var_0_0.GO_SUBMARINE_RUN = "event go sumbarine run"
var_0_0.ON_SIMULATION_COMBAT = "event simulation combat"
var_0_0.ON_AIRFIGHT_COMBAT = "event perform airfight combat"
var_0_0.SPECIAL_BATTLE_OPERA = "special battle opera"
var_0_0.NEXT_DISPLAY_AWARD = "next display awards"
var_0_0.GO_PRAY_POOL = "go pray pool"
var_0_0.SELECT_ACTIVITY = "event select activity"
var_0_0.FETCH_INSTARGRAM = "fetch instagram"
var_0_0.MUSIC_GAME_OPERATOR = "get music game final prize"
var_0_0.SHOW_NEXT_ACTIVITY = "show next activity"
var_0_0.OPEN_RED_PACKET_LAYER = "ActivityMediator:OPEN_RED_PACKET_LAYER"
var_0_0.GO_MINI_GAME = "ActivityMediator.GO_MINI_GAME"
var_0_0.GO_DECODE_MINI_GAME = "ActivityMediator:GO_DECODE_MINI_GAME"
var_0_0.ON_BOBING_RESULT = "on bobing result"
var_0_0.ACTIVITY_PERMANENT = "ActivityMediator.ACTIVITY_PERMANENT"
var_0_0.FINISH_ACTIVITY_PERMANENT = "ActivityMediator.FINISH_ACTIVITY_PERMANENT"
var_0_0.ON_SHAKE_BEADS_RESULT = "on shake beads result"
var_0_0.GO_PERFORM_COMBAT = "ActivityMediator.GO_PERFORM_COMBAT"
var_0_0.ON_AWARD_WINDOW = "ActivityMediator:ON_AWARD_WINDOW"
var_0_0.GO_CARDPUZZLE_COMBAT = "ActivityMediator.GO_CARDPUZZLE_COMBAT"
var_0_0.CHARGE = "ActivityMediator.CHARGE"
var_0_0.BUY_ITEM = "ActivityMediator.BUY_ITEM"
var_0_0.OPEN_CHARGE_ITEM_PANEL = "ActivityMediator.OPEN_CHARGE_ITEM_PANEL"
var_0_0.OPEN_CHARGE_BIRTHDAY = "ActivityMediator.OPEN_CHARGE_BIRTHDAY"
var_0_0.STORE_DATE = "ActivityMediator.STORE_DATE"
var_0_0.ON_ACT_SHOPPING = "ActivityMediator.ON_ACT_SHOPPING"
var_0_0.GO_MONOPOLY2024 = "ActivityMediator:GO_MONOPOLY2024"
var_0_0.ON_ACTIVITY_TASK_SUBMIT = "ActivityMediator.ON_ACTIVITY_TASK_SUBMIT"
var_0_0.ON_ACTIVITY_TASK_LIST_SUBMIT = "ActivityMediator.ON_ACTIVITY_TASK_LIST_SUBMIT"
var_0_0.GO_CHANGE_SHOP = "go Change shop"
var_0_0.GO_Activity_level = "go Activity level"
var_0_0.ON_ADD_SUBLAYER = "ActivityMediator.ON_ADD_SUBLAYER"
var_0_0.GO_SPECIAL_EXERCISE = "go Special exercise"
var_0_0.GO_SINGLE_PRECOMBAT = "ActivityMediator.GO_SINGLE_PRECOMBAT"
var_0_0.ON_BOSSRUSH_MAP = "ActivityMediator.ON_BOSSRUSH_MAP"
var_0_0.SKIP_ACTIVITY_MAP = "ActivityMediator.SKIP_ACTIVITY_MAP"
var_0_0.OPEN_MINI_PROGRAM = "ActivityMediator.OPEN_MINI_PROGRAM"
var_0_0.ON_COLLAB_BOSSRUSH_MAP = "ActivityMediator.ON_COLLAB_BOSSRUSH_MAP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.GO_MONOPOLY2024, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = MonopolyCar2024Mediator,
			viewComponent = MonopolyCar2024Scene,
			data = {
				actId = arg_2_1
			},
			onRemoved = arg_2_2
		}))
	end)
	arg_1_0:bind(var_0_0.ON_AWARD_WINDOW, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0.viewComponent:ShowAwardWindow(arg_3_1, arg_3_2, arg_3_3)
	end)
	arg_1_0:bind(var_0_0.GO_CHANGE_SHOP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP)
	end)
	arg_1_0:bind(var_0_0.GO_Activity_level, function(arg_5_0)
		local var_5_0 = getProxy(ChapterProxy)
		local var_5_1, var_5_2 = var_5_0:getLastMapForActivity()

		if not var_5_1 or not var_5_0:getMapById(var_5_1):isUnlock() then
			local var_5_3 = getProxy(ChapterProxy)
			local var_5_4 = var_5_3:getActiveChapter()

			var_5_1 = var_5_4 and var_5_4:getConfig("map")

			if not var_5_4 then
				var_5_1 = var_5_3:GetLastNormalMap()
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_5_4 and var_5_4.id,
				mapIdx = var_5_1
			})
		else
			if not chapter then
				var_5_1 = var_5_0:GetLastNormalMap()
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_5_2,
				mapIdx = var_5_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.ON_COLLAB_BOSSRUSH_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_DAL_COLLAB)
	end)
	arg_1_0:bind(var_0_0.ON_BOSSRUSH_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
	end)
	arg_1_0:bind(var_0_0.GO_DECODE_MINI_GAME, function(arg_8_0)
		pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
			type = MiniGameRequestCommand.REQUEST_HUB_DATA,
			callback = function()
				pg.m02:sendNotification(GAME.GO_MINI_GAME, 11)
			end
		})
	end)
	arg_1_0:bind(var_0_0.GO_MINI_GAME, function(arg_10_0, arg_10_1)
		pg.m02:sendNotification(GAME.GO_MINI_GAME, arg_10_1)
	end)
	arg_1_0:bind(var_0_0.GO_SUBMARINE_RUN, function(arg_11_0, arg_11_1)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SUBMARINE_RUN,
			stageId = arg_11_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_DODGEM, function(arg_12_0)
		local var_12_0 = ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES[math.random(#ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES)]

		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_DODGEM,
			stageId = var_12_0
		})
	end)
	arg_1_0:bind(var_0_0.ON_SIMULATION_COMBAT, function(arg_13_0, arg_13_1, arg_13_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SIMULATION,
			stageId = arg_13_1.stageId,
			warnMsg = arg_13_1.warnMsg,
			exitCallback = arg_13_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_AIRFIGHT_COMBAT, function(arg_14_0, arg_14_1, arg_14_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_AIRFIGHT,
			stageId = arg_14_1.stageId,
			exitCallback = arg_14_2
		})
	end)
	arg_1_0:bind(var_0_0.RETURN_AWARD_OP, function(arg_15_0, arg_15_1)
		if arg_15_1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_AWARD_OVERVIEW then
			arg_1_0.viewComponent:ShowWindow(ReturnerAwardWindow, arg_15_1.arg1)
		elseif arg_15_1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW then
			arg_1_0.viewComponent:ShowWindow(TaskAwardWindow, arg_15_1.arg1)
		else
			arg_1_0:sendNotification(GAME.RETURN_AWARD_OP, arg_15_1)
		end
	end)
	arg_1_0:bind(var_0_0.SHOW_AWARD_WINDOW, function(arg_16_0, arg_16_1, arg_16_2)
		arg_1_0.viewComponent:ShowWindow(arg_16_1, arg_16_2)
	end)
	arg_1_0:bind(var_0_0.EVENT_PT_OPERATION, function(arg_17_0, arg_17_1)
		arg_1_0:sendNotification(GAME.ACT_NEW_PT, arg_17_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_LAYER, function(arg_18_0, arg_18_1)
		arg_1_0:addSubLayers(arg_18_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_RED_PACKET_LAYER, function(arg_19_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = RedPacketMediator,
			viewComponent = RedPacketLayer
		}))
	end)
	arg_1_0:bind(var_0_0.CLOSE_LAYER, function(arg_20_0, arg_20_1)
		local var_20_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(arg_20_1)

		if var_20_0 then
			arg_1_0:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_20_0
			})
		end
	end)
	arg_1_0:bind(var_0_0.EVENT_OPERATION, function(arg_21_0, arg_21_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, arg_21_1)
	end)
	arg_1_0:bind(var_0_0.EVENT_GO_SCENE, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_1 == SCENE.SUMMER_FEAST then
			pg.NewStoryMgr.GetInstance():Play("TIANHOUYUYI1", function()
				arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
			end)
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, arg_22_1, arg_22_2)
		end
	end)
	arg_1_0:bind(var_0_0.BLACKWHITEGRID, function()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLACKWHITE) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = BlackWhiteGridLayer,
			mediator = BlackWhiteGridMediator
		}))
	end)
	arg_1_0:bind(var_0_0.MEMORYBOOK, function()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = MemoryBookLayer,
			mediator = MemoryBookMediator
		}))
	end)
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER, function(arg_26_0, arg_26_1)
		if not getProxy(ActivityProxy):getActivityById(arg_26_1.actId) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_26_1 or {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end)
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER_STEEET, function(arg_27_0, arg_27_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_27_1 or {
			warp = NewShopsScene.TYPE_SHOP_STREET
		})
	end)
	arg_1_0:bind(var_0_0.BATTLE_OPERA, function()
		local var_28_0 = getProxy(ChapterProxy)
		local var_28_1, var_28_2 = var_28_0:getLastMapForActivity()

		if not var_28_1 or not var_28_0:getMapById(var_28_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_28_2,
				mapIdx = var_28_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.SKIP_ACTIVITY_MAP, function(arg_29_0, arg_29_1)
		local var_29_0 = getProxy(ChapterProxy)
		local var_29_1, var_29_2 = var_29_0:getLastMapForActivity(arg_29_1)

		if not var_29_1 or not var_29_0:getMapById(var_29_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_29_2,
				mapIdx = var_29_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.OPEN_MINI_PROGRAM, function(arg_30_0)
		pg.SdkMgr.GetInstance():OpenMiniProgram()
	end)
	arg_1_0:bind(var_0_0.GO_SPECIAL_EXERCISE, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACT_BOSS_BATTLE)
	end)
	arg_1_0:bind(var_0_0.SPECIAL_BATTLE_OPERA, function()
		local var_32_0 = getProxy(ChapterProxy)
		local var_32_1, var_32_2 = var_32_0:getLastMapForActivity()

		if not var_32_1 or not var_32_0:getMapById(var_32_1):isUnlock() then
			local var_32_3 = getProxy(ChapterProxy)
			local var_32_4 = var_32_3:getActiveChapter()

			var_32_1 = var_32_4 and var_32_4:getConfig("map")

			if not var_32_4 then
				var_32_1 = var_32_3:GetLastNormalMap()
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_32_4 and var_32_4.id,
				mapIdx = var_32_1
			})
		else
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_32_2,
				mapIdx = var_32_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.ON_ADD_SUBLAYER, function(arg_33_0, arg_33_1)
		arg_1_0:addSubLayers(arg_33_1)
	end)
	arg_1_0:bind(var_0_0.GO_LOTTERY, function(arg_34_0)
		local var_34_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

		arg_1_0:addSubLayers(Context.New({
			mediator = LotteryMediator,
			viewComponent = LotteryLayer,
			data = {
				activityId = var_34_0.id
			}
		}))
	end)
	arg_1_0:bind(var_0_0.GO_BACKYARD, function(arg_35_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.COURTYARD)
	end)
	arg_1_0:bind(var_0_0.EVENT_COLORING_ACHIEVE, function(arg_36_0, arg_36_1)
		arg_1_0:sendNotification(GAME.COLORING_ACHIEVE, arg_36_1)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_37_0, arg_37_1, arg_37_2)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_37_1.id, arg_37_2)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT_ONESTEP, function(arg_38_0, arg_38_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK_ONESTEP, {
			resultList = arg_38_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_GO, function(arg_39_0, arg_39_1)
		arg_1_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_39_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_PRAY_POOL, function(arg_40_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT, {
			goToPray = true
		})
	end)
	arg_1_0:bind(var_0_0.FETCH_INSTARGRAM, function(arg_41_0, ...)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_FETCH, ...)
	end)
	arg_1_0:bind(var_0_0.MUSIC_GAME_OPERATOR, function(arg_42_0, ...)
		arg_1_0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
	arg_1_0:bind(var_0_0.SELECT_ACTIVITY, function(arg_43_0, arg_43_1)
		arg_1_0.viewComponent:verifyTabs(arg_43_1)
	end)
	arg_1_0:bind(var_0_0.SHOW_NEXT_ACTIVITY, function(arg_44_0, arg_44_1)
		arg_1_0:showNextActivity(arg_44_1)
	end)
	arg_1_0:bind(var_0_0.ACTIVITY_PERMANENT, function(arg_45_0, arg_45_1)
		if PlayerPrefs.GetString("permanent_time", "") ~= pg.gameset.permanent_mark.description then
			PlayerPrefs.SetString("permanent_time", pg.gameset.permanent_mark.description)
			arg_1_0.viewComponent:updateEntrances()
		end

		local var_45_0 = getProxy(ActivityPermanentProxy):getDoingActivity()

		if var_45_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_permanent_tips3"))
			arg_1_0.viewComponent:verifyTabs(var_45_0.id)
		else
			arg_1_0:addSubLayers(Context.New({
				mediator = ActivityPermanentMediator,
				viewComponent = ActivityPermanentLayer,
				data = {
					finishId = arg_45_1
				}
			}))
		end
	end)
	arg_1_0:bind(var_0_0.FINISH_ACTIVITY_PERMANENT, function(arg_46_0)
		local var_46_0 = getProxy(ActivityPermanentProxy):getDoingActivity()

		assert(var_46_0:canPermanentFinish(), "error permanent activity finish")
		arg_1_0:sendNotification(GAME.ACTIVITY_PERMANENT_FINISH, {
			activity_id = var_46_0.id
		})
	end)
	arg_1_0:bind(var_0_0.GO_PERFORM_COMBAT, function(arg_47_0, arg_47_1, arg_47_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = arg_47_1.stageId,
			memory = arg_47_1.memory
		})
	end)
	arg_1_0:bind(var_0_0.NEXT_DISPLAY_AWARD, function(arg_48_0, arg_48_1, arg_48_2)
		arg_1_0.nextDisplayAwards = arg_48_1
	end)
	arg_1_0:bind(var_0_0.GO_CARDPUZZLE_COMBAT, function(arg_49_0, arg_49_1)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_CARDPUZZLE,
			combatID = arg_49_1
		})
	end)
	arg_1_0:bind(var_0_0.CHARGE, function(arg_50_0, arg_50_1)
		arg_1_0:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_50_1
		})
	end)
	arg_1_0:bind(var_0_0.BUY_ITEM, function(arg_51_0, arg_51_1, arg_51_2)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_51_1,
			count = arg_51_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_PANEL, function(arg_52_0, arg_52_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemPanelMediator,
			viewComponent = ChargeItemPanelLayer,
			data = {
				panelConfig = arg_52_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_BIRTHDAY, function(arg_53_0, arg_53_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	end)
	arg_1_0:bind(var_0_0.STORE_DATE, function(arg_54_0, arg_54_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_STORE_DATE, {
			activity_id = arg_54_1.actId,
			intValue = arg_54_1.intValue or 0,
			strValue = arg_54_1.strValue or "",
			callback = arg_54_1.callback
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACT_SHOPPING, function(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, {
			activity_id = arg_55_1,
			cmd = arg_55_2,
			arg1 = arg_55_3,
			arg2 = arg_55_4
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVITY_TASK_SUBMIT, function(arg_56_0, arg_56_1)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_56_1.activityId,
			task_ids = {
				arg_56_1.id
			}
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVITY_TASK_LIST_SUBMIT, function(arg_57_0, arg_57_1)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_57_1.activityId,
			task_ids = arg_57_1.ids
		})
	end)
	arg_1_0:bind(var_0_0.GO_SINGLE_PRECOMBAT, function(arg_58_0, arg_58_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = BossSinglePreCombatLiteMediator,
			viewComponent = BossSinglePreCombatLiteLayer,
			data = {
				system = arg_58_1.system,
				stageId = arg_58_1.stageId,
				actId = arg_58_1.activityID,
				fleets = arg_58_1.fleets
			}
		}))
	end)
	arg_1_0.viewComponent:setActivities(arg_1_0:getDisplayActivity())

	local var_1_0 = getProxy(PlayerProxy):getRawData()

	arg_1_0.viewComponent:setPlayer(var_1_0)

	local var_1_1 = getProxy(BayProxy):getShipById(var_1_0.character)

	arg_1_0.viewComponent:setFlagShip(var_1_1)
end

function var_0_0.getDisplayActivity(arg_59_0)
	return getProxy(ActivityProxy):getPanelActivities()
end

function var_0_0.initNotificationHandleDic(arg_60_0)
	arg_60_0.handleDic = {
		[ActivityProxy.ACTIVITY_ADDED] = function(arg_61_0, arg_61_1)
			local var_61_0 = arg_61_1:getBody()

			if var_61_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
				return
			end

			arg_61_0.viewComponent:updateActivity(var_61_0)

			if ActivityConst.AOERLIANG_TASK_ID == var_61_0.id then
				arg_61_0.viewComponent:update_task_list_auto_aoerliang(var_61_0)
			end
		end,
		[ActivityProxy.ACTIVITY_UPDATED] = function(...)
			arg_60_0.handleDic[ActivityProxy.ACTIVITY_ADDED](...)
		end,
		[ActivityProxy.ACTIVITY_DELETED] = function(arg_63_0, arg_63_1)
			local var_63_0 = arg_63_1:getBody()

			arg_63_0.viewComponent:removeActivity(var_63_0)
		end,
		[ActivityProxy.ACTIVITY_OPERATION_DONE] = function(arg_64_0, arg_64_1)
			local var_64_0 = arg_64_1:getBody()

			if getProxy(ActivityProxy):getActivityById(var_64_0):getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING_2 then
				arg_64_0.viewComponent:updateActivity()
			end

			if ActivityConst.AOERLIANG_TASK_ID == var_64_0 then
				return
			end

			local var_64_1 = getProxy(ActivityProxy):getActivityById(var_64_0)

			arg_64_0:showNextActivity(var_64_1:getConfig("page_core"))
		end,
		[ActivityProxy.ACTIVITY_SHOW_AWARDS] = function(arg_65_0, arg_65_1)
			local var_65_0 = arg_65_1:getBody()
			local var_65_1 = var_65_0.awards

			if arg_65_0.nextDisplayAwards and #arg_65_0.nextDisplayAwards > 0 then
				for iter_65_0 = 1, #arg_65_0.nextDisplayAwards do
					table.insert(var_65_1, arg_65_0.nextDisplayAwards[iter_65_0])
				end
			end

			arg_65_0.nextDisplayAwards = {}

			arg_65_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_65_1, var_65_0.callback)
		end,
		[ActivityProxy.ACTIVITY_SHOW_BB_RESULT] = function(arg_66_0, arg_66_1)
			local var_66_0 = arg_66_1:getBody()

			arg_66_0.viewComponent:emit(ActivityMediator.ON_BOBING_RESULT, var_66_0)
		end,
		[ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT] = function(arg_67_0, arg_67_1)
			local var_67_0 = arg_67_1:getBody()
			local var_67_1 = var_67_0.activityID

			arg_67_0.viewComponent.pageDic[var_67_1]:showLotteryAwardResult(var_67_0.awards, var_67_0.number, var_67_0.callback)
		end,
		[ActivityProxy.ACTIVITY_SHOW_SHAKE_BEADS_RESULT] = function(arg_68_0, arg_68_1)
			local var_68_0 = arg_68_1:getBody()

			arg_68_0.viewComponent:emit(ActivityMediator.ON_SHAKE_BEADS_RESULT, var_68_0)
		end,
		[GAME.SUBMIT_TASK_DONE] = function(arg_69_0, arg_69_1)
			local var_69_0 = arg_69_1:getBody()

			arg_69_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_69_0, function()
				arg_69_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.SUBMIT_ACTIVITY_TASK_DONE] = function(arg_71_0, arg_71_1)
			local var_71_0 = arg_71_1:getBody()

			arg_71_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_71_0.awards, function()
				arg_71_0.viewComponent:checkAutoHideActivity()
				arg_71_0.viewComponent:updateTaskLayers()
				existCall(var_71_0.callback)
			end)
		end,
		[GAME.ACT_NEW_PT_DONE] = function(arg_73_0, arg_73_1)
			local var_73_0 = arg_73_1:getBody()

			arg_73_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_73_0.awards, function()
				arg_73_0.viewComponent:updateTaskLayers()
				existCall(var_73_0.callback)
			end)
		end,
		[GAME.BEGIN_STAGE_DONE] = function(arg_75_0, arg_75_1)
			local var_75_0 = arg_75_1:getBody()

			arg_75_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_75_0)
		end,
		[GAME.RETURN_AWARD_OP_DONE] = function(arg_76_0, arg_76_1)
			local var_76_0 = arg_76_1:getBody()

			arg_76_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_76_0.awards)
		end,
		[VoteProxy.VOTE_ORDER_BOOK_DELETE] = function(arg_77_0, arg_77_1)
			return
		end,
		[VoteProxy.VOTE_ORDER_BOOK_UPDATE] = function(...)
			arg_60_0.handleDic[VoteProxy.VOTE_ORDER_BOOK_DELETE](...)
		end,
		[GAME.REMOVE_LAYERS] = function(arg_79_0, arg_79_1)
			if arg_79_1:getBody().context.mediator == VoteFameHallMediator then
				arg_79_0.viewComponent:updateEntrances()
			end
		end,
		[GAME.MONOPOLY_AWARD_DONE] = function(arg_80_0, arg_80_1)
			local var_80_0 = arg_80_1:getBody()
			local var_80_1 = arg_80_0.viewComponent.pageDic[arg_80_0.viewComponent.activity.id]

			if var_80_1 and var_80_1.activity:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MONOPOLY and var_80_1.onAward then
				var_80_1:onAward(var_80_0.awards, var_80_0.callback)
			elseif var_80_0.autoFlag then
				arg_80_0.viewComponent:emit(BaseUI.ON_ACHIEVE_AUTO, var_80_0.awards, 1, var_80_0.callback)
			else
				arg_80_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_80_0.awards, var_80_0.callback)
			end
		end,
		[GAME.SEND_MINI_GAME_OP_DONE] = function(arg_81_0, arg_81_1)
			local var_81_0 = arg_81_1:getBody()
			local var_81_1 = {
				function(arg_82_0)
					local var_82_0 = var_81_0.awards

					if #var_82_0 > 0 then
						if arg_81_0.viewComponent then
							arg_81_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_82_0, arg_82_0)
						else
							arg_81_0:emit(BaseUI.ON_ACHIEVE, var_82_0, arg_82_0)
						end
					else
						arg_82_0()
					end
				end
			}

			seriesAsync(var_81_1, function()
				arg_81_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.ACTIVITY_PERMANENT_START_DONE] = function(arg_84_0, arg_84_1)
			local var_84_0 = arg_84_1:getBody()

			arg_84_0.viewComponent:verifyTabs(var_84_0.id)
		end,
		[GAME.ACTIVITY_PERMANENT_FINISH_DONE] = function(arg_85_0, arg_85_1)
			local var_85_0 = arg_85_1:getBody()

			arg_85_0.viewComponent:emit(ActivityMediator.ACTIVITY_PERMANENT, var_85_0.activity_id)
		end,
		[GAME.MEMORYBOOK_UNLOCK_AWARD_DONE] = function(arg_86_0, arg_86_1)
			local var_86_0 = arg_86_1:getBody()

			arg_86_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_86_0.awards)
		end,
		[GAME.CHARGE_SUCCESS] = function(arg_87_0, arg_87_1)
			local var_87_0 = arg_87_1:getBody()

			arg_87_0.viewComponent:updateTaskLayers()

			local var_87_1 = Goods.Create({
				shop_id = var_87_0.shopId
			}, Goods.TYPE_CHARGE)

			arg_87_0.viewComponent:OnChargeSuccess(var_87_1)
		end,
		[GAME.SHOPPING_DONE] = function(arg_88_0, arg_88_1)
			local var_88_0 = arg_88_1:getBody()

			arg_88_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_88_0.awards, function()
				arg_88_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.ACT_MANUAL_SIGN_DONE] = function(arg_90_0, arg_90_1)
			local var_90_0 = arg_90_1:getBody()

			arg_90_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_90_0.awards)
		end,
		[ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS] = function(arg_91_0, arg_91_1)
			local var_91_0 = arg_91_1:getBody()

			arg_91_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_91_0.awards, function()
				local var_92_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE)

				if var_92_0 and not var_92_0:isShow() and var_92_0:isCorePage(arg_91_0.contextData.coreName) then
					arg_91_0.viewComponent:removeActivity(var_92_0.id)
				end

				arg_91_0.viewComponent:updateTaskLayers()
				existCall(var_91_0.callback)
			end)
		end
	}
end

function var_0_0.showNextActivity(arg_93_0, arg_93_1)
	local var_93_0 = getProxy(ActivityProxy)

	if not var_93_0 then
		return
	end

	local var_93_1 = var_93_0:findNextAutoActivity(arg_93_1)

	if var_93_1 then
		if var_93_1.id == ActivityConst.BLACK_FRIDAY_SIGNIN_ACT_ID then
			arg_93_0.contextData.showByNextAct = true

			arg_93_0.viewComponent:verifyTabs(ActivityConst.BLACK_FRIDAY_ACT_ID)
		else
			arg_93_0.viewComponent:verifyTabs(var_93_1.id)
		end

		local var_93_2 = var_93_1:getConfig("type")

		if var_93_2 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
			arg_93_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = var_93_1.id
			})
		elseif var_93_2 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
			local var_93_3 = var_93_1:getSpecialData("reMonthSignDay") ~= nil and 3 or 1

			arg_93_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = var_93_1.id,
				cmd = var_93_3,
				arg1 = var_93_1:getSpecialData("reMonthSignDay")
			})
		elseif var_93_2 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
			arg_93_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = var_93_1.id,
				cmd = var_93_1.data1 < 7 and 1 or 2
			})
		elseif var_93_1.id == ActivityConst.SHADOW_PLAY_ID then
			var_93_1.clientData1 = 1

			arg_93_0:showNextActivity(arg_93_1)
		end
	elseif not arg_93_0.viewComponent.activity then
		local var_93_4 = arg_93_0:getDisplayActivity()
		local var_93_5 = arg_93_0.contextData.id or arg_93_0.contextData.type and checkExist(_.detect(var_93_4, function(arg_94_0)
			return arg_94_0:getConfig("type") == arg_93_0.contextData.type
		end), {
			"id"
		}) or 0

		arg_93_0.viewComponent:verifyTabs(var_93_5)
	end
end

return var_0_0
