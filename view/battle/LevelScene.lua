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

function var_0_0.getResource(arg_3_0)
	local var_3_0 = ResList.LevelSceneResConst.GetResource(arg_3_0)

	return table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0))
end

function var_0_0.downloadChapterRes(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.exited or not ResList.ChapterResConst.IsActive(arg_4_1) then
		return
	end

	local var_4_0 = ResList.ChapterResConst.GetResList(arg_4_1)

	SplitPackConst.DownloadByLuaArr(var_4_0, function()
		local var_5_0 = arg_4_0.contextData.chapterVO

		if arg_4_0.exited or not ResList.ChapterResConst.IsActive(var_5_0) or var_5_0.id ~= arg_4_1.id then
			return
		end

		if var_5_0 ~= arg_4_1 then
			arg_4_0:downloadChapterRes(var_5_0, arg_4_2)

			return
		end

		arg_4_2()
	end, {
		showMask = true
	})
end

function var_0_0.ResUISettings(arg_6_0)
	return {
		groupDelta = 1,
		showType = PlayerResUI.TYPE_ALL
	}
end

function var_0_0.getBGM(arg_7_0)
	local function var_7_0()
		return checkExist(arg_7_0.contextData.chapterVO, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	local function var_7_1()
		if not arg_7_0.contextData.map then
			return
		end

		local var_9_0 = arg_7_0.contextData.map:getConfig("ani_controller")
		local var_9_1 = getProxy(ChapterProxy)

		if var_9_0 and #var_9_0 > 0 then
			for iter_9_0, iter_9_1 in ipairs(var_9_0) do
				local var_9_2 = _.rest(iter_9_1[2], 2)

				for iter_9_2, iter_9_3 in ipairs(var_9_2) do
					if string.find(iter_9_3, "^bgm_") and iter_9_1[1] == var_0_3 then
						local var_9_3 = iter_9_1[2][1]
						local var_9_4 = false

						for iter_9_4, iter_9_5 in ipairs(var_9_3) do
							local var_9_5 = var_9_1:GetChapterItemById(iter_9_5)

							if var_9_5 and var_9_5:isClear() then
								var_9_4 = true

								break
							end
						end

						if not var_9_4 then
							return string.sub(iter_9_3, 5)
						end
					end
				end
			end
		end

		return checkExist(arg_7_0.contextData.map, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	for iter_7_0, iter_7_1 in ipairs({
		var_7_0(),
		var_7_1()
	}) do
		if iter_7_1 ~= "" then
			return iter_7_1
		end
	end

	return var_0_0.super.getBGM(arg_7_0)
end

var_0_0.optionsPath = {
	"top/top_chapter/option"
}

function var_0_0.preload(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(ChapterProxy)

	if arg_10_0.contextData.mapIdx and arg_10_0.contextData.chapterId then
		local var_10_1 = var_10_0:getChapterById(arg_10_0.contextData.chapterId)

		if var_10_1:getConfig("map") == arg_10_0.contextData.mapIdx then
			arg_10_0.contextData.chapterVO = var_10_1

			if var_10_1.active then
				assert(not arg_10_0.contextData.openChapterId or arg_10_0.contextData.openChapterId == arg_10_0.contextData.chapterId)

				arg_10_0.contextData.openChapterId = nil
			end
		end
	end

	local var_10_2, var_10_3 = arg_10_0:GetInitializeMap()

	if arg_10_0.contextData.entranceStatus == nil then
		arg_10_0.contextData.entranceStatus = not var_10_3
	end

	arg_10_1()
end

function var_0_0.GetInitializeMap(arg_11_0)
	local var_11_0 = (function()
		local var_12_0 = arg_11_0.contextData.chapterVO

		if var_12_0 and var_12_0.active then
			return var_12_0:getConfig("map")
		end

		local var_12_1 = arg_11_0.contextData.mapIdx

		if var_12_1 then
			return var_12_1
		end

		local var_12_2

		if arg_11_0.contextData.targetChapter and arg_11_0.contextData.targetMap then
			arg_11_0.contextData.openChapterId = arg_11_0.contextData.targetChapter
			var_12_2 = arg_11_0.contextData.targetMap.id
			arg_11_0.contextData.targetChapter = nil
			arg_11_0.contextData.targetMap = nil
		elseif arg_11_0.contextData.eliteDefault then
			local var_12_3 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			var_12_2 = var_12_3 and var_12_3.id or nil
			arg_11_0.contextData.eliteDefault = nil
		end

		return var_12_2
	end)()
	local var_11_1 = var_11_0 and getProxy(ChapterProxy):getMapById(var_11_0)

	if var_11_1 then
		local var_11_2, var_11_3 = var_11_1:isUnlock()

		if not var_11_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_11_3)

			var_11_0 = getProxy(ChapterProxy):getLastUnlockMap().id
			arg_11_0.contextData.mapIdx = var_11_0
		end
	else
		var_11_0 = nil
	end

	return var_11_0 or getProxy(ChapterProxy):GetLastNormalMap(), tobool(var_11_0)
end

function var_0_0.init(arg_13_0)
	arg_13_0:initData()
	arg_13_0:initUI()
	arg_13_0:initEvents()
	arg_13_0:updateClouds()
end

function var_0_0.initData(arg_14_0)
	arg_14_0.tweens = {}

	local var_14_0 = arg_14_0._tf.rect.size

	arg_14_0.mapWidth, arg_14_0.mapHeight = var_14_0.x, var_14_0.y
	arg_14_0.levelCamIndices = 1
	arg_14_0.frozenCount = 0
	arg_14_0.currentBG = nil
	arg_14_0.mbDict = {}
	arg_14_0.mapGroup = {}

	if not arg_14_0.contextData.huntingRangeVisibility then
		arg_14_0.contextData.huntingRangeVisibility = 2
	end
end

function var_0_0.initUI(arg_15_0)
	arg_15_0.topPanel = arg_15_0._tf:Find("top")
	arg_15_0.canvasGroup = arg_15_0.topPanel:GetComponent("CanvasGroup")
	arg_15_0.canvasGroup.blocksRaycasts = not arg_15_0.canvasGroup.blocksRaycasts
	arg_15_0.canvasGroup.blocksRaycasts = not arg_15_0.canvasGroup.blocksRaycasts
	arg_15_0.entranceLayer = arg_15_0._tf:Find("entrance")
	arg_15_0.ptBonus = EventPtBonus.New(arg_15_0.entranceLayer:Find("btns/btn_task/bonusPt"))
	arg_15_0.entranceBg = arg_15_0._tf:Find("entrance_bg")
	arg_15_0.topChapter = arg_15_0.topPanel:Find("top_chapter")

	setActive(arg_15_0.topChapter:Find("title_chapter"), false)
	setActive(arg_15_0.topChapter:Find("type_chapter"), false)
	setActive(arg_15_0.topChapter:Find("type_escort"), false)
	setActive(arg_15_0.topChapter:Find("type_skirmish"), false)

	arg_15_0.chapterName = arg_15_0.topChapter:Find("title_chapter/name")
	arg_15_0.chapterNoTitle = arg_15_0.topChapter:Find("title_chapter/chapter")
	arg_15_0.resChapter = arg_15_0.topChapter:Find("resources")

	setActive(arg_15_0.topChapter, true)

	arg_15_0._voteBookBtn = arg_15_0.topChapter:Find("vote_book")
	arg_15_0.leftChapter = arg_15_0._tf:Find("main/left_chapter")

	setActive(arg_15_0.leftChapter, true)

	arg_15_0.leftCanvasGroup = arg_15_0.leftChapter:GetComponent(typeof(CanvasGroup))
	arg_15_0.btnPrev = arg_15_0.leftChapter:Find("btn_prev")
	arg_15_0.btnPrevCol = arg_15_0.leftChapter:Find("btn_prev/prev_image")
	arg_15_0.eliteBtn = arg_15_0.leftChapter:Find("buttons/btn_elite")
	arg_15_0.normalBtn = arg_15_0.leftChapter:Find("buttons/btn_normal")
	arg_15_0.actNormalBtn = arg_15_0.leftChapter:Find("buttons/btn_act_normal")
	arg_15_0.actEliteBtn = arg_15_0.leftChapter:Find("buttons/btn_act_elite")
	arg_15_0.actExtraBtn = arg_15_0.leftChapter:Find("buttons/btn_act_extra")
	arg_15_0.actExtraBtnAnim = arg_15_0.actExtraBtn:Find("usm")
	arg_15_0.remasterBtn = arg_15_0.leftChapter:Find("buttons/btn_remaster")
	arg_15_0.escortBar = arg_15_0.leftChapter:Find("escort_bar")
	arg_15_0.eliteQuota = arg_15_0.leftChapter:Find("elite_quota")
	arg_15_0.skirmishBar = arg_15_0.leftChapter:Find("left_times")
	arg_15_0.suggestionBtn = arg_15_0.leftChapter:Find("suggestionBtn")

	setText(arg_15_0.leftChapter:Find("suggestionBtn/Text"), i18n("formation_suggestion"))

	arg_15_0.mainLayer = arg_15_0._tf:Find("main")

	setActive(arg_15_0.mainLayer:Find("title_chapter_lines"), false)

	arg_15_0.rightChapter = arg_15_0._tf:Find("main/right_chapter")
	arg_15_0.rightCanvasGroup = arg_15_0.rightChapter:GetComponent(typeof(CanvasGroup))
	arg_15_0.eventContainer = arg_15_0.rightChapter:Find("event_btns/event_container")
	arg_15_0.btnSpecial = arg_15_0.eventContainer:Find("btn_task")
	arg_15_0.challengeBtn = arg_15_0.eventContainer:Find("btn_challenge")
	arg_15_0.dailyBtn = arg_15_0.eventContainer:Find("btn_daily")
	arg_15_0.militaryExerciseBtn = arg_15_0.eventContainer:Find("btn_pvp")
	arg_15_0.activityBtn = arg_15_0.rightChapter:Find("event_btns/activity_btn")
	arg_15_0.ptTotal = arg_15_0.rightChapter:Find("event_btns/pt_text")
	arg_15_0.ticketTxt = arg_15_0.rightChapter:Find("event_btns/tickets/Text")
	arg_15_0.remasterAwardBtn = arg_15_0.rightChapter:Find("btn_remaster_award")
	arg_15_0.btnNext = arg_15_0.rightChapter:Find("btn_next")
	arg_15_0.btnNextCol = arg_15_0.rightChapter:Find("btn_next/next_image")
	arg_15_0.countDown = arg_15_0.rightChapter:Find("event_btns/count_down")

	setActive(arg_15_0.rightChapter:Find("event_btns/BottomList"), true)

	arg_15_0.actExchangeShopBtn = arg_15_0.rightChapter:Find("event_btns/BottomList/btn_exchange")
	arg_15_0.actAtelierBuffBtn = arg_15_0.rightChapter:Find("event_btns/BottomList/btn_control_center")
	arg_15_0.actAtelierYumiaBuffBtn = arg_15_0.rightChapter:Find("event_btns/BottomList/btn_yumia_buff")
	arg_15_0.actExtraRank = arg_15_0.rightChapter:Find("event_btns/BottomList/act_extra_rank")

	setActive(arg_15_0.rightChapter, true)

	arg_15_0.damageTextTemplate = go(arg_15_0.topPanel:Find("damage"))

	setActive(arg_15_0.damageTextTemplate, false)

	arg_15_0.damageTextPool = {
		arg_15_0.damageTextTemplate
	}
	arg_15_0.damageTextActive = {}
	arg_15_0.mapHelpBtn = arg_15_0.topPanel:Find("help_button")
	arg_15_0.avoidText = arg_15_0.topPanel:Find("text_avoid")
	arg_15_0.commanderTinkle = arg_15_0.topPanel:Find("neko_tinkle")

	setActive(arg_15_0.commanderTinkle, false)

	arg_15_0.spResult = arg_15_0.topPanel:Find("sp_result")

	setActive(arg_15_0.spResult, false)

	arg_15_0.helpPage = arg_15_0.topPanel:Find("help_page")
	arg_15_0.helpImage = arg_15_0.helpPage:Find("icon")

	setActive(arg_15_0.helpPage, false)

	arg_15_0.curtain = arg_15_0.topPanel:Find("curtain")

	setActive(arg_15_0.curtain, false)

	arg_15_0.map = arg_15_0._tf:Find("maps")
	arg_15_0.mapTFs = {
		arg_15_0._tf:Find("maps/map1"),
		arg_15_0._tf:Find("maps/map2")
	}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.mapTFs) do
		iter_15_1:GetComponent(typeof(Image)).enabled = false
	end

	arg_15_0.UIFXList = arg_15_0._tf:Find("maps/UI_FX_list")

	local var_15_0 = arg_15_0.UIFXList:GetComponentsInChildren(typeof(Renderer)):ToTable()

	for iter_15_2, iter_15_3 in ipairs(var_15_0) do
		iter_15_3.sortingOrder = -1
	end

	arg_15_0.rtRightPanel = arg_15_0._tf:Find("entrance/enters/right_panel")
	arg_15_0.actBtnTpl = arg_15_0.rtRightPanel:Find("content/tpl")

	local var_15_1 = pg.UIMgr.GetInstance()

	arg_15_0.levelCam = var_15_1.levelCamera:GetComponent(typeof(Camera))
	arg_15_0.uiMain = var_15_1.LevelMain

	setActive(arg_15_0.uiMain, false)

	arg_15_0.uiCam = var_15_1.uiCamera:GetComponent(typeof(Camera))
	arg_15_0.levelGrid = arg_15_0.uiMain:Find("LevelGrid")

	setActive(arg_15_0.levelGrid, true)

	arg_15_0.dragLayer = arg_15_0.levelGrid:Find("DragLayer")
	arg_15_0.float = arg_15_0._tf:Find("float")
	arg_15_0.clouds = arg_15_0.float:Find("clouds")

	setActive(arg_15_0.clouds, true)
	setActive(arg_15_0.float:Find("levels"), false)

	arg_15_0.resources = arg_15_0._tf:Find("resources")
	arg_15_0.arrowTarget = arg_15_0.resources:Find("Tpl_Arrow_Target")
	arg_15_0.destinationMarkTpl = arg_15_0.resources:Find("Tpl_Destination_Mark")
	arg_15_0.championTpl = arg_15_0.resources:Find("Tpl_Champion")
	arg_15_0.deadTpl = arg_15_0.resources:Find("Tpl_Dead")
	arg_15_0.enemyTpl = arg_15_0.resources:Find("Tpl_Enemy")
	arg_15_0.oniTpl = arg_15_0.resources:Find("Tpl_Oni")
	arg_15_0.shipTpl = arg_15_0.resources:Find("Tpl_Ship")
	arg_15_0.subTpl = arg_15_0.resources:Find("Tpl_Sub")
	arg_15_0.transportTpl = arg_15_0.resources:Find("Tpl_Transport")

	setText(tf(arg_15_0.enemyTpl):Find("fighting/Text"), i18n("ui_word_levelui2_inevent"))
	arg_15_0:HideBtns()
	setAnchoredPosition(arg_15_0.topChapter, {
		y = 0
	})
	setAnchoredPosition(arg_15_0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(arg_15_0.rightChapter, {
		x = 0
	})

	arg_15_0.bubbleMsgBoxes = {}
	arg_15_0.loader = AutoLoader.New()
	arg_15_0.levelFleetView = LevelFleetView.New(arg_15_0.topPanel, arg_15_0.event, arg_15_0.contextData)
	arg_15_0.levelInfoView = LevelInfoView.New(arg_15_0.topPanel, arg_15_0.event, arg_15_0.contextData)

	arg_15_0.levelInfoView:RegisterView(arg_15_0)
	arg_15_0.levelFleetView:RegisterView(arg_15_0)
	arg_15_0:buildCommanderPanel()

	arg_15_0.levelRemasterView = LevelRemasterView.New(arg_15_0.topPanel, arg_15_0.event, arg_15_0.contextData)
	arg_15_0.chapterAutoDetailPanel = ChapterAutoDetailPanel.New(arg_15_0.topPanel, arg_15_0.event, arg_15_0.contextData)

	arg_15_0.chapterAutoDetailPanel:RegisterView(arg_15_0)
	arg_15_0:SwitchMapBuilder(MapBuilder.TYPENORMAL)
end

function var_0_0.LoadEntranceActivityBg(arg_16_0)
	local var_16_0 = arg_16_0.entranceActivity:getConfig("config_client").entrance_bg

	if not var_16_0 then
		return
	end

	local var_16_1 = "activitybanner"

	if string.sub(var_16_0, 1, #var_16_1) == var_16_1 then
		var_16_0 = "MainUIBanner" .. string.sub(var_16_0, #var_16_1 + 1)
	end

	arg_16_0.entranceActivityBgPath = var_16_0

	pg.PoolMgr.GetInstance():GetPrefab(var_16_0, "", true, function(arg_17_0)
		if arg_16_0.exited then
			pg.PoolMgr.GetInstance():ReturnPrefab(var_16_0, "", arg_17_0)

			return
		end

		arg_16_0.entranceActivityBg = arg_17_0

		setParent(arg_17_0.transform, arg_16_0.entranceLayer:Find("enters/enter_ready/activity"))
		setText(arg_17_0.transform:Find("Text"), arg_16_0.entranceActivity:GetActivityTimeStr(true))

		arg_17_0.transform.anchorMin = Vector2.zero
		arg_17_0.transform.anchorMax = Vector2.one
		arg_17_0.transform.offsetMin = Vector2.zero
		arg_17_0.transform.offsetMax = Vector2.zero
	end)
end

function var_0_0.initEvents(arg_18_0)
	arg_18_0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		arg_18_0:openCommanderPanel(arg_19_1, arg_19_2, arg_19_3)
	end)
	arg_18_0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function(arg_20_0, arg_20_1)
		arg_18_0:HandleShowMsgBox(arg_20_1)
	end)
	arg_18_0:bind(LevelUIConst.DO_AMBUSH_WARNING, function(arg_21_0, arg_21_1)
		arg_18_0:doAmbushWarning(arg_21_1)
	end)
	arg_18_0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function(arg_22_0, arg_22_1)
		arg_18_0:displayAmbushInfo(arg_22_1)
	end)
	arg_18_0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function(arg_23_0, arg_23_1)
		arg_18_0:displayStrategyInfo(arg_23_1)
	end)
	arg_18_0:bind(LevelUIConst.FROZEN, function(arg_24_0)
		arg_18_0:frozen()
	end)
	arg_18_0:bind(LevelUIConst.UN_FROZEN, function(arg_25_0)
		arg_18_0:unfrozen()
	end)
	arg_18_0:bind(LevelUIConst.DO_TRACKING, function(arg_26_0, arg_26_1)
		arg_18_0:doTracking(arg_26_1)
	end)
	arg_18_0:bind(LevelUIConst.SWITCH_TO_MAP, function()
		if arg_18_0:isfrozen() then
			return
		end

		arg_18_0:switchToMap()
	end)
	arg_18_0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function(arg_28_0, arg_28_1)
		arg_18_0:displayRepairWindow(arg_28_1)
	end)
	arg_18_0:bind(LevelUIConst.DO_PLAY_ANIM, function(arg_29_0, arg_29_1)
		arg_18_0:doPlayAnim(arg_29_1.name, arg_29_1.callback, arg_29_1.onStart)
	end)
	arg_18_0:bind(LevelUIConst.HIDE_FLEET_SELECT, function()
		arg_18_0:hideFleetSelect()
	end)
	arg_18_0:bind(LevelUIConst.HIDE_FLEET_EDIT, function(arg_31_0)
		arg_18_0:hideFleetEdit()
	end)
	arg_18_0:bind(LevelUIConst.ADD_MSG_QUEUE, function(arg_32_0, arg_32_1)
		arg_18_0:addbubbleMsgBox(arg_32_1)
	end)
	arg_18_0:bind(LevelUIConst.SET_MAP, function(arg_33_0, arg_33_1)
		arg_18_0:setMap(arg_33_1)
	end)
