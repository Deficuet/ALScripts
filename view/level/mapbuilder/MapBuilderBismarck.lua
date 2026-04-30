local var_0_0 = class("MapBuilderBismarck", import(".MapBuilderShinano"))

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPEBISMARCK
end

function var_0_0.getUIName(arg_2_0)
	return "Bismarck_levels"
end

function var_0_0.GetAtlasPath(arg_3_0)
	return "ui/" .. arg_3_0:getUIName() .. "_atlas"
end

local var_0_1 = {
	[1720012] = "red",
	[1720025] = "blue",
	[1720001] = "green",
	[1720026] = "red",
	[1720002] = "yellow",
	[1720011] = "blue"
}

function var_0_0.OnInit(arg_4_0)
	arg_4_0.tpl = arg_4_0._tf:Find("level_tpl")

	setActive(arg_4_0.tpl, false)

	arg_4_0.itemHolder = arg_4_0._tf:Find("items")
	arg_4_0.buttonUp = arg_4_0._tf:Find("up")
	arg_4_0.effectUp = arg_4_0._tf:Find("upEffect")
	arg_4_0.buttonDown = arg_4_0._tf:Find("down")
	arg_4_0.effectDown = arg_4_0._tf:Find("downEffect")

	pg.ViewUtils.SetSortingOrder(arg_4_0.effectUp:Find("zhongzhijiguang_jiasu"), ChapterConst.LayerWeightMap + 1)
	pg.ViewUtils.SetSortingOrder(arg_4_0.effectDown:Find("zhongzhijiguang_jiasu"), ChapterConst.LayerWeightMap + 1)
	arg_4_0:InitTransformMapBtn(arg_4_0.buttonDown, 1, arg_4_0.effectDown)
	arg_4_0:InitTransformMapBtn(arg_4_0.buttonUp, -1, arg_4_0.effectUp)

	arg_4_0.loader = AutoLoader.New()
end

