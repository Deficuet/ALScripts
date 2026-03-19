local var_0_0 = class("TrackingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.chapterId
	local var_1_2 = var_1_0.fleetIds
	local var_1_3 = var_1_0.operationItem or 0
	local var_1_4 = var_1_0.loopFlag or 0
	local var_1_5 = var_1_0.duties

	if not var_1_5 or var_1_4 == 0 then
		var_1_5 = {}
	end

	local var_1_6 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_5) do
		table.insert(var_1_6, {
			key = iter_1_0,
			value = iter_1_1
		})
	end

	local var_1_7 = getProxy(ChapterProxy)
	local var_1_8 = var_1_7:getChapterById(var_1_1)

	var_1_8.loopFlag = var_1_4

	local var_1_9 = var_1_7:getMapById(var_1_8:getConfig("map"))
	local var_1_10 = var_1_7:GetContinuousData(SYSTEM_SCENARIO)
	local var_1_11

	seriesAsync({
		function(arg_2_0)
			if var_1_9:isRemaster() and var_1_7.remasterTickets <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_tickets_not_enough"))
				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})

				return
			end

			if var_1_9:isActivity() and not var_1_9:isRemaster() and not var_1_8:inActTime() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_close"))
				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})

				return
			end

			if var_1_8:isTriesLimit() and not var_1_8:enoughTimes2Start() then
				if var_1_8:IsSpChapter() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("sp_no_quota"))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))
				end

				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})

				return
			end

			local var_2_0 = getProxy(DailyLevelProxy)

			if var_1_9:getMapType() == Map.ELITE and not var_2_0:IsEliteEnabled() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))
				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})

				return
			end

			if var_1_8.active then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_strategying"))
				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})

				return
			end

			if var_1_9:isEscort() and var_1_7.escortChallengeTimes >= var_1_7:getMaxEscortChallengeTimes() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("escort_less_count_to_combat"))
				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})

				return
			end

			arg_2_0()
		end,
		function(arg_3_0)
			if var_1_8:getConfig("type") ~= Chapter.CustomFleet then
				arg_3_0()

				return
			end

			local var_3_0, var_3_1 = var_1_8:IsEliteFleetLegal()

			if var_3_0 then
				arg_3_0()
			else
				pg.TipsMgr.GetInstance():ShowTips(var_3_1)
				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})

				return
			end
		end,
		function(arg_4_0)
			local var_4_0 = var_1_8:getConfig("oil")

			if var_1_8:IsSupportSubmarineStage() and #var_1_8:getSupportFleet() > 0 then
				var_4_0 = var_4_0 + getGameset("submarine_support_oil_consume")[1]
			end

			local var_4_1 = var_4_0 * var_0_0.CalculateSpItemMoreCostRate(var_1_3)

			if not getProxy(PlayerProxy):getRawData():isEnough({
				oil = var_4_1
			}) then
				if not ItemTipPanel.ShowOilBuyTip(var_4_1) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))
				end

				arg_1_0:sendNotification(GAME.TRACKING_ERROR, {
					chapter = var_1_8
				})
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_STRIKE_FAILD)

				return
			end

			arg_4_0()
		end,
		function(arg_5_0)
			if var_1_8:getConfig("type") == Chapter.SelectFleet then
				var_1_11 = {
					[FleetType.Normal] = {},
					[FleetType.Submarine] = {},
					[FleetType.Support] = Clone(var_1_8.eliteFleetList[FleetType.Support])
				}

				local var_5_0 = false
				local var_5_1 = ""

				for iter_5_0, iter_5_1 in ipairs(var_1_2) do
					local var_5_2 = getProxy(FleetProxy):getFleetById(iter_5_1)
					local var_5_3, var_5_4 = var_5_2:ChangeToElite()

					table.insert(var_1_11[var_5_4], var_5_3)

					if not var_5_0 then
						local var_5_5

						var_5_0, var_5_5 = var_5_2:GetEnergyStatus()
					end
				end
			else
				var_1_11 = var_1_8.eliteFleetList
			end

			var_1_11 = Chapter.PackEliteFleetInfo(var_1_11)

			local var_5_6 = {}

			if hasTiredState then
				table.insert(var_5_6, function(arg_6_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = tooltip,
						onYes = arg_6_0
					})
				end)
			end

			seriesAsync(var_5_6, arg_5_0)
		end,
		function(arg_7_0)
			if var_1_9:isRemaster() and PlayerPrefs.GetString("remaster_tip") ~= pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") and (not var_1_10 or var_1_10:IsFirstBattle()) then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					showStopRemind = true,
					content = i18n("levelScene_activate_remaster"),
					onYes = function()
						if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
							PlayerPrefs.SetString("remaster_tip", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))
						end

						arg_7_0()
					end
				})

				return
			end

			arg_7_0()
		end,
		function(arg_9_0)
			local var_9_0 = var_1_8:getConfig("enter_story")
			local var_9_1 = var_1_8:getConfig("enter_story_limit")

			if var_9_0 and var_9_0 ~= "" and arg_1_0:isCrossStoryLimit(var_9_1) and not var_1_9:isRemaster() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_9_0) then
				local var_9_2 = tonumber(var_9_0)

				if var_9_2 and var_9_2 > 0 then
					arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
						system = SYSTEM_PERFORM,
						stageId = var_9_2,
						exitCallback = arg_9_0
					})

					return
				else
					ChapterOpCommand.PlayChapterStory(var_9_0, arg_9_0, var_1_8:isLoop() and PlayerPrefs.GetInt("chapter_autofight_flag_" .. var_1_8.id, 1) == 1)

					return
				end
			end

			arg_9_0()
		end,
		function(arg_10_0)
			if var_1_10 then
				local var_10_0 = var_1_10:GetRestBattleTime()
				local var_10_1 = {
					1,
					1,
					2
				}

				if var_1_9:isRemaster() then
					table.insert(var_10_1, 1)
				end

				if var_10_0 > _.reduce(var_10_1, -1, function(arg_11_0, arg_11_1)
					return arg_11_0 + arg_11_1
				end) then
					arg_1_0:sendNotification(15300, {
						type = 2,
						ver_str = string.format("tracking Chapter %d by CO times %d", var_1_8.id, var_10_0)
					})
				end
			end

			arg_10_0()
		end,
		function(arg_12_0)
			arg_1_0.chapterId = var_1_1
			arg_1_0.fleetDatas = var_1_11
			arg_1_0.loopFlag = var_1_4
			arg_1_0.operationItem = var_1_3
			arg_1_0.dutiesKeyValue = var_1_6
			arg_1_0.autoFightFlag = var_1_0.autoFightFlag

			arg_1_0:sendProto()
		end
	})
