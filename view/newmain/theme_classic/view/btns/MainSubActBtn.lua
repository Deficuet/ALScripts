local var_0_0 = class("MainSubActBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_sub_act"
end

function var_0_0.GetActivity(arg_2_0)
	if arg_2_0.config and arg_2_0.config.time and arg_2_0.config.time[1] == "default" then
		local var_2_0 = arg_2_0.config.time[2]
		local var_2_1 = getProxy(ActivityProxy):getActivityById(var_2_0)

		if var_2_1 and not var_2_1:isEnd() then
			return var_2_1
		end
	end

	return nil
end

function var_0_0.GetActivityID(arg_3_0)
	local var_3_0 = arg_3_0:GetActivity()

	return var_3_0 and var_3_0.id
end

function var_0_0.OnInit(arg_4_0)
	setActive(arg_4_0.tipTr, arg_4_0:IsShowTip())
end

function var_0_0.IsShowTip(arg_5_0)
	local var_5_0 = arg_5_0:GetActivity()
	local var_5_1 = var_5_0:getConfig("type")

	return switch(var_5_1, {
		[ActivityConst.ACTIVITY_TYPE_TOWN2] = function()
			return LiquorFloorMapScene.ShouldShowTaskTip()
		end
	}, function()
		return var_5_0:readyToAchieve()
	end)
end

return var_0_0
