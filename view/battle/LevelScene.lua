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

function var_0_0.initEvents(arg_14_0)
	arg_14_0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
		arg_14_0:openCommanderPanel(arg_15_1, arg_15_2, arg_15_3)
	end)
	arg_14_0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function(arg_16_0, arg_16_1)
		arg_14_0:HandleShowMsgBox(arg_16_1)
	end)
	arg_14_0:bind(LevelUIConst.DO_AMBUSH_WARNING, function(arg_17_0, arg_17_1)
		arg_14_0:doAmbushWarning(arg_17_1)
	end)
	arg_14_0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function(arg_18_0, arg_18_1)
		arg_14_0:displayAmbushInfo(arg_18_1)
	end)
	arg_14_0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function(arg_19_0, arg_19_1)
		arg_14_0:displayStrategyInfo(arg_19_1)
	end)
	arg_14_0:bind(LevelUIConst.FROZEN, function(arg_20_0)
		arg_14_0:frozen()
	end)
	arg_14_0:bind(LevelUIConst.UN_FROZEN, function(arg_21_0)
		arg_14_0:unfrozen()
	end)
	arg_14_0:bind(LevelUIConst.DO_TRACKING, function(arg_22_0, arg_22_1)
		arg_14_0:doTracking(arg_22_1)
	end)
	arg_14_0:bind(LevelUIConst.SWITCH_TO_MAP, function()
		if arg_14_0:isfrozen() then
			return
		end

		arg_14_0:switchToMap()
	end)
	arg_14_0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function(arg_24_0, arg_24_1)
		arg_14_0:displayRepairWindow(arg_24_1)
	end)
	arg_14_0:bind(LevelUIConst.DO_PLAY_ANIM, function(arg_25_0, arg_25_1)
		arg_14_0:doPlayAnim(arg_25_1.name, arg_25_1.callback, arg_25_1.onStart)
	end)
	arg_14_0:bind(LevelUIConst.HIDE_FLEET_SELECT, function()
		arg_14_0:hideFleetSelect()
	end)
	arg_14_0:bind(LevelUIConst.HIDE_FLEET_EDIT, function(arg_27_0)
		arg_14_0:hideFleetEdit()
	end)
	arg_14_0:bind(LevelUIConst.ADD_MSG_QUEUE, function(arg_28_0, arg_28_1)
		arg_14_0:addbubbleMsgBox(arg_28_1)
	end)
	arg_14_0:bind(LevelUIConst.SET_MAP, function(arg_29_0, arg_29_1)
		arg_14_0:setMap(arg_29_1)
	end)
end

function var_0_0.onZeroHourRefresh(arg_30_0)
	if arg_30_0.levelInfoView:isShowing() then
		arg_30_0.levelInfoView:RefreshChapterAutoPanel()
	end

	if arg_30_0.levelInfoSPView and arg_30_0.levelInfoSPView:isShowing() then
		arg_30_0.levelInfoView:RefreshChapterAutoPanel()
	end
end

function var_0_0.addbubbleMsgBox(arg_31_0, arg_31_1)
	table.insert(arg_31_0.bubbleMsgBoxes, arg_31_1)

	if #arg_31_0.bubbleMsgBoxes > 1 then
		return
	end

	local var_31_0

	local function var_31_1()
		local var_32_0 = arg_31_0.bubbleMsgBoxes[1]

		if var_32_0 then
			var_32_0(function()
				table.remove(arg_31_0.bubbleMsgBoxes, 1)
				var_31_1()
			end)
		end
	end

	var_31_1()
end

function var_0_0.CleanBubbleMsgbox(arg_34_0)
	table.clean(arg_34_0.bubbleMsgBoxes)
end

function var_0_0.updatePtActivity(arg_35_0, arg_35_1)
	arg_35_0.ptActivity = arg_35_1

	if not arg_35_0.ptActivity then
		return
	end

	arg_35_0:updateActivityRes()
end

function var_0_0.updateActivityRes(arg_36_0)
	local var_36_0 = findTF(arg_36_0.ptTotal, "Text")
	local var_36_1 = findTF(arg_36_0.ptTotal, "icon/Image")

	if var_36_0 and var_36_1 and arg_36_0.ptActivity then
		setText(var_36_0, "x" .. arg_36_0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = tonumber(arg_36_0.ptActivity:getConfig("config_id"))
		}):getIcon(), "", var_36_1, true)
	end
end

function var_0_0.setCommanderPrefabs(arg_37_0, arg_37_1)
	arg_37_0.commanderPrefabs = arg_37_1
end

function var_0_0.didEnter(arg_38_0)
	arg_38_0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_38_0.player.level, "CommanderCatMediator")

	onButton(arg_38_0, arg_38_0.topChapter:Find("back_button"), function()
		if arg_38_0:isfrozen() then
			return
		end

		local var_39_0 = arg_38_0.contextData.map

		if var_39_0 and (var_39_0:isActivity() or var_39_0:isEscort()) then
			arg_38_0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		elseif var_39_0 and var_39_0:isSkirmish() then
			arg_38_0:emit(var_0_0.ON_BACK)
		elseif not arg_38_0.contextData.entranceStatus then
			arg_38_0:ShowEntranceUI(true)
		else
			arg_38_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_38_0, arg_38_0.btnSpecial, function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.dailyBtn, function()
		if arg_38_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_38_0:updatDailyBtnTip()
		arg_38_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.challengeBtn, function()
		if arg_38_0:isfrozen() then
			return
		end

		local var_42_0, var_42_1 = arg_38_0:checkChallengeOpen()

		if var_42_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_42_1)
		else
			arg_38_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.militaryExerciseBtn, function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.normalBtn, function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:setMap(arg_38_0.contextData.map:getBindMapId())
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.eliteBtn, function()
		if arg_38_0:isfrozen() then
			return
		end

		if arg_38_0.contextData.map:getBindMapId() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			local var_45_0 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			if var_45_0 then
				arg_38_0:setMap(var_45_0.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif arg_38_0.contextData.map:isEliteEnabled() then
			arg_38_0:setMap(arg_38_0.contextData.map:getBindMapId())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(arg_38_0, arg_38_0.remasterBtn, function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_38_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("enters/enter_main"), function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:ShowSelectedMap(arg_38_0:GetInitializeMap())
	end, SFX_PANEL)
	setText(arg_38_0.entranceLayer:Find("enters/enter_main/Text"), getProxy(ChapterProxy):getLastUnlockMap():getLastUnlockChapterName())
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("enters/enter_world/enter"), function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:emit(LevelMediator2.ENTER_WORLD)
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("enters/enter_ready/activity"), function()
		if arg_38_0:isfrozen() then
			return
		end

		switch(arg_38_0.entranceActivity:getConfig("type"), {
			[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function()
				arg_38_0:emit(LevelMediator2.ON_ACTIVITY_MAP, arg_38_0.entranceActivity.id)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
				arg_38_0:emit(LevelMediator2.ON_OPEN_ACT_BOSS_BATTLE)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
				arg_38_0:emit(LevelMediator2.ON_BOSSRUSH_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
				arg_38_0:emit(LevelMediator2.ON_BOSSSINGLE_MAP, {
					mode = OtherworldMapScene.MODE_BATTLE
				})
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
				arg_38_0:emit(LevelMediator2.ON_CLUE_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = function()
				arg_38_0:emit(LevelMediator2.ON_COLLAB_BOSSRUSH_MAP)
			end
		})
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("btns/btn_remaster"), function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_38_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	setActive(arg_38_0.entranceLayer:Find("btns/btn_remaster"), OPEN_REMASTER)
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("btns/btn_challenge"), function()
		if arg_38_0:isfrozen() then
			return
		end

		local var_57_0, var_57_1 = arg_38_0:checkChallengeOpen()

		if var_57_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_57_1)
		else
			arg_38_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("btns/btn_pvp"), function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("btns/btn_daily"), function()
		if arg_38_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_38_0:updatDailyBtnTip()
		arg_38_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.entranceLayer:Find("btns/btn_task"), function()
		if arg_38_0:isfrozen() then
			return
		end

		arg_38_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	setActive(arg_38_0.entranceLayer:Find("enters/enter_world/enter"), not WORLD_ENTER_LOCK)
	setActive(arg_38_0.entranceLayer:Find("enters/enter_world/nothing"), WORLD_ENTER_LOCK)
	setActive(arg_38_0.entranceLayer:Find("enters/enter_world/enter/tip"), getProxy(ChapterAutoProxy):IsAllCommissionFinish(ChapterAutoProxy.TYPE.WORLD))

	arg_38_0.entranceActivity = getProxy(ActivityProxy):getEnterReadyActivity()[1]

	setActive(arg_38_0.entranceLayer:Find("enters/enter_ready/nothing"), not tobool(arg_38_0.entranceActivity))
	setActive(arg_38_0.entranceLayer:Find("enters/enter_ready/activity"), tobool(arg_38_0.entranceActivity))

	if tobool(arg_38_0.entranceActivity) then
		local var_38_0 = arg_38_0.entranceActivity:getConfig("config_client").entrance_bg

		if var_38_0 then
			GetImageSpriteFromAtlasAsync(var_38_0, "", arg_38_0.entranceLayer:Find("enters/enter_ready/activity"), true)
		end
	end

	arg_38_0:updateRightPanel()

	local var_38_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_38_0.player.level, "EventMediator")

	setActive(arg_38_0.btnSpecial:Find("lock"), not var_38_1)
	setActive(arg_38_0.entranceLayer:Find("btns/btn_task/lock"), not var_38_1)

	local var_38_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_38_0.player.level, "DailyLevelMediator")

	setActive(arg_38_0.dailyBtn:Find("lock"), not var_38_2)
	setActive(arg_38_0.entranceLayer:Find("btns/btn_daily/lock"), not var_38_2)

	local var_38_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_38_0.player.level, "MilitaryExerciseMediator")

	setActive(arg_38_0.militaryExerciseBtn:Find("lock"), not var_38_3)
	setActive(arg_38_0.entranceLayer:Find("btns/btn_pvp/lock"), not var_38_3)

	local var_38_4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_38_0.player.level, "WorldMediator")

	setActive(arg_38_0.entranceLayer:Find("enters/enter_world/enter/lock"), not var_38_4)

	local var_38_5 = LimitChallengeConst.IsOpen()

	setActive(arg_38_0.challengeBtn:Find("lock"), not var_38_5)
	setActive(arg_38_0.entranceLayer:Find("btns/btn_challenge/lock"), not var_38_5)

	local var_38_6 = LimitChallengeConst.IsInAct()

	setActive(arg_38_0.challengeBtn, var_38_6)
	setActive(arg_38_0.entranceLayer:Find("btns/btn_challenge"), var_38_6)

	local var_38_7 = LimitChallengeConst.IsShowRedPoint()

	setActive(arg_38_0.entranceLayer:Find("btns/btn_challenge/tip"), var_38_7)
	arg_38_0:initMapBtn(arg_38_0.btnPrev, -1)
	arg_38_0:initMapBtn(arg_38_0.btnNext, 1)
	arg_38_0:registerActBtn()

	if arg_38_0.contextData.editEliteChapter then
		local var_38_8 = getProxy(ChapterProxy):getChapterById(arg_38_0.contextData.editEliteChapter)

		arg_38_0:displayFleetEdit(var_38_8)

		arg_38_0.contextData.editEliteChapter = nil
	elseif arg_38_0.contextData.selectedChapterVO then
		arg_38_0:displayFleetSelect(arg_38_0.contextData.selectedChapterVO)

		arg_38_0.contextData.selectedChapterVO = nil
	end

	local var_38_9 = arg_38_0.contextData.chapterVO

	if not var_38_9 or not var_38_9.active then
		arg_38_0:tryPlaySubGuide()
	end

	arg_38_0:updateRemasterBtnTip()
	arg_38_0:updatDailyBtnTip()

	if arg_38_0.contextData.open_remaster then
		arg_38_0:displayRemasterPanel(arg_38_0.contextData.isSP)

		arg_38_0.contextData.open_remaster = nil
	end

	arg_38_0:ShowEntranceUI(arg_38_0.contextData.entranceStatus)

	if not arg_38_0.contextData.entranceStatus then
		arg_38_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_38_0:GetInitializeMap())
	end

	arg_38_0:emit(LevelMediator2.ON_DIDENTER)
end

