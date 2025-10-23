local var_0_0 = class("IslandDropHelper")

function var_0_0.AddItems(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.drop_list or {}
	local var_1_1 = {}
	local var_1_2 = {}
	local var_1_3 = {}
	local var_1_4 = {}
	local var_1_5 = {}
	local var_1_6 = {}
	local var_1_7 = {}
	local var_1_8 = {}
	local var_1_9 = {}
	local var_1_10 = {}
	local var_1_11 = {}
	local var_1_12 = {}
	local var_1_13 = {}
	local var_1_14 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		if iter_1_1.type == DROP_TYPE_ISLAND_ITEM then
			table.insert(var_1_1, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_OVERFLOWITEM then
			table.insert(var_1_2, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_ABILITY then
			table.insert(var_1_3, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_INVITATION then
			table.insert(var_1_5, iter_1_1)
		elseif iter_1_1.type == VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT then
			if iter_1_1.count > 0 then
				table.insert(var_1_14, iter_1_1)
			end
		elseif iter_1_1.type == DROP_TYPE_ISLAND_FURNITURE then
			table.insert(var_1_6, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_DRESS then
			table.insert(var_1_7, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_SKIN then
			table.insert(var_1_8, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_ACTION then
			table.insert(var_1_9, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_CARD_DIY then
			table.insert(var_1_10, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_SPEEDUP_TICKET then
			table.insert(var_1_11, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_TIMESTAMP then
			table.insert(var_1_12, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_COLLECTION then
			table.insert(var_1_13, iter_1_1)
		else
			table.insert(var_1_4, iter_1_1)
		end
	end

	local var_1_15 = var_0_0.GetIslandTimestamps(var_1_12)
	local var_1_16 = var_0_0.AddIslandItems(var_1_1)
	local var_1_17 = var_0_0.AddIslandOverFlowItems(var_1_2)
	local var_1_18 = var_0_0.AddIslandAbility(var_1_3)
	local var_1_19 = var_0_0.AddPlayerItems(var_1_4)
	local var_1_20 = var_0_0.AddShipInvitations(var_1_5)
	local var_1_21 = var_0_0.AddVirtualDrops(var_1_14)
	local var_1_22 = var_0_0.AddIslandFurnitureDrops(var_1_6)
	local var_1_23 = var_0_0.AddIslandDressDrops(var_1_7)
	local var_1_24 = var_0_0.AddIslandSkinDrops(var_1_8)
	local var_1_25 = var_0_0.AddIslandActionDrops(var_1_9)
	local var_1_26 = var_0_0.AddIslandCardDiyDrops(var_1_10)
	local var_1_27 = var_0_0.AddIslandTicketDrops(var_1_11, var_1_15)
	local var_1_28 = var_0_0.AddIslandCollectDrops(var_1_13)

	if #var_1_20 > 0 then
		for iter_1_2, iter_1_3 in ipairs(var_1_20) do
			table.insert(var_1_16, iter_1_3)
		end
	end

	if #var_1_21 > 0 then
		for iter_1_4, iter_1_5 in ipairs(var_1_21) do
			table.insert(var_1_16, iter_1_5)
		end
	end

	if #var_1_22 > 0 then
		for iter_1_6, iter_1_7 in ipairs(var_1_22) do
			table.insert(var_1_16, iter_1_7)
		end
	end

	if #var_1_23 > 0 then
		for iter_1_8, iter_1_9 in ipairs(var_1_23) do
			table.insert(var_1_16, iter_1_9)
		end
	end

	if #var_1_24 > 0 then
		for iter_1_10, iter_1_11 in ipairs(var_1_24) do
			table.insert(var_1_16, iter_1_11)
		end
	end

	if #var_1_25 > 0 then
		for iter_1_12, iter_1_13 in ipairs(var_1_25) do
			table.insert(var_1_16, iter_1_13)
		end
	end

	if #var_1_26 > 0 then
		for iter_1_14, iter_1_15 in ipairs(var_1_26) do
			table.insert(var_1_16, iter_1_15)
		end
	end

	if #var_1_27 > 0 then
		for iter_1_16, iter_1_17 in ipairs(var_1_27) do
			table.insert(var_1_16, iter_1_17)
		end
	end

	if #var_1_28 > 0 then
		for iter_1_18, iter_1_19 in ipairs(var_1_28) do
			table.insert(var_1_16, iter_1_19)
		end
	end

	if arg_1_1 and arg_1_1 > 0 then
		var_0_0.AddIslandExp(arg_1_1)
	end

	return {
		awards = var_1_16,
		overflowAwards = var_1_17,
		abilitys = var_1_18,
		exp = arg_1_1,
		drops = var_1_19
	}
end

function var_0_0.GetIslandTimestamps(arg_2_0)
	local var_2_0 = pg.island_drop_time_set
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		local var_2_2 = var_2_0[iter_2_1.id]
		local var_2_3 = var_2_2.drop_type
		local var_2_4 = var_2_2.link_id
		local var_2_5 = iter_2_1.number

		if not var_2_1[var_2_3] then
			var_2_1[var_2_3] = {}
		end

		var_2_1[var_2_3][var_2_4] = var_2_5
	end

	return var_2_1
end

function var_0_0.AddIslandExp(arg_3_0)
	getProxy(IslandProxy):GetIsland():AddExp(arg_3_0)
end

function var_0_0.AddIslandItems(arg_4_0)
	local var_4_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_4_1 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0) do
		local var_4_2 = IslandItem.New(iter_4_1)

		var_4_0:AddItem(var_4_2)
		table.insert(var_4_1, Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_4_1.id,
			count = iter_4_1.number or iter_4_1.num or iter_4_1.count
		}))
	end

	return var_4_1
end

function var_0_0.AddIslandOverFlowItems(arg_5_0)
	local var_5_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0) do
		local var_5_2 = IslandItem.New(iter_5_1)

		var_5_0:AddOverFlowItem(var_5_2)
		table.insert(var_5_1, Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_5_1.id,
			count = iter_5_1.number or iter_5_1.num or iter_5_1.count
		}))
	end

	return var_5_1
end

function var_0_0.AddIslandAbility(arg_6_0)
	local var_6_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()
	local var_6_1 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0) do
		if not var_6_0:HasAbility(iter_6_1.id) then
			var_6_0:AddAblity(iter_6_1.id)
			var_0_0.HandleIslandShopAbility(iter_6_1.id)
			var_0_0.HandleIslandAbilityByType(iter_6_1.id)
			table.insert(var_6_1, Drop.New({
				count = 1,
				type = DROP_TYPE_ISLAND_ABILITY,
				id = iter_6_1.id
			}))
		end
	end

	return var_6_1
end

function var_0_0.HandleIslandShopAbility(arg_7_0)
	local var_7_0 = IslandAblityAgency.GetEffect(arg_7_0)

	if IslandAblityAgency.IsShopTypeNormal(arg_7_0) then
		local var_7_1 = pg.island_shop_normal_template[var_7_0]

		if var_7_1 then
			local var_7_2 = var_7_1.unlock == "" and {} or var_7_1.unlock
			local var_7_3 = true

			for iter_7_0, iter_7_1 in ipairs(var_7_2) do
				if not getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(iter_7_1) then
					var_7_3 = false

					break
				end
			end

			if var_7_3 then
				getProxy(IslandProxy):GetIsland():GetShopAgency():RefreshShopData(var_7_0)
			end
		end
	elseif IslandAblityAgency.IsShopTypeTemporary(arg_7_0) then
		getProxy(IslandProxy):GetIsland():GetShopAgency():RefreshShopData(var_7_0)
	end
end

function var_0_0.HandleIslandAbilityByType(arg_8_0)
	local var_8_0 = getProxy(IslandProxy):GetIsland()
	local var_8_1 = IslandAblityAgency.GetEffect(arg_8_0)

	switch(IslandAblityAgency.GetAblityType(arg_8_0), {
		[IslandAblityAgency.TYPE_SLOT] = function()
			var_8_0:GetBuildingAgency():InitSlotDataByAbility(arg_8_0)
		end,
		[IslandAblityAgency.TYPE_RESTAURANT] = function()
			var_8_0:GetManageAgency():UnlockNewRestaurant(var_8_1)
		end,
		[IslandAblityAgency.TYPE_ASSISTANT] = function()
			var_8_0:GetManageAgency():UnlockNewAssistant(var_8_1)
		end,
		[IslandAblityAgency.TYPE_ANIMAL] = function()
			var_8_0:GetBuildingAgency():InitBuildAnimalDataByAbility(var_8_1)
		end,
		[IslandAblityAgency.TYPE_RECOVER_CAMP] = function()
			local var_13_0 = var_8_0:GetBuildingAgency():GetBuilding(IslandProductConst.FellingPlaceId):GetBuildingCollectData()
			local var_13_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_13_2 = pg.TimeMgr.GetInstance():GetZeroTimeStamp(var_13_1) + var_8_1

			if var_13_2 < var_13_0:GetNextRecoverTimes() then
				var_13_0:UpdateCollectRefreshtTime(var_13_2)
			end
		end,
		[IslandAblityAgency.TYPE_RECOVER_ORE] = function()
			local var_14_0 = var_8_0:GetBuildingAgency():GetBuilding(IslandProductConst.MinePlaceId):GetBuildingCollectData()
			local var_14_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_14_2 = pg.TimeMgr.GetInstance():GetZeroTimeStamp(var_14_1) + var_8_1

			if var_14_2 < var_14_0:GetNextRecoverTimes() then
				var_14_0:UpdateCollectRefreshtTime(var_14_2)
			end
		end
	})
end

function var_0_0.AddPlayerItems(arg_15_0)
	return PlayerConst.addTranDrop(arg_15_0)
end

function var_0_0.AddShipInvitations(arg_16_0)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
		var_16_0:AddInvite(iter_16_1.id)
		table.insert(var_16_1, Drop.New({
			type = DROP_TYPE_ISLAND_INVITATION,
			id = iter_16_1.id,
			count = iter_16_1.number or iter_16_1.num or iter_16_1.count
		}))
	end

	return var_16_1
end

function var_0_0.AddVirtualDrops(arg_17_0)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0) do
		switch(iter_17_1.type, {
			[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function()
				local var_18_0 = Drop.New({
					type = iter_17_1.type,
					id = iter_17_1.id,
					count = iter_17_1.number or iter_17_1.num or iter_17_1.count
				})

				table.insert(var_17_0, var_18_0)
				getProxy(IslandProxy):GetIsland():GetSeasonAgency():AddPt(var_18_0.count)
			end
		})
	end

	return var_17_0
end

function var_0_0.AddIslandFurnitureDrops(arg_19_0)
	local var_19_0 = getProxy(IslandProxy):GetIsland():GetAgoraAgency()
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_0) do
		local var_19_2 = IslandFurniture.New({
			id = iter_19_1.id,
			count = iter_19_1.number or iter_19_1.num or iter_19_1.count
		})

		var_19_2:SetTime(pg.TimeMgr:GetInstance():GetServerTime())
		var_19_0:AddFurniture(var_19_2)
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.FURNITURE)
		table.insert(var_19_1, Drop.New({
			type = DROP_TYPE_ISLAND_FURNITURE,
			id = iter_19_1.id,
			count = iter_19_1.number or iter_19_1.num or iter_19_1.count
		}))
	end

	return var_19_1
end

function var_0_0.AddIslandDressDrops(arg_20_0)
	local var_20_0 = {}
	local var_20_1 = getProxy(IslandProxy):GetIsland()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		local var_20_2 = pg.island_dress_template[iter_20_1.id]

		if var_20_2.belongto == 1 then
			var_20_1:GetDressUpAgency():AddDressByDressId(iter_20_1.id)
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.COMMANDER_DRESS)
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.COMMANDER_DRESS_ID)
			IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.COMMANDER_DRESS_TYPE, var_20_2.type, 1)
		else
			local var_20_3 = var_20_1:GetCharacterAgency()
			local var_20_4 = not var_20_3:ExistDressId(iter_20_1.id)

			var_20_3:AddDressItem(iter_20_1.id, iter_20_1.number, true)
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.SHIP_DRESS_ID)

			if var_20_4 then
				IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.SHIP_DRESS)
				IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.SHIP_DRESS_TYPE, var_20_2.type, 1)
			end
		end

		table.insert(var_20_0, Drop.New({
			type = DROP_TYPE_ISLAND_DRESS,
			id = iter_20_1.id,
			count = iter_20_1.number or iter_20_1.num or iter_20_1.count
		}))
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandGetDress(var_20_2.belongto, iter_20_1.id))
	end

	return var_20_0
