local var_0_0 = class("IslandMediator", import(".base.IslandBaseMediator"))

var_0_0.SET_NAME = "IslandMediator:SET_NAME"
var_0_0.ON_EDIT_MANIFESTO = "IslandMediator:ON_EDIT_MANIFESTO"
var_0_0.GET_PROSPERITY_AWARD = "IslandMediator:GET_PROSPERITY_AWARD"
var_0_0.ON_UPGRADE_INVENTORY = "IslandMediator:ON_UPGRADE_INVENTORY"
var_0_0.ON_REPLACE_ORDER = "IslandMediator:ON_REPLACE_ORDER"
var_0_0.ON_SUBMIT_ORDER = "IslandMediator:ON_SUBMIT_ORDER"
var_0_0.ON_GET_ORDER_EXP_AWARD = "IslandMediator:ON_GET_ORDER_EXP_AWARD"
var_0_0.ON_GEN_NEW_ORDER = "IslandMediator:ON_GEN_NEW_ORDER"
var_0_0.ON_USE_ITEM = "IslandMediator:ON_USE_ITEM"
var_0_0.ON_ACCEPT_TASK = "IslandMediator.ON_ACCEPT_TASK"
var_0_0.ON_SUBMIT_TASK = "IslandMediator.ON_SUBMIT_TASK"
var_0_0.ON_SUBMIT_TASK_ONE_STEP = "IslandMediator.ON_SUBMIT_TASK_ONE_STEP"
var_0_0.ON_CLIENT_UPDATE_TASK = "IslandMediator.ON_CLIENT_UPDATE_TASK"
var_0_0.ON_SET_TRACE_ID = "IslandMediator.ON_SET_TRACE_ID"
var_0_0.ON_RESET_SEASON = "IslandMediator.ON_RESET_SEASON"
var_0_0.ON_GET_SEASON_RANK = "IslandMediator.ON_GET_SEASON_RANK"
var_0_0.ON_CONVERT_SEASON_PT = "IslandMediator.ON_CONVERT_SEASON_PT"
var_0_0.ON_CONVERT_SEASON_PT_4_OVERFLOW = "IslandMediator.ON_CONVERT_SEASON_PT_4_OVERFLOW"
var_0_0.ON_GET_SEASON_PT_AWARD = "IslandMediator.ON_GET_SEASON_PT_AWARD"
var_0_0.OPEN_RESTAURANT = "IslandMediator.OPEN_RESTAURANT"
var_0_0.CLOSE_RESTAURANT = "IslandMediator.CLOSE_RESTAURANT"
var_0_0.GET_ACHIEVEMENT_AWARD = "IslandMediator.GET_ACHIEVEMENT_AWARD"
var_0_0.OPEN_SHIP_INDEX = "IslandMediator:OPEN_SHIP_INDEX"
var_0_0.UPGRADE_SKILL = "IslandMediator:UPGRADE_SKILL"
var_0_0.ON_GIVE_GIFT = "IslandMediator:ON_GIVE_GIFT"
var_0_0.ON_UNLOCK_BUILDING = "IslandMediator:ON_UNLOCK_BUILDING"
var_0_0.ON_UPGRADE_BUILDING = "IslandMediator:ON_UPGRADE_BUILDING"
var_0_0.ON_GET_COMMISSION_AWARD = "IslandMediator:ON_GET_COMMISSION_AWARD"
var_0_0.ON_CHANGE_COMMISSION_FORMULA = "IslandMediator:ON_CHANGE_COMMISSION_FORMULA"
var_0_0.ON_CHANGE_COMMISSION_SHIP = "IslandMediator:ON_CHANGE_COMMISSION_SHIP"
var_0_0.ON_KICK_PLAYER = "IslandMediator:ON_KICK_PLAYER"
var_0_0.SAVE_AGORA = "IslandMediator:SAVE_AGORA"
var_0_0.SAVE_AGORA_THEME = "IslandMediator:SAVE_AGORA_THEME"
var_0_0.DEL_AGORA_THEME = "IslandMediator:DEL_AGORA_THEME"
var_0_0.UPGRADE_AGORA = "IslandMediator:UPGRADE_AGORA"
var_0_0.INVITE_SHIP = "IslandMediator:INVITE_SHIP"
var_0_0.ONE_KEY = "IslandMediator:ONE_KEY"
var_0_0.ON_UNLOCK_TECH = "IslandMediator:ON_UNLOCK_TECH"
var_0_0.ON_FINISH_TECH_IMMD = "IslandMediator:ON_FINISH_TECH_IMMD"
var_0_0.SET_ORDER_TENDENCY = "IslandMediator:SET_ORDER_TENDENCY"
var_0_0.SUBMIT_SHIP_ORDER_ITME = "IslandMediator:SUBMIT_SHIP_ORDER_ITME"
var_0_0.SUBMIT_SHIP_ORDER_ITME_ONEKEY = "IslandMediator:SUBMIT_SHIP_ORDER_ITME_ONEKEY"
var_0_0.GET_SHIP_ORDER_AWARD = "IslandMediator:GET_SHIP_ORDER_AWARD"
var_0_0.UNLOKC_SHIP_ORDER = "IslandMediator:UNLOKC_SHIP_ORDER"
var_0_0.OPEN_PAGE = "IslandMediator:OPEN_PAGE"
var_0_0.OPEN_SHOP = "IslandMediator:OPEN_SHOP"
var_0_0.GET_SHOP_DATA = "IslandMediator:GET_SHOP_DATA"
var_0_0.BUY_COMMODITY = "IslandMediator:BUY_COMMODITY"
var_0_0.REFRESH_SHOP_BY_PLAYER = "IslandMediator:REFRESH_SHOP_BY_PLAYER"
var_0_0.USE_SHIP_EXP_BOOK = "IslandMediator:USE_SHIP_EXP_BOOK"
var_0_0.SHIP_BREAKOUT = "IslandMediator:SHIP_BREAKOUT"
var_0_0.SHIP_ATTR_UPGRADE = "IslandMediator:SHIP_ATTR_UPGRADE"
var_0_0.SHIP_ATTR_LIMIT_UNLOCK = "IslandMediator:SHIP_ATTR_LIMIT_UNLOCK"
var_0_0.SHIP_SKILL_UPGRADE = "IslandMediator:SHIP_SKILL_UPGRADE"
var_0_0.START_DELEGATION = "IslandMediator:START_DELEGATION"
var_0_0.STOP_DELEGATION = "IslandMediator:STOP_DELEGATION"
var_0_0.GET_DELEGATION_AWARD = "IslandMediator:GET_DELEGATION_AWARD"
var_0_0.USE_SPEEDUPCARD = "IslandMediator:USE_SPEEDUPCARD"
var_0_0.SIGNIN = "IslandMediator.SIGNIN"
var_0_0.SELECT_GIFT = "IslandMediator.SELECT_GIFT"
var_0_0.SIGN_IN_INVITATION = "IslandMediator.SIGN_IN_INVITATION"
var_0_0.SHARE_SIGNIN = "IslandMediator:SHARE_SIGNIN"
var_0_0.ENTER_ISLAND = "IslandMediator:ENTER_ISLAND"
var_0_0.ENTER_ISLAND_BY_CODE = "IslandMediator:ENTER_ISLAND_BY_CODE"
var_0_0.ADD_FRIEND = "IslandMediator:ADD_FRIEND"
var_0_0.REMOVE_FRIEND = "IslandMediator:REMOVE_FRIEND"
var_0_0.SEARCH_FRIEND = "IslandMediator:SEARCH_FRIEND"
var_0_0.BATCH_GET_FRIEND = "IslandMediator:BATCH_GET_FRIEND"
var_0_0.ADD_WHITE_LIST = "IslandMediator:ADD_WHITE_LIST"
var_0_0.ADD_BLACK_LIST = "IslandMediator:ADD_BLACK_LIST"
var_0_0.REMOVE_BLACK_LIST = "IslandMediator:REMOVE_BLACK_LIST"
var_0_0.REMOVE_WHITE_LIST = "IslandMediator:REMOVE_WHITE_LIST"
var_0_0.SET_ACCESS_FLAG = "IslandMediator:SET_ACCESS_FLAG"
var_0_0.REFRESH_INVITECODE = "IslandMediator:REFRESH_INVITECODE"
var_0_0.KICK_ALL_VISITOR = "IslandMediator:KICK_ALL_VISITOR"
var_0_0.GET_RESUME = "IslandMediator:GET_RESUME"
var_0_0.GET_GIFT_TAG = "IslandMediator:GET_GIFT_TAG"
var_0_0.GET_THEMES = "IslandMediator:GET_THEMES"
var_0_0.PREVIEW_FURNITURE = "IslandMediator:PREVIEW_FURNITURE"
var_0_0.REFUSE_REQUEST = "IslandMediator:REFUSE_REQUEST"
var_0_0.ACCEPT_REQUEST = "IslandMediator:ACCEPT_REQUEST"

