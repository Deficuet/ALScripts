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

function var_0_0.forceRatio(arg_2_0)
	local var_2_0 = pg.CameraFixMgr.GetInstance().targetRatio

	return math.max(var_2_0, 1.7777777777777777)
end

function var_0_0.getBGM(arg_3_0)
	local var_3_0 = {}

	table.insert(var_3_0, arg_3_0.contextData.system == SYSTEM_WORLD and checkExist(pg.world_expedition_data[arg_3_0.contextData.stageId], {
		"bgm"
	}) or "")
	table.insert(var_3_0, pg.expedition_data_template[arg_3_0.contextData.stageId].bgm)

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if iter_3_1 ~= "" then
			return iter_3_1
		end
	end

	return var_0_0.super.getBGM(arg_3_0)
end

function var_0_0.init(arg_4_0)
	var_0_1 = ys.Battle.BattleVariable

	local var_4_0 = pg.UIMgr.GetInstance():GetMainCamera()
	local var_4_1 = GameObject.Find("UICamera")

	arg_4_0.uiCanvas = findTF(var_4_1, "Canvas/UIMain")
	arg_4_0.skillTips = arg_4_0:findTF("Skill_Activation")
	arg_4_0.skillRoot = arg_4_0:findTF("Skill_Activation/Root")
	arg_4_0.skillTpl = arg_4_0:findTF("Skill_Activation/mask").gameObject
	arg_4_0._skillFloatPool = pg.Pool.New(arg_4_0.skillRoot, arg_4_0.skillTpl, 15, 10, true, false):InitSize()

	arg_4_0._skillFloatPool:SetRecycleFuncs(function(arg_5_0)
		arg_5_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)

	arg_4_0.skillCMDRoot = arg_4_0:findTF("Skill_Activation/Root_cmd")
	arg_4_0.skillCMDTpl = arg_4_0:findTF("Skill_Activation/mask_cmd").gameObject
	arg_4_0._skillFloatCMDPool = pg.Pool.New(arg_4_0.skillCMDRoot, arg_4_0.skillCMDTpl, 2, 4, true, false):InitSize()

	arg_4_0._skillFloatCMDPool:SetRecycleFuncs(function(arg_6_0)
		arg_6_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)

	arg_4_0.popupTpl = arg_4_0:getTpl("popup")

	SetActive(arg_4_0._go, false)

	arg_4_0._skillPaintings = {}
	arg_4_0._skillFloat = true
	arg_4_0._cacheSkill = {}
	arg_4_0._commanderSkillList = {}
	arg_4_0._sideSkillFloatStateList = {}
	arg_4_0._sideSkillFloatStateList[ys.Battle.BattleConfig.FRIENDLY_CODE] = {
		{},
		{},
		{}
	}
	arg_4_0._sideSkillFloatStateList[ys.Battle.BattleConfig.FOE_CODE] = {
		{},
		{},
		{}
	}

	arg_4_0:initPainting()

	arg_4_0._fxContainerUpper = arg_4_0._tf:Find("FXContainerUpper")
	arg_4_0._fxContainerBottom = arg_4_0._tf:Find("FXContainerBottom")

	local var_4_2 = arg_4_0._tf:GetComponentInParent(typeof(UnityEngine.Canvas))

	arg_4_0._canvasOrder = var_4_2 and var_4_2.sortingOrder or 0
	arg_4_0._ratioFitter = GetComponent(arg_4_0._tf, typeof(AspectRatioFitter))
end

function var_0_0.initPainting(arg_7_0)
	local var_7_0 = ys.Battle.BattleResourceManager.GetInstance():InstSkillPaintingUI()

	setParent(var_7_0, arg_7_0.uiCanvas, false)

	arg_7_0._paintingUI = var_7_0
	arg_7_0._paintingAnimator = var_7_0:GetComponent(typeof(Animator))
	arg_7_0._paintingAnimator.enabled = false
	arg_7_0._paintingParticleContainer = findTF(var_7_0, "particleContainer")
	arg_7_0._paintingParticles = findTF(arg_7_0._paintingParticleContainer, "effect")
	arg_7_0._paintingParticleSystem = arg_7_0._paintingParticles:GetComponent(typeof(ParticleSystem))

	arg_7_0._paintingParticleSystem:Stop(true)

	arg_7_0._paintingFitter = findTF(var_7_0, "hero/fitter")

	removeAllChildren(arg_7_0._paintingFitter)

	local var_7_1 = GetOrAddComponent(arg_7_0._paintingFitter, "PaintingScaler")

	var_7_1.FrameName = "lihuisha"
	var_7_1.Tween = 1

	var_7_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_8_0)
		if arg_7_0._currentPainting then
			setActive(arg_7_0._currentPainting, false)

			arg_7_0._currentPainting = nil
		end
	end)
