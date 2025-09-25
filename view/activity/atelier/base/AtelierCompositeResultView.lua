local var_0_0 = class("AtelierCompositeResultView", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject
	arg_1_0._tf = arg_1_1
	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	setActive(arg_1_0._go, false)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	setText(arg_2_0:findTF("Window/CountBG/Tip"), i18n("ryza_composite_count"))
end

function var_0_0.SetContextData(arg_3_0, arg_3_1)
	arg_3_0.contextData = arg_3_1
end

function var_0_0.SetActivity(arg_4_0, arg_4_1)
	arg_4_0.activity = arg_4_1
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0:findTF("BG"), function()
		arg_5_0:HideCompositeResult()
	end, SFX_CANCEL)
end

function var_0_0.ShowCompositeResult(arg_7_0, arg_7_1)
	setActive(arg_7_0._go, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf)

	local var_7_0 = arg_7_1[1]

	if var_7_0 == nil then
		return
	end

	arg_7_0._parentClass:UpdateRyzaDrop(arg_7_0:findTF("Window/Icon"), var_7_0)
	setScrollText(arg_7_0:findTF("Window/NameBG/Rect/Name"), var_7_0:getName())
	setText(arg_7_0:findTF("Window/CountBG/Text"), var_7_0.count)
end

function var_0_0.HideCompositeResult(arg_8_0)
	if not isActive(arg_8_0._go) then
		return
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0._tf, arg_8_0._parentClass._tf)
	setActive(arg_8_0._go, false)
	arg_8_0:PlayGuide()

	return true
end

function var_0_0.willExit(arg_9_0)
	arg_9_0:detach()
end

function var_0_0.PlayGuide(arg_10_0)
	if pg.NewStoryMgr.GetInstance():IsPlayed("NG0032") then
		pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0033", {
			2
		})
	end
end

return var_0_0
