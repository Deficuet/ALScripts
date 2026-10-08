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

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = ResList.LevelScene.GetResource(arg_3_0, arg_3_1)

	return table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0, arg_3_1))
end

function var_0_0.ResUISettings(arg_4_0)
	return {
		groupDelta = 1,
		showType = PlayerResUI.TYPE_ALL
	}
end

function var_0_0.getBGM(arg_5_0)
	local function var_5_0()
		return checkExist(arg_5_0.contextData.chapterVO, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	local function var_5_1()
		if not arg_5_0.contextData.map then
			return
		end

		local var_7_0 = arg_5_0.contextData.map:getConfig("ani_controller")
		local var_7_1 = getProxy(ChapterProxy)

		if var_7_0 and #var_7_0 > 0 then
			for iter_7_0, iter_7_1 in ipairs(var_7_0) do
				local var_7_2 = _.rest(iter_7_1[2], 2)

				for iter_7_2, iter_7_3 in ipairs(var_7_2) do
					if string.find(iter_7_3, "^bgm_") and iter_7_1[1] == var_0_3 then
						local var_7_3 = iter_7_1[2][1]
						local var_7_4 = false

						for iter_7_4, iter_7_5 in ipairs(var_7_3) do
							local var_7_5 = var_7_1:GetChapterItemById(iter_7_5)

							if var_7_5 and var_7_5:isClear() then
								var_7_4 = true

								break
							end
						end

						if not var_7_4 then
							return string.sub(iter_7_3, 5)
						end
					end
				end
			end
		end

		return checkExist(arg_5_0.contextData.map, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	for iter_5_0, iter_5_1 in ipairs({
		var_5_0(),
		var_5_1()
	}) do
		if iter_5_1 ~= "" then
			return iter_5_1
		end
	end

	return var_0_0.super.getBGM(arg_5_0)
end

var_0_0.optionsPath = {
	"top/top_chapter/option"
}

function var_0_0.preload(arg_8_0, arg_8_1)
	local var_8_0 = getProxy(ChapterProxy)

	if arg_8_0.contextData.mapIdx and arg_8_0.contextData.chapterId then
		local var_8_1 = var_8_0:getChapterById(arg_8_0.contextData.chapterId)

		if var_8_1:getConfig("map") == arg_8_0.contextData.mapIdx then
			arg_8_0.contextData.chapterVO = var_8_1

			if var_8_1.active then
				assert(not arg_8_0.contextData.openChapterId or arg_8_0.contextData.openChapterId == arg_8_0.contextData.chapterId)

				arg_8_0.contextData.openChapterId = nil
			end
		end
	end

	local var_8_2, var_8_3 = arg_8_0:GetInitializeMap()

	if arg_8_0.contextData.entranceStatus == nil then
		arg_8_0.contextData.entranceStatus = not var_8_3
	end

	arg_8_1()
end

function var_0_0.GetInitializeMap(arg_9_0)
	local var_9_0 = (function()
		local var_10_0 = arg_9_0.contextData.chapterVO

		if var_10_0 and var_10_0.active then
			return var_10_0:getConfig("map")
		end

		local var_10_1 = arg_9_0.contextData.mapIdx

		if var_10_1 then
			return var_10_1
		end

		local var_10_2

		if arg_9_0.contextData.targetChapter and arg_9_0.contextData.targetMap then
			arg_9_0.contextData.openChapterId = arg_9_0.contextData.targetChapter
			var_10_2 = arg_9_0.contextData.targetMap.id
			arg_9_0.contextData.targetChapter = nil
			arg_9_0.contextData.targetMap = nil
		elseif arg_9_0.contextData.eliteDefault then
			local var_10_3 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			var_10_2 = var_10_3 and var_10_3.id or nil
			arg_9_0.contextData.eliteDefault = nil
		end

		return var_10_2
	end)()
	local var_9_1 = var_9_0 and getProxy(ChapterProxy):getMapById(var_9_0)

	if var_9_1 then
		local var_9_2, var_9_3 = var_9_1:isUnlock()

		if not var_9_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_9_3)

			var_9_0 = getProxy(ChapterProxy):getLastUnlockMap().id
			arg_9_0.contextData.mapIdx = var_9_0
		end
	else
		var_9_0 = nil
	end

	return var_9_0 or getProxy(ChapterProxy):GetLastNormalMap(), tobool(var_9_0)
end

function var_0_0.init(arg_11_0)
	arg_11_0:initData()
	arg_11_0:initUI()
	arg_11_0:initEvents()
	arg_11_0:updateClouds()
end

function var_0_0.initData(arg_12_0)
	arg_12_0.tweens = {}

	local var_12_0 = arg_12_0._tf.rect.size

	arg_12_0.mapWidth, arg_12_0.mapHeight = var_12_0.x, var_12_0.y
	arg_12_0.levelCamIndices = 1
	arg_12_0.frozenCount = 0
	arg_12_0.currentBG = nil
	arg_12_0.mbDict = {}
	arg_12_0.mapGroup = {}

	if not arg_12_0.contextData.huntingRangeVisibility then
		arg_12_0.contextData.huntingRangeVisibility = 2
	end
end

function var_0_0.initUI(arg_13_0)
	arg_13_0.topPanel = arg_13_0._tf:Find("top")
	arg_13_0.canvasGroup = arg_13_0.topPanel:GetComponent("CanvasGroup")
	arg_13_0.canvasGroup.blocksRaycasts = not arg_13_0.canvasGroup.blocksRaycasts
	arg_13_0.canvasGroup.blocksRaycasts = not arg_13_0.canvasGroup.blocksRaycasts
	arg_13_0.entranceLayer = arg_13_0._tf:Find("entrance")
	arg_13_0.ptBonus = EventPtBonus.New(arg_13_0.entranceLayer:Find("btns/btn_task/bonusPt"))
	arg_13_0.entranceBg = arg_13_0._tf:Find("entrance_bg")
	arg_13_0.topChapter = arg_13_0.topPanel:Find("top_chapter")

	setActive(arg_13_0.topChapter:Find("title_chapter"), false)
	setActive(arg_13_0.topChapter:Find("type_chapter"), false)
	setActive(arg_13_0.topChapter:Find("type_escort"), false)
	setActive(arg_13_0.topChapter:Find("type_skirmish"), false)

	arg_13_0.chapterName = arg_13_0.topChapter:Find("title_chapter/name")
	arg_13_0.chapterNoTitle = arg_13_0.topChapter:Find("title_chapter/chapter")
	arg_13_0.resChapter = arg_13_0.topChapter:Find("resources")

	setActive(arg_13_0.topChapter, true)

	arg_13_0._voteBookBtn = arg_13_0.topChapter:Find("vote_book")
	arg_13_0.leftChapter = arg_13_0._tf:Find("main/left_chapter")

	setActive(arg_13_0.leftChapter, true)

	arg_13_0.leftCanvasGroup = arg_13_0.leftChapter:GetComponent(typeof(CanvasGroup))
	arg_13_0.btnPrev = arg_13_0.leftChapter:Find("btn_prev")
	arg_13_0.btnPrevCol = arg_13_0.leftChapter:Find("btn_prev/prev_image")
	arg_13_0.eliteBtn = arg_13_0.leftChapter:Find("buttons/btn_elite")
	arg_13_0.normalBtn = arg_13_0.leftChapter:Find("buttons/btn_normal")
	arg_13_0.actNormalBtn = arg_13_0.leftChapter:Find("buttons/btn_act_normal")
	arg_13_0.actEliteBtn = arg_13_0.leftChapter:Find("buttons/btn_act_elite")
	arg_13_0.actExtraBtn = arg_13_0.leftChapter:Find("buttons/btn_act_extra")
	arg_13_0.actExtraBtnAnim = arg_13_0.actExtraBtn:Find("usm")
	arg_13_0.remasterBtn = arg_13_0.leftChapter:Find("buttons/btn_remaster")
	arg_13_0.escortBar = arg_13_0.leftChapter:Find("escort_bar")
	arg_13_0.eliteQuota = arg_13_0.leftChapter:Find("elite_quota")
	arg_13_0.skirmishBar = arg_13_0.leftChapter:Find("left_times")
	arg_13_0.mainLayer = arg_13_0._tf:Find("main")

	setActive(arg_13_0.mainLayer:Find("title_chapter_lines"), false)

	arg_13_0.rightChapter = arg_13_0._tf:Find("main/right_chapter")
	arg_13_0.rightCanvasGroup = arg_13_0.rightChapter:GetComponent(typeof(CanvasGroup))
	arg_13_0.eventContainer = arg_13_0.rightChapter:Find("event_btns/event_container")
	arg_13_0.btnSpecial = arg_13_0.eventContainer:Find("btn_task")
	arg_13_0.challengeBtn = arg_13_0.eventContainer:Find("btn_challenge")
	arg_13_0.dailyBtn = arg_13_0.eventContainer:Find("btn_daily")
	arg_13_0.militaryExerciseBtn = arg_13_0.eventContainer:Find("btn_pvp")
	arg_13_0.activityBtn = arg_13_0.rightChapter:Find("event_btns/activity_btn")
	arg_13_0.ptTotal = arg_13_0.rightChapter:Find("event_btns/pt_text")
	arg_13_0.ticketTxt = arg_13_0.rightChapter:Find("event_btns/tickets/Text")
	arg_13_0.remasterAwardBtn = arg_13_0.rightChapter:Find("btn_remaster_award")
	arg_13_0.btnNext = arg_13_0.rightChapter:Find("btn_next")
	arg_13_0.btnNextCol = arg_13_0.rightChapter:Find("btn_next/next_image")
	arg_13_0.countDown = arg_13_0.rightChapter:Find("event_btns/count_down")

	setActive(arg_13_0.rightChapter:Find("event_btns/BottomList"), true)

	arg_13_0.actExchangeShopBtn = arg_13_0.rightChapter:Find("event_btns/BottomList/btn_exchange")
	arg_13_0.actAtelierBuffBtn = arg_13_0.rightChapter:Find("event_btns/BottomList/btn_control_center")
	arg_13_0.actAtelierYumiaBuffBtn = arg_13_0.rightChapter:Find("event_btns/BottomList/btn_yumia_buff")
	arg_13_0.actExtraRank = arg_13_0.rightChapter:Find("event_btns/BottomList/act_extra_rank")

	setActive(arg_13_0.rightChapter, true)

	arg_13_0.damageTextTemplate = go(arg_13_0.topPanel:Find("damage"))

	setActive(arg_13_0.damageTextTemplate, false)

	arg_13_0.damageTextPool = {
		arg_13_0.damageTextTemplate
	}
	arg_13_0.damageTextActive = {}
	arg_13_0.mapHelpBtn = arg_13_0.topPanel:Find("help_button")
	arg_13_0.avoidText = arg_13_0.topPanel:Find("text_avoid")
	arg_13_0.commanderTinkle = arg_13_0.topPanel:Find("neko_tinkle")

	setActive(arg_13_0.commanderTinkle, false)

	arg_13_0.spResult = arg_13_0.topPanel:Find("sp_result")

	setActive(arg_13_0.spResult, false)

	arg_13_0.helpPage = arg_13_0.topPanel:Find("help_page")
	arg_13_0.helpImage = arg_13_0.helpPage:Find("icon")

	setActive(arg_13_0.helpPage, false)

	arg_13_0.curtain = arg_13_0.topPanel:Find("curtain")

	setActive(arg_13_0.curtain, false)

	arg_13_0.map = arg_13_0._tf:Find("maps")
	arg_13_0.mapTFs = {
		arg_13_0._tf:Find("maps/map1"),
		arg_13_0._tf:Find("maps/map2")
	}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.mapTFs) do
		iter_13_1:GetComponent(typeof(Image)).enabled = false
	end

	arg_13_0.UIFXList = arg_13_0._tf:Find("maps/UI_FX_list")

	local var_13_0 = arg_13_0.UIFXList:GetComponentsInChildren(typeof(Renderer)):ToTable()

	for iter_13_2, iter_13_3 in ipairs(var_13_0) do
		iter_13_3.sortingOrder = -1
	end

	arg_13_0.rtRightPanel = arg_13_0._tf:Find("entrance/enters/right_panel")
	arg_13_0.actBtnTpl = arg_13_0.rtRightPanel:Find("content/tpl")

	local var_13_1 = pg.UIMgr.GetInstance()

	arg_13_0.levelCam = var_13_1.levelCamera:GetComponent(typeof(Camera))
	arg_13_0.uiMain = var_13_1.LevelMain

	setActive(arg_13_0.uiMain, false)

	arg_13_0.uiCam = var_13_1.uiCamera:GetComponent(typeof(Camera))
	arg_13_0.levelGrid = arg_13_0.uiMain:Find("LevelGrid")

	setActive(arg_13_0.levelGrid, true)

	arg_13_0.dragLayer = arg_13_0.levelGrid:Find("DragLayer")
	arg_13_0.float = arg_13_0._tf:Find("float")
	arg_13_0.clouds = arg_13_0.float:Find("clouds")

	setActive(arg_13_0.clouds, true)
	setActive(arg_13_0.float:Find("levels"), false)

	arg_13_0.resources = arg_13_0._tf:Find("resources")
	arg_13_0.arrowTarget = arg_13_0.resources:Find("Tpl_Arrow_Target")
	arg_13_0.destinationMarkTpl = arg_13_0.resources:Find("Tpl_Destination_Mark")
	arg_13_0.championTpl = arg_13_0.resources:Find("Tpl_Champion")
	arg_13_0.deadTpl = arg_13_0.resources:Find("Tpl_Dead")
	arg_13_0.enemyTpl = arg_13_0.resources:Find("Tpl_Enemy")
	arg_13_0.oniTpl = arg_13_0.resources:Find("Tpl_Oni")
	arg_13_0.shipTpl = arg_13_0.resources:Find("Tpl_Ship")
	arg_13_0.subTpl = arg_13_0.resources:Find("Tpl_Sub")
	arg_13_0.transportTpl = arg_13_0.resources:Find("Tpl_Transport")

	setText(tf(arg_13_0.enemyTpl):Find("fighting/Text"), i18n("ui_word_levelui2_inevent"))
	arg_13_0:HideBtns()
	setAnchoredPosition(arg_13_0.topChapter, {
		y = 0
	})
	setAnchoredPosition(arg_13_0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(arg_13_0.rightChapter, {
		x = 0
	})

	arg_13_0.bubbleMsgBoxes = {}
	arg_13_0.loader = AutoLoader.New()
	arg_13_0.levelFleetView = LevelFleetView.New(arg_13_0.topPanel, arg_13_0.event, arg_13_0.contextData)
	arg_13_0.levelInfoView = LevelInfoView.New(arg_13_0.topPanel, arg_13_0.event, arg_13_0.contextData)

	arg_13_0.levelInfoView:RegisterView(arg_13_0)
	arg_13_0.levelFleetView:RegisterView(arg_13_0)
	arg_13_0:buildCommanderPanel()

	arg_13_0.levelRemasterView = LevelRemasterView.New(arg_13_0.topPanel, arg_13_0.event, arg_13_0.contextData)
	arg_13_0.chapterAutoDetailPanel = ChapterAutoDetailPanel.New(arg_13_0.topPanel, arg_13_0.event, arg_13_0.contextData)

	arg_13_0.chapterAutoDetailPanel:RegisterView(arg_13_0)
	arg_13_0:SwitchMapBuilder(MapBuilder.TYPENORMAL)
end

function var_0_0.LoadEntranceActivityBg(arg_14_0)
	local var_14_0 = arg_14_0.entranceActivity:getConfig("config_client").entrance_bg

	if not var_14_0 then
		return
	end

	local var_14_1 = "activitybanner"

	if string.sub(var_14_0, 1, #var_14_1) == var_14_1 then
		var_14_0 = "MainUIBanner" .. string.sub(var_14_0, #var_14_1 + 1)
	end

	arg_14_0.entranceActivityBgPath = var_14_0

	pg.PoolMgr.GetInstance():GetPrefab(var_14_0, "", true, function(arg_15_0)
		if arg_14_0.exited then
			pg.PoolMgr.GetInstance():ReturnPrefab(var_14_0, "", arg_15_0)

			return
		end

		arg_14_0.entranceActivityBg = arg_15_0

		setParent(arg_15_0.transform, arg_14_0.entranceLayer:Find("enters/enter_ready/activity"))
		setText(arg_15_0.transform:Find("Text"), arg_14_0.entranceActivity:GetActivityTimeStr(true))

		arg_15_0.transform.anchorMin = Vector2.zero
		arg_15_0.transform.anchorMax = Vector2.one
		arg_15_0.transform.offsetMin = Vector2.zero
		arg_15_0.transform.offsetMax = Vector2.zero
	end)
end

function var_0_0.initEvents(arg_16_0)
	arg_16_0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
		arg_16_0:openCommanderPanel(arg_17_1, arg_17_2, arg_17_3)
	end)
	arg_16_0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function(arg_18_0, arg_18_1)
		arg_16_0:HandleShowMsgBox(arg_18_1)
	end)
	arg_16_0:bind(LevelUIConst.DO_AMBUSH_WARNING, function(arg_19_0, arg_19_1)
		arg_16_0:doAmbushWarning(arg_19_1)
	end)
	arg_16_0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function(arg_20_0, arg_20_1)
		arg_16_0:displayAmbushInfo(arg_20_1)
	end)
	arg_16_0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function(arg_21_0, arg_21_1)
		arg_16_0:displayStrategyInfo(arg_21_1)
	end)
	arg_16_0:bind(LevelUIConst.FROZEN, function(arg_22_0)
		arg_16_0:frozen()
	end)
	arg_16_0:bind(LevelUIConst.UN_FROZEN, function(arg_23_0)
		arg_16_0:unfrozen()
	end)
	arg_16_0:bind(LevelUIConst.DO_TRACKING, function(arg_24_0, arg_24_1)
		arg_16_0:doTracking(arg_24_1)
	end)
	arg_16_0:bind(LevelUIConst.SWITCH_TO_MAP, function()
		if arg_16_0:isfrozen() then
			return
		end

		arg_16_0:switchToMap()
	end)
	arg_16_0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function(arg_26_0, arg_26_1)
		arg_16_0:displayRepairWindow(arg_26_1)
	end)
	arg_16_0:bind(LevelUIConst.DO_PLAY_ANIM, function(arg_27_0, arg_27_1)
		arg_16_0:doPlayAnim(arg_27_1.name, arg_27_1.callback, arg_27_1.onStart)
	end)
	arg_16_0:bind(LevelUIConst.HIDE_FLEET_SELECT, function()
		arg_16_0:hideFleetSelect()
	end)
	arg_16_0:bind(LevelUIConst.HIDE_FLEET_EDIT, function(arg_29_0)
		arg_16_0:hideFleetEdit()
	end)
	arg_16_0:bind(LevelUIConst.ADD_MSG_QUEUE, function(arg_30_0, arg_30_1)
		arg_16_0:addbubbleMsgBox(arg_30_1)
	end)
	arg_16_0:bind(LevelUIConst.SET_MAP, function(arg_31_0, arg_31_1)
		arg_16_0:setMap(arg_31_1)
	end)
