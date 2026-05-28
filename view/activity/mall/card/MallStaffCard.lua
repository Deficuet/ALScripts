local var_0_0 = class("MallStaffCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.iconTF = arg_1_0._tf:Find("icon")
	arg_1_0.nameText = arg_1_0._tf:Find("name"):GetComponent(typeof(Text))
	arg_1_0.selTF = arg_1_0._tf:Find("sel")
	arg_1_0.orderTF = arg_1_0._tf:Find("mask/order")

	setText(arg_1_0.orderTF:Find("Text"), i18n("mall_staff_in_order"))

	arg_1_0.floorTF = arg_1_0._tf:Find("mask/floor")
	arg_1_0.attrTextTFs = {
		arg_1_0._tf:Find("attrs/1/Text"),
		arg_1_0._tf:Find("attrs/2/Text"),
		arg_1_0._tf:Find("attrs/3/Text")
	}
	arg_1_0.attrBgTFs = {
		arg_1_0._tf:Find("attrs/1"),
		arg_1_0._tf:Find("attrs/2"),
		arg_1_0._tf:Find("attrs/3")
	}
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.staff = arg_2_1
	arg_2_0.id = arg_2_0.staff.id
	arg_2_0.tid = arg_2_0.staff.tid

	local var_2_0 = pg.item_virtual_data_statistics[arg_2_0.tid].name

	arg_2_0.nameText.text = var_2_0

	var_0_0.StaticUpdateIcon(arg_2_0.iconTF, arg_2_0.tid)

	arg_2_0.attrList = arg_2_0.staff:GetAttrList()

	local var_2_1

	var_2_1 = arg_2_4 or {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.attrList) do
		setText(arg_2_0.attrTextTFs[iter_2_0], iter_2_1)

		if table.contains(arg_2_4, iter_2_0) then
			GetImageSpriteFromAtlasAsync("ui/mallstafftpl_atlas", "attr_bg2", arg_2_0.attrBgTFs[iter_2_0], true)
		else
			GetImageSpriteFromAtlasAsync("ui/mallstafftpl_atlas", "attr_bg1", arg_2_0.attrBgTFs[iter_2_0], true)
		end
	end

	local var_2_2 = table.indexof(arg_2_2, arg_2_0.id)

	setActive(arg_2_0.selTF, var_2_2)

	if var_2_2 then
		setText(arg_2_0.selTF:Find("Text"), var_2_2)
	end

	local var_2_3, var_2_4 = arg_2_0.staff:GetStatusInfos()

	setActive(arg_2_0.orderTF, var_2_3 == MallStaff.STATUS.ORDER)
	setActive(arg_2_0.floorTF, var_2_3 == MallStaff.STATUS.FLOOR and (arg_2_3 and not var_2_2 or not arg_2_3))

	if var_2_3 == MallStaff.STATUS.FLOOR then
		setText(arg_2_0.floorTF:Find("Text"), i18n("mall_staff_in_floor", var_2_4.floorId))
	end
end

function var_0_0.Dispose(arg_3_0)
	return
end

function var_0_0.StaticUpdateIcon(arg_4_0, arg_4_1)
	local var_4_0 = pg.activity_mall_staff_template[arg_4_1].icon_show

	GetImageSpriteFromAtlasAsync("ui/mallstafftpl_atlas", var_4_0[1], arg_4_0:Find("body"))
	GetImageSpriteFromAtlasAsync("ui/mallstafftpl_atlas", var_4_0[2], arg_4_0:Find("clothes"))
	GetImageSpriteFromAtlasAsync("ui/mallstafftpl_atlas", var_4_0[3], arg_4_0:Find("face"))
end

return var_0_0
