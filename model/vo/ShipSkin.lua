local var_0_0 = class("ShipSkin", import(".BaseVO"))

var_0_0.SKIN_TYPE_DEFAULT = -1
var_0_0.SKIN_TYPE_COMMON_FASHION = 0
var_0_0.SKIN_TYPE_PROPOSE = 1
var_0_0.SKIN_TYPE_REMAKE = 2
var_0_0.SKIN_TYPE_OLD = 3
var_0_0.SKIN_TYPE_NOT_HAVE_HIDE = 4
var_0_0.SKIN_TYPE_SHOW_IN_TIME = 5
var_0_0.SKIN_TYPE_TB = 6
var_0_0.WITH_LIVE2D = 1
var_0_0.WITH_BG = 2
var_0_0.WITH_EFFECT = 3
var_0_0.WITH_DYNAMIC_BG = 4
var_0_0.WITH_BGM = 5
var_0_0.WITH_SPINE = 6
var_0_0.WITH_SPINE_PLUS = 7
var_0_0.WITH_CHANGE = 8

function var_0_0.Tag2Name(arg_1_0)
	if not var_0_0.Tag2NameTab then
		var_0_0.Tag2NameTab = {
			[var_0_0.WITH_BG] = "bg",
			[var_0_0.WITH_BGM] = "bgm",
			[var_0_0.WITH_DYNAMIC_BG] = "dtbg",
			[var_0_0.WITH_EFFECT] = "effect",
			[var_0_0.WITH_LIVE2D] = "live2d",
			[var_0_0.WITH_SPINE] = "spine",
			[var_0_0.WITH_SPINE_PLUS] = "spine_plus",
			[var_0_0.WITH_CHANGE] = "change"
		}
	end

	return var_0_0.Tag2NameTab[arg_1_0]
end

function var_0_0.GetShopTypeIdBySkinId(arg_2_0, arg_2_1)
	local var_2_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if arg_2_1[arg_2_0] then
		return arg_2_1[arg_2_0]
	end

	for iter_2_0, iter_2_1 in pairs(var_2_0) do
		for iter_2_2, iter_2_3 in ipairs(iter_2_1) do
			arg_2_1[iter_2_3] = iter_2_0

			if iter_2_3 == arg_2_0 then
				return iter_2_0
			end
		end
	end
end

local var_0_1 = pg.ship_skin_template.get_id_list_by_ship_group

function var_0_0.GetSkinByType(arg_3_0, arg_3_1)
	local var_3_0 = var_0_1[arg_3_0] or {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_1 = pg.ship_skin_template[iter_3_1]

		if var_3_1.skin_type == arg_3_1 then
			return var_3_1
		end
	end
end

function var_0_0.GetAllSkinByGroup(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = var_0_1[arg_4_0] or {}

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		local var_4_2 = pg.ship_skin_template[iter_4_1]

		if var_4_2.no_showing ~= "1" then
			table.insert(var_4_0, var_4_2)
		end
	end

	return var_4_0
end

function var_0_0.GetShareSkinsByGroupId(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0:getConfig("skin_type")

		return not (var_6_0 == var_0_0.SKIN_TYPE_DEFAULT or var_6_0 == var_0_0.SKIN_TYPE_REMAKE or var_6_0 == var_0_0.SKIN_TYPE_OLD)
	end

	local var_5_1 = pg.ship_data_group.get_id_list_by_group_type[arg_5_0][1]
	local var_5_2 = pg.ship_data_group[var_5_1]

	if not var_5_2.share_group_id or #var_5_2.share_group_id <= 0 then
		return {}
	end

	local var_5_3 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_2.share_group_id) do
		local var_5_4 = pg.ship_skin_template.get_id_list_by_ship_group[iter_5_1]

		for iter_5_2, iter_5_3 in ipairs(var_5_4) do
			local var_5_5 = ShipSkin.New({
				id = iter_5_3
			})

			if var_5_0(var_5_5) then
				table.insert(var_5_3, var_5_5)
			end
		end
	end

	return var_5_3
end

function var_0_0.Ctor(arg_7_0, arg_7_1)
	arg_7_0.id = arg_7_1.id
	arg_7_0.configId = arg_7_1.id
	arg_7_0.endTime = arg_7_1.end_time or arg_7_1.time or 0
	arg_7_0.isNew = true

	if arg_7_0:getConfig("skin_type") == var_0_0.SKIN_TYPE_TB then
		arg_7_0.shipName = NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_7_0.id))
	else
		local var_7_0 = arg_7_0:getConfig("ship_group")
		local var_7_1 = ShipGroup.getDefaultShipConfig(var_7_0)

		arg_7_0.shipName = var_7_1 and var_7_1.name or ""
	end

	arg_7_0.skinName = arg_7_0:getConfig("name")
end

function var_0_0.HasNewFlag(arg_8_0)
	return arg_8_0.isNew
end

