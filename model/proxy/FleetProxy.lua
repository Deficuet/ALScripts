local var_0_0 = class("FleetProxy", import(".NetProxy"))

var_0_0.FLEET_ADDED = "fleet added"
var_0_0.FLEET_UPDATED = "fleet updated"
var_0_0.FLEET_RENAMED = "fleet renamed"
var_0_0.PVP_FLEET_ID = 101
var_0_0.CHALLENGE_FLEET_ID = 102
var_0_0.CHALLENGE_SUB_FLEET_ID = 103

function var_0_0.register(arg_1_0)
	arg_1_0.extraFleets = {}
	arg_1_0.activityFleetData = {}

	arg_1_0:on(12101, function(arg_2_0)
		arg_1_0.data = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.group_list) do
			local var_2_0 = var_0_0.CreateFleet(iter_2_1)

			var_2_0:display("loaded")

			arg_1_0.data[var_2_0.id] = var_2_0

			arg_1_0:CommanderManualTaskProgressAdd(var_2_0)
		end

		for iter_2_2 = 1, FormationUI.MAX_FLEET_NUM do
			if not arg_1_0.data[iter_2_2] then
				arg_1_0.data[iter_2_2] = var_0_0.CreateFleet({
					name = "",
					id = iter_2_2,
					ship_list = {},
					commanders = {}
				})
			end
		end

		for iter_2_3, iter_2_4 in pairs({
			[var_0_0.PVP_FLEET_ID] = "",
			[var_0_0.CHALLENGE_FLEET_ID] = "",
			[var_0_0.CHALLENGE_SUB_FLEET_ID] = ""
		}) do
			if not arg_1_0.data[iter_2_3] then
				arg_1_0.data[iter_2_3] = var_0_0.CreateFleet({
					id = iter_2_3,
					name = iter_2_4,
					ship_list = {},
					commanders = {}
				})
			end
		end

		for iter_2_5, iter_2_6 in ipairs({
			var_0_0.CHALLENGE_FLEET_ID,
			var_0_0.CHALLENGE_SUB_FLEET_ID
		}) do
			arg_1_0.extraFleets[iter_2_6] = arg_1_0.data[iter_2_6]
			arg_1_0.data[iter_2_6] = nil
		end

		if LOCK_SUBMARINE then
			for iter_2_7, iter_2_8 in pairs(arg_1_0.data) do
				if iter_2_8.id == 11 or iter_2_8.id == 12 then
					arg_1_0.data[iter_2_7] = nil
				end
			end
		end

		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inFleet")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inPvP")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inChallenge")
	end)
	arg_1_0:on(12106, function(arg_3_0)
		local var_3_0 = var_0_0.CreateFleet(arg_3_0.group)

		if arg_1_0.data[var_3_0.id] then
			arg_1_0:updateFleet(var_3_0)
		else
			arg_1_0:addFleet(var_3_0)
		end
	end)
end

function var_0_0.CreateFleet(arg_4_0)
	local var_4_0 = arg_4_0.id
	local var_4_1 = CreateShell(arg_4_0)

	var_4_1.fleetType = FleetType.Normal

	if var_4_0 >= Fleet.REGULAR_FLEET_ID and var_4_0 < Fleet.REGULAR_FLEET_ID + Fleet.REGULAR_FLEET_NUMS then
		if var_4_0 == Fleet.REGULAR_FLEET_ID then
			var_4_1.saveLastShipFlag = true
		end
	elseif var_4_0 >= Fleet.SUBMARINE_FLEET_ID and var_4_0 < Fleet.SUBMARINE_FLEET_ID + Fleet.SUBMARINE_FLEET_NUMS then
		var_4_1.fleetType = FleetType.Submarine
	elseif var_4_0 == FleetProxy.PVP_FLEET_ID then
		var_4_1.saveLastShipFlag = true
	elseif var_4_0 == FleetProxy.CHALLENGE_FLEET_ID then
		-- block empty
	elseif var_4_0 == FleetProxy.CHALLENGE_SUB_FLEET_ID then
		var_4_1.fleetType = FleetType.Submarine
	end

	return (TypedFleet.New(var_4_1))
end

