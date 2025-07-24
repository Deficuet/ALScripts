local var_0_0 = class("ALYAwardPage", import("..CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0:findTF("AD")
	arg_1_0.table_Top = {
		arg_1_0:findTF("tabs/top_1", arg_1_0.AD),
		arg_1_0:findTF("tabs/top_2", arg_1_0.AD),
		arg_1_0:findTF("tabs/top_3", arg_1_0.AD),
		arg_1_0:findTF("tabs/top_4", arg_1_0.AD)
	}
	arg_1_0.btn = arg_1_0:findTF("btn", arg_1_0.AD)
	arg_1_0.furmiturebtn = arg_1_0:findTF("furmiturebtn", arg_1_0.btn)
	arg_1_0.commemoratebtn = arg_1_0:findTF("commemoratebtn", arg_1_0.btn)
	arg_1_0.equipmentbtn = arg_1_0:findTF("equipmentbtn", arg_1_0.btn)

	arg_1_0:findTF("left/Title", arg_1_0.furmiturebtn):GetComponent(typeof(Image)):SetNativeSize()
	arg_1_0:findTF("left/Title", arg_1_0.commemoratebtn):GetComponent(typeof(Image)):SetNativeSize()
	arg_1_0:findTF("left/Title", arg_1_0.equipmentbtn):GetComponent(typeof(Image)):SetNativeSize()

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
end

function var_0_0.BuildDatas(arg_4_0)
	local var_4_0 = pg.activity_limit_item_guide.get_id_list_by_activity[arg_4_0.activity.id]

	assert(var_4_0, "activity_limit_item_guide not exist activity id: " .. arg_4_0.activity.id)

	arg_4_0.dataList = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_1 = {
			id = iter_4_1
		}

		var_4_1.config = arg_4_0.guideConfig[var_4_1.id]
		var_4_1.count = arg_4_0.activity:getKVPList(1, var_4_1.id)

		if var_4_1.config.count_storage == 1 then
			var_4_1.count = Drop.New({
				type = var_4_1.config.type,
				id = var_4_1.config.drop_id
			}):getOwnedCount()
		end

		table.insert(arg_4_0.dataList, var_4_1)
	end
end

function var_0_0.OnDataSetting(arg_5_0)
	arg_5_0.guideConfig = pg.activity_limit_item_guide

	arg_5_0:BuildDatas()
end

function var_0_0.OnFirstFlush(arg_6_0)
	arg_6_0:InitData()

	local var_6_0 = arg_6_0.activity:getConfig("config_client")

	onButton(arg_6_0, arg_6_0.furmiturebtn, function()
		arg_6_0:DoSkip(var_6_0.furniture_theme_link[1], var_6_0.furniture_theme_link[2])
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.commemoratebtn, function()
		arg_6_0:DoSkip(var_6_0.medal_link[1], var_6_0.medal_link[2])
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.equipmentbtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
			show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL,
			drop_type = var_6_0.equipskin_box_link.drop_type,
			drop_id = var_6_0.equipskin_box_link.drop_id,
			count = count,
			skipable_list = var_6_0.equipskin_box_link.list
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_10_0)
	triggerToggle(arg_10_0.table_Top[arg_10_0.pageIndex or 1], true)
end

function var_0_0.ResetTop(arg_11_0)
	for iter_11_0 = 1, #arg_11_0.table_Top do
		setText(arg_11_0:findTF("tabs/top_" .. iter_11_0 .. "/Label", arg_11_0.AD), i18n("yumia_award_" .. iter_11_0))
		setTextColor(arg_11_0:findTF("tabs/top_" .. iter_11_0 .. "/Label", arg_11_0.AD), Color.NewHex("cfcfcf"))
	end
end

function var_0_0.InitData(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.table_Top) do
		onToggle(arg_12_0, iter_12_1, function(arg_13_0)
			if arg_13_0 then
				arg_12_0.pageIndex = iter_12_0

				onDelayTick(function()
					arg_12_0:DataList(iter_12_0)
				end, 0.08)
				arg_12_0:ResetTop()
				setTextColor(arg_12_0:findTF("tabs/top_" .. iter_12_0 .. "/Label", arg_12_0.AD), Color.NewHex("0a2e31"))
			end
		end, SFX_PANEL)
	end
end

function var_0_0.DataList(arg_15_0, arg_15_1)
	arg_15_0.showDataList = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.dataList) do
		if arg_15_0.guideConfig[iter_15_1.id].type == 3 and arg_15_1 == 1 then
			table.insert(arg_15_0.showDataList, iter_15_1)
		elseif arg_15_0.guideConfig[iter_15_1.id].type == 5 and arg_15_1 == 2 then
			table.insert(arg_15_0.showDataList, iter_15_1)
		elseif arg_15_0.guideConfig[iter_15_1.id].type == 9 and arg_15_1 == 3 then
			table.insert(arg_15_0.showDataList, iter_15_1)
		elseif arg_15_0.guideConfig[iter_15_1.id].type == 21 and arg_15_1 == 4 then
			table.insert(arg_15_0.showDataList, iter_15_1)
		end
	end

	table.sort(arg_15_0.showDataList, CompareFuncs({
		function(arg_16_0)
			return arg_16_0.count < arg_16_0.config.count and 0 or 1
		end,
		function(arg_17_0)
			return arg_17_0.config.order
		end,
		function(arg_18_0)
			return arg_18_0.id
		end
	}))
	arg_15_0:ShowCharaPage()
end

function var_0_0.ShowCharaPage(arg_19_0)
	arg_19_0.award = arg_19_0:findTF("tpl", arg_19_0.AD)
	arg_19_0.count = arg_19_0:findTF("item_list/content", arg_19_0.AD)
	arg_19_0.tabsList = UIItemList.New(arg_19_0.count, arg_19_0.award)

	arg_19_0.tabsList:make(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			arg_19_0:OnUpdateItem(arg_20_1, arg_20_2)
		end
	end)
	arg_19_0.tabsList:align(#arg_19_0.showDataList)
end

function var_0_0.OnUpdateItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.showDataList[arg_21_1 + 1]
	local var_21_1 = arg_21_0:findTF("icon_mask/icon", arg_21_2)
	local var_21_2 = {
		type = var_21_0.config.type,
		id = var_21_0.config.drop_id
	}

	updateDrop(var_21_1, var_21_2)
	onButton(arg_21_0, var_21_1, function()
		local var_22_0 = {
			type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
			show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT,
			drop_type = var_21_0.config.type,
			drop_id = var_21_0.config.drop_id,
			count = var_21_0.count,
			count_limit = var_21_0.config.count,
			skipable_list = var_21_0.config.link_params
		}

		arg_21_0:updateBoxPanel(var_22_0)
		arg_21_0:showBoxPanel(true)
	end, SFX_PANEL)
	changeToScrollText(arg_21_0:findTF("name_mask/name", arg_21_2), Drop.New({
		type = var_21_0.config.type,
		id = var_21_0.config.drop_id
	}):getName())
	setText(arg_21_0:findTF("owner/title", arg_21_2), i18n("collect_page_got"))
	setText(arg_21_0:findTF("owner/Text", arg_21_2), var_21_0.count)
	setText(arg_21_0:findTF("owner/number", arg_21_2), "/" .. var_21_0.config.count)

	GetOrAddComponent(arg_21_0:findTF("owner", arg_21_2), typeof(CanvasGroup)).alpha = var_21_0.count == var_21_0.config.count and 0.5 or 1

	setActive(arg_21_0:findTF("got", arg_21_2), var_21_0.count == var_21_0.config.count)
end

function var_0_0.updateBoxPanel(arg_23_0, arg_23_1)
	local var_23_0 = Drop.New({
		type = arg_23_1.drop_type,
		id = arg_23_1.drop_id
	})

	updateDrop(arg_23_0.boxIconTF, var_23_0)

	local var_23_1 = var_23_0.cfg

	changeToScrollText(arg_23_0.boxNameText, var_23_1.name)
	setText(arg_23_0.boxDescText, SwitchSpecialChar(var_23_0.desc))
	setText(arg_23_0.boxNumTip, i18n("word_got") .. "：")

	if arg_23_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL then
		setText(arg_23_0.boxNumText, "<color=#FCFCE8>" .. arg_23_1.count .. "</color>")
	elseif arg_23_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT then
		setText(arg_23_0.boxNumText, "<color=#FCFCE8>" .. arg_23_1.count .. "</color>/" .. (arg_23_1.count_limit or 0))
	end

	UIItemList.StaticAlign(arg_23_0.boxSrcContent, arg_23_0.boxSrcTpl, #arg_23_1.skipable_list, function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == UIItemList.EventUpdate then
			local var_24_0 = arg_23_1.skipable_list[arg_24_1 + 1]
			local var_24_1 = var_24_0[1]
			local var_24_2 = var_24_0[2]
			local var_24_3 = var_24_0[3]

			changeToScrollText(arg_23_0:findTF("SrcText", arg_24_2), var_24_3)

			local var_24_4 = arg_23_0:findTF("GoBtn", arg_24_2)

			setText(arg_23_0:findTF("go", var_24_4), i18n("brs_reward_tip_2"))
			onButton(arg_23_0, var_24_4, function()
				if var_24_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_SCENE then
					pg.m02:sendNotification(GAME.GO_SCENE, var_24_2[1], var_24_2[2] or {})
				elseif var_24_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_ACTIVITY then
					arg_23_0:emit(ActivityMediator.SELECT_ACTIVITY, var_24_2)
				end

				arg_23_0:showBoxPanel(false)
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.DoSkip(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_1 == 2 then
		pg.m02:sendNotification(GAME.GO_SCENE, arg_26_2[1], arg_26_2[2] or {})
	elseif arg_26_1 == 3 then
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_26_2
		})
	end
end

function var_0_0.showBoxPanel(arg_27_0, arg_27_1)
	setActive(arg_27_0.boxTF, arg_27_1)

	if arg_27_1 == true then
		pg.UIMgr.GetInstance():BlurPanel(arg_27_0.boxTF)
	else
		pg.UIMgr.GetInstance():UnblurPanel(arg_27_0.boxTF, arg_27_0._tf)
	end
end

function var_0_0.OnDestroy(arg_28_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_28_0.boxTF, arg_28_0._tf)
	var_0_0.super.OnDestroy(arg_28_0)
end

return var_0_0
