local var_0_0 = class("ActivityBossScoreAwardLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ActivitybonusWindow_nonPt"
end

function var_0_0.init(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("window/top/btnBack")
	arg_2_0.uiItemList = UIItemList.New(arg_2_0:findTF("window/panel/list"), arg_2_0:findTF("window/panel/list/item"))

	arg_2_0.uiItemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateItem(arg_3_1, arg_3_2)
		end
	end)

	arg_2_0.currentTxt = arg_2_0:findTF("window/pt/Text"):GetComponent(typeof(Text))

	setText(arg_2_0:findTF("window/top/bg/infomation"), i18n("world_expedition_reward_display"))
	setText(arg_2_0:findTF("window/pt/title"), i18n("activityboss_sp_window_best_score"))
	setText(arg_2_0:findTF("window/panel/list/item/target/title"), i18n("activityboss_sp_score_target"))
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf, function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.closeBtn, function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	arg_4_0:Flush()
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.Flush(arg_7_0, arg_7_1)
	arg_7_0.awards = arg_7_0.contextData.awards
	arg_7_0.targets = arg_7_0.contextData.targets
	arg_7_0.score = arg_7_0.contextData.score

	arg_7_0.uiItemList:align(#arg_7_0.awards)

	arg_7_0.currentTxt.text = arg_7_0.score
end

function var_0_0.UpdateItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.awards[arg_8_1 + 1]
	local var_8_1 = arg_8_0.targets[arg_8_1 + 1]
	local var_8_2 = arg_8_2:Find("award")
	local var_8_3 = {
		type = var_8_0[1],
		id = var_8_0[2],
		count = var_8_0[3]
	}

	updateDrop(var_8_2, var_8_3)
	onButton(arg_8_0, var_8_2, function()
		arg_8_0:emit(BaseUI.ON_DROP, var_8_3)
	end, SFX_PANEL)
	setActive(arg_8_2:Find("award/mask"), var_8_1 <= arg_8_0.score)
	setText(arg_8_2:Find("target/Text"), var_8_1)
	setText(arg_8_2:Find("title/Text"), "PHASE  " .. arg_8_1 + 1)
end

function var_0_0.Hide(arg_10_0)
	arg_10_0:closeView()
end

function var_0_0.willExit(arg_11_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf)
end

return var_0_0
