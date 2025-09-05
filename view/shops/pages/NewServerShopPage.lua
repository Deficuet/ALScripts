local var_0_0 = class("NewServerShopPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "NewServerShopPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.scrollrect = arg_2_0:findTF("scrollView"):GetComponent("LScrollRect")
	arg_2_0.resTxt = arg_2_0:findTF("res_pt/Text"):GetComponent(typeof(Text))
	arg_2_0.resIcon = arg_2_0:findTF("res_pt/icon")
	arg_2_0.pagefooters = {
		arg_2_0:findTF("pagefooter/tpl")
	}
	arg_2_0.pagefooterWid = arg_2_0.pagefooters[1].rect.width
	arg_2_0.pagefooterStartPosX = arg_2_0.pagefooters[1].anchoredPosition.x
	arg_2_0.purchasePage = NewServerShopPurchasePanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.multiWindow = NewServerShopMultiWindow.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0.singleWindow = NewServerShopSingleWindow.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0._tf.localPosition = Vector3(-6, -25)
end

function var_0_0.UpdateRes(arg_3_0)
	local var_3_0 = arg_3_0.shop:GetPtId()
	local var_3_1 = getProxy(PlayerProxy):getRawData():getResource(var_3_0)

	arg_3_0.resTxt.text = var_3_1

	if not arg_3_0.isInitResIcon then
		arg_3_0.isInitResIcon = true

		GetImageSpriteFromAtlasAsync(Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_3_0
		}):getIcon(), "", arg_3_0.resIcon)
	end
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.cards = {}

	function arg_4_0.scrollrect.onInitItem(arg_5_0)
		arg_4_0:OnInitItem(arg_5_0)
	end

	function arg_4_0.scrollrect.onUpdateItem(arg_6_0, arg_6_1)
		arg_4_0:OnUpdateItem(arg_6_0, arg_6_1)
	end

	arg_4_0:Flush()
end

function var_0_0.OnInitItem(arg_7_0, arg_7_1)
	local var_7_0 = NewServerGoodsCard.New(arg_7_1)

	onButton(arg_7_0, var_7_0._tf, function()
		arg_7_0:OnClickCard(var_7_0)
	end, SFX_PANEL)

	arg_7_0.cards[arg_7_1] = var_7_0
end

