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
		showType = PlayerResUI.TYPE_ALL,
		groupName = LayerWeightConst.GROUP_LEVELUI
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

		if var_6_0 and #var_6_0 > 0 then
			for iter_6_0, iter_6_1 in ipairs(var_6_0) do
				local var_6_1 = _.rest(iter_6_1[2], 2)

				for iter_6_2, iter_6_3 in ipairs(var_6_1) do
					if string.find(iter_6_3, "^bgm_") and iter_6_1[1] == var_0_3 then
						local var_6_2 = iter_6_1[2][1]
						local var_6_3 = false

						for iter_6_4, iter_6_5 in ipairs(var_6_2) do
							local var_6_4 = chapterProxy:GetChapterItemById(iter_6_5)

							if var_6_4 and var_6_4:isClear() then
								var_6_3 = true

								break
							end
						end

						if not var_6_3 then
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
	arg_12_0.topPanel = arg_12_0:findTF("top")
	arg_12_0.canvasGroup = arg_12_0.topPanel:GetComponent("CanvasGroup")
	arg_12_0.canvasGroup.blocksRaycasts = not arg_12_0.canvasGroup.blocksRaycasts
	arg_12_0.canvasGroup.blocksRaycasts = not arg_12_0.canvasGroup.blocksRaycasts
	arg_12_0.entranceLayer = arg_12_0:findTF("entrance")
	arg_12_0.ptBonus = EventPtBonus.New(arg_12_0.entranceLayer:Find("btns/btn_task/bonusPt"))
	arg_12_0.entranceBg = arg_12_0:findTF("entrance_bg")
	arg_12_0.topChapter = arg_12_0:findTF("top_chapter", arg_12_0.topPanel)

	setActive(arg_12_0.topChapter:Find("title_chapter"), false)
	setActive(arg_12_0.topChapter:Find("type_chapter"), false)
	setActive(arg_12_0.topChapter:Find("type_escort"), false)
	setActive(arg_12_0.topChapter:Find("type_skirmish"), false)

	arg_12_0.chapterName = arg_12_0:findTF("title_chapter/name", arg_12_0.topChapter)
	arg_12_0.chapterNoTitle = arg_12_0:findTF("title_chapter/chapter", arg_12_0.topChapter)
	arg_12_0.resChapter = arg_12_0:findTF("resources", arg_12_0.topChapter)

	setActive(arg_12_0.topChapter, true)

	arg_12_0._voteBookBtn = arg_12_0.topChapter:Find("vote_book")
	arg_12_0.leftChapter = arg_12_0:findTF("main/left_chapter")

	setActive(arg_12_0.leftChapter, true)

	arg_12_0.leftCanvasGroup = arg_12_0.leftChapter:GetComponent(typeof(CanvasGroup))
	arg_12_0.btnPrev = arg_12_0:findTF("btn_prev", arg_12_0.leftChapter)
	arg_12_0.btnPrevCol = arg_12_0:findTF("btn_prev/prev_image", arg_12_0.leftChapter)
	arg_12_0.eliteBtn = arg_12_0:findTF("buttons/btn_elite", arg_12_0.leftChapter)
	arg_12_0.normalBtn = arg_12_0:findTF("buttons/btn_normal", arg_12_0.leftChapter)
	arg_12_0.actNormalBtn = arg_12_0:findTF("buttons/btn_act_normal", arg_12_0.leftChapter)
	arg_12_0.actEliteBtn = arg_12_0:findTF("buttons/btn_act_elite", arg_12_0.leftChapter)
	arg_12_0.actExtraBtn = arg_12_0:findTF("buttons/btn_act_extra", arg_12_0.leftChapter)
	arg_12_0.actExtraBtnAnim = arg_12_0:findTF("usm", arg_12_0.actExtraBtn)
	arg_12_0.remasterBtn = arg_12_0:findTF("buttons/btn_remaster", arg_12_0.leftChapter)
	arg_12_0.escortBar = arg_12_0:findTF("escort_bar", arg_12_0.leftChapter)
	arg_12_0.eliteQuota = arg_12_0:findTF("elite_quota", arg_12_0.leftChapter)
	arg_12_0.skirmishBar = arg_12_0:findTF("left_times", arg_12_0.leftChapter)
	arg_12_0.mainLayer = arg_12_0:findTF("main")

	setActive(arg_12_0.mainLayer:Find("title_chapter_lines"), false)

	arg_12_0.rightChapter = arg_12_0:findTF("main/right_chapter")
	arg_12_0.rightCanvasGroup = arg_12_0.rightChapter:GetComponent(typeof(CanvasGroup))
	arg_12_0.eventContainer = arg_12_0:findTF("event_btns/event_container", arg_12_0.rightChapter)
	arg_12_0.btnSpecial = arg_12_0:findTF("btn_task", arg_12_0.eventContainer)
	arg_12_0.challengeBtn = arg_12_0:findTF("btn_challenge", arg_12_0.eventContainer)
	arg_12_0.dailyBtn = arg_12_0:findTF("btn_daily", arg_12_0.eventContainer)
	arg_12_0.militaryExerciseBtn = arg_12_0:findTF("btn_pvp", arg_12_0.eventContainer)
	arg_12_0.activityBtn = arg_12_0:findTF("event_btns/activity_btn", arg_12_0.rightChapter)
	arg_12_0.ptTotal = arg_12_0:findTF("event_btns/pt_text", arg_12_0.rightChapter)
	arg_12_0.ticketTxt = arg_12_0:findTF("event_btns/tickets/Text", arg_12_0.rightChapter)
	arg_12_0.remasterAwardBtn = arg_12_0:findTF("btn_remaster_award", arg_12_0.rightChapter)
	arg_12_0.btnNext = arg_12_0:findTF("btn_next", arg_12_0.rightChapter)
	arg_12_0.btnNextCol = arg_12_0:findTF("btn_next/next_image", arg_12_0.rightChapter)
	arg_12_0.countDown = arg_12_0:findTF("event_btns/count_down", arg_12_0.rightChapter)

	setActive(arg_12_0:findTF("event_btns/BottomList", arg_12_0.rightChapter), true)

	arg_12_0.actExchangeShopBtn = arg_12_0:findTF("event_btns/BottomList/btn_exchange", arg_12_0.rightChapter)
	arg_12_0.actAtelierBuffBtn = arg_12_0:findTF("event_btns/BottomList/btn_control_center", arg_12_0.rightChapter)
	arg_12_0.actAtelierYumiaBuffBtn = arg_12_0.rightChapter:Find("event_btns/BottomList/btn_yumia_buff")
	arg_12_0.actExtraRank = arg_12_0:findTF("event_btns/BottomList/act_extra_rank", arg_12_0.rightChapter)

	setActive(arg_12_0.rightChapter, true)

	arg_12_0.damageTextTemplate = go(arg_12_0:findTF("damage", arg_12_0.topPanel))

	setActive(arg_12_0.damageTextTemplate, false)

	arg_12_0.damageTextPool = {
		arg_12_0.damageTextTemplate
	}
	arg_12_0.damageTextActive = {}
	arg_12_0.mapHelpBtn = arg_12_0:findTF("help_button", arg_12_0.topPanel)
	arg_12_0.avoidText = arg_12_0:findTF("text_avoid", arg_12_0.topPanel)
	arg_12_0.commanderTinkle = arg_12_0:findTF("neko_tinkle", arg_12_0.topPanel)

	setActive(arg_12_0.commanderTinkle, false)

	arg_12_0.spResult = arg_12_0:findTF("sp_result", arg_12_0.topPanel)

	setActive(arg_12_0.spResult, false)

	arg_12_0.helpPage = arg_12_0:findTF("help_page", arg_12_0.topPanel)
	arg_12_0.helpImage = arg_12_0:findTF("icon", arg_12_0.helpPage)

	setActive(arg_12_0.helpPage, false)

	arg_12_0.curtain = arg_12_0:findTF("curtain", arg_12_0.topPanel)

	setActive(arg_12_0.curtain, false)

	arg_12_0.map = arg_12_0:findTF("maps")
	arg_12_0.mapTFs = {
		arg_12_0:findTF("maps/map1"),
		arg_12_0:findTF("maps/map2")
	}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.mapTFs) do
		iter_12_1:GetComponent(typeof(Image)).enabled = false
	end

	arg_12_0.UIFXList = arg_12_0:findTF("maps/UI_FX_list")

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
	arg_12_0.float = arg_12_0:findTF("float")
	arg_12_0.clouds = arg_12_0:findTF("clouds", arg_12_0.float)

	setActive(arg_12_0.clouds, true)
	setActive(arg_12_0.float:Find("levels"), false)

	arg_12_0.resources = arg_12_0:findTF("resources"):GetComponent("ItemList")
	arg_12_0.arrowTarget = arg_12_0.resources.prefabItem[0]
	arg_12_0.destinationMarkTpl = arg_12_0.resources.prefabItem[1]
	arg_12_0.championTpl = arg_12_0.resources.prefabItem[3]
	arg_12_0.deadTpl = arg_12_0.resources.prefabItem[4]
	arg_12_0.enemyTpl = Instantiate(arg_12_0.resources.prefabItem[5])
	arg_12_0.oniTpl = arg_12_0.resources.prefabItem[6]
	arg_12_0.shipTpl = arg_12_0.resources.prefabItem[8]
	arg_12_0.subTpl = arg_12_0.resources.prefabItem[9]
	arg_12_0.transportTpl = arg_12_0.resources.prefabItem[11]

	setText(arg_12_0:findTF("fighting/Text", arg_12_0.enemyTpl), i18n("ui_word_levelui2_inevent"))
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

	arg_12_0:buildCommanderPanel()

	arg_12_0.levelRemasterView = LevelRemasterView.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)

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

function var_0_0.addbubbleMsgBox(arg_29_0, arg_29_1)
	table.insert(arg_29_0.bubbleMsgBoxes, arg_29_1)

	if #arg_29_0.bubbleMsgBoxes > 1 then
		return
	end

	local var_29_0

	local function var_29_1()
		local var_30_0 = arg_29_0.bubbleMsgBoxes[1]

		if var_30_0 then
			var_30_0(function()
				table.remove(arg_29_0.bubbleMsgBoxes, 1)
				var_29_1()
			end)
		end
	end

	var_29_1()
end

function var_0_0.CleanBubbleMsgbox(arg_32_0)
	table.clean(arg_32_0.bubbleMsgBoxes)
end

function var_0_0.updatePtActivity(arg_33_0, arg_33_1)
	arg_33_0.ptActivity = arg_33_1

	if not arg_33_0.ptActivity then
		return
	end

	arg_33_0:updateActivityRes()
end

function var_0_0.updateActivityRes(arg_34_0)
	local var_34_0 = findTF(arg_34_0.ptTotal, "Text")
	local var_34_1 = findTF(arg_34_0.ptTotal, "icon/Image")

	if var_34_0 and var_34_1 and arg_34_0.ptActivity then
		setText(var_34_0, "x" .. arg_34_0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = tonumber(arg_34_0.ptActivity:getConfig("config_id"))
		}):getIcon(), "", var_34_1, true)
	end
end

function var_0_0.setCommanderPrefabs(arg_35_0, arg_35_1)
	arg_35_0.commanderPrefabs = arg_35_1
end

