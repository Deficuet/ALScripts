local var_0_0 = class("ReversePacmanGameScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanGameUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiTopTF:Find("back"), function()
		arg_2_0:onBackPressed()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiTopTF:Find("home"), function()
		arg_2_0:quickExitFunc()
	end, SOUND_BACK)

	arg_2_0.settleSubView = ReversePacmanSettleSubView.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN)
	arg_5_0.gameControl = ReversePacmanGameController.New(arg_5_0, arg_5_0._tf)

	arg_5_0.gameControl:SetUp(arg_5_0.contextData.levelId, arg_5_0.contextData.slotShipIds, arg_5_0.contextData.buffIds, arg_5_0.contextData.buffCnts, arg_5_0.contextData.eduBuffCnt)
end

function var_0_0.GameOver(arg_6_0, arg_6_1)
	arg_6_0.settleData = arg_6_1

	if arg_6_0.settleData.result == ReversePacmanConst.RESULT_TYPE.SUCCESS then
		arg_6_0:emit(ReversePacmanGameMediator.SETTLE_GAME, {
			actId = arg_6_0.activity.id,
			levelId = arg_6_0.contextData.levelId,
			time = arg_6_0.settleData.useTime
		})
	else
		arg_6_0:ShowSettlePanel()
	end
end

function var_0_0.ShowSettlePanel(arg_7_0, arg_7_1)
	local var_7_0 = setmetatable({
		awards = arg_7_1 or {}
	}, {
		__index = arg_7_0.settleData
	})

	arg_7_0.settleSubView:ExecuteAction("Show", var_7_0, function()
		arg_7_0:onBackPressed()
	end)
end

function var_0_0.willExit(arg_9_0)
	if arg_9_0.settleSubView then
		arg_9_0.settleSubView:Destroy()

		arg_9_0.settleSubView = nil
	end

	arg_9_0.gameControl:Dispose()
end

return var_0_0
