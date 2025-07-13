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
var_0_0.ON_ELITE_OEPN_DECK = "LevelMediator2:ON_ELITE_OEPN_DECK"
var_0_0.ON_ELITE_CLEAR = "LevelMediator2:ON_ELITE_CLEAR"
var_0_0.ON_ELITE_RECOMMEND = "LevelMediator2:ON_ELITE_RECOMMEND"
var_0_0.ON_ELITE_ADJUSTMENT = "LevelMediator2:ON_ELITE_ADJUSTMENT"
var_0_0.ON_SUPPORT_OPEN_DECK = "LevelMediator2:ON_SUPPORT_OPEN_DECK"
var_0_0.ON_SUPPORT_CLEAR = "LevelMediator2:ON_SUPPORT_CLEAR"
var_0_0.ON_SUPPORT_RECOMMEND = "LevelMediator2:ON_SUPPORT_RECOMMEND"
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
var_0_0.ENTER_WORLD = "LevelMediator2:ENTER_WORLD"
var_0_0.ON_OPEN_ACT_BOSS_BATTLE = "LevelMediator2:ON_OPEN_ACT_BOSS_BATTLE"
var_0_0.ON_BOSSRUSH_MAP = "LevelMediator2:ON_BOSSRUSH_MAP"
var_0_0.SHOW_ATELIER_BUFF = "LevelMediator2:SHOW_ATELIER_BUFF"
var_0_0.ON_SPITEM_CHANGED = "LevelMediator2:ON_SPITEM_CHANGED"
var_0_0.ON_BOSSSINGLE_MAP = "LevelMediator2:ON_BOSSSINGLE_MAP"
var_0_0.ON_CLUE_MAP = "LevelMediator2:ON_CLUE_MAP"

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
			local var_6_4 = getProxy(CommanderProxy):getCommanderById(var_6_2[arg_6_2])
		end

		local var_6_5

		if var_6_2[arg_6_2] then
			var_6_5 = getProxy(CommanderProxy):getCommanderById(var_6_2[arg_6_2])
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDERCAT, {
			maxCount = 1,
			mode = CommanderCatScene.MODE_SELECT,
			activeCommander = var_6_5,
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
	arg_1_0:bind(var_0_0.ON_SUPPORT_CLEAR, function(arg_34_0, arg_34_1)
		local var_34_0 = arg_34_1.index
		local var_34_1 = arg_34_1.chapterVO

		var_34_1:ClearSupportFleetList(var_34_0)

		local var_34_2 = getProxy(ChapterProxy)

		var_34_2:updateChapter(var_34_1)
		var_34_2:duplicateSupportFleet(var_34_1)
		arg_1_0.viewComponent:RefreshFleetSelectView(var_34_1)
	end)
	arg_1_0:bind(var_0_0.ON_SUPPORT_RECOMMEND, function(arg_35_0, arg_35_1)
		local var_35_0 = arg_35_1.index
		local var_35_1 = arg_35_1.chapterVO
		local var_35_2 = getProxy(ChapterProxy)

		var_35_2:SupportFleetRecommend(var_35_1, var_35_0)
		var_35_2:updateChapter(var_35_1)
		var_35_2:duplicateSupportFleet(var_35_1)
		arg_1_0.viewComponent:RefreshFleetSelectView(var_35_1)
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVITY_MAP, function()
		local var_36_0 = getProxy(ChapterProxy)
		local var_36_1, var_36_2 = var_36_0:getLastMapForActivity()

		if not var_36_1 or not var_36_0:getMapById(var_36_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		end

		arg_1_0.viewComponent:ShowSelectedMap(var_36_1, function()
			if var_36_2 then
				local var_37_0 = var_36_0:getChapterById(var_36_2)

				arg_1_0.viewComponent:switchToChapter(var_37_0)
			end
		end)
	end)
	arg_1_0:bind(var_0_0.ON_BOSSRUSH_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
	end)
	arg_1_0:bind(var_0_0.ON_BOSSSINGLE_MAP, function(arg_39_0, arg_39_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.OTHERWORLD_MAP, arg_39_1)
	end)
	arg_1_0:bind(var_0_0.ON_CLUE_MAP, function()
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CLUE_MAP)
	end)
	arg_1_0:bind(var_0_0.GO_ACT_SHOP, function()
		local var_41_0 = pg.gameset.activity_res_id.key_value
		local var_41_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

		if var_41_1 and var_41_1:getConfig("config_client").resId == var_41_0 and not var_41_1:isEnd() then
			arg_1_0:addSubLayers(Context.New({
				mediator = LotteryMediator,
				viewComponent = LotteryLayer,
				data = {
					activityId = var_41_1.id
				}
			}), false)
		else
			local var_41_2 = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_42_0)
				return arg_42_0:getConfig("config_client").pt_id == var_41_0
			end)
			local var_41_3 = var_41_2 and var_41_2.id

			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = var_41_3
			})
		end
	end)
	arg_1_0:bind(var_0_0.SHOW_ATELIER_BUFF, function(arg_43_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = AtelierBuffMediator,
			viewComponent = AtelierBuffLayer
		}))
	end)
	arg_1_0:bind(var_0_0.ON_SHIP_DETAIL, function(arg_44_0, arg_44_1)
		arg_1_0.contextData.selectedChapterVO = arg_44_1.chapter

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_44_1.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_FLEET_SHIPINFO, function(arg_45_0, arg_45_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_45_1.shipId,
			shipVOs = arg_45_1.shipVOs
		})

		arg_1_0.contextData.editEliteChapter = arg_45_1.chapter.id
	end)
	arg_1_0:bind(var_0_0.ON_SUPPORT_SHIPINFO, function(arg_46_0, arg_46_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_46_1.shipId,
			shipVOs = arg_46_1.shipVOs
		})

		arg_1_0.contextData.selectedChapterVO = arg_46_1.chapter
	end)
	arg_1_0:bind(var_0_0.ON_STAGE_SHIPINFO, function(arg_47_0, arg_47_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_47_1.shipId,
			shipVOs = arg_47_1.shipVOs
		})
	end)
	arg_1_0:bind(var_0_0.ON_EXTRA_RANK, function(arg_48_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_EXTRA_CHAPTER
		})
	end)
	arg_1_0:bind(var_0_0.ON_STRATEGYING_CHAPTER, function(arg_49_0)
		local var_49_0 = getProxy(ChapterProxy)
		local var_49_1 = var_49_0:getActiveChapter()

		assert(var_49_1)

		local var_49_2 = var_49_0:getMapById(var_49_1:getConfig("map"))

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_forward",
			content = i18n("levelScene_chapter_is_activation", string.split(var_49_2:getConfig("name"), "|")[1] .. ":" .. var_49_1:getConfig("chapter_name")),
			onYes = function()
				arg_1_0.viewComponent:switchToChapter(var_49_1)
			end,
			onNo = function()
				arg_1_0.contextData.chapterVO = var_49_1

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
	arg_1_0:bind(var_0_0.ON_COMMANDER_SKILL, function(arg_53_0, arg_53_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = arg_53_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_PERFORM_COMBAT, function(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = arg_54_1,
			exitCallback = arg_54_2,
			memory = arg_54_3
		})
	end)
	arg_1_0:bind(var_0_0.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN, function(arg_55_0)
		arg_1_0:sendNotification(GAME.GET_REMASTER_TICKETS)
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_TASK, function(arg_56_0, arg_56_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_56_1)
	end)
	arg_1_0:bind(var_0_0.ON_START, function(arg_57_0)
		local var_57_0 = getProxy(ChapterProxy):getActiveChapter()

		assert(var_57_0)

		local var_57_1 = var_57_0.fleet
		local var_57_2 = var_57_0:getStageId(var_57_1.line.row, var_57_1.line.column)

		seriesAsync({
			function(arg_58_0)
				local var_58_0 = {}

				for iter_58_0, iter_58_1 in pairs(var_57_1.ships) do
					table.insert(var_58_0, iter_58_1)
				end

				Fleet.EnergyCheck(var_58_0, var_57_1.name, function(arg_59_0)
					if arg_59_0 then
						arg_58_0()
					end
				end, function(arg_60_0)
					if not arg_60_0 then
						getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.SHIP_ENERGY_LOW)
					end
				end)
			end,
			function(arg_61_0)
				if getProxy(PlayerProxy):getRawData():GoldMax(1) then
					local var_61_0 = i18n("gold_max_tip_title") .. i18n("resource_max_tip_battle")

					getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.GOLD_MAX)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = var_61_0,
						onYes = arg_61_0,
						weight = LayerWeightConst.SECOND_LAYER
					})
				else
					arg_61_0()
				end
			end,
			function(arg_62_0)
				arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
					system = SYSTEM_SCENARIO,
					stageId = var_57_2
				})
			end
		})
	end)
	arg_1_0:bind(arg_1_0.ON_ENTER_MAINLEVEL, function(arg_63_0, arg_63_1)
		arg_1_0:DidEnterLevelMainUI(arg_63_1)
	end)
	arg_1_0:bind(arg_1_0.ON_DIDENTER, function(arg_64_0)
		arg_1_0.viewComponent:emit(LevelMediator2.UPDATE_EVENT_LIST)
	end)
	arg_1_0:bind(var_0_0.ENTER_WORLD, function(arg_65_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD)
	end)
	arg_1_0:bind(var_0_0.ON_CHAPTER_REMASTER_AWARD, function(arg_66_0, arg_66_1, arg_66_2)
		arg_1_0:sendNotification(GAME.CHAPTER_REMASTER_AWARD_RECEIVE, {
			chapterId = arg_66_1,
			pos = arg_66_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_OPEN_ACT_BOSS_BATTLE, function(arg_67_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACT_BOSS_BATTLE, {
			showAni = true
		})
	end)
	arg_1_0:bind(LevelUIConst.OPEN_NORMAL_CONTINUOUS_WINDOW, function(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4)
		local var_68_0 = _.map(arg_68_2, function(arg_69_0)
			local var_69_0 = getProxy(FleetProxy):getFleetById(arg_69_0)

			if not var_69_0 or var_69_0:getFleetType() == FleetType.Submarine then
				return
			end

			return var_69_0
		end)

		arg_1_0:DisplayContinuousWindow(arg_68_1, var_68_0, arg_68_3, arg_68_4)
	end)
	arg_1_0:bind(LevelUIConst.OPEN_ELITE_CONTINUOUS_WINDOW, function(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
		local var_70_0 = arg_70_1:getEliteFleetList()
		local var_70_1 = getProxy(BayProxy):getRawData()
		local var_70_2 = _.map(var_70_0, function(arg_71_0)
			if #arg_71_0 == 0 or _.any(arg_71_0, function(arg_72_0)
				local var_72_0 = var_70_1[arg_72_0]

				return var_72_0 and var_72_0:getTeamType() == TeamType.Submarine
			end) then
				return
			end

			return TypedFleet.New({
				fleetType = FleetType.Normal,
				ship_list = arg_71_0
			})
		end)

		arg_1_0:DisplayContinuousWindow(arg_70_1, var_70_2, arg_70_2, arg_70_3)
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

	local var_1_6 = var_1_4:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK)

	for iter_1_0, iter_1_1 in ipairs(var_1_6) do
		if iter_1_1:getConfig("config_id") == pg.gameset.activity_res_id.key_value then
			arg_1_0.viewComponent:updatePtActivity(iter_1_1)

			break
		end
	end

	local var_1_7 = getProxy(DailyLevelProxy)

	arg_1_0.viewComponent:setEliteQuota(var_1_7.eliteCount, pg.gameset.elite_quota.key_value)
	getProxy(ChapterProxy):updateActiveChapterShips()

	local var_1_8 = getProxy(BagProxy):getItemsByType(Item.SPECIAL_OPERATION_TICKET)

	arg_1_0.viewComponent:setSpecialOperationTickets(var_1_8)
end

function var_0_0.DidEnterLevelMainUI(arg_73_0, arg_73_1)
	arg_73_0.viewComponent:setMap(arg_73_1)

	if arg_73_0.contextData.openChapterId then
		arg_73_0.viewComponent.mapBuilder:TryOpenChapter(arg_73_0.contextData.openChapterId)

		arg_73_0.contextData.openChapterId = nil
	end

	local var_73_0 = arg_73_0.contextData.chapterVO

	if var_73_0 and var_73_0.active then
		arg_73_0.viewComponent:switchToChapter(var_73_0)
	elseif arg_73_0.contextData.map:isSkirmish() then
		arg_73_0.viewComponent:ShowCurtains(true)
		arg_73_0.viewComponent:doPlayAnim("TV01", function(arg_74_0)
			go(arg_74_0):SetActive(false)
			arg_73_0.viewComponent:ShowCurtains(false)
		end)
	end

	if arg_73_0.contextData.preparedTaskList and #arg_73_0.contextData.preparedTaskList > 0 then
		for iter_73_0, iter_73_1 in ipairs(arg_73_0.contextData.preparedTaskList) do
			arg_73_0:sendNotification(GAME.SUBMIT_TASK, iter_73_1)
		end

		table.clean(arg_73_0.contextData.preparedTaskList)
	end

	if arg_73_0.contextData.StopAutoFightFlag then
		local var_73_1 = getProxy(ChapterProxy)
		local var_73_2 = var_73_1:getActiveChapter()

		if var_73_2 then
			var_73_1:SetChapterAutoFlag(var_73_2.id, false)

			local var_73_3 = bit.bor(ChapterConst.DirtyAttachment, ChapterConst.DirtyStrategy)

			arg_73_0.viewComponent:updateChapterVO(var_73_2, var_73_3)
		end

		arg_73_0.contextData.StopAutoFightFlag = nil
	end

	if arg_73_0.contextData.ToTrackingData then
		arg_73_0:sendNotification(arg_73_0.contextData.ToTrackingData[1], arg_73_0.contextData.ToTrackingData[2])

		arg_73_0.contextData.ToTrackingData = nil
	end
end

function var_0_0.RegisterTrackEvent(arg_75_0)
	arg_75_0:bind(var_0_0.ON_TRACKING, function(arg_76_0, arg_76_1, arg_76_2, arg_76_3, arg_76_4, arg_76_5)
		local var_76_0 = getProxy(ChapterProxy):getChapterById(arg_76_1, true)
		local var_76_1 = getProxy(ChapterProxy):GetLastFleetIndex()

		arg_75_0:sendNotification(GAME.TRACKING, {
			chapterId = arg_76_1,
			fleetIds = var_76_1,
			loopFlag = arg_76_2,
			operationItem = arg_76_3,
			duties = arg_76_4,
			autoFightFlag = arg_76_5
		})
	end)
	arg_75_0:bind(var_0_0.ON_ELITE_TRACKING, function(arg_77_0, arg_77_1, arg_77_2, arg_77_3, arg_77_4, arg_77_5)
		arg_75_0:sendNotification(GAME.TRACKING, {
			chapterId = arg_77_1,
			loopFlag = arg_77_2,
			operationItem = arg_77_3,
			duties = arg_77_4,
			autoFightFlag = arg_77_5
		})
	end)
	arg_75_0:bind(var_0_0.ON_RETRACKING, function(arg_78_0, arg_78_1, arg_78_2)
		local var_78_0 = arg_78_1.duties
		local var_78_1 = arg_78_1:getConfig("type") == Chapter.CustomFleet
		local var_78_2 = arg_78_1:GetActiveSPItemID()

		if var_78_1 then
			arg_75_0.viewComponent:emit(LevelMediator2.ON_ELITE_TRACKING, arg_78_1.id, arg_78_1.loopFlag, var_78_2, var_78_0, arg_78_2)
		else
			arg_75_0.viewComponent:emit(LevelMediator2.ON_TRACKING, arg_78_1.id, arg_78_1.loopFlag, var_78_2, var_78_0, arg_78_2)
		end
	end)
end

function var_0_0.NoticeVoteBook(arg_79_0, arg_79_1)
	arg_79_1()
end

function var_0_0.TryPlaySubGuide(arg_80_0)
	arg_80_0.viewComponent:tryPlaySubGuide()
end

function var_0_0.listNotificationInterests(arg_81_0)
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

function var_0_0.handleNotification(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_1:getName()
	local var_82_1 = arg_82_1:getBody()

	if var_82_0 == GAME.BEGIN_STAGE_DONE then
		arg_82_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_82_1)
	elseif var_82_0 == VoteProxy.VOTE_ORDER_BOOK_DELETE or VoteProxy.VOTE_ORDER_BOOK_UPDATE == var_82_0 then
		arg_82_0.viewComponent:updateVoteBookBtn()
	elseif var_82_0 == PlayerProxy.UPDATED then
		arg_82_0.viewComponent:updateRes(var_82_1)
	elseif var_82_0 == var_0_0.ON_TRACKING or var_82_0 == var_0_0.ON_ELITE_TRACKING or var_82_0 == var_0_0.ON_RETRACKING then
		arg_82_0.viewComponent:emit(var_82_0, unpackEx(var_82_1))
	elseif var_82_0 == GAME.TRACKING_DONE then
		arg_82_0.waitingTracking = nil

		arg_82_0.viewComponent:resetLevelGrid()

		arg_82_0.viewComponent.FirstEnterChapter = var_82_1.id

		arg_82_0.viewComponent:switchToChapter(var_82_1)
	elseif var_82_0 == ChapterProxy.CHAPTER_UPDATED then
		arg_82_0.viewComponent:updateChapterVO(var_82_1.chapter, var_82_1.dirty)
	elseif var_82_0 == GAME.COMMANDER_ELIT_FORMATION_OP_DONE then
		if arg_82_0.contextData.commanderOPChapter then
			local var_82_2 = getProxy(ChapterProxy):getChapterById(var_82_1.chapterId)

			arg_82_0.contextData.commanderOPChapter.eliteCommanderList = var_82_2.eliteCommanderList

			arg_82_0.viewComponent:RefreshFleetSelectView(arg_82_0.contextData.commanderOPChapter)
		end
	elseif var_82_0 == GAME.CHAPTER_OP_DONE then
		local var_82_3

		local function var_82_4()
			if var_82_3 and coroutine.status(var_82_3) == "suspended" then
				local var_83_0, var_83_1 = coroutine.resume(var_82_3)

				assert(var_83_0, debug.traceback(var_82_3, var_83_1))
			end
		end

		var_82_3 = coroutine.create(function()
			local var_84_0 = var_82_1.type
			local var_84_1 = arg_82_0.contextData.chapterVO
			local var_84_2 = var_84_1:IsAutoFight()

			if var_84_0 == ChapterConst.OpRetreat and not var_82_1.id then
				var_84_1 = var_82_1.finalChapterLevelData

				if var_82_1.exittype and var_82_1.exittype == ChapterConst.ExitFromMap then
					arg_82_0.viewComponent:setChapter(nil)
					arg_82_0.viewComponent.mapBuilder:UpdateChapterTF(var_84_1.id)
					arg_82_0:OnExitChapter(var_84_1, var_82_1.win, var_82_1.extendData)

					return
				end

				if var_84_1:existOni() then
					local var_84_3 = var_84_1:checkOniState()

					if var_84_3 then
						arg_82_0.viewComponent:displaySpResult(var_84_3, var_82_4)
						coroutine.yield()
					end
				end

				if var_84_1:isPlayingWithBombEnemy() then
					arg_82_0.viewComponent:displayBombResult(var_82_4)
					coroutine.yield()
				end
			end

			local var_84_4 = var_82_1.items
			local var_84_5

			if var_84_4 and #var_84_4 > 0 then
				if var_84_0 == ChapterConst.OpBox then
					local var_84_6 = var_84_1.fleet.line
					local var_84_7 = var_84_1:getChapterCell(var_84_6.row, var_84_6.column)

					if pg.box_data_template[var_84_7.attachmentId].type == ChapterConst.BoxDrop and ChapterConst.IsAtelierMap(arg_82_0.contextData.map) then
						local var_84_8 = _.filter(var_84_4, function(arg_85_0)
							return arg_85_0.type == DROP_TYPE_RYZA_DROP
						end)

						if #var_84_8 > 0 then
							var_84_5 = AwardInfoLayer.TITLE.RYZA

							local var_84_9 = math.random(#var_84_8)
							local var_84_10 = AtelierMaterial.New({
								configId = var_84_8[var_84_9].id
							}):GetVoices()

							if var_84_10 and #var_84_10 > 0 then
								local var_84_11 = var_84_10[math.random(#var_84_10)]
								local var_84_12, var_84_13, var_84_14 = ShipWordHelper.GetWordAndCV(var_84_11[1], var_84_11[2], nil, PLATFORM_CODE ~= PLATFORM_US)

								arg_82_0.viewComponent:emit(LevelUIConst.ADD_TOAST_QUEUE, {
									iconScale = 0.75,
									Class = LevelStageAtelierMaterialToast,
									title = i18n("ryza_tip_toast_item_got"),
									desc = var_84_14,
									voice = var_84_13,
									icon = var_84_11[3]
								})
							end
						end
					end
				end

				seriesAsync({
					function(arg_86_0)
						getProxy(ChapterProxy):AddExtendChapterDataArray(var_84_1.id, "TotalDrops", _.filter(var_84_4, function(arg_87_0)
							return arg_87_0.type ~= DROP_TYPE_STRATEGY
						end))
						arg_82_0.viewComponent:emit(BaseUI.ON_WORLD_ACHIEVE, {
							items = var_84_4,
							title = var_84_5,
							closeOnCompleted = var_84_2,
							removeFunc = arg_86_0
						})
					end,
					function(arg_88_0)
						if var_84_0 == ChapterConst.OpBox and _.any(var_84_4, function(arg_89_0)
							if arg_89_0.type ~= DROP_TYPE_VITEM then
								return false
							end

							return arg_89_0:getConfig("virtual_type") == 1
						end) then
							(function()
								local var_90_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)

								if not var_90_0 then
									return
								end

								local var_90_1 = pg.activity_event_picturepuzzle[var_90_0.id]

								if not var_90_1 then
									return
								end

								if #table.mergeArray(var_90_0.data1_list, var_90_0.data2_list, true) < #var_90_1.pickup_picturepuzzle + #var_90_1.drop_picturepuzzle then
									return
								end

								local var_90_2 = var_90_0:getConfig("config_client").comStory

								pg.NewStoryMgr.GetInstance():Play(var_90_2, arg_88_0)
							end)()
						end

						if _.any(var_84_4, function(arg_91_0)
							if arg_91_0.type ~= DROP_TYPE_STRATEGY then
								return false
							end

							return pg.strategy_data_template[arg_91_0.id].type == ChapterConst.StgTypeConsume
						end) then
							arg_82_0.viewComponent.levelStageView:popStageStrategy()
						end

						arg_88_0()
					end
				}, var_82_4)
				coroutine.yield()
			end

			assert(var_84_1)

			if var_84_0 == ChapterConst.OpSkipBattle or var_84_0 == ChapterConst.OpPreClear then
				arg_82_0.viewComponent.levelStageView:tryAutoAction(function()
					if not arg_82_0.viewComponent.levelStageView then
						return
					end

					arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
				end)
			elseif var_84_0 == ChapterConst.OpRetreat then
				local var_84_15 = getProxy(ContextProxy):getContextByMediator(LevelMediator2)

				if var_84_15 then
					local var_84_16 = {}
					local var_84_17 = var_84_15:getContextByMediator(ChapterPreCombatMediator)

					if var_84_17 then
						table.insert(var_84_16, var_84_17)
					end

					_.each(var_84_16, function(arg_93_0)
						arg_82_0:sendNotification(GAME.REMOVE_LAYERS, {
							context = arg_93_0
						})
					end)
				end

				if var_82_1.id then
					return
				end

				local var_84_18 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN)

				if var_84_18 and not var_84_18.autoActionForbidden and not var_84_18.achieved and var_84_18.data1 == 7 and var_84_1.id == 204 and var_84_1:isClear() then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						modal = true,
						hideNo = true,
						content = "有新的签到奖励可以领取，点击确定前往",
						onYes = function()
							arg_82_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
						end,
						onNo = function()
							arg_82_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
						end
					})

					return
				end

				arg_82_0:OnExitChapter(var_84_1, var_82_1.win, var_82_1.extendData)
			elseif var_84_0 == ChapterConst.OpMove then
				seriesAsync({
					function(arg_96_0)
						var_84_1 = arg_82_0.contextData.chapterVO

						local var_96_0 = var_82_1.fullpath[#var_82_1.fullpath]

						var_84_1.fleet.line = Clone(var_96_0)

						getProxy(ChapterProxy):updateChapter(var_84_1)
						arg_82_0.viewComponent.grid:moveFleet(var_82_1.path, var_82_1.fullpath, var_82_1.oldLine, arg_96_0)
					end,
					function(arg_97_0)
						if not var_82_1.teleportPaths then
							arg_97_0()

							return
						end

						local var_97_0 = var_82_1.teleportPaths[1]
						local var_97_1 = var_82_1.teleportPaths[2]

						if not var_97_0 or not var_97_1 then
							arg_97_0()

							return
						end

						var_84_1 = arg_82_0.contextData.chapterVO

						local var_97_2 = var_84_1:getFleet(FleetType.Normal, var_97_0.row, var_97_0.column)

						if not var_97_2 then
							arg_97_0()

							return
						end

						var_97_2.line = Clone(var_82_1.teleportPaths[2])

						getProxy(ChapterProxy):updateChapter(var_84_1)

						local var_97_3 = arg_82_0:getViewComponent().grid:GetCellFleet(var_97_2.id)

						arg_82_0:getViewComponent().grid:TeleportCellByPortalWithCameraMove(var_97_2, var_97_3, var_82_1.teleportPaths, arg_97_0)
					end,
					function(arg_98_0)
						arg_82_0:playAIActions(var_82_1.aiActs, var_82_1.extraFlag, arg_98_0)
					end
				}, function()
					var_84_1 = arg_82_0.contextData.chapterVO

					local var_99_0 = var_84_1.fleet:getStrategies()

					if _.any(var_99_0, function(arg_100_0)
						return arg_100_0.id == ChapterConst.StrategyExchange and arg_100_0.count > 0
					end) then
						arg_82_0.viewComponent.levelStageView:popStageStrategy()
					end

					arg_82_0.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
					arg_82_0.viewComponent.levelStageView:updateAmbushRate(var_84_1.fleet.line, true)
					arg_82_0.viewComponent.levelStageView:updateStageStrategy()
					arg_82_0.viewComponent.levelStageView:updateFleetBuff()
					arg_82_0.viewComponent.levelStageView:updateBombPanel()
					arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
				end)
			elseif var_84_0 == ChapterConst.OpAmbush then
				arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_84_0 == ChapterConst.OpBox then
				arg_82_0:playAIActions(var_82_1.aiActs, var_82_1.extraFlag, function()
					if not arg_82_0.viewComponent.levelStageView then
						return
					end

					arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
				end)
			elseif var_84_0 == ChapterConst.OpStory then
				arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_84_0 == ChapterConst.OpSwitch then
				arg_82_0.viewComponent.grid:adjustCameraFocus()
			elseif var_84_0 == ChapterConst.OpEnemyRound then
				arg_82_0:playAIActions(var_82_1.aiActs, var_82_1.extraFlag, function()
					arg_82_0.viewComponent.levelStageView:updateBombPanel(true)

					local var_102_0 = var_84_1.fleet:getStrategies()

					if _.any(var_102_0, function(arg_103_0)
						return arg_103_0.id == ChapterConst.StrategyExchange and arg_103_0.count > 0
					end) then
						arg_82_0.viewComponent.levelStageView:updateStageStrategy()
						arg_82_0.viewComponent.levelStageView:popStageStrategy()
					end

					arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
					arg_82_0.viewComponent:updatePoisonAreaTip()
				end)
			elseif var_84_0 == ChapterConst.OpSubState then
				arg_82_0:saveSubState(var_84_1.subAutoAttack)
				arg_82_0.viewComponent.grid:OnChangeSubAutoAttack()
			elseif var_84_0 == ChapterConst.OpStrategy then
				if var_82_1.arg1 == ChapterConst.StrategyExchange then
					local var_84_19 = var_84_1.fleet:findSkills(FleetSkill.TypeStrategy)

					for iter_84_0, iter_84_1 in ipairs(var_84_19) do
						if iter_84_1:GetType() == FleetSkill.TypeStrategy and iter_84_1:GetArgs()[1] == ChapterConst.StrategyExchange then
							local var_84_20 = var_84_1.fleet:findCommanderBySkillId(iter_84_1.id)

							arg_82_0.viewComponent:doPlayCommander(var_84_20)

							break
						end
					end
				end

				arg_82_0:playAIActions(var_82_1.aiActs, var_82_1.extraFlag, function()
					arg_82_0.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				end)
			elseif var_84_0 == ChapterConst.OpSupply then
				arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_84_0 == ChapterConst.OpBarrier then
				arg_82_0.viewComponent.levelStageView:tryAutoTrigger()
			elseif var_84_0 == ChapterConst.OpSubTeleport then
				seriesAsync({
					function(arg_105_0)
						local var_105_0 = _.detect(var_84_1.fleets, function(arg_106_0)
							return arg_106_0.id == var_82_1.id
						end)

						var_105_0.line = {
							row = var_82_1.arg1,
							column = var_82_1.arg2
						}
						var_105_0.startPos = {
							row = var_82_1.arg1,
							column = var_82_1.arg2
						}

						local var_105_1 = var_82_1.fullpath[1]
						local var_105_2 = var_82_1.fullpath[#var_82_1.fullpath]
						local var_105_3 = var_84_1:findPath(nil, var_105_1, var_105_2)
						local var_105_4 = pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2]
						local var_105_5 = math.ceil(var_105_4 * #var_105_0:getShips(false) * var_105_3 - 1e-05)
						local var_105_6 = getProxy(PlayerProxy)
						local var_105_7 = var_105_6:getData()

						var_105_7:consume({
							oil = var_105_5
						})
						arg_82_0.viewComponent:updateRes(var_105_7)
						var_105_6:updatePlayer(var_105_7)
						arg_82_0.viewComponent.grid:moveSub(table.indexof(var_84_1.fleets, var_105_0), var_82_1.fullpath, nil, function()
							local var_107_0 = bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampionPosition)

							getProxy(ChapterProxy):updateChapter(var_84_1, var_107_0)

							var_84_1 = arg_82_0.contextData.chapterVO

							arg_105_0()
						end)
					end,
					function(arg_108_0)
						if not var_82_1.teleportPaths then
							arg_108_0()

							return
						end

						local var_108_0 = var_82_1.teleportPaths[1]
						local var_108_1 = var_82_1.teleportPaths[2]

						if not var_108_0 or not var_108_1 then
							arg_108_0()

							return
						end

						local var_108_2 = _.detect(var_84_1.fleets, function(arg_109_0)
							return arg_109_0.id == var_82_1.id
						end)

						var_108_2.startPos = Clone(var_82_1.teleportPaths[2])
						var_108_2.line = Clone(var_82_1.teleportPaths[2])

						local var_108_3 = arg_82_0:getViewComponent().grid:GetCellFleet(var_108_2.id)

						arg_82_0:getViewComponent().grid:TeleportFleetByPortal(var_108_3, var_82_1.teleportPaths, function()
							local var_110_0 = bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampionPosition)

							getProxy(ChapterProxy):updateChapter(var_84_1, var_110_0)

							var_84_1 = arg_82_0.contextData.chapterVO

							arg_108_0()
						end)
					end,
					function(arg_111_0)
						arg_82_0.viewComponent.levelStageView:SwitchBottomStagePanel(false)
						arg_82_0.viewComponent.grid:TurnOffSubTeleport()
						arg_82_0.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
					end
				})
			end
		end)

		var_82_4()
	elseif var_82_0 == ChapterProxy.CHAPTER_TIMESUP then
		arg_82_0:onTimeUp()
	elseif var_82_0 == GAME.EVENT_LIST_UPDATE then
		arg_82_0.viewComponent:addbubbleMsgBox(function(arg_112_0)
			arg_82_0:OnEventUpdate(arg_112_0)
		end)
	elseif var_82_0 == GAME.VOTE_BOOK_BE_UPDATED_DONE then
		arg_82_0.viewComponent:addbubbleMsgBox(function(arg_113_0)
			arg_82_0:NoticeVoteBook(arg_113_0)
		end)
	elseif var_82_0 == DailyLevelProxy.ELITE_QUOTA_UPDATE then
		local var_82_5 = getProxy(DailyLevelProxy)

		arg_82_0.viewComponent:setEliteQuota(var_82_5.eliteCount, pg.gameset.elite_quota.key_value)
	elseif var_82_0 == ActivityProxy.ACTIVITY_OPERATION_DONE then
		arg_82_0.viewComponent.mapBuilder:UpdateMapItems()
	elseif var_82_0 == ActivityProxy.ACTIVITY_UPDATED then
		if var_82_1 and var_82_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_RANK then
			arg_82_0.viewComponent:updatePtActivity(var_82_1)
		end
	elseif var_82_0 == GAME.GET_REMASTER_TICKETS_DONE then
		arg_82_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_82_1, function()
			arg_82_0.viewComponent:updateRemasterTicket()
		end)
	elseif var_82_0 == CommanderProxy.PREFAB_FLEET_UPDATE then
		local var_82_6 = getProxy(CommanderProxy):getPrefabFleet()

		arg_82_0.viewComponent:setCommanderPrefabs(var_82_6)
		arg_82_0.viewComponent:updateCommanderPrefab()
	elseif var_82_0 == GAME.COOMMANDER_EQUIP_TO_FLEET_DONE then
		local var_82_7 = getProxy(FleetProxy):GetRegularFleets()

		arg_82_0.viewComponent:updateFleet(var_82_7)
		arg_82_0.viewComponent:RefreshFleetSelectView()
	elseif var_82_0 == GAME.SUBMIT_TASK_DONE then
		if arg_82_0.contextData.map and arg_82_0.contextData.map:isSkirmish() then
			arg_82_0.viewComponent.mapBuilder:UpdateMapItems()
		end

		arg_82_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_82_1, function()
			if arg_82_0.contextData.map and arg_82_0.contextData.map:isSkirmish() and arg_82_0.contextData.TaskToSubmit then
				local var_115_0 = arg_82_0.contextData.TaskToSubmit

				arg_82_0.contextData.TaskToSubmit = nil

				arg_82_0:sendNotification(GAME.SUBMIT_TASK, var_115_0)
			end

			arg_82_0.viewComponent.mapBuilder:OnSubmitTaskDone()
		end)
	elseif var_82_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		arg_82_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_82_1.awards, function()
			arg_82_0.viewComponent.mapBuilder:OnSubmitTaskDone()
		end)
	elseif var_82_0 == BagProxy.ITEM_UPDATED then
		local var_82_8 = getProxy(BagProxy):getItemsByType(Item.SPECIAL_OPERATION_TICKET)

		arg_82_0.viewComponent:setSpecialOperationTickets(var_82_8)
	elseif var_82_0 == ChapterProxy.CHAPTER_AUTO_FIGHT_FLAG_UPDATED then
		if not arg_82_0:getViewComponent().levelStageView then
			return
		end

		arg_82_0:getViewComponent().levelStageView:ActionInvoke("UpdateAutoFightMark")
	elseif var_82_0 == ChapterProxy.CHAPTER_SKIP_PRECOMBAT_UPDATED then
		if not arg_82_0:getViewComponent().levelStageView then
			return
		end

		arg_82_0:getViewComponent().levelStageView:ActionInvoke("UpdateSkipPreCombatMark")
	elseif var_82_0 == ChapterProxy.CHAPTER_REMASTER_INFO_UPDATED or var_82_0 == GAME.CHAPTER_REMASTER_INFO_REQUEST_DONE then
		arg_82_0.viewComponent:updateRemasterInfo()
		arg_82_0.viewComponent:updateRemasterBtnTip()
	elseif var_82_0 == GAME.CHAPTER_REMASTER_AWARD_RECEIVE_DONE then
		arg_82_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_82_1)
	elseif var_82_0 == GAME.STORY_UPDATE_DONE then
		arg_82_0.cachedStoryAwards = var_82_1
	elseif var_82_0 == GAME.STORY_END then
		if arg_82_0.cachedStoryAwards then
			arg_82_0.viewComponent:emit(BaseUI.ON_ACHIEVE, arg_82_0.cachedStoryAwards.awards)

			arg_82_0.cachedStoryAwards = nil
		end
	elseif var_82_0 == LevelUIConst.CONTINUOUS_OPERATION then
		arg_82_0.viewComponent:emit(LevelUIConst.CONTINUOUS_OPERATION, var_82_1)
	elseif var_82_0 == GAME.TRACKING_ERROR then
		if arg_82_0.waitingTracking then
			arg_82_0:DisplayContinuousOperationResult(var_82_1.chapter, getProxy(ChapterProxy):PopContinuousData(SYSTEM_SCENARIO))
		end

		arg_82_0.waitingTracking = nil
	elseif var_82_0 == var_0_0.ON_SPITEM_CHANGED then
		arg_82_0.viewComponent:emit(var_0_0.ON_SPITEM_CHANGED, var_82_1)
	end
