local var_0_0 = class("EducateExecutePlansCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1

	var_1_1 = var_1_0 and var_1_0.callback

	local var_1_2 = getProxy(EducateProxy)

	pg.ConnectionMgr.GetInstance():Send(27002, {
		type = 1
	}, 27003, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_2:GetPlanProxy():GetGridData()

			local function var_2_1()
				arg_1_0:sendNotification(GAME.EDUCATE_EXECUTE_PLANS_DONE, {
					gridData = var_2_0,
					plan_results = arg_2_0.plan_results,
					events = arg_2_0.events,
					isSkip = var_1_0.isSkip,
					isSkipEvent = var_1_0.isSkipEvent
				})
			end

			var_1_2:ReduceResForPlans()
			var_1_2:GetPlanProxy():OnExecutePlanDone()
			var_1_2:GetPlanProxy():UpdateHistory()
			arg_1_0:sendNotification(GAME.CHANGE_SCENE, SCENE.EDUCATE, {
				ingoreGuideCheck = true,
				onEnter = var_2_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("educate execute plans error: ", arg_2_0.result))
		end
	end)
end

return var_0_0
