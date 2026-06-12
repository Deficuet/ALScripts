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
var_0_0.OPEN_KINK_BUTTON_LAYER = "NewMainMediator.OPEN_KINK_BUTTON_LAYER"
var_0_0.OPEN_Compensate = "NewMainMediator:OPEN_Compensate"
var_0_0.ON_DROP = "NewMainMediator:ON_DROP"
var_0_0.ON_AWRADS = "NewMainMediator:ON_AWRADS"
var_0_0.CHANGE_SKIN_TOGGLE = "NewMainMediator:CHANGE_SKIN_TOGGLE"
var_0_0.FOLD_PANEL = "NewMainMediator:FOLD_PANEL"
var_0_0.HIDE_PANEL = "NewMainMediator:HIDE_PANEL"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.SKIP_LOTTERY, function(arg_2_0, arg_2_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = LotteryLayer,
			mediator = LotteryMediator,
			data = {
				activityId = arg_2_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.SKIP_INS, function(arg_3_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = InstagramMainUI,
			mediator = InstagramMainMediator
		}))
	end)
	arg_1_0:bind(var_0_0.SKIP_ESCORT, function(arg_4_0)
		local var_4_0 = getProxy(ChapterProxy)
		local var_4_1 = var_4_0:getMapsByType(Map.ESCORT)[1]
		local var_4_2 = var_4_0:getActiveChapter()

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = var_4_2 and var_4_2:getConfig("map") == var_4_1.id and var_4_2.id or nil,
			mapIdx = var_4_1.id
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_ACTIVITY_MAP, function(arg_5_0, arg_5_1)
		local var_5_0 = getProxy(ChapterProxy)
		local var_5_1, var_5_2 = var_5_0:getLastMapForActivity(arg_5_1)

		if not var_5_1 or not var_5_0:getMapById(var_5_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_5_2,
				mapIdx = var_5_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.SKIP_SHOP, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
			warp = arg_6_1 or NewShopsScene.TYPE_ACTIVITY
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_ACTIVITY, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_7_1
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_CORE_ACTIVITY, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CORE_ACTIVITY, {
			coreName = arg_8_1
		})
	end)
	arg_1_0:bind(var_0_0.SKIP_SCENE, function(arg_9_0, arg_9_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_9_1[1], arg_9_1[2])
	end)
	arg_1_0:bind(var_0_0.GO_MINI_GAME, function(arg_10_0, arg_10_1)
		arg_1_0:sendNotification(GAME.GO_MINI_GAME, arg_10_1)
	end)
	arg_1_0:bind(var_0_0.GO_SCENE, function(arg_11_0, arg_11_1, arg_11_2)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_11_1, arg_11_2)
	end)
	arg_1_0:bind(var_0_0.GO_SNAPSHOT, function(arg_12_0)
		local var_12_0 = arg_1_0.viewComponent.bgView.ship
		local var_12_1 = var_12_0:getSkinId()
		local var_12_2 = arg_1_0.viewComponent.paintingView:IsLive2DState()
		local var_12_3

		if isa(var_12_0, VirtualEducateCharShip) then
			var_12_3 = var_12_0.educateCharId
			var_12_2 = false
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SNAPSHOT, {
			skinId = var_12_1,
			live2d = var_12_2,
			tbId = var_12_3,
			propose = var_12_0.propose
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_MAIL, function(arg_13_0)
		if BATTLE_DEBUG then
			arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_DEBUG
			})
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.MAIL)
		end
	end)
	arg_1_0:bind(var_0_0.OPEN_Compensate, function(arg_14_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.Compensate)
	end)
	arg_1_0:bind(var_0_0.OPEN_NOTICE, function(arg_15_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = NewBulletinBoardMediator,
			viewComponent = NewBulletinBoardLayer
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_COMMISION, function(arg_16_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = CommissionInfoLayer,
			mediator = CommissionInfoMediator
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHATVIEW, function(arg_17_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = NotificationLayer,
			mediator = NotificationMediator,
			data = {
				form = NotificationLayer.FORM_MAIN
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_KINK_BUTTON_LAYER, function(arg_18_0, arg_18_1)
		arg_1_0:addSubLayers(arg_18_1)
	end)
	arg_1_0:bind(var_0_0.CHANGE_SKIN_TOGGLE, function(arg_19_0, arg_19_1)
		arg_1_0:sendNotification(GAME.CHANGE_SKIN_AB, arg_19_1)
	end)
end

function var_0_0.listNotificationInterests(arg_20_0)
	return {
		GAME.REMOVE_LAYERS,
		GAME.GET_GUILD_INFO_DONE,
		GAME.GET_GUILD_CHAT_LIST_DONE,
		GAME.ON_OPEN_INS_LAYER,
		GAME.BEGIN_STAGE_DONE,
		GAME.SEND_MINI_GAME_OP_DONE,
		GAME.FETCH_NPC_SHIP_DONE,
		GAME.FETCH_NPC_SHIP_ACTIVITY_DONE,
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
end

function var_0_0.handleNotification(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:getName()
	local var_21_1 = arg_21_1:getBody()

	if var_21_0 == GAME.ON_OPEN_INS_LAYER then
		arg_21_0.viewComponent:emit(var_0_0.SKIP_INS)
	elseif var_21_0 == NotificationProxy.FRIEND_REQUEST_ADDED or var_21_0 == NotificationProxy.FRIEND_REQUEST_REMOVED or var_21_0 == FriendProxy.FRIEND_NEW_MSG or var_21_0 == FriendProxy.FRIEND_UPDATED or var_21_0 == ChatProxy.NEW_MSG or var_21_0 == GuildProxy.NEW_MSG_ADDED or var_21_0 == GAME.GET_GUILD_INFO_DONE or var_21_0 == GAME.GET_GUILD_CHAT_LIST_DONE then
		arg_21_0.viewComponent:emit(GAME.ANY_CHAT_MSG_UPDATE)
	elseif var_21_0 == GAME.BEGIN_STAGE_DONE then
		arg_21_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_21_1)
	elseif var_21_0 == ChapterProxy.CHAPTER_TIMESUP then
		MainChapterTimeUpSequence.New():Execute()
	elseif var_21_0 == TechnologyConst.UPDATE_REDPOINT_ON_TOP then
		MainTechnologySequence.New():Execute(function()
			return
		end)
	elseif var_21_0 == GAME.FETCH_NPC_SHIP_DONE or var_21_0 == GAME.FETCH_NPC_SHIP_ACTIVITY_DONE then
		arg_21_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_21_1.items, var_21_1.callback)
	elseif var_21_0 == var_0_0.REFRESH_VIEW then
		arg_21_0.viewComponent:setVisible(false)
		arg_21_0.viewComponent:setVisible(true)
	elseif var_21_0 == GAME.CONFIRM_GET_SHIP then
		arg_21_0:addSubLayers(Context.New({
			mediator = BuildShipRemindMediator,
			viewComponent = BuildShipRemindLayer,
			data = {
				ships = var_21_1.ships
			},
			onRemoved = var_21_1.callback
		}))
	elseif var_21_0 == GAME.CHANGE_LIVINGAREA_COVER_DONE then
		arg_21_0.viewComponent:emit(NewMainScene.UPDATE_COVER)
	elseif var_21_0 == GAME.ACT_INSTAGRAM_CHAT_DONE and var_21_1.operation == ActivityConst.INSTAGRAM_CHAT_ACTIVATE_TOPIC then
		local var_21_2 = arg_21_0.viewComponent:GetFlagShip()

		if arg_21_0.viewComponent.theme then
			arg_21_0.viewComponent.theme:Refresh(var_21_2)
		end
	elseif var_21_0 == NewMainMediator.ON_DROP then
		arg_21_0.viewComponent:emit(BaseUI.ON_DROP, var_21_1)
	elseif var_21_0 == NewMainMediator.ON_AWRADS then
		arg_21_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_21_1.items, var_21_1.callback)
	elseif var_21_0 == GAME.PLAY_CHANGE_SKIN_OUT then
		arg_21_0.viewComponent:SetEffectPanelVisible(false)
		arg_21_0.viewComponent:HidePanel(true)
		arg_21_0.viewComponent:PlayChangeSkinActionOut(var_21_1)
	elseif var_21_0 == GAME.PLAY_CHANGE_SKIN_IN then
		arg_21_0.viewComponent:PlayChangeSkinActionIn(var_21_1)
	elseif var_21_0 == GAME.PLAY_CHANGE_SKIN_FINISH then
		arg_21_0.viewComponent:SetEffectPanelVisible(true)
		arg_21_0.viewComponent:HidePanel(false)
	elseif var_21_0 == GAME.CHANGE_SKIN_EXCHANGE then
		local var_21_3 = var_21_1.asmr and true or false
		local var_21_4 = arg_21_0.viewComponent:GetFlagShip()

		if arg_21_0.viewComponent then
			arg_21_0.viewComponent:UpdateFlagShip(var_21_4, var_21_1)
		end

		arg_21_0.viewComponent:AsmrTurning(var_21_3)
	elseif var_21_0 == MusicPlayer.NO_PLAY_MUSIC_NOTIFICATION then
		arg_21_0.viewComponent:CheckAndReplayBgm()
	elseif var_21_0 == NewMainMediator.FOLD_PANEL then
		arg_21_0.viewComponent:FoldPanels(var_21_1)
	elseif var_21_0 == NewMainMediator.HIDE_PANEL then
		arg_21_0.viewComponent:HidePanel(var_21_1)
	elseif var_21_0 == GAME.SERIES_GUIDE_END then
		MainAwakeGuideSequence.New():Execute(function()
			return
		end)
	end

	arg_21_0.viewComponent:emit(var_21_0, var_21_1)
end

return var_0_0
