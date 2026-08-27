local var_0_0 = class("LevelScene", import("..base.BaseUI"))
local var_0_1 = 0.5
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.forceGC(arg_1_0)
	return true
end

function var_0_0.getUIName(arg_2_0)
	return "LevelMainScene"
end

function var_0_0.ResUISettings(arg_3_0)
	return {
		groupDelta = 1,
		showType = PlayerResUI.TYPE_ALL
	}
end

function var_0_0.getBGM(arg_4_0)
	local function var_4_0()
		return checkExist(arg_4_0.contextData.chapterVO, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	local function var_4_1()
		if not arg_4_0.contextData.map then
			return
		end

		local var_6_0 = arg_4_0.contextData.map:getConfig("ani_controller")
		local var_6_1 = getProxy(ChapterProxy)

		if var_6_0 and #var_6_0 > 0 then
			for iter_6_0, iter_6_1 in ipairs(var_6_0) do
				local var_6_2 = _.rest(iter_6_1[2], 2)

				for iter_6_2, iter_6_3 in ipairs(var_6_2) do
					if string.find(iter_6_3, "^bgm_") and iter_6_1[1] == var_0_3 then
						local var_6_3 = iter_6_1[2][1]
						local var_6_4 = false

						for iter_6_4, iter_6_5 in ipairs(var_6_3) do
							local var_6_5 = var_6_1:GetChapterItemById(iter_6_5)

							if var_6_5 and var_6_5:isClear() then
								var_6_4 = true

								break
							end
						end

						if not var_6_4 then
							return string.sub(iter_6_3, 5)
						end
					end
				end
			end
		end

		return checkExist(arg_4_0.contextData.map, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	for iter_4_0, iter_4_1 in ipairs({
		var_4_0(),
		var_4_1()
	}) do
		if iter_4_1 ~= "" then
			return iter_4_1
		end
	end

	return var_0_0.super.getBGM(arg_4_0)
end

var_0_0.optionsPath = {
	"top/top_chapter/option"
}

function var_0_0.preload(arg_7_0, arg_7_1)
	local var_7_0 = getProxy(ChapterProxy)

	if arg_7_0.contextData.mapIdx and arg_7_0.contextData.chapterId then
		local var_7_1 = var_7_0:getChapterById(arg_7_0.contextData.chapterId)

		if var_7_1:getConfig("map") == arg_7_0.contextData.mapIdx then
			arg_7_0.contextData.chapterVO = var_7_1

			if var_7_1.active then
				assert(not arg_7_0.contextData.openChapterId or arg_7_0.contextData.openChapterId == arg_7_0.contextData.chapterId)

				arg_7_0.contextData.openChapterId = nil
			end
		end
	end

	local var_7_2, var_7_3 = arg_7_0:GetInitializeMap()

	if arg_7_0.contextData.entranceStatus == nil then
		arg_7_0.contextData.entranceStatus = not var_7_3
	end

	if not arg_7_0.contextData.entranceStatus then
		arg_7_0:PreloadLevelMainUI(var_7_2, arg_7_1)
	else
		arg_7_1()
	end
end

function var_0_0.GetInitializeMap(arg_8_0)
	local var_8_0 = (function()
		local var_9_0 = arg_8_0.contextData.chapterVO

		if var_9_0 and var_9_0.active then
			return var_9_0:getConfig("map")
		end

		local var_9_1 = arg_8_0.contextData.mapIdx

		if var_9_1 then
			return var_9_1
		end

		local var_9_2

		if arg_8_0.contextData.targetChapter and arg_8_0.contextData.targetMap then
			arg_8_0.contextData.openChapterId = arg_8_0.contextData.targetChapter
			var_9_2 = arg_8_0.contextData.targetMap.id
			arg_8_0.contextData.targetChapter = nil
			arg_8_0.contextData.targetMap = nil
		elseif arg_8_0.contextData.eliteDefault then
			local var_9_3 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			var_9_2 = var_9_3 and var_9_3.id or nil
			arg_8_0.contextData.eliteDefault = nil
		end

		return var_9_2
	end)()
	local var_8_1 = var_8_0 and getProxy(ChapterProxy):getMapById(var_8_0)

	if var_8_1 then
		local var_8_2, var_8_3 = var_8_1:isUnlock()

		if not var_8_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_8_3)

			var_8_0 = getProxy(ChapterProxy):getLastUnlockMap().id
			arg_8_0.contextData.mapIdx = var_8_0
		end
	else
		var_8_0 = nil
	end

	return var_8_0 or getProxy(ChapterProxy):GetLastNormalMap(), tobool(var_8_0)
end

function var_0_0.init(arg_10_0)
	arg_10_0:initData()
	arg_10_0:initUI()
	arg_10_0:initEvents()
	arg_10_0:updateClouds()
end

function var_0_0.initData(arg_11_0)
	arg_11_0.tweens = {}

	local var_11_0 = arg_11_0._tf.rect.size

	arg_11_0.mapWidth, arg_11_0.mapHeight = var_11_0.x, var_11_0.y
	arg_11_0.levelCamIndices = 1
	arg_11_0.frozenCount = 0
	arg_11_0.currentBG = nil
	arg_11_0.mbDict = {}
	arg_11_0.mapGroup = {}

	if not arg_11_0.contextData.huntingRangeVisibility then
		arg_11_0.contextData.huntingRangeVisibility = 2
	end
end

function var_0_0.initUI(arg_12_0)
	arg_12_0.topPanel = arg_12_0._tf:Find("top")
	arg_12_0.canvasGroup = arg_12_0.topPanel:GetComponent("CanvasGroup")
	arg_12_0.canvasGroup.blocksRaycasts = not arg_12_0.canvasGroup.blocksRaycasts
	arg_12_0.canvasGroup.blocksRaycasts = not arg_12_0.canvasGroup.blocksRaycasts
	arg_12_0.entranceLayer = arg_12_0._tf:Find("entrance")
	arg_12_0.ptBonus = EventPtBonus.New(arg_12_0.entranceLayer:Find("btns/btn_task/bonusPt"))
	arg_12_0.entranceBg = arg_12_0._tf:Find("entrance_bg")
	arg_12_0.topChapter = arg_12_0.topPanel:Find("top_chapter")

	setActive(arg_12_0.topChapter:Find("title_chapter"), false)
	setActive(arg_12_0.topChapter:Find("type_chapter"), false)
	setActive(arg_12_0.topChapter:Find("type_escort"), false)
	setActive(arg_12_0.topChapter:Find("type_skirmish"), false)

	arg_12_0.chapterName = arg_12_0.topChapter:Find("title_chapter/name")
	arg_12_0.chapterNoTitle = arg_12_0.topChapter:Find("title_chapter/chapter")
	arg_12_0.resChapter = arg_12_0.topChapter:Find("resources")

	setActive(arg_12_0.topChapter, true)

	arg_12_0._voteBookBtn = arg_12_0.topChapter:Find("vote_book")
	arg_12_0.leftChapter = arg_12_0._tf:Find("main/left_chapter")

	setActive(arg_12_0.leftChapter, true)

	arg_12_0.leftCanvasGroup = arg_12_0.leftChapter:GetComponent(typeof(CanvasGroup))
	arg_12_0.btnPrev = arg_12_0.leftChapter:Find("btn_prev")
	arg_12_0.btnPrevCol = arg_12_0.leftChapter:Find("btn_prev/prev_image")
	arg_12_0.eliteBtn = arg_12_0.leftChapter:Find("buttons/btn_elite")
	arg_12_0.normalBtn = arg_12_0.leftChapter:Find("buttons/btn_normal")
	arg_12_0.actNormalBtn = arg_12_0.leftChapter:Find("buttons/btn_act_normal")
	arg_12_0.actEliteBtn = arg_12_0.leftChapter:Find("buttons/btn_act_elite")
	arg_12_0.actExtraBtn = arg_12_0.leftChapter:Find("buttons/btn_act_extra")
	arg_12_0.actExtraBtnAnim = arg_12_0.actExtraBtn:Find("usm")
	arg_12_0.remasterBtn = arg_12_0.leftChapter:Find("buttons/btn_remaster")
	arg_12_0.escortBar = arg_12_0.leftChapter:Find("escort_bar")
	arg_12_0.eliteQuota = arg_12_0.leftChapter:Find("elite_quota")
	arg_12_0.skirmishBar = arg_12_0.leftChapter:Find("left_times")
	arg_12_0.mainLayer = arg_12_0._tf:Find("main")

	setActive(arg_12_0.mainLayer:Find("title_chapter_lines"), false)

	arg_12_0.rightChapter = arg_12_0._tf:Find("main/right_chapter")
	arg_12_0.rightCanvasGroup = arg_12_0.rightChapter:GetComponent(typeof(CanvasGroup))
	arg_12_0.eventContainer = arg_12_0.rightChapter:Find("event_btns/event_container")
	arg_12_0.btnSpecial = arg_12_0.eventContainer:Find("btn_task")
	arg_12_0.challengeBtn = arg_12_0.eventContainer:Find("btn_challenge")
	arg_12_0.dailyBtn = arg_12_0.eventContainer:Find("btn_daily")
	arg_12_0.militaryExerciseBtn = arg_12_0.eventContainer:Find("btn_pvp")
	arg_12_0.activityBtn = arg_12_0.rightChapter:Find("event_btns/activity_btn")
	arg_12_0.ptTotal = arg_12_0.rightChapter:Find("event_btns/pt_text")
	arg_12_0.ticketTxt = arg_12_0.rightChapter:Find("event_btns/tickets/Text")
	arg_12_0.remasterAwardBtn = arg_12_0.rightChapter:Find("btn_remaster_award")
	arg_12_0.btnNext = arg_12_0.rightChapter:Find("btn_next")
	arg_12_0.btnNextCol = arg_12_0.rightChapter:Find("btn_next/next_image")
	arg_12_0.countDown = arg_12_0.rightChapter:Find("event_btns/count_down")

	setActive(arg_12_0.rightChapter:Find("event_btns/BottomList"), true)

	arg_12_0.actExchangeShopBtn = arg_12_0.rightChapter:Find("event_btns/BottomList/btn_exchange")
	arg_12_0.actAtelierBuffBtn = arg_12_0.rightChapter:Find("event_btns/BottomList/btn_control_center")
	arg_12_0.actAtelierYumiaBuffBtn = arg_12_0.rightChapter:Find("event_btns/BottomList/btn_yumia_buff")
	arg_12_0.actExtraRank = arg_12_0.rightChapter:Find("event_btns/BottomList/act_extra_rank")

	setActive(arg_12_0.rightChapter, true)

	arg_12_0.damageTextTemplate = go(arg_12_0.topPanel:Find("damage"))

	setActive(arg_12_0.damageTextTemplate, false)

	arg_12_0.damageTextPool = {
		arg_12_0.damageTextTemplate
	}
	arg_12_0.damageTextActive = {}
	arg_12_0.mapHelpBtn = arg_12_0.topPanel:Find("help_button")
	arg_12_0.avoidText = arg_12_0.topPanel:Find("text_avoid")
	arg_12_0.commanderTinkle = arg_12_0.topPanel:Find("neko_tinkle")

	setActive(arg_12_0.commanderTinkle, false)

	arg_12_0.spResult = arg_12_0.topPanel:Find("sp_result")

	setActive(arg_12_0.spResult, false)

	arg_12_0.helpPage = arg_12_0.topPanel:Find("help_page")
	arg_12_0.helpImage = arg_12_0.helpPage:Find("icon")

	setActive(arg_12_0.helpPage, false)

	arg_12_0.curtain = arg_12_0.topPanel:Find("curtain")

	setActive(arg_12_0.curtain, false)

	arg_12_0.map = arg_12_0._tf:Find("maps")
	arg_12_0.mapTFs = {
		arg_12_0._tf:Find("maps/map1"),
		arg_12_0._tf:Find("maps/map2")
	}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.mapTFs) do
		iter_12_1:GetComponent(typeof(Image)).enabled = false
	end

	arg_12_0.UIFXList = arg_12_0._tf:Find("maps/UI_FX_list")

	local var_12_0 = arg_12_0.UIFXList:GetComponentsInChildren(typeof(Renderer)):ToTable()

	for iter_12_2, iter_12_3 in ipairs(var_12_0) do
		iter_12_3.sortingOrder = -1
	end

	arg_12_0.rtRightPanel = arg_12_0._tf:Find("entrance/enters/right_panel")
	arg_12_0.actBtnTpl = arg_12_0.rtRightPanel:Find("content/tpl")

	local var_12_1 = pg.UIMgr.GetInstance()

	arg_12_0.levelCam = var_12_1.levelCamera:GetComponent(typeof(Camera))
	arg_12_0.uiMain = var_12_1.LevelMain

	setActive(arg_12_0.uiMain, false)

	arg_12_0.uiCam = var_12_1.uiCamera:GetComponent(typeof(Camera))
	arg_12_0.levelGrid = arg_12_0.uiMain:Find("LevelGrid")

	setActive(arg_12_0.levelGrid, true)

	arg_12_0.dragLayer = arg_12_0.levelGrid:Find("DragLayer")
	arg_12_0.float = arg_12_0._tf:Find("float")
	arg_12_0.clouds = arg_12_0.float:Find("clouds")

	setActive(arg_12_0.clouds, true)
	setActive(arg_12_0.float:Find("levels"), false)

	arg_12_0.resources = arg_12_0._tf:Find("resources")
	arg_12_0.arrowTarget = arg_12_0.resources:Find("Tpl_Arrow_Target")
	arg_12_0.destinationMarkTpl = arg_12_0.resources:Find("Tpl_Destination_Mark")
	arg_12_0.championTpl = arg_12_0.resources:Find("Tpl_Champion")
	arg_12_0.deadTpl = arg_12_0.resources:Find("Tpl_Dead")
	arg_12_0.enemyTpl = arg_12_0.resources:Find("Tpl_Enemy")
	arg_12_0.oniTpl = arg_12_0.resources:Find("Tpl_Oni")
	arg_12_0.shipTpl = arg_12_0.resources:Find("Tpl_Ship")
	arg_12_0.subTpl = arg_12_0.resources:Find("Tpl_Sub")
	arg_12_0.transportTpl = arg_12_0.resources:Find("Tpl_Transport")

	setText(tf(arg_12_0.enemyTpl):Find("fighting/Text"), i18n("ui_word_levelui2_inevent"))
	arg_12_0:HideBtns()
	setAnchoredPosition(arg_12_0.topChapter, {
		y = 0
	})
	setAnchoredPosition(arg_12_0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(arg_12_0.rightChapter, {
		x = 0
	})

	arg_12_0.bubbleMsgBoxes = {}
	arg_12_0.loader = AutoLoader.New()
	arg_12_0.levelFleetView = LevelFleetView.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)
	arg_12_0.levelInfoView = LevelInfoView.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)

	arg_12_0.levelInfoView:RegisterView(arg_12_0)
	arg_12_0.levelFleetView:RegisterView(arg_12_0)
	arg_12_0:buildCommanderPanel()

	arg_12_0.levelRemasterView = LevelRemasterView.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)
	arg_12_0.chapterAutoDetailPanel = ChapterAutoDetailPanel.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)

	arg_12_0.chapterAutoDetailPanel:RegisterView(arg_12_0)
	arg_12_0:SwitchMapBuilder(MapBuilder.TYPENORMAL)
