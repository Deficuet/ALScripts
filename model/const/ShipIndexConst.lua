local var_0_0 = class("ShipIndexConst")

var_0_0.SortRarity = bit.lshift(1, 0)
var_0_0.SortLevel = bit.lshift(1, 1)
var_0_0.SortPower = bit.lshift(1, 2)
var_0_0.SortAchivedTime = bit.lshift(1, 3)
var_0_0.SortIntimacy = bit.lshift(1, 4)
var_0_0.SortEnergy = bit.lshift(1, 13)
var_0_0.SortProperty_Cannon = bit.lshift(1, 5)
var_0_0.SortProperty_Air = bit.lshift(1, 6)
var_0_0.SortProperty_Dodge = bit.lshift(1, 7)
var_0_0.SortProperty_AntiAircraft = bit.lshift(1, 8)
var_0_0.SortProperty_Torpedo = bit.lshift(1, 9)
var_0_0.SortProperty_Reload = bit.lshift(1, 10)
var_0_0.SortProperty_Durability = bit.lshift(1, 11)
var_0_0.SortProperty_Antisub = bit.lshift(1, 12)
var_0_0.SortPropertyIndexs = {
	var_0_0.SortProperty_Cannon,
	var_0_0.SortProperty_Air,
	var_0_0.SortProperty_Dodge,
	var_0_0.SortProperty_AntiAircraft,
	var_0_0.SortProperty_Torpedo,
	var_0_0.SortProperty_Reload,
	var_0_0.SortProperty_Durability,
	var_0_0.SortProperty_Antisub
}
var_0_0.SortPropertyAll = IndexConst.BitAll(var_0_0.SortPropertyIndexs)

table.insert(var_0_0.SortPropertyIndexs, 1, var_0_0.SortPropertyAll)

var_0_0.SortIndexs = {
	var_0_0.SortRarity,
	var_0_0.SortLevel,
	var_0_0.SortPower,
	var_0_0.SortAchivedTime,
	var_0_0.SortIntimacy,
	var_0_0.SortEnergy
}

function var_0_0.getSortFuncAndName(arg_1_0, arg_1_1)
	for iter_1_0 = 1, #ShipIndexCfg.sort do
		local var_1_0 = bit.lshift(1, iter_1_0 - 1)

		if bit.band(var_1_0, arg_1_0) > 0 then
			return underscore.map(ShipIndexCfg.sort[iter_1_0].sortFuncs, function(arg_2_0)
				return function(arg_3_0)
					return (arg_1_1 and -1 or 1) * arg_2_0(arg_3_0)
				end
			end), ShipIndexCfg.sort[iter_1_0].name
		end
	end
end

var_0_0.SortNames = {
	"word_rarity",
	"word_lv",
	"word_synthesize_power",
	"word_achieved_item",
	"attribute_intimacy",
	"sort_energy"
}
var_0_0.SortPropertyNames = {
	"sort_attribute",
	"word_attr_cannon",
	"word_attr_air",
	"word_attr_dodge",
	"word_attr_antiaircraft",
	"word_attr_torpedo",
	"word_attr_reload",
	"word_attr_durability",
	"word_attr_antisub"
}

function var_0_0.sortByCombatPower()
	return {
		function(arg_5_0)
			return -arg_5_0:getShipCombatPower()
		end,
		function(arg_6_0)
			return arg_6_0.configId
		end
	}
end

function var_0_0.sortByField(arg_7_0)
	return {
		function(arg_8_0)
			return -arg_8_0[arg_7_0]
		end,
		function(arg_9_0)
			return -arg_9_0:getRarity()
		end,
		function(arg_10_0)
			return arg_10_0.configId
		end
	}
end

function var_0_0.sortByProperty(arg_11_0)
	return {
		function(arg_12_0)
			return -arg_12_0:getShipProperties()[arg_11_0]
		end,
		function(arg_13_0)
			return arg_13_0.configId
		end
	}
end

function var_0_0.sortByCfg(arg_14_0)
	return {
		function(arg_15_0)
			return -(arg_14_0 == "rarity" and arg_15_0:getRarity() or arg_15_0:getConfig(arg_14_0))
		end,
		function(arg_16_0)
			return arg_16_0.configId
		end
	}
end

function var_0_0.sortByIntimacy()
	return {
		function(arg_18_0)
			return -arg_18_0.intimacy
		end,
		function(arg_19_0)
			return arg_19_0.propose and 0 or 1
		end,
		function(arg_20_0)
			return arg_20_0.configId
		end,
		function(arg_21_0)
			return -arg_21_0.level
		end
	}
