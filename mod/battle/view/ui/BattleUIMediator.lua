ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleEvent
local var_0_2 = var_0_0.Battle.BattleUnitEvent
local var_0_3 = var_0_0.Battle.BattleConst
local var_0_4 = var_0_0.Battle.BattleVariable
local var_0_5 = var_0_0.Battle.BattleConfig
local var_0_6 = var_0_0.Battle.BattleCardPuzzleEvent
local var_0_7 = class("BattleUIMediator", var_0_0.MVC.Mediator)

var_0_0.Battle.BattleUIMediator = var_0_7
var_0_7.__name = "BattleUIMediator"

function var_0_7.Ctor(arg_1_0)
	var_0_7.super.Ctor(arg_1_0)
end

function var_0_7.SetBattleUI(arg_2_0)
	arg_2_0._ui = arg_2_0._state:GetUI()
end

function var_0_7.Initialize(arg_3_0)
	var_0_7.super.Initialize(arg_3_0)

	arg_3_0._dataProxy = arg_3_0._state:GetProxyByName(var_0_0.Battle.BattleDataProxy.__name)
	arg_3_0._uiMGR = pg.UIMgr.GetInstance()
	arg_3_0._fxPool = var_0_0.Battle.BattleFXPool.GetInstance()
	arg_3_0._updateViewList = {}

	arg_3_0:SetBattleUI()
	arg_3_0:AddUIEvent()
	arg_3_0:InitCamera()
	arg_3_0:InitGuide()
end

function var_0_7.Reinitialize(arg_4_0)
	arg_4_0._skillView:Dispose()
end

function var_0_7.EnableComponent(arg_5_0, arg_5_1)
	arg_5_0._ui._tf:Find("PauseBtn"):GetComponent(typeof(Button)).enabled = arg_5_1

	arg_5_0._skillView:EnableWeaponButton(arg_5_1)
end

function var_0_7.EnableJoystick(arg_6_0, arg_6_1)
	arg_6_0._stickController.enabled = arg_6_1

	local var_6_0 = arg_6_0._joystick:GetComponent(typeof(Animation))

	if var_6_0 then
		var_6_0.enabled = arg_6_1
	end

	local var_6_1 = arg_6_0._joystick:GetComponent(typeof(Animator))

	if var_6_1 then
		var_6_1.enabled = arg_6_1
	end

	setActive(arg_6_0._joystick, arg_6_1)

	local var_6_2 = arg_6_0._joystick:Find("Area/BG/spine")

	if var_6_2 then
		local var_6_3 = var_6_2:GetComponent(typeof(SpineAnimUI))

		if arg_6_1 then
			var_6_3:SetAction("cut_in", 0)
		end
	end
end

function var_0_7.EnableWeaponButton(arg_7_0, arg_7_1)
	arg_7_0._skillView:EnableWeaponButton(arg_7_1)
end

function var_0_7.EnableSkillFloat(arg_8_0, arg_8_1)
	arg_8_0._ui:EnableSkillFloat(arg_8_1)
end

function var_0_7.GetAppearFX(arg_9_0)
	return arg_9_0._appearEffect
end

function var_0_7.DisableComponent(arg_10_0)
	arg_10_0._ui._tf:Find("PauseBtn"):GetComponent(typeof(Button)).enabled = false

	arg_10_0._skillView:DisableWeapnButton()
	SetActive(arg_10_0._ui._tf:Find("HPBarContainer"), false)
	SetActive(arg_10_0._ui._tf:Find("flagShipMark"), false)

	if arg_10_0._jammingView then
		arg_10_0._jammingView:Eliminate(false)
	end

	if arg_10_0._inkView then
		arg_10_0._inkView:SetActive(false)
	end
end

function var_0_7.ActiveDebugConsole(arg_11_0)
	arg_11_0._debugConsoleView:SetActive(true)
end

