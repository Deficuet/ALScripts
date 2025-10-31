local var_0_0 = class("LinkCollectTemplatePage", import("view.base.BaseActivityPage"))

var_0_0.DropType2Name = {
	[DROP_TYPE_EQUIP] = "equip",
	[DROP_TYPE_FURNITURE] = "furniture",
	[DROP_TYPE_EQUIPMENT_SKIN] = "equip_skin",
	[DROP_TYPE_SPWEAPON] = "special_weapon"
}

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.btnList = arg_1_0.bg:Find("btn_list")
	arg_1_0.itemPanel = arg_1_0.bg:Find("item_panel")
	arg_1_0.togglesTF = arg_1_0.itemPanel:Find("toggles")
	arg_1_0.content = arg_1_0.itemPanel:Find("item_list/content")
	arg_1_0.itemList = UIItemList.New(arg_1_0.content, arg_1_0.content:Find("tpl"))

	setText(arg_1_0.content:Find("tpl/owner/title"), i18n("collect_page_got"))
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.guideConfig = pg.activity_limit_item_guide

	arg_2_0:BuildDatas()
end

function var_0_0.BuildDatas(arg_3_0)
	local var_3_0 = pg.activity_limit_item_guide.get_id_list_by_activity[arg_3_0.activity.id] or {}

	arg_3_0.dataList = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_1 = {
			id = iter_3_1
		}

		var_3_1.config = arg_3_0.guideConfig[var_3_1.id]
		var_3_1.count = arg_3_0.activity:getKVPList(1, var_3_1.id)

		if var_3_1.config.count_storage == 1 then
			var_3_1.count = Drop.New({
				type = var_3_1.config.type,
				id = var_3_1.config.drop_id
			}):getOwnedCount()
		end

		table.insert(arg_3_0.dataList, var_3_1)
	end
end

function var_0_0.GetTogglesDropTypes(arg_4_0)
	return {
		DROP_TYPE_EQUIP,
		DROP_TYPE_FURNITURE,
		DROP_TYPE_EQUIPMENT_SKIN,
		DROP_TYPE_SPWEAPON
	}
end

function var_0_0.OnFirstFlush(arg_5_0)
	arg_5_0.itemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_5_0:OnUpdateItem(arg_6_1, arg_6_2)
		end
	end)
	arg_5_0:AddTogglesListener()
	arg_5_0:AddSpecialBtnListener()

	arg_5_0.curPage = arg_5_0.curPage or arg_5_0:GetTogglesDropTypes()[1]

	triggerToggle(arg_5_0.toggles[arg_5_0.curPage], true)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	arg_7_0:BuildDatas()
	arg_7_0:UpdatePage(arg_7_0.curPage)
end

function var_0_0.AddTogglesListener(arg_8_0)
	arg_8_0.toggles = {}

	local var_8_0 = arg_8_0:GetTogglesDropTypes()

	assert(#var_8_0 == arg_8_0.togglesTF.childCount, "dropType数量与togglesTF子节点数不匹配")

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		local var_8_1 = arg_8_0.togglesTF:Find(var_0_0.DropType2Name[iter_8_1])

		onToggle(arg_8_0, var_8_1, function(arg_9_0)
			if arg_9_0 then
				arg_8_0:UpdatePage(iter_8_1)
			end
		end, SFX_PANEL)

		arg_8_0.toggles[iter_8_1] = var_8_1
	end
end

function var_0_0.AddSpecialBtnListener(arg_10_0)
	local var_10_0 = arg_10_0.activity:getConfig("config_client")

	arg_10_0.furnitureThemeBtn = arg_10_0.btnList:Find("furniture_theme")

	if arg_10_0.furnitureThemeBtn and var_10_0.furniture_theme_link then
		onButton(arg_10_0, arg_10_0.furnitureThemeBtn, function()
			arg_10_0:DoSkip(var_10_0.furniture_theme_link[1], var_10_0.furniture_theme_link[2])
		end, SFX_PANEL)
	end

	arg_10_0.medalBtn = arg_10_0.btnList:Find("medal")

	if arg_10_0.medalBtn and var_10_0.medal_link then
		onButton(arg_10_0, arg_10_0.medalBtn, function()
			arg_10_0:DoSkip(var_10_0.medal_link[1], var_10_0.medal_link[2])
		end, SFX_PANEL)
	end

	arg_10_0.equipSkinBoxBtn = arg_10_0.btnList:Find("equip_skin_box")

	if arg_10_0.equipSkinBoxBtn and var_10_0.equipskin_box_link then
		local var_10_1 = Drop.New({
			type = var_10_0.equipskin_box_link.drop_type,
			id = var_10_0.equipskin_box_link.drop_id
		}):getOwnedCount()

		onButton(arg_10_0, arg_10_0.equipSkinBoxBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
				show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL,
				drop_type = var_10_0.equipskin_box_link.drop_type,
				drop_id = var_10_0.equipskin_box_link.drop_id,
				count = var_10_1,
				skipable_list = var_10_0.equipskin_box_link.list
			})
		end, SFX_PANEL)
	end
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.showDataList[arg_14_1 + 1]
	local var_14_1 = arg_14_2:Find("icon_mask/icon")
	local var_14_2 = {
		type = var_14_0.config.type,
		id = var_14_0.config.drop_id
	}

	updateDrop(var_14_1, var_14_2)
	onButton(arg_14_0, var_14_1, function()
		arg_14_0:OnClickItem(var_14_0)
	end, SFX_PANEL)
	changeToScrollText(arg_14_2:Find("name_mask/name"), Drop.New({
		type = var_14_0.config.type,
		id = var_14_0.config.drop_id
	}):getName())
	setText(arg_14_2:Find("owner/number"), var_14_0.count .. "/" .. var_14_0.config.count)

	GetOrAddComponent(arg_14_2:Find("owner"), typeof(CanvasGroup)).alpha = var_14_0.count == var_14_0.config.count and 0.5 or 1

	setActive(arg_14_2:Find("got"), var_14_0.count == var_14_0.config.count)
	setActive(arg_14_2:Find("new"), var_14_0.config.is_new == "1")
end

function var_0_0.OnClickItem(arg_16_0, arg_16_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
		show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT,
		drop_type = arg_16_1.config.type,
		drop_id = arg_16_1.config.drop_id,
		count = arg_16_1.count,
		count_limit = arg_16_1.config.count,
		skipable_list = arg_16_1.config.link_params
	})
end

function var_0_0.UpdatePage(arg_17_0, arg_17_1)
	arg_17_0.curPage = arg_17_1
	arg_17_0.showDataList = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.dataList) do
		if arg_17_0.guideConfig[iter_17_1.id].type == arg_17_1 then
			table.insert(arg_17_0.showDataList, iter_17_1)
		end
	end

	table.sort(arg_17_0.showDataList, CompareFuncs({
		function(arg_18_0)
			return arg_18_0.count < arg_18_0.config.count and 0 or 1
		end,
		function(arg_19_0)
			return arg_19_0.config.order
		end,
		function(arg_20_0)
			return arg_20_0.id
		end
	}))
	arg_17_0.itemList:align(#arg_17_0.showDataList)
end

function var_0_0.DoSkip(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_1 == 2 then
		pg.m02:sendNotification(GAME.GO_SCENE, arg_21_2[1], arg_21_2[2] or {})
	elseif arg_21_1 == 3 then
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_21_2
		})
	end
end

return var_0_0
