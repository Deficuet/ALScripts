local var_0_0 = class("BackYardRequestPopEventCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	pg.ConnectionMgr.GetInstance():Send(19009, {
		type = 0
	}, 19010, function(arg_2_0)
		local var_2_0 = getProxy(DormProxy):getRawData()

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.pop_list) do
			local var_2_1 = iter_2_1.id
			local var_2_2 = iter_2_1.intimacy
			local var_2_3 = iter_2_1.dorm_icon

			var_2_0:AddInimacyAndMoney(var_2_1, var_2_2, var_2_3)
			getProxy(DormProxy):updateDrom(var_2_0, BackYardConst.DORM_UPDATE_TYPE_SHIP)
			arg_1_0:sendNotification(DormProxy.INIMACY_AND_MONEY_ADD, {
				id = var_2_1,
				intimacy = var_2_2,
				money = var_2_3
			})
		end
	end)
end

return var_0_0
