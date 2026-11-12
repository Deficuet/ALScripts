local var_0_0 = class("TwoPointFiveScenarioPage", import("view.activity.CorePage.CoreScenarioTemplatePage"))

var_0_0.LINE_COLOR = {
	"97D2E1",
	"ffffff",
	"FB3F95"
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
var_0_0.NODE_SPACING = 20
var_0_0.TAIL_SPACING = 20

function var_0_0.getUIName(arg_1_0)
	return "TwoPointFiveScenarioPage"
end

function var_0_0.OnInit(arg_2_0)
	var_0_0.super.OnInit(arg_2_0)

	arg_2_0.resTime = arg_2_0._tf:Find("TopPage/top/resTime/Text")

	arg_2_0:refreshTime(arg_2_0.activity)
end

function var_0_0.Show(arg_3_0)
	var_0_0.super.Show(arg_3_0)
	Canvas.ForceUpdateCanvases()
	arg_3_0:UpdateStory(true)
	Canvas.ForceUpdateCanvases()
	arg_3_0:Move2UnlockStory()
end

function var_0_0.Hide(arg_4_0)
	var_0_0.super.Hide(arg_4_0)

	if arg_4_0.viewComponent and not arg_4_0.viewComponent.exited then
		arg_4_0.viewComponent:ActiveScenarioLayer(false)
		arg_4_0.coreStoryPage:emit(ActivityMainScene.FLUSH_TABS)
	end
end

function var_0_0.UpdateStory(arg_5_0, arg_5_1)
	var_0_0.super.UpdateStory(arg_5_0, arg_5_1)

	local var_5_0 = arg_5_0.storyReadCount
	local var_5_1 = arg_5_0.storyReadMax
	local var_5_2 = "<color=#27c5ff>" .. var_5_0 .. "</color><color=#c7c7c7>/" .. var_5_1 .. "</color>"

	setText(arg_5_0.progressText, var_5_2)
end

function var_0_0.RefreshNodeTitle(arg_6_0, arg_6_1, arg_6_2)
	setScrollText(arg_6_1:Find("info/bk/title_form/title"), arg_6_2)
	setActive(arg_6_1:Find("conditionBg"), false)
end

function var_0_0.RefreshUnlockDesc(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	setScrollText(arg_7_1:Find("info/bk/title_form/title"), arg_7_2)
	setActive(arg_7_1:Find("conditionBg"), true)
	setScrollText(arg_7_1:Find("conditionBg/Text"), arg_7_3)
end

function var_0_0.refreshTime(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

	setText(arg_8_0.resTime, i18n("nier_core_countdown", math.floor(var_8_0 / 86400), math.floor(var_8_0 % 86400 / 3600)))
end

return var_0_0
