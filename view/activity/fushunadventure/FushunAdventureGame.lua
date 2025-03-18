local var_0_0 = class("FushunAdventureGame")
local var_0_1 = false
local var_0_2 = 0
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3
local var_0_6 = 4

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.state = var_0_2
	arg_1_0._go = arg_1_1
	arg_1_0.gameData = arg_1_2
	arg_1_0.highestScore = (arg_1_3:GetRuntimeData("elements") or {})[1] or 0

	arg_1_0:Init()
end

function var_0_0.SetOnShowResult(arg_2_0, arg_2_1)
	arg_2_0.OnShowResult = arg_2_1
end

function var_0_0.SetOnLevelUpdate(arg_3_0, arg_3_1)
	arg_3_0.OnLevelUpdate = arg_3_1
end

function var_0_0.setRoomTip(arg_4_0, arg_4_1)
	arg_4_0.helpTip = arg_4_1
end

function var_0_0.setRoomId(arg_5_0, arg_5_1)
	arg_5_0.roomId = arg_5_1
end

function var_0_0.Init(arg_6_0)
	if arg_6_0.state ~= var_0_2 then
		return
	end

	arg_6_0.state = var_0_4

	arg_6_0:InitMainUI()

	arg_6_0.helpTip = pg.gametip.fushun_adventure_help.tip
end

function var_0_0.loadPrefab(arg_7_0, arg_7_1, arg_7_2)
	ResourceMgr.Inst:getAssetAsync(arg_7_1, "", function(arg_8_0)
		arg_7_2(instantiate(arg_8_0))
	end, true, true)
end

function var_0_0.InitMainUI(arg_9_0)
	local var_9_0 = arg_9_0._go

	onButton(arg_9_0, findTF(var_9_0, "btn_help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = arg_9_0.helpTip
		})
	end, SFX_PANEL)
	onButton(arg_9_0, findTF(var_9_0, "btn_start"), function()
		pg.BgmMgr.GetInstance():StopPlay()
		arg_9_0:StartGame()
	end, SFX_PANEL)

	arg_9_0.levelList = UIItemList.New(findTF(var_9_0, "levels/scrollrect/content"), findTF(var_9_0, "levels/scrollrect/content/level"))
	arg_9_0.arrUp = findTF(var_9_0, "levels/arr_up")
	arg_9_0.arrDown = findTF(var_9_0, "levels/arr_bottom")

	onScroll(arg_9_0, findTF(var_9_0, "levels/scrollrect"), function(arg_12_0)
		setActive(arg_9_0.arrUp, arg_12_0.y < 1)
		setActive(arg_9_0.arrDown, arg_12_0.y > 0)
	end)
	arg_9_0:RefreshLevels()
end

function var_0_0.RefreshLevels(arg_13_0)
	local var_13_0

	arg_13_0.levelList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			arg_14_2:Find("Text"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/minigameui/FushunAdventureGame_atlas", "level_" .. arg_14_1 + 1)

			local var_14_0 = arg_13_0.gameData.count > 0 and 1 or 0
			local var_14_1 = arg_14_1 >= arg_13_0.gameData.usedtime + var_14_0

			setActive(arg_14_2:Find("lock"), var_14_1)

			local var_14_2 = arg_14_1 < arg_13_0.gameData.usedtime

			setActive(arg_14_2:Find("cleared"), var_14_2)
			setActive(arg_14_2:Find("Text"), not var_14_1)

			if not var_14_2 and not var_13_0 then
				var_13_0 = arg_14_1
			end

			arg_14_2:GetComponent(typeof(Image)).enabled = not var_14_1
		end
	end)
	arg_13_0.levelList:align(FushunAdventureGameConst.LEVEL_CNT)
	setActive(findTF(arg_13_0._go, "tip/got"), arg_13_0.gameData.ultimate ~= 0)

	if var_13_0 then
		local var_13_1 = var_13_0 * (arg_13_0.levelList.item.rect.height + 50)
		local var_13_2 = arg_13_0.levelList.container.anchoredPosition

		setAnchoredPosition(arg_13_0.levelList.container, {
			y = var_13_2.y + var_13_1
		})
	end

	if arg_13_0.OnLevelUpdate then
		arg_13_0.OnLevelUpdate()
	end
end

