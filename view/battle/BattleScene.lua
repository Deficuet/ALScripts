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

function var_0_0.getResource(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, arg_4_0:getUIName())
	local var_4_2 = var_4_1 .. ResPathSupport.ConstPath.UI.Atlas

	table.insert(var_4_0, var_4_1)
	table.insert(var_4_0, var_4_2)

	local var_4_3 = {}

	table.insert(var_4_3, arg_4_1.system == SYSTEM_WORLD and checkExist(pg.world_expedition_data[arg_4_0.contextData.stageId], {
		"bgm"
	}) or "")
	table.insert(var_4_3, pg.expedition_data_template[arg_4_1.stageId].bgm)
	table.insert(var_4_3, var_0_0.super.getBGM(arg_4_0))
	_.each(var_4_3, function(arg_5_0)
		if arg_5_0 ~= "" then
			table.insertto(var_4_0, ResPathSupport.GetSoundResList(arg_5_0))
		end
	end)

	return var_4_0
end

function var_0_0.init(arg_6_0)
	var_0_1 = ys.Battle.BattleVariable

	local var_6_0 = pg.UIMgr.GetInstance():GetMainCamera()
	local var_6_1 = GameObject.Find("UICamera")

	arg_6_0.uiCanvas = findTF(var_6_1, "Canvas/UIMain")
	arg_6_0.skillTips = arg_6_0._tf:Find("Skill_Activation")
	arg_6_0.skillRoot = arg_6_0._tf:Find("Skill_Activation/Root")
	arg_6_0.skillTpl = arg_6_0._tf:Find("Skill_Activation/mask").gameObject
	arg_6_0._skillFloatPool = pg.Pool.New(arg_6_0.skillRoot, arg_6_0.skillTpl, 15, 10, true, false):InitSize()

	arg_6_0._skillFloatPool:SetRecycleFuncs(function(arg_7_0)
		arg_7_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)

	arg_6_0.skillCMDRoot = arg_6_0._tf:Find("Skill_Activation/Root_cmd")
	arg_6_0.skillCMDTpl = arg_6_0._tf:Find("Skill_Activation/mask_cmd").gameObject
	arg_6_0._skillFloatCMDPool = pg.Pool.New(arg_6_0.skillCMDRoot, arg_6_0.skillCMDTpl, 2, 4, true, false):InitSize()

	arg_6_0._skillFloatCMDPool:SetRecycleFuncs(function(arg_8_0)
		arg_8_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)

	arg_6_0.popupTpl = arg_6_0:getTpl("popup")

	SetActive(arg_6_0._go, false)

	arg_6_0._skillPaintings = {}
	arg_6_0._skillFloat = true
	arg_6_0._cacheSkill = {}
	arg_6_0._commanderSkillList = {}
	arg_6_0._sideSkillFloatStateList = {}
	arg_6_0._sideSkillFloatStateList[ys.Battle.BattleConfig.FRIENDLY_CODE] = {
		{},
		{},
		{}
	}
	arg_6_0._sideSkillFloatStateList[ys.Battle.BattleConfig.FOE_CODE] = {
		{},
		{},
		{}
	}

	arg_6_0:initPainting()

	arg_6_0._fxContainerUpper = arg_6_0._tf:Find("FXContainerUpper")
	arg_6_0._fxContainerBottom = arg_6_0._tf:Find("FXContainerBottom")

	local var_6_2 = arg_6_0._tf:GetComponentInParent(typeof(UnityEngine.Canvas))

	arg_6_0._canvasOrder = var_6_2 and var_6_2.sortingOrder or 0
	arg_6_0._ratioFitter = GetComponent(arg_6_0._tf, typeof(AspectRatioFitter))

	if not BATTLE_DEFAULT_UNIT_DETAIL then
		arg_6_0._go:AddComponent(typeof(RectMask2D))
	end
end

function var_0_0.initPainting(arg_9_0)
	local var_9_0 = ys.Battle.BattleResourceManager.GetInstance():InstSkillPaintingUI()

	setParent(var_9_0, arg_9_0.uiCanvas, false)

	arg_9_0._paintingUI = var_9_0
	arg_9_0._paintingAnimator = var_9_0:GetComponent(typeof(Animator))
	arg_9_0._paintingAnimator.enabled = false
	arg_9_0._paintingParticleContainer = findTF(var_9_0, "particleContainer")
	arg_9_0._paintingParticles = findTF(arg_9_0._paintingParticleContainer, "effect")
	arg_9_0._paintingParticleSystem = arg_9_0._paintingParticles:GetComponent(typeof(ParticleSystem))

	arg_9_0._paintingParticleSystem:Stop(true)

	arg_9_0._paintingFitter = findTF(var_9_0, "hero/fitter")

	removeAllChildren(arg_9_0._paintingFitter)

	local var_9_1 = GetOrAddComponent(arg_9_0._paintingFitter, "PaintingScaler")

	var_9_1.FrameName = "lihuisha"
	var_9_1.Tween = 1

	var_9_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_10_0)
		if arg_9_0._currentPainting then
			setActive(arg_9_0._currentPainting, false)

			arg_9_0._currentPainting = nil
		end
	end)
