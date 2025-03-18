local var_0_0 = class("BoatAdGameView", import("..BaseMiniGameView"))
local var_0_1 = import("view.miniGame.gameView.BoatAdGame.BoatAdGameVo")

function var_0_0.getUIName(arg_1_0)
	return var_0_1.game_ui
end

function var_0_0.getBGM(arg_2_0)
	return var_0_1.menu_bgm
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:initData()
	arg_3_0:initEvent()
	arg_3_0:initUI()
	arg_3_0:checkGet()
end

function var_0_0.checkGet(arg_4_0)
	local var_4_0 = arg_4_0:GetMGHubData()
	local var_4_1 = var_4_0.ultimate

	if var_4_1 and var_4_1 == 1 then
		return
	end

	if var_0_1.GetGameTimes() == 0 then
		if var_0_1.GetGameMaxTimes() > var_0_1.GetGameUseTimes() then
			return
		end

		pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = var_4_0.id,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})
	end
end

function var_0_0.initData(arg_5_0)
	var_0_1.Init(arg_5_0:GetMGData().id, arg_5_0:GetMGHubData().id)
	var_0_1.SetGameTpl(findTF(arg_5_0._tf, "tpl"))

	local var_5_0 = Application.targetFrameRate

	if var_5_0 > 60 then
		var_5_0 = 60
	end

	arg_5_0.stepCount = 1 / var_5_0 * 0.9
	arg_5_0.realTimeStartUp = Time.realtimeSinceStartup
	arg_5_0.timer = Timer.New(function()
		if Time.realtimeSinceStartup - arg_5_0.realTimeStartUp > arg_5_0.stepCount then
			arg_5_0:onTimer()

			arg_5_0.realTimeStartUp = Time.realtimeSinceStartup
		end
	end, 1 / var_5_0, -1)
end

function var_0_0.initEvent(arg_7_0)
	if not arg_7_0.handle and IsUnityEditor then
		arg_7_0.handle = UpdateBeat:CreateListener(arg_7_0.Update, arg_7_0)

		UpdateBeat:AddListener(arg_7_0.handle)
	end

	arg_7_0:bind(SimpleMGEvent.LEVEL_GAME, function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_1 then
			arg_7_0:resumeGame()
			arg_7_0:onGameOver()
		else
			arg_7_0:resumeGame()
		end
	end)
	arg_7_0:bind(SimpleMGEvent.USE_SKILL, function(arg_9_0, arg_9_1, arg_9_2)
		arg_7_0.gameScene:useSkill(arg_9_1)
	end)
	arg_7_0:bind(SimpleMGEvent.COUNT_DOWN, function(arg_10_0, arg_10_1, arg_10_2)
		arg_7_0:gameStart()
	end)
	arg_7_0:bind(SimpleMGEvent.OPEN_PAUSE_UI, function(arg_11_0, arg_11_1, arg_11_2)
		arg_7_0.popUI:popPauseUI()
	end)
	arg_7_0:bind(SimpleMGEvent.OPEN_LEVEL_UI, function(arg_12_0, arg_12_1, arg_12_2)
		arg_7_0.popUI:popLeaveUI()
	end)
	arg_7_0:bind(SimpleMGEvent.PAUSE_GAME, function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_1 then
			arg_7_0:pauseGame()
		else
			arg_7_0:resumeGame()
		end
	end)
	arg_7_0:bind(SimpleMGEvent.BACK_MENU, function(arg_14_0, arg_14_1, arg_14_2)
		arg_7_0.menuUI:update(arg_7_0:GetMGHubData())
		arg_7_0.menuUI:show(true)
		arg_7_0.gameUI:show(false)
		arg_7_0.gameScene:showContainer(false)

		local var_14_0 = arg_7_0:getBGM()

		if not var_14_0 then
			if pg.CriMgr.GetInstance():IsDefaultBGM() then
				var_14_0 = pg.voice_bgm.NewMainScene.default_bgm
			else
				var_14_0 = pg.voice_bgm.NewMainScene.bgm
			end
		end

		if arg_7_0.bgm ~= var_14_0 then
			arg_7_0.bgm = var_14_0

			pg.BgmMgr.GetInstance():Push(arg_7_0.__cname, var_14_0)
		end

		arg_7_0:checkGet()
	end)
	arg_7_0:bind(SimpleMGEvent.CLOSE_GAME, function(arg_15_0, arg_15_1, arg_15_2)
		arg_7_0:closeView()
	end)
	arg_7_0:bind(SimpleMGEvent.BACK_HOME, function(arg_16_0, arg_16_1, arg_16_2)
		arg_7_0:emit(BaseUI.ON_HOME)
	end)
	arg_7_0:bind(SimpleMGEvent.GAME_OVER, function(arg_17_0, arg_17_1, arg_17_2)
		arg_7_0:onGameOver(arg_17_1)
	end)
	arg_7_0:bind(SimpleMGEvent.SHOW_RULE, function(arg_18_0, arg_18_1, arg_18_2)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[var_0_1.rule_tip].tip
		})
	end)
	arg_7_0:bind(SimpleMGEvent.READY_START, function(arg_19_0, arg_19_1, arg_19_2)
		arg_7_0:readyStart()
	end)
	arg_7_0:bind(SimpleMGEvent.STORE_SERVER, function(arg_20_0, arg_20_1, arg_20_2)
		arg_7_0:StoreDataToServer({
			arg_20_1
		})
	end)
	arg_7_0:bind(SimpleMGEvent.SUBMIT_GAME_SUCCESS, function(arg_21_0, arg_21_1, arg_21_2)
		if not arg_7_0.sendSuccessFlag then
			arg_7_0.sendSuccessFlag = true

			arg_7_0:SendSuccess(0)
		end

		local var_21_0 = var_0_1.char:getHp()
		local var_21_1 = var_0_1.scoreNum
		local var_21_2 = var_0_1.GetGameUseTimes() + 1
		local var_21_3 = math.floor(var_0_1.gameStepTime)

		pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = arg_7_0:GetMGHubData().id,
			cmd = MiniGameOPCommand.CMD_SUCCESS_DATA,
			args1 = {
				var_21_1,
				var_21_2,
				var_21_3
			}
		})
	end)
	arg_7_0:bind(SimpleMGEvent.ADD_SCORE, function(arg_22_0, arg_22_1, arg_22_2)
		arg_7_0:addScore(arg_22_1)
	end)
	arg_7_0:bind(BoatAdGameEvent.OPEN_AD_WINDOW, function(arg_23_0, arg_23_1, arg_23_2)
		arg_7_0:pauseGame()
		arg_7_0.popUI:oepnAd()
	end)
	arg_7_0:bind(BoatAdGameEvent.CLOSE_AD_UI, function(arg_24_0, arg_24_1, arg_24_2)
		arg_7_0:resumeGame()
	end)