function var_0_7.OpeningEffect(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._uiMGR:SetActive(false)

	if arg_12_2 == SYSTEM_SUBMARINE_RUN then
		arg_12_0._skillView:SubmarineButton()

		local var_12_0 = var_0_5.JOY_STICK_DEFAULT_PREFERENCE

		arg_12_0._joystick.anchorMin = Vector2(var_12_0.x, var_12_0.y)
		arg_12_0._joystick.anchorMax = Vector2(var_12_0.x, var_12_0.y)
	elseif arg_12_2 == SYSTEM_SUB_ROUTINE then
		arg_12_0._skillView:SubRoutineButton()
	elseif arg_12_2 == SYSTEM_AIRFIGHT then
		arg_12_0._skillView:AirFightButton()
	elseif arg_12_2 == SYSTEM_DEBUG then
		arg_12_0._skillView:NormalButton()
	elseif arg_12_2 == SYSTEM_CARDPUZZLE then
		arg_12_0._skillView:CardPuzzleButton()
	else
		local var_12_1 = pg.SeriesGuideMgr.GetInstance()

		if var_12_1.currIndex and var_12_1:isEnd() then
			arg_12_0._skillView:NormalButton()
		else
			local var_12_2 = arg_12_0._dataProxy:GetDungeonData().skill_hide or {}

			arg_12_0._skillView:CustomButton(var_12_2)
		end
	end

	LeanTween.delayedCall(var_0_5.COMBAT_DELAY_ACTIVE, System.Action(function()
		arg_12_0._uiMGR:SetActive(true)
		arg_12_0:EnableComponent(true)

		if arg_12_1 then
			arg_12_1()
		end
	end))
	SetActive(arg_12_0._ui._go, true)
	arg_12_0._skillView:ButtonInitialAnima()
end

function var_0_7.InitScene(arg_14_0)
	arg_14_0._mapId = arg_14_0._dataProxy._mapId
	arg_14_0._seaView = var_0_0.Battle.BattleMap.New(arg_14_0._mapId)
end

function var_0_7.InitJoystick(arg_15_0)
	arg_15_0._joystick = arg_15_0._ui._tf:Find("Stick")

	local var_15_0 = var_0_5.JOY_STICK_DEFAULT_PREFERENCE
	local var_15_1 = arg_15_0._joystick
	local var_15_2 = 1
	local var_15_3 = PlayerPrefs.GetFloat("joystick_scale", var_15_0.scale)
	local var_15_4 = PlayerPrefs.GetFloat("joystick_anchorX", var_15_0.x)
	local var_15_5 = PlayerPrefs.GetFloat("joystick_anchorY", var_15_0.y)
	local var_15_6 = var_15_2 * var_15_3

	arg_15_0._joystick.localScale = Vector3(var_15_6, var_15_6, 1)

	originalPrint("scale: ", arg_15_0._joystick.localScale)

	var_15_1.anchoredPosition = var_15_1.anchoredPosition * var_15_6
	arg_15_0._joystick.anchorMin = Vector2(var_15_4, var_15_5)
	arg_15_0._joystick.anchorMax = Vector2(var_15_4, var_15_5)
	arg_15_0._stickController = arg_15_0._joystick:GetComponent("StickController")

	arg_15_0._uiMGR:AttachStickOb(arg_15_0._joystick)

	local var_15_7 = arg_15_0._joystick:Find("Area/BG/spine")

	if var_15_7 then
		local var_15_8 = var_15_7:GetComponent(typeof(SpineAnimUI))

		var_15_8:SetActionCallBack(function(arg_16_0)
			if arg_16_0 == "finish" then
				if arg_15_0._stickController.enabled then
					var_15_8:SetAction("normal", 0)
				else
					SetActive(arg_15_0._joystick, false)
				end
			end
		end)
	end
end

function var_0_7.InitTimer(arg_17_0)
	if arg_17_0._dataProxy:GetInitData().battleType == SYSTEM_DUEL then
		arg_17_0._timerView = var_0_0.Battle.BattleTimerView.New(arg_17_0._ui._tf:Find("DuelTimer"))
	else
		arg_17_0._timerView = var_0_0.Battle.BattleTimerView.New(arg_17_0._ui._tf:Find("Timer"))
	end
end

function var_0_7.InitEnemyHpBar(arg_18_0)
	arg_18_0._enemyHpBar = var_0_0.Battle.BattleEnmeyHpBarView.New(arg_18_0._ui._tf:Find("EnemyHPBar"))
end

function var_0_7.InitAirStrikeIcon(arg_19_0)
	arg_19_0._airStrikeView = var_0_0.Battle.BattleAirStrikeIconView.New(arg_19_0._ui._tf:Find("AirFighterContainer/AirStrikeIcon"))
	arg_19_0._airSupportTF = arg_19_0._ui._tf:Find("AirSupportLabel")
end

function var_0_7.InitCommonWarning(arg_20_0)
	arg_20_0._warningView = var_0_0.Battle.BattleCommonWarningView.New(arg_20_0._ui._tf:Find("WarningView"))
	arg_20_0._updateViewList[arg_20_0._warningView] = true
end

function var_0_7.InitScoreBar(arg_21_0)
	arg_21_0._scoreBarView = var_0_0.Battle.BattleScoreBarView.New(arg_21_0._ui._tf:Find("DodgemCountBar"))
end

function var_0_7.InitAirFightScoreBar(arg_22_0)
	arg_22_0._scoreBarView = var_0_0.Battle.BattleScoreBarView.New(arg_22_0._ui._tf:Find("AirFightCountBar"))
end

function var_0_7.InitAutoBtn(arg_23_0)
	arg_23_0._autoBtn = arg_23_0._ui._tf:Find("AutoBtn")

	local var_23_0 = var_0_5.AUTO_DEFAULT_PREFERENCE
	local var_23_1 = PlayerPrefs.GetFloat("auto_scale", var_23_0.scale)
	local var_23_2 = PlayerPrefs.GetFloat("auto_anchorX", var_23_0.x)
	local var_23_3 = PlayerPrefs.GetFloat("auto_anchorY", var_23_0.y)

	arg_23_0._autoBtn.localScale = Vector3(var_23_1, var_23_1, 1)
	arg_23_0._autoBtn.anchorMin = Vector2(var_23_2, var_23_3)
	arg_23_0._autoBtn.anchorMax = Vector2(var_23_2, var_23_3)
end

function var_0_7.InitDuelRateBar(arg_24_0)
	arg_24_0._duelRateBar = var_0_0.Battle.BattleDuelDamageRateView.New(arg_24_0._ui._tf:Find("DuelDamageRate"))

	return arg_24_0._duelRateBar
end

function var_0_7.InitSimulationBuffCounting(arg_25_0)
	arg_25_0._simulationBuffCountView = var_0_0.Battle.BattleSimulationBuffCountView.New(arg_25_0._ui._tf:Find("SimulationWarning"))

	return arg_25_0._simulationBuffCountView
end

function var_0_7.InitMainDamagedView(arg_26_0)
	arg_26_0._mainDamagedView = var_0_0.Battle.BattleMainDamagedView.New(arg_26_0._ui._tf:Find("HPWarning"))
end

function var_0_7.InitInkView(arg_27_0, arg_27_1)
	arg_27_0._inkView = var_0_0.Battle.BattleInkView.New(arg_27_0._ui._tf:Find("InkContainer"))

	arg_27_1:RegisterEventListener(arg_27_0, var_0_1.FLEET_HORIZON_UPDATE, arg_27_0.onFleetHorizonUpdate)
end

function var_0_7.InitDebugConsole(arg_28_0)
	arg_28_0._debugConsoleView = arg_28_0._debugConsoleView or var_0_0.Battle.BattleDebugConsole.New(arg_28_0._ui._tf:Find("Debug_Console"), arg_28_0._state)
end

function var_0_7.InitCameraGestureSlider(arg_29_0)
	arg_29_0._gesture = var_0_0.Battle.BattleCameraSlider.New(arg_29_0._ui._tf:Find("CameraController"))

	var_0_0.Battle.BattleCameraUtil.GetInstance():SetCameraSilder(arg_29_0._gesture)
	arg_29_0._cameraUtil:SwitchCameraPos("FOLLOW_GESTURE")
end

function var_0_7.InitAlchemistAPView(arg_30_0)
	if not arg_30_0._alchemistAP then
		local var_30_0 = var_0_0.Battle.BattleResourceManager.GetInstance():InstReisalinAPUI()

		setParent(var_30_0, arg_30_0._ui.uiCanvas, false)

		arg_30_0._alchemistAP = var_0_0.Battle.BattleReisalinAPView.New(var_30_0.transform:Find("APPanel"))
	end
end

function var_0_7.InitAlchemistManaView(arg_31_0)
	if not arg_31_0._alchemistMana then
		local var_31_0 = var_0_0.Battle.BattleResourceManager.GetInstance():InstYumiaManaUI()

		setParent(var_31_0, arg_31_0._ui.uiCanvas, false)

		arg_31_0._alchemistMana = var_0_0.Battle.BattleYumiaManaView.New(var_31_0.transform:Find("ManaPanel"))
	end
end

function var_0_7.InitGuide(arg_32_0)
	return
end

function var_0_7.InitCamera(arg_33_0)
	arg_33_0._camera = pg.UIMgr.GetInstance():GetMainCamera():GetComponent(typeof(Camera))
	arg_33_0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	arg_33_0._cameraUtil = var_0_0.Battle.BattleCameraUtil.GetInstance()

	arg_33_0._cameraUtil:RegisterEventListener(arg_33_0, var_0_1.CAMERA_FOCUS, arg_33_0.onCameraFocus)
	arg_33_0._cameraUtil:RegisterEventListener(arg_33_0, var_0_1.SHOW_PAINTING, arg_33_0.onShowPainting)
	arg_33_0._cameraUtil:RegisterEventListener(arg_33_0, var_0_1.BULLET_TIME, arg_33_0.onBulletTime)
end

function var_0_7.Update(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0._updateViewList) do
		iter_34_0:Update()
	end
end

function var_0_7.AddUIEvent(arg_35_0)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.STAGE_DATA_INIT_FINISH, arg_35_0.onStageInit)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.COMMON_DATA_INIT_FINISH, arg_35_0.onCommonInit)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.ADD_FLEET, arg_35_0.onAddFleet)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.ADD_UNIT, arg_35_0.onAddUnit)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.REMOVE_UNIT, arg_35_0.onRemoveUnit)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.HIT_ENEMY, arg_35_0.onEnemyHit)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.ADD_AIR_FIGHTER_ICON, arg_35_0.onAddAirStrike)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.REMOVE_AIR_FIGHTER_ICON, arg_35_0.onRemoveAirStrike)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.UPDATE_AIR_SUPPORT_LABEL, arg_35_0.onUpdateAirSupportLabel)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.UPDATE_HOSTILE_SUBMARINE, arg_35_0.onUpdateHostileSubmarine)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.UPDATE_ENVIRONMENT_WARNING, arg_35_0.onUpdateEnvironmentWarning)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.UPDATE_COUNT_DOWN, arg_35_0.onUpdateCountDown)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.HIDE_INTERACTABLE_BUTTONS, arg_35_0.OnHideButtons)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.ADD_UI_FX, arg_35_0.OnAddUIFX)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.EDIT_CUSTOM_WARNING_LABEL, arg_35_0.onEditCustomWarning)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_1.GRIDMAN_SKILL_FLOAT, arg_35_0.onGridmanSkillFloat)
	arg_35_0._dataProxy:RegisterEventListener(arg_35_0, var_0_6.CARD_PUZZLE_INIT, arg_35_0.OnCardPuzzleInit)