end

function var_0_0.sendProto(arg_13_0)
	local var_13_0 = arg_13_0.chapterId
	local var_13_1 = arg_13_0.fleetIds
	local var_13_2 = arg_13_0.fleetDatas
	local var_13_3 = arg_13_0.operationItem
	local var_13_4 = arg_13_0.loopFlag
	local var_13_5 = arg_13_0.dutiesKeyValue
	local var_13_6 = arg_13_0.autoFightFlag

	pg.ConnectionMgr.GetInstance():Send(13101, {
		id = var_13_0,
		fleet = var_13_2,
		operation_item = var_13_3,
		loop_flag = var_13_4,
		fleet_duties = var_13_5
	}, 13102, function(arg_14_0)
		if arg_14_0.result == 0 then
			local var_14_0 = getProxy(ChapterProxy)
			local var_14_1 = var_14_0:getChapterById(var_13_0)
			local var_14_2 = var_14_0:getMapById(var_14_1:getConfig("map"))
			local var_14_3 = getProxy(PlayerProxy)
			local var_14_4 = var_14_3:getData()

			var_14_1:update(arg_14_0.current_chapter)

			local var_14_5 = var_14_1:getConfig("oil")

			if var_14_1:IsSupportSubmarineStage() and var_14_1:getChapterSupportFleet() then
				var_14_5 = var_14_5 + getGameset("submarine_support_oil_consume")[1]
			end

			var_14_4:consume({
				oil = var_14_5 * var_14_1:GetExtraCostRate()
			})
			var_14_3:updatePlayer(var_14_4)

			if var_13_3 ~= 0 then
				getProxy(BagProxy):removeItemById(var_13_3, 1)
			end

			for iter_14_0, iter_14_1 in pairs(var_14_1.cells) do
				if ChapterConst.NeedMarkAsLurk(iter_14_1) then
					iter_14_1.trait = ChapterConst.TraitLurk
				end
			end

			for iter_14_2, iter_14_3 in ipairs(var_14_1.champions) do
				iter_14_3.trait = ChapterConst.TraitLurk
			end

			var_14_0:updateChapter(var_14_1)

			if var_14_2:isEscort() then
				var_14_0.escortChallengeTimes = var_14_0.escortChallengeTimes + 1
			end

			if var_14_2:isRemaster() then
				var_14_0.remasterTickets = var_14_0.remasterTickets - 1
			end

			local var_14_6 = var_14_0:GetContinuousData(SYSTEM_SCENARIO)

			if var_14_6 then
				var_14_6:TryActivate()
			end

			arg_13_0:sendNotification(GAME.TRACKING_DONE, var_14_1)
			getProxy(ChapterProxy):updateExtraFlag(var_14_1, var_14_1:getExtraFlags(), {}, true)

			if var_13_4 ~= 0 and var_13_6 then
				getProxy(ChapterProxy):SetChapterAutoFlag(var_13_0, true)
			end

			return
		end

		if arg_14_0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_retry"))
			arg_13_0:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		elseif arg_14_0.result == 3010 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_3001"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("levelScene_tracking_erro", arg_14_0.result))
		end

		local var_14_7 = getProxy(ChapterProxy):getChapterById(var_13_0)

		arg_13_0:sendNotification(GAME.TRACKING_ERROR, {
			chapter = var_14_7
		})
	end)
end

function var_0_0.isCrossStoryLimit(arg_15_0, arg_15_1)
	local var_15_0 = true

	if arg_15_1 ~= "" and #arg_15_1 > 0 then
		var_15_0 = _.all(arg_15_1, function(arg_16_0)
			if arg_16_0[1] == 1 then
				local var_16_0 = getProxy(TaskProxy):getTaskById(arg_16_0[2])

				return var_16_0 and not var_16_0:isFinish()
			end

			return false
		end)
	end

	return var_15_0
end

function var_0_0.CalculateSpItemMoreCostRate(arg_17_0)
	local var_17_0 = 1

	if not arg_17_0 or arg_17_0 == 0 then
		return var_17_0
	end

	local var_17_1 = Item.getConfigData(arg_17_0).usage_arg
	local var_17_2 = _.map(string.split(string.sub(var_17_1, 2, -2), ","), function(arg_18_0)
		return tonumber(arg_18_0)
	end)

	for iter_17_0, iter_17_1 in ipairs(var_17_2) do
		local var_17_3 = pg.benefit_buff_template[iter_17_0]

		if var_17_3 and var_17_3.benefit_type == Chapter.OPERATION_BUFF_TYPE_COST then
			var_17_0 = var_17_0 + tonumber(var_17_3.benefit_effect) * 0.01
		end
	end

	return (math.max(1, var_17_0))
end

return var_0_0
