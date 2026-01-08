local var_0_0 = class("IslandSeasonPage", import("...base.IslandBasePage"))

var_0_0.PAGE_ACTIVITY = "activity"
var_0_0.PAGE_PT = "pt"
var_0_0.PAGE_TASK = "task"
var_0_0.PAGE_SHOP = "shop"
var_0_0.PAGE_RANK = "rank"
var_0_0.PAGE_REVIEW = "review"

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonUI"
end

function var_0_0.Preload(arg_2_0, arg_2_1)
	pg.PoolMgr.GetInstance():PreloadUI("IslandSeasonActivityPanel", arg_2_1)
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.blurTF = arg_3_0._tf:Find("blur")

	setText(arg_3_0.blurTF:Find("top/title/Text"), i18n("island_season_title"))

	arg_3_0.ptTitleTF = arg_3_0.blurTF:Find("pt_title")
	arg_3_0.otherTitleTF = arg_3_0.blurTF:Find("other_title")

	local var_3_0 = arg_3_0.blurTF:Find("pages")

	arg_3_0.pages = {
		[var_0_0.PAGE_ACTIVITY] = IslandSeasonActivityPanel.New(var_3_0, arg_3_0.event, arg_3_0.contextData),
		[var_0_0.PAGE_PT] = IslandSeasonPtPanel.New(var_3_0, arg_3_0.event, setmetatable({
			ShowMsgBox = function(arg_4_0, arg_4_1)
				arg_3_0:ShowMsgBox(arg_4_1)
			end
		}, {
			__index = arg_3_0.contextData
		})),
		[var_0_0.PAGE_TASK] = IslandSeasonTaskPanel.New(var_3_0, arg_3_0.event, setmetatable({
			ShowMsgBox = function(arg_5_0, arg_5_1)
				arg_3_0:ShowMsgBox(arg_5_1)
			end
		}, {
			__index = arg_3_0.contextData
		})),
		[var_0_0.PAGE_SHOP] = IslandSeasonShopPanel.New(var_3_0, arg_3_0.event, setmetatable({
			openBuyLayer = function(arg_6_0, arg_6_1)
				arg_3_0:OpenPage(IslandShopItemLayer, arg_6_0, arg_6_1)
			end
		}, {
			__index = arg_3_0.contextData
		})),
		[var_0_0.PAGE_RANK] = IslandSeasonRankPanel.New(var_3_0, arg_3_0.event, setmetatable({
			ShowMsgBox = function(arg_7_0, arg_7_1)
				arg_3_0:ShowMsgBox(arg_7_1)
			end
		}, {
			__index = arg_3_0.contextData
		}))
	}

	for iter_3_0, iter_3_1 in pairs(arg_3_0.pages) do
		iter_3_1:RegisterView(arg_3_0.viewComponent)
	end

	local var_3_1 = IslandSeasonAgency.GetCurrentSeason() == 1

	if not var_3_1 then
		arg_3_0.pages[var_0_0.PAGE_REVIEW] = IslandSeasonReviewPanel.New(var_3_0, arg_3_0.event, arg_3_0.contextData)
	end

	arg_3_0.togglesTF = arg_3_0.blurTF:Find("toggles/content")

	setActive(arg_3_0.togglesTF:Find(var_0_0.PAGE_REVIEW), not var_3_1)

	local function var_3_2(arg_8_0, arg_8_1)
		setText(arg_8_0:Find("sel/Text"), arg_8_1)
		setText(arg_8_0:Find("sel/Text/shandw"), arg_8_1)
		setText(arg_8_0:Find("unsel/Text"), arg_8_1)
		setText(arg_8_0:Find("unsel/Text/shandw"), arg_8_1)
	end

	var_3_2(arg_3_0.togglesTF:Find("activity"), i18n("island_season_activity"))
	var_3_2(arg_3_0.togglesTF:Find("pt"), i18n("island_season_pt"))
	var_3_2(arg_3_0.togglesTF:Find("task"), i18n("island_season_task"))
	var_3_2(arg_3_0.togglesTF:Find("shop"), i18n("island_season_shop"))
	var_3_2(arg_3_0.togglesTF:Find("rank"), i18n("island_season_charts"))
	var_3_2(arg_3_0.togglesTF:Find("review"), i18n("island_season_review"))
end

function var_0_0.OnInit(arg_9_0)
	onButton(arg_9_0, arg_9_0.blurTF:Find("top/back"), function()
		arg_9_0:Hide()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.blurTF:Find("top/help"), function()
		arg_9_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_WHITOUT_BTN,
			content = i18n("island_season_help")
		})
	end, SFX_PANEL)
	eachChild(arg_9_0.togglesTF, function(arg_12_0)
		onToggle(arg_9_0, arg_12_0, function(arg_13_0)
			if arg_13_0 then
				arg_9_0.curPage = arg_12_0.name

				arg_9_0:SwitchPage()
			end
		end, SFX_PANEL)
	end)
end

function var_0_0.AddListeners(arg_14_0)
	arg_14_0:AddListener(ActivityProxy.ACTIVITY_UPDATED, arg_14_0.FlushActivityPage)
	arg_14_0:AddListener(IslandSeasonAgency.ADD_PT, arg_14_0.FlushPtPage)
	arg_14_0:AddListener(GAME.ISLAND_GET_SEASON_PT_AWARD_DONE, arg_14_0.FlushPtPage)
	arg_14_0:AddListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_14_0.FlushTaskPage)
	arg_14_0:AddListener(GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE, arg_14_0.FlushTaskPage)
	arg_14_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_14_0.FlushShopPage)
	arg_14_0:AddListener(GAME.ISLAND_GET_SEASON_RANK_DONE, arg_14_0.OnGetRankData)
