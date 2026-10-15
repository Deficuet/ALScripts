local var_0_0 = class("LevelInfoView", import("..base.BaseSubView"))

var_0_0.CHAPTER_GUIDE_NAME = "CHAPTER_AUTO_GUIDE"

function var_0_0.getUIName(arg_1_0)
	return "LevelStageInfoView"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/levelstageinfoview_atlas",
		"passstate"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.getLevelInfoViewResList(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = arg_3_1 and arg_3_1:getConfigTable()

	if var_3_1 and var_3_1.icon and var_3_1.icon[1] then
		local var_3_2 = string.format(ResPathSupport.ConstPath.SpineQIcon.Base, var_3_1.icon[1], "")

		table.insert(var_3_0, var_3_2)
	end

	arg_3_0:insertLevelInfoViewDropResList(var_3_0, arg_3_1)

	return var_3_0
end

function var_0_0.insertLevelInfoViewDropResList(arg_4_0, arg_4_1, arg_4_2)
	if not arg_4_2 then
		return
	end

	local var_4_0 = var_0_0.getChapterAwards(arg_4_2)

	_.each(var_4_0, function(arg_5_0)
		local var_5_0 = Drop.Create(arg_5_0):getIcon()

		if noEmptyStr(var_5_0) then
			table.insert(arg_4_1, var_5_0)
		end
	end)
end

function var_0_0.downloadLevelInfoViewResList(arg_6_0, arg_6_1, arg_6_2)
	SplitPackConst.DownloadByLuaArr(arg_6_0:getLevelInfoViewResList(arg_6_1), function()
		if arg_6_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_6_2()
	end)
end

function var_0_0.OnInit(arg_8_0)
	arg_8_0.loader = AutoLoader.New()

	arg_8_0:InitUI()
end

function var_0_0.OnDestroy(arg_9_0)
	if arg_9_0:isShowing() then
		arg_9_0:Hide()
	end

	arg_9_0.onConfirm = nil
	arg_9_0.onCancel = nil

	if arg_9_0.LTid then
		LeanTween.cancel(arg_9_0.LTid)

		arg_9_0.LTid = nil
	end

	arg_9_0.loader:Clear()
end

function var_0_0.Show(arg_10_0)
	setActive(arg_10_0._tf, true)
	arg_10_0:BlurPanel(arg_10_0._tf)
	arg_10_0:CheckGuide()
end

function var_0_0.CheckGuide(arg_11_0)
	local var_11_0 = ChapterAutoProxy.IsSystemOpen()
	local var_11_1 = pg.chapter_auto_statistics[arg_11_0.chapter.id]

	if not var_11_0 or not var_11_1 or pg.NewStoryMgr.GetInstance():IsPlayed(var_0_0.CHAPTER_GUIDE_NAME) then
		return
	end

	onNextTick(function()
		if arg_11_0._state == var_0_0.STATES.DESTROY or not arg_11_0:isShowing() then
			return
		end

		if not pg.NewStoryMgr.GetInstance():IsPlayed(var_0_0.CHAPTER_GUIDE_NAME) then
			pg.NewGuideMgr.GetInstance():Play(var_0_0.CHAPTER_GUIDE_NAME)
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = var_0_0.CHAPTER_GUIDE_NAME
			})
		end
	end)
end

function var_0_0.Hide(arg_13_0)
	arg_13_0:clear()
	setActive(arg_13_0._tf, false)
	arg_13_0:UnOverlayPanel(arg_13_0._tf, arg_13_0._parentTf)
end

