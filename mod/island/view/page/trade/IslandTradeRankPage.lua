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
		local var_7_0, var_7_1, var_7_2 = arg_5_0:GetDislays()

		arg_5_0.rankNums = var_7_2

		arg_5_0:DisplayResult(var_7_1, var_7_0)
		arg_5_0:UpdateSelfRank(var_7_0)
	end)
end

function var_0_0.GetDislays(arg_8_0)
	local var_8_0
	local var_8_1

	if arg_8_0.mode == IslandTradePage.MODE_SELL then
		var_8_0, var_8_1 = getProxy(IslandProxy):GetIsland():GetTradeAgency():GetSellRanks()
	elseif arg_8_0.mode == IslandTradePage.MODE_PURCHAS then
		var_8_0, var_8_1 = getProxy(IslandProxy):GetIsland():GetTradeAgency():GetRanks()
	end

	local var_8_2 = {}

	table.insert(var_8_2, var_8_1)

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		if iter_8_1:IsVaild() then
			table.insert(var_8_2, iter_8_1)
		end
	end

	table.sort(var_8_2, function(arg_9_0, arg_9_1)
		if arg_8_0.mode == IslandTradePage.MODE_SELL then
			return arg_9_0.value > arg_9_1.value
		elseif arg_8_0.mode == IslandTradePage.MODE_PURCHAS then
			return arg_9_0.value < arg_9_1.value
		end
	end)

	local var_8_3 = {}
	local var_8_4 = 0
	local var_8_5 = 0

	for iter_8_2, iter_8_3 in ipairs(var_8_2) do
		if iter_8_3.value ~= var_8_4 then
			var_8_5 = var_8_5 + 1
			var_8_3[iter_8_3.value] = var_8_5
			var_8_4 = iter_8_3.value
		end
	end

	return var_8_1, var_8_2, var_8_3
end

function var_0_0.RequestRank(arg_10_0, arg_10_1)
	arg_10_0:emit(IslandBaseMediator.REQ_TRADE_RANK, arg_10_1)
end

function var_0_0.DisplayResult(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.displays = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		if iter_11_1.id ~= arg_11_2.id then
			table.insert(arg_11_0.displays, iter_11_1)
		end
	end

	arg_11_0.scrollrect:SetTotalCount(#arg_11_0.displays)
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	local var_12_0 = IslandTradeRankCard.New(arg_12_1)

	onButton(arg_12_0, var_12_0.visitBtn, function()
		arg_12_0:emit(IslandBaseMediator.ENTER_ISLAND, var_12_0.id)
	end, SFX_PANEL)

	arg_12_0.cards[arg_12_1] = var_12_0
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.cards[arg_14_2]

	if not var_14_0 then
		arg_14_0:OnInitItem(arg_14_2)

		var_14_0 = arg_14_0.cards[arg_14_2]
	end

	local var_14_1 = arg_14_0.displays[arg_14_1 + 1]
	local var_14_2 = arg_14_0.rankNums[var_14_1.value]

	assert(var_14_2, var_14_1.value)
	var_14_0:Update(var_14_2, var_14_1, arg_14_1)
end

function var_0_0.UpdateSelfRank(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.rankNums[arg_15_1.value]

	arg_15_0.selfRankCard:Update(var_15_0, arg_15_1, 0)
	onButton(arg_15_0, arg_15_0.selfRankCard.inviteBtn, function()
		arg_15_0:emit(IslandTradePage.OPEN_INVITE_PAGE)
	end, SFX_PANEL)
end

function var_0_0.OnDestory(arg_17_0)
	ClearLScrollrect(arg_17_0.scrollrect)

	for iter_17_0, iter_17_1 in pairs(arg_17_0.cards) do
		iter_17_1:Dispose()
	end

	arg_17_0.cards = nil

	arg_17_0.selfRankCard:Dispose()
end

return var_0_0
