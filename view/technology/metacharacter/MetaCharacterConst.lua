MetaCharacterConst = {}

local var_0_0 = MetaCharacterConst

var_0_0.Meta_Type_Act_PT = 1
var_0_0.Meta_Type_Build = 2
var_0_0.Meta_Type_Pass = 3
var_0_0.REPAIR_ATTRS = {
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.Air,
	AttributeType.Reload
}
var_0_0.ENERGY_ATTRS = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.AntiSub,
	AttributeType.Expend
}
var_0_0.UIConfig = {}

setmetatable(var_0_0.UIConfig, {
	__index = function(arg_1_0, arg_1_1)
		local var_1_0 = pg.ship_strengthen_meta[arg_1_1].uiconfig

		if var_1_0 then
			return var_1_0
		else
			return var_0_0.UIConfig[970701]
		end
	end
})

var_0_0.META_ART_RESOURCE_PERFIX = "metaship/"
var_0_0.META_ACTIVE_LASTFIX = "_active"
var_0_0.META_DISACTIVE_LASTFIX = "_disactive"
var_0_0.META_BANNER_PERFIX = "banner_"
var_0_0.META_NAME_PERFIX = "name_"
var_0_0.META_TOAST_PERFIX = "toast_"
var_0_0.HX_TAG = "_hx"

function var_0_0.GetMetaCharacterPaintPath(arg_2_0, arg_2_1)
	if not HXSet.isHx() then
		if arg_2_1 == true then
			local var_2_0 = arg_2_0 .. var_0_0.META_ACTIVE_LASTFIX

			return var_0_0.META_ART_RESOURCE_PERFIX .. var_2_0, var_2_0
		else
			local var_2_1 = arg_2_0 .. var_0_0.META_DISACTIVE_LASTFIX

			return var_0_0.META_ART_RESOURCE_PERFIX .. var_2_1, var_2_1
		end
	elseif arg_2_1 == true then
		local var_2_2 = arg_2_0 .. var_0_0.META_ACTIVE_LASTFIX .. var_0_0.HX_TAG
		local var_2_3 = var_0_0.META_ART_RESOURCE_PERFIX .. var_2_2

		if not checkABExist(var_2_3) then
			var_2_2 = arg_2_0 .. var_0_0.META_ACTIVE_LASTFIX
			var_2_3 = var_0_0.META_ART_RESOURCE_PERFIX .. var_2_2
		end

		return var_2_3, var_2_2
	else
		local var_2_4 = arg_2_0 .. var_0_0.META_DISACTIVE_LASTFIX .. var_0_0.HX_TAG
		local var_2_5 = var_0_0.META_ART_RESOURCE_PERFIX .. var_2_4

		if not checkABExist(var_2_5) then
			var_2_4 = arg_2_0 .. var_0_0.META_DISACTIVE_LASTFIX
			var_2_5 = var_0_0.META_ART_RESOURCE_PERFIX .. var_2_4
		end

		return var_2_5, var_2_4
	end
end

function var_0_0.GetMetaCharacterBannerPath(arg_3_0)
	local var_3_0 = var_0_0.META_BANNER_PERFIX .. arg_3_0

	return var_0_0.META_ART_RESOURCE_PERFIX .. var_3_0, var_3_0
end

function var_0_0.GetMetaCharacterNamePath(arg_4_0)
	local var_4_0 = var_0_0.META_NAME_PERFIX .. arg_4_0

	return var_0_0.META_ART_RESOURCE_PERFIX .. var_4_0, var_4_0
end

function var_0_0.GetMetaCharacterToastPath(arg_5_0)
	local var_5_0 = var_0_0.META_TOAST_PERFIX .. arg_5_0

	return var_0_0.META_ART_RESOURCE_PERFIX .. var_5_0, var_5_0
end

function var_0_0.GetMetaShipGroupIDByConfigID(arg_6_0)
	return math.floor(arg_6_0 / 10)
end

