local var_0_0 = class("ActivityGoodsCard", import(".BaseGoodsCard"))

var_0_0.Color = {}
var_0_0.DefaultColor = {
	0.8745098039215686,
	0.9294117647058824,
	1
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.limitPassTag = arg_1_0.tf:Find("mask/tag/pass_tag")
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

	setActive(arg_3_0.unexchangeTag, false)
	removeOnButton(arg_3_0.mask)

	if var_3_1 then
		local var_3_3, var_3_4, var_3_5 = arg_3_0.goodsVO:CheckArgLimit()

		if var_3_4 == "pass" then
			setActive(arg_3_0.limitPassTag, true)
			setScrollText(findTF(arg_3_0.limitPassTag, "TextGo/Text"), i18n("eventshop_unlock_info", var_3_5))
			onButton(arg_3_0, arg_3_0.mask, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("eventshop_unlock_hint", var_3_5))
			end, SFX_PANEL)
		else
			setScrollText(arg_3_0.unexchangeTag:Find("TextGo/Text"), var_3_5)

			var_3_2 = true
		end
	end

	if not var_3_0 then
		setActive(arg_3_0.selloutTag, true)
	elseif var_3_2 then
		setActive(arg_3_0.unexchangeTag, true)
	end

	local var_3_6 = Drop.New({
		type = arg_3_1:getConfig("commodity_type"),
		id = arg_3_1:getConfig("commodity_id"),
		count = arg_3_1:getConfig("num")
	})

	updateDrop(arg_3_0.itemTF, var_3_6)

	if var_3_0 then
		local var_3_7, var_3_8, var_3_9 = arg_3_0.goodsVO:CheckTimeLimit()

		if var_3_7 and not var_3_8 then
			setActive(arg_3_0.mask, true)
			setActive(arg_3_0.sellEndTag, true)
			removeOnButton(arg_3_0.mask)
			onButton(arg_3_0, arg_3_0.mask, function()
				if var_3_9 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("tip_build_ticket_exchange_expired", var_3_6:getName()))
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
	setText(arg_3_0.countTF, arg_3_1:getConfig("resource_num"))

	local var_3_10 = var_3_6:getName() or "??"

	setScrollText(arg_3_0.nameTxt, var_3_10)

	local var_3_11 = arg_3_1:getConfig("num_limit")

	if var_3_11 == 0 then
		setText(arg_3_0.limitCountLabelTF, i18n("common_no_limit"))
	else
		local var_3_12 = arg_3_1:GetPurchasableCnt()

		setText(arg_3_0.limitCountLabelTF, i18n("activity_shop_exchange_count") .. math.max(var_3_12, 0) .. "/" .. var_3_11)
	end

	setActive(arg_3_0.limitCountLabelTF, true)
	setActive(arg_3_0.groupLocked, arg_3_0.itemTF:Find("group_locked").gameObject.activeSelf)
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
	GetSpriteFromAtlasAsync(Drop.New({
		type = arg_7_1:getConfig("resource_category"),
		id = arg_7_1:getConfig("resource_type")
	}):getIcon(), "", function(arg_8_0)
		arg_7_0.resIconTF.sprite = arg_8_0
	end)
	setText(arg_7_0.countTF, arg_7_1:getConfig("resource_num"))

	local var_7_1 = var_7_0:getName() or "??"

	setScrollText(arg_7_0.nameTxt, var_7_1)

	local var_7_2 = arg_7_1:getConfig("num_limit")

	if var_7_2 == 0 then
		setText(arg_7_0.limitCountLabelTF, i18n("common_no_limit"))
	else
		local var_7_3 = arg_7_1:GetPurchasableCnt()

		setText(arg_7_0.limitCountLabelTF, i18n("activity_shop_exchange_count") .. math.max(var_7_3, 0) .. "/" .. var_7_2)
	end

	setActive(arg_7_0.groupLocked, arg_7_0.itemTF:Find("group_locked").gameObject.activeSelf)
end

function var_0_0.setAsLastSibling(arg_9_0)
	arg_9_0.tf:SetAsLastSibling()
end

function var_0_0.StaticUpdate(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = tf(arg_10_0)
	local var_10_1 = findTF(var_10_0, "itemBg/item")
	local var_10_2 = findTF(var_10_0, "name_mask/name")
	local var_10_3 = findTF(var_10_0, "consume/contain/icon"):GetComponent(typeof(Image))
	local var_10_4 = var_10_0:Find("mask")
	local var_10_5 = var_10_0:Find("mask/tag/sellout_tag")
	local var_10_6 = findTF(var_10_0, "consume/contain/Text"):GetComponent(typeof(Text))
	local var_10_7 = findTF(var_10_0, "discount")

	setActive(var_10_7, false)

	local var_10_8 = findTF(var_10_0, "count_contain/label"):GetComponent(typeof(Text))
	local var_10_9, var_10_10 = arg_10_1:canPurchase()

	setActive(var_10_4, not var_10_9)
	setActive(var_10_5, not var_10_9)

	local var_10_11 = Drop.New({
		type = arg_10_1:getConfig("commodity_type"),
		id = arg_10_1:getConfig("commodity_id"),
		count = arg_10_1:getConfig("num")
	})

	updateDrop(var_10_1, var_10_11)

	local var_10_12 = var_10_11:getConfig("name") or "??"

	var_10_6.text = arg_10_1:getConfig("resource_num")

	setScrollText(var_10_2, var_10_12)

	local var_10_13 = Drop.New({
		type = arg_10_1:getConfig("resource_category"),
		id = arg_10_1:getConfig("resource_type")
	}):getIcon()

	GetImageSpriteFromAtlasAsync(var_10_13, "", var_10_3)

	if arg_10_1:getConfig("num_limit") == 0 then
		setText(var_10_8, i18n("common_no_limit"))
	else
		local var_10_14 = arg_10_1:getConfig("num_limit")

		if var_10_11.type == DROP_TYPE_SKIN and not var_10_9 then
			setText(var_10_8, i18n("activity_shop_exchange_count") .. "0/" .. var_10_14)
		else
			setText(var_10_8, i18n("activity_shop_exchange_count") .. var_10_14 - arg_10_1.buyCount .. "/" .. var_10_14)
		end
	end

	if arg_10_1:getConfig("num_limit") >= 99 then
		setText(var_10_8, i18n("shop_label_unlimt_cnt"))
	end

	setActive(findTF(var_10_0, "group_locked"), var_10_1:Find("group_locked").gameObject.activeSelf)
end

function var_0_0.OnDispose(arg_11_0)
	arg_11_0.goodsVO = nil
end

return var_0_0
