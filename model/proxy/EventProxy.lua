local var_0_0 = class("EventProxy", import(".NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0.eventDic = {}
	arg_1_0.countDownList = {}
	arg_1_0.lastFlushTime = 0

	arg_1_0:on(13002, function(arg_2_0)
		arg_1_0.maxFleetNums = arg_2_0.max_team

		arg_1_0:updateAll(arg_2_0.collection_list)
	end)
	arg_1_0:on(13011, function(arg_3_0)
		getProxy(ChapterAutoProxy):RecordNewEventIds(underscore.map(arg_3_0.collection, function(arg_4_0)
			return arg_4_0.id
		end))
		arg_1_0:updateInfoList(underscore.map(arg_3_0.collection, function(arg_5_0)
			local var_5_0 = EventInfo.New(arg_5_0)

			if not arg_1_0:existEvent(var_5_0.id) then
				arg_1_0.eventForMsg = var_5_0
			end

			return var_5_0
		end))

		arg_1_0.virgin = true
	end)
end

function var_0_0.timeCall(arg_6_0)
	return {
		[ProxyRegister.SecondCall] = function(arg_7_0)
			arg_6_0:updateTime()
		end
	}
end

function var_0_0.updateAll(arg_8_0, arg_8_1)
	arg_8_0.eventDic = {}
	arg_8_0.countDownList = {}
	arg_8_0.lastFlushTime = pg.TimeMgr.GetInstance():GetServerTime()

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		local var_8_0 = EventInfo.New(iter_8_1)

		arg_8_0.eventDic[var_8_0.id] = var_8_0

		if var_8_0:GetState() == EventInfo.StateActive then
			table.insert(arg_8_0.countDownList, var_8_0.id)
		end
	end

	table.sort(arg_8_0.countDownList, CompareFuncs({
		function(arg_9_0)
			return arg_8_0.eventDic[arg_9_0].finishTime
		end
	}))
	arg_8_0:CheckAddActivityEvent()
	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
	arg_8_0.facade:sendNotification(GAME.EVENT_LIST_UPDATE)
end

function var_0_0.updateInfoList(arg_10_0, arg_10_1)
	if #arg_10_1 == 0 then
		return
	end

	local var_10_0 = false

	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		if not instanceof(iter_10_1, EventInfo) or iter_10_1:GetState() == EventInfo.StateExpire then
			arg_10_0.eventDic[iter_10_1.id] = nil
		else
			arg_10_0.eventDic[iter_10_1.id] = iter_10_1

			if iter_10_1:GetState() == EventInfo.StateActive then
				var_10_0 = true

				table.insert(arg_10_0.countDownList, iter_10_1.id)
			end
		end
	end

	if var_10_0 then
		table.sort(arg_10_0.countDownList, CompareFuncs({
			function(arg_11_0)
				return arg_10_0.eventDic[arg_11_0].finishTime
			end
		}))
	end

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
	arg_10_0.facade:sendNotification(GAME.EVENT_LIST_UPDATE)
end

function var_0_0.getActiveShipIds(arg_12_0)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0.eventDic) do
		if iter_12_1:GetState() ~= EventInfo.StateNone then
			for iter_12_2, iter_12_3 in ipairs(iter_12_1.shipIds) do
				table.insert(var_12_0, iter_12_3)
			end
		end
	end

	return var_12_0
end

function var_0_0.existEvent(arg_13_0, arg_13_1)
	return arg_13_0.eventDic[arg_13_1] and arg_13_0.eventDic[arg_13_1]:GetState() ~= EventInfo.StateExpire
end

function var_0_0.getEventInfo(arg_14_0, arg_14_1)
	return Clone(arg_14_0.eventDic[arg_14_1])
end

function var_0_0.countByState(arg_15_0, arg_15_1)
	local var_15_0 = 0

	for iter_15_0, iter_15_1 in pairs(arg_15_0.eventDic) do
		if iter_15_1:GetState() == arg_15_1 then
			var_15_0 = var_15_0 + 1
		end
	end

	return var_15_0
end

function var_0_0.hasFinishState(arg_16_0)
	if arg_16_0:countByState(EventInfo.StateFinish) > 0 then
		return true
	end
end

function var_0_0.countBusyFleetNums(arg_17_0)
	local var_17_0 = 0

	for iter_17_0, iter_17_1 in pairs(arg_17_0.eventDic) do
		if not iter_17_1:IsActivityType() and iter_17_1:GetState() > EventInfo.StateNone then
			var_17_0 = var_17_0 + 1
		end
	end

	return var_17_0
end

function var_0_0.updateTime(arg_18_0)
	local var_18_0 = false

	while #arg_18_0.countDownList > 0 and arg_18_0.eventDic[arg_18_0.countDownList[1]]:GetState() == EventInfo.StateFinish do
		var_18_0 = true

		table.remove(arg_18_0.countDownList, 1)
	end

	if var_18_0 then
		arg_18_0:sendNotification(GAME.EVENT_FINISH_UPDATE)
	end
end

function var_0_0.getEventList(arg_19_0)
	return underscore(arg_19_0.eventDic):chain():values():filter(function(arg_20_0)
		return arg_20_0:GetState() ~= EventInfo.StateExpire
	end):map(function(arg_21_0)
		return Clone(arg_21_0)
	end):value()
end

function var_0_0.getActiveEvents(arg_22_0)
	return underscore(arg_22_0.eventDic):chain():values():filter(function(arg_23_0)
		return arg_23_0:GetState() == EventInfo.StateActive
	end):value()
end

function var_0_0.fillRecommendShip(arg_24_0, arg_24_1)
	local var_24_0 = getProxy(BayProxy):getDelegationRecommendShips(arg_24_1)

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		table.insert(arg_24_1.shipIds, iter_24_1)
	end
end

function var_0_0.fillRecommendShipLV1(arg_25_0, arg_25_1)
	local var_25_0 = getProxy(BayProxy):getDelegationRecommendShipsLV1(arg_25_1)

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		table.insert(arg_25_1.shipIds, iter_25_1)
	end
end

function var_0_0.checkNightEvent(arg_26_0)
	local var_26_0 = pg.TimeMgr.GetInstance():GetServerHour()
	local var_26_1 = getGameset("night_collection_begin")[1]
	local var_26_2 = getGameset("night_collection_end")[1]

	return (var_26_0 == math.clamp(var_26_0, var_26_1, var_26_2 + 24 - 1) or var_26_0 + 24 == math.clamp(var_26_0 + 24, var_26_1, var_26_2 + 24 - 1)) and not underscore.any(underscore.values(arg_26_0.eventDic), function(arg_27_0)
		local var_27_0 = arg_27_0:GetCountDownTime()

		return arg_27_0.template.type == EventConst.EVENT_TYPE_NIGHT and (not var_27_0 or var_27_0 > 0)
	end)
end

function var_0_0.checkZeroHourEvent(arg_28_0)
	local var_28_0 = pg.TimeMgr.GetInstance()

	return var_28_0:GetTimeToNextTime(arg_28_0.lastFlushTime) <= var_28_0:GetServerTime()
end

function var_0_0.CanJoinEvent(arg_29_0, arg_29_1)
	if not arg_29_1:reachNum() then
		return false, i18n("event_minimus_ship_numbers", arg_29_1.template.ship_num)
	end

	if not arg_29_1:reachLevel() then
		return false, i18n("event_level_unreached")
	end

	if not arg_29_1:reachTypes() then
		return false, i18n("event_type_unreached")
	end

	if not arg_29_1:IsActivityType() and not arg_29_0:CanStartEvent() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("event_fleet_busy"))

		return
	end

	local var_29_0 = arg_29_1:GetCountDownTime()

	if var_29_0 and var_29_0 < 0 then
		return false, i18n("event_over_time_expired")
	end

	local var_29_1 = getProxy(PlayerProxy):getData()

	if arg_29_1:getOilConsume() > var_29_1.oil then
		local var_29_2

		if not ItemTipPanel.ShowOilBuyTip(arg_29_1:getOilConsume()) then
			var_29_2 = i18n("common_no_oil")
		end

		return false, var_29_2
	end

	local var_29_3 = pg.collection_template[arg_29_1.id]

	if var_29_3 then
		local var_29_4 = var_29_3.drop_oil_max or 0

		if var_29_1:OilMax(var_29_4) then
			return false, i18n("oil_max_tip_title") .. i18n("resource_max_tip_eventstart")
		end

		local var_29_5 = var_29_3.drop_gold_max or 0

		if var_29_1:GoldMax(var_29_5) then
			return false, i18n("gold_max_tip_title") .. i18n("resource_max_tip_eventstart")
		end
	end

	return true
