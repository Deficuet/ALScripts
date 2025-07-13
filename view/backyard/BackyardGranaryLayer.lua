local var_0_0 = class("BackyardGranaryLayer", import("..base.BaseUI"))
local var_0_1 = {
	50001,
	50002,
	50003,
	50004,
	50005,
	50006
}
local var_0_2 = pg.item_data_template
local var_0_3 = pg.shop_template

local function var_0_4(arg_1_0)
	local var_1_0 = {}

	local function var_1_1(arg_2_0)
		arg_2_0._go = arg_1_0
		arg_2_0._tf = tf(arg_1_0)
		arg_2_0.mask = arg_2_0._tf:Find("mask")
		arg_2_0.count = arg_2_0._tf:Find("count"):GetComponent(typeof(Text))
		arg_2_0.name = arg_2_0._tf:Find("name_bg/Text"):GetComponent(typeof(Text))
		arg_2_0.addTF = arg_2_0._tf:Find("add_btn")
		arg_2_0.icon = arg_2_0._tf:Find("icon_bg/icon")
	end

	function var_1_0.Update(arg_3_0, arg_3_1)
		arg_3_0._go.name = "food_" .. arg_3_1.id
		arg_3_0.foodVO = arg_3_1

		setActive(arg_3_0.mask, arg_3_1.count == 0)

		arg_3_0.count.text = arg_3_1.count

		local var_3_0 = i18n("word_food") .. var_0_2[arg_3_1.id].usage_arg[1]

		arg_3_0.name.text = arg_3_1.count == 0 and setColorStr(var_3_0, "#2f2d2b") or setColorStr(var_3_0, "#4E3E42FF")

		if arg_3_0.foodVOId ~= arg_3_1.id then
			arg_3_0.foodVOId = arg_3_1.id

			updateItem(arg_3_0._tf, arg_3_1)
		end
	end

	function var_1_0.Dispose(arg_4_0)
		return
	end

	var_1_1(var_1_0)

	return var_1_0
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = {}

	local function var_5_1(arg_6_0)
		arg_6_0._go = arg_5_0
		arg_6_0._tf = tf(arg_5_0)
		arg_6_0.parent = arg_6_0._tf.parent
		arg_6_0.overlay = arg_5_1
		arg_6_0.foodItem = arg_6_0._tf:Find("frame")
		arg_6_0.foodName = arg_6_0._tf:Find("frame/name"):GetComponent(typeof(Text))
		arg_6_0.foodDesc = arg_6_0._tf:Find("frame/desc"):GetComponent(typeof(Text))
		arg_6_0.calPanel = arg_6_0._tf:Find("frame/cal_panel")
		arg_6_0.cancelBtn = arg_6_0._tf:Find("frame/cancel_btn")
		arg_6_0.countValue = arg_6_0.calPanel:Find("value/Text"):GetComponent(typeof(Text))
		arg_6_0.total = arg_6_0.calPanel:Find("total/Text"):GetComponent(typeof(Text))
		arg_6_0.totalIcon = arg_6_0.calPanel:Find("total/icon"):GetComponent(typeof(Image))
		arg_6_0.minusBtn = arg_6_0.calPanel:Find("minus_btn")
		arg_6_0.addBtn = arg_6_0.calPanel:Find("add_btn")
		arg_6_0.tenBtn = arg_6_0.calPanel:Find("ten_btn")
		arg_6_0.confirmBtn = arg_6_0._tf:Find("frame/ok_btn")
		arg_6_0.cancelBtn = arg_6_0._tf:Find("frame/cancel_btn")

		onButton(nil, arg_6_0._tf, function()
			arg_6_0:Hide()
		end, SFX_PANEL)
		onButton(nil, arg_6_0.cancelBtn, function()
			arg_6_0:Hide()
		end, SFX_PANEL)
	end

	function var_5_0.Show(arg_9_0, arg_9_1, arg_9_2)
		setParent(arg_9_0._tf, arg_9_0.overlay)
		setActive(arg_9_0._tf, true)

		arg_9_0.foodName.text = arg_9_1:getConfig("name")

		if PLATFORM_CODE == PLATFORM_US then
			setBestFitTextEN(arg_9_0.foodDesc.gameObject, arg_9_1:getConfig("display"), 28)
		else
			arg_9_0.foodDesc.text = arg_9_1:getConfig("display")
		end

		updateItem(arg_9_0.foodItem, arg_9_1)

		local var_9_0 = arg_9_1:getConfig("shop_id")
		local var_9_1 = var_0_3[var_9_0]
		local var_9_2 = var_9_1.resource_type
		local var_9_3 = var_9_1.resource_num
		local var_9_4 = 1

		arg_9_0.total.text = var_9_3 * var_9_4
		arg_9_0.totalIcon.sprite = LoadSprite("props/" .. id2res(var_9_2))
		arg_9_0.countValue.text = var_9_4

		onButton(nil, arg_9_0.minusBtn, function()
			if var_9_4 <= 1 then
				return
			end

			var_9_4 = var_9_4 - 1
			arg_9_0.countValue.text = var_9_4
			arg_9_0.total.text = var_9_3 * var_9_4
		end, SFX_PANEL)
		onButton(nil, arg_9_0.addBtn, function()
			if var_9_4 == 999 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buyCountLimit", var_9_4))

				return
			end

			var_9_4 = var_9_4 > 999 and 999 or var_9_4 + 1
			arg_9_0.countValue.text = var_9_4
			arg_9_0.total.text = var_9_3 * var_9_4
		end, SFX_PANEL)
		onButton(nil, arg_9_0.tenBtn, function()
			if var_9_4 == 999 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buyCountLimit", var_9_4))

				return
			end

			var_9_4 = var_9_4 + 10 >= 999 and 999 or var_9_4 + 10
			arg_9_0.countValue.text = var_9_4
			arg_9_0.total.text = var_9_3 * var_9_4
		end, SFX_PANEL)
		onButton(nil, arg_9_0.confirmBtn, function()
			arg_9_2({
				count = var_9_4,
				resourceType = var_9_2,
				resourceNum = var_9_3,
				shopId = var_9_0
			})
			arg_9_0._tf:SetSiblingIndex(0)
		end, SFX_CONFIRM)
	end

	function var_5_0.Hide(arg_14_0)
		setActive(arg_14_0._tf, false)
		setParent(arg_14_0._tf, arg_14_0.parent)
	end

	function var_5_0.Dispose(arg_15_0)
		arg_15_0:Hide()
		removeOnButton(arg_15_0.minusBtn)
		removeOnButton(arg_15_0.addBtn)
		removeOnButton(arg_15_0.tenBtn)
		removeOnButton(arg_15_0.confirmBtn)
	end

	var_5_1(var_5_0)

	return var_5_0
