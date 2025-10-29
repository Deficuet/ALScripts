local var_0_0 = class("GuildGetActivationEventCommand", import(".GuildEventBaseCommand"))

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.force
	local var_1_2 = var_1_0.callback
	local var_1_3 = getProxy(GuildProxy)

	if not var_1_3:ShouldFetchActivationEvent() and not var_1_1 then
		if var_1_2 then
			var_1_2()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(61005, {
		type = 0
	}, 61006, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = arg_2_0.operation.operation_id
			local var_2_1 = var_1_3:getData()
			local var_2_2 = var_2_1:GetActiveEvent()

			if var_2_2 then
				var_2_2:Deactivate()
			end

			var_2_1:GetEventById(var_2_0):Active(arg_2_0.operation)
			var_1_3:AddFetchActivationEventCDTime()
			var_1_3:updateGuild(var_2_1)
			arg_1_0:sendNotification(GAME.GUILD_GET_ACTIVATION_EVENT_DONE)
			pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inGuildEvent")
			pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inGuildBossEvent")

			if var_1_2 then
				var_1_2()
			end
		else
			local var_2_3 = var_1_3:getData()
			local var_2_4 = var_2_3:GetActiveEvent()

			if var_2_4 then
				var_2_4:Deactivate()
			end

			var_1_3:updateGuild(var_2_3)
			arg_1_0:sendNotification(GAME.ON_GUILD_EVENT_END)

			if var_1_2 then
				var_1_2()
			end
		end
	end)
end

return var_0_0