end

function var_0_0.EnableSkillFloat(arg_11_0, arg_11_1)
	if arg_11_1 == arg_11_0._skillFloat then
		return
	end

	arg_11_0._skillFloat = arg_11_1

	if arg_11_0._skillFloat then
		for iter_11_0, iter_11_1 in ipairs(arg_11_0._cacheSkill) do
			arg_11_0:SkillHrzPop(iter_11_1.skillName, iter_11_1.caster, iter_11_1.commander, iter_11_1.hrzIcon)
		end

		arg_11_0._cacheSkill = {}
	else
		arg_11_0._skillFloatPool:AllRecycle()
		arg_11_0._skillFloatCMDPool:AllRecycle()

		arg_11_0._preCommanderSkillTF = nil
		arg_11_0._preSkillTF = nil
	end

	SetActive(arg_11_0.skillTips, arg_11_1)
end

function var_0_0.SkillHrzPop(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	if not arg_12_0._skillFloat then
		table.insert(arg_12_0._cacheSkill, {
			skillName = arg_12_1,
			caster = arg_12_2,
			commander = arg_12_3,
			hrzIcon = arg_12_4
		})

		return
	end

	local var_12_0 = ys.Battle.BattleResourceManager.GetInstance()
	local var_12_1
	local var_12_2

	if arg_12_3 then
		if arg_12_0._commanderSkillList[arg_12_3] and arg_12_0._commanderSkillList[arg_12_3][arg_12_1] then
			return
		end

		var_12_1 = arg_12_0._skillFloatCMDPool

		if ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
			var_12_2 = var_12_0:GetCommanderHrzIcon(arg_12_3)
		else
			var_12_2 = var_12_0:GetCommanderIcon(arg_12_3)
		end
	else
		var_12_1 = arg_12_0._skillFloatPool

		if arg_12_2:GetUnitType() == ys.Battle.BattleConst.UnitType.PLAYER_UNIT then
			local var_12_3 = arg_12_4 or arg_12_2:GetTemplate().painting

			if ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
				var_12_2 = var_12_0:GetCharacterIcon(var_12_3)
			else
				var_12_2 = var_12_0:GetCharacterSquareIcon(var_12_3)
			end
		elseif ys.Battle.BattleState.GetCombatSkinKey() == "Standard" then
			var_12_2 = var_12_0:GetCharacterIcon(pg.enemy_data_statistics[arg_12_2:GetTemplateID()].icon)
		else
			var_12_2 = var_12_0:GetCharacterSquareIcon(pg.enemy_data_statistics[arg_12_2:GetTemplateID()].icon)
		end
	end

	local var_12_4 = var_12_1:GetObject()
	local var_12_5 = var_12_4.transform

	var_12_5.localScale = var_0_0.SKILL_FLOAT_SCALE

	setText(findTF(var_12_5, "skill/skill_name/Text"), SwitchSpecialChar(HXSet.hxLan(arg_12_1)))

	local var_12_6 = findTF(var_12_5, "skill/icon_mask/icon")
	local var_12_7 = findTF(var_12_5, "skill/skill_name")
	local var_12_8 = var_12_5:GetComponent(typeof(Animation))

	if var_12_8 then
		local var_12_9 = 1

		while var_12_8:GetClip("anim_skinui_skill_" .. var_12_9) do
			var_12_9 = var_12_9 + 1
		end

		if var_12_9 > 1 then
			var_12_8:Play("anim_skinui_skill_" .. math.random(var_12_9 - 1))
		end
	end

	var_12_6:GetComponent(typeof(Image)).sprite = var_12_2

	local var_12_10, var_12_11 = arg_12_2:GetIFF()

	if arg_12_2:GetIFF() == ys.Battle.BattleConfig.FRIENDLY_CODE then
		var_12_11 = Color.New(1, 1, 1, 1)
	else
		var_12_11 = Color.New(1, 0.33, 0.33, 1)
	end

	var_12_7:GetComponent(typeof(Image)).color = var_12_11
	findTF(var_12_5, "skill"):GetComponent(typeof(Image)).color = var_12_11

	if arg_12_3 then
		arg_12_0:commanderSkillFloat(arg_12_3, arg_12_1, var_12_4)
	else
		local var_12_12 = var_0_1.CameraPosToUICamera(arg_12_2:GetPosition():Clone())
		local var_12_13 = ys.Battle.BattleCameraUtil.GetInstance():GetCharacterArrowBarPosition(var_12_12)
		local var_12_14 = table.contains(ShipType.SubShipType, arg_12_2:GetTemplate().type)
		local var_12_15 = arg_12_2:GetMainUnitIndex()

		if var_12_13 == nil or var_12_13 == nil and var_12_14 and not arg_12_2:IsMainFleetUnit() then
			if var_12_10 == ys.Battle.BattleConfig.FRIENDLY_CODE then
				var_12_12 = var_0_1.CameraPosToUICamera(arg_12_2:GetPosition():Clone():Add(var_0_0.IN_VIEW_FRIEND_SKILL_OFFSET))
			else
				var_12_12 = var_0_1.CameraPosToUICamera(arg_12_2:GetPosition():Clone():Add(var_0_0.IN_VIEW_FOE_SKILL_OFFSET))
			end

			var_12_5.position = Vector3(var_12_12.x, var_12_12.y, -2)

			local var_12_16 = rtf(var_12_5).rect.width * 0.5
			local var_12_17 = var_12_5.anchoredPosition
			local var_12_18 = var_12_17.x

			if Screen.width * 0.5 < var_12_16 + var_12_18 then
				var_12_17.x = var_12_18 - rtf(var_12_5).rect.width
				var_12_5.anchoredPosition = var_12_17
			end

			if arg_12_0._preSkillTF then
				arg_12_0.handleSkillFloatCld(arg_12_0._preSkillTF, var_12_5)
			end

			arg_12_0._preSkillTF = var_12_5

			var_12_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_13_0)
				arg_12_0._preSkillTF = nil

				var_12_1:Recycle(var_12_4)
			end)
		else
			local var_12_19
			local var_12_20 = var_0_0.SIDE_ALIGNMENT[var_12_15]
			local var_12_21 = arg_12_0._sideSkillFloatStateList[var_12_10][var_12_15]

			for iter_12_0 = 1, #var_12_21 do
				if var_12_21[iter_12_0] then
					var_12_19 = iter_12_0

					break
				end
			end

			if var_12_19 == nil then
				var_12_19 = #var_12_21 + 1
			end

			var_12_21[var_12_19] = false
			var_12_5.position = Vector3(var_12_13.x, var_12_13.y, -2)

			local var_12_22 = var_12_5.anchoredPosition

			var_12_22.y = var_12_20[var_12_19]

			if var_12_10 == ys.Battle.BattleConfig.FOE_CODE then
				var_12_22.x = var_0_0.FOE_SIDE_X_OFFSET
			end

			var_12_5.anchoredPosition = var_12_22

			var_12_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_14_0)
				var_12_21[var_12_19] = true

				var_12_1:Recycle(var_12_4)
			end)
		end
	end
