local var_0_0 = class("LoginTemplatePage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.itemList = UIItemList.New(arg_1_0.items, arg_1_0.item)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.config = pg.activity_7_day_sign[arg_2_0.activity:getConfig("config_id")]
	arg_2_0.Day = #arg_2_0.config.front_drops
end

function var_0_0.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.item, false)
	arg_3_0.itemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_4_2:Find("item")
			local var_4_1 = Drop.Create(arg_3_0.config.front_drops[arg_4_1 + 1])

			updateDrop(var_4_0, var_4_1)
			onButton(arg_3_0, arg_4_2, function()
				arg_3_0:emit(BaseUI.ON_DROP, var_4_1)
			end, SFX_PANEL)

			local var_4_2 = arg_4_2:Find("got")

			setActive(var_4_2, arg_4_1 < arg_3_0.nday)

			local var_4_3 = arg_4_2:Find("day/Text")

			setText(var_4_3, arg_4_1 < arg_3_0.nday and i18n("word_status_inEventFinished") or i18n("which_day_2", arg_4_1 + 1))
		end
	end)
end

function var_0_0.OnUpdateFlush(arg_6_0)
	arg_6_0.nday = arg_6_0.activity.data1

	arg_6_0.itemList:align(arg_6_0.Day)
end

function var_0_0.OnDestroy(arg_7_0)
	clearImageSprite(arg_7_0.bg)
	removeAllChildren(arg_7_0.items)
end

return var_0_0