function var_0_0.SetIsNew(arg_9_0, arg_9_1)
	arg_9_0.isNew = arg_9_1
end

function var_0_0.bindConfigTable(arg_10_0)
	return pg.ship_skin_template
end

function var_0_0.isExpireType(arg_11_0)
	return arg_11_0.endTime > 0
end

function var_0_0.getExpireTime(arg_12_0)
	return arg_12_0.endTime
end

function var_0_0.isExpired(arg_13_0)
	return pg.TimeMgr.GetInstance():GetServerTime() >= arg_13_0.endTime
end

function var_0_0.getRemainTime(arg_14_0)
	return arg_14_0:getExpireTime() - pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.getIcon(arg_15_0)
	return arg_15_0:getConfig("painting")
end

function var_0_0.InShowTime(arg_16_0)
	return getProxy(ShipSkinProxy):InShowTime(arg_16_0.id)
end

function var_0_0.IsDefault(arg_17_0)
	return arg_17_0:getConfig("skin_type") == var_0_0.SKIN_TYPE_DEFAULT
end

function var_0_0.IsType(arg_18_0, arg_18_1)
	return arg_18_0:getConfig("shop_type_id") == arg_18_1
end

function var_0_0.IsMatchKey(arg_19_0, arg_19_1)
	if not arg_19_1 or arg_19_1 == "" then
		return true
	end

	arg_19_1 = string.lower(string.gsub(arg_19_1, "%.", "%%."))
	arg_19_1 = string.lower(string.gsub(arg_19_1, "%-", "%%-"))

	return string.find(string.lower(arg_19_0.shipName), arg_19_1) or string.find(string.lower(arg_19_0.skinName), arg_19_1)
end

function var_0_0.ToShip(arg_20_0)
	local var_20_0 = arg_20_0:getConfig("ship_group")
	local var_20_1 = ShipGroup.getDefaultShipConfig(var_20_0)

	if var_20_1 then
		return Ship.New({
			id = 1,
			intimacy = 10000,
			template_id = var_20_1.id,
			skin_id = arg_20_0.id
		})
	else
		return nil
	end
end

function var_0_0.GetDefaultShipConfig(arg_21_0)
	local var_21_0 = arg_21_0:getConfig("ship_group")

	return (ShipGroup.getDefaultShipConfig(var_21_0))
end

function var_0_0.IsLive2d(arg_22_0)
	if not arg_22_0.isLive2dTag then
		arg_22_0.isLive2dTag = table.contains(arg_22_0:getConfig("tag"), var_0_0.WITH_LIVE2D)
	end

	return arg_22_0.isLive2dTag
end

function var_0_0.IsDbg(arg_23_0)
	if not arg_23_0.isDGBTag then
		arg_23_0.isDGBTag = table.contains(arg_23_0:getConfig("tag"), var_0_0.WITH_DYNAMIC_BG)
	end

	return arg_23_0.isDGBTag
end

function var_0_0.IsBG(arg_24_0)
	if not arg_24_0.isBGTag then
		arg_24_0.isBGTag = table.contains(arg_24_0:getConfig("tag"), var_0_0.WITH_BG)
	end

	return arg_24_0.isBGTag
end

function var_0_0.IsEffect(arg_25_0)
	if not arg_25_0.isEffectTag then
		arg_25_0.isEffectTag = table.contains(arg_25_0:getConfig("tag"), var_0_0.WITH_EFFECT)
	end

	return arg_25_0.isEffectTag
end

function var_0_0.isBgm(arg_26_0)
	if not arg_26_0.isBgmTag then
		arg_26_0.isBgmTag = table.contains(arg_26_0:getConfig("tag"), var_0_0.WITH_BGM)
	end

	return arg_26_0.isBgmTag
end

function var_0_0.IsSpine(arg_27_0)
	if not arg_27_0.isSpine then
		arg_27_0.isSpine = table.contains(arg_27_0:getConfig("tag"), var_0_0.WITH_SPINE)
	end

	return arg_27_0.isSpine
end

function var_0_0.CantUse(arg_28_0)
	local var_28_0 = arg_28_0:IsTransSkin()
	local var_28_1 = arg_28_0:IsProposeSkin()
	local var_28_2 = arg_28_0:getConfig("ship_group")
	local var_28_3 = getProxy(BayProxy):_ExistGroupShip(var_28_2, var_28_0, var_28_1)
	local var_28_4 = getProxy(CollectionProxy).shipGroups[var_28_2] == nil

	return not var_28_3 or var_28_4
end

function var_0_0.OwnShip(arg_29_0)
	local var_29_0 = arg_29_0:IsTransSkin()
	local var_29_1 = arg_29_0:IsProposeSkin()
	local var_29_2 = arg_29_0:getConfig("ship_group")

	return (getProxy(BayProxy):_ExistGroupShip(var_29_2, var_29_0, var_29_1))
end

