local var_0_0 = class("NicoMainPage", import(".TemplatePage.PreviewTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.progress = arg_1_0.bg:Find("progress")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = arg_2_0.activity:getConfig("config_data")

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnUpdateFlush(arg_3_0)
	arg_3_0.nday = arg_3_0.activity.data3

	local var_3_0, var_3_1 = arg_3_0:getColor()
	local var_3_2 = #arg_3_0.taskGroup
	local var_3_3 = var_3_0 and setColorStr(arg_3_0.nday, var_3_0) or arg_3_0.nday
	local var_3_4 = var_3_1 and setColorStr("/" .. var_3_2, var_3_1) or var_3_2

	setText(arg_3_0.progress, var_3_3 .. var_3_4)
	arg_3_0:PlayStory()
end

function var_0_0.getColor(arg_4_0)
	return "#ac8c9f", "#FF6767"
end

function var_0_0.PlayStory(arg_5_0)
	local var_5_0 = arg_5_0.activity:getConfig("config_client").story

	if checkExist(var_5_0, {
		arg_5_0.nday
	}, {
		1
	}) then
		pg.NewStoryMgr.GetInstance():Play(var_5_0[arg_5_0.nday][1], function()
			if checkExist(var_5_0, {
				arg_5_0.nday
			}, {
				2
			}) then
				pg.NewStoryMgr.GetInstance():Play(var_5_0[arg_5_0.nday][2])
			end
		end)
	end
end

return var_0_0
