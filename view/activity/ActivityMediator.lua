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
var_0_0.GO_CHANGE_SHOP = "go Change shop"
var_0_0.GO_Activity_level = "go Activity level"
var_0_0.ON_ADD_SUBLAYER = "ActivityMediator.ON_ADD_SUBLAYER"
var_0_0.GO_SPECIAL_EXERCISE = "go Special exercise"
var_0_0.GO_SINGLE_PRECOMBAT = "ActivityMediator.GO_SINGLE_PRECOMBAT"
var_0_0.ON_BOSSRUSH_MAP = "ActivityMediator.ON_BOSSRUSH_MAP"

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
	arg_1_0:bind(var_0_0.ON_BOSSRUSH_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
	end)
	arg_1_0:bind(var_0_0.GO_DECODE_MINI_GAME, function(arg_7_0)
		pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
			type = MiniGameRequestCommand.REQUEST_HUB_DATA,
			callback = function()
				pg.m02:sendNotification(GAME.GO_MINI_GAME, 11)
			end
		})
	end)
	arg_1_0:bind(var_0_0.GO_MINI_GAME, function(arg_9_0, arg_9_1)
		pg.m02:sendNotification(GAME.GO_MINI_GAME, arg_9_1)
	end)
	arg_1_0:bind(var_0_0.GO_SUBMARINE_RUN, function(arg_10_0, arg_10_1)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SUBMARINE_RUN,
			stageId = arg_10_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_DODGEM, function(arg_11_0)
		local var_11_0 = ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES[math.random(#ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES)]

		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_DODGEM,
			stageId = var_11_0
		})
	end)
	arg_1_0:bind(var_0_0.ON_SIMULATION_COMBAT, function(arg_12_0, arg_12_1, arg_12_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SIMULATION,
			stageId = arg_12_1.stageId,
			warnMsg = arg_12_1.warnMsg,
			exitCallback = arg_12_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_AIRFIGHT_COMBAT, function(arg_13_0, arg_13_1, arg_13_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_AIRFIGHT,
			stageId = arg_13_1.stageId,
			exitCallback = arg_13_2
		})
	end)
	arg_1_0:bind(var_0_0.RETURN_AWARD_OP, function(arg_14_0, arg_14_1)
		if arg_14_1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_AWARD_OVERVIEW then
			arg_1_0.viewComponent:ShowWindow(ReturnerAwardWindow, arg_14_1.arg1)
		elseif arg_14_1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW then
			arg_1_0.viewComponent:ShowWindow(TaskAwardWindow, arg_14_1.arg1)
		else
			arg_1_0:sendNotification(GAME.RETURN_AWARD_OP, arg_14_1)
		end
	end)
	arg_1_0:bind(var_0_0.SHOW_AWARD_WINDOW, function(arg_15_0, arg_15_1, arg_15_2)
		arg_1_0.viewComponent:ShowWindow(arg_15_1, arg_15_2)
	end)
	arg_1_0:bind(var_0_0.EVENT_PT_OPERATION, function(arg_16_0, arg_16_1)
		arg_1_0:sendNotification(GAME.ACT_NEW_PT, arg_16_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_LAYER, function(arg_17_0, arg_17_1)
		arg_1_0:addSubLayers(arg_17_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_RED_PACKET_LAYER, function(arg_18_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = RedPacketMediator,
			viewComponent = RedPacketLayer
		}))
	end)
	arg_1_0:bind(var_0_0.CLOSE_LAYER, function(arg_19_0, arg_19_1)
		local var_19_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(arg_19_1)

		if var_19_0 then
			arg_1_0:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_19_0
			})
		end
	end)
	arg_1_0:bind(var_0_0.EVENT_OPERATION, function(arg_20_0, arg_20_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, arg_20_1)
	end)
	arg_1_0:bind(var_0_0.EVENT_GO_SCENE, function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_1 == SCENE.SUMMER_FEAST then
			pg.NewStoryMgr.GetInstance():Play("TIANHOUYUYI1", function()
				arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
			end)
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, arg_21_1, arg_21_2)
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
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER, function(arg_25_0, arg_25_1)
		if not getProxy(ActivityProxy):getActivityById(arg_25_1.actId) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_25_1 or {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end)
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER_STEEET, function(arg_26_0, arg_26_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_26_1 or {
			warp = NewShopsScene.TYPE_SHOP_STREET
		})
	end)
	arg_1_0:bind(var_0_0.BATTLE_OPERA, function()
		local var_27_0 = getProxy(ChapterProxy)
		local var_27_1, var_27_2 = var_27_0:getLastMapForActivity()

		if not var_27_1 or not var_27_0:getMapById(var_27_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_27_2,
				mapIdx = var_27_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.GO_SPECIAL_EXERCISE, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACT_BOSS_BATTLE)
	end)
	arg_1_0:bind(var_0_0.SPECIAL_BATTLE_OPERA, function()
		local var_29_0 = getProxy(ChapterProxy)
		local var_29_1, var_29_2 = var_29_0:getLastMapForActivity()

		if not var_29_1 or not var_29_0:getMapById(var_29_1):isUnlock() then
			local var_29_3 = getProxy(ChapterProxy)
			local var_29_4 = var_29_3:getActiveChapter()

			var_29_1 = var_29_4 and var_29_4:getConfig("map")

			if not var_29_4 then
				var_29_1 = var_29_3:GetLastNormalMap()
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_29_4 and var_29_4.id,
				mapIdx = var_29_1
			})
		else
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_29_2,
				mapIdx = var_29_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.ON_ADD_SUBLAYER, function(arg_30_0, arg_30_1)
		arg_1_0:addSubLayers(arg_30_1)
	end)
	arg_1_0:bind(var_0_0.GO_LOTTERY, function(arg_31_0)
		local var_31_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

		arg_1_0:addSubLayers(Context.New({
			mediator = LotteryMediator,
			viewComponent = LotteryLayer,
			data = {
				activityId = var_31_0.id
			}
		}))
	end)
	arg_1_0:bind(var_0_0.GO_BACKYARD, function(arg_32_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.COURTYARD)
	end)
	arg_1_0:bind(var_0_0.EVENT_COLORING_ACHIEVE, function(arg_33_0, arg_33_1)
		arg_1_0:sendNotification(GAME.COLORING_ACHIEVE, arg_33_1)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_34_0, arg_34_1, arg_34_2)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_34_1.id, arg_34_2)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT_ONESTEP, function(arg_35_0, arg_35_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK_ONESTEP, {
			resultList = arg_35_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_GO, function(arg_36_0, arg_36_1)
		arg_1_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_36_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_PRAY_POOL, function(arg_37_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT, {
			goToPray = true
		})
	end)
	arg_1_0:bind(var_0_0.FETCH_INSTARGRAM, function(arg_38_0, ...)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_FETCH, ...)
	end)
	arg_1_0:bind(var_0_0.MUSIC_GAME_OPERATOR, function(arg_39_0, ...)
		arg_1_0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
	arg_1_0:bind(var_0_0.SELECT_ACTIVITY, function(arg_40_0, arg_40_1)
		arg_1_0.viewComponent:verifyTabs(arg_40_1)
	end)
	arg_1_0:bind(var_0_0.SHOW_NEXT_ACTIVITY, function(arg_41_0)
		arg_1_0:showNextActivity()
	end)
	arg_1_0:bind(var_0_0.ACTIVITY_PERMANENT, function(arg_42_0, arg_42_1)
		if PlayerPrefs.GetString("permanent_time", "") ~= pg.gameset.permanent_mark.description then
			PlayerPrefs.SetString("permanent_time", pg.gameset.permanent_mark.description)
			arg_1_0.viewComponent:updateEntrances()
		end

		local var_42_0 = getProxy(ActivityPermanentProxy):getDoingActivity()

		if var_42_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_permanent_tips3"))
			arg_1_0.viewComponent:verifyTabs(var_42_0.id)
		else
			arg_1_0:addSubLayers(Context.New({
				mediator = ActivityPermanentMediator,
				viewComponent = ActivityPermanentLayer,
				data = {
					finishId = arg_42_1
				}
			}))
		end
	end)
	arg_1_0:bind(var_0_0.FINISH_ACTIVITY_PERMANENT, function(arg_43_0)
		local var_43_0 = getProxy(ActivityPermanentProxy):getDoingActivity()

		assert(var_43_0:canPermanentFinish(), "error permanent activity finish")
		arg_1_0:sendNotification(GAME.ACTIVITY_PERMANENT_FINISH, {
			activity_id = var_43_0.id
		})
	end)
	arg_1_0:bind(var_0_0.GO_PERFORM_COMBAT, function(arg_44_0, arg_44_1, arg_44_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = arg_44_1.stageId,
			memory = arg_44_1.memory
		})
	end)
	arg_1_0:bind(var_0_0.NEXT_DISPLAY_AWARD, function(arg_45_0, arg_45_1, arg_45_2)
		arg_1_0.nextDisplayAwards = arg_45_1
	end)
	arg_1_0:bind(var_0_0.GO_CARDPUZZLE_COMBAT, function(arg_46_0, arg_46_1)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_CARDPUZZLE,
			combatID = arg_46_1
		})
	end)
	arg_1_0:bind(var_0_0.CHARGE, function(arg_47_0, arg_47_1)
		arg_1_0:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_47_1
		})
	end)
	arg_1_0:bind(var_0_0.BUY_ITEM, function(arg_48_0, arg_48_1, arg_48_2)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_48_1,
			count = arg_48_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_PANEL, function(arg_49_0, arg_49_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemPanelMediator,
			viewComponent = ChargeItemPanelLayer,
			data = {
				panelConfig = arg_49_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_BIRTHDAY, function(arg_50_0, arg_50_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	end)
	arg_1_0:bind(var_0_0.STORE_DATE, function(arg_51_0, arg_51_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_STORE_DATE, {
			activity_id = arg_51_1.actId,
			intValue = arg_51_1.intValue or 0,
			strValue = arg_51_1.strValue or "",
			callback = arg_51_1.callback
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACT_SHOPPING, function(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, {
			activity_id = arg_52_1,
			cmd = arg_52_2,
			arg1 = arg_52_3,
			arg2 = arg_52_4
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVITY_TASK_SUBMIT, function(arg_53_0, arg_53_1)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_53_1.activityId,
			task_ids = {
				arg_53_1.id
			}
		})
	end)
	arg_1_0:bind(var_0_0.GO_SINGLE_PRECOMBAT, function(arg_54_0, arg_54_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = BossSinglePreCombatLiteMediator,
			viewComponent = BossSinglePreCombatLiteLayer,
			data = {
				system = arg_54_1.system,
				stageId = arg_54_1.stageId,
				actId = arg_54_1.activityID,
				fleets = arg_54_1.fleets
			}
		}))
	end)
	arg_1_0.viewComponent:setActivities(arg_1_0:getDisplayActivity())

	local var_1_0 = getProxy(PlayerProxy):getRawData()

	arg_1_0.viewComponent:setPlayer(var_1_0)

	local var_1_1 = getProxy(BayProxy):getShipById(var_1_0.character)

	arg_1_0.viewComponent:setFlagShip(var_1_1)
end

function var_0_0.getDisplayActivity(arg_55_0)
	return getProxy(ActivityProxy):getPanelActivities()
end

function var_0_0.initNotificationHandleDic(arg_56_0)
	arg_56_0.handleDic = {
		[ActivityProxy.ACTIVITY_ADDED] = function(arg_57_0, arg_57_1)
			local var_57_0 = arg_57_1:getBody()

			if var_57_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
				return
			end

			arg_57_0.viewComponent:updateActivity(var_57_0)

			if ActivityConst.AOERLIANG_TASK_ID == var_57_0.id then
				arg_57_0.viewComponent:update_task_list_auto_aoerliang(var_57_0)
			end
		end,
		[ActivityProxy.ACTIVITY_UPDATED] = function(...)
			arg_56_0.handleDic[ActivityProxy.ACTIVITY_ADDED](...)
		end,
		[ActivityProxy.ACTIVITY_DELETED] = function(arg_59_0, arg_59_1)
			local var_59_0 = arg_59_1:getBody()

			arg_59_0.viewComponent:removeActivity(var_59_0)
		end,
		[ActivityProxy.ACTIVITY_OPERATION_DONE] = function(arg_60_0, arg_60_1)
			local var_60_0 = arg_60_1:getBody()

			if ActivityConst.AOERLIANG_TASK_ID == var_60_0 then
				return
			end

			if ActivityConst.HOLOLIVE_MORNING_ID == var_60_0 then
				local var_60_1 = arg_60_0.viewComponent.pageDic[ActivityConst.HOLOLIVE_MORNING_ID]
			end

			arg_60_0:showNextActivity()
		end,
		[ActivityProxy.ACTIVITY_SHOW_AWARDS] = function(arg_61_0, arg_61_1)
			local var_61_0 = arg_61_1:getBody()
			local var_61_1 = var_61_0.awards

			if arg_61_0.nextDisplayAwards and #arg_61_0.nextDisplayAwards > 0 then
				for iter_61_0 = 1, #arg_61_0.nextDisplayAwards do
					table.insert(var_61_1, arg_61_0.nextDisplayAwards[iter_61_0])
				end
			end

			arg_61_0.nextDisplayAwards = {}

			arg_61_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_61_1, var_61_0.callback)
		end,
		[ActivityProxy.ACTIVITY_SHOW_BB_RESULT] = function(arg_62_0, arg_62_1)
			local var_62_0 = arg_62_1:getBody()

			arg_62_0.viewComponent:emit(ActivityMediator.ON_BOBING_RESULT, var_62_0)
		end,
		[ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT] = function(arg_63_0, arg_63_1)
			local var_63_0 = arg_63_1:getBody()
			local var_63_1 = var_63_0.activityID

			arg_63_0.viewComponent.pageDic[var_63_1]:showLotteryAwardResult(var_63_0.awards, var_63_0.number, var_63_0.callback)
		end,
		[ActivityProxy.ACTIVITY_SHOW_SHAKE_BEADS_RESULT] = function(arg_64_0, arg_64_1)
			local var_64_0 = arg_64_1:getBody()

			arg_64_0.viewComponent:emit(ActivityMediator.ON_SHAKE_BEADS_RESULT, var_64_0)
		end,
		[GAME.COLORING_ACHIEVE_DONE] = function(arg_65_0, arg_65_1)
			arg_65_0.viewComponent:playBonusAnim(function()
				local var_66_0 = arg_65_1:getBody()

				arg_65_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_66_0.drops, function()
					arg_65_0.viewComponent:flush_coloring()
				end)
			end)
		end,
		[GAME.SUBMIT_TASK_DONE] = function(arg_68_0, arg_68_1)
			local var_68_0 = arg_68_1:getBody()

			arg_68_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_68_0, function()
				arg_68_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.SUBMIT_ACTIVITY_TASK_DONE] = function(arg_70_0, arg_70_1)
			local var_70_0 = arg_70_1:getBody()

			arg_70_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_70_0.awards, function()
				arg_70_0.viewComponent:checkAutoHideActivity()
				arg_70_0.viewComponent:updateTaskLayers()
				existCall(var_70_0.callback)
			end)
		end,
		[GAME.ACT_NEW_PT_DONE] = function(arg_72_0, arg_72_1)
			local var_72_0 = arg_72_1:getBody()

			arg_72_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_72_0.awards, var_72_0.callback)
		end,
		[GAME.BEGIN_STAGE_DONE] = function(arg_73_0, arg_73_1)
			local var_73_0 = arg_73_1:getBody()

			arg_73_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_73_0)
		end,
		[GAME.RETURN_AWARD_OP_DONE] = function(arg_74_0, arg_74_1)
			local var_74_0 = arg_74_1:getBody()

			arg_74_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_74_0.awards)
		end,
		[VoteProxy.VOTE_ORDER_BOOK_DELETE] = function(arg_75_0, arg_75_1)
			return
		end,
		[VoteProxy.VOTE_ORDER_BOOK_UPDATE] = function(...)
			arg_56_0.handleDic[VoteProxy.VOTE_ORDER_BOOK_DELETE](...)
		end,
		[GAME.REMOVE_LAYERS] = function(arg_77_0, arg_77_1)
			if arg_77_1:getBody().context.mediator == VoteFameHallMediator then
				arg_77_0.viewComponent:updateEntrances()
			end

			arg_77_0.viewComponent:removeLayers()
		end,
		[GAME.MONOPOLY_AWARD_DONE] = function(arg_78_0, arg_78_1)
			local var_78_0 = arg_78_1:getBody()
			local var_78_1 = arg_78_0.viewComponent.pageDic[arg_78_0.viewComponent.activity.id]

			if var_78_1 and var_78_1.activity:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MONOPOLY and var_78_1.onAward then
				var_78_1:onAward(var_78_0.awards, var_78_0.callback)
			elseif var_78_0.autoFlag then
				arg_78_0.viewComponent:emit(BaseUI.ON_ACHIEVE_AUTO, var_78_0.awards, 1, var_78_0.callback)
			else
				arg_78_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_78_0.awards, var_78_0.callback)
			end
		end,
		[GAME.SEND_MINI_GAME_OP_DONE] = function(arg_79_0, arg_79_1)
			local var_79_0 = arg_79_1:getBody()
			local var_79_1 = {
				function(arg_80_0)
					local var_80_0 = var_79_0.awards

					if #var_80_0 > 0 then
						if arg_79_0.viewComponent then
							arg_79_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_80_0, arg_80_0)
						else
							arg_79_0:emit(BaseUI.ON_ACHIEVE, var_80_0, arg_80_0)
						end
					else
						arg_80_0()
					end
				end
			}

			seriesAsync(var_79_1, function()
				arg_79_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.ACTIVITY_PERMANENT_START_DONE] = function(arg_82_0, arg_82_1)
			local var_82_0 = arg_82_1:getBody()

			arg_82_0.viewComponent:verifyTabs(var_82_0.id)
		end,
		[GAME.ACTIVITY_PERMANENT_FINISH_DONE] = function(arg_83_0, arg_83_1)
			local var_83_0 = arg_83_1:getBody()

			arg_83_0.viewComponent:emit(ActivityMediator.ACTIVITY_PERMANENT, var_83_0.activity_id)
		end,
		[GAME.MEMORYBOOK_UNLOCK_AWARD_DONE] = function(arg_84_0, arg_84_1)
			local var_84_0 = arg_84_1:getBody()

			arg_84_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_84_0.awards)
		end,
		[GAME.LOAD_LAYERS] = function(arg_85_0, arg_85_1)
			local var_85_0 = arg_85_1:getBody()

			arg_85_0.viewComponent:loadLayers()
		end,
		[GAME.CHARGE_SUCCESS] = function(arg_86_0, arg_86_1)
			local var_86_0 = arg_86_1:getBody()

			arg_86_0.viewComponent:updateTaskLayers()

			local var_86_1 = Goods.Create({
				shop_id = var_86_0.shopId
			}, Goods.TYPE_CHARGE)

			arg_86_0.viewComponent:OnChargeSuccess(var_86_1)
		end,
		[GAME.SHOPPING_DONE] = function(arg_87_0, arg_87_1)
			local var_87_0 = arg_87_1:getBody()

			arg_87_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_87_0.awards, function()
				arg_87_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.ACT_MANUAL_SIGN_DONE] = function(arg_89_0, arg_89_1)
			local var_89_0 = arg_89_1:getBody()

			arg_89_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_89_0.awards)
		end,
		[ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS] = function(arg_90_0, arg_90_1)
			local var_90_0 = arg_90_1:getBody()

			arg_90_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_90_0.awards, function()
				local var_91_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE)

				if var_91_0 and not var_91_0:isShow() and var_91_0:isCorePage(arg_90_0.contextData.coreName) then
					arg_90_0.viewComponent:removeActivity(var_91_0.id)
				end

				arg_90_0.viewComponent:updateTaskLayers()
				existCall(var_90_0.callback)
			end)
		end
	}
