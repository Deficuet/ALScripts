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

function var_0_0.getOwnedLimit(arg_52_0)
	return switch(arg_52_0.type, var_0_0.LimitCase, var_0_0.LimitDefault, arg_52_0)
end

function var_0_0.getSubClass(arg_53_0)
	return switch(arg_53_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_53_0)
end

function var_0_0.getDropRarity(arg_54_0)
	return switch(arg_54_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_54_0)
end

function var_0_0.getDropRarityDorm(arg_55_0)
	return switch(arg_55_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_55_0)
end

function var_0_0.DropTrans(arg_56_0, ...)
	return switch(arg_56_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_56_0, ...)
end

function var_0_0.AddItemOperation(arg_57_0)
	return switch(arg_57_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_57_0)
end

function var_0_0.MsgboxIntroSet(arg_58_0, ...)
	return switch(arg_58_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_58_0, ...)
end

function var_0_0.UpdateDropTpl(arg_59_0, ...)
	return switch(arg_59_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_59_0, ...)
end

function var_0_0.UpdateCustomDropTpl(arg_60_0, ...)
	return switch(arg_60_0.type, var_0_0.UpdateCustomDropCase, var_0_0.UpdateCustomDropDefault, arg_60_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_62_0)
			local var_62_0 = Item.getConfigData(id2ItemId(arg_62_0.id))

			arg_62_0.desc = var_62_0.display

			return var_62_0
		end,
		[DROP_TYPE_ITEM] = function(arg_63_0)
			local var_63_0 = Item.getConfigData(arg_63_0.id)

			arg_63_0.desc = var_63_0.display

			if var_63_0.type == Item.LOVE_LETTER_TYPE then
				arg_63_0.desc = string.gsub(arg_63_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_63_0.extra))
			end

			return var_63_0
		end,
		[DROP_TYPE_VITEM] = function(arg_64_0)
			local var_64_0 = Item.getConfigData(arg_64_0.id)

			assert(var_64_0, arg_64_0.id)

			arg_64_0.desc = var_64_0.display

			return var_64_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_65_0)
			local var_65_0 = Item.getConfigData(arg_65_0.id)

			arg_65_0.desc = string.gsub(var_65_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_65_0.count))

			return var_65_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_66_0)
			local var_66_0 = Equipment.getConfigData(arg_66_0.id)

			arg_66_0.desc = var_66_0.descrip

			return var_66_0
		end,
		[DROP_TYPE_SHIP] = function(arg_67_0)
			local var_67_0 = pg.ship_data_statistics[arg_67_0.id]
			local var_67_1, var_67_2, var_67_3 = ShipWordHelper.GetWordAndCV(var_67_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_67_0.desc = var_67_3 or i18n("ship_drop_desc_default")
			arg_67_0.ship = Ship.New({
				configId = arg_67_0.id,
				skin_id = arg_67_0.skinId,
				propose = arg_67_0.propose
			})
			arg_67_0.ship.remoulded = arg_67_0.remoulded
			arg_67_0.ship.virgin = arg_67_0.virgin

			return var_67_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_68_0)
			local var_68_0 = pg.furniture_data_template[arg_68_0.id]

			arg_68_0.desc = var_68_0.describe

			return var_68_0
		end,
		[DROP_TYPE_SKIN] = function(arg_69_0)
			local var_69_0 = pg.ship_skin_template[arg_69_0.id]

			if var_69_0.skin_type == ShipSkin.SKIN_TYPE_TB then
				local var_69_1, var_69_2, var_69_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_69_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_69_0.desc = var_69_3
			else
				local var_69_4, var_69_5, var_69_6 = ShipWordHelper.GetWordAndCV(arg_69_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_69_0.desc = var_69_6
			end

			return var_69_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_70_0)
			local var_70_0 = pg.ship_skin_template[arg_70_0.id]

			if var_70_0.skin_type == ShipSKin.SKIN_TYPE_TB then
				local var_70_1, var_70_2, var_70_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_70_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_70_0.desc = var_70_3
			else
				local var_70_4, var_70_5, var_70_6 = ShipWordHelper.GetWordAndCV(arg_70_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_70_0.desc = var_70_6
			end

			return var_70_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_71_0)
			local var_71_0 = pg.equip_skin_template[arg_71_0.id]

			arg_71_0.desc = var_71_0.desc

			return var_71_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_72_0)
			local var_72_0 = pg.world_item_data_template[arg_72_0.id]

			arg_72_0.desc = var_72_0.display

			return var_72_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_73_0)
			local var_73_0 = pg.item_data_frame[arg_73_0.id]

			arg_73_0.desc = var_73_0.desc

			return var_73_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_74_0)
			return pg.item_data_chat[arg_74_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_75_0)
			local var_75_0 = pg.spweapon_data_statistics[arg_75_0.id]

			arg_75_0.desc = var_75_0.descrip

			return var_75_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_76_0)
			local var_76_0 = pg.activity_ryza_item[arg_76_0.id]

			arg_76_0.item = AtelierMaterial.New({
				configId = arg_76_0.id
			})
			arg_76_0.desc = arg_76_0.item:GetDesc()

			return var_76_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_77_0)
			arg_77_0.ship = getProxy(BayProxy):getShipById(arg_77_0.count)

			local var_77_0 = pg.ship_data_statistics[arg_77_0.ship.configId]
			local var_77_1, var_77_2, var_77_3 = ShipWordHelper.GetWordAndCV(var_77_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_77_0.desc = var_77_3 or i18n("ship_drop_desc_default")

			return var_77_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_78_0)
			return arg_78_0.isWorldBuff and pg.world_SLGbuff_data[arg_78_0.id] or pg.strategy_data_template[arg_78_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_79_0)
			local var_79_0 = pg.emoji_template[arg_79_0.id]

			arg_79_0.name = var_79_0.item_name
			arg_79_0.desc = var_79_0.item_desc

			return var_79_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_80_0)
			local var_80_0 = WorldCollectionProxy.GetCollectionTemplate(arg_80_0.id)

			arg_80_0.desc = var_80_0.name

			return var_80_0
		end,
		[DROP_TYPE_META_PT] = function(arg_81_0)
			local var_81_0 = pg.ship_strengthen_meta[arg_81_0.id]
			local var_81_1 = Item.getConfigData(var_81_0.itemid)

			arg_81_0.desc = var_81_1.display

			return var_81_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_82_0)
			local var_82_0 = pg.activity_workbench_item[arg_82_0.id]

			arg_82_0.item = WorkBenchItem.New({
				configId = arg_82_0.id
			})
			arg_82_0.desc = arg_82_0.item:GetDesc()

			return var_82_0
		end,
		[DROP_TYPE_BUFF] = function(arg_83_0)
			local var_83_0 = pg.benefit_buff_template[arg_83_0.id]

			arg_83_0.desc = var_83_0.desc

			return var_83_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_84_0)
			local var_84_0 = pg.commander_data_template[arg_84_0.id]

			arg_84_0.desc = var_84_0.desc

			return var_84_0
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_85_0)
			local var_85_0 = pg.island_item_data_template[arg_85_0.id]

			arg_85_0.desc = var_85_0.desc

			return var_85_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_86_0)
			local var_86_0 = pg.island_ability_template[arg_86_0.id]

			arg_86_0.desc = ""

			return var_86_0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_87_0)
			local var_87_0 = pg.island_chara_template[arg_87_0.id]
			local var_87_1 = var_87_0.invite_item

			arg_87_0.desc = pg.island_item_data_template[var_87_1].desc

			return var_87_0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_88_0)
			local var_88_0 = pg.island_furniture_template[arg_88_0.id]

			arg_88_0.desc = var_88_0.describe

			return var_88_0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_89_0)
			local var_89_0 = pg.island_dress_template[arg_89_0.id]

			arg_89_0.desc = var_89_0.desc

			return var_89_0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_90_0)
			local var_90_0 = pg.island_skin_template[arg_90_0.id]

			arg_90_0.desc = var_90_0.desc

			return var_90_0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_91_0)
			local var_91_0 = pg.island_action[arg_91_0.id]

			arg_91_0.desc = var_91_0.desc

			return var_91_0
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_92_0)
			local var_92_0 = pg.island_speedup_ticket[arg_92_0.id]

			arg_92_0.desc = var_92_0.desc

			return var_92_0
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_93_0)
			local var_93_0 = pg.island_card_diy[arg_93_0.id]

			arg_93_0.desc = var_93_0.desc

			return var_93_0
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_94_0)
			return pg.drop_data_restore[arg_94_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_95_0)
			local var_95_0 = pg.dorm3d_furniture_template[arg_95_0.id]

			arg_95_0.desc = var_95_0.desc

			return var_95_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_96_0)
			local var_96_0 = pg.dorm3d_gift[arg_96_0.id]

			arg_96_0.desc = var_96_0.display

			return var_96_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_97_0)
			local var_97_0 = pg.dorm3d_resource[arg_97_0.id]

			arg_97_0.desc = ""

			return var_97_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_98_0)
			local var_98_0 = pg.livingarea_cover[arg_98_0.id]

			arg_98_0.desc = var_98_0.desc

			return var_98_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_99_0)
			return pg.item_data_battleui[arg_99_0.id]
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_100_0)
			local var_100_0 = pg.activity_medal_template[arg_100_0.id].item

			return pg.item_virtual_data_statistics[var_100_0]
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_101_0)
			local var_101_0 = Item.getConfigData(arg_101_0.id)

			assert(var_101_0, arg_101_0.id)

			arg_101_0.desc = var_101_0.display

			return var_101_0
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_102_0)
			return pg.island_collection[arg_102_0.id]
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_103_0)
			local var_103_0 = pg.island_set.season_pt_show.key_value_int
			local var_103_1 = pg.island_item_data_template[var_103_0]

			arg_103_0.desc = var_103_1.desc

			return var_103_1
		end
	}

	function var_0_0.ConfigDefault(arg_104_0)
		local var_104_0 = arg_104_0.type

		if tonumber(var_104_0) and var_104_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_104_1 = pg.activity_drop_type[var_104_0].relevance

			return var_104_1 and pg[var_104_1][arg_104_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_105_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_105_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_106_0)
			local var_106_0 = getProxy(BagProxy):getItemCountById(arg_106_0.id)

			if arg_106_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_106_0, 1), true
			else
				return var_106_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_107_0)
			local var_107_0 = arg_107_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_107_0], "equip groupId not exist")

			local var_107_1 = pg.equip_data_template.get_id_list_by_group[var_107_0]

			return underscore.reduce(var_107_1, 0, function(arg_108_0, arg_108_1)
				local var_108_0 = getProxy(EquipmentProxy):getEquipmentById(arg_108_1)

				return arg_108_0 + (var_108_0 and var_108_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_108_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_109_0)
			return getProxy(BayProxy):getConfigShipCount(arg_109_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_110_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_110_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_111_0)
			return arg_111_0.count, tobool(arg_111_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_112_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_112_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_113_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_113_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_114_0)
			local var_114_0 = arg_114_0:getConfig("virtual_type")

			return switch(var_114_0, {
				[22] = function()
					local var_115_0 = getProxy(ActivityProxy):getActivityById(arg_114_0:getConfig("link_id"))

					return var_115_0 and var_115_0.data1 or 0, true
				end,
				[101] = function()
					local var_116_0 = getProxy(ActivityProxy):getActivityById(arg_114_0:getConfig("link_id"))

					return var_116_0 and var_116_0.data1 or 0
				end,
				[103] = function()
					local var_117_0 = getProxy(ActivityProxy):getActivityById(arg_114_0:getConfig("link_id"))

					return switch(var_117_0:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2] = function()
							return var_117_0.data4
						end
					}, function()
						assert(false)
					end)
				end,
				[104] = function()
					local var_120_0 = getProxy(CollectionProxy):GetTrophyById(arg_114_0:getConfig("link_id"))

					if var_120_0 and (var_120_0:canClaimed() or var_120_0:isClaimed()) then
						return 1
					else
						return 0
					end
				end
			}, function()
				return nil
			end)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_122_0)
			local var_122_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_122_0.id)

			return (var_122_0 and var_122_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_122_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_123_0)
			local var_123_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_123_0.type].activity_id)

			if not var_123_0 then
				return 0
			end

			local var_123_1 = var_123_0:GetItemById(arg_123_0.id)

			return var_123_1 and var_123_1.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_124_0)
			local var_124_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_124_0.id)

			return var_124_0 and var_124_0:isOwned() and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_125_0)
			local var_125_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_125_0.id)

			return var_125_0 and var_125_0:isOwned() and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_126_0)
			local var_126_0 = nowWorld()

			if var_126_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_126_0:GetInventoryProxy():GetItemCount(arg_126_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_127_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_127_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_128_0)
			local var_128_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_128_0.id)

			return var_128_0 and var_128_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_129_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_129_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_130_0)
			local var_130_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_130_0.id)

			return 1
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_131_0)
			local var_131_0 = 0
			local var_131_1 = getProxy(IslandProxy):GetIsland()

			if var_131_1 then
				var_131_0 = var_131_1:GetInventoryAgency():GetOwnCount(arg_131_0.id)
			end

			return var_131_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_132_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_133_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_134_0)
			local var_134_0 = getProxy(IslandProxy):GetIsland()

			if var_134_0 then
				local var_134_1 = var_134_0:GetAgoraAgency():GetFurnitures()

				for iter_134_0, iter_134_1 in ipairs(var_134_1) do
					if iter_134_1.id == arg_134_0.id then
						return iter_134_1.count
					end
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_135_0)
			local var_135_0 = getProxy(IslandProxy):GetIsland()

			if var_135_0 then
				local var_135_1 = arg_135_0:getConfig("belongto")

				if var_135_1 == 1 then
					return var_135_0:GetDressUpAgency():CheckOwnDress(arg_135_0.id) and 1 or 0
				elseif var_135_1 == 2 then
					return var_135_0:GetCharacterAgency():GetDressIdRealCount(arg_135_0.id)
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_136_0)
			local var_136_0 = getProxy(IslandProxy)

			if not var_136_0 then
				return 0
			end

			local var_136_1 = var_136_0:GetIsland()

			if var_136_1 then
				return var_136_1:GetCharacterAgency():CheckSkinIsOwned(arg_136_0.id) and 1 or 0
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_137_0)
			local var_137_0 = getProxy(IslandProxy)

			if not var_137_0 then
				return 0
			end

			local var_137_1 = var_137_0:GetIsland()

			if var_137_1 then
				return var_137_1:GetActionAgency():ExistAction(arg_137_0.id) and 1 or 0
			end

			return 0
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_138_0)
			local var_138_0 = getProxy(IslandProxy)

			if not var_138_0 then
				return 0
			end

			local var_138_1 = var_138_0:GetIsland()

			if var_138_1 then
				return var_138_1:GetSeasonAgency():GetSeason():GetPt()
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_139_0)
			local var_139_0 = getProxy(IslandProxy)

			if not var_139_0 then
				return 0
			end

			local var_139_1 = var_139_0:GetIsland()

			if var_139_1 then
				return var_139_1:GetCardDiyAgency():GetIdCount(arg_139_0.id)
			end

			return 0
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_140_0)
			local var_140_0 = getProxy(PlayerProxy):getRawData()

			return var_140_0 and var_140_0:getActivityMedalExist(arg_140_0.id) and 1 or 0
		end
	}

	function var_0_0.CountDefault(arg_141_0)
		local var_141_0 = arg_141_0.type

		if var_141_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_141_0].activity_id):getVitemNumber(arg_141_0.id)
		else
			return 0, false
		end
	end

	var_0_0.LimitCase = {
		[DROP_TYPE_FURNITURE] = function(arg_142_0)
			return arg_142_0:getConfig("count")
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_143_0)
			return 1
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_144_0)
			return 1
		end,
		[DROP_TYPE_SKIN] = function(arg_145_0)
			return 1
		end
	}

	function var_0_0.LimitDefault(arg_146_0)
		return 0
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_147_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_148_0)
			return Item.New(arg_148_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_149_0)
			return Item.New(arg_149_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_150_0)
			return Equipment.New(arg_150_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_151_0)
			return Item.New({
				count = 1,
				id = arg_151_0.id,
				extra = arg_151_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_152_0)
			return WorldItem.New(arg_152_0)
		end
	}

	function var_0_0.SubClassDefault(arg_153_0)
		assert(false, string.format("drop type %d without subClass", arg_153_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_154_0)
			return arg_154_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_155_0)
			return arg_155_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_156_0)
			return arg_156_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_157_0)
			return arg_157_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_158_0)
			return arg_158_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_159_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_160_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_161_0)
			return arg_161_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_162_0)
			return arg_162_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_163_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_164_0)
			return arg_164_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_165_0)
			return arg_165_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_166_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_167_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_168_0)
			return arg_168_0:getConfig("rare")
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_169_0)
			return arg_169_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_170_0)
			return arg_170_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_171_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_172_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_173_0)
			return arg_173_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_174_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_175_0)
			return ItemRarity.Gold
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_176_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_177_0)
		return arg_177_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_178_0)
		return arg_178_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_179_0)
			local var_179_0 = Drop.New({
				type = arg_179_0:getConfig("type"),
				id = arg_179_0:getConfig("resource_type"),
				count = arg_179_0:getConfig("resource_num") * arg_179_0.count
			})
			local var_179_1 = Drop.New({
				type = arg_179_0:getConfig("target_type"),
				id = arg_179_0:getConfig("target_id"),
				count = arg_179_0.count
			})

			PlayerConst.UpdateLinkActivity({
				var_179_1
			})

			var_179_0.name = string.format("%s(%s)", var_179_0:getName(), var_179_1:getName())

			return var_179_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_180_0)
			for iter_180_0, iter_180_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_180_1.id].pt == arg_180_0.id then
					return nil, arg_180_0
				end
			end

			for iter_180_2, iter_180_3 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5)) do
				if pg.black_friday_battlepass_event_pt[iter_180_3.id].pt == arg_180_0.id then
					return nil, arg_180_0
				end
			end

			return arg_180_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_181_0)
			if arg_181_0.id ~= 3 then
				return nil
			end

			return arg_181_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_182_0)
			return nil, arg_182_0
		end,
		[DROP_TYPE_VITEM] = function(arg_183_0, arg_183_1, arg_183_2)
			assert(arg_183_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_183_0.id)

			return switch(arg_183_0:getConfig("virtual_type"), {
				function()
					if arg_183_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_183_0
					end

					return arg_183_0
				end,
				[6] = function()
					local var_185_0 = arg_183_2.taskId
					local var_185_1 = getProxy(ActivityProxy)
					local var_185_2 = var_185_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_185_2 then
						local var_185_3 = var_185_2.data1KeyValueList[1]

						var_185_3[var_185_0] = defaultValue(var_185_3[var_185_0], 0) + arg_183_0.count

						var_185_1:updateActivity(var_185_2)
					end

					return nil, arg_183_0
				end,
				[13] = function()
					local var_186_0 = arg_183_0:getName()
					local var_186_1 = getProxy(ActivityProxy):getActivityById(arg_183_0:getConfig("link_id"))

					if not var_186_1 or var_186_1:isEnd() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_186_0))

						return nil
					elseif var_186_1:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_186_0))

						return nil
					else
						return arg_183_0, nil
					end
				end,
				[17] = function()
					local var_187_0 = getProxy(ActivityProxy):getActivityById(arg_183_0:getConfig("link_id"))

					if var_187_0.data1 < 1 then
						return Drop.New({
							count = 1,
							type = DROP_TYPE_SHIP,
							id = var_187_0:getConfig("config_id")
						}), arg_183_0
					else
						return Drop.New({
							id = 3,
							type = DROP_TYPE_OPERATION,
							count = var_187_0.data2
						}), arg_183_0
					end
				end,
				[21] = function()
					return nil, arg_183_0
				end,
				[28] = function()
					local var_189_0 = Drop.New({
						type = arg_183_0.type,
						id = arg_183_0.id,
						count = math.floor(arg_183_0.count / 1000)
					})
					local var_189_1 = Drop.New({
						type = arg_183_0.type,
						id = arg_183_0.id,
						count = arg_183_0.count - math.floor(arg_183_0.count / 1000)
					})

					return var_189_0, var_189_1
				end
			}, function()
				return arg_183_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_191_0, arg_191_1)
			if Ship.isMetaShipByConfigID(arg_191_0.id) and Player.isMetaShipNeedToTrans(arg_191_0.id) then
				local var_191_0 = table.indexof(arg_191_1, arg_191_0.id, 1)

				if var_191_0 then
					table.remove(arg_191_1, var_191_0)
				else
					local var_191_1 = Player.metaShip2Res(arg_191_0.id)
					local var_191_2 = Drop.New(var_191_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_191_0.id, var_191_2)

					return arg_191_0, var_191_2
				end
			end

			return arg_191_0
		end,
		[DROP_TYPE_SKIN] = function(arg_192_0)
			arg_192_0.isNew = not getProxy(ShipSkinProxy):hasNonLimitSkin(arg_192_0.id)

			return arg_192_0
		end,
		[DROP_TYPE_BUFF] = function(arg_193_0)
			return nil, arg_193_0
		end
	}

	function var_0_0.TransDefault(arg_194_0)
		return arg_194_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_195_0)
			local var_195_0 = id2res(arg_195_0.id)

			assert(var_195_0, "res should be defined: " .. arg_195_0.id)

			local var_195_1 = getProxy(PlayerProxy)
			local var_195_2 = var_195_1:getData()

			var_195_2:addResources({
				[var_195_0] = arg_195_0.count
			})
			var_195_1:updatePlayer(var_195_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_196_0)
			if arg_196_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_196_0 = getProxy(BagProxy):getItemCountById(arg_196_0.id)
				local var_196_1 = math.min(arg_196_0:getConfig("max_num") - var_196_0, arg_196_0.count)

				if var_196_1 > 0 then
					getProxy(BagProxy):addItemById(arg_196_0.id, var_196_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_196_0.id, arg_196_0.count, arg_196_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_197_0)
			local var_197_0 = arg_197_0:getSubClass()

			getProxy(BagProxy):addItemById(var_197_0.id, var_197_0.count, var_197_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_198_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_198_0.id, arg_198_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_199_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_200_0)
			local var_200_0 = getProxy(DormProxy)
			local var_200_1 = Furniture.New({
				id = arg_200_0.id,
				count = arg_200_0.count
			})

			if var_200_1:isRecordTime() then
				var_200_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			local var_200_2 = var_200_0:getRawData()

			var_200_2:AddFurniture(var_200_1)
			var_200_0:updateDrom(var_200_2, BackYardConst.DORM_UPDATE_TYPE_FURNITURE)
		end,
		[DROP_TYPE_SKIN] = function(arg_201_0)
			local var_201_0 = getProxy(ShipSkinProxy)
			local var_201_1 = ShipSkin.New({
				id = arg_201_0.id
			})

			var_201_0:addSkin(var_201_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_202_0)
			arg_202_0 = arg_202_0:getSubClass()

			assert(arg_202_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_202_0.id)
			switch(arg_202_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_202_0.id, arg_202_0.count)
				end,
				function()
					local var_204_0 = getProxy(ActivityProxy)
					local var_204_1 = arg_202_0:getConfig("link_id")
					local var_204_2

					if var_204_1 > 0 then
						var_204_2 = var_204_0:getActivityById(var_204_1)
					else
						var_204_2 = var_204_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_204_2 and not var_204_2:isEnd() then
						if not table.contains(var_204_2.data1_list, arg_202_0.id) then
							table.insert(var_204_2.data1_list, arg_202_0.id)
						end

						var_204_0:updateActivity(var_204_2)
					end
				end,
				function()
					local var_205_0 = getProxy(ActivityProxy)
					local var_205_1 = var_205_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_205_0, iter_205_1 in ipairs(var_205_1) do
						iter_205_1.data1 = iter_205_1.data1 + arg_202_0.count

						local var_205_2 = iter_205_1:getConfig("config_id")
						local var_205_3 = pg.activity_vote[var_205_2]

						if var_205_3 and var_205_3.ticket_id_period == arg_202_0.id then
							iter_205_1.data3 = iter_205_1.data3 + arg_202_0.count
						end

						var_205_0:updateActivity(iter_205_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_202_0.id,
							ptCount = arg_202_0.count
						})
					end
				end,
				[4] = function()
					local var_206_0 = getProxy(ColoringProxy):getColorItems()

					var_206_0[arg_202_0.id] = (var_206_0[arg_202_0.id] or 0) + arg_202_0.count
				end,
				[6] = function()
					local var_207_0 = getProxy(ActivityProxy)
					local var_207_1 = var_207_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_207_1 then
						var_207_1.data3 = var_207_1.data3 + arg_202_0.count

						var_207_0:updateActivity(var_207_1)
					end
				end,
				[7] = function()
					local var_208_0 = getProxy(ChapterProxy)

					var_208_0:updateRemasterTicketsNum(math.min(var_208_0.remasterTickets + arg_202_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_209_0 = getProxy(ActivityProxy)
					local var_209_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_209_1 then
						var_209_1.data1_list[1] = var_209_1.data1_list[1] + arg_202_0.count

						var_209_0:updateActivity(var_209_1)
					end
				end,
				[11] = function()
					local var_210_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_210_0 and not var_210_0:isEnd() then
						var_210_0.data1 = var_210_0.data1 + arg_202_0.count
					end
				end,
				[12] = function()
					local var_211_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_211_0 and not var_211_0:isEnd() then
						var_211_0.data1KeyValueList[1][arg_202_0.id] = (var_211_0.data1KeyValueList[1][arg_202_0.id] or 0) + arg_202_0.count
					end
				end,
				[13] = function()
					local var_212_0 = getProxy(ActivityProxy):getActivityById(arg_202_0:getConfig("link_id"))

					if var_212_0:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

						return
					end

					var_212_0.data1 = var_212_0.data1 + arg_202_0.count

					getProxy(ActivityProxy):updateActivity(var_212_0)
				end,
				[14] = function()
					local var_213_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_202_0.id then
						var_213_0:AddSummonPt(arg_202_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_202_0.id then
						var_213_0:AddSummonPtOld(arg_202_0.count)
					end
				end,
				[15] = function()
					local var_214_0 = getProxy(ActivityProxy)
					local var_214_1 = var_214_0:getActivityById(arg_202_0:getConfig("link_id"))

					if not var_214_1 or var_214_1:isEnd() then
						return
					end

					if var_214_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE then
						local var_214_2 = pg.activity_event_grid[var_214_1.data1]

						if arg_202_0.id == var_214_2.ticket_item then
							var_214_1.data2 = var_214_1.data2 + arg_202_0.count
						elseif arg_202_0.id == var_214_2.explore_item then
							var_214_1.data3 = var_214_1.data3 + arg_202_0.count
						end
					elseif var_214_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_EXPEDITION then
						var_214_1.data3 = var_214_1.data3 + arg_202_0.count
					end

					var_214_0:updateActivity(var_214_1)
				end,
				[16] = function()
					local var_215_0 = getProxy(ActivityProxy)
					local var_215_1 = var_215_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_215_0, iter_215_1 in pairs(var_215_1) do
						if iter_215_1 and not iter_215_1:isEnd() and arg_202_0.id == iter_215_1:getConfig("config_id") then
							iter_215_1.data1 = iter_215_1.data1 + arg_202_0.count

							var_215_0:updateActivity(iter_215_1)
						end
					end
				end,
				[17] = function()
					local var_216_0 = getProxy(ActivityProxy)
					local var_216_1 = var_216_0:getActivityById(arg_202_0:getConfig("link_id"))

					if not var_216_1 or var_216_1:isEnd() then
						return
					end

					var_216_1.data1 = 2

					var_216_0:updateActivity(var_216_1)
				end,
				[20] = function()
					local var_217_0 = getProxy(BagProxy)
					local var_217_1 = pg.gameset.urpt_chapter_max.description
					local var_217_2 = var_217_1[1]
					local var_217_3 = var_217_1[2]
					local var_217_4 = var_217_0:GetLimitCntById(var_217_2)
					local var_217_5 = math.min(var_217_3 - var_217_4, arg_202_0.count)

					if var_217_5 > 0 then
						var_217_0:addItemById(var_217_2, var_217_5)
						var_217_0:AddLimitCnt(var_217_2, var_217_5)
					end
				end,
				[21] = function()
					local var_218_0 = getProxy(ActivityProxy)
					local var_218_1 = var_218_0:getActivityById(arg_202_0:getConfig("link_id"))

					if var_218_1 and not var_218_1:isEnd() then
						var_218_1.data2 = 1

						var_218_0:updateActivity(var_218_1)
					end
				end,
				[22] = function()
					local var_219_0 = getProxy(ActivityProxy)
					local var_219_1 = var_219_0:getActivityById(arg_202_0:getConfig("link_id"))

					if var_219_1 and not var_219_1:isEnd() then
						var_219_1.data1 = var_219_1.data1 + arg_202_0.count

						var_219_0:updateActivity(var_219_1)
					end
				end,
				[23] = function()
					local var_220_0 = (function()
						for iter_221_0, iter_221_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_202_0.id == iter_221_1[1] then
								return iter_221_1[2]
							end
						end
					end)()

					assert(var_220_0)

					local var_220_1 = getProxy(PlayerProxy)
					local var_220_2 = var_220_1:getData()

					var_220_2:addExpToLevel(var_220_0)
					var_220_1:updatePlayer(var_220_2)
				end,
				[24] = function()
					local var_222_0 = arg_202_0:getConfig("link_id")
					local var_222_1 = getProxy(ActivityProxy):getActivityById(var_222_0)

					if var_222_1 and not var_222_1:isEnd() and var_222_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_222_1.data2 = var_222_1.data2 + arg_202_0.count

						getProxy(ActivityProxy):updateActivity(var_222_1)
					end
				end,
				[25] = function()
					local var_223_0 = getProxy(ActivityProxy)
					local var_223_1 = var_223_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_223_1 and not var_223_1:isEnd() then
						var_223_1.data1 = var_223_1.data1 - 1

						if not table.contains(var_223_1.data1_list, arg_202_0.id) then
							table.insert(var_223_1.data1_list, arg_202_0.id)
						end

						var_223_0:updateActivity(var_223_1)

						local var_223_2 = arg_202_0:getConfig("link_id")

						if var_223_2 > 0 then
							local var_223_3 = var_223_0:getActivityById(var_223_2)

							if var_223_3 and not var_223_3:isEnd() then
								var_223_3.data1 = var_223_3.data1 + 1

								var_223_0:updateActivity(var_223_3)
							end
						end
					end
				end,
				[26] = function()
					local var_224_0 = getProxy(ActivityProxy)
					local var_224_1 = Clone(var_224_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_224_1 and not var_224_1:isEnd() then
						var_224_1.data1 = var_224_1.data1 + arg_202_0.count

						var_224_0:updateActivity(var_224_1)
					end
				end,
				[27] = function()
					local var_225_0 = getProxy(ActivityProxy)
					local var_225_1 = Clone(var_225_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_225_1 and not var_225_1:isEnd() then
						var_225_1:AddExp(arg_202_0.count)
						var_225_0:updateActivity(var_225_1)
					end
				end,
				[28] = function()
					local var_226_0 = getProxy(ActivityProxy)
					local var_226_1 = Clone(var_226_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_226_1 and not var_226_1:isEnd() then
						var_226_1:AddGold(arg_202_0.count)
						var_226_0:updateActivity(var_226_1)
					end
				end,
				[29] = function()
					local var_227_0 = getProxy(ActivityProxy)
					local var_227_1 = Clone(var_227_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5))

					if var_227_1 and not var_227_1:isEnd() then
						var_227_1.data1 = var_227_1.data1 + arg_202_0.count

						var_227_0:updateActivity(var_227_1)
					end
				end,
				[30] = function()
					local var_228_0 = arg_202_0:getConfig("link_id")
					local var_228_1 = getProxy(ActivityProxy):getActivityById(var_228_0)

					if not var_228_1 or var_228_1:isEnd() then
						return
					end

					local var_228_2 = arg_202_0.count

					if var_228_1:IsLimitExpItem(arg_202_0.id) then
						var_228_2 = var_228_1:FilterExp(var_228_2)
						var_228_2 = getProxy(LoveLetterProxy):AddLoveLetterExp(var_228_1:GetTargetGroupId(), var_228_2)

						var_228_1:AddDailyProgress(var_228_2)
					else
						local var_228_3 = getProxy(LoveLetterProxy):AddLoveLetterExp(var_228_1:GetTargetGroupId(), var_228_2)
					end

					getProxy(ActivityProxy):updateActivity(var_228_1)
				end,
				[31] = function()
					getProxy(AuctionGameBaseProxy):AddGold(arg_202_0.count)
				end,
				[32] = function()
					getProxy(ChapterAutoProxy):AddTicketByItem(ChapterAutoTicket.TYPE.WORLD, arg_202_0)
				end,
				[33] = function()
					getProxy(ChapterAutoProxy):AddTicketByItem(ChapterAutoTicket.TYPE.TIME, arg_202_0)
				end,
				[34] = function()
					getProxy(ChapterAutoProxy):AddTicketByItem(ChapterAutoTicket.TYPE.MAIN, arg_202_0)
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_235_0 = arg_202_0:getConfig("link_id")
					local var_235_1 = getProxy(ActivityProxy):getActivityById(var_235_0)

					if var_235_1 and not var_235_1:isEnd() then
						var_235_1.data1 = var_235_1.data1 + arg_202_0.count

						getProxy(ActivityProxy):updateActivity(var_235_1)
					end
				end,
				[102] = function()
					local var_236_0 = arg_202_0:getConfig("link_id")
					local var_236_1 = pg.activity_template[var_236_0].type

					switch(var_236_1, {
						[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = function()
							getProxy(CityRebuildProxy):AddPt(var_236_0, arg_202_0.count)
						end
					})
				end,
				[103] = function()
					local var_238_0 = arg_202_0:getConfig("link_id")
					local var_238_1 = getProxy(ActivityProxy):getActivityById(var_238_0)

					if not var_238_1 or var_238_1:isEnd() then
						return
					end

					local var_238_2 = var_238_1:getConfig("type")

					switch(var_238_2, {
						[ActivityConst.ACTIVITY_TYPE_TOWN2] = function()
							local var_239_0 = getProxy(ActivityProxy)
							local var_239_1 = Clone(var_239_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN2))

							if arg_202_0:getConfig("id") == pg.activity_town_2[var_239_1.id].bubble_drop[1][2] then
								var_239_1:AddGold(arg_202_0.count)
								var_239_1:AddAllGold(arg_202_0.count)
							else
								var_239_1:AddGold2(arg_202_0.count)
							end

							var_239_0:updateActivity(var_239_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MALL] = function()
							local var_240_0 = var_238_1:getConfig("config_data")[1]
							local var_240_1 = arg_202_0.id ~= var_240_0

							if var_240_1 then
								var_238_1:AddStaff(arg_202_0.id, arg_202_0.count)
							else
								var_238_1:AddGold(arg_202_0.count)
							end

							getProxy(ActivityProxy):updateActivity(var_238_1)

							if var_240_1 then
								pg.m02:sendNotification(GAME.ACTIVITY_MALL_OP, {
									activity_id = var_238_1.id,
									cmd = ActivityMallOPCommand.CMD.GET_STAFF_DATA,
									arg1 = arg_202_0.count
								})
							end
						end,
						[ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN] = function()
							var_238_1:AddVitemNumber(arg_202_0.id, arg_202_0.count)
							getProxy(ActivityProxy):updateActivity(var_238_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = function()
							assert(var_238_1:getDataConfig("pt") == arg_202_0.id, "error drop id for pt_buff")

							if var_238_1:getDataConfig("type") == 8 then
								var_238_1.data1 = var_238_1.data1 + arg_202_0.count

								getProxy(ActivityProxy):updateActivity(var_238_1)
							end
						end,
						[ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2] = function()
							assert(var_238_1:getDataConfig("pt") == arg_202_0.id, "error drop id for pt_buff_mark2")

							if var_238_1:getDataConfig("type") == 8 then
								var_238_1.data1 = var_238_1.data1 + arg_202_0.count
							end

							var_238_1.data4 = var_238_1.data4 + arg_202_0.count

							getProxy(ActivityProxy):UpdatePTRank({
								Drop.New({
									type = DROP_TYPE_VITEM,
									id = arg_202_0.id,
									count = arg_202_0.count
								})
							})
							getProxy(ActivityProxy):updateActivity(var_238_1)
						end
					}, function()
						assert(var_238_1 .. "对应" .. var_238_2 .. "错误")
					end)
				end,
				[104] = function()
					return
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_246_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_246_0.id, arg_246_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_247_0)
			local var_247_0 = getProxy(BayProxy)
			local var_247_1 = var_247_0:getShipById(arg_247_0.count)

			if var_247_1 then
				var_247_1:unlockActivityNpc(0)
				var_247_0:updateShip(var_247_1)
				getProxy(CollectionProxy):flushCollection(var_247_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_248_0)
			nowWorld():GetInventoryProxy():AddItem(arg_248_0.id, arg_248_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_249_0)
			local var_249_0 = getProxy(AttireProxy)
			local var_249_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_249_2 = IconFrame.New({
				id = arg_249_0.id
			})
			local var_249_3 = var_249_1 + var_249_2:getConfig("time_second")

			var_249_2:updateData({
				isNew = true,
				end_time = var_249_3
			})
			var_249_0:addAttireFrame(var_249_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_249_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_250_0)
			local var_250_0 = getProxy(AttireProxy)
			local var_250_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_250_2 = ChatFrame.New({
				id = arg_250_0.id
			})
			local var_250_3 = var_250_1 + var_250_2:getConfig("time_second")

			var_250_2:updateData({
				isNew = true,
				end_time = var_250_3
			})
			var_250_0:addAttireFrame(var_250_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_250_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_251_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_251_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_251_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_252_0)
			nowWorld():GetCollectionProxy():Unlock(arg_252_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_253_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_253_0.id):addPT(arg_253_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_254_0)
			local var_254_0 = arg_254_0.id
			local var_254_1 = arg_254_0.count
			local var_254_2 = getProxy(ShipSkinProxy)
			local var_254_3 = var_254_2:getSkinById(var_254_0)

			if var_254_3 and var_254_3:isExpireType() then
				local var_254_4 = var_254_1 + var_254_3.endTime
				local var_254_5 = ShipSkin.New({
					id = var_254_0,
					end_time = var_254_4
				})

				var_254_2:addSkin(var_254_5)
			elseif not var_254_3 then
				local var_254_6 = var_254_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_254_7 = ShipSkin.New({
					id = var_254_0,
					end_time = var_254_6
				})

				var_254_2:addSkin(var_254_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_255_0)
			local var_255_0 = arg_255_0.id
			local var_255_1 = pg.benefit_buff_template[var_255_0]

			assert(var_255_1 and var_255_1.act_id > 0, "should exist act id")

			local var_255_2 = getProxy(ActivityProxy):getActivityById(var_255_1.act_id)

			if var_255_2 and not var_255_2:isEnd() then
				local var_255_3 = var_255_1.max_time
				local var_255_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_255_3

				var_255_2:AddBuff(ActivityBuff.New(var_255_2.id, var_255_0, var_255_4))
				getProxy(ActivityProxy):updateActivity(var_255_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_256_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_257_0)
			getProxy(ApartmentProxy):ModifyRoom(arg_257_0:getConfig("room_id"), function(arg_258_0)
				arg_258_0:AddFurnitureByID(arg_257_0.id)
			end)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_259_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_259_0.id, arg_259_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_260_0)
			getProxy(ApartmentProxy):ModifyApartment(arg_260_0:getConfig("ship_group"), function(arg_261_0)
				arg_261_0:addSkin(arg_260_0.id)
			end)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_262_0)
			local var_262_0 = getProxy(LivingAreaCoverProxy)
			local var_262_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_262_0.id
			})

			var_262_0:UpdateCover(var_262_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_262_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_262_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_263_0)
			local var_263_0 = getProxy(AttireProxy)
			local var_263_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_263_2 = CombatUIStyle.New({
				id = arg_263_0.id
			})

			var_263_2:setUnlock()
			var_263_2:setNew()
			var_263_0:addAttireFrame(var_263_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_263_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_264_0)
			local var_264_0 = getProxy(IslandProxy):GetIsland()

			if not var_264_0 then
				return
			end

			var_264_0:GetInventoryAgency():AddItem(IslandItem.New({
				id = arg_264_0.id,
				num = arg_264_0.count
			}))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_265_0)
			local var_265_0 = getProxy(PlayerProxy):getRawData()
			local var_265_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_265_0:updateMedalList({
				{
					key = arg_265_0.id,
					value = var_265_1
				}
			})
		end
	}

	function var_0_0.AddItemDefault(arg_266_0)
		if arg_266_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_266_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_266_0.type].activity_id)

			if arg_266_0.type == DROP_TYPE_RYZA_DROP then
				if var_266_0 and not var_266_0:isEnd() then
					var_266_0:AddItem(AtelierMaterial.New({
						configId = arg_266_0.id,
						count = arg_266_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_266_0)
				end
			elseif var_266_0 and not var_266_0:isEnd() then
				var_266_0:addVitemNumber(arg_266_0.id, arg_266_0.count)
				getProxy(ActivityProxy):updateActivity(var_266_0)
			end
		elseif arg_266_0.type >= DROP_TYPE_ISLAND_ITEM and arg_266_0.type <= DROP_TYPE_ISLAND_CARD_DIY then
			if not getProxy(IslandProxy):GetIsland() then
				return
			end

			local var_266_1 = {}

			table.insert(var_266_1, {
				type = arg_266_0.type,
				id = arg_266_0.id,
				number = arg_266_0.count
			})
			IslandDropHelper.AddItems({
				drop_list = var_266_1
			})
		else
			print("can not handle this type>>" .. arg_266_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_267_0, arg_267_1, arg_267_2)
			setText(arg_267_2, arg_267_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_268_0, arg_268_1, arg_268_2)
			local var_268_0 = arg_268_0:getConfig("display")

			if arg_268_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_268_0 = string.gsub(var_268_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_268_0.extra))
			elseif arg_268_0:getConfig("combination_display") ~= nil then
				local var_268_1 = arg_268_0:getConfig("combination_display")

				if var_268_1 and #var_268_1 > 0 then
					var_268_0 = Item.StaticCombinationDisplay(var_268_1)
				end
			end

			setText(arg_268_2, SwitchSpecialChar(var_268_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_269_0, arg_269_1, arg_269_2)
			setText(arg_269_2, arg_269_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_270_0, arg_270_1, arg_270_2)
			local var_270_0 = arg_270_0:getConfig("skin_id")
			local var_270_1, var_270_2, var_270_3 = ShipWordHelper.GetWordAndCV(var_270_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_270_2, var_270_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_271_0, arg_271_1, arg_271_2)
			local var_271_0 = arg_271_0:getConfig("skin_id")
			local var_271_1, var_271_2, var_271_3 = ShipWordHelper.GetWordAndCV(var_271_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_271_2, var_271_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_272_0, arg_272_1, arg_272_2)
			setText(arg_272_2, arg_272_1.name or arg_272_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_273_0, arg_273_1, arg_273_2)
			local var_273_0 = arg_273_0:getConfig("desc")

			for iter_273_0, iter_273_1 in ipairs({
				arg_273_0.count
			}) do
				var_273_0 = string.gsub(var_273_0, "$" .. iter_273_0, iter_273_1)
			end

			setText(arg_273_2, var_273_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_274_0, arg_274_1, arg_274_2)
			setText(arg_274_2, arg_274_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_275_0, arg_275_1, arg_275_2)
			setText(arg_275_2, arg_275_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_276_0, arg_276_1, arg_276_2)
			local var_276_0 = arg_276_0:getConfig("desc")
			local var_276_1 = _.map(arg_276_0:getConfig("equip_type"), function(arg_277_0)
				return EquipType.Type2Name2(arg_277_0)
			end)

			setText(arg_276_2, var_276_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_276_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_278_0, arg_278_1, arg_278_2)
			setText(arg_278_2, arg_278_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_279_0, arg_279_1, arg_279_2)
			setText(arg_279_2, arg_279_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_280_0, arg_280_1, arg_280_2, arg_280_3)
			local var_280_0 = WorldCollectionProxy.GetCollectionType(arg_280_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_280_2, i18n("world_" .. var_280_0 .. "_desc", arg_280_0:getConfig("name")))
			setText(arg_280_3, i18n("world_" .. var_280_0 .. "_name", arg_280_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_281_0, arg_281_1, arg_281_2)
			setText(arg_281_2, arg_281_0.desc and arg_281_0.desc or arg_281_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_282_0, arg_282_1, arg_282_2)
			setText(arg_282_2, arg_282_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_283_0, arg_283_1, arg_283_2)
			setText(arg_283_2, arg_283_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_284_0, arg_284_1, arg_284_2)
			local var_284_0 = string.gsub(arg_284_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_284_0.count))

			setText(arg_284_2, SwitchSpecialChar(var_284_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_285_0, arg_285_1, arg_285_2)
			setText(arg_285_2, arg_285_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_286_0, arg_286_1, arg_286_2)
			setText(arg_286_2, arg_286_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_287_0, arg_287_1, arg_287_2)
			setText(arg_287_2, arg_287_0:getConfig("desc"))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_288_0, arg_288_1, arg_288_2)
			setText(arg_288_2, arg_288_0:getConfig("display"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_289_0, arg_289_1, arg_289_2)
			setText(arg_289_2, arg_289_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_290_0, arg_290_1, arg_290_2)
			setText(arg_290_2, arg_290_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_291_0, arg_291_1, arg_291_2)
			setText(arg_291_2, "")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_292_0, arg_292_1, arg_292_2)
			setText(arg_292_2, arg_292_0.desc)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_293_0, arg_293_1, arg_293_2)
			setText(arg_293_2, arg_293_0.desc)
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_294_0, arg_294_1, arg_294_2)
			setText(arg_294_2, arg_294_0.desc)
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_295_0, arg_295_1, arg_295_2)
			setText(arg_295_2, arg_295_0.desc)
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_296_0, arg_296_1, arg_296_2)
		if arg_296_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_296_2, arg_296_0:getConfig("display"))
		else
			setText(arg_296_2, arg_296_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_297_0, arg_297_1, arg_297_2)
			if arg_297_0.id == PlayerConst.ResStoreGold or arg_297_0.id == PlayerConst.ResStoreOil then
				arg_297_2 = arg_297_2 or {}
				arg_297_2.frame = "frame_store"
			end

			updateItem(arg_297_1, Item.New({
				id = id2ItemId(arg_297_0.id)
			}), arg_297_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_298_0, arg_298_1, arg_298_2)
			updateItem(arg_298_1, arg_298_0:getSubClass(), arg_298_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_299_0, arg_299_1, arg_299_2)
			updateEquipment(arg_299_1, arg_299_0:getSubClass(), arg_299_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_300_0, arg_300_1, arg_300_2)
			updateShip(arg_300_1, arg_300_0.ship, arg_300_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_301_0, arg_301_1, arg_301_2)
			updateShip(arg_301_1, arg_301_0.ship, arg_301_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_302_0, arg_302_1, arg_302_2)
			updateFurniture(arg_302_1, arg_302_0, arg_302_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_303_0, arg_303_1, arg_303_2)
			arg_303_2.isWorldBuff = arg_303_0.isWorldBuff

			updateStrategy(arg_303_1, arg_303_0, arg_303_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_304_0, arg_304_1, arg_304_2)
			arg_304_2.isSkin = true
			arg_304_2.isNew = arg_304_0.isNew

			updateShip(arg_304_1, Ship.New({
				configId = tonumber(arg_304_0:getConfig("ship_group") .. "1"),
				skin_id = arg_304_0.id
			}), arg_304_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_305_0, arg_305_1, arg_305_2)
			local var_305_0 = setmetatable({
				count = arg_305_0.count
			}, {
				__index = arg_305_0:getConfigTable()
			})

			updateEquipmentSkin(arg_305_1, var_305_0, arg_305_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_306_0, arg_306_1, arg_306_2)
			updateItem(arg_306_1, Item.New({
				id = arg_306_0.id
			}), arg_306_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_307_0, arg_307_1, arg_307_2)
			updateWorldItem(arg_307_1, WorldItem.New({
				id = arg_307_0.id
			}), arg_307_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_308_0, arg_308_1, arg_308_2)
			updateWorldCollection(arg_308_1, arg_308_0, arg_308_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_309_0, arg_309_1, arg_309_2)
			updateAttire(arg_309_1, AttireConst.TYPE_CHAT_FRAME, arg_309_0:getConfigTable(), arg_309_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_310_0, arg_310_1, arg_310_2)
			updateAttire(arg_310_1, AttireConst.TYPE_ICON_FRAME, arg_310_0:getConfigTable(), arg_310_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_311_0, arg_311_1, arg_311_2)
			updateEmoji(arg_311_1, arg_311_0:getConfigTable(), arg_311_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_312_0, arg_312_1, arg_312_2)
			arg_312_2.count = 1

			updateItem(arg_312_1, arg_312_0:getSubClass(), arg_312_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_313_0, arg_313_1, arg_313_2)
			updateSpWeapon(arg_313_1, SpWeapon.New({
				id = arg_313_0.id
			}), arg_313_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_314_0, arg_314_1, arg_314_2)
			updateItem(arg_314_1, Item.New({
				id = arg_314_0:getConfig("id")
			}), arg_314_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_315_0, arg_315_1, arg_315_2)
			arg_315_2.isSkin = true
			arg_315_2.isTimeLimit = true
			arg_315_2.count = 1

			updateShip(arg_315_1, Ship.New({
				configId = tonumber(arg_315_0:getConfig("ship_group") .. "1"),
				skin_id = arg_315_0.id
			}), arg_315_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_316_0, arg_316_1, arg_316_2)
			AtelierMaterial.UpdateRyzaItem(arg_316_1, arg_316_0.item, arg_316_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_317_0, arg_317_1, arg_317_2)
			WorkBenchItem.UpdateDrop(arg_317_1, arg_317_0.item, arg_317_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_318_0, arg_318_1, arg_318_2)
			WorkBenchItem.UpdateDrop(arg_318_1, WorkBenchItem.New({
				configId = arg_318_0.id,
				count = arg_318_0.count
			}), arg_318_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_319_0, arg_319_1, arg_319_2)
			updateBuff(arg_319_1, arg_319_0.id, arg_319_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_320_0, arg_320_1, arg_320_2)
			updateCommander(arg_320_1, arg_320_0, arg_320_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_321_0, arg_321_1, arg_321_2)
			updateCover(arg_321_1, arg_321_0, arg_321_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_322_0, arg_322_1, arg_322_2)
			updateAttireCombatUI(arg_322_1, AttireConst.TYPE_ICON_FRAME, arg_322_0:getConfigTable(), arg_322_2)
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_323_0, arg_323_1, arg_323_2)
			updateActivityMedal(arg_323_1, arg_323_0:getConfigTable(), arg_323_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_324_0, arg_324_1, arg_324_2)
		updateDefaultIconTpl(arg_324_1, arg_324_0, arg_324_2)
	end

	var_0_0.UpdateCustomDropCase = {
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_325_0, arg_325_1, arg_325_2)
			updateDorm3dIcon(arg_325_1, arg_325_0, arg_325_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_326_0, arg_326_1, arg_326_2)
			updateDorm3dIcon(arg_326_1, arg_326_0, arg_326_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_327_0, arg_327_1, arg_327_2)
			updateDorm3dIcon(arg_327_1, arg_327_0, arg_327_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_328_0, arg_328_1, arg_328_2)
			updateIslandItem(arg_328_1, arg_328_0, arg_328_2)
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_329_0, arg_329_1, arg_329_2)
			updateIslandUnlock(arg_329_1, arg_329_0, arg_329_2)
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_330_0, arg_330_1, arg_330_2)
			updateIslandInvitation(arg_330_1, arg_330_0, arg_330_2)
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_331_0, arg_331_1, arg_331_2)
			updateIslandSeasonPt(arg_331_1, arg_331_0, arg_331_2)
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_332_0, arg_332_1, arg_332_2)
			updateIslandWatherCollect(arg_332_1, arg_332_0, arg_332_2)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_333_0, arg_333_1, arg_333_2)
			updateIslandFurniture(arg_333_1, arg_333_0, arg_333_2)
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_334_0, arg_334_1, arg_334_2)
			updateIslandCardDiy(arg_334_1, arg_334_0, arg_334_2)
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_335_0, arg_335_1, arg_335_2)
			updateIslandSpeedupTicket(arg_335_1, arg_335_0, arg_335_2)
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_336_0, arg_336_1, arg_336_2)
			updateItem(arg_336_1, Item.New({
				id = arg_336_0.id
			}), arg_336_2)
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_337_0, arg_337_1, arg_337_2)
			updateIslandSkin(arg_337_1, arg_337_0, arg_337_2)
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_338_0, arg_338_1, arg_338_2)
			updateIslandDress(arg_338_1, arg_338_0, arg_338_2)
		end
	}

	function var_0_0.UpdateCustomDropDefault(arg_339_0, arg_339_1, arg_339_2)
		if arg_339_2.style == "dorm" then
			updateDorm3dIcon(arg_339_1, arg_339_0, arg_339_2)
		elseif arg_339_2.style == "island" then
			updateIslandDefaultIconTpl(arg_339_1, arg_339_0, arg_339_2)
		else
			warning(string.format("without dropType %d in updateCustomDrop", arg_339_0.type))
		end
	end
end

return var_0_0
