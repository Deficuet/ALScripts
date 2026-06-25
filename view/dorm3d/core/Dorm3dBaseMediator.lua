local var_0_0 = class("Dorm3dBaseMediator", import("view.base.ContextMediator"))

function var_0_0.GetDefaultSystemClasses()
	return DormConst.GetDefaultSystemClasses()
end

function var_0_0.handleNotification(arg_2_0, arg_2_1)
	var_0_0.super.handleNotification(arg_2_0, arg_2_1)

	local var_2_0 = arg_2_1:getName()
	local var_2_1 = arg_2_1:getBody()

	if arg_2_0.viewComponent.systemManager then
		arg_2_0.viewComponent.systemManager:BroadcastNotification(var_2_0, var_2_1)
	end
end

function var_0_0.listNotificationInterests(arg_3_0)
	local var_3_0 = underscore.keys(arg_3_0.handleDic or {})

	if arg_3_0.viewComponent and arg_3_0.viewComponent.systemManager then
		var_3_0 = table.mergeArray(var_3_0, arg_3_0.viewComponent.systemManager:GetAllInterests(), true)
	else
		local var_3_1 = arg_3_0.GetDefaultSystemClasses()

		for iter_3_0, iter_3_1 in ipairs(var_3_1) do
			if iter_3_1.GetInterests then
				var_3_0 = table.mergeArray(var_3_0, iter_3_1.GetInterests())
			end
		end
	end

	return var_3_0
end

return var_0_0