end

function var_0_0.OnExitChapter(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	assert(arg_117_1)
	seriesAsync({
		function(arg_118_0)
			if not arg_117_0.contextData.chapterVO then
				return arg_118_0()
			end

			arg_117_0.viewComponent:switchToMap(arg_118_0)
		end,
		function(arg_119_0)
			arg_117_0.viewComponent:addbubbleMsgBox(function()
				arg_117_0.viewComponent:CleanBubbleMsgbox()
				arg_119_0()
			end)
		end,
		function(arg_121_0)
			if not arg_117_2 then
				return arg_121_0()
			end

			local var_121_0 = getProxy(PlayerProxy):getData()

			if arg_117_1.id == 103 and not var_121_0:GetCommonFlag(BATTLE_AUTO_ENABLED) then
				arg_117_0.viewComponent:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("battle_autobot_unlock"),
					onYes = arg_121_0,
					onNo = arg_121_0
				})
				arg_117_0.viewComponent:emit(LevelMediator2.NOTICE_AUTOBOT_ENABLED, {})

				return
			end

			arg_121_0()
		end,
		function(arg_122_0)
			if not arg_117_2 then
				return arg_122_0()
			end

			if getProxy(ChapterProxy):getMapById(arg_117_1:getConfig("map")):isSkirmish() then
				local var_122_0 = arg_117_1.id
				local var_122_1 = getProxy(SkirmishProxy):getRawData()
				local var_122_2 = _.detect(var_122_1, function(arg_123_0)
					return tonumber(arg_123_0:getConfig("event")) == var_122_0
				end)

				if not var_122_2 then
					arg_122_0()

					return
				end

				local var_122_3 = getProxy(TaskProxy)
				local var_122_4 = var_122_2:getConfig("task_id")
				local var_122_5 = var_122_3:getTaskVO(var_122_4)

				if var_122_5 and var_122_5:getTaskStatus() == 1 then
					arg_117_0:sendNotification(GAME.SUBMIT_TASK, var_122_4)

					if var_122_2 == var_122_1[#var_122_1] then
						local var_122_6 = getProxy(ActivityProxy)
						local var_122_7 = ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE
						local var_122_8 = var_122_6:getActivityById(var_122_7)

						assert(var_122_8, "Missing Skirmish Activity " .. (var_122_7 or "NIL"))

						local var_122_9 = var_122_8:getConfig("config_data")
						local var_122_10 = var_122_9[#var_122_9][2]
						local var_122_11 = var_122_3:getTaskVO(var_122_10)

						if var_122_11 and var_122_11:getTaskStatus() < 2 then
							arg_117_0.contextData.TaskToSubmit = var_122_10
						end
					end
				end
			end

			arg_122_0()
		end,
		function(arg_124_0)
			if not arg_117_2 then
				return arg_124_0()
			end

			local var_124_0 = getProxy(ChapterProxy):getMapById(arg_117_1:getConfig("map"))

			if var_124_0:isRemaster() then
				local var_124_1 = var_124_0:getRemaster()
				local var_124_2 = pg.re_map_template[var_124_1]
				local var_124_3 = Map.GetRearChaptersOfRemaster(var_124_1)

				assert(var_124_3)

				if _.any(var_124_3, function(arg_125_0)
					return arg_125_0 == arg_117_1.id
				end) then
					local var_124_4 = var_124_2.memory_group
					local var_124_5 = pg.memory_group[var_124_4].memories

					if _.any(var_124_5, function(arg_126_0)
						return not pg.NewStoryMgr.GetInstance():IsPlayed(pg.memory_template[arg_126_0].story, true)
					end) then
						_.each(var_124_5, function(arg_127_0)
							local var_127_0 = pg.memory_template[arg_127_0].story
							local var_127_1, var_127_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_127_0)

							pg.NewStoryMgr.GetInstance():SetPlayedFlag(var_127_1)
						end)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							yesText = "text_go",
							content = i18n("levelScene_remaster_story_tip", pg.memory_group[var_124_4].title),
							weight = LayerWeightConst.SECOND_LAYER,
							onYes = function()
								arg_117_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
									page = WorldMediaCollectionScene.PAGE_MEMORTY,
									memoryGroup = var_124_4
								})
							end,
							onNo = function()
								local var_129_0 = getProxy(PlayerProxy):getRawData().id

								PlayerPrefs.SetInt("MEMORY_GROUP_NOTIFICATION" .. var_129_0 .. " " .. var_124_4, 1)
								PlayerPrefs.Save()
								arg_124_0()
							end
						})

						return
					end
				end
			end

			arg_124_0()
		end,
		function(arg_130_0)
			if arg_117_0.contextData.map and not arg_117_0.contextData.map:isUnlock() then
				arg_117_0.viewComponent:emit(var_0_0.ON_SWITCH_NORMAL_MAP)

				return
			end

			if not arg_117_3 then
				return arg_130_0()
			end

			local var_130_0 = arg_117_3 and arg_117_3.AutoFightFlag
			local var_130_1 = {}

			if arg_117_3 and arg_117_3.ResultDrops then
				for iter_130_0, iter_130_1 in ipairs(arg_117_3.ResultDrops) do
					var_130_1 = table.mergeArray(var_130_1, iter_130_1)
				end
			end

			local var_130_2 = {}

			if arg_117_3 and arg_117_3.TotalDrops then
				for iter_130_2, iter_130_3 in ipairs(arg_117_3.TotalDrops) do
					var_130_2 = table.mergeArray(var_130_2, iter_130_3)
				end
			end

			DropResultIntegration(var_130_2)

			local var_130_3 = getProxy(ChapterProxy):GetContinuousData(SYSTEM_SCENARIO)

			if var_130_3 then
				var_130_3:MergeDrops(var_130_2, var_130_1)
				var_130_3:MergeEvents(arg_117_3.ListEventNotify, arg_117_3.ListGuildEventNotify, arg_117_3.ListGuildEventAutoReceiveNotify)

				if arg_117_2 then
					var_130_3:ConsumeBattleTime()
				end

				if var_130_3:IsActive() and var_130_3:GetRestBattleTime() > 0 then
					arg_117_0.waitingTracking = true

					arg_117_0.viewComponent:emit(var_0_0.ON_RETRACKING, arg_117_1, var_130_0)

					return
				end

				getProxy(ChapterProxy):PopContinuousData(SYSTEM_SCENARIO)
				arg_117_0:DisplayContinuousOperationResult(arg_117_1, var_130_3)
				arg_130_0()

				return
			end

			local var_130_4 = var_130_0 ~= nil

			if not var_130_4 and not arg_117_3.ResultDrops then
				return arg_130_0()
			end

			local var_130_5
			local var_130_6

			if var_130_4 then
				var_130_5 = i18n("autofight_rewards")
				var_130_6 = i18n("total_rewards_subtitle")
			else
				var_130_5 = i18n("settle_rewards_title")
				var_130_6 = i18n("settle_rewards_subtitle")
			end

			arg_117_0:addSubLayers(Context.New({
				viewComponent = LevelStageTotalRewardPanel,
				mediator = LevelStageTotalRewardPanelMediator,
				data = {
					title = var_130_5,
					subTitle = var_130_6,
					chapter = arg_117_1,
					onClose = arg_130_0,
					rewards = var_130_2,
					resultRewards = var_130_1,
					events = arg_117_3.ListEventNotify,
					guildTasks = arg_117_3.ListGuildEventNotify,
					guildAutoReceives = arg_117_3.ListGuildEventAutoReceiveNotify,
					isAutoFight = var_130_0
				}
			}), true)
		end,
		function(arg_131_0)
			if Map.autoNextPage then
				Map.autoNextPage = nil

				triggerButton(arg_117_0.viewComponent.btnNext)
			end

			if arg_117_2 then
				arg_117_0.viewComponent:RefreshMapBG()
			end

			arg_117_0:TryPlaySubGuide()
		end
	})
