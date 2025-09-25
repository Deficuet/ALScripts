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
	arg_14_0:UnloadCharacter()

	arg_14_0.isCommander = arg_14_2
	arg_14_0.modelData = arg_14_1

	local function var_14_0(arg_15_0)
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

		local var_15_4 = arg_14_0.modelData.personal_ani

		if var_15_4 and var_15_4 ~= "" then
			local var_15_5 = GetOrAddComponent(arg_14_0.role.transform:GetChild(0), typeof(Animator))

			for iter_15_0 = 1, var_15_5.layerCount do
				var_15_5:CrossFadeInFixedTime(var_15_4, 0, iter_15_0 - 1)
			end
		end

		arg_14_0:OnCharLoaded()
	end

	if arg_14_0.isCommander then
		arg_14_0:GetPoolMgr():GetCommanderModel(arg_14_1, function(arg_16_0)
			var_14_0(arg_16_0)
		end)
	else
		arg_14_0:GetPoolMgr():GetCharacter(arg_14_1.model, arg_14_1.animator, function(arg_17_0)
			var_14_0(arg_17_0)
		end)
	end
end

function var_0_0.UnloadCharacter(arg_18_0)
	local var_18_0 = arg_18_0:GetSmoothRotateObject():GetComponent(typeof(SmoothRotateObject))

	if var_18_0 then
		Object.Destroy(var_18_0)

		local var_18_1
	end

	if arg_18_0.role then
		pg.ViewUtils.SetLayer(arg_18_0.role.transform, Layer.Default)

		if arg_18_0.isCommander then
			arg_18_0:GetPoolMgr():ReturnCommanderModel(arg_18_0.role)
		elseif arg_18_0.modelData then
			arg_18_0:GetPoolMgr():ReturnCharacter(arg_18_0.modelData.model, arg_18_0.modelData.animator, arg_18_0.role)

			arg_18_0.modelData = nil
		end

		arg_18_0.role = nil
	end

	arg_18_0.modelData = nil
end

function var_0_0.ClearCharacterContainer(arg_19_0)
	arg_19_0:UnloadCharacter()

	if not IsNil(arg_19_0.roleContainer) then
		Object.Destroy(arg_19_0.roleContainer.gameObject)

		arg_19_0.roleContainer = nil
	end
end

function var_0_0.UnLoadCharacterScene(arg_20_0, arg_20_1)
	local var_20_0 = "island/scenesres/scenes/character/map_shipmainui_scene"

	SceneOpMgr.Inst:UnloadSceneAsync(var_20_0, "map_shipmainui", function()
		if arg_20_1 then
			arg_20_1()
		end
	end)
end

function var_0_0.ResetCameraMask(arg_22_0)
	if arg_22_0.defaultCullingMask and IslandCameraMgr.instance then
		local var_22_0 = IslandCameraMgr.instance._mainCamera

		LuaHelper.ResetCamCullingMask(var_22_0, arg_22_0.defaultCullingMask)
	end
end

function var_0_0.ActivityPlayerCamera(arg_23_0)
	if not IslandCameraMgr.instance then
		return
	end

	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
end

function var_0_0.Hide(arg_24_0)
	var_0_0.super.Hide(arg_24_0)
	arg_24_0:ClearCharacterScene()
end

function var_0_0.OnDisable(arg_25_0)
	arg_25_0:ClearCharacterScene()
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0:ClearCharacterScene()

	for iter_26_0, iter_26_1 in pairs(arg_26_0.cards or {}) do
		iter_26_1:Dispose()
	end

	arg_26_0.cards = nil
end

function var_0_0.GetActiveCamName(arg_27_0)
	return IslandConst.CHARA_CAMERA_NAME
end

function var_0_0.GetSmoothRotateObject(arg_28_0)
	assert(false, "Write me")
end

function var_0_0.OnCharLoaded(arg_29_0)
	return
end

return var_0_0
