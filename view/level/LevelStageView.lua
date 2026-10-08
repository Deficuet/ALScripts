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

function var_0_0.getResource(arg_6_0, arg_6_1)
	local var_6_0 = {
		"ui/levelstageview_atlas",
		"enemycount",
		"passstate",
		"strategyicon/submarine_approach",
		"strategyicon/range_invisible",
		"strategyicon/range_visible",
		"strategyicon/sub_dont_auto_attack",
		"strategyicon/sub_auto_attack",
		"weaponframes",
		"shiptype",
		"ui/iconcolorful"
	}

	table.insertto(var_6_0, ResList.LevelStageView.GetResource(arg_6_1))

	return table.insertto(var_6_0, var_0_0.super.getResource(arg_6_0, arg_6_1))
end

function var_0_0.OnInit(arg_7_0)
	arg_7_0:InitUI()
	arg_7_0:AddListener()

	arg_7_0.loader = AutoLoader.New()
	arg_7_0.cgComp = GetOrAddComponent(arg_7_0._go, typeof(CanvasGroup))
	arg_7_0.cgComp.blocksRaycasts = not arg_7_0.isFrozen

	arg_7_0:Show()
end

function var_0_0.OnDestroy(arg_8_0)
	if arg_8_0.stageTimer then
		arg_8_0.stageTimer:Stop()

		arg_8_0.stageTimer = nil
	end

	arg_8_0:ClearSubViews()
	arg_8_0:DestroyAutoFightPanel()
	arg_8_0:DestroyWinConditionPanel()
	arg_8_0:DestroyToast()
	arg_8_0.loader:Clear()
	arg_8_0:Hide()
end

local var_0_1 = -300

function var_0_0.InitUI(arg_9_0)
	arg_9_0.topStage = arg_9_0._tf:Find("top_stage")

	setActive(arg_9_0.topStage, true)

	arg_9_0.bottomStage = arg_9_0._tf:Find("bottom_stage")
	arg_9_0.normalRole = findTF(arg_9_0.bottomStage, "Normal")
	arg_9_0.funcBtn = arg_9_0.normalRole:Find("func_button")
	arg_9_0.retreatBtn = arg_9_0.normalRole:Find("retreat_button")
	arg_9_0.switchBtn = arg_9_0.normalRole:Find("switch_button")
	arg_9_0.helpBtn = arg_9_0.normalRole:Find("help_button")
	arg_9_0.shengfuBtn = arg_9_0.normalRole:Find("shengfu/shengfu_button")
	arg_9_0.actionRole = findTF(arg_9_0.bottomStage, "Action")
	arg_9_0.missileStrikeRole = findTF(arg_9_0.actionRole, "MissileStrike")
	arg_9_0.airExpelRole = findTF(arg_9_0.actionRole, "AirExpel")

	setActive(arg_9_0.bottomStage, true)
	setAnchoredPosition(arg_9_0.normalRole, {
		x = 0,
		y = 0
	})
	setActive(arg_9_0.normalRole, true)
	setAnchoredPosition(arg_9_0.actionRole, {
		x = 0,
		y = var_0_1
	})
	setActive(arg_9_0.actionRole, false)
	eachChild(arg_9_0.actionRole, function(arg_10_0)
		setActive(arg_10_0, false)
	end)

	arg_9_0.leftStage = arg_9_0._tf:Find("left_stage")

	setActive(arg_9_0.leftStage, true)

	arg_9_0.rightStage = arg_9_0._tf:Find("right_stage")
	arg_9_0.bombPanel = arg_9_0.rightStage:Find("bomb_panel")
	arg_9_0.panelBarrier = arg_9_0.rightStage:Find("panel_barrier")
	arg_9_0.strategyPanelAnimator = arg_9_0.rightStage:Find("event"):GetComponent(typeof(Animator))
	arg_9_0.autoBattleBtn = arg_9_0.rightStage:Find("event/collapse/lock_fleet")
	arg_9_0.showDetailBtn = arg_9_0.rightStage:Find("event/detail/show_detail")

	setActive(arg_9_0.panelBarrier, false)
	setActive(arg_9_0.rightStage, true)

	arg_9_0.airSupremacy = arg_9_0.topStage:Find("msg_panel/air_supremacy")

	setAnchoredPosition(arg_9_0.topStage, {
		y = arg_9_0.topStage.rect.height
	})
	setAnchoredPosition(arg_9_0.leftStage, {
		x = -arg_9_0.leftStage.rect.width - 200
	})
	setAnchoredPosition(arg_9_0.rightStage, {
		x = arg_9_0.rightStage.rect.width + 300
	})
	setAnchoredPosition(arg_9_0.bottomStage, {
		y = -arg_9_0.bottomStage.rect.height
	})

	arg_9_0.attachSubViews = {}
end

function var_0_0.AddListener(arg_11_0)
	arg_11_0:bind(LevelUIConst.TRIGGER_ACTION, function()
		arg_11_0:tryAutoTrigger()
	end)
	arg_11_0:bind(LevelUIConst.STRATEGY_PANEL_AUTOFIGHT_ACTIVE, function(arg_13_0, arg_13_1)
		arg_11_0.strategyPanelAnimator:SetBool("IsActive", arg_13_1)

		arg_11_0.bottomStageInactive = arg_13_1

		arg_11_0:ShiftBottomStage(not arg_13_1)
	end)
	arg_11_0:bind(LevelUIConst.ON_CLICK_GRID_QUAD, function(arg_14_0, arg_14_1)
		arg_11_0:ClickGridCellNormal(arg_14_1)
	end)
	onButton(arg_11_0, arg_11_0.topStage:Find("option"), function()
		arg_11_0:emit(BaseUI.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.topStage:Find("back_button"), function()
		arg_11_0:emit(LevelUIConst.SWITCH_TO_MAP)
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.retreatBtn, function()
		local var_17_0 = arg_11_0.contextData.chapterVO
		local var_17_1 = arg_11_0.contextData.map
		local var_17_2 = "levelScene_whether_to_retreat"

		if var_17_0:existOni() then
			var_17_2 = "levelScene_oni_retreat"
		elseif var_17_0:isPlayingWithBombEnemy() then
			var_17_2 = "levelScene_bomb_retreat"
		elseif var_17_0:getPlayType() == ChapterConst.TypeTransport and not var_17_1:isSkirmish() then
			var_17_2 = "levelScene_escort_retreat"
		elseif var_17_1:isRemaster() then
			var_17_2 = "archives_whether_to_retreat"
		end

		arg_11_0:HandleShowMsgBox({
			content = i18n(var_17_2),
			onYes = ChapterOpCommand.PrepareChapterRetreat
		})
	end, SFX_UI_WEIGHANCHOR_WITHDRAW)
	onButton(arg_11_0, arg_11_0.switchBtn, function()
		local var_18_0 = arg_11_0.contextData.chapterVO
		local var_18_1 = var_18_0:getNextValidIndex()

		if var_18_1 > 0 then
			arg_11_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpSwitch,
				id = var_18_0.fleets[var_18_1].id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("formation_switch_failed"))
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.autoBattleBtn, function()
		local var_19_0 = getProxy(ChapterProxy)
		local var_19_1 = var_19_0:GetSkipPrecombat()

		var_19_0:UpdateSkipPrecombat(not var_19_1)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.showDetailBtn, function()
		arg_11_0._showStrategyDetail = not arg_11_0._showStrategyDetail and true

		arg_11_0:updateStageStrategy()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.funcBtn, function()
		local var_21_0 = arg_11_0.contextData.chapterVO

		if not var_21_0:inWartime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_time_out"))

			return
		end

		local var_21_1 = var_21_0.fleet
		local var_21_2 = var_21_1.line
		local var_21_3 = var_21_0:getChapterCell(var_21_2.row, var_21_2.column)
		local var_21_4 = false

		local function var_21_5(arg_22_0)
			local var_22_0 = arg_22_0.attachmentId

			return pg.expedition_data_template[var_22_0].dungeon_id > 0
		end

		if var_21_0:existVisibleChampion(var_21_2.row, var_21_2.column) then
			var_21_4 = true

			local var_21_6 = var_21_0:getChampion(var_21_2.row, var_21_2.column)

			if chapter_skip_battle == 1 and pg.SdkMgr.GetInstance():CheckPretest() then
				arg_11_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = var_21_1.id
				})
			elseif not var_21_5(var_21_6) then
				arg_11_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpPreClear,
					id = var_21_1.id
				})
			elseif var_21_0:IsSkipPrecombat() then
				arg_11_0:emit(LevelMediator2.ON_START)
			else
				arg_11_0:emit(LevelMediator2.ON_STAGE)
			end
		elseif var_21_3.attachment == ChapterConst.AttachAmbush and var_21_3.flag == ChapterConst.CellFlagAmbush then
			local var_21_7

			var_21_7 = coroutine.wrap(function()
				arg_11_0:emit(LevelUIConst.DO_AMBUSH_WARNING, var_21_7)
				coroutine.yield()
				arg_11_0:emit(LevelUIConst.DISPLAY_AMBUSH_INFO, var_21_7)
				coroutine.yield()
			end)

			var_21_7()

			var_21_4 = true
		elseif ChapterConst.IsEnemyAttach(var_21_3.attachment) then
			if var_21_3.flag == ChapterConst.CellFlagActive then
				var_21_4 = true

				if chapter_skip_battle == 1 and pg.SdkMgr.GetInstance():CheckPretest() then
					arg_11_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpSkipBattle,
						id = var_21_1.id
					})
				elseif not var_21_5(var_21_3) then
					arg_11_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpPreClear,
						id = var_21_1.id
					})
				elseif var_21_0:IsSkipPrecombat() then
					arg_11_0:emit(LevelMediator2.ON_START)
				else
					arg_11_0:emit(LevelMediator2.ON_STAGE)
				end
			end
		elseif var_21_3.attachment == ChapterConst.AttachBox then
			if var_21_3.flag == ChapterConst.CellFlagActive then
				var_21_4 = true

				arg_11_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBox,
					id = var_21_1.id
				})
			end
		elseif var_21_3.attachment == ChapterConst.AttachSupply and var_21_3.attachmentId > 0 then
			var_21_4 = true

			local var_21_8, var_21_9 = var_21_0:getFleetAmmo(var_21_0.fleet)

			if var_21_9 < var_21_8 then
				arg_11_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSupply,
					id = var_21_1.id
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_enough"))
			end
		elseif var_21_3.attachment == ChapterConst.AttachStory then
			var_21_4 = true

			local var_21_10 = pg.map_event_template[var_21_3.attachmentId].memory
			local var_21_11 = pg.map_event_template[var_21_3.attachmentId].gametip

			if var_21_10 == 0 then
				return
			end

			local var_21_12 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_21_10)

			pg.ConnectionMgr.GetInstance():Send(11017, {
				story_id = var_21_10
			}, 11018, function(arg_24_0)
				return
			end)
			pg.NewStoryMgr.GetInstance():Play(var_21_12, function(arg_25_0, arg_25_1)
				local var_25_0 = arg_25_1 or 1

				if var_21_3.flag == ChapterConst.CellFlagActive then
					arg_11_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpStory,
						id = var_21_1.id,
						arg1 = var_25_0
					})
				end

				if var_21_11 ~= "" then
					local var_25_1

					for iter_25_0, iter_25_1 in ipairs(pg.memory_template.all) do
						local var_25_2 = pg.memory_template[iter_25_1]

						if table.contains(var_25_2.unlock_pre, var_21_12) then
							var_25_1 = var_25_2.title
						end
					end

					pg.TipsMgr.GetInstance():ShowTips(i18n(var_21_11, var_25_1))
				end
			end)
		end

		if not var_21_4 then
			if var_21_0:getRound() == ChapterConst.RoundEnemy then
				arg_11_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("level_click_to_move"))
			end
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.helpBtn, function()
		local var_26_0 = arg_11_0.contextData.chapterVO

		if var_26_0 then
			if var_26_0:existOni() then
				arg_11_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("levelScene_sphunt_help_tip")
				})
			elseif var_26_0:isTypeDefence() then
				arg_11_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("help_battle_defense")
				})
			elseif var_26_0:isPlayingWithBombEnemy() then
				arg_11_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("levelScene_bomb_help_tip")
				})
			elseif pg.map_event_list[var_26_0.id] and next(noEmptyStr(pg.map_event_list[var_26_0.id].help_pictures) or {}) then
				local var_26_1 = {
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

				for iter_26_0, iter_26_1 in pairs(pg.map_event_list[var_26_0.id].help_pictures) do
					table.insert(var_26_1, {
						icon = {
							path = "",
							atlas = iter_26_1
						}
					})
				end

				arg_11_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = var_26_1
				})
			else
				arg_11_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = pg.gametip.help_level_ui.tip
				})
			end
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.airSupremacy, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(arg_11_0, arg_11_0.shengfuBtn, function()
		arg_11_0:DisplayWinConditionPanel()
	end)
