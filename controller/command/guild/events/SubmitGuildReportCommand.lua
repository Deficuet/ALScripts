local var_0_0 = class("SubmitGuildReportCommand", import(".GuildEventBaseCommand"))

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.ids
	local var_1_2 = getProxy(GuildProxy)
	local var_1_3 = var_1_2:getRawData()
	local var_1_4 = getProxy(PlayerProxy):getRawData().id

	if var_1_3:getMemberById(var_1_4):IsRecruit() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_duty_is_too_low"))

		return
	end

	if _.any(var_1_1, function(arg_2_0)
		return not var_1_2:GetReportById(arg_2_0):CanSubmit()
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_get_report_failed"))

		return
	end

	local var_1_5 = var_1_0.callback

	pg.ConnectionMgr.GetInstance():Send(61019, {
		ids = var_1_1
	}, 61020, function(arg_3_0)
		if arg_3_0.result == 0 then
			local var_3_0 = PlayerConst.addTranDrop(arg_3_0.drop_list)

			for iter_3_0, iter_3_1 in ipairs(var_1_1) do
				var_1_2:GetReportById(iter_3_1):Submit()
			end

			arg_1_0:sendNotification(GAME.SUBMIT_GUILD_REPORT_DONE, {
				awards = var_3_0,
				list = var_1_1,
				callback = var_1_5
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.result)
		end
	end)
end

return var_0_0
