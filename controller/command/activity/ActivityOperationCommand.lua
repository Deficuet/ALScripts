local var_0_0 = class("ActivityOperationCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(ActivityProxy):getActivityById(var_1_0.activity_id)

	assert(var_1_1)

	local var_1_2 = var_1_1:getConfig("type")

	if switch(var_1_2, {
		[ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1] = function()
			local var_2_0, var_2_1, var_2_2 = BuildShip.canBuildShipByBuildId(var_1_0.buildId, var_1_0.arg1, var_1_0.arg2 == 1)

			if not var_2_0 then
				if var_2_2 then
					GoShoppingMsgBox(i18n("switch_to_shop_tip_1"), ChargeScene.TYPE_ITEM, var_2_2)
				else
					pg.TipsMgr.GetInstance():ShowTips(var_2_1)
				end

				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDSHIP_PRAY] = ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		[ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD] = ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		[ActivityConst.ACTIVITY_TYPE_SHOP] = function()
			local var_3_0 = getProxy(PlayerProxy):getData()
			local var_3_1 = getProxy(ShopsProxy):getActivityShopById(var_1_1.id):bindConfigTable()[var_1_0.arg1]
			local var_3_2 = var_1_0.arg2 or 1

			if var_3_0[id2res(var_3_1.resource_type)] < var_3_1.resource_num * var_3_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return true
			end

			if var_3_1.commodity_type == 1 then
				if var_3_1.commodity_id == 1 and var_3_0:GoldMax(var_3_1.num * var_3_2) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))

					return true
				end

				if var_3_1.commodity_id == 2 and var_3_0:OilMax(var_3_1.num * var_3_2) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))

					return true
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function()
			if var_1_0.cmd == 2 and not var_1_1:CanRequest() then
				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE] = function()
			local var_5_0 = var_1_0.costDrop

			if var_5_0.count > var_5_0:getOwnedCount() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE] = function()
			local var_6_0 = var_1_0.costDrop

			if var_6_0.count > var_6_0:getOwnedCount() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return true
			end
		end
	}) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = var_1_0.activity_id,
		cmd = var_1_0.cmd,
		arg1 = var_1_0.arg1,
		arg2 = var_1_0.arg2,
		arg_list = var_1_0.arg_list or {},
		kvargs1 = var_1_0.kvargs1
	}, 11203, function(arg_7_0)
		if arg_7_0.result == 0 then
			local var_7_0 = PlayerConst.GetTranAwards(var_1_0, arg_7_0)
			local var_7_1 = arg_1_0:updateActivityData(var_1_0, arg_7_0, var_1_1, var_7_0)

			getProxy(ActivityTaskProxy):checkAutoSubmit()
			arg_1_0:performance(var_1_0, arg_7_0, var_7_1, var_7_0)
		else
			originalPrint("activity op ret code: " .. arg_7_0.result)

			if var_1_2 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN or var_1_2 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN or var_1_2 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN or var_1_2 == ActivityConst.ACTIVITY_TYPE_REFLUX then
				var_1_1.autoActionForbidden = true

				getProxy(ActivityProxy):updateActivity(var_1_1)
			elseif var_1_2 == ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1 or var_1_2 == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD then
				if arg_7_0.result == 1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("activity_build_end_tip"))
				end
			elseif var_1_2 == 17 then
				pg.TipsMgr.GetInstance():ShowTips("错误!:" .. arg_7_0.result)
			elseif var_1_2 == ActivityConst.ACTIVITY_TYPE_FRESH_TEC_CATCHUP then
				pg.TipsMgr.GetInstance():ShowTips(errorTip("activity_op_error", arg_7_0.result))
			elseif var_1_2 == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF then
				if var_1_1:getConfig("config_client").resource_ID == BossRushDALUpgradeView.RES_ID then
					pg.TipsMgr.GetInstance():ShowTips(i18n("DAL_upgrade_not_enough"))
				end
			elseif arg_7_0.result == 3 or arg_7_0.result == 4 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("activity_op_error", arg_7_0.result))
			end

			arg_1_0:sendNotification(ActivityProxy.ACTIVITY_OPERATION_ERRO, {
				actId = var_1_0.activity_id,
				code = arg_7_0.result
			})
		end
	end)
end