end

function var_0_0.SetSeriesOperation(arg_29_0, arg_29_1)
	arg_29_0.seriesOperation = arg_29_1
end

function var_0_0.SetGrid(arg_30_0, arg_30_1)
	arg_30_0.grid = arg_30_1
end

function var_0_0.SetPlayer(arg_31_0, arg_31_1)
	return
end

function var_0_0.SwitchToChapter(arg_32_0, arg_32_1)
	local var_32_0 = findTF(arg_32_0.topStage, "msg_panel/ambush")
	local var_32_1 = findTF(arg_32_0.rightStage, "target")
	local var_32_2 = findTF(arg_32_0.rightStage, "skip_events")

	setActive(var_32_0, arg_32_1:existAmbush())
	setActive(arg_32_0.airSupremacy, OPEN_AIR_DOMINANCE and arg_32_1:getConfig("air_dominance") > 0)

	local var_32_3 = arg_32_1:isLoop()

	setActive(arg_32_0.autoBattleBtn, var_32_3)

	if var_32_3 then
		arg_32_0:UpdateSkipPreCombatMark()
		arg_32_0:UpdateAutoFightPanel()
		arg_32_0:UpdateAutoFightMark()
	end

	arg_32_0.achieveOriginalY = -240

	setText(var_32_2:Find("Label"), i18n("map_event_skip"))

	local var_32_4 = "skip_events_on_" .. arg_32_1.id

	if arg_32_1:getConfig("event_skip") == 1 then
		if arg_32_1.progress > 0 or arg_32_1.defeatCount > 0 or arg_32_1.passCount > 0 then
			setActive(var_32_2, true)

			var_32_1.anchoredPosition = Vector2.New(var_32_1.anchoredPosition.x, arg_32_0.achieveOriginalY - 40)
			GetComponent(var_32_2, typeof(Toggle)).isOn = PlayerPrefs.GetInt(var_32_4, 1) == 1

			onToggle(arg_32_0, var_32_2, function(arg_33_0)
				PlayerPrefs.SetInt(var_32_4, arg_33_0 and 1 or 0)
			end)
		else
			setActive(var_32_2, false)

			if not PlayerPrefs.HasKey(var_32_4) then
				PlayerPrefs.SetInt(var_32_4, 0)
			end
		end
	else
		setActive(var_32_2, false)

		var_32_1.anchoredPosition = Vector2.New(var_32_1.anchoredPosition.x, arg_32_0.achieveOriginalY)
	end

	setActive(var_32_1, arg_32_1:existAchieve())
	setActive(arg_32_0.retreatBtn, true)
	arg_32_0.seriesOperation()
end

function var_0_0.SwitchToMap(arg_34_0)
	arg_34_0:DestroyAutoFightPanel()
end

function var_0_0.UpdateSkipPreCombatMark(arg_35_0)
	local var_35_0 = getProxy(ChapterProxy):GetSkipPrecombat() and "auto_battle_on" or "auto_battle_off"

	arg_35_0.loader:GetOffSpriteRequest(arg_35_0.autoBattleBtn)
	arg_35_0.loader:GetSprite("ui/levelstageview_atlas", var_35_0, arg_35_0.autoBattleBtn, true)
end

function var_0_0.updateStageInfo(arg_36_0)
	local var_36_0 = arg_36_0.contextData.chapterVO
	local var_36_1 = findTF(arg_36_0.topStage, "timer")
	local var_36_2 = findTF(arg_36_0.topStage, "unlimit")

	setWidgetText(var_36_1, "--:--:--")

	if arg_36_0.stageTimer then
		arg_36_0.stageTimer:Stop()
	end

	if var_36_0:getRemainTime() > var_36_0:getConfig("time") or var_36_0:getConfig("time") >= 8640000 then
		setActive(var_36_1, false)
		setActive(var_36_2, true)
	else
		setActive(var_36_1, true)
		setActive(var_36_2, false)

		arg_36_0.stageTimer = Timer.New(function()
			if IsNil(var_36_1) then
				return
			end

			local var_37_0 = var_36_0:getRemainTime()

			setWidgetText(var_36_1, pg.TimeMgr.GetInstance():DescCDTime(var_37_0))
		end, 1, -1)

		arg_36_0.stageTimer:Start()
		arg_36_0.stageTimer.func()
	end
end

