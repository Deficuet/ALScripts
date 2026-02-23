ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = var_0_0.Battle.BattleResourceManager
local var_0_5 = var_0_0.Battle.BattleFormulas
local var_0_6 = class("BattleCharacter", var_0_0.Battle.BattleSceneObject)

var_0_0.Battle.BattleCharacter = var_0_6
var_0_6.__name = "BattleCharacter"

local var_0_7 = Vector2(-1200, -1200)
local var_0_8 = Vector3.New(0.3, -1.8, 0)

var_0_6.AIM_OFFSET = Vector3.New(0, -3.5, 0)

function var_0_6.Ctor(arg_1_0)
	var_0_6.super.Ctor(arg_1_0)
	arg_1_0:Init()
end

function var_0_6.Init(arg_2_0)
	var_0_0.EventListener.AttachEventListener(arg_2_0)
	arg_2_0:InitBulletFactory()
	arg_2_0:InitEffectView()

	arg_2_0._tagFXList = {}
	arg_2_0._cacheFXList = {}
	arg_2_0._allFX = {}
	arg_2_0._bulletCache = {}
	arg_2_0._weaponRegisterList = {}
	arg_2_0._characterPos = Vector3.zero
	arg_2_0._orbitCount = 0
	arg_2_0._orbitList = {}
	arg_2_0._orbitSpineOrderOffset = 0
	arg_2_0._orbitActionCacheList = {}
	arg_2_0._orbitSpeedUpdateList = {}
	arg_2_0._orbitActionUpdateList = {}
	arg_2_0._inViewArea = false
	arg_2_0._alwaysHideArrow = false
	arg_2_0._hideHP = false
	arg_2_0._referenceVector = Vector3.zero
	arg_2_0._referenceVectorCache = Vector3.zero
	arg_2_0._referenceVectorTemp = Vector3.zero
	arg_2_0._referenceUpdateFlag = false
	arg_2_0._referenceVectorBorn = nil
	arg_2_0._hpBarPos = Vector3.zero
	arg_2_0._arrowVector = Vector3.zero
	arg_2_0._arrowAngleVector = Vector3.zero
	arg_2_0._blinkDict = {}
	arg_2_0._coverSpineHPBarOffset = 0
	arg_2_0._shaderType = nil
	arg_2_0._color = nil
	arg_2_0._actionIndex = nil
end

function var_0_6.InitBulletFactory(arg_3_0)
	arg_3_0._bulletFactoryList = var_0_0.Battle.BattleBulletFactory.GetFactoryList()
end

function var_0_6.SetUnitData(arg_4_0, arg_4_1)
	arg_4_0._unitData = arg_4_1

	arg_4_0:AddUnitEvent()
end

function var_0_6.SetBoneList(arg_5_0)
	arg_5_0._boneList = {}
	arg_5_0._remoteBoneTable = {}
	arg_5_0._bonePosTable = nil
	arg_5_0._posMatrix = nil

	local var_5_0 = arg_5_0:GetInitScale()

	for iter_5_0, iter_5_1 in pairs(arg_5_0._unitData:GetTemplate().bound_bone) do
		if iter_5_0 ~= "remote" then
			arg_5_0:insertBondList(iter_5_0, iter_5_1)
		end
	end

	for iter_5_2, iter_5_3 in pairs(var_0_3.CommonBone) do
		arg_5_0:insertBondList(iter_5_2, iter_5_3)
	end
end

