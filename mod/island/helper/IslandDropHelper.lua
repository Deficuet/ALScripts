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
				table.insert(var_1_9, iter_1_1)
			end
		elseif iter_1_1.type == DROP_TYPE_ISLAND_FURNITURE then
			table.insert(var_1_6, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_DRESS then
			table.insert(var_1_7, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_SKIN then
			table.insert(var_1_8, iter_1_1)
		else
			table.insert(var_1_4, iter_1_1)
		end
	end

	local var_1_10 = var_0_0.AddIslandItems(var_1_1)
	local var_1_11 = var_0_0.AddIslandOverFlowItems(var_1_2)
	local var_1_12 = var_0_0.AddIslandAbility(var_1_3)
	local var_1_13 = var_0_0.AddPlayerItems(var_1_4)
	local var_1_14 = var_0_0.AddShipInvitations(var_1_5)
	local var_1_15 = var_0_0.AddVirtualDrops(var_1_9)
	local var_1_16 = var_0_0.AddIslandFurnitureDrops(var_1_6)
	local var_1_17 = var_0_0.AddIslandDressDrops(var_1_7)
	local var_1_18 = var_0_0.AddIslandSkinDrops(var_1_8)

	if #var_1_14 > 0 then
		for iter_1_2, iter_1_3 in ipairs(var_1_14) do
			table.insert(var_1_10, iter_1_3)
		end
	end

	if #var_1_15 > 0 then
		for iter_1_4, iter_1_5 in ipairs(var_1_15) do
			table.insert(var_1_10, iter_1_5)
		end
	end

	if #var_1_16 > 0 then
		for iter_1_6, iter_1_7 in ipairs(var_1_16) do
			table.insert(var_1_10, iter_1_7)
		end
	end

	if #var_1_17 > 0 then
		for iter_1_8, iter_1_9 in ipairs(var_1_17) do
			table.insert(var_1_10, iter_1_9)
		end
	end

	if #var_1_18 > 0 then
		for iter_1_10, iter_1_11 in ipairs(var_1_18) do
			table.insert(var_1_10, iter_1_11)
		end
	end

	if arg_1_1 and arg_1_1 > 0 then
		var_0_0.AddIslandExp(arg_1_1)
	end

	return {
		awards = var_1_10,
		overflowAwards = var_1_11,
		abilitys = var_1_12,
		exp = arg_1_1,
		drops = var_1_13
	}
end

function var_0_0.AddIslandExp(arg_2_0)
	getProxy(IslandProxy):GetIsland():AddExp(arg_2_0)
end

function var_0_0.AddIslandItems(arg_3_0)
	local var_3_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
		local var_3_2 = IslandItem.New(iter_3_1)

		var_3_0:AddItem(var_3_2)
		table.insert(var_3_1, Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_3_1.id,
			count = iter_3_1.number or iter_3_1.num or iter_3_1.count
		}))
	end

	return var_3_1
end

function var_0_0.AddIslandOverFlowItems(arg_4_0)
	local var_4_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_4_1 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0) do
		local var_4_2 = IslandItem.New(iter_4_1)

		var_4_0:AddOverFlowItem(var_4_2)
		table.insert(var_4_1, Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_4_1.id,
			count = iter_4_1.number or iter_4_1.num or iter_4_1.count
		}))
	end

	return var_4_1
end

function var_0_0.AddIslandAbility(arg_5_0)
	local var_5_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0) do
		if not var_5_0:HasAbility(iter_5_1.id) then
			var_5_0:AddAblity(iter_5_1.id)
			var_0_0.HandleIslandShopAbility(iter_5_1.id)
			var_0_0.HandleIslandAbilityByType(iter_5_1.id)
			table.insert(var_5_1, Drop.New({
				count = 1,
				type = DROP_TYPE_ISLAND_ABILITY,
				id = iter_5_1.id
			}))
		end
	end

	return var_5_1
end

function var_0_0.HandleIslandShopAbility(arg_6_0)
	local var_6_0 = IslandAblityAgency.GetEffect(arg_6_0)

	if IslandAblityAgency.IsShopTypeNormal(arg_6_0) then
		local var_6_1 = pg.island_shop_normal_template[var_6_0]

		if var_6_1 then
			local var_6_2 = var_6_1.unlock == "" and {} or var_6_1.unlock
			local var_6_3 = true

			for iter_6_0, iter_6_1 in ipairs(var_6_2) do
				if not getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(iter_6_1) then
					var_6_3 = false

					break
				end
			end

			if var_6_3 then
				getProxy(IslandProxy):GetIsland():GetShopAgency():RefreshShopData(var_6_0)
			end
		end
	elseif IslandAblityAgency.IsShopTypeTemporary(arg_6_0) then
		getProxy(IslandProxy):GetIsland():GetShopAgency():RefreshShopData(var_6_0)
	end
