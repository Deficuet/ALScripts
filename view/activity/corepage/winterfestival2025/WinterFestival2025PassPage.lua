local var_0_0 = class("WinterFestival2025PassPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.item = arg_1_0.items:Find("item")
	arg_1_0.btn = arg_1_0.bg:Find("btn")
	arg_1_0.itemList = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.red = arg_1_0.btn:Find("red")
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.config_client = arg_2_0.activity:getConfig("config_client")[1]
	arg_2_0.taskProxy = getProxy(TaskProxy)

	setActive(arg_2_0.item, false)
	onButton(arg_2_0, arg_2_0.btn, function()
		arg_2_0:emit(ActivityMediator.OPEN_LAYER, Context.New({
			mediator = WinterFestival2025Mediator,
			viewComponent = WinterFestival2025Scene
		}))
	end, SOUND_BACK)

	local var_2_0 = arg_2_0.bg:Find("btn/Text")

	setText(var_2_0, i18n("winter_battlepass_proceed"))

	if arg_2_0.coreActivityUI.contextData.openPass then
		triggerButton(arg_2_0.btn)
	end

	SetActive(arg_2_0.red, #arg_2_0.activity:GetHei5UnreceiveAward() > 0)
end

function var_0_0.OnUpdateFlush(arg_4_0)
	arg_4_0.itemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			local var_5_0 = arg_5_2:Find("item")
			local var_5_1 = Drop.Create({
				arg_4_0.config_client[arg_5_1 + 1][1],
				arg_4_0.config_client[arg_5_1 + 1][2],
				arg_4_0.config_client[arg_5_1 + 1][3]
			})

			updateDrop(var_5_0:Find("mask"), var_5_1)
			onButton(arg_4_0, arg_5_2, function()
				arg_4_0:emit(BaseUI.ON_DROP, var_5_1)
			end, SFX_PANEL)
		end
	end)
	arg_4_0.itemList:align(#arg_4_0.config_client)
end

return var_0_0
