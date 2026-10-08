local var_0_0 = class("NetSalvageUpdate", import("....BaseEntity"))

var_0_0.Fields = {
	id = "number",
	list = "table",
	mapId = "number",
	step = "number"
}

function var_0_0.Setup(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.group_id
	arg_1_0.step = arg_1_1.cmd_collection.progress
	arg_1_0.list = underscore.to_array(arg_1_1.cmd_collection.progress_list)
	arg_1_0.mapId = arg_1_1.cmd_collection.random_id
end

function var_0_0.Dispose(arg_2_0)
	arg_2_0:Clear()
end

return var_0_0
