pg = pg or {}

local var_0_0 = pg

var_0_0.ShipFlagMgr = singletonClass("ShipFlagMgr")

local var_0_1 = var_0_0.ShipFlagMgr

function var_0_1.Init(arg_1_0, arg_1_1)
	arg_1_0.flagDic = {}
	arg_1_0.extraInfo = {}

	for iter_1_0, iter_1_1 in ipairs(ShipStatus.flagList) do
		arg_1_0.flagDic[iter_1_1] = {}
	end

	print("initializing ShipFlagMgr manager...")
	arg_1_1()
end

local var_0_2 = {
	inChapter = function()
		local var_2_0 = getProxy(ChapterProxy):getActiveChapter()

		return var_2_0 and _.map(var_2_0:getShips(), function(arg_3_0)
			return arg_3_0.id
		end) or {}
	end,
	inFleet = function()
		return getProxy(FleetProxy):getAllShipIds(true)
	end,
	inElite = function()
		local var_5_0 = {}
		local var_5_1 = getProxy(ChapterProxy)
		local var_5_2 = getProxy(ActivityProxy)

		if var_5_1.mapEliteFleetCache then
			for iter_5_0, iter_5_1 in pairs(var_5_1.mapEliteFleetCache) do
				assert(var_0_0.expedition_data_by_map[iter_5_0], "Missing Map Config " .. (iter_5_0 or "NIL"))

				local var_5_3 = var_0_0.expedition_data_by_map[iter_5_0].on_activity

				if var_5_3 == 0 or checkExist(var_5_2:getActivityById(var_5_3), {
					"isEnd"
				}) == false then
					var_5_0[iter_5_0] = _.flatten(iter_5_1)
				end
			end
		end

		return _.flatten(_.values(var_5_0)), var_5_0
	end,
	inSupport = function()
		local var_6_0 = {}
		local var_6_1 = getProxy(ChapterProxy)

		if var_6_1.mapSupportFleetCache then
			for iter_6_0, iter_6_1 in pairs(var_6_1.mapSupportFleetCache) do
				assert(var_0_0.expedition_data_by_map[iter_6_0], "Missing Map Config " .. (iter_6_0 or "NIL"))

				var_6_0[iter_6_0] = _.flatten(iter_6_1)
			end
		end

		return _.flatten(_.values(var_6_0)), var_6_0
	end,
	inActivity = function()
		local var_7_0 = {}
		local var_7_1 = getProxy(FleetProxy)

		for iter_7_0, iter_7_1 in pairs(var_7_1:getActivityFleets()) do
			var_7_0[iter_7_0] = _.flatten(_.map(_.values(iter_7_1), function(arg_8_0)
				return arg_8_0.ships
			end))
		end

		return _.flatten(_.values(var_7_0)), var_7_0
	end,
	inPvP = function()
		local var_9_0 = getProxy(FleetProxy):getFleetById(FleetProxy.PVP_FLEET_ID)

		return var_9_0 and var_9_0:getShipIds() or {}
	end,
	inChallenge = function()
		local var_10_0 = getProxy(FleetProxy)
		local var_10_1 = var_10_0:getFleetById(FleetProxy.CHALLENGE_FLEET_ID)
		local var_10_2 = var_10_0:getFleetById(FleetProxy.CHALLENGE_SUB_FLEET_ID)
		local var_10_3 = var_10_1:getShipIds()

		table.insertto(var_10_3, var_10_2:getShipIds())

		return var_10_3
	end,
	inExercise = function()
		return getProxy(MilitaryExerciseProxy):getExerciseFleet():getShipIds()
	end,
	inEvent = function()
		return getProxy(EventProxy):getActiveShipIds()
	end,
	inClass = function()
		return getProxy(NavalAcademyProxy):GetShipIDs()
	end,
	inTactics = function()
		local var_14_0 = getProxy(NavalAcademyProxy):getStudents()

		return _.map(underscore.values(var_14_0), function(arg_15_0)
			return arg_15_0 and arg_15_0.shipId
		end)
	end,
	inBackyard = function()
		return getProxy(DormProxy):getRawData().shipIds
	end,
	inAdmiral = function()
		return getProxy(PlayerProxy):getRawData().characters
	end,
	inWorld = function()
		local var_18_0 = nowWorld()

		if var_18_0.type == World.TypeBase then
			return underscore.rest(var_18_0.baseShipIds, 1)
		else
			return _.map(var_18_0:GetShips(), function(arg_19_0)
				return arg_19_0.id
			end)
		end
	end,
	isActivityNpc = function()
		return getProxy(BayProxy).activityNPCShipIds
	end,
	inGuildEvent = function()
		local var_21_0 = getProxy(GuildProxy):getRawData()

		if var_21_0 then
			return var_21_0:GetMissionAndAssultFleetShips()
		else
			return {}
		end
	end,
	inGuildBossEvent = function()
		local var_22_0 = getProxy(GuildProxy):getRawData()

		if var_22_0 then
			return var_22_0:GetBossMissionShips()
		else
			return {}
		end
	end
}

