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

function var_0_0.getResource(arg_6_0)
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

	table.insertto(var_6_0, ResList.LevelStageViewResConst.GetResource(arg_6_0.contextData))

	return table.insertto(var_6_0, var_0_0.super.getResource(arg_6_0))
end

function var_0_0.downloadStageRes(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.contextData.chapterVO

	if arg_7_0._state == var_0_0.STATES.DESTROY or not ResList.ChapterResConst.IsActive(var_7_0) then
		return
	end

	local var_7_1 = ResList.LevelStageViewResConst.GetResource(arg_7_0.contextData)

	SplitPackConst.DownloadByLuaArr(var_7_1, function()
		local var_8_0 = arg_7_0.contextData.chapterVO

		if arg_7_0._state == var_0_0.STATES.DESTROY or not ResList.ChapterResConst.IsActive(var_8_0) or var_8_0.id ~= var_7_0.id then
			return
		end

		if var_8_0 ~= var_7_0 then
			arg_7_0:downloadStageRes(arg_7_1)

			return
		end

		arg_7_1()
	end)
end

function var_0_0.OnInit(arg_9_0)
	arg_9_0:InitUI()
	arg_9_0:AddListener()

	arg_9_0.loader = AutoLoader.New()
	arg_9_0.cgComp = GetOrAddComponent(arg_9_0._go, typeof(CanvasGroup))
	arg_9_0.cgComp.blocksRaycasts = not arg_9_0.isFrozen

	arg_9_0:Show()
end

function var_0_0.OnDestroy(arg_10_0)
	if arg_10_0.stageTimer then
		arg_10_0.stageTimer:Stop()

		arg_10_0.stageTimer = nil
	end

	arg_10_0:ClearSubViews()
	arg_10_0:DestroyAutoFightPanel()
	arg_10_0:DestroyWinConditionPanel()
	arg_10_0:DestroyToast()
	arg_10_0.loader:Clear()
	arg_10_0:Hide()
end

local var_0_1 = -300

function var_0_0.InitUI(arg_11_0)
	arg_11_0.topStage = arg_11_0._tf:Find("top_stage")

	setActive(arg_11_0.topStage, true)

	arg_11_0.bottomStage = arg_11_0._tf:Find("bottom_stage")
	arg_11_0.normalRole = findTF(arg_11_0.bottomStage, "Normal")
	arg_11_0.funcBtn = arg_11_0.normalRole:Find("func_button")
	arg_11_0.retreatBtn = arg_11_0.normalRole:Find("retreat_button")
	arg_11_0.switchBtn = arg_11_0.normalRole:Find("switch_button")
	arg_11_0.helpBtn = arg_11_0.normalRole:Find("help_button")
	arg_11_0.shengfuBtn = arg_11_0.normalRole:Find("shengfu/shengfu_button")
	arg_11_0.actionRole = findTF(arg_11_0.bottomStage, "Action")
	arg_11_0.missileStrikeRole = findTF(arg_11_0.actionRole, "MissileStrike")
	arg_11_0.airExpelRole = findTF(arg_11_0.actionRole, "AirExpel")

	setActive(arg_11_0.bottomStage, true)
	setAnchoredPosition(arg_11_0.normalRole, {
		x = 0,
		y = 0
	})
	setActive(arg_11_0.normalRole, true)
	setAnchoredPosition(arg_11_0.actionRole, {
		x = 0,
		y = var_0_1
	})
	setActive(arg_11_0.actionRole, false)
	eachChild(arg_11_0.actionRole, function(arg_12_0)
		setActive(arg_12_0, false)
	end)

	arg_11_0.leftStage = arg_11_0._tf:Find("left_stage")

	setActive(arg_11_0.leftStage, true)

	arg_11_0.rightStage = arg_11_0._tf:Find("right_stage")
	arg_11_0.bombPanel = arg_11_0.rightStage:Find("bomb_panel")
	arg_11_0.panelBarrier = arg_11_0.rightStage:Find("panel_barrier")
	arg_11_0.strategyPanelAnimator = arg_11_0.rightStage:Find("event"):GetComponent(typeof(Animator))
	arg_11_0.autoBattleBtn = arg_11_0.rightStage:Find("event/collapse/lock_fleet")
	arg_11_0.showDetailBtn = arg_11_0.rightStage:Find("event/detail/show_detail")

	setActive(arg_11_0.panelBarrier, false)
	setActive(arg_11_0.rightStage, true)

	arg_11_0.airSupremacy = arg_11_0.topStage:Find("msg_panel/air_supremacy")

	setAnchoredPosition(arg_11_0.topStage, {
		y = arg_11_0.topStage.rect.height
	})
	setAnchoredPosition(arg_11_0.leftStage, {
		x = -arg_11_0.leftStage.rect.width - 200
	})
	setAnchoredPosition(arg_11_0.rightStage, {
		x = arg_11_0.rightStage.rect.width + 300
	})
	setAnchoredPosition(arg_11_0.bottomStage, {
		y = -arg_11_0.bottomStage.rect.height
	})

	arg_11_0.attachSubViews = {}
end

function var_0_0.AddListener(arg_13_0)
	arg_13_0:bind(LevelUIConst.TRIGGER_ACTION, function()
		arg_13_0:tryAutoTrigger()
	end)
	arg_13_0:bind(LevelUIConst.STRATEGY_PANEL_AUTOFIGHT_ACTIVE, function(arg_15_0, arg_15_1)
		arg_13_0.strategyPanelAnimator:SetBool("IsActive", arg_15_1)

		arg_13_0.bottomStageInactive = arg_15_1

		arg_13_0:ShiftBottomStage(not arg_15_1)
	end)
	arg_13_0:bind(LevelUIConst.ON_CLICK_GRID_QUAD, function(arg_16_0, arg_16_1)
		arg_13_0:ClickGridCellNormal(arg_16_1)
	end)
	onButton(arg_13_0, arg_13_0.topStage:Find("option"), function()
		arg_13_0:emit(BaseUI.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.topStage:Find("back_button"), function()
		arg_13_0:emit(LevelUIConst.SWITCH_TO_MAP)
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.retreatBtn, function()
		local var_19_0 = arg_13_0.contextData.chapterVO
		local var_19_1 = arg_13_0.contextData.map
		local var_19_2 = "levelScene_whether_to_retreat"

		if var_19_0:existOni() then
			var_19_2 = "levelScene_oni_retreat"
		elseif var_19_0:isPlayingWithBombEnemy() then
			var_19_2 = "levelScene_bomb_retreat"
		elseif var_19_0:getPlayType() == ChapterConst.TypeTransport and not var_19_1:isSkirmish() then
			var_19_2 = "levelScene_escort_retreat"
		elseif var_19_1:isRemaster() then
			var_19_2 = "archives_whether_to_retreat"
		end

		arg_13_0:HandleShowMsgBox({
			content = i18n(var_19_2),
			onYes = ChapterOpCommand.PrepareChapterRetreat
		})
	end, SFX_UI_WEIGHANCHOR_WITHDRAW)
	onButton(arg_13_0, arg_13_0.switchBtn, function()
		local var_20_0 = arg_13_0.contextData.chapterVO
		local var_20_1 = var_20_0:getNextValidIndex()

		if var_20_1 > 0 then
			arg_13_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpSwitch,
				id = var_20_0.fleets[var_20_1].id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("formation_switch_failed"))
		end
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.autoBattleBtn, function()
		local var_21_0 = getProxy(ChapterProxy)
		local var_21_1 = var_21_0:GetSkipPrecombat()

		var_21_0:UpdateSkipPrecombat(not var_21_1)
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.showDetailBtn, function()
		arg_13_0._showStrategyDetail = not arg_13_0._showStrategyDetail and true

		arg_13_0:updateStageStrategy()
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.funcBtn, function()
		local var_23_0 = arg_13_0.contextData.chapterVO

		if not var_23_0:inWartime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_time_out"))

			return
		end

		local var_23_1 = var_23_0.fleet
		local var_23_2 = var_23_1.line
		local var_23_3 = var_23_0:getChapterCell(var_23_2.row, var_23_2.column)
		local var_23_4 = false

		local function var_23_5(arg_24_0)
			local var_24_0 = arg_24_0.attachmentId

			return pg.expedition_data_template[var_24_0].dungeon_id > 0
		end

		if var_23_0:existVisibleChampion(var_23_2.row, var_23_2.column) then
			var_23_4 = true

			local var_23_6 = var_23_0:getChampion(var_23_2.row, var_23_2.column)

			if chapter_skip_battle == 1 and pg.SdkMgr.GetInstance():CheckPretest() then
				arg_13_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = var_23_1.id
				})
			elseif not var_23_5(var_23_6) then
				arg_13_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpPreClear,
					id = var_23_1.id
				})
			elseif var_23_0:IsSkipPrecombat() then
				arg_13_0:emit(LevelMediator2.ON_START)
			else
				arg_13_0:emit(LevelMediator2.ON_STAGE)
			end
		elseif var_23_3.attachment == ChapterConst.AttachAmbush and var_23_3.flag == ChapterConst.CellFlagAmbush then
			local var_23_7

			var_23_7 = coroutine.wrap(function()
				arg_13_0:emit(LevelUIConst.DO_AMBUSH_WARNING, var_23_7)
				coroutine.yield()
				arg_13_0:emit(LevelUIConst.DISPLAY_AMBUSH_INFO, var_23_7)
				coroutine.yield()
			end)

			var_23_7()

			var_23_4 = true
		elseif ChapterConst.IsEnemyAttach(var_23_3.attachment) then
			if var_23_3.flag == ChapterConst.CellFlagActive then
				var_23_4 = true

				if chapter_skip_battle == 1 and pg.SdkMgr.GetInstance():CheckPretest() then
					arg_13_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpSkipBattle,
						id = var_23_1.id
					})
				elseif not var_23_5(var_23_3) then
					arg_13_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpPreClear,
						id = var_23_1.id
					})
				elseif var_23_0:IsSkipPrecombat() then
					arg_13_0:emit(LevelMediator2.ON_START)
				else
					arg_13_0:emit(LevelMediator2.ON_STAGE)
				end
			end
		elseif var_23_3.attachment == ChapterConst.AttachBox then
			if var_23_3.flag == ChapterConst.CellFlagActive then
				var_23_4 = true

				arg_13_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBox,
					id = var_23_1.id
				})
			end
		elseif var_23_3.attachment == ChapterConst.AttachSupply and var_23_3.attachmentId > 0 then
			var_23_4 = true

			local var_23_8, var_23_9 = var_23_0:getFleetAmmo(var_23_0.fleet)

			if var_23_9 < var_23_8 then
				arg_13_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSupply,
					id = var_23_1.id
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_enough"))
			end
		elseif var_23_3.attachment == ChapterConst.AttachStory then
			var_23_4 = true

			local var_23_10 = pg.map_event_template[var_23_3.attachmentId].memory
			local var_23_11 = pg.map_event_template[var_23_3.attachmentId].gametip

			if var_23_10 == 0 then
				return
			end

			local var_23_12 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_23_10)

			pg.ConnectionMgr.GetInstance():Send(11017, {
				story_id = var_23_10
			}, 11018, function(arg_26_0)
				return
			end)
			pg.NewStoryMgr.GetInstance():Play(var_23_12, function(arg_27_0, arg_27_1)
				local var_27_0 = arg_27_1 or 1

				if var_23_3.flag == ChapterConst.CellFlagActive then
					arg_13_0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpStory,
						id = var_23_1.id,
						arg1 = var_27_0
					})
				end

				if var_23_11 ~= "" then
					local var_27_1

					for iter_27_0, iter_27_1 in ipairs(pg.memory_template.all) do
						local var_27_2 = pg.memory_template[iter_27_1]

						if table.contains(var_27_2.unlock_pre, var_23_12) then
							var_27_1 = var_27_2.title
						end
					end

					pg.TipsMgr.GetInstance():ShowTips(i18n(var_23_11, var_27_1))
				end
			end)
		end

		if not var_23_4 then
			if var_23_0:getRound() == ChapterConst.RoundEnemy then
				arg_13_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("level_click_to_move"))
			end
		end
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.helpBtn, function()
		local var_28_0 = arg_13_0.contextData.chapterVO

		if var_28_0 then
			if var_28_0:existOni() then
				arg_13_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("levelScene_sphunt_help_tip")
				})
			elseif var_28_0:isTypeDefence() then
				arg_13_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("help_battle_defense")
				})
			elseif var_28_0:isPlayingWithBombEnemy() then
				arg_13_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("levelScene_bomb_help_tip")
				})
			elseif pg.map_event_list[var_28_0.id] and next(noEmptyStr(pg.map_event_list[var_28_0.id].help_pictures) or {}) then
				local var_28_1 = {
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

				for iter_28_0, iter_28_1 in pairs(pg.map_event_list[var_28_0.id].help_pictures) do
					table.insert(var_28_1, {
						icon = {
							path = "",
							atlas = iter_28_1
						}
					})
				end

				arg_13_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = var_28_1
				})
			else
				arg_13_0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = pg.gametip.help_level_ui.tip
				})
			end
		end
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.airSupremacy, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(arg_13_0, arg_13_0.shengfuBtn, function()
		arg_13_0:DisplayWinConditionPanel()
	end)