end

function var_0_0.HandleIslandAbilityByType(arg_7_0)
	local var_7_0 = getProxy(IslandProxy):GetIsland()
	local var_7_1 = IslandAblityAgency.GetEffect(arg_7_0)

	switch(IslandAblityAgency.GetAblityType(arg_7_0), {
		[IslandAblityAgency.TYPE_SLOT] = function()
			var_7_0:GetBuildingAgency():InitSlotDataByAbility(arg_7_0)
		end,
		[IslandAblityAgency.TYPE_RESTAURANT] = function()
			var_7_0:GetManageAgency():UnlockNewRestaurant(var_7_1)
		end,
		[IslandAblityAgency.TYPE_ASSISTANT] = function()
			var_7_0:GetManageAgency():UnlockNewAssistant(var_7_1)
		end,
		[IslandAblityAgency.TYPE_ANIMAL] = function()
			var_7_0:GetBuildingAgency():InitBuildAnimalDataByAbility(var_7_1)
		end
	})
end

function var_0_0.AddPlayerItems(arg_12_0)
	return PlayerConst.addTranDrop(arg_12_0)
end

function var_0_0.AddShipInvitations(arg_13_0)
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	local var_13_1 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0) do
		var_13_0:AddInvite(iter_13_1.id)
		table.insert(var_13_1, Drop.New({
			type = DROP_TYPE_ISLAND_INVITATION,
			id = iter_13_1.id,
			count = iter_13_1.number or iter_13_1.num or iter_13_1.count
		}))
	end

	return var_13_1
end

function var_0_0.AddVirtualDrops(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0) do
		switch(iter_14_1.type, {
			[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function()
				local var_15_0 = Drop.New({
					type = iter_14_1.type,
					id = iter_14_1.id,
					count = iter_14_1.number or iter_14_1.num or iter_14_1.count
				})

				table.insert(var_14_0, var_15_0)
				getProxy(IslandProxy):GetIsland():GetSeasonAgency():AddPt(var_15_0.count)
			end
		})
	end

	return var_14_0
end

function var_0_0.AddIslandFurnitureDrops(arg_16_0)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetAgoraAgency()
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
		local var_16_2 = IslandFurniture.New({
			id = iter_16_1.id,
			count = iter_16_1.number or iter_16_1.num or iter_16_1.count
		})

		var_16_0:AddFurniture(var_16_2)
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.FURNITURE)
		table.insert(var_16_1, Drop.New({
			type = DROP_TYPE_ISLAND_FURNITURE,
			id = iter_16_1.id,
			count = iter_16_1.number or iter_16_1.num or iter_16_1.count
		}))
	end

	return var_16_1
end

function var_0_0.AddIslandDressDrops(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = getProxy(IslandProxy):GetIsland()

	for iter_17_0, iter_17_1 in ipairs(arg_17_0) do
		local var_17_2 = pg.island_dress_template[iter_17_1.id]

		if var_17_2.belongto == 1 then
			var_17_1:GetDressUpAgency():AddDressByDressId(iter_17_1.id)
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.COMMANDER_DRESS)
			IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.COMMANDER_DRESS_TYPE, var_17_2.type, 1)
		else
			local var_17_3 = var_17_1:GetCharacterAgency()
			local var_17_4 = not var_17_3:ExistDressId(iter_17_1.id)

			var_17_3:AddDressItem(iter_17_1.id, iter_17_1.number)

			if var_17_4 then
				IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.SHIP_DRESS)
				IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.SHIP_DRESS_TYPE, var_17_2.type, 1)
			end
		end

		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandGetDress(var_17_2.belongto, iter_17_1.id))
	end

	return var_17_0
end

function var_0_0.AddIslandSkinDrops(arg_18_0)
	local var_18_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0) do
		var_18_0:AddSkin(iter_18_1.id)
		table.insert(var_18_1, Drop.New({
			type = DROP_TYPE_ISLAND_SKIN,
			id = iter_18_1.id,
			count = iter_18_1.number or iter_18_1.num or iter_18_1.count
		}))
	end

	if #arg_18_0 > 0 then
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.SHIP_SKIN)
		IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.SHIP_SKIN, 0, #arg_18_0)
	end

	return var_18_1
end

return var_0_0