function var_0_0.WithoutUse(arg_30_0)
	local var_30_0 = arg_30_0:getConfig("ship_group")
	local var_30_1 = getProxy(BayProxy):findShipsByGroup(var_30_0)
	local var_30_2 = _.all(var_30_1, function(arg_31_0)
		return arg_31_0.skinId ~= arg_30_0.id
	end)

	return #var_30_1 > 0 and var_30_2
end

function var_0_0.ExistShip(arg_32_0)
	local var_32_0 = arg_32_0:getConfig("ship_group")

	return pg.ship_data_statistics[tonumber(var_32_0 .. 1)] ~= nil
end

function var_0_0.IsTransSkin(arg_33_0)
	return arg_33_0:getConfig("skin_type") == var_0_0.SKIN_TYPE_REMAKE
end

function var_0_0.IsProposeSkin(arg_34_0)
	return arg_34_0:getConfig("skin_type") == var_0_0.SKIN_TYPE_PROPOSE
end

function var_0_0.IsChangeSkin(arg_35_0)
	return table.contains(arg_35_0:getConfig("tag"), var_0_0.WITH_CHANGE)
end

function var_0_0.IsChangeSkinMainIndex(arg_36_0)
	if arg_36_0:IsChangeSkin() then
		return arg_36_0:getConfig("change_skin").index == 1
	end

	return false
end

function var_0_0.MatchChangeSkinMain(arg_37_0)
	if arg_37_0:IsChangeSkin() and not arg_37_0:IsChangeSkinMainIndex() then
		return false
	end

	return true
end

function var_0_0.CanShare(arg_38_0)
	local var_38_0 = getProxy(ShipSkinProxy):hasSkin(arg_38_0.configId)

	local function var_38_1()
		if var_38_0 then
			return true
		end

		return arg_38_0:InShowTime()
	end

	local function var_38_2()
		local var_40_0 = arg_38_0:getConfig("ship_group")
		local var_40_1 = getProxy(BayProxy):getRawData()

		for iter_40_0, iter_40_1 in pairs(var_40_1) do
			if iter_40_1.groupId == var_40_0 and iter_40_1.propose then
				return true
			end
		end

		return false
	end

	local var_38_3 = arg_38_0:getConfig("skin_type")

	return not (var_38_3 == var_0_0.SKIN_TYPE_DEFAULT or var_38_3 == var_0_0.SKIN_TYPE_REMAKE or var_38_3 == var_0_0.SKIN_TYPE_OLD or var_38_3 == var_0_0.SKIN_TYPE_NOT_HAVE_HIDE and not var_38_0 or var_38_3 == var_0_0.SKIN_TYPE_SHOW_IN_TIME and not var_38_1())
end

function var_0_0.IsShareSkin(arg_41_0, arg_41_1)
	local var_41_0 = pg.ship_skin_template[arg_41_1]
	local var_41_1 = pg.ship_data_group
	local var_41_2 = var_41_1[var_41_1.get_id_list_by_group_type[arg_41_0.groupId][1]].share_group_id

	return table.contains(var_41_2, var_41_0.ship_group)
end

function var_0_0.CanUseShareSkinForShip(arg_42_0, arg_42_1)
	local var_42_0 = var_0_0.IsShareSkin(arg_42_0, arg_42_1)
	local var_42_1 = ShipSkin.New({
		id = arg_42_1
	})
	local var_42_2 = false
	local var_42_3 = var_42_1:CanShare()
	local var_42_4 = var_42_1:IsProposeSkin()

	if var_42_3 and var_42_4 and arg_42_0.propose then
		var_42_2 = true
	elseif var_42_3 and not var_42_4 then
		var_42_2 = math.floor(arg_42_0:getIntimacy() / 100) >= arg_42_0:GetNoProposeIntimacyMax()
	end

	return var_42_0 and var_42_2
end

function var_0_0.ExistReward(arg_43_0)
	local var_43_0 = pg.ship_skin_reward[arg_43_0.configId]

	return var_43_0 ~= nil and #var_43_0.reward > 0
end

function var_0_0.GetRewardList(arg_44_0)
	if not arg_44_0:ExistReward() then
		return {}
	end

	local var_44_0 = pg.ship_skin_reward[arg_44_0.configId]
	local var_44_1 = {}

	for iter_44_0, iter_44_1 in pairs(var_44_0.reward) do
		table.insert(var_44_1, {
			type = iter_44_1[1],
			id = iter_44_1[2],
			count = iter_44_1[3]
		})
	end

	return var_44_1
end

function var_0_0.GetRewardListDesc(arg_45_0)
	local var_45_0 = arg_45_0:GetRewardList()

	if #var_45_0 <= 0 then
		return ""
	end

	local var_45_1 = _.map(var_45_0, function(arg_46_0)
		return {
			arg_46_0.type,
			arg_46_0.id,
			arg_46_0.count
		}
	end)

	return getDropInfo(var_45_1)
end

return var_0_0