end

function var_0_0.EnableSkillFloat(arg_9_0, arg_9_1)
	if arg_9_1 == arg_9_0._skillFloat then
		return
	end

	arg_9_0._skillFloat = arg_9_1

	if arg_9_0._skillFloat then
		for iter_9_0, iter_9_1 in ipairs(arg_9_0._cacheSkill) do
			arg_9_0:SkillHrzPop(iter_9_1.skillName, iter_9_1.caster, iter_9_1.commander, iter_9_1.hrzIcon)
		end

		arg_9_0._cacheSkill = {}
	else
		arg_9_0._skillFloatPool:AllRecycle()
		arg_9_0._skillFloatCMDPool:AllRecycle()

		arg_9_0._preCommanderSkillTF = nil
		arg_9_0._preSkillTF = nil
	end

	SetActive(arg_9_0.skillTips, arg_9_1)
end

function var_0_0.SkillHrzPop(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	if not arg_10_0._skillFloat then
		table.insert(arg_10_0._cacheSkill, {
			skillName = arg_10_1,
			caster = arg_10_2,
			commander = arg_10_3,
			hrzIcon = arg_10_4
		})

		return
	end

	local var_10_0 = ys.Battle.BattleResourceManager.GetInstance()
	local var_10_1
	local var_10_2

	if arg_10_3 then
		if arg_10_0._commanderSkillList[arg_10_3] and arg_10_0._commanderSkillList[arg_10_3][arg_10_1] then
			return
		end

		var_10_1 = arg_10_0._skillFloatCMDPool

		if ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
			var_10_2 = var_10_0:GetCommanderHrzIcon(arg_10_3)
		else
			var_10_2 = var_10_0:GetCommanderIcon(arg_10_3)
		end
	else
		var_10_1 = arg_10_0._skillFloatPool

		if arg_10_2:GetUnitType() == ys.Battle.BattleConst.UnitType.PLAYER_UNIT then
			local var_10_3 = arg_10_4 or arg_10_2:GetTemplate().painting

			if ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
				var_10_2 = var_10_0:GetCharacterIcon(var_10_3)
			else
				var_10_2 = var_10_0:GetCharacterSquareIcon(var_10_3)
			end
		elseif ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
			var_10_2 = var_10_0:GetCharacterIcon(pg.enemy_data_statistics[arg_10_2:GetTemplateID()].icon)
		else
			var_10_2 = var_10_0:GetCharacterSquareIcon(pg.enemy_data_statistics[arg_10_2:GetTemplateID()].icon)
		end
	end

	local var_10_4 = var_10_1:GetObject()
	local var_10_5 = var_10_4.transform

	var_10_5.localScale = var_0_0.SKILL_FLOAT_SCALE

	setText(findTF(var_10_5, "skill/skill_name/Text"), SwitchSpecialChar(HXSet.hxLan(arg_10_1)))

	local var_10_6 = findTF(var_10_5, "skill/icon_mask/icon")
	local var_10_7 = findTF(var_10_5, "skill/skill_name")
	local var_10_8 = var_10_5:GetComponent(typeof(Animation))

	if var_10_8 then
		local var_10_9 = 1

		while var_10_8:GetClip("anim_skinui_skill_" .. var_10_9) do
			var_10_9 = var_10_9 + 1
		end

		if var_10_9 > 1 then
			var_10_8:Play("anim_skinui_skill_" .. math.random(var_10_9 - 1))
		end
	end

	var_10_6:GetComponent(typeof(Image)).sprite = var_10_2

	local var_10_10, var_10_11 = arg_10_2:GetIFF()

	if arg_10_2:GetIFF() == ys.Battle.BattleConfig.FRIENDLY_CODE then
		var_10_11 = Color.New(1, 1, 1, 1)
	else
		var_10_11 = Color.New(1, 0.33, 0.33, 1)
	end

	var_10_7:GetComponent(typeof(Image)).color = var_10_11
	findTF(var_10_5, "skill"):GetComponent(typeof(Image)).color = var_10_11

	if arg_10_3 then
		arg_10_0:commanderSkillFloat(arg_10_3, arg_10_1, var_10_4)
	else
		local var_10_12 = var_0_1.CameraPosToUICamera(arg_10_2:GetPosition():Clone())
		local var_10_13 = ys.Battle.BattleCameraUtil.GetInstance():GetCharacterArrowBarPosition(var_10_12)
		local var_10_14 = table.contains(TeamType.SubShipType, arg_10_2:GetTemplate().type)
		local var_10_15 = arg_10_2:GetMainUnitIndex()

		if var_10_13 == nil or var_10_13 == nil and var_10_14 and not arg_10_2:IsMainFleetUnit() then
			if var_10_10 == ys.Battle.BattleConfig.FRIENDLY_CODE then
				var_10_12 = var_0_1.CameraPosToUICamera(arg_10_2:GetPosition():Clone():Add(var_0_0.IN_VIEW_FRIEND_SKILL_OFFSET))
			else
				var_10_12 = var_0_1.CameraPosToUICamera(arg_10_2:GetPosition():Clone():Add(var_0_0.IN_VIEW_FOE_SKILL_OFFSET))
			end

			var_10_5.position = Vector3(var_10_12.x, var_10_12.y, -2)

			local var_10_16 = rtf(var_10_5).rect.width * 0.5
			local var_10_17 = var_10_5.anchoredPosition
			local var_10_18 = var_10_17.x

			if Screen.width * 0.5 < var_10_16 + var_10_18 then
				var_10_17.x = var_10_18 - rtf(var_10_5).rect.width
				var_10_5.anchoredPosition = var_10_17
			end

			if arg_10_0._preSkillTF then
				arg_10_0.handleSkillFloatCld(arg_10_0._preSkillTF, var_10_5)
			end

			arg_10_0._preSkillTF = var_10_5

			var_10_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_11_0)
				arg_10_0._preSkillTF = nil

				var_10_1:Recycle(var_10_4)
			end)
		else
			local var_10_19
			local var_10_20 = var_0_0.SIDE_ALIGNMENT[var_10_15]
			local var_10_21 = arg_10_0._sideSkillFloatStateList[var_10_10][var_10_15]

			for iter_10_0 = 1, #var_10_21 do
				if var_10_21[iter_10_0] then
					var_10_19 = iter_10_0

					break
				end
			end

			if var_10_19 == nil then
				var_10_19 = #var_10_21 + 1
			end

			var_10_21[var_10_19] = false
			var_10_5.position = Vector3(var_10_13.x, var_10_13.y, -2)

			local var_10_22 = var_10_5.anchoredPosition

			var_10_22.y = var_10_20[var_10_19]

			if var_10_10 == ys.Battle.BattleConfig.FOE_CODE then
				var_10_22.x = var_0_0.FOE_SIDE_X_OFFSET
			end

			var_10_5.anchoredPosition = var_10_22

			var_10_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_12_0)
				var_10_21[var_10_19] = true

				var_10_1:Recycle(var_10_4)
			end)
		end
	end