end

function var_0_0.AddIslandSkinDrops(arg_21_0)
	local var_21_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	local var_21_1 = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_0) do
		var_21_0:AddSkin(iter_21_1.id)
		table.insert(var_21_1, Drop.New({
			type = DROP_TYPE_ISLAND_SKIN,
			id = iter_21_1.id,
			count = iter_21_1.number or iter_21_1.num or iter_21_1.count
		}))
	end

	if #arg_21_0 > 0 then
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.SHIP_SKIN)
		IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.SHIP_SKIN, 0, #arg_21_0)
	end

	return var_21_1
end

function var_0_0.AddIslandActionDrops(arg_22_0)
	local var_22_0 = getProxy(IslandProxy):GetIsland():GetActionAgency()
	local var_22_1 = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_0) do
		var_22_0:AddAction(iter_22_1.id)
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.ACTION)
		IslandAchievementHelper.UpdateRecordWithAdd(IslandTaskTargetType.ACTION, 0, 1)
		table.insert(var_22_1, Drop.New({
			type = DROP_TYPE_ISLAND_ACTION,
			id = iter_22_1.id,
			count = iter_22_1.number or iter_22_1.num or iter_22_1.count
		}))
	end

	return var_22_1
end

function var_0_0.AddIslandCardDiyDrops(arg_23_0)
	local var_23_0 = getProxy(IslandProxy):GetIsland():GetCardDiyAgency()
	local var_23_1 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_0) do
		var_23_0:AddCardDiy(iter_23_1)
		table.insert(var_23_1, Drop.New({
			type = DROP_TYPE_ISLAND_CARD_DIY,
			id = iter_23_1.id,
			count = iter_23_1.number or iter_23_1.num or iter_23_1.count
		}))
	end

	return var_23_1
