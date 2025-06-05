local var_0_0 = class("CoreActivityMainMediator", import("view.activity.ActivityMediator"))

function var_0_0.getDisplayActivity(arg_1_0)
	return getProxy(ActivityProxy):getCorePanelActivity(arg_1_0.contextData.coreName)
end

return var_0_0
