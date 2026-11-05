local var_0_0 = class("MainBasePainting", import("view.base.BaseEventLogic"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.container = arg_1_1
	arg_1_0.state = var_0_1
	var_0_5 = pg.AssistantInfo
	arg_1_0.wordPosition = arg_1_1:Find("live2d")
	arg_1_0.cvLoader = MainCVLoader.New()
	arg_1_0.longPressEvent = arg_1_1:GetComponent("UILongPressTrigger").onLongPressed
	arg_1_0.replaceWord = false
	arg_1_0._asmrFlag = false
end

function var_0_0.IsUnload(arg_2_0)
	return arg_2_0.state == var_0_4
end

function var_0_0.GetCenterPos(arg_3_0)
	return arg_3_0.wordPosition.position
end

function var_0_0.IsLoading(arg_4_0)
	return arg_4_0.state == var_0_2
end

function var_0_0.IsLoaded(arg_5_0)
	return arg_5_0.state == var_0_3
end

function var_0_0.SetOnceLoadedCall(arg_6_0, arg_6_1)
	return
end

function var_0_0.Load(arg_7_0, arg_7_1)
	arg_7_0.isPuase = false
	arg_7_0.isExited = false
	arg_7_0.state = var_0_2
	arg_7_0.ship = arg_7_1
	arg_7_0.paintingName = arg_7_1:getPainting()

	arg_7_0:OnLoad(function()
		arg_7_0.state = var_0_3

		if arg_7_0.triggerWhenLoaded then
			arg_7_0:TriggerEventAtFirstTime()
		else
			arg_7_0:TriggerNextEventAuto()
		end

		arg_7_0:InitClickEvent()
		arg_7_0:emit(NewMainScene.PAINTING_LOAD_COMPLETE)
	end)
end

function var_0_0.Unload(arg_9_0)
	if arg_9_0.state == var_0_4 then
		return
	end

	arg_9_0.state = var_0_4

	removeOnButton(arg_9_0.container)
	arg_9_0.longPressEvent:RemoveAllListeners()
	arg_9_0:StopChatAnimtion()
	arg_9_0.cvLoader:Stop()
	arg_9_0:RemoveTimer()
	arg_9_0:OnUnload()

	arg_9_0.paintingName = nil

	LeanTween.cancel(arg_9_0.container.gameObject)
end

function var_0_0.UnloadOnlyPainting(arg_10_0)
	arg_10_0.state = var_0_4

	removeOnButton(arg_10_0.container)
	arg_10_0.longPressEvent:RemoveAllListeners()
	arg_10_0:RemoveTimer()
	arg_10_0:OnUnload()

	arg_10_0.paintingName = nil
end

function var_0_0.InitClickEvent(arg_11_0)
	onButton(arg_11_0, arg_11_0.container, function()
		arg_11_0:OnClick()
		arg_11_0:TriggerPersonalTask(arg_11_0.ship.groupId)
	end)
	arg_11_0.longPressEvent:RemoveAllListeners()
	arg_11_0.longPressEvent:AddListener(function()
		if arg_11_0._asmrFlag then
			return
		end

		if getProxy(ContextProxy):getCurrentContext().viewComponent.__cname == "NewMainScene" then
			arg_11_0:OnLongPress()
		end
	end)
end

function var_0_0.TriggerPersonalTask(arg_14_0, arg_14_1)
	if arg_14_0.isFoldState then
		return
	end

	arg_14_0:TriggerInterActionTask()

	local var_14_0 = getProxy(TaskProxy)

	for iter_14_0, iter_14_1 in ipairs(pg.task_data_trigger.all) do
		local var_14_1 = pg.task_data_trigger[iter_14_1]

		if var_14_1.group_id == arg_14_1 then
			local var_14_2 = var_14_1.task_id

			if not var_14_0:getFinishTaskById(var_14_2) then
				arg_14_0:CheckStoryDownload(var_14_2, function()
					pg.m02:sendNotification(GAME.TRIGGER_TASK, var_14_2)
				end)

				break
			end
		end
	end
end

function var_0_0.TriggerInterActionTask(arg_16_0)
	local var_16_0 = getProxy(TaskProxy):GetFlagShipInterActionTaskList()

	if var_16_0 and #var_16_0 > 0 then
		for iter_16_0, iter_16_1 in ipairs(var_16_0) do
			pg.m02:sendNotification(GAME.UPDATE_TASK_PROGRESS, {
				taskId = iter_16_1.id
			})
		end
	end
end

function var_0_0.CheckStoryDownload(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}
	local var_17_1 = arg_17_1

	while true do
		local var_17_2 = pg.task_data_template[var_17_1]

		if var_17_2.story_id ~= "" then
			table.insert(var_17_0, var_17_2.story_id)
		end

		if var_17_2.next_task == "" or var_17_2.next_task == "0" then
			break
		end

		var_17_1 = var_17_1 + 1
	end

	local var_17_3 = pg.NewStoryMgr.GetInstance():GetStoryPaintingsByNameList(var_17_0)
	local var_17_4 = _.map(var_17_3, function(arg_18_0)
		return "painting/" .. arg_18_0
	end)

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_17_4,
		finishFunc = arg_17_2
	})
