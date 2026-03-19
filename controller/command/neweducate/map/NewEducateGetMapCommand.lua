local var_0_0 = class("NewEducateGetMapCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(29060, {
		id = var_1_0
	}, 29061, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar()
			local var_2_1 = NewEducateMapState.New(var_1_0, arg_2_0.fsm_site)

			var_2_0:GetFSM():SetState(NewEducateFSM.SYSTEM.MAP, var_2_1)
			var_2_0:SetShipIds(arg_2_0.characters or {})

			local var_2_2 = NewEducateDropHelper.HandleDrops(arg_2_0.drop)

			arg_1_0:sendNotification(GAME.NEW_EDUCATE_GET_MAP_DONE, {
				drops = var_2_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_GetMap: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
