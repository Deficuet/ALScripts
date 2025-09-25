local var_0_0 = class("IslandSeasonShopPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonShopPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("content")

	arg_2_0.lockTF = var_2_0:Find("view/lock")
	arg_2_0.goodUIList = UIItemList.New(var_2_0:Find("view/content"), var_2_0:Find("view/content/tpl"))

	local var_2_1 = var_2_0:Find("toggles")

	arg_2_0.togglesUIList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.shopIds = arg_3_0.contextData.season:getConfig("shop_id")

	arg_3_0.togglesUIList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventInit then
			arg_4_2.name = arg_4_1 + 1

			setText(arg_4_2:Find("unsel/Text"), i18n("island_season_shop_stage" .. arg_4_1 + 1))
			setText(arg_4_2:Find("sel/Text"), i18n("island_season_shop_stage" .. arg_4_1 + 1))
			onToggle(arg_3_0, arg_4_2, function(arg_5_0)
				if arg_5_0 then
					arg_3_0.showPhase = arg_4_1 + 1

					arg_3_0:Flush()
				end
			end, SFX_PANEL)
		end
	end)
	arg_3_0.togglesUIList:align(#arg_3_0.shopIds)
	arg_3_0.goodUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateGood(arg_6_1, arg_6_2)
		end
	end)
end

function var_0_0.Show(arg_7_0)
	var_0_0.super.Show(arg_7_0)

	arg_7_0.showPhase = 1

	triggerToggle(arg_7_0.togglesUIList.container:GetChild(0), true)
	IslandGuideChecker.CheckGuide("ISLAND_GUIDE_18")
end

function var_0_0.UpdateGood(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.displaysGoods[arg_8_1 + 1]

	arg_8_2.name = var_8_0.id

	setText(arg_8_2:Find("name"), var_8_0:GetName())

	if #var_8_0:GetItems() == 1 then
		local var_8_1 = var_8_0:GetItems()[1]
		local var_8_2 = {
			type = var_8_1[1],
			id = var_8_1[2],
			count = var_8_1[3]
		}

		updateCustomDrop(arg_8_2:Find("IslandItemTpl"), var_8_2)
	else
		GetImageSpriteFromAtlasAsync("island/" .. var_8_0:GetIcon(), "", arg_8_2:Find("IslandItemTpl/icon_bg/icon"))
	end

	local var_8_3 = var_8_0:GetResourceConsume()

	GetImageSpriteFromAtlasAsync(Drop.New({
		type = var_8_3[1],
		id = var_8_3[2]
	}):getIcon(), "", arg_8_2:Find("cost/icon"))
	setText(arg_8_2:Find("cost/num"), math.ceil((100 - var_8_0:GetDiscount()) / 100 * var_8_3[3]))
	setActive(arg_8_2:Find("IslandItemTpl/icon_bg/count_bg"), var_8_0:IsShowPurchaseLimit())

	local var_8_4 = var_8_0:GetMaxNum() - var_8_0.purchasedNum

	setText(arg_8_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_8_4 .. "/" .. var_8_0:GetMaxNum())
	setActive(arg_8_2:Find("sellOut"), var_8_0:GetMaxNum() ~= 0 and var_8_4 == 0)
	setActive(arg_8_2:Find("timeLimit"), var_8_0:IsTimeLimitCommodity())
	setActive(arg_8_2:Find("discount"), var_8_0:GetDiscount() ~= 0)
	setText(arg_8_2:Find("discount/Text"), "-" .. var_8_0:GetDiscount() .. "%")

	local var_8_5 = arg_8_0.inventoryAgency:GetOwnCount(var_8_0:GetItems()[1][2])

	setActive(arg_8_2:Find("have"), var_8_0:IsShowHave())
	setText(arg_8_2:Find("have"), i18n("island_word_own", var_8_5))
	setActive(arg_8_2:Find("hold"), var_8_0:IsShowHold() and (var_8_5 > 0 or var_8_0:IsCharacterInviteItemHold()))
	setActive(arg_8_2:Find("cost"), not isActive(arg_8_2:Find("hold")))
	setActive(arg_8_2:Find("notInTime"), not arg_8_0.displayShop:IsInTime())

	if isActive(arg_8_2:Find("sellOut")) or isActive(arg_8_2:Find("hold")) or isActive(arg_8_2:Find("notInTime")) then
		removeOnButton(arg_8_2)
	else
		onButton(arg_8_0, arg_8_2, function()
			arg_8_0.contextData.openBuyLayer(arg_8_0.displayShop.id, var_8_0)
		end, SFX_PANEL)
	end
end

function var_0_0.Flush(arg_10_0)
	arg_10_0.inventoryAgency = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	arg_10_0.shops = getProxy(IslandProxy):GetIsland():GetShopAgency():GetSeasonShops()

	local var_10_0 = arg_10_0.shopIds[arg_10_0.showPhase or 1]

	arg_10_0.displayShop = arg_10_0.shops[var_10_0]

	local var_10_1 = pg.TimeMgr.GetInstance()
	local var_10_2 = arg_10_0.displayShop:GetExistTime()
	local var_10_3 = var_10_1:inTime(var_10_2)

	setActive(arg_10_0.lockTF, not var_10_3)

	if not var_10_3 then
		local var_10_4 = var_10_1:DescDateFromConfig(var_10_2[1]) .. "~" .. var_10_1:DescDateFromConfig(var_10_2[2])

		setText(arg_10_0.lockTF:Find("layout/Text"), var_10_4)
	end

	arg_10_0.displaysGoods = arg_10_0.displayShop:GetCommodities()

	arg_10_0.goodUIList:align(#arg_10_0.displaysGoods)
	setActive(arg_10_0.lockTF, not arg_10_0.displayShop:IsInTime())
end

function var_0_0.OnDestroy(arg_11_0)
	return
end

return var_0_0
