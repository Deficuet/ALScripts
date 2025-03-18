local var_0_0 = class("NewEducateNextPlanCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.rePlay

	pg.ConnectionMgr.GetInstance():Send(29042, {
		id = var_1_1
	}, 29043, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar():GetFSM()

			var_2_0:SetCurNode(arg_2_0.first_node)

			local var_2_1 = var_2_0:GetState(NewEducateFSM.STYSTEM.PLAN)

			var_2_1:SetNextPlanIdx()

			local var_2_2 = NewEducateHelper.MergeDrops(arg_2_0.drop)

			NewEducateHelper.UpdateDropsData(var_2_2)

			local var_2_3 = var_2_1:GetCurIdx() == var_2_1:GetIdxList()[1]

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_NEXT_PLAN_DONE, {
				drops = NewEducateHelper.FilterBenefit(var_2_2),
				node = arg_2_0.first_node,
				isFristNode = var_2_3 or var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_NextPlan: ", arg_2_0.result))
		end
	end)
end

return var_0_0
