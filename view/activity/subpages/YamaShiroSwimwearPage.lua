local var_0_0 = class("YamaShiroSwimwearPage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.goBtn = arg_1_0._tf:Find("GoBtn")
	arg_1_0.gotBtn = arg_1_0._tf:Find("GotBtn")
	arg_1_0.stepText = arg_1_0._tf:Find("Step")
end

function var_0_0.OnDataSetting(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_data")

	arg_2_0.taskIDList = _.flatten(var_2_0)

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.goBtn, function()
		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
			page = "activity"
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_5_0)
	local var_5_0, var_5_1 = getActivityTask(arg_5_0.activity)
	local var_5_2 = table.indexof(arg_5_0.taskIDList, var_5_0, 1)

	setText(arg_5_0.stepText, var_5_2)

	local var_5_3 = var_5_1:getTaskStatus()

	setActive(arg_5_0.goBtn, var_5_3 == 0 or var_5_3 == 1)
	setActive(arg_5_0.gotBtn, var_5_3 == 2)
end

function var_0_0.OnDestroy(arg_6_0)
	return
end

return var_0_0
