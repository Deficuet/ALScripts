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

var_0_0.CVBattleKey = {
	skill = "skill",
	link2 = "link2",
	lose = "lose",
	link5 = "link5",
	link3 = "link3",
	link6 = "link6",
	hp = "hp",
	link1 = "link1",
	link4 = "link4",
	warcry = "warcry",
	mvp = "mvp"
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

function var_0_0.getShipWords(arg_17_0)
	local var_17_0 = pg.ship_skin_words[arg_17_0]

	if not var_17_0 then
		warning("找不到ship_skin_words: " .. arg_17_0)

		return
	end

	local var_17_1 = Clone(var_17_0)

	for iter_17_0, iter_17_1 in pairs(var_17_1) do
		if type(iter_17_1) == "string" then
			var_17_1[iter_17_0] = HXSet.hxLan(iter_17_1)
		end
	end

	local var_17_2 = pg.ship_skin_words_extra[arg_17_0]

	return var_17_1, var_17_2
end

function var_0_0.getMainwordsCount(arg_18_0)
	local var_18_0 = var_0_0.getShipWords(arg_18_0)

	if not var_18_0.main or var_18_0.main == "" then
		var_18_0 = var_0_0.getShipWords(var_0_0.getOriginalSkinId(arg_18_0))
	end

	return #string.split(var_18_0.main, "|")
end

function var_0_0.getWordsEx(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	local var_19_0 = arg_19_0 and arg_19_0[arg_19_1] or nil
	local var_19_1 = false

	if not var_19_0 or var_19_0 == "" then
		if arg_19_0 and arg_19_0.id == arg_19_4 then
			return
		end

		if not arg_19_5 then
			return
		end

		local var_19_2, var_19_3 = var_0_0.getShipWords(arg_19_4)

		if not var_19_3 then
			return
		end

		var_19_0 = var_19_3[arg_19_1]

		if not var_19_0 then
			return
		end

		var_19_1 = true
	end

	if type(var_19_0) == "string" then
		return
	end

	arg_19_3 = arg_19_3 or 0

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		if arg_19_3 >= iter_19_1[1] then
			if arg_19_1 == "main" then
				return string.split(iter_19_1[2], "|")[arg_19_2], iter_19_1[1], var_19_1
			else
				return iter_19_1[2], iter_19_1[1], var_19_1
			end
		end
	end
end

function var_0_0.getWords(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0, var_20_1 = var_0_0.getShipWords(arg_20_0)
	local var_20_2 = var_0_0.getOriginalSkinId(arg_20_0)
	local var_20_3 = math.fmod(arg_20_0, var_20_2)

	if not var_20_0 then
		var_20_0, var_20_1 = var_0_0.getShipWords(var_20_2)

		if not var_20_0 then
			return nil
		end
	end

	local var_20_4 = 0
	local var_20_5 = false
	local var_20_6 = var_20_0[arg_20_1]

	if not var_20_6 or var_20_6 == "" then
		var_20_5 = true

		if var_20_0.id == var_20_2 then
			return nil
		else
			var_20_0 = var_0_0.getShipWords(var_20_2)

			if not var_20_0 then
				return nil
			end

			var_20_6 = var_20_0[arg_20_1]

			if not var_20_6 or var_20_6 == "" then
				return nil
			end
		end
	end

	local var_20_7 = string.split(var_20_6, "|")
	local var_20_8 = arg_20_2 or math.random(#var_20_7)

	if arg_20_1 == "main" and var_20_7[var_20_8] == "nil" then
		var_20_5 = true
		var_20_0 = var_0_0.getShipWords(var_20_2)

		if not var_20_0 then
			return nil
		end

		local var_20_9 = var_20_0[arg_20_1]

		if not var_20_9 or var_20_9 == "" then
			return nil
		end

		var_20_7 = string.split(var_20_9, "|")
	end

	rstEx, cvEx, defaultCoverEx = var_0_0.getWordsEx(var_20_1, arg_20_1, var_20_8, arg_20_4, var_20_2, var_20_5)

	local var_20_10
	local var_20_11 = PlayerPrefs.GetInt("CV_LANGUAGE_" .. pg.ship_skin_template[arg_20_0].ship_group) == 2 and var_20_0.voice_key_2 or var_20_0.voice_key

	if var_20_11 == 0 then
		if not var_20_5 or rstEx and not defaultCoverEx then
			var_20_10 = var_0_0.getCVPath(var_20_2, arg_20_1, var_20_8, var_20_3)
		end
	elseif var_20_11 == -2 then
		-- block empty
	else
		var_20_10 = var_0_0.getCVPath(var_20_2, arg_20_1, var_20_8)
	end

	local var_20_12 = var_20_7[var_20_8]

	if var_20_12 and (arg_20_3 == nil and PLATFORM_CODE ~= PLATFORM_US or arg_20_3 == true) then
		var_20_12 = var_20_12:gsub("%s", " ")
	end

	if rstEx then
		var_20_10 = var_20_10 and var_20_10 .. "_ex" .. cvEx
	end

	return rstEx or var_20_12, var_20_10, cvEx
end

function var_0_0.getCVKeyID(arg_21_0)
	local var_21_0 = Ship.getShipWords(arg_21_0)

	if not var_21_0 then
		return -1
	end

	local var_21_1
	local var_21_2 = PlayerPrefs.GetInt("CV_LANGUAGE_" .. pg.ship_skin_template[arg_21_0].ship_group)
	local var_21_3 = var_21_2 == 2 and var_21_0.voice_key_2 >= 0 and var_21_0.voice_key_2 or var_21_0.voice_key

	if var_21_3 == 0 or var_21_3 == -2 then
		local var_21_4 = var_0_0.getOriginalSkinId(arg_21_0)
		local var_21_5 = var_0_0.getShipWords(var_21_4)

		var_21_3 = var_21_2 == 2 and var_21_5.voice_key_2 >= 0 and var_21_5.voice_key_2 or var_21_5.voice_key
	end

	return var_21_3
end

function var_0_0.getCVPath(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	arg_22_2 = arg_22_2 or 1

	local var_22_0 = Ship.getShipWords(arg_22_0)
	local var_22_1 = var_0_0.getOriginalSkinId(arg_22_0)

	if not var_22_0 then
		var_22_0 = var_0_0.getShipWords(var_22_1)

		if not var_22_0 then
			return
		end
	end

	local var_22_2 = PlayerPrefs.GetInt("CV_LANGUAGE_" .. arg_22_0 / 10)
	local var_22_3 = var_22_0[arg_22_1]

	if arg_22_1 == "main" then
		var_22_3 = string.split(var_22_3, "|")[arg_22_2]
		arg_22_1 = arg_22_1 .. arg_22_2
	end

	if arg_22_1 == "skill" or string.find(arg_22_1, "link") then
		if var_22_0.voice_key == 0 then
			var_22_0 = var_0_0.getShipWords(var_22_1)
		end
	elseif not var_22_3 or var_22_3 == "" or var_22_3 == "nil" then
		var_22_0 = var_0_0.getShipWords(var_22_1)
	end

	local var_22_4
	local var_22_5 = var_22_2 == 2 and var_22_0.voice_key_2 or var_22_0.voice_key

	if var_22_5 ~= -1 and pg.character_voice[arg_22_1] then
		var_22_4 = pg.character_voice[arg_22_1].resource_key

		if var_22_4 then
			var_22_4 = "event:/cv/" .. var_22_5 .. "/" .. var_22_4

			if arg_22_3 then
				var_22_4 = var_22_4 .. "_" .. arg_22_3
			end
		end
	end

	return var_22_4
end

function var_0_0.getCVCalibrate(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = pg.ship_skin_template[arg_23_0]

	if not var_23_0 then
		return 0
	end

	if arg_23_1 == "main" then
		arg_23_1 = arg_23_1 .. "_" .. arg_23_2
	end

	return var_23_0.l2d_voice_calibrate[arg_23_1]
end

function var_0_0.getL2dSoundEffect(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = pg.ship_skin_template[arg_24_0]

	if not var_24_0 then
		return 0
	end

	if arg_24_1 == "main" then
		arg_24_1 = arg_24_1 .. "_" .. arg_24_2
	end

	return var_24_0.l2d_se[arg_24_1]
end

function var_0_0.getOriginalSkinId(arg_25_0)
	local var_25_0 = pg.ship_skin_template[arg_25_0].ship_group

	return ShipGroup.getDefaultSkin(var_25_0).id
end

function var_0_0.getTransformShipId(arg_26_0)
	local var_26_0 = pg.ship_data_template[arg_26_0].group_type
	local var_26_1 = pg.ship_data_trans[var_26_0]

	if var_26_1 then
		for iter_26_0, iter_26_1 in ipairs(var_26_1.transform_list) do
			for iter_26_2, iter_26_3 in ipairs(iter_26_1) do
				local var_26_2 = pg.transform_data_template[iter_26_3[2]]

				for iter_26_4, iter_26_5 in ipairs(var_26_2.ship_id) do
					if iter_26_5[1] == arg_26_0 then
						return iter_26_5[2]
					end
				end
			end
		end
	end
end

function var_0_0.getAircraftCount(arg_27_0)
	local var_27_0 = arg_27_0:getConfigTable().base_list
	local var_27_1 = arg_27_0:getConfigTable().default_equip_list
	local var_27_2 = {}

	for iter_27_0 = 1, 3 do
		local var_27_3 = arg_27_0:getEquip(iter_27_0) and arg_27_0:getEquip(iter_27_0).configId or var_27_1[iter_27_0]
		local var_27_4 = Equipment.getConfigData(var_27_3).type

		if table.contains(EquipType.AirDomainEquip, var_27_4) then
			var_27_2[var_27_4] = defaultValue(var_27_2[var_27_4], 0) + var_27_0[iter_27_0]
		end
	end

	return var_27_2
end

function var_0_0.getShipType(arg_28_0)
	return arg_28_0:getConfig("type")
end

function var_0_0.getEnergy(arg_29_0)
	return arg_29_0.energy
end

function var_0_0.getEnergeConfig(arg_30_0)
	local var_30_0 = pg.energy_template
	local var_30_1 = arg_30_0:getEnergy()

	for iter_30_0, iter_30_1 in pairs(var_30_0) do
		if type(iter_30_0) == "number" and var_30_1 >= iter_30_1.lower_bound and var_30_1 <= iter_30_1.upper_bound then
			return iter_30_1
		end
	end

	assert(false, "疲劳配置不存在：" .. arg_30_0.energy)
end

function var_0_0.getEnergyPrint(arg_31_0)
	local var_31_0 = arg_31_0:getEnergeConfig()

	return var_31_0.icon, var_31_0.desc
end

function var_0_0.getIntimacy(arg_32_0)
	return arg_32_0.intimacy
end

function var_0_0.getCVIntimacy(arg_33_0)
	return arg_33_0:getIntimacy() / 100 + (arg_33_0.propose and 1000 or 0)
end

function var_0_0.getIntimacyMax(arg_34_0)
	if arg_34_0.propose then
		return 200
	else
		return arg_34_0:GetNoProposeIntimacyMax()
	end
end

function var_0_0.GetNoProposeIntimacyMax(arg_35_0)
	return 100
end

function var_0_0.getIntimacyIcon(arg_36_0)
	local var_36_0 = pg.intimacy_template[arg_36_0:getIntimacyLevel()]
	local var_36_1 = ""

	if arg_36_0:isMetaShip() then
		var_36_1 = "_meta"
	elseif arg_36_0:IsXIdol() then
		var_36_1 = "_imas"
	end

	if not arg_36_0.propose and math.floor(arg_36_0:getIntimacy() / 100) >= arg_36_0:getIntimacyMax() then
		return var_36_0.icon .. var_36_1, "heart" .. var_36_1
	else
		return var_36_0.icon .. var_36_1
	end
end

function var_0_0.getIntimacyDetail(arg_37_0)
	return arg_37_0:getIntimacyMax(), math.floor(arg_37_0:getIntimacy() / 100)
end

function var_0_0.getIntimacyInfo(arg_38_0)
	local var_38_0 = pg.intimacy_template[arg_38_0:getIntimacyLevel()]

	return var_38_0.icon, var_38_0.desc
end

function var_0_0.getIntimacyLevel(arg_39_0)
	local var_39_0 = 0
	local var_39_1 = pg.intimacy_template

	for iter_39_0, iter_39_1 in pairs(var_39_1) do
		if type(iter_39_0) == "number" and arg_39_0:getIntimacy() >= iter_39_1.lower_bound and arg_39_0:getIntimacy() <= iter_39_1.upper_bound then
			var_39_0 = iter_39_0

			break
		end
	end

	if var_39_0 < arg_39_0.INTIMACY_PROPOSE and arg_39_0.propose then
		var_39_0 = arg_39_0.INTIMACY_PROPOSE
	end

	return var_39_0
end

function var_0_0.getBluePrint(arg_40_0)
	local var_40_0 = ShipBluePrint.New({
		id = arg_40_0.groupId
	})
	local var_40_1 = arg_40_0.strengthList[1] or {
		exp = 0,
		level = 0
	}

	var_40_0:updateInfo({
		blue_print_level = var_40_1.level,
		exp = var_40_1.exp
	})

	return var_40_0
end

function var_0_0.getBaseList(arg_41_0)
	if arg_41_0:isBluePrintShip() then
		local var_41_0 = arg_41_0:getBluePrint()

		assert(var_41_0, "blueprint can not be nil" .. arg_41_0.configId)

		return var_41_0:getBaseList(arg_41_0)
	else
		return arg_41_0:getConfig("base_list")
	end
end

function var_0_0.getPreLoadCount(arg_42_0)
	if arg_42_0:isBluePrintShip() then
		return arg_42_0:getBluePrint():getPreLoadCount(arg_42_0)
	else
		return arg_42_0:getConfig("preload_count")
	end
end

function var_0_0.getNation(arg_43_0)
	return arg_43_0:getConfig("nationality")
end

function var_0_0.getPaintingName(arg_44_0)
	local var_44_0 = pg.ship_data_statistics[arg_44_0].skin_id
	local var_44_1 = pg.ship_skin_template[var_44_0]

	assert(var_44_1, "ship_skin_template not exist: " .. arg_44_0 .. " " .. var_44_0)

	return var_44_1.painting
end

function var_0_0.getName(arg_45_0)
	if arg_45_0.propose and pg.PushNotificationMgr.GetInstance():isEnableShipName() then
		return arg_45_0.name
	end

	if arg_45_0:isRemoulded() then
		return pg.ship_skin_template[arg_45_0:getRemouldSkinId()].name
	end

	return pg.ship_data_statistics[arg_45_0.configId].name
end

function var_0_0.GetDefaultName(arg_46_0)
	if arg_46_0:isRemoulded() then
		return pg.ship_skin_template[arg_46_0:getRemouldSkinId()].name
	else
		return pg.ship_data_statistics[arg_46_0.configId].name
	end
end

function var_0_0.getShipName(arg_47_0)
	return pg.ship_data_statistics[arg_47_0].name
end

function var_0_0.getBreakOutLevel(arg_48_0)
	assert(arg_48_0, "必须存在配置id")
	assert(pg.ship_data_statistics[arg_48_0], "必须存在配置" .. arg_48_0)

	return pg.ship_data_statistics[arg_48_0].star
end

function var_0_0.Ctor(arg_49_0, arg_49_1)
	arg_49_0.id = arg_49_1.id
	arg_49_0.configId = arg_49_1.template_id or arg_49_1.configId
	arg_49_0.level = arg_49_1.level
	arg_49_0.exp = arg_49_1.exp
	arg_49_0.energy = arg_49_1.energy
	arg_49_0.lockState = arg_49_1.is_locked
	arg_49_0.intimacy = arg_49_1.intimacy
	arg_49_0.propose = arg_49_1.propose and arg_49_1.propose > 0
	arg_49_0.proposeTime = arg_49_1.propose

	if arg_49_0.intimacy and arg_49_0.intimacy > 10000 and not arg_49_0.propose then
		arg_49_0.intimacy = 10000
	end

	arg_49_0.renameTime = arg_49_1.change_name_timestamp

	if arg_49_1.name and arg_49_1.name ~= "" then
		arg_49_0.name = arg_49_1.name
	else
		assert(pg.ship_data_statistics[arg_49_0.configId], "必须存在配置" .. arg_49_0.configId)

		arg_49_0.name = pg.ship_data_statistics[arg_49_0.configId].name
	end

	arg_49_0.bluePrintFlag = arg_49_1.blue_print_flag or 0
	arg_49_0.strengthList = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_1.strength_list or {}) do
		if not arg_49_0:isBluePrintShip() then
			local var_49_0 = ShipModAttr.ID_TO_ATTR[iter_49_1.id]

			arg_49_0.strengthList[var_49_0] = iter_49_1.exp
		else
			table.insert(arg_49_0.strengthList, {
				level = iter_49_1.id,
				exp = iter_49_1.exp
			})
		end
	end

	local var_49_1 = arg_49_1.state or {}

	arg_49_0.state = var_49_1.state or 0
	arg_49_0.state_info_1 = var_49_1.state_info_1 or 0
	arg_49_0.state_info_2 = var_49_1.state_info_2 or 0
	arg_49_0.state_info_3 = var_49_1.state_info_3 or 0
	arg_49_0.state_info_4 = var_49_1.state_info_4 or 0
	arg_49_0.equipmentSkins = {}
	arg_49_0.equipments = {}

	if arg_49_1.equip_info_list then
		for iter_49_2, iter_49_3 in ipairs(arg_49_1.equip_info_list or {}) do
			arg_49_0.equipments[iter_49_2] = iter_49_3.id > 0 and Equipment.New({
				count = 1,
				id = iter_49_3.id,
				config_id = iter_49_3.id,
				skinId = iter_49_3.skinId
			}) or false
			arg_49_0.equipmentSkins[iter_49_2] = iter_49_3.skinId > 0 and iter_49_3.skinId or 0

			arg_49_0:reletiveEquipSkin(iter_49_2)
		end
	end

	arg_49_0.spWeapon = nil

	if arg_49_1.spweapon then
		arg_49_0:UpdateSpWeapon(SpWeapon.CreateByNet(arg_49_1.spweapon))
	end

	arg_49_0.skills = {}

	for iter_49_4, iter_49_5 in ipairs(arg_49_1.skill_id_list or {}) do
		arg_49_0:updateSkill(iter_49_5)
	end

	arg_49_0.star = arg_49_0:getConfig("rarity")
	arg_49_0.transforms = {}

	for iter_49_6, iter_49_7 in ipairs(arg_49_1.transform_list or {}) do
		arg_49_0.transforms[iter_49_7.id] = {
			id = iter_49_7.id,
			level = iter_49_7.level
		}
	end

	arg_49_0.groupId = pg.ship_data_template[arg_49_0.configId].group_type
	arg_49_0.createTime = arg_49_1.create_time or 0

	local var_49_2 = getProxy(CollectionProxy)

	arg_49_0.virgin = var_49_2 and var_49_2.shipGroups[arg_49_0.groupId] == nil

	local var_49_3 = {
		pg.gameset.test_ship_config_1.key_value,
		pg.gameset.test_ship_config_2.key_value,
		pg.gameset.test_ship_config_3.key_value
	}
	local var_49_4 = table.indexof(var_49_3, arg_49_0.configId)

	if var_49_4 == 1 then
		arg_49_0.testShip = {
			2,
			3,
			4
		}
	elseif var_49_4 == 2 then
		arg_49_0.testShip = {
			5
		}
	elseif var_49_4 == 3 then
		arg_49_0.testShip = {
			6
		}
	else
		arg_49_0.testShip = nil
	end

	arg_49_0.maxIntimacy = pg.intimacy_template[#pg.intimacy_template.all].upper_bound

	local var_49_5 = 0

	if not HXSet.isHxSkin() then
		var_49_5 = arg_49_1.skin_id or 0
	end

	arg_49_0.phantomDic = {}

	arg_49_0:updateSkinId(var_49_5, 0)

	for iter_49_8, iter_49_9 in ipairs(arg_49_1.skin_shadow_list or {}) do
		arg_49_0:updateSkinId(iter_49_9.value, iter_49_9.key)
	end

	arg_49_0.noChangeSkin = arg_49_1.noChangeSkin or false
	arg_49_0.phantomRandomFlag = {}

	for iter_49_10, iter_49_11 in ipairs(arg_49_1.char_random_flag or {}) do
		arg_49_0:updateRandomFlag(1, iter_49_11)
	end

	if arg_49_1.name and arg_49_1.name ~= "" then
		arg_49_0.name = arg_49_1.name
	elseif arg_49_0:isRemoulded() then
		arg_49_0.name = pg.ship_skin_template[arg_49_0:getRemouldSkinId()].name
	else
		arg_49_0.name = pg.ship_data_statistics[arg_49_0.configId].name
	end

	arg_49_0.maxLevel = arg_49_1.max_level
	arg_49_0.proficiency = arg_49_1.proficiency or 0
	arg_49_0.preferenceTag = arg_49_1.common_flag
	arg_49_0.hpRant = 10000
	arg_49_0.strategies = {}
	arg_49_0.triggers = {}
	arg_49_0.commanderId = arg_49_1.commanderid or 0
	arg_49_0.activityNpc = arg_49_1.activity_npc or 0

	if var_0_0.isMetaShipByConfigID(arg_49_0.configId) then
		local var_49_6 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_49_0.configId)

		arg_49_0.metaCharacter = MetaCharacter.New({
			id = var_49_6,
			repair_attr_info = arg_49_1.meta_repair_list
		}, arg_49_0)
	end
end

function var_0_0.isMetaShipByConfigID(arg_50_0)
	local var_50_0 = pg.ship_meta_breakout.all
	local var_50_1 = var_50_0[1]
	local var_50_2 = false

	if var_50_1 <= arg_50_0 then
		for iter_50_0, iter_50_1 in ipairs(var_50_0) do
			if arg_50_0 == iter_50_1 then
				var_50_2 = true

				break
			end
		end
	end

	return var_50_2
end

function var_0_0.isMetaShip(arg_51_0)
	return arg_51_0.metaCharacter ~= nil
end

function var_0_0.getMetaCharacter(arg_52_0)
	return arg_52_0.metaCharacter
end

function var_0_0.unlockActivityNpc(arg_53_0, arg_53_1)
	arg_53_0.activityNpc = arg_53_1
end

function var_0_0.isActivityNpc(arg_54_0)
	return arg_54_0.activityNpc > 0
end

function var_0_0.getActiveEquipments(arg_55_0)
	local var_55_0 = Clone(arg_55_0.equipments)

	for iter_55_0 = #var_55_0, 1, -1 do
		local var_55_1 = var_55_0[iter_55_0]

		if var_55_1 then
			for iter_55_1 = 1, iter_55_0 - 1 do
				local var_55_2 = var_55_0[iter_55_1]

				if var_55_2 and var_55_1:getConfig("equip_limit") ~= 0 and var_55_2:getConfig("equip_limit") == var_55_1:getConfig("equip_limit") then
					var_55_0[iter_55_0] = false
				end
			end
		end
	end

	return var_55_0
end

function var_0_0.getAllEquipments(arg_56_0)
	return arg_56_0.equipments
end

function var_0_0.isBluePrintShip(arg_57_0)
	return arg_57_0.bluePrintFlag == 1
end

function var_0_0.getSkinId(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_0:getPhandomSkin(arg_58_1 or 0)

	if not arg_58_0.noChangeSkin and ShipSkin.IsChangeSkin(var_58_0) then
		local var_58_1 = ShipSkin.GetStoreChangeSkinId(ShipSkin.GetChangeSkinGroupId(var_58_0))

		if var_58_1 then
			return var_58_1
		end
	end

	return var_58_0
end

function var_0_0.getPhandomSkin(arg_59_0, arg_59_1)
	if not arg_59_1 or arg_59_1 == 0 then
		return arg_59_0.skinId
	else
		return arg_59_0.phantomDic[arg_59_0.phantomId] or arg_59_0:getConfig("skin_id")
	end
end

function var_0_0.updateSkinId(arg_60_0, arg_60_1, arg_60_2)
	if not arg_60_1 or arg_60_1 == 0 then
		arg_60_1 = arg_60_0:getConfig("skin_id")
	end

	if arg_60_2 == 0 then
		arg_60_0.skinId = arg_60_1
	else
		arg_60_0.phantomDic[arg_60_2] = arg_60_1
	end
end

function var_0_0.getAllShipPhantomMarks(arg_61_0)
	local var_61_0 = getGameset("technology_shadow_num")[1]
	local var_61_1 = {}

	for iter_61_0 = 0, var_61_0 do
		if iter_61_0 == 0 or arg_61_0.phantomDic[iter_61_0] then
			table.insert(var_61_1, ShipPhantom.PackMark(arg_61_0.id, iter_61_0))
		end
	end

	return var_61_1
end

function var_0_0.getAllShipPhantom(arg_62_0)
	local var_62_0 = getGameset("technology_shadow_num")[1]
	local var_62_1 = {}

	for iter_62_0 = 0, var_62_0 do
		if iter_62_0 == 0 or arg_62_0.phantomDic[iter_62_0] then
			table.insert(var_62_1, ShipPhantom.Create(arg_62_0, iter_62_0))
		end
	end

	return var_62_1
end

function var_0_0.updateRandomFlag(arg_63_0, arg_63_1, arg_63_2)
	arg_63_2 = defaultValue(arg_63_2, 0)
	arg_63_0.phantomRandomFlag[arg_63_2] = arg_63_1
end

function var_0_0.getRandomFlag(arg_64_0, arg_64_1)
	return defaultValue(arg_64_0.phantomRandomFlag[arg_64_1 or 0], 0) > 0
end

function var_0_0.getRandomFlagShipPhantomMarks(arg_65_0)
	local var_65_0 = getGameset("technology_shadow_num")[1]
	local var_65_1 = {}

	for iter_65_0 = 0, var_65_0 do
		if defaultValue(arg_65_0.phantomRandomFlag[iter_65_0], 0) > 0 then
			table.insert(var_65_1, arg_65_0:GetShipPhantomMark(iter_65_0))
		end
	end

	return var_65_1
end

function var_0_0.updateName(arg_66_0)
	if arg_66_0.name ~= pg.ship_data_statistics[arg_66_0.configId].name then
		return
	end

	if arg_66_0:isRemoulded() then
		arg_66_0.name = pg.ship_skin_template[arg_66_0:getRemouldSkinId()].name
	else
		arg_66_0.name = pg.ship_data_statistics[arg_66_0.configId].name
	end
end

function var_0_0.isRemoulded(arg_67_0)
	if arg_67_0.remoulded then
		return true
	end

	local var_67_0 = pg.ship_data_trans[arg_67_0.groupId]

	if var_67_0 then
		for iter_67_0, iter_67_1 in ipairs(var_67_0.transform_list) do
			for iter_67_2, iter_67_3 in ipairs(iter_67_1) do
				local var_67_1 = pg.transform_data_template[iter_67_3[2]]

				if var_67_1.skin_id ~= 0 and arg_67_0.transforms[iter_67_3[2]] and arg_67_0.transforms[iter_67_3[2]].level == var_67_1.max_level then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.getRemouldSkinId(arg_68_0)
	local var_68_0 = ShipGroup.getModSkin(arg_68_0.groupId)

	if var_68_0 then
		return var_68_0.id
	end

	return nil
end

function var_0_0.hasEquipmentSkinInPos(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_0.equipments[arg_69_1]

	return var_69_0 and var_69_0:hasSkin()
end

function var_0_0.getPrefab(arg_70_0)
	local var_70_0 = arg_70_0:getSkinId()

	if arg_70_0:hasEquipmentSkinInPos(var_0_2) then
		local var_70_1 = arg_70_0:getEquip(var_0_2)
		local var_70_2 = var_0_7[var_70_1:getSkinId()].ship_skin_id

		var_70_0 = var_70_2 ~= 0 and var_70_2 or var_70_0
	end

	local var_70_3 = pg.ship_skin_template[var_70_0]

	assert(var_70_3, "ship_skin_template not exist: " .. arg_70_0.configId .. " " .. var_70_0)

	return var_70_3.prefab
end

function var_0_0.getAttachmentPrefab(arg_71_0)
	local var_71_0 = {}

	for iter_71_0, iter_71_1 in ipairs(arg_71_0.equipments) do
		if iter_71_1 and iter_71_1:hasSkinOrbit() then
			local var_71_1 = iter_71_1:getSkinId()
			local var_71_2 = var_0_7[var_71_1]

			var_71_0[var_71_1] = {
				config = var_71_2,
				index = iter_71_0
			}
		end
	end

	return var_71_0
end

function var_0_0.getPainting(arg_72_0)
	local var_72_0 = arg_72_0:getSkinId()
	local var_72_1 = pg.ship_skin_template[var_72_0]

	assert(var_72_1, "ship_skin_template not exist: " .. arg_72_0.configId .. " " .. var_72_0)

	return var_72_1.painting
end

function var_0_0.GetSkinConfig(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_0:getSkinId()
	local var_73_1 = pg.ship_skin_template[var_73_0]

	assert(var_73_1, "ship_skin_template not exist: " .. arg_73_0.configId .. " " .. var_73_0)

	return var_73_1
end

function var_0_0.getRemouldPainting(arg_74_0)
	local var_74_0 = arg_74_0:getRemouldSkinId()
	local var_74_1 = pg.ship_skin_template[var_74_0]

	assert(var_74_1, "ship_skin_template not exist: " .. arg_74_0.configId .. " " .. var_74_0)

	return var_74_1.painting
end

function var_0_0.updateStateInfo34(arg_75_0, arg_75_1, arg_75_2)
	arg_75_0.state_info_3 = arg_75_1
	arg_75_0.state_info_4 = arg_75_2
end

function var_0_0.hasStateInfo3Or4(arg_76_0)
	return arg_76_0.state_info_3 ~= 0 or arg_76_0.state_info_4 ~= 0
end

function var_0_0.isTestShip(arg_77_0)
	return arg_77_0.testShip
end

function var_0_0.canUseTestShip(arg_78_0, arg_78_1)
	assert(arg_78_0.testShip, "ship is not TestShip")

	return table.contains(arg_78_0.testShip, arg_78_1)
end

function var_0_0.updateEquip(arg_79_0, arg_79_1, arg_79_2)
	assert(arg_79_2 == nil or arg_79_2.count == 1)

	local var_79_0 = arg_79_0.equipments[arg_79_1]

	arg_79_0.equipments[arg_79_1] = arg_79_2 and Clone(arg_79_2) or false

	local function var_79_1(arg_80_0)
		arg_80_0 = CreateShell(arg_80_0)
		arg_80_0.shipId = arg_79_0.id
		arg_80_0.shipPos = arg_79_1

		return arg_80_0
	end

	if var_79_0 then
		getProxy(EquipmentProxy):OnShipEquipsRemove(var_79_0, arg_79_0.id, arg_79_1)
		var_79_0:setSkinId(0)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_REMOVED, var_79_1(var_79_0))
	end

	if arg_79_2 then
		getProxy(EquipmentProxy):OnShipEquipsAdd(arg_79_2, arg_79_0.id, arg_79_1)
		arg_79_0:reletiveEquipSkin(arg_79_1)
		pg.m02:sendNotification(BayProxy.SHIP_EQUIPMENT_ADDED, var_79_1(arg_79_2))
	end
end

function var_0_0.reletiveEquipSkin(arg_81_0, arg_81_1)
	if arg_81_0.equipments[arg_81_1] and arg_81_0.equipmentSkins[arg_81_1] ~= 0 then
		local var_81_0 = pg.equip_skin_template[arg_81_0.equipmentSkins[arg_81_1]].equip_type
		local var_81_1 = arg_81_0.equipments[arg_81_1]:getType()

		if table.contains(var_81_0, var_81_1) then
			arg_81_0.equipments[arg_81_1]:setSkinId(arg_81_0.equipmentSkins[arg_81_1])
		else
			arg_81_0.equipments[arg_81_1]:setSkinId(0)
		end
	elseif arg_81_0.equipments[arg_81_1] then
		arg_81_0.equipments[arg_81_1]:setSkinId(0)
	end
end

function var_0_0.updateEquipmentSkin(arg_82_0, arg_82_1, arg_82_2)
	if not arg_82_1 then
		return
	end

	if arg_82_2 and arg_82_2 > 0 then
		local var_82_0 = arg_82_0:getSkinTypes(arg_82_1)
		local var_82_1 = pg.equip_skin_template[arg_82_2].equip_type
		local var_82_2 = false

		for iter_82_0, iter_82_1 in ipairs(var_82_0) do
			for iter_82_2, iter_82_3 in ipairs(var_82_1) do
				if iter_82_1 == iter_82_3 then
					var_82_2 = true

					break
				end
			end
		end

		if not var_82_2 then
			assert(var_82_2, "部位" .. arg_82_1 .. " 无法穿戴皮肤 " .. arg_82_2)

			return
		end

		local var_82_3 = arg_82_0.equipments[arg_82_1] and arg_82_0.equipments[arg_82_1]:getType() or false

		arg_82_0.equipmentSkins[arg_82_1] = arg_82_2

		if var_82_3 and table.contains(var_82_1, var_82_3) then
			arg_82_0.equipments[arg_82_1]:setSkinId(arg_82_0.equipmentSkins[arg_82_1])
		elseif var_82_3 and not table.contains(var_82_1, var_82_3) then
			arg_82_0.equipments[arg_82_1]:setSkinId(0)
		end
	else
		arg_82_0.equipmentSkins[arg_82_1] = 0

		if arg_82_0.equipments[arg_82_1] then
			arg_82_0.equipments[arg_82_1]:setSkinId(0)
		end
	end
end

function var_0_0.getEquip(arg_83_0, arg_83_1)
	return Clone(arg_83_0.equipments[arg_83_1])
end

function var_0_0.getEquipSkins(arg_84_0)
	return Clone(arg_84_0.equipmentSkins)
end

function var_0_0.getEquipSkin(arg_85_0, arg_85_1)
	return arg_85_0.equipmentSkins[arg_85_1]
end

function var_0_0.getCanEquipSkin(arg_86_0, arg_86_1)
	local var_86_0 = arg_86_0:getSkinTypes(arg_86_1)

	if var_86_0 and #var_86_0 then
		for iter_86_0, iter_86_1 in ipairs(var_86_0) do
			if pg.equip_data_by_type[iter_86_1].equip_skin == 1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.checkCanEquipSkin(arg_87_0, arg_87_1, arg_87_2)
	if not arg_87_1 or not arg_87_2 then
		return
	end

	local var_87_0 = arg_87_0:getSkinTypes(arg_87_1)
	local var_87_1 = pg.equip_skin_template[arg_87_2].equip_type

	for iter_87_0, iter_87_1 in ipairs(var_87_0) do
		if table.contains(var_87_1, iter_87_1) then
			return true
		end
	end

	return false
end

function var_0_0.getSkinTypes(arg_88_0, arg_88_1)
	return pg.ship_data_template[arg_88_0.configId]["equip_" .. arg_88_1] or {}
end

function var_0_0.updateState(arg_89_0, arg_89_1)
	arg_89_0.state = arg_89_1
end

function var_0_0.addSkillExp(arg_90_0, arg_90_1, arg_90_2)
	local var_90_0 = arg_90_0.skills[arg_90_1] or {
		exp = 0,
		level = 1,
		id = arg_90_1
	}
	local var_90_1 = var_90_0.level and var_90_0.level or 1
	local var_90_2 = pg.skill_need_exp.all[#pg.skill_need_exp.all]

	if var_90_1 == var_90_2 then
		return
	end

	local var_90_3 = var_90_0.exp and arg_90_2 + var_90_0.exp or 0 + arg_90_2

	while var_90_3 >= pg.skill_need_exp[var_90_1].exp do
		var_90_3 = var_90_3 - pg.skill_need_exp[var_90_1].exp
		var_90_1 = var_90_1 + 1

		if var_90_1 == var_90_2 then
			var_90_3 = 0

			break
		end
	end

	arg_90_0:updateSkill({
		id = var_90_0.id,
		level = var_90_1,
		exp = var_90_3
	})
end

function var_0_0.upSkillLevelForMeta(arg_91_0, arg_91_1)
	local var_91_0 = arg_91_0.skills[arg_91_1] or {
		exp = 0,
		level = 0,
		id = arg_91_1
	}
	local var_91_1 = arg_91_0:isSkillLevelMax(arg_91_1)
	local var_91_2 = var_91_0.level

	if not var_91_1 then
		var_91_2 = var_91_2 + 1
	end

	arg_91_0:updateSkill({
		exp = 0,
		id = var_91_0.id,
		level = var_91_2
	})
end

function var_0_0.getMetaSkillLevelBySkillID(arg_92_0, arg_92_1)
	return (arg_92_0.skills[arg_92_1] or {
		exp = 0,
		level = 0,
		id = arg_92_1
	}).level
end

function var_0_0.isSkillLevelMax(arg_93_0, arg_93_1)
	local var_93_0 = arg_93_0.skills[arg_93_1] or {
		exp = 0,
		level = 1,
		id = arg_93_1
	}

	return (var_93_0.level and var_93_0.level or 1) >= pg.skill_data_template[arg_93_1].max_level
end

function var_0_0.isAllMetaSkillLevelMax(arg_94_0)
	local var_94_0 = true
	local var_94_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_94_0.configId)

	for iter_94_0, iter_94_1 in ipairs(var_94_1) do
		if not arg_94_0:isSkillLevelMax(iter_94_1) then
			var_94_0 = false

			break
		end
	end

	return var_94_0
end

function var_0_0.isAllMetaSkillLock(arg_95_0)
	local var_95_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_95_0.configId)
	local var_95_1 = true

	for iter_95_0, iter_95_1 in ipairs(var_95_0) do
		if arg_95_0:getMetaSkillLevelBySkillID(iter_95_1) > 0 then
			var_95_1 = false

			break
		end
	end

	return var_95_1
end

function var_0_0.bindConfigTable(arg_96_0)
	return pg.ship_data_statistics
end

function var_0_0.isAvaiable(arg_97_0)
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

function var_0_0.intimacyAdditions(arg_98_0, arg_98_1)
	local var_98_0 = pg.intimacy_template[arg_98_0:getIntimacyLevel()].attr_bonus * 0.0001

	for iter_98_0, iter_98_1 in pairs(arg_98_1) do
		if iter_98_0 == AttributeType.Durability or iter_98_0 == AttributeType.Cannon or iter_98_0 == AttributeType.Torpedo or iter_98_0 == AttributeType.AntiAircraft or iter_98_0 == AttributeType.AntiSub or iter_98_0 == AttributeType.Air or iter_98_0 == AttributeType.Reload or iter_98_0 == AttributeType.Hit or iter_98_0 == AttributeType.Dodge then
			arg_98_1[iter_98_0] = arg_98_1[iter_98_0] * (var_98_0 + 1)
		end
	end
end

function var_0_0.getShipProperties(arg_99_0)
	local var_99_0 = arg_99_0:getBaseProperties()

	if arg_99_0:isBluePrintShip() then
		local var_99_1 = arg_99_0:getBluePrint()

		assert(var_99_1, "blueprint can not be nil" .. arg_99_0.configId)

		local var_99_2 = var_99_1:getTotalAdditions()

		for iter_99_0, iter_99_1 in pairs(var_99_2) do
			var_99_0[iter_99_0] = var_99_0[iter_99_0] + calcFloor(iter_99_1)
		end

		arg_99_0:intimacyAdditions(var_99_0)
	elseif arg_99_0:isMetaShip() then
		assert(arg_99_0.metaCharacter)

		for iter_99_2, iter_99_3 in pairs(var_99_0) do
			var_99_0[iter_99_2] = var_99_0[iter_99_2] + arg_99_0.metaCharacter:getAttrAddition(iter_99_2)
		end

		arg_99_0:intimacyAdditions(var_99_0)
	else
		local var_99_3 = pg.ship_data_template[arg_99_0.configId].strengthen_id
		local var_99_4 = var_0_5[var_99_3]

		for iter_99_4, iter_99_5 in pairs(arg_99_0.strengthList) do
			local var_99_5 = ShipModAttr.ATTR_TO_INDEX[iter_99_4]
			local var_99_6 = math.min(iter_99_5, var_99_4.durability[var_99_5] * var_99_4.level_exp[var_99_5])
			local var_99_7 = math.max(arg_99_0:getModExpRatio(iter_99_4), 1)

			var_99_0[iter_99_4] = var_99_0[iter_99_4] + calcFloor(var_99_6 / var_99_7)
		end

		arg_99_0:intimacyAdditions(var_99_0)

		for iter_99_6, iter_99_7 in pairs(arg_99_0.transforms) do
			local var_99_8 = pg.transform_data_template[iter_99_7.id].effect

			for iter_99_8 = 1, iter_99_7.level do
				local var_99_9 = var_99_8[iter_99_8] or {}

				for iter_99_9, iter_99_10 in pairs(var_99_0) do
					if var_99_9[iter_99_9] then
						var_99_0[iter_99_9] = var_99_0[iter_99_9] + var_99_9[iter_99_9]
					end
				end
			end
		end
	end

	return var_99_0
end

function var_0_0.getTechNationAddition(arg_100_0, arg_100_1)
	local var_100_0 = getProxy(TechnologyNationProxy)
	local var_100_1 = arg_100_0:getConfig("type")

	if var_100_1 == ShipType.DaoQuV or var_100_1 == ShipType.DaoQuM then
		var_100_1 = ShipType.QuZhu
	end

	return var_100_0:getShipAddition(var_100_1, arg_100_1)
end

function var_0_0.getTechNationMaxAddition(arg_101_0, arg_101_1)
	local var_101_0 = getProxy(TechnologyNationProxy)
	local var_101_1 = arg_101_0:getConfig("type")

	return var_101_0:getShipMaxAddition(var_101_1, arg_101_1)
end

function var_0_0.getEquipProficiencyByPos(arg_102_0, arg_102_1)
	return arg_102_0:getEquipProficiencyList()[arg_102_1]
end

function var_0_0.getEquipProficiencyList(arg_103_0)
	local var_103_0 = arg_103_0:getConfigTable()
	local var_103_1 = Clone(var_103_0.equipment_proficiency)

	if arg_103_0:isBluePrintShip() then
		local var_103_2 = arg_103_0:getBluePrint()

		assert(var_103_2, "blueprint can not be nil >>>" .. arg_103_0.groupId)

		var_103_1 = var_103_2:getEquipProficiencyList(arg_103_0)
	else
		for iter_103_0, iter_103_1 in ipairs(var_103_1) do
			local var_103_3 = 0

			for iter_103_2, iter_103_3 in pairs(arg_103_0.transforms) do
				local var_103_4 = pg.transform_data_template[iter_103_3.id].effect

				for iter_103_4 = 1, iter_103_3.level do
					local var_103_5 = var_103_4[iter_103_4] or {}

					if var_103_5["equipment_proficiency_" .. iter_103_0] then
						var_103_3 = var_103_3 + var_103_5["equipment_proficiency_" .. iter_103_0]
					end
				end
			end

			var_103_1[iter_103_0] = iter_103_1 + var_103_3
		end
	end

	return var_103_1
end

function var_0_0.getBaseProperties(arg_104_0)
	local var_104_0 = arg_104_0:getConfigTable()

	assert(var_104_0, "配置表没有这艘船" .. arg_104_0.configId)

	local var_104_1 = {}
	local var_104_2 = {}

	for iter_104_0, iter_104_1 in ipairs(var_0_0.PROPERTIES) do
		var_104_1[iter_104_1] = arg_104_0:getGrowthForAttr(iter_104_1)
		var_104_2[iter_104_1] = var_104_1[iter_104_1]
	end

	for iter_104_2, iter_104_3 in ipairs(arg_104_0:getConfig("lock")) do
		var_104_2[iter_104_3] = var_104_1[iter_104_3]
	end

	for iter_104_4, iter_104_5 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_104_2[iter_104_5] = var_104_0[iter_104_5]
	end

	for iter_104_6, iter_104_7 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_104_2[iter_104_7] = 0
	end

	return var_104_2
end

function var_0_0.getGrowthForAttr(arg_105_0, arg_105_1)
	local var_105_0 = arg_105_0:getConfigTable()
	local var_105_1 = table.indexof(var_0_0.PROPERTIES, arg_105_1)
	local var_105_2 = pg.gameset.extra_attr_level_limit.key_value
	local var_105_3 = var_105_0.attrs[var_105_1] + (arg_105_0.level - 1) * var_105_0.attrs_growth[var_105_1] / 1000

	if var_105_2 < arg_105_0.level then
		var_105_3 = var_105_3 + (arg_105_0.level - var_105_2) * var_105_0.attrs_growth_extra[var_105_1] / 1000
	end

	return var_105_3
end

function var_0_0.isMaxStar(arg_106_0)
	return arg_106_0:getStar() >= arg_106_0:getMaxStar()
end

function var_0_0.IsMaxStarByTmpID(arg_107_0)
	local var_107_0 = pg.ship_data_template[arg_107_0]

	return var_107_0.star >= var_107_0.star_max
end

function var_0_0.IsSpweaponUnlock(arg_108_0)
	if not arg_108_0:CanAccumulateExp() then
		return false, "spweapon_tip_locked"
	else
		return true
	end
end

function var_0_0.getModProperties(arg_109_0, arg_109_1)
	return arg_109_0.strengthList[arg_109_1] or 0
end

function var_0_0.addModAttrExp(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0 = arg_110_0:getModAttrTopLimit(arg_110_1)

	if var_110_0 == 0 then
		return
	end

	local var_110_1 = arg_110_0:getModExpRatio(arg_110_1)
	local var_110_2 = arg_110_0:getModProperties(arg_110_1)

	if var_110_2 + arg_110_2 > var_110_0 * var_110_1 then
		arg_110_0.strengthList[arg_110_1] = var_110_0 * var_110_1
	else
		arg_110_0.strengthList[arg_110_1] = var_110_2 + arg_110_2
	end
end

function var_0_0.getNeedModExp(arg_111_0)
	local var_111_0 = {}

	for iter_111_0, iter_111_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_111_1 = arg_111_0:getModAttrTopLimit(iter_111_1)

		if var_111_1 == 0 then
			var_111_0[iter_111_1] = 0
		else
			var_111_0[iter_111_1] = var_111_1 * arg_111_0:getModExpRatio(iter_111_1) - arg_111_0:getModProperties(iter_111_1)
		end
	end

	return var_111_0
end

function var_0_0.attrVertify(arg_112_0)
	if not BayProxy.checkShiplevelVertify(arg_112_0) then
		return false
	end

	for iter_112_0, iter_112_1 in ipairs(arg_112_0.equipments) do
		if iter_112_1 and not iter_112_1:vertify() then
			return false
		end
	end

	return true
end

function var_0_0.getEquipmentProperties(arg_113_0)
	local var_113_0 = {}
	local var_113_1 = {}

	for iter_113_0, iter_113_1 in ipairs(var_0_0.PROPERTIES) do
		var_113_0[iter_113_1] = 0
	end

	for iter_113_2, iter_113_3 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_113_0[iter_113_3] = 0
	end

	for iter_113_4, iter_113_5 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_113_0[iter_113_5] = 0
	end

	for iter_113_6, iter_113_7 in ipairs(var_0_0.PROPERTIES_ENHANCEMENT) do
		var_113_1[iter_113_7] = 0
	end

	var_113_0[AttributeType.AirDominate] = 0
	var_113_0[AttributeType.AntiSiren] = 0

	local var_113_2 = arg_113_0:getActiveEquipments()

	for iter_113_8, iter_113_9 in ipairs(var_113_2) do
		if iter_113_9 then
			local var_113_3 = iter_113_9:GetAttributes()

			for iter_113_10, iter_113_11 in ipairs(var_113_3) do
				if iter_113_11 and var_113_0[iter_113_11.type] then
					var_113_0[iter_113_11.type] = var_113_0[iter_113_11.type] + iter_113_11.value
				end
			end

			local var_113_4 = iter_113_9:GetPropertyRate()

			for iter_113_12, iter_113_13 in pairs(var_113_4) do
				var_113_1[iter_113_12] = math.max(var_113_1[iter_113_12], iter_113_13)
			end

			local var_113_5 = iter_113_9:GetSonarProperty()

			if var_113_5 then
				for iter_113_14, iter_113_15 in pairs(var_113_5) do
					var_113_0[iter_113_14] = var_113_0[iter_113_14] + iter_113_15
				end
			end

			local var_113_6 = iter_113_9:GetAntiSirenPower()

			if var_113_6 then
				var_113_0[AttributeType.AntiSiren] = var_113_0[AttributeType.AntiSiren] + var_113_6 / 10000
			end
		end
	end

	;(function()
		local var_114_0 = arg_113_0:GetSpWeapon()

		if not var_114_0 then
			return
		end

		local var_114_1 = var_114_0:GetPropertiesInfo().attrs

		for iter_114_0, iter_114_1 in ipairs(var_114_1) do
			if iter_114_1 and var_113_0[iter_114_1.type] then
				var_113_0[iter_114_1.type] = var_113_0[iter_114_1.type] + iter_114_1.value
			end
		end
	end)()

	for iter_113_16, iter_113_17 in pairs(var_113_1) do
		var_113_1[iter_113_16] = iter_113_17 + 1
	end

	return var_113_0, var_113_1
end

function var_0_0.getSkillEffects(arg_115_0)
	local var_115_0 = arg_115_0:getShipSkillEffects()

	_.each(arg_115_0:getEquipmentSkillEffects(), function(arg_116_0)
		table.insert(var_115_0, arg_116_0)
	end)

	return var_115_0
end

function var_0_0.getShipSkillEffects(arg_117_0)
	local var_117_0 = {}
	local var_117_1 = arg_117_0:getSkillList()

	for iter_117_0, iter_117_1 in ipairs(var_117_1) do
		local var_117_2 = arg_117_0:RemapSkillId(iter_117_1)
		local var_117_3 = pg.buffCfg["buff_" .. var_117_2]

		arg_117_0:FilterActiveSkill(var_117_0, var_117_3, arg_117_0.skills[iter_117_1])
	end

	return var_117_0
end

function var_0_0.getEquipmentSkillEffects(arg_118_0)
	local var_118_0 = {}
	local var_118_1 = arg_118_0:getActiveEquipments()

	for iter_118_0, iter_118_1 in ipairs(var_118_1) do
		local var_118_2
		local var_118_3 = iter_118_1 and iter_118_1:getConfig("skill_id")[1] and iter_118_1:getConfig("skill_id")[1][1]

		if var_118_3 then
			var_118_2 = pg.buffCfg["buff_" .. var_118_3]
		end

		arg_118_0:FilterActiveSkill(var_118_0, var_118_2)
	end

	;(function()
		local var_119_0 = arg_118_0:GetSpWeapon()
		local var_119_1 = var_119_0 and var_119_0:GetEffect() or 0
		local var_119_2

		if var_119_1 > 0 then
			var_119_2 = pg.buffCfg["buff_" .. var_119_1]
		end

		arg_118_0:FilterActiveSkill(var_118_0, var_119_2)
	end)()

	return var_118_0
end

function var_0_0.FilterActiveSkill(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	if not arg_120_2 or not arg_120_2.const_effect_list then
		return
	end

	for iter_120_0 = 1, #arg_120_2.const_effect_list do
		local var_120_0 = arg_120_2.const_effect_list[iter_120_0]
		local var_120_1 = var_120_0.trigger
		local var_120_2 = var_120_0.arg_list
		local var_120_3 = 1

		if arg_120_3 then
			var_120_3 = arg_120_3.level

			local var_120_4 = arg_120_2[var_120_3].const_effect_list

			if var_120_4 and var_120_4[iter_120_0] then
				var_120_1 = var_120_4[iter_120_0].trigger or var_120_1
				var_120_2 = var_120_4[iter_120_0].arg_list or var_120_2
			end
		end

		local var_120_5 = true

		for iter_120_1, iter_120_2 in pairs(var_120_1) do
			if arg_120_0.triggers[iter_120_1] ~= iter_120_2 then
				var_120_5 = false

				break
			end
		end

		if var_120_5 then
			table.insert(arg_120_1, {
				type = var_120_0.type,
				arg_list = var_120_2,
				level = var_120_3
			})
		end
	end
end

function var_0_0.getEquipmentGearScore(arg_121_0)
	local var_121_0 = 0
	local var_121_1 = arg_121_0:getActiveEquipments()

	for iter_121_0, iter_121_1 in ipairs(var_121_1) do
		if iter_121_1 then
			var_121_0 = var_121_0 + iter_121_1:GetGearScore()
		end
	end

	return var_121_0
end

function var_0_0.getProperties(arg_122_0, arg_122_1, arg_122_2, arg_122_3, arg_122_4)
	local var_122_0 = arg_122_1 or {}
	local var_122_1 = arg_122_0:getConfig("nationality")
	local var_122_2 = arg_122_0:getConfig("type")
	local var_122_3 = arg_122_0:getShipProperties()
	local var_122_4, var_122_5 = arg_122_0:getEquipmentProperties()
	local var_122_6
	local var_122_7
	local var_122_8

	if arg_122_3 and arg_122_0:getFlag("inWorld") then
		local var_122_9 = WorldConst.FetchWorldShip(arg_122_0.id)

		var_122_6, var_122_7 = var_122_9:GetShipBuffProperties()
		var_122_8 = var_122_9:GetShipPowerBuffProperties()
	end

	for iter_122_0, iter_122_1 in ipairs(var_0_0.PROPERTIES) do
		local var_122_10 = 0
		local var_122_11 = 0

		for iter_122_2, iter_122_3 in pairs(var_122_0) do
			var_122_10 = var_122_10 + iter_122_3:getAttrRatioAddition(iter_122_1, var_122_1, var_122_2) / 100
			var_122_11 = var_122_11 + iter_122_3:getAttrValueAddition(iter_122_1, var_122_1, var_122_2)
		end

		local var_122_12 = var_122_10 + (var_122_5[iter_122_1] or 1)
		local var_122_13 = var_122_7 and var_122_7[iter_122_1] or 1
		local var_122_14 = var_122_6 and var_122_6[iter_122_1] or 0

		if iter_122_1 == AttributeType.Speed then
			var_122_3[iter_122_1] = var_122_3[iter_122_1] * var_122_12 * var_122_13 + var_122_11 + var_122_4[iter_122_1] + var_122_14
		else
			var_122_3[iter_122_1] = calcFloor(calcFloor(var_122_3[iter_122_1]) * var_122_12 * var_122_13) + var_122_11 + var_122_4[iter_122_1] + var_122_14
		end
	end

	if not arg_122_2 and arg_122_0:isMaxStar() then
		for iter_122_4, iter_122_5 in pairs(var_122_3) do
			local var_122_15 = arg_122_4 and arg_122_0:getTechNationMaxAddition(iter_122_4) or arg_122_0:getTechNationAddition(iter_122_4)

			var_122_3[iter_122_4] = var_122_3[iter_122_4] + var_122_15
		end
	end

	for iter_122_6, iter_122_7 in ipairs(var_0_0.DIVE_PROPERTIES) do
		var_122_3[iter_122_7] = var_122_3[iter_122_7] + var_122_4[iter_122_7]
	end

	for iter_122_8, iter_122_9 in ipairs(var_0_0.SONAR_PROPERTIES) do
		var_122_3[iter_122_9] = var_122_3[iter_122_9] + var_122_4[iter_122_9]
	end

	if arg_122_3 then
		var_122_3[AttributeType.AntiSiren] = (var_122_3[AttributeType.AntiSiren] or 0) + var_122_4[AttributeType.AntiSiren]
	end

	if var_122_8 then
		for iter_122_10, iter_122_11 in pairs(var_122_8) do
			if var_122_3[iter_122_10] then
				if iter_122_10 == AttributeType.Speed then
					var_122_3[iter_122_10] = var_122_3[iter_122_10] * iter_122_11
				else
					var_122_3[iter_122_10] = math.floor(var_122_3[iter_122_10] * iter_122_11)
				end
			end
		end
	end

	return var_122_3
end

function var_0_0.getTransGearScore(arg_123_0)
	local var_123_0 = 0
	local var_123_1 = pg.transform_data_template

	for iter_123_0, iter_123_1 in pairs(arg_123_0.transforms) do
		for iter_123_2 = 1, iter_123_1.level do
			var_123_0 = var_123_0 + (var_123_1[iter_123_1.id].gear_score[iter_123_2] or 0)
		end
	end

	return var_123_0
end

function var_0_0.getShipCombatPower(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_0:getProperties(arg_124_1, nil, nil, true)
	local var_124_1 = var_124_0[AttributeType.Durability] / 5 + var_124_0[AttributeType.Cannon] + var_124_0[AttributeType.Torpedo] + var_124_0[AttributeType.AntiAircraft] + var_124_0[AttributeType.Air] + var_124_0[AttributeType.AntiSub] + var_124_0[AttributeType.Reload] + var_124_0[AttributeType.Hit] * 2 + var_124_0[AttributeType.Dodge] * 2 + var_124_0[AttributeType.Speed] + arg_124_0:getEquipmentGearScore() + arg_124_0:getTransGearScore()

	return math.floor(var_124_1)
end

function var_0_0.cosumeEnergy(arg_125_0, arg_125_1)
	arg_125_0:setEnergy(math.max(arg_125_0:getEnergy() - arg_125_1, 0))
end

function var_0_0.addEnergy(arg_126_0, arg_126_1)
	arg_126_0:setEnergy(arg_126_0:getEnergy() + arg_126_1)
end

function var_0_0.setEnergy(arg_127_0, arg_127_1)
	arg_127_0.energy = arg_127_1
end

function var_0_0.setLikability(arg_128_0, arg_128_1)
	assert(arg_128_1 >= 0 and arg_128_1 <= arg_128_0.maxIntimacy, "intimacy value invaild" .. arg_128_1)
	arg_128_0:setIntimacy(arg_128_1)
end

function var_0_0.addLikability(arg_129_0, arg_129_1)
	local var_129_0 = Mathf.Clamp(arg_129_0:getIntimacy() + arg_129_1, 0, arg_129_0.maxIntimacy)

	arg_129_0:setIntimacy(var_129_0)
end

function var_0_0.setIntimacy(arg_130_0, arg_130_1)
	if arg_130_1 > 10000 and not arg_130_0.propose then
		arg_130_1 = 10000
	end

	arg_130_0.intimacy = arg_130_1

	if not arg_130_0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[arg_130_0.groupId]:updateMaxIntimacy(arg_130_0:getIntimacy())
	end
end

function var_0_0.getLevelExpConfig(arg_131_0, arg_131_1)
	if arg_131_0:getConfig("rarity") == ShipRarity.SSR then
		local var_131_0 = Clone(getConfigFromLevel1(var_0_6, arg_131_1 or arg_131_0.level))

		var_131_0.exp = var_131_0.exp_ur
		var_131_0.exp_start = var_131_0.exp_ur_start
		var_131_0.exp_interval = var_131_0.exp_ur_interval
		var_131_0.exp_end = var_131_0.exp_ur_end

		return var_131_0
	else
		return getConfigFromLevel1(var_0_6, arg_131_1 or arg_131_0.level)
	end
end

function var_0_0.getExp(arg_132_0)
	local var_132_0 = arg_132_0:getMaxLevel()

	if arg_132_0.level == var_132_0 and LOCK_FULL_EXP then
		return 0
	end

	return arg_132_0.exp
end

function var_0_0.getProficiency(arg_133_0)
	return arg_133_0.proficiency
end

function var_0_0.addExp(arg_134_0, arg_134_1, arg_134_2)
	local var_134_0 = arg_134_0:getMaxLevel()

	if arg_134_0.level == var_134_0 then
		if arg_134_0.exp >= pg.gameset.exp_overflow_max.key_value then
			return
		end

		if LOCK_FULL_EXP or not arg_134_2 or not arg_134_0:CanAccumulateExp() then
			arg_134_1 = 0
		end
	end

	arg_134_0.exp = arg_134_0.exp + arg_134_1

	local var_134_1 = false

	while arg_134_0:canLevelUp() do
		arg_134_0.exp = arg_134_0.exp - arg_134_0:getLevelExpConfig().exp_interval
		arg_134_0.level = math.min(arg_134_0.level + 1, var_134_0)
		var_134_1 = true
	end

	if arg_134_0.level == var_134_0 then
		if arg_134_2 and arg_134_0:CanAccumulateExp() then
			arg_134_0.exp = math.min(arg_134_0.exp, pg.gameset.exp_overflow_max.key_value)
		elseif var_134_1 then
			arg_134_0.exp = 0
		end
	end
end

function var_0_0.getMaxLevel(arg_135_0)
	return arg_135_0.maxLevel
end

function var_0_0.canLevelUp(arg_136_0)
	local var_136_0 = arg_136_0:getLevelExpConfig(arg_136_0.level + 1)
	local var_136_1 = arg_136_0:getMaxLevel() <= arg_136_0.level

	return var_136_0 and arg_136_0:getLevelExpConfig().exp_interval <= arg_136_0.exp and not var_136_1
end

function var_0_0.getConfigMaxLevel(arg_137_0)
	return var_0_6.all[#var_0_6.all]
end

function var_0_0.isConfigMaxLevel(arg_138_0)
	return arg_138_0.level == arg_138_0:getConfigMaxLevel()
end

function var_0_0.updateMaxLevel(arg_139_0, arg_139_1)
	local var_139_0 = arg_139_0:getConfigMaxLevel()

	arg_139_0.maxLevel = math.max(math.min(var_139_0, arg_139_1), arg_139_0.maxLevel)
end

function var_0_0.getNextMaxLevel(arg_140_0)
	local var_140_0 = arg_140_0:getConfigMaxLevel()

	for iter_140_0 = arg_140_0:getMaxLevel() + 1, var_140_0 do
		if var_0_6[iter_140_0].level_limit == 1 then
			return iter_140_0
		end
	end
end

function var_0_0.canUpgrade(arg_141_0)
	if arg_141_0:isBluePrintShip() then
		return false
	end

	if arg_141_0:isMetaShip() then
		local var_141_0 = arg_141_0:getMetaCharacter()

		if not var_141_0 then
			return false
		end

		local var_141_1 = var_141_0:getBreakOutInfo()

		if not var_141_1:hasNextInfo() then
			return false
		end

		local var_141_2, var_141_3 = var_141_1:getLimited()

		if var_141_2 > arg_141_0.level then
			return false
		end

		return true
	else
		local var_141_4 = var_0_8[arg_141_0.configId]

		assert(var_141_4, "不存在配置" .. arg_141_0.configId)

		return not arg_141_0:isMaxStar() and arg_141_0.level >= var_141_4.level
	end
end

function var_0_0.isReachNextMaxLevel(arg_142_0)
	return arg_142_0.level == arg_142_0:getMaxLevel() and arg_142_0:CanAccumulateExp() and arg_142_0:getNextMaxLevel() ~= nil
end

function var_0_0.isAwakening(arg_143_0)
	return arg_143_0:isReachNextMaxLevel() and arg_143_0.level < var_0_4
end

function var_0_0.isAwakening2(arg_144_0)
	return arg_144_0:isReachNextMaxLevel() and arg_144_0.level >= var_0_4
end

function var_0_0.notMaxLevelForFilter(arg_145_0)
	return arg_145_0.level ~= arg_145_0:getMaxLevel()
end

function var_0_0.getNextMaxLevelConsume(arg_146_0)
	local var_146_0 = arg_146_0:getMaxLevel()
	local var_146_1 = var_0_6[var_146_0]["need_item_rarity" .. arg_146_0:getConfig("rarity")]

	assert(var_146_1, "items  can not be nil")

	return _.map(var_146_1, function(arg_147_0)
		return {
			type = arg_147_0[1],
			id = arg_147_0[2],
			count = arg_147_0[3]
		}
	end)
end

function var_0_0.canUpgradeMaxLevel(arg_148_0)
	if not arg_148_0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		local var_148_0 = getProxy(PlayerProxy):getData()
		local var_148_1 = getProxy(BagProxy)
		local var_148_2 = arg_148_0:getNextMaxLevelConsume()

		for iter_148_0, iter_148_1 in pairs(var_148_2) do
			if iter_148_1.type == DROP_TYPE_RESOURCE then
				if var_148_0:getResById(iter_148_1.id) < iter_148_1.count then
					return false, i18n("common_no_resource")
				end
			elseif iter_148_1.type == DROP_TYPE_ITEM and var_148_1:getItemCountById(iter_148_1.id) < iter_148_1.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

function var_0_0.CanAccumulateExp(arg_149_0)
	return pg.ship_data_template[arg_149_0.configId].can_get_proficency == 1
end

function var_0_0.getTotalExp(arg_150_0)
	return arg_150_0:getLevelExpConfig().exp_start + arg_150_0.exp
end

function var_0_0.getStartBattleExpend(arg_151_0)
	if table.contains(TeamType.SubShipType, arg_151_0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[arg_151_0.configId].oil_at_start
	end
end

function var_0_0.getEndBattleExpend(arg_152_0)
	local var_152_0 = pg.ship_data_template[arg_152_0.configId]
	local var_152_1 = arg_152_0:getLevelExpConfig()

	return (math.floor(var_152_0.oil_at_end * var_152_1.fight_oil_ratio / 10000))
end

function var_0_0.getBattleTotalExpend(arg_153_0)
	return arg_153_0:getStartBattleExpend() + arg_153_0:getEndBattleExpend()
end

function var_0_0.getShipAmmo(arg_154_0)
	local var_154_0 = arg_154_0:getConfig(AttributeType.Ammo)

	for iter_154_0, iter_154_1 in pairs(arg_154_0:getAllSkills()) do
		local var_154_1 = tonumber(iter_154_0 .. string.format("%.2d", iter_154_1.level))
		local var_154_2 = pg.skill_benefit_template[var_154_1]

		if var_154_2 and arg_154_0:IsBenefitSkillActive(var_154_2) and (var_154_2.type == var_0_0.BENEFIT_EQUIP or var_154_2.type == var_0_0.BENEFIT_SKILL) then
			var_154_0 = var_154_0 + defaultValue(var_154_2.effect[1], 0)
		end
	end

	local var_154_3 = arg_154_0:getActiveEquipments()

	for iter_154_2, iter_154_3 in ipairs(var_154_3) do
		local var_154_4 = iter_154_3 and iter_154_3:getConfig("equip_parameters").ammo

		if var_154_4 then
			var_154_0 = var_154_0 + var_154_4
		end
	end

	return var_154_0
end

function var_0_0.getHuntingLv(arg_155_0)
	local var_155_0 = arg_155_0:getConfig("huntingrange_level")

	for iter_155_0, iter_155_1 in pairs(arg_155_0:getAllSkills()) do
		local var_155_1 = tonumber(iter_155_0 .. string.format("%.2d", iter_155_1.level))
		local var_155_2 = pg.skill_benefit_template[var_155_1]

		if var_155_2 and arg_155_0:IsBenefitSkillActive(var_155_2) and (var_155_2.type == var_0_0.BENEFIT_EQUIP or var_155_2.type == var_0_0.BENEFIT_SKILL) then
			var_155_0 = var_155_0 + defaultValue(var_155_2.effect[2], 0)
		end
	end

	local var_155_3 = arg_155_0:getActiveEquipments()

	for iter_155_2, iter_155_3 in ipairs(var_155_3) do
		local var_155_4 = iter_155_3 and iter_155_3:getConfig("equip_parameters").hunting_lv

		if var_155_4 then
			var_155_0 = var_155_0 + var_155_4
		end
	end

	return (math.min(var_155_0, arg_155_0:getMaxHuntingLv()))
end

function var_0_0.getMapAuras(arg_156_0)
	local var_156_0 = {}

	for iter_156_0, iter_156_1 in pairs(arg_156_0:getAllSkills()) do
		local var_156_1 = tonumber(iter_156_0 .. string.format("%.2d", iter_156_1.level))
		local var_156_2 = pg.skill_benefit_template[var_156_1]

		if var_156_2 and arg_156_0:IsBenefitSkillActive(var_156_2) and var_156_2.type == var_0_0.BENEFIT_MAP_AURA then
			local var_156_3 = {
				id = var_156_2.effect[1],
				level = iter_156_1.level
			}

			table.insert(var_156_0, var_156_3)
		end
	end

	return var_156_0
end

function var_0_0.getMapAids(arg_157_0)
	local var_157_0 = {}

	for iter_157_0, iter_157_1 in pairs(arg_157_0:getAllSkills()) do
		local var_157_1 = tonumber(iter_157_0 .. string.format("%.2d", iter_157_1.level))
		local var_157_2 = pg.skill_benefit_template[var_157_1]

		if var_157_2 and arg_157_0:IsBenefitSkillActive(var_157_2) and var_157_2.type == var_0_0.BENEFIT_AID then
			local var_157_3 = {
				id = var_157_2.effect[1],
				level = iter_157_1.level
			}

			table.insert(var_157_0, var_157_3)
		end
	end

	return var_157_0
end

var_0_0.BENEFIT_SKILL = 2
var_0_0.BENEFIT_EQUIP = 3
var_0_0.BENEFIT_MAP_AURA = 4
var_0_0.BENEFIT_AID = 5

function var_0_0.IsBenefitSkillActive(arg_158_0, arg_158_1)
	local var_158_0 = false

	if arg_158_1.type == var_0_0.BENEFIT_SKILL then
		if not arg_158_1.limit[1] or arg_158_1.limit[1] == arg_158_0.triggers.TeamNumbers then
			var_158_0 = true
		end
	elseif arg_158_1.type == var_0_0.BENEFIT_EQUIP then
		local var_158_1 = arg_158_1.limit
		local var_158_2 = arg_158_0:getAllEquipments()

		for iter_158_0, iter_158_1 in ipairs(var_158_2) do
			if iter_158_1 and table.contains(var_158_1, iter_158_1:getConfig("id")) then
				var_158_0 = true

				break
			end
		end
	elseif arg_158_1.type == var_0_0.BENEFIT_MAP_AURA then
		if arg_158_0.hpRant and arg_158_0.hpRant > 0 then
			return true
		end
	elseif arg_158_1.type == var_0_0.BENEFIT_AID and arg_158_0.hpRant and arg_158_0.hpRant > 0 then
		return true
	end

	return var_158_0
end

function var_0_0.getMaxHuntingLv(arg_159_0)
	return #arg_159_0:getConfig("hunting_range")
end

function var_0_0.getHuntingRange(arg_160_0, arg_160_1)
	local var_160_0 = arg_160_0:getConfig("hunting_range")
	local var_160_1 = Clone(var_160_0[1])
	local var_160_2 = arg_160_1 or arg_160_0:getHuntingLv()
	local var_160_3 = math.min(var_160_2, arg_160_0:getMaxHuntingLv())

	for iter_160_0 = 2, var_160_3 do
		_.each(var_160_0[iter_160_0], function(arg_161_0)
			table.insert(var_160_1, {
				arg_161_0[1],
				arg_161_0[2]
			})
		end)
	end

	return var_160_1
end

function var_0_0.getTriggerSkills(arg_162_0)
	local var_162_0 = {}
	local var_162_1 = arg_162_0:getSkillEffects()

	_.each(var_162_1, function(arg_163_0)
		if arg_163_0.type == "AddBuff" and arg_163_0.arg_list and arg_163_0.arg_list.buff_id then
			local var_163_0 = arg_163_0.arg_list.buff_id

			var_162_0[var_163_0] = {
				id = var_163_0,
				level = arg_163_0.level
			}
		end
	end)

	return var_162_0
end

function var_0_0.GetEquipmentSkills(arg_164_0)
	local var_164_0 = {}
	local var_164_1 = arg_164_0:getActiveEquipments()

	for iter_164_0, iter_164_1 in ipairs(var_164_1) do
		if iter_164_1 and iter_164_1:getConfig("skill_id")[1] then
			local var_164_2, var_164_3 = unpack(iter_164_1:getConfig("skill_id")[1])

			var_164_0[var_164_2] = {
				id = var_164_2,
				level = var_164_3
			}
		end
	end

	;(function()
		local var_165_0 = arg_164_0:GetSpWeapon()
		local var_165_1 = var_165_0 and var_165_0:GetEffect() or 0

		if var_165_1 > 0 then
			var_164_0[var_165_1] = {
				level = 1,
				id = var_165_1
			}
		end
	end)()

	return var_164_0
end

function var_0_0.getAllSkills(arg_166_0)
	local var_166_0 = Clone(arg_166_0.skills)

	for iter_166_0, iter_166_1 in pairs(arg_166_0:GetEquipmentSkills()) do
		var_166_0[iter_166_0] = iter_166_1
	end

	for iter_166_2, iter_166_3 in pairs(arg_166_0:getTriggerSkills()) do
		var_166_0[iter_166_2] = iter_166_3
	end

	return var_166_0
end

function var_0_0.isSameKind(arg_167_0, arg_167_1)
	return pg.ship_data_template[arg_167_0.configId].group_type == pg.ship_data_template[arg_167_1.configId].group_type
end

function var_0_0.GetLockState(arg_168_0)
	return arg_168_0.lockState
end

function var_0_0.IsLocked(arg_169_0)
	return arg_169_0.lockState == var_0_0.LOCK_STATE_LOCK
end

function var_0_0.SetLockState(arg_170_0, arg_170_1)
	arg_170_0.lockState = arg_170_1
end

function var_0_0.GetPreferenceTag(arg_171_0)
	return arg_171_0.preferenceTag or 0
end

function var_0_0.IsPreferenceTag(arg_172_0)
	return arg_172_0:GetPreferenceTag() == var_0_0.PREFERENCE_TAG_COMMON
end

function var_0_0.SetPreferenceTag(arg_173_0, arg_173_1)
	arg_173_0.preferenceTag = arg_173_1
end

function var_0_0.calReturnRes(arg_174_0)
	local var_174_0 = pg.ship_data_by_type[arg_174_0:getShipType()]
	local var_174_1 = var_174_0.distory_resource_gold_ratio
	local var_174_2 = var_174_0.distory_resource_oil_ratio
	local var_174_3 = pg.ship_data_by_star[arg_174_0:getConfig("rarity")].destory_item

	return var_174_1, 0, var_174_3
end

function var_0_0.getRarity(arg_175_0)
	local var_175_0 = arg_175_0:getConfig("rarity")

	if arg_175_0:isRemoulded() then
		var_175_0 = var_175_0 + 1
	end

	return var_175_0
end

function var_0_0.updateSkill(arg_176_0, arg_176_1)
	local var_176_0 = arg_176_1.skill_id or arg_176_1.id
	local var_176_1 = arg_176_1.skill_lv or arg_176_1.lv or arg_176_1.level
	local var_176_2 = arg_176_1.skill_exp or arg_176_1.exp

	arg_176_0.skills[var_176_0] = {
		id = var_176_0,
		level = var_176_1,
		exp = var_176_2
	}
end

function var_0_0.canEquipAtPos(arg_177_0, arg_177_1, arg_177_2)
	local var_177_0, var_177_1 = arg_177_0:isForbiddenAtPos(arg_177_1, arg_177_2)

	if var_177_0 then
		return false, var_177_1
	end

	for iter_177_0, iter_177_1 in ipairs(arg_177_0.equipments) do
		if iter_177_1 and iter_177_0 ~= arg_177_2 and iter_177_1:getConfig("equip_limit") ~= 0 and arg_177_1:getConfig("equip_limit") == iter_177_1:getConfig("equip_limit") then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

function var_0_0.isForbiddenAtPos(arg_178_0, arg_178_1, arg_178_2)
	local var_178_0 = pg.ship_data_template[arg_178_0.configId]

	assert(var_178_0, "can not find ship in ship_data_templtae: " .. arg_178_0.configId)

	local var_178_1 = var_178_0["equip_" .. arg_178_2]

	if not table.contains(var_178_1, arg_178_1:getConfig("type")) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(arg_178_1:getConfig("ship_type_forbidden"), arg_178_0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

function var_0_0.canEquipCommander(arg_179_0, arg_179_1)
	if arg_179_1:getShipType() ~= arg_179_0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

function var_0_0.upgrade(arg_180_0)
	local var_180_0 = pg.ship_data_transform[arg_180_0.configId]

	if var_180_0.trans_id and var_180_0.trans_id > 0 then
		arg_180_0.configId = var_180_0.trans_id
		arg_180_0.star = arg_180_0:getConfig("star")
	end
end

function var_0_0.getTeamType(arg_181_0)
	return TeamType.GetTeamFromShipType(arg_181_0:getShipType())
end

function var_0_0.getFleetName(arg_182_0)
	local var_182_0 = arg_182_0:getTeamType()

	return var_0_1[var_182_0]
end

function var_0_0.getMaxConfigId(arg_183_0)
	local var_183_0 = pg.ship_data_template
	local var_183_1

	for iter_183_0 = 4, 1, -1 do
		local var_183_2 = tonumber(arg_183_0.groupId .. iter_183_0)

		if var_183_0[var_183_2] then
			var_183_1 = var_183_2

			break
		end
	end

	return var_183_1
end

function var_0_0.getFlag(arg_184_0, arg_184_1, arg_184_2)
	return pg.ShipFlagMgr.GetInstance():GetShipFlag(arg_184_0.id, arg_184_1, arg_184_2)
end

function var_0_0.hasAnyFlag(arg_185_0, arg_185_1)
	return _.any(arg_185_1, function(arg_186_0)
		return arg_185_0:getFlag(arg_186_0)
	end)
end

function var_0_0.isBreakOut(arg_187_0)
	return arg_187_0.configId % 10 > 1
end

function var_0_0.fateSkillChange(arg_188_0, arg_188_1)
	if not arg_188_0.skillChangeList then
		arg_188_0.skillChangeList = arg_188_0:isBluePrintShip() and arg_188_0:getBluePrint():getChangeSkillList() or {}
	end

	for iter_188_0, iter_188_1 in ipairs(arg_188_0.skillChangeList) do
		if iter_188_1[1] == arg_188_1 and arg_188_0.skills[iter_188_1[2]] then
			return iter_188_1[2]
		end
	end

	return arg_188_1
end

function var_0_0.RemapSkillId(arg_189_0, arg_189_1)
	local var_189_0 = arg_189_0:GetSpWeapon()

	if var_189_0 then
		if table.contains(pg.ship_data_template[arg_189_0.configId].hide_buff_list, arg_189_1) then
			return var_189_0:RemapHiddenSkillId(arg_189_1)
		else
			return var_189_0:RemapSkillId(arg_189_1)
		end
	end

	return arg_189_1
end

function var_0_0.getSkillList(arg_190_0)
	local var_190_0 = pg.ship_data_template[arg_190_0.configId]
	local var_190_1 = Clone(var_190_0.buff_list_display)
	local var_190_2 = Clone(var_190_0.buff_list)
	local var_190_3 = pg.ship_data_trans[arg_190_0.groupId]
	local var_190_4 = 0

	if var_190_3 and var_190_3.skill_id ~= 0 then
		local var_190_5 = var_190_3.skill_id
		local var_190_6 = pg.transform_data_template[var_190_5]

		if arg_190_0.transforms[var_190_5] and var_190_6.skill_id ~= 0 then
			table.insert(var_190_2, var_190_6.skill_id)
		end
	end

	local var_190_7 = {}

	for iter_190_0, iter_190_1 in ipairs(var_190_1) do
		for iter_190_2, iter_190_3 in ipairs(var_190_2) do
			if iter_190_1 == iter_190_3 then
				table.insert(var_190_7, arg_190_0:fateSkillChange(iter_190_1))
			end
		end
	end

	return var_190_7
end

function var_0_0.getModAttrTopLimit(arg_191_0, arg_191_1)
	local var_191_0 = ShipModAttr.ATTR_TO_INDEX[arg_191_1]
	local var_191_1 = pg.ship_data_template[arg_191_0.configId].strengthen_id
	local var_191_2 = pg.ship_data_strengthen[var_191_1].durability[var_191_0]

	return calcFloor((3 + 7 * (math.min(arg_191_0.level, 100) / 100)) * var_191_2 * 0.1)
end

function var_0_0.leftModAdditionPoint(arg_192_0, arg_192_1)
	local var_192_0 = arg_192_0:getModProperties(arg_192_1)
	local var_192_1 = arg_192_0:getModExpRatio(arg_192_1)
	local var_192_2 = arg_192_0:getModAttrTopLimit(arg_192_1)
	local var_192_3 = calcFloor(var_192_0 / var_192_1)

	return math.max(0, var_192_2 - var_192_3)
end

function var_0_0.getModAttrBaseMax(arg_193_0, arg_193_1)
	if not table.contains(arg_193_0:getConfig("lock"), arg_193_1) then
		local var_193_0 = arg_193_0:leftModAdditionPoint(arg_193_1)
		local var_193_1 = arg_193_0:getShipProperties()

		return calcFloor(var_193_1[arg_193_1] + var_193_0)
	else
		return 0
	end
end

function var_0_0.getModExpRatio(arg_194_0, arg_194_1)
	if not table.contains(arg_194_0:getConfig("lock"), arg_194_1) then
		local var_194_0 = pg.ship_data_template[arg_194_0.configId].strengthen_id

		assert(pg.ship_data_strengthen[var_194_0], "ship_data_strengthen>>>>>>" .. var_194_0)

		return math.max(pg.ship_data_strengthen[var_194_0].level_exp[ShipModAttr.ATTR_TO_INDEX[arg_194_1]], 1)
	else
		return 1
	end
end

function var_0_0.inUnlockTip(arg_195_0)
	local var_195_0 = pg.gameset.tip_unlock_shipIds.description[0]

	return table.contains(var_195_0, arg_195_0)
end

function var_0_0.proposeSkinOwned(arg_196_0, arg_196_1)
	return arg_196_1 and arg_196_0.propose and arg_196_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE
end

function var_0_0.getProposeSkin(arg_197_0)
	return ShipSkin.GetSkinByType(arg_197_0.groupId, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getDisplaySkillIds(arg_198_0)
	return _.map(pg.ship_data_template[arg_198_0.configId].buff_list_display, function(arg_199_0)
		return arg_198_0:fateSkillChange(arg_199_0)
	end)
end

function var_0_0.isFullSkillLevel(arg_200_0)
	local var_200_0 = pg.skill_data_template

	for iter_200_0, iter_200_1 in pairs(arg_200_0.skills) do
		if var_200_0[iter_200_1.id].max_level ~= iter_200_1.level then
			return false
		end
	end

	return true
end

function var_0_0.setEquipmentRecord(arg_201_0, arg_201_1, arg_201_2)
	local var_201_0 = "equipment_record" .. "_" .. arg_201_1 .. "_" .. arg_201_0.id

	PlayerPrefs.SetString(var_201_0, table.concat(_.flatten(arg_201_2), ":"))
	PlayerPrefs.Save()
end

function var_0_0.getEquipmentRecord(arg_202_0, arg_202_1)
	if not arg_202_0.equipmentRecords then
		local var_202_0 = "equipment_record" .. "_" .. arg_202_1 .. "_" .. arg_202_0.id
		local var_202_1 = string.split(PlayerPrefs.GetString(var_202_0) or "", ":")
		local var_202_2 = {}

		for iter_202_0 = 1, 3 do
			var_202_2[iter_202_0] = _.map(_.slice(var_202_1, 5 * iter_202_0 - 4, 5), function(arg_203_0)
				return tonumber(arg_203_0)
			end)
		end

		arg_202_0.equipmentRecords = var_202_2
	end

	return arg_202_0.equipmentRecords
end

function var_0_0.SetSpWeaponRecord(arg_204_0, arg_204_1, arg_204_2)
	local var_204_0 = "spweapon_record" .. "_" .. arg_204_1 .. "_" .. arg_204_0.id
	local var_204_1 = _.map({
		1,
		2,
		3
	}, function(arg_205_0)
		local var_205_0 = arg_204_2[arg_205_0]

		if var_205_0 then
			return (var_205_0:GetUID() or 0) .. "," .. var_205_0:GetConfigID()
		else
			return "0,0"
		end
	end)

	PlayerPrefs.SetString(var_204_0, table.concat(var_204_1, ":"))
	PlayerPrefs.Save()
end

function var_0_0.GetSpWeaponRecord(arg_206_0, arg_206_1)
	local var_206_0 = "spweapon_record" .. "_" .. arg_206_1 .. "_" .. arg_206_0.id

	return (_.map(string.split(PlayerPrefs.GetString(var_206_0, ""), ":"), function(arg_207_0)
		local var_207_0 = string.split(arg_207_0, ",")

		assert(var_207_0)

		local var_207_1 = tonumber(var_207_0[1])
		local var_207_2 = tonumber(var_207_0[2])

		if not var_207_2 or var_207_2 == 0 then
			return false
		end

		return (SpWeapon.New({
			id = var_207_2
		}))
	end))
end

function var_0_0.hasEquipEquipmentSkin(arg_208_0)
	for iter_208_0, iter_208_1 in ipairs(arg_208_0.equipments) do
		if iter_208_1 and iter_208_1:hasSkin() then
			return true
		end
	end

	return false
end

function var_0_0.hasCommander(arg_209_0)
	return arg_209_0.commanderId and arg_209_0.commanderId ~= 0
end

function var_0_0.getCommander(arg_210_0)
	return arg_210_0.commanderId
end

function var_0_0.setCommander(arg_211_0, arg_211_1)
	arg_211_0.commanderId = arg_211_1
end

function var_0_0.getSkillIndex(arg_212_0, arg_212_1)
	local var_212_0 = arg_212_0:getSkillList()

	for iter_212_0, iter_212_1 in ipairs(var_212_0) do
		if arg_212_1 == iter_212_1 then
			return iter_212_0
		end
	end
end

function var_0_0.getTactics(arg_213_0)
	return 1, "tactics_attack"
end

function var_0_0.IsBgmSkin(arg_214_0)
	local var_214_0 = arg_214_0:GetSkinConfig()

	return table.contains(var_214_0.tag, ShipSkin.WITH_BGM)
end

function var_0_0.GetSkinBgm(arg_215_0)
	if arg_215_0:IsBgmSkin() then
		return arg_215_0:GetSkinConfig().bgm
	end
end

function var_0_0.isIntensifyMax(arg_216_0)
	local var_216_0 = intProperties(arg_216_0:getShipProperties())

	if arg_216_0:isBluePrintShip() then
		return true
	end

	for iter_216_0, iter_216_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_216_0:getModAttrBaseMax(iter_216_1) ~= var_216_0[iter_216_1] then
			return false
		end
	end

	return true
end

function var_0_0.isRemouldable(arg_217_0)
	return not arg_217_0:isTestShip() and not arg_217_0:isBluePrintShip() and pg.ship_data_trans[arg_217_0.groupId]
end

function var_0_0.isAllRemouldFinish(arg_218_0)
	local var_218_0 = pg.ship_data_trans[arg_218_0.groupId]

	assert(var_218_0, "this ship group without remould config:" .. arg_218_0.groupId)

	for iter_218_0, iter_218_1 in ipairs(var_218_0.transform_list) do
		for iter_218_2, iter_218_3 in ipairs(iter_218_1) do
			local var_218_1 = pg.transform_data_template[iter_218_3[2]]

			if #var_218_1.edit_trans > 0 then
				-- block empty
			elseif not arg_218_0.transforms[iter_218_3[2]] or arg_218_0.transforms[iter_218_3[2]].level < var_218_1.max_level then
				return false
			end
		end
	end

	return true
end

function var_0_0.isSpecialFilter(arg_219_0)
	local var_219_0 = pg.ship_data_statistics[arg_219_0.configId]

	assert(var_219_0, "this ship without statistics:" .. arg_219_0.configId)

	for iter_219_0, iter_219_1 in ipairs(var_219_0.tag_list) do
		if iter_219_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.hasAvailiableSkin(arg_220_0)
	local var_220_0 = getProxy(ShipSkinProxy)
	local var_220_1 = var_220_0:GetAllSkinForShip(arg_220_0)
	local var_220_2 = var_220_0:getRawData()
	local var_220_3 = 0

	for iter_220_0, iter_220_1 in ipairs(var_220_1) do
		if arg_220_0:proposeSkinOwned(iter_220_1) or var_220_2[iter_220_1.id] or var_220_0:hasSkin(iter_220_1.id) then
			var_220_3 = var_220_3 + 1
		end
	end

	return var_220_3 > 0
end

function var_0_0.hasProposeSkin(arg_221_0)
	local var_221_0 = getProxy(ShipSkinProxy)
	local var_221_1 = var_221_0:GetAllSkinForShip(arg_221_0)

	for iter_221_0, iter_221_1 in ipairs(var_221_1) do
		if iter_221_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	local var_221_2 = var_221_0:GetShareSkinsForShip(arg_221_0)

	for iter_221_2, iter_221_3 in ipairs(var_221_2) do
		if iter_221_3.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
			return true
		end
	end

	return false
end

function var_0_0.HasUniqueSpWeapon(arg_222_0)
	return tobool(pg.spweapon_data_statistics.get_id_list_by_unique[arg_222_0:getGroupId()])
end

function var_0_0.getAircraftReloadCD(arg_223_0)
	local var_223_0 = arg_223_0:getConfigTable().base_list
	local var_223_1 = arg_223_0:getConfigTable().default_equip_list
	local var_223_2 = 0
	local var_223_3 = 0

	for iter_223_0 = 1, 3 do
		local var_223_4 = arg_223_0:getEquip(iter_223_0)
		local var_223_5 = var_223_4 and var_223_4.configId or var_223_1[iter_223_0]
		local var_223_6 = Equipment.getConfigData(var_223_5).type

		if underscore.any(EquipType.AirEquipTypes, function(arg_224_0)
			return var_223_6 == arg_224_0
		end) then
			var_223_2 = var_223_2 + Equipment.GetEquipReloadStatic(var_223_5) * var_223_0[iter_223_0]
			var_223_3 = var_223_3 + var_223_0[iter_223_0]
		end
	end

	local var_223_7 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT

	return {
		name = i18n("equip_info_31"),
		type = AttributeType.CD,
		value = var_223_2 / var_223_3 * var_223_7
	}
end

function var_0_0.IsTagShip(arg_225_0, arg_225_1)
	local var_225_0 = arg_225_0:getConfig("tag_list")

	return table.contains(var_225_0, arg_225_1)
end

function var_0_0.setReMetaSpecialItemVO(arg_226_0, arg_226_1)
	arg_226_0.reMetaSpecialItemVO = arg_226_1
end

function var_0_0.getReMetaSpecialItemVO(arg_227_0, arg_227_1)
	return arg_227_0.reMetaSpecialItemVO
end

function var_0_0.getProposeType(arg_228_0)
	if arg_228_0:isMetaShip() then
		return "meta"
	elseif arg_228_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_229_0)
	return arg_229_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.getSpecificType(arg_230_0)
	return pg.ship_data_template[arg_230_0.configId].specific_type
end

function var_0_0.GetSpWeapon(arg_231_0)
	return arg_231_0.spWeapon
end

function var_0_0.UpdateSpWeapon(arg_232_0, arg_232_1)
	local var_232_0 = (arg_232_1 and arg_232_1:GetUID() or 0) == (arg_232_0.spWeapon and arg_232_0.spWeapon:GetUID() or 0)

	arg_232_0.spWeapon = arg_232_1

	if arg_232_1 then
		arg_232_1:SetShipId(arg_232_0.id)
	end

	if var_232_0 then
		pg.m02:sendNotification(EquipmentProxy.SPWEAPONS_UPDATED)
	end
end

function var_0_0.CanEquipSpWeapon(arg_233_0, arg_233_1)
	local var_233_0, var_233_1 = arg_233_0:IsSpWeaponForbidden(arg_233_1)

	if var_233_0 then
		return false, var_233_1
	end

	return true
end

function var_0_0.IsSpWeaponForbidden(arg_234_0, arg_234_1)
	local var_234_0 = arg_234_1:GetWearableShipTypes()
	local var_234_1 = arg_234_0:getShipType()

	if not table.contains(var_234_0, var_234_1) then
		return true, i18n("spweapon_tip_group_error")
	end

	local var_234_2 = arg_234_1:GetUniqueGroup()
	local var_234_3 = arg_234_0:getGroupId()

	if var_234_2 ~= 0 and var_234_2 ~= var_234_3 then
		return true, i18n("spweapon_tip_group_error")
	end

	return false
end

function var_0_0.GetMapStrikeAnim(arg_235_0)
	local var_235_0
	local var_235_1 = arg_235_0:getShipType()

	switch(TeamType.GetTeamFromShipType(var_235_1), {
		[TeamType.Main] = function()
			if ShipType.IsTypeQuZhu(var_235_1) then
				var_235_0 = "SubTorpedoUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleAircraftCarrier, var_235_1) then
				var_235_0 = "AirStrikeUI"
			elseif ShipType.ContainInLimitBundle(ShipType.BundleBattleShip, var_235_1) then
				var_235_0 = "CannonUI"
			else
				var_235_0 = "CannonUI"
			end
		end,
		[TeamType.Vanguard] = function()
			if ShipType.IsTypeQuZhu(var_235_1) then
				var_235_0 = "SubTorpedoUI"
			end
		end,
		[TeamType.Submarine] = function()
			if arg_235_0:getNation() == Nation.MOT then
				var_235_0 = "CannonUI"
			else
				var_235_0 = "SubTorpedoUI"
			end
		end
	})

	return var_235_0
end

function var_0_0.IsDefaultSkin(arg_239_0)
	local var_239_0 = arg_239_0:getSkinId()

	return var_239_0 == 0 or var_239_0 == arg_239_0:getConfig("skin_id")
end

function var_0_0.IsMatchKey(arg_240_0, arg_240_1)
	if not arg_240_1 or arg_240_1 == "" then
		return true
	end

	arg_240_1 = string.lower(string.gsub(arg_240_1, "%.", "%%."))

	local var_240_0 = {
		arg_240_0:getName(),
		arg_240_0:GetDefaultName()
	}

	if var_240_0[1] == var_240_0[2] then
		table.remove(var_240_0)
	end

	return underscore.any(var_240_0, function(arg_241_0)
		return string.find(string.lower(arg_241_0), arg_240_1)
	end)
end

function var_0_0.IsOwner(arg_242_0)
	return tobool(arg_242_0.id)
end

function var_0_0.GetUniqueId(arg_243_0)
	return arg_243_0.id
end

function var_0_0.ShowPropose(arg_244_0)
	if not arg_244_0.propose then
		return false
	else
		return not HXSet.isHxPropose() or arg_244_0:IsOwner() and arg_244_0:GetUniqueId() == getProxy(PlayerProxy):getRawData():GetProposeShipId()
	end
end

function var_0_0.GetColorName(arg_245_0, arg_245_1)
	arg_245_1 = arg_245_1 or arg_245_0:getName()

	if PlayerPrefs.GetInt("SHIP_NAME_COLOR", PLATFORM_CODE == PLATFORM_CH and 1 or 0) == 1 and arg_245_0.propose then
		return setColorStr(arg_245_1, "#FFAACEFF")
	else
		return arg_245_1
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

function var_0_0.GetFrameAndEffect(arg_246_0, arg_246_1)
	arg_246_1 = tobool(arg_246_1)

	local var_246_0
	local var_246_1

	if arg_246_0.propose then
		if arg_246_0:isMetaShip() then
			var_246_1 = string.format(var_0_9.effect[1])
			var_246_0 = string.format(var_0_9.frame[1])
		elseif arg_246_0:isBluePrintShip() then
			var_246_1 = string.format(var_0_9.effect[2])
			var_246_0 = string.format(var_0_9.frame[2], arg_246_0:rarity2bgPrint())
		else
			var_246_1 = string.format(var_0_9.effect[3])
			var_246_0 = string.format(var_0_9.frame[3])
		end

		if not arg_246_0:ShowPropose() then
			var_246_0 = nil
		end
	elseif arg_246_0:isMetaShip() then
		var_246_1 = string.format(var_0_9.effect[4], arg_246_0:rarity2bgPrint())
	elseif arg_246_0:getRarity() == ShipRarity.SSR then
		var_246_1 = string.format(var_0_9.effect[5])
	end

	if arg_246_1 then
		var_246_1 = var_246_1 and var_246_1 .. "_1"
	end

	return var_246_0, var_246_1
end

function var_0_0.GetRecordPosKey(arg_247_0)
	return arg_247_0:getSkinId()
end

function var_0_0.GetShipPhantomMark(arg_248_0, arg_248_1)
	return ShipPhantom.PackMark(arg_248_0.id, arg_248_1)
end

function var_0_0.GetSelectMark(arg_249_0)
	return arg_249_0.id
end

return var_0_0
