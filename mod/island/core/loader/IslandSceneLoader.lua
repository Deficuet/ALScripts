local var_0_0 = class("IslandSceneLoader")

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.sceneIndex = arg_1_4 or 1

	pg.UIMgr.GetInstance():LoadingOn(false)

	local var_1_0 = {
		function(arg_2_0)
			arg_1_0:LoadProgressUI(arg_1_2, arg_2_0)
		end,
		function(arg_3_0)
			gcAll(true)
			onNextTick(arg_3_0)
		end,
		function(arg_4_0)
			arg_1_0:LoadScene(arg_1_1, arg_4_0)
		end,
		function(arg_5_0)
			onNextTick(arg_5_0)
		end,
		function(arg_6_0)
			arg_1_0:LoadNavigationMesh(arg_1_2, arg_6_0)
		end,
		function(arg_7_0)
			onNextTick(arg_7_0)
		end,
		function(arg_8_0)
			arg_1_0:UnloadProgressUI()
			arg_8_0()
		end
	}

	for iter_1_0 = #arg_1_3, 1, -1 do
		table.insert(var_1_0, #var_1_0, arg_1_3[iter_1_0])
	end

	seriesAsync(var_1_0, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.LoadProgressUI(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = "Dorm3DLoading"

	if var_0_0.lastMapId and arg_10_1 then
		var_10_0 = (pg.island_map[var_0_0.lastMapId].loading == 1 or pg.island_map[arg_10_1].loading == 1) and "IslandplaneLoading" or "IslandcarLoading"
	end

	var_0_0.lastMapId = arg_10_1

	pg.SceneAnimMgr.GetInstance():CommonSceneChange(var_10_0, function(arg_11_0)
		arg_10_0.resumeCallback = arg_11_0

		return arg_10_2()
	end)
end

function var_0_0.UnloadProgressUI(arg_12_0)
	local var_12_0 = arg_12_0.resumeCallback

	arg_12_0.resumeCallback = nil

	existCall(var_12_0)
end

function var_0_0.LoadSceneWithProgress(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = string.lower(arg_13_1)
	local var_13_1 = string.match(var_13_0, "[^/]+$")
	local var_13_2 = var_13_0 .. "_scene"

	arg_13_0.scenePath = var_13_2
	arg_13_0.sceneName = var_13_1

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_13_2, var_13_1, LoadSceneMode.Additive, function(arg_14_0)
		if arg_14_0 == 1 then
			SceneOpMgr.Inst:SetActiveSceneByIndex(arg_13_0.sceneIndex)
		end

		arg_13_2(arg_14_0)
	end)
end

function var_0_0.LoadScene(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:LoadSceneWithProgress(arg_15_1, function(arg_16_0)
		if arg_16_0 == 1 then
			existCall(arg_15_2)
		end
	end)
end

function var_0_0.LoadNavigationMesh(arg_17_0, arg_17_1, arg_17_2)
	if not arg_17_1 then
		arg_17_2()

		return
	end

	arg_17_0.navMeshLoadingId = IslandAssetLoadDispatcher.Instance:Enqueue("island/Navmesh/" .. arg_17_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_18_0)
		assert(arg_18_0, "导航网格不能为空>>>>>" .. arg_17_1)

		arg_17_0.navMeshInstId = FrameAsyncInstantiateManager.Instance:EnqueueInstantiate(arg_18_0, function(arg_19_0)
			arg_17_2()
		end)
	end), true, true)
end

function var_0_0.UnLoad(arg_20_0, arg_20_1)
	arg_20_0:UnloadProgressUI()

	local var_20_0 = arg_20_0.scenePath
	local var_20_1 = arg_20_0.sceneName

	if not var_20_0 or not var_20_1 then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	SceneOpMgr.Inst:UnloadSceneAsync(var_20_0, var_20_1, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	arg_20_0.scenePath = nil
	arg_20_0.sceneName = nil
end

function var_0_0.Dispose(arg_22_0, arg_22_1)
	arg_22_0:UnLoad(arg_22_1)

	if arg_22_0.navMeshInstId then
		FrameAsyncInstantiateManager.Instance:Cancel(arg_22_0.navMeshInstId)

		arg_22_0.navMeshInstId = nil
	end

	if arg_22_0.navMeshLoadingId then
		IslandAssetLoadDispatcher.Instance:Cancel(arg_22_0.navMeshLoadingId)

		arg_22_0.navMeshLoadingId = nil
	end
end

return var_0_0