end

function var_0_0.TriggerEventAtFirstTime(arg_19_0)
	if not arg_19_0:IsLoaded() then
		arg_19_0.triggerWhenLoaded = true

		return
	end

	arg_19_0.triggerWhenLoaded = false

	arg_19_0:OnFirstTimeTriggerEvent()
end

function var_0_0.OnFirstTimeTriggerEvent(arg_20_0)
	arg_20_0._loginAction = getProxy(PlayerProxy):getFlag("login")
	arg_20_0._battleAction = getProxy(PlayerProxy):getFlag("battle")

	getProxy(PlayerProxy):setFlag("login", false)
	getProxy(PlayerProxy):setFlag("battle", false)

	local function var_20_0(arg_21_0)
		arg_20_0:PrepareTriggerAction(arg_21_0)
	end

	if arg_20_0._loginAction then
		arg_20_0._loginAction = false

		var_20_0("event_login")
	elseif arg_20_0._battleAction then
		arg_20_0._battleAction = false

		var_20_0("home")
	else
		arg_20_0:TriggerNextEventAuto()
	end
end

function var_0_0.PrepareTriggerAction(arg_22_0, arg_22_1)
	arg_22_0:TryToTriggerEvent(arg_22_1)
end

function var_0_0.TryToTriggerEvent(arg_23_0, arg_23_1)
	arg_23_0:_TriggerEvent(arg_23_1)
end

function var_0_0._TriggerEvent(arg_24_0, arg_24_1)
	local var_24_0 = pg.AssistantInfo.GetAssistantEvents(arg_24_1)

	if var_24_0.dialog ~= "" then
		arg_24_0:DisplayWord(var_24_0.dialog)
	else
		arg_24_0:TriggerNextEventAuto()
	end
end

function var_0_0.SetShift(arg_25_0, arg_25_1)
	arg_25_0._shift = arg_25_1
end

function var_0_0.TriggerEvent(arg_26_0, arg_26_1)
	if arg_26_0.isDragAndZoomState then
		return
	end

	if arg_26_0.chatting then
		return
	end

	arg_26_0:RemoveTimer()
	arg_26_0:PrepareTriggerAction(arg_26_1)
	arg_26_0:OnTriggerEvent()
end

function var_0_0.TriggerNextEventAuto(arg_27_0)
	if arg_27_0.isPuase or arg_27_0.isExited and arg_27_0._asmrFlag then
		return
	end

	arg_27_0:OnEndChatting()
	arg_27_0:RemoveTimer()

	arg_27_0.timer = Timer.New(function()
		arg_27_0:OnTimerTriggerEvent()
	end, 30, 1, true)

	arg_27_0.timer:Start()
end

