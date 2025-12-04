local var_0_0 = class("IslandBaseMediator", import("view.base.ContextMediator"))

var_0_0.SET_UP = "IslandBaseScene:SET_UP"
var_0_0.SWITCH_MAP = "IslandBaseMediator:SWITCH_MAP"
var_0_0.RECORD_PLAYER_POS = "IslandBaseMediator:RECORD_PLAYER_POS"
var_0_0.ANIMATION_OP = "IslandBaseMediator:ANIMATION_OP"
var_0_0.SEND_CHAT = "IslandBaseMediator:SEND_CHAT"
var_0_0.CHANGE_CHAT_ROOM = "IslandBaseMediator:CHANGE_CHAT_ROOM"
var_0_0.OPEN_FRIEND_INFO = "IslandBaseMediator:OPEN_FRIEND_INFO"
var_0_0.GO_FISHING = "IslandBaseMediator:GO_FISHING"
var_0_0.FISHING_RESULT = "IslandBaseMediator:FISHING_RESULT"
var_0_0.EXCHANGE_LURE = "IslandBaseMediator:EXCHANGE_LURE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.EXCHANGE_LURE, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0:sendNotification(GAME.ISLAND_EXCHANGE_LURE, {
			lureId = arg_2_1,
			fishPointId = arg_2_2,
			callback = arg_2_3
		})
	end)
	arg_1_0:bind(var_0_0.FISHING_RESULT, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5, arg_3_6)
		local var_3_0 = arg_1_0.viewComponent:GetIsland()

		arg_1_0:sendNotification(GAME.ISLAND_FISHING_REUSLT, {
			fishId = arg_3_3,
			fishPointId = arg_3_2,
			weight = arg_3_4,
			cupType = arg_3_5,
			islandId = var_3_0.id,
			op = arg_3_1,
			callback = arg_3_6
		})
	end)
	arg_1_0:bind(var_0_0.GO_FISHING, function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		local var_4_0 = arg_1_0.viewComponent:GetIsland()

		arg_1_0:sendNotification(GAME.ISLAND_GO_FISHING, {
			poolId = arg_4_1,
			baitId = arg_4_2,
			islandId = var_4_0.id,
			callback = arg_4_3
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_FRIEND_INFO, function(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
		arg_1_0.friendInfoPosition = arg_5_2
		arg_1_0.friendInfoMsg = arg_5_3

		arg_1_0:sendNotification(GAME.FRIEND_SEARCH, {
			type = SearchFriendCommand.SEARCH_TYPE_RESUME,
			keyword = arg_5_1
		})
	end)
	arg_1_0:bind(var_0_0.CHANGE_CHAT_ROOM, function(arg_6_0, arg_6_1)
		if not arg_6_1 then
			return
		end

		if arg_6_1 <= 0 or arg_6_1 == "" then
			return
		end

		arg_1_0:sendNotification(GAME.CHANGE_CHAT_ROOM, arg_6_1)
	end)
	arg_1_0:bind(var_0_0.SEND_CHAT, function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_1_0.viewComponent:GetIsland()

		arg_1_0:sendNotification(GAME.ISLAND_SEND_CHAT, {
			channel = arg_7_1,
			islandId = var_7_0.id,
			msg = arg_7_2
		})
	end)
	arg_1_0:bind(var_0_0.ANIMATION_OP, function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = arg_1_0.viewComponent:GetIsland()

		arg_1_0:sendNotification(GAME.ISLAND_ANIMATION_OP, {
			islandId = var_8_0.id,
			targetId = arg_8_1,
			actionId = arg_8_2
		})
	end)
	arg_1_0:bind(var_0_0.SET_UP, function(arg_9_0)
		arg_1_0:SetUp()
	end)
	arg_1_0:bind(var_0_0.SWITCH_MAP, function(arg_10_0, arg_10_1, arg_10_2)
		local var_10_0 = arg_1_0.viewComponent:GetIsland()

		if not var_10_0:GetAblityAgency():IsUnlockMap(arg_10_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_lock_map_tip"))

			return
		end

		arg_1_0:sendNotification(GAME.ISLAND_ENTER_MAP, {
			islandId = var_10_0.id,
			mapId = arg_10_1,
			callback = function()
				local var_11_0 = pg.island_world_objects[arg_10_2]

				if var_11_0 then
					local var_11_1 = BuildVector3(var_11_0.param.position)
					local var_11_2 = BuildVector3(var_11_0.param.rotation)

					arg_1_0:RecordPlayerPosition(arg_10_1, var_11_1, var_11_2)
				end

				arg_1_0:SwitchScene(arg_10_1, arg_10_2)
			end
		})
	end)
	arg_1_0:bind(var_0_0.RECORD_PLAYER_POS, function(arg_12_0)
		if not _IslandCore then
			return
		end

		local var_12_0 = _IslandCore:GetController().mapId
		local var_12_1 = _IslandCore:GetView().player

		if not var_12_1 or not var_12_1._tf then
			return
		end

		local var_12_2, var_12_3 = var_12_1:LastGroundedPosition()

		arg_1_0:RecordPlayerPosition(var_12_0, var_12_2, var_12_3)
	end)
	arg_1_0:_register()
end

function var_0_0.RecordPlayerPosition(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	if not _IslandCore then
		return
	end

	if not _IslandCore:GetController():IsSelfIsland() then
		return
	end

	arg_13_0:sendNotification(GAME.ISLAND_RECORD_LAST_EXIT_POS, {
		islandId = arg_13_0.viewComponent:GetIsland().id,
		mapId = arg_13_1,
		position = arg_13_2,
		rotation = arg_13_3
	})
end

function var_0_0.listNotificationInterests(arg_14_0)
	local var_14_0 = {
		ChatProxy.NEW_MSG,
		FriendProxy.FRIEND_NEW_MSG,
		GuildProxy.NEW_MSG_ADDED,
		IslandProxy.CHAT_MSG_UPDATE,
		GAME.CHANGE_CHAT_ROOM_DONE,
		GAME.FRIEND_SEARCH_DONE,
		GAME.ON_APPLICATION_PAUSE,
		GAME.ISLAND_ON_HOME,
		GAME.ISLAND_ON_RECONNECT,
		GAME.ISLAND_SELECT_GIFT_DONE,
		GAME.ISLAND_CORE_STATE_CHANGED
	}
	local var_14_1 = arg_14_0:_listNotificationInterests()

	for iter_14_0, iter_14_1 in ipairs(var_14_1) do
		if not table.contains(var_14_0, iter_14_1) then
			table.insert(var_14_0, iter_14_1)
		end
	end

	return var_14_0
end

function var_0_0.handleNotification(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:getName()
	local var_15_1 = arg_15_1:getBody()

	if var_15_0 == ChatProxy.NEW_MSG or var_15_0 == FriendProxy.FRIEND_NEW_MSG or var_15_0 == GuildProxy.NEW_MSG_ADDED or var_15_0 == IslandProxy.CHAT_MSG_UPDATE then
		arg_15_0.viewComponent:emitCore(ISLAND_EVT.CHAT_MSG_UPDATE)

		if var_15_0 == IslandProxy.CHAT_MSG_UPDATE and var_15_1.islandId == arg_15_0.viewComponent:GetIsland().id then
			arg_15_0.viewComponent:emitCore(ISLAND_EVT.SHOW_CHAT_MSG, var_15_1.msg)
		end
	elseif var_15_0 == GAME.CHANGE_CHAT_ROOM_DONE then
		arg_15_0.viewComponent:emitCore(ISLAND_EVT.CHAT_ROOM_UPDATE)
	elseif var_15_0 == GAME.FRIEND_SEARCH_DONE and var_15_1.list[1] and var_15_1.type == SearchFriendCommand.SEARCH_TYPE_RESUME then
		arg_15_0:addSubLayers(Context.New({
			viewComponent = IslandFriendInfoLayer,
			mediator = FriendInfoMediator,
			data = {
				friend = var_15_1.list[1],
				msg = arg_15_0.friendInfoMsg,
				pos = arg_15_0.friendInfoPosition
			}
		}))

		arg_15_0.friendInfoPosition = nil
		arg_15_0.friendInfoMsg = nil
	elseif var_15_0 == GAME.ON_APPLICATION_PAUSE then
		if not var_15_1 and _IslandCore and not arg_15_0.exitProcessing then
			arg_15_0:sendNotification(GAME.ISLAND_RECONNECT, {
				islandId = _IslandCore:GetController():GetIsland().id
			})
		end
	elseif var_15_0 == GAME.ISLAND_ON_HOME then
		arg_15_0.viewComponent:emit(BaseUI.ON_HOME)
	elseif var_15_0 == GAME.ISLAND_ON_RECONNECT then
		if arg_15_0.exitProcessing then
			return
		end

		local function var_15_2()
			arg_15_0.exitProcessing = true

			arg_15_0.viewComponent:ExitProcess(BaseUI.ON_HOME, function()
				arg_15_0.exitProcessing = false

				pg.m02:sendNotification(GAME.ISLAND_ENTER, var_15_1)
			end)
		end

		if _IslandCore and _IslandCore.state == IslandCore.STATE_INIT_FINISH then
			var_15_2()
		else
			arg_15_0.coreInitCallback = var_15_2
		end
	elseif var_15_0 == GAME.ISLAND_SELECT_GIFT_DONE then
		arg_15_0.viewComponent:HandleAwardDisplay(var_15_1.dropData, var_15_1.callback, IslandAwardDisplayPage.TYPE_SIGN_GIFT)
	elseif var_15_0 == GAME.ISLAND_CORE_STATE_CHANGED and var_15_1 == IslandCore.STATE_INIT_FINISH and arg_15_0.coreInitCallback then
		arg_15_0.coreInitCallback()

		arg_15_0.coreInitCallback = nil
	end

	arg_15_0:_handleNotification(arg_15_1)
	arg_15_0.viewComponent:emit(var_15_0, var_15_1)
end

function var_0_0.SetUp(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.viewComponent:GetIsland()
	local var_18_1 = var_18_0.mapID
	local var_18_2 = var_18_0.spawnPointId

	_IslandCore = IslandCore.New(arg_18_0.viewComponent:GetPoolMgr(), var_18_0, arg_18_1)

	arg_18_0.viewComponent:OnSetUpCore(var_18_1, var_18_2)
end

function var_0_0.SwitchScene(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.viewComponent:GetIsland()

	var_19_0:SetMapId(arg_19_1)

	if arg_19_2 then
		var_19_0:SetSpawnPointId(arg_19_2)
	end

	local var_19_1 = arg_19_0:UnloadScene()

	arg_19_0:SetUp(var_19_1)
end

function var_0_0.UnloadScene(arg_20_0, arg_20_1)
	arg_20_0.viewComponent:OnUnloadScene()

	if _IslandCore then
		local var_20_0 = _IslandCore:GetView():GetSubView(IslandOpView)
		local var_20_1 = var_20_0 and var_20_0.showBalance or 1

		_IslandCore:Dispose(arg_20_1)

		_IslandCore = nil

		return var_20_1
	end

	return 1
end

function var_0_0.remove(arg_21_0)
	arg_21_0:UnloadScene(true)
	arg_21_0:_remove()
	IslandHelper.RunGC(true)
end

function var_0_0._register(arg_22_0)
	return
end

function var_0_0._listNotificationInterests(arg_23_0)
	return {}
end

function var_0_0._handleNotification(arg_24_0, arg_24_1)
	return
end

function var_0_0._remove(arg_25_0)
	return
end

return var_0_0
