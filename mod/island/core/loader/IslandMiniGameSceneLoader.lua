local var_0_0 = class("IslandMiniGameSceneLoader")

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.sceneIndex = arg_1_4 or 1

	pg.UIMgr.GetInstance():LoadingOn(false)

	local var_1_0 = {
		function(arg_2_0)
			arg_1_0:LoadScene(arg_1_1, arg_2_0)
		end,
		function(arg_3_0)
			onNextTick(arg_3_0)
		end,
		function(arg_4_0)
			onNextTick(arg_4_0)
		end,
		function(arg_5_0)
			onNextTick(arg_5_0)
		end
	}

	for iter_1_0 = 1, #arg_1_3 do
		table.insert(var_1_0, #var_1_0, arg_1_3[iter_1_0])
	end

	seriesAsync(var_1_0, function()
		gcAll(true)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.LoadSceneWithProgress(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = string.lower(arg_7_1)
	local var_7_1 = string.match(var_7_0, "[^/]+$")
	local var_7_2 = var_7_0 .. "_scene"

	arg_7_0.scenePath = var_7_2
	arg_7_0.sceneName = var_7_1

	SceneOpBackgroundMgr.Inst:LoadSceneAsyncWithProgress(var_7_2, var_7_1, LoadSceneMode.Additive, function(arg_8_0)
		if arg_8_0 == 1 then
			-- block empty
		end

		arg_7_2(arg_8_0)
	end)
end

function var_0_0.LoadScene(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:LoadSceneWithProgress(arg_9_1, function(arg_10_0)
		if arg_10_0 == 1 then
			existCall(arg_9_2)
		end
	end)
end

function var_0_0.UnLoad(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.scenePath
	local var_11_1 = arg_11_0.sceneName

	if not var_11_0 or not var_11_1 then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	SceneOpMgr.Inst:UnloadSceneAsync(var_11_0, var_11_1, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	arg_11_0.scenePath = nil
	arg_11_0.sceneName = nil
end

function var_0_0.ActivatePendingScene(arg_13_0)
	SceneOpBackgroundMgr.Inst:ActivatePendingScene()
end

function var_0_0.Dispose(arg_14_0, arg_14_1)
	arg_14_0:UnLoad(arg_14_1)
end

return var_0_0
