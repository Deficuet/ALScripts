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

	local var_16_2 = getProxy(ActivityProxy)
	local var_16_3 = var_16_2:getActivityById(var_16_1)

	if not var_16_3 or var_16_3:isEnd() then
		return
	end

	local var_16_4 = var_16_3:GetConfigClientSetting("PTID")

	if not var_16_4 then
		return
	end

	local var_16_5 = underscore.detect(var_16_2:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_17_0)
		return arg_17_0 and not arg_17_0:isEnd() and arg_17_0:getConfig("config_id") == var_16_4
	end)

	if not var_16_5 then
		return
	end

	local var_16_6 = tonumber(var_16_5:getConfig("config_id"))

	if not var_16_6 then
		return
	end

	arg_16_0.bonusPtIconPath = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_16_6
	}):getIcon()
end

function var_0_0.UpdateCustomButtons(arg_18_0)
	local var_18_0 = arg_18_0.contextData.map
	local var_18_1 = var_18_0:getConfig("type") == Map.ACT_EXTRA
	local var_18_2 = arg_18_0._tf:Find("rumeng")
	local var_18_3 = arg_18_0._tf:Find("huigui")

	setActive(var_18_2, false)
	setActive(var_18_3, false)

	if not var_18_1 then
		setActive(arg_18_0.sceneParent.btnPrev, false)
		setActive(arg_18_0.sceneParent.btnNext, false)

		local var_18_4 = getProxy(ChapterProxy):getMapById(var_18_0.id + 1)
		local var_18_5 = getProxy(ChapterProxy):getMapById(var_18_0.id - 1)

		setActive(var_18_2, var_18_4)
		setActive(var_18_3, var_18_5)
		LeanTween.cancel(go(var_18_2), true)
		LeanTween.cancel(go(var_18_3), true)

		if var_18_4 then
			local var_18_6 = tf(var_18_2).localScale
			local var_18_7 = tf(var_18_2):GetChild(0):Find("Quad"):GetComponent(typeof(MeshRenderer)).sharedMaterial
			local var_18_8 = var_18_7:GetColor("_MainColor")
			local var_18_9 = Clone(var_18_8)
			local var_18_10 = LeanTween.value(go(var_18_2), 0, 1, 0.8):setOnUpdate(System.Action_float(function(arg_19_0)
				var_18_9.a = var_18_8.a * arg_19_0

				var_18_7:SetColor("_MainColor", var_18_9)
			end)):setEase(LeanTweenType.easeInCubic):setOnComplete(System.Action(function()
				var_18_7:SetColor("_MainColor", var_18_8)
			end))

			arg_18_0:RecordTween("rumengAlphaTween", var_18_10.id)
		elseif var_18_5 then
			local var_18_11 = tf(var_18_3).localScale
			local var_18_12 = tf(var_18_3):GetChild(0):Find("Quad"):GetComponent(typeof(MeshRenderer)).sharedMaterial
			local var_18_13 = var_18_12:GetColor("_MainColor")
			local var_18_14 = Clone(var_18_13)
			local var_18_15 = LeanTween.value(go(var_18_3), 0, 1, 0.8):setOnUpdate(System.Action_float(function(arg_21_0)
				var_18_14.a = var_18_13.a * arg_21_0

				var_18_12:SetColor("_MainColor", var_18_14)
			end)):setEase(LeanTweenType.easeInCubic):setOnComplete(System.Action(function()
				var_18_12:SetColor("_MainColor", var_18_13)
			end))

			arg_18_0:RecordTween("huiguiAlphaTween", var_18_15.id)
		end
	end
end