end

function var_0_0.sortByEnergy()
	return {
		function(arg_23_0)
			return -arg_23_0:getEnergy()
		end,
		function(arg_24_0)
			return arg_24_0.configId
		end
	}
end

var_0_0.TypeFront = bit.lshift(1, 0)
var_0_0.TypeBack = bit.lshift(1, 1)
var_0_0.TypeQuZhu = bit.lshift(1, 2)
var_0_0.TypeQingXun = bit.lshift(1, 3)
var_0_0.TypeZhongXun = bit.lshift(1, 4)
var_0_0.TypeZhanLie = bit.lshift(1, 5)
var_0_0.TypeHangMu = bit.lshift(1, 6)
var_0_0.TypeWeiXiu = bit.lshift(1, 7)
var_0_0.TypeQianTing = bit.lshift(1, 8)
var_0_0.TypeOther = bit.lshift(1, 9)
var_0_0.TypeIndexs = {
	var_0_0.TypeFront,
	var_0_0.TypeBack,
	var_0_0.TypeQuZhu,
	var_0_0.TypeQingXun,
	var_0_0.TypeZhongXun,
	var_0_0.TypeZhanLie,
	var_0_0.TypeHangMu,
	var_0_0.TypeWeiXiu,
	var_0_0.TypeQianTing,
	var_0_0.TypeOther
}
var_0_0.TypeAll = IndexConst.BitAll(var_0_0.TypeIndexs)

table.insert(var_0_0.TypeIndexs, 1, var_0_0.TypeAll)

var_0_0.TypeNames = {
	"index_all",
	"index_fleetfront",
	"index_fleetrear",
	"index_shipType_quZhu",
	"index_shipType_qinXun",
	"index_shipType_zhongXun",
	"index_shipType_zhanLie",
	"index_shipType_hangMu",
	"index_shipType_weiXiu",
	"index_shipType_qianTing",
	"index_other"
}

function var_0_0.filterByType(arg_25_0, arg_25_1)
	if not arg_25_1 or arg_25_1 == var_0_0.TypeAll then
		return true
	end

	for iter_25_0 = 2, #ShipIndexCfg.type do
		local var_25_0 = bit.lshift(1, iter_25_0 - 2)

		if bit.band(var_25_0, arg_25_1) > 0 then
			local var_25_1 = ShipIndexCfg.type[iter_25_0].types

			if iter_25_0 < 4 then
				local var_25_2 = ShipIndexCfg.type[iter_25_0].shipTypes

				if table.contains(var_25_1, arg_25_0:getShipType()) then
					return true
				end

				if table.contains(var_25_1, arg_25_0:getTeamType()) then
					return true
				end
			elseif table.contains(var_25_1, arg_25_0:getShipType()) then
				return true
			end
		end
	end

	return false
end

local var_0_1 = {
	"CampUS",
	"CampEN",
	"CampJP",
	"CampDE",
	"CampCN",
	"CampITA",
	"CampSN",
	"CampFF",
	"CampMNF",
	"CampNL",
	"CampMETA",
	"CampMot",
	"CampOther"
}

if LOCK_NATION_HNLMS then
	table.removebyvalue(var_0_1, "CampNL")
end

var_0_0.CampIndexs = {}

for iter_0_0, iter_0_1 in ipairs(var_0_1) do
	var_0_0[iter_0_1] = bit.lshift(1, iter_0_0 - 1)

	table.insert(var_0_0.CampIndexs, var_0_0[iter_0_1])
end

var_0_0.CampAll = IndexConst.BitAll(var_0_0.CampIndexs)

table.insert(var_0_0.CampIndexs, 1, var_0_0.CampAll)

var_0_0.CampNames = {
	"word_shipNation_all",
	"word_shipNation_baiYing",
	"word_shipNation_huangJia",
	"word_shipNation_chongYing",
	"word_shipNation_tieXue",
	"word_shipNation_dongHuang",
	"word_shipNation_saDing",
	"word_shipNation_beiLian",
	"word_shipNation_ziyou",
	"word_shipNation_weixi",
	"word_shipNation_yujinwangguo",
	"word_shipNation_meta_index",
	"word_shipNation_mot",
	"word_shipNation_other"
}

if LOCK_NATION_HNLMS then
	table.removebyvalue(var_0_0.CampNames, "word_shipNation_yujinwangguo")
end