end

function var_0_0.DisplayContinuousWindow(arg_132_0, arg_132_1, arg_132_2, arg_132_3, arg_132_4)
	local var_132_0 = arg_132_1:getConfig("oil")
	local var_132_1 = arg_132_1:getPlayType()
	local var_132_2 = 0
	local var_132_3 = 0

	if var_132_1 == ChapterConst.TypeMultiStageBoss then
		local var_132_4 = pg.chapter_model_multistageboss[arg_132_1.id]

		var_132_2 = _.reduce(var_132_4.boss_refresh, 0, function(arg_133_0, arg_133_1)
			return arg_133_0 + arg_133_1
		end)
		var_132_3 = #var_132_4.boss_refresh
	else
		var_132_2, var_132_3 = arg_132_1:getConfig("boss_refresh"), 1
	end

	local var_132_5 = arg_132_1:getConfig("use_oil_limit")

	table.Foreach(arg_132_2, function(arg_134_0, arg_134_1)
		local var_134_0 = arg_132_4[arg_134_0]

		if var_134_0 == ChapterFleet.DUTY_IDLE then
			return
		end

		local var_134_1 = arg_134_1:GetCostSum().oil

		if var_134_0 == ChapterFleet.DUTY_KILLALL then
			local var_134_2 = var_132_5[1] or 0
			local var_134_3 = var_134_1

			if var_134_2 > 0 then
				var_134_3 = math.min(var_134_3, var_134_2)
			end

			local var_134_4 = var_132_5[2] or 0
			local var_134_5 = var_134_1

			if var_134_4 > 0 then
				var_134_5 = math.min(var_134_5, var_134_4)
			end

			var_132_0 = var_132_0 + var_134_3 * var_132_2 + var_134_5 * var_132_3
		elseif var_134_0 == ChapterFleet.DUTY_CLEANPATH then
			local var_134_6 = var_132_5[1] or 0
			local var_134_7 = var_134_1

			if var_134_6 > 0 then
				var_134_7 = math.min(var_134_7, var_134_6)
			end

			var_132_0 = var_132_0 + var_134_7 * var_132_2
		elseif var_134_0 == ChapterFleet.DUTY_KILLBOSS then
			local var_134_8 = var_132_5[2] or 0
			local var_134_9 = var_134_1

			if var_134_8 > 0 then
				var_134_9 = math.min(var_134_9, var_134_8)
			end

			var_132_0 = var_132_0 + var_134_9 * var_132_3
		end
	end)

	local var_132_6 = arg_132_1:GetMaxBattleCount()
	local var_132_7 = arg_132_3 and arg_132_3 > 0
	local var_132_8 = arg_132_1:GetSpItems()
	local var_132_9 = var_132_8[1] and var_132_8[1].count or 0
	local var_132_10 = var_132_8[1] and var_132_8[1].id or 0
	local var_132_11 = arg_132_1:GetRestDailyBonus()

	arg_132_0:addSubLayers(Context.New({
		mediator = LevelContinuousOperationWindowMediator,
		viewComponent = LevelContinuousOperationWindow,
		data = {
			maxCount = var_132_6,
			oilCost = var_132_0,
			chapter = arg_132_1,
			extraRate = {
				rate = 2,
				enabled = var_132_7,
				extraCount = var_132_9,
				spItemId = var_132_10,
				freeBonus = var_132_11
			}
		}
	}))
