local var_0_0 = class("BattleScene", import("..base.BaseUI"))

var_0_0.IN_VIEW_FRIEND_SKILL_OFFSET = Vector3(-5, 0, 6)
var_0_0.IN_VIEW_FOE_SKILL_OFFSET = Vector3(-15, 0, 6)
var_0_0.FOE_SIDE_X_OFFSET = 250
var_0_0.SKILL_FLOAT_SCALE = Vector3(1.5, 1.5, 0)
var_0_0.SIDE_ALIGNMENT = {
	{
		-120,
		-7.5,
		-232.5
	},
	{
		105,
		217.5,
		330
	},
	{
		-345,
		-457.5,
		-570
	}
}

local var_0_1

function var_0_0.getUIName(arg_1_0)
	return "CombatUI" .. ys.Battle.BattleState.GetCombatSkinKey()
end

function var_0_0.getBGM(arg_2_0)
	local var_2_0 = {}

	table.insert(var_2_0, arg_2_0.contextData.system == SYSTEM_WORLD and checkExist(pg.world_expedition_data[arg_2_0.contextData.stageId], {
		"bgm"
	}) or "")
	table.insert(var_2_0, pg.expedition_data_template[arg_2_0.contextData.stageId].bgm)

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		if iter_2_1 ~= "" then
			return iter_2_1
		end
	end

	return var_0_0.super.getBGM(arg_2_0)
end

function var_0_0.init(arg_3_0)
	var_0_1 = ys.Battle.BattleVariable

	local var_3_0 = pg.UIMgr.GetInstance():GetMainCamera()
	local var_3_1 = GameObject.Find("UICamera")

	arg_3_0.uiCanvas = findTF(var_3_1, "Canvas/UIMain")
	arg_3_0.skillTips = arg_3_0:findTF("Skill_Activation")
	arg_3_0.skillRoot = arg_3_0:findTF("Skill_Activation/Root")
	arg_3_0.skillTpl = arg_3_0:findTF("Skill_Activation/mask").gameObject
	arg_3_0._skillFloatPool = pg.Pool.New(arg_3_0.skillRoot, arg_3_0.skillTpl, 15, 10, true, false):InitSize()

	arg_3_0._skillFloatPool:SetRecycleFuncs(function(arg_4_0)
		arg_4_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)

	arg_3_0.skillCMDRoot = arg_3_0:findTF("Skill_Activation/Root_cmd")
	arg_3_0.skillCMDTpl = arg_3_0:findTF("Skill_Activation/mask_cmd").gameObject
	arg_3_0._skillFloatCMDPool = pg.Pool.New(arg_3_0.skillCMDRoot, arg_3_0.skillCMDTpl, 2, 4, true, false):InitSize()

	arg_3_0._skillFloatCMDPool:SetRecycleFuncs(function(arg_5_0)
		arg_5_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)

	arg_3_0.popupTpl = arg_3_0:getTpl("popup")

	SetActive(arg_3_0._go, false)

	arg_3_0._skillPaintings = {}
	arg_3_0._skillFloat = true
	arg_3_0._cacheSkill = {}
	arg_3_0._commanderSkillList = {}
	arg_3_0._sideSkillFloatStateList = {}
	arg_3_0._sideSkillFloatStateList[ys.Battle.BattleConfig.FRIENDLY_CODE] = {
		{},
		{},
		{}
	}
	arg_3_0._sideSkillFloatStateList[ys.Battle.BattleConfig.FOE_CODE] = {
		{},
		{},
		{}
	}

	arg_3_0:initPainting()

	arg_3_0._fxContainerUpper = arg_3_0._tf:Find("FXContainerUpper")
	arg_3_0._fxContainerBottom = arg_3_0._tf:Find("FXContainerBottom")

	local var_3_2 = arg_3_0._tf:GetComponentInParent(typeof(UnityEngine.Canvas))

	arg_3_0._canvasOrder = var_3_2 and var_3_2.sortingOrder or 0
	arg_3_0._ratioFitter = GetComponent(arg_3_0._tf, typeof(AspectRatioFitter))
end

