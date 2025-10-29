local var_0_0 = class("MapBuilderSPSeries", import(".MapBuilder"))

var_0_0.DISPLAY = {
	STORY = 2,
	BATTLE = 1
}
var_0_0.DIFFICULITY = {
	EASY = 1,
	HARD = 2
}

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPESPSERIES
end

function var_0_0.getUIName(arg_2_0)
	return "LevelSelectSPSeriesUI"
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
	arg_4_0.storyNodeTpl = arg_4_0.storyHolder:Find("tpl")

	setActive(arg_4_0.storyNodeTpl, false)

	arg_4_0.progressText = arg_4_0._tf:Find("Story/Desc/Text")
	arg_4_0.storyAward = arg_4_0._tf:Find("Story/Award")
	arg_4_0.activeItems = {}
	arg_4_0.displayChapterIDs = {}
	arg_4_0.chapterTFsById = {}
	arg_4_0.storyNodeTFsById = {}

	arg_4_0:bind(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, function(arg_5_0, arg_5_1)
		arg_4_0:SwitchChapter(arg_5_1)
	end)
	onButton(arg_4_0, arg_4_0.battleLayer:Find("Story/Switch"), function()
		arg_4_0:SetDisplayMode(var_0_0.DISPLAY.STORY)
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
	arg_12_0.storyNodesDict = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.activity:getConfig("config_client").storys) do
		arg_12_0.storyNodesDict[iter_12_1] = BossRushStoryNode.New({
			id = iter_12_1
		})

		local var_12_2 = arg_12_0.storyHolder:Find(tostring(iter_12_1)) or cloneTplTo(arg_12_0.storyNodeTpl, arg_12_0.storyHolder, iter_12_1)
		local var_12_3 = arg_12_0.storyNodesDict[iter_12_1]:getConfigTable()

		setAnchoredPosition(var_12_2, {
			x = arg_12_0.mapWidth * tonumber(var_12_3.pos_x),
			y = arg_12_0.mapHeight * tonumber(var_12_3.pos_y)
		})
	end
end

function var_0_0.SetDisplayMode(arg_17_0, arg_17_1)
	if arg_17_1 == arg_17_0.contextData.displayMode then
		return
	end

	arg_17_0.contextData.displayMode = arg_17_1

	arg_17_0:UpdateView()
end

