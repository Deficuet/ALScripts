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
			local var_18_2 = var_17_0[var_18_1:GetPreEvent()] or {}

			table.insert(var_18_2, arg_18_0)

			var_17_0[var_18_1:GetPreEvent()] = var_18_2
		else
			arg_17_0.spStoryUnreleasedNode = var_18_0
		end
	end)

	local var_17_1 = 0

	local function var_17_2()
		if not var_17_0[var_17_1] then
			return
		end

		tailList = var_17_0[var_17_1]

		local var_19_0

		_.each(tailList, function(arg_20_0)
			table.insert(arg_17_0.spStoryNodes, arg_17_0.spStoryNodeDict[arg_20_0])

			if var_17_0[arg_20_0] then
				var_19_0 = true
				var_17_1 = arg_20_0
			end
		end)

		return var_19_0
	end

	while var_17_2() do
		-- block empty
	end

	local var_17_3 = {}
	local var_17_4

	_.each(arg_17_0.spStoryNodes, function(arg_21_0)
		local var_21_0 = arg_21_0:GetPreNodes()

		if #var_21_0 == 0 then
			var_17_4 = arg_21_0

			return
		end

		_.each(var_21_0, function(arg_22_0)
			var_17_3[arg_22_0] = var_17_3[arg_22_0] or {}

			table.insert(var_17_3[arg_22_0], arg_21_0)
		end)
	end)

	arg_17_0.storyTree = {
		root = var_17_4,
		childDict = var_17_3
	}
end

function var_0_0.SetDisplayMode(arg_23_0, arg_23_1)
	if arg_23_1 == arg_23_0.contextData.displayMode then
		return
	end

	arg_23_0.contextData.displayMode = arg_23_1

	arg_23_0:UpdateView()
end

