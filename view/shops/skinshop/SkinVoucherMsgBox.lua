local var_0_0 = class("SkinVoucherMsgBox", import(".SkinCouponMsgBox"))
local var_0_1 = 0
local var_0_2 = 1

function var_0_0.getUIName(arg_1_0)
	return "SkinVoucherMsgBoxUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)
	setActive(arg_2_0.confirmBtn, false)

	arg_2_0.realPriceBtn = arg_2_0:findTF("window/button_container/real_price")
	arg_2_0.discountPriceBtn = arg_2_0:findTF("window/button_container/discount_price")

	setText(arg_2_0._tf:Find("window/top/bg/infomation/title"), i18n("title_info"))

	arg_2_0.nonUseBtn = arg_2_0:findTF("window/frame/option/nonuse")
	arg_2_0.useBtn = arg_2_0:findTF("window/frame/option/use")
	arg_2_0.scrollrect = arg_2_0:findTF("window/frame/scrollrect")
	arg_2_0.optionTr = arg_2_0:findTF("window/frame/option")
	arg_2_0.switchBtn = arg_2_0:findTF("window/frame/option/use/link")
	arg_2_0.tipBar = arg_2_0:findTF("window/frame/tipBar")
	arg_2_0.tipText = arg_2_0:findTF("Text", arg_2_0.tipBar)
	arg_2_0.linkText = arg_2_0:findTF("window/frame/option/use/link/Text"):GetComponent(typeof(Text))

	setText(arg_2_0:findTF("window/frame/option/nonuse/Text"), i18n("skin_shop_nonuse_label"))
	setText(arg_2_0:findTF("window/frame/option/use/Text"), i18n("skin_shop_use_label"))
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

function var_0_0.GetDefaultItem(arg_11_0)
	local function var_11_0()
		local var_12_0 = _.map(arg_11_0.settings.itemList, function(arg_13_0)
			local var_13_0 = pg.item_data_statistics[arg_13_0].usage_arg[2] or 0

			return {
				gem = var_13_0,
				id = arg_13_0,
				time = pg.item_data_statistics[arg_13_0].time_limit
			}
		end)

		if #var_12_0 == 0 then
			return nil
		end

		table.sort(var_12_0, function(arg_14_0, arg_14_1)
			if arg_14_0.time ~= arg_14_1.time then
				return arg_14_0.time > arg_14_1.time
			else
				return arg_14_0.gem > arg_14_1.gem
			end
		end)

		return var_12_0[1].id
	end

	arg_11_0.selectedItemId = arg_11_0.selectedItemId or var_11_0()

	return arg_11_0.selectedItemId
end

