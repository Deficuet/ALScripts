local var_0_0 = class("Dorm3dDanceScene", import("view.dorm3d.Game.Dorm3dGameTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dDanceUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.contextData.groupId

	arg_2_0.gameConfig = pg.dorm3d_dance[var_2_0]

	arg_2_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_2_0))

	arg_2_0.sceneRootName = "publiccafe"
	arg_2_0.sceneName = "map_publiccafe_01_blue"
	arg_2_0.timelineSceneRootName = pg.dorm3d_dorm_template[var_2_0].asset_name
	arg_2_0.timelineSceneName = arg_2_0.gameConfig.timeline_scene
	arg_2_0.sceneInfo = {
		{
			path = string.lower("dorm3d/scenesres/scenes/" .. arg_2_0.sceneRootName .. "/" .. arg_2_0.sceneName .. "_scene"),
			name = arg_2_0.sceneName
		},
		{
			path = string.lower("dorm3d/character/" .. arg_2_0.timelineSceneRootName .. "/timeline/" .. arg_2_0.timelineSceneName .. "/" .. arg_2_0.timelineSceneName .. "_scene"),
			name = arg_2_0.timelineSceneName
		}
	}

	seriesAsync({
		function(arg_3_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_2_0.sceneInfo[1].path, arg_2_0.sceneInfo[1].name, LoadSceneMode.Additive, function(arg_4_0, arg_4_1)
				SceneManager.SetActiveScene(arg_4_0)
				arg_3_0()
			end)
		end,
		function(arg_5_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_2_0.sceneInfo[2].path, arg_2_0.sceneInfo[2].name, LoadSceneMode.Additive, function(arg_6_0, arg_6_1)
				arg_5_0()
			end)
		end
	}, arg_2_1)
end

function var_0_0.getResource(arg_7_0)
	local var_7_0 = var_0_0.super.getResource(arg_7_0)
	local var_7_1 = arg_7_0.contextData.groupId
	local var_7_2 = pg.dorm3d_dance[var_7_1]
	local var_7_3 = pg.dorm3d_dorm_template[var_7_1]
	local var_7_4 = {
		string.lower("dorm3d/scenesres/scenes/publiccafe/map_publiccafe_01_blue_scene"),
		string.lower("dorm3d/character/" .. var_7_3.asset_name .. "/timeline/" .. var_7_2.timeline_scene .. "/" .. var_7_2.timeline_scene .. "_scene")
	}

	for iter_7_0, iter_7_1 in ipairs(var_7_4) do
		if not table.contains(var_7_0, iter_7_1) then
			table.insert(var_7_0, iter_7_1)
		end
	end

	return var_7_0
end

function var_0_0.init(arg_8_0)
	arg_8_0:InitScene()
	arg_8_0:InitUI()

	arg_8_0.gameState = Dorm3dDanceConst.GAME_STATE.NONE
	arg_8_0.criatomPlayer = CriWareMgr.Inst:GetChannelData("C_TIMELINE").channelPlayer.player

	local var_8_0 = GameObject.Find("OverlayCamera").transform

	arg_8_0.overlayCamera = var_8_0:GetComponent(typeof(Camera))
	arg_8_0.canvas = var_8_0:GetChild(0)

	pg.BgmMgr.GetInstance():StopPlay()

	local var_8_1 = Dorm3dHxHelper.GetTimelineMainCharacter()

	Dorm3dHxHelper.ReplaceCharacterParts(var_8_1)
	Dorm3dHxHelper.HideCharacterPart(var_8_1, nil, true)
	Dorm3dHxHelper.ShowHolyLight({
		var_8_1
	}, arg_8_0.holyLightRoot)
end

