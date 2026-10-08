local var_0_0 = class("MainFetchPrevPeriodCrusingSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_1_0 and not var_1_0:isEnd() then
		local var_1_1 = var_1_0:GetPreviousPeriodAct()

		if var_1_1 and #var_1_1:GetCrusingUnreceiveAward() > 0 then
			arg_1_0:GetAllAward(var_1_1, arg_1_1)

			return
		end
	end

	arg_1_1()
end

function var_0_0.GetAllAward(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1:GetCrusingUnreceiveAward()

	if #var_2_0 > 0 then
		local var_2_1 = {}

		if arg_2_0:CheckLimitMax(var_2_0) then
			table.insert(var_2_1, function(arg_3_0)
				pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
					contentText = i18n("player_expResource_mail_fullBag"),
					onConfirm = arg_3_0
				})
			end)
		end

		seriesAsync(var_2_1, function()
			pg.m02:sendNotification(GAME.PREV_CRUSING_CMD, {
				cmd = 5,
				activity_id = arg_2_1.id,
				callback = arg_2_2
			})
		end)
	end
end

function var_0_0.CheckLimitMax(arg_5_0, arg_5_1)
	local var_5_0 = getProxy(PlayerProxy):getRawData()

	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		if iter_5_1.type == DROP_TYPE_RESOURCE then
			if iter_5_1.id == 1 then
				if var_5_0:GoldMax(iter_5_1.count) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title"))

					return true
				end
			elseif iter_5_1.id == 2 and var_5_0:OilMax(iter_5_1.count) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title"))

				return true
			end
		elseif iter_5_1.type == DROP_TYPE_ITEM then
			local var_5_1 = Item.getConfigData(iter_5_1.id)

			if var_5_1.type == Item.EXP_BOOK_TYPE and getProxy(BagProxy):getItemCountById(iter_5_1.id) + iter_5_1.count > var_5_1.max_num then
				return true
			end
		end
	end

	return false
end

return var_0_0