end

function var_0_0.initEvents(arg_13_0)
	arg_13_0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
		arg_13_0:openCommanderPanel(arg_14_1, arg_14_2, arg_14_3)
	end)
	arg_13_0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function(arg_15_0, arg_15_1)
		arg_13_0:HandleShowMsgBox(arg_15_1)
	end)
	arg_13_0:bind(LevelUIConst.DO_AMBUSH_WARNING, function(arg_16_0, arg_16_1)
		arg_13_0:doAmbushWarning(arg_16_1)
	end)
	arg_13_0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function(arg_17_0, arg_17_1)
		arg_13_0:displayAmbushInfo(arg_17_1)
	end)
	arg_13_0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function(arg_18_0, arg_18_1)
		arg_13_0:displayStrategyInfo(arg_18_1)
	end)
	arg_13_0:bind(LevelUIConst.FROZEN, function(arg_19_0)
		arg_13_0:frozen()
	end)
	arg_13_0:bind(LevelUIConst.UN_FROZEN, function(arg_20_0)
		arg_13_0:unfrozen()
	end)
	arg_13_0:bind(LevelUIConst.DO_TRACKING, function(arg_21_0, arg_21_1)
		arg_13_0:doTracking(arg_21_1)
	end)
	arg_13_0:bind(LevelUIConst.SWITCH_TO_MAP, function()
		if arg_13_0:isfrozen() then
			return
		end

		arg_13_0:switchToMap()
	end)
	arg_13_0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function(arg_23_0, arg_23_1)
		arg_13_0:displayRepairWindow(arg_23_1)
	end)
	arg_13_0:bind(LevelUIConst.DO_PLAY_ANIM, function(arg_24_0, arg_24_1)
		arg_13_0:doPlayAnim(arg_24_1.name, arg_24_1.callback, arg_24_1.onStart)
	end)
	arg_13_0:bind(LevelUIConst.HIDE_FLEET_SELECT, function()
		arg_13_0:hideFleetSelect()
	end)
	arg_13_0:bind(LevelUIConst.HIDE_FLEET_EDIT, function(arg_26_0)
		arg_13_0:hideFleetEdit()
	end)
	arg_13_0:bind(LevelUIConst.ADD_MSG_QUEUE, function(arg_27_0, arg_27_1)
		arg_13_0:addbubbleMsgBox(arg_27_1)
	end)
	arg_13_0:bind(LevelUIConst.SET_MAP, function(arg_28_0, arg_28_1)
		arg_13_0:setMap(arg_28_1)
	end)
end

function var_0_0.onZeroHourRefresh(arg_29_0)
	if arg_29_0.levelInfoView:isShowing() then
		arg_29_0.levelInfoView:RefreshChapterAutoPanel()
	end

	if arg_29_0.levelInfoSPView and arg_29_0.levelInfoSPView:isShowing() then
		arg_29_0.levelInfoView:RefreshChapterAutoPanel()
	end
end

function var_0_0.addbubbleMsgBox(arg_30_0, arg_30_1)
	table.insert(arg_30_0.bubbleMsgBoxes, arg_30_1)

	if #arg_30_0.bubbleMsgBoxes > 1 then
		return
	end

	local var_30_0

	local function var_30_1()
		local var_31_0 = arg_30_0.bubbleMsgBoxes[1]

		if var_31_0 then
			var_31_0(function()
				table.remove(arg_30_0.bubbleMsgBoxes, 1)
				var_30_1()
			end)
		end
	end

	var_30_1()
end

function var_0_0.CleanBubbleMsgbox(arg_33_0)
	table.clean(arg_33_0.bubbleMsgBoxes)
end

function var_0_0.updatePtActivity(arg_34_0, arg_34_1)
	arg_34_0.ptActivity = arg_34_1

	if not arg_34_0.ptActivity then
		return
	end

	arg_34_0:updateActivityRes()
end

function var_0_0.updateActivityRes(arg_35_0)
	local var_35_0 = findTF(arg_35_0.ptTotal, "Text")
	local var_35_1 = findTF(arg_35_0.ptTotal, "icon/Image")

	if var_35_0 and var_35_1 and arg_35_0.ptActivity then
		setText(var_35_0, "x" .. arg_35_0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = tonumber(arg_35_0.ptActivity:getConfig("config_id"))
		}):getIcon(), "", var_35_1, true)
	end
end

function var_0_0.setCommanderPrefabs(arg_36_0, arg_36_1)
	arg_36_0.commanderPrefabs = arg_36_1
end

function var_0_0.didEnter(arg_37_0)
	arg_37_0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_37_0.player.level, "CommanderCatMediator")

	onButton(arg_37_0, arg_37_0.topChapter:Find("back_button"), function()
		if arg_37_0:isfrozen() then
			return
		end

		local var_38_0 = arg_37_0.contextData.map

		if var_38_0 and (var_38_0:isActivity() or var_38_0:isEscort()) then
			arg_37_0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		elseif var_38_0 and var_38_0:isSkirmish() then
			arg_37_0:emit(var_0_0.ON_BACK)
		elseif not arg_37_0.contextData.entranceStatus then
			arg_37_0:ShowEntranceUI(true)
		else
			arg_37_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_37_0, arg_37_0.btnSpecial, function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.dailyBtn, function()
		if arg_37_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_37_0:updatDailyBtnTip()
		arg_37_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.challengeBtn, function()
		if arg_37_0:isfrozen() then
			return
		end

		local var_41_0, var_41_1 = arg_37_0:checkChallengeOpen()

		if var_41_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_41_1)
		else
			arg_37_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.militaryExerciseBtn, function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.normalBtn, function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:setMap(arg_37_0.contextData.map:getBindMapId())
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.eliteBtn, function()
		if arg_37_0:isfrozen() then
			return
		end

		if arg_37_0.contextData.map:getBindMapId() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			local var_44_0 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			if var_44_0 then
				arg_37_0:setMap(var_44_0.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif arg_37_0.contextData.map:isEliteEnabled() then
			arg_37_0:setMap(arg_37_0.contextData.map:getBindMapId())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(arg_37_0, arg_37_0.remasterBtn, function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_37_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("enters/enter_main"), function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:ShowSelectedMap(arg_37_0:GetInitializeMap())
	end, SFX_PANEL)
	setText(arg_37_0.entranceLayer:Find("enters/enter_main/Text"), getProxy(ChapterProxy):getLastUnlockMap():getLastUnlockChapterName())
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("enters/enter_world/enter"), function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:emit(LevelMediator2.ENTER_WORLD)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("enters/enter_ready/activity"), function()
		if arg_37_0:isfrozen() then
			return
		end

		switch(arg_37_0.entranceActivity:getConfig("type"), {
			[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function()
				arg_37_0:emit(LevelMediator2.ON_ACTIVITY_MAP, arg_37_0.entranceActivity.id)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
				arg_37_0:emit(LevelMediator2.ON_OPEN_ACT_BOSS_BATTLE)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
				arg_37_0:emit(LevelMediator2.ON_BOSSRUSH_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
				arg_37_0:emit(LevelMediator2.ON_BOSSSINGLE_MAP, {
					mode = OtherworldMapScene.MODE_BATTLE
				})
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
				arg_37_0:emit(LevelMediator2.ON_CLUE_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = function()
				arg_37_0:emit(LevelMediator2.ON_COLLAB_BOSSRUSH_MAP)
			end
		})
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("btns/btn_remaster"), function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_37_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	setActive(arg_37_0.entranceLayer:Find("btns/btn_remaster"), OPEN_REMASTER)
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("btns/btn_challenge"), function()
		if arg_37_0:isfrozen() then
			return
		end

		local var_56_0, var_56_1 = arg_37_0:checkChallengeOpen()

		if var_56_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_56_1)
		else
			arg_37_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("btns/btn_pvp"), function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("btns/btn_daily"), function()
		if arg_37_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_37_0:updatDailyBtnTip()
		arg_37_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.entranceLayer:Find("btns/btn_task"), function()
		if arg_37_0:isfrozen() then
			return
		end

		arg_37_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	setActive(arg_37_0.entranceLayer:Find("enters/enter_world/enter"), not WORLD_ENTER_LOCK)
	setActive(arg_37_0.entranceLayer:Find("enters/enter_world/nothing"), WORLD_ENTER_LOCK)

	arg_37_0.entranceActivity = getProxy(ActivityProxy):getEnterReadyActivity()[1]

	setActive(arg_37_0.entranceLayer:Find("enters/enter_ready/nothing"), not tobool(arg_37_0.entranceActivity))
	setActive(arg_37_0.entranceLayer:Find("enters/enter_ready/activity"), tobool(arg_37_0.entranceActivity))

	if tobool(arg_37_0.entranceActivity) then
		local var_37_0 = arg_37_0.entranceActivity:getConfig("config_client").entrance_bg

		if var_37_0 then
			GetImageSpriteFromAtlasAsync(var_37_0, "", arg_37_0.entranceLayer:Find("enters/enter_ready/activity"), true)
		end
	end

	arg_37_0:updateRightPanel()

	local var_37_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_37_0.player.level, "EventMediator")

	setActive(arg_37_0.btnSpecial:Find("lock"), not var_37_1)
	setActive(arg_37_0.entranceLayer:Find("btns/btn_task/lock"), not var_37_1)

	local var_37_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_37_0.player.level, "DailyLevelMediator")

	setActive(arg_37_0.dailyBtn:Find("lock"), not var_37_2)
	setActive(arg_37_0.entranceLayer:Find("btns/btn_daily/lock"), not var_37_2)

	local var_37_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_37_0.player.level, "MilitaryExerciseMediator")

	setActive(arg_37_0.militaryExerciseBtn:Find("lock"), not var_37_3)
	setActive(arg_37_0.entranceLayer:Find("btns/btn_pvp/lock"), not var_37_3)

	local var_37_4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_37_0.player.level, "WorldMediator")

	setActive(arg_37_0.entranceLayer:Find("enters/enter_world/enter/lock"), not var_37_4)

	local var_37_5 = LimitChallengeConst.IsOpen()

	setActive(arg_37_0.challengeBtn:Find("lock"), not var_37_5)
	setActive(arg_37_0.entranceLayer:Find("btns/btn_challenge/lock"), not var_37_5)

	local var_37_6 = LimitChallengeConst.IsInAct()

	setActive(arg_37_0.challengeBtn, var_37_6)
	setActive(arg_37_0.entranceLayer:Find("btns/btn_challenge"), var_37_6)

	local var_37_7 = LimitChallengeConst.IsShowRedPoint()

	setActive(arg_37_0.entranceLayer:Find("btns/btn_challenge/tip"), var_37_7)
	arg_37_0:initMapBtn(arg_37_0.btnPrev, -1)
	arg_37_0:initMapBtn(arg_37_0.btnNext, 1)
	arg_37_0:registerActBtn()

	if arg_37_0.contextData.editEliteChapter then
		local var_37_8 = getProxy(ChapterProxy):getChapterById(arg_37_0.contextData.editEliteChapter)

		arg_37_0:displayFleetEdit(var_37_8)

		arg_37_0.contextData.editEliteChapter = nil
	elseif arg_37_0.contextData.selectedChapterVO then
		arg_37_0:displayFleetSelect(arg_37_0.contextData.selectedChapterVO)

		arg_37_0.contextData.selectedChapterVO = nil
	end

	local var_37_9 = arg_37_0.contextData.chapterVO

	if not var_37_9 or not var_37_9.active then
		arg_37_0:tryPlaySubGuide()
	end

	arg_37_0:updateRemasterBtnTip()
	arg_37_0:updatDailyBtnTip()

	if arg_37_0.contextData.open_remaster then
		arg_37_0:displayRemasterPanel(arg_37_0.contextData.isSP)

		arg_37_0.contextData.open_remaster = nil
	end

	arg_37_0:ShowEntranceUI(arg_37_0.contextData.entranceStatus)

	if not arg_37_0.contextData.entranceStatus then
		arg_37_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_37_0:GetInitializeMap())
	end

	arg_37_0:emit(LevelMediator2.ON_DIDENTER)
end

function var_0_0.updateRightPanel(arg_60_0)
	arg_60_0.rightActivityBtns = defaultValue(arg_60_0.rightActivityBtns, {
		LevelSecondMapBtn.New(arg_60_0.actBtnTpl, arg_60_0.event, false)
	})

	local var_60_0 = {}
	local var_60_1 = {}

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.rightActivityBtns) do
		if iter_60_1:InShowTime() then
			table.insert(var_60_0, iter_60_1)
		else
			table.insert(var_60_1, iter_60_1)
		end
	end

	table.sort(var_60_0, CompareFuncs({
		function(arg_61_0)
			return arg_61_0.config.group_id
		end
	}))

	for iter_60_2, iter_60_3 in ipairs(var_60_0) do
		iter_60_3:Init(iter_60_2)
	end

	for iter_60_4, iter_60_5 in ipairs(var_60_1) do
		iter_60_5:Clear()
	end
end

function var_0_0.checkChallengeOpen(arg_62_0)
	local var_62_0 = getProxy(PlayerProxy):getRawData().level

	return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_62_0, "ChallengeMainMediator")
end

function var_0_0.tryPlaySubGuide(arg_63_0)
	if arg_63_0.contextData.map and arg_63_0.contextData.map:isSkirmish() then
		return
	end

	pg.SystemGuideMgr.GetInstance():Play(arg_63_0)
end

function var_0_0.onBackPressed(arg_64_0)
	if arg_64_0:isfrozen() then
		return
	end

	if arg_64_0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_64_0.chapterAutoDetailPanel:isShowing() then
		arg_64_0:HideChapterAutoDetailPanel()
	end

	if arg_64_0.levelInfoView:isShowing() then
		arg_64_0:hideChapterPanel()

		return
	end

	if arg_64_0.levelInfoSPView and arg_64_0.levelInfoSPView:isShowing() then
		arg_64_0:HideLevelInfoSPPanel()

		return
	end

	if arg_64_0.levelFleetView:isShowing() then
		arg_64_0:hideFleetEdit()

		return
	end

	if arg_64_0.levelStrategyView then
		arg_64_0:hideStrategyInfo()

		return
	end

	if arg_64_0.levelRepairView then
		arg_64_0:hideRepairWindow()

		return
	end

	if arg_64_0.levelRemasterView:isShowing() then
		arg_64_0:hideRemasterPanel()

		return
	end

	if arg_64_0.contextData.map and arg_64_0.contextData.map:getConfig("ui_type") == MapBuilder.TYPEEXSP and arg_64_0.mapBuilder.personalPage:IsActive() then
		arg_64_0.mapBuilder.personalPage:Hide()

		return
	end

	if isActive(arg_64_0.helpPage) then
		setActive(arg_64_0.helpPage, false)

		return
	end

	local var_64_0 = arg_64_0.contextData.chapterVO
	local var_64_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_64_0 and var_64_1 then
		arg_64_0:switchToMap()

		return
	end

	triggerButton(arg_64_0.topChapter:Find("back_button"))
end

