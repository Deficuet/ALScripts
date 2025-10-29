local var_0_0 = class("SNLoginRePage", import(".TemplatePage.LoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.bar = arg_1_0.bg:Find("bar")
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
			GetImageSpriteFromAtlasAsync("ui/activityuipage/snloginrepage_atlas", "DAY" .. arg_3_1 + 1, arg_3_2:Find("day"), true)
		elseif arg_3_0 == UIItemList.EventUpdate then
			local var_3_3 = arg_3_1 < arg_2_0.nday

			setActive(arg_3_2:Find("got"), var_3_3)
			setActive(arg_3_2:Find("get"), var_3_3)
			setActive(arg_3_2:Find("bg"), not var_3_3)
		end
	end)
end

function var_0_0.OnUpdateFlush(arg_5_0)
	var_0_0.super.OnUpdateFlush(arg_5_0)
	setFillAmount(arg_5_0.bar, arg_5_0.nday / arg_5_0.Day)
end

function var_0_0.OnDestroy(arg_6_0)
	return
end

return var_0_0
