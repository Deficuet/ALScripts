local var_0_0 = class("IslandCheaterTavernGameView", import("Mod.Island.Core.View.IslandView"))

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)
end

function var_0_0.OnSceneInited(arg_2_0)
	return
end

function var_0_0.CreateViews(arg_3_0)
	arg_3_0.views = {}
end

function var_0_0.AfterCoreInit(arg_4_0)
	if arg_4_0.weatherSystem then
		arg_4_0.weatherSystem:Dispose()
	end

	arg_4_0.weatherSystem = IslandWeatherSystem.New(arg_4_0)
	arg_4_0.root = arg_4_0:CreateRoot()

	arg_4_0:InitSceneGameObject()

	arg_4_0.isSceneLoaded = true

	arg_4_0:PlayBGM()
end

function var_0_0.IsLoaded(arg_5_0)
	local var_5_0 = arg_5_0:GetAllUnits()

	return _.all(arg_5_0.views, function(arg_6_0)
		return arg_6_0:IsLoaded()
	end) and _.all(var_5_0, function(arg_7_0)
		return arg_7_0:IsLoaded()
	end)
end

function var_0_0.IsInit(arg_8_0)
	return arg_8_0.isInit
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(ISLAND_EVT.GEN_UNIT, arg_9_0.OnGenUnit)
	arg_9_0:AddListener(ISLAND_EVT.RMOVE_UNIT, arg_9_0.OnRemoveUnit)
	arg_9_0:AddListener(ISLAND_EVT.INIT_CHEATERTAVERN_CAMERA, arg_9_0.OnInitCamera)
	arg_9_0:AddListener(CheaterTavernEvent.PLAYER_QUESTION_ANIMATION, arg_9_0.OnPlayerQuestion)
	arg_9_0:AddListener(CheaterTavernEvent.SHOOT_AND_TURN_TABLE, arg_9_0.OnPlayerShoot)
	arg_9_0:AddListener(CheaterTavernEvent.PLAYER_OUT_ANIMATION, arg_9_0.OnPlayerOut)
	arg_9_0:AddListener(CheaterTavernEvent.FIRST_TAKE_SHOOT_TIPS, arg_9_0.OnFirstTakeShootTip)
	arg_9_0:AddListener(CheaterTavernEvent.CLOSE_PREPARE_MAIN_PAGE, arg_9_0.OnCloseCheaterMainPage)
	arg_9_0:AddListener(CheaterTavernEvent.PLAY_ROOM_EXIT_ROOM_DONE, arg_9_0.OnExitRoomDone)
	arg_9_0:AddListener(CheaterTavernEvent.INITPLAYER_DATA_DONE, arg_9_0.OnInitPlayerDone)
	arg_9_0:AddListener(CheaterTavernEvent.PLAY_WIN_ANIMATION, arg_9_0.OnPlayWinAnimation)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(ISLAND_EVT.GEN_UNIT, arg_10_0.OnGenUnit)
	arg_10_0:RemoveListener(ISLAND_EVT.RMOVE_UNIT, arg_10_0.OnRemoveUnit)
	arg_10_0:RemoveListener(ISLAND_EVT.INIT_CHEATERTAVERN_CAMERA, arg_10_0.OnInitCamera)
	arg_10_0:RemoveListener(CheaterTavernEvent.PLAYER_QUESTION_ANIMATION, arg_10_0.OnPlayerQuestion)
	arg_10_0:RemoveListener(CheaterTavernEvent.SHOOT_AND_TURN_TABLE, arg_10_0.OnPlayerShoot)
	arg_10_0:RemoveListener(CheaterTavernEvent.PLAYER_OUT_ANIMATION, arg_10_0.OnPlayerOut)
	arg_10_0:RemoveListener(CheaterTavernEvent.FIRST_TAKE_SHOOT_TIPS, arg_10_0.OnFirstTakeShootTip)
	arg_10_0:RemoveListener(CheaterTavernEvent.CLOSE_PREPARE_MAIN_PAGE, arg_10_0.OnCloseCheaterMainPage)
	arg_10_0:RemoveListener(CheaterTavernEvent.PLAY_ROOM_EXIT_ROOM_DONE, arg_10_0.OnExitRoomDone)
	arg_10_0:RemoveListener(CheaterTavernEvent.INITPLAYER_DATA_DONE, arg_10_0.OnInitPlayerDone)
	arg_10_0:RemoveListener(CheaterTavernEvent.PLAY_WIN_ANIMATION, arg_10_0.OnPlayWinAnimation)
end

function var_0_0.OnInitCamera(arg_11_0, arg_11_1)
	onNextTick(function()
		local var_12_0 = "lookSeet0" .. arg_11_1

		print("lookSeet0" .. Time.frameCount)
		CheatTavernCameraMgr.instance:ActiveVirtualCamera(var_12_0)
	end)
end

function var_0_0.PlayBGM(arg_13_0)
	if not arg_13_0.isSceneLoaded then
		return
	end

	var_0_0.super.PlayBGM(arg_13_0)
end

function var_0_0.OnCloseCheaterMainPage(arg_14_0)
	local var_14_0 = arg_14_0:GetSelfIsland()

	arg_14_0:NotifiyMeditor(IslandBaseMediator.SWITCH_MAP, var_14_0:GetLastExitPosition().mapId)
end

function var_0_0.OnFirstTakeShootTip(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_CHEATER_ITEM, IslandCheaterTavernConst.deskTableId)

	if var_15_0 then
		var_15_0:OnFirstTakeShootTip(arg_15_1)
	end