function var_0_0.OnClickCard(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.commodity
	local var_9_1, var_9_2 = var_9_0:IsOpening(arg_9_0.shop:GetStartTime())

	if not var_9_1 then
		local var_9_3 = (var_9_2.day > 0 and var_9_2.day .. i18n("word_date") or "") .. var_9_2.hour .. i18n("word_hour")

		pg.TipsMgr.GetInstance():ShowTips(i18n("newserver_shop_timelimit", var_9_3))

		return
	end

	if var_9_0:Selectable() then
		arg_9_0.purchasePage:ExecuteAction("Show", var_9_0)
	else
		local var_9_4

		if var_9_0:getConfig("goods_purchase_limit") == 1 or var_9_0:getConfig("type") == 4 then
			var_9_4 = arg_9_0.singleWindow
		else
			var_9_4 = arg_9_0.multiWindow
		end

		var_9_4:ExecuteAction("Open", var_9_0, function(arg_10_0, arg_10_1, arg_10_2)
			if not arg_10_0:CanPurchase() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

				return
			end

			pg.m02:sendNotification(GAME.NEW_SERVER_SHOP_SHOPPING, {
				id = arg_10_0.id,
				selectedList = arg_10_0:getConfig("goods"),
				count = arg_10_1
			})
		end)
	end
end

function var_0_0.OnUpdateItem(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_0.cards[arg_11_2] then
		arg_11_0:OnInitItem(arg_11_2)
	end

	local var_11_0 = arg_11_0.cards[arg_11_2]
	local var_11_1 = arg_11_0.displays[arg_11_1 + 1]

	var_11_0:Update(var_11_1, arg_11_0.shop)
end

function var_0_0.FetchShop(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(ShopsProxy):GetNewServerShop(ActivityConst.ACTIVITY_TYPE_NEWSERVER_SHOP)

	if not var_12_0 then
		pg.m02:sendNotification(GAME.GET_NEW_SERVER_SHOP, {
			callback = arg_12_1
		})
	else
		arg_12_1(var_12_0)
	end
end

function var_0_0.SetShop(arg_13_0, arg_13_1)
	arg_13_0.shop = arg_13_1
end

function var_0_0.Flush(arg_14_0)
	if arg_14_0.shop then
		arg_14_0:Show()
		arg_14_0:UpdatePageFooters()
		arg_14_0:UpdateRes()
	else
		arg_14_0:FetchShop(function(arg_15_0)
			if not arg_15_0 then
				return
			end

			arg_14_0.shop = arg_15_0

			arg_14_0:Show()
			arg_14_0:UpdatePageFooters()
			arg_14_0:UpdateRes()
		end)
	end
end

local function var_0_1(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.pagefooters[arg_16_1]

	if not var_16_0 then
		local var_16_1 = arg_16_0.pagefooters[1]

		var_16_0 = Object.Instantiate(var_16_1, var_16_1.parent)
		arg_16_0.pagefooters[arg_16_1] = var_16_0
	end

	setActive(var_16_0, true)

	return var_16_0
end

function var_0_0.UpdatePageFooters(arg_17_0)
	local var_17_0 = arg_17_0.shop:GetPhases()

	arg_17_0.pagefooterTrs = {}

	for iter_17_0 = 1, #var_17_0 do
		local var_17_1 = var_0_1(arg_17_0, iter_17_0)

		arg_17_0:UpdatePageFooter(var_17_1, iter_17_0)

		arg_17_0.pagefooterTrs[iter_17_0] = var_17_1
	end

	for iter_17_1 = #var_17_0 + 1, #arg_17_0.pagefooters do
		setActive(arg_17_0.pagefooters[iter_17_1], false)
	end

	local var_17_2 = arg_17_0.contextData.index or 1

	triggerButton(arg_17_0.pagefooterTrs[var_17_2])
end

local var_0_2 = 0

function var_0_0.UpdatePageFooter(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.pagefooterStartPosX + (var_0_2 + arg_18_0.pagefooterWid) * (arg_18_2 - 1)

	setAnchoredPosition(arg_18_1, {
		x = var_18_0
	})

	local var_18_1 = GetSpriteFromAtlas("ui/newservershopui_atlas", "p" .. arg_18_2)

	arg_18_1:Find("Text"):GetComponent(typeof(Image)).sprite = var_18_1

	local var_18_2 = GetSpriteFromAtlas("ui/newservershopui_atlas", "p" .. arg_18_2 .. "_s")

	arg_18_1:Find("mark"):GetComponent(typeof(Image)).sprite = var_18_2

	local var_18_3 = arg_18_1:Find("lock")

	if arg_18_2 ~= 1 then
		local var_18_4 = GetSpriteFromAtlas("ui/newservershopui_atlas", "p" .. arg_18_2 .. "_l")

		var_18_3:GetComponent(typeof(Image)).sprite = var_18_4
	end

	setActive(var_18_3, not arg_18_0.shop:IsOpenPhase(arg_18_2))
	setActive(arg_18_1:Find("tip"), arg_18_0:isPhaseTip(arg_18_2))
	arg_18_0:OnSwitch(arg_18_1, function()
		return arg_18_0.openIndex ~= arg_18_2
	end, function()
		arg_18_0:SwitchPhase(arg_18_2)
		setActive(arg_18_1:Find("tip"), arg_18_0:isPhaseTip(arg_18_2))
	end)
end

function var_0_0.OnSwitch(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = arg_21_1:Find("mark")

	local function var_21_1()
		if arg_21_0.markTr then
			setActive(arg_21_0.markTr, false)
		end

		arg_21_0.markTr = var_21_0

		setActive(var_21_0, true)
	end

	onButton(arg_21_0, arg_21_1, function()
		if not arg_21_2() then
			return
		end

		var_21_1()
		arg_21_3()
	end, SFX_PANEL)
end

function var_0_0.SwitchPhase(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.shop
	local var_24_1 = var_24_0:GetPhases()[arg_24_1]

	arg_24_0.displays = var_24_0:GetOpeningGoodsList(var_24_1)

	table.sort(arg_24_0.displays, function(arg_25_0, arg_25_1)
		local var_25_0 = arg_25_0:CanPurchase() and 1 or 0
		local var_25_1 = arg_25_1:CanPurchase() and 1 or 0

		if var_25_0 == var_25_1 then
			return arg_25_0.id < arg_25_1.id
		else
			return var_25_1 < var_25_0
		end
	end)
	arg_24_0.scrollrect:SetTotalCount(#arg_24_0.displays)

	arg_24_0.openIndex = arg_24_1

	arg_24_0:updateLocalRedDotData(arg_24_1)
end

function var_0_0.Refresh(arg_26_0)
	arg_26_0:SwitchPhase(arg_26_0.openIndex)
	arg_26_0:UpdateRes()
end

function var_0_0.isPhaseTip(arg_27_0, arg_27_1)
	if not arg_27_0.playerId then
		arg_27_0.playerId = getProxy(PlayerProxy):getData().id
	end

	return arg_27_1 ~= 1 and arg_27_0.shop:IsOpenPhase(arg_27_1) and PlayerPrefs.GetInt("newserver_shop_phase_" .. arg_27_1 .. "_" .. arg_27_0.playerId) == 0
end

function var_0_0.updateLocalRedDotData(arg_28_0, arg_28_1)
	if arg_28_0:isPhaseTip(arg_28_1) then
		PlayerPrefs.SetInt("newserver_shop_phase_" .. arg_28_1 .. "_" .. arg_28_0.playerId, 1)
		arg_28_0:emit(NewServerCarnivalMediator.UPDATE_SHOP_RED_DOT)
	end
end

function var_0_0.isTip(arg_29_0)
	if not arg_29_0.playerId then
		arg_29_0.playerId = getProxy(PlayerProxy):getData().id
	end

	if PlayerPrefs.GetInt("newserver_shop_first_" .. arg_29_0.playerId) == 0 then
		return true
	end

	for iter_29_0, iter_29_1 in pairs(arg_29_0.shop:GetPhases()) do
		if arg_29_0:isPhaseTip(iter_29_0) then
			return true
		end
	end

	return false
end

function var_0_0.OnDestroy(arg_30_0)
	arg_30_0.scrollrect.onInitItem = nil
	arg_30_0.scrollrect.onUpdateItem = nil

	for iter_30_0, iter_30_1 in pairs(arg_30_0.cards) do
		iter_30_1:Dispose()
	end

	arg_30_0.cards = nil

	arg_30_0.purchasePage:Destroy()

	arg_30_0.purchasePage = nil

	arg_30_0.multiWindow:Destroy()

	arg_30_0.multiWindow = nil

	arg_30_0.singleWindow:Destroy()

	arg_30_0.singleWindow = nil

	var_0_0.super.OnDestroy(arg_30_0)
end

return var_0_0
