local var_0_0 = class("InstagramMainMediator", import("...base.ContextMediator"))

var_0_0.OPEN_CHAT = "InstagramMainMediator:OPEN_CHAT"
var_0_0.OPEN_JUUS = "InstagramMainMediator:OPEN_JUUS"
var_0_0.CLOSE_CHAT = "InstagramMainMediator:CLOSE_CHAT"
var_0_0.CLOSE_JUUS = "InstagramMainMediator:CLOSE_JUUS"
var_0_0.CHANGE_JUUS_TIP = "InstagramMainMediator:CHANGE_JUUS_TIP"
var_0_0.CHANGE_CHAT_TIP = "InstagramMainMediator:CHANGE_CHAT_TIP"
var_0_0.CLOSE_ALL = "InstagramMainMediator:CLOSE_ALL"
var_0_0.CLOSE_JUUS_DETAIL = "InstagramMainMediator:CLOSE_JUUS_DETAIL"
var_0_0.JUUS_BACK_PRESSED = "InstagramMainMediator:JUUS_BACK_PRESSED"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_CHAT, function(arg_2_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = InstagramChatLayer,
			mediator = InstagramChatMediator,
			data = {
				groupName = arg_1_0.viewComponent:getGroupName()
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_JUUS, function(arg_3_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = InstagramLayer,
			mediator = InstagramMediator,
			data = {
				groupName = arg_1_0.viewComponent:getGroupName()
			}
		}))
	end)
	arg_1_0:bind(var_0_0.CLOSE_CHAT, function(arg_4_0)
		arg_1_0:removeSubLayers(InstagramChatMediator)
	end)
	arg_1_0:bind(var_0_0.CLOSE_JUUS, function(arg_5_0)
		arg_1_0:removeSubLayers(InstagramMediator)
	end)
	arg_1_0:bind(var_0_0.CLOSE_JUUS_DETAIL, function(arg_6_0)
		arg_1_0:sendNotification(InstagramMediator.CLOSE_DETAIL)
	end)
	arg_1_0:bind(var_0_0.JUUS_BACK_PRESSED, function(arg_7_0)
		arg_1_0:sendNotification(InstagramMediator.BACK_PRESSED)
	end)
end

function var_0_0.listNotificationInterests(arg_8_0)
	return {
		var_0_0.CHANGE_CHAT_TIP,
		var_0_0.CHANGE_JUUS_TIP,
		var_0_0.CLOSE_ALL
	}
end

function var_0_0.handleNotification(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:getName()
	local var_9_1 = arg_9_1:getBody()

	if var_9_0 == var_0_0.CHANGE_CHAT_TIP then
		arg_9_0.viewComponent:ChangeChatTip()
	elseif var_9_0 == var_0_0.CHANGE_JUUS_TIP then
		arg_9_0.viewComponent:ChangeJuusTip()
	elseif var_9_0 == var_0_0.CLOSE_ALL then
		arg_9_0.viewComponent:closeView()
	end
end

return var_0_0
