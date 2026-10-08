local var_0_0 = class("BillboardScene", import("..base.BaseUI"))

var_0_0.SINGLE_SHOW = {
	PowerRank.TYPE_EXTRA_CHAPTER,
	PowerRank.TYPE_ACT_BOSS_BATTLE,
	PowerRank.TYPE_BOSSRUSH
}

function var_0_0.getUIName(arg_1_0)
	return "BillboardUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"commonbg/bg_fengshan",
		"billboardframe",
		"weaponframes",
		"shiptype",
		"ui/iconcolorful"
	}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	for iter_2_0, iter_2_1 in pairs(PowerRank.typeInfo) do
		local var_2_2 = iter_2_1.score_icon

		if var_2_2 and var_2_2[1] then
			var_2_1(var_2_2[1])
		end
	end

	local var_2_3 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK)

	for iter_2_2, iter_2_3 in ipairs(var_2_3) do
		if not iter_2_3:isEnd() and tonumber(iter_2_3:getConfig("config_data")) > 0 then
			local var_2_4 = iter_2_3:getConfig("config_id")
			local var_2_5 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_2_4
			}):getIcon()

			var_2_1(var_2_5)
		end
	end

	local var_2_6 = checkExist(arg_2_1, {
		"page"
	}) or PowerRank.TYPE_POWER
	local var_2_7 = checkExist(arg_2_1, {
		"act_id"
	}) or checkExist(PowerRank:getActivityByRankType(var_2_6), {
		"id"
	})
	local var_2_8 = getProxy(BillboardProxy):getRankList(var_2_6, var_2_7)

	for iter_2_4, iter_2_5 in ipairs(var_2_8 or {}) do
		var_2_1("emblem/" .. iter_2_5.arenaRank)
		var_2_1("emblem/n_" .. iter_2_5.arenaRank)
	end

	if not var_2_8 then
		for iter_2_6 = 1, #pg.arena_data_rank.all do
			var_2_1("emblem/" .. iter_2_6)
			var_2_1("emblem/n_" .. iter_2_6)
		end
	end

	local var_2_9 = getProxy(MilitaryExerciseProxy):RawGetSeasonInfo()

	if var_2_9 then
		local var_2_10 = SeasonInfo.getEmblem(var_2_9.score, var_2_9.rank)

		var_2_1("emblem/" .. var_2_10)
		var_2_1("emblem/n_" .. var_2_10)
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.updateRankList(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	if not arg_4_0.rankVOs then
		arg_4_0.rankVOs = {}
	end

	if not arg_4_0.playerRankVOs then
		arg_4_0.playerRankVOs = {}
	end

	arg_4_0.rankVOs[arg_4_1] = arg_4_2

	if not arg_4_0.ptRanks then
		arg_4_0.ptRanks = {}
	end

	if arg_4_1 == PowerRank.TYPE_PT then
		assert(arg_4_4)

		arg_4_0.ptRanks[arg_4_4] = arg_4_2
		arg_4_0.playerPTRankVOMap = arg_4_0.playerPTRankVOMap or {}
		arg_4_0.playerPTRankVOMap[arg_4_4] = arg_4_3
	end

	arg_4_0.playerRankVOs[arg_4_1] = arg_4_3
end

function var_0_0.init(arg_5_0)
	arg_5_0.blurPanel = arg_5_0._tf:Find("blur_panel")
	arg_5_0.rankRect = arg_5_0._tf:Find("main/frame/ranks"):GetComponent("LScrollRect")
	arg_5_0.playerRankTF = arg_5_0._tf:Find("main/frame/player_rank")

	setActive(arg_5_0.playerRankTF, false)

	arg_5_0.topPanel = arg_5_0.blurPanel:Find("adapt/top")
	arg_5_0.leftPanel = arg_5_0.blurPanel:Find("adapt/left_length")
	arg_5_0.mainPanel = arg_5_0._tf:Find("main")
	arg_5_0.extraChapterBg = arg_5_0._tf:Find("extra_chapter_bg")
	arg_5_0.toggleScrollRect = arg_5_0.leftPanel:Find("frame/scroll_rect")
	arg_5_0.toggleContainer = arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot")
	arg_5_0.listEmptyTF = arg_5_0._tf:Find("main/frame/empty")

	setActive(arg_5_0.listEmptyTF, false)

	arg_5_0.listEmptyTxt = arg_5_0.listEmptyTF:Find("Text")

	setText(arg_5_0.listEmptyTxt, i18n("list_empty_tip_billboardui"))

	arg_5_0.toggles = {
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/power"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/collection"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/pt"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/pledge"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/chanllenge"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/extra_chapter"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/boss_battle"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/guild"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/military"),
		arg_5_0.leftPanel:Find("frame/scroll_rect/tagRoot/bossrush")
	}
	arg_5_0.ptToggles = {}

	local var_5_0 = _.filter(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_6_0)
		return not arg_6_0:isEnd() and tonumber(arg_6_0:getConfig("config_data")) > 0
	end)

	if #var_5_0 > 1 then
		local var_5_1 = arg_5_0.toggles[3]

		for iter_5_0, iter_5_1 in pairs(var_5_0) do
			local var_5_2 = cloneTplTo(var_5_1, var_5_1.parent)

			arg_5_0.ptToggles[iter_5_1.id] = var_5_2
		end

		arg_5_0.toggles[3] = nil
	end

	arg_5_0:updateToggles()

	arg_5_0.rankRect.decelerationRate = 0.07

	local var_5_3 = arg_5_0.contextData.page or PowerRank.TYPE_POWER

	if table.contains(var_0_0.SINGLE_SHOW, var_5_3) then
		setActive(arg_5_0.leftPanel, false)
		setAnchoredPosition(arg_5_0.mainPanel, Vector2(0, -35.5))

		local var_5_4 = GetSpriteFromAtlas("commonbg/bg_fengshan", "")

		setImageSprite(arg_5_0.extraChapterBg, var_5_4)
	end

	setActive(arg_5_0.extraChapterBg, var_5_3 == PowerRank.TYPE_EXTRA_CHAPTER)
