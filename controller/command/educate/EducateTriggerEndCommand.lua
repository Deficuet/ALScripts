local var_0_0 = class("EducateTriggerEndCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1

	var_1_1 = var_1_0 and var_1_0.callback

	local var_1_2 = var_1_0.ids
	local var_1_3 = var_1_0.selId
	local var_1_4 = pg.child_ending[var_1_3].performance

	pg.ConnectionMgr.GetInstance():Send(27008, {
		ending_id = var_1_3,
		qualified_id = var_1_2
	}, 27009, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(EducateProxy):AddEnding(var_1_3, var_1_2)
			arg_1_0:sendNotification(GAME.EDUCATE_TRIGGER_END_DONE)
			pg.PerformMgr.GetInstance():PlayGroup(var_1_4, function()
				pg.PerformMgr.GetInstance():PlayOne(EducateConst.AFTER_END_PERFORM, function()
					getProxy(EducateProxy):CheckGuide("EducateScene", true)
				end)
			end)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("educate trigger end error: ", arg_2_0.result))
		end
	end)
end

return var_0_0
