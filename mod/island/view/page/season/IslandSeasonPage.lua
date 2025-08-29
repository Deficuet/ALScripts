local var_0_0 = class("IslandSeasonPage", import("...base.IslandBasePage"))

var_0_0.PAGE_PT = "pt"
var_0_0.PAGE_TASK = "task"
var_0_0.PAGE_SHOP = "shop"
var_0_0.PAGE_RANK = "rank"
var_0_0.PAGE_REVIEW = "review"

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.blurTF = arg_2_0._tf:Find("blur")

	setText(arg_2_0.blurTF:Find("top/title/Text"), i18n("island_season_title"))

	arg_2_0.ptTitleTF = arg_2_0.blurTF:Find("pt_title")
	arg_2_0.otherTitleTF = arg_2_0.blurTF:Find("other_title")

	local var_2_0 = arg_2_0.blurTF:Find("pages")

	arg_2_0.pages = {
		[var_0_0.PAGE_PT] = IslandSeasonPtPanel.New(var_2_0, arg_2_0.event, arg_2_0.contextData),
		[var_0_0.PAGE_TASK] = IslandSeasonTaskPanel.New(var_2_0, arg_2_0.event, arg_2_0.contextData),
		[var_0_0.PAGE_SHOP] = IslandSeasonShopPanel.New(var_2_0, arg_2_0.event, setmetatable({
			openBuyLayer = function(arg_3_0, arg_3_1)
				arg_2_0:OpenPage(IslandShopItemLayer, arg_3_0, arg_3_1)
			end
		}, {
			__index = arg_2_0.contextData
		})),
		[var_0_0.PAGE_RANK] = IslandSeasonRankPanel.New(var_2_0, arg_2_0.event, arg_2_0.contextData)
	}

	local var_2_1 = IslandSeasonAgency.GetCurrentSeason() == 1

	if not var_2_1 then
		arg_2_0.pages[var_0_0.PAGE_REVIEW] = IslandSeasonReviewPanel.New(var_2_0, arg_2_0.event, arg_2_0.contextData)
	end

	arg_2_0.togglesTF = arg_2_0.blurTF:Find("toggles/content")

	setActive(arg_2_0.togglesTF:Find(var_0_0.PAGE_REVIEW), not var_2_1)

	local function var_2_2(arg_4_0, arg_4_1)
		setText(arg_4_0:Find("sel/Text"), arg_4_1)
		setText(arg_4_0:Find("sel/Text/shandw"), arg_4_1)
		setText(arg_4_0:Find("unsel/Text"), arg_4_1)
		setText(arg_4_0:Find("unsel/Text/shandw"), arg_4_1)
	end

	var_2_2(arg_2_0.togglesTF:Find("pt"), i18n("island_season_pt"))
	var_2_2(arg_2_0.togglesTF:Find("task"), i18n("island_season_task"))
	var_2_2(arg_2_0.togglesTF:Find("shop"), i18n("island_season_shop"))
	var_2_2(arg_2_0.togglesTF:Find("rank"), i18n("island_season_charts"))
	var_2_2(arg_2_0.togglesTF:Find("review"), i18n("island_season_review"))
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.blurTF:Find("top/back"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.blurTF:Find("top/help"), function()
		arg_5_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_WHITOUT_BTN,
			content = i18n("island_season_help")
		})
	end, SFX_PANEL)
	eachChild(arg_5_0.togglesTF, function(arg_8_0)
		onToggle(arg_5_0, arg_8_0, function(arg_9_0)
			if arg_9_0 then
				arg_5_0.curPage = arg_8_0.name

				arg_5_0:SwitchPage()
			end
		end, SFX_PANEL)
	end)
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(IslandSeasonAgency.ADD_PT, arg_10_0.FlushPtPage)
	arg_10_0:AddListener(GAME.ISLAND_GET_SEASON_PT_AWARD_DONE, arg_10_0.FlushPtPage)
	arg_10_0:AddListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_10_0.FlushTaskPage)
	arg_10_0:AddListener(GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE, arg_10_0.FlushTaskPage)
	arg_10_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_10_0.FlushShopPage)
	arg_10_0:AddListener(GAME.ISLAND_GET_SEASON_RANK_DONE, arg_10_0.OnGetRankData)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(IslandSeasonAgency.ADD_PT, arg_11_0.FlushPtPage)
	arg_11_0:RemoveListener(GAME.ISLAND_GET_SEASON_PT_AWARD_DONE, arg_11_0.FlushPtPage)
	arg_11_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_11_0.FlushTaskPage)
	arg_11_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE, arg_11_0.FlushTaskPage)
	arg_11_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_11_0.FlushShopPage)
	arg_11_0:RemoveListener(GAME.ISLAND_GET_SEASON_RANK_DONE, arg_11_0.OnGetRankData)