end

function var_0_0.updateToggles(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.toggles) do
		local var_7_0

		if PowerRank.typeInfo[iter_7_0].act_type then
			var_7_0 = PowerRank:getActivityByRankType(iter_7_0)
		else
			var_7_0 = (iter_7_0 ~= PowerRank.TYPE_PLEDGE or false) and (iter_7_0 == PowerRank.TYPE_GUILD_BATTLE and true or true)
		end

		setActive(iter_7_1, var_7_0)
	end

	for iter_7_2, iter_7_3 in pairs(arg_7_0.ptToggles) do
		local var_7_1 = getProxy(ActivityProxy):getActivityById(iter_7_2)

		setActive(iter_7_3, var_7_1 and not var_7_1:isEnd())
	end

	setActive(arg_7_0.toggleContainer, true)
	Canvas.ForceUpdateCanvases()

	local var_7_2 = arg_7_0.toggleScrollRect.rect.height < arg_7_0.toggleContainer.rect.height

	arg_7_0.toggleContainer:GetComponent(typeof(ScrollRect)).enabled = var_7_2
end

function var_0_0.didEnter(arg_8_0)
	onButton(arg_8_0, arg_8_0.topPanel:Find("back_btn"), function()
		arg_8_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)

	for iter_8_0, iter_8_1 in pairs(arg_8_0.toggles) do
		onToggle(arg_8_0, iter_8_1, function(arg_10_0)
			if iter_8_0 == PowerRank.TYPE_GUILD_BATTLE then
				setActive(arg_8_0.mainPanel, not arg_10_0)
				arg_8_0:emit(BillboardMediator.ON_GUILD_RANK, arg_10_0)

				return
			end

			if arg_10_0 then
				local var_10_0 = checkExist(PowerRank:getActivityByRankType(iter_8_0), {
					"id"
				})

				arg_8_0:switchPage(iter_8_0, var_10_0)
			end
		end, SFX_PANEL)
	end

	for iter_8_2, iter_8_3 in pairs(arg_8_0.ptToggles) do
		onToggle(arg_8_0, iter_8_3, function(arg_11_0)
			if arg_11_0 then
				arg_8_0:switchPage(PowerRank.TYPE_PT, iter_8_2)
			end
		end, SFX_PANEL)
	end

	arg_8_0.cards = {}

	function arg_8_0.rankRect.onInitItem(arg_12_0)
		arg_8_0:onInintItem(arg_12_0)
	end

	function arg_8_0.rankRect.onUpdateItem(arg_13_0, arg_13_1)
		arg_8_0:onUpdateItem(arg_13_0, arg_13_1, arg_8_0.curPagePTActID)
	end

	function arg_8_0.rankRect.onReturnItem(arg_14_0, arg_14_1)
		arg_8_0:onReturnItem(arg_14_0, arg_14_1)
	end

	arg_8_0.playerCard = RankCard.New(arg_8_0.playerRankTF, RankCard.TYPE_SELF)

	local var_8_0 = arg_8_0.contextData.page or PowerRank.TYPE_POWER

	triggerToggle(arg_8_0.toggles[var_8_0], true)
