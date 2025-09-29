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
			return "island/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function()
			return "island/IslandDressIcon/" .. arg_7_0:getConfig("icon")
		end,
		[DROP_TYPE_ISLAND_ACTION] = function()
			return "island/IslandActionIcon/" .. arg_7_0:getConfig("resource")
		end,
		[DROP_TYPE_ISLAND_SKIN] = function()
			return "island/IslandDressIcon/" .. arg_7_0:getConfig("icon")
		end
	}, function()
		return arg_7_0:getConfig("icon")
	end)
end

function var_0_0.getIslandRarity(arg_21_0)
	return switch(arg_21_0.type, {
		[DROP_TYPE_ISLAND_ITEM] = function()
			return arg_21_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			return arg_21_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function()
			return arg_21_0:getConfig("rarity")
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

function var_0_0.getCount(arg_30_0)
	if arg_30_0.type == DROP_TYPE_OPERATION or arg_30_0.type == DROP_TYPE_LOVE_LETTER then
		return 1
	else
		return arg_30_0.count
	end
end

function var_0_0.isLoveLetter(arg_31_0)
	return arg_31_0.type == DROP_TYPE_LOVE_LETTER or arg_31_0.type == DROP_TYPE_ITEM and arg_31_0:getConfig("type") == Item.LOVE_LETTER_TYPE
end

function var_0_0.getOwnedCount(arg_32_0)
	return switch(arg_32_0.type, var_0_0.CountCase, var_0_0.CountDefault, arg_32_0)
end

function var_0_0.getSubClass(arg_33_0)
	return switch(arg_33_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_33_0)
end

function var_0_0.getDropRarity(arg_34_0)
	return switch(arg_34_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_34_0)
end

function var_0_0.getDropRarityDorm(arg_35_0)
	return switch(arg_35_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_35_0)
end

function var_0_0.DropTrans(arg_36_0, ...)
	return switch(arg_36_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_36_0, ...)
end

function var_0_0.AddItemOperation(arg_37_0)
	return switch(arg_37_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_37_0)
end

function var_0_0.MsgboxIntroSet(arg_38_0, ...)
	return switch(arg_38_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_38_0, ...)
end

function var_0_0.UpdateDropTpl(arg_39_0, ...)
	return switch(arg_39_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_39_0, ...)
end

function var_0_0.UpdateCustomDropTpl(arg_40_0, ...)
	return switch(arg_40_0.type, var_0_0.UpdateCustomDropCase, var_0_0.UpdateCustomDropDefault, arg_40_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_42_0)
			local var_42_0 = Item.getConfigData(id2ItemId(arg_42_0.id))

			arg_42_0.desc = var_42_0.display

			return var_42_0
		end,
		[DROP_TYPE_ITEM] = function(arg_43_0)
			local var_43_0 = Item.getConfigData(arg_43_0.id)

			arg_43_0.desc = var_43_0.display

			if var_43_0.type == Item.LOVE_LETTER_TYPE then
				arg_43_0.desc = string.gsub(arg_43_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_43_0.extra))
			end

			return var_43_0
		end,
		[DROP_TYPE_VITEM] = function(arg_44_0)
			local var_44_0 = Item.getConfigData(arg_44_0.id)

			assert(var_44_0, arg_44_0.id)

			arg_44_0.desc = var_44_0.display

			return var_44_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_45_0)
			local var_45_0 = Item.getConfigData(arg_45_0.id)

			arg_45_0.desc = string.gsub(var_45_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_45_0.count))

			return var_45_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_46_0)
			local var_46_0 = Equipment.getConfigData(arg_46_0.id)

			arg_46_0.desc = var_46_0.descrip

			return var_46_0
		end,
		[DROP_TYPE_SHIP] = function(arg_47_0)
			local var_47_0 = pg.ship_data_statistics[arg_47_0.id]
			local var_47_1, var_47_2, var_47_3 = ShipWordHelper.GetWordAndCV(var_47_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_47_0.desc = var_47_3 or i18n("ship_drop_desc_default")
			arg_47_0.ship = Ship.New({
				configId = arg_47_0.id,
				skin_id = arg_47_0.skinId,
				propose = arg_47_0.propose
			})
			arg_47_0.ship.remoulded = arg_47_0.remoulded
			arg_47_0.ship.virgin = arg_47_0.virgin

			return var_47_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_48_0)
			local var_48_0 = pg.furniture_data_template[arg_48_0.id]

			arg_48_0.desc = var_48_0.describe

			return var_48_0
		end,
		[DROP_TYPE_SKIN] = function(arg_49_0)
			local var_49_0 = pg.ship_skin_template[arg_49_0.id]

			if var_49_0.skin_type == ShipSkin.SKIN_TYPE_TB then
				local var_49_1, var_49_2, var_49_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_49_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_49_0.desc = var_49_3
			else
				local var_49_4, var_49_5, var_49_6 = ShipWordHelper.GetWordAndCV(arg_49_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_49_0.desc = var_49_6
			end

			return var_49_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_50_0)
			local var_50_0 = pg.ship_skin_template[arg_50_0.id]

			if var_50_0.skin_type == ShipSKin.SKIN_TYPE_TB then
				local var_50_1, var_50_2, var_50_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_50_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_50_0.desc = var_50_3
			else
				local var_50_4, var_50_5, var_50_6 = ShipWordHelper.GetWordAndCV(arg_50_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_50_0.desc = var_50_6
			end

			return var_50_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_51_0)
			local var_51_0 = pg.equip_skin_template[arg_51_0.id]

			arg_51_0.desc = var_51_0.desc

			return var_51_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_52_0)
			local var_52_0 = pg.world_item_data_template[arg_52_0.id]

			arg_52_0.desc = var_52_0.display

			return var_52_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_53_0)
			local var_53_0 = pg.item_data_frame[arg_53_0.id]

			arg_53_0.desc = var_53_0.desc

			return var_53_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_54_0)
			return pg.item_data_chat[arg_54_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_55_0)
			local var_55_0 = pg.spweapon_data_statistics[arg_55_0.id]

			arg_55_0.desc = var_55_0.descrip

			return var_55_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_56_0)
			local var_56_0 = pg.activity_ryza_item[arg_56_0.id]

			arg_56_0.item = AtelierMaterial.New({
				configId = arg_56_0.id
			})
			arg_56_0.desc = arg_56_0.item:GetDesc()

			return var_56_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_57_0)
			arg_57_0.ship = getProxy(BayProxy):getShipById(arg_57_0.count)

			local var_57_0 = pg.ship_data_statistics[arg_57_0.ship.configId]
			local var_57_1, var_57_2, var_57_3 = ShipWordHelper.GetWordAndCV(var_57_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_57_0.desc = var_57_3 or i18n("ship_drop_desc_default")

			return var_57_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_58_0)
			return arg_58_0.isWorldBuff and pg.world_SLGbuff_data[arg_58_0.id] or pg.strategy_data_template[arg_58_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_59_0)
			local var_59_0 = pg.emoji_template[arg_59_0.id]

			arg_59_0.name = var_59_0.item_name
			arg_59_0.desc = var_59_0.item_desc

			return var_59_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_60_0)
			local var_60_0 = WorldCollectionProxy.GetCollectionTemplate(arg_60_0.id)

			arg_60_0.desc = var_60_0.name

			return var_60_0
		end,
		[DROP_TYPE_META_PT] = function(arg_61_0)
			local var_61_0 = pg.ship_strengthen_meta[arg_61_0.id]
			local var_61_1 = Item.getConfigData(var_61_0.itemid)

			arg_61_0.desc = var_61_1.display

			return var_61_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_62_0)
			local var_62_0 = pg.activity_workbench_item[arg_62_0.id]

			arg_62_0.item = WorkBenchItem.New({
				configId = arg_62_0.id
			})
			arg_62_0.desc = arg_62_0.item:GetDesc()

			return var_62_0
		end,
		[DROP_TYPE_BUFF] = function(arg_63_0)
			local var_63_0 = pg.benefit_buff_template[arg_63_0.id]

			arg_63_0.desc = var_63_0.desc

			return var_63_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_64_0)
			local var_64_0 = pg.commander_data_template[arg_64_0.id]

			arg_64_0.desc = var_64_0.desc

			return var_64_0
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_65_0)
			local var_65_0 = pg.island_item_data_template[arg_65_0.id]

			arg_65_0.desc = ""

			return var_65_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_66_0)
			local var_66_0 = pg.island_ability_template[arg_66_0.id]

			arg_66_0.desc = ""

			return var_66_0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_67_0)
			local var_67_0 = pg.island_chara_template[arg_67_0.id]

			arg_67_0.desc = ""

			return var_67_0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_68_0)
			local var_68_0 = pg.island_furniture_template[arg_68_0.id]

			arg_68_0.desc = ""

			return var_68_0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_69_0)
			local var_69_0 = pg.island_dress_template[arg_69_0.id]

			arg_69_0.desc = ""

			return var_69_0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_70_0)
			local var_70_0 = pg.island_skin_template[arg_70_0.id]

			arg_70_0.desc = ""

			return var_70_0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_71_0)
			local var_71_0 = pg.island_action[arg_71_0.id]

			arg_71_0.desc = ""

			return var_71_0
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_72_0)
			local var_72_0 = pg.island_speedup_ticket[arg_72_0.id]

			arg_72_0.desc = ""

			return var_72_0
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_73_0)
			return pg.island_card_diy[arg_73_0.id]
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_74_0)
			return pg.drop_data_restore[arg_74_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_75_0)
			local var_75_0 = pg.dorm3d_furniture_template[arg_75_0.id]

			arg_75_0.desc = var_75_0.desc

			return var_75_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_76_0)
			local var_76_0 = pg.dorm3d_gift[arg_76_0.id]

			arg_76_0.desc = var_76_0.display

			return var_76_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_77_0)
			local var_77_0 = pg.dorm3d_resource[arg_77_0.id]

			arg_77_0.desc = ""

			return var_77_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_78_0)
			local var_78_0 = pg.livingarea_cover[arg_78_0.id]

			arg_78_0.desc = var_78_0.desc

			return var_78_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_79_0)
			return pg.item_data_battleui[arg_79_0.id]
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_80_0)
			local var_80_0 = pg.activity_medal_template[arg_80_0.id].item

			return pg.item_virtual_data_statistics[var_80_0]
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_81_0)
			local var_81_0 = Item.getConfigData(arg_81_0.id)

			assert(var_81_0, arg_81_0.id)

			arg_81_0.desc = var_81_0.display

			return var_81_0
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_82_0)
			return pg.island_collection[arg_82_0.id]
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_83_0)
			return getIslandSeasonPtInfo()
		end
	}

	function var_0_0.ConfigDefault(arg_84_0)
		local var_84_0 = arg_84_0.type

		if tonumber(var_84_0) and var_84_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_84_1 = pg.activity_drop_type[var_84_0].relevance

			return var_84_1 and pg[var_84_1][arg_84_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_85_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_85_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_86_0)
			local var_86_0 = getProxy(BagProxy):getItemCountById(arg_86_0.id)

			if arg_86_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_86_0, 1), true
			else
				return var_86_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_87_0)
			local var_87_0 = arg_87_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_87_0], "equip groupId not exist")

			local var_87_1 = pg.equip_data_template.get_id_list_by_group[var_87_0]

			return underscore.reduce(var_87_1, 0, function(arg_88_0, arg_88_1)
				local var_88_0 = getProxy(EquipmentProxy):getEquipmentById(arg_88_1)

				return arg_88_0 + (var_88_0 and var_88_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_88_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_89_0)
			return getProxy(BayProxy):getConfigShipCount(arg_89_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_90_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_90_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_91_0)
			return arg_91_0.count, tobool(arg_91_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_92_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_92_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_93_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_93_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_94_0)
			local var_94_0 = arg_94_0:getConfig("virtual_type")

			return switch(var_94_0, {
				[22] = function()
					local var_95_0 = getProxy(ActivityProxy):getActivityById(arg_94_0:getConfig("link_id"))

					return var_95_0 and var_95_0.data1 or 0, true
				end,
				[101] = function()
					local var_96_0 = getProxy(ActivityProxy):getActivityById(arg_94_0:getConfig("link_id"))

					return var_96_0 and var_96_0.data1 or 0
				end
			}, function()
				return nil
			end)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_98_0)
			local var_98_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_98_0.id)

			return (var_98_0 and var_98_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_98_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_99_0)
			local var_99_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_99_0.type].activity_id)

			if not var_99_0 then
				return 0
			end

			local var_99_1 = var_99_0:GetItemById(arg_99_0.id)

			return var_99_1 and var_99_1.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_100_0)
			local var_100_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_100_0.id)

			return var_100_0 and (not var_100_0:expiredType() or not not var_100_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_101_0)
			local var_101_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_101_0.id)

			return var_101_0 and (not var_101_0:expiredType() or not not var_101_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_102_0)
			local var_102_0 = nowWorld()

			if var_102_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_102_0:GetInventoryProxy():GetItemCount(arg_102_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_103_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_103_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_104_0)
			local var_104_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_104_0.id)

			return var_104_0 and var_104_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_105_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_105_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_106_0)
			local var_106_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_106_0.id)

			return 1
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_107_0)
			local var_107_0 = 0
			local var_107_1 = getProxy(IslandProxy):GetIsland()

			if var_107_1 then
				var_107_0 = var_107_1:GetInventoryAgency():GetOwnCount(arg_107_0.id)
			end

			return var_107_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_108_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_109_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_110_0)
			local var_110_0 = getProxy(IslandProxy):GetIsland()

			if var_110_0 then
				local var_110_1 = var_110_0:GetAgoraAgency():GetFurnitures()

				for iter_110_0, iter_110_1 in ipairs(var_110_1) do
					if iter_110_1.id == arg_110_0.id then
						return iter_110_1.count
					end
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_111_0)
			local var_111_0 = getProxy(IslandProxy):GetIsland()

			if var_111_0 then
				local var_111_1 = arg_111_0:getConfig("belongto")

				if var_111_1 == 1 then
					return var_111_0:GetDressUpAgency():CheckOwnDress(arg_111_0.id) and 1 or 0
				elseif var_111_1 == 2 then
					return var_111_0:GetCharacterAgency():GetDressIdRealCount(arg_111_0.id)
				end
			end

			return 0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_112_0)
			local var_112_0 = getProxy(IslandProxy):GetIsland()

			if var_112_0 then
				return var_112_0:GetCharacterAgency():CheckSkinIsOwned(arg_112_0.id) and 1 or 0
			end

			return 0
		end
	}

	function var_0_0.CountDefault(arg_113_0)
		local var_113_0 = arg_113_0.type

		if var_113_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_113_0].activity_id):getVitemNumber(arg_113_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_114_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_115_0)
			return Item.New(arg_115_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_116_0)
			return Item.New(arg_116_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_117_0)
			return Equipment.New(arg_117_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_118_0)
			return Item.New({
				count = 1,
				id = arg_118_0.id,
				extra = arg_118_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_119_0)
			return WorldItem.New(arg_119_0)
		end
	}

	function var_0_0.SubClassDefault(arg_120_0)
		assert(false, string.format("drop type %d without subClass", arg_120_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_121_0)
			return arg_121_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_122_0)
			return arg_122_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_123_0)
			return arg_123_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_124_0)
			return arg_124_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_125_0)
			return arg_125_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_126_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_127_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_128_0)
			return arg_128_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_129_0)
			return arg_129_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_130_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_131_0)
			return arg_131_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_132_0)
			return arg_132_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_133_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_134_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_135_0)
			return arg_135_0:getConfig("rare")
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_136_0)
			return arg_136_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_137_0)
			return arg_137_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_138_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_139_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_140_0)
			return arg_140_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_141_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_142_0)
			return ItemRarity.Gold
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_143_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_144_0)
		return arg_144_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_145_0)
		return arg_145_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_146_0)
			local var_146_0 = Drop.New({
				type = arg_146_0:getConfig("type"),
				id = arg_146_0:getConfig("resource_type"),
				count = arg_146_0:getConfig("resource_num") * arg_146_0.count
			})
			local var_146_1 = Drop.New({
				type = arg_146_0:getConfig("target_type"),
				id = arg_146_0:getConfig("target_id"),
				count = arg_146_0.count
			})

			PlayerConst.UpdateLinkActivity({
				var_146_1
			})

			var_146_0.name = string.format("%s(%s)", var_146_0:getName(), var_146_1:getName())

			return var_146_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_147_0)
			for iter_147_0, iter_147_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_147_1.id].pt == arg_147_0.id then
					return nil, arg_147_0
				end
			end

			return arg_147_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_148_0)
			if arg_148_0.id ~= 3 then
				return nil
			end

			return arg_148_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_149_0)
			return nil, arg_149_0
		end,
		[DROP_TYPE_VITEM] = function(arg_150_0, arg_150_1, arg_150_2)
			assert(arg_150_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_150_0.id)

			return switch(arg_150_0:getConfig("virtual_type"), {
				function()
					if arg_150_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_150_0
					end

					return arg_150_0
				end,
				[6] = function()
					local var_152_0 = arg_150_2.taskId
					local var_152_1 = getProxy(ActivityProxy)
					local var_152_2 = var_152_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_152_2 then
						local var_152_3 = var_152_2.data1KeyValueList[1]

						var_152_3[var_152_0] = defaultValue(var_152_3[var_152_0], 0) + arg_150_0.count

						var_152_1:updateActivity(var_152_2)
					end

					return nil, arg_150_0
				end,
				[13] = function()
					local var_153_0 = arg_150_0:getName()
					local var_153_1 = getProxy(ActivityProxy):getActivityById(arg_150_0:getConfig("link_id"))

					if not var_153_1 or var_153_1:isEnd() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_153_0))

						return nil
					elseif var_153_1:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_153_0))

						return nil
					else
						return arg_150_0, nil
					end
				end,
				[21] = function()
					return nil, arg_150_0
				end,
				[28] = function()
					local var_155_0 = Drop.New({
						type = arg_150_0.type,
						id = arg_150_0.id,
						count = math.floor(arg_150_0.count / 1000)
					})
					local var_155_1 = Drop.New({
						type = arg_150_0.type,
						id = arg_150_0.id,
						count = arg_150_0.count - math.floor(arg_150_0.count / 1000)
					})

					return var_155_0, var_155_1
				end
			}, function()
				return arg_150_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_157_0, arg_157_1)
			if Ship.isMetaShipByConfigID(arg_157_0.id) and Player.isMetaShipNeedToTrans(arg_157_0.id) then
				local var_157_0 = table.indexof(arg_157_1, arg_157_0.id, 1)

				if var_157_0 then
					table.remove(arg_157_1, var_157_0)
				else
					local var_157_1 = Player.metaShip2Res(arg_157_0.id)
					local var_157_2 = Drop.New(var_157_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_157_0.id, var_157_2)

					return arg_157_0, var_157_2
				end
			end

			return arg_157_0
		end,
		[DROP_TYPE_SKIN] = function(arg_158_0)
			arg_158_0.isNew = not getProxy(ShipSkinProxy):hasOldNonLimitSkin(arg_158_0.id)

			return arg_158_0
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_159_0)
			local var_159_0 = getProxy(PlayerProxy):getRawData()
			local var_159_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_159_0:updateMedalList({
				{
					key = arg_159_0.id,
					value = var_159_1
				}
			})

			return arg_159_0
		end,
		[DROP_TYPE_BUFF] = function(arg_160_0)
			return nil, arg_160_0
		end
	}

	function var_0_0.TransDefault(arg_161_0)
		return arg_161_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_162_0)
			local var_162_0 = id2res(arg_162_0.id)

			assert(var_162_0, "res should be defined: " .. arg_162_0.id)

			local var_162_1 = getProxy(PlayerProxy)
			local var_162_2 = var_162_1:getData()

			var_162_2:addResources({
				[var_162_0] = arg_162_0.count
			})
			var_162_1:updatePlayer(var_162_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_163_0)
			if arg_163_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_163_0 = getProxy(BagProxy):getItemCountById(arg_163_0.id)
				local var_163_1 = math.min(arg_163_0:getConfig("max_num") - var_163_0, arg_163_0.count)

				if var_163_1 > 0 then
					getProxy(BagProxy):addItemById(arg_163_0.id, var_163_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_163_0.id, arg_163_0.count, arg_163_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_164_0)
			local var_164_0 = arg_164_0:getSubClass()

			getProxy(BagProxy):addItemById(var_164_0.id, var_164_0.count, var_164_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_165_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_165_0.id, arg_165_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_166_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_167_0)
			local var_167_0 = getProxy(DormProxy)
			local var_167_1 = Furniture.New({
				id = arg_167_0.id,
				count = arg_167_0.count
			})

			if var_167_1:isRecordTime() then
				var_167_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_167_0:AddFurniture(var_167_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_168_0)
			local var_168_0 = getProxy(ShipSkinProxy)
			local var_168_1 = ShipSkin.New({
				id = arg_168_0.id
			})

			var_168_0:addSkin(var_168_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_169_0)
			arg_169_0 = arg_169_0:getSubClass()

			assert(arg_169_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_169_0.id)
			switch(arg_169_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_169_0.id, arg_169_0.count)
				end,
				function()
					local var_171_0 = getProxy(ActivityProxy)
					local var_171_1 = arg_169_0:getConfig("link_id")
					local var_171_2

					if var_171_1 > 0 then
						var_171_2 = var_171_0:getActivityById(var_171_1)
					else
						var_171_2 = var_171_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_171_2 and not var_171_2:isEnd() then
						if not table.contains(var_171_2.data1_list, arg_169_0.id) then
							table.insert(var_171_2.data1_list, arg_169_0.id)
						end

						var_171_0:updateActivity(var_171_2)
					end
				end,
				function()
					local var_172_0 = getProxy(ActivityProxy)
					local var_172_1 = var_172_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_172_0, iter_172_1 in ipairs(var_172_1) do
						iter_172_1.data1 = iter_172_1.data1 + arg_169_0.count

						local var_172_2 = iter_172_1:getConfig("config_id")
						local var_172_3 = pg.activity_vote[var_172_2]

						if var_172_3 and var_172_3.ticket_id_period == arg_169_0.id then
							iter_172_1.data3 = iter_172_1.data3 + arg_169_0.count
						end

						var_172_0:updateActivity(iter_172_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_169_0.id,
							ptCount = arg_169_0.count
						})
					end
				end,
				[4] = function()
					local var_173_0 = getProxy(ColoringProxy):getColorItems()

					var_173_0[arg_169_0.id] = (var_173_0[arg_169_0.id] or 0) + arg_169_0.count
				end,
				[6] = function()
					local var_174_0 = getProxy(ActivityProxy)
					local var_174_1 = var_174_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_174_1 then
						var_174_1.data3 = var_174_1.data3 + arg_169_0.count

						var_174_0:updateActivity(var_174_1)
					end
				end,
				[7] = function()
					local var_175_0 = getProxy(ChapterProxy)

					var_175_0:updateRemasterTicketsNum(math.min(var_175_0.remasterTickets + arg_169_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_176_0 = getProxy(ActivityProxy)
					local var_176_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_176_1 then
						var_176_1.data1_list[1] = var_176_1.data1_list[1] + arg_169_0.count

						var_176_0:updateActivity(var_176_1)
					end
				end,
				[11] = function()
					local var_177_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_177_0 and not var_177_0:isEnd() then
						var_177_0.data1 = var_177_0.data1 + arg_169_0.count
					end
				end,
				[12] = function()
					local var_178_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_178_0 and not var_178_0:isEnd() then
						var_178_0.data1KeyValueList[1][arg_169_0.id] = (var_178_0.data1KeyValueList[1][arg_169_0.id] or 0) + arg_169_0.count
					end
				end,
				[13] = function()
					local var_179_0 = getProxy(ActivityProxy):getActivityById(arg_169_0:getConfig("link_id"))

					if var_179_0:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

						return
					end

					var_179_0.data1 = var_179_0.data1 + arg_169_0.count

					getProxy(ActivityProxy):updateActivity(var_179_0)
				end,
				[14] = function()
					local var_180_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_169_0.id then
						var_180_0:AddSummonPt(arg_169_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_169_0.id then
						var_180_0:AddSummonPtOld(arg_169_0.count)
					end
				end,
				[15] = function()
					local var_181_0 = getProxy(ActivityProxy)
					local var_181_1 = var_181_0:getActivityById(arg_169_0:getConfig("link_id"))

					if not var_181_1 or var_181_1:isEnd() then
						return
					end

					if var_181_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE then
						local var_181_2 = pg.activity_event_grid[var_181_1.data1]

						if arg_169_0.id == var_181_2.ticket_item then
							var_181_1.data2 = var_181_1.data2 + arg_169_0.count
						elseif arg_169_0.id == var_181_2.explore_item then
							var_181_1.data3 = var_181_1.data3 + arg_169_0.count
						end
					elseif var_181_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_EXPEDITION then
						var_181_1.data3 = var_181_1.data3 + arg_169_0.count
					end

					var_181_0:updateActivity(var_181_1)
				end,
				[16] = function()
					local var_182_0 = getProxy(ActivityProxy)
					local var_182_1 = var_182_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_182_0, iter_182_1 in pairs(var_182_1) do
						if iter_182_1 and not iter_182_1:isEnd() and arg_169_0.id == iter_182_1:getConfig("config_id") then
							iter_182_1.data1 = iter_182_1.data1 + arg_169_0.count

							var_182_0:updateActivity(iter_182_1)
						end
					end
				end,
				[20] = function()
					local var_183_0 = getProxy(BagProxy)
					local var_183_1 = pg.gameset.urpt_chapter_max.description
					local var_183_2 = var_183_1[1]
					local var_183_3 = var_183_1[2]
					local var_183_4 = var_183_0:GetLimitCntById(var_183_2)
					local var_183_5 = math.min(var_183_3 - var_183_4, arg_169_0.count)

					if var_183_5 > 0 then
						var_183_0:addItemById(var_183_2, var_183_5)
						var_183_0:AddLimitCnt(var_183_2, var_183_5)
					end
				end,
				[21] = function()
					local var_184_0 = getProxy(ActivityProxy)
					local var_184_1 = var_184_0:getActivityById(arg_169_0:getConfig("link_id"))

					if var_184_1 and not var_184_1:isEnd() then
						var_184_1.data2 = 1

						var_184_0:updateActivity(var_184_1)
					end
				end,
				[22] = function()
					local var_185_0 = getProxy(ActivityProxy)
					local var_185_1 = var_185_0:getActivityById(arg_169_0:getConfig("link_id"))

					if var_185_1 and not var_185_1:isEnd() then
						var_185_1.data1 = var_185_1.data1 + arg_169_0.count

						var_185_0:updateActivity(var_185_1)
					end
				end,
				[23] = function()
					local var_186_0 = (function()
						for iter_187_0, iter_187_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_169_0.id == iter_187_1[1] then
								return iter_187_1[2]
							end
						end
					end)()

					assert(var_186_0)

					local var_186_1 = getProxy(PlayerProxy)
					local var_186_2 = var_186_1:getData()

					var_186_2:addExpToLevel(var_186_0)
					var_186_1:updatePlayer(var_186_2)
				end,
				[24] = function()
					local var_188_0 = arg_169_0:getConfig("link_id")
					local var_188_1 = getProxy(ActivityProxy):getActivityById(var_188_0)

					if var_188_1 and not var_188_1:isEnd() and var_188_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_188_1.data2 = var_188_1.data2 + arg_169_0.count

						getProxy(ActivityProxy):updateActivity(var_188_1)
					end
				end,
				[25] = function()
					local var_189_0 = getProxy(ActivityProxy)
					local var_189_1 = var_189_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_189_1 and not var_189_1:isEnd() then
						var_189_1.data1 = var_189_1.data1 - 1

						if not table.contains(var_189_1.data1_list, arg_169_0.id) then
							table.insert(var_189_1.data1_list, arg_169_0.id)
						end

						var_189_0:updateActivity(var_189_1)

						local var_189_2 = arg_169_0:getConfig("link_id")

						if var_189_2 > 0 then
							local var_189_3 = var_189_0:getActivityById(var_189_2)

							if var_189_3 and not var_189_3:isEnd() then
								var_189_3.data1 = var_189_3.data1 + 1

								var_189_0:updateActivity(var_189_3)
							end
						end
					end
				end,
				[26] = function()
					local var_190_0 = getProxy(ActivityProxy)
					local var_190_1 = Clone(var_190_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_190_1 and not var_190_1:isEnd() then
						var_190_1.data1 = var_190_1.data1 + arg_169_0.count

						var_190_0:updateActivity(var_190_1)
					end
				end,
				[27] = function()
					local var_191_0 = getProxy(ActivityProxy)
					local var_191_1 = Clone(var_191_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_191_1 and not var_191_1:isEnd() then
						var_191_1:AddExp(arg_169_0.count)
						var_191_0:updateActivity(var_191_1)
					end
				end,
				[28] = function()
					local var_192_0 = getProxy(ActivityProxy)
					local var_192_1 = Clone(var_192_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_192_1 and not var_192_1:isEnd() then
						var_192_1:AddGold(arg_169_0.count)
						var_192_0:updateActivity(var_192_1)
					end
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_195_0 = arg_169_0:getConfig("link_id")
					local var_195_1 = getProxy(ActivityProxy):getActivityById(var_195_0)

					if var_195_1 and not var_195_1:isEnd() then
						var_195_1.data1 = var_195_1.data1 + arg_169_0.count

						getProxy(ActivityProxy):updateActivity(var_195_1)
					end
				end,
				[102] = function()
					local var_196_0 = arg_169_0:getConfig("link_id")
					local var_196_1 = pg.activity_template[var_196_0].type

					switch(var_196_1, {
						[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = function()
							getProxy(CityRebuildProxy):AddPt(var_196_0, arg_169_0.count)
						end
					})
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_198_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_198_0.id, arg_198_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_199_0)
			local var_199_0 = getProxy(BayProxy)
			local var_199_1 = var_199_0:getShipById(arg_199_0.count)

			if var_199_1 then
				var_199_1:unlockActivityNpc(0)
				var_199_0:updateShip(var_199_1)
				getProxy(CollectionProxy):flushCollection(var_199_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_200_0)
			nowWorld():GetInventoryProxy():AddItem(arg_200_0.id, arg_200_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_201_0)
			local var_201_0 = getProxy(AttireProxy)
			local var_201_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_201_2 = IconFrame.New({
				id = arg_201_0.id
			})
			local var_201_3 = var_201_1 + var_201_2:getConfig("time_second")

			var_201_2:updateData({
				isNew = true,
				end_time = var_201_3
			})
			var_201_0:addAttireFrame(var_201_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_201_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_202_0)
			local var_202_0 = getProxy(AttireProxy)
			local var_202_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_202_2 = ChatFrame.New({
				id = arg_202_0.id
			})
			local var_202_3 = var_202_1 + var_202_2:getConfig("time_second")

			var_202_2:updateData({
				isNew = true,
				end_time = var_202_3
			})
			var_202_0:addAttireFrame(var_202_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_202_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_203_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_203_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_203_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_204_0)
			nowWorld():GetCollectionProxy():Unlock(arg_204_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_205_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_205_0.id):addPT(arg_205_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_206_0)
			local var_206_0 = arg_206_0.id
			local var_206_1 = arg_206_0.count
			local var_206_2 = getProxy(ShipSkinProxy)
			local var_206_3 = var_206_2:getSkinById(var_206_0)

			if var_206_3 and var_206_3:isExpireType() then
				local var_206_4 = var_206_1 + var_206_3.endTime
				local var_206_5 = ShipSkin.New({
					id = var_206_0,
					end_time = var_206_4
				})

				var_206_2:addSkin(var_206_5)
			elseif not var_206_3 then
				local var_206_6 = var_206_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_206_7 = ShipSkin.New({
					id = var_206_0,
					end_time = var_206_6
				})

				var_206_2:addSkin(var_206_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_207_0)
			local var_207_0 = arg_207_0.id
			local var_207_1 = pg.benefit_buff_template[var_207_0]

			assert(var_207_1 and var_207_1.act_id > 0, "should exist act id")

			local var_207_2 = getProxy(ActivityProxy):getActivityById(var_207_1.act_id)

			if var_207_2 and not var_207_2:isEnd() then
				local var_207_3 = var_207_1.max_time
				local var_207_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_207_3

				var_207_2:AddBuff(ActivityBuff.New(var_207_2.id, var_207_0, var_207_4))
				getProxy(ActivityProxy):updateActivity(var_207_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_208_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_209_0)
			getProxy(ApartmentProxy):ModifyRoom(arg_209_0:getConfig("room_id"), function(arg_210_0)
				arg_210_0:AddFurnitureByID(arg_209_0.id)
			end)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_211_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_211_0.id, arg_211_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_212_0)
			getProxy(ApartmentProxy):ModifyApartment(arg_212_0:getConfig("ship_group"), function(arg_213_0)
				arg_213_0:addSkin(arg_212_0.id)
			end)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_214_0)
			local var_214_0 = getProxy(LivingAreaCoverProxy)
			local var_214_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_214_0.id
			})

			var_214_0:UpdateCover(var_214_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_214_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_214_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_215_0)
			local var_215_0 = getProxy(AttireProxy)
			local var_215_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_215_2 = CombatUIStyle.New({
				id = arg_215_0.id
			})

			var_215_2:setUnlock()
			var_215_2:setNew()
			var_215_0:addAttireFrame(var_215_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_215_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_216_0)
			local var_216_0 = getProxy(IslandProxy):GetIsland()

			if not var_216_0 then
				return
			end

			var_216_0:GetInventoryAgency():AddItem(IslandItem.New({
				id = arg_216_0.id,
				num = arg_216_0.count
			}))
		end
	}

	function var_0_0.AddItemDefault(arg_217_0)
		if arg_217_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_217_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_217_0.type].activity_id)

			if arg_217_0.type == DROP_TYPE_RYZA_DROP then
				if var_217_0 and not var_217_0:isEnd() then
					var_217_0:AddItem(AtelierMaterial.New({
						configId = arg_217_0.id,
						count = arg_217_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_217_0)
				end
			elseif var_217_0 and not var_217_0:isEnd() then
				var_217_0:addVitemNumber(arg_217_0.id, arg_217_0.count)
				getProxy(ActivityProxy):updateActivity(var_217_0)
			end
		else
			print("can not handle this type>>" .. arg_217_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_218_0, arg_218_1, arg_218_2)
			setText(arg_218_2, arg_218_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_219_0, arg_219_1, arg_219_2)
			local var_219_0 = arg_219_0:getConfig("display")

			if arg_219_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_219_0 = string.gsub(var_219_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_219_0.extra))
			elseif arg_219_0:getConfig("combination_display") ~= nil then
				local var_219_1 = arg_219_0:getConfig("combination_display")

				if var_219_1 and #var_219_1 > 0 then
					var_219_0 = Item.StaticCombinationDisplay(var_219_1)
				end
			end

			setText(arg_219_2, SwitchSpecialChar(var_219_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_220_0, arg_220_1, arg_220_2)
			setText(arg_220_2, arg_220_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_221_0, arg_221_1, arg_221_2)
			local var_221_0 = arg_221_0:getConfig("skin_id")
			local var_221_1, var_221_2, var_221_3 = ShipWordHelper.GetWordAndCV(var_221_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_221_2, var_221_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_222_0, arg_222_1, arg_222_2)
			local var_222_0 = arg_222_0:getConfig("skin_id")
			local var_222_1, var_222_2, var_222_3 = ShipWordHelper.GetWordAndCV(var_222_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_222_2, var_222_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_223_0, arg_223_1, arg_223_2)
			setText(arg_223_2, arg_223_1.name or arg_223_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_224_0, arg_224_1, arg_224_2)
			local var_224_0 = arg_224_0:getConfig("desc")

			for iter_224_0, iter_224_1 in ipairs({
				arg_224_0.count
			}) do
				var_224_0 = string.gsub(var_224_0, "$" .. iter_224_0, iter_224_1)
			end

			setText(arg_224_2, var_224_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_225_0, arg_225_1, arg_225_2)
			setText(arg_225_2, arg_225_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_226_0, arg_226_1, arg_226_2)
			setText(arg_226_2, arg_226_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_227_0, arg_227_1, arg_227_2)
			local var_227_0 = arg_227_0:getConfig("desc")
			local var_227_1 = _.map(arg_227_0:getConfig("equip_type"), function(arg_228_0)
				return EquipType.Type2Name2(arg_228_0)
			end)

			setText(arg_227_2, var_227_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_227_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_229_0, arg_229_1, arg_229_2)
			setText(arg_229_2, arg_229_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_230_0, arg_230_1, arg_230_2)
			setText(arg_230_2, arg_230_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_231_0, arg_231_1, arg_231_2, arg_231_3)
			local var_231_0 = WorldCollectionProxy.GetCollectionType(arg_231_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_231_2, i18n("world_" .. var_231_0 .. "_desc", arg_231_0:getConfig("name")))
			setText(arg_231_3, i18n("world_" .. var_231_0 .. "_name", arg_231_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_232_0, arg_232_1, arg_232_2)
			setText(arg_232_2, arg_232_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_233_0, arg_233_1, arg_233_2)
			setText(arg_233_2, arg_233_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_234_0, arg_234_1, arg_234_2)
			setText(arg_234_2, arg_234_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_235_0, arg_235_1, arg_235_2)
			local var_235_0 = string.gsub(arg_235_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_235_0.count))

			setText(arg_235_2, SwitchSpecialChar(var_235_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_236_0, arg_236_1, arg_236_2)
			setText(arg_236_2, arg_236_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_237_0, arg_237_1, arg_237_2)
			setText(arg_237_2, arg_237_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_238_0, arg_238_1, arg_238_2)
			setText(arg_238_2, arg_238_0:getConfig("desc"))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_239_0, arg_239_1, arg_239_2)
			setText(arg_239_2, arg_239_0:getConfig("display"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_240_0, arg_240_1, arg_240_2)
			setText(arg_240_2, arg_240_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_241_0, arg_241_1, arg_241_2)
			setText(arg_241_2, arg_241_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_242_0, arg_242_1, arg_242_2)
			setText(arg_242_2, "")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_243_0, arg_243_1, arg_243_2)
			setText(arg_243_2, "")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_244_0, arg_244_1, arg_244_2)
			setText(arg_244_2, "")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_245_0, arg_245_1, arg_245_2)
			setText(arg_245_2, "")
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_246_0, arg_246_1, arg_246_2)
			setText(arg_246_2, "")
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_247_0, arg_247_1, arg_247_2)
		if arg_247_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_247_2, arg_247_0:getConfig("display"))
		else
			setText(arg_247_2, arg_247_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_248_0, arg_248_1, arg_248_2)
			if arg_248_0.id == PlayerConst.ResStoreGold or arg_248_0.id == PlayerConst.ResStoreOil then
				arg_248_2 = arg_248_2 or {}
				arg_248_2.frame = "frame_store"
			end

			updateItem(arg_248_1, Item.New({
				id = id2ItemId(arg_248_0.id)
			}), arg_248_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_249_0, arg_249_1, arg_249_2)
			updateItem(arg_249_1, arg_249_0:getSubClass(), arg_249_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_250_0, arg_250_1, arg_250_2)
			updateEquipment(arg_250_1, arg_250_0:getSubClass(), arg_250_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_251_0, arg_251_1, arg_251_2)
			updateShip(arg_251_1, arg_251_0.ship, arg_251_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_252_0, arg_252_1, arg_252_2)
			updateShip(arg_252_1, arg_252_0.ship, arg_252_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_253_0, arg_253_1, arg_253_2)
			updateFurniture(arg_253_1, arg_253_0, arg_253_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_254_0, arg_254_1, arg_254_2)
			arg_254_2.isWorldBuff = arg_254_0.isWorldBuff

			updateStrategy(arg_254_1, arg_254_0, arg_254_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_255_0, arg_255_1, arg_255_2)
			arg_255_2.isSkin = true
			arg_255_2.isNew = arg_255_0.isNew

			updateShip(arg_255_1, Ship.New({
				configId = tonumber(arg_255_0:getConfig("ship_group") .. "1"),
				skin_id = arg_255_0.id
			}), arg_255_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_256_0, arg_256_1, arg_256_2)
			local var_256_0 = setmetatable({
				count = arg_256_0.count
			}, {
				__index = arg_256_0:getConfigTable()
			})

			updateEquipmentSkin(arg_256_1, var_256_0, arg_256_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_257_0, arg_257_1, arg_257_2)
			updateItem(arg_257_1, Item.New({
				id = arg_257_0.id
			}), arg_257_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_258_0, arg_258_1, arg_258_2)
			updateWorldItem(arg_258_1, WorldItem.New({
				id = arg_258_0.id
			}), arg_258_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_259_0, arg_259_1, arg_259_2)
			updateWorldCollection(arg_259_1, arg_259_0, arg_259_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_260_0, arg_260_1, arg_260_2)
			updateAttire(arg_260_1, AttireConst.TYPE_CHAT_FRAME, arg_260_0:getConfigTable(), arg_260_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_261_0, arg_261_1, arg_261_2)
			updateAttire(arg_261_1, AttireConst.TYPE_ICON_FRAME, arg_261_0:getConfigTable(), arg_261_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_262_0, arg_262_1, arg_262_2)
			updateEmoji(arg_262_1, arg_262_0:getConfigTable(), arg_262_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_263_0, arg_263_1, arg_263_2)
			arg_263_2.count = 1

			updateItem(arg_263_1, arg_263_0:getSubClass(), arg_263_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_264_0, arg_264_1, arg_264_2)
			updateSpWeapon(arg_264_1, SpWeapon.New({
				id = arg_264_0.id
			}), arg_264_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_265_0, arg_265_1, arg_265_2)
			updateItem(arg_265_1, Item.New({
				id = arg_265_0:getConfig("id")
			}), arg_265_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_266_0, arg_266_1, arg_266_2)
			arg_266_2.isSkin = true
			arg_266_2.isTimeLimit = true
			arg_266_2.count = 1

			updateShip(arg_266_1, Ship.New({
				configId = tonumber(arg_266_0:getConfig("ship_group") .. "1"),
				skin_id = arg_266_0.id
			}), arg_266_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_267_0, arg_267_1, arg_267_2)
			AtelierMaterial.UpdateRyzaItem(arg_267_1, arg_267_0.item, arg_267_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_268_0, arg_268_1, arg_268_2)
			WorkBenchItem.UpdateDrop(arg_268_1, arg_268_0.item, arg_268_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_269_0, arg_269_1, arg_269_2)
			WorkBenchItem.UpdateDrop(arg_269_1, WorkBenchItem.New({
				configId = arg_269_0.id,
				count = arg_269_0.count
			}), arg_269_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_270_0, arg_270_1, arg_270_2)
			updateBuff(arg_270_1, arg_270_0.id, arg_270_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_271_0, arg_271_1, arg_271_2)
			updateCommander(arg_271_1, arg_271_0, arg_271_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_272_0, arg_272_1, arg_272_2)
			updateCover(arg_272_1, arg_272_0, arg_272_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_273_0, arg_273_1, arg_273_2)
			updateAttireCombatUI(arg_273_1, AttireConst.TYPE_ICON_FRAME, arg_273_0:getConfigTable(), arg_273_2)
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_274_0, arg_274_1, arg_274_2)
			updateActivityMedal(arg_274_1, arg_274_0:getConfigTable(), arg_274_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_275_0, arg_275_1, arg_275_2)
		updateDefaultIconTpl(arg_275_1, arg_275_0, arg_275_2)
	end

	var_0_0.UpdateCustomDropCase = {
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_276_0, arg_276_1, arg_276_2)
			updateDorm3dIcon(arg_276_1, arg_276_0, arg_276_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_277_0, arg_277_1, arg_277_2)
			updateDorm3dIcon(arg_277_1, arg_277_0, arg_277_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_278_0, arg_278_1, arg_278_2)
			updateDorm3dIcon(arg_278_1, arg_278_0, arg_278_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_279_0, arg_279_1, arg_279_2)
			updateIslandItem(arg_279_1, arg_279_0, arg_279_2)
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_280_0, arg_280_1, arg_280_2)
			updateIslandUnlock(arg_280_1, arg_280_0, arg_280_2)
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_281_0, arg_281_1, arg_281_2)
			updateIslandInvitation(arg_281_1, arg_281_0, arg_281_2)
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_282_0, arg_282_1, arg_282_2)
			updateIslandSeasonPt(arg_282_1, arg_282_0, arg_282_2)
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_283_0, arg_283_1, arg_283_2)
			updateIslandWatherCollect(arg_283_1, arg_283_0, arg_283_2)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_284_0, arg_284_1, arg_284_2)
			updateIslandFurniture(arg_284_1, arg_284_0, arg_284_2)
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_285_0, arg_285_1, arg_285_2)
			updateIslandCardDiy(arg_285_1, arg_285_0, arg_285_2)
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_286_0, arg_286_1, arg_286_2)
			updateIslandSpeedupTicket(arg_286_1, arg_286_0, arg_286_2)
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_287_0, arg_287_1, arg_287_2)
			updateItem(arg_287_1, Item.New({
				id = arg_287_0.id
			}), arg_287_2)
		end
	}

	function var_0_0.UpdateCustomDropDefault(arg_288_0, arg_288_1, arg_288_2)
		if arg_288_2.style == "dorm" then
			updateDorm3dIcon(arg_288_1, arg_288_0, arg_288_2)
		elseif arg_288_2.style == "island" then
			updateIslandDefaultIconTpl(arg_288_1, arg_288_0, arg_288_2)
		else
			warning(string.format("without dropType %d in updateCustomDrop", arg_288_0.type))
		end
	end
end

return var_0_0