end

function var_0_0.SetSeriesOperation(arg_31_0, arg_31_1)
	arg_31_0.seriesOperation = arg_31_1
end

function var_0_0.SetGrid(arg_32_0, arg_32_1)
	arg_32_0.grid = arg_32_1
end

function var_0_0.SetPlayer(arg_33_0, arg_33_1)
	return
end

function var_0_0.SwitchToChapter(arg_34_0, arg_34_1)
	local var_34_0 = findTF(arg_34_0.topStage, "msg_panel/ambush")
	local var_34_1 = findTF(arg_34_0.rightStage, "target")
	local var_34_2 = findTF(arg_34_0.rightStage, "skip_events")

	setActive(var_34_0, arg_34_1:existAmbush())
	setActive(arg_34_0.airSupremacy, OPEN_AIR_DOMINANCE and arg_34_1:getConfig("air_dominance") > 0)

	local var_34_3 = arg_34_1:isLoop()

	setActive(arg_34_0.autoBattleBtn, var_34_3)

	if var_34_3 then
		arg_34_0:UpdateSkipPreCombatMark()
		arg_34_0:UpdateAutoFightPanel()
		arg_34_0:UpdateAutoFightMark()
	end

	arg_34_0.achieveOriginalY = -240

	setText(var_34_2:Find("Label"), i18n("map_event_skip"))

	local var_34_4 = "skip_events_on_" .. arg_34_1.id

	if arg_34_1:getConfig("event_skip") == 1 then
		if arg_34_1.progress > 0 or arg_34_1.defeatCount > 0 or arg_34_1.passCount > 0 then
			setActive(var_34_2, true)

			var_34_1.anchoredPosition = Vector2.New(var_34_1.anchoredPosition.x, arg_34_0.achieveOriginalY - 40)
			GetComponent(var_34_2, typeof(Toggle)).isOn = PlayerPrefs.GetInt(var_34_4, 1) == 1

			onToggle(arg_34_0, var_34_2, function(arg_35_0)
				PlayerPrefs.SetInt(var_34_4, arg_35_0 and 1 or 0)
			end)
		else
			setActive(var_34_2, false)

			if not PlayerPrefs.HasKey(var_34_4) then
				PlayerPrefs.SetInt(var_34_4, 0)
			end
		end
	else
		setActive(var_34_2, false)

		var_34_1.anchoredPosition = Vector2.New(var_34_1.anchoredPosition.x, arg_34_0.achieveOriginalY)
	end

	setActive(var_34_1, arg_34_1:existAchieve())
	setActive(arg_34_0.retreatBtn, true)
	arg_34_0.seriesOperation()
end

function var_0_0.SwitchToMap(arg_36_0)
	arg_36_0:DestroyAutoFightPanel()
end

function var_0_0.UpdateSkipPreCombatMark(arg_37_0)
	local var_37_0 = getProxy(ChapterProxy):GetSkipPrecombat() and "auto_battle_on" or "auto_battle_off"

	arg_37_0.loader:GetOffSpriteRequest(arg_37_0.autoBattleBtn)
	arg_37_0.loader:GetSprite("ui/levelstageview_atlas", var_37_0, arg_37_0.autoBattleBtn, true)
end

function var_0_0.updateStageInfo(arg_38_0)
	local var_38_0 = arg_38_0.contextData.chapterVO
	local var_38_1 = findTF(arg_38_0.topStage, "timer")
	local var_38_2 = findTF(arg_38_0.topStage, "unlimit")

	setWidgetText(var_38_1, "--:--:--")

	if arg_38_0.stageTimer then
		arg_38_0.stageTimer:Stop()
	end

	if var_38_0:getRemainTime() > var_38_0:getConfig("time") or var_38_0:getConfig("time") >= 8640000 then
		setActive(var_38_1, false)
		setActive(var_38_2, true)
	else
		setActive(var_38_1, true)
		setActive(var_38_2, false)

		arg_38_0.stageTimer = Timer.New(function()
			if IsNil(var_38_1) then
				return
			end

			local var_39_0 = var_38_0:getRemainTime()

			setWidgetText(var_38_1, pg.TimeMgr.GetInstance():DescCDTime(var_39_0))
		end, 1, -1)

		arg_38_0.stageTimer:Start()
		arg_38_0.stageTimer.func()
	end
end