function var_0_0.InitUI(arg_9_0)
	arg_9_0.basePanel = arg_9_0._tf:Find("Base")

	onButton(arg_9_0, arg_9_0._tf:Find("Base/BackBtn"), function()
		arg_9_0:emit(BaseUI.ON_BACK)
	end, SFX_DORM_BACK)

	arg_9_0.prepareView = Dorm3dDancePrepareSubView.New(arg_9_0._tf:Find("Prepare"), arg_9_0.event, setmetatable({}, {
		__index = arg_9_0.contextData
	}))
	arg_9_0.gameView = Dorm3dDanceGameSubView.New(arg_9_0._tf:Find("Game"), arg_9_0.event, setmetatable({
		onSwitchCamera = function(arg_11_0)
			arg_9_0:SwtichCamera(arg_11_0)
		end,
		onTakePhoto = function()
			arg_9_0:TakePhoto()
		end,
		onEndGame = function()
			arg_9_0:EndGame()
		end,
		onShowOrHideBaseUI = function(arg_14_0)
			setActive(arg_9_0.basePanel, arg_14_0)
		end,
		onShowRealImage = function(arg_15_0, arg_15_1, arg_15_2)
			arg_9_0:ShowRealImage(arg_15_0, arg_15_1, arg_15_2)
		end,
		onShowPhotoWindow = function(arg_16_0)
			arg_9_0:GamePause()
			arg_9_0.photoWindow:Show()
			arg_9_0.photoWindow:Flush(arg_16_0)
		end
	}, {
		__index = arg_9_0.contextData
	}))
	arg_9_0.resultView = Dorm3dDanceResultSubView.New(arg_9_0._tf:Find("Result"), arg_9_0.event, setmetatable({
		onAgain = function()
			arg_9_0:InitData()
			arg_9_0:PrepareGame()
		end,
		onExit = function()
			arg_9_0:emit(BaseUI.ON_BACK)
		end,
		onShowRealImage = function(arg_19_0, arg_19_1, arg_19_2)
			arg_9_0:ShowRealImage(arg_19_0, arg_19_1, arg_19_2)
		end
	}, {
		__index = arg_9_0.contextData
	}))
	arg_9_0.viewDic = {
		[Dorm3dDanceConst.VIEW_ENUM.PREPARE] = arg_9_0.prepareView,
		[Dorm3dDanceConst.VIEW_ENUM.GAME] = arg_9_0.gameView,
		[Dorm3dDanceConst.VIEW_ENUM.RESULT] = arg_9_0.resultView
	}
	arg_9_0.photoWindow = Dorm3dDancePhotoWindow.New(arg_9_0._tf:Find("Photo"), arg_9_0.event, setmetatable({
		onHide = function()
			arg_9_0:ShowOrHideUI(true)
			arg_9_0:GameResume()
		end,
		onShowRealImage = function(arg_21_0, arg_21_1, arg_21_2)
			arg_9_0:ShowRealImage(arg_21_0, arg_21_1, arg_21_2)
		end,
		onSaveImage = function(arg_22_0)
			arg_9_0:SaveImage(arg_22_0)
		end
	}, {
		__index = arg_9_0.contextData
	}))
	arg_9_0.holyLightRoot = arg_9_0._tf:Find("HolyLightRoot")
end

function var_0_0.InitScene(arg_23_0)
	local var_23_0 = SceneManager.GetSceneByName(arg_23_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_23_0, function(arg_24_0, arg_24_1)
		if arg_24_1.name == "MainCamera" then
			arg_23_0.mainCamera = arg_24_1.transform
		end
	end)

	local var_23_1 = SceneManager.GetSceneByName(arg_23_0.timelineSceneName):GetRootGameObjects()

	table.IpairsCArray(var_23_1, function(arg_25_0, arg_25_1)
		if arg_25_1.name == arg_23_0.gameConfig.director_name then
			arg_23_0.timelinePlayer = TimelinePlayer.New(arg_25_1)
		elseif arg_25_1.name == "all_con" then
			arg_23_0.timelineCamera = arg_25_1.transform:GetComponentInChildren(typeof(Camera))

			setActive(arg_23_0.timelineCamera, false)
		end
	end)

	arg_23_0.cmTracksDic = {}

	table.IpairsCArray(TimelineHelper.GetTimelineTracks(arg_23_0.timelinePlayer.comDirector), function(arg_26_0, arg_26_1)
		if _.detect(arg_23_0.gameConfig.camera_tracks, function(arg_27_0)
			return arg_27_0 == arg_26_1.name
		end) then
			arg_23_0.cmTracksDic[arg_26_1.name] = arg_26_1
		end
	end)
	arg_23_0.timelinePlayer:Register(nil, function(arg_28_0, arg_28_1, arg_28_2)
		switch(arg_28_1.stringParameter, {
			StartGame = function()
				if arg_23_0.gameState == Dorm3dDanceConst.GAME_STATE.GAME then
					return
				end

				arg_23_0:StartGame()
			end,
			TimelinePlayOnTime = function()
				arg_28_0:RawSetTime(arg_28_1.floatParameter)
			end
		})
	end)
end

function var_0_0.didEnter(arg_31_0)
	arg_31_0:PrepareGame()
end

function var_0_0.EnterView(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.viewDic) do
		if iter_32_0 == arg_32_1 then
			iter_32_1:Show()
			iter_32_1:Flush()

			arg_32_0.currentView = iter_32_1
		else
			iter_32_1:Hide()
		end
	end