function var_0_0.InitGameUI(arg_15_0)
	local var_15_0 = arg_15_0.gameUI

	arg_15_0.btnA = findTF(var_15_0, "UI/A")
	arg_15_0.btnB = findTF(var_15_0, "UI/B")
	arg_15_0.btnAEffect = arg_15_0.btnA:Find("effect")
	arg_15_0.btnBEffect = arg_15_0.btnB:Find("effect")
	arg_15_0.btnAExEffect = arg_15_0.btnA:Find("effect_ex")
	arg_15_0.btnBExEffect = arg_15_0.btnB:Find("effect_ex")
	arg_15_0.keys = {
		findTF(var_15_0, "UI/keys/1"):GetComponent(typeof(Image)),
		findTF(var_15_0, "UI/keys/2"):GetComponent(typeof(Image)),
		findTF(var_15_0, "UI/keys/3"):GetComponent(typeof(Image))
	}
	arg_15_0.btnSprites = {
		arg_15_0.keys[1].sprite,
		arg_15_0.btnA:GetComponent(typeof(Image)).sprite,
		arg_15_0.btnB:GetComponent(typeof(Image)).sprite
	}
	arg_15_0.hearts = {
		findTF(var_15_0, "UI/heart_score/hearts/1/mark"),
		findTF(var_15_0, "UI/heart_score/hearts/2/mark"),
		findTF(var_15_0, "UI/heart_score/hearts/3/mark")
	}
	arg_15_0.numbers = {
		findTF(var_15_0, "UI/countdown_panel/timer/3"),
		findTF(var_15_0, "UI/countdown_panel/timer/2"),
		findTF(var_15_0, "UI/countdown_panel/timer/1")
	}
	arg_15_0.scoreTxt = findTF(var_15_0, "UI/heart_score/score/Text"):GetComponent(typeof(Text))
	arg_15_0.energyBar = findTF(var_15_0, "UI/ex/bar"):GetComponent(typeof(Image))
	arg_15_0.energyIcon = findTF(var_15_0, "UI/ex/icon")
	arg_15_0.energyLight = findTF(var_15_0, "UI/ex/light")
	arg_15_0.exTipPanel = findTF(var_15_0, "UI/ex_tip_panel")
	arg_15_0.comboTxt = findTF(var_15_0, "UI/combo/Text"):GetComponent(typeof(Text))
	arg_15_0.countdownPanel = findTF(var_15_0, "UI/countdown_panel")
	arg_15_0.resultPanel = findTF(var_15_0, "UI/result_panel")
	arg_15_0.resultCloseBtn = findTF(arg_15_0.resultPanel, "frame/close")
	arg_15_0.resultHighestScoreTxt = findTF(arg_15_0.resultPanel, "frame/highest/Text"):GetComponent(typeof(Text))
	arg_15_0.resultScoreTxt = findTF(arg_15_0.resultPanel, "frame/score/Text"):GetComponent(typeof(Text))
	arg_15_0.msgboxPanel = findTF(var_15_0, "UI/msg_panel")
	arg_15_0.exitMsgboxWindow = findTF(arg_15_0.msgboxPanel, "frame/exit_mode")
	arg_15_0.pauseMsgboxWindow = findTF(arg_15_0.msgboxPanel, "frame/pause_mode")
	arg_15_0.helpWindow = findTF(var_15_0, "UI/help")
	arg_15_0.lightTF = findTF(var_15_0, "game/range")
	arg_15_0.lightMark = arg_15_0.lightTF:Find("Image")
	arg_15_0.pauseBtn = findTF(var_15_0, "UI/pause")
	arg_15_0.exitBtn = findTF(var_15_0, "UI/back")
	arg_15_0.energyBar.fillAmount = 0
end

function var_0_0.EnterAnimation(arg_16_0, arg_16_1)
	setActive(arg_16_0.countdownPanel, true)

	local function var_16_0(arg_17_0)
		for iter_17_0, iter_17_1 in ipairs(arg_16_0.numbers) do
			setActive(iter_17_1, iter_17_0 == arg_17_0)
		end
	end

	local var_16_1 = 1

	arg_16_0.countdownTimer = Timer.New(function()
		var_16_1 = var_16_1 + 1

		if var_16_1 > 3 then
			setActive(arg_16_0.countdownPanel, false)
			arg_16_1()
		else
			var_16_0(var_16_1)
		end
	end, 1, 3)

	var_16_0(var_16_1)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.COUNT_DOWN_VOICE)
	arg_16_0.countdownTimer:Start()
end

