local var_0_0 = class("IslandBaseShipDisplayPage", import("...base.IslandBasePage"))

function var_0_0.Preload(arg_1_0, arg_1_1)
	arg_1_0:PrepareCharacterScene(arg_1_1)
end

function var_0_0.PrepareCharacterScene(arg_2_0, arg_2_1)
	arg_2_0.isLoadCharacterScene = true

	seriesAsync({
		function(arg_3_0)
			arg_2_0:CreateCharacterContainer()
			arg_2_0:LoadCharacterScene(arg_3_0)
		end,
		function(arg_4_0)
			arg_2_0:ModifyCameraMask()
			arg_2_0:ActivityCharacterCamera()
			arg_2_0:InitSceneTimeline()
			arg_4_0()
		end
	}, arg_2_1)
end

function var_0_0.CreateCharacterContainer(arg_5_0)
	arg_5_0.roleContainer = GameObject.New("roleContainer").transform

	pg.ViewUtils.SetLayer(arg_5_0.roleContainer, Layer.Character3D)
end

function var_0_0.LoadCharacterScene(arg_6_0, arg_6_1)
	local var_6_0 = "island/scenesres/scenes/character/map_shipmainui_scene"

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_6_0, "map_shipmainui", LoadSceneMode.Additive, function(arg_7_0)
		if arg_7_0 == 1 then
			arg_6_1()
		end
	end)
end

function var_0_0.ModifyCameraMask(arg_8_0)
	local var_8_0 = IslandCameraMgr.instance._mainCamera

	arg_8_0.defaultCullingMask = var_8_0.cullingMask

	LuaHelper.SetCamCullingMask(var_8_0, "Character3D")
end

function var_0_0.ActivityCharacterCamera(arg_9_0)
	local var_9_0 = arg_9_0:GetActiveCamName()
	local var_9_1 = IslandCameraMgr.instance:GetVirtualCamera(var_9_0)

	var_9_1.Follow = arg_9_0.roleContainer
	var_9_1.LookAt = arg_9_0.roleContainer

	IslandCameraMgr.instance:ActiveVirtualCamera(var_9_0)
end

function var_0_0.InitSceneTimeline(arg_10_0)
	local var_10_0 = GameObject.Find("[sequence]")

	if var_10_0 then
		local var_10_1 = var_10_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		TimelineSupport.DynamicBinding(var_10_1)
		var_10_1:Play()
	end
end

function var_0_0.ClearCharacterScene(arg_11_0, arg_11_1)
	if arg_11_0.isLoadCharacterScene then
		arg_11_0:UnLoadCharacterScene(arg_11_1)
		arg_11_0:ClearCharacterContainer()
		arg_11_0:ResetCameraMask()
		arg_11_0:ActivityPlayerCamera()
		arg_11_0:emitCore(ISLAND_EVT.REFRESH_WEATHER_SYSTEM)
	end

	arg_11_0.isLoadCharacterScene = false
end

function var_0_0.OnHome(arg_12_0)
	arg_12_0:ClearCharacterScene(function()
		arg_12_0:emit(BaseUI.ON_HOME)
	end)
end

