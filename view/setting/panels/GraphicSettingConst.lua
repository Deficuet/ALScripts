GraphicSettingConst = {}

local var_0_0 = GraphicSettingConst

var_0_0.PlayerGraphicLevelDorm = "dorm3d_graphics_settings_new"
var_0_0.PlayerGraphicLevelIsland = "island3d_graphics_settings_new"
var_0_0.SettingType = {
	toggle = 1,
	select = 2
}
var_0_0.SettingLevel = {
	High = 3,
	Mid = 2,
	Low = 1,
	Custom = 4
}
var_0_0.assetPath = {
	"Default_LowQualitySettings",
	"Default_MediumQualitySettings",
	"Default_HighQualitySettings",
	"Default_QualitySettings"
}
var_0_0.settings = {
	{
		tips = "grapihcs3d_setting_gpgpu_warning",
		playerPrefsname = "enableGPUDriver",
		settingType = 1,
		parameterId = 0,
		settingName = "grapihcs3d_setting_enable_gup_driver",
		isShow = 1,
		defaultValues = {
			0,
			0,
			1,
			0
		}
	},
	{
		parameterId = 3,
		settingType = 2,
		playerPrefsname = "gameOptions",
		settingName = "grapihcs3d_setting_global_illumination",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_global_illumination_optionname0",
			"grapihcs3d_setting_global_illumination_optionname1",
			"grapihcs3d_setting_global_illumination_optionname2",
			"grapihcs3d_setting_global_illumination_optionname3"
		},
		options = {
			0,
			1,
			2,
			3
		},
		defaultValues = {
			2,
			2,
			2,
			2
		}
	},
	{
		parameterId = 12,
		settingType = 2,
		playerPrefsname = "bloomIntensity",
		settingName = "grapihcs3d_setting_bloom_intensity",
		isShow = 0,
		optionNames = {
			"grapihcs3d_setting_bloom_intensity_0",
			"grapihcs3d_setting_bloom_intensity_1",
			"grapihcs3d_setting_bloom_intensity_2",
			"grapihcs3d_setting_bloom_intensity_3"
		},
		options = {
			0,
			1,
			2,
			3
		},
		defaultValues = {
			3,
			3,
			3,
			3
		}
	},
	{
		parameterId = 2,
		settingType = 2,
		playerPrefsname = "resolution",
		settingName = "grapihcs3d_setting_resolution",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_resolution_optionname0",
			"grapihcs3d_setting_resolution_optionname1",
			"grapihcs3d_setting_resolution_optionname2"
		},
		options = {
			1280,
			1920,
			2560
		},
		defaultValues = {
			1280,
			1920,
			2560,
			1920
		}
	},
	{
		parameterId = 1,
		settingType = 2,
		playerPrefsname = "renderingQuality",
		settingName = "grapihcs3d_setting_rendering_quality",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_rendering_quality_optionname0",
			"grapihcs3d_setting_rendering_quality_optionname1"
		},
		options = {
			0,
			1
		},
		defaultValues = {
			0,
			0,
			0,
			0
		}
	},
	{
		parameterId = 4,
		settingType = 2,
		playerPrefsname = "shaderQuality",
		settingName = "grapihcs3d_setting_shader_quality",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_shader_quality_optionname0",
			"grapihcs3d_setting_shader_quality_optionname1"
		},
		options = {
			0,
			1
		},
		defaultValues = {
			0,
			1,
			1,
			1
		}
	},
	{
		parameterId = 5,
		settingType = 1,
		playerPrefsname = "enableAdditionalLights",
		settingName = "grapihcs3d_setting_enable_additional_lights",
		isShow = 1,
		defaultValues = {
			0,
			1,
			1,
			1
		}
	},
	{
		parameterId = 6,
		settingType = 2,
		playerPrefsname = "shadowQuality",
		settingName = "grapihcs3d_setting_shadow_quality",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_shadow_quality_optionname0",
			"grapihcs3d_setting_shadow_quality_optionname1",
			"grapihcs3d_setting_shadow_quality_optionname2",
			"grapihcs3d_setting_shadow_quality_optionname3"
		},
		options = {
			0,
			1,
			2,
			3
		},
		defaultValues = {
			0,
			2,
			3,
			2
		}
	},
	{
		parameterId = 7,
		settingType = 2,
		playerPrefsname = "shadowUpdateMode",
		settingName = "grapihcs3d_setting_shadow_update_mode",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_shadow_update_mode_optionname0",
			"grapihcs3d_setting_shadow_update_mode_optionname1",
			"grapihcs3d_setting_shadow_update_mode_optionname2",
			"grapihcs3d_setting_shadow_update_mode_optionname3"
		},
		options = {
			0,
			1,
			2,
			3
		},
		defaultValues = {
			0,
			2,
			2,
			2
		}
	},
	{
		parameterId = 21,
		settingType = 2,
		playerPrefsname = "lodQuality",
		settingName = "Lod",
		isShow = 0,
		optionNames = {
			"关",
			"低",
			"中",
			"高"
		},
		options = {
			0,
			1,
			2,
			3
		},
		defaultValues = {
			3,
			3,
			3,
			3
		}
	},
	{
		parameterId = 18,
		settingType = 1,
		playerPrefsname = "enableAO",
		settingName = "AO",
		isShow = 0,
		defaultValues = {
			1,
			1,
			1,
			1
		}
	},
	{
		parameterId = 9,
		settingType = 1,
		playerPrefsname = "enablePostProcess",
		settingName = "grapihcs3d_setting_enable_post_process",
		isShow = 1,
		defaultValues = {
			1,
			1,
			1,
			1
		}
	},
	{
		parameterId = 8,
		settingType = 1,
		playerPrefsname = "enableReflection",
		settingName = "grapihcs3d_setting_enable_reflection",
		isShow = 1,
		defaultValues = {
			0,
			1,
			1,
			1
		}
	},
	{
		parentId = 12,
		parameterId = 10,
		settingType = 1,
		playerPrefsname = "enablePostAntialiasing",
		settingName = "grapihcs3d_setting_enable_post_antialiasing",
		isShow = 1,
		defaultValues = {
			0,
			0,
			0,
			1
		}
	},
	{
		parentId = 12,
		parameterId = 11,
		settingType = 1,
		playerPrefsname = "enableHDR",
		settingName = "grapihcs3d_setting_enable_hdr",
		isShow = 1,
		defaultValues = {
			1,
			1,
			1,
			1
		}
	},
	{
		parentId = 12,
		parameterId = 13,
		settingType = 1,
		playerPrefsname = "enableDOF",
		settingName = "grapihcs3d_setting_enable_dof",
		isShow = 1,
		defaultValues = {
			0,
			0,
			1,
			1
		}
	},
	{
		parentId = 12,
		parameterId = 14,
		settingType = 1,
		playerPrefsname = "enableDistort",
		settingName = "grapihcs3d_setting_enable_distort",
		isShow = 1,
		defaultValues = {
			0,
			0,
			1,
			1
		}
	},
	{
		parameterId = 15,
		settingType = 1,
		playerPrefsname = "enableFog",
		settingName = "雾",
		isShow = 0,
		defaultValues = {
			1,
			1,
			1,
			1
		}
	},
	{
		parameterId = 16,
		settingType = 1,
		playerPrefsname = "enableFlare",
		settingName = "grapihcs3d_setting_flare",
		isShow = 1,
		defaultValues = {
			1,
			1,
			1,
			1
		}
	},
	{
		parameterId = 17,
		settingType = 1,
		playerPrefsname = "enableLensFlare",
		settingName = "镜头炫光",
		isShow = 0,
		defaultValues = {
			1,
			1,
			1,
			1
		}
	},
	{
		parameterId = 19,
		settingType = 2,
		playerPrefsname = "characterQuality",
		settingName = "grapihcs3d_setting_character_quality",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_character_quality_optionname0",
			"grapihcs3d_setting_character_quality_optionname1",
			"grapihcs3d_setting_character_quality_optionname2"
		},
		options = {
			0,
			1,
			2
		},
		defaultValues = {
			0,
			1,
			2,
			1
		}
	},
	{
		parameterId = 20,
		settingType = 2,
		playerPrefsname = "terrainLayerQuality",
		settingName = "grapihcs3d_setting_terrain_layer_quality",
		isShow = 1,
		optionNames = {
			"grapihcs3d_setting_terrain_layer_quality_optionname0",
			"grapihcs3d_setting_terrain_layer_quality_optionname1",
			"grapihcs3d_setting_terrain_layer_quality_optionname2"
		},
		options = {
			0,
			1,
			2
		},
		defaultValues = {
			0,
			1,
			2,
			1
		}
	}
}

