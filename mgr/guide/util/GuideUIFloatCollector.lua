local var_0_0 = class("GuideUIFloatCollector")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.root = arg_1_1
	arg_1_0.caches = {}
end

function var_0_0.SetFloat(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.parent

	setParent(arg_2_1, arg_2_0.root, true)

	arg_2_1.localPosition = Vector3.New(arg_2_1.localPosition.x, arg_2_1.localPosition.y, 0)

	table.insert(arg_2_0.caches, {
		parent = var_2_0,
		tr = arg_2_1
	})
end

function var_0_0.Clear(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.caches) do
		local var_3_0 = iter_3_1.parent
		local var_3_1 = iter_3_1.tr

		setParent(var_3_1, var_3_0, true)

		var_3_1.localPosition = Vector3.New(var_3_1.localPosition.x, var_3_1.localPosition.y, 0)
	end

	arg_3_0.caches = {}
end

return var_0_0