function var_0_0.didEnter(arg_36_0)
	arg_36_0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "CommanderCatMediator")

	onButton(arg_36_0, arg_36_0:findTF("back_button", arg_36_0.topChapter), function()
		if arg_36_0:isfrozen() then
			return
		end

		local var_37_0 = arg_36_0.contextData.map

		if var_37_0 and (var_37_0:isActivity() or var_37_0:isEscort()) then
			arg_36_0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		elseif var_37_0 and var_37_0:isSkirmish() then
			arg_36_0:emit(var_0_0.ON_BACK)
		elseif not arg_36_0.contextData.entranceStatus then
			arg_36_0:ShowEntranceUI(true)
		else
			arg_36_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_36_0, arg_36_0.btnSpecial, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.dailyBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_36_0:updatDailyBtnTip()
		arg_36_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.challengeBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		local var_40_0, var_40_1 = arg_36_0:checkChallengeOpen()

		if var_40_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_40_1)
		else
			arg_36_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.militaryExerciseBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.normalBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:setMap(arg_36_0.contextData.map:getBindMapId())
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.eliteBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		if arg_36_0.contextData.map:getBindMapId() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			local var_43_0 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			if var_43_0 then
				arg_36_0:setMap(var_43_0.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif arg_36_0.contextData.map:isEliteEnabled() then
			arg_36_0:setMap(arg_36_0.contextData.map:getBindMapId())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(arg_36_0, arg_36_0.remasterBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_36_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("enters/enter_main"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:ShowSelectedMap(arg_36_0:GetInitializeMap())
	end, SFX_PANEL)
	setText(arg_36_0.entranceLayer:Find("enters/enter_main/Text"), getProxy(ChapterProxy):getLastUnlockMap():getLastUnlockChapterName())
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("enters/enter_world/enter"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ENTER_WORLD)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("enters/enter_ready/activity"), function()
		if arg_36_0:isfrozen() then
			return
		end

		switch(arg_36_0.entranceActivity:getConfig("type"), {
			[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function()
				arg_36_0:emit(LevelMediator2.ON_ACTIVITY_MAP, arg_36_0.entranceActivity.id)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
				arg_36_0:emit(LevelMediator2.ON_OPEN_ACT_BOSS_BATTLE)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
				arg_36_0:emit(LevelMediator2.ON_BOSSRUSH_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
				arg_36_0:emit(LevelMediator2.ON_BOSSSINGLE_MAP, {
					mode = OtherworldMapScene.MODE_BATTLE
				})
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
				arg_36_0:emit(LevelMediator2.ON_CLUE_MAP)
			end
		})
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_remaster"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_36_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_remaster"), OPEN_REMASTER)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_challenge"), function()
		if arg_36_0:isfrozen() then
			return
		end

		local var_54_0, var_54_1 = arg_36_0:checkChallengeOpen()

		if var_54_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_54_1)
		else
			arg_36_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_pvp"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_daily"), function()
		if arg_36_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_36_0:updatDailyBtnTip()
		arg_36_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_task"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	setActive(arg_36_0.entranceLayer:Find("enters/enter_world/enter"), not WORLD_ENTER_LOCK)
	setActive(arg_36_0.entranceLayer:Find("enters/enter_world/nothing"), WORLD_ENTER_LOCK)

	arg_36_0.entranceActivity = getProxy(ActivityProxy):getEnterReadyActivity()[1]

	setActive(arg_36_0.entranceLayer:Find("enters/enter_ready/nothing"), not tobool(arg_36_0.entranceActivity))
	setActive(arg_36_0.entranceLayer:Find("enters/enter_ready/activity"), tobool(arg_36_0.entranceActivity))

	if tobool(arg_36_0.entranceActivity) then
		local var_36_0 = arg_36_0.entranceActivity:getConfig("config_client").entrance_bg

		if var_36_0 then
			GetImageSpriteFromAtlasAsync(var_36_0, "", arg_36_0.entranceLayer:Find("enters/enter_ready/activity"), true)
		end
	end

	arg_36_0:updateRightPanel()

	local var_36_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "EventMediator")

	setActive(arg_36_0.btnSpecial:Find("lock"), not var_36_1)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_task/lock"), not var_36_1)

	local var_36_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "DailyLevelMediator")

	setActive(arg_36_0.dailyBtn:Find("lock"), not var_36_2)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_daily/lock"), not var_36_2)

	local var_36_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "MilitaryExerciseMediator")

	setActive(arg_36_0.militaryExerciseBtn:Find("lock"), not var_36_3)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_pvp/lock"), not var_36_3)

	local var_36_4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "WorldMediator")

	setActive(arg_36_0.entranceLayer:Find("enters/enter_world/enter/lock"), not var_36_4)

	local var_36_5 = LimitChallengeConst.IsOpen()

	setActive(arg_36_0.challengeBtn:Find("lock"), not var_36_5)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_challenge/lock"), not var_36_5)

	local var_36_6 = LimitChallengeConst.IsInAct()

	setActive(arg_36_0.challengeBtn, var_36_6)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_challenge"), var_36_6)

	local var_36_7 = LimitChallengeConst.IsShowRedPoint()

	setActive(arg_36_0.entranceLayer:Find("btns/btn_challenge/tip"), var_36_7)
	arg_36_0:initMapBtn(arg_36_0.btnPrev, -1)
	arg_36_0:initMapBtn(arg_36_0.btnNext, 1)
	arg_36_0:registerActBtn()

	if arg_36_0.contextData.editEliteChapter then
		local var_36_8 = getProxy(ChapterProxy):getChapterById(arg_36_0.contextData.editEliteChapter)

		arg_36_0:displayFleetEdit(var_36_8)

		arg_36_0.contextData.editEliteChapter = nil
	elseif arg_36_0.contextData.selectedChapterVO then
		arg_36_0:displayFleetSelect(arg_36_0.contextData.selectedChapterVO)

		arg_36_0.contextData.selectedChapterVO = nil
	end

	local var_36_9 = arg_36_0.contextData.chapterVO

	if not var_36_9 or not var_36_9.active then
		arg_36_0:tryPlaySubGuide()
	end

	arg_36_0:updateRemasterBtnTip()
	arg_36_0:updatDailyBtnTip()

	if arg_36_0.contextData.open_remaster then
		arg_36_0:displayRemasterPanel(arg_36_0.contextData.isSP)

		arg_36_0.contextData.open_remaster = nil
	end

	arg_36_0:ShowEntranceUI(arg_36_0.contextData.entranceStatus)

	if not arg_36_0.contextData.entranceStatus then
		arg_36_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_36_0:GetInitializeMap())
	end

	arg_36_0:emit(LevelMediator2.ON_DIDENTER)
end

function var_0_0.updateRightPanel(arg_58_0)
	arg_58_0.rightActivityBtns = defaultValue(arg_58_0.rightActivityBtns, {
		LevelSecondMapBtn.New(arg_58_0.actBtnTpl, arg_58_0.event, false)
	})

	local var_58_0 = {}
	local var_58_1 = {}

	for iter_58_0, iter_58_1 in ipairs(arg_58_0.rightActivityBtns) do
		if iter_58_1:InShowTime() then
			table.insert(var_58_0, iter_58_1)
		else
			table.insert(var_58_1, iter_58_1)
		end
	end

	table.sort(var_58_0, CompareFuncs({
		function(arg_59_0)
			return arg_59_0.config.group_id
		end
	}))

	for iter_58_2, iter_58_3 in ipairs(var_58_0) do
		iter_58_3:Init(iter_58_2)
	end

	for iter_58_4, iter_58_5 in ipairs(var_58_1) do
		iter_58_5:Clear()
	end
end

function var_0_0.checkChallengeOpen(arg_60_0)
	local var_60_0 = getProxy(PlayerProxy):getRawData().level

	return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_60_0, "ChallengeMainMediator")
end

function var_0_0.tryPlaySubGuide(arg_61_0)
	if arg_61_0.contextData.map and arg_61_0.contextData.map:isSkirmish() then
		return
	end

	pg.SystemGuideMgr.GetInstance():Play(arg_61_0)
end

function var_0_0.onBackPressed(arg_62_0)
	if arg_62_0:isfrozen() then
		return
	end

	if arg_62_0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_62_0.levelInfoView:isShowing() then
		arg_62_0:hideChapterPanel()

		return
	end

	if arg_62_0.levelInfoSPView and arg_62_0.levelInfoSPView:isShowing() then
		arg_62_0:HideLevelInfoSPPanel()

		return
	end

	if arg_62_0.levelFleetView:isShowing() then
		arg_62_0:hideFleetEdit()

		return
	end

	if arg_62_0.levelStrategyView then
		arg_62_0:hideStrategyInfo()

		return
	end

	if arg_62_0.levelRepairView then
		arg_62_0:hideRepairWindow()

		return
	end

	if arg_62_0.levelRemasterView:isShowing() then
		arg_62_0:hideRemasterPanel()

		return
	end

	if arg_62_0.contextData.map and arg_62_0.contextData.map:getConfig("ui_type") == MapBuilder.TYPEEXSP and arg_62_0.mapBuilder.personalPage:IsActive() then
		arg_62_0.mapBuilder.personalPage:Hide()

		return
	end

	if isActive(arg_62_0.helpPage) then
		setActive(arg_62_0.helpPage, false)

		return
	end

	local var_62_0 = arg_62_0.contextData.chapterVO
	local var_62_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_62_0 and var_62_1 then
		arg_62_0:switchToMap()

		return
	end

	triggerButton(arg_62_0:findTF("back_button", arg_62_0.topChapter))
end

function var_0_0.ShowEntranceUI(arg_63_0, arg_63_1)
	setActive(arg_63_0.entranceLayer, arg_63_1)
	setActive(arg_63_0.entranceBg, arg_63_1)
	setActive(arg_63_0.map, not arg_63_1)
	setActive(arg_63_0.float, not arg_63_1)
	setActive(arg_63_0.mainLayer, not arg_63_1)
	setActive(arg_63_0.topChapter:Find("type_entrance"), arg_63_1)

	arg_63_0.contextData.entranceStatus = tobool(arg_63_1)

	if arg_63_1 then
		setActive(arg_63_0.topChapter:Find("title_chapter"), false)
		setActive(arg_63_0.topChapter:Find("type_chapter"), false)
		setActive(arg_63_0.topChapter:Find("type_escort"), false)
		setActive(arg_63_0.topChapter:Find("type_skirmish"), false)

		if arg_63_0.newChapterCDTimer then
			arg_63_0.newChapterCDTimer:Stop()

			arg_63_0.newChapterCDTimer = nil
		end

		arg_63_0:RecordLastMapOnExit()

		arg_63_0.contextData.mapIdx = nil
		arg_63_0.contextData.map = nil
	end

	arg_63_0:PlayBGM()
end

function var_0_0.PreloadLevelMainUI(arg_64_0, arg_64_1, arg_64_2)
	if arg_64_0.preloadLevelDone then
		existCall(arg_64_2)

		return
	end

	local var_64_0

	local function var_64_1()
		if not arg_64_0.exited then
			arg_64_0.preloadLevelDone = true

			existCall(arg_64_2)
		end
	end

	local var_64_2 = getProxy(ChapterProxy):getMapById(arg_64_1)
	local var_64_3 = arg_64_0:GetMapBG(var_64_2)

	table.ParallelIpairsAsync(var_64_3, function(arg_66_0, arg_66_1, arg_66_2)
		GetSpriteFromAtlasAsync("levelmap/" .. arg_66_1.BG, "", arg_66_2)
	end, var_64_1)
end

function var_0_0.setShips(arg_67_0, arg_67_1)
	arg_67_0.shipVOs = arg_67_1
end

function var_0_0.updateRes(arg_68_0, arg_68_1)
	if arg_68_0.levelStageView then
		arg_68_0.levelStageView:ActionInvoke("SetPlayer", arg_68_1)
	end

	arg_68_0.player = arg_68_1
end

function var_0_0.setEliteQuota(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = arg_69_2 - arg_69_1
	local var_69_1 = arg_69_0:findTF("bg/Text", arg_69_0.eliteQuota):GetComponent(typeof(Text))

	if arg_69_1 == arg_69_2 then
		var_69_1.color = Color.red
	else
		var_69_1.color = Color.New(0.47, 0.89, 0.27)
	end

	var_69_1.text = var_69_0 .. "/" .. arg_69_2
end

function var_0_0.updateEvent(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_1:hasFinishState()

	setActive(arg_70_0.btnSpecial:Find("tip"), var_70_0)
	setActive(arg_70_0.entranceLayer:Find("btns/btn_task/tip"), var_70_0)
end

function var_0_0.updateFleet(arg_71_0, arg_71_1)
	arg_71_0.fleets = arg_71_1
end

function var_0_0.updateChapterVO(arg_72_0, arg_72_1, arg_72_2)
	if arg_72_0.contextData.chapterVO and arg_72_0.contextData.chapterVO.id == arg_72_1.id and arg_72_1.active then
		arg_72_0:setChapter(arg_72_1)
	end

	if arg_72_0.contextData.chapterVO and arg_72_0.contextData.chapterVO.id == arg_72_1.id and arg_72_1.active and arg_72_0.levelStageView and arg_72_0.grid then
		local var_72_0 = false
		local var_72_1 = false
		local var_72_2 = false

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyFleet) > 0 then
			arg_72_0.levelStageView:updateStageFleet()
			arg_72_0.levelStageView:updateAmbushRate(arg_72_1.fleet.line, true)

			var_72_2 = true

			if arg_72_0.grid then
				arg_72_0.grid:RefreshFleetCells()
				arg_72_0.grid:UpdateFloor()

				var_72_0 = true
			end
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyChampion) > 0 then
			var_72_2 = true

			if arg_72_0.grid then
				arg_72_0.grid:UpdateFleets()
				arg_72_0.grid:clearChampions()
				arg_72_0.grid:initChampions()

				var_72_1 = true
			end
		elseif bit.band(arg_72_2, ChapterConst.DirtyChampionPosition) > 0 then
			var_72_2 = true

			if arg_72_0.grid then
				arg_72_0.grid:UpdateFleets()
				arg_72_0.grid:updateChampions()

				var_72_1 = true
			end
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyAchieve) > 0 then
			arg_72_0.levelStageView:updateStageAchieve()
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyAttachment) > 0 then
			arg_72_0.levelStageView:updateAmbushRate(arg_72_1.fleet.line, true)

			if arg_72_0.grid then
				if not (arg_72_2 < 0) and not (bit.band(arg_72_2, ChapterConst.DirtyFleet) > 0) then
					arg_72_0.grid:updateFleet(arg_72_1.fleets[arg_72_1.findex].id)
				end

				arg_72_0.grid:updateAttachments()

				if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyAutoAction) > 0 then
					arg_72_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					var_72_0 = true
				end
			end
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyStrategy) > 0 then
			arg_72_0.levelStageView:updateStageStrategy()

			var_72_2 = true

			arg_72_0.levelStageView:updateStageBarrier()
			arg_72_0.levelStageView:UpdateAutoFightPanel()
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyAutoAction) > 0 then
			-- block empty
		elseif var_72_0 then
			arg_72_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif var_72_1 then
			arg_72_0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyCellFlag) > 0 then
			arg_72_0.grid:UpdateFloor()
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyBase) > 0 then
			arg_72_0.levelStageView:UpdateDefenseStatus()
		end

		if arg_72_2 < 0 or bit.band(arg_72_2, ChapterConst.DirtyFloatItems) > 0 then
			arg_72_0.grid:UpdateItemCells()
		end

		if var_72_2 then
			arg_72_0.levelStageView:updateFleetBuff()
		end
	end
end

