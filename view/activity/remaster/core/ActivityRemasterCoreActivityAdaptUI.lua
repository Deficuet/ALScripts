local var_0_0 = class("ActivityRemasterCoreActivityAdaptUI", import("view.activity.CorePage.CoreActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityRemasterCoreActivityAdaptUI"
end

function var_0_0.didEnter(arg_2_0)
	var_0_0.super.didEnter(arg_2_0)
	onButton(arg_2_0, arg_2_0._tf:Find("adapt/TopPage/top/btn_home"), function()
		arg_2_0:emit(BaseUI.ON_HOME)
	end, SOUND_BACK)
	arg_2_0:bind(ActivityRemasterInfoAwardPage.ON_SKIP_ACT, function(arg_4_0, arg_4_1)
		if arg_2_0.infoDisplayPage and arg_2_0.infoDisplayPage:GetLoaded() then
			arg_2_0.infoDisplayPage:Hide()
		end

		arg_2_0:verifyTabs(arg_4_1)
	end)
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text"), i18n("ActivityRemasterCoreActivityAdaptUI_TITLE"))
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text/Text_1"), i18n("ActivityRemasterCoreActivityAdaptUI_TITLE_EN"))
end

function var_0_0.flushTabs(arg_5_0)
	var_0_0.super.flushTabs(arg_5_0)

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.activities) do
		if iter_5_1 then
			local var_5_0 = iter_5_1:getConfig("is_show")
			local var_5_1 = arg_5_0.tabsList.container:Find(var_5_0)
			local var_5_2 = iter_5_1:getConfig("title_res_tag")
			local var_5_3 = i18n(var_5_2)

			setText(var_5_1:Find("name"), var_5_3)
			setText(var_5_1:Find("on/name"), var_5_3)
		end
	end
end

function var_0_0.init(arg_6_0, ...)
	arg_6_0:AddLoginTab()
	var_0_0.super.init(arg_6_0, ...)

	arg_6_0.btnBack = arg_6_0._tf:Find("adapt/TopPage/top/btn_back")
end

function var_0_0.AddLoginTab(arg_7_0)
	local var_7_0 = arg_7_0._tf:Find("adapt/tabs")
	local var_7_1 = var_7_0.childCount

	cloneTplTo(var_7_0:GetChild(0), var_7_0).name = var_7_1 + 1 .. ""
end

function var_0_0.OnPageSwitchDone(arg_8_0, arg_8_1, arg_8_2)
	if not arg_8_0.awardPreviewBtn then
		arg_8_0:InitAwardPreviewBtn()
	end

	setActive(arg_8_0.awardPreviewBtn, arg_8_2 == 1)

	local var_8_0 = arg_8_1:GetAwardPreviewPos()

	if var_8_0 then
		setAnchoredPosition3D(arg_8_0.awardPreviewBtn, BuildVector3(var_8_0))
	else
		setAnchoredPosition3D(arg_8_0.awardPreviewBtn, arg_8_0.initAwardPreviewBtnPos)
	end
end

function var_0_0.InitAwardPreviewBtn(arg_9_0)
	arg_9_0.awardPreviewBtn = arg_9_0._tf:Find("adapt/award_preview")

	setText(arg_9_0.awardPreviewBtn:Find("Text"), i18n("ActivityRemasterCore_award_preview_btn"))

	arg_9_0.initAwardPreviewBtnPos = getAnchoredPosition(arg_9_0.awardPreviewBtn)

	onButton(arg_9_0, arg_9_0.awardPreviewBtn, function()
		arg_9_0.infoDisplayPage = arg_9_0.infoDisplayPage or ActivityRemasterInfoWithoutTextDisplayPage.New(arg_9_0._tf, arg_9_0.event)

		local var_10_0 = getProxy(ActivityRemasterProxy):GetActiveActID()

		arg_9_0.infoDisplayPage:ExecuteAction("Show", var_10_0, "")
	end, SFX_PANEL)
end

function var_0_0.willExit(arg_11_0)
	var_0_0.super.willExit(arg_11_0)

	if arg_11_0.infoDisplayPage and arg_11_0.infoDisplayPage:GetLoaded() then
		arg_11_0.infoDisplayPage:Destroy()
	end

	arg_11_0.infoDisplayPage = nil
end

return var_0_0
