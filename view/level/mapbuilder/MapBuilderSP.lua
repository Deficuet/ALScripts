local var_0_0 = class("MapBuilderSP", import(".MapBuilder"))
local var_0_1 = import("Mgr/Pool/PoolPlural")

var_0_0.DISPLAY = {
	STORY = 2,
	BATTLE = 1
}
var_0_0.DIFFICULITY = {
	EASY = 1,
	HARD = 2
}

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPESP
end

function var_0_0.getUIName(arg_2_0)
	return "LevelSelectSPUI"
end

function var_0_0.OnLoaded(arg_3_0)
	setParent(arg_3_0._tf, arg_3_0._parentTf)
	arg_3_0._tf:SetSiblingIndex(4)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.battleLayer = arg_4_0._tf:Find("Battle")
	arg_4_0.storyLayer = arg_4_0._tf:Find("Story")
	arg_4_0.top = arg_4_0._tf:Find("Top")
	arg_4_0.itemHolder = arg_4_0._tf:Find("Battle/Nodes")
	arg_4_0.chapterTpl = arg_4_0.itemHolder:Find("LevelTpl")
	arg_4_0.storyHolder = arg_4_0._tf:Find("Story/Nodes")
	arg_4_0.storyContainer = arg_4_0.storyHolder:Find("Viewport/Content")
	arg_4_0.nodes = {}
	arg_4_0.progressText = arg_4_0._tf:Find("Story/Desc/Text")
	arg_4_0.storyAward = arg_4_0._tf:Find("Story/Award")
	arg_4_0.storyNodeTpl = arg_4_0._tf:Find("Story/NodeTemplate")
	arg_4_0.oneLineTpl = arg_4_0._tf:Find("Story/OneLine")
	arg_4_0.branchHeadTpl = arg_4_0._tf:Find("Story/BranchHead")
	arg_4_0.branchCenterTpl = arg_4_0._tf:Find("Story/BranchCenter")
	arg_4_0.branchUpTpl = arg_4_0._tf:Find("Story/BranchUp")
	arg_4_0.branchDownTpl = arg_4_0._tf:Find("Story/BranchDown")
	arg_4_0.unionTailTpl = arg_4_0._tf:Find("Story/UnionTail")
	arg_4_0.unionCenterTpl = arg_4_0._tf:Find("Story/UnionCenter")
	arg_4_0.unionUpTpl = arg_4_0._tf:Find("Story/UnionUp")
	arg_4_0.unionDownTpl = arg_4_0._tf:Find("Story/UnionDown")
	arg_4_0.unreleasedNodeTpl = arg_4_0._tf:Find("Story/UnreleasedNode")

	setActive(arg_4_0.storyNodeTpl, false)
	setActive(arg_4_0.oneLineTpl, false)
	setActive(arg_4_0.branchHeadTpl, false)
	setActive(arg_4_0.branchCenterTpl, false)
	setActive(arg_4_0.branchUpTpl, false)
	setActive(arg_4_0.branchDownTpl, false)
	setActive(arg_4_0.unionTailTpl, false)
	setActive(arg_4_0.unionCenterTpl, false)
	setActive(arg_4_0.unionUpTpl, false)
	setActive(arg_4_0.unionDownTpl, false)
	setActive(arg_4_0.unreleasedNodeTpl, false)

	arg_4_0.pools = {
		[arg_4_0.storyNodeTpl] = var_0_1.New(go(arg_4_0.storyNodeTpl), 0),
		[arg_4_0.oneLineTpl] = var_0_1.New(go(arg_4_0.oneLineTpl), 0),
		[arg_4_0.branchHeadTpl] = var_0_1.New(go(arg_4_0.branchHeadTpl), 0),
		[arg_4_0.branchCenterTpl] = var_0_1.New(go(arg_4_0.branchCenterTpl), 0),
		[arg_4_0.branchUpTpl] = var_0_1.New(go(arg_4_0.branchUpTpl), 0),
		[arg_4_0.branchDownTpl] = var_0_1.New(go(arg_4_0.branchDownTpl), 0),
		[arg_4_0.unionTailTpl] = var_0_1.New(go(arg_4_0.unionTailTpl), 0),
		[arg_4_0.unionCenterTpl] = var_0_1.New(go(arg_4_0.unionCenterTpl), 0),
		[arg_4_0.unionUpTpl] = var_0_1.New(go(arg_4_0.unionUpTpl), 0),
		[arg_4_0.unionDownTpl] = var_0_1.New(go(arg_4_0.unionDownTpl), 0)
	}
	arg_4_0.nodeTplWidth = arg_4_0.storyNodeTpl.rect.width
	arg_4_0.oneLineWidth = arg_4_0.oneLineTpl.rect.width
	arg_4_0.oneLineHeight = arg_4_0.oneLineTpl.rect.height
	arg_4_0.branchHeadWidth = arg_4_0.branchHeadTpl.rect.width
	arg_4_0.branchUpWidth = arg_4_0.branchUpTpl.rect.width
	arg_4_0.branchUpHeight = arg_4_0.branchUpTpl.rect.height
	arg_4_0.UnionTailWidth = arg_4_0.unionTailTpl.rect.width
	arg_4_0.activeItems = {}
	arg_4_0.displayChapterIDs = {}
	arg_4_0.chapterTFsById = {}
	arg_4_0.storyNodeTFsById = {}

	arg_4_0:bind(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, function(arg_5_0, arg_5_1)
		arg_4_0:SwitchChapter(arg_5_1)
	end)
	onButton(arg_4_0, arg_4_0.battleLayer:Find("Story/Switch"), function()
		arg_4_0:SetDisplayMode(var_0_0.DISPLAY.STORY)

		arg_4_0.needFocusStory = true

		arg_4_0:Move2UnlockStory()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.storyLayer:Find("Battle/Switch"), function()
		arg_4_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
	end, SFX_PANEL)
	setText(arg_4_0.storyLayer:Find("Desc/Desc"), i18n("series_enemy_storyreward"))
