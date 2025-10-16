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

function var_0_0.UpdateReports(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		for iter_13_2, iter_13_3 in pairs(arg_13_0.cards) do
			if iter_13_3.report.id == iter_13_1 then
				local var_13_0 = arg_13_0.reports[iter_13_1]

				iter_13_3:Update(var_13_0)
			end
		end
	end

	arg_13_0:UpdateGetAllBtn()
end

function var_0_0.UpdateGetAllBtn(arg_14_0)
	local var_14_0 = #arg_14_0.displays == 0 or _.all(arg_14_0.displays, function(arg_15_0)
		return not arg_15_0:CanSubmit()
	end)

	setActive(arg_14_0.gotAll, var_14_0)
end

function var_0_0.SetTotalCount(arg_16_0)
	arg_16_0.displays = {}

	for iter_16_0, iter_16_1 in pairs(arg_16_0.reports) do
		table.insert(arg_16_0.displays, iter_16_1)
	end

	local function var_16_0(arg_17_0)
		if arg_17_0.state == 0 then
			return 1
		elseif arg_17_0.state == 1 then
			return 2
		elseif arg_17_0.state == 2 then
			return 0
		end
	end

	table.sort(arg_16_0.displays, function(arg_18_0, arg_18_1)
		return var_16_0(arg_18_0) > var_16_0(arg_18_1)
	end)
	arg_16_0.scrollrect:SetTotalCount(#arg_16_0.displays)

	arg_16_0.cntTxt.text = #arg_16_0.displays .. "/" .. GuildConst.MAX_REPORT_CNT()
end

function var_0_0.OnInitItem(arg_19_0, arg_19_1)
	local var_19_0 = GuildReportCard.New(arg_19_1, arg_19_0)

	if not arg_19_0.cards then
		arg_19_0.cards = {}
	end

	onButton(arg_19_0, var_19_0.getBtn, function()
		if var_19_0.report:IsLock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_can_not_get_tip"))

			return
		end

		arg_19_0:emit(GuildEventReportMediator.ON_SUBMIT_REPORTS, {
			var_19_0.report.id
		})
	end, SFX_PANEL)

	arg_19_0.cards[arg_19_1] = var_19_0
end

function var_0_0.OnUpdateItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.cards[arg_21_2]

	if not var_21_0 then
		arg_21_0:OnInitItem(arg_21_2)

		var_21_0 = arg_21_0.cards[arg_21_2]
	end

	local var_21_1 = arg_21_0.displays[arg_21_1 + 1]

	var_21_0:Update(var_21_1)
end

function var_0_0.ShowReportRank(arg_22_0, arg_22_1)
	arg_22_0:emit(GuildEventReportMediator.GET_REPORT_RANK, arg_22_1)
end

function var_0_0.willExit(arg_23_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_23_0._tf, arg_23_0._parentTf)

	if arg_23_0.cards then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.cards) do
			iter_23_1:Dispose()
		end

		arg_23_0.cards = nil
	end

	if arg_23_0.rankPage then
		arg_23_0.rankPage:Destroy()

		arg_23_0.rankPage = nil
	end
end

return var_0_0