function var_0_0.updateAmbushRate(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_0.contextData.chapterVO

	if not var_38_0:existAmbush() then
		return
	end

	local var_38_1 = var_38_0.fleet
	local var_38_2 = var_38_1:getInvestSums()
	local var_38_3 = findTF(arg_38_0.topStage, "msg_panel/ambush/label1")
	local var_38_4 = findTF(arg_38_0.topStage, "msg_panel/ambush/label2")
	local var_38_5 = findTF(arg_38_0.topStage, "msg_panel/ambush/value1")
	local var_38_6 = findTF(arg_38_0.topStage, "msg_panel/ambush/value2")

	setText(var_38_3, i18n("level_scene_title_word_1"))
	setText(var_38_5, math.floor(var_38_2))
	setText(var_38_4, i18n("level_scene_title_word_2"))

	if not var_38_0.activateAmbush then
		setText(var_38_6, i18n("ambush_display_none"))
		setTextColor(var_38_6, Color.New(0.4, 0.4, 0.4))
	else
		local var_38_7 = var_38_0:getAmbushRate(var_38_1, arg_38_1)
		local var_38_8, var_38_9 = ChapterConst.GetAmbushDisplay((not arg_38_2 or not var_38_0:existEnemy(ChapterConst.SubjectPlayer, arg_38_1.row, arg_38_1.column)) and var_38_7)

		setText(var_38_6, var_38_8)
		setTextColor(var_38_6, var_38_9)
	end
end

function var_0_0.updateStageAchieve(arg_39_0)
	local var_39_0 = arg_39_0.contextData.chapterVO

	if not var_39_0:existAchieve() then
		return
	end

	local var_39_1 = var_39_0.achieves
	local var_39_2 = findTF(arg_39_0.rightStage, "target")

	setActive(var_39_2, true)

	local var_39_3 = findTF(var_39_2, "detail")
	local var_39_4 = findTF(var_39_3, "achieve")
	local var_39_5 = findTF(var_39_3, "achieves")
	local var_39_6 = findTF(var_39_3, "click")
	local var_39_7 = findTF(var_39_2, "collapse")
	local var_39_8 = findTF(var_39_7, "star")
	local var_39_9 = findTF(var_39_7, "stars")

	setActive(var_39_4, false)
	setActive(var_39_8, false)
	removeAllChildren(var_39_5)
	removeAllChildren(var_39_9)

	for iter_39_0, iter_39_1 in ipairs(var_39_1) do
		local var_39_10 = cloneTplTo(var_39_4, var_39_5)
		local var_39_11 = ChapterConst.IsAchieved(iter_39_1)

		setActive(findTF(var_39_10, "star"), var_39_11)

		local var_39_12 = findTF(var_39_10, "desc")

		setText(var_39_12, ChapterConst.GetAchieveDesc(iter_39_1.type, var_39_0))
		setTextColor(var_39_12, var_39_11 and Color.yellow or Color.white)

		cloneTplTo(var_39_8, var_39_9):GetComponent(typeof(Image)).enabled = var_39_11
	end

	onButton(arg_39_0, var_39_6, function()
		shiftPanel(var_39_3, var_39_3.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_39_7, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(arg_39_0, var_39_7, function()
		shiftPanel(var_39_3, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_39_7, var_39_7.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)

	if not arg_39_0.isAchieveFirstInit then
		arg_39_0.isAchieveFirstInit = true

		triggerButton(var_39_6)
	end
end

function var_0_0.updateStageBarrier(arg_42_0)
	local var_42_0 = arg_42_0.contextData.chapterVO

	setActive(arg_42_0.panelBarrier, var_42_0:existOni())

	if not var_42_0:existOni() then
		return
	end

	local var_42_1 = arg_42_0.panelBarrier:Find("btn_barrier")

	setText(var_42_1:Find("nums"), var_42_0.modelCount)
	onButton(arg_42_0, var_42_1, function()
		if arg_42_0.grid.quadState == ChapterConst.QuadStateBarrierSetting then
			arg_42_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)

			return
		end

		arg_42_0.grid:updateQuadCells(ChapterConst.QuadStateBarrierSetting)
	end, SFX_PANEL)
end

function var_0_0.updateBombPanel(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0.contextData.chapterVO

	setActive(arg_44_0.bombPanel, var_44_0:isPlayingWithBombEnemy())

	if var_44_0:isPlayingWithBombEnemy() then
		setText(arg_44_0.bombPanel:Find("tx_step"), var_44_0:getBombChapterInfo().action_times - math.floor(var_44_0.roundIndex / 2))

		local var_44_1 = arg_44_0.bombPanel:Find("tx_score")
		local var_44_2 = tonumber(getText(var_44_1))
		local var_44_3 = var_44_0.modelCount

		LeanTween.cancel(go(var_44_1))

		if arg_44_1 and var_44_2 ~= var_44_3 then
			LeanTween.scale(go(var_44_1), Vector3(1.5, 1.5, 1), 0.2)

			local var_44_4 = (var_44_3 - var_44_2) * 0.1

			LeanTween.value(go(var_44_1), var_44_2, var_44_3, var_44_4):setOnUpdate(System.Action_float(function(arg_45_0)
				setText(var_44_1, math.floor(arg_45_0))
			end)):setOnComplete(System.Action(function()
				setText(var_44_1, var_44_3)
			end)):setEase(LeanTweenType.easeInOutSine):setDelay(0.2)
			LeanTween.scale(go(var_44_1), Vector3.one, 0.3):setDelay(1 + var_44_4)
		else
			var_44_1.localScale = Vector3.one

			setText(var_44_1, var_44_3)
		end
	end
end

function var_0_0.updateFleetBuff(arg_47_0)
	local var_47_0 = arg_47_0.contextData.chapterVO
	local var_47_1 = var_47_0.fleet
	local var_47_2 = var_47_0:GetShowingStrategies()

	if var_47_0:getChapterSupportFleet() and not var_47_0:IsSupportSubmarineStage() then
		table.insert(var_47_2, ChapterConst.StrategyAirSupportFriendly)
	end

	local var_47_3 = {}
	local var_47_4 = var_47_0:GetSubmarineFleet()

	if var_47_4 then
		local var_47_5 = _.filter(var_47_4:getStrategies(), function(arg_48_0)
			return pg.strategy_data_template[arg_48_0.id].type == ChapterConst.StgTypePassive and arg_48_0.count > 0
		end)

		if var_47_5 and #var_47_5 > 0 then
			_.each(var_47_5, function(arg_49_0)
				table.insert(var_47_3, {
					id = arg_49_0.id,
					count = arg_49_0.count
				})
			end)
		end
	end

	local var_47_6 = underscore.filter(var_47_0:GetWeather(), function(arg_50_0)
		local var_50_0 = pg.weather_data_template[arg_50_0]

		return noEmptyStr(var_50_0.buff_icon)
	end)
	local var_47_7 = 0

	if var_47_0:ExistDivingChampion() then
		var_47_7 = 1
	end

	local var_47_8 = _.map(_.values(var_47_1:getCommanders()), function(arg_51_0)
		return arg_51_0:getSkills()[1]
	end)
	local var_47_9 = findTF(arg_47_0.topStage, "icon_list/fleet_buffs")
	local var_47_10 = UIItemList.New(var_47_9, var_47_9:GetChild(0))

	var_47_10:make(function(arg_52_0, arg_52_1, arg_52_2)
		setActive(findTF(arg_52_2, "frame"), false)
		setActive(findTF(arg_52_2, "Text"), false)
		setActive(findTF(arg_52_2, "times"), false)

		if arg_52_0 == UIItemList.EventUpdate then
			local var_52_0 = GetComponent(arg_52_2, typeof(LayoutElement))

			var_52_0.preferredWidth = 64
			var_52_0.preferredHeight = 64

			if arg_52_1 + 1 <= #var_47_2 then
				local var_52_1 = var_47_2[arg_52_1 + 1]
				local var_52_2 = pg.strategy_data_template[var_52_1]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_52_2.icon, "", arg_52_2)

				local var_52_3

				if var_52_2.type == ChapterConst.StgTypeBindFleetPassive then
					var_52_3 = var_47_1:GetStrategyCount(var_52_1)

					setActive(findTF(arg_52_2, "times"), true)
					setText(findTF(arg_52_2, "times"), var_52_3)
				end

				local var_52_4 = var_52_2.iconSize

				if var_52_4 ~= "" then
					var_52_0.preferredWidth = var_52_4[1]
					var_52_0.preferredHeight = var_52_4[2]
				end

				onButton(arg_47_0, arg_52_2, function()
					arg_47_0:HandleShowMsgBox({
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = var_52_2.id,
							cfg = var_52_2,
							count = var_52_3
						}
					})
				end, SFX_PANEL)

				return
			end

			arg_52_1 = arg_52_1 - #var_47_2

			if arg_52_1 + 1 <= #var_47_6 then
				local var_52_5 = pg.weather_data_template[var_47_6[arg_52_1 + 1]]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_52_5.buff_icon, "", arg_52_2)
				onButton(arg_47_0, arg_52_2, function()
					arg_47_0:HandleShowMsgBox({
						hideNo = true,
						type = MSGBOX_TYPE_DROP_ITEM,
						name = var_52_5.name,
						content = var_52_5.buff_desc,
						iconPath = {
							"strategyicon/" .. var_52_5.buff_icon
						},
						yesText = pg.MsgboxMgr.TEXT_CONFIRM
					})
				end, SFX_PANEL)

				return
			end

			arg_52_1 = arg_52_1 - #var_47_6

			if arg_52_1 + 1 <= #var_47_3 then
				local var_52_6 = var_47_3[arg_52_1 + 1]
				local var_52_7 = pg.strategy_data_template[var_52_6.id]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_52_7.icon, "", arg_52_2)
				setActive(findTF(arg_52_2, "times"), true)
				setText(findTF(arg_52_2, "times"), var_52_6.count)
				onButton(arg_47_0, arg_52_2, function()
					arg_47_0:HandleShowMsgBox({
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = var_52_7.id,
							cfg = var_52_7
						},
						extendDesc = string.format(i18n("word_rest_times"), var_52_6.count)
					})
				end, SFX_PANEL)

				return
			end

			arg_52_1 = arg_52_1 - #var_47_3

			if arg_52_1 + 1 <= var_47_7 then
				GetImageSpriteFromAtlasAsync("strategyicon/submarine_approach", "", arg_52_2)
				onButton(arg_47_0, arg_52_2, function()
					arg_47_0:HandleShowMsgBox({
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

			arg_52_1 = arg_52_1 - var_47_7

			local var_52_8 = var_47_8[arg_52_1 + 1]

			GetImageSpriteFromAtlasAsync("commanderskillicon/" .. var_52_8:getConfig("icon"), "", arg_52_2)
			setText(findTF(arg_52_2, "Text"), "Lv." .. var_52_8:getConfig("lv"))
			setActive(findTF(arg_52_2, "Text"), true)
			setActive(findTF(arg_52_2, "frame"), true)
			onButton(arg_47_0, arg_52_2, function()
				arg_47_0:emit(LevelMediator2.ON_COMMANDER_SKILL, var_52_8)
			end, SFX_PANEL)
		end
	end)
	var_47_10:align(#var_47_2 + #var_47_3 + #var_47_6 + var_47_7 + #var_47_8)

	if OPEN_AIR_DOMINANCE and var_47_0:getConfig("air_dominance") > 0 then
		arg_47_0:updateAirDominance()
	end

	arg_47_0:updateEnemyCount()
	arg_47_0:updateChapterBuff()
end

function var_0_0.updateEnemyCount(arg_58_0)
	local var_58_0 = arg_58_0.contextData.chapterVO
	local var_58_1 = findTF(arg_58_0.topStage, "icon_list/enemy_count")
	local var_58_2 = tobool(underscore.detect(var_58_0.achieves, function(arg_59_0)
		return (arg_59_0.type == ChapterConst.AchieveType3 or arg_59_0.type == ChapterConst.AchieveType6) and not ChapterConst.IsAchieved(arg_59_0)
	end))

	setActive(var_58_1, var_58_2)

	if var_58_2 then
		local var_58_3 = var_58_0:getDisplayEnemyCount()

		setText(var_58_1:Find("Text"), var_58_3)
		GetImageSpriteFromAtlasAsync("enemycount", var_58_3 > 0 and "danger" or "safe", var_58_1)
		onButton(arg_58_0, var_58_1, function()
			if var_58_3 > 0 then
				arg_58_0:HandleShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_DROP_ITEM,
					name = i18n("star_require_enemy_title"),
					content = i18n("star_require_enemy_text", var_58_3),
					iconPath = {
						"enemycount",
						"danger"
					},
					yesText = i18n("star_require_enemy_check"),
					onYes = function()
						local var_61_0 = var_58_0:getNearestEnemyCell()

						arg_58_0.grid:focusOnCell(var_61_0)

						local var_61_1 = arg_58_0.grid:GetEnemyCellView(var_61_0)

						if var_61_1 and var_61_1.TweenShining then
							var_61_1:TweenShining(2)
						end
					end
				})
			else
				arg_58_0:HandleShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_DROP_ITEM,
					name = i18n("star_require_enemy_title"),
					content = i18n("star_require_enemy_text", var_58_3),
					iconPath = {
						"enemycount",
						"safe"
					}
				})
			end
		end, SFX_PANEL)
	end
end