function var_0_0.updateAmbushRate(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0.contextData.chapterVO

	if not var_40_0:existAmbush() then
		return
	end

	local var_40_1 = var_40_0.fleet
	local var_40_2 = var_40_1:getInvestSums()
	local var_40_3 = findTF(arg_40_0.topStage, "msg_panel/ambush/label1")
	local var_40_4 = findTF(arg_40_0.topStage, "msg_panel/ambush/label2")
	local var_40_5 = findTF(arg_40_0.topStage, "msg_panel/ambush/value1")
	local var_40_6 = findTF(arg_40_0.topStage, "msg_panel/ambush/value2")

	setText(var_40_3, i18n("level_scene_title_word_1"))
	setText(var_40_5, math.floor(var_40_2))
	setText(var_40_4, i18n("level_scene_title_word_2"))

	if not var_40_0.activateAmbush then
		setText(var_40_6, i18n("ambush_display_none"))
		setTextColor(var_40_6, Color.New(0.4, 0.4, 0.4))
	else
		local var_40_7 = var_40_0:getAmbushRate(var_40_1, arg_40_1)
		local var_40_8, var_40_9 = ChapterConst.GetAmbushDisplay((not arg_40_2 or not var_40_0:existEnemy(ChapterConst.SubjectPlayer, arg_40_1.row, arg_40_1.column)) and var_40_7)

		setText(var_40_6, var_40_8)
		setTextColor(var_40_6, var_40_9)
	end
end

function var_0_0.updateStageAchieve(arg_41_0)
	local var_41_0 = arg_41_0.contextData.chapterVO

	if not var_41_0:existAchieve() then
		return
	end

	local var_41_1 = var_41_0.achieves
	local var_41_2 = findTF(arg_41_0.rightStage, "target")

	setActive(var_41_2, true)

	local var_41_3 = findTF(var_41_2, "detail")
	local var_41_4 = findTF(var_41_3, "achieve")
	local var_41_5 = findTF(var_41_3, "achieves")
	local var_41_6 = findTF(var_41_3, "click")
	local var_41_7 = findTF(var_41_2, "collapse")
	local var_41_8 = findTF(var_41_7, "star")
	local var_41_9 = findTF(var_41_7, "stars")

	setActive(var_41_4, false)
	setActive(var_41_8, false)
	removeAllChildren(var_41_5)
	removeAllChildren(var_41_9)

	for iter_41_0, iter_41_1 in ipairs(var_41_1) do
		local var_41_10 = cloneTplTo(var_41_4, var_41_5)
		local var_41_11 = ChapterConst.IsAchieved(iter_41_1)

		setActive(findTF(var_41_10, "star"), var_41_11)

		local var_41_12 = findTF(var_41_10, "desc")

		setText(var_41_12, ChapterConst.GetAchieveDesc(iter_41_1.type, var_41_0))
		setTextColor(var_41_12, var_41_11 and Color.yellow or Color.white)

		cloneTplTo(var_41_8, var_41_9):GetComponent(typeof(Image)).enabled = var_41_11
	end

	onButton(arg_41_0, var_41_6, function()
		shiftPanel(var_41_3, var_41_3.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_41_7, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(arg_41_0, var_41_7, function()
		shiftPanel(var_41_3, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_41_7, var_41_7.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)

	if not arg_41_0.isAchieveFirstInit then
		arg_41_0.isAchieveFirstInit = true

		triggerButton(var_41_6)
	end
end

function var_0_0.updateStageBarrier(arg_44_0)
	local var_44_0 = arg_44_0.contextData.chapterVO

	setActive(arg_44_0.panelBarrier, var_44_0:existOni())

	if not var_44_0:existOni() then
		return
	end

	local var_44_1 = arg_44_0.panelBarrier:Find("btn_barrier")

	setText(var_44_1:Find("nums"), var_44_0.modelCount)
	onButton(arg_44_0, var_44_1, function()
		if arg_44_0.grid.quadState == ChapterConst.QuadStateBarrierSetting then
			arg_44_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)

			return
		end

		arg_44_0.grid:updateQuadCells(ChapterConst.QuadStateBarrierSetting)
	end, SFX_PANEL)
end

function var_0_0.updateBombPanel(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0.contextData.chapterVO

	setActive(arg_46_0.bombPanel, var_46_0:isPlayingWithBombEnemy())

	if var_46_0:isPlayingWithBombEnemy() then
		setText(arg_46_0.bombPanel:Find("tx_step"), var_46_0:getBombChapterInfo().action_times - math.floor(var_46_0.roundIndex / 2))

		local var_46_1 = arg_46_0.bombPanel:Find("tx_score")
		local var_46_2 = tonumber(getText(var_46_1))
		local var_46_3 = var_46_0.modelCount

		LeanTween.cancel(go(var_46_1))

		if arg_46_1 and var_46_2 ~= var_46_3 then
			LeanTween.scale(go(var_46_1), Vector3(1.5, 1.5, 1), 0.2)

			local var_46_4 = (var_46_3 - var_46_2) * 0.1

			LeanTween.value(go(var_46_1), var_46_2, var_46_3, var_46_4):setOnUpdate(System.Action_float(function(arg_47_0)
				setText(var_46_1, math.floor(arg_47_0))
			end)):setOnComplete(System.Action(function()
				setText(var_46_1, var_46_3)
			end)):setEase(LeanTweenType.easeInOutSine):setDelay(0.2)
			LeanTween.scale(go(var_46_1), Vector3.one, 0.3):setDelay(1 + var_46_4)
		else
			var_46_1.localScale = Vector3.one

			setText(var_46_1, var_46_3)
		end
	end
end

function var_0_0.updateFleetBuff(arg_49_0)
	arg_49_0:downloadStageRes(function()
		arg_49_0:updateFleetBuffAfterDownload()
	end)
end

function var_0_0.updateFleetBuffAfterDownload(arg_51_0)
	local var_51_0 = arg_51_0.contextData.chapterVO
	local var_51_1 = var_51_0.fleet
	local var_51_2 = var_51_0:GetShowingStrategies()

	if var_51_0:getChapterSupportFleet() and not var_51_0:IsSupportSubmarineStage() then
		table.insert(var_51_2, ChapterConst.StrategyAirSupportFriendly)
	end

	local var_51_3 = {}
	local var_51_4 = var_51_0:GetSubmarineFleet()

	if var_51_4 then
		local var_51_5 = _.filter(var_51_4:getStrategies(), function(arg_52_0)
			return pg.strategy_data_template[arg_52_0.id].type == ChapterConst.StgTypePassive and arg_52_0.count > 0
		end)

		if var_51_5 and #var_51_5 > 0 then
			_.each(var_51_5, function(arg_53_0)
				table.insert(var_51_3, {
					id = arg_53_0.id,
					count = arg_53_0.count
				})
			end)
		end
	end

	local var_51_6 = underscore.filter(var_51_0:GetWeather(), function(arg_54_0)
		local var_54_0 = pg.weather_data_template[arg_54_0]

		return noEmptyStr(var_54_0.buff_icon)
	end)
	local var_51_7 = 0

	if var_51_0:ExistDivingChampion() then
		var_51_7 = 1
	end

	local var_51_8 = _.map(_.values(var_51_1:getCommanders()), function(arg_55_0)
		return arg_55_0:getSkills()[1]
	end)
	local var_51_9 = findTF(arg_51_0.topStage, "icon_list/fleet_buffs")
	local var_51_10 = UIItemList.New(var_51_9, var_51_9:GetChild(0))

	var_51_10:make(function(arg_56_0, arg_56_1, arg_56_2)
		setActive(findTF(arg_56_2, "frame"), false)
		setActive(findTF(arg_56_2, "Text"), false)
		setActive(findTF(arg_56_2, "times"), false)

		if arg_56_0 == UIItemList.EventUpdate then
			local var_56_0 = GetComponent(arg_56_2, typeof(LayoutElement))

			var_56_0.preferredWidth = 64
			var_56_0.preferredHeight = 64

			if arg_56_1 + 1 <= #var_51_2 then
				local var_56_1 = var_51_2[arg_56_1 + 1]
				local var_56_2 = pg.strategy_data_template[var_56_1]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_56_2.icon, "", arg_56_2)

				local var_56_3

				if var_56_2.type == ChapterConst.StgTypeBindFleetPassive then
					var_56_3 = var_51_1:GetStrategyCount(var_56_1)

					setActive(findTF(arg_56_2, "times"), true)
					setText(findTF(arg_56_2, "times"), var_56_3)
				end

				local var_56_4 = var_56_2.iconSize

				if var_56_4 ~= "" then
					var_56_0.preferredWidth = var_56_4[1]
					var_56_0.preferredHeight = var_56_4[2]
				end

				onButton(arg_51_0, arg_56_2, function()
					arg_51_0:HandleShowMsgBox({
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = var_56_2.id,
							cfg = var_56_2,
							count = var_56_3
						}
					})
				end, SFX_PANEL)

				return
			end

			arg_56_1 = arg_56_1 - #var_51_2

			if arg_56_1 + 1 <= #var_51_6 then
				local var_56_5 = pg.weather_data_template[var_51_6[arg_56_1 + 1]]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_56_5.buff_icon, "", arg_56_2)
				onButton(arg_51_0, arg_56_2, function()
					arg_51_0:HandleShowMsgBox({
						hideNo = true,
						type = MSGBOX_TYPE_DROP_ITEM,
						name = var_56_5.name,
						content = var_56_5.buff_desc,
						iconPath = {
							"strategyicon/" .. var_56_5.buff_icon
						},
						yesText = pg.MsgboxMgr.TEXT_CONFIRM
					})
				end, SFX_PANEL)

				return
			end

			arg_56_1 = arg_56_1 - #var_51_6

			if arg_56_1 + 1 <= #var_51_3 then
				local var_56_6 = var_51_3[arg_56_1 + 1]
				local var_56_7 = pg.strategy_data_template[var_56_6.id]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. var_56_7.icon, "", arg_56_2)
				setActive(findTF(arg_56_2, "times"), true)
				setText(findTF(arg_56_2, "times"), var_56_6.count)
				onButton(arg_51_0, arg_56_2, function()
					arg_51_0:HandleShowMsgBox({
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = var_56_7.id,
							cfg = var_56_7
						},
						extendDesc = string.format(i18n("word_rest_times"), var_56_6.count)
					})
				end, SFX_PANEL)

				return
			end

			arg_56_1 = arg_56_1 - #var_51_3

			if arg_56_1 + 1 <= var_51_7 then
				GetImageSpriteFromAtlasAsync("strategyicon/submarine_approach", "", arg_56_2)
				onButton(arg_51_0, arg_56_2, function()
					arg_51_0:HandleShowMsgBox({
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

			arg_56_1 = arg_56_1 - var_51_7

			local var_56_8 = var_51_8[arg_56_1 + 1]

			GetImageSpriteFromAtlasAsync("commanderskillicon/" .. var_56_8:getConfig("icon"), "", arg_56_2)
			setText(findTF(arg_56_2, "Text"), "Lv." .. var_56_8:getConfig("lv"))
			setActive(findTF(arg_56_2, "Text"), true)
			setActive(findTF(arg_56_2, "frame"), true)
			onButton(arg_51_0, arg_56_2, function()
				arg_51_0:emit(LevelMediator2.ON_COMMANDER_SKILL, var_56_8)
			end, SFX_PANEL)
		end
	end)
	var_51_10:align(#var_51_2 + #var_51_3 + #var_51_6 + var_51_7 + #var_51_8)

	if OPEN_AIR_DOMINANCE and var_51_0:getConfig("air_dominance") > 0 then
		arg_51_0:updateAirDominance()
	end

	arg_51_0:updateEnemyCount()
	arg_51_0:updateChapterBuff()
end

function var_0_0.updateEnemyCount(arg_62_0)
	local var_62_0 = arg_62_0.contextData.chapterVO
	local var_62_1 = findTF(arg_62_0.topStage, "icon_list/enemy_count")
	local var_62_2 = tobool(underscore.detect(var_62_0.achieves, function(arg_63_0)
		return (arg_63_0.type == ChapterConst.AchieveType3 or arg_63_0.type == ChapterConst.AchieveType6) and not ChapterConst.IsAchieved(arg_63_0)
	end))

	setActive(var_62_1, var_62_2)

	if var_62_2 then
		local var_62_3 = var_62_0:getDisplayEnemyCount()

		setText(var_62_1:Find("Text"), var_62_3)
		GetImageSpriteFromAtlasAsync("enemycount", var_62_3 > 0 and "danger" or "safe", var_62_1)
		onButton(arg_62_0, var_62_1, function()
			if var_62_3 > 0 then
				arg_62_0:HandleShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_DROP_ITEM,
					name = i18n("star_require_enemy_title"),
					content = i18n("star_require_enemy_text", var_62_3),
					iconPath = {
						"enemycount",
						"danger"
					},
					yesText = i18n("star_require_enemy_check"),
					onYes = function()
						local var_65_0 = var_62_0:getNearestEnemyCell()

						arg_62_0.grid:focusOnCell(var_65_0)

						local var_65_1 = arg_62_0.grid:GetEnemyCellView(var_65_0)

						if var_65_1 and var_65_1.TweenShining then
							var_65_1:TweenShining(2)
						end
					end
				})
			else
				arg_62_0:HandleShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_DROP_ITEM,
					name = i18n("star_require_enemy_title"),
					content = i18n("star_require_enemy_text", var_62_3),
					iconPath = {
						"enemycount",
						"safe"
					}
				})
			end
		end, SFX_PANEL)
	end
end

