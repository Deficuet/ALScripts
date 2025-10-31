local var_0_0 = class("NewBattleResultScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewBattleResultEmptyUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "BattleScene"
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0._parentTf = arg_3_0._tf.parent

	arg_3_0:InitData()
	arg_3_0:Adjustion()
	arg_3_0:SetUp(arg_3_0.pages)

	if arg_3_0.contextData.needVibrate then
		arg_3_0:Vibrate()
	end

	arg_3_0:BlurPanel(arg_3_0._tf, {
		staticBlur = true,
		lockGlobalBlur = true
	})
	onDelayTick(function()
		if arg_3_0.contextData.needCloseCamera then
			arg_3_0:CloseCamera()
		end
	end, 0.2)
end

function var_0_0.Adjustion(arg_5_0)
	local var_5_0 = GetComponent(arg_5_0._tf, typeof(AspectRatioFitter))

	var_5_0.enabled = true
	var_5_0.aspectRatio = pg.CameraFixMgr.GetInstance().targetRatio
	arg_5_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_6_0, arg_6_1)
		var_5_0.aspectRatio = arg_6_1
	end)
end

local function var_0_1(arg_7_0)
	if getProxy(SettingsProxy):IsDisplayResultPainting() then
		return
	end

	for iter_7_0 = #arg_7_0, 1, -1 do
		if arg_7_0[iter_7_0] == NewBattleResultDisplayPaintingsPage then
			table.remove(arg_7_0, iter_7_0)
		end
	end
end

function var_0_0.InitData(arg_8_0)
	local var_8_0 = NewBattleResultYumiaMaterialPage.NeedShowYumiaMaterailDrop(arg_8_0.contextData.drops) and {
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

	arg_8_0.pages = NewBattleResultSystem2Pages[arg_8_0.contextData.system] or var_8_0

	var_0_1(arg_8_0.pages)

	arg_8_0.contextData.oldMainShips = NewBattleResultUtil.RemoveNonStatisticShips(arg_8_0.contextData.oldMainShips, arg_8_0.contextData.statistics)
	arg_8_0.contextData.newMainShips = NewBattleResultDataExtender.GetNewMainShips(arg_8_0.contextData)
	arg_8_0.contextData.autoSkipFlag = NewBattleResultDataExtender.GetAutoSkipFlag(arg_8_0.contextData, arg_8_0.contextData.system)
	arg_8_0.contextData.needVibrate = NewBattleResultDataExtender.NeedVibrate(arg_8_0.contextData.autoSkipFlag)
	arg_8_0.contextData.needCloseCamera = NewBattleResultDataExtender.NeedCloseCamera(arg_8_0.contextData.system)
	arg_8_0.contextData.needHelpMessage = NewBattleResultDataExtender.NeedHelpMessage(arg_8_0.contextData.system, arg_8_0.contextData.score)
	arg_8_0.contextData.expBuff = NewBattleResultDataExtender.GetExpBuffs(arg_8_0.contextData.system)
	arg_8_0.contextData.buffShips = NewBattleResultDataExtender.GetShipBuffs(arg_8_0.contextData.system)
end

function var_0_0.CloseCamera(arg_9_0)
	ys.Battle.BattleCameraUtil.GetInstance().ActiveMainCamera(false)
end

function var_0_0.Vibrate(arg_10_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_AUTO_BATTLE)
	LuaHelper.Vibrate()
end

function var_0_0.SetUp(arg_11_0, arg_11_1)
	local var_11_0 = {}

	arg_11_0.history = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		table.insert(var_11_0, function(arg_12_0)
			if arg_11_0.exited then
				return
			end

			local var_12_0 = iter_11_1.New(arg_11_0._tf, arg_11_0.event, arg_11_0.contextData)

			var_12_0:ExecuteAction("SetUp", arg_12_0, function()
				arg_11_0:DestroyHistory()
			end)
			table.insert(arg_11_0.history, var_12_0)
		end)
	end

	seriesAsync(var_11_0, function()
		arg_11_0:GoBack()
	end)
end

function var_0_0.DestroyHistory(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0.history) do
		if not isa(iter_15_1, NewBattleResultStatisticsPage) then
			iter_15_1:Destroy()
		end
	end
end

function var_0_0.GoBack(arg_16_0)
	local function var_16_0()
		arg_16_0.backSceneHandler = NewBattleResultBackSceneHandler.New(arg_16_0.contextData)

		arg_16_0.backSceneHandler:Execute()
	end

	if arg_16_0.contextData.needHelpMessage then
		arg_16_0:emit(NewBattleResultMediator.OPEN_FIALED_HELP, var_16_0)
	else
		var_16_0()
	end
end

function var_0_0.onBackPressed(arg_18_0)
	return
end

function var_0_0.willExit(arg_19_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_19_0._tf, arg_19_0._parentTf)

	if arg_19_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_19_0.camEventId)

		arg_19_0.camEventId = nil
	end

	if arg_19_0.backSceneHandler then
		arg_19_0.backSceneHandler:Dispose()

		arg_19_0.backSceneHandler = nil
	end

	if arg_19_0.history then
		for iter_19_0, iter_19_1 in ipairs(arg_19_0.history) do
			iter_19_1:Destroy()
		end

		arg_19_0.history = nil
	end
end

return var_0_0
