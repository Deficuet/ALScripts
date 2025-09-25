local var_0_0 = class("IslandNpcActionPlayer", import("..IslandBaseUnit"))

function var_0_0.Play(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0, var_1_1 = arg_1_1.data:GetResponeAction(arg_1_3)

	if not var_1_0 then
		return
	end

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_1_3, 2, arg_1_1.modelId, var_1_0, 1))
	seriesAsync({
		function(arg_2_0)
			local var_2_0 = pg.island_action_feedback[var_1_0].state_name

			arg_1_1:PlayAnimation(var_2_0, 0.25, arg_2_0)
		end
	}, function()
		if var_1_1 then
			arg_1_0:NotifiyMeditor(IslandMediator.NPC_ACTION_AWARD, arg_1_1.id, var_1_0)
		end
	end)
end

return var_0_0