end

function var_0_0.DisplayContinuousOperationResult(arg_135_0, arg_135_1, arg_135_2)
	local var_135_0 = i18n("autofight_rewards")
	local var_135_1 = i18n("total_rewards_subtitle")

	arg_135_0:addSubLayers(Context.New({
		viewComponent = LevelContinuousOperationTotalRewardPanel,
		mediator = LevelStageTotalRewardPanelMediator,
		data = {
			title = var_135_0,
			subTitle = var_135_1,
			chapter = arg_135_1,
			rewards = arg_135_2:GetDrops(),
			resultRewards = arg_135_2:GetSettlementDrops(),
			continuousData = arg_135_2,
			events = arg_135_2:GetEvents(1),
			guildTasks = arg_135_2:GetEvents(2),
			guildAutoReceives = arg_135_2:GetEvents(3)
		}
	}), true)
end

function var_0_0.OnEventUpdate(arg_136_0, arg_136_1)
	local var_136_0 = getProxy(EventProxy)

	arg_136_0.viewComponent:updateEvent(var_136_0)

	if pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_136_0.player.level, "EventMediator") and var_136_0.eventForMsg then
		local var_136_1 = var_136_0.eventForMsg.id or 0
		local var_136_2 = getProxy(ChapterProxy):getActiveChapter(true)

		if var_136_2 and var_136_2:IsAutoFight() then
			getProxy(ChapterProxy):AddExtendChapterDataArray(var_136_2.id, "ListEventNotify", var_136_1)
			existCall(arg_136_1)
		else
			local var_136_3 = pg.collection_template[var_136_1] and pg.collection_template[var_136_1].title or ""

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = false,
				hideNo = true,
				content = i18n("event_special_update", var_136_3),
				weight = LayerWeightConst.SECOND_LAYER,
				onYes = arg_136_1,
				onNo = arg_136_1
			})
		end

		var_136_0.eventForMsg = nil
	else
		existCall(arg_136_1)
	end
