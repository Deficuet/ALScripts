local var_0_0 = class("CarWashScene", import("view.dorm3d.Core.Dorm3dBaseScene"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dCarWashUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = var_0_0.super.getResource(arg_2_0)

	for iter_2_0, iter_2_1 in ipairs(Dorm3dHxHelper.GetMaterialResources(arg_2_0.contextData.groupId)) do
		table.insert(var_2_0, iter_2_1)
	end

	return var_2_0
end

function var_0_0.forceGC(arg_3_0)
	return true
end

function var_0_0.GetDefaultSystemClasses()
	return CarWashConst.GetDefaultSystemClasses()
end

function var_0_0.loadingQueue(arg_5_0)
	return function(arg_6_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_7_0)
			return arg_6_0(arg_7_0)
		end)
	end
end

function var_0_0.preload(arg_8_0, arg_8_1)
	arg_8_0.sceneInfo = {
		{
			path = "dorm3d/scenesres/scenes/carwash/map_carwash_01_scene",
			name = "map_carwash_01"
		},
		{
			path = "dorm3d/scenesres/scenes/carwash/carwash_gameplay_scene",
			name = "carwash_gameplay"
		}
	}
	arg_8_0.loader = AutoLoader.New()
	arg_8_0.hxHelper = Dorm3dHxHelper.New(arg_8_0.loader)

	seriesAsync({
		function(arg_9_0)
			arg_8_0.hxHelper:LoadMaterials(arg_8_0.contextData.groupId, arg_9_0)
		end,
		function(arg_10_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_8_0.sceneInfo[1].path, arg_8_0.sceneInfo[1].name, LoadSceneMode.Additive, function(arg_11_0, arg_11_1)
				SceneManager.SetActiveScene(arg_11_0)
				arg_10_0()
			end)
		end,
		function(arg_12_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_8_0.sceneInfo[2].path, arg_8_0.sceneInfo[2].name, LoadSceneMode.Additive, function(arg_13_0, arg_13_1)
				arg_12_0()
			end)
		end,
		function(arg_14_0)
			local var_14_0 = pg.dorm3d_carwash[arg_8_0.contextData.groupId].character_prefab

			arg_8_0.loader:GetPrefab(var_14_0, "", function(arg_15_0)
				arg_8_0.ladyGO = arg_15_0

				arg_14_0()
			end)
		end
	}, arg_8_1)
end

function var_0_0.willExit(arg_16_0)
	var_0_0.super.willExit(arg_16_0)

	if arg_16_0.updateHandler then
		UpdateBeat:RemoveListener(arg_16_0.updateHandler)

		arg_16_0.updateHandler = nil
	end

	arg_16_0.loader:Clear()

	arg_16_0.hxHelper = nil

	local var_16_0 = underscore.map(arg_16_0.sceneInfo, function(arg_17_0)
		return function(arg_18_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_17_0.path, arg_17_0.name, arg_18_0)
		end
	end)

	seriesAsync(var_16_0, function()
		return
	end)
end

function var_0_0.init(arg_20_0)
	arg_20_0:InitSceneRefs()
	arg_20_0:InitExtraSystem({
		CarWashGameFlowSystem
	})
	arg_20_0:InitPage()
	arg_20_0:InitExtraSystem(CarWashConst.GetGameplaySystemClasses())
	arg_20_0:InitHX()
end

function var_0_0.InitHX(arg_21_0)
	arg_21_0.holyLightRoot = arg_21_0._tf:Find("HolyLightRoot")

	arg_21_0.hxHelper:Apply(arg_21_0.ladyGO.transform)
	Dorm3dHxHelper.HideCharacterPart(arg_21_0.ladyGO.transform, nil, true)
	Dorm3dHxHelper.ShowHolyLight({
		arg_21_0.ladyGO.transform
	}, arg_21_0.holyLightRoot, true)
end

function var_0_0.InitPage(arg_22_0)
	arg_22_0.mainPage = CarWashMainPage.New(arg_22_0._tf, arg_22_0.event, arg_22_0.contextData)
	arg_22_0.gamePage = CarWashGamePage.New(arg_22_0._tf:Find("game"), arg_22_0.event, arg_22_0.contextData)
	arg_22_0.phase2Page = CarWashPhase2Page.New(arg_22_0._tf:Find("phase2"), arg_22_0.event, arg_22_0.contextData)
	arg_22_0.endPage = CarWashEndPage.New(arg_22_0._tf:Find("end"), arg_22_0.event, arg_22_0.contextData)
end

function var_0_0.InitSceneRefs(arg_23_0)
	setActive(GameObject.Find("Camera"), false)

	arg_23_0.mainCameraGO = GameObject.Find("BackYardMainCamera")
	arg_23_0.mainCameraTF = arg_23_0.mainCameraGO.transform
	arg_23_0.mainCamera = arg_23_0.mainCameraGO:GetComponent(typeof(Camera))
	arg_23_0.cameraRoot = GameObject.Find("CM Cameras").transform
	arg_23_0.raycastCamera = arg_23_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_23_0.sceneRaycaster = arg_23_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
end

function var_0_0.didEnter(arg_24_0)
	arg_24_0:emit(CarWashGameFlowSystem.START_GAME, function()
		arg_24_0:StartUpdate()
	end)
end

function var_0_0.StartUpdate(arg_26_0)
	if arg_26_0.updateHandler then
		return
	end

	arg_26_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_26_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_26_0.updateHandler)
end

function var_0_0.Update(arg_30_0)
	if arg_30_0.exited then
		return
	end

	if arg_30_0.systemManager then
		arg_30_0.systemManager:Update(Time.deltaTime)
	end
end

return var_0_0
