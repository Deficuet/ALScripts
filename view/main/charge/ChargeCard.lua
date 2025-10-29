local var_0_0 = class("ChargeCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.tr = tf(arg_1_1)
	arg_1_0.icon = arg_1_0.tr:Find("real_tpl/item_icon")
	arg_1_0.iconTF = arg_1_0.icon:GetComponent(typeof(Image))
	arg_1_0.shipIcon = arg_1_0.tr:Find("real_tpl/item_icon/ship")
	arg_1_0.priceTf = arg_1_0.tr:Find("real_tpl/Price/Text")
	arg_1_0.price = arg_1_0.priceTf:GetComponent(typeof(Text))
	arg_1_0.freeTag = arg_1_0.tr:Find("real_tpl/Price/FreeText")
	arg_1_0.tecShipBuyTag = arg_1_0.tr:Find("real_tpl/Price/BuyText")
	arg_1_0.contain = arg_1_0.tr:Find("real_tpl/Price")
	arg_1_0.rmb = arg_1_0.tr:Find("real_tpl/Price/icon_rmb")
	arg_1_0.gem = arg_1_0.tr:Find("real_tpl/Price/icon_gem")
	arg_1_0.name = arg_1_0.tr:Find("real_tpl/item_name_mask/item_name")
	arg_1_0.itemPanel1 = arg_1_0.tr:Find("real_tpl/itemPanel1")
	arg_1_0.firstTipText = arg_1_0.tr:Find("real_tpl/itemPanel1/Tip/Text")
	arg_1_0.secondTipText = arg_1_0.tr:Find("real_tpl/itemPanel1/Tip2/Text")
	arg_1_0.grid = arg_1_0.tr:Find("real_tpl/itemPanel1/grid")
	arg_1_0.grid1 = arg_1_0.tr:Find("real_tpl/itemPanel1/grid1")
	arg_1_0.itemPanel2 = arg_1_0.tr:Find("real_tpl/itemPanel2")
	arg_1_0.firstTipText2 = arg_1_0.tr:Find("real_tpl/itemPanel2/Tip/Text")
	arg_1_0.addImage = arg_1_0.tr:Find("real_tpl/itemPanel2/addImg")
	arg_1_0.grid2 = arg_1_0.tr:Find("real_tpl/itemPanel2/grid")
	arg_1_0.itemPanel3 = arg_1_0.tr:Find("real_tpl/itemPanel3")
	arg_1_0.firstTipText3 = arg_1_0.tr:Find("real_tpl/itemPanel3/Tip/Text")
	arg_1_0.grid3 = arg_1_0.tr:Find("real_tpl/itemPanel3/grid")
	arg_1_0.limitText = arg_1_0.tr:Find("real_tpl/LimitText")
	arg_1_0.viewBtn = arg_1_0.tr:Find("real_tpl/view")
	arg_1_0.numLeftText = arg_1_0.tr:Find("real_tpl/leftTimeText")
	arg_1_0.focusTip = arg_1_0.tr:Find("real_tpl/focus_tip")
	arg_1_0.tag = arg_1_0.tr:Find("real_tpl/tag")
	arg_1_0.tags = {}

	table.insert(arg_1_0.tags, arg_1_0.tr:Find("real_tpl/tag/hot"))
	table.insert(arg_1_0.tags, arg_1_0.tr:Find("real_tpl/tag/new"))
	table.insert(arg_1_0.tags, arg_1_0.tr:Find("real_tpl/tag/advice"))
	table.insert(arg_1_0.tags, arg_1_0.tr:Find("real_tpl/tag/double"))
	table.insert(arg_1_0.tags, arg_1_0.tr:Find("real_tpl/tag/activity"))
	table.insert(arg_1_0.tags, arg_1_0.tr:Find("real_tpl/tag/time"))
	table.insert(arg_1_0.tags, arg_1_0.tr:Find("real_tpl/tag/discount"))

	arg_1_0.packageTag = arg_1_0.tr:Find("real_tpl/package_tag")
end

function var_0_0.update(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.goods = arg_2_1

	if not IsNil(arg_2_0.shipIcon) then
		setActive(arg_2_0.shipIcon, false)
	end

	local var_2_0 = arg_2_1:isChargeType() and arg_2_1:getShowType() ~= ""

	setActive(arg_2_0.rmb, arg_2_1:isChargeType() and not var_2_0)
	setActive(arg_2_0.gem, not arg_2_1:isChargeType() and not arg_2_1:isFree())
	setText(arg_2_0.freeTag, i18n("shop_free_tag"))
	setText(arg_2_0.tecShipBuyTag, i18n("word_buy"))
	setActive(arg_2_0.tecShipBuyTag, var_2_0)
	setActive(arg_2_0.freeTag, arg_2_1:isFree())
	setActive(arg_2_0.priceTf, not arg_2_1:isFree() and not var_2_0)
	setActive(arg_2_0.focusTip, arg_2_1:isFree())
	setActive(arg_2_0.icon, arg_2_1:isChargeType())
	setActive(arg_2_0.contain, true)

	if arg_2_0.viewBtn then
		setActive(arg_2_0.viewBtn, arg_2_1:isChargeType() and arg_2_1:CanViewSkinProbability())
	end

	if arg_2_0.packageTag then
		local var_2_1 = arg_2_1:GetPackageTag()

		setActive(arg_2_0.packageTag, var_2_1 ~= "")
		setText(arg_2_0.packageTag:Find("Text"), var_2_1)
	end

	if arg_2_1:isChargeType() then
		arg_2_0:updateCharge(arg_2_1, arg_2_2, arg_2_3)
	else
		arg_2_0:updateGemItem(arg_2_1, arg_2_2)
	end

	arg_2_0:destoryTimer()
end

function var_0_0.updateCharge(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	setActive(arg_3_0.tag, true)

	local var_3_0 = not table.contains(arg_3_3, arg_3_1.id) and arg_3_1:firstPayDouble() and 4 or arg_3_1:getConfig("tag")

	setActive(arg_3_0.tag, var_3_0 > 0)

	if var_3_0 > 0 then
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.tags) do
			setActive(iter_3_1, iter_3_0 == var_3_0)
		end
	end

	setActive(arg_3_0.numLeftText, false)

	local var_3_1, var_3_2 = arg_3_1:inTime()

	if var_3_1 and not arg_3_1:isFree() and var_3_2 and var_3_2 > 0 then
		setActive(arg_3_0.numLeftText, true)

		local var_3_3, var_3_4, var_3_5 = pg.TimeMgr.GetInstance():parseTimeFrom(var_3_2)

		if var_3_3 > 0 then
			setText(arg_3_0.numLeftText, i18n("shop_goods_left_day", var_3_3))
		elseif var_3_4 > 0 then
			setText(arg_3_0.numLeftText, i18n("shop_goods_left_hour", var_3_4))
		elseif var_3_5 then
			setText(arg_3_0.numLeftText, i18n("shop_goods_left_minute", var_3_5 > 0 and var_3_5 or 1))
		end

		local var_3_6 = 60
		local var_3_7 = 3600
		local var_3_8 = 86400
		local var_3_9

		if var_3_8 <= var_3_2 then
			var_3_9 = var_3_2 % var_3_8
		elseif var_3_7 <= var_3_2 then
			var_3_9 = var_3_2 % var_3_7
		elseif var_3_6 <= var_3_2 then
			var_3_9 = var_3_2 % var_3_6
		end

		if var_3_9 and var_3_9 > 0 then
			if arg_3_0.countDownTimer then
				arg_3_0.countDownTimer:Stop()

				arg_3_0.countDownTimer = nil
			end

			arg_3_0.countDownTimer = Timer.New(function()
				arg_3_0:updateGemItem(arg_3_1, arg_3_2)
			end, var_3_9, 1)

			arg_3_0.countDownTimer:Start()
		end
	end

	setScrollText(arg_3_0.name, arg_3_1:getConfig("name_display"))

	if arg_3_1:isItemBox() or arg_3_1:isGiftBox() or arg_3_1:isPassItem() then
		arg_3_0:updateImport(arg_3_0:GetPayDisplayItemData(arg_3_1))
	end

	local var_3_10 = arg_3_1:getConfig("limit_type")
	local var_3_11 = arg_3_1.buyCount
	local var_3_12 = arg_3_1:getLimitCount()

	if var_3_10 == 2 then
		setText(arg_3_0.limitText, i18n("charge_limit_all", var_3_12 - var_3_11, var_3_12))
	elseif var_3_10 == 4 then
		setText(arg_3_0.limitText, i18n("charge_limit_daily", var_3_12 - var_3_11, var_3_12))
	else
		setText(arg_3_0.limitText, "")
	end

	arg_3_0.price.text = arg_3_1:getConfig("money")

	if PLATFORM_CODE == PLATFORM_CHT and arg_3_1:IsLocalPrice() then
		setActive(arg_3_0.rmb, false)
	end

	arg_3_0.iconTF.sprite = GetSpriteFromAtlas("chargeicon/1", "")

	LoadSpriteAsync("chargeicon/" .. arg_3_1:getConfig("picture"), function(arg_5_0)
		if arg_5_0 and not IsNil(arg_3_0.iconTF) then
			arg_3_0.iconTF.sprite = arg_5_0
		end
	end)
end

function var_0_0.UpdateShipIcon(arg_6_0, arg_6_1)
	if IsNil(arg_6_0.shipIcon) then
		return
	end

	setActive(arg_6_0.shipIcon, true)

	local var_6_0 = arg_6_0.shipIcon:Find("icon"):GetComponent(typeof(Image))
	local var_6_1 = arg_6_1:getConfigTable().usage_arg[1][1]

	assert(var_6_1)

	local var_6_2 = pg.shop_template[var_6_1].effect_args[1]

	assert(var_6_2)

	local var_6_3 = pg.ship_skin_template[var_6_2]

	LoadSpriteAsync("qicon/" .. var_6_3.prefab, function(arg_7_0)
		if arg_7_0 and not IsNil(arg_6_0.shipIcon) then
			var_6_0.sprite = arg_7_0
		end
	end)
end

function var_0_0.updateGemItem(arg_8_0, arg_8_1, arg_8_2)
	setText(arg_8_0.limitText, "")

	local var_8_0 = arg_8_1:getLimitCount()
	local var_8_1 = arg_8_1.buyCount or 0

	if var_8_0 > 0 then
		setText(arg_8_0.limitText, i18n("charge_limit_all", var_8_0 - var_8_1, var_8_0))
	end

	local var_8_2 = arg_8_1:getConfig("group_limit")

	if var_8_2 > 0 then
		local var_8_3 = arg_8_1:getConfig("group_type") or 0

		if var_8_3 == 1 then
			setText(arg_8_0.limitText, i18n("charge_limit_daily", var_8_2 - arg_8_1.groupCount, var_8_2))
		elseif var_8_3 == 2 then
			setText(arg_8_0.limitText, i18n("charge_limit_weekly", var_8_2 - arg_8_1.groupCount, var_8_2))
		elseif var_8_3 == 3 then
			setText(arg_8_0.limitText, i18n("charge_limit_monthly", var_8_2 - arg_8_1.groupCount, var_8_2))
		end
	end

	arg_8_0.price.text = arg_8_1:getConfig("resource_num")

	setActive(arg_8_0.icon, true)

	local var_8_4 = arg_8_1:getConfig("tag")

	setActive(arg_8_0.tag, var_8_4 > 0)

	if var_8_4 > 0 then
		for iter_8_0, iter_8_1 in ipairs(arg_8_0.tags) do
			setActive(iter_8_1, iter_8_0 == var_8_4)
		end
	end

	setActive(arg_8_0.numLeftText, false)

	local var_8_5, var_8_6 = arg_8_1:inTime()

	if var_8_5 and not arg_8_1:isFree() and var_8_6 and var_8_6 > 0 then
		setActive(arg_8_0.numLeftText, true)

		local var_8_7, var_8_8, var_8_9 = pg.TimeMgr.GetInstance():parseTimeFrom(var_8_6)

		if var_8_7 > 0 then
			setText(arg_8_0.numLeftText, i18n("shop_goods_left_day", var_8_7))
		elseif var_8_8 > 0 then
			setText(arg_8_0.numLeftText, i18n("shop_goods_left_hour", var_8_8))
		elseif var_8_9 then
			setText(arg_8_0.numLeftText, i18n("shop_goods_left_minute", var_8_9 > 0 and var_8_9 or 1))
		end

		local var_8_10 = 60
		local var_8_11 = 3600
		local var_8_12 = 86400
		local var_8_13

		if var_8_12 <= var_8_6 then
			var_8_13 = var_8_6 % var_8_12
		elseif var_8_11 <= var_8_6 then
			var_8_13 = var_8_6 % var_8_11
		elseif var_8_10 <= var_8_6 then
			var_8_13 = var_8_6 % var_8_10
		end

		if var_8_13 and var_8_13 > 0 then
			if arg_8_0.countDownTimer then
				arg_8_0.countDownTimer:Stop()

				arg_8_0.countDownTimer = nil
			end

			arg_8_0.countDownTimer = Timer.New(function()
				arg_8_0:updateGemItem(arg_8_1, arg_8_2)
			end, var_8_13, 1)

			arg_8_0.countDownTimer:Start()
		end
	end

	setActive(arg_8_0.name, true)

	local var_8_14 = arg_8_1:getConfig("effect_args")

	if #var_8_14 > 0 then
		local var_8_15 = Item.getConfigData(var_8_14[1])

		if var_8_15 then
			setScrollText(arg_8_0.name, var_8_15.name)
			arg_8_0:updateImport(arg_8_0:GetShopDisplayItemData(arg_8_1))

			local var_8_16 = arg_8_0:CheckSkinDiscounItem(var_8_15.display_icon)

			if var_8_16 then
				arg_8_0:UpdateShipIcon(var_8_16)
			end
		end

		arg_8_0.iconTF.sprite = GetSpriteFromAtlas("chargeicon/1", "")

		LoadSpriteAsync(var_8_15.icon, function(arg_10_0)
			if arg_10_0 and not IsNil(arg_8_0.iconTF) then
				arg_8_0.iconTF.sprite = arg_10_0
			end
		end)
	end
end

function var_0_0.CheckSkinDiscounItem(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in pairs(arg_11_1) do
		local var_11_0 = Drop.Create(iter_11_1)
		local var_11_1 = var_11_0:getConfigTable()

		if var_11_1.usage and var_11_1.usage == ItemUsage.USAGE_SHOP_DISCOUNT then
			return var_11_0
		end
	end

	return nil
end

local function var_0_1(arg_12_0)
	local var_12_0 = arg_12_0:getConfigTable()

	if var_12_0.usage and var_12_0.usage == ItemUsage.USAGE_SKIN_EXP then
		return false
	end

	return true
end

function var_0_0.updateImport(arg_13_0, arg_13_1)
	local var_13_0 = #arg_13_1 >= 2

	setActive(arg_13_0.itemPanel1, var_13_0)

	if var_13_0 then
		setActive(arg_13_0.itemPanel2, false)
		setActive(arg_13_0.itemPanel3, false)
		setScrollText(arg_13_0.firstTipText, arg_13_1[1].text)
		setScrollText(arg_13_0.secondTipText, arg_13_1[2].text)

		local var_13_1 = {}

		for iter_13_0, iter_13_1 in ipairs(arg_13_1[1].list) do
			table.insert(var_13_1, Drop.Create(iter_13_1))
		end

		for iter_13_2 = 1, arg_13_0.grid1.childCount do
			local var_13_2 = arg_13_0.grid:GetChild(iter_13_2 - 1)

			if iter_13_2 <= #var_13_1 then
				setActive(var_13_2, var_0_1(var_13_1[iter_13_2]))
				updateDrop(var_13_2:Find("itemBg/item"), var_13_1[iter_13_2])
			else
				setActive(var_13_2, false)
			end
		end

		local var_13_3 = {}

		for iter_13_3, iter_13_4 in ipairs(arg_13_1[2].list) do
			table.insert(var_13_3, Drop.Create(iter_13_4))
		end

		for iter_13_5 = 1, arg_13_0.grid1.childCount do
			local var_13_4 = arg_13_0.grid1:GetChild(iter_13_5 - 1)

			if iter_13_5 <= #var_13_3 then
				setActive(var_13_4, var_0_1(var_13_3[iter_13_5]))
				updateDrop(var_13_4:Find("itemBg/item"), var_13_3[iter_13_5])
			else
				setActive(var_13_4, false)
			end
		end
	else
		local var_13_5 = arg_13_1[1].text
		local var_13_6 = var_13_5 == ""

		setActive(arg_13_0.itemPanel2, not var_13_6)
		setActive(arg_13_0.itemPanel3, var_13_6)

		if var_13_6 then
			setScrollText(arg_13_0.firstTipText3, i18n("shop_item_unlock"))

			local var_13_7 = {}

			for iter_13_6, iter_13_7 in ipairs(arg_13_1[1].list) do
				table.insert(var_13_7, Drop.Create(iter_13_7))
			end

			for iter_13_8 = 1, arg_13_0.grid3.childCount do
				local var_13_8 = arg_13_0.grid3:GetChild(iter_13_8 - 1)

				if iter_13_8 <= #var_13_7 then
					setActive(var_13_8, var_0_1(var_13_7[iter_13_8]))
					updateDrop(var_13_8:Find("itemBg/item"), var_13_7[iter_13_8])
				else
					setActive(var_13_8, false)
				end
			end
		else
			setScrollText(arg_13_0.firstTipText2, var_13_5)

			local var_13_9 = {}

			for iter_13_9, iter_13_10 in ipairs(arg_13_1[1].list) do
				table.insert(var_13_9, Drop.Create(iter_13_10))
			end

			for iter_13_11 = 1, arg_13_0.grid2.childCount do
				local var_13_10 = arg_13_0.grid2:GetChild(iter_13_11 - 1)

				if iter_13_11 <= #var_13_9 then
					setActive(var_13_10, var_0_1(var_13_9[iter_13_11]))
					updateDrop(var_13_10:Find("itemBg/item"), var_13_9[iter_13_11])
				else
					setActive(var_13_10, false)
				end
			end
		end
	end
end

function var_0_0.GetPayDisplayItemData(arg_14_0, arg_14_1)
	local var_14_0 = {}
	local var_14_1 = arg_14_1:getConfig("first_text")

	if var_14_1 ~= "" then
		table.insert(var_14_0, {
			text = var_14_1,
			list = arg_14_1:getConfig("first_icon")
		})
	end

	local var_14_2 = arg_14_1:getConfig("second_text")

	table.insert(var_14_0, {
		text = var_14_2,
		list = arg_14_1:getConfig("display")
	})

	return var_14_0
end

function var_0_0.GetShopDisplayItemData(arg_15_0, arg_15_1)
	local var_15_0 = {}
	local var_15_1 = arg_15_1:getConfig("first_text")

	if var_15_1 ~= "" then
		table.insert(var_15_0, {
			text = var_15_1,
			list = arg_15_1:getConfig("first_icon")
		})
	end

	local var_15_2 = arg_15_1:getConfig("second_text")
	local var_15_3 = arg_15_1:getConfig("effect_args")
	local var_15_4 = Item.getConfigData(var_15_3[1])

	table.insert(var_15_0, {
		text = var_15_2,
		list = var_15_4.display_icon
	})

	return var_15_0
end

function var_0_0.destoryTimer(arg_16_0)
	if arg_16_0.countDownTimer then
		arg_16_0.countDownTimer:Stop()

		arg_16_0.countDownTimer = nil
	end
end

return var_0_0
