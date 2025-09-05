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

function var_0_0.UpdateMapItems(arg_9_0)
	var_0_0.super.UpdateMapItems(arg_9_0)

	local var_9_0 = arg_9_0.data
	local var_9_1 = var_9_0:GetChapterInProgress()

	if var_9_1 and isa(var_9_1, ChapterStoryGroup) then
		setActive(arg_9_0.itemHolder, false)
		setActive(arg_9_0.storyHolder, true)
		arg_9_0:UpdateStoryGroup()

		return
	end

	setActive(arg_9_0.itemHolder, true)
	setActive(arg_9_0.storyHolder, false)

	local var_9_2 = getProxy(ChapterProxy)
	local var_9_3 = {}

	for iter_9_0, iter_9_1 in pairs(var_9_0:getChapters()) do
		if (iter_9_1:isUnlock() or iter_9_1:activeAlways()) and (not iter_9_1:ifNeedHide() or var_9_2:GetJustClearChapters(iter_9_1.id)) then
			table.insert(var_9_3, iter_9_1)
		end
	end

	table.clear(arg_9_0.chapterTFsById)
	UIItemList.StaticAlign(arg_9_0.itemHolder, arg_9_0.chapterTpl, #var_9_3, function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_10_0 = var_9_3[arg_10_1 + 1]

		arg_9_0:UpdateMapItem(arg_10_2, var_10_0)

		arg_10_2.name = "Chapter_" .. var_10_0.id
		arg_9_0.chapterTFsById[var_10_0.id] = arg_10_2
	end)

	local var_9_4 = {}

	for iter_9_2, iter_9_3 in pairs(var_9_3) do
		local var_9_5 = iter_9_3:getConfigTable()

		var_9_4[var_9_5.pos_x] = var_9_4[var_9_5.pos_x] or {}

		local var_9_6 = var_9_4[var_9_5.pos_x]

		var_9_6[var_9_5.pos_y] = var_9_6[var_9_5.pos_y] or {}

		local var_9_7 = var_9_6[var_9_5.pos_y]

		table.insert(var_9_7, iter_9_3)
	end

	for iter_9_4, iter_9_5 in pairs(var_9_4) do
		for iter_9_6, iter_9_7 in pairs(iter_9_5) do
			local var_9_8 = {}

			seriesAsync({
				function(arg_11_0)
					local var_11_0 = 0

					for iter_11_0, iter_11_1 in pairs(iter_9_7) do
						if iter_11_1:ifNeedHide() and var_9_2:GetJustClearChapters(iter_11_1.id) and arg_9_0.chapterTFsById[iter_11_1.id] then
							var_11_0 = var_11_0 + 1

							local var_11_1 = arg_9_0.chapterTFsById[iter_11_1.id]

							setActive(var_11_1, true)
							arg_9_0:PlayChapterItemAnimationBackward(var_11_1, iter_11_1, function()
								var_11_0 = var_11_0 - 1

								setActive(var_11_1, false)
								var_9_2:RecordJustClearChapters(iter_11_1.id, nil)

								if var_11_0 <= 0 then
									arg_11_0()
								end
							end)

							var_9_8[iter_11_1.id] = true
						elseif arg_9_0.chapterTFsById[iter_11_1.id] then
							setActive(arg_9_0.chapterTFsById[iter_11_1.id], false)
						end
					end

					if var_11_0 <= 0 then
						arg_11_0()
					end
				end,
				function(arg_13_0)
					local var_13_0 = 0

					for iter_13_0, iter_13_1 in pairs(iter_9_7) do
						if not var_9_8[iter_13_1.id] then
							var_13_0 = var_13_0 + 1

							setActive(arg_9_0.chapterTFsById[iter_13_1.id], true)
							arg_9_0:PlayChapterItemAnimation(arg_9_0.chapterTFsById[iter_13_1.id], iter_13_1, function()
								var_13_0 = var_13_0 - 1

								if var_13_0 <= 0 then
									arg_13_0()
								end
							end)
						end
					end
				end
			})
		end
	end
end

