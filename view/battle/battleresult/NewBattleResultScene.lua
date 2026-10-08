local var_0_0 = class("NewBattleResultScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewBattleResultEmptyUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "BattleScene"
end

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = {
		"ui/battleresult_atlas",
		"battleresultitems/resulteffect",
		"ui/newbattleresultstatisticspage",
		"ui/zhandoujiesuan_xingxing",
		"battleresultitems/ship",
		"battleresultitems/mvpbg",
		"battleresultitems/ship",
		"battleresultitems/mvp",
		"battleresultitems/metabtn",
		"battleresultitems/levelup",
		"battleresultitems/bommander",
		"battleresultitems/failedpainting"
	}

	if NewBattleResultYumiaMaterialPage.NeedShowYumiaMaterailDrop(arg_3_0.contextData.drops) then
		table.insertto(var_3_0, arg_3_0:GetYumiaMaterialRes(arg_3_1))
	else
		table.insertto(var_3_0, arg_3_0:GetNormalRes(arg_3_1))
	end

	table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0))

	return var_3_0
end

function var_0_0.GetYumiaMaterialRes(arg_4_0, arg_4_1)
	local var_4_0 = {}

	table.insertto(var_4_0, arg_4_0:GetGradePageRes())
	table.insertto(var_4_0, arg_4_0:GetDisplayAwardPageRes())
	table.insertto(var_4_0, arg_4_0:GetDisplayPaintingsPageRes(arg_4_1))
	table.insertto(var_4_0, arg_4_0:GetStatisticsPageRes(arg_4_1))
	table.insertto(var_4_0, arg_4_0:GetYumiaMaterialPageRes())

	return var_4_0
end

function var_0_0.GetNormalRes(arg_5_0, arg_5_1)
	local var_5_0 = {}

	table.insertto(var_5_0, arg_5_0:GetGradePageRes())
	table.insertto(var_5_0, arg_5_0:GetDisplayAwardPageRes())
	table.insertto(var_5_0, arg_5_0:GetDisplayPaintingsPageRes(arg_5_1))
	table.insertto(var_5_0, arg_5_0:GetStatisticsPageRes(arg_5_1))

	return var_5_0
end

function var_0_0.GetGradePageRes(arg_6_0)
	local var_6_0 = {
		"ui/newbattleresultgradepage",
		"battleresultitems/victory",
		"battleresultitems/failed"
	}
	local var_6_1 = {
		"d",
		"c",
		"b",
		"a",
		"s"
	}

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		table.insert(var_6_0, "battlescore/battle_score_" .. iter_6_1 .. "/letter_" .. iter_6_1)
		table.insert(var_6_0, "battlescore/battle_score_" .. iter_6_1 .. "/label_" .. iter_6_1)
	end

	local var_6_2 = var_6_1[2]
	local var_6_3 = "flag_destroy"

	table.insert(var_6_0, "battlescore/battle_score_" .. var_6_2 .. "/label_" .. var_6_3)

	return var_6_0
end

function var_0_0.GetDisplayAwardPageRes(arg_7_0)
	return {}
end

function var_0_0.GetDisplayPaintingsPageRes(arg_8_0, arg_8_1)
	local var_8_0 = {
		"ui/newbattleresultdisplaypaintingspages"
	}
	local var_8_1 = arg_8_1.oldMainShips

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		local var_8_2 = iter_8_1:getPainting()

		table.insert(var_8_0, "painting/" .. var_8_2 .. "_n")
		table.insert(var_8_0, "paintingface/" .. var_8_2)
		table.insert(var_8_0, "squareicon/" .. var_8_2)
	end

	return var_8_0
end

function var_0_0.GetStatisticsPageRes(arg_9_0, arg_9_1)
	local var_9_0 = {
		"ui/newbattleresultstatisticspage",
		"battleresultitems/commander",
		"ui/BattleResultMetaExpUI"
	}
	local var_9_1 = arg_9_1.oldMainShips

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		local var_9_2 = iter_9_1:getPainting()

		table.insert(var_9_0, "herohrzicon/" .. var_9_2)
	end

	local var_9_3 = arg_9_1.commanderExps or {}
	local var_9_4 = var_9_3.surfaceCMD or var_9_3.submarineCMD or {}

	for iter_9_2 = 1, #var_9_4 do
		local var_9_5 = getProxy(CommanderProxy):getCommanderById(var_9_4[iter_9_2].commander_id)

		table.insert(var_9_0, "commandericon/" .. var_9_5:getPainting())
	end

	return var_9_0
end

function var_0_0.GetYumiaMaterialPageRes(arg_10_0)
	return {
		"ui/newbattleresultyumiarewardpages"
	}
end

