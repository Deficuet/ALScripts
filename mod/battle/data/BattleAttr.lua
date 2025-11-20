ys = ys or {}

local var_0_0 = {}

ys.Battle.BattleAttr = var_0_0

local var_0_1 = ys.Battle.BattleConst

var_0_0.AttrListInheritance = {
	"level",
	"formulaLevel",
	"repressReduce",
	"cannonPower",
	"torpedoPower",
	"antiAirPower",
	"airPower",
	"antiSubPower",
	"fleetGS",
	"loadSpeed",
	"attackRating",
	"dodgeRate",
	"velocity",
	"luck",
	"cri",
	"criDamage",
	"criDamageResist",
	"hiveExtraHP",
	"GCT",
	"bulletSpeedRatio",
	"torpedoSpeedExtra",
	"damageRatioBullet",
	"damageEnhanceProjectile",
	"healingEnhancement",
	"injureRatio",
	"injureRatioByCannon",
	"injureRatioByBulletTorpedo",
	"injureRatioByAir",
	"damageRatioByCannon",
	"damageRatioByBulletTorpedo",
	"damageRatioByAir",
	"damagePreventRantTorpedo",
	"accuracyRateExtra",
	"dodgeRateExtra",
	"perfectDodge",
	"immuneDirectHit",
	"chargeBulletAccuracy",
	"dropBombAccuracy",
	"aircraftBooster",
	"manualEnhancement",
	"initialEnhancement",
	"worldBuffResistance",
	"airResistPierceActive",
	"airResistPierce"
}

