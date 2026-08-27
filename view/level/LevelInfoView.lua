local var_0_0 = class("LevelInfoView", import("..base.BaseSubView"))

var_0_0.CHAPTER_GUIDE_NAME = "CHAPTER_AUTO_GUIDE"

function var_0_0.getUIName(arg_1_0)
	return "LevelStageInfoView"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.loader = AutoLoader.New()

	arg_2_0:InitUI()
end

function var_0_0.OnDestroy(arg_3_0)
	if arg_3_0:isShowing() then
		arg_3_0:Hide()
	end

	arg_3_0.onConfirm = nil
	arg_3_0.onCancel = nil

	if arg_3_0.LTid then
		LeanTween.cancel(arg_3_0.LTid)

		arg_3_0.LTid = nil
	end

	arg_3_0.loader:Clear()
end

function var_0_0.Show(arg_4_0)
	setActive(arg_4_0._tf, true)
	arg_4_0:BlurPanel(arg_4_0._tf)
	arg_4_0:CheckGuide()
end

function var_0_0.CheckGuide(arg_5_0)
	local var_5_0 = ChapterAutoProxy.IsSystemOpen()
	local var_5_1 = pg.chapter_auto_statistics[arg_5_0.chapter.id]

	if var_5_0 and var_5_1 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_0_0.CHAPTER_GUIDE_NAME) then
		pg.NewGuideMgr.GetInstance():Play(var_0_0.CHAPTER_GUIDE_NAME)
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = var_0_0.CHAPTER_GUIDE_NAME
		})
	end
end

function var_0_0.Hide(arg_6_0)
	arg_6_0:clear()
	setActive(arg_6_0._tf, false)
	arg_6_0:UnOverlayPanel(arg_6_0._tf, arg_6_0._parentTf)
end

