local var_0_0 = class("MusicBeatGameView", import("..BaseMiniGameView"))

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0._gameVo = MusicBeatGameVo.New(MusicBeatGameConst.mini_game_id)
end

function var_0_0.getUIName(arg_2_0)
	return MusicBeatGameConst.game_ui
end

function var_0_0.getBGM(arg_3_0)
	return MusicBeatGameConst.menu_bgm
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:initEvent()
	arg_4_0:initUI()

	if arg_4_0.contextData.rank then
		arg_4_0.menuUI:showRankUI()
	end
end

function var_0_0.initEvent(arg_5_0)
	if not arg_5_0.handle then
		arg_5_0.handle = FixedUpdateBeat:CreateListener(arg_5_0.OnUpdate, arg_5_0)

		FixedUpdateBeat:AddListener(arg_5_0.handle)
	end

	arg_5_0:bind(MusicBeatGameEvent.LEVEL_GAME, function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_1 then
			arg_5_0:onGameOver(false)
		else
			arg_5_0:resumeGame()
		end
	end)
	arg_5_0:bind(MusicBeatGameEvent.COUNT_DOWN, function(arg_7_0, arg_7_1, arg_7_2)
		arg_5_0:gameStart()
	end)
	arg_5_0:bind(MusicBeatGameEvent.ON_HOME, function(arg_8_0, arg_8_1, arg_8_2)
		arg_5_0:emit(BaseUI.ON_HOME)
	end)
	arg_5_0:bind(MusicBeatGameEvent.OPEN_PAUSE_UI, function(arg_9_0, arg_9_1, arg_9_2)
		arg_5_0.popUI:popPauseUI()
	end)
	arg_5_0:bind(MusicBeatGameEvent.OPEN_LEVEL_UI, function(arg_10_0, arg_10_1, arg_10_2)
		arg_5_0.popUI:popLeaveUI()
	end)
	arg_5_0:bind(MusicBeatGameEvent.PAUSE_GAME, function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_1 then
			arg_5_0:pauseGame()
		else
			arg_5_0:resumeGame()
		end
	end)
	arg_5_0:bind(MusicBeatGameEvent.BACK_MENU, function(arg_12_0, arg_12_1, arg_12_2)
		arg_5_0.menuUI:update(arg_5_0:GetMGHubData())
		arg_5_0.menuUI:show(true)
		arg_5_0.gameUI:show(false)
		arg_5_0.gameScene:showContainer(false)
		arg_5_0:changeBgm(MusicBeatGameConst.bgm_type_menu)
		pg.BgmMgr.GetInstance():ContinuePlay()
		arg_5_0:clearGame()
	end)
	arg_5_0:bind(MusicBeatGameEvent.CLOSE_GAME, function(arg_13_0, arg_13_1, arg_13_2)
		arg_5_0:closeView()
	end)
	arg_5_0:bind(MusicBeatGameEvent.GAME_OVER, function(arg_14_0, arg_14_1, arg_14_2)
		arg_5_0:onGameOver(arg_14_1)
	end)
	arg_5_0:bind(MusicBeatGameEvent.SHOW_RULE, function(arg_15_0, arg_15_1, arg_15_2)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[MusicBeatGameConst.rule_tip].tip
		})
	end)
	arg_5_0:bind(MusicBeatGameEvent.SHOW_RANK, function(arg_16_0, arg_16_1, arg_16_2)
		arg_5_0:getRankData()
		arg_5_0.popUI:showRank(true)
	end)
	arg_5_0:bind(MusicBeatGameEvent.READY_START, function(arg_17_0, arg_17_1, arg_17_2)
		arg_5_0:readyStart()
	end)
	arg_5_0:bind(MusicBeatGameEvent.STORE_SERVER, function(arg_18_0, arg_18_1, arg_18_2)
		getProxy(MiniGameProxy):UpdataHighScore(arg_5_0._gameVo.gameId, arg_18_1)
	end)
	arg_5_0:bind(MusicBeatGameEvent.SUBMIT_GAME_SUCCESS, function(arg_19_0, arg_19_1, arg_19_2)
		if not arg_5_0.sendSuccessFlag then
			arg_5_0.sendSuccessFlag = true

			arg_5_0:SendSuccess(0)
		end
	end)
	arg_5_0:bind(MusicBeatGameEvent.ADD_SCORE, function(arg_20_0, arg_20_1, arg_20_2)
		arg_5_0:addScore(arg_20_1.num)
		arg_5_0.gameUI:addScore(arg_20_1)
	end)
