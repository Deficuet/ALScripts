local var_0_0 = class("SecretsAbyssCoreActivityReUI", import("view.activity.CorePage.SecretsAbyss.SecretsAbyssCoreActivityUI"))

function var_0_0.getUIName(arg_1_0)
	return "SecretsAbyssCoreActivityReUI"
end

function var_0_0.init(arg_2_0, ...)
	arg_2_0:AddLoginTab()
	var_0_0.super.init(arg_2_0, ...)
	arg_2_0:bind(ActivityRemasterInfoAwardPage.ON_SKIP_ACT, function(arg_3_0, arg_3_1)
		if arg_2_0.infoDisplayPage and arg_2_0.infoDisplayPage:GetLoaded() then
			arg_2_0.infoDisplayPage:Hide()
		end

		arg_2_0:verifyTabs(arg_3_1)
	end)
end

function var_0_0.AddLoginTab(arg_4_0)
	local var_4_0 = arg_4_0._tf:Find("adapt/tabs")
	local var_4_1 = var_4_0.childCount

	cloneTplTo(var_4_0:GetChild(0), var_4_0).name = var_4_1 + 1 .. ""
end

function var_0_0.OnPageSwitchDone(arg_5_0, arg_5_1, arg_5_2)
	if not arg_5_0.awardPreviewBtn then
		arg_5_0:InitAwardPreviewBtn()
	end

	setActive(arg_5_0.awardPreviewBtn, arg_5_2 == 1)

	local var_5_0 = arg_5_1:GetAwardPreviewPos()

	if var_5_0 then
		setAnchoredPosition3D(arg_5_0.awardPreviewBtn, BuildVector3(var_5_0))
	else
		setAnchoredPosition3D(arg_5_0.awardPreviewBtn, arg_5_0.initAwardPreviewBtnPos)
	end
end

function var_0_0.InitAwardPreviewBtn(arg_6_0)
	arg_6_0.awardPreviewBtn = arg_6_0._tf:Find("adapt/award_preview")

	setText(arg_6_0.awardPreviewBtn:Find("Text"), i18n("ActivityRemasterCore_award_preview_btn"))

	arg_6_0.initAwardPreviewBtnPos = getAnchoredPosition(arg_6_0.awardPreviewBtn)

	onButton(arg_6_0, arg_6_0.awardPreviewBtn, function()
		arg_6_0.infoDisplayPage = arg_6_0.infoDisplayPage or ActivityRemasterInfoWithoutTextDisplayPage.New(arg_6_0._tf, arg_6_0.event)

		local var_7_0 = getProxy(ActivityRemasterProxy):GetActiveActID()

		arg_6_0.infoDisplayPage:ExecuteAction("Show", var_7_0, "")
	end, SFX_PANEL)
end

function var_0_0.willExit(arg_8_0)
	var_0_0.super.willExit(arg_8_0)

	if arg_8_0.infoDisplayPage and arg_8_0.infoDisplayPage:GetLoaded() then
		arg_8_0.infoDisplayPage:Destroy()
	end

	arg_8_0.infoDisplayPage = nil
end

return var_0_0
