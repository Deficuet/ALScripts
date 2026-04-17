local var_0_0 = class("IslandCheaterTavernPlayRoomInfoPage", import("...page.temp.IslandExternalBridgePage"))

function var_0_0.AddListeners(arg_1_0)
	arg_1_0:AddListener(GAME.PLAY_ROOM_ALL_LOAD_OVER, arg_1_0.OnRoomAllLoadDone)
	arg_1_0:AddListener(GAME.PLAY_ROOM_REDAY_ROOM_REFRESH, arg_1_0.OnRefreshModel)
	arg_1_0:AddListener(GAME.PLAY_ROOM_MATCH_REDAY_ROOM_REFRESH, arg_1_0.OnRefreshModel)
	arg_1_0:AddListener(GAME.ISLAND_CHEATER_CHANGE_VIEW_DRESSID, arg_1_0.OnRefreshModel)
	arg_1_0:AddListener(GAME.PLAY_ROOM_ENTER_LOAD, arg_1_0.OnRefreshModel)
end

function var_0_0.RemoveListeners(arg_2_0)
	arg_2_0:RemoveListener(GAME.PLAY_ROOM_ALL_LOAD_OVER, arg_2_0.OnRoomAllLoadDone)
	arg_2_0:RemoveListener(GAME.PLAY_ROOM_REDAY_ROOM_REFRESH, arg_2_0.OnRefreshModel)
	arg_2_0:RemoveListener(GAME.PLAY_ROOM_MATCH_REDAY_ROOM_REFRESH, arg_2_0.OnRefreshModel)
	arg_2_0:RemoveListener(GAME.ISLAND_CHEATER_CHANGE_VIEW_DRESSID, arg_2_0.OnRefreshModel)
	arg_2_0:RemoveListener(GAME.PLAY_ROOM_ENTER_LOAD, arg_2_0.OnRefreshModel)
end

function var_0_0.getUIName(arg_3_0)
	return "IslandCheaterTavernPlayRoomInfoDisplayUI"
end

function var_0_0.OnLoaded(arg_4_0)
	local var_4_0 = arg_4_0._tf:Find("adapt/playerList")

	arg_4_0.playerCharTF = {}

	for iter_4_0 = 1, 4 do
		local var_4_1 = var_4_0:Find("playerItem" .. iter_4_0)

		arg_4_0.playerCharTF[iter_4_0] = var_4_1:Find("charPos")
	end
end

function var_0_0.OnShow(arg_5_0, arg_5_1)
	arg_5_0.sceneRoomType = arg_5_1

	arg_5_0:AddSubLayers(arg_5_0:GetContext())

	arg_5_0.isExit = false
	arg_5_0.playerIndexDic = {}
	arg_5_0.modelDataDic = {}

	arg_5_0:LoadRoomPlayerModel()

	arg_5_0.unReadyEffectList = {}
	arg_5_0.readyEffectList = {}

	arg_5_0:LoadLightEffect(arg_5_0.playerSlotCount)
end

function var_0_0.GetContext(arg_6_0)
	return Context.New({
		mediator = PlayRoomInfoMediator,
		viewComponent = PlayRoomInfoScene
	})
end

function var_0_0.AddSubLayers(arg_7_0, arg_7_1)
	local var_7_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(IslandMediator)

	arg_7_1.data = {
		container = arg_7_0._tf,
		onClose = function()
			pg.SceneAnimMgr.GetInstance():CommonSceneChange("Dorm3DLoading", function(arg_9_0)
				arg_7_0:Hide()
				arg_9_0()
			end)
		end,
		sceneRoomType = arg_7_0.sceneRoomType
	}

	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_7_0,
		context = arg_7_1
	})
end

function var_0_0.OnRoomAllLoadDone(arg_10_0)
	IslandCheaterTavernRecordTools.StartGame()
end

function var_0_0.OnRefreshModel(arg_11_0)
	arg_11_0:LoadRoomPlayerModel()
	arg_11_0:RefreshLight()
end

function var_0_0.RefreshLight(arg_12_0)
	local var_12_0 = getProxy(PlayRoomProxy)
	local var_12_1 = arg_12_0.playRoomProxy:GetGameLoadData()

	if var_12_1 == nil then
		if arg_12_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.CustomRoom then
			var_12_1 = var_12_0:GetRoomData()
		elseif arg_12_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.MatchInfoRoom then
			var_12_1 = var_12_0:GetMatchRoomData()
		end
	end

	if var_12_1 == nil then
		return
	end

	local var_12_2 = var_12_1.teamPosList

	for iter_12_0 = 1, arg_12_0.playerSlotCount do
		if var_12_2[iter_12_0] and var_12_2[iter_12_0][1] then
			if arg_12_0.playRoomProxy:GetGameLoadData() or table.keyof(var_12_1.readyList, var_12_2[iter_12_0][1]) then
				setActive(arg_12_0.unReadyEffectList[iter_12_0], false)
				setActive(arg_12_0.readyEffectList[iter_12_0], true)
			else
				setActive(arg_12_0.unReadyEffectList[iter_12_0], true)
				setActive(arg_12_0.readyEffectList[iter_12_0], false)
			end
		else
			setActive(arg_12_0.unReadyEffectList[iter_12_0], false)
			setActive(arg_12_0.readyEffectList[iter_12_0], false)
		end
	end
