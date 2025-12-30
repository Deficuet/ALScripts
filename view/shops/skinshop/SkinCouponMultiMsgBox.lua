local var_0_0 = class("SkinCouponMultiMsgBox", import("view.shops.skinShop.SkinCouponMsgBox"))
local var_0_1 = 0
local var_0_2 = 1

function var_0_0.getUIName(arg_1_0)
	return "SkinVoucherMsgBoxUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0._tf:Find("window/top/btnBack")
	arg_2_0.cancelBtn = arg_2_0._tf:Find("window/button_container/cancel")
	arg_2_0.confirmBtn = arg_2_0._tf:Find("window/button_container/confirm")
	arg_2_0.label1 = arg_2_0._tf:Find("window/frame/Text"):GetComponent(typeof(Text))
	arg_2_0.leftItemTr = arg_2_0._tf:Find("window/frame/left")
	arg_2_0.nameTxt = arg_2_0.leftItemTr:Find("name_bg/Text"):GetComponent(typeof(Text))

	setText(arg_2_0.cancelBtn:Find("pic"), i18n("msgbox_text_cancel"))
	setText(arg_2_0.confirmBtn:Find("pic"), i18n("msgbox_text_confirm"))
	setText(arg_2_0._tf:Find("window/top/bg/infomation/title"), i18n("words_information"))
	setActive(arg_2_0.confirmBtn, false)

	arg_2_0.realPriceBtn = arg_2_0._tf:Find("window/button_container/real_price")
	arg_2_0.discountPriceBtn = arg_2_0._tf:Find("window/button_container/discount_price")

	setText(arg_2_0._tf:Find("window/top/bg/infomation/title"), i18n("title_info"))

	arg_2_0.nonUseBtn = arg_2_0._tf:Find("window/frame/option/nonuse")
	arg_2_0.useBtn = arg_2_0._tf:Find("window/frame/option/use")
	arg_2_0.scrollrect = arg_2_0._tf:Find("window/frame/scrollrect")
	arg_2_0.optionTr = arg_2_0._tf:Find("window/frame/option")
	arg_2_0.switchBtn = arg_2_0._tf:Find("window/frame/option/use/link")
	arg_2_0.tipBar = arg_2_0._tf:Find("window/frame/tipBar")
	arg_2_0.tipText = arg_2_0.tipBar:Find("Text")
	arg_2_0.linkText = arg_2_0._tf:Find("window/frame/option/use/link/Text"):GetComponent(typeof(Text))

	setText(arg_2_0._tf:Find("window/frame/option/nonuse/Text"), i18n("skin_shop_nonuse_label"))
	setText(arg_2_0._tf:Find("window/frame/option/use/Text"), i18n("skin_shop_use_label"))
end

function var_0_0.RegisterBtn(arg_3_0, arg_3_1)
	onButton(arg_3_0, arg_3_0.discountPriceBtn, function()
		if not arg_3_0.prevSelected then
			return
		end

		if arg_3_1.onYes then
			arg_3_1.onYes(arg_3_0.prevSelected)
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.realPriceBtn, function()
		if arg_3_1.onYes then
			arg_3_1.onYes()
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.switchBtn, function()
		arg_3_0:UpdateStyle(1 - arg_3_0.style)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		arg_3_0:UpdateStyle(1 - arg_3_0.style)
		triggerToggle(arg_3_0.useBtn, true)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		if arg_3_0.style == var_0_2 then
			arg_3_0:UpdateStyle(1 - arg_3_0.style)
		else
			arg_3_0:Hide()
		end
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.nonUseBtn, function(arg_9_0)
		if arg_9_0 then
			arg_3_0.prevSelected = nil

			arg_3_0:UpdateContent(arg_3_0.settings)
			arg_3_0:UpdateStyle(arg_3_0.style)
		end
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.useBtn, function(arg_10_0)
		if arg_10_0 then
			arg_3_0.prevSelected = arg_3_0:GetDefaultItem()

			arg_3_0:UpdateContent(arg_3_0.settings)
			arg_3_0:UpdateStyle(arg_3_0.style)
		end
	end, SFX_PANEL)
end

function var_0_0.GetDefaultItem(arg_11_0)
	arg_11_0.selectedItem = arg_11_0.selectedItem or arg_11_0.settings.itemList[1]

	return arg_11_0.selectedItem
end

