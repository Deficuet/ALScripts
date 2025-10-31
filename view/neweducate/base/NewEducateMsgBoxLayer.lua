local var_0_0 = class("NewEducateMsgBoxLayer", import("view.newEducate.base.NewEducateBaseUI"))

var_0_0.TYPE = {
	SHOP = 3,
	BOX = 1,
	ITEM = 2
}

local var_0_1 = {
	[var_0_0.TYPE.BOX] = Vector2(924, 616),
	[var_0_0.TYPE.ITEM] = Vector2(1060, 628),
	[var_0_0.TYPE.SHOP] = Vector2(1060, 628)
}
local var_0_2 = {
	[var_0_0.TYPE.BOX] = i18n("child_msg_title_tip"),
	[var_0_0.TYPE.ITEM] = i18n("child_msg_title_detail"),
	[var_0_0.TYPE.SHOP] = i18n("child_msg_title_detail")
}

function var_0_0.getUIName(arg_1_0)
	return "NewEducateMsgBoxUI"
end

function var_0_0.init(arg_2_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)

	arg_2_0.anim = arg_2_0._tf:Find("anim_root"):GetComponent(typeof(Animation))
	arg_2_0.animEvent = arg_2_0._tf:Find("anim_root"):GetComponent(typeof(DftAniEvent))

	arg_2_0.animEvent:SetEndEvent(function()
		arg_2_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_2_0._window = arg_2_0._tf:Find("anim_root/window")

	setActive(arg_2_0._window, true)

	arg_2_0._top = arg_2_0._window:Find("top")
	arg_2_0._titleText = arg_2_0._top:Find("title")
	arg_2_0._closeBtn = arg_2_0._top:Find("btnBack")
	arg_2_0._msgPanel = arg_2_0._window:Find("msg_panel")
	arg_2_0.contentText = arg_2_0._msgPanel:Find("content"):GetComponent("RichText")
	arg_2_0._sigleItemPanel = arg_2_0._window:Find("single_item_panel")
	arg_2_0.singleItemTF = arg_2_0._sigleItemPanel:Find("item")
	arg_2_0.singleItemOwn = arg_2_0._sigleItemPanel:Find("own")
	arg_2_0.singleItemName = arg_2_0._sigleItemPanel:Find("display_panel/name")
	arg_2_0.singleItemDesc = arg_2_0._sigleItemPanel:Find("display_panel/desc/Text")
	arg_2_0._shopPanel = arg_2_0._window:Find("shop_panel")
	arg_2_0.goodsIcon = arg_2_0._shopPanel:Find("item/frame/icon")
	arg_2_0.goodsName = arg_2_0._shopPanel:Find("display_panel/name")
	arg_2_0.goodsDesc = arg_2_0._shopPanel:Find("display_panel/desc/Text")
	arg_2_0._noBtn = arg_2_0._window:Find("button_container/no")

	setText(arg_2_0._noBtn:Find("pic"), i18n("word_cancel"))

	arg_2_0._yesBtn = arg_2_0._window:Find("button_container/yes")

	setText(arg_2_0._yesBtn:Find("pic"), i18n("word_ok"))

	arg_2_0._buyBtn = arg_2_0._window:Find("button_container/buy")

	setText(arg_2_0._buyBtn:Find("pic"), i18n("word_ok"))
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:ShowMsgBox(arg_4_0.contextData)
end

function var_0_0.ShowMsgBox(arg_5_0, arg_5_1)
	arg_5_0:commonSetting(arg_5_1)
	arg_5_0:showByType(arg_5_1)
end

function var_0_0.commonSetting(arg_6_0, arg_6_1)
	arg_6_0.settings = arg_6_1

	local var_6_0 = arg_6_0.settings.type or var_0_0.TYPE.BOX

	arg_6_0._window.sizeDelta = var_0_1[var_6_0]

	setText(arg_6_0._titleText, var_0_2[var_6_0])
	setActive(arg_6_0._msgPanel, false)
	setActive(arg_6_0._sigleItemPanel, false)
	setActive(arg_6_0._shopPanel, false)

	local var_6_1 = arg_6_0.settings.hideNo or false
	local var_6_2 = arg_6_0.settings.hideYes or false
	local var_6_3 = arg_6_0.settings.hideClose or false
	local var_6_4 = arg_6_0.settings.onYes or function()
		return
	end
	local var_6_5 = arg_6_0.settings.onNo or function()
		return
	end
	local var_6_6 = arg_6_0.settings.onBuy or function()
		return
	end
	local var_6_7 = arg_6_0.settings.onClose or function()
		return
	end

	setText(arg_6_0._noBtn:Find("pic"), arg_6_0.settings.noText or i18n("word_cancel"))
	setText(arg_6_0._yesBtn:Find("pic"), arg_6_0.settings.yesText or i18n("word_ok"))
	setActive(arg_6_0._noBtn, not var_6_1)
	onButton(arg_6_0, arg_6_0._noBtn, function()
		local var_11_0 = arg_6_0.contextData.onExit

		function arg_6_0.contextData.onExit()
			existCall(var_6_5)
			existCall(var_11_0)
		end

		arg_6_0:_close()
	end, SFX_CANCEL)
	setActive(arg_6_0._yesBtn, not var_6_2)
	onButton(arg_6_0, arg_6_0._yesBtn, function()
		local var_13_0 = arg_6_0.contextData.onExit

		function arg_6_0.contextData.onExit()
			existCall(var_6_4)
			existCall(var_13_0)
		end

		arg_6_0:_close()
	end, SFX_CANCEL)
	setActive(arg_6_0._buyBtn, arg_6_0.settings.type == var_0_0.TYPE.SHOP)
	onButton(arg_6_0, arg_6_0._buyBtn, function()
		local var_15_0 = arg_6_0.contextData.onExit

		function arg_6_0.contextData.onExit()
			existCall(var_6_6)
			existCall(var_15_0)
		end

		arg_6_0:_close()
	end, SFX_CANCEL)
	setActive(arg_6_0._closeBtn, not var_6_3)
	onButton(arg_6_0, arg_6_0._closeBtn, function()
		local var_17_0 = arg_6_0.contextData.onExit

		function arg_6_0.contextData.onExit()
			existCall(var_6_7)
			existCall(var_17_0)
		end

		arg_6_0:_close()
	end, SFX_CANCEL)
	onButton(arg_6_0, tf(arg_6_0._go):Find("anim_root/bg"), function()
		if var_6_1 or var_6_3 then
			return
		end

		local var_19_0 = arg_6_0.contextData.onExit

		function arg_6_0.contextData.onExit()
			existCall(var_6_7)
			existCall(var_19_0)
		end

		arg_6_0:_close()
	end, SFX_CANCEL)
end

function var_0_0.showByType(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.settings.type or var_0_0.TYPE.BOX

	switch(var_21_0, {
		[var_0_0.TYPE.BOX] = function()
			arg_21_0:showNormalMsgBox()
		end,
		[var_0_0.TYPE.ITEM] = function()
			arg_21_0:showSingleItemBox()
		end,
		[var_0_0.TYPE.SHOP] = function()
			arg_21_0:showShopBuyBox()
		end
	})
end

function var_0_0.showNormalMsgBox(arg_25_0)
	setActive(arg_25_0._msgPanel, true)

	arg_25_0.contentText.text = arg_25_0.settings.content or ""
end

function var_0_0.showSingleItemBox(arg_26_0)
	setActive(arg_26_0._sigleItemPanel, true)
	setActive(arg_26_0._noBtn, false)
	NewEducateHelper.UpdateItem(arg_26_0.singleItemTF, arg_26_0.settings.drop)

	local var_26_0 = NewEducateHelper.GetDropConfig(arg_26_0.settings.drop)

	setText(arg_26_0.singleItemName, var_26_0.name or "")

	local var_26_1 = getProxy(NewEducateProxy):GetCurChar()
	local var_26_2 = var_26_1:GetOwnCnt(arg_26_0.settings.drop)

	setText(arg_26_0.singleItemOwn, i18n("child_msg_owned", var_26_2))

	if arg_26_0.settings.drop.type == NewEducateConst.DROP_TYPE.RES and var_26_0.type == NewEducateChar.RES_TYPE.MOOD then
		local var_26_3 = var_26_1:GetMoodStage()

		setText(arg_26_0.singleItemDesc, string.gsub(var_26_0.desc, "$1", i18n("child2_mood_desc" .. var_26_3)))
	else
		setText(arg_26_0.singleItemDesc, var_26_0.desc or var_26_0.name or "")
	end
end

function var_0_0.showShopBuyBox(arg_27_0)
	setActive(arg_27_0._shopPanel, true)
	setActive(arg_27_0._yesBtn, false)
	setActive(arg_27_0._buyBtn, true)
	setText(arg_27_0._buyBtn:Find("price/Text"), arg_27_0.settings.price)

	local var_27_0 = pg.child2_shop[arg_27_0.settings.shopId]

	LoadImageSpriteAsync("neweducateicon/" .. var_27_0.icon, arg_27_0.goodsIcon)
	setText(arg_27_0.goodsName, var_27_0.name)

	if var_27_0.goods_type == NewEducateGoods.TYPE.BENEFIT then
		local var_27_1 = pg.child2_benefit_list[var_27_0.goods_id]

		setText(arg_27_0.goodsDesc, var_27_1.desc)
	else
		setText(arg_27_0.goodsDesc, var_27_0.desc)
	end
end

function var_0_0._close(arg_28_0)
	arg_28_0.anim:Play("anim_educate_MsgBox_out")
end

function var_0_0.onBackPressed(arg_29_0)
	if arg_29_0.settings.hideNo or arg_29_0.settings.hideClose then
		return
	end

	arg_29_0:_close()
end

function var_0_0.willExit(arg_30_0)
	arg_30_0.animEvent:SetEndEvent(nil)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_30_0._tf)

	if arg_30_0.contextData.onExit then
		arg_30_0.contextData.onExit()
	end
end

return var_0_0