end

function var_0_0.initUI(arg_25_0)
	if IsUnityEditor then
		setActive(findTF(arg_25_0._tf, "tpl"), false)
	end

	arg_25_0.clickMask = findTF(arg_25_0._tf, "clickMask")
	arg_25_0.popUI = BoatAdGamePopUI.New(arg_25_0._tf, arg_25_0)

	arg_25_0.popUI:clearUI()

	arg_25_0.gameUI = BoatAdGamingUI.New(arg_25_0._tf, arg_25_0)

	arg_25_0.gameUI:show(false)

	arg_25_0.menuUI = BoatAdGameMenuUI.New(arg_25_0._tf, arg_25_0)

	arg_25_0.menuUI:update(arg_25_0:GetMGHubData())
	arg_25_0.menuUI:show(true)

	arg_25_0.gameScene = BoatAdGameScene.New(arg_25_0._tf, arg_25_0)
end

function var_0_0.Update(arg_26_0)
	if arg_26_0.gameStop or arg_26_0.settlementFlag then
		return
	end

	if IsUnityEditor then
		if Input.GetKeyDown(KeyCode.S) then
			arg_26_0.gameUI:press(KeyCode.S, true)
		end

		if Input.GetKeyUp(KeyCode.S) then
			arg_26_0.gameUI:press(KeyCode.S, false)
		end

		if Input.GetKeyDown(KeyCode.W) then
			arg_26_0.gameUI:press(KeyCode.W, true)
		end

		if Input.GetKeyUp(KeyCode.W) then
			arg_26_0.gameUI:press(KeyCode.W, false)
		end

		if Input.GetKeyDown(KeyCode.A) then
			arg_26_0.gameUI:press(KeyCode.A, true)
		end

		if Input.GetKeyUp(KeyCode.A) then
			arg_26_0.gameUI:press(KeyCode.A, false)
		end

		if Input.GetKeyDown(KeyCode.D) then
			arg_26_0.gameUI:press(KeyCode.D, true)
		end

		if Input.GetKeyUp(KeyCode.D) then
			arg_26_0.gameUI:press(KeyCode.D, false)
		end

		if Input.GetKeyDown(KeyCode.J) then
			arg_26_0.gameScene:press(KeyCode.J, true)
		end
	end
end

function var_0_0.readyStart(arg_27_0)
	arg_27_0.readyStartFlag = true

	var_0_1.Prepare()
	arg_27_0.popUI:readyStart()
	arg_27_0.menuUI:show(false)
	arg_27_0.gameUI:show(false)
	setActive(findTF(arg_27_0._tf, "sceneBg"), false)
end