function var_0_0.updateActivityData(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	local var_8_0 = arg_8_3:getConfig("type")
	local var_8_1 = getProxy(PlayerProxy)
	local var_8_2 = getProxy(TaskProxy)

	switch(var_8_0, {
		[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
			arg_8_3.data1 = arg_8_3.data1 + 1
			arg_8_3.data2 = pg.TimeMgr.GetInstance():GetServerTime()
		end,
		[ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data1 = arg_8_3.data1 + 1
				arg_8_3.data2 = pg.TimeMgr.GetInstance():GetServerTime()
			elseif arg_8_1.cmd == 2 then
				arg_8_3.achieved = true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = function()
			table.insert(arg_8_3.data1_list, arg_8_1.arg1)
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function()
			table.insert(arg_8_3.data1_list, arg_8_1.arg1)
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELPLAN] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data1 = true
			elseif arg_8_1.cmd == 2 then
				table.insert(arg_8_3.data1_list, arg_8_1.arg1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
			local var_14_0 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_14_1 = pg.TimeMgr.GetInstance():STimeDescS(var_14_0, "*t")

			if arg_8_3:getSpecialData("reMonthSignDay") ~= nil then
				day = arg_8_3:getSpecialData("reMonthSignDay")
				arg_8_3.data3 = arg_8_3.data3 and arg_8_3.data3 + 1 or 1
			else
				day = var_14_1.day
			end

			arg_8_3:setSpecialData(MonthSignPage.MILESTONE_SPECIAL_DATA, nil)
			table.insert(arg_8_3.data1_list, day)

			local var_14_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOGIN_RECORD)

			if var_14_2 and not var_14_2:isEnd() then
				var_14_2.data1 = var_14_2.data1 + 1
				var_14_2.data2 = var_14_2.data2 + 1
				var_14_2.data3 = math.max(var_14_2.data3, var_14_2.data2)

				for iter_14_0, iter_14_1 in ipairs(MonthSignPage.MONTH_SIGN_SP_DAYS) do
					if iter_14_1 == var_14_2.data1 then
						arg_8_3:setSpecialData(MonthSignPage.MILESTONE_SPECIAL_DATA, iter_14_1)
					end
				end

				getProxy(ActivityProxy):updateActivity(var_14_2)
			end

			getProxy(ActivityProxy):updateActivity(arg_8_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_CHARGEAWARD] = function()
			arg_8_3.data2 = 1
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1] = function()
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_SHIP, arg_8_1.arg1)

			local var_16_0 = pg.ship_data_create_material[arg_8_1.buildId]

			if arg_8_1.arg2 == 1 then
				local var_16_1 = getProxy(ActivityProxy)
				local var_16_2 = var_16_1:getBuildFreeActivityByBuildId(arg_8_1.buildId)

				var_16_2.data1 = var_16_2.data1 - arg_8_1.arg1

				var_16_1:updateActivity(var_16_2)
			else
				getProxy(BagProxy):removeItemById(var_16_0.use_item, var_16_0.number_1 * arg_8_1.arg1)

				local var_16_3 = var_8_1:getData()

				var_16_3:consume({
					gold = var_16_0.use_gold * arg_8_1.arg1
				})
				var_8_1:updatePlayer(var_16_3)
			end

			local var_16_4 = getProxy(BuildShipProxy)

			if var_16_0.exchange_count > 0 then
				var_16_4:changeRegularExchangeCount(arg_8_1.arg1 * var_16_0.exchange_count)
			end

			for iter_16_0, iter_16_1 in ipairs(arg_8_2.build) do
				local var_16_5 = BuildShip.New(iter_16_1)

				var_16_4:addBuildShip(var_16_5)
			end

			arg_8_3.data1 = arg_8_3.data1 + arg_8_1.arg1

			arg_8_0:sendNotification(GAME.BUILD_SHIP_DONE)
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDSHIP_PRAY] = ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		[ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD] = ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		[ActivityConst.ACTIVITY_TYPE_SHOP] = function()
			local var_17_0 = getProxy(ShopsProxy)
			local var_17_1 = var_17_0:getActivityShopById(arg_8_3.id)

			var_17_0:UpdateActivityGoods(arg_8_3.id, arg_8_1.arg1, arg_8_1.arg2)

			if table.contains(arg_8_3.data1_list, arg_8_1.arg1) then
				for iter_17_0, iter_17_1 in ipairs(arg_8_3.data1_list) do
					if iter_17_1 == arg_8_1.arg1 then
						arg_8_3.data2_list[iter_17_0] = arg_8_3.data2_list[iter_17_0] + arg_8_1.arg2

						break
					end
				end
			else
				table.insert(arg_8_3.data1_list, arg_8_1.arg1)
				table.insert(arg_8_3.data2_list, arg_8_1.arg2)
			end

			local var_17_2 = var_17_1:bindConfigTable()[arg_8_1.arg1]
			local var_17_3 = var_17_2.resource_num * arg_8_1.arg2
			local var_17_4 = var_8_1:getData()

			var_17_4:consume({
				[id2res(var_17_2.resource_type)] = var_17_3
			})
			var_8_1:updatePlayer(var_17_4)
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = function()
			if arg_8_1.cmd == 1 then
				local var_18_0, var_18_1 = getActivityTask(arg_8_3)

				if var_18_1 and not var_18_1:isReceive() then
					local var_18_2 = arg_8_3:getConfig("config_data")

					for iter_18_0, iter_18_1 in ipairs(var_18_2) do
						local var_18_3 = _.flatten({
							iter_18_1
						})

						if table.contains(var_18_3, var_18_0) then
							arg_8_3.data3 = iter_18_0

							break
						end
					end
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_RES] = function()
			if arg_8_1.cmd == 1 then
				local var_19_0, var_19_1 = getActivityTask(arg_8_3)

				if var_19_1 and not var_19_1:isReceive() then
					local var_19_2 = arg_8_3:getConfig("config_data")

					for iter_19_0, iter_19_1 in ipairs(var_19_2) do
						local var_19_3 = _.flatten({
							iter_19_1
						})

						if table.contains(var_19_3, var_19_0) then
							arg_8_3.data3 = iter_19_0

							break
						end
					end
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function()
			if arg_8_1.cmd == PuzzleActivity.CMD_COMPLETE then
				arg_8_3.data1 = 1
			elseif arg_8_1.cmd == PuzzleActivity.CMD_EARN_EXTRA then
				arg_8_3.data1 = 2
			elseif arg_8_1.cmd == PuzzleActivity.CMD_ACTIVATE then
				table.insert(arg_8_3.data2_list, arg_8_1.arg1)
			end

			getProxy(ActivityProxy):updateActivity(arg_8_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function()
			arg_8_3.data1 = arg_8_3.data1 + 1
			arg_8_3.data2 = arg_8_3.data2 - 1
			arg_8_3.data1_list = arg_8_2.number
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY] = function()
			if arg_8_1.cmd == 1 then
				local var_22_0 = ActivityItemPool.New({
					id = arg_8_1.arg2
				})
				local var_22_1 = var_22_0:getComsume()
				local var_22_2 = arg_8_1.arg1 * var_22_1.count

				if var_22_1.type == DROP_TYPE_RESOURCE then
					local var_22_3 = var_8_1:getData()

					var_22_3:consume({
						[id2res(var_22_1.id)] = var_22_2
					})
					var_8_1:updatePlayer(var_22_3)
				elseif var_22_1.type == DROP_TYPE_ITEM then
					getProxy(BagProxy):removeItemById(var_22_1.id, var_22_2)
				end

				arg_8_3:updateData(var_22_0.id, arg_8_2.number)
			elseif arg_8_1.cmd == 2 then
				arg_8_3.data1 = arg_8_1.arg1
			elseif arg_8_1.cmd == 3 then
				arg_8_3.data2_list = _.map(arg_8_1.arg_list, function(arg_23_0)
					return arg_23_0
				end)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function()
			if arg_8_1.cmd == 1 then
				local var_24_0 = arg_8_3:getConfig("config_data")[4]

				if #arg_8_4 > 0 then
					arg_8_3.data2 = arg_8_3.data2 + 1

					if var_24_0 <= arg_8_3.data2 then
						arg_8_3.data1 = 1
					end
				end

				if arg_8_3.data4 == 0 then
					arg_8_3.data4 = arg_8_1.arg2
				elseif arg_8_1.arg2 < arg_8_3.data4 then
					arg_8_3.data4 = arg_8_1.arg2
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = ActivityConst.ACTIVITY_TYPE_CARD_PAIRS,
		[ActivityConst.ACTIVITY_TYPE_REFLUX] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data1_list[1] = pg.TimeMgr.GetInstance():GetServerTime()
				arg_8_3.data1_list[2] = arg_8_3.data1_list[2] + 1
			elseif arg_8_1.cmd == 2 then
				arg_8_3.data4 = arg_8_1.arg1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data1 = arg_8_3.data1 + 1
				arg_8_3.data2 = arg_8_2.number[1]
			elseif arg_8_1.cmd == 2 then
				table.insert(arg_8_3.data1_list, arg_8_3.data1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_DODGEM] = function()
			if arg_8_1.cmd == 1 then
				arg_8_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_8_1.statistics,
					score = arg_8_1.statistics._battleScore,
					system = SYSTEM_DODGEM
				})

				arg_8_3.data1_list[1] = math.max(arg_8_3.data1_list[1], arg_8_1.arg2)
				arg_8_3.data2_list[1] = arg_8_2.number[1]
				arg_8_3.data2_list[2] = arg_8_2.number[2]
			elseif arg_8_1.cmd == 2 then
				arg_8_3.data2 = arg_8_2.number[1]
				arg_8_3.data3 = arg_8_2.number[2]
				arg_8_3.data2_list[1] = 0
				arg_8_3.data2_list[2] = 0
			elseif arg_8_1.cmd == 3 then
				arg_8_3.data4 = defaultValue(arg_8_3.data4, 0) + 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SUBMARINE_RUN] = function()
			if arg_8_1.cmd == 1 then
				arg_8_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_8_1.statistics,
					score = arg_8_1.statistics._battleScore,
					system = SYSTEM_SUBMARINE_RUN
				})

				arg_8_3.data1_list[1] = math.max(arg_8_3.data1_list[1], arg_8_1.arg2)
				arg_8_3.data2_list[1] = arg_8_2.number[1]
				arg_8_3.data2_list[2] = arg_8_2.number[2]
			elseif arg_8_1.cmd == 2 then
				arg_8_3.data2 = arg_8_2.number[1]
				arg_8_3.data3 = arg_8_2.number[2]
				arg_8_3.data2_list[1] = 0
				arg_8_3.data2_list[2] = 0
			elseif arg_8_1.cmd == 3 then
				arg_8_3.data4 = defaultValue(arg_8_3.data4, 0) + 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function()
			if arg_8_1.cmd == 2 then
				arg_8_3.data4 = 0
			elseif arg_8_1.cmd == 1 then
				local var_29_0 = arg_8_3:getConfig("config_id")
				local var_29_1 = pg.activity_event_turning[var_29_0].total_num

				if arg_8_3.data3 == var_29_1 then
					arg_8_3.data2 = 1
					arg_8_3.data3 = arg_8_3.data3 + 1
				else
					arg_8_3.data3 = arg_8_3.data3 + 1
					arg_8_3.data4 = arg_8_2.number[1]
					arg_8_3.data1_list[arg_8_1.arg1] = arg_8_3.data4
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function()
			arg_8_3.data1 = 1
		end,
		[ActivityConst.ACTIVITY_TYPE_RED_PACKETS] = function()
			arg_8_3.data1 = arg_8_3.data1 - 1

			if arg_8_3.data2 > 0 then
				arg_8_3.data2 = arg_8_3.data2 - 1
			end

			arg_8_3.data1_list[2] = arg_8_3.data1_list[2] + 1

			local var_31_0 = getProxy(ActivityProxy)
			local var_31_1 = var_31_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

			if var_31_1 and not var_31_1:isEnd() and var_31_1.data2_list[1] > var_31_1.data2_list[2] then
				var_31_1.data2_list[2] = var_31_1.data2_list[2] + 1

				var_31_0:updateActivity(var_31_1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER] = function()
			arg_8_3.data1 = arg_8_3.data1 + 1

			if not table.contains(arg_8_3.data2_list, arg_8_1.arg1) then
				table.insert(arg_8_3.data2_list, arg_8_1.arg1)
			end

			if not table.contains(arg_8_3.data1_list, arg_8_2.number[1]) then
				table.insert(arg_8_3.data1_list, arg_8_2.number[1])
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function()
			if arg_8_1.cmd == 1 then
				local var_33_0 = pg.activity_event_building[arg_8_1.arg1]
				local var_33_1 = arg_8_3:GetBuildingLevel(arg_8_1.arg1)

				arg_8_3:SetBuildingLevel(arg_8_1.arg1, var_33_1 + 1)

				if var_33_1 < #var_33_0.buff then
					_.each(var_33_0.material[var_33_1], function(arg_34_0)
						local var_34_0 = arg_34_0[1]
						local var_34_1 = arg_34_0[2]
						local var_34_2 = arg_34_0[3]
						local var_34_3

						if var_34_0 == DROP_TYPE_VITEM then
							local var_34_4 = AcessWithinNull(Item.getConfigData(var_34_1), "link_id")

							assert(var_34_4 == arg_8_3.id)

							var_34_3 = arg_8_3
						elseif var_34_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_34_5 = AcessWithinNull(pg.activity_drop_type[var_34_0], "activity_id")

							var_34_3 = getProxy(ActivityProxy):getActivityById(var_34_5)
						end

						local var_34_6 = var_34_3.data1KeyValueList[1][var_34_1] or 0
						local var_34_7 = math.max(0, var_34_6 - var_34_2)

						var_34_3.data1KeyValueList[1][var_34_1] = var_34_7

						if var_34_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							getProxy(ActivityProxy):updateActivity(var_34_3)
						end
					end)
				end
			elseif arg_8_1.cmd == 2 and var_8_0 == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2 then
				arg_8_3:RecordLastRequestTime()
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
			if arg_8_1.cmd == 2 then
				table.insert(arg_8_3.data2_list, arg_8_1.arg1)
				arg_8_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_8_1.statistics,
					score = arg_8_1.statistics._battleScore,
					system = SYSTEM_REWARD_PERFORM
				})

				return arg_8_3
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function()
			if arg_8_1.cmd == 0 then
				return arg_8_3
			end

			if arg_8_1.cmd == 3 then
				arg_8_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_8_1.statistics,
					score = arg_8_1.statistics._battleScore,
					system = SYSTEM_REWARD_PERFORM
				})

				return arg_8_3
			end

			if arg_8_1.cmd == 4 then
				arg_8_3.data2_list[1] = arg_8_3.data2_list[1] + 1

				return arg_8_3
			end

			if arg_8_1.cmd == 1 then
				arg_8_3.data3 = arg_8_3.data3 - 1
			end

			local var_36_0 = arg_8_1.arg1

			if arg_8_1.cmd ~= 2 then
				arg_8_3.data2 = var_36_0
			end

			local var_36_1 = arg_8_2.number[1]

			arg_8_3.data1_list[var_36_0] = var_36_1

			print("格子:" .. var_36_0 .. " 值:" .. arg_8_2.number[1])

			if arg_8_2.number[2] and arg_8_3.data1 ~= arg_8_2.number[2] then
				print("关卡变更" .. arg_8_2.number[2])

				arg_8_3.data1 = arg_8_3.data1 + 1
				arg_8_3.data2 = 0

				for iter_36_0 = 1, #arg_8_3.data1_list do
					arg_8_3.data1_list[iter_36_0] = 0
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = function()
			if arg_8_1.cmd == 1 then
				arg_8_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_8_1.statistics,
					score = arg_8_1.statistics._battleScore,
					system = SYSTEM_AIRFIGHT
				})

				arg_8_3.data1KeyValueList[1] = arg_8_3.data1KeyValueList[1] or {}
				arg_8_3.data1KeyValueList[1][arg_8_1.arg1] = (arg_8_3.data1KeyValueList[1][arg_8_1.arg1] or 0) + 1
			elseif arg_8_1.cmd == 2 then
				arg_8_3.data1KeyValueList[2] = arg_8_3.data1KeyValueList[2] or {}
				arg_8_3.data1KeyValueList[2][arg_8_1.arg1] = 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data1 = arg_8_3.data1 - 1

				local var_38_0 = arg_8_2.number[1]

				arg_8_3.data1KeyValueList[1][var_38_0] = arg_8_3.data1KeyValueList[1][var_38_0] + 1
			elseif arg_8_1.cmd == 2 then
				arg_8_3.data2 = 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data2 = 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function()
			if arg_8_1.cmd == SpringActivity.OPERATION_UNLOCK then
				arg_8_3:AddSlotCount()
			elseif arg_8_1.cmd == SpringActivity.OPERATION_SETSHIP then
				arg_8_3:SetShipIds(arg_8_1.kvargs1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function()
			if arg_8_1.cmd == Spring2Activity.OPERATION_SETSHIP then
				arg_8_3:SetShipIds(arg_8_1.kvargs1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data1 = arg_8_3.data1 - 1

				if not table.contains(arg_8_3.data1_list, arg_8_1.arg1) then
					table.insert(arg_8_3.data1_list, arg_8_1.arg1)
				end

				local var_42_0 = Item.getConfigData(arg_8_1.arg1).link_id

				if var_42_0 > 0 then
					local var_42_1 = getProxy(ActivityProxy)
					local var_42_2 = var_42_1:getActivityById(var_42_0)

					if var_42_2 and not var_42_2:isEnd() then
						var_42_2.data1 = var_42_2.data1 + 1

						var_42_1:updateActivity(var_42_2)
					end
				end

				local var_42_3 = getProxy(PlayerProxy)
				local var_42_4 = var_42_3:getRawData()
				local var_42_5 = arg_8_3:getConfig("config_data")[2][1]
				local var_42_6 = arg_8_3:getConfig("config_data")[2][2]

				var_42_4:consume({
					[id2res(var_42_5)] = var_42_6
				})
				var_42_3:updatePlayer(var_42_4)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function()
			if not table.contains(arg_8_3.data1_list, arg_8_1.arg1) then
				table.insert(arg_8_3.data1_list, arg_8_1.arg1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function()
			if arg_8_1.cmd == 1 then
				if arg_8_1.arg1 == LaunchBallGameConst.round_type_juqing then
					arg_8_3.data1 = arg_8_3.data1 + 1
				elseif arg_8_1.arg1 == 2 then
					if not arg_8_3.data1_list then
						arg_8_3.data1_list = {}
					end

					table.insert(arg_8_3.data1_list, arg_8_1.arg2)
				elseif arg_8_1.arg1 == 3 then
					arg_8_3.data2 = arg_8_1.arg2
				end
			elseif arg_8_1.cmd == 2 then
				arg_8_3.data3 = 1
			end

			getProxy(ActivityProxy):updateActivity(arg_8_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLE_CONNECT] = function()
			local var_45_0 = getProxy(ActivityProxy)
			local var_45_1 = arg_8_3.data1_list
			local var_45_2 = arg_8_3.data2_list
			local var_45_3 = arg_8_3.data3_list

			if arg_8_1.cmd == 1 then
				local var_45_4 = pg.activity_tolove_jigsaw[arg_8_1.arg1].need[2]
				local var_45_5 = pg.player_resource[var_45_4].name
				local var_45_6 = pg.activity_tolove_jigsaw[arg_8_1.arg1].need[3]
				local var_45_7 = var_8_1:getData()

				var_45_7:consume({
					[var_45_5] = var_45_6
				})
				var_8_1:updatePlayer(var_45_7)
				table.insert(var_45_1, arg_8_1.arg1)
			elseif arg_8_1.cmd == 2 then
				table.insert(var_45_2, arg_8_1.arg1)
			elseif arg_8_1.cmd == 3 then
				table.insert(var_45_3, arg_8_1.arg1)
			end

			var_45_0:updateActivity(arg_8_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING] = function()
			local var_46_0 = getProxy(ActivityProxy)

			arg_8_3.data2 = arg_8_3.data2 + arg_8_3.data1
			arg_8_3.data1 = 0

			var_46_0:updateActivity(arg_8_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_FRESH_TEC_CATCHUP] = function()
			if arg_8_1.cmd == 1 then
				if not table.contains(arg_8_3.data1_list, arg_8_3.data1) then
					table.insert(arg_8_3.data1_list, arg_8_3.data1)
				end

				arg_8_3.data1 = arg_8_1.arg1
			elseif arg_8_1.cmd == 2 then
				-- block empty
			elseif arg_8_1.cmd == 3 then
				if not table.contains(arg_8_3.data1_list, arg_8_3.data1) then
					table.insert(arg_8_3.data1_list, arg_8_3.data1)
				end

				arg_8_3.data1 = 1
				arg_8_3.data2 = 1

				getProxy(TaskProxy):removeFinishTaskById(arg_8_3:getConfig("config_data")[3][1][2])
			else
				assert(false)
			end

			getProxy(ActivityProxy):updateActivity(arg_8_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3.data1 = 1

				arg_8_3:setVitemNumber(66001, 0)
				arg_8_3:setVitemNumber(66002, 0)
				arg_8_3:setVitemNumber(66003, 0)
				arg_8_3:setVitemNumber(66004, 0)
				arg_8_3:addVitemNumber(66005, arg_8_2.number[1])
				getProxy(ActivityProxy):updateActivity(arg_8_3)
				arg_8_0:sendNotification(ActivityProxy.ACTIVITY_EXCHANGE_RESOURCES, arg_8_1.activity_id)
			elseif arg_8_1.cmd == 2 then
				arg_8_3:updateDataList(arg_8_1.arg1)
				getProxy(ActivityProxy):updateActivity(arg_8_3)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_STRONGHOLD] = function()
			if arg_8_1.cmd == 1 then
				arg_8_3:updateDataList(arg_8_1.arg1)

				local var_49_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

				for iter_49_0, iter_49_1 in ipairs(arg_8_1.consumes) do
					local var_49_1 = iter_49_1[2]
					local var_49_2 = iter_49_1[3]

					if var_49_1 == 6 then
						local var_49_3 = var_8_1:getData()

						var_49_3:consume({
							[id2res(var_49_1)] = var_49_2
						})
						var_8_1:updatePlayer(var_49_3)
					else
						var_49_0:subItemCount(var_49_1, var_49_2)
					end
				end
			elseif arg_8_1.cmd == 2 then
				arg_8_3:updateKVPList(1, arg_8_1.arg1, arg_8_1.canGetIndex)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE] = function()
			assert(arg_8_3.data1 == 0)

			arg_8_3.data1 = 1

			reducePlayerOwn(arg_8_1.costDrop)
		end,
		[ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE] = function()
			arg_8_3.data1 = arg_8_3.data1 + 1

			reducePlayerOwn(arg_8_1.costDrop)
		end,
		[ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_UP] = function()
			arg_8_3:SetTargetGroupId(arg_8_1.arg1)
			arg_8_3:AddChangeCount()
		end
	})

	return arg_8_3