function var_0_0.InsertInheritedAttr(arg_1_0)
	for iter_1_0, iter_1_1 in pairs(arg_1_0) do
		var_0_0.AttrListInheritance[#var_0_0.AttrListInheritance + 1] = iter_1_1
	end
end

var_0_0.InsertInheritedAttr(ys.Battle.BattleConfig.AMMO_DAMAGE_ENHANCE)
var_0_0.InsertInheritedAttr(ys.Battle.BattleConfig.AMMO_DAMAGE_REDUCE)
var_0_0.InsertInheritedAttr(ys.Battle.BattleConfig.DAMAGE_AMMO_TO_ARMOR_RATE_ENHANCE)
var_0_0.InsertInheritedAttr(ys.Battle.BattleConfig.DAMAGE_TO_ARMOR_RATE_ENHANCE)
var_0_0.InsertInheritedAttr(ys.Battle.BattleConfig.SHIP_TYPE_ACCURACY_ENHANCE)

var_0_0.TAG_EHC_KEY = "DMG_TAG_EHC_"
var_0_0.FROM_TAG_EHC_KEY = "DMG_FROM_TAG_"
var_0_0.TAG_CRI_EHC_KEY = "CRI_TAG_EHC_"
var_0_0.TAG_CRIDMG_EHC_KEY = "CRIDMG_TAG_EHC_"
var_0_0.ATTACK_ATTR_TYPE = {
	[var_0_1.WeaponDamageAttr.CANNON] = "cannonPower",
	[var_0_1.WeaponDamageAttr.TORPEDO] = "torpedoPower",
	[var_0_1.WeaponDamageAttr.ANTI_AIR] = "antiAirPower",
	[var_0_1.WeaponDamageAttr.AIR] = "airPower",
	[var_0_1.WeaponDamageAttr.ANIT_SUB] = "antiSubPower"
}

function var_0_0.GetAtkAttrByType(arg_2_0, arg_2_1)
	local var_2_0 = var_0_0.ATTACK_ATTR_TYPE[arg_2_1]

	return math.max(arg_2_0[var_2_0], 0)
end

function var_0_0.SetAttr(arg_3_0, arg_3_1)
	arg_3_0._attr = setmetatable({}, {
		__index = arg_3_1
	})
end

function var_0_0.GetAttr(arg_4_0)
	return arg_4_0._attr
end

function var_0_0.SetBaseAttr(arg_5_0)
	arg_5_0._baseAttr = Clone(arg_5_0._attr)
end

function var_0_0.IsInvincible(arg_6_0)
	local var_6_0 = arg_6_0._attr.isInvincible

	return var_6_0 and var_6_0 > 0
end

function var_0_0.AppendInvincible(arg_7_0)
	local var_7_0 = arg_7_0._attr.isInvincible or 0

	arg_7_0._attr.isInvincible = var_7_0 + 1
end

function var_0_0.AddImmuneAreaLimit(arg_8_0, arg_8_1)
	local var_8_0 = (arg_8_0._attr.immuneAreaLimit or 0) + arg_8_1

	arg_8_0._attr.immuneAreaLimit = var_8_0

	arg_8_0._move:ImmuneAreaLimit(var_8_0 > 0)
end

function var_0_0.AddImmuneMaxAreaLimit(arg_9_0, arg_9_1)
	local var_9_0 = (arg_9_0._attr.immuneMaxAreaLimit or 0) + arg_9_1

	arg_9_0._attr.immuneMaxAreaLimit = var_9_0

	arg_9_0._move:ImmuneMaxAreaLimit(var_9_0 > 0)
end

function var_0_0.IsImmuneAreaLimit(arg_10_0)
	local var_10_0 = arg_10_0._attr.immuneAreaLimit

	return var_10_0 and var_10_0 > 0
end

function var_0_0.IsImmuneMaxAreaLimit(arg_11_0)
	local var_11_0 = arg_11_0._attr.immuneMaxAreaLimit

	return var_11_0 and var_11_0 > 0
end

function var_0_0.IsVisitable(arg_12_0)
	local var_12_0 = arg_12_0._attr.isUnVisitable

	return not var_12_0 or var_12_0 <= 0
end

function var_0_0.UnVisitable(arg_13_0)
	local var_13_0 = arg_13_0._attr.isUnVisitable or 0

	arg_13_0._attr.isUnVisitable = var_13_0 + 1
end

function var_0_0.Visitable(arg_14_0)
	local var_14_0 = arg_14_0._attr.isUnVisitable or 0

	arg_14_0._attr.isUnVisitable = var_14_0 - 1
end

function var_0_0.IsSpirit(arg_15_0)
	local var_15_0 = arg_15_0._attr.isSpirit

	return var_15_0 and var_15_0 > 0
end

function var_0_0.Spirit(arg_16_0)
	local var_16_0 = arg_16_0._attr.isSpirit or 0

	arg_16_0._attr.isSpirit = var_16_0 + 1
end

function var_0_0.Entity(arg_17_0)
	local var_17_0 = arg_17_0._attr.isSpirit or 0

	arg_17_0._attr.isSpirit = var_17_0 - 1
end

function var_0_0.IsStun(arg_18_0)
	local var_18_0 = arg_18_0._attr.isStun

	return var_18_0 and var_18_0 > 0
end

function var_0_0.Stun(arg_19_0)
	local var_19_0 = arg_19_0._attr.isStun or 0

	arg_19_0._attr.isStun = var_19_0 + 1
end

function var_0_0.CancelStun(arg_20_0)
	local var_20_0 = arg_20_0._attr.isStun or 0

	arg_20_0._attr.isStun = var_20_0 - 1
end

function var_0_0.IsCloak(arg_21_0)
	return (arg_21_0._attr.isCloak or 0) == 1
end

function var_0_0.Cloak(arg_22_0)
	arg_22_0._attr.isCloak = 1
	arg_22_0._attr.airResistPierceActive = 1
end

function var_0_0.Uncloak(arg_23_0)
	arg_23_0._attr.isCloak = 0
	arg_23_0._attr.airResistPierceActive = 0
end

function var_0_0.IsLockAimBias(arg_24_0)
	return (arg_24_0._attr.lockAimBias or 0) >= 1
end

function var_0_0.IsUnitCldImmune(arg_25_0)
	return (arg_25_0._attr.unitCldImmune or 0) >= 1
end

function var_0_0.UnitCldImmune(arg_26_0)
	local var_26_0 = arg_26_0._attr.unitCldImmune or 0

	arg_26_0._attr.unitCldImmune = var_26_0 + 1
end

function var_0_0.UnitCldEnable(arg_27_0)
	local var_27_0 = arg_27_0._attr.unitCldImmune or 0

	arg_27_0._attr.unitCldImmune = var_27_0 - 1
end

function var_0_0.GetCurrentTargetSelect(arg_28_0)
	local var_28_0
	local var_28_1 = var_0_0.GetCurrent(arg_28_0, "TargetChoise")
	local var_28_2 = ys.Battle.BattleConfig.TARGET_SELECT_PRIORITY

	for iter_28_0, iter_28_1 in ipairs(var_28_1) do
		if not var_28_0 or var_28_2[iter_28_1] > var_28_2[var_28_0] then
			var_28_0 = iter_28_1
		end
	end

	return var_28_0
end

function var_0_0.AddTargetSelect(arg_29_0, arg_29_1)
	table.insert(var_0_0.GetCurrent(arg_29_0, "TargetChoise"), arg_29_1)
end

function var_0_0.RemoveTargetSelect(arg_30_0, arg_30_1)
	local var_30_0 = var_0_0.GetCurrent(arg_30_0, "TargetChoise")

	for iter_30_0, iter_30_1 in ipairs(var_30_0) do
		if iter_30_1 == arg_30_1 then
			table.remove(var_30_0, iter_30_0)

			break
		end
	end
end

function var_0_0.GetCurrentGuardianID(arg_31_0)
	local var_31_0 = var_0_0.GetCurrent(arg_31_0, "guardian")
	local var_31_1 = #var_31_0

	if var_31_1 == 0 then
		return nil
	else
		return var_31_0[var_31_1]
	end
end

function var_0_0.AddGuardianID(arg_32_0, arg_32_1)
	local var_32_0 = var_0_0.GetCurrent(arg_32_0, "guardian")

	if not table.contains(var_32_0, arg_32_1) then
		table.insert(var_32_0, arg_32_1)
	end
end

function var_0_0.RemoveGuardianID(arg_33_0, arg_33_1)
	local var_33_0 = var_0_0.GetCurrent(arg_33_0, "guardian")

	for iter_33_0, iter_33_1 in ipairs(var_33_0) do
		if iter_33_1 == arg_33_1 then
			table.remove(var_33_0, iter_33_0)

			return
		end
	end
end

function var_0_0.SetPlayerAttrFromOutBattle(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_0._attr or {}

	arg_34_0._attr = var_34_0
	var_34_0.id = arg_34_1.id
	var_34_0.battleUID = arg_34_0:GetUniqueID()
	var_34_0.level = arg_34_1.level
	var_34_0.formulaLevel = arg_34_1.level
	var_34_0.maxHP = arg_34_1.durability
	var_34_0.HPRate = 1
	var_34_0.DMGRate = 0
	var_34_0.cannonPower = arg_34_1.cannon
	var_34_0.torpedoPower = arg_34_1.torpedo
	var_34_0.antiAirPower = arg_34_1.antiaircraft
	var_34_0.antiSubPower = arg_34_1.antisub or 0
	var_34_0.baseAntiSubPower = arg_34_2 and arg_34_2.antisub or arg_34_1.antisub
	var_34_0.airPower = arg_34_1.air
	var_34_0.loadSpeed = arg_34_1.reload
	var_34_0.armorType = arg_34_1.armorType
	var_34_0.attackRating = arg_34_1.hit
	var_34_0.dodgeRate = arg_34_1.dodge
	var_34_0.velocity = ys.Battle.BattleFormulas.ConvertShipSpeed(arg_34_1.speed)
	var_34_0.baseVelocity = var_34_0.velocity
	var_34_0.luck = arg_34_1.luck
	var_34_0.repressReduce = arg_34_1.repressReduce or 1
	var_34_0.oxyMax = arg_34_1.oxy_max
	var_34_0.oxyCost = arg_34_1.oxy_cost
	var_34_0.oxyRecovery = arg_34_1.oxy_recovery
	var_34_0.oxyRecoverySurface = arg_34_1.oxy_recovery_surface
	var_34_0.oxyRecoveryBench = arg_34_1.oxy_recovery_bench
	var_34_0.oxyAtkDuration = arg_34_1.attack_duration
	var_34_0.raidDist = arg_34_1.raid_distance
	var_34_0.sonarRange = arg_34_1.sonarRange or 0
	var_34_0.cloakExposeBase = arg_34_2 and arg_34_2.dodge + ys.Battle.BattleConfig.CLOAK_EXPOSE_CONST or 0
	var_34_0.cloakExposeExtra = 0
	var_34_0.cloakRestore = var_34_0.cloakExposeBase + var_34_0.cloakExposeExtra + ys.Battle.BattleConfig.CLOAK_BASE_RESTORE_DELTA
	var_34_0.cloakRecovery = ys.Battle.BattleConfig.CLOAK_RECOVERY
	var_34_0.cloakStrikeAdditive = ys.Battle.BattleConfig.CLOAK_STRIKE_ADDITIVE
	var_34_0.cloakBombardAdditive = ys.Battle.BattleConfig.CLOAK_STRIKE_ADDITIVE
	var_34_0.airResistPierce = ys.Battle.BattleConfig.BASE_ARP
	var_34_0.aimBias = 0
	var_34_0.aimBiasDecaySpeed = 0
	var_34_0.aimBiasDecaySpeedRatio = 0
	var_34_0.aimBiasExtraACC = 0
	var_34_0.healingRate = 1
	var_34_0.DMG_TAG_EHC_N_99 = arg_34_1[AttributeType.AntiSiren] or 0
	var_34_0.comboTag = "combo_" .. var_34_0.battleUID
	var_34_0.labelTag = {}
	var_34_0.barrageCounterMod = 1
	var_34_0.TargetChoise = {}
	var_34_0.guardian = {}

	var_0_0.SetBaseAttr(arg_34_0)
end

function var_0_0.AttrFixer(arg_35_0, arg_35_1)
	if arg_35_0 == SYSTEM_SCENARIO then
		arg_35_1.repressReduce = ys.Battle.BattleDataProxy.GetInstance():GetRepressReduce()
	elseif arg_35_0 == SYSTEM_DUEL or arg_35_0 == SYSTEM_SHAM then
		local var_35_0 = arg_35_1.level
		local var_35_1 = arg_35_1.durability
		local var_35_2, var_35_3 = ys.Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition(arg_35_0, var_35_0)

		arg_35_1.durability = var_35_1 * var_35_2 + var_35_3
	end
end

function var_0_0.InitDOTAttr(arg_36_0, arg_36_1)
	local var_36_0 = ys.Battle.BattleConfig.DOT_CONFIG_DEFAULT
	local var_36_1 = ys.Battle.BattleConfig.DOT_CONFIG

	for iter_36_0, iter_36_1 in ipairs(var_36_1) do
		for iter_36_2, iter_36_3 in pairs(iter_36_1) do
			if iter_36_2 == "hit" then
				arg_36_0[iter_36_3] = arg_36_1[iter_36_3] or var_36_0[iter_36_2]
			else
				arg_36_0[iter_36_3] = var_36_0[iter_36_2]
			end
		end
	end
end

function var_0_0.SetEnemyAttr(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0._tmpData
	local var_37_1 = arg_37_0:GetLevel()
	local var_37_2 = arg_37_0._attr or {}

	arg_37_0._attr = var_37_2
	var_37_2.battleUID = arg_37_0:GetUniqueID()
	var_37_2.level = var_37_1
	var_37_2.formulaLevel = var_37_1

	local var_37_3 = (var_37_1 - 1) / 1000

	var_37_2.maxHP = math.ceil(var_37_0.durability + var_37_0.durability_growth * var_37_3)
	var_37_2.HPRate = 1
	var_37_2.DMGRate = 0
	var_37_2.cannonPower = var_37_0.cannon + var_37_0.cannon_growth * var_37_3
	var_37_2.torpedoPower = var_37_0.torpedo + var_37_0.torpedo_growth * var_37_3
	var_37_2.antiAirPower = var_37_0.antiaircraft + var_37_0.antiaircraft_growth * var_37_3
	var_37_2.airPower = var_37_0.air + var_37_0.air_growth * var_37_3
	var_37_2.antiSubPower = var_37_0.antisub + var_37_0.antisub_growth * var_37_3
	var_37_2.loadSpeed = var_37_0.reload + var_37_0.reload_growth * var_37_3
	var_37_2.armorType = var_37_0.armor_type
	var_37_2.attackRating = var_37_0.hit + var_37_0.hit_growth * var_37_3
	var_37_2.dodgeRate = var_37_0.dodge + var_37_0.dodge_growth * var_37_3
	var_37_2.velocity = ys.Battle.BattleFormulas.ConvertShipSpeed(var_37_0.speed + var_37_0.speed_growth * var_37_3)
	var_37_2.baseVelocity = var_37_2.velocity
	var_37_2.luck = var_37_0.luck + var_37_0.luck_growth * var_37_3
	var_37_2.bulletSpeedRatio = 0
	var_37_2.id = "enemy_" .. tostring(var_37_0.id)
	var_37_2.repressReduce = 1
	var_37_2.healingRate = 1
	var_37_2.comboTag = "combo_" .. var_37_2.battleUID
	var_37_2.labelTag = {}
	var_37_2.TargetChoise = {}
	var_37_2.guardian = {}

	var_0_0.SetBaseAttr(arg_37_0)
end

function var_0_0.SetEnemyWorldEnhance(arg_38_0)
	local var_38_0 = arg_38_0._tmpData
	local var_38_1 = arg_38_0._attr
	local var_38_2 = var_38_1.level
	local var_38_3 = ys.Battle.BattleDataProxy.GetInstance()
	local var_38_4 = var_38_0.world_enhancement
	local var_38_5 = ys.Battle.BattleFormulas

	var_38_1.maxHP = var_38_1.maxHP * var_38_5.WorldEnemyAttrEnhance(var_38_4[1], var_38_2)
	var_38_1.cannonPower = var_38_1.cannonPower * var_38_5.WorldEnemyAttrEnhance(var_38_4[2], var_38_2)
	var_38_1.torpedoPower = var_38_1.torpedoPower * var_38_5.WorldEnemyAttrEnhance(var_38_4[3], var_38_2)
	var_38_1.antiAirPower = var_38_1.antiAirPower * var_38_5.WorldEnemyAttrEnhance(var_38_4[4], var_38_2)
	var_38_1.airPower = var_38_1.airPower * var_38_5.WorldEnemyAttrEnhance(var_38_4[5], var_38_2)
	var_38_1.attackRating = var_38_1.attackRating * var_38_5.WorldEnemyAttrEnhance(var_38_4[6], var_38_2)
	var_38_1.dodgeRate = var_38_1.dodgeRate * var_38_5.WorldEnemyAttrEnhance(var_38_4[7], var_38_2)

	local var_38_6 = var_38_3:GetInitData()
	local var_38_7, var_38_8, var_38_9 = var_38_5.WorldMapRewardAttrEnhance(var_38_6.EnemyMapRewards, var_38_6.FleetMapRewards)

	var_38_1.cannonPower = var_38_1.cannonPower * (1 + var_38_7)
	var_38_1.torpedoPower = var_38_1.torpedoPower * (1 + var_38_7)
	var_38_1.airPower = var_38_1.airPower * (1 + var_38_7)
	var_38_1.antiAirPower = var_38_1.antiAirPower * (1 + var_38_7)
	var_38_1.antiSubPower = var_38_1.antiSubPower * (1 + var_38_7)
	var_38_1.maxHP = math.ceil(var_38_1.maxHP * (1 + var_38_8))
	var_38_1.worldBuffResistance = var_38_9

	var_0_0.SetBaseAttr(arg_38_0)
end

function var_0_0.SetMinionAttr(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:GetMaster()
	local var_39_1 = var_0_0.GetAttr(var_39_0)
	local var_39_2 = arg_39_0._tmpData
	local var_39_3 = var_39_1.level
	local var_39_4 = arg_39_0._attr or {}

	arg_39_0._attr = var_39_4
	var_39_4.battleUID = arg_39_0:GetUniqueID()

	for iter_39_0, iter_39_1 in ipairs(var_0_0.AttrListInheritance) do
		var_39_4[iter_39_1] = var_39_1[iter_39_1]
	end

	for iter_39_2, iter_39_3 in pairs(var_39_1) do
		if string.find(iter_39_2, var_0_0.TAG_EHC_KEY) then
			var_39_4[iter_39_2] = iter_39_3
		end
	end

	for iter_39_4, iter_39_5 in pairs(var_39_1) do
		if string.find(iter_39_4, var_0_0.TAG_CRI_EHC_KEY) then
			var_39_4[iter_39_4] = iter_39_5
		end
	end

	var_39_4.id = var_39_1.id
	var_39_4.level = var_39_3
	var_39_4.formulaLevel = var_39_3

	local function var_39_5(arg_40_0, arg_40_1)
		local var_40_0 = var_39_2[arg_40_0 .. "_growth"]

		if var_40_0 == 0 then
			var_39_4[arg_40_1] = var_39_2[arg_40_0]
		elseif var_40_0 == -1 then
			if arg_40_0 == "durability" then
				var_39_4[arg_40_1] = var_39_0:GetCurrentHP()
			else
				var_39_4[arg_40_1] = var_39_1[arg_40_1]
			end
		else
			var_39_4[arg_40_1] = var_39_1[arg_40_1] * var_40_0 * 0.0001
		end
	end

	var_39_4.HPRate = 1
	var_39_4.DMGRate = 0

	var_39_5("durability", "maxHP")
	var_39_5("cannon", "cannonPower")
	var_39_5("torpedo", "torpedoPower")
	var_39_5("antiaircraft", "antiAirPower")
	var_39_5("air", "airPower")
	var_39_5("antisub", "antiSubPower")
	var_39_5("reload", "loadSpeed")
	var_39_5("hit", "attackRating")
	var_39_5("dodge", "dodgeRate")
	var_39_5("luck", "luck")

	var_39_4.armorType = var_39_2.armor_type

	var_39_5("speed", "velocity")

	var_39_4.velocity = ys.Battle.BattleFormulas.ConvertShipSpeed(var_39_4.velocity)
	var_39_4.baseVelocity = var_39_4.velocity
	var_39_4.bulletSpeedRatio = 0
	var_39_4.repressReduce = 1
	var_39_4.healingRate = 1
	var_39_4.comboTag = "combo_" .. var_39_4.battleUID
	var_39_4.labelTag = {}
	var_39_4.TargetChoise = {}
	var_39_4.guardian = {}

	var_0_0.SetBaseAttr(arg_39_0)
end

function var_0_0.IsWorldMapRewardAttrWarning(arg_41_0, arg_41_1)
	for iter_41_0 = 1, 3 do
		if arg_41_1[iter_41_0] / (arg_41_0[iter_41_0] ~= 0 and arg_41_0[iter_41_0] or 1) < pg.gameset.world_mapbuff_tips.key_value / 10000 then
			return true
		end
	end

	return false
end

function var_0_0.MonsterAttrFixer(arg_42_0, arg_42_1)
	if arg_42_0 == SYSTEM_SCENARIO then
		local var_42_0 = ys.Battle.BattleDataProxy.GetInstance()
		local var_42_1 = var_42_0:IsCompletelyRepress() and var_42_0:GetRepressLevel() or 0
		local var_42_2 = var_0_0.GetCurrent(arg_42_1, "level")

		var_0_0.SetCurrent(arg_42_1, "formulaLevel", math.max(1, var_42_2 - var_42_1))
	elseif arg_42_0 == SYSTEM_WORLD then
		var_0_0.SetEnemyWorldEnhance(arg_42_1)
	end
end

function var_0_0.SetAircraftAttFromMother(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0._attr or {}

	arg_43_0._attr = var_43_0
	var_43_0.battleUID = arg_43_0:GetUniqueID()
	var_43_0.hostUID = arg_43_1:GetUniqueID()

	if not type(arg_43_1._attr.id) == "string" or string.find(arg_43_1._attr.id, "enemy_") == nil then
		var_43_0.id = arg_43_1._attr.id
	end

	local var_43_1 = var_0_0.GetAttr(arg_43_1)

	for iter_43_0, iter_43_1 in ipairs(var_0_0.AttrListInheritance) do
		var_43_0[iter_43_1] = var_43_1[iter_43_1]
	end

	for iter_43_2, iter_43_3 in pairs(var_43_1) do
		if string.find(iter_43_2, var_0_0.TAG_EHC_KEY) then
			var_43_0[iter_43_2] = iter_43_3
		end
	end

	for iter_43_4, iter_43_5 in pairs(var_43_1) do
		if string.find(iter_43_4, var_0_0.TAG_CRI_EHC_KEY) then
			var_43_0[iter_43_4] = iter_43_5
		end
	end

	var_43_0.armorType = 0
	var_43_0.velocity = var_0_0.GetCurrent(arg_43_1, "baseVelocity")
	var_43_0.labelTag = {}
	var_43_0.TargetChoise = {}
	var_43_0.guardian = {}
	var_43_0.comboTag = "combo_" .. var_43_0.hostUID
end

function var_0_0.SetAircraftAttFromTemp(arg_44_0)
	arg_44_0._attr = arg_44_0._attr or {}

	local var_44_0 = var_0_0.GetCurrent(arg_44_0, "hiveExtraHP")

	arg_44_0._attr.velocity = arg_44_0._attr.velocity or ys.Battle.BattleFormulas.ConvertAircraftSpeed(arg_44_0._tmpData.speed)

	local var_44_1 = arg_44_0._attr.level or 1

	arg_44_0._attr.maxHP = arg_44_0._attr.maxHP or arg_44_0._tmpData.max_hp + arg_44_0._tmpData.hp_growth / 1000 * (var_44_1 - 1) + var_44_0
	arg_44_0._attr.crashDMG = arg_44_0._tmpData.crash_DMG
	arg_44_0._attr.dodge = arg_44_0._tmpData.dodge
	arg_44_0._attr.dodgeLimit = arg_44_0._tmpData.dodge_limit
end

function var_0_0.SetAirFighterAttr(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0._attr or {}

	arg_45_0._attr = var_45_0

	local var_45_1 = ys.Battle.BattleDataProxy.GetInstance()
	local var_45_2 = var_45_1:GetDungeonLevel()

	var_45_0.battleUID = arg_45_0:GetUniqueID()
	var_45_0.hostUID = 0
	var_45_0.id = 0
	var_45_0.level = var_45_2
	var_45_0.formulaLevel = var_45_2

	if var_45_1:IsCompletelyRepress() then
		var_45_0.formulaLevel = math.max(var_45_0.formulaLevel - 10, 1)
	end

	local var_45_3 = (var_45_2 - 1) / 1000

	var_45_0.maxHP = math.floor(arg_45_1.max_hp + arg_45_1.hp_growth * var_45_3)
	var_45_0.attackRating = arg_45_1.accuracy + arg_45_1.ACC_growth * var_45_3

	local var_45_4 = arg_45_1.attack_power + arg_45_1.AP_growth * var_45_3

	var_45_0.dodge = arg_45_1.dodge
	var_45_0.dodgeLimit = arg_45_1.dodge_limit
	var_45_0.cannonPower = var_45_4
	var_45_0.torpedoPower = var_45_4
	var_45_0.antiAirPower = var_45_4
	var_45_0.antiSubPower = var_45_4
	var_45_0.airPower = var_45_4
	var_45_0.loadSpeed = 0
	var_45_0.armorType = 1
	var_45_0.dodgeRate = 0
	var_45_0.luck = 50
	var_45_0.velocity = ys.Battle.BattleFormulas.ConvertAircraftSpeed(arg_45_1.speed)
	var_45_0.repressReduce = 1
	var_45_0.TargetChoise = {}
	var_45_0.guardian = {}
	var_45_0.crashDMG = arg_45_1.crash_DMG
end

function var_0_0.SetFusionAttrFromElement(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = var_0_0.GetAttr(arg_46_1)
	local var_46_1 = var_46_0.level
	local var_46_2 = arg_46_0._attr or {}

	arg_46_0._attr = var_46_2
	var_46_2.id = var_46_0.id
	var_46_2.level = var_46_1
	var_46_2.formulaLevel = var_46_1
	var_46_2.battleUID = arg_46_0:GetUniqueID()

	for iter_46_0, iter_46_1 in ipairs(var_0_0.AttrListInheritance) do
		var_46_2[iter_46_1] = var_46_0[iter_46_1]
	end

	for iter_46_2, iter_46_3 in pairs(var_46_0) do
		if string.find(iter_46_2, var_0_0.TAG_EHC_KEY) then
			var_46_2[iter_46_2] = iter_46_3
		end
	end

	for iter_46_4, iter_46_5 in pairs(var_46_0) do
		if string.find(iter_46_4, var_0_0.TAG_CRI_EHC_KEY) then
			var_46_2[iter_46_4] = iter_46_5
		end
	end

	local var_46_3 = arg_46_1:GetHP()

	for iter_46_6, iter_46_7 in ipairs(arg_46_2) do
		var_46_3 = var_46_3 + iter_46_7:GetHP()
	end

	var_46_2.maxHP = var_46_3
	var_46_2.hpProvideRate = {}
	var_46_2.hpProvideRate[var_0_0.GetCurrent(arg_46_1, "id")] = arg_46_1:GetHP() / var_46_3

	for iter_46_8, iter_46_9 in ipairs(arg_46_2) do
		var_46_2.hpProvideRate[var_0_0.GetCurrent(iter_46_9, "id")] = iter_46_9:GetHP() / var_46_3
	end

	local function var_46_4(arg_47_0)
		local var_47_0 = arg_46_3[arg_47_0] or 1

		var_46_2[arg_47_0] = var_0_0.GetCurrent(arg_46_1, arg_47_0) * var_47_0
	end

	var_46_4("cannonPower")
	var_46_4("torpedoPower")
	var_46_4("antiAirPower")
	var_46_4("antiSubPower")
	var_46_4("baseAntiSubPower")
	var_46_4("airPower")
	var_46_4("loadSpeed")
	var_46_4("attackRating")
	var_46_4("dodgeRate")
	var_46_4("luck")
	var_46_4("velocity")
	var_46_4("baseVelocity")

	var_46_2.armorType = var_0_0.GetCurrent(arg_46_1, "armorType")
	var_46_2.aimBias = 0
	var_46_2.aimBiasDecaySpeed = 0
	var_46_2.aimBiasDecaySpeedRatio = 0
	var_46_2.aimBiasExtraACC = 0
	var_46_2.healingRate = 1
	var_46_2.comboTag = "combo_" .. var_46_2.battleUID
	var_46_2.labelTag = {}
	var_46_2.barrageCounterMod = 1
	var_46_2.TargetChoise = {}
	var_46_2.guardian = {}

	var_0_0.SetBaseAttr(arg_46_0)
end

function var_0_0.FlashByBuff(arg_48_0, arg_48_1, arg_48_2)
	arg_48_0._attr[arg_48_1] = arg_48_2 + (arg_48_0._baseAttr[arg_48_1] or 0)

	if string.find(arg_48_1, var_0_0.FROM_TAG_EHC_KEY) then
		local var_48_0 = 0

		for iter_48_0, iter_48_1 in pairs(arg_48_0._attr) do
			if string.find(iter_48_0, var_0_0.FROM_TAG_EHC_KEY) and iter_48_1 ~= 0 then
				var_48_0 = 1

				break
			end
		end

		var_0_0.SetCurrent(arg_48_0, var_0_0.FROM_TAG_EHC_KEY, var_48_0)
	end
end

function var_0_0.FlashVelocity(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = var_0_0.GetBase(arg_49_0, "velocity") * 1.8
	local var_49_1 = var_0_0.GetBase(arg_49_0, "velocity") * 0.2
	local var_49_2 = arg_49_0._baseAttr.velocity * arg_49_1 + arg_49_2
	local var_49_3 = Mathf.Clamp(var_49_2, var_49_1, var_49_0)

	var_0_0.SetCurrent(arg_49_0, "velocity", var_49_3)
end

function var_0_0.HasSonar(arg_50_0)
	local var_50_0 = arg_50_0:GetTemplate().type

	return ys.Battle.BattleConfig.VAN_SONAR_PROPERTY[var_50_0] ~= nil
end

function var_0_0.SetCurrent(arg_51_0, arg_51_1, arg_51_2)
	arg_51_0._attr[arg_51_1] = arg_51_2
end

function var_0_0.GetCurrent(arg_52_0, arg_52_1)
	local var_52_0 = AttributeType.IsPrimalBattleAttr(arg_52_1) or false

	return var_0_0._attrFunc[var_52_0](arg_52_0, arg_52_1)
end

function var_0_0._getPrimalAttr(arg_53_0, arg_53_1)
	return math.max(arg_53_0._attr[arg_53_1], 0)
end

function var_0_0._getSecondaryAttr(arg_54_0, arg_54_1)
	return arg_54_0._attr[arg_54_1] or 0
end

var_0_0._attrFunc = {
	[true] = var_0_0._getPrimalAttr,
	[false] = var_0_0._getSecondaryAttr
}

function var_0_0.GetBase(arg_55_0, arg_55_1)
	return arg_55_0._baseAttr[arg_55_1] or 0
end

function var_0_0.GetCurrentTags(arg_56_0)
	return arg_56_0._attr.labelTag or {}
end

function var_0_0.Increase(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_2 then
		arg_57_0._attr[arg_57_1] = (arg_57_0._attr[arg_57_1] or 0) + arg_57_2
	end
end

function var_0_0.RatioIncrease(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_2 then
		arg_58_0._attr[arg_58_1] = arg_58_0._attr[arg_58_1] + arg_58_0._baseAttr[arg_58_1] * arg_58_2 / 10000
	end
end

function var_0_0.GetTagAttr(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = arg_59_1:GetLabelTag()
	local var_59_1 = {}

	for iter_59_0, iter_59_1 in ipairs(var_59_0) do
		var_59_1[var_0_0.TAG_EHC_KEY .. iter_59_1] = true
	end

	local var_59_2 = 1

	for iter_59_2, iter_59_3 in pairs(var_59_1) do
		local var_59_3 = var_0_0.GetCurrent(arg_59_0, iter_59_2)

		if var_59_3 ~= 0 then
			if arg_59_2 then
				var_59_3 = ys.Battle.BattleDataFunction.GetLimitAttributeRange(iter_59_2, var_59_3)
			end

			var_59_2 = var_59_2 * (1 + var_59_3)
		end
	end

	if var_0_0.GetCurrent(arg_59_1, var_0_0.FROM_TAG_EHC_KEY) > 0 then
		local var_59_4 = arg_59_0:GetWeaponTempData().attack_attribute
		local var_59_5 = var_0_0.FROM_TAG_EHC_KEY .. var_59_4 .. "_"
		local var_59_6 = var_0_0.GetCurrentTags(arg_59_0)

		for iter_59_4, iter_59_5 in pairs(var_59_6) do
			if iter_59_5 > 0 then
				local var_59_7 = var_59_5 .. iter_59_4
				local var_59_8 = var_0_0.GetCurrent(arg_59_1, var_59_7)

				if var_59_8 ~= 0 then
					var_59_2 = var_59_2 * (1 + var_59_8)
				end
			end
		end
	end

	return var_59_2
end

function var_0_0.GetTagAttrCri(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1:GetLabelTag()
	local var_60_1 = {}

	for iter_60_0, iter_60_1 in ipairs(var_60_0) do
		var_60_1[var_0_0.TAG_CRI_EHC_KEY .. iter_60_1] = true
	end

	local var_60_2 = 0

	for iter_60_2, iter_60_3 in pairs(var_60_1) do
		local var_60_3 = var_0_0.GetCurrent(arg_60_0, iter_60_2)

		if var_60_3 ~= 0 then
			var_60_2 = var_60_2 + var_60_3
		end
	end

	return var_60_2
end

function var_0_0.GetTagAttrCriDmg(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1:GetLabelTag()
	local var_61_1 = {}

	for iter_61_0, iter_61_1 in ipairs(var_61_0) do
		var_61_1[var_0_0.TAG_CRIDMG_EHC_KEY .. iter_61_1] = true
	end

	local var_61_2 = 0

	for iter_61_2, iter_61_3 in pairs(var_61_1) do
		local var_61_3 = var_0_0.GetCurrent(arg_61_0, iter_61_2)

		if var_61_3 ~= 0 then
			var_61_2 = var_61_2 + var_61_3
		end
	end

	return var_61_2
end