function var_0_0.updateChapterBuff(arg_66_0)
	local var_66_0 = arg_66_0.contextData.chapterVO
	local var_66_1 = findTF(arg_66_0.topStage, "icon_list/chapter_buff")
	local var_66_2 = var_66_0:hasMitigation()

	SetActive(var_66_1, var_66_2)

	if var_66_2 then
		local var_66_3 = var_66_0:getRiskLevel()

		GetImageSpriteFromAtlasAsync("passstate", var_66_3 .. "_icon", var_66_1)
		onButton(arg_66_0, var_66_1, function()
			if not var_66_0:hasMitigation() then
				return
			end

			arg_66_0:HandleShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_DROP_ITEM,
				name = var_66_0:getChapterState(),
				iconPath = {
					"passstate",
					var_66_3 .. "_icon"
				},
				content = i18n("level_risk_level_mitigation_rate", var_66_0:getRemainPassCount(), var_66_0:getMitigationRate())
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateAirDominance(arg_68_0)
	local var_68_0, var_68_1, var_68_2 = arg_68_0.contextData.chapterVO:getAirDominanceValue()

	if not var_68_2 or var_68_2 ~= var_68_1 then
		arg_68_0.contextData.chapterVO:setAirDominanceStatus(var_68_1)
		getProxy(ChapterProxy):updateChapter(arg_68_0.contextData.chapterVO)
	end

	arg_68_0.isChange = var_68_2 and (var_68_1 == 0 and 3 or var_68_1) - (var_68_2 == 0 and 3 or var_68_2)

	arg_68_0:updateAirDominanceTitle(var_68_0, var_68_1, arg_68_0.isChange or 0)
end

function var_0_0.updateAirDominanceTitle(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
	local var_69_0 = findTF(arg_69_0.airSupremacy, "label1")
	local var_69_1 = findTF(arg_69_0.airSupremacy, "label2")
	local var_69_2 = findTF(arg_69_0.airSupremacy, "value1")
	local var_69_3 = findTF(arg_69_0.airSupremacy, "value2")
	local var_69_4 = findTF(arg_69_0.airSupremacy, "up")
	local var_69_5 = findTF(arg_69_0.airSupremacy, "down")

	setText(var_69_0, i18n("level_scene_title_word_3"))
	setText(var_69_1, i18n("level_scene_title_word_4"))
	setText(var_69_2, math.floor(arg_69_1))
	setActive(var_69_4, false)
	setActive(var_69_5, false)

	if arg_69_3 ~= 0 then
		if LeanTween.isTweening(go(var_69_3)) then
			LeanTween.cancel(go(var_69_3))
		end

		LeanTween.value(go(var_69_3), 1, 0, 0.5):setOnUpdate(System.Action_float(function(arg_70_0)
			setTextAlpha(var_69_3, arg_70_0)
		end)):setOnComplete(System.Action(function()
			setText(var_69_3, ChapterConst.AirDominance[arg_69_2].name)
			setTextColor(var_69_3, ChapterConst.AirDominance[arg_69_2].color)
			LeanTween.value(go(var_69_3), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_72_0)
				setTextAlpha(var_69_3, arg_72_0)
			end))
		end))

		local function var_69_6(arg_73_0)
			setActive(arg_73_0, false)
		end

		var_69_4:GetComponent(typeof(DftAniEvent)):SetEndEvent(var_69_6)
		var_69_5:GetComponent(typeof(DftAniEvent)):SetEndEvent(var_69_6)
		setActive(var_69_4, arg_69_3 > 0)
		setActive(var_69_5, arg_69_3 < 0)
	else
		setText(var_69_3, ChapterConst.AirDominance[arg_69_2].name)
		setTextColor(var_69_3, ChapterConst.AirDominance[arg_69_2].color)
	end
end

function var_0_0.UpdateDefenseStatus(arg_74_0)
	local var_74_0 = arg_74_0.contextData.chapterVO
	local var_74_1 = var_74_0:getPlayType() == ChapterConst.TypeDefence
	local var_74_2 = findTF(arg_74_0.bottomStage, "Normal/shengfu")

	setActive(var_74_2, var_74_1)

	if not var_74_1 then
		return
	end

	local var_74_3 = findTF(var_74_2, "hp"):GetComponent(typeof(Text))
	local var_74_4 = var_74_0.id
	local var_74_5 = pg.chapter_defense[var_74_4]

	var_74_3.text = i18n("desc_base_hp", "<color=#92FC63>" .. tostring(var_74_0.BaseHP) .. "</color>", var_74_5.port_hp)
end

function var_0_0.DisplayWinConditionPanel(arg_75_0)
	if not arg_75_0.winCondPanel then
		arg_75_0.winCondPanel = WinConditionDisplayPanel.New(arg_75_0._tf.parent, arg_75_0.event, arg_75_0.contextData)

		arg_75_0.winCondPanel:Load()
	end

	arg_75_0.winCondPanel:ActionInvoke("Enter", arg_75_0.contextData.chapterVO)
end

function var_0_0.DestroyWinConditionPanel(arg_76_0)
	if not arg_76_0.winCondPanel then
		return
	end

	arg_76_0.winCondPanel:Destroy()

	arg_76_0.winCondPanel = nil
end

function var_0_0.UpdateComboPanel(arg_77_0)
	local var_77_0 = arg_77_0.contextData.chapterVO
	local var_77_1 = pg.chapter_pop_template[var_77_0.id]

	if var_77_1 and var_77_1.combo_on then
		local var_77_2, var_77_3 = arg_77_0:GetSubView("LevelStageComboPanel")

		if var_77_3 then
			var_77_2:Load()
			var_77_2.buffer:SetParent(arg_77_0.leftStage, false)
		end

		local var_77_4 = getProxy(ChapterProxy):GetComboHistory(var_77_0.id)

		var_77_2.buffer:UpdateView(var_77_4 or var_77_0)
		var_77_2.buffer:UpdateViewAnimated(var_77_0)
	end
end

