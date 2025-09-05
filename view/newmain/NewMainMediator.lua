local var_0_0 = class("NewMainMediator", import("..base.ContextMediator"))

var_0_0.GO_SCENE = "NewMainMediator:GO_SCENE"
var_0_0.OPEN_MAIL = "NewMainMediator:OPEN_MAIL"
var_0_0.OPEN_NOTICE = "NewMainMediator:OPEN_NOTICE"
var_0_0.GO_SNAPSHOT = "NewMainMediator:GO_SNAPSHOT"
var_0_0.OPEN_COMMISION = "NewMainMediator:OPEN_COMMISION"
var_0_0.OPEN_CHATVIEW = "NewMainMediator:OPEN_CHATVIEW"
var_0_0.SKIP_SCENE = "NewMainMediator:SKIP_SCENE"
var_0_0.SKIP_ACTIVITY = "NewMainMediator:SKIP_ACTIVITY"
var_0_0.SKIP_CORE_ACTIVITY = "NewMainMediator:SKIP_CORE_ACTIVITY"
var_0_0.SKIP_SHOP = "NewMainMediator:SKIP_SHOP"
var_0_0.GO_MINI_GAME = "NewMainMediator:GO_MINI_GAME"
var_0_0.SKIP_ACTIVITY_MAP = "NewMainMediator:SKIP_ACTIVITY_MAP"
var_0_0.SKIP_ESCORT = "NewMainMediator:SKIP_ESCORT"
var_0_0.SKIP_INS = "NewMainMediator:SKIP_INS"
var_0_0.SKIP_LOTTERY = "NewMainMediator:SKIP_LOTTERY"
var_0_0.GO_SINGLE_ACTIVITY = "NewMainMediator:GO_SINGLE_ACTIVITY"
var_0_0.REFRESH_VIEW = "NewMainMediator:REFRESH_VIEW"
var_0_0.OPEN_DORM_SELECT_LAYER = "NewMainMediator.OPEN_DORM_SELECT_LAYER"
var_0_0.OPEN_KINK_BUTTON_LAYER = "NewMainMediator.OPEN_KINK_BUTTON_LAYER"
var_0_0.OPEN_Compensate = "NewMainMediator:OPEN_Compensate"
var_0_0.ON_DROP = "NewMainMediator:ON_DROP"
var_0_0.ON_AWRADS = "NewMainMediator:ON_AWRADS"
var_0_0.CHANGE_SKIN_TOGGLE = "NewMainMediator:CHANGE_SKIN_TOGGLE"
var_0_0.GO_ISLAND = "NewMainMediator:GO_ISLAND"
var_0_0.FOLD_PANEL = "NewMainMediator:FOLD_PANEL"
var_0_0.HIDE_PANEL = "NewMainMediator:HIDE_PANEL"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.GO_ISLAND, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.ISLAND_ENTER, {
			id = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_SINGLE_ACTIVITY, function(arg_3_0, arg_3_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ActivitySingleMediator,
			viewComponent = ActivitySingleScene,
			data = {
				id = arg_3_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.SKIP_LOTTERY, function(arg_4_0, arg_4_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = LotteryLayer,
			mediator = LotteryMediator,
			data = {
				activityId = arg_4_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.SKIP_INS, function(arg_5_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = InstagramMainUI,
			mediator = InstagramMainMediator
		}))
	end)
	arg_1_0:bind(var_0_0.SKIP_ESCORT, function(arg_6_0)
		local var_6_0 = getProxy(ChapterProxy)
		local var_6_1 = var_6_0:getMapsByType(Map.ESCORT)[1]
		local var_6_2 = var_6_0:getActiveChapter()

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = var_6_2 and var_6_2:getConfig("map") == var_6_1.id and var_6_2.id or nil,
			mapIdx = var_6_1.id
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_ACTIVITY_MAP, function(arg_7_0, arg_7_1)
		local var_7_0 = getProxy(ChapterProxy)
		local var_7_1, var_7_2 = var_7_0:getLastMapForActivity(arg_7_1)

		if not var_7_1 or not var_7_0:getMapById(var_7_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_7_2,
				mapIdx = var_7_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.SKIP_SHOP, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
			warp = arg_8_1 or NewShopsScene.TYPE_ACTIVITY
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_ACTIVITY, function(arg_9_0, arg_9_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_9_1
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_CORE_ACTIVITY, function(arg_10_0, arg_10_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CORE_ACTIVITY, {
			coreName = arg_10_1
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_SCENE, function(arg_11_0, arg_11_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_11_1[1], arg_11_1[2])
	end)
	arg_1_0:bind(var_0_0.GO_MINI_GAME, function(arg_12_0, arg_12_1)
		arg_1_0:sendNotification(GAME.GO_MINI_GAME, arg_12_1)
	end)
	arg_1_0:bind(var_0_0.GO_SCENE, function(arg_13_0, arg_13_1, arg_13_2)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_13_1, arg_13_2)
	end)
	arg_1_0:bind(var_0_0.GO_SNAPSHOT, function(arg_14_0)
		local var_14_0 = arg_1_0.viewComponent.bgView.ship
		local var_14_1 = var_14_0:getSkinId()
		local var_14_2 = arg_1_0.viewComponent.paintingView:IsLive2DState()
		local var_14_3

		if isa(var_14_0, VirtualEducateCharShip) then
			var_14_3 = var_14_0.educateCharId
			var_14_2 = false
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SNAPSHOT, {
			skinId = var_14_1,
			live2d = var_14_2,
			tbId = var_14_3,
			propose = var_14_0.propose
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_MAIL, function(arg_15_0)
		if BATTLE_DEBUG then
			arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_DEBUG
			})
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.MAIL)
		end
	end)
	arg_1_0:bind(var_0_0.OPEN_Compensate, function(arg_16_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.Compensate)
	end)
	arg_1_0:bind(var_0_0.OPEN_NOTICE, function(arg_17_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = NewBulletinBoardMediator,
			viewComponent = NewBulletinBoardLayer
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_COMMISION, function(arg_18_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = CommissionInfoLayer,
			mediator = CommissionInfoMediator
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHATVIEW, function(arg_19_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = NotificationMediator,
			viewComponent = NotificationLayer,
			data = {
				form = NotificationLayer.FORM_MAIN
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_DORM_SELECT_LAYER, function(arg_20_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3DSELECT)
	end)
	arg_1_0:bind(var_0_0.OPEN_KINK_BUTTON_LAYER, function(arg_21_0, arg_21_1)
		arg_1_0:addSubLayers(arg_21_1)
	end)
	arg_1_0:bind(var_0_0.CHANGE_SKIN_TOGGLE, function(arg_22_0, arg_22_1)
		arg_1_0:sendNotification(GAME.CHANGE_SKIN_AB, arg_22_1)
	end)
end

function var_0_0.listNotificationInterests(arg_23_0)
	local var_23_0 = {
		GAME.REMOVE_LAYERS,
		GAME.GET_GUILD_INFO_DONE,
		GAME.GET_GUILD_CHAT_LIST_DONE,
		GAME.ON_OPEN_INS_LAYER,
		GAME.BEGIN_STAGE_DONE,
		GAME.SEND_MINI_GAME_OP_DONE,
		GAME.FETCH_NPC_SHIP_DONE,
		GAME.ZERO_HOUR_OP_DONE,
		GAME.CONFIRM_GET_SHIP,
		GAME.WILL_LOGOUT,
		GAME.GET_FEAST_DATA_DONE,
		GAME.FETCH_VOTE_INFO_DONE,
		GAME.ROTATE_PAINTING_INDEX,
		GAME.LOAD_LAYERS,
		GAME.GUILD_GET_USER_INFO_DONE,
		GAME.GET_PUBLIC_GUILD_USER_DATA_DONE,
		GAME.PLAY_CHANGE_SKIN_OUT,
		GAME.PLAY_CHANGE_SKIN_IN,
		GAME.PLAY_CHANGE_SKIN_FINISH,
		GAME.CHANGE_SKIN_EXCHANGE,
		NotificationProxy.FRIEND_REQUEST_ADDED,
		NotificationProxy.FRIEND_REQUEST_REMOVED,
		FriendProxy.FRIEND_NEW_MSG,
		FriendProxy.FRIEND_UPDATED,
		PlayerProxy.UPDATED,
		ChatProxy.NEW_MSG,
		GuildProxy.NEW_MSG_ADDED,
		ChapterProxy.CHAPTER_TIMESUP,
		TaskProxy.TASK_ADDED,
		TechnologyConst.UPDATE_REDPOINT_ON_TOP,
		MiniGameProxy.ON_HUB_DATA_UPDATE,
		var_0_0.REFRESH_VIEW,
		GAME.CHANGE_LIVINGAREA_COVER_DONE,
		CompensateProxy.UPDATE_ATTACHMENT_COUNT,
		CompensateProxy.All_Compensate_Remove,
		GAME.ACT_INSTAGRAM_CHAT_DONE,
		GAME.SERIES_GUIDE_END,
		NewMainMediator.ON_DROP,
		NewMainMediator.ON_AWRADS,
		NewMainMediator.FOLD_PANEL,
		NewMainMediator.HIDE_PANEL,
		MusicPlayer.NO_PLAY_MUSIC_NOTIFICATION,
		GAME.REQ_NEW_INSTAGRAM_DATA_DONE
	}

	for iter_23_0, iter_23_1 in pairs(pg.redDotHelper:GetNotifyType()) do
		for iter_23_2, iter_23_3 in pairs(iter_23_1) do
			if not table.contains(var_23_0, iter_23_3) then
				table.insert(var_23_0, iter_23_3)
			end
		end
	end

	return var_23_0
end

function var_0_0.handleNotification(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:getName()
	local var_24_1 = arg_24_1:getBody()

	pg.redDotHelper:Notify(var_24_0)

	if var_24_0 == GAME.ON_OPEN_INS_LAYER then
		arg_24_0.viewComponent:emit(var_0_0.SKIP_INS)
	elseif var_24_0 == NotificationProxy.FRIEND_REQUEST_ADDED or var_24_0 == NotificationProxy.FRIEND_REQUEST_REMOVED or var_24_0 == FriendProxy.FRIEND_NEW_MSG or var_24_0 == FriendProxy.FRIEND_UPDATED or var_24_0 == ChatProxy.NEW_MSG or var_24_0 == GuildProxy.NEW_MSG_ADDED or var_24_0 == GAME.GET_GUILD_INFO_DONE or var_24_0 == GAME.GET_GUILD_CHAT_LIST_DONE then
		arg_24_0.viewComponent:emit(GAME.ANY_CHAT_MSG_UPDATE)
	elseif var_24_0 == GAME.BEGIN_STAGE_DONE then
		arg_24_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_24_1)
	elseif var_24_0 == ChapterProxy.CHAPTER_TIMESUP then
		MainChapterTimeUpSequence.New():Execute()
	elseif var_24_0 == TechnologyConst.UPDATE_REDPOINT_ON_TOP then
		MainTechnologySequence.New():Execute(function()
			return
		end)
	elseif var_24_0 == GAME.FETCH_NPC_SHIP_DONE then
		arg_24_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_24_1.items, var_24_1.callback)
	elseif var_24_0 == var_0_0.REFRESH_VIEW then
		arg_24_0.viewComponent:setVisible(false)
		arg_24_0.viewComponent:setVisible(true)
	elseif var_24_0 == GAME.CONFIRM_GET_SHIP then
		arg_24_0:addSubLayers(Context.New({
			mediator = BuildShipRemindMediator,
			viewComponent = BuildShipRemindLayer,
			data = {
				ships = var_24_1.ships
			},
			onRemoved = var_24_1.callback
		}))
	elseif var_24_0 == GAME.CHANGE_LIVINGAREA_COVER_DONE then
		arg_24_0.viewComponent:emit(NewMainScene.UPDATE_COVER)
	elseif var_24_0 == GAME.ACT_INSTAGRAM_CHAT_DONE and var_24_1.operation == ActivityConst.INSTAGRAM_CHAT_ACTIVATE_TOPIC then
		local var_24_2 = arg_24_0.viewComponent:GetFlagShip()

		if arg_24_0.viewComponent.theme then
			arg_24_0.viewComponent.theme:Refresh(var_24_2)
		end
	elseif var_24_0 == NewMainMediator.ON_DROP then
		arg_24_0.viewComponent:emit(BaseUI.ON_DROP, var_24_1)
	elseif var_24_0 == NewMainMediator.ON_AWRADS then
		arg_24_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_24_1.items, var_24_1.callback)
	elseif var_24_0 == GAME.PLAY_CHANGE_SKIN_OUT then
		arg_24_0.viewComponent:HidePanel(true)
		arg_24_0.viewComponent:SetEffectPanelVisible(false)
		arg_24_0.viewComponent:PlayChangeSkinActionOut(var_24_1)
	elseif var_24_0 == GAME.PLAY_CHANGE_SKIN_IN then
		arg_24_0.viewComponent:PlayChangeSkinActionIn(var_24_1)
	elseif var_24_0 == GAME.PLAY_CHANGE_SKIN_FINISH then
		arg_24_0.viewComponent:SetEffectPanelVisible(true)
		arg_24_0.viewComponent:HidePanel(false)
	elseif var_24_0 == GAME.CHANGE_SKIN_EXCHANGE then
		local var_24_3 = arg_24_0.viewComponent:GetFlagShip()

		if arg_24_0.viewComponent then
			arg_24_0.viewComponent:UpdateFlagShip(var_24_3, var_24_1)
		end
	elseif var_24_0 == MusicPlayer.NO_PLAY_MUSIC_NOTIFICATION then
		arg_24_0.viewComponent:CheckAndReplayBgm()
	elseif var_24_0 == NewMainMediator.FOLD_PANEL then
		arg_24_0.viewComponent:FoldPanels(var_24_1)
	elseif var_24_0 == NewMainMediator.HIDE_PANEL then
		arg_24_0.viewComponent:HidePanel(var_24_1)
	elseif var_24_0 == GAME.SERIES_GUIDE_END then
		MainAwakeGuideSequence.New():Execute(function()
			return
		end)
	end

	arg_24_0.viewComponent:emit(var_24_0, var_24_1)
end

return var_0_0
