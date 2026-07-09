local var_0_0 = class("LevelMediator2", import("..base.ContextMediator"))

var_0_0.ON_TRACKING = "LevelMediator2:ON_TRACKING"
var_0_0.ON_ELITE_TRACKING = "LevelMediator2:ON_ELITE_TRACKING"
var_0_0.ON_RETRACKING = "LevelMediator2:ON_RETRACKING"
var_0_0.ON_UPDATE_CUSTOM_FLEET = "LevelMediator2:ON_UPDATE_CUSTOM_FLEET"
var_0_0.ON_OP = "LevelMediator2:ON_OP"
var_0_0.ON_RESUME_SUBSTATE = "LevelMediator2:ON_RESUME_SUBSTATE"
var_0_0.ON_STAGE = "LevelMediator2:ON_STAGE"
var_0_0.ON_GO_TO_TASK_SCENE = "LevelMediator2:ON_GO_TO_TASK_SCENE"
var_0_0.ON_OPEN_EVENT_SCENE = "LevelMediator2:ON_OPEN_EVENT_SCENE"
var_0_0.ON_DAILY_LEVEL = "LevelMediator2:ON_DAILY_LEVEL"
var_0_0.ON_OPEN_MILITARYEXERCISE = "LevelMediator2:ON_OPEN_MILLITARYEXERCISE"
var_0_0.ON_OVERRIDE_CHAPTER = "LevelMediator2:ON_OVERRIDE_CHAPTER"
var_0_0.ON_TIME_UP = "LevelMediator2:ON_TIME_UP"
var_0_0.UPDATE_EVENT_LIST = "LevelMediator2:UPDATE_EVENT_LIST"
var_0_0.ON_START = "ON_START"
var_0_0.ON_ENTER_MAINLEVEL = "LevelMediator2:ON_ENTER_MAINLEVEL"
var_0_0.ON_DIDENTER = "LevelMediator2:ON_DIDENTER"
var_0_0.ON_PERFORM_COMBAT = "LevelMediator2.ON_PERFORM_COMBAT"
var_0_0.ON_SUPPORT_SUBMARINE = "LevelMediator2.ON_SUPPORT_SUBMARINE"
var_0_0.ON_ELITE_OEPN_DECK = "LevelMediator2:ON_ELITE_OEPN_DECK"
var_0_0.ON_ELITE_CLEAR = "LevelMediator2:ON_ELITE_CLEAR"
var_0_0.ON_ELITE_RECOMMEND = "LevelMediator2:ON_ELITE_RECOMMEND"
var_0_0.ON_ELITE_ADJUSTMENT = "LevelMediator2:ON_ELITE_ADJUSTMENT"
var_0_0.ON_SUPPORT_OPEN_DECK = "LevelMediator2:ON_SUPPORT_OPEN_DECK"
var_0_0.ON_ACTIVITY_MAP = "LevelMediator2:ON_ACTIVITY_MAP"
var_0_0.GO_ACT_SHOP = "LevelMediator2:GO_ACT_SHOP"
var_0_0.ON_SWITCH_NORMAL_MAP = "LevelMediator2:ON_SWITCH_NORMAL_MAP"
var_0_0.NOTICE_AUTOBOT_ENABLED = "LevelMediator2:NOTICE_AUTOBOT_ENABLED"
var_0_0.ON_EXTRA_RANK = "LevelMediator2:ON_EXTRA_RANK"
var_0_0.ON_STRATEGYING_CHAPTER = "LevelMediator2:ON_STRATEGYING_CHAPTER"
var_0_0.ON_SELECT_COMMANDER = "LevelMediator2:ON_SELECT_COMMANDER"
var_0_0.ON_SELECT_ELITE_COMMANDER = "LevelMediator2:ON_SELECT_ELITE_COMMANDER"
var_0_0.ON_COMMANDER_SKILL = "LevelMediator2:ON_COMMANDER_SKILL"
var_0_0.ON_SHIP_DETAIL = "LevelMediator2:ON_SHIP_DETAIL"
var_0_0.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN = "LevelMediator2:ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN"
var_0_0.GET_REMASTER_TICKETS_DONE = "LevelMediator2:GET_REMASTER_TICKETS_DONE"
var_0_0.ON_FLEET_SHIPINFO = "LevelMediator2:ON_FLEET_SHIPINFO"
var_0_0.ON_STAGE_SHIPINFO = "LevelMediator2:ON_STAGE_SHIPINFO"
var_0_0.ON_SUPPORT_SHIPINFO = "LevelMediator2:ON_SUPPORT_SHIPINFO"
var_0_0.ON_COMMANDER_OP = "LevelMediator2:ON_COMMANDER_OP"
var_0_0.CLICK_CHALLENGE_BTN = "LevelMediator2:CLICK_CHALLENGE_BTN"
var_0_0.ON_SUBMIT_TASK = "LevelMediator2:ON_SUBMIT_TASK"
var_0_0.ON_VOTE_BOOK = "LevelMediator2:ON_VOTE_BOOK"
var_0_0.GET_CHAPTER_DROP_SHIP_LIST = "LevelMediator2:GET_CHAPTER_DROP_SHIP_LIST"
var_0_0.ON_CHAPTER_REMASTER_AWARD = "LevelMediator2:ON_CHAPTER_REMASTER_AWARD"
var_0_0.ON_BOSSRUSH_REMASTER_ACTIVITY = "LevelMediator2:ON_BOSSRUSH_REMASTER_ACTIVITY"
var_0_0.ENTER_WORLD = "LevelMediator2:ENTER_WORLD"
var_0_0.ON_OPEN_ACT_BOSS_BATTLE = "LevelMediator2:ON_OPEN_ACT_BOSS_BATTLE"
var_0_0.ON_BOSSRUSH_MAP = "LevelMediator2:ON_BOSSRUSH_MAP"
var_0_0.SHOW_ATELIER_BUFF = "LevelMediator2:SHOW_ATELIER_BUFF"
var_0_0.ON_SPITEM_CHANGED = "LevelMediator2:ON_SPITEM_CHANGED"
var_0_0.ON_BOSSSINGLE_MAP = "LevelMediator2:ON_BOSSSINGLE_MAP"
var_0_0.ON_CLUE_MAP = "LevelMediator2:ON_CLUE_MAP"
var_0_0.ON_COLLAB_BOSSRUSH_MAP = "LevelMediator2:ON_COLLAB_BOSSRUSH_MAP"
var_0_0.ON_UPDATE_LOWPRIORITY_TASK = "LevelMediator2:ON_UPDATE_LOWPRIORITY_TASK"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(PlayerProxy)

	arg_1_0:bind(var_0_0.GET_CHAPTER_DROP_SHIP_LIST, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.GET_CHAPTER_DROP_SHIP_LIST, {
			chapterId = arg_2_1,
			callback = arg_2_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_VOTE_BOOK, function(arg_3_0, arg_3_1)
		return
	end)
	arg_1_0:bind(var_0_0.ON_COMMANDER_OP, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0.contextData.commanderOPChapter = arg_4_2

		arg_1_0:sendNotification(GAME.COMMANDER_FORMATION_OP, {
			data = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SELECT_COMMANDER, function(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
		FormationMediator.onSelectCommander(arg_5_1, arg_5_2)

		arg_1_0.contextData.selectedChapterVO = arg_5_3
	end)
	arg_1_0:bind(var_0_0.ON_SELECT_ELITE_COMMANDER, function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		local var_6_0 = getProxy(ChapterProxy)
		local var_6_1 = arg_6_3.id

		arg_1_0.contextData.editEliteChapter = var_6_1

		local var_6_2 = arg_6_3:getEliteFleetCommanders()[arg_6_1] or {}
		local var_6_3

		if var_6_2[arg_6_2] then
			var_6_3 = getProxy(CommanderProxy):getCommanderById(var_6_2[arg_6_2])
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDERCAT, {
			maxCount = 1,
			mode = CommanderCatScene.MODE_SELECT,
			activeCommander = var_6_3,
			ignoredIds = {},
			fleetType = CommanderCatScene.FLEET_TYPE_HARD_CHAPTER,
			chapterId = var_6_1,
			onCommander = function(arg_7_0)
				return true
			end,
			onSelected = function(arg_8_0, arg_8_1)
				local var_8_0 = arg_8_0[1]

				arg_1_0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
					chapterId = var_6_1,
					index = arg_6_1,
					pos = arg_6_2,
					commanderId = var_8_0,
					callback = function()
						arg_8_1()
					end
				})
			end,
			onQuit = function(arg_10_0)
				arg_1_0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
					commanderId = 0,
					chapterId = var_6_1,
					index = arg_6_1,
					pos = arg_6_2,
					callback = function()
						arg_10_0()
					end
				})
			end
		})
	end)
	arg_1_0:RegisterTrackEvent()
	arg_1_0:bind(var_0_0.ON_UPDATE_CUSTOM_FLEET, function(arg_12_0, arg_12_1)
		arg_1_0:sendNotification(GAME.UPDATE_CUSTOM_FLEET, {
			chapterId = arg_12_1.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_OP, function(arg_13_0, arg_13_1)
		arg_1_0:sendNotification(GAME.CHAPTER_OP, arg_13_1)
	end)
	arg_1_0:bind(var_0_0.ON_SWITCH_NORMAL_MAP, function(arg_14_0)
		local var_14_0 = getProxy(ChapterProxy):GetLastNormalMap()

		if var_14_0 then
			arg_1_0.viewComponent:setMap(var_14_0)
		end
	end)
	arg_1_0:bind(var_0_0.ON_RESUME_SUBSTATE, function(arg_15_0, arg_15_1)
		arg_1_0:loadSubState(arg_15_1)
	end)
	arg_1_0:bind(var_0_0.ON_STAGE, function(arg_16_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChapterPreCombatMediator,
			viewComponent = ChapterPreCombatLayer
		}), false)
	end)
	arg_1_0:bind(var_0_0.ON_OPEN_MILITARYEXERCISE, function()
		if getProxy(ActivityProxy):getMilitaryExerciseActivity() then
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.MILITARYEXERCISE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_notStartOrEnd"))
		end
	end)
	arg_1_0:bind(var_0_0.CLICK_CHALLENGE_BTN, function(arg_18_0)
		if LOCK_LIMIT_CHALLENGE then
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CHALLENGE_MAIN_SCENE)
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.LIMIT_CHALLENGE)
		end
	end)
	arg_1_0:bind(var_0_0.ON_DAILY_LEVEL, function(arg_19_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
	end)
	arg_1_0:bind(var_0_0.ON_GO_TO_TASK_SCENE, function(arg_20_0, arg_20_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.TASK, arg_20_1)
	end)
	arg_1_0:bind(var_0_0.ON_OPEN_EVENT_SCENE, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	arg_1_0:bind(var_0_0.ON_OVERRIDE_CHAPTER, function()
		local var_22_0 = arg_1_0.contextData.chapterVO

		getProxy(ChapterProxy):updateChapter(var_22_0)
	end)
	arg_1_0:bind(var_0_0.ON_TIME_UP, function()
		arg_1_0:onTimeUp()
	end)
	arg_1_0:bind(var_0_0.UPDATE_EVENT_LIST, function()
		arg_1_0.viewComponent:addbubbleMsgBox(function(arg_25_0)
			arg_1_0:OnEventUpdate(arg_25_0)
		end)

		local var_24_0 = getProxy(ChapterProxy):getActiveChapter(true)

		if var_24_0 and var_24_0:IsAutoFight() then
			local var_24_1 = pg.GuildMsgBoxMgr.GetInstance()

			if var_24_1:GetShouldShowBattleTip() then
				local var_24_2 = getProxy(GuildProxy):getRawData()
				local var_24_3 = var_24_2 and var_24_2:getWeeklyTask()

				if var_24_3 and var_24_3.id ~= 0 then
					getProxy(ChapterProxy):AddExtendChapterDataTable(var_24_0.id, "ListGuildEventNotify", var_24_3:GetPresonTaskId(), var_24_3:GetPrivateTaskName())
					pg.GuildMsgBoxMgr.GetInstance():CancelShouldShowBattleTip()
				end

				var_24_1:SubmitTask(function(arg_26_0, arg_26_1, arg_26_2)
					if arg_26_0 then
						local var_26_0 = pg.task_data_template[arg_26_2].desc

						getProxy(ChapterProxy):AddExtendChapterDataTable(var_24_0.id, "ListGuildEventAutoReceiveNotify", arg_26_2, var_26_0)
					end
				end)
			end
		else
			arg_1_0.viewComponent:addbubbleMsgBox(function(arg_27_0)
				pg.GuildMsgBoxMgr.GetInstance():NotificationForBattle(arg_27_0)
			end)
		end
	end)
	arg_1_0:bind(var_0_0.ON_ELITE_CLEAR, function(arg_28_0, arg_28_1)
		local var_28_0 = arg_28_1.index
		local var_28_1 = arg_28_1.chapterVO

		var_28_1:clearEliterFleetByIndex(var_28_0)

		local var_28_2 = getProxy(ChapterProxy)

		var_28_2:updateChapter(var_28_1)
		var_28_2:duplicateEliteFleet(var_28_1)
		arg_1_0.viewComponent:RefreshFleetSelectView(var_28_1)
	end)
	arg_1_0:bind(var_0_0.NOTICE_AUTOBOT_ENABLED, function(arg_29_0, arg_29_1)
		arg_1_0:sendNotification(GAME.COMMON_FLAG, {
			flagID = BATTLE_AUTO_ENABLED
		})
	end)
	arg_1_0:bind(var_0_0.ON_ELITE_RECOMMEND, function(arg_30_0, arg_30_1)
		local var_30_0 = arg_30_1.index
		local var_30_1 = arg_30_1.chapterVO
		local var_30_2 = getProxy(ChapterProxy)

		var_30_2:eliteFleetRecommend(var_30_1, var_30_0)
		var_30_2:updateChapter(var_30_1)
		var_30_2:duplicateEliteFleet(var_30_1)
		arg_1_0.viewComponent:RefreshFleetSelectView(var_30_1)
	end)
	arg_1_0:bind(var_0_0.ON_ELITE_ADJUSTMENT, function(arg_31_0, arg_31_1)
		local var_31_0 = getProxy(ChapterProxy)

		var_31_0:updateChapter(arg_31_1)
		var_31_0:duplicateEliteFleet(arg_31_1)
	end)
	arg_1_0:bind(var_0_0.ON_ELITE_OEPN_DECK, function(arg_32_0, arg_32_1)
		local var_32_0 = arg_32_1.shipType
		local var_32_1 = arg_32_1.fleetIndex
		local var_32_2 = arg_32_1.shipVO
		local var_32_3 = arg_32_1.fleet
		local var_32_4 = arg_32_1.chapter
		local var_32_5 = arg_32_1.teamType
		local var_32_6 = getProxy(BayProxy):getRawData()
		local var_32_7 = {}

		for iter_32_0, iter_32_1 in pairs(var_32_6) do
			if not ShipType.ContainInLimitBundle(var_32_0, iter_32_1:getShipType()) then
				table.insert(var_32_7, iter_32_0)
			end
		end

		arg_1_0.contextData.editEliteChapter = var_32_4.id

		local var_32_8 = {}

		for iter_32_2, iter_32_3 in pairs(var_32_3) do
			table.insert(var_32_8, iter_32_2.id)
		end

		local var_32_9, var_32_10, var_32_11 = arg_1_0:getDockCallbackFuncs(var_32_3, var_32_2, var_32_4, var_32_1)

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1,
			useBlackBlock = true,
			selectedMin = 0,
			energyDisplay = true,
			ignoredIds = var_32_7,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = var_32_2 ~= nil,
			teamFilter = var_32_5,
			leftTopInfo = i18n("word_formation"),
			onShip = var_32_9,
			confirmSelect = var_32_10,
			onSelected = var_32_11,
			hideTagFlags = setmetatable({
				inElite = var_32_4:getConfig("formation")
			}, {
				__index = ShipStatus.TAG_HIDE_LEVEL
			}),
			otherSelectedIds = var_32_8
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUPPORT_OPEN_DECK, function(arg_33_0, arg_33_1)
		local var_33_0 = arg_33_1.shipType
		local var_33_1 = arg_33_1.shipVO
		local var_33_2 = arg_33_1.fleet
		local var_33_3 = arg_33_1.chapter
		local var_33_4 = arg_33_1.teamType
		local var_33_5 = getProxy(BayProxy):getRawData()
		local var_33_6 = {}

		for iter_33_0, iter_33_1 in pairs(var_33_5) do
			if not ShipType.ContainInLimitBundle(var_33_0, iter_33_1:getShipType()) then
				table.insert(var_33_6, iter_33_0)
			end
		end

		local var_33_7 = {}

		for iter_33_2, iter_33_3 in pairs(var_33_2) do
			table.insert(var_33_7, iter_33_2.id)
		end

		local var_33_8, var_33_9, var_33_10 = arg_1_0:getSupportDockCallbackFuncs(var_33_2, var_33_1, var_33_3)

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1,
			useBlackBlock = true,
			selectedMin = 0,
			energyDisplay = true,
			ignoredIds = var_33_6,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = var_33_1 ~= nil,
			teamFilter = var_33_4,
			leftTopInfo = i18n("word_formation"),
			onShip = var_33_8,
			confirmSelect = var_33_9,
			onSelected = var_33_10,
			hideTagFlags = setmetatable({
				inSupport = var_33_3:getConfig("formation")
			}, {
				__index = ShipStatus.TAG_HIDE_SUPPORT
			}),
			otherSelectedIds = var_33_7
		})

		arg_1_0.contextData.selectedChapterVO = var_33_3
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVITY_MAP, function(arg_34_0, arg_34_1)
		local var_34_0 = getProxy(ChapterProxy)
		local var_34_1, var_34_2 = var_34_0:getLastMapForActivity(arg_34_1)

		if not var_34_1 or not var_34_0:getMapById(var_34_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0.viewComponent:ShowSelectedMap(var_34_1, function()
			if var_34_2 then
				local var_35_0 = var_34_0:getChapterById(var_34_2)

				arg_1_0.viewComponent:switchToChapter(var_35_0)
			end
		end)
	end)
	arg_1_0:bind(var_0_0.ON_BOSSRUSH_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
	end)
	arg_1_0:bind(var_0_0.ON_BOSSSINGLE_MAP, function(arg_37_0, arg_37_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.OTHERWORLD_MAP, arg_37_1)
	end)
	arg_1_0:bind(var_0_0.ON_CLUE_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CLUE_MAP)
	end)
	arg_1_0:bind(var_0_0.ON_COLLAB_BOSSRUSH_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_DAL_COLLAB)
	end)
	arg_1_0:bind(var_0_0.GO_ACT_SHOP, function()
		local var_40_0 = arg_1_0.contextData.map and arg_1_0.contextData.map:getConfig("on_activity") or nil
		local var_40_1 = var_40_0 and var_40_0 ~= 0 and getProxy(ActivityProxy):getActivityById(var_40_0)
		local var_40_2 = var_40_1 and not var_40_1:isEnd() and var_40_1:GetConfigClientSetting("PTID")
		local var_40_3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

		if var_40_3 and var_40_3:getConfig("config_client").resId == var_40_2 and not var_40_3:isEnd() then
			arg_1_0:addSubLayers(Context.New({
				mediator = LotteryMediator,
				viewComponent = LotteryLayer,
				data = {
					activityId = var_40_3.id
				}
			}), false)
		else
			local var_40_4 = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_41_0)
				return arg_41_0:getConfig("config_client").pt_id == var_40_2
			end)
			local var_40_5 = var_40_4 and var_40_4.id

			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = var_40_5
			})
		end
	end)
	arg_1_0:bind(var_0_0.SHOW_ATELIER_BUFF, function(arg_42_0, arg_42_1)
		if arg_42_1 then
			arg_1_0:addSubLayers(Context.New({
				mediator = AterialYumiaCoreBuffMediator,
				viewComponent = AterialYumiaCoreBuffLayer
			}))
		else
			arg_1_0:addSubLayers(Context.New({
				mediator = AtelierBuffMediator,
				viewComponent = AtelierBuffLayer
			}))
		end
	end)
	arg_1_0:bind(var_0_0.ON_SHIP_DETAIL, function(arg_43_0, arg_43_1)
		arg_1_0.contextData.selectedChapterVO = arg_43_1.chapter

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_43_1.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_FLEET_SHIPINFO, function(arg_44_0, arg_44_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_44_1.shipId,
			shipVOs = arg_44_1.shipVOs
		})

		arg_1_0.contextData.editEliteChapter = arg_44_1.chapter.id
	end)
	arg_1_0:bind(var_0_0.ON_SUPPORT_SHIPINFO, function(arg_45_0, arg_45_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_45_1.shipId,
			shipVOs = arg_45_1.shipVOs
		})

		arg_1_0.contextData.selectedChapterVO = arg_45_1.chapter
	end)
	arg_1_0:bind(var_0_0.ON_STAGE_SHIPINFO, function(arg_46_0, arg_46_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_46_1.shipId,
			shipVOs = arg_46_1.shipVOs
		})
	end)
	arg_1_0:bind(var_0_0.ON_EXTRA_RANK, function(arg_47_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_EXTRA_CHAPTER
		})
	end)
	arg_1_0:bind(var_0_0.ON_STRATEGYING_CHAPTER, function(arg_48_0)
		local var_48_0 = getProxy(ChapterProxy)
		local var_48_1 = var_48_0:getActiveChapter()

		assert(var_48_1)

		local var_48_2 = var_48_0:getMapById(var_48_1:getConfig("map"))

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_forward",
			content = i18n("levelScene_chapter_is_activation", string.split(var_48_2:getConfig("name"), "|")[1] .. ":" .. var_48_1:getConfig("chapter_name")),
			onYes = function()
				arg_1_0.viewComponent:switchToChapter(var_48_1)
			end,
			onNo = function()
				arg_1_0.contextData.chapterVO = var_48_1

				arg_1_0.viewComponent:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat,
					exittype = ChapterConst.ExitFromMap
				})
			end,
			onClose = function()
				return
			end,
			noBtnType = pg.MsgboxMgr.BUTTON_RETREAT
		})
	end)
	arg_1_0:bind(var_0_0.ON_COMMANDER_SKILL, function(arg_52_0, arg_52_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = arg_52_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_PERFORM_COMBAT, function(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = arg_53_1,
			exitCallback = arg_53_2,
			memory = arg_53_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUPPORT_SUBMARINE, function(arg_54_0)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SCENARIO_SUB_STRIKE
		})
	end)
	arg_1_0:bind(var_0_0.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN, function(arg_55_0)
		arg_1_0:sendNotification(GAME.GET_REMASTER_TICKETS)
	end)
	arg_1_0:bind(var_0_0.ON_BOSSRUSH_REMASTER_ACTIVITY, function(arg_56_0, arg_56_1)
		arg_1_0.bossRushRemasterActivityId = arg_56_1

		arg_1_0:sendNotification(GAME.ACTIVITY_PERMANENT_START, {
			activity_id = arg_56_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_TASK, function(arg_57_0, arg_57_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_57_1)
	end)
	arg_1_0:bind(var_0_0.ON_START, function(arg_58_0)
		local var_58_0 = getProxy(ChapterProxy):getActiveChapter()

		assert(var_58_0)

		local var_58_1 = var_58_0.fleet
		local var_58_2 = var_58_0:getStageId(var_58_1.line.row, var_58_1.line.column)

		seriesAsync({
			function(arg_59_0)
				local var_59_0 = {}

				for iter_59_0, iter_59_1 in pairs(var_58_1.ships) do
					table.insert(var_59_0, iter_59_1)
				end

				Fleet.EnergyCheck(var_59_0, var_58_1.name, function(arg_60_0)
					if arg_60_0 then
						arg_59_0()
					end
				end, function(arg_61_0)
					if not arg_61_0 then
						getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.SHIP_ENERGY_LOW)
					end
				end)
			end,
			function(arg_62_0)
				if getProxy(PlayerProxy):getRawData():GoldMax(1) then
					local var_62_0 = i18n("gold_max_tip_title") .. i18n("resource_max_tip_battle")

					getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.GOLD_MAX)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = var_62_0,
						onYes = arg_62_0
					})
				else
					arg_62_0()
				end
			end,
			function(arg_63_0)
				arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
					system = SYSTEM_SCENARIO,
					stageId = var_58_2
				})
			end
		})
	end)
	arg_1_0:bind(arg_1_0.ON_ENTER_MAINLEVEL, function(arg_64_0, arg_64_1)
		arg_1_0:DidEnterLevelMainUI(arg_64_1)
	end)
	arg_1_0:bind(arg_1_0.ON_DIDENTER, function(arg_65_0)
		arg_1_0.viewComponent:emit(LevelMediator2.UPDATE_EVENT_LIST)
	end)
	arg_1_0:bind(var_0_0.ENTER_WORLD, function(arg_66_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD)
	end)
	arg_1_0:bind(var_0_0.ON_CHAPTER_REMASTER_AWARD, function(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
		arg_1_0:sendNotification(GAME.CHAPTER_REMASTER_AWARD_RECEIVE, {
			chapterId = arg_67_1,
			pos = arg_67_2,
			actId = arg_67_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_OPEN_ACT_BOSS_BATTLE, function(arg_68_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACT_BOSS_BATTLE, {
			showAni = true
		})
	end)
	arg_1_0:bind(LevelUIConst.OPEN_NORMAL_CONTINUOUS_WINDOW, function(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4)
		local var_69_0 = _.map(arg_69_2, function(arg_70_0)
			local var_70_0 = getProxy(FleetProxy):getFleetById(arg_70_0)

			if not var_70_0 or var_70_0:getFleetType() == FleetType.Submarine then
				return
			end

			return var_70_0
		end)

		arg_1_0:DisplayContinuousWindow(arg_69_1, var_69_0, arg_69_3, arg_69_4)
	end)
	arg_1_0:bind(LevelUIConst.OPEN_ELITE_CONTINUOUS_WINDOW, function(arg_71_0, arg_71_1, arg_71_2, arg_71_3)
		local var_71_0 = arg_71_1:getEliteFleetList()
		local var_71_1 = getProxy(BayProxy):getRawData()
		local var_71_2 = _.map(var_71_0, function(arg_72_0)
			if #arg_72_0 == 0 or _.any(arg_72_0, function(arg_73_0)
				local var_73_0 = var_71_1[arg_73_0]

				return var_73_0 and var_73_0:getTeamType() == TeamType.Submarine
			end) then
				return
			end

			return TypedFleet.New({
				fleetType = FleetType.Normal,
				ship_list = arg_72_0
			})
		end)

		arg_1_0:DisplayContinuousWindow(arg_71_1, var_71_2, arg_71_2, arg_71_3)
	end)
	arg_1_0:bind(var_0_0.ON_UPDATE_LOWPRIORITY_TASK, function(arg_74_0, arg_74_1, arg_74_2)
		arg_1_0:sendNotification(GAME.UPDATE_LOW_PRIORITY_TASK_PROGRESS, {
			taskId = arg_74_1
		})
	end)

	arg_1_0.player = var_1_0:getData()

	arg_1_0.viewComponent:updateRes(arg_1_0.player)

	local var_1_1 = getProxy(EventProxy)

	arg_1_0.viewComponent:updateEvent(var_1_1)

	local var_1_2 = getProxy(FleetProxy):GetRegularFleets()

	arg_1_0.viewComponent:updateFleet(var_1_2)

	local var_1_3 = getProxy(BayProxy)

	arg_1_0.viewComponent:setShips(var_1_3:getRawData())

	local var_1_4 = getProxy(ActivityProxy)

	arg_1_0.viewComponent:updateVoteBookBtn()

	local var_1_5 = getProxy(CommanderProxy):getPrefabFleet()

	arg_1_0.viewComponent:setCommanderPrefabs(var_1_5)

	local var_1_6 = getProxy(DailyLevelProxy)

	arg_1_0.viewComponent:setEliteQuota(var_1_6.eliteCount, pg.gameset.elite_quota.key_value)
	getProxy(ChapterProxy):updateActiveChapterShips()

	local var_1_7 = getProxy(BagProxy):getItemsByType(Item.SPECIAL_OPERATION_TICKET)

	arg_1_0.viewComponent:setSpecialOperationTickets(var_1_7)
end

function var_0_0.DidEnterLevelMainUI(arg_75_0, arg_75_1)
	arg_75_0.viewComponent:setMap(arg_75_1)

	if arg_75_0.contextData.openChapterId then
		local var_75_0 = arg_75_0.contextData.openChapterId

		arg_75_0.viewComponent.mapBuilder:ActionInvoke("TryOpenChapter", var_75_0)

		arg_75_0.contextData.openChapterId = nil
	end

	local var_75_1 = arg_75_0.contextData.chapterVO

	if var_75_1 and var_75_1.active then
		arg_75_0.viewComponent:switchToChapter(var_75_1)
	elseif arg_75_0.contextData.map:isSkirmish() then
		arg_75_0.viewComponent:ShowCurtains(true)
		arg_75_0.viewComponent:doPlayAnim("TV01", function(arg_76_0)
			go(arg_76_0):SetActive(false)
			arg_75_0.viewComponent:ShowCurtains(false)
		end)
	end

	if arg_75_0.contextData.preparedTaskList and #arg_75_0.contextData.preparedTaskList > 0 then
		for iter_75_0, iter_75_1 in ipairs(arg_75_0.contextData.preparedTaskList) do
			arg_75_0:sendNotification(GAME.SUBMIT_TASK, iter_75_1)
		end

		table.clean(arg_75_0.contextData.preparedTaskList)
	end

	if arg_75_0.contextData.StopAutoFightFlag then
		local var_75_2 = getProxy(ChapterProxy)
		local var_75_3 = var_75_2:getActiveChapter()

		if var_75_3 then
			var_75_2:SetChapterAutoFlag(var_75_3.id, false)

			local var_75_4 = bit.bor(ChapterConst.DirtyAttachment, ChapterConst.DirtyStrategy)

			arg_75_0.viewComponent:updateChapterVO(var_75_3, var_75_4)
		end

		arg_75_0.contextData.StopAutoFightFlag = nil
	end

	arg_75_0:TryEnterPendingChapter()
end

function var_0_0.TryEnterPendingChapter(arg_77_0)
	local var_77_0 = arg_77_0.contextData.pendingEnterChapterId

	if not var_77_0 then
		return
	end

	if not arg_77_0.contextData.map or not arg_77_0.viewComponent.mapBuilder then
		return
	end

	if arg_77_0.contextData.chapterVO and arg_77_0.contextData.chapterVO.id == var_77_0 then
		arg_77_0.contextData.pendingEnterChapterId = nil

		return
	end

	local var_77_1 = getProxy(ChapterProxy):getChapterById(var_77_0)

	if not var_77_1 or not var_77_1.active then
		return
	end

	arg_77_0.contextData.pendingEnterChapterId = nil
	arg_77_0.waitingTracking = nil

	arg_77_0.viewComponent:resetLevelGrid()

	arg_77_0.viewComponent.FirstEnterChapter = var_77_1.id

	arg_77_0.viewComponent:switchToChapter(var_77_1)
end

function var_0_0.RegisterTrackEvent(arg_78_0)
	arg_78_0:bind(var_0_0.ON_TRACKING, function(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4, arg_79_5)
		local var_79_0 = getProxy(ChapterProxy):getChapterById(arg_79_1, true)
		local var_79_1 = getProxy(ChapterProxy):GetLastFleetIndex()

		arg_78_0:sendNotification(GAME.TRACKING, {
			chapterId = arg_79_1,
			fleetIds = var_79_1,
			loopFlag = arg_79_2,
			operationItem = arg_79_3,
			duties = arg_79_4,
			autoFightFlag = arg_79_5
		})
	end)
	arg_78_0:bind(var_0_0.ON_ELITE_TRACKING, function(arg_80_0, arg_80_1, arg_80_2, arg_80_3, arg_80_4, arg_80_5)
		arg_78_0:sendNotification(GAME.TRACKING, {
			chapterId = arg_80_1,
			loopFlag = arg_80_2,
			operationItem = arg_80_3,
			duties = arg_80_4,
			autoFightFlag = arg_80_5
		})
	end)
	arg_78_0:bind(var_0_0.ON_RETRACKING, function(arg_81_0, arg_81_1, arg_81_2)
		local var_81_0 = arg_81_1.duties
		local var_81_1 = arg_81_1:getConfig("type") == Chapter.CustomFleet
		local var_81_2 = arg_81_1:GetActiveSPItemID()

		if var_81_1 then
			arg_78_0.viewComponent:emit(LevelMediator2.ON_ELITE_TRACKING, arg_81_1.id, arg_81_1.loopFlag, var_81_2, var_81_0, arg_81_2)
		else
			arg_78_0.viewComponent:emit(LevelMediator2.ON_TRACKING, arg_81_1.id, arg_81_1.loopFlag, var_81_2, var_81_0, arg_81_2)
		end
	end)
end

function var_0_0.NoticeVoteBook(arg_82_0, arg_82_1)
	arg_82_1()
end

function var_0_0.TryPlaySubGuide(arg_83_0)
	arg_83_0.viewComponent:tryPlaySubGuide()
end

function var_0_0.listNotificationInterests(arg_84_0)
	return {
		ChapterProxy.CHAPTER_UPDATED,
		ChapterProxy.CHAPTER_TIMESUP,
		PlayerProxy.UPDATED,
		DailyLevelProxy.ELITE_QUOTA_UPDATE,
		var_0_0.ON_TRACKING,
		var_0_0.ON_ELITE_TRACKING,
		var_0_0.ON_RETRACKING,
		GAME.TRACKING_DONE,
		GAME.TRACKING_ERROR,
		GAME.CHAPTER_OP_DONE,
		GAME.EVENT_LIST_UPDATE,
		GAME.BEGIN_STAGE_DONE,
		ActivityProxy.ACTIVITY_OPERATION_DONE,
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.SUB_CHAPTER_REFRESH_DONE,
		GAME.SUB_CHAPTER_FETCH_DONE,
		CommanderProxy.PREFAB_FLEET_UPDATE,
		GAME.COOMMANDER_EQUIP_TO_FLEET_DONE,
		GAME.COMMANDER_ELIT_FORMATION_OP_DONE,
		GAME.SUBMIT_TASK_DONE,
		GAME.SUBMIT_ACTIVITY_TASK_DONE,
		LevelUIConst.CONTINUOUS_OPERATION,
		var_0_0.ON_SPITEM_CHANGED,
		GAME.GET_REMASTER_TICKETS_DONE,
		GAME.ACTIVITY_PERMANENT_START_DONE,
		VoteProxy.VOTE_ORDER_BOOK_DELETE,
		VoteProxy.VOTE_ORDER_BOOK_UPDATE,
		GAME.VOTE_BOOK_BE_UPDATED_DONE,
		BagProxy.ITEM_UPDATED,
		ChapterProxy.CHAPTER_AUTO_FIGHT_FLAG_UPDATED,
		ChapterProxy.CHAPTER_SKIP_PRECOMBAT_UPDATED,
		ChapterProxy.CHAPTER_REMASTER_INFO_UPDATED,
		GAME.CHAPTER_REMASTER_INFO_REQUEST_DONE,
		GAME.CHAPTER_REMASTER_AWARD_RECEIVE_DONE,
		GAME.STORY_UPDATE_DONE,
		GAME.STORY_END
	}
end

function var_0_0.handleNotification(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_1:getName()
	local var_85_1 = arg_85_1:getBody()

	if var_85_0 == GAME.BEGIN_STAGE_DONE then
		arg_85_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_85_1)
	elseif var_85_0 == VoteProxy.VOTE_ORDER_BOOK_DELETE or VoteProxy.VOTE_ORDER_BOOK_UPDATE == var_85_0 then
		arg_85_0.viewComponent:updateVoteBookBtn()
	elseif var_85_0 == PlayerProxy.UPDATED then
		arg_85_0.viewComponent:updateRes(var_85_1)
	elseif var_85_0 == var_0_0.ON_TRACKING or var_85_0 == var_0_0.ON_ELITE_TRACKING or var_85_0 == var_0_0.ON_RETRACKING then
		arg_85_0.viewComponent:emit(var_85_0, unpackEx(var_85_1))
	elseif var_85_0 == GAME.TRACKING_DONE then
		arg_85_0.waitingTracking = nil

		if arg_85_0.contextData.pendingEnterChapterId == var_85_1.id then
			arg_85_0.contextData.pendingEnterChapterId = nil
		end

		arg_85_0.viewComponent:resetLevelGrid()

		arg_85_0.viewComponent.FirstEnterChapter = var_85_1.id

		arg_85_0.viewComponent:switchToChapter(var_85_1)
	elseif var_85_0 == ChapterProxy.CHAPTER_UPDATED then
		arg_85_0.viewComponent:updateChapterVO(var_85_1.chapter, var_85_1.dirty)
	elseif var_85_0 == GAME.COMMANDER_ELIT_FORMATION_OP_DONE then
		if arg_85_0.contextData.commanderOPChapter then
			local var_85_2 = getProxy(ChapterProxy):getChapterById(var_85_1.chapterId)

			for iter_85_0, iter_85_1 in pairs(var_85_2:getEliteFleetCommanders()) do
				arg_85_0.contextData.commanderOPChapter:setEliteFleetByIndex(iter_85_0, {
					{
						TeamType.FormCommander,
						{
							pos = 1,
							id = iter_85_1[1]
						}
					},
					{
						TeamType.FormCommander,
						{
							pos = 2,
							id = iter_85_1[2]
						}
					}
				})
			end

			arg_85_0.viewComponent:RefreshFleetSelectView(arg_85_0.contextData.commanderOPChapter)
		end
	elseif var_85_0 == GAME.CHAPTER_OP_DONE then
		local var_85_3

		local function var_85_4()
			if var_85_3 and coroutine.status(var_85_3) == "suspended" then
				local var_86_0, var_86_1 = coroutine.resume(var_85_3)

				assert(var_86_0, debug.traceback(var_85_3, var_86_1))
			end
		end

		var_85_3 = coroutine.create(function()
			local var_87_0 = var_85_1.type
			local var_87_1 = arg_85_0.contextData.chapterVO
			local var_87_2 = var_87_1:IsAutoFight()

			if var_87_0 == ChapterConst.OpRetreat and not var_85_1.id then
				var_87_1 = var_85_1.finalChapterLevelData

				if var_85_1.exittype and var_85_1.exittype == ChapterConst.ExitFromMap then
					arg_85_0.viewComponent:setChapter(nil)
					arg_85_0.viewComponent.mapBuilder:UpdateChapterTF(var_87_1.id)
					arg_85_0:OnExitChapter(var_87_1, var_85_1.win, var_85_1.extendData)

					return
				end

				if var_87_1:existOni() then
					local var_87_3 = var_87_1:checkOniState()

					if var_87_3 then
						arg_85_0.viewComponent:displaySpResult(var_87_3, var_85_4)
						coroutine.yield()
					end
				end

				if var_87_1:isPlayingWithBombEnemy() then
					arg_85_0.viewComponent:displayBombResult(var_85_4)
					coroutine.yield()
				end
			end

			local var_87_4 = var_85_1.items
			local var_87_5

			if var_87_4 and #var_87_4 > 0 then
				if var_87_0 == ChapterConst.OpBox then
					local var_87_6 = var_87_1.fleet.line
					local var_87_7 = var_87_1:getChapterCell(var_87_6.row, var_87_6.column)

					if pg.box_data_template[var_87_7.attachmentId].type == ChapterConst.BoxDrop and ChapterConst.IsAtelierMap(arg_85_0.contextData.map) then
						local var_87_8 = _.filter(var_87_4, function(arg_88_0)
							return arg_88_0.type == DROP_TYPE_RYZA_DROP
						end)

						if #var_87_8 > 0 then
							var_87_5 = AwardInfoLayer.TITLE.RYZA

							local var_87_9 = math.random(#var_87_8)
							local var_87_10 = AtelierMaterial.New({
								configId = var_87_8[var_87_9].id
							}):GetVoices()

							if var_87_10 and #var_87_10 > 0 then
								local var_87_11 = var_87_10[math.random(#var_87_10)]
								local var_87_12, var_87_13, var_87_14 = ShipWordHelper.GetWordAndCV(var_87_11[1], var_87_11[2], nil, PLATFORM_CODE ~= PLATFORM_US)

								arg_85_0.viewComponent:emit(LevelUIConst.ADD_TOAST_QUEUE, {
									iconScale = 0.75,
									Class = LevelStageAtelierMaterialToast,
									title = i18n("ryza_tip_toast_item_got"),
									desc = var_87_14,
									voice = var_87_13,
									icon = var_87_11[3]
								})
							end
						end
					end
				end

				seriesAsync({
					function(arg_89_0)
						getProxy(ChapterProxy):AddExtendChapterDataArray(var_87_1.id, "TotalDrops", _.filter(var_87_4, function(arg_90_0)
							return arg_90_0.type ~= DROP_TYPE_STRATEGY
						end))
						arg_85_0.viewComponent:emit(BaseUI.ON_WORLD_ACHIEVE, {
							items = var_87_4,
							title = var_87_5,
							closeOnCompleted = var_87_2,
							removeFunc = arg_89_0
						})
					end,
					function(arg_91_0)
						if var_87_0 == ChapterConst.OpBox and _.any(var_87_4, function(arg_92_0)
							if arg_92_0.type ~= DROP_TYPE_VITEM then
								return false
							end

							return arg_92_0:getConfig("virtual_type") == 1
						end) then
							(function()
								local var_93_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)

								if not var_93_0 then
									return
								end

								local var_93_1 = pg.activity_event_picturepuzzle[var_93_0.id]

								if not var_93_1 then
									return
								end

								if #table.mergeArray(var_93_0.data1_list, var_93_0.data2_list, true) < #var_93_1.pickup_picturepuzzle + #var_93_1.drop_picturepuzzle then
									return
								end

								local var_93_2 = var_93_0:getConfig("config_client").comStory

								pg.NewStoryMgr.GetInstance():Play(var_93_2, arg_91_0)
							end)()
						end

						if _.any(var_87_4, function(arg_94_0)
							if arg_94_0.type ~= DROP_TYPE_STRATEGY then
								return false
							end

							return pg.strategy_data_template[arg_94_0.id].type == ChapterConst.StgTypeConsume
						end) then
							arg_85_0.viewComponent.levelStageView:popStageStrategy()
						end

						arg_91_0()
					end
				}, var_85_4)
				coroutine.yield()
			end

			assert(var_87_1)

			if var_87_0 == ChapterConst.OpSkipBattle or var_87_0 == ChapterConst.OpPreClear then
				arg_85_0.viewComponent.levelStageView:tryAutoAction(function()
					if not arg_85_0.viewComponent.levelStageView then
						return
					end

					arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
				end)
			elseif var_87_0 == ChapterConst.OpRetreat then
				local var_87_15 = getProxy(ContextProxy):getContextByMediator(LevelMediator2)

				if var_87_15 then
					local var_87_16 = {}
					local var_87_17 = var_87_15:getContextByMediator(ChapterPreCombatMediator)

					if var_87_17 then
						table.insert(var_87_16, var_87_17)
					end

					_.each(var_87_16, function(arg_96_0)
						arg_85_0:sendNotification(GAME.REMOVE_LAYERS, {
							context = arg_96_0
						})
					end)
				end

				if var_85_1.id then
					return
				end

				local var_87_18 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN)

				if var_87_18 and not var_87_18.autoActionForbidden and not var_87_18.achieved and var_87_18.data1 == 7 and var_87_1.id == 204 and var_87_1:isClear() then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						modal = true,
						hideNo = true,
						content = "有新的签到奖励可以领取，点击确定前往",
						onYes = function()
							arg_85_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
						end,
						onNo = function()
							arg_85_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
						end
					})

					return
				end

				arg_85_0:OnExitChapter(var_87_1, var_85_1.win, var_85_1.extendData)
			elseif var_87_0 == ChapterConst.OpMove then
				seriesAsync({
					function(arg_99_0)
						var_87_1 = arg_85_0.contextData.chapterVO

						local var_99_0 = var_85_1.fullpath[#var_85_1.fullpath]

						var_87_1.fleet:SetLine(var_99_0)
						getProxy(ChapterProxy):updateChapter(var_87_1)
						arg_85_0.viewComponent.grid:moveFleet(var_85_1.path, var_85_1.fullpath, var_85_1.oldLine, arg_99_0)
					end,
					function(arg_100_0)
						if not var_85_1.teleportPaths then
							arg_100_0()

							return
						end

						local var_100_0 = var_85_1.teleportPaths[1]
						local var_100_1 = var_85_1.teleportPaths[2]

						if not var_100_0 or not var_100_1 then
							arg_100_0()

							return
						end

						var_87_1 = arg_85_0.contextData.chapterVO

						local var_100_2 = var_87_1:getFleet(FleetType.Normal, var_100_0.row, var_100_0.column)

						if not var_100_2 then
							arg_100_0()

							return
						end

						var_100_2.line = Clone(var_85_1.teleportPaths[2])

						getProxy(ChapterProxy):updateChapter(var_87_1)

						local var_100_3 = arg_85_0:getViewComponent().grid:GetCellFleet(var_100_2.id)

						arg_85_0:getViewComponent().grid:TeleportCellByPortalWithCameraMove(var_100_2, var_100_3, var_85_1.teleportPaths, arg_100_0)
					end,
					function(arg_101_0)
						arg_85_0:playAIActions(var_85_1.aiActs, var_85_1.extraFlag, arg_101_0)
					end
				}, function()
					var_87_1 = arg_85_0.contextData.chapterVO

					local var_102_0 = var_87_1.fleet:getStrategies()

					if _.any(var_102_0, function(arg_103_0)
						return arg_103_0.id == ChapterConst.StrategyExchange and arg_103_0.count > 0
					end) then
						arg_85_0.viewComponent.levelStageView:popStageStrategy()
					end

					arg_85_0.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
					arg_85_0.viewComponent.levelStageView:updateAmbushRate(var_87_1.fleet.line, true)
					arg_85_0.viewComponent.levelStageView:updateStageStrategy()
					arg_85_0.viewComponent.levelStageView:updateFleetBuff()
					arg_85_0.viewComponent.levelStageView:updateBombPanel()
					arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
				end)
			elseif var_87_0 == ChapterConst.OpAmbush then
				arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_87_0 == ChapterConst.OpBox then
				arg_85_0:playAIActions(var_85_1.aiActs, var_85_1.extraFlag, function()
					if not arg_85_0.viewComponent.levelStageView then
						return
					end

					arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
				end)
			elseif var_87_0 == ChapterConst.OpStory then
				arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_87_0 == ChapterConst.OpSwitch then
				arg_85_0.viewComponent.grid:adjustCameraFocus()
			elseif var_87_0 == ChapterConst.OpEnemyRound then
				arg_85_0:playAIActions(var_85_1.aiActs, var_85_1.extraFlag, function()
					arg_85_0.viewComponent.levelStageView:updateBombPanel(true)

					local var_105_0 = var_87_1.fleet:getStrategies()

					if _.any(var_105_0, function(arg_106_0)
						return arg_106_0.id == ChapterConst.StrategyExchange and arg_106_0.count > 0
					end) then
						arg_85_0.viewComponent.levelStageView:updateStageStrategy()
						arg_85_0.viewComponent.levelStageView:popStageStrategy()
					end

					arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
					arg_85_0.viewComponent:updatePoisonAreaTip()
				end)
			elseif var_87_0 == ChapterConst.OpSubState then
				arg_85_0:saveSubState(var_87_1.subAutoAttack)
				arg_85_0.viewComponent.grid:OnChangeSubAutoAttack()
			elseif var_87_0 == ChapterConst.OpStrategy then
				if var_85_1.arg1 == ChapterConst.StrategyExchange then
					local var_87_19 = var_87_1.fleet:findSkills(FleetSkill.TypeStrategy)

					for iter_87_0, iter_87_1 in ipairs(var_87_19) do
						if iter_87_1:GetType() == FleetSkill.TypeStrategy and iter_87_1:GetArgs()[1] == ChapterConst.StrategyExchange then
							local var_87_20 = var_87_1.fleet:findCommanderBySkillId(iter_87_1.id)

							arg_85_0.viewComponent:doPlayCommander(var_87_20)

							break
						end
					end
				end

				arg_85_0:playAIActions(var_85_1.aiActs, var_85_1.extraFlag, function()
					arg_85_0.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				end)
			elseif var_87_0 == ChapterConst.OpSupply then
				arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_87_0 == ChapterConst.OpBarrier then
				arg_85_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_87_0 == ChapterConst.OpSubTeleport then
				seriesAsync({
					function(arg_108_0)
						local var_108_0 = _.detect(var_87_1.fleets, function(arg_109_0)
							return arg_109_0.id == var_85_1.id
						end)

						var_108_0.line = {
							row = var_85_1.arg1,
							column = var_85_1.arg2
						}
						var_108_0.startPos = {
							row = var_85_1.arg1,
							column = var_85_1.arg2
						}

						local var_108_1 = var_85_1.fullpath[1]
						local var_108_2 = var_85_1.fullpath[#var_85_1.fullpath]
						local var_108_3 = var_87_1:findPath(nil, var_108_1, var_108_2)
						local var_108_4 = pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2]
						local var_108_5 = math.ceil(var_108_4 * #var_108_0:getShips(false) * var_108_3 - 1e-05)
						local var_108_6 = getProxy(PlayerProxy)
						local var_108_7 = var_108_6:getData()

						var_108_7:consume({
							oil = var_108_5
						})
						arg_85_0.viewComponent:updateRes(var_108_7)
						var_108_6:updatePlayer(var_108_7)
						arg_85_0.viewComponent.grid:moveSub(table.indexof(var_87_1.fleets, var_108_0), var_85_1.fullpath, nil, function()
							local var_110_0 = bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampionPosition)

							getProxy(ChapterProxy):updateChapter(var_87_1, var_110_0)

							var_87_1 = arg_85_0.contextData.chapterVO

							arg_108_0()
						end)
					end,
					function(arg_111_0)
						if not var_85_1.teleportPaths then
							arg_111_0()

							return
						end

						local var_111_0 = var_85_1.teleportPaths[1]
						local var_111_1 = var_85_1.teleportPaths[2]

						if not var_111_0 or not var_111_1 then
							arg_111_0()

							return
						end

						local var_111_2 = _.detect(var_87_1.fleets, function(arg_112_0)
							return arg_112_0.id == var_85_1.id
						end)

						var_111_2.startPos = Clone(var_85_1.teleportPaths[2])
						var_111_2.line = Clone(var_85_1.teleportPaths[2])

						local var_111_3 = arg_85_0:getViewComponent().grid:GetCellFleet(var_111_2.id)

						arg_85_0:getViewComponent().grid:TeleportFleetByPortal(var_111_3, var_85_1.teleportPaths, function()
							local var_113_0 = bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampionPosition)

							getProxy(ChapterProxy):updateChapter(var_87_1, var_113_0)

							var_87_1 = arg_85_0.contextData.chapterVO

							arg_111_0()
						end)
					end,
					function(arg_114_0)
						arg_85_0.viewComponent.levelStageView:SwitchBottomStagePanel(false)
						arg_85_0.viewComponent.grid:TurnOffSubTeleport()
						arg_85_0.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
					end
				})
			end
		end)

		var_85_4()
	elseif var_85_0 == ChapterProxy.CHAPTER_TIMESUP then
		arg_85_0:onTimeUp()
	elseif var_85_0 == GAME.EVENT_LIST_UPDATE then
		arg_85_0.viewComponent:addbubbleMsgBox(function(arg_115_0)
			arg_85_0:OnEventUpdate(arg_115_0)
		end)
	elseif var_85_0 == GAME.VOTE_BOOK_BE_UPDATED_DONE then
		arg_85_0.viewComponent:addbubbleMsgBox(function(arg_116_0)
			arg_85_0:NoticeVoteBook(arg_116_0)
		end)
	elseif var_85_0 == DailyLevelProxy.ELITE_QUOTA_UPDATE then
		local var_85_5 = getProxy(DailyLevelProxy)

		arg_85_0.viewComponent:setEliteQuota(var_85_5.eliteCount, pg.gameset.elite_quota.key_value)
	elseif var_85_0 == ActivityProxy.ACTIVITY_OPERATION_DONE then
		arg_85_0.viewComponent.mapBuilder:UpdateMapItems()
	elseif var_85_0 == ActivityProxy.ACTIVITY_UPDATED then
		if var_85_1 and arg_85_0.viewComponent.ptActivity and var_85_1.id == arg_85_0.viewComponent.ptActivity.id then
			arg_85_0.viewComponent:updatePtActivity(var_85_1)
		end
	elseif var_85_0 == GAME.GET_REMASTER_TICKETS_DONE then
		arg_85_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_85_1, function()
			arg_85_0.viewComponent:updateRemasterTicket()
		end)
	elseif var_85_0 == GAME.ACTIVITY_PERMANENT_START_DONE then
		local var_85_6 = var_85_1 and var_85_1.id

		if var_85_6 ~= arg_85_0.bossRushRemasterActivityId then
			return
		end

		if not getProxy(ActivityPermanentProxy):IsActivityIdByType(var_85_6, ActivityPermanentProxy.TYPE_REMASTER_ACTIVITY) then
			return
		end

		arg_85_0.bossRushRemasterActivityId = nil

		arg_85_0:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_REMASTER, {
			id = var_85_6
		})
	elseif var_85_0 == CommanderProxy.PREFAB_FLEET_UPDATE then
		local var_85_7 = getProxy(CommanderProxy):getPrefabFleet()

		arg_85_0.viewComponent:setCommanderPrefabs(var_85_7)
		arg_85_0.viewComponent:updateCommanderPrefab()
	elseif var_85_0 == GAME.COOMMANDER_EQUIP_TO_FLEET_DONE then
		local var_85_8 = getProxy(FleetProxy):GetRegularFleets()

		arg_85_0.viewComponent:updateFleet(var_85_8)
		arg_85_0.viewComponent:RefreshFleetSelectView()
	elseif var_85_0 == GAME.SUBMIT_TASK_DONE then
		if arg_85_0.contextData.map and arg_85_0.contextData.map:isSkirmish() then
			arg_85_0.viewComponent.mapBuilder:UpdateMapItems()
		end

		arg_85_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_85_1, function()
			if arg_85_0.contextData.map and arg_85_0.contextData.map:isSkirmish() and arg_85_0.contextData.TaskToSubmit then
				local var_118_0 = arg_85_0.contextData.TaskToSubmit

				arg_85_0.contextData.TaskToSubmit = nil

				arg_85_0:sendNotification(GAME.SUBMIT_TASK, var_118_0)
			end

			arg_85_0.viewComponent.mapBuilder:OnSubmitTaskDone()
		end)
	elseif var_85_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		arg_85_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_85_1.awards, function()
			arg_85_0.viewComponent.mapBuilder:OnSubmitTaskDone()
		end)
	elseif var_85_0 == BagProxy.ITEM_UPDATED then
		local var_85_9 = getProxy(BagProxy):getItemsByType(Item.SPECIAL_OPERATION_TICKET)

		arg_85_0.viewComponent:setSpecialOperationTickets(var_85_9)
	elseif var_85_0 == ChapterProxy.CHAPTER_AUTO_FIGHT_FLAG_UPDATED then
		if not arg_85_0:getViewComponent().levelStageView then
			return
		end

		arg_85_0:getViewComponent().levelStageView:ActionInvoke("UpdateAutoFightMark")
	elseif var_85_0 == ChapterProxy.CHAPTER_SKIP_PRECOMBAT_UPDATED then
		if not arg_85_0:getViewComponent().levelStageView then
			return
		end

		arg_85_0:getViewComponent().levelStageView:ActionInvoke("UpdateSkipPreCombatMark")
	elseif var_85_0 == ChapterProxy.CHAPTER_REMASTER_INFO_UPDATED or var_85_0 == GAME.CHAPTER_REMASTER_INFO_REQUEST_DONE then
		arg_85_0.viewComponent:updateRemasterInfo()
		arg_85_0.viewComponent:updateRemasterBtnTip()
	elseif var_85_0 == GAME.CHAPTER_REMASTER_AWARD_RECEIVE_DONE then
		arg_85_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_85_1)
	elseif var_85_0 == GAME.STORY_UPDATE_DONE then
		arg_85_0.cachedStoryAwards = var_85_1

		arg_85_0.viewComponent.mapBuilder:UpdateView()
	elseif var_85_0 == GAME.STORY_END then
		if arg_85_0.cachedStoryAwards then
			arg_85_0.viewComponent:emit(BaseUI.ON_ACHIEVE, arg_85_0.cachedStoryAwards.awards)

			arg_85_0.cachedStoryAwards = nil
		end
	elseif var_85_0 == LevelUIConst.CONTINUOUS_OPERATION then
		arg_85_0.viewComponent:emit(LevelUIConst.CONTINUOUS_OPERATION, var_85_1)
	elseif var_85_0 == GAME.TRACKING_ERROR then
		if arg_85_0.waitingTracking then
			arg_85_0:DisplayContinuousOperationResult(var_85_1.chapter, getProxy(ChapterProxy):PopContinuousData(SYSTEM_SCENARIO))
		end

		arg_85_0.waitingTracking = nil
	elseif var_85_0 == var_0_0.ON_SPITEM_CHANGED then
		arg_85_0.viewComponent:emit(var_0_0.ON_SPITEM_CHANGED, var_85_1)
	end
