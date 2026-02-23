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
			local var_9_0 = arg_7_0:getConfig("icon_normal")

			return var_9_0 ~= "" and var_9_0 or "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function()
			return "island/" .. arg_7_0:getConfig("cmd_icon")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function()
			local var_11_0 = pg.island_item_data_template[arg_7_0:getConfig("invite_item")].icon

			return "island/" .. var_11_0
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function()
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function()
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			return "island/IslandFurnitureIcon/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function()
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function()
			return arg_7_0:getConfig("icon_normal")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function()
			return "island/IslandDressIcon/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_ACTION] = function()
			return "island/IslandActionIcon/" .. arg_7_0:getConfig("resource")
		end,
		[DROP_TYPE_ISLAND_SKIN] = function()
			return arg_7_0:getConfig("icon_normal")
		end
	}, function()
		return arg_7_0:getConfig("icon")
	end)
end

function var_0_0.getDefaultIcon(arg_21_0)
	return switch(arg_21_0.type, {
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

function var_0_0.getIslandRarity(arg_38_0)
	return switch(arg_38_0.type, {
		[DROP_TYPE_ISLAND_ITEM] = function()
			return arg_38_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			return arg_38_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function()
			return arg_38_0:getConfig("rarity")
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

function var_0_0.getCount(arg_47_0)
	if arg_47_0.type == DROP_TYPE_OPERATION or arg_47_0.type == DROP_TYPE_LOVE_LETTER then
		return 1
	else
		return arg_47_0.count
	end
end

function var_0_0.isLoveLetter(arg_48_0)
	return arg_48_0.type == DROP_TYPE_LOVE_LETTER or arg_48_0.type == DROP_TYPE_ITEM and arg_48_0:getConfig("type") == Item.LOVE_LETTER_TYPE
end

function var_0_0.getOwnedCount(arg_49_0)
	return switch(arg_49_0.type, var_0_0.CountCase, var_0_0.CountDefault, arg_49_0)
end

function var_0_0.getSubClass(arg_50_0)
	return switch(arg_50_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_50_0)
end

function var_0_0.getDropRarity(arg_51_0)
	return switch(arg_51_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_51_0)
end

function var_0_0.getDropRarityDorm(arg_52_0)
	return switch(arg_52_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_52_0)
end

function var_0_0.DropTrans(arg_53_0, ...)
	return switch(arg_53_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_53_0, ...)
end

function var_0_0.AddItemOperation(arg_54_0)
	return switch(arg_54_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_54_0)
end

function var_0_0.MsgboxIntroSet(arg_55_0, ...)
	return switch(arg_55_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_55_0, ...)
end

function var_0_0.UpdateDropTpl(arg_56_0, ...)
	return switch(arg_56_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_56_0, ...)
end

function var_0_0.UpdateCustomDropTpl(arg_57_0, ...)
	return switch(arg_57_0.type, var_0_0.UpdateCustomDropCase, var_0_0.UpdateCustomDropDefault, arg_57_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_59_0)
			local var_59_0 = Item.getConfigData(id2ItemId(arg_59_0.id))

			arg_59_0.desc = var_59_0.display

			return var_59_0
		end,
		[DROP_TYPE_ITEM] = function(arg_60_0)
			warning(arg_60_0.id)

			local var_60_0 = Item.getConfigData(arg_60_0.id)

			arg_60_0.desc = var_60_0.display

			if var_60_0.type == Item.LOVE_LETTER_TYPE then
				arg_60_0.desc = string.gsub(arg_60_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_60_0.extra))
			end

			return var_60_0
		end,
		[DROP_TYPE_VITEM] = function(arg_61_0)
			local var_61_0 = Item.getConfigData(arg_61_0.id)

			assert(var_61_0, arg_61_0.id)

			arg_61_0.desc = var_61_0.display

			return var_61_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_62_0)
			local var_62_0 = Item.getConfigData(arg_62_0.id)

			arg_62_0.desc = string.gsub(var_62_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_62_0.count))

			return var_62_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_63_0)
			local var_63_0 = Equipment.getConfigData(arg_63_0.id)

			arg_63_0.desc = var_63_0.descrip

			return var_63_0
		end,
		[DROP_TYPE_SHIP] = function(arg_64_0)
			local var_64_0 = pg.ship_data_statistics[arg_64_0.id]
			local var_64_1, var_64_2, var_64_3 = ShipWordHelper.GetWordAndCV(var_64_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_64_0.desc = var_64_3 or i18n("ship_drop_desc_default")
			arg_64_0.ship = Ship.New({
				configId = arg_64_0.id,
				skin_id = arg_64_0.skinId,
				propose = arg_64_0.propose
			})
			arg_64_0.ship.remoulded = arg_64_0.remoulded
			arg_64_0.ship.virgin = arg_64_0.virgin

			return var_64_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_65_0)
			local var_65_0 = pg.furniture_data_template[arg_65_0.id]

			arg_65_0.desc = var_65_0.describe

			return var_65_0
		end,
		[DROP_TYPE_SKIN] = function(arg_66_0)
			local var_66_0 = pg.ship_skin_template[arg_66_0.id]

			if var_66_0.skin_type == ShipSkin.SKIN_TYPE_TB then
				local var_66_1, var_66_2, var_66_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_66_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_66_0.desc = var_66_3
			else
				local var_66_4, var_66_5, var_66_6 = ShipWordHelper.GetWordAndCV(arg_66_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_66_0.desc = var_66_6
			end

			return var_66_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_67_0)
			local var_67_0 = pg.ship_skin_template[arg_67_0.id]

			if var_67_0.skin_type == ShipSKin.SKIN_TYPE_TB then
				local var_67_1, var_67_2, var_67_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_67_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_67_0.desc = var_67_3
			else
				local var_67_4, var_67_5, var_67_6 = ShipWordHelper.GetWordAndCV(arg_67_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_67_0.desc = var_67_6
			end

			return var_67_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_68_0)
			local var_68_0 = pg.equip_skin_template[arg_68_0.id]

			arg_68_0.desc = var_68_0.desc

			return var_68_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_69_0)
			local var_69_0 = pg.world_item_data_template[arg_69_0.id]

			arg_69_0.desc = var_69_0.display

			return var_69_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_70_0)
			local var_70_0 = pg.item_data_frame[arg_70_0.id]

			arg_70_0.desc = var_70_0.desc

			return var_70_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_71_0)
			return pg.item_data_chat[arg_71_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_72_0)
			local var_72_0 = pg.spweapon_data_statistics[arg_72_0.id]

			arg_72_0.desc = var_72_0.descrip

			return var_72_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_73_0)
			local var_73_0 = pg.activity_ryza_item[arg_73_0.id]

			arg_73_0.item = AtelierMaterial.New({
				configId = arg_73_0.id
			})
			arg_73_0.desc = arg_73_0.item:GetDesc()

			return var_73_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_74_0)
			arg_74_0.ship = getProxy(BayProxy):getShipById(arg_74_0.count)

			local var_74_0 = pg.ship_data_statistics[arg_74_0.ship.configId]
			local var_74_1, var_74_2, var_74_3 = ShipWordHelper.GetWordAndCV(var_74_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_74_0.desc = var_74_3 or i18n("ship_drop_desc_default")

			return var_74_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_75_0)
			return arg_75_0.isWorldBuff and pg.world_SLGbuff_data[arg_75_0.id] or pg.strategy_data_template[arg_75_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_76_0)
			local var_76_0 = pg.emoji_template[arg_76_0.id]

			arg_76_0.name = var_76_0.item_name
			arg_76_0.desc = var_76_0.item_desc

			return var_76_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_77_0)
			local var_77_0 = WorldCollectionProxy.GetCollectionTemplate(arg_77_0.id)

			arg_77_0.desc = var_77_0.name

			return var_77_0
		end,
		[DROP_TYPE_META_PT] = function(arg_78_0)
			local var_78_0 = pg.ship_strengthen_meta[arg_78_0.id]
			local var_78_1 = Item.getConfigData(var_78_0.itemid)

			arg_78_0.desc = var_78_1.display

			return var_78_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_79_0)
			local var_79_0 = pg.activity_workbench_item[arg_79_0.id]

			arg_79_0.item = WorkBenchItem.New({
				configId = arg_79_0.id
			})
			arg_79_0.desc = arg_79_0.item:GetDesc()

			return var_79_0
		end,
		[DROP_TYPE_BUFF] = function(arg_80_0)
			local var_80_0 = pg.benefit_buff_template[arg_80_0.id]

			arg_80_0.desc = var_80_0.desc

			return var_80_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_81_0)
			local var_81_0 = pg.commander_data_template[arg_81_0.id]

			arg_81_0.desc = var_81_0.desc

			return var_81_0
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_82_0)
			local var_82_0 = pg.island_item_data_template[arg_82_0.id]

			arg_82_0.desc = var_82_0.desc

			return var_82_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_83_0)
			local var_83_0 = pg.island_ability_template[arg_83_0.id]

			arg_83_0.desc = ""

			return var_83_0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_84_0)
			local var_84_0 = pg.island_chara_template[arg_84_0.id]

			arg_84_0.desc = ""

			return var_84_0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_85_0)
			local var_85_0 = pg.island_furniture_template[arg_85_0.id]

			arg_85_0.desc = var_85_0.describe

			return var_85_0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_86_0)
			local var_86_0 = pg.island_dress_template[arg_86_0.id]

			arg_86_0.desc = var_86_0.desc

			return var_86_0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_87_0)
			local var_87_0 = pg.island_skin_template[arg_87_0.id]

			arg_87_0.desc = var_87_0.desc

			return var_87_0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_88_0)
			local var_88_0 = pg.island_action[arg_88_0.id]

			arg_88_0.desc = var_88_0.desc

			return var_88_0
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_89_0)
			local var_89_0 = pg.island_speedup_ticket[arg_89_0.id]

			arg_89_0.desc = var_89_0.desc

			return var_89_0
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_90_0)
			local var_90_0 = pg.island_card_diy[arg_90_0.id]

			arg_90_0.desc = var_90_0.desc

			return var_90_0
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_91_0)
			return pg.drop_data_restore[arg_91_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_92_0)
			local var_92_0 = pg.dorm3d_furniture_template[arg_92_0.id]

			arg_92_0.desc = var_92_0.desc

			return var_92_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_93_0)
			local var_93_0 = pg.dorm3d_gift[arg_93_0.id]

			arg_93_0.desc = var_93_0.display

			return var_93_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_94_0)
			local var_94_0 = pg.dorm3d_resource[arg_94_0.id]

			arg_94_0.desc = ""

			return var_94_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_95_0)
			local var_95_0 = pg.livingarea_cover[arg_95_0.id]

			arg_95_0.desc = var_95_0.desc

			return var_95_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_96_0)
			return pg.item_data_battleui[arg_96_0.id]
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_97_0)
			local var_97_0 = pg.activity_medal_template[arg_97_0.id].item

			return pg.item_virtual_data_statistics[var_97_0]
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_98_0)
			local var_98_0 = Item.getConfigData(arg_98_0.id)

			assert(var_98_0, arg_98_0.id)

			arg_98_0.desc = var_98_0.display

			return var_98_0
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_99_0)
			return pg.island_collection[arg_99_0.id]
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_100_0)
			return getIslandSeasonPtInfo()
		end
	}

	function var_0_0.ConfigDefault(arg_101_0)
		local var_101_0 = arg_101_0.type

		if tonumber(var_101_0) and var_101_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_101_1 = pg.activity_drop_type[var_101_0].relevance

			return var_101_1 and pg[var_101_1][arg_101_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_102_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_102_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_103_0)
			local var_103_0 = getProxy(BagProxy):getItemCountById(arg_103_0.id)

			if arg_103_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_103_0, 1), true
			else
				return var_103_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_104_0)
			local var_104_0 = arg_104_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_104_0], "equip groupId not exist")

			local var_104_1 = pg.equip_data_template.get_id_list_by_group[var_104_0]

			return underscore.reduce(var_104_1, 0, function(arg_105_0, arg_105_1)
				local var_105_0 = getProxy(EquipmentProxy):getEquipmentById(arg_105_1)

				return arg_105_0 + (var_105_0 and var_105_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_105_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_106_0)
			return getProxy(BayProxy):getConfigShipCount(arg_106_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_107_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_107_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_108_0)
			return arg_108_0.count, tobool(arg_108_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_109_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_109_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_110_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_110_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_111_0)
			local var_111_0 = arg_111_0:getConfig("virtual_type")

			return switch(var_111_0, {
				[22] = function()
					local var_112_0 = getProxy(ActivityProxy):getActivityById(arg_111_0:getConfig("link_id"))

					return var_112_0 and var_112_0.data1 or 0, true
				end,
				[101] = function()
					local var_113_0 = getProxy(ActivityProxy):getActivityById(arg_111_0:getConfig("link_id"))

					return var_113_0 and var_113_0.data1 or 0
				end
			}, function()
				return nil
			end)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_115_0)
			local var_115_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_115_0.id)

			return (var_115_0 and var_115_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_115_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_116_0)
			local var_116_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_116_0.type].activity_id)

			if not var_116_0 then
				return 0
			end

			local var_116_1 = var_116_0:GetItemById(arg_116_0.id)

			return var_116_1 and var_116_1.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_117_0)
			local var_117_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_117_0.id)

			return var_117_0 and (not var_117_0:expiredType() or not not var_117_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_118_0)
			local var_118_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_118_0.id)

			return var_118_0 and (not var_118_0:expiredType() or not not var_118_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_119_0)
			local var_119_0 = nowWorld()

			if var_119_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_119_0:GetInventoryProxy():GetItemCount(arg_119_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_120_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_120_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_121_0)
			local var_121_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_121_0.id)

			return var_121_0 and var_121_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_122_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_122_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_123_0)
			local var_123_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_123_0.id)

			return 1
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = getProxy(IslandProxy):GetIsland()

			if var_124_1 then
				var_124_0 = var_124_1:GetInventoryAgency():GetOwnCount(arg_124_0.id)
			end

			return var_124_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_125_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_126_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_127_0)
			local var_127_0 = getProxy(IslandProxy):GetIsland()

			if var_127_0 then
				local var_127_1 = var_127_0:GetAgoraAgency():GetFurnitures()

				for iter_127_0, iter_127_1 in ipairs(var_127_1) do
					if iter_127_1.id == arg_127_0.id then
						return iter_127_1.count
					end
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_128_0)
			local var_128_0 = getProxy(IslandProxy):GetIsland()

			if var_128_0 then
				local var_128_1 = arg_128_0:getConfig("belongto")

				if var_128_1 == 1 then
					return var_128_0:GetDressUpAgency():CheckOwnDress(arg_128_0.id) and 1 or 0
				elseif var_128_1 == 2 then
					return var_128_0:GetCharacterAgency():GetDressIdRealCount(arg_128_0.id)
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_129_0)
			local var_129_0 = getProxy(IslandProxy)

			if not var_129_0 then
				return 0
			end

			local var_129_1 = var_129_0:GetIsland()

			if var_129_1 then
				return var_129_1:GetCharacterAgency():CheckSkinIsOwned(arg_129_0.id) and 1 or 0
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_130_0)
			local var_130_0 = getProxy(IslandProxy)

			if not var_130_0 then
				return 0
			end

			local var_130_1 = var_130_0:GetIsland()

			if var_130_1 then
				return var_130_1:GetActionAgency():ExistAction(arg_130_0.id) and 1 or 0
			end

			return 0
		end
	}

	function var_0_0.CountDefault(arg_131_0)
		local var_131_0 = arg_131_0.type

		if var_131_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_131_0].activity_id):getVitemNumber(arg_131_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_132_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_133_0)
			return Item.New(arg_133_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_134_0)
			return Item.New(arg_134_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_135_0)
			return Equipment.New(arg_135_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_136_0)
			return Item.New({
				count = 1,
				id = arg_136_0.id,
				extra = arg_136_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_137_0)
			return WorldItem.New(arg_137_0)
		end
	}

	function var_0_0.SubClassDefault(arg_138_0)
		assert(false, string.format("drop type %d without subClass", arg_138_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_139_0)
			return arg_139_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_140_0)
			return arg_140_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_141_0)
			return arg_141_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_142_0)
			return arg_142_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_143_0)
			return arg_143_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_144_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_145_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_146_0)
			return arg_146_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_147_0)
			return arg_147_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_148_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_149_0)
			return arg_149_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_150_0)
			return arg_150_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_151_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_152_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_153_0)
			return arg_153_0:getConfig("rare")
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_154_0)
			return arg_154_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_155_0)
			return arg_155_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_156_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_157_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_158_0)
			return arg_158_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_159_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_160_0)
			return ItemRarity.Gold
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_161_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_162_0)
		return arg_162_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_163_0)
		return arg_163_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_164_0)
			local var_164_0 = Drop.New({
				type = arg_164_0:getConfig("type"),
				id = arg_164_0:getConfig("resource_type"),
				count = arg_164_0:getConfig("resource_num") * arg_164_0.count
			})
			local var_164_1 = Drop.New({
				type = arg_164_0:getConfig("target_type"),
				id = arg_164_0:getConfig("target_id"),
				count = arg_164_0.count
			})

			PlayerConst.UpdateLinkActivity({
				var_164_1
			})

			var_164_0.name = string.format("%s(%s)", var_164_0:getName(), var_164_1:getName())

			return var_164_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_165_0)
			for iter_165_0, iter_165_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_165_1.id].pt == arg_165_0.id then
					return nil, arg_165_0
				end
			end

			for iter_165_2, iter_165_3 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5)) do
				if pg.black_friday_battlepass_event_pt[iter_165_3.id].pt == arg_165_0.id then
					return nil, arg_165_0
				end
			end

			return arg_165_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_166_0)
			if arg_166_0.id ~= 3 then
				return nil
			end

			return arg_166_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_167_0)
			return nil, arg_167_0
		end,
		[DROP_TYPE_VITEM] = function(arg_168_0, arg_168_1, arg_168_2)
			assert(arg_168_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_168_0.id)

			return switch(arg_168_0:getConfig("virtual_type"), {
				function()
					if arg_168_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_168_0
					end

					return arg_168_0
				end,
				[6] = function()
					local var_170_0 = arg_168_2.taskId
					local var_170_1 = getProxy(ActivityProxy)
					local var_170_2 = var_170_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_170_2 then
						local var_170_3 = var_170_2.data1KeyValueList[1]

						var_170_3[var_170_0] = defaultValue(var_170_3[var_170_0], 0) + arg_168_0.count

						var_170_1:updateActivity(var_170_2)
					end

					return nil, arg_168_0
				end,
				[13] = function()
					local var_171_0 = arg_168_0:getName()
					local var_171_1 = getProxy(ActivityProxy):getActivityById(arg_168_0:getConfig("link_id"))

					if not var_171_1 or var_171_1:isEnd() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_171_0))

						return nil
					elseif var_171_1:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_171_0))

						return nil
					else
						return arg_168_0, nil
					end
				end,
				[17] = function()
					local var_172_0 = getProxy(ActivityProxy):getActivityById(arg_168_0:getConfig("link_id"))

					if var_172_0.data1 < 1 then
						return Drop.New({
							count = 1,
							type = DROP_TYPE_SHIP,
							id = var_172_0:getConfig("config_id")
						}), arg_168_0
					else
						return Drop.New({
							id = 3,
							type = DROP_TYPE_OPERATION,
							count = var_172_0.data2
						}), arg_168_0
					end
				end,
				[21] = function()
					return nil, arg_168_0
				end,
				[28] = function()
					local var_174_0 = Drop.New({
						type = arg_168_0.type,
						id = arg_168_0.id,
						count = math.floor(arg_168_0.count / 1000)
					})
					local var_174_1 = Drop.New({
						type = arg_168_0.type,
						id = arg_168_0.id,
						count = arg_168_0.count - math.floor(arg_168_0.count / 1000)
					})

					return var_174_0, var_174_1
				end
			}, function()
				return arg_168_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_176_0, arg_176_1)
			if Ship.isMetaShipByConfigID(arg_176_0.id) and Player.isMetaShipNeedToTrans(arg_176_0.id) then
				local var_176_0 = table.indexof(arg_176_1, arg_176_0.id, 1)

				if var_176_0 then
					table.remove(arg_176_1, var_176_0)
				else
					local var_176_1 = Player.metaShip2Res(arg_176_0.id)
					local var_176_2 = Drop.New(var_176_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_176_0.id, var_176_2)

					return arg_176_0, var_176_2
				end
			end

			return arg_176_0
		end,
		[DROP_TYPE_SKIN] = function(arg_177_0)
			arg_177_0.isNew = not getProxy(ShipSkinProxy):hasNonLimitSkin(arg_177_0.id)

			return arg_177_0
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_178_0)
			local var_178_0 = getProxy(PlayerProxy):getRawData()
			local var_178_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_178_0:updateMedalList({
				{
					key = arg_178_0.id,
					value = var_178_1
				}
			})

			return arg_178_0
		end,
		[DROP_TYPE_BUFF] = function(arg_179_0)
			return nil, arg_179_0
		end
	}

	function var_0_0.TransDefault(arg_180_0)
		return arg_180_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_181_0)
			local var_181_0 = id2res(arg_181_0.id)

			assert(var_181_0, "res should be defined: " .. arg_181_0.id)

			local var_181_1 = getProxy(PlayerProxy)
			local var_181_2 = var_181_1:getData()

			var_181_2:addResources({
				[var_181_0] = arg_181_0.count
			})
			var_181_1:updatePlayer(var_181_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_182_0)
			if arg_182_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_182_0 = getProxy(BagProxy):getItemCountById(arg_182_0.id)
				local var_182_1 = math.min(arg_182_0:getConfig("max_num") - var_182_0, arg_182_0.count)

				if var_182_1 > 0 then
					getProxy(BagProxy):addItemById(arg_182_0.id, var_182_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_182_0.id, arg_182_0.count, arg_182_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_183_0)
			local var_183_0 = arg_183_0:getSubClass()

			getProxy(BagProxy):addItemById(var_183_0.id, var_183_0.count, var_183_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_184_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_184_0.id, arg_184_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_185_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_186_0)
			local var_186_0 = getProxy(DormProxy)
			local var_186_1 = Furniture.New({
				id = arg_186_0.id,
				count = arg_186_0.count
			})

			if var_186_1:isRecordTime() then
				var_186_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_186_0:AddFurniture(var_186_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_187_0)
			local var_187_0 = getProxy(ShipSkinProxy)
			local var_187_1 = ShipSkin.New({
				id = arg_187_0.id
			})

			var_187_0:addSkin(var_187_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_188_0)
			arg_188_0 = arg_188_0:getSubClass()

			assert(arg_188_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_188_0.id)
			switch(arg_188_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_188_0.id, arg_188_0.count)
				end,
				function()
					local var_190_0 = getProxy(ActivityProxy)
					local var_190_1 = arg_188_0:getConfig("link_id")
					local var_190_2

					if var_190_1 > 0 then
						var_190_2 = var_190_0:getActivityById(var_190_1)
					else
						var_190_2 = var_190_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_190_2 and not var_190_2:isEnd() then
						if not table.contains(var_190_2.data1_list, arg_188_0.id) then
							table.insert(var_190_2.data1_list, arg_188_0.id)
						end

						var_190_0:updateActivity(var_190_2)
					end
				end,
				function()
					local var_191_0 = getProxy(ActivityProxy)
					local var_191_1 = var_191_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_191_0, iter_191_1 in ipairs(var_191_1) do
						iter_191_1.data1 = iter_191_1.data1 + arg_188_0.count

						local var_191_2 = iter_191_1:getConfig("config_id")
						local var_191_3 = pg.activity_vote[var_191_2]

						if var_191_3 and var_191_3.ticket_id_period == arg_188_0.id then
							iter_191_1.data3 = iter_191_1.data3 + arg_188_0.count
						end

						var_191_0:updateActivity(iter_191_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_188_0.id,
							ptCount = arg_188_0.count
						})
					end
				end,
				[4] = function()
					local var_192_0 = getProxy(ColoringProxy):getColorItems()

					var_192_0[arg_188_0.id] = (var_192_0[arg_188_0.id] or 0) + arg_188_0.count
				end,
				[6] = function()
					local var_193_0 = getProxy(ActivityProxy)
					local var_193_1 = var_193_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_193_1 then
						var_193_1.data3 = var_193_1.data3 + arg_188_0.count

						var_193_0:updateActivity(var_193_1)
					end
				end,
				[7] = function()
					local var_194_0 = getProxy(ChapterProxy)

					var_194_0:updateRemasterTicketsNum(math.min(var_194_0.remasterTickets + arg_188_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_195_0 = getProxy(ActivityProxy)
					local var_195_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_195_1 then
						var_195_1.data1_list[1] = var_195_1.data1_list[1] + arg_188_0.count

						var_195_0:updateActivity(var_195_1)
					end
				end,
				[11] = function()
					local var_196_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_196_0 and not var_196_0:isEnd() then
						var_196_0.data1 = var_196_0.data1 + arg_188_0.count
					end
				end,
				[12] = function()
					local var_197_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_197_0 and not var_197_0:isEnd() then
						var_197_0.data1KeyValueList[1][arg_188_0.id] = (var_197_0.data1KeyValueList[1][arg_188_0.id] or 0) + arg_188_0.count
					end
				end,
				[13] = function()
					local var_198_0 = getProxy(ActivityProxy):getActivityById(arg_188_0:getConfig("link_id"))

					if var_198_0:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

						return
					end

					var_198_0.data1 = var_198_0.data1 + arg_188_0.count

					getProxy(ActivityProxy):updateActivity(var_198_0)
				end,
				[14] = function()
					local var_199_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_188_0.id then
						var_199_0:AddSummonPt(arg_188_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_188_0.id then
						var_199_0:AddSummonPtOld(arg_188_0.count)
					end
				end,
				[15] = function()
					local var_200_0 = getProxy(ActivityProxy)
					local var_200_1 = var_200_0:getActivityById(arg_188_0:getConfig("link_id"))

					if not var_200_1 or var_200_1:isEnd() then
						return
					end

					if var_200_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE then
						local var_200_2 = pg.activity_event_grid[var_200_1.data1]

						if arg_188_0.id == var_200_2.ticket_item then
							var_200_1.data2 = var_200_1.data2 + arg_188_0.count
						elseif arg_188_0.id == var_200_2.explore_item then
							var_200_1.data3 = var_200_1.data3 + arg_188_0.count
						end
					elseif var_200_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_EXPEDITION then
						var_200_1.data3 = var_200_1.data3 + arg_188_0.count
					end

					var_200_0:updateActivity(var_200_1)
				end,
				[16] = function()
					local var_201_0 = getProxy(ActivityProxy)
					local var_201_1 = var_201_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_201_0, iter_201_1 in pairs(var_201_1) do
						if iter_201_1 and not iter_201_1:isEnd() and arg_188_0.id == iter_201_1:getConfig("config_id") then
							iter_201_1.data1 = iter_201_1.data1 + arg_188_0.count

							var_201_0:updateActivity(iter_201_1)
						end
					end
				end,
				[17] = function()
					local var_202_0 = getProxy(ActivityProxy)
					local var_202_1 = var_202_0:getActivityById(arg_188_0:getConfig("link_id"))

					if not var_202_1 or var_202_1:isEnd() then
						return
					end

					var_202_1.data1 = 2

					var_202_0:updateActivity(var_202_1)
				end,
				[20] = function()
					local var_203_0 = getProxy(BagProxy)
					local var_203_1 = pg.gameset.urpt_chapter_max.description
					local var_203_2 = var_203_1[1]
					local var_203_3 = var_203_1[2]
					local var_203_4 = var_203_0:GetLimitCntById(var_203_2)
					local var_203_5 = math.min(var_203_3 - var_203_4, arg_188_0.count)

					if var_203_5 > 0 then
						var_203_0:addItemById(var_203_2, var_203_5)
						var_203_0:AddLimitCnt(var_203_2, var_203_5)
					end
				end,
				[21] = function()
					local var_204_0 = getProxy(ActivityProxy)
					local var_204_1 = var_204_0:getActivityById(arg_188_0:getConfig("link_id"))

					if var_204_1 and not var_204_1:isEnd() then
						var_204_1.data2 = 1

						var_204_0:updateActivity(var_204_1)
					end
				end,
				[22] = function()
					local var_205_0 = getProxy(ActivityProxy)
					local var_205_1 = var_205_0:getActivityById(arg_188_0:getConfig("link_id"))

					if var_205_1 and not var_205_1:isEnd() then
						var_205_1.data1 = var_205_1.data1 + arg_188_0.count

						var_205_0:updateActivity(var_205_1)
					end
				end,
				[23] = function()
					local var_206_0 = (function()
						for iter_207_0, iter_207_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_188_0.id == iter_207_1[1] then
								return iter_207_1[2]
							end
						end
					end)()

					assert(var_206_0)

					local var_206_1 = getProxy(PlayerProxy)
					local var_206_2 = var_206_1:getData()

					var_206_2:addExpToLevel(var_206_0)
					var_206_1:updatePlayer(var_206_2)
				end,
				[24] = function()
					local var_208_0 = arg_188_0:getConfig("link_id")
					local var_208_1 = getProxy(ActivityProxy):getActivityById(var_208_0)

					if var_208_1 and not var_208_1:isEnd() and var_208_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_208_1.data2 = var_208_1.data2 + arg_188_0.count

						getProxy(ActivityProxy):updateActivity(var_208_1)
					end
				end,
				[25] = function()
					local var_209_0 = getProxy(ActivityProxy)
					local var_209_1 = var_209_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_209_1 and not var_209_1:isEnd() then
						var_209_1.data1 = var_209_1.data1 - 1

						if not table.contains(var_209_1.data1_list, arg_188_0.id) then
							table.insert(var_209_1.data1_list, arg_188_0.id)
						end

						var_209_0:updateActivity(var_209_1)

						local var_209_2 = arg_188_0:getConfig("link_id")

						if var_209_2 > 0 then
							local var_209_3 = var_209_0:getActivityById(var_209_2)

							if var_209_3 and not var_209_3:isEnd() then
								var_209_3.data1 = var_209_3.data1 + 1

								var_209_0:updateActivity(var_209_3)
							end
						end
					end
				end,
				[26] = function()
					local var_210_0 = getProxy(ActivityProxy)
					local var_210_1 = Clone(var_210_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_210_1 and not var_210_1:isEnd() then
						var_210_1.data1 = var_210_1.data1 + arg_188_0.count

						var_210_0:updateActivity(var_210_1)
					end
				end,
				[27] = function()
					local var_211_0 = getProxy(ActivityProxy)
					local var_211_1 = Clone(var_211_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_211_1 and not var_211_1:isEnd() then
						var_211_1:AddExp(arg_188_0.count)
						var_211_0:updateActivity(var_211_1)
					end
				end,
				[28] = function()
					local var_212_0 = getProxy(ActivityProxy)
					local var_212_1 = Clone(var_212_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_212_1 and not var_212_1:isEnd() then
						var_212_1:AddGold(arg_188_0.count)
						var_212_0:updateActivity(var_212_1)
					end
				end,
				[29] = function()
					local var_213_0 = getProxy(ActivityProxy)
					local var_213_1 = Clone(var_213_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5))

					if var_213_1 and not var_213_1:isEnd() then
						var_213_1.data1 = var_213_1.data1 + arg_188_0.count

						var_213_0:updateActivity(var_213_1)
					end
				end,
				[30] = function()
					local var_214_0 = arg_188_0:getConfig("link_id")
					local var_214_1 = getProxy(ActivityProxy):getActivityById(var_214_0)

					if not var_214_1 or var_214_1:isEnd() then
						return
					end

					local var_214_2 = arg_188_0.count

					if var_214_1:IsLimitExpItem(arg_188_0.id) then
						var_214_2 = var_214_1:FilterExp(var_214_2)
						var_214_2 = getProxy(LoveLetterProxy):AddLoveLetterExp(var_214_1:GetTargetGroupId(), var_214_2)

						var_214_1:AddDailyProgress(var_214_2)
					else
						local var_214_3 = getProxy(LoveLetterProxy):AddLoveLetterExp(var_214_1:GetTargetGroupId(), var_214_2)
					end

					getProxy(ActivityProxy):updateActivity(var_214_1)
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_217_0 = arg_188_0:getConfig("link_id")
					local var_217_1 = getProxy(ActivityProxy):getActivityById(var_217_0)

					if var_217_1 and not var_217_1:isEnd() then
						var_217_1.data1 = var_217_1.data1 + arg_188_0.count

						getProxy(ActivityProxy):updateActivity(var_217_1)
					end
				end,
				[102] = function()
					local var_218_0 = arg_188_0:getConfig("link_id")
					local var_218_1 = pg.activity_template[var_218_0].type

					switch(var_218_1, {
						[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = function()
							getProxy(CityRebuildProxy):AddPt(var_218_0, arg_188_0.count)
						end
					})
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_220_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_220_0.id, arg_220_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_221_0)
			local var_221_0 = getProxy(BayProxy)
			local var_221_1 = var_221_0:getShipById(arg_221_0.count)

			if var_221_1 then
				var_221_1:unlockActivityNpc(0)
				var_221_0:updateShip(var_221_1)
				getProxy(CollectionProxy):flushCollection(var_221_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_222_0)
			nowWorld():GetInventoryProxy():AddItem(arg_222_0.id, arg_222_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_223_0)
			local var_223_0 = getProxy(AttireProxy)
			local var_223_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_223_2 = IconFrame.New({
				id = arg_223_0.id
			})
			local var_223_3 = var_223_1 + var_223_2:getConfig("time_second")

			var_223_2:updateData({
				isNew = true,
				end_time = var_223_3
			})
			var_223_0:addAttireFrame(var_223_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_223_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_224_0)
			local var_224_0 = getProxy(AttireProxy)
			local var_224_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_224_2 = ChatFrame.New({
				id = arg_224_0.id
			})
			local var_224_3 = var_224_1 + var_224_2:getConfig("time_second")

			var_224_2:updateData({
				isNew = true,
				end_time = var_224_3
			})
			var_224_0:addAttireFrame(var_224_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_224_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_225_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_225_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_225_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_226_0)
			nowWorld():GetCollectionProxy():Unlock(arg_226_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_227_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_227_0.id):addPT(arg_227_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_228_0)
			local var_228_0 = arg_228_0.id
			local var_228_1 = arg_228_0.count
			local var_228_2 = getProxy(ShipSkinProxy)
			local var_228_3 = var_228_2:getSkinById(var_228_0)

			if var_228_3 and var_228_3:isExpireType() then
				local var_228_4 = var_228_1 + var_228_3.endTime
				local var_228_5 = ShipSkin.New({
					id = var_228_0,
					end_time = var_228_4
				})

				var_228_2:addSkin(var_228_5)
			elseif not var_228_3 then
				local var_228_6 = var_228_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_228_7 = ShipSkin.New({
					id = var_228_0,
					end_time = var_228_6
				})

				var_228_2:addSkin(var_228_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_229_0)
			local var_229_0 = arg_229_0.id
			local var_229_1 = pg.benefit_buff_template[var_229_0]

			assert(var_229_1 and var_229_1.act_id > 0, "should exist act id")

			local var_229_2 = getProxy(ActivityProxy):getActivityById(var_229_1.act_id)

			if var_229_2 and not var_229_2:isEnd() then
				local var_229_3 = var_229_1.max_time
				local var_229_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_229_3

				var_229_2:AddBuff(ActivityBuff.New(var_229_2.id, var_229_0, var_229_4))
				getProxy(ActivityProxy):updateActivity(var_229_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_230_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_231_0)
			getProxy(ApartmentProxy):ModifyRoom(arg_231_0:getConfig("room_id"), function(arg_232_0)
				arg_232_0:AddFurnitureByID(arg_231_0.id)
			end)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_233_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_233_0.id, arg_233_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_234_0)
			getProxy(ApartmentProxy):ModifyApartment(arg_234_0:getConfig("ship_group"), function(arg_235_0)
				arg_235_0:addSkin(arg_234_0.id)
			end)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_236_0)
			local var_236_0 = getProxy(LivingAreaCoverProxy)
			local var_236_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_236_0.id
			})

			var_236_0:UpdateCover(var_236_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_236_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_236_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_237_0)
			local var_237_0 = getProxy(AttireProxy)
			local var_237_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_237_2 = CombatUIStyle.New({
				id = arg_237_0.id
			})

			var_237_2:setUnlock()
			var_237_2:setNew()
			var_237_0:addAttireFrame(var_237_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_237_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_238_0)
			local var_238_0 = getProxy(IslandProxy):GetIsland()

			if not var_238_0 then
				return
			end

			var_238_0:GetInventoryAgency():AddItem(IslandItem.New({
				id = arg_238_0.id,
				num = arg_238_0.count
			}))
		end
	}

	function var_0_0.AddItemDefault(arg_239_0)
		if arg_239_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_239_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_239_0.type].activity_id)

			if arg_239_0.type == DROP_TYPE_RYZA_DROP then
				if var_239_0 and not var_239_0:isEnd() then
					var_239_0:AddItem(AtelierMaterial.New({
						configId = arg_239_0.id,
						count = arg_239_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_239_0)
				end
			elseif var_239_0 and not var_239_0:isEnd() then
				var_239_0:addVitemNumber(arg_239_0.id, arg_239_0.count)
				getProxy(ActivityProxy):updateActivity(var_239_0)
			end
		elseif arg_239_0.type >= DROP_TYPE_ISLAND_ITEM and arg_239_0.type <= DROP_TYPE_ISLAND_CARD_DIY then
			if not getProxy(IslandProxy):GetIsland() then
				return
			end

			local var_239_1 = {}

			table.insert(var_239_1, {
				type = arg_239_0.type,
				id = arg_239_0.id,
				number = arg_239_0.count
			})
			IslandDropHelper.AddItems({
				drop_list = var_239_1
			})
		else
			print("can not handle this type>>" .. arg_239_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_240_0, arg_240_1, arg_240_2)
			setText(arg_240_2, arg_240_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_241_0, arg_241_1, arg_241_2)
			local var_241_0 = arg_241_0:getConfig("display")

			if arg_241_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_241_0 = string.gsub(var_241_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_241_0.extra))
			elseif arg_241_0:getConfig("combination_display") ~= nil then
				local var_241_1 = arg_241_0:getConfig("combination_display")

				if var_241_1 and #var_241_1 > 0 then
					var_241_0 = Item.StaticCombinationDisplay(var_241_1)
				end
			end

			setText(arg_241_2, SwitchSpecialChar(var_241_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_242_0, arg_242_1, arg_242_2)
			setText(arg_242_2, arg_242_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_243_0, arg_243_1, arg_243_2)
			local var_243_0 = arg_243_0:getConfig("skin_id")
			local var_243_1, var_243_2, var_243_3 = ShipWordHelper.GetWordAndCV(var_243_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_243_2, var_243_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_244_0, arg_244_1, arg_244_2)
			local var_244_0 = arg_244_0:getConfig("skin_id")
			local var_244_1, var_244_2, var_244_3 = ShipWordHelper.GetWordAndCV(var_244_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_244_2, var_244_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_245_0, arg_245_1, arg_245_2)
			setText(arg_245_2, arg_245_1.name or arg_245_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_246_0, arg_246_1, arg_246_2)
			local var_246_0 = arg_246_0:getConfig("desc")

			for iter_246_0, iter_246_1 in ipairs({
				arg_246_0.count
			}) do
				var_246_0 = string.gsub(var_246_0, "$" .. iter_246_0, iter_246_1)
			end

			setText(arg_246_2, var_246_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_247_0, arg_247_1, arg_247_2)
			setText(arg_247_2, arg_247_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_248_0, arg_248_1, arg_248_2)
			setText(arg_248_2, arg_248_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_249_0, arg_249_1, arg_249_2)
			local var_249_0 = arg_249_0:getConfig("desc")
			local var_249_1 = _.map(arg_249_0:getConfig("equip_type"), function(arg_250_0)
				return EquipType.Type2Name2(arg_250_0)
			end)

			setText(arg_249_2, var_249_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_249_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_251_0, arg_251_1, arg_251_2)
			setText(arg_251_2, arg_251_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_252_0, arg_252_1, arg_252_2)
			setText(arg_252_2, arg_252_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_253_0, arg_253_1, arg_253_2, arg_253_3)
			local var_253_0 = WorldCollectionProxy.GetCollectionType(arg_253_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_253_2, i18n("world_" .. var_253_0 .. "_desc", arg_253_0:getConfig("name")))
			setText(arg_253_3, i18n("world_" .. var_253_0 .. "_name", arg_253_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_254_0, arg_254_1, arg_254_2)
			setText(arg_254_2, arg_254_0.desc and arg_254_0.desc or arg_254_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_255_0, arg_255_1, arg_255_2)
			setText(arg_255_2, arg_255_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_256_0, arg_256_1, arg_256_2)
			setText(arg_256_2, arg_256_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_257_0, arg_257_1, arg_257_2)
			local var_257_0 = string.gsub(arg_257_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_257_0.count))

			setText(arg_257_2, SwitchSpecialChar(var_257_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_258_0, arg_258_1, arg_258_2)
			setText(arg_258_2, arg_258_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_259_0, arg_259_1, arg_259_2)
			setText(arg_259_2, arg_259_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_260_0, arg_260_1, arg_260_2)
			setText(arg_260_2, arg_260_0:getConfig("desc"))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_261_0, arg_261_1, arg_261_2)
			setText(arg_261_2, arg_261_0:getConfig("display"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_262_0, arg_262_1, arg_262_2)
			setText(arg_262_2, arg_262_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_263_0, arg_263_1, arg_263_2)
			setText(arg_263_2, arg_263_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_264_0, arg_264_1, arg_264_2)
			setText(arg_264_2, "")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_265_0, arg_265_1, arg_265_2)
			setText(arg_265_2, arg_265_0.desc)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_266_0, arg_266_1, arg_266_2)
			setText(arg_266_2, arg_266_0.desc)
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_267_0, arg_267_1, arg_267_2)
			setText(arg_267_2, arg_267_0.desc)
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_268_0, arg_268_1, arg_268_2)
			setText(arg_268_2, arg_268_0.desc)
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_269_0, arg_269_1, arg_269_2)
		if arg_269_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_269_2, arg_269_0:getConfig("display"))
		else
			setText(arg_269_2, arg_269_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_270_0, arg_270_1, arg_270_2)
			if arg_270_0.id == PlayerConst.ResStoreGold or arg_270_0.id == PlayerConst.ResStoreOil then
				arg_270_2 = arg_270_2 or {}
				arg_270_2.frame = "frame_store"
			end

			updateItem(arg_270_1, Item.New({
				id = id2ItemId(arg_270_0.id)
			}), arg_270_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_271_0, arg_271_1, arg_271_2)
			updateItem(arg_271_1, arg_271_0:getSubClass(), arg_271_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_272_0, arg_272_1, arg_272_2)
			updateEquipment(arg_272_1, arg_272_0:getSubClass(), arg_272_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_273_0, arg_273_1, arg_273_2)
			updateShip(arg_273_1, arg_273_0.ship, arg_273_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_274_0, arg_274_1, arg_274_2)
			updateShip(arg_274_1, arg_274_0.ship, arg_274_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_275_0, arg_275_1, arg_275_2)
			updateFurniture(arg_275_1, arg_275_0, arg_275_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_276_0, arg_276_1, arg_276_2)
			arg_276_2.isWorldBuff = arg_276_0.isWorldBuff

			updateStrategy(arg_276_1, arg_276_0, arg_276_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_277_0, arg_277_1, arg_277_2)
			arg_277_2.isSkin = true
			arg_277_2.isNew = arg_277_0.isNew

			updateShip(arg_277_1, Ship.New({
				configId = tonumber(arg_277_0:getConfig("ship_group") .. "1"),
				skin_id = arg_277_0.id
			}), arg_277_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_278_0, arg_278_1, arg_278_2)
			local var_278_0 = setmetatable({
				count = arg_278_0.count
			}, {
				__index = arg_278_0:getConfigTable()
			})

			updateEquipmentSkin(arg_278_1, var_278_0, arg_278_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_279_0, arg_279_1, arg_279_2)
			updateItem(arg_279_1, Item.New({
				id = arg_279_0.id
			}), arg_279_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_280_0, arg_280_1, arg_280_2)
			updateWorldItem(arg_280_1, WorldItem.New({
				id = arg_280_0.id
			}), arg_280_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_281_0, arg_281_1, arg_281_2)
			updateWorldCollection(arg_281_1, arg_281_0, arg_281_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_282_0, arg_282_1, arg_282_2)
			updateAttire(arg_282_1, AttireConst.TYPE_CHAT_FRAME, arg_282_0:getConfigTable(), arg_282_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_283_0, arg_283_1, arg_283_2)
			updateAttire(arg_283_1, AttireConst.TYPE_ICON_FRAME, arg_283_0:getConfigTable(), arg_283_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_284_0, arg_284_1, arg_284_2)
			updateEmoji(arg_284_1, arg_284_0:getConfigTable(), arg_284_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_285_0, arg_285_1, arg_285_2)
			arg_285_2.count = 1

			updateItem(arg_285_1, arg_285_0:getSubClass(), arg_285_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_286_0, arg_286_1, arg_286_2)
			updateSpWeapon(arg_286_1, SpWeapon.New({
				id = arg_286_0.id
			}), arg_286_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_287_0, arg_287_1, arg_287_2)
			updateItem(arg_287_1, Item.New({
				id = arg_287_0:getConfig("id")
			}), arg_287_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_288_0, arg_288_1, arg_288_2)
			arg_288_2.isSkin = true
			arg_288_2.isTimeLimit = true
			arg_288_2.count = 1

			updateShip(arg_288_1, Ship.New({
				configId = tonumber(arg_288_0:getConfig("ship_group") .. "1"),
				skin_id = arg_288_0.id
			}), arg_288_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_289_0, arg_289_1, arg_289_2)
			AtelierMaterial.UpdateRyzaItem(arg_289_1, arg_289_0.item, arg_289_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_290_0, arg_290_1, arg_290_2)
			WorkBenchItem.UpdateDrop(arg_290_1, arg_290_0.item, arg_290_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_291_0, arg_291_1, arg_291_2)
			WorkBenchItem.UpdateDrop(arg_291_1, WorkBenchItem.New({
				configId = arg_291_0.id,
				count = arg_291_0.count
			}), arg_291_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_292_0, arg_292_1, arg_292_2)
			updateBuff(arg_292_1, arg_292_0.id, arg_292_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_293_0, arg_293_1, arg_293_2)
			updateCommander(arg_293_1, arg_293_0, arg_293_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_294_0, arg_294_1, arg_294_2)
			updateCover(arg_294_1, arg_294_0, arg_294_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_295_0, arg_295_1, arg_295_2)
			updateAttireCombatUI(arg_295_1, AttireConst.TYPE_ICON_FRAME, arg_295_0:getConfigTable(), arg_295_2)
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_296_0, arg_296_1, arg_296_2)
			updateActivityMedal(arg_296_1, arg_296_0:getConfigTable(), arg_296_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_297_0, arg_297_1, arg_297_2)
		updateDefaultIconTpl(arg_297_1, arg_297_0, arg_297_2)
	end

	var_0_0.UpdateCustomDropCase = {
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_298_0, arg_298_1, arg_298_2)
			updateDorm3dIcon(arg_298_1, arg_298_0, arg_298_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_299_0, arg_299_1, arg_299_2)
			updateDorm3dIcon(arg_299_1, arg_299_0, arg_299_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_300_0, arg_300_1, arg_300_2)
			updateDorm3dIcon(arg_300_1, arg_300_0, arg_300_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_301_0, arg_301_1, arg_301_2)
			updateIslandItem(arg_301_1, arg_301_0, arg_301_2)
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_302_0, arg_302_1, arg_302_2)
			updateIslandUnlock(arg_302_1, arg_302_0, arg_302_2)
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_303_0, arg_303_1, arg_303_2)
			updateIslandInvitation(arg_303_1, arg_303_0, arg_303_2)
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_304_0, arg_304_1, arg_304_2)
			updateIslandSeasonPt(arg_304_1, arg_304_0, arg_304_2)
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_305_0, arg_305_1, arg_305_2)
			updateIslandWatherCollect(arg_305_1, arg_305_0, arg_305_2)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_306_0, arg_306_1, arg_306_2)
			updateIslandFurniture(arg_306_1, arg_306_0, arg_306_2)
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_307_0, arg_307_1, arg_307_2)
			updateIslandCardDiy(arg_307_1, arg_307_0, arg_307_2)
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_308_0, arg_308_1, arg_308_2)
			updateIslandSpeedupTicket(arg_308_1, arg_308_0, arg_308_2)
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_309_0, arg_309_1, arg_309_2)
			updateItem(arg_309_1, Item.New({
				id = arg_309_0.id
			}), arg_309_2)
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_310_0, arg_310_1, arg_310_2)
			updateIslandSkin(arg_310_1, arg_310_0, arg_310_2)
		end
	}

	function var_0_0.UpdateCustomDropDefault(arg_311_0, arg_311_1, arg_311_2)
		if arg_311_2.style == "dorm" then
			updateDorm3dIcon(arg_311_1, arg_311_0, arg_311_2)
		elseif arg_311_2.style == "island" then
			updateIslandDefaultIconTpl(arg_311_1, arg_311_0, arg_311_2)
		else
			warning(string.format("without dropType %d in updateCustomDrop", arg_311_0.type))
		end
	end
end

return var_0_0
