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

	local var_9_2 = getProxy(ActivityProxy):getActivityById(var_9_1)

	if not var_9_2 or var_9_2:isEnd() then
		return
	end

	local var_9_3 = var_9_2:GetConfigClientPTActivity()

	if not var_9_3 then
		return
	end

	arg_9_0.bonusPtIconPath = var_9_3:GetPTDrop():getIcon()
end

function var_0_0.UpdateMapItems(arg_10_0)
	var_0_0.super.UpdateMapItems(arg_10_0)

	local var_10_0 = arg_10_0.data
	local var_10_1 = var_10_0:GetChapterInProgress()

	if var_10_1 and isa(var_10_1, ChapterStoryGroup) then
		setActive(arg_10_0.itemHolder, false)
		setActive(arg_10_0.storyHolder, true)
		arg_10_0:UpdateStoryGroup()

		return
	end

	setActive(arg_10_0.itemHolder, true)
	setActive(arg_10_0.storyHolder, false)
	arg_10_0:UpdateBonusPtIconPath()

	local var_10_2 = getProxy(ChapterProxy)
	local var_10_3 = {}

	for iter_10_0, iter_10_1 in pairs(var_10_0:getChapters()) do
		if (iter_10_1:isUnlock() or iter_10_1:activeAlways()) and (not iter_10_1:ifNeedHide() or var_10_2:GetJustClearChapters(iter_10_1.id)) then
			table.insert(var_10_3, iter_10_1)
		end
	end

	table.clear(arg_10_0.chapterTFsById)
	UIItemList.StaticAlign(arg_10_0.itemHolder, arg_10_0.chapterTpl, #var_10_3, function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_11_0 = var_10_3[arg_11_1 + 1]

		arg_10_0:UpdateMapItem(arg_11_2, var_11_0)

		arg_11_2.name = "Chapter_" .. var_11_0.id
		arg_10_0.chapterTFsById[var_11_0.id] = arg_11_2
	end)

	local var_10_4 = {}

	for iter_10_2, iter_10_3 in pairs(var_10_3) do
		local var_10_5 = iter_10_3:getConfigTable()

		var_10_4[var_10_5.pos_x] = var_10_4[var_10_5.pos_x] or {}

		local var_10_6 = var_10_4[var_10_5.pos_x]

		var_10_6[var_10_5.pos_y] = var_10_6[var_10_5.pos_y] or {}

		local var_10_7 = var_10_6[var_10_5.pos_y]

		table.insert(var_10_7, iter_10_3)
	end

	for iter_10_4, iter_10_5 in pairs(var_10_4) do
		for iter_10_6, iter_10_7 in pairs(iter_10_5) do
			local var_10_8 = {}

			seriesAsync({
				function(arg_12_0)
					local var_12_0 = 0

					for iter_12_0, iter_12_1 in pairs(iter_10_7) do
						if iter_12_1:ifNeedHide() and var_10_2:GetJustClearChapters(iter_12_1.id) and arg_10_0.chapterTFsById[iter_12_1.id] then
							var_12_0 = var_12_0 + 1

							local var_12_1 = arg_10_0.chapterTFsById[iter_12_1.id]

							setActive(var_12_1, true)
							arg_10_0:PlayChapterItemAnimationBackward(var_12_1, iter_12_1, function()
								var_12_0 = var_12_0 - 1

								setActive(var_12_1, false)
								var_10_2:RecordJustClearChapters(iter_12_1.id, nil)

								if var_12_0 <= 0 then
									arg_12_0()
								end
							end)

							var_10_8[iter_12_1.id] = true
						elseif arg_10_0.chapterTFsById[iter_12_1.id] then
							setActive(arg_10_0.chapterTFsById[iter_12_1.id], false)
						end
					end

					if var_12_0 <= 0 then
						arg_12_0()
					end
				end,
				function(arg_14_0)
					local var_14_0 = 0

					for iter_14_0, iter_14_1 in pairs(iter_10_7) do
						if not var_10_8[iter_14_1.id] then
							var_14_0 = var_14_0 + 1

							setActive(arg_10_0.chapterTFsById[iter_14_1.id], true)
							arg_10_0:PlayChapterItemAnimation(arg_10_0.chapterTFsById[iter_14_1.id], iter_14_1, function()
								var_14_0 = var_14_0 - 1

								if var_14_0 <= 0 then
									arg_14_0()
								end
							end)
						end
					end
				end
			})
		end
	end
