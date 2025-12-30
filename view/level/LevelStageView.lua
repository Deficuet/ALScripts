local var_0_0 = class("LevelStageView", import("..base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, ...)
	var_0_0.super.Ctor(arg_1_0, ...)

	arg_1_0.isFrozen = nil

	arg_1_0:bind(LevelUIConst.ON_FROZEN, function()
		arg_1_0.isFrozen = true

		if arg_1_0.cgComp then
			arg_1_0.cgComp.blocksRaycasts = false
		end
	end)
	arg_1_0:bind(LevelUIConst.ON_UNFROZEN, function()
		arg_1_0.isFrozen = nil

		if arg_1_0.cgComp then
			arg_1_0.cgComp.blocksRaycasts = true
		end
	end)

	arg_1_0.toastQueue = {}

	arg_1_0:bind(LevelUIConst.ADD_TOAST_QUEUE, function(arg_4_0, arg_4_1)
		table.insert(arg_1_0.toastQueue, arg_4_1)

		if #arg_1_0.toastQueue > 1 then
			return
		end

		arg_1_0:Toast()
	end)
end

function var_0_0.getUIName(arg_5_0)
	return "LevelStageView"
end

function var_0_0.OnInit(arg_6_0)
	arg_6_0:InitUI()
	arg_6_0:AddListener()

	arg_6_0.loader = AutoLoader.New()
	arg_6_0.cgComp = GetOrAddComponent(arg_6_0._go, typeof(CanvasGroup))
	arg_6_0.cgComp.blocksRaycasts = not arg_6_0.isFrozen

	arg_6_0:Show()
end

function var_0_0.OnDestroy(arg_7_0)
	if arg_7_0.stageTimer then
		arg_7_0.stageTimer:Stop()

		arg_7_0.stageTimer = nil
	end

	arg_7_0:ClearSubViews()
	arg_7_0:DestroyAutoFightPanel()
	arg_7_0:DestroyWinConditionPanel()
	arg_7_0:DestroyToast()
	arg_7_0.loader:Clear()
	arg_7_0:Hide()
end

local var_0_1 = -300

function var_0_0.InitUI(arg_8_0)
	arg_8_0.topStage = arg_8_0._tf:Find("top_stage")

	setActive(arg_8_0.topStage, true)

	arg_8_0.bottomStage = arg_8_0._tf:Find("bottom_stage")
	arg_8_0.normalRole = findTF(arg_8_0.bottomStage, "Normal")
	arg_8_0.funcBtn = arg_8_0.normalRole:Find("func_button")
	arg_8_0.retreatBtn = arg_8_0.normalRole:Find("retreat_button")
	arg_8_0.switchBtn = arg_8_0.normalRole:Find("switch_button")
	arg_8_0.helpBtn = arg_8_0.normalRole:Find("help_button")
	arg_8_0.shengfuBtn = arg_8_0.normalRole:Find("shengfu/shengfu_button")
	arg_8_0.actionRole = findTF(arg_8_0.bottomStage, "Action")
	arg_8_0.missileStrikeRole = findTF(arg_8_0.actionRole, "MissileStrike")
	arg_8_0.airExpelRole = findTF(arg_8_0.actionRole, "AirExpel")

	setActive(arg_8_0.bottomStage, true)
	setAnchoredPosition(arg_8_0.normalRole, {
		x = 0,
		y = 0
	})
	setActive(arg_8_0.normalRole, true)
	setAnchoredPosition(arg_8_0.actionRole, {
		x = 0,
		y = var_0_1
	})
	setActive(arg_8_0.actionRole, false)
	eachChild(arg_8_0.actionRole, function(arg_9_0)
		setActive(arg_9_0, false)
	end)

	arg_8_0.leftStage = arg_8_0._tf:Find("left_stage")

	setActive(arg_8_0.leftStage, true)

	arg_8_0.rightStage = arg_8_0._tf:Find("right_stage")
	arg_8_0.bombPanel = arg_8_0.rightStage:Find("bomb_panel")
	arg_8_0.panelBarrier = arg_8_0.rightStage:Find("panel_barrier")
	arg_8_0.strategyPanelAnimator = arg_8_0.rightStage:Find("event"):GetComponent(typeof(Animator))
	arg_8_0.autoBattleBtn = arg_8_0.rightStage:Find("event/collapse/lock_fleet")
	arg_8_0.showDetailBtn = arg_8_0.rightStage:Find("event/detail/show_detail")

	setActive(arg_8_0.panelBarrier, false)
	setActive(arg_8_0.rightStage, true)

	arg_8_0.airSupremacy = arg_8_0.topStage:Find("msg_panel/air_supremacy")

	setAnchoredPosition(arg_8_0.topStage, {
		y = arg_8_0.topStage.rect.height
	})
	setAnchoredPosition(arg_8_0.leftStage, {
		x = -arg_8_0.leftStage.rect.width - 200
	})
	setAnchoredPosition(arg_8_0.rightStage, {
		x = arg_8_0.rightStage.rect.width + 300
	})
	setAnchoredPosition(arg_8_0.bottomStage, {
		y = -arg_8_0.bottomStage.rect.height
	})

	arg_8_0.attachSubViews = {}
end

function var_0_0.AddListener(arg_10_0)
	arg_10_0:bind(LevelUIConst.TRIGGER_ACTION, function()
		arg_10_0:tryAutoTrigger()
	end)
	arg_10_0:bind(LevelUIConst.STRATEGY_PANEL_AUTOFIGHT_ACTIVE, function(arg_12_0, arg_12_1)
		arg_10_0.strategyPanelAnimator:SetBool("IsActive", arg_12_1)

		arg_10_0.bottomStageInactive = arg_12_1

		arg_10_0:ShiftBottomStage(not arg_12_1)
	end)
	arg_10_0:bind(LevelUIConst.ON_CLICK_GRID_QUAD, function(arg_13_0, arg_13_1)
		arg_10_0:ClickGridCellNormal(arg_13_1)
	end)
	onButton(arg_10_0, arg_10_0.topStage:Find("option"), function()
		arg_10_0:emit(BaseUI.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.topStage:Find("back_button"), function()
		arg_10_0:emit(LevelUIConst.SWITCH_TO_MAP)
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.retreatBtn, function()
		local var_16_0 = arg_10_0.contextData.chapterVO
		local var_16_1 = arg_10_0.contextData.map
		local var_16_2 = "levelScene_whether_to_retreat"

		if var_16_0:existOni() then
			var_16_2 = "levelScene_oni_retreat"
		elseif var_16_0:isPlayingWithBombEnemy() then
			var_16_2 = "levelScene_bomb_retreat"
		elseif var_16_0:getPlayType() == ChapterConst.TypeTransport and not var_16_1:isSkirmish() then
			var_16_2 = "levelScene_escort_retreat"
		elseif var_16_1:isRemaster() then
			var_16_2 = "archives_whether_to_retreat"
		end

		arg_10_0:HandleShowMsgBox({
			content = i18n(var_16_2),
			onYes = ChapterOpCommand.PrepareChapterRetreat
		})
	end, SFX_UI_WEIGHANCHOR_WITHDRAW)
	onButton(arg_10_0, arg_10_0.switchBtn, function()
		local var_17_0 = arg_10_0.contextData.chapterVO
		local var_17_1 = var_17_0:getNextValidIndex()

		if var_17_1 > 0 then
			arg_10_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpSwitch,
				id = var_17_0.fleets[var_17_1].id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("formation_switch_failed"))
		end
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.autoBattleBtn, function()
		local var_18_0 = getProxy(ChapterProxy)
		local var_18_1 = var_18_0:GetSkipPrecombat()

		var_18_0:UpdateSkipPrecombat(not var_18_1)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.showDetailBtn, function()
		arg_10_0._showStrategyDetail = not arg_10_0._showStrategyDetail and true

		arg_10_0:updateStageStrategy()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.funcBtn, function()
		local var_20_0 = arg_10_0.contextData.chapterVO

		if not var_20_0:inWartime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_time_out"))

			return
		end

		local var_20_1 = var_20_0.fleet
		local var_20_2 = var_20_1.line
		local var_20_3 = var_20_0:getChapterCell(var_20_2.row, var_20_2.column)
		local var_20_4 = false

		local function var_20_5(arg_21_0)
			local var_21_0 = arg_21_0.attachmentId

			return pg.expedition_data_template[var_21_0].dungeon_id > 0
		end

		if var_20_0:existVisibleChampion(var_20_2.row, var_20_2.column) then
			var_20_4 = true

			local var_20_6 = var_20_0:getChampion(var_20_2.row, var_20_2.column)

			if chapter_skip_battle == 1 and pg.SdkMgr.GetInstance():CheckPretest() then
				arg_10_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = var_20_1.id
				})
			elseif not var_20_5(var_20_6) then
				arg_10_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpPreClear,
					id = var_20_1.id
				})
			elseif var_20_0:IsSkipPrecombat() then
				arg_10_0:emit(LevelMediator2.ON_START)
			else
				arg_10_0:emit(LevelMediator2.ON_STAGE)
			end
		elseif var_20_3.attachment == ChapterConst.AttachAmbush and var_20_3.flag == ChapterConst.CellFlagAmbush then
			local var_20_7

			var_20_7 = coroutine.wrap(function()
				arg_10_0:emit(LevelUIConst.DO_AMBUSH_WARNING, var_20_7)
				coroutine.yield()
				arg_10_0:emit(LevelUIConst.DISPLAY_AMBUSH_INFO, var_20_7)
				coroutine.yield()
			end)

			var_20_7()

			var_20_4 = true
		elseif ChapterConst.IsEnemyAttach(var_20_3.attachment) then
			if var_20_3.flag == ChapterConst.CellFlagActive then
				var_20_4 = true

				if chapter_skip_battle == 1 and pg.SdkMgr.GetInstance():CheckPretest() then
					arg_10_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpSkipBattle,
						id = var_20_1.id
					})
				elseif not var_20_5(var_20_3) then
					arg_10_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpPreClear,
						id = var_20_1.id
					})
				elseif var_20_0:IsSkipPrecombat() then
					arg_10_0:emit(LevelMediator2.ON_START)
				else
					arg_10_0:emit(LevelMediator2.ON_STAGE)
				end
			end
		elseif var_20_3.attachment == ChapterConst.AttachBox then
			if var_20_3.flag == ChapterConst.CellFlagActive then
				var_20_4 = true

				arg_10_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBox,
					id = var_20_1.id
				})
			end
		elseif var_20_3.attachment == ChapterConst.AttachSupply and var_20_3.attachmentId > 0 then
			var_20_4 = true

			local var_20_8, var_20_9 = var_20_0:getFleetAmmo(var_20_0.fleet)

			if var_20_9 < var_20_8 then
				arg_10_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSupply,
					id = var_20_1.id
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_enough"))
			end
		elseif var_20_3.attachment == ChapterConst.AttachStory then
			var_20_4 = true

			local var_20_10 = pg.map_event_template[var_20_3.attachmentId].memory
			local var_20_11 = pg.map_event_template[var_20_3.attachmentId].gametip

			if var_20_10 == 0 then
				return
			end

			local var_20_12 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_20_10)

			pg.ConnectionMgr.GetInstance():Send(11017, {
				story_id = var_20_10
			}, 11018, function(arg_23_0)
				return
			end)
			pg.NewStoryMgr.GetInstance():Play(var_20_12, function(arg_24_0, arg_24_1)
				local var_24_0 = arg_24_1 or 1

				if var_20_3.flag == ChapterConst.CellFlagActive then
					arg_10_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpStory,
						id = var_20_1.id,
						arg1 = var_24_0
					})
				end

				if var_20_11 ~= "" then
					local var_24_1

					for iter_24_0, iter_24_1 in ipairs(pg.memory_template.all) do
						local var_24_2 = pg.memory_template[iter_24_1]

						if table.contains(var_24_2.unlock_pre, var_20_12) then
							var_24_1 = var_24_2.title
						end
					end

					pg.TipsMgr.GetInstance():ShowTips(i18n(var_20_11, var_24_1))
				end
			end)
		end

		if not var_20_4 then
			if var_20_0:getRound() == ChapterConst.RoundEnemy then
				arg_10_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("level_click_to_move"))
			end
		end
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.helpBtn, function()
		local var_25_0 = arg_10_0.contextData.chapterVO

		if var_25_0 then
			if var_25_0:existOni() then
				arg_10_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("levelScene_sphunt_help_tip")
				})
			elseif var_25_0:isTypeDefence() then
				arg_10_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("help_battle_defense")
				})
			elseif var_25_0:isPlayingWithBombEnemy() then
				arg_10_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("levelScene_bomb_help_tip")
				})
			elseif pg.map_event_list[var_25_0.id] and pg.map_event_list[var_25_0.id].help_pictures and next(pg.map_event_list[var_25_0.id].help_pictures) ~= nil then
				local var_25_1 = {
					disableScroll = true,
					pageMode = true,
					ImageMode = true,
					defaultpage = 1,
					windowSize = {
						x = 1263,
						y = 873
					},
					windowPos = {
						y = -70
					},
					helpSize = {
						x = 1176,
						y = 1024
					}
				}

				for iter_25_0, iter_25_1 in pairs(pg.map_event_list[var_25_0.id].help_pictures) do
					table.insert(var_25_1, {
						icon = {
							path = "",
							atlas = iter_25_1
						}
					})
				end

				arg_10_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = var_25_1
				})
			else
				arg_10_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = pg.gametip.help_level_ui.tip
				})
			end
		end
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.airSupremacy, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(arg_10_0, arg_10_0.shengfuBtn, function()
		arg_10_0:DisplayWinConditionPanel()
	end)
