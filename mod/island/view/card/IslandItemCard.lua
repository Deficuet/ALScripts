local var_0_0 = class("IslandItemCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.nameTxt = arg_1_0._tf:Find("name_bg/name"):GetComponent(typeof(Text))
	arg_1_0.cntTxt = arg_1_0._tf:Find("icon_bg/count_bg/count"):GetComponent(typeof(Text))
	arg_1_0.calcPanel = arg_1_0._tf:Find("calc")
	arg_1_0.valueInput = arg_1_0.calcPanel:Find("InputField")
	arg_1_0.mask = arg_1_0._tf:Find("mask")
	arg_1_0.maskTxt = arg_1_0.mask:Find("Text"):GetComponent(typeof(Text))
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.item = arg_2_1
	arg_2_0.nameTxt.text = arg_2_1:GetName()

	updateCustomDrop(arg_2_0._tf, Drop.New({
		type = DROP_TYPE_ISLAND_ITEM,
		id = arg_2_1.id,
		count = arg_2_1:GetCount()
	}))

	local var_2_0 = arg_2_2 == IslandInventoryPage.MODE_EDIT

	setActive(arg_2_0.calcPanel, var_2_0)

	if var_2_0 then
		arg_2_0:UpdateValue(arg_2_3)
	end

	arg_2_0:UpdateTip(arg_2_1, arg_2_4)
end

function var_0_0.UpdateTip(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_2 ~= IslandInventoryPage.INVENTORY_TYPE_OVERFLOW then
		setActive(arg_3_0.mask, false)

		return
	end

	setActive(arg_3_0.mask, true)

	local var_3_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	arg_3_0.maskTxt.text = var_3_0:OwnItem() and i18n("island_item_overflow", arg_3_1:GetCount()) or i18n("island_item_no_capacity")
end

function var_0_0.UpdateValue(arg_4_0, arg_4_1)
	setActive(arg_4_0.calcPanel, arg_4_1 > 0)
	setInputText(arg_4_0.valueInput, arg_4_1)
end

function var_0_0.Dispose(arg_5_0)
	return
end

return var_0_0
