local var_0_0 = class("ShipGroup", import(".BaseVO"))

var_0_0.REQ_INTERVAL = 60

function var_0_0.GetGroupConfig(arg_1_0)
	local var_1_0 = checkExist(pg.ship_data_group.get_id_list_by_group_type[arg_1_0], {
		1
	})

	return var_1_0 and pg.ship_data_group[var_1_0] or nil
end

function var_0_0.getDefaultShipConfig(arg_2_0)
	return pg.ship_data_statistics[arg_2_0 * 10 + 1]
end

function var_0_0.getDefaultShipNameByGroupID(arg_3_0)
	return var_0_0.getDefaultShipConfig(arg_3_0).name
end

function var_0_0.IsBluePrintGroup(arg_4_0)
	return tobool(pg.ship_data_blueprint[arg_4_0])
end

function var_0_0.IsMetaGroup(arg_5_0)
	return tobool(pg.ship_strengthen_meta[arg_5_0])
end

function var_0_0.IsMotGroup(arg_6_0)
	return var_0_0.getDefaultShipConfig(arg_6_0).nationality == Nation.MOT
end

function var_0_0.LockCv1(arg_7_0)
	local var_7_0 = pg.gameset.profile_cv1_button_block.description

	return table.contains(var_7_0, arg_7_0)
end

var_0_0.STATE_LOCK = 0
var_0_0.STATE_NOTGET = 1
var_0_0.STATE_UNLOCK = 2
var_0_0.ENABLE_SKIP_TO_CHAPTER = true

local var_0_1 = pg.ship_data_group

function var_0_0.getState(arg_8_0, arg_8_1, arg_8_2)
	if var_0_0.ENABLE_SKIP_TO_CHAPTER then
		if arg_8_2 and not arg_8_1 then
			return var_0_0.STATE_NOTGET
		end

		if var_0_1[arg_8_0] then
			local var_8_0 = var_0_1[arg_8_0]

			assert(var_8_0.hide, "hide can not be nil in code " .. arg_8_0)

			if not var_8_0.hide then
				return var_0_0.STATE_LOCK
			end

			if var_8_0.hide == 1 then
				return var_0_0.STATE_LOCK
			elseif var_8_0.hide ~= 0 then
				assert(var_8_0.hide == 0 or var_8_0.hide == 1, "hide sign invalid in code " .. arg_8_0)

				return var_0_0.STATE_LOCK
			end
		end

		if arg_8_1 then
			return var_0_0.STATE_UNLOCK
		else
			local var_8_1 = var_0_1[arg_8_0]

			if not var_8_1 then
				return var_0_0.STATE_LOCK
			end

			assert(var_8_1, "code can not be nil" .. arg_8_0)

			local var_8_2 = var_8_1.redirect_id
			local var_8_3 = getProxy(ChapterProxy)
			local var_8_4

			if var_8_2 ~= 0 then
				var_8_4 = var_8_3:getChapterById(var_8_2)
			end

			if var_8_2 == 0 or var_8_4 and var_8_4:isClear() then
				return var_0_0.STATE_NOTGET
			else
				return var_0_0.STATE_LOCK
			end
		end
	else
		return arg_8_1 and var_0_0.STATE_UNLOCK or var_0_0.STATE_LOCK
	end
end

function var_0_0.Ctor(arg_9_0, arg_9_1)
	arg_9_0.id = arg_9_1.id
	arg_9_0.star = arg_9_1.star
	arg_9_0.hearts = arg_9_1.heart_count
	arg_9_0.iheart = (arg_9_1.heart_flag or 0) > 0
	arg_9_0.married = arg_9_1.marry_flag
	arg_9_0.maxIntimacy = arg_9_1.intimacy_max
	arg_9_0.maxLV = arg_9_1.lv_max
	arg_9_0.evaluation = nil
	arg_9_0.equipCodes = nil
	arg_9_0.lastReqStamp = 0
	arg_9_0.trans = false
	arg_9_0.remoulded = arg_9_1.remoulded

	local var_9_0 = var_0_0.getDefaultShipConfig(arg_9_0.id)

	assert(var_9_0, "can not find ship_data_statistics for group " .. arg_9_0.id)

	arg_9_0.shipConfig = setmetatable({}, {
		__index = function(arg_10_0, arg_10_1)
			return var_9_0[arg_10_1]
		end
	})

	local var_9_1 = var_0_0.GetGroupConfig(arg_9_0.id)

	assert(var_9_1, "can not find ship_data_group for group " .. arg_9_0.id)

	arg_9_0.groupConfig = setmetatable({}, {
		__index = function(arg_11_0, arg_11_1)
			return var_9_1[arg_11_1]
		end
	})
end

