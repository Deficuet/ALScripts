local var_0_0 = class("URExchangeActivity", import("model.vo.Activity"))

function var_0_0.GetConfigClientURPTDrop(arg_1_0)
	if arg_1_0:isEnd() then
		return nil
	end

	if arg_1_0:GetConfigClientSetting("PT_ACT_UR") then
		local var_1_0 = getProxy(ActivityProxy):getActivityById(arg_1_0:GetConfigClientSetting("PT_ACT_UR"))

		return var_1_0 and var_1_0:GetPTDrop() or nil
	elseif arg_1_0:GetConfigClientSetting("uPtId") then
		return Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = arg_1_0:GetConfigClientSetting("uPtId")
		})
	end

	return nil
end

function var_0_0.GetConfigClientURPTActivity(arg_2_0)
	if arg_2_0:isEnd() then
		return nil
	end

	if arg_2_0:GetConfigClientSetting("PT_ACT_UR") then
		return getProxy(ActivityProxy):getActivityById(arg_2_0:GetConfigClientSetting("PT_ACT_UR"))
	else
		local var_2_0 = arg_2_0:GetConfigClientURPTDrop()

		return var_2_0 and getProxy(ActivityProxy):GetPTActivityByRes(var_2_0) or nil
	end
end

return var_0_0
