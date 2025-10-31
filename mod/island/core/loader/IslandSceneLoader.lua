local var_0_0 = class("IslandSceneLoader")

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.sceneIndex = arg_1_4 or 1

	pg.UIMgr.GetInstance():LoadingOn(false)

	local var_1_0 = {
		function(arg_2_0)
			arg_1_0:LoadProgressUI(arg_1_2, arg_2_0)
		end,
		function(arg_3_0)
			arg_1_0:LoadScene(arg_1_1, arg_3_0)
		end,
		function(arg_4_0)
			onNextTick(arg_4_0)
		end,
		function(arg_5_0)
			arg_1_0:LoadNavigationMesh(arg_1_2, arg_5_0)
		end,
		function(arg_6_0)
			onNextTick(arg_6_0)
		end,
		function(arg_7_0)
			onNextTick(arg_7_0)
		end
	}

	for iter_1_0 = #arg_1_3, 1, -1 do
		table.insert(var_1_0, #var_1_0, arg_1_3[iter_1_0])
	end

	seriesAsync(var_1_0, function()
		gcAll(true)
		arg_1_0:UnloadProgressUI()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.LoadProgressUI(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = "Dorm3DLoading"

	if var_0_0.lastMapId and arg_9_1 then
		var_9_0 = (pg.island_map[var_0_0.lastMapId].loading == 1 or pg.island_map[arg_9_1].loading == 1) and "IslandplaneLoading" or "IslandcarLoading"
	end

	var_0_0.lastMapId = arg_9_1

	pg.SceneAnimMgr.GetInstance():CommonSceneChange(var_9_0, function(arg_10_0)
		arg_9_0.resumeCallback = arg_10_0

		return arg_9_2()
	end)
end

function var_0_0.UnloadProgressUI(arg_11_0)
	local var_11_0 = arg_11_0.resumeCallback

	arg_11_0.resumeCallback = nil

	existCall(var_11_0)
end

function var_0_0.LoadSceneWithProgress(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = string.lower(arg_12_1)
	local var_12_1 = string.match(var_12_0, "[^/]+$")
	local var_12_2 = var_12_0 .. "_scene"

	arg_12_0.scenePath = var_12_2
	arg_12_0.sceneName = var_12_1

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_12_2, var_12_1, LoadSceneMode.Additive, function(arg_13_0)
		if arg_13_0 == 1 then
			SceneOpMgr.Inst:SetActiveSceneByIndex(arg_12_0.sceneIndex)
		end

		arg_12_2(arg_13_0)
	end)
end

function var_0_0.LoadScene(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:LoadSceneWithProgress(arg_14_1, function(arg_15_0)
		if arg_15_0 == 1 then
			existCall(arg_14_2)
		end
	end)
end

function var_0_0.LoadNavigationMesh(arg_16_0, arg_16_1, arg_16_2)
	if not arg_16_1 then
		arg_16_2()

		return
	end

	arg_16_0.navMeshLoadingId = IslandAssetLoadDispatcher.Instance:Enqueue("island/Navmesh/" .. arg_16_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_17_0)
		assert(arg_17_0, "导航网格不能为空>>>>>" .. arg_16_1)

		arg_16_0.navMeshInstId = FrameAsyncInstantiateManager.Instance:EnqueueInstantiate(arg_17_0, function(arg_18_0)
			arg_16_2()
		end)
	end), true, true)
end

function var_0_0.UnLoad(arg_19_0, arg_19_1)
	arg_19_0:UnloadProgressUI()

	local var_19_0 = arg_19_0.scenePath
	local var_19_1 = arg_19_0.sceneName

	if not var_19_0 or not var_19_1 then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	SceneOpMgr.Inst:UnloadSceneAsync(var_19_0, var_19_1, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	arg_19_0.scenePath = nil
	arg_19_0.sceneName = nil
end

function var_0_0.Dispose(arg_21_0, arg_21_1)
	arg_21_0:UnLoad(arg_21_1)

	if arg_21_0.navMeshInstId then
		FrameAsyncInstantiateManager.Instance:Cancel(arg_21_0.navMeshInstId)

		arg_21_0.navMeshInstId = nil
	end

	if arg_21_0.navMeshLoadingId then
		IslandAssetLoadDispatcher.Instance:Cancel(arg_21_0.navMeshLoadingId)

		arg_21_0.navMeshLoadingId = nil
	end
end

return var_0_0
