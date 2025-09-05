local var_0_0 = class("IslandPerformanceStoryPlayer", import(".IslandBasePerformancePlayer"))

function var_0_0.Play(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1.name

	require("nodecanvas.Task.NcPlayStory").New(nil, {}):DoAction(var_1_0, arg_1_2)
end

function var_0_0.Update(arg_2_0)
	return
end

function var_0_0.Clear(arg_3_0)
	return
end

return var_0_0
