local var_0_0 = class("SitanliLoginPage", import(".TemplatePage.LoginTemplatePage"))

function var_0_0.OnDataSetting(arg_1_0)
	arg_1_0.config = pg.activity_7_day_sign[arg_1_0.activity:getConfig("config_id")]
	arg_1_0.Day = 14
end

function var_0_0.OnFirstFlush(arg_2_0)
	setActive(arg_2_0.item, false)
	arg_2_0.itemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventInit then
			local var_3_0 = arg_3_2:Find("item")
			local var_3_1 = arg_2_0.config.front_drops[arg_3_1 + 1]
			local var_3_2 = {
				type = var_3_1[1],
				id = var_3_1[2],
				count = var_3_1[3]
			}

			updateDrop(var_3_0, var_3_2)
			onButton(arg_2_0, arg_3_2, function()
				arg_2_0:emit(BaseUI.ON_DROP, var_3_2)
			end, SFX_PANEL)
		elseif arg_3_0 == UIItemList.EventUpdate then
			local var_3_3 = arg_3_2:Find("got")

			setActive(var_3_3, arg_3_1 < arg_2_0.nday)
		end
	end)
end

return var_0_0
