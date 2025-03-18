local var_0_0 = class("ActivityShopPage", import(".BaseShopPage"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)

	arg_1_0.scrollRectSpecial = arg_1_5
end

function var_0_0.getUIName(arg_2_0)
	return "ActivityShop"
end

function var_0_0.GetPaintingName(arg_3_0)
	assert(arg_3_0.shop)

	local var_3_0 = pg.activity_template[arg_3_0.shop.activityId]
	local var_3_1 = getProxy(ActivityProxy):checkHxActivity(arg_3_0.shop.activityId)

	if var_3_0 and var_3_0.config_client then
		if var_3_0.config_client.use_secretary or var_3_1 then
			local var_3_2 = getProxy(PlayerProxy):getData()
			local var_3_3 = getProxy(SettingsProxy):getCurrentSecretaryIndex()

			arg_3_0.tempFlagShip = getProxy(BayProxy):getShipById(var_3_2.characters[1])

			return arg_3_0.tempFlagShip:getPainting(), true, "build"
		elseif var_3_0.config_client.painting then
			return var_3_0.config_client.painting
		end
	end

	return "aijiang_pt"
end

function var_0_0.GetBg(arg_4_0, arg_4_1)
	return (arg_4_1:getBgPath())
end

function var_0_0.GetPaintingEnterVoice(arg_5_0)
	local var_5_0, var_5_1, var_5_2 = arg_5_0.shop:GetEnterVoice()

	return var_5_1, var_5_0, var_5_2
end

function var_0_0.GetPaintingCommodityUpdateVoice(arg_6_0)
	local var_6_0, var_6_1, var_6_2 = arg_6_0.shop:GetPurchaseVoice()

	return var_6_1, var_6_0, var_6_2
end

function var_0_0.GetPaintingAllPurchaseVoice(arg_7_0)
	local var_7_0, var_7_1, var_7_2 = arg_7_0.shop:GetPurchaseAllVoice()

	return var_7_1, var_7_0, var_7_2
end

function var_0_0.GetPaintingTouchVoice(arg_8_0)
	local var_8_0, var_8_1, var_8_2 = arg_8_0.shop:GetTouchVoice()

	return var_8_1, var_8_0, var_8_2
end

function var_0_0.OnLoaded(arg_9_0)
	local var_9_0 = arg_9_0:findTF("res_battery"):GetComponent(typeof(Image))
	local var_9_1 = arg_9_0:findTF("res_battery/icon"):GetComponent(typeof(Image))
	local var_9_2 = arg_9_0:findTF("res_battery/Text"):GetComponent(typeof(Text))
	local var_9_3 = arg_9_0:findTF("res_battery/label"):GetComponent(typeof(Text))
	local var_9_4 = arg_9_0:findTF("res_battery1"):GetComponent(typeof(Image))
	local var_9_5 = arg_9_0:findTF("res_battery1/icon"):GetComponent(typeof(Image))
	local var_9_6 = arg_9_0:findTF("res_battery1/Text"):GetComponent(typeof(Text))
	local var_9_7 = arg_9_0:findTF("res_battery1/label"):GetComponent(typeof(Text))

	arg_9_0.resTrList = {
		{
			var_9_0,
			var_9_1,
			var_9_2,
			var_9_3
		},
		{
			var_9_4,
			var_9_5,
			var_9_6,
			var_9_7
		}
	}
	arg_9_0.eventResCnt = arg_9_0:findTF("event_res_battery/Text"):GetComponent(typeof(Text))
	arg_9_0.time = arg_9_0:findTF("Text"):GetComponent(typeof(Text))

	if arg_9_0.scrollRectSpecial then
		arg_9_0.groupList = UIItemList.New(arg_9_0:findTF("viewport/view", arg_9_0.scrollRectSpecial), arg_9_0:findTF("viewport/view/group", arg_9_0.scrollRectSpecial))
	end
end

function var_0_0.OnInit(arg_10_0)
	return
end

function var_0_0.OnUpdatePlayer(arg_11_0)
	if arg_11_0.shop:IsEventShop() then
		local var_11_0 = arg_11_0.shop:getResId()

		arg_11_0.eventResCnt.text = arg_11_0.player:getResource(var_11_0)
	else
		local var_11_1 = arg_11_0.shop:GetResList()

		for iter_11_0, iter_11_1 in pairs(arg_11_0.resTrList) do
			local var_11_2 = iter_11_1[1]
			local var_11_3 = iter_11_1[2]
			local var_11_4 = iter_11_1[3]
			local var_11_5 = var_11_1[iter_11_0]

			setActive(var_11_2, var_11_5 ~= nil)

			if var_11_5 ~= nil then
				var_11_4.text = arg_11_0.player:getResource(var_11_5)
			end
		end
	end
end

function var_0_0.OnSetUp(arg_12_0)
	arg_12_0:SetResIcon()
	arg_12_0:UpdateTip()
end

function var_0_0.OnUpdateAll(arg_13_0)
	arg_13_0:InitCommodities()
end

function var_0_0.OnUpdateCommodity(arg_14_0, arg_14_1)
	local var_14_0

	for iter_14_0, iter_14_1 in pairs(arg_14_0.cards) do
		if iter_14_1.goodsVO.id == arg_14_1.id then
			var_14_0 = iter_14_1

			break
		end
	end

	if var_14_0 then
		local var_14_1, var_14_2, var_14_3 = arg_14_0.shop:getBgPath()

		var_14_0:update(arg_14_1, nil, var_14_2, var_14_3)
	end
end

function var_0_0.SetResIcon(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.shop:GetResList()

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.resTrList) do
		local var_15_1 = iter_15_1[1]
		local var_15_2 = iter_15_1[2]
		local var_15_3 = iter_15_1[3]
		local var_15_4 = iter_15_1[4]
		local var_15_5 = var_15_0[iter_15_0]

		if var_15_5 ~= nil then
			local var_15_6 = Drop.New({
				type = arg_15_1 or DROP_TYPE_RESOURCE,
				id = var_15_5
			})

			GetSpriteFromAtlasAsync(var_15_6:getIcon(), "", function(arg_16_0)
				var_15_2.sprite = arg_16_0
			end)

			var_15_4.text = var_15_6:getName()
		end
	end

	local var_15_7 = arg_15_0.shop:IsEventShop()

	setActive(arg_15_0:findTF("res_battery"), not var_15_7)
	setActive(arg_15_0:findTF("res_battery1"), not var_15_7 and #var_15_0 > 1)
	setActive(arg_15_0:findTF("event_res_battery"), var_15_7)
end

function var_0_0.UpdateTip(arg_17_0)
	local var_17_0 = #arg_17_0.shop:GetResList() > 1 and 25 or 27

	arg_17_0.time.text = "<size=" .. var_17_0 .. ">" .. i18n("activity_shop_lable", arg_17_0.shop:getOpenTime()) .. "</size>"
end

function var_0_0.OnInitItem(arg_18_0, arg_18_1)
	local var_18_0 = ActivityGoodsCard.New(arg_18_1)

	var_18_0.tagImg.raycastTarget = false

	onButton(arg_18_0, var_18_0.tr, function()
		arg_18_0:OnClickCommodity(var_18_0.goodsVO, function(arg_20_0, arg_20_1)
			arg_18_0:OnPurchase(arg_20_0, arg_20_1)
		end)
	end, SFX_PANEL)

	arg_18_0.cards[arg_18_1] = var_18_0
end

function var_0_0.OnUpdateItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.cards[arg_21_2]

	if not var_21_0 then
		arg_21_0:OnInitItem(arg_21_2)

		var_21_0 = arg_21_0.cards[arg_21_2]
	end

	local var_21_1 = arg_21_0.displays[arg_21_1 + 1]
	local var_21_2, var_21_3, var_21_4 = arg_21_0.shop:getBgPath()

	var_21_0:update(var_21_1, nil, var_21_3, var_21_4)
end

function var_0_0.TipPurchase(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	local var_22_0, var_22_1 = arg_22_1:GetTranCntWhenFull(arg_22_2)

	if var_22_0 > 0 then
		local var_22_2 = math.max(arg_22_2 - var_22_0, 0)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("pt_shop_tran_tip", var_22_2, arg_22_3, var_22_0 * var_22_1.count, var_22_1:getConfig("name")),
			onYes = arg_22_4
		})
	else
		arg_22_4()
	end
end

function var_0_0.OnPurchase(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_1:getConfig("commodity_type")
	local var_23_1 = arg_23_1:getConfig("commodity_id")

	if var_23_0 == DROP_TYPE_ITEM then
		local var_23_2 = getProxy(BagProxy):RawGetItemById(var_23_1)

		if var_23_2 and var_23_2:IsShipExpType() and var_23_2:IsMaxCnt() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("item_is_max_cnt"))

			return
		end
	end

	local var_23_3 = arg_23_0.shop.activityId

	arg_23_0:emit(NewShopsMediator.ON_ACT_SHOPPING, var_23_3, 1, arg_23_1.id, arg_23_2)
end

function var_0_0.OnClickCommodity(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_1:CheckCntLimit()

	if not var_24_0 then
		return
	end

	if var_24_0 and not arg_24_1:CheckArgLimit() then
		local var_24_1, var_24_2, var_24_3, var_24_4 = arg_24_1:CheckArgLimit()

		if var_24_2 == ShopArgs.LIMIT_ARGS_META_SHIP_EXISTENCE then
			local var_24_5 = ShipGroup.getDefaultShipConfig(var_24_4) or {}

			pg.TipsMgr.GetInstance():ShowTips(i18n("meta_shop_exchange_limit_tip", var_24_5.name or ""))
		elseif var_24_2 == ShopArgs.LIMIT_ARGS_SALE_START_TIME then
			local var_24_6 = {
				year = var_24_4[1][1],
				month = var_24_4[1][2],
				day = var_24_4[1][3],
				hour = var_24_4[2][1],
				min = var_24_4[2][2],
				sec = var_24_4[2][3]
			}

			pg.TipsMgr.GetInstance():ShowTips(i18n("meta_shop_exchange_limit_2_tip", var_24_6.year, var_24_6.month, var_24_6.day, var_24_6.hour, var_24_6.min, var_24_6.sec))
		end

		return
	end

	var_0_0.super.OnClickCommodity(arg_24_0, arg_24_1, arg_24_2)
end

function var_0_0.Show(arg_25_0)
	local var_25_0 = pg.activity_template[arg_25_0.shop.activityId]

	if var_25_0 and var_25_0.config_client and var_25_0.config_client.category then
		setActive(go(arg_25_0.lScrollrect), false)
		setActive(arg_25_0.scrollRectSpecial, true)
		arg_25_0.groupList:make(function(arg_26_0, arg_26_1, arg_26_2)
			if arg_26_0 == UIItemList.EventUpdate then
				local var_26_0 = arg_25_0.splitCommodities[arg_26_1 + 1]

				setText(arg_26_2:Find("title/name"), i18n(arg_25_0.spiltNameCodes[arg_26_1 + 1]))

				local var_26_1 = UIItemList.New(arg_26_2:Find("items"), arg_26_2:Find("items/ActivityShopTpl"))

				var_26_1:make(function(arg_27_0, arg_27_1, arg_27_2)
					if arg_27_0 == UIItemList.EventUpdate then
						local var_27_0 = ActivityGoodsCard.New(arg_27_2)

						arg_25_0.cards[arg_27_2] = var_27_0
						var_27_0.tagImg.raycastTarget = false

						onButton(arg_25_0, var_27_0.tr, function()
							arg_25_0:OnClickCommodity(var_27_0.goodsVO, function(arg_29_0, arg_29_1)
								arg_25_0:OnPurchase(arg_29_0, arg_29_1)
							end)
						end, SFX_PANEL)

						local var_27_1 = var_26_0[arg_27_1 + 1]
						local var_27_2, var_27_3, var_27_4 = arg_25_0.shop:getBgPath()

						var_27_0:update(var_27_1, nil, var_27_3, var_27_4)
					end
				end)
				var_26_1:align(#var_26_0)
			end
		end)
		arg_25_0.groupList:align(#arg_25_0.splitCommodities)

		arg_25_0.canvasGroup.alpha = 1
		arg_25_0.canvasGroup.blocksRaycasts = true

		arg_25_0:ShowOrHideResUI(true)
	else
		setActive(go(arg_25_0.lScrollrect), true)

		if arg_25_0.scrollRectSpecial then
			setActive(arg_25_0.scrollRectSpecial, false)
		end

		var_0_0.super.Show(arg_25_0)
	end

	if arg_25_0.shop:GetBGM() ~= "" then
		pg.BgmMgr.GetInstance():Push(arg_25_0.__cname, arg_25_0.shop:GetBGM())
	end
end

function var_0_0.Hide(arg_30_0)
	local var_30_0 = pg.activity_template[arg_30_0.shop.activityId]

	if var_30_0 and var_30_0.config_client and var_30_0.config_client.category then
		for iter_30_0, iter_30_1 in pairs(arg_30_0.cards) do
			iter_30_1:Dispose()
		end

		arg_30_0.splitCommodities = {}
		arg_30_0.spiltNameCodes = {}
		arg_30_0.cards = {}
		arg_30_0.canvasGroup.alpha = 0
		arg_30_0.canvasGroup.blocksRaycasts = false

		arg_30_0:ShowOrHideResUI(false)
	else
		var_0_0.super.Hide(arg_30_0)
	end

	setActive(go(arg_30_0.lScrollrect), true)

	if arg_30_0.scrollRectSpecial then
		setActive(arg_30_0.scrollRectSpecial, false)
	end

	if arg_30_0.shop:GetBGM() ~= "" then
		pg.BgmMgr.GetInstance():Pop(arg_30_0.__cname)
	end
end

function var_0_0.SetUp(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	arg_31_0:SetShop(arg_31_1)
	arg_31_0:InitCommodities()

	arg_31_0.cards = {}

	arg_31_0:Show()
	arg_31_0:SetPlayer(arg_31_2)
	arg_31_0:SetItems(arg_31_3)
	arg_31_0:InitCommodities()
	arg_31_0:OnSetUp()
	arg_31_0:SetPainting()
end

function var_0_0.InitCommodities(arg_32_0)
	local var_32_0 = pg.activity_template[arg_32_0.shop.activityId]

	if var_32_0 and var_32_0.config_client and var_32_0.config_client.category then
		arg_32_0.splitCommodities = arg_32_0.shop:GetSplitCommodities()
		arg_32_0.spiltNameCodes = arg_32_0.shop:GetSplitNameCodes()

		arg_32_0.groupList:align(#arg_32_0.splitCommodities)
	else
		var_0_0.super.InitCommodities(arg_32_0)
	end
end

return var_0_0
