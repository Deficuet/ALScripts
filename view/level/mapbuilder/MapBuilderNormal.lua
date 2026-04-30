local var_0_0 = class("MapBuilderNormal", import(".MapBuilderPermanent"))

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPENORMAL
end

function var_0_0.getUIName(arg_2_0)
	return "levels"
end

function var_0_0.Load(arg_3_0)
	if arg_3_0._state ~= var_0_0.STATES.NONE then
		return
	end

	arg_3_0._state = var_0_0.STATES.LOADING

	pg.UIMgr.GetInstance():LoadingOn()

	local var_3_0 = arg_3_0.float:Find("levels").gameObject

	arg_3_0:Loaded(var_3_0)
	arg_3_0:Init()
end

function var_0_0.Destroy(arg_4_0)
	if arg_4_0._state == var_0_0.STATES.DESTROY then
		return
	end

	if not arg_4_0:GetLoaded() then
		arg_4_0._state = var_0_0.STATES.DESTROY

		return
	end

	arg_4_0:Hide()
	arg_4_0:OnDestroy()
	pg.DelegateInfo.Dispose(arg_4_0)

	arg_4_0._go = nil

	arg_4_0:disposeEvent()
	arg_4_0:cleanManagedTween()

	arg_4_0._state = var_0_0.STATES.DESTROY
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0.chapterTpl = arg_5_0._tf:Find("level_tpl")

	setActive(arg_5_0.chapterTpl, false)

	arg_5_0.storyTpl = arg_5_0._tf:Find("story_tpl")

	setActive(arg_5_0.storyTpl, false)

	arg_5_0.itemHolder = arg_5_0._tf:Find("items")
	arg_5_0.storyHolder = arg_5_0._tf:Find("stories")
	arg_5_0.chapterTFsById = {}
	arg_5_0.chaptersInBackAnimating = {}
end

function var_0_0.OnShow(arg_6_0)
	var_0_0.super.OnShow(arg_6_0)
	setActive(arg_6_0.sceneParent.mainLayer:Find("title_chapter_lines"), true)
	setActive(arg_6_0.sceneParent.topChapter:Find("title_chapter"), true)
	setActive(arg_6_0.sceneParent.topChapter:Find("type_chapter"), true)
end

function var_0_0.OnHide(arg_7_0)
	setActive(arg_7_0.sceneParent.mainLayer:Find("title_chapter_lines"), false)
	setActive(arg_7_0.sceneParent.topChapter:Find("title_chapter"), false)
	setActive(arg_7_0.sceneParent.topChapter:Find("type_chapter"), false)
	table.clear(arg_7_0.chaptersInBackAnimating)

	for iter_7_0, iter_7_1 in pairs(arg_7_0.chapterTFsById) do
		local var_7_0 = findTF(iter_7_1, "main/info/bk")

		LeanTween.cancel(rtf(var_7_0))
	end

	var_0_0.super.OnHide(arg_7_0)
end

function var_0_0.UpdateView(arg_8_0)
	local var_8_0 = string.split(arg_8_0.contextData.map:getConfig("name"), "||")

	setText(arg_8_0.sceneParent.chapterName, var_8_0[1])

	local var_8_1 = arg_8_0.contextData.map:getMapTitleNumber()

	arg_8_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_8_1, arg_8_0.sceneParent.chapterNoTitle, true)
	var_0_0.super.UpdateView(arg_8_0)
end

function var_0_0.UpdateBonusPtIconPath(arg_9_0)
	arg_9_0.bonusPtIconPath = nil

	local var_9_0 = arg_9_0.data or arg_9_0.contextData.map

	if not var_9_0 then
		return
	end

	local var_9_1 = var_9_0:getConfig("on_activity")

	if not var_9_1 or var_9_1 == 0 then
		return
	end

	local var_9_2 = getProxy(ActivityProxy)
	local var_9_3 = var_9_2:getActivityById(var_9_1)

	if not var_9_3 or var_9_3:isEnd() then
		return
	end

	local var_9_4 = var_9_3:GetConfigClientSetting("PTID")

	if not var_9_4 then
		return
	end

	local var_9_5 = underscore.detect(var_9_2:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_10_0)
		return arg_10_0 and not arg_10_0:isEnd() and arg_10_0:getConfig("config_id") == var_9_4
	end)

	if not var_9_5 then
		return
	end

	local var_9_6 = tonumber(var_9_5:getConfig("config_id"))

	if not var_9_6 then
		return
	end

	arg_9_0.bonusPtIconPath = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_9_6
	}):getIcon()
end