function var_0_0._register(arg_1_0)
	arg_1_0:bind(var_0_0.ACCEPT_REQUEST, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.FRIEND_ACCEPT_REQUEST, arg_2_1)
	end)
	arg_1_0:bind(var_0_0.REFUSE_REQUEST, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.FRIEND_REJECT_REQUEST, arg_3_1)
	end)
	arg_1_0:bind(var_0_0.PREVIEW_FURNITURE, function(arg_4_0, arg_4_1)
		local var_4_0 = arg_1_0.viewComponent:GetIsland()
		local var_4_1 = var_4_0:GetMapId()
		local var_4_2, var_4_3 = _IslandCore:GetView().player:LastGroundedPosition()

		var_4_0:SetMapId(IslandConst.AGORA_MAP_ID)
		arg_1_0:UnloadScene()

		_IslandCore = IslandPreviewCore.New(arg_1_0.viewComponent:GetPoolMgr(), var_4_0, true, arg_4_1, {
			mapId = var_4_1,
			position = var_4_2,
			rotation = var_4_3
		})
	end)
	arg_1_0:bind(var_0_0.GET_THEMES, function(arg_5_0, arg_5_1)
		arg_1_0:sendNotification(GAME.ISLAND_GET_AGORA_THEME, {
			callback = arg_5_1
		})
	end)
	arg_1_0:bind(var_0_0.GET_GIFT_TAG, function(arg_6_0, arg_6_1, arg_6_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_GIFT_TAG, {
			list = arg_6_1,
			callback = arg_6_2
		})
	end)
	arg_1_0:bind(var_0_0.GET_RESUME, function(arg_7_0, arg_7_1, arg_7_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_FRIEND_RESUME, {
			id = arg_7_1,
			callback = arg_7_2
		})
	end)
	arg_1_0:bind(var_0_0.KICK_ALL_VISITOR, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = IslandConst.ACCESS_OP_KICK,
			list = arg_8_1
		})
	end)
	arg_1_0:bind(var_0_0.ADD_BLACK_LIST, function(arg_9_0, arg_9_1)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = IslandConst.ACCESS_OP_ADD_BLACKLIST,
			list = {
				arg_9_1
			}
		})
	end)
	arg_1_0:bind(var_0_0.REMOVE_BLACK_LIST, function(arg_10_0, arg_10_1)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = IslandConst.ACCESS_OP_DEL_BLACKLIST,
			list = {
				arg_10_1
			}
		})
	end)
	arg_1_0:bind(var_0_0.ADD_WHITE_LIST, function(arg_11_0, arg_11_1)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = IslandConst.ACCESS_OP_ADD_WHITELIST,
			list = {
				arg_11_1
			}
		})
	end)
	arg_1_0:bind(var_0_0.REMOVE_WHITE_LIST, function(arg_12_0, arg_12_1)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = IslandConst.ACCESS_OP_DEL_WHITELIST,
			list = {
				arg_12_1
			}
		})
	end)
	arg_1_0:bind(var_0_0.REFRESH_INVITECODE, function(arg_13_0, arg_13_1)
		arg_1_0:sendNotification(GAME.ISLAND_REFRESH_INVITECODE, {
			auto = arg_13_1
		})
	end)
	arg_1_0:bind(var_0_0.SET_ACCESS_FLAG, function(arg_14_0, arg_14_1, arg_14_2)
		arg_1_0:sendNotification(GAME.ISLAND_SET_ACCESS_TYPE, {
			openList = arg_14_1,
			closeList = arg_14_2
		})
	end)
	arg_1_0:bind(var_0_0.BATCH_GET_FRIEND, function(arg_15_0, arg_15_1, arg_15_2)
		arg_1_0:sendNotification(GAME.BATCH_GET_FRIEND, {
			list = arg_15_1,
			callback = arg_15_2
		})
	end)
	arg_1_0:bind(var_0_0.SEARCH_FRIEND, function(arg_16_0, arg_16_1, arg_16_2)
		arg_1_0:sendNotification(GAME.FRIEND_SEARCH, {
			type = arg_16_1,
			keyword = arg_16_2
		})
	end)
	arg_1_0:bind(var_0_0.ADD_FRIEND, function(arg_17_0, arg_17_1, arg_17_2)
		arg_1_0:sendNotification(GAME.FRIEND_SEND_REQUEST, {
			id = arg_17_1,
			msg = arg_17_2
		})
	end)
	arg_1_0:bind(var_0_0.REMOVE_FRIEND, function(arg_18_0, arg_18_1)
		arg_1_0:sendNotification(GAME.FRIEND_DELETE, arg_18_1)
	end)
	arg_1_0:bind(var_0_0.ENTER_ISLAND, function(arg_19_0, arg_19_1)
		arg_1_0:sendNotification(GAME.ISLAND_ENTER, {
			id = arg_19_1
		})
	end)
	arg_1_0:bind(var_0_0.ENTER_ISLAND_BY_CODE, function(arg_20_0, arg_20_1)
		arg_1_0:sendNotification(GAME.ISLAND_ENTER, {
			code = arg_20_1
		})
	end)
	arg_1_0:bind(var_0_0.SHARE_SIGNIN, function(arg_21_0)
		arg_1_0:sendNotification(GAME.ISLAND_SIGN_SHARE_SIGNIN)
	end)
	arg_1_0:bind(var_0_0.SIGN_IN_INVITATION, function(arg_22_0, arg_22_1)
		arg_1_0:sendNotification(GAME.ISLAND_SIGN_IN_INVITATION, {
			list = arg_22_1
		})
	end)
	arg_1_0:bind(var_0_0.SELECT_GIFT, function(arg_23_0, arg_23_1, arg_23_2)
		arg_1_0:sendNotification(GAME.ISLAND_SELECT_GIFT, {
			islandId = arg_23_1,
			pos = arg_23_2
		})
	end)
	arg_1_0:bind(var_0_0.SIGNIN, function(arg_24_0)
		arg_1_0.viewComponent:PlayStory({
			name = "ISLANDSTORY100",
			callback = function()
				arg_1_0:sendNotification(GAME.ISLAND_SIGN_IN)
			end
		})
	end)
	arg_1_0:bind(var_0_0.INVITE_SHIP, function(arg_26_0, arg_26_1)
		arg_1_0:sendNotification(GAME.ISLAND_INVITE_SHIP, {
			id = arg_26_1
		})
	end)
	arg_1_0:bind(var_0_0.SHIP_SKILL_UPGRADE, function(arg_27_0, arg_27_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_SKILL_UPGRADE, {
			id = arg_27_1
		})
	end)
	arg_1_0:bind(var_0_0.SHIP_ATTR_LIMIT_UNLOCK, function(arg_28_0, arg_28_1)
		arg_1_0:sendNotification(GAME.ISLNAD_SHIP_ATTR_LIMIT_UNLOCK, {
			id = arg_28_1
		})
	end)
	arg_1_0:bind(var_0_0.SHIP_ATTR_UPGRADE, function(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
		arg_1_0:sendNotification(GAME.ISLNAD_SHIP_ATTR_UPGRADE, {
			id = arg_29_1,
			attrKy = arg_29_2,
			list = arg_29_3
		})
	end)
	arg_1_0:bind(var_0_0.SHIP_BREAKOUT, function(arg_30_0, arg_30_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_BREAKOUT, {
			id = arg_30_1
		})
	end)
	arg_1_0:bind(var_0_0.USE_SHIP_EXP_BOOK, function(arg_31_0, arg_31_1, arg_31_2)
		arg_1_0:sendNotification(GAME.ISLAND_USE_SHIP_EXP_BOOK, {
			id = arg_31_1,
			list = arg_31_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_PAGE, function(arg_32_0, arg_32_1, arg_32_2)
		arg_1_0.viewComponent:OpenPage(_G[arg_32_1], arg_32_2 and unpack(arg_32_2))
	end)
	arg_1_0:bind(var_0_0.UNLOKC_SHIP_ORDER, function(arg_33_0, arg_33_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP, {
			op = IslandShipOrder.OP_TYPE_UNLOCK,
			slotId = arg_33_1
		})
	end)
	arg_1_0:bind(var_0_0.GET_SHIP_ORDER_AWARD, function(arg_34_0, arg_34_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP, {
			op = IslandShipOrder.OP_TYPE_GET_AWARD,
			slotId = arg_34_1
		})
	end)
	arg_1_0:bind(var_0_0.SUBMIT_SHIP_ORDER_ITME, function(arg_35_0, arg_35_1, arg_35_2)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP, {
			op = IslandShipOrder.OP_TYPE_LOADUP,
			slotId = arg_35_1,
			index = arg_35_2
		})
	end)
	arg_1_0:bind(var_0_0.SUBMIT_SHIP_ORDER_ITME_ONEKEY, function(arg_36_0, arg_36_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP, {
			op = IslandShipOrder.OP_TYPE_LOADUP_ALL,
			slotId = arg_36_1
		})
	end)
	arg_1_0:bind(var_0_0.SET_ORDER_TENDENCY, function(arg_37_0, arg_37_1)
		arg_1_0:sendNotification(GAME.ISLAND_SET_ORDER_TENDENCY, {
			value = arg_37_1
		})
	end)
	arg_1_0:bind(var_0_0.ONE_KEY, function(arg_38_0)
		arg_1_0:sendNotification(GAME.ISLAND_GET_OVERFLOW_ITEM)
	end)
	arg_1_0:bind(var_0_0.UPGRADE_AGORA, function(arg_39_0)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_AGORA)
	end)
	arg_1_0:bind(var_0_0.SAVE_AGORA, function(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
		arg_1_0:sendNotification(GAME.ISLAND_SAVE_AGORA, {
			list = arg_40_1,
			floorList = arg_40_2,
			tileList = arg_40_3
		})
	end)
	arg_1_0:bind(var_0_0.SAVE_AGORA_THEME, function(arg_41_0, arg_41_1)
		arg_1_0:sendNotification(GAME.ISLAND_SAVE_AGORA_THEME, {
			themeData = arg_41_1
		})
	end)
	arg_1_0:bind(var_0_0.DEL_AGORA_THEME, function(arg_42_0, arg_42_1)
		arg_1_0:sendNotification(GAME.ISLAND_DEL_AGORA_THEME, {
			id = arg_42_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_KICK_PLAYER, function(arg_43_0, arg_43_1, arg_43_2)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = arg_43_1,
			list = {
				arg_43_2
			}
		})
	end)
	arg_1_0:bind(var_0_0.ON_GIVE_GIFT, function(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
		arg_1_0:sendNotification(GAME.ISLAND_GIVE_GIFT, {
			id = arg_44_3,
			itemId = arg_44_1
		})
	end)
	arg_1_0:bind(var_0_0.UPGRADE_SKILL, function(arg_45_0, arg_45_1)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_SKILL, {
			id = arg_45_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_SHIP_INDEX, function(arg_46_0, arg_46_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = IslandShipIndexLayer,
			mediator = CustomIndexMediator,
			data = arg_46_1
		}))
	end)
	arg_1_0:bind(var_0_0.ON_USE_ITEM, function(arg_47_0, arg_47_1, arg_47_2)
		arg_1_0:sendNotification(GAME.ISLAND_USE_ITEM, {
			id = arg_47_1,
			count = arg_47_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_GEN_NEW_ORDER, function(arg_48_0, arg_48_1)
		arg_1_0:sendNotification(GAME.ISLAND_GEN_NEW_ORDER, {
			slotId = arg_48_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_GET_ORDER_EXP_AWARD, function(arg_49_0, arg_49_1, arg_49_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_ORDER_EXP_AWARD, {
			level = arg_49_1,
			callback = arg_49_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_REPLACE_ORDER, function(arg_50_0, arg_50_1)
		arg_1_0:sendNotification(GAME.ISLAND_REPLACE_ORDER, {
			slotId = arg_50_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_ORDER, function(arg_51_0, arg_51_1)
		arg_1_0:sendNotification(GAME.ISLAND_SUBMIT_ORDER, {
			slotId = arg_51_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE_INVENTORY, function(arg_52_0)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_INVENTORY)
	end)
	arg_1_0:bind(var_0_0.GET_PROSPERITY_AWARD, function(arg_53_0, arg_53_1)
		arg_1_0:sendNotification(GAME.ISLAND_PROSPERITY_AWARD, {
			level = arg_53_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_EDIT_MANIFESTO, function(arg_54_0, arg_54_1)
		arg_1_0:sendNotification(GAME.ISLAND_SET_MANIFESTO, {
			manifesto = arg_54_1
		})
	end)
	arg_1_0:bind(var_0_0.SET_NAME, function(arg_55_0, arg_55_1, arg_55_2)
		arg_1_0:sendNotification(GAME.ISLAND_SET_NAME, {
			name = arg_55_1,
			currency = arg_55_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACCEPT_TASK, function(arg_56_0, arg_56_1, arg_56_2)
		arg_1_0:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
			taskIds = arg_56_1,
			callback = arg_56_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_TASK, function(arg_57_0, arg_57_1, arg_57_2)
		arg_1_0:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
			taskId = arg_57_1,
			callback = arg_57_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_TASK_ONE_STEP, function(arg_58_0, arg_58_1, arg_58_2)
		arg_1_0:sendNotification(GAME.ISLAND_SUBMIT_TASK_ONE_STEP, {
			taskIds = arg_58_1,
			callback = arg_58_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_CLIENT_UPDATE_TASK, function(arg_59_0, arg_59_1)
		arg_1_0:sendNotification(GAME.ISLAND_UPDATE_TASK, {
			taskId = arg_59_1.taskId,
			targetId = arg_59_1.targetId,
			progress = arg_59_1.progress
		})
	end)
	arg_1_0:bind(var_0_0.ON_SET_TRACE_ID, function(arg_60_0, arg_60_1)
		arg_1_0:sendNotification(GAME.ISLAND_SET_TRACE_TASK, {
			traceId = arg_60_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_RESET_SEASON, function(arg_61_0, arg_61_1)
		arg_1_0:sendNotification(GAME.ISLAND_RESET_SEASON, {
			callback = arg_61_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_GET_SEASON_RANK, function(arg_62_0, arg_62_1, arg_62_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_SEASON_RANK, {
			type = arg_62_1,
			seasonId = arg_62_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_CONVERT_SEASON_PT, function(arg_63_0, arg_63_1)
		arg_1_0:sendNotification(GAME.ISLAND_CONVERT_SEASON_PT, {
			type = 1,
			list = arg_63_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_CONVERT_SEASON_PT_4_OVERFLOW, function(arg_64_0, arg_64_1)
		arg_1_0:sendNotification(GAME.ISLAND_CONVERT_SEASON_PT, {
			type = 2,
			list = arg_64_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_GET_SEASON_PT_AWARD, function(arg_65_0, arg_65_1)
		arg_1_0:sendNotification(GAME.ISLAND_GET_SEASON_PT_AWARD, {
			pt = arg_65_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_RESTAURANT, function(arg_66_0, arg_66_1)
		arg_1_0:sendNotification(GAME.ISLAND_OPEN_RESTAURANT, {
			restId = arg_66_1.restId,
			ships = arg_66_1.ships,
			commodities = arg_66_1.commodities
		})
	end)
	arg_1_0:bind(var_0_0.CLOSE_RESTAURANT, function(arg_67_0, arg_67_1)
		arg_1_0:sendNotification(GAME.ISLAND_CLOSE_RESTAURANT, {
			restId = arg_67_1
		})
	end)
	arg_1_0:bind(var_0_0.GET_ACHIEVEMENT_AWARD, function(arg_68_0, arg_68_1)
		arg_1_0:sendNotification(GAME.ISLAND_GET_ACHV_AWARD, {
			ids = arg_68_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UNLOCK_BUILDING, function(arg_69_0, arg_69_1)
		arg_1_0:sendNotification(GAME.ISLAND_UNLOCK_BUILDING, {
			buildingId = arg_69_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE_BUILDING, function(arg_70_0, arg_70_1)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_BUILDING, {
			buildingId = arg_70_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_GET_COMMISSION_AWARD, function(arg_71_0, arg_71_1, arg_71_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_COMMISSION_AWARD, {
			buildingId = arg_71_1,
			commissionId = arg_71_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_CHANGE_COMMISSION_FORMULA, function(arg_72_0, arg_72_1)
		arg_1_0:sendNotification(GAME.ISLAND_CHANGE_COMMISSION_FORMULA, {
			buildingId = arg_72_1.buildingId,
			commissionId = arg_72_1.commissionId,
			formulaId = arg_72_1.formulaId,
			callback = arg_72_1.callback
		})
	end)
	arg_1_0:bind(var_0_0.ON_CHANGE_COMMISSION_SHIP, function(arg_73_0, arg_73_1)
		arg_1_0:sendNotification(GAME.ISLAND_CHANGE_COMMISSION_SHIP, {
			buildingId = arg_73_1.buildingId,
			commissionId = arg_73_1.commissionId,
			shipId = arg_73_1.shipId,
			callback = arg_73_1.callback
		})
	end)
	arg_1_0:bind(var_0_0.ON_UNLOCK_TECH, function(arg_74_0, arg_74_1)
		arg_1_0:sendNotification(GAME.ISLAND_UNLOCK_TECH, {
			techId = arg_74_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_FINISH_TECH_IMMD, function(arg_75_0, arg_75_1, arg_75_2)
		arg_1_0:sendNotification(GAME.ISLAND_FINISH_TECH_IMMD, {
			techId = arg_75_1,
			callback = arg_75_2
		})
	end)
	arg_1_0:bind(var_0_0.START_DELEGATION, function(arg_76_0, arg_76_1, arg_76_2, arg_76_3, arg_76_4, arg_76_5)
		arg_1_0:sendNotification(GAME.ISLAND_START_DELEGATION, {
			build_id = arg_76_1,
			area_id = arg_76_2,
			ship_id = arg_76_3,
			formula_id = arg_76_4,
			num = arg_76_5
		})
	end)
	arg_1_0:bind(var_0_0.STOP_DELEGATION, function(arg_77_0, arg_77_1, arg_77_2)
		arg_1_0:sendNotification(GAME.ISLAND_FINISH_DELEGATION, {
			build_id = arg_77_1,
			area_id = arg_77_2
		})
	end)
	arg_1_0:bind(var_0_0.GET_DELEGATION_AWARD, function(arg_78_0, arg_78_1, arg_78_2, arg_78_3, arg_78_4)
		arg_1_0:sendNotification(GAME.ISLAND_GET_DELEGATION_AWARD, {
			build_id = arg_78_1,
			area_id = arg_78_2,
			type = arg_78_3,
			callback = arg_78_4
		})
	end)
	arg_1_0:bind(var_0_0.USE_SPEEDUPCARD, function(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4)
		arg_1_0:sendNotification(GAME.ISLAND_USESPEEDUPCARD, {
			build_id = arg_79_1,
			area_id = arg_79_2,
			item_id = arg_79_3,
			num = arg_79_4
		})
	end)
	arg_1_0:bind(var_0_0.GET_SHOP_DATA, function(arg_80_0, arg_80_1, arg_80_2)
		arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP, {
			operation = IslandConst.SHOP_GET_DATA,
			shopId = arg_80_1,
			refreshAll = arg_80_2
		})
	end)
	arg_1_0:bind(var_0_0.BUY_COMMODITY, function(arg_81_0, arg_81_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP, {
			operation = IslandConst.SHOP_BUY_COMMODITY,
			commodityList = arg_81_1
		})
	end)
	arg_1_0:bind(var_0_0.REFRESH_SHOP_BY_PLAYER, function(arg_82_0, arg_82_1, arg_82_2)
		arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP, {
			operation = IslandConst.SHOP_REFRESH_BY_PLAYER,
			shopId = arg_82_1,
			resource = arg_82_2
		})
	end)
end

function var_0_0._listNotificationInterests(arg_83_0)
	return {
		GAME.ISLAND_SET_NAME_DONE,
		GAME.ISLAND_PROSPERITY_AWARD_DONE,
		GAME.ISLAND_UPGRADE_DONE,
		GAME.ISLAND_SET_MANIFESTO_DONE,
		GAME.ISLAND_UPGRADE_INVENTORY_DONE,
		GAME.ISLAND_SUBMIT_ORDER_DONE,
		GAME.ISLAND_REPLACE_ORDER_DONE,
		GAME.ISLAND_GET_ORDER_EXP_AWARD_DONE,
		GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE,
		GAME.ISLAND_ACCEPT_TASK_DONE,
		GAME.ISLAND_UPDATE_TASK_DONE,
		GAME.ISLAND_SUBMIT_TASK_DONE,
		GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE,
		GAME.ISLAND_SET_TRACE_TASK_DONE,
		GAME.ISLAND_GET_ACHV_AWARD_DONE,
		GAME.ISLAND_RESET_SEASON_DONE,
		GAME.ISLAND_GET_SEASON_PT_AWARD_DONE,
		GAME.ISLAND_CONVERT_SEASON_PT_DONE,
		GAME.ISLAND_GET_SEASON_RANK_DONE,
		GAME.ISLAND_OPEN_RESTAURANT_DONE,
		GAME.ISLAND_CLOSE_RESTAURANT_DONE,
		GAME.ISLAND_UPGRADE_SKILL_DONE,
		GAME.ISLAND_USE_ITEM_DONE,
		GAME.ISLAND_GET_OVERFLOW_ITEM_DOME,
		GAME.ISLAND_SET_ORDER_TENDENCY_DONE,
		GAME.ISLAND_UNLOCK_TECH_DONE,
		GAME.ISLAND_FINISH_TECH_IMMD_DONE,
		GAME.ISLAND_SHIP_ORDER_OP_DONE,
		GAME.ISLAND_START_DELEGATION_DONE,
		GAME.ISLAND_GET_DELEGATION_AWARD_DONE,
		GAME.ISLAND_FINISH_DELEGATION_DONE,
		GAME.ISLAND_USESPEEDUPCARD_DONE,
		GAME.ISLAND_USE_SHIP_EXP_BOOK_DONE,
		GAME.ISLAND_SHIP_BREAKOUT_DONE,
		GAME.ISLNAD_SHIP_ATTR_UPGRADE_DONE,
		GAME.ISLNAD_SHIP_ATTR_LIMIT_UNLOCK_DONE,
		GAME.ISLAND_SHIP_SKILL_UPGRADE_DONE,
		GAME.ISLAND_INVITE_SHIP_DONE,
		GAME.ISLAND_GIVE_GIFT_DONE,
		GAME.ISLAND_SELECT_GIFT_DONE,
		GAME.ISLAND_SIGN_IN_INVITATION_DONE,
		GAME.FRIEND_SEARCH_DONE,
		GAME.ISLAND_REFRESH_INVITECODE_DONE,
		GAME.ISLAND_QUEUE_UP,
		GAME.ISLAND_ACCESS_OP_DONE,
		GAME.FRIEND_DELETE_DONE,
		GAME.ISLAND_SIGN_SHARE_SIGNIN_DONE,
		GAME.ISLAND_SIGN_IN_DONE,
		NotificationProxy.FRIEND_REQUEST_REMOVED,
		NotificationProxy.FRIEND_REQUEST_ADDED,
		PlayerProxy.UPDATED,
		GAME.ISLAND_SHOP_OP_DONE,
		GAME.ISLAND_DROPMAIN_AWARD,
		GAME.ISLAND_CHANGE_COMMANDER_DRESS_DONE,
		GAME.ISLAND_SEND_ROLE_DRESS_DONE,
		GAME.ISLAND_SEND_ROLE_DRESS_READ_DONE,
		GAME.ISLAND_BUY_ROLE_SKIN_COLOR_DONE,
		GAME.ISLAND_BUY_ROLE_DRESS_COLOR_DONE
	}
end

function var_0_0._handleNotification(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_1:getName()
	local var_84_1 = arg_84_1:getBody()

	if var_84_0 == GAME.ISLAND_PROSPERITY_AWARD_DONE or var_84_0 == GAME.ISLAND_CONVERT_SEASON_PT_DONE or var_84_0 == GAME.ISLAND_GET_SEASON_PT_AWARD_DONE or var_84_0 == GAME.ISLAND_GET_ACHV_AWARD_DONE or var_84_0 == GAME.ISLAND_FINISH_TECH_DONE or var_84_0 == GAME.ISLAND_FINISH_TECH_IMMD_DONE or var_84_0 == GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE or var_84_0 == GAME.ISLAND_SHIP_ORDER_OP_DONE or var_84_0 == GAME.ISLAND_GET_DELEGATION_AWARD_DONE then
		arg_84_0.viewComponent:HandleAwardDisplay(var_84_1.dropData, var_84_1.callback)
	elseif var_84_0 == GAME.ISLAND_SELECT_GIFT_DONE then
		arg_84_0.viewComponent:HandleAwardDisplay(var_84_1.dropData, var_84_1.callback, IslandAwardDisplayPage.TYPE_SIGN_GIFT)
	elseif var_84_0 == GAME.ISLAND_INVITE_SHIP_DONE then
		arg_84_0:HandleShipDisplay(var_84_1.ship)
	elseif var_84_0 == GAME.ISLAND_SHIP_BREAKOUT_DONE then
		arg_84_0:HandleShipBreakOutAwardDisplay(var_84_1)
	elseif var_84_0 == GAME.ISLAND_GET_ORDER_EXP_AWARD_DONE then
		seriesAsync({
			function(arg_85_0)
				arg_84_0.viewComponent:emit(IslandOrderPage.ON_UPDADE, {
					level = var_84_1.level,
					callback = arg_85_0
				})
			end
		}, function()
			arg_84_0.viewComponent:HandleAwardDisplay(var_84_1.dropData, var_84_1.callback)
		end)
	elseif var_84_0 == GAME.ISLAND_GET_OVERFLOW_ITEM_DOME then
		if #var_84_1.awards <= 0 then
			return
		end

		arg_84_0.viewComponent:DisplayAward({
			title = i18n("island_item_transfer"),
			awards = var_84_1.awards,
			callback = var_84_1.callback
		})
	elseif var_84_0 == GAME.ISLAND_SET_MANIFESTO_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_set_manifesto_success"))
	elseif var_84_0 == GAME.ISLAND_SUBMIT_ORDER_DONE then
		local var_84_2 = {
			function(arg_87_0)
				arg_84_0.viewComponent:HandleAwardDisplay(var_84_1.dropData, arg_87_0)
			end
		}

		seriesAsync(var_84_2, function()
			if var_84_1.callback then
				var_84_1.callback()
			end

			arg_84_0.viewComponent:emit(IslandScene.ON_CHECK_ORDER_EXP_AWARD)
		end)
	elseif var_84_0 == GAME.ISLAND_ACCEPT_TASK_DONE then
		arg_84_0:HandleTaskAccepted(var_84_1)
	elseif var_84_0 == GAME.ISLAND_SUBMIT_TASK_DONE then
		seriesAsync({
			function(arg_89_0)
				local var_89_0, var_89_1 = IslandTask.GetSubmitPlayInfo(var_84_1.taskId)

				if var_89_0 == 1 then
					arg_84_0.viewComponent:PlayStory({
						name = var_89_1,
						callback = arg_89_0
					})
				elseif var_89_0 == 2 then
					arg_84_0.viewComponent:OnPlayPerformance({
						name = var_89_1,
						callback = arg_89_0
					})
				else
					arg_89_0()
				end
			end
		}, function()
			local function var_90_0()
				local var_91_0 = pg.island_task[var_84_1.taskId].com_page

				if var_91_0 ~= "" and var_91_0[1] then
					arg_84_0.viewComponent:OpenPage(_G[var_91_0[1]], var_91_0[2] and unpack(var_91_0[2]))
				end

				existCall(var_84_1.callback)
			end

			arg_84_0.viewComponent:HandleAwardDisplay(var_84_1.dropData, var_90_0)
		end)
	elseif var_84_0 == GAME.ISLAND_SET_TRACE_TASK_DONE then
		arg_84_0.viewComponent:OnUpdateTrackTask(var_84_1.traceId)
	elseif var_84_0 == GAME.ISLAND_RESET_SEASON_DONE then
		seriesAsync({
			function(arg_92_0)
				arg_84_0.viewComponent:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_season_reset"),
					onHide = arg_92_0
				})
			end
		}, function()
			arg_84_0.viewComponent:ShowMsgbox({
				type = IslandMsgBox.TYPE_SEASON_RESET,
				body = var_84_1
			})
		end)
	elseif var_84_0 == GAME.ISLAND_CLOSE_RESTAURANT_DONE then
		seriesAsync({
			function(arg_94_0)
				if var_84_1.isUpgrade then
					arg_84_0.viewComponent:OpenPage(IslandRestaurantUpgradePage, var_84_1, arg_94_0)
				else
					arg_94_0()
				end
			end,
			function(arg_95_0)
				arg_84_0.viewComponent:OpenPage(IslandRestaurantSettlePage, var_84_1, arg_95_0)
			end
		}, function()
			arg_84_0.viewComponent:HandleAwardDisplay(var_84_1.dropData)
		end)
	elseif var_84_0 == GAME.ISLAND_DROPMAIN_AWARD then
		arg_84_0.viewComponent:UpdateMainAwardReward({
			awards = var_84_1.dropData.awards
		})
	elseif var_84_0 == GAME.ISLAND_QUEUE_UP then
		arg_84_0.viewComponent:ShowQueueUpMsgBox(var_84_1.id, var_84_1.pos)
	elseif var_84_0 == GAME.ISLAND_SIGN_IN_DONE then
		-- block empty
	end
end

function var_0_0.HandleTaskAccepted(arg_97_0, arg_97_1)
	local var_97_0 = {}
	local var_97_1 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

	for iter_97_0, iter_97_1 in ipairs(arg_97_1.taskIds) do
		local var_97_2 = pg.island_task[iter_97_1]

		if var_97_2.rec_perform ~= "" then
			table.insert(var_97_0, function(arg_98_0)
				arg_97_0.viewComponent:PlayStory({
					name = var_97_2.rec_perform,
					callback = arg_98_0
				})
			end)
		end

		if var_97_2.trigger_tips == 1 then
			table.insert(var_97_0, function(arg_99_0)
				arg_97_0.viewComponent:ShowTaskAcceptPage({
					taskId = iter_97_1,
					callback = arg_99_0
				})
			end)
		end

		local var_97_3 = var_97_1:GetTask(iter_97_1)

		if var_97_3:IsFinish() and var_97_3:IsSubmitImmediately() then
			table.insert(var_97_0, function(arg_100_0)
				pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
					taskId = iter_97_1,
					callback = arg_100_0
				})
			end)
		end
	end

	seriesAsync(var_97_0, function()
		existCall(arg_97_1.callback)
	end)
end

function var_0_0.HandleShipBreakOutAwardDisplay(arg_102_0, arg_102_1)
	seriesAsync({
		function(arg_103_0)
			arg_102_0.viewComponent:DisplayAward({
				type = IslandAwardDisplayPage.TYPE_SHIP_BREAK,
				newShip = arg_102_1.newShip,
				oldShip = arg_102_1.oldShip,
				callback = arg_103_0
			})
		end,
		function(arg_104_0)
			onNextTick(arg_104_0)
		end,
		function(arg_105_0)
			if not arg_102_1.isUnlockSkill then
				arg_105_0()

				return
			end

			arg_102_0.viewComponent:DisplayAward({
				type = IslandAwardDisplayPage.TYPE_SHIP_SKILL,
				skill = arg_102_1.newShip:GetSkill(),
				ship = arg_102_1.newShip,
				callback = arg_105_0
			})
		end
	})
end

function var_0_0.HandleShipDisplay(arg_106_0, arg_106_1)
	arg_106_0.viewComponent:OpenPage(IslandGetShipPage, arg_106_1)
end

return var_0_0