function var_0_0.isMetaRepairRedTag(arg_7_0)
	if not arg_7_0 then
		return false
	end

	local var_7_0 = getProxy(BayProxy):getMetaShipByGroupId(arg_7_0)

	if not var_7_0 then
		return false
	end

	local var_7_1 = var_7_0:getMetaCharacter()

	if not var_7_1 then
		return false
	end

	local var_7_2 = false

	for iter_7_0, iter_7_1 in ipairs(MetaCharacterConst.REPAIR_ATTRS) do
		var_7_2 = var_7_1:getAttrVO(iter_7_1):isCanRepair()

		if var_7_2 == true then
			break
		end
	end

	return var_7_2
end

function var_0_0.isMetaEnergyRedTag(arg_8_0)
	if not arg_8_0 then
		return false
	end

	local var_8_0 = getProxy(BayProxy):getMetaShipByGroupId(arg_8_0)

	if not var_8_0 then
		return false
	end

	local var_8_1 = var_8_0:getMetaCharacter()

	if not var_8_1 then
		return false
	end

	local var_8_2 = true
	local var_8_3 = var_8_1:getBreakOutInfo()

	if not var_8_3:hasNextInfo() then
		var_8_2 = false
	end

	local var_8_4, var_8_5 = var_8_3:getLimited()

	if var_8_4 > var_8_0.level or var_8_5 > var_8_1:getCurRepairExp() then
		var_8_2 = false
	end

	local var_8_6, var_8_7 = var_8_3:getConsume()
	local var_8_8
	local var_8_9
	local var_8_10
	local var_8_11 = var_8_7[1].itemId

	if var_8_7[1].count > getProxy(BagProxy):getItemCountById(var_8_11) then
		var_8_2 = false
	end

	if var_8_6 > getProxy(PlayerProxy):getData().gold then
		var_8_2 = false
	end

	return var_8_2
end

function var_0_0.isMetaTacticsRedTag(arg_9_0)
	return getProxy(MetaCharacterProxy):getRedTag(arg_9_0)
end

function var_0_0.isMetaSynRedTag(arg_10_0)
	if not arg_10_0 then
		return false
	end

	local var_10_0 = getProxy(BayProxy):getMetaShipByGroupId(arg_10_0)

	if not var_10_0 then
		return false
	end

	if not var_10_0:getMetaCharacter() then
		return false
	end

	local var_10_1 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_10_0)

	if var_10_1:isPassType() or var_10_1:isBuildType() then
		return false
	end

	if not var_10_1:isShow() then
		return false
	end

	local var_10_2 = false

	if var_10_1.metaPtData then
		var_10_2 = var_10_1.metaPtData:CanGetAward()
	end

	return var_10_2
end

function var_0_0.isMetaMainSceneRedTag(arg_11_0)
	if not arg_11_0 then
		return false
	end

	if getProxy(BayProxy):getMetaShipByGroupId(arg_11_0) then
		return false
	end

	local var_11_0 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_11_0)

	if var_11_0:isPassType() or var_11_0:isBuildType() then
		return false
	end

	if not var_11_0:isShow() then
		return false
	end

	local var_11_1 = var_11_0:getMetaProgressPTState()

	if var_11_1 == MetaProgress.STATE_CAN_FINISH or var_11_1 == MetaProgress.STATE_CAN_AWARD then
		return true
	end
end

function var_0_0.isMetaMainEntRedPoint()
	local var_12_0 = getProxy(MetaCharacterProxy):getMetaProgressVOList()

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		if (var_0_0.isMetaMainSceneRedTag(iter_12_1.id) or var_0_0.isMetaSynRedTag(iter_12_1.id)) == true then
			return true
		end
	end

	return false
end

function var_0_0.isMetaBannerRedPoint(arg_13_0)
	local var_13_0 = var_0_0.isMetaTacticsRedTag(arg_13_0) or var_0_0.isMetaSynRedTag(arg_13_0)
	local var_13_1 = getProxy(BayProxy):getMetaShipByGroupId(arg_13_0)

	if var_13_1 then
		local var_13_2 = getProxy(MetaCharacterProxy):getMetaTacticsInfoByShipID(var_13_1.id):getTacticsStateForShow() == MetaTacticsInfo.States.LearnAble

		var_13_0 = var_13_0 or var_13_2
	else
		local var_13_3 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_13_0)

		if var_13_3:isPtType() then
			var_13_0 = var_13_0 or var_13_3.metaPtData:CanGetAward()
		end
	end

	return var_13_0