end

function var_0_0.OnShow(arg_12_0)
	arg_12_0.contextData.season = getProxy(IslandProxy):GetIsland():GetSeasonAgency():GetSeason()

	triggerToggle(arg_12_0.togglesTF:Find(var_0_0.PAGE_PT), true)
end

function var_0_0.SwitchPage(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.pages) do
		if iter_13_0 == arg_13_0.curPage then
			iter_13_1:ExecuteAction("Show")
		else
			iter_13_1:ExecuteAction("Hide")
		end

		local var_13_0 = arg_13_0.curPage == var_0_0.PAGE_PT

		SetCompomentEnabled(arg_13_0.blurTF, "Image", not var_13_0)
		setActive(arg_13_0.ptTitleTF, var_13_0)
		setActive(arg_13_0.otherTitleTF, not var_13_0)

		if var_13_0 then
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0.blurTF, arg_13_0._tf)
		else
			pg.UIMgr.GetInstance():OverlayPanelPB(arg_13_0.blurTF, {
				pbList = {
					arg_13_0.blurTF
				},
				groupName = LayerWeightConst.GROUP_ISLAND
			})
		end
	end
end

function var_0_0.FlushPtPage(arg_14_0)
	arg_14_0.contextData.season = getProxy(IslandProxy):GetIsland():GetSeasonAgency():GetSeason()

	arg_14_0.pages[var_0_0.PAGE_PT]:ExecuteAction("Flush")
end

function var_0_0.FlushTaskPage(arg_15_0)
	arg_15_0.pages[var_0_0.PAGE_TASK]:ExecuteAction("Flush")
end

function var_0_0.FlushShopPage(arg_16_0, arg_16_1)
	arg_16_0.pages[var_0_0.PAGE_SHOP]:ExecuteAction("Flush")

	if arg_16_1.operation == IslandConst.SHOP_BUY_COMMODITY then
		arg_16_0:OpenPage(IslandShopBuySuccessLayer, arg_16_1.awards, arg_16_1.ptAward)
	end
end

function var_0_0.OnGetRankData(arg_17_0, arg_17_1)
	arg_17_0.pages[var_0_0.PAGE_RANK]:ExecuteAction("UpdateRankVOs", arg_17_1.seasonId, arg_17_1.list, arg_17_1.playerInfo)
	arg_17_0.pages[var_0_0.PAGE_RANK]:ExecuteAction("UpdataRankView")

	if arg_17_0.pages[var_0_0.PAGE_REVIEW] then
		arg_17_0.pages[var_0_0.PAGE_REVIEW]:ExecuteAction("UpdateRankVOs", arg_17_1.seasonId, arg_17_1.list, arg_17_1.playerInfo)
		arg_17_0.pages[var_0_0.PAGE_REVIEW]:ExecuteAction("UpdataIcon")
	end
end

function var_0_0.OnHide(arg_18_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_18_0.blurTF, arg_18_0._tf)
	arg_18_0.pages[var_0_0.PAGE_PT]:OnHide()
end

function var_0_0.OnDisable(arg_19_0)
	arg_19_0:OnHide()
end

function var_0_0.OnDestroy(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.pages) do
		if iter_20_1 then
			iter_20_1:Destroy()

			iter_20_1 = nil
		end
	end
end

return var_0_0
