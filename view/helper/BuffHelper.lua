local var_0_0 = class("BuffHelper")

local function var_0_1(arg_1_0, arg_1_1)
	if arg_1_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUFF then
		if arg_1_1 and not arg_1_1:isEnd() then
			local var_1_0 = arg_1_1:getConfig("config_id")
			local var_1_1 = {}

			if var_1_0 == 0 then
				var_1_1 = arg_1_1:getConfig("config_data")
			else
				table.insert(var_1_1, var_1_0)
			end

			for iter_1_0, iter_1_1 in ipairs(var_1_1) do
				local var_1_2 = ActivityBuff.New(arg_1_1.id, iter_1_1)

				if var_1_2:isActivate() then
					table.insert(arg_1_0, var_1_2)
				end
			end
		end
	elseif arg_1_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF or arg_1_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2 then
		if arg_1_1 and not arg_1_1:isEnd() then
			local var_1_3 = arg_1_1:GetBuildingIds()

			for iter_1_2, iter_1_3 in pairs(var_1_3) do
				local var_1_4 = pg.activity_event_building[iter_1_3]

				if var_1_4 then
					_.each(var_1_4.buff, function(arg_2_0)
						local var_2_0 = ActivityBuff.New(arg_1_1.id, arg_2_0)

						if var_2_0:isActivate() then
							table.insert(arg_1_0, var_2_0)
						end
					end)
				end
			end

			if arg_1_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2 then
				local var_1_5 = arg_1_1:GetSceneBuildingId()

				if var_1_5 > 0 then
					local var_1_6 = pg.activity_event_building[var_1_5]

					if var_1_6 then
						_.each(var_1_6.buff, function(arg_3_0)
							local var_3_0 = ActivityBuff.New(arg_1_1.id, arg_3_0)

							if var_3_0:isActivate() then
								table.insert(arg_1_0, var_3_0)
							end
						end)
					end
				end
			end
		end
	elseif arg_1_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		if arg_1_1 then
			local var_1_7 = ActivityPtData.New(arg_1_1)

			if not arg_1_1:isEnd() and var_1_7:isInBuffTime() then
				local var_1_8 = arg_1_1.data3_list

				for iter_1_4, iter_1_5 in pairs(var_1_8) do
					table.insert(arg_1_0, ActivityBuff.New(arg_1_1.id, iter_1_5))
				end
			end
		end
	elseif arg_1_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_ATELIER_LINK and arg_1_1 then
		local var_1_9 = arg_1_1:GetSlots()

		for iter_1_6, iter_1_7 in ipairs(var_1_9) do
			local var_1_10 = iter_1_7[1]
			local var_1_11 = iter_1_7[2]

			if var_1_10 > 0 and var_1_11 > 0 then
				table.insert(arg_1_0, ActivityBuff.New(arg_1_1.id, AtelierMaterial.New({
					configId = var_1_10
				}):GetBuffs()[var_1_11]))
			end
		end
	end

	table.insertto(arg_1_0, arg_1_1:GetBuffList())
end

function var_0_0.GetAllBuff()
	local var_4_0 = {}
	local var_4_1 = getProxy(PlayerProxy):getRawData()

	for iter_4_0, iter_4_1 in ipairs(var_4_1:GetBuffs()) do
		table.insert(var_4_0, CommonBuff.New(iter_4_1))
	end

	local var_4_2 = getProxy(ActivityProxy):getRawData()

	for iter_4_2, iter_4_3 in pairs(var_4_2) do
		var_0_1(var_4_0, iter_4_3)
	end

	return var_4_0
end

function var_0_0.GetBackYardExpBuffs()
	local var_5_0 = {}
	local var_5_1 = var_0_0.GetAllBuff()

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		if iter_5_1:BackYardExpUsage() then
			table.insert(var_5_0, iter_5_1)
		end
	end

	return var_5_0
end

function var_0_0.GetBackYardEnergyBuffs()
	local var_6_0 = {}
	local var_6_1 = var_0_0.GetAllBuff()

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		if iter_6_1:BackyardEnergyUsage() then
			table.insert(var_6_0, iter_6_1)
		end
	end

	return var_6_0