function var_0_0.UpdateView(arg_18_0)
	local var_18_0 = string.split(arg_18_0.contextData.map:getConfig("name"), "||")

	if arg_18_0.contextData.displayMode == var_0_0.DISPLAY.STORY then
		var_18_0 = string.split(var_18_0[1], "·")

		setText(arg_18_0.sceneParent.chapterName, var_18_0[1] .. i18n("levelscene_title_story"))
	else
		setText(arg_18_0.sceneParent.chapterName, var_18_0[1])
	end

	local var_18_1 = arg_18_0.contextData.map:getMapTitleNumber()

	arg_18_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_18_1, arg_18_0.sceneParent.chapterNoTitle, true)

	arg_18_0.contextData.displayMode = arg_18_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE

	var_0_0.super.UpdateView(arg_18_0)

	local var_18_2 = arg_18_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_18_0._tf:Find("Battle"), var_18_2)
	setActive(arg_18_0._tf:Find("Story"), not var_18_2)

	local var_18_3 = getProxy(ChapterProxy):IsActivitySPChapterActive(arg_18_0.contextData.map:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip()

	setActive(arg_18_0.battleLayer:Find("Story/BattleTip"), false)
	setActive(arg_18_0.storyLayer:Find("Battle/BattleTip"), var_18_3)
	arg_18_0:UpdateStoryTask()

	if var_18_2 then
		arg_18_0:UpdateBattle()
		arg_18_0.sceneParent:SwitchMapBG(arg_18_0.contextData.map)
		arg_18_0.sceneParent:PlayBGM()
	else
		arg_18_0:UpdateStory()
		arg_18_0:SwitchStoryMapAndBGM()
	end

	arg_18_0:TrySubmitTask()
end

function var_0_0.UpdateBattle(arg_19_0)
	local var_19_0 = getProxy(ChapterProxy)
	local var_19_1 = arg_19_0.displayChapterIDs
	local var_19_2 = {}

	for iter_19_0, iter_19_1 in ipairs(var_19_1) do
		local var_19_3 = var_19_0:getChapterById(iter_19_1)

		table.insert(var_19_2, var_19_3)
	end

	table.clear(arg_19_0.chapterTFsById)
	UIItemList.StaticAlign(arg_19_0.itemHolder, arg_19_0.chapterTpl, #var_19_2, function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_20_0 = var_19_2[arg_20_1 + 1]

		arg_19_0:UpdateMapItem(arg_20_2, var_20_0)

		arg_20_2.name = "Chapter_" .. var_20_0.id
		arg_19_0.chapterTFsById[var_20_0.id] = arg_20_2
	end)
end

function var_0_0.HideFloat(arg_21_0)
	var_0_0.super.HideFloat(arg_21_0)
	setActive(arg_21_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_22_0)
	var_0_0.super.ShowFloat(arg_22_0)
	setActive(arg_22_0.itemHolder, true)
end

function var_0_0.UpdateMapItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_2:getConfigTable()

	setAnchoredPosition(arg_23_1, {
		x = arg_23_0.mapWidth * var_23_0.pos_x,
		y = arg_23_0.mapHeight * var_23_0.pos_y
	})

	local var_23_1 = findTF(arg_23_1, "main")

	setActive(var_23_1, true)

	local var_23_2 = findTF(var_23_1, "circle/fordark")
	local var_23_3 = findTF(var_23_1, "info/bk/fordark")

	setActive(var_23_2, var_23_0.icon_outline == 1)
	setActive(var_23_3, var_23_0.icon_outline == 1)

	local var_23_4 = arg_23_0.chapterGroupDict[arg_23_2.id]

	assert(var_23_4)

	local var_23_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_23_6 = 1

	if arg_23_2:isUnlock() then
		var_23_6 = 2

		if #var_23_4.list > 1 then
			var_23_6 = table.indexof(var_23_4.list, arg_23_2.id) + 1
		elseif arg_23_2:IsSpChapter() or arg_23_2:IsEXChapter() then
			var_23_6 = 3
		elseif arg_23_0.contextData.map:isHardMap() then
			var_23_6 = 3
		end
	end

	local var_23_7 = findTF(var_23_1, "circle/bk")

	for iter_23_0, iter_23_1 in ipairs(var_23_5) do
		setActive(var_23_7:Find(iter_23_1), iter_23_0 == var_23_6)
	end

	local var_23_8 = findTF(var_23_1, "circle/clear_flag")
	local var_23_9 = findTF(var_23_1, "circle/lock")
	local var_23_10 = findTF(var_23_1, "circle/progress")
	local var_23_11 = findTF(var_23_1, "circle/progress_text")
	local var_23_12 = findTF(var_23_1, "circle/stars")
	local var_23_13 = string.split(var_23_0.name, "|")

	setText(findTF(var_23_1, "info/bk/title_form/title_index"), var_23_0.chapter_name .. "  ")
	setText(findTF(var_23_1, "info/bk/title_form/title"), var_23_13[1])
	setText(findTF(var_23_1, "info/bk/title_form/title_en"), var_23_13[2] or "")
	setFillAmount(var_23_10, arg_23_2.progress / 100)
	setText(var_23_11, string.format("%d%%", arg_23_2.progress))
	setActive(var_23_12, arg_23_2:existAchieve())

	if arg_23_2:existAchieve() then
		for iter_23_2, iter_23_3 in ipairs(arg_23_2.achieves) do
			local var_23_14 = ChapterConst.IsAchieved(iter_23_3)
			local var_23_15 = var_23_12:GetChild(iter_23_2 - 1):Find("light")

			setActive(var_23_15, var_23_14)

			for iter_23_4, iter_23_5 in ipairs(var_23_5) do
				if iter_23_5 ~= "Lock" then
					setActive(var_23_15:Find(iter_23_5), iter_23_4 == var_23_6)
				end
			end
		end
	end

	local var_23_16 = findTF(var_23_1, "info/bk/BG")

	for iter_23_6, iter_23_7 in ipairs(var_23_5) do
		setActive(var_23_16:Find(iter_23_7), iter_23_6 == var_23_6)
	end

	setActive(findTF(var_23_1, "HardEffect"), var_23_6 == 3)

	local var_23_17 = not arg_23_2.active and arg_23_2:isClear()
	local var_23_18 = not arg_23_2.active and not arg_23_2:isUnlock()

	setActive(var_23_8, var_23_17)
	setActive(var_23_9, var_23_18)
	setActive(var_23_11, not var_23_17 and not var_23_18)
	arg_23_0:DeleteTween("fighting" .. arg_23_2.id)

	local var_23_19 = findTF(var_23_1, "circle/fighting")

	setText(findTF(var_23_19, "Text"), i18n("tag_level_fighting"))

	local var_23_20 = findTF(var_23_1, "circle/oni")

	setText(findTF(var_23_20, "Text"), i18n("tag_level_oni"))

	local var_23_21 = findTF(var_23_1, "circle/narrative")

	setText(findTF(var_23_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_23_19, false)
	setActive(var_23_20, false)
	setActive(var_23_21, false)

	local var_23_22
	local var_23_23

	if arg_23_2:getConfig("chapter_tag") == 1 then
		var_23_22 = var_23_21
	end

	if arg_23_2.active then
		var_23_22 = arg_23_2:existOni() and var_23_20 or var_23_19
	end

	if var_23_22 then
		setActive(var_23_22, true)

		local var_23_24 = GetOrAddComponent(var_23_22, "CanvasGroup")

		var_23_24.alpha = 1

		arg_23_0:RecordTween("fighting" .. arg_23_2.id, LeanTween.alphaCanvas(var_23_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_23_25 = findTF(var_23_1, "triesLimit")
	local var_23_26 = arg_23_2:isTriesLimit()

	setActive(var_23_25, var_23_26)

	if var_23_26 then
		local var_23_27 = arg_23_2:getConfig("count")
		local var_23_28 = var_23_27 - arg_23_2:getTodayDefeatCount() .. "/" .. var_23_27

		setText(var_23_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_23_25:Find("Text"), setColorStr(var_23_28, var_23_27 <= arg_23_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_23_29 = pg.expedition_data_by_map[arg_23_2:getConfig("map")].on_activity
		local var_23_30 = getProxy(ChapterProxy):IsActivitySPChapterActive(var_23_29) and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_23_25:Find("TipRect"), var_23_30)
	end

	local var_23_31 = arg_23_2:GetDailyBonusQuota()
	local var_23_32 = findTF(var_23_1, "mark")

	setActive(var_23_32:Find("bonus"), var_23_31)
	setActive(var_23_32, var_23_31)

	if var_23_31 then
		local var_23_33 = var_23_32:GetComponent(typeof(CanvasGroup))
		local var_23_34 = var_23_6 == 3 and "bonus_us_hard" or "bonus_us"

		arg_23_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_23_34, var_23_32:Find("bonus"))
		LeanTween.cancel(go(var_23_32), true)

		local var_23_35 = var_23_32.anchoredPosition.y

		var_23_33.alpha = 0

		LeanTween.value(go(var_23_32), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_24_0)
			var_23_33.alpha = arg_24_0

			local var_24_0 = var_23_32.anchoredPosition

			var_24_0.y = var_23_35 * arg_24_0
			var_23_32.anchoredPosition = var_24_0
		end)):setOnComplete(System.Action(function()
			var_23_33.alpha = 1

			local var_25_0 = var_23_32.anchoredPosition

			var_25_0.y = var_23_35
			var_23_32.anchoredPosition = var_25_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_23_36 = arg_23_2.id

	onButton(arg_23_0, var_23_1, function()
		arg_23_0:TryOpenChapterInfo(var_23_36, nil, var_23_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
	arg_23_0:PlayerLevelTplAnimation(arg_23_1, {
		status = var_23_5[var_23_6],
		chapterVO = arg_23_2
	})
end

function var_0_0.PlayerLevelTplAnimation(arg_27_0, arg_27_1, arg_27_2)
	return
end

function var_0_0.SwitchChapter(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.chapterGroupDict[arg_28_1]

	if not var_28_0 then
		return
	end

	local var_28_1 = var_28_0.list[var_28_0.index]

	if var_28_1 == arg_28_1 then
		return
	end

	local var_28_2 = table.indexof(var_28_0.list, arg_28_1)

	var_28_0.index = var_28_2

	local var_28_3 = var_28_0.list[1]
	local var_28_4 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("spchapter_selected_" .. var_28_4 .. "_" .. var_28_3, var_28_2)

	local var_28_5 = arg_28_0.chapterTFsById[var_28_1]

	arg_28_0.chapterTFsById[var_28_1] = nil
	arg_28_0.chapterTFsById[arg_28_1] = var_28_5

	arg_28_0:UpdateChapterTF(arg_28_1)
end

function var_0_0.UpdateChapterTF(arg_29_0, arg_29_1)
	if not arg_29_0.chapterGroupDict[arg_29_1] then
		return
	end

	local var_29_0 = arg_29_0.chapterTFsById[arg_29_1]

	if var_29_0 then
		local var_29_1 = getProxy(ChapterProxy):getChapterById(arg_29_1)

		arg_29_0:UpdateMapItem(var_29_0, var_29_1)
	end
end

function var_0_0.UpdateStory(arg_30_0)
	local var_30_0 = {}
	local var_30_1 = pg.NewStoryMgr.GetInstance()
	local var_30_2 = 0
	local var_30_3 = 0

	for iter_30_0, iter_30_1 in pairs(arg_30_0.storyNodesDict) do
		local var_30_4 = arg_30_0.storyHolder:Find(tostring(iter_30_1.id))
		local var_30_5 = iter_30_1:IsActive(arg_30_0.activity, arg_30_0.ptActivity)

		setActive(var_30_4, var_30_5)
		setText(var_30_4:Find("main/char/bg/Text"), iter_30_1:GetName())

		local var_30_6 = iter_30_1:IsReaded()

		setActive(var_30_4:Find("main/char"), not var_30_6)
		setActive(var_30_4:Find("main/talk"), var_30_6)
		onButton(arg_30_0, var_30_4, function()
			if var_30_6 then
				return
			end

			local var_31_0 = iter_30_1:GetStory()

			arg_30_0:PlayStory(var_31_0, function()
				arg_30_0:UpdateView()
			end)
		end)

		var_30_2 = var_30_2 + (var_30_6 and 1 or 0)
		var_30_3 = var_30_3 + 1
	end

	setText(arg_30_0.progressText, var_30_2 .. "/" .. var_30_3)
	setActive(arg_30_0.storyAward, tobool(arg_30_0.storyTask))

	if arg_30_0.storyTask then
		local var_30_7 = arg_30_0.storyTask:getConfig("award_display")
		local var_30_8 = Drop.Create(var_30_7[1])

		updateDrop(arg_30_0.storyAward:GetChild(0), var_30_8)

		local var_30_9 = arg_30_0.storyTask:getTaskStatus()

		setActive(arg_30_0.storyAward:Find("get"), var_30_9 == 1)
		setActive(arg_30_0.storyAward:Find("got"), var_30_9 == 2)
		onButton(arg_30_0, arg_30_0.storyAward, function()
			arg_30_0:emit(BaseUI.ON_DROP, var_30_8)
		end)
	end
end

function var_0_0.SwitchStoryMapAndBGM(arg_34_0)
	local var_34_0 = arg_34_0.data:getConfig("default_background")
	local var_34_1 = arg_34_0.data:getConfig("default_bgm")
	local var_34_2
	local var_34_3 = underscore.keys(arg_34_0.storyNodesDict)

	table.sort(var_34_3)

	for iter_34_0 = 1, #var_34_3 do
		local var_34_4 = arg_34_0.storyNodesDict[var_34_3[iter_34_0]]

		if var_34_4:IsReaded() then
			var_34_0 = defaultValue(var_34_4:GetCleanBG(), var_34_0)
			var_34_1 = defaultValue(var_34_4:GetCleanBGM(), var_34_1)
			var_34_2 = defaultValue(var_34_4:GetCleanAnimator(), var_34_2)
		else
			break
		end
	end

	arg_34_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_34_0,
			Animator = var_34_2
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_34_0.__cname, var_34_1)
end

function var_0_0.TrySubmitTask(arg_35_0)
	if underscore.all(underscore.values(arg_35_0.storyNodesDict), function(arg_36_0)
		return arg_36_0:IsReaded()
	end) and arg_35_0.storyTask and arg_35_0.storyTask:getTaskStatus() == 1 then
		arg_35_0:emit(LevelMediator2.ON_SUBMIT_TASK, arg_35_0.storyTask.id)

		return
	end
end

function var_0_0.TryOpenChapter(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.chapterTFsById[arg_37_1]

	if var_37_0 then
		local var_37_1 = var_37_0:Find("main")

		triggerButton(var_37_1)
	end
end

function var_0_0.PlayStory(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	if not arg_38_1 then
		return existCall(arg_38_2)
	end

	local var_38_0 = pg.NewStoryMgr.GetInstance()
	local var_38_1 = var_38_0:IsPlayed(arg_38_1)

	seriesAsync({
		function(arg_39_0)
			if var_38_1 and not arg_38_3 then
				return arg_39_0()
			end

			local var_39_0 = tonumber(arg_38_1)

			if var_39_0 and var_39_0 > 0 then
				arg_38_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_39_0, nil, var_38_1)
			else
				var_38_0:Play(arg_38_1, arg_39_0, arg_38_3)
			end
		end,
		function(arg_40_0, ...)
			existCall(arg_38_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_41_0)
	local var_41_0 = arg_41_0.activity:getConfig("config_client").task_id
	local var_41_1 = getProxy(TaskProxy):getTaskVO(var_41_0)

	if not var_41_1 then
		errorMsg("Missing Activity Task ID : " .. var_41_0)
	end

	arg_41_0.storyTask = var_41_1 or Task.New({
		id = var_41_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_42_0)
	arg_42_0:UpdateView()
end

function var_0_0.OnDestroy(arg_43_0)
	return
end

return var_0_0