end

function var_0_0.onTimeUp(arg_137_0)
	local var_137_0 = getProxy(ChapterProxy):getActiveChapter()

	if var_137_0 and not var_137_0:inWartime() then
		local function var_137_1()
			arg_137_0:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		end

		if arg_137_0.contextData.chapterVO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("battle_preCombatMediator_timeout"),
				onYes = var_137_1,
				onNo = var_137_1
			})
		else
			var_137_1()
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_timeout"))
		end
	end
end

function var_0_0.getDockCallbackFuncs(arg_139_0, arg_139_1, arg_139_2, arg_139_3, arg_139_4)
	local var_139_0 = getProxy(ChapterProxy)

	local function var_139_1(arg_140_0, arg_140_1)
		local var_140_0, var_140_1 = ShipStatus.ShipStatusCheck("inElite", arg_140_0, arg_140_1, {
			inElite = arg_139_3:getConfig("formation")
		})

		if not var_140_0 then
			return var_140_0, var_140_1
		end

		for iter_140_0, iter_140_1 in pairs(arg_139_1) do
			if arg_140_0:isSameKind(iter_140_0) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end

		return true
	end

	local function var_139_2(arg_141_0, arg_141_1, arg_141_2)
		arg_141_1()
	end

	local function var_139_3(arg_142_0)
		local var_142_0 = arg_139_3:getEliteFleetList()[arg_139_4]

		if arg_139_2 then
			local var_142_1 = table.indexof(var_142_0, arg_139_2.id)

			assert(var_142_1)

			if arg_142_0[1] then
				var_142_0[var_142_1] = arg_142_0[1]
			else
				table.remove(var_142_0, var_142_1)
			end
		else
			table.insert(var_142_0, arg_142_0[1])
		end

		var_139_0:updateChapter(arg_139_3)
		var_139_0:duplicateEliteFleet(arg_139_3)
	end

	return var_139_1, var_139_2, var_139_3
