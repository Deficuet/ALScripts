local var_0_0 = class("IslandFindingPathPlayer", import(".IslandBasePerformancePlayer"))

function var_0_0.Play(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		unitId = arg_1_1.object,
		position = arg_1_1.position,
		speed = arg_1_1.speed,
		hide = arg_1_1.hide,
		waitUntilDone = arg_1_1.waitUntilDone,
		index = arg_1_1.index
	}

	arg_1_0:emit(IslandBaseScene.LINK_CORE_EVENT, IslandProxy.START_PATHFINDER, {
		navData = var_1_0,
		callback = arg_1_2
	})
end

return var_0_0
