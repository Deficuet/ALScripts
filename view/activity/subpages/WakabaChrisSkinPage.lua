local var_0_0 = class("WakabaChrisSkinPage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.OnUpdateFlush(arg_1_0)
	arg_1_0.nday = arg_1_0.activity.data3

	local var_1_0 = {}
	local var_1_1 = arg_1_0.activity:getConfig("config_client").story
	local var_1_2 = pg.NewStoryMgr.GetInstance()

	for iter_1_0 = 1, arg_1_0.nday do
		if checkExist(var_1_1, {
			iter_1_0
		}, {
			1
		}) and not var_1_2:IsPlayed(var_1_1[iter_1_0][1]) then
			table.insert(var_1_0, function(arg_2_0)
				var_1_2:Play(var_1_1[iter_1_0][1], arg_2_0)
			end)
		end
	end

	seriesAsync(var_1_0, function()
		print("story play number", #var_1_0)
	end)
	setText(arg_1_0.dayTF, arg_1_0.nday .. "/" .. #arg_1_0.taskGroup)
	arg_1_0.uilist:align(#arg_1_0.taskGroup[arg_1_0.nday])
end

return var_0_0