function var_0_0.getName(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.shipConfig.name

	if arg_12_1 and arg_12_0.trans then
		local var_12_1 = arg_12_0.groupConfig.trans_skin

		var_12_0 = pg.ship_skin_template[var_12_1].name
	end

	return var_12_0
end

function var_0_0.getNation(arg_13_0)
	return arg_13_0.shipConfig.nationality
end

function var_0_0.getRarity(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.shipConfig.rarity

	if arg_14_1 and arg_14_0.trans then
		var_14_0 = var_14_0 + 1
	end

	return var_14_0
end

function var_0_0.getTeamType(arg_15_0)
	return ShipType.GetTeamFromShipType(arg_15_0:getShipType())
end

function var_0_0.getPainting(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.shipConfig.skin_id

	if arg_16_1 and arg_16_0.trans then
		var_16_0 = arg_16_0.groupConfig.trans_skin
	end

	local var_16_1 = pg.ship_skin_template[var_16_0]

	assert(var_16_1, "ship_skin_template not exist: " .. var_16_0)

	return var_16_1.painting
end

function var_0_0.getPaintingId(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.shipConfig.skin_id

	if arg_17_1 and arg_17_0.trans then
		var_17_0 = arg_17_0.groupConfig.trans_skin
	end

	return var_17_0
end

function var_0_0.getShipType(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.shipConfig.type

	if arg_18_1 and arg_18_0.trans then
		local var_18_1 = Ship.getTransformShipId(arg_18_0.shipConfig.id)

		if var_18_1 then
			var_18_0 = pg.ship_data_statistics[var_18_1].type
		end
	end

	return var_18_0
end

function var_0_0.getShipConfigId(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.shipConfig.id

	if arg_19_1 and arg_19_0.trans then
		local var_19_1 = Ship.getTransformShipId(arg_19_0.shipConfig.id)

		if var_19_1 then
			var_19_0 = pg.ship_data_statistics[var_19_1].id
		end
	end

	return var_19_0
end

function var_0_0.getSkinList(arg_20_0)
	return ShipSkin.GetAllSkinByGroup(arg_20_0)
end

function var_0_0.GetDisplayableSkinList(arg_21_0)
	local var_21_0 = {}

	local function var_21_1(arg_22_0)
		return arg_22_0.skin_type == ShipSkin.SKIN_TYPE_OLD or arg_22_0.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not getProxy(ShipSkinProxy):hasSkin(arg_22_0.id)
	end

	local function var_21_2(arg_23_0)
		return getProxy(ShipSkinProxy):InShowTime(arg_23_0)
	end

	for iter_21_0, iter_21_1 in ipairs(pg.ship_skin_template.all) do
		local var_21_3 = pg.ship_skin_template[iter_21_1]

		if var_21_3.ship_group == arg_21_0 and var_21_3.no_showing ~= "1" and not var_21_1(var_21_3) and var_21_2(var_21_3.id) then
			table.insert(var_21_0, var_21_3)
		end
	end

	for iter_21_2 = #var_21_0, 1, -1 do
		local var_21_4 = var_21_0[iter_21_2]

		if ShipSkin.GetChangeSkinGroupId(var_21_4.id) and ShipSkin.GetChangeSkinIndex(var_21_4.id) ~= 1 then
			table.remove(var_21_0, iter_21_2)
		end
	end

	return var_21_0
end

function var_0_0.getDefaultSkin(arg_24_0)
	return ShipSkin.GetSkinByType(arg_24_0, ShipSkin.SKIN_TYPE_DEFAULT)
end

function var_0_0.getProposeSkin(arg_25_0)
	return ShipSkin.GetSkinByType(arg_25_0, ShipSkin.SKIN_TYPE_PROPOSE)
end

function var_0_0.getModSkin(arg_26_0)
	local var_26_0 = pg.ship_data_trans[arg_26_0]

	if var_26_0 then
		return pg.ship_skin_template[var_26_0.skin_id]
	end

	return nil
end

function var_0_0.GetSkin(arg_27_0, arg_27_1)
	if not arg_27_1 then
		return var_0_0.getDefaultSkin(arg_27_0.id)
	else
		return var_0_0.getModSkin(arg_27_0.id)
	end
end

function var_0_0.updateMaxIntimacy(arg_28_0, arg_28_1)
	arg_28_0.maxIntimacy = math.max(arg_28_1, arg_28_0.maxIntimacy)
end

function var_0_0.updateMarriedFlag(arg_29_0)
	arg_29_0.married = 1
end

function var_0_0.IsMarried(arg_30_0)
	return arg_30_0.married == 1
end

function var_0_0.isBluePrintGroup(arg_31_0)
	return var_0_0.IsBluePrintGroup(arg_31_0.id)
end

function var_0_0.getBluePrintChangeSkillList(arg_32_0)
	assert(arg_32_0:isBluePrintGroup(), "ShipGroup " .. arg_32_0.id .. "isn't BluePrint")

	return pg.ship_data_blueprint[arg_32_0.id].change_skill
end

function var_0_0.GetNationTxt(arg_33_0)
	local var_33_0 = arg_33_0.shipConfig.nationality

	return Nation.Nation2facionName(var_33_0) .. "-" .. Nation.Nation2Name(var_33_0)
end

var_0_0.CONDITION_FORBIDDEN = -1
var_0_0.CONDITION_CLEAR = 0
var_0_0.CONDITION_INTIMACY = 1
var_0_0.CONDITION_MARRIED = 2

function var_0_0.VoiceReplayCodition(arg_34_0, arg_34_1)
	local var_34_0 = true
	local var_34_1 = ""

	if arg_34_0:isBluePrintGroup() then
		local var_34_2 = getProxy(TechnologyProxy):getBluePrintById(arg_34_0.id)

		assert(var_34_2, "blueprint can not be nil >>" .. arg_34_0.id)

		local var_34_3 = var_34_2:getUnlockVoices()

		if not table.contains(var_34_3, arg_34_1.key) then
			local var_34_4 = var_34_2:getUnlockLevel(arg_34_1.key)

			if var_34_4 > 0 then
				var_34_0 = false

				return var_34_0, i18n("ship_profile_voice_locked_design", var_34_4)
			end
		end
	end

	if arg_34_0:isMetaGroup() then
		local var_34_5 = getProxy(BayProxy):getMetaShipByGroupId(arg_34_0.id):getMetaCharacter()
		local var_34_6 = var_34_5:getUnlockedVoiceList()

		if not table.contains(var_34_6, arg_34_1.key) then
			local var_34_7 = var_34_5:getUnlockVoiceRepairPercent(arg_34_1.key)

			if var_34_7 > 0 then
				var_34_0 = false

				return var_34_0, i18n("ship_profile_voice_locked_meta", var_34_7)
			end
		end
	end

	if arg_34_1.unlock_condition[1] == var_0_0.CONDITION_INTIMACY then
		if arg_34_0.maxIntimacy < arg_34_1.unlock_condition[2] then
			var_34_0 = false
			var_34_1 = i18n("ship_profile_voice_locked_intimacy", math.floor(arg_34_1.unlock_condition[2] / 100))
		end
	elseif arg_34_1.unlock_condition[1] == var_0_0.CONDITION_MARRIED and arg_34_0.married == 0 then
		var_34_0 = false

		if arg_34_0:IsXIdol() then
			var_34_1 = i18n("ship_profile_voice_locked_propose_imas")
		else
			var_34_1 = i18n("ship_profile_voice_locked_propose")
		end
	end

	return var_34_0, var_34_1
end

function var_0_0.GetMaxIntimacy(arg_35_0)
	return arg_35_0.maxIntimacy / 100 + (arg_35_0.married and arg_35_0.married * 1000 or 0)
end

function var_0_0.isSpecialFilter(arg_36_0)
	for iter_36_0, iter_36_1 in ipairs(arg_36_0.shipConfig.tag_list) do
		if iter_36_1 == "special" then
			return true
		end
	end

	return false
end

function var_0_0.getGroupId(arg_37_0)
	return arg_37_0.id
end

function var_0_0.isRemoulded(arg_38_0)
	return arg_38_0.remoulded
end

function var_0_0.isMetaGroup(arg_39_0)
	return var_0_0.IsMetaGroup(arg_39_0.id)
end

local var_0_2 = {
	feeling2 = true,
	feeling3 = true,
	feeling5 = true,
	feeling4 = true,
	propose = true,
	feeling1 = true
}

function var_0_0.getIntimacyName(arg_40_0, arg_40_1)
	if not var_0_2[arg_40_1] then
		return
	end

	if arg_40_0:isMetaGroup() then
		return i18n("meta_voice_name_" .. arg_40_1)
	elseif arg_40_0:IsXIdol() then
		return i18n("idolmaster_voice_name_" .. arg_40_1)
	end
end

function var_0_0.getProposeType(arg_41_0)
	if arg_41_0:isMetaGroup() then
		return "meta"
	elseif arg_41_0:IsXIdol() then
		return "imas"
	else
		return "default"
	end
end

function var_0_0.IsXIdol(arg_42_0)
	return arg_42_0:getNation() == Nation.IDOL_LINK
end

function var_0_0.CanUseShareSkin(arg_43_0)
	return arg_43_0.groupConfig.share_group_id and #arg_43_0.groupConfig.share_group_id > 0
end

function var_0_0.rarity2bgPrint(arg_44_0, arg_44_1)
	return shipRarity2bgPrint(arg_44_0:getRarity(arg_44_1), arg_44_0:isBluePrintGroup(), arg_44_0:isMetaGroup())
end

function var_0_0.rarity2bgPrintForGet(arg_45_0, arg_45_1, arg_45_2)
	return skinId2bgPrint(arg_45_2 or arg_45_0:GetSkin(arg_45_1).id) or arg_45_0:rarity2bgPrint(arg_45_1)
end

function var_0_0.setEquipCodes(arg_46_0, arg_46_1)
	arg_46_0.equipCodes = arg_46_1
end

function var_0_0.getEquipCodes(arg_47_0)
	return arg_47_0.equipCodes
end

return var_0_0
