local var_0_0 = class("CombatUIPreviewer")
local var_0_1 = {
	LOOP = 3,
	FILLED = 2,
	UNFILLED = 1,
	USABLE = 4
}

var_0_0.WeaponButtonPreviewMode = var_0_1
var_0_0.EnableLoop = true
var_0_0.LoopWeaponButtons = {
	3
}

local var_0_2 = Vector3(0, 1, 40)
local var_0_3 = Vector3(35, 1, 40)
local var_0_4 = Vector3(30, 0, 0)
local var_0_5 = Vector3(330, 0, 0)
local var_0_6 = Vector3(-532, 157, 0)
local var_0_7 = Vector3(-665, 70, -675)
local var_0_8 = Vector3(473, 157, 0)
local var_0_9 = Vector3(-791, 70, 0)
local var_0_10 = Vector3(464, 70, -675)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.rawImage = arg_1_1

	setActive(arg_1_0.rawImage, false)

	arg_1_0.seaCameraGO = GameObject.Find("BarrageCamera")
	arg_1_0.seaCamera = arg_1_0.seaCameraGO:GetComponent(typeof(Camera))
	arg_1_0.seaCamera.targetTexture = arg_1_0.rawImage.texture
	arg_1_0.seaCamera.enabled = true
end

function var_0_0.setDisplayWeapon(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.weaponIds = arg_2_1
	arg_2_0.equipSkinId = arg_2_2 or 0
end

function var_0_0.setHeroHpBarOffset(arg_3_0, arg_3_1)
	arg_3_0.heroHpBarOffset = arg_3_1
end

function var_0_0.setEnemyHpBarOffset(arg_4_0, arg_4_1)
	arg_4_0.enemyHpBarOffset = arg_4_1
end

function var_0_0.setCombatUI(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	arg_5_0.uiGO = arg_5_1
	arg_5_0.hpBarGO = arg_5_2
	arg_5_0.enemyBarGO = arg_5_3
	arg_5_0.skinKey = arg_5_4

	local var_5_0 = arg_5_1.transform

	arg_5_0.uiTF = var_5_0
	arg_5_0.chatPop = var_5_0:Find("popup")
	arg_5_0.chatPopGo = arg_5_0.chatPop.gameObject

	setActive(arg_5_0.chatPop, false)

	arg_5_0.flagShipMark = var_5_0:Find("flagShipMark")
	arg_5_0.timer = var_5_0:Find("Timer")

	setActive(arg_5_0.timer, true)
	setText(arg_5_0.timer:Find("Text"), "03:00")

	arg_5_0.buttonContainer = var_5_0:Find("Weapon_button_container")
	arg_5_0.weaponButtons = {}

	local var_5_1 = {
		var_0_1.UNFILLED,
		var_0_1.FILLED,
		var_0_1.LOOP
	}

	for iter_5_0 = 1, 3 do
		local var_5_2

		if ys.Battle["BattleWeaponButton" .. arg_5_0.skinKey] then
			var_5_2 = ys.Battle["BattleWeaponButton" .. arg_5_0.skinKey].New()
		else
			var_5_2 = ys.Battle.BattleWeaponButton.New()
		end

		local var_5_3 = cloneTplTo(var_5_0:Find("Weapon_button_progress"), arg_5_0.buttonContainer)

		ys.Battle.BattleSkillView.SetSkillButtonPreferences(var_5_3, iter_5_0)
		var_5_2:ConfigSkin(var_5_3)
		var_5_2:SwitchIcon(iter_5_0, arg_5_4)
		var_5_2:SwitchIconEffect(iter_5_0, arg_5_4)
		var_5_2:SetTextActive(true)
		var_5_2:SetToCombatUIPreview(var_5_1[iter_5_0])
		table.insert(arg_5_0.weaponButtons, var_5_2)

		if iter_5_0 == 3 then
			local var_5_4 = GetOrAddComponent(go(var_5_3), typeof(UnityEngine.Playables.PlayableDirector))

			if var_5_4 then
				var_5_4.enabled = true
			end
		end
	end

	arg_5_0.submarineButton = (ys.Battle["BattleSubmarineButton" .. arg_5_0.skinKey] or ys.Battle.BattleSubmarineButton).New()

	local var_5_5 = cloneTplTo(var_5_0:Find("Weapon_button"), arg_5_0.buttonContainer)

	arg_5_0.submarineButton:ConfigSkin(var_5_5)
	arg_5_0.submarineButton:SwitchIcon(4, arg_5_4)
	ys.Battle.BattleSkillView.SetSkillButtonPreferences(var_5_5, 4)
	arg_5_0.submarineButton:SetToCombatUIPreview(var_0_1.USABLE)

	arg_5_0.heroBar = arg_5_2.transform

	setActive(arg_5_0.heroBar:Find("heroBlood"), true)

	arg_5_0.enemyBar = arg_5_0.enemyBarGO.transform

	setActive(arg_5_0.enemyBar:Find("enemyBlood"), true)
	arg_5_0:updateBarPos()

	arg_5_0.mainArrow = var_5_0:Find("EnemyArrowContainer/MainArrow")

	setActive(arg_5_0.mainArrow, true)

	arg_5_0.autoBtn = var_5_0:Find("AutoBtn")

	setActive(arg_5_0.autoBtn, true)
	triggerToggle(arg_5_0.autoBtn, true)

	arg_5_0.enemyHPBar = var_5_0:Find("EnemyHPBar")

	setActive(arg_5_0.enemyHPBar, false)

	arg_5_0.bossHPBar = var_5_0:Find("BossBarContainer/heroBlood")

	setActive(arg_5_0.bossHPBar, true)

	local var_5_6 = arg_5_0.bossHPBar:Find("bloodBarContainer")
	local var_5_7 = var_5_6.childCount - 1

	for iter_5_1 = 0, var_5_7 do
		var_5_6:GetChild(iter_5_1):GetComponent(typeof(Image)).fillAmount = 1
		iter_5_1 = iter_5_1 + 1
	end

	arg_5_0.skillContainer = var_5_0:Find("Skill_Activation/Root")
	arg_5_0.skill = var_5_0:Find("Skill_Activation/mask")

	local var_5_8 = var_5_0:Find("Stick/Area/BG/spine")

	if var_5_8 then
		var_5_8:GetComponent(typeof(SpineAnimUI)):SetAction("normal", 0)
	end

	arg_5_0.stick = var_5_0:Find("Stick/Area/Stick")
	arg_5_0.stickTail = arg_5_0.stick:Find("tailGizmos")
end

function var_0_0.load(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
	assert(not arg_6_0.loading and not arg_6_0.loaded, "load function can be called only once.")

	arg_6_0.loading = true
	arg_6_0.shipVO = arg_6_2
	arg_6_0.enemyVO = arg_6_3

	ys.Battle.BattleVariable.Init(true)
	ys.Battle.BattleVariable.UpdateCameraPositionArgs()
	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_6_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_6_0:Init()
	var_6_0:AddPreloadResource(var_6_0.GetUIPath("CombatHPPop" .. arg_6_0.skinKey))
	var_6_0:AddPreloadResource(var_6_0.GetMapResource(arg_6_1))
	var_6_0:AddPreloadResource(var_6_0.GetDisplayCommonResource())

	if arg_6_0.equipSkinId > 0 then
		var_6_0:AddPreloadResource(var_6_0.GetEquipSkinPreviewRes(arg_6_0.equipSkinId))
	end

	var_6_0:AddPreloadResource(var_6_0.GetShipResource(arg_6_2.configId, arg_6_2.skinId), false)
	var_6_0:AddPreloadResource(var_6_0.GetShipResource(arg_6_3.configId, arg_6_3.skinId), false)

	local function var_6_1()
		arg_6_0.seaView = ys.Battle.BattleMap.New(arg_6_1)

		local function var_7_0(arg_8_0)
			arg_6_0.loading = false
			arg_6_0.loaded = true

			pg.UIMgr.GetInstance():LoadingOff()

			local var_8_0 = ys.Battle.BattleFXPool.GetInstance()

			arg_6_0.seaFXPool = var_8_0

			local var_8_1 = pg.ship_skin_template[arg_6_2.skinId].fx_container
			local var_8_2 = {}

			for iter_8_0, iter_8_1 in ipairs(ys.Battle.BattleConst.FXContainerIndex) do
				local var_8_3 = var_8_1[iter_8_0]

				var_8_2[iter_8_0] = Vector3(var_8_3[1], var_8_3[2], var_8_3[3])
			end

			local var_8_4 = arg_6_2:getConfig("scale") / 50

			local function var_8_5(arg_9_0, arg_9_1)
				local var_9_0 = arg_9_0.transform

				if arg_9_1 then
					var_9_0.localScale = Vector3(var_8_4 * -1, var_8_4, var_8_4)
				else
					var_9_0.localScale = Vector3(var_8_4, var_8_4, var_8_4)
				end

				var_9_0.localEulerAngles = var_0_4

				var_9_0:GetComponent("SpineAnim"):SetAction(ys.Battle.BattleConst.ActionName.MOVE, 0, true)

				local var_9_1 = GameObject()
				local var_9_2 = var_9_1.transform

				var_9_2:SetParent(var_9_0, false)

				var_9_2.localPosition = Vector3.zero
				var_9_2.localEulerAngles = var_0_5

				local var_9_3 = {
					GetGO = function()
						return arg_6_0.seaCharacter
					end,
					GetSpecificFXScale = function()
						return {}
					end,
					GetAttachPoint = function()
						return var_9_1
					end,
					GetFXOffsets = function(arg_13_0, arg_13_1)
						arg_13_1 = arg_13_1 or 1

						return var_8_2[arg_13_1]
					end
				}
				local var_9_4 = var_8_0:GetCharacterFX("movewave", var_9_3)

				pg.EffectMgr.GetInstance():PlayBattleEffect(var_9_4, Vector3.zero, true)
			end

			arg_6_0.seaCharacter = arg_8_0

			var_8_5(arg_6_0.seaCharacter)

			arg_6_0.seaCharacter.transform.localPosition = var_0_2

			arg_6_0:SeaUpdate()

			local var_8_6 = ys.Battle.BattleResourceManager.GetInstance():GetCharacterSquareIcon(arg_6_0.enemyVO:getPrefab())
			local var_8_7 = ys.Battle.BattleResourceManager.GetInstance():GetCharacterQIcon(arg_6_0.shipVO:getPrefab())
			local var_8_8 = findTF(arg_6_0.mainArrow, "icon")

			setImageSprite(var_8_8, var_8_7)
			setImageSprite(findTF(arg_6_0.bossHPBar, "BossIcon/icon"), var_8_6)
			setText(findTF(arg_6_0.bossHPBar, "BossNameBG/BossName"), ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(arg_6_0.enemyVO.configId).name)
			setActive(arg_6_0.rawImage, true)
			pg.TimeMgr.GetInstance():ResumeBattleTimer()
			arg_6_5()
		end

		local function var_7_1(arg_14_0)
			local var_14_0 = ys.Battle.BattleFXPool.GetInstance()

			arg_6_0.seaFXPool = var_14_0

			local var_14_1 = pg.ship_skin_template[arg_6_3.skinId].fx_container
			local var_14_2 = {}

			for iter_14_0, iter_14_1 in ipairs(ys.Battle.BattleConst.FXContainerIndex) do
				local var_14_3 = var_14_1[iter_14_0]

				var_14_2[iter_14_0] = Vector3(var_14_3[1], var_14_3[2], var_14_3[3])
			end

			local var_14_4 = arg_6_3:getConfig("scale") / 50

			local function var_14_5(arg_15_0, arg_15_1)
				local var_15_0 = arg_15_0.transform

				if arg_15_1 then
					var_15_0.localScale = Vector3(var_14_4 * -1, var_14_4, var_14_4)
				else
					var_15_0.localScale = Vector3(var_14_4, var_14_4, var_14_4)
				end

				var_15_0.localEulerAngles = var_0_4

				var_15_0:GetComponent("SpineAnim"):SetAction(ys.Battle.BattleConst.ActionName.MOVE, 0, true)

				local var_15_1 = GameObject()
				local var_15_2 = var_15_1.transform

				var_15_2:SetParent(var_15_0, false)

				var_15_2.localPosition = Vector3.zero
				var_15_2.localEulerAngles = var_0_5

				local var_15_3 = {
					GetGO = function()
						return arg_6_0.seaCharacter
					end,
					GetSpecificFXScale = function()
						return {}
					end,
					GetAttachPoint = function()
						return var_15_1
					end,
					GetFXOffsets = function(arg_19_0, arg_19_1)
						arg_19_1 = arg_19_1 or 1

						return var_14_2[arg_19_1]
					end
				}
				local var_15_4 = var_14_0:GetCharacterFX("movewave", var_15_3)

				pg.EffectMgr.GetInstance():PlayBattleEffect(var_15_4, Vector3.zero, true)
			end

			arg_6_0.seaEnemy = arg_14_0

			var_14_5(arg_6_0.seaEnemy, true)

			arg_6_0.seaEnemy.transform.localPosition = var_0_3
		end

		var_6_0:InstCharacter(arg_6_3:getPrefab(), function(arg_20_0)
			var_7_1(arg_20_0)
		end)
		var_6_0:InstCharacter(arg_6_2:getPrefab(), function(arg_21_0)
			var_7_0(arg_21_0)
		end)
	end

	var_6_0:StartPreload(var_6_1, nil)
	pg.UIMgr.GetInstance():LoadingOn()
end

local var_0_11 = 0.033

function var_0_0.loop(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0._roundTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_22_0._roundTimer)

		arg_22_0._roundTimer = nil
	end

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.weaponButtons) do
		iter_22_1:StopCombatUIPreviewLoop()
	end

	if not arg_22_1 or #arg_22_0.weaponButtons == 0 then
		return
	end

	if arg_22_1 and table.isEmpty(arg_22_2) then
		arg_22_2 = {}

		for iter_22_2, iter_22_3 in ipairs(arg_22_0.weaponButtons) do
			table.insert(arg_22_2, iter_22_2)
		end
	end

	for iter_22_4, iter_22_5 in ipairs(arg_22_2) do
		arg_22_0.weaponButtons[iter_22_5]:StartCombatUIPreviewLoop()
	end

	local function var_22_0()
		for iter_23_0, iter_23_1 in ipairs(arg_22_2) do
			arg_22_0.weaponButtons[iter_23_1]:UpdateCombatUIPreviewLoop(var_0_11)
		end
	end

	arg_22_0._roundTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponButtonRoundTimer", -1, var_0_11, var_22_0)
end

function var_0_0.updateBarPos(arg_24_0)
	if arg_24_0.seaCharacter then
		arg_24_0.heroBar.localPosition = arg_24_0.heroHpBarOffset or var_0_6
		arg_24_0.flagShipMark.localPosition = var_0_7
	end

	if arg_24_0.seaEnemy then
		arg_24_0.enemyBar.localPosition = arg_24_0.enemyHpBarOffset or var_0_8
	end
end

function var_0_0.updatePopUp(arg_25_0)
	setActive(arg_25_0.chatPop, true)

	arg_25_0.chatPop.localPosition = var_0_9

	LeanTween.cancel(arg_25_0.chatPop)

	if arg_25_0.chatPop.transform:GetComponent(typeof(Animation)) then
		ys.Battle.BattleCharacter.ChatPopAnimation(arg_25_0.chatPop, 4)
		ys.Battle.BattleCharacter.setChatText(arg_25_0.chatPop, pg.ship_skin_words[100000].skill)
	else
		LeanTween.scale(rtf(arg_25_0.chatPop.gameObject), Vector3.New(0, 0, 1), 0.1):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function()
			ys.Battle.BattleCharacter.ChatPop(arg_25_0.chatPop, 5)
			ys.Battle.BattleCharacter.setChatText(arg_25_0.chatPop, pg.ship_skin_words[100000].skill)
		end))
	end
