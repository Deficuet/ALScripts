local var_0_0 = class("MainRequestReversePacmanActDataSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	getProxy(ReversePacmanDormProxy):RequestData(arg_1_1)
end

return var_0_0
