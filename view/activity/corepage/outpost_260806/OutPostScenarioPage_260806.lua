local var_0_0 = class("OutPostScenarioPage_260806", import("view.activity.CorePage.CoreScenarioTemplatePage"))

var_0_0.LINE_COLOR = {
	"939393",
	"31233f",
	"7a57f1"
}
var_0_0.TITLE_COLOR = {
	"ffffff",
	"ffffffff",
	"ffffffff"
}
var_0_0.TITLE_ALPHA = {
	0.5,
	1,
	1
}

function var_0_0.getUIName(arg_1_0)
	return "OutPostScenarioPage_260806"
end

function var_0_0.OnInit(arg_2_0)
	var_0_0.super.OnInit(arg_2_0)
	setText(arg_2_0.top:Find("top/deco/Text"), i18n("260806_story_title"))
	setText(arg_2_0.top:Find("top/deco/Text/Text_1"), i18n("260806_story_title_en"))
end

function var_0_0.UpdateStory(arg_3_0, arg_3_1)
	var_0_0.super.UpdateStory(arg_3_0, arg_3_1)

	local var_3_0 = arg_3_0.storyReadCount
	local var_3_1 = arg_3_0.storyReadMax
	local var_3_2 = "<color=#27c5ff>" .. var_3_0 .. "</color><color=#c7c7c7>/" .. var_3_1 .. "</color>"

	setText(arg_3_0.progressText, var_3_2)
end

function var_0_0.RefreshNodeTitle(arg_4_0, arg_4_1, arg_4_2)
	setScrollText(arg_4_1:Find("info/bk/title_form/title"), arg_4_2)
	setActive(arg_4_1:Find("conditionBg"), false)
end

function var_0_0.RefreshUnlockDesc(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	setScrollText(arg_5_1:Find("info/bk/title_form/title"), arg_5_2)
	setActive(arg_5_1:Find("conditionBg"), true)
	setScrollText(arg_5_1:Find("conditionBg/Text"), arg_5_3)
end

return var_0_0