function var_0_0.UpdateView(arg_24_0)
	local var_24_0 = string.split(arg_24_0.contextData.map:getConfig("name"), "||")

	if arg_24_0.contextData.displayMode == var_0_0.DISPLAY.STORY then
		var_24_0 = string.split(var_24_0[1], "·")

		setText(arg_24_0.sceneParent.chapterName, var_24_0[1] .. i18n("levelscene_title_story"))
	else
		setText(arg_24_0.sceneParent.chapterName, var_24_0[1])
	end

	local var_24_1 = arg_24_0.contextData.map:getMapTitleNumber()

	arg_24_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_24_1, arg_24_0.sceneParent.chapterNoTitle, true)

	arg_24_0.contextData.displayMode = arg_24_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE

	var_0_0.super.UpdateView(arg_24_0)

	local var_24_2 = arg_24_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_24_0._tf:Find("Battle"), var_24_2)
	setActive(arg_24_0._tf:Find("Story"), not var_24_2)

	local var_24_3 = getProxy(ChapterProxy):IsActivitySPChapterActive(arg_24_0.contextData.map:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip()

	setActive(arg_24_0.battleLayer:Find("Story/BattleTip"), false)
	setActive(arg_24_0.storyLayer:Find("Battle/BattleTip"), var_24_3)
	arg_24_0:UpdateStoryTask()

	if var_24_2 then
		arg_24_0:UpdateBattle()
		arg_24_0.sceneParent:SwitchMapBG(arg_24_0.contextData.map)
		arg_24_0.sceneParent:PlayBGM()
	else
		arg_24_0:UpdateStoryNodeStatus()
		arg_24_0:UpdateStory()
		arg_24_0:Move2UnlockStory()
		arg_24_0:SwitchStoryMapAndBGM()
	end

	arg_24_0:TrySubmitTask()
end

function var_0_0.UpdateBattle(arg_25_0)
	local var_25_0 = getProxy(ChapterProxy)
	local var_25_1 = arg_25_0.displayChapterIDs
	local var_25_2 = {}

	for iter_25_0, iter_25_1 in ipairs(var_25_1) do
		local var_25_3 = var_25_0:getChapterById(iter_25_1)

		table.insert(var_25_2, var_25_3)
	end

	table.clear(arg_25_0.chapterTFsById)
	UIItemList.StaticAlign(arg_25_0.itemHolder, arg_25_0.chapterTpl, #var_25_2, function(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_26_0 = var_25_2[arg_26_1 + 1]

		arg_25_0:UpdateMapItem(arg_26_2, var_26_0)

		arg_26_2.name = "Chapter_" .. var_26_0.id
		arg_25_0.chapterTFsById[var_26_0.id] = arg_26_2
	end)
end

function var_0_0.HideFloat(arg_27_0)
	var_0_0.super.HideFloat(arg_27_0)
	setActive(arg_27_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_28_0)
	var_0_0.super.ShowFloat(arg_28_0)
	setActive(arg_28_0.itemHolder, true)
end

function var_0_0.UpdateMapItem(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_2:getConfigTable()

	setAnchoredPosition(arg_29_1, {
		x = arg_29_0.mapWidth * var_29_0.pos_x,
		y = arg_29_0.mapHeight * var_29_0.pos_y
	})

	local var_29_1 = findTF(arg_29_1, "main")

	setActive(var_29_1, true)

	local var_29_2 = findTF(var_29_1, "circle/fordark")
	local var_29_3 = findTF(var_29_1, "info/bk/fordark")

	setActive(var_29_2, var_29_0.icon_outline == 1)
	setActive(var_29_3, var_29_0.icon_outline == 1)

	local var_29_4 = arg_29_0.chapterGroupDict[arg_29_2.id]

	assert(var_29_4)

	local var_29_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_29_6 = 1

	if arg_29_2:isUnlock() then
		var_29_6 = 2

		if #var_29_4.list > 1 then
			var_29_6 = table.indexof(var_29_4.list, arg_29_2.id) + 1
		elseif arg_29_2:IsSpChapter() or arg_29_2:IsEXChapter() then
			var_29_6 = 3
		elseif arg_29_0.contextData.map:isHardMap() then
			var_29_6 = 3
		end
	end

	local var_29_7 = findTF(var_29_1, "circle/bk")

	for iter_29_0, iter_29_1 in ipairs(var_29_5) do
		setActive(var_29_7:Find(iter_29_1), iter_29_0 == var_29_6)
	end

	local var_29_8 = findTF(var_29_1, "circle/clear_flag")
	local var_29_9 = findTF(var_29_1, "circle/lock")
	local var_29_10 = findTF(var_29_1, "circle/progress")
	local var_29_11 = findTF(var_29_1, "circle/progress_text")
	local var_29_12 = findTF(var_29_1, "circle/stars")
	local var_29_13 = string.split(var_29_0.name, "|")

	setText(findTF(var_29_1, "info/bk/title_form/title_index"), var_29_0.chapter_name .. "  ")
	setText(findTF(var_29_1, "info/bk/title_form/title"), var_29_13[1])
	setText(findTF(var_29_1, "info/bk/title_form/title_en"), var_29_13[2] or "")
	setFillAmount(var_29_10, arg_29_2.progress / 100)
	setText(var_29_11, string.format("%d%%", arg_29_2.progress))
	setActive(var_29_12, arg_29_2:existAchieve())

	if arg_29_2:existAchieve() then
		for iter_29_2, iter_29_3 in ipairs(arg_29_2.achieves) do
			local var_29_14 = ChapterConst.IsAchieved(iter_29_3)
			local var_29_15 = var_29_12:GetChild(iter_29_2 - 1):Find("light")

			setActive(var_29_15, var_29_14)

			for iter_29_4, iter_29_5 in ipairs(var_29_5) do
				if iter_29_5 ~= "Lock" then
					setActive(var_29_15:Find(iter_29_5), iter_29_4 == var_29_6)
				end
			end
		end
	end

	local var_29_16 = findTF(var_29_1, "info/bk/BG")

	for iter_29_6, iter_29_7 in ipairs(var_29_5) do
		setActive(var_29_16:Find(iter_29_7), iter_29_6 == var_29_6)
	end

	setActive(findTF(var_29_1, "HardEffect"), var_29_6 == 3)

	local var_29_17 = not arg_29_2.active and arg_29_2:isClear()
	local var_29_18 = not arg_29_2.active and not arg_29_2:isUnlock()

	setActive(var_29_8, var_29_17)
	setActive(var_29_9, var_29_18)
	setActive(var_29_11, not var_29_17 and not var_29_18)
	arg_29_0:DeleteTween("fighting" .. arg_29_2.id)

	local var_29_19 = findTF(var_29_1, "circle/fighting")

	setText(findTF(var_29_19, "Text"), i18n("tag_level_fighting"))

	local var_29_20 = findTF(var_29_1, "circle/oni")

	setText(findTF(var_29_20, "Text"), i18n("tag_level_oni"))

	local var_29_21 = findTF(var_29_1, "circle/narrative")

	setText(findTF(var_29_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_29_19, false)
	setActive(var_29_20, false)
	setActive(var_29_21, false)

	local var_29_22
	local var_29_23

	if arg_29_2:getConfig("chapter_tag") == 1 then
		var_29_22 = var_29_21
	end

	if arg_29_2.active then
		var_29_22 = arg_29_2:existOni() and var_29_20 or var_29_19
	end

	if var_29_22 then
		setActive(var_29_22, true)

		local var_29_24 = GetOrAddComponent(var_29_22, "CanvasGroup")

		var_29_24.alpha = 1

		arg_29_0:RecordTween("fighting" .. arg_29_2.id, LeanTween.alphaCanvas(var_29_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_29_25 = findTF(var_29_1, "triesLimit")
	local var_29_26 = arg_29_2:isTriesLimit()

	setActive(var_29_25, var_29_26)

	if var_29_26 then
		local var_29_27 = arg_29_2:getConfig("count")
		local var_29_28 = var_29_27 - arg_29_2:getTodayDefeatCount() .. "/" .. var_29_27

		setText(var_29_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_29_25:Find("Text"), setColorStr(var_29_28, var_29_27 <= arg_29_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_29_29 = pg.expedition_data_by_map[arg_29_2:getConfig("map")].on_activity
		local var_29_30 = getProxy(ChapterProxy):IsActivitySPChapterActive(var_29_29) and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_29_25:Find("TipRect"), var_29_30)
	end

	local var_29_31 = arg_29_2:GetDailyBonusQuota()
	local var_29_32 = findTF(var_29_1, "mark")

	setActive(var_29_32:Find("bonus"), var_29_31)
	setActive(var_29_32, var_29_31)

	if var_29_31 then
		local var_29_33 = var_29_32:GetComponent(typeof(CanvasGroup))
		local var_29_34 = var_29_6 == 3 and "bonus_us_hard" or "bonus_us"

		arg_29_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_29_34, var_29_32:Find("bonus"))
		LeanTween.cancel(go(var_29_32), true)

		local var_29_35 = var_29_32.anchoredPosition.y

		var_29_33.alpha = 0

		LeanTween.value(go(var_29_32), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_30_0)
			var_29_33.alpha = arg_30_0

			local var_30_0 = var_29_32.anchoredPosition

			var_30_0.y = var_29_35 * arg_30_0
			var_29_32.anchoredPosition = var_30_0
		end)):setOnComplete(System.Action(function()
			var_29_33.alpha = 1

			local var_31_0 = var_29_32.anchoredPosition

			var_31_0.y = var_29_35
			var_29_32.anchoredPosition = var_31_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_29_36 = arg_29_2.id

	onButton(arg_29_0, var_29_1, function()
		arg_29_0:TryOpenChapterInfo(var_29_36, nil, var_29_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.SwitchChapter(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.chapterGroupDict[arg_33_1]

	if not var_33_0 then
		return
	end

	local var_33_1 = var_33_0.list[var_33_0.index]

	if var_33_1 == arg_33_1 then
		return
	end

	local var_33_2 = table.indexof(var_33_0.list, arg_33_1)

	var_33_0.index = var_33_2

	local var_33_3 = var_33_0.list[1]
	local var_33_4 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("spchapter_selected_" .. var_33_4 .. "_" .. var_33_3, var_33_2)

	local var_33_5 = arg_33_0.chapterTFsById[var_33_1]

	arg_33_0.chapterTFsById[var_33_1] = nil
	arg_33_0.chapterTFsById[arg_33_1] = var_33_5

	arg_33_0:UpdateChapterTF(arg_33_1)
end

function var_0_0.UpdateChapterTF(arg_34_0, arg_34_1)
	if not arg_34_0.chapterGroupDict[arg_34_1] then
		return
	end

	local var_34_0 = arg_34_0.chapterTFsById[arg_34_1]

	if var_34_0 then
		local var_34_1 = getProxy(ChapterProxy):getChapterById(arg_34_1)

		arg_34_0:UpdateMapItem(var_34_0, var_34_1)
	end
end

function var_0_0.RecyclePools(arg_35_0)
	for iter_35_0 = #arg_35_0.activeItems, 1, -1 do
		local var_35_0 = arg_35_0.activeItems[iter_35_0]
		local var_35_1 = arg_35_0.pools[var_35_0.template]

		if var_35_0.template == arg_35_0.oneLineTpl then
			setSizeDelta(var_35_0.active, {
				x = arg_35_0.oneLineWidth,
				y = arg_35_0.oneLineHeight
			})
		end

		var_35_1:Enqueue(var_35_0.active)
	end

	table.clean(arg_35_0.activeItems)

	arg_35_0.storyNodeTFsById = {}
end

local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.UpdateStoryNodeStatus(arg_36_0)
	local var_36_0 = 0
	local var_36_1 = 0
	local var_36_2 = pg.NewStoryMgr.GetInstance()
	local var_36_3 = {}

	table.Foreach(arg_36_0.spStoryIDs, function(arg_37_0, arg_37_1)
		var_36_3[arg_37_1] = {}
	end)

	local var_36_4 = arg_36_0.spStoryNodes

	for iter_36_0 = 1, #var_36_4 do
		local var_36_5 = var_36_4[iter_36_0]
		local var_36_6 = var_36_5:GetConfigID()
		local var_36_7 = var_36_5:GetPreEvent()
		local var_36_8 = false
		local var_36_9 = var_36_7 == 0 and true or var_36_3[var_36_7].status == var_0_4
		local var_36_10 = var_0_2
		local var_36_11 = var_36_5:GetStoryName()
		local var_36_12 = false

		if var_36_11 and var_36_11 ~= "" then
			var_36_12 = var_36_2:IsPlayed(var_36_11)
			var_36_0 = var_36_0 + (var_36_12 and 1 or 0)
			var_36_1 = var_36_1 + 1
		end

		if not var_36_12 and var_36_9 then
			_.each(var_36_5:GetUnlockConditions(), function(arg_38_0)
				if arg_38_0[1] == ActivitySpStoryNode.CONDITION.TIME then
					local var_38_0 = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_38_0[2])
					local var_38_1 = pg.TimeMgr.GetInstance():GetServerTime()

					var_36_9 = var_36_9 and var_38_0 <= var_38_1
				elseif arg_38_0[1] == ActivitySpStoryNode.CONDITION.PASSCHAPTER then
					local var_38_2 = arg_38_0[2]

					var_36_9 = var_36_9 and _.all(var_38_2, function(arg_39_0)
						return getProxy(ChapterProxy):getChapterById(arg_39_0, true):isClear()
					end)
				elseif arg_38_0[1] == ActivitySpStoryNode.CONDITION.PT then
					local var_38_3 = arg_38_0[2][1]
					local var_38_4 = arg_38_0[2][2]
					local var_38_5 = arg_38_0[2][3]
					local var_38_6 = 0

					if var_38_3 == DROP_TYPE_RESOURCE then
						var_38_6 = getProxy(PlayerProxy):getRawData():getResource(arg_38_0[2])
					elseif var_38_3 == DROP_TYPE_ITEM then
						var_38_6 = getProxy(BagProxy):getItemCountById(var_38_4)
					end

					var_36_9 = var_36_9 and var_38_5 <= var_38_6
				end
			end)
		end

		if var_36_12 then
			var_36_10 = var_0_4
		elseif var_36_9 then
			var_36_10 = var_0_3
		end

		var_36_3[var_36_6].status = var_36_10
	end

	arg_36_0.storyNodeStatus = var_36_3
	arg_36_0.storyReadCount, arg_36_0.storyReadMax = var_36_0, var_36_1
end

function var_0_0.UpdateStory(arg_40_0)
	arg_40_0:RecyclePools()

	local var_40_0 = {
		"162443",
		"ffffff",
		"ffcb5a"
	}
	local var_40_1 = arg_40_0.data:getConfig("story_inactive_color")

	if var_40_1 and #var_40_1 > 0 then
		var_40_0[1] = var_40_1
	end

	local var_40_2 = 0
	local var_40_3 = 150
	local var_40_4 = 150
	local var_40_5 = {
		{
			node = arg_40_0.storyTree.root,
			nodePos = Vector2.New(var_40_3, 0)
		}
	}
	local var_40_6 = arg_40_0.nodeTplWidth
	local var_40_7 = arg_40_0.oneLineWidth
	local var_40_8 = arg_40_0.branchHeadWidth
	local var_40_9 = arg_40_0.branchUpWidth
	local var_40_10 = arg_40_0.branchUpHeight
	local var_40_11 = arg_40_0.UnionTailWidth
	local var_40_12 = 75
	local var_40_13 = 82
	local var_40_14 = 32

	local function var_40_15()
		local var_41_0 = table.remove(var_40_5, 1)
		local var_41_1 = var_41_0.node:GetConfigID()

		;(function()
			local var_42_0 = arg_40_0:DequeItem(arg_40_0.storyNodeTpl)

			var_42_0.name = var_41_1

			setAnchoredPosition(var_42_0, var_41_0.nodePos)

			arg_40_0.storyNodeTFsById[var_41_1] = {
				nodeTF = tf(var_42_0)
			}
		end)()

		local var_41_2 = arg_40_0.storyTree.childDict[var_41_1] or {}

		if #var_41_2 == 0 then
			var_40_2 = var_41_0.nodePos.x + var_40_6 + var_40_4
		elseif #var_41_2 == 1 then
			local var_41_3 = var_41_2[1]
			local var_41_4 = var_41_3:GetConfigID()
			local var_41_5 = arg_40_0:DequeItem(arg_40_0.oneLineTpl)

			var_41_5.name = string.format("Line%s_%s", var_41_1, var_41_4)

			setAnchoredPosition(var_41_5, var_41_0.nodePos + Vector2.New(var_40_6 + var_40_14, 0))

			nextPos = tf(var_41_5).anchoredPosition + Vector2.New(var_40_7 + var_40_12, 0)

			local var_41_6 = arg_40_0.storyNodeStatus[var_41_4].status

			eachChild(var_41_5, function(arg_43_0)
				setImageColor(arg_43_0, Color.NewHex(var_40_0[var_41_6]))
			end)
			table.insert(var_40_5, {
				node = var_41_3,
				nodePos = nextPos
			})
		elseif #var_41_2 > 1 then
			local var_41_7 = {}
			local var_41_8

			table.Ipairs(var_41_2, function(arg_44_0, arg_44_1)
				local var_44_0 = 0
				local var_44_1 = arg_44_1

				local function var_44_2()
					var_44_0 = var_44_0 + 1

					local var_45_0 = arg_40_0.storyTree.childDict[var_44_1:GetConfigID()]

					if not var_45_0 then
						return false
					end

					assert(#var_45_0 <= 1)

					local var_45_1 = var_45_0[1]

					if var_45_1 and #var_45_1:GetPreNodes() == 1 then
						var_44_1 = var_45_1

						return true
					else
						var_41_8 = var_45_1
					end
				end

				while var_44_2() do
					-- block empty
				end

				var_41_7[arg_44_0] = var_44_0
			end)

			local var_41_9 = _.max(var_41_7)
			local var_41_10 = var_41_9 * (var_40_6 + var_40_12 + var_40_14) + (var_41_9 - 1) * var_40_7
			local var_41_11 = var_41_0.nodePos + Vector2.New(var_40_6 + var_40_14, 0)

			;(function()
				local var_46_0 = arg_40_0:DequeItem(arg_40_0.branchHeadTpl)

				setAnchoredPosition(var_46_0, var_41_11)

				var_41_11 = var_41_11 + Vector2.New(var_40_8, 0)

				local var_46_1 = arg_40_0.storyNodeStatus[var_41_2[1]:GetConfigID()].status

				eachChild(var_46_0, function(arg_47_0)
					setImageColor(arg_47_0, Color.NewHex(var_40_0[var_46_1]))
				end)
			end)()
			table.Ipairs(var_41_2, function(arg_48_0, arg_48_1)
				local var_48_0 = var_40_7

				if var_41_7[arg_48_0] < var_41_9 then
					local var_48_1 = var_41_7[arg_48_0]

					var_48_0 = (var_41_10 - var_48_1 * (var_40_6 + var_40_12 + var_40_14)) / (var_48_1 + 1)
				end

				local var_48_2 = arg_48_1:GetConfigID()
				local var_48_3 = var_41_11

				;(function()
					local var_49_0

					if arg_48_0 == 1 then
						var_49_0 = arg_40_0:DequeItem(arg_40_0.branchUpTpl)

						setAnchoredPosition(var_49_0, var_48_3)

						var_48_3 = var_48_3 + Vector2.New(var_40_9, var_40_10)

						if var_41_7[arg_48_0] < var_41_9 then
							setSizeDelta(var_49_0, {
								x = var_40_9 + var_48_0,
								y = var_40_10
							})

							local var_49_1 = tf(var_49_0):Find("Line_1").sizeDelta

							var_49_1.x = var_49_1.x + var_48_0

							setSizeDelta(tf(var_49_0):Find("Line_1"), var_49_1)

							var_48_3 = var_48_3 + Vector2.New(var_48_0, 0)
						end
					elseif (arg_48_0 == 3 or arg_48_0 == 2 and #var_41_2 == 2) and arg_40_0.storyTree.childDict[var_41_2[1]:GetConfigID()] then
						var_49_0 = arg_40_0:DequeItem(arg_40_0.branchDownTpl)

						setAnchoredPosition(var_49_0, var_48_3)

						var_48_3 = var_48_3 + Vector2.New(var_40_9, -var_40_10)

						if var_41_7[arg_48_0] < var_41_9 then
							setSizeDelta(var_49_0, {
								x = var_40_9 + var_48_0,
								y = var_40_10
							})

							local var_49_2 = tf(var_49_0):Find("Line_1").sizeDelta

							var_49_2.x = var_49_2.x + var_48_0

							setSizeDelta(tf(var_49_0):Find("Line_1"), var_49_2)

							var_48_3 = var_48_3 + Vector2.New(var_48_0, 0)
						end
					else
						var_49_0 = arg_40_0:DequeItem(arg_40_0.branchCenterTpl)

						setAnchoredPosition(var_49_0, var_48_3)

						var_48_3 = var_48_3 + Vector2.New(var_40_9, 0)

						if var_41_7[arg_48_0] < var_41_9 then
							local var_49_3 = tf(var_49_0).sizeDelta

							var_49_3.x = var_49_3.x + var_48_0

							setSizeDelta(var_49_0, var_49_3)

							var_48_3 = var_48_3 + Vector2.New(var_48_0, 0)
						end
					end

					var_49_0.name = string.format("Branch%s_%s", var_41_1, var_48_2)

					local var_49_4 = arg_40_0.storyNodeStatus[var_48_2].status

					eachChild(var_49_0, function(arg_50_0)
						setImageColor(arg_50_0, Color.NewHex(var_40_0[var_49_4]))
					end)
				end)()

				var_48_3 = var_48_3 + Vector2.New(var_40_12, 0)

				local var_48_4 = arg_40_0:DequeItem(arg_40_0.storyNodeTpl)

				var_48_4.name = var_48_2

				setAnchoredPosition(var_48_4, var_48_3)

				arg_40_0.storyNodeTFsById[var_48_2] = {
					nodeTF = tf(var_48_4)
				}
				var_48_3 = var_48_3 + Vector2.New(var_40_6 + var_40_14, 0)

				local var_48_5 = arg_48_1

				if arg_40_0.storyTree.childDict[var_48_2] then
					local var_48_6 = arg_40_0.storyTree.childDict[var_48_2][1]

					local function var_48_7()
						if not var_48_6 or var_48_6 == var_41_8 then
							return
						end

						local var_51_0 = arg_40_0:DequeItem(arg_40_0.oneLineTpl)

						var_51_0.name = string.format("Line%s_%s", var_48_5:GetConfigID(), var_48_6:GetConfigID())

						setAnchoredPosition(var_51_0, var_48_3)

						var_48_3 = var_48_3 + Vector2.New(var_48_0 + var_40_12, 0)

						setSizeDelta(var_51_0, {
							x = var_48_0,
							y = arg_40_0.oneLineHeight
						})

						local var_51_1 = arg_40_0.storyNodeStatus[var_48_6:GetConfigID()].status

						eachChild(var_51_0, function(arg_52_0)
							setImageColor(arg_52_0, Color.NewHex(var_40_0[var_51_1]))
						end)

						local var_51_2 = arg_40_0:DequeItem(arg_40_0.storyNodeTpl)

						var_51_2.name = var_48_6:GetConfigID()

						setAnchoredPosition(var_51_2, var_48_3)

						arg_40_0.storyNodeTFsById[var_48_6:GetConfigID()] = {
							nodeTF = tf(var_51_2)
						}
						var_48_3 = var_48_3 + Vector2.New(var_40_6 + var_40_14, 0)

						local var_51_3 = arg_40_0.storyTree.childDict[var_48_6:GetConfigID()]

						if not var_51_3 then
							return false
						end

						var_48_6, var_48_5 = var_51_3[1], var_48_6

						return true
					end

					while var_48_7() do
						-- block empty
					end
				end

				if var_41_8 then
					local var_48_8

					if arg_48_0 == 1 then
						var_48_8 = arg_40_0:DequeItem(arg_40_0.unionUpTpl)

						setAnchoredPosition(var_48_8, var_48_3)

						if var_41_7[arg_48_0] < var_41_9 then
							setSizeDelta(var_48_8, {
								x = var_40_9 + var_48_0,
								y = var_40_10
							})

							local var_48_9 = tf(var_48_8):Find("Line_1").sizeDelta

							var_48_9.x = var_48_9.x + var_48_0

							setSizeDelta(tf(var_48_8):Find("Line_1"), var_48_9)

							var_48_3 = var_48_3 + Vector2.New(var_48_0, 0)
						end
					elseif arg_48_0 == 3 or arg_48_0 == 2 and #var_41_2 == 2 then
						var_48_8 = arg_40_0:DequeItem(arg_40_0.unionDownTpl)

						setAnchoredPosition(var_48_8, var_48_3)

						if var_41_7[arg_48_0] < var_41_9 then
							setSizeDelta(var_48_8, {
								x = var_40_9 + var_48_0,
								y = var_40_10
							})

							local var_48_10 = tf(var_48_8):Find("Line_1").sizeDelta

							var_48_10.x = var_48_10.x + var_48_0

							setSizeDelta(tf(var_48_8):Find("Line_1"), var_48_10)

							var_48_3 = var_48_3 + Vector2.New(var_48_0, 0)
						end
					else
						var_48_8 = arg_40_0:DequeItem(arg_40_0.unionCenterTpl)

						setAnchoredPosition(var_48_8, var_48_3)

						if var_41_7[arg_48_0] < var_41_9 then
							local var_48_11 = tf(var_48_8).sizeDelta

							var_48_11.x = var_48_11.x + var_48_0

							setSizeDelta(var_48_8, var_48_11)

							var_48_3 = var_48_3 + Vector2.New(var_48_0, 0)
						end
					end

					var_48_8.name = string.format("Union%s_%s", var_48_5:GetConfigID(), var_41_8:GetConfigID())

					local var_48_12 = arg_40_0.storyNodeStatus[var_41_8:GetConfigID()].status

					eachChild(var_48_8, function(arg_53_0)
						setImageColor(arg_53_0, Color.NewHex(var_40_0[var_48_12]))
					end)
				end
			end)

			var_41_11 = var_41_11 + Vector2.New(var_41_10 + var_40_9, 0)

			if var_41_8 then
				(function()
					var_41_11 = var_41_11 + Vector2.New(var_40_9, 0)

					local var_54_0 = arg_40_0:DequeItem(arg_40_0.unionTailTpl)

					setAnchoredPosition(var_54_0, var_41_11)

					var_41_11 = var_41_11 + Vector2.New(var_40_11 + var_40_13, 0)

					local var_54_1 = arg_40_0.storyNodeStatus[var_41_8:GetConfigID()].status

					eachChild(var_54_0, function(arg_55_0)
						setImageColor(arg_55_0, Color.NewHex(var_40_0[var_54_1]))
					end)
				end)()
				table.insert(var_40_5, {
					node = var_41_8,
					nodePos = var_41_11
				})
			else
				var_40_2 = var_41_11.x + var_40_4
			end
		end

		return next(var_40_5)
	end

	while var_40_15() do
		-- block empty
	end

	setSizeDelta(arg_40_0.storyContainer, {
		x = var_40_2
	})

	if arg_40_0.spStoryUnreleasedNode then
		local var_40_16 = cloneTplTo(arg_40_0.unreleasedNodeTpl, arg_40_0.storyContainer)

		setAnchoredPosition(var_40_16, {
			y = 0,
			x = var_40_2
		})
		setText(var_40_16:Find("text"), arg_40_0.spStoryUnreleasedNode:GetDisplayName())
		ResourceMgr.Inst:getAssetAsync("ui/" .. arg_40_0.spStoryUnreleasedNode:GetCleanAnimator(), "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_56_0)
			local var_56_0 = Instantiate(arg_56_0)
			local var_56_1 = Vector3.New(-525, 0, 380)

			tf(var_56_0).localPosition = var_56_1

			setParent(var_56_0, var_40_16)
		end), true, true)
	end

	local var_40_17 = arg_40_0.spStoryNodes

	for iter_40_0 = 1, #var_40_17 do
		local var_40_18 = var_40_17[iter_40_0]
		local var_40_19 = var_40_18:GetConfigID()
		local var_40_20 = arg_40_0.storyNodeStatus[var_40_19].status
		local var_40_21 = arg_40_0.storyNodeTFsById[var_40_19].nodeTF
		local var_40_22 = var_40_21:Find("info/bk/title_form/title")

		if var_40_20 == var_0_2 then
			setScrollText(var_40_22, HXSet.hxLan(var_40_18:GetUnlockDesc()))
			setTextAlpha(var_40_22, 0.5)
		else
			setScrollText(var_40_22, HXSet.hxLan(var_40_18:GetDisplayName()))
			setTextAlpha(var_40_22, 1)
		end

		local var_40_23 = var_40_18:GetType()

		setActive(var_40_21:Find("circle/lock"), var_40_20 == var_0_2)

		if var_40_20 == var_0_2 then
			setActive(var_40_21:Find("circle/Story"), false)
			setActive(var_40_21:Find("circle/Battle"), false)
			setActive(var_40_21:Find("circle/Option"), false)
			setText(var_40_21:Find(""))
		elseif var_40_23 == ActivitySpStoryNode.NODE_TYPE.STORY then
			setActive(var_40_21:Find("circle/Option"), false)
			setActive(var_40_21:Find("circle/Story"), true)
			setActive(var_40_21:Find("circle/Battle"), false)
			setActive(var_40_21:Find("circle/Story/Done"), var_40_20 == var_0_4)
		elseif var_40_23 == ActivitySpStoryNode.NODE_TYPE.OPTION_BRANCH then
			setActive(var_40_21:Find("circle/Option"), true)
			setActive(var_40_21:Find("circle/Story"), false)
			setActive(var_40_21:Find("circle/Battle"), false)
			setActive(var_40_21:Find("circle/Option/Done"), var_40_20 == var_0_4)
		elseif var_40_23 == ActivitySpStoryNode.NODE_TYPE.BATTLE then
			setActive(var_40_21:Find("circle/Story"), false)
			setActive(var_40_21:Find("circle/Option"), false)
			setActive(var_40_21:Find("circle/Battle"), var_40_23 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_40_21:Find("circle/Battle/Done"), var_40_20 == var_0_4)
		end

		local var_40_24 = var_40_20 == var_0_4

		setActive(var_40_21:Find("circle/progress"), var_40_24)
		onButton(arg_40_0, var_40_21, function()
			if var_40_20 == var_0_2 then
				return
			end

			local var_57_0 = var_40_18:GetStoryName()

			arg_40_0:PlayStory(var_57_0, function()
				arg_40_0:UpdateView()

				arg_40_0.needFocusStory = true

				arg_40_0:Move2UnlockStory()
			end, true)
		end)
	end

	local var_40_25 = arg_40_0.storyReadCount
	local var_40_26 = arg_40_0.storyReadMax

	setText(arg_40_0.progressText, var_40_25 .. "/" .. var_40_26)
	setActive(arg_40_0.storyAward, tobool(arg_40_0.storyTask))

	if arg_40_0.storyTask then
		local var_40_27 = arg_40_0.storyTask:getConfig("award_display")
		local var_40_28 = Drop.New({
			type = var_40_27[1][1],
			id = var_40_27[1][2],
			count = var_40_27[1][3]
		})

		updateDrop(arg_40_0.storyAward:GetChild(0), var_40_28)

		local var_40_29 = arg_40_0.storyTask:getTaskStatus()

		setActive(arg_40_0.storyAward:Find("get"), var_40_29 == 1)
		setActive(arg_40_0.storyAward:Find("got"), var_40_29 == 2)
		onButton(arg_40_0, arg_40_0.storyAward, function()
			arg_40_0:emit(BaseUI.ON_DROP, var_40_28)
		end)
	end
end

function var_0_0.DequeItem(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0.pools[arg_60_1]:Dequeue()

	table.insert(arg_60_0.activeItems, {
		template = arg_60_1,
		active = var_60_0
	})
	setActive(var_60_0, true)
	setParent(var_60_0, arg_60_0.storyContainer)

	return var_60_0
end

function var_0_0.Move2UnlockStory(arg_61_0)
	if not arg_61_0.needFocusStory then
		return
	end

	arg_61_0.needFocusStory = nil

	local var_61_0 = arg_61_0.spStoryNodes
	local var_61_1

	for iter_61_0 = #var_61_0, 1, -1 do
		local var_61_2 = var_61_0[iter_61_0]:GetConfigID()

		if arg_61_0.storyNodeStatus[var_61_2].status > var_0_2 then
			var_61_1 = var_61_2

			break
		end
	end

	local var_61_3 = arg_61_0.storyNodeTFsById[var_61_1].nodeTF
	local var_61_4 = arg_61_0.storyNodeTpl.rect.width
	local var_61_5 = var_61_3.anchoredPosition.x + var_61_4 * 0.5 - arg_61_0.storyContainer.parent.rect.width * 0.5
	local var_61_6 = math.clamp(var_61_5, 0, math.max(0, arg_61_0.storyContainer.rect.width - arg_61_0.storyContainer.parent.rect.width))

	setAnchoredPosition(arg_61_0.storyContainer, {
		x = -var_61_6
	})
end

function var_0_0.SwitchStoryMapAndBGM(arg_62_0)
	local var_62_0 = arg_62_0.data:getConfig("default_background")
	local var_62_1 = arg_62_0.data:getConfig("default_bgm")
	local var_62_2
	local var_62_3 = arg_62_0.spStoryNodes

	for iter_62_0 = 1, #var_62_3 do
		local var_62_4 = var_62_3[iter_62_0]
		local var_62_5 = var_62_4:GetConfigID()

		if arg_62_0.storyNodeStatus[var_62_5].status == var_0_4 then
			var_62_0, var_62_1 = var_62_4:GetCleanBG(), var_62_4:GetCleanBGM()
			var_62_2 = var_62_4:GetCleanAnimator()
		else
			break
		end
	end

	arg_62_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_62_0,
			Animator = var_62_2
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_62_0.__cname, var_62_1)
end

function var_0_0.TrySubmitTask(arg_63_0)
	local var_63_0 = true

	for iter_63_0, iter_63_1 in ipairs(arg_63_0.spStoryNodes) do
		local var_63_1 = iter_63_1:GetStoryName()

		if var_63_1 and var_63_1 ~= "" then
			var_63_0 = var_63_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_63_1)
		end

		if not var_63_0 then
			break
		end
	end

	if var_63_0 and arg_63_0.storyTask and arg_63_0.storyTask:getTaskStatus() == 1 then
		arg_63_0:emit(LevelMediator2.ON_SUBMIT_TASK, arg_63_0.storyTask.id)

		return
	end
end

function var_0_0.PlayStory(arg_64_0, arg_64_1, arg_64_2, arg_64_3)
	if not arg_64_1 then
		return existCall(arg_64_2)
	end

	local var_64_0 = pg.NewStoryMgr.GetInstance()
	local var_64_1 = var_64_0:IsPlayed(arg_64_1)

	seriesAsync({
		function(arg_65_0)
			if var_64_1 and not arg_64_3 then
				return arg_65_0()
			end

			local var_65_0 = tonumber(arg_64_1)

			if var_65_0 and var_65_0 > 0 then
				arg_64_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_65_0, nil, var_64_1)
			else
				var_64_0:PlayForAcivitySpStory(arg_64_1, arg_65_0, arg_64_3)
			end
		end,
		function(arg_66_0, ...)
			existCall(arg_64_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_67_0)
	local var_67_0 = arg_67_0.activity:getConfig("config_client").task_id
	local var_67_1 = getProxy(TaskProxy):getTaskVO(var_67_0)

	if not var_67_1 then
		errorMsg("Missing Activity Task ID : " .. var_67_0)
	end

	arg_67_0.storyTask = var_67_1 or Task.New({
		id = var_67_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_68_0)
	arg_68_0:UpdateView()
end

function var_0_0.OnDestroy(arg_69_0)
	arg_69_0:RecyclePools()

	for iter_69_0, iter_69_1 in pairs(arg_69_0.pools) do
		iter_69_1:Clear()
	end
end

return var_0_0
