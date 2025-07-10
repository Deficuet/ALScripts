ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleConfig
local var_0_3 = var_0_0.Battle.BattleConst
local var_0_4 = var_0_0.Battle.BattleCardPuzzleEvent
local var_0_5 = class("BattlePlayerCharacter", var_0_0.Battle.BattleCharacter)

var_0_0.Battle.BattlePlayerCharacter = var_0_5
var_0_5.__name = "BattlePlayerCharacter"

function var_0_5.Ctor(arg_1_0)
	var_0_5.super.Ctor(arg_1_0)
end

function var_0_5.SetUnitData(arg_2_0, arg_2_1)
	var_0_5.super.SetUnitData(arg_2_0, arg_2_1)

	arg_2_0._chargeWeaponList = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1:GetChargeList()) do
		arg_2_0:InitChargeWeapon(iter_2_1)
	end

	arg_2_0._torpedoWeaponList = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1:GetTorpedoList()) do
		arg_2_0:InitTorpedoWeapon(iter_2_3)
	end

	arg_2_0._airAssistList = {}

	local var_2_0 = arg_2_1:GetAirAssistList()

	if var_2_0 ~= nil then
		for iter_2_4, iter_2_5 in ipairs(var_2_0) do
			arg_2_0:InitAirAssit(iter_2_5)
		end
	end

	arg_2_0._weaponSectorList = {}
end

function var_0_5.AddUnitEvent(arg_3_0)
	var_0_5.super.AddUnitEvent(arg_3_0)
	arg_3_0._unitData:RegisterEventListener(arg_3_0, var_0_1.WILL_DIE, arg_3_0.onWillDie)
	arg_3_0._unitData:RegisterEventListener(arg_3_0, var_0_1.INIT_COOL_DOWN, arg_3_0.onInitWeaponCD)
	arg_3_0._unitData:RegisterEventListener(arg_3_0, var_0_1.WEAPON_SECTOR, arg_3_0.onActiveWeaponSector)
	arg_3_0._unitData:RegisterEventListener(arg_3_0, var_0_1.CREATE_POINT_AIR_STRIKE, arg_3_0.onCreatePointAirStrike)

	if arg_3_0._unitData:GetFleetRangeAAWeapon() then
		arg_3_0:RegisterWeaponListener(arg_3_0._unitData:GetFleetRangeAAWeapon())
	end
end

function var_0_5.RemoveUnitEvent(arg_4_0)
	if arg_4_0._unitData:GetFleetRangeAAWeapon() then
		arg_4_0:UnregisterWeaponListener(arg_4_0._unitData:GetFleetRangeAAWeapon())
	end

	for iter_4_0, iter_4_1 in ipairs(arg_4_0._chargeWeaponList) do
		iter_4_1:UnregisterEventListener(arg_4_0, var_0_1.CHARGE_WEAPON_FINISH)
		arg_4_0:UnregisterWeaponListener(iter_4_1)
	end

	for iter_4_2, iter_4_3 in ipairs(arg_4_0._torpedoWeaponList) do
		iter_4_3:UnregisterEventListener(arg_4_0, var_0_1.TORPEDO_WEAPON_FIRE)
		iter_4_3:UnregisterEventListener(arg_4_0, var_0_1.TORPEDO_WEAPON_PREPAR)
		iter_4_3:UnregisterEventListener(arg_4_0, var_0_1.TORPEDO_WEAPON_CANCEL)
		iter_4_3:UnregisterEventListener(arg_4_0, var_0_1.TORPEDO_WEAPON_READY)
		arg_4_0:UnregisterWeaponListener(iter_4_3)
	end

	for iter_4_4, iter_4_5 in ipairs(arg_4_0._airAssistList) do
		iter_4_5:UnregisterEventListener(arg_4_0, var_0_1.CHARGE_WEAPON_FINISH)
		iter_4_5:UnregisterEventListener(arg_4_0, var_0_1.FIRE)
	end

	arg_4_0._unitData:UnregisterEventListener(arg_4_0, var_0_1.WILL_DIE)
	arg_4_0._unitData:UnregisterEventListener(arg_4_0, var_0_1.INIT_COOL_DOWN)
	arg_4_0._unitData:UnregisterEventListener(arg_4_0, var_0_1.CREATE_POINT_AIR_STRIKE)
	var_0_5.super.RemoveUnitEvent(arg_4_0)
end

