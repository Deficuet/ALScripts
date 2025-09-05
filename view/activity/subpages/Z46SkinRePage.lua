local var_0_0 = class("Z46SkinRePage", import(".TemplatePage.LoginTemplatePage"))

function var_0_0.OnFirstFlush(arg_1_0)
	setActive(arg_1_0.item, false)
	arg_1_0.itemList:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_1_0:findTF("item", arg_2_2)
			local var_2_1 = Drop.Create(arg_1_0.config.front_drops[arg_2_1 + 1])

			updateDrop(var_2_0, var_2_1)
			onButton(arg_1_0, arg_2_2, function()
				arg_1_0:emit(BaseUI.ON_DROP, var_2_1)
			end, SFX_PANEL)

			local var_2_2 = arg_1_0:findTF("got", arg_2_2)

			setActive(var_2_2, arg_2_1 < arg_1_0.nday)
		end
	end)
end

return var_0_0
