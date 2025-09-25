local var_0_0 = class("AwardWindow", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ActivitybonusWindow_nonPt"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("window/top/btnBack")
	arg_2_0.uiItemList = UIItemList.New(arg_2_0:findTF("window/panel/list"), arg_2_0:findTF("window/panel/list/item"))
	arg_2_0.currentTitle = arg_2_0:findTF("window/pt/title"):GetComponent(typeof(Text))
	arg_2_0.currentTxt = arg_2_0:findTF("window/pt/Text"):GetComponent(typeof(Text))

	setText(arg_2_0:findTF("window/top/bg/infomation"), i18n("world_expedition_reward_display"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.uiItemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_6_1, arg_6_2)
		end
	end)
end

function var_0_0.UpdateItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.awards[arg_7_1 + 1]
	local var_7_1 = arg_7_2:Find("award")
	local var_7_2 = {
		type = var_7_0[1],
		id = var_7_0[2],
		count = var_7_0[3]
	}

	updateDrop(var_7_1, var_7_2)
	onButton(arg_7_0, var_7_1, function()
		arg_7_0:emit(BaseUI.ON_DROP, var_7_2)
	end, SFX_PANEL)
	setActive(arg_7_2:Find("award/mask"), arg_7_1 + 1 <= arg_7_0.finishIndex)
	setText(arg_7_2:Find("target/title"), arg_7_0.targetTitle)
	setText(arg_7_2:Find("target/Text"), arg_7_1 + 1)
	setText(arg_7_2:Find("title/Text"), "PHASE  " .. arg_7_1 + 1)
end

function var_0_0.Flush(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0.awards = arg_9_1
	arg_9_0.finishIndex = arg_9_2
	arg_9_0.targetTitle = arg_9_3[2]

	arg_9_0.uiItemList:align(#arg_9_0.awards)

	arg_9_0.currentTitle.text = arg_9_3[1]
	arg_9_0.currentTxt.text = arg_9_2

	arg_9_0:Show()
end

function var_0_0.Show(arg_10_0)
	var_0_0.super.Show(arg_10_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)
end

function var_0_0.Hide(arg_11_0)
	var_0_0.super.Hide(arg_11_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf, arg_11_0._parentTf)
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

return var_0_0
