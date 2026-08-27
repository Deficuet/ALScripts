local var_0_0 = class("ChapterAutoPanel", import("view.base.BaseSubView"))

var_0_0.TIP_KEY = "CHAPTER_AUTO_HELP_TIP"

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0.uiTitleText, i18n("auto_battle_headline"))
	setText(arg_2_0.uiTitleEnText, i18n("auto_battle_headline_en"))
	setText(arg_2_0.uiStartBtn:Find("Text"), i18n("auto_battle_confirm_button"))
	setText(arg_2_0.uiTipText, i18n("auto_battle_info_tips"))
	setText(arg_2_0.uiLeftDescText, i18n("auto_battle_cnt"))
	setText(arg_2_0.uiRightDescText, i18n("auto_battle_cnt_book"))
	setText(arg_2_0.uiLeftContentTF:Find("conmuse_time/header"), i18n("auto_battle_time_left"))
	setText(arg_2_0.uiLeftContentTF:Find("remain_time/header"), i18n("auto_battle_cost_time"))
	setText(arg_2_0.uiRightContentTF:Find("oil/header"), i18n("auto_battle_cost_extra"))
	setText(arg_2_0.uiRightContentTF:Find("ticket/header"), i18n("auto_battle_cost_extra"))
	setText(arg_2_0.uiLeftAddBtn:Find("Text"), i18n("auto_battle_add_time"))
	setText(arg_2_0.uiLeftProficiencyHeaderText, i18n("auto_battle_class_exp_head"))
	setText(arg_2_0.uiLeftAwardHeaderText, i18n("auto_battle_base_loot"))
	setText(arg_2_0.uiRightAwardHeaderText, i18n("auto_battle_extra_loot"))

	arg_2_0.oilCostTF = arg_2_0.uiRightContentTF:Find("oil")
	arg_2_0.ticketCostTF = arg_2_0.uiRightContentTF:Find("ticket")
	arg_2_0.awardEmptyTF = arg_2_0._tf:Find("bottom/drops/frame/empty")

	setText(arg_2_0.awardEmptyTF:Find("Text"), i18n("auto_battle_extra_loot_lock"))

	arg_2_0.ticketUIList = UIItemList.New(arg_2_0.uiTicketTF, arg_2_0.uiTicketTF:Find("tpl"))
	arg_2_0.awardUIList = UIItemList.New(arg_2_0.uiRightAwardContentTF, arg_2_0.uiRightAwardContentTF:Find("item"))
	arg_2_0.leftPageUtil = ChapterAutoPageUtil.New(arg_2_0.uiLeftContentTF:Find("value_bg/left"), arg_2_0.uiLeftContentTF:Find("value_bg/right"), arg_2_0.uiLeftContentTF:Find("max"), arg_2_0.uiLeftContentTF:Find("value_bg/value"))
	arg_2_0.rightPageUtil = ChapterAutoPageUtil.New(arg_2_0.uiRightContentTF:Find("value_bg/left"), arg_2_0.uiRightContentTF:Find("value_bg/right"), arg_2_0.uiRightContentTF:Find("max"), arg_2_0.uiRightContentTF:Find("value_bg/value"))
	arg_2_0.addTimePanel = ChapterAutoAddTimePanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.playerId = getProxy(PlayerProxy):getRawData().id
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.ticketUIList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_3_0.ticketList[arg_4_1 + 1]

			setText(arg_4_2:Find("Text"), var_4_0:GetCount())

			local var_4_1 = var_4_0:IsForever()

			setActive(arg_4_2:Find("time"), not var_4_1)

			if not var_4_1 then
				local var_4_2 = var_4_0:GetRemainTime()
				local var_4_3 = var_4_2 > 86400
				local var_4_4 = var_4_3 and "auto_battle_book_day" or "auto_battle_book_hour"
				local var_4_5 = math.floor(var_4_2 / (var_4_3 and 86400 or 3600))

				setText(arg_4_2:Find("time/Text"), i18n(var_4_4, var_4_5))
			end
		end
	end)
	arg_3_0.awardUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateAwardTpl(arg_5_1, arg_5_2)
		end
	end)
	arg_3_0.leftPageUtil:setNumUpdate(function(arg_6_0)
		arg_3_0.count = arg_6_0

		arg_3_0:UpdateLeftContent()
	end)
	arg_3_0.rightPageUtil:setNumUpdate(function(arg_7_0)
		arg_3_0.ticketCnt = arg_7_0

		arg_3_0:UpdateRightContent()
	end)
	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiCloseBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiLeftAddBtn, function()
		arg_3_0.addTimePanel:ExecuteAction("Show")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("top/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("auto_battle_help")
		})
	end, SFX_PANEL)

	arg_3_0.remasterTicketCost = getProxy(ChapterProxy):getRemasterTicketCost()