end

function var_0_0.AddIslandTicketDrops(arg_24_0, arg_24_1)
	local var_24_0 = getProxy(IslandProxy):GetIsland():GetTicketAgency()
	local var_24_1 = {}

	for iter_24_0, iter_24_1 in ipairs(arg_24_0) do
		local var_24_2 = arg_24_1[DROP_TYPE_ISLAND_SPEEDUP_TICKET][iter_24_1.id]
		local var_24_3 = IslandTicket.GetEndTimeById(iter_24_1.id, var_24_2)
		local var_24_4 = iter_24_1.number or iter_24_1.num or iter_24_1.count

		var_24_0:AddTicket(iter_24_1.id, var_24_3, var_24_4)
		table.insert(var_24_1, Drop.New({
			type = DROP_TYPE_ISLAND_SPEEDUP_TICKET,
			id = iter_24_1.id,
			count = var_24_4
		}))
	end

	return var_24_1
end

function var_0_0.AddIslandCollectDrops(arg_25_0)
	local var_25_0 = getProxy(IslandProxy):GetIsland():GetWildCollectAgency()
	local var_25_1 = {}

	for iter_25_0, iter_25_1 in ipairs(arg_25_0) do
		var_25_0:AddFinishCollectData(iter_25_1.id)
		table.insert(var_25_1, Drop.New({
			type = DROP_TYPE_ISLAND_COLLECTION,
			id = iter_25_1.id,
			count = iter_25_1.number or iter_25_1.num or iter_25_1.count
		}))
	end

	return var_25_1
end

return var_0_0
