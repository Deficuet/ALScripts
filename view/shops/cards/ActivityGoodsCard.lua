local var_0_0 = class("ActivityGoodsCard", import(".BaseGoodsCard"))

var_0_0.Color = {}
var_0_0.DefaultColor = {
	0.8745098039215686,
	0.9294117647058824,
	1
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.go = arg_1_1
	arg_1_0.tr = tf(arg_1_1)
	arg_1_0.itemTF = findTF(arg_1_0.tr, "item")
	arg_1_0.nameTxt = findTF(arg_1_0.tr, "item/name_mask/name")
	arg_1_0.resIconTF = findTF(arg_1_0.tr, "item/consume/contain/icon"):GetComponent(typeof(Image))
	arg_1_0.mask = arg_1_0.tr:Find("mask")
	arg_1_0.selloutTag = arg_1_0.tr:Find("mask/tag/sellout_tag")
	arg_1_0.sellEndTag = arg_1_0.tr:Find("mask/tag/sellend_tag")

	setActive(arg_1_0.sellEndTag, false)

	arg_1_0.unexchangeTag = arg_1_0.tr:Find("mask/tag/unexchange_tag")
	arg_1_0.countTF = findTF(arg_1_0.tr, "item/consume/contain/Text"):GetComponent(typeof(Text))
	arg_1_0.discountTF = findTF(arg_1_0.tr, "item/discount")

	setActive(arg_1_0.discountTF, false)

	arg_1_0.limitTimeSellTF = findTF(arg_1_0.tr, "item/limit_time_sell")

	setActive(arg_1_0.limitTimeSellTF, false)

	arg_1_0.limitCountTF = findTF(arg_1_0.tr, "item/count_contain/count"):GetComponent(typeof(Text))
	arg_1_0.limitCountLabelTF = findTF(arg_1_0.tr, "item/count_contain/label"):GetComponent(typeof(Text))
	arg_1_0.limitCountLabelTF.text = i18n("activity_shop_exchange_count")
	arg_1_0.tagImg = arg_1_0.tr:Find("mask/tag"):GetComponent(typeof(Image))
	arg_1_0.limitPassTag = arg_1_0.tr:Find("mask/tag/pass_tag")
end

function var_0_0.update(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	if arg_2_1:Selectable() then
		arg_2_0:updateSelectable(arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	else
		arg_2_0:updateSingle(arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	end
end

function var_0_0.updateSingle(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_0.goodsVO = arg_3_1

	local var_3_0 = arg_3_0.goodsVO:CheckCntLimit()
	local var_3_1 = var_3_0 and not arg_3_0.goodsVO:CheckArgLimit()
	local var_3_2 = false

	setActive(arg_3_0.mask, not var_3_0 or var_3_1)
	setActive(arg_3_0.selloutTag, false)

	if arg_3_0.limitPassTag then
		setActive(arg_3_0.limitPassTag, false)
	end

	removeOnButton(arg_3_0.mask)

	if var_3_1 then
		local var_3_3, var_3_4, var_3_5 = arg_3_0.goodsVO:CheckArgLimit()

		if var_3_4 == "pass" then
			setActive(arg_3_0.limitPassTag, true)
			setText(findTF(arg_3_0.limitPassTag, "Text"), i18n("eventshop_unlock_info", var_3_5))
			onButton(arg_3_0, arg_3_0.mask, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("eventshop_unlock_hint", var_3_5))
			end, SFX_PANEL)
		else
			setText(arg_3_0.unexchangeTag, var_3_5)

			local var_3_6 = ""
			local var_3_7 = var_3_4 == ShopArgs.LIMIT_ARGS_SALE_START_TIME and "LOCK" or "LIMIT"

			setText(arg_3_0.unexchangeTag:Find("sellout_tag_en"), var_3_7)

			var_3_2 = true
		end
	end

	if not var_3_0 then
		setActive(arg_3_0.selloutTag, true)
	elseif var_3_2 then
		setActive(arg_3_0.unexchangeTag, true)
	end

	local var_3_8 = Drop.New({
		type = arg_3_1:getConfig("commodity_type"),
		id = arg_3_1:getConfig("commodity_id"),
		count = arg_3_1:getConfig("num")
	})

	updateDrop(arg_3_0.itemTF, var_3_8)
	setActive(arg_3_0.limitTimeSellTF, false)

	if var_3_0 then
		local var_3_9, var_3_10, var_3_11 = arg_3_0.goodsVO:CheckTimeLimit()

		setActive(arg_3_0.limitTimeSellTF, var_3_9 and var_3_10)

		if var_3_9 and not var_3_10 then
			setActive(arg_3_0.mask, true)
			setActive(arg_3_0.sellEndTag, true)
			removeOnButton(arg_3_0.mask)
			onButton(arg_3_0, arg_3_0.mask, function()
				if var_3_11 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("tip_build_ticket_exchange_expired", var_3_8:getName()))
				end
			end, SFX_PANEL)
		end
	end

	GetSpriteFromAtlasAsync(Drop.New({
		type = arg_3_1:getConfig("resource_category"),
		id = arg_3_1:getConfig("resource_type")
	}):getIcon(), "", function(arg_6_0)
		arg_3_0.resIconTF.sprite = arg_6_0
	end)

	arg_3_0.countTF.text = arg_3_1:getConfig("resource_num")

	local var_3_12 = var_3_8:getName() or "??"

	setText(arg_3_0.nameTxt, shortenString(var_3_12, 6, 1))

	local var_3_13 = arg_3_1:getConfig("num_limit")

	if var_3_13 == 0 then
		arg_3_0.limitCountTF.text = i18n("common_no_limit")
	else
		local var_3_14 = arg_3_1:GetPurchasableCnt()

		arg_3_0.limitCountTF.text = math.max(var_3_14, 0) .. "/" .. var_3_13
	end

	local var_3_15 = var_0_0.Color[arg_3_2] or var_0_0.DefaultColor

	arg_3_0.limitCountTF.color = arg_3_3 or Color.New(unpack(var_3_15))
	arg_3_0.limitCountLabelTF.color = arg_3_3 or Color.New(unpack(var_3_15))
	arg_3_4 = arg_3_4 or Color.New(0, 0, 0, 1)

	if GetComponent(arg_3_0.limitCountTF, typeof(Outline)) then
		setOutlineColor(arg_3_0.limitCountTF, arg_3_4)
	end

	if GetComponent(arg_3_0.limitCountLabelTF, typeof(Outline)) then
		setOutlineColor(arg_3_0.limitCountLabelTF, arg_3_4)
	end
end

function var_0_0.updateSelectable(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	arg_7_0.goodsVO = arg_7_1

	local var_7_0 = Drop.New({
		count = 1,
		type = DROP_TYPE_ITEM,
		id = arg_7_1:getConfig("commodity_id_list_show")
	})

	updateDrop(arg_7_0.itemTF, var_7_0)
	setActive(arg_7_0.mask, false)
	setActive(arg_7_0.selloutTag, false)

	if arg_7_0.limitPassTag then
		setActive(arg_7_0.limitPassTag, false)
	end

	removeOnButton(arg_7_0.mask)
	setActive(arg_7_0.limitTimeSellTF, false)
	GetSpriteFromAtlasAsync(Drop.New({
		type = arg_7_1:getConfig("resource_category"),
		id = arg_7_1:getConfig("resource_type")
	}):getIcon(), "", function(arg_8_0)
		arg_7_0.resIconTF.sprite = arg_8_0
	end)

	arg_7_0.countTF.text = arg_7_1:getConfig("resource_num")

	local var_7_1 = var_7_0:getName() or "??"

	setText(arg_7_0.nameTxt, shortenString(var_7_1, 6, 1))

	local var_7_2 = arg_7_1:getConfig("num_limit")

	if var_7_2 == 0 then
		arg_7_0.limitCountTF.text = i18n("common_no_limit")
	else
		local var_7_3 = arg_7_1:GetPurchasableCnt()

		arg_7_0.limitCountTF.text = math.max(var_7_3, 0) .. "/" .. var_7_2
	end

	local var_7_4 = var_0_0.Color[arg_7_2] or var_0_0.DefaultColor

	arg_7_0.limitCountTF.color = arg_7_3 or Color.New(unpack(var_7_4))
	arg_7_0.limitCountLabelTF.color = arg_7_3 or Color.New(unpack(var_7_4))
	arg_7_4 = arg_7_4 or Color.New(0, 0, 0, 1)

	if GetComponent(arg_7_0.limitCountTF, typeof(Outline)) then
		setOutlineColor(arg_7_0.limitCountTF, arg_7_4)
	end

	if GetComponent(arg_7_0.limitCountLabelTF, typeof(Outline)) then
		setOutlineColor(arg_7_0.limitCountLabelTF, arg_7_4)
	end
end

function var_0_0.setAsLastSibling(arg_9_0)
	arg_9_0.tr:SetAsLastSibling()
end

function var_0_0.StaticUpdate(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = tf(arg_10_0)
	local var_10_1 = findTF(var_10_0, "item")
	local var_10_2 = findTF(var_10_0, "item/name_mask/name")
	local var_10_3 = findTF(var_10_0, "item/consume/contain/icon"):GetComponent(typeof(Image))
	local var_10_4 = var_10_0:Find("mask")
	local var_10_5 = var_10_0:Find("mask/tag/sellout_tag")
	local var_10_6 = findTF(var_10_0, "item/consume/contain/Text"):GetComponent(typeof(Text))
	local var_10_7 = findTF(var_10_0, "item/discount")

	setActive(var_10_7, false)

	local var_10_8 = findTF(var_10_0, "item/count_contain/count"):GetComponent(typeof(Text))
	local var_10_9 = findTF(var_10_0, "item/count_contain/label"):GetComponent(typeof(Text))
	local var_10_10, var_10_11 = arg_10_1:canPurchase()

	setActive(var_10_4, not var_10_10)
	setActive(var_10_5, not var_10_10)

	local var_10_12 = Drop.New({
		type = arg_10_1:getConfig("commodity_type"),
		id = arg_10_1:getConfig("commodity_id"),
		count = arg_10_1:getConfig("num")
	})

	updateDrop(var_10_1, var_10_12)

	local var_10_13 = var_10_12:getConfig("name") or "??"

	var_10_6.text = arg_10_1:getConfig("resource_num")

	setText(var_10_2, shortenString(var_10_13, 6, 1))

	var_10_3.sprite = GetSpriteFromAtlas(Drop.New({
		type = arg_10_1:getConfig("resource_category"),
		id = arg_10_1:getConfig("resource_type")
	}):getIcon(), "")

	if arg_10_1:getConfig("num_limit") == 0 then
		var_10_8.text = i18n("common_no_limit")
	else
		local var_10_14 = arg_10_1:getConfig("num_limit")

		if var_10_12.type == DROP_TYPE_SKIN and not var_10_10 then
			var_10_8.text = "0/" .. var_10_14
		else
			var_10_8.text = var_10_14 - arg_10_1.buyCount .. "/" .. var_10_14
		end
	end

	local var_10_15 = var_0_0.Color[arg_10_2] or var_0_0.DefaultColor

	var_10_8.color = arg_10_3 or Color.New(var_10_15[1], var_10_15[2], var_10_15[3], 1)
	var_10_9.color = arg_10_3 or Color.New(var_10_15[1], var_10_15[2], var_10_15[3], 1)

	if arg_10_1:getConfig("num_limit") >= 99 then
		var_10_9.text = i18n("shop_label_unlimt_cnt")
		var_10_8.text = ""
	end
end

function var_0_0.OnDispose(arg_11_0)
	arg_11_0.goodsVO = nil
end

return var_0_0
