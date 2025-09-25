local var_0_0 = class("SVBossProgress", import("view.base.BaseSubView"))

var_0_0.HideView = "SVBossProgress.HideView"

function var_0_0.getUIName(arg_1_0)
	return "SVBossProgress"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.rtFrame = arg_3_0._tf:Find("frame")
	arg_3_0.rtPanel = arg_3_0.rtFrame:Find("buff_panel/buff_bg")
	arg_3_0.rtInfo = arg_3_0.rtFrame:Find("buff_panel/info")

	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_CANCEL)
end

function var_0_0.OnDestroy(arg_5_0)
	return
end

function var_0_0.Show(arg_6_0)
	setLocalScale(arg_6_0.rtFrame, Vector3(0.5, 0.5, 0.5))
	LeanTween.cancel(go(arg_6_0.rtFrame))
	LeanTween.scale(arg_6_0.rtFrame, Vector3.one, 0.15)
	setActive(arg_6_0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_6_0._tf)
end

function var_0_0.Hide(arg_7_0)
	LeanTween.cancel(go(arg_7_0.rtFrame))
	setActive(arg_7_0._tf, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_7_0._tf, arg_7_0._parentTf)
	arg_7_0:emit(var_0_0.HideView, arg_7_0.callback)
end

function var_0_0.Setup(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.callback = arg_8_2

	local var_8_0 = arg_8_1.drops
	local var_8_1 = 0
	local var_8_2 = arg_8_1.total

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		var_8_1 = var_8_1 + iter_8_1.count
	end

	setText(arg_8_0._tf:Find("frame/buff_panel/info/name"), i18n("world_boss_drop_title"))
	setText(arg_8_0._tf:Find("frame/buff_panel/info/value_before"), var_8_2 - var_8_1)
	setText(arg_8_0._tf:Find("frame/buff_panel/info/value"), var_8_2)
end

return var_0_0