function var_0_0.ShowEntranceUI(arg_65_0, arg_65_1)
	setActive(arg_65_0.entranceLayer, arg_65_1)
	setActive(arg_65_0.entranceBg, arg_65_1)
	setActive(arg_65_0.map, not arg_65_1)
	setActive(arg_65_0.float, not arg_65_1)
	setActive(arg_65_0.mainLayer, not arg_65_1)
	setActive(arg_65_0.topChapter:Find("type_entrance"), arg_65_1)

	arg_65_0.contextData.entranceStatus = tobool(arg_65_1)

	if arg_65_1 then
		setActive(arg_65_0.topChapter:Find("title_chapter"), false)
		setActive(arg_65_0.topChapter:Find("type_chapter"), false)
		setActive(arg_65_0.topChapter:Find("type_escort"), false)
		setActive(arg_65_0.topChapter:Find("type_skirmish"), false)

		if arg_65_0.newChapterCDTimer then
			arg_65_0.newChapterCDTimer:Stop()

			arg_65_0.newChapterCDTimer = nil
		end

		arg_65_0:RecordLastMapOnExit()

		arg_65_0.contextData.mapIdx = nil
		arg_65_0.contextData.map = nil
	end

	arg_65_0:PlayBGM()
end

function var_0_0.PreloadLevelMainUI(arg_66_0, arg_66_1, arg_66_2)
	if arg_66_0.preloadLevelDone then
		existCall(arg_66_2)

		return
	end

	local var_66_0

	local function var_66_1()
		if not arg_66_0.exited then
			arg_66_0.preloadLevelDone = true

			existCall(arg_66_2)
		end
	end

	local var_66_2 = getProxy(ChapterProxy):getMapById(arg_66_1)
	local var_66_3 = arg_66_0:GetMapBG(var_66_2)

	table.ParallelIpairsAsync(var_66_3, function(arg_68_0, arg_68_1, arg_68_2)
		GetSpriteFromAtlasAsync("levelmap/" .. arg_68_1.BG, "", arg_68_2)
	end, var_66_1)
end

function var_0_0.setShips(arg_69_0, arg_69_1)
	arg_69_0.shipVOs = arg_69_1
end

function var_0_0.updateRes(arg_70_0, arg_70_1)
	if arg_70_0.levelStageView then
		arg_70_0.levelStageView:ActionInvoke("SetPlayer", arg_70_1)
	end

	arg_70_0.player = arg_70_1
end

function var_0_0.setEliteQuota(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = arg_71_2 - arg_71_1
	local var_71_1 = arg_71_0.eliteQuota:Find("bg/Text"):GetComponent(typeof(Text))

	if arg_71_1 == arg_71_2 then
		var_71_1.color = Color.red
	else
		var_71_1.color = Color.New(0.47, 0.89, 0.27)
	end

	var_71_1.text = var_71_0 .. "/" .. arg_71_2
end

function var_0_0.updateEvent(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1:hasFinishState()

	setActive(arg_72_0.btnSpecial:Find("tip"), var_72_0)
	setActive(arg_72_0.entranceLayer:Find("btns/btn_task/tip"), var_72_0)
end

function var_0_0.updateFleet(arg_73_0, arg_73_1)
	arg_73_0.fleets = arg_73_1
end

function var_0_0.updateChapterVO(arg_74_0, arg_74_1, arg_74_2)
	if arg_74_0.contextData.chapterVO and arg_74_0.contextData.chapterVO.id == arg_74_1.id and arg_74_1.active then
		arg_74_0:setChapter(arg_74_1)
	end

	if arg_74_0.contextData.chapterVO and arg_74_0.contextData.chapterVO.id == arg_74_1.id and arg_74_1.active and arg_74_0.levelStageView and arg_74_0.grid then
		local var_74_0 = false
		local var_74_1 = false
		local var_74_2 = false

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyFleet) > 0 then
			arg_74_0.levelStageView:updateStageFleet()
			arg_74_0.levelStageView:updateAmbushRate(arg_74_1.fleet.line, true)

			var_74_2 = true

			if arg_74_0.grid then
				arg_74_0.grid:RefreshFleetCells()
				arg_74_0.grid:UpdateFloor()
				arg_74_0.grid:UpdateWeatherCells()

				var_74_0 = true
			end
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyChampion) > 0 then
			var_74_2 = true

			if arg_74_0.grid then
				arg_74_0.grid:UpdateFleets()
				arg_74_0.grid:clearChampions()
				arg_74_0.grid:initChampions()

				var_74_1 = true
			end
		elseif bit.band(arg_74_2, ChapterConst.DirtyChampionPosition) > 0 then
			var_74_2 = true

			if arg_74_0.grid then
				arg_74_0.grid:UpdateFleets()
				arg_74_0.grid:updateChampions()

				var_74_1 = true
			end
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyAchieve) > 0 then
			arg_74_0.levelStageView:updateStageAchieve()
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyAttachment) > 0 then
			arg_74_0.levelStageView:updateAmbushRate(arg_74_1.fleet.line, true)

			if arg_74_0.grid then
				if not (arg_74_2 < 0) and not (bit.band(arg_74_2, ChapterConst.DirtyFleet) > 0) then
					arg_74_0.grid:updateFleet(arg_74_1.fleets[arg_74_1.findex].id)
				end

				arg_74_0.grid:updateAttachments()

				if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyAutoAction) > 0 then
					arg_74_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					var_74_0 = true
				end
			end
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyStrategy) > 0 then
			arg_74_0.levelStageView:updateStageStrategy()

			var_74_2 = true

			arg_74_0.levelStageView:updateStageBarrier()
			arg_74_0.levelStageView:UpdateAutoFightPanel()
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyAutoAction) > 0 then
			-- block empty
		elseif var_74_0 then
			arg_74_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif var_74_1 then
			arg_74_0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyCellFlag) > 0 then
			arg_74_0.grid:UpdateFloor()
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyBase) > 0 then
			arg_74_0.levelStageView:UpdateDefenseStatus()
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyFloatItems) > 0 then
			arg_74_0.grid:UpdateItemCells()
		end

		if arg_74_2 < 0 or bit.band(arg_74_2, ChapterConst.DirtyWeather) > 0 then
			arg_74_0.grid:UpdateWeatherCells()
		end

		if var_74_2 then
			arg_74_0.levelStageView:updateFleetBuff()
		end
	end
end

function var_0_0.updateClouds(arg_75_0)
	arg_75_0.cloudRTFs = {}
	arg_75_0.cloudRects = {}
	arg_75_0.cloudTimer = {}

	for iter_75_0 = 1, 6 do
		local var_75_0 = arg_75_0.clouds:Find("cloud_" .. iter_75_0)
		local var_75_1 = rtf(var_75_0)

		table.insert(arg_75_0.cloudRTFs, var_75_1)
		table.insert(arg_75_0.cloudRects, var_75_1.rect.width)
	end

	arg_75_0:initCloudsPos()

	for iter_75_1, iter_75_2 in ipairs(arg_75_0.cloudRTFs) do
		local var_75_2 = arg_75_0.cloudRects[iter_75_1]
		local var_75_3 = arg_75_0.initPositions[iter_75_1] or Vector2(0, 0)
		local var_75_4 = 30 - var_75_3.y / 20
		local var_75_5 = (arg_75_0.mapWidth + var_75_2) / var_75_4
		local var_75_6

		var_75_6 = LeanTween.moveX(iter_75_2, arg_75_0.mapWidth, var_75_5):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function()
			var_75_2 = arg_75_0.cloudRects[iter_75_1]
			iter_75_2.anchoredPosition = Vector2(-var_75_2, var_75_3.y)

			var_75_6:setFrom(-var_75_2):setTime((arg_75_0.mapWidth + var_75_2) / var_75_4)
		end))
		var_75_6.passed = math.random() * var_75_5
		arg_75_0.cloudTimer[iter_75_1] = var_75_6.uniqueId
	end
end

function var_0_0.RefreshMapBG(arg_77_0)
	arg_77_0:PlayBGM()
	arg_77_0:SwitchMapBG(arg_77_0.contextData.map, nil, true)
end

function var_0_0.updateCouldAnimator(arg_78_0, arg_78_1, arg_78_2)
	if not arg_78_1 then
		return
	end

	local var_78_0 = arg_78_0.contextData.map:getConfig("ani_controller")

	local function var_78_1(arg_79_0)
		arg_79_0 = tf(arg_79_0)

		local var_79_0 = Vector3.one

		if arg_79_0.rect.width > 0 and arg_79_0.rect.height > 0 then
			var_79_0.x = arg_79_0.parent.rect.width / arg_79_0.rect.width
			var_79_0.y = arg_79_0.parent.rect.height / arg_79_0.rect.height
		end

		arg_79_0.localScale = var_79_0

		if var_78_0 and #var_78_0 > 0 then
			local var_79_1 = getProxy(ChapterProxy)

			;(function()
				for iter_80_0, iter_80_1 in ipairs(var_78_0) do
					local var_80_0 = false
					local var_80_1 = iter_80_1[2][1]

					for iter_80_2, iter_80_3 in ipairs(var_80_1) do
						local var_80_2 = var_79_1:GetChapterItemById(iter_80_3)

						if var_80_2 and var_80_2:isClear() then
							var_80_0 = true

							break
						end
					end

					if iter_80_1[1] == var_0_2 then
						local var_80_3 = _.rest(iter_80_1[2], 2)

						for iter_80_4, iter_80_5 in ipairs(var_80_3) do
							local var_80_4 = arg_79_0:Find(iter_80_5)

							if not IsNil(var_80_4) and not var_80_0 then
								setActive(var_80_4, false)
							end
						end
					elseif iter_80_1[1] == var_0_3 then
						local var_80_5 = _.rest(iter_80_1[2], 2)

						for iter_80_6, iter_80_7 in ipairs(var_80_5) do
							local var_80_6 = arg_79_0:Find(iter_80_7)

							if not IsNil(var_80_6) and not var_80_0 then
								setActive(var_80_6, true)

								return
							end
						end
					elseif iter_80_1[1] == var_0_4 then
						local var_80_7 = _.rest(iter_80_1[2], 2)

						for iter_80_8, iter_80_9 in ipairs(var_80_7) do
							local var_80_8 = arg_79_0:Find(iter_80_9)

							if not IsNil(var_80_8) and not var_80_0 then
								setActive(var_80_8, true)
							end
						end
					end
				end
			end)()
		end
	end

	local var_78_2 = arg_78_0.loader:GetPrefab("ui/" .. arg_78_1, arg_78_1, function(arg_81_0)
		arg_81_0:SetActive(true)

		local var_81_0 = arg_78_0.mapTFs[arg_78_2]

		setParent(arg_81_0, var_81_0)
		pg.ViewUtils.SetSortingOrder(arg_81_0, ChapterConst.LayerWeightMap + arg_78_2 * 2 - 1)
		var_78_1(arg_81_0)
	end)

	table.insert(arg_78_0.mapGroup, var_78_2)
end

function var_0_0.HideBtns(arg_82_0)
	setActive(arg_82_0.btnPrev, false)
	setActive(arg_82_0.eliteQuota, false)
	setActive(arg_82_0.escortBar, false)
	setActive(arg_82_0.skirmishBar, false)
	setActive(arg_82_0.normalBtn, false)
	setActive(arg_82_0.actNormalBtn, false)
	setActive(arg_82_0.eliteBtn, false)
	setActive(arg_82_0.actEliteBtn, false)
	setActive(arg_82_0.actExtraBtn, false)
	setActive(arg_82_0.remasterBtn, false)
	setActive(arg_82_0.btnNext, false)
	setActive(arg_82_0.remasterAwardBtn, false)
	setActive(arg_82_0.eventContainer, false)
	setActive(arg_82_0.activityBtn, false)
	setActive(arg_82_0.ptTotal, false)
	setActive(arg_82_0.ticketTxt.parent, false)
	setActive(arg_82_0.countDown, false)
	setActive(arg_82_0.actAtelierBuffBtn, false)
	setActive(arg_82_0.actAtelierYumiaBuffBtn, false)
	setActive(arg_82_0.actExtraRank, false)
	setActive(arg_82_0.actExchangeShopBtn, false)
	setActive(arg_82_0.mapHelpBtn, false)
end

function var_0_0.updateDifficultyBtns(arg_83_0)
	local var_83_0 = arg_83_0.contextData.map:getConfig("type")

	setActive(arg_83_0.normalBtn, var_83_0 == Map.ELITE)
	setActive(arg_83_0.eliteQuota, var_83_0 == Map.ELITE)
	setActive(arg_83_0.eliteBtn, var_83_0 == Map.SCENARIO)

	local var_83_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID)

	setActive(arg_83_0.eliteBtn:Find("pic_activity"), var_83_1 and not var_83_1:isEnd())
end

function var_0_0.updateActivityBtns(arg_84_0)
	local var_84_0 = arg_84_0.contextData.map
	local var_84_1, var_84_2 = var_84_0:isActivity()
	local var_84_3 = var_84_0:isRemaster()
	local var_84_4 = var_84_0:isSkirmish()
	local var_84_5 = var_84_0:isEscort()
	local var_84_6 = var_84_0:getConfig("type")
	local var_84_7 = setmetatable({}, MainActMapBtn)
	local var_84_8 = var_84_7:InShowTime() and not var_84_1 and not var_84_4 and not var_84_5

	arg_84_0.activityBtnLinkAct = var_84_7:GetActivity()

	if var_84_8 then
		var_84_7.image = arg_84_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_84_7.subImage = arg_84_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_84_7.tipTr = arg_84_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_84_7.tipTxt = arg_84_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_84_8 = var_84_7:InShowTime()

		if var_84_8 then
			var_84_7:InitTipImage()
			var_84_7:InitSubImage()
			var_84_7:InitImage(function()
				return
			end)
			var_84_7:OnInit()
		end
	end

	setActive(arg_84_0.activityBtn, var_84_8)
	arg_84_0:updateRemasterInfo()

	if var_84_1 and var_84_2 then
		local var_84_9

		if var_84_0:isRemaster() then
			var_84_9 = getProxy(ChapterProxy):getRemasterMaps(var_84_0.remasterId)
		else
			var_84_9 = getProxy(ChapterProxy):getMapsByActivities(var_84_0:getConfig("on_activity"))
		end

		local var_84_10 = underscore.any(var_84_9, function(arg_86_0)
			return arg_86_0:isActExtra()
		end)

		setActive(arg_84_0.actExtraBtn, var_84_10 and var_84_6 ~= Map.ACT_EXTRA)

		if isActive(arg_84_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_84_9, function(arg_87_0)
				local var_87_0 = arg_87_0:getMapType()

				return var_87_0 == Map.ACTIVITY_EASY or var_87_0 == Map.ACTIVITY_HARD
			end), function(arg_88_0)
				return arg_88_0:isAllChaptersClear()
			end) then
				setActive(arg_84_0.actExtraBtnAnim, true)
			else
				setActive(arg_84_0.actExtraBtnAnim, false)
			end

			setActive(arg_84_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive(var_84_0:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_84_11 = checkExist(var_84_0:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_84_0.actEliteBtn, var_84_11 and var_84_6 ~= Map.ACTIVITY_HARD)
		setActive(arg_84_0.actNormalBtn, var_84_6 ~= Map.ACTIVITY_EASY)
		setActive(arg_84_0.actExtraRank, var_84_6 == Map.ACT_EXTRA and _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK), function(arg_89_0)
			if not arg_89_0 or arg_89_0:isEnd() then
				return
			end

			local var_89_0 = arg_89_0:getConfig("config_data")[1]

			return _.any(var_84_0:getChapters(), function(arg_90_0)
				if not arg_90_0:IsEXChapter() then
					return false
				end

				return table.contains(arg_90_0:getConfig("boss_expedition_id"), var_89_0)
			end)
		end))
		setActive(arg_84_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_84_3 and var_84_2 and arg_84_0:IsActShopActive())

		local var_84_12 = arg_84_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_84_0.contextData.map:getConfig("on_activity")) or nil
		local var_84_13 = var_84_12 and not var_84_12:isEnd() and var_84_12:GetConfigClientSetting("PTID")

		arg_84_0:updatePtActivity(underscore.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_91_0)
			return arg_91_0:getConfig("config_id") == var_84_13
		end))
		setActive(arg_84_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_84_3 and var_84_2 and arg_84_0.ptActivity and not arg_84_0.ptActivity:isEnd())
	else
		setActive(arg_84_0.actExtraBtn, false)
		setActive(arg_84_0.actEliteBtn, false)
		setActive(arg_84_0.actNormalBtn, false)
		setActive(arg_84_0.actExtraRank, false)
		setActive(arg_84_0.actExchangeShopBtn, false)
		setActive(arg_84_0.actAtelierBuffBtn, false)
		setActive(arg_84_0.actAtelierYumiaBuffBtn, false)
		setActive(arg_84_0.ptTotal, false)
	end

	setActive(arg_84_0.eventContainer, (not var_84_1 or not var_84_2) and not var_84_5)
	setActive(arg_84_0.remasterBtn, OPEN_REMASTER and (var_84_3 or not var_84_1 and not var_84_5 and not var_84_4))
	setActive(arg_84_0.ticketTxt.parent, var_84_3)
	arg_84_0:updateRemasterTicket()
	arg_84_0:updateCountDown()