end

function var_0_0.SetSeriesOperation(arg_28_0, arg_28_1)
	arg_28_0.seriesOperation = arg_28_1
end

function var_0_0.SetGrid(arg_29_0, arg_29_1)
	arg_29_0.grid = arg_29_1
end

function var_0_0.SetPlayer(arg_30_0, arg_30_1)
	return
end

function var_0_0.SwitchToChapter(arg_31_0, arg_31_1)
	local var_31_0 = findTF(arg_31_0.topStage, "msg_panel/ambush")
	local var_31_1 = findTF(arg_31_0.rightStage, "target")
	local var_31_2 = findTF(arg_31_0.rightStage, "skip_events")

	setActive(var_31_0, arg_31_1:existAmbush())
	setActive(arg_31_0.airSupremacy, OPEN_AIR_DOMINANCE and arg_31_1:getConfig("air_dominance") > 0)

	local var_31_3 = arg_31_1:isLoop()

	setActive(arg_31_0.autoBattleBtn, var_31_3)

	if var_31_3 then
		arg_31_0:UpdateSkipPreCombatMark()
		arg_31_0:UpdateAutoFightPanel()
		arg_31_0:UpdateAutoFightMark()
	end

	arg_31_0.achieveOriginalY = -240

	setText(var_31_2:Find("Label"), i18n("map_event_skip"))

	local var_31_4 = "skip_events_on_" .. arg_31_1.id

	if arg_31_1:getConfig("event_skip") == 1 then
		if arg_31_1.progress > 0 or arg_31_1.defeatCount > 0 or arg_31_1.passCount > 0 then
			setActive(var_31_2, true)

			var_31_1.anchoredPosition = Vector2.New(var_31_1.anchoredPosition.x, arg_31_0.achieveOriginalY - 40)
			GetComponent(var_31_2, typeof(Toggle)).isOn = PlayerPrefs.GetInt(var_31_4, 1) == 1

			onToggle(arg_31_0, var_31_2, function(arg_32_0)
				PlayerPrefs.SetInt(var_31_4, arg_32_0 and 1 or 0)
			end)
		else
			setActive(var_31_2, false)

			if not PlayerPrefs.HasKey(var_31_4) then
				PlayerPrefs.SetInt(var_31_4, 0)
			end
		end
	else
		setActive(var_31_2, false)

		var_31_1.anchoredPosition = Vector2.New(var_31_1.anchoredPosition.x, arg_31_0.achieveOriginalY)
	end

	setActive(var_31_1, arg_31_1:existAchieve())
	setActive(arg_31_0.retreatBtn, true)
	arg_31_0.seriesOperation()
end

function var_0_0.SwitchToMap(arg_33_0)
	arg_33_0:DestroyAutoFightPanel()
end

function var_0_0.UpdateSkipPreCombatMark(arg_34_0)
	local var_34_0 = getProxy(ChapterProxy):GetSkipPrecombat() and "auto_battle_on" or "auto_battle_off"

	arg_34_0.loader:GetOffSpriteRequest(arg_34_0.autoBattleBtn)
	arg_34_0.loader:GetSprite("ui/levelstageview_atlas", var_34_0, arg_34_0.autoBattleBtn, true)
end

function var_0_0.updateStageInfo(arg_35_0)
	local var_35_0 = arg_35_0.contextData.chapterVO
	local var_35_1 = findTF(arg_35_0.topStage, "timer")
	local var_35_2 = findTF(arg_35_0.topStage, "unlimit")

	setWidgetText(var_35_1, "--:--:--")

	if arg_35_0.stageTimer then
		arg_35_0.stageTimer:Stop()
	end

	if var_35_0:getRemainTime() > var_35_0:getConfig("time") or var_35_0:getConfig("time") >= 8640000 then
		setActive(var_35_1, false)
		setActive(var_35_2, true)
	else
		setActive(var_35_1, true)
		setActive(var_35_2, false)

		arg_35_0.stageTimer = Timer.New(function()
			if IsNil(var_35_1) then
				return
			end

			local var_36_0 = var_35_0:getRemainTime()

			setWidgetText(var_35_1, pg.TimeMgr.GetInstance():DescCDTime(var_36_0))
		end, 1, -1)

		arg_35_0.stageTimer:Start()
		arg_35_0.stageTimer.func()
	end
end