function var_0_0.ShowHelpWindow(arg_19_0, arg_19_1)
	setActive(arg_19_0.helpWindow, true)
	onButton(arg_19_0, arg_19_0.helpWindow, function()
		setActive(arg_19_0.helpWindow, false)
		PlayerPrefs.SetInt("FushunAdventureGame" .. getProxy(PlayerProxy):getRawData().id, 1)
		arg_19_1()
	end, SFX_PANEL)
end

function var_0_0.DisplayKey(arg_21_0)
	local function var_21_0(arg_22_0, arg_22_1)
		local var_22_0

		if not arg_22_1 or arg_22_1 == "" then
			var_22_0 = arg_21_0.btnSprites[1]
		elseif arg_22_1 == "A" then
			var_22_0 = arg_21_0.btnSprites[2]
		elseif arg_22_1 == "B" then
			var_22_0 = arg_21_0.btnSprites[3]
		end

		if arg_22_0.sprite ~= var_22_0 then
			arg_22_0.sprite = var_22_0
		end
	end

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.keys) do
		local var_21_1 = string.sub(arg_21_0.key, iter_21_0, iter_21_0) or ""

		var_21_0(iter_21_1, var_21_1)
	end
end

function var_0_0.DisplayeHearts(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.hearts) do
		setActive(iter_23_1, iter_23_0 <= arg_23_1)
	end
end

function var_0_0.DisplayScore(arg_24_0)
	arg_24_0.scoreTxt.text = arg_24_0.score
end