end

function var_0_0.SkillHrzPopCover(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	arg_15_0:SkillHrzPop(arg_15_1, arg_15_2, nil, arg_15_3)
end

function var_0_0.handleSkillFloatCld(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.anchoredPosition
	local var_16_1 = arg_16_0.anchoredPosition.y

	if math.floor(math.abs(var_16_0.y - var_16_1)) <= 112.5 then
		var_16_0.y = var_16_1 + 112.5
		arg_16_1.anchoredPosition = var_16_0
	end
end

function var_0_0.handleSkillSinkCld(arg_17_0, arg_17_1)
	return
end

function var_0_0.commanderSkillFloat(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_0._commanderSkillList[arg_18_1] = arg_18_0._commanderSkillList[arg_18_1] or {}
	arg_18_0._commanderSkillList[arg_18_1][arg_18_2] = true

	local var_18_0 = arg_18_3.transform
	local var_18_1 = var_18_0.anchoredPosition

	var_18_1.x = 0
	var_18_1.y = 0
	var_18_0.anchoredPosition = var_18_1

	if arg_18_0._preCommanderSkillTF then
		local var_18_2 = arg_18_0._preCommanderSkillTF.anchoredPosition.y

		if math.floor(math.abs(var_18_1.y - var_18_2)) <= 97.5 then
			var_18_1.y = var_18_2 - 97.5
		end
	end

	var_18_0.anchoredPosition = var_18_1
	arg_18_0._preCommanderSkillTF = var_18_0

	var_18_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_19_0)
		arg_18_0._commanderSkillList[arg_18_1][arg_18_2] = nil
		arg_18_0._preCommanderSkillTF = nil

		arg_18_0._skillFloatCMDPool:Recycle(arg_18_3)
	end)
end

function var_0_0.CutInPainting(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	if arg_20_0._currentPainting then
		arg_20_0._paintingAnimator.enabled = false

		setActive(arg_20_0._currentPainting, false)
	end

	local var_20_0 = arg_20_4 or arg_20_1.painting or arg_20_1.prefab

	if arg_20_0._skillPaintings[var_20_0] == nil then
		local var_20_1 = ys.Battle.BattleResourceManager.GetInstance():InstPainting(var_20_0)

		arg_20_0._skillPaintings[var_20_0] = var_20_1

		setParent(var_20_1, arg_20_0._paintingFitter, false)
	end

	arg_20_0._currentPainting = arg_20_0._skillPaintings[var_20_0]

	setActive(arg_20_0._currentPainting, true)
	LuaHelper.SetParticleSpeed(arg_20_0._paintingUI, arg_20_2)

	local var_20_2 = Vector3(arg_20_3, 1, 1)

	arg_20_0._paintingUI.transform.localScale = var_20_2
	arg_20_0._paintingParticleContainer.transform.localScale = var_20_2
	arg_20_0._paintingParticles.transform.localEulerAngles = Vector3(0, 90 * arg_20_3, 0)

	arg_20_0._paintingParticleSystem:Play(true)

	arg_20_0._paintingAnimator.speed = arg_20_2
	arg_20_0._paintingAnimator.enabled = true

	arg_20_0._paintingAnimator:Play("skill_painting", -1, 0)
end

function var_0_0.CutInPaintingDAL(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	local var_21_0 = ys.Battle.BattleResourceManager.GetInstance():InstSkillPaintingDALUI()

	setParent(var_21_0, arg_21_0.uiCanvas, false)

	local var_21_1 = findTF(var_21_0, "hero/fitter")
	local var_21_2 = arg_21_4.cutin_cover_DAL
	local var_21_3 = GetOrAddComponent(var_21_1, "PaintingScaler")

	var_21_3.FrameName = "lihuisha"
	var_21_3.Tween = 1

	local var_21_4 = ys.Battle.BattleResourceManager.GetInstance():InstPainting(var_21_2)

	setParent(var_21_4, var_21_1, false)
	var_21_0:GetComponent(typeof(Animator)):Play("skill_painting", -1, 0)
	setText(findTF(var_21_0, "pop/text"), arg_21_4.cutin_script)
	var_21_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_22_0)
		setActive(var_21_0, false)
	end)
end

function var_0_0.didEnter(arg_23_0)
	setActive(arg_23_0._tf, false)

	arg_23_0._ratioFitter.enabled = true
	arg_23_0._ratioFitter.aspectRatio = pg.CameraFixMgr.GetInstance():GetBattleUIRatio()
	arg_23_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_24_0, arg_24_1)
		arg_23_0._ratioFitter.aspectRatio = pg.CameraFixMgr.GetInstance():GetBattleUIRatio()
	end)

	local var_23_0 = ys.Battle.BattleState.GetInstance()

	var_23_0:SetBattleUI(arg_23_0)
	onButton(arg_23_0, arg_23_0._tf:Find("PauseBtn"), function()
		arg_23_0:emit(BattleMediator.ON_PAUSE)
	end, SFX_CONFIRM)

	arg_23_0._chatBtn = arg_23_0._tf:Find("chatBtnContainer/chatBtn")

	local var_23_1 = arg_23_0._chatBtn:GetComponent(typeof(Animation))

	onButton(arg_23_0, arg_23_0._chatBtn, function()
		arg_23_0:emit(BattleMediator.ON_CHAT, arg_23_0._tf:Find("chatContainer"))

		if not var_23_1 then
			setActive(arg_23_0._chatBtn, false)
		else
			var_23_1:Play("chatbtn_out")
		end
	end)
	onToggle(arg_23_0, arg_23_0._tf:Find("AutoBtn"), function(arg_27_0)
		local var_27_0 = var_23_0:GetBattleType()

		arg_23_0:emit(BattleMediator.ON_AUTO, {
			isOn = not arg_27_0,
			toggle = arg_23_0._tf:Find("AutoBtn"),
			system = var_27_0
		})
		var_23_0:ActiveBot(ys.Battle.BattleState.IsAutoBotActive(var_27_0))

		if var_23_0:ChatUseable() then
			setActive(arg_23_0._chatBtn, true)

			if var_23_1 then
				var_23_1:Play("chatbtn_in")
			end
		elseif var_23_1 then
			var_23_1:Play("chatbtn_out")
		else
			setActive(arg_23_0._chatBtn, false)
		end
	end, SFX_PANEL, SFX_PANEL)
	onButton(arg_23_0, arg_23_0._tf:Find("CardPuzzleConsole/relic/bg"), function()
		local var_28_0 = var_23_0:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE):GetCardPuzzleComponent():GetRelicList()

		arg_23_0:emit(BattleMediator.ON_PUZZLE_RELIC, {
			relicList = var_28_0
		})
	end, SFX_CONFIRM)
	onButton(arg_23_0, arg_23_0._tf:Find("CardPuzzleConsole/deck/bg"), function()
		local var_29_0 = var_23_0:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE):GetCardPuzzleComponent()
		local var_29_1 = var_29_0:GetDeck():GetCardList()
		local var_29_2 = var_29_0:GetHand():GetCardList()

		arg_23_0:emit(BattleMediator.ON_PUZZLE_CARD, {
			card = var_29_1,
			hand = var_29_2
		})
	end, SFX_CONFIRM)
	var_23_0:ConfigBattleEndFunc(function(arg_30_0)
		arg_23_0:clear()
		arg_23_0:emit(BattleMediator.ON_BATTLE_RESULT, arg_30_0)
	end)

	local var_23_2 = ys.Battle.BattleConst.BuffEffectType
	local var_23_3 = {
		var_23_2.ON_START_GAME,
		var_23_2.ON_FLAG_SHIP,
		var_23_2.ON_CONSORT,
		var_23_2.ON_LEADER,
		var_23_2.ON_REAR,
		var_23_2.ON_SUB_LEADER,
		var_23_2.ON_SUB_CONSORT
	}
	local var_23_4 = 0

	local function var_23_5(arg_31_0)
		local var_31_0 = 0

		for iter_31_0, iter_31_1 in ipairs(arg_31_0) do
			var_31_0 = var_31_0 + ys.Battle.BattleDataFunction.GetShipSkillTriggerCount(iter_31_1, var_23_3)
		end

		return var_31_0
	end

	local var_23_6 = var_23_4 + var_23_5(arg_23_0.contextData.battleData.MainUnitList) + var_23_5(arg_23_0.contextData.battleData.VanguardUnitList) + var_23_5(arg_23_0.contextData.battleData.SubUnitList) + 4

	arg_23_0._skillFloatPool = pg.Pool.New(arg_23_0.skillRoot, arg_23_0.skillTpl, var_23_6, 10, true, false):InitSize()

	arg_23_0._skillFloatPool:SetRecycleFuncs(function(arg_32_0)
		arg_32_0.transform:GetComponent(typeof(DftAniEvent)):OnDestroy()
	end)
	arg_23_0:emit(BattleMediator.ENTER)
	arg_23_0:initPauseWindow()

	if arg_23_0.contextData.prePause then
		triggerButton(arg_23_0._tf:Find("PauseBtn"))
	end

	setActive(arg_23_0._chatBtn, var_23_0:ChatUseable())