function var_0_0.addFleet(arg_5_0, arg_5_1)
	assert(isa(arg_5_1, Fleet), "should be an instance of Fleet")
	assert(arg_5_0.data[arg_5_1.id] == nil, "fleet already exist, use updateFleet() instead")

	arg_5_0.data[arg_5_1.id] = arg_5_1:clone()

	arg_5_0.data[arg_5_1.id]:display("added")
	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inFleet")
	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inPvP")
	arg_5_0.facade:sendNotification(var_0_0.FLEET_ADDED, arg_5_1:clone())
end

function var_0_0.updateFleet(arg_6_0, arg_6_1)
	assert(isa(arg_6_1, Fleet), "should be an instance of Fleet")

	if arg_6_0.data[arg_6_1.id] ~= nil then
		arg_6_0.data[arg_6_1.id] = arg_6_1:clone()

		arg_6_0.data[arg_6_1.id]:display("updated")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inFleet")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inPvP")
		arg_6_0:CommanderManualTaskProgressAdd(arg_6_1)
	elseif arg_6_0.extraFleets[arg_6_1.id] ~= nil then
		arg_6_0.extraFleets[arg_6_1.id] = arg_6_1

		arg_6_0.extraFleets[arg_6_1.id]:display("updated")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inChallenge")
	else
		assert(false, "fleet should exist")
	end

	arg_6_0.facade:sendNotification(var_0_0.FLEET_UPDATED, arg_6_1.id)
end

function var_0_0.saveEdittingFleet(arg_7_0)
	if arg_7_0.editSrcCache == nil then
		arg_7_0.editSrcCache = Clone(arg_7_0.data)
	end

	if arg_7_0.EdittingFleet ~= nil then
		arg_7_0.data[arg_7_0.EdittingFleet.id] = arg_7_0.EdittingFleet

		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inFleet")
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inPvP")
	end
end

function var_0_0.commitEdittingFleet(arg_8_0, arg_8_1)
	local var_8_0 = {}

	if arg_8_0.EdittingFleet ~= nil then
		table.insert(var_8_0, function(arg_9_0)
			arg_8_0.facade:sendNotification(GAME.UPDATE_FLEET, {
				fleet = arg_8_0.EdittingFleet,
				callback = function()
					arg_8_0.editSrcCache = nil
					arg_8_0.EdittingFleet = nil

					arg_9_0()
				end
			})
		end)
	end

	seriesAsync(var_8_0, function()
		if arg_8_1 then
			arg_8_1()
		end
	end)
end

function var_0_0.abortEditting(arg_12_0)
	if arg_12_0.editSrcCache then
		arg_12_0.data = arg_12_0.editSrcCache
		arg_12_0.editSrcCache = nil
	end

	arg_12_0.EdittingFleet = nil
end

function var_0_0.syncFleet(arg_13_0)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0.data) do
		arg_13_0.facade:sendNotification(GAME.UPDATE_FLEET, {
			fleet = iter_13_1
		})
	end
end

function var_0_0.getCount(arg_14_0)
	return table.getCount(arg_14_0.data)
end

function var_0_0.getFleetById(arg_15_0, arg_15_1)
	if arg_15_0.data[arg_15_1] ~= nil then
		return arg_15_0.data[arg_15_1]:clone()
	end

	if arg_15_0.extraFleets[arg_15_1] then
		return arg_15_0.extraFleets[arg_15_1]
	end

	return nil
end

function var_0_0.getAllShipIds(arg_16_0, arg_16_1)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in pairs(arg_16_0.data) do
		if arg_16_1 and not iter_16_1:isRegularFleet() then
			-- block empty
		else
			for iter_16_2, iter_16_3 in ipairs(iter_16_1.ships) do
				table.insert(var_16_0, iter_16_3)
			end
		end
	end

	return var_16_0
end

function var_0_0.getFirstFleetShipCount(arg_17_0)
	local var_17_0 = 0

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.data[1].ships) do
		var_17_0 = var_17_0 + 1
	end

	return var_17_0
end

function var_0_0.GetRegularFleets(arg_18_0)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in pairs(arg_18_0.data) do
		if iter_18_1:isRegularFleet() then
			var_18_0[iter_18_0] = Clone(iter_18_1)
		end
	end

	return var_18_0