function var_0_0.DisplayeEnergy(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = math.min(1, arg_25_1 / arg_25_2)

	arg_25_0.energyBar.fillAmount = var_25_0

	local var_25_1 = arg_25_0.energyIcon.parent.rect.width * var_25_0
	local var_25_2 = var_25_1 - arg_25_0.energyIcon.rect.width

	setAnchoredPosition(arg_25_0.energyIcon, {
		x = math.max(0, var_25_2)
	})

	local var_25_3 = 0

	if var_25_0 >= 1 then
		var_25_3 = tf(arg_25_0.energyBar.gameObject).rect.width
	elseif var_25_1 > 0 then
		var_25_3 = var_25_1
	end

	setActive(arg_25_0.energyLight, var_25_0 >= 0.01)

	arg_25_0.energyLight.sizeDelta = Vector2(var_25_3, arg_25_0.energyLight.sizeDelta.y)
end

function var_0_0.SetGameStateCallback(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0._startCallback = arg_26_1
	arg_26_0._endCallback = arg_26_2
end

function var_0_0.StartGame(arg_27_0)
	if arg_27_0.state ~= var_0_4 then
		return
	end

	if arg_27_0._startCallback then
		arg_27_0._startCallback()
	end

	arg_27_0.enemys = {}
	arg_27_0.hitList = {}
	arg_27_0.missFlags = {}
	arg_27_0.score = 0
	arg_27_0.combo = 0
	arg_27_0.pause = false
	arg_27_0.schedule = FushunSchedule.New()
	arg_27_0.specailSchedule = FushunSchedule.New()

	arg_27_0:LoadScene(function()
		arg_27_0:EnterGame()
		pg.BgmMgr.GetInstance():Push(arg_27_0.__cname, FushunAdventureGameConst.GAME_BGM_NAME)
	end)

	arg_27_0.state = var_0_5
end

function var_0_0.LoadScene(arg_29_0, arg_29_1)
	seriesAsync({
		function(arg_30_0)
			if arg_29_0.gameUI then
				setActive(arg_29_0.gameUI, true)
				arg_30_0()
			else
				arg_29_0:loadPrefab("ui/FushunAdventureGame", function(arg_31_0)
					arg_29_0.gameUI = arg_31_0

					arg_31_0.transform:SetParent(arg_29_0._go.transform, false)
					arg_29_0:InitGameUI()
					arg_30_0()
				end)
			end
		end,
		function(arg_32_0)
			arg_29_0:DisplayeHearts(3)
			arg_29_0:DisplayScore()
			arg_29_0:DisplayeEnergy(0, 1)

			if not (PlayerPrefs.GetInt("FushunAdventureGame" .. getProxy(PlayerProxy):getRawData().id, 0) > 0) then
				arg_29_0:ShowHelpWindow(arg_32_0)
			else
				arg_32_0()
			end
		end,
		function(arg_33_0)
			parallelAsync({
				function(arg_34_0)
					arg_29_0:EnterAnimation(arg_34_0)
				end,
				function(arg_35_0)
					arg_29_0:loadPrefab("ui/fa_fushun", function(arg_36_0)
						arg_29_0.fushun = FushunChar.New(arg_36_0)

						arg_29_0.fushun:SetPosition(FushunAdventureGameConst.FUSHUN_INIT_POSITION)
						arg_36_0.transform:SetParent(arg_29_0.gameUI.transform:Find("game"), false)
						arg_35_0()
					end)
				end
			}, arg_33_0)
		end
	}, arg_29_1)
end

function var_0_0.EnterGame(arg_37_0)
	if not arg_37_0.handle then
		arg_37_0.handle = UpdateBeat:CreateListener(arg_37_0.UpdateGame, arg_37_0)
	end

	UpdateBeat:AddListener(arg_37_0.handle)

	arg_37_0.lightTF.sizeDelta = Vector2(FushunAdventureGameConst.FUSHUN_ATTACK_RANGE, arg_37_0.lightTF.sizeDelta.y)
	arg_37_0.lightTF.localPosition = Vector2(FushunAdventureGameConst.FUSHUN_ATTACK_DISTANCE + arg_37_0.fushun:GetPosition().x, arg_37_0.lightTF.localPosition.y)

	arg_37_0:SpawnEnemys()
	arg_37_0:RegisterEventListener()

	arg_37_0.key = ""

	arg_37_0.fushun:SetOnAnimEnd(function()
		arg_37_0.key = ""

		arg_37_0:DisplayKey()
	end)
end

function var_0_0.UpdateGame(arg_39_0)
	if arg_39_0.state == var_0_6 then
		arg_39_0:ExitGame(true)

		return
	end

	if not arg_39_0.pause then
		arg_39_0.spawner:Update()
		arg_39_0:AddDebugInput()

		if arg_39_0.fushun:IsDeath() then
			arg_39_0.fushun:Die()

			arg_39_0.state = var_0_6

			return
		elseif arg_39_0.fushun:ShouldInvincible() then
			arg_39_0:EnterInvincibleMode()
		elseif arg_39_0.fushun:ShouldVincible() then
			arg_39_0:ExitInvincibleMode()
		end

		local var_39_0 = false

		for iter_39_0 = #arg_39_0.enemys, 1, -1 do
			local var_39_1 = arg_39_0.enemys[iter_39_0]

			if var_39_1:IsFreeze() then
				-- block empty
			elseif arg_39_0:CheckEnemyDeath(iter_39_0) then
				-- block empty
			else
				var_39_1:Move()
				arg_39_0:CheckCollision(arg_39_0.fushun, var_39_1)

				if arg_39_0:CheckAttackRange(var_39_1) then
					var_39_0 = true
				end
			end
		end

		arg_39_0:RangeLightDisplay(var_39_0)
		arg_39_0:DisplayeEnergy(arg_39_0.fushun:GetEnergy(), arg_39_0.fushun:GetEnergyTarget())
		arg_39_0.specailSchedule:Update()
	else
		for iter_39_1 = #arg_39_0.enemys, 1, -1 do
			arg_39_0:CheckEnemyDeath(iter_39_1)
		end
	end

	arg_39_0.schedule:Update()
end

function var_0_0.RangeLightDisplay(arg_40_0, arg_40_1)
	setActive(arg_40_0.lightMark, arg_40_1)
end

function var_0_0.CheckAttackRange(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0.fushun

	return arg_41_1:GetPosition().x <= var_41_0:GetAttackPosition().x
end

function var_0_0.CheckEnemyDeath(arg_42_0, arg_42_1)
	local var_42_0 = false
	local var_42_1 = arg_42_0.enemys[arg_42_1]

	if var_42_1:IsDeath() then
		if arg_42_0.hitList[var_42_1.index] and not var_42_1:IsEscape() then
			arg_42_0:AddScore(var_42_1:GetScore())
			arg_42_0:AddEnergy(var_42_1:GetEnergyScore())
		end

		var_42_1:Vanish()
		table.remove(arg_42_0.enemys, arg_42_1)

		var_42_0 = true
	end

	return var_42_0
end

function var_0_0.EnterInvincibleMode(arg_43_0)
	local var_43_0 = FushunAdventureGameConst.EX_TIP_TIME
	local var_43_1 = FushunAdventureGameConst.EX_TIME

	arg_43_0.fushun:Invincible()
	setActive(arg_43_0.exTipPanel, true)

	arg_43_0.pause = true

	blinkAni(arg_43_0.energyBar.gameObject, 0.5, -1)
	arg_43_0.schedule:AddSchedule(var_43_0, 1, function()
		setActive(arg_43_0.exTipPanel, false)
		arg_43_0.spawner:CarzyMode()

		arg_43_0.pause = false

		arg_43_0.fushun:StartAction("EX")
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.ENTER_EX_VOICE)

		local var_44_0 = arg_43_0.fushun:GetEnergyTarget() / var_43_1

		arg_43_0.specailSchedule:AddSchedule(1, var_43_1, function()
			arg_43_0.fushun:ReduceEnergy(var_44_0)
		end)
	end)
	setActive(arg_43_0.btnAExEffect, true)
	setActive(arg_43_0.btnBExEffect, true)

	arg_43_0.key = ""

	arg_43_0:DisplayKey()
end

function var_0_0.ExitInvincibleMode(arg_46_0)
	arg_46_0.fushun:Vincible()

	arg_46_0.energyBar.color = Color.New(1, 1, 1, 1)

	LeanTween.cancel(arg_46_0.energyBar.gameObject)

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.enemys) do
		arg_46_0.hitList[iter_46_1.index] = nil

		iter_46_1:Die()
	end

	arg_46_0.spawner:NormalMode()
	setActive(arg_46_0.btnAExEffect, false)
	setActive(arg_46_0.btnBExEffect, false)
end

function var_0_0.CheckCollision(arg_47_0, arg_47_1, arg_47_2)
	if var_0_0.IsCollision(arg_47_2.effectCollider2D, arg_47_1.collider2D) then
		arg_47_1:Hurt()
		arg_47_2:OnHit()
		arg_47_0:DisplayeHearts(arg_47_0.fushun:GetHp())
		arg_47_0:AddCombo(-arg_47_0.combo)
	elseif arg_47_0.fushun:InvincibleState() and not arg_47_2:IsDeath() and arg_47_2:GetPosition().x <= arg_47_1:GetAttackPosition().x then
		arg_47_2:Hurt(1)

		arg_47_0.hitList[arg_47_2.index] = true

		arg_47_0:AddHitEffect(arg_47_2)
	elseif var_0_0.IsNearby(arg_47_1:GetPosition(), arg_47_2:GetAttackPosition()) then
		arg_47_2:Attack()
	end
end

function var_0_0.AddHitEffect(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0.fushun.effectCollider2D.bounds.center
	local var_48_1 = arg_48_0.gameUI.transform:InverseTransformPoint(var_48_0)
	local var_48_2 = arg_48_1.collider2D.bounds:GetMin()
	local var_48_3 = arg_48_0.gameUI.transform:InverseTransformPoint(var_48_2)
	local var_48_4 = Vector3(var_48_3.x, var_48_1.y, 0)

	arg_48_0:loadPrefab("ui/fa_attack_effect", function(arg_49_0)
		arg_49_0.transform:SetParent(arg_48_0.gameUI.transform, false)

		arg_49_0.transform.localPosition = var_48_4

		local var_49_0 = arg_49_0:GetComponent(typeof(DftAniEvent))

		var_49_0:SetEndEvent(function()
			var_49_0:SetEndEvent(nil)

			if arg_49_0 then
				Destroy(arg_49_0)
			end
		end)
	end)
	arg_48_0:ShakeScreen(arg_48_0.gameUI)
end

function var_0_0.ShakeScreen(arg_51_0, arg_51_1)
	if LeanTween.isTweening(arg_51_1) then
		LeanTween.cancel(arg_51_1)
	end

	LeanTween.rotateAroundLocal(arg_51_1, Vector3(0, 0, 1), FushunAdventureGameConst.SHAKE_RANGE, FushunAdventureGameConst.SHAKE_TIME):setLoopPingPong(FushunAdventureGameConst.SHAKE_LOOP_CNT):setFrom(-1 * FushunAdventureGameConst.SHAKE_RANGE):setOnComplete(System.Action(function()
		arg_51_1.transform.localEulerAngles = Vector3(0, 0, 0)
	end))
end

function var_0_0.SpawnEnemys(arg_53_0)
	local var_53_0 = {
		FushunBeastChar,
		FushunEliteBeastChar,
		FushunEliteBeastChar
	}

	local function var_53_1(arg_54_0)
		local var_54_0 = FushunAdventureGameConst.SPEED_ADDITION
		local var_54_1

		for iter_54_0, iter_54_1 in ipairs(var_54_0) do
			local var_54_2 = iter_54_1[1][1]
			local var_54_3 = iter_54_1[1][2]

			if var_54_2 <= arg_54_0 and arg_54_0 <= var_54_3 then
				var_54_1 = iter_54_1

				break
			end
		end

		var_54_1 = var_54_1 or var_54_0[#var_54_0]

		return var_54_1[2]
	end

	local function var_53_2(arg_55_0)
		local var_55_0 = arg_55_0.config
		local var_55_1 = arg_55_0.speed
		local var_55_2 = arg_55_0.index
		local var_55_3 = var_53_0[var_55_0.id].New(arg_55_0.go, var_55_2, var_55_0)
		local var_55_4 = var_55_1 + var_53_1(arg_53_0.score)

		var_0_0.LOG("  顺序 :", var_55_2, " id :", var_55_0.id, " speed :", var_55_4)
		var_55_3:SetSpeed(var_55_4)
		var_55_3:SetPosition(FushunAdventureGameConst.ENEMY_SPAWN_POSITION)
		table.insert(arg_53_0.enemys, var_55_3)
	end

	arg_53_0.spawner = FuShunEnemySpawner.New(arg_53_0.gameUI.transform:Find("game").transform, var_53_2)

	arg_53_0.spawner:NormalMode()
end

function var_0_0.AddScore(arg_56_0, arg_56_1)
	arg_56_0:AddCombo(1)

	local var_56_0 = arg_56_0.combo >= FushunAdventureGameConst.COMBO_SCORE_TARGET and FushunAdventureGameConst.COMBO_EXTRA_SCORE or 0

	arg_56_0.score = arg_56_0.score + arg_56_1 + var_56_0

	arg_56_0:DisplayScore()
	arg_56_0.spawner:UpdateScore(arg_56_0.score)
end

function var_0_0.AddEnergy(arg_57_0, arg_57_1)
	arg_57_0.fushun:AddEnergy(arg_57_1)
end

function var_0_0.AddCombo(arg_58_0, arg_58_1)
	if arg_58_1 > 0 then
		arg_58_0:loadPrefab("UI/fushun_combo", function(arg_59_0)
			arg_59_0.transform:SetParent(arg_58_0.gameUI.transform:Find("UI"), false)

			local var_59_0

			var_59_0 = Timer.New(function()
				if arg_59_0 then
					Destroy(arg_59_0)
				end

				if var_59_0 then
					var_59_0:Stop()

					var_59_0 = nil
				end
			end, 1, 1)

			var_59_0:Start()
		end)
	end

	arg_58_0.combo = arg_58_0.combo + arg_58_1
	arg_58_0.comboTxt.text = arg_58_0.combo

	setActive(arg_58_0.comboTxt.gameObject.transform.parent, arg_58_0.combo > 0)
end

function var_0_0.Action(arg_61_0, arg_61_1)
	if arg_61_0.fushun:InvincibleState() then
		arg_61_0:AddScore(FushunAdventureGameConst.EX_CLICK_SCORE)
	else
		arg_61_0:OnFushunAttack(arg_61_1)
	end
end

function var_0_0.OnFushunAttack(arg_62_0, arg_62_1)
	if #arg_62_0.key == 3 or arg_62_0.fushun:IsMissState() or arg_62_0.fushun:IsDamageState() then
		return
	end

	arg_62_0.key = arg_62_0.key .. arg_62_1

	arg_62_0:DisplayKey()

	local var_62_0 = {}
	local var_62_1 = arg_62_0.fushun

	for iter_62_0, iter_62_1 in ipairs(arg_62_0.enemys) do
		if not iter_62_1:WillDeath() and iter_62_1:GetPosition().x <= var_62_1:GetAttackPosition().x then
			table.insert(var_62_0, iter_62_0)
		end
	end

	arg_62_0.fushun:TriggerAction(arg_62_0.key, function()
		if #var_62_0 == 0 then
			arg_62_0.fushun:Miss()
		end

		arg_62_0.key = ""

		arg_62_0:DisplayKey()
	end)

	if #var_62_0 > 0 then
		for iter_62_2, iter_62_3 in ipairs(var_62_0) do
			local var_62_2 = arg_62_0.enemys[iter_62_3]

			var_62_2:Hurt(1)

			arg_62_0.hitList[var_62_2.index] = true

			arg_62_0:AddHitEffect(var_62_2)
		end
	end
end

function var_0_0.PauseGame(arg_64_0)
	arg_64_0.pause = true
end

function var_0_0.ResumeGame(arg_65_0)
	arg_65_0.pause = false
end

function var_0_0.ExitGame(arg_66_0, arg_66_1)
	local function var_66_0()
		arg_66_0:ClearGameScene()
	end

	if arg_66_0.btnA then
		ClearEventTrigger(arg_66_0.btnA:GetComponent("EventTriggerListener"))
	end

	if arg_66_0.btnB then
		ClearEventTrigger(arg_66_0.btnB:GetComponent("EventTriggerListener"))
	end

	if arg_66_0.handle then
		UpdateBeat:RemoveListener(arg_66_0.handle)

		arg_66_0.handle = nil
	end

	if arg_66_0.schedule then
		arg_66_0.schedule:Dispose()

		arg_66_0.schedule = nil
	end

	if arg_66_0.specailSchedule then
		arg_66_0.specailSchedule:Dispose()

		arg_66_0.specailSchedule = nil
	end

	if arg_66_1 then
		if arg_66_0.OnShowResult then
			arg_66_0.OnShowResult(arg_66_0.score)
		end

		arg_66_0:ShowResultWindow(function()
			var_66_0()
		end)
	else
		var_66_0()
	end
end

function var_0_0.ClearGameScene(arg_69_0)
	if arg_69_0.fushun then
		arg_69_0.fushun:Destory()

		arg_69_0.fushun = nil
	end

	if arg_69_0.spawner then
		arg_69_0.spawner:Dispose()

		arg_69_0.spawner = nil
	end

	if arg_69_0.enemys then
		for iter_69_0, iter_69_1 in ipairs(arg_69_0.enemys) do
			iter_69_1:Dispose()
		end

		arg_69_0.enemys = nil
	end

	arg_69_0.state = var_0_4

	if arg_69_0.gameUI then
		arg_69_0:HideExitMsgbox()
		arg_69_0:HideResultWindow()
		arg_69_0:HidePauseMsgbox()
		setActive(arg_69_0.gameUI, false)
		pg.BgmMgr.GetInstance():Push(arg_69_0.__cname, FushunAdventureGameConst.BGM_NAME)
	end

	if arg_69_0._endCallback then
		arg_69_0._endCallback()
	end
end

function var_0_0.IsStarting(arg_70_0)
	return arg_70_0.state == var_0_5
end

function var_0_0.Dispose(arg_71_0)
	if arg_71_0.countdownTimer then
		arg_71_0.countdownTimer:Stop()

		arg_71_0.countdownTimer = nil
	end

	arg_71_0._startCallback = nil
	arg_71_0._endCallback = nil

	arg_71_0:ExitGame()
	pg.DelegateInfo.Dispose(arg_71_0)

	if arg_71_0.gameUI then
		Destroy(arg_71_0.gameUI)

		arg_71_0.gameUI = nil
	end

	arg_71_0._go = nil
	arg_71_0.btnSprites = nil
	arg_71_0.state = var_0_2
	arg_71_0.OnShowResult = nil
	arg_71_0.OnLevelUpdate = nil
end

function var_0_0.AddDebugInput(arg_72_0)
	if IsUnityEditor then
		if Input.GetKeyDown(KeyCode.A) then
			arg_72_0:OnShowBtnEffect("A", true)
		end

		if Input.GetKeyUp(KeyCode.A) then
			arg_72_0:Action("A")
			arg_72_0:OnShowBtnEffect("A", false)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.A_BTN_VOICE)
		end

		if Input.GetKeyDown(KeyCode.S) then
			arg_72_0:OnShowBtnEffect("B", true)
		end

		if Input.GetKeyUp(KeyCode.S) then
			arg_72_0:Action("B")
			arg_72_0:OnShowBtnEffect("B", false)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.B_BTN_VOICE)
		end
	end
end

function var_0_0.RegisterEventListener(arg_73_0)
	local var_73_0 = arg_73_0.btnA:GetComponent("EventTriggerListener")

	var_73_0:AddPointDownFunc(function()
		arg_73_0:OnShowBtnEffect("A", true)
	end)
	var_73_0:AddPointExitFunc(function()
		arg_73_0:OnShowBtnEffect("A", false)
	end)
	var_73_0:AddPointUpFunc(function()
		if arg_73_0.pause then
			return
		end

		arg_73_0:Action("A")
		arg_73_0:OnShowBtnEffect("A", false)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.A_BTN_VOICE)
	end)

	local var_73_1 = arg_73_0.btnB:GetComponent("EventTriggerListener")

	var_73_1:AddPointDownFunc(function()
		arg_73_0:OnShowBtnEffect("B", true)
	end)
	var_73_1:AddPointExitFunc(function()
		arg_73_0:OnShowBtnEffect("B", false)
	end)
	var_73_1:AddPointUpFunc(function()
		if arg_73_0.pause then
			return
		end

		arg_73_0:Action("B")
		arg_73_0:OnShowBtnEffect("B", false)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.B_BTN_VOICE)
	end)
	onButton(arg_73_0, arg_73_0.pauseBtn, function()
		arg_73_0:ShowPauseMsgbox()
	end, SFX_PANEL)
	onButton(arg_73_0, arg_73_0.exitBtn, function()
		arg_73_0:ShowExitMsgbox()
	end, SFX_PANEL)