function var_0_0.updateChapterBuff(arg_62_0)
	local var_62_0 = arg_62_0.contextData.chapterVO
	local var_62_1 = findTF(arg_62_0.topStage, "icon_list/chapter_buff")
	local var_62_2 = var_62_0:hasMitigation()

	SetActive(var_62_1, var_62_2)

	if var_62_2 then
		local var_62_3 = var_62_0:getRiskLevel()

		GetImageSpriteFromAtlasAsync("passstate", var_62_3 .. "_icon", var_62_1)
		onButton(arg_62_0, var_62_1, function()
			if not var_62_0:hasMitigation() then
				return
			end

			arg_62_0:HandleShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_DROP_ITEM,
				name = var_62_0:getChapterState(),
				iconPath = {
					"passstate",
					var_62_3 .. "_icon"
				},
				content = i18n("level_risk_level_mitigation_rate", var_62_0:getRemainPassCount(), var_62_0:getMitigationRate())
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateAirDominance(arg_64_0)
	local var_64_0, var_64_1, var_64_2 = arg_64_0.contextData.chapterVO:getAirDominanceValue()

	if not var_64_2 or var_64_2 ~= var_64_1 then
		arg_64_0.contextData.chapterVO:setAirDominanceStatus(var_64_1)
		getProxy(ChapterProxy):updateChapter(arg_64_0.contextData.chapterVO)
	end

	arg_64_0.isChange = var_64_2 and (var_64_1 == 0 and 3 or var_64_1) - (var_64_2 == 0 and 3 or var_64_2)

	arg_64_0:updateAirDominanceTitle(var_64_0, var_64_1, arg_64_0.isChange or 0)
end

function var_0_0.updateAirDominanceTitle(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	local var_65_0 = findTF(arg_65_0.airSupremacy, "label1")
	local var_65_1 = findTF(arg_65_0.airSupremacy, "label2")
	local var_65_2 = findTF(arg_65_0.airSupremacy, "value1")
	local var_65_3 = findTF(arg_65_0.airSupremacy, "value2")
	local var_65_4 = findTF(arg_65_0.airSupremacy, "up")
	local var_65_5 = findTF(arg_65_0.airSupremacy, "down")

	setText(var_65_0, i18n("level_scene_title_word_3"))
	setText(var_65_1, i18n("level_scene_title_word_4"))
	setText(var_65_2, math.floor(arg_65_1))
	setActive(var_65_4, false)
	setActive(var_65_5, false)

	if arg_65_3 ~= 0 then
		if LeanTween.isTweening(go(var_65_3)) then
			LeanTween.cancel(go(var_65_3))
		end

		LeanTween.value(go(var_65_3), 1, 0, 0.5):setOnUpdate(System.Action_float(function(arg_66_0)
			setTextAlpha(var_65_3, arg_66_0)
		end)):setOnComplete(System.Action(function()
			setText(var_65_3, ChapterConst.AirDominance[arg_65_2].name)
			setTextColor(var_65_3, ChapterConst.AirDominance[arg_65_2].color)
			LeanTween.value(go(var_65_3), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_68_0)
				setTextAlpha(var_65_3, arg_68_0)
			end))
		end))

		local function var_65_6(arg_69_0)
			setActive(arg_69_0, false)
		end

		var_65_4:GetComponent(typeof(DftAniEvent)):SetEndEvent(var_65_6)
		var_65_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(var_65_6)
		setActive(var_65_4, arg_65_3 > 0)
		setActive(var_65_5, arg_65_3 < 0)
	else
		setText(var_65_3, ChapterConst.AirDominance[arg_65_2].name)
		setTextColor(var_65_3, ChapterConst.AirDominance[arg_65_2].color)
	end
end

function var_0_0.UpdateDefenseStatus(arg_70_0)
	local var_70_0 = arg_70_0.contextData.chapterVO
	local var_70_1 = var_70_0:getPlayType() == ChapterConst.TypeDefence
	local var_70_2 = findTF(arg_70_0.bottomStage, "Normal/shengfu")

	setActive(var_70_2, var_70_1)

	if not var_70_1 then
		return
	end

	local var_70_3 = findTF(var_70_2, "hp"):GetComponent(typeof(Text))
	local var_70_4 = var_70_0.id
	local var_70_5 = pg.chapter_defense[var_70_4]

	var_70_3.text = i18n("desc_base_hp", "<color=#92FC63>" .. tostring(var_70_0.BaseHP) .. "</color>", var_70_5.port_hp)
end

function var_0_0.DisplayWinConditionPanel(arg_71_0)
	if not arg_71_0.winCondPanel then
		arg_71_0.winCondPanel = WinConditionDisplayPanel.New(arg_71_0._tf.parent, arg_71_0.event, arg_71_0.contextData)

		arg_71_0.winCondPanel:Load()
	end

	arg_71_0.winCondPanel:ActionInvoke("Enter", arg_71_0.contextData.chapterVO)
end

function var_0_0.DestroyWinConditionPanel(arg_72_0)
	if not arg_72_0.winCondPanel then
		return
	end

	arg_72_0.winCondPanel:Destroy()

	arg_72_0.winCondPanel = nil
end

function var_0_0.UpdateComboPanel(arg_73_0)
	local var_73_0 = arg_73_0.contextData.chapterVO
	local var_73_1 = pg.chapter_pop_template[var_73_0.id]

	if var_73_1 and var_73_1.combo_on then
		local var_73_2, var_73_3 = arg_73_0:GetSubView("LevelStageComboPanel")

		if var_73_3 then
			var_73_2:Load()
			var_73_2.buffer:SetParent(arg_73_0.leftStage, false)
		end

		local var_73_4 = getProxy(ChapterProxy):GetComboHistory(var_73_0.id)

		var_73_2.buffer:UpdateView(var_73_4 or var_73_0)
		var_73_2.buffer:UpdateViewAnimated(var_73_0)
	end
end

