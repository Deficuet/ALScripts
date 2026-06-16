local var_0_0 = class("Ship", import(".BaseVO"))

var_0_0.ENERGY_MID = 40
var_0_0.ENERGY_LOW = 0
var_0_0.RECOVER_ENERGY_POINT = 2
var_0_0.INTIMACY_PROPOSE = 6
var_0_0.CONFIG_MAX_STAR = 6
var_0_0.BACKYARD_1F_ENERGY_ADDITION = 2
var_0_0.BACKYARD_2F_ENERGY_ADDITION = 3
var_0_0.PREFERENCE_TAG_NONE = 0
var_0_0.PREFERENCE_TAG_COMMON = 1

local var_0_1 = {
	vanguard = i18n("word_vanguard_fleet"),
	main = i18n("word_main_fleet")
}

var_0_0.LOCK_STATE_UNLOCK = 0
var_0_0.LOCK_STATE_LOCK = 1
var_0_0.WEAPON_COUNT = 3
var_0_0.PREFAB_EQUIP = 4
var_0_0.MAX_SKILL_LEVEL = 10
var_0_0.ENERGY_RECOVER_TIME = 360

local var_0_2 = 4
local var_0_3 = 100
local var_0_4 = 120
local var_0_5 = pg.ship_data_strengthen
local var_0_6 = pg.ship_level
local var_0_7 = pg.equip_skin_template
local var_0_8 = pg.ship_data_breakout

function nation2print(arg_1_0)
	return Nation.Nation2Print(arg_1_0)
end

function var_0_0.getRecoverEnergyPoint(arg_2_0)
	return arg_2_0.propose and 3 or 2
end

function shipType2name(arg_3_0)
	return ShipType.Type2Name(arg_3_0)
end

function shipType2print(arg_4_0)
	return ShipType.Type2Print(arg_4_0)
end

function shipType2Battleprint(arg_5_0)
	return ShipType.Type2BattlePrint(arg_5_0)
end

function skinId2bgPrint(arg_6_0)
	local var_6_0 = pg.ship_skin_template[arg_6_0].rarity_bg

	if var_6_0 and var_6_0 ~= "" then
		return var_6_0
	end
end

function var_0_0.useSkin(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:getSkinId()

	if var_7_0 == arg_7_1 then
		return true
	end

	local var_7_1 = ShipSkin.GetChangeSkinGroupId(var_7_0)
	local var_7_2 = ShipSkin.GetChangeSkinGroupId(arg_7_1)

	if var_7_1 and var_7_2 and var_7_1 == var_7_2 then
		return true
	end

	return false
end

function var_0_0.rarity2bgPrint(arg_8_0)
	return shipRarity2bgPrint(arg_8_0:getRarity(), arg_8_0:isBluePrintShip(), arg_8_0:isMetaShip())
end

function var_0_0.rarity2bgPrintForGet(arg_9_0)
	return skinId2bgPrint(arg_9_0:getSkinId()) or arg_9_0:rarity2bgPrint()
end

function var_0_0.getShipBgPrint(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:getSkinId()
	local var_10_1 = pg.ship_skin_template[var_10_0]

	assert(var_10_1, "ship_skin_template not exist: " .. var_10_0)

	local var_10_2

	if not arg_10_1 and var_10_1.bg_sp and var_10_1.bg_sp ~= "" and PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_10_1.painting, 0) == 0 then
		var_10_2 = var_10_1.bg_sp
	end

	return var_10_2 and var_10_2 or var_10_1.bg and #var_10_1.bg > 0 and var_10_1.bg or arg_10_0:rarity2bgPrintForGet()
end

function var_0_0.getStar(arg_11_0)
	return arg_11_0:getConfig("star")
end

function var_0_0.getMaxStar(arg_12_0)
	return pg.ship_data_template[arg_12_0.configId].star_max
end

function var_0_0.getShipArmor(arg_13_0)
	return arg_13_0:getConfig("armor_type")
end

function var_0_0.getShipArmorName(arg_14_0)
	local var_14_0 = arg_14_0:getShipArmor()

	return ArmorType.Type2Name(var_14_0)
end

function var_0_0.getGroupId(arg_15_0)
	return pg.ship_data_template[arg_15_0.configId].group_type
end

function var_0_0.getGroupIdByConfigId(arg_16_0)
	return math.floor(arg_16_0 / 10)
end

function var_0_0.getTransformShipId(arg_17_0)
	local var_17_0 = pg.ship_data_template[arg_17_0].group_type
	local var_17_1 = pg.ship_data_trans[var_17_0]

	if var_17_1 then
		for iter_17_0, iter_17_1 in ipairs(var_17_1.transform_list) do
			for iter_17_2, iter_17_3 in ipairs(iter_17_1) do
				local var_17_2 = pg.transform_data_template[iter_17_3[2]]

				for iter_17_4, iter_17_5 in ipairs(var_17_2.ship_id) do
					if iter_17_5[1] == arg_17_0 then
						return iter_17_5[2]
					end
				end
			end
		end
	end
end

function var_0_0.getAircraftCount(arg_18_0)
	local var_18_0 = arg_18_0:getConfigTable().base_list
	local var_18_1 = arg_18_0:getConfigTable().default_equip_list
	local var_18_2 = {}

	for iter_18_0 = 1, 3 do
		local var_18_3 = arg_18_0:getEquip(iter_18_0) and arg_18_0:getEquip(iter_18_0).configId or var_18_1[iter_18_0]
		local var_18_4 = Equipment.getConfigData(var_18_3).type

		if table.contains(EquipType.AirDomainEquip, var_18_4) then
			var_18_2[var_18_4] = defaultValue(var_18_2[var_18_4], 0) + var_18_0[iter_18_0]
		end
	end

	return var_18_2
end

function var_0_0.getShipType(arg_19_0)
	return arg_19_0:getConfig("type")
end

function var_0_0.getEnergy(arg_20_0)
	return arg_20_0.energy
end

function var_0_0.getEnergeConfig(arg_21_0)
	local var_21_0 = arg_21_0:getEnergy()

	for iter_21_0, iter_21_1 in ipairs(pg.energy_template.all) do
		local var_21_1 = pg.energy_template[iter_21_1]

		if type(iter_21_1) == "number" and var_21_0 >= var_21_1.lower_bound and var_21_0 <= var_21_1.upper_bound then
			return var_21_1
		end
	end

	assert(false, "疲劳配置不存在：" .. arg_21_0.energy)
end

function var_0_0.isLowEnergy(arg_22_0)
	return arg_22_0:getEnergeConfig().id < 3
end

function var_0_0.getEnergyPrint(arg_23_0)
	local var_23_0 = arg_23_0:getEnergeConfig()

	return var_23_0.icon, var_23_0.desc
end

function var_0_0.getIntimacy(arg_24_0)
	return arg_24_0.intimacy or 0
end

function var_0_0.getCVIntimacy(arg_25_0)
	return arg_25_0:getIntimacy() / 100 + (arg_25_0.propose and 1000 or 0)
end

function var_0_0.getIntimacyMax(arg_26_0)
	if arg_26_0.propose then
		return 200
	else
		return arg_26_0:GetNoProposeIntimacyMax()
	end
end

function var_0_0.GetNoProposeIntimacyMax(arg_27_0)
	return 100
end

function var_0_0.getIntimacyIcon(arg_28_0)
	local var_28_0 = pg.intimacy_template[arg_28_0:getIntimacyLevel()]
	local var_28_1 = ""

	if arg_28_0:isMetaShip() then
		var_28_1 = "_meta"
	elseif arg_28_0:IsXIdol() then
		var_28_1 = "_imas"
	end

	if not arg_28_0.propose and math.floor(arg_28_0:getIntimacy() / 100) >= arg_28_0:getIntimacyMax() then
		return var_28_0.icon .. var_28_1, "heart" .. var_28_1
	else
		return var_28_0.icon .. var_28_1
	end
end

function var_0_0.getIntimacyDetail(arg_29_0)
	return arg_29_0:getIntimacyMax(), math.floor(arg_29_0:getIntimacy() / 100)
end

function var_0_0.getIntimacyInfo(arg_30_0)
	local var_30_0 = pg.intimacy_template[arg_30_0:getIntimacyLevel()]

	return var_30_0.icon, var_30_0.desc
end

function var_0_0.getIntimacyLevel(arg_31_0)
	local var_31_0 = 0

	for iter_31_0, iter_31_1 in pairs(pg.intimacy_template.all) do
		local var_31_1 = pg.intimacy_template[iter_31_1]

		if type(iter_31_1) == "number" and arg_31_0:getIntimacy() >= var_31_1.lower_bound and arg_31_0:getIntimacy() <= var_31_1.upper_bound then
			var_31_0 = iter_31_1

			break
		end
	end

	if var_31_0 < arg_31_0.INTIMACY_PROPOSE and arg_31_0.propose then
		var_31_0 = arg_31_0.INTIMACY_PROPOSE
	end

	return var_31_0
end

function var_0_0.getBluePrint(arg_32_0)
	local var_32_0 = ShipBluePrint.New({
		id = arg_32_0.groupId
	})
	local var_32_1 = arg_32_0.strengthList[1] or {
		exp = 0,
		level = 0
	}

	var_32_0:updateInfo({
		blue_print_level = var_32_1.level,
		exp = var_32_1.exp
	})

	return var_32_0
end

function var_0_0.getBaseList(arg_33_0)
	if arg_33_0:isBluePrintShip() then
		local var_33_0 = arg_33_0:getBluePrint()

		assert(var_33_0, "blueprint can not be nil" .. arg_33_0.configId)

		return var_33_0:getBaseList(arg_33_0)
	else
		return arg_33_0:getConfig("base_list")
	end
end

function var_0_0.getPreLoadCount(arg_34_0)
	if arg_34_0:isBluePrintShip() then
		return arg_34_0:getBluePrint():getPreLoadCount(arg_34_0)
	else
		return arg_34_0:getConfig("preload_count")
	end
end

function var_0_0.getNation(arg_35_0)
	return arg_35_0:getConfig("nationality")
end

function var_0_0.getPaintingName(arg_36_0)
	local var_36_0 = pg.ship_data_statistics[arg_36_0].skin_id
	local var_36_1 = pg.ship_skin_template[var_36_0]

	assert(var_36_1, "ship_skin_template not exist: " .. arg_36_0 .. " " .. var_36_0)

	return var_36_1.painting
end

function var_0_0.getName(arg_37_0)
	if arg_37_0.propose and pg.PushNotificationMgr.GetInstance():isEnableShipName() then
		return arg_37_0.name
	end

	if arg_37_0:isRemoulded() then
		return pg.ship_skin_template[arg_37_0:getRemouldSkinId()].name
	end

	return pg.ship_data_statistics[arg_37_0.configId].name
end

function var_0_0.GetDefaultName(arg_38_0)
	if arg_38_0:isRemoulded() then
		return pg.ship_skin_template[arg_38_0:getRemouldSkinId()].name
	else
		return pg.ship_data_statistics[arg_38_0.configId].name
	end
end

function var_0_0.getShipName(arg_39_0)
	return pg.ship_data_statistics[arg_39_0].name
end

function var_0_0.getBreakOutLevel(arg_40_0)
	assert(arg_40_0, "必须存在配置id")
	assert(pg.ship_data_statistics[arg_40_0], "必须存在配置" .. arg_40_0)

	return pg.ship_data_statistics[arg_40_0].star
end

function var_0_0.Ctor(arg_41_0, arg_41_1)
	arg_41_0.id = arg_41_1.id
	arg_41_0.configId = arg_41_1.template_id or arg_41_1.configId
	arg_41_0.level = arg_41_1.level
	arg_41_0.exp = arg_41_1.exp
	arg_41_0.energy = arg_41_1.energy
	arg_41_0.lockState = arg_41_1.is_locked
	arg_41_0.intimacy = arg_41_1.intimacy
	arg_41_0.propose = arg_41_1.propose and arg_41_1.propose > 0
	arg_41_0.proposeTime = arg_41_1.propose

	if arg_41_0.intimacy and arg_41_0.intimacy > 10000 and not arg_41_0.propose then
		arg_41_0.intimacy = 10000
	end

	arg_41_0.renameTime = arg_41_1.change_name_timestamp

	if arg_41_1.name and arg_41_1.name ~= "" then
		arg_41_0.name = arg_41_1.name
	else
		assert(pg.ship_data_statistics[arg_41_0.configId], "必须存在配置" .. arg_41_0.configId)

		arg_41_0.name = pg.ship_data_statistics[arg_41_0.configId].name
	end

	arg_41_0.groupId = pg.ship_data_template[arg_41_0.configId].group_type

	local var_41_0 = pg.ship_data_group.get_id_list_by_group_type[arg_41_0.groupId][1]

	arg_41_0.bluePrintFlag = pg.ship_data_group[var_41_0].handbook_type == 2
	arg_41_0.strengthList = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_1.strength_list or {}) do
		if not arg_41_0:isBluePrintShip() then
			local var_41_1 = ShipModAttr.ID_TO_ATTR[iter_41_1.id]

			arg_41_0.strengthList[var_41_1] = iter_41_1.exp
		else
			table.insert(arg_41_0.strengthList, {
				level = iter_41_1.id,
				exp = iter_41_1.exp
			})
		end
	end

	arg_41_0.equipmentSkins = {}
	arg_41_0.equipments = {}

	if arg_41_1.equip_info_list then
		for iter_41_2, iter_41_3 in ipairs(arg_41_1.equip_info_list or {}) do
			arg_41_0.equipments[iter_41_2] = iter_41_3.id > 0 and Equipment.New({
				count = 1,
				id = iter_41_3.id,
				config_id = iter_41_3.id,
				skinId = iter_41_3.skinId
			}) or false
			arg_41_0.equipmentSkins[iter_41_2] = iter_41_3.skinId > 0 and iter_41_3.skinId or 0

			arg_41_0:reletiveEquipSkin(iter_41_2)
		end
	end

	arg_41_0.spWeapon = nil

	if arg_41_1.spweapon then
		arg_41_0:UpdateSpWeapon(SpWeapon.CreateByNet(arg_41_1.spweapon))
	end

	arg_41_0.skills = {}

	for iter_41_4, iter_41_5 in ipairs(arg_41_1.skill_id_list or {}) do
		arg_41_0:updateSkill(iter_41_5)
	end

	arg_41_0.star = arg_41_0:getConfig("rarity")
	arg_41_0.transforms = {}

	for iter_41_6, iter_41_7 in ipairs(arg_41_1.transform_list or {}) do
		arg_41_0.transforms[iter_41_7.id] = {
			id = iter_41_7.id,
			level = iter_41_7.level
		}
	end

	arg_41_0.createTime = arg_41_1.create_time or 0

	local var_41_2 = getProxy(CollectionProxy)

	arg_41_0.virgin = var_41_2 and var_41_2.shipGroups[arg_41_0.groupId] == nil

	local var_41_3 = {
		pg.gameset.test_ship_config_1.key_value,
		pg.gameset.test_ship_config_2.key_value,
		pg.gameset.test_ship_config_3.key_value
	}
	local var_41_4 = table.indexof(var_41_3, arg_41_0.configId)

	if var_41_4 == 1 then
		arg_41_0.testShip = {
			2,
			3,
			4
		}
	elseif var_41_4 == 2 then
		arg_41_0.testShip = {
			5
		}
	elseif var_41_4 == 3 then
		arg_41_0.testShip = {
			6
		}
	else
		arg_41_0.testShip = nil
	end

	arg_41_0.maxIntimacy = pg.intimacy_template[#pg.intimacy_template.all].upper_bound

	local var_41_5 = 0

	if not HXSet.isHxSkin() then
		var_41_5 = arg_41_1.skin_id or 0
	end

	arg_41_0.phantomDic = {}

	arg_41_0:updateSkinId(var_41_5, 0)

	for iter_41_8, iter_41_9 in ipairs(arg_41_1.skin_shadow_list or {}) do
		arg_41_0:updateSkinId(iter_41_9.value, iter_41_9.key)
	end

	arg_41_0.noChangeSkin = arg_41_1.noChangeSkin or false
	arg_41_0.phantomRandomFlag = {}

	for iter_41_10, iter_41_11 in ipairs(arg_41_1.char_random_flag or {}) do
		arg_41_0:updateRandomFlag(1, iter_41_11)
	end

	if arg_41_1.name and arg_41_1.name ~= "" then
		arg_41_0.name = arg_41_1.name
	elseif arg_41_0:isRemoulded() then
		arg_41_0.name = pg.ship_skin_template[arg_41_0:getRemouldSkinId()].name
	else
		arg_41_0.name = pg.ship_data_statistics[arg_41_0.configId].name
	end

	arg_41_0.maxLevel = arg_41_1.max_level
	arg_41_0.proficiency = arg_41_1.proficiency or 0
	arg_41_0.preferenceTag = arg_41_1.common_flag
	arg_41_0.hpRant = 10000
	arg_41_0.strategies = {}
	arg_41_0.triggers = {}
	arg_41_0.commanderId = arg_41_1.commanderid or 0
	arg_41_0.activityNpc = arg_41_1.activity_npc or 0

	if var_0_0.isMetaShipByConfigID(arg_41_0.configId) then
		local var_41_6 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_41_0.configId)

		arg_41_0.metaCharacter = MetaCharacter.New({
			id = var_41_6,
			repair_attr_info = arg_41_1.meta_repair_list
		}, arg_41_0)
	end