function var_0_0.updateRightPanel(arg_61_0)
	arg_61_0.rightActivityBtns = defaultValue(arg_61_0.rightActivityBtns, {
		LevelSecondMapBtn.New(arg_61_0.actBtnTpl, arg_61_0.event, false)
	})

	local var_61_0 = {}
	local var_61_1 = {}

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.rightActivityBtns) do
		if iter_61_1:InShowTime() then
			table.insert(var_61_0, iter_61_1)
		else
			table.insert(var_61_1, iter_61_1)
		end
	end

	table.sort(var_61_0, CompareFuncs({
		function(arg_62_0)
			return arg_62_0.config.group_id
		end
	}))

	for iter_61_2, iter_61_3 in ipairs(var_61_0) do
		iter_61_3:Init(iter_61_2)
	end

	for iter_61_4, iter_61_5 in ipairs(var_61_1) do
		iter_61_5:Clear()
	end
end

function var_0_0.checkChallengeOpen(arg_63_0)
	local var_63_0 = getProxy(PlayerProxy):getRawData().level

	return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_63_0, "ChallengeMainMediator")
end

function var_0_0.tryPlaySubGuide(arg_64_0)
	if arg_64_0.contextData.map and arg_64_0.contextData.map:isSkirmish() then
		return
	end

	pg.SystemGuideMgr.GetInstance():Play(arg_64_0)
end

function var_0_0.onBackPressed(arg_65_0)
	if arg_65_0:isfrozen() then
		return
	end

	if arg_65_0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_65_0.chapterAutoDetailPanel:isShowing() then
		arg_65_0:HideChapterAutoDetailPanel()
	end

	if arg_65_0.levelInfoView:isShowing() then
		arg_65_0:hideChapterPanel()

		return
	end

	if arg_65_0.levelInfoSPView and arg_65_0.levelInfoSPView:isShowing() then
		arg_65_0:HideLevelInfoSPPanel()

		return
	end

	if arg_65_0.levelFleetView:isShowing() then
		arg_65_0:hideFleetEdit()

		return
	end

	if arg_65_0.levelStrategyView then
		arg_65_0:hideStrategyInfo()

		return
	end

	if arg_65_0.levelRepairView then
		arg_65_0:hideRepairWindow()

		return
	end

	if arg_65_0.levelRemasterView:isShowing() then
		arg_65_0:hideRemasterPanel()

		return
	end

	if arg_65_0.contextData.map and arg_65_0.contextData.map:getConfig("ui_type") == MapBuilder.TYPEEXSP and arg_65_0.mapBuilder.personalPage:IsActive() then
		arg_65_0.mapBuilder.personalPage:Hide()

		return
	end

	if isActive(arg_65_0.helpPage) then
		setActive(arg_65_0.helpPage, false)

		return
	end

	local var_65_0 = arg_65_0.contextData.chapterVO
	local var_65_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_65_0 and var_65_1 then
		arg_65_0:switchToMap()

		return
	end

	triggerButton(arg_65_0.topChapter:Find("back_button"))
end

function var_0_0.ShowEntranceUI(arg_66_0, arg_66_1)
	setActive(arg_66_0.entranceLayer, arg_66_1)
	setActive(arg_66_0.entranceBg, arg_66_1)
	setActive(arg_66_0.map, not arg_66_1)
	setActive(arg_66_0.float, not arg_66_1)
	setActive(arg_66_0.mainLayer, not arg_66_1)
	setActive(arg_66_0.topChapter:Find("type_entrance"), arg_66_1)

	arg_66_0.contextData.entranceStatus = tobool(arg_66_1)

	if arg_66_1 then
		setActive(arg_66_0.topChapter:Find("title_chapter"), false)
		setActive(arg_66_0.topChapter:Find("type_chapter"), false)
		setActive(arg_66_0.topChapter:Find("type_escort"), false)
		setActive(arg_66_0.topChapter:Find("type_skirmish"), false)

		if arg_66_0.newChapterCDTimer then
			arg_66_0.newChapterCDTimer:Stop()

			arg_66_0.newChapterCDTimer = nil
		end

		arg_66_0:RecordLastMapOnExit()

		arg_66_0.contextData.mapIdx = nil
		arg_66_0.contextData.map = nil
	end

	arg_66_0:PlayBGM()
end

function var_0_0.PreloadLevelMainUI(arg_67_0, arg_67_1, arg_67_2)
	if arg_67_0.preloadLevelDone then
		existCall(arg_67_2)

		return
	end

	local var_67_0

	local function var_67_1()
		if not arg_67_0.exited then
			arg_67_0.preloadLevelDone = true

			existCall(arg_67_2)
		end
	end

	local var_67_2 = getProxy(ChapterProxy):getMapById(arg_67_1)
	local var_67_3 = arg_67_0:GetMapBG(var_67_2)

	table.ParallelIpairsAsync(var_67_3, function(arg_69_0, arg_69_1, arg_69_2)
		GetSpriteFromAtlasAsync("levelmap/" .. arg_69_1.BG, "", arg_69_2)
	end, var_67_1)
end

function var_0_0.setShips(arg_70_0, arg_70_1)
	arg_70_0.shipVOs = arg_70_1
end

function var_0_0.updateRes(arg_71_0, arg_71_1)
	if arg_71_0.levelStageView then
		arg_71_0.levelStageView:ActionInvoke("SetPlayer", arg_71_1)
	end

	arg_71_0.player = arg_71_1
end

function var_0_0.setEliteQuota(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = arg_72_2 - arg_72_1
	local var_72_1 = arg_72_0.eliteQuota:Find("bg/Text"):GetComponent(typeof(Text))

	if arg_72_1 == arg_72_2 then
		var_72_1.color = Color.red
	else
		var_72_1.color = Color.New(0.47, 0.89, 0.27)
	end

	var_72_1.text = var_72_0 .. "/" .. arg_72_2
end

function var_0_0.updateEvent(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_1:hasFinishState()

	setActive(arg_73_0.btnSpecial:Find("tip"), var_73_0)
	setActive(arg_73_0.entranceLayer:Find("btns/btn_task/tip"), var_73_0)
end

function var_0_0.updateFleet(arg_74_0, arg_74_1)
	arg_74_0.fleets = arg_74_1
end

function var_0_0.updateChapterVO(arg_75_0, arg_75_1, arg_75_2)
	if arg_75_0.contextData.chapterVO and arg_75_0.contextData.chapterVO.id == arg_75_1.id and arg_75_1.active then
		arg_75_0:setChapter(arg_75_1)
	end

	if arg_75_0.contextData.chapterVO and arg_75_0.contextData.chapterVO.id == arg_75_1.id and arg_75_1.active and arg_75_0.levelStageView and arg_75_0.grid then
		local var_75_0 = false
		local var_75_1 = false
		local var_75_2 = false

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyFleet) > 0 then
			arg_75_0.levelStageView:updateStageFleet()
			arg_75_0.levelStageView:updateAmbushRate(arg_75_1.fleet.line, true)

			var_75_2 = true

			if arg_75_0.grid then
				arg_75_0.grid:RefreshFleetCells()
				arg_75_0.grid:UpdateFloor()
				arg_75_0.grid:UpdateWeatherCells()

				var_75_0 = true
			end
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyChampion) > 0 then
			var_75_2 = true

			if arg_75_0.grid then
				arg_75_0.grid:UpdateFleets()
				arg_75_0.grid:clearChampions()
				arg_75_0.grid:initChampions()

				var_75_1 = true
			end
		elseif bit.band(arg_75_2, ChapterConst.DirtyChampionPosition) > 0 then
			var_75_2 = true

			if arg_75_0.grid then
				arg_75_0.grid:UpdateFleets()
				arg_75_0.grid:updateChampions()

				var_75_1 = true
			end
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyAchieve) > 0 then
			arg_75_0.levelStageView:updateStageAchieve()
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyAttachment) > 0 then
			arg_75_0.levelStageView:updateAmbushRate(arg_75_1.fleet.line, true)

			if arg_75_0.grid then
				if not (arg_75_2 < 0) and not (bit.band(arg_75_2, ChapterConst.DirtyFleet) > 0) then
					arg_75_0.grid:updateFleet(arg_75_1.fleets[arg_75_1.findex].id)
				end

				arg_75_0.grid:updateAttachments()

				if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyAutoAction) > 0 then
					arg_75_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					var_75_0 = true
				end
			end
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyStrategy) > 0 then
			arg_75_0.levelStageView:updateStageStrategy()

			var_75_2 = true

			arg_75_0.levelStageView:updateStageBarrier()
			arg_75_0.levelStageView:UpdateAutoFightPanel()
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyAutoAction) > 0 then
			-- block empty
		elseif var_75_0 then
			arg_75_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif var_75_1 then
			arg_75_0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyCellFlag) > 0 then
			arg_75_0.grid:UpdateFloor()
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyBase) > 0 then
			arg_75_0.levelStageView:UpdateDefenseStatus()
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyFloatItems) > 0 then
			arg_75_0.grid:UpdateItemCells()
		end

		if arg_75_2 < 0 or bit.band(arg_75_2, ChapterConst.DirtyWeather) > 0 then
			arg_75_0.grid:UpdateWeatherCells()
		end

		if var_75_2 then
			arg_75_0.levelStageView:updateFleetBuff()
		end
	end
end

function var_0_0.updateClouds(arg_76_0)
	arg_76_0.cloudRTFs = {}
	arg_76_0.cloudRects = {}
	arg_76_0.cloudTimer = {}

	for iter_76_0 = 1, 6 do
		local var_76_0 = arg_76_0.clouds:Find("cloud_" .. iter_76_0)
		local var_76_1 = rtf(var_76_0)

		table.insert(arg_76_0.cloudRTFs, var_76_1)
		table.insert(arg_76_0.cloudRects, var_76_1.rect.width)
	end

	arg_76_0:initCloudsPos()

	for iter_76_1, iter_76_2 in ipairs(arg_76_0.cloudRTFs) do
		local var_76_2 = arg_76_0.cloudRects[iter_76_1]
		local var_76_3 = arg_76_0.initPositions[iter_76_1] or Vector2(0, 0)
		local var_76_4 = 30 - var_76_3.y / 20
		local var_76_5 = (arg_76_0.mapWidth + var_76_2) / var_76_4
		local var_76_6

		var_76_6 = LeanTween.moveX(iter_76_2, arg_76_0.mapWidth, var_76_5):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function()
			var_76_2 = arg_76_0.cloudRects[iter_76_1]
			iter_76_2.anchoredPosition = Vector2(-var_76_2, var_76_3.y)

			var_76_6:setFrom(-var_76_2):setTime((arg_76_0.mapWidth + var_76_2) / var_76_4)
		end))
		var_76_6.passed = math.random() * var_76_5
		arg_76_0.cloudTimer[iter_76_1] = var_76_6.uniqueId
	end
end

function var_0_0.RefreshMapBG(arg_78_0)
	arg_78_0:PlayBGM()
	arg_78_0:SwitchMapBG(arg_78_0.contextData.map, nil, true)
end

function var_0_0.updateCouldAnimator(arg_79_0, arg_79_1, arg_79_2)
	if not arg_79_1 then
		return
	end

	local var_79_0 = arg_79_0.contextData.map:getConfig("ani_controller")

	local function var_79_1(arg_80_0)
		arg_80_0 = tf(arg_80_0)

		local var_80_0 = Vector3.one

		if arg_80_0.rect.width > 0 and arg_80_0.rect.height > 0 then
			var_80_0.x = arg_80_0.parent.rect.width / arg_80_0.rect.width
			var_80_0.y = arg_80_0.parent.rect.height / arg_80_0.rect.height
		end

		arg_80_0.localScale = var_80_0

		if var_79_0 and #var_79_0 > 0 then
			local var_80_1 = getProxy(ChapterProxy)

			;(function()
				for iter_81_0, iter_81_1 in ipairs(var_79_0) do
					local var_81_0 = false
					local var_81_1 = iter_81_1[2][1]

					for iter_81_2, iter_81_3 in ipairs(var_81_1) do
						local var_81_2 = var_80_1:GetChapterItemById(iter_81_3)

						if var_81_2 and var_81_2:isClear() then
							var_81_0 = true

							break
						end
					end

					if iter_81_1[1] == var_0_2 then
						local var_81_3 = _.rest(iter_81_1[2], 2)

						for iter_81_4, iter_81_5 in ipairs(var_81_3) do
							local var_81_4 = arg_80_0:Find(iter_81_5)

							if not IsNil(var_81_4) and not var_81_0 then
								setActive(var_81_4, false)
							end
						end
					elseif iter_81_1[1] == var_0_3 then
						local var_81_5 = _.rest(iter_81_1[2], 2)

						for iter_81_6, iter_81_7 in ipairs(var_81_5) do
							local var_81_6 = arg_80_0:Find(iter_81_7)

							if not IsNil(var_81_6) and not var_81_0 then
								setActive(var_81_6, true)

								return
							end
						end
					elseif iter_81_1[1] == var_0_4 then
						local var_81_7 = _.rest(iter_81_1[2], 2)

						for iter_81_8, iter_81_9 in ipairs(var_81_7) do
							local var_81_8 = arg_80_0:Find(iter_81_9)

							if not IsNil(var_81_8) and not var_81_0 then
								setActive(var_81_8, true)
							end
						end
					end
				end
			end)()
		end
	end

	local var_79_2 = arg_79_0.loader:GetPrefab("ui/" .. arg_79_1, arg_79_1, function(arg_82_0)
		arg_82_0:SetActive(true)

		local var_82_0 = arg_79_0.mapTFs[arg_79_2]

		setParent(arg_82_0, var_82_0)
		pg.ViewUtils.SetSortingOrder(arg_82_0, ChapterConst.LayerWeightMap + arg_79_2 * 2 - 1)
		var_79_1(arg_82_0)
	end)

	table.insert(arg_79_0.mapGroup, var_79_2)