end

function var_0_0.onZeroHourRefresh(arg_34_0)
	if arg_34_0.levelInfoView:isShowing() then
		arg_34_0.levelInfoView:RefreshChapterAutoPanel()
	end

	if arg_34_0.levelInfoSPView and arg_34_0.levelInfoSPView:isShowing() then
		arg_34_0.levelInfoView:RefreshChapterAutoPanel()
	end
end

function var_0_0.addbubbleMsgBox(arg_35_0, arg_35_1)
	table.insert(arg_35_0.bubbleMsgBoxes, arg_35_1)

	if #arg_35_0.bubbleMsgBoxes > 1 then
		return
	end

	local var_35_0

	local function var_35_1()
		local var_36_0 = arg_35_0.bubbleMsgBoxes[1]

		if var_36_0 then
			var_36_0(function()
				table.remove(arg_35_0.bubbleMsgBoxes, 1)
				var_35_1()
			end)
		end
	end

	var_35_1()
end

function var_0_0.CleanBubbleMsgbox(arg_38_0)
	table.clean(arg_38_0.bubbleMsgBoxes)
end

function var_0_0.updatePtActivity(arg_39_0, arg_39_1)
	arg_39_0.ptActivity = arg_39_1

	if not arg_39_0.ptActivity then
		return
	end

	arg_39_0:updateActivityRes()
end

function var_0_0.updateActivityRes(arg_40_0)
	local var_40_0 = findTF(arg_40_0.ptTotal, "Text")
	local var_40_1 = findTF(arg_40_0.ptTotal, "icon/Image")

	if var_40_0 and var_40_1 and arg_40_0.ptActivity then
		setText(var_40_0, "x" .. arg_40_0.ptActivity:GetTotalPtCount())

		local var_40_2 = arg_40_0.ptActivity:GetPTDrop():getIcon()

		GetImageSpriteFromAtlasAsync(var_40_2, "", var_40_1, true)
		GetImageSpriteFromAtlasAsync(var_40_2, "", arg_40_0.actExchangeShopBtn:Find("icon"), true)
	end
end

function var_0_0.setCommanderPrefabs(arg_41_0, arg_41_1)
	arg_41_0.commanderPrefabs = arg_41_1
end

function var_0_0.didEnter(arg_42_0)
	arg_42_0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_42_0.player.level, "CommanderCatMediator")

	onButton(arg_42_0, arg_42_0.topChapter:Find("back_button"), function()
		if arg_42_0:isfrozen() then
			return
		end

		local var_43_0 = arg_42_0.contextData.map

		if var_43_0 and (var_43_0:isActivity() or var_43_0:isEscort()) then
			arg_42_0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		elseif var_43_0 and var_43_0:isSkirmish() then
			arg_42_0:emit(var_0_0.ON_BACK)
		elseif not arg_42_0.contextData.entranceStatus then
			arg_42_0:ShowEntranceUI(true)
		else
			arg_42_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_42_0, arg_42_0.btnSpecial, function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.dailyBtn, function()
		if arg_42_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_42_0:updatDailyBtnTip()
		arg_42_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.challengeBtn, function()
		if arg_42_0:isfrozen() then
			return
		end

		local var_46_0, var_46_1 = arg_42_0:checkChallengeOpen()

		if var_46_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_46_1)
		else
			arg_42_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.militaryExerciseBtn, function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.normalBtn, function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:setMap(arg_42_0.contextData.map:getBindMapId())
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.eliteBtn, function()
		if arg_42_0:isfrozen() then
			return
		end

		if arg_42_0.contextData.map:getBindMapId() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			local var_49_0 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			if var_49_0 then
				arg_42_0:setMap(var_49_0.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif arg_42_0.contextData.map:isEliteEnabled() then
			arg_42_0:setMap(arg_42_0.contextData.map:getBindMapId())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(arg_42_0, arg_42_0.remasterBtn, function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_42_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("enters/enter_main"), function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:ShowSelectedMap(arg_42_0:GetInitializeMap())
	end, SFX_PANEL)
	setText(arg_42_0.entranceLayer:Find("enters/enter_main/Text"), getProxy(ChapterProxy):getLastUnlockMap():getLastUnlockChapterName())
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("enters/enter_world/enter"), function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:emit(LevelMediator2.ENTER_WORLD)
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("enters/enter_ready/activity"), function()
		if arg_42_0:isfrozen() then
			return
		end

		switch(arg_42_0.entranceActivity:getConfig("type"), {
			[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function()
				arg_42_0:emit(LevelMediator2.ON_ACTIVITY_MAP, arg_42_0.entranceActivity.id)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
				arg_42_0:emit(LevelMediator2.ON_OPEN_ACT_BOSS_BATTLE)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
				arg_42_0:emit(LevelMediator2.ON_BOSSRUSH_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
				arg_42_0:emit(LevelMediator2.ON_BOSSSINGLE_MAP, {
					mode = OtherworldMapScene.MODE_BATTLE
				})
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
				arg_42_0:emit(LevelMediator2.ON_CLUE_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = function()
				arg_42_0:emit(LevelMediator2.ON_COLLAB_BOSSRUSH_MAP)
			end
		})
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("btns/btn_remaster"), function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_42_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	setActive(arg_42_0.entranceLayer:Find("btns/btn_remaster"), OPEN_REMASTER)
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("btns/btn_challenge"), function()
		if arg_42_0:isfrozen() then
			return
		end

		local var_61_0, var_61_1 = arg_42_0:checkChallengeOpen()

		if var_61_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_61_1)
		else
			arg_42_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("btns/btn_pvp"), function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("btns/btn_daily"), function()
		if arg_42_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_42_0:updatDailyBtnTip()
		arg_42_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_42_0, arg_42_0.entranceLayer:Find("btns/btn_task"), function()
		if arg_42_0:isfrozen() then
			return
		end

		arg_42_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	setActive(arg_42_0.entranceLayer:Find("enters/enter_world/enter"), not WORLD_ENTER_LOCK)
	setActive(arg_42_0.entranceLayer:Find("enters/enter_world/nothing"), WORLD_ENTER_LOCK)
	setActive(arg_42_0.entranceLayer:Find("enters/enter_world/enter/tip"), getProxy(ChapterAutoProxy):IsAllCommissionFinish(ChapterAutoProxy.TYPE.WORLD))

	arg_42_0.entranceActivity = getProxy(ActivityProxy):getEnterReadyActivity()[1]

	setActive(arg_42_0.entranceLayer:Find("enters/enter_ready/nothing"), not tobool(arg_42_0.entranceActivity))
	setActive(arg_42_0.entranceLayer:Find("enters/enter_ready/activity"), tobool(arg_42_0.entranceActivity))

	if tobool(arg_42_0.entranceActivity) then
		arg_42_0:LoadEntranceActivityBg()
	end

	arg_42_0:updateRightPanel()

	local var_42_0 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_42_0.player.level, "EventMediator")

	setActive(arg_42_0.btnSpecial:Find("lock"), not var_42_0)
	setActive(arg_42_0.entranceLayer:Find("btns/btn_task/lock"), not var_42_0)

	local var_42_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_42_0.player.level, "DailyLevelMediator")

	setActive(arg_42_0.dailyBtn:Find("lock"), not var_42_1)
	setActive(arg_42_0.entranceLayer:Find("btns/btn_daily/lock"), not var_42_1)

	local var_42_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_42_0.player.level, "MilitaryExerciseMediator")

	setActive(arg_42_0.militaryExerciseBtn:Find("lock"), not var_42_2)
	setActive(arg_42_0.entranceLayer:Find("btns/btn_pvp/lock"), not var_42_2)

	local var_42_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_42_0.player.level, "WorldMediator")

	setActive(arg_42_0.entranceLayer:Find("enters/enter_world/enter/lock"), not var_42_3)

	local var_42_4 = LimitChallengeConst.IsOpen()

	setActive(arg_42_0.challengeBtn:Find("lock"), not var_42_4)
	setActive(arg_42_0.entranceLayer:Find("btns/btn_challenge/lock"), not var_42_4)

	local var_42_5 = LimitChallengeConst.IsInAct()

	setActive(arg_42_0.challengeBtn, var_42_5)
	setActive(arg_42_0.entranceLayer:Find("btns/btn_challenge"), var_42_5)

	local var_42_6 = LimitChallengeConst.IsShowRedPoint()

	setActive(arg_42_0.entranceLayer:Find("btns/btn_challenge/tip"), var_42_6)
	arg_42_0:initMapBtn(arg_42_0.btnPrev, -1)
	arg_42_0:initMapBtn(arg_42_0.btnNext, 1)
	onButton(arg_42_0, arg_42_0.suggestionBtn, function()
		local var_65_0 = arg_42_0.contextData.mapIdx
		local var_65_1 = table.keyof(LevelTools.GetSuggestionMapIDList(var_65_0), var_65_0)

		arg_42_0:emit(BaseUI.ON_GO_SCENE, SCENE.FORMATION_SUGGESTION, {
			selectedIndex = var_65_1,
			mapID = var_65_0
		})
	end)
	arg_42_0:registerActBtn()

	if arg_42_0.contextData.editEliteChapter then
		local var_42_7 = getProxy(ChapterProxy):getChapterById(arg_42_0.contextData.editEliteChapter)

		arg_42_0:displayFleetEdit(var_42_7)

		arg_42_0.contextData.editEliteChapter = nil
	elseif arg_42_0.contextData.selectedChapterVO then
		arg_42_0:displayFleetSelect(arg_42_0.contextData.selectedChapterVO)

		arg_42_0.contextData.selectedChapterVO = nil
	end

	local var_42_8 = arg_42_0.contextData.chapterVO

	if not var_42_8 or not var_42_8.active then
		arg_42_0:tryPlaySubGuide()
	end

	arg_42_0:updateRemasterBtnTip()
	arg_42_0:updatDailyBtnTip()

	if arg_42_0.contextData.open_remaster then
		arg_42_0:displayRemasterPanel(arg_42_0.contextData.isSP)

		arg_42_0.contextData.open_remaster = nil
	end

	arg_42_0:ShowEntranceUI(arg_42_0.contextData.entranceStatus)

	if not arg_42_0.contextData.entranceStatus then
		arg_42_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_42_0:GetInitializeMap())
	end

	arg_42_0:emit(LevelMediator2.ON_DIDENTER)
end

function var_0_0.updateRightPanel(arg_66_0)
	arg_66_0.rightActivityBtns = defaultValue(arg_66_0.rightActivityBtns, {
		LevelSecondMapBtn.New(arg_66_0.actBtnTpl, arg_66_0.event, false)
	})

	local var_66_0 = {}
	local var_66_1 = {}

	for iter_66_0, iter_66_1 in ipairs(arg_66_0.rightActivityBtns) do
		if iter_66_1:InShowTime() then
			table.insert(var_66_0, iter_66_1)
		else
			table.insert(var_66_1, iter_66_1)
		end
	end

	table.sort(var_66_0, CompareFuncs({
		function(arg_67_0)
			return arg_67_0.config.group_id
		end
	}))

	for iter_66_2, iter_66_3 in ipairs(var_66_0) do
		iter_66_3:Init(iter_66_2)
	end

	for iter_66_4, iter_66_5 in ipairs(var_66_1) do
		iter_66_5:Clear()
	end
