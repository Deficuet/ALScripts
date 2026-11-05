local var_0_0 = class("RecordActivityPermanentProgressCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.remasterId
	local var_1_2 = var_1_0.callback
	local var_1_3 = pg.re_map_template[var_1_1]

	if not var_1_3 then
		var_1_2()

		return
	end

	local var_1_4 = var_1_3.activity_id
	local var_1_5 = BossRushChapterRemasterHelper.GetProgress(var_1_1)

	if var_1_5 <= 0 then
		var_1_2()

		return
	end

	print(var_1_4, var_1_5)
	pg.ConnectionMgr.GetInstance():Send(11216, {
		act_id = var_1_4,
		progress = var_1_5
	}, 11217, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(ActivityPermanentProxy):UpdateActivityProgress(var_1_4, var_1_5)
			arg_1_0:sendNotification(GAME.RECORD_ACTIVITY_PERMANENT_PROGRESS_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end

		var_1_2()
	end)
end

return var_0_0
