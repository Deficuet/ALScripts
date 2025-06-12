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
	if arg_7_0.type == DROP_TYPE_ICON_FRAME then
		return "Props/icon_frame"
	else
		return arg_7_0:getConfig("icon")
	end
end

function var_0_0.getCount(arg_8_0)
	if arg_8_0.type == DROP_TYPE_OPERATION or arg_8_0.type == DROP_TYPE_LOVE_LETTER then
		return 1
	else
		return arg_8_0.count
	end
end

function var_0_0.isLoveLetter(arg_9_0)
	return arg_9_0.type == DROP_TYPE_LOVE_LETTER or arg_9_0.type == DROP_TYPE_ITEM and arg_9_0:getConfig("type") == Item.LOVE_LETTER_TYPE
end

function var_0_0.getOwnedCount(arg_10_0)
	return switch(arg_10_0.type, var_0_0.CountCase, var_0_0.CountDefault, arg_10_0)
end

function var_0_0.getSubClass(arg_11_0)
	return switch(arg_11_0.type, var_0_0.SubClassCase, var_0_0.SubClassDefault, arg_11_0)
end

function var_0_0.getDropRarity(arg_12_0)
	return switch(arg_12_0.type, var_0_0.RarityCase, var_0_0.RarityDefault, arg_12_0)
end

function var_0_0.getDropRarityDorm(arg_13_0)
	return switch(arg_13_0.type, var_0_0.RarityCase, var_0_0.RarityDefaultDorm, arg_13_0)
end

function var_0_0.DropTrans(arg_14_0, ...)
	return switch(arg_14_0.type, var_0_0.TransCase, var_0_0.TransDefault, arg_14_0, ...)
end

function var_0_0.AddItemOperation(arg_15_0)
	return switch(arg_15_0.type, var_0_0.AddItemCase, var_0_0.AddItemDefault, arg_15_0)
end

function var_0_0.MsgboxIntroSet(arg_16_0, ...)
	return switch(arg_16_0.type, var_0_0.MsgboxIntroCase, var_0_0.MsgboxIntroDefault, arg_16_0, ...)
end

function var_0_0.UpdateDropTpl(arg_17_0, ...)
	return switch(arg_17_0.type, var_0_0.UpdateDropCase, var_0_0.UpdateDropDefault, arg_17_0, ...)
end