end

function var_0_0.isMetaShipByConfigID(arg_42_0)
	local var_42_0 = pg.ship_meta_breakout.all
	local var_42_1 = var_42_0[1]
	local var_42_2 = false

	if var_42_1 <= arg_42_0 then
		for iter_42_0, iter_42_1 in ipairs(var_42_0) do
			if arg_42_0 == iter_42_1 then
				var_42_2 = true

				break
			end
		end
	end

	return var_42_2
end

function var_0_0.isMetaShip(arg_43_0)
	return arg_43_0.metaCharacter ~= nil
end

function var_0_0.getMetaCharacter(arg_44_0)
	return arg_44_0.metaCharacter
end

function var_0_0.unlockActivityNpc(arg_45_0, arg_45_1)
	arg_45_0.activityNpc = arg_45_1
end

function var_0_0.isActivityNpc(arg_46_0)
	return arg_46_0.activityNpc > 0
end

function var_0_0.getActiveEquipments(arg_47_0)
	local var_47_0 = Clone(arg_47_0.equipments)

	for iter_47_0 = #var_47_0, 1, -1 do
		local var_47_1 = var_47_0[iter_47_0]

		if var_47_1 then
			for iter_47_1 = 1, iter_47_0 - 1 do
				local var_47_2 = var_47_0[iter_47_1]

				if var_47_2 and var_47_1:getConfig("equip_limit") ~= 0 and var_47_2:getConfig("equip_limit") == var_47_1:getConfig("equip_limit") then
					var_47_0[iter_47_0] = false
				end
			end
		end
	end

	return var_47_0
end

function var_0_0.getAllEquipments(arg_48_0)
	return arg_48_0.equipments
end

function var_0_0.isBluePrintShip(arg_49_0)
	return arg_49_0.bluePrintFlag
end

