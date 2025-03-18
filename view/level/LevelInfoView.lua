local var_0_0 = class("LevelInfoView", import("..base.BaseSubView"))

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
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.Hide(arg_5_0)
	arg_5_0:clear()
	setActive(arg_5_0._tf, false)
	pg.UIMgr.GetInstance():UnblurPanel(arg_5_0._tf, arg_5_0._parentTf)
end

function var_0_0.setCBFunc(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.onConfirm = arg_6_1
	arg_6_0.onCancel = arg_6_2
end

function var_0_0.InitUI(arg_7_0)
	arg_7_0.titleBG = arg_7_0:findTF("panel/title")
	arg_7_0.titleBGDecoration = arg_7_0:findTF("panel/title/Image")
	arg_7_0.titleIcon = arg_7_0:findTF("panel/title/icon")
	arg_7_0.txTitle = arg_7_0:findTF("panel/title_form")
	arg_7_0.txTitleOriginPosY = arg_7_0.txTitle.anchoredPosition.y
	arg_7_0.txTitleHead = arg_7_0:findTF("panel/title_head")

	setActive(arg_7_0.txTitleHead, false)

	arg_7_0.txIntro = arg_7_0:findTF("panel/intro")
	arg_7_0.txCost = arg_7_0:findTF("panel/cost/text")
	arg_7_0.progressBar = arg_7_0:findTF("panel/progress")
	arg_7_0.txProgress = arg_7_0:findTF("panel/progress/Text/value")
	arg_7_0.progress = arg_7_0:findTF("panel/progress")
	arg_7_0.head = arg_7_0:findTF("panel/head/Image")
	arg_7_0.trAchieveTpl = arg_7_0:findTF("panel/achieve")
	arg_7_0.trAchieves = arg_7_0:findTF("panel/achieves")
	arg_7_0.passStateMask = arg_7_0:findTF("panel/passState")
	arg_7_0.passState = arg_7_0:findTF("panel/passState/Image")

	setActive(arg_7_0.passState, true)

	arg_7_0.winCondDesc = arg_7_0:findTF("panel/win_conditions/desc")
	arg_7_0.winCondAwardBtn = arg_7_0:findTF("panel/win_conditions/icon")
	arg_7_0.loseCondDesc = arg_7_0:findTF("panel/lose_conditions/desc")
	arg_7_0.achieveList = UIItemList.New(arg_7_0.trAchieves, arg_7_0.trAchieveTpl)

	setActive(arg_7_0.trAchieveTpl, false)

	arg_7_0.trDropTpl = arg_7_0:findTF("panel/drops/frame/list/item")
	arg_7_0.trDrops = arg_7_0:findTF("panel/drops/frame/list")
	arg_7_0.dropList = UIItemList.New(arg_7_0.trDrops, arg_7_0.trDropTpl)

	arg_7_0.dropList:make(function(arg_8_0, arg_8_1, arg_8_2)
		arg_7_0:updateDrop(arg_8_0, arg_8_1, arg_8_2)
	end)
	setActive(arg_7_0.trDropTpl, false)

	arg_7_0.btnConfirm = arg_7_0:findTF("panel/start_button")
	arg_7_0.btnCancel = arg_7_0:findTF("panel/btnBack")
	arg_7_0.quickPlayGroup = arg_7_0:findTF("panel/quickPlay")
	arg_7_0.descQuickPlay = arg_7_0:findTF("desc", arg_7_0.quickPlayGroup)
	arg_7_0.toggleQuickPlay = arg_7_0.quickPlayGroup:GetComponent(typeof(Toggle))
	arg_7_0.bottomExtra = arg_7_0:findTF("panel/BottomExtra")
	arg_7_0.layoutView = GetComponent(arg_7_0.bottomExtra:Find("LoopGroup/view"), typeof(LayoutElement))
	arg_7_0.rtViewContainer = arg_7_0.bottomExtra:Find("LoopGroup/view/container")

	setText(arg_7_0.bottomExtra:Find("LoopGroup/Loop/Text"), i18n("autofight_farm"))

	arg_7_0.loopToggle = arg_7_0.bottomExtra:Find("LoopGroup/Loop/Toggle")
	arg_7_0.loopOn = arg_7_0.loopToggle:Find("on")
	arg_7_0.loopOff = arg_7_0.loopToggle:Find("off")
	arg_7_0.loopHelp = arg_7_0.bottomExtra:Find("ButtonHelp")
	arg_7_0.costLimitTip = arg_7_0.bottomExtra:Find("LoopGroup/view/container/CostLimit")

	setActive(arg_7_0.costLimitTip, false)

	arg_7_0.autoFightToggle = arg_7_0.bottomExtra:Find("LoopGroup/view/container/AutoFight")

	setText(arg_7_0.autoFightToggle:Find("Text"), i18n("autofight"))

	arg_7_0.delayTween = {}
end

local var_0_1 = 525
local var_0_2 = 373

function var_0_0.set(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:cancelTween()

	local var_9_0 = getProxy(ChapterProxy):getChapterById(arg_9_1, true)

	arg_9_0.chapter = var_9_0
	arg_9_0.posStart = arg_9_2 or Vector3(0, 0, 0)

	local var_9_1 = getProxy(ChapterProxy):getMapById(var_9_0:getConfig("map"))
	local var_9_2 = var_9_0:getConfigTable()
	local var_9_3 = string.split(var_9_2.name, "|")
	local var_9_4 = var_9_0:getPlayType() == ChapterConst.TypeDefence

	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_9_4 and "title_print_defense" or "title_print", function(arg_10_0)
		if not IsNil(arg_9_0.titleBGDecoration) then
			arg_9_0.titleBGDecoration:GetComponent(typeof(Image)).sprite = arg_10_0
		end
	end)
	GetSpriteFromAtlasAsync("ui/levelstageinfoview_atlas", var_9_4 and "titlebar_bg_defense" or "titlebar_bg", function(arg_11_0)
		if not IsNil(arg_9_0.titleBG) then
			arg_9_0.titleBG:GetComponent(typeof(Image)).sprite = arg_11_0
		end
	end)
	setActive(arg_9_0.titleIcon, var_9_4)

	local var_9_5 = arg_9_0.progressBar.sizeDelta

	var_9_5.x = var_9_4 and var_0_2 or var_0_1
	arg_9_0.progressBar.sizeDelta = var_9_5

	setText(arg_9_0:findTF("title_index", arg_9_0.txTitle), var_9_2.chapter_name .. "  ")
	setText(arg_9_0:findTF("title", arg_9_0.txTitle), var_9_3[1])
	setText(arg_9_0:findTF("title_en", arg_9_0.txTitle), var_9_3[2] or "")
	setActive(arg_9_0.txTitleHead, var_9_3[3] and #var_9_3[3] > 0)

	local var_9_6 = var_9_3[3] and #var_9_3[3] > 0 and arg_9_0.txTitleOriginPosY or arg_9_0.txTitleOriginPosY + 8

	setAnchoredPosition(arg_9_0.txTitle, {
		y = var_9_6
	})
	setText(arg_9_0.txTitleHead, var_9_3[3] or "")
	setText(arg_9_0.winCondDesc, i18n("text_win_condition") .. "：" .. i18n(var_9_0:getConfig("win_condition_display")))
	setText(arg_9_0.loseCondDesc, i18n("text_lose_condition") .. "：" .. i18n(var_9_0:getConfig("lose_condition_display")))
	setActive(arg_9_0.winCondAwardBtn, var_9_0:getPlayType() == ChapterConst.TypeDefence)

	if not var_9_0:existAchieve() then
		setActive(arg_9_0.passState, false)
		setActive(arg_9_0.progress, false)
		setActive(arg_9_0.trAchieves, false)
	else
		setActive(arg_9_0.passState, true)
		setActive(arg_9_0.progress, true)
		setActive(arg_9_0.trAchieves, true)

		arg_9_0.passState.localPosition = Vector3(-arg_9_0.passState.rect.width, 0, 0)

		local var_9_7 = var_9_0:hasMitigation()

		setActive(arg_9_0.passState, var_9_7)

		if var_9_7 then
			local var_9_8 = var_9_0:getRiskLevel()

			setImageSprite(arg_9_0.passState, GetSpriteFromAtlas("passstate", var_9_8), true)
		end

		setWidgetText(arg_9_0.progress, i18n("levelScene_threat_to_rule_out", ": "))
		table.insert(arg_9_0.delayTween, LeanTween.value(go(arg_9_0.progress), 0, var_9_0.progress, 0.5):setDelay(0.15):setOnUpdate(System.Action_float(function(arg_12_0)
			setSlider(arg_9_0.progress, 0, 100, arg_12_0)
			setText(arg_9_0.txProgress, math.floor(arg_12_0) .. "%")
		end)).uniqueId)
		arg_9_0.achieveList:align(#var_9_0.achieves)
		arg_9_0.achieveList:each(function(arg_13_0, arg_13_1)
			local var_13_0 = var_9_0.achieves[arg_13_0 + 1]
			local var_13_1 = findTF(arg_13_1, "desc")

			setText(var_13_1, ChapterConst.GetAchieveDesc(var_13_0.type, var_9_0))
			setTextColor(var_13_1, Color.white)
			setActive(findTF(arg_13_1, "star"), false)
			setActive(findTF(arg_13_1, "star_empty"), true)

			local var_13_2 = ChapterConst.IsAchieved(var_13_0)

			table.insert(arg_9_0.delayTween, LeanTween.delayedCall(0.15 + (arg_13_0 + 1) * 0.15, System.Action(function()
				if not IsNil(arg_13_1) then
					local var_14_0 = findTF(arg_13_1, "desc")

					setTextColor(var_14_0, var_13_2 and Color.yellow or Color.white)
					setActive(findTF(arg_13_1, "star"), var_13_2)
					setActive(findTF(arg_13_1, "star_empty"), not var_13_2)
				end
			end)).uniqueId)
		end)
	end

	setText(arg_9_0.txIntro, var_9_2.profiles)
	setText(arg_9_0.txCost, var_9_2.oil)

	if var_9_2.icon and var_9_2.icon[1] then
		setActive(arg_9_0.head.parent, true)
		setImageSprite(arg_9_0.head, LoadSprite("qicon/" .. var_9_2.icon[1]))
	else
		setActive(arg_9_0.head.parent, false)
	end

	arg_9_0.awards = arg_9_0:getChapterAwards()

	arg_9_0.dropList:align(#arg_9_0.awards)

	local var_9_9 = var_9_0:existLoop()

	setActive(arg_9_0.bottomExtra, var_9_9)

	if var_9_9 then
		local var_9_10 = var_9_0:canActivateLoop()
		local var_9_11 = "chapter_loop_flag_" .. var_9_0.id
		local var_9_12 = PlayerPrefs.GetInt(var_9_11, -1)
		local var_9_13 = (var_9_12 == 1 or var_9_12 == -1) and var_9_10
		local var_9_14 = #var_9_0:getConfig("use_oil_limit") > 0

		setActive(arg_9_0.loopOn, var_9_13)
		setActive(arg_9_0.loopOff, not var_9_13)
		setActive(arg_9_0.costLimitTip, var_9_14)
		onNextTick(function()
			Canvas.ForceUpdateCanvases()

			arg_9_0.layoutView.preferredWidth = var_9_13 and arg_9_0.rtViewContainer.rect.width or 0
		end)
		onButton(arg_9_0, arg_9_0.loopToggle, function()
			if not var_9_10 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_activate_loop_mode_failed"))

				return
			end

			local var_16_0 = not arg_9_0.loopOn.gameObject.activeSelf

			PlayerPrefs.SetInt(var_9_11, var_16_0 and 1 or 0)
			PlayerPrefs.Save()
			setActive(arg_9_0.loopOn, var_16_0)
			setActive(arg_9_0.loopOff, not var_16_0)

			local var_16_1 = 0
			local var_16_2 = 0

			if var_16_0 then
				var_16_2 = arg_9_0.rtViewContainer.rect.width
			else
				var_16_1 = arg_9_0.rtViewContainer.rect.width
			end

			if arg_9_0.LTid then
				LeanTween.cancel(arg_9_0.LTid)

				arg_9_0.LTid = nil
			end

			arg_9_0.LTid = LeanTween.value(var_16_1, var_16_2, 0.3):setOnUpdate(System.Action_float(function(arg_17_0)
				arg_9_0.layoutView.preferredWidth = arg_17_0
			end)):setOnComplete(System.Action(function()
				arg_9_0.LTid = nil
			end)).uniqueId
		end, SFX_PANEL)
		onButton(arg_9_0, arg_9_0.loopHelp, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("levelScene_loop_help_tip")
			})
		end)

		local var_9_15 = AutoBotCommand.autoBotSatisfied()
		local var_9_16 = "chapter_autofight_flag_" .. var_9_0.id
		local var_9_17 = var_9_15 and PlayerPrefs.GetInt(var_9_16, 1) == 1

		onToggle(arg_9_0, arg_9_0.autoFightToggle, function(arg_20_0)
			if arg_20_0 ~= var_9_17 then
				var_9_17 = arg_20_0

				PlayerPrefs.SetInt(var_9_16, var_9_17 and 1 or 0)
				PlayerPrefs.Save()
			end
		end, SFX_UI_TAG)
		triggerToggle(arg_9_0.autoFightToggle, var_9_17)
		setActive(arg_9_0.autoFightToggle, var_9_15)
	end

	onButton(arg_9_0, arg_9_0.btnConfirm, function()
		if getProxy(BayProxy):getShipCount() >= getProxy(PlayerProxy):getRawData():getMaxShipBag() then
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
		end

		if not arg_9_0.onConfirm then
			return
		end

		local var_21_0 = var_9_9 and arg_9_0.loopOn.gameObject.activeSelf and 1 or 0

		arg_9_0.onConfirm(arg_9_1, var_21_0)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_9_0, arg_9_0.btnCancel, function()
		if arg_9_0.onCancel then
			arg_9_0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0._tf:Find("bg"), function()
		if arg_9_0.onCancel then
			arg_9_0.onCancel()
		end
	end, SFX_CANCEL)

	if not var_9_0:getConfig("risk_levels") then
		local var_9_18 = {}
	end

	onButton(arg_9_0, arg_9_0.passState, function()
		if not var_9_0:hasMitigation() then
			return
		end

		local var_24_0 = i18n("level_risk_level_desc", var_9_0:getChapterState()) .. i18n("level_risk_level_mitigation_rate", var_9_0:getRemainPassCount(), var_9_0:getMitigationRate())

		if var_9_1:getMapType() == Map.ELITE then
			var_24_0 = var_24_0 .. "\n" .. i18n("level_diffcult_chapter_state_safety")
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = var_24_0
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.head, function()
		triggerButton(arg_9_0.passState)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.winCondAwardBtn, function()
		arg_9_0:ShowChapterRewardPanel()
	end)
	setText(arg_9_0.descQuickPlay, i18n("desc_quick_play"))

	local var_9_19 = var_9_0:CanQuickPlay()

	setActive(arg_9_0.quickPlayGroup, var_9_19)

	if var_9_19 then
		local var_9_20 = "chapter_quickPlay_flag_" .. var_9_0.id
		local var_9_21 = PlayerPrefs.GetInt(var_9_20, 1)

		onToggle(arg_9_0, arg_9_0.toggleQuickPlay, function(arg_27_0)
			PlayerPrefs.SetInt(var_9_20, arg_27_0 and 1 or 0)
			PlayerPrefs.Save()
		end, SFX_PANEL)
		triggerToggle(arg_9_0.toggleQuickPlay, var_9_21 == 1)
	end

	local var_9_22 = arg_9_0:findTF("panel")

	var_9_22.transform.localPosition = arg_9_0.posStart

	table.insert(arg_9_0.delayTween, LeanTween.move(var_9_22, Vector3.zero, 0.2).uniqueId)

	var_9_22.localScale = Vector3.zero

	table.insert(arg_9_0.delayTween, LeanTween.scale(var_9_22, Vector3(1, 1, 1), 0.2).uniqueId)
	table.insert(arg_9_0.delayTween, LeanTween.moveX(arg_9_0.passState, 0, 0.35):setEase(LeanTweenType.easeInOutSine):setDelay(0.3).uniqueId)
end

function var_0_0.cancelTween(arg_28_0)
	_.each(arg_28_0.delayTween, function(arg_29_0)
		LeanTween.cancel(arg_29_0)
	end)

	arg_28_0.delayTween = {}
end

function var_0_0.updateDrop(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	if arg_30_1 == UIItemList.EventUpdate then
		local var_30_0 = arg_30_0.awards[arg_30_2 + 1]
		local var_30_1 = Drop.Create(var_30_0)

		updateDrop(arg_30_3, var_30_1)
		onButton(arg_30_0, arg_30_3, function()
			if ({
				[99] = true
			})[var_30_1:getConfig("type")] then
				local function var_31_0(arg_32_0)
					local var_32_0 = var_30_1:getConfig("display_icon")
					local var_32_1 = {}

					for iter_32_0, iter_32_1 in ipairs(var_32_0) do
						local var_32_2 = iter_32_1[1]
						local var_32_3 = iter_32_1[2]
						local var_32_4 = var_32_2 == DROP_TYPE_SHIP and not table.contains(arg_32_0, var_32_3)

						var_32_1[#var_32_1 + 1] = {
							type = var_32_2,
							id = var_32_3,
							anonymous = var_32_4
						}
					end

					arg_30_0:emit(BaseUI.ON_DROP_LIST, {
						item2Row = true,
						itemList = var_32_1,
						content = var_30_1:getConfig("display")
					})
					arg_30_0:initTestShowDrop(var_30_1, Clone(var_32_1))
				end

				arg_30_0:emit(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, arg_30_0.chapter.id, var_31_0)
			else
				arg_30_0:emit(BaseUI.ON_DROP, var_30_1)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.getChapterAwards(arg_33_0)
	local var_33_0 = arg_33_0.chapter
	local var_33_1 = Clone(var_33_0:getConfig("awards"))
	local var_33_2 = var_33_0:getStageExtraAwards()

	if var_33_2 then
		for iter_33_0 = #var_33_2, 1, -1 do
			table.insert(var_33_1, 1, var_33_2[iter_33_0])
		end
	end

	local var_33_3 = {
		var_33_0:getConfig("boss_expedition_id"),
		var_33_0:getConfig("ai_expedition_list")
	}

	if var_33_0:getPlayType() == ChapterConst.TypeMultiStageBoss then
		table.insert(var_33_3, pg.chapter_model_multistageboss[var_33_0.id].boss_expedition_id)
	end

	local var_33_4 = _.flatten(var_33_3)
	local var_33_5 = {}
	local var_33_6 = {}

	local function var_33_7(arg_34_0)
		for iter_34_0, iter_34_1 in ipairs(var_33_5) do
			if iter_34_1 == arg_34_0 then
				return false
			end
		end

		return true
	end

	local var_33_8 = {}

	for iter_33_1, iter_33_2 in ipairs(var_33_4) do
		local var_33_9 = checkExist(pg.expedition_activity_template[iter_33_2], {
			"pt_drop_display"
		})

		if var_33_9 and type(var_33_9) == "table" then
			for iter_33_3, iter_33_4 in ipairs(var_33_9) do
				local var_33_10 = iter_33_4[1]
				local var_33_11 = iter_33_4[2]
				local var_33_12 = iter_33_4[3]

				if var_33_7(var_33_11) then
					table.insert(var_33_5, var_33_11)

					var_33_6[var_33_11] = {}
				end

				var_33_6[var_33_11][var_33_10] = true
				var_33_8[var_33_11] = var_33_8[var_33_11] or {}
				var_33_8[var_33_11][var_33_10] = var_33_12
			end
		end
	end

	local var_33_13 = getProxy(ActivityProxy)

	for iter_33_5 = #var_33_5, 1, -1 do
		for iter_33_6, iter_33_7 in pairs(var_33_6[var_33_5[iter_33_5]]) do
			local var_33_14 = var_33_13:getActivityById(iter_33_6)

			if var_33_14 and not var_33_14:isEnd() then
				table.insert(var_33_1, 1, {
					DROP_TYPE_ITEM,
					id2ItemId(var_33_5[iter_33_5]),
					var_33_8[var_33_5[iter_33_5]][iter_33_6]
				})

				break
			end
		end
	end

	return var_33_1
end

function var_0_0.initTestShowDrop(arg_35_0, arg_35_1, arg_35_2)
	if IsUnityEditor then
		local var_35_0 = pg.MsgboxMgr.GetInstance()._go
		local var_35_1 = var_35_0.transform:Find("button_test_show_drop")

		if IsNil(var_35_1) then
			var_35_1 = GameObject.New("button_test_show_drop")

			var_35_1:AddComponent(typeof(Button))
			var_35_1:AddComponent(typeof(RectTransform))
			var_35_1:AddComponent(typeof(Image))
		end

		local var_35_2 = var_35_1:GetComponent(typeof(RectTransform))

		var_35_2:SetParent(var_35_0.transform, false)

		var_35_2.anchoredPosition = Vector3(-239, 173, 0)
		var_35_2.sizeDelta = Vector2(40, 40)

		onButton(arg_35_0, var_35_2, function()
			_.each(arg_35_2, function(arg_37_0)
				arg_37_0.anonymous = false
			end)
			arg_35_0:emit(BaseUI.ON_DROP_LIST, {
				item2Row = true,
				itemList = arg_35_2,
				content = arg_35_1:getConfig("display")
			})
		end)
	end
end

function var_0_0.clearTestShowDrop(arg_38_0)
	if IsUnityEditor then
		local var_38_0 = pg.MsgboxMgr.GetInstance()._go.transform:Find("button_test_show_drop")

		if not IsNil(var_38_0) then
			Destroy(var_38_0)
		end
	end
end

function var_0_0.ShowChapterRewardPanel(arg_39_0)
	if arg_39_0.rewardPanel == nil then
		arg_39_0.rewardPanel = ChapterRewardPanel.New(arg_39_0._tf.parent, arg_39_0.event, arg_39_0.contextData)

		arg_39_0.rewardPanel:Load()
	end

	arg_39_0.rewardPanel:ActionInvoke("Enter", arg_39_0.chapter)
end

function var_0_0.ClearChapterRewardPanel(arg_40_0)
	if arg_40_0.rewardPanel ~= nil then
		arg_40_0.rewardPanel:Destroy()

		arg_40_0.rewardPanel = nil
	end
end

function var_0_0.clear(arg_41_0)
	arg_41_0:cancelTween()
	arg_41_0.dropList:each(function(arg_42_0, arg_42_1)
		clearDrop(arg_42_1)
	end)
	arg_41_0:clearTestShowDrop()
	arg_41_0:ClearChapterRewardPanel()
end

return var_0_0
