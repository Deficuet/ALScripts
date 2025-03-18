local var_0_0 = class("ToloveCollectPage", import(".TemplatePage.LinkCollectTemplatePage"))

var_0_0.SKIP_TYPE_MINIGAME = 7

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)
	arg_1_0:findUI()
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	arg_2_0:rewriteEquipSkinBtn()
end

function var_0_0.findUI(arg_3_0)
	setImageRaycastTarget(arg_3_0:findTF("tpl/Frame", arg_3_0.content), false)

	arg_3_0.boxTF = arg_3_0:findTF("Box")
	arg_3_0.boxBG = arg_3_0:findTF("BG", arg_3_0.boxTF)
	arg_3_0.panel = arg_3_0:findTF("Panel", arg_3_0.boxTF)
	arg_3_0.infoTF = arg_3_0:findTF("Info", arg_3_0.panel)
	arg_3_0.boxCloseBtn = arg_3_0:findTF("CloseBtn", arg_3_0.infoTF)
	arg_3_0.boxIconTF = arg_3_0:findTF("Icon/Mask/IconTpl", arg_3_0.infoTF)
	arg_3_0.boxNameText = arg_3_0:findTF("NameText", arg_3_0.infoTF)
	arg_3_0.boxNumTF = arg_3_0:findTF("Num", arg_3_0.infoTF)
	arg_3_0.boxNumTip = arg_3_0:findTF("Text", arg_3_0.boxNumTF)
	arg_3_0.boxNumText = arg_3_0:findTF("NumText", arg_3_0.boxNumTF)
	arg_3_0.boxDescText = arg_3_0:findTF("DescText", arg_3_0.infoTF)
	arg_3_0.boxSrcText = arg_3_0:findTF("SrcText", arg_3_0.infoTF)

	onButton(arg_3_0, arg_3_0.boxBG, function()
		arg_3_0:showBoxPanel(false)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.boxCloseBtn, function()
		arg_3_0:showBoxPanel(false)
	end, SFX_PANEL)

	arg_3_0.boxSrcContent = arg_3_0:findTF("Content", arg_3_0.panel)
	arg_3_0.boxSrcTpl = arg_3_0:findTF("SrcTpl", arg_3_0.boxSrcContent)

	GetComponent(arg_3_0:findTF("furniture_theme/Title", arg_3_0.btnList), "Image"):SetNativeSize()
	GetComponent(arg_3_0:findTF("equip_skin_box/Title", arg_3_0.btnList), "Image"):SetNativeSize()
	GetComponent(arg_3_0:findTF("medal/Title", arg_3_0.btnList), "Image"):SetNativeSize()
end

function var_0_0.rewriteEquipSkinBtn(arg_6_0)
	onButton(arg_6_0, arg_6_0.equipSkinBoxBtn, function()
		local var_7_0 = arg_6_0.activity:getConfig("config_client")
		local var_7_1 = Drop.New({
			type = var_7_0.equipskin_box_link.drop_type,
			id = var_7_0.equipskin_box_link.drop_id
		}):getOwnedCount()
		local var_7_2 = {
			type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
			show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL,
			drop_type = var_7_0.equipskin_box_link.drop_type,
			drop_id = var_7_0.equipskin_box_link.drop_id,
			count = var_7_1,
			skipable_list = var_7_0.equipskin_box_link.list
		}

		arg_6_0:updateBoxPanel(var_7_2)
		arg_6_0:showBoxPanel(true)
	end, SFX_PANEL)
end

function var_0_0.updateBoxPanel(arg_8_0, arg_8_1)
	local var_8_0 = Drop.New({
		type = arg_8_1.drop_type,
		id = arg_8_1.drop_id
	})

	updateDrop(arg_8_0.boxIconTF, var_8_0)

	local var_8_1 = var_8_0.cfg

	changeToScrollText(arg_8_0.boxNameText, var_8_1.name)
	setText(arg_8_0.boxDescText, SwitchSpecialChar(var_8_0.desc))
	setText(arg_8_0.boxNumTip, i18n("word_own1"))

	if arg_8_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_NORMAL then
		setText(arg_8_0.boxNumText, arg_8_1.count)
	elseif arg_8_1.show_type == Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT then
		setText(arg_8_0.boxNumText, arg_8_1.count .. "/" .. (arg_8_1.count_limit or 0))
	end

	UIItemList.StaticAlign(arg_8_0.boxSrcContent, arg_8_0.boxSrcTpl, #arg_8_1.skipable_list, function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_8_1.skipable_list[arg_9_1 + 1]
			local var_9_1 = var_9_0[1]
			local var_9_2 = var_9_0[2]
			local var_9_3 = var_9_0[3]

			changeToScrollText(arg_8_0:findTF("SrcText", arg_9_2), var_9_3)

			local var_9_4 = arg_8_0:findTF("GoBtn", arg_9_2)

			onButton(arg_8_0, var_9_4, function()
				if var_9_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_SCENE then
					pg.m02:sendNotification(GAME.GO_SCENE, var_9_2[1], var_9_2[2] or {})
				elseif var_9_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_ACTIVITY then
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
						id = var_9_2
					})
				elseif var_9_1 == var_0_0.SKIP_TYPE_MINIGAME then
					pg.m02:sendNotification(GAME.GO_MINI_GAME, var_9_2[1])
				end

				arg_8_0:showBoxPanel(false)
			end, SFX_PANEL)
			Canvas.ForceUpdateCanvases()
		end
	end)
end

function var_0_0.showBoxPanel(arg_11_0, arg_11_1)
	setActive(arg_11_0.boxTF, arg_11_1)
end

function var_0_0.OnUpdateItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.showDataList[arg_12_1 + 1]
	local var_12_1 = arg_12_0:findTF("icon_mask/icon", arg_12_2)
	local var_12_2 = {
		type = var_12_0.config.type,
		id = var_12_0.config.drop_id
	}

	updateDrop(var_12_1, var_12_2)
	onButton(arg_12_0, var_12_1, function()
		local var_13_0 = {
			type = MSGBOX_TYPE_LIKN_COLLECT_GUIDE,
			show_type = Msgbox4LinkCollectGuide.SHOW_TYPE_LIMIT,
			drop_type = var_12_0.config.type,
			drop_id = var_12_0.config.drop_id,
			count = var_12_0.count,
			count_limit = var_12_0.config.count,
			skipable_list = var_12_0.config.link_params
		}

		arg_12_0:updateBoxPanel(var_13_0)
		arg_12_0:showBoxPanel(true)
	end, SFX_PANEL)
	changeToScrollText(arg_12_0:findTF("name_mask/name", arg_12_2), Drop.New({
		type = var_12_0.config.type,
		id = var_12_0.config.drop_id
	}):getName())
	setText(arg_12_0:findTF("owner/number", arg_12_2), var_12_0.count .. "/" .. var_12_0.config.count)

	GetOrAddComponent(arg_12_0:findTF("owner", arg_12_2), typeof(CanvasGroup)).alpha = var_12_0.count == var_12_0.config.count and 0.5 or 1

	setActive(arg_12_0:findTF("got", arg_12_2), var_12_0.count == var_12_0.config.count)
	setActive(arg_12_0:findTF("new", arg_12_2), var_12_0.config.is_new == "1")
end

return var_0_0
