local var_0_0 = class("WindFogCorridorCollectPage", import("view.activity.CorePage.DOA.DOACoreActivityCollectPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.btnList = arg_1_0.bg:Find("btn_list")
	arg_1_0.itemPanel = arg_1_0.bg:Find("item_panel")
	arg_1_0.togglesTF = arg_1_0.itemPanel:Find("toggles")
	arg_1_0.content = arg_1_0.itemPanel:Find("item_list/content")
	arg_1_0.itemList = UIItemList.New(arg_1_0.content, arg_1_0.content:Find("tpl"))
	arg_1_0.msgBox = WindFogCorridorCollectMsgBox.New(arg_1_0._tf, arg_1_0.event)
end

function var_0_0.GetTogglesDropTypes(arg_2_0)
	return {
		DROP_TYPE_SHIP,
		{
			DROP_TYPE_FURNITURE,
			DROP_TYPE_RESOURCE,
			DROP_TYPE_ICON_FRAME,
			DROP_TYPE_COMMANDER_CAT,
			DROP_TYPE_EQUIP
		},
		{
			DROP_TYPE_EQUIPMENT_SKIN
		}
	}
end

function var_0_0.IsShowingPopWindow(arg_3_0)
	return arg_3_0.msgBox and arg_3_0.msgBox:isShowing() or false
end

function var_0_0.ClosePopWindow(arg_4_0)
	if arg_4_0.msgBox and arg_4_0.msgBox:isShowing() then
		arg_4_0.msgBox:Hide()
	end
end

function var_0_0.OnUpdateItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.showDataList[arg_5_1 + 1]
	local var_5_1 = arg_5_2:Find("icon_mask/icon")
	local var_5_2 = {
		type = var_5_0.config.type,
		id = var_5_0.config.drop_id
	}

	updateDrop(var_5_1, var_5_2)
	onButton(arg_5_0, var_5_1, function()
		arg_5_0:OnClickItem(var_5_0)
	end, SFX_PANEL)
	changeToScrollText(arg_5_2:Find("name_mask/mask/name"), Drop.New({
		type = var_5_0.config.type,
		id = var_5_0.config.drop_id
	}):getName())

	local var_5_3 = var_5_0.count > 0 and var_5_0.count >= var_5_0.config.count
	local var_5_4 = GetOrAddComponent(arg_5_2:Find("owner"), typeof(CanvasGroup))

	if var_5_2.type == 4 then
		local var_5_5 = Ship.getGroupIdByConfigId(var_5_0.config.drop_id)

		var_5_0.count = #getProxy(BayProxy):findShipsByGroup(var_5_5)
		var_5_3 = var_5_0.count >= 1
	end

	arg_5_0:RefreshCountText(var_5_0, arg_5_2)

	var_5_4.alpha = var_5_3 and 0.5 or 1

	setActive(arg_5_2:Find("got"), var_5_3)
	setActive(arg_5_2:Find("new"), var_5_0.config.is_new == "1")
end

return var_0_0