end

function var_0_0.updateRemasterTicket(arg_92_0)
	setText(arg_92_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_92_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_93_0)
	local var_93_0 = getProxy(ChapterProxy)
	local var_93_1 = var_93_0:ifShowRemasterTip() or var_93_0:anyRemasterAwardCanReceive()

	SetActive(arg_93_0.remasterBtn:Find("tip"), var_93_1)
	SetActive(arg_93_0.entranceLayer:Find("btns/btn_remaster/tip"), var_93_1)
end

function var_0_0.updatDailyBtnTip(arg_94_0)
	local var_94_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_94_0.dailyBtn:Find("tip"), var_94_0)
	SetActive(arg_94_0.entranceLayer:Find("btns/btn_daily/tip"), var_94_0)
end

function var_0_0.updateRemasterInfo(arg_95_0)
	arg_95_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_95_0.contextData.map then
		return
	end

	local var_95_0 = getProxy(ChapterProxy)
	local var_95_1 = arg_95_0.contextData.map:getRemaster()
	local var_95_2 = BossRushChapterRemasterHelper.ChapterAwardInfo(var_95_1)

	setActive(arg_95_0.remasterAwardBtn, var_95_2)

	if var_95_2 then
		local var_95_3 = var_95_2[1]
		local var_95_4, var_95_5, var_95_6, var_95_7, var_95_8 = unpack(var_95_2[2])
		local var_95_9 = var_95_2[3]
		local var_95_10 = var_95_0:getRemasterInfo(var_95_9, var_95_4, var_95_3)

		setText(arg_95_0.remasterAwardBtn:Find("Text"), var_95_10.count .. "/" .. var_95_7)
		updateDrop(arg_95_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_95_5,
			id = var_95_6
		})
		setActive(arg_95_0.remasterAwardBtn:Find("tip"), var_95_7 <= var_95_10.count)
		onButton(arg_95_0, arg_95_0.remasterAwardBtn, function()
			local var_96_0 = BossRushChapterRemasterHelper.GetAwardName(var_95_9, var_95_4)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_95_5,
					id = var_95_6
				},
				remaster = {
					word = i18n("level_remaster_tip4", var_96_0),
					number = var_95_10.count .. "/" .. var_95_7,
					btn_text = i18n(var_95_10.count < var_95_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_95_10.count < var_95_7 then
							if var_95_9 and var_95_9 > 0 then
								arg_95_0:emit(LevelMediator2.ON_BOSSRUSH_REMASTER_ACTIVITY, var_95_9)

								return
							end

							local var_97_0 = pg.chapter_template[var_95_4].map
							local var_97_1, var_97_2 = var_95_0:getMapById(var_97_0):isUnlock()

							if not var_97_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_97_2)
							else
								arg_95_0:ShowSelectedMap(var_97_0)
							end
						else
							arg_95_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_95_4, var_95_3, var_95_9)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_98_0)
	local var_98_0 = getProxy(ChapterProxy)

	if arg_98_0.newChapterCDTimer then
		arg_98_0.newChapterCDTimer:Stop()

		arg_98_0.newChapterCDTimer = nil
	end

	local var_98_1 = 0

	if arg_98_0.contextData.map:isActivity() and not arg_98_0.contextData.map:isRemaster() then
		local var_98_2 = var_98_0:getMapsByActivities(arg_98_0.contextData.map:getConfig("on_activity"))

		_.each(var_98_2, function(arg_99_0)
			local var_99_0 = arg_99_0:getChapterTimeLimit()

			if var_98_1 == 0 then
				var_98_1 = var_99_0
			else
				var_98_1 = math.min(var_98_1, var_99_0)
			end
		end)
		setActive(arg_98_0.countDown, var_98_1 > 0)
		setText(arg_98_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_98_0.countDown, false)
	end

	if var_98_1 > 0 then
		setText(arg_98_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_98_1))

		arg_98_0.newChapterCDTimer = Timer.New(function()
			var_98_1 = var_98_1 - 1

			if var_98_1 <= 0 then
				arg_98_0:updateCountDown()

				if not arg_98_0.contextData.chapterVO then
					arg_98_0:setMap(arg_98_0.contextData.mapIdx)
				end
			else
				setText(arg_98_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_98_1))
			end
		end, 1, -1)

		arg_98_0.newChapterCDTimer:Start()
	else
		setText(arg_98_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_101_0)
	onButton(arg_101_0, arg_101_0.actExtraRank, function()
		if arg_101_0:isfrozen() then
			return
		end

		arg_101_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_101_0, arg_101_0.activityBtn, function()
		if arg_101_0:isfrozen() then
			return
		end

		if arg_101_0.activityBtnLinkAct then
			local var_103_0 = arg_101_0.activityBtnLinkAct:getConfig("type")
			local var_103_1 = arg_101_0.activityBtnLinkAct.id

			if var_103_0 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)

				return
			elseif var_103_0 == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_DAL_COLLAB)

				return
			elseif var_103_1 == ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.OTHERWORLD_MAP)

				return
			elseif var_103_0 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ZHANG_WU_BOSS)

				return
			end
		end

		arg_101_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_101_0, arg_101_0.actExchangeShopBtn, function()
		if arg_101_0:isfrozen() then
			return
		end

		arg_101_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_101_0, arg_101_0.actAtelierBuffBtn, function()
		if arg_101_0:isfrozen() then
			return
		end

		arg_101_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)
	onButton(arg_101_0, arg_101_0.actAtelierYumiaBuffBtn, function()
		if arg_101_0:isfrozen() then
			return
		end

		arg_101_0:emit(LevelMediator2.SHOW_ATELIER_BUFF, true)
	end, SFX_UI_CLICK)

	local var_101_0 = getProxy(ChapterProxy)

	local function var_101_1(arg_107_0, arg_107_1, arg_107_2)
		local var_107_0

		if arg_107_0:isRemaster() then
			var_107_0 = var_101_0:getRemasterMaps(arg_107_0.remasterId)
		else
			var_107_0 = var_101_0:getMapsByActivities(arg_107_0:getConfig("on_activity"))
		end

		local var_107_1 = _.select(var_107_0, function(arg_108_0)
			return arg_108_0:getMapType() == arg_107_1
		end)

		table.sort(var_107_1, function(arg_109_0, arg_109_1)
			return arg_109_0.id < arg_109_1.id
		end)

		local var_107_2 = table.indexof(underscore.map(var_107_1, function(arg_110_0)
			return arg_110_0.id
		end), arg_107_2) or #var_107_1

		while not var_107_1[var_107_2]:isUnlock() do
			if var_107_2 > 1 then
				var_107_2 = var_107_2 - 1
			else
				break
			end
		end

		return var_107_1[var_107_2]
	end

	arg_101_0:bind(LevelUIConst.SWITCH_ACT_MAP, function(arg_111_0, arg_111_1, arg_111_2)
		arg_111_2 = arg_111_2 or switch(arg_111_1, {
			[Map.ACTIVITY_EASY] = function()
				return arg_101_0.contextData.map:getBindMapId()
			end,
			[Map.ACTIVITY_HARD] = function()
				return arg_101_0.contextData.map:getBindMapId()
			end,
			[Map.ACT_EXTRA] = function()
				return PlayerPrefs.GetInt("ex_mapId", 0)
			end
		})

		local var_111_0 = var_101_1(arg_101_0.contextData.map, arg_111_1, arg_111_2)
		local var_111_1, var_111_2 = var_111_0:isUnlock()

		if var_111_1 then
			arg_101_0:setMap(var_111_0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_111_2)
		end
	end)
	onButton(arg_101_0, arg_101_0.actNormalBtn, function()
		if arg_101_0:isfrozen() then
			return
		end

		arg_101_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
	onButton(arg_101_0, arg_101_0.actEliteBtn, function()
		if arg_101_0:isfrozen() then
			return
		end

		arg_101_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(arg_101_0, arg_101_0.actExtraBtn, function()
		if arg_101_0:isfrozen() then
			return
		end

		arg_101_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACT_EXTRA)
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_118_0, arg_118_1)
	arg_118_0.initPositions = {}

	local var_118_0 = arg_118_1 or 1
	local var_118_1 = pg.expedition_data_by_map[var_118_0].clouds_pos

	for iter_118_0, iter_118_1 in ipairs(arg_118_0.cloudRTFs) do
		local var_118_2 = var_118_1[iter_118_0]

		if var_118_2 then
			iter_118_1.anchoredPosition = Vector2(var_118_2[1], var_118_2[2])

			table.insert(arg_118_0.initPositions, iter_118_1.anchoredPosition)
		else
			setActive(iter_118_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_119_0, arg_119_1, arg_119_2)
	onButton(arg_119_0, arg_119_1, function()
		if arg_119_0:isfrozen() then
			return
		end

		local var_120_0 = arg_119_0.contextData.mapIdx + arg_119_2
		local var_120_1 = getProxy(ChapterProxy):getMapById(var_120_0)

		if not var_120_1 then
			return
		end

		if var_120_1:getMapType() == Map.ELITE and not var_120_1:isEliteEnabled() then
			var_120_1 = var_120_1:getBindMap()
			var_120_0 = var_120_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_120_2, var_120_3 = var_120_1:isUnlock()

		if arg_119_2 > 0 and not var_120_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_120_3)

			return
		end

		arg_119_0:setMap(var_120_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_121_0, arg_121_1, arg_121_2)
	seriesAsync({
		function(arg_122_0)
			if arg_121_0.contextData.entranceStatus then
				arg_121_0:frozen()

				arg_121_0.nextPreloadMap = arg_121_1

				arg_121_0:PreloadLevelMainUI(arg_121_1, function()
					arg_121_0:unfrozen()

					if arg_121_0.nextPreloadMap ~= arg_121_1 then
						return
					end

					arg_121_0:ShowEntranceUI(false)
					arg_121_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_121_1)
					arg_122_0()
				end)
			else
				arg_121_0:setMap(arg_121_1)
				arg_122_0()
			end
		end
	}, arg_121_2)
end

function var_0_0.setMap(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_0.contextData.mapIdx

	arg_124_0.contextData.mapIdx = arg_124_1
	arg_124_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_124_1)

	assert(arg_124_0.contextData.map, "map cannot be nil " .. arg_124_1)

	if arg_124_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_124_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_124_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_124_0.contextData.map.remasterId, arg_124_1)
		PlayerPrefs.Save()
	end

	arg_124_0:RecordLastMapOnExit()
	arg_124_0:updateMap(var_124_0)
	arg_124_0:tryPlayMapStory()
end

local var_0_5 = import("view.level.MapBuilder.MapBuilder")
local var_0_6 = {
	[var_0_5.TYPENORMAL] = "MapBuilderNormal",
	[var_0_5.TYPEESCORT] = "MapBuilderEscort",
	[var_0_5.TYPESHINANO] = "MapBuilderShinano",
	[var_0_5.TYPESKIRMISH] = "MapBuilderSkirmish",
	[var_0_5.TYPEBISMARCK] = "MapBuilderBismarck",
	[var_0_5.TYPESSSS] = "MapBuilderSSSS",
	[var_0_5.TYPEATELIER] = "MapBuilderAtelier",
	[var_0_5.TYPESENRANKAGURA] = "MapBuilderSenrankagura",
	[var_0_5.TYPESP] = "MapBuilderSP",
	[var_0_5.TYPESPFULL] = "MapBuilderSPFull",
	[var_0_5.TYPESPSERIES] = "MapBuilderSPSeries",
	[var_0_5.TYPESPSERIESFULL] = "MapBuilderSPSeriesFull",
	[var_0_5.TYPEATELIERYUMIA] = "MapBuilderAtelierYumia",
	[var_0_5.TYPEEXSP] = "MapBuilderEXSP",
	[var_0_5.TYPESPSERIESRECREW] = "MapBuilderSPSeriesRecrew"
}

function var_0_0.SwitchMapBuilder(arg_125_0, arg_125_1)
	if arg_125_0.mapBuilder and arg_125_0.mapBuilder:GetType() ~= arg_125_1 then
		arg_125_0.mapBuilder.buffer:Hide()
	end

	local var_125_0 = arg_125_0:GetMapBuilderInBuffer(arg_125_1)

	arg_125_0.mapBuilder = var_125_0

	var_125_0.buffer:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_126_0, arg_126_1)
	if not arg_126_0.mbDict[arg_126_1] then
		local var_126_0 = _G[var_0_6[arg_126_1]]

		assert(var_126_0, "Missing MapBuilder of type " .. (arg_126_1 or "NIL"))

		arg_126_0.mbDict[arg_126_1] = var_126_0.New(arg_126_0._tf, arg_126_0)
		arg_126_0.mbDict[arg_126_1].isFrozen = arg_126_0:isfrozen()

		arg_126_0.mbDict[arg_126_1]:Load()
	end

	return arg_126_0.mbDict[arg_126_1]
end