end

function var_0_0.checkChallengeOpen(arg_68_0)
	local var_68_0 = getProxy(PlayerProxy):getRawData().level

	return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_68_0, "ChallengeMainMediator")
end

function var_0_0.tryPlaySubGuide(arg_69_0)
	if arg_69_0.contextData.map and arg_69_0.contextData.map:isSkirmish() then
		return
	end

	pg.SystemGuideMgr.GetInstance():Play(arg_69_0)
end

function var_0_0.onBackPressed(arg_70_0)
	if arg_70_0:isfrozen() then
		return
	end

	if arg_70_0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_70_0.chapterAutoDetailPanel:isShowing() then
		arg_70_0:HideChapterAutoDetailPanel()
	end

	if arg_70_0.levelInfoView:isShowing() then
		arg_70_0:hideChapterPanel()

		return
	end

	if arg_70_0.levelInfoSPView and arg_70_0.levelInfoSPView:isShowing() then
		arg_70_0:HideLevelInfoSPPanel()

		return
	end

	if arg_70_0.levelFleetView:isShowing() then
		arg_70_0:hideFleetEdit()

		return
	end

	if arg_70_0.levelStrategyView then
		arg_70_0:hideStrategyInfo()

		return
	end

	if arg_70_0.levelRepairView then
		arg_70_0:hideRepairWindow()

		return
	end

	if arg_70_0.levelRemasterView:isShowing() then
		arg_70_0:hideRemasterPanel()

		return
	end

	if arg_70_0.contextData.map and arg_70_0.contextData.map:getConfig("ui_type") == MapBuilder.TYPEEXSP and arg_70_0.mapBuilder.personalPage:IsActive() then
		arg_70_0.mapBuilder.personalPage:Hide()

		return
	end

	if isActive(arg_70_0.helpPage) then
		setActive(arg_70_0.helpPage, false)

		return
	end

	local var_70_0 = arg_70_0.contextData.chapterVO
	local var_70_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_70_0 and var_70_1 then
		arg_70_0:switchToMap()

		return
	end

	triggerButton(arg_70_0.topChapter:Find("back_button"))
end

function var_0_0.ShowEntranceUI(arg_71_0, arg_71_1)
	setActive(arg_71_0.entranceLayer, arg_71_1)
	setActive(arg_71_0.entranceBg, arg_71_1)
	setActive(arg_71_0.map, not arg_71_1)
	setActive(arg_71_0.float, not arg_71_1)
	setActive(arg_71_0.mainLayer, not arg_71_1)
	setActive(arg_71_0.topChapter:Find("type_entrance"), arg_71_1)

	arg_71_0.contextData.entranceStatus = tobool(arg_71_1)

	if arg_71_1 then
		setActive(arg_71_0.topChapter:Find("title_chapter"), false)
		setActive(arg_71_0.topChapter:Find("type_chapter"), false)
		setActive(arg_71_0.topChapter:Find("type_escort"), false)
		setActive(arg_71_0.topChapter:Find("type_skirmish"), false)

		if arg_71_0.newChapterCDTimer then
			arg_71_0.newChapterCDTimer:Stop()

			arg_71_0.newChapterCDTimer = nil
		end

		arg_71_0:RecordLastMapOnExit()

		arg_71_0.contextData.mapIdx = nil
		arg_71_0.contextData.map = nil
	end

	arg_71_0:PlayBGM()
end

function var_0_0.PreloadLevelMainUI(arg_72_0, arg_72_1, arg_72_2)
	if arg_72_0.preloadLevelDone then
		existCall(arg_72_2)

		return
	end

	local var_72_0

	local function var_72_1()
		if not arg_72_0.exited then
			arg_72_0.preloadLevelDone = true

			existCall(arg_72_2)
		end
	end

	local var_72_2 = getProxy(ChapterProxy):getMapById(arg_72_1)
	local var_72_3 = arg_72_0:GetMapBG(var_72_2)

	table.ParallelIpairsAsync(var_72_3, function(arg_74_0, arg_74_1, arg_74_2)
		GetSpriteFromAtlasAsync("levelmap/" .. arg_74_1.BG, "", arg_74_2)
	end, var_72_1)
end

function var_0_0.setShips(arg_75_0, arg_75_1)
	arg_75_0.shipVOs = arg_75_1
end

function var_0_0.updateRes(arg_76_0, arg_76_1)
	if arg_76_0.levelStageView then
		arg_76_0.levelStageView:ActionInvoke("SetPlayer", arg_76_1)
	end

	arg_76_0.player = arg_76_1
end

function var_0_0.setEliteQuota(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = arg_77_2 - arg_77_1
	local var_77_1 = arg_77_0.eliteQuota:Find("bg/Text"):GetComponent(typeof(Text))

	if arg_77_1 == arg_77_2 then
		var_77_1.color = Color.red
	else
		var_77_1.color = Color.New(0.47, 0.89, 0.27)
	end

	var_77_1.text = var_77_0 .. "/" .. arg_77_2
end

function var_0_0.updateEvent(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_1:hasFinishState()

	setActive(arg_78_0.btnSpecial:Find("tip"), var_78_0)
	setActive(arg_78_0.entranceLayer:Find("btns/btn_task/tip"), var_78_0)
end

function var_0_0.updateFleet(arg_79_0, arg_79_1)
	arg_79_0.fleets = arg_79_1
end

function var_0_0.updateChapterVO(arg_80_0, arg_80_1, arg_80_2)
	if arg_80_0.contextData.chapterVO and arg_80_0.contextData.chapterVO.id == arg_80_1.id and arg_80_1.active then
		arg_80_0:setChapter(arg_80_1)
	end

	if arg_80_0.contextData.chapterVO and arg_80_0.contextData.chapterVO.id == arg_80_1.id and arg_80_1.active and arg_80_0.levelStageView and arg_80_0.grid then
		local var_80_0 = false
		local var_80_1 = false
		local var_80_2 = false

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyFleet) > 0 then
			arg_80_0.levelStageView:updateStageFleet()
			arg_80_0.levelStageView:updateAmbushRate(arg_80_1.fleet.line, true)

			var_80_2 = true

			if arg_80_0.grid then
				arg_80_0.grid:RefreshFleetCells()
				arg_80_0.grid:UpdateFloor()
				arg_80_0.grid:UpdateWeatherCells()

				var_80_0 = true
			end
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyChampion) > 0 then
			var_80_2 = true

			if arg_80_0.grid then
				arg_80_0.grid:UpdateFleets()
				arg_80_0.grid:clearChampions()
				arg_80_0.grid:initChampions()

				var_80_1 = true
			end
		elseif bit.band(arg_80_2, ChapterConst.DirtyChampionPosition) > 0 then
			var_80_2 = true

			if arg_80_0.grid then
				arg_80_0.grid:UpdateFleets()
				arg_80_0.grid:updateChampions()

				var_80_1 = true
			end
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyAchieve) > 0 then
			arg_80_0.levelStageView:updateStageAchieve()
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyAttachment) > 0 then
			arg_80_0.levelStageView:updateAmbushRate(arg_80_1.fleet.line, true)

			if arg_80_0.grid then
				if not (arg_80_2 < 0) and not (bit.band(arg_80_2, ChapterConst.DirtyFleet) > 0) then
					arg_80_0.grid:updateFleet(arg_80_1.fleets[arg_80_1.findex].id)
				end

				arg_80_0.grid:updateAttachments()

				if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyAutoAction) > 0 then
					arg_80_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					var_80_0 = true
				end
			end
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyStrategy) > 0 then
			arg_80_0.levelStageView:updateStageStrategy()

			var_80_2 = true

			arg_80_0.levelStageView:updateStageBarrier()
			arg_80_0.levelStageView:UpdateAutoFightPanel()
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyAutoAction) > 0 then
			-- block empty
		elseif var_80_0 then
			arg_80_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif var_80_1 then
			arg_80_0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyCellFlag) > 0 then
			arg_80_0.grid:UpdateFloor()
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyBase) > 0 then
			arg_80_0.levelStageView:UpdateDefenseStatus()
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyFloatItems) > 0 then
			arg_80_0.grid:UpdateItemCells()
		end

		if arg_80_2 < 0 or bit.band(arg_80_2, ChapterConst.DirtyWeather) > 0 then
			arg_80_0.grid:UpdateWeatherCells()
		end

		if var_80_2 then
			arg_80_0.levelStageView:updateFleetBuff()
		end
	end
end

function var_0_0.updateClouds(arg_81_0)
	arg_81_0.cloudRTFs = {}
	arg_81_0.cloudRects = {}
	arg_81_0.cloudTimer = {}

	for iter_81_0 = 1, 6 do
		local var_81_0 = arg_81_0.clouds:Find("cloud_" .. iter_81_0)
		local var_81_1 = rtf(var_81_0)

		table.insert(arg_81_0.cloudRTFs, var_81_1)
		table.insert(arg_81_0.cloudRects, var_81_1.rect.width)
	end

	arg_81_0:initCloudsPos()

	for iter_81_1, iter_81_2 in ipairs(arg_81_0.cloudRTFs) do
		local var_81_2 = arg_81_0.cloudRects[iter_81_1]
		local var_81_3 = arg_81_0.initPositions[iter_81_1] or Vector2(0, 0)
		local var_81_4 = 30 - var_81_3.y / 20
		local var_81_5 = (arg_81_0.mapWidth + var_81_2) / var_81_4
		local var_81_6

		var_81_6 = LeanTween.moveX(iter_81_2, arg_81_0.mapWidth, var_81_5):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function()
			var_81_2 = arg_81_0.cloudRects[iter_81_1]
			iter_81_2.anchoredPosition = Vector2(-var_81_2, var_81_3.y)

			var_81_6:setFrom(-var_81_2):setTime((arg_81_0.mapWidth + var_81_2) / var_81_4)
		end))
		var_81_6.passed = math.random() * var_81_5
		arg_81_0.cloudTimer[iter_81_1] = var_81_6.uniqueId
	end
end

function var_0_0.RefreshMapBG(arg_83_0)
	arg_83_0:PlayBGM()
	arg_83_0:SwitchMapBG(arg_83_0.contextData.map, nil, true)
end

function var_0_0.updateCouldAnimator(arg_84_0, arg_84_1, arg_84_2)
	if not arg_84_1 then
		return
	end

	local var_84_0 = arg_84_0.contextData.map:getConfig("ani_controller")

	local function var_84_1(arg_85_0)
		arg_85_0 = tf(arg_85_0)

		local var_85_0 = Vector3.one

		if arg_85_0.rect.width > 0 and arg_85_0.rect.height > 0 then
			var_85_0.x = arg_85_0.parent.rect.width / arg_85_0.rect.width
			var_85_0.y = arg_85_0.parent.rect.height / arg_85_0.rect.height
		end

		arg_85_0.localScale = var_85_0

		if var_84_0 and #var_84_0 > 0 then
			local var_85_1 = getProxy(ChapterProxy)

			;(function()
				for iter_86_0, iter_86_1 in ipairs(var_84_0) do
					local var_86_0 = false
					local var_86_1 = iter_86_1[2][1]

					for iter_86_2, iter_86_3 in ipairs(var_86_1) do
						local var_86_2 = var_85_1:GetChapterItemById(iter_86_3)

						if var_86_2 and var_86_2:isClear() then
							var_86_0 = true

							break
						end
					end

					if iter_86_1[1] == var_0_2 then
						local var_86_3 = _.rest(iter_86_1[2], 2)

						for iter_86_4, iter_86_5 in ipairs(var_86_3) do
							local var_86_4 = arg_85_0:Find(iter_86_5)

							if not IsNil(var_86_4) and not var_86_0 then
								setActive(var_86_4, false)
							end
						end
					elseif iter_86_1[1] == var_0_3 then
						local var_86_5 = _.rest(iter_86_1[2], 2)

						for iter_86_6, iter_86_7 in ipairs(var_86_5) do
							local var_86_6 = arg_85_0:Find(iter_86_7)

							if not IsNil(var_86_6) and not var_86_0 then
								setActive(var_86_6, true)

								return
							end
						end
					elseif iter_86_1[1] == var_0_4 then
						local var_86_7 = _.rest(iter_86_1[2], 2)

						for iter_86_8, iter_86_9 in ipairs(var_86_7) do
							local var_86_8 = arg_85_0:Find(iter_86_9)

							if not IsNil(var_86_8) and not var_86_0 then
								setActive(var_86_8, true)
							end
						end
					end
				end
			end)()
		end
	end

	local var_84_2 = arg_84_0.loader:GetPrefab("ui/" .. arg_84_1, arg_84_1, function(arg_87_0)
		arg_87_0:SetActive(true)

		local var_87_0 = arg_84_0.mapTFs[arg_84_2]

		setParent(arg_87_0, var_87_0)
		pg.ViewUtils.SetSortingOrder(arg_87_0, ChapterConst.LayerWeightMap + arg_84_2 * 2 - 1)
		var_84_1(arg_87_0)
	end)

	table.insert(arg_84_0.mapGroup, var_84_2)
end

function var_0_0.HideBtns(arg_88_0)
	setActive(arg_88_0.btnPrev, false)
	setActive(arg_88_0.eliteQuota, false)
	setActive(arg_88_0.escortBar, false)
	setActive(arg_88_0.skirmishBar, false)
	setActive(arg_88_0.normalBtn, false)
	setActive(arg_88_0.actNormalBtn, false)
	setActive(arg_88_0.eliteBtn, false)
	setActive(arg_88_0.actEliteBtn, false)
	setActive(arg_88_0.actExtraBtn, false)
	setActive(arg_88_0.remasterBtn, false)
	setActive(arg_88_0.btnNext, false)
	setActive(arg_88_0.remasterAwardBtn, false)
	setActive(arg_88_0.eventContainer, false)
	setActive(arg_88_0.activityBtn, false)
	setActive(arg_88_0.ptTotal, false)
	setActive(arg_88_0.ticketTxt.parent, false)
	setActive(arg_88_0.countDown, false)
	setActive(arg_88_0.actAtelierBuffBtn, false)
	setActive(arg_88_0.actAtelierYumiaBuffBtn, false)
	setActive(arg_88_0.actExtraRank, false)
	setActive(arg_88_0.actExchangeShopBtn, false)
	setActive(arg_88_0.mapHelpBtn, false)
end

function var_0_0.updateDifficultyBtns(arg_89_0)
	local var_89_0 = arg_89_0.contextData.map:getConfig("type")

	setActive(arg_89_0.normalBtn, var_89_0 == Map.ELITE)
	setActive(arg_89_0.eliteQuota, var_89_0 == Map.ELITE)
	setActive(arg_89_0.eliteBtn, var_89_0 == Map.SCENARIO)

	local var_89_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID)

	setActive(arg_89_0.eliteBtn:Find("pic_activity"), var_89_1 and not var_89_1:isEnd())
end

