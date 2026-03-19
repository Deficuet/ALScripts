local var_0_0 = class("NewEducateRefreshTalentCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.talentId
	local var_1_3 = var_1_0.idx

	pg.ConnectionMgr.GetInstance():Send(29021, {
		id = var_1_1,
		talent = var_1_2
	}, 29022, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(NewEducateProxy):GetCurChar():GetFSM():GetState(NewEducateFSM.SYSTEM.TALENT):OnRefreshTalent(var_1_2, arg_2_0.talent)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_REFRESH_TALENT_DONE, {
				idx = var_1_3,
				newId = arg_2_0.talent
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_RefreshTalent: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
