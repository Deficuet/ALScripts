local var_0_0 = class("ReversePacmanSettleSubView", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanSettlePanel"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0.uiTipText, i18n("word_click_to_close"))
	setText(arg_2_0.uiAwardTF:Find("Image/title"), i18n("reverse_pacman_settle_award_title"))
	setText(arg_2_0.uiFailPanel:Find("tips/Text"), i18n("reverse_pacman_settle_fail_tips"))
	setText(arg_2_0.uiSuccessPanel:Find("infos/title"), i18n("reverse_pacman_settle_statistics"))
	setText(arg_2_0.uiFailPanel:Find("infos/title"), i18n("reverse_pacman_settle_statistics"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.uiBgTF, function()
		arg_3_0:Hide()
	end, SOUND_BACK)

	arg_3_0.awardUIList = UIItemList.New(arg_3_0.uiAwardTF:Find("list"), arg_3_0.uiAwardTF:Find("list/tpl"))

	arg_3_0.awardUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_3_0.awards[arg_5_1 + 1]

			updateDrop(arg_5_2, var_5_0)
			onButton(arg_3_0, arg_5_2, function()
				arg_3_0:emit(BaseUI.ON_DROP, var_5_0)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.Show(arg_7_0, arg_7_1, arg_7_2)
	var_0_0.super.Show(arg_7_0)

	arg_7_0.result = arg_7_1.result
	arg_7_0.time = arg_7_1.useTime
	arg_7_0.grade = arg_7_1.grade
	arg_7_0.shipCnt = arg_7_1.shipCnt
	arg_7_0.monsterCnt = arg_7_1.monsterCnt
	arg_7_0.awards = arg_7_1.awards or {}

	if arg_7_0.result == ReversePacmanConst.RESULT_TYPE.SUCCESS then
		arg_7_0:ShowSuccessPanel()
	else
		arg_7_0:ShowFailPanel()
	end

	arg_7_0.hideCallback = arg_7_2
end

function var_0_0.ShowSuccessPanel(arg_8_0)
	setActive(arg_8_0.uiSuccessPanel, true)
	setActive(arg_8_0.uiFailPanel, false)

	local var_8_0 = string.format("<color=#54FDB6>%s</color>", arg_8_0.time)

	setText(arg_8_0.uiSuccessPanel:Find("infos/time"), i18n("reverse_pacman_settle_time", var_8_0))
	setText(arg_8_0.uiSuccessPanel:Find("infos/arrest"), i18n("reverse_pacman_settle_arrest", arg_8_0.shipCnt, arg_8_0.monsterCnt))
	LoadImageSpriteAtlasAsync("ui/reversepacmanui_atlas", "level_" .. arg_8_0.grade, arg_8_0.uiGradeTF, true)
	setActive(arg_8_0.uiAwardTF, #arg_8_0.awards > 0)
	arg_8_0.awardUIList:align(#arg_8_0.awards)
end

function var_0_0.ShowFailPanel(arg_9_0)
	setActive(arg_9_0.uiSuccessPanel, false)
	setActive(arg_9_0.uiFailPanel, true)

	local var_9_0 = string.format("<color=#E54243>%s</color>", i18n("reverse_pacman_settle_timeout"))

	setText(arg_9_0.uiFailPanel:Find("infos/time"), var_9_0)
	setText(arg_9_0.uiFailPanel:Find("infos/escape"), i18n("reverse_pacman_settle_escape"))
end

function var_0_0.Hide(arg_10_0)
	var_0_0.super.Hide(arg_10_0)
	existCall(arg_10_0.hideCallback)
end

function var_0_0.OnDestroy(arg_11_0)
	return
end

return var_0_0