end

function var_0_0.OnExitChapter(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	assert(arg_120_1)
	seriesAsync({
		function(arg_121_0)
			if not arg_120_0.contextData.chapterVO then
				return arg_121_0()
			end

			arg_120_0.viewComponent:switchToMap(arg_121_0)
		end,
		function(arg_122_0)
			arg_120_0.viewComponent:addbubbleMsgBox(function()
				arg_120_0.viewComponent:CleanBubbleMsgbox()
				arg_122_0()
			end)
		end,
		function(arg_124_0)
			if not arg_120_2 then
				return arg_124_0()
			end

			local var_124_0 = getProxy(PlayerProxy):getData()

			if arg_120_1.id == 103 and not var_124_0:GetCommonFlag(BATTLE_AUTO_ENABLED) then
				arg_120_0.viewComponent:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("battle_autobot_unlock"),
					onYes = arg_124_0,
					onNo = arg_124_0
				})
				arg_120_0.viewComponent:emit(LevelMediator2.NOTICE_AUTOBOT_ENABLED, {})

				return
			end

			arg_124_0()
		end,
		function(arg_125_0)
			if not arg_120_2 then
				return arg_125_0()
			end

			if getProxy(ChapterProxy):getMapById(arg_120_1:getConfig("map")):isSkirmish() then
				local var_125_0 = arg_120_1.id
				local var_125_1 = getProxy(SkirmishProxy):getRawData()
				local var_125_2 = _.detect(var_125_1, function(arg_126_0)
					return tonumber(arg_126_0:getConfig("event")) == var_125_0
				end)

				if not var_125_2 then
					arg_125_0()

					return
				end

				local var_125_3 = getProxy(TaskProxy)
				local var_125_4 = var_125_2:getConfig("task_id")
				local var_125_5 = var_125_3:getTaskVO(var_125_4)

				if var_125_5 and var_125_5:getTaskStatus() == 1 then
					arg_120_0:sendNotification(GAME.SUBMIT_TASK, var_125_4)

					if var_125_2 == var_125_1[#var_125_1] then
						local var_125_6 = getProxy(ActivityProxy)
						local var_125_7 = ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE
						local var_125_8 = var_125_6:getActivityById(var_125_7)

						assert(var_125_8, "Missing Skirmish Activity " .. (var_125_7 or "NIL"))

						local var_125_9 = var_125_8:getConfig("config_data")
						local var_125_10 = var_125_9[#var_125_9][2]
						local var_125_11 = var_125_3:getTaskVO(var_125_10)

						if var_125_11 and var_125_11:getTaskStatus() < 2 then
							arg_120_0.contextData.TaskToSubmit = var_125_10
						end
					end
				end
			end

			arg_125_0()
		end,
		function(arg_127_0)
			if not arg_120_2 then
				return arg_127_0()
			end

			local var_127_0 = getProxy(ChapterProxy):getMapById(arg_120_1:getConfig("map"))

			if var_127_0:isRemaster() then
				local var_127_1 = var_127_0:getRemaster()
				local var_127_2 = pg.re_map_template[var_127_1]
				local var_127_3 = Map.GetRearChaptersOfRemaster(var_127_1)

				assert(var_127_3)

				if _.any(var_127_3, function(arg_128_0)
					return arg_128_0 == arg_120_1.id
				end) then
					local var_127_4 = var_127_2.memory_group

					if BossRushChapterRemasterHelper.UnlockMemoryGroupStoriesAndShowMsgBox(var_127_4, arg_127_0) then
						return
					end
				end
			end

			arg_127_0()
		end,
		function(arg_129_0)
			if arg_120_0.contextData.map and not arg_120_0.contextData.map:isUnlock() then
				arg_120_0.viewComponent:emit(var_0_0.ON_SWITCH_NORMAL_MAP)

				return
			end

			if not arg_120_3 then
				return arg_129_0()
			end

			local var_129_0 = arg_120_3 and arg_120_3.AutoFightFlag
			local var_129_1 = {}

			if arg_120_3 and arg_120_3.ResultDrops then
				for iter_129_0, iter_129_1 in ipairs(arg_120_3.ResultDrops) do
					var_129_1 = table.mergeArray(var_129_1, iter_129_1)
				end
			end

			local var_129_2 = {}

			if arg_120_3 and arg_120_3.TotalDrops then
				for iter_129_2, iter_129_3 in ipairs(arg_120_3.TotalDrops) do
					var_129_2 = table.mergeArray(var_129_2, iter_129_3)
				end
			end

			DropResultIntegration(var_129_2)

			local var_129_3 = getProxy(ChapterProxy):GetContinuousData(SYSTEM_SCENARIO)

			if var_129_3 then
				var_129_3:MergeDrops(var_129_2, var_129_1)
				var_129_3:MergeEvents(arg_120_3.ListEventNotify, arg_120_3.ListGuildEventNotify, arg_120_3.ListGuildEventAutoReceiveNotify)

				if arg_120_2 then
					var_129_3:ConsumeBattleTime()
				end

				if var_129_3:IsActive() and var_129_3:GetRestBattleTime() > 0 then
					arg_120_0.waitingTracking = true

					arg_120_0.viewComponent:emit(var_0_0.ON_RETRACKING, arg_120_1, var_129_0)

					return
				end

				getProxy(ChapterProxy):PopContinuousData(SYSTEM_SCENARIO)
				arg_120_0:DisplayContinuousOperationResult(arg_120_1, var_129_3)
				arg_129_0()

				return
			end

			local var_129_4 = var_129_0 ~= nil

			if not var_129_4 and not arg_120_3.ResultDrops then
				return arg_129_0()
			end

			local var_129_5
			local var_129_6

			if var_129_4 then
				var_129_5 = i18n("autofight_rewards")
				var_129_6 = i18n("total_rewards_subtitle")
			else
				var_129_5 = i18n("settle_rewards_title")
				var_129_6 = i18n("settle_rewards_subtitle")
			end

			arg_120_0:addSubLayers(Context.New({
				viewComponent = LevelStageTotalRewardPanel,
				mediator = LevelStageTotalRewardPanelMediator,
				data = {
					title = var_129_5,
					subTitle = var_129_6,
					chapter = arg_120_1,
					onClose = arg_129_0,
					rewards = var_129_2,
					resultRewards = var_129_1,
					events = arg_120_3.ListEventNotify,
					guildTasks = arg_120_3.ListGuildEventNotify,
					guildAutoReceives = arg_120_3.ListGuildEventAutoReceiveNotify,
					isAutoFight = var_129_0
				}
			}), true)
		end,
		function(arg_130_0)
			if Map.autoNextPage then
				Map.autoNextPage = nil

				triggerButton(arg_120_0.viewComponent.btnNext)
			end

			if arg_120_2 then
				arg_120_0.viewComponent:RefreshMapBG()
			end

			arg_120_0:TryPlaySubGuide()
		end
	})
end

function var_0_0.DisplayContinuousWindow(arg_131_0, arg_131_1, arg_131_2, arg_131_3, arg_131_4)
	local var_131_0 = arg_131_1:getConfig("oil")

	if arg_131_1:IsSupportSubmarineStage() and #arg_131_1:getSupportFleet() > 0 then
		var_131_0 = var_131_0 + getGameset("submarine_support_oil_consume")[1]
	end

	local var_131_1 = arg_131_1:getPlayType()
	local var_131_2 = 0
	local var_131_3 = 0

	if var_131_1 == ChapterConst.TypeMultiStageBoss then
		local var_131_4 = pg.chapter_model_multistageboss[arg_131_1.id]

		var_131_2 = _.reduce(var_131_4.boss_refresh, 0, function(arg_132_0, arg_132_1)
			return arg_132_0 + arg_132_1
		end)
		var_131_3 = #var_131_4.boss_refresh
	else
		var_131_2, var_131_3 = arg_131_1:getConfig("boss_refresh"), 1
	end

	local var_131_5 = arg_131_1:getConfig("use_oil_limit")

	table.Foreach(arg_131_2, function(arg_133_0, arg_133_1)
		local var_133_0 = arg_131_4[arg_133_0]

		if var_133_0 == ChapterFleet.DUTY_IDLE then
			return
		end

		local var_133_1 = arg_133_1:GetCostSum().oil

		if var_133_0 == ChapterFleet.DUTY_KILLALL then
			local var_133_2 = var_131_5[1] or 0
			local var_133_3 = var_133_1

			if var_133_2 > 0 then
				var_133_3 = math.min(var_133_3, var_133_2)
			end

			local var_133_4 = var_131_5[2] or 0
			local var_133_5 = var_133_1

			if var_133_4 > 0 then
				var_133_5 = math.min(var_133_5, var_133_4)
			end

			var_131_0 = var_131_0 + var_133_3 * var_131_2 + var_133_5 * var_131_3
		elseif var_133_0 == ChapterFleet.DUTY_CLEANPATH then
			local var_133_6 = var_131_5[1] or 0
			local var_133_7 = var_133_1

			if var_133_6 > 0 then
				var_133_7 = math.min(var_133_7, var_133_6)
			end

			var_131_0 = var_131_0 + var_133_7 * var_131_2
		elseif var_133_0 == ChapterFleet.DUTY_KILLBOSS then
			local var_133_8 = var_131_5[2] or 0
			local var_133_9 = var_133_1

			if var_133_8 > 0 then
				var_133_9 = math.min(var_133_9, var_133_8)
			end

			var_131_0 = var_131_0 + var_133_9 * var_131_3
		end
	end)

	local var_131_6 = arg_131_1:GetMaxBattleCount()
	local var_131_7 = arg_131_3 and arg_131_3 > 0
	local var_131_8 = arg_131_1:GetSpItems()
	local var_131_9 = var_131_8[1] and var_131_8[1].count or 0
	local var_131_10 = var_131_8[1] and var_131_8[1].id or 0
	local var_131_11 = arg_131_1:GetRestDailyBonus()

	arg_131_0:addSubLayers(Context.New({
		mediator = LevelContinuousOperationWindowMediator,
		viewComponent = LevelContinuousOperationWindow,
		data = {
			maxCount = var_131_6,
			oilCost = var_131_0,
			chapter = arg_131_1,
			extraRate = {
				rate = 2,
				enabled = var_131_7,
				extraCount = var_131_9,
				spItemId = var_131_10,
				freeBonus = var_131_11
			}
		}
	}))
end

function var_0_0.DisplayContinuousOperationResult(arg_134_0, arg_134_1, arg_134_2)
	local var_134_0 = i18n("autofight_rewards")
	local var_134_1 = i18n("total_rewards_subtitle")

	arg_134_0:addSubLayers(Context.New({
		viewComponent = LevelContinuousOperationTotalRewardPanel,
		mediator = LevelStageTotalRewardPanelMediator,
		data = {
			title = var_134_0,
			subTitle = var_134_1,
			chapter = arg_134_1,
			rewards = arg_134_2:GetDrops(),
			resultRewards = arg_134_2:GetSettlementDrops(),
			continuousData = arg_134_2,
			events = arg_134_2:GetEvents(1),
			guildTasks = arg_134_2:GetEvents(2),
			guildAutoReceives = arg_134_2:GetEvents(3)
		}
	}), true)
end

function var_0_0.OnEventUpdate(arg_135_0, arg_135_1)
	local var_135_0 = getProxy(EventProxy)

	arg_135_0.viewComponent:updateEvent(var_135_0)

	if pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_135_0.player.level, "EventMediator") and var_135_0.eventForMsg then
		local var_135_1 = var_135_0.eventForMsg.id or 0
		local var_135_2 = getProxy(ChapterProxy):getActiveChapter(true)

		if var_135_2 and var_135_2:IsAutoFight() then
			getProxy(ChapterProxy):AddExtendChapterDataArray(var_135_2.id, "ListEventNotify", var_135_1)
			existCall(arg_135_1)
		else
			local var_135_3 = pg.collection_template[var_135_1] and pg.collection_template[var_135_1].title or ""

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = false,
				hideNo = true,
				content = i18n("event_special_update", var_135_3),
				onYes = arg_135_1,
				onNo = arg_135_1
			})
		end

		var_135_0.eventForMsg = nil
	else
		existCall(arg_135_1)
	end