function var_0_0.UpdateMapItems(arg_11_0)
	var_0_0.super.UpdateMapItems(arg_11_0)

	local var_11_0 = arg_11_0.data
	local var_11_1 = var_11_0:GetChapterInProgress()

	if var_11_1 and isa(var_11_1, ChapterStoryGroup) then
		setActive(arg_11_0.itemHolder, false)
		setActive(arg_11_0.storyHolder, true)
		arg_11_0:UpdateStoryGroup()

		return
	end

	setActive(arg_11_0.itemHolder, true)
	setActive(arg_11_0.storyHolder, false)
	arg_11_0:UpdateBonusPtIconPath()

	local var_11_2 = getProxy(ChapterProxy)
	local var_11_3 = {}

	for iter_11_0, iter_11_1 in pairs(var_11_0:getChapters()) do
		if (iter_11_1:isUnlock() or iter_11_1:activeAlways()) and (not iter_11_1:ifNeedHide() or var_11_2:GetJustClearChapters(iter_11_1.id)) then
			table.insert(var_11_3, iter_11_1)
		end
	end

	table.clear(arg_11_0.chapterTFsById)
	UIItemList.StaticAlign(arg_11_0.itemHolder, arg_11_0.chapterTpl, #var_11_3, function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_12_0 = var_11_3[arg_12_1 + 1]

		arg_11_0:UpdateMapItem(arg_12_2, var_12_0)

		arg_12_2.name = "Chapter_" .. var_12_0.id
		arg_11_0.chapterTFsById[var_12_0.id] = arg_12_2
	end)

	local var_11_4 = {}

	for iter_11_2, iter_11_3 in pairs(var_11_3) do
		local var_11_5 = iter_11_3:getConfigTable()

		var_11_4[var_11_5.pos_x] = var_11_4[var_11_5.pos_x] or {}

		local var_11_6 = var_11_4[var_11_5.pos_x]

		var_11_6[var_11_5.pos_y] = var_11_6[var_11_5.pos_y] or {}

		local var_11_7 = var_11_6[var_11_5.pos_y]

		table.insert(var_11_7, iter_11_3)
	end

	for iter_11_4, iter_11_5 in pairs(var_11_4) do
		for iter_11_6, iter_11_7 in pairs(iter_11_5) do
			local var_11_8 = {}

			seriesAsync({
				function(arg_13_0)
					local var_13_0 = 0

					for iter_13_0, iter_13_1 in pairs(iter_11_7) do
						if iter_13_1:ifNeedHide() and var_11_2:GetJustClearChapters(iter_13_1.id) and arg_11_0.chapterTFsById[iter_13_1.id] then
							var_13_0 = var_13_0 + 1

							local var_13_1 = arg_11_0.chapterTFsById[iter_13_1.id]

							setActive(var_13_1, true)
							arg_11_0:PlayChapterItemAnimationBackward(var_13_1, iter_13_1, function()
								var_13_0 = var_13_0 - 1

								setActive(var_13_1, false)
								var_11_2:RecordJustClearChapters(iter_13_1.id, nil)

								if var_13_0 <= 0 then
									arg_13_0()
								end
							end)

							var_11_8[iter_13_1.id] = true
						elseif arg_11_0.chapterTFsById[iter_13_1.id] then
							setActive(arg_11_0.chapterTFsById[iter_13_1.id], false)
						end
					end

					if var_13_0 <= 0 then
						arg_13_0()
					end
				end,
				function(arg_15_0)
					local var_15_0 = 0

					for iter_15_0, iter_15_1 in pairs(iter_11_7) do
						if not var_11_8[iter_15_1.id] then
							var_15_0 = var_15_0 + 1

							setActive(arg_11_0.chapterTFsById[iter_15_1.id], true)
							arg_11_0:PlayChapterItemAnimation(arg_11_0.chapterTFsById[iter_15_1.id], iter_15_1, function()
								var_15_0 = var_15_0 - 1

								if var_15_0 <= 0 then
									arg_15_0()
								end
							end)
						end
					end
				end
			})
		end
	end
end

