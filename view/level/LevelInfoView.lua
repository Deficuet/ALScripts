local var_0_0 = class("LevelInfoView", import("..base.BaseSubView"))

var_0_0.CHAPTER_GUIDE_NAME = "CHAPTER_AUTO_GUIDE"

function var_0_0.getUIName(arg_1_0)
	return "LevelStageInfoView"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/levelstageinfoview_atlas",
		"passstate"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
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

	if var_11_0 and var_11_1 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_0_0.CHAPTER_GUIDE_NAME) then
		pg.NewGuideMgr.GetInstance():Play(var_0_0.CHAPTER_GUIDE_NAME)
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = var_0_0.CHAPTER_GUIDE_NAME
		})
	end
end

function var_0_0.Hide(arg_12_0)
	arg_12_0:clear()
	setActive(arg_12_0._tf, false)
	arg_12_0:UnOverlayPanel(arg_12_0._tf, arg_12_0._parentTf)
end

function var_0_0.setCBFunc(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.onConfirm = arg_13_1
	arg_13_0.onCancel = arg_13_2
end

function var_0_0.InitUI(arg_14_0)
	arg_14_0.titleBG = arg_14_0._tf:Find("panel/title")
	arg_14_0.titleBGDecoration = arg_14_0._tf:Find("panel/title/Image")
	arg_14_0.titleIcon = arg_14_0._tf:Find("panel/title/icon")
	arg_14_0.txTitle = arg_14_0._tf:Find("panel/title_form")
	arg_14_0.txTitleOriginPosY = arg_14_0.txTitle.anchoredPosition.y
	arg_14_0.txTitleHead = arg_14_0._tf:Find("panel/title_head")

	setActive(arg_14_0.txTitleHead, false)

	arg_14_0.txIntro = arg_14_0._tf:Find("panel/intro")
	arg_14_0.txCost = arg_14_0._tf:Find("panel/cost/text")
	arg_14_0.progressBar = arg_14_0._tf:Find("panel/progress")
	arg_14_0.txProgress = arg_14_0._tf:Find("panel/progress/Text/value")
	arg_14_0.progress = arg_14_0._tf:Find("panel/progress")
	arg_14_0.head = arg_14_0._tf:Find("panel/head/Image")
	arg_14_0.trAchieveTpl = arg_14_0._tf:Find("panel/achieve")
	arg_14_0.trAchieves = arg_14_0._tf:Find("panel/achieves")
	arg_14_0.passStateMask = arg_14_0._tf:Find("panel/passState")
	arg_14_0.passState = arg_14_0._tf:Find("panel/passState/Image")

	setActive(arg_14_0.passState, true)

	arg_14_0.winCondDesc = arg_14_0._tf:Find("panel/win_conditions/desc")
	arg_14_0.winCondAwardBtn = arg_14_0._tf:Find("panel/win_conditions/icon")
	arg_14_0.loseCondDesc = arg_14_0._tf:Find("panel/lose_conditions/desc")
	arg_14_0.achieveList = UIItemList.New(arg_14_0.trAchieves, arg_14_0.trAchieveTpl)

	setActive(arg_14_0.trAchieveTpl, false)

	arg_14_0.trDropTpl = arg_14_0._tf:Find("panel/drops/frame/list/item")
	arg_14_0.trDrops = arg_14_0._tf:Find("panel/drops/frame/list")
	arg_14_0.dropList = UIItemList.New(arg_14_0.trDrops, arg_14_0.trDropTpl)

	arg_14_0.dropList:make(function(arg_15_0, arg_15_1, arg_15_2)
		arg_14_0:updateDrop(arg_15_0, arg_15_1, arg_15_2)
	end)
	setActive(arg_14_0.trDropTpl, false)

	arg_14_0.btnAuto = arg_14_0._tf:Find("panel/auto_button")
	arg_14_0.btnConfirm = arg_14_0._tf:Find("panel/start_button")
	arg_14_0.btnConfirm_l = arg_14_0._tf:Find("panel/start_button_l")
	arg_14_0.btnCancel = arg_14_0._tf:Find("panel/btnBack")
	arg_14_0.quickPlayGroup = arg_14_0._tf:Find("panel/quickPlay")
	arg_14_0.descQuickPlay = arg_14_0.quickPlayGroup:Find("desc")
	arg_14_0.toggleQuickPlay = arg_14_0.quickPlayGroup:GetComponent(typeof(Toggle))
	arg_14_0.bottomExtra = arg_14_0._tf:Find("panel/BottomExtra")
	arg_14_0.layoutView = GetComponent(arg_14_0.bottomExtra:Find("LoopGroup/view"), typeof(LayoutElement))
	arg_14_0.rtViewContainer = arg_14_0.bottomExtra:Find("LoopGroup/view/container")

	setText(arg_14_0.bottomExtra:Find("LoopGroup/Loop/Text"), i18n("autofight_farm"))

	arg_14_0.loopToggle = arg_14_0.bottomExtra:Find("LoopGroup/Loop/Toggle")
	arg_14_0.loopOn = arg_14_0.loopToggle:Find("on")
	arg_14_0.loopOff = arg_14_0.loopToggle:Find("off")
	arg_14_0.loopHelp = arg_14_0.bottomExtra:Find("ButtonHelp")
	arg_14_0.costLimitTip = arg_14_0.bottomExtra:Find("LoopGroup/view/container/CostLimit")

	setActive(arg_14_0.costLimitTip, false)

	arg_14_0.autoFightToggle = arg_14_0.bottomExtra:Find("LoopGroup/view/container/AutoFight")

	setText(arg_14_0.autoFightToggle:Find("Text"), i18n("autofight"))

	arg_14_0.delayTween = {}
	arg_14_0.doEaseIn = true
end

local var_0_1 = 525
local var_0_2 = 373

function var_0_0.set(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = getProxy(ChapterProxy):getChapterById(arg_16_1, true)

	arg_16_0:downloadLevelInfoViewResList(var_16_0, function()
		arg_16_0:setAfterResDownload(arg_16_1, arg_16_2, var_16_0)
	end)
end

function var_0_0.setAfterResDownload(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_0:cancelTween()

	arg_18_0.chapter = arg_18_3
	arg_18_0.posStart = arg_18_2 or Vector3(0, 0, 0)

	local var_18_0 = getProxy(ChapterProxy):getMapById(arg_18_3:getConfig("map"))
	local var_18_1 = arg_18_3:getConfigTable()
	local var_18_2 = string.split(var_18_1.name, "|")
	local var_18_3 = arg_18_3:getPlayType() == ChapterConst.TypeDefence

	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_18_3 and "title_print_defense" or "title_print", function(arg_19_0)
		if not IsNil(arg_18_0.titleBGDecoration) then
			arg_18_0.titleBGDecoration:GetComponent(typeof(Image)).sprite = arg_19_0
		end
	end)
	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_18_3 and "titlebar_bg_defense" or "titlebar_bg", function(arg_20_0)
		if not IsNil(arg_18_0.titleBG) then
			arg_18_0.titleBG:GetComponent(typeof(Image)).sprite = arg_20_0
		end
	end)
	setActive(arg_18_0.titleIcon, var_18_3)

	local var_18_4 = arg_18_0.progressBar.sizeDelta

	var_18_4.x = var_18_3 and var_0_2 or var_0_1
	arg_18_0.progressBar.sizeDelta = var_18_4

	setText(arg_18_0.txTitle:Find("title_index"), var_18_1.chapter_name .. "  ")
	setText(arg_18_0.txTitle:Find("title"), var_18_2[1])
	setText(arg_18_0.txTitle:Find("title_en"), var_18_2[2] or "")
	setActive(arg_18_0.txTitleHead, var_18_2[3] and #var_18_2[3] > 0)

	local var_18_5 = var_18_2[3] and #var_18_2[3] > 0 and arg_18_0.txTitleOriginPosY or arg_18_0.txTitleOriginPosY + 8

	setAnchoredPosition(arg_18_0.txTitle, {
		y = var_18_5
	})
	setText(arg_18_0.txTitleHead, var_18_2[3] or "")
	setText(arg_18_0.winCondDesc, i18n("text_win_condition") .. "：" .. i18n(arg_18_3:getConfig("win_condition_display")))
	setText(arg_18_0.loseCondDesc, i18n("text_lose_condition") .. "：" .. i18n(arg_18_3:getConfig("lose_condition_display")))
	setActive(arg_18_0.winCondAwardBtn, arg_18_3:getPlayType() == ChapterConst.TypeDefence)

	if not arg_18_3:existAchieve() then
		setActive(arg_18_0.passState, false)
		setActive(arg_18_0.progress, false)
		setActive(arg_18_0.trAchieves, false)
	else
		setActive(arg_18_0.passState, true)
		setActive(arg_18_0.progress, true)
		setActive(arg_18_0.trAchieves, true)

		arg_18_0.passState.localPosition = Vector3(-arg_18_0.passState.rect.width, 0, 0)

		local var_18_6 = arg_18_3:hasMitigation()

		setActive(arg_18_0.passState, var_18_6)

		if var_18_6 then
			local var_18_7 = arg_18_3:getRiskLevel()

			setImageSprite(arg_18_0.passState, GetSpriteFromAtlas("passstate", var_18_7), true)
		end

		setWidgetText(arg_18_0.progress, i18n("levelScene_threat_to_rule_out", ": "))
		table.insert(arg_18_0.delayTween, LeanTween.value(go(arg_18_0.progress), 0, arg_18_3.progress, 0.5):setDelay(0.15):setOnUpdate(System.Action_float(function(arg_21_0)
			setSlider(arg_18_0.progress, 0, 100, arg_21_0)
			setText(arg_18_0.txProgress, math.floor(arg_21_0) .. "%")
		end)).uniqueId)
		arg_18_0.achieveList:align(#arg_18_3.achieves)
		arg_18_0.achieveList:each(function(arg_22_0, arg_22_1)
			local var_22_0 = arg_18_3.achieves[arg_22_0 + 1]
			local var_22_1 = findTF(arg_22_1, "desc")

			setText(var_22_1, ChapterConst.GetAchieveDesc(var_22_0.type, arg_18_3))
			setTextColor(var_22_1, Color.white)
			setActive(findTF(arg_22_1, "star"), false)
			setActive(findTF(arg_22_1, "star_empty"), true)

			local var_22_2 = ChapterConst.IsAchieved(var_22_0)

			table.insert(arg_18_0.delayTween, LeanTween.delayedCall(0.15 + (arg_22_0 + 1) * 0.15, System.Action(function()
				if not IsNil(arg_22_1) then
					local var_23_0 = findTF(arg_22_1, "desc")

					setTextColor(var_23_0, var_22_2 and Color.yellow or Color.white)
					setActive(findTF(arg_22_1, "star"), var_22_2)
					setActive(findTF(arg_22_1, "star_empty"), not var_22_2)
				end
			end)).uniqueId)
		end)
	end

	setText(arg_18_0.txIntro, var_18_1.profiles)
	setText(arg_18_0.txCost, var_18_1.oil)

	if var_18_1.icon and var_18_1.icon[1] then
		setActive(arg_18_0.head.parent, true)
		setImageSprite(arg_18_0.head, LoadSprite("qicon/" .. var_18_1.icon[1]))
	else
		setActive(arg_18_0.head.parent, false)
	end

	arg_18_0.awards = var_0_0.getChapterAwards(arg_18_0.chapter)

	arg_18_0.dropList:align(#arg_18_0.awards)

	local var_18_8 = arg_18_3:existLoop()

	setActive(arg_18_0.bottomExtra, var_18_8)

	if var_18_8 then
		local var_18_9 = arg_18_3:canActivateLoop()
		local var_18_10 = "chapter_loop_flag_" .. arg_18_3.id
		local var_18_11 = PlayerPrefs.GetInt(var_18_10, -1)
		local var_18_12 = (var_18_11 == 1 or var_18_11 == -1) and var_18_9
		local var_18_13 = #arg_18_3:getConfig("use_oil_limit") > 0

		setActive(arg_18_0.loopOn, var_18_12)
		setActive(arg_18_0.loopOff, not var_18_12)
		setActive(arg_18_0.costLimitTip, var_18_13)
		onNextTick(function()
			Canvas.ForceUpdateCanvases()

			arg_18_0.layoutView.preferredWidth = var_18_12 and arg_18_0.rtViewContainer.rect.width or 0
		end)
		onButton(arg_18_0, arg_18_0.loopToggle, function()
			if not var_18_9 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_activate_loop_mode_failed"))

				return
			end

			local var_25_0 = not arg_18_0.loopOn.gameObject.activeSelf

			PlayerPrefs.SetInt(var_18_10, var_25_0 and 1 or 0)
			PlayerPrefs.Save()
			setActive(arg_18_0.loopOn, var_25_0)
			setActive(arg_18_0.loopOff, not var_25_0)

			local var_25_1 = 0
			local var_25_2 = 0

			if var_25_0 then
				var_25_2 = arg_18_0.rtViewContainer.rect.width
			else
				var_25_1 = arg_18_0.rtViewContainer.rect.width
			end

			if arg_18_0.LTid then
				LeanTween.cancel(arg_18_0.LTid)

				arg_18_0.LTid = nil
			end

			arg_18_0.LTid = LeanTween.value(var_25_1, var_25_2, 0.3):setOnUpdate(System.Action_float(function(arg_26_0)
				arg_18_0.layoutView.preferredWidth = arg_26_0
			end)):setOnComplete(System.Action(function()
				arg_18_0.LTid = nil
			end)).uniqueId
		end, SFX_PANEL)
		onButton(arg_18_0, arg_18_0.loopHelp, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("levelScene_loop_help_tip")
			})
		end)

		local var_18_14 = AutoBotCommand.autoBotSatisfied()
		local var_18_15 = "chapter_autofight_flag_" .. arg_18_3.id
		local var_18_16 = var_18_14 and PlayerPrefs.GetInt(var_18_15, 1) == 1

		onToggle(arg_18_0, arg_18_0.autoFightToggle, function(arg_29_0)
			if arg_29_0 ~= var_18_16 then
				var_18_16 = arg_29_0

				PlayerPrefs.SetInt(var_18_15, var_18_16 and 1 or 0)
				PlayerPrefs.Save()
			end
		end, SFX_UI_TAG)
		triggerToggle(arg_18_0.autoFightToggle, var_18_16)
		setActive(arg_18_0.autoFightToggle, var_18_14)
	end

	onButton(arg_18_0, arg_18_0.btnConfirm, function()
		if getProxy(BayProxy):getShipCount() >= getProxy(PlayerProxy):getRawData():getMaxShipBag() then
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
		end

		if not arg_18_0.onConfirm then
			return
		end

		local var_30_0 = var_18_8 and arg_18_0.loopOn.gameObject.activeSelf and 1 or 0

		arg_18_0.onConfirm(arg_18_1, var_30_0)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_18_0, arg_18_0.btnConfirm_l, function()
		triggerButton(arg_18_0.btnConfirm)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_18_0, arg_18_0.btnCancel, function()
		if arg_18_0.onCancel then
			arg_18_0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(arg_18_0, arg_18_0._tf:Find("bg"), function()
		if arg_18_0.onCancel then
			arg_18_0.onCancel()
		end
	end, SFX_CANCEL)

	if not arg_18_3:getConfig("risk_levels") then
		local var_18_17 = {}
	end

	onButton(arg_18_0, arg_18_0.passState, function()
		if not arg_18_3:hasMitigation() then
			return
		end

		local var_34_0 = i18n("level_risk_level_desc", arg_18_3:getChapterState()) .. i18n("level_risk_level_mitigation_rate", arg_18_3:getRemainPassCount(), arg_18_3:getMitigationRate())

		if var_18_0:getMapType() == Map.ELITE then
			var_34_0 = var_34_0 .. "\n" .. i18n("level_diffcult_chapter_state_safety")
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = var_34_0
		})
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.head, function()
		triggerButton(arg_18_0.passState)
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.winCondAwardBtn, function()
		arg_18_0:ShowChapterRewardPanel()
	end)
	setText(arg_18_0.descQuickPlay, i18n("desc_quick_play"))

	local var_18_18 = arg_18_3:CanQuickPlay()

	setActive(arg_18_0.quickPlayGroup, var_18_18)

	if var_18_18 then
		local var_18_19 = "chapter_quickPlay_flag_" .. arg_18_3.id
		local var_18_20 = PlayerPrefs.GetInt(var_18_19, 1)

		onToggle(arg_18_0, arg_18_0.toggleQuickPlay, function(arg_37_0)
			PlayerPrefs.SetInt(var_18_19, arg_37_0 and 1 or 0)
			PlayerPrefs.Save()
		end, SFX_PANEL)
		triggerToggle(arg_18_0.toggleQuickPlay, var_18_20 == 1)
	end

	if arg_18_0.doEaseIn then
		local var_18_21 = arg_18_0._tf:Find("panel")

		var_18_21.transform.localPosition = arg_18_0.posStart

		table.insert(arg_18_0.delayTween, LeanTween.move(var_18_21, Vector3.zero, 0.2).uniqueId)

		var_18_21.localScale = Vector3.zero

		table.insert(arg_18_0.delayTween, LeanTween.scale(var_18_21, Vector3(1, 1, 1), 0.2).uniqueId)
		table.insert(arg_18_0.delayTween, LeanTween.moveX(arg_18_0.passState, 0, 0.35):setEase(LeanTweenType.easeInOutSine):setDelay(0.3).uniqueId)
	end

	arg_18_0:UpdateChapterAutoBtn()
end

function var_0_0.UpdateChapterAutoBtn(arg_38_0)
	local var_38_0 = pg.chapter_auto_statistics[arg_38_0.chapter.id]
	local var_38_1 = ChapterAutoProxy.IsSystemOpen()

	setActive(arg_38_0.btnAuto, var_38_0)
	setActive(arg_38_0.btnConfirm, var_38_0)
	setActive(arg_38_0.btnConfirm_l, not var_38_0)

	if not var_38_0 then
		return
	end

	local var_38_2 = arg_38_0.chapter:isClear()
	local var_38_3 = getProxy(ChapterAutoProxy):GetRecord(ChapterAutoProxy.TYPE.SLG, arg_38_0.chapter.id)
	local var_38_4 = var_38_1 and var_38_2 and var_38_3 > 0

	setGray(arg_38_0.btnAuto, not var_38_4, true)
	onButton(arg_38_0, arg_38_0.btnAuto, function()
		if var_38_4 then
			local var_39_0 = getProxy(ChapterAutoProxy):GetCommissionDoingType()

			if not var_39_0 then
				arg_38_0:ShowChapterAutoPanel()
			else
				arg_38_0:CheckChapterAutoOccupied(var_39_0)
			end
		elseif var_38_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_chapter_unlock_tip"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_unlock_tip"))
		end
	end, SFX_PANEL)