end

function var_0_0.onBackPressed(arg_33_0)
	if isActive(arg_33_0.pauseWindow) then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		triggerButton(arg_33_0.continueBtn)
	end
end

function var_0_0.activeBotHelp(arg_34_0, arg_34_1)
	local var_34_0 = getProxy(PlayerProxy)

	if not arg_34_1 then
		if arg_34_0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if var_34_0.botHelp then
		return
	end

	arg_34_0.autoBotHelp = true

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
			arg_34_0.autoBotHelp = false
		end
	})

	var_34_0.botHelp = true
end

function var_0_0.exitBattle(arg_36_0, arg_36_1)
	if not arg_36_1 then
		arg_36_0:emit(BattleMediator.ON_QUIT_BATTLE_MANUALLY)
		arg_36_0:emit(BattleMediator.ON_BACK_PRE_SCENE)
	elseif arg_36_1 == "kick" then
		-- block empty
	end
end

function var_0_0.setChapter(arg_37_0, arg_37_1)
	arg_37_0._chapter = arg_37_1
end

function var_0_0.setFleet(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	arg_38_0._mainShipVOs = arg_38_1
	arg_38_0._vanShipVOs = arg_38_2
	arg_38_0._subShipVOs = arg_38_3
end

function var_0_0.initPauseWindow(arg_39_0)
	arg_39_0.pauseWindow = arg_39_0._tf:Find("Msgbox")
	arg_39_0.LeftTimeContainer = arg_39_0.pauseWindow:Find("window/LeftTime")
	arg_39_0.LeftTime = arg_39_0.pauseWindow:Find("window/LeftTime/Text")
	arg_39_0.mainTFs = {}
	arg_39_0.vanTFs = {}

	setText(arg_39_0.LeftTimeContainer:Find("label"), i18n("battle_battleMediator_remainTime"))
	setText(arg_39_0.pauseWindow:Find("window/van/power/title"), i18n("word_vanguard_fleet"))
	setText(arg_39_0.pauseWindow:Find("window/main/power/title"), i18n("word_main_fleet"))

	local function var_39_0(arg_40_0, arg_40_1, arg_40_2)
		for iter_40_0 = 1, 3 do
			local var_40_0 = arg_40_1:Find("ship_" .. iter_40_0)

			setActive(var_40_0, arg_40_2 and iter_40_0 <= #arg_40_2)

			if arg_40_2 and iter_40_0 <= #arg_40_2 then
				updateShip(var_40_0, arg_40_2[iter_40_0])
			end

			table.insert(arg_40_0, var_40_0)
		end

		if arg_40_2 then
			local var_40_1 = 0

			for iter_40_1, iter_40_2 in ipairs(arg_40_2) do
				var_40_1 = var_40_1 + iter_40_2:getShipCombatPower()
			end

			setText(arg_40_1:Find("power/value"), var_40_1)
		end
	end

	local var_39_1 = ys.Battle.BattleState.GetInstance()
	local var_39_2 = var_39_1:GetBattleType()

	if arg_39_0._mainShipVOs then
		var_39_0(arg_39_0.mainTFs, arg_39_0.pauseWindow:Find("window/main"), arg_39_0._mainShipVOs)
		var_39_0(arg_39_0.vanTFs, arg_39_0.pauseWindow:Find("window/van"), arg_39_0._vanShipVOs)
	elseif var_39_2 == SYSTEM_SCENARIO_SUB_STRIKE then
		arg_39_0.subTFs = {}

		local var_39_3 = arg_39_0.pauseWindow:Find("window/main")

		setActive(arg_39_0.pauseWindow:Find("window/van"), false)
		setActive(arg_39_0.pauseWindow:Find("window/bg_fleet/Image (1)"), false)
		var_39_0(arg_39_0.subTFs, var_39_3, arg_39_0._subShipVOs)
		setText(var_39_3:Find("power/title"), i18n("index_shipType_qianTing"))

		local var_39_4 = var_39_3.localPosition

		var_39_3.localPosition = Vector3(0, var_39_4.y, 0)
	end

	local var_39_5 = findTF(arg_39_0.pauseWindow, "window/Chapter")
	local var_39_6 = findTF(arg_39_0.pauseWindow, "window/Chapter/Text")

	arg_39_0.continueBtn = arg_39_0.pauseWindow:Find("window/button_container/continue")
	arg_39_0.leaveBtn = arg_39_0.pauseWindow:Find("window/button_container/leave")

	setText(arg_39_0.continueBtn:Find("pic"), i18n("battle_battleMediator_goOnFight"))
	setText(arg_39_0.leaveBtn:Find("pic"), i18n("battle_battleMediator_existFight"))

	if var_39_2 == SYSTEM_SCENARIO or var_39_2 == SYSTEM_SCENARIO_SUB_STRIKE then
		local var_39_7 = arg_39_0._chapter:getConfigTable()

		setText(var_39_5, var_39_7.chapter_name)
		setText(var_39_6, string.split(var_39_7.name, "|")[1])
	elseif var_39_2 == SYSTEM_ROUTINE or var_39_2 == SYSTEM_DUEL or var_39_2 == SYSTEM_HP_SHARE_ACT_BOSS or var_39_2 == SYSTEM_BOSS_EXPERIMENT or var_39_2 == SYSTEM_ACT_BOSS or var_39_2 == SYSTEM_ACT_BOSS_SP or var_39_2 == SYSTEM_BOSS_RUSH or var_39_2 == SYSTEM_BOSS_RUSH_EX or var_39_2 == SYSTEM_BOSS_RUSH_COLLABRATE or var_39_2 == SYSTEM_LIMIT_CHALLENGE or var_39_2 == SYSTEM_BOSS_SINGLE or var_39_2 == SYSTEM_BOSS_SINGLE_VARIABLE then
		setText(var_39_5, "SP")

		local var_39_8 = var_39_1:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().StageTmpId
		local var_39_9 = pg.expedition_data_template[var_39_8]

		setText(var_39_6, var_39_9.name)
	elseif var_39_2 == SYSTEM_DEBUG then
		setText(var_39_5, "??")
		setText(var_39_6, "碧蓝梦境")
	elseif var_39_2 == SYSTEM_CHALLENGE then
		local var_39_10 = arg_39_0._chapter:getNextExpedition()

		setText(var_39_5, "SP")
		setText(var_39_6, var_39_10.chapter_name[2])
		setActive(arg_39_0.LeftTimeContainer, true)
	elseif var_39_2 == SYSTEM_WORLD_BOSS or var_39_2 == SYSTEM_WORLD then
		setText(var_39_5, i18n("world_battle_pause"))
		setText(var_39_6, i18n("world_battle_pause2"))

		if var_39_2 == SYSTEM_WORLD_BOSS then
			setActive(arg_39_0.leaveBtn, false)
		end
	elseif var_39_2 == SYSTEM_GUILD then
		local var_39_11 = var_39_1:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().ActID
		local var_39_12 = pg.guild_boss_event[var_39_11]

		setText(var_39_5, "BOSS")
		setText(var_39_6, var_39_12 and var_39_12.name or "")
	elseif var_39_2 == SYSTEM_TEST or var_39_2 == SYSTEM_SUB_ROUTINE or var_39_2 == SYSTEM_SCENARIO_SUB_STRIKE or var_39_2 == SYSTEM_PERFORM or var_39_2 == SYSTEM_PROLOGUE or var_39_2 == SYSTEM_DODGEM or var_39_2 == SYSTEM_SIMULATION or var_39_2 == SYSTEM_SUBMARINE_RUN or var_39_2 == SYSTEM_BOSS_EXPERIMENT or var_39_2 == SYSTEM_REWARD_PERFORM or var_39_2 == SYSTEM_AIRFIGHT then
		-- block empty
	elseif var_39_2 == SYSTEM_CARDPUZZLE then
		-- block empty
	else
		assert(false, "System not defined " .. (var_39_2 or "NIL"))
	end

	onButton(arg_39_0, arg_39_0.leaveBtn, function()
		arg_39_0:emit(BattleMediator.ON_LEAVE)

		local var_41_0 = arg_39_0.leaveBtn:GetComponent(typeof(Animation))

		if var_41_0 and var_41_0:GetClip("msgbox_btn_blink") then
			var_41_0:Play("msgbox_btn_blink")
		end
	end)
	onButton(arg_39_0, arg_39_0.continueBtn, function()
		local var_42_0 = arg_39_0.continueBtn:GetComponent(typeof(Animation))

		if var_42_0 and var_42_0:GetClip("msgbox_btn_blink") then
			var_42_0:Play("msgbox_btn_blink")
		end

		local var_42_1 = arg_39_0.pauseWindow:GetComponent(typeof(Animation))

		if var_42_1 then
			if var_42_1:IsPlaying("msgbox_out") then
				var_42_1:Stop("msgbox_out")
				var_42_1:Play("msgbox_in")
			else
				var_42_1:Play("msgbox_out")
				arg_39_0.pauseWindow:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_43_0)
					arg_39_0:ClosePauseWindow()
					var_39_1:Resume()
				end)
			end
		else
			arg_39_0:ClosePauseWindow()
			var_39_1:Resume()
		end
	end)
	onButton(arg_39_0, arg_39_0.pauseWindow:Find("help"), function()
		if BATTLE_DEBUG and PLATFORM == 7 then
			arg_39_0:ClosePauseWindow()
			var_39_1:Resume()
			var_39_1:OpenConsole()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_battle_rule")
			})
		end
	end)
	onButton(arg_39_0, arg_39_0.pauseWindow:Find("window/top/btnBack"), function()
		triggerButton(arg_39_0.continueBtn)
	end)
	onButton(arg_39_0, arg_39_0.pauseWindow, function()
		triggerButton(arg_39_0.continueBtn)
	end)
	onButton(arg_39_0, arg_39_0.pauseWindow, function()
		local var_47_0 = arg_39_0.pauseWindow:GetComponent(typeof(Animation))

		if var_47_0 and var_47_0:IsPlaying("msgbox_out") then
			-- block empty
		else
			triggerButton(arg_39_0.continueBtn)
		end
	end)
	setActive(arg_39_0.pauseWindow, false)