end

function var_0_0.performance(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
	local var_53_0 = arg_53_3:getConfig("type")
	local var_53_1

	local function var_53_2()
		if var_53_1 and coroutine.status(var_53_1) == "suspended" then
			local var_54_0, var_54_1 = coroutine.resume(var_53_1)

			assert(var_54_0, var_54_1)
		end
	end

	var_53_1 = coroutine.create(function()
		switch(var_53_0, {
			[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
				local var_56_0 = arg_53_3:getConfig("config_client").story

				if var_56_0 and var_56_0[arg_53_3.data1] and var_56_0[arg_53_3.data1][1] then
					pg.NewStoryMgr.GetInstance():Play(var_56_0[arg_53_3.data1][1], var_53_2)
					coroutine.yield()
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_BB] = function()
				local var_57_0 = pg.gameset.bobing_memory.description[arg_53_3.data1]

				if var_57_0 and #var_57_0 > 0 then
					pg.NewStoryMgr.GetInstance():Play(var_57_0, var_53_2)
					coroutine.yield()
				end

				arg_53_0:sendNotification(ActivityProxy.ACTIVITY_SHOW_BB_RESULT, {
					numbers = arg_53_2.number,
					callback = var_53_2,
					awards = arg_53_4
				})
				coroutine.yield()
			end,
			[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
				if arg_53_1.cmd == 1 then
					local var_58_0 = arg_53_3:getConfig("config_client").story

					if var_58_0 and var_58_0[arg_53_3.data1] and var_58_0[arg_53_3.data1][1] then
						pg.NewStoryMgr.GetInstance():Play(var_58_0[arg_53_3.data1][1], var_53_2)
						coroutine.yield()
					end

					arg_53_0:sendNotification(ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT, {
						activityID = arg_53_3.id,
						awards = arg_53_4,
						number = arg_53_2.number[1],
						callback = var_53_2
					})

					arg_53_4 = {}

					coroutine.yield()
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function()
				if arg_53_3:getConfig("config_client")[1] then
					local var_59_0 = arg_53_3:getConfig("config_client")[1][arg_53_3.data2 + 1]

					if var_59_0 then
						pg.NewStoryMgr.GetInstance():Play(var_59_0, var_53_2)
						coroutine.yield()
					end
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function()
				if arg_53_3:getConfig("config_client")[1] then
					local var_60_0 = arg_53_3:getConfig("config_client")[1][arg_53_3.data2 + 1]

					if var_60_0 then
						pg.NewStoryMgr.GetInstance():Play(var_60_0, var_53_2)
						coroutine.yield()
					end
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_DODGEM] = function()
				if arg_53_1.cmd == 2 and arg_53_2.number[3] > 0 then
					local var_61_0 = arg_53_3:getConfig("config_client")[1]
					local var_61_1 = {
						type = var_61_0[1],
						id = var_61_0[2],
						count = var_61_0[3]
					}

					table.insert(arg_53_4, var_61_1)
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_SUBMARINE_RUN] = function()
				if arg_53_1.cmd == 2 and arg_53_2.number[3] > 0 then
					local var_62_0 = arg_53_3:getConfig("config_client")[1]
					local var_62_1 = {
						type = var_62_0[1],
						id = var_62_0[2],
						count = var_62_0[3]
					}

					table.insert(arg_53_4, var_62_1)
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function()
				if arg_53_1.cmd == 1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("building_complete_tip"))
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function()
				if arg_53_1.cmd == 1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("building_complete_tip"))
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
				if arg_53_1.cmd == 3 then
					local var_65_0 = arg_53_3:getSpecialData("month_sign_awards") or {}

					for iter_65_0 = 1, #arg_53_4 do
						table.insert(var_65_0, arg_53_4[iter_65_0])
					end

					arg_53_3:setSpecialData("month_sign_awards", var_65_0)

					arg_53_4 = {}
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS] = function()
				if arg_53_1.cmd == 1 then
					arg_53_0:sendNotification(ActivityProxy.ACTIVITY_SHOW_SHAKE_BEADS_RESULT, {
						number = arg_53_2.number[1],
						callback = var_53_2,
						awards = arg_53_4
					})
					coroutine.yield()
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function()
				if arg_53_1.cmd == 1 then
					arg_53_3.data1 = arg_53_1.arg1
				elseif arg_53_1.cmd == 2 then
					arg_53_3.data2 = 1
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("activity_yanhua_tip8"))

				local var_68_0 = #arg_53_3:getData1List()
				local var_68_1 = arg_53_3:getConfig("config_client").story

				if var_68_1 and type(var_68_1) == "table" then
					for iter_68_0, iter_68_1 in ipairs(var_68_1) do
						if var_68_0 == iter_68_1[1] then
							pg.NewStoryMgr.GetInstance():Play(iter_68_1[2], var_53_2)
							coroutine.yield()
						end
					end
				end

				local var_68_2 = getProxy(ActivityProxy)

				var_68_2:updateActivity(arg_53_3)

				local var_68_3 = arg_53_3:getConfig("config_client").ActID

				if var_68_3 then
					local var_68_4 = var_68_2:getActivityById(var_68_3)

					if var_68_4 then
						var_68_2:updateActivity(var_68_4)
					end
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE] = function()
				getProxy(ActivityProxy):updateActivity(arg_53_3)
				arg_53_0:sendNotification(NewShopMainMediator.NOTI_UPDATE_CURRENT)
			end,
			[ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE] = function()
				getProxy(ActivityProxy):updateActivity(arg_53_3)
				arg_53_0:sendNotification(NewShopMainMediator.NOTI_UPDATE_CURRENT)
			end
		})

		if #arg_53_4 > 0 then
			arg_53_0:sendNotification(arg_53_3:getNotificationMsg(), {
				activityId = arg_53_1.activity_id,
				awards = arg_53_4,
				callback = var_53_2
			})
			coroutine.yield()
		end

		if var_53_0 == 17 and arg_53_1.cmd and arg_53_1.cmd == 2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("mingshi_get_tip"))
		end

		getProxy(ActivityProxy):updateActivity(arg_53_3)
		arg_53_0:sendNotification(ActivityProxy.ACTIVITY_OPERATION_DONE, arg_53_1.activity_id)
		existCall(arg_53_1.callback)
	end)

	var_53_2()
end

return var_0_0