function var_0_0.updateActivityBtns(arg_90_0)
	local var_90_0 = arg_90_0.contextData.map
	local var_90_1, var_90_2 = var_90_0:isActivity()
	local var_90_3 = var_90_0:isRemaster()
	local var_90_4 = var_90_0:isSkirmish()
	local var_90_5 = var_90_0:isEscort()
	local var_90_6 = var_90_0:getConfig("type")
	local var_90_7 = setmetatable({}, MainActMapBtn)
	local var_90_8 = var_90_7:InShowTime() and not var_90_1 and not var_90_4 and not var_90_5

	arg_90_0.activityBtnLinkAct = var_90_7:GetActivity()

	if var_90_8 then
		var_90_7.image = arg_90_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_90_7.subImage = arg_90_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_90_7.tipTr = arg_90_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_90_7.tipTxt = arg_90_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_90_8 = var_90_7:InShowTime()

		if var_90_8 then
			var_90_7:InitTipImage()
			var_90_7:InitSubImage()
			var_90_7:InitImage(function()
				return
			end)
			var_90_7:OnInit()
		end
	end

	setActive(arg_90_0.activityBtn, var_90_8)
	arg_90_0:updateRemasterInfo()

	if var_90_1 and var_90_2 then
		local var_90_9

		if var_90_0:isRemaster() then
			var_90_9 = getProxy(ChapterProxy):getRemasterMaps(var_90_0.remasterId)
		else
			var_90_9 = getProxy(ChapterProxy):getMapsByActivities(var_90_0:getConfig("on_activity"))
		end

		local var_90_10 = underscore.any(var_90_9, function(arg_92_0)
			return arg_92_0:isActExtra()
		end)

		setActive(arg_90_0.actExtraBtn, var_90_10 and var_90_6 ~= Map.ACT_EXTRA)

		if isActive(arg_90_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_90_9, function(arg_93_0)
				local var_93_0 = arg_93_0:getMapType()

				return var_93_0 == Map.ACTIVITY_EASY or var_93_0 == Map.ACTIVITY_HARD
			end), function(arg_94_0)
				return arg_94_0:isAllChaptersClear()
			end) then
				setActive(arg_90_0.actExtraBtnAnim, true)
			else
				setActive(arg_90_0.actExtraBtnAnim, false)
			end

			setActive(arg_90_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive(var_90_0:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_90_11 = checkExist(var_90_0:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_90_0.actEliteBtn, var_90_11 and var_90_6 ~= Map.ACTIVITY_HARD)
		setActive(arg_90_0.actNormalBtn, var_90_6 ~= Map.ACTIVITY_EASY)
		setActive(arg_90_0.actExtraRank, var_90_6 == Map.ACT_EXTRA and _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK), function(arg_95_0)
			if not arg_95_0 or arg_95_0:isEnd() then
				return
			end

			local var_95_0 = arg_95_0:getConfig("config_data")[1]

			return _.any(var_90_0:getChapters(), function(arg_96_0)
				if not arg_96_0:IsEXChapter() then
					return false
				end

				return table.contains(arg_96_0:getConfig("boss_expedition_id"), var_95_0)
			end)
		end))
		setActive(arg_90_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_90_3 and var_90_2 and arg_90_0:IsActShopActive())

		local var_90_12 = arg_90_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_90_0.contextData.map:getConfig("on_activity")) or nil
		local var_90_13 = var_90_12 and var_90_12:GetConfigClientPTActivity() or nil

		arg_90_0:updatePtActivity(var_90_13)
		setActive(arg_90_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_90_3 and var_90_2 and arg_90_0.ptActivity and not arg_90_0.ptActivity:isEnd())
	else
		setActive(arg_90_0.actExtraBtn, false)
		setActive(arg_90_0.actEliteBtn, false)
		setActive(arg_90_0.actNormalBtn, false)
		setActive(arg_90_0.actExtraRank, false)
		setActive(arg_90_0.actExchangeShopBtn, false)
		setActive(arg_90_0.actAtelierBuffBtn, false)
		setActive(arg_90_0.actAtelierYumiaBuffBtn, false)
		setActive(arg_90_0.ptTotal, false)
	end

	setActive(arg_90_0.eventContainer, (not var_90_1 or not var_90_2) and not var_90_5)
	setActive(arg_90_0.remasterBtn, OPEN_REMASTER and (var_90_3 or not var_90_1 and not var_90_5 and not var_90_4))
	setActive(arg_90_0.ticketTxt.parent, var_90_3)
	arg_90_0:updateRemasterTicket()
	arg_90_0:updateCountDown()
end

function var_0_0.updateRemasterTicket(arg_97_0)
	setText(arg_97_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_97_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_98_0)
	local var_98_0 = getProxy(ChapterProxy)
	local var_98_1 = var_98_0:ifShowRemasterTip() or var_98_0:anyRemasterAwardCanReceive()

	SetActive(arg_98_0.remasterBtn:Find("tip"), var_98_1)
	SetActive(arg_98_0.entranceLayer:Find("btns/btn_remaster/tip"), var_98_1)
end

function var_0_0.updatDailyBtnTip(arg_99_0)
	local var_99_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_99_0.dailyBtn:Find("tip"), var_99_0)
	SetActive(arg_99_0.entranceLayer:Find("btns/btn_daily/tip"), var_99_0)
end

function var_0_0.updateRemasterInfo(arg_100_0)
	arg_100_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_100_0.contextData.map then
		return
	end

	local var_100_0 = getProxy(ChapterProxy)
	local var_100_1 = arg_100_0.contextData.map:getRemaster()
	local var_100_2 = BossRushChapterRemasterHelper.ChapterAwardInfo(var_100_1)

	setActive(arg_100_0.remasterAwardBtn, var_100_2)

	if var_100_2 then
		local var_100_3 = var_100_2[1]
		local var_100_4, var_100_5, var_100_6, var_100_7, var_100_8 = unpack(var_100_2[2])
		local var_100_9 = var_100_2[3]
		local var_100_10 = var_100_0:getRemasterInfo(var_100_9, var_100_4, var_100_3)

		setText(arg_100_0.remasterAwardBtn:Find("Text"), var_100_10.count .. "/" .. var_100_7)
		updateDrop(arg_100_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_100_5,
			id = var_100_6
		})
		setActive(arg_100_0.remasterAwardBtn:Find("tip"), var_100_7 <= var_100_10.count)
		onButton(arg_100_0, arg_100_0.remasterAwardBtn, function()
			local var_101_0 = BossRushChapterRemasterHelper.GetAwardName(var_100_9, var_100_4)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_100_5,
					id = var_100_6
				},
				remaster = {
					word = i18n("level_remaster_tip4", var_101_0),
					number = var_100_10.count .. "/" .. var_100_7,
					btn_text = i18n(var_100_10.count < var_100_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_100_10.count < var_100_7 then
							if var_100_9 and var_100_9 > 0 then
								arg_100_0:emit(LevelMediator2.ON_BOSSRUSH_REMASTER_ACTIVITY, var_100_9)

								return
							end

							local var_102_0 = pg.chapter_template[var_100_4].map
							local var_102_1, var_102_2 = var_100_0:getMapById(var_102_0):isUnlock()

							if not var_102_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_102_2)
							else
								arg_100_0:ShowSelectedMap(var_102_0)
							end
						else
							arg_100_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_100_4, var_100_3, var_100_9)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_103_0)
	local var_103_0 = getProxy(ChapterProxy)

	if arg_103_0.newChapterCDTimer then
		arg_103_0.newChapterCDTimer:Stop()

		arg_103_0.newChapterCDTimer = nil
	end

	local var_103_1 = 0

	if arg_103_0.contextData.map:isActivity() and not arg_103_0.contextData.map:isRemaster() then
		local var_103_2 = var_103_0:getMapsByActivities(arg_103_0.contextData.map:getConfig("on_activity"))

		_.each(var_103_2, function(arg_104_0)
			local var_104_0 = arg_104_0:getChapterTimeLimit()

			if var_103_1 == 0 then
				var_103_1 = var_104_0
			else
				var_103_1 = math.min(var_103_1, var_104_0)
			end
		end)
		setActive(arg_103_0.countDown, var_103_1 > 0)
		setText(arg_103_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_103_0.countDown, false)
	end

	if var_103_1 > 0 then
		setText(arg_103_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_103_1))

		arg_103_0.newChapterCDTimer = Timer.New(function()
			var_103_1 = var_103_1 - 1

			if var_103_1 <= 0 then
				arg_103_0:updateCountDown()

				if not arg_103_0.contextData.chapterVO then
					arg_103_0:setMap(arg_103_0.contextData.mapIdx)
				end
			else
				setText(arg_103_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_103_1))
			end
		end, 1, -1)

		arg_103_0.newChapterCDTimer:Start()
	else
		setText(arg_103_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_106_0)
	onButton(arg_106_0, arg_106_0.actExtraRank, function()
		if arg_106_0:isfrozen() then
			return
		end

		arg_106_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_106_0, arg_106_0.activityBtn, function()
		if arg_106_0:isfrozen() then
			return
		end

		if arg_106_0.activityBtnLinkAct then
			local var_108_0 = arg_106_0.activityBtnLinkAct:getConfig("type")
			local var_108_1 = arg_106_0.activityBtnLinkAct.id

			if var_108_0 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)

				return
			elseif var_108_0 == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_DAL_COLLAB)

				return
			elseif var_108_1 == ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.OTHERWORLD_MAP)

				return
			elseif var_108_0 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ZHANG_WU_BOSS)

				return
			end
		end

		arg_106_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_106_0, arg_106_0.actExchangeShopBtn, function()
		if arg_106_0:isfrozen() then
			return
		end

		arg_106_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_106_0, arg_106_0.actAtelierBuffBtn, function()
		if arg_106_0:isfrozen() then
			return
		end

		arg_106_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)
	onButton(arg_106_0, arg_106_0.actAtelierYumiaBuffBtn, function()
		if arg_106_0:isfrozen() then
			return
		end

		arg_106_0:emit(LevelMediator2.SHOW_ATELIER_BUFF, true)
	end, SFX_UI_CLICK)

	local var_106_0 = getProxy(ChapterProxy)

	local function var_106_1(arg_112_0, arg_112_1, arg_112_2)
		local var_112_0

		if arg_112_0:isRemaster() then
			var_112_0 = var_106_0:getRemasterMaps(arg_112_0.remasterId)
		else
			var_112_0 = var_106_0:getMapsByActivities(arg_112_0:getConfig("on_activity"))
		end

		local var_112_1 = _.select(var_112_0, function(arg_113_0)
			return arg_113_0:getMapType() == arg_112_1
		end)

		table.sort(var_112_1, function(arg_114_0, arg_114_1)
			return arg_114_0.id < arg_114_1.id
		end)

		local var_112_2 = table.indexof(underscore.map(var_112_1, function(arg_115_0)
			return arg_115_0.id
		end), arg_112_2) or #var_112_1

		while not var_112_1[var_112_2]:isUnlock() do
			if var_112_2 > 1 then
				var_112_2 = var_112_2 - 1
			else
				break
			end
		end

		return var_112_1[var_112_2]
	end

	arg_106_0:bind(LevelUIConst.SWITCH_ACT_MAP, function(arg_116_0, arg_116_1, arg_116_2)
		arg_116_2 = arg_116_2 or switch(arg_116_1, {
			[Map.ACTIVITY_EASY] = function()
				return arg_106_0.contextData.map:getBindMapId()
			end,
			[Map.ACTIVITY_HARD] = function()
				return arg_106_0.contextData.map:getBindMapId()
			end,
			[Map.ACT_EXTRA] = function()
				return PlayerPrefs.GetInt("ex_mapId", 0)
			end
		})

		local var_116_0 = var_106_1(arg_106_0.contextData.map, arg_116_1, arg_116_2)
		local var_116_1, var_116_2 = var_116_0:isUnlock()

		if var_116_1 then
			arg_106_0:setMap(var_116_0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_116_2)
		end
	end)
	onButton(arg_106_0, arg_106_0.actNormalBtn, function()
		if arg_106_0:isfrozen() then
			return
		end

		arg_106_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
	onButton(arg_106_0, arg_106_0.actEliteBtn, function()
		if arg_106_0:isfrozen() then
			return
		end

		arg_106_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(arg_106_0, arg_106_0.actExtraBtn, function()
		if arg_106_0:isfrozen() then
			return
		end

		arg_106_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACT_EXTRA)
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_123_0, arg_123_1)
	arg_123_0.initPositions = {}

	local var_123_0 = arg_123_1 or 1
	local var_123_1 = pg.expedition_data_by_map[var_123_0].clouds_pos

	for iter_123_0, iter_123_1 in ipairs(arg_123_0.cloudRTFs) do
		local var_123_2 = var_123_1[iter_123_0]

		if var_123_2 then
			iter_123_1.anchoredPosition = Vector2(var_123_2[1], var_123_2[2])

			table.insert(arg_123_0.initPositions, iter_123_1.anchoredPosition)
		else
			setActive(iter_123_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_124_0, arg_124_1, arg_124_2)
	onButton(arg_124_0, arg_124_1, function()
		if arg_124_0:isfrozen() then
			return
		end

		local var_125_0 = arg_124_0.contextData.mapIdx + arg_124_2
		local var_125_1 = getProxy(ChapterProxy):getMapById(var_125_0)

		if not var_125_1 then
			return
		end

		if var_125_1:getMapType() == Map.ELITE and not var_125_1:isEliteEnabled() then
			var_125_1 = var_125_1:getBindMap()
			var_125_0 = var_125_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_125_2, var_125_3 = var_125_1:isUnlock()

		if arg_124_2 > 0 and not var_125_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_125_3)

			return
		end

		arg_124_0:setMap(var_125_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_126_0, arg_126_1, arg_126_2)
	seriesAsync({
		function(arg_127_0)
			if arg_126_0.contextData.entranceStatus then
				arg_126_0:frozen()

				arg_126_0.nextPreloadMap = arg_126_1

				arg_126_0:PreloadLevelMainUI(arg_126_1, function()
					arg_126_0:unfrozen()

					if arg_126_0.nextPreloadMap ~= arg_126_1 then
						return
					end

					arg_126_0:ShowEntranceUI(false)
					arg_126_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_126_1)
					arg_127_0()
				end)
			else
				arg_126_0:setMap(arg_126_1)
				arg_127_0()
			end
		end
	}, arg_126_2)
end

function var_0_0.setMap(arg_129_0, arg_129_1)
	local var_129_0 = arg_129_0.contextData.mapIdx

	arg_129_0.contextData.mapIdx = arg_129_1
	arg_129_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_129_1)

	assert(arg_129_0.contextData.map, "map cannot be nil " .. arg_129_1)

	if arg_129_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_129_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_129_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_129_0.contextData.map.remasterId, arg_129_1)
		PlayerPrefs.Save()
	end

	arg_129_0:RecordLastMapOnExit()
	arg_129_0:updateMap(var_129_0)
	arg_129_0:tryPlayMapStory()
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

function var_0_0.SwitchMapBuilder(arg_130_0, arg_130_1)
	if arg_130_0.mapBuilder and arg_130_0.mapBuilder:GetType() ~= arg_130_1 then
		arg_130_0.mapBuilder.buffer:Hide()
	end

	local var_130_0 = arg_130_0:GetMapBuilderInBuffer(arg_130_1)

	arg_130_0.mapBuilder = var_130_0

	var_130_0.buffer:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_131_0, arg_131_1)
	if not arg_131_0.mbDict[arg_131_1] then
		local var_131_0 = _G[var_0_6[arg_131_1]]

		assert(var_131_0, "Missing MapBuilder of type " .. (arg_131_1 or "NIL"))

		arg_131_0.mbDict[arg_131_1] = var_131_0.New(arg_131_0._tf, arg_131_0)
		arg_131_0.mbDict[arg_131_1].isFrozen = arg_131_0:isfrozen()

		arg_131_0.mbDict[arg_131_1]:Load()
	end

	return arg_131_0.mbDict[arg_131_1]
end

