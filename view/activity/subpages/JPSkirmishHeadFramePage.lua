local var_0_0 = class("JPSkirmishHeadFramePage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.goBtn = arg_1_0.bg:Find("GoBtn")
	arg_1_0.getBtn = arg_1_0.bg:Find("GetBtn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("GotBtn")
	arg_1_0.gotTag = arg_1_0.bg:Find("GotTag")
	arg_1_0.progressBar = arg_1_0.bg:Find("Progress")
	arg_1_0.progressText = arg_1_0.bg:Find("ProgressText")

	setActive(arg_1_0.goBtn, false)
	setActive(arg_1_0.getBtn, false)
	setActive(arg_1_0.gotBtn, false)
	setActive(arg_1_0.gotTag, false)
end

function var_0_0.OnDataSetting(arg_2_0)
	if arg_2_0.ptData then
		arg_2_0.ptData:Update(arg_2_0.activity)
	else
		arg_2_0.ptData = ActivityPtData.New(arg_2_0.activity)
	end
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.goBtn, function()
		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		local var_5_0, var_5_1 = arg_3_0.ptData:GetResProgress()

		arg_3_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = arg_3_0.ptData:GetId(),
			arg1 = var_5_1
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_6_0)
	local var_6_0 = arg_6_0.activity:getConfig("config_client").linkExpActID
	local var_6_1 = getProxy(ActivityProxy):getActivityById(var_6_0)

	if not var_6_1 or var_6_1:isEnd() then
		local var_6_2 = arg_6_0.ptData:CanGetAward()
		local var_6_3 = arg_6_0.ptData:CanGetNextAward()
		local var_6_4 = arg_6_0.ptData:CanGetMorePt()

		setActive(arg_6_0.goBtn, var_6_4 and not var_6_2 and var_6_3)
		setActive(arg_6_0.getBtn, var_6_2)
		setActive(arg_6_0.gotBtn, not var_6_3)
		setActive(arg_6_0.gotTag, not var_6_3)
	end

	local var_6_5, var_6_6, var_6_7 = arg_6_0.ptData:GetResProgress()

	setText(arg_6_0.progressText, setColorStr(var_6_5, "#487CFFFF") .. "/" .. var_6_6)
	setSlider(arg_6_0.progressBar, 0, 1, var_6_7)
	setActive(arg_6_0.progressText, true)
end

function var_0_0.OnDestroy(arg_7_0)
	return
end

return var_0_0