end

function var_0_0.updateSkillFloat(arg_27_0)
	setActive(arg_27_0.skill, true)

	local var_27_0 = ys.Battle.BattleResourceManager.GetInstance()
	local var_27_1

	if arg_27_0.skinKey == "Standard" then
		var_27_1 = var_27_0:GetCharacterIcon(arg_27_0.shipVO:getPrefab())
	else
		var_27_1 = var_27_0:GetCharacterSquareIcon(arg_27_0.shipVO:getPrefab())
	end

	local var_27_2 = arg_27_0.skill.transform

	arg_27_0.skill.localScale = Vector3(1.5, 1.5, 0)

	local var_27_3 = var_27_2:GetComponent(typeof(Animation))

	if var_27_3 then
		local var_27_4 = 1

		while var_27_3:GetClip("anim_skinui_skill_" .. var_27_4) do
			var_27_4 = var_27_4 + 1
		end

		if var_27_4 > 1 then
			var_27_3:Play("anim_skinui_skill_" .. math.random(var_27_4 - 1))
		end
	end

	setText(findTF(var_27_2, "skill/skill_name/Text"), HXSet.hxLan(pg.skill_data_template[9033].name))

	local var_27_5 = findTF(var_27_2, "skill/icon_mask/icon")
	local var_27_6 = findTF(var_27_2, "skill/skill_name")

	var_27_5:GetComponent(typeof(Image)).sprite = var_27_1

	local var_27_7 = Color.New(1, 1, 1, 1)

	var_27_6:GetComponent(typeof(Image)).color = var_27_7
	findTF(var_27_2, "skill"):GetComponent(typeof(Image)).color = var_27_7

	var_27_2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_28_0)
		setActive(arg_27_0.skill, false)
	end)

	var_27_2.position = Clone(arg_27_0.heroBar.position)
