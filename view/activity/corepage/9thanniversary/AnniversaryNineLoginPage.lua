local var_0_0 = class("AnniversaryNineLoginPage", import("view.activity.CorePage.templatePage.CoreLoginSignTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.itemGroup = arg_1_0.bg:Find("bg_item")
	arg_1_0.item = arg_1_0.itemGroup:Find("item")
	arg_1_0.items = arg_1_0.itemGroup:Find("items")
	arg_1_0.itemList = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.btnMore = arg_1_0.bg:Find("btn_more")
end

function var_0_0.OnFirstFlush(arg_2_0)
	setActive(arg_2_0.item, false)
	arg_2_0.itemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
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

			local var_3_3 = arg_3_2:Find("got")

			setActive(var_3_3, arg_3_1 < arg_2_0.nday)
		end
	end)
	onButton(arg_2_0, arg_2_0.btnMore, function()
		Application.OpenURL(arg_2_0.activity:getConfig("config_client")[1])
	end, SFX_CONFIRM)
end

function var_0_0.OnUpdateFlush(arg_6_0)
	var_0_0.super.OnUpdateFlush(arg_6_0)
	setText(arg_6_0.itemGroup:Find("Text"), arg_6_0.nday .. "/" .. arg_6_0.Day)
end

return var_0_0