end

function var_0_0.GetShipModExpBuff()
	local var_7_0 = {}
	local var_7_1 = var_0_0.GetAllBuff()

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		if iter_7_1:ShipModExpUsage() then
			table.insert(var_7_0, iter_7_1)
		end
	end

	return var_7_0
end

function var_0_0.GetBackYardPlayerBuffs()
	local var_8_0 = {}
	local var_8_1 = getProxy(PlayerProxy):getRawData()

	for iter_8_0, iter_8_1 in ipairs(var_8_1:GetBuffs()) do
		local var_8_2 = CommonBuff.New(iter_8_1)

		if var_8_2:BackYardExpUsage() then
			table.insert(var_8_0, var_8_2)
		end
	end

	return var_8_0
end

function var_0_0.GetBattleBuffs(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = var_0_0.GetAllBuff()

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		if iter_9_1:BattleUsage() then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return var_9_0
end

function var_0_0.GetBuffsByActivityType(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = getProxy(ActivityProxy):getActivitiesByType(arg_10_0)

	_.each(var_10_1, function(arg_11_0)
		var_0_1(var_10_0, arg_11_0)
	end)

	return var_10_0
end

function var_0_0.GetBuffsForMainUI()
	local var_12_0 = getProxy(ActivityProxy)
	local var_12_1 = var_0_0.GetBuffsByActivityType(ActivityConst.ACTIVITY_TYPE_BUFF)

	for iter_12_0 = #var_12_1, 1, -1 do
		if not var_12_1[iter_12_0]:checkShow() then
			table.remove(var_12_1, iter_12_0)
		end
	end

	local var_12_2 = var_12_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)

	if var_12_2 and not var_12_2:isEnd() then
		local var_12_3 = var_12_2:getConfig("config_client").bufflist
		local var_12_4 = getProxy(PlayerProxy):getRawData()

		for iter_12_1, iter_12_2 in pairs(var_12_4.buff_list) do
			if pg.TimeMgr:GetInstance():GetServerTime() < iter_12_2.timestamp and table.contains(var_12_3, iter_12_2.id) then
				local var_12_5 = ActivityBuff.New(var_12_2.id, iter_12_2.id, iter_12_2.timestamp)

				if var_12_5:checkShow() then
					table.insert(var_12_1, var_12_5)
				end
			end
		end
	end

	local var_12_6 = getProxy(MiniGameProxy):GetMiniGameDataByType(MiniGameConst.MG_TYPE_3)

	if var_12_6 then
		local var_12_7 = getProxy(PlayerProxy):getRawData()
		local var_12_8 = var_12_6:getConfig("config_data")[2]
		local var_12_9

		for iter_12_3, iter_12_4 in ipairs(var_12_7.buff_list) do
			if table.indexof(var_12_8, iter_12_4.id, 1) then
				if pg.TimeMgr.GetInstance():GetServerTime() < iter_12_4.timestamp then
					local var_12_10 = var_12_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)
					local var_12_11 = ActivityBuff.New(var_12_10.id, iter_12_4.id, iter_12_4.timestamp)

					if var_12_11:checkShow() then
						table.insert(var_12_1, var_12_11)
					end
				end

				break
			end
		end
	end

	local var_12_12 = getProxy(MiniGameProxy):GetMiniGameDataByType(MiniGameConst.MG_TYPE_5)

	if var_12_12 then
		local var_12_13 = getProxy(PlayerProxy):getRawData()
		local var_12_14 = var_12_12:getConfig("config_data")[2]
		local var_12_15

		for iter_12_5, iter_12_6 in ipairs(var_12_13.buff_list) do
			if table.indexof(var_12_14, iter_12_6.id, 1) then
				if pg.TimeMgr.GetInstance():GetServerTime() < iter_12_6.timestamp then
					local var_12_16 = var_12_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)
					local var_12_17 = ActivityBuff.New(var_12_16.id, iter_12_6.id, iter_12_6.timestamp)

					if var_12_17:checkShow() then
						table.insert(var_12_1, var_12_17)
					end
				end

				break
			end
		end
	end

	return var_12_1
end

return var_0_0