function var_0_0.UpdateMapItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_2:getConfigTable()

	setAnchoredPosition(arg_17_1, {
		x = arg_17_0.mapWidth * var_17_0.pos_x,
		y = arg_17_0.mapHeight * var_17_0.pos_y
	})

	local var_17_1 = findTF(arg_17_1, "main")

	setActive(var_17_1, true)

	local var_17_2 = findTF(var_17_1, "circle/fordark")
	local var_17_3 = findTF(var_17_1, "info/bk/fordark")

	setActive(var_17_2, var_17_0.icon_outline == 1)
	setActive(var_17_3, var_17_0.icon_outline == 1)

	local var_17_4 = findTF(var_17_1, "circle/clear_flag")
	local var_17_5 = findTF(var_17_1, "circle/progress")
	local var_17_6 = findTF(var_17_1, "circle/progress_text")
	local var_17_7 = findTF(var_17_1, "circle/stars")
	local var_17_8 = string.split(var_17_0.name, "|")

	setText(findTF(var_17_1, "info/bk/title_form/title_index"), var_17_0.chapter_name .. "  ")
	setText(findTF(var_17_1, "info/bk/title_form/title"), var_17_8[1])
	setText(findTF(var_17_1, "info/bk/title_form/title_en"), var_17_8[2] or "")
	setFillAmount(var_17_5, arg_17_2.progress / 100)
	setText(var_17_6, string.format("%d%%", arg_17_2.progress))
	setActive(var_17_7, arg_17_2:existAchieve())

	if arg_17_2:existAchieve() then
		for iter_17_0, iter_17_1 in ipairs(arg_17_2.achieves) do
			local var_17_9 = ChapterConst.IsAchieved(iter_17_1)
			local var_17_10 = var_17_7:Find("star" .. iter_17_0 .. "/light")

			setActive(var_17_10, var_17_9)
		end
	end

	local var_17_11 = not arg_17_2.active and arg_17_2:isClear()

	setActive(var_17_4, var_17_11)
	setActive(var_17_6, not var_17_11)
	arg_17_0:DeleteTween("fighting" .. arg_17_2.id)

	local var_17_12 = findTF(var_17_1, "circle/fighting")

	setText(findTF(var_17_12, "Text"), i18n("tag_level_fighting"))

	local var_17_13 = findTF(var_17_1, "circle/oni")

	setText(findTF(var_17_13, "Text"), i18n("tag_level_oni"))

	local var_17_14 = findTF(var_17_1, "circle/narrative")

	setText(findTF(var_17_14, "Text"), i18n("tag_level_narrative"))
	setActive(var_17_12, false)
	setActive(var_17_13, false)
	setActive(var_17_14, false)

	local var_17_15
	local var_17_16

	if arg_17_2:getConfig("chapter_tag") == 1 then
		var_17_15 = var_17_14
	end

	if arg_17_2.active then
		var_17_15 = arg_17_2:existOni() and var_17_13 or var_17_12
	end

	if var_17_15 then
		setActive(var_17_15, true)

		local var_17_17 = GetOrAddComponent(var_17_15, "CanvasGroup")

		var_17_17.alpha = 1

		arg_17_0:RecordTween("fighting" .. arg_17_2.id, LeanTween.alphaCanvas(var_17_17, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_17_18 = findTF(var_17_1, "triesLimit")

	setActive(var_17_18, false)

	if arg_17_2:isTriesLimit() then
		local var_17_19 = arg_17_2:getConfig("count")
		local var_17_20 = var_17_19 - arg_17_2:getTodayDefeatCount() .. "/" .. var_17_19

		setText(var_17_18:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_17_18:Find("Text"), setColorStr(var_17_20, var_17_19 <= arg_17_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_17_21 = pg.expedition_data_by_map[arg_17_2:getConfig("map")].on_activity
		local var_17_22 = getProxy(ChapterProxy):IsActivitySPChapterActive(var_17_21) and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_17_18:Find("TipRect"), var_17_22)
	end

	local var_17_23 = arg_17_2:GetDailyBonusQuota()
	local var_17_24 = findTF(var_17_1, "mark")
	local var_17_25 = var_17_24:Find("bonus")
	local var_17_26 = var_17_25:Find("icon")
	local var_17_27 = findTF(var_17_25, "icon/Image")

	setActive(var_17_25, var_17_23)
	setActive(var_17_24, var_17_23)

	if var_17_26 then
		setActive(var_17_26, var_17_23 and arg_17_0.bonusPtIconPath)
	end

	if var_17_23 then
		local var_17_28 = var_17_24:GetComponent(typeof(CanvasGroup))
		local var_17_29 = arg_17_2:GetDailyBonusIconName()

		arg_17_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_17_29, var_17_25)

		if var_17_26 and arg_17_0.bonusPtIconPath then
			if var_17_27 then
				GetImageSpriteFromAtlasAsync(arg_17_0.bonusPtIconPath, "", var_17_27, true)
			else
				GetImageSpriteFromAtlasAsync(arg_17_0.bonusPtIconPath, "", var_17_26, true)
			end
		end

		LeanTween.cancel(go(var_17_24), true)

		local var_17_30 = var_17_24.anchoredPosition.y

		var_17_28.alpha = 0

		LeanTween.value(go(var_17_24), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_18_0)
			var_17_28.alpha = arg_18_0

			local var_18_0 = var_17_24.anchoredPosition

			var_18_0.y = var_17_30 * arg_18_0
			var_17_24.anchoredPosition = var_18_0
		end)):setOnComplete(System.Action(function()
			var_17_28.alpha = 1

			local var_19_0 = var_17_24.anchoredPosition

			var_19_0.y = var_17_30
			var_17_24.anchoredPosition = var_19_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_17_31 = arg_17_2.id

	onButton(arg_17_0, var_17_1, function()
		if arg_17_0.chaptersInBackAnimating[var_17_31] then
			return
		end

		local var_20_0 = arg_17_1.localPosition

		arg_17_0:TryOpenChapterInfo(var_17_31, Vector3(var_20_0.x - 10, var_20_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.PlayChapterItemAnimation(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = findTF(arg_21_1, "main")
	local var_21_1 = var_21_0:Find("info")
	local var_21_2 = findTF(var_21_0, "circle")
	local var_21_3 = findTF(var_21_0, "info/bk")

	LeanTween.cancel(go(var_21_2))

	var_21_2.localScale = Vector3.zero

	local var_21_4 = LeanTween.scale(var_21_2, Vector3.one, 0.3):setDelay(0.3)

	arg_21_0:RecordTween(var_21_4.uniqueId)
	LeanTween.cancel(go(var_21_3))
	setAnchoredPosition(var_21_3, {
		x = -1 * var_21_1.rect.width
	})
	shiftPanel(var_21_3, 0, nil, 0.4, 0.4, true, true, nil, function()
		if arg_21_2:isTriesLimit() then
			setActive(findTF(var_21_0, "triesLimit"), true)
		end

		if arg_21_3 then
			arg_21_3()
		end
	end)
end

function var_0_0.PlayChapterItemAnimationBackward(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = findTF(arg_23_1, "main")
	local var_23_1 = var_23_0:Find("info")
	local var_23_2 = findTF(var_23_0, "circle")
	local var_23_3 = findTF(var_23_0, "info/bk")

	LeanTween.cancel(go(var_23_2))

	var_23_2.localScale = Vector3.one

	local var_23_4 = LeanTween.scale(go(var_23_2), Vector3.zero, 0.3):setDelay(0.3)

	arg_23_0:RecordTween(var_23_4.uniqueId)

	arg_23_0.chaptersInBackAnimating[arg_23_2.id] = true

	LeanTween.cancel(go(var_23_3))
	setAnchoredPosition(var_23_3, {
		x = 0
	})
	shiftPanel(var_23_3, -1 * var_23_1.rect.width, nil, 0.4, 0.4, true, true, nil, function()
		arg_23_0.chaptersInBackAnimating[arg_23_2.id] = nil

		if arg_23_3 then
			arg_23_3()
		end
	end)

	if arg_23_2:isTriesLimit() then
		setActive(findTF(var_23_0, "triesLimit"), false)
	end
end

function var_0_0.UpdateChapterTF(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.chapterTFsById[arg_25_1]

	if var_25_0 then
		local var_25_1 = getProxy(ChapterProxy):getChapterById(arg_25_1)

		arg_25_0:UpdateMapItem(var_25_0, var_25_1)
		arg_25_0:PlayChapterItemAnimation(var_25_0, var_25_1)
	end
end

function var_0_0.TryOpenChapter(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.chapterTFsById[arg_26_1]

	if var_26_0 then
		local var_26_1 = var_26_0:Find("main")

		triggerButton(var_26_1)
	end
end

function var_0_0.UpdateStoryGroup(arg_27_0)
	local var_27_0 = arg_27_0.data:GetChapterInProgress():GetChapterStories()

	UIItemList.StaticAlign(arg_27_0.storyHolder, arg_27_0.storyTpl, #var_27_0, function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_28_0 = var_27_0[arg_28_1 + 1]

		arg_27_0:UpdateMapStory(arg_28_2, var_28_0)

		arg_28_2.name = "Chapter_" .. var_28_0:GetName()
	end)
end

function var_0_0.UpdateMapStory(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_2:GetPosition()

	setAnchoredPosition(arg_29_1, {
		x = arg_29_0.mapWidth * var_29_0[1],
		y = arg_29_0.mapHeight * var_29_0[2]
	})
	setText(arg_29_1:Find("Name"), arg_29_2:GetName())

	local var_29_1, var_29_2 = arg_29_2:GetIcon()

	arg_29_0.sceneParent.loader:GetSpriteQuiet(var_29_1, var_29_2, arg_29_1:Find("Icon"), true)

	local var_29_3 = arg_29_2:GetStoryName()

	onButton(arg_29_0, arg_29_1, function()
		pg.NewStoryMgr.GetInstance():Play(var_29_3, function()
			arg_29_0.sceneParent:RefreshMapBG()
			arg_29_0:UpdateMapItems()
		end)
	end, SFX_PANEL)
	setActive(arg_29_1, not pg.NewStoryMgr.GetInstance():IsPlayed(var_29_3))
end

function var_0_0.HideFloat(arg_32_0)
	setActive(arg_32_0.itemHolder, false)
	setActive(arg_32_0.storyHolder, false)
end

function var_0_0.ShowFloat(arg_33_0)
	setActive(arg_33_0.itemHolder, true)
	setActive(arg_33_0.storyHolder, true)
end

return var_0_0