function var_0_0.initPainting(arg_6_0)
	local var_6_0 = ys.Battle.BattleResourceManager.GetInstance():InstSkillPaintingUI()

	setParent(var_6_0, arg_6_0.uiCanvas, false)

	arg_6_0._paintingUI = var_6_0
	arg_6_0._paintingAnimator = var_6_0:GetComponent(typeof(Animator))
	arg_6_0._paintingAnimator.enabled = false
	arg_6_0._paintingParticleContainer = findTF(var_6_0, "particleContainer")
	arg_6_0._paintingParticles = findTF(arg_6_0._paintingParticleContainer, "effect")
	arg_6_0._paintingParticleSystem = arg_6_0._paintingParticles:GetComponent(typeof(ParticleSystem))

	arg_6_0._paintingParticleSystem:Stop(true)

	arg_6_0._paintingFitter = findTF(var_6_0, "hero/fitter")

	removeAllChildren(arg_6_0._paintingFitter)

	local var_6_1 = GetOrAddComponent(arg_6_0._paintingFitter, "PaintingScaler")

	var_6_1.FrameName = "lihuisha"
	var_6_1.Tween = 1

	var_6_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_7_0)
		if arg_6_0._currentPainting then
			setActive(arg_6_0._currentPainting, false)

			arg_6_0._currentPainting = nil
		end
	end)
end

function var_0_0.EnableSkillFloat(arg_8_0, arg_8_1)
	if arg_8_1 == arg_8_0._skillFloat then
		return
	end

	arg_8_0._skillFloat = arg_8_1

	if arg_8_0._skillFloat then
		for iter_8_0, iter_8_1 in ipairs(arg_8_0._cacheSkill) do
			arg_8_0:SkillHrzPop(iter_8_1.skillName, iter_8_1.caster, iter_8_1.commander, iter_8_1.hrzIcon)
		end

		arg_8_0._cacheSkill = {}
	else
		arg_8_0._skillFloatPool:AllRecycle()
		arg_8_0._skillFloatCMDPool:AllRecycle()

		arg_8_0._preCommanderSkillTF = nil
		arg_8_0._preSkillTF = nil
	end

	SetActive(arg_8_0.skillTips, arg_8_1)
end