function var_0_0.filterByCamp(arg_26_0, arg_26_1)
	if not arg_26_1 or arg_26_1 == var_0_0.CampAll then
		return true
	end

	local var_26_0 = underscore.to_array(ShipIndexCfg.camp)

	if LOCK_NATION_HNLMS then
		var_26_0 = underscore.filter(var_26_0, function(arg_27_0)
			return #arg_27_0.types ~= 1 or arg_27_0.types[1] ~= Nation.NL
		end)
	end

	for iter_26_0 = 2, #var_26_0 do
		local var_26_1 = bit.lshift(1, iter_26_0 - 2)

		if bit.band(var_26_1, arg_26_1) > 0 then
			local var_26_2 = var_26_0[iter_26_0].types

			for iter_26_1, iter_26_2 in ipairs(var_26_2) do
				if iter_26_2 == Nation.LINK then
					if arg_26_0:getNation() >= Nation.LINK then
						return true
					end
				elseif iter_26_2 == arg_26_0:getNation() then
					return true
				end
			end
		end
	end

	return false
end

var_0_0.Rarity1 = bit.lshift(1, 0)
var_0_0.Rarity2 = bit.lshift(1, 1)
var_0_0.Rarity3 = bit.lshift(1, 2)
var_0_0.Rarity4 = bit.lshift(1, 3)
var_0_0.Rarity5 = bit.lshift(1, 4)
var_0_0.RarityIndexs = {
	var_0_0.Rarity1,
	var_0_0.Rarity2,
	var_0_0.Rarity3,
	var_0_0.Rarity4,
	var_0_0.Rarity5
}
var_0_0.RarityAll = IndexConst.BitAll(var_0_0.RarityIndexs)

table.insert(var_0_0.RarityIndexs, 1, var_0_0.RarityAll)

var_0_0.RarityNames = {
	"index_all",
	"index_rare2",
	"index_rare3",
	"index_rare4",
	"index_rare5",
	"index_rare6"
}

function var_0_0.filterByRarity(arg_28_0, arg_28_1)
	if not arg_28_1 or arg_28_1 == var_0_0.RarityAll then
		return true
	end

	for iter_28_0 = 2, #ShipIndexCfg.rarity do
		local var_28_0 = bit.lshift(1, iter_28_0 - 2)

		if bit.band(var_28_0, arg_28_1) > 0 then
			local var_28_1 = ShipIndexCfg.rarity[iter_28_0].types

			if table.contains(var_28_1, arg_28_0:getRarity()) then
				return true
			end
		end
	end

	return false
end

var_0_0.MetaRarityIndexs = {
	var_0_0.RarityAll,
	var_0_0.Rarity3,
	var_0_0.Rarity4
}
var_0_0.MetaRarityNames = {
	"index_all",
	"index_rare4",
	"index_rare5"
}
var_0_0.MetaExtraRepair = bit.lshift(1, 0)
var_0_0.MetaExtraTactics = bit.lshift(1, 1)
var_0_0.MetaExtraEnergy = bit.lshift(1, 2)
var_0_0.MetaExtraIndexs = {
	var_0_0.MetaExtraRepair,
	var_0_0.MetaExtraTactics,
	var_0_0.MetaExtraEnergy
}
var_0_0.MetaExtraAll = IndexConst.BitAll(var_0_0.MetaExtraIndexs)

table.insert(var_0_0.MetaExtraIndexs, 1, var_0_0.MetaExtraAll)

var_0_0.MetaExtraNames = {
	"index_no_limit",
	"index_meta_repair",
	"index_meta_tactics",
	"index_meta_energy"
}
var_0_0.ExtraSkin = bit.lshift(1, 0)
var_0_0.ExtraRemould = bit.lshift(1, 1)
var_0_0.Extrastrengthen = bit.lshift(1, 2)
var_0_0.ExtraUpgrade = bit.lshift(1, 3)
var_0_0.ExtraNotMaxLv = bit.lshift(1, 4)
var_0_0.ExtraAwakening = bit.lshift(1, 5)
var_0_0.ExtraAwakening2 = bit.lshift(1, 6)
var_0_0.ExtraSpecial = bit.lshift(1, 7)
var_0_0.ExtraProposeSkin = bit.lshift(1, 8)

if not LOCK_SP_WEAPON then
	var_0_0.ExtraUniqueSpWeapon = bit.lshift(1, 9)
	var_0_0.DRESSED = bit.lshift(1, 10)
	var_0_0.ExtraMarry = bit.lshift(1, 11)
else
	var_0_0.DRESSED = bit.lshift(1, 9)
	var_0_0.ExtraMarry = bit.lshift(1, 10)
end

