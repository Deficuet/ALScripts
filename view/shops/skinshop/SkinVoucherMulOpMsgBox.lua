local var_0_0 = class("SkinVoucherMulOpMsgBox", import(".SkinVoucherMsgBox"))
local var_0_1 = SkinVoucherMsgBox.OPTION_TYPE_COMMOM_ITEM
local var_0_2 = SkinVoucherMsgBox.OPTION_TYPE_MESH_IMAGE

function var_0_0.getUIName(arg_1_0)
	return "SkinVoucherMulOpMsgBoxUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	local var_2_0 = arg_2_0.optionTr:Find("meshImage_discount")

	arg_2_0.options = {
		[var_0_1] = {
			toggle = arg_2_0.useBtn,
			link = arg_2_0.switchBtn,
			text = arg_2_0.linkText,
			gemIcon = arg_2_0.gemIcon
		},
		[var_0_2] = {
			toggle = var_2_0,
			link = var_2_0:Find("link"),
			text = var_2_0:Find("link/Text"):GetComponent(typeof(Text)),
			gemIcon = var_2_0:Find("link/line_1")
		}
	}
end

function var_0_0.GetDisplayListAndOptionType(arg_3_0, arg_3_1)
	arg_3_0.optionItemLists = {
		[var_0_1] = arg_3_1.itemList,
		[var_0_2] = arg_3_1.meshImageItemList
	}
	arg_3_0.optionSelectedItemIds = {}
	arg_3_0.selectedItemId = nil
	arg_3_0.optionType = nil

	local var_3_0 = #arg_3_1.itemList > 0 and var_0_1 or var_0_2

	assert(#arg_3_0.optionItemLists[var_3_0] > 0, "no item or mesh image to display")
	arg_3_0:SetOptionType(var_3_0)

	return arg_3_0.optionItemLists[var_3_0], var_3_0
end

function var_0_0.SetOptionType(arg_4_0, arg_4_1)
	if arg_4_0.optionType then
		arg_4_0.optionSelectedItemIds[arg_4_0.optionType] = arg_4_0.selectedItemId
	end

	arg_4_0.optionType = arg_4_1
	arg_4_0.displays = arg_4_0.optionItemLists[arg_4_1]
	arg_4_0.selectedItemId = arg_4_0.optionSelectedItemIds[arg_4_1]

	local var_4_0 = arg_4_0.options[arg_4_1]

	arg_4_0.useBtn = var_4_0.toggle
	arg_4_0.switchBtn = var_4_0.link
	arg_4_0.linkText = var_4_0.text
	arg_4_0.gemIcon = var_4_0.gemIcon
end

function var_0_0.SelectOption(arg_5_0, arg_5_1)
	arg_5_0:SetOptionType(arg_5_1)
	arg_5_0:UpdateItem(arg_5_0.settings)

	arg_5_0.prevSelId = arg_5_0:GetDefaultItem()

	arg_5_0:UpdateContent(arg_5_0.settings)
	arg_5_0:UpdateStyle(arg_5_0.style)
end

function var_0_0.RegisterBtn(arg_6_0, arg_6_1)
	var_0_0.super.RegisterBtn(arg_6_0, arg_6_1)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.options) do
		onToggle(arg_6_0, iter_6_1.toggle, function(arg_7_0)
			if arg_7_0 then
				arg_6_0:SelectOption(iter_6_0)
			end
		end, SFX_PANEL)
		onButton(arg_6_0, iter_6_1.link, function()
			triggerToggle(iter_6_1.toggle, true)
			arg_6_0:UpdateStyle(1)
		end, SFX_PANEL)
	end

	onButton(arg_6_0, arg_6_0.confirmBtn, function()
		arg_6_0.prevSelId = arg_6_0:GetDefaultItem()

		arg_6_0:UpdateContent(arg_6_0.settings)
		arg_6_0:UpdateStyle(0)
		triggerToggle(arg_6_0.useBtn, true)
	end, SFX_PANEL)
end

function var_0_0.UpdateItem(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.itemTrs or {}) do
		removeOnToggle(iter_10_1)
		triggerToggle(iter_10_1, false)
	end

	var_0_0.super.UpdateItem(arg_10_0, arg_10_1)
end

function var_0_0.UpdateOptionName(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.options[var_0_1]
	local var_11_1 = arg_11_0.options[var_0_2]

	setActive(var_11_0.toggle, #arg_11_1.itemList > 0)
	setActive(var_11_1.toggle, #arg_11_1.meshImageItemList > 0)
	setText(var_11_0.toggle:Find("Text"), i18n("skin_shop_use_label"))
	setText(var_11_1.toggle:Find("Text"), i18n("exchange_op"))

	var_11_1.text.text = i18n("exchange_op1")

	setActive(var_11_1.gemIcon, false)
end

function var_0_0.Show(arg_12_0, arg_12_1)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.options) do
		removeOnToggle(iter_12_1.toggle)
		triggerToggle(iter_12_1.toggle, false)
	end

	removeOnToggle(arg_12_0.nonUseBtn)
	triggerToggle(arg_12_0.nonUseBtn, false)

	arg_12_0.prevSelId = nil

	var_0_0.super.Show(arg_12_0, arg_12_1)
end

return var_0_0
