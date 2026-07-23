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
	[1720001] = "green",
	[1720002] = "yellow",
	[2100592] = "red",
	[2100591] = "blue",
	[1720011] = "blue",
	[1720012] = "red",
	[1720025] = "blue",
	[1720026] = "red",
	[2100582] = "yellow",
	[2100581] = "green"
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

		local var_10_2 = getProxy(ChapterProxy)
		local var_10_3 = tobool(var_10_2:getMapById(var_10_0.id - 1))
		local var_10_4 = tobool(var_10_2:getMapById(var_10_0.id + 1))

		setActive(arg_10_0.buttonDown, var_10_4)
		setActive(arg_10_0.buttonUp, var_10_3)
		LeanTween.cancel(go(arg_10_0.buttonUp), true)
		LeanTween.cancel(go(arg_10_0.buttonDown), true)
	end
end

function var_0_0.UpdateMapItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_2:getConfigTable()

	setLocalPosition(arg_11_1, {
		x = 1920 * var_11_0.pos_x,
		y = 1080 * var_11_0.pos_y
	})

	local var_11_1 = findTF(arg_11_1, "main")

	setActive(var_11_1, true)

	local var_11_2 = findTF(var_11_1, "info/bk/fordark")

	setActive(var_11_2, var_11_0.icon_outline == 1)

	local var_11_3 = findTF(var_11_1, "circle/clear_flag")
	local var_11_4 = findTF(var_11_1, "circle/lock")
	local var_11_5 = not arg_11_2.active and not arg_11_2:isUnlock()
	local var_11_6 = findTF(var_11_1, "circle/progress")
	local var_11_7 = findTF(var_11_1, "circle/progress_text")
	local var_11_8 = findTF(var_11_1, "circle/stars")
	local var_11_9 = string.split(var_11_0.name, "|")
	local var_11_10 = var_0_1[arg_11_0.data:GetConfigID()]

	arg_11_0.loader:GetSpriteQuiet(arg_11_0:GetAtlasPath(), "stage_bar_" .. var_11_10, var_11_1:Find("info/bk"))
	arg_11_0.loader:GetSpriteQuiet(arg_11_0:GetAtlasPath(), "chapter_progress_bg_" .. var_11_10, var_11_1:Find("circle/bk"))
	arg_11_0.loader:GetSpriteQuiet(arg_11_0:GetAtlasPath(), "chapter_progress_circle_" .. var_11_10, var_11_1:Find("circle/progress/Fill/progress"))
	arg_11_0.loader:GetSpriteQuiet(arg_11_0:GetAtlasPath(), "chapter_progress_wave_" .. var_11_10, var_11_1:Find("circle/progress/Mask/Handler/Wave"))
	arg_11_0.loader:GetSpriteQuiet(arg_11_0:GetAtlasPath(), "clear_text_" .. var_11_10, var_11_1:Find("circle/clear_flag"))
	setSlider(var_11_1:Find("circle/progress"), 0, 1, arg_11_2.progress / 100)

	local var_11_11 = var_11_5 and "#737373" or "#FFFFFF"

	setText(findTF(var_11_1, "info/bk/title_form/title_index"), setColorStr(var_11_0.chapter_name .. "  ", var_11_11))
	setText(findTF(var_11_1, "info/bk/title_form/title"), setColorStr(var_11_9[1], var_11_11))
	setText(findTF(var_11_1, "info/bk/title_form/title_en"), setColorStr(var_11_9[2] or "", var_11_11))
	setText(var_11_7, string.format("%d%%", arg_11_2.progress))
	setActive(var_11_8, arg_11_2:existAchieve())

	if arg_11_2:existAchieve() then
		for iter_11_0, iter_11_1 in ipairs(arg_11_2.achieves) do
			local var_11_12 = ChapterConst.IsAchieved(iter_11_1)
			local var_11_13 = var_11_8:Find("star" .. iter_11_0 .. "/light")

			setActive(var_11_13, var_11_12)
		end
	end

	local var_11_14 = not arg_11_2.active and arg_11_2:isClear()

	setActive(var_11_3, var_11_14)
	setActive(var_11_4, var_11_5)
	setActive(var_11_7, not var_11_14 and not var_11_5)
	arg_11_0:DeleteTween("fighting" .. arg_11_2.id)

	local var_11_15 = findTF(var_11_1, "circle/fighting")

	setText(findTF(var_11_15, "Text"), i18n("tag_level_fighting"))

	local var_11_16 = findTF(var_11_1, "circle/oni")

	setText(findTF(var_11_16, "Text"), i18n("tag_level_oni"))

	local var_11_17 = findTF(var_11_1, "circle/narrative")

	setText(findTF(var_11_17, "Text"), i18n("tag_level_narrative"))
	setActive(var_11_15, false)
	setActive(var_11_16, false)
	setActive(var_11_17, false)

	local var_11_18
	local var_11_19

	if arg_11_2:getConfig("chapter_tag") == 1 then
		var_11_18 = var_11_17
	end

	if arg_11_2.active then
		var_11_18 = arg_11_2:existOni() and var_11_16 or var_11_15
	end

	if var_11_18 then
		setActive(var_11_18, true)

		local var_11_20 = GetOrAddComponent(var_11_18, "CanvasGroup")

		var_11_20.alpha = 1

		arg_11_0:RecordTween("fighting" .. arg_11_2.id, LeanTween.alphaCanvas(var_11_20, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_11_21 = findTF(var_11_1, "triesLimit")
	local var_11_22 = arg_11_2:isTriesLimit()

	setActive(var_11_21, var_11_22)

	if var_11_22 then
		local var_11_23 = arg_11_2:getConfig("count")
		local var_11_24 = var_11_23 - arg_11_2:getTodayDefeatCount() .. "/" .. var_11_23

		setText(var_11_21:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_11_21:Find("Text"), setColorStr(var_11_24, var_11_23 <= arg_11_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))
	end

	local var_11_25 = arg_11_2:GetDailyBonusQuota()
	local var_11_26 = findTF(var_11_1, "mark")
	local var_11_27 = var_11_26:Find("bonus")
	local var_11_28 = var_11_27:Find("icon")
	local var_11_29 = findTF(var_11_27, "icon/Image")

	setActive(var_11_27, var_11_25)
	setActive(var_11_26, var_11_25)

	if var_11_28 then
		setActive(var_11_28, var_11_25 and arg_11_0.bonusPtIconPath)
	end

	if var_11_25 then
		local var_11_30 = var_11_26:GetComponent(typeof(CanvasGroup))
		local var_11_31 = arg_11_2:GetDailyBonusIconName()

		arg_11_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_11_31, var_11_27)

		if var_11_28 and arg_11_0.bonusPtIconPath then
			if var_11_29 then
				GetImageSpriteFromAtlasAsync(arg_11_0.bonusPtIconPath, "", var_11_29, true)
			else
				GetImageSpriteFromAtlasAsync(arg_11_0.bonusPtIconPath, "", var_11_28, true)
			end
		end

		LeanTween.cancel(go(var_11_26), true)

		local var_11_32 = var_11_26.anchoredPosition.y

		var_11_30.alpha = 0

		LeanTween.value(go(var_11_26), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_12_0)
			var_11_30.alpha = arg_12_0

			local var_12_0 = var_11_26.anchoredPosition

			var_12_0.y = var_11_32 * arg_12_0
			var_11_26.anchoredPosition = var_12_0
		end)):setOnComplete(System.Action(function()
			var_11_30.alpha = 1

			local var_13_0 = var_11_26.anchoredPosition

			var_13_0.y = var_11_32
			var_11_26.anchoredPosition = var_13_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_11_33 = arg_11_2.id

	onButton(arg_11_0, var_11_1, function()
		if arg_11_0.chaptersInBackAnimating[var_11_33] then
			return
		end

		local var_14_0 = arg_11_1.localPosition

		arg_11_0:TryOpenChapterInfo(var_11_33, Vector3(var_14_0.x - 10, var_14_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.OnDestroy(arg_15_0)
	arg_15_0.loader:Clear()
	var_0_0.super.OnDestroy(arg_15_0)
end

return var_0_0