end

function var_0_0.LoadRoomPlayerModel(arg_13_0)
	arg_13_0.playRoomProxy = getProxy(PlayRoomProxy)

	local var_13_0 = arg_13_0.playRoomProxy
	local var_13_1 = arg_13_0.playRoomProxy:GetGameLoadData()

	if var_13_1 == nil then
		if arg_13_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.CustomRoom then
			var_13_1 = var_13_0:GetRoomData()
		elseif arg_13_0.sceneRoomType == IslandCheaterTavernConst.SceneRoomType.MatchInfoRoom then
			var_13_1 = var_13_0:GetMatchRoomData()
		end
	end

	if var_13_1 == nil then
		return
	end

	local var_13_2 = var_13_1.teamPosList

	arg_13_0.playerSlotCount = PlayRoomTools.GetMaxTeamCnt(var_13_1.gameType)
	arg_13_0.dressHelperDic = {}

	for iter_13_0 = 1, arg_13_0.playerSlotCount do
		if var_13_2[iter_13_0] then
			local var_13_3 = var_13_2[iter_13_0][1]
			local var_13_4 = var_13_1.playerDataList[var_13_3]

			if var_13_4 then
				arg_13_0.playerIndexDic[iter_13_0] = var_13_3

				local var_13_5 = PlayRoomTools.GetGameViewID(var_13_4.user_view)

				if not arg_13_0.dressHelperDic[iter_13_0] then
					arg_13_0.dressHelperDic[iter_13_0] = IslandShipDressHelperMiniGameNew.New()

					arg_13_0.dressHelperDic[iter_13_0]:SetShipId(var_13_5.ship_id, var_13_5.dress_list or {})
				end

				local var_13_6 = CheaterTavernHelper.GetModelDataByViewData(var_13_5)

				arg_13_0:LoadCharacter(iter_13_0, var_13_6)
			else
				arg_13_0:UnloadCharacter(iter_13_0)
			end
		end
	end
end

function var_0_0.Preload(arg_14_0, arg_14_1)
	arg_14_0:PrepareCharacterScene(arg_14_1)
end

function var_0_0.PrepareCharacterScene(arg_15_0, arg_15_1)
	arg_15_0.isLoadCharacterScene = true

	seriesAsync({
		function(arg_16_0)
			arg_15_0:CreateCharacterContainer()
			arg_15_0:LoadCharacterScene(arg_16_0)
		end,
		function(arg_17_0)
			arg_15_0:ModifyCameraMask()
			arg_15_0:ActivityCharacterCamera()
			arg_15_0:InitSceneTimeline()
			arg_17_0()
		end
	}, arg_15_1)
end

function var_0_0.CreateCharacterContainer(arg_18_0)
	arg_18_0.roleContainer = GameObject.New("roleContainer").transform

	pg.ViewUtils.SetLayer(arg_18_0.roleContainer, Layer.Character3D)
end

function var_0_0.ModifyCameraMask(arg_19_0)
	local var_19_0 = IslandCameraMgr.instance

	if IsNil(var_19_0) then
		var_19_0 = CheatTavernCameraMgr.instance
	end

	local var_19_1 = var_19_0._mainCamera

	arg_19_0.defaultCullingMask = var_19_1.cullingMask

	LuaHelper.SetCamCullingMask(var_19_1, "Character3D")
end

function var_0_0.ActivityCharacterCamera(arg_20_0)
	local var_20_0 = arg_20_0:GetActiveCamName()
	local var_20_1 = IslandCameraMgr.instance

	if IsNil(var_20_1) then
		var_20_1 = CheatTavernCameraMgr.instance
	end

	local var_20_2 = var_20_1:GetVirtualCamera(var_20_0)

	var_20_2.Follow = arg_20_0.roleContainer
	var_20_2.LookAt = arg_20_0.roleContainer

	var_20_1:ActiveVirtualCamera(var_20_0)
end

function var_0_0.InitSceneTimeline(arg_21_0)
	local var_21_0 = GameObject.Find("[sequence]")

	if var_21_0 then
		local var_21_1 = var_21_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		TimelineSupport.DynamicBinding(var_21_1)
		var_21_1:Play()
	end
end

