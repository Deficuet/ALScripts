local var_0_0 = class("CoreAwardTemplatePage", import("view.activity.CorePage.CoreActivityPage"))

var_0_0.DropType2Name = {
	[DROP_TYPE_EQUIP] = "equip",
	[DROP_TYPE_FURNITURE] = "furniture",
	[DROP_TYPE_EQUIPMENT_SKIN] = "equip_skin",
	[DROP_TYPE_SPWEAPON] = "special_weapon"
}

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.btnList = arg_1_0:findTF("btn_list", arg_1_0.bg)
	arg_1_0.itemPanel = arg_1_0:findTF("item_panel", arg_1_0.bg)
	arg_1_0.togglesTF = arg_1_0:findTF("toggles", arg_1_0.itemPanel)
	arg_1_0.content = arg_1_0:findTF("item_list/content", arg_1_0.itemPanel)
	arg_1_0.itemList = UIItemList.New(arg_1_0.content, arg_1_0:findTF("tpl", arg_1_0.content))

	setText(arg_1_0:findTF("tpl/owner/title", arg_1_0.content), i18n("collect_page_got"))

	arg_1_0.boxTF = arg_1_0:findTF("Box")
	arg_1_0.boxBG = arg_1_0:findTF("BG", arg_1_0.boxTF)
	arg_1_0.panel = arg_1_0:findTF("Panel", arg_1_0.boxTF)
	arg_1_0.infoTF = arg_1_0:findTF("Info", arg_1_0.panel)
	arg_1_0.boxCloseBtn = arg_1_0:findTF("CloseBtn", arg_1_0.infoTF)
	arg_1_0.Title = arg_1_0:findTF("Title", arg_1_0.infoTF)
	arg_1_0.boxIconTF = arg_1_0:findTF("Icon/Mask/IconTpl", arg_1_0.infoTF)
	arg_1_0.boxNameText = arg_1_0:findTF("NameText", arg_1_0.infoTF)
	arg_1_0.boxNumTF = arg_1_0:findTF("Num", arg_1_0.infoTF)
	arg_1_0.boxNumTip = arg_1_0:findTF("Text", arg_1_0.boxNumTF)
	arg_1_0.boxNumText = arg_1_0:findTF("NumText", arg_1_0.boxNumTF)
	arg_1_0.boxDescText = arg_1_0:findTF("DescText", arg_1_0.infoTF)
	arg_1_0.boxSrcText = arg_1_0:findTF("SrcText", arg_1_0.infoTF)
	arg_1_0.boxSrcContent = arg_1_0:findTF("Content", arg_1_0.panel)
	arg_1_0.boxSrcTpl = arg_1_0:findTF("SrcTpl", arg_1_0.boxSrcContent)

	onButton(arg_1_0, arg_1_0.boxBG, function()
		arg_1_0:showBoxPanel(false)
	end, SFX_PANEL)
	onButton(arg_1_0, arg_1_0.boxCloseBtn, function()
		arg_1_0:showBoxPanel(false)
	end, SFX_PANEL)
end

function var_0_0.OnDataSetting(arg_4_0)
	arg_4_0.guideConfig = pg.activity_limit_item_guide

	arg_4_0:BuildDatas()
end

function var_0_0.BuildDatas(arg_5_0)
	local var_5_0 = pg.activity_limit_item_guide.get_id_list_by_activity[arg_5_0.activity.id] or {}

	arg_5_0.dataList = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		local var_5_1 = {
			id = iter_5_1
		}

		var_5_1.config = arg_5_0.guideConfig[var_5_1.id]
		var_5_1.count = arg_5_0.activity:getKVPList(1, var_5_1.id)

		if var_5_1.config.count_storage == 1 then
			var_5_1.count = Drop.New({
				type = var_5_1.config.type,
				id = var_5_1.config.drop_id
			}):getOwnedCount()
		end

		table.insert(arg_5_0.dataList, var_5_1)
	end
end

function var_0_0.GetTogglesDropTypes(arg_6_0)
	return {
		DROP_TYPE_EQUIP,
		DROP_TYPE_FURNITURE,
		DROP_TYPE_EQUIPMENT_SKIN,
		DROP_TYPE_SPWEAPON
	}