function var_0_0.OnTimerTriggerEvent(arg_29_0)
	if arg_29_0:OnEnableTimerEvent() then
		local var_29_0 = arg_29_0:CollectIdleEvents(arg_29_0.lastChatEvent)

		arg_29_0.lastChatEvent = var_29_0[math.ceil(math.random(#var_29_0))]

		arg_29_0:PrepareTriggerAction(arg_29_0.lastChatEvent)
		arg_29_0:OnTriggerEventAuto()
		arg_29_0:RemoveTimer()
	end
end

function var_0_0.SetTargetContainer(arg_30_0, arg_30_1)
	arg_30_0._renderTargetContainer = arg_30_1
end

function var_0_0.GetTargetContainer(arg_31_0)
	return arg_31_0._renderTargetContainer and arg_31_0._renderTargetContainer or arg_31_0.container
end

function var_0_0.OnEnableTimerEvent(arg_32_0)
	return true
end

function var_0_0.OnStartChatting(arg_33_0)
	arg_33_0.chatting = true
end

function var_0_0.OnEndChatting(arg_34_0)
	arg_34_0.chatting = false
end

function var_0_0.GetWordAndCv(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0, var_35_1, var_35_2, var_35_3, var_35_4, var_35_5 = ShipWordHelper.GetCvDataForShip(arg_35_0.ship, arg_35_2)

	return var_35_0, var_35_1, var_35_2, var_35_3, var_35_4, var_35_5
end

function var_0_0.DisplayWord(arg_36_0, arg_36_1)
	arg_36_0:OnStartChatting()

	local var_36_0, var_36_1, var_36_2, var_36_3, var_36_4, var_36_5 = arg_36_0:GetWordAndCv(arg_36_0.ship, arg_36_1)

	if not var_36_2 or var_36_2 == nil or var_36_2 == "" or var_36_2 == "nil" then
		arg_36_0:OnEndChatting()
		arg_36_0:OnDisplayWordEnd()

		return
	end

	arg_36_0:OnDisplayWorld(arg_36_1)

	if arg_36_0._asmrFlag then
		arg_36_0:emit(MainAsmrChatView.SET_CONTENT, arg_36_1, var_36_2)
	else
		arg_36_0:emit(MainWordView.SET_CONTENT, arg_36_1, var_36_2)
	end

	arg_36_0:PlayCvAndAnimation(var_36_4, var_36_3, var_36_1)
end

function var_0_0.PlayCvAndAnimation(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if getProxy(ContextProxy):getContextByMediator(NewShipMediator) then
		arg_37_0:OnEndChatting()

		return
	end

	local var_37_0 = -1

	seriesAsync({
		function(arg_38_0)
			if not arg_37_3 or not not pg.NewStoryMgr.GetInstance():IsRunning() then
				arg_38_0()

				return
			end

			arg_37_0:PlayCV(arg_37_1, arg_37_2, arg_37_3, function(arg_39_0)
				var_37_0 = arg_39_0

				arg_38_0()
			end)
		end,
		function(arg_40_0)
			arg_37_0:StartChatAnimtion(var_37_0, arg_40_0)
		end
	}, function()
		arg_37_0:OnDisplayWordEnd()
	end)
end

function var_0_0.OnDisplayWordEnd(arg_42_0)
	arg_42_0:TriggerNextEventAuto()
end

function var_0_0.PlayCV(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4)
	local var_43_0 = ShipWordHelper.RawGetCVKey(arg_43_0.ship:getSkinId())
	local var_43_1 = pg.CriMgr.GetCVBankName(var_43_0)

	arg_43_0.cvLoader:Load(var_43_1, arg_43_3, 0, arg_43_4)
end

function var_0_0.preloadCv(arg_44_0, arg_44_1)
	local var_44_0 = ShipWordHelper.RawGetCVKey(arg_44_0.ship:getSkinId())
	local var_44_1 = pg.CriMgr.GetCVBankName(var_44_0)

	arg_44_0.cvLoader:preloadCv(var_44_1, arg_44_1)
end

function var_0_0.OnAsmrTurnning(arg_45_0, arg_45_1)
	arg_45_0._asmrFlag = arg_45_1
end

function var_0_0.setReplaceWord(arg_46_0, arg_46_1)
	arg_46_0.replaceWord = arg_46_1
end

function var_0_0.getReplaceWord(arg_47_0)
	return arg_47_0.replaceWord
end

function var_0_0.StartChatAnimtion(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = 0.3
	local var_48_1 = arg_48_1 > 0 and arg_48_1 or 3

	if arg_48_0._asmrFlag then
		arg_48_0:emit(MainAsmrChatView.START_CHAT, var_48_0, var_48_1)
	else
		arg_48_0:emit(MainWordView.START_ANIMATION, var_48_0, var_48_1)
	end

	arg_48_0:AddCharTimer(function()
		if arg_48_0:IsUnload() then
			return
		end

		arg_48_2()
	end, var_48_0 * 3 + var_48_1)
end

function var_0_0.AddCharTimer(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0:RemoveChatTimer()

	arg_50_0.chatTimer = Timer.New(arg_50_1, arg_50_2, 1)

	arg_50_0.chatTimer:Start()
end

function var_0_0.RemoveChatTimer(arg_51_0)
	if arg_51_0.chatTimer then
		arg_51_0.chatTimer:Stop()

		arg_51_0.chatTimer = nil
	end
end

function var_0_0.StopChatAnimtion(arg_52_0)
	if not arg_52_0._asmrFlag then
		arg_52_0:emit(MainWordView.STOP_ANIMATION)
	end

	arg_52_0:OnEndChatting()
end

function var_0_0.OnStopVoice(arg_53_0)
	arg_53_0.cvLoader:Stop()
end

function var_0_0.CollectIdleEvents(arg_54_0, arg_54_1)
	local var_54_0 = {}

	if getProxy(EventProxy):hasFinishState() and arg_54_1 ~= "event_complete" then
		table.insert(var_54_0, "event_complete")
	else
		if getProxy(TaskProxy):getCanReceiveCount() > 0 and arg_54_1 ~= "mission_complete" then
			table.insert(var_54_0, "mission_complete")
		end

		if getProxy(MailProxy):GetUnreadCount() > 0 and arg_54_1 ~= "mail" then
			table.insert(var_54_0, "mail")
		end

		if #var_54_0 == 0 then
			var_54_0 = var_0_5.GetShipMainEvents(arg_54_0.ship:getSkinId(), arg_54_0.ship:getCVIntimacy())

			if getProxy(TaskProxy):getNotFinishCount() and getProxy(TaskProxy):getNotFinishCount() > 0 and arg_54_1 ~= "mission" then
				table.insert(var_54_0, "mission")
			end
		end
	end

	return var_54_0
end

function var_0_0.CollectTouchEvents(arg_55_0)
	local var_55_0 = arg_55_0.ship:getCVIntimacy()

	return (var_0_5.filterAssistantEvents(var_0_5.GetShipTouchEvents(arg_55_0.ship:getSkinId(), var_55_0), arg_55_0.ship:getSkinId(), var_55_0))
end

function var_0_0.GetTouchEvent(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0.ship:getCVIntimacy()

	return (var_0_5.filterAssistantEvents(var_0_5.getAssistantTouchEvents(arg_56_1, arg_56_0.ship:getSkinId()), arg_56_0.ship:getSkinId(), 0))
end

function var_0_0.GetIdleEvents(arg_57_0)
	local var_57_0 = arg_57_0.ship:getCVIntimacy()

	return (var_0_5.filterAssistantEvents(var_0_5.GetShipMainEvents(arg_57_0.ship:getSkinId(), 0), arg_57_0.ship:getSkinId(), 0))
end

function var_0_0.GetEventConfig(arg_58_0, arg_58_1)
	return pg.AssistantInfo.GetAssistantEvents(arg_58_1)
end

function var_0_0.GetSpecialTouchEvent(arg_59_0, arg_59_1)
	return var_0_5.getPaintingTouchEvents(arg_59_1)
end

function var_0_0.RemoveTimer(arg_60_0)
	if arg_60_0.timer then
		arg_60_0.timer:Stop()

		arg_60_0.timer = nil
	end
end

function var_0_0.IsExited(arg_61_0)
	return arg_61_0.isExited
end

function var_0_0.Fold(arg_62_0, arg_62_1, arg_62_2)
	arg_62_0.isFoldState = arg_62_1

	arg_62_0:RemoveMoveTimer()
	arg_62_0:OnFold(arg_62_1)
end

function var_0_0.RemoveMoveTimer(arg_63_0)
	if arg_63_0.moveTimer then
		arg_63_0.moveTimer:Stop()

		arg_63_0.moveTimer = nil
	end
end

function var_0_0.EnableOrDisableMove(arg_64_0, arg_64_1)
	arg_64_0.isDragAndZoomState = arg_64_1

	arg_64_0:RemoveMoveTimer()

	if arg_64_1 then
		arg_64_0:StopChatAnimtion()
		arg_64_0:RemoveTimer()
		arg_64_0.cvLoader:Stop()
	else
		arg_64_0:TriggerNextEventAuto()
	end

	arg_64_0:OnEnableOrDisableDragAndZoom(arg_64_1)
end

function var_0_0.GetOffset(arg_65_0)
	return 0
end

function var_0_0.UpdateBound(arg_66_0)
	return
end

function var_0_0.IslimitYPos(arg_67_0)
	return false
end

function var_0_0.PlayChangeSkinActionIn(arg_68_0, arg_68_1)
	return
end

function var_0_0.PlayChangeSkinActionOut(arg_69_0, arg_69_1)
	return
end

function var_0_0.PauseForSilent(arg_70_0)
	if SettingsMainScenePanel.IsEnableFlagShipInteraction() then
		return
	end

	if arg_70_0:IsLoaded() then
		arg_70_0:_Pause()
	end
end

function var_0_0._Pause(arg_71_0)
	arg_71_0.isPuase = true

	arg_71_0:RemoveMoveTimer()
	arg_71_0:StopChatAnimtion()
	arg_71_0:RemoveChatTimer()
	arg_71_0:RemoveTimer()
	arg_71_0.cvLoader:Stop()
end

function var_0_0.Pause(arg_72_0)
	arg_72_0:_Pause()
	arg_72_0:OnPause()
end

function var_0_0.ResumeForSilent(arg_73_0)
	if SettingsMainScenePanel.IsEnableFlagShipInteraction() then
		return
	end

	if arg_73_0:IsLoaded() then
		arg_73_0:_Resume()
	end
end

function var_0_0._Resume(arg_74_0)
	arg_74_0.isPuase = false

	arg_74_0:TriggerNextEventAuto()
end

function var_0_0.Resume(arg_75_0)
	arg_75_0:_Resume()
	arg_75_0:OnResume()
end

function var_0_0.updateShip(arg_76_0, arg_76_1)
	if arg_76_1 and arg_76_0.ship.id == arg_76_1.id then
		arg_76_0.ship = arg_76_1
	end

	arg_76_0:OnUpdateShip(arg_76_1)
end

function var_0_0.OnUpdateShip(arg_77_0, arg_77_1)
	return
end

function var_0_0.OnPaintingFade(arg_78_0, arg_78_1)
	return
end

function var_0_0.InitScalePart(arg_79_0)
	local var_79_0 = arg_79_0:GetPartScaleData()

	if var_79_0 and #var_79_0 > 0 then
		arg_79_0.partScaleList = {}
		arg_79_0.partScaleSelectList = {}

		local var_79_1 = arg_79_0:GetPaintingTransform()

		if var_79_1 then
			for iter_79_0, iter_79_1 in ipairs(var_79_0) do
				local var_79_2 = findTF(var_79_1, iter_79_1)

				if var_79_2 then
					local var_79_3 = GetOrAddComponent(var_79_2, typeof(PinchZoom))

					var_79_3.enabled = false

					PoolMgr.GetInstance():GetUI("mainuiscalepart", false, function(arg_80_0)
						SetParent(arg_80_0, var_79_2)
						setActive(arg_80_0, false)
						table.insert(arg_79_0.partScaleSelectList, {
							tf = tf(arg_80_0),
							name = iter_79_1
						})
					end)
					onButton(arg_79_0._event, var_79_2, function()
						if arg_79_0.partScaleFlag then
							arg_79_0.selectPartName = iter_79_1

							arg_79_0:updateSelectPartScale()
						end
					end)
					arg_79_0:ResetPartScale(true)
					table.insert(arg_79_0.partScaleList, {
						name = iter_79_1,
						tf = var_79_2,
						com = var_79_3
					})
				end
			end
		end
	end
end

function var_0_0.updatePartCotent(arg_82_0, arg_82_1)
	for iter_82_0 = 1, #arg_82_0.partScaleSelectList do
		if arg_82_1 then
			arg_82_0:emit(NewMainScene.SET_SCALE_PART_CONTENT, arg_82_0.partScaleSelectList[iter_82_0].tf)
		else
			setParent(arg_82_0.partScaleSelectList[iter_82_0].tf, arg_82_0:GetPaintingTransform(), true)
		end
	end
end

function var_0_0.updateSelectPartScale(arg_83_0)
	for iter_83_0 = 1, #arg_83_0.partScaleList do
		local var_83_0 = arg_83_0.partScaleList[iter_83_0]
		local var_83_1 = arg_83_0.partScaleFlag and var_83_0.name == arg_83_0.selectPartName

		var_83_0.com.enabled = var_83_1

		setActive(arg_83_0.partScaleSelectList[iter_83_0].tf, arg_83_0.partScaleFlag and arg_83_0.partScaleSelectList[iter_83_0].name == arg_83_0.selectPartName)
	end
end

function var_0_0.ClearScalePart(arg_84_0)
	if arg_84_0.partScaleList and #arg_84_0.partScaleList > 0 then
		for iter_84_0 = 1, #arg_84_0.partScaleList do
			if arg_84_0.partScaleList[iter_84_0].tf then
				removeOnButton(arg_84_0.partScaleList[iter_84_0].tf)
			end
		end

		arg_84_0.partScaleList = nil
	end

	if arg_84_0.partScaleSelectList and #arg_84_0.partScaleSelectList > 0 then
		for iter_84_1 = 1, #arg_84_0.partScaleSelectList do
			if arg_84_0.partScaleSelectList[iter_84_1].tf then
				PoolMgr.GetInstance():ReturnUI("mainuiscalepart", go(arg_84_0.partScaleSelectList[iter_84_1].tf))
			end
		end

		arg_84_0.partScaleSelectList = nil
	end
end

function var_0_0.OnEnablePartScale(arg_85_0, arg_85_1)
	if arg_85_0.partScaleList then
		arg_85_0.partScaleFlag = arg_85_1
		arg_85_0.selectPartName = nil

		for iter_85_0 = 1, #arg_85_0.partScaleList do
			local var_85_0 = arg_85_0.partScaleList[iter_85_0].tf

			GetOrAddComponent(var_85_0, typeof(CanvasGroup)).blocksRaycasts = arg_85_1
		end

		arg_85_0:updateSelectPartScale()
		arg_85_0:updatePartCotent(arg_85_1)

		if not arg_85_1 then
			arg_85_0:ResetPartScale(true)
		end
	end
end

function var_0_0.ResetPartScale(arg_86_0, arg_86_1)
	if arg_86_0.partScaleList and #arg_86_0.partScaleList > 0 then
		for iter_86_0 = 1, #arg_86_0.partScaleList do
			local var_86_0 = arg_86_0.partScaleList[iter_86_0].tf
			local var_86_1 = arg_86_0.partScaleList[iter_86_0].name
			local var_86_2 = arg_86_1 and getProxy(SettingsProxy):getSkinScaleSetting(arg_86_0.ship, arg_86_0:GetPartStateType(), var_86_1) or 1

			var_86_0.localScale = Vector3(var_86_2, var_86_2, var_86_2)
		end
	end
end

function var_0_0.SavePartScaleData(arg_87_0)
	if not arg_87_0.partScaleList or #arg_87_0.partScaleList == 0 then
		return
	end

	if not arg_87_0.ship then
		return
	end

	for iter_87_0 = 1, #arg_87_0.partScaleList do
		local var_87_0 = arg_87_0.partScaleList[iter_87_0]
		local var_87_1 = arg_87_0:GetPartStateType()
		local var_87_2 = var_87_0.name
		local var_87_3 = var_87_0.tf.localScale.x

		getProxy(SettingsProxy):setSkinScaleSetting(arg_87_0.ship, var_87_1, var_87_2, var_87_3)
	end
end

function var_0_0.GetPaintingTransform(arg_88_0)
	return nil
end

function var_0_0.GetPartScaleData(arg_89_0)
	return nil
end

function var_0_0.GetPartStateType(arg_90_0)
	return
end

function var_0_0.Dispose(arg_91_0)
	arg_91_0._renderTargetContainer = nil

	arg_91_0:disposeEvent()

	arg_91_0.isExited = true

	pg.DelegateInfo.Dispose(arg_91_0)

	if arg_91_0.state == var_0_3 then
		arg_91_0:UnLoad()
	end

	arg_91_0.cvLoader:Dispose()

	arg_91_0.cvLoader = nil
	arg_91_0.triggerWhenLoaded = false

	arg_91_0:RemoveTimer()
	arg_91_0:RemoveMoveTimer()
	arg_91_0:RemoveChatTimer()
	arg_91_0:ClearScalePart()
end

function var_0_0.OnLoad(arg_92_0, arg_92_1)
	arg_92_1()
end

function var_0_0.OnUnload(arg_93_0)
	return
end

function var_0_0.OnClick(arg_94_0)
	return
end

function var_0_0.OnLongPress(arg_95_0)
	return
end

function var_0_0.OnTriggerEvent(arg_96_0)
	return
end

function var_0_0.OnTriggerEventAuto(arg_97_0)
	return
end

function var_0_0.OnDisplayWorld(arg_98_0, arg_98_1)
	return
end

function var_0_0.OnFold(arg_99_0, arg_99_1)
	return
end

function var_0_0.OnEnableOrDisableDragAndZoom(arg_100_0, arg_100_1)
	return
end

function var_0_0.OnPause(arg_101_0)
	return
end

function var_0_0.OnResume(arg_102_0)
	return
end

return var_0_0
