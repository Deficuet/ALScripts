local var_0_0 = class("Day7LoginPage", import("...base.BaseActivityPage"))

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/activityuipage/day7_login_atlas"
	}

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))

	return var_1_0
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("bg")
	arg_2_0.labelDay = arg_2_0._tf:Find("days")
	arg_2_0.items = arg_2_0._tf:Find("items")
	arg_2_0.item = arg_2_0._tf:Find("item")
end

function var_0_0.OnDataSetting(arg_3_0)
	arg_3_0.config = pg.activity_7_day_sign[arg_3_0.activity:getConfig("config_id")]
end

function var_0_0.OnFirstFlush(arg_4_0)
	setActive(arg_4_0.item, false)

	for iter_4_0 = 1, 7 do
		local var_4_0 = cloneTplTo(arg_4_0.item, arg_4_0.items)
		local var_4_1 = var_4_0:Find("item")
		local var_4_2 = Drop.Create(arg_4_0.config.front_drops[iter_4_0])

		updateDrop(var_4_1, var_4_2)
		onButton(arg_4_0, var_4_0, function()
			arg_4_0:emit(BaseUI.ON_DROP, var_4_2)
		end, SFX_PANEL)
	end
end

function var_0_0.OnUpdateFlush(arg_6_0)
	GetImageSpriteFromAtlasAsync("ui/activityuipage/day7_login_atlas", string.format("0%d", math.max(arg_6_0.activity.data1, 1)), arg_6_0.labelDay, true)

	for iter_6_0 = 1, 7 do
		local var_6_0 = arg_6_0.items:GetChild(iter_6_0 - 1)
		local var_6_1 = iter_6_0 <= arg_6_0.activity.data1

		GetImageSpriteFromAtlasAsync("ui/activityuipage/day7_login_atlas", string.format("day%d", iter_6_0) .. (var_6_1 and "_sel" or ""), var_6_0:Find("day"), true)
		setActive(var_6_0:Find("got"), var_6_1)
	end
end

function var_0_0.OnDestroy(arg_7_0)
	clearImageSprite(arg_7_0.bg)
	removeAllChildren(arg_7_0.items)
end

return var_0_0
