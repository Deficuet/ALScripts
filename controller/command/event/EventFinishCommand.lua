local var_0_0 = class("EventFinishCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.callback
	local var_1_3 = var_1_0.onConfirm
	local var_1_4 = getProxy(EventProxy)
	local var_1_5 = var_1_4:getEventInfo(var_1_1)
	local var_1_6, var_1_7 = var_1_4:CanFinishEvent(var_1_5)

	if not var_1_6 then
		if var_1_7 then
			pg.TipsMgr.GetInstance():ShowTips(var_1_7)
		end

		if var_1_2 then
			var_1_2()
		end

		return
	end

	if var_1_5:IsActivityType() then
		arg_1_0:sendNotification(GAME.ACT_COLLECTION_EVENT_OP, {
			arg2 = 0,
			cmd = ActivityConst.COLLETION_EVENT_OP_SUBMIT,
			arg1 = var_1_1,
			arg_list = {},
			callBack = var_1_2,
			onConfirm = var_1_3
		})
	else
		pg.ConnectionMgr.GetInstance():Send(13005, {
			id = var_1_1
		}, 13006, function(arg_2_0)
			if arg_2_0.result == 0 then
				getProxy(EventProxy):getEventInfo(var_1_1):SavePrevFormation()
				var_0_0.OnFinish(var_1_1, arg_2_0, var_1_3)

				if var_1_2 then
					var_1_2()
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("event_finish_fail", arg_2_0.result))

				if var_1_2 then
					var_1_2()
				end
			end
		end)
	end
end

function var_0_0.OnFinish(arg_3_0, arg_3_1, arg_3_2)
	pg.TipsMgr.GetInstance():ShowTips(i18n("event_finish_success"))

	local var_3_0 = getProxy(EventProxy)
	local var_3_1 = {}
	local var_3_2 = {}

	if arg_3_1.exp > 0 then
		local var_3_3 = getProxy(BayProxy)
		local var_3_4 = var_3_0:getEventInfo(arg_3_0).shipIds

		for iter_3_0, iter_3_1 in ipairs(var_3_4) do
			local var_3_5 = var_3_3:getShipById(iter_3_1)

			if var_3_5 then
				local var_3_6 = Clone(var_3_5)

				var_3_6:addExp(arg_3_1.exp)
				var_3_3:updateShip(var_3_6)
				table.insert(var_3_1, var_3_5)
				table.insert(var_3_2, var_3_6)
			end
		end
	end

	local var_3_7 = PlayerConst.addTranDrop(arg_3_1.drop_list)
	local var_3_8 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_EVENT)

	if var_3_8 then
		local var_3_9 = var_3_8:getConfig("config_client").shopActID

		if var_3_9 then
			local var_3_10 = pg.activity_template[var_3_9].config_client.pt_id

			_.each(var_3_7, function(arg_4_0)
				if arg_4_0.id == var_3_10 then
					arg_4_0.catchupActTag = true
				end
			end)
			table.sort(var_3_7, CompareFuncs({
				function(arg_5_0)
					return arg_5_0.id == var_3_10 and 1 or 0
				end
			}))
		end
	end

	local var_3_11 = getProxy(PlayerProxy)
	local var_3_12 = var_3_11:getData()

	var_3_12.collect_attack_count = var_3_12.collect_attack_count + 1

	var_3_11:updatePlayer(var_3_12)

	local var_3_13 = var_3_0:getEventInfo(arg_3_0)
	local var_3_14 = {
		{
			id = arg_3_0
		}
	}

	_.each(arg_3_1.new_collection, function(arg_6_0)
		table.insert(var_3_14, EventInfo.New(arg_6_0))
	end)
	var_3_0:updateInfoList(var_3_14)
	pg.m02:sendNotification(GAME.EVENT_SHOW_AWARDS, {
		eventId = arg_3_0,
		oldShips = var_3_1,
		newShips = var_3_2,
		awards = var_3_7,
		isCri = arg_3_1.is_cri > 0,
		onConfirm = arg_3_2
	})
end

return var_0_0