end

function var_0_0.updateHPPop(arg_29_0)
	if not arg_29_0._popNumMgr then
		arg_29_0._popNumMgr = ys.Battle.BattlePopNumManager.GetInstance()

		arg_29_0._popNumMgr:InitialBundlePool(arg_29_0.uiGO.transform:Find("HPTextCharacterContainer/container"))

		arg_29_0._popNumBundle = arg_29_0._popNumMgr:GetBundle()
	end

	local var_29_0 = math.random(1, 4)
	local var_29_1 = math.random(1, 2) > 1
	local var_29_2 = arg_29_0._popNumBundle:GetPop(false, var_29_1, false, 114, {
		var_29_0,
		1
	})

	var_29_2._tf.localPosition = var_0_10

	var_29_2:Play()
end

local var_0_12 = 250
local var_0_13 = 50
local var_0_14 = 1000
local var_0_15 = 2
local var_0_16 = 3

function var_0_0.updateStick(arg_30_0)
	if arg_30_0._stickMoveCount and arg_30_0._stickMoveCount <= var_0_12 then
		arg_30_0._stickMoveCount = arg_30_0._stickMoveCount + 1

		local var_30_0 = arg_30_0.stickVX + arg_30_0.stick.localPosition.x
		local var_30_1 = arg_30_0.stickVY + arg_30_0.stick.localPosition.y

		if var_30_0 * var_30_0 + var_30_1 * var_30_1 > var_0_14 * 2 then
			local var_30_2 = math.atan2(var_30_1, var_30_0)
			local var_30_3
			local var_30_4
			local var_30_5 = var_0_14 * math.cos(var_30_2)
			local var_30_6 = var_0_14 * math.sin(var_30_2)
			local var_30_7 = var_30_5 / var_0_14
			local var_30_8 = var_30_6 / var_0_14
			local var_30_9 = math.random() * 2 * math.pi
			local var_30_10 = math.random(var_0_15, var_0_16)

			arg_30_0.stickVX = math.cos(var_30_9) * var_30_10
			arg_30_0.stickVY = math.sin(var_30_9) * var_30_10

			if arg_30_0.stickVX * var_30_7 + arg_30_0.stickVY * var_30_8 > 0 then
				arg_30_0.stickVX = -arg_30_0.stickVX
				arg_30_0.stickVY = -arg_30_0.stickVY
			end
		else
			arg_30_0.stickPos.x = var_30_0
			arg_30_0.stickPos.y = var_30_1
			arg_30_0.stick.localPosition = arg_30_0.stickPos
		end

		if arg_30_0._stickMoveCount >= var_0_12 then
			if arg_30_0.stickTail then
				setActive(arg_30_0.stickTail, false)
			end

			arg_30_0.stick.localPosition = Vector3.zero
			arg_30_0._stickMoveCount = nil
			arg_30_0._stickStopCount = 0
		end
	elseif arg_30_0._stickStopCount and arg_30_0._stickStopCount <= var_0_13 then
		arg_30_0._stickStopCount = arg_30_0._stickStopCount + 1

		if arg_30_0._stickStopCount >= var_0_13 then
			if arg_30_0.stickTail then
				setActive(arg_30_0.stickTail, true)
			end

			local var_30_11 = math.random() * 2 * math.pi
			local var_30_12 = math.random(var_0_15, var_0_16)

			arg_30_0.stickVX = math.cos(var_30_11) * var_30_12
			arg_30_0.stickVY = math.cos(var_30_11) * var_30_12
			arg_30_0._stickStopCount = nil
			arg_30_0._stickMoveCount = 0
		end
	end
