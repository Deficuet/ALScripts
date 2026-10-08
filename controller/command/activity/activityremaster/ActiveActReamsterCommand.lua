local var_0_0 = class("ActiveActReamsterCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id
	local var_1_1, var_1_2 = getProxy(ActivityRemasterProxy):InActTime()

	if not var_1_1 then
		return
	end

	if getProxy(ActivityRemasterProxy):IsActivating() then
		return
	end

	if not getProxy(ActivityRemasterProxy):CanActiveRemaster(var_1_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("act_remaster_active_erro"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11214, {
		activity_re_id = var_1_0
	}, 11215, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(ActivityRemasterProxy):ActiveActivity(var_1_0, var_1_2)
			arg_1_0:sendNotification(GAME.ACT_REMASTER_ACTIVE_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0