end

function var_0_0.onZeroHourRefresh(arg_32_0)
	if arg_32_0.levelInfoView:isShowing() then
		arg_32_0.levelInfoView:RefreshChapterAutoPanel()
	end

	if arg_32_0.levelInfoSPView and arg_32_0.levelInfoSPView:isShowing() then
		arg_32_0.levelInfoView:RefreshChapterAutoPanel()
	end
end

function var_0_0.addbubbleMsgBox(arg_33_0, arg_33_1)
	table.insert(arg_33_0.bubbleMsgBoxes, arg_33_1)

	if #arg_33_0.bubbleMsgBoxes > 1 then
		return
	end

	local var_33_0

	local function var_33_1()
		local var_34_0 = arg_33_0.bubbleMsgBoxes[1]

		if var_34_0 then
			var_34_0(function()
				table.remove(arg_33_0.bubbleMsgBoxes, 1)
				var_33_1()
			end)
		end
	end

	var_33_1()
end

function var_0_0.CleanBubbleMsgbox(arg_36_0)
	table.clean(arg_36_0.bubbleMsgBoxes)
end

function var_0_0.updatePtActivity(arg_37_0, arg_37_1)
	arg_37_0.ptActivity = arg_37_1

	if not arg_37_0.ptActivity then
		return
	end

	arg_37_0:updateActivityRes()
end

function var_0_0.updateActivityRes(arg_38_0)
	local var_38_0 = findTF(arg_38_0.ptTotal, "Text")
	local var_38_1 = findTF(arg_38_0.ptTotal, "icon/Image")

	if var_38_0 and var_38_1 and arg_38_0.ptActivity then
		setText(var_38_0, "x" .. arg_38_0.ptActivity.data1)

		local var_38_2 = arg_38_0.ptActivity:GetPTDrop():getIcon()

		GetImageSpriteFromAtlasAsync(var_38_2, "", var_38_1, true)
		GetImageSpriteFromAtlasAsync(var_38_2, "", arg_38_0.actExchangeShopBtn:Find("icon"), true)
	end
end

function var_0_0.setCommanderPrefabs(arg_39_0, arg_39_1)
	arg_39_0.commanderPrefabs = arg_39_1
end

function var_0_0.didEnter(arg_40_0)
	arg_40_0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_40_0.player.level, "CommanderCatMediator")

	onButton(arg_40_0, arg_40_0.topChapter:Find("back_button"), function()
		if arg_40_0:isfrozen() then
			return
		end

		local var_41_0 = arg_40_0.contextData.map

		if var_41_0 and (var_41_0:isActivity() or var_41_0:isEscort()) then
			arg_40_0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		elseif var_41_0 and var_41_0:isSkirmish() then
			arg_40_0:emit(var_0_0.ON_BACK)
		elseif not arg_40_0.contextData.entranceStatus then
			arg_40_0:ShowEntranceUI(true)
		else
			arg_40_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_40_0, arg_40_0.btnSpecial, function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.dailyBtn, function()
		if arg_40_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_40_0:updatDailyBtnTip()
		arg_40_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.challengeBtn, function()
		if arg_40_0:isfrozen() then
			return
		end

		local var_44_0, var_44_1 = arg_40_0:checkChallengeOpen()

		if var_44_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_44_1)
		else
			arg_40_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.militaryExerciseBtn, function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.normalBtn, function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:setMap(arg_40_0.contextData.map:getBindMapId())
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.eliteBtn, function()
		if arg_40_0:isfrozen() then
			return
		end

		if arg_40_0.contextData.map:getBindMapId() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			local var_47_0 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			if var_47_0 then
				arg_40_0:setMap(var_47_0.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif arg_40_0.contextData.map:isEliteEnabled() then
			arg_40_0:setMap(arg_40_0.contextData.map:getBindMapId())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(arg_40_0, arg_40_0.remasterBtn, function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_40_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("enters/enter_main"), function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:ShowSelectedMap(arg_40_0:GetInitializeMap())
	end, SFX_PANEL)
	setText(arg_40_0.entranceLayer:Find("enters/enter_main/Text"), getProxy(ChapterProxy):getLastUnlockMap():getLastUnlockChapterName())
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("enters/enter_world/enter"), function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:emit(LevelMediator2.ENTER_WORLD)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("enters/enter_ready/activity"), function()
		if arg_40_0:isfrozen() then
			return
		end

		switch(arg_40_0.entranceActivity:getConfig("type"), {
			[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function()
				arg_40_0:emit(LevelMediator2.ON_ACTIVITY_MAP, arg_40_0.entranceActivity.id)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
				arg_40_0:emit(LevelMediator2.ON_OPEN_ACT_BOSS_BATTLE)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
				arg_40_0:emit(LevelMediator2.ON_BOSSRUSH_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
				arg_40_0:emit(LevelMediator2.ON_BOSSSINGLE_MAP, {
					mode = OtherworldMapScene.MODE_BATTLE
				})
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
				arg_40_0:emit(LevelMediator2.ON_CLUE_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = function()
				arg_40_0:emit(LevelMediator2.ON_COLLAB_BOSSRUSH_MAP)
			end
		})
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("btns/btn_remaster"), function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_40_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	setActive(arg_40_0.entranceLayer:Find("btns/btn_remaster"), OPEN_REMASTER)
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("btns/btn_challenge"), function()
		if arg_40_0:isfrozen() then
			return
		end

		local var_59_0, var_59_1 = arg_40_0:checkChallengeOpen()

		if var_59_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_59_1)
		else
			arg_40_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("btns/btn_pvp"), function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("btns/btn_daily"), function()
		if arg_40_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_40_0:updatDailyBtnTip()
		arg_40_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.entranceLayer:Find("btns/btn_task"), function()
		if arg_40_0:isfrozen() then
			return
		end

		arg_40_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	setActive(arg_40_0.entranceLayer:Find("enters/enter_world/enter"), not WORLD_ENTER_LOCK)
	setActive(arg_40_0.entranceLayer:Find("enters/enter_world/nothing"), WORLD_ENTER_LOCK)
	setActive(arg_40_0.entranceLayer:Find("enters/enter_world/enter/tip"), getProxy(ChapterAutoProxy):IsAllCommissionFinish(ChapterAutoProxy.TYPE.WORLD))

	arg_40_0.entranceActivity = getProxy(ActivityProxy):getEnterReadyActivity()[1]

	setActive(arg_40_0.entranceLayer:Find("enters/enter_ready/nothing"), not tobool(arg_40_0.entranceActivity))
	setActive(arg_40_0.entranceLayer:Find("enters/enter_ready/activity"), tobool(arg_40_0.entranceActivity))

	if tobool(arg_40_0.entranceActivity) then
		arg_40_0:LoadEntranceActivityBg()
	end

	arg_40_0:updateRightPanel()

	local var_40_0 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_40_0.player.level, "EventMediator")

	setActive(arg_40_0.btnSpecial:Find("lock"), not var_40_0)
	setActive(arg_40_0.entranceLayer:Find("btns/btn_task/lock"), not var_40_0)

	local var_40_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_40_0.player.level, "DailyLevelMediator")

	setActive(arg_40_0.dailyBtn:Find("lock"), not var_40_1)
	setActive(arg_40_0.entranceLayer:Find("btns/btn_daily/lock"), not var_40_1)

	local var_40_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_40_0.player.level, "MilitaryExerciseMediator")

	setActive(arg_40_0.militaryExerciseBtn:Find("lock"), not var_40_2)
	setActive(arg_40_0.entranceLayer:Find("btns/btn_pvp/lock"), not var_40_2)

	local var_40_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_40_0.player.level, "WorldMediator")

	setActive(arg_40_0.entranceLayer:Find("enters/enter_world/enter/lock"), not var_40_3)

	local var_40_4 = LimitChallengeConst.IsOpen()

	setActive(arg_40_0.challengeBtn:Find("lock"), not var_40_4)
	setActive(arg_40_0.entranceLayer:Find("btns/btn_challenge/lock"), not var_40_4)

	local var_40_5 = LimitChallengeConst.IsInAct()

	setActive(arg_40_0.challengeBtn, var_40_5)
	setActive(arg_40_0.entranceLayer:Find("btns/btn_challenge"), var_40_5)

	local var_40_6 = LimitChallengeConst.IsShowRedPoint()

	setActive(arg_40_0.entranceLayer:Find("btns/btn_challenge/tip"), var_40_6)
	arg_40_0:initMapBtn(arg_40_0.btnPrev, -1)
	arg_40_0:initMapBtn(arg_40_0.btnNext, 1)
	arg_40_0:registerActBtn()

	if arg_40_0.contextData.editEliteChapter then
		local var_40_7 = getProxy(ChapterProxy):getChapterById(arg_40_0.contextData.editEliteChapter)

		arg_40_0:displayFleetEdit(var_40_7)

		arg_40_0.contextData.editEliteChapter = nil
	elseif arg_40_0.contextData.selectedChapterVO then
		arg_40_0:displayFleetSelect(arg_40_0.contextData.selectedChapterVO)

		arg_40_0.contextData.selectedChapterVO = nil
	end

	local var_40_8 = arg_40_0.contextData.chapterVO

	if not var_40_8 or not var_40_8.active then
		arg_40_0:tryPlaySubGuide()
	end

	arg_40_0:updateRemasterBtnTip()
	arg_40_0:updatDailyBtnTip()

	if arg_40_0.contextData.open_remaster then
		arg_40_0:displayRemasterPanel(arg_40_0.contextData.isSP)

		arg_40_0.contextData.open_remaster = nil
	end

	arg_40_0:ShowEntranceUI(arg_40_0.contextData.entranceStatus)

	if not arg_40_0.contextData.entranceStatus then
		arg_40_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_40_0:GetInitializeMap())
	end

	arg_40_0:emit(LevelMediator2.ON_DIDENTER)
end

function var_0_0.updateRightPanel(arg_63_0)
	arg_63_0.rightActivityBtns = defaultValue(arg_63_0.rightActivityBtns, {
		LevelSecondMapBtn.New(arg_63_0.actBtnTpl, arg_63_0.event, false)
	})

	local var_63_0 = {}
	local var_63_1 = {}

	for iter_63_0, iter_63_1 in ipairs(arg_63_0.rightActivityBtns) do
		if iter_63_1:InShowTime() then
			table.insert(var_63_0, iter_63_1)
		else
			table.insert(var_63_1, iter_63_1)
		end
	end

	table.sort(var_63_0, CompareFuncs({
		function(arg_64_0)
			return arg_64_0.config.group_id
		end
	}))

	for iter_63_2, iter_63_3 in ipairs(var_63_0) do
		iter_63_3:Init(iter_63_2)
	end

	for iter_63_4, iter_63_5 in ipairs(var_63_1) do
		iter_63_5:Clear()
	end
end

function var_0_0.checkChallengeOpen(arg_65_0)
	local var_65_0 = getProxy(PlayerProxy):getRawData().level

	return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_65_0, "ChallengeMainMediator")
end

function var_0_0.tryPlaySubGuide(arg_66_0)
	if arg_66_0.contextData.map and arg_66_0.contextData.map:isSkirmish() then
		return
	end

	pg.SystemGuideMgr.GetInstance():Play(arg_66_0)
end

