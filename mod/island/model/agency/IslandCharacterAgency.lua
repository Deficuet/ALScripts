local var_0_0 = class("IslandCharacterAgency", import(".IslandBaseAgency"))

var_0_0.ADD_SHIP = "IslandCharacterAgency:ADD_SHIP"
var_0_0.SHIP_LEVEL_UP = "IslandCharacterAgency:SHIP_LEVEL_UP"
var_0_0.SHIP_GET_STATE = "IslandCharacterAgency:SHIP_GET_STATE"
var_0_0.NPC_CONFIG_ID = 1

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.inviteList = {}
	arg_1_0.ships = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.ship_sys.invite_list or {}) do
		table.insert(arg_1_0.inviteList, iter_1_1)
	end

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.ship_sys.ship_list or {}) do
		local var_1_0 = IslandShip.New(iter_1_3)

		arg_1_0.ships[var_1_0.id] = var_1_0
	end

	local var_1_1 = IslandNpcShip.New({
		id = var_0_0.NPC_CONFIG_ID
	})

	arg_1_0.ships[var_1_1.id] = var_1_1
	arg_1_0.hasDressData = {}

	for iter_1_4, iter_1_5 in ipairs(arg_1_1.ship_sys.had_dress or {}) do
		arg_1_0.hasDressData[iter_1_5.id] = IslandOwnedDressItem.New(iter_1_5)
	end

	arg_1_0.read_list = arg_1_1.ship_sys.read_list
	arg_1_0.shipSkinDic = {}

	for iter_1_6, iter_1_7 in ipairs(arg_1_1.ship_sys.skin_list) do
		local var_1_2 = arg_1_0.shipSkinDic[iter_1_7.ship_id] or {}

		for iter_1_8, iter_1_9 in ipairs(iter_1_7.skin_list) do
			table.insert(var_1_2, IslandShipSkin.New(iter_1_9))
		end

		arg_1_0.shipSkinDic[iter_1_7.ship_id] = var_1_2
	end
end

function var_0_0.GetInviteList(arg_2_0)
	return arg_2_0.inviteList
end

function var_0_0.AddInvite(arg_3_0, arg_3_1)
	table.insert(arg_3_0.inviteList, arg_3_1)
end

function var_0_0.HasInvite(arg_4_0, arg_4_1)
	return _.any(arg_4_0.inviteList, function(arg_5_0)
		return arg_4_1 == arg_5_0
	end)
end

function var_0_0.RemoveInvite(arg_6_0, arg_6_1)
	table.removebyvalue(arg_6_0.inviteList, arg_6_1)
end

function var_0_0.GetShips(arg_7_0)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(arg_7_0.ships) do
		if iter_7_1.id ~= var_0_0.NPC_CONFIG_ID then
			table.insert(var_7_0, iter_7_1)
		end
	end

	return var_7_0
end

function var_0_0.GetShipsContainNpc(arg_8_0)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0.ships) do
		table.insert(var_8_0, iter_8_1)
	end

	return var_8_0
end

function var_0_0.AddShip(arg_9_0, arg_9_1)
	arg_9_0.ships[arg_9_1.id] = arg_9_1

	arg_9_0:DispatchEvent(var_0_0.ADD_SHIP, arg_9_1)
end

function var_0_0.GetShipById(arg_10_0, arg_10_1)
	return arg_10_0.ships[arg_10_1]
end

