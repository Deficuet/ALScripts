local var_0_0 = class("ClassResourcePage", import(".ResourcePage"))

function var_0_0.getUIName(arg_1_0)
	return "ClassResourcePage"
end

function var_0_0.getResource(arg_2_0)
	return {
		"ui/classresourcepage",
		"ui/resourcefieldui_atlas"
	}
end

function var_0_0.Load(arg_3_0, arg_3_1)
	if arg_3_0._state ~= var_0_0.STATES.NONE or arg_3_0.isDownloadingResource then
		return
	end

	arg_3_0.isDownloadingResource = true

	SplitPackConst.DownloadByLuaArr(arg_3_0:getResource(), function()
		arg_3_0.isDownloadingResource = nil

		if arg_3_0._state == var_0_0.STATES.DESTROY then
			return
		end

		var_0_0.super.Load(arg_3_0, arg_3_1)
	end)
end

function var_0_0.OnUpgrade(arg_5_0)
	local var_5_0 = arg_5_0.resourceField:GetUpgradeType()

	arg_5_0:emit(ClassMediator.UPGRADE_FIELD, var_5_0)
end

return var_0_0