function var_0_0.updateAmbushRate(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0.contextData.chapterVO

	if not var_37_0:existAmbush() then
		return
	end

	local var_37_1 = var_37_0.fleet
	local var_37_2 = var_37_1:getInvestSums()
	local var_37_3 = findTF(arg_37_0.topStage, "msg_panel/ambush/label1")
	local var_37_4 = findTF(arg_37_0.topStage, "msg_panel/ambush/label2")
	local var_37_5 = findTF(arg_37_0.topStage, "msg_panel/ambush/value1")
	local var_37_6 = findTF(arg_37_0.topStage, "msg_panel/ambush/value2")

	setText(var_37_3, i18n("level_scene_title_word_1"))
	setText(var_37_5, math.floor(var_37_2))
	setText(var_37_4, i18n("level_scene_title_word_2"))

	if not var_37_0.activateAmbush then
		setText(var_37_6, i18n("ambush_display_none"))
		setTextColor(var_37_6, Color.New(0.4, 0.4, 0.4))
	else
		local var_37_7 = var_37_0:getAmbushRate(var_37_1, arg_37_1)
		local var_37_8, var_37_9 = ChapterConst.GetAmbushDisplay((not arg_37_2 or not var_37_0:existEnemy(ChapterConst.SubjectPlayer, arg_37_1.row, arg_37_1.column)) and var_37_7)

		setText(var_37_6, var_37_8)
		setTextColor(var_37_6, var_37_9)
	end
end

function var_0_0.updateStageAchieve(arg_38_0)
	local var_38_0 = arg_38_0.contextData.chapterVO

	if not var_38_0:existAchieve() then
		return
	end

	local var_38_1 = var_38_0.achieves
	local var_38_2 = findTF(arg_38_0.rightStage, "target")

	setActive(var_38_2, true)

	local var_38_3 = findTF(var_38_2, "detail")
	local var_38_4 = findTF(var_38_3, "achieve")
	local var_38_5 = findTF(var_38_3, "achieves")
	local var_38_6 = findTF(var_38_3, "click")
	local var_38_7 = findTF(var_38_2, "collapse")
	local var_38_8 = findTF(var_38_7, "star")
	local var_38_9 = findTF(var_38_7, "stars")

	setActive(var_38_4, false)
	setActive(var_38_8, false)
	removeAllChildren(var_38_5)
	removeAllChildren(var_38_9)

	for iter_38_0, iter_38_1 in ipairs(var_38_1) do
		local var_38_10 = cloneTplTo(var_38_4, var_38_5)
		local var_38_11 = ChapterConst.IsAchieved(iter_38_1)

		setActive(findTF(var_38_10, "star"), var_38_11)

		local var_38_12 = findTF(var_38_10, "desc")

		setText(var_38_12, ChapterConst.GetAchieveDesc(iter_38_1.type, var_38_0))
		setTextColor(var_38_12, var_38_11 and Color.yellow or Color.white)

		cloneTplTo(var_38_8, var_38_9):GetComponent(typeof(Image)).enabled = var_38_11
	end

	onButton(arg_38_0, var_38_6, function()
		shiftPanel(var_38_3, var_38_3.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_38_7, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(arg_38_0, var_38_7, function()
		shiftPanel(var_38_3, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_38_7, var_38_7.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)

	if not arg_38_0.isAchieveFirstInit then
		arg_38_0.isAchieveFirstInit = true

		triggerButton(var_38_6)
	end
end

function var_0_0.updateStageBarrier(arg_41_0)
	local var_41_0 = arg_41_0.contextData.chapterVO

	setActive(arg_41_0.panelBarrier, var_41_0:existOni())

	if not var_41_0:existOni() then
		return
	end

	local var_41_1 = arg_41_0.panelBarrier:Find("btn_barrier")

	setText(var_41_1:Find("nums"), var_41_0.modelCount)
	onButton(arg_41_0, var_41_1, function()
		if arg_41_0.grid.quadState == ChapterConst.QuadStateBarrierSetting then
			arg_41_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)

			return
		end

		arg_41_0.grid:updateQuadCells(ChapterConst.QuadStateBarrierSetting)
	end, SFX_PANEL)
end

function var_0_0.updateBombPanel(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0.contextData.chapterVO

	setActive(arg_43_0.bombPanel, var_43_0:isPlayingWithBombEnemy())

	if var_43_0:isPlayingWithBombEnemy() then
		setText(arg_43_0.bombPanel:Find("tx_step"), var_43_0:getBombChapterInfo().action_times - math.floor(var_43_0.roundIndex / 2))

		local var_43_1 = arg_43_0.bombPanel:Find("tx_score")
		local var_43_2 = tonumber(getText(var_43_1))
		local var_43_3 = var_43_0.modelCount

		LeanTween.cancel(go(var_43_1))

		if arg_43_1 and var_43_2 ~= var_43_3 then
			LeanTween.scale(go(var_43_1), Vector3(1.5, 1.5, 1), 0.2)

			local var_43_4 = (var_43_3 - var_43_2) * 0.1

			LeanTween.value(go(var_43_1), var_43_2, var_43_3, var_43_4):setOnUpdate(System.Action_float(function(arg_44_0)
				setText(var_43_1, math.floor(arg_44_0))
			end)):setOnComplete(System.Action(function()
				setText(var_43_1, var_43_3)
			end)):setEase(LeanTweenType.easeInOutSine):setDelay(0.2)
			LeanTween.scale(go(var_43_1), Vector3.one, 0.3):setDelay(1 + var_43_4)
		else
			var_43_1.localScale = Vector3.one

			setText(var_43_1, var_43_3)
		end
	end
end

function var_0_0.updateFleetBuff(arg_46_0)
	local var_46_0 = arg_46_0.contextData.chapterVO
	local var_46_1 = var_46_0.fleet
	local var_46_2 = var_46_0:GetShowingStrategies()

	if var_46_0:getChapterSupportFleet() then
		table.insert(var_46_2, ChapterConst.StrategyAirSupportFriendly)
	end

	local var_46_3 = {}
	local var_46_4 = var_46_0:GetSubmarineFleet()

	if var_46_4 then
		local var_46_5 = _.filter(var_46_4:getStrategies(), function(arg_47_0)
			return pg.strategy_data_template[arg_47_0.id].type == ChapterConst.StgTypePassive and arg_47_0.count > 0
		end)

		if var_46_5 and #var_46_5 > 0 then
			_.each(var_46_5, function(arg_48_0)
				table.insert(var_46_3, {
					id = arg_48_0.id,
					count = arg_48_0.count
				})
			end)
		end
	end

	local var_46_6 = var_46_0:GetWeather()
	local var_46_7 = 0

	if var_46_0:ExistDivingChampion() then
		var_46_7 = 1
	end

	local var_46_8 = _.map(_.values(var_46_1:getCommanders()), function(arg_49_0)
		return arg_49_0:getSkills()[1]
	end)
	local var_46_9 = findTF(arg_46_0.topStage, "icon_list/fleet_buffs")
	local var_46_10 = UIItemList.New(var_46_9, var_46_9:GetChild(0))

	var_46_10:make(function(arg_50_0, arg_50_1, arg_50_2)
		setActive(findTF(arg_50_2, "frame"), false)
		setActive(findTF(arg_50_2, "Text"), false)
		setActive(findTF(arg_50_2, "times"), false)

		if arg_50_0 == UIItemList.EventUpdate then
			local var_50_0 = GetComponent(arg_50_2, typeof(LayoutElement))

			var_50_0.preferredWidth = 64
			var_50_0.preferredHeight = 64

			if arg_50_1 + 1 <= #var_46_2 then
				local var_50_1 = var_46_2[arg_50_1 + 1]
				local var_50_2 = pg.strategy_data_template[var_50_1]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_50_2.icon, "", arg_50_2)

				local var_50_3

				if var_50_2.type == ChapterConst.StgTypeBindFleetPassive then
					var_50_3 = var_46_1:GetStrategyCount(var_50_1)

					setActive(findTF(arg_50_2, "times"), true)
					setText(findTF(arg_50_2, "times"), var_50_3)
				end

				local var_50_4 = var_50_2.iconSize

				if var_50_4 ~= "" then
					var_50_0.preferredWidth = var_50_4[1]
					var_50_0.preferredHeight = var_50_4[2]
				end

				onButton(arg_46_0, arg_50_2, function()
					arg_46_0:HandleShowMsgBox({
						iconPreservedAspect = true,
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = var_50_2.id,
							cfg = var_50_2,
							count = var_50_3
						}
					})
				end, SFX_PANEL)

				return
			end

			arg_50_1 = arg_50_1 - #var_46_2

			if arg_50_1 + 1 <= #var_46_6 then
				local var_50_5 = pg.weather_data_template[var_46_6[arg_50_1 + 1]]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_50_5.buff_icon, "", arg_50_2)
				onButton(arg_46_0, arg_50_2, function()
					arg_46_0:HandleShowMsgBox({
						hideNo = true,
						type = MSGBOX_TYPE_DROP_ITEM,
						name = var_50_5.name,
						content = var_50_5.buff_desc,
						iconPath = {
							"strategyicon/" .. var_50_5.buff_icon
						},
						yesText = pg.MsgboxMgr.TEXT_CONFIRM
					})
				end, SFX_PANEL)

				return
			end

			arg_50_1 = arg_50_1 - #var_46_6

			if arg_50_1 + 1 <= #var_46_3 then
				local var_50_6 = var_46_3[arg_50_1 + 1]
				local var_50_7 = pg.strategy_data_template[var_50_6.id]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_50_7.icon, "", arg_50_2)
				setActive(findTF(arg_50_2, "times"), true)
				setText(findTF(arg_50_2, "times"), var_50_6.count)
				onButton(arg_46_0, arg_50_2, function()
					arg_46_0:HandleShowMsgBox({
						iconPreservedAspect = true,
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = var_50_7.id,
							cfg = var_50_7
						},
						extendDesc = string.format(i18n("word_rest_times"), var_50_6.count)
					})
				end, SFX_PANEL)

				return
			end

			arg_50_1 = arg_50_1 - #var_46_3

			if arg_50_1 + 1 <= var_46_7 then
				GetImageSpriteFromAtlasAsync("strategyicon/submarine_approach", "", arg_50_2)
				onButton(arg_46_0, arg_50_2, function()
					arg_46_0:HandleShowMsgBox({
						hideNo = true,
						yesText = "text_confirm",
						type = MSGBOX_TYPE_DROP_ITEM,
						name = i18n("submarine_approach"),
						content = i18n("submarine_approach_desc"),
						iconPath = {
							"strategyicon/submarine_approach"
						}
					})
				end, SFX_PANEL)

				return
			end

			arg_50_1 = arg_50_1 - var_46_7

			local var_50_8 = var_46_8[arg_50_1 + 1]

			GetImageSpriteFromAtlasAsync("commanderskillicon/" .. var_50_8:getConfig("icon"), "", arg_50_2)
			setText(findTF(arg_50_2, "Text"), "Lv." .. var_50_8:getConfig("lv"))
			setActive(findTF(arg_50_2, "Text"), true)
			setActive(findTF(arg_50_2, "frame"), true)
			onButton(arg_46_0, arg_50_2, function()
				arg_46_0:emit(LevelMediator2.ON_COMMANDER_SKILL, var_50_8)
			end, SFX_PANEL)
		end
	end)
	var_46_10:align(#var_46_2 + #var_46_3 + #var_46_6 + var_46_7 + #var_46_8)

	if OPEN_AIR_DOMINANCE and var_46_0:getConfig("air_dominance") > 0 then
		arg_46_0:updateAirDominance()
	end

	arg_46_0:updateEnemyCount()
	arg_46_0:updateChapterBuff()
end

function var_0_0.updateEnemyCount(arg_56_0)
	local var_56_0 = arg_56_0.contextData.chapterVO
	local var_56_1 = findTF(arg_56_0.topStage, "icon_list/enemy_count")
	local var_56_2 = tobool(underscore.detect(var_56_0.achieves, function(arg_57_0)
		return (arg_57_0.type == ChapterConst.AchieveType3 or arg_57_0.type == ChapterConst.AchieveType6) and not ChapterConst.IsAchieved(arg_57_0)
	end))

	setActive(var_56_1, var_56_2)

	if var_56_2 then
		local var_56_3 = var_56_0:getDisplayEnemyCount()

		setText(var_56_1:Find("Text"), var_56_3)
		GetImageSpriteFromAtlasAsync("enemycount", var_56_3 > 0 and "danger" or "safe", var_56_1)
		onButton(arg_56_0, var_56_1, function()
			if var_56_3 > 0 then
				arg_56_0:HandleShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_DROP_ITEM,
					name = i18n("star_require_enemy_title"),
					content = i18n("star_require_enemy_text", var_56_3),
					iconPath = {
						"enemycount",
						"danger"
					},
					yesText = i18n("star_require_enemy_check"),
					onYes = function()
						local var_59_0 = var_56_0:getNearestEnemyCell()

						arg_56_0.grid:focusOnCell(var_59_0)

						local var_59_1 = arg_56_0.grid:GetEnemyCellView(var_59_0)

						if var_59_1 and var_59_1.TweenShining then
							var_59_1:TweenShining(2)
						end
					end
				})
			else
				arg_56_0:HandleShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_DROP_ITEM,
					name = i18n("star_require_enemy_title"),
					content = i18n("star_require_enemy_text", var_56_3),
					iconPath = {
						"enemycount",
						"safe"
					}
				})
			end
		end, SFX_PANEL)
	end
end