function var_0_0.UpdateDOALinkFeverPanel(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_0.contextData.chapterVO
	local var_74_1 = var_74_0:GetBindActID()
	local var_74_2 = var_74_0:getConfig("levelstage_bar")

	if not var_74_2 or var_74_2 == "" then
		existCall(arg_74_1)

		return
	end

	local var_74_3, var_74_4 = arg_74_0:GetSubView(var_74_2)

	if var_74_4 then
		var_74_3:Load()
		var_74_3.buffer:SetParent(arg_74_0._tf, false)
	end

	var_74_3.buffer:UpdateView(var_74_0, arg_74_1)
end

local var_0_2 = Vector2(396, 128)
local var_0_3 = Vector2(128, 128)

function var_0_0.updateStageStrategy(arg_75_0)
	local var_75_0 = arg_75_0.contextData.chapterVO
	local var_75_1 = findTF(arg_75_0.rightStage, "event")
	local var_75_2 = findTF(var_75_1, "detail")
	local var_75_3 = findTF(var_75_2, "click")
	local var_75_4 = findTF(var_75_2, "items")

	var_75_4:GetComponent(typeof(GridLayoutGroup)).cellSize = arg_75_0._showStrategyDetail and var_0_2 or var_0_3

	local var_75_5 = findTF(var_75_4, "item")
	local var_75_6 = findTF(var_75_1, "collapse")

	setActive(var_75_5, false)

	local var_75_7 = var_75_0:GetInteractableStrategies()
	local var_75_8

	local function var_75_9(arg_76_0, arg_76_1, arg_76_2)
		if arg_76_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_76_0 = arg_76_2:Find("detail")

		setActive(var_76_0, arg_75_0._showStrategyDetail)

		local var_76_1 = arg_76_2:Find("icon")
		local var_76_2 = var_75_7[arg_76_1 + 1]
		local var_76_3
		local var_76_4

		if var_76_2.id == ChapterConst.StrategyHuntingRange then
			var_76_3 = ChapterConst.StgTypeConst
			var_76_4 = arg_75_0.contextData.huntingRangeVisibility % 2 == 1 and "range_invisible" or "range_visible"

			setText(var_76_0, i18n("help_sub_limits"))
		elseif var_76_2.id == ChapterConst.StrategySubAutoAttack then
			var_76_3 = ChapterConst.StgTypeConst
			var_76_4 = var_75_0.subAutoAttack == 0 and "sub_dont_auto_attack" or "sub_auto_attack"

			setText(var_76_0, i18n("help_sub_display"))
		else
			local var_76_5 = pg.strategy_data_template[var_76_2.id]

			var_76_3 = var_76_5.type
			var_76_4 = var_76_5.icon

			setText(var_76_0, var_76_5.desc)
		end

		GetImageSpriteFromAtlasAsync("strategyicon/" .. var_76_4, "", var_76_1:Find("icon"))
		onButton(arg_75_0, var_76_1, function()
			if var_76_2.id == ChapterConst.StrategyHuntingRange then
				arg_75_0.grid:toggleHuntingRange()
				var_75_9(arg_76_0, arg_76_1, arg_76_2)
			elseif var_76_2.id == ChapterConst.StrategySubAutoAttack then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ai_change_" .. 1 - var_75_0.subAutoAttack + 1))
				arg_75_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSubState,
					arg1 = 1 - var_75_0.subAutoAttack
				})
			elseif var_76_2.id == ChapterConst.StrategyExchange then
				local var_77_0 = var_75_0:getNextValidIndex()

				if var_77_0 > 0 and var_76_2.count > 0 then
					local var_77_1 = var_75_0.fleet

					arg_75_0:HandleShowMsgBox({
						content = i18n("levelScene_who_to_exchange"),
						onYes = function()
							arg_75_0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpStrategy,
								id = var_77_1.id,
								arg1 = ChapterConst.StrategyExchange,
								arg2 = var_75_0.fleets[var_77_0].id
							})
						end
					})
				end
			elseif var_76_2.id == ChapterConst.StrategySubTeleport then
				arg_75_0:SwitchSubTeleportBottomStage()
				arg_75_0:SwitchBottomStagePanel(true)
				arg_75_0.grid:ShowStaticHuntingRange()
				arg_75_0.grid:PrepareSubTeleport()
				arg_75_0.grid:updateQuadCells(ChapterConst.QuadStateTeleportSub)
			elseif var_76_2.id == ChapterConst.StrategyMissileStrike then
				if not var_75_0.fleet:canUseStrategy(var_76_2) then
					return
				end

				arg_75_0:SwitchMissileBottomStagePanel()
				arg_75_0:SwitchBottomStagePanel(true)
				arg_75_0.grid:updateQuadCells(ChapterConst.QuadStateMissileStrike)
			elseif var_76_2.id == ChapterConst.StrategyAirSupport then
				if not var_75_0:getChapterSupportFleet():canUseStrategy(var_76_2) then
					return
				end

				arg_75_0:SwitchAirSupportBottomStagePanel()
				arg_75_0:SwitchBottomStagePanel(true)
				arg_75_0.grid:updateQuadCells(ChapterConst.QuadStateAirSuport)
			elseif var_76_2.id == ChapterConst.StrategyExpel then
				if not var_75_0:getChapterSupportFleet():canUseStrategy(var_76_2) then
					return
				end

				arg_75_0:SwitchAirExpelBottomStagePanel()
				arg_75_0:SwitchBottomStagePanel(true)
				arg_75_0.grid:updateQuadCells(ChapterConst.QuadStateExpel)
			elseif var_76_3 == ChapterConst.StgTypeForm then
				local var_77_2 = var_75_0.fleet
				local var_77_3 = table.indexof(ChapterConst.StrategyForms, var_76_2.id)

				arg_75_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpStrategy,
					id = var_77_2.id,
					arg1 = ChapterConst.StrategyForms[var_77_3 % #ChapterConst.StrategyForms + 1]
				})
			else
				arg_75_0:emit(LevelUIConst.DISPLAY_STRATEGY_INFO, var_76_2)
			end
		end, SFX_PANEL)

		if var_76_3 == ChapterConst.StgTypeForm then
			setText(var_76_1:Find("nums"), "")
			setActive(var_76_1:Find("mask"), false)
			setActive(var_76_1:Find("selected"), true)
		else
			setText(var_76_1:Find("nums"), var_76_2.count or "")
			setActive(var_76_1:Find("mask"), var_76_2.count == 0)
			setActive(var_76_1:Find("selected"), false)
		end
	end

	UIItemList.StaticAlign(var_75_4, var_75_5, #var_75_7, var_75_9)
	onButton(arg_75_0, var_75_3, function()
		shiftPanel(var_75_2, var_75_2.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_75_6, -30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(arg_75_0, var_75_6, function()
		shiftPanel(var_75_2, 35, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_75_6, var_75_6.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
end

function var_0_0.GetSubView(arg_81_0, arg_81_1)
	if arg_81_0.attachSubViews[arg_81_1] then
		return arg_81_0.attachSubViews[arg_81_1]
	end

	local var_81_0 = _G[arg_81_1].New(arg_81_0)

	assert(var_81_0, "cant't find subview " .. (arg_81_1 or "nil"))

	arg_81_0.attachSubViews[arg_81_1] = var_81_0

	return var_81_0, true
end

function var_0_0.RemoveSubView(arg_82_0, arg_82_1)
	if not arg_82_0.attachSubViews[arg_82_1] then
		return false
	end

	arg_82_0.attachSubViews[arg_82_1]:Destroy()

	arg_82_0.attachSubViews[arg_82_1] = nil

	return true
end

function var_0_0.ClearSubViews(arg_83_0)
	for iter_83_0, iter_83_1 in pairs(arg_83_0.attachSubViews) do
		iter_83_1:Destroy()
	end

	table.clear(arg_83_0.attachSubViews)
end

function var_0_0.updateStageFleet(arg_84_0)
	local var_84_0 = arg_84_0.contextData.chapterVO
	local var_84_1 = findTF(arg_84_0.leftStage, "fleet")
	local var_84_2 = findTF(var_84_1, "shiptpl")
	local var_84_3 = arg_84_0.topStage:Find("msg_panel/fleet_info/number")

	setActive(var_84_2, false)
	setText(var_84_3, var_84_0.fleet.id)

	local var_84_4 = var_84_0.fleet:getShips(true)

	local function var_84_5(arg_85_0, arg_85_1)
		local var_85_0 = UIItemList.New(arg_85_0, var_84_2)

		var_85_0:make(function(arg_86_0, arg_86_1, arg_86_2)
			if arg_86_0 == UIItemList.EventUpdate then
				local var_86_0 = arg_85_1[arg_86_1 + 1]

				updateShip(arg_86_2, var_86_0)

				local var_86_1 = var_86_0.hpRant
				local var_86_2 = var_86_0:getShipProperties()
				local var_86_3 = math.floor((var_86_0.hpChange or 0) / 10000 * var_86_2[AttributeType.Durability])
				local var_86_4 = findTF(arg_86_2, "HP_POP")

				setActive(var_86_4, true)
				setActive(findTF(var_86_4, "heal"), false)
				setActive(findTF(var_86_4, "normal"), false)

				local function var_86_5(arg_87_0, arg_87_1)
					setActive(arg_87_0, true)
					setText(findTF(arg_87_0, "text"), arg_87_1)
					setTextAlpha(findTF(arg_87_0, "text"), 0)
					LeanTween.moveY(arg_87_0, 60, 1)
					LeanTween.textAlpha(findTF(arg_87_0, "text"), 1, 0.3)
					LeanTween.textAlpha(findTF(arg_87_0, "text"), 0, 0.5):setDelay(0.7):setOnComplete(System.Action(function()
						arg_87_0.localPosition = Vector3(0, 0, 0)
					end))
				end

				if var_86_3 > 0 then
					var_86_5(findTF(var_86_4, "heal"), var_86_3)
				elseif var_86_3 < 0 then
					LeanTween.delayedCall(0.6, System.Action(function()
						local var_89_0 = arg_86_2.transform.localPosition.x

						LeanTween.moveX(arg_86_2, var_89_0, 0.05):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(4)
						LeanTween.alpha(findTF(arg_86_2, "red"), 0.5, 0.4)
						LeanTween.alpha(findTF(arg_86_2, "red"), 0, 0.4):setDelay(0.4)
						var_86_5(findTF(var_86_4, "normal"), var_86_3)
					end))
				end

				local var_86_6 = findTF(arg_86_2, "blood")
				local var_86_7 = findTF(arg_86_2, "blood/fillarea/green")
				local var_86_8 = findTF(arg_86_2, "blood/fillarea/red")
				local var_86_9 = var_86_1 < ChapterConst.HpGreen
				local var_86_10 = var_86_1 == 0

				setActive(var_86_7, not var_86_9)
				setActive(var_86_8, var_86_9)

				var_86_6:GetComponent(typeof(Slider)).fillRect = var_86_9 and var_86_8 or var_86_7

				setSlider(var_86_6, 0, 10000, var_86_1)
				setActive(findTF(arg_86_2, "repairmask"), var_86_9)
				setActive(findTF(arg_86_2, "repairmask/broken"), var_86_10)
				onButton(arg_84_0, arg_86_2:Find("repairmask"), function()
					arg_84_0:emit(LevelUIConst.DISPLAY_REPAIR_WINDOW, var_86_0)
				end, SFX_PANEL)

				local var_86_11 = findTF(arg_86_2, "repairmask/icon").gameObject

				if not var_86_9 then
					LeanTween.cancel(var_86_11)
					setImageAlpha(var_86_11, 1)
				end

				if var_86_9 and not LeanTween.isTweening(var_86_11) then
					LeanTween.alpha(rtf(var_86_11), 0, 2):setLoopPingPong()
				end

				local var_86_12 = GetOrAddComponent(arg_86_2, "UILongPressTrigger").onLongPressed

				pg.DelegateInfo.Add(arg_84_0, var_86_12)
				var_86_12:RemoveAllListeners()
				var_86_12:AddListener(function()
					arg_84_0:emit(LevelMediator2.ON_STAGE_SHIPINFO, {
						shipId = var_86_0.id,
						shipVOs = var_84_4
					})
				end)
			end
		end)
		var_85_0:align(#arg_85_1)
	end

	var_84_5(var_84_1:Find("main"), var_84_0.fleet:getShipsByTeam(TeamType.Main, true))
	var_84_5(var_84_1:Find("vanguard"), var_84_0.fleet:getShipsByTeam(TeamType.Vanguard, true))
	var_84_0.fleet:clearShipHpChange()
end

function var_0_0.updateSupportFleet(arg_92_0)
	local var_92_0 = arg_92_0.contextData.chapterVO:getChapterSupportFleet()
	local var_92_1 = findTF(arg_92_0.leftStage, "support_fleet")

	setActive(var_92_1, tobool(var_92_0))

	if var_92_0 then
		local var_92_2 = findTF(var_92_1, "show/ship_container")

		removeAllChildren(var_92_2)

		local var_92_3 = findTF(var_92_1, "show/shiptpl")
		local var_92_4 = var_92_0:getShips()

		for iter_92_0, iter_92_1 in pairs(var_92_4) do
			local var_92_5 = cloneTplTo(var_92_3, var_92_2)

			setActive(var_92_5, true)
			updateShip(var_92_5, iter_92_1)
		end

		local var_92_6 = var_92_1:Find("hide")
		local var_92_7 = var_92_1:Find("show")

		local function var_92_8(arg_93_0)
			setActive(var_92_6, true)
			setActive(var_92_7, true)
			shiftPanel(var_92_7, nil, arg_93_0 and -325.1 or -855, 0.3, 0, true, nil, LeanTweenType.easeOutSine, function()
				setActive(var_92_6, not arg_93_0)
				setActive(var_92_7, arg_93_0)
			end)
			shiftPanel(var_92_6, nil, arg_93_0 and -1017 or -563.97, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		end

		onButton(arg_92_0, var_92_6, function()
			var_92_8(true)
		end, SFX_PANEL)
		onButton(arg_92_0, var_92_7, function()
			var_92_8(false)
		end)
	end
end

function var_0_0.ShiftStagePanelIn(arg_97_0, arg_97_1)
	shiftPanel(arg_97_0.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine, arg_97_1)
	arg_97_0:ShiftBottomStage(true)
	shiftPanel(arg_97_0.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_97_0.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.ShiftStagePanelOut(arg_98_0, arg_98_1)
	shiftPanel(arg_98_0.topStage, 0, arg_98_0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine, arg_98_1)
	arg_98_0:ShiftBottomStage(false)
	shiftPanel(arg_98_0.leftStage, -arg_98_0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_98_0.rightStage, arg_98_0.rightStage.rect.width + 300, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.ShiftBottomStage(arg_99_0, arg_99_1)
	arg_99_1 = not arg_99_0.bottomStageInactive and arg_99_1

	local var_99_0 = arg_99_1 and 0 or -arg_99_0.bottomStage.rect.height

	shiftPanel(arg_99_0.bottomStage, 0, var_99_0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.SwitchSubTeleportBottomStage(arg_100_0)
	setActive(arg_100_0.missileStrikeRole, true)
	setText(findTF(arg_100_0.missileStrikeRole, "confirm_button/Text"), i18n("levelscene_deploy_submarine"))
	setText(findTF(arg_100_0.missileStrikeRole, "cancel_button/Text"), i18n("levelscene_deploy_submarine_cancel"))
	onButton(arg_100_0, arg_100_0.missileStrikeRole:Find("confirm_button"), function()
		local var_101_0 = arg_100_0.contextData.chapterVO
		local var_101_1 = var_101_0:GetSubmarineFleet()
		local var_101_2 = var_101_1.startPos
		local var_101_3 = arg_100_0.grid.subTeleportTargetLine

		if not var_101_3 then
			return
		end

		local var_101_4 = var_101_0:findPath(nil, var_101_2, var_101_3)
		local var_101_5 = arg_100_0.grid:TransformLine2PlanePos(var_101_2)
		local var_101_6 = arg_100_0.grid:TransformLine2PlanePos(var_101_3)
		local var_101_7 = math.ceil(pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2] * #var_101_1:getShips(false) * var_101_4 - 1e-05)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("tips_confirm_teleport_sub", var_101_5, var_101_6, var_101_4, var_101_7),
			onYes = function()
				arg_100_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSubTeleport,
					id = var_101_1.id,
					arg1 = var_101_3.row,
					arg2 = var_101_3.column
				})
			end
		})
	end, SFX_UI_CLICK)
	onButton(arg_100_0, arg_100_0.missileStrikeRole:Find("cancel_button"), function()
		arg_100_0:SwitchBottomStagePanel(false)
		arg_100_0.grid:TurnOffSubTeleport()
		arg_100_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchMissileBottomStagePanel(arg_104_0)
	setActive(arg_104_0.missileStrikeRole, true)
	setText(findTF(arg_104_0.missileStrikeRole, "confirm_button/Text"), i18n("missile_attack_area_confirm"))
	setText(findTF(arg_104_0.missileStrikeRole, "cancel_button/Text"), i18n("missile_attack_area_cancel"))
	onButton(arg_104_0, arg_104_0.missileStrikeRole:Find("confirm_button"), function()
		local var_105_0 = arg_104_0.grid.missileStrikeTargetLine

		if not var_105_0 then
			return
		end

		local var_105_1 = arg_104_0.contextData.chapterVO.fleet

		;(function()
			arg_104_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_105_1.id,
				arg1 = ChapterConst.StrategyMissileStrike,
				arg2 = var_105_0.row,
				arg3 = var_105_0.column
			})
		end)()
	end, SFX_UI_CLICK)
	onButton(arg_104_0, arg_104_0.missileStrikeRole:Find("cancel_button"), function()
		arg_104_0:SwitchBottomStagePanel(false)
		arg_104_0.grid:HideMissileAimingMark()
		arg_104_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchAirSupportBottomStagePanel(arg_108_0)
	setActive(arg_108_0.missileStrikeRole, true)
	setText(findTF(arg_108_0.missileStrikeRole, "confirm_button/Text"), i18n("missile_attack_area_confirm"))
	setText(findTF(arg_108_0.missileStrikeRole, "cancel_button/Text"), i18n("missile_attack_area_cancel"))
	onButton(arg_108_0, arg_108_0.missileStrikeRole:Find("confirm_button"), function()
		local var_109_0 = arg_108_0.grid.missileStrikeTargetLine

		if not var_109_0 then
			return
		end

		local var_109_1 = arg_108_0.contextData.chapterVO:getChapterSupportFleet()

		;(function()
			arg_108_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_109_1.id,
				arg1 = ChapterConst.StrategyAirSupport,
				arg2 = var_109_0.row,
				arg3 = var_109_0.column
			})
		end)()
	end, SFX_UI_CLICK)
	onButton(arg_108_0, arg_108_0.missileStrikeRole:Find("cancel_button"), function()
		arg_108_0:SwitchBottomStagePanel(false)
		arg_108_0.grid:HideAirSupportAimingMark()
		arg_108_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchAirExpelBottomStagePanel(arg_112_0)
	setActive(arg_112_0.airExpelRole, true)
	setText(findTF(arg_112_0.airExpelRole, "cancel_button/Text"), i18n("levelscene_airexpel_cancel"))
	onButton(arg_112_0, arg_112_0.airExpelRole:Find("cancel_button"), function()
		arg_112_0:SwitchBottomStagePanel(false)
		arg_112_0.grid:HideAirExpelAimingMark()
		arg_112_0.grid:CleanAirSupport()
		arg_112_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchBottomStagePanel(arg_114_0, arg_114_1)
	setActive(arg_114_0.actionRole, true)
	setActive(arg_114_0.normalRole, true)
	shiftPanel(arg_114_0.actionRole, 0, arg_114_1 and 0 or var_0_1, 0.3, 0, true, true, nil, function()
		setActive(arg_114_0.actionRole, arg_114_1)
	end)
	shiftPanel(arg_114_0.normalRole, 0, arg_114_1 and var_0_1 or 0, 0.3, 0, true, true, nil, function()
		setActive(arg_114_0.normalRole, not arg_114_1)

		if not arg_114_1 then
			eachChild(arg_114_0.actionRole, function(arg_117_0)
				setActive(arg_117_0, false)
			end)
		end
	end)
	shiftPanel(arg_114_0.leftStage, arg_114_1 and -arg_114_0.leftStage.rect.width - 200 or 0, 0, 0.3, 0, true)
	shiftPanel(arg_114_0.rightStage, arg_114_1 and arg_114_0.rightStage.rect.width + 300 or 0, 0, 0.3, 0, true)
end

function var_0_0.ClickGridCellNormal(arg_118_0, arg_118_1)
	local var_118_0 = arg_118_0.contextData.chapterVO
	local var_118_1 = var_118_0.fleet
	local var_118_2 = _.detect(var_118_0.fleets, function(arg_119_0)
		return arg_119_0:getFleetType() == FleetType.Normal and arg_119_0.line.row == arg_118_1.row and arg_119_0.line.column == arg_118_1.column
	end)

	if var_118_2 and var_118_2:isValid() and var_118_2.id ~= var_118_1.id then
		arg_118_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSwitch,
			id = var_118_2.id
		})

		return
	end

	if arg_118_0:tryAutoTrigger(nil, true) then
		return
	end

	if arg_118_1.row == var_118_1.line.row and arg_118_1.column == var_118_1.line.column then
		return
	end

	local var_118_3 = var_118_0:getChapterCell(arg_118_1.row, arg_118_1.column)

	if var_118_3.attachment == ChapterConst.AttachStory and var_118_3.data == ChapterConst.StoryObstacle and var_118_3.flag == ChapterConst.CellFlagTriggerActive then
		local var_118_4 = pg.map_event_template[var_118_3.attachmentId]

		if var_118_4 and var_118_4.gametip and #var_118_4.gametip > 0 and var_118_0:getPlayType() ~= ChapterConst.TypeDefence then
			pg.TipsMgr.GetInstance():ShowTips(i18n(var_118_4.gametip))
		end

		return
	elseif not var_118_0:considerAsStayPoint(ChapterConst.SubjectPlayer, arg_118_1.row, arg_118_1.column) then
		return
	elseif var_118_0:existMoveLimit() then
		local var_118_5 = var_118_0:calcWalkableCells(ChapterConst.SubjectPlayer, var_118_1.line.row, var_118_1.line.column, var_118_1:getSpeed())

		if not _.any(var_118_5, function(arg_120_0)
			return arg_120_0.row == arg_118_1.row and arg_120_0.column == arg_118_1.column
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destination_not_in_range"))

			return
		end
	end

	local var_118_6 = var_118_0:findPath(ChapterConst.SubjectPlayer, var_118_1.line, {
		row = arg_118_1.row,
		column = arg_118_1.column
	})

	if var_118_6 < PathFinding.PrioObstacle then
		arg_118_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpMove,
			id = var_118_1.id,
			arg1 = arg_118_1.row,
			arg2 = arg_118_1.column
		})
	elseif var_118_6 < PathFinding.PrioForbidden then
		pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach"))
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach"))
	end
end

function var_0_0.tryAutoAction(arg_121_0, arg_121_1)
	if arg_121_0.doingAutoAction then
		return
	end

	arg_121_0.doingAutoAction = true

	local var_121_0 = arg_121_0.contextData.chapterVO

	if not var_121_0 then
		existCall(arg_121_1)

		return
	end

	if arg_121_0:SafeCheck() then
		existCall(arg_121_1)

		return
	end

	local var_121_1 = {}
	local var_121_2 = false

	for iter_121_0, iter_121_1 in pairs(var_121_0.cells) do
		if iter_121_1.trait == ChapterConst.TraitLurk then
			var_121_2 = true

			break
		end
	end

	if not var_121_2 then
		for iter_121_2, iter_121_3 in ipairs(var_121_0.champions) do
			if iter_121_3.trait == ChapterConst.TraitLurk then
				var_121_2 = true

				break
			end
		end
	end

	if var_121_2 then
		local var_121_3 = var_121_0:existOni()
		local var_121_4 = var_121_0:isPlayingWithBombEnemy()

		if not var_121_3 and not var_121_4 then
			table.insert(var_121_1, function(arg_122_0)
				arg_121_0:emit(LevelUIConst.DO_TRACKING, arg_122_0)
			end)
		else
			table.insertto(var_121_1, {
				function(arg_123_0)
					local var_123_0

					if var_121_3 then
						var_123_0 = "SpUnit"
					elseif var_121_4 then
						var_123_0 = "SpBomb"
					end

					assert(var_123_0)
					arg_121_0:emit(LevelUIConst.DO_PLAY_ANIM, {
						name = var_123_0,
						callback = function(arg_124_0)
							setActive(arg_124_0, false)
							arg_123_0()
						end
					})
				end,
				function(arg_125_0)
					local var_125_0 = var_121_0:getSpAppearStory()

					if var_125_0 and #var_125_0 > 0 then
						pg.NewStoryMgr.GetInstance():Play(var_125_0, arg_125_0)

						return
					end

					arg_125_0()
				end,
				function(arg_126_0)
					local var_126_0 = var_121_0:getSpAppearGuide()

					if var_126_0 and #var_126_0 > 0 then
						pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_126_0, nil, arg_126_0)

						return
					end

					arg_126_0()
				end
			})
		end

		table.insertto(var_121_1, {
			function(arg_127_0)
				parallelAsync({
					function(arg_128_0)
						arg_121_0:tryPlayChapterStory(arg_128_0)
					end,
					function(arg_129_0)
						local var_129_0 = var_121_0:GetBossCell()

						if var_129_0 and var_129_0.trait == ChapterConst.TraitLurk then
							arg_121_0.grid:focusOnCell(var_129_0, arg_129_0)

							return
						end

						arg_129_0()
					end
				}, arg_127_0)
			end,
			function(arg_130_0)
				arg_121_0:updateTrait(ChapterConst.TraitVirgin)
				arg_121_0.grid:updateAttachments()
				arg_121_0.grid:updateChampions()
				arg_121_0:updateTrait(ChapterConst.TraitNone)
				arg_121_0:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)
				Timer.New(arg_130_0, 0.5, 1):Start()
			end
		})
	end

	seriesAsync({
		function(arg_131_0)
			arg_121_0:emit(LevelUIConst.FROZEN)

			local var_131_0 = getProxy(ChapterProxy):GetLastDefeatedEnemy(var_121_0.id)

			if var_131_0 and (var_131_0.attachment ~= ChapterConst.AttachAmbush or ChapterConst.IsBossCell(var_131_0)) then
				local var_131_1 = ChapterConst.GetDestroyFX(var_131_0)

				arg_121_0.grid:PlayAttachmentEffect(var_131_0.line.row, var_131_0.line.column, var_131_1, Vector2.zero)
			end

			arg_121_0:PopBar()
			arg_121_0:UpdateComboPanel()
			arg_131_0()
		end,
		function(arg_132_0)
			if not (function()
				local var_133_0 = getProxy(ChapterProxy):GetLastDefeatedEnemy(var_121_0.id)

				if not var_133_0 then
					return
				end

				local var_133_1 = pg.expedition_data_template[var_133_0.attachmentId]

				return var_133_1 and var_133_1.type == ChapterConst.ExpeditionTypeMulBoss
			end)() then
				return arg_132_0()
			end

			arg_121_0:emit(LevelUIConst.DO_PLAY_ANIM, {
				name = "BossRetreatBar",
				callback = function(arg_134_0)
					setActive(arg_134_0, false)
					arg_132_0()
				end
			})
		end,
		function(arg_135_0)
			arg_121_0:UpdateDOALinkFeverPanel(arg_135_0)
		end,
		function(arg_136_0)
			seriesAsync(var_121_1, arg_136_0)
		end,
		function(arg_137_0)
			local var_137_0, var_137_1 = var_121_0:GetAttachmentStories()

			if var_137_0 then
				table.SerialIpairsAsync(var_137_0, function(arg_138_0, arg_138_1, arg_138_2)
					if arg_138_0 <= var_137_1 and arg_138_1 and type(arg_138_1) == "number" and arg_138_1 > 0 then
						local var_138_0 = pg.NewStoryMgr:StoryId2StoryName(arg_138_1)

						ChapterOpCommand.PlayChapterStory(var_138_0, arg_138_2, var_121_0:IsAutoFight())

						return
					end

					arg_138_2()
				end, arg_137_0)

				return
			end

			arg_137_0()
		end,
		function(arg_139_0)
			local var_139_0 = arg_121_0.contextData.chapterVO.id
			local var_139_1 = getProxy(ChapterProxy):getUpdatedExtraFlags(var_139_0)

			if not var_139_1 or #var_139_1 < 1 then
				arg_139_0()

				return
			end

			for iter_139_0, iter_139_1 in ipairs(var_139_1) do
				local var_139_2 = pg.chapter_status_effect[iter_139_1]
				local var_139_3 = var_139_2 and var_139_2.camera_focus or ""

				if type(var_139_3) == "table" then
					arg_121_0.grid:focusOnCell({
						row = var_139_3[1],
						column = var_139_3[2]
					}, arg_139_0)

					return
				end
			end

			arg_139_0()
		end,
		function(arg_140_0)
			if arg_121_0.exited then
				return
			end

			arg_121_0:emit(LevelUIConst.UN_FROZEN)
			;(function()
				local var_141_0 = getProxy(ChapterProxy)
				local var_141_1 = var_141_0:getActiveChapter(true)

				if not var_141_1 then
					return
				end

				local var_141_2 = var_141_1.id

				var_141_0:RecordComboHistory(var_141_2, nil)
				var_141_0:RecordLastDefeatedEnemy(var_141_2, nil)
				var_141_0:extraFlagUpdated(var_141_2)
				var_141_0:RemoveExtendChapterData(var_141_2, "FleetMoveDistance")
			end)()
			arg_140_0()
		end
	}, function()
		if arg_121_0.exited then
			return
		end

		arg_121_0.doingAutoAction = nil

		if var_121_2 and arg_121_0:TryEnterChapterStoryStage() then
			-- block empty
		else
			existCall(arg_121_1)
		end
	end)
end

function var_0_0.tryPlayChapterStory(arg_143_0, arg_143_1)
	local var_143_0 = arg_143_0.contextData.chapterVO
	local var_143_1 = var_143_0:getWaveCount()

	seriesAsync({
		function(arg_144_0)
			pg.SystemGuideMgr.GetInstance():PlayChapter(var_143_0, arg_144_0)
		end,
		function(arg_145_0)
			local var_145_0 = var_143_0:getConfig("story_refresh")
			local var_145_1 = var_145_0 and var_145_0[var_143_1]

			if var_145_1 and type(var_145_1) == "string" and var_145_1 ~= "" and not var_143_0:IsRemaster() then
				ChapterOpCommand.PlayChapterStory(var_145_1, arg_145_0, var_143_0:IsAutoFight())

				return
			end

			arg_145_0()
		end,
		function(arg_146_0)
			local var_146_0 = var_143_0:getConfig("story_refresh_boss")

			if var_146_0 and type(var_146_0) == "string" and var_146_0 ~= "" and not var_143_0:IsRemaster() and var_143_0:IsFinalBossRefreshed() then
				ChapterOpCommand.PlayChapterStory(var_146_0, arg_146_0, var_143_0:IsAutoFight())

				return
			end

			arg_146_0()
		end,
		function(arg_147_0)
			if var_143_1 == 1 and pg.map_event_list[var_143_0.id] and pg.map_event_list[var_143_0.id].help_open == 1 and PlayerPrefs.GetInt("help_displayed_on_" .. var_143_0.id, 0) == 0 then
				triggerButton(arg_143_0.helpBtn)
				PlayerPrefs.SetInt("help_displayed_on_" .. var_143_0.id, 1)
			end

			arg_147_0()
		end,
		function()
			existCall(arg_143_1)
		end
	})
end

function var_0_0.TryEnterChapterStoryStage(arg_149_0, arg_149_1)
	local var_149_0 = arg_149_0.contextData.chapterVO
	local var_149_1 = var_149_0:getWaveCount()
	local var_149_2 = var_149_0:getConfig("story_refresh")
	local var_149_3 = var_149_2 and var_149_2[var_149_1]

	if var_149_3 and type(var_149_3) == "number" and not var_149_0:IsRemaster() and not pg.NewStoryMgr.GetInstance():IsPlayed(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_149_3)) then
		arg_149_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_149_3)

		return true
	end

	local var_149_4 = var_149_0:getConfig("story_refresh_boss")

	if var_149_4 and type(var_149_4) == "number" and not var_149_0:IsRemaster() and var_149_0:IsFinalBossRefreshed() and not pg.NewStoryMgr.GetInstance():IsPlayed(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_149_4)) then
		arg_149_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_149_4)

		return true
	end