end

function var_0_0.SkillHrzPopCover(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_0:SkillHrzPop(arg_13_1, arg_13_2, nil, arg_13_3)
end

function var_0_0.handleSkillFloatCld(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.anchoredPosition
	local var_14_1 = arg_14_0.anchoredPosition.y

	if math.floor(math.abs(var_14_0.y - var_14_1)) <= 112.5 then
		var_14_0.y = var_14_1 + 112.5
		arg_14_1.anchoredPosition = var_14_0
	end
end

function var_0_0.handleSkillSinkCld(arg_15_0, arg_15_1)
	return
end

function var_0_0.commanderSkillFloat(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	arg_16_0._commanderSkillList[arg_16_1] = arg_16_0._commanderSkillList[arg_16_1] or {}
	arg_16_0._commanderSkillList[arg_16_1][arg_16_2] = true

	local var_16_0 = arg_16_3.transform
	local var_16_1 = var_16_0.anchoredPosition

	var_16_1.x = 0
	var_16_1.y = 0
	var_16_0.anchoredPosition = var_16_1

	if arg_16_0._preCommanderSkillTF then
		local var_16_2 = arg_16_0._preCommanderSkillTF.anchoredPosition.y

		if math.floor(math.abs(var_16_1.y - var_16_2)) <= 97.5 then
			var_16_1.y = var_16_2 - 97.5
		end
	end

	var_16_0.anchoredPosition = var_16_1
	arg_16_0._preCommanderSkillTF = var_16_0

	var_16_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_17_0)
		arg_16_0._commanderSkillList[arg_16_1][arg_16_2] = nil
		arg_16_0._preCommanderSkillTF = nil

		arg_16_0._skillFloatCMDPool:Recycle(arg_16_3)
	end)
end

function var_0_0.CutInPainting(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	if arg_18_0._currentPainting then
		arg_18_0._paintingAnimator.enabled = false

		setActive(arg_18_0._currentPainting, false)
	end

	local var_18_0 = arg_18_4 or arg_18_1.painting or arg_18_1.prefab

	if arg_18_0._skillPaintings[var_18_0] == nil then
		local var_18_1 = ys.Battle.BattleResourceManager.GetInstance():InstPainting(var_18_0)

		arg_18_0._skillPaintings[var_18_0] = var_18_1

		setParent(var_18_1, arg_18_0._paintingFitter, false)
	end

	arg_18_0._currentPainting = arg_18_0._skillPaintings[var_18_0]

	setActive(arg_18_0._currentPainting, true)
	LuaHelper.SetParticleSpeed(arg_18_0._paintingUI, arg_18_2)

	local var_18_2 = Vector3(arg_18_3, 1, 1)

	arg_18_0._paintingUI.transform.localScale = var_18_2
	arg_18_0._paintingParticleContainer.transform.localScale = var_18_2
	arg_18_0._paintingParticles.transform.localEulerAngles = Vector3(0, 90 * arg_18_3, 0)

	arg_18_0._paintingParticleSystem:Play(true)

	arg_18_0._paintingAnimator.speed = arg_18_2
	arg_18_0._paintingAnimator.enabled = true

	arg_18_0._paintingAnimator:Play("skill_painting", -1, 0)
end

function var_0_0.didEnter(arg_19_0)
	setActive(arg_19_0._tf, false)

	arg_19_0._ratioFitter.enabled = true
	arg_19_0._ratioFitter.aspectRatio = pg.CameraFixMgr.GetInstance():GetBattleUIRatio()
	arg_19_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_20_0, arg_20_1)
		arg_19_0._ratioFitter.aspectRatio = pg.CameraFixMgr.GetInstance():GetBattleUIRatio()
	end)

	local var_19_0 = ys.Battle.BattleState.GetInstance()

	var_19_0:SetBattleUI(arg_19_0)
	onButton(arg_19_0, arg_19_0:findTF("PauseBtn"), function()
		arg_19_0:emit(BattleMediator.ON_PAUSE)
	end, SFX_CONFIRM)

	arg_19_0._chatBtn = arg_19_0:findTF("chatBtn")

	local var_19_1 = arg_19_0._chatBtn:GetComponent(typeof(Animation))

	onButton(arg_19_0, arg_19_0._chatBtn, function()
		arg_19_0:emit(BattleMediator.ON_CHAT, arg_19_0:findTF("chatContainer"))

		if not var_19_1 then
			setActive(arg_19_0._chatBtn, false)
		else
			var_19_1:Play("chatbtn_out")
		end
	end)
	onToggle(arg_19_0, arg_19_0:findTF("AutoBtn"), function(arg_23_0)
		local var_23_0 = var_19_0:GetBattleType()

		arg_19_0:emit(BattleMediator.ON_AUTO, {
			isOn = not arg_23_0,
			toggle = arg_19_0:findTF("AutoBtn"),
			system = var_23_0
		})
		var_19_0:ActiveBot(ys.Battle.BattleState.IsAutoBotActive(var_23_0))

		if var_19_0:ChatUseable() then
			setActive(arg_19_0._chatBtn, true)

			if var_19_1 then
				var_19_1:Play("chatbtn_in")
			end
		elseif var_19_1 then
			var_19_1:Play("chatbtn_out")
		else
			setActive(arg_19_0._chatBtn, false)
		end
	end, SFX_PANEL, SFX_PANEL)
	onButton(arg_19_0, arg_19_0:findTF("CardPuzzleConsole/relic/bg"), function()
		local var_24_0 = var_19_0:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE):GetCardPuzzleComponent():GetRelicList()

		arg_19_0:emit(BattleMediator.ON_PUZZLE_RELIC, {
			relicList = var_24_0
		})
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0:findTF("CardPuzzleConsole/deck/bg"), function()
		local var_25_0 = var_19_0:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE):GetCardPuzzleComponent()
		local var_25_1 = var_25_0:GetDeck():GetCardList()
		local var_25_2 = var_25_0:GetHand():GetCardList()

		arg_19_0:emit(BattleMediator.ON_PUZZLE_CARD, {
			card = var_25_1,
			hand = var_25_2
		})
	end, SFX_CONFIRM)
	var_19_0:ConfigBattleEndFunc(function(arg_26_0)
		arg_19_0:clear()
		arg_19_0:emit(BattleMediator.ON_BATTLE_RESULT, arg_26_0)
	end)

	local var_19_2 = ys.Battle.BattleConst.BuffEffectType
	local var_19_3 = {
		var_19_2.ON_START_GAME,
		var_19_2.ON_FLAG_SHIP,
		var_19_2.ON_CONSORT,
		var_19_2.ON_LEADER,
		var_19_2.ON_REAR,
		var_19_2.ON_SUB_LEADER,
		var_19_2.ON_SUB_CONSORT
	}
	local var_19_4 = 0

	local function var_19_5(arg_27_0)
		local var_27_0 = 0

		for iter_27_0, iter_27_1 in ipairs(arg_27_0) do
			var_27_0 = var_27_0 + ys.Battle.BattleDataFunction.GetShipSkillTriggerCount(iter_27_1, var_19_3)
		end

		return var_27_0
	end

	local var_19_6 = var_19_4 + var_19_5(arg_19_0.contextData.battleData.MainUnitList) + var_19_5(arg_19_0.contextData.battleData.VanguardUnitList) + var_19_5(arg_19_0.contextData.battleData.SubUnitList) + 4

	arg_19_0._skillFloatPool = pg.Pool.New(arg_19_0.skillRoot, arg_19_0.skillTpl, var_19_6, 10, true, false):InitSize()

	arg_19_0._skillFloatPool:SetRecycleFuncs(function(arg_28_0)
		arg_28_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)
	arg_19_0:emit(BattleMediator.ENTER)
	arg_19_0:initPauseWindow()

	if arg_19_0.contextData.prePause then
		triggerButton(arg_19_0:findTF("PauseBtn"))
	end

	setActive(arg_19_0._chatBtn, var_19_0:ChatUseable())
