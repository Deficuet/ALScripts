local var_0_0 = class("MedalGoodsCard", import(".BaseGoodsCard"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.groupMark = arg_1_0.tf:Find("group_locked")
	arg_1_0.limitCountLabelTF = findTF(arg_1_0.tf, "count_contain/label"):GetComponent(typeof(Text))
end

function var_0_0.update(arg_2_0, arg_2_1)
	if arg_2_0.goods ~= arg_2_1 then
		arg_2_0.goods = arg_2_1

		arg_2_0:Init()
	else
		arg_2_0.goods = arg_2_1
	end

	arg_2_0.limitCountLabelTF.text = i18n("activity_shop_exchange_count") .. arg_2_0.goods.count .. "/" .. arg_2_0.goods:GetLimit()

	local var_2_0 = arg_2_0.goods:CanPurchase()

	setActive(arg_2_0.mask, not var_2_0)
	setActive(arg_2_0.selloutTag, not var_2_0)
end

function var_0_0.Init(arg_3_0)
	local var_3_0 = arg_3_0.goods:getConfig("goods_name")
	local var_3_1 = arg_3_0.goods:GetDropInfo()

	updateDrop(arg_3_0.itemTF, var_3_1)
	setScrollText(arg_3_0.nameTxt, var_3_0)
	setText(arg_3_0.countTF, arg_3_0.goods:getConfig("price"))
	GetImageSpriteFromAtlasAsync("props/medal", "", arg_3_0.resIconTF)
	GetImageSpriteFromAtlasAsync(arg_3_0.goods:getConfig("goods_icon"), "", arg_3_0.itemIconTF)

	local var_3_2 = arg_3_0.goods:getConfig("is_ship")
	local var_3_3 = arg_3_0.goods:getConfig("goods")

	if arg_3_0.groupMark and var_3_2 == 1 and #var_3_3 == 1 then
		local var_3_4 = var_3_3[1]
		local var_3_5 = pg.ship_data_template[var_3_4].group_type

		if var_3_5 and var_3_5 > 0 then
			setActive(arg_3_0.groupMark, not getProxy(CollectionProxy):getShipGroup(var_3_5))
		else
			setActive(arg_3_0.groupMark, false)
		end
	else
		setActive(arg_3_0.groupMark, false)
	end
end

function var_0_0.OnDispose(arg_4_0)
	arg_4_0.goods = nil
end

return var_0_0
