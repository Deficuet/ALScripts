local var_0_0 = class("MainActDataExpirationReminderSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	seriesAsync({
		function(arg_2_0)
			arg_1_0:CheckSkinCouponActivity(arg_2_0)
		end
	}, arg_1_1)
end

function var_0_0.CheckSkinCouponActivity(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_COUPON)

	if not var_3_0 or #var_3_0 == 0 then
		arg_3_1()

		return
	end

	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if iter_3_1:ShouldTipUsage() then
			table.insert(var_3_1, function(arg_4_0)
				iter_3_1:SaveTipTime()
				arg_3_0:ShowTipMsg(iter_3_1, arg_4_0)
			end)
		end
	end

	seriesAsync(var_3_1, arg_3_1)
end

function var_0_0.ShowTipMsg(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1:GetCanUsageCnt()
	local var_5_1 = arg_5_1:GetItemConfig()
	local var_5_2 = {
		{
			type = DROP_TYPE_ITEM,
			id = var_5_1.id,
			count = var_5_0
		}
	}
	local var_5_3 = arg_5_1:GetItemName()
	local var_5_4 = pg.TimeMgr.GetInstance():STimeDescS(arg_5_1.stopTime, "%m.%d")

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		type = MSGBOX_TYPE_ITEM_BOX,
		content = i18n("skin_discount_timelimit", var_5_3, var_5_4),
		items = var_5_2,
		onYes = arg_5_2
	})
end

return var_0_0