function var_0_5.Update(arg_5_0)
	var_0_5.super.Update(arg_5_0)
	arg_5_0:UpdatePosition()
	arg_5_0:UpdateMatrix()

	if not arg_5_0._inViewArea or not arg_5_0._alwaysHideArrow then
		arg_5_0:UpdateArrowBarPostition()
	end

	if arg_5_0._unitData:GetOxyState() then
		arg_5_0:UpdateOxygenBar()
	end

	if arg_5_0._cloakBar then
		arg_5_0._cloakBar:UpdateCloakProgress()
		arg_5_0._hpCloakBar:UpdateCloakProgress()

		if not arg_5_0._inViewArea or not arg_5_0._alwaysHideArrow then
			arg_5_0:UpdateCloakBarPosition()
		end
	end
end

function var_0_5.UpdateHpBar(arg_6_0)
	var_0_5.super.UpdateHpBar(arg_6_0)

	if arg_6_0._unitData.__name == var_0_0.Battle.BattleCardPuzzlePlayerUnit.__name then
		arg_6_0:UpdateVectorBar()
	end
end

function var_0_5.UpdateOxygenBar(arg_7_0)
	arg_7_0._oxygenSlider.value = arg_7_0._unitData:GetOxygenProgress()
end

function var_0_5.UpdateVectorBar(arg_8_0)
	local var_8_0 = arg_8_0._unitData:GetHPRate()

	arg_8_0._vectorProgress.fillAmount = var_8_0
end

function var_0_5.UpdateUIComponentPosition(arg_9_0)
	var_0_5.super.UpdateUIComponentPosition(arg_9_0)

	local var_9_0 = arg_9_0._unitData:GetBornPosition()

	if var_9_0 then
		if not arg_9_0._referenceVectorBorn then
			arg_9_0._referenceVectorBorn = Vector3.New(var_9_0.x, var_9_0.y, var_9_0.z)
		else
			arg_9_0._referenceVectorBorn:Set(var_9_0.x, var_9_0.y, var_9_0.z)
		end

		var_0_0.Battle.BattleVariable.CameraPosToUICameraByRef(arg_9_0._referenceVectorBorn)
	end
end

function var_0_5.AddArrowBar(arg_10_0, arg_10_1)
	var_0_5.super.AddArrowBar(arg_10_0, arg_10_1)

	arg_10_0._vectorProgress = arg_10_0._arrowBarTf:Find("HPBar/HPProgress"):GetComponent(typeof(Image))

	local var_10_0 = var_0_0.Battle.BattleResourceManager.GetInstance():GetCharacterQIcon(arg_10_0._unitData:GetTemplate().painting)

	setImageSprite(findTF(arg_10_0._arrowBar, "icon"), var_10_0)

	if arg_10_0._unitData:IsMainFleetUnit() and arg_10_0._unitData:GetFleetVO():GetMainList()[3] == arg_10_0._unitData then
		arg_10_1.transform:SetSiblingIndex(arg_10_1.transform.parent.childCount - 3)
	end

	arg_10_0:UpdateVectorBar()
end

function var_0_5.GetReferenceVector(arg_11_0, arg_11_1)
	if arg_11_0._inViewArea then
		return var_0_5.super.GetReferenceVector(arg_11_0, arg_11_1)
	else
		return arg_11_0._arrowVector
	end
end

function var_0_5.DisableWeaponTrack(arg_12_0)
	if arg_12_0._torpedoTrack then
		arg_12_0._torpedoTrack:SetActive(false)
	end
end

function var_0_5.SonarAcitve(arg_13_0, arg_13_1)
	if var_0_0.Battle.BattleAttr.HasSonar(arg_13_0._unitData) then
		arg_13_0._sonar:GetComponent(typeof(Animator)).enabled = arg_13_1
	end
end

function var_0_5.UpdateDiveInvisible(arg_14_0)
	var_0_5.super.UpdateDiveInvisible(arg_14_0)

	local var_14_0 = arg_14_0._unitData:GetDiveInvisible()

	SetActive(arg_14_0._diveMark, var_14_0)

	local var_14_1 = arg_14_0._unitData:GetOxygenVisible()

	SetActive(arg_14_0._oxygenBar, var_14_1)
end

function var_0_5.Dispose(arg_15_0)
	arg_15_0._torpedoIcons = nil
	arg_15_0._renderer = nil
	arg_15_0._sonar = nil
	arg_15_0._diveMark = nil
	arg_15_0._oxygenBar = nil
	arg_15_0._oxygenSlider = nil

	Object.Destroy(arg_15_0._arrowBar)

	for iter_15_0, iter_15_1 in ipairs(arg_15_0._weaponSectorList) do
		iter_15_1:Dispose()
	end

	arg_15_0._weaponSectorList = nil

	var_0_5.super.Dispose(arg_15_0)
