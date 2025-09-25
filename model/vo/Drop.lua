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
		end
	}, function()
		return arg_7_0:getConfig("icon")
	end)
end

function var_0_0.getCount(arg_18_0)
	if arg_18_0.type == DROP_TYPE_OPERATION or arg_18_0.type == DROP_TYPE_LOVE_LETTER then
		return 1
	else
		return arg_18_0.count
	end
end

function var_0_0.isLoveLetter(arg_19_0)
	return arg_19_0.type == DROP_TYPE_LOVE_LETTER or arg_19_0.type == DROP_TYPE_ITEM and arg_19_0:getConfig("type") == Item.LOVE_LETTER_TYPE
end

function var_0_0.getOwnedCount(arg_20_0)
	return switch(arg_20_0.type, var_0_0.CountCase, var_0_0.CountDefault, arg_20_0)
end

function var_0_0.getSubClass(arg_21_0)
	return switch(arg_21_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_21_0)
end

function var_0_0.getDropRarity(arg_22_0)
	return switch(arg_22_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_22_0)
end

function var_0_0.getDropRarityDorm(arg_23_0)
	return switch(arg_23_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_23_0)
end

function var_0_0.DropTrans(arg_24_0, ...)
	return switch(arg_24_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_24_0, ...)
end

function var_0_0.AddItemOperation(arg_25_0)
	return switch(arg_25_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_25_0)
end

function var_0_0.MsgboxIntroSet(arg_26_0, ...)
	return switch(arg_26_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_26_0, ...)
end

function var_0_0.UpdateDropTpl(arg_27_0, ...)
	return switch(arg_27_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_27_0, ...)
end