end

function var_0_0.OnPlayerQuestion(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_16_1)

	if var_16_0 then
		var_16_0:OnPlayerQuestion(arg_16_2)
	end

	if arg_16_3 then
		local var_16_1 = IslandCheaterTavernConst.deskCharIdList[arg_16_3]
		local var_16_2 = arg_16_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_CHEATER_ITEM, var_16_1)

		if var_16_2 then
			var_16_2:OnPlayerQuestion()
		end
	end
end

function var_0_0.OnPlayWinAnimation(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_17_1)

	if var_17_0 then
		var_17_0:OnPlayWinAnimation(arg_17_2, arg_17_3)
	end

	if arg_17_2 then
		local var_17_1 = IslandCheaterTavernConst.deskCharIdList[arg_17_3]
		local var_17_2 = arg_17_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_CHEATER_ITEM, var_17_1)

		if var_17_2 then
			var_17_2:OnPlayWinAnimation()
		end
	end
end

function var_0_0.OnPlayerShoot(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5)
	local var_18_0 = arg_18_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_CHEATER_ITEM, IslandCheaterTavernConst.deskTableId)

	if var_18_0 then
		var_18_0:OnShoot(arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5)
	end
end

function var_0_0.OnPlayerOut(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = arg_19_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_19_1)

	if var_19_0 then
		var_19_0:OnPlayerOut(arg_19_1, arg_19_2)
	end

	local var_19_1 = arg_19_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_CHEATER_ITEM, IslandCheaterTavernConst.deskCharIdList[arg_19_2])

	if var_19_1 then
		var_19_1:OnPlayerOut(arg_19_3)
	end
end

function var_0_0.OnExitRoomDone(arg_20_0)
	arg_20_0:ClearSceneObject()
	arg_20_0:InitSceneGameObject()
end

function var_0_0.OnInitPlayerDone(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(IslandCheaterTavernConst.deskCharIdList) do
		local var_21_0 = arg_21_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_CHEATER_ITEM, iter_21_1)

		if var_21_0 then
			var_21_0:InitDisplayState()
		end
	end
end

function var_0_0.ClearSceneObject(arg_22_0)
	local var_22_0 = arg_22_0:GetUnitListByKey(IslandConst.UNIT_LIST_PLAYER)
	local var_22_1 = {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		table.insert(var_22_1, iter_22_1.id)
	end

	for iter_22_2, iter_22_3 in ipairs(var_22_1) do
		arg_22_0:OnRemoveUnit(IslandConst.UNIT_LIST_PLAYER, iter_22_3)
	end

	local var_22_2 = {}
	local var_22_3 = arg_22_0:GetUnitListByKey(IslandConst.UNIT_LIST_CHEATER_ITEM)

	for iter_22_4, iter_22_5 in ipairs(var_22_3) do
		table.insert(var_22_2, iter_22_5.id)
	end

	for iter_22_6, iter_22_7 in ipairs(var_22_2) do
		arg_22_0:OnRemoveUnit(IslandConst.UNIT_LIST_CHEATER_ITEM, iter_22_7)
	end
end

function var_0_0.InitSceneGameObject(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(IslandCheaterTavernConst.deskCharIdList) do
		local var_23_1 = pg.island_world_objects[iter_23_1]

		if var_23_1.unitId > 0 then
			local var_23_2 = {
				typ = IslandConst.UNIT_TYPE_CHEATERTAVERN_CHAIR,
				index = iter_23_0
			}
			local var_23_3 = IslandDataConvertor.WorldObj2IslandUnit(var_23_1, var_23_2)

			table.insert(var_23_0, var_23_3)
		end
	end

	local var_23_4 = pg.island_world_objects[IslandCheaterTavernConst.deskTableId]
	local var_23_5 = {
		typ = IslandConst.UNIT_TYPE_CHEATERTAVERN_TABLE
	}
	local var_23_6 = IslandDataConvertor.WorldObj2IslandUnit(var_23_4, var_23_5)

	table.insert(var_23_0, var_23_6)

	for iter_23_2, iter_23_3 in ipairs(var_23_0) do
		arg_23_0:OnGenUnit(iter_23_3)
	end
end

function var_0_0.RestartGame(arg_24_0)
	return
end

function var_0_0.OnEndPerformance(arg_25_0)
	return
end

function var_0_0.DisableOp(arg_26_0)
	return
end

function var_0_0.EnableOp(arg_27_0)
	return
end

function var_0_0.OnDispose(arg_28_0)
	for iter_28_0, iter_28_1 in ipairs(arg_28_0.views) do
		iter_28_1:Dispose()
	end

	arg_28_0.weatherSystem:Dispose()
end

function var_0_0.OnRemoveUnit(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_0:GetUnitListByKey(arg_29_1)
	local var_29_1 = 0

	for iter_29_0, iter_29_1 in ipairs(var_29_0 or {}) do
		if iter_29_1.id == arg_29_2 then
			var_29_1 = iter_29_0

			break
		end
	end

	if var_29_1 > 0 then
		local var_29_2 = var_29_0[var_29_1]

		arg_29_0:RemoveUnit(var_29_2)
		var_29_2:Dispose()
	end
end

function var_0_0.OnAllPageClose(arg_30_0)
	arg_30_0.anyPageOpen = false
end

function var_0_0.OnAnyPageOpen(arg_31_0, arg_31_1)
	arg_31_0.anyPageOpen = true
end

function var_0_0.OnUnTracking(arg_32_0, arg_32_1)
	return
end

return var_0_0
