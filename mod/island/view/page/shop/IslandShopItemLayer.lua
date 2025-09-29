local var_0_0 = class("IslandShopItemLayer", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShopItemUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.panel = arg_2_0:findTF("panel")
	arg_2_0.closeBtn = arg_2_0:findTF("closeBtn", arg_2_0.panel)
	arg_2_0.icon = arg_2_0:findTF("icon", arg_2_0.panel)
	arg_2_0.discount = arg_2_0:findTF("discount", arg_2_0.panel)
	arg_2_0.remainTimer = arg_2_0:findTF("remainTimer", arg_2_0.panel)
	arg_2_0.name = arg_2_0:findTF("name", arg_2_0.panel)
	arg_2_0.desc = arg_2_0:findTF("desc", arg_2_0.panel)
	arg_2_0.buyDesc = arg_2_0:findTF("buyDesc", arg_2_0.panel)
	arg_2_0.count = arg_2_0:findTF("count/number_panel/value", arg_2_0.panel)
	arg_2_0.leftBtn = arg_2_0:findTF("count/left", arg_2_0.panel)
	arg_2_0.rightBtn = arg_2_0:findTF("count/right", arg_2_0.panel)
	arg_2_0.minBtn = arg_2_0:findTF("count/min", arg_2_0.panel)
	arg_2_0.maxBtn = arg_2_0:findTF("count/max", arg_2_0.panel)
	arg_2_0.bottomItemList = UIItemList.New(arg_2_0:findTF("itemList/Viewport/Content", arg_2_0.panel), arg_2_0:findTF("itemList/Viewport/Content/IslandItemTpl", arg_2_0.panel))
	arg_2_0.buyBtn = arg_2_0:findTF("buyBtn", arg_2_0.panel)
	arg_2_0.consumeIcon = arg_2_0:findTF("consume/icon", arg_2_0.buyBtn)
	arg_2_0.consumeCount = arg_2_0:findTF("consume/count", arg_2_0.buyBtn)

	setText(arg_2_0._tf:Find("panel/title"), i18n("island_3Dshop_buy_confirm"))
	setText(arg_2_0._tf:Find("panel/buyBtn/text"), i18n("island_3Dshop_buy"))
	setText(arg_2_0._tf:Find("panel/getDesc"), i18n("island_3Dshop_buy_tip0"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.SetUp(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.charaId then
		GetImageSpriteFromAtlasAsync("island/islandshipiconall/" .. arg_6_0.charaId, "", arg_6_0.icon)
	else
		GetImageSpriteFromAtlasAsync(arg_6_2:GetIcon(), "", arg_6_0.icon)
	end

	setText(arg_6_0.name, arg_6_2:GetName())
	setText(arg_6_0.desc, arg_6_2:GetDescription())
	setActive(arg_6_0.discount, arg_6_2:GetDiscount() ~= 0)
	setText(arg_6_0.discount:Find("Text"), "-" .. arg_6_2:GetDiscount() .. "%")

	local var_6_0 = arg_6_2:IsTimeLimitCommodity()

	setActive(arg_6_0.remainTimer, var_6_0)

	if var_6_0 then
		local var_6_1 = arg_6_2:getConfig("time")[2]
		local var_6_2 = pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_6_1[1][1],
			month = var_6_1[1][2],
			day = var_6_1[1][3],
			hour = var_6_1[2][1],
			min = var_6_1[2][2],
			sec = var_6_1[2][3]
		})
		local var_6_3 = 86400

		arg_6_0:StartTimer(function()
			local var_7_0 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_7_1 = var_6_2 - var_7_0

			if var_7_1 < var_6_3 then
				local var_7_2 = pg.TimeMgr.GetInstance():DescCDTime(var_7_1)

				setText(arg_6_0.remainTimer:Find("text"), var_7_2)
			else
				setText(arg_6_0.remainTimer:Find("text"), i18n("island_3Dshop_goods_time", math.floor(var_7_1 / var_6_3)))
			end
		end)
	end

	local var_6_4 = i18n("island_3Dshop_buy_no")

	if arg_6_2:GetMaxNum() ~= 0 then
		local var_6_5 = arg_6_2:GetMaxNum() - arg_6_2.purchasedNum

		var_6_4 = var_6_4 .. i18n("island_3Dshop_last", var_6_5)
	end

	setText(arg_6_0.buyDesc, var_6_4)

	local var_6_6 = arg_6_2:GetMaxNum() - arg_6_2.purchasedNum

	if arg_6_2:GetMaxNum() == 0 then
		var_6_6 = 999
	end

	local var_6_7 = arg_6_2:GetItemsWithPt()
	local var_6_8 = arg_6_2:GetResourceConsume()

	local function var_6_9(arg_8_0)
		arg_8_0 = math.max(arg_8_0, 1)
		arg_8_0 = math.min(arg_8_0, var_6_6)
		arg_6_0.curCount = arg_8_0

		setText(arg_6_0.count, arg_8_0)

		for iter_8_0 = 1, #arg_6_0.itemsCountTFs do
			local var_8_0 = arg_6_0.itemsCountTFs[iter_8_0]

			setText(var_8_0, var_6_7[iter_8_0][3] * arg_6_0.curCount)
		end

		setText(arg_6_0.consumeCount, math.ceil((100 - arg_6_2:GetDiscount()) / 100 * var_6_8[3]) * arg_6_0.curCount)
	end

	onButton(arg_6_0, arg_6_0.leftBtn, function()
		var_6_9(arg_6_0.curCount - 1)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.rightBtn, function()
		var_6_9(arg_6_0.curCount + 1)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.minBtn, function()
		var_6_9(1)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.maxBtn, function()
		var_6_9(var_6_6)
	end, SFX_PANEL)

	arg_6_0.itemsCountTFs = {}

	arg_6_0.bottomItemList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = var_6_7[arg_13_1 + 1]
			local var_13_1 = {
				type = var_13_0[1],
				id = var_13_0[2],
				count = var_13_0[3]
			}

			updateCustomDrop(arg_13_2, var_13_1, {
				style = "island"
			})
			table.insert(arg_6_0.itemsCountTFs, arg_13_2:Find("icon_bg/count_bg/count"))
		end
	end)
	arg_6_0.bottomItemList:align(#var_6_7)
	var_6_9(1)

	if var_6_8[1] == DROP_TYPE_RESOURCE then
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = var_6_8[1],
			id = var_6_8[2]
		}):getIcon(), "", arg_6_0.consumeIcon)
	elseif var_6_8[1] == DROP_TYPE_ISLAND_ITEM then
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = var_6_8[1],
			id = var_6_8[2]
		}):getIcon(), "", arg_6_0.consumeIcon)
	end

	onButton(arg_6_0, arg_6_0.buyBtn, function()
		local var_14_0 = {
			{
				key = arg_6_1,
				value1 = arg_6_2.id,
				value2 = arg_6_0.curCount
			}
		}

		arg_6_0:emit(IslandMediator.BUY_COMMODITY, var_14_0)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_15_0)
	arg_15_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_15_0.Hide)
end

function var_0_0.RemoveListeners(arg_16_0)
	arg_16_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_16_0.Hide)
end

function var_0_0.OnShow(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	arg_17_0:BlurPanel(arg_17_0._tf)

	arg_17_0.shopId = arg_17_1
	arg_17_0.commodity = arg_17_2

	arg_17_0:SetUp(arg_17_1, arg_17_2)

	if arg_17_3 then
		arg_17_0.charaId = arg_17_3
	end
end

function var_0_0.Refresh(arg_18_0)
	arg_18_0:SetUp(arg_18_0.shopId, arg_18_0.commodity)
end

function var_0_0.StartTimer(arg_19_0, arg_19_1)
	arg_19_0.timer = Timer.New(arg_19_1, 1, -1)

	arg_19_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_20_0)
	if arg_20_0.timer then
		arg_20_0.timer:Stop()

		arg_20_0.timer = nil
	end
end

function var_0_0.OnHide(arg_21_0)
	arg_21_0:RemoveTimer()
	arg_21_0:UnOverlayPanel(arg_21_0._tf, arg_21_0._parentTf)
end

function var_0_0.OnDestroy(arg_22_0)
	return
end

return var_0_0
