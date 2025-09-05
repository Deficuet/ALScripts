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
	GetImageSpriteFromAtlasAsync(arg_6_2:GetIcon(), "", arg_6_0.icon)
	setText(arg_6_0.name, arg_6_2:GetName())
	setText(arg_6_0.desc, arg_6_2:GetDescription())
	setActive(arg_6_0.discount, arg_6_2:GetDiscount() ~= 0)
	setText(arg_6_0.discount:Find("Text"), "-" .. arg_6_2:GetDiscount() .. "%")

	local var_6_0 = false

	setActive(arg_6_0.remainTimer, arg_6_2:IsTimeLimitCommodity())

	if var_6_0 then
		local var_6_1 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_6_2 = arg_6_2:getConfig("time")[1]
		local var_6_3 = pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_6_2[1][1],
			month = var_6_2[1][2],
			day = var_6_2[1][3],
			hour = var_6_2[2][1],
			min = var_6_2[2][2],
			sec = var_6_2[2][3]
		})
		local var_6_4 = pg.TimeMgr.GetInstance():DescCDTime(var_6_3 - var_6_1)

		setText(arg_6_0.remainTimer:Find("text"), var_6_4)
	end

	local var_6_5 = "购买数量"

	if arg_6_2:GetMaxNum() ~= 0 then
		local var_6_6 = arg_6_2:GetMaxNum() - arg_6_2.purchasedNum

		var_6_5 = var_6_5 .. "（剩余：" .. var_6_6 .. "）"
	end

	setText(arg_6_0.buyDesc, var_6_5)

	local var_6_7 = arg_6_2:GetMaxNum() - arg_6_2.purchasedNum

	if arg_6_2:GetMaxNum() == 0 then
		var_6_7 = 999
	end

	local var_6_8 = arg_6_2:GetItemsWithPt()
	local var_6_9 = arg_6_2:GetResourceConsume()

	local function var_6_10(arg_7_0)
		arg_7_0 = math.max(arg_7_0, 1)
		arg_7_0 = math.min(arg_7_0, var_6_7)
		arg_6_0.curCount = arg_7_0

		setText(arg_6_0.count, arg_7_0)

		for iter_7_0 = 1, #arg_6_0.itemsCountTFs do
			local var_7_0 = arg_6_0.itemsCountTFs[iter_7_0]

			setText(var_7_0, var_6_8[iter_7_0][3] * arg_6_0.curCount)
		end

		setText(arg_6_0.consumeCount, math.ceil((100 - arg_6_2:GetDiscount()) / 100 * var_6_9[3]) * arg_6_0.curCount)
	end

	onButton(arg_6_0, arg_6_0.leftBtn, function()
		var_6_10(arg_6_0.curCount - 1)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.rightBtn, function()
		var_6_10(arg_6_0.curCount + 1)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.minBtn, function()
		var_6_10(1)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.maxBtn, function()
		var_6_10(var_6_7)
	end, SFX_PANEL)

	arg_6_0.itemsCountTFs = {}

	arg_6_0.bottomItemList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = var_6_8[arg_12_1 + 1]
			local var_12_1 = {
				type = var_12_0[1],
				id = var_12_0[2],
				count = var_12_0[3]
			}

			updateCustomDrop(arg_12_2, var_12_1)
			table.insert(arg_6_0.itemsCountTFs, arg_12_2:Find("icon_bg/count_bg/count"))
		end
	end)
	arg_6_0.bottomItemList:align(#var_6_8)
	var_6_10(1)

	if var_6_9[1] == DROP_TYPE_RESOURCE then
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = var_6_9[1],
			id = var_6_9[2]
		}):getIcon(), "", arg_6_0.consumeIcon)
	elseif var_6_9[1] == DROP_TYPE_ISLAND_ITEM then
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = var_6_9[1],
			id = var_6_9[2]
		}):getIcon(), "", arg_6_0.consumeIcon)
	end

	onButton(arg_6_0, arg_6_0.buyBtn, function()
		local var_13_0 = {
			{
				key = arg_6_1,
				value1 = arg_6_2.id,
				value2 = arg_6_0.curCount
			}
		}

		arg_6_0:emit(IslandMediator.BUY_COMMODITY, var_13_0)
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_14_0, arg_14_1, arg_14_2)
	pg.UIMgr.GetInstance():BlurPanel(arg_14_0._tf, false, {
		groupName = "IslandShop"
	})

	arg_14_0.shopId = arg_14_1
	arg_14_0.commodity = arg_14_2

	arg_14_0:SetUp(arg_14_1, arg_14_2)
end

function var_0_0.Refresh(arg_15_0)
	arg_15_0:SetUp(arg_15_0.shopId, arg_15_0.commodity)
end

function var_0_0.OnHide(arg_16_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_16_0._tf, arg_16_0._parentTf)
end

function var_0_0.OnDestroy(arg_17_0)
	return
end

return var_0_0
