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
	arg_6_0.loadedCallback = arg_6_1
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
	end)
end

function var_0_0.Unload(arg_9_0)
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
	local function var_20_0(arg_21_0)
		arg_20_0:PrepareTriggerAction(arg_21_0)
	end

	if getProxy(PlayerProxy):getFlag("login") then
		getProxy(PlayerProxy):setFlag("login", nil)
		var_20_0("event_login")
	elseif getProxy(PlayerProxy):getFlag("battle") then
		getProxy(PlayerProxy):setFlag("battle", nil)
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
	local var_24_0 = var_0_5.assistantEvents[arg_24_1]

	if var_24_0.dialog ~= "" then
		arg_24_0:DisplayWord(var_24_0.dialog)
	else
		arg_24_0:TriggerNextEventAuto()
	end
end

function var_0_0.TriggerEvent(arg_25_0, arg_25_1)
	if arg_25_0.isDragAndZoomState then
		return
	end

	if arg_25_0.chatting then
		return
	end

	arg_25_0:RemoveTimer()
	arg_25_0:PrepareTriggerAction(arg_25_1)
	arg_25_0:OnTriggerEvent()
end

function var_0_0.TriggerNextEventAuto(arg_26_0)
	if arg_26_0.isPuase or arg_26_0.isExited then
		return
	end

	arg_26_0:OnEndChatting()
	arg_26_0:RemoveTimer()

	arg_26_0.timer = Timer.New(function()
		arg_26_0:OnTimerTriggerEvent()
	end, 30, 1, true)

	arg_26_0.timer:Start()
end