function var_0_0.UpdateDOALinkFeverPanel(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_0.contextData.chapterVO
	local var_78_1 = var_78_0:GetBindActID()
	local var_78_2 = var_78_0:getConfig("levelstage_bar")

	if not var_78_2 or var_78_2 == "" then
		existCall(arg_78_1)

		return
	end

	local var_78_3, var_78_4 = arg_78_0:GetSubView(var_78_2)

	if var_78_4 then
		var_78_3:Load()
		var_78_3.buffer:SetParent(arg_78_0._tf, false)
	end

	var_78_3.buffer:UpdateView(var_78_0, arg_78_1)
end

local var_0_2 = Vector2(396, 128)
local var_0_3 = Vector2(128, 128)

function var_0_0.updateStageStrategy(arg_79_0)
	arg_79_0:downloadStageRes(function()
		arg_79_0:updateStageStrategyAfterDownload()
	end)
end

function var_0_0.updateStageStrategyAfterDownload(arg_81_0)
	local var_81_0 = arg_81_0.contextData.chapterVO
	local var_81_1 = findTF(arg_81_0.rightStage, "event")
	local var_81_2 = findTF(var_81_1, "detail")
	local var_81_3 = findTF(var_81_2, "click")
	local var_81_4 = findTF(var_81_2, "items")

	var_81_4:GetComponent(typeof(GridLayoutGroup)).cellSize = arg_81_0._showStrategyDetail and var_0_2 or var_0_3

	local var_81_5 = findTF(var_81_4, "item")
	local var_81_6 = findTF(var_81_1, "collapse")

	setActive(var_81_5, false)

	local var_81_7 = var_81_0:GetInteractableStrategies()
	local var_81_8

	local function var_81_9(arg_82_0, arg_82_1, arg_82_2)
		if arg_82_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_82_0 = arg_82_2:Find("detail")

		setActive(var_82_0, arg_81_0._showStrategyDetail)

		local var_82_1 = arg_82_2:Find("icon")
		local var_82_2 = var_81_7[arg_82_1 + 1]
		local var_82_3
		local var_82_4

		if var_82_2.id == ChapterConst.StrategyHuntingRange then
			var_82_3 = ChapterConst.StgTypeConst
			var_82_4 = arg_81_0.contextData.huntingRangeVisibility % 2 == 1 and "range_invisible" or "range_visible"

			setText(var_82_0, i18n("help_sub_limits"))
		elseif var_82_2.id == ChapterConst.StrategySubAutoAttack then
			var_82_3 = ChapterConst.StgTypeConst
			var_82_4 = var_81_0.subAutoAttack == 0 and "sub_dont_auto_attack" or "sub_auto_attack"

			setText(var_82_0, i18n("help_sub_display"))
		else
			local var_82_5 = pg.strategy_data_template[var_82_2.id]

			var_82_3 = var_82_5.type
			var_82_4 = var_82_5.icon

			setText(var_82_0, var_82_5.desc)
		end

		GetImageSpriteFromAtlasAsync("strategyicon/" .. var_82_4, "", var_82_1:Find("icon"))
		onButton(arg_81_0, var_82_1, function()
			if var_82_2.id == ChapterConst.StrategyHuntingRange then
				arg_81_0.grid:toggleHuntingRange()
				var_81_9(arg_82_0, arg_82_1, arg_82_2)
			elseif var_82_2.id == ChapterConst.StrategySubAutoAttack then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ai_change_" .. 1 - var_81_0.subAutoAttack + 1))
				arg_81_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSubState,
					arg1 = 1 - var_81_0.subAutoAttack
				})
			elseif var_82_2.id == ChapterConst.StrategyExchange then
				local var_83_0 = var_81_0:getNextValidIndex()

				if var_83_0 > 0 and var_82_2.count > 0 then
					local var_83_1 = var_81_0.fleet

					arg_81_0:HandleShowMsgBox({
						content = i18n("levelScene_who_to_exchange"),
						onYes = function()
							arg_81_0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpStrategy,
								id = var_83_1.id,
								arg1 = ChapterConst.StrategyExchange,
								arg2 = var_81_0.fleets[var_83_0].id
							})
						end
					})
				end
			elseif var_82_2.id == ChapterConst.StrategySubTeleport then
				arg_81_0:SwitchSubTeleportBottomStage()
				arg_81_0:SwitchBottomStagePanel(true)
				arg_81_0.grid:ShowStaticHuntingRange()
				arg_81_0.grid:PrepareSubTeleport()
				arg_81_0.grid:updateQuadCells(ChapterConst.QuadStateTeleportSub)
			elseif var_82_2.id == ChapterConst.StrategyMissileStrike then
				if not var_81_0.fleet:canUseStrategy(var_82_2) then
					return
				end

				arg_81_0:SwitchMissileBottomStagePanel()
				arg_81_0:SwitchBottomStagePanel(true)
				arg_81_0.grid:updateQuadCells(ChapterConst.QuadStateMissileStrike)
			elseif var_82_2.id == ChapterConst.StrategyAirSupport then
				if not var_81_0:getChapterSupportFleet():canUseStrategy(var_82_2) then
					return
				end

				arg_81_0:SwitchAirSupportBottomStagePanel()
				arg_81_0:SwitchBottomStagePanel(true)
				arg_81_0.grid:updateQuadCells(ChapterConst.QuadStateAirSuport)
			elseif var_82_2.id == ChapterConst.StrategyExpel then
				if not var_81_0:getChapterSupportFleet():canUseStrategy(var_82_2) then
					return
				end

				arg_81_0:SwitchAirExpelBottomStagePanel()
				arg_81_0:SwitchBottomStagePanel(true)
				arg_81_0.grid:updateQuadCells(ChapterConst.QuadStateExpel)
			elseif var_82_3 == ChapterConst.StgTypeForm then
				local var_83_2 = var_81_0.fleet
				local var_83_3 = table.indexof(ChapterConst.StrategyForms, var_82_2.id)

				arg_81_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpStrategy,
					id = var_83_2.id,
					arg1 = ChapterConst.StrategyForms[var_83_3 % #ChapterConst.StrategyForms + 1]
				})
			else
				arg_81_0:emit(LevelUIConst.DISPLAY_STRATEGY_INFO, var_82_2)
			end
		end, SFX_PANEL)

		if var_82_3 == ChapterConst.StgTypeForm then
			setText(var_82_1:Find("nums"), "")
			setActive(var_82_1:Find("mask"), false)
			setActive(var_82_1:Find("selected"), true)
		else
			setText(var_82_1:Find("nums"), var_82_2.count or "")
			setActive(var_82_1:Find("mask"), var_82_2.count == 0)
			setActive(var_82_1:Find("selected"), false)
		end
	end

	UIItemList.StaticAlign(var_81_4, var_81_5, #var_81_7, var_81_9)
	onButton(arg_81_0, var_81_3, function()
		shiftPanel(var_81_2, var_81_2.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_81_6, -30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(arg_81_0, var_81_6, function()
		shiftPanel(var_81_2, 35, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(var_81_6, var_81_6.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
end

function var_0_0.GetSubView(arg_87_0, arg_87_1)
	if arg_87_0.attachSubViews[arg_87_1] then
		return arg_87_0.attachSubViews[arg_87_1]
	end

	local var_87_0 = _G[arg_87_1].New(arg_87_0)

	assert(var_87_0, "cant't find subview " .. (arg_87_1 or "nil"))

	arg_87_0.attachSubViews[arg_87_1] = var_87_0

	return var_87_0, true
end

function var_0_0.RemoveSubView(arg_88_0, arg_88_1)
	if not arg_88_0.attachSubViews[arg_88_1] then
		return false
	end

	arg_88_0.attachSubViews[arg_88_1]:Destroy()

	arg_88_0.attachSubViews[arg_88_1] = nil

	return true
end

function var_0_0.ClearSubViews(arg_89_0)
	for iter_89_0, iter_89_1 in pairs(arg_89_0.attachSubViews) do
		iter_89_1:Destroy()
	end

	table.clear(arg_89_0.attachSubViews)
end

function var_0_0.updateStageFleet(arg_90_0)
	local var_90_0 = arg_90_0.contextData.chapterVO
	local var_90_1 = findTF(arg_90_0.leftStage, "fleet")
	local var_90_2 = findTF(var_90_1, "shiptpl")
	local var_90_3 = arg_90_0.topStage:Find("msg_panel/fleet_info/number")

	setActive(var_90_2, false)
	setText(var_90_3, var_90_0.fleet.id)

	local var_90_4 = var_90_0.fleet:getShips(true)

	local function var_90_5(arg_91_0, arg_91_1)
		local var_91_0 = UIItemList.New(arg_91_0, var_90_2)

		var_91_0:make(function(arg_92_0, arg_92_1, arg_92_2)
			if arg_92_0 == UIItemList.EventUpdate then
				local var_92_0 = arg_91_1[arg_92_1 + 1]

				updateShip(arg_92_2, var_92_0)

				local var_92_1 = var_92_0.hpRant
				local var_92_2 = var_92_0:getShipProperties()
				local var_92_3 = math.floor((var_92_0.hpChange or 0) / 10000 * var_92_2[AttributeType.Durability])
				local var_92_4 = findTF(arg_92_2, "HP_POP")

				setActive(var_92_4, true)
				setActive(findTF(var_92_4, "heal"), false)
				setActive(findTF(var_92_4, "normal"), false)

				local function var_92_5(arg_93_0, arg_93_1)
					setActive(arg_93_0, true)
					setText(findTF(arg_93_0, "text"), arg_93_1)
					setTextAlpha(findTF(arg_93_0, "text"), 0)
					LeanTween.moveY(arg_93_0, 60, 1)
					LeanTween.textAlpha(findTF(arg_93_0, "text"), 1, 0.3)
					LeanTween.textAlpha(findTF(arg_93_0, "text"), 0, 0.5):setDelay(0.7):setOnComplete(System.Action(function()
						arg_93_0.localPosition = Vector3(0, 0, 0)
					end))
				end

				if var_92_3 > 0 then
					var_92_5(findTF(var_92_4, "heal"), var_92_3)
				elseif var_92_3 < 0 then
					LeanTween.delayedCall(0.6, System.Action(function()
						local var_95_0 = arg_92_2.transform.localPosition.x

						LeanTween.moveX(arg_92_2, var_95_0, 0.05):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(4)
						LeanTween.alpha(findTF(arg_92_2, "red"), 0.5, 0.4)
						LeanTween.alpha(findTF(arg_92_2, "red"), 0, 0.4):setDelay(0.4)
						var_92_5(findTF(var_92_4, "normal"), var_92_3)
					end))
				end

				local var_92_6 = findTF(arg_92_2, "blood")
				local var_92_7 = findTF(arg_92_2, "blood/fillarea/green")
				local var_92_8 = findTF(arg_92_2, "blood/fillarea/red")
				local var_92_9 = var_92_1 < ChapterConst.HpGreen
				local var_92_10 = var_92_1 == 0

				setActive(var_92_7, not var_92_9)
				setActive(var_92_8, var_92_9)

				var_92_6:GetComponent(typeof(Slider)).fillRect = var_92_9 and var_92_8 or var_92_7

				setSlider(var_92_6, 0, 10000, var_92_1)
				setActive(findTF(arg_92_2, "repairmask"), var_92_9)
				setActive(findTF(arg_92_2, "repairmask/broken"), var_92_10)
				onButton(arg_90_0, arg_92_2:Find("repairmask"), function()
					arg_90_0:emit(LevelUIConst.DISPLAY_REPAIR_WINDOW, var_92_0)
				end, SFX_PANEL)

				local var_92_11 = findTF(arg_92_2, "repairmask/icon").gameObject

				if not var_92_9 then
					LeanTween.cancel(var_92_11)
					setImageAlpha(var_92_11, 1)
				end

				if var_92_9 and not LeanTween.isTweening(var_92_11) then
					LeanTween.alpha(rtf(var_92_11), 0, 2):setLoopPingPong()
				end

				local var_92_12 = GetOrAddComponent(arg_92_2, "UILongPressTrigger").onLongPressed

				pg.DelegateInfo.Add(arg_90_0, var_92_12)
				var_92_12:RemoveAllListeners()
				var_92_12:AddListener(function()
					arg_90_0:emit(LevelMediator2.ON_STAGE_SHIPINFO, {
						shipId = var_92_0.id,
						shipVOs = var_90_4
					})
				end)
			end
		end)
		var_91_0:align(#arg_91_1)
	end

	var_90_5(var_90_1:Find("main"), var_90_0.fleet:getShipsByTeam(TeamType.Main, true))
	var_90_5(var_90_1:Find("vanguard"), var_90_0.fleet:getShipsByTeam(TeamType.Vanguard, true))
	var_90_0.fleet:clearShipHpChange()
end

function var_0_0.updateSupportFleet(arg_98_0)
	local var_98_0 = arg_98_0.contextData.chapterVO:getChapterSupportFleet()
	local var_98_1 = findTF(arg_98_0.leftStage, "support_fleet")

	setActive(var_98_1, tobool(var_98_0))

	if var_98_0 then
		local var_98_2 = findTF(var_98_1, "show/ship_container")

		removeAllChildren(var_98_2)

		local var_98_3 = findTF(var_98_1, "show/shiptpl")
		local var_98_4 = var_98_0:getShips()

		for iter_98_0, iter_98_1 in pairs(var_98_4) do
			local var_98_5 = cloneTplTo(var_98_3, var_98_2)

			setActive(var_98_5, true)
			updateShip(var_98_5, iter_98_1)
		end

		local var_98_6 = var_98_1:Find("hide")
		local var_98_7 = var_98_1:Find("show")

		local function var_98_8(arg_99_0)
			setActive(var_98_6, true)
			setActive(var_98_7, true)
			shiftPanel(var_98_7, nil, arg_99_0 and -325.1 or -855, 0.3, 0, true, nil, LeanTweenType.easeOutSine, function()
				setActive(var_98_6, not arg_99_0)
				setActive(var_98_7, arg_99_0)
			end)
			shiftPanel(var_98_6, nil, arg_99_0 and -1017 or -563.97, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		end

		onButton(arg_98_0, var_98_6, function()
			var_98_8(true)
		end, SFX_PANEL)
		onButton(arg_98_0, var_98_7, function()
			var_98_8(false)
		end)
	end
end

function var_0_0.ShiftStagePanelIn(arg_103_0, arg_103_1)
	shiftPanel(arg_103_0.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine, arg_103_1)
	arg_103_0:ShiftBottomStage(true)
	shiftPanel(arg_103_0.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_103_0.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.ShiftStagePanelOut(arg_104_0, arg_104_1)
	shiftPanel(arg_104_0.topStage, 0, arg_104_0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine, arg_104_1)
	arg_104_0:ShiftBottomStage(false)
	shiftPanel(arg_104_0.leftStage, -arg_104_0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_104_0.rightStage, arg_104_0.rightStage.rect.width + 300, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.ShiftBottomStage(arg_105_0, arg_105_1)
	arg_105_1 = not arg_105_0.bottomStageInactive and arg_105_1

	local var_105_0 = arg_105_1 and 0 or -arg_105_0.bottomStage.rect.height

	shiftPanel(arg_105_0.bottomStage, 0, var_105_0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function var_0_0.SwitchSubTeleportBottomStage(arg_106_0)
	setActive(arg_106_0.missileStrikeRole, true)
	setText(findTF(arg_106_0.missileStrikeRole, "confirm_button/Text"), i18n("levelscene_deploy_submarine"))
	setText(findTF(arg_106_0.missileStrikeRole, "cancel_button/Text"), i18n("levelscene_deploy_submarine_cancel"))
	onButton(arg_106_0, arg_106_0.missileStrikeRole:Find("confirm_button"), function()
		local var_107_0 = arg_106_0.contextData.chapterVO
		local var_107_1 = var_107_0:GetSubmarineFleet()
		local var_107_2 = var_107_1.startPos
		local var_107_3 = arg_106_0.grid.subTeleportTargetLine

		if not var_107_3 then
			return
		end

		local var_107_4 = var_107_0:findPath(nil, var_107_2, var_107_3)
		local var_107_5 = arg_106_0.grid:TransformLine2PlanePos(var_107_2)
		local var_107_6 = arg_106_0.grid:TransformLine2PlanePos(var_107_3)
		local var_107_7 = math.ceil(pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2] * #var_107_1:getShips(false) * var_107_4 - 1e-05)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("tips_confirm_teleport_sub", var_107_5, var_107_6, var_107_4, var_107_7),
			onYes = function()
				arg_106_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSubTeleport,
					id = var_107_1.id,
					arg1 = var_107_3.row,
					arg2 = var_107_3.column
				})
			end
		})
	end, SFX_UI_CLICK)
	onButton(arg_106_0, arg_106_0.missileStrikeRole:Find("cancel_button"), function()
		arg_106_0:SwitchBottomStagePanel(false)
		arg_106_0.grid:TurnOffSubTeleport()
		arg_106_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchMissileBottomStagePanel(arg_110_0)
	setActive(arg_110_0.missileStrikeRole, true)
	setText(findTF(arg_110_0.missileStrikeRole, "confirm_button/Text"), i18n("missile_attack_area_confirm"))
	setText(findTF(arg_110_0.missileStrikeRole, "cancel_button/Text"), i18n("missile_attack_area_cancel"))
	onButton(arg_110_0, arg_110_0.missileStrikeRole:Find("confirm_button"), function()
		local var_111_0 = arg_110_0.grid.missileStrikeTargetLine

		if not var_111_0 then
			return
		end

		local var_111_1 = arg_110_0.contextData.chapterVO.fleet

		;(function()
			arg_110_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_111_1.id,
				arg1 = ChapterConst.StrategyMissileStrike,
				arg2 = var_111_0.row,
				arg3 = var_111_0.column
			})
		end)()
	end, SFX_UI_CLICK)
	onButton(arg_110_0, arg_110_0.missileStrikeRole:Find("cancel_button"), function()
		arg_110_0:SwitchBottomStagePanel(false)
		arg_110_0.grid:HideMissileAimingMark()
		arg_110_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchAirSupportBottomStagePanel(arg_114_0)
	setActive(arg_114_0.missileStrikeRole, true)
	setText(findTF(arg_114_0.missileStrikeRole, "confirm_button/Text"), i18n("missile_attack_area_confirm"))
	setText(findTF(arg_114_0.missileStrikeRole, "cancel_button/Text"), i18n("missile_attack_area_cancel"))
	onButton(arg_114_0, arg_114_0.missileStrikeRole:Find("confirm_button"), function()
		local var_115_0 = arg_114_0.grid.missileStrikeTargetLine

		if not var_115_0 then
			return
		end

		local var_115_1 = arg_114_0.contextData.chapterVO:getChapterSupportFleet()

		;(function()
			arg_114_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_115_1.id,
				arg1 = ChapterConst.StrategyAirSupport,
				arg2 = var_115_0.row,
				arg3 = var_115_0.column
			})
		end)()
	end, SFX_UI_CLICK)
	onButton(arg_114_0, arg_114_0.missileStrikeRole:Find("cancel_button"), function()
		arg_114_0:SwitchBottomStagePanel(false)
		arg_114_0.grid:HideAirSupportAimingMark()
		arg_114_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchAirExpelBottomStagePanel(arg_118_0)
	setActive(arg_118_0.airExpelRole, true)
	setText(findTF(arg_118_0.airExpelRole, "cancel_button/Text"), i18n("levelscene_airexpel_cancel"))
	onButton(arg_118_0, arg_118_0.airExpelRole:Find("cancel_button"), function()
		arg_118_0:SwitchBottomStagePanel(false)
		arg_118_0.grid:HideAirExpelAimingMark()
		arg_118_0.grid:CleanAirSupport()
		arg_118_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
end

function var_0_0.SwitchBottomStagePanel(arg_120_0, arg_120_1)
	setActive(arg_120_0.actionRole, true)
	setActive(arg_120_0.normalRole, true)
	shiftPanel(arg_120_0.actionRole, 0, arg_120_1 and 0 or var_0_1, 0.3, 0, true, true, nil, function()
		setActive(arg_120_0.actionRole, arg_120_1)
	end)
	shiftPanel(arg_120_0.normalRole, 0, arg_120_1 and var_0_1 or 0, 0.3, 0, true, true, nil, function()
		setActive(arg_120_0.normalRole, not arg_120_1)

		if not arg_120_1 then
			eachChild(arg_120_0.actionRole, function(arg_123_0)
				setActive(arg_123_0, false)
			end)
		end
	end)
	shiftPanel(arg_120_0.leftStage, arg_120_1 and -arg_120_0.leftStage.rect.width - 200 or 0, 0, 0.3, 0, true)
	shiftPanel(arg_120_0.rightStage, arg_120_1 and arg_120_0.rightStage.rect.width + 300 or 0, 0, 0.3, 0, true)
end

function var_0_0.ClickGridCellNormal(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_0.contextData.chapterVO
	local var_124_1 = var_124_0.fleet
	local var_124_2 = _.detect(var_124_0.fleets, function(arg_125_0)
		return arg_125_0:getFleetType() == FleetType.Normal and arg_125_0.line.row == arg_124_1.row and arg_125_0.line.column == arg_124_1.column
	end)

	if var_124_2 and var_124_2:isValid() and var_124_2.id ~= var_124_1.id then
		arg_124_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSwitch,
			id = var_124_2.id
		})

		return
	end

	if arg_124_0:tryAutoTrigger(nil, true) then
		return
	end

	if arg_124_1.row == var_124_1.line.row and arg_124_1.column == var_124_1.line.column then
		return
	end

	local var_124_3 = var_124_0:getChapterCell(arg_124_1.row, arg_124_1.column)

	if var_124_3.attachment == ChapterConst.AttachStory and var_124_3.data == ChapterConst.StoryObstacle and var_124_3.flag == ChapterConst.CellFlagTriggerActive then
		local var_124_4 = pg.map_event_template[var_124_3.attachmentId]

		if var_124_4 and var_124_4.gametip and #var_124_4.gametip > 0 and var_124_0:getPlayType() ~= ChapterConst.TypeDefence then
			pg.TipsMgr.GetInstance():ShowTips(i18n(var_124_4.gametip))
		end

		return
	elseif not var_124_0:considerAsStayPoint(ChapterConst.SubjectPlayer, arg_124_1.row, arg_124_1.column) then
		return
	elseif var_124_0:existMoveLimit() then
		local var_124_5 = var_124_0:calcWalkableCells(ChapterConst.SubjectPlayer, var_124_1.line.row, var_124_1.line.column, var_124_1:getSpeed())

		if not _.any(var_124_5, function(arg_126_0)
			return arg_126_0.row == arg_124_1.row and arg_126_0.column == arg_124_1.column
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destination_not_in_range"))

			return
		end
	end

	local var_124_6 = var_124_0:findPath(ChapterConst.SubjectPlayer, var_124_1.line, {
		row = arg_124_1.row,
		column = arg_124_1.column
	})

	if var_124_6 < PathFinding.PrioObstacle then
		arg_124_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpMove,
			id = var_124_1.id,
			arg1 = arg_124_1.row,
			arg2 = arg_124_1.column
		})
	elseif var_124_6 < PathFinding.PrioForbidden then
		pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach"))
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach"))
	end
end

function var_0_0.tryAutoAction(arg_127_0, arg_127_1)
	if arg_127_0.doingAutoAction then
		return
	end

	arg_127_0.doingAutoAction = true

	local var_127_0 = arg_127_0.contextData.chapterVO

	if not var_127_0 then
		existCall(arg_127_1)

		return
	end

	if arg_127_0:SafeCheck() then
		existCall(arg_127_1)

		return
	end

	local var_127_1 = {}
	local var_127_2 = false

	for iter_127_0, iter_127_1 in pairs(var_127_0.cells) do
		if iter_127_1.trait == ChapterConst.TraitLurk then
			var_127_2 = true

			break
		end
	end

	if not var_127_2 then
		for iter_127_2, iter_127_3 in ipairs(var_127_0.champions) do
			if iter_127_3.trait == ChapterConst.TraitLurk then
				var_127_2 = true

				break
			end
		end
	end

	if var_127_2 then
		local var_127_3 = var_127_0:existOni()
		local var_127_4 = var_127_0:isPlayingWithBombEnemy()

		if not var_127_3 and not var_127_4 then
			table.insert(var_127_1, function(arg_128_0)
				arg_127_0:emit(LevelUIConst.DO_TRACKING, arg_128_0)
			end)
		else
			table.insertto(var_127_1, {
				function(arg_129_0)
					local var_129_0

					if var_127_3 then
						var_129_0 = "SpUnit"
					elseif var_127_4 then
						var_129_0 = "SpBomb"
					end

					assert(var_129_0)
					arg_127_0:emit(LevelUIConst.DO_PLAY_ANIM, {
						name = var_129_0,
						callback = function(arg_130_0)
							setActive(arg_130_0, false)
							arg_129_0()
						end
					})
				end,
				function(arg_131_0)
					local var_131_0 = var_127_0:getSpAppearStory()

					if var_131_0 and #var_131_0 > 0 then
						pg.NewStoryMgr.GetInstance():Play(var_131_0, arg_131_0)

						return
					end

					arg_131_0()
				end,
				function(arg_132_0)
					local var_132_0 = var_127_0:getSpAppearGuide()

					if var_132_0 and #var_132_0 > 0 then
						pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_132_0, nil, arg_132_0)

						return
					end

					arg_132_0()
				end
			})
		end

		table.insertto(var_127_1, {
			function(arg_133_0)
				parallelAsync({
					function(arg_134_0)
						arg_127_0:tryPlayChapterStory(arg_134_0)
					end,
					function(arg_135_0)
						local var_135_0 = var_127_0:GetBossCell()

						if var_135_0 and var_135_0.trait == ChapterConst.TraitLurk then
							arg_127_0.grid:focusOnCell(var_135_0, arg_135_0)

							return
						end

						arg_135_0()
					end
				}, arg_133_0)
			end,
			function(arg_136_0)
				arg_127_0:updateTrait(ChapterConst.TraitVirgin)
				arg_127_0.grid:updateAttachments()
				arg_127_0.grid:updateChampions()
				arg_127_0:updateTrait(ChapterConst.TraitNone)
				arg_127_0:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)
				Timer.New(arg_136_0, 0.5, 1):Start()
			end
		})
	end

	seriesAsync({
		function(arg_137_0)
			arg_127_0:emit(LevelUIConst.FROZEN)

			local var_137_0 = getProxy(ChapterProxy):GetLastDefeatedEnemy(var_127_0.id)

			if var_137_0 and (var_137_0.attachment ~= ChapterConst.AttachAmbush or ChapterConst.IsBossCell(var_137_0)) then
				local var_137_1 = ChapterConst.GetDestroyFX(var_137_0)

				arg_127_0.grid:PlayAttachmentEffect(var_137_0.line.row, var_137_0.line.column, var_137_1, Vector2.zero)
			end

			arg_127_0:PopBar()
			arg_127_0:UpdateComboPanel()
			arg_137_0()
		end,
		function(arg_138_0)
			if not (function()
				local var_139_0 = getProxy(ChapterProxy):GetLastDefeatedEnemy(var_127_0.id)

				if not var_139_0 then
					return
				end

				local var_139_1 = pg.expedition_data_template[var_139_0.attachmentId]

				return var_139_1 and var_139_1.type == ChapterConst.ExpeditionTypeMulBoss
			end)() then
				return arg_138_0()
			end

			arg_127_0:emit(LevelUIConst.DO_PLAY_ANIM, {
				name = "BossRetreatBar",
				callback = function(arg_140_0)
					setActive(arg_140_0, false)
					arg_138_0()
				end
			})
		end,
		function(arg_141_0)
			arg_127_0:UpdateDOALinkFeverPanel(arg_141_0)
		end,
		function(arg_142_0)
			seriesAsync(var_127_1, arg_142_0)
		end,
		function(arg_143_0)
			local var_143_0, var_143_1 = var_127_0:GetAttachmentStories()

			if var_143_0 then
				table.SerialIpairsAsync(var_143_0, function(arg_144_0, arg_144_1, arg_144_2)
					if arg_144_0 <= var_143_1 and arg_144_1 and type(arg_144_1) == "number" and arg_144_1 > 0 then
						local var_144_0 = pg.NewStoryMgr:StoryId2StoryName(arg_144_1)

						ChapterOpCommand.PlayChapterStory(var_144_0, arg_144_2, var_127_0:IsAutoFight())

						return
					end

					arg_144_2()
				end, arg_143_0)

				return
			end

			arg_143_0()
		end,
		function(arg_145_0)
			local var_145_0 = arg_127_0.contextData.chapterVO.id
			local var_145_1 = getProxy(ChapterProxy):getUpdatedExtraFlags(var_145_0)

			if not var_145_1 or #var_145_1 < 1 then
				arg_145_0()

				return
			end

			for iter_145_0, iter_145_1 in ipairs(var_145_1) do
				local var_145_2 = pg.chapter_status_effect[iter_145_1]
				local var_145_3 = var_145_2 and var_145_2.camera_focus or ""

				if type(var_145_3) == "table" then
					arg_127_0.grid:focusOnCell({
						row = var_145_3[1],
						column = var_145_3[2]
					}, arg_145_0)

					return
				end
			end

			arg_145_0()
		end,
		function(arg_146_0)
			if arg_127_0.exited then
				return
			end

			arg_127_0:emit(LevelUIConst.UN_FROZEN)
			;(function()
				local var_147_0 = getProxy(ChapterProxy)
				local var_147_1 = var_147_0:getActiveChapter(true)

				if not var_147_1 then
					return
				end

				local var_147_2 = var_147_1.id

				var_147_0:RecordComboHistory(var_147_2, nil)
				var_147_0:RecordLastDefeatedEnemy(var_147_2, nil)
				var_147_0:extraFlagUpdated(var_147_2)
				var_147_0:RemoveExtendChapterData(var_147_2, "FleetMoveDistance")
			end)()
			arg_146_0()
		end
	}, function()
		if arg_127_0.exited then
			return
		end

		arg_127_0.doingAutoAction = nil

		if var_127_2 and arg_127_0:TryEnterChapterStoryStage() then
			-- block empty
		else
			existCall(arg_127_1)
		end
	end)
end

function var_0_0.tryPlayChapterStory(arg_149_0, arg_149_1)
	local var_149_0 = arg_149_0.contextData.chapterVO
	local var_149_1 = var_149_0:getWaveCount()

	seriesAsync({
		function(arg_150_0)
			pg.SystemGuideMgr.GetInstance():PlayChapter(var_149_0, arg_150_0)
		end,
		function(arg_151_0)
			local var_151_0 = var_149_0:getConfig("story_refresh")
			local var_151_1 = var_151_0 and var_151_0[var_149_1]

			if var_151_1 and type(var_151_1) == "string" and var_151_1 ~= "" and not var_149_0:IsRemaster() then
				ChapterOpCommand.PlayChapterStory(var_151_1, arg_151_0, var_149_0:IsAutoFight())

				return
			end

			arg_151_0()
		end,
		function(arg_152_0)
			local var_152_0 = var_149_0:getConfig("story_refresh_boss")

			if var_152_0 and type(var_152_0) == "string" and var_152_0 ~= "" and not var_149_0:IsRemaster() and var_149_0:IsFinalBossRefreshed() then
				ChapterOpCommand.PlayChapterStory(var_152_0, arg_152_0, var_149_0:IsAutoFight())

				return
			end

			arg_152_0()
		end,
		function(arg_153_0)
			if var_149_1 == 1 and pg.map_event_list[var_149_0.id] and pg.map_event_list[var_149_0.id].help_open == 1 and PlayerPrefs.GetInt("help_displayed_on_" .. var_149_0.id, 0) == 0 then
				triggerButton(arg_149_0.helpBtn)
				PlayerPrefs.SetInt("help_displayed_on_" .. var_149_0.id, 1)
			end

			arg_153_0()
		end,
		function()
			existCall(arg_149_1)
		end
	})
end

function var_0_0.TryEnterChapterStoryStage(arg_155_0, arg_155_1)
	local var_155_0 = arg_155_0.contextData.chapterVO
	local var_155_1 = var_155_0:getWaveCount()
	local var_155_2 = var_155_0:getConfig("story_refresh")
	local var_155_3 = var_155_2 and var_155_2[var_155_1]

	if var_155_3 and type(var_155_3) == "number" and not var_155_0:IsRemaster() and not pg.NewStoryMgr.GetInstance():IsPlayed(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_155_3)) then
		arg_155_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_155_3)

		return true
	end

	local var_155_4 = var_155_0:getConfig("story_refresh_boss")

	if var_155_4 and type(var_155_4) == "number" and not var_155_0:IsRemaster() and var_155_0:IsFinalBossRefreshed() and not pg.NewStoryMgr.GetInstance():IsPlayed(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_155_4)) then
		arg_155_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_155_4)

		return true
	end
