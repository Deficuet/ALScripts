local var_0_0 = class("ActivityPermanentLayer", import("..base.BaseUI"))

function var_0_0.getResource(arg_1_0, arg_1_1)
	local var_1_0 = {}
	local var_1_1 = getProxy(ActivityPermanentProxy):getActivityIdsByType(ActivityPermanentProxy.TYPE_NORMAL_ACTIVITY)

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		local var_1_2 = pg.activity_task_permanent[iter_1_1]

		table.insert(var_1_0, "activitybanner/" .. var_1_2.banner_route)
	end

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0, arg_1_1))

	return var_1_0
end

function var_0_0.getUIName(arg_2_0)
	return "ActivitySelectUI"
end

function var_0_0.onBackPressed(arg_3_0)
	arg_3_0:closeView()
end

function var_0_0.onBackPressed(arg_4_0)
	if isActive(arg_4_0.rtMsgbox) then
		arg_4_0:hideMsgbox()
	else
		var_0_0.super.onBackPressed(arg_4_0)
	end
end

function var_0_0.init(arg_5_0)
	arg_5_0.bg = arg_5_0._tf:Find("bg_back")

	onButton(arg_5_0, arg_5_0.bg, function()
		arg_5_0:closeView()
	end, SFX_CANCEL)

	arg_5_0.btnBack = arg_5_0._tf:Find("window/inner/top/back")

	onButton(arg_5_0, arg_5_0.btnBack, function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	setText(arg_5_0._tf:Find("window/inner/top/back/Text"), i18n("activity_permanent_total"))

	arg_5_0.btnHelp = arg_5_0._tf:Find("window/inner/top/help")

	onButton(arg_5_0, arg_5_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("activity_permanent_help")
		})
	end, SFX_PANEL)

	arg_5_0.content = arg_5_0._tf:Find("window/inner/content/scroll_rect")
	arg_5_0.itemList = UIItemList.New(arg_5_0.content, arg_5_0.content:Find("item"))

	local var_5_0 = getProxy(ActivityPermanentProxy)

	arg_5_0.itemList:make(function(arg_9_0, arg_9_1, arg_9_2)
		arg_9_1 = arg_9_1 + 1

		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_5_0.ids[arg_9_1]
			local var_9_1 = pg.activity_task_permanent[var_9_0]

			setText(arg_9_2:Find("main/word/Text"), var_9_1.gametip)
			setText(arg_9_2:Find("main/Image/tip/Text"), var_9_1.gametip_extra)
			GetImageSpriteFromAtlasAsync("activitybanner/" .. var_9_1.banner_route, "", arg_9_2:Find("main/Image"))
			onButton(arg_5_0, arg_9_2:Find("main"), function()
				arg_5_0:showMsgbox(var_9_0)
			end, SFX_PANEL)

			local var_9_2 = arg_9_2:Find("finish")
			local var_9_3 = GetOrAddComponent(var_9_2, typeof(CanvasGroup))

			if var_9_0 == arg_5_0.contextData.finishId then
				arg_5_0.childFinish = arg_9_2
				var_9_3.alpha = 0
			else
				var_9_3.alpha = 1
			end

			setText(var_9_2:Find("Image/Text"), i18n("activity_permanent_finished"))
			setActive(var_9_2, var_5_0:isActivityFinish(var_9_0))
		end
	end)

	arg_5_0.rtMsgbox = arg_5_0._tf:Find("Msgbox")

	onButton(arg_5_0, arg_5_0.rtMsgbox:Find("bg"), function()
		arg_5_0:hideMsgbox()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.rtMsgbox:Find("window/top/btnBack"), function()
		arg_5_0:hideMsgbox()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.rtMsgbox:Find("window/button_container/custom_button_2"), function()
		arg_5_0:hideMsgbox()
	end, SFX_CANCEL)
end

function var_0_0.didEnter(arg_14_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_14_0._tf)
	arg_14_0.itemList:align(#arg_14_0.ids)

	if arg_14_0.childFinish then
		local var_14_0 = arg_14_0.content:GetComponent(typeof(ScrollRect)).viewport

		scrollTo(arg_14_0.content, nil, math.clamp(arg_14_0.childFinish.anchoredPosition.y / (arg_14_0.content.rect.height - var_14_0.rect.height), 0, 1))
		arg_14_0:doFinishAnim(arg_14_0.childFinish)

		arg_14_0.childFinish = nil
	end

	if PlayerPrefs.GetInt("permanent_select", 0) ~= 1 then
		PlayerPrefs.SetInt("permanent_select", 1)
		triggerButton(arg_14_0.btnHelp)
	end
end

function var_0_0.willExit(arg_15_0)
	if isActive(arg_15_0.rtMsgbox) then
		arg_15_0:hideMsgbox()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_15_0._tf)

	if arg_15_0.ltId then
		LeanTween.cancel(arg_15_0.ltId)

		arg_15_0.ltId = nil
	end
end

function var_0_0.setActivitys(arg_16_0, arg_16_1)
	arg_16_0.ids = arg_16_1

	local var_16_0 = getProxy(ActivityPermanentProxy)

	table.sort(arg_16_0.ids, function(arg_17_0, arg_17_1)
		local var_17_0 = var_16_0:isActivityFinish(arg_17_0)
		local var_17_1 = var_16_0:isActivityFinish(arg_17_1)

		if var_17_0 == var_17_1 then
			return arg_17_0 < arg_17_1
		else
			return var_17_1
		end
	end)
end

function var_0_0.doFinishAnim(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1:Find("finish")
	local var_18_1 = GetOrAddComponent(var_18_0, typeof(CanvasGroup))

	arg_18_0.ltId = LeanTween.alphaCanvas(var_18_1, 1, 1).uniqueId
end

function var_0_0.showMsgbox(arg_19_0, arg_19_1)
	setText(arg_19_0.rtMsgbox:Find("window/button_container/custom_button_1/pic"), i18n("msgbox_text_confirm"))
	setText(arg_19_0.rtMsgbox:Find("window/button_container/custom_button_2/pic"), i18n("msgbox_text_cancel"))
	setText(arg_19_0.rtMsgbox:Find("window/top/bg/infomation/title"), i18n("words_information"))
	setText(arg_19_0.rtMsgbox:Find("window/msg_panel/content"), i18n("activity_permanent_tips1", pg.activity_task_permanent[arg_19_1].activity_name))
	setText(arg_19_0.rtMsgbox:Find("window/msg_panel/Text"), i18n("activity_permanent_tips4"))
	onButton(arg_19_0, arg_19_0.rtMsgbox:Find("window/button_container/custom_button_1"), function()
		arg_19_0:hideMsgbox()
		arg_19_0:emit(ActivityPermanentMediator.START_SELECT, arg_19_1)
	end, SFX_CONFIRM)
	setActive(arg_19_0.rtMsgbox, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_19_0.rtMsgbox)
end

function var_0_0.hideMsgbox(arg_21_0)
	setActive(arg_21_0.rtMsgbox, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0.rtMsgbox)
end

return var_0_0