function var_0_0.gameStart(arg_28_0)
	arg_28_0.readyStartFlag = false
	arg_28_0.gameStartFlag = true
	arg_28_0.sendSuccessFlag = false

	arg_28_0.popUI:popCountUI(false)
	arg_28_0.gameUI:start()
	arg_28_0.gameUI:show(true)

	if arg_28_0.bgm ~= var_0_1.game_bgm then
		arg_28_0.bgm = var_0_1.game_bgm

		pg.BgmMgr.GetInstance():Push(arg_28_0.__cname, var_0_1.game_bgm)
	end

	arg_28_0.gameScene:start()
	arg_28_0:timerStart()
end

function var_0_0.changeSpeed(arg_29_0, arg_29_1)
	return
end

function var_0_0.onTimer(arg_30_0)
	arg_30_0:gameStep()
end

function var_0_0.gameStep(arg_31_0)
	arg_31_0:stepRunTimeData()
	arg_31_0.gameScene:step(var_0_1.deltaTime)
	arg_31_0.gameUI:step(var_0_1.deltaTime)

	if var_0_1.gameTime <= 0 then
		arg_31_0:onGameOver()
	end
end

function var_0_0.timerStart(arg_32_0)
	if not arg_32_0.timer.running then
		arg_32_0.realTimeStartUp = Time.realtimeSinceStartup

		arg_32_0.timer:Start()
	end
end

function var_0_0.timerResume(arg_33_0)
	if not arg_33_0.timer.running then
		arg_33_0.realTimeStartUp = Time.realtimeSinceStartup

		arg_33_0.timer:Start()
	end

	arg_33_0.gameScene:resume()
end

function var_0_0.timerStop(arg_34_0)
	if arg_34_0.timer.running then
		arg_34_0.timer:Stop()
	end

	arg_34_0.gameScene:stop()
end

function var_0_0.stepRunTimeData(arg_35_0)
	local var_35_0 = Time.realtimeSinceStartup - arg_35_0.realTimeStartUp

	var_0_1.gameTime = var_0_1.gameTime - var_35_0
	var_0_1.gameStepTime = var_0_1.gameStepTime + var_35_0
	var_0_1.deltaTime = var_35_0
end

function var_0_0.addScore(arg_36_0, arg_36_1)
	var_0_1.scoreNum = var_0_1.scoreNum + arg_36_1
end

function var_0_0.onGameOver(arg_37_0, arg_37_1)
	if arg_37_0.settlementFlag then
		return
	end

	arg_37_0:timerStop()
	arg_37_0:clearController()

	arg_37_0.settlementFlag = true

	setActive(arg_37_0.clickMask, true)
	LeanTween.delayedCall(go(arg_37_0._tf), 0.1, System.Action(function()
		arg_37_0.settlementFlag = false
		arg_37_0.gameStartFlag = false

		setActive(arg_37_0.clickMask, false)
		arg_37_0.popUI:updateSettlementUI()
		arg_37_0.popUI:popSettlementUI(true)
	end))
	setActive(findTF(arg_37_0._tf, "sceneBg"), true)
end

function var_0_0.OnApplicationPaused(arg_39_0)
	if not arg_39_0.gameStartFlag then
		return
	end

	if arg_39_0.readyStartFlag then
		return
	end

	if arg_39_0.settlementFlag then
		return
	end

	arg_39_0:pauseGame()
	arg_39_0.popUI:popPauseUI()
end

function var_0_0.clearController(arg_40_0)
	arg_40_0.gameScene:clear()
end

function var_0_0.pauseGame(arg_41_0)
	arg_41_0.gameStop = true

	arg_41_0:changeSpeed(0)
	arg_41_0:timerStop()
end

function var_0_0.resumeGame(arg_42_0)
	arg_42_0.gameStop = false

	arg_42_0:changeSpeed(1)
	arg_42_0:timerResume()
end

function var_0_0.onBackPressed(arg_43_0)
	if arg_43_0.readyStartFlag then
		return
	end

	if not arg_43_0.gameStartFlag then
		arg_43_0:emit(var_0_0.ON_BACK_PRESSED)

		return
	else
		if arg_43_0.settlementFlag then
			return
		end

		arg_43_0.popUI:backPressed()
	end
end

function var_0_0.OnSendMiniGameOPDone(arg_44_0, arg_44_1)
	return
end

function var_0_0.willExit(arg_45_0)
	if arg_45_0.handle then
		UpdateBeat:RemoveListener(arg_45_0.handle)
	end

	if arg_45_0._tf and LeanTween.isTweening(go(arg_45_0._tf)) then
		LeanTween.cancel(go(arg_45_0._tf))
	end

	if arg_45_0.timer and arg_45_0.timer.running then
		arg_45_0.timer:Stop()
	end

	Time.timeScale = 1
	arg_45_0.timer = nil

	var_0_1.Clear()
end

return var_0_0