function var_0_0.onBackPressed(arg_67_0)
	if arg_67_0:isfrozen() then
		return
	end

	if arg_67_0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_67_0.chapterAutoDetailPanel:isShowing() then
		arg_67_0:HideChapterAutoDetailPanel()
	end

	if arg_67_0.levelInfoView:isShowing() then
		arg_67_0:hideChapterPanel()

		return
	end

	if arg_67_0.levelInfoSPView and arg_67_0.levelInfoSPView:isShowing() then
		arg_67_0:HideLevelInfoSPPanel()

		return
	end

	if arg_67_0.levelFleetView:isShowing() then
		arg_67_0:hideFleetEdit()

		return
	end

	if arg_67_0.levelStrategyView then
		arg_67_0:hideStrategyInfo()

		return
	end

	if arg_67_0.levelRepairView then
		arg_67_0:hideRepairWindow()

		return
	end

	if arg_67_0.levelRemasterView:isShowing() then
		arg_67_0:hideRemasterPanel()

		return
	end

	if arg_67_0.contextData.map and arg_67_0.contextData.map:getConfig("ui_type") == MapBuilder.TYPEEXSP and arg_67_0.mapBuilder.personalPage:IsActive() then
		arg_67_0.mapBuilder.personalPage:Hide()

		return
	end

	if isActive(arg_67_0.helpPage) then
		setActive(arg_67_0.helpPage, false)

		return
	end

	local var_67_0 = arg_67_0.contextData.chapterVO
	local var_67_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_67_0 and var_67_1 then
		arg_67_0:switchToMap()

		return
	end

	triggerButton(arg_67_0.topChapter:Find("back_button"))
end

function var_0_0.ShowEntranceUI(arg_68_0, arg_68_1)
	setActive(arg_68_0.entranceLayer, arg_68_1)
	setActive(arg_68_0.entranceBg, arg_68_1)
	setActive(arg_68_0.map, not arg_68_1)
	setActive(arg_68_0.float, not arg_68_1)
	setActive(arg_68_0.mainLayer, not arg_68_1)
	setActive(arg_68_0.topChapter:Find("type_entrance"), arg_68_1)

	arg_68_0.contextData.entranceStatus = tobool(arg_68_1)

	if arg_68_1 then
		setActive(arg_68_0.topChapter:Find("title_chapter"), false)
		setActive(arg_68_0.topChapter:Find("type_chapter"), false)
		setActive(arg_68_0.topChapter:Find("type_escort"), false)
		setActive(arg_68_0.topChapter:Find("type_skirmish"), false)

		if arg_68_0.newChapterCDTimer then
			arg_68_0.newChapterCDTimer:Stop()

			arg_68_0.newChapterCDTimer = nil
		end

		arg_68_0:RecordLastMapOnExit()

		arg_68_0.contextData.mapIdx = nil
		arg_68_0.contextData.map = nil
	end

	arg_68_0:PlayBGM()
end

function var_0_0.PreloadLevelMainUI(arg_69_0, arg_69_1, arg_69_2)
	if arg_69_0.preloadLevelDone then
		existCall(arg_69_2)

		return
	end

	local var_69_0

	local function var_69_1()
		if not arg_69_0.exited then
			arg_69_0.preloadLevelDone = true

			existCall(arg_69_2)
		end
	end

	local var_69_2 = getProxy(ChapterProxy):getMapById(arg_69_1)
	local var_69_3 = arg_69_0:GetMapBG(var_69_2)

	table.ParallelIpairsAsync(var_69_3, function(arg_71_0, arg_71_1, arg_71_2)
		GetSpriteFromAtlasAsync("levelmap/" .. arg_71_1.BG, "", arg_71_2)
	end, var_69_1)
end

function var_0_0.setShips(arg_72_0, arg_72_1)
	arg_72_0.shipVOs = arg_72_1
end

function var_0_0.updateRes(arg_73_0, arg_73_1)
	if arg_73_0.levelStageView then
		arg_73_0.levelStageView:ActionInvoke("SetPlayer", arg_73_1)
	end

	arg_73_0.player = arg_73_1
end

function var_0_0.setEliteQuota(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = arg_74_2 - arg_74_1
	local var_74_1 = arg_74_0.eliteQuota:Find("bg/Text"):GetComponent(typeof(Text))

	if arg_74_1 == arg_74_2 then
		var_74_1.color = Color.red
	else
		var_74_1.color = Color.New(0.47, 0.89, 0.27)
	end

	var_74_1.text = var_74_0 .. "/" .. arg_74_2
end

function var_0_0.updateEvent(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_1:hasFinishState()

	setActive(arg_75_0.btnSpecial:Find("tip"), var_75_0)
	setActive(arg_75_0.entranceLayer:Find("btns/btn_task/tip"), var_75_0)
end

function var_0_0.updateFleet(arg_76_0, arg_76_1)
	arg_76_0.fleets = arg_76_1
end

function var_0_0.updateChapterVO(arg_77_0, arg_77_1, arg_77_2)
	if arg_77_0.contextData.chapterVO and arg_77_0.contextData.chapterVO.id == arg_77_1.id and arg_77_1.active then
		arg_77_0:setChapter(arg_77_1)
	end

	if arg_77_0.contextData.chapterVO and arg_77_0.contextData.chapterVO.id == arg_77_1.id and arg_77_1.active and arg_77_0.levelStageView and arg_77_0.grid then
		local var_77_0 = false
		local var_77_1 = false
		local var_77_2 = false

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyFleet) > 0 then
			arg_77_0.levelStageView:updateStageFleet()
			arg_77_0.levelStageView:updateAmbushRate(arg_77_1.fleet.line, true)

			var_77_2 = true

			if arg_77_0.grid then
				arg_77_0.grid:RefreshFleetCells()
				arg_77_0.grid:UpdateFloor()
				arg_77_0.grid:UpdateWeatherCells()

				var_77_0 = true
			end
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyChampion) > 0 then
			var_77_2 = true

			if arg_77_0.grid then
				arg_77_0.grid:UpdateFleets()
				arg_77_0.grid:clearChampions()
				arg_77_0.grid:initChampions()

				var_77_1 = true
			end
		elseif bit.band(arg_77_2, ChapterConst.DirtyChampionPosition) > 0 then
			var_77_2 = true

			if arg_77_0.grid then
				arg_77_0.grid:UpdateFleets()
				arg_77_0.grid:updateChampions()

				var_77_1 = true
			end
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyAchieve) > 0 then
			arg_77_0.levelStageView:updateStageAchieve()
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyAttachment) > 0 then
			arg_77_0.levelStageView:updateAmbushRate(arg_77_1.fleet.line, true)

			if arg_77_0.grid then
				if not (arg_77_2 < 0) and not (bit.band(arg_77_2, ChapterConst.DirtyFleet) > 0) then
					arg_77_0.grid:updateFleet(arg_77_1.fleets[arg_77_1.findex].id)
				end

				arg_77_0.grid:updateAttachments()

				if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyAutoAction) > 0 then
					arg_77_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					var_77_0 = true
				end
			end
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyStrategy) > 0 then
			arg_77_0.levelStageView:updateStageStrategy()

			var_77_2 = true

			arg_77_0.levelStageView:updateStageBarrier()
			arg_77_0.levelStageView:UpdateAutoFightPanel()
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyAutoAction) > 0 then
			-- block empty
		elseif var_77_0 then
			arg_77_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif var_77_1 then
			arg_77_0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyCellFlag) > 0 then
			arg_77_0.grid:UpdateFloor()
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyBase) > 0 then
			arg_77_0.levelStageView:UpdateDefenseStatus()
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyFloatItems) > 0 then
			arg_77_0.grid:UpdateItemCells()
		end

		if arg_77_2 < 0 or bit.band(arg_77_2, ChapterConst.DirtyWeather) > 0 then
			arg_77_0.grid:UpdateWeatherCells()
		end

		if var_77_2 then
			arg_77_0.levelStageView:updateFleetBuff()
		end
	end
end

function var_0_0.updateClouds(arg_78_0)
	arg_78_0.cloudRTFs = {}
	arg_78_0.cloudRects = {}
	arg_78_0.cloudTimer = {}

	for iter_78_0 = 1, 6 do
		local var_78_0 = arg_78_0.clouds:Find("cloud_" .. iter_78_0)
		local var_78_1 = rtf(var_78_0)

		table.insert(arg_78_0.cloudRTFs, var_78_1)
		table.insert(arg_78_0.cloudRects, var_78_1.rect.width)
	end

	arg_78_0:initCloudsPos()

	for iter_78_1, iter_78_2 in ipairs(arg_78_0.cloudRTFs) do
		local var_78_2 = arg_78_0.cloudRects[iter_78_1]
		local var_78_3 = arg_78_0.initPositions[iter_78_1] or Vector2(0, 0)
		local var_78_4 = 30 - var_78_3.y / 20
		local var_78_5 = (arg_78_0.mapWidth + var_78_2) / var_78_4
		local var_78_6

		var_78_6 = LeanTween.moveX(iter_78_2, arg_78_0.mapWidth, var_78_5):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function()
			var_78_2 = arg_78_0.cloudRects[iter_78_1]
			iter_78_2.anchoredPosition = Vector2(-var_78_2, var_78_3.y)

			var_78_6:setFrom(-var_78_2):setTime((arg_78_0.mapWidth + var_78_2) / var_78_4)
		end))
		var_78_6.passed = math.random() * var_78_5
		arg_78_0.cloudTimer[iter_78_1] = var_78_6.uniqueId
	end
end

function var_0_0.RefreshMapBG(arg_80_0)
	arg_80_0:PlayBGM()
	arg_80_0:SwitchMapBG(arg_80_0.contextData.map, nil, true)
end

function var_0_0.updateCouldAnimator(arg_81_0, arg_81_1, arg_81_2)
	if not arg_81_1 then
		return
	end

	local var_81_0 = arg_81_0.contextData.map:getConfig("ani_controller")

	local function var_81_1(arg_82_0)
		arg_82_0 = tf(arg_82_0)

		local var_82_0 = Vector3.one

		if arg_82_0.rect.width > 0 and arg_82_0.rect.height > 0 then
			var_82_0.x = arg_82_0.parent.rect.width / arg_82_0.rect.width
			var_82_0.y = arg_82_0.parent.rect.height / arg_82_0.rect.height
		end

		arg_82_0.localScale = var_82_0

		if var_81_0 and #var_81_0 > 0 then
			local var_82_1 = getProxy(ChapterProxy)

			;(function()
				for iter_83_0, iter_83_1 in ipairs(var_81_0) do
					local var_83_0 = false
					local var_83_1 = iter_83_1[2][1]

					for iter_83_2, iter_83_3 in ipairs(var_83_1) do
						local var_83_2 = var_82_1:GetChapterItemById(iter_83_3)

						if var_83_2 and var_83_2:isClear() then
							var_83_0 = true

							break
						end
					end

					if iter_83_1[1] == var_0_2 then
						local var_83_3 = _.rest(iter_83_1[2], 2)

						for iter_83_4, iter_83_5 in ipairs(var_83_3) do
							local var_83_4 = arg_82_0:Find(iter_83_5)

							if not IsNil(var_83_4) and not var_83_0 then
								setActive(var_83_4, false)
							end
						end
					elseif iter_83_1[1] == var_0_3 then
						local var_83_5 = _.rest(iter_83_1[2], 2)

						for iter_83_6, iter_83_7 in ipairs(var_83_5) do
							local var_83_6 = arg_82_0:Find(iter_83_7)

							if not IsNil(var_83_6) and not var_83_0 then
								setActive(var_83_6, true)

								return
							end
						end
					elseif iter_83_1[1] == var_0_4 then
						local var_83_7 = _.rest(iter_83_1[2], 2)

						for iter_83_8, iter_83_9 in ipairs(var_83_7) do
							local var_83_8 = arg_82_0:Find(iter_83_9)

							if not IsNil(var_83_8) and not var_83_0 then
								setActive(var_83_8, true)
							end
						end
					end
				end
			end)()
		end
	end

	local var_81_2 = arg_81_0.loader:GetPrefab("ui/" .. arg_81_1, arg_81_1, function(arg_84_0)
		arg_84_0:SetActive(true)

		local var_84_0 = arg_81_0.mapTFs[arg_81_2]

		setParent(arg_84_0, var_84_0)
		pg.ViewUtils.SetSortingOrder(arg_84_0, ChapterConst.LayerWeightMap + arg_81_2 * 2 - 1)
		var_81_1(arg_84_0)
	end)

	table.insert(arg_81_0.mapGroup, var_81_2)
end

function var_0_0.HideBtns(arg_85_0)
	setActive(arg_85_0.btnPrev, false)
	setActive(arg_85_0.eliteQuota, false)
	setActive(arg_85_0.escortBar, false)
	setActive(arg_85_0.skirmishBar, false)
	setActive(arg_85_0.normalBtn, false)
	setActive(arg_85_0.actNormalBtn, false)
	setActive(arg_85_0.eliteBtn, false)
	setActive(arg_85_0.actEliteBtn, false)
	setActive(arg_85_0.actExtraBtn, false)
	setActive(arg_85_0.remasterBtn, false)
	setActive(arg_85_0.btnNext, false)
	setActive(arg_85_0.remasterAwardBtn, false)
	setActive(arg_85_0.eventContainer, false)
	setActive(arg_85_0.activityBtn, false)
	setActive(arg_85_0.ptTotal, false)
	setActive(arg_85_0.ticketTxt.parent, false)
	setActive(arg_85_0.countDown, false)
	setActive(arg_85_0.actAtelierBuffBtn, false)
	setActive(arg_85_0.actAtelierYumiaBuffBtn, false)
	setActive(arg_85_0.actExtraRank, false)
	setActive(arg_85_0.actExchangeShopBtn, false)
	setActive(arg_85_0.mapHelpBtn, false)
end

function var_0_0.updateDifficultyBtns(arg_86_0)
	local var_86_0 = arg_86_0.contextData.map:getConfig("type")

	setActive(arg_86_0.normalBtn, var_86_0 == Map.ELITE)
	setActive(arg_86_0.eliteQuota, var_86_0 == Map.ELITE)
	setActive(arg_86_0.eliteBtn, var_86_0 == Map.SCENARIO)

	local var_86_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID)

	setActive(arg_86_0.eliteBtn:Find("pic_activity"), var_86_1 and not var_86_1:isEnd())
end