function var_0_0.updateClouds(arg_73_0)
	arg_73_0.cloudRTFs = {}
	arg_73_0.cloudRects = {}
	arg_73_0.cloudTimer = {}

	for iter_73_0 = 1, 6 do
		local var_73_0 = arg_73_0:findTF("cloud_" .. iter_73_0, arg_73_0.clouds)
		local var_73_1 = rtf(var_73_0)

		table.insert(arg_73_0.cloudRTFs, var_73_1)
		table.insert(arg_73_0.cloudRects, var_73_1.rect.width)
	end

	arg_73_0:initCloudsPos()

	for iter_73_1, iter_73_2 in ipairs(arg_73_0.cloudRTFs) do
		local var_73_2 = arg_73_0.cloudRects[iter_73_1]
		local var_73_3 = arg_73_0.initPositions[iter_73_1] or Vector2(0, 0)
		local var_73_4 = 30 - var_73_3.y / 20
		local var_73_5 = (arg_73_0.mapWidth + var_73_2) / var_73_4
		local var_73_6

		var_73_6 = LeanTween.moveX(iter_73_2, arg_73_0.mapWidth, var_73_5):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function()
			var_73_2 = arg_73_0.cloudRects[iter_73_1]
			iter_73_2.anchoredPosition = Vector2(-var_73_2, var_73_3.y)

			var_73_6:setFrom(-var_73_2):setTime((arg_73_0.mapWidth + var_73_2) / var_73_4)
		end))
		var_73_6.passed = math.random() * var_73_5
		arg_73_0.cloudTimer[iter_73_1] = var_73_6.uniqueId
	end
end

function var_0_0.RefreshMapBG(arg_75_0)
	arg_75_0:PlayBGM()
	arg_75_0:SwitchMapBG(arg_75_0.contextData.map, nil, true)
end

function var_0_0.updateCouldAnimator(arg_76_0, arg_76_1, arg_76_2)
	if not arg_76_1 then
		return
	end

	local var_76_0 = arg_76_0.contextData.map:getConfig("ani_controller")

	local function var_76_1(arg_77_0)
		arg_77_0 = tf(arg_77_0)

		local var_77_0 = Vector3.one

		if arg_77_0.rect.width > 0 and arg_77_0.rect.height > 0 then
			var_77_0.x = arg_77_0.parent.rect.width / arg_77_0.rect.width
			var_77_0.y = arg_77_0.parent.rect.height / arg_77_0.rect.height
		end

		arg_77_0.localScale = var_77_0

		if var_76_0 and #var_76_0 > 0 then
			local var_77_1 = getProxy(ChapterProxy)

			;(function()
				for iter_78_0, iter_78_1 in ipairs(var_76_0) do
					if type(iter_78_1[2][1]) == "table" then
						local var_78_0 = false
						local var_78_1 = iter_78_1[2][1]

						for iter_78_2, iter_78_3 in ipairs(var_78_1) do
							local var_78_2 = var_77_1:GetChapterItemById(iter_78_3)

							if var_78_2 and var_78_2:isClear() then
								local var_78_3 = true

								break
							end
						end
					end

					if iter_78_1[1] == var_0_2 then
						local var_78_4 = _.rest(iter_78_1[2], 2)

						for iter_78_4, iter_78_5 in ipairs(var_78_4) do
							local var_78_5 = arg_77_0:Find(iter_78_5)

							if not IsNil(var_78_5) and not anyClear then
								setActive(var_78_5, false)
							end
						end
					elseif iter_78_1[1] == var_0_3 then
						local var_78_6 = _.rest(iter_78_1[2], 2)

						for iter_78_6, iter_78_7 in ipairs(var_78_6) do
							local var_78_7 = arg_77_0:Find(iter_78_7)

							if not IsNil(var_78_7) and not anyClear then
								setActive(var_78_7, true)

								return
							end
						end
					elseif iter_78_1[1] == var_0_4 then
						local var_78_8 = _.rest(iter_78_1[2], 2)

						for iter_78_8, iter_78_9 in ipairs(var_78_8) do
							local var_78_9 = arg_77_0:Find(iter_78_9)

							if not IsNil(var_78_9) and not anyClear then
								setActive(var_78_9, true)
							end
						end
					end
				end
			end)()
		end
	end

	local var_76_2 = arg_76_0.loader:GetPrefab("ui/" .. arg_76_1, arg_76_1, function(arg_79_0)
		arg_79_0:SetActive(true)

		local var_79_0 = arg_76_0.mapTFs[arg_76_2]

		setParent(arg_79_0, var_79_0)
		pg.ViewUtils.SetSortingOrder(arg_79_0, ChapterConst.LayerWeightMap + arg_76_2 * 2 - 1)
		var_76_1(arg_79_0)
	end)

	table.insert(arg_76_0.mapGroup, var_76_2)
end

function var_0_0.HideBtns(arg_80_0)
	setActive(arg_80_0.btnPrev, false)
	setActive(arg_80_0.eliteQuota, false)
	setActive(arg_80_0.escortBar, false)
	setActive(arg_80_0.skirmishBar, false)
	setActive(arg_80_0.normalBtn, false)
	setActive(arg_80_0.actNormalBtn, false)
	setActive(arg_80_0.eliteBtn, false)
	setActive(arg_80_0.actEliteBtn, false)
	setActive(arg_80_0.actExtraBtn, false)
	setActive(arg_80_0.remasterBtn, false)
	setActive(arg_80_0.btnNext, false)
	setActive(arg_80_0.remasterAwardBtn, false)
	setActive(arg_80_0.eventContainer, false)
	setActive(arg_80_0.activityBtn, false)
	setActive(arg_80_0.ptTotal, false)
	setActive(arg_80_0.ticketTxt.parent, false)
	setActive(arg_80_0.countDown, false)
	setActive(arg_80_0.actAtelierBuffBtn, false)
	setActive(arg_80_0.actAtelierYumiaBuffBtn, false)
	setActive(arg_80_0.actExtraRank, false)
	setActive(arg_80_0.actExchangeShopBtn, false)
	setActive(arg_80_0.mapHelpBtn, false)
end

function var_0_0.updateDifficultyBtns(arg_81_0)
	local var_81_0 = arg_81_0.contextData.map:getConfig("type")

	setActive(arg_81_0.normalBtn, var_81_0 == Map.ELITE)
	setActive(arg_81_0.eliteQuota, var_81_0 == Map.ELITE)
	setActive(arg_81_0.eliteBtn, var_81_0 == Map.SCENARIO)

	local var_81_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID)

	setActive(arg_81_0.eliteBtn:Find("pic_activity"), var_81_1 and not var_81_1:isEnd())
end

function var_0_0.updateActivityBtns(arg_82_0)
	local var_82_0 = arg_82_0.contextData.map
	local var_82_1, var_82_2 = var_82_0:isActivity()
	local var_82_3 = var_82_0:isRemaster()
	local var_82_4 = var_82_0:isSkirmish()
	local var_82_5 = var_82_0:isEscort()
	local var_82_6 = var_82_0:getConfig("type")
	local var_82_7 = setmetatable({}, MainActMapBtn)
	local var_82_8 = var_82_7:InShowTime() and not var_82_1 and not var_82_4 and not var_82_5

	if var_82_8 then
		var_82_7.image = arg_82_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_82_7.subImage = arg_82_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_82_7.tipTr = arg_82_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_82_7.tipTxt = arg_82_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_82_8 = var_82_7:InShowTime()

		if var_82_8 then
			var_82_7:InitTipImage()
			var_82_7:InitSubImage()
			var_82_7:InitImage(function()
				return
			end)
			var_82_7:OnInit()
		end
	end

	setActive(arg_82_0.activityBtn, var_82_8)
	arg_82_0:updateRemasterInfo()

	if var_82_1 and var_82_2 then
		local var_82_9

		if var_82_0:isRemaster() then
			var_82_9 = getProxy(ChapterProxy):getRemasterMaps(var_82_0.remasterId)
		else
			var_82_9 = getProxy(ChapterProxy):getMapsByActivities(var_82_0:getConfig("on_activity"))
		end

		local var_82_10 = underscore.any(var_82_9, function(arg_84_0)
			return arg_84_0:isActExtra()
		end)

		setActive(arg_82_0.actExtraBtn, var_82_10 and var_82_6 ~= Map.ACT_EXTRA)

		if isActive(arg_82_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_82_9, function(arg_85_0)
				local var_85_0 = arg_85_0:getMapType()

				return var_85_0 == Map.ACTIVITY_EASY or var_85_0 == Map.ACTIVITY_HARD
			end), function(arg_86_0)
				return arg_86_0:isAllChaptersClear()
			end) then
				setActive(arg_82_0.actExtraBtnAnim, true)
			else
				setActive(arg_82_0.actExtraBtnAnim, false)
			end

			setActive(arg_82_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive(var_82_0:getConfig("on_activity")) and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_82_11 = checkExist(var_82_0:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_82_0.actEliteBtn, var_82_11 and var_82_6 ~= Map.ACTIVITY_HARD)
		setActive(arg_82_0.actNormalBtn, var_82_6 ~= Map.ACTIVITY_EASY)
		setActive(arg_82_0.actExtraRank, var_82_6 == Map.ACT_EXTRA and _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK), function(arg_87_0)
			if not arg_87_0 or arg_87_0:isEnd() then
				return
			end

			local var_87_0 = arg_87_0:getConfig("config_data")[1]

			return _.any(var_82_0:getChapters(), function(arg_88_0)
				if not arg_88_0:IsEXChapter() then
					return false
				end

				return table.contains(arg_88_0:getConfig("boss_expedition_id"), var_87_0)
			end)
		end))
		setActive(arg_82_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_82_3 and var_82_2 and arg_82_0:IsActShopActive())

		local var_82_12 = arg_82_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_82_0.contextData.map:getConfig("on_activity")) or nil
		local var_82_13 = var_82_12 and not var_82_12:isEnd() and var_82_12:GetConfigClientSetting("PTID")

		arg_82_0:updatePtActivity(underscore.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_89_0)
			return arg_89_0:getConfig("config_id") == var_82_13
		end))
		setActive(arg_82_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_82_3 and var_82_2 and arg_82_0.ptActivity and not arg_82_0.ptActivity:isEnd())
	else
		setActive(arg_82_0.actExtraBtn, false)
		setActive(arg_82_0.actEliteBtn, false)
		setActive(arg_82_0.actNormalBtn, false)
		setActive(arg_82_0.actExtraRank, false)
		setActive(arg_82_0.actExchangeShopBtn, false)
		setActive(arg_82_0.actAtelierBuffBtn, false)
		setActive(arg_82_0.actAtelierYumiaBuffBtn, false)
		setActive(arg_82_0.ptTotal, false)
	end

	setActive(arg_82_0.eventContainer, (not var_82_1 or not var_82_2) and not var_82_5)
	setActive(arg_82_0.remasterBtn, OPEN_REMASTER and (var_82_3 or not var_82_1 and not var_82_5 and not var_82_4))
	setActive(arg_82_0.ticketTxt.parent, var_82_3)
	arg_82_0:updateRemasterTicket()
	arg_82_0:updateCountDown()
end

function var_0_0.updateRemasterTicket(arg_90_0)
	setText(arg_90_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_90_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_91_0)
	local var_91_0 = getProxy(ChapterProxy)
	local var_91_1 = var_91_0:ifShowRemasterTip() or var_91_0:anyRemasterAwardCanReceive()

	SetActive(arg_91_0.remasterBtn:Find("tip"), var_91_1)
	SetActive(arg_91_0.entranceLayer:Find("btns/btn_remaster/tip"), var_91_1)
end

function var_0_0.updatDailyBtnTip(arg_92_0)
	local var_92_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_92_0.dailyBtn:Find("tip"), var_92_0)
	SetActive(arg_92_0.entranceLayer:Find("btns/btn_daily/tip"), var_92_0)
end