function var_0_0.setCBFunc(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.onConfirm = arg_7_1
	arg_7_0.onCancel = arg_7_2
end

function var_0_0.InitUI(arg_8_0)
	arg_8_0.titleBG = arg_8_0._tf:Find("panel/title")
	arg_8_0.titleBGDecoration = arg_8_0._tf:Find("panel/title/Image")
	arg_8_0.titleIcon = arg_8_0._tf:Find("panel/title/icon")
	arg_8_0.txTitle = arg_8_0._tf:Find("panel/title_form")
	arg_8_0.txTitleOriginPosY = arg_8_0.txTitle.anchoredPosition.y
	arg_8_0.txTitleHead = arg_8_0._tf:Find("panel/title_head")

	setActive(arg_8_0.txTitleHead, false)

	arg_8_0.txIntro = arg_8_0._tf:Find("panel/intro")
	arg_8_0.txCost = arg_8_0._tf:Find("panel/cost/text")
	arg_8_0.progressBar = arg_8_0._tf:Find("panel/progress")
	arg_8_0.txProgress = arg_8_0._tf:Find("panel/progress/Text/value")
	arg_8_0.progress = arg_8_0._tf:Find("panel/progress")
	arg_8_0.head = arg_8_0._tf:Find("panel/head/Image")
	arg_8_0.trAchieveTpl = arg_8_0._tf:Find("panel/achieve")
	arg_8_0.trAchieves = arg_8_0._tf:Find("panel/achieves")
	arg_8_0.passStateMask = arg_8_0._tf:Find("panel/passState")
	arg_8_0.passState = arg_8_0._tf:Find("panel/passState/Image")

	setActive(arg_8_0.passState, true)

	arg_8_0.winCondDesc = arg_8_0._tf:Find("panel/win_conditions/desc")
	arg_8_0.winCondAwardBtn = arg_8_0._tf:Find("panel/win_conditions/icon")
	arg_8_0.loseCondDesc = arg_8_0._tf:Find("panel/lose_conditions/desc")
	arg_8_0.achieveList = UIItemList.New(arg_8_0.trAchieves, arg_8_0.trAchieveTpl)

	setActive(arg_8_0.trAchieveTpl, false)

	arg_8_0.trDropTpl = arg_8_0._tf:Find("panel/drops/frame/list/item")
	arg_8_0.trDrops = arg_8_0._tf:Find("panel/drops/frame/list")
	arg_8_0.dropList = UIItemList.New(arg_8_0.trDrops, arg_8_0.trDropTpl)

	arg_8_0.dropList:make(function(arg_9_0, arg_9_1, arg_9_2)
		arg_8_0:updateDrop(arg_9_0, arg_9_1, arg_9_2)
	end)
	setActive(arg_8_0.trDropTpl, false)

	arg_8_0.btnAuto = arg_8_0._tf:Find("panel/auto_button")
	arg_8_0.btnConfirm = arg_8_0._tf:Find("panel/start_button")
	arg_8_0.btnConfirm_l = arg_8_0._tf:Find("panel/start_button_l")
	arg_8_0.btnCancel = arg_8_0._tf:Find("panel/btnBack")
	arg_8_0.quickPlayGroup = arg_8_0._tf:Find("panel/quickPlay")
	arg_8_0.descQuickPlay = arg_8_0.quickPlayGroup:Find("desc")
	arg_8_0.toggleQuickPlay = arg_8_0.quickPlayGroup:GetComponent(typeof(Toggle))
	arg_8_0.bottomExtra = arg_8_0._tf:Find("panel/BottomExtra")
	arg_8_0.layoutView = GetComponent(arg_8_0.bottomExtra:Find("LoopGroup/view"), typeof(LayoutElement))
	arg_8_0.rtViewContainer = arg_8_0.bottomExtra:Find("LoopGroup/view/container")

	setText(arg_8_0.bottomExtra:Find("LoopGroup/Loop/Text"), i18n("autofight_farm"))

	arg_8_0.loopToggle = arg_8_0.bottomExtra:Find("LoopGroup/Loop/Toggle")
	arg_8_0.loopOn = arg_8_0.loopToggle:Find("on")
	arg_8_0.loopOff = arg_8_0.loopToggle:Find("off")
	arg_8_0.loopHelp = arg_8_0.bottomExtra:Find("ButtonHelp")
	arg_8_0.costLimitTip = arg_8_0.bottomExtra:Find("LoopGroup/view/container/CostLimit")

	setActive(arg_8_0.costLimitTip, false)

	arg_8_0.autoFightToggle = arg_8_0.bottomExtra:Find("LoopGroup/view/container/AutoFight")

	setText(arg_8_0.autoFightToggle:Find("Text"), i18n("autofight"))

	arg_8_0.delayTween = {}
	arg_8_0.doEaseIn = true
end

local var_0_1 = 525
local var_0_2 = 373

function var_0_0.set(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0:cancelTween()

	local var_10_0 = getProxy(ChapterProxy):getChapterById(arg_10_1, true)

	arg_10_0.chapter = var_10_0
	arg_10_0.posStart = arg_10_2 or Vector3(0, 0, 0)

	local var_10_1 = getProxy(ChapterProxy):getMapById(var_10_0:getConfig("map"))
	local var_10_2 = var_10_0:getConfigTable()
	local var_10_3 = string.split(var_10_2.name, "|")
	local var_10_4 = var_10_0:getPlayType() == ChapterConst.TypeDefence

	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_10_4 and "title_print_defense" or "title_print", function(arg_11_0)
		if not IsNil(arg_10_0.titleBGDecoration) then
			arg_10_0.titleBGDecoration:GetComponent(typeof(Image)).sprite = arg_11_0
		end
	end)
	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_10_4 and "titlebar_bg_defense" or "titlebar_bg", function(arg_12_0)
		if not IsNil(arg_10_0.titleBG) then
			arg_10_0.titleBG:GetComponent(typeof(Image)).sprite = arg_12_0
		end
	end)
	setActive(arg_10_0.titleIcon, var_10_4)

	local var_10_5 = arg_10_0.progressBar.sizeDelta

	var_10_5.x = var_10_4 and var_0_2 or var_0_1
	arg_10_0.progressBar.sizeDelta = var_10_5

	setText(arg_10_0.txTitle:Find("title_index"), var_10_2.chapter_name .. "  ")
	setText(arg_10_0.txTitle:Find("title"), var_10_3[1])
	setText(arg_10_0.txTitle:Find("title_en"), var_10_3[2] or "")
	setActive(arg_10_0.txTitleHead, var_10_3[3] and #var_10_3[3] > 0)

	local var_10_6 = var_10_3[3] and #var_10_3[3] > 0 and arg_10_0.txTitleOriginPosY or arg_10_0.txTitleOriginPosY + 8

	setAnchoredPosition(arg_10_0.txTitle, {
		y = var_10_6
	})
	setText(arg_10_0.txTitleHead, var_10_3[3] or "")
	setText(arg_10_0.winCondDesc, i18n("text_win_condition") .. "：" .. i18n(var_10_0:getConfig("win_condition_display")))
	setText(arg_10_0.loseCondDesc, i18n("text_lose_condition") .. "：" .. i18n(var_10_0:getConfig("lose_condition_display")))
	setActive(arg_10_0.winCondAwardBtn, var_10_0:getPlayType() == ChapterConst.TypeDefence)

	if not var_10_0:existAchieve() then
		setActive(arg_10_0.passState, false)
		setActive(arg_10_0.progress, false)
		setActive(arg_10_0.trAchieves, false)
	else
		setActive(arg_10_0.passState, true)
		setActive(arg_10_0.progress, true)
		setActive(arg_10_0.trAchieves, true)

		arg_10_0.passState.localPosition = Vector3(-arg_10_0.passState.rect.width, 0, 0)

		local var_10_7 = var_10_0:hasMitigation()

		setActive(arg_10_0.passState, var_10_7)

		if var_10_7 then
			local var_10_8 = var_10_0:getRiskLevel()

			setImageSprite(arg_10_0.passState, GetSpriteFromAtlas("passstate", var_10_8), true)
		end

		setWidgetText(arg_10_0.progress, i18n("levelScene_threat_to_rule_out", ": "))
		table.insert(arg_10_0.delayTween, LeanTween.value(go(arg_10_0.progress), 0, var_10_0.progress, 0.5):setDelay(0.15):setOnUpdate(System.Action_float(function(arg_13_0)
			setSlider(arg_10_0.progress, 0, 100, arg_13_0)
			setText(arg_10_0.txProgress, math.floor(arg_13_0) .. "%")
		end)).uniqueId)
		arg_10_0.achieveList:align(#var_10_0.achieves)
		arg_10_0.achieveList:each(function(arg_14_0, arg_14_1)
			local var_14_0 = var_10_0.achieves[arg_14_0 + 1]
			local var_14_1 = findTF(arg_14_1, "desc")

			setText(var_14_1, ChapterConst.GetAchieveDesc(var_14_0.type, var_10_0))
			setTextColor(var_14_1, Color.white)
			setActive(findTF(arg_14_1, "star"), false)
			setActive(findTF(arg_14_1, "star_empty"), true)

			local var_14_2 = ChapterConst.IsAchieved(var_14_0)

			table.insert(arg_10_0.delayTween, LeanTween.delayedCall(0.15 + (arg_14_0 + 1) * 0.15, System.Action(function()
				if not IsNil(arg_14_1) then
					local var_15_0 = findTF(arg_14_1, "desc")

					setTextColor(var_15_0, var_14_2 and Color.yellow or Color.white)
					setActive(findTF(arg_14_1, "star"), var_14_2)
					setActive(findTF(arg_14_1, "star_empty"), not var_14_2)
				end
			end)).uniqueId)
		end)
	end

	setText(arg_10_0.txIntro, var_10_2.profiles)
	setText(arg_10_0.txCost, var_10_2.oil)

	if var_10_2.icon and var_10_2.icon[1] then
		setActive(arg_10_0.head.parent, true)
		setImageSprite(arg_10_0.head, LoadSprite("qicon/" .. var_10_2.icon[1]))
	else
		setActive(arg_10_0.head.parent, false)
	end

	arg_10_0.awards = var_0_0.getChapterAwards(arg_10_0.chapter)

	arg_10_0.dropList:align(#arg_10_0.awards)

	local var_10_9 = var_10_0:existLoop()

	setActive(arg_10_0.bottomExtra, var_10_9)

	if var_10_9 then
		local var_10_10 = var_10_0:canActivateLoop()
		local var_10_11 = "chapter_loop_flag_" .. var_10_0.id
		local var_10_12 = PlayerPrefs.GetInt(var_10_11, -1)
		local var_10_13 = (var_10_12 == 1 or var_10_12 == -1) and var_10_10
		local var_10_14 = #var_10_0:getConfig("use_oil_limit") > 0

		setActive(arg_10_0.loopOn, var_10_13)
		setActive(arg_10_0.loopOff, not var_10_13)
		setActive(arg_10_0.costLimitTip, var_10_14)
		onNextTick(function()
			Canvas.ForceUpdateCanvases()

			arg_10_0.layoutView.preferredWidth = var_10_13 and arg_10_0.rtViewContainer.rect.width or 0
		end)
		onButton(arg_10_0, arg_10_0.loopToggle, function()
			if not var_10_10 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_activate_loop_mode_failed"))

				return
			end

			local var_17_0 = not arg_10_0.loopOn.gameObject.activeSelf

			PlayerPrefs.SetInt(var_10_11, var_17_0 and 1 or 0)
			PlayerPrefs.Save()
			setActive(arg_10_0.loopOn, var_17_0)
			setActive(arg_10_0.loopOff, not var_17_0)

			local var_17_1 = 0
			local var_17_2 = 0

			if var_17_0 then
				var_17_2 = arg_10_0.rtViewContainer.rect.width
			else
				var_17_1 = arg_10_0.rtViewContainer.rect.width
			end

			if arg_10_0.LTid then
				LeanTween.cancel(arg_10_0.LTid)

				arg_10_0.LTid = nil
			end

			arg_10_0.LTid = LeanTween.value(var_17_1, var_17_2, 0.3):setOnUpdate(System.Action_float(function(arg_18_0)
				arg_10_0.layoutView.preferredWidth = arg_18_0
			end)):setOnComplete(System.Action(function()
				arg_10_0.LTid = nil
			end)).uniqueId
		end, SFX_PANEL)
		onButton(arg_10_0, arg_10_0.loopHelp, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("levelScene_loop_help_tip")
			})
		end)

		local var_10_15 = AutoBotCommand.autoBotSatisfied()
		local var_10_16 = "chapter_autofight_flag_" .. var_10_0.id
		local var_10_17 = var_10_15 and PlayerPrefs.GetInt(var_10_16, 1) == 1

		onToggle(arg_10_0, arg_10_0.autoFightToggle, function(arg_21_0)
			if arg_21_0 ~= var_10_17 then
				var_10_17 = arg_21_0

				PlayerPrefs.SetInt(var_10_16, var_10_17 and 1 or 0)
				PlayerPrefs.Save()
			end
		end, SFX_UI_TAG)
		triggerToggle(arg_10_0.autoFightToggle, var_10_17)
		setActive(arg_10_0.autoFightToggle, var_10_15)
	end

	onButton(arg_10_0, arg_10_0.btnConfirm, function()
		if getProxy(BayProxy):getShipCount() >= getProxy(PlayerProxy):getRawData():getMaxShipBag() then
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
		end

		if not arg_10_0.onConfirm then
			return
		end

		local var_22_0 = var_10_9 and arg_10_0.loopOn.gameObject.activeSelf and 1 or 0

		arg_10_0.onConfirm(arg_10_1, var_22_0)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_10_0, arg_10_0.btnConfirm_l, function()
		triggerButton(arg_10_0.btnConfirm)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_10_0, arg_10_0.btnCancel, function()
		if arg_10_0.onCancel then
			arg_10_0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0._tf:Find("bg"), function()
		if arg_10_0.onCancel then
			arg_10_0.onCancel()
		end
	end, SFX_CANCEL)

	if not var_10_0:getConfig("risk_levels") then
		local var_10_18 = {}
	end

	onButton(arg_10_0, arg_10_0.passState, function()
		if not var_10_0:hasMitigation() then
			return
		end

		local var_26_0 = i18n("level_risk_level_desc", var_10_0:getChapterState()) .. i18n("level_risk_level_mitigation_rate", var_10_0:getRemainPassCount(), var_10_0:getMitigationRate())

		if var_10_1:getMapType() == Map.ELITE then
			var_26_0 = var_26_0 .. "\n" .. i18n("level_diffcult_chapter_state_safety")
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = var_26_0
		})
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.head, function()
		triggerButton(arg_10_0.passState)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.winCondAwardBtn, function()
		arg_10_0:ShowChapterRewardPanel()
	end)
	setText(arg_10_0.descQuickPlay, i18n("desc_quick_play"))

	local var_10_19 = var_10_0:CanQuickPlay()

	setActive(arg_10_0.quickPlayGroup, var_10_19)

	if var_10_19 then
		local var_10_20 = "chapter_quickPlay_flag_" .. var_10_0.id
		local var_10_21 = PlayerPrefs.GetInt(var_10_20, 1)

		onToggle(arg_10_0, arg_10_0.toggleQuickPlay, function(arg_29_0)
			PlayerPrefs.SetInt(var_10_20, arg_29_0 and 1 or 0)
			PlayerPrefs.Save()
		end, SFX_PANEL)
		triggerToggle(arg_10_0.toggleQuickPlay, var_10_21 == 1)
	end

	if arg_10_0.doEaseIn then
		local var_10_22 = arg_10_0._tf:Find("panel")

		var_10_22.transform.localPosition = arg_10_0.posStart

		table.insert(arg_10_0.delayTween, LeanTween.move(var_10_22, Vector3.zero, 0.2).uniqueId)

		var_10_22.localScale = Vector3.zero

		table.insert(arg_10_0.delayTween, LeanTween.scale(var_10_22, Vector3(1, 1, 1), 0.2).uniqueId)
		table.insert(arg_10_0.delayTween, LeanTween.moveX(arg_10_0.passState, 0, 0.35):setEase(LeanTweenType.easeInOutSine):setDelay(0.3).uniqueId)
	end

	arg_10_0:UpdateChapterAutoBtn()
