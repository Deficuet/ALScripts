local var_0_0 = class("ActivitySelectableShopPage", import(".ActivityShopPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.purchaseWindow = ActivityShopPurchasePanel.New(arg_1_0._tf, arg_1_0.event)

	arg_1_0:SetPurchaseConfirmCb()
end

function var_0_0.UpdateShop(arg_2_0, ...)
	var_0_0.super.UpdateShop(arg_2_0, ...)

	if arg_2_0.purchaseWindow:isShowing() then
		arg_2_0.purchaseWindow:ExecuteAction("Hide")
	end
end

function var_0_0.SetPurchaseConfirmCb(arg_3_0, arg_3_1)
	assert("false", "请参考MetaShopPage实现该方法")
end

function var_0_0.OnInitItem(arg_4_0, arg_4_1)
	local var_4_0 = ActivityGoodsCard.New(arg_4_1)

	var_4_0.tagImg.raycastTarget = false

	onButton(arg_4_0, var_4_0.tr, function()
		if var_4_0.goodsVO:Selectable() then
			arg_4_0.purchaseWindow:ExecuteAction("Show", {
				icon = "props/21000",
				id = var_4_0.goodsVO.id,
				count = var_4_0.goodsVO:getConfig("num_limit"),
				type = var_4_0.goodsVO:getConfig("commodity_type"),
				price = var_4_0.goodsVO:getConfig("resource_num"),
				displays = var_4_0.goodsVO:getConfig("commodity_id_list"),
				num = var_4_0.goodsVO:getConfig("num")
			})
		else
			arg_4_0:OnClickCommodity(var_4_0.goodsVO, function(arg_6_0, arg_6_1)
				arg_4_0:OnPurchase(arg_6_0, arg_6_1)
			end)
		end
	end, SFX_PANEL)

	arg_4_0.cards[arg_4_1] = var_4_0
end

function var_0_0.OnDestroy(arg_7_0)
	var_0_0.super.OnDestroy(arg_7_0)
	arg_7_0.purchaseWindow:Destroy()
end

return var_0_0
