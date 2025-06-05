local var_0_0 = class("HeiYanAwardPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0:findTF("AD")
	arg_1_0.table_Top = {
		arg_1_0:findTF("tabs/top_1", arg_1_0.AD),
		arg_1_0:findTF("tabs/top_2", arg_1_0.AD),
		arg_1_0:findTF("tabs/top_3", arg_1_0.AD),
		arg_1_0:findTF("tabs/top_4", arg_1_0.AD)
	}
	arg_1_0.bg_1 = arg_1_0:findTF("bg_1", arg_1_0.AD)
	arg_1_0.bg_2 = arg_1_0:findTF("bg_2", arg_1_0.AD)
	arg_1_0.boxTF = arg_1_0:findTF("Box")
	arg_1_0.boxBG = arg_1_0:findTF("BG", arg_1_0.boxTF)
	arg_1_0.panel = arg_1_0:findTF("Panel", arg_1_0.boxTF)
	arg_1_0.infoTF = arg_1_0:findTF("Info", arg_1_0.panel)
	arg_1_0.boxCloseBtn = arg_1_0:findTF("CloseBtn", arg_1_0.infoTF)
	arg_1_0.Title = arg_1_0:findTF("Title", arg_1_0.infoTF)

	setText(arg_1_0.Title, i18n("brs_reward_tip_1"))

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
	pg.UIMgr.GetInstance():OverlayPanel(arg_1_0.boxTF)
end

function var_0_0.OnDataSetting(arg_4_0)
	arg_4_0.guideConfig = pg.activity_limit_item_guide

	arg_4_0:BuildDatas()
end

function var_0_0.BuildDatas(arg_5_0)
	local var_5_0 = pg.activity_limit_item_guide.get_id_list_by_activity[arg_5_0.activity.id]

	assert(var_5_0, "activity_limit_item_guide not exist activity id: " .. arg_5_0.activity.id)

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

function var_0_0.OnFirstFlush(arg_6_0)
	arg_6_0:InitData()
end

function var_0_0.OnUpdateFlush(arg_7_0)
	arg_7_0:UpdateView()
end

function var_0_0.InitData(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0.table_Top) do
		onToggle(arg_8_0, iter_8_1, function(arg_9_0)
			if arg_9_0 then
				arg_8_0.pageIndex = iter_8_0

				SetActive(arg_8_0.bg_1, iter_8_0 == 1)
				SetActive(arg_8_0.bg_2, iter_8_0 ~= 1)
				arg_8_0:DataList(iter_8_0)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateView(arg_10_0)
	for iter_10_0 = 1, #arg_10_0.table_Top do
		setText(arg_10_0:findTF("Label", arg_10_0.table_Top[iter_10_0]), arg_10_0:OnGetCount(iter_10_0) .. "/" .. arg_10_0:OnCount(iter_10_0))
	end

	triggerToggle(arg_10_0.table_Top[arg_10_0.pageIndex or 1], true)
end

function var_0_0.DataList(arg_11_0, arg_11_1)
	arg_11_0.showDataList = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.dataList) do
		if arg_11_0.guideConfig[iter_11_1.id].type == 4 and arg_11_1 == 1 then
			table.insert(arg_11_0.showDataList, iter_11_1)
		elseif arg_11_0.guideConfig[iter_11_1.id].type == 5 and arg_11_1 == 2 then
			table.insert(arg_11_0.showDataList, iter_11_1)
		elseif arg_11_0.guideConfig[iter_11_1.id].type == 9 and arg_11_1 == 3 then
			table.insert(arg_11_0.showDataList, iter_11_1)
		elseif arg_11_0.guideConfig[iter_11_1.id].type == 21 and arg_11_1 == 4 then
			table.insert(arg_11_0.showDataList, iter_11_1)
		end
	end

	table.sort(arg_11_0.showDataList, CompareFuncs({
		function(arg_12_0)
			return arg_12_0.config.order
		end,
		function(arg_13_0)
			return arg_13_0.id
		end
	}))

	if arg_11_1 == 1 then
		arg_11_0:ShowSitePage()
	elseif arg_11_1 == 2 or arg_11_1 == 3 or arg_11_1 == 4 then
		arg_11_0:ShowCharaPage()
	end
end

function var_0_0.OnCount(arg_14_0, arg_14_1)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.dataList) do
		if arg_14_0.guideConfig[iter_14_1.id].type == 4 and arg_14_1 == 1 then
			table.insert(var_14_0, iter_14_1)
		elseif arg_14_0.guideConfig[iter_14_1.id].type == 5 and arg_14_1 == 2 then
			table.insert(var_14_0, iter_14_1)
		elseif arg_14_0.guideConfig[iter_14_1.id].type == 9 and arg_14_1 == 3 then
			table.insert(var_14_0, iter_14_1)
		elseif arg_14_0.guideConfig[iter_14_1.id].type == 21 and arg_14_1 == 4 then
			table.insert(var_14_0, iter_14_1)
		end
	end

	return #var_14_0
