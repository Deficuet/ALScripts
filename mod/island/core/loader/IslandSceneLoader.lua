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
		end,
		function(arg_8_0)
			IslandHelper.RunGC(true)
			onNextTick(arg_8_0)
		end,
		function(arg_9_0)
			onNextTick(arg_9_0)
		end
	}

	for iter_1_0 = #arg_1_3, 1, -1 do
		table.insert(var_1_0, #var_1_0, arg_1_3[iter_1_0])
	end

	seriesAsync(var_1_0, function()
		arg_1_0:UnloadProgressUI()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.LoadProgressUI(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = "Dorm3DLoading"

	if var_0_0.lastMapId and arg_11_1 then
		var_11_0 = (pg.island_map[var_0_0.lastMapId].loading == 1 or pg.island_map[arg_11_1].loading == 1) and "IslandplaneLoading" or "IslandcarLoading"
	end

	var_0_0.lastMapId = arg_11_1

	pg.SceneAnimMgr.GetInstance():CommonSceneChange(var_11_0, function(arg_12_0)
		arg_11_0.resumeCallback = arg_12_0

		return arg_11_2()
	end)
end

function var_0_0.UnloadProgressUI(arg_13_0)
	local var_13_0 = arg_13_0.resumeCallback

	arg_13_0.resumeCallback = nil

	existCall(var_13_0)
end

function var_0_0.LoadSceneWithProgress(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = string.lower(arg_14_1)
	local var_14_1 = string.match(var_14_0, "[^/]+$")
	local var_14_2 = var_14_0 .. "_scene"

	arg_14_0.scenePath = var_14_2
	arg_14_0.sceneName = var_14_1

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_14_2, var_14_1, LoadSceneMode.Additive, function(arg_15_0)
		if arg_15_0 == 1 then
			SceneOpMgr.Inst:SetActiveSceneByIndex(arg_14_0.sceneIndex)
		end

		arg_14_2(arg_15_0)
	end)
end

function var_0_0.LoadScene(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0:LoadSceneWithProgress(arg_16_1, function(arg_17_0)
		if arg_17_0 == 1 then
			existCall(arg_16_2)
		end
	end)
end

function var_0_0.LoadNavigationMesh(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_1 then
		arg_18_2()

		return
	end

	arg_18_0.navMeshLoadingId = IslandAssetLoadDispatcher.Instance:Enqueue("island/Navmesh/" .. arg_18_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_19_0)
		assert(arg_19_0, "导航网格不能为空>>>>>" .. arg_18_1)

		arg_18_0.navMeshInstId = FrameAsyncInstantiateManager.Instance:EnqueueInstantiate(arg_19_0, function(arg_20_0)
			arg_18_2()
		end)
	end), true, true)
end

function var_0_0.UnLoad(arg_21_0, arg_21_1)
	arg_21_0:UnloadProgressUI()

	local var_21_0 = arg_21_0.scenePath
	local var_21_1 = arg_21_0.sceneName

	if not var_21_0 or not var_21_1 then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	SceneOpMgr.Inst:UnloadSceneAsync(var_21_0, var_21_1, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	arg_21_0.scenePath = nil
	arg_21_0.sceneName = nil
end

function var_0_0.Dispose(arg_23_0, arg_23_1)
	arg_23_0:UnLoad(arg_23_1)

	if arg_23_0.navMeshInstId then
		FrameAsyncInstantiateManager.Instance:Cancel(arg_23_0.navMeshInstId)

		arg_23_0.navMeshInstId = nil
	end

	if arg_23_0.navMeshLoadingId then
		IslandAssetLoadDispatcher.Instance:Cancel(arg_23_0.navMeshLoadingId)

		arg_23_0.navMeshLoadingId = nil
	end
end

return var_0_0
