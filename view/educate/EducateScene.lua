local var_0_0 = class("EducateScene", import(".base.EducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EducateUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	pg.PerformMgr.GetInstance():CheckLoad(function()
		arg_2_1()
	end)
end

function var_0_0.getResource(arg_4_0)
	local var_4_0 = var_0_0.super.getResource(arg_4_0)
	local var_4_1 = {
		"ui/EducateDatePanel",
		"ui/EducateFavorPanel",
		"ui/EducateResPanel",
		"ui/EducateTopPanel",
		"ui/EducateTargetPanel",
		"ui/EducateBottomPanel",
		"ui/EducateArchivePanel",
		"ui/educatecommonui_atlas"
	}

	local function var_4_2(arg_5_0)
		if noEmptyStr(arg_5_0) and not table.contains(var_4_1, arg_5_0) then
			table.insert(var_4_1, arg_5_0)
		end
	end

	local var_4_3 = getProxy(EducateProxy)
	local var_4_4 = var_4_3 and var_4_3:GetCharData()

	if var_4_4 then
		for iter_4_0, iter_4_1 in ipairs(var_4_4:getConfig("background_prefab") or {}) do
			var_4_2("bg/" .. iter_4_1)
		end

		local var_4_5 = {}

		for iter_4_2, iter_4_3 in ipairs(var_4_4:getConfig("char_prefab") or {}) do
			local var_4_6 = iter_4_3[3]

			if noEmptyStr(var_4_6) and not var_4_5[var_4_6] then
				var_4_5[var_4_6] = true

				PaintingGroupConst.AddPaintingNameWithFilteMap(var_4_1, var_4_6)
				var_4_2("paintingface/" .. var_4_6)
				var_4_2("educateavatar/" .. var_4_6)
				var_4_2("squareicon/" .. var_4_6)
			end
		end

		local var_4_7 = var_4_4:getConfig("bgm") or {}

		for iter_4_4, iter_4_5 in ipairs(var_4_7) do
			if type(iter_4_5) == "string" then
				var_4_2("cue/bgm-" .. iter_4_5 .. ".b")
			elseif type(iter_4_5) == "table" then
				for iter_4_6, iter_4_7 in ipairs(iter_4_5) do
					if type(iter_4_7) == "table" then
						var_4_2("cue/bgm-" .. iter_4_7[2] .. ".b")
					end
				end
			end
		end
	end

	if var_4_3 then
		for iter_4_8, iter_4_9 in ipairs(var_4_3:GetBuffList() or {}) do
			var_4_2("educateprops/" .. iter_4_9:getConfig("icon"))
		end
	end

	for iter_4_10, iter_4_11 in ipairs(var_4_1) do
		if not table.contains(var_4_0, iter_4_11) then
			table.insert(var_4_0, iter_4_11)
		end
	end

	return var_4_0
end

function var_0_0.init(arg_6_0)
	arg_6_0:initData()
	arg_6_0:findUI()
	arg_6_0:addListener()
end

function var_0_0.PlayBGM(arg_7_0)
	local var_7_0 = getProxy(EducateProxy):GetCharData():GetBgm()

	if var_7_0 then
		pg.BgmMgr.GetInstance():Push(arg_7_0.__cname, var_7_0)
	end
end

function var_0_0.initData(arg_8_0)
	return
end

function var_0_0.findUI(arg_9_0)
	arg_9_0.mainAnim = arg_9_0._tf:Find("anim_root"):GetComponent(typeof(Animation))
	arg_9_0.bgTF = arg_9_0._tf:Find("anim_root/bg")
	arg_9_0.blurPanel = arg_9_0._tf:Find("anim_root/blur_panel")
	arg_9_0.blurPanelAnim = arg_9_0.blurPanel:GetComponent(typeof(Animation))
	arg_9_0.topTF = arg_9_0.blurPanel:Find("top")
	arg_9_0.favorBtn = arg_9_0.topTF:Find("favor")
	arg_9_0.favorLvTF = arg_9_0.favorBtn:Find("anim_root/Text")
	arg_9_0.favorMaxTF = arg_9_0.favorBtn:Find("anim_root/max")
	arg_9_0.favorBtnAnim = arg_9_0.favorBtn:Find("anim_root"):GetComponent(typeof(Animation))
	arg_9_0.favorBtnAnimEvent = arg_9_0.favorBtn:Find("anim_root"):GetComponent(typeof(DftAniEvent))

	arg_9_0.favorBtnAnimEvent:SetTriggerEvent(function()
		arg_9_0:updateFavorBtn()
	end)

	arg_9_0.mainTF = arg_9_0._tf:Find("anim_root/main")
	arg_9_0.paintTF = arg_9_0.mainTF:Find("painting")
	arg_9_0.dialogueTF = arg_9_0.blurPanel:Find("dialogue")
	arg_9_0.dialogueContent = arg_9_0.dialogueTF:Find("content")

	setActive(arg_9_0.dialogueTF, false)

	arg_9_0.bubbleTF = arg_9_0._tf:Find("anim_root/blur_panel/bubble")

	setActive(arg_9_0.bubbleTF, false)

	arg_9_0.bubbleBtn = arg_9_0.bubbleTF:Find("bubble")
	arg_9_0.optionsTF = arg_9_0.mainTF:Find("options")
	arg_9_0.chatBtn = arg_9_0.optionsTF:Find("options/chat")
	arg_9_0.giftBtn = arg_9_0.optionsTF:Find("options/gift")

	setActive(arg_9_0.optionsTF, false)

	arg_9_0.bottomTF = arg_9_0.blurPanel:Find("bottom")
	arg_9_0.bookBtn = arg_9_0.bottomTF:Find("left/btns/book")

	setText(arg_9_0.bookBtn:Find("unlock/Text"), i18n("child_btn_collect"))

	arg_9_0.mindBtn = arg_9_0.bottomTF:Find("left/btns/mind")

	setText(arg_9_0.mindBtn:Find("unlock/Text"), i18n("child_btn_mind"))

	arg_9_0.bagBtn = arg_9_0.bottomTF:Find("left/btns/bag")

	setText(arg_9_0.bagBtn:Find("unlock/Text"), i18n("child_btn_bag"))

	arg_9_0.datePanel = EducateDatePanel.New(arg_9_0.topTF:Find("date"), arg_9_0.event, {
		isMain = true
	})

	arg_9_0.datePanel:RegisterView(arg_9_0)

	arg_9_0.favorPanel = EducateFavorPanel.New(arg_9_0.topTF:Find("favor_panel"), arg_9_0.event)

	arg_9_0.favorPanel:RegisterView(arg_9_0)

	arg_9_0.resPanel = EducateResPanel.New(arg_9_0.topTF:Find("res"), arg_9_0.event)

	arg_9_0.resPanel:RegisterView(arg_9_0)

	arg_9_0.topPanel = EducateTopPanel.New(arg_9_0.topTF:Find("top_right"), arg_9_0.event)

	arg_9_0.topPanel:RegisterView(arg_9_0)

	arg_9_0.targetPanel = EducateTargetPanel.New(arg_9_0.topTF:Find("target"), arg_9_0.event)

	arg_9_0.targetPanel:RegisterView(arg_9_0)

	arg_9_0.bottomPanel = EducateBottomPanel.New(arg_9_0.bottomTF:Find("right"), arg_9_0.event, {
		isMainEnter = arg_9_0.contextData.isMainEnter
	})

	arg_9_0.bottomPanel:RegisterView(arg_9_0)

	arg_9_0.archivePanel = EducateArchivePanel.New(arg_9_0.mainTF:Find("archive_panel"), arg_9_0.event, {
		isShow = true,
		isMainEnter = arg_9_0.contextData.isMainEnter
	})

	arg_9_0.archivePanel:RegisterView(arg_9_0)
end

function var_0_0._loadSubViews(arg_11_0)
	arg_11_0.datePanel:Load()
	arg_11_0.favorPanel:Load()
	arg_11_0.resPanel:Load()
	arg_11_0.topPanel:Load()
	arg_11_0.targetPanel:Load()
	arg_11_0.bottomPanel:Load()
	arg_11_0.archivePanel:Load()
	arg_11_0:OverlayPanel(arg_11_0.blurPanel, {
		pbList = {
			arg_11_0.blurPanel:Find("bottom/left")
		}
	})

	local var_11_0 = arg_11_0.contextData.isMainEnter and "anim_educate_educateUI_bg_in" or "anim_educate_educateUI_bg_show"

	arg_11_0.mainAnim:Play(var_11_0)

	local var_11_1 = arg_11_0.contextData.isMainEnter and "anim_educate_educateUI_in" or "anim_educate_educateUI_show"

	arg_11_0.blurPanelAnim:Play(var_11_1)
end

function var_0_0.addListener(arg_12_0)
	onButton(arg_12_0, arg_12_0.chatBtn, function()
		pg.TipsMgr.GetInstance():ShowTips("触发对话[待开发]...")
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.giftBtn, function()
		pg.TipsMgr.GetInstance():ShowTips("送礼(?)...")
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.favorBtn, function()
		arg_12_0.favorPanel:Show()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.bookBtn, function()
		arg_12_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
			mediator = EducateCollectEntranceMediator,
			viewComponent = EducateCollectEntranceLayer
		}))
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.mindBtn, function()
		if isActive(arg_12_0.mindBtn:Find("lock")) then
			return
		end

		arg_12_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
			mediator = EducateMindMediator,
			viewComponent = EducateMindLayer,
			data = {
				onExit = function()
					arg_12_0:checkBubbleShow()
				end
			}
		}))
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.bagBtn, function()
		if isActive(arg_12_0.bagBtn:Find("lock")) then
			return
		end

		arg_12_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
			mediator = EducateBagMediator,
			viewComponent = EducateBagLayer
		}))
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.paintTF:Find("fitter"), function()
		arg_12_0:ShowDialogue()
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_21_0)
	if arg_21_0.contextData.onEnter then
		arg_21_0.contextData.onEnter()

		arg_21_0.contextData.onEnter = nil
	end

	arg_21_0:updatePaintingUI()
	arg_21_0:updateUnlockBtns()
	arg_21_0:updateNewTips()
	arg_21_0:updateMindTip()
	arg_21_0:updateFavorBtn()
	arg_21_0:SeriesCheck()
