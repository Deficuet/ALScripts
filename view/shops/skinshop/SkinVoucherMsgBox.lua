local var_0_0 = class("SkinVoucherMsgBox", import(".SkinCouponMsgBox"))
local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 1
local var_0_4 = 2

var_0_0.OPTION_TYPE_COMMOM_ITEM = var_0_3
var_0_0.OPTION_TYPE_MESH_IMAGE = var_0_4

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
	arg_2_0.gemIcon = arg_2_0._tf:Find("window/frame/option/use/link/line_1")

	setText(arg_2_0._tf:Find("window/frame/option/nonuse/Text"), i18n("skin_shop_nonuse_label"))
end

function var_0_0.RegisterBtn(arg_3_0, arg_3_1)
	onButton(arg_3_0, arg_3_0.discountPriceBtn, function()
		if not arg_3_0.prevSelId then
			return
		end

		if arg_3_1.onYes then
			arg_3_1.onYes(arg_3_0.prevSelId)
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
			arg_3_0.prevSelId = nil

			arg_3_0:UpdateContent(arg_3_0.settings)
			arg_3_0:UpdateStyle(arg_3_0.style)
		end
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.useBtn, function(arg_10_0)
		if arg_10_0 then
			arg_3_0.prevSelId = arg_3_0:GetDefaultItem()

			arg_3_0:UpdateContent(arg_3_0.settings)
			arg_3_0:UpdateStyle(arg_3_0.style)
		end
	end, SFX_PANEL)
end

function var_0_0.GetDisplayListAndOptionType(arg_11_0, arg_11_1)
	local var_11_0 = {}
	local var_11_1 = arg_11_1.itemList
	local var_11_2 = arg_11_1.meshImageItemList

	if #var_11_1 > 0 and #var_11_2 > 0 then
		assert(false, "use SkinVoucherMulOpMsgBox if you want to show both item and mesh image options")
	elseif #var_11_1 <= 0 and #var_11_2 <= 0 then
		assert(false, "no item or mesh image to display")
	end

	local var_11_3

	if #var_11_1 <= 0 then
		var_11_0 = var_11_2
		var_11_3 = var_0_4
	elseif #var_11_2 <= 0 then
		var_11_0 = var_11_1
		var_11_3 = var_0_3
	end

	return var_11_0, var_11_3
end

function var_0_0.GetDefaultItem(arg_12_0)
	local function var_12_0()
		local var_13_0 = _.map(arg_12_0.displays, function(arg_14_0)
			local var_14_0 = arg_12_0:GetDiscount(arg_14_0, arg_12_0.settings.price)

			return {
				gem = var_14_0,
				id = arg_14_0,
				time = pg.item_data_statistics[arg_14_0].time_limit
			}
		end)

		if #var_13_0 == 0 then
			return nil
		end

		table.sort(var_13_0, function(arg_15_0, arg_15_1)
			if arg_15_0.time ~= arg_15_1.time then
				return arg_15_0.time > arg_15_1.time
			else
				return arg_15_0.gem > arg_15_1.gem
			end
		end)

		return var_13_0[1].id
	end

	arg_12_0.selectedItemId = arg_12_0.selectedItemId or var_12_0()

	return arg_12_0.selectedItemId
end

