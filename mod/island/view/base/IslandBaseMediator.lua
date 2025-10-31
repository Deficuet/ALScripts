local var_0_0 = class("IslandBaseMediator", import("view.base.ContextMediator"))

var_0_0.SET_UP = "IslandBaseScene:SET_UP"
var_0_0.SWITCH_MAP = "IslandBaseMediator:SWITCH_MAP"
var_0_0.RECORD_PLAYER_POS = "IslandBaseMediator:RECORD_PLAYER_POS"
var_0_0.ANIMATION_OP = "IslandBaseMediator:ANIMATION_OP"
var_0_0.SEND_CHAT = "IslandBaseMediator:SEND_CHAT"
var_0_0.CHANGE_CHAT_ROOM = "IslandBaseMediator:CHANGE_CHAT_ROOM"
var_0_0.OPEN_FRIEND_INFO = "IslandBaseMediator:OPEN_FRIEND_INFO"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_FRIEND_INFO, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0.friendInfoPosition = arg_2_2
		arg_1_0.friendInfoMsg = arg_2_3

		arg_1_0:sendNotification(GAME.FRIEND_SEARCH, {
			type = SearchFriendCommand.SEARCH_TYPE_RESUME,
			keyword = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.CHANGE_CHAT_ROOM, function(arg_3_0, arg_3_1)
		if not arg_3_1 then
			return
		end

		if arg_3_1 <= 0 or arg_3_1 == "" then
			return
		end

		arg_1_0:sendNotification(GAME.CHANGE_CHAT_ROOM, arg_3_1)
	end)
	arg_1_0:bind(var_0_0.SEND_CHAT, function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_1_0.viewComponent:GetIsland()

		arg_1_0:sendNotification(GAME.ISLAND_SEND_CHAT, {
			channel = arg_4_1,
			islandId = var_4_0.id,
			msg = arg_4_2
		})
	end)
	arg_1_0:bind(var_0_0.ANIMATION_OP, function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_1_0.viewComponent:GetIsland()

		arg_1_0:sendNotification(GAME.ISLAND_ANIMATION_OP, {
			islandId = var_5_0.id,
			targetId = arg_5_1,
			actionId = arg_5_2
		})
	end)
	arg_1_0:bind(var_0_0.SET_UP, function(arg_6_0)
		arg_1_0:SetUp()
	end)
	arg_1_0:bind(var_0_0.SWITCH_MAP, function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_1_0.viewComponent:GetIsland()

		if not var_7_0:GetAblityAgency():IsUnlockMap(arg_7_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_lock_map_tip"))

			return
		end

		arg_1_0:sendNotification(GAME.ISLAND_ENTER_MAP, {
			islandId = var_7_0.id,
			mapId = arg_7_1,
			callback = function()
				local var_8_0 = pg.island_world_objects[arg_7_2]

				if var_8_0 then
					local var_8_1 = BuildVector3(var_8_0.param.position)
					local var_8_2 = BuildVector3(var_8_0.param.rotation)

					arg_1_0:RecordPlayerPosition(arg_7_1, var_8_1, var_8_2)
				end

				arg_1_0:SwitchScene(arg_7_1, arg_7_2)
			end
		})
	end)
	arg_1_0:bind(var_0_0.RECORD_PLAYER_POS, function(arg_9_0)
		if not _IslandCore then
			return
		end

		local var_9_0 = _IslandCore:GetController().mapId
		local var_9_1 = _IslandCore:GetView().player

		if not var_9_1 then
			return
		end

		local var_9_2, var_9_3 = var_9_1:LastGroundedPosition()

		arg_1_0:RecordPlayerPosition(var_9_0, var_9_2, var_9_3)
	end)
	arg_1_0:_register()
end

function var_0_0.RecordPlayerPosition(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not _IslandCore then
		return
	end

	if not _IslandCore:GetController():IsSelfIsland() then
		return
	end

	arg_10_0:sendNotification(GAME.ISLAND_RECORD_LAST_EXIT_POS, {
		islandId = arg_10_0.viewComponent:GetIsland().id,
		mapId = arg_10_1,
		position = arg_10_2,
		rotation = arg_10_3
	})
end

function var_0_0.listNotificationInterests(arg_11_0)
	local var_11_0 = {
		ChatProxy.NEW_MSG,
		FriendProxy.FRIEND_NEW_MSG,
		GuildProxy.NEW_MSG_ADDED,
		IslandProxy.CHAT_MSG_UPDATE,
		GAME.CHANGE_CHAT_ROOM_DONE,
		GAME.FRIEND_SEARCH_DONE,
		GAME.ON_APPLICATION_PAUSE,
		GAME.ISLAND_ON_HOME,
		GAME.ISLAND_ON_RECONNECT,
		GAME.ISLAND_SELECT_GIFT_DONE
	}
	local var_11_1 = arg_11_0:_listNotificationInterests()

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		if not table.contains(var_11_0, iter_11_1) then
			table.insert(var_11_0, iter_11_1)
		end
	end

	return var_11_0
end

function var_0_0.handleNotification(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:getName()
	local var_12_1 = arg_12_1:getBody()

	if var_12_0 == ChatProxy.NEW_MSG or var_12_0 == FriendProxy.FRIEND_NEW_MSG or var_12_0 == GuildProxy.NEW_MSG_ADDED or var_12_0 == IslandProxy.CHAT_MSG_UPDATE then
		arg_12_0.viewComponent:emitCore(ISLAND_EVT.CHAT_MSG_UPDATE)

		if var_12_0 == IslandProxy.CHAT_MSG_UPDATE and var_12_1.islandId == arg_12_0.viewComponent:GetIsland().id then
			arg_12_0.viewComponent:emitCore(ISLAND_EVT.SHOW_CHAT_MSG, var_12_1.msg)
		end
	elseif var_12_0 == GAME.CHANGE_CHAT_ROOM_DONE then
		arg_12_0.viewComponent:emitCore(ISLAND_EVT.CHAT_ROOM_UPDATE)
	elseif var_12_0 == GAME.FRIEND_SEARCH_DONE and var_12_1.list[1] and var_12_1.type == SearchFriendCommand.SEARCH_TYPE_RESUME then
		arg_12_0:addSubLayers(Context.New({
			viewComponent = IslandFriendInfoLayer,
			mediator = FriendInfoMediator,
			data = {
				friend = var_12_1.list[1],
				msg = arg_12_0.friendInfoMsg,
				pos = arg_12_0.friendInfoPosition
			}
		}))

		arg_12_0.friendInfoPosition = nil
		arg_12_0.friendInfoMsg = nil
	elseif var_12_0 == GAME.ON_APPLICATION_PAUSE then
		if not var_12_1 and _IslandCore and not arg_12_0.exitProcessing then
			arg_12_0:sendNotification(GAME.ISLAND_RECONNECT, {
				islandId = _IslandCore:GetController():GetIsland().id
			})
		end
	elseif var_12_0 == GAME.ISLAND_ON_HOME then
		arg_12_0.viewComponent:emit(BaseUI.ON_HOME)
	elseif var_12_0 == GAME.ISLAND_ON_RECONNECT then
		if arg_12_0.exitProcessing then
			return
		end

		arg_12_0.exitProcessing = true

		arg_12_0.viewComponent:ExitProcess(BaseUI.ON_HOME, function()
			arg_12_0.exitProcessing = false

			pg.m02:sendNotification(GAME.ISLAND_ENTER, var_12_1)
		end)
	elseif var_12_0 == GAME.ISLAND_SELECT_GIFT_DONE then
		arg_12_0.viewComponent:HandleAwardDisplay(var_12_1.dropData, var_12_1.callback, IslandAwardDisplayPage.TYPE_SIGN_GIFT)
	end

	arg_12_0:_handleNotification(arg_12_1)
	arg_12_0.viewComponent:emit(var_12_0, var_12_1)
end

function var_0_0.SetUp(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.viewComponent:GetIsland()
	local var_14_1 = var_14_0.mapID
	local var_14_2 = var_14_0.spawnPointId

	_IslandCore = IslandCore.New(arg_14_0.viewComponent:GetPoolMgr(), var_14_0, arg_14_0.viewComponent._container, arg_14_1)

	arg_14_0.viewComponent:OnSetUpCore(var_14_1, var_14_2)
end

function var_0_0.SwitchScene(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.viewComponent:GetIsland()

	var_15_0:SetMapId(arg_15_1)

	if arg_15_2 then
		var_15_0:SetSpawnPointId(arg_15_2)
	end

	local var_15_1 = arg_15_0:UnloadScene()

	arg_15_0:SetUp(var_15_1)
end

function var_0_0.UnloadScene(arg_16_0, arg_16_1)
	arg_16_0.viewComponent:OnUnloadScene()

	if _IslandCore then
		local var_16_0 = _IslandCore:GetView():GetSubView(IslandOpView)
		local var_16_1 = var_16_0 and var_16_0.showBalance or 1

		_IslandCore:Dispose(arg_16_1)

		_IslandCore = nil

		return var_16_1
	end

	return 1
end

function var_0_0.remove(arg_17_0)
	arg_17_0:UnloadScene(true)
	arg_17_0:_remove()
end

function var_0_0._register(arg_18_0)
	return
end

function var_0_0._listNotificationInterests(arg_19_0)
	return {}
end

function var_0_0._handleNotification(arg_20_0, arg_20_1)
	return
end

function var_0_0._remove(arg_21_0)
	return
end

return var_0_0
