local var_0_0 = class("LatestSkinGiftPackLayer", import(".LatestSkinShopLayer"))

function var_0_0.Overlay(arg_1_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_1_0._tf, {
		pbList = {
			arg_1_0.charContainer:Find("bg"),
			arg_1_0.filterUI:Find("panel")
		}
	})
end

function var_0_0.UnOverlay(arg_2_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_2_0._tf)
end

function var_0_0.GetAllCommodities(arg_3_0)
	arg_3_0.giftPackCommodity = arg_3_0.contextData.giftPackCommodity
	arg_3_0.commodities = arg_3_0.contextData.skinCommodities
	arg_3_0.skinProbabilitys = arg_3_0.contextData.skinProbabilitys
end

function var_0_0.SetGiftPackLayer(arg_4_0)
	setActive(arg_4_0.mainTitle, true)
	setActive(arg_4_0.backBtn, true)
	setActive(arg_4_0.homeBtn, true)
	setActive(arg_4_0.giftPack, true)
	setActive(arg_4_0.showOwnBtn, false)
	setActive(arg_4_0.filterBtn, false)
	setActive(arg_4_0.search, false)
	setActive(arg_4_0.giftPackBtn, false)
	setActive(arg_4_0.price, false)

	arg_4_0.top:Find("title").anchoredPosition = Vector2(544.6, -208.3)
	arg_4_0.top:Find("change_skin").anchoredPosition = Vector2(431.1, -337.8)
	arg_4_0.bottom:Find("scroll").offsetMin = Vector2(378, 0)
	arg_4_0.bottom:Find("scroll").offsetMax = Vector2(-19.6, 227.9)

	setText(arg_4_0.giftPack:Find("panel/name"), arg_4_0.giftPackCommodity:getConfig("name_display"))

	local var_4_0 = arg_4_0.giftPackCommodity:getConfig("time")

	setActive(arg_4_0.giftPack:Find("panel/leftTimeText"), type(var_4_0) == "table")

	if type(var_4_0) == "table" then
		local var_4_1 = var_4_0[2]
		local var_4_2 = pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_4_1[1][1],
			month = var_4_1[1][2],
			day = var_4_1[1][3],
			hour = var_4_1[2][1],
			min = var_4_1[2][2],
			sec = var_4_1[2][3]
		})

		arg_4_0:StartTimer(function()
			local var_5_0 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_5_1 = var_4_2 - var_5_0
			local var_5_2 = math.floor(var_5_1 / 86400)
			local var_5_3 = math.floor(var_5_1 % 86400 / 3600)
			local var_5_4 = math.floor(var_5_1 % 86400 % 3600 / 60)

			if var_5_2 > 0 then
				setText(arg_4_0.giftPack:Find("panel/leftTimeText"), i18n("shop_new_during_day", var_5_2))
			elseif var_5_3 > 0 then
				setText(arg_4_0.giftPack:Find("panel/leftTimeText"), i18n("shop_new_during_hour", var_5_3))
			else
				setText(arg_4_0.giftPack:Find("panel/leftTimeText"), i18n("shop_new_during_minite", var_5_4))
			end
		end)
	end

	GetImageSpriteFromAtlasAsync("chargeicon/" .. arg_4_0.giftPackCommodity:getConfig("picture"), "", arg_4_0.giftPack:Find("panel/icon"))
	setText(arg_4_0.giftPack:Find("panel/tip1/Text"), arg_4_0.giftPackCommodity:getConfig("first_text"))
	setText(arg_4_0.giftPack:Find("panel/tip2/Text"), arg_4_0.giftPackCommodity:getConfig("second_text"))

	local var_4_3 = arg_4_0.giftPackCommodity:getConfig("first_icon")
	local var_4_4 = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_3) do
		table.insert(var_4_4, Drop.Create(iter_4_1))
	end

	while #var_4_4 > 3 do
		table.remove(var_4_4, #var_4_4)
	end

	local var_4_5 = UIItemList.New(arg_4_0.giftPack:Find("panel/firstItems"), arg_4_0.giftPack:Find("panel/firstItems/item"))

	var_4_5:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = var_4_4[arg_6_1 + 1]

			updateDrop(arg_6_2:Find("mask/item"), var_6_0)
		end
	end)
	var_4_5:align(#var_4_4)

	local var_4_6 = arg_4_0.giftPackCommodity:GetDropList()

	while #var_4_6 > 3 do
		table.remove(var_4_6, #var_4_6)
	end

	local var_4_7 = UIItemList.New(arg_4_0.giftPack:Find("panel/items"), arg_4_0.giftPack:Find("panel/items/item"))

	var_4_7:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = var_4_6[arg_7_1 + 1]

			updateDrop(arg_7_2:Find("mask/item"), var_7_0)
		end
	end)
	var_4_7:align(#var_4_6)
	setText(arg_4_0.giftPack:Find("price/consume/Text"), arg_4_0.giftPackCommodity:GetLimitDesc())
	setText(arg_4_0.giftPack:Find("price/btns/goumai_button/Text"), GetMoneySymbol() .. arg_4_0.giftPackCommodity:getConfig("money"))

	if PLATFORM_CODE == PLATFORM_CHT and arg_4_0.giftPackCommodity:IsLocalPrice() then
		setText(arg_4_0.giftPack:Find("price/btns/goumai_button/Text"), arg_4_0.giftPackCommodity:getConfig("money"))
	end

	setGray(arg_4_0.giftPack:Find("price/btns/yigoumai_button"), true, true)

	local var_4_8 = arg_4_0.giftPackCommodity:getLimitCount()
	local var_4_9 = arg_4_0.giftPackCommodity.buyCount or 0

	setActive(arg_4_0.giftPack:Find("price/btns/goumai_button"), var_4_9 < var_4_8)
	setActive(arg_4_0.giftPack:Find("price/btns/yigoumai_button"), var_4_8 <= var_4_9)
	onButton(arg_4_0, arg_4_0.giftPack:Find("price/btns/goumai_button"), function()
		arg_4_0:confirm(arg_4_0.giftPackCommodity)
	end, SFX_PANEL)
end

function var_0_0.FlushGifgPackBtn(arg_9_0, arg_9_1)
	setActive(arg_9_0.giftPackBtn, false)
end

function var_0_0.OnUpdateItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.cards[arg_10_2]

	if not var_10_0 then
		arg_10_0:OnInitItem(arg_10_2)

		var_10_0 = arg_10_0.cards[arg_10_2]
	end

	local var_10_1 = arg_10_0.displays[arg_10_1 + 1]

	if not var_10_1 then
		return
	end

	local var_10_2 = arg_10_0.selectedId == var_10_1.id
	local var_10_3 = table.contains(arg_10_0.returnSkins, var_10_1.id)

	var_10_0:Update(var_10_1, var_10_2, var_10_3, arg_10_0.skinProbabilitys[var_10_1:getSkinId()])

	if arg_10_0.triggerFirstCard and arg_10_1 == 0 then
		arg_10_0.triggerFirstCard = false

		triggerButton(var_10_0._go)
	end
end

function var_0_0.confirm(arg_11_0, arg_11_1)
	if not arg_11_1 then
		return
	end

	arg_11_1 = Clone(arg_11_1)

	if arg_11_1:isChargeType() then
		local var_11_0 = false
		local var_11_1 = var_11_0 and arg_11_1:firstPayDouble()
		local var_11_2 = var_11_1 and 4 or arg_11_1:getConfig("tag")

		if arg_11_1:isMonthCard() or arg_11_1:isGiftBox() or arg_11_1:isItemBox() or arg_11_1:isPassItem() then
			local var_11_3 = arg_11_1:GetExtraServiceItem()
			local var_11_4 = arg_11_1:GetExtraDrop()
			local var_11_5 = arg_11_1:GetBonusItem()
			local var_11_6
			local var_11_7

			if arg_11_1:isPassItem() then
				var_11_6 = i18n("battlepass_pay_tip")
			elseif arg_11_1:isMonthCard() then
				var_11_6 = i18n("charge_title_getitem_month")
				var_11_7 = i18n("charge_title_getitem_soon")
			else
				var_11_6 = i18n("charge_title_getitem")
			end

			local var_11_8 = {
				isChargeType = true,
				infoTip = arg_11_1:GetInfoTip(),
				icon = "chargeicon/" .. arg_11_1:getConfig("picture"),
				name = arg_11_1:getConfig("name_display"),
				tipExtra = var_11_6,
				extraItems = var_11_3,
				price = arg_11_1:getConfig("money"),
				isLocalPrice = arg_11_1:IsLocalPrice(),
				tagType = var_11_2,
				isMonthCard = arg_11_1:isMonthCard(),
				tipBonus = var_11_7,
				bonusItem = var_11_5,
				extraDrop = var_11_4,
				descExtra = arg_11_1:getConfig("descrip_extra"),
				limitArgs = arg_11_1:getConfig("limit_args"),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_11_0:emit(LatestSkinGiftPackMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_11_0:emit(LatestSkinGiftPackMediator.CHARGE, arg_11_1.id)
					end
				end
			}

			arg_11_0:emit(LatestSkinGiftPackMediator.OPEN_CHARGE_ITEM_PANEL, var_11_8)
		elseif arg_11_1:isGem() then
			local var_11_9 = arg_11_1:getConfig("money")
			local var_11_10 = arg_11_1:getConfig("gem")

			if var_11_1 then
				var_11_10 = var_11_10 + arg_11_1:getConfig("gem")
			else
				var_11_10 = var_11_10 + arg_11_1:getConfig("extra_gem")
			end

			local var_11_11 = {
				isChargeType = true,
				icon = "chargeicon/" .. arg_11_1:getConfig("picture"),
				name = arg_11_1:getConfig("name_display"),
				price = arg_11_1:getConfig("money"),
				isLocalPrice = arg_11_1:IsLocalPrice(),
				tagType = var_11_2,
				normalTip = i18n("charge_start_tip", var_11_9, var_11_10),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_11_0:emit(LatestSkinGiftPackMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_11_0:emit(LatestSkinGiftPackMediator.CHARGE, arg_11_1.id)
					end
				end
			}

			arg_11_0:emit(LatestSkinGiftPackMediator.OPEN_CHARGE_ITEM_BOX, var_11_11)
		end
	else
		local var_11_12 = {}
		local var_11_13 = arg_11_1:getConfig("effect_args")
		local var_11_14 = Item.getConfigData(var_11_13[1])
		local var_11_15 = var_11_14.display_icon

		if type(var_11_15) == "table" then
			for iter_11_0, iter_11_1 in ipairs(var_11_15) do
				table.insert(var_11_12, Drop.New({
					type = iter_11_1[1],
					id = iter_11_1[2],
					count = iter_11_1[3]
				}))
			end
		end

		local var_11_16 = {
			isMonthCard = false,
			isChargeType = false,
			isLocalPrice = false,
			icon = var_11_14.icon,
			name = var_11_14.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = var_11_12,
			price = arg_11_1:getConfig("resource_num"),
			tagType = arg_11_1:getConfig("tag"),
			onYes = function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", arg_11_1:getConfig("resource_num"), var_11_14.name),
					onYes = function()
						arg_11_0:emit(LatestSkinGiftPackMediator.BUY_ITEM, arg_11_1.id, 1)
					end
				})
			end
		}

		arg_11_0:emit(LatestSkinGiftPackMediator.OPEN_CHARGE_ITEM_PANEL, var_11_16)
	end
end

function var_0_0.StartTimer(arg_16_0, arg_16_1)
	arg_16_0.timer = Timer.New(function()
		arg_16_1()
	end, 1, -1)

	arg_16_0.timer:Start()
end

function var_0_0.RemoveAllTimer(arg_18_0)
	if arg_18_0.timer then
		arg_18_0.timer:Stop()

		arg_18_0.timer = nil
	end
end

function var_0_0.willExit(arg_19_0)
	var_0_0.super.willExit(arg_19_0)
	arg_19_0:RemoveAllTimer()
end

return var_0_0