end

function var_0_0.onTimeUp(arg_136_0)
	local var_136_0 = getProxy(ChapterProxy):getActiveChapter()

	if var_136_0 and not var_136_0:inWartime() then
		local function var_136_1()
			arg_136_0:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		end

		if arg_136_0.contextData.chapterVO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("battle_preCombatMediator_timeout"),
				onYes = var_136_1,
				onNo = var_136_1
			})
		else
			var_136_1()
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_timeout"))
		end
	end
end

function var_0_0.getDockCallbackFuncs(arg_138_0, arg_138_1, arg_138_2, arg_138_3, arg_138_4)
	local var_138_0 = getProxy(ChapterProxy)

	local function var_138_1(arg_139_0, arg_139_1)
		local var_139_0, var_139_1 = ShipStatus.ShipStatusCheck("inElite", arg_139_0, arg_139_1, {
			inElite = arg_138_3:getConfig("formation")
		})

		if not var_139_0 then
			return var_139_0, var_139_1
		end

		for iter_139_0, iter_139_1 in pairs(arg_138_1) do
			if arg_139_0:isSameKind(iter_139_0) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end

		return true
	end

	local function var_138_2(arg_140_0, arg_140_1, arg_140_2)
		arg_140_1()
	end

	local function var_138_3(arg_141_0)
		local var_141_0 = arg_138_3:getEliteFleetList()[arg_138_4]

		if arg_138_2 then
			local var_141_1 = table.indexof(var_141_0, arg_138_2.id)

			assert(var_141_1)

			if arg_141_0[1] then
				var_141_0[var_141_1] = arg_141_0[1]
			else
				table.remove(var_141_0, var_141_1)
			end
		else
			table.insert(var_141_0, arg_141_0[1])
		end

		arg_138_3:setEliteFleetByIndex(arg_138_4, {
			{
				TeamType.FormShips,
				var_141_0
			}
		})
		var_138_0:updateChapter(arg_138_3)
		var_138_0:duplicateEliteFleet(arg_138_3)
	end

	return var_138_1, var_138_2, var_138_3