function var_0_0.updateMap(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_0.contextData.map
	local var_127_1 = var_127_0:getConfig("anchor")
	local var_127_2

	if var_127_1 == "" then
		var_127_2 = Vector2(0.5, 0.5)
	else
		var_127_2 = Vector2(unpack(var_127_1))
	end

	arg_127_0.map.pivot = var_127_2

	local var_127_3 = var_127_0:getConfig("uifx")

	for iter_127_0 = 1, arg_127_0.UIFXList.childCount do
		local var_127_4 = arg_127_0.UIFXList:GetChild(iter_127_0 - 1)

		setActive(var_127_4, var_127_4.name == var_127_3)
	end

	arg_127_0:SwitchMapBG(var_127_0, arg_127_1)
	arg_127_0:PlayBGM()

	local var_127_5 = arg_127_0.contextData.map:getConfig("ui_type")

	arg_127_0:SwitchMapBuilder(var_127_5)
	seriesAsync({
		function(arg_128_0)
			arg_127_0.mapBuilder:CallbackInvoke(arg_128_0)
		end,
		function(arg_129_0)
			arg_127_0.mapBuilder:UpdateMapVO(var_127_0)
			arg_127_0.mapBuilder:UpdateView()
			arg_127_0.mapBuilder:UpdateMapItems()
			arg_127_0.mapBuilder:PlayEnterAnim()
		end
	})
end

function var_0_0.UpdateSwitchMapButton(arg_130_0)
	local var_130_0 = arg_130_0.contextData.map
	local var_130_1 = getProxy(ChapterProxy)
	local var_130_2 = var_130_1:getMapById(var_130_0.id - 1)
	local var_130_3 = var_130_1:getMapById(var_130_0.id + 1)

	setActive(arg_130_0.btnPrev, tobool(var_130_2))
	setActive(arg_130_0.btnNext, tobool(var_130_3))

	local var_130_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_130_0.btnPrevCol, var_130_2 and Color.white or var_130_4)
	setImageColor(arg_130_0.btnNextCol, var_130_3 and var_130_3:isUnlock() and Color.white or var_130_4)
end

function var_0_0.tryPlayMapStory(arg_131_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_132_0)
			local var_132_0 = arg_131_0.contextData.map:getConfig("enter_story")

			if var_132_0 and var_132_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_132_0) and not arg_131_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_132_1 = tonumber(var_132_0)

				if var_132_1 and var_132_1 > 0 then
					arg_131_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_132_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_132_0, arg_132_0)
				end

				return
			end

			arg_132_0()
		end,
		function(arg_133_0)
			local var_133_0 = arg_131_0.contextData.map:getConfig("guide_id")

			if var_133_0 and var_133_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_133_0, nil, arg_133_0)

				return
			end

			arg_133_0()
		end,
		function(arg_134_0)
			if isActive(arg_131_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_134_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_134_1

				if var_134_0 then
					var_134_1 = {
						1,
						2
					}
				else
					var_134_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_134_1)
			else
				arg_134_0()
			end
		end,
		function(arg_135_0)
			if arg_131_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_131_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_136_0, arg_136_1, arg_136_2, arg_136_3)
	arg_136_0.uiAnims = arg_136_0.uiAnims or {}

	local var_136_0 = arg_136_0.uiAnims[arg_136_1]

	local function var_136_1()
		arg_136_0.playing = true

		arg_136_0:frozen()
		var_136_0:SetActive(true)

		local var_137_0 = tf(var_136_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_137_0)

		if arg_136_3 then
			arg_136_3(var_136_0)
		end

		var_137_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_138_0)
			arg_136_0.playing = false

			if arg_136_2 then
				arg_136_2(var_136_0)
			end

			arg_136_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_136_0 then
		PoolMgr.GetInstance():GetUI(arg_136_1, true, function(arg_139_0)
			arg_139_0:SetActive(true)

			arg_136_0.uiAnims[arg_136_1] = arg_139_0
			var_136_0 = arg_136_0.uiAnims[arg_136_1]

			var_136_1()
		end)
	else
		var_136_1()
	end
end

function var_0_0.displaySpResult(arg_140_0, arg_140_1, arg_140_2)
	setActive(arg_140_0.spResult, true)
	arg_140_0:DisplaySPAnim(arg_140_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_141_0)
		onButton(arg_140_0, arg_141_0, function()
			removeOnButton(arg_141_0)
			setActive(arg_141_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_141_0, arg_140_0._tf)
			arg_140_0:hideSpResult()
			arg_140_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_143_0)
	setActive(arg_143_0.spResult, false)
end

function var_0_0.displayBombResult(arg_144_0, arg_144_1)
	setActive(arg_144_0.spResult, true)
	arg_144_0:DisplaySPAnim("SpBombRet", function(arg_145_0)
		onButton(arg_144_0, arg_145_0, function()
			removeOnButton(arg_145_0)
			setActive(arg_145_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_145_0, arg_144_0._tf)
			arg_144_0:hideSpResult()
			arg_144_1()
		end, SFX_PANEL)
	end, function(arg_147_0)
		setText(arg_147_0.transform:Find("right/name_bg/en"), arg_144_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_148_0, arg_148_1, arg_148_2)
	arg_148_0.contextData.chapterLoopFlag = arg_148_2

	local var_148_0 = getProxy(ChapterProxy):getChapterById(arg_148_1, true)

	if var_148_0:getConfig("type") == Chapter.CustomFleet then
		arg_148_0:displayFleetEdit(var_148_0)

		return
	end

	if #var_148_0:getNpcShipByType(1) > 0 then
		arg_148_0:emit(LevelMediator2.ON_TRACKING, arg_148_1)

		return
	end

	arg_148_0:displayFleetSelect(var_148_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_149_0, arg_149_1, arg_149_2)
	seriesAsync({
		function(arg_150_0)
			if not arg_149_0.levelInfoView:GetLoaded() then
				arg_149_0:frozen()
				arg_149_0.levelInfoView:Load()
				arg_149_0.levelInfoView:CallbackInvoke(function()
					arg_149_0:unfrozen()
					arg_150_0()
				end)

				return
			end

			arg_150_0()
		end,
		function(arg_152_0)
			local function var_152_0(arg_153_0, arg_153_1)
				arg_149_0:hideChapterPanel()
				arg_149_0:OnLevelInfoPanelConfirm(arg_153_0, arg_153_1)
			end

			local function var_152_1()
				arg_149_0:hideChapterPanel()
			end

			local var_152_2 = getProxy(ChapterProxy):getChapterById(arg_149_1, true)

			if getProxy(ChapterProxy):getMapById(var_152_2:getConfig("map")):isSkirmish() and #var_152_2:getNpcShipByType(1) > 0 then
				var_152_0(false)

				return
			end

			arg_149_0.levelInfoView:set(arg_149_1, arg_149_2)
			arg_149_0.levelInfoView:setCBFunc(var_152_0, var_152_1)
			arg_149_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_155_0)
	if arg_155_0.levelInfoView:isShowing() then
		arg_155_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_156_0)
	arg_156_0.levelInfoView:Destroy()

	arg_156_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_157_0, arg_157_1, arg_157_2, arg_157_3)
	seriesAsync({
		function(arg_158_0)
			if not arg_157_0.levelInfoSPView then
				arg_157_0.levelInfoSPView = LevelInfoSPView.New(arg_157_0.topPanel, arg_157_0.event, arg_157_0.contextData)

				arg_157_0.levelInfoSPView:RegisterView(arg_157_0)
				arg_157_0:frozen()
				arg_157_0.levelInfoSPView:Load()
				arg_157_0.levelInfoSPView:CallbackInvoke(function()
					arg_157_0:unfrozen()
					arg_158_0()
				end)

				return
			end

			arg_158_0()
		end,
		function(arg_160_0)
			local function var_160_0(arg_161_0, arg_161_1)
				arg_157_0:HideLevelInfoSPPanel()
				arg_157_0:OnLevelInfoPanelConfirm(arg_161_0, arg_161_1)
			end

			local function var_160_1()
				arg_157_0:HideLevelInfoSPPanel()
			end

			arg_157_0.levelInfoSPView:SetChapterGroupInfo(arg_157_2)
			arg_157_0.levelInfoSPView:set(arg_157_1, arg_157_3)
			arg_157_0.levelInfoSPView:setCBFunc(var_160_0, var_160_1)
			arg_157_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_163_0)
	if arg_163_0.levelInfoSPView and arg_163_0.levelInfoSPView:isShowing() then
		arg_163_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_164_0)
	if not arg_164_0.levelInfoSPView then
		return
	end

	arg_164_0.levelInfoSPView:Destroy()

	arg_164_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_165_0, arg_165_1)
	local var_165_0 = arg_165_0.contextData.selectedFleetIDs or arg_165_1:GetDefaultFleetIndex()

	arg_165_1 = Clone(arg_165_1)
	arg_165_1.loopFlag = arg_165_0.contextData.chapterLoopFlag

	arg_165_0.levelFleetView:updateSpecialOperationTickets(arg_165_0.spTickets)
	arg_165_0.levelFleetView:Load()
	arg_165_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_165_0.shipVOs)
	arg_165_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_165_0.openedCommanerSystem)
	arg_165_0.levelFleetView:ActionInvoke("set", arg_165_1, arg_165_0.fleets, var_165_0)
	arg_165_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_166_0)
	if arg_166_0.levelCMDFormationView:isShowing() then
		arg_166_0.levelCMDFormationView:Hide()
	end

	if arg_166_0.levelFleetView then
		arg_166_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_167_0)
	arg_167_0.levelCMDFormationView = LevelCMDFormationView.New(arg_167_0.topPanel, arg_167_0.event, arg_167_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_168_0)
	if not arg_168_0.levelFleetView then
		return
	end

	arg_168_0.levelFleetView:Destroy()

	arg_168_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_169_0, arg_169_1)
	arg_169_1 = Clone(arg_169_1)
	arg_169_1.loopFlag = arg_169_0.contextData.chapterLoopFlag

	arg_169_0.levelFleetView:updateSpecialOperationTickets(arg_169_0.spTickets)
	arg_169_0.levelFleetView:Load()
	arg_169_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_169_0.openedCommanerSystem)
	arg_169_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_169_0.shipVOs)
	arg_169_0.levelFleetView:ActionInvoke("setOnHard", arg_169_1)
	arg_169_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_170_0)
	arg_170_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_171_0)
	arg_171_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_172_0, arg_172_1)
	if not arg_172_0.levelFleetView then
		return
	end

	assert(arg_172_0.levelFleetView:GetLoaded())

	local var_172_0 = arg_172_0.levelFleetView:IsSelectMode()
	local var_172_1

	if var_172_0 then
		arg_172_0.levelFleetView:ActionInvoke("set", arg_172_1 or arg_172_0.levelFleetView.chapter, arg_172_0.fleets, arg_172_0.levelFleetView:getSelectIds())

		if arg_172_0.levelCMDFormationView:isShowing() then
			local var_172_2 = arg_172_0.levelCMDFormationView.fleet.id

			var_172_1 = arg_172_0.fleets[var_172_2]
		end
	else
		arg_172_0.levelFleetView:ActionInvoke("setOnHard", arg_172_1 or arg_172_0.levelFleetView.chapter)

		if arg_172_0.levelCMDFormationView:isShowing() then
			local var_172_3 = arg_172_0.levelCMDFormationView.fleet.id

			var_172_1 = arg_172_1:wrapEliteFleet(var_172_3)
		end
	end

	if var_172_1 then
		arg_172_0.levelCMDFormationView:ActionInvoke("updateFleet", var_172_1)
	end
end

function var_0_0.setChapter(arg_173_0, arg_173_1)
	local var_173_0

	if arg_173_1 then
		var_173_0 = arg_173_1.id
	end

	arg_173_0.contextData.chapterId = var_173_0
	arg_173_0.contextData.chapterVO = arg_173_1
end

