local var_0_0 = class("ChargeTipWindow", import("view.base.BaseSubView"))

var_0_0.TYPE_MONTH_CARD = "MonthCard"
var_0_0.TYPE_GIFTPACKAGE = "GiftPackage"
var_0_0.TYPE_CURSING = "Crusing"

function var_0_0.getUIName(arg_1_0)
	return "ChargeTipUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.container = arg_2_0._tf:Find("frame/window")
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/top/btnBack")
	arg_2_0.confirmBtn = arg_2_0._tf:Find("frame/confirm")

	setText(arg_2_0._tf:Find("frame/top/title"), i18n("words_information"))
	setText(arg_2_0.confirmBtn:Find("Text"), i18n("msgbox_text_confirm"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.window = {}
end

local function var_0_1(arg_4_0)
	local var_4_0 = arg_4_0:getConfig("extra_service")

	if var_4_0 == Goods.MONTH_CARD then
		return var_0_0.TYPE_MONTH_CARD
	elseif var_4_0 == Goods.ITEM_BOX then
		return var_0_0.TYPE_GIFTPACKAGE
	elseif var_4_0 == Goods.PASS_ITEM then
		return var_0_0.TYPE_CURSING
	end
end

function var_0_0.Show(arg_5_0, arg_5_1)
	assert(arg_5_1:isChargeType())
	var_0_0.super.Show(arg_5_0)

	arg_5_0.chargeCommodity = arg_5_1

	local var_5_0 = var_0_1(arg_5_1)

	if not var_5_0 then
		arg_5_0:Hide()

		return
	end

	seriesAsync({
		function(arg_6_0)
			arg_5_0:LoadWindow(var_5_0, arg_6_0)
		end,
		function(arg_7_0)
			arg_5_0:UpdateWindow(var_5_0, arg_7_0)
		end
	}, function()
		arg_5_0:RegisterEvent()
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)
end

function var_0_0.LoadWindow(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0.window[arg_9_1] then
		arg_9_2()

		return
	end

	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_9_1 .. "TipWindow", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_10_0)
		arg_9_0.window[arg_9_1] = Object.Instantiate(arg_10_0, arg_9_0.container).transform

		arg_9_2()
	end), true, true)
end

function var_0_0.UpdateWindow(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.window[arg_11_1]

	setActive(var_11_0, true)

	local var_11_1 = arg_11_0["Update" .. arg_11_1]

	if var_11_1 then
		var_11_1(arg_11_0, var_11_0)
	end

	arg_11_2()
end

local function var_0_2(arg_12_0, arg_12_1)
	local var_12_0 = UIItemList.New(arg_12_0:Find("awards"), arg_12_0:Find("awards/award"))

	var_12_0:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_12_1[arg_13_1 + 1]
			local var_13_1 = {
				type = var_13_0[1],
				id = var_13_0[2],
				count = var_13_0[3]
			}

			updateDrop(arg_13_2, var_13_1)
		end
	end)
	var_12_0:align(#arg_12_1)
end

function var_0_0.UpdateMonthCard(arg_14_0, arg_14_1)
	setText(arg_14_1:Find("title/label/txt"), i18n("chargetip_monthcard_1"))

	local var_14_0 = arg_14_0.chargeCommodity:getConfig("gem") + arg_14_0.chargeCommodity:getConfig("extra_gem")

	setText(arg_14_1:Find("title/Text"), "X" .. var_14_0)
	setText(arg_14_1:Find("sub_title"), i18n("chargetip_monthcard_2"))

	local var_14_1 = arg_14_0.chargeCommodity:getConfig("display")

	var_0_2(arg_14_1, var_14_1)
	setAnchoredPosition(arg_14_0.confirmBtn, {
		y = -540
	})
end

function var_0_0.UpdateGiftPackage(arg_15_0, arg_15_1)
	setText(arg_15_1:Find("title"), i18n("chargetip_giftpackage"))

	local var_15_0 = arg_15_0.chargeCommodity:GetDropItem()
	local var_15_1 = UIItemList.New(arg_15_1:Find("list/content"), arg_15_1:Find("list/content/award"))

	var_15_1:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			local var_16_0 = var_15_0[arg_16_1 + 1]
			local var_16_1 = {
				type = var_16_0[1],
				id = var_16_0[2],
				count = var_16_0[3]
			}

			updateDrop(arg_16_2, var_16_1)
		end
	end)
	var_15_1:align(#var_15_0)
	setActive(arg_15_1:Find("icon"), false)
	setAnchoredPosition(arg_15_0.confirmBtn, {
		y = -550
	})
end

function var_0_0.UpdateCrusing(arg_17_0, arg_17_1)
	setText(arg_17_1:Find("title"), i18n("chargetip_crusing"))
	setText(arg_17_1:Find("sub_title"), i18n("charge_tip_crusing_label"))

	local var_17_0 = arg_17_0.chargeCommodity:getConfig("display")

	var_0_2(arg_17_1, var_17_0)
	setAnchoredPosition(arg_17_0.confirmBtn, {
		y = -550
	})
end

function var_0_0.RegisterEvent(arg_18_0)
	onButton(arg_18_0, arg_18_0._tf, function()
		arg_18_0:Hide()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.closeBtn, function()
		arg_18_0:Hide()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.confirmBtn, function()
		arg_18_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Hide(arg_22_0)
	var_0_0.super.Hide(arg_22_0)
	removeOnButton(arg_22_0._tf)
	removeOnButton(arg_22_0.closeBtn)
	removeOnButton(arg_22_0.confirmBtn)

	for iter_22_0, iter_22_1 in pairs(arg_22_0.window) do
		if not IsNil(iter_22_1) then
			setActive(iter_22_1, false)
		end
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_22_0._tf, arg_22_0._parentTf)
end

function var_0_0.OnDestroy(arg_23_0)
	if arg_23_0:isShowing() then
		arg_23_0:Hide()
	end

	for iter_23_0, iter_23_1 in pairs(arg_23_0.window) do
		if not IsNil(iter_23_1) then
			Object.Destroy(iter_23_1.gameObject)
		end
	end

	arg_23_0.window = {}
end

return var_0_0
