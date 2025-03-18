local var_0_0 = class("SkinDiscountItemExpireDisplayPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "SkinDicountItemExpiredUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.confirmBtn = arg_2_0:findTF("confirm_btn")
	arg_2_0.tipTxt = arg_2_0:findTF("title/label"):GetComponent(typeof(Text))
	arg_2_0.leftList = UIItemList.New(arg_2_0:findTF("left/scrollrect/list"), arg_2_0:findTF("left/scrollrect/list/tpl"))
	arg_2_0.rightList = UIItemList.New(arg_2_0:findTF("right/scrollrect/list"), arg_2_0:findTF("left/scrollrect/list/tpl"))

	setText(arg_2_0.tipTxt, i18n("skin_discount_item_tran_tip"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_5_0, arg_5_1)
	arg_5_0:InitLeftList(arg_5_1)
	arg_5_0:InitRightList(arg_5_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.InitLeftList(arg_6_0, arg_6_1)
	local var_6_0 = getProxy(BagProxy)
	local var_6_1 = _.map(arg_6_1, function(arg_7_0)
		local var_7_0 = var_6_0:getItemCountById(arg_7_0.id)

		return {
			DROP_TYPE_ITEM,
			arg_7_0.id,
			var_7_0
		}
	end)

	arg_6_0.leftList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = var_6_1[arg_8_1 + 1]

			arg_6_0:UpdateItem(var_8_0, arg_8_2)
		end
	end)
	arg_6_0.leftList:align(#var_6_1)
end

function var_0_0.InitRightList(arg_9_0, arg_9_1)
	local var_9_0 = getProxy(BagProxy):GetSellingPrice(arg_9_1)

	arg_9_0.rightList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			arg_9_0:UpdateItem(var_9_0[arg_10_1 + 1], arg_10_2)
		end
	end)
	arg_9_0.rightList:align(#var_9_0)
end

function var_0_0.UpdateItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = Drop.Create(arg_11_1)

	updateDrop(arg_11_2, var_11_0)
	setScrollText(arg_11_2:Find("name_bg/Text"), var_11_0:getName())
	onButton(arg_11_0, arg_11_2, function()
		pg.m02:sendNotification(NewMainMediator.ON_DROP, var_11_0)
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_13_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_13_0._tf, pg.UIMgr.GetInstance()._normalUIMain)
end

return var_0_0
