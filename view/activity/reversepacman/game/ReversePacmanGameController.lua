local var_0_0 = class("ReversePacmanGameController")

var_0_0.MAX_DIALOGUE_CNT = 30

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.binder = arg_1_1
	arg_1_0._tf = arg_1_2

	arg_1_0:InitTF()
	arg_1_0:InitControl()
	arg_1_0:AddListener()
	arg_1_0:InitTimer()
end

function var_0_0.InitTF(arg_2_0, arg_2_1)
	arg_2_0.timeText = arg_2_0._tf:Find("time/Text"):GetComponent(typeof(Text))
	arg_2_0.dialogueTpl = arg_2_0._tf:Find("panel/tpl")

	setActive(arg_2_0.dialogueTpl, false)

	arg_2_0.dialogueContainer = arg_2_0._tf:Find("panel/view/content")
end

function var_0_0.SetUp(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	arg_3_0.levelId = arg_3_1
	arg_3_0.shipIds = arg_3_2
	arg_3_0.buffIds = arg_3_3
	arg_3_0.buffCnts = arg_3_4
	arg_3_0.eduBuffCnt = arg_3_5

	arg_3_0.mapControl:SetUp(arg_3_0.levelId)
	arg_3_0.roleControl:SetUp(arg_3_0.shipIds, arg_3_0.mapControl, arg_3_0.eduBuffCnt)
	arg_3_0.buffControl:SetUp(arg_3_0.buffIds, arg_3_0.buffCnts, arg_3_0.mapControl, arg_3_0)

	arg_3_0.durationTime = arg_3_0.mapControl:GetDuration()
	arg_3_0.remainTime = arg_3_0.durationTime
	arg_3_0.ratingThresholds = arg_3_0.mapControl:GetRatingThresholds()
	arg_3_0.gameplayTimeScale = ReversePacmanConst.GetGameplayTimeScale(arg_3_0.remainTime)
	arg_3_0.fastGameplayTipShown = false

	arg_3_0:StartGame()
end

function var_0_0.InitControl(arg_4_0)
	arg_4_0.mapControl = ReversePacmanMapControl.New(arg_4_0.binder, arg_4_0._tf)
	arg_4_0.roleControl = ReversePacmanRoleControl.New(arg_4_0.binder, arg_4_0._tf)
	arg_4_0.buffControl = ReversePacmanBuffControl.New(arg_4_0.binder, arg_4_0._tf)
end

function var_0_0.AddListener(arg_5_0)
	arg_5_0.binder:bind(ReversePacmanConst.EVENT.CAPTURE, function(arg_6_0, arg_6_1)
		if arg_5_0.roleControl:CheckGameEnd() then
			arg_5_0:EndGame(ReversePacmanConst.RESULT_TYPE.SUCCESS)
		end
	end)
	arg_5_0.binder:bind(ReversePacmanConst.EVENT.GRAPH_CHANGED, function(arg_7_0, arg_7_1)
		if arg_5_0.roleControl:CheckAllMonstersTrapped() then
			arg_5_0:EndGame(ReversePacmanConst.RESULT_TYPE.SUCCESS)
		end
	end)
	arg_5_0.binder:bind(ReversePacmanConst.EVENT.SHIP_PERFORMANCE, function(arg_8_0, arg_8_1)
		arg_5_0:AddDialogue(arg_8_1)
	end)
	arg_5_0.binder:bind(ReversePacmanConst.EVENT.PICK, function(arg_9_0, arg_9_1)
		arg_5_0:PauseGame()
		LeanTween.delayedCall(arg_5_0:GetGameplayDuration(1), System.Action(function()
			arg_5_0:ResumeGame()
		end))
	end)
end

function var_0_0.InitTimer(arg_11_0)
	arg_11_0.timer = Timer.New(function()
		arg_11_0:OnTimer(ReversePacmanConst.TIME_INTERVAL)
	end, ReversePacmanConst.TIME_INTERVAL, -1)
end

function var_0_0.UpdateTimeUI(arg_13_0)
	arg_13_0.timeText.text = pg.TimeMgr.GetInstance():DescCDTimeForMinute(arg_13_0.remainTime)
end

function var_0_0.AddDialogue(arg_14_0, arg_14_1)
	arg_14_0.dialogueCount = (arg_14_0.dialogueCount or 0) + 1

	local var_14_0 = cloneTplTo(arg_14_0.dialogueTpl, arg_14_0.dialogueContainer, "dialogue_" .. arg_14_0.dialogueCount)
	local var_14_1 = arg_14_1.ship:GetWordByType(arg_14_1.type)
	local var_14_2 = arg_14_1.shipId and pg.activity_chasing_character[arg_14_1.shipId]

	if var_14_2 then
		LoadImageSpriteAsync(var_14_2.sd_avatar, var_14_0:Find("icon"))
	end

	setText(var_14_0:Find("dialogue/Text"), var_14_1)
	scrollToBottom(arg_14_0.dialogueContainer)

	arg_14_0.dialogues = arg_14_0.dialogues or {}

	table.insert(arg_14_0.dialogues, var_14_0)

	if #arg_14_0.dialogues > var_0_0.MAX_DIALOGUE_CNT then
		local var_14_3 = table.remove(arg_14_0.dialogues, 1)

		if var_14_3 then
			Destroy(var_14_3.gameObject)
		end
	end
end

function var_0_0.StartGame(arg_15_0)
	arg_15_0.gameEnded = false
	arg_15_0.isPause = false

	arg_15_0:StartTimer()
end

function var_0_0.EndGame(arg_16_0, arg_16_1)
	if arg_16_0.gameEnded then
		return
	end

	arg_16_0.gameEnded = true

	if arg_16_0.roleControl then
		arg_16_0.roleControl:SetGameEnded(true)
	end

	arg_16_0:PauseGame()
	LeanTween.delayedCall(arg_16_0:GetGameplayDuration(1), System.Action(function()
		arg_16_0.roleControl:Hide()
		arg_16_0.binder:GameOver({
			result = arg_16_1,
			useTime = calcFloor(arg_16_0.durationTime - arg_16_0.remainTime),
			grade = ReversePacmanConst.GetGrade(arg_16_0.remainTime, arg_16_0.durationTime, arg_16_0.ratingThresholds),
			shipCnt = arg_16_0.roleControl:GetShipCnt(),
			monsterCnt = arg_16_0.roleControl:GetCapturedMonsterCnt()
		})
	end))
end

function var_0_0.CanCastBuff(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_2 or not arg_18_0.mapControl:IsWalkable(arg_18_2.x, arg_18_2.y) then
		return false
	end

	if arg_18_1 == ReversePacmanConst.BUFF.BLOCK and arg_18_0.roleControl:IsCellOccupied(arg_18_2) then
		return false
	end

	return true
end

function var_0_0.IsAllMonstersTrapped(arg_19_0)
	return arg_19_0.roleControl:CheckAllMonstersTrapped()
end

function var_0_0.StartTimer(arg_20_0)
	if not arg_20_0.timer.running then
		arg_20_0.timer:Start()
	end
end

function var_0_0.StopTimer(arg_21_0)
	if arg_21_0.timer.running then
		arg_21_0.timer:Stop()
	end
end

function var_0_0.PauseGame(arg_22_0)
	arg_22_0.isPause = true

	arg_22_0:StopTimer()
end

function var_0_0.ResumeGame(arg_23_0)
	if arg_23_0.gameEnded then
		return
	end

	arg_23_0.isPause = false

	arg_23_0:StartTimer()
end

function var_0_0.IsPause(arg_24_0)
	return arg_24_0.isPause
end

function var_0_0.OnTimer(arg_25_0, arg_25_1)
	if arg_25_0.gameEnded then
		return
	end

	local var_25_0 = arg_25_0.gameplayTimeScale or ReversePacmanConst.GAMEPLAY_TIME_SCALE.NORMAL

	arg_25_0.gameplayTimeScale = ReversePacmanConst.GetGameplayTimeScale(arg_25_0.remainTime)

	if not arg_25_0.fastGameplayTipShown and var_25_0 ~= ReversePacmanConst.GAMEPLAY_TIME_SCALE.FAST and arg_25_0.gameplayTimeScale == ReversePacmanConst.GAMEPLAY_TIME_SCALE.FAST then
		arg_25_0.fastGameplayTipShown = true

		pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_game_speed_up_tip"))
	end

	local var_25_1 = arg_25_1 * arg_25_0.gameplayTimeScale

	arg_25_0.remainTime = arg_25_0.remainTime - var_25_1

	arg_25_0:UpdateTimeUI()

	if arg_25_0.remainTime <= 0 then
		arg_25_0.remainTime = 0

		arg_25_0:UpdateTimeUI()
		arg_25_0:EndGame(ReversePacmanConst.RESULT_TYPE.FAIL)

		return
	end

	arg_25_0.mapControl:Update(var_25_1)
	arg_25_0.roleControl:Update(var_25_1)
	arg_25_0.buffControl:Update(var_25_1)
end

function var_0_0.GetGameplayTimeScale(arg_26_0)
	return arg_26_0.gameplayTimeScale or ReversePacmanConst.GAMEPLAY_TIME_SCALE.NORMAL
end

function var_0_0.GetGameplayDuration(arg_27_0, arg_27_1)
	return arg_27_1 / arg_27_0:GetGameplayTimeScale()
end

function var_0_0.Dispose(arg_28_0)
	if arg_28_0.timer then
		if arg_28_0.timer.running then
			arg_28_0.timer:Stop()
		end

		arg_28_0.timer = nil
	end

	arg_28_0.mapControl:Dispose()
	arg_28_0.roleControl:Dispose()
	arg_28_0.buffControl:Dispose()
end

return var_0_0
