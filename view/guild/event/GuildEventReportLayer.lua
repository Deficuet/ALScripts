local var_0_0 = class("GuildEventReportLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "GuildEventReportUI"
end

function var_0_0.SetReports(arg_2_0, arg_2_1)
	arg_2_0.reports = arg_2_1
end

function var_0_0.OnGetReportRankList(arg_3_0, arg_3_1)
	arg_3_0.rankPage:ExecuteAction("Show", arg_3_1)
end

function var_0_0.init(arg_4_0)
	arg_4_0.scrollrect = arg_4_0._tf:Find("frame/scrollrect"):GetComponent("LScrollRect")
	arg_4_0.getAll = arg_4_0._tf:Find("frame/get_all")
	arg_4_0.gotAll = arg_4_0._tf:Find("frame/get_all/gray")
	arg_4_0.descTxt = arg_4_0._tf:Find("frame/desc"):GetComponent(typeof(Text))
	arg_4_0.cntTxt = arg_4_0._tf:Find("frame/cnt"):GetComponent(typeof(Text))
	arg_4_0.closeBtn = arg_4_0._tf:Find("frame/close")

	setText(arg_4_0.getAll:Find("Text"), i18n("guild_report_get_all"))

	arg_4_0._parentTf = arg_4_0._tf.parent

	setText(arg_4_0._tf:Find("frame/desc"), i18n("guild_report_tooltip"))

	arg_4_0.rankPage = GuildBossRankPage.New(arg_4_0._tf, arg_4_0.event)
end

function var_0_0.didEnter(arg_5_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)
	onButton(arg_5_0, arg_5_0.closeBtn, function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.getAll, function()
		local var_8_0 = {}

		for iter_8_0, iter_8_1 in pairs(arg_5_0.reports) do
			if iter_8_1:CanSubmit() then
				table.insert(var_8_0, iter_8_1.id)
			end
		end

		if #var_8_0 == 0 then
			return
		end

		arg_5_0:emit(GuildEventReportMediator.ON_SUBMIT_REPORTS, var_8_0)
	end, SFX_PANEL)

	function arg_5_0.scrollrect.onInitItem(arg_9_0)
		arg_5_0:OnInitItem(arg_9_0)
	end

	function arg_5_0.scrollrect.onUpdateItem(arg_10_0, arg_10_1)
		arg_5_0:OnUpdateItem(arg_10_0, arg_10_1)
	end

	arg_5_0:SetTotalCount()
	arg_5_0:UpdateGetAllBtn()
end

function var_0_0.preload(arg_11_0, arg_11_1)
	pg.m02:sendNotification(GAME.GET_GUILD_REPORT, {
		callback = function(arg_12_0)
			arg_11_0:SetReports(arg_12_0)
			arg_11_1()
		end
	})
end

function var_0_0.getResource(arg_13_0)
	local var_13_0 = var_0_0.super.getResource(arg_13_0)
	local var_13_1 = {
		"ui/GuildEventReportUI_atlas",
		"ui/GuildBossRankPage"
	}

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		if noEmptyStr(iter_13_1) and not table.contains(var_13_0, iter_13_1) then
			table.insert(var_13_0, iter_13_1)
		end
	end

	return var_13_0
end

function var_0_0.UpdateReports(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in ipairs(arg_14_1) do
		for iter_14_2, iter_14_3 in pairs(arg_14_0.cards) do
			if iter_14_3.report.id == iter_14_1 then
				local var_14_0 = arg_14_0.reports[iter_14_1]

				iter_14_3:Update(var_14_0)
			end
		end
	end

	arg_14_0:UpdateGetAllBtn()
end

function var_0_0.UpdateGetAllBtn(arg_15_0)
	local var_15_0 = #arg_15_0.displays == 0 or _.all(arg_15_0.displays, function(arg_16_0)
		return not arg_16_0:CanSubmit()
	end)

	setActive(arg_15_0.gotAll, var_15_0)
end

function var_0_0.SetTotalCount(arg_17_0)
	arg_17_0.displays = {}

	for iter_17_0, iter_17_1 in pairs(arg_17_0.reports) do
		table.insert(arg_17_0.displays, iter_17_1)
	end

	local function var_17_0(arg_18_0)
		if arg_18_0.state == 0 then
			return 1
		elseif arg_18_0.state == 1 then
			return 2
		elseif arg_18_0.state == 2 then
			return 0
		end
	end

	table.sort(arg_17_0.displays, function(arg_19_0, arg_19_1)
		return var_17_0(arg_19_0) > var_17_0(arg_19_1)
	end)
	arg_17_0.scrollrect:SetTotalCount(#arg_17_0.displays)

	arg_17_0.cntTxt.text = #arg_17_0.displays .. "/" .. GuildConst.MAX_REPORT_CNT()
end

function var_0_0.OnInitItem(arg_20_0, arg_20_1)
	local var_20_0 = GuildReportCard.New(arg_20_1, arg_20_0)

	if not arg_20_0.cards then
		arg_20_0.cards = {}
	end

	onButton(arg_20_0, var_20_0.getBtn, function()
		if var_20_0.report:IsLock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_can_not_get_tip"))

			return
		end

		arg_20_0:emit(GuildEventReportMediator.ON_SUBMIT_REPORTS, {
			var_20_0.report.id
		})
	end, SFX_PANEL)

	arg_20_0.cards[arg_20_1] = var_20_0
end

function var_0_0.OnUpdateItem(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.cards[arg_22_2]

	if not var_22_0 then
		arg_22_0:OnInitItem(arg_22_2)

		var_22_0 = arg_22_0.cards[arg_22_2]
	end

	local var_22_1 = arg_22_0.displays[arg_22_1 + 1]

	var_22_0:Update(var_22_1)
end

function var_0_0.ShowReportRank(arg_23_0, arg_23_1)
	arg_23_0:emit(GuildEventReportMediator.GET_REPORT_RANK, arg_23_1)
end

function var_0_0.willExit(arg_24_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_24_0._tf, arg_24_0._parentTf)

	if arg_24_0.cards then
		for iter_24_0, iter_24_1 in pairs(arg_24_0.cards) do
			iter_24_1:Dispose()
		end

		arg_24_0.cards = nil
	end

	if arg_24_0.rankPage then
		arg_24_0.rankPage:Destroy()

		arg_24_0.rankPage = nil
	end
end

return var_0_0
