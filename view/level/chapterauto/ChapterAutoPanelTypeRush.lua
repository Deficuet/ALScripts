local var_0_0 = class("ChapterAutoPanelTypeRush", import(".ChapterAutoPanel"))

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoPanelTypeRush"
end

function var_0_0.Enter(arg_2_0, arg_2_1)
	local var_2_0 = pg.activity_series_enemy_auto[arg_2_1].link_id

	arg_2_0.activity = getProxy(ActivityProxy):getActivityById(var_2_0)

	assert(arg_2_0.activity, "activity not found for seriesId: " .. arg_2_1)

	arg_2_0.seriesId = arg_2_1
	arg_2_0.config = pg.activity_series_enemy_auto[arg_2_0.seriesId]
	arg_2_0.oilCostOnce = arg_2_0.config.oil_limit
	arg_2_0.proficiencyOnce = arg_2_0.config.base_class_exp

	local var_2_1 = getProxy(ChapterAutoProxy)

	arg_2_0.timeCostOnce = var_2_1:GetRecord(ChapterAutoProxy.TYPE.RUSH, arg_2_0.seriesId)
	arg_2_0.remainTime = var_2_1:GetRemainTime()
	arg_2_0.remasterTicketCost = BossRushChapterRemasterHelper.GetPermanentActivityTicketCost(arg_2_0.activity.actId, arg_2_0.seriesId)
	arg_2_0.storeOil = var_2_1:GetOil()

	setActive(arg_2_0.uiStoreOilTF, arg_2_0.storeOil > 0)
	setText(arg_2_0.uiStoreOilTF:Find("Text"), i18n("auto_battle_oil_store_tip", arg_2_0.storeOil))

	local var_2_2 = arg_2_0.activity:IsPassWithMulti(arg_2_1)
	local var_2_3 = i18n(var_2_2 and "auto_battle_series_finish_tip" or "auto_battle_series_tip")
	local var_2_4 = pg.activity_series_enemy[arg_2_1].whether_singlefight ~= 1

	setText(arg_2_0.uiTipText, (var_2_4 and "" or var_2_3 .. "\n") .. i18n("auto_battle_info_tips"))

	arg_2_0.count = arg_2_0.remainTime >= arg_2_0.timeCostOnce and 1 or 0
	arg_2_0.ticketCnt = 0

	arg_2_0:RefreshTickets()
	arg_2_0.leftPageUtil:setDefaultNum(arg_2_0.count)
	arg_2_0:RefreshLeftPageUtil()
	arg_2_0:UpdateLeftContent()
	arg_2_0.rightPageUtil:setDefaultNum(0)
	arg_2_0:RefreshRightPageUtil()
	arg_2_0:UpdateRightContent()

	arg_2_0.awards = var_0_0.GetAwards(arg_2_0.seriesId)

	arg_2_0.awardUIList:align(#arg_2_0.awards)
	arg_2_0:Show()
end

function var_0_0.RefreshView(arg_3_0)
	arg_3_0:Enter(arg_3_0.seriesId)
end

function var_0_0.UpdateRightContent(arg_4_0)
	local var_4_0 = arg_4_0.ticketCnt <= 0
	local var_4_1 = arg_4_0.oilCostOnce * arg_4_0.ticketCnt
	local var_4_2 = i18n("auto_battle_cost_oil", var_4_1)
	local var_4_3 = getProxy(PlayerProxy):getRawData()
	local var_4_4 = var_4_1 - arg_4_0.storeOil > var_4_3.oil

	if var_4_4 then
		var_4_2 = string.gsub(var_4_2, "#92fc63", COLOR_RED)
	end

	setText(arg_4_0.uiRightCostOilText, var_4_0 and "" or var_4_2)

	local var_4_5 = i18n("auto_battle_cost_book", arg_4_0.ticketCnt)
	local var_4_6 = arg_4_0.ticketCnt > arg_4_0.ownTicketCnt

	if var_4_6 then
		var_4_5 = string.gsub(var_4_5, "#92fc63", COLOR_RED)
	end

	setText(arg_4_0.uiRightCostTicketText, var_4_0 and "" or var_4_5)
	setActive(arg_4_0.awardEmptyTF, var_4_0)
	setActive(arg_4_0.oilCostTF:Find("empty"), var_4_0)
	setActive(arg_4_0.ticketCostTF:Find("empty"), var_4_0)

	GetOrAddComponent(arg_4_0.oilCostTF, typeof(CanvasGroup)).alpha = var_4_0 and 0.5 or 1
	GetOrAddComponent(arg_4_0.ticketCostTF, typeof(CanvasGroup)).alpha = var_4_0 and 0.5 or 1

	onButton(arg_4_0, arg_4_0.uiStartBtn, function()
		if arg_4_0.count <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_times_zero"))

			return
		end

		if var_4_4 or var_4_6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

			return
		end

		if getProxy(ChapterProxy).remasterTickets < arg_4_0.ticketCnt * arg_4_0.remasterTicketCost then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_tickets_not_enough"))

			return
		end

		arg_4_0:OnStart()
	end, SFX_PANEL)
end

function var_0_0.OnStart(arg_6_0)
	seriesAsync({
		function(arg_7_0)
			if arg_6_0.remasterTicketCost > 0 and arg_6_0.ticketCnt > 0 and PlayerPrefs.GetString("remaster_tip") ~= pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					showStopRemind = true,
					content = i18n("levelScene_activate_remaster_auto", arg_6_0.ticketCnt * arg_6_0.remasterTicketCost),
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
		end
	}, function()
		pg.m02:sendNotification(GAME.START_CHAPTER_AUTO, {
			type = ChapterAutoProxy.TYPE.RUSH,
			id = arg_6_0.seriesId,
			num = arg_6_0.count,
			ticketNum = arg_6_0.ticketCnt
		})
	end)
end

function var_0_0.UpdateAwardTpl(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.awards[arg_10_1 + 1]
	local var_10_1 = Drop.Create(var_10_0)

	updateDrop(arg_10_2, var_10_1)
	onButton(arg_10_0, arg_10_2, function()
		arg_10_0:emit(BaseUI.ON_DROP, var_10_1)
	end, SFX_PANEL)
end

function var_0_0.GetAwards(arg_12_0)
	local var_12_0 = pg.activity_series_enemy[arg_12_0]
	local var_12_1 = Clone(var_12_0.pass_awards_display)
	local var_12_2 = pg.activity_series_enemy_auto[arg_12_0].drop_display_extra

	if type(var_12_2) == "table" then
		for iter_12_0, iter_12_1 in ipairs(var_12_2) do
			table.insert(var_12_1, {
				iter_12_1[1],
				iter_12_1[2]
			})
		end
	end

	local var_12_3 = pg.activity_series_enemy_auto[arg_12_0].link_id
	local var_12_4 = getProxy(ActivityProxy):getActivityById(var_12_3)

	if var_12_4 and var_12_4:IsPassWithMulti(arg_12_0) then
		local var_12_5 = var_12_0.additional_awards_display

		if type(var_12_5) == "table" then
			for iter_12_2, iter_12_3 in ipairs(var_12_5) do
				table.insert(var_12_1, {
					iter_12_3[1],
					iter_12_3[2],
					iter_12_3[3]
				})
			end
		end
	end

	return var_12_1
end

return var_0_0
