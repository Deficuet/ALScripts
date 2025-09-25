local var_0_0 = class("IslandSeasonRankPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonRankPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("content")

	arg_2_0.tipTF = var_2_0:Find("tip")

	setText(arg_2_0.tipTF, i18n("island_season_charts_refresh"))

	local var_2_1 = var_2_0:Find("header")

	setText(var_2_1:Find("rank"), i18n("island_season_charts_ranking"))
	setText(var_2_1:Find("info"), i18n("island_season_charts_information"))
	setText(var_2_1:Find("pt"), i18n("island_season_charts_pt"))
	setText(var_2_1:Find("award"), i18n("island_season_charts_award"))

	arg_2_0.playerRankTF = var_2_0:Find("player_rank")

	setActive(arg_2_0.playerRankTF, false)

	arg_2_0.rankRect = var_2_0:Find("ranks"):GetComponent("LScrollRect")
	arg_2_0.listEmptyTF = var_2_0:Find("ranks/empty")
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.rankType = PowerRank.TYPE_ISLAND_SEASON_PT
	arg_3_0.cards = {}
	arg_3_0.rankVOs = {}
	arg_3_0.playerRankVOs = {}

	function arg_3_0.rankRect.onInitItem(arg_4_0)
		arg_3_0:OnInitItem(arg_4_0)
	end

	function arg_3_0.rankRect.onUpdateItem(arg_5_0, arg_5_1)
		arg_3_0:OnUpdateItem(arg_5_0, arg_5_1)
	end

	arg_3_0.playerCard = IslandRankCard.New(arg_3_0.playerRankTF, IslandRankCard.TYPE_SELF)
	arg_3_0.newestId = IslandSeasonAgency.GetCurrentSeason()

	if arg_3_0.newestId > 1 then
		arg_3_0.switchPanel = IslandSeasonSwitchPanel.New(arg_3_0._tf, arg_3_0.event, setmetatable({
			count = arg_3_0.newestId,
			onSelected = function(arg_6_0)
				arg_3_0:Flush(arg_6_0)
			end,
			defaultSelId = arg_3_0.newestId
		}, {
			__index = arg_3_0.contextData
		}))
	end
end

function var_0_0.OnInitItem(arg_7_0, arg_7_1)
	local var_7_0 = IslandRankCard.New(arg_7_1, IslandRankCard.TYPE_OTHER)

	arg_7_0.cards[arg_7_1] = var_7_0
end

function var_0_0.OnUpdateItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.cards[arg_8_2]

	if not var_8_0 then
		arg_8_0:OnInitItem(arg_8_2)

		var_8_0 = arg_8_0.cards[arg_8_2]
	end

	local var_8_1 = arg_8_0.displayRankVOs[arg_8_1 + 1]

	var_8_0:Update(var_8_1, arg_8_0.seasonId)
end

function var_0_0.Show(arg_9_0)
	arg_9_0.super.Show(arg_9_0)

	if arg_9_0.newestId == 1 then
		arg_9_0:Flush(arg_9_0.newestId)
	else
		arg_9_0.switchPanel:ExecuteAction("Show")
	end

	IslandGuideChecker.CheckGuide("ISLAND_GUIDE_17")
end

function var_0_0.Flush(arg_10_0, arg_10_1)
	arg_10_0.seasonId = arg_10_1

	if not arg_10_0.rankVOs[arg_10_0.seasonId] or getProxy(BillboardProxy):canFetch(arg_10_0.rankType, arg_10_0.seasonId) then
		arg_10_0:emit(IslandMediator.ON_GET_SEASON_RANK, arg_10_0.rankType, arg_10_0.seasonId)
	else
		arg_10_0:UpdataRankView()
	end
end

function var_0_0.UpdateRankVOs(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0.rankVOs[arg_11_1] = arg_11_2
	arg_11_0.playerRankVOs[arg_11_1] = arg_11_3
end

function var_0_0.UpdataRankView(arg_12_0)
	arg_12_0.displayRankVOs = {}

	local var_12_0 = arg_12_0.rankVOs[arg_12_0.seasonId]

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.rankVOs[arg_12_0.seasonId]) do
		table.insert(arg_12_0.displayRankVOs, iter_12_1)
	end

	arg_12_0.rankRect:SetTotalCount(#arg_12_0.displayRankVOs)
	setActive(arg_12_0.listEmptyTF, #arg_12_0.displayRankVOs <= 0)

	local var_12_1 = arg_12_0.playerRankVOs[arg_12_0.seasonId]

	setActive(arg_12_0.playerRankTF, var_12_1)

	if var_12_1 then
		arg_12_0.playerCard:Update(var_12_1, arg_12_0.seasonId)
	end

	setActive(arg_12_0.tipTF, arg_12_0.seasonId == arg_12_0.newestId)
end

function var_0_0.OnDestory(arg_13_0)
	ClearLScrollrect(arg_13_0.rankRect)

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.cards) do
		iter_13_1:Dispose()
	end

	arg_13_0.cards = nil

	arg_13_0.playerCard:Dispose()
end

return var_0_0
