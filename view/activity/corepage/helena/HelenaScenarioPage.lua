local var_0_0 = class("HelenaScenarioPage", import("view.activity.CorePage.CoreScenarioTemplatePage"))
local var_0_1 = import("Mgr/Pool/PoolPlural")

var_0_0.LINE_COLOR = {
	"75828c",
	"23343f",
	"2bc5ff"
}

function var_0_0.getUIName(arg_1_0)
	return "HelenaScenarioPage"
end

function var_0_0.OnInit(arg_2_0)
	var_0_0.super.OnInit(arg_2_0)
	setText(arg_2_0.top:Find("top/deco/Text"), i18n("HelenaPTPage_title"))
	setText(arg_2_0.top:Find("top/deco/Text/Text_1"), i18n("HelenaPTPage_title2"))
end

function var_0_0.UpdateStory(arg_3_0, arg_3_1)
	var_0_0.super.UpdateStory(arg_3_0, arg_3_1)

	local var_3_0 = arg_3_0.storyReadCount
	local var_3_1 = arg_3_0.storyReadMax
	local var_3_2 = "<color=#27c5ff>" .. var_3_0 .. "</color><color=#c7c7c7>/" .. var_3_1 .. "</color>"

	setText(arg_3_0.progressText, var_3_2)
end

return var_0_0
