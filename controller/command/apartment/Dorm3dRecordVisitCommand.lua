local var_0_0 = class("Dorm3dRecordVisitCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	pg.ConnectionMgr.GetInstance():Send(28036, {
		ship_id = var_1_0
	}, 28037, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(ApartmentProxy):getApartment(var_1_0)

			var_2_0.visitTime = pg.TimeMgr.GetInstance():GetServerTime()

			getProxy(ApartmentProxy):updateApartment(var_2_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