function var_0_0.updateChapterBuff(arg_60_0)
	local var_60_0 = arg_60_0.contextData.chapterVO
	local var_60_1 = findTF(arg_60_0.topStage, "icon_list/chapter_buff")
	local var_60_2 = var_60_0:hasMitigation()

	SetActive(var_60_1, var_60_2)

	if var_60_2 then
		local var_60_3 = var_60_0:getRiskLevel()

		GetImageSpriteFromAtlasAsync("passstate", var_60_3 .. "_icon", var_60_1)
		onButton(arg_60_0, var_60_1, function()
			if not var_60_0:hasMitigation() then
				return
			end

			arg_60_0:HandleShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_DROP_ITEM,
				name = var_60_0:getChapterState(),
				iconPath = {
					"passstate",
					var_60_3 .. "_icon"
				},
				content = i18n("level_risk_level_mitigation_rate", var_60_0:getRemainPassCount(), var_60_0:getMitigationRate())
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateAirDominance(arg_62_0)
	local var_62_0, var_62_1, var_62_2 = arg_62_0.contextData.chapterVO:getAirDominanceValue()

	if not var_62_2 or var_62_2 ~= var_62_1 then
		arg_62_0.contextData.chapterVO:setAirDominanceStatus(var_62_1)
		getProxy(ChapterProxy):updateChapter(arg_62_0.contextData.chapterVO)
	end

	arg_62_0.isChange = var_62_2 and (var_62_1 == 0 and 3 or var_62_1) - (var_62_2 == 0 and 3 or var_62_2)

	arg_62_0:updateAirDominanceTitle(var_62_0, var_62_1, arg_62_0.isChange or 0)
end

function var_0_0.updateAirDominanceTitle(arg_63_0, arg_63_1, arg_63_2, arg_63_3)
	local var_63_0 = findTF(arg_63_0.airSupremacy, "label1")
	local var_63_1 = findTF(arg_63_0.airSupremacy, "label2")
	local var_63_2 = findTF(arg_63_0.airSupremacy, "value1")
	local var_63_3 = findTF(arg_63_0.airSupremacy, "value2")
	local var_63_4 = findTF(arg_63_0.airSupremacy, "up")
	local var_63_5 = findTF(arg_63_0.airSupremacy, "down")

	setText(var_63_0, i18n("level_scene_title_word_3"))
	setText(var_63_1, i18n("level_scene_title_word_4"))
	setText(var_63_2, math.floor(arg_63_1))
	setActive(var_63_4, false)
	setActive(var_63_5, false)

	if arg_63_3 ~= 0 then
		if LeanTween.isTweening(go(var_63_3)) then
			LeanTween.cancel(go(var_63_3))
		end

		LeanTween.value(go(var_63_3), 1, 0, 0.5):setOnUpdate(System.Action_float(function(arg_64_0)
			setTextAlpha(var_63_3, arg_64_0)
		end)):setOnComplete(System.Action(function()
			setText(var_63_3, ChapterConst.AirDominance[arg_63_2].name)
			setTextColor(var_63_3, ChapterConst.AirDominance[arg_63_2].color)
			LeanTween.value(go(var_63_3), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_66_0)
				setTextAlpha(var_63_3, arg_66_0)
			end))
		end))

		local function var_63_6(arg_67_0)
			setActive(arg_67_0, false)
		end

		var_63_4:GetComponent(typeof(DftAniEvent)):SetEndEvent(var_63_6)
		var_63_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(var_63_6)
		setActive(var_63_4, arg_63_3 > 0)
		setActive(var_63_5, arg_63_3 < 0)
	else
		setText(var_63_3, ChapterConst.AirDominance[arg_63_2].name)
		setTextColor(var_63_3, ChapterConst.AirDominance[arg_63_2].color)
	end
end

function var_0_0.UpdateDefenseStatus(arg_68_0)
	local var_68_0 = arg_68_0.contextData.chapterVO
	local var_68_1 = var_68_0:getPlayType() == ChapterConst.TypeDefence
	local var_68_2 = findTF(arg_68_0.bottomStage, "Normal/shengfu")

	setActive(var_68_2, var_68_1)

	if not var_68_1 then
		return
	end

	local var_68_3 = findTF(var_68_2, "hp"):GetComponent(typeof(Text))
	local var_68_4 = var_68_0.id
	local var_68_5 = pg.chapter_defense[var_68_4]

	var_68_3.text = i18n("desc_base_hp", "<color=#92FC63>" .. tostring(var_68_0.BaseHP) .. "</color>", var_68_5.port_hp)
end

function var_0_0.DisplayWinConditionPanel(arg_69_0)
	if not arg_69_0.winCondPanel then
		arg_69_0.winCondPanel = WinConditionDisplayPanel.New(arg_69_0._tf.parent, arg_69_0.event, arg_69_0.contextData)

		arg_69_0.winCondPanel:Load()
	end

	arg_69_0.winCondPanel:ActionInvoke("Enter", arg_69_0.contextData.chapterVO)
end

function var_0_0.DestroyWinConditionPanel(arg_70_0)
	if not arg_70_0.winCondPanel then
		return
	end

	arg_70_0.winCondPanel:Destroy()

	arg_70_0.winCondPanel = nil
end

function var_0_0.UpdateComboPanel(arg_71_0)
	local var_71_0 = arg_71_0.contextData.chapterVO
	local var_71_1 = pg.chapter_pop_template[var_71_0.id]

	if var_71_1 and var_71_1.combo_on then
		local var_71_2, var_71_3 = arg_71_0:GetSubView("LevelStageComboPanel")

		if var_71_3 then
			var_71_2:Load()
			var_71_2.buffer:SetParent(arg_71_0.leftStage, false)
		end

		local var_71_4 = getProxy(ChapterProxy):GetComboHistory(var_71_0.id)

		var_71_2.buffer:UpdateView(var_71_4 or var_71_0)
		var_71_2.buffer:UpdateViewAnimated(var_71_0)
	end
end

