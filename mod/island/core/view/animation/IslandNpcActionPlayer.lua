local var_0_0 = class("IslandNpcActionPlayer", import("..IslandBaseUnit"))

function var_0_0.Play(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if not arg_1_1 or not arg_1_2 then
		return
	end

	local var_1_0, var_1_1 = arg_1_1.data:GetResponeAction(arg_1_3)

	if not var_1_0 then
		return
	end

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_1_3, 2, arg_1_1.modelId, var_1_0, 1))
	seriesAsync({
		function(arg_2_0)
			arg_1_0:PlayBubble(arg_1_1, var_1_0)

			local var_2_0 = pg.island_action_feedback[var_1_0].state_name

			if not var_2_0 then
				arg_2_0()

				return
			end

			arg_1_1:PlayAnimation(var_2_0, 0.25, arg_2_0)
		end
	}, function()
		if var_1_1 then
			arg_1_0:NotifiyMeditor(IslandMediator.NPC_ACTION_AWARD, arg_1_1.id, var_1_0)
		end
	end)
end

function var_0_0.PlayBubble(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = pg.island_action_feedback[arg_4_2]

	if not var_4_0.emoji or var_4_0.emoji == "" then
		return
	end

	local var_4_1 = 0

	if type(var_4_0.emoji) == "table" then
		local var_4_2 = var_4_0.emoji

		var_4_1 = var_4_2[math.random(1, #var_4_2)]
	else
		var_4_1 = var_4_0.emoji
	end

	require("nodecanvas.Task.NcPlayChatExpression").New(nil, {}):DoAction(var_4_1, arg_4_1.id, arg_4_1.unitType, function()
		return
	end)
end

return var_0_0
