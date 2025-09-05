local var_0_0 = class("IslandBaseDressupPage", import("...base.IslandBasePage"))

function var_0_0.Preload(arg_1_0, arg_1_1)
	arg_1_0:PrepareCharacterScene(arg_1_1)
end

function var_0_0.PrepareCharacterScene(arg_2_0, arg_2_1)
	arg_2_0.isLoadCharacterScene = true

	seriesAsync({
		function(arg_3_0)
			arg_2_0:LoadCharacterScene(arg_3_0)
		end,
		function(arg_4_0)
			arg_2_0:CreateCharacterContainer()
			arg_2_0:ModifyCameraMask()
			onNextTick(function()
				arg_2_0:ActivityCharacterCamera()
			end)
			arg_4_0()
		end
	}, arg_2_1)
end

function var_0_0.LoadCharacterScene(arg_6_0, arg_6_1)
	local var_6_0 = "island/scenesres/scenes/character/map_ship_dressup_scene"

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_6_0, "map_ship_dressup", LoadSceneMode.Additive, function(arg_7_0)
		if arg_7_0 == 1 then
			SceneOpMgr.Inst:SetActiveSceneByIndex(1)
			arg_6_1()
		end
	end)
end

function var_0_0.CreateCharacterContainer(arg_8_0)
	arg_8_0.roleContainer = GameObject.New("roleContainer").transform

	pg.ViewUtils.SetLayer(arg_8_0.roleContainer, Layer.Character3D)
end

function var_0_0.ModifyCameraMask(arg_9_0)
	local var_9_0 = IslandCameraMgr.instance._mainCamera

	arg_9_0.defaultCullingMask = var_9_0.cullingMask

	LuaHelper.SetCamCullingMask(var_9_0, "Character3D")
end

function var_0_0.ActivityCharacterCamera(arg_10_0)
	local var_10_0 = arg_10_0:GetActiveCamName()
	local var_10_1 = IslandCameraMgr.instance:GetVirtualCamera(var_10_0)

	var_10_1.Follow = arg_10_0.roleContainer
	var_10_1.LookAt = arg_10_0.roleContainer

	IslandCameraMgr.instance:ActiveVirtualCamera(var_10_0)
end

function var_0_0.GetActiveCamName(arg_11_0)
	return IslandConst.CHARA_CAMERA_NAME
end

function var_0_0.UnLoadCharacterScene(arg_12_0, arg_12_1)
	local var_12_0 = "island/scenesres/scenes/character/map_ship_dressup_scene"

	SceneOpMgr.Inst:UnloadSceneAsync(var_12_0, "map_ship_dressup", function()
		if arg_12_1 then
			arg_12_1()
		end
	end)
end

function var_0_0.ClearCharacterScene(arg_14_0, arg_14_1)
	if arg_14_0.isLoadCharacterScene then
		arg_14_0:UnLoadCharacterScene(arg_14_1)
		arg_14_0:ClearCharacterContainer()
	end

	arg_14_0.isLoadCharacterScene = false
end

function var_0_0.ClearCharacterContainer(arg_15_0)
	arg_15_0:UnloadCharacter()

	if arg_15_0.roleContainer then
		Object.Destroy(arg_15_0.roleContainer.gameObject)

		arg_15_0.roleContainer = nil
	end
end

function var_0_0.LoadCharacter(arg_16_0, arg_16_1)
	arg_16_0:UnloadCharacter()
	arg_16_0:GetPoolMgr():GetCommanderModel(arg_16_1, function(arg_17_0)
		arg_16_0.role = arg_17_0

		pg.ViewUtils.SetLayer(arg_16_0.role.transform, Layer.Character3D)
		setParent(arg_16_0.role, arg_16_0.roleContainer)

		arg_16_0.role.transform.eulerAngles = Vector3(0, 180, 0)

		local var_17_0 = arg_16_0:GetSmoothRotateObject()

		var_17_0:SetUp(arg_16_0.role.transform)

		var_17_0.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int

		arg_16_0:OnCharLoaded()
	end)
end

function var_0_0.UnloadCharacter(arg_18_0)
	local var_18_0 = arg_18_0:GetSmoothRotateObject()

	if var_18_0 then
		Object.Destroy(var_18_0)
	end

	if arg_18_0.role then
		arg_18_0:GetPoolMgr():ReturnCommanderModel(arg_18_0.role)

		arg_18_0.role = nil
	end
end

function var_0_0.Hide(arg_19_0)
	var_0_0.super.Hide(arg_19_0)
end

function var_0_0.OnDestroy(arg_20_0)
	arg_20_0:ClearCharacterScene()

	for iter_20_0, iter_20_1 in pairs(arg_20_0.cards or {}) do
		iter_20_1:Dispose()
	end

	arg_20_0.cards = nil
end

return var_0_0
