local var_0_0 = class("BeginStageCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.system

	ys.Battle.BattleGate.Gates[var_1_1].Entrance(var_1_0, arg_1_0)
end

function var_0_0.RequestFailStandardProcess(arg_2_0, arg_2_1)
	if arg_2_1.result == 10 then
		pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[10])
	else
		pg.TipsMgr.GetInstance():ShowTips(errorTip("stage_beginStage", arg_2_1.result))
		arg_2_0:sendNotification(GAME.BEGIN_STAGE_ERRO, arg_2_1.result)
	end
end

function var_0_0.SendRequest(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	local var_3_0 = arg_3_5 or {}
	local var_3_1 = {
		system = arg_3_0,
		ship_id_list = arg_3_1,
		data = arg_3_2[1],
		data2 = arg_3_2[2],
		other_ship_id_list = var_3_0
	}

	pg.ConnectionMgr.GetInstance():Send(40001, var_3_1, 40002, function(arg_4_0)
		if arg_4_0.result == 0 then
			arg_3_3(arg_4_0)
		else
			arg_3_4(arg_4_0)
		end
	end)
end

function var_0_0.DockOverload()
	local var_5_0 = getProxy(PlayerProxy):getData()

	if getProxy(BayProxy):getShipCount() >= var_5_0:getMaxShipBag() then
		NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

		return true
	end

	return false
end

function var_0_0.LegalFleet(arg_6_0)
	local var_6_0 = getProxy(FleetProxy):getFleetById(arg_6_0)

	if var_6_0 == nil or var_6_0:isEmpty() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_fleetEmpty"))

		return false
	end

	local var_6_1, var_6_2 = var_6_0:isLegalToFight()

	if var_6_1 ~= true then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_teamEmpty", Fleet.C_TEAM_NAME[var_6_1], var_6_2))

		return false
	end

	return true
end

function var_0_0.ShipVertify()
	local var_7_0 = getProxy(BayProxy):getRawData()

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		if not iter_7_1:attrVertify() then
			BattleVertify.playerShipVertifyFail = true

			break
		end
	end
end

return var_0_0
