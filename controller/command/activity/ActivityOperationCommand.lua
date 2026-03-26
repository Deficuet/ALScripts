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
	}, 11203, function(arg_6_0)
		if arg_6_0.result == 0 then
			local var_6_0 = PlayerConst.GetTranAwards(var_1_0, arg_6_0)
			local var_6_1 = arg_1_0:updateActivityData(var_1_0, arg_6_0, var_1_1, var_6_0)

			getProxy(ActivityTaskProxy):checkAutoSubmit()
			arg_1_0:performance(var_1_0, arg_6_0, var_6_1, var_6_0)
		else
			originalPrint("activity op ret code: " .. arg_6_0.result)

			if var_1_2 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN or var_1_2 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN or var_1_2 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN or var_1_2 == ActivityConst.ACTIVITY_TYPE_REFLUX then
				var_1_1.autoActionForbidden = true

				getProxy(ActivityProxy):updateActivity(var_1_1)
			elseif var_1_2 == ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1 or var_1_2 == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD then
				if arg_6_0.result == 1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("activity_build_end_tip"))
				end
			elseif var_1_2 == 17 then
				pg.TipsMgr.GetInstance():ShowTips("错误!:" .. arg_6_0.result)
			elseif var_1_2 == ActivityConst.ACTIVITY_TYPE_FRESH_TEC_CATCHUP then
				pg.TipsMgr.GetInstance():ShowTips(errorTip("activity_op_error", arg_6_0.result))
			elseif var_1_2 == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF then
				if var_1_1:getConfig("config_client").resource_ID == BossRushDALUpgradeView.RES_ID then
					pg.TipsMgr.GetInstance():ShowTips(i18n("DAL_upgrade_not_enough"))
				end
			elseif arg_6_0.result == 3 or arg_6_0.result == 4 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("activity_op_error", arg_6_0.result))
			end

			arg_1_0:sendNotification(ActivityProxy.ACTIVITY_OPERATION_ERRO, {
				actId = var_1_0.activity_id,
				code = arg_6_0.result
			})
		end
	end)
end