function var_0_0.setCBFunc(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.onConfirm = arg_14_1
	arg_14_0.onCancel = arg_14_2
end

function var_0_0.InitUI(arg_15_0)
	arg_15_0.titleBG = arg_15_0._tf:Find("panel/title")
	arg_15_0.titleBGDecoration = arg_15_0._tf:Find("panel/title/Image")
	arg_15_0.titleIcon = arg_15_0._tf:Find("panel/title/icon")
	arg_15_0.txTitle = arg_15_0._tf:Find("panel/title_form")
	arg_15_0.txTitleOriginPosY = arg_15_0.txTitle.anchoredPosition.y
	arg_15_0.txTitleHead = arg_15_0._tf:Find("panel/title_head")

	setActive(arg_15_0.txTitleHead, false)

	arg_15_0.txIntro = arg_15_0._tf:Find("panel/intro")
	arg_15_0.txCost = arg_15_0._tf:Find("panel/cost/text")
	arg_15_0.progressBar = arg_15_0._tf:Find("panel/progress")
	arg_15_0.txProgress = arg_15_0._tf:Find("panel/progress/Text/value")
	arg_15_0.progress = arg_15_0._tf:Find("panel/progress")
	arg_15_0.head = arg_15_0._tf:Find("panel/head/Image")
	arg_15_0.trAchieveTpl = arg_15_0._tf:Find("panel/achieve")
	arg_15_0.trAchieves = arg_15_0._tf:Find("panel/achieves")
	arg_15_0.passStateMask = arg_15_0._tf:Find("panel/passState")
	arg_15_0.passState = arg_15_0._tf:Find("panel/passState/Image")

	setActive(arg_15_0.passState, true)

	arg_15_0.winCondDesc = arg_15_0._tf:Find("panel/win_conditions/desc")
	arg_15_0.winCondAwardBtn = arg_15_0._tf:Find("panel/win_conditions/icon")
	arg_15_0.loseCondDesc = arg_15_0._tf:Find("panel/lose_conditions/desc")
	arg_15_0.achieveList = UIItemList.New(arg_15_0.trAchieves, arg_15_0.trAchieveTpl)

	setActive(arg_15_0.trAchieveTpl, false)

	arg_15_0.trDropTpl = arg_15_0._tf:Find("panel/drops/frame/list/item")
	arg_15_0.trDrops = arg_15_0._tf:Find("panel/drops/frame/list")
	arg_15_0.dropList = UIItemList.New(arg_15_0.trDrops, arg_15_0.trDropTpl)

	arg_15_0.dropList:make(function(arg_16_0, arg_16_1, arg_16_2)
		arg_15_0:updateDrop(arg_16_0, arg_16_1, arg_16_2)
	end)
	setActive(arg_15_0.trDropTpl, false)

	arg_15_0.btnAuto = arg_15_0._tf:Find("panel/auto_button")
	arg_15_0.btnConfirm = arg_15_0._tf:Find("panel/start_button")
	arg_15_0.btnConfirm_l = arg_15_0._tf:Find("panel/start_button_l")
	arg_15_0.btnCancel = arg_15_0._tf:Find("panel/btnBack")
	arg_15_0.quickPlayGroup = arg_15_0._tf:Find("panel/quickPlay")
	arg_15_0.descQuickPlay = arg_15_0.quickPlayGroup:Find("desc")
	arg_15_0.toggleQuickPlay = arg_15_0.quickPlayGroup:GetComponent(typeof(Toggle))
	arg_15_0.bottomExtra = arg_15_0._tf:Find("panel/BottomExtra")
	arg_15_0.layoutView = GetComponent(arg_15_0.bottomExtra:Find("LoopGroup/view"), typeof(LayoutElement))
	arg_15_0.rtViewContainer = arg_15_0.bottomExtra:Find("LoopGroup/view/container")

	setText(arg_15_0.bottomExtra:Find("LoopGroup/Loop/Text"), i18n("autofight_farm"))

	arg_15_0.loopToggle = arg_15_0.bottomExtra:Find("LoopGroup/Loop/Toggle")
	arg_15_0.loopOn = arg_15_0.loopToggle:Find("on")
	arg_15_0.loopOff = arg_15_0.loopToggle:Find("off")
	arg_15_0.loopHelp = arg_15_0.bottomExtra:Find("ButtonHelp")
	arg_15_0.costLimitTip = arg_15_0.bottomExtra:Find("LoopGroup/view/container/CostLimit")

	setActive(arg_15_0.costLimitTip, false)

	arg_15_0.autoFightToggle = arg_15_0.bottomExtra:Find("LoopGroup/view/container/AutoFight")

	setText(arg_15_0.autoFightToggle:Find("Text"), i18n("autofight"))

	arg_15_0.delayTween = {}
	arg_15_0.doEaseIn = true
end

local var_0_1 = 525
local var_0_2 = 373

function var_0_0.set(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = getProxy(ChapterProxy):getChapterById(arg_17_1, true)

	arg_17_0:downloadLevelInfoViewResList(var_17_0, function()
		arg_17_0:setAfterResDownload(arg_17_1, arg_17_2, var_17_0)
	end)
end

function var_0_0.setAfterResDownload(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0:cancelTween()

	arg_19_0.chapter = arg_19_3
	arg_19_0.posStart = arg_19_2 or Vector3(0, 0, 0)

	local var_19_0 = getProxy(ChapterProxy):getMapById(arg_19_3:getConfig("map"))
	local var_19_1 = arg_19_3:getConfigTable()
	local var_19_2 = string.split(var_19_1.name, "|")
	local var_19_3 = arg_19_3:getPlayType() == ChapterConst.TypeDefence

	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_19_3 and "title_print_defense" or "title_print", function(arg_20_0)
		if not IsNil(arg_19_0.titleBGDecoration) then
			arg_19_0.titleBGDecoration:GetComponent(typeof(Image)).sprite = arg_20_0
		end
	end)
	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_19_3 and "titlebar_bg_defense" or "titlebar_bg", function(arg_21_0)
		if not IsNil(arg_19_0.titleBG) then
			arg_19_0.titleBG:GetComponent(typeof(Image)).sprite = arg_21_0
		end
	end)
	setActive(arg_19_0.titleIcon, var_19_3)

	local var_19_4 = arg_19_0.progressBar.sizeDelta

	var_19_4.x = var_19_3 and var_0_2 or var_0_1
	arg_19_0.progressBar.sizeDelta = var_19_4

	setText(arg_19_0.txTitle:Find("title_index"), var_19_1.chapter_name .. "  ")
	setText(arg_19_0.txTitle:Find("title"), var_19_2[1])
	setText(arg_19_0.txTitle:Find("title_en"), var_19_2[2] or "")
	setActive(arg_19_0.txTitleHead, var_19_2[3] and #var_19_2[3] > 0)

	local var_19_5 = var_19_2[3] and #var_19_2[3] > 0 and arg_19_0.txTitleOriginPosY or arg_19_0.txTitleOriginPosY + 8

	setAnchoredPosition(arg_19_0.txTitle, {
		y = var_19_5
	})
	setText(arg_19_0.txTitleHead, var_19_2[3] or "")
	setText(arg_19_0.winCondDesc, i18n("text_win_condition") .. "：" .. i18n(arg_19_3:getConfig("win_condition_display")))
	setText(arg_19_0.loseCondDesc, i18n("text_lose_condition") .. "：" .. i18n(arg_19_3:getConfig("lose_condition_display")))
	setActive(arg_19_0.winCondAwardBtn, arg_19_3:getPlayType() == ChapterConst.TypeDefence)

	if not arg_19_3:existAchieve() then
		setActive(arg_19_0.passState, false)
		setActive(arg_19_0.progress, false)
		setActive(arg_19_0.trAchieves, false)
	else
		setActive(arg_19_0.passState, true)
		setActive(arg_19_0.progress, true)
		setActive(arg_19_0.trAchieves, true)

		arg_19_0.passState.localPosition = Vector3(-arg_19_0.passState.rect.width, 0, 0)

		local var_19_6 = arg_19_3:hasMitigation()

		setActive(arg_19_0.passState, var_19_6)

		if var_19_6 then
			local var_19_7 = arg_19_3:getRiskLevel()

			setImageSprite(arg_19_0.passState, GetSpriteFromAtlas("passstate", var_19_7), true)
		end

		setWidgetText(arg_19_0.progress, i18n("levelScene_threat_to_rule_out", ": "))
		table.insert(arg_19_0.delayTween, LeanTween.value(go(arg_19_0.progress), 0, arg_19_3.progress, 0.5):setDelay(0.15):setOnUpdate(System.Action_float(function(arg_22_0)
			setSlider(arg_19_0.progress, 0, 100, arg_22_0)
			setText(arg_19_0.txProgress, math.floor(arg_22_0) .. "%")
		end)).uniqueId)
		arg_19_0.achieveList:align(#arg_19_3.achieves)
		arg_19_0.achieveList:each(function(arg_23_0, arg_23_1)
			local var_23_0 = arg_19_3.achieves[arg_23_0 + 1]
			local var_23_1 = findTF(arg_23_1, "desc")

			setText(var_23_1, ChapterConst.GetAchieveDesc(var_23_0.type, arg_19_3))
			setTextColor(var_23_1, Color.white)
			setActive(findTF(arg_23_1, "star"), false)
			setActive(findTF(arg_23_1, "star_empty"), true)

			local var_23_2 = ChapterConst.IsAchieved(var_23_0)

			table.insert(arg_19_0.delayTween, LeanTween.delayedCall(0.15 + (arg_23_0 + 1) * 0.15, System.Action(function()
				if not IsNil(arg_23_1) then
					local var_24_0 = findTF(arg_23_1, "desc")

					setTextColor(var_24_0, var_23_2 and Color.yellow or Color.white)
					setActive(findTF(arg_23_1, "star"), var_23_2)
					setActive(findTF(arg_23_1, "star_empty"), not var_23_2)
				end
			end)).uniqueId)
		end)
	end

	setText(arg_19_0.txIntro, var_19_1.profiles)
	setText(arg_19_0.txCost, var_19_1.oil)

	if var_19_1.icon and var_19_1.icon[1] then
		setActive(arg_19_0.head.parent, true)
		setImageSprite(arg_19_0.head, LoadSprite("qicon/" .. var_19_1.icon[1]))
	else
		setActive(arg_19_0.head.parent, false)
	end

	arg_19_0.awards = var_0_0.getChapterAwards(arg_19_0.chapter)

	arg_19_0.dropList:align(#arg_19_0.awards)

	local var_19_8 = arg_19_3:existLoop()

	setActive(arg_19_0.bottomExtra, var_19_8)

	if var_19_8 then
		local var_19_9 = arg_19_3:canActivateLoop()
		local var_19_10 = "chapter_loop_flag_" .. arg_19_3.id
		local var_19_11 = PlayerPrefs.GetInt(var_19_10, -1)
		local var_19_12 = (var_19_11 == 1 or var_19_11 == -1) and var_19_9
		local var_19_13 = #arg_19_3:getConfig("use_oil_limit") > 0

		setActive(arg_19_0.loopOn, var_19_12)
		setActive(arg_19_0.loopOff, not var_19_12)
		setActive(arg_19_0.costLimitTip, var_19_13)
		onNextTick(function()
			Canvas.ForceUpdateCanvases()

			arg_19_0.layoutView.preferredWidth = var_19_12 and arg_19_0.rtViewContainer.rect.width or 0
		end)
		onButton(arg_19_0, arg_19_0.loopToggle, function()
			if not var_19_9 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_activate_loop_mode_failed"))

				return
			end

			local var_26_0 = not arg_19_0.loopOn.gameObject.activeSelf

			PlayerPrefs.SetInt(var_19_10, var_26_0 and 1 or 0)
			PlayerPrefs.Save()
			setActive(arg_19_0.loopOn, var_26_0)
			setActive(arg_19_0.loopOff, not var_26_0)

			local var_26_1 = 0
			local var_26_2 = 0

			if var_26_0 then
				var_26_2 = arg_19_0.rtViewContainer.rect.width
			else
				var_26_1 = arg_19_0.rtViewContainer.rect.width
			end

			if arg_19_0.LTid then
				LeanTween.cancel(arg_19_0.LTid)

				arg_19_0.LTid = nil
			end

			arg_19_0.LTid = LeanTween.value(var_26_1, var_26_2, 0.3):setOnUpdate(System.Action_float(function(arg_27_0)
				arg_19_0.layoutView.preferredWidth = arg_27_0
			end)):setOnComplete(System.Action(function()
				arg_19_0.LTid = nil
			end)).uniqueId
		end, SFX_PANEL)
		onButton(arg_19_0, arg_19_0.loopHelp, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("levelScene_loop_help_tip")
			})
		end)

		local var_19_14 = AutoBotCommand.autoBotSatisfied()
		local var_19_15 = "chapter_autofight_flag_" .. arg_19_3.id
		local var_19_16 = var_19_14 and PlayerPrefs.GetInt(var_19_15, 1) == 1

		onToggle(arg_19_0, arg_19_0.autoFightToggle, function(arg_30_0)
			if arg_30_0 ~= var_19_16 then
				var_19_16 = arg_30_0

				PlayerPrefs.SetInt(var_19_15, var_19_16 and 1 or 0)
				PlayerPrefs.Save()
			end
		end, SFX_UI_TAG)
		triggerToggle(arg_19_0.autoFightToggle, var_19_16)
		setActive(arg_19_0.autoFightToggle, var_19_14)
	end

	onButton(arg_19_0, arg_19_0.btnConfirm, function()
		if getProxy(BayProxy):getShipCount() >= getProxy(PlayerProxy):getRawData():getMaxShipBag() then
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
		end

		if not arg_19_0.onConfirm then
			return
		end

		local var_31_0 = var_19_8 and arg_19_0.loopOn.gameObject.activeSelf and 1 or 0

		arg_19_0.onConfirm(arg_19_1, var_31_0)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_19_0, arg_19_0.btnConfirm_l, function()
		triggerButton(arg_19_0.btnConfirm)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_19_0, arg_19_0.btnCancel, function()
		if arg_19_0.onCancel then
			arg_19_0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0._tf:Find("bg"), function()
		if arg_19_0.onCancel then
			arg_19_0.onCancel()
		end
	end, SFX_CANCEL)

	if not arg_19_3:getConfig("risk_levels") then
		local var_19_17 = {}
	end

	onButton(arg_19_0, arg_19_0.passState, function()
		if not arg_19_3:hasMitigation() then
			return
		end

		local var_35_0 = i18n("level_risk_level_desc", arg_19_3:getChapterState()) .. i18n("level_risk_level_mitigation_rate", arg_19_3:getRemainPassCount(), arg_19_3:getMitigationRate())

		if var_19_0:getMapType() == Map.ELITE then
			var_35_0 = var_35_0 .. "\n" .. i18n("level_diffcult_chapter_state_safety")
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = var_35_0
		})
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.head, function()
		triggerButton(arg_19_0.passState)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.winCondAwardBtn, function()
		arg_19_0:ShowChapterRewardPanel()
	end)
	setText(arg_19_0.descQuickPlay, i18n("desc_quick_play"))

	local var_19_18 = arg_19_3:CanQuickPlay()

	setActive(arg_19_0.quickPlayGroup, var_19_18)

	if var_19_18 then
		local var_19_19 = "chapter_quickPlay_flag_" .. arg_19_3.id
		local var_19_20 = PlayerPrefs.GetInt(var_19_19, 1)

		onToggle(arg_19_0, arg_19_0.toggleQuickPlay, function(arg_38_0)
			PlayerPrefs.SetInt(var_19_19, arg_38_0 and 1 or 0)
			PlayerPrefs.Save()
		end, SFX_PANEL)
		triggerToggle(arg_19_0.toggleQuickPlay, var_19_20 == 1)
	end

	if arg_19_0.doEaseIn then
		local var_19_21 = arg_19_0._tf:Find("panel")

		var_19_21.transform.localPosition = arg_19_0.posStart

		table.insert(arg_19_0.delayTween, LeanTween.move(var_19_21, Vector3.zero, 0.2).uniqueId)

		var_19_21.localScale = Vector3.zero

		table.insert(arg_19_0.delayTween, LeanTween.scale(var_19_21, Vector3(1, 1, 1), 0.2).uniqueId)
		table.insert(arg_19_0.delayTween, LeanTween.moveX(arg_19_0.passState, 0, 0.35):setEase(LeanTweenType.easeInOutSine):setDelay(0.3).uniqueId)
	end

	arg_19_0:UpdateChapterAutoBtn()