function var_0_0.updateActivityBtns(arg_87_0)
	local var_87_0 = arg_87_0.contextData.map
	local var_87_1, var_87_2 = var_87_0:isActivity()
	local var_87_3 = var_87_0:isRemaster()
	local var_87_4 = var_87_0:isSkirmish()
	local var_87_5 = var_87_0:isEscort()
	local var_87_6 = var_87_0:getConfig("type")
	local var_87_7 = setmetatable({}, MainActMapBtn)
	local var_87_8 = var_87_7:InShowTime() and not var_87_1 and not var_87_4 and not var_87_5

	arg_87_0.activityBtnLinkAct = var_87_7:GetActivity()

	if var_87_8 then
		var_87_7.image = arg_87_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_87_7.subImage = arg_87_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_87_7.tipTr = arg_87_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_87_7.tipTxt = arg_87_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_87_8 = var_87_7:InShowTime()

		if var_87_8 then
			var_87_7:InitTipImage()
			var_87_7:InitSubImage()
			var_87_7:InitImage(function()
				return
			end)
			var_87_7:OnInit()
		end
	end

	setActive(arg_87_0.activityBtn, var_87_8)
	arg_87_0:updateRemasterInfo()

	if var_87_1 and var_87_2 then
		local var_87_9

		if var_87_0:isRemaster() then
			var_87_9 = getProxy(ChapterProxy):getRemasterMaps(var_87_0.remasterId)
		else
			var_87_9 = getProxy(ChapterProxy):getMapsByActivities(var_87_0:getConfig("on_activity"))
		end

		local var_87_10 = underscore.any(var_87_9, function(arg_89_0)
			return arg_89_0:isActExtra()
		end)

		setActive(arg_87_0.actExtraBtn, var_87_10 and var_87_6 ~= Map.ACT_EXTRA)

		if isActive(arg_87_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_87_9, function(arg_90_0)
				local var_90_0 = arg_90_0:getMapType()

				return var_90_0 == Map.ACTIVITY_EASY or var_90_0 == Map.ACTIVITY_HARD
			end), function(arg_91_0)
				return arg_91_0:isAllChaptersClear()
			end) then
				setActive(arg_87_0.actExtraBtnAnim, true)
			else
				setActive(arg_87_0.actExtraBtnAnim, false)
			end

			setActive(arg_87_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive(var_87_0:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_87_11 = checkExist(var_87_0:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_87_0.actEliteBtn, var_87_11 and var_87_6 ~= Map.ACTIVITY_HARD)
		setActive(arg_87_0.actNormalBtn, var_87_6 ~= Map.ACTIVITY_EASY)
		setActive(arg_87_0.actExtraRank, var_87_6 == Map.ACT_EXTRA and _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK), function(arg_92_0)
			if not arg_92_0 or arg_92_0:isEnd() then
				return
			end

			local var_92_0 = arg_92_0:getConfig("config_data")[1]

			return _.any(var_87_0:getChapters(), function(arg_93_0)
				if not arg_93_0:IsEXChapter() then
					return false
				end

				return table.contains(arg_93_0:getConfig("boss_expedition_id"), var_92_0)
			end)
		end))
		setActive(arg_87_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_87_3 and var_87_2 and arg_87_0:IsActShopActive())

		local var_87_12 = (arg_87_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_87_0.contextData.map:getConfig("on_activity")) or nil):GetConfigClientPTActivity()

		arg_87_0:updatePtActivity(var_87_12)
		setActive(arg_87_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_87_3 and var_87_2 and arg_87_0.ptActivity and not arg_87_0.ptActivity:isEnd())
	else
		setActive(arg_87_0.actExtraBtn, false)
		setActive(arg_87_0.actEliteBtn, false)
		setActive(arg_87_0.actNormalBtn, false)
		setActive(arg_87_0.actExtraRank, false)
		setActive(arg_87_0.actExchangeShopBtn, false)
		setActive(arg_87_0.actAtelierBuffBtn, false)
		setActive(arg_87_0.actAtelierYumiaBuffBtn, false)
		setActive(arg_87_0.ptTotal, false)
	end

	setActive(arg_87_0.eventContainer, (not var_87_1 or not var_87_2) and not var_87_5)
	setActive(arg_87_0.remasterBtn, OPEN_REMASTER and (var_87_3 or not var_87_1 and not var_87_5 and not var_87_4))
	setActive(arg_87_0.ticketTxt.parent, var_87_3)
	arg_87_0:updateRemasterTicket()
	arg_87_0:updateCountDown()
end

function var_0_0.updateRemasterTicket(arg_94_0)
	setText(arg_94_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_94_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_95_0)
	local var_95_0 = getProxy(ChapterProxy)
	local var_95_1 = var_95_0:ifShowRemasterTip() or var_95_0:anyRemasterAwardCanReceive()

	SetActive(arg_95_0.remasterBtn:Find("tip"), var_95_1)
	SetActive(arg_95_0.entranceLayer:Find("btns/btn_remaster/tip"), var_95_1)
end

function var_0_0.updatDailyBtnTip(arg_96_0)
	local var_96_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_96_0.dailyBtn:Find("tip"), var_96_0)
	SetActive(arg_96_0.entranceLayer:Find("btns/btn_daily/tip"), var_96_0)
end

function var_0_0.updateRemasterInfo(arg_97_0)
	arg_97_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_97_0.contextData.map then
		return
	end

	local var_97_0 = getProxy(ChapterProxy)
	local var_97_1 = arg_97_0.contextData.map:getRemaster()
	local var_97_2 = BossRushChapterRemasterHelper.ChapterAwardInfo(var_97_1)

	setActive(arg_97_0.remasterAwardBtn, var_97_2)

	if var_97_2 then
		local var_97_3 = var_97_2[1]
		local var_97_4, var_97_5, var_97_6, var_97_7, var_97_8 = unpack(var_97_2[2])
		local var_97_9 = var_97_2[3]
		local var_97_10 = var_97_0:getRemasterInfo(var_97_9, var_97_4, var_97_3)

		setText(arg_97_0.remasterAwardBtn:Find("Text"), var_97_10.count .. "/" .. var_97_7)
		updateDrop(arg_97_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_97_5,
			id = var_97_6
		})
		setActive(arg_97_0.remasterAwardBtn:Find("tip"), var_97_7 <= var_97_10.count)
		onButton(arg_97_0, arg_97_0.remasterAwardBtn, function()
			local var_98_0 = BossRushChapterRemasterHelper.GetAwardName(var_97_9, var_97_4)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_97_5,
					id = var_97_6
				},
				remaster = {
					word = i18n("level_remaster_tip4", var_98_0),
					number = var_97_10.count .. "/" .. var_97_7,
					btn_text = i18n(var_97_10.count < var_97_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_97_10.count < var_97_7 then
							if var_97_9 and var_97_9 > 0 then
								arg_97_0:emit(LevelMediator2.ON_BOSSRUSH_REMASTER_ACTIVITY, var_97_9)

								return
							end

							local var_99_0 = pg.chapter_template[var_97_4].map
							local var_99_1, var_99_2 = var_97_0:getMapById(var_99_0):isUnlock()

							if not var_99_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_99_2)
							else
								arg_97_0:ShowSelectedMap(var_99_0)
							end
						else
							arg_97_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_97_4, var_97_3, var_97_9)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_100_0)
	local var_100_0 = getProxy(ChapterProxy)

	if arg_100_0.newChapterCDTimer then
		arg_100_0.newChapterCDTimer:Stop()

		arg_100_0.newChapterCDTimer = nil
	end

	local var_100_1 = 0

	if arg_100_0.contextData.map:isActivity() and not arg_100_0.contextData.map:isRemaster() then
		local var_100_2 = var_100_0:getMapsByActivities(arg_100_0.contextData.map:getConfig("on_activity"))

		_.each(var_100_2, function(arg_101_0)
			local var_101_0 = arg_101_0:getChapterTimeLimit()

			if var_100_1 == 0 then
				var_100_1 = var_101_0
			else
				var_100_1 = math.min(var_100_1, var_101_0)
			end
		end)
		setActive(arg_100_0.countDown, var_100_1 > 0)
		setText(arg_100_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_100_0.countDown, false)
	end

	if var_100_1 > 0 then
		setText(arg_100_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_100_1))

		arg_100_0.newChapterCDTimer = Timer.New(function()
			var_100_1 = var_100_1 - 1

			if var_100_1 <= 0 then
				arg_100_0:updateCountDown()

				if not arg_100_0.contextData.chapterVO then
					arg_100_0:setMap(arg_100_0.contextData.mapIdx)
				end
			else
				setText(arg_100_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_100_1))
			end
		end, 1, -1)

		arg_100_0.newChapterCDTimer:Start()
	else
		setText(arg_100_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_103_0)
	onButton(arg_103_0, arg_103_0.actExtraRank, function()
		if arg_103_0:isfrozen() then
			return
		end

		arg_103_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_103_0, arg_103_0.activityBtn, function()
		if arg_103_0:isfrozen() then
			return
		end

		if arg_103_0.activityBtnLinkAct then
			local var_105_0 = arg_103_0.activityBtnLinkAct:getConfig("type")
			local var_105_1 = arg_103_0.activityBtnLinkAct.id

			if var_105_0 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)

				return
			elseif var_105_0 == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_DAL_COLLAB)

				return
			elseif var_105_1 == ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.OTHERWORLD_MAP)

				return
			elseif var_105_0 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ZHANG_WU_BOSS)

				return
			end
		end

		arg_103_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_103_0, arg_103_0.actExchangeShopBtn, function()
		if arg_103_0:isfrozen() then
			return
		end

		arg_103_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_103_0, arg_103_0.actAtelierBuffBtn, function()
		if arg_103_0:isfrozen() then
			return
		end

		arg_103_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)
	onButton(arg_103_0, arg_103_0.actAtelierYumiaBuffBtn, function()
		if arg_103_0:isfrozen() then
			return
		end

		arg_103_0:emit(LevelMediator2.SHOW_ATELIER_BUFF, true)
	end, SFX_UI_CLICK)

	local var_103_0 = getProxy(ChapterProxy)

	local function var_103_1(arg_109_0, arg_109_1, arg_109_2)
		local var_109_0

		if arg_109_0:isRemaster() then
			var_109_0 = var_103_0:getRemasterMaps(arg_109_0.remasterId)
		else
			var_109_0 = var_103_0:getMapsByActivities(arg_109_0:getConfig("on_activity"))
		end

		local var_109_1 = _.select(var_109_0, function(arg_110_0)
			return arg_110_0:getMapType() == arg_109_1
		end)

		table.sort(var_109_1, function(arg_111_0, arg_111_1)
			return arg_111_0.id < arg_111_1.id
		end)

		local var_109_2 = table.indexof(underscore.map(var_109_1, function(arg_112_0)
			return arg_112_0.id
		end), arg_109_2) or #var_109_1

		while not var_109_1[var_109_2]:isUnlock() do
			if var_109_2 > 1 then
				var_109_2 = var_109_2 - 1
			else
				break
			end
		end

		return var_109_1[var_109_2]
	end

	arg_103_0:bind(LevelUIConst.SWITCH_ACT_MAP, function(arg_113_0, arg_113_1, arg_113_2)
		arg_113_2 = arg_113_2 or switch(arg_113_1, {
			[Map.ACTIVITY_EASY] = function()
				return arg_103_0.contextData.map:getBindMapId()
			end,
			[Map.ACTIVITY_HARD] = function()
				return arg_103_0.contextData.map:getBindMapId()
			end,
			[Map.ACT_EXTRA] = function()
				return PlayerPrefs.GetInt("ex_mapId", 0)
			end
		})

		local var_113_0 = var_103_1(arg_103_0.contextData.map, arg_113_1, arg_113_2)
		local var_113_1, var_113_2 = var_113_0:isUnlock()

		if var_113_1 then
			arg_103_0:setMap(var_113_0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_113_2)
		end
	end)
	onButton(arg_103_0, arg_103_0.actNormalBtn, function()
		if arg_103_0:isfrozen() then
			return
		end

		arg_103_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
	onButton(arg_103_0, arg_103_0.actEliteBtn, function()
		if arg_103_0:isfrozen() then
			return
		end

		arg_103_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(arg_103_0, arg_103_0.actExtraBtn, function()
		if arg_103_0:isfrozen() then
			return
		end

		arg_103_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACT_EXTRA)
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_120_0, arg_120_1)
	arg_120_0.initPositions = {}

	local var_120_0 = arg_120_1 or 1
	local var_120_1 = pg.expedition_data_by_map[var_120_0].clouds_pos

	for iter_120_0, iter_120_1 in ipairs(arg_120_0.cloudRTFs) do
		local var_120_2 = var_120_1[iter_120_0]

		if var_120_2 then
			iter_120_1.anchoredPosition = Vector2(var_120_2[1], var_120_2[2])

			table.insert(arg_120_0.initPositions, iter_120_1.anchoredPosition)
		else
			setActive(iter_120_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_121_0, arg_121_1, arg_121_2)
	onButton(arg_121_0, arg_121_1, function()
		if arg_121_0:isfrozen() then
			return
		end

		local var_122_0 = arg_121_0.contextData.mapIdx + arg_121_2
		local var_122_1 = getProxy(ChapterProxy):getMapById(var_122_0)

		if not var_122_1 then
			return
		end

		if var_122_1:getMapType() == Map.ELITE and not var_122_1:isEliteEnabled() then
			var_122_1 = var_122_1:getBindMap()
			var_122_0 = var_122_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_122_2, var_122_3 = var_122_1:isUnlock()

		if arg_121_2 > 0 and not var_122_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_122_3)

			return
		end

		arg_121_0:setMap(var_122_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_123_0, arg_123_1, arg_123_2)
	seriesAsync({
		function(arg_124_0)
			if arg_123_0.contextData.entranceStatus then
				arg_123_0:frozen()

				arg_123_0.nextPreloadMap = arg_123_1

				arg_123_0:PreloadLevelMainUI(arg_123_1, function()
					arg_123_0:unfrozen()

					if arg_123_0.nextPreloadMap ~= arg_123_1 then
						return
					end

					arg_123_0:ShowEntranceUI(false)
					arg_123_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_123_1)
					arg_124_0()
				end)
			else
				arg_123_0:setMap(arg_123_1)
				arg_124_0()
			end
		end
	}, arg_123_2)
end

function var_0_0.setMap(arg_126_0, arg_126_1)
	local var_126_0 = arg_126_0.contextData.mapIdx

	arg_126_0.contextData.mapIdx = arg_126_1
	arg_126_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_126_1)

	assert(arg_126_0.contextData.map, "map cannot be nil " .. arg_126_1)

	if arg_126_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_126_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_126_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_126_0.contextData.map.remasterId, arg_126_1)
		PlayerPrefs.Save()
	end

	arg_126_0:RecordLastMapOnExit()
	arg_126_0:updateMap(var_126_0)
	arg_126_0:tryPlayMapStory()
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

function var_0_0.SwitchMapBuilder(arg_127_0, arg_127_1)
	if arg_127_0.mapBuilder and arg_127_0.mapBuilder:GetType() ~= arg_127_1 then
		arg_127_0.mapBuilder.buffer:Hide()
	end

	local var_127_0 = arg_127_0:GetMapBuilderInBuffer(arg_127_1)

	arg_127_0.mapBuilder = var_127_0

	var_127_0.buffer:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_128_0, arg_128_1)
	if not arg_128_0.mbDict[arg_128_1] then
		local var_128_0 = _G[var_0_6[arg_128_1]]

		assert(var_128_0, "Missing MapBuilder of type " .. (arg_128_1 or "NIL"))

		arg_128_0.mbDict[arg_128_1] = var_128_0.New(arg_128_0._tf, arg_128_0)
		arg_128_0.mbDict[arg_128_1].isFrozen = arg_128_0:isfrozen()

		arg_128_0.mbDict[arg_128_1]:Load()
	end

	return arg_128_0.mbDict[arg_128_1]
end