end

function var_0_0.getSupportDockCallbackFuncs(arg_143_0, arg_143_1, arg_143_2, arg_143_3)
	local var_143_0 = getProxy(ChapterProxy)

	local function var_143_1(arg_144_0, arg_144_1)
		local var_144_0, var_144_1 = ShipStatus.ShipStatusCheck("inSupport", arg_144_0, arg_144_1)

		if not var_144_0 then
			return var_144_0, var_144_1
		end

		for iter_144_0, iter_144_1 in pairs(arg_143_1) do
			if arg_144_0:isSameKind(iter_144_0) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end

		return true
	end

	local function var_143_2(arg_145_0, arg_145_1, arg_145_2)
		arg_145_1()
	end

	local function var_143_3(arg_146_0)
		local var_146_0 = arg_143_3:getSupportFleet()

		if arg_143_2 then
			local var_146_1 = table.indexof(var_146_0, arg_143_2.id)

			assert(var_146_1)

			if arg_146_0[1] then
				var_146_0[var_146_1] = arg_146_0[1]
			else
				table.remove(var_146_0, var_146_1)
			end
		else
			table.insert(var_146_0, arg_146_0[1])
		end

		var_143_0:updateChapter(arg_143_3)
		var_143_0:duplicateSupportFleet(arg_143_3)
	end

	return var_143_1, var_143_2, var_143_3