end

function var_0_0.inPvPFleet(arg_19_0, arg_19_1)
	if arg_19_0.data[FleetProxy.PVP_FLEET_ID]:containShip(arg_19_1) then
		return true
	end

	return false
end

function var_0_0.GetRegularFleetByShip(arg_20_0, arg_20_1)
	assert(isa(arg_20_1, Ship), "should be an instance of Ship")

	for iter_20_0, iter_20_1 in pairs(arg_20_0.data) do
		if iter_20_1:isRegularFleet() and iter_20_1:containShip(arg_20_1) then
			return iter_20_1:clone()
		end
	end

	return nil
end

function var_0_0.renameFleet(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0:getFleetById(arg_21_1)

	assert(var_21_0 ~= nil, "fleet should exist")

	var_21_0.name = arg_21_2

	arg_21_0:updateFleet(var_21_0)
	arg_21_0.facade:sendNotification(var_0_0.FLEET_RENAMED, var_21_0:clone())
end

function var_0_0.getCommandersInFleet(arg_22_0)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in pairs(arg_22_0.data) do
		if iter_22_1:isRegularFleet() then
			for iter_22_2, iter_22_3 in pairs(iter_22_1:getCommanders()) do
				table.insert(var_22_0, iter_22_3.id)
			end
		end
	end

	return var_22_0
end

function var_0_0.getCommanders(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0.data) do
		if iter_23_1:isRegularFleet() then
			for iter_23_2, iter_23_3 in pairs(iter_23_1:getCommanders()) do
				table.insert(var_23_0, {
					fleetId = iter_23_1.id,
					pos = iter_23_2,
					commanderId = iter_23_3.id
				})
			end
		end
	end

	return var_23_0
end

function var_0_0.GetExtraCommanders(arg_24_0)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.extraFleets) do
		for iter_24_2, iter_24_3 in pairs(iter_24_1:getCommanders()) do
			table.insert(var_24_0, {
				fleetId = iter_24_1.id,
				pos = iter_24_2,
				commanderId = iter_24_3.id
			})
		end
	end

	return var_24_0
end

function var_0_0.getActivityFleets(arg_25_0)
	return arg_25_0.activityFleetData
end