function var_0_0.UpdateMapItems(arg_23_0)
	var_0_0.super.UpdateMapItems(arg_23_0)

	local var_23_0 = arg_23_0.data
	local var_23_1 = getProxy(ChapterProxy)

	arg_23_0:UpdateBonusPtIconPath()
	table.clear(arg_23_0.chapterTFsById)

	local var_23_2 = {}

	for iter_23_0, iter_23_1 in pairs(var_23_0:getChapters()) do
		if (iter_23_1:isUnlock() or iter_23_1:activeAlways()) and (not iter_23_1:ifNeedHide() or var_23_1:GetJustClearChapters(iter_23_1.id)) then
			table.insert(var_23_2, iter_23_1)
		end
	end

	UIItemList.StaticAlign(arg_23_0.itemHolder, arg_23_0.tpl, #var_23_2, function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == UIItemList.EventUpdate then
			local var_24_0 = var_23_2[arg_24_1 + 1]

			arg_23_0:UpdateMapItem(arg_24_2, var_24_0)

			arg_24_2.name = "Chapter_" .. var_24_0.id
			arg_23_0.chapterTFsById[var_24_0.id] = arg_24_2
		end
	end)

	local var_23_3 = {}

	for iter_23_2, iter_23_3 in pairs(var_23_2) do
		local var_23_4 = iter_23_3:getConfigTable()

		var_23_3[var_23_4.pos_x] = var_23_3[var_23_4.pos_x] or {}

		local var_23_5 = var_23_3[var_23_4.pos_x]

		var_23_5[var_23_4.pos_y] = var_23_5[var_23_4.pos_y] or {}

		local var_23_6 = var_23_5[var_23_4.pos_y]

		table.insert(var_23_6, iter_23_3)
	end

	for iter_23_4, iter_23_5 in pairs(var_23_3) do
		for iter_23_6, iter_23_7 in pairs(iter_23_5) do
			local var_23_7 = {}

			seriesAsync({
				function(arg_25_0)
					local var_25_0 = 0

					for iter_25_0, iter_25_1 in pairs(iter_23_7) do
						if iter_25_1:ifNeedHide() and var_23_1:GetJustClearChapters(iter_25_1.id) and arg_23_0.chapterTFsById[iter_25_1.id] then
							var_25_0 = var_25_0 + 1

							local var_25_1 = arg_23_0.chapterTFsById[iter_25_1.id]

							setActive(var_25_1, true)
							arg_23_0:PlayChapterItemAnimationBackward(var_25_1, iter_25_1, function()
								var_25_0 = var_25_0 - 1

								setActive(var_25_1, false)
								var_23_1:RecordJustClearChapters(iter_25_1.id, nil)

								if var_25_0 <= 0 then
									arg_25_0()
								end
							end)

							var_23_7[iter_25_1.id] = true
						elseif arg_23_0.chapterTFsById[iter_25_1.id] then
							setActive(arg_23_0.chapterTFsById[iter_25_1.id], false)
						end
					end

					if var_25_0 <= 0 then
						arg_25_0()
					end
				end,
				function(arg_27_0)
					local var_27_0 = 0

					for iter_27_0, iter_27_1 in pairs(iter_23_7) do
						if not var_23_7[iter_27_1.id] then
							var_27_0 = var_27_0 + 1

							setActive(arg_23_0.chapterTFsById[iter_27_1.id], true)
							arg_23_0:PlayChapterItemAnimation(arg_23_0.chapterTFsById[iter_27_1.id], iter_27_1, function()
								var_27_0 = var_27_0 - 1

								if var_27_0 <= 0 then
									arg_27_0()
								end
							end)
						end
					end
				end
			})
		end
	end
end

