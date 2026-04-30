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
			x = 1920 * tonumber(var_12_3.pos_x),
			y = 1080 * tonumber(var_12_3.pos_y)
		})
	end
end

function var_0_0.UpdateBonusPtIconPath(arg_17_0)
	arg_17_0.bonusPtIconPath = nil

	local var_17_0 = arg_17_0.data or arg_17_0.contextData.map

	if not var_17_0 then
		return
	end

	local var_17_1 = var_17_0:getConfig("on_activity")

	if not var_17_1 or var_17_1 == 0 then
		return
	end

	local var_17_2 = getProxy(ActivityProxy)
	local var_17_3 = var_17_2:getActivityById(var_17_1)

	if not var_17_3 or var_17_3:isEnd() then
		return
	end

	local var_17_4 = var_17_3:GetConfigClientSetting("PTID")

	if not var_17_4 then
		return
	end

	local var_17_5 = underscore.detect(var_17_2:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_18_0)
		return arg_18_0 and not arg_18_0:isEnd() and arg_18_0:getConfig("config_id") == var_17_4
	end)

	if not var_17_5 then
		return
	end

	local var_17_6 = tonumber(var_17_5:getConfig("config_id"))

	if not var_17_6 then
		return
	end

	arg_17_0.bonusPtIconPath = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_17_6
	}):getIcon()
end

function var_0_0.SetDisplayMode(arg_19_0, arg_19_1)
	if arg_19_1 == arg_19_0.contextData.displayMode then
		return
	end

	arg_19_0.contextData.displayMode = arg_19_1

	arg_19_0:UpdateView()
end

