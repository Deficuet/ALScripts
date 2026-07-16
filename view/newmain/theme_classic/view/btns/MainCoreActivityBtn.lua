local var_0_0 = class("MainCoreActivityBtn", import(".MainBaseActivityBtn"))

function var_0_0.Register(arg_1_0)
	var_0_0.super.Register(arg_1_0)
	arg_1_0.event:connect(MainBaseActivityBtn.UPDATED_TIP, handler(arg_1_0, arg_1_0.OnRefreshBtn))
end

function var_0_0.GetEventName(arg_2_0)
	return "event_core"
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:PickPriortyActAsyn(function(arg_4_0, arg_4_1)
		arg_3_0.priority = arg_4_0

		if arg_4_1 > 0 then
			arg_3_0.tipTxt.text = arg_4_1
		end

		setActive(arg_3_0.tipTr.gameObject, arg_4_1 > 0)
	end)
end

function var_0_0.PickPriortyActAsyn(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = 0
	local var_5_2

	table.insert(var_5_0, function(arg_6_0)
		local var_6_0, var_6_1 = arg_5_0:CollectActivity()

		var_5_2 = var_6_1
		var_5_1 = var_5_1 + var_6_0

		onNextTick(arg_6_0)
	end)
	seriesAsync(var_5_0, function()
		arg_5_1(var_5_2, var_5_1)
	end)
end

function var_0_0.CollectActivity(arg_8_0)
	local var_8_0 = arg_8_0:GetLinkConfig().time[2]
	local var_8_1 = pg.activity_template[var_8_0].page_core
	local var_8_2 = 0
	local var_8_3
	local var_8_4 = getProxy(ActivityProxy):getCorePanelActivities(var_8_1)

	for iter_8_0, iter_8_1 in pairs(var_8_4) do
		if iter_8_1:readyToAchieve() then
			var_8_2 = var_8_2 + 1

			if not var_8_3 or var_8_3 and var_8_3.id > iter_8_1.id then
				var_8_3 = iter_8_1
			end
		end
	end

	return var_8_2, var_8_3
end

function var_0_0.GetTipImage(arg_9_0)
	return "tip_1920"
end

function var_0_0.OnRefreshBtn(arg_10_0)
	arg_10_0:OnInit()
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0.event:disconnect(MainBaseActivityBtn.UPDATED_TIP, handler(arg_11_0, arg_11_0.OnRefreshBtn))
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