function var_0_0.SkillHrzPop(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	if not arg_9_0._skillFloat then
		table.insert(arg_9_0._cacheSkill, {
			skillName = arg_9_1,
			caster = arg_9_2,
			commander = arg_9_3,
			hrzIcon = arg_9_4
		})

		return
	end

	local var_9_0 = ys.Battle.BattleResourceManager.GetInstance()
	local var_9_1
	local var_9_2

	if arg_9_3 then
		if arg_9_0._commanderSkillList[arg_9_3] and arg_9_0._commanderSkillList[arg_9_3][arg_9_1] then
			return
		end

		var_9_1 = arg_9_0._skillFloatCMDPool

		if ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
			var_9_2 = var_9_0:GetCommanderHrzIcon(arg_9_3)
		else
			var_9_2 = var_9_0:GetCommanderIcon(arg_9_3)
		end
	else
		var_9_1 = arg_9_0._skillFloatPool

		if arg_9_2:GetUnitType() == ys.Battle.BattleConst.UnitType.PLAYER_UNIT then
			local var_9_3 = arg_9_4 or arg_9_2:GetTemplate().painting

			if ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
				var_9_2 = var_9_0:GetCharacterIcon(var_9_3)
			else
				var_9_2 = var_9_0:GetCharacterSquareIcon(var_9_3)
			end
		elseif ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
			var_9_2 = var_9_0:GetCharacterIcon(pg.enemy_data_statistics[arg_9_2:GetTemplateID()].icon)
		else
			var_9_2 = var_9_0:GetCharacterSquareIcon(pg.enemy_data_statistics[arg_9_2:GetTemplateID()].icon)
		end
	end

	local var_9_4 = var_9_1:GetObject()
	local var_9_5 = var_9_4.transform

	var_9_5.localScale = var_0_0.SKILL_FLOAT_SCALE

	setText(findTF(var_9_5, "skill/skill_name/Text"), SwitchSpecialChar(HXSet.hxLan(arg_9_1)))

	local var_9_6 = findTF(var_9_5, "skill/icon_mask/icon")
	local var_9_7 = findTF(var_9_5, "skill/skill_name")
	local var_9_8 = var_9_5:GetComponent(typeof(Animation))

	if var_9_8 then
		local var_9_9 = 1

		while var_9_8:GetClip("anim_skinui_skill_" .. var_9_9) do
			var_9_9 = var_9_9 + 1
		end

		if var_9_9 > 1 then
			var_9_8:Play("anim_skinui_skill_" .. math.random(var_9_9 - 1))
		end
	end

	var_9_6:GetComponent(typeof(Image)).sprite = var_9_2

	local var_9_10, var_9_11 = arg_9_2:GetIFF()

	if arg_9_2:GetIFF() == ys.Battle.BattleConfig.FRIENDLY_CODE then
		var_9_11 = Color.New(1, 1, 1, 1)
	else
		var_9_11 = Color.New(1, 0.33, 0.33, 1)
	end

	var_9_7:GetComponent(typeof(Image)).color = var_9_11
	findTF(var_9_5, "skill"):GetComponent(typeof(Image)).color = var_9_11

	if arg_9_3 then
		arg_9_0:commanderSkillFloat(arg_9_3, arg_9_1, var_9_4)
	else
		local var_9_12 = var_0_1.CameraPosToUICamera(arg_9_2:GetPosition():Clone())
		local var_9_13 = ys.Battle.BattleCameraUtil.GetInstance():GetCharacterArrowBarPosition(var_9_12)
		local var_9_14 = table.contains(TeamType.SubShipType, arg_9_2:GetTemplate().type)
		local var_9_15 = arg_9_2:GetMainUnitIndex()

		if var_9_13 == nil or var_9_13 == nil and var_9_14 and not arg_9_2:IsMainFleetUnit() then
			if var_9_10 == ys.Battle.BattleConfig.FRIENDLY_CODE then
				var_9_12 = var_0_1.CameraPosToUICamera(arg_9_2:GetPosition():Clone():Add(var_0_0.IN_VIEW_FRIEND_SKILL_OFFSET))
			else
				var_9_12 = var_0_1.CameraPosToUICamera(arg_9_2:GetPosition():Clone():Add(var_0_0.IN_VIEW_FOE_SKILL_OFFSET))
			end

			var_9_5.position = Vector3(var_9_12.x, var_9_12.y, -2)

			local var_9_16 = rtf(var_9_5).rect.width * 0.5
			local var_9_17 = var_9_5.anchoredPosition
			local var_9_18 = var_9_17.x

			if Screen.width * 0.5 < var_9_16 + var_9_18 then
				var_9_17.x = var_9_18 - rtf(var_9_5).rect.width
				var_9_5.anchoredPosition = var_9_17
			end

			if arg_9_0._preSkillTF then
				arg_9_0.handleSkillFloatCld(arg_9_0._preSkillTF, var_9_5)
			end

			arg_9_0._preSkillTF = var_9_5

			var_9_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_10_0)
				arg_9_0._preSkillTF = nil

				var_9_1:Recycle(var_9_4)
			end)
		else
			local var_9_19
			local var_9_20 = var_0_0.SIDE_ALIGNMENT[var_9_15]
			local var_9_21 = arg_9_0._sideSkillFloatStateList[var_9_10][var_9_15]

			for iter_9_0 = 1, #var_9_21 do
				if var_9_21[iter_9_0] then
					var_9_19 = iter_9_0

					break
				end
			end

			if var_9_19 == nil then
				var_9_19 = #var_9_21 + 1
			end

			var_9_21[var_9_19] = false
			var_9_5.position = var_9_13

			local var_9_22 = var_9_5.anchoredPosition

			var_9_22.y = var_9_20[var_9_19]

			if var_9_10 == ys.Battle.BattleConfig.FOE_CODE then
				var_9_22.x = var_0_0.FOE_SIDE_X_OFFSET
			end

			var_9_5.anchoredPosition = var_9_22

			var_9_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_11_0)
				var_9_21[var_9_19] = true

				var_9_1:Recycle(var_9_4)
			end)
		end
	end
end