function var_0_0.updateRemasterInfo(arg_93_0)
	arg_93_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_93_0.contextData.map then
		return
	end

	local var_93_0 = getProxy(ChapterProxy)
	local var_93_1
	local var_93_2 = arg_93_0.contextData.map:getRemaster()

	if var_93_2 and #pg.re_map_template[var_93_2].drop_gain > 0 then
		for iter_93_0, iter_93_1 in ipairs(pg.re_map_template[var_93_2].drop_gain) do
			if #iter_93_1 > 0 and var_93_0.remasterInfo[iter_93_1[1]][iter_93_0].receive == false then
				var_93_1 = {
					iter_93_0,
					iter_93_1
				}

				break
			end
		end
	end

	setActive(arg_93_0.remasterAwardBtn, var_93_1)

	if var_93_1 then
		local var_93_3 = var_93_1[1]
		local var_93_4, var_93_5, var_93_6, var_93_7 = unpack(var_93_1[2])
		local var_93_8 = var_93_0.remasterInfo[var_93_4][var_93_3]

		setText(arg_93_0.remasterAwardBtn:Find("Text"), var_93_8.count .. "/" .. var_93_7)
		updateDrop(arg_93_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_93_5,
			id = var_93_6
		})
		setActive(arg_93_0.remasterAwardBtn:Find("tip"), var_93_7 <= var_93_8.count)
		onButton(arg_93_0, arg_93_0.remasterAwardBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_93_5,
					id = var_93_6
				},
				weight = LayerWeightConst.TOP_LAYER,
				remaster = {
					word = i18n("level_remaster_tip4", pg.chapter_template[var_93_4].chapter_name),
					number = var_93_8.count .. "/" .. var_93_7,
					btn_text = i18n(var_93_8.count < var_93_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_93_8.count < var_93_7 then
							local var_95_0 = pg.chapter_template[var_93_4].map
							local var_95_1, var_95_2 = var_93_0:getMapById(var_95_0):isUnlock()

							if not var_95_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_95_2)
							else
								arg_93_0:ShowSelectedMap(var_95_0)
							end
						else
							arg_93_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_93_4, var_93_3)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_96_0)
	local var_96_0 = getProxy(ChapterProxy)

	if arg_96_0.newChapterCDTimer then
		arg_96_0.newChapterCDTimer:Stop()

		arg_96_0.newChapterCDTimer = nil
	end

	local var_96_1 = 0

	if arg_96_0.contextData.map:isActivity() and not arg_96_0.contextData.map:isRemaster() then
		local var_96_2 = var_96_0:getMapsByActivities(arg_96_0.contextData.map:getConfig("on_activity"))

		_.each(var_96_2, function(arg_97_0)
			local var_97_0 = arg_97_0:getChapterTimeLimit()

			if var_96_1 == 0 then
				var_96_1 = var_97_0
			else
				var_96_1 = math.min(var_96_1, var_97_0)
			end
		end)
		setActive(arg_96_0.countDown, var_96_1 > 0)
		setText(arg_96_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_96_0.countDown, false)
	end

	if var_96_1 > 0 then
		setText(arg_96_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_96_1))

		arg_96_0.newChapterCDTimer = Timer.New(function()
			var_96_1 = var_96_1 - 1

			if var_96_1 <= 0 then
				arg_96_0:updateCountDown()

				if not arg_96_0.contextData.chapterVO then
					arg_96_0:setMap(arg_96_0.contextData.mapIdx)
				end
			else
				setText(arg_96_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_96_1))
			end
		end, 1, -1)

		arg_96_0.newChapterCDTimer:Start()
	else
		setText(arg_96_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_99_0)
	onButton(arg_99_0, arg_99_0.actExtraRank, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_99_0, arg_99_0.activityBtn, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_99_0, arg_99_0.actExchangeShopBtn, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_99_0, arg_99_0.actAtelierBuffBtn, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)
	onButton(arg_99_0, arg_99_0.actAtelierYumiaBuffBtn, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelMediator2.SHOW_ATELIER_BUFF, true)
	end, SFX_UI_CLICK)

	local var_99_0 = getProxy(ChapterProxy)

	local function var_99_1(arg_105_0, arg_105_1, arg_105_2)
		local var_105_0

		if arg_105_0:isRemaster() then
			var_105_0 = var_99_0:getRemasterMaps(arg_105_0.remasterId)
		else
			var_105_0 = var_99_0:getMapsByActivities(arg_105_0:getConfig("on_activity"))
		end

		local var_105_1 = _.select(var_105_0, function(arg_106_0)
			return arg_106_0:getMapType() == arg_105_1
		end)

		table.sort(var_105_1, function(arg_107_0, arg_107_1)
			return arg_107_0.id < arg_107_1.id
		end)

		local var_105_2 = table.indexof(underscore.map(var_105_1, function(arg_108_0)
			return arg_108_0.id
		end), arg_105_2) or #var_105_1

		while not var_105_1[var_105_2]:isUnlock() do
			if var_105_2 > 1 then
				var_105_2 = var_105_2 - 1
			else
				break
			end
		end

		return var_105_1[var_105_2]
	end

	arg_99_0:bind(LevelUIConst.SWITCH_ACT_MAP, function(arg_109_0, arg_109_1, arg_109_2)
		arg_109_2 = arg_109_2 or switch(arg_109_1, {
			[Map.ACTIVITY_EASY] = function()
				return arg_99_0.contextData.map:getBindMapId()
			end,
			[Map.ACTIVITY_HARD] = function()
				return arg_99_0.contextData.map:getBindMapId()
			end,
			[Map.ACT_EXTRA] = function()
				return PlayerPrefs.GetInt("ex_mapId", 0)
			end
		})

		local var_109_0 = var_99_1(arg_99_0.contextData.map, arg_109_1, arg_109_2)
		local var_109_1, var_109_2 = var_109_0:isUnlock()

		if var_109_1 then
			arg_99_0:setMap(var_109_0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_109_2)
		end
	end)
	onButton(arg_99_0, arg_99_0.actNormalBtn, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
	onButton(arg_99_0, arg_99_0.actEliteBtn, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(arg_99_0, arg_99_0.actExtraBtn, function()
		if arg_99_0:isfrozen() then
			return
		end

		arg_99_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACT_EXTRA)
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_116_0, arg_116_1)
	arg_116_0.initPositions = {}

	local var_116_0 = arg_116_1 or 1
	local var_116_1 = pg.expedition_data_by_map[var_116_0].clouds_pos

	for iter_116_0, iter_116_1 in ipairs(arg_116_0.cloudRTFs) do
		local var_116_2 = var_116_1[iter_116_0]

		if var_116_2 then
			iter_116_1.anchoredPosition = Vector2(var_116_2[1], var_116_2[2])

			table.insert(arg_116_0.initPositions, iter_116_1.anchoredPosition)
		else
			setActive(iter_116_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_117_0, arg_117_1, arg_117_2)
	onButton(arg_117_0, arg_117_1, function()
		if arg_117_0:isfrozen() then
			return
		end

		local var_118_0 = arg_117_0.contextData.mapIdx + arg_117_2
		local var_118_1 = getProxy(ChapterProxy):getMapById(var_118_0)

		if not var_118_1 then
			return
		end

		if var_118_1:getMapType() == Map.ELITE and not var_118_1:isEliteEnabled() then
			var_118_1 = var_118_1:getBindMap()
			var_118_0 = var_118_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_118_2, var_118_3 = var_118_1:isUnlock()

		if arg_117_2 > 0 and not var_118_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_118_3)

			return
		end

		arg_117_0:setMap(var_118_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_119_0, arg_119_1, arg_119_2)
	seriesAsync({
		function(arg_120_0)
			if arg_119_0.contextData.entranceStatus then
				arg_119_0:frozen()

				arg_119_0.nextPreloadMap = arg_119_1

				arg_119_0:PreloadLevelMainUI(arg_119_1, function()
					arg_119_0:unfrozen()

					if arg_119_0.nextPreloadMap ~= arg_119_1 then
						return
					end

					arg_119_0:ShowEntranceUI(false)
					arg_119_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_119_1)
					arg_120_0()
				end)
			else
				arg_119_0:setMap(arg_119_1)
				arg_120_0()
			end
		end
	}, arg_119_2)
end

function var_0_0.setMap(arg_122_0, arg_122_1)
	local var_122_0 = arg_122_0.contextData.mapIdx

	arg_122_0.contextData.mapIdx = arg_122_1
	arg_122_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_122_1)

	assert(arg_122_0.contextData.map, "map cannot be nil " .. arg_122_1)

	if arg_122_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_122_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_122_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_122_0.contextData.map.remasterId, arg_122_1)
		PlayerPrefs.Save()
	end

	arg_122_0:RecordLastMapOnExit()
	arg_122_0:updateMap(var_122_0)
	arg_122_0:tryPlayMapStory()
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
	[var_0_5.TYPEEXSP] = "MapBuilderEXSP"
}

function var_0_0.SwitchMapBuilder(arg_123_0, arg_123_1)
	if arg_123_0.mapBuilder and arg_123_0.mapBuilder:GetType() ~= arg_123_1 then
		arg_123_0.mapBuilder.buffer:Hide()
	end

	local var_123_0 = arg_123_0:GetMapBuilderInBuffer(arg_123_1)

	arg_123_0.mapBuilder = var_123_0

	var_123_0.buffer:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_124_0, arg_124_1)
	if not arg_124_0.mbDict[arg_124_1] then
		local var_124_0 = _G[var_0_6[arg_124_1]]

		assert(var_124_0, "Missing MapBuilder of type " .. (arg_124_1 or "NIL"))

		arg_124_0.mbDict[arg_124_1] = var_124_0.New(arg_124_0._tf, arg_124_0)
		arg_124_0.mbDict[arg_124_1].isFrozen = arg_124_0:isfrozen()

		arg_124_0.mbDict[arg_124_1]:Load()
	end

	return arg_124_0.mbDict[arg_124_1]
end

function var_0_0.updateMap(arg_125_0, arg_125_1)
	local var_125_0 = arg_125_0.contextData.map
	local var_125_1 = var_125_0:getConfig("anchor")
	local var_125_2

	if var_125_1 == "" then
		var_125_2 = Vector2(0.5, 0.5)
	else
		var_125_2 = Vector2(unpack(var_125_1))
	end

	arg_125_0.map.pivot = var_125_2

	local var_125_3 = var_125_0:getConfig("uifx")

	for iter_125_0 = 1, arg_125_0.UIFXList.childCount do
		local var_125_4 = arg_125_0.UIFXList:GetChild(iter_125_0 - 1)

		setActive(var_125_4, var_125_4.name == var_125_3)
	end

	arg_125_0:SwitchMapBG(var_125_0, arg_125_1)
	arg_125_0:PlayBGM()

	local var_125_5 = arg_125_0.contextData.map:getConfig("ui_type")

	arg_125_0:SwitchMapBuilder(var_125_5)
	seriesAsync({
		function(arg_126_0)
			arg_125_0.mapBuilder:CallbackInvoke(arg_126_0)
		end,
		function(arg_127_0)
			arg_125_0.mapBuilder:UpdateMapVO(var_125_0)
			arg_125_0.mapBuilder:UpdateView()
			arg_125_0.mapBuilder:UpdateMapItems()
			arg_125_0.mapBuilder:PlayEnterAnim()
		end
	})
end

function var_0_0.UpdateSwitchMapButton(arg_128_0)
	local var_128_0 = arg_128_0.contextData.map
	local var_128_1 = getProxy(ChapterProxy)
	local var_128_2 = var_128_1:getMapById(var_128_0.id - 1)
	local var_128_3 = var_128_1:getMapById(var_128_0.id + 1)

	setActive(arg_128_0.btnPrev, tobool(var_128_2))
	setActive(arg_128_0.btnNext, tobool(var_128_3))

	local var_128_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_128_0.btnPrevCol, var_128_2 and Color.white or var_128_4)
	setImageColor(arg_128_0.btnNextCol, var_128_3 and var_128_3:isUnlock() and Color.white or var_128_4)
end

function var_0_0.tryPlayMapStory(arg_129_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_130_0)
			local var_130_0 = arg_129_0.contextData.map:getConfig("enter_story")

			if var_130_0 and var_130_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_130_0) and not arg_129_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_130_1 = tonumber(var_130_0)

				if var_130_1 and var_130_1 > 0 then
					arg_129_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_130_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_130_0, arg_130_0)
				end

				return
			end

			arg_130_0()
		end,
		function(arg_131_0)
			local var_131_0 = arg_129_0.contextData.map:getConfig("guide_id")

			if var_131_0 and var_131_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_131_0, nil, arg_131_0)

				return
			end

			arg_131_0()
		end,
		function(arg_132_0)
			if isActive(arg_129_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_132_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_132_1

				if var_132_0 then
					var_132_1 = {
						1,
						2
					}
				else
					var_132_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_132_1)
			else
				arg_132_0()
			end
		end,
		function(arg_133_0)
			if arg_129_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_129_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_134_0, arg_134_1, arg_134_2, arg_134_3)
	arg_134_0.uiAnims = arg_134_0.uiAnims or {}

	local var_134_0 = arg_134_0.uiAnims[arg_134_1]

	local function var_134_1()
		arg_134_0.playing = true

		arg_134_0:frozen()
		var_134_0:SetActive(true)

		local var_135_0 = tf(var_134_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_135_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_134_3 then
			arg_134_3(var_134_0)
		end

		var_135_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_136_0)
			arg_134_0.playing = false

			if arg_134_2 then
				arg_134_2(var_134_0)
			end

			arg_134_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_134_0 then
		PoolMgr.GetInstance():GetUI(arg_134_1, true, function(arg_137_0)
			arg_137_0:SetActive(true)

			arg_134_0.uiAnims[arg_134_1] = arg_137_0
			var_134_0 = arg_134_0.uiAnims[arg_134_1]

			var_134_1()
		end)
	else
		var_134_1()
	end
end

function var_0_0.displaySpResult(arg_138_0, arg_138_1, arg_138_2)
	setActive(arg_138_0.spResult, true)
	arg_138_0:DisplaySPAnim(arg_138_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_139_0)
		onButton(arg_138_0, arg_139_0, function()
			removeOnButton(arg_139_0)
			setActive(arg_139_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_139_0, arg_138_0._tf)
			arg_138_0:hideSpResult()
			arg_138_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_141_0)
	setActive(arg_141_0.spResult, false)
end