end

function var_0_0.onBackPressed(arg_29_0)
	if isActive(arg_29_0.pauseWindow) then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		triggerButton(arg_29_0.continueBtn)
	end
end

function var_0_0.activeBotHelp(arg_30_0, arg_30_1)
	local var_30_0 = getProxy(PlayerProxy)

	if not arg_30_1 then
		if arg_30_0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if var_30_0.botHelp then
		return
	end

	arg_30_0.autoBotHelp = true

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
			arg_30_0.autoBotHelp = false
		end
	})

	var_30_0.botHelp = true
end

function var_0_0.exitBattle(arg_32_0, arg_32_1)
	if not arg_32_1 then
		arg_32_0:emit(BattleMediator.ON_QUIT_BATTLE_MANUALLY)
		arg_32_0:emit(BattleMediator.ON_BACK_PRE_SCENE)
	elseif arg_32_1 == "kick" then
		-- block empty
	end
end

function var_0_0.setChapter(arg_33_0, arg_33_1)
	arg_33_0._chapter = arg_33_1
end

function var_0_0.setFleet(arg_34_0, arg_34_1, arg_34_2)
	arg_34_0._mainShipVOs = arg_34_1
	arg_34_0._vanShipVOs = arg_34_2
end

function var_0_0.initPauseWindow(arg_35_0)
	arg_35_0.pauseWindow = arg_35_0:findTF("Msgbox")
	arg_35_0.LeftTimeContainer = arg_35_0:findTF("window/LeftTime", arg_35_0.pauseWindow)
	arg_35_0.LeftTime = arg_35_0:findTF("window/LeftTime/Text", arg_35_0.pauseWindow)
	arg_35_0.mainTFs = {}
	arg_35_0.vanTFs = {}

	setText(arg_35_0:findTF("label", arg_35_0.LeftTimeContainer), i18n("battle_battleMediator_remainTime"))
	setText(arg_35_0:findTF("window/van/power/title", arg_35_0.pauseWindow), i18n("word_vanguard_fleet"))
	setText(arg_35_0:findTF("window/main/power/title", arg_35_0.pauseWindow), i18n("word_main_fleet"))

	local function var_35_0(arg_36_0, arg_36_1, arg_36_2)
		for iter_36_0 = 1, 3 do
			local var_36_0 = arg_36_1:Find("ship_" .. iter_36_0)

			setActive(var_36_0, arg_36_2 and iter_36_0 <= #arg_36_2)

			if arg_36_2 and iter_36_0 <= #arg_36_2 then
				updateShip(var_36_0, arg_36_2[iter_36_0])
			end

			table.insert(arg_36_0 and arg_35_0.mainTFs or arg_35_0.vanTFs, var_36_0)
		end

		if arg_36_2 then
			local var_36_1 = 0

			for iter_36_1, iter_36_2 in ipairs(arg_36_2) do
				var_36_1 = var_36_1 + iter_36_2:getShipCombatPower()
			end

			setText(arg_36_1:Find("power/value"), var_36_1)
		end
	end

	if arg_35_0._mainShipVOs then
		var_35_0(true, arg_35_0:findTF("window/main", arg_35_0.pauseWindow), arg_35_0._mainShipVOs)
		var_35_0(false, arg_35_0:findTF("window/van", arg_35_0.pauseWindow), arg_35_0._vanShipVOs)
	end

	local var_35_1 = ys.Battle.BattleState.GetInstance()
	local var_35_2 = findTF(arg_35_0.pauseWindow, "window/Chapter")
	local var_35_3 = findTF(arg_35_0.pauseWindow, "window/Chapter/Text")

	arg_35_0.continueBtn = arg_35_0:findTF("window/button_container/continue", arg_35_0.pauseWindow)
	arg_35_0.leaveBtn = arg_35_0:findTF("window/button_container/leave", arg_35_0.pauseWindow)

	setText(arg_35_0:findTF("pic", arg_35_0.continueBtn), i18n("battle_battleMediator_goOnFight"))
	setText(arg_35_0:findTF("pic", arg_35_0.leaveBtn), i18n("battle_battleMediator_existFight"))

	local var_35_4 = var_35_1:GetBattleType()

	if var_35_4 == SYSTEM_SCENARIO then
		local var_35_5 = arg_35_0._chapter:getConfigTable()

		setText(var_35_2, var_35_5.chapter_name)
		setText(var_35_3, string.split(var_35_5.name, "|")[1])
	elseif var_35_4 == SYSTEM_ROUTINE or var_35_4 == SYSTEM_DUEL or var_35_4 == SYSTEM_HP_SHARE_ACT_BOSS or var_35_4 == SYSTEM_BOSS_EXPERIMENT or var_35_4 == SYSTEM_ACT_BOSS or var_35_4 == SYSTEM_ACT_BOSS_SP or var_35_4 == SYSTEM_BOSS_RUSH or var_35_4 == SYSTEM_BOSS_RUSH_EX or var_35_4 == SYSTEM_LIMIT_CHALLENGE or var_35_4 == SYSTEM_BOSS_SINGLE or var_35_4 == SYSTEM_BOSS_SINGLE_VARIABLE then
		setText(var_35_2, "SP")

		local var_35_6 = var_35_1:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().StageTmpId
		local var_35_7 = pg.expedition_data_template[var_35_6]

		setText(var_35_3, var_35_7.name)
	elseif var_35_4 == SYSTEM_DEBUG then
		setText(var_35_2, "??")
		setText(var_35_3, "碧蓝梦境")
	elseif var_35_4 == SYSTEM_CHALLENGE then
		local var_35_8 = arg_35_0._chapter:getNextExpedition()

		setText(var_35_2, "SP")
		setText(var_35_3, var_35_8.chapter_name[2])
		setActive(arg_35_0.LeftTimeContainer, true)
	elseif var_35_4 == SYSTEM_WORLD_BOSS or var_35_4 == SYSTEM_WORLD then
		setText(var_35_2, i18n("world_battle_pause"))
		setText(var_35_3, i18n("world_battle_pause2"))

		if var_35_4 == SYSTEM_WORLD_BOSS then
			setActive(arg_35_0.leaveBtn, false)
		end
	elseif var_35_4 == SYSTEM_GUILD then
		local var_35_9 = var_35_1:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().ActID
		local var_35_10 = pg.guild_boss_event[var_35_9]

		setText(var_35_2, "BOSS")
		setText(var_35_3, var_35_10 and var_35_10.name or "")
	elseif var_35_4 == SYSTEM_TEST or var_35_4 == SYSTEM_SUB_ROUTINE or var_35_4 == SYSTEM_PERFORM or var_35_4 == SYSTEM_PROLOGUE or var_35_4 == SYSTEM_DODGEM or var_35_4 == SYSTEM_SIMULATION or var_35_4 == SYSTEM_SUBMARINE_RUN or var_35_4 == SYSTEM_BOSS_EXPERIMENT or var_35_4 == SYSTEM_REWARD_PERFORM or var_35_4 == SYSTEM_AIRFIGHT then
		-- block empty
	elseif var_35_4 == SYSTEM_CARDPUZZLE then
		-- block empty
	else
		assert(false, "System not defined " .. (var_35_4 or "NIL"))
	end

	onButton(arg_35_0, arg_35_0.leaveBtn, function()
		arg_35_0:emit(BattleMediator.ON_LEAVE)

		local var_37_0 = arg_35_0.leaveBtn:GetComponent(typeof(Animation))

		if var_37_0 and var_37_0:GetClip("msgbox_btn_blink") then
			var_37_0:Play("msgbox_btn_blink")
		end
	end)
	onButton(arg_35_0, arg_35_0.continueBtn, function()
		local var_38_0 = arg_35_0.continueBtn:GetComponent(typeof(Animation))

		if var_38_0 and var_38_0:GetClip("msgbox_btn_blink") then
			var_38_0:Play("msgbox_btn_blink")
		end

		local var_38_1 = arg_35_0.pauseWindow:GetComponent(typeof(Animation))

		if var_38_1 then
			if var_38_1:IsPlaying("msgbox_out") then
				var_38_1:Stop("msgbox_out")
				var_38_1:Play("msgbox_in")
			else
				var_38_1:Play("msgbox_out")
				arg_35_0.pauseWindow:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_39_0)
					setActive(arg_35_0.pauseWindow, false)
					pg.UIMgr.GetInstance():UnblurPanel(arg_35_0.pauseWindow, arg_35_0._tf)
					var_35_1:Resume()
				end)
			end
		else
			setActive(arg_35_0.pauseWindow, false)
			pg.UIMgr.GetInstance():UnblurPanel(arg_35_0.pauseWindow, arg_35_0._tf)
			var_35_1:Resume()
		end
	end)
	onButton(arg_35_0, arg_35_0:findTF("help", arg_35_0.pauseWindow), function()
		if BATTLE_DEBUG and PLATFORM == 7 then
			setActive(arg_35_0.pauseWindow, false)
			pg.UIMgr.GetInstance():UnblurPanel(arg_35_0.pauseWindow, arg_35_0._tf)
			var_35_1:Resume()
			var_35_1:OpenConsole()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_battle_rule")
			})
		end
	end)
	onButton(arg_35_0, arg_35_0:findTF("window/top/btnBack", arg_35_0.pauseWindow), function()
		triggerButton(arg_35_0.continueBtn)
	end)
	onButton(arg_35_0, arg_35_0.pauseWindow, function()
		triggerButton(arg_35_0.continueBtn)
	end)
	onButton(arg_35_0, arg_35_0.pauseWindow, function()
		local var_43_0 = arg_35_0.pauseWindow:GetComponent(typeof(Animation))

		if var_43_0 and var_43_0:IsPlaying("msgbox_out") then
			-- block empty
		else
			triggerButton(arg_35_0.continueBtn)
		end
	end)
	setActive(arg_35_0.pauseWindow, false)