end

function var_0_0.SeriesCheck(arg_22_0)
	local var_22_0 = {}

	table.insert(var_22_0, function(arg_23_0)
		arg_22_0:CheckNewChar(arg_23_0)
	end)
	table.insert(var_22_0, function(arg_24_0)
		if getProxy(EducateProxy):GetPlanProxy():CheckExcute() then
			arg_22_0:emit(EducateMediator.ON_EXECTUE_PLANS)
		else
			arg_24_0()
		end
	end)
	table.insert(var_22_0, function(arg_25_0)
		arg_22_0:CheckTips(arg_25_0)
	end)
	table.insert(var_22_0, function(arg_26_0)
		if getProxy(EducateProxy):GetEventProxy():NeedGetHomeEventData() then
			arg_22_0:emit(EducateMediator.ON_GET_EVENT, arg_26_0)
		else
			arg_26_0()
		end
	end)
	arg_22_0:checkBubbleShow()
	table.insert(var_22_0, function(arg_27_0)
		if not arg_22_0.contextData.ingoreGuideCheck then
			EducateGuideSequence.CheckGuide(arg_22_0.__cname, arg_27_0)
		else
			arg_22_0.contextData.ingoreGuideCheck = nil

			arg_27_0()
		end
	end)
	seriesAsync(var_22_0, function()
		return
	end)