function var_0_0.displayBombResult(arg_142_0, arg_142_1)
	setActive(arg_142_0.spResult, true)
	arg_142_0:DisplaySPAnim("SpBombRet", function(arg_143_0)
		onButton(arg_142_0, arg_143_0, function()
			removeOnButton(arg_143_0)
			setActive(arg_143_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_143_0, arg_142_0._tf)
			arg_142_0:hideSpResult()
			arg_142_1()
		end, SFX_PANEL)
	end, function(arg_145_0)
		setText(arg_145_0.transform:Find("right/name_bg/en"), arg_142_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_146_0, arg_146_1, arg_146_2)
	arg_146_0.contextData.chapterLoopFlag = arg_146_2

	local var_146_0 = getProxy(ChapterProxy):getChapterById(arg_146_1, true)

	if var_146_0:getConfig("type") == Chapter.CustomFleet then
		arg_146_0:displayFleetEdit(var_146_0)

		return
	end

	if #var_146_0:getNpcShipByType(1) > 0 then
		arg_146_0:emit(LevelMediator2.ON_TRACKING, arg_146_1)

		return
	end

	arg_146_0:displayFleetSelect(var_146_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_147_0, arg_147_1, arg_147_2)
	seriesAsync({
		function(arg_148_0)
			if not arg_147_0.levelInfoView:GetLoaded() then
				arg_147_0:frozen()
				arg_147_0.levelInfoView:Load()
				arg_147_0.levelInfoView:CallbackInvoke(function()
					arg_147_0:unfrozen()
					arg_148_0()
				end)

				return
			end

			arg_148_0()
		end,
		function(arg_150_0)
			local function var_150_0(arg_151_0, arg_151_1)
				arg_147_0:hideChapterPanel()
				arg_147_0:OnLevelInfoPanelConfirm(arg_151_0, arg_151_1)
			end

			local function var_150_1()
				arg_147_0:hideChapterPanel()
			end

			local var_150_2 = getProxy(ChapterProxy):getChapterById(arg_147_1, true)

			if getProxy(ChapterProxy):getMapById(var_150_2:getConfig("map")):isSkirmish() and #var_150_2:getNpcShipByType(1) > 0 then
				var_150_0(false)

				return
			end

			arg_147_0.levelInfoView:set(arg_147_1, arg_147_2)
			arg_147_0.levelInfoView:setCBFunc(var_150_0, var_150_1)
			arg_147_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_153_0)
	if arg_153_0.levelInfoView:isShowing() then
		arg_153_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_154_0)
	arg_154_0.levelInfoView:Destroy()

	arg_154_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_155_0, arg_155_1, arg_155_2, arg_155_3)
	seriesAsync({
		function(arg_156_0)
			if not arg_155_0.levelInfoSPView then
				arg_155_0.levelInfoSPView = LevelInfoSPView.New(arg_155_0.topPanel, arg_155_0.event, arg_155_0.contextData)

				arg_155_0:frozen()
				arg_155_0.levelInfoSPView:Load()
				arg_155_0.levelInfoSPView:CallbackInvoke(function()
					arg_155_0:unfrozen()
					arg_156_0()
				end)

				return
			end

			arg_156_0()
		end,
		function(arg_158_0)
			local function var_158_0(arg_159_0, arg_159_1)
				arg_155_0:HideLevelInfoSPPanel()
				arg_155_0:OnLevelInfoPanelConfirm(arg_159_0, arg_159_1)
			end

			local function var_158_1()
				arg_155_0:HideLevelInfoSPPanel()
			end

			arg_155_0.levelInfoSPView:SetChapterGroupInfo(arg_155_2)
			arg_155_0.levelInfoSPView:set(arg_155_1, arg_155_3)
			arg_155_0.levelInfoSPView:setCBFunc(var_158_0, var_158_1)
			arg_155_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_161_0)
	if arg_161_0.levelInfoSPView and arg_161_0.levelInfoSPView:isShowing() then
		arg_161_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_162_0)
	if not arg_162_0.levelInfoSPView then
		return
	end

	arg_162_0.levelInfoSPView:Destroy()

	arg_162_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_163_0, arg_163_1)
	local var_163_0 = arg_163_0.contextData.selectedFleetIDs or arg_163_1:GetDefaultFleetIndex()

	arg_163_1 = Clone(arg_163_1)
	arg_163_1.loopFlag = arg_163_0.contextData.chapterLoopFlag

	arg_163_0.levelFleetView:updateSpecialOperationTickets(arg_163_0.spTickets)
	arg_163_0.levelFleetView:Load()
	arg_163_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_163_0.shipVOs)
	arg_163_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_163_0.openedCommanerSystem)
	arg_163_0.levelFleetView:ActionInvoke("set", arg_163_1, arg_163_0.fleets, var_163_0)
	arg_163_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_164_0)
	if arg_164_0.levelCMDFormationView:isShowing() then
		arg_164_0.levelCMDFormationView:Hide()
	end

	if arg_164_0.levelFleetView then
		arg_164_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_165_0)
	arg_165_0.levelCMDFormationView = LevelCMDFormationView.New(arg_165_0.topPanel, arg_165_0.event, arg_165_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_166_0)
	if not arg_166_0.levelFleetView then
		return
	end

	arg_166_0.levelFleetView:Destroy()

	arg_166_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_167_0, arg_167_1)
	arg_167_1 = Clone(arg_167_1)
	arg_167_1.loopFlag = arg_167_0.contextData.chapterLoopFlag

	arg_167_0.levelFleetView:updateSpecialOperationTickets(arg_167_0.spTickets)
	arg_167_0.levelFleetView:Load()
	arg_167_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_167_0.openedCommanerSystem)
	arg_167_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_167_0.shipVOs)
	arg_167_0.levelFleetView:ActionInvoke("setOnHard", arg_167_1)
	arg_167_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_168_0)
	arg_168_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_169_0)
	arg_169_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_170_0, arg_170_1)
	if not arg_170_0.levelFleetView then
		return
	end

	assert(arg_170_0.levelFleetView:GetLoaded())

	local var_170_0 = arg_170_0.levelFleetView:IsSelectMode()
	local var_170_1

	if var_170_0 then
		arg_170_0.levelFleetView:ActionInvoke("set", arg_170_1 or arg_170_0.levelFleetView.chapter, arg_170_0.fleets, arg_170_0.levelFleetView:getSelectIds())

		if arg_170_0.levelCMDFormationView:isShowing() then
			local var_170_2 = arg_170_0.levelCMDFormationView.fleet.id

			var_170_1 = arg_170_0.fleets[var_170_2]
		end
	else
		arg_170_0.levelFleetView:ActionInvoke("setOnHard", arg_170_1 or arg_170_0.levelFleetView.chapter)

		if arg_170_0.levelCMDFormationView:isShowing() then
			local var_170_3 = arg_170_0.levelCMDFormationView.fleet.id

			var_170_1 = arg_170_1:wrapEliteFleet(var_170_3)
		end
	end

	if var_170_1 then
		arg_170_0.levelCMDFormationView:ActionInvoke("updateFleet", var_170_1)
	end
end

function var_0_0.setChapter(arg_171_0, arg_171_1)
	local var_171_0

	if arg_171_1 then
		var_171_0 = arg_171_1.id
	end

	arg_171_0.contextData.chapterId = var_171_0
	arg_171_0.contextData.chapterVO = arg_171_1
end

