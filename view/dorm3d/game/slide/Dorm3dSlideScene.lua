local var_0_0 = class("Dorm3dSlideScene", import("view.dorm3d.Game.Dorm3dGameTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dSlideUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.contextData.groupId

	arg_2_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_2_0))

	arg_2_0.sceneRootName = "beach"
	arg_2_0.sceneName = "beach_01"
	arg_2_0.sceneInfo = {
		{
			path = string.lower("dorm3d/scenesres/scenes/" .. arg_2_0.sceneRootName .. "/" .. arg_2_0.sceneName .. "_scene"),
			name = arg_2_0.sceneName
		},
		{
			path = string.lower("dorm3d/character/" .. arg_2_0.timelineSceneRootName .. "/timeline/" .. arg_2_0.timelineSceneName .. "/" .. arg_2_0.timelineSceneName .. "_scene"),
			name = arg_2_0.timelineSceneName
		}
	}

	seriesAsync({
		function(arg_3_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_2_0.sceneInfo[1].path, arg_2_0.sceneInfo[1].name, LoadSceneMode.Additive, function(arg_4_0, arg_4_1)
				SceneManager.SetActiveScene(arg_4_0)
				arg_3_0()
			end)
		end,
		function(arg_5_0)
			SceneOpMgr.Inst:LoadSceneAsync(arg_2_0.sceneInfo[2].path, arg_2_0.sceneInfo[2].name, LoadSceneMode.Additive, function(arg_6_0, arg_6_1)
				arg_5_0()
			end)
		end
	}, arg_2_1)
end

function var_0_0.init(arg_7_0)
	arg_7_0:InitScene()
	arg_7_0:InitUI()
end

function var_0_0.InitUI(arg_8_0)
	return
end

function var_0_0.InitScene(arg_9_0)
	local var_9_0 = SceneManager.GetSceneByName(arg_9_0.sceneName):GetRootGameObjects()

	table.IpairsCArray(var_9_0, function(arg_10_0, arg_10_1)
		return
	end)

	local var_9_1 = SceneManager.GetSceneByName(arg_9_0.timelineSceneName):GetRootGameObjects()

	table.IpairsCArray(var_9_1, function(arg_11_0, arg_11_1)
		return
	end)
end

function var_0_0.didEnter(arg_12_0)
	return
end

function var_0_0.willExit(arg_13_0)
	local var_13_0 = underscore.map(arg_13_0.sceneInfo, function(arg_14_0)
		return function(arg_15_0)
			SceneOpMgr.Inst:UnloadSceneAsync(arg_14_0.path, arg_14_0.name, arg_15_0)
		end
	end)

	seriesAsync(var_13_0, function()
		return
	end)
end

return var_0_0
