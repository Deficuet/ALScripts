local var_0_0 = class("MapBuilderShinano", import(".MapBuilderPermanent"))

function var_0_0.Ctor(arg_1_0, ...)
	var_0_0.super.Ctor(arg_1_0, ...)

	arg_1_0.chapterTFsById = {}
	arg_1_0.chaptersInBackAnimating = {}
end

function var_0_0.GetType(arg_2_0)
	return MapBuilder.TYPESHINANO
end

function var_0_0.getUIName(arg_3_0)
	return "Shinano_levels"
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.tpl = arg_4_0._tf:Find("level_tpl")

	setActive(arg_4_0.tpl, false)

	arg_4_0.itemHolder = arg_4_0._tf:Find("items")

	local var_4_0 = arg_4_0._tf:Find("preloadResources")
	local var_4_1 = var_4_0:Find("mengjing_rumeng")

	setAnchoredPosition(arg_4_0._tf:Find("rumeng"), tf(var_4_1).anchoredPosition)
	setParent(var_4_1, arg_4_0._tf:Find("rumeng"))
	setAnchoredPosition(var_4_1, Vector2.zero)
	arg_4_0:InitTransformMapBtn(arg_4_0._tf:Find("rumeng"), 1, var_4_0:Find("mengjing_rumeng_zhuangchang"))

	local var_4_2 = var_4_0:Find("mengjing_huigui")

	setAnchoredPosition(arg_4_0._tf:Find("huigui"), tf(var_4_2).anchoredPosition)
	setParent(var_4_2, arg_4_0._tf:Find("huigui"))
	setAnchoredPosition(var_4_2, Vector2.zero)
	arg_4_0:InitTransformMapBtn(arg_4_0._tf:Find("huigui"), -1, var_4_0:Find("mengjing_huigui_zhuangchang"))
end

function var_0_0.OnShow(arg_5_0)
	var_0_0.super.OnShow(arg_5_0)
	setActive(arg_5_0.sceneParent.mainLayer:Find("title_chapter_lines"), true)
	setActive(arg_5_0.sceneParent.topChapter:Find("title_chapter"), true)
	setActive(arg_5_0.sceneParent.topChapter:Find("type_skirmish"), true)
end

function var_0_0.OnHide(arg_6_0)
	setActive(arg_6_0.sceneParent.mainLayer:Find("title_chapter_lines"), false)
	setActive(arg_6_0.sceneParent.topChapter:Find("title_chapter"), false)
	setActive(arg_6_0.sceneParent.topChapter:Find("type_skirmish"), false)
	table.clear(arg_6_0.chaptersInBackAnimating)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.chapterTFsById) do
		local var_6_0 = findTF(iter_6_1, "main/info/bk")

		LeanTween.cancel(rtf(var_6_0))
	end

	var_0_0.super.OnHide(arg_6_0)
end