end

function var_0_0.InitData(arg_33_0)
	arg_33_0.contextData.cucoloris = {}

	for iter_33_0 = 1, Dorm3dDanceConst.CUCOLORIS_COUNT do
		local var_33_0 = math.random(1, #arg_33_0.gameConfig.cucoloris_group[iter_33_0])

		table.insert(arg_33_0.contextData.cucoloris, Dorm3dDanceCucoloris.New({
			configId = arg_33_0.gameConfig.cucoloris_group[iter_33_0][var_33_0]
		}))
	end

	if IsUnityEditor then
		warning("随机的剪影信息为：")

		for iter_33_1 = 1, Dorm3dDanceConst.CUCOLORIS_COUNT do
			warning("ID" .. arg_33_0.contextData.cucoloris[iter_33_1].configId, "时间" .. arg_33_0.contextData.cucoloris[iter_33_1]:GetTime(), "相机" .. arg_33_0.contextData.cucoloris[iter_33_1]:GetCamera())
		end
	end

	arg_33_0.contextData.photoData = {}
	arg_33_0.contextData.curCamera = arg_33_0.gameConfig.default_camera
end

function var_0_0.PrepareGame(arg_34_0)
	arg_34_0.gameState = Dorm3dDanceConst.GAME_STATE.PREPARE

	arg_34_0:InitData()
	arg_34_0:EnterView(Dorm3dDanceConst.VIEW_ENUM.PREPARE)
	setActive(arg_34_0.mainCamera, false)
	setActive(arg_34_0.timelineCamera, true)
	arg_34_0:SwtichCamera(arg_34_0.gameConfig.default_camera)
	arg_34_0.timelinePlayer:Play()
end

function var_0_0.StartGame(arg_35_0)
	arg_35_0.gameView:ClearPhoto()

	arg_35_0.gameState = Dorm3dDanceConst.GAME_STATE.GAME

	arg_35_0:EnterView(Dorm3dDanceConst.VIEW_ENUM.GAME)
end

function var_0_0.EndGame(arg_36_0)
	arg_36_0:CalcScore()
	setActive(arg_36_0.mainCamera, true)
	setActive(arg_36_0.timelineCamera, false)
	arg_36_0.timelinePlayer:Stop()

	arg_36_0.gameState = Dorm3dDanceConst.GAME_STATE.RESULT

	arg_36_0:EnterView(Dorm3dDanceConst.VIEW_ENUM.RESULT)
end

function var_0_0.CalcScore(arg_37_0)
	arg_37_0.contextData.match = {}

	if IsUnityEditor then
		warning("照片信息为：")

		for iter_37_0 = 1, Dorm3dDanceConst.PHOTO_TIMES do
			local var_37_0 = arg_37_0.contextData.photoData[iter_37_0]

			warning("ID " .. iter_37_0 .. " 时间 " .. var_37_0.time .. " 相机 " .. var_37_0.camera)
		end
	end

	if IsUnityEditor then
		warning("二分图信息为")
	end

	local var_37_1 = {}

	for iter_37_1 = 1, Dorm3dDanceConst.CUCOLORIS_COUNT do
		local var_37_2 = arg_37_0.contextData.cucoloris[iter_37_1]

		for iter_37_2 = 1, Dorm3dDanceConst.PHOTO_TIMES do
			local var_37_3 = arg_37_0.contextData.photoData[iter_37_2]
			local var_37_4, var_37_5, var_37_6 = var_37_2:CalcScore(var_37_3)

			table.insert(var_37_1, {
				iter_37_1,
				iter_37_2,
				var_37_4 + 1000 - var_37_6
			})

			if IsUnityEditor then
				warning("剪影ID " .. iter_37_1 .. " 照片ID " .. iter_37_2 .. " 分数 " .. var_37_4 .. " 时间差 " .. var_37_6)
			end
		end
	end

	local var_37_7 = 0
	local var_37_8, var_37_9 = AlgorithmHelper.KM(Dorm3dDanceConst.PHOTO_TIMES, var_37_1)

	for iter_37_3 = 1, Dorm3dDanceConst.CUCOLORIS_COUNT do
		arg_37_0.contextData.match[iter_37_3] = var_37_9[iter_37_3]

		local var_37_10, var_37_11, var_37_12 = arg_37_0.contextData.cucoloris[iter_37_3]:CalcScore(arg_37_0.contextData.photoData[var_37_9[iter_37_3]])

		var_37_7 = var_37_7 + var_37_10

		if IsUnityEditor then
			warning("剪影ID " .. iter_37_3 .. " 匹配照片ID " .. var_37_9[iter_37_3])
		end
	end

	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDance(arg_37_0.contextData.groupId, var_37_7))