function var_0_0.updateActivityData(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	local var_7_0 = arg_7_3:getConfig("type")
	local var_7_1 = getProxy(PlayerProxy)
	local var_7_2 = getProxy(TaskProxy)

	switch(var_7_0, {
		[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
			arg_7_3.data1 = arg_7_3.data1 + 1
			arg_7_3.data2 = pg.TimeMgr.GetInstance():GetServerTime()
		end,
		[ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data1 = arg_7_3.data1 + 1
				arg_7_3.data2 = pg.TimeMgr.GetInstance():GetServerTime()
			elseif arg_7_1.cmd == 2 then
				arg_7_3.achieved = true
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = function()
			table.insert(arg_7_3.data1_list, arg_7_1.arg1)
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function()
			table.insert(arg_7_3.data1_list, arg_7_1.arg1)
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELPLAN] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data1 = true
			elseif arg_7_1.cmd == 2 then
				table.insert(arg_7_3.data1_list, arg_7_1.arg1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
			local var_13_0 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_13_1 = pg.TimeMgr.GetInstance():STimeDescS(var_13_0, "*t")
			local var_13_2

			if arg_7_3:getSpecialData("reMonthSignDay") ~= nil then
				var_13_2 = arg_7_3:getSpecialData("reMonthSignDay")
				arg_7_3.data3 = arg_7_3.data3 and arg_7_3.data3 + 1 or 1
			else
				var_13_2 = var_13_1.day
			end

			getProxy(ActivityProxy):updateActivity(arg_7_3)
			table.insert(arg_7_3.data1_list, var_13_2)
		end,
		[ActivityConst.ACTIVITY_TYPE_CHARGEAWARD] = function()
			arg_7_3.data2 = 1
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1] = function()
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_SHIP, arg_7_1.arg1)

			local var_15_0 = pg.ship_data_create_material[arg_7_1.buildId]

			if arg_7_1.arg2 == 1 then
				local var_15_1 = getProxy(ActivityProxy)
				local var_15_2 = var_15_1:getBuildFreeActivityByBuildId(arg_7_1.buildId)

				var_15_2.data1 = var_15_2.data1 - arg_7_1.arg1

				var_15_1:updateActivity(var_15_2)
			else
				getProxy(BagProxy):removeItemById(var_15_0.use_item, var_15_0.number_1 * arg_7_1.arg1)

				local var_15_3 = var_7_1:getData()

				var_15_3:consume({
					gold = var_15_0.use_gold * arg_7_1.arg1
				})
				var_7_1:updatePlayer(var_15_3)
			end

			local var_15_4 = getProxy(BuildShipProxy)

			if var_15_0.exchange_count > 0 then
				var_15_4:changeRegularExchangeCount(arg_7_1.arg1 * var_15_0.exchange_count)
			end

			for iter_15_0, iter_15_1 in ipairs(arg_7_2.build) do
				local var_15_5 = BuildShip.New(iter_15_1)

				var_15_4:addBuildShip(var_15_5)
			end

			arg_7_3.data1 = arg_7_3.data1 + arg_7_1.arg1

			arg_7_0:sendNotification(GAME.BUILD_SHIP_DONE)
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDSHIP_PRAY] = ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		[ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD] = ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		[ActivityConst.ACTIVITY_TYPE_SHOP] = function()
			local var_16_0 = getProxy(ShopsProxy)
			local var_16_1 = var_16_0:getActivityShopById(arg_7_3.id)

			var_16_0:UpdateActivityGoods(arg_7_3.id, arg_7_1.arg1, arg_7_1.arg2)

			if table.contains(arg_7_3.data1_list, arg_7_1.arg1) then
				for iter_16_0, iter_16_1 in ipairs(arg_7_3.data1_list) do
					if iter_16_1 == arg_7_1.arg1 then
						arg_7_3.data2_list[iter_16_0] = arg_7_3.data2_list[iter_16_0] + arg_7_1.arg2

						break
					end
				end
			else
				table.insert(arg_7_3.data1_list, arg_7_1.arg1)
				table.insert(arg_7_3.data2_list, arg_7_1.arg2)
			end

			local var_16_2 = var_16_1:bindConfigTable()[arg_7_1.arg1]
			local var_16_3 = var_16_2.resource_num * arg_7_1.arg2
			local var_16_4 = var_7_1:getData()

			var_16_4:consume({
				[id2res(var_16_2.resource_type)] = var_16_3
			})
			var_7_1:updatePlayer(var_16_4)
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = function()
			if arg_7_1.cmd == 1 then
				local var_17_0, var_17_1 = getActivityTask(arg_7_3)

				if var_17_1 and not var_17_1:isReceive() then
					local var_17_2 = arg_7_3:getConfig("config_data")

					for iter_17_0, iter_17_1 in ipairs(var_17_2) do
						local var_17_3 = _.flatten({
							iter_17_1
						})

						if table.contains(var_17_3, var_17_0) then
							arg_7_3.data3 = iter_17_0

							break
						end
					end
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_RES] = function()
			if arg_7_1.cmd == 1 then
				local var_18_0, var_18_1 = getActivityTask(arg_7_3)

				if var_18_1 and not var_18_1:isReceive() then
					local var_18_2 = arg_7_3:getConfig("config_data")

					for iter_18_0, iter_18_1 in ipairs(var_18_2) do
						local var_18_3 = _.flatten({
							iter_18_1
						})

						if table.contains(var_18_3, var_18_0) then
							arg_7_3.data3 = iter_18_0

							break
						end
					end
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function()
			if arg_7_1.cmd == PuzzleActivity.CMD_COMPLETE then
				arg_7_3.data1 = 1
			elseif arg_7_1.cmd == PuzzleActivity.CMD_EARN_EXTRA then
				arg_7_3.data1 = 2
			elseif arg_7_1.cmd == PuzzleActivity.CMD_ACTIVATE then
				table.insert(arg_7_3.data2_list, arg_7_1.arg1)
			end

			getProxy(ActivityProxy):updateActivity(arg_7_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function()
			arg_7_3.data1 = arg_7_3.data1 + 1
			arg_7_3.data2 = arg_7_3.data2 - 1
			arg_7_3.data1_list = arg_7_2.number
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY] = function()
			if arg_7_1.cmd == 1 then
				local var_21_0 = ActivityItemPool.New({
					id = arg_7_1.arg2
				})
				local var_21_1 = var_21_0:getComsume()
				local var_21_2 = arg_7_1.arg1 * var_21_1.count

				if var_21_1.type == DROP_TYPE_RESOURCE then
					local var_21_3 = var_7_1:getData()

					var_21_3:consume({
						[id2res(var_21_1.id)] = var_21_2
					})
					var_7_1:updatePlayer(var_21_3)
				elseif var_21_1.type == DROP_TYPE_ITEM then
					getProxy(BagProxy):removeItemById(var_21_1.id, var_21_2)
				end

				arg_7_3:updateData(var_21_0.id, arg_7_2.number)
			elseif arg_7_1.cmd == 2 then
				arg_7_3.data1 = arg_7_1.arg1
			elseif arg_7_1.cmd == 3 then
				arg_7_3.data2_list = _.map(arg_7_1.arg_list, function(arg_22_0)
					return arg_22_0
				end)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function()
			if arg_7_1.cmd == 1 then
				local var_23_0 = arg_7_3:getConfig("config_data")[4]

				if #arg_7_4 > 0 then
					arg_7_3.data2 = arg_7_3.data2 + 1

					if var_23_0 <= arg_7_3.data2 then
						arg_7_3.data1 = 1
					end
				end

				if arg_7_3.data4 == 0 then
					arg_7_3.data4 = arg_7_1.arg2
				elseif arg_7_1.arg2 < arg_7_3.data4 then
					arg_7_3.data4 = arg_7_1.arg2
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = ActivityConst.ACTIVITY_TYPE_CARD_PAIRS,
		[ActivityConst.ACTIVITY_TYPE_REFLUX] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data1_list[1] = pg.TimeMgr.GetInstance():GetServerTime()
				arg_7_3.data1_list[2] = arg_7_3.data1_list[2] + 1
			elseif arg_7_1.cmd == 2 then
				arg_7_3.data4 = arg_7_1.arg1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data1 = arg_7_3.data1 + 1
				arg_7_3.data2 = arg_7_2.number[1]
			elseif arg_7_1.cmd == 2 then
				table.insert(arg_7_3.data1_list, arg_7_3.data1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_DODGEM] = function()
			if arg_7_1.cmd == 1 then
				arg_7_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_7_1.statistics,
					score = arg_7_1.statistics._battleScore,
					system = SYSTEM_DODGEM
				})

				arg_7_3.data1_list[1] = math.max(arg_7_3.data1_list[1], arg_7_1.arg2)
				arg_7_3.data2_list[1] = arg_7_2.number[1]
				arg_7_3.data2_list[2] = arg_7_2.number[2]
			elseif arg_7_1.cmd == 2 then
				arg_7_3.data2 = arg_7_2.number[1]
				arg_7_3.data3 = arg_7_2.number[2]
				arg_7_3.data2_list[1] = 0
				arg_7_3.data2_list[2] = 0
			elseif arg_7_1.cmd == 3 then
				arg_7_3.data4 = defaultValue(arg_7_3.data4, 0) + 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SUBMARINE_RUN] = function()
			if arg_7_1.cmd == 1 then
				arg_7_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_7_1.statistics,
					score = arg_7_1.statistics._battleScore,
					system = SYSTEM_SUBMARINE_RUN
				})

				arg_7_3.data1_list[1] = math.max(arg_7_3.data1_list[1], arg_7_1.arg2)
				arg_7_3.data2_list[1] = arg_7_2.number[1]
				arg_7_3.data2_list[2] = arg_7_2.number[2]
			elseif arg_7_1.cmd == 2 then
				arg_7_3.data2 = arg_7_2.number[1]
				arg_7_3.data3 = arg_7_2.number[2]
				arg_7_3.data2_list[1] = 0
				arg_7_3.data2_list[2] = 0
			elseif arg_7_1.cmd == 3 then
				arg_7_3.data4 = defaultValue(arg_7_3.data4, 0) + 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function()
			if arg_7_1.cmd == 2 then
				arg_7_3.data4 = 0
			elseif arg_7_1.cmd == 1 then
				local var_28_0 = arg_7_3:getConfig("config_id")
				local var_28_1 = pg.activity_event_turning[var_28_0].total_num

				if arg_7_3.data3 == var_28_1 then
					arg_7_3.data2 = 1
					arg_7_3.data3 = arg_7_3.data3 + 1
				else
					arg_7_3.data3 = arg_7_3.data3 + 1
					arg_7_3.data4 = arg_7_2.number[1]
					arg_7_3.data1_list[arg_7_1.arg1] = arg_7_3.data4
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function()
			arg_7_3.data1 = 1
		end,
		[ActivityConst.ACTIVITY_TYPE_RED_PACKETS] = function()
			arg_7_3.data1 = arg_7_3.data1 - 1

			if arg_7_3.data2 > 0 then
				arg_7_3.data2 = arg_7_3.data2 - 1
			end

			arg_7_3.data1_list[2] = arg_7_3.data1_list[2] + 1

			local var_30_0 = getProxy(ActivityProxy)
			local var_30_1 = var_30_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

			if var_30_1 and not var_30_1:isEnd() and var_30_1.data2_list[1] > var_30_1.data2_list[2] then
				var_30_1.data2_list[2] = var_30_1.data2_list[2] + 1

				var_30_0:updateActivity(var_30_1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER] = function()
			arg_7_3.data1 = arg_7_3.data1 + 1

			if not table.contains(arg_7_3.data2_list, arg_7_1.arg1) then
				table.insert(arg_7_3.data2_list, arg_7_1.arg1)
			end

			if not table.contains(arg_7_3.data1_list, arg_7_2.number[1]) then
				table.insert(arg_7_3.data1_list, arg_7_2.number[1])
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function()
			if arg_7_1.cmd == 1 then
				local var_32_0 = pg.activity_event_building[arg_7_1.arg1]
				local var_32_1 = arg_7_3:GetBuildingLevel(arg_7_1.arg1)

				arg_7_3:SetBuildingLevel(arg_7_1.arg1, var_32_1 + 1)

				if var_32_1 < #var_32_0.buff then
					_.each(var_32_0.material[var_32_1], function(arg_33_0)
						local var_33_0 = arg_33_0[1]
						local var_33_1 = arg_33_0[2]
						local var_33_2 = arg_33_0[3]
						local var_33_3

						if var_33_0 == DROP_TYPE_VITEM then
							local var_33_4 = AcessWithinNull(Item.getConfigData(var_33_1), "link_id")

							assert(var_33_4 == arg_7_3.id)

							var_33_3 = arg_7_3
						elseif var_33_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_33_5 = AcessWithinNull(pg.activity_drop_type[var_33_0], "activity_id")

							var_33_3 = getProxy(ActivityProxy):getActivityById(var_33_5)
						end

						local var_33_6 = var_33_3.data1KeyValueList[1][var_33_1] or 0
						local var_33_7 = math.max(0, var_33_6 - var_33_2)

						var_33_3.data1KeyValueList[1][var_33_1] = var_33_7

						if var_33_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							getProxy(ActivityProxy):updateActivity(var_33_3)
						end
					end)
				end
			elseif arg_7_1.cmd == 2 and var_7_0 == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2 then
				arg_7_3:RecordLastRequestTime()
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
			if arg_7_1.cmd == 2 then
				table.insert(arg_7_3.data2_list, arg_7_1.arg1)
				arg_7_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_7_1.statistics,
					score = arg_7_1.statistics._battleScore,
					system = SYSTEM_REWARD_PERFORM
				})

				return arg_7_3
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function()
			if arg_7_1.cmd == 0 then
				return arg_7_3
			end

			if arg_7_1.cmd == 3 then
				arg_7_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_7_1.statistics,
					score = arg_7_1.statistics._battleScore,
					system = SYSTEM_REWARD_PERFORM
				})

				return arg_7_3
			end

			if arg_7_1.cmd == 4 then
				arg_7_3.data2_list[1] = arg_7_3.data2_list[1] + 1

				return arg_7_3
			end

			if arg_7_1.cmd == 1 then
				arg_7_3.data3 = arg_7_3.data3 - 1
			end

			local var_35_0 = arg_7_1.arg1

			if arg_7_1.cmd ~= 2 then
				arg_7_3.data2 = var_35_0
			end

			local var_35_1 = arg_7_2.number[1]

			arg_7_3.data1_list[var_35_0] = var_35_1

			print("格子:" .. var_35_0 .. " 值:" .. arg_7_2.number[1])

			if arg_7_2.number[2] and arg_7_3.data1 ~= arg_7_2.number[2] then
				print("关卡变更" .. arg_7_2.number[2])

				arg_7_3.data1 = arg_7_3.data1 + 1
				arg_7_3.data2 = 0

				for iter_35_0 = 1, #arg_7_3.data1_list do
					arg_7_3.data1_list[iter_35_0] = 0
				end
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = function()
			if arg_7_1.cmd == 1 then
				arg_7_0:sendNotification(GAME.FINISH_STAGE_DONE, {
					statistics = arg_7_1.statistics,
					score = arg_7_1.statistics._battleScore,
					system = SYSTEM_AIRFIGHT
				})

				arg_7_3.data1KeyValueList[1] = arg_7_3.data1KeyValueList[1] or {}
				arg_7_3.data1KeyValueList[1][arg_7_1.arg1] = (arg_7_3.data1KeyValueList[1][arg_7_1.arg1] or 0) + 1
			elseif arg_7_1.cmd == 2 then
				arg_7_3.data1KeyValueList[2] = arg_7_3.data1KeyValueList[2] or {}
				arg_7_3.data1KeyValueList[2][arg_7_1.arg1] = 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data1 = arg_7_3.data1 - 1

				local var_37_0 = arg_7_2.number[1]

				arg_7_3.data1KeyValueList[1][var_37_0] = arg_7_3.data1KeyValueList[1][var_37_0] + 1
			elseif arg_7_1.cmd == 2 then
				arg_7_3.data2 = 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data2 = 1
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function()
			if arg_7_1.cmd == SpringActivity.OPERATION_UNLOCK then
				arg_7_3:AddSlotCount()
			elseif arg_7_1.cmd == SpringActivity.OPERATION_SETSHIP then
				arg_7_3:SetShipIds(arg_7_1.kvargs1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function()
			if arg_7_1.cmd == Spring2Activity.OPERATION_SETSHIP then
				arg_7_3:SetShipIds(arg_7_1.kvargs1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data1 = arg_7_3.data1 - 1

				if not table.contains(arg_7_3.data1_list, arg_7_1.arg1) then
					table.insert(arg_7_3.data1_list, arg_7_1.arg1)
				end

				local var_41_0 = Item.getConfigData(arg_7_1.arg1).link_id

				if var_41_0 > 0 then
					local var_41_1 = getProxy(ActivityProxy)
					local var_41_2 = var_41_1:getActivityById(var_41_0)

					if var_41_2 and not var_41_2:isEnd() then
						var_41_2.data1 = var_41_2.data1 + 1

						var_41_1:updateActivity(var_41_2)
					end
				end

				local var_41_3 = getProxy(PlayerProxy)
				local var_41_4 = var_41_3:getRawData()
				local var_41_5 = arg_7_3:getConfig("config_data")[2][1]
				local var_41_6 = arg_7_3:getConfig("config_data")[2][2]

				var_41_4:consume({
					[id2res(var_41_5)] = var_41_6
				})
				var_41_3:updatePlayer(var_41_4)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function()
			if not table.contains(arg_7_3.data1_list, arg_7_1.arg1) then
				table.insert(arg_7_3.data1_list, arg_7_1.arg1)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function()
			if arg_7_1.cmd == 1 then
				if arg_7_1.arg1 == LaunchBallGameConst.round_type_juqing then
					arg_7_3.data1 = arg_7_3.data1 + 1
				elseif arg_7_1.arg1 == 2 then
					if not arg_7_3.data1_list then
						arg_7_3.data1_list = {}
					end

					table.insert(arg_7_3.data1_list, arg_7_1.arg2)
				elseif arg_7_1.arg1 == 3 then
					arg_7_3.data2 = arg_7_1.arg2
				end
			elseif arg_7_1.cmd == 2 then
				arg_7_3.data3 = 1
			end

			getProxy(ActivityProxy):updateActivity(arg_7_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLE_CONNECT] = function()
			local var_44_0 = getProxy(ActivityProxy)
			local var_44_1 = arg_7_3.data1_list
			local var_44_2 = arg_7_3.data2_list
			local var_44_3 = arg_7_3.data3_list

			if arg_7_1.cmd == 1 then
				local var_44_4 = pg.activity_tolove_jigsaw[arg_7_1.arg1].need[2]
				local var_44_5 = pg.player_resource[var_44_4].name
				local var_44_6 = pg.activity_tolove_jigsaw[arg_7_1.arg1].need[3]
				local var_44_7 = var_7_1:getData()

				var_44_7:consume({
					[var_44_5] = var_44_6
				})
				var_7_1:updatePlayer(var_44_7)
				table.insert(var_44_1, arg_7_1.arg1)
			elseif arg_7_1.cmd == 2 then
				table.insert(var_44_2, arg_7_1.arg1)
			elseif arg_7_1.cmd == 3 then
				table.insert(var_44_3, arg_7_1.arg1)
			end

			var_44_0:updateActivity(arg_7_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING] = function()
			local var_45_0 = getProxy(ActivityProxy)

			arg_7_3.data2 = arg_7_3.data2 + arg_7_3.data1
			arg_7_3.data1 = 0

			var_45_0:updateActivity(arg_7_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_FRESH_TEC_CATCHUP] = function()
			if arg_7_1.cmd == 1 then
				if not table.contains(arg_7_3.data1_list, arg_7_3.data1) then
					table.insert(arg_7_3.data1_list, arg_7_3.data1)
				end

				arg_7_3.data1 = arg_7_1.arg1
			elseif arg_7_1.cmd == 2 then
				-- block empty
			elseif arg_7_1.cmd == 3 then
				if not table.contains(arg_7_3.data1_list, arg_7_3.data1) then
					table.insert(arg_7_3.data1_list, arg_7_3.data1)
				end

				arg_7_3.data1 = 1
				arg_7_3.data2 = 1

				getProxy(TaskProxy):removeFinishTaskById(arg_7_3:getConfig("config_data")[3][1][2])
			else
				assert(false)
			end

			getProxy(ActivityProxy):updateActivity(arg_7_3)
		end,
		[ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3.data1 = 1

				arg_7_3:setVitemNumber(66001, 0)
				arg_7_3:setVitemNumber(66002, 0)
				arg_7_3:setVitemNumber(66003, 0)
				arg_7_3:setVitemNumber(66004, 0)
				arg_7_3:addVitemNumber(66005, arg_7_2.number[1])
				getProxy(ActivityProxy):updateActivity(arg_7_3)
				arg_7_0:sendNotification(ActivityProxy.ACTIVITY_EXCHANGE_RESOURCES, arg_7_1.activity_id)
			elseif arg_7_1.cmd == 2 then
				arg_7_3:updateDataList(arg_7_1.arg1)
				getProxy(ActivityProxy):updateActivity(arg_7_3)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_STRONGHOLD] = function()
			if arg_7_1.cmd == 1 then
				arg_7_3:updateDataList(arg_7_1.arg1)

				local var_48_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

				for iter_48_0, iter_48_1 in ipairs(arg_7_1.consumes) do
					local var_48_1 = iter_48_1[2]
					local var_48_2 = iter_48_1[3]

					if var_48_1 == 6 then
						local var_48_3 = var_7_1:getData()

						var_48_3:consume({
							[id2res(var_48_1)] = var_48_2
						})
						var_7_1:updatePlayer(var_48_3)
					else
						var_48_0:subItemCount(var_48_1, var_48_2)
					end
				end
			elseif arg_7_1.cmd == 2 then
				arg_7_3:updateKVPList(1, arg_7_1.arg1, arg_7_1.canGetIndex)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE] = function()
			assert(arg_7_3.data1 == 0)

			arg_7_3.data1 = 1

			reducePlayerOwn(arg_7_1.costDrop)
		end,
		[ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_UP] = function()
			arg_7_3:SetTargetGroupId(arg_7_1.arg1)
			arg_7_3:AddChangeCount()
		end
	})

	return arg_7_3