end

function var_0_0.HideBtns(arg_83_0)
	setActive(arg_83_0.btnPrev, false)
	setActive(arg_83_0.eliteQuota, false)
	setActive(arg_83_0.escortBar, false)
	setActive(arg_83_0.skirmishBar, false)
	setActive(arg_83_0.normalBtn, false)
	setActive(arg_83_0.actNormalBtn, false)
	setActive(arg_83_0.eliteBtn, false)
	setActive(arg_83_0.actEliteBtn, false)
	setActive(arg_83_0.actExtraBtn, false)
	setActive(arg_83_0.remasterBtn, false)
	setActive(arg_83_0.btnNext, false)
	setActive(arg_83_0.remasterAwardBtn, false)
	setActive(arg_83_0.eventContainer, false)
	setActive(arg_83_0.activityBtn, false)
	setActive(arg_83_0.ptTotal, false)
	setActive(arg_83_0.ticketTxt.parent, false)
	setActive(arg_83_0.countDown, false)
	setActive(arg_83_0.actAtelierBuffBtn, false)
	setActive(arg_83_0.actAtelierYumiaBuffBtn, false)
	setActive(arg_83_0.actExtraRank, false)
	setActive(arg_83_0.actExchangeShopBtn, false)
	setActive(arg_83_0.mapHelpBtn, false)
end

function var_0_0.updateDifficultyBtns(arg_84_0)
	local var_84_0 = arg_84_0.contextData.map:getConfig("type")

	setActive(arg_84_0.normalBtn, var_84_0 == Map.ELITE)
	setActive(arg_84_0.eliteQuota, var_84_0 == Map.ELITE)
	setActive(arg_84_0.eliteBtn, var_84_0 == Map.SCENARIO)

	local var_84_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID)

	setActive(arg_84_0.eliteBtn:Find("pic_activity"), var_84_1 and not var_84_1:isEnd())
end

function var_0_0.updateActivityBtns(arg_85_0)
	local var_85_0 = arg_85_0.contextData.map
	local var_85_1, var_85_2 = var_85_0:isActivity()
	local var_85_3 = var_85_0:isRemaster()
	local var_85_4 = var_85_0:isSkirmish()
	local var_85_5 = var_85_0:isEscort()
	local var_85_6 = var_85_0:getConfig("type")
	local var_85_7 = setmetatable({}, MainActMapBtn)
	local var_85_8 = var_85_7:InShowTime() and not var_85_1 and not var_85_4 and not var_85_5

	arg_85_0.activityBtnLinkAct = var_85_7:GetActivity()

	if var_85_8 then
		var_85_7.image = arg_85_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_85_7.subImage = arg_85_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_85_7.tipTr = arg_85_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_85_7.tipTxt = arg_85_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_85_8 = var_85_7:InShowTime()

		if var_85_8 then
			var_85_7:InitTipImage()
			var_85_7:InitSubImage()
			var_85_7:InitImage(function()
				return
			end)
			var_85_7:OnInit()
		end
	end

	setActive(arg_85_0.activityBtn, var_85_8)
	arg_85_0:updateRemasterInfo()

	if var_85_1 and var_85_2 then
		local var_85_9

		if var_85_0:isRemaster() then
			var_85_9 = getProxy(ChapterProxy):getRemasterMaps(var_85_0.remasterId)
		else
			var_85_9 = getProxy(ChapterProxy):getMapsByActivities(var_85_0:getConfig("on_activity"))
		end

		local var_85_10 = underscore.any(var_85_9, function(arg_87_0)
			return arg_87_0:isActExtra()
		end)

		setActive(arg_85_0.actExtraBtn, var_85_10 and var_85_6 ~= Map.ACT_EXTRA)

		if isActive(arg_85_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_85_9, function(arg_88_0)
				local var_88_0 = arg_88_0:getMapType()

				return var_88_0 == Map.ACTIVITY_EASY or var_88_0 == Map.ACTIVITY_HARD
			end), function(arg_89_0)
				return arg_89_0:isAllChaptersClear()
			end) then
				setActive(arg_85_0.actExtraBtnAnim, true)
			else
				setActive(arg_85_0.actExtraBtnAnim, false)
			end

			setActive(arg_85_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive(var_85_0:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_85_11 = checkExist(var_85_0:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_85_0.actEliteBtn, var_85_11 and var_85_6 ~= Map.ACTIVITY_HARD)
		setActive(arg_85_0.actNormalBtn, var_85_6 ~= Map.ACTIVITY_EASY)
		setActive(arg_85_0.actExtraRank, var_85_6 == Map.ACT_EXTRA and _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK), function(arg_90_0)
			if not arg_90_0 or arg_90_0:isEnd() then
				return
			end

			local var_90_0 = arg_90_0:getConfig("config_data")[1]

			return _.any(var_85_0:getChapters(), function(arg_91_0)
				if not arg_91_0:IsEXChapter() then
					return false
				end

				return table.contains(arg_91_0:getConfig("boss_expedition_id"), var_90_0)
			end)
		end))
		setActive(arg_85_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_85_3 and var_85_2 and arg_85_0:IsActShopActive())

		local var_85_12 = arg_85_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_85_0.contextData.map:getConfig("on_activity")) or nil
		local var_85_13 = var_85_12 and not var_85_12:isEnd() and var_85_12:GetConfigClientSetting("PTID")

		arg_85_0:updatePtActivity(underscore.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_92_0)
			return arg_92_0:getConfig("config_id") == var_85_13
		end))
		setActive(arg_85_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_85_3 and var_85_2 and arg_85_0.ptActivity and not arg_85_0.ptActivity:isEnd())
	else
		setActive(arg_85_0.actExtraBtn, false)
		setActive(arg_85_0.actEliteBtn, false)
		setActive(arg_85_0.actNormalBtn, false)
		setActive(arg_85_0.actExtraRank, false)
		setActive(arg_85_0.actExchangeShopBtn, false)
		setActive(arg_85_0.actAtelierBuffBtn, false)
		setActive(arg_85_0.actAtelierYumiaBuffBtn, false)
		setActive(arg_85_0.ptTotal, false)
	end

	setActive(arg_85_0.eventContainer, (not var_85_1 or not var_85_2) and not var_85_5)
	setActive(arg_85_0.remasterBtn, OPEN_REMASTER and (var_85_3 or not var_85_1 and not var_85_5 and not var_85_4))
	setActive(arg_85_0.ticketTxt.parent, var_85_3)
	arg_85_0:updateRemasterTicket()
	arg_85_0:updateCountDown()
end

function var_0_0.updateRemasterTicket(arg_93_0)
	setText(arg_93_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_93_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_94_0)
	local var_94_0 = getProxy(ChapterProxy)
	local var_94_1 = var_94_0:ifShowRemasterTip() or var_94_0:anyRemasterAwardCanReceive()

	SetActive(arg_94_0.remasterBtn:Find("tip"), var_94_1)
	SetActive(arg_94_0.entranceLayer:Find("btns/btn_remaster/tip"), var_94_1)
end

function var_0_0.updatDailyBtnTip(arg_95_0)
	local var_95_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_95_0.dailyBtn:Find("tip"), var_95_0)
	SetActive(arg_95_0.entranceLayer:Find("btns/btn_daily/tip"), var_95_0)
end