end

function var_0_0.getFinalSkillIDListByMetaGroupID(arg_14_0)
	local var_14_0

	for iter_14_0 = 1, 4 do
		local var_14_1 = arg_14_0 * 10 + iter_14_0

		if pg.ship_data_template[var_14_1] then
			var_14_0 = var_14_1
		end

		break
	end

	local var_14_2 = {}

	for iter_14_1, iter_14_2 in ipairs(pg.ship_data_template[var_14_0].buff_list_display) do
		table.insert(var_14_2, iter_14_2)
	end

	return var_14_2
end

function var_0_0.getTacticsSkillIDListByShipConfigID(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = pg.ship_data_template[arg_15_0].buff_list_display

	for iter_15_0, iter_15_1 in ipairs(var_15_1) do
		if MetaCharacterConst.isMetaTaskSkillID(iter_15_1) then
			table.insert(var_15_0, iter_15_1)
		end
	end

	return var_15_0
end

function var_0_0.getMetaSkillTacticsConfig(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(pg.ship_meta_skilltask.all) do
		local var_16_0 = pg.ship_meta_skilltask[iter_16_1]

		if var_16_0.skill_ID == arg_16_0 and var_16_0.level == arg_16_1 then
			return var_16_0
		end
	end
end

function var_0_0.addReMetaTransItem(arg_17_0, arg_17_1)
	if not arg_17_0.virgin and arg_17_0:isMetaShip() and Player.isMetaShipNeedToTrans(arg_17_0.configId) then
		local var_17_0 = Player.metaShip2Res(arg_17_0.configId)

		if not arg_17_1 then
			for iter_17_0, iter_17_1 in ipairs(var_17_0) do
				local var_17_1 = iter_17_1.type
				local var_17_2 = iter_17_1.id
				local var_17_3 = iter_17_1.count
				local var_17_4 = Drop.New({
					type = var_17_1,
					id = var_17_2,
					count = var_17_3
				})

				pg.m02:sendNotification(GAME.ADD_ITEM, var_17_4)
			end
		end

		local var_17_5 = var_17_0[1].type
		local var_17_6 = var_17_0[1].id
		local var_17_7 = var_17_0[1].count

		return (Drop.New({
			type = var_17_5,
			id = var_17_6,
			count = var_17_7
		}))
	end
end

function var_0_0.isMetaTaskSkillID(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(pg.ship_meta_skilltask.all) do
		if pg.ship_meta_skilltask[iter_18_1].skill_ID == arg_18_0 then
			return true
		end
	end

	return false
end

function var_0_0.isMetaInArchive(arg_19_0)
	local var_19_0 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(arg_19_0)

	if var_19_0:isPtType() and var_19_0:isInArchive() then
		return true
	else
		return false
	end
end

function var_0_0.getRepairAbleMetaProgressVOList()
	local var_20_0 = {}
	local var_20_1 = getProxy(MetaCharacterProxy):getMetaProgressVOList()

	for iter_20_0, iter_20_1 in ipairs(var_20_1) do
		local var_20_2 = iter_20_1.metaShipVO

		if var_20_2 then
			local var_20_3 = var_20_2:getMetaCharacter()

			if var_20_3 and var_20_3:getRepairRate() < 1 then
				table.insert(var_20_0, iter_20_1)
			end
		end
	end

	return var_20_0
end

function var_0_0.getTacticsAbleMetaProgressVOList()
	local var_21_0 = {}
	local var_21_1 = getProxy(MetaCharacterProxy):getMetaProgressVOList()

	for iter_21_0, iter_21_1 in ipairs(var_21_1) do
		local var_21_2 = iter_21_1.metaShipVO

		if var_21_2 and not var_21_2:isAllMetaSkillLevelMax() then
			table.insert(var_21_0, iter_21_1)
		end
	end

	return var_21_0
end

function var_0_0.getEnergyAbleMetaProgressVOList()
	local var_22_0 = {}
	local var_22_1 = getProxy(MetaCharacterProxy):getMetaProgressVOList()

	for iter_22_0, iter_22_1 in ipairs(var_22_1) do
		local var_22_2 = iter_22_1.metaShipVO

		if var_22_2 and not var_22_2:isMaxStar() then
			table.insert(var_22_0, iter_22_1)
		end
	end

	return var_22_0
end

function var_0_0.filteMetaByType(arg_23_0, arg_23_1)
	if not arg_23_1 or arg_23_1 == ShipIndexConst.TypeAll then
		return true
	end

	local function var_23_0(arg_24_0)
		local var_24_0

		for iter_24_0 = 1, 4 do
			local var_24_1 = arg_24_0 * 10 + iter_24_0

			if pg.ship_data_template[var_24_1] then
				var_24_0 = var_24_1
			end

			break
		end

		return pg.ship_data_statistics[var_24_0].type
	end

	local function var_23_1(arg_25_0)
		return ShipType.GetTeamFromShipType(arg_25_0)
	end

	for iter_23_0 = 2, #ShipIndexCfg.type do
		local var_23_2 = bit.lshift(1, iter_23_0 - 2)

		if bit.band(var_23_2, arg_23_1) > 0 then
			if iter_23_0 < 4 then
				local var_23_3 = var_23_0(arg_23_0.id)
				local var_23_4 = var_23_1(var_23_3)
				local var_23_5 = ShipIndexCfg.type[iter_23_0].shipTypes
				local var_23_6 = ShipIndexCfg.type[iter_23_0].types

				if table.contains(var_23_5, var_23_3) then
					return true
				end

				if table.contains(var_23_6, var_23_4) then
					return true
				end
			else
				local var_23_7 = var_23_0(arg_23_0.id)
				local var_23_8 = ShipIndexCfg.type[iter_23_0].types

				if table.contains(var_23_8, var_23_7) then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.filteMetaByRarity(arg_26_0, arg_26_1)
	if not arg_26_1 or arg_26_1 == ShipIndexConst.RarityAll then
		return true
	end

	local function var_26_0(arg_27_0)
		local var_27_0

		for iter_27_0 = 1, 4 do
			local var_27_1 = arg_27_0 * 10 + iter_27_0

			if pg.ship_data_template[var_27_1] then
				var_27_0 = var_27_1
			end

			break
		end

		return pg.ship_data_statistics[var_27_0].rarity
	end

	for iter_26_0 = 2, #ShipIndexCfg.rarity do
		local var_26_1 = bit.lshift(1, iter_26_0 - 2)

		if bit.band(var_26_1, arg_26_1) > 0 then
			local var_26_2 = ShipIndexCfg.rarity[iter_26_0].types

			if table.contains(var_26_2, var_26_0(arg_26_0.id)) then
				return true
			end
		end
	end

	return false
end

function var_0_0.filteMetaExtra(arg_28_0, arg_28_1)
	if not arg_28_1 or arg_28_1 == ShipIndexConst.MetaExtraAll then
		return true
	end

	if ShipIndexConst.MetaExtraRepair == arg_28_1 then
		return var_0_0.filteMetaRepairAble(arg_28_0)
	elseif ShipIndexConst.MetaExtraTactics == arg_28_1 then
		return var_0_0.filteMetaTacticsAble(arg_28_0)
	elseif ShipIndexConst.MetaExtraEnergy == arg_28_1 then
		return var_0_0.filteMetaEnergyAble(arg_28_0)
	else
		return false
	end
end

function var_0_0.filteMetaRepairAble(arg_29_0)
	local var_29_0 = arg_29_0.metaShipVO

	if var_29_0 then
		local var_29_1 = var_29_0:getMetaCharacter()

		if var_29_1 and var_29_1:getRepairRate() < 1 then
			return true
		end
	end

	return false
end

function var_0_0.filteMetaTacticsAble(arg_30_0)
	local var_30_0 = arg_30_0.metaShipVO

	if var_30_0 and not var_30_0:isAllMetaSkillLevelMax() then
		return true
	end

	return false
end

function var_0_0.filteMetaEnergyAble(arg_31_0)
	local var_31_0 = arg_31_0.metaShipVO

	if var_31_0 and not var_31_0:isMaxStar() then
		return true
	end

	return false
end

function var_0_0.filteMetaSynAble(arg_32_0)
	if arg_32_0:isPtType() then
		return not arg_32_0:IsGotAllAwards()
	else
		return false
	end
end

return var_0_0
