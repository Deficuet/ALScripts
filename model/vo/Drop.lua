local var_0_0 = class("Drop", import(".BaseVO"))

function var_0_0.__index(arg_1_0, arg_1_1)
	if arg_1_1 == "desc" then
		return HXSet.hxLan(rawget(arg_1_0, "_desc"))
	end

	return var_0_0[arg_1_1]
end

function var_0_0.__newindex(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1 == "desc" then
		rawset(arg_2_0, "_desc", arg_2_2)
	else
		rawset(arg_2_0, arg_2_1, arg_2_2)
	end
end

function var_0_0.Create(arg_3_0)
	local var_3_0 = {}

	var_3_0.type, var_3_0.id, var_3_0.count = unpack(arg_3_0)

	return var_0_0.New(var_3_0)
end

function var_0_0.Change(arg_4_0)
	if not getmetatable(arg_4_0) then
		setmetatable(arg_4_0, var_0_0)

		arg_4_0.class = var_0_0

		arg_4_0:InitConfig()
	else
		assert(instanceof(arg_4_0, var_0_0))
	end

	return arg_4_0
end

function var_0_0.Ctor(arg_5_0, arg_5_1)
	assert(not getmetatable(arg_5_1), "drop data should not has metatable")

	for iter_5_0, iter_5_1 in pairs(arg_5_1) do
		arg_5_0[iter_5_0] = iter_5_1
	end

	arg_5_0:InitConfig()
end

function var_0_0.InitConfig(arg_6_0)
	if not var_0_0.inited then
		var_0_0.InitSwitch()
	end

	arg_6_0.configId = arg_6_0.id
	arg_6_0.cfg = switch(arg_6_0.type, var_0_0.ConfigCase, var_0_0.ConfigDefault, arg_6_0)
end

function var_0_0.getConfigTable(arg_7_0)
	return arg_7_0.cfg
end

function var_0_0.getName(arg_8_0)
	return arg_8_0.name or arg_8_0:getConfig("name")
end

function var_0_0.getIcon(arg_9_0)
	return switch(arg_9_0.type, {
		[DROP_TYPE_ICON_FRAME] = function()
			return "Props/icon_frame"
		end,
		[DROP_TYPE_ISLAND_ITEM] = function()
			local var_11_0 = arg_9_0:getConfig("icon_normal")

			return var_11_0 ~= "" and var_11_0 or "island/" .. arg_9_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function()
			return "island/" .. arg_9_0:getConfig("cmd_icon")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function()
			local var_13_0 = pg.island_item_data_template[arg_9_0:getConfig("invite_item")].icon

			return "island/" .. var_13_0
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function()
			return "island/" .. arg_9_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function()
			return "island/" .. arg_9_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			return "island/IslandFurnitureIcon/" .. arg_9_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function()
			return "island/" .. arg_9_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function()
			return arg_9_0:getConfig("icon_normal")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function()
			return "island/IslandDressIcon/" .. arg_9_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_ACTION] = function()
			return "island/IslandActionIcon/" .. arg_9_0:getConfig("resource")
		end,
		[DROP_TYPE_ISLAND_SKIN] = function()
			return arg_9_0:getConfig("icon_normal")
		end
	}, function()
		return arg_9_0:getConfig("icon")
	end)
end

function var_0_0.getDefaultIcon(arg_23_0)
	return switch(arg_23_0.type, {
		[DROP_TYPE_DORM3D_FURNITURE] = function()
			return "props/missing_icon_dorm"
		end,
		[DROP_TYPE_DORM3D_GIFT] = function()
			return "props/missing_icon_dorm"
		end,
		[DROP_TYPE_DORM3D_SKIN] = function()
			return "props/missing_icon_dorm"
		end,
		[DROP_TYPE_ISLAND_ITEM] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_OVERFLOWITEM] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_DRESS] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_SKIN] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_COLLECTION_FRAMENT] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_ACTION] = function()
			return "props/missing_icon_island"
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function()
			return "props/missing_icon_island"
		end
	}, function()
		return "props/missing_icon"
	end)
end

function var_0_0.getIslandRarity(arg_40_0)
	return switch(arg_40_0.type, {
		[DROP_TYPE_ISLAND_ITEM] = function()
			return arg_40_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			return arg_40_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function()
			return arg_40_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function()
			return IslandItemRarity.ORANGE
		end,
		[DROP_TYPE_ISLAND_ACTION] = function()
			return IslandItemRarity.ORANGE
		end,
		[DROP_TYPE_ITEM] = function()
			return IslandItemRarity.ORANGE
		end,
		[DROP_TYPE_VITEM] = function()
			return IslandItemRarity.ORANGE
		end
	}, function()
		return IslandItemRarity.GREY
	end)
end

function var_0_0.getCount(arg_49_0)
	if arg_49_0.type == DROP_TYPE_OPERATION or arg_49_0.type == DROP_TYPE_LOVE_LETTER or MallActivity.IsStaffDrop(arg_49_0) then
		return 1
	else
		return arg_49_0.count
	end
end

function var_0_0.isLoveLetter(arg_50_0)
	return arg_50_0.type == DROP_TYPE_LOVE_LETTER or arg_50_0.type == DROP_TYPE_ITEM and arg_50_0:getConfig("type") == Item.LOVE_LETTER_TYPE
end

function var_0_0.getOwnedCount(arg_51_0)
	return switch(arg_51_0.type, var_0_0.CountCase, var_0_0.CountDefault, arg_51_0)
end

function var_0_0.getSubClass(arg_52_0)
	return switch(arg_52_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_52_0)
end

function var_0_0.getDropRarity(arg_53_0)
	return switch(arg_53_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_53_0)
end

function var_0_0.getDropRarityDorm(arg_54_0)
	return switch(arg_54_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_54_0)
end

function var_0_0.DropTrans(arg_55_0, ...)
	return switch(arg_55_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_55_0, ...)
end

function var_0_0.AddItemOperation(arg_56_0)
	return switch(arg_56_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_56_0)
end

function var_0_0.MsgboxIntroSet(arg_57_0, ...)
	return switch(arg_57_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_57_0, ...)
end

function var_0_0.UpdateDropTpl(arg_58_0, ...)
	return switch(arg_58_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_58_0, ...)
end