end

function var_0_0.OnShow(arg_8_0)
	var_0_0.super.OnShow(arg_8_0)
	setActive(arg_8_0.sceneParent.mainLayer:Find("title_chapter_lines"), true)
	setActive(arg_8_0.sceneParent.topChapter:Find("title_chapter"), true)
	setActive(arg_8_0.sceneParent.topChapter:Find("type_chapter"), true)

	arg_8_0.needFocusStory = true
end

function var_0_0.UpdateButtons(arg_9_0)
	var_0_0.super.UpdateButtons(arg_9_0)

	local var_9_0, var_9_1 = arg_9_0.contextData.map:isActivity()
	local var_9_2 = arg_9_0.contextData.map:isRemaster()
	local var_9_3 = arg_9_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_9_0.sceneParent.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and var_9_3 and not var_9_2 and var_9_1 and arg_9_0.sceneParent:IsActShopActive())

	local var_9_4 = arg_9_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_9_0.contextData.map:getConfig("on_activity")) or nil
	local var_9_5 = var_9_4 and not var_9_4:isEnd() and var_9_4:GetConfigClientSetting("PTID")

	arg_9_0.sceneParent:updatePtActivity(underscore.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_10_0)
		return arg_10_0:getConfig("config_id") == var_9_5
	end))
	setActive(arg_9_0.sceneParent.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_9_2 and var_9_1 and arg_9_0.sceneParent.ptActivity and not arg_9_0.sceneParent.ptActivity:isEnd() and var_9_3)
end

function var_0_0.OnHide(arg_11_0)
	setActive(arg_11_0.sceneParent.mainLayer:Find("title_chapter_lines"), false)
	setActive(arg_11_0.sceneParent.topChapter:Find("title_chapter"), false)
	setActive(arg_11_0.sceneParent.topChapter:Find("type_chapter"), false)
	setActive(arg_11_0.sceneParent.ptTotal, false)
	setActive(arg_11_0.sceneParent.actExchangeShopBtn, false)
	var_0_0.super.OnHide(arg_11_0)
end

function var_0_0.UpdateMapVO(arg_12_0, arg_12_1)
	var_0_0.super.UpdateMapVO(arg_12_0, arg_12_1)

	arg_12_0.activity = getProxy(ActivityProxy):getActivityById(arg_12_1:getConfig("on_activity"))

	local var_12_0 = getProxy(PlayerProxy):getRawData().id
	local var_12_1 = arg_12_1:getConfig("chapterGroups")

	arg_12_0.chapterGroups = _.map(var_12_1, function(arg_13_0)
		local var_13_0 = arg_13_0[1]
		local var_13_1 = PlayerPrefs.GetInt("spchapter_selected_" .. var_12_0 .. "_" .. var_13_0, var_0_0.DIFFICULITY.EASY)

		return {
			list = arg_13_0,
			index = var_13_1
		}
	end)
	arg_12_0.chapterGroupDict = {}

	_.each(arg_12_0.chapterGroups, function(arg_14_0)
		_.each(arg_14_0.list, function(arg_15_0)
			arg_12_0.chapterGroupDict[arg_15_0] = arg_14_0
		end)
	end)

	arg_12_0.displayChapterIDs = _.map(arg_12_0.chapterGroups, function(arg_16_0)
		return arg_16_0.list[arg_16_0.index]
	end)

	arg_12_0:BuildStoryTree()
end

function var_0_0.BuildStoryTree(arg_17_0)
	arg_17_0.spStoryIDs = arg_17_0.data:getConfig("story_id")
	arg_17_0.spStoryNodeDict = {}
	arg_17_0.spStoryNodes = {}
	arg_17_0.spStoryUnreleasedNode = nil

	local var_17_0 = {}

	_.each(arg_17_0.spStoryIDs, function(arg_18_0)
		local var_18_0 = ActivitySpStoryNode.New({
			configId = arg_18_0
		})

		if var_18_0:GetType() ~= ActivitySpStoryNode.NODE_TYPE.UNRELEASED then
			arg_17_0.spStoryNodeDict[arg_18_0] = var_18_0

			local var_18_1 = arg_17_0.spStoryNodeDict[arg_18_0]

			var_17_0[var_18_1:GetPreEvent()] = arg_18_0
		else
			arg_17_0.spStoryUnreleasedNode = var_18_0
		end
	end)

	local var_17_1 = 0

	local function var_17_2()
		if not var_17_0[var_17_1] then
			return
		end

		var_17_1 = var_17_0[var_17_1]

		table.insert(arg_17_0.spStoryNodes, arg_17_0.spStoryNodeDict[var_17_1])

		return true
	end

	while var_17_2() do
		-- block empty
	end

	local var_17_3 = {}
	local var_17_4

	_.each(arg_17_0.spStoryNodes, function(arg_20_0)
		local var_20_0 = arg_20_0:GetPreNodes()

		if #var_20_0 == 0 then
			var_17_4 = arg_20_0

			return
		end

		_.each(var_20_0, function(arg_21_0)
			var_17_3[arg_21_0] = var_17_3[arg_21_0] or {}

			table.insert(var_17_3[arg_21_0], arg_20_0)
		end)
	end)

	arg_17_0.storyTree = {
		root = var_17_4,
		childDict = var_17_3
	}
end

function var_0_0.SetDisplayMode(arg_22_0, arg_22_1)
	if arg_22_1 == arg_22_0.contextData.displayMode then
		return
	end

	arg_22_0.contextData.displayMode = arg_22_1

	arg_22_0:UpdateView()
end