function var_0_0.SkillHrzPopCover(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	arg_12_0:SkillHrzPop(arg_12_1, arg_12_2, nil, arg_12_3)
end

function var_0_0.handleSkillFloatCld(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.anchoredPosition
	local var_13_1 = arg_13_0.anchoredPosition.y

	if math.floor(math.abs(var_13_0.y - var_13_1)) <= 112.5 then
		var_13_0.y = var_13_1 + 112.5
		arg_13_1.anchoredPosition = var_13_0
	end
end

function var_0_0.handleSkillSinkCld(arg_14_0, arg_14_1)
	return
end

function var_0_0.commanderSkillFloat(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	arg_15_0._commanderSkillList[arg_15_1] = arg_15_0._commanderSkillList[arg_15_1] or {}
	arg_15_0._commanderSkillList[arg_15_1][arg_15_2] = true

	local var_15_0 = arg_15_3.transform
	local var_15_1 = var_15_0.anchoredPosition

	var_15_1.x = 0
	var_15_1.y = 0
	var_15_0.anchoredPosition = var_15_1

	if arg_15_0._preCommanderSkillTF then
		local var_15_2 = arg_15_0._preCommanderSkillTF.anchoredPosition.y

		if math.floor(math.abs(var_15_1.y - var_15_2)) <= 97.5 then
			var_15_1.y = var_15_2 - 97.5
		end
	end

	var_15_0.anchoredPosition = var_15_1
	arg_15_0._preCommanderSkillTF = var_15_0

	var_15_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_16_0)
		arg_15_0._commanderSkillList[arg_15_1][arg_15_2] = nil
		arg_15_0._preCommanderSkillTF = nil

		arg_15_0._skillFloatCMDPool:Recycle(arg_15_3)
	end)
end

function var_0_0.CutInPainting(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	if arg_17_0._currentPainting then
		arg_17_0._paintingAnimator.enabled = false

		setActive(arg_17_0._currentPainting, false)
	end

	local var_17_0 = arg_17_4 or arg_17_1.painting or arg_17_1.prefab

	if arg_17_0._skillPaintings[var_17_0] == nil then
		local var_17_1 = ys.Battle.BattleResourceManager.GetInstance():InstPainting(var_17_0)

		arg_17_0._skillPaintings[var_17_0] = var_17_1

		setParent(var_17_1, arg_17_0._paintingFitter, false)
	end

	arg_17_0._currentPainting = arg_17_0._skillPaintings[var_17_0]

	setActive(arg_17_0._currentPainting, true)
	LuaHelper.SetParticleSpeed(arg_17_0._paintingUI, arg_17_2)

	local var_17_2 = Vector3(arg_17_3, 1, 1)

	arg_17_0._paintingUI.transform.localScale = var_17_2
	arg_17_0._paintingParticleContainer.transform.localScale = var_17_2
	arg_17_0._paintingParticles.transform.localEulerAngles = Vector3(0, 90 * arg_17_3, 0)

	arg_17_0._paintingParticleSystem:Play(true)

	arg_17_0._paintingAnimator.speed = arg_17_2
	arg_17_0._paintingAnimator.enabled = true

	arg_17_0._paintingAnimator:Play("skill_painting", -1, 0)
end

function var_0_0.didEnter(arg_18_0)
	setActive(arg_18_0._tf, false)

	arg_18_0._ratioFitter.enabled = true
	arg_18_0._ratioFitter.aspectRatio = pg.CameraFixMgr.GetInstance():GetBattleUIRatio()
	arg_18_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_19_0, arg_19_1)
		arg_18_0._ratioFitter.aspectRatio = pg.CameraFixMgr.GetInstance():GetBattleUIRatio()
	end)

	local var_18_0 = ys.Battle.BattleState.GetInstance()

	var_18_0:SetBattleUI(arg_18_0)
	onButton(arg_18_0, arg_18_0:findTF("PauseBtn"), function()
		arg_18_0:emit(BattleMediator.ON_PAUSE)
	end, SFX_CONFIRM)

	arg_18_0._chatBtn = arg_18_0:findTF("chatBtn")

	local var_18_1 = arg_18_0._chatBtn:GetComponent(typeof(Animation))

	onButton(arg_18_0, arg_18_0._chatBtn, function()
		arg_18_0:emit(BattleMediator.ON_CHAT, arg_18_0:findTF("chatContainer"))

		if not var_18_1 then
			setActive(arg_18_0._chatBtn, false)
		else
			var_18_1:Play("chatbtn_out")
		end
	end)
	onToggle(arg_18_0, arg_18_0:findTF("AutoBtn"), function(arg_22_0)
		local var_22_0 = var_18_0:GetBattleType()

		arg_18_0:emit(BattleMediator.ON_AUTO, {
			isOn = not arg_22_0,
			toggle = arg_18_0:findTF("AutoBtn"),
			system = var_22_0
		})
		var_18_0:ActiveBot(ys.Battle.BattleState.IsAutoBotActive(var_22_0))

		if var_18_0:ChatUseable() then
			setActive(arg_18_0._chatBtn, true)

			if var_18_1 then
				var_18_1:Play("chatbtn_in")
			end
		elseif var_18_1 then
			var_18_1:Play("chatbtn_out")
		else
			setActive(arg_18_0._chatBtn, false)
		end
	end, SFX_PANEL, SFX_PANEL)
	onButton(arg_18_0, arg_18_0:findTF("CardPuzzleConsole/relic/bg"), function()
		local var_23_0 = var_18_0:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE):GetCardPuzzleComponent():GetRelicList()

		arg_18_0:emit(BattleMediator.ON_PUZZLE_RELIC, {
			relicList = var_23_0
		})
	end, SFX_CONFIRM)
	onButton(arg_18_0, arg_18_0:findTF("CardPuzzleConsole/deck/bg"), function()
		local var_24_0 = var_18_0:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE):GetCardPuzzleComponent()
		local var_24_1 = var_24_0:GetDeck():GetCardList()
		local var_24_2 = var_24_0:GetHand():GetCardList()

		arg_18_0:emit(BattleMediator.ON_PUZZLE_CARD, {
			card = var_24_1,
			hand = var_24_2
		})
	end, SFX_CONFIRM)
	var_18_0:ConfigBattleEndFunc(function(arg_25_0)
		arg_18_0:clear()
		arg_18_0:emit(BattleMediator.ON_BATTLE_RESULT, arg_25_0)
	end)

	local var_18_2 = ys.Battle.BattleConst.BuffEffectType
	local var_18_3 = {
		var_18_2.ON_START_GAME,
		var_18_2.ON_FLAG_SHIP,
		var_18_2.ON_CONSORT,
		var_18_2.ON_LEADER,
		var_18_2.ON_REAR,
		var_18_2.ON_SUB_LEADER,
		var_18_2.ON_SUB_CONSORT
	}
	local var_18_4 = 0

	local function var_18_5(arg_26_0)
		local var_26_0 = 0

		for iter_26_0, iter_26_1 in ipairs(arg_26_0) do
			var_26_0 = var_26_0 + ys.Battle.BattleDataFunction.GetShipSkillTriggerCount(iter_26_1, var_18_3)
		end

		return var_26_0
	end

	local var_18_6 = var_18_4 + var_18_5(arg_18_0.contextData.battleData.MainUnitList) + var_18_5(arg_18_0.contextData.battleData.VanguardUnitList) + var_18_5(arg_18_0.contextData.battleData.SubUnitList) + 4

	arg_18_0._skillFloatPool = pg.Pool.New(arg_18_0.skillRoot, arg_18_0.skillTpl, var_18_6, 10, true, false):InitSize()

	arg_18_0._skillFloatPool:SetRecycleFuncs(function(arg_27_0)
		arg_27_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)
	arg_18_0:emit(BattleMediator.ENTER)
	arg_18_0:initPauseWindow()

	if arg_18_0.contextData.prePause then
		triggerButton(arg_18_0:findTF("PauseBtn"))
	end

	setActive(arg_18_0._chatBtn, var_18_0:ChatUseable())
