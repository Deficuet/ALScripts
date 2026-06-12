local var_0_0 = class("ShipAddIntimacyAndMoneyCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(DormProxy)
	local var_1_2 = var_1_1:getRawData():GetHasMoneyOrIntimacyShips()

	if #var_1_2 <= 0 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(19011, {
		id = 0
	}, 19012, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(BayProxy)
			local var_2_1 = getProxy(DormProxy):getRawData()
			local var_2_2 = {}
			local var_2_3 = {}
			local var_2_4 = 0

			for iter_2_0, iter_2_1 in ipairs(var_1_2) do
				local var_2_5 = iter_2_1.id
				local var_2_6 = var_2_0:RawGetShipById(var_2_5)

				if iter_2_1:HasIntimacy() then
					table.insert(var_2_2, var_2_6)
				end

				if iter_2_1:HasMoney() then
					var_2_4 = var_2_4 + iter_2_1:GetMoney()

					table.insert(var_2_3, var_2_6)
				end

				var_2_1:HarvestInimacyAndMoney(var_2_5)
			end

			var_1_1:updateDrom(var_2_1, BackYardConst.DORM_UPDATE_TYPE_SHIP)
			arg_1_0:ShowIntimacyTip(var_2_2)
			arg_1_0:ShowMoneyTip(var_2_3, var_2_4)
			arg_1_0:sendNotification(GAME.BACKYARD_ONE_KEY_DONE, {
				shipIds = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

function var_0_0.ShowIntimacyTip(arg_3_0, arg_3_1)
	if #arg_3_1 == 0 then
		return
	end

	if #arg_3_1 == 1 then
		local var_3_0 = arg_3_1[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_shipAddInimacy_ok", var_3_0:getName()))

		return
	end

	if #arg_3_1 > 1 then
		table.sort(arg_3_1, function(arg_4_0, arg_4_1)
			return arg_4_0.groupId < arg_4_1.groupId
		end)

		local var_3_1 = _.first(arg_3_1, 2)
		local var_3_2 = _.map(var_3_1, function(arg_5_0)
			return arg_5_0:getName()
		end)
		local var_3_3 = table.concat(var_3_2, "、")

		if #arg_3_1 == 2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_shipAddInimacy_ok", var_3_3))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_shipAddInimacy_ships_ok", var_3_3))
		end

		return
	end
end

function var_0_0.ShowMoneyTip(arg_6_0, arg_6_1, arg_6_2)
	if #arg_6_1 == 0 then
		return
	end

	if #arg_6_1 == 1 then
		local var_6_0 = arg_6_1[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_shipAddMoney_ok", var_6_0:getName(), arg_6_2))

		return
	end

	if #arg_6_1 > 1 then
		table.sort(arg_6_1, function(arg_7_0, arg_7_1)
			return arg_7_0.groupId < arg_7_1.groupId
		end)

		local var_6_1 = _.first(arg_6_1, 2)
		local var_6_2 = _.map(var_6_1, function(arg_8_0)
			return arg_8_0:getName()
		end)
		local var_6_3 = table.concat(var_6_2, "、")

		if #arg_6_1 == 2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_shipAddMoney_ok", var_6_3, arg_6_2))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_shipAddMoney_ships_ok", var_6_3, arg_6_2))
		end
	end
end

return var_0_0