function var_0_0.UpdateContent(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.skinName
	local var_15_1 = arg_15_1.price

	if arg_15_0.prevSelId then
		local var_15_2 = pg.item_data_statistics[arg_15_0.prevSelId]
		local var_15_3 = var_15_2.usage_arg[2]
		local var_15_4 = math.max(0, var_15_1 - var_15_3)

		arg_15_0.label1.text = i18n(var_15_4 > 0 and "skin_purchase_confirm" or "skin_purchase_over_price", var_15_2.name, var_15_4, var_15_0)
	else
		arg_15_0.label1.text = i18n("charge_scene_buy_confirm", var_15_1, var_15_0)
	end

	arg_15_0:UpdateLink()
	arg_15_0:SetTipText(arg_15_1.skinId)
end

function var_0_0.UpdateLink(arg_16_0)
	local var_16_0 = arg_16_0:GetDefaultItem()
	local var_16_1 = pg.item_data_statistics[var_16_0].usage_arg[2] or 0

	arg_16_0.linkText.text = i18n("skin_shop_discount_item_link", var_16_1)
end

function var_0_0.UpdateItem(arg_17_0, arg_17_1)
	arg_17_0.itemTrs = {}

	local var_17_0 = arg_17_1.itemList

	UIItemList.StaticAlign(arg_17_0:findTF("window/frame/scrollrect/list"), arg_17_0:findTF("window/frame/left"), #var_17_0, function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			arg_17_0:FlushItem(var_17_0[arg_18_1 + 1], arg_18_2)
		end
	end)
end

function var_0_0.FlushItem(arg_19_0, arg_19_1, arg_19_2)
	updateDrop(arg_19_2, {
		count = 1,
		type = DROP_TYPE_ITEM,
		id = arg_19_1
	})

	local var_19_0 = pg.item_data_statistics[arg_19_1].name

	setText(arg_19_2:Find("name_bg/Text"), var_19_0)
	onToggle(arg_19_0, arg_19_2, function(arg_20_0)
		if arg_20_0 then
			arg_19_0.selectedItemId = arg_19_1
		end
	end, SFX_PANEL)

	arg_19_0.itemTrs[arg_19_1] = arg_19_2
end

function var_0_0.ClearPrevSel(arg_21_0)
	arg_21_0.prevSelId = nil
end

function var_0_0.Show(arg_22_0, arg_22_1)
	setActive(arg_22_0._tf, true)

	arg_22_0.settings = arg_22_1

	arg_22_0:UpdateItem(arg_22_1)
	arg_22_0:RegisterBtn(arg_22_1)
	arg_22_0:UpdateContent(arg_22_1)
	arg_22_0:UpdateStyle(var_0_1)
	triggerToggle(arg_22_0.useBtn, true)
end

function var_0_0.UpdateStyle(arg_23_0, arg_23_1)
	setActive(arg_23_0.label1, arg_23_1 == var_0_1)
	setActive(arg_23_0.optionTr, arg_23_1 == var_0_1)
	setActive(arg_23_0.realPriceBtn, arg_23_1 == var_0_1 and not arg_23_0.prevSelId)
	setActive(arg_23_0.discountPriceBtn, arg_23_1 == var_0_1 and arg_23_0.prevSelId)
	setActive(arg_23_0.confirmBtn, arg_23_1 == var_0_2)
	setActive(arg_23_0.scrollrect, arg_23_1 == var_0_2)

	local var_23_0 = arg_23_0:GetDefaultItem()

	triggerToggle(arg_23_0.itemTrs[var_23_0], true)

	arg_23_0.style = arg_23_1
end

function var_0_0.Hide(arg_24_0)
	arg_24_0.settings = nil
	arg_24_0.selectedItemId = nil

	setActive(arg_24_0._tf, false)
	arg_24_0:ClearPrevSel()

	for iter_24_0, iter_24_1 in pairs(arg_24_0.itemTrs) do
		removeOnToggle(iter_24_1)
		triggerToggle(iter_24_1, false)
	end
end

function var_0_0.SetTipText(arg_25_0, arg_25_1)
	local var_25_0 = pg.ship_skin_template[arg_25_1].ship_group
	local var_25_1 = pg.gameset.no_share_skin_tip.description
	local var_25_2
	local var_25_3

	for iter_25_0, iter_25_1 in ipairs(var_25_1) do
		for iter_25_2, iter_25_3 in ipairs(iter_25_1) do
			if var_25_0 == iter_25_3[1] then
				var_25_2 = iter_25_1
				var_25_3 = iter_25_2

				break
			end
		end
	end

	setActive(arg_25_0.tipBar, var_25_3)

	if var_25_3 then
		local var_25_4 = ""

		for iter_25_4, iter_25_5 in ipairs(var_25_2) do
			if iter_25_4 ~= var_25_3 then
				if var_25_4 == "" then
					var_25_4 = i18n(iter_25_5[2])
				else
					var_25_4 = var_25_4 .. "、" .. i18n(iter_25_5[2])
				end
			end
		end

		setText(arg_25_0.tipText, i18n("no_share_skin_gametip", i18n(var_25_2[var_25_3][2]), var_25_4))
	end
end

return var_0_0