end

function var_0_0.showNextActivity(arg_92_0)
	local var_92_0 = getProxy(ActivityProxy)

	if not var_92_0 then
		return
	end

	local var_92_1 = var_92_0:findNextAutoActivity()

	if var_92_1 then
		if var_92_1.id == ActivityConst.BLACK_FRIDAY_SIGNIN_ACT_ID then
			arg_92_0.contextData.showByNextAct = true

			arg_92_0.viewComponent:verifyTabs(ActivityConst.BLACK_FRIDAY_ACT_ID)
		else
			arg_92_0.viewComponent:verifyTabs(var_92_1.id)
		end

		local var_92_2 = var_92_1:getConfig("type")

		if var_92_2 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
			arg_92_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = var_92_1.id
			})
		elseif var_92_2 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
			local var_92_3 = var_92_1:getSpecialData("reMonthSignDay") ~= nil and 3 or 1

			arg_92_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = var_92_1.id,
				cmd = var_92_3,
				arg1 = var_92_1:getSpecialData("reMonthSignDay")
			})
		elseif var_92_2 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
			arg_92_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = var_92_1.id,
				cmd = var_92_1.data1 < 7 and 1 or 2
			})
		elseif var_92_1.id == ActivityConst.SHADOW_PLAY_ID then
			var_92_1.clientData1 = 1

			arg_92_0:showNextActivity()
		end
	elseif not arg_92_0.viewComponent.activity then
		local var_92_4 = var_92_0:getPanelActivities()
		local var_92_5 = arg_92_0.contextData.id or arg_92_0.contextData.type and checkExist(_.detect(var_92_4, function(arg_93_0)
			return arg_93_0:getConfig("type") == arg_92_0.contextData.type
		end), {
			"id"
		}) or 0

		arg_92_0.viewComponent:verifyTabs(var_92_5)
	end
end

return var_0_0