end

function var_0_0.updatePauseWindow(arg_44_0)
	if not arg_44_0.pauseWindow then
		return
	end

	setActive(arg_44_0.pauseWindow, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_44_0.pauseWindow, nil, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	local var_44_0 = ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name)
	local var_44_1 = var_44_0:GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE)
	local var_44_2 = var_44_1:GetMainList()
	local var_44_3 = var_44_1:GetScoutList()

	local function var_44_4(arg_45_0, arg_45_1, arg_45_2)
		if not arg_45_0 then
			return
		end

		for iter_45_0 = 1, #arg_45_0 do
			local var_45_0 = arg_45_0[iter_45_0].id

			if var_44_1:GetFreezeShipByID(var_45_0) then
				local var_45_1 = var_44_1:GetFreezeShipByID(var_45_0)

				setSlider(arg_45_2[iter_45_0]:Find("blood"), 0, 1, var_45_1:GetHPRate())
				SetActive(arg_45_2[iter_45_0]:Find("mask"), false)
			elseif var_44_1:GetShipByID(var_45_0) then
				local var_45_2 = var_44_1:GetShipByID(var_45_0)

				setSlider(arg_45_2[iter_45_0]:Find("blood"), 0, 1, var_45_2:GetHPRate())
				SetActive(arg_45_2[iter_45_0]:Find("mask"), false)
			else
				setSlider(arg_45_2[iter_45_0]:Find("blood"), 0, 1, 0)
				SetActive(arg_45_2[iter_45_0]:Find("mask"), true)
			end
		end
	end

	var_44_4(arg_44_0._mainShipVOs, var_44_2, arg_44_0.mainTFs)
	var_44_4(arg_44_0._vanShipVOs, var_44_3, arg_44_0.vanTFs)
	setText(arg_44_0.LeftTime, ys.Battle.BattleTimerView.formatTime(math.floor(var_44_0:GetCountDown())))