end

function var_0_0.Show(arg_12_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
	var_0_0.super.Show(arg_12_0)
end

function var_0_0.Hide(arg_13_0)
	var_0_0.super.Hide(arg_13_0)

	if arg_13_0.addTimePanel and arg_13_0.addTimePanel:isShowing() then
		arg_13_0.addTimePanel:Hide()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf, arg_13_0._parentTf)
end

function var_0_0.Enter(arg_14_0, arg_14_1)
	arg_14_0.chapter = arg_14_1

	local var_14_0 = arg_14_1.id

	arg_14_0.config = pg.chapter_auto_statistics[var_14_0]
	arg_14_0.oilCostOnce = arg_14_0.config.oil_limit
	arg_14_0.proficiencyOnce = arg_14_0.config.base_class_exp

	local var_14_1 = getProxy(ChapterAutoProxy)

	arg_14_0.timeCostOnce = var_14_1:GetRecord(ChapterAutoProxy.TYPE.SLG, var_14_0)
	arg_14_0.remainTime = var_14_1:GetRemainTime()
	arg_14_0.storeOil = var_14_1:GetOil()

	setActive(arg_14_0.uiStoreOilTF, arg_14_0.storeOil > 0)
	setText(arg_14_0.uiStoreOilTF:Find("Text"), i18n("auto_battle_oil_store_tip", arg_14_0.storeOil))

	arg_14_0.count = arg_14_0.remainTime >= arg_14_0.timeCostOnce and 1 or 0
	arg_14_0.ticketCnt = 0

	arg_14_0:RefreshTickets()
	arg_14_0.leftPageUtil:setDefaultNum(arg_14_0.count)
	arg_14_0:RefreshLeftPageUtil()
	arg_14_0:UpdateLeftContent()
	arg_14_0.rightPageUtil:setDefaultNum(0)
	arg_14_0:RefreshRightPageUtil()
	arg_14_0:UpdateRightContent()

	arg_14_0.awards = var_0_0.GetAwards(arg_14_0.chapter)

	arg_14_0.awardUIList:align(#arg_14_0.awards)
	arg_14_0:Show()

	if arg_14_0:NeedHelpPop() then
		arg_14_0:PopHelpTip()
	end
end

function var_0_0.RefreshView(arg_15_0)
	arg_15_0:Enter(arg_15_0.chapter)
end

function var_0_0.RefreshLeftPageUtil(arg_16_0)
	arg_16_0.maxCnt = arg_16_0.remainTime > 0 and math.ceil(arg_16_0.remainTime / arg_16_0.timeCostOnce) or 0

	arg_16_0.leftPageUtil:setMaxNum(arg_16_0.maxCnt)
	arg_16_0.leftPageUtil:SetTipInfo({
		arg_16_0.maxCnt
	}, {
		i18n("auto_battle_time_limit_reached")
	})
end

function var_0_0.UpdateLeftContent(arg_17_0)
	local var_17_0 = pg.TimeMgr.GetInstance()
	local var_17_1 = var_17_0:DescCDTime(arg_17_0.remainTime)

	setText(arg_17_0.uiLeftRemainText, arg_17_0.remainTime < 0 and setColorStr(var_17_1, COLOR_RED) or var_17_1)
	setText(arg_17_0.uiLeftConsumeText, var_17_0:DescCDTime(arg_17_0.timeCostOnce * arg_17_0.count))
	setText(arg_17_0.uiLeftProficiencyText, arg_17_0.proficiencyOnce * arg_17_0.count)
	arg_17_0:RefreshRightPageUtil()
end

function var_0_0.RefreshRightPageUtil(arg_18_0)
	arg_18_0.maxTicketCnt = math.min(arg_18_0.ownTicketCnt, arg_18_0.count)

	arg_18_0.rightPageUtil:setMaxNum(arg_18_0.maxTicketCnt)
	arg_18_0.rightPageUtil:SetTipInfo({
		arg_18_0.count,
		arg_18_0.ownTicketCnt
	}, {
		i18n("auto_battle_book_times_reached"),
		i18n("auto_battle_book_max_reached")
	})
	arg_18_0.rightPageUtil:setCurNum(math.min(arg_18_0.ticketCnt, arg_18_0.maxTicketCnt))
end

function var_0_0.RefreshTickets(arg_19_0)
	local var_19_0 = getProxy(ChapterAutoProxy)

	arg_19_0.ticketList = var_19_0:GetTicketListByType(ChapterAutoTicket.TYPE.MAIN)

	table.sort(arg_19_0.ticketList, CompareFuncs({
		function(arg_20_0)
			return arg_20_0.id
		end
	}))
	arg_19_0.ticketUIList:align(#arg_19_0.ticketList)

	arg_19_0.ownTicketCnt = var_19_0:GetValidTicketCntByType(ChapterAutoTicket.TYPE.MAIN)
end

function var_0_0.UpdateRightContent(arg_21_0)
	local var_21_0 = arg_21_0.ticketCnt <= 0
	local var_21_1 = arg_21_0.oilCostOnce * arg_21_0.ticketCnt
	local var_21_2 = i18n("auto_battle_cost_oil", var_21_1)
	local var_21_3 = getProxy(PlayerProxy):getRawData()
	local var_21_4 = var_21_1 - arg_21_0.storeOil > var_21_3.oil

	if var_21_4 then
		var_21_2 = string.gsub(var_21_2, "#92fc63", COLOR_RED)
	end

	setText(arg_21_0.uiRightCostOilText, var_21_0 and "" or var_21_2)

	local var_21_5 = i18n("auto_battle_cost_book", arg_21_0.ticketCnt)
	local var_21_6 = arg_21_0.ticketCnt > arg_21_0.ownTicketCnt

	if var_21_6 then
		var_21_5 = string.gsub(var_21_5, "#92fc63", COLOR_RED)
	end

	setText(arg_21_0.uiRightCostTicketText, var_21_0 and "" or var_21_5)
	setActive(arg_21_0.awardEmptyTF, var_21_0)
	setActive(arg_21_0.oilCostTF:Find("empty"), var_21_0)
	setActive(arg_21_0.ticketCostTF:Find("empty"), var_21_0)

	GetOrAddComponent(arg_21_0.oilCostTF, typeof(CanvasGroup)).alpha = var_21_0 and 0.5 or 1
	GetOrAddComponent(arg_21_0.ticketCostTF, typeof(CanvasGroup)).alpha = var_21_0 and 0.5 or 1

	onButton(arg_21_0, arg_21_0.uiStartBtn, function()
		if arg_21_0.count <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_times_zero"))

			return
		end

		if var_21_4 or var_21_6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

			return
		end

		local var_22_0 = getProxy(ChapterProxy)
		local var_22_1 = var_22_0:getMapById(arg_21_0.chapter:getConfig("map")):isRemaster()

		if var_22_1 and var_22_0.remasterTickets < arg_21_0.ticketCnt * arg_21_0.remasterTicketCost then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_tickets_not_enough"))

			return
		end

		arg_21_0:OnStart(var_22_1)
	end, SFX_PANEL)
end

function var_0_0.OnStart(arg_23_0, arg_23_1)
	seriesAsync({
		function(arg_24_0)
			if arg_23_1 and arg_23_0.ticketCnt > 0 and PlayerPrefs.GetString("remaster_tip") ~= pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					showStopRemind = true,
					content = i18n("levelScene_activate_remaster_auto", arg_23_0.ticketCnt * arg_23_0.remasterTicketCost),
					onYes = function()
						if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
							PlayerPrefs.SetString("remaster_tip", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))
						end

						arg_24_0()
					end
				})

				return
			end

			arg_24_0()
		end
	}, function()
		pg.m02:sendNotification(GAME.START_CHAPTER_AUTO, {
			type = ChapterAutoProxy.TYPE.SLG,
			id = arg_23_0.chapter.id,
			num = arg_23_0.count,
			ticketNum = arg_23_0.ticketCnt
		})
	end)