end

function var_0_0.TryEnterChapterSupportSubmarineStage(arg_150_0, arg_150_1)
	local var_150_0 = arg_150_0.contextData.chapterVO
	local var_150_1 = var_150_0:getChapterSupportFleet()
	local var_150_2 = {}

	if var_150_0:getChapterSupportFleet() then
		arg_150_0:emit(LevelMediator2.ON_SUPPORT_SUBMARINE)
	else
		arg_150_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OPSubStrike,
			arg1 = ys.Battle.BattleConst.BattleScore.C,
			callback = arg_150_1
		})
	end
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

function var_0_0.PopBar(arg_151_0)
	local var_151_0 = arg_151_0.contextData.chapterVO.id
	local var_151_1 = getProxy(ChapterProxy):getUpdatedExtraFlags(var_151_0)

	if not var_151_1 or #var_151_1 < 1 then
		return
	end

	local var_151_2 = var_151_1[1]
	local var_151_3 = var_0_4[var_151_2]

	if not var_151_3 then
		return
	end

	local var_151_4, var_151_5 = arg_151_0:GetSubView(var_151_3)

	if var_151_5 then
		var_151_4:Load()
	end

	var_151_4.buffer:PlayAnim()
end

function var_0_0.updateTrait(arg_152_0, arg_152_1)
	local var_152_0 = arg_152_0.contextData.chapterVO

	for iter_152_0, iter_152_1 in pairs(var_152_0.cells) do
		if iter_152_1.trait ~= ChapterConst.TraitNone then
			iter_152_1.trait = arg_152_1
		end
	end

	for iter_152_2, iter_152_3 in ipairs(var_152_0.champions) do
		if iter_152_3.trait ~= ChapterConst.TraitNone then
			iter_152_3.trait = arg_152_1
		end
	end
