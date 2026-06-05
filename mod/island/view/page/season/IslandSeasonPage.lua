local var_0_0 = class("IslandSeasonPage", import("...base.IslandBasePage"))

var_0_0.CLOSE = "IslandSeasonPage:CLOSE"
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

	arg_3_0.playRoomPop = PlayRoomPop.New(arg_3_0.blurTF:Find("playRoomPop"), arg_3_0)

	arg_3_0.playRoomPop:didEnter()
end

function var_0_0.Close(arg_9_0, arg_9_1)
	arg_9_0:emit(IslandMediator.PLAY_ROOM_MATCH_STOP)
	arg_9_0:Hide(arg_9_1)
end

function var_0_0.OnInit(arg_10_0)
	local var_10_0 = arg_10_0.blurTF:Find("top/back")

	onButton(arg_10_0, var_10_0, function()
		arg_10_0:Close(true)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.blurTF:Find("top/help"), function()
		arg_10_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_WHITOUT_BTN,
			content = i18n("island_season_help")
		})
	end, SFX_PANEL)
	eachChild(arg_10_0.togglesTF, function(arg_13_0)
		onToggle(arg_10_0, arg_13_0, function(arg_14_0)
			if arg_14_0 then
				arg_10_0.curPage = arg_13_0.name

				arg_10_0:SwitchPage()
			end
		end, SFX_PANEL)
	end)
	arg_10_0:bind(var_0_0.CLOSE, function()
		arg_10_0:Close(false)
	end)
end

function var_0_0.AddListeners(arg_16_0)
	arg_16_0:AddListener(ActivityProxy.ACTIVITY_UPDATED, arg_16_0.FlushActivityPage)
	arg_16_0:AddListener(IslandSeasonAgency.ADD_PT, arg_16_0.FlushPtPage)
	arg_16_0:AddListener(GAME.ISLAND_GET_SEASON_PT_AWARD_DONE, arg_16_0.FlushPtPage)
	arg_16_0:AddListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_16_0.OnSubmitTaskDone)
	arg_16_0:AddListener(GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE, arg_16_0.OnSubmitTaskDone)
	arg_16_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_16_0.FlushShopPage)
	arg_16_0:AddListener(GAME.ISLAND_GET_SEASON_RANK_DONE, arg_16_0.OnGetRankData)
	arg_16_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_16_0.OnTaskAdded)
	arg_16_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_16_0.OnTaskUpdate)
	arg_16_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_16_0.OnTaskRemove)
	arg_16_0:AddListener(IslandTaskAgency.TASK_FINISH, arg_16_0.OnTaskFinish)
end

function var_0_0.RemoveListeners(arg_17_0)
	arg_17_0:RemoveListener(ActivityProxy.ACTIVITY_UPDATED, arg_17_0.FlushActivityPage)
	arg_17_0:RemoveListener(IslandSeasonAgency.ADD_PT, arg_17_0.FlushPtPage)
	arg_17_0:RemoveListener(GAME.ISLAND_GET_SEASON_PT_AWARD_DONE, arg_17_0.FlushPtPage)
	arg_17_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_17_0.OnSubmitTaskDone)
	arg_17_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_ONE_STEP_DONE, arg_17_0.OnSubmitTaskDone)
	arg_17_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_17_0.FlushShopPage)
	arg_17_0:RemoveListener(GAME.ISLAND_GET_SEASON_RANK_DONE, arg_17_0.OnGetRankData)
	arg_17_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_17_0.OnTaskAdded)
	arg_17_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_17_0.OnTaskUpdate)
	arg_17_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_17_0.OnTaskRemove)
	arg_17_0:RemoveListener(IslandTaskAgency.TASK_FINISH, arg_17_0.OnTaskFinish)
end

function var_0_0.OnShow(arg_18_0, arg_18_1)
	arg_18_0.contextData.season = getProxy(IslandProxy):GetIsland():GetSeasonAgency():GetSeason()

	local var_18_0 = arg_18_0.contextData

	if arg_18_1 and arg_18_1.target_act_id then
		triggerToggle(arg_18_0.togglesTF:Find(var_0_0.PAGE_ACTIVITY), true)
		arg_18_0.pages[var_0_0.PAGE_ACTIVITY]:ExecuteAction("verifyTabs", arg_18_1.target_act_id)
	else
		triggerToggle(arg_18_0.togglesTF:Find(var_0_0.PAGE_ACTIVITY), true)
	end

	arg_18_0.playRoomPop:Show(true)
end

local var_0_1 = {
	[var_0_0.PAGE_ACTIVITY] = 1,
	[var_0_0.PAGE_PT] = 2,
	[var_0_0.PAGE_TASK] = 3,
	[var_0_0.PAGE_SHOP] = 3,
	[var_0_0.PAGE_RANK] = 3,
	[var_0_0.PAGE_REVIEW] = 4
}

