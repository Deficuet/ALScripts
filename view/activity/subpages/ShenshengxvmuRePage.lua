local var_0_0 = class("ShenshengxvmuRePage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.step = arg_1_0.bg:Find("step")
	arg_1_0.progress = arg_1_0.bg:Find("progress")
	arg_1_0.displayBtn = arg_1_0.bg:Find("display_btn")
	arg_1_0.awardTF = arg_1_0.bg:Find("award")
	arg_1_0.battleBtn = arg_1_0.bg:Find("battle_btn")
	arg_1_0.getBtn = arg_1_0.bg:Find("get_btn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("got_btn")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	setActive(arg_2_0.displayBtn, false)
	setActive(arg_2_0.awardTF, false)
	onButton(arg_2_0, arg_2_0.battleBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
			page = "activity"
		})
	end, SFX_PANEL)

	arg_2_0.step = arg_2_0._tf:Find("AD/step")
	arg_2_0.progress = arg_2_0._tf:Find("AD/progress")
	arg_2_0.bar = arg_2_0._tf:Find("AD/slider/bar")

	local var_2_0 = pg.activity_event_avatarframe[arg_2_0.activity:getConfig("config_id")].start_time

	if var_2_0 == "stop" then
		arg_2_0.inTime = false
	else
		local var_2_1 = pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_2_0[1][1],
			month = var_2_0[1][2],
			day = var_2_0[1][3],
			hour = var_2_0[2][1],
			min = var_2_0[2][2],
			sec = var_2_0[2][3]
		})

		arg_2_0.inTime = pg.TimeMgr.GetInstance():GetServerTime() - var_2_1 > 0
	end

	setActive(arg_2_0.battleBtn, isActive(arg_2_0.battleBtn) and arg_2_0.inTime)
end

function var_0_0.Switch(arg_4_0, arg_4_1)
	arg_4_0:UpdateAwardGot()
	onButton(arg_4_0, arg_4_0.getBtn, function()
		arg_4_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_4_0.activity.id
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateAwardGot(arg_6_0)
	local var_6_0 = arg_6_0.activity.data2 >= 1
	local var_6_1 = arg_6_0._tf:Find("AD/got")

	setActive(var_6_1, var_6_0)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	local var_7_0 = arg_7_0.activity

	setActive(arg_7_0.battleBtn, isActive(arg_7_0.battleBtn) and arg_7_0.inTime)
	arg_7_0:UpdateAwardGot()

	local var_7_1 = arg_7_0.activity.data1
	local var_7_2 = pg.activity_event_avatarframe[arg_7_0.activity:getConfig("config_id")].target

	if var_7_2 < var_7_1 then
		var_7_1 = var_7_2
	end

	local var_7_3 = var_7_1 / var_7_2

	setText(arg_7_0.step, var_7_3 >= 1 and setColorStr(var_7_1, "#487CFFFF") or var_7_1)
	setText(arg_7_0.progress, "/" .. var_7_2)
	setFillAmount(arg_7_0.bar, var_7_1 / var_7_2)

	local var_7_4 = var_7_2 <= var_7_1
	local var_7_5 = arg_7_0.activity.data2 >= 1

	setActive(arg_7_0.battleBtn, not var_7_5 and not var_7_4 and arg_7_0.inTime)
	setActive(arg_7_0.getBtn, var_7_4 and not var_7_5)
	setActive(arg_7_0.gotBtn, var_7_5)
end

return var_0_0