function var_0_0.ClearCharacterScene(arg_22_0, arg_22_1)
	arg_22_0.isExit = true

	if arg_22_0.isLoadCharacterScene then
		arg_22_0:UnLoadLightEffect()
		arg_22_0:ClearCharacterContainer()
		arg_22_0:UnLoadCharacterScene(function()
			arg_22_0:ActivityPlayerCamera()
			existCall(arg_22_1)
		end)
		arg_22_0:ResetCameraMask()
		arg_22_0:emitCore(ISLAND_EVT.REFRESH_WEATHER_SYSTEM)
	end

	arg_22_0.playerIndexDic = {}
	arg_22_0.modelDataDic = {}
	arg_22_0.isLoadCharacterScene = false
end

function var_0_0.OnHome(arg_24_0)
	arg_24_0:ClearCharacterScene(function()
		arg_24_0:emit(BaseUI.ON_HOME)
	end)
end

function var_0_0.LoadCharacter(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0:UnloadCharacter(arg_26_1)

	local var_26_0 = arg_26_0.modelDataDic[arg_26_1] or {}

	arg_26_0.modelDataDic[arg_26_1] = var_26_0
	arg_26_0.modelDataDic[arg_26_1].modelData = arg_26_2

	local function var_26_1(arg_27_0)
		local var_27_0 = arg_26_0.modelDataDic[arg_26_1]

		if var_27_0 == nil or var_27_0.modelData.model ~= arg_26_2.model then
			arg_26_0:GetPoolMgr():ReturnCharacter(arg_26_2.model, arg_26_2.animator, arg_27_0)

			return
		end

		local var_27_1 = arg_27_0

		GetOrAddComponent(var_27_1, typeof(CharacterHandleController))

		arg_26_0.modelDataDic[arg_26_1].role = var_27_1

		pg.ViewUtils.SetLayer(var_27_1.transform, Layer.Character3D)
		setParent(var_27_1, arg_26_0.roleContainer)

		var_27_1.transform.eulerAngles = Vector3(0, 180, 0)

		local var_27_2 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
		local var_27_3 = arg_26_0.playerCharTF[arg_26_1]
		local var_27_4 = var_27_2:WorldToScreenPoint(var_27_3.position)
		local var_27_5 = IslandCameraMgr.instance

		if IsNil(var_27_5) then
			var_27_5 = CheatTavernCameraMgr.instance
		end

		local var_27_6 = var_27_5._mainCamera:ScreenToWorldPoint(Vector3(var_27_4.x, var_27_4.y, 10))

		var_27_1.transform.localPosition = Vector3(var_27_6.x, var_27_6.y + 0.4, var_27_6.z)

		arg_26_0:OnCharLoaded(arg_26_1, arg_26_2)
	end

	arg_26_0:_LoadModel(arg_26_2, var_26_1)
end

function var_0_0._LoadModel(arg_28_0, arg_28_1, arg_28_2)
	pg.UIMgr.GetInstance():LoadingOn()
	arg_28_0:GetPoolMgr():GetCharacter(arg_28_1.model, arg_28_1.animator, function(arg_29_0)
		arg_28_2(arg_29_0)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.UnloadCharacter(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.modelDataDic[arg_30_1]

	if var_30_0 and var_30_0.role then
		local var_30_1 = var_30_0.modelData

		pg.ViewUtils.SetLayer(var_30_0.role.transform, Layer.Default)
		arg_30_0:GetPoolMgr():ReturnCharacter(var_30_1.model, var_30_1.animator, var_30_0.role)
	end

	arg_30_0.modelDataDic[arg_30_1] = nil
	arg_30_0.playerIndexDic[arg_30_1] = nil
end

function var_0_0.LoadLightEffect(arg_31_0, arg_31_1)
	arg_31_1 = arg_31_1 or 0

	local var_31_0, var_31_1 = arg_31_0:GetLigthEffectPath()
	local var_31_2 = {}

	for iter_31_0 = 1, arg_31_1 do
		local var_31_3 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
		local var_31_4 = arg_31_0.playerCharTF[iter_31_0]
		local var_31_5 = var_31_3:WorldToScreenPoint(var_31_4.position)
		local var_31_6 = IslandCameraMgr.instance

		if IsNil(var_31_6) then
			var_31_6 = CheatTavernCameraMgr.instance
		end

		local var_31_7 = var_31_6._mainCamera:ScreenToWorldPoint(Vector3(var_31_5.x, var_31_5.y, 10))
		local var_31_8 = Vector3(var_31_7.x, var_31_7.y + 0.4, var_31_7.z)

		table.insert(var_31_2, function(arg_32_0)
			arg_31_0:GetPoolMgr():GetSceneProductEffect(var_31_0, function(arg_33_0)
				if arg_31_0.isExit then
					arg_31_0:GetPoolMgr():ReturnSceneProductEffect(var_31_0, arg_33_0)
				else
					setActive(arg_33_0, false)

					arg_33_0.transform.localPosition = var_31_8

					setParent(arg_33_0, arg_31_0.roleContainer)

					arg_31_0.unReadyEffectList[iter_31_0] = arg_33_0
				end

				arg_32_0()
			end)
		end)
		table.insert(var_31_2, function(arg_34_0)
			arg_31_0:GetPoolMgr():GetSceneProductEffect(var_31_1, function(arg_35_0)
				if arg_31_0.isExit then
					arg_31_0:GetPoolMgr():ReturnSceneProductEffect(var_31_1, arg_35_0)
				else
					setActive(arg_35_0, false)
					setParent(arg_35_0, arg_31_0.roleContainer)

					arg_35_0.transform.localPosition = var_31_8
					arg_31_0.readyEffectList[iter_31_0] = arg_35_0
				end

				arg_34_0()
			end)
		end)
	end

	seriesAsync(var_31_2, function()
		arg_31_0:RefreshLight()
	end)
end

function var_0_0.UnLoadLightEffect(arg_37_0)
	local var_37_0, var_37_1 = arg_37_0:GetLigthEffectPath()

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.readyEffectList) do
		arg_37_0:GetPoolMgr():ReturnSceneProductEffect(var_37_1, iter_37_1)
	end

	arg_37_0.readyEffectList = {}

	for iter_37_2, iter_37_3 in ipairs(arg_37_0.unReadyEffectList) do
		arg_37_0:GetPoolMgr():ReturnSceneProductEffect(var_37_0, iter_37_3)
	end

	arg_37_0.unReadyEffectList = {}
end

function var_0_0.ClearCharacterContainer(arg_38_0)
	for iter_38_0, iter_38_1 in ipairs(arg_38_0.dressHelperDic or {}) do
		iter_38_1:Destroy()
	end

	for iter_38_2 = 1, arg_38_0.playerSlotCount or 0 do
		arg_38_0:UnloadCharacter(iter_38_2)
	end

	if not IsNil(arg_38_0.roleContainer) then
		Object.Destroy(arg_38_0.roleContainer.gameObject)

		arg_38_0.roleContainer = nil
	end
end

function var_0_0.ResetCameraMask(arg_39_0)
	local var_39_0 = IslandCameraMgr.instance

	if IsNil(var_39_0) then
		var_39_0 = CheatTavernCameraMgr.instance
	end

	if arg_39_0.defaultCullingMask and var_39_0 then
		local var_39_1 = var_39_0._mainCamera

		LuaHelper.ResetCamCullingMask(var_39_1, arg_39_0.defaultCullingMask)
	end
end

function var_0_0.ActivityPlayerCamera(arg_40_0)
	if not IslandCameraMgr.instance then
		return
	end

	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
end

function var_0_0.OnHide(arg_41_0)
	var_0_0.super.OnHide(arg_41_0)
	arg_41_0:ClearCharacterScene()
end

function var_0_0.OnDisable(arg_42_0)
	arg_42_0:RemoveSubLayers(arg_42_0:GetContext())
	arg_42_0:ClearCharacterScene()
end

function var_0_0.OnDestroy(arg_43_0)
	arg_43_0:ClearCharacterScene()

	for iter_43_0, iter_43_1 in pairs(arg_43_0.cards or {}) do
		iter_43_1:Dispose()
	end

	arg_43_0.cards = nil
end

function var_0_0.GetActiveCamName(arg_44_0)
	return IslandConst.CHARA_CAMERA_NAME
end

function var_0_0.OnCharLoaded(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_0.dressHelperDic[arg_45_1]

	if var_45_0 then
		var_45_0:OnRoleLoaded(arg_45_0.modelDataDic[arg_45_1].role.transform, arg_45_2)
	end
end

function var_0_0.LoadCharacterScene(arg_46_0, arg_46_1)
	local var_46_0 = "island/scenesres/scenes/bar/map_xyd_bar_character01_scene"

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_46_0, "map_xyd_bar_character01", LoadSceneMode.Additive, function(arg_47_0)
		if arg_47_0 == 1 then
			arg_46_1()
		end
	end)
end

function var_0_0.UnLoadCharacterScene(arg_48_0, arg_48_1)
	local var_48_0 = "island/scenesres/scenes/character/map_xyd_bar_character01_scene"

	SceneOpMgr.Inst:UnloadSceneAsync(var_48_0, "map_xyd_bar_character01", function()
		if arg_48_1 then
			arg_48_1()
		end
	end)
end

function var_0_0.GetLigthEffectPath(arg_50_0)
	return "island/effect/prefab/game/bar/vfx_bar_quan_y", "island/effect/prefab/game/bar/vfx_bar_quan_b"
end

function var_0_0.OnInit(arg_51_0)
	return
end

function var_0_0.closeView(arg_52_0)
	arg_52_0.contextData.onClose()
end

return var_0_0
