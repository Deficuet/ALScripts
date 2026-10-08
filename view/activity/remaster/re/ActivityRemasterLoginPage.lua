local var_0_0 = class("ActivityRemasterLoginPage", import("view.activity.CorePage.templatePage.CoreLoginSignTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.bgImg = arg_1_0.bg:GetComponent(typeof(Image))
	arg_1_0.startTm = arg_1_0.bg:Find("time"):GetComponent(typeof(Text))
	arg_1_0.endTm = arg_1_0.bg:Find("time/Text"):GetComponent(typeof(Text))
	arg_1_0.timeLabel = arg_1_0.bg:Find("time/label"):GetComponent(typeof(Text))
end

function var_0_0.OnFirstFlush(arg_2_0)
	setActive(arg_2_0.item, false)
	arg_2_0.itemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventInit then
			local var_3_0 = arg_3_2:Find("item")
			local var_3_1 = Drop.Create(arg_2_0.config.front_drops[arg_3_1 + 1])

			updateDrop(var_3_0, var_3_1)
			onButton(arg_2_0, arg_3_2, function()
				arg_2_0:emit(BaseUI.ON_DROP, var_3_1)
			end, SFX_PANEL)
			GetImageSpriteFromAtlasAsync("ui/share/light_login_atlas", "DAY" .. arg_3_1 + 1, arg_3_2:Find("day"), true)
		elseif arg_3_0 == UIItemList.EventUpdate then
			local var_3_2 = arg_3_1 < arg_2_0.nday

			setActive(arg_3_2:Find("got"), var_3_2)
			setActive(arg_3_2:Find("get"), var_3_2)
			setActive(arg_3_2:Find("bg"), not var_3_2)
		end
	end)
	arg_2_0:UpdateBg()
	arg_2_0:UpdateTime()
end

function var_0_0.UpdateBg(arg_5_0)
	local var_5_0 = arg_5_0.activity:getConfig("config_client").bg or "1"

	arg_5_0.bgImg.sprite = LoadSprite("ActRemasterBg/" .. var_5_0)
end

function var_0_0.UpdateTime(arg_6_0)
	local var_6_0, var_6_1 = getProxy(ActivityRemasterProxy):InActTime()

	if not var_6_0 then
		return
	end

	local var_6_2 = pg.activity_re_timer[var_6_1]
	local var_6_3 = var_6_2.timer[2][1][1]
	local var_6_4 = var_6_2.timer[2][1][2]
	local var_6_5 = var_6_2.timer[2][1][3]
	local var_6_6 = var_6_2.timer[3][1][1]
	local var_6_7 = var_6_2.timer[3][1][2]
	local var_6_8 = var_6_2.timer[3][1][3]

	arg_6_0.startTm.text = var_6_4 .. "." .. var_6_5
	arg_6_0.endTm.text = var_6_7 .. "." .. var_6_8
	arg_6_0.timeLabel.text = i18n("act_remaster_tip_2", "")
end

return var_0_0