var_0_0.ExtraIndexs = {
	var_0_0.ExtraSkin,
	var_0_0.ExtraRemould,
	var_0_0.Extrastrengthen,
	var_0_0.ExtraUpgrade,
	var_0_0.ExtraNotMaxLv,
	var_0_0.ExtraAwakening,
	var_0_0.ExtraAwakening2,
	var_0_0.ExtraSpecial,
	var_0_0.ExtraProposeSkin
}

if not LOCK_SP_WEAPON then
	table.insert(var_0_0.ExtraIndexs, var_0_0.ExtraUniqueSpWeapon)
end

table.insert(var_0_0.ExtraIndexs, var_0_0.DRESSED)
table.insert(var_0_0.ExtraIndexs, var_0_0.ExtraMarry)

var_0_0.ExtraAll = IndexConst.BitAll(var_0_0.ExtraIndexs)

table.insert(var_0_0.ExtraIndexs, 1, var_0_0.ExtraAll)

var_0_0.ExtraNames = {
	"index_no_limit",
	"index_skin",
	"index_reform_cw",
	"index_strengthen",
	"index_upgrade",
	"index_not_lvmax",
	"index_awakening",
	"index_awakening2",
	"index_special",
	"index_propose_skin"
}

if not LOCK_SP_WEAPON then
	var_0_0.ExtraNames[11] = "index_spweapon"
end

table.insert(var_0_0.ExtraNames, "index_dressed")
table.insert(var_0_0.ExtraNames, "index_marry")

function var_0_0.filterByExtra(arg_29_0, arg_29_1)
	if not arg_29_1 or arg_29_1 == var_0_0.ExtraAll then
		return true
	end

	if arg_29_1 == var_0_0.ExtraSkin then
		return arg_29_0:hasAvailiableSkin()
	elseif arg_29_1 == var_0_0.ExtraRemould then
		return arg_29_0:isRemouldable() and not arg_29_0:isAllRemouldFinish()
	elseif arg_29_1 == var_0_0.Extrastrengthen then
		return not arg_29_0:isMetaShip() and not arg_29_0:isIntensifyMax()
	elseif arg_29_1 == var_0_0.ExtraUpgrade then
		return arg_29_0:canUpgrade()
	elseif arg_29_1 == var_0_0.ExtraNotMaxLv then
		return arg_29_0:notMaxLevelForFilter()
	elseif arg_29_1 == var_0_0.ExtraAwakening then
		return arg_29_0:isAwakening()
	elseif arg_29_1 == var_0_0.ExtraAwakening2 then
		return arg_29_0:isAwakening2()
	elseif arg_29_1 == var_0_0.ExtraSpecial then
		return arg_29_0:isSpecialFilter()
	elseif arg_29_1 == var_0_0.ExtraProposeSkin then
		return arg_29_0:hasProposeSkin()
	elseif arg_29_1 == var_0_0.ExtraUniqueSpWeapon then
		return arg_29_0:HasUniqueSpWeapon()
	elseif arg_29_1 == var_0_0.DRESSED then
		return not arg_29_0:IsDefaultSkin() and arg_29_0:getRemouldSkinId() ~= arg_29_0:getSkinId()
	elseif arg_29_1 == var_0_0.ExtraMarry then
		return arg_29_0.propose
	end

	return false
end

var_0_0.CollExtraSpecial = bit.lshift(1, 0)
var_0_0.CollExtraNotObtained = bit.lshift(1, 1)
var_0_0.CollExtraIndexs = {
	var_0_0.CollExtraSpecial,
	var_0_0.CollExtraNotObtained
}
var_0_0.CollExtraAll = IndexConst.BitAll(var_0_0.CollExtraIndexs)

table.insert(var_0_0.CollExtraIndexs, 1, var_0_0.CollExtraAll)

var_0_0.CollExtraNames = {
	"index_no_limit",
	"index_special",
	"index_not_obtained"
}

function var_0_0.filterByCollExtra(arg_30_0, arg_30_1)
	if not arg_30_1 or arg_30_1 == var_0_0.CollExtraAll then
		return true
	end

	if arg_30_1 == var_0_0.CollExtraSpecial then
		return arg_30_0:isSpecialFilter()
	end

	if arg_30_1 == var_0_0.CollExtraNotObtained then
		local var_30_0 = arg_30_0:getGroupId()
		local var_30_1 = arg_30_0:isRemoulded()
		local var_30_2 = getProxy(CollectionProxy):getShipGroup(var_30_0)

		if ShipGroup.getState(var_30_0, var_30_2, var_30_1) ~= ShipGroup.STATE_UNLOCK then
			return true
		end
	end

	return false
end

return var_0_0