function var_0_0.switchToChapter(arg_174_0, arg_174_1)
	if arg_174_0.contextData.mapIdx ~= arg_174_1:getConfig("map") then
		arg_174_0:setMap(arg_174_1:getConfig("map"))
	end

	arg_174_0:setChapter(arg_174_1)

	arg_174_0.leftCanvasGroup.blocksRaycasts = false
	arg_174_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_174_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_174_0:DestroyLevelStageView()

	if not arg_174_0.levelStageView then
		arg_174_0.levelStageView = LevelStageView.New(arg_174_0.topPanel, arg_174_0.event, arg_174_0.contextData)

		arg_174_0.levelStageView:Load()

		arg_174_0.levelStageView.isFrozen = arg_174_0:isfrozen()
	end

	arg_174_0:frozen()

	local function var_174_0()
		seriesAsync({
			function(arg_176_0)
				arg_174_0.mapBuilder:CallbackInvoke(arg_176_0)
			end,
			function(arg_177_0)
				setActive(arg_174_0.clouds, false)
				arg_174_0.mapBuilder:HideFloat()
				arg_174_0:BlurPanel(arg_174_0.topPanel, {
					blurCamList = {
						pg.UIMgr.CameraUI
					}
				})
				arg_174_0.levelStageView:updateStageInfo()
				arg_174_0.levelStageView:updateAmbushRate(arg_174_1.fleet.line, true)
				arg_174_0.levelStageView:updateStageAchieve()
				arg_174_0.levelStageView:updateStageBarrier()
				arg_174_0.levelStageView:updateBombPanel()
				arg_174_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_177_0)
			end,
			function(arg_178_0)
				if arg_174_0.exited then
					return
				end

				arg_174_0.levelStageView:updateStageStrategy()

				arg_174_0.canvasGroup.blocksRaycasts = arg_174_0.frozenCount == 0

				onNextTick(arg_178_0)
			end,
			function(arg_179_0)
				if arg_174_0.exited then
					return
				end

				arg_174_0.levelStageView:updateStageFleet()
				arg_174_0.levelStageView:updateSupportFleet()
				arg_174_0.levelStageView:updateFleetBuff()
				onNextTick(arg_179_0)
			end,
			function(arg_180_0)
				if arg_174_0.exited then
					return
				end

				parallelAsync({
					function(arg_181_0)
						local var_181_0 = arg_174_1:getConfig("scale")
						local var_181_1 = LeanTween.value(go(arg_174_0.map), arg_174_0.map.localScale, Vector3.New(var_181_0[3], var_181_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_182_0)
							arg_174_0.map.localScale = arg_182_0
							arg_174_0.float.localScale = arg_182_0
						end):setOnComplete(System.Action(function()
							arg_174_0.mapBuilder:ShowFloat()
							arg_174_0.mapBuilder:Hide()
							arg_181_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_174_0:RecordTween("mapScale", var_181_1.uniqueId)

						local var_181_2 = LeanTween.value(go(arg_174_0.map), arg_174_0.map.pivot, Vector2.New(math.clamp(var_181_0[1] - 0.5, 0, 1), math.clamp(var_181_0[2] - 0.5, 0, 1)), var_0_1)

						var_181_2:setOnUpdateVector2(function(arg_184_0)
							arg_174_0.map.pivot = arg_184_0
							arg_174_0.float.pivot = arg_184_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_174_0:RecordTween("mapPivot", var_181_2.uniqueId)
						shiftPanel(arg_174_0.leftChapter, -arg_174_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_174_0.rightChapter, arg_174_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_174_0.topChapter, 0, arg_174_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_174_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_185_0)
						arg_174_0:PlayBGM()

						local var_185_0 = {}
						local var_185_1 = arg_174_1:getConfig("bg")

						if var_185_1 and #var_185_1 > 0 then
							var_185_0[1] = {
								BG = var_185_1
							}
						end

						arg_174_0:SwitchBG(var_185_0, arg_185_0)
					end
				}, function()
					onNextTick(arg_180_0)
				end)
			end,
			function(arg_187_0)
				if arg_174_0.exited then
					return
				end

				setActive(arg_174_0.topChapter, false)
				setActive(arg_174_0.leftChapter, false)
				setActive(arg_174_0.rightChapter, false)

				arg_174_0.leftCanvasGroup.blocksRaycasts = true
				arg_174_0.rightCanvasGroup.blocksRaycasts = true

				arg_174_0:initGrid(arg_187_0)
			end,
			function(arg_188_0)
				if arg_174_0.exited then
					return
				end

				arg_174_0.levelStageView:SetGrid(arg_174_0.grid)

				arg_174_0.contextData.huntingRangeVisibility = arg_174_0.contextData.huntingRangeVisibility - 1

				arg_174_0.grid:toggleHuntingRange()

				local var_188_0 = arg_174_1:getConfig("pop_pic")

				if var_188_0 and #var_188_0 > 0 and arg_174_0.FirstEnterChapter == arg_174_1.id then
					arg_174_0:doPlayAnim(var_188_0, function(arg_189_0)
						setActive(arg_189_0, false)

						if arg_174_0.exited then
							return
						end

						arg_188_0()
					end)
				else
					arg_188_0()
				end
			end,
			function(arg_190_0)
				arg_174_0.levelStageView:tryAutoAction(arg_190_0)
			end,
			function(arg_191_0)
				if arg_174_0.exited then
					return
				end

				arg_174_0:unfrozen()

				if arg_174_0.FirstEnterChapter then
					arg_174_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_174_1.subAutoAttack)
				end

				arg_174_0.FirstEnterChapter = nil

				arg_191_0()
			end,
			function(arg_192_0)
				if arg_174_1:NeedSupportSubmarineStage() then
					arg_174_0.levelStageView:TryEnterChapterSupportSubmarineStage(arg_192_0)
				else
					arg_192_0()
				end
			end
		}, function()
			arg_174_0.levelStageView:tryAutoTrigger(true)
		end)
	end

	arg_174_0.levelStageView:ActionInvoke("SetSeriesOperation", var_174_0)
	arg_174_0.levelStageView:ActionInvoke("SetPlayer", arg_174_0.player)
	arg_174_0.levelStageView:ActionInvoke("SwitchToChapter", arg_174_1)
end

function var_0_0.switchToMap(arg_194_0, arg_194_1)
	arg_194_0:frozen()
	arg_194_0:destroyGrid()
	arg_194_0:setChapter(nil)
	LeanTween.cancel(go(arg_194_0.map))

	local var_194_0 = LeanTween.value(go(arg_194_0.map), arg_194_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_195_0)
		arg_194_0.map.localScale = arg_195_0
		arg_194_0.float.localScale = arg_195_0
	end):setOnComplete(System.Action(function()
		arg_194_0:unfrozen()
		arg_194_0.mapBuilder:PlayEnterAnim()
		existCall(arg_194_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_194_0:RecordTween("mapScale", var_194_0.uniqueId)

	local var_194_1 = arg_194_0.contextData.map:getConfig("anchor")
	local var_194_2

	if var_194_1 == "" then
		var_194_2 = Vector2(0.5, 0.5)
	else
		var_194_2 = Vector2(unpack(var_194_1))
	end

	local var_194_3 = LeanTween.value(go(arg_194_0.map), arg_194_0.map.pivot, var_194_2, var_0_1)

	var_194_3:setOnUpdateVector2(function(arg_197_0)
		arg_194_0.map.pivot = arg_197_0
		arg_194_0.float.pivot = arg_197_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_194_0:RecordTween("mapPivot", var_194_3.uniqueId)
	setActive(arg_194_0.topChapter, true)
	setActive(arg_194_0.leftChapter, true)
	setActive(arg_194_0.rightChapter, true)
	shiftPanel(arg_194_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_194_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_194_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_194_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_194_0.levelStageView then
		arg_194_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_194_0:DestroyLevelStageView()
		end)
		arg_194_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_194_0:SwitchMapBG(arg_194_0.contextData.map)
	arg_194_0:PlayBGM()
	seriesAsync({
		function(arg_199_0)
			arg_194_0.mapBuilder:CallbackInvoke(arg_199_0)
		end,
		function(arg_200_0)
			arg_194_0.mapBuilder:Show()
			arg_194_0.mapBuilder:UpdateView()
			arg_194_0.mapBuilder:UpdateMapItems()
		end
	})
	arg_194_0:UnOverlayPanel(arg_194_0.topPanel, arg_194_0._tf)

	arg_194_0.canvasGroup.blocksRaycasts = arg_194_0.frozenCount == 0
	arg_194_0.canvasGroup.interactable = true

	if arg_194_0.ambushWarning and arg_194_0.ambushWarning.activeSelf then
		arg_194_0.ambushWarning:SetActive(false)
		arg_194_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_201_0, arg_201_1, arg_201_2, arg_201_3)
	if not arg_201_1 or #arg_201_1 <= 0 then
		existCall(arg_201_2)

		return
	elseif arg_201_3 then
		-- block empty
	elseif table.equal(arg_201_0.currentBG, arg_201_1) then
		return
	end

	arg_201_0.currentBG = arg_201_1

	for iter_201_0, iter_201_1 in ipairs(arg_201_0.mapGroup) do
		arg_201_0.loader:ClearRequest(iter_201_1)
	end

	table.clear(arg_201_0.mapGroup)

	local var_201_0 = {}

	table.ParallelIpairsAsync(arg_201_1, function(arg_202_0, arg_202_1, arg_202_2)
		local var_202_0 = arg_201_0.mapTFs[arg_202_0]
		local var_202_1 = arg_202_1.bgPrefix and arg_202_1.bgPrefix .. "/" or "levelmap/"
		local var_202_2 = arg_201_0.loader:GetSpriteDirect(var_202_1 .. arg_202_1.BG, "", function(arg_203_0)
			var_201_0[arg_202_0] = arg_203_0

			arg_202_2()
		end, var_202_0)

		table.insert(arg_201_0.mapGroup, var_202_2)
		arg_201_0:updateCouldAnimator(arg_202_1.Animator, arg_202_0)
	end, function()
		for iter_204_0, iter_204_1 in ipairs(arg_201_0.mapTFs) do
			setImageSprite(iter_204_1, var_201_0[iter_204_0])
			setActive(iter_204_1, arg_201_1[iter_204_0])
			SetCompomentEnabled(iter_204_1, typeof(Image), true)
		end

		existCall(arg_201_2)
	end)
end

local var_0_7 = {
	1520001,
	1520002,
	1520011,
	1520012
}
local var_0_8 = {
	{
		1420008,
		"map_1420008",
		1420021,
		"map_1420001"
	},
	{
		1420018,
		"map_1420018",
		1420031,
		"map_1420011"
	}
}
local var_0_9 = {
	1420001,
	1420011
}

function var_0_0.ClearMapTransitions(arg_205_0)
	if not arg_205_0.mapTransitions then
		return
	end

	for iter_205_0, iter_205_1 in pairs(arg_205_0.mapTransitions) do
		if iter_205_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_205_0, iter_205_0, iter_205_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_205_0, iter_205_0)
		end
	end

	arg_205_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_206_0, arg_206_1, arg_206_2, arg_206_3)
	local var_206_0, var_206_1, var_206_2 = arg_206_0:GetMapBG(arg_206_1, arg_206_2)
	local var_206_3 = {}

	if var_206_1 then
		table.insert(var_206_3, function(arg_207_0)
			arg_206_0:PlayMapTransition("LevelMapTransition_" .. var_206_1, var_206_2, arg_207_0)
		end)
	end

	seriesAsync(var_206_3, function()
		arg_206_0:SwitchBGMapType(arg_206_1:getConfig("pos_type"))
		arg_206_0:SwitchBG(var_206_0, nil, arg_206_3)
	end)
end

function var_0_0.SwitchBGMapType(arg_209_0, arg_209_1)
	if arg_209_0.posType == arg_209_1 then
		return
	end

	for iter_209_0, iter_209_1 in ipairs({
		arg_209_0.map,
		arg_209_0.float
	}) do
		local var_209_0 = GetOrAddComponent(iter_209_1, typeof(AspectRatioFitter))

		var_209_0.aspectRatio = 1.7777777777777777
		var_209_0.enabled = arg_209_1 == 0

		if arg_209_1 == 1 then
			iter_209_1.anchorMin = Vector2(0.5, 0.5)
			iter_209_1.anchorMax = Vector2(0.5, 0.5)

			setSizeDelta(var_209_0, {
				x = 2520,
				y = 1440
			})
		end
	end
end

function var_0_0.GetMapBG(arg_210_0, arg_210_1, arg_210_2)
	if not table.contains(var_0_7, arg_210_1.id) then
		return {
			arg_210_0:GetMapElement(arg_210_1)
		}
	end

	local var_210_0 = arg_210_1.id
	local var_210_1 = table.indexof(var_0_7, var_210_0) - 1
	local var_210_2 = bit.lshift(bit.rshift(var_210_1, 1), 1) + 1
	local var_210_3 = {
		var_0_7[var_210_2],
		var_0_7[var_210_2 + 1]
	}
	local var_210_4 = _.map(var_210_3, function(arg_211_0)
		return getProxy(ChapterProxy):getMapById(arg_211_0)
	end)

	if _.all(var_210_4, function(arg_212_0)
		return arg_212_0:isAllChaptersClear()
	end) then
		local var_210_5 = {
			arg_210_0:GetMapElement(arg_210_1)
		}

		if not arg_210_2 or math.abs(var_210_0 - arg_210_2) ~= 1 then
			return var_210_5
		end

		local var_210_6 = var_0_9[bit.rshift(var_210_2 - 1, 1) + 1]
		local var_210_7 = bit.band(var_210_1, 1) == 1

		return var_210_5, var_210_6, var_210_7
	else
		local var_210_8 = 0

		;(function()
			local var_213_0 = var_210_4[1]:getChapters()

			for iter_213_0, iter_213_1 in ipairs(var_213_0) do
				if not iter_213_1:isClear() then
					return
				end

				var_210_8 = var_210_8 + 1
			end

			if not var_210_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_210_8 = var_210_8 + 1

			local var_213_1 = var_210_4[2]:getChapters()

			for iter_213_2, iter_213_3 in ipairs(var_213_1) do
				if not iter_213_3:isClear() then
					return
				end

				var_210_8 = var_210_8 + 1
			end
		end)()

		local var_210_9

		if var_210_8 > 0 then
			local var_210_10 = var_0_8[bit.rshift(var_210_2 - 1, 1) + 1]

			var_210_9 = {
				{
					BG = "map_" .. var_210_10[1],
					Animator = var_210_10[2]
				},
				{
					BG = "map_" .. var_210_10[3] + var_210_8,
					Animator = var_210_10[4]
				}
			}
		else
			var_210_9 = {
				arg_210_0:GetMapElement(arg_210_1)
			}
		end

		return var_210_9
	end
end

function var_0_0.GetMapElement(arg_214_0, arg_214_1)
	local var_214_0 = arg_214_1:getConfig("bg")
	local var_214_1 = arg_214_1:getConfig("ani_controller")

	if var_214_1 and #var_214_1 > 0 then
		(function()
			local var_215_0 = getProxy(ChapterProxy)

			for iter_215_0, iter_215_1 in ipairs(var_214_1) do
				local var_215_1 = _.rest(iter_215_1[2], 2)

				for iter_215_2, iter_215_3 in ipairs(var_215_1) do
					if string.find(iter_215_3, "^map_") and iter_215_1[1] == var_0_3 then
						local var_215_2 = iter_215_1[2][1]
						local var_215_3 = false

						for iter_215_4, iter_215_5 in ipairs(var_215_2) do
							local var_215_4 = var_215_0:GetChapterItemById(iter_215_5)

							if var_215_4 and var_215_4:isClear() then
								var_215_3 = true

								break
							end
						end

						if not var_215_3 then
							var_214_0 = iter_215_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_214_2 = {
		BG = var_214_0
	}

	var_214_2.Animator, var_214_2.AnimatorController = arg_214_0:GetMapAnimator(arg_214_1)

	return var_214_2
end

function var_0_0.GetMapAnimator(arg_216_0, arg_216_1)
	local var_216_0 = arg_216_1:getConfig("ani_name")

	if arg_216_1:getConfig("animtor") == 1 and var_216_0 and #var_216_0 > 0 then
		local var_216_1 = arg_216_1:getConfig("ani_controller")

		if var_216_1 and #var_216_1 > 0 then
			(function()
				local var_217_0 = getProxy(ChapterProxy)

				for iter_217_0, iter_217_1 in ipairs(var_216_1) do
					local var_217_1 = _.rest(iter_217_1[2], 2)

					for iter_217_2, iter_217_3 in ipairs(var_217_1) do
						if string.find(iter_217_3, "^effect_") and iter_217_1[1] == var_0_3 then
							local var_217_2 = iter_217_1[2][1]
							local var_217_3 = false

							for iter_217_4, iter_217_5 in ipairs(var_217_2) do
								local var_217_4 = var_217_0:GetChapterItemById(iter_217_5)

								if var_217_4 and var_217_4:isClear() then
									var_217_3 = true

									break
								end
							end

							if not var_217_3 then
								var_216_0 = "map_" .. string.sub(iter_217_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_216_0, var_216_1
	end
end

function var_0_0.PlayMapTransition(arg_218_0, arg_218_1, arg_218_2, arg_218_3, arg_218_4)
	arg_218_0.mapTransitions = arg_218_0.mapTransitions or {}

	local var_218_0

	local function var_218_1()
		arg_218_0:frozen()
		existCall(arg_218_3, var_218_0)
		var_218_0:SetActive(true)

		local var_219_0 = tf(var_218_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_219_0)
		var_218_0:GetComponent(typeof(Animator)):Play(arg_218_2 and "Sequence" or "Inverted", -1, 0)
		var_219_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_220_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_219_0, arg_218_0._tf)
			existCall(arg_218_4, var_218_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_218_1, arg_218_1, var_218_0)

			arg_218_0.mapTransitions[arg_218_1] = false

			arg_218_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_218_1, arg_218_1, true, function(arg_221_0)
		var_218_0 = arg_221_0
		arg_218_0.mapTransitions[arg_218_1] = arg_221_0

		var_218_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_222_0)
	if arg_222_0.levelStageView then
		arg_222_0.levelStageView:Destroy()

		arg_222_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_223_0, arg_223_1)
	arg_223_0.levelAmbushView = LevelAmbushView.New(arg_223_0.topPanel, arg_223_0.event, arg_223_0.contextData)

	arg_223_0.levelAmbushView:Load()
	arg_223_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_223_1)
end