end

function var_0_0.OnShowBtnEffect(arg_82_0, arg_82_1, arg_82_2)
	setActive(arg_82_0["btn" .. arg_82_1 .. "Effect"], arg_82_2)
end

function var_0_0.ShowResultWindow(arg_83_0, arg_83_1)
	setActive(arg_83_0.resultPanel, true)
	onButton(arg_83_0, arg_83_0.resultCloseBtn, function()
		arg_83_0:HideResultWindow()

		if arg_83_1 then
			arg_83_1()
		end
	end, SFX_PANEL)

	if arg_83_0.roomId then
		arg_83_0.highestScore = getProxy(GameRoomProxy):getRoomScore(arg_83_0.roomId)
	end

	arg_83_0.resultHighestScoreTxt.text = arg_83_0.highestScore
	arg_83_0.resultScoreTxt.text = arg_83_0.score

	if arg_83_0.score > arg_83_0.highestScore then
		arg_83_0.highestScore = arg_83_0.score
	end
end

function var_0_0.HideResultWindow(arg_85_0)
	setActive(arg_85_0.resultPanel, false)
end

function var_0_0.ShowPauseMsgbox(arg_86_0)
	arg_86_0:PauseGame()
	setActive(arg_86_0.msgboxPanel, true)
	setActive(arg_86_0.pauseMsgboxWindow, true)
	setActive(arg_86_0.exitMsgboxWindow, false)
	onButton(arg_86_0, arg_86_0.pauseMsgboxWindow:Find("continue_btn"), function()
		arg_86_0:ResumeGame()
		arg_86_0:HidePauseMsgbox()
	end, SFX_PANEL)