end

function var_0_0.UpdateChapterAutoBtn(arg_30_0)
	local var_30_0 = pg.chapter_auto_statistics[arg_30_0.chapter.id]
	local var_30_1 = ChapterAutoProxy.IsSystemOpen()

	setActive(arg_30_0.btnAuto, var_30_0)
	setActive(arg_30_0.btnConfirm, var_30_0)
	setActive(arg_30_0.btnConfirm_l, not var_30_0)

	if not var_30_0 then
		return
	end

	local var_30_2 = arg_30_0.chapter:isClear()
	local var_30_3 = getProxy(ChapterAutoProxy):GetRecord(ChapterAutoProxy.TYPE.SLG, arg_30_0.chapter.id)
	local var_30_4 = var_30_1 and var_30_2 and var_30_3 > 0

	setGray(arg_30_0.btnAuto, not var_30_4, true)
	onButton(arg_30_0, arg_30_0.btnAuto, function()
		if var_30_4 then
			arg_30_0:ShowChapterAutoPanel()
		elseif var_30_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_chapter_unlock_tip"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_unlock_tip"))
		end
	end, SFX_PANEL)
end

function var_0_0.cancelTween(arg_32_0)
	_.each(arg_32_0.delayTween, function(arg_33_0)
		LeanTween.cancel(arg_33_0)
	end)

	arg_32_0.delayTween = {}