function var_0_1.MarkShipsFlag(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	for iter_23_0, iter_23_1 in ipairs(arg_23_2) do
		arg_23_0.flagDic[arg_23_1][iter_23_1] = true
	end

	if arg_23_3 then
		arg_23_0.extraInfo[arg_23_1] = arg_23_3
	end
end

function var_0_1.GetShipFlag(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	arg_24_3 = defaultValue(arg_24_3, true)

	if type(arg_24_3) == "boolean" then
		return arg_24_0.flagDic[arg_24_2][arg_24_1] == arg_24_3
	elseif type(arg_24_3) == "number" then
		if arg_24_2 == "inElite" then
			local var_24_0 = arg_24_0.extraInfo[arg_24_2][arg_24_3] or {}

			return _.any(var_24_0, function(arg_25_0)
				return arg_25_0 == arg_24_1
			end)
		elseif arg_24_2 == "inActivity" then
			local var_24_1 = arg_24_0.extraInfo[arg_24_2][arg_24_3] or {}

			return _.any(var_24_1, function(arg_26_0)
				return arg_26_0 == arg_24_1
			end)
		elseif arg_24_2 == "inSupport" then
			local var_24_2 = arg_24_0.extraInfo[arg_24_2][arg_24_3] or {}

			return _.any(var_24_2, function(arg_27_0)
				return arg_27_0 == arg_24_1
			end)
		else
			assert(false, "flagName:" .. arg_24_2 .. " type error")
		end
	else
		assert(false, "info type error")
	end
end

function var_0_1.FilterShips(arg_28_0, arg_28_1, arg_28_2)
	arg_28_2 = arg_28_2 or underscore.keys(getProxy(BayProxy):getRawData())

	local var_28_0 = {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_2) do
		for iter_28_2, iter_28_3 in pairs(arg_28_1) do
			if iter_28_3 and arg_28_0:GetShipFlag(iter_28_1, iter_28_2, iter_28_3) then
				var_28_0[iter_28_1] = true

				break
			end
		end
	end

	return _.keys(var_28_0)
end

function var_0_1.UpdateFlagShips(arg_29_0, arg_29_1)
	arg_29_0.flagDic[arg_29_1] = {}

	arg_29_0:MarkShipsFlag(arg_29_1, var_0_2[arg_29_1]())
end

function var_0_1.ClearShipsFlag(arg_30_0, arg_30_1)
	arg_30_0.flagDic[arg_30_1] = {}
end

function var_0_1.DebugPrint(arg_31_0, arg_31_1)
	warning("id:" .. arg_31_1 .. " flags:")

	for iter_31_0, iter_31_1 in ipairs(ShipStatus.flagList) do
		if arg_31_0.flagDic[iter_31_1][arg_31_1] then
			warning(iter_31_1)
		end
	end
end

return var_0_1
