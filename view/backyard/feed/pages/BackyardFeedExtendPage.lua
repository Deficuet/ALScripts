local var_0_0 = class("BackyardFeedExtendPage", import("....base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "BackYardFeedExtendPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.icon = arg_2_0._tf:Find("frame/tip/icon"):GetComponent(typeof(Image))
	arg_2_0.consume = arg_2_0._tf:Find("frame/tip/Text"):GetComponent(typeof(Text))
	arg_2_0.desc = arg_2_0._tf:Find("frame/desc"):GetComponent(typeof(Text))
	arg_2_0.addBtn = arg_2_0._tf:Find("frame/confirm")
	arg_2_0.cancelBtn = arg_2_0._tf:Find("frame/cancel")
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/close")
	arg_2_0._parentTF = arg_2_0._tf.parent

	setText(arg_2_0.cancelBtn:Find("Text"), i18n("word_cancel"))
	setText(arg_2_0.addBtn:Find("Text"), i18n("word_ok"))
	setText(arg_2_0._tf:Find("frame/tip"), i18n("backyard_food_shop_tip"))
	setText(arg_2_0._tf:Find("frame/title"), i18n("words_information"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_7_0, arg_7_1, arg_7_2)
	var_0_0.super.Show(arg_7_0)

	local var_7_0 = ShopConst.GetShopConfig(arg_7_1)
	local var_7_1 = var_7_0.resource_type
	local var_7_2 = var_7_0.resource_num

	LoadSpriteAtlasAsync("props/" .. id2res(var_7_1), "", function(arg_8_0)
		arg_7_0.icon.sprite = arg_8_0
		tf(arg_7_0.icon.gameObject).sizeDelta = Vector2(50, 50)
	end)

	arg_7_0.consume.text = var_7_2
	arg_7_0.desc.text = i18n("backyard_backyardGranaryLayer_foodMaxIncreaseNotice", arg_7_2, arg_7_2 + var_7_0.num)

	onButton(arg_7_0, arg_7_0.addBtn, function()
		arg_7_0:Extend({
			resType = var_7_1,
			resCount = var_7_2,
			shopId = arg_7_1
		})
	end, SFX_CONFIRM)
end

function var_0_0.Extend(arg_10_0, arg_10_1)
	if getProxy(PlayerProxy):getRawData()[id2res(arg_10_1.resType)] < arg_10_1.resCount then
		if arg_10_1.resType == 4 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_error_entendFail"))
		end
	else
		arg_10_0:emit(BackyardFeedMediator.EXTEND, arg_10_1.shopId, 1)
	end

	arg_10_0:Hide()
end

function var_0_0.Hide(arg_11_0)
	var_0_0.super.Hide(arg_11_0)
end

function var_0_0.OnDestroy(arg_12_0)
	arg_12_0:Hide()
end

return var_0_0