function var_0_0.didEnter(arg_11_0)
	arg_11_0._parentTf = arg_11_0._tf.parent

	arg_11_0:InitData()
	arg_11_0:Adjustion()
	arg_11_0:SetUp(arg_11_0.pages)

	if arg_11_0.contextData.needVibrate then
		arg_11_0:Vibrate()
	end

	arg_11_0:BlurPanel(arg_11_0._tf, {
		staticBlur = true,
		lockGlobalBlur = true
	})
	onDelayTick(function()
		if arg_11_0.contextData.needCloseCamera then
			arg_11_0:CloseCamera()
		end
	end, 0.2)
end

function var_0_0.Adjustion(arg_13_0)
	local var_13_0 = GetComponent(arg_13_0._tf, typeof(AspectRatioFitter))

	var_13_0.enabled = true
	var_13_0.aspectRatio = pg.CameraFixMgr.GetInstance().targetRatio
	arg_13_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_14_0, arg_14_1)
		var_13_0.aspectRatio = arg_14_1
	end)
end

local function var_0_1(arg_15_0)
	if getProxy(SettingsProxy):IsDisplayResultPainting() then
		return
	end

	for iter_15_0 = #arg_15_0, 1, -1 do
		if arg_15_0[iter_15_0] == NewBattleResultDisplayPaintingsPage then
			table.remove(arg_15_0, iter_15_0)
		end
	end
end

function var_0_0.InitData(arg_16_0)
	local var_16_0 = NewBattleResultYumiaMaterialPage.NeedShowYumiaMaterailDrop(arg_16_0.contextData.drops) and {
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

	arg_16_0.pages = NewBattleResultSystem2Pages[arg_16_0.contextData.system] or var_16_0

	var_0_1(arg_16_0.pages)

	arg_16_0.contextData.oldMainShips = NewBattleResultUtil.RemoveNonStatisticShips(arg_16_0.contextData.oldMainShips, arg_16_0.contextData.statistics)
	arg_16_0.contextData.newMainShips = NewBattleResultDataExtender.GetNewMainShips(arg_16_0.contextData)
	arg_16_0.contextData.autoSkipFlag = NewBattleResultDataExtender.GetAutoSkipFlag(arg_16_0.contextData, arg_16_0.contextData.system)
	arg_16_0.contextData.needVibrate = NewBattleResultDataExtender.NeedVibrate(arg_16_0.contextData.autoSkipFlag)
	arg_16_0.contextData.needCloseCamera = NewBattleResultDataExtender.NeedCloseCamera(arg_16_0.contextData.system)
	arg_16_0.contextData.needHelpMessage = NewBattleResultDataExtender.NeedHelpMessage(arg_16_0.contextData.system, arg_16_0.contextData.score)
	arg_16_0.contextData.expBuff = NewBattleResultDataExtender.GetExpBuffs(arg_16_0.contextData.system)
	arg_16_0.contextData.buffShips = NewBattleResultDataExtender.GetShipBuffs(arg_16_0.contextData.system)
end

function var_0_0.CloseCamera(arg_17_0)
	ys.Battle.BattleCameraUtil.GetInstance().ActiveMainCamera(false)
end

function var_0_0.Vibrate(arg_18_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_AUTO_BATTLE)
	LuaHelper.Vibrate()
end

function var_0_0.SetUp(arg_19_0, arg_19_1)
	local var_19_0 = {}

	arg_19_0.history = {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_1) do
		table.insert(var_19_0, function(arg_20_0)
			if arg_19_0.exited then
				return
			end

			local var_20_0 = iter_19_1.New(arg_19_0._tf, arg_19_0.event, arg_19_0.contextData)

			var_20_0:ExecuteAction("SetUp", arg_20_0, function()
				arg_19_0:DestroyHistory()
			end)
			table.insert(arg_19_0.history, var_20_0)
		end)
	end

	seriesAsync(var_19_0, function()
		arg_19_0:GoBack()
	end)
end

function var_0_0.DestroyHistory(arg_23_0)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.history) do
		if not isa(iter_23_1, NewBattleResultStatisticsPage) then
			iter_23_1:Destroy()
		end
	end
end

function var_0_0.GoBack(arg_24_0)
	local function var_24_0()
		arg_24_0.backSceneHandler = NewBattleResultBackSceneHandler.New(arg_24_0.contextData)

		arg_24_0.backSceneHandler:Execute()
	end

	if arg_24_0.contextData.needHelpMessage then
		arg_24_0:emit(NewBattleResultMediator.OPEN_FIALED_HELP, var_24_0)
	else
		var_24_0()
	end
end

function var_0_0.onBackPressed(arg_26_0)
	return
end

function var_0_0.willExit(arg_27_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_27_0._tf, arg_27_0._parentTf)

	if arg_27_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_27_0.camEventId)

		arg_27_0.camEventId = nil
	end

	if arg_27_0.backSceneHandler then
		arg_27_0.backSceneHandler:Dispose()

		arg_27_0.backSceneHandler = nil
	end

	if arg_27_0.history then
		for iter_27_0, iter_27_1 in ipairs(arg_27_0.history) do
			iter_27_1:Destroy()
		end

		arg_27_0.history = nil
	end
end

return var_0_0