function var_0_6.insertBondList(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in ipairs(arg_6_2) do
		if type(iter_6_1) == "table" then
			local var_6_0 = {}

			var_6_0[#var_6_0 + 1] = Vector3(iter_6_1[1], iter_6_1[2], iter_6_1[3])
			arg_6_0._boneList[arg_6_1] = var_6_0
		end
	end
end

function var_0_6.SpawnBullet(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	local var_7_0 = arg_7_0._bulletFactoryList[arg_7_1:GetTemplate().type]
	local var_7_1 = arg_7_0._unitData:GetRemoteBoundBone(arg_7_2)
	local var_7_2 = arg_7_4 or var_7_1 or arg_7_0:GetBonePos(arg_7_2)

	var_7_0:CreateBullet(arg_7_0._tf, arg_7_1, var_7_2, arg_7_3, arg_7_0._unitData:GetDirection())
end

function var_0_6.GetBonePos(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0._boneList[arg_8_1]

	if var_8_0 == nil or #var_8_0 == 0 then
		for iter_8_0, iter_8_1 in pairs(arg_8_0._boneList) do
			var_8_0 = iter_8_1

			break
		end
	end

	local var_8_1

	if not arg_8_0._posMatrix then
		var_8_1 = arg_8_0._tf.localToWorldMatrix
		arg_8_0._posMatrix = var_8_1
		arg_8_0._bonePosTable = {}
	else
		var_8_1 = arg_8_0._posMatrix
	end

	local var_8_2 = arg_8_0._bonePosTable[arg_8_1]

	if var_8_2 == nil then
		var_8_2 = {}

		for iter_8_2, iter_8_3 in ipairs(var_8_0) do
			var_8_2[#var_8_2 + 1] = var_8_1:MultiplyPoint3x4(iter_8_3)
		end

		arg_8_0._bonePosTable[arg_8_1] = var_8_2
	end

	if #var_8_2 == 1 then
		return var_8_2[1]
	else
		return var_8_2[math.floor(math.Random(0, #var_8_2)) + 1]
	end
end

function var_0_6.GetBoneList(arg_9_0)
	return arg_9_0._boneList
end

function var_0_6.AddFXOffsets(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._FXAttachPoint = arg_10_1
	arg_10_0._FXOffset = arg_10_2
end

function var_0_6.GetFXOffsets(arg_11_0, arg_11_1)
	arg_11_1 = arg_11_1 or 1

	return arg_11_0._FXOffset[arg_11_1]
end

function var_0_6.GetAttachPoint(arg_12_0)
	return arg_12_0._FXAttachPoint
end

function var_0_6.GetSpecificFXScale(arg_13_0)
	return {}
end

function var_0_6.PlayFX(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetFactory():GetFXPool():GetFX(arg_14_1)

	pg.EffectMgr.GetInstance():PlayBattleEffect(var_14_0, arg_14_0:GetPosition(), true)
end

function var_0_6.AddFX(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = arg_15_0:GetFactory():GetFXPool():GetCharacterFX(arg_15_1, arg_15_0, not arg_15_2, function(arg_16_0)
		if arg_15_4 then
			arg_15_4()
		end

		arg_15_0._allFX[arg_16_0] = nil
	end, arg_15_3)

	if arg_15_2 then
		local var_15_1 = arg_15_0._cacheFXList[arg_15_1] or {}

		table.insert(var_15_1, var_15_0)

		arg_15_0._cacheFXList[arg_15_1] = var_15_1
	end

	arg_15_0._allFX[var_15_0] = true

	return var_15_0
end

function var_0_6.RemoveFX(arg_17_0, arg_17_1)
	if arg_17_0._allFX and arg_17_0._allFX[arg_17_1] then
		arg_17_0._allFX[arg_17_1] = nil

		var_0_4.GetInstance():DestroyOb(arg_17_1)
	end
end

function var_0_6.RemoveCacheFX(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0._cacheFXList[arg_18_1]

	if var_18_0 ~= nil and #var_18_0 > 0 then
		local var_18_1 = table.remove(var_18_0)

		arg_18_0._allFX[var_18_1] = nil

		var_0_4.GetInstance():DestroyOb(var_18_1)
	end
end

function var_0_6.AddWaveFX(arg_19_0, arg_19_1)
	arg_19_0._waveFX = arg_19_0:AddFX(arg_19_1)
end

function var_0_6.RemoveWaveFX(arg_20_0)
	if not arg_20_0._waveFX then
		return
	end

	arg_20_0:RemoveFX(arg_20_0._waveFX)
end

function var_0_6.onAddBuffClock(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.Data

	if var_21_0.isActive then
		if not arg_21_0._buffClock then
			arg_21_0._factory:MakeBuffClock(arg_21_0)
		end

		arg_21_0._buffClock:Casting(var_21_0)
	else
		arg_21_0._buffClock:Interrupt(var_21_0)
	end
end

function var_0_6.AddBlink(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5, arg_22_6, arg_22_7)
	if arg_22_0._unitData:GetDiveInvisible() then
		return nil
	end

	if not arg_22_0._unitData:GetExposed() then
		return nil
	end

	arg_22_4 = arg_22_4 or 0.1
	arg_22_5 = arg_22_5 or 0.1
	arg_22_6 = arg_22_6 or false
	arg_22_7 = arg_22_7 or 0.18

	local var_22_0 = SpineAnim.CharBlink(arg_22_0._go, arg_22_1, arg_22_2, arg_22_3, arg_22_7, arg_22_4, arg_22_5, arg_22_6)

	if not arg_22_6 then
		arg_22_0._blinkDict[var_22_0] = {
			r = arg_22_1,
			g = arg_22_2,
			b = arg_22_3,
			a = arg_22_7,
			peroid = arg_22_4,
			duration = arg_22_5
		}
	end

	return var_22_0
end

function var_0_6.RemoveBlink(arg_23_0, arg_23_1)
	arg_23_0._blinkDict[arg_23_1] = nil

	SpineAnim.RemoveBlink(arg_23_0._go, arg_23_1)
end

function var_0_6.AddShaderColor(arg_24_0, arg_24_1)
	if not arg_24_0._unitData:GetExposed() then
		return
	end

	arg_24_1 = arg_24_1 or Color.New(0, 0, 0, 0)

	SpineAnim.AddShaderColor(arg_24_0._go, arg_24_1)
end

function var_0_6.GetPosition(arg_25_0)
	return arg_25_0._characterPos
end

function var_0_6.GetUnitData(arg_26_0)
	return arg_26_0._unitData
end

function var_0_6.GetDestroyFXID(arg_27_0)
	return arg_27_0:GetUnitData():GetTemplate().bomb_fx
end

function var_0_6.GetOffsetPos(arg_28_0)
	return (BuildVector3(arg_28_0._unitData:GetTemplate().position_offset))
end

function var_0_6.GetReferenceVector(arg_29_0, arg_29_1)
	if arg_29_1 == nil then
		return arg_29_0._referenceVector
	else
		arg_29_0._referenceVectorTemp:Set(arg_29_0._characterPos.x, arg_29_0._characterPos.y, arg_29_0._characterPos.z)
		arg_29_0._referenceVectorTemp:Sub(arg_29_1)
		var_0_0.Battle.BattleVariable.CameraPosToUICameraByRef(arg_29_0._referenceVectorTemp)

		arg_29_0._referenceVectorTemp.z = 2

		return arg_29_0._referenceVectorTemp
	end
end

function var_0_6.GetInitScale(arg_30_0)
	return arg_30_0._unitData:GetAttrByName("modelScale")
end

function var_0_6.AddUnitEvent(arg_31_0)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.SPAWN_CACHE_BULLET, arg_31_0.onSpawnCacheBullet)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.CREATE_TEMPORARY_WEAPON, arg_31_0.onNewWeapon)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.POP_UP, arg_31_0.onPopup)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.VOICE, arg_31_0.onVoice)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.PLAY_FX, arg_31_0.onPlayFX)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.REMOVE_WEAPON, arg_31_0.onRemoveWeapon)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.ADD_BLINK, arg_31_0.onBlink)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.SUBMARINE_VISIBLE, arg_31_0.onUpdateDiveInvisible)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.SUBMARINE_DETECTED, arg_31_0.onDetected)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.SUBMARINE_FORCE_DETECTED, arg_31_0.onForceDetected)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.BLIND_VISIBLE, arg_31_0.onUpdateBlindInvisible)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.BLIND_EXPOSE, arg_31_0.onBlindExposed)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.INIT_ANIT_SUB_VIGILANCE, arg_31_0.onInitVigilantState)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.INIT_CLOAK, arg_31_0.onInitCloak)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.UPDATE_CLOAK_CONFIG, arg_31_0.onUpdateCloakConfig)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.UPDATE_CLOAK_LOCK, arg_31_0.onUpdateCloakLock)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.INIT_AIMBIAS, arg_31_0.onInitAimBias)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.UPDATE_AIMBIAS_LOCK, arg_31_0.onUpdateAimBiasLock)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.HOST_AIMBIAS, arg_31_0.onHostAimBias)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.REMOVE_AIMBIAS, arg_31_0.onRemoveAimBias)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE, arg_31_0.onChangeSize)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON, arg_31_0.onNewWeapon)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.HIDE_WAVE_FX, arg_31_0.RemoveWaveFX)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.ADD_BUFF_CLOCK, arg_31_0.onAddBuffClock)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.SWITCH_SPINE, arg_31_0.onSwitchSpine)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.SWITCH_SHADER, arg_31_0.onSwitchShader)
	arg_31_0._unitData:RegisterEventListener(arg_31_0, var_0_1.UPDATE_SCORE, arg_31_0.onUpdateScore)

	local var_31_0 = arg_31_0._unitData:GetAutoWeapons()

	for iter_31_0, iter_31_1 in ipairs(var_31_0) do
		arg_31_0:RegisterWeaponListener(iter_31_1)
	end

	arg_31_0._effectOb:SetUnitDataEvent(arg_31_0._unitData)
end

function var_0_6.RemoveUnitEvent(arg_32_0)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.UPDATE_HP)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.CREATE_TEMPORARY_WEAPON)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.CHANGE_ACTION)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.SPAWN_CACHE_BULLET)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.POP_UP)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.VOICE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.PLAY_FX)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.REMOVE_WEAPON)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.ADD_BLINK)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.SUBMARINE_VISIBLE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.SUBMARINE_DETECTED)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.SUBMARINE_FORCE_DETECTED)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.BLIND_VISIBLE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.BLIND_EXPOSE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.UPDATE_SCORE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.CHANGE_ANTI_SUB_VIGILANCE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.INIT_ANIT_SUB_VIGILANCE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.ANTI_SUB_VIGILANCE_SONAR_CHECK)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.UPDATE_CLOAK_CONFIG)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.UPDATE_CLOAK_LOCK)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.INIT_CLOAK)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.HOST_AIMBIAS)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.UPDATE_AIMBIAS_LOCK)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.INIT_AIMBIAS)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.REMOVE_AIMBIAS)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.ADD_BUFF_CLOCK)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.SWITCH_SPINE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_1.SWITCH_SHADER)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE)
	arg_32_0._unitData:UnregisterEventListener(arg_32_0, var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON)

	for iter_32_0, iter_32_1 in pairs(arg_32_0._weaponRegisterList) do
		arg_32_0:UnregisterWeaponListener(iter_32_0)
	end
end

function var_0_6.Update(arg_33_0)
	local var_33_0 = pg.TimeMgr.GetInstance():GetCombatTime()

	arg_33_0._bonePosSet = nil

	arg_33_0:UpdateUIComponentPosition()
	arg_33_0:UpdateHPPop()
	arg_33_0:UpdateAniEffect(var_33_0)
	arg_33_0:UpdateTagEffect(var_33_0)

	if arg_33_0._referenceUpdateFlag then
		arg_33_0:UpdateHPBarPosition()
		arg_33_0:UpdateHPPopContainerPosition()
	end

	arg_33_0:UpdateChatPosition()
	arg_33_0:UpdateHpBar()
	arg_33_0:updateSomkeFX()
	arg_33_0:UpdateAimBiasBar()
	arg_33_0:UpdateBuffClock()
	arg_33_0:UpdateOrbit()
end

function var_0_6.RegisterWeaponListener(arg_34_0, arg_34_1)
	if arg_34_0._weaponRegisterList[arg_34_1] then
		return
	end

	arg_34_1:RegisterEventListener(arg_34_0, var_0_1.CREATE_BULLET, arg_34_0.onCreateBullet)
	arg_34_1:RegisterEventListener(arg_34_0, var_0_1.FIRE, arg_34_0.onCannonFire)

	arg_34_0._weaponRegisterList[arg_34_1] = true
end

function var_0_6.UnregisterWeaponListener(arg_35_0, arg_35_1)
	arg_35_0._weaponRegisterList[arg_35_1] = nil

	arg_35_1:UnregisterEventListener(arg_35_0, var_0_1.CREATE_BULLET)
	arg_35_1:UnregisterEventListener(arg_35_0, var_0_1.FIRE)
end