function var_0_0.updateMap(arg_132_0, arg_132_1)
	local var_132_0 = arg_132_0.contextData.map
	local var_132_1 = var_132_0:getConfig("anchor")
	local var_132_2

	if var_132_1 == "" then
		var_132_2 = Vector2(0.5, 0.5)
	else
		var_132_2 = Vector2(unpack(var_132_1))
	end

	arg_132_0.map.pivot = var_132_2

	local var_132_3 = var_132_0:getConfig("uifx")

	for iter_132_0 = 1, arg_132_0.UIFXList.childCount do
		local var_132_4 = arg_132_0.UIFXList:GetChild(iter_132_0 - 1)

		setActive(var_132_4, var_132_4.name == var_132_3)
	end

	arg_132_0:SwitchMapBG(var_132_0, arg_132_1)
	arg_132_0:PlayBGM()

	local var_132_5 = arg_132_0.contextData.map:getConfig("ui_type")

	arg_132_0:SwitchMapBuilder(var_132_5)
	seriesAsync({
		function(arg_133_0)
			arg_132_0.mapBuilder:CallbackInvoke(arg_133_0)
		end,
		function(arg_134_0)
			arg_132_0.mapBuilder:UpdateMapVO(var_132_0)
			arg_132_0.mapBuilder:UpdateView()
			arg_132_0.mapBuilder:UpdateMapItems()
			arg_132_0.mapBuilder:PlayEnterAnim()
		end
	})

	local var_132_6 = table.keyof(LevelTools.GetSuggestionMapIDList(var_132_0.id), var_132_0.id)

	setActive(arg_132_0.suggestionBtn, var_132_6 ~= nil)
end

function var_0_0.UpdateSwitchMapButton(arg_135_0)
	local var_135_0 = arg_135_0.contextData.map
	local var_135_1 = getProxy(ChapterProxy)
	local var_135_2 = var_135_1:getMapById(var_135_0.id - 1)
	local var_135_3 = var_135_1:getMapById(var_135_0.id + 1)

	setActive(arg_135_0.btnPrev, tobool(var_135_2))
	setActive(arg_135_0.btnNext, tobool(var_135_3))

	local var_135_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_135_0.btnPrevCol, var_135_2 and Color.white or var_135_4)
	setImageColor(arg_135_0.btnNextCol, var_135_3 and var_135_3:isUnlock() and Color.white or var_135_4)
end

function var_0_0.tryPlayMapStory(arg_136_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_137_0)
			local var_137_0 = arg_136_0.contextData.map:getConfig("enter_story")

			if var_137_0 and var_137_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_137_0) and not arg_136_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_137_1 = tonumber(var_137_0)

				if var_137_1 and var_137_1 > 0 then
					arg_136_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_137_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_137_0, arg_137_0)
				end

				return
			end

			arg_137_0()
		end,
		function(arg_138_0)
			local var_138_0 = arg_136_0.contextData.map:getConfig("guide_id")

			if var_138_0 and var_138_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_138_0, nil, arg_138_0)

				return
			end

			arg_138_0()
		end,
		function(arg_139_0)
			if arg_136_0.actAtelierBuffBtn ~= nil and isActive(arg_136_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_139_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_139_1

				if var_139_0 then
					var_139_1 = {
						1,
						2
					}
				else
					var_139_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_139_1)
			else
				arg_139_0()
			end
		end,
		function(arg_140_0)
			if arg_136_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_136_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	arg_141_0.uiAnims = arg_141_0.uiAnims or {}

	local var_141_0 = arg_141_0.uiAnims[arg_141_1]

	local function var_141_1()
		arg_141_0.playing = true

		arg_141_0:frozen()
		var_141_0:SetActive(true)

		local var_142_0 = tf(var_141_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_142_0)

		if arg_141_3 then
			arg_141_3(var_141_0)
		end

		var_142_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_143_0)
			arg_141_0.playing = false

			if arg_141_2 then
				arg_141_2(var_141_0)
			end

			arg_141_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_141_0 then
		PoolMgr.GetInstance():GetUI(arg_141_1, true, function(arg_144_0)
			arg_144_0:SetActive(true)

			arg_141_0.uiAnims[arg_141_1] = arg_144_0
			var_141_0 = arg_141_0.uiAnims[arg_141_1]

			var_141_1()
		end)
	else
		var_141_1()
	end
end

function var_0_0.displaySpResult(arg_145_0, arg_145_1, arg_145_2)
	setActive(arg_145_0.spResult, true)
	arg_145_0:DisplaySPAnim(arg_145_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_146_0)
		onButton(arg_145_0, arg_146_0, function()
			removeOnButton(arg_146_0)
			setActive(arg_146_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_146_0, arg_145_0._tf)
			arg_145_0:hideSpResult()
			arg_145_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_148_0)
	setActive(arg_148_0.spResult, false)
end

function var_0_0.displayBombResult(arg_149_0, arg_149_1)
	setActive(arg_149_0.spResult, true)
	arg_149_0:DisplaySPAnim("SpBombRet", function(arg_150_0)
		onButton(arg_149_0, arg_150_0, function()
			removeOnButton(arg_150_0)
			setActive(arg_150_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_150_0, arg_149_0._tf)
			arg_149_0:hideSpResult()
			arg_149_1()
		end, SFX_PANEL)
	end, function(arg_152_0)
		setText(arg_152_0.transform:Find("right/name_bg/en"), arg_149_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_153_0, arg_153_1, arg_153_2)
	arg_153_0.contextData.chapterLoopFlag = arg_153_2

	local var_153_0 = getProxy(ChapterProxy):getChapterById(arg_153_1, true)

	if var_153_0:getConfig("type") == Chapter.CustomFleet then
		arg_153_0:displayFleetEdit(var_153_0)

		return
	end

	if #var_153_0:getNpcShipByType(1) > 0 then
		arg_153_0:emit(LevelMediator2.ON_TRACKING, arg_153_1)

		return
	end

	arg_153_0:displayFleetSelect(var_153_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_154_0, arg_154_1, arg_154_2)
	seriesAsync({
		function(arg_155_0)
			if not arg_154_0.levelInfoView:GetLoaded() then
				arg_154_0:frozen()
				arg_154_0.levelInfoView:Load()
				arg_154_0.levelInfoView:CallbackInvoke(function()
					arg_154_0:unfrozen()
					arg_155_0()
				end)

				return
			end

			arg_155_0()
		end,
		function(arg_157_0)
			local function var_157_0(arg_158_0, arg_158_1)
				arg_154_0:hideChapterPanel()
				arg_154_0:OnLevelInfoPanelConfirm(arg_158_0, arg_158_1)
			end

			local function var_157_1()
				arg_154_0:hideChapterPanel()
			end

			local var_157_2 = getProxy(ChapterProxy):getChapterById(arg_154_1, true)

			if getProxy(ChapterProxy):getMapById(var_157_2:getConfig("map")):isSkirmish() and #var_157_2:getNpcShipByType(1) > 0 then
				var_157_0(false)

				return
			end

			arg_154_0.levelInfoView:set(arg_154_1, arg_154_2)
			arg_154_0.levelInfoView:setCBFunc(var_157_0, var_157_1)
			arg_154_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_160_0)
	if arg_160_0.levelInfoView:isShowing() then
		arg_160_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_161_0)
	arg_161_0.levelInfoView:Destroy()

	arg_161_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_162_0, arg_162_1, arg_162_2, arg_162_3)
	seriesAsync({
		function(arg_163_0)
			if not arg_162_0.levelInfoSPView then
				arg_162_0.levelInfoSPView = LevelInfoSPView.New(arg_162_0.topPanel, arg_162_0.event, arg_162_0.contextData)

				arg_162_0.levelInfoSPView:RegisterView(arg_162_0)
				arg_162_0:frozen()
				arg_162_0.levelInfoSPView:Load()
				arg_162_0.levelInfoSPView:CallbackInvoke(function()
					arg_162_0:unfrozen()
					arg_163_0()
				end)

				return
			end

			arg_163_0()
		end,
		function(arg_165_0)
			local function var_165_0(arg_166_0, arg_166_1)
				arg_162_0:HideLevelInfoSPPanel()
				arg_162_0:OnLevelInfoPanelConfirm(arg_166_0, arg_166_1)
			end

			local function var_165_1()
				arg_162_0:HideLevelInfoSPPanel()
			end

			arg_162_0.levelInfoSPView:SetChapterGroupInfo(arg_162_2)
			arg_162_0.levelInfoSPView:set(arg_162_1, arg_162_3)
			arg_162_0.levelInfoSPView:setCBFunc(var_165_0, var_165_1)
			arg_162_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_168_0)
	if arg_168_0.levelInfoSPView and arg_168_0.levelInfoSPView:isShowing() then
		arg_168_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_169_0)
	if not arg_169_0.levelInfoSPView then
		return
	end

	arg_169_0.levelInfoSPView:Destroy()

	arg_169_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_170_0, arg_170_1)
	local var_170_0 = arg_170_0.contextData.selectedFleetIDs or arg_170_1:GetDefaultFleetIndex()

	arg_170_1 = Clone(arg_170_1)
	arg_170_1.loopFlag = arg_170_0.contextData.chapterLoopFlag

	arg_170_0.levelFleetView:updateSpecialOperationTickets(arg_170_0.spTickets)
	arg_170_0.levelFleetView:Load()
	arg_170_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_170_0.shipVOs)
	arg_170_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_170_0.openedCommanerSystem)
	arg_170_0.levelFleetView:ActionInvoke("set", arg_170_1, arg_170_0.fleets, var_170_0)
	arg_170_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_171_0)
	if arg_171_0.levelCMDFormationView:isShowing() then
		arg_171_0.levelCMDFormationView:Hide()
	end

	if arg_171_0.levelFleetView then
		arg_171_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_172_0)
	arg_172_0.levelCMDFormationView = LevelCMDFormationView.New(arg_172_0.topPanel, arg_172_0.event, arg_172_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_173_0)
	if not arg_173_0.levelFleetView then
		return
	end

	arg_173_0.levelFleetView:Destroy()

	arg_173_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_174_0, arg_174_1)
	arg_174_1 = Clone(arg_174_1)
	arg_174_1.loopFlag = arg_174_0.contextData.chapterLoopFlag

	arg_174_0.levelFleetView:updateSpecialOperationTickets(arg_174_0.spTickets)
	arg_174_0.levelFleetView:Load()
	arg_174_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_174_0.openedCommanerSystem)
	arg_174_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_174_0.shipVOs)
	arg_174_0.levelFleetView:ActionInvoke("setOnHard", arg_174_1)
	arg_174_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_175_0)
	arg_175_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_176_0)
	arg_176_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_177_0, arg_177_1)
	if not arg_177_0.levelFleetView then
		return
	end

	assert(arg_177_0.levelFleetView:GetLoaded())

	local var_177_0 = arg_177_0.levelFleetView:IsSelectMode()
	local var_177_1

	if var_177_0 then
		arg_177_0.levelFleetView:ActionInvoke("set", arg_177_1 or arg_177_0.levelFleetView.chapter, arg_177_0.fleets, arg_177_0.levelFleetView:getSelectIds())

		if arg_177_0.levelCMDFormationView:isShowing() then
			local var_177_2 = arg_177_0.levelCMDFormationView.fleet.id

			var_177_1 = arg_177_0.fleets[var_177_2]
		end
	else
		arg_177_0.levelFleetView:ActionInvoke("setOnHard", arg_177_1 or arg_177_0.levelFleetView.chapter)

		if arg_177_0.levelCMDFormationView:isShowing() then
			local var_177_3 = arg_177_0.levelCMDFormationView.fleet.id

			var_177_1 = arg_177_1:wrapEliteFleet(var_177_3)
		end
	end

	if var_177_1 then
		arg_177_0.levelCMDFormationView:ActionInvoke("updateFleet", var_177_1)
	end
end

function var_0_0.setChapter(arg_178_0, arg_178_1)
	local var_178_0

	if arg_178_1 then
		var_178_0 = arg_178_1.id
	end

	arg_178_0.contextData.chapterId = var_178_0
	arg_178_0.contextData.chapterVO = arg_178_1
end