end

local function var_0_6(arg_16_0, arg_16_1)
	local var_16_0 = {}

	local function var_16_1(arg_17_0)
		arg_17_0._go = arg_16_0
		arg_17_0._tf = tf(arg_16_0)
		arg_17_0.parent = arg_17_0._tf.parent
		arg_17_0.overlay = arg_16_1
		arg_17_0.icon = arg_17_0._tf:Find("frame/tip/icon"):GetComponent(typeof(Image))
		arg_17_0.consume = arg_17_0._tf:Find("frame/tip/Text"):GetComponent(typeof(Text))
		arg_17_0.desc = arg_17_0._tf:Find("frame/desc"):GetComponent(typeof(Text))
		arg_17_0.addBtn = arg_17_0._tf:Find("frame/ok_btn")
		arg_17_0.cancelBtn = arg_17_0._tf:Find("frame/cancel_btn")

		onButton(nil, arg_17_0.cancelBtn, function()
			arg_17_0:Hide()
		end, SFX_PANEL)
		onButton(nil, arg_17_0._tf, function()
			arg_17_0:Hide()
		end, SFX_PANEL)
	end

	function var_16_0.Show(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		setParent(arg_20_0._tf, arg_20_0.overlay)
		setActive(arg_20_0._tf, true)

		local var_20_0 = var_0_3[arg_20_1]
		local var_20_1 = var_20_0.resource_type
		local var_20_2 = var_20_0.resource_num

		arg_20_0.icon.sprite = LoadSprite("props/" .. id2res(var_20_1))
		arg_20_0.consume.text = var_20_2
		arg_20_0.desc.text = i18n("backyard_backyardGranaryLayer_foodMaxIncreaseNotice", arg_20_2, arg_20_2 + var_20_0.num)

		onButton(nil, arg_20_0.addBtn, function()
			arg_20_3({
				resType = var_20_1,
				resCount = var_20_2,
				shopId = arg_20_1
			})
		end, SFX_CONFIRM)
	end

	function var_16_0.Hide(arg_22_0)
		setActive(arg_22_0._tf, false)
		setParent(arg_22_0._tf, arg_22_0.parent)
	end

	function var_16_0.Dispose(arg_23_0)
		arg_23_0:Hide()
		removeOnButton(arg_23_0.addBtn)
	end

	var_16_1(var_16_0)

	return var_16_0
end

function var_0_0.getUIName(arg_24_0)
	return "BackyardGranaryUI"
end

function var_0_0.setIsRemind(arg_25_0, arg_25_1)
	arg_25_0.remindEndTime = arg_25_1
end

function var_0_0.setFoodVOs(arg_26_0, arg_26_1)
	arg_26_0.foodVOs = arg_26_1
end

function var_0_0.setPlayerVO(arg_27_0, arg_27_1)
	arg_27_0.playerVO = arg_27_1
end

function var_0_0.setDormVO(arg_28_0, arg_28_1)
	arg_28_0.dormVO = arg_28_1

	local var_28_0 = arg_28_0.dormVO.dorm_food_max

	arg_28_0.capacity = arg_28_1:getConfig("capacity") + var_28_0
end

function var_0_0.setTrainShipVOs(arg_29_0, arg_29_1)
	arg_29_0.addExpShipVOs = arg_29_1
end

function var_0_0.getFoodVOById(arg_30_0, arg_30_1)
	return _.detect(arg_30_0.foodVOs, function(arg_31_0)
		return arg_31_0.id == arg_30_1
	end) or Item.New({
		count = 0,
		id = arg_30_1
	})
end

function var_0_0.init(arg_32_0)
	arg_32_0.itemList = UIItemList.New(arg_32_0:findTF("foodPanel/frame/scrollview/content"), arg_32_0:findTF("foodPanel/frame/scrollview/foodtpl"))
	arg_32_0.foodPanel = arg_32_0:findTF("foodPanel")
	arg_32_0.stock = arg_32_0:findTF("frame/top/stock", arg_32_0.foodPanel)
	arg_32_0.stockBar = arg_32_0:findTF("bar", arg_32_0.stock):GetComponent(typeof(Image))
	arg_32_0.stockTxt = arg_32_0:findTF("Text", arg_32_0.stock):GetComponent(typeof(Text))
	arg_32_0.leftTimeTF = arg_32_0:findTF("paint/chat_bg/chat_text", arg_32_0.foodPanel)
	arg_32_0.chatContain = arg_32_0:findTF("paint/chat_bg/chat_contain", arg_32_0.foodPanel)
	arg_32_0.bottomText = arg_32_0:findTF("paint/chat_bg/bottom_text", arg_32_0.foodPanel)
	arg_32_0.paint = findTF(arg_32_0.foodPanel, "paint/lenggui")

	arg_32_0.paint:GetComponent("SpineAnimUI"):SetAction("animation", 0)

	arg_32_0._overlayUIMain = pg.UIMgr.GetInstance().OverlayMain
	arg_32_0.foodMsgBox = var_0_5(arg_32_0:findTF("shopPanel"), arg_32_0._overlayUIMain)
	arg_32_0.extendPanel = var_0_6(arg_32_0:findTF("extendPanel"), arg_32_0._overlayUIMain)
	arg_32_0.extendBtn = arg_32_0:findTF("frame/top/extend_btn", arg_32_0.foodPanel)

	pg.UIMgr.GetInstance():BlurPanel(arg_32_0.foodPanel)
end

function var_0_0.didEnter(arg_33_0)
	onButton(arg_33_0, arg_33_0.foodPanel:Find("bg"), function()
		arg_33_0:emit(var_0_0.ON_CLOSE)
	end, SOUND_BACK)
	onButton(arg_33_0, arg_33_0.extendBtn, function()
		arg_33_0:openExtendPanel()
	end, SFX_PANEL)

	arg_33_0.cards = {}
	arg_33_0.count = 0

	arg_33_0:updateDorm(arg_33_0.dormVO)
	arg_33_0:initItems()

	Input.multiTouchEnabled = false
end

function var_0_0.initItems(arg_36_0)
	arg_36_0.itemList:make(function(arg_37_0, arg_37_1, arg_37_2)
		if arg_37_0 == UIItemList.EventInit then
			local var_37_0 = var_0_1[arg_37_1 + 1]
			local var_37_1 = arg_36_0.cards[var_37_0]

			if not var_37_1 then
				var_37_1 = var_0_4(arg_37_2)
				arg_36_0.cards[var_37_0] = var_37_1
			end

			onButton(arg_36_0, var_37_1.mask, function()
				arg_36_0:openFoodShop(var_37_1.foodVO)
			end, SFX_PANEL)
			onButton(arg_36_0, var_37_1.addTF, function()
				arg_36_0:openFoodShop(var_37_1.foodVO)
			end, SFX_PANEL)
			pressPersistTrigger(var_37_1.icon, 0.5, function(arg_40_0)
				arg_36_0:updateConsume(arg_40_0, var_37_1)
			end, function()
				arg_36_0:updateTotalConsume(var_37_1)
			end, true, true, 0.15, SFX_PANEL)
		end
	end)
	arg_36_0.itemList:align(#var_0_1)
	arg_36_0:updateItems()
end

function var_0_0.updateItems(arg_42_0)
	for iter_42_0, iter_42_1 in pairs(var_0_1) do
		local var_42_0 = arg_42_0:getFoodVOById(iter_42_1)

		arg_42_0.cards[iter_42_1]:Update(var_42_0)
	end
end

function var_0_0.updateConsume(arg_43_0, arg_43_1, arg_43_2)
	if not arg_43_0.dormClone then
		arg_43_0.dormClone = Clone(arg_43_0.dormVO)
	end

	local var_43_0 = var_0_2[arg_43_2.foodVO.id].usage_arg[1]

	if arg_43_0.dormClone.food ~= arg_43_0.capacity and arg_43_0.dormClone.food + var_43_0 > arg_43_0.capacity and pg.TimeMgr.GetInstance():GetServerTime() > arg_43_0.remindEndTime then
		local var_43_1 = pg.MsgboxMgr.GetInstance()

		var_43_1:ShowMsgBox({
			showStopRemind = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			content = i18n("backyard_food_remind", arg_43_2.foodVO:getConfig("name")),
			name = i18n("backyard_food_count", arg_43_0.dormClone.food .. "/" .. arg_43_0.capacity),
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_43_2.foodVO.id,
				count = i18n("common_food") .. ":" .. var_43_0
			},
			onYes = function()
				arg_43_0:emit(BackyardGranaryMediator.USE_FOOD, arg_43_2.foodVO.id, 1, var_43_1.stopRemindToggle.isOn)
			end
		})

		if arg_43_1 then
			arg_43_1()
		end

		return
	end

	if arg_43_0.dormClone.food >= arg_43_0.capacity then
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_full"))

		if arg_43_1 then
			arg_43_1()
		end

		return
	end

	if arg_43_2.foodVO.count <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_foodCountLimit"))

		if arg_43_1 then
			arg_43_1()
		end

		return
	end

	arg_43_0.count = arg_43_0.count + 1

	arg_43_0.dormClone:addFood(var_43_0)

	local var_43_2 = arg_43_2.foodVO

	var_43_2.count = var_43_2.count - 1

	arg_43_2:Update(var_43_2)
	arg_43_0:updateDorm(arg_43_0.dormClone)
	arg_43_0:showStockAdd(var_43_0)
end

function var_0_0.showStockAdd(arg_45_0, arg_45_1)
	if not arg_45_0.stockAddTpl then
		arg_45_0.stockAddContainter = arg_45_0:findTF("frame/top/stockAddCont", arg_45_0.foodPanel)
		arg_45_0.stockAddAddTpl = arg_45_0:findTF("stockAdd", arg_45_0.stockAddContainter)
	end

	local var_45_0 = cloneTplTo(arg_45_0.stockAddAddTpl, arg_45_0.stockAddContainter)

	setText(var_45_0, "+" .. arg_45_1)

	local var_45_1 = var_45_0:GetComponent(typeof(DftAniEvent))

	if var_45_1 then
		var_45_1:SetEndEvent(function(arg_46_0)
			Destroy(arg_46_0)
		end)
	end

	setActive(var_45_0, true)
end

function var_0_0.updateTotalConsume(arg_47_0, arg_47_1)
	arg_47_0.dormClone = nil

	local var_47_0 = arg_47_0.count

	if var_47_0 == 0 then
		return
	end

	arg_47_0.count = 0

	arg_47_0:emit(BackyardGranaryMediator.USE_FOOD, arg_47_1.foodVO.id, var_47_0)
end

function var_0_0.openFoodShop(arg_48_0, arg_48_1)
	arg_48_0.foodMsgBox:Show(arg_48_1, function(arg_49_0)
		if arg_48_0.playerVO[id2res(arg_49_0.resourceType)] < arg_49_0.resourceNum * arg_49_0.count then
			if arg_49_0.resourceType == 4 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			elseif arg_49_0.resourceType == 2 and ItemTipPanel.ShowOilBuyTip(arg_49_0.resourceNum * arg_49_0.count) then
				-- block empty
			else
				local var_49_0 = pg.item_data_statistics[id2ItemId(arg_49_0.resourceType)].name

				pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_error_noResource", var_49_0))
			end

			arg_48_0.foodMsgBox:Hide()

			return
		end

		arg_48_0:emit(BackyardGranaryMediator.BUY_FOOD, arg_49_0.shopId, arg_49_0.count)
		arg_48_0.foodMsgBox:Hide()
	end)
end

function var_0_0.openExtendPanel(arg_50_0)
	local var_50_0 = ShoppingStreet.getRiseShopId(ShopArgs.BackyardFoodExtend, arg_50_0.dormVO.food_extend_count)

	if not var_50_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buy_max_count"))

		return
	end

	arg_50_0.extendPanel:Show(var_50_0, arg_50_0.capacity, function(arg_51_0)
		if arg_50_0.playerVO[id2res(arg_51_0.resType)] < arg_51_0.resCount then
			if arg_51_0.resType == 4 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_error_entendFail"))
			end
		else
			arg_50_0:emit(BackyardGranaryMediator.EXTEND_GRANARY, arg_51_0.shopId, 1)
		end

		arg_50_0.extendPanel:Hide()
	end)
end

function var_0_0.updateDorm(arg_52_0, arg_52_1)
	if not arg_52_1 then
		return
	end

	arg_52_0.stockBar.fillAmount = arg_52_1.food / arg_52_0.capacity
	arg_52_0.stockTxt.text = math.ceil(arg_52_1.food) .. "/" .. arg_52_0.capacity

	arg_52_0:calFoodLeftTime(arg_52_1)
end

function var_0_0.calFoodLeftTime(arg_53_0, arg_53_1)
	if arg_53_0.timer then
		arg_53_0.timer:Stop()

		arg_53_0.timer = nil
	end

	local var_53_0 = table.getCount(arg_53_0.addExpShipVOs)

	local function var_53_1(arg_54_0)
		SetActive(arg_53_0.leftTimeTF, true)
		SetActive(arg_53_0.chatContain, false)
		SetActive(arg_53_0.bottomText, false)
		setText(arg_53_0.leftTimeTF, arg_54_0)
	end

	if arg_53_1.food <= 0 then
		var_53_1(i18n("backyard_backyardGranaryLayer_word"))

		return
	end

	if var_53_0 <= 0 then
		var_53_1(i18n("backyard_backyardGranaryLayer_noShip"))

		return
	end

	SetActive(arg_53_0.leftTimeTF, false)
	SetActive(arg_53_0.chatContain, true)
	SetActive(arg_53_0.bottomText, true)
	setText(findTF(arg_53_0.chatContain, "Text"), i18n("backyard_backyardGranaryLayer_foodTimeNotice_top"))
	setText(arg_53_0.bottomText, i18n("backyard_backyardGranaryLayer_foodTimeNotice_bottom"))

	local var_53_2 = findTF(arg_53_0.chatContain, "time"):GetComponent(typeof(Text))
	local var_53_3 = arg_53_1:getFoodLeftTime()

	arg_53_0.timer = Timer.New(function()
		local var_55_0 = math.ceil(var_53_3) - pg.TimeMgr.GetInstance():GetServerTime()

		var_53_2.text = pg.TimeMgr.GetInstance():DescCDTime(var_55_0)

		if var_55_0 <= 0 then
			arg_53_0.timer:Stop()

			arg_53_0.timer = nil

			var_53_1(i18n("backyard_backyardGranaryLayer_word"))
		end
	end, 1, -1)

	arg_53_0.timer:Start()
end

function var_0_0.willExit(arg_56_0)
	for iter_56_0, iter_56_1 in pairs(arg_56_0.cards) do
		iter_56_1:Dispose()
	end

	if arg_56_0.timer then
		arg_56_0.timer:Stop()

		arg_56_0.timer = nil
	end

	arg_56_0.foodMsgBox:Dispose()
	arg_56_0.extendPanel:Dispose()
	pg.UIMgr.GetInstance():UnblurPanel(arg_56_0.foodPanel, arg_56_0._tf)

	Input.multiTouchEnabled = true
end

return var_0_0