function var_0_0.updateRemasterInfo(arg_96_0)
	arg_96_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_96_0.contextData.map then
		return
	end

	local var_96_0 = getProxy(ChapterProxy)
	local var_96_1 = arg_96_0.contextData.map:getRemaster()
	local var_96_2 = BossRushChapterRemasterHelper.ChapterAwardInfo(var_96_1)

	setActive(arg_96_0.remasterAwardBtn, var_96_2)

	if var_96_2 then
		local var_96_3 = var_96_2[1]
		local var_96_4, var_96_5, var_96_6, var_96_7, var_96_8 = unpack(var_96_2[2])
		local var_96_9 = var_96_2[3]
		local var_96_10 = var_96_0:getRemasterInfo(var_96_9, var_96_4, var_96_3)

		setText(arg_96_0.remasterAwardBtn:Find("Text"), var_96_10.count .. "/" .. var_96_7)
		updateDrop(arg_96_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_96_5,
			id = var_96_6
		})
		setActive(arg_96_0.remasterAwardBtn:Find("tip"), var_96_7 <= var_96_10.count)
		onButton(arg_96_0, arg_96_0.remasterAwardBtn, function()
			local var_97_0 = BossRushChapterRemasterHelper.GetAwardName(var_96_9, var_96_4)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_96_5,
					id = var_96_6
				},
				remaster = {
					word = i18n("level_remaster_tip4", var_97_0),
					number = var_96_10.count .. "/" .. var_96_7,
					btn_text = i18n(var_96_10.count < var_96_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_96_10.count < var_96_7 then
							if var_96_9 and var_96_9 > 0 then
								arg_96_0:emit(LevelMediator2.ON_BOSSRUSH_REMASTER_ACTIVITY, var_96_9)

								return
							end

							local var_98_0 = pg.chapter_template[var_96_4].map
							local var_98_1, var_98_2 = var_96_0:getMapById(var_98_0):isUnlock()

							if not var_98_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_98_2)
							else
								arg_96_0:ShowSelectedMap(var_98_0)
							end
						else
							arg_96_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_96_4, var_96_3, var_96_9)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_99_0)
	local var_99_0 = getProxy(ChapterProxy)

	if arg_99_0.newChapterCDTimer then
		arg_99_0.newChapterCDTimer:Stop()

		arg_99_0.newChapterCDTimer = nil
	end

	local var_99_1 = 0

	if arg_99_0.contextData.map:isActivity() and not arg_99_0.contextData.map:isRemaster() then
		local var_99_2 = var_99_0:getMapsByActivities(arg_99_0.contextData.map:getConfig("on_activity"))

		_.each(var_99_2, function(arg_100_0)
			local var_100_0 = arg_100_0:getChapterTimeLimit()

			if var_99_1 == 0 then
				var_99_1 = var_100_0
			else
				var_99_1 = math.min(var_99_1, var_100_0)
			end
		end)
		setActive(arg_99_0.countDown, var_99_1 > 0)
		setText(arg_99_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_99_0.countDown, false)
	end

	if var_99_1 > 0 then
		setText(arg_99_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_99_1))

		arg_99_0.newChapterCDTimer = Timer.New(function()
			var_99_1 = var_99_1 - 1

			if var_99_1 <= 0 then
				arg_99_0:updateCountDown()

				if not arg_99_0.contextData.chapterVO then
					arg_99_0:setMap(arg_99_0.contextData.mapIdx)
				end
			else
				setText(arg_99_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_99_1))
			end
		end, 1, -1)

		arg_99_0.newChapterCDTimer:Start()
	else
		setText(arg_99_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_102_0)
	onButton(arg_102_0, arg_102_0.actExtraRank, function()
		if arg_102_0:isfrozen() then
			return
		end

		arg_102_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_102_0, arg_102_0.activityBtn, function()
		if arg_102_0:isfrozen() then
			return
		end

		if arg_102_0.activityBtnLinkAct then
			local var_104_0 = arg_102_0.activityBtnLinkAct:getConfig("type")
			local var_104_1 = arg_102_0.activityBtnLinkAct.id

			if var_104_0 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)

				return
			elseif var_104_0 == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_DAL_COLLAB)

				return
			elseif var_104_1 == ActivityConst.OTHER_WORLD_TERMINAL_BATTLE_ID then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.OTHERWORLD_MAP)

				return
			elseif var_104_0 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ZHANG_WU_BOSS)

				return
			end
		end

		arg_102_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_102_0, arg_102_0.actExchangeShopBtn, function()
		if arg_102_0:isfrozen() then
			return
		end

		arg_102_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_102_0, arg_102_0.actAtelierBuffBtn, function()
		if arg_102_0:isfrozen() then
			return
		end

		arg_102_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)
	onButton(arg_102_0, arg_102_0.actAtelierYumiaBuffBtn, function()
		if arg_102_0:isfrozen() then
			return
		end

		arg_102_0:emit(LevelMediator2.SHOW_ATELIER_BUFF, true)
	end, SFX_UI_CLICK)

	local var_102_0 = getProxy(ChapterProxy)

	local function var_102_1(arg_108_0, arg_108_1, arg_108_2)
		local var_108_0

		if arg_108_0:isRemaster() then
			var_108_0 = var_102_0:getRemasterMaps(arg_108_0.remasterId)
		else
			var_108_0 = var_102_0:getMapsByActivities(arg_108_0:getConfig("on_activity"))
		end

		local var_108_1 = _.select(var_108_0, function(arg_109_0)
			return arg_109_0:getMapType() == arg_108_1
		end)

		table.sort(var_108_1, function(arg_110_0, arg_110_1)
			return arg_110_0.id < arg_110_1.id
		end)

		local var_108_2 = table.indexof(underscore.map(var_108_1, function(arg_111_0)
			return arg_111_0.id
		end), arg_108_2) or #var_108_1

		while not var_108_1[var_108_2]:isUnlock() do
			if var_108_2 > 1 then
				var_108_2 = var_108_2 - 1
			else
				break
			end
		end

		return var_108_1[var_108_2]
	end

	arg_102_0:bind(LevelUIConst.SWITCH_ACT_MAP, function(arg_112_0, arg_112_1, arg_112_2)
		arg_112_2 = arg_112_2 or switch(arg_112_1, {
			[Map.ACTIVITY_EASY] = function()
				return arg_102_0.contextData.map:getBindMapId()
			end,
			[Map.ACTIVITY_HARD] = function()
				return arg_102_0.contextData.map:getBindMapId()
			end,
			[Map.ACT_EXTRA] = function()
				return PlayerPrefs.GetInt("ex_mapId", 0)
			end
		})

		local var_112_0 = var_102_1(arg_102_0.contextData.map, arg_112_1, arg_112_2)
		local var_112_1, var_112_2 = var_112_0:isUnlock()

		if var_112_1 then
			arg_102_0:setMap(var_112_0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_112_2)
		end
	end)
	onButton(arg_102_0, arg_102_0.actNormalBtn, function()
		if arg_102_0:isfrozen() then
			return
		end

		arg_102_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
	onButton(arg_102_0, arg_102_0.actEliteBtn, function()
		if arg_102_0:isfrozen() then
			return
		end

		arg_102_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(arg_102_0, arg_102_0.actExtraBtn, function()
		if arg_102_0:isfrozen() then
			return
		end

		arg_102_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACT_EXTRA)
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_119_0, arg_119_1)
	arg_119_0.initPositions = {}

	local var_119_0 = arg_119_1 or 1
	local var_119_1 = pg.expedition_data_by_map[var_119_0].clouds_pos

	for iter_119_0, iter_119_1 in ipairs(arg_119_0.cloudRTFs) do
		local var_119_2 = var_119_1[iter_119_0]

		if var_119_2 then
			iter_119_1.anchoredPosition = Vector2(var_119_2[1], var_119_2[2])

			table.insert(arg_119_0.initPositions, iter_119_1.anchoredPosition)
		else
			setActive(iter_119_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_120_0, arg_120_1, arg_120_2)
	onButton(arg_120_0, arg_120_1, function()
		if arg_120_0:isfrozen() then
			return
		end

		local var_121_0 = arg_120_0.contextData.mapIdx + arg_120_2
		local var_121_1 = getProxy(ChapterProxy):getMapById(var_121_0)

		if not var_121_1 then
			return
		end

		if var_121_1:getMapType() == Map.ELITE and not var_121_1:isEliteEnabled() then
			var_121_1 = var_121_1:getBindMap()
			var_121_0 = var_121_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_121_2, var_121_3 = var_121_1:isUnlock()

		if arg_120_2 > 0 and not var_121_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_121_3)

			return
		end

		arg_120_0:setMap(var_121_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_122_0, arg_122_1, arg_122_2)
	seriesAsync({
		function(arg_123_0)
			if arg_122_0.contextData.entranceStatus then
				arg_122_0:frozen()

				arg_122_0.nextPreloadMap = arg_122_1

				arg_122_0:PreloadLevelMainUI(arg_122_1, function()
					arg_122_0:unfrozen()

					if arg_122_0.nextPreloadMap ~= arg_122_1 then
						return
					end

					arg_122_0:ShowEntranceUI(false)
					arg_122_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_122_1)
					arg_123_0()
				end)
			else
				arg_122_0:setMap(arg_122_1)
				arg_123_0()
			end
		end
	}, arg_122_2)
end

function var_0_0.setMap(arg_125_0, arg_125_1)
	local var_125_0 = arg_125_0.contextData.mapIdx

	arg_125_0.contextData.mapIdx = arg_125_1
	arg_125_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_125_1)

	assert(arg_125_0.contextData.map, "map cannot be nil " .. arg_125_1)

	if arg_125_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_125_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_125_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_125_0.contextData.map.remasterId, arg_125_1)
		PlayerPrefs.Save()
	end

	arg_125_0:RecordLastMapOnExit()
	arg_125_0:updateMap(var_125_0)
	arg_125_0:tryPlayMapStory()
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

function var_0_0.SwitchMapBuilder(arg_126_0, arg_126_1)
	if arg_126_0.mapBuilder and arg_126_0.mapBuilder:GetType() ~= arg_126_1 then
		arg_126_0.mapBuilder.buffer:Hide()
	end

	local var_126_0 = arg_126_0:GetMapBuilderInBuffer(arg_126_1)

	arg_126_0.mapBuilder = var_126_0

	var_126_0.buffer:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_127_0, arg_127_1)
	if not arg_127_0.mbDict[arg_127_1] then
		local var_127_0 = _G[var_0_6[arg_127_1]]

		assert(var_127_0, "Missing MapBuilder of type " .. (arg_127_1 or "NIL"))

		arg_127_0.mbDict[arg_127_1] = var_127_0.New(arg_127_0._tf, arg_127_0)
		arg_127_0.mbDict[arg_127_1].isFrozen = arg_127_0:isfrozen()

		arg_127_0.mbDict[arg_127_1]:Load()
	end

	return arg_127_0.mbDict[arg_127_1]
end

function var_0_0.updateMap(arg_128_0, arg_128_1)
	local var_128_0 = arg_128_0.contextData.map
	local var_128_1 = var_128_0:getConfig("anchor")
	local var_128_2

	if var_128_1 == "" then
		var_128_2 = Vector2(0.5, 0.5)
	else
		var_128_2 = Vector2(unpack(var_128_1))
	end

	arg_128_0.map.pivot = var_128_2

	local var_128_3 = var_128_0:getConfig("uifx")

	for iter_128_0 = 1, arg_128_0.UIFXList.childCount do
		local var_128_4 = arg_128_0.UIFXList:GetChild(iter_128_0 - 1)

		setActive(var_128_4, var_128_4.name == var_128_3)
	end

	arg_128_0:SwitchMapBG(var_128_0, arg_128_1)
	arg_128_0:PlayBGM()

	local var_128_5 = arg_128_0.contextData.map:getConfig("ui_type")

	arg_128_0:SwitchMapBuilder(var_128_5)
	seriesAsync({
		function(arg_129_0)
			arg_128_0.mapBuilder:CallbackInvoke(arg_129_0)
		end,
		function(arg_130_0)
			arg_128_0.mapBuilder:UpdateMapVO(var_128_0)
			arg_128_0.mapBuilder:UpdateView()
			arg_128_0.mapBuilder:UpdateMapItems()
			arg_128_0.mapBuilder:PlayEnterAnim()
		end
	})
end

function var_0_0.UpdateSwitchMapButton(arg_131_0)
	local var_131_0 = arg_131_0.contextData.map
	local var_131_1 = getProxy(ChapterProxy)
	local var_131_2 = var_131_1:getMapById(var_131_0.id - 1)
	local var_131_3 = var_131_1:getMapById(var_131_0.id + 1)

	setActive(arg_131_0.btnPrev, tobool(var_131_2))
	setActive(arg_131_0.btnNext, tobool(var_131_3))

	local var_131_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_131_0.btnPrevCol, var_131_2 and Color.white or var_131_4)
	setImageColor(arg_131_0.btnNextCol, var_131_3 and var_131_3:isUnlock() and Color.white or var_131_4)
end

function var_0_0.tryPlayMapStory(arg_132_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_133_0)
			local var_133_0 = arg_132_0.contextData.map:getConfig("enter_story")

			if var_133_0 and var_133_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_133_0) and not arg_132_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_133_1 = tonumber(var_133_0)

				if var_133_1 and var_133_1 > 0 then
					arg_132_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_133_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_133_0, arg_133_0)
				end

				return
			end

			arg_133_0()
		end,
		function(arg_134_0)
			local var_134_0 = arg_132_0.contextData.map:getConfig("guide_id")

			if var_134_0 and var_134_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_134_0, nil, arg_134_0)

				return
			end

			arg_134_0()
		end,
		function(arg_135_0)
			if isActive(arg_132_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_135_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_135_1

				if var_135_0 then
					var_135_1 = {
						1,
						2
					}
				else
					var_135_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_135_1)
			else
				arg_135_0()
			end
		end,
		function(arg_136_0)
			if arg_132_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_132_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_137_0, arg_137_1, arg_137_2, arg_137_3)
	arg_137_0.uiAnims = arg_137_0.uiAnims or {}

	local var_137_0 = arg_137_0.uiAnims[arg_137_1]

	local function var_137_1()
		arg_137_0.playing = true

		arg_137_0:frozen()
		var_137_0:SetActive(true)

		local var_138_0 = tf(var_137_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_138_0)

		if arg_137_3 then
			arg_137_3(var_137_0)
		end

		var_138_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_139_0)
			arg_137_0.playing = false

			if arg_137_2 then
				arg_137_2(var_137_0)
			end

			arg_137_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_137_0 then
		PoolMgr.GetInstance():GetUI(arg_137_1, true, function(arg_140_0)
			arg_140_0:SetActive(true)

			arg_137_0.uiAnims[arg_137_1] = arg_140_0
			var_137_0 = arg_137_0.uiAnims[arg_137_1]

			var_137_1()
		end)
	else
		var_137_1()
	end
end

function var_0_0.displaySpResult(arg_141_0, arg_141_1, arg_141_2)
	setActive(arg_141_0.spResult, true)
	arg_141_0:DisplaySPAnim(arg_141_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_142_0)
		onButton(arg_141_0, arg_142_0, function()
			removeOnButton(arg_142_0)
			setActive(arg_142_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_142_0, arg_141_0._tf)
			arg_141_0:hideSpResult()
			arg_141_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_144_0)
	setActive(arg_144_0.spResult, false)
end

