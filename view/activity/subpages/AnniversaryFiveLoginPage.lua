local var_0_0 = class("AnniversaryFiveLoginPage", import(".TemplatePage.LoginTemplatePage"))

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
		end
	end)
	setActive(arg_1_0.bg:Find("btn_more"), PLATFORM_CODE == PLATFORM_CH and LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI and pg.TimeMgr.GetInstance():inTime(arg_1_0.activity:getConfig("config_client")[2]))
	onButton(arg_1_0, arg_1_0.bg:Find("btn_more"), function()
		Application.OpenURL(arg_1_0.activity:getConfig("config_client")[1])
	end, SFX_CONFIRM)
end

function var_0_0.OnUpdateFlush(arg_5_0)
	var_0_0.super.OnUpdateFlush(arg_5_0)
	setText(arg_5_0.bg:Find("Text"), arg_5_0.nday .. "/" .. arg_5_0.Day)
end

return var_0_0
