local var_0_0 = class("Dorm3dLightingSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.APPLY_DAY_NIGHT = "Dorm3dLightingSystem.APPLY_DAY_NIGHT"
var_0_0.SET_CAMERA_SETTINGS = "Dorm3dLightingSystem.SET_CAMERA_SETTINGS"
var_0_0.REVERT_CAMERA_SETTINGS = "Dorm3dLightingSystem.REVERT_CAMERA_SETTINGS"
var_0_0.SET_VOLUME_PROFILE = "Dorm3dLightingSystem.SET_VOLUME_PROFILE"
var_0_0.REVERT_VOLUME_PROFILE = "Dorm3dLightingSystem.REVERT_VOLUME_PROFILE"
var_0_0.REVERT_CHARACTER_LIGHT = "Dorm3dLightingSystem.REVERT_CHARACTER_LIGHT"

function var_0_0.OnInit(arg_1_0)
	local var_1_0 = GameObject.Find("[MainBlock]")

	assert(var_1_0, "Dorm3dLightingSystem requires [MainBlock]")

	arg_1_0.daynightCtrlComp = var_1_0:GetComponent("DayNightCtrl")
	arg_1_0.volumeRequest = nil
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.APPLY_DAY_NIGHT, function(arg_3_0, arg_3_1)
		arg_2_0:ApplyDayNight(arg_3_1)
	end)
	arg_2_0:Bind(var_0_0.SET_CAMERA_SETTINGS, function(arg_4_0, arg_4_1)
		arg_2_0:SettingCamera(arg_4_1)
	end)
	arg_2_0:Bind(var_0_0.REVERT_CAMERA_SETTINGS, function()
		arg_2_0:RevertCameraSettings()
	end)
	arg_2_0:Bind(var_0_0.SET_VOLUME_PROFILE, function(arg_6_0, arg_6_1, arg_6_2)
		arg_2_0:SetVolumeProfile(arg_6_1, arg_6_2)
	end)
	arg_2_0:Bind(var_0_0.REVERT_VOLUME_PROFILE, function()
		arg_2_0:RevertVolumeProfile()
	end)
	arg_2_0:Bind(var_0_0.REVERT_CHARACTER_LIGHT, function()
		arg_2_0:RevertCharacterLight()
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_WILL_CHANGE, function()
		arg_2_0:RevertVolumeProfile()

		arg_2_0.daynightCtrlComp = nil
	end)
	arg_2_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_CHANGED, function()
		arg_2_0:RefreshArtSceneRefs()
		arg_2_0:ApplyDayNight(arg_2_0:GetTimeIndex())
	end)
end

function var_0_0.RefreshArtSceneRefs(arg_11_0)
	local var_11_0 = GameObject.Find("[MainBlock]")

	assert(var_11_0, "Dorm3dLightingSystem requires [MainBlock]")

	arg_11_0.daynightCtrlComp = var_11_0:GetComponent("DayNightCtrl")
end

function var_0_0.ApplyDayNight(arg_12_0, arg_12_1)
	if not IsNil(arg_12_0.daynightCtrlComp) then
		arg_12_0.daynightCtrlComp:SwitcherToIndex(arg_12_1 - 1)
	end

	arg_12_0:RefreshLightSettings()
end

function var_0_0.FindGlobalVolume(arg_13_0)
	local var_13_0 = GameObject.Find("GlobalVolume")

	assert(var_13_0, "Dorm3dLightingSystem requires GlobalVolume")

	return var_13_0
end

function var_0_0.FindCharacterLight(arg_14_0)
	local var_14_0 = GameObject.Find("CharacterLight")

	assert(var_14_0, "Dorm3dLightingSystem requires CharacterLight")

	return var_14_0
end

function var_0_0.FindLightingRoot(arg_15_0)
	local var_15_0 = GameObject.Find("[Lighting]")

	assert(var_15_0, "Dorm3dLightingSystem requires [Lighting]")

	return var_15_0.transform
end