function var_0_0.InitSwitch()
	var_0_0.inited = true
	var_0_0.ConfigCase = {
		[DROP_TYPE_RESOURCE] = function(arg_19_0)
			local var_19_0 = Item.getConfigData(id2ItemId(arg_19_0.id))

			arg_19_0.desc = var_19_0.display

			return var_19_0
		end,
		[DROP_TYPE_ITEM] = function(arg_20_0)
			local var_20_0 = Item.getConfigData(arg_20_0.id)

			arg_20_0.desc = var_20_0.display

			if var_20_0.type == Item.LOVE_LETTER_TYPE then
				arg_20_0.desc = string.gsub(arg_20_0.desc, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_20_0.extra))
			end

			return var_20_0
		end,
		[DROP_TYPE_VITEM] = function(arg_21_0)
			local var_21_0 = Item.getConfigData(arg_21_0.id)

			assert(var_21_0, arg_21_0.id)

			arg_21_0.desc = var_21_0.display

			return var_21_0
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_22_0)
			local var_22_0 = Item.getConfigData(arg_22_0.id)

			arg_22_0.desc = string.gsub(var_22_0.display, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_22_0.count))

			return var_22_0
		end,
		[DROP_TYPE_EQUIP] = function(arg_23_0)
			local var_23_0 = Equipment.getConfigData(arg_23_0.id)

			arg_23_0.desc = var_23_0.descrip

			return var_23_0
		end,
		[DROP_TYPE_SHIP] = function(arg_24_0)
			local var_24_0 = pg.ship_data_statistics[arg_24_0.id]
			local var_24_1, var_24_2, var_24_3 = ShipWordHelper.GetWordAndCV(var_24_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_24_0.desc = var_24_3 or i18n("ship_drop_desc_default")
			arg_24_0.ship = Ship.New({
				configId = arg_24_0.id,
				skin_id = arg_24_0.skinId,
				propose = arg_24_0.propose
			})
			arg_24_0.ship.remoulded = arg_24_0.remoulded
			arg_24_0.ship.virgin = arg_24_0.virgin

			return var_24_0
		end,
		[DROP_TYPE_FURNITURE] = function(arg_25_0)
			local var_25_0 = pg.furniture_data_template[arg_25_0.id]

			arg_25_0.desc = var_25_0.describe

			return var_25_0
		end,
		[DROP_TYPE_SKIN] = function(arg_26_0)
			local var_26_0 = pg.ship_skin_template[arg_26_0.id]

			if var_26_0.skin_type == ShipSkin.SKIN_TYPE_TB then
				local var_26_1, var_26_2, var_26_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_26_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_26_0.desc = var_26_3
			else
				local var_26_4, var_26_5, var_26_6 = ShipWordHelper.GetWordAndCV(arg_26_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_26_0.desc = var_26_6
			end

			return var_26_0
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_27_0)
			local var_27_0 = pg.ship_skin_template[arg_27_0.id]

			if var_27_0.skin_type == ShipSKin.SKIN_TYPE_TB then
				local var_27_1, var_27_2, var_27_3 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_27_0.id), EducateCharWordHelper.WORD_KEY_LOGIN)

				arg_27_0.desc = var_27_3
			else
				local var_27_4, var_27_5, var_27_6 = ShipWordHelper.GetWordAndCV(arg_27_0.id, ShipWordHelper.WORD_TYPE_DROP)

				arg_27_0.desc = var_27_6
			end

			return var_27_0
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_28_0)
			local var_28_0 = pg.equip_skin_template[arg_28_0.id]

			arg_28_0.desc = var_28_0.desc

			return var_28_0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_29_0)
			local var_29_0 = pg.world_item_data_template[arg_29_0.id]

			arg_29_0.desc = var_29_0.display

			return var_29_0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_30_0)
			local var_30_0 = pg.item_data_frame[arg_30_0.id]

			arg_30_0.desc = var_30_0.desc

			return var_30_0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_31_0)
			return pg.item_data_chat[arg_31_0.id]
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_32_0)
			local var_32_0 = pg.spweapon_data_statistics[arg_32_0.id]

			arg_32_0.desc = var_32_0.descrip

			return var_32_0
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_33_0)
			local var_33_0 = pg.activity_ryza_item[arg_33_0.id]

			arg_33_0.item = AtelierMaterial.New({
				configId = arg_33_0.id
			})
			arg_33_0.desc = arg_33_0.item:GetDesc()

			return var_33_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_34_0)
			arg_34_0.ship = getProxy(BayProxy):getShipById(arg_34_0.count)

			local var_34_0 = pg.ship_data_statistics[arg_34_0.ship.configId]
			local var_34_1, var_34_2, var_34_3 = ShipWordHelper.GetWordAndCV(var_34_0.skin_id, ShipWordHelper.WORD_TYPE_DROP)

			arg_34_0.desc = var_34_3 or i18n("ship_drop_desc_default")

			return var_34_0
		end,
		[DROP_TYPE_STRATEGY] = function(arg_35_0)
			return arg_35_0.isWorldBuff and pg.world_SLGbuff_data[arg_35_0.id] or pg.strategy_data_template[arg_35_0.id]
		end,
		[DROP_TYPE_EMOJI] = function(arg_36_0)
			local var_36_0 = pg.emoji_template[arg_36_0.id]

			arg_36_0.name = var_36_0.item_name
			arg_36_0.desc = var_36_0.item_desc

			return var_36_0
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_37_0)
			local var_37_0 = WorldCollectionProxy.GetCollectionTemplate(arg_37_0.id)

			arg_37_0.desc = var_37_0.name

			return var_37_0
		end,
		[DROP_TYPE_META_PT] = function(arg_38_0)
			local var_38_0 = pg.ship_strengthen_meta[arg_38_0.id]
			local var_38_1 = Item.getConfigData(var_38_0.itemid)

			arg_38_0.desc = var_38_1.display

			return var_38_1
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_39_0)
			local var_39_0 = pg.activity_workbench_item[arg_39_0.id]

			arg_39_0.item = WorkBenchItem.New({
				configId = arg_39_0.id
			})
			arg_39_0.desc = arg_39_0.item:GetDesc()

			return var_39_0
		end,
		[DROP_TYPE_BUFF] = function(arg_40_0)
			local var_40_0 = pg.benefit_buff_template[arg_40_0.id]

			arg_40_0.desc = var_40_0.desc

			return var_40_0
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_41_0)
			local var_41_0 = pg.commander_data_template[arg_41_0.id]

			arg_41_0.desc = var_41_0.desc

			return var_41_0
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_42_0)
			local var_42_0 = pg.island_item_data_template[arg_42_0.id]

			arg_42_0.desc = ""

			return var_42_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_43_0)
			local var_43_0 = pg.island_ability_template[arg_43_0.id]

			arg_43_0.desc = ""

			return var_43_0
		end,
		[DROP_TYPE_TRANS_ITEM] = function(arg_44_0)
			return pg.drop_data_restore[arg_44_0.id]
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_45_0)
			local var_45_0 = pg.dorm3d_furniture_template[arg_45_0.id]

			arg_45_0.desc = var_45_0.desc

			return var_45_0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_46_0)
			local var_46_0 = pg.dorm3d_gift[arg_46_0.id]

			arg_46_0.desc = var_46_0.display

			return var_46_0
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_47_0)
			local var_47_0 = pg.dorm3d_resource[arg_47_0.id]

			arg_47_0.desc = ""

			return var_47_0
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_48_0)
			local var_48_0 = pg.livingarea_cover[arg_48_0.id]

			arg_48_0.desc = var_48_0.desc

			return var_48_0
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_49_0)
			return pg.item_data_battleui[arg_49_0.id]
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_50_0)
			local var_50_0 = pg.activity_medal_template[arg_50_0.id].item

			return pg.item_virtual_data_statistics[var_50_0]
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_51_0)
			local var_51_0 = Item.getConfigData(arg_51_0.id)

			assert(var_51_0, arg_51_0.id)

			arg_51_0.desc = var_51_0.display

			return var_51_0
		end
	}

	function var_0_0.ConfigDefault(arg_52_0)
		local var_52_0 = arg_52_0.type

		if var_52_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_52_1 = pg.activity_drop_type[var_52_0].relevance

			return var_52_1 and pg[var_52_1][arg_52_0.id]
		end
	end

	var_0_0.CountCase = {
		[DROP_TYPE_RESOURCE] = function(arg_53_0)
			return getProxy(PlayerProxy):getRawData():getResById(arg_53_0.id), true
		end,
		[DROP_TYPE_ITEM] = function(arg_54_0)
			local var_54_0 = getProxy(BagProxy):getItemCountById(arg_54_0.id)

			if arg_54_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				return math.min(var_54_0, 1), true
			else
				return var_54_0, true
			end
		end,
		[DROP_TYPE_EQUIP] = function(arg_55_0)
			local var_55_0 = arg_55_0:getConfig("group")

			assert(pg.equip_data_template.get_id_list_by_group[var_55_0], "equip groupId not exist")

			local var_55_1 = pg.equip_data_template.get_id_list_by_group[var_55_0]

			return underscore.reduce(var_55_1, 0, function(arg_56_0, arg_56_1)
				local var_56_0 = getProxy(EquipmentProxy):getEquipmentById(arg_56_1)

				return arg_56_0 + (var_56_0 and var_56_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_56_1)
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_57_0)
			return getProxy(BayProxy):getConfigShipCount(arg_57_0.id)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_58_0)
			return getProxy(DormProxy):getRawData():GetOwnFurnitureCount(arg_58_0.id)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_59_0)
			return arg_59_0.count, tobool(arg_59_0.count)
		end,
		[DROP_TYPE_SKIN] = function(arg_60_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_60_0.id)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_61_0)
			return getProxy(ShipSkinProxy):getSkinCountById(arg_61_0.id)
		end,
		[DROP_TYPE_VITEM] = function(arg_62_0)
			if arg_62_0:getConfig("virtual_type") == 22 then
				local var_62_0 = getProxy(ActivityProxy):getActivityById(arg_62_0:getConfig("link_id"))

				return var_62_0 and var_62_0.data1 or 0, true
			end
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_63_0)
			local var_63_0 = getProxy(EquipmentProxy):getEquipmnentSkinById(arg_63_0.id)

			return (var_63_0 and var_63_0.count or 0) + getProxy(BayProxy):GetEquipSkinCountInShips(arg_63_0.id)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_64_0)
			local var_64_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_64_0.type].activity_id):GetItemById(arg_64_0.id)

			return var_64_0 and var_64_0.count or 0
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_65_0)
			local var_65_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_ICON_FRAME, arg_65_0.id)

			return var_65_0 and (not var_65_0:expiredType() or not not var_65_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_66_0)
			local var_66_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_CHAT_FRAME, arg_66_0.id)

			return var_66_0 and (not var_66_0:expiredType() or not not var_66_0:isExpired()) and 1 or 0
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_67_0)
			local var_67_0 = nowWorld()

			if var_67_0.type ~= World.TypeFull then
				assert(false)

				return 0, false
			else
				return var_67_0:GetInventoryProxy():GetItemCount(arg_67_0.id), false
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_68_0)
			return getProxy(CommanderProxy):GetSameConfigIdCommanderCount(arg_68_0.id)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_69_0)
			local var_69_0 = getProxy(LivingAreaCoverProxy):GetCover(arg_69_0.id)

			return var_69_0 and var_69_0:IsUnlock() and 1 or 0
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_70_0)
			return getProxy(ApartmentProxy):getGiftCount(arg_70_0.id), true
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_71_0)
			local var_71_0 = getProxy(AttireProxy):getAttireFrame(AttireConst.TYPE_COMBAT_UI_STYLE, arg_71_0.id)

			return 1
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = getProxy(IslandProxy):GetIsland()

			if var_72_1 then
				var_72_0 = var_72_1:GetInventoryAgency():GetOwnCount(arg_72_0.id)
			end

			return var_72_0
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_73_0)
			return 0
		end
	}

	function var_0_0.CountDefault(arg_74_0)
		local var_74_0 = arg_74_0.type

		if var_74_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			return getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[var_74_0].activity_id):getVitemNumber(arg_74_0.id)
		else
			return 0, false
		end
	end

	var_0_0.SubClassCase = {
		[DROP_TYPE_RESOURCE] = function(arg_75_0)
			return
		end,
		[DROP_TYPE_ITEM] = function(arg_76_0)
			return Item.New(arg_76_0)
		end,
		[DROP_TYPE_VITEM] = function(arg_77_0)
			return Item.New(arg_77_0)
		end,
		[DROP_TYPE_EQUIP] = function(arg_78_0)
			return Equipment.New(arg_78_0)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_79_0)
			return Item.New({
				count = 1,
				id = arg_79_0.id,
				extra = arg_79_0.count
			})
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_80_0)
			return WorldItem.New(arg_80_0)
		end
	}

	function var_0_0.SubClassDefault(arg_81_0)
		assert(false, string.format("drop type %d without subClass", arg_81_0.type))
	end

	var_0_0.RarityCase = {
		[DROP_TYPE_RESOURCE] = function(arg_82_0)
			return arg_82_0:getConfig("rarity")
		end,
		[DROP_TYPE_ITEM] = function(arg_83_0)
			return arg_83_0:getConfig("rarity")
		end,
		[DROP_TYPE_EQUIP] = function(arg_84_0)
			return arg_84_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_SHIP] = function(arg_85_0)
			return arg_85_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_FURNITURE] = function(arg_86_0)
			return arg_86_0:getConfig("rarity")
		end,
		[DROP_TYPE_SKIN] = function(arg_87_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_88_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_VITEM] = function(arg_89_0)
			return arg_89_0:getConfig("rarity")
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_90_0)
			return arg_90_0:getConfig("rarity")
		end,
		[DROP_TYPE_BUFF] = function(arg_91_0)
			return ItemRarity.Purple
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_92_0)
			return arg_92_0:getConfig("rarity") - 1
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_93_0)
			return arg_93_0:getConfig("rarity")
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_94_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_95_0)
			return ItemRarity.Gold
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_96_0)
			return arg_96_0:getConfig("rare")
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_97_0)
			return arg_97_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_98_0)
			return arg_98_0:getConfig("rarity")
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_99_0)
			return ItemRarity.Gold
		end
	}

	function var_0_0.RarityDefault(arg_100_0)
		return arg_100_0:getConfig("rarity") or ItemRarity.Gray
	end

	function var_0_0.RarityDefaultDorm(arg_101_0)
		return arg_101_0:getConfig("rarity") or ItemRarity.Purple
	end

	var_0_0.TransCase = {
		[DROP_TYPE_TRANS_ITEM] = function(arg_102_0)
			local var_102_0 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = arg_102_0:getConfig("resource_type"),
				count = arg_102_0:getConfig("resource_num") * arg_102_0.count
			})
			local var_102_1 = Drop.New({
				type = arg_102_0:getConfig("target_type"),
				id = arg_102_0:getConfig("target_id")
			})

			var_102_0.name = string.format("%s(%s)", var_102_0:getName(), var_102_1:getName())

			return var_102_0
		end,
		[DROP_TYPE_RESOURCE] = function(arg_103_0)
			for iter_103_0, iter_103_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)) do
				if pg.battlepass_event_pt[iter_103_1.id].pt == arg_103_0.id then
					return nil, arg_103_0
				end
			end

			return arg_103_0
		end,
		[DROP_TYPE_OPERATION] = function(arg_104_0)
			if arg_104_0.id ~= 3 then
				return nil
			end

			return arg_104_0
		end,
		[DROP_TYPE_EMOJI] = function(arg_105_0)
			return nil, arg_105_0
		end,
		[DROP_TYPE_VITEM] = function(arg_106_0, arg_106_1, arg_106_2)
			assert(arg_106_0:getConfig("type") == 0, "item type error:must be virtual type from " .. arg_106_0.id)

			return switch(arg_106_0:getConfig("virtual_type"), {
				function()
					if arg_106_0:getConfig("link_id") == ActivityConst.LINLK_DUNHUANG_ACT then
						return nil, arg_106_0
					end

					return arg_106_0
				end,
				[6] = function()
					local var_108_0 = arg_106_2.taskId
					local var_108_1 = getProxy(ActivityProxy)
					local var_108_2 = var_108_1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_108_2 then
						local var_108_3 = var_108_2.data1KeyValueList[1]

						var_108_3[var_108_0] = defaultValue(var_108_3[var_108_0], 0) + arg_106_0.count

						var_108_1:updateActivity(var_108_2)
					end

					return nil, arg_106_0
				end,
				[13] = function()
					local var_109_0 = arg_106_0:getName()

					if not SkinCouponActivity.StaticExistActivity() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_timeout_tip", var_109_0))

						return nil
					elseif SkinCouponActivity.StaticOwnMaxCntSkinCoupon() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("coupon_repeat_tip", var_109_0))

						return nil
					else
						return arg_106_0, nil
					end
				end,
				[21] = function()
					return nil, arg_106_0
				end,
				[28] = function()
					local var_111_0 = Drop.New({
						type = arg_106_0.type,
						id = arg_106_0.id,
						count = math.floor(arg_106_0.count / 1000)
					})
					local var_111_1 = Drop.New({
						type = arg_106_0.type,
						id = arg_106_0.id,
						count = arg_106_0.count - math.floor(arg_106_0.count / 1000)
					})

					return var_111_0, var_111_1
				end
			}, function()
				return arg_106_0
			end)
		end,
		[DROP_TYPE_SHIP] = function(arg_113_0, arg_113_1)
			if Ship.isMetaShipByConfigID(arg_113_0.id) and Player.isMetaShipNeedToTrans(arg_113_0.id) then
				local var_113_0 = table.indexof(arg_113_1, arg_113_0.id, 1)

				if var_113_0 then
					table.remove(arg_113_1, var_113_0)
				else
					local var_113_1 = Player.metaShip2Res(arg_113_0.id)
					local var_113_2 = Drop.New(var_113_1[1])

					getProxy(BayProxy):addMetaTransItemMap(arg_113_0.id, var_113_2)

					return arg_113_0, var_113_2
				end
			end

			return arg_113_0
		end,
		[DROP_TYPE_SKIN] = function(arg_114_0)
			arg_114_0.isNew = not getProxy(ShipSkinProxy):hasOldNonLimitSkin(arg_114_0.id)

			return arg_114_0
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_115_0)
			local var_115_0 = getProxy(PlayerProxy):getRawData()
			local var_115_1 = pg.TimeMgr.GetInstance():GetServerTime()

			var_115_0:updateMedalList({
				{
					key = arg_115_0.id,
					value = var_115_1
				}
			})

			return arg_115_0
		end
	}

	function var_0_0.TransDefault(arg_116_0)
		return arg_116_0
	end

	var_0_0.AddItemCase = {
		[DROP_TYPE_RESOURCE] = function(arg_117_0)
			local var_117_0 = id2res(arg_117_0.id)

			assert(var_117_0, "res should be defined: " .. arg_117_0.id)

			local var_117_1 = getProxy(PlayerProxy)
			local var_117_2 = var_117_1:getData()

			var_117_2:addResources({
				[var_117_0] = arg_117_0.count
			})
			var_117_1:updatePlayer(var_117_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_118_0)
			if arg_118_0:getConfig("type") == Item.EXP_BOOK_TYPE then
				local var_118_0 = getProxy(BagProxy):getItemCountById(arg_118_0.id)
				local var_118_1 = math.min(arg_118_0:getConfig("max_num") - var_118_0, arg_118_0.count)

				if var_118_1 > 0 then
					getProxy(BagProxy):addItemById(arg_118_0.id, var_118_1)
				end
			else
				getProxy(BagProxy):addItemById(arg_118_0.id, arg_118_0.count, arg_118_0.extra)
			end
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_119_0)
			local var_119_0 = arg_119_0:getSubClass()

			getProxy(BagProxy):addItemById(var_119_0.id, var_119_0.count, var_119_0.extra)
		end,
		[DROP_TYPE_EQUIP] = function(arg_120_0)
			getProxy(EquipmentProxy):addEquipmentById(arg_120_0.id, arg_120_0.count)
		end,
		[DROP_TYPE_SHIP] = function(arg_121_0)
			return
		end,
		[DROP_TYPE_FURNITURE] = function(arg_122_0)
			local var_122_0 = getProxy(DormProxy)
			local var_122_1 = Furniture.New({
				id = arg_122_0.id,
				count = arg_122_0.count
			})

			if var_122_1:isRecordTime() then
				var_122_1.date = pg.TimeMgr.GetInstance():GetServerTime()
			end

			var_122_0:AddFurniture(var_122_1)
		end,
		[DROP_TYPE_SKIN] = function(arg_123_0)
			local var_123_0 = getProxy(ShipSkinProxy)
			local var_123_1 = ShipSkin.New({
				id = arg_123_0.id
			})

			var_123_0:addSkin(var_123_1)
		end,
		[DROP_TYPE_VITEM] = function(arg_124_0)
			arg_124_0 = arg_124_0:getSubClass()

			assert(arg_124_0:isVirtualItem(), "item type error(virtual item)>>" .. arg_124_0.id)
			switch(arg_124_0:getConfig("virtual_type"), {
				[0] = function()
					getProxy(ActivityProxy):addVitemById(arg_124_0.id, arg_124_0.count)
				end,
				function()
					local var_126_0 = getProxy(ActivityProxy)
					local var_126_1 = arg_124_0:getConfig("link_id")
					local var_126_2

					if var_126_1 > 0 then
						var_126_2 = var_126_0:getActivityById(var_126_1)
					else
						var_126_2 = var_126_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)
					end

					if var_126_2 and not var_126_2:isEnd() then
						if not table.contains(var_126_2.data1_list, arg_124_0.id) then
							table.insert(var_126_2.data1_list, arg_124_0.id)
						end

						var_126_0:updateActivity(var_126_2)
					end
				end,
				function()
					local var_127_0 = getProxy(ActivityProxy)
					local var_127_1 = var_127_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_VOTE)

					for iter_127_0, iter_127_1 in ipairs(var_127_1) do
						iter_127_1.data1 = iter_127_1.data1 + arg_124_0.count

						local var_127_2 = iter_127_1:getConfig("config_id")
						local var_127_3 = pg.activity_vote[var_127_2]

						if var_127_3 and var_127_3.ticket_id_period == arg_124_0.id then
							iter_127_1.data3 = iter_127_1.data3 + arg_124_0.count
						end

						var_127_0:updateActivity(iter_127_1)
						pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_VOTE, {
							ptId = arg_124_0.id,
							ptCount = arg_124_0.count
						})
					end
				end,
				[4] = function()
					local var_128_0 = getProxy(ColoringProxy):getColorItems()

					var_128_0[arg_124_0.id] = (var_128_0[arg_124_0.id] or 0) + arg_124_0.count
				end,
				[6] = function()
					local var_129_0 = getProxy(ActivityProxy)
					local var_129_1 = var_129_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

					if var_129_1 then
						var_129_1.data3 = var_129_1.data3 + arg_124_0.count

						var_129_0:updateActivity(var_129_1)
					end
				end,
				[7] = function()
					local var_130_0 = getProxy(ChapterProxy)

					var_130_0:updateRemasterTicketsNum(math.min(var_130_0.remasterTickets + arg_124_0.count, pg.gameset.reactivity_ticket_max.key_value))
				end,
				[9] = function()
					local var_131_0 = getProxy(ActivityProxy)
					local var_131_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

					if var_131_1 then
						var_131_1.data1_list[1] = var_131_1.data1_list[1] + arg_124_0.count

						var_131_0:updateActivity(var_131_1)
					end
				end,
				[11] = function()
					local var_132_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)

					if var_132_0 and not var_132_0:isEnd() then
						var_132_0.data1 = var_132_0.data1 + arg_124_0.count
					end
				end,
				[12] = function()
					local var_133_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF)

					if var_133_0 and not var_133_0:isEnd() then
						var_133_0.data1KeyValueList[1][arg_124_0.id] = (var_133_0.data1KeyValueList[1][arg_124_0.id] or 0) + arg_124_0.count
					end
				end,
				[13] = function()
					SkinCouponActivity.AddSkinCoupon(arg_124_0.id, arg_124_0.count)
				end,
				[14] = function()
					local var_135_0 = nowWorld():GetBossProxy()

					if WorldBossConst.WORLD_BOSS_ITEM_ID == arg_124_0.id then
						var_135_0:AddSummonPt(arg_124_0.count)
					elseif WorldBossConst.WORLD_PAST_BOSS_ITEM_ID == arg_124_0.id then
						var_135_0:AddSummonPtOld(arg_124_0.count)
					end
				end,
				[15] = function()
					local var_136_0 = getProxy(ActivityProxy)
					local var_136_1 = var_136_0:getActivityById(arg_124_0:getConfig("link_id"))

					if not var_136_1 or var_136_1:isEnd() then
						return
					end

					if var_136_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE then
						local var_136_2 = pg.activity_event_grid[var_136_1.data1]

						if arg_124_0.id == var_136_2.ticket_item then
							var_136_1.data2 = var_136_1.data2 + arg_124_0.count
						elseif arg_124_0.id == var_136_2.explore_item then
							var_136_1.data3 = var_136_1.data3 + arg_124_0.count
						end
					elseif var_136_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_EXPEDITION then
						var_136_1.data3 = var_136_1.data3 + arg_124_0.count
					end

					var_136_0:updateActivity(var_136_1)
				end,
				[16] = function()
					local var_137_0 = getProxy(ActivityProxy)
					local var_137_1 = var_137_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHAKE_BEADS)

					for iter_137_0, iter_137_1 in pairs(var_137_1) do
						if iter_137_1 and not iter_137_1:isEnd() and arg_124_0.id == iter_137_1:getConfig("config_id") then
							iter_137_1.data1 = iter_137_1.data1 + arg_124_0.count

							var_137_0:updateActivity(iter_137_1)
						end
					end
				end,
				[20] = function()
					local var_138_0 = getProxy(BagProxy)
					local var_138_1 = pg.gameset.urpt_chapter_max.description
					local var_138_2 = var_138_1[1]
					local var_138_3 = var_138_1[2]
					local var_138_4 = var_138_0:GetLimitCntById(var_138_2)
					local var_138_5 = math.min(var_138_3 - var_138_4, arg_124_0.count)

					if var_138_5 > 0 then
						var_138_0:addItemById(var_138_2, var_138_5)
						var_138_0:AddLimitCnt(var_138_2, var_138_5)
					end
				end,
				[21] = function()
					local var_139_0 = getProxy(ActivityProxy)
					local var_139_1 = var_139_0:getActivityById(arg_124_0:getConfig("link_id"))

					if var_139_1 and not var_139_1:isEnd() then
						var_139_1.data2 = 1

						var_139_0:updateActivity(var_139_1)
					end
				end,
				[22] = function()
					local var_140_0 = getProxy(ActivityProxy)
					local var_140_1 = var_140_0:getActivityById(arg_124_0:getConfig("link_id"))

					if var_140_1 and not var_140_1:isEnd() then
						var_140_1.data1 = var_140_1.data1 + arg_124_0.count

						var_140_0:updateActivity(var_140_1)
					end
				end,
				[23] = function()
					local var_141_0 = (function()
						for iter_142_0, iter_142_1 in ipairs(pg.gameset.package_lv.description) do
							if arg_124_0.id == iter_142_1[1] then
								return iter_142_1[2]
							end
						end
					end)()

					assert(var_141_0)

					local var_141_1 = getProxy(PlayerProxy)
					local var_141_2 = var_141_1:getData()

					var_141_2:addExpToLevel(var_141_0)
					var_141_1:updatePlayer(var_141_2)
				end,
				[24] = function()
					local var_143_0 = arg_124_0:getConfig("link_id")
					local var_143_1 = getProxy(ActivityProxy):getActivityById(var_143_0)

					if var_143_1 and not var_143_1:isEnd() and var_143_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
						var_143_1.data2 = var_143_1.data2 + arg_124_0.count

						getProxy(ActivityProxy):updateActivity(var_143_1)
					end
				end,
				[25] = function()
					local var_144_0 = getProxy(ActivityProxy)
					local var_144_1 = var_144_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_FIREWORK)

					if var_144_1 and not var_144_1:isEnd() then
						var_144_1.data1 = var_144_1.data1 - 1

						if not table.contains(var_144_1.data1_list, arg_124_0.id) then
							table.insert(var_144_1.data1_list, arg_124_0.id)
						end

						var_144_0:updateActivity(var_144_1)

						local var_144_2 = arg_124_0:getConfig("link_id")

						if var_144_2 > 0 then
							local var_144_3 = var_144_0:getActivityById(var_144_2)

							if var_144_3 and not var_144_3:isEnd() then
								var_144_3.data1 = var_144_3.data1 + 1

								var_144_0:updateActivity(var_144_3)
							end
						end
					end
				end,
				[50] = function()
					local var_145_0 = getProxy(IslandProxy):GetIsland()

					if var_145_0 then
						var_145_0:AddExp(arg_124_0.count)
					end
				end,
				[51] = function()
					local var_146_0 = getProxy(IslandProxy):GetIsland()

					if not var_146_0 then
						return
					end

					local var_146_1 = var_146_0:GetOrderAgency()

					if not var_146_1 then
						return
					end

					var_146_1:AddExp(arg_124_0.count)
				end,
				[26] = function()
					local var_147_0 = getProxy(ActivityProxy)
					local var_147_1 = Clone(var_147_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING))

					if var_147_1 and not var_147_1:isEnd() then
						var_147_1.data1 = var_147_1.data1 + arg_124_0.count

						var_147_0:updateActivity(var_147_1)
					end
				end,
				[27] = function()
					local var_148_0 = getProxy(ActivityProxy)
					local var_148_1 = Clone(var_148_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_148_1 and not var_148_1:isEnd() then
						var_148_1:AddExp(arg_124_0.count)
						var_148_0:updateActivity(var_148_1)
					end
				end,
				[28] = function()
					local var_149_0 = getProxy(ActivityProxy)
					local var_149_1 = Clone(var_149_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN))

					if var_149_1 and not var_149_1:isEnd() then
						var_149_1:AddGold(arg_124_0.count)
						var_149_0:updateActivity(var_149_1)
					end
				end,
				[99] = function()
					return
				end,
				[100] = function()
					return
				end,
				[101] = function()
					local var_152_0 = arg_124_0:getConfig("link_id")
					local var_152_1 = getProxy(ActivityProxy):getActivityById(var_152_0)

					if var_152_1 and not var_152_1:isEnd() then
						var_152_1.data1 = var_152_1.data1 + arg_124_0.count

						getProxy(ActivityProxy):updateActivity(var_152_1)
					end
				end
			})
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_153_0)
			getProxy(EquipmentProxy):addEquipmentSkin(arg_153_0.id, arg_153_0.count)
		end,
		[DROP_TYPE_OPERATION] = function(arg_154_0)
			local var_154_0 = getProxy(BayProxy)
			local var_154_1 = var_154_0:getShipById(arg_154_0.count)

			if var_154_1 then
				var_154_1:unlockActivityNpc(0)
				var_154_0:updateShip(var_154_1)
				getProxy(CollectionProxy):flushCollection(var_154_1)
			end
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_155_0)
			nowWorld():GetInventoryProxy():AddItem(arg_155_0.id, arg_155_0.count)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_156_0)
			local var_156_0 = getProxy(AttireProxy)
			local var_156_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_156_2 = IconFrame.New({
				id = arg_156_0.id
			})
			local var_156_3 = var_156_1 + var_156_2:getConfig("time_second")

			var_156_2:updateData({
				isNew = true,
				end_time = var_156_3
			})
			var_156_0:addAttireFrame(var_156_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_156_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_157_0)
			local var_157_0 = getProxy(AttireProxy)
			local var_157_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_157_2 = ChatFrame.New({
				id = arg_157_0.id
			})
			local var_157_3 = var_157_1 + var_157_2:getConfig("time_second")

			var_157_2:updateData({
				isNew = true,
				end_time = var_157_3
			})
			var_157_0:addAttireFrame(var_157_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, var_157_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_158_0)
			getProxy(EmojiProxy):addNewEmojiID(arg_158_0.id)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_EMOJI, arg_158_0:getConfigTable())
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_159_0)
			nowWorld():GetCollectionProxy():Unlock(arg_159_0.id)
		end,
		[DROP_TYPE_META_PT] = function(arg_160_0)
			getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_160_0.id):addPT(arg_160_0.count)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_161_0)
			local var_161_0 = arg_161_0.id
			local var_161_1 = arg_161_0.count
			local var_161_2 = getProxy(ShipSkinProxy)
			local var_161_3 = var_161_2:getSkinById(var_161_0)

			if var_161_3 and var_161_3:isExpireType() then
				local var_161_4 = var_161_1 + var_161_3.endTime
				local var_161_5 = ShipSkin.New({
					id = var_161_0,
					end_time = var_161_4
				})

				var_161_2:addSkin(var_161_5)
			elseif not var_161_3 then
				local var_161_6 = var_161_1 + pg.TimeMgr.GetInstance():GetServerTime()
				local var_161_7 = ShipSkin.New({
					id = var_161_0,
					end_time = var_161_6
				})

				var_161_2:addSkin(var_161_7)
			end
		end,
		[DROP_TYPE_BUFF] = function(arg_162_0)
			local var_162_0 = arg_162_0.id
			local var_162_1 = pg.benefit_buff_template[var_162_0]

			assert(var_162_1 and var_162_1.act_id > 0, "should exist act id")

			local var_162_2 = getProxy(ActivityProxy):getActivityById(var_162_1.act_id)

			if var_162_2 and not var_162_2:isEnd() then
				local var_162_3 = var_162_1.max_time
				local var_162_4 = pg.TimeMgr.GetInstance():GetServerTime() + var_162_3

				var_162_2:AddBuff(ActivityBuff.New(var_162_2.id, var_162_0, var_162_4))
				getProxy(ActivityProxy):updateActivity(var_162_2)
			end
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_163_0)
			return
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_164_0)
			getProxy(ApartmentProxy):ModifyRoom(arg_164_0:getConfig("room_id"), function(arg_165_0)
				arg_165_0:AddFurnitureByID(arg_164_0.id)
			end)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_166_0)
			getProxy(ApartmentProxy):changeGiftCount(arg_166_0.id, arg_166_0.count)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_167_0)
			getProxy(ApartmentProxy):ModifyApartment(arg_167_0:getConfig("ship_group"), function(arg_168_0)
				arg_168_0:addSkin(arg_167_0.id)
			end)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_169_0)
			local var_169_0 = getProxy(LivingAreaCoverProxy)
			local var_169_1 = LivingAreaCover.New({
				unlock = true,
				isNew = true,
				id = arg_169_0.id
			})

			var_169_0:UpdateCover(var_169_1)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COVER, var_169_1)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCover(arg_169_0.id, 1))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_170_0)
			local var_170_0 = getProxy(AttireProxy)
			local var_170_1 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_170_2 = CombatUIStyle.New({
				id = arg_170_0.id
			})

			var_170_2:setUnlock()
			var_170_2:setNew()
			var_170_0:addAttireFrame(var_170_2)
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_COMBAT_UI, var_170_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_171_0)
			getProxy(IslandProxy):GetIsland():GetInventoryAgency():AddItem(IslandItem.New({
				id = arg_171_0.id,
				num = arg_171_0.count
			}))
		end
	}

	function var_0_0.AddItemDefault(arg_172_0)
		if arg_172_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_172_0 = getProxy(ActivityProxy):getActivityById(pg.activity_drop_type[arg_172_0.type].activity_id)

			if arg_172_0.type == DROP_TYPE_RYZA_DROP then
				if var_172_0 and not var_172_0:isEnd() then
					var_172_0:AddItem(AtelierMaterial.New({
						configId = arg_172_0.id,
						count = arg_172_0.count
					}))
					getProxy(ActivityProxy):updateActivity(var_172_0)
				end
			elseif var_172_0 and not var_172_0:isEnd() then
				var_172_0:addVitemNumber(arg_172_0.id, arg_172_0.count)
				getProxy(ActivityProxy):updateActivity(var_172_0)
			end
		else
			print("can not handle this type>>" .. arg_172_0.type)
		end
	end

	var_0_0.MsgboxIntroCase = {
		[DROP_TYPE_RESOURCE] = function(arg_173_0, arg_173_1, arg_173_2)
			setText(arg_173_2, arg_173_0:getConfig("display"))
		end,
		[DROP_TYPE_ITEM] = function(arg_174_0, arg_174_1, arg_174_2)
			local var_174_0 = arg_174_0:getConfig("display")

			if arg_174_0:getConfig("type") == Item.LOVE_LETTER_TYPE then
				var_174_0 = string.gsub(var_174_0, "$1", ShipGroup.getDefaultShipNameByGroupID(arg_174_0.extra))
			elseif arg_174_0:getConfig("combination_display") ~= nil then
				local var_174_1 = arg_174_0:getConfig("combination_display")

				if var_174_1 and #var_174_1 > 0 then
					var_174_0 = Item.StaticCombinationDisplay(var_174_1)
				end
			end

			setText(arg_174_2, SwitchSpecialChar(var_174_0, true))
		end,
		[DROP_TYPE_FURNITURE] = function(arg_175_0, arg_175_1, arg_175_2)
			setText(arg_175_2, arg_175_0:getConfig("describe"))
		end,
		[DROP_TYPE_SHIP] = function(arg_176_0, arg_176_1, arg_176_2)
			local var_176_0 = arg_176_0:getConfig("skin_id")
			local var_176_1, var_176_2, var_176_3 = ShipWordHelper.GetWordAndCV(var_176_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_176_2, var_176_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_OPERATION] = function(arg_177_0, arg_177_1, arg_177_2)
			local var_177_0 = arg_177_0:getConfig("skin_id")
			local var_177_1, var_177_2, var_177_3 = ShipWordHelper.GetWordAndCV(var_177_0, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

			setText(arg_177_2, var_177_3 or i18n("ship_drop_desc_default"))
		end,
		[DROP_TYPE_EQUIP] = function(arg_178_0, arg_178_1, arg_178_2)
			setText(arg_178_2, arg_178_1.name or arg_178_0:getConfig("name") or "")
		end,
		[DROP_TYPE_STRATEGY] = function(arg_179_0, arg_179_1, arg_179_2)
			local var_179_0 = arg_179_0:getConfig("desc")

			for iter_179_0, iter_179_1 in ipairs({
				arg_179_0.count
			}) do
				var_179_0 = string.gsub(var_179_0, "$" .. iter_179_0, iter_179_1)
			end

			setText(arg_179_2, var_179_0)
		end,
		[DROP_TYPE_SKIN] = function(arg_180_0, arg_180_1, arg_180_2)
			setText(arg_180_2, arg_180_0:getConfig("desc"))
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_181_0, arg_181_1, arg_181_2)
			setText(arg_181_2, arg_181_0:getConfig("desc"))
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_182_0, arg_182_1, arg_182_2)
			local var_182_0 = arg_182_0:getConfig("desc")
			local var_182_1 = _.map(arg_182_0:getConfig("equip_type"), function(arg_183_0)
				return EquipType.Type2Name2(arg_183_0)
			end)

			setText(arg_182_2, var_182_0 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(var_182_1, ","))
		end,
		[DROP_TYPE_VITEM] = function(arg_184_0, arg_184_1, arg_184_2)
			setText(arg_184_2, arg_184_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_185_0, arg_185_1, arg_185_2)
			setText(arg_185_2, arg_185_0:getConfig("display"))
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_186_0, arg_186_1, arg_186_2, arg_186_3)
			local var_186_0 = WorldCollectionProxy.GetCollectionType(arg_186_0.id) == WorldCollectionProxy.WorldCollectionType.FILE and "file" or "record"

			setText(arg_186_2, i18n("world_" .. var_186_0 .. "_desc", arg_186_0:getConfig("name")))
			setText(arg_186_3, i18n("world_" .. var_186_0 .. "_name", arg_186_0:getConfig("name")))
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_187_0, arg_187_1, arg_187_2)
			setText(arg_187_2, arg_187_0:getConfig("desc"))
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_188_0, arg_188_1, arg_188_2)
			setText(arg_188_2, arg_188_0:getConfig("desc"))
		end,
		[DROP_TYPE_EMOJI] = function(arg_189_0, arg_189_1, arg_189_2)
			setText(arg_189_2, arg_189_0:getConfig("item_desc"))
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_190_0, arg_190_1, arg_190_2)
			local var_190_0 = string.gsub(arg_190_0:getConfig("display"), "$1", ShipGroup.getDefaultShipNameByGroupID(arg_190_0.count))

			setText(arg_190_2, SwitchSpecialChar(var_190_0, true))
		end,
		[DROP_TYPE_META_PT] = function(arg_191_0, arg_191_1, arg_191_2)
			setText(arg_191_2, arg_191_0:getConfig("display"))
		end,
		[DROP_TYPE_BUFF] = function(arg_192_0, arg_192_1, arg_192_2)
			setText(arg_192_2, arg_192_0:getConfig("desc"))
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_193_0, arg_193_1, arg_193_2)
			setText(arg_193_2, arg_193_0:getConfig("desc"))
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_194_0, arg_194_1, arg_194_2)
			setText(arg_194_2, arg_194_0:getConfig("display"))
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_195_0, arg_195_1, arg_195_2)
			setText(arg_195_2, arg_195_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_196_0, arg_196_1, arg_196_2)
			setText(arg_196_2, arg_196_0:getConfig("desc"))
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_197_0, arg_197_1, arg_197_2)
			setText(arg_197_2, "")
		end
	}

	function var_0_0.MsgboxIntroDefault(arg_198_0, arg_198_1, arg_198_2)
		if arg_198_0.type > DROP_TYPE_USE_ACTIVITY_DROP then
			setText(arg_198_2, arg_198_0:getConfig("display"))
		else
			setText(arg_198_2, arg_198_0.desc or "")
		end
	end

	var_0_0.UpdateDropCase = {
		[DROP_TYPE_RESOURCE] = function(arg_199_0, arg_199_1, arg_199_2)
			if arg_199_0.id == PlayerConst.ResStoreGold or arg_199_0.id == PlayerConst.ResStoreOil then
				arg_199_2 = arg_199_2 or {}
				arg_199_2.frame = "frame_store"
			end

			updateItem(arg_199_1, Item.New({
				id = id2ItemId(arg_199_0.id)
			}), arg_199_2)
		end,
		[DROP_TYPE_ITEM] = function(arg_200_0, arg_200_1, arg_200_2)
			updateItem(arg_200_1, arg_200_0:getSubClass(), arg_200_2)
		end,
		[DROP_TYPE_EQUIP] = function(arg_201_0, arg_201_1, arg_201_2)
			updateEquipment(arg_201_1, arg_201_0:getSubClass(), arg_201_2)
		end,
		[DROP_TYPE_SHIP] = function(arg_202_0, arg_202_1, arg_202_2)
			updateShip(arg_202_1, arg_202_0.ship, arg_202_2)
		end,
		[DROP_TYPE_OPERATION] = function(arg_203_0, arg_203_1, arg_203_2)
			updateShip(arg_203_1, arg_203_0.ship, arg_203_2)
		end,
		[DROP_TYPE_FURNITURE] = function(arg_204_0, arg_204_1, arg_204_2)
			updateFurniture(arg_204_1, arg_204_0, arg_204_2)
		end,
		[DROP_TYPE_STRATEGY] = function(arg_205_0, arg_205_1, arg_205_2)
			arg_205_2.isWorldBuff = arg_205_0.isWorldBuff

			updateStrategy(arg_205_1, arg_205_0, arg_205_2)
		end,
		[DROP_TYPE_SKIN] = function(arg_206_0, arg_206_1, arg_206_2)
			arg_206_2.isSkin = true
			arg_206_2.isNew = arg_206_0.isNew

			updateShip(arg_206_1, Ship.New({
				configId = tonumber(arg_206_0:getConfig("ship_group") .. "1"),
				skin_id = arg_206_0.id
			}), arg_206_2)
		end,
		[DROP_TYPE_EQUIPMENT_SKIN] = function(arg_207_0, arg_207_1, arg_207_2)
			local var_207_0 = setmetatable({
				count = arg_207_0.count
			}, {
				__index = arg_207_0:getConfigTable()
			})

			updateEquipmentSkin(arg_207_1, var_207_0, arg_207_2)
		end,
		[DROP_TYPE_VITEM] = function(arg_208_0, arg_208_1, arg_208_2)
			updateItem(arg_208_1, Item.New({
				id = arg_208_0.id
			}), arg_208_2)
		end,
		[DROP_TYPE_WORLD_ITEM] = function(arg_209_0, arg_209_1, arg_209_2)
			updateWorldItem(arg_209_1, WorldItem.New({
				id = arg_209_0.id
			}), arg_209_2)
		end,
		[DROP_TYPE_WORLD_COLLECTION] = function(arg_210_0, arg_210_1, arg_210_2)
			updateWorldCollection(arg_210_1, arg_210_0, arg_210_2)
		end,
		[DROP_TYPE_CHAT_FRAME] = function(arg_211_0, arg_211_1, arg_211_2)
			updateAttire(arg_211_1, AttireConst.TYPE_CHAT_FRAME, arg_211_0:getConfigTable(), arg_211_2)
		end,
		[DROP_TYPE_ICON_FRAME] = function(arg_212_0, arg_212_1, arg_212_2)
			updateAttire(arg_212_1, AttireConst.TYPE_ICON_FRAME, arg_212_0:getConfigTable(), arg_212_2)
		end,
		[DROP_TYPE_EMOJI] = function(arg_213_0, arg_213_1, arg_213_2)
			updateEmoji(arg_213_1, arg_213_0:getConfigTable(), arg_213_2)
		end,
		[DROP_TYPE_LOVE_LETTER] = function(arg_214_0, arg_214_1, arg_214_2)
			arg_214_2.count = 1

			updateItem(arg_214_1, arg_214_0:getSubClass(), arg_214_2)
		end,
		[DROP_TYPE_SPWEAPON] = function(arg_215_0, arg_215_1, arg_215_2)
			updateSpWeapon(arg_215_1, SpWeapon.New({
				id = arg_215_0.id
			}), arg_215_2)
		end,
		[DROP_TYPE_META_PT] = function(arg_216_0, arg_216_1, arg_216_2)
			updateItem(arg_216_1, Item.New({
				id = arg_216_0:getConfig("id")
			}), arg_216_2)
		end,
		[DROP_TYPE_SKIN_TIMELIMIT] = function(arg_217_0, arg_217_1, arg_217_2)
			arg_217_2.isSkin = true
			arg_217_2.isTimeLimit = true
			arg_217_2.count = 1

			updateShip(arg_217_1, Ship.New({
				configId = tonumber(arg_217_0:getConfig("ship_group") .. "1"),
				skin_id = arg_217_0.id
			}), arg_217_2)
		end,
		[DROP_TYPE_RYZA_DROP] = function(arg_218_0, arg_218_1, arg_218_2)
			AtelierMaterial.UpdateRyzaItem(arg_218_1, arg_218_0.item, arg_218_2)
		end,
		[DROP_TYPE_WORKBENCH_DROP] = function(arg_219_0, arg_219_1, arg_219_2)
			WorkBenchItem.UpdateDrop(arg_219_1, arg_219_0.item, arg_219_2)
		end,
		[DROP_TYPE_FEAST_DROP] = function(arg_220_0, arg_220_1, arg_220_2)
			WorkBenchItem.UpdateDrop(arg_220_1, WorkBenchItem.New({
				configId = arg_220_0.id,
				count = arg_220_0.count
			}), arg_220_2)
		end,
		[DROP_TYPE_BUFF] = function(arg_221_0, arg_221_1, arg_221_2)
			updateBuff(arg_221_1, arg_221_0.id, arg_221_2)
		end,
		[DROP_TYPE_COMMANDER_CAT] = function(arg_222_0, arg_222_1, arg_222_2)
			updateCommander(arg_222_1, arg_222_0, arg_222_2)
		end,
		[DROP_TYPE_DORM3D_FURNITURE] = function(arg_223_0, arg_223_1, arg_223_2)
			updateDorm3dFurniture(arg_223_1, arg_223_0, arg_223_2)
		end,
		[DROP_TYPE_DORM3D_GIFT] = function(arg_224_0, arg_224_1, arg_224_2)
			updateDorm3dGift(arg_224_1, arg_224_0, arg_224_2)
		end,
		[DROP_TYPE_DORM3D_SKIN] = function(arg_225_0, arg_225_1, arg_225_2)
			updateDorm3dSkin(arg_225_1, arg_225_0, arg_225_2)
		end,
		[DROP_TYPE_LIVINGAREA_COVER] = function(arg_226_0, arg_226_1, arg_226_2)
			updateCover(arg_226_1, arg_226_0, arg_226_2)
		end,
		[DROP_TYPE_COMBAT_UI_STYLE] = function(arg_227_0, arg_227_1, arg_227_2)
			updateAttireCombatUI(arg_227_1, AttireConst.TYPE_ICON_FRAME, arg_227_0:getConfigTable(), arg_227_2)
		end,
		[DROP_TYPE_ACTIVITY_MEDAL] = function(arg_228_0, arg_228_1, arg_228_2)
			updateActivityMedal(arg_228_1, arg_228_0:getConfigTable(), arg_228_2)
		end,
		[DROP_TYPE_ISLAND_ITEM] = function(arg_229_0, arg_229_1, arg_229_2)
			updateIslandItem(arg_229_1, arg_229_0, arg_229_2)
		end,
		[DROP_TYPE_ISLAND_ABILITY] = function(arg_230_0, arg_230_1, arg_230_2)
			updateIslandUnlock(arg_230_1, arg_230_0, arg_230_2)
		end,
		[DROP_TYPE_HOLIDAY_VILLA] = function(arg_231_0, arg_231_1, arg_231_2)
			updateItem(arg_231_1, Item.New({
				id = arg_231_0.id
			}), arg_231_2)
		end
	}

	function var_0_0.UpdateDropDefault(arg_232_0, arg_232_1, arg_232_2)
		warning(string.format("without dropType %d in updateDrop", arg_232_0.type))
	end
end

return var_0_0
