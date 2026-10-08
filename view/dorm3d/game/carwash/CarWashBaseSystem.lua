local var_0_0 = class("CarWashBaseSystem", import("view.dorm3d.Core.BaseSystem"))

function var_0_0.WrapContext(arg_1_0, arg_1_1)
	return {
		_raw = arg_1_1,
		GetMainCameraTF = function()
			return arg_1_1.mainCameraTF
		end,
		GetMainCamera = function()
			return arg_1_1.mainCamera
		end,
		GetCameraRoot = function()
			return arg_1_1.cameraRoot
		end,
		GetRaycaster = function()
			return arg_1_1.sceneRaycaster
		end,
		GetLadyGO = function()
			return arg_1_1.ladyGO
		end,
		GetGameConfig = function()
			return arg_1_1.contextData.gameConfig
		end,
		GetContextData = function()
			return arg_1_1.contextData
		end,
		GetLoader = function()
			return arg_1_1.loader
		end,
		GetHxHelper = function()
			return arg_1_1.hxHelper
		end,
		GetHolyLightRoot = function()
			return arg_1_1.holyLightRoot
		end
	}
end

function var_0_0.GetMainCameraTF(arg_12_0)
	return arg_12_0.context:GetMainCameraTF()
end

function var_0_0.GetMainCamera(arg_13_0)
	return arg_13_0.context:GetMainCamera()
end

function var_0_0.GetCameraRoot(arg_14_0)
	return arg_14_0.context:GetCameraRoot()
end

function var_0_0.GetRaycaster(arg_15_0)
	return arg_15_0.context:GetRaycaster()
end

function var_0_0.GetLadyGO(arg_16_0)
	return arg_16_0.context:GetLadyGO()
end

function var_0_0.GetGameConfig(arg_17_0)
	return arg_17_0.context:GetGameConfig()
end

function var_0_0.GetContextData(arg_18_0)
	return arg_18_0.context:GetContextData()
end

function var_0_0.GetLoader(arg_19_0)
	return arg_19_0.context:GetLoader()
end

function var_0_0.GetHxHelper(arg_20_0)
	return arg_20_0.context:GetHxHelper()
end

function var_0_0.GetHolyLightRoot(arg_21_0)
	return arg_21_0.context:GetHolyLightRoot()
end

return var_0_0