function var_0_0.UpdateContent(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.skinName
	local var_12_1 = arg_12_1.price

	if arg_12_0.prevSelected then
		local var_12_2 = arg_12_0.prevSelected.discount
		local var_12_3 = math.max(0, var_12_1 - var_12_2)

		arg_12_0.label1.text = i18n(var_12_3 > 0 and "skin_purchase_confirm" or "skin_purchase_over_price", arg_12_0.prevSelected.drop:getName(), var_12_3, var_12_0)
	else
		arg_12_0.label1.text = i18n("charge_scene_buy_confirm", var_12_1, var_12_0)
	end

	arg_12_0:UpdateLink()
	arg_12_0:SetTipText(arg_12_1.skinId)
end

function var_0_0.UpdateLink(arg_13_0)
	arg_13_0.linkText.text = i18n("skin_shop_discount_item_link", arg_13_0:GetDefaultItem().discount)
end

function var_0_0.UpdateItem(arg_14_0, arg_14_1)
	arg_14_0.itemTrs = {}

	local var_14_0 = arg_14_1.itemList

	UIItemList.StaticAlign(arg_14_0._tf:Find("window/frame/scrollrect/list"), arg_14_0._tf:Find("window/frame/left"), #var_14_0, function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			arg_14_0:FlushItem(var_14_0[arg_15_1 + 1], arg_15_2)
		end
	end)
end

function var_0_0.FlushItem(arg_16_0, arg_16_1, arg_16_2)
	updateDrop(arg_16_2, arg_16_1.drop)
	setText(arg_16_2:Find("name_bg/Text"), arg_16_1.drop:getName())
	onToggle(arg_16_0, arg_16_2, function(arg_17_0)
		if arg_17_0 then
			arg_16_0.selectedItem = arg_16_1
		end
	end, SFX_PANEL)

	arg_16_0.itemTrs[arg_16_1] = arg_16_2
end

function var_0_0.ClearPrevSel(arg_18_0)
	arg_18_0.prevSelected = nil
end

function var_0_0.Show(arg_19_0, arg_19_1)
	setActive(arg_19_0._tf, true)

	arg_19_0.settings = arg_19_1

	arg_19_0:UpdateItem(arg_19_1)
	arg_19_0:RegisterBtn(arg_19_1)
	arg_19_0:UpdateContent(arg_19_1)
	arg_19_0:UpdateStyle(var_0_1)
	setActive(arg_19_0.nonUseBtn, false)
	triggerToggle(arg_19_0.useBtn, true)
end

function var_0_0.UpdateStyle(arg_20_0, arg_20_1)
	setActive(arg_20_0.label1, arg_20_1 == var_0_1)
	setActive(arg_20_0.optionTr, arg_20_1 == var_0_1)
	setActive(arg_20_0.realPriceBtn, arg_20_1 == var_0_1 and not arg_20_0.prevSelected)
	setActive(arg_20_0.discountPriceBtn, arg_20_1 == var_0_1 and arg_20_0.prevSelected)
	setActive(arg_20_0.confirmBtn, arg_20_1 == var_0_2)
	setActive(arg_20_0.scrollrect, arg_20_1 == var_0_2)

	local var_20_0 = arg_20_0:GetDefaultItem()

	triggerToggle(arg_20_0.itemTrs[var_20_0], true)

	arg_20_0.style = arg_20_1
end

function var_0_0.Hide(arg_21_0)
	arg_21_0.settings = nil
	arg_21_0.selectedItem = nil

	setActive(arg_21_0._tf, false)
	arg_21_0:ClearPrevSel()

	for iter_21_0, iter_21_1 in pairs(arg_21_0.itemTrs) do
		removeOnToggle(iter_21_1)
		triggerToggle(iter_21_1, false)
	end
end

function var_0_0.SetTipText(arg_22_0, arg_22_1)
	local var_22_0 = pg.ship_skin_template[arg_22_1].ship_group
	local var_22_1 = pg.gameset.no_share_skin_tip.description
	local var_22_2
	local var_22_3

	for iter_22_0, iter_22_1 in ipairs(var_22_1) do
		for iter_22_2, iter_22_3 in ipairs(iter_22_1) do
			if var_22_0 == iter_22_3[1] then
				var_22_2 = iter_22_1
				var_22_3 = iter_22_2

				break
			end
		end
	end

	setActive(arg_22_0.tipBar, var_22_3)

	if var_22_3 then
		local var_22_4 = ""

		for iter_22_4, iter_22_5 in ipairs(var_22_2) do
			if iter_22_4 ~= var_22_3 then
				if var_22_4 == "" then
					var_22_4 = i18n(iter_22_5[2])
				else
					var_22_4 = var_22_4 .. "、" .. i18n(iter_22_5[2])
				end
			end
		end

		setText(arg_22_0.tipText, i18n("no_share_skin_gametip", i18n(var_22_2[var_22_3][2]), var_22_4))
	end
end

return var_0_0