function var_0_0.updateMap(arg_129_0, arg_129_1)
	local var_129_0 = arg_129_0.contextData.map
	local var_129_1 = var_129_0:getConfig("anchor")
	local var_129_2

	if var_129_1 == "" then
		var_129_2 = Vector2(0.5, 0.5)
	else
		var_129_2 = Vector2(unpack(var_129_1))
	end

	arg_129_0.map.pivot = var_129_2

	local var_129_3 = var_129_0:getConfig("uifx")

	for iter_129_0 = 1, arg_129_0.UIFXList.childCount do
		local var_129_4 = arg_129_0.UIFXList:GetChild(iter_129_0 - 1)

		setActive(var_129_4, var_129_4.name == var_129_3)
	end

	arg_129_0:SwitchMapBG(var_129_0, arg_129_1)
	arg_129_0:PlayBGM()

	local var_129_5 = arg_129_0.contextData.map:getConfig("ui_type")

	arg_129_0:SwitchMapBuilder(var_129_5)
	seriesAsync({
		function(arg_130_0)
			arg_129_0.mapBuilder:CallbackInvoke(arg_130_0)
		end,
		function(arg_131_0)
			arg_129_0.mapBuilder:UpdateMapVO(var_129_0)
			arg_129_0.mapBuilder:UpdateView()
			arg_129_0.mapBuilder:UpdateMapItems()
			arg_129_0.mapBuilder:PlayEnterAnim()
		end
	})
end

function var_0_0.UpdateSwitchMapButton(arg_132_0)
	local var_132_0 = arg_132_0.contextData.map
	local var_132_1 = getProxy(ChapterProxy)
	local var_132_2 = var_132_1:getMapById(var_132_0.id - 1)
	local var_132_3 = var_132_1:getMapById(var_132_0.id + 1)

	setActive(arg_132_0.btnPrev, tobool(var_132_2))
	setActive(arg_132_0.btnNext, tobool(var_132_3))

	local var_132_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_132_0.btnPrevCol, var_132_2 and Color.white or var_132_4)
	setImageColor(arg_132_0.btnNextCol, var_132_3 and var_132_3:isUnlock() and Color.white or var_132_4)
end

function var_0_0.tryPlayMapStory(arg_133_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_134_0)
			local var_134_0 = arg_133_0.contextData.map:getConfig("enter_story")

			if var_134_0 and var_134_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_134_0) and not arg_133_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_134_1 = tonumber(var_134_0)

				if var_134_1 and var_134_1 > 0 then
					arg_133_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_134_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_134_0, arg_134_0)
				end

				return
			end

			arg_134_0()
		end,
		function(arg_135_0)
			local var_135_0 = arg_133_0.contextData.map:getConfig("guide_id")

			if var_135_0 and var_135_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_135_0, nil, arg_135_0)

				return
			end

			arg_135_0()
		end,
		function(arg_136_0)
			if isActive(arg_133_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_136_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_136_1

				if var_136_0 then
					var_136_1 = {
						1,
						2
					}
				else
					var_136_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_136_1)
			else
				arg_136_0()
			end
		end,
		function(arg_137_0)
			if arg_133_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_133_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_138_0, arg_138_1, arg_138_2, arg_138_3)
	arg_138_0.uiAnims = arg_138_0.uiAnims or {}

	local var_138_0 = arg_138_0.uiAnims[arg_138_1]

	local function var_138_1()
		arg_138_0.playing = true

		arg_138_0:frozen()
		var_138_0:SetActive(true)

		local var_139_0 = tf(var_138_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_139_0)

		if arg_138_3 then
			arg_138_3(var_138_0)
		end

		var_139_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_140_0)
			arg_138_0.playing = false

			if arg_138_2 then
				arg_138_2(var_138_0)
			end

			arg_138_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_138_0 then
		PoolMgr.GetInstance():GetUI(arg_138_1, true, function(arg_141_0)
			arg_141_0:SetActive(true)

			arg_138_0.uiAnims[arg_138_1] = arg_141_0
			var_138_0 = arg_138_0.uiAnims[arg_138_1]

			var_138_1()
		end)
	else
		var_138_1()
	end
end

function var_0_0.displaySpResult(arg_142_0, arg_142_1, arg_142_2)
	setActive(arg_142_0.spResult, true)
	arg_142_0:DisplaySPAnim(arg_142_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_143_0)
		onButton(arg_142_0, arg_143_0, function()
			removeOnButton(arg_143_0)
			setActive(arg_143_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_143_0, arg_142_0._tf)
			arg_142_0:hideSpResult()
			arg_142_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_145_0)
	setActive(arg_145_0.spResult, false)
end

function var_0_0.displayBombResult(arg_146_0, arg_146_1)
	setActive(arg_146_0.spResult, true)
	arg_146_0:DisplaySPAnim("SpBombRet", function(arg_147_0)
		onButton(arg_146_0, arg_147_0, function()
			removeOnButton(arg_147_0)
			setActive(arg_147_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_147_0, arg_146_0._tf)
			arg_146_0:hideSpResult()
			arg_146_1()
		end, SFX_PANEL)
	end, function(arg_149_0)
		setText(arg_149_0.transform:Find("right/name_bg/en"), arg_146_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_150_0, arg_150_1, arg_150_2)
	arg_150_0.contextData.chapterLoopFlag = arg_150_2

	local var_150_0 = getProxy(ChapterProxy):getChapterById(arg_150_1, true)

	if var_150_0:getConfig("type") == Chapter.CustomFleet then
		arg_150_0:displayFleetEdit(var_150_0)

		return
	end

	if #var_150_0:getNpcShipByType(1) > 0 then
		arg_150_0:emit(LevelMediator2.ON_TRACKING, arg_150_1)

		return
	end

	arg_150_0:displayFleetSelect(var_150_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_151_0, arg_151_1, arg_151_2)
	seriesAsync({
		function(arg_152_0)
			if not arg_151_0.levelInfoView:GetLoaded() then
				arg_151_0:frozen()
				arg_151_0.levelInfoView:Load()
				arg_151_0.levelInfoView:CallbackInvoke(function()
					arg_151_0:unfrozen()
					arg_152_0()
				end)

				return
			end

			arg_152_0()
		end,
		function(arg_154_0)
			local function var_154_0(arg_155_0, arg_155_1)
				arg_151_0:hideChapterPanel()
				arg_151_0:OnLevelInfoPanelConfirm(arg_155_0, arg_155_1)
			end

			local function var_154_1()
				arg_151_0:hideChapterPanel()
			end

			local var_154_2 = getProxy(ChapterProxy):getChapterById(arg_151_1, true)

			if getProxy(ChapterProxy):getMapById(var_154_2:getConfig("map")):isSkirmish() and #var_154_2:getNpcShipByType(1) > 0 then
				var_154_0(false)

				return
			end

			arg_151_0.levelInfoView:set(arg_151_1, arg_151_2)
			arg_151_0.levelInfoView:setCBFunc(var_154_0, var_154_1)
			arg_151_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_157_0)
	if arg_157_0.levelInfoView:isShowing() then
		arg_157_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_158_0)
	arg_158_0.levelInfoView:Destroy()

	arg_158_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_159_0, arg_159_1, arg_159_2, arg_159_3)
	seriesAsync({
		function(arg_160_0)
			if not arg_159_0.levelInfoSPView then
				arg_159_0.levelInfoSPView = LevelInfoSPView.New(arg_159_0.topPanel, arg_159_0.event, arg_159_0.contextData)

				arg_159_0.levelInfoSPView:RegisterView(arg_159_0)
				arg_159_0:frozen()
				arg_159_0.levelInfoSPView:Load()
				arg_159_0.levelInfoSPView:CallbackInvoke(function()
					arg_159_0:unfrozen()
					arg_160_0()
				end)

				return
			end

			arg_160_0()
		end,
		function(arg_162_0)
			local function var_162_0(arg_163_0, arg_163_1)
				arg_159_0:HideLevelInfoSPPanel()
				arg_159_0:OnLevelInfoPanelConfirm(arg_163_0, arg_163_1)
			end

			local function var_162_1()
				arg_159_0:HideLevelInfoSPPanel()
			end

			arg_159_0.levelInfoSPView:SetChapterGroupInfo(arg_159_2)
			arg_159_0.levelInfoSPView:set(arg_159_1, arg_159_3)
			arg_159_0.levelInfoSPView:setCBFunc(var_162_0, var_162_1)
			arg_159_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_165_0)
	if arg_165_0.levelInfoSPView and arg_165_0.levelInfoSPView:isShowing() then
		arg_165_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_166_0)
	if not arg_166_0.levelInfoSPView then
		return
	end

	arg_166_0.levelInfoSPView:Destroy()

	arg_166_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_167_0, arg_167_1)
	local var_167_0 = arg_167_0.contextData.selectedFleetIDs or arg_167_1:GetDefaultFleetIndex()

	arg_167_1 = Clone(arg_167_1)
	arg_167_1.loopFlag = arg_167_0.contextData.chapterLoopFlag

	arg_167_0.levelFleetView:updateSpecialOperationTickets(arg_167_0.spTickets)
	arg_167_0.levelFleetView:Load()
	arg_167_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_167_0.shipVOs)
	arg_167_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_167_0.openedCommanerSystem)
	arg_167_0.levelFleetView:ActionInvoke("set", arg_167_1, arg_167_0.fleets, var_167_0)
	arg_167_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_168_0)
	if arg_168_0.levelCMDFormationView:isShowing() then
		arg_168_0.levelCMDFormationView:Hide()
	end

	if arg_168_0.levelFleetView then
		arg_168_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_169_0)
	arg_169_0.levelCMDFormationView = LevelCMDFormationView.New(arg_169_0.topPanel, arg_169_0.event, arg_169_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_170_0)
	if not arg_170_0.levelFleetView then
		return
	end

	arg_170_0.levelFleetView:Destroy()

	arg_170_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_171_0, arg_171_1)
	arg_171_1 = Clone(arg_171_1)
	arg_171_1.loopFlag = arg_171_0.contextData.chapterLoopFlag

	arg_171_0.levelFleetView:updateSpecialOperationTickets(arg_171_0.spTickets)
	arg_171_0.levelFleetView:Load()
	arg_171_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_171_0.openedCommanerSystem)
	arg_171_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_171_0.shipVOs)
	arg_171_0.levelFleetView:ActionInvoke("setOnHard", arg_171_1)
	arg_171_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_172_0)
	arg_172_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_173_0)
	arg_173_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_174_0, arg_174_1)
	if not arg_174_0.levelFleetView then
		return
	end

	assert(arg_174_0.levelFleetView:GetLoaded())

	local var_174_0 = arg_174_0.levelFleetView:IsSelectMode()
	local var_174_1

	if var_174_0 then
		arg_174_0.levelFleetView:ActionInvoke("set", arg_174_1 or arg_174_0.levelFleetView.chapter, arg_174_0.fleets, arg_174_0.levelFleetView:getSelectIds())

		if arg_174_0.levelCMDFormationView:isShowing() then
			local var_174_2 = arg_174_0.levelCMDFormationView.fleet.id

			var_174_1 = arg_174_0.fleets[var_174_2]
		end
	else
		arg_174_0.levelFleetView:ActionInvoke("setOnHard", arg_174_1 or arg_174_0.levelFleetView.chapter)

		if arg_174_0.levelCMDFormationView:isShowing() then
			local var_174_3 = arg_174_0.levelCMDFormationView.fleet.id

			var_174_1 = arg_174_1:wrapEliteFleet(var_174_3)
		end
	end

	if var_174_1 then
		arg_174_0.levelCMDFormationView:ActionInvoke("updateFleet", var_174_1)
	end
end

function var_0_0.setChapter(arg_175_0, arg_175_1)
	local var_175_0

	if arg_175_1 then
		var_175_0 = arg_175_1.id
	end

	arg_175_0.contextData.chapterId = var_175_0
	arg_175_0.contextData.chapterVO = arg_175_1
end