function var_0_0.UpdateDOALinkFeverPanel(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_0.contextData.chapterVO
	local var_72_1 = var_72_0:GetBindActID()
	local var_72_2 = var_72_0:getConfig("levelstage_bar")

	if not var_72_2 or var_72_2 == "" then
		existCall(arg_72_1)

		return
	end

	local var_72_3, var_72_4 = arg_72_0:GetSubView(var_72_2)

	if var_72_4 then
		var_72_3:Load()
		var_72_3.buffer:SetParent(arg_72_0._tf, false)
	end

	var_72_3.buffer:UpdateView(var_72_0, arg_72_1)
end

local var_0_2 = Vector2(396, 128)
local var_0_3 = Vector2(128, 128)

function var_0_0.updateStageStrategy(arg_73_0)
	local var_73_0 = arg_73_0.contextData.chapterVO
	local var_73_1 = findTF(arg_73_0.rightStage, "event")
	local var_73_2 = findTF(var_73_1, "detail")
	local var_73_3 = findTF(var_73_2, "click")
	local var_73_4 = findTF(var_73_2, "items")

	var_73_4:GetComponent(typeof(GridLayoutGroup)).cellSize = arg_73_0._showStrategyDetail and var_0_2 or var_0_3

	local var_73_5 = findTF(var_73_4, "item")
	local var_73_6 = findTF(var_73_1, "collapse")

	setActive(var_73_5, false)

	local var_73_7 = var_73_0:GetInteractableStrategies()
	local var_73_8

	local function var_73_9(arg_74_0, arg_74_1, arg_74_2)
		if arg_74_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_74_0 = arg_74_2:Find("detail")

		setActive(var_74_0, arg_73_0._showStrategyDetail)

		local var_74_1 = arg_74_2:Find("icon")
		local var_74_2 = var_73_7[arg_74_1 + 1]
		local var_74_3
		local var_74_4

		if var_74_2.id == ChapterConst.StrategyHuntingRange then
			var_74_3 = ChapterConst.StgTypeConst
			var_74_4 = arg_73_0.contextData.huntingRangeVisibility % 2 == 1 and "range_invisible" or "range_visible"

			setText(var_74_0, i18n("help_sub_limits"))
		elseif var_74_2.id == ChapterConst.StrategySubAutoAttack then
			var_74_3 = ChapterConst.StgTypeConst
			var_74_4 = var_73_0.subAutoAttack == 0 and "sub_dont_auto_attack" or "sub_auto_attack"

			setText(var_74_0, i18n("help_sub_display"))
		else
			local var_74_5 = pg.strategy_data_template[var_74_2.id]

			var_74_3 = var_74_5.type
			var_74_4 = var_74_5.icon

			setText(var_74_0, var_74_5.desc)
		end

		GetImageSpriteFromAtlasAsync("strategyicon/" .. var_74_4, "", var_74_1:Find("icon"))
		onButton(arg_73_0, var_74_1, function()
			if var_74_2.id == ChapterConst.StrategyHuntingRange then
				arg_73_0.grid:toggleHuntingRange()
				var_73_9(arg_74_0, arg_74_1, arg_74_2)
			elseif var_74_2.id == ChapterConst.StrategySubAutoAttack then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ai_change_" .. 1 - var_73_0.subAutoAttack + 1))
				arg_73_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSubState,
					arg1 = 1 - var_73_0.subAutoAttack
				})
			elseif var_74_2.id == ChapterConst.StrategyExchange then
				local var_75_0 = var_73_0:getNextValidIndex()

				if var_75_0 > 0 and var_74_2.count > 0 then
					local var_75_1 = var_73_0.fleet

					arg_73_0:HandleShowMsgBox({
						content = i18n("levelScene_who_to_exchange"),
						onYes = function()
							arg_73_0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpStrategy,
								id = var_75_1.id,
								arg1 = ChapterConst.StrategyExchange,
								arg2 = var_73_0.fleets[var_75_0].id
							})
						end
					})
				end
			elseif var_74_2.id == ChapterConst.StrategySubTeleport then
				arg_73_0:SwitchSubTeleportBottomStage()
				arg_73_0:SwitchBottomStagePanel(true)
				arg_73_0.grid:ShowStaticHuntingRange()
				arg_73_0.grid:PrepareSubTeleport()
				arg_73_0.grid:updateQuadCells(ChapterConst.QuadStateTeleportSub)
			elseif var_74_2.id == ChapterConst.StrategyMissileStrike then
				if not var_73_0.fleet:canUseStrategy(var_74_2) then
					return
				end

				arg_73_0:SwitchMissileBottomStagePanel()
				arg_73_0:SwitchBottomStagePanel(true)
				arg_73_0.grid:updateQuadCells(ChapterConst.QuadStateMissileStrike)
			elseif var_74_2.id == ChapterConst.StrategyAirSupport then
				if not var_73_0:getChapterSupportFleet():canUseStrategy(var_74_2) then
					return
				end

				arg_73_0:SwitchAirSupportBottomStagePanel()
				arg_73_0:SwitchBottomStagePanel(true)
				arg_73_0.grid:updateQuadCells(ChapterConst.QuadStateAirSuport)
			elseif var_74_2.id == ChapterConst.StrategyExpel then
				if not var_73_0:getChapterSupportFleet():canUseStrategy(var_74_2) then
					return
				end

				arg_73_0:SwitchAirExpelBottomStagePanel()
				arg_73_0:SwitchBottomStagePanel(true)
				arg_73_0.grid:updateQuadCells(ChapterConst.QuadStateExpel)
			elseif var_74_3 == ChapterConst.StgTypeForm then
				local var_75_2 = var_73_0.fleet
				local var_75_3 = table.indexof(ChapterConst.StrategyForms, var_74_2.id)

				arg_73_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpStrategy,
					id = var_75_2.id,
					arg1 = ChapterConst.StrategyForms[var_75_3 % #ChapterConst.StrategyForms + 1]
				})
			else
				arg_73_0:emit(LevelUIConst.DISPLAY_STRATEGY_INFO, var_74_2)
			end
		end, SFX_PANEL)

		if var_74_3 == ChapterConst.StgTypeForm then
			setText(var_74_1:Find("nums"), "")
			setActive(var_74_1:Find("mask"), false)
			setActive(var_74_1:Find("selected"), true)
		else
			setText(var_74_1:Find("nums"), var_74_2.count or "")
			setActive(var_74_1:Find("mask"), var_74_2.count == 0)
			setActive(var_74_1:Find("selected"), false)
		end
	end

	UIItemList.StaticAlign(var_73_4, var_73_5, #var_73_7, var_73_9)
	onButton(arg_73_0, var_73_3, function()
		shiftPanel(var_73_2, var_73_2.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_73_6, -30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(arg_73_0, var_73_6, function()
		shiftPanel(var_73_2, 35, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_73_6, var_73_6.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
end

function var_0_0.GetSubView(arg_79_0, arg_79_1)
	if arg_79_0.attachSubViews[arg_79_1] then
		return arg_79_0.attachSubViews[arg_79_1]
	end

	local var_79_0 = _G[arg_79_1].New(arg_79_0)

	assert(var_79_0, "cant't find subview " .. (arg_79_1 or "nil"))

	arg_79_0.attachSubViews[arg_79_1] = var_79_0

	return var_79_0, true
end

function var_0_0.RemoveSubView(arg_80_0, arg_80_1)
	if not arg_80_0.attachSubViews[arg_80_1] then
		return false
	end

	arg_80_0.attachSubViews[arg_80_1]:Destroy()

	arg_80_0.attachSubViews[arg_80_1] = nil

	return true
end

function var_0_0.ClearSubViews(arg_81_0)
	for iter_81_0, iter_81_1 in pairs(arg_81_0.attachSubViews) do
		iter_81_1:Destroy()
	end

	table.clear(arg_81_0.attachSubViews)
end

function var_0_0.updateStageFleet(arg_82_0)
	local var_82_0 = arg_82_0.contextData.chapterVO
	local var_82_1 = findTF(arg_82_0.leftStage, "fleet")
	local var_82_2 = findTF(var_82_1, "shiptpl")
	local var_82_3 = arg_82_0.topStage:Find("msg_panel/fleet_info/number")

	setActive(var_82_2, false)
	setText(var_82_3, var_82_0.fleet.id)

	local var_82_4 = var_82_0.fleet:getShips(true)

	local function var_82_5(arg_83_0, arg_83_1)
		local var_83_0 = UIItemList.New(arg_83_0, var_82_2)

		var_83_0:make(function(arg_84_0, arg_84_1, arg_84_2)
			if arg_84_0 == UIItemList.EventUpdate then
				local var_84_0 = arg_83_1[arg_84_1 + 1]

				updateShip(arg_84_2, var_84_0)

				local var_84_1 = var_84_0.hpRant
				local var_84_2 = var_84_0:getShipProperties()
				local var_84_3 = math.floor((var_84_0.hpChange or 0) / 10000 * var_84_2[AttributeType.Durability])
				local var_84_4 = findTF(arg_84_2, "HP_POP")

				setActive(var_84_4, true)
				setActive(findTF(var_84_4, "heal"), false)
				setActive(findTF(var_84_4, "normal"), false)

				local function var_84_5(arg_85_0, arg_85_1)
					setActive(arg_85_0, true)
					setText(findTF(arg_85_0, "text"), arg_85_1)
					setTextAlpha(findTF(arg_85_0, "text"), 0)
					LeanTween.moveY(arg_85_0, 60, 1)
					LeanTween.textAlpha(findTF(arg_85_0, "text"), 1, 0.3)
					LeanTween.textAlpha(findTF(arg_85_0, "text"), 0, 0.5):setDelay(0.7):setOnComplete(System.Action(function()
						arg_85_0.localPosition = Vector3(0, 0, 0)
					end))
				end

				if var_84_3 > 0 then
					var_84_5(findTF(var_84_4, "heal"), var_84_3)
				elseif var_84_3 < 0 then
					LeanTween.delayedCall(0.6, System.Action(function()
						local var_87_0 = arg_84_2.transform.localPosition.x

						LeanTween.moveX(arg_84_2, var_87_0, 0.05):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(4)
						LeanTween.alpha(findTF(arg_84_2, "red"), 0.5, 0.4)
						LeanTween.alpha(findTF(arg_84_2, "red"), 0, 0.4):setDelay(0.4)
						var_84_5(findTF(var_84_4, "normal"), var_84_3)
					end))
				end

				local var_84_6 = findTF(arg_84_2, "blood")
				local var_84_7 = findTF(arg_84_2, "blood/fillarea/green")
				local var_84_8 = findTF(arg_84_2, "blood/fillarea/red")
				local var_84_9 = var_84_1 < ChapterConst.HpGreen
				local var_84_10 = var_84_1 == 0

				setActive(var_84_7, not var_84_9)
				setActive(var_84_8, var_84_9)

				var_84_6:GetComponent(typeof(Slider)).fillRect = var_84_9 and var_84_8 or var_84_7

				setSlider(var_84_6, 0, 10000, var_84_1)
				setActive(findTF(arg_84_2, "repairmask"), var_84_9)
				setActive(findTF(arg_84_2, "repairmask/broken"), var_84_10)
				onButton(arg_82_0, arg_84_2:Find("repairmask"), function()
					arg_82_0:emit(LevelUIConst.DISPLAY_REPAIR_WINDOW, var_84_0)
				end, SFX_PANEL)

				local var_84_11 = findTF(arg_84_2, "repairmask/icon").gameObject

				if not var_84_9 then
					LeanTween.cancel(var_84_11)
					setImageAlpha(var_84_11, 1)
				end

				if var_84_9 and not LeanTween.isTweening(var_84_11) then
					LeanTween.alpha(rtf(var_84_11), 0, 2):setLoopPingPong()
				end

				local var_84_12 = GetOrAddComponent(arg_84_2, "UILongPressTrigger").onLongPressed

				pg.DelegateInfo.Add(arg_82_0, var_84_12)
				var_84_12:RemoveAllListeners()
				var_84_12:AddListener(function()
					arg_82_0:emit(LevelMediator2.ON_STAGE_SHIPINFO, {
						shipId = var_84_0.id,
						shipVOs = var_82_4
					})
				end)
			end
		end)
		var_83_0:align(#arg_83_1)
	end

	var_82_5(var_82_1:Find("main"), var_82_0.fleet:getShipsByTeam(TeamType.Main, true))
	var_82_5(var_82_1:Find("vanguard"), var_82_0.fleet:getShipsByTeam(TeamType.Vanguard, true))
	var_82_0.fleet:clearShipHpChange()
end

function var_0_0.updateSupportFleet(arg_90_0)
	local var_90_0 = arg_90_0.contextData.chapterVO:getChapterSupportFleet()
	local var_90_1 = findTF(arg_90_0.leftStage, "support_fleet")

	if var_90_0 then
		setActive(var_90_1, true)

		local var_90_2 = findTF(var_90_1, "show/ship_container")

		removeAllChildren(var_90_2)

		local var_90_3 = findTF(var_90_1, "show/shiptpl")
		local var_90_4 = var_90_0:getShips()

		for iter_90_0, iter_90_1 in pairs(var_90_4) do
			local var_90_5 = cloneTplTo(var_90_3, var_90_2)

			setActive(var_90_5, true)
			updateShip(var_90_5, iter_90_1)
		end

		local var_90_6 = var_90_1:Find("hide")
		local var_90_7 = var_90_1:Find("show")

		local function var_90_8(arg_91_0)
			setActive(var_90_6, true)
			setActive(var_90_7, true)
			shiftPanel(var_90_7, nil, arg_91_0 and -325.1 or -855, 0.3, 0, true, nil, LeanTweenType.easeOutSine, function()
				setActive(var_90_6, not arg_91_0)
				setActive(var_90_7, arg_91_0)
			end)
			shiftPanel(var_90_6, nil, arg_91_0 and -1017 or -563.97, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		end

		onButton(arg_90_0, var_90_6, function()
			var_90_8(true)
		end, SFX_PANEL)
		onButton(arg_90_0, var_90_7, function()
			var_90_8(false)
		end)
	else
		setActive(var_90_1, false)
	end
end

function var_0_0.ShiftStagePanelIn(arg_95_0, arg_95_1)
	shiftPanel(arg_95_0.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine, arg_95_1)
	arg_95_0:ShiftBottomStage(true)
	shiftPanel(arg_95_0.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_95_0.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.ShiftStagePanelOut(arg_96_0, arg_96_1)
	shiftPanel(arg_96_0.topStage, 0, arg_96_0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine, arg_96_1)
	arg_96_0:ShiftBottomStage(false)
	shiftPanel(arg_96_0.leftStage, -arg_96_0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_96_0.rightStage, arg_96_0.rightStage.rect.width + 300, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.ShiftBottomStage(arg_97_0, arg_97_1)
	arg_97_1 = not arg_97_0.bottomStageInactive and arg_97_1

	local var_97_0 = arg_97_1 and 0 or -arg_97_0.bottomStage.rect.height

	shiftPanel(arg_97_0.bottomStage, 0, var_97_0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.SwitchSubTeleportBottomStage(arg_98_0)
	setActive(arg_98_0.missileStrikeRole, true)
	setText(findTF(arg_98_0.missileStrikeRole, "confirm_button/Text"), i18n("levelscene_deploy_submarine"))
	setText(findTF(arg_98_0.missileStrikeRole, "cancel_button/Text"), i18n("levelscene_deploy_submarine_cancel"))
	onButton(arg_98_0, arg_98_0.missileStrikeRole:Find("confirm_button"), function()
		local var_99_0 = arg_98_0.contextData.chapterVO
		local var_99_1 = var_99_0:GetSubmarineFleet()
		local var_99_2 = var_99_1.startPos
		local var_99_3 = arg_98_0.grid.subTeleportTargetLine

		if not var_99_3 then
			return
		end

		local var_99_4 = var_99_0:findPath(nil, var_99_2, var_99_3)
		local var_99_5 = arg_98_0.grid:TransformLine2PlanePos(var_99_2)
		local var_99_6 = arg_98_0.grid:TransformLine2PlanePos(var_99_3)
		local var_99_7 = math.ceil(pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2] * #var_99_1:getShips(false) * var_99_4 - 1e-05)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("tips_confirm_teleport_sub", var_99_5, var_99_6, var_99_4, var_99_7),
			onYes = function()
				arg_98_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSubTeleport,
					id = var_99_1.id,
					arg1 = var_99_3.row,
					arg2 = var_99_3.column
				})
			end
		})
	end, SFX_UI_CLICK)
	onButton(arg_98_0, arg_98_0.missileStrikeRole:Find("cancel_button"), function()
		arg_98_0:SwitchBottomStagePanel(false)
		arg_98_0.grid:TurnOffSubTeleport()
		arg_98_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchMissileBottomStagePanel(arg_102_0)
	setActive(arg_102_0.missileStrikeRole, true)
	setText(findTF(arg_102_0.missileStrikeRole, "confirm_button/Text"), i18n("missile_attack_area_confirm"))
	setText(findTF(arg_102_0.missileStrikeRole, "cancel_button/Text"), i18n("missile_attack_area_cancel"))
	onButton(arg_102_0, arg_102_0.missileStrikeRole:Find("confirm_button"), function()
		local var_103_0 = arg_102_0.grid.missileStrikeTargetLine

		if not var_103_0 then
			return
		end

		local var_103_1 = arg_102_0.contextData.chapterVO.fleet

		;(function()
			arg_102_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_103_1.id,
				arg1 = ChapterConst.StrategyMissileStrike,
				arg2 = var_103_0.row,
				arg3 = var_103_0.column
			})
		end)()
	end, SFX_UI_CLICK)
	onButton(arg_102_0, arg_102_0.missileStrikeRole:Find("cancel_button"), function()
		arg_102_0:SwitchBottomStagePanel(false)
		arg_102_0.grid:HideMissileAimingMark()
		arg_102_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchAirSupportBottomStagePanel(arg_106_0)
	setActive(arg_106_0.missileStrikeRole, true)
	setText(findTF(arg_106_0.missileStrikeRole, "confirm_button/Text"), i18n("missile_attack_area_confirm"))
	setText(findTF(arg_106_0.missileStrikeRole, "cancel_button/Text"), i18n("missile_attack_area_cancel"))
	onButton(arg_106_0, arg_106_0.missileStrikeRole:Find("confirm_button"), function()
		local var_107_0 = arg_106_0.grid.missileStrikeTargetLine

		if not var_107_0 then
			return
		end

		local var_107_1 = arg_106_0.contextData.chapterVO:getChapterSupportFleet()

		;(function()
			arg_106_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_107_1.id,
				arg1 = ChapterConst.StrategyAirSupport,
				arg2 = var_107_0.row,
				arg3 = var_107_0.column
			})
		end)()
	end, SFX_UI_CLICK)
	onButton(arg_106_0, arg_106_0.missileStrikeRole:Find("cancel_button"), function()
		arg_106_0:SwitchBottomStagePanel(false)
		arg_106_0.grid:HideAirSupportAimingMark()
		arg_106_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchAirExpelBottomStagePanel(arg_110_0)
	setActive(arg_110_0.airExpelRole, true)
	setText(findTF(arg_110_0.airExpelRole, "cancel_button/Text"), i18n("levelscene_airexpel_cancel"))
	onButton(arg_110_0, arg_110_0.airExpelRole:Find("cancel_button"), function()
		arg_110_0:SwitchBottomStagePanel(false)
		arg_110_0.grid:HideAirExpelAimingMark()
		arg_110_0.grid:CleanAirSupport()
		arg_110_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchBottomStagePanel(arg_112_0, arg_112_1)
	setActive(arg_112_0.actionRole, true)
	setActive(arg_112_0.normalRole, true)
	shiftPanel(arg_112_0.actionRole, 0, arg_112_1 and 0 or var_0_1, 0.3, 0, true, true, nil, function()
		setActive(arg_112_0.actionRole, arg_112_1)
	end)
	shiftPanel(arg_112_0.normalRole, 0, arg_112_1 and var_0_1 or 0, 0.3, 0, true, true, nil, function()
		setActive(arg_112_0.normalRole, not arg_112_1)

		if not arg_112_1 then
			eachChild(arg_112_0.actionRole, function(arg_115_0)
				setActive(arg_115_0, false)
			end)
		end
	end)
	shiftPanel(arg_112_0.leftStage, arg_112_1 and -arg_112_0.leftStage.rect.width - 200 or 0, 0, 0.3, 0, true)
	shiftPanel(arg_112_0.rightStage, arg_112_1 and arg_112_0.rightStage.rect.width + 300 or 0, 0, 0.3, 0, true)
end

function var_0_0.ClickGridCellNormal(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_0.contextData.chapterVO
	local var_116_1 = var_116_0.fleet
	local var_116_2 = _.detect(var_116_0.fleets, function(arg_117_0)
		return arg_117_0:getFleetType() == FleetType.Normal and arg_117_0.line.row == arg_116_1.row and arg_117_0.line.column == arg_116_1.column
	end)

	if var_116_2 and var_116_2:isValid() and var_116_2.id ~= var_116_1.id then
		arg_116_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSwitch,
			id = var_116_2.id
		})

		return
	end

	if arg_116_0:tryAutoTrigger(nil, true) then
		return
	end

	if arg_116_1.row == var_116_1.line.row and arg_116_1.column == var_116_1.line.column then
		return
	end

	local var_116_3 = var_116_0:getChapterCell(arg_116_1.row, arg_116_1.column)

	if var_116_3.attachment == ChapterConst.AttachStory and var_116_3.data == ChapterConst.StoryObstacle and var_116_3.flag == ChapterConst.CellFlagTriggerActive then
		local var_116_4 = pg.map_event_template[var_116_3.attachmentId]

		if var_116_4 and var_116_4.gametip and #var_116_4.gametip > 0 and var_116_0:getPlayType() ~= ChapterConst.TypeDefence then
			pg.TipsMgr.GetInstance():ShowTips(i18n(var_116_4.gametip))
		end

		return
	elseif not var_116_0:considerAsStayPoint(ChapterConst.SubjectPlayer, arg_116_1.row, arg_116_1.column) then
		return
	elseif var_116_0:existMoveLimit() then
		local var_116_5 = var_116_0:calcWalkableCells(ChapterConst.SubjectPlayer, var_116_1.line.row, var_116_1.line.column, var_116_1:getSpeed())

		if not _.any(var_116_5, function(arg_118_0)
			return arg_118_0.row == arg_116_1.row and arg_118_0.column == arg_116_1.column
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destination_not_in_range"))

			return
		end
	end

	local var_116_6 = var_116_0:findPath(ChapterConst.SubjectPlayer, var_116_1.line, {
		row = arg_116_1.row,
		column = arg_116_1.column
	})

	if var_116_6 < PathFinding.PrioObstacle then
		arg_116_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpMove,
			id = var_116_1.id,
			arg1 = arg_116_1.row,
			arg2 = arg_116_1.column
		})
	elseif var_116_6 < PathFinding.PrioForbidden then
		pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach"))
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach"))
	end
end

function var_0_0.tryAutoAction(arg_119_0, arg_119_1)
	if arg_119_0.doingAutoAction then
		return
	end

	arg_119_0.doingAutoAction = true

	local var_119_0 = arg_119_0.contextData.chapterVO

	if not var_119_0 then
		existCall(arg_119_1)

		return
	end

	if arg_119_0:SafeCheck() then
		existCall(arg_119_1)

		return
	end

	local var_119_1 = {}
	local var_119_2 = false

	for iter_119_0, iter_119_1 in pairs(var_119_0.cells) do
		if iter_119_1.trait == ChapterConst.TraitLurk then
			var_119_2 = true

			break
		end
	end

	if not var_119_2 then
		for iter_119_2, iter_119_3 in ipairs(var_119_0.champions) do
			if iter_119_3.trait == ChapterConst.TraitLurk then
				var_119_2 = true

				break
			end
		end
	end

	if var_119_2 then
		local var_119_3 = var_119_0:existOni()
		local var_119_4 = var_119_0:isPlayingWithBombEnemy()

		if not var_119_3 and not var_119_4 then
			table.insert(var_119_1, function(arg_120_0)
				arg_119_0:emit(LevelUIConst.DO_TRACKING, arg_120_0)
			end)
		else
			table.insertto(var_119_1, {
				function(arg_121_0)
					local var_121_0

					if var_119_3 then
						var_121_0 = "SpUnit"
					elseif var_119_4 then
						var_121_0 = "SpBomb"
					end

					assert(var_121_0)
					arg_119_0:emit(LevelUIConst.DO_PLAY_ANIM, {
						name = var_121_0,
						callback = function(arg_122_0)
							setActive(arg_122_0, false)
							arg_121_0()
						end
					})
				end,
				function(arg_123_0)
					local var_123_0 = var_119_0:getSpAppearStory()

					if var_123_0 and #var_123_0 > 0 then
						pg.NewStoryMgr.GetInstance():Play(var_123_0, arg_123_0)

						return
					end

					arg_123_0()
				end,
				function(arg_124_0)
					local var_124_0 = var_119_0:getSpAppearGuide()

					if var_124_0 and #var_124_0 > 0 then
						pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_124_0, nil, arg_124_0)

						return
					end

					arg_124_0()
				end
			})
		end

		table.insertto(var_119_1, {
			function(arg_125_0)
				parallelAsync({
					function(arg_126_0)
						arg_119_0:tryPlayChapterStory(arg_126_0)
					end,
					function(arg_127_0)
						local var_127_0 = var_119_0:GetBossCell()

						if var_127_0 and var_127_0.trait == ChapterConst.TraitLurk then
							arg_119_0.grid:focusOnCell(var_127_0, arg_127_0)

							return
						end

						arg_127_0()
					end
				}, arg_125_0)
			end,
			function(arg_128_0)
				arg_119_0:updateTrait(ChapterConst.TraitVirgin)
				arg_119_0.grid:updateAttachments()
				arg_119_0.grid:updateChampions()
				arg_119_0:updateTrait(ChapterConst.TraitNone)
				arg_119_0:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)
				Timer.New(arg_128_0, 0.5, 1):Start()
			end
		})
	end

	seriesAsync({
		function(arg_129_0)
			arg_119_0:emit(LevelUIConst.FROZEN)

			local var_129_0 = getProxy(ChapterProxy):GetLastDefeatedEnemy(var_119_0.id)

			if var_129_0 and (var_129_0.attachment ~= ChapterConst.AttachAmbush or ChapterConst.IsBossCell(var_129_0)) then
				local var_129_1 = ChapterConst.GetDestroyFX(var_129_0)

				arg_119_0.grid:PlayAttachmentEffect(var_129_0.line.row, var_129_0.line.column, var_129_1, Vector2.zero)
			end

			arg_119_0:PopBar()
			arg_119_0:UpdateComboPanel()
			arg_129_0()
		end,
		function(arg_130_0)
			if not (function()
				local var_131_0 = getProxy(ChapterProxy):GetLastDefeatedEnemy(var_119_0.id)

				if not var_131_0 then
					return
				end

				local var_131_1 = pg.expedition_data_template[var_131_0.attachmentId]

				return var_131_1 and var_131_1.type == ChapterConst.ExpeditionTypeMulBoss
			end)() then
				return arg_130_0()
			end

			arg_119_0:emit(LevelUIConst.DO_PLAY_ANIM, {
				name = "BossRetreatBar",
				callback = function(arg_132_0)
					setActive(arg_132_0, false)
					arg_130_0()
				end
			})
		end,
		function(arg_133_0)
			arg_119_0:UpdateDOALinkFeverPanel(arg_133_0)
		end,
		function(arg_134_0)
			seriesAsync(var_119_1, arg_134_0)
		end,
		function(arg_135_0)
			local var_135_0, var_135_1 = var_119_0:GetAttachmentStories()

			if var_135_0 then
				table.SerialIpairsAsync(var_135_0, function(arg_136_0, arg_136_1, arg_136_2)
					if arg_136_0 <= var_135_1 and arg_136_1 and type(arg_136_1) == "number" and arg_136_1 > 0 then
						local var_136_0 = pg.NewStoryMgr:StoryId2StoryName(arg_136_1)

						ChapterOpCommand.PlayChapterStory(var_136_0, arg_136_2, var_119_0:IsAutoFight())

						return
					end

					arg_136_2()
				end, arg_135_0)

				return
			end

			arg_135_0()
		end,
		function(arg_137_0)
			local var_137_0 = arg_119_0.contextData.chapterVO.id
			local var_137_1 = getProxy(ChapterProxy):getUpdatedExtraFlags(var_137_0)

			if not var_137_1 or #var_137_1 < 1 then
				arg_137_0()

				return
			end

			for iter_137_0, iter_137_1 in ipairs(var_137_1) do
				local var_137_2 = pg.chapter_status_effect[iter_137_1]
				local var_137_3 = var_137_2 and var_137_2.camera_focus or ""

				if type(var_137_3) == "table" then
					arg_119_0.grid:focusOnCell({
						row = var_137_3[1],
						column = var_137_3[2]
					}, arg_137_0)

					return
				end
			end

			arg_137_0()
		end,
		function(arg_138_0)
			if arg_119_0.exited then
				return
			end

			arg_119_0:emit(LevelUIConst.UN_FROZEN)
			;(function()
				local var_139_0 = getProxy(ChapterProxy)
				local var_139_1 = var_139_0:getActiveChapter(true)

				if not var_139_1 then
					return
				end

				local var_139_2 = var_139_1.id

				var_139_0:RecordComboHistory(var_139_2, nil)
				var_139_0:RecordLastDefeatedEnemy(var_139_2, nil)
				var_139_0:extraFlagUpdated(var_139_2)
				var_139_0:RemoveExtendChapterData(var_139_2, "FleetMoveDistance")
			end)()
			arg_138_0()
		end,
		function(arg_140_0)
			if arg_119_0.exited then
				return
			end

			existCall(arg_119_1)

			arg_119_0.doingAutoAction = nil

			if var_119_2 then
				arg_119_0:TryEnterChapterStoryStage()
			end
		end
	})
end

function var_0_0.tryPlayChapterStory(arg_141_0, arg_141_1)
	local var_141_0 = arg_141_0.contextData.chapterVO
	local var_141_1 = var_141_0:getWaveCount()

	seriesAsync({
		function(arg_142_0)
			pg.SystemGuideMgr.GetInstance():PlayChapter(var_141_0, arg_142_0)
		end,
		function(arg_143_0)
			local var_143_0 = var_141_0:getConfig("story_refresh")
			local var_143_1 = var_143_0 and var_143_0[var_141_1]

			if var_143_1 and type(var_143_1) == "string" and var_143_1 ~= "" and not var_141_0:IsRemaster() then
				ChapterOpCommand.PlayChapterStory(var_143_1, arg_143_0, var_141_0:IsAutoFight())

				return
			end

			arg_143_0()
		end,
		function(arg_144_0)
			local var_144_0 = var_141_0:getConfig("story_refresh_boss")

			if var_144_0 and type(var_144_0) == "string" and var_144_0 ~= "" and not var_141_0:IsRemaster() and var_141_0:IsFinalBossRefreshed() then
				ChapterOpCommand.PlayChapterStory(var_144_0, arg_144_0, var_141_0:IsAutoFight())

				return
			end

			arg_144_0()
		end,
		function(arg_145_0)
			if var_141_1 == 1 and pg.map_event_list[var_141_0.id] and pg.map_event_list[var_141_0.id].help_open == 1 and PlayerPrefs.GetInt("help_displayed_on_" .. var_141_0.id, 0) == 0 then
				triggerButton(arg_141_0.helpBtn)
				PlayerPrefs.SetInt("help_displayed_on_" .. var_141_0.id, 1)
			end

			arg_145_0()
		end,
		function()
			existCall(arg_141_1)
		end
	})
end

function var_0_0.TryEnterChapterStoryStage(arg_147_0)
	local var_147_0 = arg_147_0.contextData.chapterVO
	local var_147_1 = var_147_0:getWaveCount()

	seriesAsync({
		function(arg_148_0)
			local var_148_0 = var_147_0:getConfig("story_refresh")
			local var_148_1 = var_148_0 and var_148_0[var_147_1]
			local var_148_2 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_148_1)

			if var_148_1 and type(var_148_1) == "number" and not var_147_0:IsRemaster() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_148_2) then
				arg_147_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_148_1, arg_148_0)
			else
				arg_148_0()
			end
		end,
		function(arg_149_0)
			local var_149_0 = var_147_0:getConfig("story_refresh_boss")
			local var_149_1 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_149_0)

			if var_149_0 and type(var_149_0) == "number" and not var_147_0:IsRemaster() and var_147_0:IsFinalBossRefreshed() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_149_1) then
				arg_147_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_149_0, arg_149_0)
			else
				arg_149_0()
			end
		end
	})
