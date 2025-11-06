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
var_0_0.STATE_NORMAL = 1
var_0_0.STATE_REST = 2
var_0_0.STATE_CLASS = 3
var_0_0.STATE_COLLECT = 4
var_0_0.STATE_TRAIN = 5

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
	local var_21_0 = pg.energy_template
	local var_21_1 = arg_21_0:getEnergy()

	for iter_21_0, iter_21_1 in pairs(var_21_0) do
		if type(iter_21_0) == "number" and var_21_1 >= iter_21_1.lower_bound and var_21_1 <= iter_21_1.upper_bound then
			return iter_21_1
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
	return arg_24_0.intimacy
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
	local var_31_1 = pg.intimacy_template

	for iter_31_0, iter_31_1 in pairs(var_31_1) do
		if type(iter_31_0) == "number" and arg_31_0:getIntimacy() >= iter_31_1.lower_bound and arg_31_0:getIntimacy() <= iter_31_1.upper_bound then
			var_31_0 = iter_31_0

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

	arg_41_0.bluePrintFlag = arg_41_1.blue_print_flag or 0
	arg_41_0.strengthList = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_1.strength_list or {}) do
		if not arg_41_0:isBluePrintShip() then
			local var_41_0 = ShipModAttr.ID_TO_ATTR[iter_41_1.id]

			arg_41_0.strengthList[var_41_0] = iter_41_1.exp
		else
			table.insert(arg_41_0.strengthList, {
				level = iter_41_1.id,
				exp = iter_41_1.exp
			})
		end
	end

	local var_41_1 = arg_41_1.state or {}

	arg_41_0.state = var_41_1.state or 0
	arg_41_0.state_info_1 = var_41_1.state_info_1 or 0
	arg_41_0.state_info_2 = var_41_1.state_info_2 or 0
	arg_41_0.state_info_3 = var_41_1.state_info_3 or 0
	arg_41_0.state_info_4 = var_41_1.state_info_4 or 0
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

	arg_41_0.groupId = pg.ship_data_template[arg_41_0.configId].group_type
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
	return arg_49_0.bluePrintFlag == 1
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

function var_0_0.getPhantomSkin(arg_51_0, arg_51_1)
	if not arg_51_1 or arg_51_1 == 0 then
		return arg_51_0.skinId
	else
		return arg_51_0.phantomDic[arg_51_0.phantomId] or arg_51_0:getConfig("skin_id")
	end
end

function var_0_0.updateSkinId(arg_52_0, arg_52_1, arg_52_2)
	if not arg_52_1 or arg_52_1 == 0 then
		arg_52_1 = arg_52_0:getConfig("skin_id")
	end

	if arg_52_2 == 0 then
		arg_52_0.skinId = arg_52_1
	else
		arg_52_0.phantomDic[arg_52_2] = arg_52_1
	end
end

function var_0_0.getAllShipPhantomMarks(arg_53_0)
	local var_53_0 = getGameset("technology_shadow_num")[1]
	local var_53_1 = {}

	for iter_53_0 = 0, var_53_0 do
		if iter_53_0 == 0 or arg_53_0.phantomDic[iter_53_0] then
			table.insert(var_53_1, ShipPhantom.PackMark(arg_53_0.id, iter_53_0))
		end
	end

	return var_53_1
end

function var_0_0.getAllShipPhantom(arg_54_0)
	local var_54_0 = getGameset("technology_shadow_num")[1]
	local var_54_1 = {}

	for iter_54_0 = 0, var_54_0 do
		if iter_54_0 == 0 or arg_54_0.phantomDic[iter_54_0] then
			table.insert(var_54_1, ShipPhantom.Create(arg_54_0, iter_54_0))
		end
	end

	return var_54_1
end

function var_0_0.updateRandomFlag(arg_55_0, arg_55_1, arg_55_2)
	arg_55_2 = defaultValue(arg_55_2, 0)
	arg_55_0.phantomRandomFlag[arg_55_2] = arg_55_1
end

function var_0_0.getRandomFlag(arg_56_0, arg_56_1)
	return defaultValue(arg_56_0.phantomRandomFlag[arg_56_1 or 0], 0) > 0
end

function var_0_0.getRandomFlagShipPhantomMarks(arg_57_0)
	local var_57_0 = getGameset("technology_shadow_num")[1]
	local var_57_1 = {}

	for iter_57_0 = 0, var_57_0 do
		if defaultValue(arg_57_0.phantomRandomFlag[iter_57_0], 0) > 0 then
			table.insert(var_57_1, arg_57_0:GetShipPhantomMark(iter_57_0))
		end
	end

	return var_57_1
end

function var_0_0.updateName(arg_58_0)
	if arg_58_0.name ~= pg.ship_data_statistics[arg_58_0.configId].name then
		return
	end

	if arg_58_0:isRemoulded() then
		arg_58_0.name = pg.ship_skin_template[arg_58_0:getRemouldSkinId()].name
	else
		arg_58_0.name = pg.ship_data_statistics[arg_58_0.configId].name
	end
end

function var_0_0.isRemoulded(arg_59_0)
	if arg_59_0.remoulded then
		return true
	end

	local var_59_0 = pg.ship_data_trans[arg_59_0.groupId]

	if var_59_0 then
		for iter_59_0, iter_59_1 in ipairs(var_59_0.transform_list) do
			for iter_59_2, iter_59_3 in ipairs(iter_59_1) do
				local var_59_1 = pg.transform_data_template[iter_59_3[2]]

				if var_59_1.skin_id ~= 0 and arg_59_0.transforms[iter_59_3[2]] and arg_59_0.transforms[iter_59_3[2]].level == var_59_1.max_level then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.getRemouldSkinId(arg_60_0)
	local var_60_0 = ShipGroup.getModSkin(arg_60_0.groupId)

	if var_60_0 then
		return var_60_0.id
	end

	return nil
end