function var_0_0.switchToChapter(arg_176_0, arg_176_1)
	if arg_176_0.contextData.mapIdx ~= arg_176_1:getConfig("map") then
		arg_176_0:setMap(arg_176_1:getConfig("map"))
	end

	arg_176_0:setChapter(arg_176_1)

	arg_176_0.leftCanvasGroup.blocksRaycasts = false
	arg_176_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_176_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_176_0:DestroyLevelStageView()

	if not arg_176_0.levelStageView then
		arg_176_0.levelStageView = LevelStageView.New(arg_176_0.topPanel, arg_176_0.event, arg_176_0.contextData)

		arg_176_0.levelStageView:Load()

		arg_176_0.levelStageView.isFrozen = arg_176_0:isfrozen()
	end

	arg_176_0:frozen()

	local function var_176_0()
		seriesAsync({
			function(arg_178_0)
				arg_176_0.mapBuilder:CallbackInvoke(arg_178_0)
			end,
			function(arg_179_0)
				setActive(arg_176_0.clouds, false)
				arg_176_0.mapBuilder:HideFloat()
				arg_176_0:BlurPanel(arg_176_0.topPanel, {
					blurCamList = {
						pg.UIMgr.CameraUI
					}
				})
				arg_176_0.levelStageView:updateStageInfo()
				arg_176_0.levelStageView:updateAmbushRate(arg_176_1.fleet.line, true)
				arg_176_0.levelStageView:updateStageAchieve()
				arg_176_0.levelStageView:updateStageBarrier()
				arg_176_0.levelStageView:updateBombPanel()
				arg_176_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_179_0)
			end,
			function(arg_180_0)
				if arg_176_0.exited then
					return
				end

				arg_176_0.levelStageView:updateStageStrategy()

				arg_176_0.canvasGroup.blocksRaycasts = arg_176_0.frozenCount == 0

				onNextTick(arg_180_0)
			end,
			function(arg_181_0)
				if arg_176_0.exited then
					return
				end

				arg_176_0.levelStageView:updateStageFleet()
				arg_176_0.levelStageView:updateSupportFleet()
				arg_176_0.levelStageView:updateFleetBuff()
				onNextTick(arg_181_0)
			end,
			function(arg_182_0)
				if arg_176_0.exited then
					return
				end

				parallelAsync({
					function(arg_183_0)
						local var_183_0 = arg_176_1:getConfig("scale")
						local var_183_1 = LeanTween.value(go(arg_176_0.map), arg_176_0.map.localScale, Vector3.New(var_183_0[3], var_183_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_184_0)
							arg_176_0.map.localScale = arg_184_0
							arg_176_0.float.localScale = arg_184_0
						end):setOnComplete(System.Action(function()
							arg_176_0.mapBuilder:ShowFloat()
							arg_176_0.mapBuilder:Hide()
							arg_183_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_176_0:RecordTween("mapScale", var_183_1.uniqueId)

						local var_183_2 = LeanTween.value(go(arg_176_0.map), arg_176_0.map.pivot, Vector2.New(math.clamp(var_183_0[1] - 0.5, 0, 1), math.clamp(var_183_0[2] - 0.5, 0, 1)), var_0_1)

						var_183_2:setOnUpdateVector2(function(arg_186_0)
							arg_176_0.map.pivot = arg_186_0
							arg_176_0.float.pivot = arg_186_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_176_0:RecordTween("mapPivot", var_183_2.uniqueId)
						shiftPanel(arg_176_0.leftChapter, -arg_176_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_176_0.rightChapter, arg_176_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_176_0.topChapter, 0, arg_176_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_176_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_187_0)
						arg_176_0:PlayBGM()

						local var_187_0 = {}
						local var_187_1 = arg_176_1:getConfig("bg")

						if var_187_1 and #var_187_1 > 0 then
							var_187_0[1] = {
								BG = var_187_1
							}
						end

						arg_176_0:SwitchBG(var_187_0, arg_187_0)
					end
				}, function()
					onNextTick(arg_182_0)
				end)
			end,
			function(arg_189_0)
				if arg_176_0.exited then
					return
				end

				setActive(arg_176_0.topChapter, false)
				setActive(arg_176_0.leftChapter, false)
				setActive(arg_176_0.rightChapter, false)

				arg_176_0.leftCanvasGroup.blocksRaycasts = true
				arg_176_0.rightCanvasGroup.blocksRaycasts = true

				arg_176_0:initGrid(arg_189_0)
			end,
			function(arg_190_0)
				if arg_176_0.exited then
					return
				end

				arg_176_0.levelStageView:SetGrid(arg_176_0.grid)

				arg_176_0.contextData.huntingRangeVisibility = arg_176_0.contextData.huntingRangeVisibility - 1

				arg_176_0.grid:toggleHuntingRange()

				local var_190_0 = arg_176_1:getConfig("pop_pic")

				if var_190_0 and #var_190_0 > 0 and arg_176_0.FirstEnterChapter == arg_176_1.id then
					arg_176_0:doPlayAnim(var_190_0, function(arg_191_0)
						setActive(arg_191_0, false)

						if arg_176_0.exited then
							return
						end

						arg_190_0()
					end)
				else
					arg_190_0()
				end
			end,
			function(arg_192_0)
				arg_176_0.levelStageView:tryAutoAction(arg_192_0)
			end,
			function(arg_193_0)
				if arg_176_0.exited then
					return
				end

				arg_176_0:unfrozen()

				if arg_176_0.FirstEnterChapter then
					arg_176_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_176_1.subAutoAttack)
				end

				arg_176_0.FirstEnterChapter = nil

				arg_193_0()
			end,
			function(arg_194_0)
				if arg_176_1:NeedSupportSubmarineStage() then
					arg_176_0.levelStageView:TryEnterChapterSupportSubmarineStage(arg_194_0)
				else
					arg_194_0()
				end
			end
		}, function()
			arg_176_0.levelStageView:tryAutoTrigger(true)
		end)
	end

	arg_176_0.levelStageView:ActionInvoke("SetSeriesOperation", var_176_0)
	arg_176_0.levelStageView:ActionInvoke("SetPlayer", arg_176_0.player)
	arg_176_0.levelStageView:ActionInvoke("SwitchToChapter", arg_176_1)
end

function var_0_0.switchToMap(arg_196_0, arg_196_1)
	arg_196_0:frozen()
	arg_196_0:destroyGrid()
	arg_196_0:setChapter(nil)
	LeanTween.cancel(go(arg_196_0.map))

	local var_196_0 = LeanTween.value(go(arg_196_0.map), arg_196_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_197_0)
		arg_196_0.map.localScale = arg_197_0
		arg_196_0.float.localScale = arg_197_0
	end):setOnComplete(System.Action(function()
		arg_196_0:unfrozen()
		arg_196_0.mapBuilder:PlayEnterAnim()
		existCall(arg_196_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_196_0:RecordTween("mapScale", var_196_0.uniqueId)

	local var_196_1 = arg_196_0.contextData.map:getConfig("anchor")
	local var_196_2

	if var_196_1 == "" then
		var_196_2 = Vector2(0.5, 0.5)
	else
		var_196_2 = Vector2(unpack(var_196_1))
	end

	local var_196_3 = LeanTween.value(go(arg_196_0.map), arg_196_0.map.pivot, var_196_2, var_0_1)

	var_196_3:setOnUpdateVector2(function(arg_199_0)
		arg_196_0.map.pivot = arg_199_0
		arg_196_0.float.pivot = arg_199_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_196_0:RecordTween("mapPivot", var_196_3.uniqueId)
	setActive(arg_196_0.topChapter, true)
	setActive(arg_196_0.leftChapter, true)
	setActive(arg_196_0.rightChapter, true)
	shiftPanel(arg_196_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_196_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_196_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_196_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_196_0.levelStageView then
		arg_196_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_196_0:DestroyLevelStageView()
		end)
		arg_196_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_196_0:SwitchMapBG(arg_196_0.contextData.map)
	arg_196_0:PlayBGM()
	seriesAsync({
		function(arg_201_0)
			arg_196_0.mapBuilder:CallbackInvoke(arg_201_0)
		end,
		function(arg_202_0)
			arg_196_0.mapBuilder:Show()
			arg_196_0.mapBuilder:UpdateView()
			arg_196_0.mapBuilder:UpdateMapItems()
		end
	})
	arg_196_0:UnOverlayPanel(arg_196_0.topPanel, arg_196_0._tf)

	arg_196_0.canvasGroup.blocksRaycasts = arg_196_0.frozenCount == 0
	arg_196_0.canvasGroup.interactable = true

	if arg_196_0.ambushWarning and arg_196_0.ambushWarning.activeSelf then
		arg_196_0.ambushWarning:SetActive(false)
		arg_196_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_203_0, arg_203_1, arg_203_2, arg_203_3)
	if not arg_203_1 or #arg_203_1 <= 0 then
		existCall(arg_203_2)

		return
	elseif arg_203_3 then
		-- block empty
	elseif table.equal(arg_203_0.currentBG, arg_203_1) then
		return
	end

	arg_203_0.currentBG = arg_203_1

	for iter_203_0, iter_203_1 in ipairs(arg_203_0.mapGroup) do
		arg_203_0.loader:ClearRequest(iter_203_1)
	end

	table.clear(arg_203_0.mapGroup)

	local var_203_0 = {}

	table.ParallelIpairsAsync(arg_203_1, function(arg_204_0, arg_204_1, arg_204_2)
		local var_204_0 = arg_203_0.mapTFs[arg_204_0]
		local var_204_1 = arg_204_1.bgPrefix and arg_204_1.bgPrefix .. "/" or "levelmap/"
		local var_204_2 = arg_203_0.loader:GetSpriteDirect(var_204_1 .. arg_204_1.BG, "", function(arg_205_0)
			var_203_0[arg_204_0] = arg_205_0

			arg_204_2()
		end, var_204_0)

		table.insert(arg_203_0.mapGroup, var_204_2)
		arg_203_0:updateCouldAnimator(arg_204_1.Animator, arg_204_0)
	end, function()
		for iter_206_0, iter_206_1 in ipairs(arg_203_0.mapTFs) do
			setImageSprite(iter_206_1, var_203_0[iter_206_0])
			setActive(iter_206_1, arg_203_1[iter_206_0])
			SetCompomentEnabled(iter_206_1, typeof(Image), true)
		end

		existCall(arg_203_2)
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

function var_0_0.ClearMapTransitions(arg_207_0)
	if not arg_207_0.mapTransitions then
		return
	end

	for iter_207_0, iter_207_1 in pairs(arg_207_0.mapTransitions) do
		if iter_207_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_207_0, iter_207_0, iter_207_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_207_0, iter_207_0)
		end
	end

	arg_207_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_208_0, arg_208_1, arg_208_2, arg_208_3)
	local var_208_0, var_208_1, var_208_2 = arg_208_0:GetMapBG(arg_208_1, arg_208_2)
	local var_208_3 = {}

	if var_208_1 then
		table.insert(var_208_3, function(arg_209_0)
			arg_208_0:PlayMapTransition("LevelMapTransition_" .. var_208_1, var_208_2, arg_209_0)
		end)
	end

	seriesAsync(var_208_3, function()
		arg_208_0:SwitchBGMapType(arg_208_1:getConfig("pos_type"))
		arg_208_0:SwitchBG(var_208_0, nil, arg_208_3)
	end)
end

function var_0_0.SwitchBGMapType(arg_211_0, arg_211_1)
	if arg_211_0.posType == arg_211_1 then
		return
	end

	for iter_211_0, iter_211_1 in ipairs({
		arg_211_0.map,
		arg_211_0.float
	}) do
		local var_211_0 = GetOrAddComponent(iter_211_1, typeof(AspectRatioFitter))

		var_211_0.aspectRatio = 1.7777777777777777
		var_211_0.enabled = arg_211_1 == 0

		if arg_211_1 == 1 then
			iter_211_1.anchorMin = Vector2(0.5, 0.5)
			iter_211_1.anchorMax = Vector2(0.5, 0.5)

			setSizeDelta(var_211_0, {
				x = 2520,
				y = 1440
			})
		end
	end
end

function var_0_0.GetMapBG(arg_212_0, arg_212_1, arg_212_2)
	if not table.contains(var_0_7, arg_212_1.id) then
		return {
			arg_212_0:GetMapElement(arg_212_1)
		}
	end

	local var_212_0 = arg_212_1.id
	local var_212_1 = table.indexof(var_0_7, var_212_0) - 1
	local var_212_2 = bit.lshift(bit.rshift(var_212_1, 1), 1) + 1
	local var_212_3 = {
		var_0_7[var_212_2],
		var_0_7[var_212_2 + 1]
	}
	local var_212_4 = _.map(var_212_3, function(arg_213_0)
		return getProxy(ChapterProxy):getMapById(arg_213_0)
	end)

	if _.all(var_212_4, function(arg_214_0)
		return arg_214_0:isAllChaptersClear()
	end) then
		local var_212_5 = {
			arg_212_0:GetMapElement(arg_212_1)
		}

		if not arg_212_2 or math.abs(var_212_0 - arg_212_2) ~= 1 then
			return var_212_5
		end

		local var_212_6 = var_0_9[bit.rshift(var_212_2 - 1, 1) + 1]
		local var_212_7 = bit.band(var_212_1, 1) == 1

		return var_212_5, var_212_6, var_212_7
	else
		local var_212_8 = 0

		;(function()
			local var_215_0 = var_212_4[1]:getChapters()

			for iter_215_0, iter_215_1 in ipairs(var_215_0) do
				if not iter_215_1:isClear() then
					return
				end

				var_212_8 = var_212_8 + 1
			end

			if not var_212_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_212_8 = var_212_8 + 1

			local var_215_1 = var_212_4[2]:getChapters()

			for iter_215_2, iter_215_3 in ipairs(var_215_1) do
				if not iter_215_3:isClear() then
					return
				end

				var_212_8 = var_212_8 + 1
			end
		end)()

		local var_212_9

		if var_212_8 > 0 then
			local var_212_10 = var_0_8[bit.rshift(var_212_2 - 1, 1) + 1]

			var_212_9 = {
				{
					BG = "map_" .. var_212_10[1],
					Animator = var_212_10[2]
				},
				{
					BG = "map_" .. var_212_10[3] + var_212_8,
					Animator = var_212_10[4]
				}
			}
		else
			var_212_9 = {
				arg_212_0:GetMapElement(arg_212_1)
			}
		end

		return var_212_9
	end
end

function var_0_0.GetMapElement(arg_216_0, arg_216_1)
	local var_216_0 = arg_216_1:getConfig("bg")
	local var_216_1 = arg_216_1:getConfig("ani_controller")

	if var_216_1 and #var_216_1 > 0 then
		(function()
			local var_217_0 = getProxy(ChapterProxy)

			for iter_217_0, iter_217_1 in ipairs(var_216_1) do
				local var_217_1 = _.rest(iter_217_1[2], 2)

				for iter_217_2, iter_217_3 in ipairs(var_217_1) do
					if string.find(iter_217_3, "^map_") and iter_217_1[1] == var_0_3 then
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
							var_216_0 = iter_217_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_216_2 = {
		BG = var_216_0
	}

	var_216_2.Animator, var_216_2.AnimatorController = arg_216_0:GetMapAnimator(arg_216_1)

	return var_216_2
end

function var_0_0.GetMapAnimator(arg_218_0, arg_218_1)
	local var_218_0 = arg_218_1:getConfig("ani_name")

	if arg_218_1:getConfig("animtor") == 1 and var_218_0 and #var_218_0 > 0 then
		local var_218_1 = arg_218_1:getConfig("ani_controller")

		if var_218_1 and #var_218_1 > 0 then
			(function()
				local var_219_0 = getProxy(ChapterProxy)

				for iter_219_0, iter_219_1 in ipairs(var_218_1) do
					local var_219_1 = _.rest(iter_219_1[2], 2)

					for iter_219_2, iter_219_3 in ipairs(var_219_1) do
						if string.find(iter_219_3, "^effect_") and iter_219_1[1] == var_0_3 then
							local var_219_2 = iter_219_1[2][1]
							local var_219_3 = false

							for iter_219_4, iter_219_5 in ipairs(var_219_2) do
								local var_219_4 = var_219_0:GetChapterItemById(iter_219_5)

								if var_219_4 and var_219_4:isClear() then
									var_219_3 = true

									break
								end
							end

							if not var_219_3 then
								var_218_0 = "map_" .. string.sub(iter_219_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_218_0, var_218_1
	end
end

function var_0_0.PlayMapTransition(arg_220_0, arg_220_1, arg_220_2, arg_220_3, arg_220_4)
	arg_220_0.mapTransitions = arg_220_0.mapTransitions or {}

	local var_220_0

	local function var_220_1()
		arg_220_0:frozen()
		existCall(arg_220_3, var_220_0)
		var_220_0:SetActive(true)

		local var_221_0 = tf(var_220_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_221_0)
		var_220_0:GetComponent(typeof(Animator)):Play(arg_220_2 and "Sequence" or "Inverted", -1, 0)
		var_221_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_222_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_221_0, arg_220_0._tf)
			existCall(arg_220_4, var_220_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_220_1, arg_220_1, var_220_0)

			arg_220_0.mapTransitions[arg_220_1] = false

			arg_220_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_220_1, arg_220_1, true, function(arg_223_0)
		var_220_0 = arg_223_0
		arg_220_0.mapTransitions[arg_220_1] = arg_223_0

		var_220_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_224_0)
	if arg_224_0.levelStageView then
		arg_224_0.levelStageView:Destroy()

		arg_224_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_225_0, arg_225_1)
	arg_225_0.levelAmbushView = LevelAmbushView.New(arg_225_0.topPanel, arg_225_0.event, arg_225_0.contextData)

	arg_225_0.levelAmbushView:Load()
	arg_225_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_225_1)
end

function var_0_0.hideAmbushInfo(arg_226_0)
	if arg_226_0.levelAmbushView then
		arg_226_0.levelAmbushView:Destroy()

		arg_226_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_227_0, arg_227_1)
	arg_227_0:frozen()

	local function var_227_0()
		arg_227_0.ambushWarning:SetActive(true)

		local var_228_0 = tf(arg_227_0.ambushWarning)

		var_228_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_228_0:SetSiblingIndex(1)

		local var_228_1 = var_228_0:GetComponent("DftAniEvent")

		var_228_1:SetTriggerEvent(function(arg_229_0)
			arg_227_1()
		end)
		var_228_1:SetEndEvent(function(arg_230_0)
			arg_227_0.ambushWarning:SetActive(false)
			arg_227_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_227_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_232_0)
			arg_232_0:SetActive(true)

			arg_227_0.ambushWarning = arg_232_0

			var_227_0()
		end)
	else
		var_227_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_233_0)
	if arg_233_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_233_0.ambushWarning)

		arg_233_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_234_0, arg_234_1)
	arg_234_0.levelStrategyView = LevelStrategyView.New(arg_234_0.topPanel, arg_234_0.event, arg_234_0.contextData)

	arg_234_0.levelStrategyView:Load()
	arg_234_0.levelStrategyView:ActionInvoke("set", arg_234_1)

	local function var_234_0()
		local var_235_0 = arg_234_0.contextData.chapterVO.fleet
		local var_235_1 = pg.strategy_data_template[arg_234_1.id]

		if not var_235_0:canUseStrategy(arg_234_1) then
			return
		end

		local var_235_2 = var_235_0:getNextStgUser(arg_234_1.id)

		if var_235_1.type == ChapterConst.StgTypeForm then
			arg_234_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_235_2,
				arg1 = arg_234_1.id
			})
		elseif var_235_1.type == ChapterConst.StgTypeConsume then
			arg_234_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_235_2,
				arg1 = arg_234_1.id
			})
		end

		arg_234_0:hideStrategyInfo()
	end

	local function var_234_1()
		arg_234_0:hideStrategyInfo()
	end

	arg_234_0.levelStrategyView:ActionInvoke("setCBFunc", var_234_0, var_234_1)