end

function var_0_0.onBackPressed(arg_28_0)
	if isActive(arg_28_0.pauseWindow) then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		triggerButton(arg_28_0.continueBtn)
	end
end

function var_0_0.activeBotHelp(arg_29_0, arg_29_1)
	local var_29_0 = getProxy(PlayerProxy)

	if not arg_29_1 then
		if arg_29_0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if var_29_0.botHelp then
		return
	end

	arg_29_0.autoBotHelp = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		type = MSGBOX_TYPE_HELP,
		helps = i18n("help_battle_auto"),
		custom = {
			{
				text = "text_iknow",
				sound = SFX_CANCEL
			}
		},
		onClose = function()
			arg_29_0.autoBotHelp = false
		end
	})

	var_29_0.botHelp = true
end

function var_0_0.exitBattle(arg_31_0, arg_31_1)
	if not arg_31_1 then
		arg_31_0:emit(BattleMediator.ON_QUIT_BATTLE_MANUALLY)
		arg_31_0:emit(BattleMediator.ON_BACK_PRE_SCENE)
	elseif arg_31_1 == "kick" then
		-- block empty
	end
end

function var_0_0.setChapter(arg_32_0, arg_32_1)
	arg_32_0._chapter = arg_32_1
end

function var_0_0.setFleet(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0._mainShipVOs = arg_33_1
	arg_33_0._vanShipVOs = arg_33_2
end

function var_0_0.initPauseWindow(arg_34_0)
	arg_34_0.pauseWindow = arg_34_0:findTF("Msgbox")
	arg_34_0.LeftTimeContainer = arg_34_0:findTF("window/LeftTime", arg_34_0.pauseWindow)
	arg_34_0.LeftTime = arg_34_0:findTF("window/LeftTime/Text", arg_34_0.pauseWindow)
	arg_34_0.mainTFs = {}
	arg_34_0.vanTFs = {}

	setText(arg_34_0:findTF("label", arg_34_0.LeftTimeContainer), i18n("battle_battleMediator_remainTime"))
	setText(arg_34_0:findTF("window/van/power/title", arg_34_0.pauseWindow), i18n("word_vanguard_fleet"))
	setText(arg_34_0:findTF("window/main/power/title", arg_34_0.pauseWindow), i18n("word_main_fleet"))

	local function var_34_0(arg_35_0, arg_35_1, arg_35_2)
		for iter_35_0 = 1, 3 do
			local var_35_0 = arg_35_1:Find("ship_" .. iter_35_0)

			setActive(var_35_0, arg_35_2 and iter_35_0 <= #arg_35_2)

			if arg_35_2 and iter_35_0 <= #arg_35_2 then
				updateShip(var_35_0, arg_35_2[iter_35_0])
			end

			table.insert(arg_35_0 and arg_34_0.mainTFs or arg_34_0.vanTFs, var_35_0)
		end

		if arg_35_2 then
			local var_35_1 = 0

			for iter_35_1, iter_35_2 in ipairs(arg_35_2) do
				var_35_1 = var_35_1 + iter_35_2:getShipCombatPower()
			end

			setText(arg_35_1:Find("power/value"), var_35_1)
		end
	end

	if arg_34_0._mainShipVOs then
		var_34_0(true, arg_34_0:findTF("window/main", arg_34_0.pauseWindow), arg_34_0._mainShipVOs)
		var_34_0(false, arg_34_0:findTF("window/van", arg_34_0.pauseWindow), arg_34_0._vanShipVOs)
	end

	local var_34_1 = ys.Battle.BattleState.GetInstance()
	local var_34_2 = findTF(arg_34_0.pauseWindow, "window/Chapter")
	local var_34_3 = findTF(arg_34_0.pauseWindow, "window/Chapter/Text")

	arg_34_0.continueBtn = arg_34_0:findTF("window/button_container/continue", arg_34_0.pauseWindow)
	arg_34_0.leaveBtn = arg_34_0:findTF("window/button_container/leave", arg_34_0.pauseWindow)

	setText(arg_34_0:findTF("pic", arg_34_0.continueBtn), i18n("battle_battleMediator_goOnFight"))
	setText(arg_34_0:findTF("pic", arg_34_0.leaveBtn), i18n("battle_battleMediator_existFight"))

	local var_34_4 = var_34_1:GetBattleType()

	if var_34_4 == SYSTEM_SCENARIO then
		local var_34_5 = arg_34_0._chapter:getConfigTable()

		setText(var_34_2, var_34_5.chapter_name)
		setText(var_34_3, string.split(var_34_5.name, "|")[1])
	elseif var_34_4 == SYSTEM_ROUTINE or var_34_4 == SYSTEM_DUEL or var_34_4 == SYSTEM_HP_SHARE_ACT_BOSS or var_34_4 == SYSTEM_BOSS_EXPERIMENT or var_34_4 == SYSTEM_ACT_BOSS or var_34_4 == SYSTEM_ACT_BOSS_SP or var_34_4 == SYSTEM_BOSS_RUSH or var_34_4 == SYSTEM_BOSS_RUSH_EX or var_34_4 == SYSTEM_LIMIT_CHALLENGE or var_34_4 == SYSTEM_BOSS_SINGLE or var_34_4 == SYSTEM_BOSS_SINGLE_VARIABLE then
		setText(var_34_2, "SP")

		local var_34_6 = var_34_1:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().StageTmpId
		local var_34_7 = pg.expedition_data_template[var_34_6]

		setText(var_34_3, var_34_7.name)
	elseif var_34_4 == SYSTEM_DEBUG then
		setText(var_34_2, "??")
		setText(var_34_3, "碧蓝梦境")
	elseif var_34_4 == SYSTEM_CHALLENGE then
		local var_34_8 = arg_34_0._chapter:getNextExpedition()

		setText(var_34_2, "SP")
		setText(var_34_3, var_34_8.chapter_name[2])
		setActive(arg_34_0.LeftTimeContainer, true)
	elseif var_34_4 == SYSTEM_WORLD_BOSS or var_34_4 == SYSTEM_WORLD then
		setText(var_34_2, i18n("world_battle_pause"))
		setText(var_34_3, i18n("world_battle_pause2"))

		if var_34_4 == SYSTEM_WORLD_BOSS then
			setActive(arg_34_0.leaveBtn, false)
		end
	elseif var_34_4 == SYSTEM_GUILD then
		local var_34_9 = var_34_1:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().ActID
		local var_34_10 = pg.guild_boss_event[var_34_9]

		setText(var_34_2, "BOSS")
		setText(var_34_3, var_34_10 and var_34_10.name or "")
	elseif var_34_4 == SYSTEM_TEST or var_34_4 == SYSTEM_SUB_ROUTINE or var_34_4 == SYSTEM_PERFORM or var_34_4 == SYSTEM_PROLOGUE or var_34_4 == SYSTEM_DODGEM or var_34_4 == SYSTEM_SIMULATION or var_34_4 == SYSTEM_SUBMARINE_RUN or var_34_4 == SYSTEM_BOSS_EXPERIMENT or var_34_4 == SYSTEM_REWARD_PERFORM or var_34_4 == SYSTEM_AIRFIGHT then
		-- block empty
	elseif var_34_4 == SYSTEM_CARDPUZZLE then
		-- block empty
	else
		assert(false, "System not defined " .. (var_34_4 or "NIL"))
	end

	onButton(arg_34_0, arg_34_0.leaveBtn, function()
		arg_34_0:emit(BattleMediator.ON_LEAVE)

		local var_36_0 = arg_34_0.leaveBtn:GetComponent(typeof(Animation))

		if var_36_0 and var_36_0:GetClip("msgbox_btn_blink") then
			var_36_0:Play("msgbox_btn_blink")
		end
	end)
	onButton(arg_34_0, arg_34_0.continueBtn, function()
		local var_37_0 = arg_34_0.continueBtn:GetComponent(typeof(Animation))

		if var_37_0 and var_37_0:GetClip("msgbox_btn_blink") then
			var_37_0:Play("msgbox_btn_blink")
		end

		local var_37_1 = arg_34_0.pauseWindow:GetComponent(typeof(Animation))

		if var_37_1 then
			if var_37_1:IsPlaying("msgbox_out") then
				var_37_1:Stop("msgbox_out")
				var_37_1:Play("msgbox_in")
			else
				var_37_1:Play("msgbox_out")
				arg_34_0.pauseWindow:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_38_0)
					setActive(arg_34_0.pauseWindow, false)
					pg.UIMgr.GetInstance():UnblurPanel(arg_34_0.pauseWindow, arg_34_0._tf)
					var_34_1:Resume()
				end)
			end
		else
			setActive(arg_34_0.pauseWindow, false)
			pg.UIMgr.GetInstance():UnblurPanel(arg_34_0.pauseWindow, arg_34_0._tf)
			var_34_1:Resume()
		end
	end)
	onButton(arg_34_0, arg_34_0:findTF("help", arg_34_0.pauseWindow), function()
		if BATTLE_DEBUG and PLATFORM == 7 then
			setActive(arg_34_0.pauseWindow, false)
			pg.UIMgr.GetInstance():UnblurPanel(arg_34_0.pauseWindow, arg_34_0._tf)
			var_34_1:Resume()
			var_34_1:OpenConsole()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_battle_rule")
			})
		end
	end)
	onButton(arg_34_0, arg_34_0:findTF("window/top/btnBack", arg_34_0.pauseWindow), function()
		triggerButton(arg_34_0.continueBtn)
	end)
	onButton(arg_34_0, arg_34_0.pauseWindow, function()
		triggerButton(arg_34_0.continueBtn)
	end)
	onButton(arg_34_0, arg_34_0.pauseWindow, function()
		local var_42_0 = arg_34_0.pauseWindow:GetComponent(typeof(Animation))

		if var_42_0 and var_42_0:IsPlaying("msgbox_out") then
			-- block empty
		else
			triggerButton(arg_34_0.continueBtn)
		end
	end)
	setActive(arg_34_0.pauseWindow, false)
