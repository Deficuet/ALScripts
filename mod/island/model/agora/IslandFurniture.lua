local var_0_0 = class("IslandFurniture")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_1.id
	arg_1_0.count = arg_1_1.count or 1
end

return var_0_0