function var_0_0.RefreshLightSettings(arg_16_0)
	local var_16_0 = arg_16_0:FindGlobalVolume()

	arg_16_0:RegisterGlobalVolume(var_16_0)

	local var_16_1 = arg_16_0:FindCharacterLight()

	arg_16_0:RecordCharacterLight(var_16_1)

	local var_16_2 = arg_16_0:FindLightingRoot()

	table.IpairsCArray(var_16_2:GetComponentsInChildren(typeof(Light), true), function(arg_17_0, arg_17_1)
		arg_17_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.RegisterGlobalVolume(arg_18_0, arg_18_1)
	local var_18_0 = GraphicsInterface.Instance.GetOrAddVolumeComponent(arg_18_1, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_18_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(arg_18_1, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	arg_18_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_18_0.enabled.value,
			focusDistance = {
				length = 2,
				min = var_18_0.gaussianStart.min,
				value = var_18_0.gaussianStart.value
			},
			blurRadius = {
				min = var_18_0.blurRadius.min,
				max = var_18_0.blurRadius.max,
				value = var_18_0.blurRadius.value
			}
		},
		postExposure = {
			value = var_18_1.postExposure.value
		},
		contrast = {
			min = var_18_1.contrast.min,
			max = var_18_1.contrast.max,
			value = var_18_1.contrast.value
		},
		saturate = {
			min = var_18_1.saturation.min,
			max = var_18_1.saturation.max,
			value = var_18_1.saturation.value
		}
	}
	arg_18_0.originalCameraSettings.depthOfField.enabled = true
end

function var_0_0.GetCameraSettings(arg_19_0)
	return arg_19_0.originalCameraSettings
end

function var_0_0.SettingCamera(arg_20_0, arg_20_1)
	arg_20_0.activeCameraSettings = arg_20_1

	local var_20_0 = arg_20_0:FindGlobalVolume()
	local var_20_1 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_20_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_20_2 = GraphicsInterface.Instance.GetOrAddVolumeComponent(var_20_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

	var_20_1.enabled:Override(arg_20_1.depthOfField.enabled)
	var_20_1.gaussianStart:Override(arg_20_1.depthOfField.focusDistance.value)
	var_20_1.gaussianEnd:Override(arg_20_1.depthOfField.focusDistance.value + arg_20_1.depthOfField.focusDistance.length)
	var_20_1.blurRadius:Override(arg_20_1.depthOfField.blurRadius.value)
	var_20_2.postExposure:Override(arg_20_1.postExposure.value)
	var_20_2.contrast:Override(arg_20_1.contrast.value)
	var_20_2.saturation:Override(arg_20_1.saturate.value)
end

function var_0_0.RevertCameraSettings(arg_21_0)
	arg_21_0:SettingCamera(arg_21_0.originalCameraSettings)

	arg_21_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.cameraVolume then
		arg_22_0:RevertVolumeProfile()
	end

	local var_22_0 = {}

	arg_22_0.volumeRequest = var_22_0

	arg_22_0:GetLoader():GetPrefab("dorm3d/effect/volume/" .. arg_22_1, "", function(arg_23_0)
		if arg_22_0.volumeRequest ~= var_22_0 then
			arg_22_0:GetLoader():ReturnPrefab(arg_23_0)

			return
		end

		arg_22_0.cameraVolume = arg_23_0
	end)
end

function var_0_0.RevertVolumeProfile(arg_24_0)
	arg_24_0.volumeRequest = nil

	if arg_24_0.cameraVolume then
		arg_24_0:GetLoader():ReturnPrefab(arg_24_0.cameraVolume)

		arg_24_0.cameraVolume = nil
	end
end

function var_0_0.OnDispose(arg_25_0)
	arg_25_0:RevertVolumeProfile()
end

function var_0_0.RecordCharacterLight(arg_26_0, arg_26_1)
	tolua.loadassembly("Yongshi.BLRP.Runtime.AOT")

	local var_26_0 = arg_26_1:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	arg_26_0.originalCharacterColor = {
		color = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_26_0),
		intensity = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_26_0)
	}
end

function var_0_0.SetCharacterLight(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = Color.Lerp(arg_27_0.originalCharacterColor.color, arg_27_1, arg_27_3)
	local var_27_1 = math.lerp(arg_27_0.originalCharacterColor.intensity, arg_27_2, arg_27_3)
	local var_27_2 = arg_27_0:FindCharacterLight():GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_27_2, var_27_0)
	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_27_2, var_27_1)
end

function var_0_0.RevertCharacterLight(arg_28_0)
	arg_28_0:SetCharacterLight(arg_28_0.originalCharacterColor.color, arg_28_0.originalCharacterColor.intensity, 1)
end

return var_0_0