end

local var_0_4 = {
	[ChapterConst.KizunaJammingDodge] = "kizunaOperationSafe",
	[ChapterConst.KizunaJammingEngage] = "kizunaOperationDanger",
	[ChapterConst.StatusDay] = "HololiveDayBar",
	[ChapterConst.StatusNight] = "HololiveNightBar",
	[ChapterConst.StatusAirportUnderControl] = "AirportCaptureBar",
	[ChapterConst.StatusSunset] = "SunsetBar",
	[ChapterConst.StatusMaze1] = "MazeBar",
	[ChapterConst.StatusMaze2] = "MazeBar",
	[ChapterConst.StatusMaze3] = "MazeBar",
	[ChapterConst.StatusMissile1] = "MissileBar",
	[ChapterConst.StatusMissileInit] = "MissileWarningBar",
	[ChapterConst.StatusMissile1B] = "MissileBar",
	[ChapterConst.StatusMissileInitB] = "MissileWarningBar",
	[ChapterConst.StatusMusashiGame1] = "MusashiGameBar_1",
	[ChapterConst.StatusMusashiGame2] = "MusashiGameBar_2",
	[ChapterConst.StatusMusashiGame3] = "MusashiGameBar_3",
	[ChapterConst.StatusMusashiGame4] = "MusashiGameBar_4",
	[ChapterConst.StatusMusashiGame5] = "MusashiGameBar_5",
	[ChapterConst.StatusMusashiGame6] = "MusashiGameBar_6",
	[ChapterConst.StatusMusashiGame7] = "MusashiGameBar_7",
	[ChapterConst.StatusMusashiGame8] = "MusashiGameBar_8"
}