end

function var_0_0.OnCheckGuide(arg_29_0, arg_29_1)
	EducateGuideSequence.CheckGuide(arg_29_0.__cname, function()
		existCall(arg_29_1)
	end)
end

function var_0_0.CheckTips(arg_31_0, arg_31_1)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in ipairs(EducateTipHelper.GetSystemUnlockTips()) do
		table.insert(var_31_0, function(arg_32_0)
			arg_31_0:emit(var_0_0.EDUCATE_ON_UNLOCK_TIP, {
				type = EducateUnlockTipLayer.UNLOCK_TYPE_SYSTEM,
				single = iter_31_1,
				onExit = arg_32_0
			})
		end)
	end

	seriesAsync(var_31_0, function()
		arg_31_1()
	end)
end

function var_0_0.CheckNewChar(arg_34_0, arg_34_1)
	if getProxy(EducateProxy):GetCharData():GetCallName() == "" then
		setActive(arg_34_0._tf, false)

		local var_34_0 = {}

		table.insert(var_34_0, function(arg_35_0)
			pg.PerformMgr.GetInstance():PlayGroup(EducateConst.FIRST_ENTER_PERFORM_IDS, arg_35_0)
		end)
		table.insert(var_34_0, function(arg_36_0)
			arg_34_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
				mediator = EducateNewCharMediator,
				viewComponent = EducateNewCharLayer,
				data = {
					callback = arg_36_0
				}
			}))
		end)
		table.insert(var_34_0, function(arg_37_0)
			pg.PerformMgr.GetInstance():PlayOne(EducateConst.AFTER_SET_CALLNAME_PERFORM_ID, arg_37_0)
		end)
		seriesAsync(var_34_0, function()
			setActive(arg_34_0._tf, true)
			arg_34_0:_loadSubViews()
			arg_34_1()
		end)
	else
		arg_34_0:_loadSubViews()
		arg_34_1()
	end