function var_0_6.onCreateBullet(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1.Data.bullet
	local var_36_1 = arg_36_1.Data.spawnBound
	local var_36_2 = arg_36_1.Data.fireFxID
	local var_36_3 = arg_36_1.Data.position

	arg_36_0:SpawnBullet(var_36_0, var_36_1, var_36_2, var_36_3)
end

function var_0_6.onCannonFire(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1.Dispatcher
	local var_37_1 = arg_37_1.Data.target
	local var_37_2 = arg_37_1.Data.actionIndex or "attack"
	local var_37_3 = arg_37_0._unitData:NeedWeaponCache()
	local var_37_4

	if not var_37_3 then
		if arg_37_0._cacheWeapon == nil then
			var_37_4 = false
		else
			var_37_4 = true
		end
	else
		arg_37_0._cacheWeapon = {}
		var_37_4 = true

		arg_37_0._unitData:StateChange(var_0_0.Battle.UnitState.STATE_ATTACK, var_37_2)
	end

	if var_37_4 == true then
		local var_37_5 = {
			weapon = var_37_0,
			target = var_37_1,
			weapon = var_37_0,
			target = var_37_1
		}

		arg_37_0._cacheWeapon[#arg_37_0._cacheWeapon + 1] = var_37_5
	else
		var_37_0:DoAttack(var_37_1)
	end
end

function var_0_6.onSpawnCacheBullet(arg_38_0)
	if arg_38_0._cacheWeapon then
		for iter_38_0, iter_38_1 in ipairs(arg_38_0._cacheWeapon) do
			iter_38_1.weapon:DoAttack(iter_38_1.target)

			if not arg_38_0._unitData:IsAlive() then
				break
			end
		end

		arg_38_0._cacheWeapon = nil
	end
end

function var_0_6.onNewWeapon(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_1.Data.weapon

	arg_39_0:RegisterWeaponListener(var_39_0)
end

function var_0_6.onPopup(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1.Data
	local var_40_1 = var_40_0.content
	local var_40_2 = var_40_0.duration
	local var_40_3 = var_40_0.key

	arg_40_0:SetPopup(var_40_1, var_40_2, var_40_3)
end

function var_0_6.onVoice(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1.Data
	local var_41_1 = var_41_0.content
	local var_41_2 = var_41_0.key

	arg_41_0:Voice(var_41_1, var_41_2)
end

function var_0_6.onPlayFX(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1.Data.fxName

	if arg_42_1.Data.notAttach then
		arg_42_0:PlayFX(var_42_0)
	else
		arg_42_0:AddFX(var_42_0)
	end
end

function var_0_6.onRemoveWeapon(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1.Data.weapon

	if arg_43_0._cacheWeapon then
		for iter_43_0, iter_43_1 in ipairs(arg_43_0._cacheWeapon) do
			if iter_43_1.weapon == var_43_0 then
				table.remove(arg_43_0._cacheWeapon, iter_43_0)

				break
			end
		end
	end

	arg_43_0:UnregisterWeaponListener(var_43_0)
end

function var_0_6.onBlink(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1.Data.blink
	local var_44_1 = var_44_0.red
	local var_44_2 = var_44_0.green
	local var_44_3 = var_44_0.blue
	local var_44_4 = var_44_0.alpha
	local var_44_5 = var_44_0.peroid
	local var_44_6 = var_44_0.duration

	arg_44_0:AddBlink(var_44_1, var_44_2, var_44_3, var_44_5, var_44_6, true, var_44_4)
end

function var_0_6.onUpdateDiveInvisible(arg_45_0, arg_45_1)
	arg_45_0:UpdateDiveInvisible()
end

function var_0_6.UpdateDiveInvisible(arg_46_0, arg_46_1)
	if not arg_46_0._go then
		return
	end

	local var_46_0 = not arg_46_0._unitData:GetForceExpose() and arg_46_0._unitData:GetDiveInvisible()
	local var_46_1 = arg_46_0._unitData:GetIFF() == var_0_3.FOE_CODE

	if var_46_0 then
		local var_46_2 = arg_46_0:GetFactory():GetDivingFilterColor()

		arg_46_0:updateInvisible(var_46_0, var_46_1 and "GRID_TRANSPARENT" or "SEMI_TRANSPARENT", var_46_2)

		if not arg_46_1 and var_46_1 then
			arg_46_0:spineSemiTransparentFade(0, 0.7, 0)
		end
	else
		arg_46_0:updateInvisible(var_46_0)

		if not var_46_1 then
			arg_46_0:AddShaderColor()
		end
	end

	if var_46_1 then
		arg_46_0:updateComponentVisible()
	end
end

function var_0_6.onUpdateBlindInvisible(arg_47_0, arg_47_1)
	arg_47_0:UpdateBlindInvisible()
end

function var_0_6.UpdateBlindInvisible(arg_48_0)
	local var_48_0 = arg_48_0._unitData:GetExposed()

	arg_48_0:GetTf():GetComponent(typeof(Renderer)).enabled = var_48_0

	arg_48_0:updateComponentVisible()
end

function var_0_6.updateInvisible(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	if arg_49_1 then
		arg_49_0:SwitchShader(arg_49_2, arg_49_3)
		arg_49_0._animator:ChangeRenderQueue(2999)
	else
		arg_49_0:SwitchShader("COLORED_ALPHA")
		arg_49_0._animator:ChangeRenderQueue(3000)
	end

	if arg_49_0._waveFX then
		SetActive(arg_49_0._waveFX.transform, not arg_49_1)
	end
end

function var_0_6.onDetected(arg_50_0, arg_50_1)
	if not arg_50_0._go then
		return
	end

	if arg_50_0._unitData:GetDiveDetected() and arg_50_0._unitData:GetIFF() == var_0_3.FOE_CODE then
		arg_50_0._shockFX = arg_50_0:AddFX("shock", true, true)
	else
		arg_50_0:RemoveCacheFX("shock")
	end

	if arg_50_0._unitData:GetIFF() == var_0_3.FOE_CODE then
		arg_50_0:UpdateCharacterDetected()
	end

	arg_50_0:updateComponentVisible()
end

function var_0_6.UpdateCharacterDetected(arg_51_0)
	if arg_51_0._unitData:GetIFF() == var_0_3.FRIENDLY_CODE or arg_51_0._unitData:GetDiveDetected() then
		arg_51_0:spineSemiTransparentFade(0, 0.7, var_0_3.SUB_FADE_IN_DURATION)
	else
		arg_51_0:spineSemiTransparentFade(0.7, 0, var_0_3.SUB_FADE_OUT_DURATION)
	end
end

function var_0_6.onForceDetected(arg_52_0, arg_52_1)
	arg_52_0:UpdateCharacterForceDetected()
end

function var_0_6.UpdateCharacterForceDetected(arg_53_0)
	if arg_53_0._unitData:GetIFF() == var_0_3.FOE_CODE and arg_53_0._unitData:GetForceExpose() then
		arg_53_0:spineSemiTransparentFade(0, 0.7, var_0_3.SUB_FADE_IN_DURATION)
		arg_53_0:updateComponentVisible()
	end
end

function var_0_6.onBlindExposed(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0._unitData:GetExposed()

	arg_54_0:GetTf():GetComponent(typeof(Renderer)).enabled = var_54_0

	arg_54_0:updateComponentVisible()
end

function var_0_6.updateComponentVisible(arg_55_0)
	local var_55_0

	if arg_55_0._unitData:GetIFF() ~= var_0_3.FOE_CODE then
		var_55_0 = arg_55_0._unitData:GetAttrByName(var_0_0.Battle.BattleBuffSetBattleUnitType.ATTR_KEY) > var_0_3.FUSION_ELEMENT_UNIT_TYPE
	else
		local var_55_1 = arg_55_0._unitData:GetExposed()
		local var_55_2 = arg_55_0._unitData:GetDiveDetected()
		local var_55_3 = arg_55_0._unitData:GetDiveInvisible()

		var_55_0 = arg_55_0._unitData:GetForceExpose() or var_55_1 and (not var_55_3 or not not var_55_2)
	end

	SetActive(arg_55_0._arrowBarTf, var_55_0)
	SetActive(arg_55_0._HPBarTf, var_55_0)
	SetActive(arg_55_0._FXAttachPoint, var_55_0)
	SetActive(arg_55_0._hpPopContainerTF, var_55_0)

	if arg_55_0._hpCloakBar then
		arg_55_0._hpCloakBar:SetActive(var_55_0)
	end

	if arg_55_0._cloakBar then
		arg_55_0._cloakBar:SetActive(var_55_0)
	end

	if arg_55_0._aimBiarBar then
		arg_55_0._aimBiarBar:SetActive(var_55_0)
	end
end

function var_0_6.updateComponentDiveInvisible(arg_56_0)
	local var_56_0 = arg_56_0._unitData:GetDiveDetected() and arg_56_0._unitData:GetIFF() == var_0_3.FOE_CODE
	local var_56_1 = arg_56_0._unitData:GetDiveInvisible()
	local var_56_2
	local var_56_3 = (var_56_0 or not var_56_1) and true or false

	SetActive(arg_56_0._arrowBarTf, var_56_3)
	SetActive(arg_56_0._HPBarTf, var_56_3)
	SetActive(arg_56_0._FXAttachPoint, var_56_3)
end

function var_0_6.updateComponentBlindInvisible(arg_57_0)
	local var_57_0 = arg_57_0._unitData:GetExposed()

	arg_57_0:GetTf():GetComponent(typeof(Renderer)).enabled = var_57_0

	SetActive(arg_57_0._arrowBarTf, var_57_0)
	SetActive(arg_57_0._HPBarTf, var_57_0)
	SetActive(arg_57_0._FXAttachPoint, var_57_0)
end

function var_0_6.spineSemiTransparentFade(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
	LeanTween.cancel(arg_58_0._go)
	onDelayTick(function()
		if not arg_58_0._go then
			return
		end

		arg_58_3 = arg_58_3 or 0

		SpineAnim.ShaderTransparentFade(arg_58_0._go, arg_58_2, arg_58_1, arg_58_3, "_Invisible")
	end, 0.06)
end

function var_0_6.onInitVigilantState(arg_60_0, arg_60_1)
	arg_60_0._factory:MakeVigilantBar(arg_60_0)

	range = arg_60_1.Data.sonarRange * 0.5

	local var_60_0 = arg_60_0:AddFX("AntiSubArea", true).transform

	var_60_0.localScale = Vector3(range, 0, range)

	local function var_60_1()
		local var_61_0 = var_60_0:Find("Quad"):GetComponent(typeof(Animator))

		var_61_0.enabled = true

		var_61_0:Play("antiSubZoom", -1, 0)
	end

	arg_60_0._unitData:RegisterEventListener(arg_60_0, var_0_1.CHANGE_ANTI_SUB_VIGILANCE, arg_60_0.onVigilantStateChange)
	arg_60_0._unitData:RegisterEventListener(arg_60_0, var_0_1.ANTI_SUB_VIGILANCE_SONAR_CHECK, var_60_1)
end

function var_0_6.onVigilantStateChange(arg_62_0, arg_62_1)
	arg_62_0:updateVigilantMark()
end

function var_0_6.updateVigilantMark(arg_63_0)
	if arg_63_0._vigilantBar then
		arg_63_0._vigilantBar:UpdateVigilantMark()
	end
end

function var_0_6.OnActionChange(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_1.Data.actionType

	arg_64_0:PlayAction(var_64_0)
end

function var_0_6.PlayAction(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_1
	local var_65_1 = false

	if arg_65_0._skeleton then
		var_65_0, var_65_1 = SpineAnimUtil.GetCharAnimDirect(arg_65_0._skeleton, math.sign(arg_65_0._modelScale.x), var_65_0)
	end

	if var_65_1 then
		local var_65_2 = Vector3(math.abs(arg_65_0._modelScale.x), arg_65_0._modelScale.y, arg_65_0._modelScale.z)

		arg_65_0:setLocalScale(var_65_2, true)
	end

	arg_65_0._animator:SetAction(var_65_0, 0, var_0_2.ActionLoop[arg_65_1])

	arg_65_0._actionIndex = arg_65_1

	if arg_65_1 == var_0_2.ActionName.VICTORY or arg_65_1 == var_0_2.ActionName.VICTORY_SWIM then
		arg_65_0._effectOb:ClearEffect()
	end

	if #arg_65_0._orbitActionUpdateList > 0 then
		for iter_65_0, iter_65_1 in ipairs(arg_65_0._orbitActionUpdateList) do
			local var_65_3 = iter_65_1.orbit
			local var_65_4 = iter_65_1.change
			local var_65_5 = var_65_4.condition.param
			local var_65_6 = false

			for iter_65_2, iter_65_3 in ipairs(var_65_5) do
				if string.find(arg_65_1, iter_65_3) then
					var_65_6 = true

					break
				end
			end

			if var_65_6 then
				arg_65_0:changeOrbitAction(var_65_3, var_65_4)

				break
			end
		end
	end
end

function var_0_6.SetAnimaSpeed(arg_66_0, arg_66_1)
	arg_66_0._skeleton = arg_66_0._skeleton or arg_66_0:GetTf():GetComponent("SkeletonAnimation")
	arg_66_1 = arg_66_1 or 1
	arg_66_0._skeleton.timeScale = arg_66_1
end

function var_0_6.UpdatePosition(arg_67_0)
	if not arg_67_0._go then
		return
	end

	local var_67_0 = arg_67_0._unitData:GetPosition()

	if arg_67_0._unitData:GetSpeed() == Vector3.zero and arg_67_0._characterPos == var_67_0 then
		return
	end

	arg_67_0._characterPos = var_67_0
	arg_67_0._tf.localPosition = arg_67_0:getCharacterPos()
end

function var_0_6.getCharacterPos(arg_68_0)
	return arg_68_0._characterPos
end

function var_0_6.UpdateMatrix(arg_69_0)
	arg_69_0._bonePosTable = nil
	arg_69_0._posMatrix = nil
end

function var_0_6.UpdateUIComponentPosition(arg_70_0)
	local var_70_0 = arg_70_0._unitData:GetPosition()

	arg_70_0._referenceVector:Set(var_70_0.x, var_70_0.y, var_70_0.z)
	var_0_0.Battle.BattleVariable.CameraPosToUICameraByRef(arg_70_0._referenceVector)

	arg_70_0._referenceVector.z = 10
	arg_70_0._referenceUpdateFlag = not arg_70_0._referenceVector:Equals(arg_70_0._referenceVectorCache)

	if arg_70_0._referenceUpdateFlag then
		arg_70_0._referenceVectorCache:Copy(arg_70_0._referenceVector)
	end
end

function var_0_6.UpdateHPPopContainerPosition(arg_71_0)
	arg_71_0._hpPopContainerTF.position = arg_71_0._referenceVector
end

function var_0_6.UpdateHPBarPosition(arg_72_0)
	if not arg_72_0._hideHP then
		arg_72_0._hpBarPos:Copy(arg_72_0._referenceVector):Add(arg_72_0._hpBarOffset)

		arg_72_0._HPBarTf.position = arg_72_0._hpBarPos
	end
end

function var_0_6.SetBarHidden(arg_73_0, arg_73_1, arg_73_2)
	arg_73_0._alwaysHideArrow = arg_73_1
	arg_73_0._hideHP = arg_73_2

	if arg_73_0._arrowBar then
		if arg_73_0._alwaysHideArrow then
			arg_73_0._arrowBarTf.anchoredPosition = var_0_7
		else
			arg_73_0._arrowBarTf.position = arg_73_0._arrowVector
		end
	end
end

function var_0_6.UpdateCastClockPosition(arg_74_0)
	arg_74_0._castClock:UpdateCastClockPosition(arg_74_0._referenceVector)
end

function var_0_6.UpdateBarrierClockPosition(arg_75_0)
	arg_75_0._barrierClock:UpdateBarrierClockPosition(arg_75_0._referenceVector)
end

function var_0_6.SetArrowPoint(arg_76_0)
	arg_76_0._arrowVector:Set()

	arg_76_0._cameraUtil = var_0_0.Battle.BattleCameraUtil.GetInstance()
	arg_76_0._arrowCenterPos = arg_76_0._cameraUtil:GetArrowCenterPos()
end

local var_0_9 = Vector3(-1, 1, 1)
local var_0_10 = Vector3(1, 1, 1)

function var_0_6.UpdateArrowBarPosition(arg_77_0)
	local var_77_0 = arg_77_0._cameraUtil:GetCharacterArrowBarPosition(arg_77_0._referenceVector, arg_77_0._arrowVector)

	if not var_77_0 then
		if not arg_77_0._inViewArea then
			arg_77_0._inViewArea = true
			arg_77_0._arrowBarTf.anchoredPosition = var_0_7
		end
	else
		local var_77_1 = arg_77_0._unitData:GetBornPosition()

		if var_77_1 and var_77_1 ~= arg_77_0._unitData:GetPosition() then
			var_77_0 = arg_77_0._cameraUtil:GetCharacterArrowBarPosition(arg_77_0._referenceVectorBorn, arg_77_0._arrowVector)
		end

		arg_77_0._arrowVector = var_77_0
		arg_77_0._inViewArea = false

		if not arg_77_0._alwaysHideArrow then
			arg_77_0._arrowBarTf.position = arg_77_0._arrowVector

			if arg_77_0._arrowVector.x > 0 then
				arg_77_0._arrowBarTf.localScale = var_0_9
			else
				arg_77_0._arrowBarTf.localScale = var_0_10
			end
		end
	end
end

function var_0_6.UpdateArrowBarRotation(arg_78_0)
	if arg_78_0._inViewArea then
		return
	end

	local var_78_0 = arg_78_0._arrowVector.x
	local var_78_1 = arg_78_0._arrowVector.y
	local var_78_2 = math.rad2Deg * math.atan2(var_78_1 - arg_78_0._arrowCenterPos.y, var_78_0 - arg_78_0._arrowCenterPos.x)

	arg_78_0._arrowAngleVector.z = var_78_2
	arg_78_0._arrowBarTf.eulerAngles = arg_78_0._arrowAngleVector
end

function var_0_6.UpdateChatPosition(arg_79_0)
	if not arg_79_0._popGO then
		return
	end

	if arg_79_0._inViewArea then
		arg_79_0._popTF.position = arg_79_0:GetReferenceVector()
	else
		arg_79_0._popTF.position = arg_79_0._arrowVector + var_0_8
	end
end

function var_0_6.Dispose(arg_80_0)
	if arg_80_0._popGO then
		LeanTween.cancel(arg_80_0._popGO)
	end

	if arg_80_0._popNumBundle then
		arg_80_0._hpPopContainerTF = nil

		arg_80_0._popNumBundle:Clear()

		arg_80_0._popNumBundle = nil
	end

	arg_80_0._popNumPool = nil

	Object.Destroy(arg_80_0._popGO)

	if arg_80_0._voicePlaybackInfo then
		arg_80_0._voicePlaybackInfo:PlaybackStop()
	end

	if arg_80_0._cloakBar then
		arg_80_0._cloakBar:Dispose()

		arg_80_0._cloakBar = nil
		arg_80_0._cloakBarTf = nil
	end

	if arg_80_0._aimBiarBar then
		arg_80_0._aimBiarBar:Dispose()

		arg_80_0._aimBiarBar = nil
	end

	if arg_80_0._buffClock then
		arg_80_0._buffClock:Dispose()

		arg_80_0._buffClock = nil
	end

	arg_80_0._voicePlaybackInfo = nil
	arg_80_0._popGO = nil
	arg_80_0._popTF = nil
	arg_80_0._cacheWeapon = nil

	for iter_80_0, iter_80_1 in pairs(arg_80_0._allFX) do
		var_0_4.GetInstance():DestroyOb(iter_80_0)
	end

	for iter_80_2, iter_80_3 in pairs(arg_80_0._orbitList) do
		var_0_4.GetInstance():DestroyOb(iter_80_2)
	end

	arg_80_0._orbitList = nil
	arg_80_0._orbitActionCacheList = nil
	arg_80_0._orbitSpeedUpdateList = nil
	arg_80_0._orbitActionUpdateList = nil

	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_80_0._voiceTimer)

	arg_80_0._voiceTimer = nil

	arg_80_0._effectOb:RemoveUnitEvent(arg_80_0._unitData)
	arg_80_0._effectOb:Dispose()

	arg_80_0._HPProgressBar = nil
	arg_80_0._HPProgress = nil

	arg_80_0._factory:GetHPBarPool():DestroyObj(arg_80_0._HPBar)

	arg_80_0._HPBar = nil
	arg_80_0._HPBarTf = nil
	arg_80_0._arrowBar = nil
	arg_80_0._arrowBarTf = nil

	if arg_80_0._animator then
		arg_80_0._animator:ClearOverrideMaterial()

		arg_80_0._animator = nil
	end

	arg_80_0._skeleton = nil
	arg_80_0._posMatrix = nil
	arg_80_0._shockFX = nil
	arg_80_0._waveFX = nil

	arg_80_0:RemoveUnitEvent()
	var_0_0.EventListener.DetachEventListener(arg_80_0)

	arg_80_0._bulletFactoryList = nil

	for iter_80_4, iter_80_5 in pairs(arg_80_0._tagFXList) do
		iter_80_5:Dispose()
	end

	arg_80_0._tagFXList = nil
	arg_80_0._weaponRegisterList = nil

	var_0_6.super.Dispose(arg_80_0)
end

function var_0_6.AddModel(arg_81_0, arg_81_1)
	arg_81_0:SetGO(arg_81_1)

	arg_81_0._hpBarOffset = Vector3(0, arg_81_0._unitData:GetBoxSize().y, 0)
	arg_81_0._animator = arg_81_0:GetTf():GetComponent(typeof(SpineAnim))
	arg_81_0._skeleton = arg_81_0:GetTf():GetComponent("SkeletonAnimation")

	if arg_81_0._animator then
		arg_81_0._animator:Start()
	end

	arg_81_0:SetBoneList()
	arg_81_0:UpdateMatrix()
	arg_81_0._unitData:ActiveCldBox()

	local var_81_0 = arg_81_0:GetInitScale()

	arg_81_0:setLocalScale(Vector3(var_81_0 * arg_81_0._unitData:GetDirection(), var_81_0, var_81_0))

	local var_81_1 = arg_81_0._unitData:GetOxyState()

	if var_81_1 and var_81_1:GetCurrentDiveState() == var_0_0.Battle.BattleConst.OXY_STATE.DIVE then
		arg_81_0:PlayAction(var_0_0.Battle.BattleConst.ActionName.DIVE)
	else
		arg_81_0:PlayAction(var_0_0.Battle.BattleConst.ActionName.MOVE)
	end

	arg_81_0._animator:SetActionCallBack(function(arg_82_0)
		if arg_82_0 == "finish" then
			arg_81_0:OnAnimatorEnd()
		elseif arg_82_0 == "action" then
			arg_81_0:OnAnimatorTrigger()
		else
			arg_81_0:changeOrbitListVisible(arg_82_0)
		end
	end)
	arg_81_0._unitData:RegisterEventListener(arg_81_0, var_0_1.CHANGE_ACTION, arg_81_0.OnActionChange)
end

function var_0_6.changeOrbitListVisible(arg_83_0, arg_83_1)
	local var_83_0

	if arg_83_1 == "skin_on" then
		var_83_0 = true
	elseif arg_83_1 == "skin_off" then
		var_83_0 = false
	else
		return
	end

	if arg_83_0._orbitList then
		for iter_83_0, iter_83_1 in pairs(arg_83_0._orbitList) do
			SetActive(iter_83_0, var_83_0)
		end
	end
end

function var_0_6.SwitchModel(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = arg_84_0._go

	arg_84_0:SetGO(arg_84_1)

	arg_84_0._animator = arg_84_0:GetTf():GetComponent(typeof(SpineAnim))
	arg_84_0._skeleton = arg_84_0:GetTf():GetComponent("SkeletonAnimation")

	if arg_84_0._animator then
		arg_84_0._animator:Start()
	end

	arg_84_0:SetBoneList()

	arg_84_0._tf.position = arg_84_0._unitData:GetPosition()

	arg_84_0:UpdateMatrix()

	arg_84_0._hpBarOffset.y = arg_84_0._hpBarOffset.y + arg_84_0._coverSpineHPBarOffset

	arg_84_0:UpdateHPBarPosition()

	local var_84_1 = arg_84_0:GetInitScale()

	arg_84_0:setLocalScale(Vector3(var_84_1 * arg_84_0._unitData:GetDirection(), var_84_1, var_84_1))
	arg_84_0._animator:SetActionCallBack(function(arg_85_0)
		if arg_85_0 == "finish" then
			arg_84_0:OnAnimatorEnd()
		elseif arg_85_0 == "action" then
			arg_84_0:OnAnimatorTrigger()
		else
			arg_84_0:changeAttachLListVisible(arg_85_0)
		end
	end)
	arg_84_0:SwitchShader(arg_84_0._shaderType, arg_84_0._color)

	local var_84_2 = {}
	local var_84_3 = {}

	for iter_84_0, iter_84_1 in pairs(arg_84_0._blinkDict) do
		local var_84_4 = SpineAnim.CharBlink(arg_84_0._go, iter_84_1.r, iter_84_1.g, iter_84_1.b, iter_84_1.a, iter_84_1.peroid, iter_84_1.duration, false)

		var_84_2[var_84_4] = iter_84_1
		var_84_3[iter_84_0] = var_84_4
	end

	arg_84_0._blinkDict = var_84_2

	arg_84_0:PlayAction(arg_84_0._actionIndex)

	if not arg_84_2 then
		for iter_84_2, iter_84_3 in pairs(arg_84_0._orbitList) do
			SpineAnim.AddFollower(iter_84_3.boundBone, arg_84_0._tf, iter_84_2.transform):GetComponent("Spine.Unity.BoneFollower").followBoneRotation = false
		end
	end

	arg_84_0._effectOb:SwitchOwner(arg_84_0, var_84_3)
	arg_84_0._FXAttachPoint.transform:SetParent(arg_84_0:GetTf(), false)
	var_0_4.GetInstance():DestroyOb(var_84_0)
end

function var_0_6.AddOrbit(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	local var_86_0 = arg_86_2.orbit_combat_bound[1]

	if arg_86_3 then
		var_86_0 = arg_86_3 .. "_" .. var_86_0
	end

	local var_86_1 = arg_86_2.orbit_combat_bound[2]
	local var_86_2 = arg_86_2.orbit_hidden_action

	arg_86_1.transform.localPosition = Vector3(var_86_1[1], var_86_1[2], var_86_1[3])

	local var_86_3 = SpineAnim.AddFollower(var_86_0, arg_86_0._tf, arg_86_1.transform):GetComponent("Spine.Unity.BoneFollower")

	if arg_86_2.orbit_rotate then
		var_86_3.followBoneRotation = true

		local var_86_4 = arg_86_1.transform.localEulerAngles

		arg_86_1.transform.localEulerAngles = Vector3(var_86_4.x, var_86_4.y, var_86_4.z - 90)
	else
		var_86_3.followBoneRotation = false
	end

	arg_86_0._orbitList[arg_86_1] = {
		hiddenAction = var_86_2,
		boundBone = var_86_0,
		offset = arg_86_0._orbitSpineOrderOffset
	}

	local var_86_5 = arg_86_2.orbit_combat_anima_change.default

	if var_86_5 then
		arg_86_0:changeOrbitAction(arg_86_1, var_86_5)

		for iter_86_0, iter_86_1 in ipairs(arg_86_2.orbit_combat_anima_change.change) do
			if iter_86_1.condition.type == 1 then
				table.insert(arg_86_0._orbitSpeedUpdateList, {
					orbit = arg_86_1,
					change = Clone(iter_86_1)
				})
			elseif iter_86_1.condition.type == 2 then
				table.insert(arg_86_0._orbitActionUpdateList, {
					orbit = arg_86_1,
					change = Clone(iter_86_1)
				})
			end
		end
	end

	arg_86_0._orbitSpineOrderOffset = arg_86_0._orbitSpineOrderOffset + var_0_6.getMaxZSort(arg_86_1)

	arg_86_0:sortOrbitZOrder()
end

function var_0_6.sortOrbitZOrder(arg_87_0)
	for iter_87_0, iter_87_1 in pairs(arg_87_0._orbitList) do
		local var_87_0 = var_0_6.getMaxZSort(iter_87_0)

		eachChild(iter_87_0, function(arg_88_0)
			if arg_88_0 and arg_88_0:GetComponent("MeshRenderer") then
				local var_88_0 = arg_88_0:GetComponent("MeshRenderer").sortingOrder

				if var_88_0 > 0 then
					arg_88_0:GetComponent("MeshRenderer").sortingOrder = arg_87_0._orbitSpineOrderOffset - iter_87_1.offset - var_87_0 + var_88_0
				end
			end
		end)
	end
end

function var_0_6.getMaxZSort(arg_89_0)
	local var_89_0 = 0

	eachChild(arg_89_0, function(arg_90_0)
		if arg_90_0 and arg_90_0:GetComponent("MeshRenderer") then
			local var_90_0 = arg_90_0:GetComponent("MeshRenderer").sortingOrder

			var_89_0 = math.max(var_89_0, var_90_0)
		end
	end)

	return var_89_0
end

function var_0_6.changeOrbitAction(arg_91_0, arg_91_1, arg_91_2)
	for iter_91_0, iter_91_1 in ipairs(arg_91_2) do
		local var_91_0 = arg_91_1.transform:Find(iter_91_1.node)

		if var_91_0 then
			SetActive(var_91_0, iter_91_1.active)

			if iter_91_1.active and arg_91_0._orbitActionCacheList[var_91_0] ~= iter_91_1.activate then
				local var_91_1 = iter_91_1.activate

				var_91_0:GetComponent(typeof(Animator)):SetBool("activate", var_91_1)

				arg_91_0._orbitActionCacheList[var_91_0] = iter_91_1.activate
			end
		end
	end
end

function var_0_6.UpdateOrbit(arg_92_0)
	if #arg_92_0._orbitSpeedUpdateList <= 0 then
		return
	end

	local var_92_0 = arg_92_0._unitData:GetSpeed():Magnitude()

	for iter_92_0, iter_92_1 in pairs(arg_92_0._orbitSpeedUpdateList) do
		local var_92_1 = iter_92_1.orbit
		local var_92_2 = iter_92_1.change
		local var_92_3 = var_92_2.condition.param
		local var_92_4 = true

		for iter_92_2, iter_92_3 in ipairs(var_92_3) do
			var_92_4 = var_0_5.simpleCompare(iter_92_3, var_92_0) and var_92_4
		end

		if var_92_4 then
			arg_92_0:changeOrbitAction(var_92_1, var_92_2)
		end
	end
end

function var_0_6.AddSmokeFXs(arg_93_0, arg_93_1)
	arg_93_0._smokeList = arg_93_1

	arg_93_0:updateSomkeFX()
end

function var_0_6.AddShadow(arg_94_0, arg_94_1)
	arg_94_0._shadow = arg_94_1
end

function var_0_6.AddHPBar(arg_95_0, arg_95_1)
	arg_95_0._HPBar = arg_95_1
	arg_95_0._HPBarTf = arg_95_1.transform
	arg_95_0._HPProgressBar = arg_95_0._HPBarTf:Find("blood")
	arg_95_0._HPProgress = arg_95_0._HPProgressBar:GetComponent(typeof(Image))

	arg_95_0._unitData:RegisterEventListener(arg_95_0, var_0_1.UPDATE_HP, arg_95_0.OnUpdateHP)

	arg_95_0._HPBarTf.position = arg_95_0._referenceVector + arg_95_0._hpBarOffset
end

function var_0_6.AddUIComponentContainer(arg_96_0, arg_96_1)
	arg_96_0:UpdateUIComponentPosition()
end

function var_0_6.AddPopNumPool(arg_97_0, arg_97_1)
	arg_97_0._popNumPool = arg_97_1
	arg_97_0._hpPopIndex_put = 1
	arg_97_0._hpPopIndex_get = 1
	arg_97_0._hpPopCount = 0
	arg_97_0._hpPopCatch = {}
	arg_97_0._popNumBundle = arg_97_0._popNumPool:GetBundle(arg_97_0._unitData:GetUnitType())
	arg_97_0._hpPopContainerTF = arg_97_0._popNumBundle:GetContainer().transform
end

function var_0_6.AddArrowBar(arg_98_0, arg_98_1)
	arg_98_0._arrowBar = arg_98_1
	arg_98_0._arrowBarTf = arg_98_1.transform

	arg_98_0:SetArrowPoint()
end

function var_0_6.AddCastClock(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1.transform

	SetActive(var_99_0, false)

	arg_99_0._castClock = var_0_0.Battle.BattleCastBar.New(var_99_0)

	arg_99_0:UpdateCastClockPosition()
end

function var_0_6.AddBuffClock(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_1.transform

	SetActive(var_100_0, false)

	arg_100_0._buffClock = var_0_0.Battle.BattleBuffClock.New(var_100_0)
end

function var_0_6.AddBarrierClock(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_1.transform

	SetActive(var_101_0, false)

	arg_101_0._barrierClock = var_0_0.Battle.BattleBarrierBar.New(var_101_0)

	arg_101_0:UpdateBarrierClockPosition()
end

function var_0_6.AddVigilantBar(arg_102_0, arg_102_1)
	arg_102_0._vigilantBar = var_0_0.Battle.BattleVigilantBar.New(arg_102_1.transform)

	arg_102_0._vigilantBar:ConfigVigilant(arg_102_0._unitData:GetAntiSubState())
	arg_102_0._vigilantBar:UpdateVigilantProgress()
	arg_102_0:updateVigilantMark()
end

function var_0_6.UpdateVigilantBarPosition(arg_103_0)
	arg_103_0._vigilantBar:UpdateVigilantBarPosition(arg_103_0._hpBarPos)
end

function var_0_6.AddCloakBar(arg_104_0, arg_104_1)
	arg_104_0._cloakBarTf = arg_104_1.transform
	arg_104_0._cloakBar = var_0_0.Battle.BattleCloakBar.New(arg_104_0._cloakBarTf)

	arg_104_0._cloakBar:ConfigCloak(arg_104_0._unitData:GetCloak())
	arg_104_0._cloakBar:UpdateCloakProgress()
end

function var_0_6.UpdateCloakBarPosition(arg_105_0, arg_105_1)
	if arg_105_0._inViewArea then
		arg_105_0._cloakBarTf.anchoredPosition = var_0_7
	else
		arg_105_0._cloakBar:UpdateCloarBarPosition(arg_105_0._arrowVector)
	end
end

function var_0_6.onInitCloak(arg_106_0, arg_106_1)
	arg_106_0._factory:MakeCloakBar(arg_106_0)
end

function var_0_6.onUpdateCloakConfig(arg_107_0, arg_107_1)
	arg_107_0._cloakBar:UpdateCloakConfig()
end

function var_0_6.onUpdateCloakLock(arg_108_0, arg_108_1)
	arg_108_0._cloakBar:UpdateCloakLock()
end

function var_0_6.AddAimBiasBar(arg_109_0, arg_109_1)
	arg_109_0._aimBiarBarTF = arg_109_1
	arg_109_0._aimBiarBar = var_0_0.Battle.BattleAimbiasBar.New(arg_109_1)

	arg_109_0._aimBiarBar:ConfigAimBias(arg_109_0._unitData:GetAimBias())
	arg_109_0._aimBiarBar:UpdateAimBiasProgress()
end

function var_0_6.IsDoubleChar(arg_110_0)
	if arg_110_0._skeleton then
		local var_110_0 = arg_110_0._skeleton.skeleton:FindBoneIndex("char1_face")
		local var_110_1 = arg_110_0._skeleton.skeleton:FindBoneIndex("char2_face")

		if var_110_0 >= 0 and var_110_1 >= 0 then
			return true
		end
	end

	return false
end

function var_0_6.UpdateAimBiasBar(arg_111_0)
	if arg_111_0._aimBiarBar then
		arg_111_0._aimBiarBar:UpdateAimBiasProgress()
	end
end

function var_0_6.UpdateBuffClock(arg_112_0)
	if arg_112_0._buffClock and arg_112_0._buffClock:IsActive() then
		arg_112_0._buffClock:UpdateCastClockPosition(arg_112_0._referenceVector)
		arg_112_0._buffClock:UpdateCastClock()
	end
end

function var_0_6.onUpdateAimBiasLock(arg_113_0, arg_113_1)
	arg_113_0._aimBiarBar:UpdateLockStateView()
end

function var_0_6.onInitAimBias(arg_114_0, arg_114_1)
	if arg_114_0._unitData:GetAimBias():GetHost() == arg_114_0._unitData then
		arg_114_0._factory:MakeAimBiasBar(arg_114_0)
	end
end

function var_0_6.onHostAimBias(arg_115_0, arg_115_1)
	arg_115_0._factory:MakeAimBiasBar(arg_115_0)
end

function var_0_6.onRemoveAimBias(arg_116_0, arg_116_1)
	arg_116_0._aimBiarBar:SetActive(false)
	arg_116_0._aimBiarBar:Dispose()

	arg_116_0._aimBiarBar = nil
	arg_116_0._aimBiarBarTF = nil
end

function var_0_6.AddAimBiasFogFX(arg_117_0)
	local var_117_0 = arg_117_0._unitData:GetTemplate().fog_fx

	if var_117_0 and var_117_0 ~= "" then
		arg_117_0._fogFx = arg_117_0:AddFX(var_117_0)
	end
end

function var_0_6.OnUpdateHP(arg_118_0, arg_118_1)
	arg_118_0:_DealHPPop(arg_118_1.Data)
end

function var_0_6._DealHPPop(arg_119_0, arg_119_1)
	if arg_119_0._hpPopIndex_put == arg_119_0._hpPopIndex_get and arg_119_0._hpPopCount == 0 then
		arg_119_0:_PlayHPPop(arg_119_1)

		arg_119_0._hpPopCount = 1
	elseif arg_119_0._unitData:IsAlive() then
		arg_119_0._hpPopCatch[arg_119_0._hpPopIndex_put] = arg_119_1
		arg_119_0._hpPopIndex_put = arg_119_0._hpPopIndex_put + 1
	else
		arg_119_0:_PlayHPPop(arg_119_1)
	end
end

function var_0_6.UpdateHPPop(arg_120_0)
	if arg_120_0._hpPopIndex_put == arg_120_0._hpPopIndex_get then
		return
	else
		arg_120_0._hpPopCount = arg_120_0._hpPopCount + 1

		if arg_120_0:_CalcHPPopCount() <= arg_120_0._hpPopCount then
			arg_120_0:_PlayHPPop(arg_120_0._hpPopCatch[arg_120_0._hpPopIndex_get])

			arg_120_0._hpPopCatch[arg_120_0._hpPopIndex_get] = nil
			arg_120_0._hpPopIndex_get = arg_120_0._hpPopIndex_get + 1
			arg_120_0._hpPopCount = 0
		end
	end
end

function var_0_6._PlayHPPop(arg_121_0, arg_121_1)
	if arg_121_0._popNumBundle:IsScorePop() then
		return
	end

	local var_121_0 = arg_121_1.dHP
	local var_121_1 = arg_121_1.isCri
	local var_121_2 = arg_121_1.isMiss
	local var_121_3 = arg_121_1.isHeal
	local var_121_4 = arg_121_1.posOffset or Vector3.zero
	local var_121_5 = arg_121_1.font
	local var_121_6 = arg_121_0._popNumBundle:GetPop(var_121_3, var_121_1, var_121_2, var_121_0, var_121_5)

	var_121_6:SetReferenceCharacter(arg_121_0, var_121_4)
	var_121_6:Play()
end

function var_0_6._CalcHPPopCount(arg_122_0)
	if arg_122_0._hpPopIndex_put - arg_122_0._hpPopIndex_get > 5 then
		return 1
	else
		return 5
	end
end

function var_0_6.onUpdateScore(arg_123_0, arg_123_1)
	local var_123_0 = arg_123_1.Data.score
	local var_123_1 = arg_123_0._popNumBundle:GetScorePop(var_123_0)

	var_123_1:SetReferenceCharacter(arg_123_0, Vector3.zero)
	var_123_1:Play()
end

function var_0_6.UpdateHpBar(arg_124_0)
	local var_124_0 = arg_124_0._unitData:GetCurrentHP()

	if arg_124_0._HPProgress and arg_124_0._cacheHP ~= var_124_0 then
		local var_124_1 = arg_124_0._unitData:GetHPRate()

		arg_124_0._HPProgress.fillAmount = var_124_1
		arg_124_0._cacheHP = var_124_0
	end
end

function var_0_6.onChangeSize(arg_125_0, arg_125_1)
	arg_125_0:doChangeSize(arg_125_1)
end

function var_0_6.updateSomkeFX(arg_126_0)
	local var_126_0 = arg_126_0._unitData:GetHPRate()

	for iter_126_0, iter_126_1 in ipairs(arg_126_0._smokeList) do
		if var_126_0 < iter_126_1.rate then
			if iter_126_1.active == false then
				iter_126_1.active = true

				local var_126_1 = iter_126_1.smokes

				for iter_126_2, iter_126_3 in pairs(var_126_1) do
					if iter_126_2.unInitialize then
						local var_126_2 = arg_126_0:AddFX(iter_126_2.resID)

						var_126_2.transform.localPosition = iter_126_2.pos
						var_126_1[iter_126_2] = var_126_2

						SetActive(var_126_2, true)

						iter_126_2.unInitialize = false
					else
						SetActive(iter_126_3, true)
					end
				end
			end
		elseif iter_126_1.active == true then
			iter_126_1.active = false

			local var_126_3 = iter_126_1.smokes

			for iter_126_4, iter_126_5 in pairs(var_126_3) do
				if iter_126_4.unInitialize then
					-- block empty
				else
					SetActive(iter_126_5, false)
				end
			end
		end
	end
end

function var_0_6.doChangeSize(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_0._unitData:GetAttrByName("modelScale")

	arg_127_0:setLocalScale(Vector3(var_127_0 * arg_127_0._unitData:GetDirection(), var_127_0, var_127_0))
end

function var_0_6.InitEffectView(arg_128_0)
	arg_128_0._effectOb = var_0_0.Battle.BattleEffectComponent.New(arg_128_0)
end

function var_0_6.UpdateAniEffect(arg_129_0, arg_129_1)
	arg_129_0._effectOb:Update(arg_129_1)
end

function var_0_6.UpdateTagEffect(arg_130_0, arg_130_1)
	local var_130_0 = arg_130_0._unitData:GetBoxSize().y * 0.5

	for iter_130_0, iter_130_1 in pairs(arg_130_0._tagFXList) do
		iter_130_1:Update(arg_130_1)
		iter_130_1:SetPosition(arg_130_0._referenceVector + Vector3(0, var_130_0, 0))
	end
end

function var_0_6.SetPopup(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	if arg_131_0._voiceTimer then
		if arg_131_0._voiceKey == arg_131_3 then
			arg_131_0._voiceKey = nil
		else
			return
		end
	end

	if arg_131_0._popGO then
		LeanTween.cancel(arg_131_0._popGO)

		local var_131_0 = arg_131_0._popGO.transform:GetComponent(typeof(Animation))

		if var_131_0 then
			var_131_0:Play("popup_out")
			arg_131_0._popGO:GetComponent("DftAniEvent"):SetEndEvent(function(arg_132_0)
				arg_131_0.ChatPopAnimation(arg_131_0._popGO, arg_131_2)
			end)
		else
			LeanTween.cancel(arg_131_0._popGO)
			LeanTween.scale(rtf(arg_131_0._popGO.gameObject), Vector3.New(0, 0, 1), 0.1):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function()
				arg_131_0.ChatPop(arg_131_0._popGO, arg_131_2)
			end))
		end
	else
		arg_131_0._popGO = arg_131_0._factory:MakePopup()
		arg_131_0._popTF = arg_131_0._popGO.transform

		if arg_131_0._popGO.transform:GetComponent(typeof(Animation)) then
			arg_131_0.ChatPopAnimation(arg_131_0._popGO, arg_131_2)
		else
			arg_131_0._popTF.localScale = Vector3(0, 0, 0)

			arg_131_0.ChatPop(arg_131_0._popGO, arg_131_2)
		end
	end

	var_0_6.setChatText(arg_131_0._popGO, arg_131_1)
	SetActive(arg_131_0._popGO, true)
end

function var_0_6.ChatPopAnimation(arg_134_0, arg_134_1)
	local var_134_0 = arg_134_0.transform:GetComponent(typeof(Animation))

	var_134_0:Play("popup_in")
	LeanTween.delayedCall(arg_134_0.gameObject, arg_134_1, System.Action(function()
		var_134_0:Play("popup_out")
		arg_134_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_136_0)
			SetActive(arg_134_0, false)
		end)
	end))
end

function var_0_6.ChatPop(arg_137_0, arg_137_1)
	arg_137_1 = arg_137_1 or 2.5

	LeanTween.scale(rtf(arg_137_0.gameObject), Vector3.New(1, 1, 1), 0.3):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
		LeanTween.scale(rtf(arg_137_0.gameObject), Vector3.New(0, 0, 1), 0.3):setEase(LeanTweenType.easeInBack):setDelay(arg_137_1):setOnComplete(System.Action(function()
			SetActive(arg_137_0, false)
		end))
	end))
end

function var_0_6.setChatText(arg_140_0, arg_140_1)
	local var_140_0 = findTF(arg_140_0, "Text"):GetComponent(typeof(Text))

	var_140_0.text = arg_140_1

	if #var_140_0.text > CHAT_POP_STR_LEN then
		var_140_0.alignment = TextAnchor.MiddleLeft
	else
		var_140_0.alignment = TextAnchor.MiddleCenter
	end
end

function var_0_6.Voice(arg_141_0, arg_141_1, arg_141_2)
	if arg_141_0._voiceTimer then
		return
	end

	pg.CriMgr.GetInstance():PlayMultipleSound_V3(arg_141_1, function(arg_142_0)
		if arg_142_0 then
			arg_141_0._voiceKey = arg_141_2
			arg_141_0._voicePlaybackInfo = arg_142_0
			arg_141_0._voiceTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", 0, arg_141_0._voicePlaybackInfo:GetLength() * 0.001, function()
				pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_141_0._voiceTimer)

				arg_141_0._voiceTimer = nil
				arg_141_0._voiceKey = nil
				arg_141_0._voicePlaybackInfo = nil
			end)
		end
	end)
end

function var_0_6.setLocalScale(arg_144_0, arg_144_1, arg_144_2)
	arg_144_0._tf.localScale = arg_144_1

	if not arg_144_2 then
		arg_144_0._modelScale = arg_144_1
	end
end

function var_0_6.SonarAcitve(arg_145_0, arg_145_1)
	return
end

function var_0_6.SwitchShader(arg_146_0, arg_146_1, arg_146_2, arg_146_3)
	LeanTween.cancel(arg_146_0._go)

	arg_146_2 = arg_146_2 or Color.New(0, 0, 0, 0)

	if arg_146_1 then
		local var_146_0 = var_0_4.GetInstance():GetShader(arg_146_1)

		arg_146_0._animator:ShiftShader(var_146_0, arg_146_2)

		if arg_146_3 then
			arg_146_0:spineSemiTransparentFade(0, arg_146_3.invisible, 0)
		end
	end

	arg_146_0._shaderType = arg_146_1
	arg_146_0._color = arg_146_2
end

function var_0_6.PauseActionAnimation(arg_147_0, arg_147_1)
	local var_147_0 = arg_147_1 and 0 or 1

	arg_147_0._animator:GetAnimationState().TimeScale = var_147_0
end

function var_0_6.GetFactory(arg_148_0)
	return arg_148_0._factory
end

function var_0_6.SetFactory(arg_149_0, arg_149_1)
	arg_149_0._factory = arg_149_1
end

function var_0_6.onSwitchSpine(arg_150_0, arg_150_1)
	local var_150_0 = arg_150_1.Data
	local var_150_1 = var_150_0.skin

	arg_150_0._coverSpineHPBarOffset = var_150_0.HPBarOffset or 0

	arg_150_0:SwitchSpine(var_150_1)
end

function var_0_6.SwitchSpine(arg_151_0, arg_151_1)
	for iter_151_0, iter_151_1 in pairs(arg_151_0._blinkDict) do
		SpineAnim.RemoveBlink(arg_151_0._go, iter_151_0)
	end

	arg_151_0._factory:SwitchCharacterSpine(arg_151_0, arg_151_1)
end

function var_0_6.onSwitchShader(arg_152_0, arg_152_1)
	local var_152_0 = arg_152_1.Data
	local var_152_1 = var_152_0.shader
	local var_152_2 = var_152_0.color
	local var_152_3 = var_152_0.args

	arg_152_0:SwitchShader(var_152_1, var_152_2, var_152_3)
end