end

function var_0_0.SeaUpdate(arg_31_0)
	local function var_31_0()
		arg_31_0:updateBarPos()
	end

	pg.TimeMgr.GetInstance():AddBattleTimer("barrageUpdateTimer", -1, 0.033, var_31_0)

	arg_31_0._stickStopCount = 0
	arg_31_0.stickPos = Vector2.New(0, 0)

	local function var_31_1()
		arg_31_0:updateStick()
	end

	pg.TimeMgr.GetInstance():AddBattleTimer("stickUpdateTimer", -1, 0.033, var_31_1)

	local function var_31_2()
		arg_31_0:updatePopUp()
	end

	pg.TimeMgr.GetInstance():AddBattleTimer("popupUpdateTimer", -1, 10, var_31_2)

	local function var_31_3()
		arg_31_0:updateSkillFloat()
	end

	pg.TimeMgr.GetInstance():AddBattleTimer("skillFloatUpdateTimer", -1, 10, var_31_3)

	local function var_31_4()
		arg_31_0:updateHPPop()
	end

	pg.TimeMgr.GetInstance():AddBattleTimer("HPPopUpdateTimer", -1, 3, var_31_4)
	arg_31_0:loop(var_0_0.EnableLoop, var_0_0.LoopWeaponButtons)
end

