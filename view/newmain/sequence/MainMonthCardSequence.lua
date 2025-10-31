local var_0_0 = class("MainMonthCardSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = MonthCardOutDateTipPanel.GetMonthCardEndDate()

	if var_1_0 == 0 then
		arg_1_1()

		return
	end

	local var_1_1 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_1_2 = MonthCardOutDateTipPanel.GetMonthCardTipDate()

	if var_1_1 >= var_1_0 - 259200 and var_1_2 < var_1_0 - 259200 then
		arg_1_0:ShowMsg(var_1_0, var_1_1, arg_1_1)
	else
		arg_1_1()
	end
end

function var_0_0.ShowMsg(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	MonthCardOutDateTipPanel.SetMonthCardTipDate(arg_2_2)

	local var_2_0 = pg.TimeMgr.GetInstance():STimeDescS(math.min(arg_2_2, arg_2_1), "*t")
	local var_2_1 = i18n("trade_card_tips4", var_2_0.year, var_2_0.month, var_2_0.day)
	local var_2_2 = pg.TimeMgr.GetInstance():STimeDescS(arg_2_1, "*t")
	local var_2_3 = i18n("trade_card_tips4", var_2_2.year, var_2_2.month, var_2_2.day)
	local var_2_4 = arg_2_1 <= arg_2_2

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		type = MSGBOX_TYPE_MONTH_CARD_TIP,
		title = pg.MsgboxMgr.TITLE_INFORMATION,
		content = i18n(var_2_4 and "trade_card_tips2" or "trade_card_tips3", var_2_3),
		dateText = var_2_1,
		yesText = i18n("trade_card_tips1"),
		onClose = arg_2_3,
		onYes = function()
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
				confirmMonthCard = true,
				wrap = ChargeScene.TYPE_DIAMOND
			})
		end
	})
end

return var_0_0
