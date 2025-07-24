local var_0_0 = class("NewBattleResultScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewBattleResultEmptyUI"
end

function var_0_0.didEnter(arg_2_0)
	arg_2_0._parentTf = arg_2_0._tf.parent

	arg_2_0:InitData()
	arg_2_0:Adjustion()
	arg_2_0:SetUp(arg_2_0.pages)

	if arg_2_0.contextData.needVibrate then
		arg_2_0:Vibrate()
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, true, {
		lockGlobalBlur = true,
		groupName = LayerWeightConst.GROUP_COMBAT
	})
	onDelayTick(function()
		if arg_2_0.contextData.needCloseCamera then
			arg_2_0:CloseCamera()
		end
	end, 0.2)
end

function var_0_0.Adjustion(arg_4_0)
	local var_4_0 = GetComponent(arg_4_0._tf, typeof(AspectRatioFitter))

	var_4_0.enabled = true
	var_4_0.aspectRatio = pg.CameraFixMgr.GetInstance().targetRatio
	arg_4_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_5_0, arg_5_1)
		var_4_0.aspectRatio = arg_5_1
	end)
end

local function var_0_1(arg_6_0)
	if getProxy(SettingsProxy):IsDisplayResultPainting() then
		return
	end

	for iter_6_0 = #arg_6_0, 1, -1 do
		if arg_6_0[iter_6_0] == NewBattleResultDisplayPaintingsPage then
			table.remove(arg_6_0, iter_6_0)
		end
	end
end

function var_0_0.InitData(arg_7_0)
	local var_7_0 = NewBattleResultYumiaMaterialPage.NeedShowYumiaMaterailDrop(arg_7_0.contextData.drops) and {
		NewBattleResultGradePage,
		NewBattleResultDisplayAwardPage,
		NewBattleResultYumiaMaterialPage,
		NewBattleResultDisplayPaintingsPage,
		NewBattleResultStatisticsPage
	} or {
		NewBattleResultGradePage,
		NewBattleResultDisplayAwardPage,
		NewBattleResultDisplayPaintingsPage,
		NewBattleResultStatisticsPage
	}

	arg_7_0.pages = NewBattleResultSystem2Pages[arg_7_0.contextData.system] or var_7_0

	var_0_1(arg_7_0.pages)

	arg_7_0.contextData.oldMainShips = NewBattleResultUtil.RemoveNonStatisticShips(arg_7_0.contextData.oldMainShips, arg_7_0.contextData.statistics)
	arg_7_0.contextData.newMainShips = NewBattleResultDataExtender.GetNewMainShips(arg_7_0.contextData)
	arg_7_0.contextData.autoSkipFlag = NewBattleResultDataExtender.GetAutoSkipFlag(arg_7_0.contextData, arg_7_0.contextData.system)
	arg_7_0.contextData.needVibrate = NewBattleResultDataExtender.NeedVibrate(arg_7_0.contextData.autoSkipFlag)
	arg_7_0.contextData.needCloseCamera = NewBattleResultDataExtender.NeedCloseCamera(arg_7_0.contextData.system)
	arg_7_0.contextData.needHelpMessage = NewBattleResultDataExtender.NeedHelpMessage(arg_7_0.contextData.system, arg_7_0.contextData.score)
	arg_7_0.contextData.expBuff = NewBattleResultDataExtender.GetExpBuffs(arg_7_0.contextData.system)
	arg_7_0.contextData.buffShips = NewBattleResultDataExtender.GetShipBuffs(arg_7_0.contextData.system)
end

function var_0_0.CloseCamera(arg_8_0)
	ys.Battle.BattleCameraUtil.GetInstance().ActiveMainCamera(false)
end

function var_0_0.Vibrate(arg_9_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_AUTO_BATTLE)
	LuaHelper.Vibrate()
end

function var_0_0.SetUp(arg_10_0, arg_10_1)
	local var_10_0 = {}

	arg_10_0.history = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		table.insert(var_10_0, function(arg_11_0)
			if arg_10_0.exited then
				return
			end

			local var_11_0 = iter_10_1.New(arg_10_0._tf, arg_10_0.event, arg_10_0.contextData)

			var_11_0:ExecuteAction("SetUp", arg_11_0, function()
				arg_10_0:DestroyHistory()
			end)
			table.insert(arg_10_0.history, var_11_0)
		end)
	end

	seriesAsync(var_10_0, function()
		arg_10_0:GoBack()
	end)
end

function var_0_0.DestroyHistory(arg_14_0)
	for iter_14_0, iter_14_1 in ipairs(arg_14_0.history) do
		if not isa(iter_14_1, NewBattleResultStatisticsPage) then
			iter_14_1:Destroy()
		end
	end
end

function var_0_0.GoBack(arg_15_0)
	local function var_15_0()
		arg_15_0.backSceneHandler = NewBattleResultBackSceneHandler.New(arg_15_0.contextData)

		arg_15_0.backSceneHandler:Execute()
	end

	if arg_15_0.contextData.needHelpMessage then
		arg_15_0:emit(NewBattleResultMediator.OPEN_FIALED_HELP, var_15_0)
	else
		var_15_0()
	end
end

function var_0_0.onBackPressed(arg_17_0)
	return
end

function var_0_0.willExit(arg_18_0)
	pg.UIMgr:GetInstance():UnblurPanel(arg_18_0._tf, arg_18_0._parentTf)

	if arg_18_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_18_0.camEventId)

		arg_18_0.camEventId = nil
	end

	if arg_18_0.backSceneHandler then
		arg_18_0.backSceneHandler:Dispose()

		arg_18_0.backSceneHandler = nil
	end

	if arg_18_0.history then
		for iter_18_0, iter_18_1 in ipairs(arg_18_0.history) do
			iter_18_1:Destroy()
		end

		arg_18_0.history = nil
	end
end

return var_0_0