function var_0_0.getSkinId(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0:getPhantomSkin(arg_50_1 or 0)

	if not arg_50_0.noChangeSkin and tobool(arg_50_0.id) and ShipSkin.IsChangeSkin(var_50_0) then
		local var_50_1 = ShipSkin.GetStoreChangeSkinId(ShipSkin.GetChangeSkinGroupId(var_50_0), arg_50_0:GetShipPhantomMark())

		if var_50_1 then
			return var_50_1
		end
	end

	return var_50_0
end

function var_0_0.RevertAsmrSkin(arg_51_0)
	local var_51_0 = arg_51_0:getSkinId()

	if not arg_51_0.noChangeSkin and tobool(arg_51_0.id) and ShipSkin.IsChangeSkin(var_51_0) then
		local var_51_1 = ShipSkin.GetChangeSkinCustomDataId(var_51_0, "asmr") == 1 and true or false
		local var_51_2 = ShipSkin.GetChangeSkinCustomDataId(var_51_0, "index") == 1 and true or false

		if var_51_1 and not var_51_2 then
			local var_51_3 = ShipSkin.GetChangeSkinMainId(var_51_0)

			ShipSkin.SetStoreChangeSkinId(var_51_3, arg_51_0:GetShipPhantomMark())
		end
	end
end

function var_0_0.getPhantomSkin(arg_52_0, arg_52_1)
	if not arg_52_1 or arg_52_1 == 0 then
		return arg_52_0.skinId
	else
		return arg_52_0.phantomDic[arg_52_0.phantomId] or arg_52_0:getConfig("skin_id")
	end
end

function var_0_0.updateSkinId(arg_53_0, arg_53_1, arg_53_2)
	if not arg_53_1 or arg_53_1 == 0 then
		arg_53_1 = arg_53_0:getConfig("skin_id")
	end

	if arg_53_2 == 0 then
		arg_53_0.skinId = arg_53_1
	else
		arg_53_0.phantomDic[arg_53_2] = arg_53_1
	end
end

function var_0_0.getAllShipPhantomMarks(arg_54_0)
	local var_54_0 = getGameset("technology_shadow_num")[1]
	local var_54_1 = {}

	for iter_54_0 = 0, var_54_0 do
		if iter_54_0 == 0 or arg_54_0.phantomDic[iter_54_0] then
			table.insert(var_54_1, ShipPhantom.PackMark(arg_54_0.id, iter_54_0))
		end
	end

	return var_54_1
end

function var_0_0.getAllShipPhantom(arg_55_0)
	local var_55_0 = getGameset("technology_shadow_num")[1]
	local var_55_1 = {}

	for iter_55_0 = 0, var_55_0 do
		if iter_55_0 == 0 or arg_55_0.phantomDic[iter_55_0] then
			table.insert(var_55_1, ShipPhantom.Create(arg_55_0, iter_55_0))
		end
	end

	return var_55_1
end

function var_0_0.updateRandomFlag(arg_56_0, arg_56_1, arg_56_2)
	arg_56_2 = defaultValue(arg_56_2, 0)
	arg_56_0.phantomRandomFlag[arg_56_2] = arg_56_1
end

function var_0_0.getRandomFlag(arg_57_0, arg_57_1)
	return defaultValue(arg_57_0.phantomRandomFlag[arg_57_1 or 0], 0) > 0
end

function var_0_0.getRandomFlagShipPhantomMarks(arg_58_0)
	local var_58_0 = getGameset("technology_shadow_num")[1]
	local var_58_1 = {}

	for iter_58_0 = 0, var_58_0 do
		if defaultValue(arg_58_0.phantomRandomFlag[iter_58_0], 0) > 0 then
			table.insert(var_58_1, arg_58_0:GetShipPhantomMark(iter_58_0))
		end
	end

	return var_58_1
end

function var_0_0.updateName(arg_59_0)
	if arg_59_0.name ~= pg.ship_data_statistics[arg_59_0.configId].name then
		return
	end

	if arg_59_0:isRemoulded() then
		arg_59_0.name = pg.ship_skin_template[arg_59_0:getRemouldSkinId()].name
	else
		arg_59_0.name = pg.ship_data_statistics[arg_59_0.configId].name
	end
end

function var_0_0.isRemoulded(arg_60_0)
	if arg_60_0.remoulded then
		return true
	end

	local var_60_0 = pg.ship_data_trans[arg_60_0.groupId]

	if var_60_0 then
		for iter_60_0, iter_60_1 in ipairs(var_60_0.transform_list) do
			for iter_60_2, iter_60_3 in ipairs(iter_60_1) do
				local var_60_1 = pg.transform_data_template[iter_60_3[2]]

				if var_60_1.skin_id ~= 0 and arg_60_0.transforms[iter_60_3[2]] and arg_60_0.transforms[iter_60_3[2]].level == var_60_1.max_level then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.getRemouldSkinId(arg_61_0)
	local var_61_0 = ShipGroup.getModSkin(arg_61_0.groupId)

	if var_61_0 then
		return var_61_0.id
	end

	return nil
end

function var_0_0.hasEquipmentSkinInPos(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_0.equipments[arg_62_1]

	return var_62_0 and var_62_0:hasSkin()
end

function var_0_0.getPrefab(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0:getSkinId()

	if arg_63_0:hasEquipmentSkinInPos(var_0_2) then
		local var_63_1 = arg_63_0:getEquip(var_0_2)
		local var_63_2 = var_0_7[var_63_1:getSkinId()].ship_skin_id

		var_63_0 = var_63_2 ~= 0 and var_63_2 or var_63_0
	end

	local var_63_3 = pg.ship_skin_template[var_63_0]

	assert(var_63_3, "ship_skin_template not exist: " .. arg_63_0.configId .. " " .. var_63_0)

	if var_63_3.double_char and var_63_3.double_char == 1 and arg_63_1 ~= nil then
		local var_63_4

		if arg_63_1 == 1 then
			return var_63_3.prefab .. "_L"
		elseif arg_63_1 == 2 then
			return var_63_3.prefab .. "_R"
		end
	end

	return var_63_3.prefab
end

function var_0_0.IsDoubleSkin(arg_64_0)
	local var_64_0 = arg_64_0:getSkinId()
	local var_64_1 = pg.ship_skin_template[var_64_0]

	assert(var_64_1, "ship_skin_template not exist: " .. arg_64_0.configId .. " " .. var_64_0)

	return var_64_1.double_char and var_64_1.double_char == 1 or false
end

function var_0_0.getAttachmentPrefab(arg_65_0)
	local var_65_0 = {}

	for iter_65_0, iter_65_1 in ipairs(arg_65_0.equipments) do
		if iter_65_1 and iter_65_1:hasSkinOrbit() then
			local var_65_1 = iter_65_1:getSkinId()
			local var_65_2 = var_0_7[var_65_1]

			var_65_0[var_65_1] = {
				config = var_65_2,
				index = iter_65_0
			}
		end
	end

	return var_65_0
end

function var_0_0.getPainting(arg_66_0)
	local var_66_0 = arg_66_0:getSkinId()
	local var_66_1 = pg.ship_skin_template[var_66_0]

	assert(var_66_1, "ship_skin_template not exist: " .. arg_66_0.configId .. " " .. var_66_0)

	return var_66_1.painting
end

function var_0_0.GetSkinConfig(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_0:getSkinId()
	local var_67_1 = pg.ship_skin_template[var_67_0]

	assert(var_67_1, "ship_skin_template not exist: " .. arg_67_0.configId .. " " .. var_67_0)

	return var_67_1
end

function var_0_0.getRemouldPainting(arg_68_0)
	local var_68_0 = arg_68_0:getRemouldSkinId()
	local var_68_1 = pg.ship_skin_template[var_68_0]

	assert(var_68_1, "ship_skin_template not exist: " .. arg_68_0.configId .. " " .. var_68_0)

	return var_68_1.painting
end

function var_0_0.isTestShip(arg_69_0)
	return arg_69_0.testShip
end

function var_0_0.canUseTestShip(arg_70_0, arg_70_1)
	assert(arg_70_0.testShip, "ship is not TestShip")

	return table.contains(arg_70_0.testShip, arg_70_1)
end

function var_0_0.updateEquip(arg_71_0, arg_71_1, arg_71_2)
	assert(arg_71_2 == nil or arg_71_2.count == 1)

	local var_71_0 = arg_71_0.equipments[arg_71_1]

	arg_71_0.equipments[arg_71_1] = arg_71_2 and Clone(arg_71_2) or false

	local function var_71_1(arg_72_0)
		arg_72_0 = CreateShell(arg_72_0)
		arg_72_0.shipId = arg_71_0.id
		arg_72_0.shipPos = arg_71_1

		return arg_72_0
	end

	if var_71_0 then
		getProxy(EquipmentProxy):OnShipEquipsRemove(var_71_0, arg_71_0.id, arg_71_1)
		var_71_0:setSkinId(0)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_REMOVED, var_71_1(var_71_0))
	end

	if arg_71_2 then
		getProxy(EquipmentProxy):OnShipEquipsAdd(arg_71_2, arg_71_0.id, arg_71_1)
		arg_71_0:reletiveEquipSkin(arg_71_1)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_ADDED, var_71_1(arg_71_2))
	end
end

function var_0_0.reletiveEquipSkin(arg_73_0, arg_73_1)
	if arg_73_0.equipments[arg_73_1] and arg_73_0.equipmentSkins[arg_73_1] ~= 0 then
		local var_73_0 = pg.equip_skin_template[arg_73_0.equipmentSkins[arg_73_1]].equip_type
		local var_73_1 = arg_73_0.equipments[arg_73_1]:getType()

		if table.contains(var_73_0, var_73_1) then
			arg_73_0.equipments[arg_73_1]:setSkinId(arg_73_0.equipmentSkins[arg_73_1])
		else
			arg_73_0.equipments[arg_73_1]:setSkinId(0)
		end
	elseif arg_73_0.equipments[arg_73_1] then
		arg_73_0.equipments[arg_73_1]:setSkinId(0)
	end
end

function var_0_0.updateEquipmentSkin(arg_74_0, arg_74_1, arg_74_2)
	if not arg_74_1 then
		return
	end

	if arg_74_2 and arg_74_2 > 0 then
		local var_74_0 = arg_74_0:getSkinTypes(arg_74_1)
		local var_74_1 = pg.equip_skin_template[arg_74_2].equip_type
		local var_74_2 = false

		for iter_74_0, iter_74_1 in ipairs(var_74_0) do
			for iter_74_2, iter_74_3 in ipairs(var_74_1) do
				if iter_74_1 == iter_74_3 then
					var_74_2 = true

					break
				end
			end
		end

		if not var_74_2 then
			assert(var_74_2, "部位" .. arg_74_1 .. " 无法穿戴皮肤 " .. arg_74_2)

			return
		end

		local var_74_3 = arg_74_0.equipments[arg_74_1] and arg_74_0.equipments[arg_74_1]:getType() or false

		arg_74_0.equipmentSkins[arg_74_1] = arg_74_2

		if var_74_3 and table.contains(var_74_1, var_74_3) then
			arg_74_0.equipments[arg_74_1]:setSkinId(arg_74_0.equipmentSkins[arg_74_1])
		elseif var_74_3 and not table.contains(var_74_1, var_74_3) then
			arg_74_0.equipments[arg_74_1]:setSkinId(0)
		end
	else
		arg_74_0.equipmentSkins[arg_74_1] = 0

		if arg_74_0.equipments[arg_74_1] then
			arg_74_0.equipments[arg_74_1]:setSkinId(0)
		end
	end
end

function var_0_0.getEquip(arg_75_0, arg_75_1)
	return Clone(arg_75_0.equipments[arg_75_1])
end

function var_0_0.getEquipSkins(arg_76_0)
	return Clone(arg_76_0.equipmentSkins)
end

function var_0_0.getEquipSkin(arg_77_0, arg_77_1)
	return arg_77_0.equipmentSkins[arg_77_1]
end

function var_0_0.getCanEquipSkin(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_0:getSkinTypes(arg_78_1)

	if var_78_0 and #var_78_0 then
		for iter_78_0, iter_78_1 in ipairs(var_78_0) do
			if pg.equip_data_by_type[iter_78_1].equip_skin == 1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.checkCanEquipSkin(arg_79_0, arg_79_1, arg_79_2)
	if not arg_79_1 or not arg_79_2 then
		return
	end

	local var_79_0 = arg_79_0:getSkinTypes(arg_79_1)
	local var_79_1 = pg.equip_skin_template[arg_79_2].equip_type

	for iter_79_0, iter_79_1 in ipairs(var_79_0) do
		if table.contains(var_79_1, iter_79_1) then
			return true
		end
	end

	return false
end

function var_0_0.getSkinTypes(arg_80_0, arg_80_1)
	return pg.ship_data_template[arg_80_0.configId]["equip_" .. arg_80_1] or {}
end

function var_0_0.addSkillExp(arg_81_0, arg_81_1, arg_81_2)
	local var_81_0 = arg_81_0.skills[arg_81_1] or {
		exp = 0,
		level = 1,
		id = arg_81_1
	}
	local var_81_1 = var_81_0.level and var_81_0.level or 1
	local var_81_2 = pg.skill_need_exp.all[#pg.skill_need_exp.all]

	if var_81_1 == var_81_2 then
		return
	end

	local var_81_3 = var_81_0.exp and arg_81_2 + var_81_0.exp or 0 + arg_81_2

	while var_81_3 >= pg.skill_need_exp[var_81_1].exp do
		var_81_3 = var_81_3 - pg.skill_need_exp[var_81_1].exp
		var_81_1 = var_81_1 + 1

		if var_81_1 == var_81_2 then
			var_81_3 = 0

			break
		end
	end

	arg_81_0:updateSkill({
		id = var_81_0.id,
		level = var_81_1,
		exp = var_81_3
	})
end

function var_0_0.upSkillLevelForMeta(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_0.skills[arg_82_1] or {
		exp = 0,
		level = 0,
		id = arg_82_1
	}
	local var_82_1 = arg_82_0:isSkillLevelMax(arg_82_1)
	local var_82_2 = var_82_0.level

	if not var_82_1 then
		var_82_2 = var_82_2 + 1
	end

	arg_82_0:updateSkill({
		exp = 0,
		id = var_82_0.id,
		level = var_82_2
	})
end

function var_0_0.getMetaSkillLevelBySkillID(arg_83_0, arg_83_1)
	return (arg_83_0.skills[arg_83_1] or {
		exp = 0,
		level = 0,
		id = arg_83_1
	}).level
end

function var_0_0.isSkillLevelMax(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_0.skills[arg_84_1] or {
		exp = 0,
		level = 1,
		id = arg_84_1
	}

	return (var_84_0.level and var_84_0.level or 1) >= pg.skill_data_template[arg_84_1].max_level
end

function var_0_0.isAllMetaSkillLevelMax(arg_85_0)
	local var_85_0 = true
	local var_85_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_85_0.configId)

	for iter_85_0, iter_85_1 in ipairs(var_85_1) do
		if not arg_85_0:isSkillLevelMax(iter_85_1) then
			var_85_0 = false

			break
		end
	end

	return var_85_0
end

function var_0_0.isAllMetaSkillLock(arg_86_0)
	local var_86_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_86_0.configId)
	local var_86_1 = true

	for iter_86_0, iter_86_1 in ipairs(var_86_0) do
		if arg_86_0:getMetaSkillLevelBySkillID(iter_86_1) > 0 then
			var_86_1 = false

			break
		end
	end

	return var_86_1
end

function var_0_0.bindConfigTable(arg_87_0)
	return pg.ship_data_statistics
end

function var_0_0.isAvaiable(arg_88_0)
	return true
end

var_0_0.PROPERTIES = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.Armor,
	AttributeType.Hit,
	AttributeType.Dodge,
	AttributeType.Speed,
	AttributeType.Luck,
	AttributeType.AntiSub
}
var_0_0.PROPERTIES_ENHANCEMENT = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.Hit,
	AttributeType.Dodge,
	AttributeType.Speed,
	AttributeType.Luck,
	AttributeType.AntiSub
}
var_0_0.DIVE_PROPERTIES = {
	AttributeType.OxyMax,
	AttributeType.OxyCost,
	AttributeType.OxyRecovery,
	AttributeType.OxyRecoveryBench,
	AttributeType.OxyRecoverySurface,
	AttributeType.OxyAttackDuration,
	AttributeType.OxyRaidDistance
}
var_0_0.SONAR_PROPERTIES = {
	AttributeType.SonarRange
}

function var_0_0.intimacyAdditions(arg_89_0, arg_89_1)
	local var_89_0 = pg.intimacy_template[arg_89_0:getIntimacyLevel()].attr_bonus * 0.0001

	for iter_89_0, iter_89_1 in pairs(arg_89_1) do
		if iter_89_0 == AttributeType.Durability or iter_89_0 == AttributeType.Cannon or iter_89_0 == AttributeType.Torpedo or iter_89_0 == AttributeType.AntiAircraft or iter_89_0 == AttributeType.AntiSub or iter_89_0 == AttributeType.Air or iter_89_0 == AttributeType.Reload or iter_89_0 == AttributeType.Hit or iter_89_0 == AttributeType.Dodge then
			arg_89_1[iter_89_0] = arg_89_1[iter_89_0] * (var_89_0 + 1)
		end
	end
end

function var_0_0.getShipProperties(arg_90_0)
	local var_90_0 = arg_90_0:getBaseProperties()

	if arg_90_0:isBluePrintShip() then
		local var_90_1 = arg_90_0:getBluePrint()

		assert(var_90_1, "blueprint can not be nil" .. arg_90_0.configId)

		local var_90_2 = var_90_1:getTotalAdditions()

		for iter_90_0, iter_90_1 in pairs(var_90_2) do
			var_90_0[iter_90_0] = var_90_0[iter_90_0] + calcFloor(iter_90_1)
		end

		arg_90_0:intimacyAdditions(var_90_0)
	elseif arg_90_0:isMetaShip() then
		assert(arg_90_0.metaCharacter)

		for iter_90_2, iter_90_3 in pairs(var_90_0) do
			var_90_0[iter_90_2] = var_90_0[iter_90_2] + arg_90_0.metaCharacter:getAttrAddition(iter_90_2)
		end

		arg_90_0:intimacyAdditions(var_90_0)
	else
		local var_90_3 = pg.ship_data_template[arg_90_0.configId].strengthen_id
		local var_90_4 = var_0_5[var_90_3]

		for iter_90_4, iter_90_5 in pairs(arg_90_0.strengthList) do
			local var_90_5 = ShipModAttr.ATTR_TO_INDEX[iter_90_4]
			local var_90_6 = math.min(iter_90_5, var_90_4.durability[var_90_5] * var_90_4.level_exp[var_90_5])
			local var_90_7 = math.max(arg_90_0:getModExpRatio(iter_90_4), 1)

			var_90_0[iter_90_4] = var_90_0[iter_90_4] + calcFloor(var_90_6 / var_90_7)
		end

		arg_90_0:intimacyAdditions(var_90_0)

		for iter_90_6, iter_90_7 in pairs(arg_90_0.transforms) do
			local var_90_8 = pg.transform_data_template[iter_90_7.id].effect

			for iter_90_8 = 1, iter_90_7.level do
				local var_90_9 = var_90_8[iter_90_8] or {}

				for iter_90_9, iter_90_10 in pairs(var_90_0) do
					if var_90_9[iter_90_9] then
						var_90_0[iter_90_9] = var_90_0[iter_90_9] + var_90_9[iter_90_9]
					end
				end
			end
		end
	end

	return var_90_0
end

function var_0_0.getTechNationAddition(arg_91_0, arg_91_1)
	local var_91_0 = getProxy(TechnologyNationProxy)
	local var_91_1 = arg_91_0:getConfig("type")

	if var_91_1 == ShipType.DaoQuV or var_91_1 == ShipType.DaoQuM then
		var_91_1 = ShipType.QuZhu
	end

	return var_91_0:getShipAddition(var_91_1, arg_91_1)
end

function var_0_0.getTechNationMaxAddition(arg_92_0, arg_92_1)
	local var_92_0 = getProxy(TechnologyNationProxy)
	local var_92_1 = arg_92_0:getConfig("type")

	return var_92_0:getShipMaxAddition(var_92_1, arg_92_1)
end

function var_0_0.getEquipProficiencyByPos(arg_93_0, arg_93_1)
	return arg_93_0:getEquipProficiencyList()[arg_93_1]
end

function var_0_0.getEquipProficiencyList(arg_94_0)
	local var_94_0 = arg_94_0:getConfigTable()
	local var_94_1 = Clone(var_94_0.equipment_proficiency)

	if arg_94_0:isBluePrintShip() then
		local var_94_2 = arg_94_0:getBluePrint()

		assert(var_94_2, "blueprint can not be nil >>>" .. arg_94_0.groupId)

		var_94_1 = var_94_2:getEquipProficiencyList(arg_94_0)
	else
		for iter_94_0, iter_94_1 in ipairs(var_94_1) do
			local var_94_3 = 0

			for iter_94_2, iter_94_3 in pairs(arg_94_0.transforms) do
				local var_94_4 = pg.transform_data_template[iter_94_3.id].effect

				for iter_94_4 = 1, iter_94_3.level do
					local var_94_5 = var_94_4[iter_94_4] or {}

					if var_94_5["equipment_proficiency_" .. iter_94_0] then
						var_94_3 = var_94_3 + var_94_5["equipment_proficiency_" .. iter_94_0]
					end
				end
			end

			var_94_1[iter_94_0] = iter_94_1 + var_94_3
		end
	end

	return var_94_1
end

function var_0_0.getBaseProperties(arg_95_0)
	local var_95_0 = arg_95_0:getConfigTable()

	assert(var_95_0, "配置表没有这艘船" .. arg_95_0.configId)

	local var_95_1 = {}
	local var_95_2 = {}

	for iter_95_0, iter_95_1 in ipairs(var_0_0.PROPERTIES) do
		var_95_1[iter_95_1] = arg_95_0:getGrowthForAttr(iter_95_1)
		var_95_2[iter_95_1] = var_95_1[iter_95_1]
	end

	for iter_95_2, iter_95_3 in ipairs(arg_95_0:getConfig("lock")) do
		var_95_2[iter_95_3] = var_95_1[iter_95_3]
	end

	for iter_95_4, iter_95_5 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_95_2[iter_95_5] = var_95_0[iter_95_5]
	end

	for iter_95_6, iter_95_7 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_95_2[iter_95_7] = 0
	end

	return var_95_2
end

function var_0_0.getGrowthForAttr(arg_96_0, arg_96_1)
	local var_96_0 = arg_96_0:getConfigTable()
	local var_96_1 = table.indexof(var_0_0.PROPERTIES, arg_96_1)
	local var_96_2 = pg.gameset.extra_attr_level_limit.key_value
	local var_96_3 = var_96_0.attrs[var_96_1] + (arg_96_0.level - 1) * var_96_0.attrs_growth[var_96_1] / 1000

	if var_96_2 < arg_96_0.level then
		var_96_3 = var_96_3 + (arg_96_0.level - var_96_2) * var_96_0.attrs_growth_extra[var_96_1] / 1000
	end

	return var_96_3
end

function var_0_0.isMaxStar(arg_97_0)
	return arg_97_0:getStar() >= arg_97_0:getMaxStar()
end

function var_0_0.IsMaxStarByTmpID(arg_98_0)
	local var_98_0 = pg.ship_data_template[arg_98_0]

	return var_98_0.star >= var_98_0.star_max
end

function var_0_0.IsSpweaponUnlock(arg_99_0)
	if not arg_99_0:CanAccumulateExp() then
		return false, "spweapon_tip_locked"
	else
		return true
	end
end

function var_0_0.getModProperties(arg_100_0, arg_100_1)
	return arg_100_0.strengthList[arg_100_1] or 0
end

function var_0_0.addModAttrExp(arg_101_0, arg_101_1, arg_101_2)
	local var_101_0 = arg_101_0:getModAttrTopLimit(arg_101_1)

	if var_101_0 == 0 then
		return
	end

	local var_101_1 = arg_101_0:getModExpRatio(arg_101_1)
	local var_101_2 = arg_101_0:getModProperties(arg_101_1)

	if var_101_2 + arg_101_2 > var_101_0 * var_101_1 then
		arg_101_0.strengthList[arg_101_1] = var_101_0 * var_101_1
	else
		arg_101_0.strengthList[arg_101_1] = var_101_2 + arg_101_2
	end
end

function var_0_0.getNeedModExp(arg_102_0)
	local var_102_0 = {}

	for iter_102_0, iter_102_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_102_1 = arg_102_0:getModAttrTopLimit(iter_102_1)

		if var_102_1 == 0 then
			var_102_0[iter_102_1] = 0
		else
			var_102_0[iter_102_1] = var_102_1 * arg_102_0:getModExpRatio(iter_102_1) - arg_102_0:getModProperties(iter_102_1)
		end
	end

	return var_102_0
end

function var_0_0.attrVertify(arg_103_0)
	if not BayProxy.checkShiplevelVertify(arg_103_0) then
		return false
	end

	for iter_103_0, iter_103_1 in ipairs(arg_103_0.equipments) do
		if iter_103_1 and not iter_103_1:vertify() then
			return false
		end
	end

	return true
end

function var_0_0.getEquipmentProperties(arg_104_0)
	local var_104_0 = {}
	local var_104_1 = {}

	for iter_104_0, iter_104_1 in ipairs(var_0_0.PROPERTIES) do
		var_104_0[iter_104_1] = 0
	end

	for iter_104_2, iter_104_3 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_104_0[iter_104_3] = 0
	end

	for iter_104_4, iter_104_5 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_104_0[iter_104_5] = 0
	end

	for iter_104_6, iter_104_7 in ipairs(var_0_0.PROPERTIES_ENHANCEMENT) do
		var_104_1[iter_104_7] = 0
	end

	var_104_0[AttributeType.AirDominate] = 0
	var_104_0[AttributeType.AntiSiren] = 0

	local var_104_2 = arg_104_0:getActiveEquipments()

	for iter_104_8, iter_104_9 in ipairs(var_104_2) do
		if iter_104_9 then
			local var_104_3 = iter_104_9:GetAttributes()

			for iter_104_10, iter_104_11 in ipairs(var_104_3) do
				if iter_104_11 and var_104_0[iter_104_11.type] then
					var_104_0[iter_104_11.type] = var_104_0[iter_104_11.type] + iter_104_11.value
				end
			end

			local var_104_4 = iter_104_9:GetPropertyRate()

			for iter_104_12, iter_104_13 in pairs(var_104_4) do
				var_104_1[iter_104_12] = math.max(var_104_1[iter_104_12], iter_104_13)
			end

			local var_104_5 = iter_104_9:GetSonarProperty()

			if var_104_5 then
				for iter_104_14, iter_104_15 in pairs(var_104_5) do
					var_104_0[iter_104_14] = var_104_0[iter_104_14] + iter_104_15
				end
			end

			local var_104_6 = iter_104_9:GetAntiSirenPower()

			if var_104_6 then
				var_104_0[AttributeType.AntiSiren] = var_104_0[AttributeType.AntiSiren] + var_104_6 / 10000
			end
		end
	end

	;(function()
		local var_105_0 = arg_104_0:GetSpWeapon()

		if not var_105_0 then
			return
		end

		local var_105_1 = var_105_0:GetPropertiesInfo().attrs

		for iter_105_0, iter_105_1 in ipairs(var_105_1) do
			if iter_105_1 and var_104_0[iter_105_1.type] then
				var_104_0[iter_105_1.type] = var_104_0[iter_105_1.type] + iter_105_1.value
			end
		end
	end)()

	for iter_104_16, iter_104_17 in pairs(var_104_1) do
		var_104_1[iter_104_16] = iter_104_17 + 1
	end

	return var_104_0, var_104_1
end

function var_0_0.getSkillEffects(arg_106_0)
	local var_106_0 = arg_106_0:getShipSkillEffects()

	_.each(arg_106_0:getEquipmentSkillEffects(), function(arg_107_0)
		table.insert(var_106_0, arg_107_0)
	end)

	return var_106_0
end

function var_0_0.getShipSkillEffects(arg_108_0)
	local var_108_0 = {}
	local var_108_1 = arg_108_0:getSkillList()

	for iter_108_0, iter_108_1 in ipairs(var_108_1) do
		local var_108_2 = arg_108_0:RemapSkillId(iter_108_1, true)
		local var_108_3 = pg.buffCfg["buff_" .. var_108_2]

		arg_108_0:FilterActiveSkill(var_108_0, var_108_3, arg_108_0.skills[iter_108_1])
	end

	return var_108_0
end

function var_0_0.getEquipmentSkillEffects(arg_109_0)
	local var_109_0 = {}
	local var_109_1 = arg_109_0:getActiveEquipments()

	for iter_109_0, iter_109_1 in ipairs(var_109_1) do
		local var_109_2
		local var_109_3 = iter_109_1 and iter_109_1:getConfig("skill_id")[1] and iter_109_1:getConfig("skill_id")[1][1]

		if var_109_3 then
			var_109_2 = pg.buffCfg["buff_" .. var_109_3]
		end

		arg_109_0:FilterActiveSkill(var_109_0, var_109_2)
	end

	;(function()
		local var_110_0 = arg_109_0:GetSpWeapon()
		local var_110_1 = var_110_0 and var_110_0:GetEffect() or 0
		local var_110_2

		if var_110_1 > 0 then
			var_110_2 = pg.buffCfg["buff_" .. var_110_1]
		end

		arg_109_0:FilterActiveSkill(var_109_0, var_110_2)
	end)()

	return var_109_0
end

function var_0_0.FilterActiveSkill(arg_111_0, arg_111_1, arg_111_2, arg_111_3)
	if not arg_111_2 or not arg_111_2.const_effect_list then
		return
	end

	for iter_111_0 = 1, #arg_111_2.const_effect_list do
		local var_111_0 = arg_111_2.const_effect_list[iter_111_0]
		local var_111_1 = var_111_0.trigger
		local var_111_2 = var_111_0.arg_list
		local var_111_3 = 1

		if arg_111_3 then
			var_111_3 = arg_111_3.level

			local var_111_4 = arg_111_2[var_111_3].const_effect_list

			if var_111_4 and var_111_4[iter_111_0] then
				var_111_1 = var_111_4[iter_111_0].trigger or var_111_1
				var_111_2 = var_111_4[iter_111_0].arg_list or var_111_2
			end
		end

		local var_111_5 = true

		for iter_111_1, iter_111_2 in pairs(var_111_1) do
			if arg_111_0.triggers[iter_111_1] ~= iter_111_2 then
				var_111_5 = false

				break
			end
		end

		if var_111_5 then
			table.insert(arg_111_1, {
				type = var_111_0.type,
				arg_list = var_111_2,
				level = var_111_3
			})
		end
	end
end

function var_0_0.getEquipmentGearScore(arg_112_0)
	local var_112_0 = 0
	local var_112_1 = arg_112_0:getActiveEquipments()

	for iter_112_0, iter_112_1 in ipairs(var_112_1) do
		if iter_112_1 then
			var_112_0 = var_112_0 + iter_112_1:GetGearScore()
		end
	end

	return var_112_0
end

function var_0_0.getProperties(arg_113_0, arg_113_1, arg_113_2, arg_113_3, arg_113_4)
	local var_113_0 = arg_113_1 or {}
	local var_113_1 = arg_113_0:getConfig("nationality")
	local var_113_2 = arg_113_0:getConfig("type")
	local var_113_3 = arg_113_0:getShipProperties()
	local var_113_4, var_113_5 = arg_113_0:getEquipmentProperties()
	local var_113_6
	local var_113_7
	local var_113_8

	if arg_113_3 and arg_113_0:getFlag("inWorld") then
		local var_113_9 = WorldConst.FetchWorldShip(arg_113_0.id)

		var_113_6, var_113_7 = var_113_9:GetShipBuffProperties()
		var_113_8 = var_113_9:GetShipPowerBuffProperties()
	end

	for iter_113_0, iter_113_1 in ipairs(var_0_0.PROPERTIES) do
		local var_113_10 = 0
		local var_113_11 = 0

		for iter_113_2, iter_113_3 in pairs(var_113_0) do
			var_113_10 = var_113_10 + iter_113_3:getAttrRatioAddition(iter_113_1, var_113_1, var_113_2) / 100
			var_113_11 = var_113_11 + iter_113_3:getAttrValueAddition(iter_113_1, var_113_1, var_113_2)
		end

		local var_113_12 = var_113_10 + (var_113_5[iter_113_1] or 1)
		local var_113_13 = var_113_7 and var_113_7[iter_113_1] or 1
		local var_113_14 = var_113_6 and var_113_6[iter_113_1] or 0

		if iter_113_1 == AttributeType.Speed then
			var_113_3[iter_113_1] = var_113_3[iter_113_1] * var_113_12 * var_113_13 + var_113_11 + var_113_4[iter_113_1] + var_113_14
		else
			var_113_3[iter_113_1] = calcFloor(calcFloor(var_113_3[iter_113_1]) * var_113_12 * var_113_13) + var_113_11 + var_113_4[iter_113_1] + var_113_14
		end
	end

	if not arg_113_2 and arg_113_0:isMaxStar() then
		for iter_113_4, iter_113_5 in pairs(var_113_3) do
			local var_113_15 = arg_113_4 and arg_113_0:getTechNationMaxAddition(iter_113_4) or arg_113_0:getTechNationAddition(iter_113_4)

			var_113_3[iter_113_4] = var_113_3[iter_113_4] + var_113_15
		end
	end

	for iter_113_6, iter_113_7 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_113_3[iter_113_7] = var_113_3[iter_113_7] + var_113_4[iter_113_7]
	end

	for iter_113_8, iter_113_9 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_113_3[iter_113_9] = var_113_3[iter_113_9] + var_113_4[iter_113_9]
	end

	if arg_113_3 then
		var_113_3[AttributeType.AntiSiren] = (var_113_3[AttributeType.AntiSiren] or 0) + var_113_4[AttributeType.AntiSiren]
	end

	if var_113_8 then
		for iter_113_10, iter_113_11 in pairs(var_113_8) do
			if var_113_3[iter_113_10] then
				if iter_113_10 == AttributeType.Speed then
					var_113_3[iter_113_10] = var_113_3[iter_113_10] * iter_113_11
				else
					var_113_3[iter_113_10] = math.floor(var_113_3[iter_113_10] * iter_113_11)
				end
			end
		end
	end

	return var_113_3
end

function var_0_0.getTransGearScore(arg_114_0)
	local var_114_0 = 0
	local var_114_1 = pg.transform_data_template

	for iter_114_0, iter_114_1 in pairs(arg_114_0.transforms) do
		for iter_114_2 = 1, iter_114_1.level do
			var_114_0 = var_114_0 + (var_114_1[iter_114_1.id].gear_score[iter_114_2] or 0)
		end
	end

	return var_114_0
end

function var_0_0.getShipCombatPower(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_0:getProperties(arg_115_1, nil, nil, true)
	local var_115_1 = var_115_0[AttributeType.Durability] / 5 + var_115_0[AttributeType.Cannon] + var_115_0[AttributeType.Torpedo] + var_115_0[AttributeType.AntiAircraft] + var_115_0[AttributeType.Air] + var_115_0[AttributeType.AntiSub] + var_115_0[AttributeType.Reload] + var_115_0[AttributeType.Hit] * 2 + var_115_0[AttributeType.Dodge] * 2 + var_115_0[AttributeType.Speed] + arg_115_0:getEquipmentGearScore() + arg_115_0:getTransGearScore()

	return math.floor(var_115_1)
end

function var_0_0.cosumeEnergy(arg_116_0, arg_116_1)
	arg_116_0:setEnergy(math.max(arg_116_0:getEnergy() - arg_116_1, 0))
end

function var_0_0.addEnergy(arg_117_0, arg_117_1)
	arg_117_0:setEnergy(arg_117_0:getEnergy() + arg_117_1)
end

function var_0_0.setEnergy(arg_118_0, arg_118_1)
	arg_118_0.energy = arg_118_1
end

function var_0_0.setLikability(arg_119_0, arg_119_1)
	assert(arg_119_1 >= 0 and arg_119_1 <= arg_119_0.maxIntimacy, "intimacy value invaild" .. arg_119_1)
	arg_119_0:setIntimacy(arg_119_1)
end

function var_0_0.addLikability(arg_120_0, arg_120_1)
	local var_120_0 = Mathf.Clamp(arg_120_0:getIntimacy() + arg_120_1, 0, arg_120_0.maxIntimacy)

	arg_120_0:setIntimacy(var_120_0)
end

function var_0_0.setIntimacy(arg_121_0, arg_121_1)
	if arg_121_1 > 10000 and not arg_121_0.propose then
		arg_121_1 = 10000
	end

	arg_121_0.intimacy = arg_121_1

	if not arg_121_0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[arg_121_0.groupId]:updateMaxIntimacy(arg_121_0:getIntimacy())
	end
end

function var_0_0.getLevelExpConfig(arg_122_0, arg_122_1)
	if arg_122_0:getConfig("rarity") == ShipRarity.SSR then
		local var_122_0 = Clone(getConfigFromLevel1(var_0_6, arg_122_1 or arg_122_0.level))

		var_122_0.exp = var_122_0.exp_ur
		var_122_0.exp_start = var_122_0.exp_ur_start
		var_122_0.exp_interval = var_122_0.exp_ur_interval
		var_122_0.exp_end = var_122_0.exp_ur_end

		return var_122_0
	else
		return getConfigFromLevel1(var_0_6, arg_122_1 or arg_122_0.level)
	end
end

function var_0_0.getExp(arg_123_0)
	local var_123_0 = arg_123_0:getMaxLevel()

	if arg_123_0.level == var_123_0 and LOCK_FULL_EXP then
		return 0
	end

	return arg_123_0.exp
end

function var_0_0.getProficiency(arg_124_0)
	return arg_124_0.proficiency
end

function var_0_0.addExp(arg_125_0, arg_125_1, arg_125_2)
	local var_125_0 = arg_125_0:getMaxLevel()

	if arg_125_0.level == var_125_0 then
		if arg_125_0.exp >= pg.gameset.exp_overflow_max.key_value then
			return
		end

		if LOCK_FULL_EXP or not arg_125_2 or not arg_125_0:CanAccumulateExp() then
			arg_125_1 = 0
		end
	end

	arg_125_0.exp = arg_125_0.exp + arg_125_1

	local var_125_1 = false

	while arg_125_0:canLevelUp() do
		arg_125_0.exp = arg_125_0.exp - arg_125_0:getLevelExpConfig().exp_interval
		arg_125_0.level = math.min(arg_125_0.level + 1, var_125_0)
		var_125_1 = true
	end

	if arg_125_0.level == var_125_0 then
		if arg_125_2 and arg_125_0:CanAccumulateExp() then
			arg_125_0.exp = math.min(arg_125_0.exp, pg.gameset.exp_overflow_max.key_value)
		elseif var_125_1 then
			arg_125_0.exp = 0
		end
	end
end

function var_0_0.getMaxLevel(arg_126_0)
	return arg_126_0.maxLevel
end

function var_0_0.canLevelUp(arg_127_0)
	local var_127_0 = arg_127_0:getLevelExpConfig(arg_127_0.level + 1)
	local var_127_1 = arg_127_0:getMaxLevel() <= arg_127_0.level

	return var_127_0 and arg_127_0:getLevelExpConfig().exp_interval <= arg_127_0.exp and not var_127_1
end

function var_0_0.getConfigMaxLevel(arg_128_0)
	return var_0_6.all[#var_0_6.all]
end

function var_0_0.isConfigMaxLevel(arg_129_0)
	return arg_129_0.level == arg_129_0:getConfigMaxLevel()
end

function var_0_0.updateMaxLevel(arg_130_0, arg_130_1)
	local var_130_0 = arg_130_0:getConfigMaxLevel()

	arg_130_0.maxLevel = math.max(math.min(var_130_0, arg_130_1), arg_130_0.maxLevel)
end

function var_0_0.getNextMaxLevel(arg_131_0)
	local var_131_0 = arg_131_0:getConfigMaxLevel()

	for iter_131_0 = arg_131_0:getMaxLevel() + 1, var_131_0 do
		if var_0_6[iter_131_0].level_limit == 1 then
			return iter_131_0
		end
	end
end

function var_0_0.canUpgrade(arg_132_0)
	if arg_132_0:isBluePrintShip() then
		return false
	end

	if arg_132_0:isMetaShip() then
		local var_132_0 = arg_132_0:getMetaCharacter()

		if not var_132_0 then
			return false
		end

		local var_132_1 = var_132_0:getBreakOutInfo()

		if not var_132_1:hasNextInfo() then
			return false
		end

		local var_132_2, var_132_3 = var_132_1:getLimited()

		if var_132_2 > arg_132_0.level then
			return false
		end

		return true
	else
		local var_132_4 = var_0_8[arg_132_0.configId]

		assert(var_132_4, "不存在配置" .. arg_132_0.configId)

		return not arg_132_0:isMaxStar() and arg_132_0.level >= var_132_4.level
	end
end

function var_0_0.isReachNextMaxLevel(arg_133_0)
	return arg_133_0.level == arg_133_0:getMaxLevel() and arg_133_0:CanAccumulateExp() and arg_133_0:getNextMaxLevel() ~= nil
end

function var_0_0.isAwakening(arg_134_0)
	return arg_134_0:isReachNextMaxLevel() and arg_134_0.level < var_0_4
end

function var_0_0.isAwakening2(arg_135_0)
	return arg_135_0:isReachNextMaxLevel() and arg_135_0.level >= var_0_4
end

function var_0_0.notMaxLevelForFilter(arg_136_0)
	return arg_136_0.level ~= arg_136_0:getMaxLevel()
end

function var_0_0.getNextMaxLevelConsume(arg_137_0)
	local var_137_0 = arg_137_0:getMaxLevel()
	local var_137_1 = var_0_6[var_137_0]["need_item_rarity" .. arg_137_0:getConfig("rarity")]

	assert(var_137_1, "items  can not be nil")

	return _.map(var_137_1, function(arg_138_0)
		return {
			type = arg_138_0[1],
			id = arg_138_0[2],
			count = arg_138_0[3]
		}
	end)
end

function var_0_0.canUpgradeMaxLevel(arg_139_0)
	if not arg_139_0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		local var_139_0 = getProxy(PlayerProxy):getData()
		local var_139_1 = getProxy(BagProxy)
		local var_139_2 = arg_139_0:getNextMaxLevelConsume()

		for iter_139_0, iter_139_1 in pairs(var_139_2) do
			if iter_139_1.type == DROP_TYPE_RESOURCE then
				if var_139_0:getResById(iter_139_1.id) < iter_139_1.count then
					return false, i18n("common_no_resource")
				end
			elseif iter_139_1.type == DROP_TYPE_ITEM and var_139_1:getItemCountById(iter_139_1.id) < iter_139_1.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

function var_0_0.CanAccumulateExp(arg_140_0)
	return pg.ship_data_template[arg_140_0.configId].can_get_proficency == 1
end

function var_0_0.getTotalExp(arg_141_0)
	return arg_141_0:getLevelExpConfig().exp_start + arg_141_0.exp
end

function var_0_0.getStartBattleExpend(arg_142_0)
	if table.contains(ShipType.SubShipType, arg_142_0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[arg_142_0.configId].oil_at_start
	end
end

function var_0_0.getEndBattleExpend(arg_143_0)
	local var_143_0 = pg.ship_data_template[arg_143_0.configId]
	local var_143_1 = arg_143_0:getLevelExpConfig()

	return (math.floor(var_143_0.oil_at_end * var_143_1.fight_oil_ratio / 10000))
end

function var_0_0.getBattleTotalExpend(arg_144_0)
	return arg_144_0:getStartBattleExpend() + arg_144_0:getEndBattleExpend()
end

function var_0_0.getShipAmmo(arg_145_0)
	local var_145_0 = arg_145_0:getConfig(AttributeType.Ammo)

	for iter_145_0, iter_145_1 in pairs(arg_145_0:getAllSkills()) do
		local var_145_1 = tonumber(iter_145_0 .. string.format("%.2d", iter_145_1.level))
		local var_145_2 = pg.skill_benefit_template[var_145_1]

		if var_145_2 and arg_145_0:IsBenefitSkillActive(var_145_2) and (var_145_2.type == var_0_0.BENEFIT_EQUIP or var_145_2.type == var_0_0.BENEFIT_SKILL) then
			var_145_0 = var_145_0 + defaultValue(var_145_2.effect[1], 0)
		end
	end

	local var_145_3 = arg_145_0:getActiveEquipments()

	for iter_145_2, iter_145_3 in ipairs(var_145_3) do
		local var_145_4 = iter_145_3 and iter_145_3:getConfig("equip_parameters").ammo

		if var_145_4 then
			var_145_0 = var_145_0 + var_145_4
		end
	end

	return var_145_0
end

function var_0_0.getHuntingLv(arg_146_0)
	local var_146_0 = arg_146_0:getConfig("huntingrange_level")

	for iter_146_0, iter_146_1 in pairs(arg_146_0:getAllSkills()) do
		local var_146_1 = tonumber(iter_146_0 .. string.format("%.2d", iter_146_1.level))
		local var_146_2 = pg.skill_benefit_template[var_146_1]

		if var_146_2 and arg_146_0:IsBenefitSkillActive(var_146_2) and (var_146_2.type == var_0_0.BENEFIT_EQUIP or var_146_2.type == var_0_0.BENEFIT_SKILL) then
			var_146_0 = var_146_0 + defaultValue(var_146_2.effect[2], 0)
		end
	end

	local var_146_3 = arg_146_0:getActiveEquipments()

	for iter_146_2, iter_146_3 in ipairs(var_146_3) do
		local var_146_4 = iter_146_3 and iter_146_3:getConfig("equip_parameters").hunting_lv

		if var_146_4 then
			var_146_0 = var_146_0 + var_146_4
		end
	end

	return (math.min(var_146_0, arg_146_0:getMaxHuntingLv()))
end

function var_0_0.getMapAuras(arg_147_0)
	local var_147_0 = {}

	for iter_147_0, iter_147_1 in pairs(arg_147_0:getAllSkills()) do
		local var_147_1 = tonumber(iter_147_0 .. string.format("%.2d", iter_147_1.level))
		local var_147_2 = pg.skill_benefit_template[var_147_1]

		if var_147_2 and arg_147_0:IsBenefitSkillActive(var_147_2) and var_147_2.type == var_0_0.BENEFIT_MAP_AURA then
			local var_147_3 = {
				id = var_147_2.effect[1],
				level = iter_147_1.level
			}

			table.insert(var_147_0, var_147_3)
		end
	end

	return var_147_0
end

function var_0_0.getMapAids(arg_148_0)
	local var_148_0 = {}

	for iter_148_0, iter_148_1 in pairs(arg_148_0:getAllSkills()) do
		local var_148_1 = tonumber(iter_148_0 .. string.format("%.2d", iter_148_1.level))
		local var_148_2 = pg.skill_benefit_template[var_148_1]

		if var_148_2 and arg_148_0:IsBenefitSkillActive(var_148_2) and var_148_2.type == var_0_0.BENEFIT_AID then
			local var_148_3 = {
				id = var_148_2.effect[1],
				level = iter_148_1.level
			}

			table.insert(var_148_0, var_148_3)
		end
	end

	return var_148_0
end

var_0_0.BENEFIT_SKILL = 2
var_0_0.BENEFIT_EQUIP = 3
var_0_0.BENEFIT_MAP_AURA = 4
var_0_0.BENEFIT_AID = 5

function var_0_0.IsBenefitSkillActive(arg_149_0, arg_149_1)
	local var_149_0 = false

	if arg_149_1.type == var_0_0.BENEFIT_SKILL then
		if not arg_149_1.limit[1] or arg_149_1.limit[1] == arg_149_0.triggers.TeamNumbers then
			var_149_0 = true
		end
	elseif arg_149_1.type == var_0_0.BENEFIT_EQUIP then
		local var_149_1 = arg_149_1.limit
		local var_149_2 = arg_149_0:getAllEquipments()

		for iter_149_0, iter_149_1 in ipairs(var_149_2) do
			if iter_149_1 and table.contains(var_149_1, iter_149_1:getConfig("id")) then
				var_149_0 = true

				break
			end
		end
	elseif arg_149_1.type == var_0_0.BENEFIT_MAP_AURA then
		if arg_149_0.hpRant and arg_149_0.hpRant > 0 then
			return true
		end
	elseif arg_149_1.type == var_0_0.BENEFIT_AID and arg_149_0.hpRant and arg_149_0.hpRant > 0 then
		return true
	end

	return var_149_0
end

function var_0_0.getMaxHuntingLv(arg_150_0)
	return #arg_150_0:getConfig("hunting_range")
end

function var_0_0.getHuntingRange(arg_151_0, arg_151_1)
	local var_151_0 = arg_151_0:getConfig("hunting_range")
	local var_151_1 = Clone(var_151_0[1])
	local var_151_2 = arg_151_1 or arg_151_0:getHuntingLv()
	local var_151_3 = math.min(var_151_2, arg_151_0:getMaxHuntingLv())

	for iter_151_0 = 2, var_151_3 do
		_.each(var_151_0[iter_151_0], function(arg_152_0)
			table.insert(var_151_1, {
				arg_152_0[1],
				arg_152_0[2]
			})
		end)
	end

	return var_151_1
end

function var_0_0.getTriggerSkills(arg_153_0)
	local var_153_0 = {}
	local var_153_1 = arg_153_0:getSkillEffects()

	_.each(var_153_1, function(arg_154_0)
		if arg_154_0.type == "AddBuff" and arg_154_0.arg_list and arg_154_0.arg_list.buff_id then
			local var_154_0 = arg_154_0.arg_list.buff_id

			var_153_0[var_154_0] = {
				id = var_154_0,
				level = arg_154_0.level
			}
		end
	end)

	return var_153_0
end

function var_0_0.GetEquipmentSkills(arg_155_0)
	local var_155_0 = {}
	local var_155_1 = arg_155_0:getActiveEquipments()

	for iter_155_0, iter_155_1 in ipairs(var_155_1) do
		if iter_155_1 and iter_155_1:getConfig("skill_id")[1] then
			local var_155_2, var_155_3 = unpack(iter_155_1:getConfig("skill_id")[1])

			var_155_0[var_155_2] = {
				id = var_155_2,
				level = var_155_3
			}
		end
	end

	;(function()
		local var_156_0 = arg_155_0:GetSpWeapon()
		local var_156_1 = var_156_0 and var_156_0:GetEffect() or 0

		if var_156_1 > 0 then
			var_155_0[var_156_1] = {
				level = 1,
				id = var_156_1
			}
		end
	end)()

	return var_155_0
end

function var_0_0.getAllSkills(arg_157_0)
	local var_157_0 = Clone(arg_157_0.skills)

	for iter_157_0, iter_157_1 in pairs(arg_157_0:GetEquipmentSkills()) do
		var_157_0[iter_157_0] = iter_157_1
	end

	for iter_157_2, iter_157_3 in pairs(arg_157_0:getTriggerSkills()) do
		var_157_0[iter_157_2] = iter_157_3
	end

	return var_157_0
end

function var_0_0.isSameKind(arg_158_0, arg_158_1)
	return pg.ship_data_template[arg_158_0.configId].group_type == pg.ship_data_template[arg_158_1.configId].group_type
end

function var_0_0.GetLockState(arg_159_0)
	return arg_159_0.lockState
end

function var_0_0.IsLocked(arg_160_0)
	return arg_160_0.lockState == var_0_0.LOCK_STATE_LOCK
end

function var_0_0.SetLockState(arg_161_0, arg_161_1)
	arg_161_0.lockState = arg_161_1
end

function var_0_0.GetPreferenceTag(arg_162_0)
	return arg_162_0.preferenceTag or 0
end

function var_0_0.IsPreferenceTag(arg_163_0)
	return arg_163_0:GetPreferenceTag() == var_0_0.PREFERENCE_TAG_COMMON
end

function var_0_0.SetPreferenceTag(arg_164_0, arg_164_1)
	arg_164_0.preferenceTag = arg_164_1
end

function var_0_0.calReturnRes(arg_165_0)
	local var_165_0 = pg.ship_data_by_type[arg_165_0:getShipType()]
	local var_165_1 = var_165_0.distory_resource_gold_ratio
	local var_165_2 = var_165_0.distory_resource_oil_ratio
	local var_165_3 = pg.ship_data_by_star[arg_165_0:getConfig("rarity")].destory_item

	return var_165_1, 0, var_165_3
end

function var_0_0.getRarity(arg_166_0)
	local var_166_0 = arg_166_0:getConfig("rarity")

	if arg_166_0:isRemoulded() then
		var_166_0 = var_166_0 + 1
	end

	return var_166_0
end

function var_0_0.updateSkill(arg_167_0, arg_167_1)
	local var_167_0 = arg_167_1.skill_id or arg_167_1.id
	local var_167_1 = arg_167_1.skill_lv or arg_167_1.lv or arg_167_1.level
	local var_167_2 = arg_167_1.skill_exp or arg_167_1.exp

	arg_167_0.skills[var_167_0] = {
		id = var_167_0,
		level = var_167_1,
		exp = var_167_2
	}
end

function var_0_0.canEquipAtPos(arg_168_0, arg_168_1, arg_168_2)
	local var_168_0, var_168_1 = arg_168_0:isForbiddenAtPos(arg_168_1, arg_168_2)

	if var_168_0 then
		return false, var_168_1
	end

	for iter_168_0, iter_168_1 in ipairs(arg_168_0.equipments) do
		if iter_168_1 and iter_168_0 ~= arg_168_2 and iter_168_1:getConfig("equip_limit") ~= 0 and arg_168_1:getConfig("equip_limit") == iter_168_1:getConfig("equip_limit") then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

function var_0_0.isForbiddenAtPos(arg_169_0, arg_169_1, arg_169_2)
	local var_169_0 = pg.ship_data_template[arg_169_0.configId]

	assert(var_169_0, "can not find ship in ship_data_templtae: " .. arg_169_0.configId)

	local var_169_1 = var_169_0["equip_" .. arg_169_2]

	if not table.contains(var_169_1, arg_169_1:getConfig("type")) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(arg_169_1:getConfig("ship_type_forbidden"), arg_169_0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

function var_0_0.canEquipCommander(arg_170_0, arg_170_1)
	if arg_170_1:getShipType() ~= arg_170_0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

function var_0_0.upgrade(arg_171_0)
	local var_171_0 = pg.ship_data_transform[arg_171_0.configId]

	if var_171_0.trans_id and var_171_0.trans_id > 0 then
		arg_171_0.configId = var_171_0.trans_id
		arg_171_0.star = arg_171_0:getConfig("star")
	end
end

function var_0_0.getTeamType(arg_172_0)
	return ShipType.GetTeamFromShipType(arg_172_0:getShipType())
end

function var_0_0.getFleetName(arg_173_0)
	local var_173_0 = arg_173_0:getTeamType()

	return var_0_1[var_173_0]
end

function var_0_0.getMaxConfigId(arg_174_0)
	local var_174_0 = pg.ship_data_template
	local var_174_1

	for iter_174_0 = 4, 1, -1 do
		local var_174_2 = tonumber(arg_174_0.groupId .. iter_174_0)

		if var_174_0[var_174_2] then
			var_174_1 = var_174_2

			break
		end
	end

	return var_174_1
end

function var_0_0.getFlag(arg_175_0, arg_175_1, arg_175_2)
	return pg.ShipFlagMgr.GetInstance():GetShipFlag(arg_175_0.id, arg_175_1, arg_175_2)
end

function var_0_0.hasAnyFlag(arg_176_0, arg_176_1)
	return _.any(arg_176_1, function(arg_177_0)
		return arg_176_0:getFlag(arg_177_0)
	end)
end

function var_0_0.isBreakOut(arg_178_0)
	return arg_178_0.configId % 10 > 1
end

function var_0_0.fateSkillChange(arg_179_0, arg_179_1)
	if not arg_179_0.skillChangeList then
		arg_179_0.skillChangeList = arg_179_0:isBluePrintShip() and arg_179_0:getBluePrint():getChangeSkillList() or {}
	end

	for iter_179_0, iter_179_1 in ipairs(arg_179_0.skillChangeList) do
		if iter_179_1[1] == arg_179_1 and arg_179_0.skills[iter_179_1[2]] then
			return iter_179_1[2]
		end
	end

	return arg_179_1
end

function var_0_0.RemapSkillId(arg_180_0, arg_180_1, arg_180_2)
	local var_180_0 = arg_180_0:GetSpWeapon()

	if var_180_0 then
		if table.contains(pg.ship_data_template[arg_180_0.configId].hide_buff_list, arg_180_1) then
			return var_180_0:RemapHiddenSkillId(arg_180_1)
		elseif arg_180_2 then
			local var_180_1 = var_180_0:RemapHiddenSkillId(arg_180_1)

			if var_180_1 == arg_180_1 then
				var_180_1 = var_180_0:RemapSkillId(arg_180_1)
			end

			return var_180_1
		else
			return var_180_0:RemapSkillId(arg_180_1)
		end
	end

	return arg_180_1
end

function var_0_0.getSkillList(arg_181_0)
	local var_181_0 = pg.ship_data_template[arg_181_0.configId]
	local var_181_1 = Clone(var_181_0.buff_list_display)
	local var_181_2 = Clone(var_181_0.buff_list)
	local var_181_3 = pg.ship_data_trans[arg_181_0.groupId]
	local var_181_4 = 0

	if var_181_3 and var_181_3.skill_id ~= 0 then
		local var_181_5 = var_181_3.skill_id
		local var_181_6 = pg.transform_data_template[var_181_5]

		if arg_181_0.transforms[var_181_5] and var_181_6.skill_id ~= 0 then
			table.insert(var_181_2, var_181_6.skill_id)
		end
	end

	local var_181_7 = {}

	for iter_181_0, iter_181_1 in ipairs(var_181_1) do
		for iter_181_2, iter_181_3 in ipairs(var_181_2) do
			if iter_181_1 == iter_181_3 then
				table.insert(var_181_7, arg_181_0:fateSkillChange(iter_181_1))
			end
		end
	end

	return var_181_7
end

function var_0_0.getModAttrTopLimit(arg_182_0, arg_182_1)
	local var_182_0 = ShipModAttr.ATTR_TO_INDEX[arg_182_1]
	local var_182_1 = pg.ship_data_template[arg_182_0.configId].strengthen_id
	local var_182_2 = pg.ship_data_strengthen[var_182_1].durability[var_182_0]

	return calcFloor((3 + 7 * (math.min(arg_182_0.level, 100) / 100)) * var_182_2 * 0.1)
end

function var_0_0.leftModAdditionPoint(arg_183_0, arg_183_1)
	local var_183_0 = arg_183_0:getModProperties(arg_183_1)
	local var_183_1 = arg_183_0:getModExpRatio(arg_183_1)
	local var_183_2 = arg_183_0:getModAttrTopLimit(arg_183_1)
	local var_183_3 = calcFloor(var_183_0 / var_183_1)

	return math.max(0, var_183_2 - var_183_3)
end

function var_0_0.getModAttrBaseMax(arg_184_0, arg_184_1)
	if not table.contains(arg_184_0:getConfig("lock"), arg_184_1) then
		local var_184_0 = arg_184_0:leftModAdditionPoint(arg_184_1)
		local var_184_1 = arg_184_0:getShipProperties()

		return calcFloor(var_184_1[arg_184_1] + var_184_0)
	else
		return 0
	end
end

function var_0_0.getModExpRatio(arg_185_0, arg_185_1)
	if not table.contains(arg_185_0:getConfig("lock"), arg_185_1) then
		local var_185_0 = pg.ship_data_template[arg_185_0.configId].strengthen_id

		assert(pg.ship_data_strengthen[var_185_0], "ship_data_strengthen>>>>>>" .. var_185_0)

		return math.max(pg.ship_data_strengthen[var_185_0].level_exp[ShipModAttr.ATTR_TO_INDEX[arg_185_1]], 1)
	else
		return 1
	end
end

function var_0_0.inUnlockTip(arg_186_0)
	local var_186_0 = pg.gameset.tip_unlock_shipIds.description[0]

	return table.contains(var_186_0, arg_186_0)
end

function var_0_0.proposeSkinOwned(arg_187_0, arg_187_1)
	return arg_187_1 and arg_187_0.propose and arg_187_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE
end

function var_0_0.getProposeSkin(arg_188_0)
	return ShipSkin.GetSkinByType(arg_188_0.groupId, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getDisplaySkillIds(arg_189_0)
	return _.map(pg.ship_data_template[arg_189_0.configId].buff_list_display, function(arg_190_0)
		return arg_189_0:fateSkillChange(arg_190_0)
	end)
end

function var_0_0.isFullSkillLevel(arg_191_0)
	local var_191_0 = pg.skill_data_template

	for iter_191_0, iter_191_1 in pairs(arg_191_0.skills) do
		if var_191_0[iter_191_1.id].max_level ~= iter_191_1.level then
			return false
		end
	end

	return true
end

function var_0_0.setEquipmentRecord(arg_192_0, arg_192_1, arg_192_2)
	local var_192_0 = "equipment_record" .. "_" .. arg_192_1 .. "_" .. arg_192_0.id

	PlayerPrefs.SetString(var_192_0, table.concat(_.flatten(arg_192_2), ":"))
	PlayerPrefs.Save()
end

function var_0_0.getEquipmentRecord(arg_193_0, arg_193_1)
	if not arg_193_0.equipmentRecords then
		local var_193_0 = "equipment_record" .. "_" .. arg_193_1 .. "_" .. arg_193_0.id
		local var_193_1 = string.split(PlayerPrefs.GetString(var_193_0) or "", ":")
		local var_193_2 = {}

		for iter_193_0 = 1, 3 do
			var_193_2[iter_193_0] = _.map(_.slice(var_193_1, 5 * iter_193_0 - 4, 5), function(arg_194_0)
				return tonumber(arg_194_0)
			end)
		end

		arg_193_0.equipmentRecords = var_193_2
	end

	return arg_193_0.equipmentRecords
end

function var_0_0.SetSpWeaponRecord(arg_195_0, arg_195_1, arg_195_2)
	local var_195_0 = "spweapon_record" .. "_" .. arg_195_1 .. "_" .. arg_195_0.id
	local var_195_1 = _.map({
		1,
		2,
		3
	}, function(arg_196_0)
		local var_196_0 = arg_195_2[arg_196_0]

		if var_196_0 then
			return (var_196_0:GetUID() or 0) .. "," .. var_196_0:GetConfigID()
		else
			return "0,0"
		end
	end)

	PlayerPrefs.SetString(var_195_0, table.concat(var_195_1, ":"))
	PlayerPrefs.Save()
end

function var_0_0.GetSpWeaponRecord(arg_197_0, arg_197_1)
	local var_197_0 = "spweapon_record" .. "_" .. arg_197_1 .. "_" .. arg_197_0.id

	return (_.map(string.split(PlayerPrefs.GetString(var_197_0, ""), ":"), function(arg_198_0)
		local var_198_0 = string.split(arg_198_0, ",")

		assert(var_198_0)

		local var_198_1 = tonumber(var_198_0[1])
		local var_198_2 = tonumber(var_198_0[2])

		if not var_198_2 or var_198_2 == 0 then
			return false
		end

		return (SpWeapon.New({
			id = var_198_2
		}))
	end))
end

function var_0_0.hasEquipEquipmentSkin(arg_199_0)
	for iter_199_0, iter_199_1 in ipairs(arg_199_0.equipments) do
		if iter_199_1 and iter_199_1:hasSkin() then
			return true
		end
	end

	return false
end

function var_0_0.hasCommander(arg_200_0)
	return arg_200_0.commanderId and arg_200_0.commanderId ~= 0
end

function var_0_0.getCommander(arg_201_0)
	return arg_201_0.commanderId
end

function var_0_0.setCommander(arg_202_0, arg_202_1)
	arg_202_0.commanderId = arg_202_1
end

function var_0_0.getSkillIndex(arg_203_0, arg_203_1)
	local var_203_0 = arg_203_0:getSkillList()

	for iter_203_0, iter_203_1 in ipairs(var_203_0) do
		if arg_203_1 == iter_203_1 then
			return iter_203_0
		end
	end
end

function var_0_0.getTactics(arg_204_0)
	return 1, "tactics_attack"
end

function var_0_0.IsBgmSkin(arg_205_0)
	local var_205_0 = arg_205_0:GetSkinConfig()

	return table.contains(var_205_0.tag, ShipSkin.WITH_BGM)
end

function var_0_0.GetSkinBgm(arg_206_0)
	if arg_206_0:IsBgmSkin() then
		return arg_206_0:GetSkinConfig().bgm
	end
end

function var_0_0.isIntensifyMax(arg_207_0)
	local var_207_0 = intProperties(arg_207_0:getShipProperties())

	if arg_207_0:isBluePrintShip() then
		return true
	end

	for iter_207_0, iter_207_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_207_0:getModAttrBaseMax(iter_207_1) ~= var_207_0[iter_207_1] then
			return false
		end
	end

	return true
end

function var_0_0.isRemouldable(arg_208_0)
	return not arg_208_0:isTestShip() and not arg_208_0:isBluePrintShip() and pg.ship_data_trans[arg_208_0.groupId]
end

function var_0_0.isAllRemouldFinish(arg_209_0)
	local var_209_0 = pg.ship_data_trans[arg_209_0.groupId]

	assert(var_209_0, "this ship group without remould config:" .. arg_209_0.groupId)

	for iter_209_0, iter_209_1 in ipairs(var_209_0.transform_list) do
		for iter_209_2, iter_209_3 in ipairs(iter_209_1) do
			local var_209_1 = pg.transform_data_template[iter_209_3[2]]

			if #var_209_1.edit_trans > 0 then
				-- block empty
			elseif not arg_209_0.transforms[iter_209_3[2]] or arg_209_0.transforms[iter_209_3[2]].level < var_209_1.max_level then
				return false
			end
		end
	end

	return true
end

function var_0_0.isSpecialFilter(arg_210_0)
	local var_210_0 = pg.ship_data_statistics[arg_210_0.configId]

	assert(var_210_0, "this ship without statistics:" .. arg_210_0.configId)

	for iter_210_0, iter_210_1 in ipairs(var_210_0.tag_list) do
		if iter_210_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.hasAvailiableSkin(arg_211_0)
	local var_211_0 = getProxy(ShipSkinProxy)
	local var_211_1 = var_211_0:GetAllSkinForShip(arg_211_0)
	local var_211_2 = var_211_0:getRawData()
	local var_211_3 = 0

	for iter_211_0, iter_211_1 in ipairs(var_211_1) do
		if arg_211_0:proposeSkinOwned(iter_211_1) or var_211_2[iter_211_1.id] or var_211_0:hasSkin(iter_211_1.id) then
			var_211_3 = var_211_3 + 1
		end
	end

	return var_211_3 > 0
end

function var_0_0.hasProposeSkin(arg_212_0)
	local var_212_0 = getProxy(ShipSkinProxy)
	local var_212_1 = var_212_0:GetAllSkinForShip(arg_212_0)

	for iter_212_0, iter_212_1 in ipairs(var_212_1) do
		if iter_212_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	local var_212_2 = var_212_0:GetShareSkinsForShip(arg_212_0)

	for iter_212_2, iter_212_3 in ipairs(var_212_2) do
		if iter_212_3.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	return false
end

function var_0_0.HasUniqueSpWeapon(arg_213_0)
	return tobool(pg.spweapon_data_statistics.get_id_list_by_unique[arg_213_0:getGroupId()])
end

function var_0_0.getAircraftReloadCD(arg_214_0)
	local var_214_0 = arg_214_0:getConfigTable().base_list
	local var_214_1 = arg_214_0:getConfigTable().default_equip_list
	local var_214_2 = 0
	local var_214_3 = 0

	for iter_214_0 = 1, 3 do
		local var_214_4 = arg_214_0:getEquip(iter_214_0)
		local var_214_5 = var_214_4 and var_214_4.configId or var_214_1[iter_214_0]
		local var_214_6 = Equipment.getConfigData(var_214_5).type

		if underscore.any(EquipType.AirEquipTypes, function(arg_215_0)
			return var_214_6 == arg_215_0
		end) then
			var_214_2 = var_214_2 + Equipment.GetEquipReloadStatic(var_214_5) * var_214_0[iter_214_0]
			var_214_3 = var_214_3 + var_214_0[iter_214_0]
		end
	end

	local var_214_7 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT

	return {
		name = i18n("equip_info_31"),
		type = AttributeType.CD,
		value = var_214_2 / var_214_3 * var_214_7
	}
end

function var_0_0.IsTagShip(arg_216_0, arg_216_1)
	local var_216_0 = arg_216_0:getConfig("tag_list")

	return table.contains(var_216_0, arg_216_1)
end

function var_0_0.setReMetaSpecialItemVO(arg_217_0, arg_217_1)
	arg_217_0.reMetaSpecialItemVO = arg_217_1
end

function var_0_0.getReMetaSpecialItemVO(arg_218_0, arg_218_1)
	return arg_218_0.reMetaSpecialItemVO
end

function var_0_0.getProposeType(arg_219_0)
	if arg_219_0:isMetaShip() then
		return "meta"
	elseif arg_219_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_220_0)
	return arg_220_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.getSpecificType(arg_221_0)
	return pg.ship_data_template[arg_221_0.configId].specific_type
end

function var_0_0.GetSpWeapon(arg_222_0)
	return arg_222_0.spWeapon
end

function var_0_0.UpdateSpWeapon(arg_223_0, arg_223_1)
	local var_223_0 = (arg_223_1 and arg_223_1:GetUID() or 0) == (arg_223_0.spWeapon and arg_223_0.spWeapon:GetUID() or 0)

	arg_223_0.spWeapon = arg_223_1

	if arg_223_1 then
		arg_223_1:SetShipId(arg_223_0.id)
	end

	if var_223_0 then
		pg.m02:sendNotification(EquipmentProxy.SPWEAPONS_UPDATED)
	end
end

function var_0_0.CanEquipSpWeapon(arg_224_0, arg_224_1)
	local var_224_0, var_224_1 = arg_224_0:IsSpWeaponForbidden(arg_224_1)

	if var_224_0 then
		return false, var_224_1
	end

	return true
end

function var_0_0.IsSpWeaponForbidden(arg_225_0, arg_225_1)
	local var_225_0 = arg_225_1:GetWearableShipTypes()
	local var_225_1 = arg_225_0:getShipType()

	if not table.contains(var_225_0, var_225_1) then
		return true, i18n("spweapon_tip_group_error")
	end

	local var_225_2 = arg_225_1:GetUniqueGroup()
	local var_225_3 = arg_225_0:getGroupId()

	if var_225_2 ~= 0 and var_225_2 ~= var_225_3 then
		return true, i18n("spweapon_tip_group_error")
	end

	return false
end

function var_0_0.GetMapStrikeAnim(arg_226_0)
	local var_226_0
	local var_226_1 = arg_226_0:getShipType()

	switch(ShipType.GetTeamFromShipType(var_226_1), {
		[TeamType.Main] = function()
			if ShipType.IsTypeQuZhu(var_226_1) then
				var_226_0 = "SubTorpedoUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleAircraftCarrier, var_226_1) then
				var_226_0 = "AirStrikeUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleBattleShip, var_226_1) then
				var_226_0 = "CannonUI"
			else
				var_226_0 = "CannonUI"
			end
		end,
		[TeamType.Vanguard] = function()
			if ShipType.IsTypeQuZhu(var_226_1) then
				var_226_0 = "SubTorpedoUI"
			end
		end,
		[TeamType.Submarine] = function()
			if arg_226_0:getNation() == Nation.MOT then
				var_226_0 = "CannonUI"
			else
				var_226_0 = "SubTorpedoUI"
			end
		end
	})

	return var_226_0
end

function var_0_0.IsDefaultSkin(arg_230_0)
	local var_230_0 = arg_230_0:getSkinId()

	return var_230_0 == 0 or var_230_0 == arg_230_0:getConfig("skin_id")
end

function var_0_0.IsMatchKey(arg_231_0, arg_231_1)
	if not arg_231_1 or arg_231_1 == "" then
		return true
	end

	arg_231_1 = string.lower(string.gsub(arg_231_1, "%.", "%%."))

	local var_231_0 = pg._ship_data_statistics[arg_231_0.configId].name
	local var_231_1 = arg_231_0:getName()
	local var_231_2 = {
		var_231_0,
		arg_231_0:GetDefaultName(),
		var_231_1
	}

	return underscore.any(var_231_2, function(arg_232_0)
		return string.find(string.lower(arg_232_0), arg_231_1)
	end)
end

function var_0_0.IsOwner(arg_233_0)
	return tobool(arg_233_0.id)
end

function var_0_0.GetUniqueId(arg_234_0)
	return arg_234_0.id
end

function var_0_0.ShowPropose(arg_235_0)
	if not arg_235_0.propose then
		return false
	else
		return not HXSet.isHxPropose() or arg_235_0:IsOwner() and arg_235_0:GetUniqueId() == getProxy(PlayerProxy):getRawData():GetProposeShipId()
	end
end

function var_0_0.GetColorName(arg_236_0, arg_236_1)
	arg_236_1 = arg_236_1 or arg_236_0:getName()

	if PlayerPrefs.GetInt("SHIP_NAME_COLOR", PLATFORM_CODE == PLATFORM_CH and 1 or 0) == 1 and arg_236_0.propose then
		return setColorStr(arg_236_1, "#FFAACEFF")
	else
		return arg_236_1
	end
end

local var_0_9 = {
	effect = {
		"duang_meta_jiehun",
		"duang_6_jiehun_tuzhi",
		"duang_6_jiehun",
		"duang_meta_%s",
		"duang_6"
	},
	frame = {
		"prop4_1",
		"prop%s",
		"prop"
	}
}

function var_0_0.GetFrameAndEffect(arg_237_0, arg_237_1)
	arg_237_1 = tobool(arg_237_1)

	local var_237_0
	local var_237_1

	if arg_237_0.propose then
		if arg_237_0:isMetaShip() then
			var_237_1 = string.format(var_0_9.effect[1])
			var_237_0 = string.format(var_0_9.frame[1])
		elseif arg_237_0:isBluePrintShip() then
			var_237_1 = string.format(var_0_9.effect[2])
			var_237_0 = string.format(var_0_9.frame[2], arg_237_0:rarity2bgPrint())
		else
			var_237_1 = string.format(var_0_9.effect[3])
			var_237_0 = string.format(var_0_9.frame[3])
		end

		if not arg_237_0:ShowPropose() then
			var_237_0 = nil
		end
	elseif arg_237_0:isMetaShip() then
		var_237_1 = string.format(var_0_9.effect[4], arg_237_0:rarity2bgPrint())
	elseif arg_237_0:getRarity() == ShipRarity.SSR then
		var_237_1 = string.format(var_0_9.effect[5])
	end

	if arg_237_1 then
		var_237_1 = var_237_1 and var_237_1 .. "_1"
	end

	return var_237_0, var_237_1
end

function var_0_0.GetRecordPosKey(arg_238_0)
	return arg_238_0:getSkinId()
end

function var_0_0.GetShipPhantomMark(arg_239_0, arg_239_1)
	return ShipPhantom.PackMark(arg_239_0.id, arg_239_1)
end

function var_0_0.GetSelectMark(arg_240_0)
	return arg_240_0.id
end

return var_0_0
