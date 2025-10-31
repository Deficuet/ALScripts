local var_0_0 = class("CastlePtPage", import(".TemplatePage.PtTemplatePage"))

var_0_0.MAIN_ID = ActivityConst.CASTLE_ACT_ID

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.bg:Find("main_btn"), function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.CASTLE_MAIN)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_3_0)
	var_0_0.super.OnUpdateFlush(arg_3_0)

	arg_3_0.mainAct = getProxy(ActivityProxy):getActivityById(var_0_0.MAIN_ID)

	local var_3_0 = arg_3_0.mainAct.data2
	local var_3_1 = arg_3_0.mainAct.data1

	if table.contains({
		4565,
		4568,
		4571,
		4574,
		4577,
		4580,
		4583,
		4586
	}, var_3_1) and not pg.NewStoryMgr.GetInstance():IsPlayed(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_3_1)) then
		var_3_0 = var_3_0 - 1
	end

	setText(arg_3_0.bg:Find("main_btn/Text"), i18n("roll_times_left", var_3_0))
	setText(arg_3_0.bg:Find("description"), i18n("activity_kill"))
end

return var_0_0