end

function var_0_0.updateDrop(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	if arg_34_1 == UIItemList.EventUpdate then
		local var_34_0 = arg_34_0.awards[arg_34_2 + 1]
		local var_34_1 = Drop.Create(var_34_0)

		updateDrop(arg_34_3, var_34_1)
		onButton(arg_34_0, arg_34_3, function()
			if ({
				[99] = true
			})[var_34_1:getConfig("type")] then
				local function var_35_0(arg_36_0)
					local var_36_0 = var_34_1:getConfig("display_icon")
					local var_36_1 = {}

					for iter_36_0, iter_36_1 in ipairs(var_36_0) do
						local var_36_2 = iter_36_1[1]
						local var_36_3 = iter_36_1[2]
						local var_36_4 = var_36_2 == DROP_TYPE_SHIP and not table.contains(arg_36_0, var_36_3)

						var_36_1[#var_36_1 + 1] = {
							type = var_36_2,
							id = var_36_3,
							anonymous = var_36_4
						}
					end

					arg_34_0:emit(BaseUI.ON_DROP_LIST, {
						item2Row = true,
						itemList = var_36_1,
						content = var_34_1:getConfig("display")
					})
					arg_34_0:initTestShowDrop(var_34_1, Clone(var_36_1))
				end

				arg_34_0:emit(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, arg_34_0.chapter.id, var_35_0)
			else
				arg_34_0:emit(BaseUI.ON_DROP, var_34_1)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.getChapterAwards(arg_37_0)
	local var_37_0 = Clone(arg_37_0:getConfig("awards"))
	local var_37_1 = arg_37_0:getStageExtraAwards()

	if var_37_1 then
		for iter_37_0 = #var_37_1, 1, -1 do
			table.insert(var_37_0, 1, var_37_1[iter_37_0])
		end
	end

	local var_37_2 = {
		arg_37_0:getConfig("boss_expedition_id"),
		arg_37_0:getConfig("ai_expedition_list")
	}

	if arg_37_0:getPlayType() == ChapterConst.TypeMultiStageBoss then
		table.insert(var_37_2, pg.chapter_model_multistageboss[arg_37_0.id].boss_expedition_id)
	end

	local var_37_3 = _.flatten(var_37_2)
	local var_37_4 = {}
	local var_37_5 = {}

	local function var_37_6(arg_38_0)
		for iter_38_0, iter_38_1 in ipairs(var_37_4) do
			if iter_38_1 == arg_38_0 then
				return false
			end
		end

		return true
	end

	local var_37_7 = {}

	for iter_37_1, iter_37_2 in ipairs(var_37_3) do
		local var_37_8 = checkExist(pg.expedition_activity_template[iter_37_2], {
			"pt_drop_display"
		})

		if var_37_8 and type(var_37_8) == "table" then
			for iter_37_3, iter_37_4 in ipairs(var_37_8) do
				local var_37_9 = iter_37_4[1]
				local var_37_10 = iter_37_4[2]
				local var_37_11 = iter_37_4[3]

				if var_37_6(var_37_10) then
					table.insert(var_37_4, var_37_10)

					var_37_5[var_37_10] = {}
				end

				var_37_5[var_37_10][var_37_9] = true
				var_37_7[var_37_10] = var_37_7[var_37_10] or {}
				var_37_7[var_37_10][var_37_9] = var_37_11
			end
		end
	end

	local var_37_12 = getProxy(ActivityProxy)

	for iter_37_5 = #var_37_4, 1, -1 do
		for iter_37_6, iter_37_7 in pairs(var_37_5[var_37_4[iter_37_5]]) do
			local var_37_13 = var_37_12:getActivityById(iter_37_6)

			if var_37_13 and not var_37_13:isEnd() then
				table.insert(var_37_0, 1, {
					DROP_TYPE_ITEM,
					id2ItemId(var_37_4[iter_37_5]),
					var_37_7[var_37_4[iter_37_5]][iter_37_6]
				})

				break
			end
		end
	end

	return var_37_0
end

function var_0_0.initTestShowDrop(arg_39_0, arg_39_1, arg_39_2)
	if IsUnityEditor then
		local var_39_0 = pg.MsgboxMgr.GetInstance()._go
		local var_39_1 = var_39_0.transform:Find("button_test_show_drop")

		if IsNil(var_39_1) then
			var_39_1 = GameObject.New("button_test_show_drop")

			var_39_1:AddComponent(typeof(Button))
			var_39_1:AddComponent(typeof(RectTransform))
			var_39_1:AddComponent(typeof(Image))
		end

		local var_39_2 = var_39_1:GetComponent(typeof(RectTransform))

		var_39_2:SetParent(var_39_0.transform, false)

		var_39_2.anchoredPosition = Vector3(-239, 173, 0)
		var_39_2.sizeDelta = Vector2(40, 40)

		onButton(arg_39_0, var_39_2, function()
			_.each(arg_39_2, function(arg_41_0)
				arg_41_0.anonymous = false
			end)
			arg_39_0:emit(BaseUI.ON_DROP_LIST, {
				item2Row = true,
				itemList = arg_39_2,
				content = arg_39_1:getConfig("display")
			})
		end)
	end
end

function var_0_0.clearTestShowDrop(arg_42_0)
	if IsUnityEditor then
		local var_42_0 = pg.MsgboxMgr.GetInstance()._go.transform:Find("button_test_show_drop")

		if not IsNil(var_42_0) then
			Destroy(var_42_0)
		end
	end
end

function var_0_0.ShowChapterRewardPanel(arg_43_0)
	if arg_43_0.rewardPanel == nil then
		arg_43_0.rewardPanel = ChapterRewardPanel.New(arg_43_0._tf.parent, arg_43_0.event, arg_43_0.contextData)

		arg_43_0.rewardPanel:Load()
	end

	arg_43_0.rewardPanel:ActionInvoke("Enter", arg_43_0.chapter)
end

function var_0_0.ClearChapterRewardPanel(arg_44_0)
	if arg_44_0.rewardPanel ~= nil then
		arg_44_0.rewardPanel:Destroy()

		arg_44_0.rewardPanel = nil
	end
end

function var_0_0.ShowChapterAutoPanel(arg_45_0)
	if arg_45_0.autoPanel == nil then
		arg_45_0.autoPanel = ChapterAutoPanel.New(arg_45_0._tf, arg_45_0.event, arg_45_0.contextData)

		arg_45_0.autoPanel:Load()
	end

	arg_45_0.autoPanel:ActionInvoke("Enter", arg_45_0.chapter)
end

function var_0_0.RefreshChapterAutoPanel(arg_46_0)
	if arg_46_0.autoPanel and arg_46_0.autoPanel:isShowing() then
		arg_46_0.autoPanel:ActionInvoke("RefreshView")
	end
end

function var_0_0.ClearChapterAutoPanel(arg_47_0)
	if arg_47_0.autoPanel ~= nil then
		arg_47_0.autoPanel:Destroy()

		arg_47_0.autoPanel = nil
	end
end

function var_0_0.clear(arg_48_0)
	arg_48_0:cancelTween()
	arg_48_0.dropList:each(function(arg_49_0, arg_49_1)
		clearDrop(arg_49_1)
	end)
	arg_48_0:clearTestShowDrop()
	arg_48_0:ClearChapterRewardPanel()
	arg_48_0:ClearChapterAutoPanel()
end

return var_0_0