function var_0_0.PopBar(arg_150_0)
	local var_150_0 = arg_150_0.contextData.chapterVO.id
	local var_150_1 = getProxy(ChapterProxy):getUpdatedExtraFlags(var_150_0)

	if not var_150_1 or #var_150_1 < 1 then
		return
	end

	local var_150_2 = var_150_1[1]
	local var_150_3 = var_0_4[var_150_2]

	if not var_150_3 then
		return
	end

	local var_150_4, var_150_5 = arg_150_0:GetSubView(var_150_3)

	if var_150_5 then
		var_150_4:Load()
	end

	var_150_4.buffer:PlayAnim()
end

function var_0_0.updateTrait(arg_151_0, arg_151_1)
	local var_151_0 = arg_151_0.contextData.chapterVO

	for iter_151_0, iter_151_1 in pairs(var_151_0.cells) do
		if iter_151_1.trait ~= ChapterConst.TraitNone then
			iter_151_1.trait = arg_151_1
		end
	end

	for iter_151_2, iter_151_3 in ipairs(var_151_0.champions) do
		if iter_151_3.trait ~= ChapterConst.TraitNone then
			iter_151_3.trait = arg_151_1
		end
	end
end

function var_0_0.CheckFleetChange(arg_152_0)
	local var_152_0 = arg_152_0.contextData.chapterVO
	local var_152_1 = var_152_0:GetActiveFleet()
	local var_152_2 = _.detect(var_152_0.fleets, function(arg_153_0)
		return not arg_153_0:isValid()
	end)

	if var_152_2 then
		arg_152_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRetreat,
			id = var_152_2.id
		})

		if var_152_2:getFleetType() == TeamType.Normal then
			getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.BATTLE_FAILED)
		end
	end

	if not var_152_1:isValid() then
		local var_152_3 = var_152_0:getNextValidIndex()

		if var_152_3 > 0 then
			local var_152_4 = var_152_0.fleets[var_152_3]

			local function var_152_5()
				arg_152_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSwitch,
					id = var_152_4.id
				})
			end

			arg_152_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("formation_switch_tip", var_152_4.name),
				onYes = var_152_5,
				onNo = var_152_5
			})
		end

		return true
	end

	return false
end

function var_0_0.tryAutoTrigger(arg_155_0, arg_155_1, arg_155_2)
	local var_155_0 = arg_155_0.contextData.chapterVO

	if arg_155_0:DoBreakAction() then
		return
	end

	if arg_155_0:CheckFleetChange() then
		return
	end

	return ((function()
		if var_155_0:checkAnyInteractive() then
			if not arg_155_1 or var_155_0:IsAutoFight() then
				triggerButton(arg_155_0.funcBtn)

				return true
			end
		elseif var_155_0:getRound() == ChapterConst.RoundEnemy then
			arg_155_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpEnemyRound
			})

			return true
		elseif var_155_0:getRound() == ChapterConst.RoundPlayer then
			if not arg_155_2 then
				arg_155_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			end

			if var_155_0:IsAutoFight() then
				arg_155_0:TryAutoFight()

				return true
			end
		end
	end)())
