local var_0_0 = {}

var_0_0.clearSprites = true

function var_0_0.Destroy(arg_1_0)
	local var_1_0 = UIUtil.IsGameObject(arg_1_0)
	local var_1_1 = var_1_0 and UIUtil.IsPrefab(arg_1_0)

	if var_1_0 and not var_1_1 then
		Object.Destroy(arg_1_0)
	end
end

return var_0_0