end

function var_0_0.TryEnterChapterSupportSubmarineStage(arg_156_0, arg_156_1)
	local var_156_0 = arg_156_0.contextData.chapterVO
	local var_156_1 = var_156_0:getChapterSupportFleet()
	local var_156_2 = {}

	if var_156_0:getChapterSupportFleet() then
		arg_156_0:emit(LevelMediator2.ON_SUPPORT_SUBMARINE)
	else
		arg_156_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OPSubStrike,
			arg1 = ys.Battle.BattleConst.BattleScore.C,
			callback = arg_156_1
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

function var_0_0.PopBar(arg_157_0)
	local var_157_0 = arg_157_0.contextData.chapterVO.id
	local var_157_1 = getProxy(ChapterProxy):getUpdatedExtraFlags(var_157_0)

	if not var_157_1 or #var_157_1 < 1 then
		return
	end

	local var_157_2 = var_157_1[1]
	local var_157_3 = var_0_4[var_157_2]

	if not var_157_3 then
		return
	end

	local var_157_4, var_157_5 = arg_157_0:GetSubView(var_157_3)

	if var_157_5 then
		var_157_4:Load()
	end

	var_157_4.buffer:PlayAnim()
end

function var_0_0.updateTrait(arg_158_0, arg_158_1)
	local var_158_0 = arg_158_0.contextData.chapterVO

	for iter_158_0, iter_158_1 in pairs(var_158_0.cells) do
		if iter_158_1.trait ~= ChapterConst.TraitNone then
			iter_158_1.trait = arg_158_1
		end
	end

	for iter_158_2, iter_158_3 in ipairs(var_158_0.champions) do
		if iter_158_3.trait ~= ChapterConst.TraitNone then
			iter_158_3.trait = arg_158_1
		end
	end