end

function var_0_0.hideStrategyInfo(arg_237_0)
	if arg_237_0.levelStrategyView then
		arg_237_0.levelStrategyView:Destroy()

		arg_237_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_238_0, arg_238_1)
	local var_238_0 = arg_238_0.contextData.chapterVO
	local var_238_1 = getProxy(ChapterProxy)
	local var_238_2
	local var_238_3
	local var_238_4
	local var_238_5
	local var_238_6 = var_238_1.repairTimes
	local var_238_7, var_238_8, var_238_9 = ChapterConst.GetRepairParams()

	arg_238_0.levelRepairView = LevelRepairView.New(arg_238_0.topPanel, arg_238_0.event, arg_238_0.contextData)

	arg_238_0.levelRepairView:Load()
	arg_238_0.levelRepairView:ActionInvoke("set", var_238_6, var_238_7, var_238_8, var_238_9)

	local function var_238_10()
		if var_238_7 - math.min(var_238_6, var_238_7) == 0 and arg_238_0.player:getTotalGem() < var_238_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_238_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_238_0.fleet.id,
			arg1 = arg_238_1.id
		})
		arg_238_0:hideRepairWindow()
	end

	local function var_238_11()
		arg_238_0:hideRepairWindow()
	end

	arg_238_0.levelRepairView:ActionInvoke("setCBFunc", var_238_10, var_238_11)
end

function var_0_0.hideRepairWindow(arg_241_0)
	if arg_241_0.levelRepairView then
		arg_241_0.levelRepairView:Destroy()

		arg_241_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_242_0, arg_242_1)
	arg_242_0.levelRemasterView:Load()

	local function var_242_0(arg_243_0)
		arg_242_0:ShowSelectedMap(arg_243_0)
	end

	arg_242_0.levelRemasterView:ActionInvoke("Show")
	arg_242_0.levelRemasterView:ActionInvoke("set", var_242_0, arg_242_1)
end

function var_0_0.hideRemasterPanel(arg_244_0)
	if arg_244_0.levelRemasterView:isShowing() then
		arg_244_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_245_0, arg_245_1)
	local var_245_0 = arg_245_0.contextData.chapterVO

	if not var_245_0 then
		return
	end

	arg_245_0:enableLevelCamera()
	setActive(arg_245_0.uiMain, true)

	arg_245_0.levelGrid.localEulerAngles = Vector3(var_245_0.theme.angle, 0, 0)
	arg_245_0.grid = LevelGrid.New(arg_245_0.dragLayer)

	arg_245_0.grid:attach(arg_245_0)
	arg_245_0.grid:ExtendItem("shipTpl", arg_245_0.shipTpl)
	arg_245_0.grid:ExtendItem("subTpl", arg_245_0.subTpl)
	arg_245_0.grid:ExtendItem("transportTpl", arg_245_0.transportTpl)
	arg_245_0.grid:ExtendItem("enemyTpl", arg_245_0.enemyTpl)
	arg_245_0.grid:ExtendItem("championTpl", arg_245_0.championTpl)
	arg_245_0.grid:ExtendItem("oniTpl", arg_245_0.oniTpl)
	arg_245_0.grid:ExtendItem("arrowTpl", arg_245_0.arrowTarget)
	arg_245_0.grid:ExtendItem("destinationMarkTpl", arg_245_0.destinationMarkTpl)

	function arg_245_0.grid.onShipStepChange(arg_246_0)
		arg_245_0.levelStageView:updateAmbushRate(arg_246_0)
	end

	arg_245_0.grid:initAll(arg_245_1)
end

function var_0_0.destroyGrid(arg_247_0)
	if arg_247_0.grid then
		arg_247_0.grid:detach()

		arg_247_0.grid = nil

		arg_247_0:disableLevelCamera()
		setActive(arg_247_0.dragLayer, true)
		setActive(arg_247_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_248_0, arg_248_1)
	arg_248_0:frozen()

	local function var_248_0()
		arg_248_0.radar:SetActive(true)

		local var_249_0 = tf(arg_248_0.radar)

		var_249_0:SetParent(arg_248_0.topPanel, false)
		var_249_0:SetSiblingIndex(1)
		var_249_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_250_0)
			arg_248_0.radar:SetActive(false)
			arg_248_0:unfrozen()
			arg_248_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_248_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_251_0)
			arg_251_0:SetActive(true)

			arg_248_0.radar = arg_251_0

			var_248_0()
		end)
	else
		var_248_0()
	end
end

function var_0_0.destroyTracking(arg_252_0)
	if arg_252_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_252_0.radar)

		arg_252_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_253_0, arg_253_1, arg_253_2, arg_253_3)
	local function var_253_0()
		arg_253_0.playing = true

		arg_253_0:frozen()
		arg_253_0.airStrike:SetActive(true)

		local var_254_0 = tf(arg_253_0.airStrike)

		var_254_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_254_0:SetAsLastSibling()
		setActive(var_254_0:Find("words/be_striked"), arg_253_1 == ChapterConst.SubjectChampion)
		setActive(var_254_0:Find("words/strike_enemy"), arg_253_1 == ChapterConst.SubjectPlayer)

		local function var_254_1()
			arg_253_0.playing = false

			SetActive(arg_253_0.airStrike, false)

			if arg_253_3 then
				arg_253_3()
			end

			arg_253_0:unfrozen()
		end

		var_254_0:GetComponent("DftAniEvent"):SetEndEvent(var_254_1)

		if arg_253_2 then
			onButton(arg_253_0, var_254_0, var_254_1, SFX_PANEL)
		else
			removeOnButton(var_254_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_253_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_256_0)
			arg_256_0:SetActive(true)

			arg_253_0.airStrike = arg_256_0

			var_253_0()
		end)
	else
		var_253_0()
	end
end

function var_0_0.destroyAirStrike(arg_257_0)
	if arg_257_0.airStrike then
		arg_257_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_257_0.airStrike)

		arg_257_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_258_0, arg_258_1, arg_258_2, arg_258_3)
	arg_258_0.uiAnims = arg_258_0.uiAnims or {}

	local var_258_0 = arg_258_0.uiAnims[arg_258_1]

	local function var_258_1()
		arg_258_0.playing = true

		arg_258_0:frozen()
		var_258_0:SetActive(true)

		local var_259_0 = tf(var_258_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_259_0)

		if arg_258_3 then
			arg_258_3(var_258_0)
		end

		var_259_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_260_0)
			arg_258_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_259_0, arg_258_0._tf)

			if arg_258_2 then
				arg_258_2(var_258_0)
			end

			arg_258_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_258_0 then
		PoolMgr.GetInstance():GetUI(arg_258_1, true, function(arg_261_0)
			arg_261_0:SetActive(true)

			arg_258_0.uiAnims[arg_258_1] = arg_261_0
			var_258_0 = arg_258_0.uiAnims[arg_258_1]

			var_258_1()
		end)
	else
		var_258_1()
	end
end

function var_0_0.destroyUIAnims(arg_262_0)
	if arg_262_0.uiAnims then
		for iter_262_0, iter_262_1 in pairs(arg_262_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_262_1), arg_262_0._tf)
			iter_262_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_262_0, iter_262_1)
		end

		arg_262_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_263_0, arg_263_1)
	local function var_263_0()
		arg_263_0.playing = true

		arg_263_0:frozen()
		arg_263_0.torpetoAni:SetActive(true)

		local var_264_0 = tf(arg_263_0.torpetoAni)

		var_264_0:SetParent(arg_263_0.topPanel, false)
		var_264_0:SetAsLastSibling()
		var_264_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_265_0)
			arg_263_0.playing = false

			SetActive(arg_263_0.torpetoAni, false)

			if arg_263_1 then
				arg_263_1()
			end

			arg_263_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_263_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_266_0)
			arg_266_0:SetActive(true)

			arg_263_0.torpetoAni = arg_266_0

			var_263_0()
		end)
	else
		var_263_0()
	end
end

function var_0_0.destroyTorpedo(arg_267_0)
	if arg_267_0.torpetoAni then
		arg_267_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_267_0.torpetoAni)

		arg_267_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_268_0, arg_268_1, arg_268_2, arg_268_3)
	arg_268_0.strikeAnims = arg_268_0.strikeAnims or {}

	local var_268_0
	local var_268_1
	local var_268_2

	local function var_268_3()
		if coroutine.status(var_268_2) == "suspended" then
			local var_269_0, var_269_1 = coroutine.resume(var_268_2)

			assert(var_269_0, debug.traceback(var_268_2, var_269_1))
		end
	end

	var_268_2 = coroutine.create(function()
		arg_268_0.playing = true

		arg_268_0:frozen()

		local var_270_0 = arg_268_0.strikeAnims[arg_268_2]

		setActive(var_270_0, true)

		local var_270_1 = tf(var_270_0)
		local var_270_2 = findTF(var_270_1, "torpedo")
		local var_270_3 = findTF(var_270_1, "mask/painting")
		local var_270_4 = findTF(var_270_1, "ship")

		setParent(var_268_0, var_270_3:Find("fitter"), false)
		var_268_1:SetParent(var_270_4)
		setActive(var_270_4, false)
		setActive(var_270_2, false)
		var_270_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_270_1:SetAsLastSibling()

		local var_270_5 = var_270_1:GetComponent("DftAniEvent")
		local var_270_6 = var_268_1:GetSkeletonGraphic()

		var_270_5:SetStartEvent(function(arg_271_0)
			var_268_1:SetAction("attack", 0)

			var_270_6.freeze = true
		end)
		var_270_5:SetTriggerEvent(function(arg_272_0)
			var_270_6.freeze = false

			var_268_1:SetActionCallBack(function(arg_273_0)
				if arg_273_0 == "action" then
					-- block empty
				elseif arg_273_0 == "finish" then
					var_270_6.freeze = true
				end
			end)
		end)
		var_270_5:SetEndEvent(function(arg_274_0)
			var_270_6.freeze = false

			var_268_3()
		end)
		onButton(arg_268_0, var_270_1, var_268_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_270_3, arg_268_1:getPainting())
		var_268_1:SetActionCallBack(nil)

		var_270_6.freeze = false

		var_268_1:Dispose()
		setActive(var_270_0, false)

		arg_268_0.playing = false

		arg_268_0:unfrozen()

		if arg_268_3 then
			arg_268_3()
		end
	end)

	local function var_268_4()
		if arg_268_0.strikeAnims[arg_268_2] and var_268_0 and var_268_1 then
			var_268_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_268_1:getPainting(), true, function(arg_276_0)
		var_268_0 = arg_276_0

		ShipExpressionHelper.SetExpression(var_268_0, arg_268_1:getPainting())
		var_268_4()
	end)

	var_268_1 = SpineAnimChar.New()

	var_268_1:SetPaint(arg_268_1:getPrefab())
	var_268_1:Load(true, function(arg_277_0)
		var_268_1:SetLocalScale(Vector3.one)
		var_268_4()
	end)

	if not arg_268_0.strikeAnims[arg_268_2] then
		PoolMgr.GetInstance():GetUI(arg_268_2, true, function(arg_278_0)
			arg_268_0.strikeAnims[arg_268_2] = arg_278_0

			var_268_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_279_0)
	if arg_279_0.strikeAnims then
		for iter_279_0, iter_279_1 in pairs(arg_279_0.strikeAnims) do
			iter_279_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_279_0, iter_279_1)
		end

		arg_279_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_280_0, arg_280_1, arg_280_2, arg_280_3)
	arg_280_0.strikeAnims = arg_280_0.strikeAnims or {}

	local var_280_0
	local var_280_1

	local function var_280_2()
		if coroutine.status(var_280_1) == "suspended" then
			local var_281_0, var_281_1 = coroutine.resume(var_280_1)

			assert(var_281_0, debug.traceback(var_280_1, var_281_1))
		end
	end

	var_280_1 = coroutine.create(function()
		arg_280_0.playing = true

		arg_280_0:frozen()

		local var_282_0 = arg_280_0.strikeAnims[arg_280_2]

		setActive(var_282_0, true)

		local var_282_1 = tf(var_282_0)
		local var_282_2 = findTF(var_282_1, "torpedo")
		local var_282_3 = findTF(var_282_1, "ship")

		var_280_0:SetParent(var_282_3)
		setActive(var_282_3, false)
		setActive(var_282_2, false)
		var_282_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_282_1:SetAsLastSibling()

		local var_282_4 = var_282_1:GetComponent("DftAniEvent")
		local var_282_5 = var_280_0:GetSkeletonGraphic()

		var_282_4:SetStartEvent(function(arg_283_0)
			var_280_0:SetAction("attack", 0)

			var_282_5.freeze = true
		end)
		var_282_4:SetTriggerEvent(function(arg_284_0)
			var_282_5.freeze = false

			var_280_0:SetActionCallBack(function(arg_285_0)
				if arg_285_0 == "action" then
					-- block empty
				elseif arg_285_0 == "finish" then
					var_282_5.freeze = true
				end
			end)
		end)
		var_282_4:SetEndEvent(function(arg_286_0)
			var_282_5.freeze = false

			var_280_2()
		end)
		onButton(arg_280_0, var_282_1, var_280_2, SFX_CANCEL)
		coroutine.yield()
		var_280_0:SetActionCallBack(nil)

		var_282_5.freeze = false

		var_280_0:Dispose()
		setActive(var_282_0, false)

		arg_280_0.playing = false

		arg_280_0:unfrozen()

		if arg_280_3 then
			arg_280_3()
		end
	end)

	local function var_280_3()
		if arg_280_0.strikeAnims[arg_280_2] and var_280_0 then
			var_280_2()
		end
	end

	var_280_0 = SpineAnimChar.New()

	var_280_0:SetPaint(arg_280_1:getPrefab())
	var_280_0:Load(true, function(arg_288_0)
		arg_288_0:SetLocalScale(Vector3.one)
		var_280_3()
	end)

	if not arg_280_0.strikeAnims[arg_280_2] then
		PoolMgr.GetInstance():GetUI(arg_280_2, true, function(arg_289_0)
			arg_280_0.strikeAnims[arg_280_2] = arg_289_0

			var_280_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_290_0, arg_290_1, arg_290_2)
	arg_290_0:frozen()
	setActive(arg_290_0.commanderTinkle, true)

	local var_290_0 = arg_290_1:getSkills()

	setText(arg_290_0.commanderTinkle:Find("name"), #var_290_0 > 0 and var_290_0[1]:getConfig("name") or "")
	setImageSprite(arg_290_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_290_1:getConfig("painting"), ""))

	local var_290_1 = arg_290_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_290_1.alpha = 0

	local var_290_2 = Vector2(248, 237)

	LeanTween.value(go(arg_290_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_291_0)
		local var_291_0 = arg_290_0.commanderTinkle.localPosition

		var_291_0.x = var_290_2.x + -100 * (1 - arg_291_0)
		arg_290_0.commanderTinkle.localPosition = var_291_0
		var_290_1.alpha = arg_291_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_290_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_292_0)
		local var_292_0 = arg_290_0.commanderTinkle.localPosition

		var_292_0.x = var_290_2.x + 100 * arg_292_0
		arg_290_0.commanderTinkle.localPosition = var_292_0
		var_290_1.alpha = 1 - arg_292_0
	end)):setOnComplete(System.Action(function()
		if arg_290_2 then
			arg_290_2()
		end

		arg_290_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_294_0, arg_294_1, arg_294_2, arg_294_3)
	local var_294_0 = arg_294_0.grid:shakeCell(arg_294_1)

	if not var_294_0 then
		arg_294_3()

		return
	end

	arg_294_0:easeDamage(var_294_0, arg_294_2, function()
		arg_294_3()
	end)
end

function var_0_0.easeDamage(arg_296_0, arg_296_1, arg_296_2, arg_296_3)
	arg_296_0:frozen()

	local var_296_0 = arg_296_0.levelCam:WorldToScreenPoint(arg_296_1.position)
	local var_296_1 = tf(arg_296_0:GetDamageText())

	var_296_1.position = arg_296_0.uiCam:ScreenToWorldPoint(var_296_0)

	local var_296_2 = var_296_1.localPosition

	var_296_2.y = var_296_2.y + 40
	var_296_2.z = 0

	setText(var_296_1, arg_296_2)

	var_296_1.localPosition = var_296_2

	LeanTween.value(go(var_296_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_297_0)
		local var_297_0 = var_296_1.localPosition

		var_297_0.y = var_296_2.y + 60 * arg_297_0
		var_296_1.localPosition = var_297_0

		setTextAlpha(var_296_1, 1 - arg_297_0)
	end)):setOnComplete(System.Action(function()
		arg_296_0:ReturnDamageText(var_296_1)
		arg_296_0:unfrozen()

		if arg_296_3 then
			arg_296_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_299_0, arg_299_1, arg_299_2)
	arg_299_0:frozen()

	local var_299_0 = arg_299_0.levelCam:WorldToScreenPoint(arg_299_1)

	arg_299_0.avoidText.position = arg_299_0.uiCam:ScreenToWorldPoint(var_299_0)

	local var_299_1 = arg_299_0.avoidText.localPosition

	var_299_1.z = 0
	arg_299_0.avoidText.localPosition = var_299_1

	setActive(arg_299_0.avoidText, true)

	local var_299_2 = arg_299_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_299_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_300_0)
		local var_300_0 = arg_299_0.avoidText.localPosition

		var_300_0.y = var_299_1.y + 100 * arg_300_0
		arg_299_0.avoidText.localPosition = var_300_0

		setImageAlpha(arg_299_0.avoidText, 1 - arg_300_0)
		setImageAlpha(var_299_2, 1 - arg_300_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_299_0.avoidText, false)
		arg_299_0:unfrozen()

		if arg_299_2 then
			arg_299_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_302_0)
	local var_302_0 = table.remove(arg_302_0.damageTextPool)

	if not var_302_0 then
		var_302_0 = Instantiate(arg_302_0.damageTextTemplate)

		local var_302_1 = tf(arg_302_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_302_0, tf(arg_302_0.damageTextTemplate).parent)
		tf(var_302_0):SetSiblingIndex(var_302_1 + 1)
	end

	table.insert(arg_302_0.damageTextActive, var_302_0)
	setActive(var_302_0, true)

	return var_302_0
