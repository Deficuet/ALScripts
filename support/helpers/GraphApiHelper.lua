GraphApiHelper = {}

local var_0_0 = GraphApiHelper

var_0_0.SaveKey_Graphics_API = "Force_Graphics_API"
var_0_0.Api = {
	Force_Vulkan = 1,
	Force_OpenGLES = 2
}

function var_0_0.GetGraphApiSaveValue()
	return PlayerPrefs.GetInt(var_0_0.SaveKey_Graphics_API, 0)
end

function var_0_0.IsForceVulkan()
	return var_0_0.GetGraphApiSaveValue() == var_0_0.Api.Force_Vulkan
end

function var_0_0.IsForceOpenGLES()
	return var_0_0.GetGraphApiSaveValue() == var_0_0.Api.Force_OpenGLES
end

function var_0_0.SetForceGraphApi(arg_4_0)
	if not table.contains(var_0_0.Api, arg_4_0) then
		arg_4_0 = 0
	end

	warning("Set Graphi Api " .. arg_4_0)
	PlayerPrefs.SetInt(var_0_0.SaveKey_Graphics_API, arg_4_0)
	PlayerPrefs.Save()
end

function var_0_0.GetCurGraphApi()
	return tostring(SystemInfo.graphicsDeviceType)
end

function var_0_0.IsUsingVulkan()
	local var_6_0 = var_0_0.GetCurGraphApi()

	return string.find(string.lower(var_6_0), "vulkan")
end

return var_0_0
