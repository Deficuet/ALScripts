local var_0_0 = class("IslandSceneContext")

function var_0_0.Ctor(arg_1_0, arg_1_1, ...)
	arg_1_0.class = arg_1_1
	arg_1_0.args = packEx(...)
	arg_1_0.subpages = {}
	arg_1_0.__visible = true
end

function var_0_0.AddSubPage(arg_2_0, arg_2_1, ...)
	local var_2_0 = _.detect(arg_2_0.subpages, function(arg_3_0)
		return arg_2_1.__cname == arg_3_0.class.__cname
	end)

	if var_2_0 then
		var_2_0.__visible = true

		return
	end

	local var_2_1 = IslandSceneContext.New(arg_2_1, ...)

	table.insert(arg_2_0.subpages, var_2_1)
end

function var_0_0.GetSubPages(arg_4_0)
	return arg_4_0.subpages
end

function var_0_0.GetData(arg_5_0)
	return arg_5_0.args
end

return var_0_0
