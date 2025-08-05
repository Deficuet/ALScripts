local var_0_0 = class("MainCoreActivityBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_core"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:PickPriortyActAsyn(function(arg_3_0, arg_3_1)
		arg_2_0.priority = arg_3_0

		if arg_3_1 > 0 then
			arg_2_0.tipTxt.text = arg_3_1
		end

		setActive(arg_2_0.tipTr.gameObject, arg_3_1 > 0)
	end)
end

function var_0_0.PickPriortyActAsyn(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = 0
	local var_4_2

	table.insert(var_4_0, function(arg_5_0)
		local var_5_0, var_5_1 = arg_4_0:CollectActivity()

		var_4_2 = var_5_1
		var_4_1 = var_4_1 + var_5_0

		onNextTick(arg_5_0)
	end)
	seriesAsync(var_4_0, function()
		arg_4_1(var_4_2, var_4_1)
	end)
end

function var_0_0.CollectActivity(arg_7_0)
	local var_7_0 = arg_7_0:GetLinkConfig().time[2]
	local var_7_1 = pg.activity_template[var_7_0].page_core
	local var_7_2 = 0
	local var_7_3
	local var_7_4 = getProxy(ActivityProxy):getCorePanelActivity(var_7_1)

	for iter_7_0, iter_7_1 in pairs(var_7_4) do
		if iter_7_1:readyToAchieve() then
			var_7_2 = var_7_2 + 1

			if not var_7_3 or var_7_3 and var_7_3.id > iter_7_1.id then
				var_7_3 = iter_7_1
			end
		end
	end

	return var_7_2, var_7_3
end

return var_0_0