function var_0_0.switchToChapter(arg_172_0, arg_172_1)
	if arg_172_0.contextData.mapIdx ~= arg_172_1:getConfig("map") then
		arg_172_0:setMap(arg_172_1:getConfig("map"))
	end

	arg_172_0:setChapter(arg_172_1)

	arg_172_0.leftCanvasGroup.blocksRaycasts = false
	arg_172_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_172_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_172_0:DestroyLevelStageView()

	if not arg_172_0.levelStageView then
		arg_172_0.levelStageView = LevelStageView.New(arg_172_0.topPanel, arg_172_0.event, arg_172_0.contextData)

		arg_172_0.levelStageView:Load()

		arg_172_0.levelStageView.isFrozen = arg_172_0:isfrozen()
	end

	arg_172_0:frozen()

	local function var_172_0()
		seriesAsync({
			function(arg_174_0)
				arg_172_0.mapBuilder:CallbackInvoke(arg_174_0)
			end,
			function(arg_175_0)
				setActive(arg_172_0.clouds, false)
				arg_172_0.mapBuilder:HideFloat()
				pg.UIMgr.GetInstance():BlurPanel(arg_172_0.topPanel, false, {
					blurCamList = {
						pg.UIMgr.CameraUI
					},
					groupName = LayerWeightConst.GROUP_LEVELUI
				})
				pg.playerResUI:SetActive({
					active = true,
					groupName = LayerWeightConst.GROUP_LEVELUI,
					showType = PlayerResUI.TYPE_ALL
				})
				arg_172_0.levelStageView:updateStageInfo()
				arg_172_0.levelStageView:updateAmbushRate(arg_172_1.fleet.line, true)
				arg_172_0.levelStageView:updateStageAchieve()
				arg_172_0.levelStageView:updateStageBarrier()
				arg_172_0.levelStageView:updateBombPanel()
				arg_172_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_175_0)
			end,
			function(arg_176_0)
				if arg_172_0.exited then
					return
				end

				arg_172_0.levelStageView:updateStageStrategy()

				arg_172_0.canvasGroup.blocksRaycasts = arg_172_0.frozenCount == 0

				onNextTick(arg_176_0)
			end,
			function(arg_177_0)
				if arg_172_0.exited then
					return
				end

				arg_172_0.levelStageView:updateStageFleet()
				arg_172_0.levelStageView:updateSupportFleet()
				arg_172_0.levelStageView:updateFleetBuff()
				onNextTick(arg_177_0)
			end,
			function(arg_178_0)
				if arg_172_0.exited then
					return
				end

				parallelAsync({
					function(arg_179_0)
						local var_179_0 = arg_172_1:getConfig("scale")
						local var_179_1 = LeanTween.value(go(arg_172_0.map), arg_172_0.map.localScale, Vector3.New(var_179_0[3], var_179_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_180_0)
							arg_172_0.map.localScale = arg_180_0
							arg_172_0.float.localScale = arg_180_0
						end):setOnComplete(System.Action(function()
							arg_172_0.mapBuilder:ShowFloat()
							arg_172_0.mapBuilder:Hide()
							arg_179_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_172_0:RecordTween("mapScale", var_179_1.uniqueId)

						local var_179_2 = LeanTween.value(go(arg_172_0.map), arg_172_0.map.pivot, Vector2.New(math.clamp(var_179_0[1] - 0.5, 0, 1), math.clamp(var_179_0[2] - 0.5, 0, 1)), var_0_1)

						var_179_2:setOnUpdateVector2(function(arg_182_0)
							arg_172_0.map.pivot = arg_182_0
							arg_172_0.float.pivot = arg_182_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_172_0:RecordTween("mapPivot", var_179_2.uniqueId)
						shiftPanel(arg_172_0.leftChapter, -arg_172_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_172_0.rightChapter, arg_172_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_172_0.topChapter, 0, arg_172_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_172_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_183_0)
						arg_172_0:PlayBGM()

						local var_183_0 = {}
						local var_183_1 = arg_172_1:getConfig("bg")

						if var_183_1 and #var_183_1 > 0 then
							var_183_0[1] = {
								BG = var_183_1
							}
						end

						arg_172_0:SwitchBG(var_183_0, arg_183_0)
					end
				}, function()
					onNextTick(arg_178_0)
				end)
			end,
			function(arg_185_0)
				if arg_172_0.exited then
					return
				end

				setActive(arg_172_0.topChapter, false)
				setActive(arg_172_0.leftChapter, false)
				setActive(arg_172_0.rightChapter, false)

				arg_172_0.leftCanvasGroup.blocksRaycasts = true
				arg_172_0.rightCanvasGroup.blocksRaycasts = true

				arg_172_0:initGrid(arg_185_0)
			end,
			function(arg_186_0)
				if arg_172_0.exited then
					return
				end

				arg_172_0.levelStageView:SetGrid(arg_172_0.grid)

				arg_172_0.contextData.huntingRangeVisibility = arg_172_0.contextData.huntingRangeVisibility - 1

				arg_172_0.grid:toggleHuntingRange()

				local var_186_0 = arg_172_1:getConfig("pop_pic")

				if var_186_0 and #var_186_0 > 0 and arg_172_0.FirstEnterChapter == arg_172_1.id then
					arg_172_0:doPlayAnim(var_186_0, function(arg_187_0)
						setActive(arg_187_0, false)

						if arg_172_0.exited then
							return
						end

						arg_186_0()
					end)
				else
					arg_186_0()
				end
			end,
			function(arg_188_0)
				arg_172_0.levelStageView:tryAutoAction(arg_188_0)
			end,
			function(arg_189_0)
				if arg_172_0.exited then
					return
				end

				arg_172_0:unfrozen()

				if arg_172_0.FirstEnterChapter then
					arg_172_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_172_1.subAutoAttack)
				end

				arg_172_0.FirstEnterChapter = nil

				arg_172_0.levelStageView:tryAutoTrigger(true)
			end
		})
	end

	arg_172_0.levelStageView:ActionInvoke("SetSeriesOperation", var_172_0)
	arg_172_0.levelStageView:ActionInvoke("SetPlayer", arg_172_0.player)
	arg_172_0.levelStageView:ActionInvoke("SwitchToChapter", arg_172_1)
end

function var_0_0.switchToMap(arg_190_0, arg_190_1)
	arg_190_0:frozen()
	arg_190_0:destroyGrid()
	arg_190_0:setChapter(nil)
	LeanTween.cancel(go(arg_190_0.map))

	local var_190_0 = LeanTween.value(go(arg_190_0.map), arg_190_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_191_0)
		arg_190_0.map.localScale = arg_191_0
		arg_190_0.float.localScale = arg_191_0
	end):setOnComplete(System.Action(function()
		arg_190_0:unfrozen()
		arg_190_0.mapBuilder:PlayEnterAnim()
		existCall(arg_190_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_190_0:RecordTween("mapScale", var_190_0.uniqueId)

	local var_190_1 = arg_190_0.contextData.map:getConfig("anchor")
	local var_190_2

	if var_190_1 == "" then
		var_190_2 = Vector2.zero
	else
		var_190_2 = Vector2(unpack(var_190_1))
	end

	local var_190_3 = LeanTween.value(go(arg_190_0.map), arg_190_0.map.pivot, var_190_2, var_0_1)

	var_190_3:setOnUpdateVector2(function(arg_193_0)
		arg_190_0.map.pivot = arg_193_0
		arg_190_0.float.pivot = arg_193_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_190_0:RecordTween("mapPivot", var_190_3.uniqueId)
	setActive(arg_190_0.topChapter, true)
	setActive(arg_190_0.leftChapter, true)
	setActive(arg_190_0.rightChapter, true)
	shiftPanel(arg_190_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_190_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_190_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_190_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_190_0.levelStageView then
		arg_190_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_190_0:DestroyLevelStageView()
		end)
		arg_190_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_190_0:SwitchMapBG(arg_190_0.contextData.map)
	arg_190_0:PlayBGM()
	seriesAsync({
		function(arg_195_0)
			arg_190_0.mapBuilder:CallbackInvoke(arg_195_0)
		end,
		function(arg_196_0)
			arg_190_0.mapBuilder:Show()
			arg_190_0.mapBuilder:UpdateView()
			arg_190_0.mapBuilder:UpdateMapItems()
		end
	})
	pg.UIMgr.GetInstance():UnblurPanel(arg_190_0.topPanel, arg_190_0._tf)
	pg.playerResUI:SetActive({
		active = false
	})

	arg_190_0.canvasGroup.blocksRaycasts = arg_190_0.frozenCount == 0
	arg_190_0.canvasGroup.interactable = true

	if arg_190_0.ambushWarning and arg_190_0.ambushWarning.activeSelf then
		arg_190_0.ambushWarning:SetActive(false)
		arg_190_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_197_0, arg_197_1, arg_197_2, arg_197_3)
	if not arg_197_1 or #arg_197_1 <= 0 then
		existCall(arg_197_2)

		return
	elseif arg_197_3 then
		-- block empty
	elseif table.equal(arg_197_0.currentBG, arg_197_1) then
		return
	end

	arg_197_0.currentBG = arg_197_1

	for iter_197_0, iter_197_1 in ipairs(arg_197_0.mapGroup) do
		arg_197_0.loader:ClearRequest(iter_197_1)
	end

	table.clear(arg_197_0.mapGroup)

	local var_197_0 = {}

	table.ParallelIpairsAsync(arg_197_1, function(arg_198_0, arg_198_1, arg_198_2)
		local var_198_0 = arg_197_0.mapTFs[arg_198_0]
		local var_198_1 = arg_198_1.bgPrefix and arg_198_1.bgPrefix .. "/" or "levelmap/"
		local var_198_2 = arg_197_0.loader:GetSpriteDirect(var_198_1 .. arg_198_1.BG, "", function(arg_199_0)
			var_197_0[arg_198_0] = arg_199_0

			arg_198_2()
		end, var_198_0)

		table.insert(arg_197_0.mapGroup, var_198_2)
		arg_197_0:updateCouldAnimator(arg_198_1.Animator, arg_198_0)
	end, function()
		for iter_200_0, iter_200_1 in ipairs(arg_197_0.mapTFs) do
			setImageSprite(iter_200_1, var_197_0[iter_200_0])
			setActive(iter_200_1, arg_197_1[iter_200_0])
			SetCompomentEnabled(iter_200_1, typeof(Image), true)
		end

		existCall(arg_197_2)
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

function var_0_0.ClearMapTransitions(arg_201_0)
	if not arg_201_0.mapTransitions then
		return
	end

	for iter_201_0, iter_201_1 in pairs(arg_201_0.mapTransitions) do
		if iter_201_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_201_0, iter_201_0, iter_201_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_201_0, iter_201_0)
		end
	end

	arg_201_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_202_0, arg_202_1, arg_202_2, arg_202_3)
	local var_202_0, var_202_1, var_202_2 = arg_202_0:GetMapBG(arg_202_1, arg_202_2)

	if not var_202_1 then
		arg_202_0:SwitchBG(var_202_0, nil, arg_202_3)

		return
	end

	arg_202_0:PlayMapTransition("LevelMapTransition_" .. var_202_1, var_202_2, function()
		arg_202_0:SwitchBG(var_202_0, nil, arg_202_3)
	end)
end

function var_0_0.GetMapBG(arg_204_0, arg_204_1, arg_204_2)
	if not table.contains(var_0_7, arg_204_1.id) then
		return {
			arg_204_0:GetMapElement(arg_204_1)
		}
	end

	local var_204_0 = arg_204_1.id
	local var_204_1 = table.indexof(var_0_7, var_204_0) - 1
	local var_204_2 = bit.lshift(bit.rshift(var_204_1, 1), 1) + 1
	local var_204_3 = {
		var_0_7[var_204_2],
		var_0_7[var_204_2 + 1]
	}
	local var_204_4 = _.map(var_204_3, function(arg_205_0)
		return getProxy(ChapterProxy):getMapById(arg_205_0)
	end)

	if _.all(var_204_4, function(arg_206_0)
		return arg_206_0:isAllChaptersClear()
	end) then
		local var_204_5 = {
			arg_204_0:GetMapElement(arg_204_1)
		}

		if not arg_204_2 or math.abs(var_204_0 - arg_204_2) ~= 1 then
			return var_204_5
		end

		local var_204_6 = var_0_9[bit.rshift(var_204_2 - 1, 1) + 1]
		local var_204_7 = bit.band(var_204_1, 1) == 1

		return var_204_5, var_204_6, var_204_7
	else
		local var_204_8 = 0

		;(function()
			local var_207_0 = var_204_4[1]:getChapters()

			for iter_207_0, iter_207_1 in ipairs(var_207_0) do
				if not iter_207_1:isClear() then
					return
				end

				var_204_8 = var_204_8 + 1
			end

			if not var_204_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_204_8 = var_204_8 + 1

			local var_207_1 = var_204_4[2]:getChapters()

			for iter_207_2, iter_207_3 in ipairs(var_207_1) do
				if not iter_207_3:isClear() then
					return
				end

				var_204_8 = var_204_8 + 1
			end
		end)()

		local var_204_9

		if var_204_8 > 0 then
			local var_204_10 = var_0_8[bit.rshift(var_204_2 - 1, 1) + 1]

			var_204_9 = {
				{
					BG = "map_" .. var_204_10[1],
					Animator = var_204_10[2]
				},
				{
					BG = "map_" .. var_204_10[3] + var_204_8,
					Animator = var_204_10[4]
				}
			}
		else
			var_204_9 = {
				arg_204_0:GetMapElement(arg_204_1)
			}
		end

		return var_204_9
	end
end

function var_0_0.GetMapElement(arg_208_0, arg_208_1)
	local var_208_0 = arg_208_1:getConfig("bg")
	local var_208_1 = arg_208_1:getConfig("ani_controller")

	if var_208_1 and #var_208_1 > 0 then
		(function()
			local var_209_0 = getProxy(ChapterProxy)

			for iter_209_0, iter_209_1 in ipairs(var_208_1) do
				local var_209_1 = _.rest(iter_209_1[2], 2)

				for iter_209_2, iter_209_3 in ipairs(var_209_1) do
					if string.find(iter_209_3, "^map_") and iter_209_1[1] == var_0_3 then
						local var_209_2 = iter_209_1[2][1]
						local var_209_3 = false

						for iter_209_4, iter_209_5 in ipairs(var_209_2) do
							local var_209_4 = var_209_0:GetChapterItemById(iter_209_5)

							if var_209_4 and var_209_4:isClear() then
								var_209_3 = true

								break
							end
						end

						if not var_209_3 then
							var_208_0 = iter_209_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_208_2 = {
		BG = var_208_0
	}

	var_208_2.Animator, var_208_2.AnimatorController = arg_208_0:GetMapAnimator(arg_208_1)

	return var_208_2
end

function var_0_0.GetMapAnimator(arg_210_0, arg_210_1)
	local var_210_0 = arg_210_1:getConfig("ani_name")

	if arg_210_1:getConfig("animtor") == 1 and var_210_0 and #var_210_0 > 0 then
		local var_210_1 = arg_210_1:getConfig("ani_controller")

		if var_210_1 and #var_210_1 > 0 then
			(function()
				local var_211_0 = getProxy(ChapterProxy)

				for iter_211_0, iter_211_1 in ipairs(var_210_1) do
					local var_211_1 = _.rest(iter_211_1[2], 2)

					for iter_211_2, iter_211_3 in ipairs(var_211_1) do
						if string.find(iter_211_3, "^effect_") and iter_211_1[1] == var_0_3 then
							local var_211_2 = iter_211_1[2][1]
							local var_211_3 = false

							for iter_211_4, iter_211_5 in ipairs(var_211_2) do
								local var_211_4 = var_211_0:GetChapterItemById(iter_211_5)

								if var_211_4 and var_211_4:isClear() then
									var_211_3 = true

									break
								end
							end

							if not var_211_3 then
								var_210_0 = "map_" .. string.sub(iter_211_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_210_0, var_210_1
	end
end

function var_0_0.PlayMapTransition(arg_212_0, arg_212_1, arg_212_2, arg_212_3, arg_212_4)
	arg_212_0.mapTransitions = arg_212_0.mapTransitions or {}

	local var_212_0

	local function var_212_1()
		arg_212_0:frozen()
		existCall(arg_212_3, var_212_0)
		var_212_0:SetActive(true)

		local var_213_0 = tf(var_212_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_213_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})
		var_212_0:GetComponent(typeof(Animator)):Play(arg_212_2 and "Sequence" or "Inverted", -1, 0)
		var_213_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_214_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_213_0, arg_212_0._tf)
			existCall(arg_212_4, var_212_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_212_1, arg_212_1, var_212_0)

			arg_212_0.mapTransitions[arg_212_1] = false

			arg_212_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_212_1, arg_212_1, true, function(arg_215_0)
		var_212_0 = arg_215_0
		arg_212_0.mapTransitions[arg_212_1] = arg_215_0

		var_212_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_216_0)
	if arg_216_0.levelStageView then
		arg_216_0.levelStageView:Destroy()

		arg_216_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_217_0, arg_217_1)
	arg_217_0.levelAmbushView = LevelAmbushView.New(arg_217_0.topPanel, arg_217_0.event, arg_217_0.contextData)

	arg_217_0.levelAmbushView:Load()
	arg_217_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_217_1)
end

function var_0_0.hideAmbushInfo(arg_218_0)
	if arg_218_0.levelAmbushView then
		arg_218_0.levelAmbushView:Destroy()

		arg_218_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_219_0, arg_219_1)
	arg_219_0:frozen()

	local function var_219_0()
		arg_219_0.ambushWarning:SetActive(true)

		local var_220_0 = tf(arg_219_0.ambushWarning)

		var_220_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_220_0:SetSiblingIndex(1)

		local var_220_1 = var_220_0:GetComponent("DftAniEvent")

		var_220_1:SetTriggerEvent(function(arg_221_0)
			arg_219_1()
		end)
		var_220_1:SetEndEvent(function(arg_222_0)
			arg_219_0.ambushWarning:SetActive(false)
			arg_219_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_219_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_224_0)
			arg_224_0:SetActive(true)

			arg_219_0.ambushWarning = arg_224_0

			var_219_0()
		end)
	else
		var_219_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_225_0)
	if arg_225_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_225_0.ambushWarning)

		arg_225_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_226_0, arg_226_1)
	arg_226_0.levelStrategyView = LevelStrategyView.New(arg_226_0.topPanel, arg_226_0.event, arg_226_0.contextData)

	arg_226_0.levelStrategyView:Load()
	arg_226_0.levelStrategyView:ActionInvoke("set", arg_226_1)

	local function var_226_0()
		local var_227_0 = arg_226_0.contextData.chapterVO.fleet
		local var_227_1 = pg.strategy_data_template[arg_226_1.id]

		if not var_227_0:canUseStrategy(arg_226_1) then
			return
		end

		local var_227_2 = var_227_0:getNextStgUser(arg_226_1.id)

		if var_227_1.type == ChapterConst.StgTypeForm then
			arg_226_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_227_2,
				arg1 = arg_226_1.id
			})
		elseif var_227_1.type == ChapterConst.StgTypeConsume then
			arg_226_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_227_2,
				arg1 = arg_226_1.id
			})
		end

		arg_226_0:hideStrategyInfo()
	end

	local function var_226_1()
		arg_226_0:hideStrategyInfo()
	end

	arg_226_0.levelStrategyView:ActionInvoke("setCBFunc", var_226_0, var_226_1)
end

function var_0_0.hideStrategyInfo(arg_229_0)
	if arg_229_0.levelStrategyView then
		arg_229_0.levelStrategyView:Destroy()

		arg_229_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_230_0, arg_230_1)
	local var_230_0 = arg_230_0.contextData.chapterVO
	local var_230_1 = getProxy(ChapterProxy)
	local var_230_2
	local var_230_3
	local var_230_4
	local var_230_5
	local var_230_6 = var_230_1.repairTimes
	local var_230_7, var_230_8, var_230_9 = ChapterConst.GetRepairParams()

	arg_230_0.levelRepairView = LevelRepairView.New(arg_230_0.topPanel, arg_230_0.event, arg_230_0.contextData)

	arg_230_0.levelRepairView:Load()
	arg_230_0.levelRepairView:ActionInvoke("set", var_230_6, var_230_7, var_230_8, var_230_9)

	local function var_230_10()
		if var_230_7 - math.min(var_230_6, var_230_7) == 0 and arg_230_0.player:getTotalGem() < var_230_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_230_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_230_0.fleet.id,
			arg1 = arg_230_1.id
		})
		arg_230_0:hideRepairWindow()
	end

	local function var_230_11()
		arg_230_0:hideRepairWindow()
	end

	arg_230_0.levelRepairView:ActionInvoke("setCBFunc", var_230_10, var_230_11)