end

function var_0_0.ReturnDamageText(arg_303_0, arg_303_1)
	assert(arg_303_1)

	if not arg_303_1 then
		return
	end

	arg_303_1 = go(arg_303_1)

	table.removebyvalue(arg_303_0.damageTextActive, arg_303_1)
	table.insert(arg_303_0.damageTextPool, arg_303_1)
	setActive(arg_303_1, false)
end

function var_0_0.resetLevelGrid(arg_304_0)
	arg_304_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_305_0, arg_305_1)
	setActive(arg_305_0.curtain, arg_305_1)
end

function var_0_0.frozen(arg_306_0)
	local var_306_0 = arg_306_0.frozenCount

	arg_306_0.frozenCount = arg_306_0.frozenCount + 1
	arg_306_0.canvasGroup.blocksRaycasts = arg_306_0.frozenCount == 0

	if var_306_0 == 0 and arg_306_0.frozenCount ~= 0 then
		arg_306_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_307_0, arg_307_1)
	if arg_307_0.exited then
		return
	end

	local var_307_0 = arg_307_0.frozenCount
	local var_307_1 = arg_307_1 == -1 and arg_307_0.frozenCount or arg_307_1 or 1

	arg_307_0.frozenCount = arg_307_0.frozenCount - var_307_1
	arg_307_0.canvasGroup.blocksRaycasts = arg_307_0.frozenCount == 0

	if var_307_0 ~= 0 and arg_307_0.frozenCount == 0 then
		arg_307_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_308_0)
	return arg_308_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_309_0)
	arg_309_0.levelCamIndices = math.max(arg_309_0.levelCamIndices - 1, 0)

	if arg_309_0.levelCamIndices == 0 then
		arg_309_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.disableLevelCamera(arg_310_0)
	arg_310_0.levelCamIndices = arg_310_0.levelCamIndices + 1

	if arg_310_0.levelCamIndices > 0 then
		arg_310_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.RecordTween(arg_311_0, arg_311_1, arg_311_2)
	arg_311_0.tweens[arg_311_1] = arg_311_2
end

function var_0_0.DeleteTween(arg_312_0, arg_312_1)
	local var_312_0 = arg_312_0.tweens[arg_312_1]

	if var_312_0 then
		LeanTween.cancel(var_312_0)

		arg_312_0.tweens[arg_312_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_313_0, arg_313_1, arg_313_2, arg_313_3)
	local var_313_0 = arg_313_2.id

	arg_313_0.levelCMDFormationView:setCallback(function(arg_314_0)
		if not arg_313_3 then
			if arg_314_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_313_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_314_0.skill)
			elseif arg_314_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_313_0.contextData.commanderSelected = {
					chapterId = var_313_0,
					fleetId = arg_313_1.id
				}

				arg_313_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_314_0.pos, arg_313_1.id, arg_313_2)
				arg_313_0:closeCommanderPanel()
			else
				arg_313_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_314_0,
					fleetId = arg_313_1.id,
					chapterId = var_313_0
				}, arg_313_2)
			end
		elseif arg_314_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_313_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_314_0.skill)
		elseif arg_314_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_313_0.contextData.eliteCommanderSelected = {
				index = arg_313_3,
				pos = arg_314_0.pos,
				chapterId = var_313_0
			}

			arg_313_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_313_3, arg_314_0.pos, arg_313_2)
			arg_313_0:closeCommanderPanel()
		else
			arg_313_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_314_0,
				index = arg_313_3,
				chapterId = var_313_0
			}, arg_313_2)
		end
	end)
	arg_313_0.levelCMDFormationView:Load()
	arg_313_0.levelCMDFormationView:ActionInvoke("update", arg_313_1, arg_313_0.commanderPrefabs)
	arg_313_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_315_0)
	if arg_315_0.levelCMDFormationView:isShowing() then
		arg_315_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_315_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_316_0)
	arg_316_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_317_0)
	arg_317_0.levelCMDFormationView:Destroy()

	arg_317_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_318_0, arg_318_1)
	arg_318_0.spTickets = arg_318_1
end

function var_0_0.HandleShowMsgBox(arg_319_0, arg_319_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_319_1)
end

function var_0_0.updatePoisonAreaTip(arg_320_0)
	local var_320_0 = arg_320_0.contextData.chapterVO
	local var_320_1 = (function(arg_321_0)
		local var_321_0 = {}
		local var_321_1 = pg.map_event_list[var_320_0.id] or {}
		local var_321_2

		if var_320_0:isLoop() then
			var_321_2 = var_321_1.event_list_loop or {}
		else
			var_321_2 = var_321_1.event_list or {}
		end

		for iter_321_0, iter_321_1 in ipairs(var_321_2) do
			local var_321_3 = pg.map_event_template[iter_321_1]

			if var_321_3.c_type == arg_321_0 then
				table.insert(var_321_0, var_321_3)
			end
		end

		return var_321_0
	end)(ChapterConst.EvtType_Poison)

	if var_320_1 then
		for iter_320_0, iter_320_1 in ipairs(var_320_1) do
			local var_320_2 = iter_320_1.round_gametip

			if var_320_2 ~= nil and var_320_2 ~= "" and var_320_0:getRoundNum() == var_320_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_320_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_322_0)
	setActive(arg_322_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_323_0)
	local var_323_0 = getProxy(ChapterProxy)

	if var_323_0 and not arg_323_0.contextData.noRecord then
		local var_323_1 = arg_323_0.contextData.map

		if not var_323_1 then
			return
		end

		if var_323_1:NeedRecordMap() then
			var_323_0:recordLastMap(ChapterProxy.LAST_MAP, var_323_1.id)
		end

		if var_323_1:isActivity() and not var_323_1:isActExtra() then
			var_323_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, var_323_1.id)
		end
	end
end

function var_0_0.IsActShopActive(arg_324_0)
	local var_324_0 = arg_324_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_324_0.contextData.map:getConfig("on_activity")) or nil
	local var_324_1 = var_324_0 and not var_324_0:isEnd() and var_324_0:GetConfigClientSetting("PTID")
	local var_324_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_324_2 and not var_324_2:isEnd() and var_324_2:getConfig("config_client").resId == var_324_1 then
		return true
	end

	local var_324_3 = var_324_0:GetConfigClientPTActivity()

	if var_324_3 and getProxy(ActivityProxy):GetShopActivityByRes(var_324_3:GetPTDrop()) or nil then
		return true
	end
end

function var_0_0.OnStartChapterAuto(arg_325_0, arg_325_1)
	if arg_325_0.levelInfoView:isShowing() then
		arg_325_0:hideChapterPanel()
	end

	if arg_325_0.levelInfoSPView and arg_325_0.levelInfoSPView:isShowing() then
		arg_325_0:HideLevelInfoSPPanel()
	end
end

function var_0_0.OnEndChapterAuto(arg_326_0, arg_326_1)
	return
end

function var_0_0.OnAddChapterAutoTimeDone(arg_327_0)
	if arg_327_0.levelInfoView:isShowing() then
		arg_327_0.levelInfoView:RefreshChapterAutoPanel()
	end

	if arg_327_0.levelInfoSPView and arg_327_0.levelInfoSPView:isShowing() then
		arg_327_0.levelInfoView:RefreshChapterAutoPanel()
	end
end

function var_0_0.ShowChapterAutoDetailPanel(arg_328_0, arg_328_1)
	arg_328_0.chapterAutoDetailPanel:Load()
	arg_328_0.chapterAutoDetailPanel:ActionInvoke("Enter", arg_328_1)
end

function var_0_0.HideChapterAutoDetailPanel(arg_329_0)
	if arg_329_0.chapterAutoDetailPanel:isShowing() then
		arg_329_0.chapterAutoDetailPanel:Hide()
	end
end

function var_0_0.DestroyChapterAutoDetailPanel(arg_330_0)
	if arg_330_0.chapterAutoDetailPanel then
		arg_330_0.chapterAutoDetailPanel:Destroy()

		arg_330_0.chapterAutoDetailPanel = nil
	end
end

function var_0_0.willExit(arg_331_0)
	arg_331_0:ClearMapTransitions()
	arg_331_0.loader:Clear()

	if arg_331_0.entranceActivityBg then
		pg.PoolMgr.GetInstance():ReturnPrefab(arg_331_0.entranceActivityBgPath, "", arg_331_0.entranceActivityBg)

		arg_331_0.entranceActivityBg = nil
		arg_331_0.entranceActivityBgPath = nil
	end

	if arg_331_0.contextData.chapterVO then
		arg_331_0:UnOverlayPanel(arg_331_0.topPanel, arg_331_0._tf)
	end

	if arg_331_0.levelFleetView and arg_331_0.levelFleetView.selectIds then
		arg_331_0.contextData.selectedFleetIDs = {}

		for iter_331_0, iter_331_1 in pairs(arg_331_0.levelFleetView.selectIds) do
			for iter_331_2, iter_331_3 in pairs(iter_331_1) do
				arg_331_0.contextData.selectedFleetIDs[#arg_331_0.contextData.selectedFleetIDs + 1] = iter_331_3
			end
		end
	end

	arg_331_0:destroyChapterPanel()
	arg_331_0:DestroyLevelInfoSPPanel()
	arg_331_0:destroyFleetEdit()
	arg_331_0:destroyCommanderPanel()
	arg_331_0:DestroyLevelStageView()
	arg_331_0:hideRepairWindow()
	arg_331_0:hideStrategyInfo()
	arg_331_0:hideRemasterPanel()
	arg_331_0:hideSpResult()
	arg_331_0:destroyGrid()
	arg_331_0:destroyAmbushWarn()
	arg_331_0:destroyAirStrike()
	arg_331_0:destroyTorpedo()
	arg_331_0:destroyStrikeAnim()
	arg_331_0:destroyTracking()
	arg_331_0:destroyUIAnims()
	arg_331_0:DestroyChapterAutoDetailPanel()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_331_4, iter_331_5 in pairs(arg_331_0.mbDict) do
		iter_331_5:Destroy()
	end

	arg_331_0.mbDict = nil

	for iter_331_6, iter_331_7 in pairs(arg_331_0.tweens) do
		LeanTween.cancel(iter_331_7)
	end

	arg_331_0.tweens = nil

	if arg_331_0.cloudTimer then
		_.each(arg_331_0.cloudTimer, function(arg_332_0)
			LeanTween.cancel(arg_332_0)
		end)

		arg_331_0.cloudTimer = nil
	end

	if arg_331_0.newChapterCDTimer then
		arg_331_0.newChapterCDTimer:Stop()

		arg_331_0.newChapterCDTimer = nil
	end

	for iter_331_8, iter_331_9 in ipairs(arg_331_0.damageTextActive) do
		LeanTween.cancel(iter_331_9)
	end

	LeanTween.cancel(go(arg_331_0.avoidText))

	arg_331_0.map.localScale = Vector3.one
	arg_331_0.map.pivot = Vector2(0.5, 0.5)
	arg_331_0.float.localScale = Vector3.one
	arg_331_0.float.pivot = Vector2(0.5, 0.5)

	for iter_331_10, iter_331_11 in ipairs(arg_331_0.mapTFs) do
		clearImageSprite(iter_331_11)
	end

	_.each(arg_331_0.cloudRTFs, function(arg_333_0)
		clearImageSprite(arg_333_0)
	end)
	Destroy(arg_331_0.enemyTpl)
	arg_331_0:RecordLastMapOnExit()
	arg_331_0.levelRemasterView:Destroy()
end

return var_0_0
