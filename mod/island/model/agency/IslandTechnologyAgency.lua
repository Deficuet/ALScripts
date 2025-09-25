local var_0_0 = class("IslandTechnologyAgency", import(".IslandBaseAgency"))

var_0_0.PLACE_ID = 702

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.tech.finish_list
	local var_1_1 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.tech.repeat_finish_list) do
		var_1_1[iter_1_1.id] = iter_1_1.num
	end

	arg_1_0.techData = {}
	arg_1_0.formula2Id = {}

	for iter_1_2, iter_1_3 in ipairs(pg.island_technology_template.all) do
		local var_1_2 = IslandTechnology.New(iter_1_3)

		if var_1_2:IsOnceType() then
			var_1_2:SetFinishedCnt(table.contains(var_1_0, iter_1_3) and 1 or 0)
		else
			var_1_2:SetFinishedCnt(var_1_1[iter_1_3] or 0)
		end

		arg_1_0.techData[var_1_2.id] = var_1_2
		arg_1_0.formula2Id[var_1_2:GetFormulaId()] = var_1_2.id
	end
end

function var_0_0.InitLockData(arg_2_0)
	arg_2_0.lockIds = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.techData) do
		if not iter_2_1:IsUnlock() then
			table.insert(arg_2_0.lockIds, iter_2_1.id)
		end
	end
end

function var_0_0.GetTechnology(arg_3_0, arg_3_1)
	return arg_3_0.techData[arg_3_1]
end

function var_0_0.GetTechnologys(arg_4_0)
	return arg_4_0.techData
end

function var_0_0.GetTechnologyByFormulaId(arg_5_0, arg_5_1)
	return arg_5_0.techData[arg_5_0.formula2Id[arg_5_1]]
end

function var_0_0.AddFinishCntByFormulatId(arg_6_0, arg_6_1)
	arg_6_0:GetTechnologyByFormulaId(arg_6_1):AddFinishedCnt()
end

function var_0_0.GetAutoFinishList(arg_7_0)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(arg_7_0.techData) do
		if iter_7_1:CheckFinishImmd() then
			table.insert(var_7_0, iter_7_1.id)
		end
	end

	return var_7_0
end

function var_0_0.IsUnlockTech(arg_8_0, arg_8_1)
	return arg_8_0.techData[arg_8_1]:IsUnlock()
end

function var_0_0.IsFinishedTech(arg_9_0, arg_9_1)
	if not arg_9_0.techData[arg_9_1] then
		return false
	end

	return arg_9_0.techData[arg_9_1]:GetFinishedCnt() > 0
end

function var_0_0.GetPctByType(arg_10_0, arg_10_1)
	local var_10_0 = pg.island_technology_template.get_id_list_by_tech_belong[arg_10_1]

	return math.floor(arg_10_0:GetFinishCntByType(arg_10_1) / #var_10_0 * 100)
end

function var_0_0.GetFinishCntByType(arg_11_0, arg_11_1)
	local var_11_0 = pg.island_technology_template.get_id_list_by_tech_belong[arg_11_1]

	return underscore.reduce(var_11_0, 0, function(arg_12_0, arg_12_1)
		return arg_12_0 + (arg_11_0:IsFinishedTech(arg_12_1) and 1 or 0)
	end)
end

function var_0_0.GetAllTypeFinishCnt(arg_13_0)
	return underscore.reduce(pg.island_technology_template.all, 0, function(arg_14_0, arg_14_1)
		return arg_14_0 + (arg_13_0:IsFinishedTech(arg_14_1) and 1 or 0)
	end)
end

function var_0_0.GetEmptySlotId(arg_15_0)
	local var_15_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_0_0.PLACE_ID)

	for iter_15_0, iter_15_1 in ipairs(var_0_0.GetSlotIds()) do
		local var_15_1 = var_15_0:GetDelegationSlotData(iter_15_1)

		if var_15_1 and var_15_1:CanStartDelegation() then
			return iter_15_1
		end
	end

	return nil
end

function var_0_0.RemoveLockId(arg_16_0, arg_16_1)
	table.removebyvalue(arg_16_0.lockIds, arg_16_1)
end

function var_0_0.TryAutoUnlock(arg_17_0, arg_17_1)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.lockIds) do
		if arg_17_0.techData[iter_17_1]:CanUnlock() then
			table.insert(var_17_0, function(arg_18_0)
				pg.m02:sendNotification(GAME.ISLAND_UNLOCK_TECH, {
					techId = iter_17_1,
					callback = arg_18_0
				})
			end)
		end
	end

	seriesAsync(var_17_0, function()
		existCall(arg_17_1)
	end)
end

function var_0_0.IsTip(arg_20_0)
	local var_20_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_0_0.PLACE_ID)
	local var_20_1 = var_0_0.GetSlotIds()

	for iter_20_0, iter_20_1 in ipairs(var_20_1) do
		local var_20_2 = var_20_0:GetDelegationSlotData(iter_20_1)

		if var_20_2 and var_20_2:GetSlotRewardData() then
			return true
		end
	end

	return false
end

function var_0_0.GetSlotIds()
	return pg.island_production_slot.get_id_list_by_place[var_0_0.PLACE_ID]
end

return var_0_0
