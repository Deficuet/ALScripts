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

function var_0_0.ClearCharacterScene(arg_10_0, arg_10_1)
	if arg_10_0.isLoadCharacterScene then
		arg_10_0:UnLoadCharacterScene(arg_10_1)
		arg_10_0:ClearCharacterContainer()
		arg_10_0:ResetCameraMask()
		arg_10_0:ActivityPlayerCamera()
	end

	arg_10_0.isLoadCharacterScene = false
end

function var_0_0.OnHome(arg_11_0)
	arg_11_0:ClearCharacterScene(function()
		arg_11_0:emit(BaseUI.ON_HOME)
	end)
end

function var_0_0.LoadCharacter(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0:UnloadCharacter()

	arg_13_0.isCommander = arg_13_2
	arg_13_0.modelData = arg_13_1

	local function var_13_0(arg_14_0)
		arg_13_0.role = arg_14_0

		pg.ViewUtils.SetLayer(arg_13_0.role.transform, Layer.Character3D)
		setParent(arg_13_0.role, arg_13_0.roleContainer)

		arg_13_0.role.transform.eulerAngles = Vector3(0, 180, 0)

		local var_14_0 = arg_13_0:GetSmoothRotateObject()

		var_14_0:SetUp(arg_13_0.role.transform)

		var_14_0.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int

		arg_13_0:OnCharLoaded()
	end

	if arg_13_0.isCommander then
		arg_13_0:GetPoolMgr():GetCommanderModel(arg_13_1, function(arg_15_0)
			var_13_0(arg_15_0)
		end)
	else
		arg_13_0:GetPoolMgr():GetCharacter(arg_13_1.model, arg_13_1.animator, function(arg_16_0)
			var_13_0(arg_16_0)
		end)
	end
end

function var_0_0.UnloadCharacter(arg_17_0)
	local var_17_0 = arg_17_0:GetSmoothRotateObject()

	if var_17_0 then
		Object.Destroy(var_17_0)
	end

	if arg_17_0.role then
		if arg_17_0.isCommander then
			arg_17_0:GetPoolMgr():ReturnCommanderModel(arg_17_0.role)
		elseif arg_17_0.modelData then
			arg_17_0:GetPoolMgr():ReturnCharacter(arg_17_0.modelData.model, arg_17_0.modelData.animator, arg_17_0.role)

			arg_17_0.modelData = nil
		end

		arg_17_0.role = nil
	end
end

function var_0_0.ClearCharacterContainer(arg_18_0)
	arg_18_0:UnloadCharacter()

	if not IsNil(arg_18_0.roleContainer) then
		Object.Destroy(arg_18_0.roleContainer.gameObject)

		arg_18_0.roleContainer = nil
	end
end

function var_0_0.UnLoadCharacterScene(arg_19_0, arg_19_1)
	local var_19_0 = "island/scenesres/scenes/character/map_shipmainui_scene"

	SceneOpMgr.Inst:UnloadSceneAsync(var_19_0, "map_shipmainui", function()
		if arg_19_1 then
			arg_19_1()
		end
	end)
end

function var_0_0.ResetCameraMask(arg_21_0)
	if arg_21_0.defaultCullingMask and IslandCameraMgr.instance then
		local var_21_0 = IslandCameraMgr.instance._mainCamera

		LuaHelper.ResetCamCullingMask(var_21_0, arg_21_0.defaultCullingMask)
	end
end

function var_0_0.ActivityPlayerCamera(arg_22_0)
	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
end

function var_0_0.Hide(arg_23_0)
	var_0_0.super.Hide(arg_23_0)
	arg_23_0:ClearCharacterScene()
end

function var_0_0.OnDisable(arg_24_0)
	arg_24_0:ClearCharacterScene()
end

function var_0_0.OnDestroy(arg_25_0)
	arg_25_0:ClearCharacterScene()

	for iter_25_0, iter_25_1 in pairs(arg_25_0.cards or {}) do
		iter_25_1:Dispose()
	end

	arg_25_0.cards = nil
end

function var_0_0.GetActiveCamName(arg_26_0)
	return IslandConst.CHARA_CAMERA_NAME
end

function var_0_0.GetSmoothRotateObject(arg_27_0)
	assert(false, "Write me")
end

function var_0_0.OnCharLoaded(arg_28_0)
	return
end

return var_0_0