end

function var_0_0.CheckFleetChange(arg_153_0)
	local var_153_0 = arg_153_0.contextData.chapterVO
	local var_153_1 = var_153_0:GetActiveFleet()
	local var_153_2 = _.detect(var_153_0.fleets, function(arg_154_0)
		return not arg_154_0:isValid()
	end)

	if var_153_2 then
		arg_153_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRetreat,
			id = var_153_2.id
		})

		if var_153_2:getFleetType() == TeamType.Normal then
			getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.BATTLE_FAILED)
		end
	end

	if not var_153_1:isValid() then
		local var_153_3 = var_153_0:getNextValidIndex()

		if var_153_3 > 0 then
			local var_153_4 = var_153_0.fleets[var_153_3]

			local function var_153_5()
				arg_153_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSwitch,
					id = var_153_4.id
				})
			end

			arg_153_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("formation_switch_tip", var_153_4.name),
				onYes = var_153_5,
				onNo = var_153_5
			})
		end

		return true
	end

	return false
end

function var_0_0.tryAutoTrigger(arg_156_0, arg_156_1, arg_156_2)
	local var_156_0 = arg_156_0.contextData.chapterVO

	if arg_156_0:DoBreakAction() then
		return
	end

	if arg_156_0:CheckFleetChange() then
		return
	end

	return ((function()
		if var_156_0:checkAnyInteractive() then
			if not arg_156_1 or var_156_0:IsAutoFight() then
				triggerButton(arg_156_0.funcBtn)

				return true
			end
		elseif var_156_0:getRound() == ChapterConst.RoundEnemy then
			arg_156_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpEnemyRound
			})

			return true
		elseif var_156_0:getRound() == ChapterConst.RoundPlayer then
			if not arg_156_2 then
				arg_156_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			end

			if var_156_0:IsAutoFight() then
				arg_156_0:TryAutoFight()

				return true
			end
		end
	end)())
end