end

function var_0_0.OnFirstFlush(arg_7_0)
	arg_7_0.itemList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			arg_7_0:OnUpdateItem(arg_8_1, arg_8_2)
		end
	end)
	arg_7_0:AddTogglesListener()
	arg_7_0:AddSpecialBtnListener()

	arg_7_0.curPage = arg_7_0.curPage or arg_7_0:GetTogglesDropTypes()[1]

	triggerToggle(arg_7_0.toggles[arg_7_0.curPage], true)
end

function var_0_0.OnUpdateFlush(arg_9_0)
	arg_9_0:BuildDatas()
	arg_9_0:UpdatePage(arg_9_0.curPage)
end

function var_0_0.AddTogglesListener(arg_10_0)
	arg_10_0.toggles = {}

	local var_10_0 = arg_10_0:GetTogglesDropTypes()

	assert(#var_10_0 == arg_10_0.togglesTF.childCount, "dropType数量与togglesTF子节点数不匹配")

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_1 = arg_10_0:findTF(var_0_0.DropType2Name[iter_10_1], arg_10_0.togglesTF)

		onToggle(arg_10_0, var_10_1, function(arg_11_0)
			if arg_11_0 then
				arg_10_0:UpdatePage(iter_10_1)
			end
		end, SFX_PANEL)

		arg_10_0.toggles[iter_10_1] = var_10_1
	end
end

function var_0_0.AddSpecialBtnListener(arg_12_0)
	local var_12_0 = arg_12_0.activity:getConfig("config_client")

	arg_12_0.furnitureThemeBtn = arg_12_0:findTF("furniture_theme", arg_12_0.btnList)

	if arg_12_0.furnitureThemeBtn and var_12_0.furniture_theme_link then
		onButton(arg_12_0, arg_12_0.furnitureThemeBtn, function()
			local var_13_0 = var_12_0.furniture_theme_link
			local var_13_1 = var_13_0[1]
			local var_13_2 = var_13_0[2]
			local var_13_3 = var_13_0[3]

			arg_12_0:DoSkip(var_13_1, var_13_2)
		end, SFX_PANEL)
	end

	arg_12_0.medalBtn = arg_12_0:findTF("medal", arg_12_0.btnList)

	if arg_12_0.medalBtn and var_12_0.medal_link then
		onButton(arg_12_0, arg_12_0.medalBtn, function()
			local var_14_0 = var_12_0.medal_link
			local var_14_1 = var_14_0[1]
			local var_14_2 = var_14_0[2]
			local var_14_3 = var_14_0[3]

			arg_12_0:DoSkip(var_14_1, var_14_2)
		end, SFX_PANEL)
	end

	arg_12_0.equipSkinBoxBtn = arg_12_0:findTF("equip_skin_box", arg_12_0.btnList)

	if arg_12_0.equipSkinBoxBtn and var_12_0.equipskin_box_link then
		local var_12_1 = Drop.New({
			type = var_12_0.equipskin_box_link.drop_type,
			id = var_12_0.equipskin_box_link.drop_id
		}):getOwnedCount()

		onButton(arg_12_0, arg_12_0.equipSkinBoxBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
				show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL,
				drop_type = var_12_0.equipskin_box_link.drop_type,
				drop_id = var_12_0.equipskin_box_link.drop_id,
				count = var_12_1,
				skipable_list = var_12_0.equipskin_box_link.list
			})
		end, SFX_PANEL)
	end
end

function var_0_0.OnUpdateItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.showDataList[arg_16_1 + 1]
	local var_16_1 = arg_16_0:findTF("icon_mask/icon", arg_16_2)
	local var_16_2 = {
		type = var_16_0.config.type,
		id = var_16_0.config.drop_id
	}

	updateDrop(var_16_1, var_16_2)
	onButton(arg_16_0, var_16_1, function()
		arg_16_0:OnClickItem(var_16_0)
	end, SFX_PANEL)
	changeToScrollText(arg_16_0:findTF("name_mask/name", arg_16_2), Drop.New({
		type = var_16_0.config.type,
		id = var_16_0.config.drop_id
	}):getName())
	arg_16_0:RefreshCountText(var_16_0, arg_16_2)

	GetOrAddComponent(arg_16_0:findTF("owner", arg_16_2), typeof(CanvasGroup)).alpha = var_16_0.count == var_16_0.config.count and 0.5 or 1

	setActive(arg_16_0:findTF("got", arg_16_2), var_16_0.count == var_16_0.config.count)
	setActive(arg_16_0:findTF("new", arg_16_2), var_16_0.config.is_new == "1")