function var_0_0.UpdateCustomDropTpl(arg_28_0, ...)
	return switch(arg_28_0.type, var_0_0.UpdateCustomDropCase, var_0_0.UpdateCustomDropDefault, arg_28_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_30_0)
			local var_30_0 = Item.getConfigData(id2ItemId(arg_30_0.id))

			arg_30_0.desc = var_30_0.display

			return var_30_0
		end,
		[DROP_TYPE_ITEM] = function(arg_31_0)
			local var_31_0 = Item.getConfigData(arg_31_0.id)

			arg_31_0.desc = var_31_0.display

			if var_31_0.type == Item.LOVE_LETTER_TYPE then
				arg_31_0.desc = string.gsub(arg_31_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_31_0.extra))
			end

			return var_31_0
		end,
		[DROP_TYPE_VITEM] = function(arg_32_0)
			local var_32_0 = Item.getConfigData(arg_32_0.id)

			assert(var_32_0, arg_32_0.id)

			arg_32_0.desc = var_32_0.display

			return var_32_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_33_0)
			local var_33_0 = Item.getConfigData(arg_33_0.id)

			arg_33_0.desc = string.gsub(var_33_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_33_0.count))

			return var_33_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_34_0)
			local var_34_0 = Equipment.getConfigData(arg_34_0.id)

			arg_34_0.desc = var_34_0.descrip

			return var_34_0
		end,
		[DROP_TYPE_SHIP] = function(arg_35_0)
			local var_35_0 = pg.ship_data_statistics[arg_35_0.id]
			local var_35_1, var_35_2, var_35_3 = ShipWordHelper.GetWordAndCV(var_35_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_35_0.desc = var_35_3 or i18n("ship_drop_desc_default")
			arg_35_0.ship = Ship.New({
				configId = arg_35_0.id,
				skin_id = arg_35_0.skinId,
				propose = arg_35_0.propose
			})
			arg_35_0.ship.remoulded = arg_35_0.remoulded
			arg_35_0.ship.virgin = arg_35_0.virgin

			return var_35_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_36_0)
			local var_36_0 = pg.furniture_data_template[arg_36_0.id]

			arg_36_0.desc = var_36_0.describe

			return var_36_0
		end,
		[DROP_TYPE_SKIN] = function(arg_37_0)
			local var_37_0 = pg.ship_skin_template[arg_37_0.id]

			if var_37_0.skin_type == ShipSkin.SKIN_TYPE_TB then
				local var_37_1, var_37_2, var_37_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_37_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_37_0.desc = var_37_3
			else
				local var_37_4, var_37_5, var_37_6 = ShipWordHelper.GetWordAndCV(arg_37_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_37_0.desc = var_37_6
			end

			return var_37_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_38_0)
			local var_38_0 = pg.ship_skin_template[arg_38_0.id]

			if var_38_0.skin_type == ShipSKin.SKIN_TYPE_TB then
				local var_38_1, var_38_2, var_38_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_38_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_38_0.desc = var_38_3
			else
				local var_38_4, var_38_5, var_38_6 = ShipWordHelper.GetWordAndCV(arg_38_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_38_0.desc = var_38_6
			end

			return var_38_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_39_0)
			local var_39_0 = pg.equip_skin_template[arg_39_0.id]

			arg_39_0.desc = var_39_0.desc

			return var_39_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_40_0)
			local var_40_0 = pg.world_item_data_template[arg_40_0.id]

			arg_40_0.desc = var_40_0.display

			return var_40_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_41_0)
			local var_41_0 = pg.item_data_frame[arg_41_0.id]

			arg_41_0.desc = var_41_0.desc

			return var_41_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_42_0)
			return pg.item_data_chat[arg_42_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_43_0)
			local var_43_0 = pg.spweapon_data_statistics[arg_43_0.id]

			arg_43_0.desc = var_43_0.descrip

			return var_43_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_44_0)
			local var_44_0 = pg.activity_ryza_item[arg_44_0.id]

			arg_44_0.item = AtelierMaterial.New({
				configId = arg_44_0.id
			})
			arg_44_0.desc = arg_44_0.item:GetDesc()

			return var_44_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_45_0)
			arg_45_0.ship = getProxy(BayProxy):getShipById(arg_45_0.count)

			local var_45_0 = pg.ship_data_statistics[arg_45_0.ship.configId]
			local var_45_1, var_45_2, var_45_3 = ShipWordHelper.GetWordAndCV(var_45_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_45_0.desc = var_45_3 or i18n("ship_drop_desc_default")

			return var_45_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_46_0)
			return arg_46_0.isWorldBuff and pg.world_SLGbuff_data[arg_46_0.id] or pg.strategy_data_template[arg_46_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_47_0)
			local var_47_0 = pg.emoji_template[arg_47_0.id]

			arg_47_0.name = var_47_0.item_name
			arg_47_0.desc = var_47_0.item_desc

			return var_47_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_48_0)
			local var_48_0 = WorldCollectionProxy.GetCollectionTemplate(arg_48_0.id)

			arg_48_0.desc = var_48_0.name

			return var_48_0
		end,
		[DROP_TYPE_META_PT] = function(arg_49_0)
			local var_49_0 = pg.ship_strengthen_meta[arg_49_0.id]
			local var_49_1 = Item.getConfigData(var_49_0.itemid)

			arg_49_0.desc = var_49_1.display

			return var_49_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_50_0)
			local var_50_0 = pg.activity_workbench_item[arg_50_0.id]

			arg_50_0.item = WorkBenchItem.New({
				configId = arg_50_0.id
			})
			arg_50_0.desc = arg_50_0.item:GetDesc()

			return var_50_0
		end,
		[DROP_TYPE_BUFF] = function(arg_51_0)
			local var_51_0 = pg.benefit_buff_template[arg_51_0.id]

			arg_51_0.desc = var_51_0.desc

			return var_51_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_52_0)
			local var_52_0 = pg.commander_data_template[arg_52_0.id]

			arg_52_0.desc = var_52_0.desc

			return var_52_0
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_53_0)
			local var_53_0 = pg.island_item_data_template[arg_53_0.id]

			arg_53_0.desc = ""

			return var_53_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_54_0)
			local var_54_0 = pg.island_ability_template[arg_54_0.id]

			arg_54_0.desc = ""

			return var_54_0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_55_0)
			local var_55_0 = pg.island_chara_template[arg_55_0.id]

			arg_55_0.desc = ""

			return var_55_0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_56_0)
			local var_56_0 = pg.island_furniture_template[arg_56_0.id]

			arg_56_0.desc = ""

			return var_56_0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_57_0)
			local var_57_0 = pg.island_dress_template[arg_57_0.id]

			arg_57_0.desc = ""

			return var_57_0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_58_0)
			local var_58_0 = pg.island_skin_template[arg_58_0.id]

			arg_58_0.desc = ""

			return var_58_0
		end,
		[DROP_TYPE_ISLAND_ACTION] = function(arg_59_0)
			local var_59_0 = pg.island_action[arg_59_0.id]

			arg_59_0.desc = ""

			return var_59_0
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_60_0)
			local var_60_0 = pg.island_speedup_ticket[arg_60_0.id]

			arg_60_0.desc = ""

			return var_60_0
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_61_0)
			return pg.island_card_diy[arg_61_0.id]
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_62_0)
			return pg.drop_data_restore[arg_62_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_63_0)
			local var_63_0 = pg.dorm3d_furniture_template[arg_63_0.id]

			arg_63_0.desc = var_63_0.desc

			return var_63_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_64_0)
			local var_64_0 = pg.dorm3d_gift[arg_64_0.id]

			arg_64_0.desc = var_64_0.display

			return var_64_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_65_0)
			local var_65_0 = pg.dorm3d_resource[arg_65_0.id]

			arg_65_0.desc = ""

			return var_65_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_66_0)
			local var_66_0 = pg.livingarea_cover[arg_66_0.id]

			arg_66_0.desc = var_66_0.desc

			return var_66_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_67_0)
			return pg.item_data_battleui[arg_67_0.id]
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_68_0)
			local var_68_0 = pg.activity_medal_template[arg_68_0.id].item

			return pg.item_virtual_data_statistics[var_68_0]
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_69_0)
			local var_69_0 = Item.getConfigData(arg_69_0.id)

			assert(var_69_0, arg_69_0.id)

			arg_69_0.desc = var_69_0.display

			return var_69_0
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_70_0)
			return pg.island_collection[arg_70_0.id]
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_71_0)
			return getIslandSeasonPtInfo()
		end
	}

	function var_0_0.ConfigDefault(arg_72_0)
		local var_72_0 = arg_72_0.type

		if tonumber(var_72_0) and var_72_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_72_1 = pg.activity_drop_type[var_72_0].relevance

			return var_72_1 and pg[var_72_1][arg_72_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_73_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_73_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_74_0)
			local var_74_0 = getProxy(BagProxy):getItemCountById(arg_74_0.id)

			if arg_74_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_74_0, 1), true
			else
				return var_74_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_75_0)
			local var_75_0 = arg_75_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_75_0], "equip groupId not exist")

			local var_75_1 = pg.equip_data_template.get_id_list_by_group[var_75_0]

			return underscore.reduce(var_75_1, 0, function(arg_76_0, arg_76_1)
				local var_76_0 = getProxy(EquipmentProxy):getEquipmentById(arg_76_1)

				return arg_76_0 + (var_76_0 and var_76_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_76_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_77_0)
			return getProxy(BayProxy):getConfigShipCount(arg_77_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_78_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_78_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_79_0)
			return arg_79_0.count, tobool(arg_79_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_80_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_80_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_81_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_81_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_82_0)
			local var_82_0 = arg_82_0:getConfig("virtual_type")

			return switch(var_82_0, {
				[22] = function()
					local var_83_0 = getProxy(ActivityProxy):getActivityById(arg_82_0:getConfig("link_id"))

					return var_83_0 and var_83_0.data1 or 0, true
				end,
				[101] = function()
					local var_84_0 = getProxy(ActivityProxy):getActivityById(arg_82_0:getConfig("link_id"))

					return var_84_0 and var_84_0.data1 or 0
				end
			}, function()
				return nil
			end)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_86_0)
			local var_86_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_86_0.id)

			return (var_86_0 and var_86_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_86_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_87_0)
			local var_87_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_87_0.type].activity_id)

			if not var_87_0 then
				return 0
			end

			local var_87_1 = var_87_0:GetItemById(arg_87_0.id)

			return var_87_1 and var_87_1.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_88_0)
			local var_88_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_88_0.id)

			return var_88_0 and (not var_88_0:expiredType() or not not var_88_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_89_0)
			local var_89_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_89_0.id)

			return var_89_0 and (not var_89_0:expiredType() or not not var_89_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_90_0)
			local var_90_0 = nowWorld()

			if var_90_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_90_0:GetInventoryProxy():GetItemCount(arg_90_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_91_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_91_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_92_0)
			local var_92_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_92_0.id)

			return var_92_0 and var_92_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_93_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_93_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_94_0)
			local var_94_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_94_0.id)

			return 1
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_95_0)
			local var_95_0 = 0
			local var_95_1 = getProxy(IslandProxy):GetIsland()

			if var_95_1 then
				var_95_0 = var_95_1:GetInventoryAgency():GetOwnCount(arg_95_0.id)
			end

			return var_95_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_96_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_97_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_98_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_99_0)
			return 0
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_100_0)
			return 0
		end
	}

	function var_0_0.CountDefault(arg_101_0)
		local var_101_0 = arg_101_0.type

		if var_101_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_101_0].activity_id):getVitemNumber(arg_101_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_102_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_103_0)
			return Item.New(arg_103_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_104_0)
			return Item.New(arg_104_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_105_0)
			return Equipment.New(arg_105_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_106_0)
			return Item.New({
				count = 1,
				id = arg_106_0.id,
				extra = arg_106_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_107_0)
			return WorldItem.New(arg_107_0)
		end
	}

	function var_0_0.SubClassDefault(arg_108_0)
		assert(false, string.format("drop type %d without subClass", arg_108_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_109_0)
			return arg_109_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_110_0)
			return arg_110_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_111_0)
			return arg_111_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_112_0)
			return arg_112_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_113_0)
			return arg_113_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_114_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_115_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_116_0)
			return arg_116_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_117_0)
			return arg_117_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_118_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_119_0)
			return arg_119_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_120_0)
			return arg_120_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_121_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_122_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_123_0)
			return arg_123_0:getConfig("rare")
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_124_0)
			return arg_124_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_125_0)
			return arg_125_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_126_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_127_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_128_0)
			return arg_128_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_129_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_130_0)
			return ItemRarity.Gold
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_131_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_132_0)
		return arg_132_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_133_0)
		return arg_133_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_134_0)
			local var_134_0 = Drop.New({
				type = arg_134_0:getConfig("type"),
				id = arg_134_0:getConfig("resource_type"),
				count = arg_134_0:getConfig("resource_num") * arg_134_0.count
			})
			local var_134_1 = Drop.New({
				type = arg_134_0:getConfig("target_type"),
				id = arg_134_0:getConfig("target_id"),
				count = arg_134_0.count
			})

			PlayerConst.UpdateLinkActivity({
				var_134_1
			})

			var_134_0.name = string.format("%s(%s)", var_134_0:getName(), var_134_1:getName())

			return var_134_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_135_0)
			for iter_135_0, iter_135_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_135_1.id].pt == arg_135_0.id then
					return nil, arg_135_0
				end
			end

			return arg_135_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_136_0)
			if arg_136_0.id ~= 3 then
				return nil
			end

			return arg_136_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_137_0)
			return nil, arg_137_0
		end,
		[DROP_TYPE_VITEM] = function(arg_138_0, arg_138_1, arg_138_2)
			assert(arg_138_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_138_0.id)

			return switch(arg_138_0:getConfig("virtual_type"), {
				function()
					if arg_138_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_138_0
					end

					return arg_138_0
				end,
				[6] = function()
					local var_140_0 = arg_138_2.taskId
					local var_140_1 = getProxy(ActivityProxy)
					local var_140_2 = var_140_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_140_2 then
						local var_140_3 = var_140_2.data1KeyValueList[1]

						var_140_3[var_140_0] = defaultValue(var_140_3[var_140_0], 0) + arg_138_0.count

						var_140_1:updateActivity(var_140_2)
					end

					return nil, arg_138_0
				end,
				[13] = function()
					local var_141_0 = arg_138_0:getName()
					local var_141_1 = getProxy(ActivityProxy):getActivityById(arg_138_0:getConfig("link_id"))

					if not var_141_1 or var_141_1:isEnd() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_141_0))

						return nil
					elseif var_141_1:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_141_0))

						return nil
					else
						return arg_138_0, nil
					end
				end,
				[21] = function()
					return nil, arg_138_0
				end,
				[28] = function()
					local var_143_0 = Drop.New({
						type = arg_138_0.type,
						id = arg_138_0.id,
						count = math.floor(arg_138_0.count / 1000)
					})
					local var_143_1 = Drop.New({
						type = arg_138_0.type,
						id = arg_138_0.id,
						count = arg_138_0.count - math.floor(arg_138_0.count / 1000)
					})

					return var_143_0, var_143_1
				end
			}, function()
				return arg_138_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_145_0, arg_145_1)
			if Ship.isMetaShipByConfigID(arg_145_0.id) and Player.isMetaShipNeedToTrans(arg_145_0.id) then
				local var_145_0 = table.indexof(arg_145_1, arg_145_0.id, 1)

				if var_145_0 then
					table.remove(arg_145_1, var_145_0)
				else
					local var_145_1 = Player.metaShip2Res(arg_145_0.id)
					local var_145_2 = Drop.New(var_145_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_145_0.id, var_145_2)

					return arg_145_0, var_145_2
				end
			end

			return arg_145_0
		end,
		[DROP_TYPE_SKIN] = function(arg_146_0)
			arg_146_0.isNew = not getProxy(ShipSkinProxy):hasOldNonLimitSkin(arg_146_0.id)

			return arg_146_0
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_147_0)
			local var_147_0 = getProxy(PlayerProxy):getRawData()
			local var_147_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_147_0:updateMedalList({
				{
					key = arg_147_0.id,
					value = var_147_1
				}
			})

			return arg_147_0
		end,
		[DROP_TYPE_BUFF] = function(arg_148_0)
			return nil, arg_148_0
		end
	}

	function var_0_0.TransDefault(arg_149_0)
		return arg_149_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_150_0)
			local var_150_0 = id2res(arg_150_0.id)

			assert(var_150_0, "res should be defined: " .. arg_150_0.id)

			local var_150_1 = getProxy(PlayerProxy)
			local var_150_2 = var_150_1:getData()

			var_150_2:addResources({
				[var_150_0] = arg_150_0.count
			})
			var_150_1:updatePlayer(var_150_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_151_0)
			if arg_151_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_151_0 = getProxy(BagProxy):getItemCountById(arg_151_0.id)
				local var_151_1 = math.min(arg_151_0:getConfig("max_num") - var_151_0, arg_151_0.count)

				if var_151_1 > 0 then
					getProxy(BagProxy):addItemById(arg_151_0.id, var_151_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_151_0.id, arg_151_0.count, arg_151_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_152_0)
			local var_152_0 = arg_152_0:getSubClass()

			getProxy(BagProxy):addItemById(var_152_0.id, var_152_0.count, var_152_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_153_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_153_0.id, arg_153_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_154_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_155_0)
			local var_155_0 = getProxy(DormProxy)
			local var_155_1 = Furniture.New({
				id = arg_155_0.id,
				count = arg_155_0.count
			})

			if var_155_1:isRecordTime() then
				var_155_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_155_0:AddFurniture(var_155_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_156_0)
			local var_156_0 = getProxy(ShipSkinProxy)
			local var_156_1 = ShipSkin.New({
				id = arg_156_0.id
			})

			var_156_0:addSkin(var_156_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_157_0)
			arg_157_0 = arg_157_0:getSubClass()

			assert(arg_157_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_157_0.id)
			switch(arg_157_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_157_0.id, arg_157_0.count)
				end,
				function()
					local var_159_0 = getProxy(ActivityProxy)
					local var_159_1 = arg_157_0:getConfig("link_id")
					local var_159_2

					if var_159_1 > 0 then
						var_159_2 = var_159_0:getActivityById(var_159_1)
					else
						var_159_2 = var_159_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_159_2 and not var_159_2:isEnd() then
						if not table.contains(var_159_2.data1_list, arg_157_0.id) then
							table.insert(var_159_2.data1_list, arg_157_0.id)
						end

						var_159_0:updateActivity(var_159_2)
					end
				end,
				function()
					local var_160_0 = getProxy(ActivityProxy)
					local var_160_1 = var_160_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_160_0, iter_160_1 in ipairs(var_160_1) do
						iter_160_1.data1 = iter_160_1.data1 + arg_157_0.count

						local var_160_2 = iter_160_1:getConfig("config_id")
						local var_160_3 = pg.activity_vote[var_160_2]

						if var_160_3 and var_160_3.ticket_id_period == arg_157_0.id then
							iter_160_1.data3 = iter_160_1.data3 + arg_157_0.count
						end

						var_160_0:updateActivity(iter_160_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_157_0.id,
							ptCount = arg_157_0.count
						})
					end
				end,
				[4] = function()
					local var_161_0 = getProxy(ColoringProxy):getColorItems()

					var_161_0[arg_157_0.id] = (var_161_0[arg_157_0.id] or 0) + arg_157_0.count
				end,
				[6] = function()
					local var_162_0 = getProxy(ActivityProxy)
					local var_162_1 = var_162_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_162_1 then
						var_162_1.data3 = var_162_1.data3 + arg_157_0.count

						var_162_0:updateActivity(var_162_1)
					end
				end,
				[7] = function()
					local var_163_0 = getProxy(ChapterProxy)

					var_163_0:updateRemasterTicketsNum(math.min(var_163_0.remasterTickets + arg_157_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_164_0 = getProxy(ActivityProxy)
					local var_164_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_164_1 then
						var_164_1.data1_list[1] = var_164_1.data1_list[1] + arg_157_0.count

						var_164_0:updateActivity(var_164_1)
					end
				end,
				[11] = function()
					local var_165_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_165_0 and not var_165_0:isEnd() then
						var_165_0.data1 = var_165_0.data1 + arg_157_0.count
					end
				end,
				[12] = function()
					local var_166_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_166_0 and not var_166_0:isEnd() then
						var_166_0.data1KeyValueList[1][arg_157_0.id] = (var_166_0.data1KeyValueList[1][arg_157_0.id] or 0) + arg_157_0.count
					end
				end,
				[13] = function()
					local var_167_0 = getProxy(ActivityProxy):getActivityById(arg_157_0:getConfig("link_id"))

					if var_167_0:IsMaxCnt() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

						return
					end

					var_167_0.data1 = var_167_0.data1 + arg_157_0.count

					getProxy(ActivityProxy):updateActivity(var_167_0)
				end,
				[14] = function()
					local var_168_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_157_0.id then
						var_168_0:AddSummonPt(arg_157_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_157_0.id then
						var_168_0:AddSummonPtOld(arg_157_0.count)
					end
				end,
				[15] = function()
					local var_169_0 = getProxy(ActivityProxy)
					local var_169_1 = var_169_0:getActivityById(arg_157_0:getConfig("link_id"))

					if not var_169_1 or var_169_1:isEnd() then
						return
					end

					if var_169_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE then
						local var_169_2 = pg.activity_event_grid[var_169_1.data1]

						if arg_157_0.id == var_169_2.ticket_item then
							var_169_1.data2 = var_169_1.data2 + arg_157_0.count
						elseif arg_157_0.id == var_169_2.explore_item then
							var_169_1.data3 = var_169_1.data3 + arg_157_0.count
						end
					elseif var_169_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_EXPEDITION then
						var_169_1.data3 = var_169_1.data3 + arg_157_0.count
					end

					var_169_0:updateActivity(var_169_1)
				end,
				[16] = function()
					local var_170_0 = getProxy(ActivityProxy)
					local var_170_1 = var_170_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_170_0, iter_170_1 in pairs(var_170_1) do
						if iter_170_1 and not iter_170_1:isEnd() and arg_157_0.id == iter_170_1:getConfig("config_id") then
							iter_170_1.data1 = iter_170_1.data1 + arg_157_0.count

							var_170_0:updateActivity(iter_170_1)
						end
					end
				end,
				[20] = function()
					local var_171_0 = getProxy(BagProxy)
					local var_171_1 = pg.gameset.urpt_chapter_max.description
					local var_171_2 = var_171_1[1]
					local var_171_3 = var_171_1[2]
					local var_171_4 = var_171_0:GetLimitCntById(var_171_2)
					local var_171_5 = math.min(var_171_3 - var_171_4, arg_157_0.count)

					if var_171_5 > 0 then
						var_171_0:addItemById(var_171_2, var_171_5)
						var_171_0:AddLimitCnt(var_171_2, var_171_5)
					end
				end,
				[21] = function()
					local var_172_0 = getProxy(ActivityProxy)
					local var_172_1 = var_172_0:getActivityById(arg_157_0:getConfig("link_id"))

					if var_172_1 and not var_172_1:isEnd() then
						var_172_1.data2 = 1

						var_172_0:updateActivity(var_172_1)
					end
				end,
				[22] = function()
					local var_173_0 = getProxy(ActivityProxy)
					local var_173_1 = var_173_0:getActivityById(arg_157_0:getConfig("link_id"))

					if var_173_1 and not var_173_1:isEnd() then
						var_173_1.data1 = var_173_1.data1 + arg_157_0.count

						var_173_0:updateActivity(var_173_1)
					end
				end,
				[23] = function()
					local var_174_0 = (function()
						for iter_175_0, iter_175_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_157_0.id == iter_175_1[1] then
								return iter_175_1[2]
							end
						end
					end)()

					assert(var_174_0)

					local var_174_1 = getProxy(PlayerProxy)
					local var_174_2 = var_174_1:getData()

					var_174_2:addExpToLevel(var_174_0)
					var_174_1:updatePlayer(var_174_2)
				end,
				[24] = function()
					local var_176_0 = arg_157_0:getConfig("link_id")
					local var_176_1 = getProxy(ActivityProxy):getActivityById(var_176_0)

					if var_176_1 and not var_176_1:isEnd() and var_176_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_176_1.data2 = var_176_1.data2 + arg_157_0.count

						getProxy(ActivityProxy):updateActivity(var_176_1)
					end
				end,
				[25] = function()
					local var_177_0 = getProxy(ActivityProxy)
					local var_177_1 = var_177_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_177_1 and not var_177_1:isEnd() then
						var_177_1.data1 = var_177_1.data1 - 1

						if not table.contains(var_177_1.data1_list, arg_157_0.id) then
							table.insert(var_177_1.data1_list, arg_157_0.id)
						end

						var_177_0:updateActivity(var_177_1)

						local var_177_2 = arg_157_0:getConfig("link_id")

						if var_177_2 > 0 then
							local var_177_3 = var_177_0:getActivityById(var_177_2)

							if var_177_3 and not var_177_3:isEnd() then
								var_177_3.data1 = var_177_3.data1 + 1

								var_177_0:updateActivity(var_177_3)
							end
						end
					end
				end,
				[26] = function()
					local var_178_0 = getProxy(ActivityProxy)
					local var_178_1 = Clone(var_178_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_178_1 and not var_178_1:isEnd() then
						var_178_1.data1 = var_178_1.data1 + arg_157_0.count

						var_178_0:updateActivity(var_178_1)
					end
				end,
				[27] = function()
					local var_179_0 = getProxy(ActivityProxy)
					local var_179_1 = Clone(var_179_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_179_1 and not var_179_1:isEnd() then
						var_179_1:AddExp(arg_157_0.count)
						var_179_0:updateActivity(var_179_1)
					end
				end,
				[28] = function()
					local var_180_0 = getProxy(ActivityProxy)
					local var_180_1 = Clone(var_180_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_180_1 and not var_180_1:isEnd() then
						var_180_1:AddGold(arg_157_0.count)
						var_180_0:updateActivity(var_180_1)
					end
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_183_0 = arg_157_0:getConfig("link_id")
					local var_183_1 = getProxy(ActivityProxy):getActivityById(var_183_0)

					if var_183_1 and not var_183_1:isEnd() then
						var_183_1.data1 = var_183_1.data1 + arg_157_0.count

						getProxy(ActivityProxy):updateActivity(var_183_1)
					end
				end,
				[102] = function()
					local var_184_0 = arg_157_0:getConfig("link_id")
					local var_184_1 = pg.activity_template[var_184_0].type

					switch(var_184_1, {
						[ActivityConst.ACTIVITY_TYPE_CITY_REBUILD] = function()
							getProxy(CityRebuildProxy):AddPt(var_184_0, arg_157_0.count)
						end
					})
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_186_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_186_0.id, arg_186_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_187_0)
			local var_187_0 = getProxy(BayProxy)
			local var_187_1 = var_187_0:getShipById(arg_187_0.count)

			if var_187_1 then
				var_187_1:unlockActivityNpc(0)
				var_187_0:updateShip(var_187_1)
				getProxy(CollectionProxy):flushCollection(var_187_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_188_0)
			nowWorld():GetInventoryProxy():AddItem(arg_188_0.id, arg_188_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_189_0)
			local var_189_0 = getProxy(AttireProxy)
			local var_189_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_189_2 = IconFrame.New({
				id = arg_189_0.id
			})
			local var_189_3 = var_189_1 + var_189_2:getConfig("time_second")

			var_189_2:updateData({
				isNew = true,
				end_time = var_189_3
			})
			var_189_0:addAttireFrame(var_189_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_189_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_190_0)
			local var_190_0 = getProxy(AttireProxy)
			local var_190_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_190_2 = ChatFrame.New({
				id = arg_190_0.id
			})
			local var_190_3 = var_190_1 + var_190_2:getConfig("time_second")

			var_190_2:updateData({
				isNew = true,
				end_time = var_190_3
			})
			var_190_0:addAttireFrame(var_190_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_190_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_191_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_191_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_191_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_192_0)
			nowWorld():GetCollectionProxy():Unlock(arg_192_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_193_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_193_0.id):addPT(arg_193_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_194_0)
			local var_194_0 = arg_194_0.id
			local var_194_1 = arg_194_0.count
			local var_194_2 = getProxy(ShipSkinProxy)
			local var_194_3 = var_194_2:getSkinById(var_194_0)

			if var_194_3 and var_194_3:isExpireType() then
				local var_194_4 = var_194_1 + var_194_3.endTime
				local var_194_5 = ShipSkin.New({
					id = var_194_0,
					end_time = var_194_4
				})

				var_194_2:addSkin(var_194_5)
			elseif not var_194_3 then
				local var_194_6 = var_194_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_194_7 = ShipSkin.New({
					id = var_194_0,
					end_time = var_194_6
				})

				var_194_2:addSkin(var_194_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_195_0)
			local var_195_0 = arg_195_0.id
			local var_195_1 = pg.benefit_buff_template[var_195_0]

			assert(var_195_1 and var_195_1.act_id > 0, "should exist act id")

			local var_195_2 = getProxy(ActivityProxy):getActivityById(var_195_1.act_id)

			if var_195_2 and not var_195_2:isEnd() then
				local var_195_3 = var_195_1.max_time
				local var_195_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_195_3

				var_195_2:AddBuff(ActivityBuff.New(var_195_2.id, var_195_0, var_195_4))
				getProxy(ActivityProxy):updateActivity(var_195_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_196_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_197_0)
			getProxy(ApartmentProxy):ModifyRoom(arg_197_0:getConfig("room_id"), function(arg_198_0)
				arg_198_0:AddFurnitureByID(arg_197_0.id)
			end)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_199_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_199_0.id, arg_199_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_200_0)
			getProxy(ApartmentProxy):ModifyApartment(arg_200_0:getConfig("ship_group"), function(arg_201_0)
				arg_201_0:addSkin(arg_200_0.id)
			end)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_202_0)
			local var_202_0 = getProxy(LivingAreaCoverProxy)
			local var_202_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_202_0.id
			})

			var_202_0:UpdateCover(var_202_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_202_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_202_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_203_0)
			local var_203_0 = getProxy(AttireProxy)
			local var_203_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_203_2 = CombatUIStyle.New({
				id = arg_203_0.id
			})

			var_203_2:setUnlock()
			var_203_2:setNew()
			var_203_0:addAttireFrame(var_203_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_203_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_204_0)
			local var_204_0 = getProxy(IslandProxy):GetIsland()

			if not var_204_0 then
				return
			end

			var_204_0:GetInventoryAgency():AddItem(IslandItem.New({
				id = arg_204_0.id,
				num = arg_204_0.count
			}))
		end
	}

	function var_0_0.AddItemDefault(arg_205_0)
		if arg_205_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_205_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_205_0.type].activity_id)

			if arg_205_0.type == DROP_TYPE_RYZA_DROP then
				if var_205_0 and not var_205_0:isEnd() then
					var_205_0:AddItem(AtelierMaterial.New({
						configId = arg_205_0.id,
						count = arg_205_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_205_0)
				end
			elseif var_205_0 and not var_205_0:isEnd() then
				var_205_0:addVitemNumber(arg_205_0.id, arg_205_0.count)
				getProxy(ActivityProxy):updateActivity(var_205_0)
			end
		else
			print("can not handle this type>>" .. arg_205_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_206_0, arg_206_1, arg_206_2)
			setText(arg_206_2, arg_206_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_207_0, arg_207_1, arg_207_2)
			local var_207_0 = arg_207_0:getConfig("display")

			if arg_207_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_207_0 = string.gsub(var_207_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_207_0.extra))
			elseif arg_207_0:getConfig("combination_display") ~= nil then
				local var_207_1 = arg_207_0:getConfig("combination_display")

				if var_207_1 and #var_207_1 > 0 then
					var_207_0 = Item.StaticCombinationDisplay(var_207_1)
				end
			end

			setText(arg_207_2, SwitchSpecialChar(var_207_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_208_0, arg_208_1, arg_208_2)
			setText(arg_208_2, arg_208_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_209_0, arg_209_1, arg_209_2)
			local var_209_0 = arg_209_0:getConfig("skin_id")
			local var_209_1, var_209_2, var_209_3 = ShipWordHelper.GetWordAndCV(var_209_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_209_2, var_209_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_210_0, arg_210_1, arg_210_2)
			local var_210_0 = arg_210_0:getConfig("skin_id")
			local var_210_1, var_210_2, var_210_3 = ShipWordHelper.GetWordAndCV(var_210_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_210_2, var_210_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_211_0, arg_211_1, arg_211_2)
			setText(arg_211_2, arg_211_1.name or arg_211_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_212_0, arg_212_1, arg_212_2)
			local var_212_0 = arg_212_0:getConfig("desc")

			for iter_212_0, iter_212_1 in ipairs({
				arg_212_0.count
			}) do
				var_212_0 = string.gsub(var_212_0, "$" .. iter_212_0, iter_212_1)
			end

			setText(arg_212_2, var_212_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_213_0, arg_213_1, arg_213_2)
			setText(arg_213_2, arg_213_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_214_0, arg_214_1, arg_214_2)
			setText(arg_214_2, arg_214_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_215_0, arg_215_1, arg_215_2)
			local var_215_0 = arg_215_0:getConfig("desc")
			local var_215_1 = _.map(arg_215_0:getConfig("equip_type"), function(arg_216_0)
				return EquipType.Type2Name2(arg_216_0)
			end)

			setText(arg_215_2, var_215_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_215_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_217_0, arg_217_1, arg_217_2)
			setText(arg_217_2, arg_217_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_218_0, arg_218_1, arg_218_2)
			setText(arg_218_2, arg_218_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_219_0, arg_219_1, arg_219_2, arg_219_3)
			local var_219_0 = WorldCollectionProxy.GetCollectionType(arg_219_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_219_2, i18n("world_" .. var_219_0 .. "_desc", arg_219_0:getConfig("name")))
			setText(arg_219_3, i18n("world_" .. var_219_0 .. "_name", arg_219_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_220_0, arg_220_1, arg_220_2)
			setText(arg_220_2, arg_220_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_221_0, arg_221_1, arg_221_2)
			setText(arg_221_2, arg_221_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_222_0, arg_222_1, arg_222_2)
			setText(arg_222_2, arg_222_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_223_0, arg_223_1, arg_223_2)
			local var_223_0 = string.gsub(arg_223_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_223_0.count))

			setText(arg_223_2, SwitchSpecialChar(var_223_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_224_0, arg_224_1, arg_224_2)
			setText(arg_224_2, arg_224_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_225_0, arg_225_1, arg_225_2)
			setText(arg_225_2, arg_225_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_226_0, arg_226_1, arg_226_2)
			setText(arg_226_2, arg_226_0:getConfig("desc"))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_227_0, arg_227_1, arg_227_2)
			setText(arg_227_2, arg_227_0:getConfig("display"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_228_0, arg_228_1, arg_228_2)
			setText(arg_228_2, arg_228_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_229_0, arg_229_1, arg_229_2)
			setText(arg_229_2, arg_229_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_230_0, arg_230_1, arg_230_2)
			setText(arg_230_2, "")
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_231_0, arg_231_1, arg_231_2)
			setText(arg_231_2, "")
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_232_0, arg_232_1, arg_232_2)
			setText(arg_232_2, "")
		end,
		[DROP_TYPE_ISLAND_DRESS] = function(arg_233_0, arg_233_1, arg_233_2)
			setText(arg_233_2, "")
		end,
		[DROP_TYPE_ISLAND_SKIN] = function(arg_234_0, arg_234_1, arg_234_2)
			setText(arg_234_2, "")
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_235_0, arg_235_1, arg_235_2)
		if arg_235_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_235_2, arg_235_0:getConfig("display"))
		else
			setText(arg_235_2, arg_235_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_236_0, arg_236_1, arg_236_2)
			if arg_236_0.id == PlayerConst.ResStoreGold or arg_236_0.id == PlayerConst.ResStoreOil then
				arg_236_2 = arg_236_2 or {}
				arg_236_2.frame = "frame_store"
			end

			updateItem(arg_236_1, Item.New({
				id = id2ItemId(arg_236_0.id)
			}), arg_236_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_237_0, arg_237_1, arg_237_2)
			updateItem(arg_237_1, arg_237_0:getSubClass(), arg_237_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_238_0, arg_238_1, arg_238_2)
			updateEquipment(arg_238_1, arg_238_0:getSubClass(), arg_238_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_239_0, arg_239_1, arg_239_2)
			updateShip(arg_239_1, arg_239_0.ship, arg_239_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_240_0, arg_240_1, arg_240_2)
			updateShip(arg_240_1, arg_240_0.ship, arg_240_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_241_0, arg_241_1, arg_241_2)
			updateFurniture(arg_241_1, arg_241_0, arg_241_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_242_0, arg_242_1, arg_242_2)
			arg_242_2.isWorldBuff = arg_242_0.isWorldBuff

			updateStrategy(arg_242_1, arg_242_0, arg_242_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_243_0, arg_243_1, arg_243_2)
			arg_243_2.isSkin = true
			arg_243_2.isNew = arg_243_0.isNew

			updateShip(arg_243_1, Ship.New({
				configId = tonumber(arg_243_0:getConfig("ship_group") .. "1"),
				skin_id = arg_243_0.id
			}), arg_243_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_244_0, arg_244_1, arg_244_2)
			local var_244_0 = setmetatable({
				count = arg_244_0.count
			}, {
				__index = arg_244_0:getConfigTable()
			})

			updateEquipmentSkin(arg_244_1, var_244_0, arg_244_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_245_0, arg_245_1, arg_245_2)
			updateItem(arg_245_1, Item.New({
				id = arg_245_0.id
			}), arg_245_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_246_0, arg_246_1, arg_246_2)
			updateWorldItem(arg_246_1, WorldItem.New({
				id = arg_246_0.id
			}), arg_246_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_247_0, arg_247_1, arg_247_2)
			updateWorldCollection(arg_247_1, arg_247_0, arg_247_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_248_0, arg_248_1, arg_248_2)
			updateAttire(arg_248_1, AttireConst.TYPE_CHAT_FRAME, arg_248_0:getConfigTable(), arg_248_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_249_0, arg_249_1, arg_249_2)
			updateAttire(arg_249_1, AttireConst.TYPE_ICON_FRAME, arg_249_0:getConfigTable(), arg_249_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_250_0, arg_250_1, arg_250_2)
			updateEmoji(arg_250_1, arg_250_0:getConfigTable(), arg_250_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_251_0, arg_251_1, arg_251_2)
			arg_251_2.count = 1

			updateItem(arg_251_1, arg_251_0:getSubClass(), arg_251_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_252_0, arg_252_1, arg_252_2)
			updateSpWeapon(arg_252_1, SpWeapon.New({
				id = arg_252_0.id
			}), arg_252_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_253_0, arg_253_1, arg_253_2)
			updateItem(arg_253_1, Item.New({
				id = arg_253_0:getConfig("id")
			}), arg_253_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_254_0, arg_254_1, arg_254_2)
			arg_254_2.isSkin = true
			arg_254_2.isTimeLimit = true
			arg_254_2.count = 1

			updateShip(arg_254_1, Ship.New({
				configId = tonumber(arg_254_0:getConfig("ship_group") .. "1"),
				skin_id = arg_254_0.id
			}), arg_254_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_255_0, arg_255_1, arg_255_2)
			AtelierMaterial.UpdateRyzaItem(arg_255_1, arg_255_0.item, arg_255_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_256_0, arg_256_1, arg_256_2)
			WorkBenchItem.UpdateDrop(arg_256_1, arg_256_0.item, arg_256_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_257_0, arg_257_1, arg_257_2)
			WorkBenchItem.UpdateDrop(arg_257_1, WorkBenchItem.New({
				configId = arg_257_0.id,
				count = arg_257_0.count
			}), arg_257_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_258_0, arg_258_1, arg_258_2)
			updateBuff(arg_258_1, arg_258_0.id, arg_258_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_259_0, arg_259_1, arg_259_2)
			updateCommander(arg_259_1, arg_259_0, arg_259_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_260_0, arg_260_1, arg_260_2)
			updateCover(arg_260_1, arg_260_0, arg_260_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_261_0, arg_261_1, arg_261_2)
			updateAttireCombatUI(arg_261_1, AttireConst.TYPE_ICON_FRAME, arg_261_0:getConfigTable(), arg_261_2)
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_262_0, arg_262_1, arg_262_2)
			updateActivityMedal(arg_262_1, arg_262_0:getConfigTable(), arg_262_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_263_0, arg_263_1, arg_263_2)
		updateDefaultIconTpl(arg_263_1, arg_263_0, arg_263_2)
	end

	var_0_0.UpdateCustomDropCase = {
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_264_0, arg_264_1, arg_264_2)
			updateDorm3dIcon(arg_264_1, arg_264_0, arg_264_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_265_0, arg_265_1, arg_265_2)
			updateDorm3dIcon(arg_265_1, arg_265_0, arg_265_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_266_0, arg_266_1, arg_266_2)
			updateDorm3dIcon(arg_266_1, arg_266_0, arg_266_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_267_0, arg_267_1, arg_267_2)
			updateIslandItem(arg_267_1, arg_267_0, arg_267_2)
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_268_0, arg_268_1, arg_268_2)
			updateIslandUnlock(arg_268_1, arg_268_0, arg_268_2)
		end,
		[DROP_TYPE_ISLAND_INVITATION] = function(arg_269_0, arg_269_1, arg_269_2)
			updateIslandInvitation(arg_269_1, arg_269_0, arg_269_2)
		end,
		[VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT] = function(arg_270_0, arg_270_1, arg_270_2)
			updateIslandSeasonPt(arg_270_1, arg_270_0, arg_270_2)
		end,
		[DROP_TYPE_ISLAND_COLLECTION] = function(arg_271_0, arg_271_1, arg_271_2)
			updateIslandWatherCollect(arg_271_1, arg_271_0, arg_271_2)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function(arg_272_0, arg_272_1, arg_272_2)
			updateIslandFurniture(arg_272_1, arg_272_0, arg_272_2)
		end,
		[DROP_TYPE_ISLAND_CARD_DIY] = function(arg_273_0, arg_273_1, arg_273_2)
			updateIslandCardDiy(arg_273_1, arg_273_0, arg_273_2)
		end,
		[DROP_TYPE_ISLAND_SPEEDUP_TICKET] = function(arg_274_0, arg_274_1, arg_274_2)
			updateIslandSpeedupTicket(arg_274_1, arg_274_0, arg_274_2)
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_275_0, arg_275_1, arg_275_2)
			updateItem(arg_275_1, Item.New({
				id = arg_275_0.id
			}), arg_275_2)
		end
	}

	function var_0_0.UpdateCustomDropDefault(arg_276_0, arg_276_1, arg_276_2)
		if arg_276_2.style == "dorm" then
			updateDorm3dIcon(arg_276_1, arg_276_0, arg_276_2)
		elseif arg_276_2.style == "island" then
			updateIslandDefaultIconTpl(arg_276_1, arg_276_0, arg_276_2)
		else
			warning(string.format("without dropType %d in updateCustomDrop", arg_276_0.type))
		end
	end
end

return var_0_0