function var_0_0.displayBombResult(arg_145_0, arg_145_1)
	setActive(arg_145_0.spResult, true)
	arg_145_0:DisplaySPAnim("SpBombRet", function(arg_146_0)
		onButton(arg_145_0, arg_146_0, function()
			removeOnButton(arg_146_0)
			setActive(arg_146_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_146_0, arg_145_0._tf)
			arg_145_0:hideSpResult()
			arg_145_1()
		end, SFX_PANEL)
	end, function(arg_148_0)
		setText(arg_148_0.transform:Find("right/name_bg/en"), arg_145_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_149_0, arg_149_1, arg_149_2)
	arg_149_0.contextData.chapterLoopFlag = arg_149_2

	local var_149_0 = getProxy(ChapterProxy):getChapterById(arg_149_1, true)

	if var_149_0:getConfig("type") == Chapter.CustomFleet then
		arg_149_0:displayFleetEdit(var_149_0)

		return
	end

	if #var_149_0:getNpcShipByType(1) > 0 then
		arg_149_0:emit(LevelMediator2.ON_TRACKING, arg_149_1)

		return
	end

	arg_149_0:displayFleetSelect(var_149_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_150_0, arg_150_1, arg_150_2)
	seriesAsync({
		function(arg_151_0)
			if not arg_150_0.levelInfoView:GetLoaded() then
				arg_150_0:frozen()
				arg_150_0.levelInfoView:Load()
				arg_150_0.levelInfoView:CallbackInvoke(function()
					arg_150_0:unfrozen()
					arg_151_0()
				end)

				return
			end

			arg_151_0()
		end,
		function(arg_153_0)
			local function var_153_0(arg_154_0, arg_154_1)
				arg_150_0:hideChapterPanel()
				arg_150_0:OnLevelInfoPanelConfirm(arg_154_0, arg_154_1)
			end

			local function var_153_1()
				arg_150_0:hideChapterPanel()
			end

			local var_153_2 = getProxy(ChapterProxy):getChapterById(arg_150_1, true)

			if getProxy(ChapterProxy):getMapById(var_153_2:getConfig("map")):isSkirmish() and #var_153_2:getNpcShipByType(1) > 0 then
				var_153_0(false)

				return
			end

			arg_150_0.levelInfoView:set(arg_150_1, arg_150_2)
			arg_150_0.levelInfoView:setCBFunc(var_153_0, var_153_1)
			arg_150_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_156_0)
	if arg_156_0.levelInfoView:isShowing() then
		arg_156_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_157_0)
	arg_157_0.levelInfoView:Destroy()

	arg_157_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_158_0, arg_158_1, arg_158_2, arg_158_3)
	seriesAsync({
		function(arg_159_0)
			if not arg_158_0.levelInfoSPView then
				arg_158_0.levelInfoSPView = LevelInfoSPView.New(arg_158_0.topPanel, arg_158_0.event, arg_158_0.contextData)

				arg_158_0.levelInfoSPView:RegisterView(arg_158_0)
				arg_158_0:frozen()
				arg_158_0.levelInfoSPView:Load()
				arg_158_0.levelInfoSPView:CallbackInvoke(function()
					arg_158_0:unfrozen()
					arg_159_0()
				end)

				return
			end

			arg_159_0()
		end,
		function(arg_161_0)
			local function var_161_0(arg_162_0, arg_162_1)
				arg_158_0:HideLevelInfoSPPanel()
				arg_158_0:OnLevelInfoPanelConfirm(arg_162_0, arg_162_1)
			end

			local function var_161_1()
				arg_158_0:HideLevelInfoSPPanel()
			end

			arg_158_0.levelInfoSPView:SetChapterGroupInfo(arg_158_2)
			arg_158_0.levelInfoSPView:set(arg_158_1, arg_158_3)
			arg_158_0.levelInfoSPView:setCBFunc(var_161_0, var_161_1)
			arg_158_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_164_0)
	if arg_164_0.levelInfoSPView and arg_164_0.levelInfoSPView:isShowing() then
		arg_164_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_165_0)
	if not arg_165_0.levelInfoSPView then
		return
	end

	arg_165_0.levelInfoSPView:Destroy()

	arg_165_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_166_0, arg_166_1)
	local var_166_0 = arg_166_0.contextData.selectedFleetIDs or arg_166_1:GetDefaultFleetIndex()

	arg_166_1 = Clone(arg_166_1)
	arg_166_1.loopFlag = arg_166_0.contextData.chapterLoopFlag

	arg_166_0.levelFleetView:updateSpecialOperationTickets(arg_166_0.spTickets)
	arg_166_0.levelFleetView:Load()
	arg_166_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_166_0.shipVOs)
	arg_166_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_166_0.openedCommanerSystem)
	arg_166_0.levelFleetView:ActionInvoke("set", arg_166_1, arg_166_0.fleets, var_166_0)
	arg_166_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_167_0)
	if arg_167_0.levelCMDFormationView:isShowing() then
		arg_167_0.levelCMDFormationView:Hide()
	end

	if arg_167_0.levelFleetView then
		arg_167_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_168_0)
	arg_168_0.levelCMDFormationView = LevelCMDFormationView.New(arg_168_0.topPanel, arg_168_0.event, arg_168_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_169_0)
	if not arg_169_0.levelFleetView then
		return
	end

	arg_169_0.levelFleetView:Destroy()

	arg_169_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_170_0, arg_170_1)
	arg_170_1 = Clone(arg_170_1)
	arg_170_1.loopFlag = arg_170_0.contextData.chapterLoopFlag

	arg_170_0.levelFleetView:updateSpecialOperationTickets(arg_170_0.spTickets)
	arg_170_0.levelFleetView:Load()
	arg_170_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_170_0.openedCommanerSystem)
	arg_170_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_170_0.shipVOs)
	arg_170_0.levelFleetView:ActionInvoke("setOnHard", arg_170_1)
	arg_170_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_171_0)
	arg_171_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_172_0)
	arg_172_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_173_0, arg_173_1)
	if not arg_173_0.levelFleetView then
		return
	end

	assert(arg_173_0.levelFleetView:GetLoaded())

	local var_173_0 = arg_173_0.levelFleetView:IsSelectMode()
	local var_173_1

	if var_173_0 then
		arg_173_0.levelFleetView:ActionInvoke("set", arg_173_1 or arg_173_0.levelFleetView.chapter, arg_173_0.fleets, arg_173_0.levelFleetView:getSelectIds())

		if arg_173_0.levelCMDFormationView:isShowing() then
			local var_173_2 = arg_173_0.levelCMDFormationView.fleet.id

			var_173_1 = arg_173_0.fleets[var_173_2]
		end
	else
		arg_173_0.levelFleetView:ActionInvoke("setOnHard", arg_173_1 or arg_173_0.levelFleetView.chapter)

		if arg_173_0.levelCMDFormationView:isShowing() then
			local var_173_3 = arg_173_0.levelCMDFormationView.fleet.id

			var_173_1 = arg_173_1:wrapEliteFleet(var_173_3)
		end
	end

	if var_173_1 then
		arg_173_0.levelCMDFormationView:ActionInvoke("updateFleet", var_173_1)
	end
end

function var_0_0.setChapter(arg_174_0, arg_174_1)
	local var_174_0

	if arg_174_1 then
		var_174_0 = arg_174_1.id
	end

	arg_174_0.contextData.chapterId = var_174_0
	arg_174_0.contextData.chapterVO = arg_174_1
end