end

function var_0_0.AddUIFX(arg_46_0, arg_46_1, arg_46_2)
	arg_46_2 = arg_46_2 or 1

	local var_46_0 = arg_46_2 > 0

	arg_46_1 = tf(arg_46_1)

	local var_46_1 = var_46_0 and arg_46_0._fxContainerUpper or arg_46_0._fxContainerBottom

	arg_46_1:SetParent(var_46_1)
	pg.ViewUtils.SetSortingOrder(arg_46_1, arg_46_0._canvasOrder + arg_46_2)
	pg.ViewUtils.SetLayer(arg_46_1, Layer.UI)

	return var_46_1.localScale
end

function var_0_0.OnCloseChat(arg_47_0)
	local var_47_0 = ys.Battle.BattleState.GetInstance():IsBotActive()
	local var_47_1 = arg_47_0._chatBtn:GetComponent(typeof(Animation))

	if var_47_0 then
		setActive(arg_47_0._chatBtn, true)

		if var_47_1 then
			var_47_1:Play("chatbtn_in")
		end
	elseif var_47_1 then
		var_47_1:Play("chatbtn_out")
	else
		setActive(arg_47_0._chatBtn, false)
	end
end

function var_0_0.clear(arg_48_0)
	arg_48_0._preSkillTF = nil

	arg_48_0._skillFloatPool:AllRecycle()
	arg_48_0._skillFloatCMDPool:AllRecycle()

	arg_48_0._preCommanderSkillTF = nil
	arg_48_0._commanderSkillList = nil
	arg_48_0._skillPaintings = nil
	arg_48_0._currentPainting = nil

	Destroy(arg_48_0._paintingUI)
end

function var_0_0.willExit(arg_49_0)
	arg_49_0._skillFloatPool:Dispose()
	arg_49_0._skillFloatCMDPool:Dispose()
	ys.Battle.BattleState.GetInstance():ExitBattle()
	pg.UIMgr.GetInstance():UnblurPanel(arg_49_0.pauseWindow, arg_49_0._tf)
	ys.Battle.BattleCameraUtil.GetInstance().ActiveMainCamera(false)
	pg.CameraFixMgr.GetInstance():disconnect(arg_49_0.camEventId)
end

return var_0_0
