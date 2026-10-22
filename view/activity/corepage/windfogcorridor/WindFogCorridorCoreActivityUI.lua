local var_0_0 = class("WindFogCorridorCoreActivityUI", import("view.activity.CorePage.StarsCity.StarsCityCoreActivityUI"))

function var_0_0.getResource(arg_1_0, arg_1_1)
	local var_1_0 = {
		"coreactivityuitable/windfogcorridorcoreactivityui_subtitle_1_text",
		"coreactivityuitable/windfogcorridorcoreactivityui_subtitle_1_text_selected"
	}

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0, arg_1_1))

	return var_1_0
end

function var_0_0.getUIName(arg_2_0)
	return "WindFogCorridorCoreActivityUI"
end

return var_0_0