function var_0_0.hideAmbushInfo(arg_224_0)
	if arg_224_0.levelAmbushView then
		arg_224_0.levelAmbushView:Destroy()

		arg_224_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_225_0, arg_225_1)
	arg_225_0:frozen()

	local function var_225_0()
		arg_225_0.ambushWarning:SetActive(true)

		local var_226_0 = tf(arg_225_0.ambushWarning)

		var_226_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_226_0:SetSiblingIndex(1)

		local var_226_1 = var_226_0:GetComponent("DftAniEvent")

		var_226_1:SetTriggerEvent(function(arg_227_0)
			arg_225_1()
		end)
		var_226_1:SetEndEvent(function(arg_228_0)
			arg_225_0.ambushWarning:SetActive(false)
			arg_225_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_225_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_230_0)
			arg_230_0:SetActive(true)

			arg_225_0.ambushWarning = arg_230_0

			var_225_0()
		end)
	else
		var_225_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_231_0)
	if arg_231_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_231_0.ambushWarning)

		arg_231_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_232_0, arg_232_1)
	arg_232_0.levelStrategyView = LevelStrategyView.New(arg_232_0.topPanel, arg_232_0.event, arg_232_0.contextData)

	arg_232_0.levelStrategyView:Load()
	arg_232_0.levelStrategyView:ActionInvoke("set", arg_232_1)

	local function var_232_0()
		local var_233_0 = arg_232_0.contextData.chapterVO.fleet
		local var_233_1 = pg.strategy_data_template[arg_232_1.id]

		if not var_233_0:canUseStrategy(arg_232_1) then
			return
		end

		local var_233_2 = var_233_0:getNextStgUser(arg_232_1.id)

		if var_233_1.type == ChapterConst.StgTypeForm then
			arg_232_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_233_2,
				arg1 = arg_232_1.id
			})
		elseif var_233_1.type == ChapterConst.StgTypeConsume then
			arg_232_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_233_2,
				arg1 = arg_232_1.id
			})
		end

		arg_232_0:hideStrategyInfo()
	end

	local function var_232_1()
		arg_232_0:hideStrategyInfo()
	end

	arg_232_0.levelStrategyView:ActionInvoke("setCBFunc", var_232_0, var_232_1)
end

function var_0_0.hideStrategyInfo(arg_235_0)
	if arg_235_0.levelStrategyView then
		arg_235_0.levelStrategyView:Destroy()

		arg_235_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_236_0, arg_236_1)
	local var_236_0 = arg_236_0.contextData.chapterVO
	local var_236_1 = getProxy(ChapterProxy)
	local var_236_2
	local var_236_3
	local var_236_4
	local var_236_5
	local var_236_6 = var_236_1.repairTimes
	local var_236_7, var_236_8, var_236_9 = ChapterConst.GetRepairParams()

	arg_236_0.levelRepairView = LevelRepairView.New(arg_236_0.topPanel, arg_236_0.event, arg_236_0.contextData)

	arg_236_0.levelRepairView:Load()
	arg_236_0.levelRepairView:ActionInvoke("set", var_236_6, var_236_7, var_236_8, var_236_9)

	local function var_236_10()
		if var_236_7 - math.min(var_236_6, var_236_7) == 0 and arg_236_0.player:getTotalGem() < var_236_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_236_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_236_0.fleet.id,
			arg1 = arg_236_1.id
		})
		arg_236_0:hideRepairWindow()
	end

	local function var_236_11()
		arg_236_0:hideRepairWindow()
	end

	arg_236_0.levelRepairView:ActionInvoke("setCBFunc", var_236_10, var_236_11)
end

function var_0_0.hideRepairWindow(arg_239_0)
	if arg_239_0.levelRepairView then
		arg_239_0.levelRepairView:Destroy()

		arg_239_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_240_0, arg_240_1)
	arg_240_0.levelRemasterView:Load()

	local function var_240_0(arg_241_0)
		arg_240_0:ShowSelectedMap(arg_241_0)
	end

	arg_240_0.levelRemasterView:ActionInvoke("Show")
	arg_240_0.levelRemasterView:ActionInvoke("set", var_240_0, arg_240_1)
end

function var_0_0.hideRemasterPanel(arg_242_0)
	if arg_242_0.levelRemasterView:isShowing() then
		arg_242_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_243_0, arg_243_1)
	local var_243_0 = arg_243_0.contextData.chapterVO

	if not var_243_0 then
		return
	end

	arg_243_0:enableLevelCamera()
	setActive(arg_243_0.uiMain, true)

	arg_243_0.levelGrid.localEulerAngles = Vector3(var_243_0.theme.angle, 0, 0)
	arg_243_0.grid = LevelGrid.New(arg_243_0.dragLayer)

	arg_243_0.grid:attach(arg_243_0)
	arg_243_0.grid:ExtendItem("shipTpl", arg_243_0.shipTpl)
	arg_243_0.grid:ExtendItem("subTpl", arg_243_0.subTpl)
	arg_243_0.grid:ExtendItem("transportTpl", arg_243_0.transportTpl)
	arg_243_0.grid:ExtendItem("enemyTpl", arg_243_0.enemyTpl)
	arg_243_0.grid:ExtendItem("championTpl", arg_243_0.championTpl)
	arg_243_0.grid:ExtendItem("oniTpl", arg_243_0.oniTpl)
	arg_243_0.grid:ExtendItem("arrowTpl", arg_243_0.arrowTarget)
	arg_243_0.grid:ExtendItem("destinationMarkTpl", arg_243_0.destinationMarkTpl)

	function arg_243_0.grid.onShipStepChange(arg_244_0)
		arg_243_0.levelStageView:updateAmbushRate(arg_244_0)
	end

	arg_243_0.grid:initAll(arg_243_1)
end

function var_0_0.destroyGrid(arg_245_0)
	if arg_245_0.grid then
		arg_245_0.grid:detach()

		arg_245_0.grid = nil

		arg_245_0:disableLevelCamera()
		setActive(arg_245_0.dragLayer, true)
		setActive(arg_245_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_246_0, arg_246_1)
	arg_246_0:frozen()

	local function var_246_0()
		arg_246_0.radar:SetActive(true)

		local var_247_0 = tf(arg_246_0.radar)

		var_247_0:SetParent(arg_246_0.topPanel, false)
		var_247_0:SetSiblingIndex(1)
		var_247_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_248_0)
			arg_246_0.radar:SetActive(false)
			arg_246_0:unfrozen()
			arg_246_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_246_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_249_0)
			arg_249_0:SetActive(true)

			arg_246_0.radar = arg_249_0

			var_246_0()
		end)
	else
		var_246_0()
	end
end

function var_0_0.destroyTracking(arg_250_0)
	if arg_250_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_250_0.radar)

		arg_250_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_251_0, arg_251_1, arg_251_2, arg_251_3)
	local function var_251_0()
		arg_251_0.playing = true

		arg_251_0:frozen()
		arg_251_0.airStrike:SetActive(true)

		local var_252_0 = tf(arg_251_0.airStrike)

		var_252_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_252_0:SetAsLastSibling()
		setActive(var_252_0:Find("words/be_striked"), arg_251_1 == ChapterConst.SubjectChampion)
		setActive(var_252_0:Find("words/strike_enemy"), arg_251_1 == ChapterConst.SubjectPlayer)

		local function var_252_1()
			arg_251_0.playing = false

			SetActive(arg_251_0.airStrike, false)

			if arg_251_3 then
				arg_251_3()
			end

			arg_251_0:unfrozen()
		end

		var_252_0:GetComponent("DftAniEvent"):SetEndEvent(var_252_1)

		if arg_251_2 then
			onButton(arg_251_0, var_252_0, var_252_1, SFX_PANEL)
		else
			removeOnButton(var_252_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_251_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_254_0)
			arg_254_0:SetActive(true)

			arg_251_0.airStrike = arg_254_0

			var_251_0()
		end)
	else
		var_251_0()
	end
end

function var_0_0.destroyAirStrike(arg_255_0)
	if arg_255_0.airStrike then
		arg_255_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_255_0.airStrike)

		arg_255_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_256_0, arg_256_1, arg_256_2, arg_256_3)
	arg_256_0.uiAnims = arg_256_0.uiAnims or {}

	local var_256_0 = arg_256_0.uiAnims[arg_256_1]

	local function var_256_1()
		arg_256_0.playing = true

		arg_256_0:frozen()
		var_256_0:SetActive(true)

		local var_257_0 = tf(var_256_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_257_0)

		if arg_256_3 then
			arg_256_3(var_256_0)
		end

		var_257_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_258_0)
			arg_256_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_257_0, arg_256_0._tf)

			if arg_256_2 then
				arg_256_2(var_256_0)
			end

			arg_256_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_256_0 then
		PoolMgr.GetInstance():GetUI(arg_256_1, true, function(arg_259_0)
			arg_259_0:SetActive(true)

			arg_256_0.uiAnims[arg_256_1] = arg_259_0
			var_256_0 = arg_256_0.uiAnims[arg_256_1]

			var_256_1()
		end)
	else
		var_256_1()
	end
end

function var_0_0.destroyUIAnims(arg_260_0)
	if arg_260_0.uiAnims then
		for iter_260_0, iter_260_1 in pairs(arg_260_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_260_1), arg_260_0._tf)
			iter_260_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_260_0, iter_260_1)
		end

		arg_260_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_261_0, arg_261_1)
	local function var_261_0()
		arg_261_0.playing = true

		arg_261_0:frozen()
		arg_261_0.torpetoAni:SetActive(true)

		local var_262_0 = tf(arg_261_0.torpetoAni)

		var_262_0:SetParent(arg_261_0.topPanel, false)
		var_262_0:SetAsLastSibling()
		var_262_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_263_0)
			arg_261_0.playing = false

			SetActive(arg_261_0.torpetoAni, false)

			if arg_261_1 then
				arg_261_1()
			end

			arg_261_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_261_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_264_0)
			arg_264_0:SetActive(true)

			arg_261_0.torpetoAni = arg_264_0

			var_261_0()
		end)
	else
		var_261_0()
	end
end

function var_0_0.destroyTorpedo(arg_265_0)
	if arg_265_0.torpetoAni then
		arg_265_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_265_0.torpetoAni)

		arg_265_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_266_0, arg_266_1, arg_266_2, arg_266_3)
	arg_266_0.strikeAnims = arg_266_0.strikeAnims or {}

	local var_266_0
	local var_266_1
	local var_266_2

	local function var_266_3()
		if coroutine.status(var_266_2) == "suspended" then
			local var_267_0, var_267_1 = coroutine.resume(var_266_2)

			assert(var_267_0, debug.traceback(var_266_2, var_267_1))
		end
	end

	var_266_2 = coroutine.create(function()
		arg_266_0.playing = true

		arg_266_0:frozen()

		local var_268_0 = arg_266_0.strikeAnims[arg_266_2]

		setActive(var_268_0, true)

		local var_268_1 = tf(var_268_0)
		local var_268_2 = findTF(var_268_1, "torpedo")
		local var_268_3 = findTF(var_268_1, "mask/painting")
		local var_268_4 = findTF(var_268_1, "ship")

		setParent(var_266_0, var_268_3:Find("fitter"), false)
		var_266_1:SetParent(var_268_4)
		setActive(var_268_4, false)
		setActive(var_268_2, false)
		var_268_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_268_1:SetAsLastSibling()

		local var_268_5 = var_268_1:GetComponent("DftAniEvent")
		local var_268_6 = var_266_1:GetSkeletonGraphic()

		var_268_5:SetStartEvent(function(arg_269_0)
			var_266_1:SetAction("attack", 0)

			var_268_6.freeze = true
		end)
		var_268_5:SetTriggerEvent(function(arg_270_0)
			var_268_6.freeze = false

			var_266_1:SetActionCallBack(function(arg_271_0)
				if arg_271_0 == "action" then
					-- block empty
				elseif arg_271_0 == "finish" then
					var_268_6.freeze = true
				end
			end)
		end)
		var_268_5:SetEndEvent(function(arg_272_0)
			var_268_6.freeze = false

			var_266_3()
		end)
		onButton(arg_266_0, var_268_1, var_266_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_268_3, arg_266_1:getPainting())
		var_266_1:SetActionCallBack(nil)

		var_268_6.freeze = false

		var_266_1:Dispose()
		setActive(var_268_0, false)

		arg_266_0.playing = false

		arg_266_0:unfrozen()

		if arg_266_3 then
			arg_266_3()
		end
	end)

	local function var_266_4()
		if arg_266_0.strikeAnims[arg_266_2] and var_266_0 and var_266_1 then
			var_266_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_266_1:getPainting(), true, function(arg_274_0)
		var_266_0 = arg_274_0

		ShipExpressionHelper.SetExpression(var_266_0, arg_266_1:getPainting())
		var_266_4()
	end)

	var_266_1 = SpineAnimChar.New()

	var_266_1:SetPaint(arg_266_1:getPrefab())
	var_266_1:Load(true, function(arg_275_0)
		var_266_1:SetLocalScale(Vector3.one)
		var_266_4()
	end)

	if not arg_266_0.strikeAnims[arg_266_2] then
		PoolMgr.GetInstance():GetUI(arg_266_2, true, function(arg_276_0)
			arg_266_0.strikeAnims[arg_266_2] = arg_276_0

			var_266_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_277_0)
	if arg_277_0.strikeAnims then
		for iter_277_0, iter_277_1 in pairs(arg_277_0.strikeAnims) do
			iter_277_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_277_0, iter_277_1)
		end

		arg_277_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_278_0, arg_278_1, arg_278_2, arg_278_3)
	arg_278_0.strikeAnims = arg_278_0.strikeAnims or {}

	local var_278_0
	local var_278_1

	local function var_278_2()
		if coroutine.status(var_278_1) == "suspended" then
			local var_279_0, var_279_1 = coroutine.resume(var_278_1)

			assert(var_279_0, debug.traceback(var_278_1, var_279_1))
		end
	end

	var_278_1 = coroutine.create(function()
		arg_278_0.playing = true

		arg_278_0:frozen()

		local var_280_0 = arg_278_0.strikeAnims[arg_278_2]

		setActive(var_280_0, true)

		local var_280_1 = tf(var_280_0)
		local var_280_2 = findTF(var_280_1, "torpedo")
		local var_280_3 = findTF(var_280_1, "ship")

		var_278_0:SetParent(var_280_3)
		setActive(var_280_3, false)
		setActive(var_280_2, false)
		var_280_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_280_1:SetAsLastSibling()

		local var_280_4 = var_280_1:GetComponent("DftAniEvent")
		local var_280_5 = var_278_0:GetSkeletonGraphic()

		var_280_4:SetStartEvent(function(arg_281_0)
			var_278_0:SetAction("attack", 0)

			var_280_5.freeze = true
		end)
		var_280_4:SetTriggerEvent(function(arg_282_0)
			var_280_5.freeze = false

			var_278_0:SetActionCallBack(function(arg_283_0)
				if arg_283_0 == "action" then
					-- block empty
				elseif arg_283_0 == "finish" then
					var_280_5.freeze = true
				end
			end)
		end)
		var_280_4:SetEndEvent(function(arg_284_0)
			var_280_5.freeze = false

			var_278_2()
		end)
		onButton(arg_278_0, var_280_1, var_278_2, SFX_CANCEL)
		coroutine.yield()
		var_278_0:SetActionCallBack(nil)

		var_280_5.freeze = false

		var_278_0:Dispose()
		setActive(var_280_0, false)

		arg_278_0.playing = false

		arg_278_0:unfrozen()

		if arg_278_3 then
			arg_278_3()
		end
	end)

	local function var_278_3()
		if arg_278_0.strikeAnims[arg_278_2] and var_278_0 then
			var_278_2()
		end
	end

	var_278_0 = SpineAnimChar.New()

	var_278_0:SetPaint(arg_278_1:getPrefab())
	var_278_0:Load(true, function(arg_286_0)
		arg_286_0:SetLocalScale(Vector3.one)
		var_278_3()
	end)

	if not arg_278_0.strikeAnims[arg_278_2] then
		PoolMgr.GetInstance():GetUI(arg_278_2, true, function(arg_287_0)
			arg_278_0.strikeAnims[arg_278_2] = arg_287_0

			var_278_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_288_0, arg_288_1, arg_288_2)
	arg_288_0:frozen()
	setActive(arg_288_0.commanderTinkle, true)

	local var_288_0 = arg_288_1:getSkills()

	setText(arg_288_0.commanderTinkle:Find("name"), #var_288_0 > 0 and var_288_0[1]:getConfig("name") or "")
	setImageSprite(arg_288_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_288_1:getConfig("painting"), ""))

	local var_288_1 = arg_288_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_288_1.alpha = 0

	local var_288_2 = Vector2(248, 237)

	LeanTween.value(go(arg_288_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_289_0)
		local var_289_0 = arg_288_0.commanderTinkle.localPosition

		var_289_0.x = var_288_2.x + -100 * (1 - arg_289_0)
		arg_288_0.commanderTinkle.localPosition = var_289_0
		var_288_1.alpha = arg_289_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_288_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_290_0)
		local var_290_0 = arg_288_0.commanderTinkle.localPosition

		var_290_0.x = var_288_2.x + 100 * arg_290_0
		arg_288_0.commanderTinkle.localPosition = var_290_0
		var_288_1.alpha = 1 - arg_290_0
	end)):setOnComplete(System.Action(function()
		if arg_288_2 then
			arg_288_2()
		end

		arg_288_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_292_0, arg_292_1, arg_292_2, arg_292_3)
	local var_292_0 = arg_292_0.grid:shakeCell(arg_292_1)

	if not var_292_0 then
		arg_292_3()

		return
	end

	arg_292_0:easeDamage(var_292_0, arg_292_2, function()
		arg_292_3()
	end)
end

function var_0_0.easeDamage(arg_294_0, arg_294_1, arg_294_2, arg_294_3)
	arg_294_0:frozen()

	local var_294_0 = arg_294_0.levelCam:WorldToScreenPoint(arg_294_1.position)
	local var_294_1 = tf(arg_294_0:GetDamageText())

	var_294_1.position = arg_294_0.uiCam:ScreenToWorldPoint(var_294_0)

	local var_294_2 = var_294_1.localPosition

	var_294_2.y = var_294_2.y + 40
	var_294_2.z = 0

	setText(var_294_1, arg_294_2)

	var_294_1.localPosition = var_294_2

	LeanTween.value(go(var_294_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_295_0)
		local var_295_0 = var_294_1.localPosition

		var_295_0.y = var_294_2.y + 60 * arg_295_0
		var_294_1.localPosition = var_295_0

		setTextAlpha(var_294_1, 1 - arg_295_0)
	end)):setOnComplete(System.Action(function()
		arg_294_0:ReturnDamageText(var_294_1)
		arg_294_0:unfrozen()

		if arg_294_3 then
			arg_294_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_297_0, arg_297_1, arg_297_2)
	arg_297_0:frozen()

	local var_297_0 = arg_297_0.levelCam:WorldToScreenPoint(arg_297_1)

	arg_297_0.avoidText.position = arg_297_0.uiCam:ScreenToWorldPoint(var_297_0)

	local var_297_1 = arg_297_0.avoidText.localPosition

	var_297_1.z = 0
	arg_297_0.avoidText.localPosition = var_297_1

	setActive(arg_297_0.avoidText, true)

	local var_297_2 = arg_297_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_297_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_298_0)
		local var_298_0 = arg_297_0.avoidText.localPosition

		var_298_0.y = var_297_1.y + 100 * arg_298_0
		arg_297_0.avoidText.localPosition = var_298_0

		setImageAlpha(arg_297_0.avoidText, 1 - arg_298_0)
		setImageAlpha(var_297_2, 1 - arg_298_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_297_0.avoidText, false)
		arg_297_0:unfrozen()

		if arg_297_2 then
			arg_297_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_300_0)
	local var_300_0 = table.remove(arg_300_0.damageTextPool)

	if not var_300_0 then
		var_300_0 = Instantiate(arg_300_0.damageTextTemplate)

		local var_300_1 = tf(arg_300_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_300_0, tf(arg_300_0.damageTextTemplate).parent)
		tf(var_300_0):SetSiblingIndex(var_300_1 + 1)
	end

	table.insert(arg_300_0.damageTextActive, var_300_0)
	setActive(var_300_0, true)

	return var_300_0