end

function var_0_0.updatePauseWindow(arg_48_0)
	if not arg_48_0.pauseWindow then
		return
	end

	setActive(arg_48_0.pauseWindow, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_48_0.pauseWindow)

	local var_48_0 = ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name)
	local var_48_1 = var_48_0:GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE)

	local function var_48_2(arg_49_0, arg_49_1)
		if not arg_49_0 then
			return
		end

		for iter_49_0 = 1, #arg_49_0 do
			local var_49_0 = arg_49_0[iter_49_0].id

			if var_48_1:GetFreezeShipByID(var_49_0) then
				local var_49_1 = var_48_1:GetFreezeShipByID(var_49_0)

				setSlider(arg_49_1[iter_49_0]:Find("blood"), 0, 1, var_49_1:GetHPRate())
				SetActive(arg_49_1[iter_49_0]:Find("mask"), false)
			elseif var_48_1:GetShipByID(var_49_0) then
				local var_49_2 = var_48_1:GetShipByID(var_49_0)

				setSlider(arg_49_1[iter_49_0]:Find("blood"), 0, 1, var_49_2:GetHPRate())
				SetActive(arg_49_1[iter_49_0]:Find("mask"), false)
			else
				setSlider(arg_49_1[iter_49_0]:Find("blood"), 0, 1, 0)
				SetActive(arg_49_1[iter_49_0]:Find("mask"), true)
			end
		end
	end

	var_48_2(arg_48_0._mainShipVOs, arg_48_0.mainTFs)
	var_48_2(arg_48_0._vanShipVOs, arg_48_0.vanTFs)

	if arg_48_0.subTFs then
		var_48_2(arg_48_0._subShipVOs, arg_48_0.subTFs)
	end

	setText(arg_48_0.LeftTime, ys.Battle.BattleTimerView.formatTime(math.floor(var_48_0:GetCountDown())))
