local var_0_0 = class("ActivityPrevPeriodCrusingOPCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = getProxy(ActivityProxy)
	local var_1_3 = var_1_2:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if not var_1_3 or var_1_3:isEnd() then
		if var_1_1 then
			var_1_1()
		end

		return
	end

	local var_1_4 = var_1_3:GetPreviousPeriodAct()

	if not var_1_4 or var_1_4.id ~= var_1_0.activity_id then
		if var_1_1 then
			var_1_1()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = var_1_3.id,
		cmd = var_1_0.cmd or 0,
		arg1 = var_1_0.arg1 or 0,
		arg2 = var_1_0.arg2 or 0,
		arg_list = {}
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = {}

			if var_1_0.cmd == 1 then
				var_2_0 = PlayerConst.addTranDrop(arg_2_0.award_list)

				var_1_4:SyncAwardRecords(pg.black_friday_battlepass_event_pt[var_1_4.id])
			elseif var_1_0.cmd == 2 then
				var_2_0 = PlayerConst.addTranDrop(arg_2_0.award_list)

				var_1_4:AddAwardRecord(var_1_0.arg1)
			elseif var_1_0.cmd == 3 then
				var_2_0 = PlayerConst.addTranDrop(arg_2_0.award_list)

				var_1_4:AddPayAwardRecord(var_1_0.arg1)
			elseif var_1_0.cmd == 4 or var_1_0.cmd == 5 then
				var_2_0 = PlayerConst.addTranDrop(arg_2_0.award_list)

				var_1_4:SyncAwardRecords()
			end

			var_1_3:UpdatePreviousPeriodAct()
			var_1_2:updateActivity(var_1_3)
			arg_1_0:sendNotification(GAME.CRUSING_CMD_DONE, {
				awards = var_2_0,
				callback = var_1_1
			})
		else
			if var_1_1 then
				var_1_1()
			end

			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0