function var_0_0.GetUnlockOrCanUnlockShipConfigIds(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(pg.island_chara_template.all) do
		if iter_11_1 ~= var_0_0.NPC_CONFIG_ID and (arg_11_0.ships[iter_11_1] or arg_11_0:HasInvite(iter_11_1)) then
			table.insert(var_11_0, iter_11_1)
		end
	end

	table.sort(var_11_0, CompareFuncs({
		function(arg_12_0)
			return arg_11_0.ships[arg_12_0] and 0 or 1
		end,
		function(arg_13_0)
			return arg_13_0
		end
	}))

	return var_11_0
end

function var_0_0.GetUnlockOrCanUnlockShipConfigIdsContainNpc(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(pg.island_chara_template.all) do
		if arg_14_0.ships[iter_14_1] or arg_14_0:HasInvite(iter_14_1) then
			table.insert(var_14_0, iter_14_1)
		end
	end

	table.sort(var_14_0, CompareFuncs({
		function(arg_15_0)
			return arg_14_0.ships[arg_15_0] and 0 or 1
		end,
		function(arg_16_0)
			return arg_16_0
		end
	}))

	return var_14_0
end

function var_0_0.GetAllSkinCnt(arg_17_0)
	local var_17_0 = 0

	for iter_17_0, iter_17_1 in pairs(arg_17_0.shipSkinDic) do
		var_17_0 = var_17_0 + #iter_17_1
	end

	return var_17_0
end

function var_0_0.GetOwnSkinListByShipId(arg_18_0, arg_18_1)
	return arg_18_0.shipSkinDic[arg_18_1] or {}
end

function var_0_0.AddSkin(arg_19_0, arg_19_1)
	local var_19_0 = pg.island_skin_template[arg_19_1].ship_group
	local var_19_1 = arg_19_0.shipSkinDic[var_19_0] or {}

	table.insert(var_19_1, IslandShipSkin.New({
		color_id = 0,
		id = arg_19_1,
		color_list = {}
	}))

	arg_19_0.shipSkinDic[var_19_0] = var_19_1
end

function var_0_0.AddSkinColor(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_0.shipSkinDic[arg_20_1] or {}

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		if iter_20_1.id == arg_20_2 then
			iter_20_1:AddSkinColor(arg_20_3)
		end
	end
end

function var_0_0.GetCurrentSkinColorByShipId(arg_21_0, arg_21_1, arg_21_2)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.shipSkinDic[arg_21_1] or {}) do
		if iter_21_1.id == arg_21_2 then
			return iter_21_1.color_id
		end
	end

	return 0
end

function var_0_0.GetAllOwnDressDic(arg_22_0)
	return arg_22_0.hasDressData
end

function var_0_0.GetDiffDressCnt(arg_23_0)
	return #underscore.keys(arg_23_0.hasDressData)
end

function var_0_0.GetDiffDressCntByType(arg_24_0, arg_24_1)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.hasDressData) do
		if pg.island_dress_template[iter_24_0].type == arg_24_1 and not table.contains(var_24_0, iter_24_0) then
			table.insert(var_24_0, iter_24_0)
		end
	end

	for iter_24_2, iter_24_3 in pairs(arg_24_0.ships) do
		local var_24_1 = iter_24_3:GetHasSendToShipDressByType(arg_24_1)

		var_24_0 = table.mergeArray(var_24_0, var_24_1, true)
	end

	return #var_24_0
end

function var_0_0.ExistDressId(arg_25_0, arg_25_1)
	if arg_25_0.hasDressData[arg_25_1] then
		return true
	end

	for iter_25_0, iter_25_1 in pairs(arg_25_0.ships) do
		if iter_25_1:CheckHasOwnDressByDressId(arg_25_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetOwnDressCountByDressId(arg_26_0, arg_26_1)
	return arg_26_0.hasDressData[arg_26_1] and arg_26_0.hasDressData[arg_26_1].num or 0
end

function var_0_0.AddDressItem(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_0.hasDressData[arg_27_1] then
		arg_27_0.hasDressData[arg_27_1] = IslandOwnedDressItem.New({
			read = 0,
			id = arg_27_1,
			num = arg_27_2
		})
	else
		arg_27_0.hasDressData[arg_27_1].num = arg_27_0.hasDressData[arg_27_1].num + arg_27_2
	end
end

function var_0_0.ReduceDressItem(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_0.hasDressData[arg_28_1] then
		return
	end

	arg_28_0.hasDressData[arg_28_1].num = arg_28_0.hasDressData[arg_28_1].num - arg_28_2
end

function var_0_0.CheckSkinIsOwned(arg_29_0, arg_29_1)
	if arg_29_1 == 0 then
		return true
	end

	local var_29_0 = pg.island_skin_template[arg_29_1].ship_group

	for iter_29_0, iter_29_1 in pairs(arg_29_0:GetOwnSkinListByShipId(var_29_0)) do
		if iter_29_1.id == arg_29_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinData(arg_30_0, arg_30_1)
	if arg_30_1 == 0 then
		return nil
	end

	local var_30_0 = pg.island_skin_template[arg_30_1].ship_group

	for iter_30_0, iter_30_1 in pairs(arg_30_0:GetOwnSkinListByShipId(var_30_0)) do
		if iter_30_1.id == arg_30_1 then
			return iter_30_1
		end
	end

	return nil
end

function var_0_0.SetSkinCurrentColor(arg_31_0, arg_31_1, arg_31_2)
	if arg_31_1 == 0 then
		return
	end

	local var_31_0 = arg_31_0:GetSkinData(arg_31_1)

	if var_31_0 then
		var_31_0:SetCurrentColor(arg_31_2)
	end
end

function var_0_0.CheckSkinColorIsOwned(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0:GetSkinData(arg_32_1)

	if not var_32_0 then
		return false
	end

	return var_32_0:CheckColorOwned(arg_32_2)
end

function var_0_0.GetHasDressData(arg_33_0, arg_33_1)
	return arg_33_0.hasDressData[arg_33_1]
end

function var_0_0.SetDressHasRead(arg_34_0, arg_34_1)
	if not arg_34_0.hasDressData[arg_34_1] then
		return
	end

	arg_34_0.hasDressData[arg_34_1].read = 1
end

function var_0_0.CheckRedDotByDressType(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.hasDressData) do
		if pg.island_dress_template[iter_35_0].type == arg_35_1 and iter_35_1.read == 0 then
			return true
		end
	end

	return false
end

return var_0_0