end

function var_0_0.hideRepairWindow(arg_233_0)
	if arg_233_0.levelRepairView then
		arg_233_0.levelRepairView:Destroy()

		arg_233_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_234_0, arg_234_1)
	arg_234_0.levelRemasterView:Load()

	local function var_234_0(arg_235_0)
		arg_234_0:ShowSelectedMap(arg_235_0)
	end

	arg_234_0.levelRemasterView:ActionInvoke("Show")
	arg_234_0.levelRemasterView:ActionInvoke("set", var_234_0, arg_234_1)
end

function var_0_0.hideRemasterPanel(arg_236_0)
	if arg_236_0.levelRemasterView:isShowing() then
		arg_236_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_237_0, arg_237_1)
	local var_237_0 = arg_237_0.contextData.chapterVO

	if not var_237_0 then
		return
	end

	arg_237_0:enableLevelCamera()
	setActive(arg_237_0.uiMain, true)

	arg_237_0.levelGrid.localEulerAngles = Vector3(var_237_0.theme.angle, 0, 0)
	arg_237_0.grid = LevelGrid.New(arg_237_0.dragLayer)

	arg_237_0.grid:attach(arg_237_0)
	arg_237_0.grid:ExtendItem("shipTpl", arg_237_0.shipTpl)
	arg_237_0.grid:ExtendItem("subTpl", arg_237_0.subTpl)
	arg_237_0.grid:ExtendItem("transportTpl", arg_237_0.transportTpl)
	arg_237_0.grid:ExtendItem("enemyTpl", arg_237_0.enemyTpl)
	arg_237_0.grid:ExtendItem("championTpl", arg_237_0.championTpl)
	arg_237_0.grid:ExtendItem("oniTpl", arg_237_0.oniTpl)
	arg_237_0.grid:ExtendItem("arrowTpl", arg_237_0.arrowTarget)
	arg_237_0.grid:ExtendItem("destinationMarkTpl", arg_237_0.destinationMarkTpl)

	function arg_237_0.grid.onShipStepChange(arg_238_0)
		arg_237_0.levelStageView:updateAmbushRate(arg_238_0)
	end

	arg_237_0.grid:initAll(arg_237_1)
end

function var_0_0.destroyGrid(arg_239_0)
	if arg_239_0.grid then
		arg_239_0.grid:detach()

		arg_239_0.grid = nil

		arg_239_0:disableLevelCamera()
		setActive(arg_239_0.dragLayer, true)
		setActive(arg_239_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_240_0, arg_240_1)
	arg_240_0:frozen()

	local function var_240_0()
		arg_240_0.radar:SetActive(true)

		local var_241_0 = tf(arg_240_0.radar)

		var_241_0:SetParent(arg_240_0.topPanel, false)
		var_241_0:SetSiblingIndex(1)
		var_241_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_242_0)
			arg_240_0.radar:SetActive(false)
			arg_240_0:unfrozen()
			arg_240_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_240_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_243_0)
			arg_243_0:SetActive(true)

			arg_240_0.radar = arg_243_0

			var_240_0()
		end)
	else
		var_240_0()
	end
end

function var_0_0.destroyTracking(arg_244_0)
	if arg_244_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_244_0.radar)

		arg_244_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_245_0, arg_245_1, arg_245_2, arg_245_3)
	local function var_245_0()
		arg_245_0.playing = true

		arg_245_0:frozen()
		arg_245_0.airStrike:SetActive(true)

		local var_246_0 = tf(arg_245_0.airStrike)

		var_246_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_246_0:SetAsLastSibling()
		setActive(var_246_0:Find("words/be_striked"), arg_245_1 == ChapterConst.SubjectChampion)
		setActive(var_246_0:Find("words/strike_enemy"), arg_245_1 == ChapterConst.SubjectPlayer)

		local function var_246_1()
			arg_245_0.playing = false

			SetActive(arg_245_0.airStrike, false)

			if arg_245_3 then
				arg_245_3()
			end

			arg_245_0:unfrozen()
		end

		var_246_0:GetComponent("DftAniEvent"):SetEndEvent(var_246_1)

		if arg_245_2 then
			onButton(arg_245_0, var_246_0, var_246_1, SFX_PANEL)
		else
			removeOnButton(var_246_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_245_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_248_0)
			arg_248_0:SetActive(true)

			arg_245_0.airStrike = arg_248_0

			var_245_0()
		end)
	else
		var_245_0()
	end
end

function var_0_0.destroyAirStrike(arg_249_0)
	if arg_249_0.airStrike then
		arg_249_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_249_0.airStrike)

		arg_249_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_250_0, arg_250_1, arg_250_2, arg_250_3)
	arg_250_0.uiAnims = arg_250_0.uiAnims or {}

	local var_250_0 = arg_250_0.uiAnims[arg_250_1]

	local function var_250_1()
		arg_250_0.playing = true

		arg_250_0:frozen()
		var_250_0:SetActive(true)

		local var_251_0 = tf(var_250_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_251_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_250_3 then
			arg_250_3(var_250_0)
		end

		var_251_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_252_0)
			arg_250_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_251_0, arg_250_0._tf)

			if arg_250_2 then
				arg_250_2(var_250_0)
			end

			arg_250_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_250_0 then
		PoolMgr.GetInstance():GetUI(arg_250_1, true, function(arg_253_0)
			arg_253_0:SetActive(true)

			arg_250_0.uiAnims[arg_250_1] = arg_253_0
			var_250_0 = arg_250_0.uiAnims[arg_250_1]

			var_250_1()
		end)
	else
		var_250_1()
	end
end

function var_0_0.destroyUIAnims(arg_254_0)
	if arg_254_0.uiAnims then
		for iter_254_0, iter_254_1 in pairs(arg_254_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_254_1), arg_254_0._tf)
			iter_254_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_254_0, iter_254_1)
		end

		arg_254_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_255_0, arg_255_1)
	local function var_255_0()
		arg_255_0.playing = true

		arg_255_0:frozen()
		arg_255_0.torpetoAni:SetActive(true)

		local var_256_0 = tf(arg_255_0.torpetoAni)

		var_256_0:SetParent(arg_255_0.topPanel, false)
		var_256_0:SetAsLastSibling()
		var_256_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_257_0)
			arg_255_0.playing = false

			SetActive(arg_255_0.torpetoAni, false)

			if arg_255_1 then
				arg_255_1()
			end

			arg_255_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_255_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_258_0)
			arg_258_0:SetActive(true)

			arg_255_0.torpetoAni = arg_258_0

			var_255_0()
		end)
	else
		var_255_0()
	end
end

function var_0_0.destroyTorpedo(arg_259_0)
	if arg_259_0.torpetoAni then
		arg_259_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_259_0.torpetoAni)

		arg_259_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_260_0, arg_260_1, arg_260_2, arg_260_3)
	arg_260_0.strikeAnims = arg_260_0.strikeAnims or {}

	local var_260_0
	local var_260_1
	local var_260_2

	local function var_260_3()
		if coroutine.status(var_260_2) == "suspended" then
			local var_261_0, var_261_1 = coroutine.resume(var_260_2)

			assert(var_261_0, debug.traceback(var_260_2, var_261_1))
		end
	end

	var_260_2 = coroutine.create(function()
		arg_260_0.playing = true

		arg_260_0:frozen()

		local var_262_0 = arg_260_0.strikeAnims[arg_260_2]

		setActive(var_262_0, true)

		local var_262_1 = tf(var_262_0)
		local var_262_2 = findTF(var_262_1, "torpedo")
		local var_262_3 = findTF(var_262_1, "mask/painting")
		local var_262_4 = findTF(var_262_1, "ship")

		setParent(var_260_0, var_262_3:Find("fitter"), false)
		setParent(var_260_1, var_262_4, false)
		setActive(var_262_4, false)
		setActive(var_262_2, false)
		var_262_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_262_1:SetAsLastSibling()

		local var_262_5 = var_262_1:GetComponent("DftAniEvent")
		local var_262_6 = var_260_1:GetComponent("SpineAnimUI")
		local var_262_7 = var_262_6:GetComponent("SkeletonGraphic")

		var_262_5:SetStartEvent(function(arg_263_0)
			var_262_6:SetAction("attack", 0)

			var_262_7.freeze = true
		end)
		var_262_5:SetTriggerEvent(function(arg_264_0)
			var_262_7.freeze = false

			var_262_6:SetActionCallBack(function(arg_265_0)
				if arg_265_0 == "action" then
					-- block empty
				elseif arg_265_0 == "finish" then
					var_262_7.freeze = true
				end
			end)
		end)
		var_262_5:SetEndEvent(function(arg_266_0)
			var_262_7.freeze = false

			var_260_3()
		end)
		onButton(arg_260_0, var_262_1, var_260_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_262_3, arg_260_1:getPainting())
		var_262_6:SetActionCallBack(nil)

		var_262_7.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_260_1:getPrefab(), var_260_1)
		setActive(var_262_0, false)

		arg_260_0.playing = false

		arg_260_0:unfrozen()

		if arg_260_3 then
			arg_260_3()
		end
	end)

	local function var_260_4()
		if arg_260_0.strikeAnims[arg_260_2] and var_260_0 and var_260_1 then
			var_260_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_260_1:getPainting(), true, function(arg_268_0)
		var_260_0 = arg_268_0

		ShipExpressionHelper.SetExpression(var_260_0, arg_260_1:getPainting())
		var_260_4()
	end)
	PoolMgr.GetInstance():GetSpineChar(arg_260_1:getPrefab(), true, function(arg_269_0)
		var_260_1 = arg_269_0
		var_260_1.transform.localScale = Vector3.one

		var_260_4()
	end)

	if not arg_260_0.strikeAnims[arg_260_2] then
		PoolMgr.GetInstance():GetUI(arg_260_2, true, function(arg_270_0)
			arg_260_0.strikeAnims[arg_260_2] = arg_270_0

			var_260_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_271_0)
	if arg_271_0.strikeAnims then
		for iter_271_0, iter_271_1 in pairs(arg_271_0.strikeAnims) do
			iter_271_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_271_0, iter_271_1)
		end

		arg_271_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_272_0, arg_272_1, arg_272_2, arg_272_3)
	arg_272_0.strikeAnims = arg_272_0.strikeAnims or {}

	local var_272_0
	local var_272_1

	local function var_272_2()
		if coroutine.status(var_272_1) == "suspended" then
			local var_273_0, var_273_1 = coroutine.resume(var_272_1)

			assert(var_273_0, debug.traceback(var_272_1, var_273_1))
		end
	end

	var_272_1 = coroutine.create(function()
		arg_272_0.playing = true

		arg_272_0:frozen()

		local var_274_0 = arg_272_0.strikeAnims[arg_272_2]

		setActive(var_274_0, true)

		local var_274_1 = tf(var_274_0)
		local var_274_2 = findTF(var_274_1, "torpedo")
		local var_274_3 = findTF(var_274_1, "ship")

		setParent(var_272_0, var_274_3, false)
		setActive(var_274_3, false)
		setActive(var_274_2, false)
		var_274_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_274_1:SetAsLastSibling()

		local var_274_4 = var_274_1:GetComponent("DftAniEvent")
		local var_274_5 = var_272_0:GetComponent("SpineAnimUI")
		local var_274_6 = var_274_5:GetComponent("SkeletonGraphic")

		var_274_4:SetStartEvent(function(arg_275_0)
			var_274_5:SetAction("attack", 0)

			var_274_6.freeze = true
		end)
		var_274_4:SetTriggerEvent(function(arg_276_0)
			var_274_6.freeze = false

			var_274_5:SetActionCallBack(function(arg_277_0)
				if arg_277_0 == "action" then
					-- block empty
				elseif arg_277_0 == "finish" then
					var_274_6.freeze = true
				end
			end)
		end)
		var_274_4:SetEndEvent(function(arg_278_0)
			var_274_6.freeze = false

			var_272_2()
		end)
		onButton(arg_272_0, var_274_1, var_272_2, SFX_CANCEL)
		coroutine.yield()
		var_274_5:SetActionCallBack(nil)

		var_274_6.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_272_1:getPrefab(), var_272_0)
		setActive(var_274_0, false)

		arg_272_0.playing = false

		arg_272_0:unfrozen()

		if arg_272_3 then
			arg_272_3()
		end
	end)

	local function var_272_3()
		if arg_272_0.strikeAnims[arg_272_2] and var_272_0 then
			var_272_2()
		end
	end

	PoolMgr.GetInstance():GetSpineChar(arg_272_1:getPrefab(), true, function(arg_280_0)
		var_272_0 = arg_280_0
		var_272_0.transform.localScale = Vector3.one

		var_272_3()
	end)

	if not arg_272_0.strikeAnims[arg_272_2] then
		PoolMgr.GetInstance():GetUI(arg_272_2, true, function(arg_281_0)
			arg_272_0.strikeAnims[arg_272_2] = arg_281_0

			var_272_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_282_0, arg_282_1, arg_282_2)
	arg_282_0:frozen()
	setActive(arg_282_0.commanderTinkle, true)

	local var_282_0 = arg_282_1:getSkills()

	setText(arg_282_0.commanderTinkle:Find("name"), #var_282_0 > 0 and var_282_0[1]:getConfig("name") or "")
	setImageSprite(arg_282_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_282_1:getConfig("painting"), ""))

	local var_282_1 = arg_282_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_282_1.alpha = 0

	local var_282_2 = Vector2(248, 237)

	LeanTween.value(go(arg_282_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_283_0)
		local var_283_0 = arg_282_0.commanderTinkle.localPosition

		var_283_0.x = var_282_2.x + -100 * (1 - arg_283_0)
		arg_282_0.commanderTinkle.localPosition = var_283_0
		var_282_1.alpha = arg_283_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_282_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_284_0)
		local var_284_0 = arg_282_0.commanderTinkle.localPosition

		var_284_0.x = var_282_2.x + 100 * arg_284_0
		arg_282_0.commanderTinkle.localPosition = var_284_0
		var_282_1.alpha = 1 - arg_284_0
	end)):setOnComplete(System.Action(function()
		if arg_282_2 then
			arg_282_2()
		end

		arg_282_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_286_0, arg_286_1, arg_286_2, arg_286_3)
	local var_286_0 = arg_286_0.grid:shakeCell(arg_286_1)

	if not var_286_0 then
		arg_286_3()

		return
	end

	arg_286_0:easeDamage(var_286_0, arg_286_2, function()
		arg_286_3()
	end)
end

function var_0_0.easeDamage(arg_288_0, arg_288_1, arg_288_2, arg_288_3)
	arg_288_0:frozen()

	local var_288_0 = arg_288_0.levelCam:WorldToScreenPoint(arg_288_1.position)
	local var_288_1 = tf(arg_288_0:GetDamageText())

	var_288_1.position = arg_288_0.uiCam:ScreenToWorldPoint(var_288_0)

	local var_288_2 = var_288_1.localPosition

	var_288_2.y = var_288_2.y + 40
	var_288_2.z = 0

	setText(var_288_1, arg_288_2)

	var_288_1.localPosition = var_288_2

	LeanTween.value(go(var_288_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_289_0)
		local var_289_0 = var_288_1.localPosition

		var_289_0.y = var_288_2.y + 60 * arg_289_0
		var_288_1.localPosition = var_289_0

		setTextAlpha(var_288_1, 1 - arg_289_0)
	end)):setOnComplete(System.Action(function()
		arg_288_0:ReturnDamageText(var_288_1)
		arg_288_0:unfrozen()

		if arg_288_3 then
			arg_288_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_291_0, arg_291_1, arg_291_2)
	arg_291_0:frozen()

	local var_291_0 = arg_291_0.levelCam:WorldToScreenPoint(arg_291_1)

	arg_291_0.avoidText.position = arg_291_0.uiCam:ScreenToWorldPoint(var_291_0)

	local var_291_1 = arg_291_0.avoidText.localPosition

	var_291_1.z = 0
	arg_291_0.avoidText.localPosition = var_291_1

	setActive(arg_291_0.avoidText, true)

	local var_291_2 = arg_291_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_291_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_292_0)
		local var_292_0 = arg_291_0.avoidText.localPosition

		var_292_0.y = var_291_1.y + 100 * arg_292_0
		arg_291_0.avoidText.localPosition = var_292_0

		setImageAlpha(arg_291_0.avoidText, 1 - arg_292_0)
		setImageAlpha(var_291_2, 1 - arg_292_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_291_0.avoidText, false)
		arg_291_0:unfrozen()

		if arg_291_2 then
			arg_291_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_294_0)
	local var_294_0 = table.remove(arg_294_0.damageTextPool)

	if not var_294_0 then
		var_294_0 = Instantiate(arg_294_0.damageTextTemplate)

		local var_294_1 = tf(arg_294_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_294_0, tf(arg_294_0.damageTextTemplate).parent)
		tf(var_294_0):SetSiblingIndex(var_294_1 + 1)
	end

	table.insert(arg_294_0.damageTextActive, var_294_0)
	setActive(var_294_0, true)

	return var_294_0
