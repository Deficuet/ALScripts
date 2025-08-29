local var_0_0 = class("IslandTransferPlayer", import(".IslandBasePerformancePlayer"))

function var_0_0.Play(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1.objId

	arg_1_0:emit(ISLAND_EX_EVT.SWITCH_MAP, var_1_0)

	arg_1_0.callback = arg_1_2
end

function var_0_0.EndAction(arg_2_0)
	if arg_2_0.callback then
		arg_2_0.callback()
	end

	arg_2_0.callback = nil
end

return var_0_0
