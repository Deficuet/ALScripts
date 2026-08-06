local var_0_0 = class("IslandGetNpcActionAwardCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.npcId
	local var_1_2 = var_1_0.actionId
	local var_1_3 = var_1_0.shipId

	pg.ConnectionMgr.GetInstance():Send(21702, {
		npc_id = var_1_1,
		ship_id = var_1_3,
		action_feedback_id = var_1_2
	}, 21703, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland()

			if var_1_1 ~= 0 then
				var_2_0:GetNpcFeedbackAgency():AddNpc(var_1_1)
			end

			local var_2_1 = var_2_0:GetCharacterAgency()
			local var_2_2 = var_2_1:GetShipById(var_1_3)

			if var_2_2 and var_2_2:HasGreetingSkill() then
				local var_2_3 = var_2_2:GetSkill()

				if var_2_3:CanUse4Ship(var_2_2, {
					IslandBuffType.SHIP_POWER_RECOVER_BY_GREETING
				}) then
					local var_2_4 = var_2_2:GetCurrentEnergy()

					var_2_2:ApplySkill(IslandBuffType.SHIP_POWER_RECOVER_BY_GREETING)

					local var_2_5 = var_2_2:GetCurrentEnergy()

					var_2_0:DispatchEvent(IslandProxy.LINK_CORE, ISLAND_EVT.PLAY_EFFECT, var_1_3, {
						value = var_2_5 - var_2_4
					}, IslandRecEnergyEffect.TYPE)
					var_2_1:DispatchEvent(IslandCharacterAgency.SHIP_SKILL_STATE_CHANGE, var_1_3, false)
				end

				if var_2_3:CanUse4Ship(var_2_2, {
					IslandBuffType.SHIP_AWARD_BY_GREETING
				}) then
					var_2_2:ApplySkill(IslandBuffType.SHIP_AWARD_BY_GREETING)
					var_2_1:DispatchEvent(IslandCharacterAgency.SHIP_SKILL_STATE_CHANGE, var_1_3, false)
				end
			end

			local var_2_6 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_GET_NPC_ACTION_AWARD_DONE, {
				dropData = var_2_6
			})
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.ACTION_HELLO_DAILY)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
