ResList = ResList or {}
ResList.LevelFleetViewResConst = {}

local var_0_0 = ResList.LevelFleetViewResConst

function var_0_0.GetResource(arg_1_0)
	local var_1_0 = {}

	table.insertto(var_1_0, var_0_0.GetShipResList(arg_1_0))
	table.insertto(var_1_0, var_0_0.GetCommanderResList(arg_1_0))
	table.insertto(var_1_0, var_0_0.GetTicketResList(arg_1_0))

	return var_1_0
end

function var_0_0.GetShipResList(arg_2_0)
	local var_2_0 = {}

	if arg_2_0.mode == 1 and arg_2_0.fleets then
		_.each(arg_2_0.fleets, function(arg_3_0)
			var_0_0.InsertFleetShipResList(arg_2_0, var_2_0, arg_3_0)
		end)
	elseif arg_2_0.mode == 2 then
		_.each(arg_2_0.eliteFleetList or {}, function(arg_4_0)
			var_0_0.InsertShipIdsResList(arg_2_0, var_2_0, arg_4_0)
		end)
		var_0_0.InsertShipIdsResList(arg_2_0, var_2_0, arg_2_0.supportFleet)
	end

	return var_2_0
end

function var_0_0.InsertFleetShipResList(arg_5_0, arg_5_1, arg_5_2)
	if not arg_5_2 then
		return
	end

	local var_5_0 = {}

	table.insertto(var_5_0, arg_5_2.mainShips or {})
	table.insertto(var_5_0, arg_5_2.vanguardShips or {})
	table.insertto(var_5_0, arg_5_2.subShips or {})
	var_0_0.InsertShipIdsResList(arg_5_0, arg_5_1, var_5_0)
end

function var_0_0.InsertShipIdsResList(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = getProxy(BayProxy)

	_.each(arg_6_2 or {}, function(arg_7_0)
		local var_7_0 = arg_6_0.shipVOs and arg_6_0.shipVOs[arg_7_0] or var_6_0:getShipById(arg_7_0)

		var_0_0.InsertShipResList(arg_6_1, var_7_0)
	end)
end

function var_0_0.InsertShipResList(arg_8_0, arg_8_1)
	if not arg_8_1 then
		return
	end

	table.insertto(arg_8_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(arg_8_1:getPainting()))
	table.insertto(arg_8_0, ResPathSupport.GetSpineQIconListByPrefabName(arg_8_1:getPrefab()))
end

function var_0_0.GetCommanderResList(arg_9_0)
	local var_9_0 = {}

	if arg_9_0.mode == 1 and arg_9_0.fleets then
		_.each(arg_9_0.fleets, function(arg_10_0)
			if arg_10_0 then
				_.each(arg_10_0:getCommanders(), function(arg_11_0)
					var_0_0.InsertCommanderResList(var_9_0, arg_11_0)
				end)
			end
		end)
	elseif arg_9_0.mode == 2 then
		_.each(arg_9_0.eliteCommanderList or {}, function(arg_12_0)
			_.each(arg_12_0, function(arg_13_0)
				local var_13_0 = getProxy(CommanderProxy):getCommanderById(arg_13_0)

				var_0_0.InsertCommanderResList(var_9_0, var_13_0)
			end)
		end)
	end

	return var_9_0
end

function var_0_0.InsertCommanderResList(arg_14_0, arg_14_1)
	if not arg_14_1 then
		return
	end

	local var_14_0 = arg_14_1:getPainting()

	if noEmptyStr(var_14_0) then
		local var_14_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderHrz, var_14_0)

		table.insert(arg_14_0, var_14_1)
	end
end

function var_0_0.GetTicketResList(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = arg_15_0.chapter and arg_15_0:getLegalSPBuffList() or {}

	_.each(var_15_1, function(arg_16_0)
		local var_16_0 = pg.benefit_buff_template[arg_16_0]
		local var_16_1 = ActivityBuff.GetBenefitCondition(var_16_0.benefit_condition)

		if var_16_1[1] == "item" then
			var_0_0.InsertTicketResList(arg_15_0, var_15_0, var_16_1[2])
		end
	end)

	return var_15_0
end

function var_0_0.InsertTicketResList(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0

	arg_17_2 = tonumber(arg_17_2)

	_.each(arg_17_0.spOPTicketItems or {}, function(arg_18_0)
		if arg_17_2 == arg_18_0.configId then
			var_17_0 = arg_18_0
		end
	end)

	if var_17_0 then
		local var_17_1 = var_17_0:getConfig("icon")

		if noEmptyStr(var_17_1) then
			table.insert(arg_17_1, var_17_1)
		end
	elseif arg_17_2 then
		local var_17_2 = Drop.New({
			type = DROP_TYPE_ITEM,
			id = arg_17_2
		}):getIcon()

		if noEmptyStr(var_17_2) then
			table.insert(arg_17_1, var_17_2)
		end
	end
end

return var_0_0
