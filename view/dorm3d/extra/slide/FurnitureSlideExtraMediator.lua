local var_0_0 = class("FurnitureSlideExtraMediator", import("view.base.ContextMediator"))

var_0_0.OPEN_INVITE_LAYER = "FurnitureSlideExtraMediator.OPEN_INVITE_LAYER"
var_0_0.GO_SLIDE_PERFORMANCE = "FurnitureSlideExtraMediator.GO_SLIDE_PERFORMANCE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_INVITE_LAYER, function(arg_2_0, arg_2_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dSlideInviteLayer,
			mediator = Dorm3dInviteMediator,
			data = {
				groupIds = arg_2_1,
				roomId = SlideConst.ROOM_ID
			}
		}))
	end)
	arg_1_0:bind(var_0_0.GO_SLIDE_PERFORMANCE, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_SLIDE, {
			groupId = arg_3_1
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_4_0)
	arg_4_0.handleDic = {
		[ApartmentProxy.UPDATE_SLIDE_INVITE_LIST] = function(arg_5_0, arg_5_1)
			local var_5_0 = arg_5_1:getBody()

			arg_5_0.viewComponent:UpdateSlideInviteList(var_5_0.groupIds, var_5_0.addIds, var_5_0.removeIds)
		end,
		[Dorm3dRoomMediator.REFRESH_FURNITURE_AND_SLOTS_DONE] = function(arg_6_0, arg_6_1)
			arg_6_0.viewComponent:InitSlide()
		end
	}
end

return var_0_0
