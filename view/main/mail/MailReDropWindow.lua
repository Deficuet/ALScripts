local var_0_0 = class("MailReDropWindow", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "MailReDropMsgboxUI"
end

function var_0_0.OnInit(arg_2_0)
	onButton(arg_2_0, arg_2_0._tf:Find("bg"), function()
		arg_2_0:Hide()
	end, SFX_PANEL)

	arg_2_0.closeBtn = arg_2_0._tf:Find("adapt/window_redrop/top/btnBack")

	onButton(arg_2_0, arg_2_0.closeBtn, function()
		arg_2_0:Hide()
	end, SFX_PANEL)

	arg_2_0._window_redrop = arg_2_0._tf:Find("adapt/window_redrop")
	arg_2_0.titleTips = arg_2_0._window_redrop:Find("top/bg/infomation/title")
	arg_2_0._itemConfireText = arg_2_0._window_redrop:Find("content"):GetComponent("RichText")
	arg_2_0._confireLabel = arg_2_0._window_redrop:Find("desc/label1")
	arg_2_0._confireInput = arg_2_0._window_redrop:Find("desc/InputField")
	arg_2_0._redroptitleTips = arg_2_0._window_redrop:Find("top/bg/infomation/title")
	arg_2_0.PlaceholderText = arg_2_0._confireInput:Find("Placeholder")
	arg_2_0._redropcancelButton = arg_2_0._window_redrop:Find("button_container/btn_not")
	arg_2_0._redropconfirmButton = arg_2_0._window_redrop:Find("button_container/btn_ok")
	arg_2_0.item = arg_2_0._window_redrop:Find("item")
	arg_2_0.items = arg_2_0._window_redrop:Find("items")
	arg_2_0.itemList = UIItemList.New(arg_2_0.items, arg_2_0.item)
	arg_2_0.imgCache = {}
	arg_2_0.dropIdCache = {}

	setText(arg_2_0._redropcancelButton:Find("Text"), i18n("mail_box_cancel"))
	setText(arg_2_0._redropconfirmButton:Find("Text"), i18n("mail_box_confirm"))
	setText(arg_2_0.titleTips, i18n("mail_boxtitle_information"))
	setText(arg_2_0.PlaceholderText, i18n("mail_search"))
end

function var_0_0.Updatelayout(arg_5_0)
	if not arg_5_0.key then
		arg_5_0.key = math.random(100000, 999999)

		setText(arg_5_0._confireLabel, i18n("mail_storeroom_max_2", arg_5_0.key))
	else
		setText(arg_5_0._confireLabel, "")
	end
end

function var_0_0.showConformMsgBox(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.dropList

	arg_6_0:refrshContent(var_6_0, arg_6_1.content)

	arg_6_0.key = nil

	arg_6_0:Updatelayout()
	onButton(arg_6_0, arg_6_0._redropcancelButton, function()
		arg_6_0:Hide()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._redropconfirmButton, function()
		if arg_6_0.key then
			local var_8_0 = getInputText(arg_6_0._confireInput)

			if arg_6_0.key ~= tonumber(var_8_0) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("mail_input_erro"))

				return
			end
		end

		arg_6_0:Hide()

		if arg_6_1.onYes then
			arg_6_1.onYes()
		end
	end, SFX_PANEL)
	setActive(arg_6_0.item, false)
	arg_6_0.itemList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_9_2:Find("IconTpl")
			local var_9_1 = var_6_0[arg_9_1 + 1]
			local var_9_2 = {
				type = var_9_1.type,
				id = var_9_1.id,
				count = var_9_1.count
			}
			local var_9_3 = arg_9_2:Find("name_bg/name")

			updateDrop(var_9_0, var_9_2)
			setScrollText(var_9_3, var_9_1:getName())
		end
	end)
	arg_6_0.itemList:align(#var_6_0)
end

function var_0_0.refrshContent(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = 0
	local var_10_1 = ""

	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		local var_10_2 = iter_10_1.id
		local var_10_3 = iter_10_1.count

		if not arg_10_0.dropIdCache[var_10_2] then
			arg_10_0.dropIdCache[var_10_2] = arg_10_0:GetRestoreNumByTargetId(var_10_2)
		end

		local var_10_4 = arg_10_0.dropIdCache[var_10_2][1] or 0
		local var_10_5 = arg_10_0.dropIdCache[var_10_2][2]

		if var_10_5 and not arg_10_0.imgCache[var_10_5] then
			local var_10_6 = Item.getConfigData(var_10_5).icon
			local var_10_7 = GetSpriteFromAtlas(var_10_6, "")

			arg_10_0.imgCache[var_10_5] = var_10_6

			arg_10_0._itemConfireText:AddSprite(var_10_6, var_10_7)
		end

		var_10_1 = arg_10_0.imgCache[var_10_5]
		var_10_0 = var_10_4 * var_10_3 + var_10_0
	end

	local var_10_8 = i18n(arg_10_2, string.format("<icon name=%s w=0.7 h=0.7/>%d", var_10_1, var_10_0))

	arg_10_0._itemConfireText.text = var_10_8
end

function var_0_0.GetRestoreNumByTargetId(arg_11_0, arg_11_1)
	local var_11_0 = pg.equip_data_limit[arg_11_1].restore_id
	local var_11_1 = pg.drop_data_restore[var_11_0]

	return {
		var_11_1.resource_num,
		var_11_1.resource_type
	}
end

function var_0_0.Show(arg_12_0, arg_12_1)
	var_0_0.super.Show(arg_12_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
	arg_12_0:showConformMsgBox(arg_12_1)
end

function var_0_0.Hide(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf, arg_13_0._parentTf)
	var_0_0.super.Hide(arg_13_0)
	setInputText(arg_13_0._confireInput, "")
end

function var_0_0.OnDestroy(arg_14_0)
	arg_14_0.imgCache = nil

	if arg_14_0:isShowing() then
		arg_14_0:Hide()
	end
end

return var_0_0