end

function var_0_0.OnGetCount(arg_15_0, arg_15_1)
	local var_15_0 = 0

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.dataList) do
		if arg_15_0.guideConfig[iter_15_1.id].type == 4 and arg_15_1 == 1 then
			local var_15_1 = Drop.New({
				type = iter_15_1.config.type,
				id = iter_15_1.config.drop_id
			}).id
			local var_15_2 = pg.ship_data_template[var_15_1].group_type

			if tobool(getProxy(CollectionProxy):getShipGroup(var_15_2)) then
				var_15_0 = var_15_0 + 1
			end
		elseif arg_15_0.guideConfig[iter_15_1.id].type == 5 and arg_15_1 == 2 then
			if iter_15_1.count == iter_15_1.config.count then
				var_15_0 = var_15_0 + 1
			end
		elseif arg_15_0.guideConfig[iter_15_1.id].type == 9 and arg_15_1 == 3 then
			if iter_15_1.count == iter_15_1.config.count then
				var_15_0 = var_15_0 + 1
			end
		elseif arg_15_0.guideConfig[iter_15_1.id].type == 21 and arg_15_1 == 4 and iter_15_1.count == iter_15_1.config.count then
			var_15_0 = var_15_0 + 1
		end
	end

	return var_15_0
end

function var_0_0.ShowSitePage(arg_16_0)
	local var_16_0 = arg_16_0.showDataList[1].config.drop_id
	local var_16_1 = arg_16_0:findTF("Role_left", arg_16_0.bg_1)
	local var_16_2 = arg_16_0:findTF("lock_bg", var_16_1)
	local var_16_3 = arg_16_0:findTF("name", var_16_1)
	local var_16_4 = arg_16_0:findTF("get", var_16_1)
	local var_16_5 = arg_16_0:findTF("Text", var_16_4)
	local var_16_6 = arg_16_0:findTF("notget", var_16_1)
	local var_16_7 = arg_16_0:findTF("Text", var_16_6)

	setText(var_16_5, i18n("word_got"))
	setText(var_16_7, i18n("word_not_get"))

	local var_16_8 = Drop.New({
		type = arg_16_0.showDataList[1].config.type,
		id = arg_16_0.showDataList[1].config.drop_id
	})
	local var_16_9 = var_16_8:getName()
	local var_16_10 = var_16_8.id
	local var_16_11 = pg.ship_data_template[var_16_10].group_type
	local var_16_12 = tobool(getProxy(CollectionProxy):getShipGroup(var_16_11))

	setText(arg_16_0:findTF("Text", var_16_3), var_16_9)
	SetActive(var_16_2, not var_16_12)
	SetActive(var_16_4, var_16_12)
	SetActive(var_16_6, not var_16_12)

	local var_16_13 = arg_16_0:findTF("Role_right", arg_16_0.bg_1)
	local var_16_14 = arg_16_0:findTF("lock_bg", var_16_13)
	local var_16_15 = arg_16_0:findTF("name", var_16_13)
	local var_16_16 = arg_16_0:findTF("get", var_16_13)
	local var_16_17 = arg_16_0:findTF("Text", var_16_16)
	local var_16_18 = arg_16_0:findTF("notget", var_16_13)
	local var_16_19 = arg_16_0:findTF("Text", var_16_18)

	setText(var_16_17, i18n("word_got"))
	setText(var_16_19, i18n("word_not_get"))

	local var_16_20 = arg_16_0.showDataList[2].config.drop_id
	local var_16_21 = Drop.New({
		type = arg_16_0.showDataList[2].config.type,
		id = arg_16_0.showDataList[2].config.drop_id
	})
	local var_16_22 = var_16_21:getName()
	local var_16_23 = var_16_21.id
	local var_16_24 = pg.ship_data_template[var_16_23].group_type
	local var_16_25 = tobool(getProxy(CollectionProxy):getShipGroup(var_16_24))

	setText(arg_16_0:findTF("Text", var_16_15), var_16_22)
	SetActive(var_16_18, not var_16_25)
	SetActive(var_16_16, var_16_25)
	SetActive(var_16_14, not var_16_25)