end

function var_0_5.GetModleID(arg_16_0)
	return arg_16_0._unitData:GetTemplate().prefab
end

function var_0_5.OnUpdateHP(arg_17_0, arg_17_1)
	var_0_5.super.OnUpdateHP(arg_17_0, arg_17_1)
	arg_17_0:UpdateVectorBar()
end

function var_0_5.onInitWeaponCD(arg_18_0, arg_18_1)
	arg_18_0:onTorepedoReady()
end

function var_0_5.onCastBlink(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1.Data.callbackFunc
	local var_19_1 = arg_19_1.Data.timeScale

	arg_19_0:AddFX("jineng", false, var_19_1, var_19_0)
end

function var_0_5.onTorpedoWeaponFire(arg_20_0, arg_20_1)
	arg_20_0._torpedoTrack:SetActive(false)
	arg_20_0:onTorepedoReady()
end

function var_0_5.onTorpedoPrepar(arg_21_0, arg_21_1)
	arg_21_0._torpedoTrack:SetActive(true)

	local var_21_0 = var_0_0.Battle.BattleDataFunction.GetBulletTmpDataFromID(arg_21_1.Dispatcher:GetTemplateData().bullet_ID[1])

	arg_21_0._torpedoTrack:SetScale(Vector3(var_21_0.range / var_0_2.SPINE_SCALE, var_21_0.cld_box[3] / var_0_2.SPINE_SCALE, 1))
end

function var_0_5.onTorpedoCancel(arg_22_0, arg_22_1)
	arg_22_0._torpedoTrack:SetActive(false)
end

function var_0_5.onTorepedoReady(arg_23_0, arg_23_1)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in ipairs(arg_23_0._torpedoWeaponList) do
		if iter_23_1:GetCurrentState() == iter_23_1.STATE_READY then
			var_23_0 = var_23_0 + 1
		end
	end

	for iter_23_2 = 1, var_0_0.Battle.BattleConst.MAX_EQUIPMENT_COUNT do
		LuaHelper.SetTFChildActive(arg_23_0._torpedoIcons, "torpedo_" .. iter_23_2, iter_23_2 <= var_23_0)
	end
end

function var_0_5.onAAMissileWeaponFire(arg_24_0, arg_24_1)
	arg_24_0:onAAMissileReady()
end

function var_0_5.onWillDie(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0._smokeList) do
		if iter_25_1.active == true then
			iter_25_1.active = false

			local var_25_0 = iter_25_1.smokes

			for iter_25_2, iter_25_3 in pairs(var_25_0) do
				if iter_25_2.unInitialize then
					-- block empty
				else
					SetActive(iter_25_3, false)
				end
			end
		end
	end
end

function var_0_5.AddHPBar(arg_26_0, arg_26_1)
	var_0_5.super.AddHPBar(arg_26_0, arg_26_1)

	arg_26_0._torpedoIcons = arg_26_0._HPBarTf:Find("torpedoIcons")

	if #arg_26_0._torpedoWeaponList <= 0 then
		arg_26_0._torpedoIcons.gameObject:SetActive(false)
	end

	arg_26_0._sonar = arg_26_0._HPBarTf:Find("sonarMark")

	if var_0_0.Battle.BattleAttr.HasSonar(arg_26_0._unitData) then
		arg_26_0._sonar.gameObject:SetActive(true)
	else
		arg_26_0._sonar.gameObject:SetActive(false)
	end

	arg_26_0._diveMark = arg_26_0._HPBarTf:Find("diveMark")
	arg_26_0._oxygenBar = arg_26_0._HPBarTf:Find("oxygenBar")
	arg_26_0._oxygenSlider = arg_26_0._oxygenBar:Find("oxygen"):GetComponent(typeof(Slider))
	arg_26_0._oxygenSlider.value = 1

	arg_26_0:onTorepedoReady()
end

function var_0_5.AddModel(arg_27_0, arg_27_1)
	var_0_5.super.AddModel(arg_27_0, arg_27_1)

	arg_27_0._renderer = arg_27_0:GetTf():GetComponent(typeof(Renderer))
end

function var_0_5.AddChargeArea(arg_28_0, arg_28_1)
	arg_28_0._chargeWeaponArea = var_0_0.Battle.BattleChargeArea.New(arg_28_1)
end

function var_0_5.AddTorpedoTrack(arg_29_0, arg_29_1)
	arg_29_0._torpedoTrack = var_0_0.Battle.BossSkillAlert.New(arg_29_1)

	arg_29_0._torpedoTrack:SetActive(false)
end

function var_0_5.AddCloakBar(arg_30_0, arg_30_1)
	var_0_5.super.AddCloakBar(arg_30_0, arg_30_1)

	local var_30_0 = arg_30_0._HPBarTf:Find("cloakBar")

	arg_30_0._hpCloakBar = var_0_0.Battle.BattleCloakBar.New(var_30_0, var_0_0.Battle.BattleCloakBar.FORM_BAR)

	arg_30_0._hpCloakBar:ConfigCloak(arg_30_0._unitData:GetCloak())
	arg_30_0._hpCloakBar:UpdateCloakProgress()
	arg_30_0._hpCloakBar:SetActive(true)
end

function var_0_5.onUpdateCloakConfig(arg_31_0, arg_31_1)
	var_0_5.super.onUpdateCloakConfig(arg_31_0, arg_31_1)
	arg_31_0._hpCloakBar:UpdateCloakConfig()
end

function var_0_5.onUpdateCloakLock(arg_32_0, arg_32_1)
	var_0_5.super.onUpdateCloakLock(arg_32_0, arg_32_1)
	arg_32_0._hpCloakBar:UpdateCloakLock()
end

function var_0_5.InitChargeWeapon(arg_33_0, arg_33_1)
	arg_33_0._chargeWeaponList[#arg_33_0._chargeWeaponList + 1] = arg_33_1

	arg_33_0:RegisterWeaponListener(arg_33_1)
	arg_33_1:RegisterEventListener(arg_33_0, var_0_1.CHARGE_WEAPON_FINISH, arg_33_0.onCastBlink)
end

function var_0_5.InitAirAssit(arg_34_0, arg_34_1)
	arg_34_0._airAssistList[#arg_34_0._airAssistList + 1] = arg_34_1

	arg_34_1:RegisterEventListener(arg_34_0, var_0_1.CHARGE_WEAPON_FINISH, arg_34_0.onCastBlink)
	arg_34_1:RegisterEventListener(arg_34_0, var_0_1.FIRE, arg_34_0.onCannonFire)
end

function var_0_5.InitTorpedoWeapon(arg_35_0, arg_35_1)
	arg_35_0._torpedoWeaponList[#arg_35_0._torpedoWeaponList + 1] = arg_35_1

	arg_35_0:RegisterWeaponListener(arg_35_1)
	arg_35_1:RegisterEventListener(arg_35_0, var_0_1.TORPEDO_WEAPON_FIRE, arg_35_0.onTorpedoWeaponFire)
	arg_35_1:RegisterEventListener(arg_35_0, var_0_1.TORPEDO_WEAPON_PREPAR, arg_35_0.onTorpedoPrepar)
	arg_35_1:RegisterEventListener(arg_35_0, var_0_1.TORPEDO_WEAPON_CANCEL, arg_35_0.onTorpedoCancel)
	arg_35_1:RegisterEventListener(arg_35_0, var_0_1.TORPEDO_WEAPON_READY, arg_35_0.onTorepedoReady)
end

function var_0_5.onActiveWeaponSector(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1.Data
	local var_36_1 = var_36_0.isActive
	local var_36_2 = var_36_0.weapon

	if var_36_1 then
		local var_36_3 = arg_36_0._factory:GetFXPool():GetCharacterFX("weaponrange", arg_36_0).transform
		local var_36_4 = var_0_0.Battle.BattleWeaponRangeSector.New(var_36_3)

		var_36_4:ConfigHost(arg_36_0._unitData, var_36_2)

		arg_36_0._weaponSectorList[var_36_2] = var_36_4
	else
		arg_36_0._weaponSectorList[var_36_2]:Dispose()

		arg_36_0._weaponSectorList[var_36_2] = nil
	end
end

function var_0_5.onCreatePointAirStrike(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1.Data.weapon

	arg_37_0:InitChargeWeapon(var_37_0)
end

function var_0_5.OnAnimatorTrigger(arg_38_0)
	arg_38_0._unitData:CharacterActionTriggerCallback()
end

function var_0_5.OnAnimatorEnd(arg_39_0)
	arg_39_0._unitData:CharacterActionEndCallback()
end

function var_0_5.OnAnimatorStart(arg_40_0)
	arg_40_0._unitData:CharacterActionStartCallback()
end
