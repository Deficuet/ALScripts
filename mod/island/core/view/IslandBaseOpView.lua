local var_0_0 = class("IslandBaseOpView", import(".IslandBaseSubView"))

function var_0_0.SetUIParent(arg_1_0, arg_1_1)
	setParent(arg_1_1, arg_1_0:GetView().opContainer)
end

return var_0_0
