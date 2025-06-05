local var_0_0 = class("MainCoreActivityBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_core"
end

function var_0_0.GetTipImage(arg_2_0)
	return "tip_1920"
end

function var_0_0.GetActivityID(arg_3_0)
	return nil
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0:PickPriortyActAsyn(function(arg_5_0, arg_5_1)
		arg_4_0.priority = arg_5_0

		if arg_5_1 > 0 then
			arg_4_0.tipTxt.text = arg_5_1
		end

		setActive(arg_4_0.tipTr.gameObject, arg_5_1 > 0)
	end)
end

function var_0_0.PickPriortyActAsyn(arg_6_0, arg_6_1)
	local var_6_0 = {}
	local var_6_1 = 0
	local var_6_2

	table.insert(var_6_0, function(arg_7_0)
		local var_7_0, var_7_1 = arg_6_0:CollectActivity()

		var_6_2 = var_7_1
		var_6_1 = var_6_1 + var_7_0

		onNextTick(arg_7_0)
	end)
	seriesAsync(var_6_0, function()
		arg_6_1(var_6_2, var_6_1)
	end)
end

function var_0_0.CollectActivity(arg_9_0)
	local var_9_0 = 0
	local var_9_1
	local var_9_2 = arg_9_0:InShowTime() and getProxy(ActivityProxy):getCorePanelActivity(arg_9_0.config.param) or {}

	for iter_9_0, iter_9_1 in pairs(var_9_2) do
		if iter_9_1:readyToAchieve() then
			var_9_0 = var_9_0 + 1

			if not var_9_1 or var_9_1 and var_9_1.id > iter_9_1.id then
				var_9_1 = iter_9_1
			end
		end
	end

	return var_9_0, var_9_1
end

function var_0_0.CustomOnClick(arg_10_0)
	return
end

return var_0_0
