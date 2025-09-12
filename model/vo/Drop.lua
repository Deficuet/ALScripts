local var_0_0 = class("Drop", import(".BaseVO"))

function var_0_0.Create(arg_1_0)
	local var_1_0 = {}

	var_1_0.type, var_1_0.id, var_1_0.count = unpack(arg_1_0)

	return var_0_0.New(var_1_0)
end

function var_0_0.Change(arg_2_0)
	if not getmetatable(arg_2_0) then
		setmetatable(arg_2_0, var_0_0)

		arg_2_0.class = var_0_0

		arg_2_0:InitConfig()
	else
		assert(instanceof(arg_2_0, var_0_0))
	end

	return arg_2_0
end

function var_0_0.Ctor(arg_3_0, arg_3_1)
	assert(not getmetatable(arg_3_1), "drop data should not has metatable")

	for iter_3_0, iter_3_1 in pairs(arg_3_1) do
		arg_3_0[iter_3_0] = iter_3_1
	end

	arg_3_0:InitConfig()
end

function var_0_0.InitConfig(arg_4_0)
	if not var_0_0.inited then
		var_0_0.InitSwitch()
	end

	arg_4_0.configId = arg_4_0.id
	arg_4_0.cfg = switch(arg_4_0.type, var_0_0.ConfigCase, var_0_0.ConfigDefault, arg_4_0)
end

function var_0_0.getConfigTable(arg_5_0)
	return arg_5_0.cfg
end

function var_0_0.getName(arg_6_0)
	return arg_6_0.name or arg_6_0:getConfig("name")
end

function var_0_0.getIcon(arg_7_0)
	return switch(arg_7_0.type, {
		[DROP_TYPE_ICON_FRAME] = function()
			return "Props/icon_frame"
		end,
		[DROP_TYPE_ISLAND_ITEM] = function()
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function()
			return "island/" .. arg_7_0:getConfig("cmd_icon")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function()
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function()
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function()
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			return "island/IslandFurnitureIcon/" .. arg_7_0:getConfig("icon")
		end
	}, function()
		return arg_7_0:getConfig("icon")
	end)
end

function var_0_0.getCount(arg_16_0)
	if arg_16_0.type == DROP_TYPE_OPERATION or arg_16_0.type == DROP_TYPE_LOVE_LETTER then
		return 1
	else
		return arg_16_0.count
	end
end

function var_0_0.isLoveLetter(arg_17_0)
	return arg_17_0.type == DROP_TYPE_LOVE_LETTER or arg_17_0.type == DROP_TYPE_ITEM and arg_17_0:getConfig("type") == Item.LOVE_LETTER_TYPE
end

function var_0_0.getOwnedCount(arg_18_0)
	return switch(arg_18_0.type, var_0_0.CountCase, var_0_0.CountDefault, arg_18_0)
end

function var_0_0.getSubClass(arg_19_0)
	return switch(arg_19_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_19_0)
end

function var_0_0.getDropRarity(arg_20_0)
	return switch(arg_20_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_20_0)
end

function var_0_0.getDropRarityDorm(arg_21_0)
	return switch(arg_21_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_21_0)
end

function var_0_0.DropTrans(arg_22_0, ...)
	return switch(arg_22_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_22_0, ...)
end

function var_0_0.AddItemOperation(arg_23_0)
	return switch(arg_23_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_23_0)
end

function var_0_0.MsgboxIntroSet(arg_24_0, ...)
	return switch(arg_24_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_24_0, ...)
end

function var_0_0.UpdateDropTpl(arg_25_0, ...)
	return switch(arg_25_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_25_0, ...)
end