end

function var_0_0.onInintItem(arg_15_0, arg_15_1)
	local var_15_0 = RankCard.New(arg_15_1, RankCard.TYPE_OTHER)

	onButton(arg_15_0, var_15_0._tf, function()
		if var_15_0.rankVO.type == PowerRank.TYPE_MILITARY_RANK then
			arg_15_0:emit(BillboardMediator.OPEN_RIVAL_INFO, var_15_0.rankVO.id)
		end
	end)

	arg_15_0.cards[arg_15_1] = var_15_0
end

function var_0_0.onUpdateItem(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0.cards[arg_17_2]

	if not var_17_0 then
		arg_17_0:onInintItem(arg_17_2)

		var_17_0 = arg_17_0.cards[arg_17_2]
	end

	local var_17_1 = arg_17_0.displayRankVOs[arg_17_1 + 1]

	var_17_0:update(var_17_1, arg_17_3)
end

function var_0_0.onReturnItem(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_0.exited then
		return
	end

	local var_18_0 = arg_18_0.cards[arg_18_2]

	if var_18_0 then
		var_18_0:clear()
	end
end

function var_0_0.filter(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_1 ~= arg_19_0.page then
		return
	end

	local var_19_0 = arg_19_0.page
	local var_19_1

	if PowerRank.TYPE_PT == arg_19_1 then
		assert(arg_19_2)

		var_19_1 = arg_19_0.ptRanks[arg_19_2]
	else
		var_19_1 = arg_19_0.rankVOs[var_19_0]
	end

	local function var_19_2()
		arg_19_0.displayRankVOs = {}

		for iter_20_0, iter_20_1 in ipairs(var_19_1) do
			table.insert(arg_19_0.displayRankVOs, iter_20_1)
		end

		arg_19_0.rankRect:SetTotalCount(#arg_19_0.displayRankVOs)
		setActive(arg_19_0.listEmptyTF, #arg_19_0.displayRankVOs <= 0)

		local var_20_0 = arg_19_0.playerRankVOs[arg_19_0.page]

		if PowerRank.TYPE_PT == arg_19_1 then
			local var_20_1 = arg_19_0.playerPTRankVOMap[arg_19_2]

			arg_19_0.playerCard:update(var_20_1, arg_19_2)
		else
			arg_19_0.playerCard:update(var_20_0, arg_19_2)
		end
	end

	if var_19_1 and #var_19_1 > 0 then
		local var_19_3 = {}

		for iter_19_0, iter_19_1 in ipairs(var_19_1) do
			table.insert(var_19_3, "squareicon/" .. iter_19_1:getPainting())
		end

		SplitPackConst.DownloadByLuaArr(var_19_3, function()
			var_19_2()
		end)
	else
		var_19_2()
	end
end

function var_0_0.switchPage(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.page == arg_22_1 and arg_22_1 ~= PowerRank.TYPE_PT then
		return
	end

	if arg_22_1 == PowerRank.TYPE_PT then
		arg_22_0.curPagePTActID = arg_22_2
	else
		arg_22_0.curPagePTActID = nil
	end

	arg_22_0.page = arg_22_1

	local var_22_0

	if arg_22_0.page == PowerRank.TYPE_PT then
		assert(arg_22_2)

		var_22_0 = arg_22_0.ptRanks[arg_22_2]
	else
		var_22_0 = arg_22_0.rankVOs[arg_22_1]
	end

	if not var_22_0 then
		arg_22_0.rankRect:SetTotalCount(0)
		arg_22_0.playerCard:clear()
		arg_22_0:emit(BillboardMediator.FETCH_RANKS, arg_22_0.page, arg_22_2)
	else
		arg_22_0:filter(arg_22_0.page, arg_22_2)
	end

	setActive(arg_22_0.topPanel:Find("tip"), not table.contains(BillboardProxy.NONTIMER, arg_22_0.page))
	arg_22_0:updateScoreTitle(arg_22_0.page, arg_22_2)
end

function var_0_0.updateScoreTitle(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0._tf:Find("main/frame/title")
	local var_23_1 = PowerRank:getTitleWord(arg_23_1, arg_23_2)

	for iter_23_0 = 1, 4 do
		setText(var_23_0:GetChild(iter_23_0 - 1), var_23_1[iter_23_0])
	end
end

function var_0_0.willExit(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.cards) do
		iter_24_1:dispose()
	end

	arg_24_0.playerCard:dispose()

	if arg_24_0.name then
		retPaintingPrefab(arg_24_0.paintingTF, arg_24_0.name)
	end
end

return var_0_0