function var_0_0.LoadCharacter(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:UnloadCharacter(arg_14_0.loadData)

	local var_14_0 = {
		isCommander = arg_14_2,
		modelData = arg_14_1
	}

	arg_14_0.loadData = var_14_0

	local function var_14_1(arg_15_0, arg_15_1)
		if var_14_0.modelData.model ~= arg_14_0.loadData.modelData.model then
			arg_14_0:UnloadCharacter(var_14_0)

			return
		end

		arg_14_0.role = arg_15_0

		pg.ViewUtils.SetLayer(arg_14_0.role.transform, Layer.Character3D)
		setParent(arg_14_0.role, arg_14_0.roleContainer)

		arg_14_0.role.transform.eulerAngles = Vector3(0, 180, 0)

		local var_15_0 = 0
		local var_15_1 = arg_14_0._tf.rect.width / arg_14_0._tf.rect.height

		if var_15_1 < 1.7777777777777777 then
			var_15_0 = 0.5 * (1.7777777777777777 - var_15_1) / 0.4444444444444444
		end

		arg_14_0.role.transform.localPosition = Vector3(var_15_0, 0, 0)

		local var_15_2 = arg_14_0:GetSmoothRotateObject()
		local var_15_3 = GetOrAddComponent(var_15_2, typeof(SmoothRotateObject))

		var_15_3:SetUp(arg_14_0.role.transform)

		var_15_3.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int

		if arg_15_1 and arg_15_1 ~= "" then
			local var_15_4 = GetOrAddComponent(arg_14_0.role.transform:GetChild(0), typeof(Animator))

			for iter_15_0 = 1, var_15_4.layerCount do
				var_15_4:CrossFadeInFixedTime(arg_15_1, 0, iter_15_0 - 1)
			end
		end

		arg_14_0:OnCharLoaded(var_14_0.modelData)
	end

	arg_14_0:_LoadModel(var_14_0, var_14_1)
end

function var_0_0._LoadModel(arg_16_0, arg_16_1, arg_16_2)
	pg.UIMgr.GetInstance():LoadingOn()

	local var_16_0 = arg_16_1.modelData

	if arg_16_1.isCommander then
		arg_16_0:GetPoolMgr():GetCommanderModel(var_16_0, function(arg_17_0)
			arg_16_2(arg_17_0, var_16_0.personal_ani)
			pg.UIMgr.GetInstance():LoadingOff()
		end)
	else
		arg_16_0:GetPoolMgr():GetCharacter(var_16_0.model, var_16_0.animator, function(arg_18_0)
			arg_16_2(arg_18_0, var_16_0.personal_ani)
			pg.UIMgr.GetInstance():LoadingOff()
		end)
	end
end

function var_0_0.UnloadCharacter(arg_19_0, arg_19_1)
	if not arg_19_1 then
		return
	end

	local var_19_0 = arg_19_1.modelData
	local var_19_1 = arg_19_1.isCommander
	local var_19_2 = arg_19_0:GetSmoothRotateObject():GetComponent(typeof(SmoothRotateObject))

	if var_19_2 then
		Object.Destroy(var_19_2)

		local var_19_3
	end

	if arg_19_0.role then
		pg.ViewUtils.SetLayer(arg_19_0.role.transform, Layer.Default)

		if arg_19_0.isCommander then
			arg_19_0:GetPoolMgr():ReturnCommanderModel(arg_19_0.role)
		else
			arg_19_0:GetPoolMgr():ReturnCharacter(var_19_0.model, var_19_0.animator, arg_19_0.role)
		end

		arg_19_0.role = nil
	end
end

function var_0_0.ClearCharacterContainer(arg_20_0)
	arg_20_0:UnloadCharacter(arg_20_0.loadData)

	arg_20_0.loadData = nil

	if not IsNil(arg_20_0.roleContainer) then
		Object.Destroy(arg_20_0.roleContainer.gameObject)

		arg_20_0.roleContainer = nil
	end
end

function var_0_0.UnLoadCharacterScene(arg_21_0, arg_21_1)
	local var_21_0 = "island/scenesres/scenes/character/map_shipmainui_scene"

	SceneOpMgr.Inst:UnloadSceneAsync(var_21_0, "map_shipmainui", function()
		if arg_21_1 then
			arg_21_1()
		end
	end)
end

function var_0_0.ResetCameraMask(arg_23_0)
	if arg_23_0.defaultCullingMask and IslandCameraMgr.instance then
		local var_23_0 = IslandCameraMgr.instance._mainCamera

		LuaHelper.ResetCamCullingMask(var_23_0, arg_23_0.defaultCullingMask)
	end
end

function var_0_0.ActivityPlayerCamera(arg_24_0)
	if not IslandCameraMgr.instance then
		return
	end

	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
end

function var_0_0.Hide(arg_25_0)
	var_0_0.super.Hide(arg_25_0)
	arg_25_0:ClearCharacterScene()
end

function var_0_0.OnDisable(arg_26_0)
	arg_26_0:ClearCharacterScene()
end

function var_0_0.OnDestroy(arg_27_0)
	arg_27_0:ClearCharacterScene()

	for iter_27_0, iter_27_1 in pairs(arg_27_0.cards or {}) do
		iter_27_1:Dispose()
	end

	arg_27_0.cards = nil
end

function var_0_0.GetActiveCamName(arg_28_0)
	return IslandConst.CHARA_CAMERA_NAME
end

function var_0_0.GetSmoothRotateObject(arg_29_0)
	assert(false, "Write me")
end

function var_0_0.OnCharLoaded(arg_30_0)
	return
end

return var_0_0
