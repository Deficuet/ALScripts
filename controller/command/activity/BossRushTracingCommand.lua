local var_0_0 = class("BossRushTracingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	if BeginStageCommand.DockOverload() then
		return
	end

	local var_1_0 = arg_1_1.body
	local var_1_1 = var_1_0.seriesId
	local var_1_2 = var_1_0.actId
	local var_1_3 = getProxy(ActivityProxy):getActivityById(var_1_2)

	if not var_1_3 then
		return
	end

	local var_1_4 = var_1_0.mode
	local var_1_5

	if var_1_3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
		var_1_5 = var_1_3:GetCollabSeriesData(var_1_1)
		var_1_5.mode = var_1_4
		var_1_1 = var_1_5:GetActivitySeriesID()
	else
		var_1_5 = BossRushSeriesData.New({
			id = var_1_1,
			actId = var_1_2,
			mode = var_1_4
		})
	end

	local var_1_6 = var_1_5:GetFleetIds()
	local var_1_7 = var_1_0.mode
	local var_1_8 = Clone(var_1_6)
	local var_1_9 = {
		table.remove(var_1_8)
	}

	if var_1_7 == BossRushSeriesData.MODE.SINGLE then
		var_1_8 = {
			table.remove(var_1_8, 1)
		}
	end

	local var_1_10 = getProxy(FleetProxy):getActivityFleets()[var_1_2]
	local var_1_11 = _.map(var_1_8, function(arg_2_0)
		return var_1_10[arg_2_0]
	end)
	local var_1_12 = var_1_10[var_1_9[1]]

	if var_1_12:isEmpty() then
		table.remove(var_1_9)
	end

	local var_1_13 = (function()
		local var_3_0 = 0
		local var_3_1

		if var_1_5.__cname == "CollabrateBossRushSeriesData" then
			var_3_1 = SYSTEM_BOSS_RUSH_COLLABRATE
		elseif var_1_5:GetType() == BossRushSeriesData.TYPE.EXTRA then
			var_3_1 = SYSTEM_BOSS_RUSH_EX
		else
			var_3_1 = SYSTEM_BOSS_RUSH
		end

		local var_3_2 = pg.battle_cost_template[var_3_1]
		local var_3_3 = var_1_5:GetOilLimit()
		local var_3_4 = var_3_2.oil_cost > 0

		local function var_3_5(arg_4_0, arg_4_1)
			local var_4_0 = 0

			if var_3_4 then
				var_4_0 = arg_4_0:GetCostSum().oil

				if arg_4_1 > 0 then
					var_4_0 = math.min(arg_4_1, var_4_0)
				end
			end

			return var_4_0
		end

		local var_3_6 = #var_1_5:GetExpeditionIds()

		if var_1_7 == BossRushSeriesData.MODE.SINGLE then
			var_3_0 = var_3_0 + var_3_5(var_1_11[1], var_3_3[1])
			var_3_0 = var_3_0 + var_3_5(var_1_12, var_3_3[2])
			var_3_0 = var_3_0 * var_3_6
		else
			var_3_0 = var_3_5(var_1_12, var_3_3[2]) * var_3_6

			_.each(var_1_11, function(arg_5_0)
				var_3_0 = var_3_0 + var_3_5(arg_5_0, var_3_3[1])
			end)
		end

		return var_3_0
	end)()
	local var_1_14 = var_1_5:GetOilCost()
	local var_1_15 = var_1_13 + var_1_14

	if var_1_15 > getProxy(PlayerProxy):getRawData().oil then
		if not ItemTipPanel.ShowOilBuyTip(var_1_15) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 1,
		activity_id = var_1_2,
		arg1 = var_1_1,
		arg2 = var_1_7,
		arg_list = var_1_8,
		arg_list2 = var_1_9
	}, 11203, function(arg_6_0)
		if arg_6_0.result == 0 then
			getProxy(ActivityProxy):getActivityById(var_1_2):SetSeriesData(var_1_5)

			if var_1_14 > 0 then
				local var_6_0 = getProxy(PlayerProxy):getRawData()

				var_6_0:consume({
					oil = var_1_14
				})
				getProxy(PlayerProxy):updatePlayer(var_6_0)
			end

			;(function()
				local var_7_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK)

				if not var_7_0 then
					return
				end

				var_7_0:ResetLast()
				getProxy(ActivityProxy):updateActivity(var_7_0)
			end)()
			arg_1_0:sendNotification(GAME.BOSSRUSH_TRACE_DONE, var_1_5)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_6_0.result))
			arg_1_0:sendNotification(GAME.BOSSRUSH_TRACE_ERROR, arg_6_0.result)
		end
	end)
end

return var_0_0
