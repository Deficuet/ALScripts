local var_0_0 = class("ChargeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	if PLATFORM_CODE == PLATFORM_JP then
		if not pg.SdkMgr.GetInstance():YoStarCheckCanBuy() then
			originalPrint("wait for a second, Do not click quickly~")

			return
		end
	elseif PLATFORM_CODE == PLATFORM_US and not pg.SdkMgr.GetInstance():CheckAiriCanBuy() then
		originalPrint("wait for a second, Do not click quickly~")

		return
	end

	local var_1_0 = arg_1_1:getBody().shopId
	local var_1_1 = getProxy(ShopsProxy)
	local var_1_2 = var_1_1:getFirstChargeList() or {}

	if not var_1_0 then
		return
	end

	local var_1_3 = not table.contains(var_1_2, var_1_0)
	local var_1_4 = Goods.Create({
		shop_id = var_1_0
	}, Goods.TYPE_CHARGE)

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_PURCHASE_CLICK, var_1_0)
	print("=================ChargeCommand test======================")
	print(tostring(PLATFORM))
	pg.ConnectionMgr.GetInstance():Send(11501, {
		shop_id = var_1_0,
		device = PLATFORM
	}, 11502, function(arg_2_0)
		if arg_2_0.result == 0 then
			if var_1_1.tradeNoPrev ~= arg_2_0.pay_id then
				if (PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US) and pg.SdkMgr.GetInstance():GetIsPlatform() then
					if PLATFORM_CODE == PLATFORM_JP then
						local var_2_0 = var_1_4:getConfig("airijp_id")
						local var_2_1 = arg_2_0.url
						local var_2_2 = arg_2_0.pay_id

						originalPrint("请求购买的productId：" .. var_2_0)
						originalPrint("请求购买的url：" .. var_2_1)
						originalPrint("请求购买的id为：" .. var_2_2)
						pg.SdkMgr.GetInstance():YoStarPay(var_2_0, var_2_1, var_2_2)
					elseif PLATFORM_CODE == PLATFORM_US then
						if pg.SdkMgr.GetInstance():CheckAudit() then
							originalPrint("serverTag:audit 请求购买物品")
							pg.SdkMgr.GetInstance():AiriBuy(var_1_4:getConfig("airijp_id"), "audit", arg_2_0.pay_id)
						elseif pg.SdkMgr.GetInstance():CheckPreAudit() then
							originalPrint("serverTag:preAudit 请求购买物品")
							pg.SdkMgr.GetInstance():AiriBuy(var_1_4:getConfig("airijp_id"), "preAudit", arg_2_0.pay_id)
						elseif pg.SdkMgr.GetInstance():CheckPretest() then
							originalPrint("serverTag:preTest 请求购买物品")
							pg.SdkMgr.GetInstance():AiriBuy(var_1_4:getConfig("airijp_id"), "preAudit", arg_2_0.pay_id)
						elseif pg.SdkMgr.GetInstance():CheckGoogleSimulator() then
							originalPrint("serverTag:test 请求购买物品")
							pg.SdkMgr.GetInstance():AiriBuy(var_1_4:getConfig("airijp_id"), "test", arg_2_0.pay_id)
						else
							originalPrint("serverTag:production 请求购买物品")
							pg.SdkMgr.GetInstance():AiriBuy(var_1_4:getConfig("airijp_id"), "production", arg_2_0.pay_id)
						end

						originalPrint("请求购买的airijp_id为：" .. var_1_4:getConfig("airijp_id"))
						originalPrint("请求购买的id为：" .. arg_2_0.pay_id)
					end
				else
					local var_2_3 = var_1_4:firstPayDouble() and var_1_3
					local var_2_4 = getProxy(PlayerProxy):getData()
					local var_2_5 = var_1_4:RawGetConfig("money") * 100
					local var_2_6 = var_1_4:getConfig("name")

					if PLATFORM_CODE == PLATFORM_CH and pg.SdkMgr.GetInstance():GetChannelUID() == "21" and var_1_0 == 1001 then
						var_2_6 = "特许巡游凭证(202111)"
					end

					local var_2_7 = 0

					if var_2_3 then
						var_2_7 = var_1_4:getConfig("gem") * 2
					else
						var_2_7 = var_1_4:getConfig("gem") + var_1_4:getConfig("extra_gem")
					end

					local var_2_8 = arg_2_0.pay_id
					local var_2_9 = var_1_4:getConfig("subject")
					local var_2_10 = "-" .. var_2_4.id .. "-" .. var_2_8
					local var_2_11 = arg_2_0.url or ""
					local var_2_12 = arg_2_0.order_sign or ""

					pg.SdkMgr.GetInstance():SdkPay(var_1_4:getConfig("id_str"), var_2_5, var_2_6, var_2_7, var_2_8, var_2_9, var_2_10, var_2_4.name, var_2_11, var_2_12)
				end

				var_1_1.tradeNoPrev = arg_2_0.pay_id

				pg.TrackerMgr.GetInstance():Tracking(TRACKING_PURCHASE, var_1_0)
				getProxy(ShopsProxy):addWaitTimer()
				arg_1_0:sendNotification(GAME.CHARGE_OPERATION_DONE)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("charge_trade_no_error"))
			end
		else
			if arg_2_0.result == 9999 then
				arg_1_0:sendNotification(GAME.CHARGE_OPERATION_DONE)
			end

			if arg_2_0.result == 6 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("charge_error_count_limit"))
			elseif arg_2_0.result == 5002 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("charge_error_disable"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("charge", arg_2_0.result))
			end
		end
	end)
end

return var_0_0