end

function var_0_0.getSupportDockCallbackFuncs(arg_142_0, arg_142_1, arg_142_2, arg_142_3)
	local var_142_0 = getProxy(ChapterProxy)

	local function var_142_1(arg_143_0, arg_143_1)
		local var_143_0, var_143_1 = ShipStatus.ShipStatusCheck("inSupport", arg_143_0, arg_143_1)

		if not var_143_0 then
			return var_143_0, var_143_1
		end

		for iter_143_0, iter_143_1 in pairs(arg_142_1) do
			if arg_143_0:isSameKind(iter_143_0) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end

		return true
	end

	local function var_142_2(arg_144_0, arg_144_1, arg_144_2)
		arg_144_1()
	end

	local function var_142_3(arg_145_0)
		local var_145_0 = arg_142_3:getSupportFleet()

		if arg_142_2 then
			local var_145_1 = table.indexof(var_145_0, arg_142_2.id)

			assert(var_145_1)

			if arg_145_0[1] then
				var_145_0[var_145_1] = arg_145_0[1]
			else
				table.remove(var_145_0, var_145_1)
			end
		else
			table.insert(var_145_0, arg_145_0[1])
		end

		arg_142_3:setEliteFleetByIndex(4, {
			{
				TeamType.FormShips,
				var_145_0
			}
		})
		var_142_0:updateChapter(arg_142_3)
		var_142_0:duplicateEliteFleet(arg_142_3)
	end

	return var_142_1, var_142_2, var_142_3