end

function var_0_0.ReturnDamageText(arg_301_0, arg_301_1)
	assert(arg_301_1)

	if not arg_301_1 then
		return
	end

	arg_301_1 = go(arg_301_1)

	table.removebyvalue(arg_301_0.damageTextActive, arg_301_1)
	table.insert(arg_301_0.damageTextPool, arg_301_1)
	setActive(arg_301_1, false)
end

function var_0_0.resetLevelGrid(arg_302_0)
	arg_302_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_303_0, arg_303_1)
	setActive(arg_303_0.curtain, arg_303_1)
end

function var_0_0.frozen(arg_304_0)
	local var_304_0 = arg_304_0.frozenCount

	arg_304_0.frozenCount = arg_304_0.frozenCount + 1
	arg_304_0.canvasGroup.blocksRaycasts = arg_304_0.frozenCount == 0

	if var_304_0 == 0 and arg_304_0.frozenCount ~= 0 then
		arg_304_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_305_0, arg_305_1)
	if arg_305_0.exited then
		return
	end

	local var_305_0 = arg_305_0.frozenCount
	local var_305_1 = arg_305_1 == -1 and arg_305_0.frozenCount or arg_305_1 or 1

	arg_305_0.frozenCount = arg_305_0.frozenCount - var_305_1
	arg_305_0.canvasGroup.blocksRaycasts = arg_305_0.frozenCount == 0

	if var_305_0 ~= 0 and arg_305_0.frozenCount == 0 then
		arg_305_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_306_0)
	return arg_306_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_307_0)
	arg_307_0.levelCamIndices = math.max(arg_307_0.levelCamIndices - 1, 0)

	if arg_307_0.levelCamIndices == 0 then
		arg_307_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.disableLevelCamera(arg_308_0)
	arg_308_0.levelCamIndices = arg_308_0.levelCamIndices + 1

	if arg_308_0.levelCamIndices > 0 then
		arg_308_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.RecordTween(arg_309_0, arg_309_1, arg_309_2)
	arg_309_0.tweens[arg_309_1] = arg_309_2
end

function var_0_0.DeleteTween(arg_310_0, arg_310_1)
	local var_310_0 = arg_310_0.tweens[arg_310_1]

	if var_310_0 then
		LeanTween.cancel(var_310_0)

		arg_310_0.tweens[arg_310_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_311_0, arg_311_1, arg_311_2, arg_311_3)
	local var_311_0 = arg_311_2.id

	arg_311_0.levelCMDFormationView:setCallback(function(arg_312_0)
		if not arg_311_3 then
			if arg_312_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_311_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_312_0.skill)
			elseif arg_312_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_311_0.contextData.commanderSelected = {
					chapterId = var_311_0,
					fleetId = arg_311_1.id
				}

				arg_311_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_312_0.pos, arg_311_1.id, arg_311_2)
				arg_311_0:closeCommanderPanel()
			else
				arg_311_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_312_0,
					fleetId = arg_311_1.id,
					chapterId = var_311_0
				}, arg_311_2)
			end
		elseif arg_312_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_311_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_312_0.skill)
		elseif arg_312_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_311_0.contextData.eliteCommanderSelected = {
				index = arg_311_3,
				pos = arg_312_0.pos,
				chapterId = var_311_0
			}

			arg_311_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_311_3, arg_312_0.pos, arg_311_2)
			arg_311_0:closeCommanderPanel()
		else
			arg_311_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_312_0,
				index = arg_311_3,
				chapterId = var_311_0
			}, arg_311_2)
		end
	end)
	arg_311_0.levelCMDFormationView:Load()
	arg_311_0.levelCMDFormationView:ActionInvoke("update", arg_311_1, arg_311_0.commanderPrefabs)
	arg_311_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_313_0)
	if arg_313_0.levelCMDFormationView:isShowing() then
		arg_313_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_313_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_314_0)
	arg_314_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_315_0)
	arg_315_0.levelCMDFormationView:Destroy()

	arg_315_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_316_0, arg_316_1)
	arg_316_0.spTickets = arg_316_1
end

function var_0_0.HandleShowMsgBox(arg_317_0, arg_317_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_317_1)
end

function var_0_0.updatePoisonAreaTip(arg_318_0)
	local var_318_0 = arg_318_0.contextData.chapterVO
	local var_318_1 = (function(arg_319_0)
		local var_319_0 = {}
		local var_319_1 = pg.map_event_list[var_318_0.id] or {}
		local var_319_2

		if var_318_0:isLoop() then
			var_319_2 = var_319_1.event_list_loop or {}
		else
			var_319_2 = var_319_1.event_list or {}
		end

		for iter_319_0, iter_319_1 in ipairs(var_319_2) do
			local var_319_3 = pg.map_event_template[iter_319_1]

			if var_319_3.c_type == arg_319_0 then
				table.insert(var_319_0, var_319_3)
			end
		end

		return var_319_0
	end)(ChapterConst.EvtType_Poison)

	if var_318_1 then
		for iter_318_0, iter_318_1 in ipairs(var_318_1) do
			local var_318_2 = iter_318_1.round_gametip

			if var_318_2 ~= nil and var_318_2 ~= "" and var_318_0:getRoundNum() == var_318_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_318_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_320_0)
	setActive(arg_320_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_321_0)
	local var_321_0 = getProxy(ChapterProxy)

	if var_321_0 and not arg_321_0.contextData.noRecord then
		local var_321_1 = arg_321_0.contextData.map

		if not var_321_1 then
			return
		end

		if var_321_1:NeedRecordMap() then
			var_321_0:recordLastMap(ChapterProxy.LAST_MAP, var_321_1.id)
		end

		if var_321_1:isActivity() and not var_321_1:isActExtra() then
			var_321_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, var_321_1.id)
		end
	end
end

function var_0_0.IsActShopActive(arg_322_0)
	local var_322_0 = arg_322_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_322_0.contextData.map:getConfig("on_activity")) or nil
	local var_322_1 = var_322_0 and not var_322_0:isEnd() and var_322_0:GetConfigClientSetting("PTID")
	local var_322_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_322_2 and not var_322_2:isEnd() and var_322_2:getConfig("config_client").resId == var_322_1 then
		return true
	end

	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_323_0)
		return not arg_323_0:isEnd() and arg_323_0:getConfig("config_client").pt_id == var_322_1
	end) then
		return true
	end
end

function var_0_0.OnStartChapterAuto(arg_324_0, arg_324_1)
	if arg_324_0.levelInfoView:isShowing() then
		arg_324_0:hideChapterPanel()
	end

	if arg_324_0.levelInfoSPView and arg_324_0.levelInfoSPView:isShowing() then
		arg_324_0:HideLevelInfoSPPanel()
	end
end

function var_0_0.OnEndChapterAuto(arg_325_0, arg_325_1)
	return
end

function var_0_0.OnAddChapterAutoTimeDone(arg_326_0)
	if arg_326_0.levelInfoView:isShowing() then
		arg_326_0.levelInfoView:RefreshChapterAutoPanel()
	end

	if arg_326_0.levelInfoSPView and arg_326_0.levelInfoSPView:isShowing() then
		arg_326_0.levelInfoView:RefreshChapterAutoPanel()
	end
end

function var_0_0.ShowChapterAutoDetailPanel(arg_327_0, arg_327_1)
	arg_327_0.chapterAutoDetailPanel:Load()
	arg_327_0.chapterAutoDetailPanel:ActionInvoke("Enter", arg_327_1)
end

function var_0_0.HideChapterAutoDetailPanel(arg_328_0)
	if arg_328_0.chapterAutoDetailPanel:isShowing() then
		arg_328_0.chapterAutoDetailPanel:Hide()
	end
end

function var_0_0.DestroyChapterAutoDetailPanel(arg_329_0)
	if arg_329_0.chapterAutoDetailPanel then
		arg_329_0.chapterAutoDetailPanel:Destroy()

		arg_329_0.chapterAutoDetailPanel = nil
	end
end

function var_0_0.willExit(arg_330_0)
	arg_330_0:ClearMapTransitions()
	arg_330_0.loader:Clear()

	if arg_330_0.contextData.chapterVO then
		arg_330_0:UnOverlayPanel(arg_330_0.topPanel, arg_330_0._tf)
	end

	if arg_330_0.levelFleetView and arg_330_0.levelFleetView.selectIds then
		arg_330_0.contextData.selectedFleetIDs = {}

		for iter_330_0, iter_330_1 in pairs(arg_330_0.levelFleetView.selectIds) do
			for iter_330_2, iter_330_3 in pairs(iter_330_1) do
				arg_330_0.contextData.selectedFleetIDs[#arg_330_0.contextData.selectedFleetIDs + 1] = iter_330_3
			end
		end
	end

	arg_330_0:destroyChapterPanel()
	arg_330_0:DestroyLevelInfoSPPanel()
	arg_330_0:destroyFleetEdit()
	arg_330_0:destroyCommanderPanel()
	arg_330_0:DestroyLevelStageView()
	arg_330_0:hideRepairWindow()
	arg_330_0:hideStrategyInfo()
	arg_330_0:hideRemasterPanel()
	arg_330_0:hideSpResult()
	arg_330_0:destroyGrid()
	arg_330_0:destroyAmbushWarn()
	arg_330_0:destroyAirStrike()
	arg_330_0:destroyTorpedo()
	arg_330_0:destroyStrikeAnim()
	arg_330_0:destroyTracking()
	arg_330_0:destroyUIAnims()
	arg_330_0:DestroyChapterAutoDetailPanel()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_330_4, iter_330_5 in pairs(arg_330_0.mbDict) do
		iter_330_5:Destroy()
	end

	arg_330_0.mbDict = nil

	for iter_330_6, iter_330_7 in pairs(arg_330_0.tweens) do
		LeanTween.cancel(iter_330_7)
	end

	arg_330_0.tweens = nil

	if arg_330_0.cloudTimer then
		_.each(arg_330_0.cloudTimer, function(arg_331_0)
			LeanTween.cancel(arg_331_0)
		end)

		arg_330_0.cloudTimer = nil
	end

	if arg_330_0.newChapterCDTimer then
		arg_330_0.newChapterCDTimer:Stop()

		arg_330_0.newChapterCDTimer = nil
	end

	for iter_330_8, iter_330_9 in ipairs(arg_330_0.damageTextActive) do
		LeanTween.cancel(iter_330_9)
	end

	LeanTween.cancel(go(arg_330_0.avoidText))

	arg_330_0.map.localScale = Vector3.one
	arg_330_0.map.pivot = Vector2(0.5, 0.5)
	arg_330_0.float.localScale = Vector3.one
	arg_330_0.float.pivot = Vector2(0.5, 0.5)

	for iter_330_10, iter_330_11 in ipairs(arg_330_0.mapTFs) do
		clearImageSprite(iter_330_11)
	end

	_.each(arg_330_0.cloudRTFs, function(arg_332_0)
		clearImageSprite(arg_332_0)
	end)
	Destroy(arg_330_0.enemyTpl)
	arg_330_0:RecordLastMapOnExit()
	arg_330_0.levelRemasterView:Destroy()
end

return var_0_0