end

function var_0_0.UpdateAwardTpl(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_0.awards[arg_27_1 + 1]
	local var_27_1 = Drop.Create(var_27_0)

	updateDrop(arg_27_2, var_27_1)
	onButton(arg_27_0, arg_27_2, function()
		if ({
			[99] = true
		})[var_27_1:getConfig("type")] then
			local function var_28_0(arg_29_0)
				local var_29_0 = var_27_1:getConfig("display_icon")
				local var_29_1 = {}

				for iter_29_0, iter_29_1 in ipairs(var_29_0) do
					local var_29_2 = iter_29_1[1]
					local var_29_3 = iter_29_1[2]
					local var_29_4 = var_29_2 == DROP_TYPE_SHIP and not table.contains(arg_29_0, var_29_3)

					var_29_1[#var_29_1 + 1] = {
						type = var_29_2,
						id = var_29_3,
						anonymous = var_29_4
					}
				end

				arg_27_0:emit(BaseUI.ON_DROP_LIST, {
					item2Row = true,
					itemList = var_29_1,
					content = var_27_1:getConfig("display")
				})
			end

			arg_27_0:emit(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, arg_27_0.chapter.id, var_28_0)
		else
			arg_27_0:emit(BaseUI.ON_DROP, var_27_1)
		end
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_30_0)
	if arg_30_0.addTimePanel ~= nil then
		arg_30_0.addTimePanel:Destroy()

		arg_30_0.addTimePanel = nil
	end

	arg_30_0.leftPageUtil:Dispose()
	arg_30_0.rightPageUtil:Dispose()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_30_0._tf, arg_30_0._parentTf)
end

function var_0_0.NeedHelpPop(arg_31_0)
	return PlayerPrefs.GetInt(var_0_0.TIP_KEY .. "_" .. arg_31_0.playerId, 0) == 0
end

function var_0_0.PopHelpTip(arg_32_0)
	PlayerPrefs.SetInt(var_0_0.TIP_KEY .. "_" .. arg_32_0.playerId, 1)
	PlayerPrefs.Save()
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		type = MSGBOX_TYPE_HELP,
		helps = i18n("auto_battle_help")
	})
end

function var_0_0.GetAwards(arg_33_0)
	local var_33_0 = LevelInfoView.getChapterAwards(arg_33_0)
	local var_33_1 = pg.chapter_auto_statistics[arg_33_0.id].drop_display_extra

	if type(var_33_1) == "table" then
		for iter_33_0, iter_33_1 in ipairs(var_33_1) do
			table.insert(var_33_0, {
				iter_33_1[1],
				iter_33_1[2]
			})
		end
	end

	return var_33_0
end

return var_0_0