end

function var_0_0.UpdateChapterAutoBtn(arg_39_0)
	local var_39_0 = pg.chapter_auto_statistics[arg_39_0.chapter.id]
	local var_39_1 = ChapterAutoProxy.IsSystemOpen()

	setActive(arg_39_0.btnAuto, var_39_0)
	setActive(arg_39_0.btnConfirm, var_39_0)
	setActive(arg_39_0.btnConfirm_l, not var_39_0)

	if not var_39_0 then
		return
	end

	local var_39_2 = arg_39_0.chapter:isClear()
	local var_39_3 = getProxy(ChapterAutoProxy):GetRecord(ChapterAutoProxy.TYPE.SLG, arg_39_0.chapter.id)
	local var_39_4 = var_39_1 and var_39_2 and var_39_3 > 0

	setGray(arg_39_0.btnAuto, not var_39_4, true)
	onButton(arg_39_0, arg_39_0.btnAuto, function()
		if var_39_4 then
			local var_40_0 = getProxy(ChapterAutoProxy):GetCommissionDoingType()

			if not var_40_0 then
				arg_39_0:ShowChapterAutoPanel()
			else
				arg_39_0:CheckChapterAutoOccupied(var_40_0)
			end
		elseif var_39_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_chapter_unlock_tip"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_unlock_tip"))
		end
	end, SFX_PANEL)