function var_0_0.switchToChapter(arg_179_0, arg_179_1)
	if not ResList.ChapterResConst.IsActive(arg_179_1) then
		return
	end

	if arg_179_0.contextData.mapIdx ~= arg_179_1:getConfig("map") then
		arg_179_0:setMap(arg_179_1:getConfig("map"))
	end

	arg_179_0:setChapter(arg_179_1)

	arg_179_0.leftCanvasGroup.blocksRaycasts = false
	arg_179_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_179_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_179_0:DestroyLevelStageView()

	if not arg_179_0.levelStageView then
		arg_179_0.levelStageView = LevelStageView.New(arg_179_0.topPanel, arg_179_0.event, arg_179_0.contextData)

		arg_179_0.levelStageView:Load()

		arg_179_0.levelStageView.isFrozen = arg_179_0:isfrozen()
	end

	arg_179_0:frozen()

	local function var_179_0()
		seriesAsync({
			function(arg_181_0)
				arg_179_0:downloadChapterRes(arg_179_1, arg_181_0)
			end,
			function(arg_182_0)
				arg_179_0.mapBuilder:CallbackInvoke(arg_182_0)
			end,
			function(arg_183_0)
				setActive(arg_179_0.clouds, false)
				arg_179_0.mapBuilder:HideFloat()
				arg_179_0:BlurPanel(arg_179_0.topPanel, {
					blurCamList = {
						pg.UIMgr.CameraUI
					}
				})
				arg_179_0.levelStageView:updateStageInfo()
				arg_179_0.levelStageView:updateAmbushRate(arg_179_1.fleet.line, true)
				arg_179_0.levelStageView:updateStageAchieve()
				arg_179_0.levelStageView:updateStageBarrier()
				arg_179_0.levelStageView:updateBombPanel()
				arg_179_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_183_0)
			end,
			function(arg_184_0)
				if arg_179_0.exited then
					return
				end

				arg_179_0.levelStageView:updateStageStrategy()

				arg_179_0.canvasGroup.blocksRaycasts = arg_179_0.frozenCount == 0

				onNextTick(arg_184_0)
			end,
			function(arg_185_0)
				if arg_179_0.exited then
					return
				end

				arg_179_0.levelStageView:updateStageFleet()
				arg_179_0.levelStageView:updateSupportFleet()
				arg_179_0.levelStageView:updateFleetBuff()
				onNextTick(arg_185_0)
			end,
			function(arg_186_0)
				if arg_179_0.exited then
					return
				end

				parallelAsync({
					function(arg_187_0)
						local var_187_0 = arg_179_1:getConfig("scale")
						local var_187_1 = LeanTween.value(go(arg_179_0.map), arg_179_0.map.localScale, Vector3.New(var_187_0[3], var_187_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_188_0)
							arg_179_0.map.localScale = arg_188_0
							arg_179_0.float.localScale = arg_188_0
						end):setOnComplete(System.Action(function()
							arg_179_0.mapBuilder:ShowFloat()
							arg_179_0.mapBuilder:Hide()
							arg_187_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_179_0:RecordTween("mapScale", var_187_1.uniqueId)

						local var_187_2 = LeanTween.value(go(arg_179_0.map), arg_179_0.map.pivot, Vector2.New(math.clamp(var_187_0[1] - 0.5, 0, 1), math.clamp(var_187_0[2] - 0.5, 0, 1)), var_0_1)

						var_187_2:setOnUpdateVector2(function(arg_190_0)
							arg_179_0.map.pivot = arg_190_0
							arg_179_0.float.pivot = arg_190_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_179_0:RecordTween("mapPivot", var_187_2.uniqueId)
						shiftPanel(arg_179_0.leftChapter, -arg_179_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_179_0.rightChapter, arg_179_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_179_0.topChapter, 0, arg_179_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_179_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_191_0)
						arg_179_0:PlayBGM()

						local var_191_0 = {}
						local var_191_1 = arg_179_1:getConfig("bg")

						if var_191_1 and #var_191_1 > 0 then
							var_191_0[1] = {
								BG = var_191_1
							}
						end

						arg_179_0:SwitchBG(var_191_0, arg_191_0)
					end
				}, function()
					onNextTick(arg_186_0)
				end)
			end,
			function(arg_193_0)
				if arg_179_0.exited then
					return
				end

				setActive(arg_179_0.topChapter, false)
				setActive(arg_179_0.leftChapter, false)
				setActive(arg_179_0.rightChapter, false)

				arg_179_0.leftCanvasGroup.blocksRaycasts = true
				arg_179_0.rightCanvasGroup.blocksRaycasts = true

				arg_179_0:initGrid(arg_193_0)
			end,
			function(arg_194_0)
				if arg_179_0.exited then
					return
				end

				arg_179_0.levelStageView:SetGrid(arg_179_0.grid)

				arg_179_0.contextData.huntingRangeVisibility = arg_179_0.contextData.huntingRangeVisibility - 1

				arg_179_0.grid:toggleHuntingRange()

				local var_194_0 = arg_179_1:getConfig("pop_pic")

				if var_194_0 and #var_194_0 > 0 and arg_179_0.FirstEnterChapter == arg_179_1.id then
					arg_179_0:doPlayAnim(var_194_0, function(arg_195_0)
						setActive(arg_195_0, false)

						if arg_179_0.exited then
							return
						end

						arg_194_0()
					end)
				else
					arg_194_0()
				end
			end,
			function(arg_196_0)
				arg_179_0.levelStageView:tryAutoAction(arg_196_0)
			end,
			function(arg_197_0)
				if arg_179_0.exited then
					return
				end

				arg_179_0:unfrozen()

				if arg_179_0.FirstEnterChapter then
					arg_179_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_179_1.subAutoAttack)
				end

				arg_179_0.FirstEnterChapter = nil

				arg_197_0()
			end,
			function(arg_198_0)
				if arg_179_1:NeedSupportSubmarineStage() then
					arg_179_0.levelStageView:TryEnterChapterSupportSubmarineStage(arg_198_0)
				else
					arg_198_0()
				end
			end
		}, function()
			arg_179_0.levelStageView:tryAutoTrigger(true)
		end)
	end

	arg_179_0.levelStageView:ActionInvoke("SetSeriesOperation", var_179_0)
	arg_179_0.levelStageView:ActionInvoke("SetPlayer", arg_179_0.player)
	arg_179_0.levelStageView:ActionInvoke("SwitchToChapter", arg_179_1)
end

function var_0_0.switchToMap(arg_200_0, arg_200_1)
	arg_200_0:frozen()
	arg_200_0:destroyGrid()
	arg_200_0:setChapter(nil)
	LeanTween.cancel(go(arg_200_0.map))

	local var_200_0 = LeanTween.value(go(arg_200_0.map), arg_200_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_201_0)
		arg_200_0.map.localScale = arg_201_0
		arg_200_0.float.localScale = arg_201_0
	end):setOnComplete(System.Action(function()
		arg_200_0:unfrozen()
		arg_200_0.mapBuilder:PlayEnterAnim()
		existCall(arg_200_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_200_0:RecordTween("mapScale", var_200_0.uniqueId)

	local var_200_1 = arg_200_0.contextData.map:getConfig("anchor")
	local var_200_2

	if var_200_1 == "" then
		var_200_2 = Vector2(0.5, 0.5)
	else
		var_200_2 = Vector2(unpack(var_200_1))
	end

	local var_200_3 = LeanTween.value(go(arg_200_0.map), arg_200_0.map.pivot, var_200_2, var_0_1)

	var_200_3:setOnUpdateVector2(function(arg_203_0)
		arg_200_0.map.pivot = arg_203_0
		arg_200_0.float.pivot = arg_203_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_200_0:RecordTween("mapPivot", var_200_3.uniqueId)
	setActive(arg_200_0.topChapter, true)
	setActive(arg_200_0.leftChapter, true)
	setActive(arg_200_0.rightChapter, true)
	shiftPanel(arg_200_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_200_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_200_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_200_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_200_0.levelStageView then
		arg_200_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_200_0:DestroyLevelStageView()
		end)
		arg_200_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_200_0:SwitchMapBG(arg_200_0.contextData.map)
	arg_200_0:PlayBGM()
	seriesAsync({
		function(arg_205_0)
			arg_200_0.mapBuilder:CallbackInvoke(arg_205_0)
		end,
		function(arg_206_0)
			arg_200_0.mapBuilder:Show()
			arg_200_0.mapBuilder:UpdateView()
			arg_200_0.mapBuilder:UpdateMapItems()
		end
	})
	arg_200_0:UnOverlayPanel(arg_200_0.topPanel, arg_200_0._tf)

	arg_200_0.canvasGroup.blocksRaycasts = arg_200_0.frozenCount == 0
	arg_200_0.canvasGroup.interactable = true

	if arg_200_0.ambushWarning and arg_200_0.ambushWarning.activeSelf then
		arg_200_0.ambushWarning:SetActive(false)
		arg_200_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_207_0, arg_207_1, arg_207_2, arg_207_3)
	if not arg_207_1 or #arg_207_1 <= 0 then
		existCall(arg_207_2)

		return
	elseif arg_207_3 then
		-- block empty
	elseif table.equal(arg_207_0.currentBG, arg_207_1) then
		return
	end

	arg_207_0.currentBG = arg_207_1

	for iter_207_0, iter_207_1 in ipairs(arg_207_0.mapGroup) do
		arg_207_0.loader:ClearRequest(iter_207_1)
	end

	table.clear(arg_207_0.mapGroup)

	local var_207_0 = {}

	table.ParallelIpairsAsync(arg_207_1, function(arg_208_0, arg_208_1, arg_208_2)
		local var_208_0 = arg_207_0.mapTFs[arg_208_0]
		local var_208_1 = arg_208_1.bgPrefix and arg_208_1.bgPrefix .. "/" or "levelmap/"
		local var_208_2 = arg_207_0.loader:GetSpriteDirect(var_208_1 .. arg_208_1.BG, "", function(arg_209_0)
			var_207_0[arg_208_0] = arg_209_0

			arg_208_2()
		end, var_208_0)

		table.insert(arg_207_0.mapGroup, var_208_2)
		arg_207_0:updateCouldAnimator(arg_208_1.Animator, arg_208_0)
	end, function()
		for iter_210_0, iter_210_1 in ipairs(arg_207_0.mapTFs) do
			setImageSprite(iter_210_1, var_207_0[iter_210_0])
			setActive(iter_210_1, arg_207_1[iter_210_0])
			SetCompomentEnabled(iter_210_1, typeof(Image), true)
		end

		existCall(arg_207_2)
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

function var_0_0.ClearMapTransitions(arg_211_0)
	if not arg_211_0.mapTransitions then
		return
	end

	for iter_211_0, iter_211_1 in pairs(arg_211_0.mapTransitions) do
		if iter_211_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_211_0, iter_211_0, iter_211_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_211_0, iter_211_0)
		end
	end

	arg_211_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_212_0, arg_212_1, arg_212_2, arg_212_3)
	local var_212_0, var_212_1, var_212_2 = arg_212_0:GetMapBG(arg_212_1, arg_212_2)
	local var_212_3 = {}

	if var_212_1 then
		table.insert(var_212_3, function(arg_213_0)
			arg_212_0:PlayMapTransition("LevelMapTransition_" .. var_212_1, var_212_2, arg_213_0)
		end)
	end

	seriesAsync(var_212_3, function()
		arg_212_0:SwitchBGMapType(arg_212_1:getConfig("pos_type"))
		arg_212_0:SwitchBG(var_212_0, nil, arg_212_3)
	end)
end

function var_0_0.SwitchBGMapType(arg_215_0, arg_215_1)
	if arg_215_0.posType == arg_215_1 then
		return
	end

	for iter_215_0, iter_215_1 in ipairs({
		arg_215_0.map,
		arg_215_0.float
	}) do
		local var_215_0 = GetOrAddComponent(iter_215_1, typeof(AspectRatioFitter))

		var_215_0.aspectRatio = 1.7777777777777777
		var_215_0.enabled = arg_215_1 == 0

		if arg_215_1 == 1 then
			iter_215_1.anchorMin = Vector2(0.5, 0.5)
			iter_215_1.anchorMax = Vector2(0.5, 0.5)

			setSizeDelta(var_215_0, {
				x = 2520,
				y = 1440
			})
		end
	end
end

function var_0_0.GetMapBG(arg_216_0, arg_216_1, arg_216_2)
	if not table.contains(var_0_7, arg_216_1.id) then
		return {
			arg_216_0:GetMapElement(arg_216_1)
		}
	end

	local var_216_0 = arg_216_1.id
	local var_216_1 = table.indexof(var_0_7, var_216_0) - 1
	local var_216_2 = bit.lshift(bit.rshift(var_216_1, 1), 1) + 1
	local var_216_3 = {
		var_0_7[var_216_2],
		var_0_7[var_216_2 + 1]
	}
	local var_216_4 = _.map(var_216_3, function(arg_217_0)
		return getProxy(ChapterProxy):getMapById(arg_217_0)
	end)

	if _.all(var_216_4, function(arg_218_0)
		return arg_218_0:isAllChaptersClear()
	end) then
		local var_216_5 = {
			arg_216_0:GetMapElement(arg_216_1)
		}

		if not arg_216_2 or math.abs(var_216_0 - arg_216_2) ~= 1 then
			return var_216_5
		end

		local var_216_6 = var_0_9[bit.rshift(var_216_2 - 1, 1) + 1]
		local var_216_7 = bit.band(var_216_1, 1) == 1

		return var_216_5, var_216_6, var_216_7
	else
		local var_216_8 = 0

		;(function()
			local var_219_0 = var_216_4[1]:getChapters()

			for iter_219_0, iter_219_1 in ipairs(var_219_0) do
				if not iter_219_1:isClear() then
					return
				end

				var_216_8 = var_216_8 + 1
			end

			if not var_216_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_216_8 = var_216_8 + 1

			local var_219_1 = var_216_4[2]:getChapters()

			for iter_219_2, iter_219_3 in ipairs(var_219_1) do
				if not iter_219_3:isClear() then
					return
				end

				var_216_8 = var_216_8 + 1
			end
		end)()

		local var_216_9

		if var_216_8 > 0 then
			local var_216_10 = var_0_8[bit.rshift(var_216_2 - 1, 1) + 1]

			var_216_9 = {
				{
					BG = "map_" .. var_216_10[1],
					Animator = var_216_10[2]
				},
				{
					BG = "map_" .. var_216_10[3] + var_216_8,
					Animator = var_216_10[4]
				}
			}
		else
			var_216_9 = {
				arg_216_0:GetMapElement(arg_216_1)
			}
		end

		return var_216_9
	end
end

function var_0_0.GetMapElement(arg_220_0, arg_220_1)
	local var_220_0 = arg_220_1:getConfig("bg")
	local var_220_1 = arg_220_1:getConfig("ani_controller")

	if var_220_1 and #var_220_1 > 0 then
		(function()
			local var_221_0 = getProxy(ChapterProxy)

			for iter_221_0, iter_221_1 in ipairs(var_220_1) do
				local var_221_1 = _.rest(iter_221_1[2], 2)

				for iter_221_2, iter_221_3 in ipairs(var_221_1) do
					if string.find(iter_221_3, "^map_") and iter_221_1[1] == var_0_3 then
						local var_221_2 = iter_221_1[2][1]
						local var_221_3 = false

						for iter_221_4, iter_221_5 in ipairs(var_221_2) do
							local var_221_4 = var_221_0:GetChapterItemById(iter_221_5)

							if var_221_4 and var_221_4:isClear() then
								var_221_3 = true

								break
							end
						end

						if not var_221_3 then
							var_220_0 = iter_221_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_220_2 = {
		BG = var_220_0
	}

	var_220_2.Animator, var_220_2.AnimatorController = arg_220_0:GetMapAnimator(arg_220_1)

	return var_220_2
end

function var_0_0.GetMapAnimator(arg_222_0, arg_222_1)
	local var_222_0 = arg_222_1:getConfig("ani_name")

	if arg_222_1:getConfig("animtor") == 1 and var_222_0 and #var_222_0 > 0 then
		local var_222_1 = arg_222_1:getConfig("ani_controller")

		if var_222_1 and #var_222_1 > 0 then
			(function()
				local var_223_0 = getProxy(ChapterProxy)

				for iter_223_0, iter_223_1 in ipairs(var_222_1) do
					local var_223_1 = _.rest(iter_223_1[2], 2)

					for iter_223_2, iter_223_3 in ipairs(var_223_1) do
						if string.find(iter_223_3, "^effect_") and iter_223_1[1] == var_0_3 then
							local var_223_2 = iter_223_1[2][1]
							local var_223_3 = false

							for iter_223_4, iter_223_5 in ipairs(var_223_2) do
								local var_223_4 = var_223_0:GetChapterItemById(iter_223_5)

								if var_223_4 and var_223_4:isClear() then
									var_223_3 = true

									break
								end
							end

							if not var_223_3 then
								var_222_0 = "map_" .. string.sub(iter_223_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_222_0, var_222_1
	end
end

function var_0_0.PlayMapTransition(arg_224_0, arg_224_1, arg_224_2, arg_224_3, arg_224_4)
	arg_224_0.mapTransitions = arg_224_0.mapTransitions or {}

	local var_224_0

	local function var_224_1()
		arg_224_0:frozen()
		existCall(arg_224_3, var_224_0)
		var_224_0:SetActive(true)

		local var_225_0 = tf(var_224_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_225_0)
		var_224_0:GetComponent(typeof(Animator)):Play(arg_224_2 and "Sequence" or "Inverted", -1, 0)
		var_225_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_226_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_225_0, arg_224_0._tf)
			existCall(arg_224_4, var_224_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_224_1, arg_224_1, var_224_0)

			arg_224_0.mapTransitions[arg_224_1] = false

			arg_224_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_224_1, arg_224_1, true, function(arg_227_0)
		var_224_0 = arg_227_0
		arg_224_0.mapTransitions[arg_224_1] = arg_227_0

		var_224_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_228_0)
	if arg_228_0.levelStageView then
		arg_228_0.levelStageView:Destroy()

		arg_228_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_229_0, arg_229_1)
	arg_229_0.levelAmbushView = LevelAmbushView.New(arg_229_0.topPanel, arg_229_0.event, arg_229_0.contextData)

	arg_229_0.levelAmbushView:Load()
	arg_229_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_229_1)
end

function var_0_0.hideAmbushInfo(arg_230_0)
	if arg_230_0.levelAmbushView then
		arg_230_0.levelAmbushView:Destroy()

		arg_230_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_231_0, arg_231_1)
	arg_231_0:frozen()

	local function var_231_0()
		arg_231_0.ambushWarning:SetActive(true)

		local var_232_0 = tf(arg_231_0.ambushWarning)

		var_232_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_232_0:SetSiblingIndex(1)

		local var_232_1 = var_232_0:GetComponent("DftAniEvent")

		var_232_1:SetTriggerEvent(function(arg_233_0)
			arg_231_1()
		end)
		var_232_1:SetEndEvent(function(arg_234_0)
			arg_231_0.ambushWarning:SetActive(false)
			arg_231_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_231_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_236_0)
			arg_236_0:SetActive(true)

			arg_231_0.ambushWarning = arg_236_0

			var_231_0()
		end)
	else
		var_231_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_237_0)
	if arg_237_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_237_0.ambushWarning)

		arg_237_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_238_0, arg_238_1)
	arg_238_0.levelStrategyView = LevelStrategyView.New(arg_238_0.topPanel, arg_238_0.event, arg_238_0.contextData)

	arg_238_0.levelStrategyView:Load()
	arg_238_0.levelStrategyView:ActionInvoke("set", arg_238_1)

	local function var_238_0()
		local var_239_0 = arg_238_0.contextData.chapterVO.fleet
		local var_239_1 = pg.strategy_data_template[arg_238_1.id]

		if not var_239_0:canUseStrategy(arg_238_1) then
			return
		end

		local var_239_2 = var_239_0:getNextStgUser(arg_238_1.id)

		if var_239_1.type == ChapterConst.StgTypeForm then
			arg_238_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_239_2,
				arg1 = arg_238_1.id
			})
		elseif var_239_1.type == ChapterConst.StgTypeConsume then
			arg_238_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_239_2,
				arg1 = arg_238_1.id
			})
		end

		arg_238_0:hideStrategyInfo()
	end

	local function var_238_1()
		arg_238_0:hideStrategyInfo()
	end

	arg_238_0.levelStrategyView:ActionInvoke("setCBFunc", var_238_0, var_238_1)
