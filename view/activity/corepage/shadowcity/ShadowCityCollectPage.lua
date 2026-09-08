local var_0_0 = class("ShadowCityCollectPage", import("view.activity.CorePage.DOA.DOACoreActivityCollectPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.btnList = arg_1_0.bg:Find("btn_list")
	arg_1_0.itemPanel = arg_1_0.bg:Find("item_panel")
	arg_1_0.togglesTF = arg_1_0.itemPanel:Find("toggles")
	arg_1_0.content = arg_1_0.itemPanel:Find("item_list/content")
	arg_1_0.itemList = UIItemList.New(arg_1_0.content, arg_1_0.content:Find("tpl"))
	arg_1_0.msgBox = ShadowCityCollectMsgBox.New(arg_1_0._tf, arg_1_0.event)

	setText(arg_1_0.btnList:Find("medal/title"), i18n("shadowcitycollectpage_title_1"))
	setText(arg_1_0.btnList:Find("furniture_theme/title"), i18n("shadowcitycollectpage_title_2"))
	setText(arg_1_0.btnList:Find("equip_skin_box/title"), i18n("shadowcitycollectpage_title_3"))
	setText(arg_1_0.btnList:Find("medal/btn_go/text"), i18n("task_go"))
	setText(arg_1_0.btnList:Find("furniture_theme/btn_go/text"), i18n("task_go"))
	setText(arg_1_0.btnList:Find("equip_skin_box/btn_go/text"), i18n("task_go"))
	setText(arg_1_0.itemPanel:Find("title"), i18n("shadowcitycollectpage_title_4"))
	setText(arg_1_0.togglesTF:Find("ship/name"), i18n("shadowcitycollectpage_toggle_1"))
	setText(arg_1_0.togglesTF:Find("furniture/name"), i18n("shadowcitycollectpage_toggle_2"))
	setText(arg_1_0.togglesTF:Find("equip_skin/name"), i18n("shadowcitycollectpage_toggle_3"))
end

function var_0_0.GetTogglesDropTypes(arg_2_0)
	return {
		DROP_TYPE_SHIP,
		{
			DROP_TYPE_FURNITURE,
			DROP_TYPE_RESOURCE,
			DROP_TYPE_ICON_FRAME
		},
		DROP_TYPE_EQUIPMENT_SKIN
	}
end

function var_0_0.UpdatePage(arg_3_0, arg_3_1)
	var_0_0.super.UpdatePage(arg_3_0, arg_3_1)
	setActive(arg_3_0.itemPanel:Find("full_scroll_bar"), not arg_3_0.bg:Find("Scrollbar").gameObject.activeSelf)
end

function var_0_0.OnUpdateItem(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.showDataList[arg_4_1 + 1]
	local var_4_1 = arg_4_2:Find("icon_mask/icon")
	local var_4_2 = {
		type = var_4_0.config.type,
		id = var_4_0.config.drop_id
	}

	updateDrop(var_4_1, var_4_2)
	onButton(arg_4_0, var_4_1, function()
		arg_4_0:OnClickItem(var_4_0)
	end, SFX_PANEL)
	changeToScrollText(arg_4_2:Find("name_mask/name"), Drop.New({
		type = var_4_0.config.type,
		id = var_4_0.config.drop_id
	}):getName())
	arg_4_0:RefreshCountText(var_4_0, arg_4_2)

	GetOrAddComponent(arg_4_2:Find("owner"), typeof(CanvasGroup)).alpha = var_4_0.count == var_4_0.config.count and 0.5 or 1

	setActive(arg_4_2:Find("new"), var_4_0.config.is_new == "1")

	if var_4_2.type == 4 then
		setActive(arg_4_2:Find("got"), var_4_0.count >= 1)
	else
		setActive(arg_4_2:Find("got"), var_4_0.count == var_4_0.config.count)
	end
end

function var_0_0.IsShowingPopWindow(arg_6_0)
	return arg_6_0.msgBox and arg_6_0.msgBox:isShowing() or false
end

function var_0_0.ClosePopWindow(arg_7_0)
	if arg_7_0.msgBox and arg_7_0.msgBox:isShowing() then
		arg_7_0.msgBox:Hide()
	end
end

return var_0_0