function var_0_0.addActivityFleet(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_1.id

	if not arg_26_0.activityFleetData[var_26_0] then
		arg_26_0.activityFleetData[var_26_0] = {}
	end

	local var_26_1 = arg_26_0.activityFleetData[var_26_0]
	local var_26_2 = getProxy(BayProxy)
	local var_26_3
	local var_26_4
	local var_26_5 = pg.activity_template[var_26_0]

	local function var_26_6()
		if var_26_4 then
			return var_26_4
		end

		local var_27_0 = arg_26_1:GetActiveSeriesIds()
		local var_27_1 = var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB and CollabrateBossRushSeriesData or BossRushSeriesData

		var_26_4 = _.map(var_27_0, function(arg_28_0)
			return table.lastof(var_27_1.New({
				id = arg_28_0,
				actId = arg_26_1.id
			}):GetFleetIds())
		end)

		return var_26_4
	end

	for iter_26_0, iter_26_1 in ipairs(arg_26_2) do
		local var_26_7 = CreateShell(iter_26_1)

		if var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
			var_26_7.fleetType = table.contains(var_26_6(), iter_26_1.id) and FleetType.Submarine or FleetType.Normal
		elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			var_26_7.fleetType = iter_26_1.id >= Fleet.SUBMARINE_FLEET_ID and FleetType.Submarine or FleetType.Normal
		elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE then
			var_26_7.fleetType = iter_26_1.id >= Fleet.SUBMARINE_FLEET_ID and FleetType.Submarine or FleetType.Normal
		elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE then
			var_26_7.fleetType = iter_26_1.id >= Fleet.MEGA_SUBMARINE_FLEET_OFFSET and FleetType.Submarine or FleetType.Normal
		elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
			var_26_7.fleetType = table.contains(var_26_6(), iter_26_1.id) and FleetType.Submarine or FleetType.Normal
		else
			local var_26_8 = {
				id = iter_26_1.id
			}

			var_26_7.fleetType = Fleet.isSubmarineFleet(var_26_8) and FleetType.Submarine or FleetType.Normal
		end

		local var_26_9 = TypedFleet.New(var_26_7)

		var_26_1[var_26_9.id] = var_26_9

		for iter_26_2, iter_26_3 in ipairs(iter_26_1.ship_list) do
			if not var_26_2:RawGetShipById(iter_26_3) then
				var_26_3 = true

				break
			end
		end
	end

	if var_26_3 then
		arg_26_0:commitActivityFleet(var_26_0)
	end

	local var_26_10
	local var_26_11

	if var_26_5.type == ActivityConst.ACTIVITY_TYPE_CHALLENGE then
		var_26_10 = 2
		var_26_11 = 2
	elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
		var_26_10 = 0
		var_26_11 = 0
	elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
		var_26_10 = 0
		var_26_11 = 0
	elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE then
		var_26_10 = 0
		var_26_11 = 0
	elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE then
		var_26_10 = 0
		var_26_11 = 0
	elseif var_26_5.type == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
		var_26_10 = 0
		var_26_11 = 0
	end

	local var_26_12 = 0

	while var_26_12 < var_26_10 do
		var_26_12 = var_26_12 + 1

		if var_26_1[var_26_12] == nil then
			var_26_1[var_26_12] = TypedFleet.New({
				id = var_26_12,
				ship_list = {},
				fleetType = FleetType.Normal
			})
		end
	end

	local var_26_13 = 0

	while var_26_13 < var_26_11 do
		local var_26_14 = Fleet.SUBMARINE_FLEET_ID + var_26_13

		if var_26_1[var_26_14] == nil then
			var_26_1[var_26_14] = TypedFleet.New({
				id = var_26_14,
				ship_list = {},
				fleetType = FleetType.Submarine
			})
		end

		var_26_13 = var_26_13 + 1
	end

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
end

function var_0_0.updateActivityFleet(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	arg_29_0.activityFleetData[arg_29_1][arg_29_2] = arg_29_3

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
end

function var_0_0.commitActivityFleet(arg_30_0, arg_30_1)
	arg_30_0.editSrcCache = nil
	arg_30_0.EdittingFleet = nil

	arg_30_0.facade:sendNotification(GAME.EDIT_ACTIVITY_FLEET, {
		actID = arg_30_1,
		fleets = arg_30_0.activityFleetData[arg_30_1]
	})
end

function var_0_0.checkActivityFleet(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0.activityFleetData[arg_31_1]

	for iter_31_0, iter_31_1 in pairs(var_31_0) do
		if iter_31_0 < Fleet.SUBMARINE_FLEET_ID and iter_31_1:isLegalToFight() == true then
			return true
		end
	end

	return false
end

function var_0_0.removeActivityFleetCommander(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.activityFleetData) do
		for iter_32_2, iter_32_3 in pairs(iter_32_1) do
			local var_32_0 = false
			local var_32_1 = iter_32_3:GetRawCommanderIds()

			for iter_32_4, iter_32_5 in pairs(var_32_1) do
				if arg_32_1 == iter_32_5 then
					iter_32_3:updateCommanderByPos(iter_32_4, nil)
					iter_32_3:updateCommanderSkills()
					arg_32_0:updateActivityFleet(iter_32_0, iter_32_2, iter_32_3)
					arg_32_0:commitActivityFleet(iter_32_0)

					var_32_0 = true

					break
				end
			end

			if var_32_0 then
				break
			end
		end
	end
end

function var_0_0.recommendActivityFleet(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_0:getActivityFleets()[arg_33_1][arg_33_2]
	local var_33_1 = getProxy(BayProxy)

	local function var_33_2(arg_34_0, arg_34_1)
		local var_34_0 = var_33_1:getActivityRecommendShips(arg_34_0, var_33_0.ships, arg_34_1, arg_33_1)

		for iter_34_0, iter_34_1 in ipairs(var_34_0) do
			var_33_0:insertShip(iter_34_1, nil, teamType)
		end
	end

	local function var_33_3(arg_35_0)
		local var_35_0 = TeamType.VanguardMax - #arg_35_0.vanguardShips
		local var_35_1 = TeamType.MainMax - #arg_35_0.mainShips

		if var_35_0 > 0 then
			var_33_2(ShipType.VanguardShipType, var_35_0)
		end

		if var_35_1 > 0 then
			var_33_2(ShipType.MainShipType, var_35_1)
		end
	end

	local function var_33_4(arg_36_0)
		if not arg_36_0:isFull() then
			var_33_2(ShipType.SubShipType, TeamType.SubmarineMax - #arg_36_0.subShips)
		end
	end

	if getProxy(ActivityProxy):getActivityById(arg_33_1):getConfig("type") == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE then
		if arg_33_2 >= Fleet.MEGA_SUBMARINE_FLEET_OFFSET then
			var_33_4(var_33_0)
		else
			var_33_3(var_33_0)
		end
	elseif arg_33_2 >= Fleet.SUBMARINE_FLEET_ID then
		var_33_4(var_33_0)
	else
		var_33_3(var_33_0)
	end

	arg_33_0:updateActivityFleet(arg_33_1, arg_33_2, var_33_0)
end

function var_0_0.GetBossRushFleets(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = {}
	local var_37_1 = arg_37_0:getActivityFleets()[arg_37_1]

	table.Foreach(arg_37_2, function(arg_38_0, arg_38_1)
		local var_38_0 = arg_38_0 == #arg_37_2

		if not var_37_1[arg_38_1] then
			local var_38_1 = var_38_0 and FleetType.Submarine or FleetType.Normal

			var_37_1[arg_38_1] = TypedFleet.New({
				id = arg_38_1,
				ship_list = {},
				fleetType = var_38_1
			})
		end

		local var_38_2 = var_37_1[arg_38_1]

		var_38_2:RemoveUnusedItems()

		var_37_0[arg_38_0] = var_38_2
	end)

	return var_37_0
end

function var_0_0.CommanderManualTaskProgressAdd(arg_39_0, arg_39_1)
	local var_39_0 = getProxy(CommanderManualProxy)
	local var_39_1 = arg_39_1:isLegalToFight()

	if var_39_1 == true and #arg_39_1.vanguardShips >= TeamType.VanguardMax then
		var_39_0:TaskProgressAdd(2013, 1)

		local var_39_2 = {
			ShipType.QuZhu,
			ShipType.QingXun,
			ShipType.ZhongXun
		}

		for iter_39_0, iter_39_1 in ipairs(arg_39_1.vanguardShips) do
			local var_39_3 = getProxy(BayProxy):getShipById(iter_39_1):getConfig("type")

			if table.contains(var_39_2, var_39_3) then
				table.removebyvalue(var_39_2, var_39_3)
			end
		end

		if #var_39_2 == 0 then
			var_39_0:TaskProgressAdd(2014, 1)
		end
	end

	if var_39_1 == true and #arg_39_1.mainShips >= TeamType.MainMax then
		var_39_0:TaskProgressAdd(2015, 1)

		local var_39_4 = {
			ShipType.ZhengHang,
			ShipType.ZhanLie,
			ShipType.ZhanLie
		}

		for iter_39_2, iter_39_3 in ipairs(arg_39_1.mainShips) do
			local var_39_5 = getProxy(BayProxy):getShipById(iter_39_3):getConfig("type")

			if table.contains(var_39_4, var_39_5) then
				table.removebyvalue(var_39_4, var_39_5)
			end
		end

		if #var_39_4 == 0 then
			var_39_0:TaskProgressAdd(2016, 1)
		end
	end

	if var_39_1 == true and arg_39_1:GetGearScoreSum() > 1000 then
		var_39_0:TaskProgressAdd(2017, 1)
	end

	if var_39_1 == true and arg_39_1:getFleetType() == FleetType.Submarine then
		var_39_0:TaskProgressAdd(2018, 1)
	end

	if var_39_1 == true and not arg_39_1:isFirstFleet() and not arg_39_1:isSubmarineFleet() then
		var_39_0:TaskProgressAdd(2019, 1)
	end
end

return var_0_0
