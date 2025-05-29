local var_0_0 = class("ChargeSuccessCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.shopId
	local var_1_2 = var_1_0.payId
	local var_1_3 = var_1_0.gem
	local var_1_4 = var_1_0.gem_free
	local var_1_5 = Goods.Create({
		shop_id = var_1_1
	}, Goods.TYPE_CHARGE)
	local var_1_6 = getProxy(PlayerProxy)
	local var_1_7 = var_1_6:getData()

	if var_1_3 > 0 then
		var_1_7:addResources({
			gem = var_1_3
		})
	end

	if var_1_4 > 0 then
		var_1_7:addResources({
			freeGem = var_1_4
		})
	end

	if var_1_5:isMonthCard() then
		local var_1_8 = var_1_7:getCardById(VipCard.MONTH)
		local var_1_9 = GetZeroTime() + 2419200

		if var_1_8 and var_1_8.leftDate ~= 0 then
			var_1_8.leftDate = var_1_8.leftDate + 2592000
		else
			var_1_8 = VipCard.New({
				data = 0,
				type = VipCard.MONTH,
				left_date = var_1_9
			})
		end

		var_1_7:addVipCard(var_1_8)
	end

	var_1_6:updatePlayer(var_1_7)

	if var_1_5:isMonthCard() then
		MonthCardOutDateTipPanel.SetMonthCardEndDateLocal()
		MonthCardOutDateTipPanel.SetMonthCardTipDate(0)
	end

	local var_1_10 = getProxy(ShopsProxy)
	local var_1_11 = var_1_10:getChargedList() or {}
	local var_1_12 = false

	for iter_1_0, iter_1_1 in pairs(var_1_11) do
		if iter_1_1.id == var_1_1 then
			var_1_11[iter_1_0]:increaseBuyCount()

			var_1_12 = true

			break
		end
	end

	if not var_1_12 then
		var_1_11[var_1_1] = Goods.Create({
			pay_count = 1,
			shop_id = var_1_1
		}, Goods.TYPE_CHARGE)
	end

	var_1_10:setChargedList(var_1_11)

	local var_1_13 = var_1_10:getFirstChargeList() or {}

	if _.is_empty(var_1_13) then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_PURCHASE_FIRST, var_1_2)
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_PAY_SUCCESS, var_1_2)

	if var_1_5:firstPayDouble() then
		local var_1_14 = var_1_10:getFirstChargeList() or {}

		if not table.contains(var_1_14, var_1_1) then
			table.insert(var_1_14, var_1_1)
		end

		var_1_10:setFirstChargeList(var_1_14)
	end

	local var_1_15 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHARGEAWARD)

	if var_1_15 and var_1_15.data1 == 0 then
		var_1_15.data1 = 1
	end

	pg.TipsMgr.GetInstance():ShowTips(i18n("charge_success"))
end

return var_0_0