function var_0_0.UpdateView(arg_23_0)
	local var_23_0 = string.split(arg_23_0.contextData.map:getConfig("name"), "||")

	setText(arg_23_0.sceneParent.chapterName, var_23_0[1])

	local var_23_1 = arg_23_0.contextData.map:getMapTitleNumber()

	arg_23_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_23_1, arg_23_0.sceneParent.chapterNoTitle, true)

	arg_23_0.contextData.displayMode = arg_23_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE

	var_0_0.super.UpdateView(arg_23_0)

	local var_23_2 = arg_23_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_23_0._tf:Find("Battle"), var_23_2)
	setActive(arg_23_0._tf:Find("Story"), not var_23_2)

	local var_23_3 = getProxy(ChapterProxy):IsActivitySPChapterActive(arg_23_0.contextData.map:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip()

	setActive(arg_23_0.battleLayer:Find("Story/BattleTip"), false)
	setActive(arg_23_0.storyLayer:Find("Battle/BattleTip"), var_23_3)
	arg_23_0:UpdateStoryTask()

	if var_23_2 then
		arg_23_0:UpdateBattle()
		arg_23_0.sceneParent:SwitchMapBG(arg_23_0.contextData.map)
		arg_23_0.sceneParent:PlayBGM()
	else
		arg_23_0:UpdateStoryNodeStatus()
		arg_23_0:UpdateStory()
		arg_23_0:Move2UnlockStory()
		arg_23_0:SwitchStoryMapAndBGM()
	end

	arg_23_0:TrySubmitTask()
end

function var_0_0.UpdateBattle(arg_24_0)
	local var_24_0 = getProxy(ChapterProxy)
	local var_24_1 = arg_24_0.displayChapterIDs
	local var_24_2 = {}

	for iter_24_0, iter_24_1 in ipairs(var_24_1) do
		local var_24_3 = var_24_0:getChapterById(iter_24_1)

		table.insert(var_24_2, var_24_3)
	end

	table.clear(arg_24_0.chapterTFsById)
	UIItemList.StaticAlign(arg_24_0.itemHolder, arg_24_0.chapterTpl, #var_24_2, function(arg_25_0, arg_25_1, arg_25_2)
		if arg_25_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_25_0 = var_24_2[arg_25_1 + 1]

		arg_24_0:UpdateMapItem(arg_25_2, var_25_0)

		arg_25_2.name = "Chapter_" .. var_25_0.id
		arg_24_0.chapterTFsById[var_25_0.id] = arg_25_2
	end)
end

function var_0_0.HideFloat(arg_26_0)
	var_0_0.super.HideFloat(arg_26_0)
	setActive(arg_26_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_27_0)
	var_0_0.super.ShowFloat(arg_27_0)
	setActive(arg_27_0.itemHolder, true)
end

function var_0_0.UpdateMapItem(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_2:getConfigTable()

	setAnchoredPosition(arg_28_1, {
		x = arg_28_0.mapWidth * var_28_0.pos_x,
		y = arg_28_0.mapHeight * var_28_0.pos_y
	})

	local var_28_1 = findTF(arg_28_1, "main")

	setActive(var_28_1, true)

	local var_28_2 = findTF(var_28_1, "circle/fordark")
	local var_28_3 = findTF(var_28_1, "info/bk/fordark")

	setActive(var_28_2, var_28_0.icon_outline == 1)
	setActive(var_28_3, var_28_0.icon_outline == 1)

	local var_28_4 = arg_28_0.chapterGroupDict[arg_28_2.id]

	assert(var_28_4)

	local var_28_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_28_6 = 1

	if arg_28_2:isUnlock() then
		var_28_6 = 2

		if #var_28_4.list > 1 then
			var_28_6 = table.indexof(var_28_4.list, arg_28_2.id) + 1
		elseif arg_28_2:IsSpChapter() or arg_28_2:IsEXChapter() then
			var_28_6 = 3
		elseif arg_28_0.contextData.map:isHardMap() then
			var_28_6 = 3
		end
	end

	local var_28_7 = findTF(var_28_1, "circle/bk")

	for iter_28_0, iter_28_1 in ipairs(var_28_5) do
		setActive(var_28_7:Find(iter_28_1), iter_28_0 == var_28_6)
	end

	local var_28_8 = findTF(var_28_1, "circle/clear_flag")
	local var_28_9 = findTF(var_28_1, "circle/lock")
	local var_28_10 = findTF(var_28_1, "circle/progress")
	local var_28_11 = findTF(var_28_1, "circle/progress_text")
	local var_28_12 = findTF(var_28_1, "circle/stars")
	local var_28_13 = string.split(var_28_0.name, "|")

	setText(findTF(var_28_1, "info/bk/title_form/title_index"), var_28_0.chapter_name .. "  ")
	setText(findTF(var_28_1, "info/bk/title_form/title"), var_28_13[1])
	setText(findTF(var_28_1, "info/bk/title_form/title_en"), var_28_13[2] or "")
	setFillAmount(var_28_10, arg_28_2.progress / 100)
	setText(var_28_11, string.format("%d%%", arg_28_2.progress))
	setActive(var_28_12, arg_28_2:existAchieve())

	if arg_28_2:existAchieve() then
		for iter_28_2, iter_28_3 in ipairs(arg_28_2.achieves) do
			local var_28_14 = ChapterConst.IsAchieved(iter_28_3)
			local var_28_15 = var_28_12:GetChild(iter_28_2 - 1):Find("light")

			setActive(var_28_15, var_28_14)

			for iter_28_4, iter_28_5 in ipairs(var_28_5) do
				if iter_28_5 ~= "Lock" then
					setActive(var_28_15:Find(iter_28_5), iter_28_4 == var_28_6)
				end
			end
		end
	end

	local var_28_16 = findTF(var_28_1, "info/bk/BG")

	for iter_28_6, iter_28_7 in ipairs(var_28_5) do
		setActive(var_28_16:Find(iter_28_7), iter_28_6 == var_28_6)
	end

	setActive(findTF(var_28_1, "HardEffect"), var_28_6 == 3)

	local var_28_17 = not arg_28_2.active and arg_28_2:isClear()
	local var_28_18 = not arg_28_2.active and not arg_28_2:isUnlock()

	setActive(var_28_8, var_28_17)
	setActive(var_28_9, var_28_18)
	setActive(var_28_11, not var_28_17 and not var_28_18)
	arg_28_0:DeleteTween("fighting" .. arg_28_2.id)

	local var_28_19 = findTF(var_28_1, "circle/fighting")

	setText(findTF(var_28_19, "Text"), i18n("tag_level_fighting"))

	local var_28_20 = findTF(var_28_1, "circle/oni")

	setText(findTF(var_28_20, "Text"), i18n("tag_level_oni"))

	local var_28_21 = findTF(var_28_1, "circle/narrative")

	setText(findTF(var_28_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_28_19, false)
	setActive(var_28_20, false)
	setActive(var_28_21, false)

	local var_28_22
	local var_28_23

	if arg_28_2:getConfig("chapter_tag") == 1 then
		var_28_22 = var_28_21
	end

	if arg_28_2.active then
		var_28_22 = arg_28_2:existOni() and var_28_20 or var_28_19
	end

	if var_28_22 then
		setActive(var_28_22, true)

		local var_28_24 = GetOrAddComponent(var_28_22, "CanvasGroup")

		var_28_24.alpha = 1

		arg_28_0:RecordTween("fighting" .. arg_28_2.id, LeanTween.alphaCanvas(var_28_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_28_25 = findTF(var_28_1, "triesLimit")
	local var_28_26 = arg_28_2:isTriesLimit()

	setActive(var_28_25, var_28_26)

	if var_28_26 then
		local var_28_27 = arg_28_2:getConfig("count")
		local var_28_28 = var_28_27 - arg_28_2:getTodayDefeatCount() .. "/" .. var_28_27

		setText(var_28_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_28_25:Find("Text"), setColorStr(var_28_28, var_28_27 <= arg_28_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_28_29 = pg.expedition_data_by_map[arg_28_2:getConfig("map")].on_activity
		local var_28_30 = getProxy(ChapterProxy):IsActivitySPChapterActive(var_28_29) and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_28_25:Find("TipRect"), var_28_30)
	end

	local var_28_31 = arg_28_2:GetDailyBonusQuota()
	local var_28_32 = findTF(var_28_1, "mark")

	setActive(var_28_32:Find("bonus"), var_28_31)
	setActive(var_28_32, var_28_31)

	if var_28_31 then
		local var_28_33 = var_28_32:GetComponent(typeof(CanvasGroup))
		local var_28_34 = var_28_6 == 3 and "bonus_us_hard" or "bonus_us"

		arg_28_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_28_34, var_28_32:Find("bonus"))
		LeanTween.cancel(go(var_28_32), true)

		local var_28_35 = var_28_32.anchoredPosition.y

		var_28_33.alpha = 0

		LeanTween.value(go(var_28_32), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_29_0)
			var_28_33.alpha = arg_29_0

			local var_29_0 = var_28_32.anchoredPosition

			var_29_0.y = var_28_35 * arg_29_0
			var_28_32.anchoredPosition = var_29_0
		end)):setOnComplete(System.Action(function()
			var_28_33.alpha = 1

			local var_30_0 = var_28_32.anchoredPosition

			var_30_0.y = var_28_35
			var_28_32.anchoredPosition = var_30_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_28_36 = arg_28_2.id

	onButton(arg_28_0, var_28_1, function()
		arg_28_0:TryOpenChapterInfo(var_28_36, nil, var_28_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.SwitchChapter(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.chapterGroupDict[arg_32_1]

	if not var_32_0 then
		return
	end

	local var_32_1 = var_32_0.list[var_32_0.index]

	if var_32_1 == arg_32_1 then
		return
	end

	local var_32_2 = table.indexof(var_32_0.list, arg_32_1)

	var_32_0.index = var_32_2

	local var_32_3 = var_32_0.list[1]
	local var_32_4 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("spchapter_selected_" .. var_32_4 .. "_" .. var_32_3, var_32_2)

	local var_32_5 = arg_32_0.chapterTFsById[var_32_1]

	arg_32_0.chapterTFsById[var_32_1] = nil
	arg_32_0.chapterTFsById[arg_32_1] = var_32_5

	arg_32_0:UpdateChapterTF(arg_32_1)
end

function var_0_0.UpdateChapterTF(arg_33_0, arg_33_1)
	if not arg_33_0.chapterGroupDict[arg_33_1] then
		return
	end

	local var_33_0 = arg_33_0.chapterTFsById[arg_33_1]

	if var_33_0 then
		local var_33_1 = getProxy(ChapterProxy):getChapterById(arg_33_1)

		arg_33_0:UpdateMapItem(var_33_0, var_33_1)
	end
end

function var_0_0.RecyclePools(arg_34_0)
	for iter_34_0 = #arg_34_0.activeItems, 1, -1 do
		local var_34_0 = arg_34_0.activeItems[iter_34_0]
		local var_34_1 = arg_34_0.pools[var_34_0.template]

		if var_34_0.template == arg_34_0.oneLineTpl then
			setSizeDelta(var_34_0.active, {
				x = arg_34_0.oneLineWidth,
				y = arg_34_0.oneLineHeight
			})
		end

		var_34_1:Enqueue(var_34_0.active)
	end

	table.clean(arg_34_0.activeItems)

	arg_34_0.storyNodeTFsById = {}
end

local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.UpdateStoryNodeStatus(arg_35_0)
	local var_35_0 = 0
	local var_35_1 = 0
	local var_35_2 = pg.NewStoryMgr.GetInstance()
	local var_35_3 = {}

	table.Foreach(arg_35_0.spStoryIDs, function(arg_36_0, arg_36_1)
		var_35_3[arg_36_1] = {}
	end)

	local var_35_4 = arg_35_0.spStoryNodes

	for iter_35_0 = 1, #var_35_4 do
		local var_35_5 = var_35_4[iter_35_0]
		local var_35_6 = var_35_5:GetConfigID()
		local var_35_7 = var_35_5:GetPreEvent()
		local var_35_8 = false
		local var_35_9 = var_35_7 == 0 and true or var_35_3[var_35_7].status == var_0_4
		local var_35_10 = var_0_2
		local var_35_11 = var_35_5:GetStoryName()
		local var_35_12 = false

		if var_35_11 and var_35_11 ~= "" then
			var_35_12 = var_35_2:IsPlayed(var_35_11)
			var_35_0 = var_35_0 + (var_35_12 and 1 or 0)
			var_35_1 = var_35_1 + 1
		end

		if not var_35_12 and var_35_9 then
			_.each(var_35_5:GetUnlockConditions(), function(arg_37_0)
				if arg_37_0[1] == ActivitySpStoryNode.CONDITION.TIME then
					local var_37_0 = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_37_0[2])
					local var_37_1 = pg.TimeMgr.GetInstance():GetServerTime()

					var_35_9 = var_35_9 and var_37_0 <= var_37_1
				elseif arg_37_0[1] == ActivitySpStoryNode.CONDITION.PASSCHAPTER then
					local var_37_2 = arg_37_0[2]

					var_35_9 = var_35_9 and _.all(var_37_2, function(arg_38_0)
						return getProxy(ChapterProxy):getChapterById(arg_38_0, true):isClear()
					end)
				elseif arg_37_0[1] == ActivitySpStoryNode.CONDITION.PT then
					local var_37_3 = arg_37_0[2][1]
					local var_37_4 = arg_37_0[2][2]
					local var_37_5 = arg_37_0[2][3]
					local var_37_6 = 0

					if var_37_3 == DROP_TYPE_RESOURCE then
						var_37_6 = getProxy(PlayerProxy):getRawData():getResource(arg_37_0[2])
					elseif var_37_3 == DROP_TYPE_ITEM then
						var_37_6 = getProxy(BagProxy):getItemCountById(var_37_4)
					end

					var_35_9 = var_35_9 and var_37_5 <= var_37_6
				end
			end)
		end

		if var_35_12 then
			var_35_10 = var_0_4
		elseif var_35_9 then
			var_35_10 = var_0_3
		end

		var_35_3[var_35_6].status = var_35_10
	end

	arg_35_0.storyNodeStatus = var_35_3
	arg_35_0.storyReadCount, arg_35_0.storyReadMax = var_35_0, var_35_1
end

function var_0_0.UpdateStory(arg_39_0)
	arg_39_0:RecyclePools()

	local var_39_0 = {
		"162443",
		"ffffff",
		"ffcb5a"
	}
	local var_39_1 = arg_39_0.data:getConfig("story_inactive_color")

	if var_39_1 and #var_39_1 > 0 then
		var_39_0[1] = var_39_1
	end

	local var_39_2 = 0
	local var_39_3 = 150
	local var_39_4 = 150
	local var_39_5 = {
		{
			node = arg_39_0.storyTree.root,
			nodePos = Vector2.New(var_39_3, 0)
		}
	}
	local var_39_6 = arg_39_0.nodeTplWidth
	local var_39_7 = arg_39_0.oneLineWidth
	local var_39_8 = arg_39_0.branchHeadWidth
	local var_39_9 = arg_39_0.branchUpWidth
	local var_39_10 = arg_39_0.branchUpHeight
	local var_39_11 = arg_39_0.UnionTailWidth
	local var_39_12 = 75
	local var_39_13 = 82
	local var_39_14 = 32

	local function var_39_15()
		local var_40_0 = table.remove(var_39_5, 1)
		local var_40_1 = var_40_0.node:GetConfigID()

		;(function()
			local var_41_0 = arg_39_0:DequeItem(arg_39_0.storyNodeTpl)

			var_41_0.name = var_40_1

			setAnchoredPosition(var_41_0, var_40_0.nodePos)

			arg_39_0.storyNodeTFsById[var_40_1] = {
				nodeTF = tf(var_41_0)
			}
		end)()

		local var_40_2 = arg_39_0.storyTree.childDict[var_40_1] or {}

		if #var_40_2 == 0 then
			var_39_2 = var_40_0.nodePos.x + var_39_6 + var_39_4
		elseif #var_40_2 == 1 then
			local var_40_3 = var_40_2[1]
			local var_40_4 = var_40_3:GetConfigID()
			local var_40_5 = arg_39_0:DequeItem(arg_39_0.oneLineTpl)

			var_40_5.name = string.format("Line%s_%s", var_40_1, var_40_4)

			setAnchoredPosition(var_40_5, var_40_0.nodePos + Vector2.New(var_39_6 + var_39_14, 0))

			nextPos = tf(var_40_5).anchoredPosition + Vector2.New(var_39_7 + var_39_12, 0)

			local var_40_6 = arg_39_0.storyNodeStatus[var_40_4].status

			eachChild(var_40_5, function(arg_42_0)
				setImageColor(arg_42_0, Color.NewHex(var_39_0[var_40_6]))
			end)
			table.insert(var_39_5, {
				node = var_40_3,
				nodePos = nextPos
			})
		elseif #var_40_2 > 1 then
			local var_40_7 = {}
			local var_40_8

			table.Ipairs(var_40_2, function(arg_43_0, arg_43_1)
				local var_43_0 = 0
				local var_43_1 = arg_43_1

				local function var_43_2()
					var_43_0 = var_43_0 + 1

					local var_44_0 = arg_39_0.storyTree.childDict[var_43_1:GetConfigID()]

					assert(#var_44_0 <= 1)

					local var_44_1 = var_44_0[1]

					if var_44_1 and #var_44_1:GetPreNodes() == 1 then
						var_43_1 = var_44_1

						return true
					else
						var_40_8 = var_44_1
					end
				end

				while var_43_2() do
					-- block empty
				end

				var_40_7[arg_43_0] = var_43_0
			end)

			local var_40_9 = _.max(var_40_7)
			local var_40_10 = var_40_9 * (var_39_6 + var_39_12 + var_39_14) + (var_40_9 - 1) * var_39_7
			local var_40_11 = var_40_0.nodePos + Vector2.New(var_39_6 + var_39_14, 0)

			;(function()
				local var_45_0 = arg_39_0:DequeItem(arg_39_0.branchHeadTpl)

				setAnchoredPosition(var_45_0, var_40_11)

				var_40_11 = var_40_11 + Vector2.New(var_39_8, 0)

				local var_45_1 = arg_39_0.storyNodeStatus[var_40_2[1]:GetConfigID()].status

				eachChild(var_45_0, function(arg_46_0)
					setImageColor(arg_46_0, Color.NewHex(var_39_0[var_45_1]))
				end)
			end)()
			table.Ipairs(var_40_2, function(arg_47_0, arg_47_1)
				local var_47_0 = var_39_7

				if var_40_7[arg_47_0] < var_40_9 then
					local var_47_1 = var_40_7[arg_47_0]

					var_47_0 = (var_40_10 - var_47_1 * (var_39_6 + var_39_12 + var_39_14)) / (var_47_1 + 1)
				end

				local var_47_2 = arg_47_1:GetConfigID()
				local var_47_3 = var_40_11

				;(function()
					local var_48_0

					if arg_47_0 == 1 then
						var_48_0 = arg_39_0:DequeItem(arg_39_0.branchUpTpl)

						setAnchoredPosition(var_48_0, var_47_3)

						var_47_3 = var_47_3 + Vector2.New(var_39_9, var_39_10)

						if var_40_7[arg_47_0] < var_40_9 then
							setSizeDelta(var_48_0, {
								x = var_39_9 + var_47_0,
								y = var_39_10
							})

							local var_48_1 = tf(var_48_0):Find("Line_1").sizeDelta

							var_48_1.x = var_48_1.x + var_47_0

							setSizeDelta(tf(var_48_0):Find("Line_1"), var_48_1)

							var_47_3 = var_47_3 + Vector2.New(var_47_0, 0)
						end
					elseif arg_47_0 == 3 or arg_47_0 == 2 and #var_40_2 == 2 then
						var_48_0 = arg_39_0:DequeItem(arg_39_0.branchDownTpl)

						setAnchoredPosition(var_48_0, var_47_3)

						var_47_3 = var_47_3 + Vector2.New(var_39_9, -var_39_10)

						if var_40_7[arg_47_0] < var_40_9 then
							setSizeDelta(var_48_0, {
								x = var_39_9 + var_47_0,
								y = var_39_10
							})

							local var_48_2 = tf(var_48_0):Find("Line_1").sizeDelta

							var_48_2.x = var_48_2.x + var_47_0

							setSizeDelta(tf(var_48_0):Find("Line_1"), var_48_2)

							var_47_3 = var_47_3 + Vector2.New(var_47_0, 0)
						end
					else
						var_48_0 = arg_39_0:DequeItem(arg_39_0.branchCenterTpl)

						setAnchoredPosition(var_48_0, var_47_3)

						var_47_3 = var_47_3 + Vector2.New(var_39_9, 0)

						if var_40_7[arg_47_0] < var_40_9 then
							local var_48_3 = tf(var_48_0).sizeDelta

							var_48_3.x = var_48_3.x + var_47_0

							setSizeDelta(var_48_0, var_48_3)

							var_47_3 = var_47_3 + Vector2.New(var_47_0, 0)
						end
					end

					var_48_0.name = string.format("Branch%s_%s", var_40_1, var_47_2)

					local var_48_4 = arg_39_0.storyNodeStatus[var_47_2].status

					eachChild(var_48_0, function(arg_49_0)
						setImageColor(arg_49_0, Color.NewHex(var_39_0[var_48_4]))
					end)
				end)()

				var_47_3 = var_47_3 + Vector2.New(var_39_12, 0)

				local var_47_4 = arg_39_0:DequeItem(arg_39_0.storyNodeTpl)

				var_47_4.name = var_47_2

				setAnchoredPosition(var_47_4, var_47_3)

				arg_39_0.storyNodeTFsById[var_47_2] = {
					nodeTF = tf(var_47_4)
				}
				var_47_3 = var_47_3 + Vector2.New(var_39_6 + var_39_14, 0)

				local var_47_5 = arg_39_0.storyTree.childDict[var_47_2][1]
				local var_47_6 = arg_47_1

				local function var_47_7()
					if not var_47_5 or var_47_5 == var_40_8 then
						return
					end

					local var_50_0 = arg_39_0:DequeItem(arg_39_0.oneLineTpl)

					var_50_0.name = string.format("Line%s_%s", var_47_6:GetConfigID(), var_47_5:GetConfigID())

					setAnchoredPosition(var_50_0, var_47_3)

					var_47_3 = var_47_3 + Vector2.New(var_47_0 + var_39_12, 0)

					setSizeDelta(var_50_0, {
						x = var_47_0,
						y = arg_39_0.oneLineHeight
					})

					local var_50_1 = arg_39_0.storyNodeStatus[var_47_5:GetConfigID()].status

					eachChild(var_50_0, function(arg_51_0)
						setImageColor(arg_51_0, Color.NewHex(var_39_0[var_50_1]))
					end)

					local var_50_2 = arg_39_0:DequeItem(arg_39_0.storyNodeTpl)

					var_50_2.name = var_47_5:GetConfigID()

					setAnchoredPosition(var_50_2, var_47_3)

					arg_39_0.storyNodeTFsById[var_47_5:GetConfigID()] = {
						nodeTF = tf(var_50_2)
					}
					var_47_3 = var_47_3 + Vector2.New(var_39_6 + var_39_14, 0)
					var_47_5, var_47_6 = arg_39_0.storyTree.childDict[var_47_5:GetConfigID()][1], var_47_5

					return true
				end

				while var_47_7() do
					-- block empty
				end

				if var_40_8 then
					local var_47_8

					if arg_47_0 == 1 then
						var_47_8 = arg_39_0:DequeItem(arg_39_0.unionUpTpl)

						setAnchoredPosition(var_47_8, var_47_3)

						if var_40_7[arg_47_0] < var_40_9 then
							setSizeDelta(var_47_8, {
								x = var_39_9 + var_47_0,
								y = var_39_10
							})

							local var_47_9 = tf(var_47_8):Find("Line_1").sizeDelta

							var_47_9.x = var_47_9.x + var_47_0

							setSizeDelta(tf(var_47_8):Find("Line_1"), var_47_9)

							var_47_3 = var_47_3 + Vector2.New(var_47_0, 0)
						end
					elseif arg_47_0 == 3 or arg_47_0 == 2 and #var_40_2 == 2 then
						var_47_8 = arg_39_0:DequeItem(arg_39_0.unionDownTpl)

						setAnchoredPosition(var_47_8, var_47_3)

						if var_40_7[arg_47_0] < var_40_9 then
							setSizeDelta(var_47_8, {
								x = var_39_9 + var_47_0,
								y = var_39_10
							})

							local var_47_10 = tf(var_47_8):Find("Line_1").sizeDelta

							var_47_10.x = var_47_10.x + var_47_0

							setSizeDelta(tf(var_47_8):Find("Line_1"), var_47_10)

							var_47_3 = var_47_3 + Vector2.New(var_47_0, 0)
						end
					else
						var_47_8 = arg_39_0:DequeItem(arg_39_0.unionCenterTpl)

						setAnchoredPosition(var_47_8, var_47_3)

						if var_40_7[arg_47_0] < var_40_9 then
							local var_47_11 = tf(var_47_8).sizeDelta

							var_47_11.x = var_47_11.x + var_47_0

							setSizeDelta(var_47_8, var_47_11)

							var_47_3 = var_47_3 + Vector2.New(var_47_0, 0)
						end
					end

					var_47_8.name = string.format("Union%s_%s", var_47_6:GetConfigID(), var_40_8:GetConfigID())

					local var_47_12 = arg_39_0.storyNodeStatus[var_40_8:GetConfigID()].status

					eachChild(var_47_8, function(arg_52_0)
						setImageColor(arg_52_0, Color.NewHex(var_39_0[var_47_12]))
					end)
				end
			end)

			var_40_11 = var_40_11 + Vector2.New(var_40_10 + var_39_9, 0)

			if var_40_8 then
				(function()
					var_40_11 = var_40_11 + Vector2.New(var_39_9, 0)

					local var_53_0 = arg_39_0:DequeItem(arg_39_0.unionTailTpl)

					setAnchoredPosition(var_53_0, var_40_11)

					var_40_11 = var_40_11 + Vector2.New(var_39_11 + var_39_13, 0)

					local var_53_1 = arg_39_0.storyNodeStatus[var_40_8:GetConfigID()].status

					eachChild(var_53_0, function(arg_54_0)
						setImageColor(arg_54_0, Color.NewHex(var_39_0[var_53_1]))
					end)
				end)()
				table.insert(var_39_5, {
					node = var_40_8,
					nodePos = var_40_11
				})
			else
				var_39_2 = var_40_11 + var_39_4
			end
		end

		return next(var_39_5)
	end

	while var_39_15() do
		-- block empty
	end

	setSizeDelta(arg_39_0.storyContainer, {
		x = var_39_2
	})

	if arg_39_0.spStoryUnreleasedNode then
		local var_39_16 = cloneTplTo(arg_39_0.unreleasedNodeTpl, arg_39_0.storyContainer)

		setAnchoredPosition(var_39_16, {
			y = 0,
			x = var_39_2
		})
		setText(var_39_16:Find("text"), arg_39_0.spStoryUnreleasedNode:GetDisplayName())
		ResourceMgr.Inst:getAssetAsync("ui/" .. arg_39_0.spStoryUnreleasedNode:GetCleanAnimator(), "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_55_0)
			local var_55_0 = Instantiate(arg_55_0)
			local var_55_1 = Vector3.New(-525, 0, 380)

			tf(var_55_0).localPosition = var_55_1

			setParent(var_55_0, var_39_16)
		end), true, true)
	end

	local var_39_17 = arg_39_0.spStoryNodes

	for iter_39_0 = 1, #var_39_17 do
		local var_39_18 = var_39_17[iter_39_0]
		local var_39_19 = var_39_18:GetConfigID()
		local var_39_20 = arg_39_0.storyNodeStatus[var_39_19].status
		local var_39_21 = arg_39_0.storyNodeTFsById[var_39_19].nodeTF
		local var_39_22 = var_39_21:Find("info/bk/title_form/title")

		if var_39_20 == var_0_2 then
			setScrollText(var_39_22, HXSet.hxLan(var_39_18:GetUnlockDesc()))
			setTextAlpha(var_39_22, 0.5)
		else
			setScrollText(var_39_22, HXSet.hxLan(var_39_18:GetDisplayName()))
			setTextAlpha(var_39_22, 1)
		end

		local var_39_23 = var_39_18:GetType()

		setActive(var_39_21:Find("circle/lock"), var_39_20 == var_0_2)

		if var_39_20 == var_0_2 then
			setActive(var_39_21:Find("circle/Story"), false)
			setActive(var_39_21:Find("circle/Battle"), false)
			setText(var_39_21:Find(""))
		elseif var_39_23 == ActivitySpStoryNode.NODE_TYPE.STORY then
			setActive(var_39_21:Find("circle/Story"), var_39_23 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_39_21:Find("circle/Battle"), var_39_23 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_39_21:Find("circle/Story/Done"), var_39_20 == var_0_4)
		elseif var_39_23 == ActivitySpStoryNode.NODE_TYPE.BATTLE then
			setActive(var_39_21:Find("circle/Story"), var_39_23 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_39_21:Find("circle/Battle"), var_39_23 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_39_21:Find("circle/Battle/Done"), var_39_20 == var_0_4)
		end

		local var_39_24 = var_39_20 == var_0_4

		setActive(var_39_21:Find("circle/progress"), var_39_24)
		onButton(arg_39_0, var_39_21, function()
			if var_39_20 == var_0_2 then
				return
			end

			local var_56_0 = var_39_18:GetStoryName()

			arg_39_0:PlayStory(var_56_0, function()
				arg_39_0:UpdateView()

				arg_39_0.needFocusStory = true

				arg_39_0:Move2UnlockStory()
			end, true)
		end)
	end

	local var_39_25 = arg_39_0.storyReadCount
	local var_39_26 = arg_39_0.storyReadMax

	setText(arg_39_0.progressText, var_39_25 .. "/" .. var_39_26)
	setActive(arg_39_0.storyAward, tobool(arg_39_0.storyTask))

	if arg_39_0.storyTask then
		local var_39_27 = arg_39_0.storyTask:getConfig("award_display")
		local var_39_28 = Drop.New({
			type = var_39_27[1][1],
			id = var_39_27[1][2],
			count = var_39_27[1][3]
		})

		updateDrop(arg_39_0.storyAward:GetChild(0), var_39_28)

		local var_39_29 = arg_39_0.storyTask:getTaskStatus()

		setActive(arg_39_0.storyAward:Find("get"), var_39_29 == 1)
		setActive(arg_39_0.storyAward:Find("got"), var_39_29 == 2)
		onButton(arg_39_0, arg_39_0.storyAward, function()
			arg_39_0:emit(BaseUI.ON_DROP, var_39_28)
		end)
	end
end

function var_0_0.DequeItem(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0.pools[arg_59_1]:Dequeue()

	table.insert(arg_59_0.activeItems, {
		template = arg_59_1,
		active = var_59_0
	})
	setActive(var_59_0, true)
	setParent(var_59_0, arg_59_0.storyContainer)

	return var_59_0
end

function var_0_0.Move2UnlockStory(arg_60_0)
	if not arg_60_0.needFocusStory then
		return
	end

	arg_60_0.needFocusStory = nil

	local var_60_0 = arg_60_0.spStoryNodes
	local var_60_1

	for iter_60_0 = #var_60_0, 1, -1 do
		local var_60_2 = var_60_0[iter_60_0]:GetConfigID()

		if arg_60_0.storyNodeStatus[var_60_2].status > var_0_2 then
			var_60_1 = var_60_2

			break
		end
	end

	local var_60_3 = arg_60_0.storyNodeTFsById[var_60_1].nodeTF
	local var_60_4 = arg_60_0.storyNodeTpl.rect.width
	local var_60_5 = var_60_3.anchoredPosition.x + var_60_4 * 0.5 - arg_60_0.storyContainer.parent.rect.width * 0.5
	local var_60_6 = math.clamp(var_60_5, 0, math.max(0, arg_60_0.storyContainer.rect.width - arg_60_0.storyContainer.parent.rect.width))

	setAnchoredPosition(arg_60_0.storyContainer, {
		x = -var_60_6
	})
end

function var_0_0.SwitchStoryMapAndBGM(arg_61_0)
	local var_61_0 = arg_61_0.data:getConfig("default_background")
	local var_61_1 = arg_61_0.data:getConfig("default_bgm")
	local var_61_2
	local var_61_3 = arg_61_0.spStoryNodes

	for iter_61_0 = 1, #var_61_3 do
		local var_61_4 = var_61_3[iter_61_0]
		local var_61_5 = var_61_4:GetConfigID()

		if arg_61_0.storyNodeStatus[var_61_5].status == var_0_4 then
			var_61_0, var_61_1 = var_61_4:GetCleanBG(), var_61_4:GetCleanBGM()
			var_61_2 = var_61_4:GetCleanAnimator()
		else
			break
		end
	end

	arg_61_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_61_0,
			Animator = var_61_2
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_61_0.__cname, var_61_1)
end

function var_0_0.TrySubmitTask(arg_62_0)
	local var_62_0 = true

	for iter_62_0, iter_62_1 in ipairs(arg_62_0.spStoryNodes) do
		local var_62_1 = iter_62_1:GetStoryName()

		if var_62_1 and var_62_1 ~= "" then
			var_62_0 = var_62_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_62_1)
		end

		if not var_62_0 then
			break
		end
	end

	if var_62_0 and arg_62_0.storyTask and arg_62_0.storyTask:getTaskStatus() == 1 then
		arg_62_0:emit(LevelMediator2.ON_SUBMIT_TASK, arg_62_0.storyTask.id)

		return
	end
end

function var_0_0.PlayStory(arg_63_0, arg_63_1, arg_63_2, arg_63_3)
	if not arg_63_1 then
		return existCall(arg_63_2)
	end

	local var_63_0 = pg.NewStoryMgr.GetInstance()
	local var_63_1 = var_63_0:IsPlayed(arg_63_1)

	seriesAsync({
		function(arg_64_0)
			if var_63_1 and not arg_63_3 then
				return arg_64_0()
			end

			local var_64_0 = tonumber(arg_63_1)

			if var_64_0 and var_64_0 > 0 then
				arg_63_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_64_0, nil, var_63_1)
			else
				var_63_0:Play(arg_63_1, arg_64_0, arg_63_3)
			end
		end,
		function(arg_65_0, ...)
			existCall(arg_63_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_66_0)
	local var_66_0 = arg_66_0.activity:getConfig("config_client").task_id
	local var_66_1 = getProxy(TaskProxy):getTaskVO(var_66_0)

	if not var_66_1 then
		errorMsg("Missing Activity Task ID : " .. var_66_0)
	end

	arg_66_0.storyTask = var_66_1 or Task.New({
		id = var_66_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_67_0)
	arg_67_0:UpdateView()
end

function var_0_0.OnDestroy(arg_68_0)
	arg_68_0:RecyclePools()

	for iter_68_0, iter_68_1 in pairs(arg_68_0.pools) do
		iter_68_1:Clear()
	end
end

return var_0_0
