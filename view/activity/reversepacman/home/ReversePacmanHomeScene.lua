local var_0_0 = class("ReversePacmanHomeScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanHomeUI"
end

function var_0_0.forceGC(arg_2_0)
	return true
end

function var_0_0.PlayBGM(arg_3_0)
	pg.CriMgr.GetInstance():StopBGM()
end

function var_0_0.init(arg_4_0)
	onButton(arg_4_0, arg_4_0.uiHomeBtn, function()
		arg_4_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.uiBackBtn, function()
		arg_4_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
	onButton(arg_4_0, arg_4_0.uiHelpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip["20260908gameplay_main_window"].tip
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.uiTechnologyBtn, function()
		if not ReversePacmanTools.HasHireRole() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_no_char"))

			return
		end

		arg_4_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanTechnologyScene,
			mediator = ReversePacmanTechnologyMediator
		}))
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.uiBattleBtn, function()
		if not ReversePacmanTools.HasHireRole() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_no_char"))

			return
		end

		arg_4_0:emit(ReversePacmanHomeMediator.GO_GAME_SCENE)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.uiTaskBtn, function()
		arg_4_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanTaskScene,
			mediator = ReversePacmanTaskMediator
		}))
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.uiInterviewBtn, function()
		arg_4_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanInterviewScene,
			mediator = ReversePacmanInterviewMediator
		}))
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0:BlockEvents()
	arg_12_0:SetUpCourtYard()
	arg_12_0:RefreshTips()
	arg_12_0:RefreshBtns()

	if arg_12_0.contextData.technologyType then
		if not ReversePacmanTools.HasHireRole() then
			return
		end

		arg_12_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanTechnologyScene,
			mediator = ReversePacmanTechnologyMediator,
			data = {
				toggleType = arg_12_0.contextData.technologyType
			}
		}))
	end

	local var_12_0 = ReversePacmanTools.GetActivity()

	pg.NewStoryMgr.GetInstance():Play(var_12_0:getConfig("config_client").story[1])
end

function var_0_0.OnCourtYardLoaded(arg_13_0)
	arg_13_0:UnBlockEvents()

	if arg_13_0.contextData.openTaskID then
		local var_13_0 = arg_13_0.contextData.openTaskID

		arg_13_0.contextData.openTaskID = nil

		arg_13_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanTaskScene,
			mediator = ReversePacmanTaskMediator,
			data = {
				taskID = var_13_0
			}
		}))

		return
	end

	if arg_13_0.contextData.openInterview then
		arg_13_0.contextData.openInterview = nil

		arg_13_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanInterviewScene,
			mediator = ReversePacmanInterviewMediator
		}))

		return
	end

	if #ReversePacmanTools.GetUnreadyHireStory() > 0 then
		arg_13_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanInterviewScene,
			mediator = ReversePacmanInterviewMediator
		}))
	end
end

function var_0_0.SetUpCourtYard(arg_14_0)
	arg_14_0.contextData.mode = CourtYardConst.SYSTEM_REVERSE_PACMAN

	arg_14_0:emit(ReversePacmanHomeMediator.SET_UP, 1)
end

function var_0_0.BlockEvents(arg_15_0)
	arg_15_0.uiMainCanvasGrop.blocksRaycasts = false
end

function var_0_0.UnBlockEvents(arg_16_0)
	arg_16_0.uiMainCanvasGrop.blocksRaycasts = true
end

function var_0_0.RefreshBtns(arg_17_0)
	local var_17_0 = ReversePacmanTools.HasHireRole()

	setGray(arg_17_0.uiTechnologyBtn, not var_17_0)
	setGray(arg_17_0.uiBattleBtn, not var_17_0)
end

function var_0_0.RefreshTips(arg_18_0)
	local var_18_0 = ReversePacmanTools.GetActivity()

	setActive(arg_18_0.uiTechnologyTipGo, var_18_0:GetTechnologyTip())
	setActive(arg_18_0.uiBattleTipGo, var_18_0:GetGameTip())
	setActive(arg_18_0.uiTaskTipGo, var_18_0:GetTaskTip())
	setActive(arg_18_0.uiInterviewTipGo, var_18_0:GetHireTip())
end

function var_0_0.willExit(arg_19_0)
	return
end

return var_0_0
