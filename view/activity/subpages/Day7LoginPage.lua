local var_0_0 = class("Day7LoginPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.labelDay = arg_1_0._tf:Find("days")
	arg_1_0.items = arg_1_0._tf:Find("items")
	arg_1_0.item = arg_1_0._tf:Find("item")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.config = pg.activity_7_day_sign[arg_2_0.activity:getConfig("config_id")]
end

function var_0_0.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.item, false)

	for iter_3_0 = 1, 7 do
		local var_3_0 = cloneTplTo(arg_3_0.item, arg_3_0.items)
		local var_3_1 = var_3_0:Find("item")
		local var_3_2 = Drop.Create(arg_3_0.config.front_drops[iter_3_0])

		updateDrop(var_3_1, var_3_2)
		onButton(arg_3_0, var_3_0, function()
			arg_3_0:emit(BaseUI.ON_DROP, var_3_2)
		end, SFX_PANEL)
	end
end

function var_0_0.OnUpdateFlush(arg_5_0)
	GetImageSpriteFromAtlasAsync("ui/activityuipage/day7_login_atlas", string.format("0%d", math.max(arg_5_0.activity.data1, 1)), arg_5_0.labelDay, true)

	for iter_5_0 = 1, 7 do
		local var_5_0 = arg_5_0.items:GetChild(iter_5_0 - 1)
		local var_5_1 = iter_5_0 <= arg_5_0.activity.data1

		GetImageSpriteFromAtlasAsync("ui/activityuipage/day7_login_atlas", string.format("day%d", iter_5_0) .. (var_5_1 and "_sel" or ""), var_5_0:Find("day"), true)
		setActive(var_5_0:Find("got"), var_5_1)
	end
end

function var_0_0.OnDestroy(arg_6_0)
	clearImageSprite(arg_6_0.bg)
	removeAllChildren(arg_6_0.items)
end

return var_0_0