end

function var_0_0.playAIActions(arg_147_0, arg_147_1, arg_147_2, arg_147_3)
	if not arg_147_0.viewComponent.grid then
		arg_147_3()

		return
	end

	local var_147_0 = getProxy(ChapterProxy)
	local var_147_1

	local function var_147_2()
		if var_147_1 and coroutine.status(var_147_1) == "suspended" then
			local var_148_0, var_148_1 = coroutine.resume(var_147_1)

			assert(var_148_0, debug.traceback(var_147_1, var_148_1))

			if not var_148_0 then
				arg_147_0.viewComponent:unfrozen(-1)
				arg_147_0:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRequest
				})
			end
		end
	end

	var_147_1 = coroutine.create(function()
		arg_147_0.viewComponent:frozen()

		local var_149_0 = {}
		local var_149_1 = arg_147_2 or 0

		for iter_149_0, iter_149_1 in ipairs(arg_147_1) do
			local var_149_2 = arg_147_0.contextData.chapterVO
			local var_149_3, var_149_4 = iter_149_1:applyTo(var_149_2, true)

			assert(var_149_3, var_149_4)
			iter_149_1:PlayAIAction(arg_147_0.contextData.chapterVO, arg_147_0, function()
				local var_150_0, var_150_1, var_150_2 = iter_149_1:applyTo(var_149_2, false)

				if var_150_0 then
					var_147_0:updateChapter(var_149_2, var_150_1)

					var_149_1 = bit.bor(var_149_1, var_150_2 or 0)
				end

				onNextTick(var_147_2)
			end)
			coroutine.yield()

			if isa(iter_149_1, FleetAIAction) and iter_149_1.actType == ChapterConst.ActType_Poison and var_149_2:existFleet(FleetType.Normal, iter_149_1.line.row, iter_149_1.line.column) then
				local var_149_5 = var_149_2:getFleetIndex(FleetType.Normal, iter_149_1.line.row, iter_149_1.line.column)

				table.insert(var_149_0, var_149_5)
			end
		end

		local var_149_6 = bit.band(var_149_1, ChapterConst.DirtyAutoAction)

		var_149_1 = bit.band(var_149_1, bit.bnot(ChapterConst.DirtyAutoAction))

		if var_149_1 ~= 0 then
			local var_149_7 = arg_147_0.contextData.chapterVO

			var_147_0:updateChapter(var_149_7, var_149_1)
		end

		seriesAsync({
			function(arg_151_0)
				if var_149_6 ~= 0 then
					arg_147_0.viewComponent.levelStageView:tryAutoAction(arg_151_0)
				else
					arg_151_0()
				end
			end,
			function(arg_152_0)
				table.ParallelIpairsAsync(var_149_0, function(arg_153_0, arg_153_1, arg_153_2)
					arg_147_0.viewComponent.grid:showFleetPoisonDamage(arg_153_1, arg_153_2)
				end, arg_152_0)
			end,
			function(arg_154_0)
				arg_147_3()
				arg_147_0.viewComponent:unfrozen()
			end
		})
	end)

	var_147_2()
end

function var_0_0.saveSubState(arg_155_0, arg_155_1)
	local var_155_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("chapter_submarine_ai_type_" .. var_155_0, arg_155_1 + 1)
	PlayerPrefs.Save()
end

function var_0_0.loadSubState(arg_156_0, arg_156_1)
	local var_156_0 = getProxy(PlayerProxy):getRawData().id
	local var_156_1 = PlayerPrefs.GetInt("chapter_submarine_ai_type_" .. var_156_0, 1) - 1
	local var_156_2 = math.clamp(var_156_1, 0, 1)

	if var_156_2 ~= arg_156_1 then
		arg_156_0.viewComponent:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSubState,
			arg1 = var_156_2
		})
	end
end

function var_0_0.remove(arg_157_0)
	arg_157_0:removeSubLayers(LevelContinuousOperationWindowMediator)
	var_0_0.super.remove(arg_157_0)
end

return var_0_0