function var_0_0.switchToChapter(arg_175_0, arg_175_1)
	if arg_175_0.contextData.mapIdx ~= arg_175_1:getConfig("map") then
		arg_175_0:setMap(arg_175_1:getConfig("map"))
	end

	arg_175_0:setChapter(arg_175_1)

	arg_175_0.leftCanvasGroup.blocksRaycasts = false
	arg_175_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_175_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_175_0:DestroyLevelStageView()

	if not arg_175_0.levelStageView then
		arg_175_0.levelStageView = LevelStageView.New(arg_175_0.topPanel, arg_175_0.event, arg_175_0.contextData)

		arg_175_0.levelStageView:Load()

		arg_175_0.levelStageView.isFrozen = arg_175_0:isfrozen()
	end

	arg_175_0:frozen()

	local function var_175_0()
		seriesAsync({
			function(arg_177_0)
				arg_175_0.mapBuilder:CallbackInvoke(arg_177_0)
			end,
			function(arg_178_0)
				setActive(arg_175_0.clouds, false)
				arg_175_0.mapBuilder:HideFloat()
				arg_175_0:BlurPanel(arg_175_0.topPanel, {
					blurCamList = {
						pg.UIMgr.CameraUI
					}
				})
				arg_175_0.levelStageView:updateStageInfo()
				arg_175_0.levelStageView:updateAmbushRate(arg_175_1.fleet.line, true)
				arg_175_0.levelStageView:updateStageAchieve()
				arg_175_0.levelStageView:updateStageBarrier()
				arg_175_0.levelStageView:updateBombPanel()
				arg_175_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_178_0)
			end,
			function(arg_179_0)
				if arg_175_0.exited then
					return
				end

				arg_175_0.levelStageView:updateStageStrategy()

				arg_175_0.canvasGroup.blocksRaycasts = arg_175_0.frozenCount == 0

				onNextTick(arg_179_0)
			end,
			function(arg_180_0)
				if arg_175_0.exited then
					return
				end

				arg_175_0.levelStageView:updateStageFleet()
				arg_175_0.levelStageView:updateSupportFleet()
				arg_175_0.levelStageView:updateFleetBuff()
				onNextTick(arg_180_0)
			end,
			function(arg_181_0)
				if arg_175_0.exited then
					return
				end

				parallelAsync({
					function(arg_182_0)
						local var_182_0 = arg_175_1:getConfig("scale")
						local var_182_1 = LeanTween.value(go(arg_175_0.map), arg_175_0.map.localScale, Vector3.New(var_182_0[3], var_182_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_183_0)
							arg_175_0.map.localScale = arg_183_0
							arg_175_0.float.localScale = arg_183_0
						end):setOnComplete(System.Action(function()
							arg_175_0.mapBuilder:ShowFloat()
							arg_175_0.mapBuilder:Hide()
							arg_182_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_175_0:RecordTween("mapScale", var_182_1.uniqueId)

						local var_182_2 = LeanTween.value(go(arg_175_0.map), arg_175_0.map.pivot, Vector2.New(math.clamp(var_182_0[1] - 0.5, 0, 1), math.clamp(var_182_0[2] - 0.5, 0, 1)), var_0_1)

						var_182_2:setOnUpdateVector2(function(arg_185_0)
							arg_175_0.map.pivot = arg_185_0
							arg_175_0.float.pivot = arg_185_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_175_0:RecordTween("mapPivot", var_182_2.uniqueId)
						shiftPanel(arg_175_0.leftChapter, -arg_175_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_175_0.rightChapter, arg_175_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_175_0.topChapter, 0, arg_175_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_175_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_186_0)
						arg_175_0:PlayBGM()

						local var_186_0 = {}
						local var_186_1 = arg_175_1:getConfig("bg")

						if var_186_1 and #var_186_1 > 0 then
							var_186_0[1] = {
								BG = var_186_1
							}
						end

						arg_175_0:SwitchBG(var_186_0, arg_186_0)
					end
				}, function()
					onNextTick(arg_181_0)
				end)
			end,
			function(arg_188_0)
				if arg_175_0.exited then
					return
				end

				setActive(arg_175_0.topChapter, false)
				setActive(arg_175_0.leftChapter, false)
				setActive(arg_175_0.rightChapter, false)

				arg_175_0.leftCanvasGroup.blocksRaycasts = true
				arg_175_0.rightCanvasGroup.blocksRaycasts = true

				arg_175_0:initGrid(arg_188_0)
			end,
			function(arg_189_0)
				if arg_175_0.exited then
					return
				end

				arg_175_0.levelStageView:SetGrid(arg_175_0.grid)

				arg_175_0.contextData.huntingRangeVisibility = arg_175_0.contextData.huntingRangeVisibility - 1

				arg_175_0.grid:toggleHuntingRange()

				local var_189_0 = arg_175_1:getConfig("pop_pic")

				if var_189_0 and #var_189_0 > 0 and arg_175_0.FirstEnterChapter == arg_175_1.id then
					arg_175_0:doPlayAnim(var_189_0, function(arg_190_0)
						setActive(arg_190_0, false)

						if arg_175_0.exited then
							return
						end

						arg_189_0()
					end)
				else
					arg_189_0()
				end
			end,
			function(arg_191_0)
				arg_175_0.levelStageView:tryAutoAction(arg_191_0)
			end,
			function(arg_192_0)
				if arg_175_0.exited then
					return
				end

				arg_175_0:unfrozen()

				if arg_175_0.FirstEnterChapter then
					arg_175_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_175_1.subAutoAttack)
				end

				arg_175_0.FirstEnterChapter = nil

				arg_192_0()
			end,
			function(arg_193_0)
				if arg_175_1:NeedSupportSubmarineStage() then
					arg_175_0.levelStageView:TryEnterChapterSupportSubmarineStage(arg_193_0)
				else
					arg_193_0()
				end
			end
		}, function()
			arg_175_0.levelStageView:tryAutoTrigger(true)
		end)
	end

	arg_175_0.levelStageView:ActionInvoke("SetSeriesOperation", var_175_0)
	arg_175_0.levelStageView:ActionInvoke("SetPlayer", arg_175_0.player)
	arg_175_0.levelStageView:ActionInvoke("SwitchToChapter", arg_175_1)
end

function var_0_0.switchToMap(arg_195_0, arg_195_1)
	arg_195_0:frozen()
	arg_195_0:destroyGrid()
	arg_195_0:setChapter(nil)
	LeanTween.cancel(go(arg_195_0.map))

	local var_195_0 = LeanTween.value(go(arg_195_0.map), arg_195_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_196_0)
		arg_195_0.map.localScale = arg_196_0
		arg_195_0.float.localScale = arg_196_0
	end):setOnComplete(System.Action(function()
		arg_195_0:unfrozen()
		arg_195_0.mapBuilder:PlayEnterAnim()
		existCall(arg_195_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_195_0:RecordTween("mapScale", var_195_0.uniqueId)

	local var_195_1 = arg_195_0.contextData.map:getConfig("anchor")
	local var_195_2

	if var_195_1 == "" then
		var_195_2 = Vector2(0.5, 0.5)
	else
		var_195_2 = Vector2(unpack(var_195_1))
	end

	local var_195_3 = LeanTween.value(go(arg_195_0.map), arg_195_0.map.pivot, var_195_2, var_0_1)

	var_195_3:setOnUpdateVector2(function(arg_198_0)
		arg_195_0.map.pivot = arg_198_0
		arg_195_0.float.pivot = arg_198_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_195_0:RecordTween("mapPivot", var_195_3.uniqueId)
	setActive(arg_195_0.topChapter, true)
	setActive(arg_195_0.leftChapter, true)
	setActive(arg_195_0.rightChapter, true)
	shiftPanel(arg_195_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_195_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_195_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_195_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_195_0.levelStageView then
		arg_195_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_195_0:DestroyLevelStageView()
		end)
		arg_195_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_195_0:SwitchMapBG(arg_195_0.contextData.map)
	arg_195_0:PlayBGM()
	seriesAsync({
		function(arg_200_0)
			arg_195_0.mapBuilder:CallbackInvoke(arg_200_0)
		end,
		function(arg_201_0)
			arg_195_0.mapBuilder:Show()
			arg_195_0.mapBuilder:UpdateView()
			arg_195_0.mapBuilder:UpdateMapItems()
		end
	})
	arg_195_0:UnOverlayPanel(arg_195_0.topPanel, arg_195_0._tf)

	arg_195_0.canvasGroup.blocksRaycasts = arg_195_0.frozenCount == 0
	arg_195_0.canvasGroup.interactable = true

	if arg_195_0.ambushWarning and arg_195_0.ambushWarning.activeSelf then
		arg_195_0.ambushWarning:SetActive(false)
		arg_195_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_202_0, arg_202_1, arg_202_2, arg_202_3)
	if not arg_202_1 or #arg_202_1 <= 0 then
		existCall(arg_202_2)

		return
	elseif arg_202_3 then
		-- block empty
	elseif table.equal(arg_202_0.currentBG, arg_202_1) then
		return
	end

	arg_202_0.currentBG = arg_202_1

	for iter_202_0, iter_202_1 in ipairs(arg_202_0.mapGroup) do
		arg_202_0.loader:ClearRequest(iter_202_1)
	end

	table.clear(arg_202_0.mapGroup)

	local var_202_0 = {}

	table.ParallelIpairsAsync(arg_202_1, function(arg_203_0, arg_203_1, arg_203_2)
		local var_203_0 = arg_202_0.mapTFs[arg_203_0]
		local var_203_1 = arg_203_1.bgPrefix and arg_203_1.bgPrefix .. "/" or "levelmap/"
		local var_203_2 = arg_202_0.loader:GetSpriteDirect(var_203_1 .. arg_203_1.BG, "", function(arg_204_0)
			var_202_0[arg_203_0] = arg_204_0

			arg_203_2()
		end, var_203_0)

		table.insert(arg_202_0.mapGroup, var_203_2)
		arg_202_0:updateCouldAnimator(arg_203_1.Animator, arg_203_0)
	end, function()
		for iter_205_0, iter_205_1 in ipairs(arg_202_0.mapTFs) do
			setImageSprite(iter_205_1, var_202_0[iter_205_0])
			setActive(iter_205_1, arg_202_1[iter_205_0])
			SetCompomentEnabled(iter_205_1, typeof(Image), true)
		end

		existCall(arg_202_2)
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

function var_0_0.ClearMapTransitions(arg_206_0)
	if not arg_206_0.mapTransitions then
		return
	end

	for iter_206_0, iter_206_1 in pairs(arg_206_0.mapTransitions) do
		if iter_206_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_206_0, iter_206_0, iter_206_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_206_0, iter_206_0)
		end
	end

	arg_206_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_207_0, arg_207_1, arg_207_2, arg_207_3)
	local var_207_0, var_207_1, var_207_2 = arg_207_0:GetMapBG(arg_207_1, arg_207_2)
	local var_207_3 = {}

	if var_207_1 then
		table.insert(var_207_3, function(arg_208_0)
			arg_207_0:PlayMapTransition("LevelMapTransition_" .. var_207_1, var_207_2, arg_208_0)
		end)
	end

	seriesAsync(var_207_3, function()
		arg_207_0:SwitchBGMapType(arg_207_1:getConfig("pos_type"))
		arg_207_0:SwitchBG(var_207_0, nil, arg_207_3)
	end)
end

function var_0_0.SwitchBGMapType(arg_210_0, arg_210_1)
	if arg_210_0.posType == arg_210_1 then
		return
	end

	for iter_210_0, iter_210_1 in ipairs({
		arg_210_0.map,
		arg_210_0.float
	}) do
		local var_210_0 = GetOrAddComponent(iter_210_1, typeof(AspectRatioFitter))

		var_210_0.aspectRatio = 1.7777777777777777
		var_210_0.enabled = arg_210_1 == 0

		if arg_210_1 == 1 then
			iter_210_1.anchorMin = Vector2(0.5, 0.5)
			iter_210_1.anchorMax = Vector2(0.5, 0.5)

			setSizeDelta(var_210_0, {
				x = 2520,
				y = 1440
			})
		end
	end
end

function var_0_0.GetMapBG(arg_211_0, arg_211_1, arg_211_2)
	if not table.contains(var_0_7, arg_211_1.id) then
		return {
			arg_211_0:GetMapElement(arg_211_1)
		}
	end

	local var_211_0 = arg_211_1.id
	local var_211_1 = table.indexof(var_0_7, var_211_0) - 1
	local var_211_2 = bit.lshift(bit.rshift(var_211_1, 1), 1) + 1
	local var_211_3 = {
		var_0_7[var_211_2],
		var_0_7[var_211_2 + 1]
	}
	local var_211_4 = _.map(var_211_3, function(arg_212_0)
		return getProxy(ChapterProxy):getMapById(arg_212_0)
	end)

	if _.all(var_211_4, function(arg_213_0)
		return arg_213_0:isAllChaptersClear()
	end) then
		local var_211_5 = {
			arg_211_0:GetMapElement(arg_211_1)
		}

		if not arg_211_2 or math.abs(var_211_0 - arg_211_2) ~= 1 then
			return var_211_5
		end

		local var_211_6 = var_0_9[bit.rshift(var_211_2 - 1, 1) + 1]
		local var_211_7 = bit.band(var_211_1, 1) == 1

		return var_211_5, var_211_6, var_211_7
	else
		local var_211_8 = 0

		;(function()
			local var_214_0 = var_211_4[1]:getChapters()

			for iter_214_0, iter_214_1 in ipairs(var_214_0) do
				if not iter_214_1:isClear() then
					return
				end

				var_211_8 = var_211_8 + 1
			end

			if not var_211_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_211_8 = var_211_8 + 1

			local var_214_1 = var_211_4[2]:getChapters()

			for iter_214_2, iter_214_3 in ipairs(var_214_1) do
				if not iter_214_3:isClear() then
					return
				end

				var_211_8 = var_211_8 + 1
			end
		end)()

		local var_211_9

		if var_211_8 > 0 then
			local var_211_10 = var_0_8[bit.rshift(var_211_2 - 1, 1) + 1]

			var_211_9 = {
				{
					BG = "map_" .. var_211_10[1],
					Animator = var_211_10[2]
				},
				{
					BG = "map_" .. var_211_10[3] + var_211_8,
					Animator = var_211_10[4]
				}
			}
		else
			var_211_9 = {
				arg_211_0:GetMapElement(arg_211_1)
			}
		end

		return var_211_9
	end
end

function var_0_0.GetMapElement(arg_215_0, arg_215_1)
	local var_215_0 = arg_215_1:getConfig("bg")
	local var_215_1 = arg_215_1:getConfig("ani_controller")

	if var_215_1 and #var_215_1 > 0 then
		(function()
			local var_216_0 = getProxy(ChapterProxy)

			for iter_216_0, iter_216_1 in ipairs(var_215_1) do
				local var_216_1 = _.rest(iter_216_1[2], 2)

				for iter_216_2, iter_216_3 in ipairs(var_216_1) do
					if string.find(iter_216_3, "^map_") and iter_216_1[1] == var_0_3 then
						local var_216_2 = iter_216_1[2][1]
						local var_216_3 = false

						for iter_216_4, iter_216_5 in ipairs(var_216_2) do
							local var_216_4 = var_216_0:GetChapterItemById(iter_216_5)

							if var_216_4 and var_216_4:isClear() then
								var_216_3 = true

								break
							end
						end

						if not var_216_3 then
							var_215_0 = iter_216_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_215_2 = {
		BG = var_215_0
	}

	var_215_2.Animator, var_215_2.AnimatorController = arg_215_0:GetMapAnimator(arg_215_1)

	return var_215_2
end

function var_0_0.GetMapAnimator(arg_217_0, arg_217_1)
	local var_217_0 = arg_217_1:getConfig("ani_name")

	if arg_217_1:getConfig("animtor") == 1 and var_217_0 and #var_217_0 > 0 then
		local var_217_1 = arg_217_1:getConfig("ani_controller")

		if var_217_1 and #var_217_1 > 0 then
			(function()
				local var_218_0 = getProxy(ChapterProxy)

				for iter_218_0, iter_218_1 in ipairs(var_217_1) do
					local var_218_1 = _.rest(iter_218_1[2], 2)

					for iter_218_2, iter_218_3 in ipairs(var_218_1) do
						if string.find(iter_218_3, "^effect_") and iter_218_1[1] == var_0_3 then
							local var_218_2 = iter_218_1[2][1]
							local var_218_3 = false

							for iter_218_4, iter_218_5 in ipairs(var_218_2) do
								local var_218_4 = var_218_0:GetChapterItemById(iter_218_5)

								if var_218_4 and var_218_4:isClear() then
									var_218_3 = true

									break
								end
							end

							if not var_218_3 then
								var_217_0 = "map_" .. string.sub(iter_218_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_217_0, var_217_1
	end
end

function var_0_0.PlayMapTransition(arg_219_0, arg_219_1, arg_219_2, arg_219_3, arg_219_4)
	arg_219_0.mapTransitions = arg_219_0.mapTransitions or {}

	local var_219_0

	local function var_219_1()
		arg_219_0:frozen()
		existCall(arg_219_3, var_219_0)
		var_219_0:SetActive(true)

		local var_220_0 = tf(var_219_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_220_0)
		var_219_0:GetComponent(typeof(Animator)):Play(arg_219_2 and "Sequence" or "Inverted", -1, 0)
		var_220_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_221_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_220_0, arg_219_0._tf)
			existCall(arg_219_4, var_219_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_219_1, arg_219_1, var_219_0)

			arg_219_0.mapTransitions[arg_219_1] = false

			arg_219_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_219_1, arg_219_1, true, function(arg_222_0)
		var_219_0 = arg_222_0
		arg_219_0.mapTransitions[arg_219_1] = arg_222_0

		var_219_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_223_0)
	if arg_223_0.levelStageView then
		arg_223_0.levelStageView:Destroy()

		arg_223_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_224_0, arg_224_1)
	arg_224_0.levelAmbushView = LevelAmbushView.New(arg_224_0.topPanel, arg_224_0.event, arg_224_0.contextData)

	arg_224_0.levelAmbushView:Load()
	arg_224_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_224_1)
end

function var_0_0.hideAmbushInfo(arg_225_0)
	if arg_225_0.levelAmbushView then
		arg_225_0.levelAmbushView:Destroy()

		arg_225_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_226_0, arg_226_1)
	arg_226_0:frozen()

	local function var_226_0()
		arg_226_0.ambushWarning:SetActive(true)

		local var_227_0 = tf(arg_226_0.ambushWarning)

		var_227_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_227_0:SetSiblingIndex(1)

		local var_227_1 = var_227_0:GetComponent("DftAniEvent")

		var_227_1:SetTriggerEvent(function(arg_228_0)
			arg_226_1()
		end)
		var_227_1:SetEndEvent(function(arg_229_0)
			arg_226_0.ambushWarning:SetActive(false)
			arg_226_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_226_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_231_0)
			arg_231_0:SetActive(true)

			arg_226_0.ambushWarning = arg_231_0

			var_226_0()
		end)
	else
		var_226_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_232_0)
	if arg_232_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_232_0.ambushWarning)

		arg_232_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_233_0, arg_233_1)
	arg_233_0.levelStrategyView = LevelStrategyView.New(arg_233_0.topPanel, arg_233_0.event, arg_233_0.contextData)

	arg_233_0.levelStrategyView:Load()
	arg_233_0.levelStrategyView:ActionInvoke("set", arg_233_1)

	local function var_233_0()
		local var_234_0 = arg_233_0.contextData.chapterVO.fleet
		local var_234_1 = pg.strategy_data_template[arg_233_1.id]

		if not var_234_0:canUseStrategy(arg_233_1) then
			return
		end

		local var_234_2 = var_234_0:getNextStgUser(arg_233_1.id)

		if var_234_1.type == ChapterConst.StgTypeForm then
			arg_233_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_234_2,
				arg1 = arg_233_1.id
			})
		elseif var_234_1.type == ChapterConst.StgTypeConsume then
			arg_233_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_234_2,
				arg1 = arg_233_1.id
			})
		end

		arg_233_0:hideStrategyInfo()
	end

	local function var_233_1()
		arg_233_0:hideStrategyInfo()
	end

	arg_233_0.levelStrategyView:ActionInvoke("setCBFunc", var_233_0, var_233_1)