end

function var_0_0.showBubble(arg_39_0, arg_39_1)
	setActive(arg_39_0.bubbleTF, true)
	onButton(arg_39_0, arg_39_0.bubbleBtn, function()
		arg_39_1()
		setActive(arg_39_0.bubbleTF, false)
	end, SFX_PANEL)
end

function var_0_0.PlayPerformWithDrops(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0 = EducateHelper.GetDialogueShowDrops(arg_41_2)
	local var_41_1 = EducateHelper.GetCommonShowDrops(arg_41_2)

	local function var_41_2()
		if #var_41_1 > 0 then
			arg_41_0:emit(var_0_0.EDUCATE_ON_AWARD, {
				items = var_41_1,
				removeFunc = function()
					if arg_41_3 then
						arg_41_3()
					end
				end
			})
		elseif arg_41_3 then
			arg_41_3()
		end
	end

	if #arg_41_1 > 0 then
		pg.PerformMgr.GetInstance():PlayGroup(arg_41_1, var_41_2, var_41_0)
	elseif var_41_2 then
		var_41_2()
	end
end

function var_0_0.ShowFavorUpgrade(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	arg_44_0:PlayPerformWithDrops(arg_44_2, arg_44_1, function()
		if #arg_44_1 > 0 then
			arg_44_0:emit(var_0_0.EDUCATE_ON_AWARD, {
				items = arg_44_1,
				removeFunc = function()
					arg_44_0.favorBtnAnim:Play("anim_educate_favor_levelup")

					if arg_44_3 then
						arg_44_3()
					end
				end
			})
		else
			arg_44_0.favorBtnAnim:Play("anim_educate_favor_levelup")

			if arg_44_3 then
				arg_44_3()
			end
		end
	end)
end

function var_0_0.ShowSpecialEvent(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = pg.child_event_special[arg_47_1].performance

	arg_47_0:PlayPerformWithDrops(var_47_0, arg_47_2, function()
		if #arg_47_2 > 0 then
			arg_47_0:emit(var_0_0.EDUCATE_ON_AWARD, {
				items = arg_47_2,
				removeFunc = function()
					if arg_47_3 then
						arg_47_3()
					end
				end
			})
		elseif arg_47_3 then
			arg_47_3()
		end
	end)
end

function var_0_0.checkBubbleShow(arg_50_0)
	local var_50_0 = getProxy(EducateProxy):GetEventProxy():GetHomeSpecEvents()
	local var_50_1 = getProxy(EducateProxy):GetCharData()

	if #var_50_0 > 0 then
		setActive(arg_50_0.bubbleBtn:Find("Text"), true)
		setActive(arg_50_0.bubbleBtn:Find("Image"), false)
		arg_50_0:showBubble(function()
			arg_50_0:emit(EducateMediator.ON_SPECIAL_EVENT_TRIGGER, {
				id = var_50_0[1].id,
				callback = function()
					arg_50_0:checkBubbleShow()
					EducateGuideSequence.CheckGuide(arg_50_0.__cname, function()
						return
					end)
				end
			})
		end)
	elseif var_50_1:CheckFavor() then
		setActive(arg_50_0.bubbleBtn:Find("Text"), false)
		setActive(arg_50_0.bubbleBtn:Find("Image"), true)
		arg_50_0:showBubble(function()
			arg_50_0:emit(EducateMediator.ON_UPGRADE_FAVOR, function()
				arg_50_0:checkBubbleShow()
				EducateGuideSequence.CheckGuide(arg_50_0.__cname, function()
					return
				end)
			end)
		end)
	else
		setActive(arg_50_0.bubbleTF, false)
		removeOnButton(arg_50_0.bubbleTF)
	end
end

function var_0_0.updateResPanel(arg_57_0)
	arg_57_0.resPanel:Flush()
end

function var_0_0.updateArchivePanel(arg_58_0)
	arg_58_0.archivePanel:Flush()
end

function var_0_0.showArchivePanel(arg_59_0)
	arg_59_0.archivePanel:showPanel()
end

function var_0_0.updateDatePanel(arg_60_0)
	arg_60_0.datePanel:Flush()
	arg_60_0:updateUnlockBtns()
end

function var_0_0.updateUnlockBtns(arg_61_0)
	local var_61_0 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_MEMORY)

	setActive(arg_61_0.bookBtn:Find("lock"), not var_61_0)
	setActive(arg_61_0.bookBtn:Find("unlock"), var_61_0)

	local var_61_1 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_BAG)

	setActive(arg_61_0.bagBtn:Find("lock"), not var_61_1)
	setActive(arg_61_0.bagBtn:Find("unlock"), var_61_1)

	local var_61_2 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_FAVOR_AND_MIND)

	setActive(arg_61_0.mindBtn:Find("lock"), not var_61_2)
	setActive(arg_61_0.mindBtn:Find("unlock"), var_61_2)
	setActive(arg_61_0.favorBtn, var_61_2)