end

function var_0_0.RemoveListeners(arg_15_0)
	arg_15_0:RemoveListener(ActivityProxy.ACTIVITY_UPDATED, arg_15_0.FlushActivityPage)
	arg_15_0:RemoveListener(IslandSeasonAgency.ADD_PT, arg_15_0.FlushPtPage)
	arg_15_0:RemoveListener(GAME.ISLAND_GET_SEASON_PT_AWARD_DONE, arg_15_0.FlushPtPage)
	arg_15_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_15_0.FlushTaskPage)
	arg_15_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE, arg_15_0.FlushTaskPage)
	arg_15_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_15_0.FlushShopPage)
	arg_15_0:RemoveListener(GAME.ISLAND_GET_SEASON_RANK_DONE, arg_15_0.OnGetRankData)
end

function var_0_0.OnShow(arg_16_0, arg_16_1)
	arg_16_0.contextData.season = getProxy(IslandProxy):GetIsland():GetSeasonAgency():GetSeason()

	local var_16_0 = arg_16_0.contextData

	if arg_16_1 and arg_16_1.target_act_id then
		triggerToggle(arg_16_0.togglesTF:Find(var_0_0.PAGE_ACTIVITY), true)
		arg_16_0.pages[var_0_0.PAGE_ACTIVITY]:ExecuteAction("verifyTabs", arg_16_1.target_act_id)
	else
		triggerToggle(arg_16_0.togglesTF:Find(var_0_0.PAGE_ACTIVITY), true)
	end
end

local var_0_1 = {
	[var_0_0.PAGE_ACTIVITY] = 1,
	[var_0_0.PAGE_PT] = 2,
	[var_0_0.PAGE_TASK] = 3,
	[var_0_0.PAGE_SHOP] = 3,
	[var_0_0.PAGE_RANK] = 3
}

function var_0_0.SwitchPage(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.pages) do
		if iter_17_0 == arg_17_0.curPage then
			iter_17_1:ExecuteAction("Show")
		else
			iter_17_1:ExecuteAction("Hide")
		end

		local var_17_0 = var_0_1[arg_17_0.curPage]

		SetCompomentEnabled(arg_17_0.blurTF, "Image", var_17_0 == 1 or var_17_0 == 3)
		setActive(arg_17_0.ptTitleTF, var_17_0 == 2)
		setActive(arg_17_0.otherTitleTF, var_17_0 == 3)

		if var_17_0 == 1 or var_17_0 == 3 then
			arg_17_0:OverlayPanel(arg_17_0.blurTF, {
				pbList = {
					arg_17_0.blurTF
				}
			})
		else
			arg_17_0:UnOverlayPanel(arg_17_0.blurTF, arg_17_0._tf)
		end
	end
end

function var_0_0.FlushActivityPage(arg_18_0, arg_18_1)
	arg_18_0.pages[var_0_0.PAGE_ACTIVITY]:ExecuteAction("updateActivity", arg_18_1)
end

function var_0_0.FlushPtPage(arg_19_0)
	arg_19_0.contextData.season = getProxy(IslandProxy):GetIsland():GetSeasonAgency():GetSeason()

	arg_19_0.pages[var_0_0.PAGE_PT]:ExecuteAction("Flush")
end

function var_0_0.FlushTaskPage(arg_20_0)
	arg_20_0.pages[var_0_0.PAGE_TASK]:ExecuteAction("Flush")
end

function var_0_0.FlushShopPage(arg_21_0, arg_21_1)
	arg_21_0.pages[var_0_0.PAGE_SHOP]:ExecuteAction("Flush")

	if arg_21_1.operation == IslandConst.SHOP_BUY_COMMODITY then
		arg_21_0:OpenPage(IslandShopBuySuccessLayer, arg_21_1.awards)
	end
end

function var_0_0.OnGetRankData(arg_22_0, arg_22_1)
	arg_22_0.pages[var_0_0.PAGE_RANK]:ExecuteAction("UpdateRankVOs", arg_22_1.seasonId, arg_22_1.list, arg_22_1.playerInfo)
	arg_22_0.pages[var_0_0.PAGE_RANK]:ExecuteAction("UpdataRankView")

	if arg_22_0.pages[var_0_0.PAGE_REVIEW] then
		arg_22_0.pages[var_0_0.PAGE_REVIEW]:ExecuteAction("UpdateRankVOs", arg_22_1.seasonId, arg_22_1.list, arg_22_1.playerInfo)
		arg_22_0.pages[var_0_0.PAGE_REVIEW]:ExecuteAction("UpdataIcon")
	end
end

function var_0_0.OnHide(arg_23_0)
	arg_23_0:UnOverlayPanel(arg_23_0.blurTF, arg_23_0._tf)
	arg_23_0.pages[var_0_0.PAGE_PT]:OnHide()
	arg_23_0.pages[var_0_0.PAGE_ACTIVITY]:Destroy()
	arg_23_0.pages[var_0_0.PAGE_ACTIVITY]:Reset()
end

function var_0_0.OnDisable(arg_24_0)
	arg_24_0:OnHide()
end

function var_0_0.OnDestroy(arg_25_0)
	arg_25_0:OnHide()

	for iter_25_0, iter_25_1 in pairs(arg_25_0.pages) do
		if iter_25_1 then
			iter_25_1:Destroy()

			iter_25_1 = nil
		end
	end
end

return var_0_0