end

function var_0_0.ReturnDamageText(arg_295_0, arg_295_1)
	assert(arg_295_1)

	if not arg_295_1 then
		return
	end

	arg_295_1 = go(arg_295_1)

	table.removebyvalue(arg_295_0.damageTextActive, arg_295_1)
	table.insert(arg_295_0.damageTextPool, arg_295_1)
	setActive(arg_295_1, false)
end

function var_0_0.resetLevelGrid(arg_296_0)
	arg_296_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_297_0, arg_297_1)
	setActive(arg_297_0.curtain, arg_297_1)
end

function var_0_0.frozen(arg_298_0)
	local var_298_0 = arg_298_0.frozenCount

	arg_298_0.frozenCount = arg_298_0.frozenCount + 1
	arg_298_0.canvasGroup.blocksRaycasts = arg_298_0.frozenCount == 0

	if var_298_0 == 0 and arg_298_0.frozenCount ~= 0 then
		arg_298_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_299_0, arg_299_1)
	if arg_299_0.exited then
		return
	end

	local var_299_0 = arg_299_0.frozenCount
	local var_299_1 = arg_299_1 == -1 and arg_299_0.frozenCount or arg_299_1 or 1

	arg_299_0.frozenCount = arg_299_0.frozenCount - var_299_1
	arg_299_0.canvasGroup.blocksRaycasts = arg_299_0.frozenCount == 0

	if var_299_0 ~= 0 and arg_299_0.frozenCount == 0 then
		arg_299_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_300_0)
	return arg_300_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_301_0)
	arg_301_0.levelCamIndices = math.max(arg_301_0.levelCamIndices - 1, 0)

	if arg_301_0.levelCamIndices == 0 then
		arg_301_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.disableLevelCamera(arg_302_0)
	arg_302_0.levelCamIndices = arg_302_0.levelCamIndices + 1

	if arg_302_0.levelCamIndices > 0 then
		arg_302_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.RecordTween(arg_303_0, arg_303_1, arg_303_2)
	arg_303_0.tweens[arg_303_1] = arg_303_2
end

function var_0_0.DeleteTween(arg_304_0, arg_304_1)
	local var_304_0 = arg_304_0.tweens[arg_304_1]

	if var_304_0 then
		LeanTween.cancel(var_304_0)

		arg_304_0.tweens[arg_304_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_305_0, arg_305_1, arg_305_2, arg_305_3)
	local var_305_0 = arg_305_2.id

	arg_305_0.levelCMDFormationView:setCallback(function(arg_306_0)
		if not arg_305_3 then
			if arg_306_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_305_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_306_0.skill)
			elseif arg_306_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_305_0.contextData.commanderSelected = {
					chapterId = var_305_0,
					fleetId = arg_305_1.id
				}

				arg_305_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_306_0.pos, arg_305_1.id, arg_305_2)
				arg_305_0:closeCommanderPanel()
			else
				arg_305_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_306_0,
					fleetId = arg_305_1.id,
					chapterId = var_305_0
				}, arg_305_2)
			end
		elseif arg_306_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_305_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_306_0.skill)
		elseif arg_306_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_305_0.contextData.eliteCommanderSelected = {
				index = arg_305_3,
				pos = arg_306_0.pos,
				chapterId = var_305_0
			}

			arg_305_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_305_3, arg_306_0.pos, arg_305_2)
			arg_305_0:closeCommanderPanel()
		else
			arg_305_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_306_0,
				index = arg_305_3,
				chapterId = var_305_0
			}, arg_305_2)
		end
	end)
	arg_305_0.levelCMDFormationView:Load()
	arg_305_0.levelCMDFormationView:ActionInvoke("update", arg_305_1, arg_305_0.commanderPrefabs)
	arg_305_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_307_0)
	if arg_307_0.levelCMDFormationView:isShowing() then
		arg_307_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_307_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_308_0)
	arg_308_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_309_0)
	arg_309_0.levelCMDFormationView:Destroy()

	arg_309_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_310_0, arg_310_1)
	arg_310_0.spTickets = arg_310_1
end

function var_0_0.HandleShowMsgBox(arg_311_0, arg_311_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_311_1)
end

function var_0_0.updatePoisonAreaTip(arg_312_0)
	local var_312_0 = arg_312_0.contextData.chapterVO
	local var_312_1 = (function(arg_313_0)
		local var_313_0 = {}
		local var_313_1 = pg.map_event_list[var_312_0.id] or {}
		local var_313_2

		if var_312_0:isLoop() then
			var_313_2 = var_313_1.event_list_loop or {}
		else
			var_313_2 = var_313_1.event_list or {}
		end

		for iter_313_0, iter_313_1 in ipairs(var_313_2) do
			local var_313_3 = pg.map_event_template[iter_313_1]

			if var_313_3.c_type == arg_313_0 then
				table.insert(var_313_0, var_313_3)
			end
		end

		return var_313_0
	end)(ChapterConst.EvtType_Poison)

	if var_312_1 then
		for iter_312_0, iter_312_1 in ipairs(var_312_1) do
			local var_312_2 = iter_312_1.round_gametip

			if var_312_2 ~= nil and var_312_2 ~= "" and var_312_0:getRoundNum() == var_312_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_312_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_314_0)
	setActive(arg_314_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_315_0)
	local var_315_0 = getProxy(ChapterProxy)

	if var_315_0 and not arg_315_0.contextData.noRecord then
		local var_315_1 = arg_315_0.contextData.map

		if not var_315_1 then
			return
		end

		if var_315_1:NeedRecordMap() then
			var_315_0:recordLastMap(ChapterProxy.LAST_MAP, var_315_1.id)
		end

		if var_315_1:isActivity() and not var_315_1:isActExtra() then
			var_315_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, var_315_1.id)
		end
	end
end

function var_0_0.IsActShopActive(arg_316_0)
	local var_316_0 = arg_316_0.contextData.map and getProxy(ActivityProxy):getActivityById(arg_316_0.contextData.map:getConfig("on_activity")) or nil
	local var_316_1 = var_316_0 and not var_316_0:isEnd() and var_316_0:GetConfigClientSetting("PTID")
	local var_316_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_316_2 and not var_316_2:isEnd() and var_316_2:getConfig("config_client").resId == var_316_1 then
		return true
	end

	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_317_0)
		return not arg_317_0:isEnd() and arg_317_0:getConfig("config_client").pt_id == var_316_1
	end) then
		return true
	end
end

function var_0_0.willExit(arg_318_0)
	arg_318_0:ClearMapTransitions()
	arg_318_0.loader:Clear()

	if arg_318_0.contextData.chapterVO then
		pg.UIMgr.GetInstance():UnblurPanel(arg_318_0.topPanel, arg_318_0._tf)
		pg.playerResUI:SetActive({
			active = false
		})
	end

	if arg_318_0.levelFleetView and arg_318_0.levelFleetView.selectIds then
		arg_318_0.contextData.selectedFleetIDs = {}

		for iter_318_0, iter_318_1 in pairs(arg_318_0.levelFleetView.selectIds) do
			for iter_318_2, iter_318_3 in pairs(iter_318_1) do
				arg_318_0.contextData.selectedFleetIDs[#arg_318_0.contextData.selectedFleetIDs + 1] = iter_318_3
			end
		end
	end

	arg_318_0:destroyChapterPanel()
	arg_318_0:DestroyLevelInfoSPPanel()
	arg_318_0:destroyFleetEdit()
	arg_318_0:destroyCommanderPanel()
	arg_318_0:DestroyLevelStageView()
	arg_318_0:hideRepairWindow()
	arg_318_0:hideStrategyInfo()
	arg_318_0:hideRemasterPanel()
	arg_318_0:hideSpResult()
	arg_318_0:destroyGrid()
	arg_318_0:destroyAmbushWarn()
	arg_318_0:destroyAirStrike()
	arg_318_0:destroyTorpedo()
	arg_318_0:destroyStrikeAnim()
	arg_318_0:destroyTracking()
	arg_318_0:destroyUIAnims()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_318_4, iter_318_5 in pairs(arg_318_0.mbDict) do
		iter_318_5:Destroy()
	end

	arg_318_0.mbDict = nil

	for iter_318_6, iter_318_7 in pairs(arg_318_0.tweens) do
		LeanTween.cancel(iter_318_7)
	end

	arg_318_0.tweens = nil

	if arg_318_0.cloudTimer then
		_.each(arg_318_0.cloudTimer, function(arg_319_0)
			LeanTween.cancel(arg_319_0)
		end)

		arg_318_0.cloudTimer = nil
	end

	if arg_318_0.newChapterCDTimer then
		arg_318_0.newChapterCDTimer:Stop()

		arg_318_0.newChapterCDTimer = nil
	end

	for iter_318_8, iter_318_9 in ipairs(arg_318_0.damageTextActive) do
		LeanTween.cancel(iter_318_9)
	end

	LeanTween.cancel(go(arg_318_0.avoidText))

	arg_318_0.map.localScale = Vector3.one
	arg_318_0.map.pivot = Vector2(0.5, 0.5)
	arg_318_0.float.localScale = Vector3.one
	arg_318_0.float.pivot = Vector2(0.5, 0.5)

	for iter_318_10, iter_318_11 in ipairs(arg_318_0.mapTFs) do
		clearImageSprite(iter_318_11)
	end

	_.each(arg_318_0.cloudRTFs, function(arg_320_0)
		clearImageSprite(arg_320_0)
	end)
	Destroy(arg_318_0.enemyTpl)
	arg_318_0:RecordLastMapOnExit()
	arg_318_0.levelRemasterView:Destroy()
end

return var_0_0