function var_0_0.UpdateContent(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.skinName
	local var_16_1 = arg_16_1.price

	if arg_16_0.prevSelId then
		local var_16_2 = pg.item_data_statistics[arg_16_0.prevSelId]
		local var_16_3 = arg_16_0:GetDiscount(arg_16_0.prevSelId, var_16_1)
		local var_16_4 = math.max(0, var_16_1 - var_16_3)

		arg_16_0.label1.text = i18n(var_16_4 > 0 and "skin_purchase_confirm" or "skin_purchase_over_price", var_16_2.name, var_16_4, var_16_0)
	else
		arg_16_0.label1.text = i18n("charge_scene_buy_confirm", var_16_1, var_16_0)
	end

	arg_16_0:UpdateLink()
	arg_16_0:SetTipText(arg_16_1.skinId)
end

function var_0_0.UpdateLink(arg_17_0)
	setActive(arg_17_0.gemIcon, arg_17_0.optionType == var_0_3)

	if arg_17_0.optionType == var_0_4 then
		arg_17_0.linkText.text = i18n("exchange_op1")
	elseif arg_17_0.optionType == var_0_3 then
		local var_17_0 = arg_17_0:GetDefaultItem()
		local var_17_1 = arg_17_0:GetDiscount(var_17_0, arg_17_0.settings.price)

		arg_17_0.linkText.text = i18n("skin_shop_discount_item_link", var_17_1)
	end
end

function var_0_0.GetDiscount(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = Item.New({
		id = arg_18_1
	})

	if var_18_0:IsMeshImageSkinExchangeType() then
		return arg_18_2 or 0
	else
		return var_18_0:getConfig("usage_arg")[2] or 0
	end
end

function var_0_0.UpdateItem(arg_19_0, arg_19_1)
	arg_19_0.itemTrs = {}

	local var_19_0 = arg_19_0.displays

	UIItemList.StaticAlign(arg_19_0._tf:Find("window/frame/scrollrect/list"), arg_19_0._tf:Find("window/frame/left"), #var_19_0, function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			arg_19_0:FlushItem(var_19_0[arg_20_1 + 1], arg_20_2)
		end
	end)
end

function var_0_0.FlushItem(arg_21_0, arg_21_1, arg_21_2)
	updateDrop(arg_21_2, {
		count = 1,
		type = DROP_TYPE_ITEM,
		id = arg_21_1
	})

	local var_21_0 = pg.item_data_statistics[arg_21_1].name

	setText(arg_21_2:Find("name_bg/Text"), var_21_0)
	onToggle(arg_21_0, arg_21_2, function(arg_22_0)
		if arg_22_0 then
			arg_21_0.selectedItemId = arg_21_1
		end
	end, SFX_PANEL)

	arg_21_0.itemTrs[arg_21_1] = arg_21_2
end

function var_0_0.ClearPrevSel(arg_23_0)
	arg_23_0.prevSelId = nil
end

function var_0_0.Show(arg_24_0, arg_24_1)
	pg.UIMgr.GetInstance():OverlayPanel(arg_24_0._tf)
	setActive(arg_24_0._tf, true)

	arg_24_0.settings = arg_24_1
	arg_24_0.displays, arg_24_0.optionType = arg_24_0:GetDisplayListAndOptionType(arg_24_1)

	arg_24_0:UpdateItem(arg_24_1)
	arg_24_0:RegisterBtn(arg_24_1)
	arg_24_0:UpdateContent(arg_24_1)
	arg_24_0:UpdateStyle(var_0_1)
	arg_24_0:UpdateOptionName(arg_24_1)
	triggerToggle(arg_24_0.useBtn, true)
end

function var_0_0.UpdateOptionName(arg_25_0, arg_25_1)
	if arg_25_0.optionType == var_0_4 then
		setText(arg_25_0._tf:Find("window/frame/option/use/Text"), i18n("exchange_op"))
	elseif arg_25_0.optionType == var_0_3 then
		setText(arg_25_0._tf:Find("window/frame/option/use/Text"), i18n("skin_shop_use_label"))
	end
end

function var_0_0.UpdateStyle(arg_26_0, arg_26_1)
	setActive(arg_26_0.label1, arg_26_1 == var_0_1)
	setActive(arg_26_0.optionTr, arg_26_1 == var_0_1)
	setActive(arg_26_0.realPriceBtn, arg_26_1 == var_0_1 and not arg_26_0.prevSelId)
	setActive(arg_26_0.discountPriceBtn, arg_26_1 == var_0_1 and arg_26_0.prevSelId)
	setActive(arg_26_0.confirmBtn, arg_26_1 == var_0_2)
	setActive(arg_26_0.scrollrect, arg_26_1 == var_0_2)

	local var_26_0 = arg_26_0:GetDefaultItem()

	triggerToggle(arg_26_0.itemTrs[var_26_0], true)

	arg_26_0.style = arg_26_1
end

function var_0_0.Hide(arg_27_0)
	arg_27_0.settings = nil
	arg_27_0.selectedItemId = nil

	setActive(arg_27_0._tf, false)
	arg_27_0:ClearPrevSel()

	for iter_27_0, iter_27_1 in pairs(arg_27_0.itemTrs) do
		removeOnToggle(iter_27_1)
		triggerToggle(iter_27_1, false)
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_27_0._tf)
end

function var_0_0.SetTipText(arg_28_0, arg_28_1)
	local var_28_0 = pg.ship_skin_template[arg_28_1].ship_group
	local var_28_1 = pg.gameset.no_share_skin_tip.description
	local var_28_2
	local var_28_3

	for iter_28_0, iter_28_1 in ipairs(var_28_1) do
		for iter_28_2, iter_28_3 in ipairs(iter_28_1) do
			if var_28_0 == iter_28_3[1] then
				var_28_2 = iter_28_1
				var_28_3 = iter_28_2

				break
			end
		end
	end

	setActive(arg_28_0.tipBar, var_28_3)

	if var_28_3 then
		local var_28_4 = ""

		for iter_28_4, iter_28_5 in ipairs(var_28_2) do
			if iter_28_4 ~= var_28_3 then
				if var_28_4 == "" then
					var_28_4 = i18n(iter_28_5[2])
				else
					var_28_4 = var_28_4 .. "、" .. i18n(iter_28_5[2])
				end
			end
		end

		setText(arg_28_0.tipText, i18n("no_share_skin_gametip", i18n(var_28_2[var_28_3][2]), var_28_4))
	end
end

function var_0_0.OnDestroy(arg_29_0)
	arg_29_0.super:OnDestroy()

	if arg_29_0:isShowing() then
		arg_29_0:Hide()
	end
end

return var_0_0