end

function var_0_0.updateMindTip(arg_62_0)
	setActive(arg_62_0.mindBtn:Find("unlock/tip"), getProxy(EducateProxy):GetTaskProxy():IsShowMindTasksTip())
end

function var_0_0.updateWeekDay(arg_63_0, arg_63_1)
	arg_63_0.datePanel:UpdateWeekDay(arg_63_1)
end

function var_0_0.updateFavorBtn(arg_64_0)
	local var_64_0 = getProxy(EducateProxy):GetCharData()
	local var_64_1 = var_64_0:GetFavor()

	setText(arg_64_0.favorLvTF, var_64_1.lv)

	local var_64_2 = var_64_0:GetFavorMaxLv()

	setActive(arg_64_0.favorMaxTF, var_64_1.lv == var_64_2)
end

function var_0_0.updateTargetPanel(arg_65_0)
	arg_65_0.targetPanel:Flush()
end

function var_0_0.updateBottomPanel(arg_66_0)
	arg_66_0.bottomPanel:Flush()
end

function var_0_0.updatePaintingUI(arg_67_0)
	local var_67_0 = getProxy(EducateProxy):GetCharData()

	arg_67_0.bgName = var_67_0:GetBGName()
	arg_67_0.paintingName = var_67_0:GetPaintingName()
	arg_67_0.wordList, arg_67_0.faceList = var_67_0:GetMainDialogueInfo()

	local var_67_1 = LoadSprite("bg/" .. arg_67_0.bgName)

	setImageSprite(arg_67_0.bgTF, var_67_1, false)
	setPaintingPrefab(arg_67_0.paintTF, arg_67_0.paintingName, "yangcheng")
end

