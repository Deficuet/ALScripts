local var_0_0 = class("SharedIslandOtherCardPage", import("Mod.Island.View.page.card.IslandOtherCardPage"))

function var_0_0.AddSubLayers(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(SharedIslandMediator)

	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_1_0,
		context = arg_1_1
	})
end

return var_0_0
