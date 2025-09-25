local var_0_0 = class("ZumaPTShopWindowLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ZumaPTShopWindowUI"
end

function var_0_0.init(arg_2_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:updateGoodInfoPanel()
	arg_3_0:updateBuyPanelWithNum(1)
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
	arg_4_0.pageUtil:Dispose()
end

function var_0_0.onBackPressed(arg_5_0)
	arg_5_0:closeView()
end

function var_0_0.initData(arg_6_0)
	arg_6_0.actShopVO = arg_6_0.contextData.actShopVO
	arg_6_0.goodVO = arg_6_0.contextData.goodVO
	arg_6_0.perCost = arg_6_0.goodVO:getConfig("resource_num")
	arg_6_0.maxBuyCount = math.floor(Drop.New({
		type = arg_6_0.goodVO:getConfig("resource_category"),
		id = arg_6_0.goodVO:getConfig("resource_type")
	}):getOwnedCount() / arg_6_0.perCost)

	if arg_6_0.goodVO:getConfig("num_limit") ~= 0 then
		arg_6_0.maxBuyCount = math.min(arg_6_0.maxBuyCount, math.max(arg_6_0.goodVO:GetPurchasableCnt(), 0))
	end

	arg_6_0.curBuyCount = 1
	arg_6_0.costItemInfo = Drop.New({
		type = arg_6_0.goodVO:getConfig("resource_category"),
		id = arg_6_0.goodVO:getConfig("resource_type")
	})
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.bg = arg_7_0:findTF("BG")

	local var_7_0 = arg_7_0:findTF("Panel")
	local var_7_1 = arg_7_0:findTF("Info", var_7_0)

	arg_7_0.nameText = arg_7_0:findTF("Name/Text", var_7_1)
	arg_7_0.descText = arg_7_0:findTF("Desc", var_7_1)
	arg_7_0.itemTF = arg_7_0:findTF("CommonItemTemplate", var_7_1)
	arg_7_0.countTF = arg_7_0:findTF("Count", var_7_1)
	arg_7_0.countText = arg_7_0:findTF("Count/Num", var_7_1)

	local var_7_2 = arg_7_0:findTF("Count/Tip", var_7_1)

	setText(var_7_2, i18n("word_own1"))

	arg_7_0.titleTF = arg_7_0:findTF("Title", var_7_0)

	local var_7_3 = arg_7_0:findTF("Buy", var_7_0)

	arg_7_0.minusBtn = arg_7_0:findTF("Minus", var_7_3)
	arg_7_0.addBtn = arg_7_0:findTF("Add", var_7_3)
	arg_7_0.maxBtn = arg_7_0:findTF("Max", var_7_3)
	arg_7_0.buyNumText = arg_7_0:findTF("Num", var_7_3)
	arg_7_0.butCountText = arg_7_0:findTF("BuyCount/Num", var_7_0)
	arg_7_0.costNumText = arg_7_0:findTF("Cost/Num", var_7_0)
	arg_7_0.confirmBtn = arg_7_0:findTF("ConfirmBtn", var_7_0)
	arg_7_0.cancelBtn = arg_7_0:findTF("CancelBtn", var_7_0)
end

function var_0_0.addListener(arg_8_0)
	local function var_8_0()
		arg_8_0:closeView()
	end

	onButton(arg_8_0, arg_8_0.bg, var_8_0, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.cancelBtn, var_8_0, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.confirmBtn, function()
		if arg_8_0.curBuyCount > arg_8_0.maxBuyCount then
			pg.TipsMgr.GetInstance():ShowTips(i18n("islandshop_tips4", arg_8_0.costItemInfo:getName()))

			return
		end

		pg.m02:sendNotification(GAME.ISLAND_SHOPPING, {
			shop = arg_8_0.actShopVO,
			arg1 = arg_8_0.goodVO.id,
			arg2 = arg_8_0.curBuyCount
		})
	end, SFX_CANCEL)

	arg_8_0.pageUtil = PageUtil.New(arg_8_0.minusBtn, arg_8_0.addBtn, arg_8_0.maxBtn, arg_8_0.butCountText)

	arg_8_0.pageUtil:setNumUpdate(function(arg_11_0)
		arg_8_0:updateBuyPanelWithNum(arg_11_0)
	end)
	arg_8_0.pageUtil:setAddNum(1)
	arg_8_0.pageUtil:setMaxNum(math.max(arg_8_0.maxBuyCount, 1))
	arg_8_0.pageUtil:setDefaultNum(1)
end

function var_0_0.updateGoodInfoPanel(arg_12_0)
	local var_12_0 = arg_12_0.goodVO
	local var_12_1 = Drop.New({
		type = var_12_0:getConfig("commodity_type"),
		id = var_12_0:getConfig("commodity_id"),
		count = var_12_0:getConfig("num")
	})

	updateDrop(arg_12_0.itemTF, var_12_1)

	local var_12_2, var_12_3 = var_12_1:getOwnedCount()

	setActive(arg_12_0.countTF, var_12_3)

	if var_12_3 then
		setText(arg_12_0.countText, var_12_2)
	end

	setText(arg_12_0.nameText, var_12_1:getConfig("name"))
	setText(arg_12_0.descText, string.gsub(var_12_1.desc or var_12_1:getConfig("desc"), "<[^>]+>", ""))
end

function var_0_0.updateBuyPanelWithNum(arg_13_0, arg_13_1)
	arg_13_0.curBuyCount = arg_13_1 or 0

	setText(arg_13_0.buyNumText, arg_13_0.curBuyCount)
	setText(arg_13_0.butCountText, arg_13_0.curBuyCount)
	setText(arg_13_0.costNumText, arg_13_0.curBuyCount * arg_13_0.perCost)
end

return var_0_0