function var_0_0.UpdateMapItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2:getConfigTable()

	setAnchoredPosition(arg_15_1, {
		x = arg_15_0.mapWidth * var_15_0.pos_x,
		y = arg_15_0.mapHeight * var_15_0.pos_y
	})

	local var_15_1 = findTF(arg_15_1, "main")

	setActive(var_15_1, true)

	local var_15_2 = findTF(var_15_1, "circle/fordark")
	local var_15_3 = findTF(var_15_1, "info/bk/fordark")

	setActive(var_15_2, var_15_0.icon_outline == 1)
	setActive(var_15_3, var_15_0.icon_outline == 1)

	local var_15_4 = findTF(var_15_1, "circle/clear_flag")
	local var_15_5 = findTF(var_15_1, "circle/progress")
	local var_15_6 = findTF(var_15_1, "circle/progress_text")
	local var_15_7 = findTF(var_15_1, "circle/stars")
	local var_15_8 = string.split(var_15_0.name, "|")

	setText(findTF(var_15_1, "info/bk/title_form/title_index"), var_15_0.chapter_name .. "  ")
	setText(findTF(var_15_1, "info/bk/title_form/title"), var_15_8[1])
	setText(findTF(var_15_1, "info/bk/title_form/title_en"), var_15_8[2] or "")
	setFillAmount(var_15_5, arg_15_2.progress / 100)
	setText(var_15_6, string.format("%d%%", arg_15_2.progress))
	setActive(var_15_7, arg_15_2:existAchieve())

	if arg_15_2:existAchieve() then
		for iter_15_0, iter_15_1 in ipairs(arg_15_2.achieves) do
			local var_15_9 = ChapterConst.IsAchieved(iter_15_1)
			local var_15_10 = var_15_7:Find("star" .. iter_15_0 .. "/light")

			setActive(var_15_10, var_15_9)
		end
	end

	local var_15_11 = not arg_15_2.active and arg_15_2:isClear()

	setActive(var_15_4, var_15_11)
	setActive(var_15_6, not var_15_11)
	arg_15_0:DeleteTween("fighting" .. arg_15_2.id)

	local var_15_12 = findTF(var_15_1, "circle/fighting")

	setText(findTF(var_15_12, "Text"), i18n("tag_level_fighting"))

	local var_15_13 = findTF(var_15_1, "circle/oni")

	setText(findTF(var_15_13, "Text"), i18n("tag_level_oni"))

	local var_15_14 = findTF(var_15_1, "circle/narrative")

	setText(findTF(var_15_14, "Text"), i18n("tag_level_narrative"))
	setActive(var_15_12, false)
	setActive(var_15_13, false)
	setActive(var_15_14, false)

	local var_15_15
	local var_15_16

	if arg_15_2:getConfig("chapter_tag") == 1 then
		var_15_15 = var_15_14
	end

	if arg_15_2.active then
		var_15_15 = arg_15_2:existOni() and var_15_13 or var_15_12
	end

	if var_15_15 then
		setActive(var_15_15, true)

		local var_15_17 = GetOrAddComponent(var_15_15, "CanvasGroup")

		var_15_17.alpha = 1

		arg_15_0:RecordTween("fighting" .. arg_15_2.id, LeanTween.alphaCanvas(var_15_17, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_15_18 = findTF(var_15_1, "triesLimit")

	setActive(var_15_18, false)

	if arg_15_2:isTriesLimit() then
		local var_15_19 = arg_15_2:getConfig("count")
		local var_15_20 = var_15_19 - arg_15_2:getTodayDefeatCount() .. "/" .. var_15_19

		setText(var_15_18:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_15_18:Find("Text"), setColorStr(var_15_20, var_15_19 <= arg_15_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_15_21 = pg.expedition_data_by_map[arg_15_2:getConfig("map")].on_activity
		local var_15_22 = getProxy(ChapterProxy):IsActivitySPChapterActive(var_15_21) and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_15_18:Find("TipRect"), var_15_22)
	end

	local var_15_23 = arg_15_2:GetDailyBonusQuota()
	local var_15_24 = findTF(var_15_1, "mark")

	setActive(var_15_24:Find("bonus"), var_15_23)
	setActive(var_15_24, var_15_23)

	if var_15_23 then
		local var_15_25 = var_15_24:GetComponent(typeof(CanvasGroup))
		local var_15_26 = arg_15_0.contextData.map:getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

		arg_15_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_15_26, var_15_24:Find("bonus"))
		LeanTween.cancel(go(var_15_24), true)

		local var_15_27 = var_15_24.anchoredPosition.y

		var_15_25.alpha = 0

		LeanTween.value(go(var_15_24), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_16_0)
			var_15_25.alpha = arg_16_0

			local var_16_0 = var_15_24.anchoredPosition

			var_16_0.y = var_15_27 * arg_16_0
			var_15_24.anchoredPosition = var_16_0
		end)):setOnComplete(System.Action(function()
			var_15_25.alpha = 1

			local var_17_0 = var_15_24.anchoredPosition

			var_17_0.y = var_15_27
			var_15_24.anchoredPosition = var_17_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_15_28 = arg_15_2.id

	onButton(arg_15_0, var_15_1, function()
		if arg_15_0.chaptersInBackAnimating[var_15_28] then
			return
		end

		local var_18_0 = arg_15_1.localPosition

		arg_15_0:TryOpenChapterInfo(var_15_28, Vector3(var_18_0.x - 10, var_18_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.PlayChapterItemAnimation(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = findTF(arg_19_1, "main")
	local var_19_1 = var_19_0:Find("info")
	local var_19_2 = findTF(var_19_0, "circle")
	local var_19_3 = findTF(var_19_0, "info/bk")

	LeanTween.cancel(go(var_19_2))

	var_19_2.localScale = Vector3.zero

	local var_19_4 = LeanTween.scale(var_19_2, Vector3.one, 0.3):setDelay(0.3)

	arg_19_0:RecordTween(var_19_4.uniqueId)
	LeanTween.cancel(go(var_19_3))
	setAnchoredPosition(var_19_3, {
		x = -1 * var_19_1.rect.width
	})
	shiftPanel(var_19_3, 0, nil, 0.4, 0.4, true, true, nil, function()
		if arg_19_2:isTriesLimit() then
			setActive(findTF(var_19_0, "triesLimit"), true)
		end

		if arg_19_3 then
			arg_19_3()
		end
	end)
end

function var_0_0.PlayChapterItemAnimationBackward(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = findTF(arg_21_1, "main")
	local var_21_1 = var_21_0:Find("info")
	local var_21_2 = findTF(var_21_0, "circle")
	local var_21_3 = findTF(var_21_0, "info/bk")

	LeanTween.cancel(go(var_21_2))

	var_21_2.localScale = Vector3.one

	local var_21_4 = LeanTween.scale(go(var_21_2), Vector3.zero, 0.3):setDelay(0.3)

	arg_21_0:RecordTween(var_21_4.uniqueId)

	arg_21_0.chaptersInBackAnimating[arg_21_2.id] = true

	LeanTween.cancel(go(var_21_3))
	setAnchoredPosition(var_21_3, {
		x = 0
	})
	shiftPanel(var_21_3, -1 * var_21_1.rect.width, nil, 0.4, 0.4, true, true, nil, function()
		arg_21_0.chaptersInBackAnimating[arg_21_2.id] = nil

		if arg_21_3 then
			arg_21_3()
		end
	end)

	if arg_21_2:isTriesLimit() then
		setActive(findTF(var_21_0, "triesLimit"), false)
	end
end

function var_0_0.UpdateChapterTF(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.chapterTFsById[arg_23_1]

	if var_23_0 then
		local var_23_1 = getProxy(ChapterProxy):getChapterById(arg_23_1)

		arg_23_0:UpdateMapItem(var_23_0, var_23_1)
		arg_23_0:PlayChapterItemAnimation(var_23_0, var_23_1)
	end
end

function var_0_0.TryOpenChapter(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.chapterTFsById[arg_24_1]

	if var_24_0 then
		local var_24_1 = var_24_0:Find("main")

		triggerButton(var_24_1)
	end
end

function var_0_0.UpdateStoryGroup(arg_25_0)
	local var_25_0 = arg_25_0.data:GetChapterInProgress():GetChapterStories()

	UIItemList.StaticAlign(arg_25_0.storyHolder, arg_25_0.storyTpl, #var_25_0, function(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_26_0 = var_25_0[arg_26_1 + 1]

		arg_25_0:UpdateMapStory(arg_26_2, var_26_0)

		arg_26_2.name = "Chapter_" .. var_26_0:GetName()
	end)
end

function var_0_0.UpdateMapStory(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_2:GetPosition()

	setAnchoredPosition(arg_27_1, {
		x = arg_27_0.mapWidth * var_27_0[1],
		y = arg_27_0.mapHeight * var_27_0[2]
	})
	setText(arg_27_1:Find("Name"), arg_27_2:GetName())

	local var_27_1, var_27_2 = arg_27_2:GetIcon()

	arg_27_0.sceneParent.loader:GetSpriteQuiet(var_27_1, var_27_2, arg_27_1:Find("Icon"), true)

	local var_27_3 = arg_27_2:GetStoryName()

	onButton(arg_27_0, arg_27_1, function()
		pg.NewStoryMgr.GetInstance():Play(var_27_3, function()
			arg_27_0.sceneParent:RefreshMapBG()
			arg_27_0:UpdateMapItems()
		end)
	end, SFX_PANEL)
	setActive(arg_27_1, not pg.NewStoryMgr.GetInstance():IsPlayed(var_27_3))
end

function var_0_0.HideFloat(arg_30_0)
	setActive(arg_30_0.itemHolder, false)
	setActive(arg_30_0.storyHolder, false)
end

function var_0_0.ShowFloat(arg_31_0)
	setActive(arg_31_0.itemHolder, true)
	setActive(arg_31_0.storyHolder, true)
end

return var_0_0