end

function var_0_7.RemoveUIEvent(arg_36_0)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.COMMON_DATA_INIT_FINISH)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.STAGE_DATA_INIT_FINISH)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.ADD_FLEET)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.ADD_UNIT)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.REMOVE_UNIT)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.HIT_ENEMY)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.UPDATE_COUNT_DOWN)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.ADD_AIR_FIGHTER_ICON)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.REMOVE_AIR_FIGHTER_ICON)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.UPDATE_AIR_SUPPORT_LABEL)
	arg_36_0._cameraUtil:UnregisterEventListener(arg_36_0, var_0_1.SHOW_PAINTING)
	arg_36_0._cameraUtil:UnregisterEventListener(arg_36_0, var_0_1.CAMERA_FOCUS)
	arg_36_0._cameraUtil:UnregisterEventListener(arg_36_0, var_0_1.BULLET_TIME)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.ADD_SUBMARINE_WARINING)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.REMOVE_SUBMARINE_WARINING)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.UPDATE_DODGEM_SCORE)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.UPDATE_DODGEM_COMBO)
	arg_36_0._userFleet:UnregisterEventListener(arg_36_0, var_0_1.SHOW_BUFFER)
	arg_36_0._userFleet:UnregisterEventListener(arg_36_0, var_0_2.POINT_HIT_CHARGE)
	arg_36_0._userFleet:UnregisterEventListener(arg_36_0, var_0_2.POINT_HIT_CANCEL)
	arg_36_0._userFleet:UnregisterEventListener(arg_36_0, var_0_1.MANUAL_SUBMARINE_SHIFT)
	arg_36_0._userFleet:UnregisterEventListener(arg_36_0, var_0_1.FLEET_BLIND)
	arg_36_0._userFleet:UnregisterEventListener(arg_36_0, var_0_1.FLEET_HORIZON_UPDATE)
	arg_36_0._userFleet:UnregisterEventListener(arg_36_0, var_0_1.UPDATE_FLEET_ATTR)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.UPDATE_HOSTILE_SUBMARINE)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.UPDATE_ENVIRONMENT_WARNING)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.HIDE_INTERACTABLE_BUTTONS)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.ADD_UI_FX)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.EDIT_CUSTOM_WARNING_LABEL)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_1.GRIDMAN_SKILL_FLOAT)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_6.CARD_PUZZLE_INIT)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_6.UPDATE_FLEET_SHIP)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_6.COMMON_BUTTON_ENABLE)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_6.LONG_PRESS_BULLET_TIME)
	arg_36_0._dataProxy:UnregisterEventListener(arg_36_0, var_0_6.SHOW_CARD_DETAIL)
end