end

function var_0_0.hideStrategyInfo(arg_236_0)
	if arg_236_0.levelStrategyView then
		arg_236_0.levelStrategyView:Destroy()

		arg_236_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_237_0, arg_237_1)
	local var_237_0 = arg_237_0.contextData.chapterVO
	local var_237_1 = getProxy(ChapterProxy)
	local var_237_2
	local var_237_3
	local var_237_4
	local var_237_5
	local var_237_6 = var_237_1.repairTimes
	local var_237_7, var_237_8, var_237_9 = ChapterConst.GetRepairParams()

	arg_237_0.levelRepairView = LevelRepairView.New(arg_237_0.topPanel, arg_237_0.event, arg_237_0.contextData)

	arg_237_0.levelRepairView:Load()
	arg_237_0.levelRepairView:ActionInvoke("set", var_237_6, var_237_7, var_237_8, var_237_9)

	local function var_237_10()
		if var_237_7 - math.min(var_237_6, var_237_7) == 0 and arg_237_0.player:getTotalGem() < var_237_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_237_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_237_0.fleet.id,
			arg1 = arg_237_1.id
		})
		arg_237_0:hideRepairWindow()
	end

	local function var_237_11()
		arg_237_0:hideRepairWindow()
	end

	arg_237_0.levelRepairView:ActionInvoke("setCBFunc", var_237_10, var_237_11)
end

function var_0_0.hideRepairWindow(arg_240_0)
	if arg_240_0.levelRepairView then
		arg_240_0.levelRepairView:Destroy()

		arg_240_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_241_0, arg_241_1)
	arg_241_0.levelRemasterView:Load()

	local function var_241_0(arg_242_0)
		arg_241_0:ShowSelectedMap(arg_242_0)
	end

	arg_241_0.levelRemasterView:ActionInvoke("Show")
	arg_241_0.levelRemasterView:ActionInvoke("set", var_241_0, arg_241_1)
end

function var_0_0.hideRemasterPanel(arg_243_0)
	if arg_243_0.levelRemasterView:isShowing() then
		arg_243_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_244_0, arg_244_1)
	local var_244_0 = arg_244_0.contextData.chapterVO

	if not var_244_0 then
		return
	end

	arg_244_0:enableLevelCamera()
	setActive(arg_244_0.uiMain, true)

	arg_244_0.levelGrid.localEulerAngles = Vector3(var_244_0.theme.angle, 0, 0)
	arg_244_0.grid = LevelGrid.New(arg_244_0.dragLayer)

	arg_244_0.grid:attach(arg_244_0)
	arg_244_0.grid:ExtendItem("shipTpl", arg_244_0.shipTpl)
	arg_244_0.grid:ExtendItem("subTpl", arg_244_0.subTpl)
	arg_244_0.grid:ExtendItem("transportTpl", arg_244_0.transportTpl)
	arg_244_0.grid:ExtendItem("enemyTpl", arg_244_0.enemyTpl)
	arg_244_0.grid:ExtendItem("championTpl", arg_244_0.championTpl)
	arg_244_0.grid:ExtendItem("oniTpl", arg_244_0.oniTpl)
	arg_244_0.grid:ExtendItem("arrowTpl", arg_244_0.arrowTarget)
	arg_244_0.grid:ExtendItem("destinationMarkTpl", arg_244_0.destinationMarkTpl)

	function arg_244_0.grid.onShipStepChange(arg_245_0)
		arg_244_0.levelStageView:updateAmbushRate(arg_245_0)
	end

	arg_244_0.grid:initAll(arg_244_1)
end

function var_0_0.destroyGrid(arg_246_0)
	if arg_246_0.grid then
		arg_246_0.grid:detach()

		arg_246_0.grid = nil

		arg_246_0:disableLevelCamera()
		setActive(arg_246_0.dragLayer, true)
		setActive(arg_246_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_247_0, arg_247_1)
	arg_247_0:frozen()

	local function var_247_0()
		arg_247_0.radar:SetActive(true)

		local var_248_0 = tf(arg_247_0.radar)

		var_248_0:SetParent(arg_247_0.topPanel, false)
		var_248_0:SetSiblingIndex(1)
		var_248_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_249_0)
			arg_247_0.radar:SetActive(false)
			arg_247_0:unfrozen()
			arg_247_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_247_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_250_0)
			arg_250_0:SetActive(true)

			arg_247_0.radar = arg_250_0

			var_247_0()
		end)
	else
		var_247_0()
	end
end

function var_0_0.destroyTracking(arg_251_0)
	if arg_251_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_251_0.radar)

		arg_251_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_252_0, arg_252_1, arg_252_2, arg_252_3)
	local function var_252_0()
		arg_252_0.playing = true

		arg_252_0:frozen()
		arg_252_0.airStrike:SetActive(true)

		local var_253_0 = tf(arg_252_0.airStrike)

		var_253_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_253_0:SetAsLastSibling()
		setActive(var_253_0:Find("words/be_striked"), arg_252_1 == ChapterConst.SubjectChampion)
		setActive(var_253_0:Find("words/strike_enemy"), arg_252_1 == ChapterConst.SubjectPlayer)

		local function var_253_1()
			arg_252_0.playing = false

			SetActive(arg_252_0.airStrike, false)

			if arg_252_3 then
				arg_252_3()
			end

			arg_252_0:unfrozen()
		end

		var_253_0:GetComponent("DftAniEvent"):SetEndEvent(var_253_1)

		if arg_252_2 then
			onButton(arg_252_0, var_253_0, var_253_1, SFX_PANEL)
		else
			removeOnButton(var_253_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_252_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_255_0)
			arg_255_0:SetActive(true)

			arg_252_0.airStrike = arg_255_0

			var_252_0()
		end)
	else
		var_252_0()
	end
end

function var_0_0.destroyAirStrike(arg_256_0)
	if arg_256_0.airStrike then
		arg_256_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_256_0.airStrike)

		arg_256_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_257_0, arg_257_1, arg_257_2, arg_257_3)
	arg_257_0.uiAnims = arg_257_0.uiAnims or {}

	local var_257_0 = arg_257_0.uiAnims[arg_257_1]

	local function var_257_1()
		arg_257_0.playing = true

		arg_257_0:frozen()
		var_257_0:SetActive(true)

		local var_258_0 = tf(var_257_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_258_0)

		if arg_257_3 then
			arg_257_3(var_257_0)
		end

		var_258_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_259_0)
			arg_257_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_258_0, arg_257_0._tf)

			if arg_257_2 then
				arg_257_2(var_257_0)
			end

			arg_257_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_257_0 then
		PoolMgr.GetInstance():GetUI(arg_257_1, true, function(arg_260_0)
			arg_260_0:SetActive(true)

			arg_257_0.uiAnims[arg_257_1] = arg_260_0
			var_257_0 = arg_257_0.uiAnims[arg_257_1]

			var_257_1()
		end)
	else
		var_257_1()
	end
end

function var_0_0.destroyUIAnims(arg_261_0)
	if arg_261_0.uiAnims then
		for iter_261_0, iter_261_1 in pairs(arg_261_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_261_1), arg_261_0._tf)
			iter_261_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_261_0, iter_261_1)
		end

		arg_261_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_262_0, arg_262_1)
	local function var_262_0()
		arg_262_0.playing = true

		arg_262_0:frozen()
		arg_262_0.torpetoAni:SetActive(true)

		local var_263_0 = tf(arg_262_0.torpetoAni)

		var_263_0:SetParent(arg_262_0.topPanel, false)
		var_263_0:SetAsLastSibling()
		var_263_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_264_0)
			arg_262_0.playing = false

			SetActive(arg_262_0.torpetoAni, false)

			if arg_262_1 then
				arg_262_1()
			end

			arg_262_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_262_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_265_0)
			arg_265_0:SetActive(true)

			arg_262_0.torpetoAni = arg_265_0

			var_262_0()
		end)
	else
		var_262_0()
	end
end