function var_0_0.UpdateCustomDropTpl(arg_26_0, ...)
	return switch(arg_26_0.type, var_0_0.UpdateCustomDropCase, var_0_0.UpdateCustomDropDefault, arg_26_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_28_0)
			local var_28_0 = Item.getConfigData(id2ItemId(arg_28_0.id))

			arg_28_0.desc = var_28_0.display

			return var_28_0
		end,
		[DROP_TYPE_ITEM] = function(arg_29_0)
			local var_29_0 = Item.getConfigData(arg_29_0.id)

			arg_29_0.desc = var_29_0.display

			if var_29_0.type == Item.LOVE_LETTER_TYPE then
				arg_29_0.desc = string.gsub(arg_29_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_29_0.extra))
			end

			return var_29_0
		end,
		[DROP_TYPE_VITEM] = function(arg_30_0)
			local var_30_0 = Item.getConfigData(arg_30_0.id)

			assert(var_30_0, arg_30_0.id)

			arg_30_0.desc = var_30_0.display

			return var_30_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_31_0)
			local var_31_0 = Item.getConfigData(arg_31_0.id)

			arg_31_0.desc = string.gsub(var_31_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_31_0.count))

			return var_31_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_32_0)
			local var_32_0 = Equipment.getConfigData(arg_32_0.id)

			arg_32_0.desc = var_32_0.descrip

			return var_32_0
		end,
		[DROP_TYPE_SHIP] = function(arg_33_0)
			local var_33_0 = pg.ship_data_statistics[arg_33_0.id]
			local var_33_1, var_33_2, var_33_3 = ShipWordHelper.GetWordAndCV(var_33_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_33_0.desc = var_33_3 or i18n("ship_drop_desc_default")
			arg_33_0.ship = Ship.New({
				configId = arg_33_0.id,
				skin_id = arg_33_0.skinId,
				propose = arg_33_0.propose
			})
			arg_33_0.ship.remoulded = arg_33_0.remoulded
			arg_33_0.ship.virgin = arg_33_0.virgin

			return var_33_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_34_0)
			local var_34_0 = pg.furniture_data_template[arg_34_0.id]

			arg_34_0.desc = var_34_0.describe

			return var_34_0
		end,
		[DROP_TYPE_SKIN] = function(arg_35_0)
			local var_35_0 = pg.ship_skin_template[arg_35_0.id]

			if var_35_0.skin_type == ShipSkin.SKIN_TYPE_TB then
				local var_35_1, var_35_2, var_35_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_35_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_35_0.desc = var_35_3
			else
				local var_35_4, var_35_5, var_35_6 = ShipWordHelper.GetWordAndCV(arg_35_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_35_0.desc = var_35_6
			end

			return var_35_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_36_0)
			local var_36_0 = pg.ship_skin_template[arg_36_0.id]

			if var_36_0.skin_type == ShipSKin.SKIN_TYPE_TB then
				local var_36_1, var_36_2, var_36_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_36_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_36_0.desc = var_36_3
			else
				local var_36_4, var_36_5, var_36_6 = ShipWordHelper.GetWordAndCV(arg_36_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_36_0.desc = var_36_6
			end

			return var_36_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_37_0)
			local var_37_0 = pg.equip_skin_template[arg_37_0.id]

			arg_37_0.desc = var_37_0.desc

			return var_37_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_38_0)
			local var_38_0 = pg.world_item_data_template[arg_38_0.id]

			arg_38_0.desc = var_38_0.display

			return var_38_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_39_0)
			local var_39_0 = pg.item_data_frame[arg_39_0.id]

			arg_39_0.desc = var_39_0.desc

			return var_39_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_40_0)
			return pg.item_data_chat[arg_40_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_41_0)
			local var_41_0 = pg.spweapon_data_statistics[arg_41_0.id]

			arg_41_0.desc = var_41_0.descrip

			return var_41_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_42_0)
			local var_42_0 = pg.activity_ryza_item[arg_42_0.id]

			arg_42_0.item = AtelierMaterial.New({
				configId = arg_42_0.id
			})
			arg_42_0.desc = arg_42_0.item:GetDesc()

			return var_42_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_43_0)
			arg_43_0.ship = getProxy(BayProxy):getShipById(arg_43_0.count)

			local var_43_0 = pg.ship_data_statistics[arg_43_0.ship.configId]
			local var_43_1, var_43_2, var_43_3 = ShipWordHelper.GetWordAndCV(var_43_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_43_0.desc = var_43_3 or i18n("ship_drop_desc_default")

			return var_43_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_44_0)
			return arg_44_0.isWorldBuff and pg.world_SLGbuff_data[arg_44_0.id] or pg.strategy_data_template[arg_44_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_45_0)
			local var_45_0 = pg.emoji_template[arg_45_0.id]

			arg_45_0.name = var_45_0.item_name
			arg_45_0.desc = var_45_0.item_desc

			return var_45_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_46_0)
			local var_46_0 = WorldCollectionProxy.GetCollectionTemplate(arg_46_0.id)

			arg_46_0.desc = var_46_0.name

			return var_46_0
		end,
		[DROP_TYPE_META_PT] = function(arg_47_0)
			local var_47_0 = pg.ship_strengthen_meta[arg_47_0.id]
			local var_47_1 = Item.getConfigData(var_47_0.itemid)

			arg_47_0.desc = var_47_1.display

			return var_47_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_48_0)
			local var_48_0 = pg.activity_workbench_item[arg_48_0.id]

			arg_48_0.item = WorkBenchItem.New({
				configId = arg_48_0.id
			})
			arg_48_0.desc = arg_48_0.item:GetDesc()

			return var_48_0
		end,
		[DROP_TYPE_BUFF] = function(arg_49_0)
			local var_49_0 = pg.benefit_buff_template[arg_49_0.id]

			arg_49_0.desc = var_49_0.desc

			return var_49_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_50_0)
			local var_50_0 = pg.commander_data_template[arg_50_0.id]

			arg_50_0.desc = var_50_0.desc

			return var_50_0
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_51_0)
			local var_51_0 = pg.island_item_data_template[arg_51_0.id]

			arg_51_0.desc = ""

			return var_51_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_52_0)
			local var_52_0 = pg.island_ability_template[arg_52_0.id]

			arg_52_0.desc = ""

			return var_52_0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_53_0)
			arg_53_0.desc = ""

			return {}
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_54_0)
			local var_54_0 = pg.island_furniture_template[arg_54_0.id]

			arg_54_0.desc = ""

			return var_54_0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_55_0)
			local var_55_0 = pg.island_dress_template[arg_55_0.id]

			arg_55_0.desc = ""

			return var_55_0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_56_0)
			local var_56_0 = pg.island_skin_template[arg_56_0.id]

			arg_56_0.desc = ""

			return var_56_0
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_57_0)
			return pg.drop_data_restore[arg_57_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_58_0)
			local var_58_0 = pg.dorm3d_furniture_template[arg_58_0.id]

			arg_58_0.desc = var_58_0.desc

			return var_58_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_59_0)
			local var_59_0 = pg.dorm3d_gift[arg_59_0.id]

			arg_59_0.desc = var_59_0.display

			return var_59_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_60_0)
			local var_60_0 = pg.dorm3d_resource[arg_60_0.id]

			arg_60_0.desc = ""

			return var_60_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_61_0)
			local var_61_0 = pg.livingarea_cover[arg_61_0.id]

			arg_61_0.desc = var_61_0.desc

			return var_61_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_62_0)
			return pg.item_data_battleui[arg_62_0.id]
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_63_0)
			local var_63_0 = pg.activity_medal_template[arg_63_0.id].item

			return pg.item_virtual_data_statistics[var_63_0]
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_64_0)
			local var_64_0 = Item.getConfigData(arg_64_0.id)

			assert(var_64_0, arg_64_0.id)

			arg_64_0.desc = var_64_0.display

			return var_64_0
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_65_0)
			return pg.island_collection[arg_65_0.id]
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_66_0)
			return getIslandSeasonPtInfo()
		end
	}

	function var_0_0.ConfigDefault(arg_67_0)
		local var_67_0 = arg_67_0.type

		if tonumber(var_67_0) and var_67_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_67_1 = pg.activity_drop_type[var_67_0].relevance

			return var_67_1 and pg[var_67_1][arg_67_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_68_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_68_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_69_0)
			local var_69_0 = getProxy(BagProxy):getItemCountById(arg_69_0.id)

			if arg_69_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_69_0, 1), true
			else
				return var_69_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_70_0)
			local var_70_0 = arg_70_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_70_0], "equip groupId not exist")

			local var_70_1 = pg.equip_data_template.get_id_list_by_group[var_70_0]

			return underscore.reduce(var_70_1, 0, function(arg_71_0, arg_71_1)
				local var_71_0 = getProxy(EquipmentProxy):getEquipmentById(arg_71_1)

				return arg_71_0 + (var_71_0 and var_71_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_71_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_72_0)
			return getProxy(BayProxy):getConfigShipCount(arg_72_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_73_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_73_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_74_0)
			return arg_74_0.count, tobool(arg_74_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_75_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_75_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_76_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_76_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_77_0)
			if arg_77_0:getConfig("virtual_type") == 22 then
				local var_77_0 = getProxy(ActivityProxy):getActivityById(arg_77_0:getConfig("link_id"))

				return var_77_0 and var_77_0.data1 or 0, true
			end
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_78_0)
			local var_78_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_78_0.id)

			return (var_78_0 and var_78_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_78_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_79_0)
			local var_79_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_79_0.type].activity_id)

			if not var_79_0 then
				return 0
			end

			local var_79_1 = var_79_0:GetItemById(arg_79_0.id)

			return var_79_1 and var_79_1.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_80_0)
			local var_80_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_80_0.id)

			return var_80_0 and (not var_80_0:expiredType() or not not var_80_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_81_0)
			local var_81_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_81_0.id)

			return var_81_0 and (not var_81_0:expiredType() or not not var_81_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_82_0)
			local var_82_0 = nowWorld()

			if var_82_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_82_0:GetInventoryProxy():GetItemCount(arg_82_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_83_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_83_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_84_0)
			local var_84_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_84_0.id)

			return var_84_0 and var_84_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_85_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_85_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_86_0)
			local var_86_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_86_0.id)

			return 1
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_87_0)
			local var_87_0 = 0
			local var_87_1 = getProxy(IslandProxy):GetIsland()

			if var_87_1 then
				var_87_0 = var_87_1:GetInventoryAgency():GetOwnCount(arg_87_0.id)
			end

			return var_87_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_88_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_89_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_90_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_91_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_92_0)
			return 0
		end
	}

	function var_0_0.CountDefault(arg_93_0)
		local var_93_0 = arg_93_0.type

		if var_93_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_93_0].activity_id):getVitemNumber(arg_93_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_94_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_95_0)
			return Item.New(arg_95_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_96_0)
			return Item.New(arg_96_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_97_0)
			return Equipment.New(arg_97_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_98_0)
			return Item.New({
				count = 1,
				id = arg_98_0.id,
				extra = arg_98_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_99_0)
			return WorldItem.New(arg_99_0)
		end
	}

	function var_0_0.SubClassDefault(arg_100_0)
		assert(false, string.format("drop type %d without subClass", arg_100_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_101_0)
			return arg_101_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_102_0)
			return arg_102_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_103_0)
			return arg_103_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_104_0)
			return arg_104_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_105_0)
			return arg_105_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_106_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_107_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_108_0)
			return arg_108_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_109_0)
			return arg_109_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_110_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_111_0)
			return arg_111_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_112_0)
			return arg_112_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_113_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_114_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_115_0)
			return arg_115_0:getConfig("rare")
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_116_0)
			return arg_116_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_117_0)
			return arg_117_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_118_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_119_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_120_0)
			return arg_120_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_121_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_122_0)
			return ItemRarity.Gold
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_123_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_124_0)
		return arg_124_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_125_0)
		return arg_125_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_126_0)
			local var_126_0 = Drop.New({
				type = arg_126_0:getConfig("type"),
				id = arg_126_0:getConfig("resource_type"),
				count = arg_126_0:getConfig("resource_num") * arg_126_0.count
			})
			local var_126_1 = Drop.New({
				type = arg_126_0:getConfig("target_type"),
				id = arg_126_0:getConfig("target_id"),
				count = arg_126_0.count
			})

			PlayerConst.UpdateLinkActivity({
				var_126_1
			})

			var_126_0.name = string.format("%s(%s)", var_126_0:getName(), var_126_1:getName())

			return var_126_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_127_0)
			for iter_127_0, iter_127_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_127_1.id].pt == arg_127_0.id then
					return nil, arg_127_0
				end
			end

			return arg_127_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_128_0)
			if arg_128_0.id ~= 3 then
				return nil
			end

			return arg_128_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_129_0)
			return nil, arg_129_0
		end,
		[DROP_TYPE_VITEM] = function(arg_130_0, arg_130_1, arg_130_2)
			assert(arg_130_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_130_0.id)

			return switch(arg_130_0:getConfig("virtual_type"), {
				function()
					if arg_130_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_130_0
					end

					return arg_130_0
				end,
				[6] = function()
					local var_132_0 = arg_130_2.taskId
					local var_132_1 = getProxy(ActivityProxy)
					local var_132_2 = var_132_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_132_2 then
						local var_132_3 = var_132_2.data1KeyValueList[1]

						var_132_3[var_132_0] = defaultValue(var_132_3[var_132_0], 0) + arg_130_0.count

						var_132_1:updateActivity(var_132_2)
					end

					return nil, arg_130_0
				end,
				[13] = function()
					local var_133_0 = arg_130_0:getName()

					if not SkinCouponActivity.StaticExistActivity() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_133_0))

						return nil
					elseif SkinCouponActivity.StaticOwnMaxCntSkinCoupon() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_133_0))

						return nil
					else
						return arg_130_0, nil
					end
				end,
				[21] = function()
					return nil, arg_130_0
				end,
				[28] = function()
					local var_135_0 = Drop.New({
						type = arg_130_0.type,
						id = arg_130_0.id,
						count = math.floor(arg_130_0.count / 1000)
					})
					local var_135_1 = Drop.New({
						type = arg_130_0.type,
						id = arg_130_0.id,
						count = arg_130_0.count - math.floor(arg_130_0.count / 1000)
					})

					return var_135_0, var_135_1
				end
			}, function()
				return arg_130_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_137_0, arg_137_1)
			if Ship.isMetaShipByConfigID(arg_137_0.id) and Player.isMetaShipNeedToTrans(arg_137_0.id) then
				local var_137_0 = table.indexof(arg_137_1, arg_137_0.id, 1)

				if var_137_0 then
					table.remove(arg_137_1, var_137_0)
				else
					local var_137_1 = Player.metaShip2Res(arg_137_0.id)
					local var_137_2 = Drop.New(var_137_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_137_0.id, var_137_2)

					return arg_137_0, var_137_2
				end
			end

			return arg_137_0
		end,
		[DROP_TYPE_SKIN] = function(arg_138_0)
			arg_138_0.isNew = not getProxy(ShipSkinProxy):hasOldNonLimitSkin(arg_138_0.id)

			return arg_138_0
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_139_0)
			local var_139_0 = getProxy(PlayerProxy):getRawData()
			local var_139_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_139_0:updateMedalList({
				{
					key = arg_139_0.id,
					value = var_139_1
				}
			})

			return arg_139_0
		end,
		[DROP_TYPE_BUFF] = function(arg_140_0)
			return nil, arg_140_0
		end
	}

	function var_0_0.TransDefault(arg_141_0)
		return arg_141_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_142_0)
			local var_142_0 = id2res(arg_142_0.id)

			assert(var_142_0, "res should be defined: " .. arg_142_0.id)

			local var_142_1 = getProxy(PlayerProxy)
			local var_142_2 = var_142_1:getData()

			var_142_2:addResources({
				[var_142_0] = arg_142_0.count
			})
			var_142_1:updatePlayer(var_142_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_143_0)
			if arg_143_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_143_0 = getProxy(BagProxy):getItemCountById(arg_143_0.id)
				local var_143_1 = math.min(arg_143_0:getConfig("max_num") - var_143_0, arg_143_0.count)

				if var_143_1 > 0 then
					getProxy(BagProxy):addItemById(arg_143_0.id, var_143_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_143_0.id, arg_143_0.count, arg_143_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_144_0)
			local var_144_0 = arg_144_0:getSubClass()

			getProxy(BagProxy):addItemById(var_144_0.id, var_144_0.count, var_144_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_145_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_145_0.id, arg_145_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_146_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_147_0)
			local var_147_0 = getProxy(DormProxy)
			local var_147_1 = Furniture.New({
				id = arg_147_0.id,
				count = arg_147_0.count
			})

			if var_147_1:isRecordTime() then
				var_147_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_147_0:AddFurniture(var_147_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_148_0)
			local var_148_0 = getProxy(ShipSkinProxy)
			local var_148_1 = ShipSkin.New({
				id = arg_148_0.id
			})

			var_148_0:addSkin(var_148_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_149_0)
			arg_149_0 = arg_149_0:getSubClass()

			assert(arg_149_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_149_0.id)
			switch(arg_149_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_149_0.id, arg_149_0.count)
				end,
				function()
					local var_151_0 = getProxy(ActivityProxy)
					local var_151_1 = arg_149_0:getConfig("link_id")
					local var_151_2

					if var_151_1 > 0 then
						var_151_2 = var_151_0:getActivityById(var_151_1)
					else
						var_151_2 = var_151_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_151_2 and not var_151_2:isEnd() then
						if not table.contains(var_151_2.data1_list, arg_149_0.id) then
							table.insert(var_151_2.data1_list, arg_149_0.id)
						end

						var_151_0:updateActivity(var_151_2)
					end
				end,
				function()
					local var_152_0 = getProxy(ActivityProxy)
					local var_152_1 = var_152_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_152_0, iter_152_1 in ipairs(var_152_1) do
						iter_152_1.data1 = iter_152_1.data1 + arg_149_0.count

						local var_152_2 = iter_152_1:getConfig("config_id")
						local var_152_3 = pg.activity_vote[var_152_2]

						if var_152_3 and var_152_3.ticket_id_period == arg_149_0.id then
							iter_152_1.data3 = iter_152_1.data3 + arg_149_0.count
						end

						var_152_0:updateActivity(iter_152_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_149_0.id,
							ptCount = arg_149_0.count
						})
					end
				end,
				[4] = function()
					local var_153_0 = getProxy(ColoringProxy):getColorItems()

					var_153_0[arg_149_0.id] = (var_153_0[arg_149_0.id] or 0) + arg_149_0.count
				end,
				[6] = function()
					local var_154_0 = getProxy(ActivityProxy)
					local var_154_1 = var_154_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_154_1 then
						var_154_1.data3 = var_154_1.data3 + arg_149_0.count

						var_154_0:updateActivity(var_154_1)
					end
				end,
				[7] = function()
					local var_155_0 = getProxy(ChapterProxy)

					var_155_0:updateRemasterTicketsNum(math.min(var_155_0.remasterTickets + arg_149_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_156_0 = getProxy(ActivityProxy)
					local var_156_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_156_1 then
						var_156_1.data1_list[1] = var_156_1.data1_list[1] + arg_149_0.count

						var_156_0:updateActivity(var_156_1)
					end
				end,
				[11] = function()
					local var_157_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_157_0 and not var_157_0:isEnd() then
						var_157_0.data1 = var_157_0.data1 + arg_149_0.count
					end
				end,
				[12] = function()
					local var_158_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_158_0 and not var_158_0:isEnd() then
						var_158_0.data1KeyValueList[1][arg_149_0.id] = (var_158_0.data1KeyValueList[1][arg_149_0.id] or 0) + arg_149_0.count
					end
				end,
				[13] = function()
					SkinCouponActivity.AddSkinCoupon(arg_149_0.id, arg_149_0.count)
				end,
				[14] = function()
					local var_160_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_149_0.id then
						var_160_0:AddSummonPt(arg_149_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_149_0.id then
						var_160_0:AddSummonPtOld(arg_149_0.count)
					end
				end,
				[15] = function()
					local var_161_0 = getProxy(ActivityProxy)
					local var_161_1 = var_161_0:getActivityById(arg_149_0:getConfig("link_id"))

					if not var_161_1 or var_161_1:isEnd() then
						return
					end

					if var_161_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE then
						local var_161_2 = pg.activity_event_grid[var_161_1.data1]

						if arg_149_0.id == var_161_2.ticket_item then
							var_161_1.data2 = var_161_1.data2 + arg_149_0.count
						elseif arg_149_0.id == var_161_2.explore_item then
							var_161_1.data3 = var_161_1.data3 + arg_149_0.count
						end
					elseif var_161_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_EXPEDITION then
						var_161_1.data3 = var_161_1.data3 + arg_149_0.count
					end

					var_161_0:updateActivity(var_161_1)
				end,
				[16] = function()
					local var_162_0 = getProxy(ActivityProxy)
					local var_162_1 = var_162_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_162_0, iter_162_1 in pairs(var_162_1) do
						if iter_162_1 and not iter_162_1:isEnd() and arg_149_0.id == iter_162_1:getConfig("config_id") then
							iter_162_1.data1 = iter_162_1.data1 + arg_149_0.count

							var_162_0:updateActivity(iter_162_1)
						end
					end
				end,
				[20] = function()
					local var_163_0 = getProxy(BagProxy)
					local var_163_1 = pg.gameset.urpt_chapter_max.description
					local var_163_2 = var_163_1[1]
					local var_163_3 = var_163_1[2]
					local var_163_4 = var_163_0:GetLimitCntById(var_163_2)
					local var_163_5 = math.min(var_163_3 - var_163_4, arg_149_0.count)

					if var_163_5 > 0 then
						var_163_0:addItemById(var_163_2, var_163_5)
						var_163_0:AddLimitCnt(var_163_2, var_163_5)
					end
				end,
				[21] = function()
					local var_164_0 = getProxy(ActivityProxy)
					local var_164_1 = var_164_0:getActivityById(arg_149_0:getConfig("link_id"))

					if var_164_1 and not var_164_1:isEnd() then
						var_164_1.data2 = 1

						var_164_0:updateActivity(var_164_1)
					end
				end,
				[22] = function()
					local var_165_0 = getProxy(ActivityProxy)
					local var_165_1 = var_165_0:getActivityById(arg_149_0:getConfig("link_id"))

					if var_165_1 and not var_165_1:isEnd() then
						var_165_1.data1 = var_165_1.data1 + arg_149_0.count

						var_165_0:updateActivity(var_165_1)
					end
				end,
				[23] = function()
					local var_166_0 = (function()
						for iter_167_0, iter_167_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_149_0.id == iter_167_1[1] then
								return iter_167_1[2]
							end
						end
					end)()

					assert(var_166_0)

					local var_166_1 = getProxy(PlayerProxy)
					local var_166_2 = var_166_1:getData()

					var_166_2:addExpToLevel(var_166_0)
					var_166_1:updatePlayer(var_166_2)
				end,
				[24] = function()
					local var_168_0 = arg_149_0:getConfig("link_id")
					local var_168_1 = getProxy(ActivityProxy):getActivityById(var_168_0)

					if var_168_1 and not var_168_1:isEnd() and var_168_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_168_1.data2 = var_168_1.data2 + arg_149_0.count

						getProxy(ActivityProxy):updateActivity(var_168_1)
					end
				end,
				[25] = function()
					local var_169_0 = getProxy(ActivityProxy)
					local var_169_1 = var_169_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_169_1 and not var_169_1:isEnd() then
						var_169_1.data1 = var_169_1.data1 - 1

						if not table.contains(var_169_1.data1_list, arg_149_0.id) then
							table.insert(var_169_1.data1_list, arg_149_0.id)
						end

						var_169_0:updateActivity(var_169_1)

						local var_169_2 = arg_149_0:getConfig("link_id")

						if var_169_2 > 0 then
							local var_169_3 = var_169_0:getActivityById(var_169_2)

							if var_169_3 and not var_169_3:isEnd() then
								var_169_3.data1 = var_169_3.data1 + 1

								var_169_0:updateActivity(var_169_3)
							end
						end
					end
				end,
				[26] = function()
					local var_170_0 = getProxy(ActivityProxy)
					local var_170_1 = Clone(var_170_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_170_1 and not var_170_1:isEnd() then
						var_170_1.data1 = var_170_1.data1 + arg_149_0.count

						var_170_0:updateActivity(var_170_1)
					end
				end,
				[27] = function()
					local var_171_0 = getProxy(ActivityProxy)
					local var_171_1 = Clone(var_171_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_171_1 and not var_171_1:isEnd() then
						var_171_1:AddExp(arg_149_0.count)
						var_171_0:updateActivity(var_171_1)
					end
				end,
				[28] = function()
					local var_172_0 = getProxy(ActivityProxy)
					local var_172_1 = Clone(var_172_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_172_1 and not var_172_1:isEnd() then
						var_172_1:AddGold(arg_149_0.count)
						var_172_0:updateActivity(var_172_1)
					end
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_175_0 = arg_149_0:getConfig("link_id")
					local var_175_1 = getProxy(ActivityProxy):getActivityById(var_175_0)

					if var_175_1 and not var_175_1:isEnd() then
						var_175_1.data1 = var_175_1.data1 + arg_149_0.count

						getProxy(ActivityProxy):updateActivity(var_175_1)
					end
				end,
				[102] = function()
					local var_176_0 = arg_149_0:getConfig("link_id")
					local var_176_1 = pg.activity_template[var_176_0].type

					switch(var_176_1, {
						[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = function()
							getProxy(CityRebuildProxy):AddPt(var_176_0, arg_149_0.count)
						end
					})
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_178_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_178_0.id, arg_178_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_179_0)
			local var_179_0 = getProxy(BayProxy)
			local var_179_1 = var_179_0:getShipById(arg_179_0.count)

			if var_179_1 then
				var_179_1:unlockActivityNpc(0)
				var_179_0:updateShip(var_179_1)
				getProxy(CollectionProxy):flushCollection(var_179_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_180_0)
			nowWorld():GetInventoryProxy():AddItem(arg_180_0.id, arg_180_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_181_0)
			local var_181_0 = getProxy(AttireProxy)
			local var_181_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_181_2 = IconFrame.New({
				id = arg_181_0.id
			})
			local var_181_3 = var_181_1 + var_181_2:getConfig("time_second")

			var_181_2:updateData({
				isNew = true,
				end_time = var_181_3
			})
			var_181_0:addAttireFrame(var_181_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_181_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_182_0)
			local var_182_0 = getProxy(AttireProxy)
			local var_182_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_182_2 = ChatFrame.New({
				id = arg_182_0.id
			})
			local var_182_3 = var_182_1 + var_182_2:getConfig("time_second")

			var_182_2:updateData({
				isNew = true,
				end_time = var_182_3
			})
			var_182_0:addAttireFrame(var_182_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_182_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_183_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_183_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_183_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_184_0)
			nowWorld():GetCollectionProxy():Unlock(arg_184_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_185_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_185_0.id):addPT(arg_185_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_186_0)
			local var_186_0 = arg_186_0.id
			local var_186_1 = arg_186_0.count
			local var_186_2 = getProxy(ShipSkinProxy)
			local var_186_3 = var_186_2:getSkinById(var_186_0)

			if var_186_3 and var_186_3:isExpireType() then
				local var_186_4 = var_186_1 + var_186_3.endTime
				local var_186_5 = ShipSkin.New({
					id = var_186_0,
					end_time = var_186_4
				})

				var_186_2:addSkin(var_186_5)
			elseif not var_186_3 then
				local var_186_6 = var_186_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_186_7 = ShipSkin.New({
					id = var_186_0,
					end_time = var_186_6
				})

				var_186_2:addSkin(var_186_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_187_0)
			local var_187_0 = arg_187_0.id
			local var_187_1 = pg.benefit_buff_template[var_187_0]

			assert(var_187_1 and var_187_1.act_id > 0, "should exist act id")

			local var_187_2 = getProxy(ActivityProxy):getActivityById(var_187_1.act_id)

			if var_187_2 and not var_187_2:isEnd() then
				local var_187_3 = var_187_1.max_time
				local var_187_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_187_3

				var_187_2:AddBuff(ActivityBuff.New(var_187_2.id, var_187_0, var_187_4))
				getProxy(ActivityProxy):updateActivity(var_187_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_188_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_189_0)
			getProxy(ApartmentProxy):ModifyRoom(arg_189_0:getConfig("room_id"), function(arg_190_0)
				arg_190_0:AddFurnitureByID(arg_189_0.id)
			end)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_191_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_191_0.id, arg_191_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_192_0)
			getProxy(ApartmentProxy):ModifyApartment(arg_192_0:getConfig("ship_group"), function(arg_193_0)
				arg_193_0:addSkin(arg_192_0.id)
			end)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_194_0)
			local var_194_0 = getProxy(LivingAreaCoverProxy)
			local var_194_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_194_0.id
			})

			var_194_0:UpdateCover(var_194_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_194_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_194_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_195_0)
			local var_195_0 = getProxy(AttireProxy)
			local var_195_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_195_2 = CombatUIStyle.New({
				id = arg_195_0.id
			})

			var_195_2:setUnlock()
			var_195_2:setNew()
			var_195_0:addAttireFrame(var_195_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_195_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_196_0)
			local var_196_0 = getProxy(IslandProxy):GetIsland()

			if not var_196_0 then
				return
			end

			var_196_0:GetInventoryAgency():AddItem(IslandItem.New({
				id = arg_196_0.id,
				num = arg_196_0.count
			}))
		end
	}

	function var_0_0.AddItemDefault(arg_197_0)
		if arg_197_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_197_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_197_0.type].activity_id)

			if arg_197_0.type == DROP_TYPE_RYZA_DROP then
				if var_197_0 and not var_197_0:isEnd() then
					var_197_0:AddItem(AtelierMaterial.New({
						configId = arg_197_0.id,
						count = arg_197_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_197_0)
				end
			elseif var_197_0 and not var_197_0:isEnd() then
				var_197_0:addVitemNumber(arg_197_0.id, arg_197_0.count)
				getProxy(ActivityProxy):updateActivity(var_197_0)
			end
		else
			print("can not handle this type>>" .. arg_197_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_198_0, arg_198_1, arg_198_2)
			setText(arg_198_2, arg_198_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_199_0, arg_199_1, arg_199_2)
			local var_199_0 = arg_199_0:getConfig("display")

			if arg_199_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_199_0 = string.gsub(var_199_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_199_0.extra))
			elseif arg_199_0:getConfig("combination_display") ~= nil then
				local var_199_1 = arg_199_0:getConfig("combination_display")

				if var_199_1 and #var_199_1 > 0 then
					var_199_0 = Item.StaticCombinationDisplay(var_199_1)
				end
			end

			setText(arg_199_2, SwitchSpecialChar(var_199_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_200_0, arg_200_1, arg_200_2)
			setText(arg_200_2, arg_200_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_201_0, arg_201_1, arg_201_2)
			local var_201_0 = arg_201_0:getConfig("skin_id")
			local var_201_1, var_201_2, var_201_3 = ShipWordHelper.GetWordAndCV(var_201_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_201_2, var_201_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_202_0, arg_202_1, arg_202_2)
			local var_202_0 = arg_202_0:getConfig("skin_id")
			local var_202_1, var_202_2, var_202_3 = ShipWordHelper.GetWordAndCV(var_202_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_202_2, var_202_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_203_0, arg_203_1, arg_203_2)
			setText(arg_203_2, arg_203_1.name or arg_203_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_204_0, arg_204_1, arg_204_2)
			local var_204_0 = arg_204_0:getConfig("desc")

			for iter_204_0, iter_204_1 in ipairs({
				arg_204_0.count
			}) do
				var_204_0 = string.gsub(var_204_0, "$" .. iter_204_0, iter_204_1)
			end

			setText(arg_204_2, var_204_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_205_0, arg_205_1, arg_205_2)
			setText(arg_205_2, arg_205_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_206_0, arg_206_1, arg_206_2)
			setText(arg_206_2, arg_206_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_207_0, arg_207_1, arg_207_2)
			local var_207_0 = arg_207_0:getConfig("desc")
			local var_207_1 = _.map(arg_207_0:getConfig("equip_type"), function(arg_208_0)
				return EquipType.Type2Name2(arg_208_0)
			end)

			setText(arg_207_2, var_207_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_207_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_209_0, arg_209_1, arg_209_2)
			setText(arg_209_2, arg_209_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_210_0, arg_210_1, arg_210_2)
			setText(arg_210_2, arg_210_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_211_0, arg_211_1, arg_211_2, arg_211_3)
			local var_211_0 = WorldCollectionProxy.GetCollectionType(arg_211_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_211_2, i18n("world_" .. var_211_0 .. "_desc", arg_211_0:getConfig("name")))
			setText(arg_211_3, i18n("world_" .. var_211_0 .. "_name", arg_211_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_212_0, arg_212_1, arg_212_2)
			setText(arg_212_2, arg_212_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_213_0, arg_213_1, arg_213_2)
			setText(arg_213_2, arg_213_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_214_0, arg_214_1, arg_214_2)
			setText(arg_214_2, arg_214_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_215_0, arg_215_1, arg_215_2)
			local var_215_0 = string.gsub(arg_215_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_215_0.count))

			setText(arg_215_2, SwitchSpecialChar(var_215_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_216_0, arg_216_1, arg_216_2)
			setText(arg_216_2, arg_216_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_217_0, arg_217_1, arg_217_2)
			setText(arg_217_2, arg_217_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_218_0, arg_218_1, arg_218_2)
			setText(arg_218_2, arg_218_0:getConfig("desc"))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_219_0, arg_219_1, arg_219_2)
			setText(arg_219_2, arg_219_0:getConfig("display"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_220_0, arg_220_1, arg_220_2)
			setText(arg_220_2, arg_220_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_221_0, arg_221_1, arg_221_2)
			setText(arg_221_2, arg_221_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_222_0, arg_222_1, arg_222_2)
			setText(arg_222_2, "")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_223_0, arg_223_1, arg_223_2)
			setText(arg_223_2, "")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_224_0, arg_224_1, arg_224_2)
			setText(arg_224_2, "")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_225_0, arg_225_1, arg_225_2)
			setText(arg_225_2, "")
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_226_0, arg_226_1, arg_226_2)
			setText(arg_226_2, "")
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_227_0, arg_227_1, arg_227_2)
		if arg_227_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_227_2, arg_227_0:getConfig("display"))
		else
			setText(arg_227_2, arg_227_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_228_0, arg_228_1, arg_228_2)
			if arg_228_0.id == PlayerConst.ResStoreGold or arg_228_0.id == PlayerConst.ResStoreOil then
				arg_228_2 = arg_228_2 or {}
				arg_228_2.frame = "frame_store"
			end

			updateItem(arg_228_1, Item.New({
				id = id2ItemId(arg_228_0.id)
			}), arg_228_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_229_0, arg_229_1, arg_229_2)
			updateItem(arg_229_1, arg_229_0:getSubClass(), arg_229_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_230_0, arg_230_1, arg_230_2)
			updateEquipment(arg_230_1, arg_230_0:getSubClass(), arg_230_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_231_0, arg_231_1, arg_231_2)
			updateShip(arg_231_1, arg_231_0.ship, arg_231_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_232_0, arg_232_1, arg_232_2)
			updateShip(arg_232_1, arg_232_0.ship, arg_232_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_233_0, arg_233_1, arg_233_2)
			updateFurniture(arg_233_1, arg_233_0, arg_233_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_234_0, arg_234_1, arg_234_2)
			arg_234_2.isWorldBuff = arg_234_0.isWorldBuff

			updateStrategy(arg_234_1, arg_234_0, arg_234_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_235_0, arg_235_1, arg_235_2)
			arg_235_2.isSkin = true
			arg_235_2.isNew = arg_235_0.isNew

			updateShip(arg_235_1, Ship.New({
				configId = tonumber(arg_235_0:getConfig("ship_group") .. "1"),
				skin_id = arg_235_0.id
			}), arg_235_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_236_0, arg_236_1, arg_236_2)
			local var_236_0 = setmetatable({
				count = arg_236_0.count
			}, {
				__index = arg_236_0:getConfigTable()
			})

			updateEquipmentSkin(arg_236_1, var_236_0, arg_236_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_237_0, arg_237_1, arg_237_2)
			updateItem(arg_237_1, Item.New({
				id = arg_237_0.id
			}), arg_237_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_238_0, arg_238_1, arg_238_2)
			updateWorldItem(arg_238_1, WorldItem.New({
				id = arg_238_0.id
			}), arg_238_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_239_0, arg_239_1, arg_239_2)
			updateWorldCollection(arg_239_1, arg_239_0, arg_239_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_240_0, arg_240_1, arg_240_2)
			updateAttire(arg_240_1, AttireConst.TYPE_CHAT_FRAME, arg_240_0:getConfigTable(), arg_240_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_241_0, arg_241_1, arg_241_2)
			updateAttire(arg_241_1, AttireConst.TYPE_ICON_FRAME, arg_241_0:getConfigTable(), arg_241_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_242_0, arg_242_1, arg_242_2)
			updateEmoji(arg_242_1, arg_242_0:getConfigTable(), arg_242_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_243_0, arg_243_1, arg_243_2)
			arg_243_2.count = 1

			updateItem(arg_243_1, arg_243_0:getSubClass(), arg_243_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_244_0, arg_244_1, arg_244_2)
			updateSpWeapon(arg_244_1, SpWeapon.New({
				id = arg_244_0.id
			}), arg_244_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_245_0, arg_245_1, arg_245_2)
			updateItem(arg_245_1, Item.New({
				id = arg_245_0:getConfig("id")
			}), arg_245_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_246_0, arg_246_1, arg_246_2)
			arg_246_2.isSkin = true
			arg_246_2.isTimeLimit = true
			arg_246_2.count = 1

			updateShip(arg_246_1, Ship.New({
				configId = tonumber(arg_246_0:getConfig("ship_group") .. "1"),
				skin_id = arg_246_0.id
			}), arg_246_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_247_0, arg_247_1, arg_247_2)
			AtelierMaterial.UpdateRyzaItem(arg_247_1, arg_247_0.item, arg_247_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_248_0, arg_248_1, arg_248_2)
			WorkBenchItem.UpdateDrop(arg_248_1, arg_248_0.item, arg_248_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_249_0, arg_249_1, arg_249_2)
			WorkBenchItem.UpdateDrop(arg_249_1, WorkBenchItem.New({
				configId = arg_249_0.id,
				count = arg_249_0.count
			}), arg_249_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_250_0, arg_250_1, arg_250_2)
			updateBuff(arg_250_1, arg_250_0.id, arg_250_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_251_0, arg_251_1, arg_251_2)
			updateCommander(arg_251_1, arg_251_0, arg_251_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_252_0, arg_252_1, arg_252_2)
			updateCover(arg_252_1, arg_252_0, arg_252_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_253_0, arg_253_1, arg_253_2)
			updateAttireCombatUI(arg_253_1, AttireConst.TYPE_ICON_FRAME, arg_253_0:getConfigTable(), arg_253_2)
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_254_0, arg_254_1, arg_254_2)
			updateActivityMedal(arg_254_1, arg_254_0:getConfigTable(), arg_254_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_255_0, arg_255_1, arg_255_2)
		updateDefaultIconTpl(arg_255_1, arg_255_0, arg_255_2)
	end

	var_0_0.UpdateCustomDropCase = {
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_256_0, arg_256_1, arg_256_2)
			updateDorm3dIcon(arg_256_1, arg_256_0, arg_256_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_257_0, arg_257_1, arg_257_2)
			updateDorm3dIcon(arg_257_1, arg_257_0, arg_257_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_258_0, arg_258_1, arg_258_2)
			updateDorm3dIcon(arg_258_1, arg_258_0, arg_258_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_259_0, arg_259_1, arg_259_2)
			updateIslandItem(arg_259_1, arg_259_0, arg_259_2)
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_260_0, arg_260_1, arg_260_2)
			updateIslandUnlock(arg_260_1, arg_260_0, arg_260_2)
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_261_0, arg_261_1, arg_261_2)
			updateIslandInvitation(arg_261_1, arg_261_0, arg_261_2)
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_262_0, arg_262_1, arg_262_2)
			updateIslandSeasonPt(arg_262_1, arg_262_0, arg_262_2)
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_263_0, arg_263_1, arg_263_2)
			updateIslandWatherCollect(arg_263_1, arg_263_0, arg_263_2)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_264_0, arg_264_1, arg_264_2)
			updateIslandFurniture(arg_264_1, arg_264_0, arg_264_2)
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_265_0, arg_265_1, arg_265_2)
			updateItem(arg_265_1, Item.New({
				id = arg_265_0.id
			}), arg_265_2)
		end
	}

	function var_0_0.UpdateCustomDropDefault(arg_266_0, arg_266_1, arg_266_2)
		if arg_266_2.style == "dorm" then
			updateDorm3dIcon(arg_266_1, arg_266_0, arg_266_2)
		else
			warning(string.format("without dropType %d in updateCustomDrop", arg_266_0.type))
		end
	end
end

return var_0_0
