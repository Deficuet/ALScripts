local var_0_0 = class("IslandSettingsPage", import(".IslandExternalBridgePage"))

function var_0_0.GetContext(arg_1_0)
	return Context.New({
		mediator = NewSettingsMediator,
		viewComponent = IslandSettingsScene
	})
end

return var_0_0