function var_0_0.InitDefautQuality(arg_1_0)
	local var_1_0 = arg_1_0 and var_0_0.PlayerGraphicLevelIsland or var_0_0.PlayerGraphicLevelDorm

	if PlayerPrefs.GetInt(var_1_0, 0) == 0 then
		local var_1_1 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_1_2 = SystemInfo.deviceModel or ""

			local function var_1_3(arg_2_0)
				local var_2_0 = string.match(arg_2_0, "iPad(%d+)")
				local var_2_1 = tonumber(var_2_0)

				if var_2_1 and var_2_1 >= 8 then
					return true
				end

				return false
			end

			local function var_1_4(arg_3_0)
				local var_3_0 = string.match(arg_3_0, "iPhone(%d+)")
				local var_3_1 = tonumber(var_3_0)

				if var_3_1 and var_3_1 >= 13 then
					return true
				end

				return false
			end

			if var_1_3(var_1_2) or var_1_4(var_1_2) then
				var_1_1 = DevicePerformanceLevel.High
			end
		end

		local var_1_5 = var_1_1 == DevicePerformanceLevel.High and 3 or var_1_1 == DevicePerformanceLevel.Mid and 2 or 1

		if arg_1_0 then
			PlayerPrefs.SetInt(var_1_0, 1)
		else
			PlayerPrefs.SetInt(var_1_0, var_1_5)
		end

		if not arg_1_0 then
			Dorm3dRoomTemplateScene.FirstDefaultSetting = var_1_5
		end
	end