function var_0_0.SwitchPage(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.pages) do
		if iter_19_0 == arg_19_0.curPage then
			iter_19_1:ExecuteAction("Show")
		else
			iter_19_1:ExecuteAction("Hide")
		end

		local var_19_0 = var_0_1[arg_19_0.curPage]

		SetCompomentEnabled(arg_19_0.blurTF, "Image", var_19_0 == 1 or var_19_0 == 3 or var_19_0 == 4)
		setActive(arg_19_0.ptTitleTF, var_19_0 == 2)
		setActive(arg_19_0.otherTitleTF, var_19_0 == 3)

		if var_19_0 == 1 or var_19_0 == 3 or var_19_0 == 4 then
			arg_19_0:OverlayPanel(arg_19_0.blurTF, {
				pbList = {
					arg_19_0.blurTF
				}
			})
		else
			arg_19_0:UnOverlayPanel(arg_19_0.blurTF, arg_19_0._tf)
		end
	end
end

function var_0_0.UpdateTaskAct(arg_20_0, arg_20_1)
	arg_20_0.pages[var_0_0.PAGE_ACTIVITY]:ExecuteAction("OnTaskUpdate", arg_20_1)
end

function var_0_0.OnTaskAdded(arg_21_0, arg_21_1)
	if not arg_21_1 then
		return
	end

	arg_21_0:UpdateTaskAct(arg_21_1.id)
end

function var_0_0.OnTaskUpdate(arg_22_0, arg_22_1)
	if not arg_22_1 then
		return
	end

	arg_22_0:UpdateTaskAct(arg_22_1.id)
end

function var_0_0.OnTaskRemove(arg_23_0, arg_23_1)
	if not arg_23_1 then
		return
	end

	arg_23_0:UpdateTaskAct(arg_23_1.id)
end

function var_0_0.OnTaskFinish(arg_24_0, arg_24_1)
	if not arg_24_1 then
		return
	end

	arg_24_0:UpdateTaskAct(arg_24_1)
end

function var_0_0.FlushActivityPage(arg_25_0, arg_25_1)
	arg_25_0.pages[var_0_0.PAGE_ACTIVITY]:ExecuteAction("updateActivity", arg_25_1)
end

function var_0_0.FlushPtPage(arg_26_0)
	arg_26_0.contextData.season = getProxy(IslandProxy):GetIsland():GetSeasonAgency():GetSeason()

	arg_26_0.pages[var_0_0.PAGE_PT]:ExecuteAction("Flush")
end

function var_0_0.OnSubmitTaskDone(arg_27_0)
	arg_27_0:FlushTaskPage()
	arg_27_0.pages[var_0_0.PAGE_ACTIVITY]:ExecuteAction("flushTabs")
end

function var_0_0.FlushTaskPage(arg_28_0)
	arg_28_0.pages[var_0_0.PAGE_TASK]:ExecuteAction("Flush")
end

function var_0_0.FlushShopPage(arg_29_0, arg_29_1)
	arg_29_0.pages[var_0_0.PAGE_SHOP]:ExecuteAction("Flush")

	if arg_29_1.operation == IslandConst.SHOP_BUY_COMMODITY then
		arg_29_0:OpenPage(IslandShopBuySuccessLayer, arg_29_1.awards)
	end
end

function var_0_0.OnGetRankData(arg_30_0, arg_30_1)
	arg_30_0.pages[var_0_0.PAGE_RANK]:ExecuteAction("UpdateRankVOs", arg_30_1.seasonId, arg_30_1.list, arg_30_1.playerInfo)
	arg_30_0.pages[var_0_0.PAGE_RANK]:ExecuteAction("UpdataRankView")

	if arg_30_0.pages[var_0_0.PAGE_REVIEW] then
		arg_30_0.pages[var_0_0.PAGE_REVIEW]:ExecuteAction("UpdateRankVOs", arg_30_1.seasonId, arg_30_1.list, arg_30_1.playerInfo)
		arg_30_0.pages[var_0_0.PAGE_REVIEW]:ExecuteAction("UpdataIcon")
	end
end

function var_0_0.OnHide(arg_31_0)
	arg_31_0.playRoomPop:Show(false)
	arg_31_0:UnOverlayPanel(arg_31_0.blurTF, arg_31_0._tf)
	arg_31_0.pages[var_0_0.PAGE_PT]:OnHide()
	arg_31_0.pages[var_0_0.PAGE_ACTIVITY]:OnHide()

	if arg_31_0.pages[var_0_0.PAGE_REVIEW] then
		arg_31_0.pages[var_0_0.PAGE_REVIEW]:Hide()
	end
end

function var_0_0.OnDisable(arg_32_0)
	arg_32_0:OnHide()
end

function var_0_0.OnDestroy(arg_33_0)
	arg_33_0:OnHide()
	arg_33_0.playRoomPop:willExit()

	arg_33_0.playRoomPop = nil

	for iter_33_0, iter_33_1 in pairs(arg_33_0.pages) do
		if iter_33_1 then
			iter_33_1:Destroy()

			iter_33_1 = nil
		end
	end
end

function var_0_0.OnEnable(arg_34_0)
	arg_34_0:OnShow()
end

return var_0_0
