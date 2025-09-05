local var_0_0 = class("MetaShopPage", import(".ActivitySelectableShopPage"))

function var_0_0.ResId2ItemId(arg_1_0, arg_1_1)
	return arg_1_1
end

function var_0_0.SetResIcon(arg_2_0)
	var_0_0.super.SetResIcon(arg_2_0, DROP_TYPE_ITEM)
end

function var_0_0.UpdateTip(arg_3_0)
	arg_3_0.tipText.text = i18n("meta_shop_tip")
end

function var_0_0.SetPurchaseConfirmCb(arg_4_0, arg_4_1)
	arg_4_0.purchaseWindow:ExecuteAction("SetConfirmCb", function(arg_5_0, arg_5_1, arg_5_2)
		arg_4_0:emit(NewShopMainMediator.ON_META_SHOP, arg_4_0.shop.activityId, 1, arg_5_0, arg_5_2, arg_5_1)
	end)
	arg_4_0.purchaseWindow:ExecuteAction("Hide")
end

function var_0_0.OnUpdatePlayer(arg_6_0)
	return
end

function var_0_0.OnUpdateItems(arg_7_0)
	arg_7_0:RefreshResItemList()
end

function var_0_0.GetResDataList(arg_8_0)
	local var_8_0 = {}
	local var_8_1 = arg_8_0.shop:GetResList()

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		local var_8_2 = (arg_8_0.items[iter_8_1] or Item.New({
			count = 0,
			id = iter_8_1
		})).count

		table.insert(var_8_0, {
			type = DROP_TYPE_ITEM,
			resID = iter_8_1,
			cnt = var_8_2
		})
	end

	return var_8_0
end

function var_0_0.RefreshUI(arg_9_0)
	arg_9_0:UpdateTip()
	setActive(arg_9_0.tipTextGo, true)
	setActive(arg_9_0.helpBtn, false)
	setActive(arg_9_0.resolveBtn, false)
	setActive(arg_9_0.refreshBtn, false)
end

function var_0_0.OnPurchase(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.shop.activityId

	arg_10_0:emit(NewShopMainMediator.ON_META_SHOP, var_10_0, 1, arg_10_1.id, arg_10_2, {
		{
			key = arg_10_1:getConfig("commodity_id"),
			value = arg_10_2
		}
	})
end

function var_0_0.GetPaintingName(arg_11_0)
	local var_11_0, var_11_1, var_11_2 = var_0_0.super.GetPaintingName(arg_11_0)
	local var_11_3

	if type(var_11_0) == "table" then
		var_11_3 = var_11_0[math.random(1, #var_11_0)]
	else
		var_11_3 = var_11_0
	end

	return var_11_3, var_11_1, var_11_2
end

return var_0_0
