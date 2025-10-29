local var_0_0 = class("JPSkirmishHeadFrameRePage", import(".TemplatePage.FrameReTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.battleBtn = arg_1_0.bg:Find("GoBtn")
	arg_1_0.getBtn = arg_1_0.bg:Find("GetBtn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("GotBtn")
	arg_1_0.bar = arg_1_0.bg:Find("Progress")
	arg_1_0.progress = arg_1_0.bg:Find("ProgressText")
	arg_1_0.frameGot = arg_1_0.bg:Find("GotTag")
end

function var_0_0.OnUpdateFlush(arg_2_0)
	local var_2_0 = arg_2_0.activity.data1
	local var_2_1 = arg_2_0.avatarConfig.target

	var_2_0 = var_2_1 < var_2_0 and var_2_1 or var_2_0

	local var_2_2 = var_2_0 / var_2_1

	setText(arg_2_0.progress, (var_2_2 >= 1 and setColorStr(var_2_0, COLOR_GREEN) or var_2_0) .. "/" .. var_2_1)
	setSlider(arg_2_0.bar, 0, 1, var_2_2)

	local var_2_3 = var_2_1 <= var_2_0
	local var_2_4 = arg_2_0.activity.data2 >= 1
	local var_2_5 = arg_2_0.avatarConfig.start_time

	if var_2_5 == "stop" then
		arg_2_0.inTime = false
	else
		local var_2_6 = pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_2_5[1][1],
			month = var_2_5[1][2],
			day = var_2_5[1][3],
			hour = var_2_5[2][1],
			min = var_2_5[2][2],
			sec = var_2_5[2][3]
		})

		arg_2_0.inTime = pg.TimeMgr.GetInstance():GetServerTime() - var_2_6 > 0
	end

	setActive(arg_2_0.battleBtn, arg_2_0.inTime and not var_2_3 or false)
	setActive(arg_2_0.getBtn, not var_2_4 and var_2_3)
	setActive(arg_2_0.gotBtn, var_2_4)
	setActive(arg_2_0.frameGot, var_2_4)
end

return var_0_0
