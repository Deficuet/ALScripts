local var_0_0 = class("IslandTradePriceTrendPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTradePriceTrendUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uiPriceList = UIItemList.New(arg_2_0._tf:Find("frame/prices"), arg_2_0._tf:Find("frame/prices/tpl"))
	arg_2_0.uiDateList = UIItemList.New(arg_2_0._tf:Find("frame/date"), arg_2_0._tf:Find("frame/date/tpl"))
	arg_2_0.tpl = arg_2_0._tf:Find("frame/tpl")
	arg_2_0.dotContainer = arg_2_0._tf:Find("frame/dots")
	arg_2_0.dots = {}
end

function var_0_0.Show(arg_3_0, arg_3_1, arg_3_2)
	var_0_0.super.Show(arg_3_0)

	arg_3_0.mode = arg_3_2
	arg_3_0.island = arg_3_1

	arg_3_0:InitPrices()
	arg_3_0:InitDate()
	onNextTick(function()
		arg_3_0:UpdateCurve()
	end)
end

function var_0_0.InitPrices(arg_5_0)
	arg_5_0.priceList = {}

	local var_5_0 = pg.island_set.treasure_price_scale_y.key_value_varchar

	arg_5_0.uiPriceList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = var_5_0[arg_6_1 + 1]

			setText(arg_6_2:Find("Text"), var_6_0)
			table.insert(arg_5_0.priceList, {
				var_6_0,
				arg_6_2
			})
		end
	end)
	arg_5_0.uiPriceList:align(#var_5_0)
	table.sort(arg_5_0.priceList, function(arg_7_0, arg_7_1)
		return arg_7_0[1] < arg_7_1[1]
	end)
end

function var_0_0.CollectDate(arg_8_0)
	local var_8_0 = pg.TimeMgr.GetInstance():GetServerHour()
	local var_8_1 = GetZeroTime()

	if var_8_0 <= 2 then
		var_8_1 = var_8_1 - 86400
	end

	local var_8_2 = var_8_1 - 86400 + 10800
	local var_8_3 = {}
	local var_8_4 = 0

	for iter_8_0 = 6, 1, -1 do
		if arg_8_0.island:GetTradeAgency():ExistTrade(var_8_2 - iter_8_0 * 86400) then
			var_8_4 = iter_8_0

			break
		end
	end

	for iter_8_1 = var_8_4, 1, -1 do
		local var_8_5 = var_8_2 - iter_8_1 * 86400

		table.insert(var_8_3, var_8_5)
	end

	table.insert(var_8_3, var_8_2)

	for iter_8_2 = 1, 7 - #var_8_3 do
		local var_8_6 = var_8_2 + iter_8_2 * 86400

		table.insert(var_8_3, var_8_6)
	end

	return var_8_3
end

function var_0_0.InitDate(arg_9_0)
	arg_9_0.dateList = {}

	local var_9_0 = arg_9_0:CollectDate()

	assert(#var_9_0 == 7)
	arg_9_0.uiDateList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_0[arg_10_1 + 1]
			local var_10_1 = pg.TimeMgr.GetInstance():STimeDescS(var_10_0, "%m.%d")

			setText(arg_10_2:Find("Text"), var_10_1)

			arg_9_0.dateList[var_10_0] = arg_10_2
		end
	end)
	arg_9_0.uiDateList:align(#var_9_0)
end

function var_0_0.UpdateCurve(arg_11_0)
	eachChild(arg_11_0.dotContainer, function(arg_12_0)
		setActive(arg_12_0, false)
	end)

	local var_11_0 = arg_11_0.island:GetTradeAgency()
	local var_11_1

	if arg_11_0.mode == IslandTradePage.MODE_SELL then
		var_11_1 = var_11_0:GetSellPriceTrend()
	elseif arg_11_0.mode == IslandTradePage.MODE_PURCHAS then
		var_11_1 = var_11_0:GetPriceTrend()
	end

	local var_11_2 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.dateList) do
		local var_11_3 = var_11_1[iter_11_0]

		if var_11_3 then
			local var_11_4 = arg_11_0:UpdateCurveItem(iter_11_0, iter_11_1, var_11_3)

			table.insert(var_11_2, {
				iter_11_0,
				var_11_4
			})
		end
	end

	table.sort(var_11_2, function(arg_13_0, arg_13_1)
		return arg_13_0[1] < arg_13_1[1]
	end)

	local var_11_5 = _.map(var_11_2, function(arg_14_0)
		return arg_14_0[2]
	end)

	for iter_11_2, iter_11_3 in ipairs(var_11_2) do
		local var_11_6 = iter_11_3[1]
		local var_11_7 = arg_11_0.dots[var_11_6]:Find("line")
		local var_11_8 = var_11_2[iter_11_2 + 1]

		if var_11_7 and var_11_8 and var_11_8[1] - iter_11_3[1] == 86400 then
			local var_11_9 = Vector2.Distance(iter_11_3[2].localPosition, var_11_8[2].localPosition)

			var_11_7.sizeDelta = Vector2(4, var_11_9)
			var_11_7.up = (var_11_8[2].position - iter_11_3[2].position).normalized

			setActive(var_11_7, true)
		elseif var_11_7 then
			setActive(var_11_7, false)
		end
	end

	arg_11_0:PlayDotAnimations(var_11_5)
end

function var_0_0.PlayDotAnimations(arg_15_0, arg_15_1)
	local var_15_0 = {}

	table.insert(var_15_0, function(arg_16_0)
		onDelayTick(arg_16_0, 0.33)
	end)

	for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
		setActive(iter_15_1, false)
		table.insert(var_15_0, function(arg_17_0)
			if IsNil(iter_15_1) then
				return
			end

			setActive(iter_15_1, true)

			local var_17_0 = iter_15_1:GetComponent("Animation")

			if not var_17_0 then
				return
			end

			var_17_0:Play("anim_IslandTradePriceTrendUI_res_tpl_in")
			onDelayTick(arg_17_0, 0.33)
		end)
	end

	seriesAsync(var_15_0)
end

function var_0_0.UpdateCurveItem(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0.dots[arg_18_1]

	if not var_18_0 then
		var_18_0 = cloneTplTo(arg_18_0.tpl, arg_18_0.dotContainer)
		arg_18_0.dots[arg_18_1] = var_18_0
	end

	setActive(var_18_0, true)

	local var_18_1 = arg_18_0.dotContainer:InverseTransformPoint(arg_18_2:Find("Text").position)
	local var_18_2 = arg_18_0:GetPriceYScale(arg_18_3)

	setLocalPosition(var_18_0, Vector3(var_18_1.x, var_18_2, 0))
	setActive(var_18_0:Find("dot/current"), pg.TimeMgr.GetInstance():IsSameDay(arg_18_1, pg.TimeMgr.GetInstance():GetServerTime()))

	return var_18_0
end

function var_0_0.GetPriceYScale(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.priceList[1]
	local var_19_1 = arg_19_0.priceList[2][2].localPosition.y - var_19_0[2].localPosition.y
	local var_19_2

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.priceList) do
		if arg_19_1 >= iter_19_1[1] then
			var_19_2 = iter_19_0
		end
	end

	if not var_19_2 then
		return
	end

	local var_19_3 = 0
	local var_19_4 = 0

	if var_19_2 == #arg_19_0.priceList then
		var_19_3 = arg_19_0.priceList[var_19_2][1] + 1000
		var_19_4 = arg_19_0.priceList[var_19_2][1]
	else
		var_19_3 = arg_19_0.priceList[var_19_2 + 1][1]
		var_19_4 = arg_19_0.priceList[var_19_2][1]
	end

	local var_19_5 = (arg_19_1 - var_19_4) / (var_19_3 - var_19_4)
	local var_19_6 = arg_19_0.priceList[var_19_2][2]

	return arg_19_0.dotContainer:InverseTransformPoint(var_19_6:Find("Text").position).y + var_19_1 * var_19_5
end

return var_0_0