end

function var_0_0.initUI(arg_21_0)
	arg_21_0._gameVo:setGameTpl(findTF(arg_21_0._tf, "tpl"))
	setActive(findTF(arg_21_0._tf, "tpl"), false)

	arg_21_0.clickMask = findTF(arg_21_0._tf, "clickMask")
	arg_21_0.popUI = MusicBeatGamePopUI.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)

	arg_21_0.popUI:clearUI()

	arg_21_0.gameUI = MusicBeatGamingUI.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)

	arg_21_0.gameUI:show(false)

	arg_21_0.menuUI = MusicBeatGameMenuUI.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)

	arg_21_0.menuUI:update(arg_21_0:GetMGHubData())
	arg_21_0.menuUI:show(true)

	arg_21_0.gameScene = MusicBeatGameScene.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)
end

function var_0_0.changeBgm(arg_22_0, arg_22_1)
	local var_22_0

	if arg_22_1 == MusicBeatGameConst.bgm_type_default then
		var_22_0 = arg_22_0:getBGM()

		if not var_22_0 then
			if pg.CriMgr.GetInstance():IsDefaultBGM() then
				var_22_0 = pg.voice_bgm.NewMainScene.default_bgm
			else
				var_22_0 = pg.voice_bgm.NewMainScene.bgm
			end
		end
	elseif arg_22_1 == MusicBeatGameConst.bgm_type_menu then
		var_22_0 = MusicBeatGameConst.menu_bgm
	elseif arg_22_1 == MusicBeatGameConst.bgm_type_game then
		var_22_0 = MusicBeatGameConst.game_bgm
	elseif arg_22_1 == MusicBeatGameConst.bgm_type_intro then
		var_22_0 = MusicBeatGameConst.intro_bgm
	end

	pg.BgmMgr.GetInstance():Push(arg_22_0.__cname, var_22_0)
end

function var_0_0.OnUpdate(arg_23_0)
	arg_23_0:gameStep()
end

function var_0_0.readyStart(arg_24_0)
	pg.BgmMgr.GetInstance():StopPlay()

	arg_24_0.readyStartFlag = true

	arg_24_0._gameVo:prepare()
	arg_24_0.popUI:readyStart()
	arg_24_0.menuUI:show(false)
	arg_24_0.gameUI:show(false)
	arg_24_0.gameScene:readyStart()
end

function var_0_0.gameStart(arg_25_0)
	arg_25_0.readyStartFlag = false
	arg_25_0.gameStartFlag = true
	arg_25_0.sendSuccessFlag = false

	arg_25_0.popUI:popCountUI(false)
	arg_25_0.gameUI:start()
	arg_25_0.gameUI:show(true)
	arg_25_0.gameScene:start()
	arg_25_0:timerStart()
end

function var_0_0.gameStep(arg_26_0)
	if arg_26_0.gameStartFlag and not arg_26_0.gameStop then
		arg_26_0:stepRunTimeData()
		arg_26_0.gameUI:step(arg_26_0._gameVo.deltaTime)
		arg_26_0.gameScene:step(arg_26_0._gameVo.deltaTime)
		Physics2D.Simulate(arg_26_0._gameVo.deltaTime)
	end

	if IsUnityEditor then
		if Input.GetKeyDown(KeyCode.A) then
			arg_26_0:emit(MusicBeatGameEvent.KEY_CODE_DOWN, KeyCode.A)
		end

		if Input.GetKeyDown(KeyCode.D) then
			arg_26_0:emit(MusicBeatGameEvent.KEY_CODE_DOWN, KeyCode.D)
		end
	end
end

function var_0_0.timerStart(arg_27_0)
	arg_27_0.gameStop = false
end

function var_0_0.timerResume(arg_28_0)
	arg_28_0.gameStop = false

	arg_28_0.gameScene:resume()
end

function var_0_0.timerStop(arg_29_0)
	arg_29_0.gameStop = true

	arg_29_0.gameScene:stop()
end