end

function var_0_0.TakePhoto(arg_38_0)
	arg_38_0:GamePause()
	arg_38_0:ShowOrHideUI(false)

	local function var_38_0(arg_39_0)
		table.insert(arg_38_0.contextData.photoData, {
			camera = arg_38_0.contextData.curCamera,
			time = arg_38_0.timelinePlayer:GetTime(),
			texture = arg_39_0
		})
		arg_38_0.photoWindow:Show()
		arg_38_0.photoWindow:Flush(#arg_38_0.contextData.photoData, true)
		arg_38_0.gameView:Flush()
	end

	local var_38_1, var_38_2 = Dorm3dHxHelper.GetHolyLightScreenShotInfo(arg_38_0.holyLightRoot)

	GraphicsInterface.Instance:TakePhotoWithPost(arg_38_0.timelineCamera, var_38_1, var_38_2, var_38_0)
end

function var_0_0.GamePause(arg_40_0)
	arg_40_0.timelinePlayer:SetSpeed(0)
	arg_40_0.criatomPlayer:SetVolume(0)
	arg_40_0.criatomPlayer:UpdateAll()
end

function var_0_0.GameResume(arg_41_0)
	arg_41_0.timelinePlayer:SetSpeed(1)
	arg_41_0.criatomPlayer:SetVolume(1)
	arg_41_0.criatomPlayer:UpdateAll()
end

function var_0_0.ShowOrHideUI(arg_42_0, arg_42_1)
	if arg_42_1 then
		arg_42_0.currentView:Show()
	else
		arg_42_0.currentView:Hide()
	end

	setActive(arg_42_0.basePanel, arg_42_1)
end

function var_0_0.SwtichCamera(arg_43_0, arg_43_1)
	arg_43_0.cmTracksDic[arg_43_0.contextData.curCamera].muted = true
	arg_43_0.cmTracksDic[arg_43_1].muted = false

	arg_43_0.timelinePlayer:SetTime(arg_43_0.timelinePlayer:GetTime())

	arg_43_0.contextData.curCamera = arg_43_1
end

function var_0_0.ShowRealImage(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = arg_44_0.contextData.photoData[arg_44_1].texture

	arg_44_2:GetComponent(typeof(RawImage)).texture = var_44_0
	arg_44_2.sizeDelta = arg_44_0.canvas.sizeDelta

	local var_44_1 = math.max(arg_44_3.sizeDelta.x / arg_44_0.canvas.sizeDelta.x, arg_44_3.sizeDelta.y / arg_44_0.canvas.sizeDelta.y)

	arg_44_2.localScale = Vector3(var_44_1, var_44_1, 1)
end

function var_0_0.SaveImage(arg_45_0, arg_45_1)
	local function var_45_0(arg_46_0)
		local var_46_0 = arg_45_1.sizeDelta.x / arg_45_0.canvas.sizeDelta.x * Screen.width
		local var_46_1 = arg_45_1.sizeDelta.y / arg_45_0.canvas.sizeDelta.y * Screen.height
		local var_46_2 = UnityEngine.Texture2D.New(var_46_0, var_46_1)
		local var_46_3 = (Screen.width - var_46_0) / 2
		local var_46_4 = (Screen.height - var_46_1) / 2
		local var_46_5 = arg_46_0:GetPixels(var_46_3, var_46_4, var_46_0, var_46_1)

		var_46_2:SetPixels(var_46_5)
		var_46_2:Apply()

		local var_46_6 = Tex2DExtension.EncodeToJPG(var_46_2)

		YSNormalTool.MediaTool.SaveImageWithBytes(var_46_6, function(arg_47_0, arg_47_1)
			if arg_47_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))
			end
		end)
	end

	BLHX.Rendering.HotUpdate.ScreenShooterPass.TakePhoto(arg_45_0.overlayCamera, var_45_0)
end

function var_0_0.willExit(arg_48_0)
	for iter_48_0, iter_48_1 in pairs(arg_48_0.viewDic) do
		iter_48_1:Dispose()
	end

	arg_48_0.photoWindow:Dispose()
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_48_0 = underscore.map(arg_48_0.sceneInfo, function(arg_49_0)
		return function(arg_50_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_49_0.path, arg_49_0.name, arg_50_0)
		end
	end)

	seriesAsync(var_48_0, function()
		return
	end)
end

return var_0_0
