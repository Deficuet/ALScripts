ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConfig
local var_0_2 = singletonClass("BattleCharacterFactory")

var_0_0.Battle.BattleCharacterFactory = var_0_2
var_0_2.__name = "BattleCharacterFactory"
var_0_2.HP_BAR_NAME = ""
var_0_2.POPUP_NAME = "popup"
var_0_2.TAG_NAME = "ChargeAreaContainer/LockTag"
var_0_2.MOVE_WAVE_FX_POS = Vector3(0, -2.3, -1.5)
var_0_2.MOVE_WAVE_FX_NAME = "movewave"
var_0_2.SMOKE_FX_NAME = "smoke"
var_0_2.BOMB_FX_NAME = "Bomb"
var_0_2.DANCHUAN_MOVE_WAVE_FX_NAME = "danchuanlanghuazhong2"

function var_0_2.Ctor(arg_1_0)
	return
end

function var_0_2.CreateCharacter(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.unit
	local var_2_1 = arg_2_0:MakeCharacter()

	var_2_1:SetFactory(arg_2_0)
	var_2_1:SetUnitData(var_2_0)
	arg_2_0:MakeModel(var_2_1)

	return var_2_1
end

function var_0_2.GetSceneMediator(arg_3_0)
	return var_0_0.Battle.BattleState.GetInstance():GetMediatorByName(var_0_0.Battle.BattleSceneMediator.__name)
end

function var_0_2.GetFXPool(arg_4_0)
	return var_0_0.Battle.BattleFXPool.GetInstance()
end

function var_0_2.GetCharacterPool(arg_5_0)
	return var_0_0.Battle.BattleResourceManager.GetInstance()
end

function var_0_2.GetHPBarPool(arg_6_0)
	return var_0_0.Battle.BattleHPBarManager.GetInstance()
end

function var_0_2.GetDivingFilterColor(arg_7_0)
	local var_7_0 = var_0_0.Battle.BattleDataProxy.GetInstance()._mapId
	local var_7_1 = var_0_0.Battle.BattleDataFunction.GetDivingFilter(var_7_0)

	return (Color.New(var_7_1.r, var_7_1.g, var_7_1.b, var_7_1.a))
end

function var_0_2.GetFXContainerPool(arg_8_0)
	return var_0_0.Battle.BattleCharacterFXContainersPool.GetInstance()
end

function var_0_2.MakeCharacter(arg_9_0)
	return nil
end

function var_0_2.MakeModel(arg_10_0, arg_10_1)
	return nil
end

function var_0_2.MakeBloodBar(arg_11_0, arg_11_1)
	return nil
end

function var_0_2.MakeAimBiasBar(arg_12_0)
	return nil
end

function var_0_2.SetHPBarWidth(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_1:GetUnitData():GetTemplate().hp_bar[1]
	local var_13_1 = arg_13_2.transform
	local var_13_2 = var_13_1.rect.height

	var_13_1.sizeDelta = Vector2(var_13_0, var_13_2)

	local var_13_3 = var_13_1:Find("blood").transform
	local var_13_4 = var_13_3.rect.height

	var_13_3.sizeDelta = Vector2(var_13_0 + arg_13_3 or 0, var_13_4)
end

function var_0_2.MakeUIComponentContainer(arg_14_0, arg_14_1)
	arg_14_1:AddUIComponentContainer()
end

function var_0_2.MakeFXContainer(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:GetTf()
	local var_15_1 = arg_15_0:GetFXPool():PopCharacterAttachPoint()
	local var_15_2 = var_15_1.transform

	SetActive(var_15_2, true)
	var_15_2:SetParent(var_15_0, false)

	var_15_2.localPosition = Vector3.zero

	local var_15_3 = var_15_0.localEulerAngles

	var_15_2.localEulerAngles = Vector3(var_15_3.x * -1, var_15_3.y, var_15_3.z)

	local var_15_4 = arg_15_1:GetUnitData():GetTemplate().fx_container
	local var_15_5 = {}

	for iter_15_0, iter_15_1 in ipairs(var_0_0.Battle.BattleConst.FXContainerIndex) do
		local var_15_6 = var_15_4[iter_15_0]

		var_15_5[iter_15_0] = Vector3(var_15_6[1], var_15_6[2], var_15_6[3])
	end

	arg_15_1:AddFXOffsets(var_15_1, var_15_5)
end

function var_0_2.MakeShadow(arg_16_0)
	return nil
end

function var_0_2.MakeSmokeFX(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:GetUnitData():GetTemplate().smoke
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		local var_17_2 = iter_17_1[2]
		local var_17_3 = {}

		for iter_17_2, iter_17_3 in ipairs(var_17_2) do
			local var_17_4 = {}

			var_17_4.unInitialize = true
			var_17_4.resID = iter_17_3[1]
			var_17_4.pos = Vector3(iter_17_3[2][1], iter_17_3[2][2], iter_17_3[2][3])
			var_17_3[var_17_4] = false
		end

		var_17_1[iter_17_0] = {
			active = false,
			rate = iter_17_1[1] / 100,
			smokes = var_17_3
		}
	end

	arg_17_1:AddSmokeFXs(var_17_1)
end

function var_0_2.MakeWaveFX(arg_18_0, arg_18_1)
	arg_18_1:AddWaveFX(arg_18_0.MOVE_WAVE_FX_NAME)
end

function var_0_2.MakePopNumPool(arg_19_0, arg_19_1)
	arg_19_1:AddPopNumPool(arg_19_0:GetSceneMediator():GetPopNumPool())
end

function var_0_2.MakeTag(arg_20_0, arg_20_1)
	return (var_0_0.Battle.BattleLockTag.New(arg_20_0:GetSceneMediator():InstantiateCharacterComponent(arg_20_0.TAG_NAME), arg_20_1))
end

function var_0_2.MakePopup(arg_21_0)
	return (arg_21_0:GetSceneMediator():InstantiateCharacterComponent(arg_21_0.POPUP_NAME))
end

function var_0_2.MakeArrowBar(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetSceneMediator()

	arg_22_1:AddArrowBar(var_22_0:InstantiateCharacterComponent(arg_22_0.ARROW_BAR_NAME))
	arg_22_1:UpdateArrowBarPosition()
end

function var_0_2.MakeCastClock(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:GetSceneMediator()

	arg_23_1:AddCastClock(var_23_0:InstantiateCharacterComponent("CastClockContainer/castClock"))
end

function var_0_2.MakeBuffClock(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:GetSceneMediator()

	arg_24_1:AddBuffClock(var_24_0:InstantiateCharacterComponent("CastClockContainer/buffClock"))
end

function var_0_2.MakeBarrierClock(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0:GetSceneMediator()

	arg_25_1:AddBarrierClock(var_25_0:InstantiateCharacterComponent("CastClockContainer/shieldClock"))
end

function var_0_2.MakeVigilantBar(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0:GetSceneMediator()

	arg_26_1:AddVigilantBar(var_26_0:InstantiateCharacterComponent("AntiSubVigilantContainer/antiSubMeter"))
	arg_26_1:UpdateVigilantBarPosition()
end

function var_0_2.MakeCloakBar(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:GetSceneMediator()

	arg_27_1:AddCloakBar(var_27_0:InstantiateCharacterComponent("CloakContainer/cloakMeter"))
	arg_27_1:UpdateCloakBarPosition()
end

function var_0_2.MakeSkinOrbit(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1:GetUnitData():GetSkinAttachmentInfo()

	if var_28_0 then
		for iter_28_0, iter_28_1 in ipairs(var_28_0) do
			local var_28_1 = var_0_0.Battle.BattleDataFunction.GetEquipSkinDataFromID(iter_28_1)

			if arg_28_1:IsDoubleChar() then
				local var_28_2 = var_0_0.Battle.BattleResourceManager.GetInstance():InstOrbit(var_28_1.orbit_combat)
				local var_28_3 = var_0_0.Battle.BattleResourceManager.GetInstance():InstOrbit(var_28_1.orbit_combat)
				local var_28_4 = var_28_1.double_char_bone

				if var_28_4 and #var_28_4 > 0 and var_28_4[1] == 1 then
					arg_28_1:AddOrbit(var_28_3, var_28_1, "char2")
				end

				if var_28_4 and #var_28_4 > 0 and var_28_4[2] == 1 then
					arg_28_1:AddOrbit(var_28_2, var_28_1)
				end

				if var_28_4 and #var_28_4 > 0 and var_28_4[3] == 1 then
					arg_28_1:AddOrbit(var_28_2, var_28_1, "char1")
				end
			else
				local var_28_5 = var_0_0.Battle.BattleResourceManager.GetInstance():InstOrbit(var_28_1.orbit_combat)

				arg_28_1:AddOrbit(var_28_5, var_28_1)
			end
		end
	end
end

function var_0_2.RemoveCharacter(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_1:GetUnitData():GetTemplate().nationality

	if var_29_0 and table.contains(var_0_1.SWEET_DEATH_NATIONALITY, var_29_0) then
		-- block empty
	elseif arg_29_2 and arg_29_2 ~= var_0_0.Battle.BattleConst.UnitDeathReason.KILLED then
		-- block empty
	else
		local var_29_1 = arg_29_1:GetUnitData():GetDeadFX()
		local var_29_2, var_29_3 = arg_29_0:GetFXPool():GetFX(var_29_1 or arg_29_0.BOMB_FX_NAME)

		pg.EffectMgr.GetInstance():PlayBattleEffect(var_29_2, var_29_3:Add(arg_29_1:GetPosition()), true)
	end

	arg_29_1:Dispose()
	arg_29_0:GetFXPool():PushCharacterAttachPoint(arg_29_1:GetAttachPoint())
end

function var_0_2.SwitchCharacterSpine(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0

	if arg_30_2 then
		var_30_0 = var_0_0.Battle.BattleDataFunction.GetPlayerShipSkinDataFromID(arg_30_2).prefab
	else
		var_30_0 = arg_30_1:GetModleID()
	end

	local function var_30_1(arg_31_0)
		arg_30_1:SwitchModel(arg_31_0, arg_30_2)
		arg_30_1:CameraOrthogonal(var_0_0.Battle.BattleCameraUtil.GetInstance():GetCamera())
	end

	arg_30_0:GetCharacterPool():InstCharacter(var_30_0, function(arg_32_0)
		var_30_1(arg_32_0)
	end)
end
