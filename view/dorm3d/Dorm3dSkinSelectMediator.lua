local var_0_0 = class("Dorm3dSkinSelectMediator", import("view.base.ContextMediator"))

var_0_0.CHANGE_SKIN = "Dorm3dSkinSelectMediator:CHANGE_SKIN"
var_0_0.SWITCH_SKIN = "Dorm3dSkinSelectMediator:SWITCH_SKIN"
var_0_0.OPEN_SHOP_WINDOW = "Dorm3dSkinSelectMediator:OPEN_SHOP_WINDOW"
var_0_0.PLAY_ANIM = "Dorm3dSkinSelectMediator:PLAY_ANIM"
var_0_0.OPEN_ROOM_UNLOCK_WINDOW = "Dorm3dSkinSelectMediator:OPEN_ROOM_UNLOCK_WINDOW"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.CHANGE_SKIN, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0:sendNotification(GAME.APARTMENT_CHANGE_SKIN, {
			groupId = arg_2_1,
			skinId = arg_2_2
		})
		arg_1_0:sendNotification(GAME.APARTMENT_SKIN_PART_HIDDEN, {
			groupId = arg_2_1,
			skinId = arg_2_2,
			partList = arg_2_3
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_ROOM_UNLOCK_WINDOW, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dRoomUnlockWindow,
			mediator = Dorm3dRoomUnlockWindowMediator,
			data = {
				roomId = arg_3_1,
				groupId = arg_3_2
			},
			onRemoved = function()
				arg_1_0.viewComponent:FlushSkinList()
			end
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_SHOP_WINDOW, function(arg_5_0, arg_5_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dShoppingConfirmWindow,
			mediator = Dorm3dShoppingConfirmWindowMediator,
			data = arg_5_1
		}))
	end)
	arg_1_0:bind(GAME.SHOPPING, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.SHOPPING, arg_6_1)
	end)
	arg_1_0.viewComponent:SetApartment(getProxy(ApartmentProxy):getApartment(arg_1_0.contextData.groupId))
end

function var_0_0.initNotificationHandleDic(arg_7_0)
	local function var_7_0(arg_8_0)
		arg_7_0.viewComponent:FlushSkinList()

		local var_8_0 = pg.shop_template[arg_8_0].effect_args[1]
		local var_8_1 = ShipGroup.getDefaultShipNameByGroupID(arg_7_0.contextData.groupId)
		local var_8_2 = pg.dorm3d_resource[var_8_0].name

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
			title = i18n("title_info"),
			contentText = i18n("dorm3d_skin_equip", var_8_1, var_8_2),
			onConfirm = function()
				arg_7_0.viewComponent:ConfirmCurrentSkin()
			end,
			onClose = function()
				arg_7_0.viewComponent:CancelCurrentSkin()
			end
		})
	end

	arg_7_0.handleDic = {
		[GAME.SHOPPING_DONE] = function(arg_11_0, arg_11_1)
			local var_11_0 = arg_11_1:getBody()

			var_7_0(var_11_0.id)
		end,
		[GAME.APARTMENT_ROOM_INVITE_UNLOCK_DONE] = function(arg_12_0, arg_12_1)
			local var_12_0 = arg_12_1:getBody()
			local var_12_1 = getProxy(ApartmentProxy):getRoom(var_12_0.roomId):getConfig("invite_cost")
			local var_12_2 = Apartment.getGroupConfig(var_12_0.groupId, var_12_1)

			var_7_0(var_12_2)
		end,
		[ApartmentProxy.UPDATE_APARTMENT] = function(arg_13_0, arg_13_1)
			arg_13_0.viewComponent:SetApartment(getProxy(ApartmentProxy):getApartment(arg_13_0.contextData.groupId))
			arg_13_0.viewComponent:FlushSkinList()
		end
	}
end

function var_0_0.remove(arg_14_0)
	return
end

return var_0_0
