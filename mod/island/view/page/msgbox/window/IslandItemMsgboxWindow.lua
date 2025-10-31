local var_0_0 = class("IslandItemMsgboxWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxWithItems"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.uiItemList = UIItemList.New(arg_2_0._tf:Find("items"), arg_2_0._tf:Find("items/tpl"))
end

function var_0_0.OnShow(arg_3_0)
	var_0_0.super.OnShow(arg_3_0)
	arg_3_0:FlushItems(arg_3_0.settings)
end

function var_0_0.FlushItems(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.drops

	assert(var_4_0)
	arg_4_0.uiItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = var_4_0[arg_5_1 + 1]

			updateCustomDrop(arg_5_2, var_5_0)
		end
	end)
	arg_4_0.uiItemList:align(#var_4_0)
end

return var_0_0