function var_0_0.InitTransformMapBtn(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	onButton(arg_5_0, arg_5_1, function()
		if arg_5_0:isfrozen() then
			return
		end

		seriesAsync({
			function(arg_7_0)
				if not arg_5_0:TrySwitchNextMap(arg_5_2) then
					return
				end

				pg.CriMgr.GetInstance():StopBGM()
				pg.CriMgr.GetInstance():PlaySE_V3("battle-ship-move")
				setActive(arg_5_3, true)
				arg_5_0.sceneParent:frozen()
				LeanTween.delayedCall(go(arg_5_1), 1.8, System.Action(arg_7_0))
			end,
			function(arg_8_0)
				arg_5_0.sceneParent:setMap(arg_5_0.contextData.mapIdx + arg_5_2)
				LeanTween.delayedCall(go(arg_5_1), 0.5, System.Action(arg_8_0))
			end,
			function(arg_9_0)
				arg_5_0.sceneParent:unfrozen()
			end
		})
	end)
end

function var_0_0.UpdateCustomButtons(arg_10_0)
	local var_10_0 = arg_10_0.contextData.map
	local var_10_1 = var_10_0:getConfig("type") == Map.ACT_EXTRA

	setActive(arg_10_0.buttonUp, false)
	setActive(arg_10_0.effectUp, false)
	setActive(arg_10_0.buttonDown, false)
	setActive(arg_10_0.effectDown, false)

	if not var_10_1 then
		setActive(arg_10_0.sceneParent.btnPrev, false)
		setActive(arg_10_0.sceneParent.btnNext, false)

		local var_10_2 = getProxy(ChapterProxy):getMapsByActivities(var_10_0:getConfig("on_activity"))
		local var_10_3 = _.detect(var_10_2, function(arg_11_0)
			return arg_11_0.id == var_10_0.id + 1
		end)
		local var_10_4 = _.detect(var_10_2, function(arg_12_0)
			return arg_12_0.id == var_10_0.id - 1
		end)

		setActive(arg_10_0.buttonDown, var_10_3)
		setActive(arg_10_0.buttonUp, var_10_4)
		LeanTween.cancel(go(arg_10_0.buttonUp), true)
		LeanTween.cancel(go(arg_10_0.buttonDown), true)
	end
end

function var_0_0.UpdateMapItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_2:getConfigTable()

	setAnchoredPosition(arg_13_1, {
		x = arg_13_0.mapWidth * var_13_0.pos_x,
		y = arg_13_0.mapHeight * var_13_0.pos_y
	})

	local var_13_1 = findTF(arg_13_1, "main")

	setActive(var_13_1, true)

	local var_13_2 = findTF(var_13_1, "info/bk/fordark")

	setActive(var_13_2, var_13_0.icon_outline == 1)

	local var_13_3 = findTF(var_13_1, "circle/clear_flag")
	local var_13_4 = findTF(var_13_1, "circle/lock")
	local var_13_5 = not arg_13_2.active and not arg_13_2:isUnlock()
	local var_13_6 = findTF(var_13_1, "circle/progress")
	local var_13_7 = findTF(var_13_1, "circle/progress_text")
	local var_13_8 = findTF(var_13_1, "circle/stars")
	local var_13_9 = string.split(var_13_0.name, "|")
	local var_13_10 = var_0_1[arg_13_0.data:GetConfigID()]

	arg_13_0.loader:GetSpriteQuiet(arg_13_0:GetAtlasPath(), "stage_bar_" .. var_13_10, var_13_1:Find("info/bk"))
	arg_13_0.loader:GetSpriteQuiet(arg_13_0:GetAtlasPath(), "chapter_progress_bg_" .. var_13_10, var_13_1:Find("circle/bk"))
	arg_13_0.loader:GetSpriteQuiet(arg_13_0:GetAtlasPath(), "chapter_progress_circle_" .. var_13_10, var_13_1:Find("circle/progress/Fill/progress"))
	arg_13_0.loader:GetSpriteQuiet(arg_13_0:GetAtlasPath(), "chapter_progress_wave_" .. var_13_10, var_13_1:Find("circle/progress/Mask/Handler/Wave"))
	arg_13_0.loader:GetSpriteQuiet(arg_13_0:GetAtlasPath(), "clear_text_" .. var_13_10, var_13_1:Find("circle/clear_flag"))
	setSlider(var_13_1:Find("circle/progress"), 0, 1, arg_13_2.progress / 100)

	local var_13_11 = var_13_5 and "#737373" or "#FFFFFF"

	setText(findTF(var_13_1, "info/bk/title_form/title_index"), setColorStr(var_13_0.chapter_name .. "  ", var_13_11))
	setText(findTF(var_13_1, "info/bk/title_form/title"), setColorStr(var_13_9[1], var_13_11))
	setText(findTF(var_13_1, "info/bk/title_form/title_en"), setColorStr(var_13_9[2] or "", var_13_11))
	setText(var_13_7, string.format("%d%%", arg_13_2.progress))
	setActive(var_13_8, arg_13_2:existAchieve())

	if arg_13_2:existAchieve() then
		for iter_13_0, iter_13_1 in ipairs(arg_13_2.achieves) do
			local var_13_12 = ChapterConst.IsAchieved(iter_13_1)
			local var_13_13 = var_13_8:Find("star" .. iter_13_0 .. "/light")

			setActive(var_13_13, var_13_12)
		end
	end

	local var_13_14 = not arg_13_2.active and arg_13_2:isClear()

	setActive(var_13_3, var_13_14)
	setActive(var_13_4, var_13_5)
	setActive(var_13_7, not var_13_14 and not var_13_5)
	arg_13_0:DeleteTween("fighting" .. arg_13_2.id)

	local var_13_15 = findTF(var_13_1, "circle/fighting")

	setText(findTF(var_13_15, "Text"), i18n("tag_level_fighting"))

	local var_13_16 = findTF(var_13_1, "circle/oni")

	setText(findTF(var_13_16, "Text"), i18n("tag_level_oni"))

	local var_13_17 = findTF(var_13_1, "circle/narrative")

	setText(findTF(var_13_17, "Text"), i18n("tag_level_narrative"))
	setActive(var_13_15, false)
	setActive(var_13_16, false)
	setActive(var_13_17, false)

	local var_13_18
	local var_13_19

	if arg_13_2:getConfig("chapter_tag") == 1 then
		var_13_18 = var_13_17
	end

	if arg_13_2.active then
		var_13_18 = arg_13_2:existOni() and var_13_16 or var_13_15
	end

	if var_13_18 then
		setActive(var_13_18, true)

		local var_13_20 = GetOrAddComponent(var_13_18, "CanvasGroup")

		var_13_20.alpha = 1

		arg_13_0:RecordTween("fighting" .. arg_13_2.id, LeanTween.alphaCanvas(var_13_20, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_13_21 = findTF(var_13_1, "triesLimit")
	local var_13_22 = arg_13_2:isTriesLimit()

	setActive(var_13_21, var_13_22)

	if var_13_22 then
		local var_13_23 = arg_13_2:getConfig("count")
		local var_13_24 = var_13_23 - arg_13_2:getTodayDefeatCount() .. "/" .. var_13_23

		setText(var_13_21:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_13_21:Find("Text"), setColorStr(var_13_24, var_13_23 <= arg_13_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))
	end

	local var_13_25 = arg_13_2:GetDailyBonusQuota()
	local var_13_26 = findTF(var_13_1, "mark")
	local var_13_27 = var_13_26:Find("bonus")
	local var_13_28 = var_13_27:Find("icon")
	local var_13_29 = findTF(var_13_27, "icon/Image")

	setActive(var_13_27, var_13_25)
	setActive(var_13_26, var_13_25)

	if var_13_28 then
		setActive(var_13_28, var_13_25 and arg_13_0.bonusPtIconPath)
	end

	if var_13_25 then
		local var_13_30 = var_13_26:GetComponent(typeof(CanvasGroup))
		local var_13_31 = arg_13_2:GetDailyBonusIconName()

		arg_13_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_13_31, var_13_27)

		if var_13_28 and arg_13_0.bonusPtIconPath then
			if var_13_29 then
				GetImageSpriteFromAtlasAsync(arg_13_0.bonusPtIconPath, "", var_13_29, true)
			else
				GetImageSpriteFromAtlasAsync(arg_13_0.bonusPtIconPath, "", var_13_28, true)
			end
		end

		LeanTween.cancel(go(var_13_26), true)

		local var_13_32 = var_13_26.anchoredPosition.y

		var_13_30.alpha = 0

		LeanTween.value(go(var_13_26), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_14_0)
			var_13_30.alpha = arg_14_0

			local var_14_0 = var_13_26.anchoredPosition

			var_14_0.y = var_13_32 * arg_14_0
			var_13_26.anchoredPosition = var_14_0
		end)):setOnComplete(System.Action(function()
			var_13_30.alpha = 1

			local var_15_0 = var_13_26.anchoredPosition

			var_15_0.y = var_13_32
			var_13_26.anchoredPosition = var_15_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_13_33 = arg_13_2.id

	onButton(arg_13_0, var_13_1, function()
		if arg_13_0.chaptersInBackAnimating[var_13_33] then
			return
		end

		local var_16_0 = arg_13_1.localPosition

		arg_13_0:TryOpenChapterInfo(var_13_33, Vector3(var_16_0.x - 10, var_16_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.OnDestroy(arg_17_0)
	arg_17_0.loader:Clear()
	var_0_0.super.OnDestroy(arg_17_0)
end

return var_0_0