end

function var_0_0.RefreshCountText(arg_18_0, arg_18_1, arg_18_2)
	setText(arg_18_0:findTF("owner/number", arg_18_2), arg_18_1.count .. "/" .. arg_18_1.config.count)
end

function var_0_0.OnClickItem(arg_19_0, arg_19_1)
	local var_19_0 = {
		type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
		show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT,
		drop_type = arg_19_1.config.type,
		drop_id = arg_19_1.config.drop_id,
		count = arg_19_1.count,
		count_limit = arg_19_1.config.count,
		skipable_list = arg_19_1.config.link_params
	}

	arg_19_0:updateBoxPanel(var_19_0)
	arg_19_0:showBoxPanel(true)
end

function var_0_0.UpdatePage(arg_20_0, arg_20_1)
	arg_20_0.curPage = arg_20_1
	arg_20_0.showDataList = {}

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.dataList) do
		if arg_20_0.guideConfig[iter_20_1.id].type == arg_20_1 then
			table.insert(arg_20_0.showDataList, iter_20_1)
		end
	end

	table.sort(arg_20_0.showDataList, CompareFuncs({
		function(arg_21_0)
			return arg_21_0.count < arg_21_0.config.count and 0 or 1
		end,
		function(arg_22_0)
			return arg_22_0.config.order
		end,
		function(arg_23_0)
			return arg_23_0.id
		end
	}))
	arg_20_0.itemList:align(#arg_20_0.showDataList)
end

function var_0_0.updateBoxPanel(arg_24_0, arg_24_1)
	local var_24_0 = Drop.New({
		type = arg_24_1.drop_type,
		id = arg_24_1.drop_id
	})

	updateDrop(arg_24_0.boxIconTF, var_24_0)

	local var_24_1 = var_24_0.cfg

	changeToScrollText(arg_24_0.boxNameText, var_24_1.name)
	setText(arg_24_0.boxDescText, SwitchSpecialChar(var_24_0.desc))
	setText(arg_24_0.boxNumTip, i18n("collect_page_got"))

	if arg_24_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL then
		setText(arg_24_0.boxNumText, arg_24_1.count)
	elseif arg_24_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT then
		setText(arg_24_0.boxNumText, string.format("%s<color=#735d54>/%s</color>", arg_24_1.count, arg_24_1.count_limit or 0))
	end

	UIItemList.StaticAlign(arg_24_0.boxSrcContent, arg_24_0.boxSrcTpl, #arg_24_1.skipable_list, function(arg_25_0, arg_25_1, arg_25_2)
		if arg_25_0 == UIItemList.EventUpdate then
			local var_25_0 = arg_24_1.skipable_list[arg_25_1 + 1]
			local var_25_1 = var_25_0[1]
			local var_25_2 = var_25_0[2]
			local var_25_3 = var_25_0[3]

			changeToScrollText(arg_24_0:findTF("SrcText", arg_25_2), var_25_3)

			local var_25_4 = arg_24_0:findTF("GoBtn", arg_25_2)

			setText(arg_24_0:findTF("go", var_25_4), i18n("brs_reward_tip_2"))
			onButton(arg_24_0, var_25_4, function()
				arg_24_0:DoSkip(var_25_1, var_25_2)
				arg_24_0:showBoxPanel(false)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.showBoxPanel(arg_27_0, arg_27_1)
	setActive(arg_27_0.boxTF, arg_27_1)

	if arg_27_1 == true then
		pg.UIMgr.GetInstance():BlurPanel(arg_27_0.boxTF)
	else
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_27_0.boxTF)
	end
end

function var_0_0.DoSkip(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_SCENE then
		pg.m02:sendNotification(GAME.GO_SCENE, arg_28_2[1], arg_28_2[2] or {})
	elseif arg_28_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_SCENE then
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_28_2
		})
	end
end

return var_0_0
