local var_0_0 = class("IslandPerformanceStoryPlayer", import(".IslandBasePerformancePlayer"))

function var_0_0.Play(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1.name
	local var_1_1 = require("nodecanvas.Task.NcPlayStory")
	local var_1_2 = arg_1_1.refreshNpc

	var_1_1.New(nil, {}):DoAction(var_1_0, var_1_2, arg_1_2)
end

function var_0_0.Update(arg_2_0)
	return
end

function var_0_0.Clear(arg_3_0)
	return
end

return var_0_0