end

function var_0_0.hideStrategyInfo(arg_241_0)
	if arg_241_0.levelStrategyView then
		arg_241_0.levelStrategyView:Destroy()

		arg_241_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_242_0, arg_242_1)
	local var_242_0 = arg_242_0.contextData.chapterVO
	local var_242_1 = getProxy(ChapterProxy)
	local var_242_2
	local var_242_3
	local var_242_4
	local var_242_5
	local var_242_6 = var_242_1.repairTimes
	local var_242_7, var_242_8, var_242_9 = ChapterConst.GetRepairParams()

	arg_242_0.levelRepairView = LevelRepairView.New(arg_242_0.topPanel, arg_242_0.event, arg_242_0.contextData)

	arg_242_0.levelRepairView:Load()
	arg_242_0.levelRepairView:ActionInvoke("set", var_242_6, var_242_7, var_242_8, var_242_9)

	local function var_242_10()
		if var_242_7 - math.min(var_242_6, var_242_7) == 0 and arg_242_0.player:getTotalGem() < var_242_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_242_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_242_0.fleet.id,
			arg1 = arg_242_1.id
		})
		arg_242_0:hideRepairWindow()
	end

	local function var_242_11()
		arg_242_0:hideRepairWindow()
	end

	arg_242_0.levelRepairView:ActionInvoke("setCBFunc", var_242_10, var_242_11)
end

function var_0_0.hideRepairWindow(arg_245_0)
	if arg_245_0.levelRepairView then
		arg_245_0.levelRepairView:Destroy()

		arg_245_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_246_0, arg_246_1)
	arg_246_0.levelRemasterView:Load()

	local function var_246_0(arg_247_0)
		arg_246_0:ShowSelectedMap(arg_247_0)
	end

	arg_246_0.levelRemasterView:ActionInvoke("Show")
	arg_246_0.levelRemasterView:ActionInvoke("set", var_246_0, arg_246_1)
end

function var_0_0.hideRemasterPanel(arg_248_0)
	if arg_248_0.levelRemasterView:isShowing() then
		arg_248_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_249_0, arg_249_1)
	local var_249_0 = arg_249_0.contextData.chapterVO

	if not var_249_0 then
		return
	end

	arg_249_0:enableLevelCamera()
	setActive(arg_249_0.uiMain, true)

	arg_249_0.levelGrid.localEulerAngles = Vector3(var_249_0.theme.angle, 0, 0)
	arg_249_0.grid = LevelGrid.New(arg_249_0.dragLayer)

	arg_249_0.grid:attach(arg_249_0)
	arg_249_0.grid:ExtendItem("shipTpl", arg_249_0.shipTpl)
	arg_249_0.grid:ExtendItem("subTpl", arg_249_0.subTpl)
	arg_249_0.grid:ExtendItem("transportTpl", arg_249_0.transportTpl)
	arg_249_0.grid:ExtendItem("enemyTpl", arg_249_0.enemyTpl)
	arg_249_0.grid:ExtendItem("championTpl", arg_249_0.championTpl)
	arg_249_0.grid:ExtendItem("oniTpl", arg_249_0.oniTpl)
	arg_249_0.grid:ExtendItem("arrowTpl", arg_249_0.arrowTarget)
	arg_249_0.grid:ExtendItem("destinationMarkTpl", arg_249_0.destinationMarkTpl)

	function arg_249_0.grid.onShipStepChange(arg_250_0)
		arg_249_0.levelStageView:updateAmbushRate(arg_250_0)
	end

	arg_249_0.grid:initAll(arg_249_1)
end

function var_0_0.destroyGrid(arg_251_0)
	if arg_251_0.grid then
		arg_251_0.grid:detach()

		arg_251_0.grid = nil

		arg_251_0:disableLevelCamera()
		setActive(arg_251_0.dragLayer, true)
		setActive(arg_251_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_252_0, arg_252_1)
	arg_252_0:frozen()

	local function var_252_0()
		arg_252_0.radar:SetActive(true)

		local var_253_0 = tf(arg_252_0.radar)

		var_253_0:SetParent(arg_252_0.topPanel, false)
		var_253_0:SetSiblingIndex(1)
		var_253_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_254_0)
			arg_252_0.radar:SetActive(false)
			arg_252_0:unfrozen()
			arg_252_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_252_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_255_0)
			arg_255_0:SetActive(true)

			arg_252_0.radar = arg_255_0

			var_252_0()
		end)
	else
		var_252_0()
	end
end

function var_0_0.destroyTracking(arg_256_0)
	if arg_256_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_256_0.radar)

		arg_256_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_257_0, arg_257_1, arg_257_2, arg_257_3)
	local function var_257_0()
		arg_257_0.playing = true

		arg_257_0:frozen()
		arg_257_0.airStrike:SetActive(true)

		local var_258_0 = tf(arg_257_0.airStrike)

		var_258_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_258_0:SetAsLastSibling()
		setActive(var_258_0:Find("words/be_striked"), arg_257_1 == ChapterConst.SubjectChampion)
		setActive(var_258_0:Find("words/strike_enemy"), arg_257_1 == ChapterConst.SubjectPlayer)

		local function var_258_1()
			arg_257_0.playing = false

			SetActive(arg_257_0.airStrike, false)

			if arg_257_3 then
				arg_257_3()
			end

			arg_257_0:unfrozen()
		end

		var_258_0:GetComponent("DftAniEvent"):SetEndEvent(var_258_1)

		if arg_257_2 then
			onButton(arg_257_0, var_258_0, var_258_1, SFX_PANEL)
		else
			removeOnButton(var_258_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_257_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_260_0)
			arg_260_0:SetActive(true)

			arg_257_0.airStrike = arg_260_0

			var_257_0()
		end)
	else
		var_257_0()
	end
end

function var_0_0.destroyAirStrike(arg_261_0)
	if arg_261_0.airStrike then
		arg_261_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_261_0.airStrike)

		arg_261_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_262_0, arg_262_1, arg_262_2, arg_262_3)
	arg_262_0.uiAnims = arg_262_0.uiAnims or {}

	local var_262_0 = arg_262_0.uiAnims[arg_262_1]

	local function var_262_1()
		arg_262_0.playing = true

		arg_262_0:frozen()
		var_262_0:SetActive(true)

		local var_263_0 = tf(var_262_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_263_0)

		if arg_262_3 then
			arg_262_3(var_262_0)
		end

		var_263_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_264_0)
			arg_262_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_263_0, arg_262_0._tf)

			if arg_262_2 then
				arg_262_2(var_262_0)
			end

			arg_262_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_262_0 then
		PoolMgr.GetInstance():GetUI(arg_262_1, true, function(arg_265_0)
			arg_265_0:SetActive(true)

			arg_262_0.uiAnims[arg_262_1] = arg_265_0
			var_262_0 = arg_262_0.uiAnims[arg_262_1]

			var_262_1()
		end)
	else
		var_262_1()
	end
end

function var_0_0.destroyUIAnims(arg_266_0)
	if arg_266_0.uiAnims then
		for iter_266_0, iter_266_1 in pairs(arg_266_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_266_1), arg_266_0._tf)
			iter_266_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_266_0, iter_266_1)
		end

		arg_266_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_267_0, arg_267_1)
	local function var_267_0()
		arg_267_0.playing = true

		arg_267_0:frozen()
		arg_267_0.torpetoAni:SetActive(true)

		local var_268_0 = tf(arg_267_0.torpetoAni)

		var_268_0:SetParent(arg_267_0.topPanel, false)
		var_268_0:SetAsLastSibling()
		var_268_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_269_0)
			arg_267_0.playing = false

			SetActive(arg_267_0.torpetoAni, false)

			if arg_267_1 then
				arg_267_1()
			end

			arg_267_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_267_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_270_0)
			arg_270_0:SetActive(true)

			arg_267_0.torpetoAni = arg_270_0

			var_267_0()
		end)
	else
		var_267_0()
	end
end

function var_0_0.destroyTorpedo(arg_271_0)
	if arg_271_0.torpetoAni then
		arg_271_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_271_0.torpetoAni)

		arg_271_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_272_0, arg_272_1, arg_272_2, arg_272_3)
	arg_272_0.strikeAnims = arg_272_0.strikeAnims or {}

	local var_272_0
	local var_272_1
	local var_272_2

	local function var_272_3()
		if coroutine.status(var_272_2) == "suspended" then
			local var_273_0, var_273_1 = coroutine.resume(var_272_2)

			assert(var_273_0, debug.traceback(var_272_2, var_273_1))
		end
	end

	var_272_2 = coroutine.create(function()
		arg_272_0.playing = true

		arg_272_0:frozen()

		local var_274_0 = arg_272_0.strikeAnims[arg_272_2]

		setActive(var_274_0, true)

		local var_274_1 = tf(var_274_0)
		local var_274_2 = findTF(var_274_1, "torpedo")
		local var_274_3 = findTF(var_274_1, "mask/painting")
		local var_274_4 = findTF(var_274_1, "ship")

		setParent(var_272_0, var_274_3:Find("fitter"), false)
		var_272_1:SetParent(var_274_4)
		setActive(var_274_4, false)
		setActive(var_274_2, false)
		var_274_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_274_1:SetAsLastSibling()

		local var_274_5 = var_274_1:GetComponent("DftAniEvent")
		local var_274_6 = var_272_1:GetSkeletonGraphic()

		var_274_5:SetStartEvent(function(arg_275_0)
			var_272_1:SetAction("attack", 0)

			var_274_6.freeze = true
		end)
		var_274_5:SetTriggerEvent(function(arg_276_0)
			var_274_6.freeze = false

			var_272_1:SetActionCallBack(function(arg_277_0)
				if arg_277_0 == "action" then
					-- block empty
				elseif arg_277_0 == "finish" then
					var_274_6.freeze = true
				end
			end)
		end)
		var_274_5:SetEndEvent(function(arg_278_0)
			var_274_6.freeze = false

			var_272_3()
		end)
		onButton(arg_272_0, var_274_1, var_272_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_274_3, arg_272_1:getPainting())
		var_272_1:SetActionCallBack(nil)

		var_274_6.freeze = false

		var_272_1:Dispose()
		setActive(var_274_0, false)

		arg_272_0.playing = false

		arg_272_0:unfrozen()

		if arg_272_3 then
			arg_272_3()
		end
	end)

	local function var_272_4()
		if arg_272_0.strikeAnims[arg_272_2] and var_272_0 and var_272_1 then
			var_272_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_272_1:getPainting(), true, function(arg_280_0)
		var_272_0 = arg_280_0

		ShipExpressionHelper.SetExpression(var_272_0, arg_272_1:getPainting())
		var_272_4()
	end)

	var_272_1 = SpineAnimChar.New()

	var_272_1:SetPaint(arg_272_1:getPrefab())
	var_272_1:Load(true, function(arg_281_0)
		var_272_1:SetLocalScale(Vector3.one)
		var_272_4()
	end)

	if not arg_272_0.strikeAnims[arg_272_2] then
		PoolMgr.GetInstance():GetUI(arg_272_2, true, function(arg_282_0)
			arg_272_0.strikeAnims[arg_272_2] = arg_282_0

			var_272_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_283_0)
	if arg_283_0.strikeAnims then
		for iter_283_0, iter_283_1 in pairs(arg_283_0.strikeAnims) do
			iter_283_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_283_0, iter_283_1)
		end

		arg_283_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_284_0, arg_284_1, arg_284_2, arg_284_3)
	arg_284_0.strikeAnims = arg_284_0.strikeAnims or {}

	local var_284_0
	local var_284_1

	local function var_284_2()
		if coroutine.status(var_284_1) == "suspended" then
			local var_285_0, var_285_1 = coroutine.resume(var_284_1)

			assert(var_285_0, debug.traceback(var_284_1, var_285_1))
		end
	end

	var_284_1 = coroutine.create(function()
		arg_284_0.playing = true

		arg_284_0:frozen()

		local var_286_0 = arg_284_0.strikeAnims[arg_284_2]

		setActive(var_286_0, true)

		local var_286_1 = tf(var_286_0)
		local var_286_2 = findTF(var_286_1, "torpedo")
		local var_286_3 = findTF(var_286_1, "ship")

		var_284_0:SetParent(var_286_3)
		setActive(var_286_3, false)
		setActive(var_286_2, false)
		var_286_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_286_1:SetAsLastSibling()

		local var_286_4 = var_286_1:GetComponent("DftAniEvent")
		local var_286_5 = var_284_0:GetSkeletonGraphic()

		var_286_4:SetStartEvent(function(arg_287_0)
			var_284_0:SetAction("attack", 0)

			var_286_5.freeze = true
		end)
		var_286_4:SetTriggerEvent(function(arg_288_0)
			var_286_5.freeze = false

			var_284_0:SetActionCallBack(function(arg_289_0)
				if arg_289_0 == "action" then
					-- block empty
				elseif arg_289_0 == "finish" then
					var_286_5.freeze = true
				end
			end)
		end)
		var_286_4:SetEndEvent(function(arg_290_0)
			var_286_5.freeze = false

			var_284_2()
		end)
		onButton(arg_284_0, var_286_1, var_284_2, SFX_CANCEL)
		coroutine.yield()
		var_284_0:SetActionCallBack(nil)

		var_286_5.freeze = false

		var_284_0:Dispose()
		setActive(var_286_0, false)

		arg_284_0.playing = false

		arg_284_0:unfrozen()

		if arg_284_3 then
			arg_284_3()
		end
	end)

	local function var_284_3()
		if arg_284_0.strikeAnims[arg_284_2] and var_284_0 then
			var_284_2()
		end
	end

	var_284_0 = SpineAnimChar.New()

	var_284_0:SetPaint(arg_284_1:getPrefab())
	var_284_0:Load(true, function(arg_292_0)
		arg_292_0:SetLocalScale(Vector3.one)
		var_284_3()
	end)

	if not arg_284_0.strikeAnims[arg_284_2] then
		PoolMgr.GetInstance():GetUI(arg_284_2, true, function(arg_293_0)
			arg_284_0.strikeAnims[arg_284_2] = arg_293_0

			var_284_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_294_0, arg_294_1, arg_294_2)
	arg_294_0:frozen()
	setActive(arg_294_0.commanderTinkle, true)

	local var_294_0 = arg_294_1:getSkills()

	setText(arg_294_0.commanderTinkle:Find("name"), #var_294_0 > 0 and var_294_0[1]:getConfig("name") or "")
	setImageSprite(arg_294_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_294_1:getConfig("painting"), ""))

	local var_294_1 = arg_294_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_294_1.alpha = 0

	local var_294_2 = Vector2(248, 237)

	LeanTween.value(go(arg_294_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_295_0)
		local var_295_0 = arg_294_0.commanderTinkle.localPosition

		var_295_0.x = var_294_2.x + -100 * (1 - arg_295_0)
		arg_294_0.commanderTinkle.localPosition = var_295_0
		var_294_1.alpha = arg_295_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_294_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_296_0)
		local var_296_0 = arg_294_0.commanderTinkle.localPosition

		var_296_0.x = var_294_2.x + 100 * arg_296_0
		arg_294_0.commanderTinkle.localPosition = var_296_0
		var_294_1.alpha = 1 - arg_296_0
	end)):setOnComplete(System.Action(function()
		if arg_294_2 then
			arg_294_2()
		end

		arg_294_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_298_0, arg_298_1, arg_298_2, arg_298_3)
	local var_298_0 = arg_298_0.grid:shakeCell(arg_298_1)

	if not var_298_0 then
		arg_298_3()

		return
	end

	arg_298_0:easeDamage(var_298_0, arg_298_2, function()
		arg_298_3()
	end)
end

function var_0_0.easeDamage(arg_300_0, arg_300_1, arg_300_2, arg_300_3)
	arg_300_0:frozen()

	local var_300_0 = arg_300_0.levelCam:WorldToScreenPoint(arg_300_1.position)
	local var_300_1 = tf(arg_300_0:GetDamageText())

	var_300_1.position = arg_300_0.uiCam:ScreenToWorldPoint(var_300_0)

	local var_300_2 = var_300_1.localPosition

	var_300_2.y = var_300_2.y + 40
	var_300_2.z = 0

	setText(var_300_1, arg_300_2)

	var_300_1.localPosition = var_300_2

	LeanTween.value(go(var_300_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_301_0)
		local var_301_0 = var_300_1.localPosition

		var_301_0.y = var_300_2.y + 60 * arg_301_0
		var_300_1.localPosition = var_301_0

		setTextAlpha(var_300_1, 1 - arg_301_0)
	end)):setOnComplete(System.Action(function()
		arg_300_0:ReturnDamageText(var_300_1)
		arg_300_0:unfrozen()

		if arg_300_3 then
			arg_300_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_303_0, arg_303_1, arg_303_2)
	arg_303_0:frozen()

	local var_303_0 = arg_303_0.levelCam:WorldToScreenPoint(arg_303_1)

	arg_303_0.avoidText.position = arg_303_0.uiCam:ScreenToWorldPoint(var_303_0)

	local var_303_1 = arg_303_0.avoidText.localPosition

	var_303_1.z = 0
	arg_303_0.avoidText.localPosition = var_303_1

	setActive(arg_303_0.avoidText, true)

	local var_303_2 = arg_303_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_303_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_304_0)
		local var_304_0 = arg_303_0.avoidText.localPosition

		var_304_0.y = var_303_1.y + 100 * arg_304_0
		arg_303_0.avoidText.localPosition = var_304_0

		setImageAlpha(arg_303_0.avoidText, 1 - arg_304_0)
		setImageAlpha(var_303_2, 1 - arg_304_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_303_0.avoidText, false)
		arg_303_0:unfrozen()

		if arg_303_2 then
			arg_303_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_306_0)
	local var_306_0 = table.remove(arg_306_0.damageTextPool)

	if not var_306_0 then
		var_306_0 = Instantiate(arg_306_0.damageTextTemplate)

		local var_306_1 = tf(arg_306_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_306_0, tf(arg_306_0.damageTextTemplate).parent)
		tf(var_306_0):SetSiblingIndex(var_306_1 + 1)
	end

	table.insert(arg_306_0.damageTextActive, var_306_0)
	setActive(var_306_0, true)

	return var_306_0