end

function var_0_0.CheckChapterAutoOccupied(arg_40_0, arg_40_1)
	switch(arg_40_1, {
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

function var_0_0.cancelTween(arg_43_0)
	_.each(arg_43_0.delayTween, function(arg_44_0)
		LeanTween.cancel(arg_44_0)
	end)

	arg_43_0.delayTween = {}
end

function var_0_0.updateDrop(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	if arg_45_1 == UIItemList.EventUpdate then
		local var_45_0 = arg_45_0.awards[arg_45_2 + 1]
		local var_45_1 = Drop.Create(var_45_0)

		updateDrop(arg_45_3, var_45_1)
		onButton(arg_45_0, arg_45_3, function()
			if ({
				[99] = true
			})[var_45_1:getConfig("type")] then
				local function var_46_0(arg_47_0)
					local var_47_0 = var_45_1:getConfig("display_icon")
					local var_47_1 = {}

					for iter_47_0, iter_47_1 in ipairs(var_47_0) do
						local var_47_2 = iter_47_1[1]
						local var_47_3 = iter_47_1[2]
						local var_47_4 = var_47_2 == DROP_TYPE_SHIP and not table.contains(arg_47_0, var_47_3)

						var_47_1[#var_47_1 + 1] = {
							type = var_47_2,
							id = var_47_3,
							anonymous = var_47_4
						}
					end

					arg_45_0:emit(BaseUI.ON_DROP_LIST, {
						item2Row = true,
						itemList = var_47_1,
						content = var_45_1:getConfig("display")
					})
					arg_45_0:initTestShowDrop(var_45_1, Clone(var_47_1))
				end

				arg_45_0:emit(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, arg_45_0.chapter.id, var_46_0)
			else
				arg_45_0:emit(BaseUI.ON_DROP, var_45_1)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.getChapterAwards(arg_48_0)
	local var_48_0 = Clone(arg_48_0:getConfig("awards"))
	local var_48_1 = arg_48_0:getStageExtraAwards()

	if var_48_1 then
		for iter_48_0 = #var_48_1, 1, -1 do
			table.insert(var_48_0, 1, var_48_1[iter_48_0])
		end
	end

	local var_48_2 = {
		arg_48_0:getConfig("boss_expedition_id"),
		arg_48_0:getConfig("ai_expedition_list")
	}

	if arg_48_0:getPlayType() == ChapterConst.TypeMultiStageBoss then
		table.insert(var_48_2, pg.chapter_model_multistageboss[arg_48_0.id].boss_expedition_id)
	end

	local var_48_3 = _.flatten(var_48_2)
	local var_48_4 = {}
	local var_48_5 = {}

	for iter_48_1, iter_48_2 in ipairs(var_48_3) do
		local var_48_6 = checkExist(pg.expedition_activity_template[iter_48_2], {
			"pt_drop_display"
		})

		if var_48_6 and type(var_48_6) == "table" then
			for iter_48_3, iter_48_4 in ipairs(var_48_6) do
				local var_48_7, var_48_8, var_48_9, var_48_10 = unpack(iter_48_4)
				local var_48_11 = var_48_8 .. "_" .. var_48_9

				if not var_48_5[var_48_11] then
					var_48_5[var_48_11] = {}

					table.insert(var_48_4, var_48_11)
				end

				var_48_5[var_48_11][var_48_7] = var_48_10
			end
		end
	end

	local var_48_12 = getProxy(ActivityProxy)

	for iter_48_5 = #var_48_4, 1, -1 do
		local var_48_13, var_48_14 = unpack(underscore.map(string.split(var_48_4[iter_48_5], "_"), function(arg_49_0)
			return tonumber(arg_49_0)
		end))

		for iter_48_6, iter_48_7 in pairs(var_48_5[var_48_4[iter_48_5]]) do
			local var_48_15 = var_48_12:getActivityById(iter_48_6)

			if var_48_15 and not var_48_15:isEnd() then
				if var_48_13 == DROP_TYPE_RESOURCE then
					table.insert(var_48_0, 1, {
						DROP_TYPE_ITEM,
						id2ItemId(var_48_14),
						iter_48_7
					})

					break
				end

				table.insert(var_48_0, 1, {
					var_48_13,
					var_48_14,
					iter_48_7
				})

				break
			end
		end
	end

	return var_48_0
end

function var_0_0.initTestShowDrop(arg_50_0, arg_50_1, arg_50_2)
	if IsUnityEditor then
		local var_50_0 = pg.MsgboxMgr.GetInstance()._go
		local var_50_1 = var_50_0.transform:Find("button_test_show_drop")

		if IsNil(var_50_1) then
			var_50_1 = GameObject.New("button_test_show_drop")

			var_50_1:AddComponent(typeof(Button))
			var_50_1:AddComponent(typeof(RectTransform))
			var_50_1:AddComponent(typeof(Image))
		end

		local var_50_2 = var_50_1:GetComponent(typeof(RectTransform))

		var_50_2:SetParent(var_50_0.transform, false)

		var_50_2.anchoredPosition = Vector3(-239, 173, 0)
		var_50_2.sizeDelta = Vector2(40, 40)

		onButton(arg_50_0, var_50_2, function()
			_.each(arg_50_2, function(arg_52_0)
				arg_52_0.anonymous = false
			end)
			arg_50_0:emit(BaseUI.ON_DROP_LIST, {
				item2Row = true,
				itemList = arg_50_2,
				content = arg_50_1:getConfig("display")
			})
		end)
	end
end

function var_0_0.clearTestShowDrop(arg_53_0)
	if IsUnityEditor then
		local var_53_0 = pg.MsgboxMgr.GetInstance()._go.transform:Find("button_test_show_drop")

		if not IsNil(var_53_0) then
			Destroy(var_53_0)
		end
	end
end

function var_0_0.ShowChapterRewardPanel(arg_54_0)
	if arg_54_0.rewardPanel == nil then
		arg_54_0.rewardPanel = ChapterRewardPanel.New(arg_54_0._tf.parent, arg_54_0.event, arg_54_0.contextData)

		arg_54_0.rewardPanel:Load()
	end

	arg_54_0.rewardPanel:ActionInvoke("Enter", arg_54_0.chapter)
end

function var_0_0.ClearChapterRewardPanel(arg_55_0)
	if arg_55_0.rewardPanel ~= nil then
		arg_55_0.rewardPanel:Destroy()

		arg_55_0.rewardPanel = nil
	end
end

function var_0_0.ShowChapterAutoPanel(arg_56_0)
	if arg_56_0.autoPanel == nil then
		arg_56_0.autoPanel = ChapterAutoPanel.New(arg_56_0._tf, arg_56_0.event, arg_56_0.contextData)

		arg_56_0.autoPanel:Load()
	end

	arg_56_0.autoPanel:ActionInvoke("Enter", arg_56_0.chapter)
end

function var_0_0.RefreshChapterAutoPanel(arg_57_0)
	if arg_57_0.autoPanel and arg_57_0.autoPanel:isShowing() then
		arg_57_0.autoPanel:ActionInvoke("RefreshView")
	end
end

function var_0_0.ClearChapterAutoPanel(arg_58_0)
	if arg_58_0.autoPanel ~= nil then
		arg_58_0.autoPanel:Destroy()

		arg_58_0.autoPanel = nil
	end
end

function var_0_0.clear(arg_59_0)
	arg_59_0:cancelTween()
	arg_59_0.dropList:each(function(arg_60_0, arg_60_1)
		clearDrop(arg_60_1)
	end)
	arg_59_0:clearTestShowDrop()
	arg_59_0:ClearChapterRewardPanel()
	arg_59_0:ClearChapterAutoPanel()
end

return var_0_0