function var_0_0.getRankData(arg_30_0)
	pg.m02:sendNotification(GAME.MINI_GAME_FRIEND_RANK, {
		id = arg_30_0._gameVo.gameId,
		callback = function(arg_31_0)
			local var_31_0 = {}

			for iter_31_0 = 1, #arg_31_0 do
				local var_31_1 = {}

				for iter_31_1, iter_31_2 in pairs(arg_31_0[iter_31_0]) do
					var_31_1[iter_31_1] = iter_31_2
				end

				table.insert(var_31_0, var_31_1)
			end

			table.sort(var_31_0, function(arg_32_0, arg_32_1)
				if arg_32_0.score ~= arg_32_1.score then
					return arg_32_0.score > arg_32_1.score
				elseif arg_32_0.time_data ~= arg_32_1.time_data then
					return arg_32_0.time_data > arg_32_1.time_data
				else
					return arg_32_0.player_id < arg_32_1.player_id
				end
			end)
			arg_30_0.popUI:updateRankData(var_31_0)
		end
	})
end

function var_0_0.stepRunTimeData(arg_33_0)
	local var_33_0 = Time.fixedDeltaTime

	arg_33_0._gameVo.gameTime = arg_33_0._gameVo.gameTime - var_33_0
	arg_33_0._gameVo.gameStepTime = arg_33_0._gameVo.gameStepTime + var_33_0
	arg_33_0._gameVo.deltaTime = var_33_0
end

function var_0_0.addScore(arg_34_0, arg_34_1)
	arg_34_0._gameVo.scoreNum = arg_34_0._gameVo.scoreNum + arg_34_1
end

function var_0_0.onGameOver(arg_35_0, arg_35_1)
	if arg_35_0.settlementFlag then
		return
	end

	arg_35_0:timerStop()
	arg_35_0:clearController()

	arg_35_0.settlementFlag = true

	setActive(arg_35_0.clickMask, true)
	LeanTween.delayedCall(go(arg_35_0._tf), 0.1, System.Action(function()
		arg_35_0.settlementFlag = false
		arg_35_0.gameStartFlag = false

		setActive(arg_35_0.clickMask, false)
		arg_35_0.popUI:updateSettlementUI()
		arg_35_0.popUI:popSettlementUI(true)
	end))

	local var_35_0 = arg_35_1 and 1 or 0

	arg_35_0:emit(BaseMiniGameMediator.GAME_FINISH_TRACKING, {
		game_id = arg_35_0._gameVo.gameId,
		hub_id = arg_35_0._gameVo.hubId,
		isComplete = var_35_0
	})
end

function var_0_0.OnApplicationPaused(arg_37_0)
	if not arg_37_0.gameStartFlag then
		return
	end

	if arg_37_0.readyStartFlag then
		return
	end

	if arg_37_0.settlementFlag then
		return
	end

	arg_37_0:pauseGame()
	arg_37_0.popUI:popPauseUI()
end

function var_0_0.clearController(arg_38_0)
	arg_38_0.gameScene:clear()
end

function var_0_0.pauseGame(arg_39_0)
	arg_39_0.gameStop = true

	arg_39_0:timerStop()
end

function var_0_0.resumeGame(arg_40_0)
	arg_40_0.gameStop = false

	arg_40_0:timerStart()
	arg_40_0:timerResume()
end

function var_0_0.clearGame(arg_41_0)
	arg_41_0.gameStop = true
end

function var_0_0.onBackPressed(arg_42_0)
	if arg_42_0.readyStartFlag then
		return
	end

	if not arg_42_0.gameStartFlag then
		return
	else
		if arg_42_0.settlementFlag then
			return
		end

		arg_42_0.popUI:backPressed()
	end
end

function var_0_0.OnSendMiniGameOPDone(arg_43_0, arg_43_1)
	return
end

function var_0_0.willExit(arg_44_0)
	if arg_44_0.handle then
		FixedUpdateBeat:RemoveListener(arg_44_0.handle)
	end

	if arg_44_0._tf and LeanTween.isTweening(go(arg_44_0._tf)) then
		LeanTween.cancel(go(arg_44_0._tf))
	end

	Time.timeScale = 1

	arg_44_0._gameVo:clear()
end

return var_0_0