function var_0_0.destroyTorpedo(arg_266_0)
	if arg_266_0.torpetoAni then
		arg_266_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_266_0.torpetoAni)

		arg_266_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_267_0, arg_267_1, arg_267_2, arg_267_3)
	arg_267_0.strikeAnims = arg_267_0.strikeAnims or {}

	local var_267_0
	local var_267_1
	local var_267_2

	local function var_267_3()
		if coroutine.status(var_267_2) == "suspended" then
			local var_268_0, var_268_1 = coroutine.resume(var_267_2)

			assert(var_268_0, debug.traceback(var_267_2, var_268_1))
		end
	end

	var_267_2 = coroutine.create(function()
		arg_267_0.playing = true

		arg_267_0:frozen()

		local var_269_0 = arg_267_0.strikeAnims[arg_267_2]

		setActive(var_269_0, true)

		local var_269_1 = tf(var_269_0)
		local var_269_2 = findTF(var_269_1, "torpedo")
		local var_269_3 = findTF(var_269_1, "mask/painting")
		local var_269_4 = findTF(var_269_1, "ship")

		setParent(var_267_0, var_269_3:Find("fitter"), false)
		var_267_1:SetParent(var_269_4)
		setActive(var_269_4, false)
		setActive(var_269_2, false)
		var_269_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_269_1:SetAsLastSibling()

		local var_269_5 = var_269_1:GetComponent("DftAniEvent")
		local var_269_6 = var_267_1:GetSkeletonGraphic()

		var_269_5:SetStartEvent(function(arg_270_0)
			var_267_1:SetAction("attack", 0)

			var_269_6.freeze = true
		end)
		var_269_5:SetTriggerEvent(function(arg_271_0)
			var_269_6.freeze = false

			var_267_1:SetActionCallBack(function(arg_272_0)
				if arg_272_0 == "action" then
					-- block empty
				elseif arg_272_0 == "finish" then
					var_269_6.freeze = true
				end
			end)
		end)
		var_269_5:SetEndEvent(function(arg_273_0)
			var_269_6.freeze = false

			var_267_3()
		end)
		onButton(arg_267_0, var_269_1, var_267_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_269_3, arg_267_1:getPainting())
		var_267_1:SetActionCallBack(nil)

		var_269_6.freeze = false

		var_267_1:Dispose()
		setActive(var_269_0, false)

		arg_267_0.playing = false

		arg_267_0:unfrozen()

		if arg_267_3 then
			arg_267_3()
		end
	end)

	local function var_267_4()
		if arg_267_0.strikeAnims[arg_267_2] and var_267_0 and var_267_1 then
			var_267_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_267_1:getPainting(), true, function(arg_275_0)
		var_267_0 = arg_275_0

		ShipExpressionHelper.SetExpression(var_267_0, arg_267_1:getPainting())
		var_267_4()
	end)

	var_267_1 = SpineAnimChar.New()

	var_267_1:SetPaint(arg_267_1:getPrefab())
	var_267_1:Load(true, function(arg_276_0)
		var_267_1:SetLocalScale(Vector3.one)
		var_267_4()
	end)

	if not arg_267_0.strikeAnims[arg_267_2] then
		PoolMgr.GetInstance():GetUI(arg_267_2, true, function(arg_277_0)
			arg_267_0.strikeAnims[arg_267_2] = arg_277_0

			var_267_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_278_0)
	if arg_278_0.strikeAnims then
		for iter_278_0, iter_278_1 in pairs(arg_278_0.strikeAnims) do
			iter_278_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_278_0, iter_278_1)
		end

		arg_278_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_279_0, arg_279_1, arg_279_2, arg_279_3)
	arg_279_0.strikeAnims = arg_279_0.strikeAnims or {}

	local var_279_0
	local var_279_1

	local function var_279_2()
		if coroutine.status(var_279_1) == "suspended" then
			local var_280_0, var_280_1 = coroutine.resume(var_279_1)

			assert(var_280_0, debug.traceback(var_279_1, var_280_1))
		end
	end

	var_279_1 = coroutine.create(function()
		arg_279_0.playing = true

		arg_279_0:frozen()

		local var_281_0 = arg_279_0.strikeAnims[arg_279_2]

		setActive(var_281_0, true)

		local var_281_1 = tf(var_281_0)
		local var_281_2 = findTF(var_281_1, "torpedo")
		local var_281_3 = findTF(var_281_1, "ship")

		var_279_0:SetParent(var_281_3)
		setActive(var_281_3, false)
		setActive(var_281_2, false)
		var_281_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_281_1:SetAsLastSibling()

		local var_281_4 = var_281_1:GetComponent("DftAniEvent")
		local var_281_5 = var_279_0:GetSkeletonGraphic()

		var_281_4:SetStartEvent(function(arg_282_0)
			var_279_0:SetAction("attack", 0)

			var_281_5.freeze = true
		end)
		var_281_4:SetTriggerEvent(function(arg_283_0)
			var_281_5.freeze = false

			var_279_0:SetActionCallBack(function(arg_284_0)
				if arg_284_0 == "action" then
					-- block empty
				elseif arg_284_0 == "finish" then
					var_281_5.freeze = true
				end
			end)
		end)
		var_281_4:SetEndEvent(function(arg_285_0)
			var_281_5.freeze = false

			var_279_2()
		end)
		onButton(arg_279_0, var_281_1, var_279_2, SFX_CANCEL)
		coroutine.yield()
		var_279_0:SetActionCallBack(nil)

		var_281_5.freeze = false

		var_279_0:Dispose()
		setActive(var_281_0, false)

		arg_279_0.playing = false

		arg_279_0:unfrozen()

		if arg_279_3 then
			arg_279_3()
		end
	end)

	local function var_279_3()
		if arg_279_0.strikeAnims[arg_279_2] and var_279_0 then
			var_279_2()
		end
	end

	var_279_0 = SpineAnimChar.New()

	var_279_0:SetPaint(arg_279_1:getPrefab())
	var_279_0:Load(true, function(arg_287_0)
		arg_287_0:SetLocalScale(Vector3.one)
		var_279_3()
	end)

	if not arg_279_0.strikeAnims[arg_279_2] then
		PoolMgr.GetInstance():GetUI(arg_279_2, true, function(arg_288_0)
			arg_279_0.strikeAnims[arg_279_2] = arg_288_0

			var_279_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_289_0, arg_289_1, arg_289_2)
	arg_289_0:frozen()
	setActive(arg_289_0.commanderTinkle, true)

	local var_289_0 = arg_289_1:getSkills()

	setText(arg_289_0.commanderTinkle:Find("name"), #var_289_0 > 0 and var_289_0[1]:getConfig("name") or "")
	setImageSprite(arg_289_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_289_1:getConfig("painting"), ""))

	local var_289_1 = arg_289_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_289_1.alpha = 0

	local var_289_2 = Vector2(248, 237)

	LeanTween.value(go(arg_289_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_290_0)
		local var_290_0 = arg_289_0.commanderTinkle.localPosition

		var_290_0.x = var_289_2.x + -100 * (1 - arg_290_0)
		arg_289_0.commanderTinkle.localPosition = var_290_0
		var_289_1.alpha = arg_290_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_289_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_291_0)
		local var_291_0 = arg_289_0.commanderTinkle.localPosition

		var_291_0.x = var_289_2.x + 100 * arg_291_0
		arg_289_0.commanderTinkle.localPosition = var_291_0
		var_289_1.alpha = 1 - arg_291_0
	end)):setOnComplete(System.Action(function()
		if arg_289_2 then
			arg_289_2()
		end

		arg_289_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_293_0, arg_293_1, arg_293_2, arg_293_3)
	local var_293_0 = arg_293_0.grid:shakeCell(arg_293_1)

	if not var_293_0 then
		arg_293_3()

		return
	end

	arg_293_0:easeDamage(var_293_0, arg_293_2, function()
		arg_293_3()
	end)
end

function var_0_0.easeDamage(arg_295_0, arg_295_1, arg_295_2, arg_295_3)
	arg_295_0:frozen()

	local var_295_0 = arg_295_0.levelCam:WorldToScreenPoint(arg_295_1.position)
	local var_295_1 = tf(arg_295_0:GetDamageText())

	var_295_1.position = arg_295_0.uiCam:ScreenToWorldPoint(var_295_0)

	local var_295_2 = var_295_1.localPosition

	var_295_2.y = var_295_2.y + 40
	var_295_2.z = 0

	setText(var_295_1, arg_295_2)

	var_295_1.localPosition = var_295_2

	LeanTween.value(go(var_295_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_296_0)
		local var_296_0 = var_295_1.localPosition

		var_296_0.y = var_295_2.y + 60 * arg_296_0
		var_295_1.localPosition = var_296_0

		setTextAlpha(var_295_1, 1 - arg_296_0)
	end)):setOnComplete(System.Action(function()
		arg_295_0:ReturnDamageText(var_295_1)
		arg_295_0:unfrozen()

		if arg_295_3 then
			arg_295_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_298_0, arg_298_1, arg_298_2)
	arg_298_0:frozen()

	local var_298_0 = arg_298_0.levelCam:WorldToScreenPoint(arg_298_1)

	arg_298_0.avoidText.position = arg_298_0.uiCam:ScreenToWorldPoint(var_298_0)

	local var_298_1 = arg_298_0.avoidText.localPosition

	var_298_1.z = 0
	arg_298_0.avoidText.localPosition = var_298_1

	setActive(arg_298_0.avoidText, true)

	local var_298_2 = arg_298_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_298_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_299_0)
		local var_299_0 = arg_298_0.avoidText.localPosition

		var_299_0.y = var_298_1.y + 100 * arg_299_0
		arg_298_0.avoidText.localPosition = var_299_0

		setImageAlpha(arg_298_0.avoidText, 1 - arg_299_0)
		setImageAlpha(var_298_2, 1 - arg_299_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_298_0.avoidText, false)
		arg_298_0:unfrozen()

		if arg_298_2 then
			arg_298_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_301_0)
	local var_301_0 = table.remove(arg_301_0.damageTextPool)

	if not var_301_0 then
		var_301_0 = Instantiate(arg_301_0.damageTextTemplate)

		local var_301_1 = tf(arg_301_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_301_0, tf(arg_301_0.damageTextTemplate).parent)
		tf(var_301_0):SetSiblingIndex(var_301_1 + 1)
	end

	table.insert(arg_301_0.damageTextActive, var_301_0)
	setActive(var_301_0, true)

	return var_301_0
end

function var_0_0.ReturnDamageText(arg_302_0, arg_302_1)
	assert(arg_302_1)

	if not arg_302_1 then
		return
	end

	arg_302_1 = go(arg_302_1)

	table.removebyvalue(arg_302_0.damageTextActive, arg_302_1)
	table.insert(arg_302_0.damageTextPool, arg_302_1)
	setActive(arg_302_1, false)
end

function var_0_0.resetLevelGrid(arg_303_0)
	arg_303_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_304_0, arg_304_1)
	setActive(arg_304_0.curtain, arg_304_1)
end

function var_0_0.frozen(arg_305_0)
	local var_305_0 = arg_305_0.frozenCount

	arg_305_0.frozenCount = arg_305_0.frozenCount + 1
	arg_305_0.canvasGroup.blocksRaycasts = arg_305_0.frozenCount == 0

	if var_305_0 == 0 and arg_305_0.frozenCount ~= 0 then
		arg_305_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_306_0, arg_306_1)
	if arg_306_0.exited then
		return
	end

	local var_306_0 = arg_306_0.frozenCount
	local var_306_1 = arg_306_1 == -1 and arg_306_0.frozenCount or arg_306_1 or 1

	arg_306_0.frozenCount = arg_306_0.frozenCount - var_306_1
	arg_306_0.canvasGroup.blocksRaycasts = arg_306_0.frozenCount == 0

	if var_306_0 ~= 0 and arg_306_0.frozenCount == 0 then
		arg_306_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_307_0)
	return arg_307_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_308_0)
	arg_308_0.levelCamIndices = math.max(arg_308_0.levelCamIndices - 1, 0)

	if arg_308_0.levelCamIndices == 0 then
		arg_308_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.disableLevelCamera(arg_309_0)
	arg_309_0.levelCamIndices = arg_309_0.levelCamIndices + 1

	if arg_309_0.levelCamIndices > 0 then
		arg_309_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():CreateRefreshHandler()
	end
end

function var_0_0.RecordTween(arg_310_0, arg_310_1, arg_310_2)
	arg_310_0.tweens[arg_310_1] = arg_310_2
end

function var_0_0.DeleteTween(arg_311_0, arg_311_1)
	local var_311_0 = arg_311_0.tweens[arg_311_1]

	if var_311_0 then
		LeanTween.cancel(var_311_0)

		arg_311_0.tweens[arg_311_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_312_0, arg_312_1, arg_312_2, arg_312_3)
	local var_312_0 = arg_312_2.id

	arg_312_0.levelCMDFormationView:setCallback(function(arg_313_0)
		if not arg_312_3 then
			if arg_313_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_312_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_313_0.skill)
			elseif arg_313_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_312_0.contextData.commanderSelected = {
					chapterId = var_312_0,
					fleetId = arg_312_1.id
				}

				arg_312_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_313_0.pos, arg_312_1.id, arg_312_2)
				arg_312_0:closeCommanderPanel()
			else
				arg_312_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_313_0,
					fleetId = arg_312_1.id,
					chapterId = var_312_0
				}, arg_312_2)
			end
		elseif arg_313_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_312_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_313_0.skill)
		elseif arg_313_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_312_0.contextData.eliteCommanderSelected = {
				index = arg_312_3,
				pos = arg_313_0.pos,
				chapterId = var_312_0
			}

			arg_312_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_312_3, arg_313_0.pos, arg_312_2)
			arg_312_0:closeCommanderPanel()
		else
			arg_312_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_313_0,
				index = arg_312_3,
				chapterId = var_312_0
			}, arg_312_2)
		end
	end)
	arg_312_0.levelCMDFormationView:Load()
	arg_312_0.levelCMDFormationView:ActionInvoke("update", arg_312_1, arg_312_0.commanderPrefabs)
	arg_312_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_314_0)
	if arg_314_0.levelCMDFormationView:isShowing() then
		arg_314_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_314_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_315_0)
	arg_315_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_316_0)
	arg_316_0.levelCMDFormationView:Destroy()

	arg_316_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_317_0, arg_317_1)
	arg_317_0.spTickets = arg_317_1
end

function var_0_0.HandleShowMsgBox(arg_318_0, arg_318_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_318_1)
end

function var_0_0.updatePoisonAreaTip(arg_319_0)
	local var_319_0 = arg_319_0.contextData.chapterVO
	local var_319_1 = (function(arg_320_0)
		local var_320_0 = {}
		local var_320_1 = pg.map_event_list[var_319_0.id] or {}
		local var_320_2

		if var_319_0:isLoop() then
			var_320_2 = var_320_1.event_list_loop or {}
		else
			var_320_2 = var_320_1.event_list or {}
		end

		for iter_320_0, iter_320_1 in ipairs(var_320_2) do
			local var_320_3 = pg.map_event_template[iter_320_1]

			if var_320_3.c_type == arg_320_0 then
				table.insert(var_320_0, var_320_3)
			end
		end

		return var_320_0
	end)(ChapterConst.EvtType_Poison)

	if var_319_1 then
		for iter_319_0, iter_319_1 in ipairs(var_319_1) do
			local var_319_2 = iter_319_1.round_gametip

			if var_319_2 ~= nil and var_319_2 ~= "" and var_319_0:getRoundNum() == var_319_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_319_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_321_0)
	setActive(arg_321_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_322_0)
	local var_322_0 = getProxy(ChapterProxy)

	if var_322_0 and not arg_322_0.contextData.noRecord then
		local var_322_1 = arg_322_0.contextData.map

		if not var_322_1 then
			return
		end

		if var_322_1:NeedRecordMap() then
			var_322_0:recordLastMap(ChapterProxy.LAST_MAP, var_322_1.id)
		end

		if var_322_1:isActivity() and not var_322_1:isActExtra() then
			var_322_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, var_322_1.id)
		end
	end
end

function var_0_0.IsActShopActive(arg_323_0)
	local var_323_0 = arg_323_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_323_0.contextData.map:getConfig("on_activity")) or nil
	local var_323_1 = var_323_0 and not var_323_0:isEnd() and var_323_0:GetConfigClientSetting("PTID")
	local var_323_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_323_2 and not var_323_2:isEnd() and var_323_2:getConfig("config_client").resId == var_323_1 then
		return true
	end

	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_324_0)
		return not arg_324_0:isEnd() and arg_324_0:getConfig("config_client").pt_id == var_323_1
	end) then
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