end

function var_0_0.updatePauseWindow(arg_43_0)
	if not arg_43_0.pauseWindow then
		return
	end

	setActive(arg_43_0.pauseWindow, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_43_0.pauseWindow, nil, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	local var_43_0 = ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name)
	local var_43_1 = var_43_0:GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE)
	local var_43_2 = var_43_1:GetMainList()
	local var_43_3 = var_43_1:GetScoutList()

	local function var_43_4(arg_44_0, arg_44_1, arg_44_2)
		if not arg_44_0 then
			return
		end

		for iter_44_0 = 1, #arg_44_0 do
			local var_44_0 = arg_44_0[iter_44_0].id

			if var_43_1:GetFreezeShipByID(var_44_0) then
				local var_44_1 = var_43_1:GetFreezeShipByID(var_44_0)

				setSlider(arg_44_2[iter_44_0]:Find("blood"), 0, 1, var_44_1:GetHPRate())
				SetActive(arg_44_2[iter_44_0]:Find("mask"), false)
			elseif var_43_1:GetShipByID(var_44_0) then
				local var_44_2 = var_43_1:GetShipByID(var_44_0)

				setSlider(arg_44_2[iter_44_0]:Find("blood"), 0, 1, var_44_2:GetHPRate())
				SetActive(arg_44_2[iter_44_0]:Find("mask"), false)
			else
				setSlider(arg_44_2[iter_44_0]:Find("blood"), 0, 1, 0)
				SetActive(arg_44_2[iter_44_0]:Find("mask"), true)
			end
		end
	end

	var_43_4(arg_43_0._mainShipVOs, var_43_2, arg_43_0.mainTFs)
	var_43_4(arg_43_0._vanShipVOs, var_43_3, arg_43_0.vanTFs)
	setText(arg_43_0.LeftTime, ys.Battle.BattleTimerView.formatTime(math.floor(var_43_0:GetCountDown())))