end

function var_0_0.CheckFleetChange(arg_159_0)
	local var_159_0 = arg_159_0.contextData.chapterVO
	local var_159_1 = var_159_0:GetActiveFleet()
	local var_159_2 = _.detect(var_159_0.fleets, function(arg_160_0)
		return not arg_160_0:isValid()
	end)

	if var_159_2 then
		arg_159_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRetreat,
			id = var_159_2.id
		})

		if var_159_2:getFleetType() == TeamType.Normal then
			getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.BATTLE_FAILED)
		end
	end

	if not var_159_1:isValid() then
		local var_159_3 = var_159_0:getNextValidIndex()

		if var_159_3 > 0 then
			local var_159_4 = var_159_0.fleets[var_159_3]

			local function var_159_5()
				arg_159_0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSwitch,
					id = var_159_4.id
				})
			end

			arg_159_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("formation_switch_tip", var_159_4.name),
				onYes = var_159_5,
				onNo = var_159_5
			})
		end

		return true
	end

	return false
end

function var_0_0.tryAutoTrigger(arg_162_0, arg_162_1, arg_162_2)
	local var_162_0 = arg_162_0.contextData.chapterVO

	if arg_162_0:DoBreakAction() then
		return
	end

	if arg_162_0:CheckFleetChange() then
		return
	end

	return ((function()
		if var_162_0:checkAnyInteractive() then
			if not arg_162_1 or var_162_0:IsAutoFight() then
				triggerButton(arg_162_0.funcBtn)

				return true
			end
		elseif var_162_0:getRound() == ChapterConst.RoundEnemy then
			arg_162_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpEnemyRound
			})

			return true
		elseif var_162_0:getRound() == ChapterConst.RoundPlayer then
			if not arg_162_2 then
				arg_162_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			end

			if var_162_0:IsAutoFight() then
				arg_162_0:TryAutoFight()

				return true
			end
		end
	end)())
end

