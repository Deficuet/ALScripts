local var_0_0 = class("IslandSceneLoader")

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.sceneIndex = arg_1_4 or 1

	pg.UIMgr.GetInstance():LoadingOn(false)

	local var_1_0 = {
		function(arg_2_0)
			arg_1_0:LoadProgressUI(arg_2_0)
		end,
		function(arg_3_0)
			gcAll(true)
			onNextTick(arg_3_0)
		end,
		function(arg_4_0)
			arg_1_0:LoadScene(arg_1_1, arg_4_0)
		end,
		function(arg_5_0)
			arg_1_0:LoadNavigationMesh(arg_1_2, arg_5_0)
		end,
		function(arg_6_0)
			arg_1_0:UnloadProgressUI()
			arg_6_0()
		end
	}

	for iter_1_0 = #arg_1_3, 1, -1 do
		table.insert(var_1_0, 5, arg_1_3[iter_1_0])
	end

	seriesAsync(var_1_0, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.LoadProgressUI(arg_8_0, arg_8_1)
	pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_9_0)
		arg_8_0.resumeCallback = arg_9_0

		return arg_8_1()
	end)
end

function var_0_0.UnloadProgressUI(arg_10_0)
	local var_10_0 = arg_10_0.resumeCallback

	arg_10_0.resumeCallback = nil

	existCall(var_10_0)
end

function var_0_0.LoadSceneWithProgress(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = string.lower(arg_11_1)
	local var_11_1 = string.match(var_11_0, "[^/]+$")
	local var_11_2 = var_11_0 .. "_scene"

	arg_11_0.scenePath = var_11_2
	arg_11_0.sceneName = var_11_1

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_11_2, var_11_1, LoadSceneMode.Additive, function(arg_12_0)
		if arg_12_0 == 1 then
			SceneOpMgr.Inst:SetActiveSceneByIndex(arg_11_0.sceneIndex)
		end

		arg_11_2(arg_12_0)
	end)
end

function var_0_0.LoadScene(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0:LoadSceneWithProgress(arg_13_1, function(arg_14_0)
		if arg_14_0 == 1 then
			existCall(arg_13_2)
		end
	end)
end

function var_0_0.LoadNavigationMesh(arg_15_0, arg_15_1, arg_15_2)
	if not arg_15_1 then
		arg_15_2()

		return
	end

	ResourceMgr.Inst:getAssetAsync("island/Navmesh/" .. arg_15_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_16_0)
		assert(arg_16_0, "导航网格不能为空>>>>>" .. arg_15_1)
		Object.Instantiate(arg_16_0)
		arg_15_2()
	end), true, true)
end

function var_0_0.UnLoad(arg_17_0, arg_17_1)
	arg_17_0:UnloadProgressUI()

	local var_17_0 = arg_17_0.scenePath
	local var_17_1 = arg_17_0.sceneName

	if not var_17_0 or not var_17_1 then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	SceneOpMgr.Inst:UnloadSceneAsync(var_17_0, var_17_1, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	arg_17_0.scenePath = nil
	arg_17_0.sceneName = nil
end

function var_0_0.Dispose(arg_19_0, arg_19_1)
	arg_19_0:UnLoad(arg_19_1)
end

return var_0_0