function var_0_0.UpdateCustomDropTpl(arg_59_0, ...)
	return switch(arg_59_0.type, var_0_0.UpdateCustomDropCase, var_0_0.UpdateCustomDropDefault, arg_59_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_61_0)
			local var_61_0 = Item.getConfigData(id2ItemId(arg_61_0.id))

			arg_61_0.desc = var_61_0.display

			return var_61_0
		end,
		[DROP_TYPE_ITEM] = function(arg_62_0)
			local var_62_0 = Item.getConfigData(arg_62_0.id)

			arg_62_0.desc = var_62_0.display

			if var_62_0.type == Item.LOVE_LETTER_TYPE then
				arg_62_0.desc = string.gsub(arg_62_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_62_0.extra))
			end

			return var_62_0
		end,
		[DROP_TYPE_VITEM] = function(arg_63_0)
			local var_63_0 = Item.getConfigData(arg_63_0.id)

			assert(var_63_0, arg_63_0.id)

			arg_63_0.desc = var_63_0.display

			return var_63_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_64_0)
			local var_64_0 = Item.getConfigData(arg_64_0.id)

			arg_64_0.desc = string.gsub(var_64_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_64_0.count))

			return var_64_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_65_0)
			local var_65_0 = Equipment.getConfigData(arg_65_0.id)

			arg_65_0.desc = var_65_0.descrip

			return var_65_0
		end,
		[DROP_TYPE_SHIP] = function(arg_66_0)
			local var_66_0 = pg.ship_data_statistics[arg_66_0.id]
			local var_66_1, var_66_2, var_66_3 = ShipWordHelper.GetWordAndCV(var_66_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_66_0.desc = var_66_3 or i18n("ship_drop_desc_default")
			arg_66_0.ship = Ship.New({
				configId = arg_66_0.id,
				skin_id = arg_66_0.skinId,
				propose = arg_66_0.propose
			})
			arg_66_0.ship.remoulded = arg_66_0.remoulded
			arg_66_0.ship.virgin = arg_66_0.virgin

			return var_66_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_67_0)
			local var_67_0 = pg.furniture_data_template[arg_67_0.id]

			arg_67_0.desc = var_67_0.describe

			return var_67_0
		end,
		[DROP_TYPE_SKIN] = function(arg_68_0)
			local var_68_0 = pg.ship_skin_template[arg_68_0.id]

			if var_68_0.skin_type == ShipSkin.SKIN_TYPE_TB then
				local var_68_1, var_68_2, var_68_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_68_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_68_0.desc = var_68_3
			else
				local var_68_4, var_68_5, var_68_6 = ShipWordHelper.GetWordAndCV(arg_68_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_68_0.desc = var_68_6
			end

			return var_68_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_69_0)
			local var_69_0 = pg.ship_skin_template[arg_69_0.id]

			if var_69_0.skin_type == ShipSKin.SKIN_TYPE_TB then
				local var_69_1, var_69_2, var_69_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_69_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_69_0.desc = var_69_3
			else
				local var_69_4, var_69_5, var_69_6 = ShipWordHelper.GetWordAndCV(arg_69_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_69_0.desc = var_69_6
			end

			return var_69_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_70_0)
			local var_70_0 = pg.equip_skin_template[arg_70_0.id]

			arg_70_0.desc = var_70_0.desc

			return var_70_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_71_0)
			local var_71_0 = pg.world_item_data_template[arg_71_0.id]

			arg_71_0.desc = var_71_0.display

			return var_71_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_72_0)
			local var_72_0 = pg.item_data_frame[arg_72_0.id]

			arg_72_0.desc = var_72_0.desc

			return var_72_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_73_0)
			return pg.item_data_chat[arg_73_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_74_0)
			local var_74_0 = pg.spweapon_data_statistics[arg_74_0.id]

			arg_74_0.desc = var_74_0.descrip

			return var_74_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_75_0)
			local var_75_0 = pg.activity_ryza_item[arg_75_0.id]

			arg_75_0.item = AtelierMaterial.New({
				configId = arg_75_0.id
			})
			arg_75_0.desc = arg_75_0.item:GetDesc()

			return var_75_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_76_0)
			arg_76_0.ship = getProxy(BayProxy):getShipById(arg_76_0.count)

			local var_76_0 = pg.ship_data_statistics[arg_76_0.ship.configId]
			local var_76_1, var_76_2, var_76_3 = ShipWordHelper.GetWordAndCV(var_76_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_76_0.desc = var_76_3 or i18n("ship_drop_desc_default")

			return var_76_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_77_0)
			return arg_77_0.isWorldBuff and pg.world_SLGbuff_data[arg_77_0.id] or pg.strategy_data_template[arg_77_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_78_0)
			local var_78_0 = pg.emoji_template[arg_78_0.id]

			arg_78_0.name = var_78_0.item_name
			arg_78_0.desc = var_78_0.item_desc

			return var_78_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_79_0)
			local var_79_0 = WorldCollectionProxy.GetCollectionTemplate(arg_79_0.id)

			arg_79_0.desc = var_79_0.name

			return var_79_0
		end,
		[DROP_TYPE_META_PT] = function(arg_80_0)
			local var_80_0 = pg.ship_strengthen_meta[arg_80_0.id]
			local var_80_1 = Item.getConfigData(var_80_0.itemid)

			arg_80_0.desc = var_80_1.display

			return var_80_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_81_0)
			local var_81_0 = pg.activity_workbench_item[arg_81_0.id]

			arg_81_0.item = WorkBenchItem.New({
				configId = arg_81_0.id
			})
			arg_81_0.desc = arg_81_0.item:GetDesc()

			return var_81_0
		end,
		[DROP_TYPE_BUFF] = function(arg_82_0)
			local var_82_0 = pg.benefit_buff_template[arg_82_0.id]

			arg_82_0.desc = var_82_0.desc

			return var_82_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_83_0)
			local var_83_0 = pg.commander_data_template[arg_83_0.id]

			arg_83_0.desc = var_83_0.desc

			return var_83_0
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_84_0)
			local var_84_0 = pg.island_item_data_template[arg_84_0.id]

			arg_84_0.desc = var_84_0.desc

			return var_84_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_85_0)
			local var_85_0 = pg.island_ability_template[arg_85_0.id]

			arg_85_0.desc = ""

			return var_85_0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_86_0)
			local var_86_0 = pg.island_chara_template[arg_86_0.id]

			arg_86_0.desc = ""

			return var_86_0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_87_0)
			local var_87_0 = pg.island_furniture_template[arg_87_0.id]

			arg_87_0.desc = var_87_0.describe

			return var_87_0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_88_0)
			local var_88_0 = pg.island_dress_template[arg_88_0.id]

			arg_88_0.desc = var_88_0.desc

			return var_88_0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_89_0)
			local var_89_0 = pg.island_skin_template[arg_89_0.id]

			arg_89_0.desc = var_89_0.desc

			return var_89_0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_90_0)
			local var_90_0 = pg.island_action[arg_90_0.id]

			arg_90_0.desc = var_90_0.desc

			return var_90_0
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_91_0)
			local var_91_0 = pg.island_speedup_ticket[arg_91_0.id]

			arg_91_0.desc = var_91_0.desc

			return var_91_0
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_92_0)
			local var_92_0 = pg.island_card_diy[arg_92_0.id]

			arg_92_0.desc = var_92_0.desc

			return var_92_0
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_93_0)
			return pg.drop_data_restore[arg_93_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_94_0)
			local var_94_0 = pg.dorm3d_furniture_template[arg_94_0.id]

			arg_94_0.desc = var_94_0.desc

			return var_94_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_95_0)
			local var_95_0 = pg.dorm3d_gift[arg_95_0.id]

			arg_95_0.desc = var_95_0.display

			return var_95_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_96_0)
			local var_96_0 = pg.dorm3d_resource[arg_96_0.id]

			arg_96_0.desc = ""

			return var_96_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_97_0)
			local var_97_0 = pg.livingarea_cover[arg_97_0.id]

			arg_97_0.desc = var_97_0.desc

			return var_97_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_98_0)
			return pg.item_data_battleui[arg_98_0.id]
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_99_0)
			local var_99_0 = pg.activity_medal_template[arg_99_0.id].item

			return pg.item_virtual_data_statistics[var_99_0]
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_100_0)
			local var_100_0 = Item.getConfigData(arg_100_0.id)

			assert(var_100_0, arg_100_0.id)

			arg_100_0.desc = var_100_0.display

			return var_100_0
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_101_0)
			return pg.island_collection[arg_101_0.id]
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_102_0)
			local var_102_0 = pg.island_set.season_pt_show.key_value_int
			local var_102_1 = pg.island_item_data_template[var_102_0]

			arg_102_0.desc = var_102_1.desc

			return var_102_1
		end
	}

	function var_0_0.ConfigDefault(arg_103_0)
		local var_103_0 = arg_103_0.type

		if tonumber(var_103_0) and var_103_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_103_1 = pg.activity_drop_type[var_103_0].relevance

			return var_103_1 and pg[var_103_1][arg_103_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_104_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_104_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_105_0)
			local var_105_0 = getProxy(BagProxy):getItemCountById(arg_105_0.id)

			if arg_105_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_105_0, 1), true
			else
				return var_105_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_106_0)
			local var_106_0 = arg_106_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_106_0], "equip groupId not exist")

			local var_106_1 = pg.equip_data_template.get_id_list_by_group[var_106_0]

			return underscore.reduce(var_106_1, 0, function(arg_107_0, arg_107_1)
				local var_107_0 = getProxy(EquipmentProxy):getEquipmentById(arg_107_1)

				return arg_107_0 + (var_107_0 and var_107_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_107_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_108_0)
			return getProxy(BayProxy):getConfigShipCount(arg_108_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_109_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_109_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_110_0)
			return arg_110_0.count, tobool(arg_110_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_111_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_111_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_112_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_112_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_113_0)
			local var_113_0 = arg_113_0:getConfig("virtual_type")

			return switch(var_113_0, {
				[22] = function()
					local var_114_0 = getProxy(ActivityProxy):getActivityById(arg_113_0:getConfig("link_id"))

					return var_114_0 and var_114_0.data1 or 0, true
				end,
				[101] = function()
					local var_115_0 = getProxy(ActivityProxy):getActivityById(arg_113_0:getConfig("link_id"))

					return var_115_0 and var_115_0.data1 or 0
				end
			}, function()
				return nil
			end)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_117_0)
			local var_117_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_117_0.id)

			return (var_117_0 and var_117_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_117_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_118_0)
			local var_118_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_118_0.type].activity_id)

			if not var_118_0 then
				return 0
			end

			local var_118_1 = var_118_0:GetItemById(arg_118_0.id)

			return var_118_1 and var_118_1.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_119_0)
			local var_119_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_119_0.id)

			return var_119_0 and (not var_119_0:expiredType() or not not var_119_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_120_0)
			local var_120_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_120_0.id)

			return var_120_0 and (not var_120_0:expiredType() or not not var_120_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_121_0)
			local var_121_0 = nowWorld()

			if var_121_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_121_0:GetInventoryProxy():GetItemCount(arg_121_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_122_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_122_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_123_0)
			local var_123_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_123_0.id)

			return var_123_0 and var_123_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_124_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_124_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_125_0)
			local var_125_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_125_0.id)

			return 1
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = getProxy(IslandProxy):GetIsland()

			if var_126_1 then
				var_126_0 = var_126_1:GetInventoryAgency():GetOwnCount(arg_126_0.id)
			end

			return var_126_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_127_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_128_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_129_0)
			local var_129_0 = getProxy(IslandProxy):GetIsland()

			if var_129_0 then
				local var_129_1 = var_129_0:GetAgoraAgency():GetFurnitures()

				for iter_129_0, iter_129_1 in ipairs(var_129_1) do
					if iter_129_1.id == arg_129_0.id then
						return iter_129_1.count
					end
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_130_0)
			local var_130_0 = getProxy(IslandProxy):GetIsland()

			if var_130_0 then
				local var_130_1 = arg_130_0:getConfig("belongto")

				if var_130_1 == 1 then
					return var_130_0:GetDressUpAgency():CheckOwnDress(arg_130_0.id) and 1 or 0
				elseif var_130_1 == 2 then
					return var_130_0:GetCharacterAgency():GetDressIdRealCount(arg_130_0.id)
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_131_0)
			local var_131_0 = getProxy(IslandProxy)

			if not var_131_0 then
				return 0
			end

			local var_131_1 = var_131_0:GetIsland()

			if var_131_1 then
				return var_131_1:GetCharacterAgency():CheckSkinIsOwned(arg_131_0.id) and 1 or 0
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_132_0)
			local var_132_0 = getProxy(IslandProxy)

			if not var_132_0 then
				return 0
			end

			local var_132_1 = var_132_0:GetIsland()

			if var_132_1 then
				return var_132_1:GetActionAgency():ExistAction(arg_132_0.id) and 1 or 0
			end

			return 0
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_133_0)
			local var_133_0 = getProxy(IslandProxy)

			if not var_133_0 then
				return 0
			end

			local var_133_1 = var_133_0:GetIsland()

			if var_133_1 then
				return var_133_1:GetSeasonAgency():GetSeason():GetPt()
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_134_0)
			local var_134_0 = getProxy(IslandProxy)

			if not var_134_0 then
				return 0
			end

			local var_134_1 = var_134_0:GetIsland()

			if var_134_1 then
				return var_134_1:GetCardDiyAgency():GetIdCount(arg_134_0.id)
			end

			return 0
		end
	}

	function var_0_0.CountDefault(arg_135_0)
		local var_135_0 = arg_135_0.type

		if var_135_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_135_0].activity_id):getVitemNumber(arg_135_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_136_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_137_0)
			return Item.New(arg_137_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_138_0)
			return Item.New(arg_138_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_139_0)
			return Equipment.New(arg_139_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_140_0)
			return Item.New({
				count = 1,
				id = arg_140_0.id,
				extra = arg_140_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_141_0)
			return WorldItem.New(arg_141_0)
		end
	}

	function var_0_0.SubClassDefault(arg_142_0)
		assert(false, string.format("drop type %d without subClass", arg_142_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_143_0)
			return arg_143_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_144_0)
			return arg_144_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_145_0)
			return arg_145_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_146_0)
			return arg_146_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_147_0)
			return arg_147_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_148_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_149_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_150_0)
			return arg_150_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_151_0)
			return arg_151_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_152_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_153_0)
			return arg_153_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_154_0)
			return arg_154_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_155_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_156_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_157_0)
			return arg_157_0:getConfig("rare")
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_158_0)
			return arg_158_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_159_0)
			return arg_159_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_160_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_161_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_162_0)
			return arg_162_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_163_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_164_0)
			return ItemRarity.Gold
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_165_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_166_0)
		return arg_166_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_167_0)
		return arg_167_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_168_0)
			local var_168_0 = Drop.New({
				type = arg_168_0:getConfig("type"),
				id = arg_168_0:getConfig("resource_type"),
				count = arg_168_0:getConfig("resource_num") * arg_168_0.count
			})
			local var_168_1 = Drop.New({
				type = arg_168_0:getConfig("target_type"),
				id = arg_168_0:getConfig("target_id"),
				count = arg_168_0.count
			})

			PlayerConst.UpdateLinkActivity({
				var_168_1
			})

			var_168_0.name = string.format("%s(%s)", var_168_0:getName(), var_168_1:getName())

			return var_168_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_169_0)
			for iter_169_0, iter_169_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_169_1.id].pt == arg_169_0.id then
					return nil, arg_169_0
				end
			end

			for iter_169_2, iter_169_3 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5)) do
				if pg.black_friday_battlepass_event_pt[iter_169_3.id].pt == arg_169_0.id then
					return nil, arg_169_0
				end
			end

			return arg_169_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_170_0)
			if arg_170_0.id ~= 3 then
				return nil
			end

			return arg_170_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_171_0)
			return nil, arg_171_0
		end,
		[DROP_TYPE_VITEM] = function(arg_172_0, arg_172_1, arg_172_2)
			assert(arg_172_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_172_0.id)

			return switch(arg_172_0:getConfig("virtual_type"), {
				function()
					if arg_172_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_172_0
					end

					return arg_172_0
				end,
				[6] = function()
					local var_174_0 = arg_172_2.taskId
					local var_174_1 = getProxy(ActivityProxy)
					local var_174_2 = var_174_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_174_2 then
						local var_174_3 = var_174_2.data1KeyValueList[1]

						var_174_3[var_174_0] = defaultValue(var_174_3[var_174_0], 0) + arg_172_0.count

						var_174_1:updateActivity(var_174_2)
					end

					return nil, arg_172_0
				end,
				[13] = function()
					local var_175_0 = arg_172_0:getName()
					local var_175_1 = getProxy(ActivityProxy):getActivityById(arg_172_0:getConfig("link_id"))

					if not var_175_1 or var_175_1:isEnd() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_175_0))

						return nil
					elseif var_175_1:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_175_0))

						return nil
					else
						return arg_172_0, nil
					end
				end,
				[17] = function()
					local var_176_0 = getProxy(ActivityProxy):getActivityById(arg_172_0:getConfig("link_id"))

					if var_176_0.data1 < 1 then
						return Drop.New({
							count = 1,
							type = DROP_TYPE_SHIP,
							id = var_176_0:getConfig("config_id")
						}), arg_172_0
					else
						return Drop.New({
							id = 3,
							type = DROP_TYPE_OPERATION,
							count = var_176_0.data2
						}), arg_172_0
					end
				end,
				[21] = function()
					return nil, arg_172_0
				end,
				[28] = function()
					local var_178_0 = Drop.New({
						type = arg_172_0.type,
						id = arg_172_0.id,
						count = math.floor(arg_172_0.count / 1000)
					})
					local var_178_1 = Drop.New({
						type = arg_172_0.type,
						id = arg_172_0.id,
						count = arg_172_0.count - math.floor(arg_172_0.count / 1000)
					})

					return var_178_0, var_178_1
				end
			}, function()
				return arg_172_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_180_0, arg_180_1)
			if Ship.isMetaShipByConfigID(arg_180_0.id) and Player.isMetaShipNeedToTrans(arg_180_0.id) then
				local var_180_0 = table.indexof(arg_180_1, arg_180_0.id, 1)

				if var_180_0 then
					table.remove(arg_180_1, var_180_0)
				else
					local var_180_1 = Player.metaShip2Res(arg_180_0.id)
					local var_180_2 = Drop.New(var_180_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_180_0.id, var_180_2)

					return arg_180_0, var_180_2
				end
			end

			return arg_180_0
		end,
		[DROP_TYPE_SKIN] = function(arg_181_0)
			arg_181_0.isNew = not getProxy(ShipSkinProxy):hasNonLimitSkin(arg_181_0.id)

			return arg_181_0
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_182_0)
			local var_182_0 = getProxy(PlayerProxy):getRawData()
			local var_182_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_182_0:updateMedalList({
				{
					key = arg_182_0.id,
					value = var_182_1
				}
			})

			return arg_182_0
		end,
		[DROP_TYPE_BUFF] = function(arg_183_0)
			return nil, arg_183_0
		end
	}

	function var_0_0.TransDefault(arg_184_0)
		return arg_184_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_185_0)
			local var_185_0 = id2res(arg_185_0.id)

			assert(var_185_0, "res should be defined: " .. arg_185_0.id)

			local var_185_1 = getProxy(PlayerProxy)
			local var_185_2 = var_185_1:getData()

			var_185_2:addResources({
				[var_185_0] = arg_185_0.count
			})
			var_185_1:updatePlayer(var_185_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_186_0)
			if arg_186_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_186_0 = getProxy(BagProxy):getItemCountById(arg_186_0.id)
				local var_186_1 = math.min(arg_186_0:getConfig("max_num") - var_186_0, arg_186_0.count)

				if var_186_1 > 0 then
					getProxy(BagProxy):addItemById(arg_186_0.id, var_186_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_186_0.id, arg_186_0.count, arg_186_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_187_0)
			local var_187_0 = arg_187_0:getSubClass()

			getProxy(BagProxy):addItemById(var_187_0.id, var_187_0.count, var_187_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_188_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_188_0.id, arg_188_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_189_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_190_0)
			local var_190_0 = getProxy(DormProxy)
			local var_190_1 = Furniture.New({
				id = arg_190_0.id,
				count = arg_190_0.count
			})

			if var_190_1:isRecordTime() then
				var_190_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_190_0:AddFurniture(var_190_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_191_0)
			local var_191_0 = getProxy(ShipSkinProxy)
			local var_191_1 = ShipSkin.New({
				id = arg_191_0.id
			})

			var_191_0:addSkin(var_191_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_192_0)
			arg_192_0 = arg_192_0:getSubClass()

			assert(arg_192_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_192_0.id)
			switch(arg_192_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_192_0.id, arg_192_0.count)
				end,
				function()
					local var_194_0 = getProxy(ActivityProxy)
					local var_194_1 = arg_192_0:getConfig("link_id")
					local var_194_2

					if var_194_1 > 0 then
						var_194_2 = var_194_0:getActivityById(var_194_1)
					else
						var_194_2 = var_194_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_194_2 and not var_194_2:isEnd() then
						if not table.contains(var_194_2.data1_list, arg_192_0.id) then
							table.insert(var_194_2.data1_list, arg_192_0.id)
						end

						var_194_0:updateActivity(var_194_2)
					end
				end,
				function()
					local var_195_0 = getProxy(ActivityProxy)
					local var_195_1 = var_195_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_195_0, iter_195_1 in ipairs(var_195_1) do
						iter_195_1.data1 = iter_195_1.data1 + arg_192_0.count

						local var_195_2 = iter_195_1:getConfig("config_id")
						local var_195_3 = pg.activity_vote[var_195_2]

						if var_195_3 and var_195_3.ticket_id_period == arg_192_0.id then
							iter_195_1.data3 = iter_195_1.data3 + arg_192_0.count
						end

						var_195_0:updateActivity(iter_195_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_192_0.id,
							ptCount = arg_192_0.count
						})
					end
				end,
				[4] = function()
					local var_196_0 = getProxy(ColoringProxy):getColorItems()

					var_196_0[arg_192_0.id] = (var_196_0[arg_192_0.id] or 0) + arg_192_0.count
				end,
				[6] = function()
					local var_197_0 = getProxy(ActivityProxy)
					local var_197_1 = var_197_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_197_1 then
						var_197_1.data3 = var_197_1.data3 + arg_192_0.count

						var_197_0:updateActivity(var_197_1)
					end
				end,
				[7] = function()
					local var_198_0 = getProxy(ChapterProxy)

					var_198_0:updateRemasterTicketsNum(math.min(var_198_0.remasterTickets + arg_192_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_199_0 = getProxy(ActivityProxy)
					local var_199_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_199_1 then
						var_199_1.data1_list[1] = var_199_1.data1_list[1] + arg_192_0.count

						var_199_0:updateActivity(var_199_1)
					end
				end,
				[11] = function()
					local var_200_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_200_0 and not var_200_0:isEnd() then
						var_200_0.data1 = var_200_0.data1 + arg_192_0.count
					end
				end,
				[12] = function()
					local var_201_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_201_0 and not var_201_0:isEnd() then
						var_201_0.data1KeyValueList[1][arg_192_0.id] = (var_201_0.data1KeyValueList[1][arg_192_0.id] or 0) + arg_192_0.count
					end
				end,
				[13] = function()
					local var_202_0 = getProxy(ActivityProxy):getActivityById(arg_192_0:getConfig("link_id"))

					if var_202_0:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

						return
					end

					var_202_0.data1 = var_202_0.data1 + arg_192_0.count

					getProxy(ActivityProxy):updateActivity(var_202_0)
				end,
				[14] = function()
					local var_203_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_192_0.id then
						var_203_0:AddSummonPt(arg_192_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_192_0.id then
						var_203_0:AddSummonPtOld(arg_192_0.count)
					end
				end,
				[15] = function()
					local var_204_0 = getProxy(ActivityProxy)
					local var_204_1 = var_204_0:getActivityById(arg_192_0:getConfig("link_id"))

					if not var_204_1 or var_204_1:isEnd() then
						return
					end

					if var_204_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE then
						local var_204_2 = pg.activity_event_grid[var_204_1.data1]

						if arg_192_0.id == var_204_2.ticket_item then
							var_204_1.data2 = var_204_1.data2 + arg_192_0.count
						elseif arg_192_0.id == var_204_2.explore_item then
							var_204_1.data3 = var_204_1.data3 + arg_192_0.count
						end
					elseif var_204_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_EXPEDITION then
						var_204_1.data3 = var_204_1.data3 + arg_192_0.count
					end

					var_204_0:updateActivity(var_204_1)
				end,
				[16] = function()
					local var_205_0 = getProxy(ActivityProxy)
					local var_205_1 = var_205_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_205_0, iter_205_1 in pairs(var_205_1) do
						if iter_205_1 and not iter_205_1:isEnd() and arg_192_0.id == iter_205_1:getConfig("config_id") then
							iter_205_1.data1 = iter_205_1.data1 + arg_192_0.count

							var_205_0:updateActivity(iter_205_1)
						end
					end
				end,
				[17] = function()
					local var_206_0 = getProxy(ActivityProxy)
					local var_206_1 = var_206_0:getActivityById(arg_192_0:getConfig("link_id"))

					if not var_206_1 or var_206_1:isEnd() then
						return
					end

					var_206_1.data1 = 2

					var_206_0:updateActivity(var_206_1)
				end,
				[20] = function()
					local var_207_0 = getProxy(BagProxy)
					local var_207_1 = pg.gameset.urpt_chapter_max.description
					local var_207_2 = var_207_1[1]
					local var_207_3 = var_207_1[2]
					local var_207_4 = var_207_0:GetLimitCntById(var_207_2)
					local var_207_5 = math.min(var_207_3 - var_207_4, arg_192_0.count)

					if var_207_5 > 0 then
						var_207_0:addItemById(var_207_2, var_207_5)
						var_207_0:AddLimitCnt(var_207_2, var_207_5)
					end
				end,
				[21] = function()
					local var_208_0 = getProxy(ActivityProxy)
					local var_208_1 = var_208_0:getActivityById(arg_192_0:getConfig("link_id"))

					if var_208_1 and not var_208_1:isEnd() then
						var_208_1.data2 = 1

						var_208_0:updateActivity(var_208_1)
					end
				end,
				[22] = function()
					local var_209_0 = getProxy(ActivityProxy)
					local var_209_1 = var_209_0:getActivityById(arg_192_0:getConfig("link_id"))

					if var_209_1 and not var_209_1:isEnd() then
						var_209_1.data1 = var_209_1.data1 + arg_192_0.count

						var_209_0:updateActivity(var_209_1)
					end
				end,
				[23] = function()
					local var_210_0 = (function()
						for iter_211_0, iter_211_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_192_0.id == iter_211_1[1] then
								return iter_211_1[2]
							end
						end
					end)()

					assert(var_210_0)

					local var_210_1 = getProxy(PlayerProxy)
					local var_210_2 = var_210_1:getData()

					var_210_2:addExpToLevel(var_210_0)
					var_210_1:updatePlayer(var_210_2)
				end,
				[24] = function()
					local var_212_0 = arg_192_0:getConfig("link_id")
					local var_212_1 = getProxy(ActivityProxy):getActivityById(var_212_0)

					if var_212_1 and not var_212_1:isEnd() and var_212_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_212_1.data2 = var_212_1.data2 + arg_192_0.count

						getProxy(ActivityProxy):updateActivity(var_212_1)
					end
				end,
				[25] = function()
					local var_213_0 = getProxy(ActivityProxy)
					local var_213_1 = var_213_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_213_1 and not var_213_1:isEnd() then
						var_213_1.data1 = var_213_1.data1 - 1

						if not table.contains(var_213_1.data1_list, arg_192_0.id) then
							table.insert(var_213_1.data1_list, arg_192_0.id)
						end

						var_213_0:updateActivity(var_213_1)

						local var_213_2 = arg_192_0:getConfig("link_id")

						if var_213_2 > 0 then
							local var_213_3 = var_213_0:getActivityById(var_213_2)

							if var_213_3 and not var_213_3:isEnd() then
								var_213_3.data1 = var_213_3.data1 + 1

								var_213_0:updateActivity(var_213_3)
							end
						end
					end
				end,
				[26] = function()
					local var_214_0 = getProxy(ActivityProxy)
					local var_214_1 = Clone(var_214_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_214_1 and not var_214_1:isEnd() then
						var_214_1.data1 = var_214_1.data1 + arg_192_0.count

						var_214_0:updateActivity(var_214_1)
					end
				end,
				[27] = function()
					local var_215_0 = getProxy(ActivityProxy)
					local var_215_1 = Clone(var_215_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_215_1 and not var_215_1:isEnd() then
						var_215_1:AddExp(arg_192_0.count)
						var_215_0:updateActivity(var_215_1)
					end
				end,
				[28] = function()
					local var_216_0 = getProxy(ActivityProxy)
					local var_216_1 = Clone(var_216_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_216_1 and not var_216_1:isEnd() then
						var_216_1:AddGold(arg_192_0.count)
						var_216_0:updateActivity(var_216_1)
					end
				end,
				[29] = function()
					local var_217_0 = getProxy(ActivityProxy)
					local var_217_1 = Clone(var_217_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5))

					if var_217_1 and not var_217_1:isEnd() then
						var_217_1.data1 = var_217_1.data1 + arg_192_0.count

						var_217_0:updateActivity(var_217_1)
					end
				end,
				[30] = function()
					local var_218_0 = arg_192_0:getConfig("link_id")
					local var_218_1 = getProxy(ActivityProxy):getActivityById(var_218_0)

					if not var_218_1 or var_218_1:isEnd() then
						return
					end

					local var_218_2 = arg_192_0.count

					if var_218_1:IsLimitExpItem(arg_192_0.id) then
						var_218_2 = var_218_1:FilterExp(var_218_2)
						var_218_2 = getProxy(LoveLetterProxy):AddLoveLetterExp(var_218_1:GetTargetGroupId(), var_218_2)

						var_218_1:AddDailyProgress(var_218_2)
					else
						local var_218_3 = getProxy(LoveLetterProxy):AddLoveLetterExp(var_218_1:GetTargetGroupId(), var_218_2)
					end

					getProxy(ActivityProxy):updateActivity(var_218_1)
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_221_0 = arg_192_0:getConfig("link_id")
					local var_221_1 = getProxy(ActivityProxy):getActivityById(var_221_0)

					if var_221_1 and not var_221_1:isEnd() then
						var_221_1.data1 = var_221_1.data1 + arg_192_0.count

						getProxy(ActivityProxy):updateActivity(var_221_1)
					end
				end,
				[102] = function()
					local var_222_0 = arg_192_0:getConfig("link_id")
					local var_222_1 = pg.activity_template[var_222_0].type

					switch(var_222_1, {
						[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = function()
							getProxy(CityRebuildProxy):AddPt(var_222_0, arg_192_0.count)
						end
					})
				end,
				[103] = function()
					local var_224_0 = arg_192_0:getConfig("link_id")
					local var_224_1 = getProxy(ActivityProxy):getActivityById(var_224_0)

					if not var_224_1 or var_224_1:isEnd() then
						return
					end

					local var_224_2 = var_224_1:getConfig("type")

					switch(var_224_2, {
						[ActivityConst.ACTIVITY_TYPE_TOWN2] = function()
							local var_225_0 = getProxy(ActivityProxy)
							local var_225_1 = Clone(var_225_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN2))

							if arg_192_0:getConfig("id") == pg.activity_town_2[var_225_1.id].bubble_drop[1][2] then
								var_225_1:AddGold(arg_192_0.count)
								var_225_1:AddAllGold(arg_192_0.count)
							else
								var_225_1:AddGold2(arg_192_0.count)
							end

							var_225_0:updateActivity(var_225_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MALL] = function()
							local var_226_0 = var_224_1:getConfig("config_data")[1]
							local var_226_1 = arg_192_0.id ~= var_226_0

							if var_226_1 then
								var_224_1:AddStaff(arg_192_0.id, arg_192_0.count)
							else
								var_224_1:AddGold(arg_192_0.count)
							end

							getProxy(ActivityProxy):updateActivity(var_224_1)

							if var_226_1 then
								pg.m02:sendNotification(GAME.ACTIVITY_MALL_OP, {
									activity_id = var_224_1.id,
									cmd = ActivityMallOPCommand.CMD.GET_STAFF_DATA,
									arg1 = arg_192_0.count
								})
							end
						end
					}, function()
						assert(var_224_1 .. "对应" .. var_224_2 .. "错误")
					end)
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_228_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_228_0.id, arg_228_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_229_0)
			local var_229_0 = getProxy(BayProxy)
			local var_229_1 = var_229_0:getShipById(arg_229_0.count)

			if var_229_1 then
				var_229_1:unlockActivityNpc(0)
				var_229_0:updateShip(var_229_1)
				getProxy(CollectionProxy):flushCollection(var_229_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_230_0)
			nowWorld():GetInventoryProxy():AddItem(arg_230_0.id, arg_230_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_231_0)
			local var_231_0 = getProxy(AttireProxy)
			local var_231_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_231_2 = IconFrame.New({
				id = arg_231_0.id
			})
			local var_231_3 = var_231_1 + var_231_2:getConfig("time_second")

			var_231_2:updateData({
				isNew = true,
				end_time = var_231_3
			})
			var_231_0:addAttireFrame(var_231_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_231_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_232_0)
			local var_232_0 = getProxy(AttireProxy)
			local var_232_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_232_2 = ChatFrame.New({
				id = arg_232_0.id
			})
			local var_232_3 = var_232_1 + var_232_2:getConfig("time_second")

			var_232_2:updateData({
				isNew = true,
				end_time = var_232_3
			})
			var_232_0:addAttireFrame(var_232_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_232_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_233_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_233_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_233_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_234_0)
			nowWorld():GetCollectionProxy():Unlock(arg_234_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_235_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_235_0.id):addPT(arg_235_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_236_0)
			local var_236_0 = arg_236_0.id
			local var_236_1 = arg_236_0.count
			local var_236_2 = getProxy(ShipSkinProxy)
			local var_236_3 = var_236_2:getSkinById(var_236_0)

			if var_236_3 and var_236_3:isExpireType() then
				local var_236_4 = var_236_1 + var_236_3.endTime
				local var_236_5 = ShipSkin.New({
					id = var_236_0,
					end_time = var_236_4
				})

				var_236_2:addSkin(var_236_5)
			elseif not var_236_3 then
				local var_236_6 = var_236_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_236_7 = ShipSkin.New({
					id = var_236_0,
					end_time = var_236_6
				})

				var_236_2:addSkin(var_236_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_237_0)
			local var_237_0 = arg_237_0.id
			local var_237_1 = pg.benefit_buff_template[var_237_0]

			assert(var_237_1 and var_237_1.act_id > 0, "should exist act id")

			local var_237_2 = getProxy(ActivityProxy):getActivityById(var_237_1.act_id)

			if var_237_2 and not var_237_2:isEnd() then
				local var_237_3 = var_237_1.max_time
				local var_237_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_237_3

				var_237_2:AddBuff(ActivityBuff.New(var_237_2.id, var_237_0, var_237_4))
				getProxy(ActivityProxy):updateActivity(var_237_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_238_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_239_0)
			getProxy(ApartmentProxy):ModifyRoom(arg_239_0:getConfig("room_id"), function(arg_240_0)
				arg_240_0:AddFurnitureByID(arg_239_0.id)
			end)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_241_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_241_0.id, arg_241_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_242_0)
			getProxy(ApartmentProxy):ModifyApartment(arg_242_0:getConfig("ship_group"), function(arg_243_0)
				arg_243_0:addSkin(arg_242_0.id)
			end)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_244_0)
			local var_244_0 = getProxy(LivingAreaCoverProxy)
			local var_244_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_244_0.id
			})

			var_244_0:UpdateCover(var_244_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_244_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_244_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_245_0)
			local var_245_0 = getProxy(AttireProxy)
			local var_245_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_245_2 = CombatUIStyle.New({
				id = arg_245_0.id
			})

			var_245_2:setUnlock()
			var_245_2:setNew()
			var_245_0:addAttireFrame(var_245_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_245_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_246_0)
			local var_246_0 = getProxy(IslandProxy):GetIsland()

			if not var_246_0 then
				return
			end

			var_246_0:GetInventoryAgency():AddItem(IslandItem.New({
				id = arg_246_0.id,
				num = arg_246_0.count
			}))
		end
	}

	function var_0_0.AddItemDefault(arg_247_0)
		if arg_247_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_247_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_247_0.type].activity_id)

			if arg_247_0.type == DROP_TYPE_RYZA_DROP then
				if var_247_0 and not var_247_0:isEnd() then
					var_247_0:AddItem(AtelierMaterial.New({
						configId = arg_247_0.id,
						count = arg_247_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_247_0)
				end
			elseif var_247_0 and not var_247_0:isEnd() then
				var_247_0:addVitemNumber(arg_247_0.id, arg_247_0.count)
				getProxy(ActivityProxy):updateActivity(var_247_0)
			end
		elseif arg_247_0.type >= DROP_TYPE_ISLAND_ITEM and arg_247_0.type <= DROP_TYPE_ISLAND_CARD_DIY then
			if not getProxy(IslandProxy):GetIsland() then
				return
			end

			local var_247_1 = {}

			table.insert(var_247_1, {
				type = arg_247_0.type,
				id = arg_247_0.id,
				number = arg_247_0.count
			})
			IslandDropHelper.AddItems({
				drop_list = var_247_1
			})
		else
			print("can not handle this type>>" .. arg_247_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_248_0, arg_248_1, arg_248_2)
			setText(arg_248_2, arg_248_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_249_0, arg_249_1, arg_249_2)
			local var_249_0 = arg_249_0:getConfig("display")

			if arg_249_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_249_0 = string.gsub(var_249_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_249_0.extra))
			elseif arg_249_0:getConfig("combination_display") ~= nil then
				local var_249_1 = arg_249_0:getConfig("combination_display")

				if var_249_1 and #var_249_1 > 0 then
					var_249_0 = Item.StaticCombinationDisplay(var_249_1)
				end
			end

			setText(arg_249_2, SwitchSpecialChar(var_249_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_250_0, arg_250_1, arg_250_2)
			setText(arg_250_2, arg_250_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_251_0, arg_251_1, arg_251_2)
			local var_251_0 = arg_251_0:getConfig("skin_id")
			local var_251_1, var_251_2, var_251_3 = ShipWordHelper.GetWordAndCV(var_251_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_251_2, var_251_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_252_0, arg_252_1, arg_252_2)
			local var_252_0 = arg_252_0:getConfig("skin_id")
			local var_252_1, var_252_2, var_252_3 = ShipWordHelper.GetWordAndCV(var_252_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_252_2, var_252_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_253_0, arg_253_1, arg_253_2)
			setText(arg_253_2, arg_253_1.name or arg_253_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_254_0, arg_254_1, arg_254_2)
			local var_254_0 = arg_254_0:getConfig("desc")

			for iter_254_0, iter_254_1 in ipairs({
				arg_254_0.count
			}) do
				var_254_0 = string.gsub(var_254_0, "$" .. iter_254_0, iter_254_1)
			end

			setText(arg_254_2, var_254_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_255_0, arg_255_1, arg_255_2)
			setText(arg_255_2, arg_255_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_256_0, arg_256_1, arg_256_2)
			setText(arg_256_2, arg_256_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_257_0, arg_257_1, arg_257_2)
			local var_257_0 = arg_257_0:getConfig("desc")
			local var_257_1 = _.map(arg_257_0:getConfig("equip_type"), function(arg_258_0)
				return EquipType.Type2Name2(arg_258_0)
			end)

			setText(arg_257_2, var_257_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_257_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_259_0, arg_259_1, arg_259_2)
			setText(arg_259_2, arg_259_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_260_0, arg_260_1, arg_260_2)
			setText(arg_260_2, arg_260_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_261_0, arg_261_1, arg_261_2, arg_261_3)
			local var_261_0 = WorldCollectionProxy.GetCollectionType(arg_261_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_261_2, i18n("world_" .. var_261_0 .. "_desc", arg_261_0:getConfig("name")))
			setText(arg_261_3, i18n("world_" .. var_261_0 .. "_name", arg_261_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_262_0, arg_262_1, arg_262_2)
			setText(arg_262_2, arg_262_0.desc and arg_262_0.desc or arg_262_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_263_0, arg_263_1, arg_263_2)
			setText(arg_263_2, arg_263_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_264_0, arg_264_1, arg_264_2)
			setText(arg_264_2, arg_264_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_265_0, arg_265_1, arg_265_2)
			local var_265_0 = string.gsub(arg_265_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_265_0.count))

			setText(arg_265_2, SwitchSpecialChar(var_265_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_266_0, arg_266_1, arg_266_2)
			setText(arg_266_2, arg_266_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_267_0, arg_267_1, arg_267_2)
			setText(arg_267_2, arg_267_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_268_0, arg_268_1, arg_268_2)
			setText(arg_268_2, arg_268_0:getConfig("desc"))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_269_0, arg_269_1, arg_269_2)
			setText(arg_269_2, arg_269_0:getConfig("display"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_270_0, arg_270_1, arg_270_2)
			setText(arg_270_2, arg_270_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_271_0, arg_271_1, arg_271_2)
			setText(arg_271_2, arg_271_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_272_0, arg_272_1, arg_272_2)
			setText(arg_272_2, "")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_273_0, arg_273_1, arg_273_2)
			setText(arg_273_2, arg_273_0.desc)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_274_0, arg_274_1, arg_274_2)
			setText(arg_274_2, arg_274_0.desc)
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_275_0, arg_275_1, arg_275_2)
			setText(arg_275_2, arg_275_0.desc)
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_276_0, arg_276_1, arg_276_2)
			setText(arg_276_2, arg_276_0.desc)
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_277_0, arg_277_1, arg_277_2)
		if arg_277_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_277_2, arg_277_0:getConfig("display"))
		else
			setText(arg_277_2, arg_277_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_278_0, arg_278_1, arg_278_2)
			if arg_278_0.id == PlayerConst.ResStoreGold or arg_278_0.id == PlayerConst.ResStoreOil then
				arg_278_2 = arg_278_2 or {}
				arg_278_2.frame = "frame_store"
			end

			updateItem(arg_278_1, Item.New({
				id = id2ItemId(arg_278_0.id)
			}), arg_278_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_279_0, arg_279_1, arg_279_2)
			updateItem(arg_279_1, arg_279_0:getSubClass(), arg_279_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_280_0, arg_280_1, arg_280_2)
			updateEquipment(arg_280_1, arg_280_0:getSubClass(), arg_280_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_281_0, arg_281_1, arg_281_2)
			updateShip(arg_281_1, arg_281_0.ship, arg_281_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_282_0, arg_282_1, arg_282_2)
			updateShip(arg_282_1, arg_282_0.ship, arg_282_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_283_0, arg_283_1, arg_283_2)
			updateFurniture(arg_283_1, arg_283_0, arg_283_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_284_0, arg_284_1, arg_284_2)
			arg_284_2.isWorldBuff = arg_284_0.isWorldBuff

			updateStrategy(arg_284_1, arg_284_0, arg_284_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_285_0, arg_285_1, arg_285_2)
			arg_285_2.isSkin = true
			arg_285_2.isNew = arg_285_0.isNew

			updateShip(arg_285_1, Ship.New({
				configId = tonumber(arg_285_0:getConfig("ship_group") .. "1"),
				skin_id = arg_285_0.id
			}), arg_285_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_286_0, arg_286_1, arg_286_2)
			local var_286_0 = setmetatable({
				count = arg_286_0.count
			}, {
				__index = arg_286_0:getConfigTable()
			})

			updateEquipmentSkin(arg_286_1, var_286_0, arg_286_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_287_0, arg_287_1, arg_287_2)
			updateItem(arg_287_1, Item.New({
				id = arg_287_0.id
			}), arg_287_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_288_0, arg_288_1, arg_288_2)
			updateWorldItem(arg_288_1, WorldItem.New({
				id = arg_288_0.id
			}), arg_288_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_289_0, arg_289_1, arg_289_2)
			updateWorldCollection(arg_289_1, arg_289_0, arg_289_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_290_0, arg_290_1, arg_290_2)
			updateAttire(arg_290_1, AttireConst.TYPE_CHAT_FRAME, arg_290_0:getConfigTable(), arg_290_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_291_0, arg_291_1, arg_291_2)
			updateAttire(arg_291_1, AttireConst.TYPE_ICON_FRAME, arg_291_0:getConfigTable(), arg_291_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_292_0, arg_292_1, arg_292_2)
			updateEmoji(arg_292_1, arg_292_0:getConfigTable(), arg_292_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_293_0, arg_293_1, arg_293_2)
			arg_293_2.count = 1

			updateItem(arg_293_1, arg_293_0:getSubClass(), arg_293_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_294_0, arg_294_1, arg_294_2)
			updateSpWeapon(arg_294_1, SpWeapon.New({
				id = arg_294_0.id
			}), arg_294_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_295_0, arg_295_1, arg_295_2)
			updateItem(arg_295_1, Item.New({
				id = arg_295_0:getConfig("id")
			}), arg_295_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_296_0, arg_296_1, arg_296_2)
			arg_296_2.isSkin = true
			arg_296_2.isTimeLimit = true
			arg_296_2.count = 1

			updateShip(arg_296_1, Ship.New({
				configId = tonumber(arg_296_0:getConfig("ship_group") .. "1"),
				skin_id = arg_296_0.id
			}), arg_296_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_297_0, arg_297_1, arg_297_2)
			AtelierMaterial.UpdateRyzaItem(arg_297_1, arg_297_0.item, arg_297_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_298_0, arg_298_1, arg_298_2)
			WorkBenchItem.UpdateDrop(arg_298_1, arg_298_0.item, arg_298_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_299_0, arg_299_1, arg_299_2)
			WorkBenchItem.UpdateDrop(arg_299_1, WorkBenchItem.New({
				configId = arg_299_0.id,
				count = arg_299_0.count
			}), arg_299_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_300_0, arg_300_1, arg_300_2)
			updateBuff(arg_300_1, arg_300_0.id, arg_300_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_301_0, arg_301_1, arg_301_2)
			updateCommander(arg_301_1, arg_301_0, arg_301_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_302_0, arg_302_1, arg_302_2)
			updateCover(arg_302_1, arg_302_0, arg_302_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_303_0, arg_303_1, arg_303_2)
			updateAttireCombatUI(arg_303_1, AttireConst.TYPE_ICON_FRAME, arg_303_0:getConfigTable(), arg_303_2)
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_304_0, arg_304_1, arg_304_2)
			updateActivityMedal(arg_304_1, arg_304_0:getConfigTable(), arg_304_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_305_0, arg_305_1, arg_305_2)
		updateDefaultIconTpl(arg_305_1, arg_305_0, arg_305_2)
	end

	var_0_0.UpdateCustomDropCase = {
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_306_0, arg_306_1, arg_306_2)
			updateDorm3dIcon(arg_306_1, arg_306_0, arg_306_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_307_0, arg_307_1, arg_307_2)
			updateDorm3dIcon(arg_307_1, arg_307_0, arg_307_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_308_0, arg_308_1, arg_308_2)
			updateDorm3dIcon(arg_308_1, arg_308_0, arg_308_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_309_0, arg_309_1, arg_309_2)
			updateIslandItem(arg_309_1, arg_309_0, arg_309_2)
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_310_0, arg_310_1, arg_310_2)
			updateIslandUnlock(arg_310_1, arg_310_0, arg_310_2)
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_311_0, arg_311_1, arg_311_2)
			updateIslandInvitation(arg_311_1, arg_311_0, arg_311_2)
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_312_0, arg_312_1, arg_312_2)
			updateIslandSeasonPt(arg_312_1, arg_312_0, arg_312_2)
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_313_0, arg_313_1, arg_313_2)
			updateIslandWatherCollect(arg_313_1, arg_313_0, arg_313_2)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_314_0, arg_314_1, arg_314_2)
			updateIslandFurniture(arg_314_1, arg_314_0, arg_314_2)
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_315_0, arg_315_1, arg_315_2)
			updateIslandCardDiy(arg_315_1, arg_315_0, arg_315_2)
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_316_0, arg_316_1, arg_316_2)
			updateIslandSpeedupTicket(arg_316_1, arg_316_0, arg_316_2)
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_317_0, arg_317_1, arg_317_2)
			updateItem(arg_317_1, Item.New({
				id = arg_317_0.id
			}), arg_317_2)
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_318_0, arg_318_1, arg_318_2)
			updateIslandSkin(arg_318_1, arg_318_0, arg_318_2)
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_319_0, arg_319_1, arg_319_2)
			updateIslandDress(arg_319_1, arg_319_0, arg_319_2)
		end
	}

	function var_0_0.UpdateCustomDropDefault(arg_320_0, arg_320_1, arg_320_2)
		if arg_320_2.style == "dorm" then
			updateDorm3dIcon(arg_320_1, arg_320_0, arg_320_2)
		elseif arg_320_2.style == "island" then
			updateIslandDefaultIconTpl(arg_320_1, arg_320_0, arg_320_2)
		else
			warning(string.format("without dropType %d in updateCustomDrop", arg_320_0.type))
		end
	end
end

return var_0_0