function var_0_7.ShowSkillPainting(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_3 = arg_37_3 or 1

	local var_37_0

	if arg_37_2 then
		if arg_37_2.cutin_cover then
			var_37_0 = arg_37_2.cutin_cover
		elseif arg_37_2.cutin_cover_DAL then
			arg_37_0._ui:CutInPaintingDAL(arg_37_1:GetTemplate(), arg_37_3, arg_37_1:GetIFF(), arg_37_2)

			return
		end
	end

	arg_37_0._ui:CutInPainting(arg_37_1:GetTemplate(), arg_37_3, arg_37_1:GetIFF(), var_37_0)
end

function var_0_7.ShowSkillFloat(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	arg_38_0._ui:SkillHrzPop(arg_38_2, arg_38_1, arg_38_3)
end

function var_0_7.ShowSkillFloatCover(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	arg_39_0._ui:SkillHrzPopCover(arg_39_2, arg_39_1, arg_39_3)
end

function var_0_7.SeaSurfaceShift(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	local var_40_0 = arg_40_3 or var_0_0.Battle.BattleConfig.calcInterval

	arg_40_0._seaView:ShiftSurface(arg_40_1, arg_40_2, var_40_0, arg_40_4)
end

function var_0_7.ShowAutoBtn(arg_41_0)
	SetActive(arg_41_0._autoBtn.transform, true)

	local var_41_0 = arg_41_0:GetState():GetBattleType()

	triggerToggle(arg_41_0._autoBtn, var_0_0.Battle.BattleState.IsAutoBotActive(var_41_0))
end

function var_0_7.ShowTimer(arg_42_0)
	arg_42_0._timerView:SetActive(true)
end

function var_0_7.ShowDuelBar(arg_43_0)
	arg_43_0._duelRateBar:SetActive(true)
end

function var_0_7.ShowSimulationView(arg_44_0)
	arg_44_0._simulationBuffCountView:SetActive(true)
end

function var_0_7.ShowPauseButton(arg_45_0, arg_45_1)
	setActive(arg_45_0._ui._tf:Find("PauseBtn"), arg_45_1)
end

function var_0_7.ShowDodgemScoreBar(arg_46_0)
	arg_46_0:InitScoreBar()
	arg_46_0._dataProxy:RegisterEventListener(arg_46_0, var_0_1.UPDATE_DODGEM_SCORE, arg_46_0.onUpdateDodgemScore)
	arg_46_0._dataProxy:RegisterEventListener(arg_46_0, var_0_1.UPDATE_DODGEM_COMBO, arg_46_0.onUpdateDodgemCombo)
	arg_46_0._scoreBarView:UpdateScore(0)
	arg_46_0._scoreBarView:SetActive(true)
end

function var_0_7.ShowAirFightScoreBar(arg_47_0)
	arg_47_0:InitAirFightScoreBar()
	arg_47_0._dataProxy:RegisterEventListener(arg_47_0, var_0_1.UPDATE_DODGEM_SCORE, arg_47_0.onUpdateDodgemScore)
	arg_47_0._dataProxy:RegisterEventListener(arg_47_0, var_0_1.UPDATE_DODGEM_COMBO, arg_47_0.onUpdateDodgemCombo)
	arg_47_0._scoreBarView:UpdateScore(0)
	arg_47_0._scoreBarView:SetActive(true)
end

function var_0_7.ScaleUISpeed(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0._ui._tf:Find("AutoBtn/on"):GetComponent(typeof(Animation))

	if var_48_0 then
		var_48_0:get_Item("autobtn_toOn").speed = arg_48_1
	end

	local var_48_1 = arg_48_0._ui._tf:Find("AutoBtn/off"):GetComponent(typeof(Animation))

	if var_48_1 then
		var_48_1:get_Item("autobtn_toOff").speed = arg_48_1
	end
end

function var_0_7.onStageInit(arg_49_0, arg_49_1)
	arg_49_0:InitJoystick()
	arg_49_0:InitScene()
	arg_49_0:InitTimer()
	arg_49_0:InitEnemyHpBar()
	arg_49_0:InitAirStrikeIcon()
	arg_49_0:InitCommonWarning()
	arg_49_0:InitAutoBtn()
	arg_49_0:InitMainDamagedView()
end

function var_0_7.onEnemyHit(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1.Data

	if var_50_0:GetDiveInvisible() and not var_50_0:GetDiveDetected() then
		return
	end

	local var_50_1 = arg_50_0._enemyHpBar:GetCurrentTarget()

	if var_50_1 then
		if var_50_1 ~= var_50_0 then
			arg_50_0._enemyHpBar:SwitchTarget(var_50_0, arg_50_0._dataProxy:GetUnitList())
		end
	else
		arg_50_0._enemyHpBar:SwitchTarget(var_50_0, arg_50_0._dataProxy:GetUnitList())
	end
end

function var_0_7.onEnemyHpUpdate(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.Dispatcher

	if var_51_0 == arg_51_0._enemyHpBar:GetCurrentTarget() and (not var_51_0:GetDiveInvisible() or var_51_0:GetDiveDetected()) then
		arg_51_0._enemyHpBar:UpdateHpBar()
	end
end

function var_0_7.onPlayerMainUnitHpUpdate(arg_52_0, arg_52_1)
	if arg_52_1.Data.dHP < 0 then
		arg_52_0._mainDamagedView:Play()
	end
end

function var_0_7.onSkillFloat(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.Data
	local var_53_1 = var_53_0.coverHrzIcon
	local var_53_2 = var_53_0.commander
	local var_53_3 = var_53_0.skillName
	local var_53_4 = arg_53_1.Dispatcher

	if var_53_1 then
		arg_53_0:ShowSkillFloatCover(var_53_4, var_53_3, var_53_1)
	else
		arg_53_0:ShowSkillFloat(var_53_4, var_53_3, var_53_2)
	end
end

function var_0_7.onCommonInit(arg_54_0, arg_54_1)
	arg_54_0._skillView = var_0_0.Battle.BattleSkillView.New(arg_54_0, arg_54_1.Data)
	arg_54_0._updateViewList[arg_54_0._skillView] = true
	arg_54_0._userFleet = arg_54_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE)

	arg_54_0._userFleet:RegisterEventListener(arg_54_0, var_0_1.SHOW_BUFFER, arg_54_0.onShowBuffer)
	arg_54_0._userFleet:RegisterEventListener(arg_54_0, var_0_2.POINT_HIT_CHARGE, arg_54_0.onPointHitSight)
	arg_54_0._userFleet:RegisterEventListener(arg_54_0, var_0_2.POINT_HIT_CANCEL, arg_54_0.onPointHitSight)
	arg_54_0._userFleet:RegisterEventListener(arg_54_0, var_0_1.MANUAL_SUBMARINE_SHIFT, arg_54_0.onManualSubShift)
	arg_54_0._userFleet:RegisterEventListener(arg_54_0, var_0_1.FLEET_BLIND, arg_54_0.onFleetBlind)
	arg_54_0._userFleet:RegisterEventListener(arg_54_0, var_0_1.UPDATE_FLEET_ATTR, arg_54_0.onFleetAttrUpdate)

	arg_54_0._sightView = var_0_0.Battle.BattleOpticalSightView.New(arg_54_0._ui._tf:Find("ChargeAreaContainer"))

	arg_54_0._sightView:SetFleetVO(arg_54_0._userFleet)

	local var_54_0, var_54_1, var_54_2, var_54_3 = arg_54_0._dataProxy:GetTotalBounds()

	arg_54_0._sightView:SetAreaBound(var_54_2, var_54_3)

	local var_54_4
	local var_54_5

	if arg_54_0._dataProxy:GetInitData().ChapterBuffIDs then
		for iter_54_0, iter_54_1 in ipairs(arg_54_0._dataProxy:GetInitData().ChapterBuffIDs) do
			if iter_54_1 == 9727 then
				var_54_4 = true

				break
			end
		end
	end

	if #arg_54_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE):GetSupportUnitList() > 0 then
		var_54_5 = true
	end

	if var_54_5 and not var_54_4 then
		arg_54_0._airAdavantageTF = arg_54_0._airSupportTF:Find("player_advantage")
	elseif var_54_4 and not var_54_5 then
		arg_54_0._airAdavantageTF = arg_54_0._airSupportTF:Find("enemy_advantage")
	elseif var_54_4 and var_54_5 then
		arg_54_0._airAdavantageTF = arg_54_0._airSupportTF:Find("draw")
	end
end

function var_0_7.onAddFleet(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1.Data.fleetVO

	if PlayerPrefs.GetInt(BATTLE_EXPOSE_LINE, 1) == 1 then
		arg_55_0:SetFleetCloakLine(var_55_0)
	end
end

function var_0_7.SetFleetCloakLine(arg_56_0, arg_56_1)
	if #arg_56_1:GetCloakList() > 0 then
		local var_56_0 = arg_56_1:GetIFF()
		local var_56_1 = arg_56_1:GetFleetVisionLine()
		local var_56_2 = arg_56_1:GetFleetExposeLine()

		arg_56_0._seaView:SetExposeLine(var_56_0, var_56_1, var_56_2)
	end
end

function var_0_7.onAddUnit(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_1.Data.type
	local var_57_1 = arg_57_1.Data.unit

	if var_57_0 == var_0_3.UnitType.PLAYER_UNIT or var_57_0 == var_0_3.UnitType.ENEMY_UNIT or var_57_0 == var_0_3.UnitType.BOSS_UNIT then
		arg_57_0:registerUnitEvent(var_57_1)
	end

	if var_57_1:IsBoss() and arg_57_0._dataProxy:GetActiveBossCount() == 1 then
		arg_57_0:AddBossWarningUI()
	elseif var_57_0 == var_0_3.UnitType.ENEMY_UNIT then
		arg_57_0:registerNPCUnitEvent(var_57_1)
	elseif var_57_0 == var_0_3.UnitType.PLAYER_UNIT and var_57_1:IsMainFleetUnit() and var_57_1:GetIFF() == var_0_5.FRIENDLY_CODE then
		arg_57_0:registerPlayerMainUnitEvent(var_57_1)
	end

	local var_57_2 = var_57_1:GetTemplate().nationality

	if table.contains(var_0_5.ALCHEMIST_AP_UI, var_57_2) and var_57_1:GetIFF() == var_0_5.FRIENDLY_CODE then
		arg_57_0:InitAlchemistAPView()
	end

	if table.contains(var_0_5.YUMIA_MANA_UI, var_57_2) and var_57_1:GetIFF() == var_0_5.FRIENDLY_CODE then
		arg_57_0:InitAlchemistManaView()
	end
end

function var_0_7.onSubmarineDetected(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_1.Dispatcher

	if arg_58_0._enemyHpBar:GetCurrentTarget() and arg_58_0._enemyHpBar:GetCurrentTarget() == var_58_0 and var_58_0:GetDiveDetected() == false then
		arg_58_0._enemyHpBar:RemoveUnit()
	end
end

function var_0_7.onRemoveUnit(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_1.Data.unit
	local var_59_1 = arg_59_1.Data.type

	if var_59_1 == var_0_3.UnitType.PLAYER_UNIT or var_59_1 == var_0_3.UnitType.ENEMY_UNIT or var_59_1 == var_0_3.UnitType.BOSS_UNIT then
		arg_59_0:unregisterUnitEvent(var_59_0)
	end

	if var_59_1 == var_0_3.UnitType.ENEMY_UNIT and not var_59_0:IsBoss() then
		arg_59_0:unregisterNPCUnitEvent(var_59_0)
	elseif var_59_0:GetIFF() == var_0_5.FRIENDLY_CODE and var_59_0:IsMainFleetUnit() then
		arg_59_0:unregisterPlayerMainUnitEvent(var_59_0)
	end

	if arg_59_1.Data.deadReason == var_0_3.UnitDeathReason.LEAVE and arg_59_0._enemyHpBar:GetCurrentTarget() and arg_59_0._enemyHpBar:GetCurrentTarget() == arg_59_1.Data.unit then
		arg_59_0._enemyHpBar:RemoveUnit(arg_59_1.Data.deadReason)
	end
end

function var_0_7.onUpdateCountDown(arg_60_0, arg_60_1)
	arg_60_0._timerView:SetCountDownText(arg_60_0._dataProxy:GetCountDown())
end

function var_0_7.onUpdateDodgemScore(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1.Data.totalScore

	arg_61_0._scoreBarView:UpdateScore(var_61_0)
end

function var_0_7.onUpdateDodgemCombo(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_1.Data.combo

	arg_62_0._scoreBarView:UpdateCombo(var_62_0)
end

function var_0_7.onAddAirStrike(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_1.Data.index
	local var_63_1 = arg_63_0._dataProxy:GetAirFighterInfo(var_63_0)

	arg_63_0._airStrikeView:AppendIcon(var_63_0, var_63_1)
end

function var_0_7.onRemoveAirStrike(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_1.Data.index
	local var_64_1 = arg_64_0._dataProxy:GetAirFighterInfo(var_64_0)

	arg_64_0._airStrikeView:RemoveIcon(var_64_0, var_64_1)
end

function var_0_7.onUpdateAirSupportLabel(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0._dataProxy:GetAirFighterList()
	local var_65_1 = 0

	for iter_65_0, iter_65_1 in ipairs(var_65_0) do
		var_65_1 = var_65_1 + iter_65_1.totalNumber
	end

	if var_65_1 == 0 or arg_65_0._warningView:GetCount() > 0 then
		eachChild(arg_65_0._airSupportTF, function(arg_66_0)
			setActive(arg_66_0, false)
		end)
	elseif arg_65_0._airAdavantageTF then
		setActive(arg_65_0._airAdavantageTF, true)
	end
end

function var_0_7.onUpdateHostileSubmarine(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_0._dataProxy:GetEnemySubmarineCount()

	arg_67_0._warningView:UpdateHostileSubmarineCount(var_67_0)
	arg_67_0:onUpdateAirSupportLabel()
end

function var_0_7.onUpdateEnvironmentWarning(arg_68_0, arg_68_1)
	if arg_68_1.Data.isActive then
		arg_68_0._warningView:ActiveWarning(arg_68_0._warningView.WARNING_TYPE_ARTILLERY)
	else
		arg_68_0._warningView:DeactiveWarning(arg_68_0._warningView.WARNING_TYPE_ARTILLERY)
	end
end

function var_0_7.onCameraFocus(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_1.Data

	if var_69_0.unit ~= nil then
		local var_69_1 = var_69_0.skill or false

		arg_69_0:EnableComponent(false)
		arg_69_0:EnableSkillFloat(var_69_1)
	else
		local var_69_2 = var_69_0.duration + var_69_0.extraBulletTime

		LeanTween.delayedCall(arg_69_0._ui._go, var_69_2, System.Action(function()
			arg_69_0:EnableComponent(true)
			arg_69_0:EnableSkillFloat(true)
		end))
	end
end

function var_0_7.onShowPainting(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_1.Data

	arg_71_0:ShowSkillPainting(var_71_0.caster, var_71_0.skill, var_71_0.speed)
end

function var_0_7.onBulletTime(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1.Data
	local var_72_1 = var_72_0.key
	local var_72_2 = var_72_0.rate

	if var_72_2 then
		var_0_4.AppendMapFactor(var_72_1, var_72_2)
	else
		var_0_4.RemoveMapFactor(var_72_1)
	end

	arg_72_0._seaView:UpdateSpeedScaler()
end

function var_0_7.onShowBuffer(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_1.Data.dist

	arg_73_0._seaView:UpdateBufferAlpha(var_73_0)
end

function var_0_7.onManualSubShift(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_1.Data.state

	arg_74_0._skillView:ShiftSubmarineManualButton(var_74_0)
end

function var_0_7.onPointHitSight(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_1.ID

	if var_75_0 == var_0_2.POINT_HIT_CHARGE then
		arg_75_0._sightView:SetActive(true)

		arg_75_0._updateViewList[arg_75_0._sightView] = true
	elseif var_75_0 == var_0_2.POINT_HIT_CANCEL then
		arg_75_0._sightView:SetActive(false)

		arg_75_0._updateViewList[arg_75_0._sightView] = nil
	end
end

function var_0_7.onFleetBlind(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_1.Data.isBlind
	local var_76_1 = arg_76_1.Dispatcher

	if not arg_76_0._inkView then
		arg_76_0:InitInkView(var_76_1)
	end

	if var_76_0 then
		local var_76_2 = var_76_1:GetUnitList()

		arg_76_0._inkView:SetActive(true, var_76_2)
		arg_76_0._skillView:HideSkillButton(true)

		arg_76_0._updateViewList[arg_76_0._inkView] = true
	else
		arg_76_0._inkView:SetActive(false)
		arg_76_0._skillView:HideSkillButton(false)

		arg_76_0._updateViewList[arg_76_0._inkView] = nil
	end
end

function var_0_7.onFleetHorizonUpdate(arg_77_0, arg_77_1)
	if not arg_77_0._inkView then
		return
	end

	local var_77_0 = arg_77_1.Dispatcher:GetUnitList()

	arg_77_0._inkView:UpdateHollow(var_77_0)
end

function var_0_7.onFleetAttrUpdate(arg_78_0, arg_78_1)
	if arg_78_0._alchemistAP and arg_78_1.Data.attr == arg_78_0._alchemistAP:GetAttrName() then
		arg_78_0._alchemistAP:UpdateAP(arg_78_1.Data.value)
	end

	if arg_78_0._alchemistMana and arg_78_1.Data.attr == arg_78_0._alchemistMana:GetAttrName() then
		arg_78_0._alchemistMana:UpdateMana(arg_78_1.Data.value)
	end
end

function var_0_7.OnAddUIFX(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_1.Data.FXID
	local var_79_1 = arg_79_1.Data.position
	local var_79_2 = arg_79_1.Data.localScale
	local var_79_3 = arg_79_1.Data.orderDiff

	arg_79_0:AddUIFX(var_79_3, var_79_0, var_79_1, var_79_2)
end

function var_0_7.AddUIFX(arg_80_0, arg_80_1, arg_80_2, arg_80_3, arg_80_4)
	local var_80_0 = arg_80_0._fxPool:GetFX(arg_80_2)

	arg_80_1 = arg_80_1 or 1

	local var_80_1

	var_80_1 = arg_80_1 > 0

	local var_80_2 = arg_80_0._ui:AddUIFX(var_80_0, arg_80_1)

	arg_80_4 = arg_80_4 or 1
	var_80_0.transform.localScale = Vector3(arg_80_4 / var_80_2.x, arg_80_4 / var_80_2.y, arg_80_4 / var_80_2.z)

	pg.EffectMgr.GetInstance():PlayBattleEffect(var_80_0, arg_80_3, true)
end

function var_0_7.AddBossWarningUI(arg_81_0)
	arg_81_0._dataProxy:BlockManualCast(true)

	local var_81_0 = var_0_0.Battle.BattleResourceManager.GetInstance()

	arg_81_0._appearEffect = var_81_0:InstBossWarningUI()

	local var_81_1 = arg_81_0._appearEffect:GetComponent(typeof(Animator))
	local var_81_2 = {
		Pause = function()
			var_81_1.speed = 0
		end,
		Resume = function()
			var_81_1.speed = 1
		end
	}

	arg_81_0._state:SetTakeoverProcess(var_81_2)

	var_81_1.speed = 1 / arg_81_0._state:GetTimeScaleRate()

	setParent(arg_81_0._appearEffect, arg_81_0._ui.uiCanvas, false)
	arg_81_0._appearEffect:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_84_0)
		arg_81_0._userFleet:CoupleEncourage()
		arg_81_0._dataProxy:BlockManualCast(false)
		arg_81_0._state:ClearTakeoverProcess()
		var_81_0:DestroyOb(arg_81_0._appearEffect)

		arg_81_0._appearEffect = nil
	end)
	SetActive(arg_81_0._appearEffect, true)
end

function var_0_7.OnHideButtons(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_1.Data.isActive

	arg_85_0._skillView:HideSkillButton(not var_85_0)
	SetActive(arg_85_0._autoBtn.transform, var_85_0)
end

function var_0_7.onEditCustomWarning(arg_86_0, arg_86_1)
	local var_86_0 = arg_86_1.Data.labelData

	arg_86_0._warningView:EditCustomWarning(var_86_0)
end

function var_0_7.onGridmanSkillFloat(arg_87_0, arg_87_1)
	if not arg_87_0._gridmanSkillFloat then
		local var_87_0 = var_0_0.Battle.BattleResourceManager.GetInstance():InstGridmanSkillUI()

		arg_87_0._gridmanSkillFloat = var_0_0.Battle.BattleGridmanSkillFloatView.New(var_87_0)

		setParent(var_87_0, arg_87_0._ui.uiCanvas, false)
	end

	local var_87_1 = arg_87_1.Data
	local var_87_2 = var_87_1.type
	local var_87_3 = var_87_1.IFF

	if var_87_2 == 5 then
		arg_87_0._gridmanSkillFloat:DoFusionFloat(var_87_3)
	else
		arg_87_0._gridmanSkillFloat:DoSkillFloat(var_87_2, var_87_3)
	end
end

function var_0_7.registerUnitEvent(arg_88_0, arg_88_1)
	arg_88_1:RegisterEventListener(arg_88_0, var_0_2.SKILL_FLOAT, arg_88_0.onSkillFloat)
	arg_88_1:RegisterEventListener(arg_88_0, var_0_2.CUT_INT, arg_88_0.onShowPainting)
end

function var_0_7.registerNPCUnitEvent(arg_89_0, arg_89_1)
	arg_89_1:RegisterEventListener(arg_89_0, var_0_2.UPDATE_HP, arg_89_0.onEnemyHpUpdate)

	local var_89_0 = arg_89_1:GetTemplate().type

	if table.contains(ShipType.SubShipType, var_89_0) then
		arg_89_1:RegisterEventListener(arg_89_0, var_0_2.SUBMARINE_DETECTED, arg_89_0.onSubmarineDetected)
	end
end

function var_0_7.registerPlayerMainUnitEvent(arg_90_0, arg_90_1)
	arg_90_1:RegisterEventListener(arg_90_0, var_0_2.UPDATE_HP, arg_90_0.onPlayerMainUnitHpUpdate)
end

function var_0_7.unregisterUnitEvent(arg_91_0, arg_91_1)
	arg_91_1:UnregisterEventListener(arg_91_0, var_0_2.SKILL_FLOAT)
	arg_91_1:UnregisterEventListener(arg_91_0, var_0_2.CUT_INT)
end

function var_0_7.unregisterNPCUnitEvent(arg_92_0, arg_92_1)
	arg_92_1:UnregisterEventListener(arg_92_0, var_0_2.SKILL_FLOAT)
	arg_92_1:UnregisterEventListener(arg_92_0, var_0_2.CUT_INT)
	arg_92_1:UnregisterEventListener(arg_92_0, var_0_2.UPDATE_HP)

	local var_92_0 = arg_92_1:GetTemplate().type

	if table.contains(ShipType.SubShipType, var_92_0) then
		arg_92_1:UnregisterEventListener(arg_92_0, var_0_2.SUBMARINE_DETECTED)
	end
end

function var_0_7.unregisterPlayerMainUnitEvent(arg_93_0, arg_93_1)
	arg_93_1:UnregisterEventListener(arg_93_0, var_0_2.UPDATE_HP)
end

function var_0_7.Dispose(arg_94_0)
	LeanTween.cancel(arg_94_0._ui._go)
	arg_94_0._uiMGR:ClearStick()

	arg_94_0._uiMGR = nil

	if arg_94_0._appearEffect then
		Destroy(arg_94_0._appearEffect)
	end

	arg_94_0:RemoveUIEvent()

	arg_94_0._updateViewList = nil

	arg_94_0._timerView:Dispose()
	arg_94_0._enemyHpBar:Dispose()
	arg_94_0._skillView:Dispose()
	arg_94_0._seaView:Dispose()
	arg_94_0._airStrikeView:Dispose()
	arg_94_0._sightView:Dispose()
	arg_94_0._mainDamagedView:Dispose()
	arg_94_0._warningView:Dispose()

	arg_94_0._seaView = nil
	arg_94_0._enemyHpBar = nil
	arg_94_0._skillView = nil
	arg_94_0._timerView = nil
	arg_94_0._joystick = nil
	arg_94_0._airStrikeView = nil
	arg_94_0._warningView = nil
	arg_94_0._mainDamagedView = nil

	if arg_94_0._duelRateBar then
		arg_94_0._duelRateBar:Dispose()

		arg_94_0._duelRateBar = nil
	end

	if arg_94_0._simulationBuffCountView then
		arg_94_0._simulationBuffCountView:Dispose()

		arg_94_0._simulationBuffCountView = nil
	end

	if arg_94_0._jammingView then
		arg_94_0._jammingView:Dispose()

		arg_94_0._jammingView = nil
	end

	if arg_94_0._inkView then
		arg_94_0._inkView:Dispose()

		arg_94_0._inkView = nil
	end

	if arg_94_0._alchemistAP then
		arg_94_0._alchemistAP:Dispose()

		arg_94_0._alchemistAP = nil
	end

	if arg_94_0._alchemistMana then
		arg_94_0._alchemistMana:Dispose()

		arg_94_0._alchemistMana = nil
	end

	if arg_94_0._gridmanSkillFloat then
		arg_94_0._gridmanSkillFloat:Dispose()
	end

	if go(arg_94_0._ui._tf:Find("CardPuzzleConsole")).activeSelf then
		arg_94_0:DisposeCardPuzzleComponent()
	end

	var_0_7.super.Dispose(arg_94_0)
end

function var_0_7.OnCardPuzzleInit(arg_95_0, arg_95_1)
	arg_95_0._cardPuzzleComponent = arg_95_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE):GetCardPuzzleComponent()

	arg_95_0:ShowCardPuzzleComponent()
	arg_95_0:RegisterCardPuzzleEvent()
end

function var_0_7.RegisterCardPuzzleEvent(arg_96_0)
	arg_96_0._cardPuzzleComponent:RegisterEventListener(arg_96_0, var_0_6.UPDATE_FLEET_SHIP, arg_96_0.onUpdateFleetShip)
	arg_96_0._cardPuzzleComponent:RegisterEventListener(arg_96_0, var_0_6.COMMON_BUTTON_ENABLE, arg_96_0.onBlockCommonButton)
	arg_96_0._cardPuzzleComponent:RegisterEventListener(arg_96_0, var_0_6.LONG_PRESS_BULLET_TIME, arg_96_0.onLongPressBulletTime)
	arg_96_0._cardPuzzleComponent:RegisterEventListener(arg_96_0, var_0_6.SHOW_CARD_DETAIL, arg_96_0.onShowCardDetail)
end

function var_0_7.ShowCardPuzzleComponent(arg_97_0)
	setActive(arg_97_0._ui._tf:Find("CardPuzzleConsole"), true)
	arg_97_0:InitCardPuzzleCommonHPBar()
	arg_97_0:InitCardPuzzleEnergyBar()
	arg_97_0:IntCardPuzzleFleetHead()
	arg_97_0:InitCameraCardBoardClicker()
	arg_97_0:InitCardPuzzleMovePile()
	arg_97_0:InitCardPuzzleDeckPile()
	arg_97_0:InitCardPuzzleIconList()
	arg_97_0:InitCardPuzzleHandBoard()
	arg_97_0:InitCardPuzzleCardDetail()
	arg_97_0:InitCardPuzzleGoalRemind()
end

function var_0_7.InitCardPuzzleCommonHPBar(arg_98_0)
	arg_98_0._cardPuzzleHPBar = var_0_0.Battle.CardPuzzleCommonHPBar.New(arg_98_0._ui._tf:Find("CardPuzzleConsole/commonHP"))

	arg_98_0._cardPuzzleHPBar:SetCardPuzzleComponent(arg_98_0._cardPuzzleComponent)

	arg_98_0._updateViewList[arg_98_0._cardPuzzleHPBar] = true
end

function var_0_7.InitCardPuzzleEnergyBar(arg_99_0)
	arg_99_0._cardPuzzleEnergyBar = var_0_0.Battle.CardPuzzleEnergyBar.New(arg_99_0._ui._tf:Find("CardPuzzleConsole/energy_block"))

	arg_99_0._cardPuzzleEnergyBar:SetCardPuzzleComponent(arg_99_0._cardPuzzleComponent)

	arg_99_0._updateViewList[arg_99_0._cardPuzzleEnergyBar] = true
end

function var_0_7.InitCameraCardBoardClicker(arg_100_0)
	arg_100_0._cardPuzzleBoardClicker = var_0_0.Battle.CardPuzzleBoardClicker.New(arg_100_0._ui._tf:Find("CardBoardController"))

	arg_100_0._cardPuzzleBoardClicker:SetCardPuzzleComponent(arg_100_0._cardPuzzleComponent)
end

function var_0_7.IntCardPuzzleFleetHead(arg_101_0)
	arg_101_0._cardPuzzleFleetHead = var_0_0.Battle.CardPuzzleFleetHead.New(arg_101_0._ui._tf:Find("CardPuzzleConsole/fleet"))

	arg_101_0._cardPuzzleFleetHead:SetCardPuzzleComponent(arg_101_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleMovePile(arg_102_0)
	arg_102_0._cardPuzzleMovePile = var_0_0.Battle.CardPuzzleMovePile.New(arg_102_0._ui._tf:Find("CardPuzzleConsole/movedeck"))

	arg_102_0._cardPuzzleMovePile:SetCardPuzzleComponent(arg_102_0._cardPuzzleComponent)

	arg_102_0._updateViewList[arg_102_0._cardPuzzleMovePile] = true
end

function var_0_7.InitCardPuzzleDeckPile(arg_103_0)
	arg_103_0._cardPuzzleDeckPile = var_0_0.Battle.CardPuzzleDeckPool.New(arg_103_0._ui._tf:Find("CardPuzzleConsole/deck"))

	arg_103_0._cardPuzzleDeckPile:SetCardPuzzleComponent(arg_103_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleIconList(arg_104_0)
	arg_104_0._cardPuzzleStatusIcon = var_0_0.Battle.CardPuzzleFleetIconList.New(arg_104_0._ui._tf:Find("CardPuzzleConsole/statusIcon"))

	arg_104_0._cardPuzzleStatusIcon:SetCardPuzzleComponent(arg_104_0._cardPuzzleComponent)

	arg_104_0._updateViewList[arg_104_0._cardPuzzleStatusIcon] = true
end

function var_0_7.InitCardPuzzleHandBoard(arg_105_0)
	arg_105_0._cardPuzzleHandBoard = var_0_0.Battle.CardPuzzleHandBoard.New(arg_105_0._ui._tf:Find("CardPuzzleConsole/cardboard"), arg_105_0._ui._tf:Find("CardPuzzleConsole/hand"))

	arg_105_0._cardPuzzleHandBoard:SetCardPuzzleComponent(arg_105_0._cardPuzzleComponent)

	arg_105_0._updateViewList[arg_105_0._cardPuzzleHandBoard] = true
end

function var_0_7.InitCardPuzzleGoalRemind(arg_106_0)
	arg_106_0._cardPuzzleGoalRemind = var_0_0.Battle.CardPuzzleGoalRemind.New(arg_106_0._ui._tf:Find("CardPuzzleConsole/goal"))

	arg_106_0._cardPuzzleGoalRemind:SetCardPuzzleComponent(arg_106_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleCardDetail(arg_107_0)
	arg_107_0._cardPuzzleCardDetail = var_0_0.Battle.CardPuzzleCardDetail.New(arg_107_0._ui._tf:Find("CardPuzzleConsole/cardDetail"))
end

function var_0_7.DisposeCardPuzzleComponent(arg_108_0)
	arg_108_0._cardPuzzleHPBar:Dispose()
	arg_108_0._cardPuzzleEnergyBar:Dispose()
	arg_108_0._cardPuzzleBoardClicker:Dispose()
	arg_108_0._cardPuzzleFleetHead:Dispose()
	arg_108_0._cardPuzzleMovePile:Dispose()
	arg_108_0._cardPuzzleDeckPile:Dispose()
	arg_108_0._cardPuzzleStatusIcon:Dispose()
	arg_108_0._cardPuzzleHandBoard:Dispose()
	arg_108_0._cardPuzzleGoalRemind:Dispose()
	arg_108_0._cardPuzzleCardDetail:Dispose()
end

function var_0_7.onUpdateFleetBuff(arg_109_0)
	return
end

function var_0_7.onUpdateFleetShip(arg_110_0, arg_110_1)
	arg_110_0._cardPuzzleFleetHead:UpdateShipIcon(arg_110_1.Data.teamType)
end

function var_0_7.onBlockCommonButton(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_1.Data.flag

	arg_111_0:EnableComponent(var_111_0)
end

function var_0_7.onLongPressBulletTime(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_1.Data.timeScale

	arg_112_0._state:ScaleTimer(var_112_0)
end

function var_0_7.onShowCardDetail(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_1.Data.card

	if var_113_0 then
		arg_113_0._cardPuzzleCardDetail:Active(true)
		arg_113_0._cardPuzzleCardDetail:SetReferenceCard(var_113_0)
	else
		arg_113_0._cardPuzzleCardDetail:Active(false)
	end
end