end

function var_0_0.SettingQuality(arg_4_0)
	local var_4_0 = arg_4_0 and var_0_0.PlayerGraphicLevelIsland or var_0_0.PlayerGraphicLevelDorm
	local var_4_1 = PlayerPrefs.GetInt(var_4_0, 4)

	if var_4_1 ~= 4 then
		for iter_4_0, iter_4_1 in ipairs(var_0_0.settings) do
			local var_4_2 = iter_4_1.parameterId
			local var_4_3 = iter_4_1.defaultValues[var_4_1]

			GraphicsInterface.Instance:SetQualitySettings(var_4_2, var_4_3)
		end

		return
	end

	for iter_4_2, iter_4_3 in ipairs(var_0_0.settings) do
		local var_4_4 = iter_4_3.parameterId
		local var_4_5 = arg_4_0 and iter_4_3.playerPrefsname .. "island" or iter_4_3.playerPrefsname
		local var_4_6 = PlayerPrefs.GetInt(var_4_5, -1)
		local var_4_7 = iter_4_3.defaultValues[4]

		if var_4_6 ~= -1 then
			var_4_7 = var_4_6
		end

		GraphicsInterface.Instance:SetQualitySettings(var_4_4, var_4_7)
	end
end

function var_0_0.ClearPlayerPrefs()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings_changeed", 0) == 1 then
		return
	end

	PlayerPrefs.SetInt("dorm3d_graphics_settings_changeed", 1)

	for iter_5_0, iter_5_1 in ipairs(var_0_0.settings) do
		PlayerPrefs.DeleteKey(iter_5_1.playerPrefsname)
	end
end

return var_0_0
