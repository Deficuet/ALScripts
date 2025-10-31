local var_0_0 = class("IslandCharacterAgency", import(".IslandBaseAgency"))

var_0_0.ADD_SHIP = "IslandCharacterAgency:ADD_SHIP"
var_0_0.SHIP_LEVEL_UP = "IslandCharacterAgency:SHIP_LEVEL_UP"
var_0_0.SHIP_GET_STATE = "IslandCharacterAgency:SHIP_GET_STATE"
var_0_0.CHANGE_CHARACTER_DRESS = "IslandCharacterAgency:CHANGE_CHARACTER_DRESS"
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

	arg_1_0.shipWearDressData = {}

	for iter_1_10, iter_1_11 in ipairs(arg_1_1.ship_sys.wear_list or {}) do
		local var_1_3 = arg_1_0.shipWearDressData[iter_1_11.ship_id] or {}

		table.insert(var_1_3, IslandShipDressItem.New(iter_1_11))

		arg_1_0.shipWearDressData[iter_1_11.ship_id] = var_1_3
	end
end

function var_0_0.CanFollowPlayer(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.ships[arg_2_1]

	if not var_2_0 then
		return false
	end

	local var_2_1 = var_2_0:GetCantFollowTaskIdList()
	local var_2_2 = false

	if #var_2_1 > 0 then
		local var_2_3 = arg_2_0:GetHost():GetTaskAgency()

		var_2_2 = _.any(var_2_1, function(arg_3_0)
			return var_2_3:GetTask(arg_3_0) ~= nil
		end)
	end

	return var_2_0:GetState() == IslandShip.STATE_NORMAL and not var_2_2
end

function var_0_0.GetInviteList(arg_4_0)
	return arg_4_0.inviteList
end

function var_0_0.AddInvite(arg_5_0, arg_5_1)
	table.insert(arg_5_0.inviteList, arg_5_1)
end

function var_0_0.HasInvite(arg_6_0, arg_6_1)
	return _.any(arg_6_0.inviteList, function(arg_7_0)
		return arg_6_1 == arg_7_0
	end)
end

function var_0_0.RemoveInvite(arg_8_0, arg_8_1)
	table.removebyvalue(arg_8_0.inviteList, arg_8_1)
end

function var_0_0.GetShips(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.ships) do
		if iter_9_1.id ~= var_0_0.NPC_CONFIG_ID then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return var_9_0
end

function var_0_0.GetShipsContainNpc(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.ships) do
		table.insert(var_10_0, iter_10_1)
	end

	return var_10_0
end

function var_0_0.AddShip(arg_11_0, arg_11_1)
	arg_11_0.ships[arg_11_1.id] = arg_11_1

	arg_11_0:DispatchEvent(var_0_0.ADD_SHIP, arg_11_1)
end

function var_0_0.GetShipById(arg_12_0, arg_12_1)
	return arg_12_0.ships[arg_12_1]
end

function var_0_0.GetUnlockOrCanUnlockShipConfigIds(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(pg.island_chara_template.all) do
		if iter_13_1 ~= var_0_0.NPC_CONFIG_ID and (arg_13_0.ships[iter_13_1] or arg_13_0:HasInvite(iter_13_1)) then
			table.insert(var_13_0, iter_13_1)
		end
	end

	table.sort(var_13_0, CompareFuncs({
		function(arg_14_0)
			return arg_13_0.ships[arg_14_0] and 0 or 1
		end,
		function(arg_15_0)
			return arg_15_0
		end
	}))

	return var_13_0
end

function var_0_0.GetUnlockOrCanUnlockShipConfigIdsContainNpc(arg_16_0)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(pg.island_chara_template.all) do
		if arg_16_0.ships[iter_16_1] or arg_16_0:HasInvite(iter_16_1) then
			table.insert(var_16_0, iter_16_1)
		end
	end

	table.sort(var_16_0, CompareFuncs({
		function(arg_17_0)
			return arg_16_0.ships[arg_17_0] and 0 or 1
		end,
		function(arg_18_0)
			return arg_18_0
		end
	}))

	return var_16_0
end

function var_0_0.GetAllSkinCnt(arg_19_0)
	local var_19_0 = 0

	for iter_19_0, iter_19_1 in pairs(arg_19_0.shipSkinDic) do
		var_19_0 = var_19_0 + #iter_19_1
	end

	return var_19_0
end

function var_0_0.GetOwnSkinListByShipId(arg_20_0, arg_20_1)
	return arg_20_0.shipSkinDic[arg_20_1] or {}
end

function var_0_0.AddSkin(arg_21_0, arg_21_1)
	local var_21_0 = pg.island_skin_template[arg_21_1].ship_group
	local var_21_1 = arg_21_0.shipSkinDic[var_21_0] or {}

	table.insert(var_21_1, IslandShipSkin.New({
		color_id = 0,
		id = arg_21_1,
		color_list = {}
	}))

	arg_21_0.shipSkinDic[var_21_0] = var_21_1
end

function var_0_0.AddSkinColor(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = arg_22_0.shipSkinDic[arg_22_1] or {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		if iter_22_1.id == arg_22_2 then
			iter_22_1:AddSkinColor(arg_22_3)
		end
	end
end

function var_0_0.GetCurrentSkinColorByShipId(arg_23_0, arg_23_1, arg_23_2)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.shipSkinDic[arg_23_1] or {}) do
		if iter_23_1.id == arg_23_2 then
			return iter_23_1.color_id
		end
	end

	return 0
end

function var_0_0.GetAllOwnDressDic(arg_24_0)
	return arg_24_0.hasDressData
end

function var_0_0.GetDiffDressCnt(arg_25_0)
	return #underscore.keys(arg_25_0.hasDressData)
end

function var_0_0.GetDiffDressCntByType(arg_26_0, arg_26_1)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0.hasDressData) do
		if pg.island_dress_template[iter_26_0].type == arg_26_1 and not table.contains(var_26_0, iter_26_0) then
			table.insert(var_26_0, iter_26_0)
		end
	end

	return #var_26_0
end

function var_0_0.ExistDressId(arg_27_0, arg_27_1)
	return arg_27_0.hasDressData[arg_27_1] ~= nil
end

function var_0_0.GetDressIdRealCount(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0:GetOwnDressCountByDressId()

	for iter_28_0, iter_28_1 in pairs(arg_28_0.shipWearDressData) do
		for iter_28_2, iter_28_3 in ipairs(iter_28_1) do
			if iter_28_3.dress_id == arg_28_1 then
				var_28_0 = var_28_0 + 1
			end
		end
	end

	return var_28_0
end

function var_0_0.GetOwnDressCountByDressId(arg_29_0, arg_29_1)
	return arg_29_0.hasDressData[arg_29_1] and arg_29_0.hasDressData[arg_29_1].num or 0
end

function var_0_0.AddDressItem(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	if not arg_30_0.hasDressData[arg_30_1] then
		local var_30_0 = arg_30_3 and 0 or 1

		arg_30_0.hasDressData[arg_30_1] = IslandOwnedDressItem.New({
			id = arg_30_1,
			num = arg_30_2,
			read = var_30_0
		})
	else
		arg_30_0.hasDressData[arg_30_1].num = arg_30_0.hasDressData[arg_30_1].num + arg_30_2

		if arg_30_3 then
			arg_30_0.hasDressData[arg_30_1].read = 1
		end
	end
end

function var_0_0.ReduceDressItem(arg_31_0, arg_31_1, arg_31_2)
	if not arg_31_0.hasDressData[arg_31_1] then
		return
	end

	arg_31_0.hasDressData[arg_31_1].num = arg_31_0.hasDressData[arg_31_1].num - arg_31_2
end

function var_0_0.CheckSkinIsOwned(arg_32_0, arg_32_1)
	if arg_32_1 == 0 then
		return true
	end

	local var_32_0 = pg.island_skin_template[arg_32_1].ship_group

	for iter_32_0, iter_32_1 in pairs(arg_32_0:GetOwnSkinListByShipId(var_32_0)) do
		if iter_32_1.id == arg_32_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinData(arg_33_0, arg_33_1)
	if arg_33_1 == 0 then
		return nil
	end

	local var_33_0 = pg.island_skin_template[arg_33_1].ship_group

	for iter_33_0, iter_33_1 in pairs(arg_33_0:GetOwnSkinListByShipId(var_33_0)) do
		if iter_33_1.id == arg_33_1 then
			return iter_33_1
		end
	end

	return nil
end

function var_0_0.SetSkinCurrentColor(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_1 == 0 then
		return
	end

	local var_34_0 = arg_34_0:GetSkinData(arg_34_1)

	if var_34_0 then
		var_34_0:SetCurrentColor(arg_34_2)
	end
end

function var_0_0.GetSkinCurrentColor(arg_35_0, arg_35_1)
	if arg_35_1 == 0 then
		return 0
	end

	local var_35_0 = arg_35_0:GetSkinData(arg_35_1)

	if var_35_0 then
		return var_35_0:GetCurrentColor()
	end

	return 0
end

function var_0_0.CheckSkinColorIsOwned(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_0:GetSkinData(arg_36_1)

	if not var_36_0 then
		return false
	end

	return var_36_0:CheckColorOwned(arg_36_2)
end

function var_0_0.GetHasDressData(arg_37_0, arg_37_1)
	return arg_37_0.hasDressData[arg_37_1]
end

function var_0_0.SetDressHasRead(arg_38_0, arg_38_1)
	if not arg_38_0.hasDressData[arg_38_1] then
		return
	end

	arg_38_0.hasDressData[arg_38_1].read = 1
end

function var_0_0.CheckRedDotByDressType(arg_39_0, arg_39_1)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.hasDressData) do
		if iter_39_1:getConfigTable().type == arg_39_1 and iter_39_1.read == 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetCurDressIdByShipId(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0.shipWearDressData[arg_40_1] or {}

	for iter_40_0, iter_40_1 in ipairs(var_40_0) do
		if iter_40_1:getConfigTable().type == arg_40_2 then
			return iter_40_1
		end
	end

	return nil
end

function var_0_0.DischargeDressOnShip(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_0.shipWearDressData[arg_41_1] or {}
	local var_41_1 = -1

	for iter_41_0, iter_41_1 in ipairs(var_41_0) do
		if iter_41_1.dress_id == arg_41_2 then
			var_41_1 = iter_41_0
		end
	end

	if var_41_1 ~= -1 then
		table.remove(var_41_0, var_41_1)
	end

	arg_41_0.shipWearDressData[arg_41_1] = var_41_0
end

function var_0_0.ChargeDressOnShip(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_0.shipWearDressData[arg_42_1] or {}

	table.insert(var_42_0, IslandShipDressItem.New({
		ship_id = arg_42_1,
		dress_id = arg_42_2
	}))

	arg_42_0.shipWearDressData[arg_42_1] = var_42_0
end

function var_0_0.GetShipHoldedDressDic(arg_43_0)
	return arg_43_0.shipWearDressData
end

return var_0_0