function var_0_0.hasEquipmentSkinInPos(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_0.equipments[arg_61_1]

	return var_61_0 and var_61_0:hasSkin()
end

function var_0_0.getPrefab(arg_62_0)
	local var_62_0 = arg_62_0:getSkinId()

	if arg_62_0:hasEquipmentSkinInPos(var_0_2) then
		local var_62_1 = arg_62_0:getEquip(var_0_2)
		local var_62_2 = var_0_7[var_62_1:getSkinId()].ship_skin_id

		var_62_0 = var_62_2 ~= 0 and var_62_2 or var_62_0
	end

	local var_62_3 = pg.ship_skin_template[var_62_0]

	assert(var_62_3, "ship_skin_template not exist: " .. arg_62_0.configId .. " " .. var_62_0)

	return var_62_3.prefab
end

function var_0_0.getAttachmentPrefab(arg_63_0)
	local var_63_0 = {}

	for iter_63_0, iter_63_1 in ipairs(arg_63_0.equipments) do
		if iter_63_1 and iter_63_1:hasSkinOrbit() then
			local var_63_1 = iter_63_1:getSkinId()
			local var_63_2 = var_0_7[var_63_1]

			var_63_0[var_63_1] = {
				config = var_63_2,
				index = iter_63_0
			}
		end
	end

	return var_63_0
end

function var_0_0.getPainting(arg_64_0)
	local var_64_0 = arg_64_0:getSkinId()
	local var_64_1 = pg.ship_skin_template[var_64_0]

	assert(var_64_1, "ship_skin_template not exist: " .. arg_64_0.configId .. " " .. var_64_0)

	return var_64_1.painting
end

function var_0_0.GetSkinConfig(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0:getSkinId()
	local var_65_1 = pg.ship_skin_template[var_65_0]

	assert(var_65_1, "ship_skin_template not exist: " .. arg_65_0.configId .. " " .. var_65_0)

	return var_65_1
end

function var_0_0.getRemouldPainting(arg_66_0)
	local var_66_0 = arg_66_0:getRemouldSkinId()
	local var_66_1 = pg.ship_skin_template[var_66_0]

	assert(var_66_1, "ship_skin_template not exist: " .. arg_66_0.configId .. " " .. var_66_0)

	return var_66_1.painting
end

function var_0_0.updateStateInfo34(arg_67_0, arg_67_1, arg_67_2)
	arg_67_0.state_info_3 = arg_67_1
	arg_67_0.state_info_4 = arg_67_2
end

function var_0_0.hasStateInfo3Or4(arg_68_0)
	return arg_68_0.state_info_3 ~= 0 or arg_68_0.state_info_4 ~= 0
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

function var_0_0.updateState(arg_81_0, arg_81_1)
	arg_81_0.state = arg_81_1
end

function var_0_0.addSkillExp(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_0.skills[arg_82_1] or {
		exp = 0,
		level = 1,
		id = arg_82_1
	}
	local var_82_1 = var_82_0.level and var_82_0.level or 1
	local var_82_2 = pg.skill_need_exp.all[#pg.skill_need_exp.all]

	if var_82_1 == var_82_2 then
		return
	end

	local var_82_3 = var_82_0.exp and arg_82_2 + var_82_0.exp or 0 + arg_82_2

	while var_82_3 >= pg.skill_need_exp[var_82_1].exp do
		var_82_3 = var_82_3 - pg.skill_need_exp[var_82_1].exp
		var_82_1 = var_82_1 + 1

		if var_82_1 == var_82_2 then
			var_82_3 = 0

			break
		end
	end

	arg_82_0:updateSkill({
		id = var_82_0.id,
		level = var_82_1,
		exp = var_82_3
	})
end

function var_0_0.upSkillLevelForMeta(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_0.skills[arg_83_1] or {
		exp = 0,
		level = 0,
		id = arg_83_1
	}
	local var_83_1 = arg_83_0:isSkillLevelMax(arg_83_1)
	local var_83_2 = var_83_0.level

	if not var_83_1 then
		var_83_2 = var_83_2 + 1
	end

	arg_83_0:updateSkill({
		exp = 0,
		id = var_83_0.id,
		level = var_83_2
	})
end

function var_0_0.getMetaSkillLevelBySkillID(arg_84_0, arg_84_1)
	return (arg_84_0.skills[arg_84_1] or {
		exp = 0,
		level = 0,
		id = arg_84_1
	}).level
end

function var_0_0.isSkillLevelMax(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_0.skills[arg_85_1] or {
		exp = 0,
		level = 1,
		id = arg_85_1
	}

	return (var_85_0.level and var_85_0.level or 1) >= pg.skill_data_template[arg_85_1].max_level
end

function var_0_0.isAllMetaSkillLevelMax(arg_86_0)
	local var_86_0 = true
	local var_86_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_86_0.configId)

	for iter_86_0, iter_86_1 in ipairs(var_86_1) do
		if not arg_86_0:isSkillLevelMax(iter_86_1) then
			var_86_0 = false

			break
		end
	end

	return var_86_0
end

function var_0_0.isAllMetaSkillLock(arg_87_0)
	local var_87_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_87_0.configId)
	local var_87_1 = true

	for iter_87_0, iter_87_1 in ipairs(var_87_0) do
		if arg_87_0:getMetaSkillLevelBySkillID(iter_87_1) > 0 then
			var_87_1 = false

			break
		end
	end

	return var_87_1
end

function var_0_0.bindConfigTable(arg_88_0)
	return pg.ship_data_statistics
end

function var_0_0.isAvaiable(arg_89_0)
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

function var_0_0.intimacyAdditions(arg_90_0, arg_90_1)
	local var_90_0 = pg.intimacy_template[arg_90_0:getIntimacyLevel()].attr_bonus * 0.0001

	for iter_90_0, iter_90_1 in pairs(arg_90_1) do
		if iter_90_0 == AttributeType.Durability or iter_90_0 == AttributeType.Cannon or iter_90_0 == AttributeType.Torpedo or iter_90_0 == AttributeType.AntiAircraft or iter_90_0 == AttributeType.AntiSub or iter_90_0 == AttributeType.Air or iter_90_0 == AttributeType.Reload or iter_90_0 == AttributeType.Hit or iter_90_0 == AttributeType.Dodge then
			arg_90_1[iter_90_0] = arg_90_1[iter_90_0] * (var_90_0 + 1)
		end
	end
end

function var_0_0.getShipProperties(arg_91_0)
	local var_91_0 = arg_91_0:getBaseProperties()

	if arg_91_0:isBluePrintShip() then
		local var_91_1 = arg_91_0:getBluePrint()

		assert(var_91_1, "blueprint can not be nil" .. arg_91_0.configId)

		local var_91_2 = var_91_1:getTotalAdditions()

		for iter_91_0, iter_91_1 in pairs(var_91_2) do
			var_91_0[iter_91_0] = var_91_0[iter_91_0] + calcFloor(iter_91_1)
		end

		arg_91_0:intimacyAdditions(var_91_0)
	elseif arg_91_0:isMetaShip() then
		assert(arg_91_0.metaCharacter)

		for iter_91_2, iter_91_3 in pairs(var_91_0) do
			var_91_0[iter_91_2] = var_91_0[iter_91_2] + arg_91_0.metaCharacter:getAttrAddition(iter_91_2)
		end

		arg_91_0:intimacyAdditions(var_91_0)
	else
		local var_91_3 = pg.ship_data_template[arg_91_0.configId].strengthen_id
		local var_91_4 = var_0_5[var_91_3]

		for iter_91_4, iter_91_5 in pairs(arg_91_0.strengthList) do
			local var_91_5 = ShipModAttr.ATTR_TO_INDEX[iter_91_4]
			local var_91_6 = math.min(iter_91_5, var_91_4.durability[var_91_5] * var_91_4.level_exp[var_91_5])
			local var_91_7 = math.max(arg_91_0:getModExpRatio(iter_91_4), 1)

			var_91_0[iter_91_4] = var_91_0[iter_91_4] + calcFloor(var_91_6 / var_91_7)
		end

		arg_91_0:intimacyAdditions(var_91_0)

		for iter_91_6, iter_91_7 in pairs(arg_91_0.transforms) do
			local var_91_8 = pg.transform_data_template[iter_91_7.id].effect

			for iter_91_8 = 1, iter_91_7.level do
				local var_91_9 = var_91_8[iter_91_8] or {}

				for iter_91_9, iter_91_10 in pairs(var_91_0) do
					if var_91_9[iter_91_9] then
						var_91_0[iter_91_9] = var_91_0[iter_91_9] + var_91_9[iter_91_9]
					end
				end
			end
		end
	end

	return var_91_0
end

function var_0_0.getTechNationAddition(arg_92_0, arg_92_1)
	local var_92_0 = getProxy(TechnologyNationProxy)
	local var_92_1 = arg_92_0:getConfig("type")

	if var_92_1 == ShipType.DaoQuV or var_92_1 == ShipType.DaoQuM then
		var_92_1 = ShipType.QuZhu
	end

	return var_92_0:getShipAddition(var_92_1, arg_92_1)
end

function var_0_0.getTechNationMaxAddition(arg_93_0, arg_93_1)
	local var_93_0 = getProxy(TechnologyNationProxy)
	local var_93_1 = arg_93_0:getConfig("type")

	return var_93_0:getShipMaxAddition(var_93_1, arg_93_1)
end

function var_0_0.getEquipProficiencyByPos(arg_94_0, arg_94_1)
	return arg_94_0:getEquipProficiencyList()[arg_94_1]
end

function var_0_0.getEquipProficiencyList(arg_95_0)
	local var_95_0 = arg_95_0:getConfigTable()
	local var_95_1 = Clone(var_95_0.equipment_proficiency)

	if arg_95_0:isBluePrintShip() then
		local var_95_2 = arg_95_0:getBluePrint()

		assert(var_95_2, "blueprint can not be nil >>>" .. arg_95_0.groupId)

		var_95_1 = var_95_2:getEquipProficiencyList(arg_95_0)
	else
		for iter_95_0, iter_95_1 in ipairs(var_95_1) do
			local var_95_3 = 0

			for iter_95_2, iter_95_3 in pairs(arg_95_0.transforms) do
				local var_95_4 = pg.transform_data_template[iter_95_3.id].effect

				for iter_95_4 = 1, iter_95_3.level do
					local var_95_5 = var_95_4[iter_95_4] or {}

					if var_95_5["equipment_proficiency_" .. iter_95_0] then
						var_95_3 = var_95_3 + var_95_5["equipment_proficiency_" .. iter_95_0]
					end
				end
			end

			var_95_1[iter_95_0] = iter_95_1 + var_95_3
		end
	end

	return var_95_1
end

function var_0_0.getBaseProperties(arg_96_0)
	local var_96_0 = arg_96_0:getConfigTable()

	assert(var_96_0, "配置表没有这艘船" .. arg_96_0.configId)

	local var_96_1 = {}
	local var_96_2 = {}

	for iter_96_0, iter_96_1 in ipairs(var_0_0.PROPERTIES) do
		var_96_1[iter_96_1] = arg_96_0:getGrowthForAttr(iter_96_1)
		var_96_2[iter_96_1] = var_96_1[iter_96_1]
	end

	for iter_96_2, iter_96_3 in ipairs(arg_96_0:getConfig("lock")) do
		var_96_2[iter_96_3] = var_96_1[iter_96_3]
	end

	for iter_96_4, iter_96_5 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_96_2[iter_96_5] = var_96_0[iter_96_5]
	end

	for iter_96_6, iter_96_7 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_96_2[iter_96_7] = 0
	end

	return var_96_2
end

function var_0_0.getGrowthForAttr(arg_97_0, arg_97_1)
	local var_97_0 = arg_97_0:getConfigTable()
	local var_97_1 = table.indexof(var_0_0.PROPERTIES, arg_97_1)
	local var_97_2 = pg.gameset.extra_attr_level_limit.key_value
	local var_97_3 = var_97_0.attrs[var_97_1] + (arg_97_0.level - 1) * var_97_0.attrs_growth[var_97_1] / 1000

	if var_97_2 < arg_97_0.level then
		var_97_3 = var_97_3 + (arg_97_0.level - var_97_2) * var_97_0.attrs_growth_extra[var_97_1] / 1000
	end

	return var_97_3
end

function var_0_0.isMaxStar(arg_98_0)
	return arg_98_0:getStar() >= arg_98_0:getMaxStar()
end

function var_0_0.IsMaxStarByTmpID(arg_99_0)
	local var_99_0 = pg.ship_data_template[arg_99_0]

	return var_99_0.star >= var_99_0.star_max
end

function var_0_0.IsSpweaponUnlock(arg_100_0)
	if not arg_100_0:CanAccumulateExp() then
		return false, "spweapon_tip_locked"
	else
		return true
	end
end

function var_0_0.getModProperties(arg_101_0, arg_101_1)
	return arg_101_0.strengthList[arg_101_1] or 0
end

function var_0_0.addModAttrExp(arg_102_0, arg_102_1, arg_102_2)
	local var_102_0 = arg_102_0:getModAttrTopLimit(arg_102_1)

	if var_102_0 == 0 then
		return
	end

	local var_102_1 = arg_102_0:getModExpRatio(arg_102_1)
	local var_102_2 = arg_102_0:getModProperties(arg_102_1)

	if var_102_2 + arg_102_2 > var_102_0 * var_102_1 then
		arg_102_0.strengthList[arg_102_1] = var_102_0 * var_102_1
	else
		arg_102_0.strengthList[arg_102_1] = var_102_2 + arg_102_2
	end
end

function var_0_0.getNeedModExp(arg_103_0)
	local var_103_0 = {}

	for iter_103_0, iter_103_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_103_1 = arg_103_0:getModAttrTopLimit(iter_103_1)

		if var_103_1 == 0 then
			var_103_0[iter_103_1] = 0
		else
			var_103_0[iter_103_1] = var_103_1 * arg_103_0:getModExpRatio(iter_103_1) - arg_103_0:getModProperties(iter_103_1)
		end
	end

	return var_103_0
end

function var_0_0.attrVertify(arg_104_0)
	if not BayProxy.checkShiplevelVertify(arg_104_0) then
		return false
	end

	for iter_104_0, iter_104_1 in ipairs(arg_104_0.equipments) do
		if iter_104_1 and not iter_104_1:vertify() then
			return false
		end
	end

	return true
end

function var_0_0.getEquipmentProperties(arg_105_0)
	local var_105_0 = {}
	local var_105_1 = {}

	for iter_105_0, iter_105_1 in ipairs(var_0_0.PROPERTIES) do
		var_105_0[iter_105_1] = 0
	end

	for iter_105_2, iter_105_3 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_105_0[iter_105_3] = 0
	end

	for iter_105_4, iter_105_5 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_105_0[iter_105_5] = 0
	end

	for iter_105_6, iter_105_7 in ipairs(var_0_0.PROPERTIES_ENHANCEMENT) do
		var_105_1[iter_105_7] = 0
	end

	var_105_0[AttributeType.AirDominate] = 0
	var_105_0[AttributeType.AntiSiren] = 0

	local var_105_2 = arg_105_0:getActiveEquipments()

	for iter_105_8, iter_105_9 in ipairs(var_105_2) do
		if iter_105_9 then
			local var_105_3 = iter_105_9:GetAttributes()

			for iter_105_10, iter_105_11 in ipairs(var_105_3) do
				if iter_105_11 and var_105_0[iter_105_11.type] then
					var_105_0[iter_105_11.type] = var_105_0[iter_105_11.type] + iter_105_11.value
				end
			end

			local var_105_4 = iter_105_9:GetPropertyRate()

			for iter_105_12, iter_105_13 in pairs(var_105_4) do
				var_105_1[iter_105_12] = math.max(var_105_1[iter_105_12], iter_105_13)
			end

			local var_105_5 = iter_105_9:GetSonarProperty()

			if var_105_5 then
				for iter_105_14, iter_105_15 in pairs(var_105_5) do
					var_105_0[iter_105_14] = var_105_0[iter_105_14] + iter_105_15
				end
			end

			local var_105_6 = iter_105_9:GetAntiSirenPower()

			if var_105_6 then
				var_105_0[AttributeType.AntiSiren] = var_105_0[AttributeType.AntiSiren] + var_105_6 / 10000
			end
		end
	end

	;(function()
		local var_106_0 = arg_105_0:GetSpWeapon()

		if not var_106_0 then
			return
		end

		local var_106_1 = var_106_0:GetPropertiesInfo().attrs

		for iter_106_0, iter_106_1 in ipairs(var_106_1) do
			if iter_106_1 and var_105_0[iter_106_1.type] then
				var_105_0[iter_106_1.type] = var_105_0[iter_106_1.type] + iter_106_1.value
			end
		end
	end)()

	for iter_105_16, iter_105_17 in pairs(var_105_1) do
		var_105_1[iter_105_16] = iter_105_17 + 1
	end

	return var_105_0, var_105_1
end

function var_0_0.getSkillEffects(arg_107_0)
	local var_107_0 = arg_107_0:getShipSkillEffects()

	_.each(arg_107_0:getEquipmentSkillEffects(), function(arg_108_0)
		table.insert(var_107_0, arg_108_0)
	end)

	return var_107_0
end

function var_0_0.getShipSkillEffects(arg_109_0)
	local var_109_0 = {}
	local var_109_1 = arg_109_0:getSkillList()

	for iter_109_0, iter_109_1 in ipairs(var_109_1) do
		local var_109_2 = arg_109_0:RemapSkillId(iter_109_1)
		local var_109_3 = pg.buffCfg["buff_" .. var_109_2]

		arg_109_0:FilterActiveSkill(var_109_0, var_109_3, arg_109_0.skills[iter_109_1])
	end

	return var_109_0
end

function var_0_0.getEquipmentSkillEffects(arg_110_0)
	local var_110_0 = {}
	local var_110_1 = arg_110_0:getActiveEquipments()

	for iter_110_0, iter_110_1 in ipairs(var_110_1) do
		local var_110_2
		local var_110_3 = iter_110_1 and iter_110_1:getConfig("skill_id")[1] and iter_110_1:getConfig("skill_id")[1][1]

		if var_110_3 then
			var_110_2 = pg.buffCfg["buff_" .. var_110_3]
		end

		arg_110_0:FilterActiveSkill(var_110_0, var_110_2)
	end

	;(function()
		local var_111_0 = arg_110_0:GetSpWeapon()
		local var_111_1 = var_111_0 and var_111_0:GetEffect() or 0
		local var_111_2

		if var_111_1 > 0 then
			var_111_2 = pg.buffCfg["buff_" .. var_111_1]
		end

		arg_110_0:FilterActiveSkill(var_110_0, var_111_2)
	end)()

	return var_110_0
end

function var_0_0.FilterActiveSkill(arg_112_0, arg_112_1, arg_112_2, arg_112_3)
	if not arg_112_2 or not arg_112_2.const_effect_list then
		return
	end

	for iter_112_0 = 1, #arg_112_2.const_effect_list do
		local var_112_0 = arg_112_2.const_effect_list[iter_112_0]
		local var_112_1 = var_112_0.trigger
		local var_112_2 = var_112_0.arg_list
		local var_112_3 = 1

		if arg_112_3 then
			var_112_3 = arg_112_3.level

			local var_112_4 = arg_112_2[var_112_3].const_effect_list

			if var_112_4 and var_112_4[iter_112_0] then
				var_112_1 = var_112_4[iter_112_0].trigger or var_112_1
				var_112_2 = var_112_4[iter_112_0].arg_list or var_112_2
			end
		end

		local var_112_5 = true

		for iter_112_1, iter_112_2 in pairs(var_112_1) do
			if arg_112_0.triggers[iter_112_1] ~= iter_112_2 then
				var_112_5 = false

				break
			end
		end

		if var_112_5 then
			table.insert(arg_112_1, {
				type = var_112_0.type,
				arg_list = var_112_2,
				level = var_112_3
			})
		end
	end
end

function var_0_0.getEquipmentGearScore(arg_113_0)
	local var_113_0 = 0
	local var_113_1 = arg_113_0:getActiveEquipments()

	for iter_113_0, iter_113_1 in ipairs(var_113_1) do
		if iter_113_1 then
			var_113_0 = var_113_0 + iter_113_1:GetGearScore()
		end
	end

	return var_113_0
end

function var_0_0.getProperties(arg_114_0, arg_114_1, arg_114_2, arg_114_3, arg_114_4)
	local var_114_0 = arg_114_1 or {}
	local var_114_1 = arg_114_0:getConfig("nationality")
	local var_114_2 = arg_114_0:getConfig("type")
	local var_114_3 = arg_114_0:getShipProperties()
	local var_114_4, var_114_5 = arg_114_0:getEquipmentProperties()
	local var_114_6
	local var_114_7
	local var_114_8

	if arg_114_3 and arg_114_0:getFlag("inWorld") then
		local var_114_9 = WorldConst.FetchWorldShip(arg_114_0.id)

		var_114_6, var_114_7 = var_114_9:GetShipBuffProperties()
		var_114_8 = var_114_9:GetShipPowerBuffProperties()
	end

	for iter_114_0, iter_114_1 in ipairs(var_0_0.PROPERTIES) do
		local var_114_10 = 0
		local var_114_11 = 0

		for iter_114_2, iter_114_3 in pairs(var_114_0) do
			var_114_10 = var_114_10 + iter_114_3:getAttrRatioAddition(iter_114_1, var_114_1, var_114_2) / 100
			var_114_11 = var_114_11 + iter_114_3:getAttrValueAddition(iter_114_1, var_114_1, var_114_2)
		end

		local var_114_12 = var_114_10 + (var_114_5[iter_114_1] or 1)
		local var_114_13 = var_114_7 and var_114_7[iter_114_1] or 1
		local var_114_14 = var_114_6 and var_114_6[iter_114_1] or 0

		if iter_114_1 == AttributeType.Speed then
			var_114_3[iter_114_1] = var_114_3[iter_114_1] * var_114_12 * var_114_13 + var_114_11 + var_114_4[iter_114_1] + var_114_14
		else
			var_114_3[iter_114_1] = calcFloor(calcFloor(var_114_3[iter_114_1]) * var_114_12 * var_114_13) + var_114_11 + var_114_4[iter_114_1] + var_114_14
		end
	end

	if not arg_114_2 and arg_114_0:isMaxStar() then
		for iter_114_4, iter_114_5 in pairs(var_114_3) do
			local var_114_15 = arg_114_4 and arg_114_0:getTechNationMaxAddition(iter_114_4) or arg_114_0:getTechNationAddition(iter_114_4)

			var_114_3[iter_114_4] = var_114_3[iter_114_4] + var_114_15
		end
	end

	for iter_114_6, iter_114_7 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_114_3[iter_114_7] = var_114_3[iter_114_7] + var_114_4[iter_114_7]
	end

	for iter_114_8, iter_114_9 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_114_3[iter_114_9] = var_114_3[iter_114_9] + var_114_4[iter_114_9]
	end

	if arg_114_3 then
		var_114_3[AttributeType.AntiSiren] = (var_114_3[AttributeType.AntiSiren] or 0) + var_114_4[AttributeType.AntiSiren]
	end

	if var_114_8 then
		for iter_114_10, iter_114_11 in pairs(var_114_8) do
			if var_114_3[iter_114_10] then
				if iter_114_10 == AttributeType.Speed then
					var_114_3[iter_114_10] = var_114_3[iter_114_10] * iter_114_11
				else
					var_114_3[iter_114_10] = math.floor(var_114_3[iter_114_10] * iter_114_11)
				end
			end
		end
	end

	return var_114_3
end

function var_0_0.getTransGearScore(arg_115_0)
	local var_115_0 = 0
	local var_115_1 = pg.transform_data_template

	for iter_115_0, iter_115_1 in pairs(arg_115_0.transforms) do
		for iter_115_2 = 1, iter_115_1.level do
			var_115_0 = var_115_0 + (var_115_1[iter_115_1.id].gear_score[iter_115_2] or 0)
		end
	end

	return var_115_0
end

function var_0_0.getShipCombatPower(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_0:getProperties(arg_116_1, nil, nil, true)
	local var_116_1 = var_116_0[AttributeType.Durability] / 5 + var_116_0[AttributeType.Cannon] + var_116_0[AttributeType.Torpedo] + var_116_0[AttributeType.AntiAircraft] + var_116_0[AttributeType.Air] + var_116_0[AttributeType.AntiSub] + var_116_0[AttributeType.Reload] + var_116_0[AttributeType.Hit] * 2 + var_116_0[AttributeType.Dodge] * 2 + var_116_0[AttributeType.Speed] + arg_116_0:getEquipmentGearScore() + arg_116_0:getTransGearScore()

	return math.floor(var_116_1)
end

function var_0_0.cosumeEnergy(arg_117_0, arg_117_1)
	arg_117_0:setEnergy(math.max(arg_117_0:getEnergy() - arg_117_1, 0))
end

function var_0_0.addEnergy(arg_118_0, arg_118_1)
	arg_118_0:setEnergy(arg_118_0:getEnergy() + arg_118_1)
end

function var_0_0.setEnergy(arg_119_0, arg_119_1)
	arg_119_0.energy = arg_119_1
end

function var_0_0.setLikability(arg_120_0, arg_120_1)
	assert(arg_120_1 >= 0 and arg_120_1 <= arg_120_0.maxIntimacy, "intimacy value invaild" .. arg_120_1)
	arg_120_0:setIntimacy(arg_120_1)
end

function var_0_0.addLikability(arg_121_0, arg_121_1)
	local var_121_0 = Mathf.Clamp(arg_121_0:getIntimacy() + arg_121_1, 0, arg_121_0.maxIntimacy)

	arg_121_0:setIntimacy(var_121_0)
end

function var_0_0.setIntimacy(arg_122_0, arg_122_1)
	if arg_122_1 > 10000 and not arg_122_0.propose then
		arg_122_1 = 10000
	end

	arg_122_0.intimacy = arg_122_1

	if not arg_122_0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[arg_122_0.groupId]:updateMaxIntimacy(arg_122_0:getIntimacy())
	end
end

function var_0_0.getLevelExpConfig(arg_123_0, arg_123_1)
	if arg_123_0:getConfig("rarity") == ShipRarity.SSR then
		local var_123_0 = Clone(getConfigFromLevel1(var_0_6, arg_123_1 or arg_123_0.level))

		var_123_0.exp = var_123_0.exp_ur
		var_123_0.exp_start = var_123_0.exp_ur_start
		var_123_0.exp_interval = var_123_0.exp_ur_interval
		var_123_0.exp_end = var_123_0.exp_ur_end

		return var_123_0
	else
		return getConfigFromLevel1(var_0_6, arg_123_1 or arg_123_0.level)
	end
end

function var_0_0.getExp(arg_124_0)
	local var_124_0 = arg_124_0:getMaxLevel()

	if arg_124_0.level == var_124_0 and LOCK_FULL_EXP then
		return 0
	end

	return arg_124_0.exp
end

function var_0_0.getProficiency(arg_125_0)
	return arg_125_0.proficiency
end

function var_0_0.addExp(arg_126_0, arg_126_1, arg_126_2)
	local var_126_0 = arg_126_0:getMaxLevel()

	if arg_126_0.level == var_126_0 then
		if arg_126_0.exp >= pg.gameset.exp_overflow_max.key_value then
			return
		end

		if LOCK_FULL_EXP or not arg_126_2 or not arg_126_0:CanAccumulateExp() then
			arg_126_1 = 0
		end
	end

	arg_126_0.exp = arg_126_0.exp + arg_126_1

	local var_126_1 = false

	while arg_126_0:canLevelUp() do
		arg_126_0.exp = arg_126_0.exp - arg_126_0:getLevelExpConfig().exp_interval
		arg_126_0.level = math.min(arg_126_0.level + 1, var_126_0)
		var_126_1 = true
	end

	if arg_126_0.level == var_126_0 then
		if arg_126_2 and arg_126_0:CanAccumulateExp() then
			arg_126_0.exp = math.min(arg_126_0.exp, pg.gameset.exp_overflow_max.key_value)
		elseif var_126_1 then
			arg_126_0.exp = 0
		end
	end
end

function var_0_0.getMaxLevel(arg_127_0)
	return arg_127_0.maxLevel
end

function var_0_0.canLevelUp(arg_128_0)
	local var_128_0 = arg_128_0:getLevelExpConfig(arg_128_0.level + 1)
	local var_128_1 = arg_128_0:getMaxLevel() <= arg_128_0.level

	return var_128_0 and arg_128_0:getLevelExpConfig().exp_interval <= arg_128_0.exp and not var_128_1
end

function var_0_0.getConfigMaxLevel(arg_129_0)
	return var_0_6.all[#var_0_6.all]
end

function var_0_0.isConfigMaxLevel(arg_130_0)
	return arg_130_0.level == arg_130_0:getConfigMaxLevel()
end

function var_0_0.updateMaxLevel(arg_131_0, arg_131_1)
	local var_131_0 = arg_131_0:getConfigMaxLevel()

	arg_131_0.maxLevel = math.max(math.min(var_131_0, arg_131_1), arg_131_0.maxLevel)
end

function var_0_0.getNextMaxLevel(arg_132_0)
	local var_132_0 = arg_132_0:getConfigMaxLevel()

	for iter_132_0 = arg_132_0:getMaxLevel() + 1, var_132_0 do
		if var_0_6[iter_132_0].level_limit == 1 then
			return iter_132_0
		end
	end
end

function var_0_0.canUpgrade(arg_133_0)
	if arg_133_0:isBluePrintShip() then
		return false
	end

	if arg_133_0:isMetaShip() then
		local var_133_0 = arg_133_0:getMetaCharacter()

		if not var_133_0 then
			return false
		end

		local var_133_1 = var_133_0:getBreakOutInfo()

		if not var_133_1:hasNextInfo() then
			return false
		end

		local var_133_2, var_133_3 = var_133_1:getLimited()

		if var_133_2 > arg_133_0.level then
			return false
		end

		return true
	else
		local var_133_4 = var_0_8[arg_133_0.configId]

		assert(var_133_4, "不存在配置" .. arg_133_0.configId)

		return not arg_133_0:isMaxStar() and arg_133_0.level >= var_133_4.level
	end
end

function var_0_0.isReachNextMaxLevel(arg_134_0)
	return arg_134_0.level == arg_134_0:getMaxLevel() and arg_134_0:CanAccumulateExp() and arg_134_0:getNextMaxLevel() ~= nil
end

function var_0_0.isAwakening(arg_135_0)
	return arg_135_0:isReachNextMaxLevel() and arg_135_0.level < var_0_4
end

function var_0_0.isAwakening2(arg_136_0)
	return arg_136_0:isReachNextMaxLevel() and arg_136_0.level >= var_0_4
end

function var_0_0.notMaxLevelForFilter(arg_137_0)
	return arg_137_0.level ~= arg_137_0:getMaxLevel()
end

function var_0_0.getNextMaxLevelConsume(arg_138_0)
	local var_138_0 = arg_138_0:getMaxLevel()
	local var_138_1 = var_0_6[var_138_0]["need_item_rarity" .. arg_138_0:getConfig("rarity")]

	assert(var_138_1, "items  can not be nil")

	return _.map(var_138_1, function(arg_139_0)
		return {
			type = arg_139_0[1],
			id = arg_139_0[2],
			count = arg_139_0[3]
		}
	end)
end

function var_0_0.canUpgradeMaxLevel(arg_140_0)
	if not arg_140_0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		local var_140_0 = getProxy(PlayerProxy):getData()
		local var_140_1 = getProxy(BagProxy)
		local var_140_2 = arg_140_0:getNextMaxLevelConsume()

		for iter_140_0, iter_140_1 in pairs(var_140_2) do
			if iter_140_1.type == DROP_TYPE_RESOURCE then
				if var_140_0:getResById(iter_140_1.id) < iter_140_1.count then
					return false, i18n("common_no_resource")
				end
			elseif iter_140_1.type == DROP_TYPE_ITEM and var_140_1:getItemCountById(iter_140_1.id) < iter_140_1.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

function var_0_0.CanAccumulateExp(arg_141_0)
	return pg.ship_data_template[arg_141_0.configId].can_get_proficency == 1
end

function var_0_0.getTotalExp(arg_142_0)
	return arg_142_0:getLevelExpConfig().exp_start + arg_142_0.exp
end

function var_0_0.getStartBattleExpend(arg_143_0)
	if table.contains(TeamType.SubShipType, arg_143_0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[arg_143_0.configId].oil_at_start
	end
end

function var_0_0.getEndBattleExpend(arg_144_0)
	local var_144_0 = pg.ship_data_template[arg_144_0.configId]
	local var_144_1 = arg_144_0:getLevelExpConfig()

	return (math.floor(var_144_0.oil_at_end * var_144_1.fight_oil_ratio / 10000))
end

function var_0_0.getBattleTotalExpend(arg_145_0)
	return arg_145_0:getStartBattleExpend() + arg_145_0:getEndBattleExpend()
end

function var_0_0.getShipAmmo(arg_146_0)
	local var_146_0 = arg_146_0:getConfig(AttributeType.Ammo)

	for iter_146_0, iter_146_1 in pairs(arg_146_0:getAllSkills()) do
		local var_146_1 = tonumber(iter_146_0 .. string.format("%.2d", iter_146_1.level))
		local var_146_2 = pg.skill_benefit_template[var_146_1]

		if var_146_2 and arg_146_0:IsBenefitSkillActive(var_146_2) and (var_146_2.type == var_0_0.BENEFIT_EQUIP or var_146_2.type == var_0_0.BENEFIT_SKILL) then
			var_146_0 = var_146_0 + defaultValue(var_146_2.effect[1], 0)
		end
	end

	local var_146_3 = arg_146_0:getActiveEquipments()

	for iter_146_2, iter_146_3 in ipairs(var_146_3) do
		local var_146_4 = iter_146_3 and iter_146_3:getConfig("equip_parameters").ammo

		if var_146_4 then
			var_146_0 = var_146_0 + var_146_4
		end
	end

	return var_146_0
end

function var_0_0.getHuntingLv(arg_147_0)
	local var_147_0 = arg_147_0:getConfig("huntingrange_level")

	for iter_147_0, iter_147_1 in pairs(arg_147_0:getAllSkills()) do
		local var_147_1 = tonumber(iter_147_0 .. string.format("%.2d", iter_147_1.level))
		local var_147_2 = pg.skill_benefit_template[var_147_1]

		if var_147_2 and arg_147_0:IsBenefitSkillActive(var_147_2) and (var_147_2.type == var_0_0.BENEFIT_EQUIP or var_147_2.type == var_0_0.BENEFIT_SKILL) then
			var_147_0 = var_147_0 + defaultValue(var_147_2.effect[2], 0)
		end
	end

	local var_147_3 = arg_147_0:getActiveEquipments()

	for iter_147_2, iter_147_3 in ipairs(var_147_3) do
		local var_147_4 = iter_147_3 and iter_147_3:getConfig("equip_parameters").hunting_lv

		if var_147_4 then
			var_147_0 = var_147_0 + var_147_4
		end
	end

	return (math.min(var_147_0, arg_147_0:getMaxHuntingLv()))
end

function var_0_0.getMapAuras(arg_148_0)
	local var_148_0 = {}

	for iter_148_0, iter_148_1 in pairs(arg_148_0:getAllSkills()) do
		local var_148_1 = tonumber(iter_148_0 .. string.format("%.2d", iter_148_1.level))
		local var_148_2 = pg.skill_benefit_template[var_148_1]

		if var_148_2 and arg_148_0:IsBenefitSkillActive(var_148_2) and var_148_2.type == var_0_0.BENEFIT_MAP_AURA then
			local var_148_3 = {
				id = var_148_2.effect[1],
				level = iter_148_1.level
			}

			table.insert(var_148_0, var_148_3)
		end
	end

	return var_148_0
end

function var_0_0.getMapAids(arg_149_0)
	local var_149_0 = {}

	for iter_149_0, iter_149_1 in pairs(arg_149_0:getAllSkills()) do
		local var_149_1 = tonumber(iter_149_0 .. string.format("%.2d", iter_149_1.level))
		local var_149_2 = pg.skill_benefit_template[var_149_1]

		if var_149_2 and arg_149_0:IsBenefitSkillActive(var_149_2) and var_149_2.type == var_0_0.BENEFIT_AID then
			local var_149_3 = {
				id = var_149_2.effect[1],
				level = iter_149_1.level
			}

			table.insert(var_149_0, var_149_3)
		end
	end

	return var_149_0
end

var_0_0.BENEFIT_SKILL = 2
var_0_0.BENEFIT_EQUIP = 3
var_0_0.BENEFIT_MAP_AURA = 4
var_0_0.BENEFIT_AID = 5

function var_0_0.IsBenefitSkillActive(arg_150_0, arg_150_1)
	local var_150_0 = false

	if arg_150_1.type == var_0_0.BENEFIT_SKILL then
		if not arg_150_1.limit[1] or arg_150_1.limit[1] == arg_150_0.triggers.TeamNumbers then
			var_150_0 = true
		end
	elseif arg_150_1.type == var_0_0.BENEFIT_EQUIP then
		local var_150_1 = arg_150_1.limit
		local var_150_2 = arg_150_0:getAllEquipments()

		for iter_150_0, iter_150_1 in ipairs(var_150_2) do
			if iter_150_1 and table.contains(var_150_1, iter_150_1:getConfig("id")) then
				var_150_0 = true

				break
			end
		end
	elseif arg_150_1.type == var_0_0.BENEFIT_MAP_AURA then
		if arg_150_0.hpRant and arg_150_0.hpRant > 0 then
			return true
		end
	elseif arg_150_1.type == var_0_0.BENEFIT_AID and arg_150_0.hpRant and arg_150_0.hpRant > 0 then
		return true
	end

	return var_150_0
end

function var_0_0.getMaxHuntingLv(arg_151_0)
	return #arg_151_0:getConfig("hunting_range")
end

function var_0_0.getHuntingRange(arg_152_0, arg_152_1)
	local var_152_0 = arg_152_0:getConfig("hunting_range")
	local var_152_1 = Clone(var_152_0[1])
	local var_152_2 = arg_152_1 or arg_152_0:getHuntingLv()
	local var_152_3 = math.min(var_152_2, arg_152_0:getMaxHuntingLv())

	for iter_152_0 = 2, var_152_3 do
		_.each(var_152_0[iter_152_0], function(arg_153_0)
			table.insert(var_152_1, {
				arg_153_0[1],
				arg_153_0[2]
			})
		end)
	end

	return var_152_1
end

function var_0_0.getTriggerSkills(arg_154_0)
	local var_154_0 = {}
	local var_154_1 = arg_154_0:getSkillEffects()

	_.each(var_154_1, function(arg_155_0)
		if arg_155_0.type == "AddBuff" and arg_155_0.arg_list and arg_155_0.arg_list.buff_id then
			local var_155_0 = arg_155_0.arg_list.buff_id

			var_154_0[var_155_0] = {
				id = var_155_0,
				level = arg_155_0.level
			}
		end
	end)

	return var_154_0
end

function var_0_0.GetEquipmentSkills(arg_156_0)
	local var_156_0 = {}
	local var_156_1 = arg_156_0:getActiveEquipments()

	for iter_156_0, iter_156_1 in ipairs(var_156_1) do
		if iter_156_1 and iter_156_1:getConfig("skill_id")[1] then
			local var_156_2, var_156_3 = unpack(iter_156_1:getConfig("skill_id")[1])

			var_156_0[var_156_2] = {
				id = var_156_2,
				level = var_156_3
			}
		end
	end

	;(function()
		local var_157_0 = arg_156_0:GetSpWeapon()
		local var_157_1 = var_157_0 and var_157_0:GetEffect() or 0

		if var_157_1 > 0 then
			var_156_0[var_157_1] = {
				level = 1,
				id = var_157_1
			}
		end
	end)()

	return var_156_0
end

function var_0_0.getAllSkills(arg_158_0)
	local var_158_0 = Clone(arg_158_0.skills)

	for iter_158_0, iter_158_1 in pairs(arg_158_0:GetEquipmentSkills()) do
		var_158_0[iter_158_0] = iter_158_1
	end

	for iter_158_2, iter_158_3 in pairs(arg_158_0:getTriggerSkills()) do
		var_158_0[iter_158_2] = iter_158_3
	end

	return var_158_0
end

function var_0_0.isSameKind(arg_159_0, arg_159_1)
	return pg.ship_data_template[arg_159_0.configId].group_type == pg.ship_data_template[arg_159_1.configId].group_type
end

function var_0_0.GetLockState(arg_160_0)
	return arg_160_0.lockState
end

function var_0_0.IsLocked(arg_161_0)
	return arg_161_0.lockState == var_0_0.LOCK_STATE_LOCK
end

function var_0_0.SetLockState(arg_162_0, arg_162_1)
	arg_162_0.lockState = arg_162_1
end

function var_0_0.GetPreferenceTag(arg_163_0)
	return arg_163_0.preferenceTag or 0
end

function var_0_0.IsPreferenceTag(arg_164_0)
	return arg_164_0:GetPreferenceTag() == var_0_0.PREFERENCE_TAG_COMMON
end

function var_0_0.SetPreferenceTag(arg_165_0, arg_165_1)
	arg_165_0.preferenceTag = arg_165_1
end

function var_0_0.calReturnRes(arg_166_0)
	local var_166_0 = pg.ship_data_by_type[arg_166_0:getShipType()]
	local var_166_1 = var_166_0.distory_resource_gold_ratio
	local var_166_2 = var_166_0.distory_resource_oil_ratio
	local var_166_3 = pg.ship_data_by_star[arg_166_0:getConfig("rarity")].destory_item

	return var_166_1, 0, var_166_3
end

function var_0_0.getRarity(arg_167_0)
	local var_167_0 = arg_167_0:getConfig("rarity")

	if arg_167_0:isRemoulded() then
		var_167_0 = var_167_0 + 1
	end

	return var_167_0
end

function var_0_0.updateSkill(arg_168_0, arg_168_1)
	local var_168_0 = arg_168_1.skill_id or arg_168_1.id
	local var_168_1 = arg_168_1.skill_lv or arg_168_1.lv or arg_168_1.level
	local var_168_2 = arg_168_1.skill_exp or arg_168_1.exp

	arg_168_0.skills[var_168_0] = {
		id = var_168_0,
		level = var_168_1,
		exp = var_168_2
	}
end

function var_0_0.canEquipAtPos(arg_169_0, arg_169_1, arg_169_2)
	local var_169_0, var_169_1 = arg_169_0:isForbiddenAtPos(arg_169_1, arg_169_2)

	if var_169_0 then
		return false, var_169_1
	end

	for iter_169_0, iter_169_1 in ipairs(arg_169_0.equipments) do
		if iter_169_1 and iter_169_0 ~= arg_169_2 and iter_169_1:getConfig("equip_limit") ~= 0 and arg_169_1:getConfig("equip_limit") == iter_169_1:getConfig("equip_limit") then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

function var_0_0.isForbiddenAtPos(arg_170_0, arg_170_1, arg_170_2)
	local var_170_0 = pg.ship_data_template[arg_170_0.configId]

	assert(var_170_0, "can not find ship in ship_data_templtae: " .. arg_170_0.configId)

	local var_170_1 = var_170_0["equip_" .. arg_170_2]

	if not table.contains(var_170_1, arg_170_1:getConfig("type")) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(arg_170_1:getConfig("ship_type_forbidden"), arg_170_0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

function var_0_0.canEquipCommander(arg_171_0, arg_171_1)
	if arg_171_1:getShipType() ~= arg_171_0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

function var_0_0.upgrade(arg_172_0)
	local var_172_0 = pg.ship_data_transform[arg_172_0.configId]

	if var_172_0.trans_id and var_172_0.trans_id > 0 then
		arg_172_0.configId = var_172_0.trans_id
		arg_172_0.star = arg_172_0:getConfig("star")
	end
end

function var_0_0.getTeamType(arg_173_0)
	return TeamType.GetTeamFromShipType(arg_173_0:getShipType())
end

function var_0_0.getFleetName(arg_174_0)
	local var_174_0 = arg_174_0:getTeamType()

	return var_0_1[var_174_0]
end

function var_0_0.getMaxConfigId(arg_175_0)
	local var_175_0 = pg.ship_data_template
	local var_175_1

	for iter_175_0 = 4, 1, -1 do
		local var_175_2 = tonumber(arg_175_0.groupId .. iter_175_0)

		if var_175_0[var_175_2] then
			var_175_1 = var_175_2

			break
		end
	end

	return var_175_1
end

function var_0_0.getFlag(arg_176_0, arg_176_1, arg_176_2)
	return pg.ShipFlagMgr.GetInstance():GetShipFlag(arg_176_0.id, arg_176_1, arg_176_2)
end

function var_0_0.hasAnyFlag(arg_177_0, arg_177_1)
	return _.any(arg_177_1, function(arg_178_0)
		return arg_177_0:getFlag(arg_178_0)
	end)
end

function var_0_0.isBreakOut(arg_179_0)
	return arg_179_0.configId % 10 > 1
end

function var_0_0.fateSkillChange(arg_180_0, arg_180_1)
	if not arg_180_0.skillChangeList then
		arg_180_0.skillChangeList = arg_180_0:isBluePrintShip() and arg_180_0:getBluePrint():getChangeSkillList() or {}
	end

	for iter_180_0, iter_180_1 in ipairs(arg_180_0.skillChangeList) do
		if iter_180_1[1] == arg_180_1 and arg_180_0.skills[iter_180_1[2]] then
			return iter_180_1[2]
		end
	end

	return arg_180_1
end

function var_0_0.RemapSkillId(arg_181_0, arg_181_1)
	local var_181_0 = arg_181_0:GetSpWeapon()

	if var_181_0 then
		if table.contains(pg.ship_data_template[arg_181_0.configId].hide_buff_list, arg_181_1) then
			return var_181_0:RemapHiddenSkillId(arg_181_1)
		else
			return var_181_0:RemapSkillId(arg_181_1)
		end
	end

	return arg_181_1
end

function var_0_0.getSkillList(arg_182_0)
	local var_182_0 = pg.ship_data_template[arg_182_0.configId]
	local var_182_1 = Clone(var_182_0.buff_list_display)
	local var_182_2 = Clone(var_182_0.buff_list)
	local var_182_3 = pg.ship_data_trans[arg_182_0.groupId]
	local var_182_4 = 0

	if var_182_3 and var_182_3.skill_id ~= 0 then
		local var_182_5 = var_182_3.skill_id
		local var_182_6 = pg.transform_data_template[var_182_5]

		if arg_182_0.transforms[var_182_5] and var_182_6.skill_id ~= 0 then
			table.insert(var_182_2, var_182_6.skill_id)
		end
	end

	local var_182_7 = {}

	for iter_182_0, iter_182_1 in ipairs(var_182_1) do
		for iter_182_2, iter_182_3 in ipairs(var_182_2) do
			if iter_182_1 == iter_182_3 then
				table.insert(var_182_7, arg_182_0:fateSkillChange(iter_182_1))
			end
		end
	end

	return var_182_7
end

function var_0_0.getModAttrTopLimit(arg_183_0, arg_183_1)
	local var_183_0 = ShipModAttr.ATTR_TO_INDEX[arg_183_1]
	local var_183_1 = pg.ship_data_template[arg_183_0.configId].strengthen_id
	local var_183_2 = pg.ship_data_strengthen[var_183_1].durability[var_183_0]

	return calcFloor((3 + 7 * (math.min(arg_183_0.level, 100) / 100)) * var_183_2 * 0.1)
end

function var_0_0.leftModAdditionPoint(arg_184_0, arg_184_1)
	local var_184_0 = arg_184_0:getModProperties(arg_184_1)
	local var_184_1 = arg_184_0:getModExpRatio(arg_184_1)
	local var_184_2 = arg_184_0:getModAttrTopLimit(arg_184_1)
	local var_184_3 = calcFloor(var_184_0 / var_184_1)

	return math.max(0, var_184_2 - var_184_3)
end

function var_0_0.getModAttrBaseMax(arg_185_0, arg_185_1)
	if not table.contains(arg_185_0:getConfig("lock"), arg_185_1) then
		local var_185_0 = arg_185_0:leftModAdditionPoint(arg_185_1)
		local var_185_1 = arg_185_0:getShipProperties()

		return calcFloor(var_185_1[arg_185_1] + var_185_0)
	else
		return 0
	end
end

function var_0_0.getModExpRatio(arg_186_0, arg_186_1)
	if not table.contains(arg_186_0:getConfig("lock"), arg_186_1) then
		local var_186_0 = pg.ship_data_template[arg_186_0.configId].strengthen_id

		assert(pg.ship_data_strengthen[var_186_0], "ship_data_strengthen>>>>>>" .. var_186_0)

		return math.max(pg.ship_data_strengthen[var_186_0].level_exp[ShipModAttr.ATTR_TO_INDEX[arg_186_1]], 1)
	else
		return 1
	end
end

function var_0_0.inUnlockTip(arg_187_0)
	local var_187_0 = pg.gameset.tip_unlock_shipIds.description[0]

	return table.contains(var_187_0, arg_187_0)
end

function var_0_0.proposeSkinOwned(arg_188_0, arg_188_1)
	return arg_188_1 and arg_188_0.propose and arg_188_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE
end

function var_0_0.getProposeSkin(arg_189_0)
	return ShipSkin.GetSkinByType(arg_189_0.groupId, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getDisplaySkillIds(arg_190_0)
	return _.map(pg.ship_data_template[arg_190_0.configId].buff_list_display, function(arg_191_0)
		return arg_190_0:fateSkillChange(arg_191_0)
	end)
end

function var_0_0.isFullSkillLevel(arg_192_0)
	local var_192_0 = pg.skill_data_template

	for iter_192_0, iter_192_1 in pairs(arg_192_0.skills) do
		if var_192_0[iter_192_1.id].max_level ~= iter_192_1.level then
			return false
		end
	end

	return true
end

function var_0_0.setEquipmentRecord(arg_193_0, arg_193_1, arg_193_2)
	local var_193_0 = "equipment_record" .. "_" .. arg_193_1 .. "_" .. arg_193_0.id

	PlayerPrefs.SetString(var_193_0, table.concat(_.flatten(arg_193_2), ":"))
	PlayerPrefs.Save()
end

function var_0_0.getEquipmentRecord(arg_194_0, arg_194_1)
	if not arg_194_0.equipmentRecords then
		local var_194_0 = "equipment_record" .. "_" .. arg_194_1 .. "_" .. arg_194_0.id
		local var_194_1 = string.split(PlayerPrefs.GetString(var_194_0) or "", ":")
		local var_194_2 = {}

		for iter_194_0 = 1, 3 do
			var_194_2[iter_194_0] = _.map(_.slice(var_194_1, 5 * iter_194_0 - 4, 5), function(arg_195_0)
				return tonumber(arg_195_0)
			end)
		end

		arg_194_0.equipmentRecords = var_194_2
	end

	return arg_194_0.equipmentRecords
end

function var_0_0.SetSpWeaponRecord(arg_196_0, arg_196_1, arg_196_2)
	local var_196_0 = "spweapon_record" .. "_" .. arg_196_1 .. "_" .. arg_196_0.id
	local var_196_1 = _.map({
		1,
		2,
		3
	}, function(arg_197_0)
		local var_197_0 = arg_196_2[arg_197_0]

		if var_197_0 then
			return (var_197_0:GetUID() or 0) .. "," .. var_197_0:GetConfigID()
		else
			return "0,0"
		end
	end)

	PlayerPrefs.SetString(var_196_0, table.concat(var_196_1, ":"))
	PlayerPrefs.Save()
end

function var_0_0.GetSpWeaponRecord(arg_198_0, arg_198_1)
	local var_198_0 = "spweapon_record" .. "_" .. arg_198_1 .. "_" .. arg_198_0.id

	return (_.map(string.split(PlayerPrefs.GetString(var_198_0, ""), ":"), function(arg_199_0)
		local var_199_0 = string.split(arg_199_0, ",")

		assert(var_199_0)

		local var_199_1 = tonumber(var_199_0[1])
		local var_199_2 = tonumber(var_199_0[2])

		if not var_199_2 or var_199_2 == 0 then
			return false
		end

		return (SpWeapon.New({
			id = var_199_2
		}))
	end))
end

function var_0_0.hasEquipEquipmentSkin(arg_200_0)
	for iter_200_0, iter_200_1 in ipairs(arg_200_0.equipments) do
		if iter_200_1 and iter_200_1:hasSkin() then
			return true
		end
	end

	return false
end

function var_0_0.hasCommander(arg_201_0)
	return arg_201_0.commanderId and arg_201_0.commanderId ~= 0
end

function var_0_0.getCommander(arg_202_0)
	return arg_202_0.commanderId
end

function var_0_0.setCommander(arg_203_0, arg_203_1)
	arg_203_0.commanderId = arg_203_1
end

function var_0_0.getSkillIndex(arg_204_0, arg_204_1)
	local var_204_0 = arg_204_0:getSkillList()

	for iter_204_0, iter_204_1 in ipairs(var_204_0) do
		if arg_204_1 == iter_204_1 then
			return iter_204_0
		end
	end
end

function var_0_0.getTactics(arg_205_0)
	return 1, "tactics_attack"
end

function var_0_0.IsBgmSkin(arg_206_0)
	local var_206_0 = arg_206_0:GetSkinConfig()

	return table.contains(var_206_0.tag, ShipSkin.WITH_BGM)
end

function var_0_0.GetSkinBgm(arg_207_0)
	if arg_207_0:IsBgmSkin() then
		return arg_207_0:GetSkinConfig().bgm
	end
end

function var_0_0.isIntensifyMax(arg_208_0)
	local var_208_0 = intProperties(arg_208_0:getShipProperties())

	if arg_208_0:isBluePrintShip() then
		return true
	end

	for iter_208_0, iter_208_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_208_0:getModAttrBaseMax(iter_208_1) ~= var_208_0[iter_208_1] then
			return false
		end
	end

	return true
end

function var_0_0.isRemouldable(arg_209_0)
	return not arg_209_0:isTestShip() and not arg_209_0:isBluePrintShip() and pg.ship_data_trans[arg_209_0.groupId]
end

function var_0_0.isAllRemouldFinish(arg_210_0)
	local var_210_0 = pg.ship_data_trans[arg_210_0.groupId]

	assert(var_210_0, "this ship group without remould config:" .. arg_210_0.groupId)

	for iter_210_0, iter_210_1 in ipairs(var_210_0.transform_list) do
		for iter_210_2, iter_210_3 in ipairs(iter_210_1) do
			local var_210_1 = pg.transform_data_template[iter_210_3[2]]

			if #var_210_1.edit_trans > 0 then
				-- block empty
			elseif not arg_210_0.transforms[iter_210_3[2]] or arg_210_0.transforms[iter_210_3[2]].level < var_210_1.max_level then
				return false
			end
		end
	end

	return true
end

function var_0_0.isSpecialFilter(arg_211_0)
	local var_211_0 = pg.ship_data_statistics[arg_211_0.configId]

	assert(var_211_0, "this ship without statistics:" .. arg_211_0.configId)

	for iter_211_0, iter_211_1 in ipairs(var_211_0.tag_list) do
		if iter_211_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.hasAvailiableSkin(arg_212_0)
	local var_212_0 = getProxy(ShipSkinProxy)
	local var_212_1 = var_212_0:GetAllSkinForShip(arg_212_0)
	local var_212_2 = var_212_0:getRawData()
	local var_212_3 = 0

	for iter_212_0, iter_212_1 in ipairs(var_212_1) do
		if arg_212_0:proposeSkinOwned(iter_212_1) or var_212_2[iter_212_1.id] or var_212_0:hasSkin(iter_212_1.id) then
			var_212_3 = var_212_3 + 1
		end
	end

	return var_212_3 > 0
end

function var_0_0.hasProposeSkin(arg_213_0)
	local var_213_0 = getProxy(ShipSkinProxy)
	local var_213_1 = var_213_0:GetAllSkinForShip(arg_213_0)

	for iter_213_0, iter_213_1 in ipairs(var_213_1) do
		if iter_213_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	local var_213_2 = var_213_0:GetShareSkinsForShip(arg_213_0)

	for iter_213_2, iter_213_3 in ipairs(var_213_2) do
		if iter_213_3.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	return false
end

function var_0_0.HasUniqueSpWeapon(arg_214_0)
	return tobool(pg.spweapon_data_statistics.get_id_list_by_unique[arg_214_0:getGroupId()])
end

function var_0_0.getAircraftReloadCD(arg_215_0)
	local var_215_0 = arg_215_0:getConfigTable().base_list
	local var_215_1 = arg_215_0:getConfigTable().default_equip_list
	local var_215_2 = 0
	local var_215_3 = 0

	for iter_215_0 = 1, 3 do
		local var_215_4 = arg_215_0:getEquip(iter_215_0)
		local var_215_5 = var_215_4 and var_215_4.configId or var_215_1[iter_215_0]
		local var_215_6 = Equipment.getConfigData(var_215_5).type

		if underscore.any(EquipType.AirEquipTypes, function(arg_216_0)
			return var_215_6 == arg_216_0
		end) then
			var_215_2 = var_215_2 + Equipment.GetEquipReloadStatic(var_215_5) * var_215_0[iter_215_0]
			var_215_3 = var_215_3 + var_215_0[iter_215_0]
		end
	end

	local var_215_7 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT

	return {
		name = i18n("equip_info_31"),
		type = AttributeType.CD,
		value = var_215_2 / var_215_3 * var_215_7
	}
end

function var_0_0.IsTagShip(arg_217_0, arg_217_1)
	local var_217_0 = arg_217_0:getConfig("tag_list")

	return table.contains(var_217_0, arg_217_1)
end

function var_0_0.setReMetaSpecialItemVO(arg_218_0, arg_218_1)
	arg_218_0.reMetaSpecialItemVO = arg_218_1
end

function var_0_0.getReMetaSpecialItemVO(arg_219_0, arg_219_1)
	return arg_219_0.reMetaSpecialItemVO
end

function var_0_0.getProposeType(arg_220_0)
	if arg_220_0:isMetaShip() then
		return "meta"
	elseif arg_220_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_221_0)
	return arg_221_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.getSpecificType(arg_222_0)
	return pg.ship_data_template[arg_222_0.configId].specific_type
end

function var_0_0.GetSpWeapon(arg_223_0)
	return arg_223_0.spWeapon
end

function var_0_0.UpdateSpWeapon(arg_224_0, arg_224_1)
	local var_224_0 = (arg_224_1 and arg_224_1:GetUID() or 0) == (arg_224_0.spWeapon and arg_224_0.spWeapon:GetUID() or 0)

	arg_224_0.spWeapon = arg_224_1

	if arg_224_1 then
		arg_224_1:SetShipId(arg_224_0.id)
	end

	if var_224_0 then
		pg.m02:sendNotification(EquipmentProxy.SPWEAPONS_UPDATED)
	end
end

function var_0_0.CanEquipSpWeapon(arg_225_0, arg_225_1)
	local var_225_0, var_225_1 = arg_225_0:IsSpWeaponForbidden(arg_225_1)

	if var_225_0 then
		return false, var_225_1
	end

	return true
end

function var_0_0.IsSpWeaponForbidden(arg_226_0, arg_226_1)
	local var_226_0 = arg_226_1:GetWearableShipTypes()
	local var_226_1 = arg_226_0:getShipType()

	if not table.contains(var_226_0, var_226_1) then
		return true, i18n("spweapon_tip_group_error")
	end

	local var_226_2 = arg_226_1:GetUniqueGroup()
	local var_226_3 = arg_226_0:getGroupId()

	if var_226_2 ~= 0 and var_226_2 ~= var_226_3 then
		return true, i18n("spweapon_tip_group_error")
	end

	return false
end

function var_0_0.GetMapStrikeAnim(arg_227_0)
	local var_227_0
	local var_227_1 = arg_227_0:getShipType()

	switch(TeamType.GetTeamFromShipType(var_227_1), {
		[TeamType.Main] = function()
			if ShipType.IsTypeQuZhu(var_227_1) then
				var_227_0 = "SubTorpedoUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleAircraftCarrier, var_227_1) then
				var_227_0 = "AirStrikeUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleBattleShip, var_227_1) then
				var_227_0 = "CannonUI"
			else
				var_227_0 = "CannonUI"
			end
		end,
		[TeamType.Vanguard] = function()
			if ShipType.IsTypeQuZhu(var_227_1) then
				var_227_0 = "SubTorpedoUI"
			end
		end,
		[TeamType.Submarine] = function()
			if arg_227_0:getNation() == Nation.MOT then
				var_227_0 = "CannonUI"
			else
				var_227_0 = "SubTorpedoUI"
			end
		end
	})

	return var_227_0
end

function var_0_0.IsDefaultSkin(arg_231_0)
	local var_231_0 = arg_231_0:getSkinId()

	return var_231_0 == 0 or var_231_0 == arg_231_0:getConfig("skin_id")
end

function var_0_0.IsMatchKey(arg_232_0, arg_232_1)
	if not arg_232_1 or arg_232_1 == "" then
		return true
	end

	arg_232_1 = string.lower(string.gsub(arg_232_1, "%.", "%%."))

	local var_232_0 = {
		arg_232_0:getName(),
		arg_232_0:GetDefaultName()
	}

	if var_232_0[1] == var_232_0[2] then
		table.remove(var_232_0)
	end

	return underscore.any(var_232_0, function(arg_233_0)
		return string.find(string.lower(arg_233_0), arg_232_1)
	end)
end

function var_0_0.IsOwner(arg_234_0)
	return tobool(arg_234_0.id)
end

function var_0_0.GetUniqueId(arg_235_0)
	return arg_235_0.id
end

function var_0_0.ShowPropose(arg_236_0)
	if not arg_236_0.propose then
		return false
	else
		return not HXSet.isHxPropose() or arg_236_0:IsOwner() and arg_236_0:GetUniqueId() == getProxy(PlayerProxy):getRawData():GetProposeShipId()
	end
end

function var_0_0.GetColorName(arg_237_0, arg_237_1)
	arg_237_1 = arg_237_1 or arg_237_0:getName()

	if PlayerPrefs.GetInt("SHIP_NAME_COLOR", PLATFORM_CODE == PLATFORM_CH and 1 or 0) == 1 and arg_237_0.propose then
		return setColorStr(arg_237_1, "#FFAACEFF")
	else
		return arg_237_1
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

function var_0_0.GetFrameAndEffect(arg_238_0, arg_238_1)
	arg_238_1 = tobool(arg_238_1)

	local var_238_0
	local var_238_1

	if arg_238_0.propose then
		if arg_238_0:isMetaShip() then
			var_238_1 = string.format(var_0_9.effect[1])
			var_238_0 = string.format(var_0_9.frame[1])
		elseif arg_238_0:isBluePrintShip() then
			var_238_1 = string.format(var_0_9.effect[2])
			var_238_0 = string.format(var_0_9.frame[2], arg_238_0:rarity2bgPrint())
		else
			var_238_1 = string.format(var_0_9.effect[3])
			var_238_0 = string.format(var_0_9.frame[3])
		end

		if not arg_238_0:ShowPropose() then
			var_238_0 = nil
		end
	elseif arg_238_0:isMetaShip() then
		var_238_1 = string.format(var_0_9.effect[4], arg_238_0:rarity2bgPrint())
	elseif arg_238_0:getRarity() == ShipRarity.SSR then
		var_238_1 = string.format(var_0_9.effect[5])
	end

	if arg_238_1 then
		var_238_1 = var_238_1 and var_238_1 .. "_1"
	end

	return var_238_0, var_238_1
end

function var_0_0.GetRecordPosKey(arg_239_0)
	return arg_239_0:getSkinId()
end

function var_0_0.GetShipPhantomMark(arg_240_0, arg_240_1)
	return ShipPhantom.PackMark(arg_240_0.id, arg_240_1)
end

function var_0_0.GetSelectMark(arg_241_0)
	return arg_241_0.id
end

return var_0_0
