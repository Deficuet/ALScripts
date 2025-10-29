local var_0_0 = class("WudaoLoginPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.labelDay = arg_1_0._tf:Find("days")
	arg_1_0.items = arg_1_0._tf:Find("items")
	arg_1_0.item = arg_1_0._tf:Find("item")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.config = pg.activity_7_day_sign[arg_2_0.activity:getConfig("config_id")]
end

function var_0_0.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.item, false)

	for iter_3_0 = 1, 8 do
		local var_3_0 = cloneTplTo(arg_3_0.item, arg_3_0.items:Find("layout"))
		local var_3_1 = var_3_0:Find("item")
		local var_3_2 = arg_3_0.config.front_drops[iter_3_0]
		local var_3_3 = {
			type = var_3_2[1],
			id = var_3_2[2],
			count = var_3_2[3]
		}

		updateDrop(var_3_1, var_3_3)
		onButton(arg_3_0, var_3_0, function()
			arg_3_0:emit(BaseUI.ON_DROP, var_3_3)
		end, SFX_PANEL)
	end
end

function var_0_0.OnUpdateFlush(arg_5_0)
	for iter_5_0 = 1, 8 do
		local var_5_0 = arg_5_0.items:Find("layout"):GetChild(iter_5_0 - 1)
		local var_5_1 = iter_5_0 <= arg_5_0.activity.data1

		GetImageSpriteFromAtlasAsync("ui/activityuipage/wudaologinpage_atlas", string.format("number%d", iter_5_0), var_5_0:Find("day"), true)
		setActive(var_5_0:Find("got"), var_5_1)
	end
end

function var_0_0.OnDestroy(arg_6_0)
	clearImageSprite(arg_6_0.bg)
	removeAllChildren(arg_6_0.items)
end

return var_0_0
