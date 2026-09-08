local var_0_0 = class("ShiningMagicJPLoginPage", import("view.activity.CorePage.templatePage.CoreLoginSignTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.itemGroup = arg_1_0.bg:Find("bg_item")
	arg_1_0.item = arg_1_0.itemGroup:Find("item")
	arg_1_0.items = arg_1_0.itemGroup:Find("items")
	arg_1_0.itemList = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.btnClick = arg_1_0.bg:Find("btn_get")
	arg_1_0.red = arg_1_0.btnClick:Find("red")
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.nday = arg_2_0.activity.data1

	setActive(arg_2_0.item, false)
	onButton(arg_2_0, arg_2_0.btnClick, function()
		if arg_2_0.activity:readyToAchieve() == false then
			return
		end

		arg_2_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_2_0.activity.id
		})
	end, SFX_CONFIRM)
	arg_2_0.itemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_4_2:Find("item")
			local var_4_1 = arg_2_0.config.front_drops[arg_4_1 + 1]
			local var_4_2 = {
				type = var_4_1[1],
				id = var_4_1[2],
				count = var_4_1[3]
			}

			updateDrop(var_4_0, var_4_2)
			onButton(arg_2_0, arg_4_2, function()
				arg_2_0:emit(BaseUI.ON_DROP, var_4_2)
			end, SFX_PANEL)

			local var_4_3 = arg_4_2:Find("got")

			setActive(var_4_3, arg_4_1 < arg_2_0.nday)
		end
	end)
end

function var_0_0.OnUpdateFlush(arg_6_0)
	arg_6_0.nday = arg_6_0.activity.data1

	local var_6_0 = arg_6_0.activity:readyToAchieve()

	setActive(arg_6_0.red, var_6_0)
	setGray(arg_6_0.btnClick, not var_6_0)
	setText(arg_6_0.itemGroup:Find("Text"), arg_6_0.nday .. "/" .. arg_6_0.Day)
	arg_6_0.itemList:align(arg_6_0.Day)
end

return var_0_0