function var_0_0.ShowDialogue(arg_68_0)
	if LeanTween.isTweening(arg_68_0.dialogueTF) then
		return
	end

	local var_68_0 = math.random(#arg_68_0.wordList)
	local var_68_1 = pg.child_word[arg_68_0.wordList[var_68_0]].word

	if not arg_68_0.callName then
		arg_68_0.callName = getProxy(EducateProxy):GetCharData():GetCallName()
	end

	local var_68_2 = string.gsub(var_68_1, "$1", arg_68_0.callName)

	setText(arg_68_0.dialogueContent, var_68_2)

	local var_68_3 = GetSpriteFromAtlas("paintingface/" .. arg_68_0.paintingName, arg_68_0.faceList[var_68_0])
	local var_68_4 = arg_68_0.paintTF:Find("fitter"):GetChild(0):Find("face")

	if var_68_4 and var_68_3 then
		setImageSprite(var_68_4, var_68_3)
		setActive(var_68_4, true)
	end

	arg_68_0.dialogueTF.localScale = Vector3.zero

	setActive(arg_68_0.dialogueTF, true)
	LeanTween.scale(arg_68_0.dialogueTF, Vector3.one, 0.3):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
		LeanTween.scale(arg_68_0.dialogueTF, Vector3.zero, 0.3):setEase(LeanTweenType.easeInBack):setDelay(3):setOnComplete(System.Action(function()
			setActive(arg_68_0.dialogueTF, false)

			if var_68_4 then
				setActive(var_68_4, false)
			end
		end))
	end))
end

function var_0_0.updateNewTips(arg_71_0)
	arg_71_0:updateBookNewTip()
	arg_71_0:updateMindNewTip()
end

function var_0_0.updateBookNewTip(arg_72_0)
	local var_72_0 = underscore.any(pg.child_memory.all, function(arg_73_0)
		return EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_MEMORY, arg_73_0)
	end)
	local var_72_1 = EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_POLAROID)

	setActive(arg_72_0.bookBtn:Find("unlock/new"), var_72_0 or var_72_1)
end

function var_0_0.updateMindNewTip(arg_74_0)
	setActive(arg_74_0.mindBtn:Find("unlock/new"), EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_MIND_TASK))
end

function var_0_0.FlushView(arg_75_0)
	arg_75_0.datePanel:Flush()
	arg_75_0.favorPanel:Flush()
	arg_75_0.resPanel:Flush()
	arg_75_0.targetPanel:Flush()
	arg_75_0.bottomPanel:Flush()
	arg_75_0.archivePanel:Flush()
	arg_75_0:updatePaintingUI()
	arg_75_0:updateUnlockBtns()
	arg_75_0:updateNewTips()
	arg_75_0:updateMindTip()
	arg_75_0:updateFavorBtn()
	arg_75_0:SeriesCheck()
end

function var_0_0.onBackPressed(arg_76_0)
	arg_76_0:emit(var_0_0.EDUCATE_GO_SCENE, SCENE.NEW_EDUCATE_SELECT, {
		isTb1 = true
	})
end

function var_0_0.willExit(arg_77_0)
	arg_77_0.contextData.isMainEnter = nil

	arg_77_0.datePanel:Destroy()

	arg_77_0.datePanel = nil

	arg_77_0.favorPanel:Destroy()

	arg_77_0.favorPanel = nil

	arg_77_0.resPanel:Destroy()

	arg_77_0.resPanel = nil

	arg_77_0.topPanel:Destroy()

	arg_77_0.topPanel = nil

	arg_77_0.targetPanel:Destroy()

	arg_77_0.targetPanel = nil

	arg_77_0.bottomPanel:Destroy()

	arg_77_0.bottomPanel = nil

	arg_77_0.archivePanel:Destroy()

	arg_77_0.archivePanel = nil

	if LeanTween.isTweening(arg_77_0.dialogueTF) then
		LeanTween.cancel(arg_77_0.dialogueTF)
	end

	arg_77_0:UnOverlayPanel(arg_77_0.blurPanel, arg_77_0._tf)
end

return var_0_0