function var_0_0.DoBreakAction(arg_164_0)
	local var_164_0 = arg_164_0.contextData.chapterVO
	local var_164_1, var_164_2 = arg_164_0:SafeCheck()

	if var_164_1 then
		local function var_164_3(arg_165_0)
			local var_165_0

			seriesAsync({
				function(arg_166_0)
					arg_164_0:emit(LevelUIConst.ADD_MSG_QUEUE, arg_166_0)
				end,
				function(arg_167_0, arg_167_1)
					var_165_0 = arg_167_1

					ChapterOpCommand.PrepareChapterRetreat(arg_167_0)
				end,
				function(arg_168_0)
					existCall(arg_165_0)
					existCall(var_165_0)
				end
			})
		end

		if var_164_2 == ChapterConst.ReasonVictory then
			seriesAsync({
				function(arg_169_0)
					var_164_3(arg_169_0)
				end,
				function(arg_170_0)
					local var_170_0 = var_164_0:getConfig("win_condition_display") and #var_170_0 > 0 and var_170_0 .. "_tip"

					if var_170_0 and pg.gametip[var_170_0] then
						pg.TipsMgr.GetInstance():ShowTips(i18n(var_170_0))
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_win"))
					end

					arg_170_0()
				end
			})
		elseif var_164_2 == ChapterConst.ReasonDefeat then
			if var_164_0:getPlayType() == ChapterConst.TypeTransport then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_lose"))
				var_164_3()
			else
				arg_164_0:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("formation_invalide"),
					onYes = var_164_3,
					onClose = var_164_3
				})
			end
		elseif var_164_2 == ChapterConst.ReasonDefeatDefense then
			arg_164_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("harbour_bomb_tip"),
				onYes = var_164_3,
				onClose = var_164_3
			})
		elseif var_164_2 == ChapterConst.ReasonVictoryOni then
			var_164_3()
		elseif var_164_2 == ChapterConst.ReasonDefeatOni then
			var_164_3()
		elseif var_164_2 == ChapterConst.ReasonDefeatBomb then
			var_164_3()
		elseif var_164_2 == ChapterConst.ReasonOutTime then
			arg_164_0:emit(LevelMediator2.ON_TIME_UP)
		elseif var_164_2 == ChapterConst.ReasonActivityOutTime then
			arg_164_0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("battle_preCombatMediator_activity_timeout"),
				onYes = var_164_3,
				onClose = var_164_3
			})
		end

		return true
	end

	return var_164_1
end

function var_0_0.SafeCheck(arg_171_0)
	local var_171_0 = arg_171_0.contextData.chapterVO

	if var_171_0:existOni() then
		local var_171_1 = var_171_0:checkOniState()

		if var_171_1 == 1 then
			return true, ChapterConst.ReasonVictoryOni
		elseif var_171_1 == 2 then
			return true, ChapterConst.ReasonDefeatOni
		else
			return false
		end
	elseif var_171_0:isPlayingWithBombEnemy() then
		if var_171_0:getBombChapterInfo().action_times * 2 <= var_171_0.roundIndex then
			return true, ChapterConst.ReasonDefeatBomb
		else
			return false
		end
	end

	local var_171_2, var_171_3 = var_171_0:CheckChapterWin()

	if var_171_2 then
		return true, var_171_3
	end

	local var_171_4, var_171_5 = var_171_0:CheckChapterLose()

	if var_171_4 then
		return true, var_171_5
	end

	if not var_171_0:inWartime() then
		return true, ChapterConst.ReasonOutTime
	end

	local var_171_6 = var_171_0:GetBindActID()

	if not arg_171_0.contextData.map:isRemaster() and var_171_6 ~= 0 then
		local var_171_7 = getProxy(ActivityProxy):getActivityById(var_171_6)

		if not var_171_7 or var_171_7:isEnd() then
			return true, ChapterConst.ReasonActivityOutTime
		end
	end

	return false
end

function var_0_0.TryAutoFight(arg_172_0)
	local var_172_0 = arg_172_0.contextData.chapterVO
	local var_172_1 = arg_172_0.contextData.map

	if not var_172_0:IsAutoFight() then
		return
	end

	local var_172_2 = var_172_0:GetAllEnemies()
	local var_172_3 = _.detect(var_172_2, function(arg_173_0)
		return ChapterConst.IsBossCell(arg_173_0)
	end)
	local var_172_4 = var_172_0:GetFleetOfDuty(tobool(var_172_3))

	if var_172_4 and var_172_4.id ~= var_172_0.fleet.id then
		arg_172_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSwitch,
			id = var_172_4.id
		})
		arg_172_0:tryAutoTrigger()

		return
	end

	if var_172_0:checkAnyInteractive() then
		arg_172_0:tryAutoTrigger()

		return
	end

	local var_172_5

	for iter_172_0, iter_172_1 in ipairs(var_172_0:getConfig("box_auto_pick")) do
		local var_172_6 = underscore.filter(switch(iter_172_1, {
			[ChapterConst.AttachBox] = function()
				return var_172_0:findChapterCells(iter_172_1)
			end,
			[ChapterConst.AttachSupply] = function()
				local var_175_0, var_175_1 = var_172_0:getFleetAmmo(var_172_4)

				if var_175_0 - var_175_1 < 3 then
					return {}
				else
					return underscore.filter(var_172_0:findChapterCells(iter_172_1), function(arg_176_0)
						return arg_176_0.attachmentId > 0
					end)
				end
			end
		}), function(arg_177_0)
			return arg_177_0.flag ~= ChapterConst.CellFlagDisabled
		end)

		for iter_172_2, iter_172_3 in ipairs(var_172_6) do
			local var_172_7, var_172_8 = var_172_0:findPath(ChapterConst.SubjectPlayer, var_172_4.line, iter_172_3)

			if var_172_7 < PathFinding.PrioObstacle then
				var_172_5 = var_172_5 or {}

				table.insert(var_172_5, {
					target = iter_172_3,
					priority = var_172_7,
					path = var_172_8
				})
			end
		end

		if var_172_5 then
			table.sort(var_172_5, CompareFuncs({
				function(arg_178_0)
					return arg_178_0.priority
				end
			}))

			break
		end
	end

	if not var_172_5 then
		if var_172_3 then
			local var_172_9, var_172_10 = var_172_0:FindBossPath(var_172_4.line, var_172_3)
			local var_172_11 = {}
			local var_172_12

			for iter_172_4, iter_172_5 in ipairs(var_172_10) do
				table.insert(var_172_11, iter_172_5)

				if var_172_0:existEnemy(ChapterConst.SubjectPlayer, iter_172_5.row, iter_172_5.column) then
					var_172_9 = iter_172_4
					var_172_12 = iter_172_5

					break
				end
			end

			var_172_5 = {
				{
					target = var_172_12 or var_172_3,
					priority = var_172_9 or 0,
					path = var_172_11
				}
			}
		else
			var_172_5 = underscore.map(var_172_2, function(arg_179_0)
				local var_179_0, var_179_1 = var_172_0:findPath(ChapterConst.SubjectPlayer, var_172_4.line, arg_179_0)

				return {
					target = arg_179_0,
					priority = var_179_0,
					path = var_179_1
				}
			end)

			local function var_172_13(arg_180_0)
				local var_180_0 = arg_180_0.target
				local var_180_1 = pg.expedition_data_template[var_180_0.attachmentId]

				assert(var_180_1, "expedition_data_template not exist: " .. var_180_0.attachmentId)

				if var_180_0.flag == ChapterConst.CellFlagDisabled then
					return 0
				end

				return ChapterConst.EnemyPreference[var_180_1.type]
			end

			if var_172_0.id == 1604 then
				table.sort(var_172_5, CompareFuncs({
					function(arg_181_0)
						return arg_181_0.priority < PathFinding.PrioObstacle and 0 or 1
					end,
					function(arg_182_0)
						return -var_172_13(arg_182_0)
					end,
					function(arg_183_0)
						return arg_183_0.priority
					end,
					function(arg_184_0)
						return arg_184_0.target.row
					end,
					function(arg_185_0)
						return -arg_185_0.target.column
					end
				}))
			else
				table.sort(var_172_5, CompareFuncs({
					function(arg_186_0)
						return arg_186_0.priority < PathFinding.PrioObstacle and 0 or 1
					end,
					function(arg_187_0)
						return -var_172_13(arg_187_0)
					end,
					function(arg_188_0)
						return arg_188_0.priority
					end
				}))
			end
		end
	end

	if var_172_5 and #var_172_5 > 0 and var_172_5[1].priority < PathFinding.PrioObstacle then
		local var_172_14 = var_172_5[1].target

		arg_172_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpMove,
			id = var_172_4.id,
			arg1 = var_172_14.row,
			arg2 = var_172_14.column
		})
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_errors_tip"))
		getProxy(ChapterProxy):SetChapterAutoFlag(var_172_0.id, false)
	end
end

function var_0_0.popStageStrategy(arg_189_0)
	local var_189_0 = arg_189_0.rightStage:Find("event/collapse")

	if var_189_0.anchoredPosition.x <= 1 then
		triggerButton(var_189_0)
	end
end

function var_0_0.UpdateAutoFightPanel(arg_190_0)
	if arg_190_0.contextData.chapterVO:CanActivateAutoFight() then
		if not arg_190_0.autoFightPanel then
			arg_190_0.autoFightPanel = LevelStageAutoFightPanel.New(arg_190_0.rightStage:Find("event/collapse"), arg_190_0.event, arg_190_0.contextData)

			arg_190_0.autoFightPanel:Load()

			arg_190_0.autoFightPanel.isFrozen = arg_190_0.isFrozen
		end

		arg_190_0.autoFightPanel.buffer:Show()
	elseif arg_190_0.autoFightPanel then
		arg_190_0.autoFightPanel.buffer:Hide()
	end
end

function var_0_0.UpdateAutoFightMark(arg_191_0)
	if not arg_191_0.autoFightPanel then
		return
	end

	arg_191_0.autoFightPanel.buffer:UpdateAutoFightMark()
end

function var_0_0.DestroyAutoFightPanel(arg_192_0)
	if not arg_192_0.autoFightPanel then
		return
	end

	arg_192_0.autoFightPanel:Destroy()

	arg_192_0.autoFightPanel = nil
end

function var_0_0.DestroyToast(arg_193_0)
	if not arg_193_0.toastPanel then
		return
	end

	arg_193_0.toastPanel:Destroy()

	arg_193_0.toastPanel = nil
end

function var_0_0.Toast(arg_194_0)
	arg_194_0:DestroyToast()

	local var_194_0 = table.remove(arg_194_0.toastQueue, 1)

	if not var_194_0 then
		return
	end

	arg_194_0.toastPanel = var_194_0.Class.New(arg_194_0)

	arg_194_0.toastPanel:Load()

	arg_194_0.toastPanel.contextData.settings = var_194_0

	arg_194_0.toastPanel.buffer:Play(function()
		arg_194_0:Toast()
	end)
end

function var_0_0.HandleShowMsgBox(arg_196_0, arg_196_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_196_1)
end

return var_0_0