function var_0_0.DoBreakAction(arg_158_0)
	local var_158_0 = arg_158_0.contextData.chapterVO
	local var_158_1, var_158_2 = arg_158_0:SafeCheck()

	if var_158_1 then
		local function var_158_3(arg_159_0)
			local var_159_0

			seriesAsync({
				function(arg_160_0)
					arg_158_0:emit(LevelUIConst.ADD_MSG_QUEUE, arg_160_0)
				end,
				function(arg_161_0, arg_161_1)
					var_159_0 = arg_161_1

					ChapterOpCommand.PrepareChapterRetreat(arg_161_0)
				end,
				function(arg_162_0)
					existCall(arg_159_0)
					existCall(var_159_0)
				end
			})
		end

		if var_158_2 == ChapterConst.ReasonVictory then
			seriesAsync({
				function(arg_163_0)
					var_158_3(arg_163_0)
				end,
				function(arg_164_0)
					local var_164_0 = var_158_0:getConfig("win_condition_display") and #var_164_0 > 0 and var_164_0 .. "_tip"

					if var_164_0 and pg.gametip[var_164_0] then
						pg.TipsMgr.GetInstance():ShowTips(i18n(var_164_0))
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_win"))
					end

					arg_164_0()
				end
			})
		elseif var_158_2 == ChapterConst.ReasonDefeat then
			if var_158_0:getPlayType() == ChapterConst.TypeTransport then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_lose"))
				var_158_3()
			else
				arg_158_0:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("formation_invalide"),
					onYes = var_158_3,
					onClose = var_158_3
				})
			end
		elseif var_158_2 == ChapterConst.ReasonDefeatDefense then
			arg_158_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("harbour_bomb_tip"),
				onYes = var_158_3,
				onClose = var_158_3
			})
		elseif var_158_2 == ChapterConst.ReasonVictoryOni then
			var_158_3()
		elseif var_158_2 == ChapterConst.ReasonDefeatOni then
			var_158_3()
		elseif var_158_2 == ChapterConst.ReasonDefeatBomb then
			var_158_3()
		elseif var_158_2 == ChapterConst.ReasonOutTime then
			arg_158_0:emit(LevelMediator2.ON_TIME_UP)
		elseif var_158_2 == ChapterConst.ReasonActivityOutTime then
			arg_158_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("battle_preCombatMediator_activity_timeout"),
				onYes = var_158_3,
				onClose = var_158_3
			})
		end

		return true
	end

	return var_158_1
end

function var_0_0.SafeCheck(arg_165_0)
	local var_165_0 = arg_165_0.contextData.chapterVO

	if var_165_0:existOni() then
		local var_165_1 = var_165_0:checkOniState()

		if var_165_1 == 1 then
			return true, ChapterConst.ReasonVictoryOni
		elseif var_165_1 == 2 then
			return true, ChapterConst.ReasonDefeatOni
		else
			return false
		end
	elseif var_165_0:isPlayingWithBombEnemy() then
		if var_165_0:getBombChapterInfo().action_times * 2 <= var_165_0.roundIndex then
			return true, ChapterConst.ReasonDefeatBomb
		else
			return false
		end
	end

	local var_165_2, var_165_3 = var_165_0:CheckChapterWin()

	if var_165_2 then
		return true, var_165_3
	end

	local var_165_4, var_165_5 = var_165_0:CheckChapterLose()

	if var_165_4 then
		return true, var_165_5
	end

	if not var_165_0:inWartime() then
		return true, ChapterConst.ReasonOutTime
	end

	local var_165_6 = var_165_0:GetBindActID()

	if not arg_165_0.contextData.map:isRemaster() and var_165_6 ~= 0 then
		local var_165_7 = getProxy(ActivityProxy):getActivityById(var_165_6)

		if not var_165_7 or var_165_7:isEnd() then
			return true, ChapterConst.ReasonActivityOutTime
		end
	end

	return false
end

function var_0_0.TryAutoFight(arg_166_0)
	local var_166_0 = arg_166_0.contextData.chapterVO
	local var_166_1 = arg_166_0.contextData.map

	if not var_166_0:IsAutoFight() then
		return
	end

	local var_166_2 = var_166_0:GetAllEnemies()
	local var_166_3 = _.detect(var_166_2, function(arg_167_0)
		return ChapterConst.IsBossCell(arg_167_0)
	end)
	local var_166_4 = var_166_0:GetFleetOfDuty(tobool(var_166_3))

	if var_166_4 and var_166_4.id ~= var_166_0.fleet.id then
		arg_166_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSwitch,
			id = var_166_4.id
		})
		arg_166_0:tryAutoTrigger()

		return
	end

	if var_166_0:checkAnyInteractive() then
		arg_166_0:tryAutoTrigger()

		return
	end

	local var_166_5

	for iter_166_0, iter_166_1 in ipairs(var_166_0:getConfig("box_auto_pick")) do
		local var_166_6 = underscore.filter(switch(iter_166_1, {
			[ChapterConst.AttachBox] = function()
				return var_166_0:findChapterCells(iter_166_1)
			end,
			[ChapterConst.AttachSupply] = function()
				local var_169_0, var_169_1 = var_166_0:getFleetAmmo(var_166_4)

				if var_169_0 - var_169_1 < 3 then
					return {}
				else
					return underscore.filter(var_166_0:findChapterCells(iter_166_1), function(arg_170_0)
						return arg_170_0.attachmentId > 0
					end)
				end
			end
		}), function(arg_171_0)
			return arg_171_0.flag ~= ChapterConst.CellFlagDisabled
		end)

		for iter_166_2, iter_166_3 in ipairs(var_166_6) do
			local var_166_7, var_166_8 = var_166_0:findPath(ChapterConst.SubjectPlayer, var_166_4.line, iter_166_3)

			if var_166_7 < PathFinding.PrioObstacle then
				var_166_5 = var_166_5 or {}

				table.insert(var_166_5, {
					target = iter_166_3,
					priority = var_166_7,
					path = var_166_8
				})
			end
		end

		if var_166_5 then
			table.sort(var_166_5, CompareFuncs({
				function(arg_172_0)
					return arg_172_0.priority
				end
			}))

			break
		end
	end

	if not var_166_5 then
		if var_166_3 then
			local var_166_9, var_166_10 = var_166_0:FindBossPath(var_166_4.line, var_166_3)
			local var_166_11 = {}
			local var_166_12

			for iter_166_4, iter_166_5 in ipairs(var_166_10) do
				table.insert(var_166_11, iter_166_5)

				if var_166_0:existEnemy(ChapterConst.SubjectPlayer, iter_166_5.row, iter_166_5.column) then
					var_166_9 = iter_166_4
					var_166_12 = iter_166_5

					break
				end
			end

			var_166_5 = {
				{
					target = var_166_12 or var_166_3,
					priority = var_166_9 or 0,
					path = var_166_11
				}
			}
		else
			var_166_5 = underscore.map(var_166_2, function(arg_173_0)
				local var_173_0, var_173_1 = var_166_0:findPath(ChapterConst.SubjectPlayer, var_166_4.line, arg_173_0)

				return {
					target = arg_173_0,
					priority = var_173_0,
					path = var_173_1
				}
			end)

			local function var_166_13(arg_174_0)
				local var_174_0 = arg_174_0.target
				local var_174_1 = pg.expedition_data_template[var_174_0.attachmentId]

				assert(var_174_1, "expedition_data_template not exist: " .. var_174_0.attachmentId)

				if var_174_0.flag == ChapterConst.CellFlagDisabled then
					return 0
				end

				return ChapterConst.EnemyPreference[var_174_1.type]
			end

			if var_166_0.id == 1604 then
				table.sort(var_166_5, CompareFuncs({
					function(arg_175_0)
						return arg_175_0.priority < PathFinding.PrioObstacle and 0 or 1
					end,
					function(arg_176_0)
						return -var_166_13(arg_176_0)
					end,
					function(arg_177_0)
						return arg_177_0.priority
					end,
					function(arg_178_0)
						return arg_178_0.target.row
					end,
					function(arg_179_0)
						return -arg_179_0.target.column
					end
				}))
			else
				table.sort(var_166_5, CompareFuncs({
					function(arg_180_0)
						return arg_180_0.priority < PathFinding.PrioObstacle and 0 or 1
					end,
					function(arg_181_0)
						return -var_166_13(arg_181_0)
					end,
					function(arg_182_0)
						return arg_182_0.priority
					end
				}))
			end
		end
	end

	if var_166_5 and #var_166_5 > 0 and var_166_5[1].priority < PathFinding.PrioObstacle then
		local var_166_14 = var_166_5[1].target

		arg_166_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpMove,
			id = var_166_4.id,
			arg1 = var_166_14.row,
			arg2 = var_166_14.column
		})
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_errors_tip"))
		getProxy(ChapterProxy):SetChapterAutoFlag(var_166_0.id, false)
	end
end

function var_0_0.popStageStrategy(arg_183_0)
	local var_183_0 = arg_183_0.rightStage:Find("event/collapse")

	if var_183_0.anchoredPosition.x <= 1 then
		triggerButton(var_183_0)
	end
end

function var_0_0.UpdateAutoFightPanel(arg_184_0)
	if arg_184_0.contextData.chapterVO:CanActivateAutoFight() then
		if not arg_184_0.autoFightPanel then
			arg_184_0.autoFightPanel = LevelStageAutoFightPanel.New(arg_184_0.rightStage:Find("event/collapse"), arg_184_0.event, arg_184_0.contextData)

			arg_184_0.autoFightPanel:Load()

			arg_184_0.autoFightPanel.isFrozen = arg_184_0.isFrozen
		end

		arg_184_0.autoFightPanel.buffer:Show()
	elseif arg_184_0.autoFightPanel then
		arg_184_0.autoFightPanel.buffer:Hide()
	end
end

function var_0_0.UpdateAutoFightMark(arg_185_0)
	if not arg_185_0.autoFightPanel then
		return
	end

	arg_185_0.autoFightPanel.buffer:UpdateAutoFightMark()
end

function var_0_0.DestroyAutoFightPanel(arg_186_0)
	if not arg_186_0.autoFightPanel then
		return
	end

	arg_186_0.autoFightPanel:Destroy()

	arg_186_0.autoFightPanel = nil
end

function var_0_0.DestroyToast(arg_187_0)
	if not arg_187_0.toastPanel then
		return
	end

	arg_187_0.toastPanel:Destroy()

	arg_187_0.toastPanel = nil
end

function var_0_0.Toast(arg_188_0)
	arg_188_0:DestroyToast()

	local var_188_0 = table.remove(arg_188_0.toastQueue, 1)

	if not var_188_0 then
		return
	end

	arg_188_0.toastPanel = var_188_0.Class.New(arg_188_0)

	arg_188_0.toastPanel:Load()

	arg_188_0.toastPanel.contextData.settings = var_188_0

	arg_188_0.toastPanel.buffer:Play(function()
		arg_188_0:Toast()
	end)
end

function var_0_0.HandleShowMsgBox(arg_190_0, arg_190_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_190_1)
end

return var_0_0