function var_0_0.TrySwitchNextMap(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.contextData.mapIdx + arg_7_1
	local var_7_1 = getProxy(ChapterProxy):getMapById(var_7_0)

	if not var_7_1 then
		return
	end

	if var_7_1:getMapType() == Map.ELITE and not var_7_1:isEliteEnabled() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

		return
	end

	local var_7_2, var_7_3 = var_7_1:isUnlock()

	if not var_7_2 then
		pg.TipsMgr.GetInstance():ShowTips(var_7_3)

		return
	end

	return true
end

function var_0_0.InitTransformMapBtn(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	onButton(arg_8_0, arg_8_1, function()
		if arg_8_0:isfrozen() then
			return
		end

		local var_9_0

		seriesAsync({
			function(arg_10_0)
				if not arg_8_0:TrySwitchNextMap(arg_8_2) then
					return
				end

				pg.CriMgr.GetInstance():StopBGM()
				pg.CriMgr.GetInstance():PlaySE_V3("ui-qiehuan")

				var_9_0 = arg_8_0._tf:Find(arg_8_3.name .. "(Clone)") or Instantiate(arg_8_3)

				setParent(var_9_0, arg_8_0._tf)
				setAnchoredPosition(var_9_0, rtf(arg_8_1).anchoredPosition)

				local var_10_0 = arg_8_0.contextData.mapIdx + arg_8_2
				local var_10_1 = Map.bindConfigTable(Map)[var_10_0]

				if var_10_1 and #var_10_1.bg > 0 then
					GetSpriteFromAtlasAsync("levelmap/" .. var_10_1.bg, "", function(arg_11_0)
						return
					end)
				end

				arg_8_0.sceneParent:frozen()
				LeanTween.delayedCall(go(arg_8_1), 2.3, System.Action(arg_10_0))
			end,
			function(arg_12_0)
				arg_8_0.sceneParent:setMap(arg_8_0.contextData.mapIdx + arg_8_2)
				LeanTween.delayedCall(go(arg_8_1), 0.5, System.Action(arg_12_0))
			end,
			function(arg_13_0)
				if not IsNil(var_9_0) then
					Destroy(var_9_0)
				end

				arg_8_0.sceneParent:unfrozen()
			end
		})
	end)
end

function var_0_0.UpdateView(arg_14_0)
	local var_14_0 = string.split(arg_14_0.contextData.map:getConfig("name"), "||")

	setText(arg_14_0.sceneParent.chapterName, var_14_0[1])

	local var_14_1 = arg_14_0.contextData.map:getMapTitleNumber()

	arg_14_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_14_1, arg_14_0.sceneParent.chapterNoTitle, true)
	var_0_0.super.UpdateView(arg_14_0)
end

function var_0_0.UpdateButtons(arg_15_0)
	var_0_0.super.UpdateButtons(arg_15_0)
	arg_15_0:UpdateCustomButtons()
end

function var_0_0.UpdateBonusPtIconPath(arg_16_0)
	arg_16_0.bonusPtIconPath = nil

	local var_16_0 = arg_16_0.data or arg_16_0.contextData.map

	if not var_16_0 then
		return
	end

	local var_16_1 = var_16_0:getConfig("on_activity")

	if not var_16_1 or var_16_1 == 0 then
		return
	end

	local var_16_2 = getProxy(ActivityProxy):getActivityById(var_16_1)

	if not var_16_2 or var_16_2:isEnd() then
		return
	end

	local var_16_3 = var_16_2:GetConfigClientPTActivity()

	if not var_16_3 then
		return
	end

	arg_16_0.bonusPtIconPath = var_16_3:GetPTDrop():getIcon()
end

function var_0_0.UpdateCustomButtons(arg_17_0)
	local var_17_0 = arg_17_0.contextData.map
	local var_17_1 = var_17_0:getConfig("type") == Map.ACT_EXTRA
	local var_17_2 = arg_17_0._tf:Find("rumeng")
	local var_17_3 = arg_17_0._tf:Find("huigui")

	setActive(var_17_2, false)
	setActive(var_17_3, false)

	if not var_17_1 then
		setActive(arg_17_0.sceneParent.btnPrev, false)
		setActive(arg_17_0.sceneParent.btnNext, false)

		local var_17_4 = getProxy(ChapterProxy):getMapById(var_17_0.id + 1)
		local var_17_5 = getProxy(ChapterProxy):getMapById(var_17_0.id - 1)

		setActive(var_17_2, var_17_4)
		setActive(var_17_3, var_17_5)
		LeanTween.cancel(go(var_17_2), true)
		LeanTween.cancel(go(var_17_3), true)

		if var_17_4 then
			local var_17_6 = tf(var_17_2).localScale
			local var_17_7 = tf(var_17_2):GetChild(0):Find("Quad"):GetComponent(typeof(MeshRenderer)).sharedMaterial
			local var_17_8 = var_17_7:GetColor("_MainColor")
			local var_17_9 = Clone(var_17_8)
			local var_17_10 = LeanTween.value(go(var_17_2), 0, 1, 0.8):setOnUpdate(System.Action_float(function(arg_18_0)
				var_17_9.a = var_17_8.a * arg_18_0

				var_17_7:SetColor("_MainColor", var_17_9)
			end)):setEase(LeanTweenType.easeInCubic):setOnComplete(System.Action(function()
				var_17_7:SetColor("_MainColor", var_17_8)
			end))

			arg_17_0:RecordTween("rumengAlphaTween", var_17_10.id)
		elseif var_17_5 then
			local var_17_11 = tf(var_17_3).localScale
			local var_17_12 = tf(var_17_3):GetChild(0):Find("Quad"):GetComponent(typeof(MeshRenderer)).sharedMaterial
			local var_17_13 = var_17_12:GetColor("_MainColor")
			local var_17_14 = Clone(var_17_13)
			local var_17_15 = LeanTween.value(go(var_17_3), 0, 1, 0.8):setOnUpdate(System.Action_float(function(arg_20_0)
				var_17_14.a = var_17_13.a * arg_20_0

				var_17_12:SetColor("_MainColor", var_17_14)
			end)):setEase(LeanTweenType.easeInCubic):setOnComplete(System.Action(function()
				var_17_12:SetColor("_MainColor", var_17_13)
			end))

			arg_17_0:RecordTween("huiguiAlphaTween", var_17_15.id)
		end
	end
end

function var_0_0.UpdateMapItems(arg_22_0)
	var_0_0.super.UpdateMapItems(arg_22_0)

	local var_22_0 = arg_22_0.data
	local var_22_1 = getProxy(ChapterProxy)

	arg_22_0:UpdateBonusPtIconPath()
	table.clear(arg_22_0.chapterTFsById)

	local var_22_2 = {}

	for iter_22_0, iter_22_1 in pairs(var_22_0:getChapters()) do
		if (iter_22_1:isUnlock() or iter_22_1:activeAlways()) and (not iter_22_1:ifNeedHide() or var_22_1:GetJustClearChapters(iter_22_1.id)) then
			table.insert(var_22_2, iter_22_1)
		end
	end

	UIItemList.StaticAlign(arg_22_0.itemHolder, arg_22_0.tpl, #var_22_2, function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = var_22_2[arg_23_1 + 1]

			arg_22_0:UpdateMapItem(arg_23_2, var_23_0)

			arg_23_2.name = "Chapter_" .. var_23_0.id
			arg_22_0.chapterTFsById[var_23_0.id] = arg_23_2
		end
	end)

	local var_22_3 = {}

	for iter_22_2, iter_22_3 in pairs(var_22_2) do
		local var_22_4 = iter_22_3:getConfigTable()

		var_22_3[var_22_4.pos_x] = var_22_3[var_22_4.pos_x] or {}

		local var_22_5 = var_22_3[var_22_4.pos_x]

		var_22_5[var_22_4.pos_y] = var_22_5[var_22_4.pos_y] or {}

		local var_22_6 = var_22_5[var_22_4.pos_y]

		table.insert(var_22_6, iter_22_3)
	end

	for iter_22_4, iter_22_5 in pairs(var_22_3) do
		for iter_22_6, iter_22_7 in pairs(iter_22_5) do
			local var_22_7 = {}

			seriesAsync({
				function(arg_24_0)
					local var_24_0 = 0

					for iter_24_0, iter_24_1 in pairs(iter_22_7) do
						if iter_24_1:ifNeedHide() and var_22_1:GetJustClearChapters(iter_24_1.id) and arg_22_0.chapterTFsById[iter_24_1.id] then
							var_24_0 = var_24_0 + 1

							local var_24_1 = arg_22_0.chapterTFsById[iter_24_1.id]

							setActive(var_24_1, true)
							arg_22_0:PlayChapterItemAnimationBackward(var_24_1, iter_24_1, function()
								var_24_0 = var_24_0 - 1

								setActive(var_24_1, false)
								var_22_1:RecordJustClearChapters(iter_24_1.id, nil)

								if var_24_0 <= 0 then
									arg_24_0()
								end
							end)

							var_22_7[iter_24_1.id] = true
						elseif arg_22_0.chapterTFsById[iter_24_1.id] then
							setActive(arg_22_0.chapterTFsById[iter_24_1.id], false)
						end
					end

					if var_24_0 <= 0 then
						arg_24_0()
					end
				end,
				function(arg_26_0)
					local var_26_0 = 0

					for iter_26_0, iter_26_1 in pairs(iter_22_7) do
						if not var_22_7[iter_26_1.id] then
							var_26_0 = var_26_0 + 1

							setActive(arg_22_0.chapterTFsById[iter_26_1.id], true)
							arg_22_0:PlayChapterItemAnimation(arg_22_0.chapterTFsById[iter_26_1.id], iter_26_1, function()
								var_26_0 = var_26_0 - 1

								if var_26_0 <= 0 then
									arg_26_0()
								end
							end)
						end
					end
				end
			})
		end
	end
end

function var_0_0.UpdateMapItem(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_2:getConfigTable()

	setLocalPosition(arg_28_1, {
		x = 1920 * var_28_0.pos_x,
		y = 1080 * var_28_0.pos_y
	})

	local var_28_1 = findTF(arg_28_1, "main")

	setActive(var_28_1, true)

	local var_28_2 = findTF(var_28_1, "info/bk/fordark")

	setActive(var_28_2, var_28_0.icon_outline == 1)

	local var_28_3 = findTF(var_28_1, "circle/clear_flag")
	local var_28_4 = findTF(var_28_1, "circle/lock")
	local var_28_5 = not arg_28_2.active and not arg_28_2:isUnlock()
	local var_28_6 = findTF(var_28_1, "circle/progress")
	local var_28_7 = findTF(var_28_1, "circle/progress_text")
	local var_28_8 = findTF(var_28_1, "circle/stars")
	local var_28_9 = string.split(var_28_0.name, "|")
	local var_28_10 = var_28_5 and "#737373" or "#FFFFFF"

	setText(findTF(var_28_1, "info/bk/title_form/title_index"), setColorStr(var_28_0.chapter_name .. "  ", var_28_10))
	setText(findTF(var_28_1, "info/bk/title_form/title"), setColorStr(var_28_9[1], var_28_10))
	setText(findTF(var_28_1, "info/bk/title_form/title_en"), setColorStr(var_28_9[2] or "", var_28_10))
	setFillAmount(var_28_6, arg_28_2.progress / 100)
	setText(var_28_7, string.format("%d%%", arg_28_2.progress))
	setActive(var_28_8, arg_28_2:existAchieve())

	if arg_28_2:existAchieve() then
		for iter_28_0, iter_28_1 in ipairs(arg_28_2.achieves) do
			local var_28_11 = ChapterConst.IsAchieved(iter_28_1)
			local var_28_12 = var_28_8:Find("star" .. iter_28_0 .. "/light")

			setActive(var_28_12, var_28_11)
		end
	end

	local var_28_13 = not arg_28_2.active and arg_28_2:isClear()

	setActive(var_28_3, var_28_13)
	setActive(var_28_4, var_28_5)
	setActive(var_28_7, not var_28_13 and not var_28_5)
	arg_28_0:DeleteTween("fighting" .. arg_28_2.id)

	local var_28_14 = findTF(var_28_1, "circle/fighting")

	setText(findTF(var_28_14, "Text"), i18n("tag_level_fighting"))

	local var_28_15 = findTF(var_28_1, "circle/oni")

	setText(findTF(var_28_15, "Text"), i18n("tag_level_oni"))

	local var_28_16 = findTF(var_28_1, "circle/narrative")

	setText(findTF(var_28_16, "Text"), i18n("tag_level_narrative"))
	setActive(var_28_14, false)
	setActive(var_28_15, false)
	setActive(var_28_16, false)

	local var_28_17
	local var_28_18

	if arg_28_2:getConfig("chapter_tag") == 1 then
		var_28_17 = var_28_16
	end

	if arg_28_2.active then
		var_28_17 = arg_28_2:existOni() and var_28_15 or var_28_14
	end

	if var_28_17 then
		setActive(var_28_17, true)

		local var_28_19 = GetOrAddComponent(var_28_17, "CanvasGroup")

		var_28_19.alpha = 1

		arg_28_0:RecordTween("fighting" .. arg_28_2.id, LeanTween.alphaCanvas(var_28_19, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_28_20 = findTF(var_28_1, "triesLimit")

	setActive(var_28_20, false)

	if arg_28_2:isTriesLimit() then
		local var_28_21 = arg_28_2:getConfig("count")
		local var_28_22 = var_28_21 - arg_28_2:getTodayDefeatCount() .. "/" .. var_28_21

		setText(var_28_20:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_28_20:Find("Text"), setColorStr(var_28_22, var_28_21 <= arg_28_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))
	end

	local var_28_23 = arg_28_2:GetDailyBonusQuota()
	local var_28_24 = findTF(var_28_1, "mark")
	local var_28_25 = var_28_24:Find("bonus")
	local var_28_26 = var_28_25:Find("icon")
	local var_28_27 = findTF(var_28_25, "icon/Image")

	setActive(var_28_25, var_28_23)
	setActive(var_28_24, var_28_23)

	if var_28_26 then
		setActive(var_28_26, var_28_23 and arg_28_0.bonusPtIconPath)
	end

	if var_28_23 then
		local var_28_28 = var_28_24:GetComponent(typeof(CanvasGroup))
		local var_28_29 = arg_28_2:GetDailyBonusIconName()

		arg_28_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_28_29, var_28_25)

		if var_28_26 and arg_28_0.bonusPtIconPath then
			if var_28_27 then
				GetImageSpriteFromAtlasAsync(arg_28_0.bonusPtIconPath, "", var_28_27, true)
			else
				GetImageSpriteFromAtlasAsync(arg_28_0.bonusPtIconPath, "", var_28_26, true)
			end
		end

		LeanTween.cancel(go(var_28_24), true)

		local var_28_30 = var_28_24.anchoredPosition.y

		var_28_28.alpha = 0

		LeanTween.value(go(var_28_24), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_29_0)
			var_28_28.alpha = arg_29_0

			local var_29_0 = var_28_24.anchoredPosition

			var_29_0.y = var_28_30 * arg_29_0
			var_28_24.anchoredPosition = var_29_0
		end)):setOnComplete(System.Action(function()
			var_28_28.alpha = 1

			local var_30_0 = var_28_24.anchoredPosition

			var_30_0.y = var_28_30
			var_28_24.anchoredPosition = var_30_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_28_31 = arg_28_2.id

	onButton(arg_28_0, var_28_1, function()
		if arg_28_0.chaptersInBackAnimating[var_28_31] then
			return
		end

		local var_31_0 = arg_28_1.localPosition

		arg_28_0:TryOpenChapterInfo(var_28_31, Vector3(var_31_0.x - 10, var_31_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.PlayChapterItemAnimation(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = findTF(arg_32_1, "main")
	local var_32_1 = var_32_0:Find("info")
	local var_32_2 = findTF(var_32_0, "circle")
	local var_32_3 = findTF(var_32_0, "info/bk")

	LeanTween.cancel(go(var_32_2))

	var_32_2.localScale = Vector3.zero

	local var_32_4 = LeanTween.scale(var_32_2, Vector3.one, 0.3):setDelay(0.3)

	arg_32_0:RecordTween(var_32_4.uniqueId)
	LeanTween.cancel(go(var_32_3))
	setAnchoredPosition(var_32_3, {
		x = -1 * var_32_1.rect.width
	})
	shiftPanel(var_32_3, 0, nil, 0.4, 0.4, true, true, nil, function()
		if arg_32_2:isTriesLimit() then
			setActive(findTF(var_32_0, "triesLimit"), true)
		end

		if arg_32_3 then
			arg_32_3()
		end
	end)
end

function var_0_0.PlayChapterItemAnimationBackward(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local var_34_0 = findTF(arg_34_1, "main")
	local var_34_1 = var_34_0:Find("info")
	local var_34_2 = findTF(var_34_0, "circle")
	local var_34_3 = findTF(var_34_0, "info/bk")

	LeanTween.cancel(go(var_34_2))

	var_34_2.localScale = Vector3.one

	local var_34_4 = LeanTween.scale(go(var_34_2), Vector3.zero, 0.3):setDelay(0.3)

	arg_34_0:RecordTween(var_34_4.uniqueId)

	arg_34_0.chaptersInBackAnimating[arg_34_2.id] = true

	LeanTween.cancel(go(var_34_3))
	setAnchoredPosition(var_34_3, {
		x = 0
	})
	shiftPanel(var_34_3, -1 * var_34_1.rect.width, nil, 0.4, 0.4, true, true, nil, function()
		arg_34_0.chaptersInBackAnimating[arg_34_2.id] = nil

		if arg_34_3 then
			arg_34_3()
		end
	end)

	if arg_34_2:isTriesLimit() then
		setActive(findTF(var_34_0, "triesLimit"), false)
	end
end

function var_0_0.UpdateChapterTF(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0.chapterTFsById[arg_36_1]

	if var_36_0 then
		local var_36_1 = getProxy(ChapterProxy):getChapterById(arg_36_1)

		arg_36_0:UpdateMapItem(var_36_0, var_36_1)
		arg_36_0:PlayChapterItemAnimation(var_36_0, var_36_1)
	end
end

function var_0_0.TryOpenChapter(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.chapterTFsById[arg_37_1]

	if var_37_0 then
		local var_37_1 = var_37_0:Find("main")

		triggerButton(var_37_1)
	end
end

function var_0_0.HideFloat(arg_38_0)
	setActive(arg_38_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_39_0)
	setActive(arg_39_0.itemHolder, true)
end

return var_0_0