end

function var_0_0.HidePauseMsgbox(arg_88_0)
	setActive(arg_88_0.msgboxPanel, false)
	setActive(arg_88_0.pauseMsgboxWindow, false)
end

function var_0_0.ShowExitMsgbox(arg_89_0)
	arg_89_0:PauseGame()
	setActive(arg_89_0.msgboxPanel, true)
	setActive(arg_89_0.pauseMsgboxWindow, false)
	setActive(arg_89_0.exitMsgboxWindow, true)
	onButton(arg_89_0, arg_89_0.exitMsgboxWindow:Find("cancel_btn"), function()
		arg_89_0:ResumeGame()
		arg_89_0:HideExitMsgbox()
	end, SFX_PANEL)
	onButton(arg_89_0, arg_89_0.exitMsgboxWindow:Find("confirm_btn"), function()
		arg_89_0:HideExitMsgbox()

		if arg_89_0.OnShowResult then
			arg_89_0.OnShowResult(arg_89_0.score)
		end

		arg_89_0:ExitGame()
	end, SFX_PANEL)
end

function var_0_0.HideExitMsgbox(arg_92_0)
	setActive(arg_92_0.msgboxPanel, false)
	setActive(arg_92_0.exitMsgboxWindow, false)
end

function var_0_0.IsCollision(arg_93_0, arg_93_1)
	return arg_93_0.enabled and arg_93_1.enabled and arg_93_0.gameObject.activeSelf and arg_93_0.bounds:Intersects(arg_93_1.bounds)
end

function var_0_0.IsNearby(arg_94_0, arg_94_1)
	return arg_94_1.x - arg_94_0.x <= 0
end

function var_0_0.LOG(...)
	if var_0_1 then
		print(...)
	end
end

return var_0_0