end

function var_0_0.performance(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4)
	local var_51_0 = arg_51_3:getConfig("type")
	local var_51_1

	local function var_51_2()
		if var_51_1 and coroutine.status(var_51_1) == "suspended" then
			local var_52_0, var_52_1 = coroutine.resume(var_51_1)

			assert(var_52_0, var_52_1)
		end
	end

	var_51_1 = coroutine.create(function()
		switch(var_51_0, {
			[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
				local var_54_0 = arg_51_3:getConfig("config_client").story

				if var_54_0 and var_54_0[arg_51_3.data1] and var_54_0[arg_51_3.data1][1] then
					pg.NewStoryMgr.GetInstance():Play(var_54_0[arg_51_3.data1][1], var_51_2)
					coroutine.yield()
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_BB] = function()
				local var_55_0 = pg.gameset.bobing_memory.description[arg_51_3.data1]

				if var_55_0 and #var_55_0 > 0 then
					pg.NewStoryMgr.GetInstance():Play(var_55_0, var_51_2)
					coroutine.yield()
				end

				arg_51_0:sendNotification(ActivityProxy.ACTIVITY_SHOW_BB_RESULT, {
					numbers = arg_51_2.number,
					callback = var_51_2,
					awards = arg_51_4
				})
				coroutine.yield()
			end,
			[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
				if arg_51_1.cmd == 1 then
					local var_56_0 = arg_51_3:getConfig("config_client").story

					if var_56_0 and var_56_0[arg_51_3.data1] and var_56_0[arg_51_3.data1][1] then
						pg.NewStoryMgr.GetInstance():Play(var_56_0[arg_51_3.data1][1], var_51_2)
						coroutine.yield()
					end

					arg_51_0:sendNotification(ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT, {
						activityID = arg_51_3.id,
						awards = arg_51_4,
						number = arg_51_2.number[1],
						callback = var_51_2
					})

					arg_51_4 = {}

					coroutine.yield()
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function()
				if arg_51_3:getConfig("config_client")[1] then
					local var_57_0 = arg_51_3:getConfig("config_client")[1][arg_51_3.data2 + 1]

					if var_57_0 then
						pg.NewStoryMgr.GetInstance():Play(var_57_0, var_51_2)
						coroutine.yield()
					end
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function()
				if arg_51_3:getConfig("config_client")[1] then
					local var_58_0 = arg_51_3:getConfig("config_client")[1][arg_51_3.data2 + 1]

					if var_58_0 then
						pg.NewStoryMgr.GetInstance():Play(var_58_0, var_51_2)
						coroutine.yield()
					end
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_DODGEM] = function()
				if arg_51_1.cmd == 2 and arg_51_2.number[3] > 0 then
					local var_59_0 = arg_51_3:getConfig("config_client")[1]
					local var_59_1 = {
						type = var_59_0[1],
						id = var_59_0[2],
						count = var_59_0[3]
					}

					table.insert(arg_51_4, var_59_1)
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_SUBMARINE_RUN] = function()
				if arg_51_1.cmd == 2 and arg_51_2.number[3] > 0 then
					local var_60_0 = arg_51_3:getConfig("config_client")[1]
					local var_60_1 = {
						type = var_60_0[1],
						id = var_60_0[2],
						count = var_60_0[3]
					}

					table.insert(arg_51_4, var_60_1)
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function()
				if arg_51_1.cmd == 1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("building_complete_tip"))
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function()
				if arg_51_1.cmd == 1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("building_complete_tip"))
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
				if arg_51_1.cmd == 3 then
					local var_63_0 = arg_51_3:getSpecialData("month_sign_awards") or {}

					for iter_63_0 = 1, #arg_51_4 do
						table.insert(var_63_0, arg_51_4[iter_63_0])
					end

					arg_51_3:setSpecialData("month_sign_awards", var_63_0)

					arg_51_4 = {}
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS] = function()
				if arg_51_1.cmd == 1 then
					arg_51_0:sendNotification(ActivityProxy.ACTIVITY_SHOW_SHAKE_BEADS_RESULT, {
						number = arg_51_2.number[1],
						callback = var_51_2,
						awards = arg_51_4
					})
					coroutine.yield()
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function()
				if arg_51_1.cmd == 1 then
					arg_51_3.data1 = arg_51_1.arg1
				elseif arg_51_1.cmd == 2 then
					arg_51_3.data2 = 1
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("activity_yanhua_tip8"))

				local var_66_0 = #arg_51_3:getData1List()
				local var_66_1 = arg_51_3:getConfig("config_client").story

				if var_66_1 and type(var_66_1) == "table" then
					for iter_66_0, iter_66_1 in ipairs(var_66_1) do
						if var_66_0 == iter_66_1[1] then
							pg.NewStoryMgr.GetInstance():Play(iter_66_1[2], var_51_2)
							coroutine.yield()
						end
					end
				end

				local var_66_2 = getProxy(ActivityProxy)

				var_66_2:updateActivity(arg_51_3)

				local var_66_3 = arg_51_3:getConfig("config_client").ActID

				if var_66_3 then
					local var_66_4 = var_66_2:getActivityById(var_66_3)

					if var_66_4 then
						var_66_2:updateActivity(var_66_4)
					end
				end
			end,
			[ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE] = function()
				getProxy(ActivityProxy):updateActivity(arg_51_3)
				arg_51_0:sendNotification(NewShopMainMediator.NOTI_UPDATE_CURRENT)
			end
		})

		if #arg_51_4 > 0 then
			arg_51_0:sendNotification(arg_51_3:getNotificationMsg(), {
				activityId = arg_51_1.activity_id,
				awards = arg_51_4,
				callback = var_51_2
			})
			coroutine.yield()
		end

		if var_51_0 == 17 and arg_51_1.cmd and arg_51_1.cmd == 2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("mingshi_get_tip"))
		end

		getProxy(ActivityProxy):updateActivity(arg_51_3)
		arg_51_0:sendNotification(ActivityProxy.ACTIVITY_OPERATION_DONE, arg_51_1.activity_id)
	end)

	var_51_2()
end

return var_0_0
