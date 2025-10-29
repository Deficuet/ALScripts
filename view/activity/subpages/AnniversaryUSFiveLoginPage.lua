local var_0_0 = class("AnniversaryUSFiveLoginPage", import(".TemplatePage.LoginTemplatePage"))

function var_0_0.OnFirstFlush(arg_1_0)
	setActive(arg_1_0.item, false)
	arg_1_0.itemList:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_2_2:Find("item")
			local var_2_1 = arg_1_0.config.front_drops[arg_2_1 + 1]
			local var_2_2 = {
				type = var_2_1[1],
				id = var_2_1[2],
				count = var_2_1[3]
			}

			updateDrop(var_2_0, var_2_2)
			onButton(arg_1_0, arg_2_2, function()
				arg_1_0:emit(BaseUI.ON_DROP, var_2_2)
			end, SFX_PANEL)

			local var_2_3 = arg_2_2:Find("got")

			setActive(var_2_3, arg_2_1 < arg_1_0.nday)

			local var_2_4 = arg_2_2:Find("day/Text")

			if not IsNil(var_2_4) then
				setText(var_2_4, arg_2_1 < arg_1_0.nday and i18n("word_status_inEventFinished") or i18n("which_day_2", arg_2_1 + 1))
			end
		end
	end)
end

return var_0_0