function var_0_0.UpdateMapItem(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_2:getConfigTable()

	setLocalPosition(arg_29_1, {
		x = 1920 * var_29_0.pos_x,
		y = 1080 * var_29_0.pos_y
	})

	local var_29_1 = findTF(arg_29_1, "main")

	setActive(var_29_1, true)

	local var_29_2 = findTF(var_29_1, "info/bk/fordark")

	setActive(var_29_2, var_29_0.icon_outline == 1)

	local var_29_3 = findTF(var_29_1, "circle/clear_flag")
	local var_29_4 = findTF(var_29_1, "circle/lock")
	local var_29_5 = not arg_29_2.active and not arg_29_2:isUnlock()
	local var_29_6 = findTF(var_29_1, "circle/progress")
	local var_29_7 = findTF(var_29_1, "circle/progress_text")
	local var_29_8 = findTF(var_29_1, "circle/stars")
	local var_29_9 = string.split(var_29_0.name, "|")
	local var_29_10 = var_29_5 and "#737373" or "#FFFFFF"

	setText(findTF(var_29_1, "info/bk/title_form/title_index"), setColorStr(var_29_0.chapter_name .. "  ", var_29_10))
	setText(findTF(var_29_1, "info/bk/title_form/title"), setColorStr(var_29_9[1], var_29_10))
	setText(findTF(var_29_1, "info/bk/title_form/title_en"), setColorStr(var_29_9[2] or "", var_29_10))
	setFillAmount(var_29_6, arg_29_2.progress / 100)
	setText(var_29_7, string.format("%d%%", arg_29_2.progress))
	setActive(var_29_8, arg_29_2:existAchieve())

	if arg_29_2:existAchieve() then
		for iter_29_0, iter_29_1 in ipairs(arg_29_2.achieves) do
			local var_29_11 = ChapterConst.IsAchieved(iter_29_1)
			local var_29_12 = var_29_8:Find("star" .. iter_29_0 .. "/light")

			setActive(var_29_12, var_29_11)
		end
	end

	local var_29_13 = not arg_29_2.active and arg_29_2:isClear()

	setActive(var_29_3, var_29_13)
	setActive(var_29_4, var_29_5)
	setActive(var_29_7, not var_29_13 and not var_29_5)
	arg_29_0:DeleteTween("fighting" .. arg_29_2.id)

	local var_29_14 = findTF(var_29_1, "circle/fighting")

	setText(findTF(var_29_14, "Text"), i18n("tag_level_fighting"))

	local var_29_15 = findTF(var_29_1, "circle/oni")

	setText(findTF(var_29_15, "Text"), i18n("tag_level_oni"))

	local var_29_16 = findTF(var_29_1, "circle/narrative")

	setText(findTF(var_29_16, "Text"), i18n("tag_level_narrative"))
	setActive(var_29_14, false)
	setActive(var_29_15, false)
	setActive(var_29_16, false)

	local var_29_17
	local var_29_18

	if arg_29_2:getConfig("chapter_tag") == 1 then
		var_29_17 = var_29_16
	end

	if arg_29_2.active then
		var_29_17 = arg_29_2:existOni() and var_29_15 or var_29_14
	end

	if var_29_17 then
		setActive(var_29_17, true)

		local var_29_19 = GetOrAddComponent(var_29_17, "CanvasGroup")

		var_29_19.alpha = 1

		arg_29_0:RecordTween("fighting" .. arg_29_2.id, LeanTween.alphaCanvas(var_29_19, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_29_20 = findTF(var_29_1, "triesLimit")

	setActive(var_29_20, false)

	if arg_29_2:isTriesLimit() then
		local var_29_21 = arg_29_2:getConfig("count")
		local var_29_22 = var_29_21 - arg_29_2:getTodayDefeatCount() .. "/" .. var_29_21

		setText(var_29_20:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_29_20:Find("Text"), setColorStr(var_29_22, var_29_21 <= arg_29_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))
	end

	local var_29_23 = arg_29_2:GetDailyBonusQuota()
	local var_29_24 = findTF(var_29_1, "mark")
	local var_29_25 = var_29_24:Find("bonus")
	local var_29_26 = var_29_25:Find("icon")
	local var_29_27 = findTF(var_29_25, "icon/Image")

	setActive(var_29_25, var_29_23)
	setActive(var_29_24, var_29_23)

	if var_29_26 then
		setActive(var_29_26, var_29_23 and arg_29_0.bonusPtIconPath)
	end

	if var_29_23 then
		local var_29_28 = var_29_24:GetComponent(typeof(CanvasGroup))
		local var_29_29 = arg_29_2:GetDailyBonusIconName()

		arg_29_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_29_29, var_29_25)

		if var_29_26 and arg_29_0.bonusPtIconPath then
			if var_29_27 then
				GetImageSpriteFromAtlasAsync(arg_29_0.bonusPtIconPath, "", var_29_27, true)
			else
				GetImageSpriteFromAtlasAsync(arg_29_0.bonusPtIconPath, "", var_29_26, true)
			end
		end

		LeanTween.cancel(go(var_29_24), true)

		local var_29_30 = var_29_24.anchoredPosition.y

		var_29_28.alpha = 0

		LeanTween.value(go(var_29_24), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_30_0)
			var_29_28.alpha = arg_30_0

			local var_30_0 = var_29_24.anchoredPosition

			var_30_0.y = var_29_30 * arg_30_0
			var_29_24.anchoredPosition = var_30_0
		end)):setOnComplete(System.Action(function()
			var_29_28.alpha = 1

			local var_31_0 = var_29_24.anchoredPosition

			var_31_0.y = var_29_30
			var_29_24.anchoredPosition = var_31_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_29_31 = arg_29_2.id

	onButton(arg_29_0, var_29_1, function()
		if arg_29_0.chaptersInBackAnimating[var_29_31] then
			return
		end

		local var_32_0 = arg_29_1.localPosition

		arg_29_0:TryOpenChapterInfo(var_29_31, Vector3(var_32_0.x - 10, var_32_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.PlayChapterItemAnimation(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = findTF(arg_33_1, "main")
	local var_33_1 = var_33_0:Find("info")
	local var_33_2 = findTF(var_33_0, "circle")
	local var_33_3 = findTF(var_33_0, "info/bk")

	LeanTween.cancel(go(var_33_2))

	var_33_2.localScale = Vector3.zero

	local var_33_4 = LeanTween.scale(var_33_2, Vector3.one, 0.3):setDelay(0.3)

	arg_33_0:RecordTween(var_33_4.uniqueId)
	LeanTween.cancel(go(var_33_3))
	setAnchoredPosition(var_33_3, {
		x = -1 * var_33_1.rect.width
	})
	shiftPanel(var_33_3, 0, nil, 0.4, 0.4, true, true, nil, function()
		if arg_33_2:isTriesLimit() then
			setActive(findTF(var_33_0, "triesLimit"), true)
		end

		if arg_33_3 then
			arg_33_3()
		end
	end)
end

function var_0_0.PlayChapterItemAnimationBackward(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = findTF(arg_35_1, "main")
	local var_35_1 = var_35_0:Find("info")
	local var_35_2 = findTF(var_35_0, "circle")
	local var_35_3 = findTF(var_35_0, "info/bk")

	LeanTween.cancel(go(var_35_2))

	var_35_2.localScale = Vector3.one

	local var_35_4 = LeanTween.scale(go(var_35_2), Vector3.zero, 0.3):setDelay(0.3)

	arg_35_0:RecordTween(var_35_4.uniqueId)

	arg_35_0.chaptersInBackAnimating[arg_35_2.id] = true

	LeanTween.cancel(go(var_35_3))
	setAnchoredPosition(var_35_3, {
		x = 0
	})
	shiftPanel(var_35_3, -1 * var_35_1.rect.width, nil, 0.4, 0.4, true, true, nil, function()
		arg_35_0.chaptersInBackAnimating[arg_35_2.id] = nil

		if arg_35_3 then
			arg_35_3()
		end
	end)

	if arg_35_2:isTriesLimit() then
		setActive(findTF(var_35_0, "triesLimit"), false)
	end
end

function var_0_0.UpdateChapterTF(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.chapterTFsById[arg_37_1]

	if var_37_0 then
		local var_37_1 = getProxy(ChapterProxy):getChapterById(arg_37_1)

		arg_37_0:UpdateMapItem(var_37_0, var_37_1)
		arg_37_0:PlayChapterItemAnimation(var_37_0, var_37_1)
	end
end

function var_0_0.TryOpenChapter(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0.chapterTFsById[arg_38_1]

	if var_38_0 then
		local var_38_1 = var_38_0:Find("main")

		triggerButton(var_38_1)
	end
end

function var_0_0.HideFloat(arg_39_0)
	setActive(arg_39_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_40_0)
	setActive(arg_40_0.itemHolder, true)
end

return var_0_0