end

function var_0_0.ShowCharaPage(arg_17_0)
	arg_17_0.award = arg_17_0:findTF("tpl", arg_17_0.bg_2)
	arg_17_0.count = arg_17_0:findTF("count", arg_17_0.bg_2)
	arg_17_0.tabsList = UIItemList.New(arg_17_0.count, arg_17_0.award)

	arg_17_0.tabsList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			arg_17_0:OnUpdateItem(arg_18_1, arg_18_2, data)
		end
	end)
	arg_17_0.tabsList:align(#arg_17_0.showDataList)
end

function var_0_0.OnUpdateItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.showDataList[arg_19_1 + 1]
	local var_19_1 = arg_19_0:findTF("icon_mask/icon", arg_19_2)
	local var_19_2 = {
		type = var_19_0.config.type,
		id = var_19_0.config.drop_id
	}

	updateDrop(var_19_1, var_19_2)
	onButton(arg_19_0, var_19_1, function()
		local var_20_0 = {
			type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
			show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT,
			drop_type = var_19_0.config.type,
			drop_id = var_19_0.config.drop_id,
			count = var_19_0.count,
			count_limit = var_19_0.config.count,
			skipable_list = var_19_0.config.link_params
		}

		arg_19_0:updateBoxPanel(var_20_0)
		arg_19_0:showBoxPanel(true)
	end, SFX_PANEL)
	changeToScrollText(arg_19_0:findTF("name_mask/name", arg_19_2), Drop.New({
		type = var_19_0.config.type,
		id = var_19_0.config.drop_id
	}):getName())
	setText(arg_19_0:findTF("owner/number", arg_19_2), var_19_0.count .. "/" .. var_19_0.config.count)

	GetOrAddComponent(arg_19_0:findTF("owner", arg_19_2), typeof(CanvasGroup)).alpha = var_19_0.count == var_19_0.config.count and 0.5 or 1

	setActive(arg_19_0:findTF("got", arg_19_2), var_19_0.count == var_19_0.config.count)
end

function var_0_0.updateBoxPanel(arg_21_0, arg_21_1)
	local var_21_0 = Drop.New({
		type = arg_21_1.drop_type,
		id = arg_21_1.drop_id
	})

	updateDrop(arg_21_0.boxIconTF, var_21_0)

	local var_21_1 = var_21_0.cfg

	changeToScrollText(arg_21_0.boxNameText, var_21_1.name)
	setText(arg_21_0.boxDescText, SwitchSpecialChar(var_21_0.desc))
	setText(arg_21_0.boxNumTip, i18n("word_got"))

	if arg_21_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL then
		setText(arg_21_0.boxNumText, arg_21_1.count)
	elseif arg_21_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT then
		setText(arg_21_0.boxNumText, arg_21_1.count .. "/" .. (arg_21_1.count_limit or 0))
	end

	UIItemList.StaticAlign(arg_21_0.boxSrcContent, arg_21_0.boxSrcTpl, #arg_21_1.skipable_list, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = arg_21_1.skipable_list[arg_22_1 + 1]
			local var_22_1 = var_22_0[1]
			local var_22_2 = var_22_0[2]
			local var_22_3 = var_22_0[3]

			changeToScrollText(arg_21_0:findTF("SrcText", arg_22_2), var_22_3)

			local var_22_4 = arg_21_0:findTF("GoBtn", arg_22_2)

			setText(arg_21_0:findTF("go", var_22_4), i18n("brs_reward_tip_2"))
			onButton(arg_21_0, var_22_4, function()
				if var_22_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_SCENE then
					pg.m02:sendNotification(GAME.GO_SCENE, var_22_2[1], var_22_2[2] or {})
				elseif var_22_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_ACTIVITY then
					arg_21_0:emit(ActivityMediator.SELECT_ACTIVITY, var_22_2)
				end

				arg_21_0:showBoxPanel(false)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.showBoxPanel(arg_24_0, arg_24_1)
	setActive(arg_24_0.boxTF, arg_24_1)
end

function var_0_0.OnDestroy(arg_25_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_25_0.boxTF)
	var_0_0.super.OnDestroy(arg_25_0)
end

return var_0_0