end

function var_0_0.UpdateMapItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_2:getConfigTable()

	setLocalPosition(arg_16_1, {
		x = 1920 * var_16_0.pos_x,
		y = 1080 * var_16_0.pos_y
	})

	local var_16_1 = findTF(arg_16_1, "main")

	setActive(var_16_1, true)

	local var_16_2 = findTF(var_16_1, "circle/fordark")
	local var_16_3 = findTF(var_16_1, "info/bk/fordark")

	setActive(var_16_2, var_16_0.icon_outline == 1)
	setActive(var_16_3, var_16_0.icon_outline == 1)

	local var_16_4 = findTF(var_16_1, "circle/clear_flag")
	local var_16_5 = findTF(var_16_1, "circle/progress")
	local var_16_6 = findTF(var_16_1, "circle/progress_text")
	local var_16_7 = findTF(var_16_1, "circle/stars")
	local var_16_8 = string.split(var_16_0.name, "|")

	setText(findTF(var_16_1, "info/bk/title_form/title_index"), var_16_0.chapter_name .. "  ")
	setText(findTF(var_16_1, "info/bk/title_form/title"), var_16_8[1])
	setText(findTF(var_16_1, "info/bk/title_form/title_en"), var_16_8[2] or "")
	setFillAmount(var_16_5, arg_16_2.progress / 100)
	setText(var_16_6, string.format("%d%%", arg_16_2.progress))
	setActive(var_16_7, arg_16_2:existAchieve())

	if arg_16_2:existAchieve() then
		for iter_16_0, iter_16_1 in ipairs(arg_16_2.achieves) do
			local var_16_9 = ChapterConst.IsAchieved(iter_16_1)
			local var_16_10 = var_16_7:Find("star" .. iter_16_0 .. "/light")

			setActive(var_16_10, var_16_9)
		end
	end

	local var_16_11 = not arg_16_2.active and arg_16_2:isClear()

	setActive(var_16_4, var_16_11)
	setActive(var_16_6, not var_16_11)
	arg_16_0:DeleteTween("fighting" .. arg_16_2.id)

	local var_16_12 = findTF(var_16_1, "circle/fighting")

	setText(findTF(var_16_12, "Text"), i18n("tag_level_fighting"))

	local var_16_13 = findTF(var_16_1, "circle/oni")

	setText(findTF(var_16_13, "Text"), i18n("tag_level_oni"))

	local var_16_14 = findTF(var_16_1, "circle/narrative")

	setText(findTF(var_16_14, "Text"), i18n("tag_level_narrative"))

	local var_16_15 = findTF(var_16_1, "circle/auto")

	setText(findTF(var_16_15, "Text"), i18n("tag_level_autoing"))
	setActive(var_16_12, false)
	setActive(var_16_13, false)
	setActive(var_16_14, false)
	setActive(var_16_15, false)

	local var_16_16
	local var_16_17

	if arg_16_2:getConfig("chapter_tag") == 1 then
		var_16_16 = var_16_14
	end

	if arg_16_2.active then
		var_16_16 = arg_16_2:existOni() and var_16_13 or var_16_12
	end

	local var_16_18 = getProxy(ChapterProxy):GetAutoChapterId()

	if var_16_18 and var_16_18 == arg_16_2.id then
		var_16_16 = var_16_15

		local var_16_19, var_16_20 = getProxy(ChapterAutoProxy):GetCntInfo()

		setText(findTF(var_16_15, "Text"), var_16_19 < var_16_20 and i18n("tag_level_autoing") or i18n("tag_level_auto_finish"))
	end

	if var_16_16 then
		setActive(var_16_16, true)

		local var_16_21 = GetOrAddComponent(var_16_16, "CanvasGroup")

		var_16_21.alpha = 1

		arg_16_0:RecordTween("fighting" .. arg_16_2.id, LeanTween.alphaCanvas(var_16_21, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_16_22 = findTF(var_16_1, "triesLimit")

	setActive(var_16_22, false)

	if arg_16_2:isTriesLimit() then
		local var_16_23 = arg_16_2:getConfig("count")
		local var_16_24 = var_16_23 - arg_16_2:getTodayDefeatCount() .. "/" .. var_16_23

		setText(var_16_22:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_16_22:Find("Text"), setColorStr(var_16_24, var_16_23 <= arg_16_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_16_25 = pg.expedition_data_by_map[arg_16_2:getConfig("map")].on_activity
		local var_16_26 = getProxy(ChapterProxy):IsActivitySPChapterActive(var_16_25) and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_16_22:Find("TipRect"), var_16_26)
	end

	local var_16_27 = arg_16_2:GetDailyBonusQuota()
	local var_16_28 = findTF(var_16_1, "mark")
	local var_16_29 = var_16_28:Find("bonus")
	local var_16_30 = var_16_29:Find("icon")
	local var_16_31 = findTF(var_16_29, "icon/Image")

	setActive(var_16_29, var_16_27)
	setActive(var_16_28, var_16_27)

	if var_16_30 then
		setActive(var_16_30, var_16_27 and arg_16_0.bonusPtIconPath)
	end

	if var_16_27 then
		local var_16_32 = var_16_28:GetComponent(typeof(CanvasGroup))
		local var_16_33 = arg_16_2:GetDailyBonusIconName()

		arg_16_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_16_33, var_16_29)

		if var_16_30 and arg_16_0.bonusPtIconPath then
			if var_16_31 then
				GetImageSpriteFromAtlasAsync(arg_16_0.bonusPtIconPath, "", var_16_31, true)
			else
				GetImageSpriteFromAtlasAsync(arg_16_0.bonusPtIconPath, "", var_16_30, true)
			end
		end

		LeanTween.cancel(go(var_16_28), true)

		local var_16_34 = var_16_28.anchoredPosition.y

		var_16_32.alpha = 0

		LeanTween.value(go(var_16_28), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_17_0)
			var_16_32.alpha = arg_17_0

			local var_17_0 = var_16_28.anchoredPosition

			var_17_0.y = var_16_34 * arg_17_0
			var_16_28.anchoredPosition = var_17_0
		end)):setOnComplete(System.Action(function()
			var_16_32.alpha = 1

			local var_18_0 = var_16_28.anchoredPosition

			var_18_0.y = var_16_34
			var_16_28.anchoredPosition = var_18_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_16_35 = arg_16_2.id

	onButton(arg_16_0, var_16_1, function()
		if arg_16_0.chaptersInBackAnimating[var_16_35] then
			return
		end

		local var_19_0 = arg_16_1.localPosition

		arg_16_0:TryOpenChapterInfo(var_16_35, Vector3(var_19_0.x - 10, var_19_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.PlayChapterItemAnimation(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = findTF(arg_20_1, "main")
	local var_20_1 = var_20_0:Find("info")
	local var_20_2 = findTF(var_20_0, "circle")
	local var_20_3 = findTF(var_20_0, "info/bk")

	LeanTween.cancel(go(var_20_2))

	var_20_2.localScale = Vector3.zero

	local var_20_4 = LeanTween.scale(var_20_2, Vector3.one, 0.3):setDelay(0.3)

	arg_20_0:RecordTween(var_20_4.uniqueId)
	LeanTween.cancel(go(var_20_3))
	setAnchoredPosition(var_20_3, {
		x = -1 * var_20_1.rect.width
	})
	shiftPanel(var_20_3, 0, nil, 0.4, 0.4, true, true, nil, function()
		if arg_20_2:isTriesLimit() then
			setActive(findTF(var_20_0, "triesLimit"), true)
		end

		if arg_20_3 then
			arg_20_3()
		end
	end)
end

function var_0_0.PlayChapterItemAnimationBackward(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = findTF(arg_22_1, "main")
	local var_22_1 = var_22_0:Find("info")
	local var_22_2 = findTF(var_22_0, "circle")
	local var_22_3 = findTF(var_22_0, "info/bk")

	LeanTween.cancel(go(var_22_2))

	var_22_2.localScale = Vector3.one

	local var_22_4 = LeanTween.scale(go(var_22_2), Vector3.zero, 0.3):setDelay(0.3)

	arg_22_0:RecordTween(var_22_4.uniqueId)

	arg_22_0.chaptersInBackAnimating[arg_22_2.id] = true

	LeanTween.cancel(go(var_22_3))
	setAnchoredPosition(var_22_3, {
		x = 0
	})
	shiftPanel(var_22_3, -1 * var_22_1.rect.width, nil, 0.4, 0.4, true, true, nil, function()
		arg_22_0.chaptersInBackAnimating[arg_22_2.id] = nil

		if arg_22_3 then
			arg_22_3()
		end
	end)

	if arg_22_2:isTriesLimit() then
		setActive(findTF(var_22_0, "triesLimit"), false)
	end
end

function var_0_0.UpdateChapterTF(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.chapterTFsById[arg_24_1]

	if var_24_0 then
		local var_24_1 = getProxy(ChapterProxy):getChapterById(arg_24_1)

		arg_24_0:UpdateMapItem(var_24_0, var_24_1)
		arg_24_0:PlayChapterItemAnimation(var_24_0, var_24_1)
	end
end

function var_0_0.TryOpenChapter(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.chapterTFsById[arg_25_1]

	if var_25_0 then
		local var_25_1 = var_25_0:Find("main")

		triggerButton(var_25_1)
	end
end

function var_0_0.UpdateStoryGroup(arg_26_0)
	local var_26_0 = arg_26_0.data:GetChapterInProgress():GetChapterStories()

	UIItemList.StaticAlign(arg_26_0.storyHolder, arg_26_0.storyTpl, #var_26_0, function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_27_0 = var_26_0[arg_27_1 + 1]

		arg_26_0:UpdateMapStory(arg_27_2, var_27_0)

		arg_27_2.name = "Chapter_" .. var_27_0:GetName()
	end)
end

function var_0_0.UpdateMapStory(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_2:GetPosition()

	setAnchoredPosition(arg_28_1, {
		x = arg_28_0.mapWidth * var_28_0[1],
		y = arg_28_0.mapHeight * var_28_0[2]
	})
	setText(arg_28_1:Find("Name"), arg_28_2:GetName())

	local var_28_1, var_28_2 = arg_28_2:GetIcon()

	arg_28_0.sceneParent.loader:GetSpriteQuiet(var_28_1, var_28_2, arg_28_1:Find("Icon"), true)

	local var_28_3 = arg_28_2:GetStoryName()

	onButton(arg_28_0, arg_28_1, function()
		pg.NewStoryMgr.GetInstance():Play(var_28_3, function()
			arg_28_0.sceneParent:RefreshMapBG()
			arg_28_0:UpdateMapItems()
		end)
	end, SFX_PANEL)
	setActive(arg_28_1, not pg.NewStoryMgr.GetInstance():IsPlayed(var_28_3))
end

function var_0_0.HideFloat(arg_31_0)
	setActive(arg_31_0.itemHolder, false)
	setActive(arg_31_0.storyHolder, false)
end

function var_0_0.ShowFloat(arg_32_0)
	setActive(arg_32_0.itemHolder, true)
	setActive(arg_32_0.storyHolder, true)
end

return var_0_0
