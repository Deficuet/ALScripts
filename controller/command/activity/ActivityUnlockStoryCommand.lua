local var_0_0 = class("ActivityUnlockStoryCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(ActivityProxy):getActivityById(var_1_0.activity_id)

	assert(var_1_1)

	local var_1_2 = var_1_1:getConfig("type")

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = var_1_0.activity_id,
		cmd = var_1_0.cmd,
		arg1 = var_1_0.arg1
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(ActivityProxy):getActivityById(var_1_0.activity_id)

			var_2_0.data1 = var_2_0.data1 - 1

			getProxy(ActivityProxy):updateActivity(var_2_0)
			arg_1_0:sendNotification(GAME.ACTIVITY_STORYUNLOCKED_DONE, {
				storyId = var_1_0.arg1
			})
		end
	end)
end

return var_0_0