function var_0_0.clear(arg_37_0)
	if arg_37_0.weaponButtons then
		arg_37_0:loop(false)
	end

	pg.TimeMgr.GetInstance():RemoveAllBattleTimer()

	arg_37_0._roundTimer = nil
	arg_37_0.weaponButtons = {}
	arg_37_0.submarineButton = nil

	if arg_37_0.chatPop then
		LeanTween.cancel(go(arg_37_0.chatPop))
	end

	Destroy(arg_37_0.seaCharacter)
	Destroy(arg_37_0.seaEnemy)
	Destroy(arg_37_0.uiGO)
	Destroy(arg_37_0.hpBarGO)
	Destroy(arg_37_0.enemyBarGO)

	if arg_37_0.seaView then
		arg_37_0.seaView:Dispose()

		arg_37_0.seaView = nil
	end

	if arg_37_0._popNumMgr then
		arg_37_0._popNumMgr:Clear()
	end

	if arg_37_0.weaponList then
		for iter_37_0, iter_37_1 in ipairs(arg_37_0.weaponList) do
			for iter_37_2, iter_37_3 in ipairs(iter_37_1.emitterList) do
				iter_37_3:Destroy()
			end
		end

		arg_37_0.weaponList = nil
	end

	if arg_37_0.seaFXPool then
		arg_37_0.seaFXPool:Clear()

		arg_37_0.seaFXPool = nil
	end

	if arg_37_0.seaFXContainersPool then
		arg_37_0.seaFXContainersPool:Clear()

		arg_37_0.seaFXContainersPool = nil
	end

	ys.Battle.BattleResourceManager.GetInstance():Clear()

	arg_37_0.seaCamera.enabled = true
	arg_37_0.seaCameraGO = nil
	arg_37_0.seaCamera = nil
	arg_37_0.heroHpBarOffset = nil
	arg_37_0.enemyHpBarOffset = nil
	arg_37_0.loading = false
	arg_37_0.loaded = false
end

return var_0_0
