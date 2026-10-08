local var_0_0 = class("EndChapterAutoCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = var_1_0.isReset
	local var_1_3 = getProxy(ChapterAutoProxy)
	local var_1_4 = var_1_3:GetCommissionList()
	local var_1_5 = #var_1_4
	local var_1_6 = underscore.reduce(var_1_4, 0, function(arg_2_0, arg_2_1)
		return arg_2_0 + (arg_2_1:UsedTicket() and 1 or 0)
	end)
	local var_1_7, var_1_8 = var_1_3:GetFinishedCnt()
	local var_1_9 = var_1_5 - var_1_7
	local var_1_10 = var_1_6 - var_1_8
	local var_1_11 = var_1_4[1].type
	local var_1_12 = var_1_4[1].id
	local var_1_13 = {}

	if var_1_9 > 0 then
		table.insert(var_1_13, function(arg_3_0)
			local var_3_0 = switch(var_1_11, {
				[ChapterAutoProxy.TYPE.SLG] = function()
					return "auto_battle_ing_stop_tips"
				end,
				[ChapterAutoProxy.TYPE.WORLD] = function()
					return var_1_2 and "world_auto_plan_error_tip6" or "world_auto_plan_cancel_tip"
				end
			})

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n(var_3_0),
				onYes = arg_3_0
			})
		end)
	end

	if underscore.any(var_1_4, function(arg_6_0)
		return not arg_6_0:IsFinished() and arg_6_0:UsedTicket() and pg.TimeMgr.GetInstance():GetServerTime() > arg_6_0:GetTicketTime()
	end) then
		table.insert(var_1_13, function(arg_7_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("auto_battle_drop_book_expired"),
				onYes = arg_7_0
			})
		end)
	end

	if var_1_11 == ChapterAutoProxy.TYPE.SLG then
		local var_1_14 = var_1_4[1]:GetClassExpAward() * var_1_7
		local var_1_15 = getProxy(NavalAcademyProxy)
		local var_1_16 = var_1_15:getCourse():GetProficiency()
		local var_1_17 = var_1_15:GetClassVO():GetMaxProficiency()
		local var_1_18 = var_1_16 + var_1_14

		if var_1_17 < var_1_18 then
			table.insert(var_1_13, function(arg_8_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("auto_battle_drop_classEXP_overflow", var_1_18 - var_1_17),
					onYes = arg_8_0
				})
			end)
		end

		local var_1_19 = underscore.reduce(var_1_4, 0, function(arg_9_0, arg_9_1)
			return arg_9_0 + (arg_9_1:IsFinished() and arg_9_1:UsedTicket() and arg_9_1:GetExpBookAward() or 0)
		end)
		local var_1_20 = getProxy(BagProxy):getItemCountById(ChapterAutoCommission.EXP_BOOK_ID) + var_1_19
		local var_1_21 = Item.getConfigData(ChapterAutoCommission.EXP_BOOK_ID).max_num

		if var_1_21 < var_1_20 then
			table.insert(var_1_13, function(arg_10_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("auto_battle_drop_bookEXP_overflow", var_1_20 - var_1_21),
					onYes = arg_10_0
				})
			end)
		end
	end

	if var_1_11 == ChapterAutoProxy.TYPE.WORLD then
		table.insert(var_1_13, function(arg_11_0)
			WorldConst.ReqWorldCheck(arg_11_0)
		end)
	end

	seriesAsync(var_1_13, function()
		arg_1_0:Send(var_1_11, var_1_12, var_1_7, var_1_8, var_1_9, var_1_10, var_1_4, var_1_2, var_1_1)
	end)
end

function var_0_0.Send(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5, arg_13_6, arg_13_7, arg_13_8, arg_13_9)
	getProxy(ChapterAutoProxy):SetRecordEventFlag(true)
	pg.ConnectionMgr.GetInstance():Send(13014, {
		num = arg_13_3
	}, 13015, function(arg_14_0)
		if arg_14_0.result == 0 then
			local var_14_0 = getProxy(ChapterAutoProxy)

			var_14_0:SetRecordEventFlag(false)
			var_14_0:ClearCommissionList()
			var_14_0:ReduceCostTime(arg_14_0.seconds)
			var_14_0:AddTickets(arg_14_0.chapter_auto_ticket_list)
			var_14_0:IncreaseOil(arg_14_0.oil)

			if arg_13_1 == ChapterAutoProxy.TYPE.WORLD then
				local var_14_1 = nowWorld().staminaMgr

				var_14_1:UpdateStamina()
				var_14_1:PlusStamina(arg_14_0.world_ap)
			end

			local var_14_2 = false

			switch(arg_13_1, {
				[ChapterAutoProxy.TYPE.SLG] = function()
					local var_15_0 = getProxy(ChapterProxy)

					var_15_0:addRemasterPassCount(arg_13_2, nil, arg_13_4)

					local var_15_1 = var_15_0:getChapterById(arg_13_2, true)

					var_15_1:writeDrops(arg_14_0.drop_list)

					if arg_13_6 > 0 and var_15_0:getMapById(var_15_1:getConfig("map")):isRemaster() then
						var_14_2 = true

						local var_15_2 = arg_13_6 * var_15_0:getRemasterTicketCost()

						var_15_0:updateRemasterTicketsNum(math.min(var_15_0.remasterTickets + var_15_2, pg.gameset.reactivity_ticket_max.key_value))
					end
				end
			})
			getProxy(NavalAcademyProxy):AddProficiency(arg_14_0.class_exp)

			local var_14_3 = PlayerConst.addTranDrop(arg_14_0.drop_list)
			local var_14_4 = {}

			if arg_13_1 == ChapterAutoProxy.TYPE.WORLD then
				local var_14_5 = nowWorld()
				local var_14_6 = var_14_5:GetAtlas()

				for iter_14_0, iter_14_1 in ipairs(underscore.first(arg_13_7, arg_13_3)) do
					table.insert(var_14_4, iter_14_1.id)
					var_14_6:AddDelegatedMap(iter_14_1.id)
				end

				getProxy(WorldProxy):RecordDelegateAward({
					var_14_4,
					var_14_3
				})

				if arg_13_8 then
					local var_14_7 = {}

					for iter_14_2, iter_14_3 in ipairs(var_14_4) do
						local var_14_8 = var_14_5.pressingAwardDic[iter_14_3]

						if var_14_8.flag then
							var_14_5:FlagMapPressingAward(iter_14_3)
							var_14_6:MarkMapTransport(iter_14_3)

							local var_14_9 = pg.world_event_complete[var_14_8.id].event_reward_slgbuff

							if #var_14_9 > 0 then
								var_14_7[var_14_9[1]] = defaultValue(var_14_7[var_14_9[1]], 0) + var_14_9[2]
							end
						end
					end

					for iter_14_4, iter_14_5 in pairs(var_14_7) do
						var_14_5:AddGlobalBuff(iter_14_4, iter_14_5)
					end
				end
			end

			arg_13_0:sendNotification(GAME.END_CHAPTER_AUTO_DONE, {
				isRemaster = var_14_2,
				type = arg_13_1,
				id = arg_13_2,
				awards = var_14_3,
				proficiency = arg_14_0.class_exp,
				finishCnt = arg_13_3,
				allCnt = arg_13_3 + arg_13_5,
				mapList = var_14_4
			})
			existCall(arg_13_9)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("chapter_auto_end_fail", arg_14_0.result))
		end
	end)
end

return var_0_0