end

function var_0_0.AddUIFX(arg_45_0, arg_45_1, arg_45_2)
	arg_45_2 = arg_45_2 or 1

	local var_45_0 = arg_45_2 > 0

	arg_45_1 = tf(arg_45_1)

	local var_45_1 = var_45_0 and arg_45_0._fxContainerUpper or arg_45_0._fxContainerBottom

	arg_45_1:SetParent(var_45_1)
	pg.ViewUtils.SetSortingOrder(arg_45_1, arg_45_0._canvasOrder + arg_45_2)
	pg.ViewUtils.SetLayer(arg_45_1, Layer.UI)

	return var_45_1.localScale
end

function var_0_0.OnCloseChat(arg_46_0)
	local var_46_0 = ys.Battle.BattleState.GetInstance():IsBotActive()
	local var_46_1 = arg_46_0._chatBtn:GetComponent(typeof(Animation))

	if var_46_0 then
		setActive(arg_46_0._chatBtn, true)

		if var_46_1 then
			var_46_1:Play("chatbtn_in")
		end
	elseif var_46_1 then
		var_46_1:Play("chatbtn_out")
	else
		setActive(arg_46_0._chatBtn, false)
	end
end

function var_0_0.clear(arg_47_0)
	arg_47_0._preSkillTF = nil

	arg_47_0._skillFloatPool:AllRecycle()
	arg_47_0._skillFloatCMDPool:AllRecycle()

	arg_47_0._preCommanderSkillTF = nil
	arg_47_0._commanderSkillList = nil
	arg_47_0._skillPaintings = nil
	arg_47_0._currentPainting = nil

	Destroy(arg_47_0._paintingUI)
end

function var_0_0.willExit(arg_48_0)
	arg_48_0._skillFloatPool:Dispose()
	arg_48_0._skillFloatCMDPool:Dispose()
	ys.Battle.BattleState.GetInstance():ExitBattle()
	pg.UIMgr.GetInstance():UnblurPanel(arg_48_0.pauseWindow, arg_48_0._tf)
	ys.Battle.BattleCameraUtil.GetInstance().ActiveMainCamera(false)
	pg.CameraFixMgr.GetInstance():disconnect(arg_48_0.camEventId)
end

return var_0_0