end

function var_0_0.CheckChapterAutoOccupied(arg_41_0, arg_41_1)
	switch(arg_41_1, {
		[ChapterAutoProxy.TYPE.WORLD] = function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("auto_battle_in_world"),
				onYes = function()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLD)
				end,
				yesText = i18n("auto_drop_is_activation_go"),
				noText = i18n("auto_drop_is_activation_cancle")
			})
		end
	})
end

function var_0_0.cancelTween(arg_44_0)
	_.each(arg_44_0.delayTween, function(arg_45_0)
		LeanTween.cancel(arg_45_0)
	end)

	arg_44_0.delayTween = {}
end

function var_0_0.updateDrop(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	if arg_46_1 == UIItemList.EventUpdate then
		local var_46_0 = arg_46_0.awards[arg_46_2 + 1]
		local var_46_1 = Drop.Create(var_46_0)

		updateDrop(arg_46_3, var_46_1)
		onButton(arg_46_0, arg_46_3, function()
			if ({
				[99] = true
			})[var_46_1:getConfig("type")] then
				local function var_47_0(arg_48_0)
					local var_48_0 = var_46_1:getConfig("display_icon")
					local var_48_1 = {}

					for iter_48_0, iter_48_1 in ipairs(var_48_0) do
						local var_48_2 = iter_48_1[1]
						local var_48_3 = iter_48_1[2]
						local var_48_4 = var_48_2 == DROP_TYPE_SHIP and not table.contains(arg_48_0, var_48_3)

						var_48_1[#var_48_1 + 1] = {
							type = var_48_2,
							id = var_48_3,
							anonymous = var_48_4
						}
					end

					arg_46_0:emit(BaseUI.ON_DROP_LIST, {
						item2Row = true,
						itemList = var_48_1,
						content = var_46_1:getConfig("display")
					})
					arg_46_0:initTestShowDrop(var_46_1, Clone(var_48_1))
				end

				arg_46_0:emit(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, arg_46_0.chapter.id, var_47_0)
			else
				arg_46_0:emit(BaseUI.ON_DROP, var_46_1)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.getChapterAwards(arg_49_0)
	local var_49_0 = Clone(arg_49_0:getConfig("awards"))
	local var_49_1 = arg_49_0:getStageExtraAwards()

	if var_49_1 then
		for iter_49_0 = #var_49_1, 1, -1 do
			table.insert(var_49_0, 1, var_49_1[iter_49_0])
		end
	end

	local function var_49_2(arg_50_0)
		return _.all(arg_50_0, function(arg_51_0)
			return #arg_51_0 >= 3
		end)
	end

	local var_49_3 = {
		arg_49_0:getConfig("boss_expedition_id"),
		arg_49_0:getConfig("ai_expedition_list")
	}

	if arg_49_0:getPlayType() == ChapterConst.TypeMultiStageBoss then
		table.insert(var_49_3, pg.chapter_model_multistageboss[arg_49_0.id].boss_expedition_id)
	end

	local var_49_4 = _.flatten(var_49_3)
	local var_49_5 = {}
	local var_49_6 = {}

	for iter_49_1, iter_49_2 in ipairs(var_49_4) do
		local var_49_7 = checkExist(pg.expedition_activity_template[iter_49_2], {
			"pt_drop_display"
		})

		if var_49_7 and type(var_49_7) == "table" and var_49_2(var_49_7) then
			for iter_49_3, iter_49_4 in ipairs(var_49_7) do
				local var_49_8, var_49_9, var_49_10, var_49_11 = unpack(iter_49_4)
				local var_49_12 = var_49_9 .. "_" .. var_49_10

				if not var_49_6[var_49_12] then
					var_49_6[var_49_12] = {}

					table.insert(var_49_5, var_49_12)
				end

				var_49_6[var_49_12][var_49_8] = var_49_11
			end
		end
	end

	local var_49_13 = getProxy(ActivityProxy)

	for iter_49_5 = #var_49_5, 1, -1 do
		local var_49_14, var_49_15 = unpack(underscore.map(string.split(var_49_5[iter_49_5], "_"), function(arg_52_0)
			return tonumber(arg_52_0)
		end))

		for iter_49_6, iter_49_7 in pairs(var_49_6[var_49_5[iter_49_5]]) do
			local var_49_16 = var_49_13:getActivityById(iter_49_6)

			if var_49_16 and not var_49_16:isEnd() then
				if var_49_14 == DROP_TYPE_RESOURCE then
					table.insert(var_49_0, 1, {
						DROP_TYPE_ITEM,
						id2ItemId(var_49_15),
						iter_49_7
					})

					break
				end

				table.insert(var_49_0, 1, {
					var_49_14,
					var_49_15,
					iter_49_7
				})

				break
			end
		end
	end

	return var_49_0
end

function var_0_0.initTestShowDrop(arg_53_0, arg_53_1, arg_53_2)
	if IsUnityEditor then
		local var_53_0 = pg.MsgboxMgr.GetInstance()._go
		local var_53_1 = var_53_0.transform:Find("button_test_show_drop")

		if IsNil(var_53_1) then
			var_53_1 = GameObject.New("button_test_show_drop")

			var_53_1:AddComponent(typeof(Button))
			var_53_1:AddComponent(typeof(RectTransform))
			var_53_1:AddComponent(typeof(Image))
		end

		local var_53_2 = var_53_1:GetComponent(typeof(RectTransform))

		var_53_2:SetParent(var_53_0.transform, false)

		var_53_2.anchoredPosition = Vector3(-239, 173, 0)
		var_53_2.sizeDelta = Vector2(40, 40)

		onButton(arg_53_0, var_53_2, function()
			_.each(arg_53_2, function(arg_55_0)
				arg_55_0.anonymous = false
			end)
			arg_53_0:emit(BaseUI.ON_DROP_LIST, {
				item2Row = true,
				itemList = arg_53_2,
				content = arg_53_1:getConfig("display")
			})
		end)
	end
end

function var_0_0.clearTestShowDrop(arg_56_0)
	if IsUnityEditor then
		local var_56_0 = pg.MsgboxMgr.GetInstance()._go.transform:Find("button_test_show_drop")

		if not IsNil(var_56_0) then
			Destroy(var_56_0)
		end
	end
end

function var_0_0.ShowChapterRewardPanel(arg_57_0)
	if arg_57_0.rewardPanel == nil then
		arg_57_0.rewardPanel = ChapterRewardPanel.New(arg_57_0._tf.parent, arg_57_0.event, arg_57_0.contextData)

		arg_57_0.rewardPanel:Load()
	end

	arg_57_0.rewardPanel:ActionInvoke("Enter", arg_57_0.chapter)
end

function var_0_0.ClearChapterRewardPanel(arg_58_0)
	if arg_58_0.rewardPanel ~= nil then
		arg_58_0.rewardPanel:Destroy()

		arg_58_0.rewardPanel = nil
	end
end

function var_0_0.ShowChapterAutoPanel(arg_59_0)
	if arg_59_0.autoPanel == nil then
		arg_59_0.autoPanel = ChapterAutoPanel.New(arg_59_0._tf, arg_59_0.event, arg_59_0.contextData)

		arg_59_0.autoPanel:Load()
	end

	arg_59_0.autoPanel:ActionInvoke("Enter", arg_59_0.chapter)
end

function var_0_0.RefreshChapterAutoPanel(arg_60_0)
	if arg_60_0.autoPanel and arg_60_0.autoPanel:isShowing() then
		arg_60_0.autoPanel:ActionInvoke("RefreshView")
	end
end

function var_0_0.ClearChapterAutoPanel(arg_61_0)
	if arg_61_0.autoPanel ~= nil then
		arg_61_0.autoPanel:Destroy()

		arg_61_0.autoPanel = nil
	end
end

function var_0_0.clear(arg_62_0)
	arg_62_0:cancelTween()
	arg_62_0.dropList:each(function(arg_63_0, arg_63_1)
		clearDrop(arg_63_1)
	end)
	arg_62_0:clearTestShowDrop()
	arg_62_0:ClearChapterRewardPanel()
	arg_62_0:ClearChapterAutoPanel()
end

return var_0_0