end

function var_0_0.ClosePauseWindow(arg_50_0)
	setActive(arg_50_0.pauseWindow, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_50_0.pauseWindow, arg_50_0._tf)
end

function var_0_0.AddUIFX(arg_51_0, arg_51_1, arg_51_2)
	arg_51_2 = arg_51_2 or 1

	local var_51_0 = arg_51_2 > 0

	arg_51_1 = tf(arg_51_1)

	local var_51_1 = var_51_0 and arg_51_0._fxContainerUpper or arg_51_0._fxContainerBottom

	arg_51_1:SetParent(var_51_1)
	pg.ViewUtils.SetSortingOrder(arg_51_1, arg_51_0._canvasOrder + arg_51_2)
	pg.ViewUtils.SetLayer(arg_51_1, Layer.UI)

	return var_51_1.localScale
end

function var_0_0.OnCloseChat(arg_52_0)
	local var_52_0 = ys.Battle.BattleState.GetInstance():IsBotActive()
	local var_52_1 = arg_52_0._chatBtn:GetComponent(typeof(Animation))

	if var_52_0 then
		setActive(arg_52_0._chatBtn, true)

		if var_52_1 then
			var_52_1:Play("chatbtn_in")
		end
	elseif var_52_1 then
		var_52_1:Play("chatbtn_out")
	else
		setActive(arg_52_0._chatBtn, false)
	end
end

function var_0_0.clear(arg_53_0)
	arg_53_0._preSkillTF = nil

	arg_53_0._skillFloatPool:AllRecycle()
	arg_53_0._skillFloatCMDPool:AllRecycle()

	arg_53_0._preCommanderSkillTF = nil
	arg_53_0._commanderSkillList = nil
	arg_53_0._skillPaintings = nil
	arg_53_0._currentPainting = nil

	Destroy(arg_53_0._paintingUI)
end

function var_0_0.willExit(arg_54_0)
	arg_54_0._skillFloatPool:Dispose()
	arg_54_0._skillFloatCMDPool:Dispose()
	ys.Battle.BattleState.GetInstance():ExitBattle()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_54_0.pauseWindow, arg_54_0._tf)
	ys.Battle.BattleCameraUtil.GetInstance().ActiveMainCamera(false)
	pg.CameraFixMgr.GetInstance():disconnect(arg_54_0.camEventId)
end

return var_0_0