end

function var_0_0.DoBreakAction(arg_157_0)
	local var_157_0 = arg_157_0.contextData.chapterVO
	local var_157_1, var_157_2 = arg_157_0:SafeCheck()

	if var_157_1 then
		local function var_157_3(arg_158_0)
			local var_158_0

			seriesAsync({
				function(arg_159_0)
					arg_157_0:emit(LevelUIConst.ADD_MSG_QUEUE, arg_159_0)
				end,
				function(arg_160_0, arg_160_1)
					var_158_0 = arg_160_1

					ChapterOpCommand.PrepareChapterRetreat(arg_160_0)
				end,
				function(arg_161_0)
					existCall(arg_158_0)
					existCall(var_158_0)
				end
			})
		end

		if var_157_2 == ChapterConst.ReasonVictory then
			seriesAsync({
				function(arg_162_0)
					var_157_3(arg_162_0)
				end,
				function(arg_163_0)
					local var_163_0 = var_157_0:getConfig("win_condition_display") and #var_163_0 > 0 and var_163_0 .. "_tip"

					if var_163_0 and pg.gametip[var_163_0] then
						pg.TipsMgr.GetInstance():ShowTips(i18n(var_163_0))
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_win"))
					end

					arg_163_0()
				end
			})
		elseif var_157_2 == ChapterConst.ReasonDefeat then
			if var_157_0:getPlayType() == ChapterConst.TypeTransport then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_lose"))
				var_157_3()
			else
				arg_157_0:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("formation_invalide"),
					onYes = var_157_3,
					onClose = var_157_3
				})
			end
		elseif var_157_2 == ChapterConst.ReasonDefeatDefense then
			arg_157_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("harbour_bomb_tip"),
				onYes = var_157_3,
				onClose = var_157_3
			})
		elseif var_157_2 == ChapterConst.ReasonVictoryOni then
			var_157_3()
		elseif var_157_2 == ChapterConst.ReasonDefeatOni then
			var_157_3()
		elseif var_157_2 == ChapterConst.ReasonDefeatBomb then
			var_157_3()
		elseif var_157_2 == ChapterConst.ReasonOutTime then
			arg_157_0:emit(LevelMediator2.ON_TIME_UP)
		elseif var_157_2 == ChapterConst.ReasonActivityOutTime then
			arg_157_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("battle_preCombatMediator_activity_timeout"),
				onYes = var_157_3,
				onClose = var_157_3
			})
		end

		return true
	end

	return var_157_1
end

function var_0_0.SafeCheck(arg_164_0)
	local var_164_0 = arg_164_0.contextData.chapterVO

	if var_164_0:existOni() then
		local var_164_1 = var_164_0:checkOniState()

		if var_164_1 == 1 then
			return true, ChapterConst.ReasonVictoryOni
		elseif var_164_1 == 2 then
			return true, ChapterConst.ReasonDefeatOni
		else
			return false
		end
	elseif var_164_0:isPlayingWithBombEnemy() then
		if var_164_0:getBombChapterInfo().action_times * 2 <= var_164_0.roundIndex then
			return true, ChapterConst.ReasonDefeatBomb
		else
			return false
		end
	end

	local var_164_2, var_164_3 = var_164_0:CheckChapterWin()

	if var_164_2 then
		return true, var_164_3
	end

	local var_164_4, var_164_5 = var_164_0:CheckChapterLose()

	if var_164_4 then
		return true, var_164_5
	end

	if not var_164_0:inWartime() then
		return true, ChapterConst.ReasonOutTime
	end

	local var_164_6 = var_164_0:GetBindActID()

	if not arg_164_0.contextData.map:isRemaster() and var_164_6 ~= 0 then
		local var_164_7 = getProxy(ActivityProxy):getActivityById(var_164_6)

		if not var_164_7 or var_164_7:isEnd() then
			return true, ChapterConst.ReasonActivityOutTime
		end
	end

	return false
end

function var_0_0.TryAutoFight(arg_165_0)
	local var_165_0 = arg_165_0.contextData.chapterVO
	local var_165_1 = arg_165_0.contextData.map

	if not var_165_0:IsAutoFight() then
		return
	end

	local var_165_2 = var_165_0:GetAllEnemies()
	local var_165_3 = _.detect(var_165_2, function(arg_166_0)
		return ChapterConst.IsBossCell(arg_166_0)
	end)
	local var_165_4 = var_165_0:GetFleetOfDuty(tobool(var_165_3))

	if var_165_4 and var_165_4.id ~= var_165_0.fleet.id then
		arg_165_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSwitch,
			id = var_165_4.id
		})
		arg_165_0:tryAutoTrigger()

		return
	end

	if var_165_0:checkAnyInteractive() then
		arg_165_0:tryAutoTrigger()

		return
	end

	local var_165_5

	for iter_165_0, iter_165_1 in ipairs(var_165_0:getConfig("box_auto_pick")) do
		local var_165_6 = underscore.filter(switch(iter_165_1, {
			[ChapterConst.AttachBox] = function()
				return var_165_0:findChapterCells(iter_165_1)
			end,
			[ChapterConst.AttachSupply] = function()
				local var_168_0, var_168_1 = var_165_0:getFleetAmmo(var_165_4)

				if var_168_0 - var_168_1 < 3 then
					return {}
				else
					return underscore.filter(var_165_0:findChapterCells(iter_165_1), function(arg_169_0)
						return arg_169_0.attachmentId > 0
					end)
				end
			end
		}), function(arg_170_0)
			return arg_170_0.flag ~= ChapterConst.CellFlagDisabled
		end)

		for iter_165_2, iter_165_3 in ipairs(var_165_6) do
			local var_165_7, var_165_8 = var_165_0:findPath(ChapterConst.SubjectPlayer, var_165_4.line, iter_165_3)

			if var_165_7 < PathFinding.PrioObstacle then
				var_165_5 = var_165_5 or {}

				table.insert(var_165_5, {
					target = iter_165_3,
					priority = var_165_7,
					path = var_165_8
				})
			end
		end

		if var_165_5 then
			table.sort(var_165_5, CompareFuncs({
				function(arg_171_0)
					return arg_171_0.priority
				end
			}))

			break
		end
	end

	if not var_165_5 then
		if var_165_3 then
			local var_165_9, var_165_10 = var_165_0:FindBossPath(var_165_4.line, var_165_3)
			local var_165_11 = {}
			local var_165_12

			for iter_165_4, iter_165_5 in ipairs(var_165_10) do
				table.insert(var_165_11, iter_165_5)

				if var_165_0:existEnemy(ChapterConst.SubjectPlayer, iter_165_5.row, iter_165_5.column) then
					var_165_9 = iter_165_4
					var_165_12 = iter_165_5

					break
				end
			end

			var_165_5 = {
				{
					target = var_165_12 or var_165_3,
					priority = var_165_9 or 0,
					path = var_165_11
				}
			}
		else
			var_165_5 = underscore.map(var_165_2, function(arg_172_0)
				local var_172_0, var_172_1 = var_165_0:findPath(ChapterConst.SubjectPlayer, var_165_4.line, arg_172_0)

				return {
					target = arg_172_0,
					priority = var_172_0,
					path = var_172_1
				}
			end)

			local function var_165_13(arg_173_0)
				local var_173_0 = arg_173_0.target
				local var_173_1 = pg.expedition_data_template[var_173_0.attachmentId]

				assert(var_173_1, "expedition_data_template not exist: " .. var_173_0.attachmentId)

				if var_173_0.flag == ChapterConst.CellFlagDisabled then
					return 0
				end

				return ChapterConst.EnemyPreference[var_173_1.type]
			end

			table.sort(var_165_5, CompareFuncs({
				function(arg_174_0)
					return arg_174_0.priority < PathFinding.PrioObstacle and 0 or 1
				end,
				function(arg_175_0)
					return -var_165_13(arg_175_0)
				end,
				function(arg_176_0)
					return arg_176_0.priority
				end
			}))
		end
	end

	if var_165_5 and #var_165_5 > 0 and var_165_5[1].priority < PathFinding.PrioObstacle then
		local var_165_14 = var_165_5[1].target

		arg_165_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpMove,
			id = var_165_4.id,
			arg1 = var_165_14.row,
			arg2 = var_165_14.column
		})
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_errors_tip"))
		getProxy(ChapterProxy):SetChapterAutoFlag(var_165_0.id, false)
	end
end

function var_0_0.popStageStrategy(arg_177_0)
	local var_177_0 = arg_177_0.rightStage:Find("event/collapse")

	if var_177_0.anchoredPosition.x <= 1 then
		triggerButton(var_177_0)
	end
end

function var_0_0.UpdateAutoFightPanel(arg_178_0)
	if arg_178_0.contextData.chapterVO:CanActivateAutoFight() then
		if not arg_178_0.autoFightPanel then
			arg_178_0.autoFightPanel = LevelStageAutoFightPanel.New(arg_178_0.rightStage:Find("event/collapse"), arg_178_0.event, arg_178_0.contextData)

			arg_178_0.autoFightPanel:Load()

			arg_178_0.autoFightPanel.isFrozen = arg_178_0.isFrozen
		end

		arg_178_0.autoFightPanel.buffer:Show()
	elseif arg_178_0.autoFightPanel then
		arg_178_0.autoFightPanel.buffer:Hide()
	end
end

function var_0_0.UpdateAutoFightMark(arg_179_0)
	if not arg_179_0.autoFightPanel then
		return
	end

	arg_179_0.autoFightPanel.buffer:UpdateAutoFightMark()
end

function var_0_0.DestroyAutoFightPanel(arg_180_0)
	if not arg_180_0.autoFightPanel then
		return
	end

	arg_180_0.autoFightPanel:Destroy()

	arg_180_0.autoFightPanel = nil
end

function var_0_0.DestroyToast(arg_181_0)
	if not arg_181_0.toastPanel then
		return
	end

	arg_181_0.toastPanel:Destroy()

	arg_181_0.toastPanel = nil
end

function var_0_0.Toast(arg_182_0)
	arg_182_0:DestroyToast()

	local var_182_0 = table.remove(arg_182_0.toastQueue, 1)

	if not var_182_0 then
		return
	end

	arg_182_0.toastPanel = var_182_0.Class.New(arg_182_0)

	arg_182_0.toastPanel:Load()

	arg_182_0.toastPanel.contextData.settings = var_182_0

	arg_182_0.toastPanel.buffer:Play(function()
		arg_182_0:Toast()
	end)
end

function var_0_0.HandleShowMsgBox(arg_184_0, arg_184_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_184_1)
end

return var_0_0