function var_0_0.OnTimerTriggerEvent(arg_28_0)
	if arg_28_0:OnEnableTimerEvent() then
		local var_28_0 = arg_28_0:CollectIdleEvents(arg_28_0.lastChatEvent)

		arg_28_0.lastChatEvent = var_28_0[math.ceil(math.random(#var_28_0))]

		arg_28_0:_TriggerEvent(arg_28_0.lastChatEvent)
		arg_28_0:OnTriggerEventAuto()
		arg_28_0:RemoveTimer()
	end
end

function var_0_0.OnEnableTimerEvent(arg_29_0)
	return true
end

function var_0_0.OnStartChatting(arg_30_0)
	arg_30_0.chatting = true
end

function var_0_0.OnEndChatting(arg_31_0)
	arg_31_0.chatting = false
end

function var_0_0.GetWordAndCv(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0, var_32_1, var_32_2, var_32_3, var_32_4, var_32_5 = ShipWordHelper.GetCvDataForShip(arg_32_0.ship, arg_32_2)

	return var_32_0, var_32_1, var_32_2, var_32_3, var_32_4, var_32_5
end

function var_0_0.DisplayWord(arg_33_0, arg_33_1)
	arg_33_0:OnStartChatting()

	local var_33_0, var_33_1, var_33_2, var_33_3, var_33_4, var_33_5 = arg_33_0:GetWordAndCv(arg_33_0.ship, arg_33_1)

	if not var_33_2 or var_33_2 == nil or var_33_2 == "" or var_33_2 == "nil" then
		arg_33_0:OnEndChatting()

		return
	end

	arg_33_0:OnDisplayWorld(arg_33_1)
	arg_33_0:emit(MainWordView.SET_CONTENT, arg_33_1, var_33_2)
	arg_33_0:PlayCvAndAnimation(var_33_4, var_33_3, var_33_1)
end

function var_0_0.PlayCvAndAnimation(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	if getProxy(ContextProxy):getContextByMediator(NewShipMediator) then
		arg_34_0:OnEndChatting()

		return
	end

	local var_34_0 = -1

	seriesAsync({
		function(arg_35_0)
			if not arg_34_3 or not not pg.NewStoryMgr.GetInstance():IsRunning() then
				arg_35_0()

				return
			end

			arg_34_0:PlayCV(arg_34_1, arg_34_2, arg_34_3, function(arg_36_0)
				var_34_0 = arg_36_0

				arg_35_0()
			end)
		end,
		function(arg_37_0)
			arg_34_0:StartChatAnimtion(var_34_0, arg_37_0)
		end
	}, function()
		arg_34_0:OnDisplayWordEnd()
	end)
end

function var_0_0.OnDisplayWordEnd(arg_39_0)
	arg_39_0:TriggerNextEventAuto()
end

function var_0_0.PlayCV(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	local var_40_0 = ShipWordHelper.RawGetCVKey(arg_40_0.ship:getSkinId())
	local var_40_1 = pg.CriMgr.GetCVBankName(var_40_0)

	arg_40_0.cvLoader:Load(var_40_1, arg_40_3, 0, arg_40_4)
end

function var_0_0.setReplaceWord(arg_41_0, arg_41_1)
	arg_41_0.replaceWord = arg_41_1
end

function var_0_0.getReplaceWord(arg_42_0)
	return arg_42_0.replaceWord
end

function var_0_0.StartChatAnimtion(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = 0.3
	local var_43_1 = arg_43_1 > 0 and arg_43_1 or 3

	arg_43_0:emit(MainWordView.START_ANIMATION, var_43_0, var_43_1)
	arg_43_0:AddCharTimer(function()
		if arg_43_0:IsUnload() then
			return
		end

		arg_43_2()
	end, var_43_0 * 3 + var_43_1)
end

function var_0_0.AddCharTimer(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0:RemoveChatTimer()

	arg_45_0.chatTimer = Timer.New(arg_45_1, arg_45_2, 1)

	arg_45_0.chatTimer:Start()
end

function var_0_0.RemoveChatTimer(arg_46_0)
	if arg_46_0.chatTimer then
		arg_46_0.chatTimer:Stop()

		arg_46_0.chatTimer = nil
	end
end

function var_0_0.StopChatAnimtion(arg_47_0)
	arg_47_0:emit(MainWordView.STOP_ANIMATION)
	arg_47_0:OnEndChatting()
end

function var_0_0.OnStopVoice(arg_48_0)
	arg_48_0.cvLoader:Stop()
end

function var_0_0.CollectIdleEvents(arg_49_0, arg_49_1)
	local var_49_0 = {}

	if getProxy(EventProxy):hasFinishState() and arg_49_1 ~= "event_complete" then
		table.insert(var_49_0, "event_complete")
	else
		if getProxy(TaskProxy):getCanReceiveCount() > 0 and arg_49_1 ~= "mission_complete" then
			table.insert(var_49_0, "mission_complete")
		end

		if getProxy(MailProxy):GetUnreadCount() > 0 and arg_49_1 ~= "mail" then
			table.insert(var_49_0, "mail")
		end

		if #var_49_0 == 0 then
			local var_49_1 = arg_49_0.ship:getCVIntimacy()

			var_49_0 = var_0_5.filterAssistantEvents(Clone(var_0_5.IdleEvents), arg_49_0.ship:getSkinId(), var_49_1)

			if getProxy(TaskProxy):getNotFinishCount() and getProxy(TaskProxy):getNotFinishCount() > 0 and arg_49_1 ~= "mission" then
				table.insert(var_49_0, "mission")
			end
		end
	end

	return var_49_0
end

function var_0_0.CollectTouchEvents(arg_50_0)
	local var_50_0 = arg_50_0.ship:getCVIntimacy()

	return (var_0_5.filterAssistantEvents(var_0_5.PaintingTouchEvents, arg_50_0.ship:getSkinId(), var_50_0))
end

function var_0_0.GetTouchEvent(arg_51_0, arg_51_1)
	return (var_0_5.filterAssistantEvents(var_0_5.getAssistantTouchEvents(arg_51_1, arg_51_0.ship:getSkinId()), arg_51_0.ship:getSkinId(), 0))
end

function var_0_0.GetIdleEvents(arg_52_0)
	return (var_0_5.filterAssistantEvents(var_0_5.IdleEvents, arg_52_0.ship:getSkinId(), 0))
end

function var_0_0.GetEventConfig(arg_53_0, arg_53_1)
	return var_0_5.assistantEvents[arg_53_1]
end

function var_0_0.GetSpecialTouchEvent(arg_54_0, arg_54_1)
	return var_0_5.getPaintingTouchEvents(arg_54_1)
end

function var_0_0.RemoveTimer(arg_55_0)
	if arg_55_0.timer then
		arg_55_0.timer:Stop()

		arg_55_0.timer = nil
	end
end

function var_0_0.IsExited(arg_56_0)
	return arg_56_0.isExited
end

function var_0_0.Fold(arg_57_0, arg_57_1, arg_57_2)
	arg_57_0.isFoldState = arg_57_1

	arg_57_0:RemoveMoveTimer()
	arg_57_0:OnFold(arg_57_1)
end

function var_0_0.RemoveMoveTimer(arg_58_0)
	if arg_58_0.moveTimer then
		arg_58_0.moveTimer:Stop()

		arg_58_0.moveTimer = nil
	end
end

function var_0_0.EnableOrDisableMove(arg_59_0, arg_59_1)
	arg_59_0.isDragAndZoomState = arg_59_1

	arg_59_0:RemoveMoveTimer()

	if arg_59_1 then
		arg_59_0:StopChatAnimtion()
		arg_59_0:RemoveTimer()
		arg_59_0.cvLoader:Stop()
	else
		arg_59_0:TriggerNextEventAuto()
	end

	arg_59_0:OnEnableOrDisableDragAndZoom(arg_59_1)
end

function var_0_0.GetOffset(arg_60_0)
	return 0
end

function var_0_0.IslimitYPos(arg_61_0)
	return false
end

function var_0_0.PlayChangeSkinActionIn(arg_62_0, arg_62_1)
	return
end

function var_0_0.PlayChangeSkinActionOut(arg_63_0, arg_63_1)
	return
end

function var_0_0.PauseForSilent(arg_64_0)
	if SettingsMainScenePanel.IsEnableFlagShipInteraction() then
		return
	end

	if arg_64_0:IsLoaded() then
		arg_64_0:_Pause()
	end
end

function var_0_0._Pause(arg_65_0)
	arg_65_0.isPuase = true

	arg_65_0:RemoveMoveTimer()
	arg_65_0:StopChatAnimtion()
	arg_65_0:RemoveChatTimer()
	arg_65_0:RemoveTimer()
	arg_65_0.cvLoader:Stop()
end

function var_0_0.Puase(arg_66_0)
	arg_66_0:_Pause()
	arg_66_0:OnPuase()
end

function var_0_0.ResumeForSilent(arg_67_0)
	if SettingsMainScenePanel.IsEnableFlagShipInteraction() then
		return
	end

	if arg_67_0:IsLoaded() then
		arg_67_0:_Resume()
	end
end

function var_0_0._Resume(arg_68_0)
	arg_68_0.isPuase = false

	arg_68_0:TriggerNextEventAuto()
end

function var_0_0.Resume(arg_69_0)
	arg_69_0:_Resume()
	arg_69_0:OnResume()
end

function var_0_0.updateShip(arg_70_0, arg_70_1)
	if arg_70_1 and arg_70_0.ship.id == arg_70_1.id then
		arg_70_0.ship = arg_70_1
	end

	arg_70_0:OnUpdateShip(arg_70_1)
end

function var_0_0.OnUpdateShip(arg_71_0, arg_71_1)
	return
end

function var_0_0.InitScalePart(arg_72_0)
	local var_72_0 = arg_72_0:GetPartScaleData()

	if var_72_0 and #var_72_0 > 0 then
		arg_72_0.partScaleList = {}
		arg_72_0.partScaleSelectList = {}

		local var_72_1 = arg_72_0:GetPaintingTransform()

		if var_72_1 then
			for iter_72_0, iter_72_1 in ipairs(var_72_0) do
				local var_72_2 = findTF(var_72_1, iter_72_1)

				if var_72_2 then
					local var_72_3 = GetOrAddComponent(var_72_2, typeof(PinchZoom))

					var_72_3.enabled = false

					PoolMgr.GetInstance():GetUI("mainuiscalepart", false, function(arg_73_0)
						SetParent(arg_73_0, var_72_2)
						setActive(arg_73_0, false)
						table.insert(arg_72_0.partScaleSelectList, {
							tf = tf(arg_73_0),
							name = iter_72_1
						})
					end)
					onButton(arg_72_0._event, var_72_2, function()
						if arg_72_0.partScaleFlag then
							arg_72_0.selectPartName = iter_72_1

							arg_72_0:updateSelectPartScale()
						end
					end)
					arg_72_0:ResetPartScale(true)
					table.insert(arg_72_0.partScaleList, {
						name = iter_72_1,
						tf = var_72_2,
						com = var_72_3
					})
				end
			end
		end
	end
end

function var_0_0.updatePartCotent(arg_75_0, arg_75_1)
	for iter_75_0 = 1, #arg_75_0.partScaleSelectList do
		if arg_75_1 then
			arg_75_0:emit(NewMainScene.SET_SCALE_PART_CONTENT, arg_75_0.partScaleSelectList[iter_75_0].tf)
		else
			setParent(arg_75_0.partScaleSelectList[iter_75_0].tf, arg_75_0:GetPaintingTransform(), true)
		end
	end
end

function var_0_0.updateSelectPartScale(arg_76_0)
	for iter_76_0 = 1, #arg_76_0.partScaleList do
		local var_76_0 = arg_76_0.partScaleList[iter_76_0]
		local var_76_1 = arg_76_0.partScaleFlag and var_76_0.name == arg_76_0.selectPartName

		var_76_0.com.enabled = var_76_1

		setActive(arg_76_0.partScaleSelectList[iter_76_0].tf, arg_76_0.partScaleFlag and arg_76_0.partScaleSelectList[iter_76_0].name == arg_76_0.selectPartName)
	end
end

function var_0_0.ClearScalePart(arg_77_0)
	if arg_77_0.partScaleList and #arg_77_0.partScaleList > 0 then
		for iter_77_0 = 1, #arg_77_0.partScaleList do
			if arg_77_0.partScaleList[iter_77_0].tf then
				removeOnButton(arg_77_0.partScaleList[iter_77_0].tf)
			end
		end

		arg_77_0.partScaleList = nil
	end

	if arg_77_0.partScaleSelectList and #arg_77_0.partScaleSelectList > 0 then
		for iter_77_1 = 1, #arg_77_0.partScaleSelectList do
			if arg_77_0.partScaleSelectList[iter_77_1].tf then
				PoolMgr.GetInstance():ReturnUI("mainuiscalepart", go(arg_77_0.partScaleSelectList[iter_77_1].tf))
			end
		end

		arg_77_0.partScaleSelectList = nil
	end
end

function var_0_0.OnEnablePartScale(arg_78_0, arg_78_1)
	if arg_78_0.partScaleList then
		arg_78_0.partScaleFlag = arg_78_1
		arg_78_0.selectPartName = nil

		for iter_78_0 = 1, #arg_78_0.partScaleList do
			local var_78_0 = arg_78_0.partScaleList[iter_78_0].tf

			GetOrAddComponent(var_78_0, typeof(CanvasGroup)).blocksRaycasts = arg_78_1
		end

		arg_78_0:updateSelectPartScale()
		arg_78_0:updatePartCotent(arg_78_1)

		if not arg_78_1 then
			arg_78_0:ResetPartScale(true)
		end
	end
end

function var_0_0.ResetPartScale(arg_79_0, arg_79_1)
	if arg_79_0.partScaleList and #arg_79_0.partScaleList > 0 then
		for iter_79_0 = 1, #arg_79_0.partScaleList do
			local var_79_0 = arg_79_0.partScaleList[iter_79_0].tf
			local var_79_1 = arg_79_0.partScaleList[iter_79_0].name
			local var_79_2 = arg_79_1 and getProxy(SettingsProxy):getSkinScaleSetting(arg_79_0.ship, arg_79_0:GetPartStateType(), var_79_1) or 1

			var_79_0.localScale = Vector3(var_79_2, var_79_2, var_79_2)
		end
	end
end

function var_0_0.SavePartScaleData(arg_80_0)
	if not arg_80_0.partScaleList or #arg_80_0.partScaleList == 0 then
		return
	end

	if not arg_80_0.ship then
		return
	end

	for iter_80_0 = 1, #arg_80_0.partScaleList do
		local var_80_0 = arg_80_0.partScaleList[iter_80_0]
		local var_80_1 = arg_80_0:GetPartStateType()
		local var_80_2 = var_80_0.name
		local var_80_3 = var_80_0.tf.localScale.x

		getProxy(SettingsProxy):setSkinScaleSetting(arg_80_0.ship, var_80_1, var_80_2, var_80_3)
	end
end

function var_0_0.GetPaintingTransform(arg_81_0)
	return nil
end

function var_0_0.GetPartScaleData(arg_82_0)
	return nil
end

function var_0_0.GetPartStateType(arg_83_0)
	return
end

function var_0_0.Dispose(arg_84_0)
	arg_84_0:disposeEvent()

	arg_84_0.isExited = true

	pg.DelegateInfo.Dispose(arg_84_0)

	if arg_84_0.state == var_0_3 then
		arg_84_0:UnLoad()
	end

	arg_84_0.cvLoader:Dispose()

	arg_84_0.cvLoader = nil
	arg_84_0.triggerWhenLoaded = false

	arg_84_0:RemoveTimer()
	arg_84_0:RemoveMoveTimer()
	arg_84_0:RemoveChatTimer()
	arg_84_0:ClearScalePart()
end

function var_0_0.OnLoad(arg_85_0, arg_85_1)
	arg_85_1()
end

function var_0_0.OnUnload(arg_86_0)
	return
end

function var_0_0.OnClick(arg_87_0)
	return
end

function var_0_0.OnLongPress(arg_88_0)
	return
end

function var_0_0.OnTriggerEvent(arg_89_0)
	return
end

function var_0_0.OnTriggerEventAuto(arg_90_0)
	return
end

function var_0_0.OnDisplayWorld(arg_91_0, arg_91_1)
	return
end

function var_0_0.OnFold(arg_92_0, arg_92_1)
	return
end

function var_0_0.OnEnableOrDisableDragAndZoom(arg_93_0, arg_93_1)
	return
end

function var_0_0.OnPuase(arg_94_0)
	return
end

function var_0_0.OnResume(arg_95_0)
	return
end

return var_0_0
