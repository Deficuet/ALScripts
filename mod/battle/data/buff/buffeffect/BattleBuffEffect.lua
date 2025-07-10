ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleFormulas

var_0_0.Battle.BattleBuffEffect = class("BattleBuffEffect")
var_0_0.Battle.BattleBuffEffect.__name = "BattleBuffEffect"

local var_0_2 = var_0_0.Battle.BattleUnitEvent
local var_0_3 = var_0_0.Battle.BattleBuffEffect

var_0_3.FX_TYPE_NOR = 0
var_0_3.FX_TYPE_MOD_ATTR = 1
var_0_3.FX_TYPE_CASTER = 2
var_0_3.FX_TYPE_LINK = 3
var_0_3.FX_TYPE_MOD_VELOCTIY = 4
var_0_3.FX_TYPE_DOT = 5
var_0_3.FX_TTPE_MOD_BATTLE_UNIT_TYPE = 6
var_0_3.FX_TYPE_COUNTER = 7

function var_0_3.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tempData = Clone(arg_1_1)
	arg_1_0._type = arg_1_0._tempData.type

	local var_1_0 = arg_1_0._tempData.arg_list

	arg_1_0._quota = var_1_0.quota or -1
	arg_1_0._indexRequire = var_1_0.index
	arg_1_0._damageAttrRequire = var_1_0.damageAttr
	arg_1_0._damageReasonRequire = var_1_0.damageReason
	arg_1_0._damageSrcTagRequire = var_1_0.srcTag
	arg_1_0._deathCauseRequire = var_1_0.deathCause
	arg_1_0._countType = var_1_0.countType
	arg_1_0._behit = var_1_0.be_hit_condition
	arg_1_0._ammoTypeRequire = var_1_0.ammoType
	arg_1_0._ammoIndexRequire = var_1_0.ammoIndex
	arg_1_0._bulletTagRequire = var_1_0.bulletTag
	arg_1_0._victimTagRequire = var_1_0.victimTag
	arg_1_0._buffStateIDRequire = var_1_0.buff_state_id
	arg_1_0._cloakRequire = var_1_0.cloak_state
	arg_1_0._fleetAttrRequire = var_1_0.fleetAttr
	arg_1_0._fleetAttrDeltaRequire = var_1_0.fleetAttrDelta
	arg_1_0._stackRequire = var_1_0.stack_require

	arg_1_0:ConfigHPTrigger()
	arg_1_0:ConfigAttrTrigger()
	arg_1_0:SetActive()
end

function var_0_3.GetEffectType(arg_2_0)
	return var_0_3.FX_TYPE_NOR
end

function var_0_3.GetPopConfig(arg_3_0)
	return arg_3_0._tempData.pop
end

function var_0_3.HaveQuota(arg_4_0)
	if arg_4_0._quota == 0 then
		return false
	else
		return true
	end
end

function var_0_3.GetEffectAttachData(arg_5_0)
	return nil
end

function var_0_3.ConfigHPTrigger(arg_6_0)
	local var_6_0 = arg_6_0._tempData.arg_list

	arg_6_0._hpUpperBound = var_6_0.hpUpperBound
	arg_6_0._hpLowerBound = var_6_0.hpLowerBound

	if arg_6_0._hpUpperBound and arg_6_0._hpLowerBound == nil then
		arg_6_0._hpLowerBound = 0
	end

	if arg_6_0._hpLowerBound and arg_6_0._hpUpperBound == nil then
		arg_6_0._hpUpperBound = 1
	end

	arg_6_0._hpSigned = var_6_0.hpSigned or -1
	arg_6_0._hpOutInterval = var_6_0.hpOutInterval
	arg_6_0._dHPGreater = var_6_0.dhpGreater
	arg_6_0._dhpSmaller = var_6_0.dhpSmaller
	arg_6_0._dHPGreaterMaxHP = var_6_0.dhpGreaterMaxhp
	arg_6_0._dhpSmallerMaxhp = var_6_0.dhpSmallerMaxhp
end

function var_0_3.ConfigAttrTrigger(arg_7_0)
	local var_7_0 = arg_7_0._tempData.arg_list

	arg_7_0._attrLowerBound = var_7_0.attrLowerBound
	arg_7_0._attrUpperBound = var_7_0.attrUpperBound
	arg_7_0._attrInterval = var_7_0.attrInterval
end

function var_0_3.SetCaster(arg_8_0, arg_8_1)
	arg_8_0._caster = arg_8_1
