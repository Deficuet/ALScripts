local var_0_0 = class("IslandTradeRankPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTradeRankUI"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0._tf:Find("title/Text"), i18n("island_trade_rank_num_label"))
	setText(arg_2_0._tf:Find("title/Text_1"), i18n("island_trade_rank_info_label"))
	setText(arg_2_0._tf:Find("title/Text_2"), i18n("island_trade_rank_price_label"))
	setText(arg_2_0._tf:Find("tpl/main/visit/Text"), i18n("island_visit_title"))
	setText(arg_2_0._tf:Find("tpl/main/invite/Text"), i18n("island_trade_invite_label"))

	arg_2_0.scrollrect = arg_2_0._tf:Find("scrollrect"):GetComponent("LScrollRect")

	function arg_2_0.scrollrect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollrect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	arg_2_0.selfRankCard = IslandTradeRankCard.New(arg_2_0._tf:Find("tpl"))
	arg_2_0.cards = {}
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2)
	var_0_0.super.Show(arg_5_0)

	arg_5_0.mode = arg_5_2

	seriesAsync({
		function(arg_6_0)
			arg_5_0:RequestRank(arg_6_0)
		end
	}, function()
		local var_7_0, var_7_1 = arg_5_0:GetDislays()

		arg_5_0.rankNums = arg_5_0:GenRank(var_7_0, var_7_1)

		arg_5_0:DisplayResult(var_7_1)
		arg_5_0:UpdateSelfRank(var_7_0)
	end)
end

function var_0_0.GenRank(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = {}

	table.insert(var_8_0, arg_8_1)

	for iter_8_0, iter_8_1 in ipairs(arg_8_2) do
		table.insert(var_8_0, iter_8_1)
	end

	table.sort(var_8_0, function(arg_9_0, arg_9_1)
		return arg_9_0.value > arg_9_1.value
	end)

	local var_8_1 = {}

	for iter_8_2, iter_8_3 in ipairs(var_8_0) do
		var_8_1[iter_8_3.id] = iter_8_2
	end

	return var_8_1
end

function var_0_0.GetDislays(arg_10_0)
	local var_10_0
	local var_10_1

	if arg_10_0.mode == IslandTradePage.MODE_SELL then
		var_10_0, var_10_1 = getProxy(IslandProxy):GetIsland():GetTradeAgency():GetSellRanks()
	elseif arg_10_0.mode == IslandTradePage.MODE_PURCHAS then
		var_10_0, var_10_1 = getProxy(IslandProxy):GetIsland():GetTradeAgency():GetRanks()
	end

	local var_10_2 = {}

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		table.insert(var_10_2, iter_10_1)
	end

	table.sort(var_10_2, function(arg_11_0, arg_11_1)
		return arg_11_0.value > arg_11_1.value
	end)

	return var_10_1, var_10_2
end

function var_0_0.RequestRank(arg_12_0, arg_12_1)
	arg_12_0:emit(IslandBaseMediator.REQ_TRADE_RANK, arg_12_1)
end

function var_0_0.DisplayResult(arg_13_0, arg_13_1)
	arg_13_0.displays = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		table.insert(arg_13_0.displays, iter_13_1)
	end

	table.sort(arg_13_0.displays, function(arg_14_0, arg_14_1)
		return arg_14_0.value > arg_14_1.value
	end)

	local var_13_0 = math.min(10, #arg_13_0.displays)

	arg_13_0.scrollrect:SetTotalCount(var_13_0)
end

function var_0_0.OnInitItem(arg_15_0, arg_15_1)
	local var_15_0 = IslandTradeRankCard.New(arg_15_1)

	onButton(arg_15_0, var_15_0.visitBtn, function()
		arg_15_0:emit(IslandBaseMediator.ENTER_ISLAND, var_15_0.id)
	end, SFX_PANEL)

	arg_15_0.cards[arg_15_1] = var_15_0
end

function var_0_0.OnUpdateItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.cards[arg_17_2]

	if not var_17_0 then
		arg_17_0:OnInitItem(arg_17_2)

		var_17_0 = arg_17_0.cards[arg_17_2]
	end

	local var_17_1 = arg_17_0.displays[arg_17_1 + 1]
	local var_17_2 = arg_17_0.rankNums[var_17_1.id]

	var_17_0:Update(var_17_2, var_17_1, arg_17_1)
end

function var_0_0.UpdateSelfRank(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.rankNums[arg_18_1.id]

	arg_18_0.selfRankCard:Update(var_18_0, arg_18_1, 0)
	onButton(arg_18_0, arg_18_0.selfRankCard.inviteBtn, function()
		arg_18_0:emit(IslandTradePage.OPEN_INVITE_PAGE)
	end, SFX_PANEL)
end

function var_0_0.OnDestory(arg_20_0)
	ClearLScrollrect(arg_20_0.scrollrect)

	for iter_20_0, iter_20_1 in pairs(arg_20_0.cards) do
		iter_20_1:Dispose()
	end

	arg_20_0.cards = nil

	arg_20_0.selfRankCard:Dispose()
end

return var_0_0