end

function var_0_0.playAIActions(arg_146_0, arg_146_1, arg_146_2, arg_146_3)
	if not arg_146_0.viewComponent.grid then
		arg_146_3()

		return
	end

	local var_146_0 = getProxy(ChapterProxy)
	local var_146_1

	local function var_146_2()
		if var_146_1 and coroutine.status(var_146_1) == "suspended" then
			local var_147_0, var_147_1 = coroutine.resume(var_146_1)

			assert(var_147_0, debug.traceback(var_146_1, var_147_1))

			if not var_147_0 then
				arg_146_0.viewComponent:unfrozen(-1)
				arg_146_0:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRequest
				})
			end
		end
	end

	var_146_1 = coroutine.create(function()
		arg_146_0.viewComponent:frozen()

		local var_148_0 = {}
		local var_148_1 = arg_146_2 or 0

		for iter_148_0, iter_148_1 in ipairs(arg_146_1) do
			local var_148_2 = arg_146_0.contextData.chapterVO
			local var_148_3, var_148_4 = iter_148_1:applyTo(var_148_2, true)

			assert(var_148_3, var_148_4)
			iter_148_1:PlayAIAction(arg_146_0.contextData.chapterVO, arg_146_0, function()
				local var_149_0, var_149_1, var_149_2 = iter_148_1:applyTo(var_148_2, false)

				if var_149_0 then
					var_146_0:updateChapter(var_148_2, var_149_1)

					var_148_1 = bit.bor(var_148_1, var_149_2 or 0)
				end

				onNextTick(var_146_2)
			end)
			coroutine.yield()

			if isa(iter_148_1, FleetAIAction) and iter_148_1.actType == ChapterConst.ActType_Poison and var_148_2:existFleet(FleetType.Normal, iter_148_1.line.row, iter_148_1.line.column) then
				local var_148_5 = var_148_2:getFleetIndex(FleetType.Normal, iter_148_1.line.row, iter_148_1.line.column)

				table.insert(var_148_0, var_148_5)
			end
		end

		local var_148_6 = bit.band(var_148_1, ChapterConst.DirtyAutoAction)

		var_148_1 = bit.band(var_148_1, bit.bnot(ChapterConst.DirtyAutoAction))

		if var_148_1 ~= 0 then
			local var_148_7 = arg_146_0.contextData.chapterVO

			var_146_0:updateChapter(var_148_7, var_148_1)
		end

		seriesAsync({
			function(arg_150_0)
				if var_148_6 ~= 0 then
					arg_146_0.viewComponent.levelStageView:tryAutoAction(arg_150_0)
				else
					arg_150_0()
				end
			end,
			function(arg_151_0)
				table.ParallelIpairsAsync(var_148_0, function(arg_152_0, arg_152_1, arg_152_2)
					arg_146_0.viewComponent.grid:showFleetPoisonDamage(arg_152_1, arg_152_2)
				end, arg_151_0)
			end,
			function(arg_153_0)
				arg_146_3()
				arg_146_0.viewComponent:unfrozen()
			end
		})
	end)

	var_146_2()
end

function var_0_0.saveSubState(arg_154_0, arg_154_1)
	local var_154_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("chapter_submarine_ai_type_" .. var_154_0, arg_154_1 + 1)
	PlayerPrefs.Save()
end

function var_0_0.loadSubState(arg_155_0, arg_155_1)
	local var_155_0 = getProxy(PlayerProxy):getRawData().id
	local var_155_1 = PlayerPrefs.GetInt("chapter_submarine_ai_type_" .. var_155_0, 1) - 1
	local var_155_2 = math.clamp(var_155_1, 0, 1)

	if var_155_2 ~= arg_155_1 then
		arg_155_0.viewComponent:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSubState,
			arg1 = var_155_2
		})
	end
end

function var_0_0.remove(arg_156_0)
	arg_156_0:removeSubLayers(LevelContinuousOperationWindowMediator)
	var_0_0.super.remove(arg_156_0)
end

return var_0_0