end

function var_0_3.SetCommander(arg_9_0, arg_9_1)
	arg_9_0._commander = arg_9_1
end

function var_0_3.SetBullet(arg_10_0, arg_10_1)
	return
end

function var_0_3.SetArgs(arg_11_0, arg_11_1, arg_11_2)
	return
end

function var_0_3.SetOrb(arg_12_0)
	return
end

function var_0_3.Trigger(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	arg_13_0[arg_13_1](arg_13_0, arg_13_2, arg_13_3, arg_13_4)
end

function var_0_3.onAttach(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:onTrigger(arg_14_1, arg_14_2)
end

function var_0_3.onRemove(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:onTrigger(arg_15_1, arg_15_2)
end

function var_0_3.onBuffAdded(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if not arg_16_0:buffStateRequire(arg_16_3.buffID) then
		return
	end

	arg_16_0:onTrigger(arg_16_1, arg_16_2)
end

function var_0_3.onBuffRemoved(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if not arg_17_0:buffStateRequire(arg_17_3.buffID) then
		return
	end

	arg_17_0:onTrigger(arg_17_1, arg_17_2)
end

function var_0_3.onUpdate(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_0:onTrigger(arg_18_1, arg_18_2, arg_18_3)
end

function var_0_3.onStack(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0:onTrigger(arg_19_1, arg_19_2)
end

function var_0_3.onBulletHit(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	if not arg_20_0:equipIndexRequire(arg_20_3.equipIndex) then
		return
	end

	if not arg_20_0:bulletTagRequire(arg_20_3.bulletTag) then
		return
	end

	if not arg_20_0:victimRequire(arg_20_3.target, arg_20_1) then
		return
	end

	arg_20_0:onTrigger(arg_20_1, arg_20_2, arg_20_3)
end

function var_0_3.onTeammateBulletHit(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	arg_21_0:onBulletHit(arg_21_1, arg_21_2, arg_21_3)
end

function var_0_3.onBeHit(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if arg_22_0._behit then
		if arg_22_0._behit.damage_type == arg_22_3.weaponType and arg_22_0._behit.bullet_type == arg_22_3.bulletType then
			arg_22_0:onTrigger(arg_22_1, arg_22_2)
		end
	else
		arg_22_0:onTrigger(arg_22_1, arg_22_2)
	end
end

function var_0_3.onFire(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	if not arg_23_0:equipIndexRequire(arg_23_3.equipIndex) then
		return
	end

	arg_23_0:onTrigger(arg_23_1, arg_23_2)
end

function var_0_3.onCombo(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if not arg_24_0:equipIndexRequire(arg_24_3.equipIndex) then
		return
	end

	local var_24_0 = arg_24_3.matchUnitCount
	local var_24_1 = arg_24_0._tempData.arg_list.upperBound
	local var_24_2 = arg_24_0._tempData.arg_list.lowerBound

	if var_24_1 and var_24_0 <= var_24_1 then
		arg_24_0:onTrigger(arg_24_1, arg_24_2)
	elseif var_24_2 and var_24_2 <= var_24_0 then
		arg_24_0:onTrigger(arg_24_1, arg_24_2)
	end
end

function var_0_3.stackRequire(arg_25_0, arg_25_1)
	if arg_25_0._stackRequire then
		local var_25_0 = arg_25_1:GetStack()

		return var_0_1.simpleCompare(arg_25_0._stackRequire, var_25_0)
	else
		return true
	end
end

function var_0_3.fleetAttrRequire(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_0._fleetAttrRequire then
		local var_26_0, var_26_1 = string.find(arg_26_0._fleetAttrRequire, "%p+")
		local var_26_2 = string.sub(arg_26_0._fleetAttrRequire, 1, var_26_0 - 1)

		if arg_26_2 ~= nil and var_26_2 ~= arg_26_2 then
			return false
		elseif arg_26_1:GetFleetVO() then
			local var_26_3 = arg_26_1:GetFleetVO():GetFleetAttr()

			return var_0_1.parseCompare(arg_26_0._fleetAttrRequire, var_26_3)
		else
			return false
		end
	end

	return true
end

function var_0_3.fleetAttrDelatRequire(arg_27_0, arg_27_1)
	if arg_27_0._fleetAttrDeltaRequire then
		return arg_27_1 and var_0_1.simpleCompare(arg_27_0._fleetAttrDeltaRequire, arg_27_1)
	end

	return true
end

function var_0_3.equipIndexRequire(arg_28_0, arg_28_1)
	if not arg_28_0._indexRequire then
		return true
	else
		for iter_28_0, iter_28_1 in ipairs(arg_28_0._indexRequire) do
			if iter_28_1 == arg_28_1 then
				return true
			end
		end

		return false
	end
end

function var_0_3.ammoRequire(arg_29_0, arg_29_1)
	if not arg_29_0._ammoTypeRequire then
		return true
	else
		local var_29_0 = arg_29_1:GetWeaponByIndex(arg_29_0._ammoIndexRequire)

		if not var_29_0 or var_29_0:GetPrimalAmmoType() ~= arg_29_0._ammoTypeRequire then
			return false
		else
			return true
		end
	end
end

function var_0_3.bulletTagRequire(arg_30_0, arg_30_1)
	if not arg_30_0._bulletTagRequire then
		return true
	else
		for iter_30_0, iter_30_1 in ipairs(arg_30_0._bulletTagRequire) do
			if table.contains(arg_30_1, iter_30_1) then
				return true
			else
				return false
			end
		end
	end
end

function var_0_3.buffStateRequire(arg_31_0, arg_31_1)
	if not arg_31_0._buffStateIDRequire then
		return true
	else
		return arg_31_1 == arg_31_0._buffStateIDRequire
	end
end

function var_0_3.onWeaponSteday(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	arg_32_0:onFire(arg_32_1, arg_32_2, arg_32_3)
end

function var_0_3.onChargeWeaponFire(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	arg_33_0:onFire(arg_33_1, arg_33_2, arg_33_3)
end

function var_0_3.onTorpedoWeaponFire(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	arg_34_0:onFire(arg_34_1, arg_34_2, arg_34_3)
end

function var_0_3.onAntiAirWeaponFireFar(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	arg_35_0:onFire(arg_35_1, arg_35_2, arg_35_3)
end

function var_0_3.onAntiAirWeaponFireNear(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	arg_36_0:onFire(arg_36_1, arg_36_2, arg_36_3)
end

function var_0_3.onManualMissileFire(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_0:onFire(arg_37_1, arg_37_2, arg_37_3)
end

function var_0_3.onAllInStrike(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	arg_38_0:onFire(arg_38_1, arg_38_2, arg_38_3)
end

function var_0_3.onAllInStrikeSteady(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	arg_39_0:onFire(arg_39_1, arg_39_2, arg_39_3)
end

function var_0_3.onPointStrikeReady(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	arg_40_0:onFire(arg_40_1, arg_40_2, arg_40_3)
end

function var_0_3.onPointStrikeSteady(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	arg_41_0:onFire(arg_41_1, arg_41_2, arg_41_3)
end

function var_0_3.onPointStrike(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	arg_42_0:onFire(arg_42_1, arg_42_2, arg_42_3)
end

function var_0_3.onWeaonInterrupt(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	arg_43_0:onTrigger(arg_43_1, arg_43_2)
end

function var_0_3.onWeaponSuccess(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	arg_44_0:onTrigger(arg_44_1, arg_44_2)
end

function var_0_3.onChargeWeaponReady(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	arg_45_0:onTrigger(arg_45_1, arg_45_2)
end

function var_0_3.onManualTorpedoReady(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	arg_46_0:onTrigger(arg_46_1, arg_46_2)
end

function var_0_3.onAirAssistReady(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	arg_47_0:onTrigger(arg_47_1, arg_47_2)
end

function var_0_3.onManualMissileReady(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	arg_48_0:onTrigger(arg_48_1, arg_48_2)
end

function var_0_3.onTorpedoButtonPush(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	arg_49_0:onTrigger(arg_49_1, arg_49_2)
end

function var_0_3.onBeforeFatalDamage(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0:onTrigger(arg_50_1, arg_50_2)
end

function var_0_3.onAircraftCreate(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
	arg_51_0:onTrigger(arg_51_1, arg_51_2, arg_51_3)
end

function var_0_3.onFriendlyAircraftDying(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	if arg_52_0._tempData.arg_list.templateID then
		if arg_52_3.unit:GetTemplateID() == arg_52_0._tempData.arg_list.templateID then
			arg_52_0:onTrigger(arg_52_1, arg_52_2)
		end
	else
		arg_52_0:onTrigger(arg_52_1, arg_52_2)
	end
end

function var_0_3.onTeammateShipDying(arg_53_0, arg_53_1, arg_53_2)
	arg_53_0:onTrigger(arg_53_1, arg_53_2)
end

function var_0_3.onFoeAircraftDying(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	if arg_54_0._tempData.arg_list.inside then
		local var_54_0 = arg_54_3.unit

		if not arg_54_1:GetFleetVO():GetFleetAntiAirWeapon():IsOutOfRange(var_54_0) then
			arg_54_0:onTrigger(arg_54_1, arg_54_2)
		end
	elseif arg_54_0._tempData.arg_list.killer then
		if arg_54_0:killerRequire(arg_54_0._tempData.arg_list.killer, arg_54_3.killer, arg_54_1) then
			arg_54_0:onTrigger(arg_54_1, arg_54_2)
		end
	else
		arg_54_0:onTrigger(arg_54_1, arg_54_2)
	end
end

function var_0_3.onFoeDying(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	if arg_55_0._tempData.arg_list.killer then
		if arg_55_0:killerRequire(arg_55_0._tempData.arg_list.killer, arg_55_3.killer, arg_55_1) then
			arg_55_0:onTrigger(arg_55_1, arg_55_2)
		end
	elseif arg_55_0:victimRequire(arg_55_3.unit, arg_55_1) then
		arg_55_0:onTrigger(arg_55_1, arg_55_2)
	else
		arg_55_0:onTrigger(arg_55_1, arg_55_2)
	end
end

function var_0_3.onSink(arg_56_0, arg_56_1, arg_56_2)
	if arg_56_0:deathCauseRequire(arg_56_1) then
		arg_56_0:onTrigger(arg_56_1, arg_56_2)
	end
end

function var_0_3.deathCauseRequire(arg_57_0, arg_57_1)
	if not arg_57_0._deathCauseRequire then
		return true
	end

	local var_57_0 = arg_57_1:GetDeathReason()

	return table.contains(arg_57_0._deathCauseRequire, var_57_0)
end

function var_0_3.killerRequire(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
	if not arg_58_2 then
		return false
	end

	local var_58_0
	local var_58_1
	local var_58_2 = arg_58_2.__name

	if var_58_2 == var_0_0.Battle.BattlePlayerUnit.__name or var_58_2 == var_0_0.Battle.BattleNPCUnit.__name or var_58_2 == var_0_0.Battle.BattleMinionUnit.__name or var_58_2 == var_0_0.Battle.BattleEnemyUnit.__name or var_58_2 == var_0_0.Battle.BattleAircraftUnit.__name or var_58_2 == var_0_0.Battle.BattleAirFighterUnit.__name then
		var_58_0 = arg_58_2
	else
		var_58_0 = arg_58_2:GetHost()
	end

	if var_58_0 then
		local var_58_3 = var_58_0.__name

		if var_58_3 == var_0_0.Battle.BattleAircraftUnit.__name then
			var_58_1 = var_58_0:GetMotherUnit()
		elseif var_58_3 == var_0_0.Battle.BattleMinionUnit.__name then
			var_58_1 = var_58_0:GetMaster()
		else
			var_58_1 = var_58_0
			var_58_0 = nil
		end
	else
		return false
	end

	if arg_58_1 == "self" then
		if var_58_1 == arg_58_3 and not var_58_0 then
			return true
		end
	elseif arg_58_1 == "child" and var_58_1 == arg_58_3 and var_58_0 then
		return true
	end

	return false
end

function var_0_3.victimRequire(arg_59_0, arg_59_1, arg_59_2)
	if not arg_59_0._victimTagRequire then
		return true
	elseif arg_59_1:ContainsLabelTag(arg_59_0._victimTagRequire) then
		return true
	else
		return false
	end
end

function var_0_3.killerWeaponRequire(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	if not arg_60_2 then
		return false
	end

	if not arg_60_2.GetWeapon then
		return false
	end

	local var_60_0 = arg_60_2:GetWeapon():GetWeaponId()

	if table.contains(arg_60_1, var_60_0) then
		return true
	end
end

function var_0_3.DamageSourceRequire(arg_61_0, arg_61_1, arg_61_2)
	if not arg_61_0._damageSrcTagRequire then
		return true
	else
		if not arg_61_1 then
			return false
		end

		local var_61_0 = var_0_0.Battle.BattleDataProxy.GetInstance():GetUnitList()[arg_61_1]

		if not var_61_0 then
			return false
		end

		if var_61_0:ContainsLabelTag(arg_61_0._damageSrcTagRequire) then
			return true
		else
			return false
		end
	end
end

function var_0_3.onInitGame(arg_62_0, arg_62_1, arg_62_2)
	arg_62_0:onTrigger(arg_62_1, arg_62_2)
end

function var_0_3.onStartGame(arg_63_0, arg_63_1, arg_63_2)
	arg_63_0:onTrigger(arg_63_1, arg_63_2)
end

function var_0_3.onManual(arg_64_0, arg_64_1, arg_64_2)
	arg_64_0:onTrigger(arg_64_1, arg_64_2)
end

function var_0_3.onAutoBot(arg_65_0, arg_65_1, arg_65_2)
	arg_65_0:onTrigger(arg_65_1, arg_65_2)
end

function var_0_3.onFlagShip(arg_66_0, arg_66_1, arg_66_2)
	arg_66_0:onTrigger(arg_66_1, arg_66_2)
end

function var_0_3.onUpperConsort(arg_67_0, arg_67_1, arg_67_2)
	arg_67_0:onTrigger(arg_67_1, arg_67_2)
end

function var_0_3.onLowerConsort(arg_68_0, arg_68_1, arg_68_2)
	arg_68_0:onTrigger(arg_68_1, arg_68_2)
end

function var_0_3.onLeader(arg_69_0, arg_69_1, arg_69_2)
	arg_69_0:onTrigger(arg_69_1, arg_69_2)
end

function var_0_3.onCenter(arg_70_0, arg_70_1, arg_70_2)
	arg_70_0:onTrigger(arg_70_1, arg_70_2)
end

function var_0_3.onRear(arg_71_0, arg_71_1, arg_71_2)
	arg_71_0:onTrigger(arg_71_1, arg_71_2)
end

function var_0_3.onSubLeader(arg_72_0, arg_72_1, arg_72_2)
	arg_72_0:onTrigger(arg_72_1, arg_72_2)
end

function var_0_3.onUpperSubConsort(arg_73_0, arg_73_1, arg_73_2)
	arg_73_0:onTrigger(arg_73_1, arg_73_2)
end

function var_0_3.onLowerSubConsort(arg_74_0, arg_74_1, arg_74_2)
	arg_74_0:onTrigger(arg_74_1, arg_74_2)
end

function var_0_3.onBulletCollide(arg_75_0, arg_75_1, arg_75_2, arg_75_3)
	if not arg_75_0:equipIndexRequire(arg_75_3.equipIndex) then
		return
	end

	arg_75_0:onTrigger(arg_75_1, arg_75_2)
end

function var_0_3.onBulletCollideBefore(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	if not arg_76_0:equipIndexRequire(arg_76_3.equipIndex) then
		return
	end

	arg_76_0:onTrigger(arg_76_1, arg_76_2)
end

function var_0_3.onBombBulletBang(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
	if not arg_77_0:equipIndexRequire(arg_77_3.equipIndex) then
		return
	end

	arg_77_0:onTrigger(arg_77_1, arg_77_2)
end

function var_0_3.onTorpedoBulletBang(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	if not arg_78_0:equipIndexRequire(arg_78_3.equipIndex) then
		return
	end

	arg_78_0:onTrigger(arg_78_1, arg_78_2)
end

function var_0_3.onBulletHitBefore(arg_79_0, arg_79_1, arg_79_2, arg_79_3)
	if arg_79_0._behit then
		if arg_79_0._behit.damage_type == arg_79_3.weaponType and arg_79_0._behit.bullet_type == arg_79_3.bulletType then
			arg_79_0:onTrigger(arg_79_1, arg_79_2)
		end
	else
		arg_79_0:onTrigger(arg_79_1, arg_79_2)
	end
end

function var_0_3.onBulletCreate(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	if not arg_80_0:equipIndexRequire(arg_80_3.equipIndex) then
		return
	end

	arg_80_0:onTrigger(arg_80_1, arg_80_2, arg_80_3)
end

function var_0_3.onChargeWeaponBulletCreate(arg_81_0, arg_81_1, arg_81_2, arg_81_3)
	arg_81_0:onBulletCreate(arg_81_1, arg_81_2, arg_81_3)
end

function var_0_3.onTorpedoWeaponBulletCreate(arg_82_0, arg_82_1, arg_82_2, arg_82_3)
	arg_82_0:onBulletCreate(arg_82_1, arg_82_2, arg_82_3)
end

function var_0_3.onInternalBulletCreate(arg_83_0, arg_83_1, arg_83_2, arg_83_3)
	if not arg_83_0:equipIndexRequire(arg_83_3.equipIndex) then
		return
	end

	arg_83_0:onTrigger(arg_83_1, arg_83_2, arg_83_3)
end

function var_0_3.onManualBulletCreate(arg_84_0, arg_84_1, arg_84_2, arg_84_3)
	if not arg_84_0:equipIndexRequire(arg_84_3.equipIndex) then
		return
	end

	arg_84_0:onTrigger(arg_84_1, arg_84_2, arg_84_3)
end

function var_0_3.onBeforeTakeDamage(arg_85_0, arg_85_1, arg_85_2, arg_85_3)
	if arg_85_0:damageCheck(arg_85_3) then
		arg_85_0:onTrigger(arg_85_1, arg_85_2, arg_85_3)
	end
end

function var_0_3.onTakeDamage(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	if arg_86_0:damageCheck(arg_86_3) then
		arg_86_0:onTrigger(arg_86_1, arg_86_2, arg_86_3)
	end
end

function var_0_3.onTakeHealing(arg_87_0, arg_87_1, arg_87_2, arg_87_3)
	arg_87_0:onTrigger(arg_87_1, arg_87_2, arg_87_3)
end

function var_0_3.onShieldAbsorb(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
	arg_88_0:onTrigger(arg_88_1, arg_88_2, arg_88_3)
end

function var_0_3.onDamageFix(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	arg_89_0:onTrigger(arg_89_1, arg_89_2, arg_89_3)
end

function var_0_3.onDamageConclude(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
	arg_90_0:onTrigger(arg_90_1, arg_90_2, arg_90_3)
end

function var_0_3.onOverHealing(arg_91_0, arg_91_1, arg_91_2, arg_91_3)
	arg_91_0:onTrigger(arg_91_1, arg_91_2, arg_91_3)
end

function var_0_3.onFleetAttrUpdate(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	arg_92_0:onTrigger(arg_92_1, arg_92_2, arg_92_3)
end

function var_0_3.damageCheck(arg_93_0, arg_93_1)
	return arg_93_0:damageAttrRequire(arg_93_1.damageAttr) and arg_93_0:damageReasonRequire(arg_93_1.damageReason)
end

function var_0_3.damageAttrRequire(arg_94_0, arg_94_1)
	if not arg_94_0._damageAttrRequire or table.contains(arg_94_0._damageAttrRequire, arg_94_1) then
		return true
	else
		return false
	end
end

function var_0_3.damageReasonRequire(arg_95_0, arg_95_1)
	if not arg_95_0._damageReasonRequire or table.contains(arg_95_0._damageReasonRequire, arg_95_1) then
		return true
	else
		return false
	end
end

function var_0_3.hpIntervalRequire(arg_96_0, arg_96_1, arg_96_2)
	if arg_96_0._hpUpperBound == nil and arg_96_0._hpLowerBound == nil then
		return true
	end

	if not arg_96_2 or arg_96_0._hpSigned == 0 then
		-- block empty
	elseif arg_96_2 * arg_96_0._hpSigned < 0 then
		return false
	end

	local var_96_0

	if arg_96_0._hpOutInterval then
		if arg_96_1 >= arg_96_0._hpUpperBound or arg_96_1 <= arg_96_0._hpLowerBound then
			var_96_0 = true
		end
	elseif arg_96_1 <= arg_96_0._hpUpperBound and arg_96_1 >= arg_96_0._hpLowerBound then
		var_96_0 = true
	end

	return var_96_0
end

function var_0_3.dhpRequire(arg_97_0, arg_97_1, arg_97_2)
	if arg_97_0._dHPGreater then
		return arg_97_2 * arg_97_0._dHPGreater > 0 and math.abs(arg_97_2) > math.abs(arg_97_0._dHPGreater)
	elseif arg_97_0._dHPGreaterMaxHP then
		local var_97_0 = arg_97_0._dHPGreaterMaxHP * arg_97_1

		return arg_97_2 * var_97_0 > 0 and math.abs(arg_97_2) > math.abs(var_97_0)
	elseif arg_97_0._dhpSmaller then
		return arg_97_2 * arg_97_0._dhpSmaller > 0 and math.abs(arg_97_2) < math.abs(arg_97_0._dhpSmaller)
	elseif arg_97_0._dhpSmallerMaxhp then
		local var_97_1 = arg_97_0._dhpSmallerMaxhp * arg_97_1

		return arg_97_2 * var_97_1 > 0 and math.abs(arg_97_2) < math.abs(var_97_1)
	else
		return true
	end
end

function var_0_3.attrIntervalRequire(arg_98_0, arg_98_1)
	local var_98_0 = true

	if arg_98_0._attrUpperBound and arg_98_1 >= arg_98_0._attrUpperBound then
		var_98_0 = false
	end

	if arg_98_0._attrLowerBound and arg_98_1 <= arg_98_0._attrLowerBound then
		var_98_0 = false
	end

	return var_98_0
end

function var_0_3.onHPRatioUpdate(arg_99_0, arg_99_1, arg_99_2, arg_99_3)
	local var_99_0 = arg_99_1:GetHPRate()
	local var_99_1 = arg_99_3.dHP

	if arg_99_0:hpIntervalRequire(var_99_0, var_99_1) and arg_99_0:dhpRequire(arg_99_1:GetMaxHP(), var_99_1) then
		arg_99_0:doOnHPRatioUpdate(arg_99_1, arg_99_2, arg_99_3)
	end
end

function var_0_3.onFriendlyHpRatioUpdate(arg_100_0, arg_100_1, arg_100_2, arg_100_3)
	local var_100_0 = arg_100_3.unit
	local var_100_1 = arg_100_3.dHP
	local var_100_2 = var_100_0:GetHPRate()

	if arg_100_0:hpIntervalRequire(var_100_2, var_100_1) and arg_100_0:dhpRequire(var_100_0:GetMaxHP(), var_100_1) then
		arg_100_0:doOnHPRatioUpdate(arg_100_1, arg_100_2, arg_100_3)
	end
end

function var_0_3.onTeammateHpRatioUpdate(arg_101_0, arg_101_1, arg_101_2, arg_101_3)
	arg_101_0:onFriendlyHpRatioUpdate(arg_101_1, arg_101_2, arg_101_3)
end

function var_0_3.onBulletKill(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
	if arg_102_0._tempData.arg_list.killer_weapon_id then
		if arg_102_0:killerWeaponRequire(arg_102_0._tempData.arg_list.killer_weapon_id, arg_102_3.killer, arg_102_1) then
			arg_102_0:onTrigger(arg_102_1, arg_102_2)
		end
	else
		arg_102_0:onTrigger(arg_102_1, arg_102_2)
	end
end

function var_0_3.onBattleBuffCount(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	local var_103_0 = arg_103_3.buffFX

	if var_103_0:GetCountType() == arg_103_0._countType then
		if var_103_0:Repeater() then
			while var_103_0:GetCountProgress() >= 1 do
				arg_103_0:onTrigger(arg_103_1, arg_103_2)
				var_103_0:ConsumeCount()
			end
		elseif arg_103_0:onTrigger(arg_103_1, arg_103_2) ~= "overheat" then
			var_103_0:ResetCount()
		end
	end
end

function var_0_3.onShieldBroken(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	if arg_104_3.shieldBuffID == arg_104_0._tempData.arg_list.shieldBuffID then
		arg_104_0:onTrigger(arg_104_1, arg_104_2)
	end
end

function var_0_3.onTrigger(arg_105_0, arg_105_1, arg_105_2, arg_105_3)
	if arg_105_0._quota > 0 then
		arg_105_0._quota = arg_105_0._quota - 1
	end
end

function var_0_3.doOnHPRatioUpdate(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
	arg_106_0:onTrigger(arg_106_1, arg_106_2, arg_106_3)
end

function var_0_3.doOnFriendlyHPRatioUpdate(arg_107_0, arg_107_1, arg_107_2, arg_107_3)
	arg_107_0:onTrigger(arg_107_1, arg_107_2, arg_107_3)
end

function var_0_3.onSubmarineDive(arg_108_0, arg_108_1, arg_108_2, arg_108_3)
	arg_108_0:onTrigger(arg_108_1, arg_108_2, arg_108_3)
end

function var_0_3.onSubmarineRaid(arg_109_0, arg_109_1, arg_109_2, arg_109_3)
	arg_109_0:onTrigger(arg_109_1, arg_109_2, arg_109_3)
end

function var_0_3.onSubmarineFloat(arg_110_0, arg_110_1, arg_110_2, arg_110_3)
	arg_110_0:onTrigger(arg_110_1, arg_110_2, arg_110_3)
end

function var_0_3.onSubmarineRetreat(arg_111_0, arg_111_1, arg_111_2, arg_111_3)
	arg_111_0:onTrigger(arg_111_1, arg_111_2, arg_111_3)
end

function var_0_3.onSubmarineAid(arg_112_0, arg_112_1, arg_112_2, arg_112_3)
	arg_112_0:onTrigger(arg_112_1, arg_112_2, arg_112_3)
end

function var_0_3.onSubmarinFreeDive(arg_113_0, arg_113_1, arg_113_2, arg_113_3)
	arg_113_0:onTrigger(arg_113_1, arg_113_2, arg_113_3)
end

function var_0_3.onSubmarinFreeFloat(arg_114_0, arg_114_1, arg_114_2, arg_114_3)
	arg_114_0:onTrigger(arg_114_1, arg_114_2, arg_114_3)
end

function var_0_3.onSubmarineFreeSpecial(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	arg_115_0:onTrigger(arg_115_1, arg_115_2, arg_115_3)
end

function var_0_3.onSubDetected(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	arg_116_0:onTrigger(arg_116_1, arg_116_2, arg_116_3)
end

function var_0_3.onSubUnDetected(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	arg_117_0:onTrigger(arg_117_1, arg_117_2, arg_117_3)
end

function var_0_3.onAntiSubHateChain(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	arg_118_0:onTrigger(arg_118_1, arg_118_2, attach)
end

function var_0_3.onRetreat(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	arg_119_0:onTrigger(arg_119_1, arg_119_2, arg_119_3)
end

function var_0_3.onCloakUpdate(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	if arg_120_0:cloakStateRequire(arg_120_3.cloakState) then
		arg_120_0:onTrigger(arg_120_1, arg_120_2, arg_120_3)
	end
end

function var_0_3.onTeammateCloakUpdate(arg_121_0, arg_121_1, arg_121_2, arg_121_3)
	if arg_121_0:cloakStateRequire(arg_121_3.cloakState) then
		arg_121_0:onTrigger(arg_121_1, arg_121_2, arg_121_3)
	end
end

function var_0_3.cloakStateRequire(arg_122_0, arg_122_1)
	if not arg_122_0._cloakRequire then
		return true
	else
		return arg_122_0._cloakRequire == arg_122_1
	end
end

function var_0_3.Interrupt(arg_123_0)
	return
end

function var_0_3.Clear(arg_124_0)
	arg_124_0._commander = nil
end

function var_0_3.getTargetList(arg_125_0, arg_125_1, arg_125_2, arg_125_3, arg_125_4)
	if type(arg_125_2) == "string" then
		arg_125_2 = {
			arg_125_2
		}
	end

	local var_125_0 = arg_125_3

	if table.contains(arg_125_2, "TargetDamageSource") then
		var_125_0 = Clone(arg_125_3)
		var_125_0.damageSourceID = arg_125_4.damageSrc
	end

	local var_125_1

	for iter_125_0, iter_125_1 in ipairs(arg_125_2) do
		var_125_1 = var_0_0.Battle.BattleTargetChoise[iter_125_1](arg_125_1, var_125_0, var_125_1)
	end

	return var_125_1
end

function var_0_3.commanderRequire(arg_126_0, arg_126_1)
	if arg_126_0._tempData.arg_list.CMDBuff_id then
		local var_126_0, var_126_1 = var_0_0.Battle.BattleDataProxy.GetInstance():GetCommanderBuff()
		local var_126_2
		local var_126_3 = arg_126_1:GetTemplate().type

		if table.contains(TeamType.SubShipType, var_126_3) then
			var_126_2 = var_126_1
		else
			var_126_2 = var_126_0
		end

		local var_126_4 = {}
		local var_126_5 = arg_126_0._tempData.arg_list.CMDBuff_id

		for iter_126_0, iter_126_1 in ipairs(var_126_2) do
			if iter_126_1.id == var_126_5 then
				table.insert(var_126_4, iter_126_1)
			end
		end

		return #var_126_4 > 0
	else
		return true
	end
end

function var_0_3.IsActive(arg_127_0)
	return arg_127_0._isActive
end

function var_0_3.SetActive(arg_128_0)
	arg_128_0._isActive = true
end

function var_0_3.NotActive(arg_129_0)
	arg_129_0._isActive = false
end

function var_0_3.IsLock(arg_130_0)
	return arg_130_0._isLock
end

function var_0_3.SetLock(arg_131_0)
	arg_131_0._isLock = true
end

function var_0_3.NotLock(arg_132_0)
	arg_132_0._isLock = false
end

function var_0_3.Dispose(arg_133_0)
	return
end
