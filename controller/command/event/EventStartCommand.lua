local var_0_0 = class("EventStartCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().event
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.shipIds
	local var_1_3 = getProxy(EventProxy)
	local var_1_4 = var_1_0:IsActivityType()

	if not var_1_4 and not var_1_3:CanStartEvent() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("event_fleet_busy"))

		return
	end

	local var_1_5, var_1_6 = var_1_3:CanJoinEvent(var_1_0)

	if not var_1_5 then
		if var_1_6 then
			pg.TipsMgr.GetInstance():ShowTips(var_1_6)
		end

		return
	end

	local function var_1_7()
		if var_1_4 then
			arg_1_0:sendNotification(GAME.ACT_COLLECTION_EVENT_OP, {
				arg2 = 0,
				cmd = ActivityConst.COLLETION_EVENT_OP_JOIN,
				arg1 = var_1_1,
				arg_list = var_1_2,
				event = var_1_0
			})
		else
			pg.ConnectionMgr.GetInstance():Send(13003, {
				id = var_1_1,
				ship_id_list = var_1_2
			}, 13004, function(arg_3_0)
				if arg_3_0.result == 0 then
					var_0_0.OnStart(var_1_0)
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("event_start_fail", arg_3_0.result))
				end
			end)
		end
	end

	local var_1_8 = var_1_0:getOilConsume()

	if var_1_8 > 0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("event_oil_consume", var_1_8),
			onYes = var_1_7
		})
	else
		var_1_7()
	end
end

function var_0_0.OnStart(arg_4_0)
	pg.TipsMgr.GetInstance():ShowTips(i18n("event_start_success"))

	local var_4_0 = getProxy(EventProxy)
	local var_4_1 = getProxy(PlayerProxy)
	local var_4_2 = var_4_1:getData()
	local var_4_3 = arg_4_0:getOilConsume()

	var_4_2:consume({
		oil = var_4_3
	})
	var_4_1:updatePlayer(var_4_2)

	arg_4_0.finishTime = pg.TimeMgr.GetInstance():GetServerTime() + arg_4_0.template.collect_time

	var_4_0:updateInfoList({
		arg_4_0
	})
end

return var_0_0