function var_0_0.UpdateView(arg_20_0)
	local var_20_0 = string.split(arg_20_0.contextData.map:getConfig("name"), "||")

	if arg_20_0.contextData.displayMode == var_0_0.DISPLAY.STORY then
		var_20_0 = string.split(var_20_0[1], "·")

		setText(arg_20_0.sceneParent.chapterName, var_20_0[1] .. i18n("levelscene_title_story"))
	else
		setText(arg_20_0.sceneParent.chapterName, var_20_0[1])
	end

	local var_20_1 = arg_20_0.contextData.map:getMapTitleNumber()

	arg_20_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_20_1, arg_20_0.sceneParent.chapterNoTitle, true)

	arg_20_0.contextData.displayMode = arg_20_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE

	var_0_0.super.UpdateView(arg_20_0)

	local var_20_2 = arg_20_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_20_0._tf:Find("Battle"), var_20_2)
	setActive(arg_20_0._tf:Find("Story"), not var_20_2)

	local var_20_3 = getProxy(ChapterProxy):IsActivitySPChapterActive(arg_20_0.contextData.map:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip()

	setActive(arg_20_0.battleLayer:Find("Story/BattleTip"), false)
	setActive(arg_20_0.storyLayer:Find("Battle/BattleTip"), var_20_3)
	arg_20_0:UpdateStoryTask()

	if var_20_2 then
		arg_20_0:UpdateBonusPtIconPath()
		arg_20_0:UpdateBattle()
		arg_20_0.sceneParent:SwitchMapBG(arg_20_0.contextData.map)
		arg_20_0.sceneParent:PlayBGM()
	else
		arg_20_0:UpdateStory()
		arg_20_0:SwitchStoryMapAndBGM()
	end

	arg_20_0:TrySubmitTask()
end

function var_0_0.UpdateBattle(arg_21_0)
	local var_21_0 = getProxy(ChapterProxy)
	local var_21_1 = arg_21_0.displayChapterIDs
	local var_21_2 = {}

	for iter_21_0, iter_21_1 in ipairs(var_21_1) do
		local var_21_3 = var_21_0:getChapterById(iter_21_1)

		table.insert(var_21_2, var_21_3)
	end

	table.clear(arg_21_0.chapterTFsById)
	UIItemList.StaticAlign(arg_21_0.itemHolder, arg_21_0.chapterTpl, #var_21_2, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_22_0 = var_21_2[arg_22_1 + 1]

		arg_21_0:UpdateMapItem(arg_22_2, var_22_0)

		arg_22_2.name = "Chapter_" .. var_22_0.id
		arg_21_0.chapterTFsById[var_22_0.id] = arg_22_2
	end)
end

function var_0_0.HideFloat(arg_23_0)
	var_0_0.super.HideFloat(arg_23_0)
	setActive(arg_23_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_24_0)
	var_0_0.super.ShowFloat(arg_24_0)
	setActive(arg_24_0.itemHolder, true)
end

function var_0_0.UpdateMapItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_2:getConfigTable()

	setAnchoredPosition(arg_25_1, {
		x = arg_25_0.mapWidth * var_25_0.pos_x,
		y = arg_25_0.mapHeight * var_25_0.pos_y
	})

	local var_25_1 = findTF(arg_25_1, "main")

	setActive(var_25_1, true)

	local var_25_2 = findTF(var_25_1, "circle/fordark")
	local var_25_3 = findTF(var_25_1, "info/bk/fordark")

	setActive(var_25_2, var_25_0.icon_outline == 1)
	setActive(var_25_3, var_25_0.icon_outline == 1)

	local var_25_4 = arg_25_0.chapterGroupDict[arg_25_2.id]

	assert(var_25_4)

	local var_25_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_25_6 = 1

	if arg_25_2:isUnlock() then
		var_25_6 = 2

		if #var_25_4.list > 1 then
			var_25_6 = table.indexof(var_25_4.list, arg_25_2.id) + 1
		elseif arg_25_2:IsSpChapter() or arg_25_2:IsEXChapter() then
			var_25_6 = 3
		elseif arg_25_0.contextData.map:isHardMap() then
			var_25_6 = 3
		end
	end

	local var_25_7 = findTF(var_25_1, "circle/bk")

	for iter_25_0, iter_25_1 in ipairs(var_25_5) do
		setActive(var_25_7:Find(iter_25_1), iter_25_0 == var_25_6)
	end

	local var_25_8 = findTF(var_25_1, "circle/clear_flag")
	local var_25_9 = findTF(var_25_1, "circle/lock")
	local var_25_10 = findTF(var_25_1, "circle/progress")
	local var_25_11 = findTF(var_25_1, "circle/progress_text")
	local var_25_12 = findTF(var_25_1, "circle/stars")
	local var_25_13 = string.split(var_25_0.name, "|")

	setText(findTF(var_25_1, "info/bk/title_form/title_index"), var_25_0.chapter_name .. "  ")
	setText(findTF(var_25_1, "info/bk/title_form/title"), var_25_13[1])
	setText(findTF(var_25_1, "info/bk/title_form/title_en"), var_25_13[2] or "")
	setFillAmount(var_25_10, arg_25_2.progress / 100)
	setText(var_25_11, string.format("%d%%", arg_25_2.progress))
	setActive(var_25_12, arg_25_2:existAchieve())

	if arg_25_2:existAchieve() then
		for iter_25_2, iter_25_3 in ipairs(arg_25_2.achieves) do
			local var_25_14 = ChapterConst.IsAchieved(iter_25_3)
			local var_25_15 = var_25_12:GetChild(iter_25_2 - 1):Find("light")

			setActive(var_25_15, var_25_14)

			for iter_25_4, iter_25_5 in ipairs(var_25_5) do
				if iter_25_5 ~= "Lock" then
					setActive(var_25_15:Find(iter_25_5), iter_25_4 == var_25_6)
				end
			end
		end
	end

	local var_25_16 = findTF(var_25_1, "info/bk/BG")

	for iter_25_6, iter_25_7 in ipairs(var_25_5) do
		setActive(var_25_16:Find(iter_25_7), iter_25_6 == var_25_6)
	end

	setActive(findTF(var_25_1, "HardEffect"), var_25_6 == 3)

	local var_25_17 = not arg_25_2.active and arg_25_2:isClear()
	local var_25_18 = not arg_25_2.active and not arg_25_2:isUnlock()

	setActive(var_25_8, var_25_17)
	setActive(var_25_9, var_25_18)
	setActive(var_25_11, not var_25_17 and not var_25_18)
	arg_25_0:DeleteTween("fighting" .. arg_25_2.id)

	local var_25_19 = findTF(var_25_1, "circle/fighting")

	setText(findTF(var_25_19, "Text"), i18n("tag_level_fighting"))

	local var_25_20 = findTF(var_25_1, "circle/oni")

	setText(findTF(var_25_20, "Text"), i18n("tag_level_oni"))

	local var_25_21 = findTF(var_25_1, "circle/narrative")

	setText(findTF(var_25_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_25_19, false)
	setActive(var_25_20, false)
	setActive(var_25_21, false)

	local var_25_22
	local var_25_23

	if arg_25_2:getConfig("chapter_tag") == 1 then
		var_25_22 = var_25_21
	end

	if arg_25_2.active then
		var_25_22 = arg_25_2:existOni() and var_25_20 or var_25_19
	end

	if var_25_22 then
		setActive(var_25_22, true)

		local var_25_24 = GetOrAddComponent(var_25_22, "CanvasGroup")

		var_25_24.alpha = 1

		arg_25_0:RecordTween("fighting" .. arg_25_2.id, LeanTween.alphaCanvas(var_25_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_25_25 = findTF(var_25_1, "triesLimit")
	local var_25_26 = arg_25_2:isTriesLimit()

	setActive(var_25_25, var_25_26)

	if var_25_26 then
		local var_25_27 = arg_25_2:getConfig("count")
		local var_25_28 = var_25_27 - arg_25_2:getTodayDefeatCount() .. "/" .. var_25_27

		setText(var_25_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_25_25:Find("Text"), setColorStr(var_25_28, var_25_27 <= arg_25_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_25_29 = pg.expedition_data_by_map[arg_25_2:getConfig("map")].on_activity
		local var_25_30 = getProxy(ChapterProxy):IsActivitySPChapterActive(var_25_29) and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_25_25:Find("TipRect"), var_25_30)
	end

	local var_25_31 = arg_25_2:GetDailyBonusQuota()
	local var_25_32 = findTF(var_25_1, "mark")
	local var_25_33 = var_25_32:Find("bonus")
	local var_25_34 = var_25_33:Find("icon")
	local var_25_35 = findTF(var_25_33, "icon/Image")

	setActive(var_25_33, var_25_31)
	setActive(var_25_32, var_25_31)

	if var_25_34 then
		setActive(var_25_34, var_25_31 and arg_25_0.bonusPtIconPath)
	end

	if var_25_31 then
		local var_25_36 = var_25_32:GetComponent(typeof(CanvasGroup))
		local var_25_37 = arg_25_2:GetDailyBonusIconName()

		arg_25_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_25_37, var_25_33)

		if var_25_34 and arg_25_0.bonusPtIconPath then
			if var_25_35 then
				GetImageSpriteFromAtlasAsync(arg_25_0.bonusPtIconPath, "", var_25_35, true)
			else
				GetImageSpriteFromAtlasAsync(arg_25_0.bonusPtIconPath, "", var_25_34, true)
			end
		end

		LeanTween.cancel(go(var_25_32), true)

		local var_25_38 = var_25_32.anchoredPosition.y

		var_25_36.alpha = 0

		LeanTween.value(go(var_25_32), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_26_0)
			var_25_36.alpha = arg_26_0

			local var_26_0 = var_25_32.anchoredPosition

			var_26_0.y = var_25_38 * arg_26_0
			var_25_32.anchoredPosition = var_26_0
		end)):setOnComplete(System.Action(function()
			var_25_36.alpha = 1

			local var_27_0 = var_25_32.anchoredPosition

			var_27_0.y = var_25_38
			var_25_32.anchoredPosition = var_27_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_25_39 = arg_25_2.id

	onButton(arg_25_0, var_25_1, function()
		arg_25_0:TryOpenChapterInfo(var_25_39, nil, var_25_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
	arg_25_0:PlayerLevelTplAnimation(arg_25_1, {
		status = var_25_5[var_25_6],
		chapterVO = arg_25_2
	})
end

function var_0_0.PlayerLevelTplAnimation(arg_29_0, arg_29_1, arg_29_2)
	return
end

function var_0_0.SwitchChapter(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.chapterGroupDict[arg_30_1]

	if not var_30_0 then
		return
	end

	local var_30_1 = var_30_0.list[var_30_0.index]

	if var_30_1 == arg_30_1 then
		return
	end

	local var_30_2 = table.indexof(var_30_0.list, arg_30_1)

	var_30_0.index = var_30_2

	local var_30_3 = var_30_0.list[1]
	local var_30_4 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("spchapter_selected_" .. var_30_4 .. "_" .. var_30_3, var_30_2)

	local var_30_5 = arg_30_0.chapterTFsById[var_30_1]

	arg_30_0.chapterTFsById[var_30_1] = nil
	arg_30_0.chapterTFsById[arg_30_1] = var_30_5

	arg_30_0:UpdateChapterTF(arg_30_1)
end

function var_0_0.UpdateChapterTF(arg_31_0, arg_31_1)
	if not arg_31_0.chapterGroupDict[arg_31_1] then
		return
	end

	local var_31_0 = arg_31_0.chapterTFsById[arg_31_1]

	if var_31_0 then
		local var_31_1 = getProxy(ChapterProxy):getChapterById(arg_31_1)

		arg_31_0:UpdateMapItem(var_31_0, var_31_1)
	end
end

function var_0_0.UpdateStory(arg_32_0)
	local var_32_0 = {}
	local var_32_1 = pg.NewStoryMgr.GetInstance()
	local var_32_2 = 0
	local var_32_3 = 0

	for iter_32_0, iter_32_1 in pairs(arg_32_0.storyNodesDict) do
		local var_32_4 = arg_32_0.storyHolder:Find(tostring(iter_32_1.id))
		local var_32_5 = iter_32_1:IsActive(arg_32_0.activity, arg_32_0.sceneParent.ptActivity)

		setActive(var_32_4, var_32_5)
		setText(var_32_4:Find("main/char/bg/Text"), iter_32_1:GetName())

		local var_32_6 = iter_32_1:IsReaded()

		setActive(var_32_4:Find("main/char"), not var_32_6)
		setActive(var_32_4:Find("main/talk"), var_32_6)
		onButton(arg_32_0, var_32_4, function()
			if var_32_6 then
				return
			end

			local var_33_0 = iter_32_1:GetStory()

			arg_32_0:PlayStory(var_33_0, function()
				arg_32_0:UpdateView()
			end)
		end)

		var_32_2 = var_32_2 + (var_32_6 and 1 or 0)
		var_32_3 = var_32_3 + 1
	end

	setText(arg_32_0.progressText, var_32_2 .. "/" .. var_32_3)
	setActive(arg_32_0.storyAward, tobool(arg_32_0.storyTask))

	if arg_32_0.storyTask then
		local var_32_7 = arg_32_0.storyTask:getConfig("award_display")
		local var_32_8 = Drop.Create(var_32_7[1])

		updateDrop(arg_32_0.storyAward:GetChild(0), var_32_8)

		local var_32_9 = arg_32_0.storyTask:getTaskStatus()

		setActive(arg_32_0.storyAward:Find("get"), var_32_9 == 1)
		setActive(arg_32_0.storyAward:Find("got"), var_32_9 == 2)
		onButton(arg_32_0, arg_32_0.storyAward, function()
			arg_32_0:emit(BaseUI.ON_DROP, var_32_8)
		end)
	end
end

function var_0_0.SwitchStoryMapAndBGM(arg_36_0)
	local var_36_0 = arg_36_0.data:getConfig("default_background")
	local var_36_1 = arg_36_0.data:getConfig("default_bgm")
	local var_36_2
	local var_36_3 = underscore.keys(arg_36_0.storyNodesDict)

	table.sort(var_36_3)

	for iter_36_0 = 1, #var_36_3 do
		local var_36_4 = arg_36_0.storyNodesDict[var_36_3[iter_36_0]]

		if var_36_4:IsReaded() then
			var_36_0 = defaultValue(var_36_4:GetCleanBG(), var_36_0)
			var_36_1 = defaultValue(var_36_4:GetCleanBGM(), var_36_1)
			var_36_2 = defaultValue(var_36_4:GetCleanAnimator(), var_36_2)
		else
			break
		end
	end

	arg_36_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_36_0,
			Animator = var_36_2
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_36_0.__cname, var_36_1)
end

function var_0_0.TrySubmitTask(arg_37_0)
	if underscore.all(underscore.values(arg_37_0.storyNodesDict), function(arg_38_0)
		return arg_38_0:IsReaded()
	end) and arg_37_0.storyTask and arg_37_0.storyTask:getTaskStatus() == 1 then
		arg_37_0:emit(LevelMediator2.ON_SUBMIT_TASK, arg_37_0.storyTask.id)

		return
	end
end

function var_0_0.TryOpenChapter(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.chapterTFsById[arg_39_1]

	if var_39_0 then
		local var_39_1 = var_39_0:Find("main")

		triggerButton(var_39_1)
	end
end

function var_0_0.PlayStory(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	if not arg_40_1 then
		return existCall(arg_40_2)
	end

	local var_40_0 = pg.NewStoryMgr.GetInstance()
	local var_40_1 = var_40_0:IsPlayed(arg_40_1)

	seriesAsync({
		function(arg_41_0)
			if var_40_1 and not arg_40_3 then
				return arg_41_0()
			end

			local var_41_0 = tonumber(arg_40_1)

			if var_41_0 and var_41_0 > 0 then
				arg_40_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_41_0, nil, var_40_1)
			else
				var_40_0:Play(arg_40_1, arg_41_0, arg_40_3)
			end
		end,
		function(arg_42_0, ...)
			existCall(arg_40_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_43_0)
	local var_43_0 = arg_43_0.activity:getConfig("config_client").task_id
	local var_43_1 = getProxy(TaskProxy):getTaskVO(var_43_0)

	if not var_43_1 then
		errorMsg("Missing Activity Task ID : " .. var_43_0)
	end

	print(var_43_0)

	arg_43_0.storyTask = var_43_1 or Task.New({
		id = var_43_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_44_0)
	arg_44_0:UpdateView()
end

function var_0_0.OnDestroy(arg_45_0)
	return
end

return var_0_0
