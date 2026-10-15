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
	local var_3_0, var_3_1 = arg_3_0:getColor()
	local var_3_2 = arg_3_0.activity.data3
	local var_3_3 = #arg_3_0.taskGroup
	local var_3_4 = var_3_0 and setColorStr(var_3_2, var_3_0) or var_3_2
	local var_3_5 = var_3_1 and setColorStr("/" .. var_3_3, var_3_1) or var_3_3

	setText(arg_3_0.progress, var_3_4 .. var_3_5)
end

function var_0_0.getColor(arg_4_0)
	return "#ac8c9f", "#FF6767"
end

return var_0_0
