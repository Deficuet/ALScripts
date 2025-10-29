local var_0_0 = class("IslandSeasonReviewPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonReviewPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("content")

	setText(var_2_0:Find("infos/left/Text"), i18n("island_first_season"))

	arg_2_0.contentTF = var_2_0:Find("infos")
	arg_2_0.emptyTF = var_2_0:Find("empty")

	setText(arg_2_0.emptyTF, i18n("island_season_review_miss"))
	setText(arg_2_0.contentTF:Find("season/title/Text"), i18n("island_season_title"))
	setText(arg_2_0.contentTF:Find("prod/title/Text"), i18n("island_season_review_produce"))
	setText(arg_2_0.contentTF:Find("relax/title/Text"), i18n("island_season_review_relax"))

	arg_2_0.iconTF = arg_2_0.contentTF:Find("island/icon_mask/icon")
	arg_2_0.infoTFs = {
		arg_2_0.contentTF:Find("island/list"),
		arg_2_0.contentTF:Find("season/list"),
		arg_2_0.contentTF:Find("prod/list"),
		arg_2_0.contentTF:Find("relax/list")
	}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.infoTFs) do
		eachChild(iter_2_1, function(arg_3_0)
			setText(arg_3_0:Find("name"), IslandSeasonReview.KEY2NAME[tonumber(arg_3_0.name)])
		end)
	end
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.newestId = IslandSeasonAgency.GetCurrentSeason() - 1
	arg_4_0.switchPanel = IslandSeasonSwitchPanel.New(arg_4_0._tf, arg_4_0.event, setmetatable({
		count = arg_4_0.newestId,
		onSelected = function(arg_5_0)
			arg_4_0:Flush(arg_5_0)
		end,
		defaultSelId = arg_4_0.newestId
	}, {
		__index = arg_4_0.contextData
	}))
	arg_4_0.rankType = PowerRank.TYPE_ISLAND_SEASON_PT
	arg_4_0.playerRankVOs = {}
end

function var_0_0.Show(arg_6_0)
	arg_6_0.super.Show(arg_6_0)
	arg_6_0.switchPanel:ExecuteAction("Show")
end

function var_0_0.Flush(arg_7_0, arg_7_1)
	local var_7_0 = getProxy(IslandProxy):GetIsland():GetSeasonAgency():GetReviewData(arg_7_1)

	setActive(arg_7_0.emptyTF, not var_7_0)
	setActive(arg_7_0.contentTF, var_7_0)

	if var_7_0 then
		for iter_7_0, iter_7_1 in ipairs(arg_7_0.infoTFs) do
			eachChild(iter_7_1, function(arg_8_0)
				setText(arg_8_0:Find("value"), var_7_0:GetRecordData(tonumber(arg_8_0.name)))
			end)
		end
	end

	arg_7_0.seasonId = arg_7_1

	if not arg_7_0.playerRankVOs[arg_7_1] or getProxy(BillboardProxy):canFetch(arg_7_0.rankType, arg_7_0.seasonId) then
		arg_7_0:emit(IslandMediator.ON_GET_SEASON_RANK, arg_7_0.rankType, arg_7_0.seasonId)
	else
		arg_7_0:UpdataIcon()
	end
end

function var_0_0.UpdateRankVOs(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0.playerRankVOs[arg_9_1] = arg_9_3
end

function var_0_0.UpdataIcon(arg_10_0)
	local var_10_0 = arg_10_0.playerRankVOs[arg_10_0.seasonId]

	if var_10_0 then
		local var_10_1 = "squareicon/" .. pg.ship_skin_template[var_10_0.skinId].prefab

		GetImageSpriteFromAtlasAsync(var_10_1, "", arg_10_0.iconTF)
	end
end

return var_0_0
