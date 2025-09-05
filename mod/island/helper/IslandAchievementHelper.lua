local var_0_0 = class("IslandAchievementHelper")

function var_0_0.GetRuntimeData(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(IslandProxy):GetIsland()
	local var_1_1 = var_1_0:GetCharacterAgency()

	return switch(arg_1_0, {
		[IslandAchievementType.ISLAND_LV] = function()
			return var_1_0:GetLevel()
		end,
		[IslandAchievementType.FINISH_MAIN_TASK] = function()
			return var_1_0:GetTaskAgency():IsFinishTask(arg_1_1) and 1 or 0
		end,
		[IslandAchievementType.SHIP_LV] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_5_0, arg_5_1)
				return arg_5_0 + (arg_5_1:GetLevel() >= arg_1_1 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_SKILL_LV] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_7_0, arg_7_1)
				local var_7_0 = arg_7_1:GetSkill()

				return arg_7_0 + (var_7_0:IsUnlock() and var_7_0:GetLevel() <= arg_1_1 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_ATTR_LV_1] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_9_0, arg_9_1)
				return arg_9_0 + (arg_9_1:GetAttrGradeCnt(arg_1_1) >= 1 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_ATTR_LV_2] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_11_0, arg_11_1)
				return arg_11_0 + (arg_11_1:GetAttrGradeCnt(arg_1_1) >= 2 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_ATTR_LV_3] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_13_0, arg_13_1)
				return arg_13_0 + (arg_13_1:GetAttrGradeCnt(arg_1_1) >= 3 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_ATTR_LV_4] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_15_0, arg_15_1)
				return arg_15_0 + (arg_15_1:GetAttrGradeCnt(arg_1_1) >= 4 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_ATTR_LV_5] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_17_0, arg_17_1)
				return arg_17_0 + (arg_17_1:GetAttrGradeCnt(arg_1_1) >= 5 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_ATTR_LV_6] = function()
			return underscore.reduce(var_1_1:GetShips(), 0, function(arg_19_0, arg_19_1)
				return arg_19_0 + (arg_19_1:GetAttrGradeCnt(arg_1_1) >= 6 and 1 or 0)
			end)
		end,
		[IslandAchievementType.SHIP_SKIN] = function()
			return var_1_1:GetAllSkinCnt()
		end,
		[IslandAchievementType.SHIP_DRESS_TYPE] = function()
			return var_1_1:GetDiffDressCntByType(arg_1_1)
		end,
		[IslandAchievementType.COMMANDER_DRESS_TYPE] = function()
			return #var_1_0:GetDressUpAgency():GetHasDressByType(arg_1_1)
		end,
		[IslandAchievementType.SEASON_RANK] = function()
			return var_1_0:GetSeasonAgency():GetHighestRank() <= arg_1_1 and 1 or 0
		end,
		[IslandAchievementType.SEASON_NUM] = function()
			return var_1_0:GetSeasonAgency():GetSeasonNum()
		end,
		[IslandAchievementType.FINISH_TECH] = function()
			return var_1_0:GetTechnologyAgency():GetAllTypeFinishCnt()
		end,
		[IslandAchievementType.FINISH_TYPE_TECH] = function()
			return var_1_0:GetTechnologyAgency():GetFinishCntByType(arg_1_1)
		end,
		[IslandAchievementType.RESTAURANT_SALES] = function()
			local var_27_0 = var_1_0:GetManageAgency():GetRestaurant(arg_1_1)

			return var_27_0 and var_27_0:GetSales() or 0
		end,
		[IslandAchievementType.FURNITURE] = function()
			return arg_1_1 == 0 and #var_1_0:GetAgoraAgency():GetFurnitures() or #var_1_0:GetAgoraAgency():GetFurnituresByType(arg_1_1)
		end
	}, function()
		assert(false, "not exist runtime achv type: " .. arg_1_0)
	end)
end

function var_0_0.UpdateRecord(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	if var_30_0:CheckRecordExist(arg_30_0, arg_30_1) then
		var_30_0:UpdateRecord(arg_30_0, arg_30_1, arg_30_2)
	end
end

function var_0_0.UpdateRecordWithAdd(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	if var_31_0:CheckRecordExist(arg_31_0, arg_31_1) then
		var_31_0:UpdateRecordWithAdd(arg_31_0, arg_31_1, arg_31_2)
	end
end

function var_0_0.OnShipUpgrade(arg_32_0, arg_32_1)
	local var_32_0 = IslandAchievementType.SHIP_LV
	local var_32_1 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()
	local var_32_2 = var_32_1:GetRecordsByType(var_32_0)

	for iter_32_0, iter_32_1 in pairs(var_32_2) do
		if arg_32_0 < iter_32_0 and iter_32_0 <= arg_32_1 then
			var_32_1:UpdateRecord(var_32_0, iter_32_0, iter_32_1 + 1)
		end
	end
end

function var_0_0.OnShipSkillUpgrade(arg_33_0)
	local var_33_0 = IslandAchievementType.SHIP_SKILL_LV
	local var_33_1 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()
	local var_33_2 = var_33_1:GetRecordsByType(var_33_0)

	for iter_33_0, iter_33_1 in pairs(var_33_2) do
		if iter_33_0 <= arg_33_0 then
			var_33_1:UpdateRecord(var_33_0, iter_33_0, iter_33_1 + 1)
		end
	end
end

function var_0_0.CheckAttrUpgrade(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in pairs(arg_34_1:GetAttrs()) do
		if arg_34_1:GetAttrGrade(iter_34_0) ~= arg_34_0:GetAttrGrade(iter_34_0) then
			return true
		end
	end

	return false
end

function var_0_0.OnShipAttrUpgrade(arg_35_0, arg_35_1)
	local var_35_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	if var_0_0.CheckAttrUpgrade(arg_35_0, arg_35_1) then
		for iter_35_0, iter_35_1 in ipairs(IslandAchievementType.GetAttrTypes()) do
			local var_35_1 = var_35_0:GetRecordsByType(iter_35_1)

			for iter_35_2, iter_35_3 in pairs(var_35_1) do
				var_35_0:UpdateRecord(iter_35_1, iter_35_2, var_0_0.GetRuntimeData(iter_35_1, iter_35_2))
			end
		end
	end
end

function var_0_0.OnSeasonReset(arg_36_0)
	local var_36_0 = IslandAchievementType.SEASON_RANK
	local var_36_1 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()
	local var_36_2 = var_36_1:GetRecordsByType(var_36_0)

	for iter_36_0, iter_36_1 in pairs(var_36_2) do
		if arg_36_0 <= iter_36_0 then
			var_36_1:UpdateRecord(var_36_0, iter_36_0, 1)
		end
	end
end

function var_0_0.OnFinishTechnolog(arg_37_0)
	local var_37_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	var_37_0:UpdateRecordWithAdd(IslandAchievementType.FINISH_TECH, 0, 1)

	local var_37_1 = pg.island_technology_template[arg_37_0].tech_belong

	var_37_0:UpdateRecordWithAdd(IslandAchievementType.FINISH_TYPE_TECH, var_37_1, 1)
end

function var_0_0.OnNpcInteract(arg_38_0)
	local var_38_0 = IslandAchievementType.NPC_INTERACT

	if getProxy(IslandProxy):GetIsland():GetAchievementAgency():CheckRecordExist(var_38_0, arg_38_0) then
		pg.m02:sendNotification(GAME.ISLAND_UPDATE_ACHV, {
			records = {
				{
					value = 1,
					event_type = var_38_0,
					event_arg = arg_38_0
				}
			}
		})
	end
end

return var_0_0