end

function var_0_0.CanFinishEvent(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1.template

	if not var_30_0 then
		return false
	end

	local var_30_1 = getProxy(PlayerProxy):getData()
	local var_30_2 = var_30_0.drop_oil_max or 0

	if var_30_1:OilMax(var_30_2) then
		return false, i18n("oil_max_tip_title") .. i18n("resource_max_tip_event")
	end

	local var_30_3 = var_30_0.drop_gold_max or 0

	if var_30_1:GoldMax(var_30_3) then
		return false, i18n("gold_max_tip_title") .. i18n("resource_max_tip_event")
	end

	return true
end

function var_0_0.GetEventByActivityId(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.eventDic) do
		if iter_31_1:BelongActivity(arg_31_1) then
			return iter_31_1
		end
	end
end

function var_0_0.GetEventListForCommossionInfo(arg_32_0)
	local var_32_0 = 0
	local var_32_1 = 0
	local var_32_2 = 0
	local var_32_3 = 0
	local var_32_4 = 0
	local var_32_5 = 0
	local var_32_6 = {}

	_.each(arg_32_0:getEventList(), function(arg_33_0)
		if arg_33_0:IsActivityType() then
			switch(arg_33_0:GetState(), {
				[EventInfo.StateNone] = function()
					var_32_5 = var_32_5 + 1
				end,
				[EventInfo.StateActive] = function()
					var_32_4 = var_32_4 + 1
				end,
				[EventInfo.StateFinish] = function()
					var_32_3 = var_32_3 + 1
				end
			})
		else
			switch(arg_33_0:GetState(), {
				[EventInfo.StateNone] = function()
					return
				end,
				[EventInfo.StateActive] = function()
					var_32_1 = var_32_1 + 1

					table.insert(var_32_6, arg_33_0)
				end,
				[EventInfo.StateFinish] = function()
					var_32_0 = var_32_0 + 1

					table.insert(var_32_6, arg_33_0)
				end
			})
		end
	end)

	local var_32_7 = var_32_0 + var_32_3
	local var_32_8 = var_32_1 + var_32_4
	local var_32_9 = arg_32_0.maxFleetNums - (var_32_0 + var_32_1) + var_32_5

	return var_32_6, var_32_7, var_32_8, var_32_9
end

function var_0_0.CheckAddActivityEvent(arg_40_0)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in pairs(arg_40_0.eventDic) do
		if iter_40_1:IsActivityType() then
			table.insert(var_40_0, {
				id = iter_40_1.id
			})
		end
	end

	for iter_40_2, iter_40_3 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT)) do
		if iter_40_3 and not iter_40_3:isEnd() then
			table.insertto(var_40_0, iter_40_3:GetCollectionList())
		end
	end

	arg_40_0:updateInfoList(var_40_0)

	return #var_40_0 > 0
end

function var_0_0.CanStartEvent(arg_41_0)
	return arg_41_0:countBusyFleetNums() < arg_41_0.maxFleetNums
end

return var_0_0