end

function var_0_0.ReturnDamageText(arg_307_0, arg_307_1)
	assert(arg_307_1)

	if not arg_307_1 then
		return
	end

	arg_307_1 = go(arg_307_1)

	table.removebyvalue(arg_307_0.damageTextActive, arg_307_1)
	table.insert(arg_307_0.damageTextPool, arg_307_1)
	setActive(arg_307_1, false)
end

function var_0_0.resetLevelGrid(arg_308_0)
	arg_308_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_309_0, arg_309_1)
	setActive(arg_309_0.curtain, arg_309_1)
end

function var_0_0.frozen(arg_310_0)
	local var_310_0 = arg_310_0.frozenCount

	arg_310_0.frozenCount = arg_310_0.frozenCount + 1
	arg_310_0.canvasGroup.blocksRaycasts = arg_310_0.frozenCount == 0

	if var_310_0 == 0 and arg_310_0.frozenCount ~= 0 then
		arg_310_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_311_0, arg_311_1)
	if arg_311_0.exited then
		return
	end

	local var_311_0 = arg_311_0.frozenCount
	local var_311_1 = arg_311_1 == -1 and arg_311_0.frozenCount or arg_311_1 or 1

	arg_311_0.frozenCount = arg_311_0.frozenCount - var_311_1
	arg_311_0.canvasGroup.blocksRaycasts = arg_311_0.frozenCount == 0

	if var_311_0 ~= 0 and arg_311_0.frozenCount == 0 then
		arg_311_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_312_0)
	return arg_312_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_313_0)
	arg_313_0.levelCamIndices = math.max(arg_313_0.levelCamIndices - 1, 0)

	if arg_313_0.levelCamIndices == 0 then
		arg_313_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.disableLevelCamera(arg_314_0)
	arg_314_0.levelCamIndices = arg_314_0.levelCamIndices + 1

	if arg_314_0.levelCamIndices > 0 then
		arg_314_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.RecordTween(arg_315_0, arg_315_1, arg_315_2)
	arg_315_0.tweens[arg_315_1] = arg_315_2
end

function var_0_0.DeleteTween(arg_316_0, arg_316_1)
	local var_316_0 = arg_316_0.tweens[arg_316_1]

	if var_316_0 then
		LeanTween.cancel(var_316_0)

		arg_316_0.tweens[arg_316_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_317_0, arg_317_1, arg_317_2, arg_317_3)
	local var_317_0 = arg_317_2.id

	arg_317_0.levelCMDFormationView:setCallback(function(arg_318_0)
		if not arg_317_3 then
			if arg_318_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_317_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_318_0.skill)
			elseif arg_318_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_317_0.contextData.commanderSelected = {
					chapterId = var_317_0,
					fleetId = arg_317_1.id
				}

				arg_317_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_318_0.pos, arg_317_1.id, arg_317_2)
				arg_317_0:closeCommanderPanel()
			else
				arg_317_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_318_0,
					fleetId = arg_317_1.id,
					chapterId = var_317_0
				}, arg_317_2)
			end
		elseif arg_318_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_317_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_318_0.skill)
		elseif arg_318_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_317_0.contextData.eliteCommanderSelected = {
				index = arg_317_3,
				pos = arg_318_0.pos,
				chapterId = var_317_0
			}

			arg_317_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_317_3, arg_318_0.pos, arg_317_2)
			arg_317_0:closeCommanderPanel()
		else
			arg_317_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_318_0,
				index = arg_317_3,
				chapterId = var_317_0
			}, arg_317_2)
		end
	end)
	arg_317_0.levelCMDFormationView:Load()
	arg_317_0.levelCMDFormationView:ActionInvoke("update", arg_317_1, arg_317_0.commanderPrefabs)
	arg_317_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_319_0)
	if arg_319_0.levelCMDFormationView:isShowing() then
		arg_319_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_319_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_320_0)
	arg_320_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_321_0)
	arg_321_0.levelCMDFormationView:Destroy()

	arg_321_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_322_0, arg_322_1)
	arg_322_0.spTickets = arg_322_1
end

function var_0_0.HandleShowMsgBox(arg_323_0, arg_323_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_323_1)
end

function var_0_0.updatePoisonAreaTip(arg_324_0)
	local var_324_0 = arg_324_0.contextData.chapterVO
	local var_324_1 = (function(arg_325_0)
		local var_325_0 = {}
		local var_325_1 = pg.map_event_list[var_324_0.id] or {}
		local var_325_2

		if var_324_0:isLoop() then
			var_325_2 = var_325_1.event_list_loop or {}
		else
			var_325_2 = var_325_1.event_list or {}
		end

		for iter_325_0, iter_325_1 in ipairs(var_325_2) do
			local var_325_3 = pg.map_event_template[iter_325_1]

			if var_325_3.c_type == arg_325_0 then
				table.insert(var_325_0, var_325_3)
			end
		end

		return var_325_0
	end)(ChapterConst.EvtType_Poison)

	if var_324_1 then
		for iter_324_0, iter_324_1 in ipairs(var_324_1) do
			local var_324_2 = iter_324_1.round_gametip

			if var_324_2 ~= nil and var_324_2 ~= "" and var_324_0:getRoundNum() == var_324_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_324_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_326_0)
	setActive(arg_326_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_327_0)
	local var_327_0 = getProxy(ChapterProxy)

	if var_327_0 and not arg_327_0.contextData.noRecord then
		local var_327_1 = arg_327_0.contextData.map

		if not var_327_1 then
			return
		end

		if var_327_1:NeedRecordMap() then
			var_327_0:recordLastMap(ChapterProxy.LAST_MAP, var_327_1.id)
		end

		if var_327_1:isActivity() and not var_327_1:isActExtra() then
			var_327_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, var_327_1.id)
		end
	end
end

function var_0_0.IsActShopActive(arg_328_0)
	local var_328_0 = arg_328_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_328_0.contextData.map:getConfig("on_activity")) or nil
	local var_328_1 = var_328_0 and not var_328_0:isEnd() and var_328_0:GetConfigClientSetting("PTID")
	local var_328_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_328_2 and not var_328_2:isEnd() and var_328_2:getConfig("config_client").resId == var_328_1 then
		return true
	end

	local var_328_3 = var_328_0 and var_328_0:GetConfigClientPTActivity() or nil

	if var_328_3 and getProxy(ActivityProxy):GetShopActivityByRes(var_328_3:GetPTDrop()) or nil then
		return true
	end
end

function var_0_0.OnStartChapterAuto(arg_329_0, arg_329_1)
	if arg_329_0.levelInfoView:isShowing() then
		arg_329_0:hideChapterPanel()
	end

	if arg_329_0.levelInfoSPView and arg_329_0.levelInfoSPView:isShowing() then
		arg_329_0:HideLevelInfoSPPanel()
	end
end

function var_0_0.OnEndChapterAuto(arg_330_0, arg_330_1)
	return
end

function var_0_0.OnAddChapterAutoTimeDone(arg_331_0)
	if arg_331_0.levelInfoView:isShowing() then
		arg_331_0.levelInfoView:RefreshChapterAutoPanel()
	end

	if arg_331_0.levelInfoSPView and arg_331_0.levelInfoSPView:isShowing() then
		arg_331_0.levelInfoView:RefreshChapterAutoPanel()
	end
end

function var_0_0.ShowChapterAutoDetailPanel(arg_332_0, arg_332_1)
	arg_332_0.chapterAutoDetailPanel:Load()
	arg_332_0.chapterAutoDetailPanel:ActionInvoke("Enter", arg_332_1)
end

function var_0_0.HideChapterAutoDetailPanel(arg_333_0)
	if arg_333_0.chapterAutoDetailPanel:isShowing() then
		arg_333_0.chapterAutoDetailPanel:Hide()
	end
end

function var_0_0.DestroyChapterAutoDetailPanel(arg_334_0)
	if arg_334_0.chapterAutoDetailPanel then
		arg_334_0.chapterAutoDetailPanel:Destroy()

		arg_334_0.chapterAutoDetailPanel = nil
	end
end

function var_0_0.willExit(arg_335_0)
	arg_335_0:ClearMapTransitions()
	arg_335_0.loader:Clear()

	if arg_335_0.entranceActivityBg then
		pg.PoolMgr.GetInstance():ReturnPrefab(arg_335_0.entranceActivityBgPath, "", arg_335_0.entranceActivityBg)

		arg_335_0.entranceActivityBg = nil
		arg_335_0.entranceActivityBgPath = nil
	end

	if arg_335_0.contextData.chapterVO then
		arg_335_0:UnOverlayPanel(arg_335_0.topPanel, arg_335_0._tf)
	end

	if arg_335_0.levelFleetView and arg_335_0.levelFleetView.selectIds then
		arg_335_0.contextData.selectedFleetIDs = {}

		for iter_335_0, iter_335_1 in pairs(arg_335_0.levelFleetView.selectIds) do
			for iter_335_2, iter_335_3 in pairs(iter_335_1) do
				arg_335_0.contextData.selectedFleetIDs[#arg_335_0.contextData.selectedFleetIDs + 1] = iter_335_3
			end
		end
	end

	arg_335_0:destroyChapterPanel()
	arg_335_0:DestroyLevelInfoSPPanel()
	arg_335_0:destroyFleetEdit()
	arg_335_0:destroyCommanderPanel()
	arg_335_0:DestroyLevelStageView()
	arg_335_0:hideRepairWindow()
	arg_335_0:hideStrategyInfo()
	arg_335_0:hideRemasterPanel()
	arg_335_0:hideSpResult()
	arg_335_0:destroyGrid()
	arg_335_0:destroyAmbushWarn()
	arg_335_0:destroyAirStrike()
	arg_335_0:destroyTorpedo()
	arg_335_0:destroyStrikeAnim()
	arg_335_0:destroyTracking()
	arg_335_0:destroyUIAnims()
	arg_335_0:DestroyChapterAutoDetailPanel()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_335_4, iter_335_5 in pairs(arg_335_0.mbDict) do
		iter_335_5:Destroy()
	end

	arg_335_0.mbDict = nil

	for iter_335_6, iter_335_7 in pairs(arg_335_0.tweens) do
		LeanTween.cancel(iter_335_7)
	end

	arg_335_0.tweens = nil

	if arg_335_0.cloudTimer then
		_.each(arg_335_0.cloudTimer, function(arg_336_0)
			LeanTween.cancel(arg_336_0)
		end)

		arg_335_0.cloudTimer = nil
	end

	if arg_335_0.newChapterCDTimer then
		arg_335_0.newChapterCDTimer:Stop()

		arg_335_0.newChapterCDTimer = nil
	end

	for iter_335_8, iter_335_9 in ipairs(arg_335_0.damageTextActive) do
		LeanTween.cancel(iter_335_9)
	end

	LeanTween.cancel(go(arg_335_0.avoidText))

	arg_335_0.map.localScale = Vector3.one
	arg_335_0.map.pivot = Vector2(0.5, 0.5)
	arg_335_0.float.localScale = Vector3.one
	arg_335_0.float.pivot = Vector2(0.5, 0.5)

	for iter_335_10, iter_335_11 in ipairs(arg_335_0.mapTFs) do
		clearImageSprite(iter_335_11)
	end

	_.each(arg_335_0.cloudRTFs, function(arg_337_0)
		clearImageSprite(arg_337_0)
	end)
	Destroy(arg_335_0.enemyTpl)
	arg_335_0:RecordLastMapOnExit()
	arg_335_0.levelRemasterView:Destroy()
end

return var_0_0
