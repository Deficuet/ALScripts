local var_0_0 = class("IslandView", import(".IslandBaseView"))

function var_0_0.Init(arg_1_0)
	arg_1_0._unitList = {}
	arg_1_0.isInit = false

	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_OBJ)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_SYSTEM)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_DELEGATION)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_STROLL)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_MANAGE_SYSTEM)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_MANAGE)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_DELEGATION_ANIMATION)

	arg_1_0.unitBuilders = {
		[IslandConst.UNIT_TYPE_ITEM] = IslandStaticUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_CHAR] = IslandNpcBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_VISITOR] = IslandVisitorBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_PLAYER] = IslandPlayerBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_ITEM_INTERACT] = IslandItemInteractBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT] = IslandItemHandCollectBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING] = IslandItemHandPlantBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_STROLL] = IslandStrollNpcBuilder.New(arg_1_0, IslandConst.UNIT_LIST_STROLL),
		[IslandConst.UNIT_TYPE_SYSTEM] = IslandSystemNpcBuilder.New(arg_1_0, IslandConst.UNIT_LIST_DELEGATION),
		[IslandConst.UNIT_TYPE_ITEM_GATHER_ITEM] = IslandItemWildGahterBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_ITEM_WILD_COLLECT_ITEM] = IslandItemWildGahterBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_MANAGE_CHARA] = IslandSystemDelegationUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_MANAGE),
		[IslandConst.UNIT_TYPE_MANAGE_ITEM] = IslandStaticUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_MANAGE),
		[IslandConst.UNIT_TYPE_MANAGE_CUSTOMER] = IslandStaticCharaBuilder.New(arg_1_0, IslandConst.UNIT_LIST_MANAGE),
		[IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION] = IslandSystemDelegationUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_DELEGATION),
		[IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION] = IslandSystemDelegationUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_DELEGATION_ANIMATION)
	}
	arg_1_0.systemBuilders = {
		[IslandConst.SYSTEM_TYPE_CHARACTER] = IslandSystemBuilder.New(arg_1_0, IslandCharacterSystem),
		[IslandConst.SYSTEM_TYPE_PRODUCT] = IslandSystemBuilder.New(arg_1_0, IslandCharacterSystem),
		[IslandConst.SYSTEM_TYPE_SEEKGAME] = IslandSystemBuilder.New(arg_1_0, IslandSeekGameSystem),
		[IslandConst.SYSTEM_TYPE_GROUND] = IslandGroundSystemBuilder.New(arg_1_0, IslandGoundLayerSystem),
		[IslandConst.SYSTEM_TYPE_MANAGE] = IslandManageSystemBuilder.New(arg_1_0, IslandManageSystem)
	}
	arg_1_0.detectionSystem = IslandDetectionSystem.New(arg_1_0)
	arg_1_0.effectMgr = IslandDelegateEffectMgr.New(arg_1_0)
	arg_1_0.pathfinders = {}
	arg_1_0.views = {
		arg_1_0:CreateOpView(),
		arg_1_0:CreateSlotHudView(),
		arg_1_0:CreateTopHeadHudView(),
		arg_1_0:CreateAnimationOpView()
	}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.views) do
		iter_1_1:Init()
	end
end

function var_0_0.GetSubView(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.views) do
		if isa(iter_2_1, arg_2_1) then
			return iter_2_1
		end
	end

	return nil
end

function var_0_0.CreateOpView(arg_3_0)
	return IslandOpView.New(arg_3_0)
end

function var_0_0.CreateSlotHudView(arg_4_0)
	return IslandSlotHudView.New(arg_4_0)
end

function var_0_0.CreateTopHeadHudView(arg_5_0)
	return IslandTopHeadHudView.New(arg_5_0)
end

function var_0_0.CreateAnimationOpView(arg_6_0)
	return IslandAniamtionOpView.New(arg_6_0)
end

function var_0_0.IsLoaded(arg_7_0)
	local var_7_0 = arg_7_0:GetAllUnits()

	return _.all(arg_7_0.views, function(arg_8_0)
		return arg_8_0:IsLoaded()
	end) and #var_7_0 > 0 and _.all(var_7_0, function(arg_9_0)
		return arg_9_0:IsLoaded()
	end)
end

function var_0_0.IsInit(arg_10_0)
	return arg_10_0.isInit
end

function var_0_0.Update(arg_11_0)
	if not arg_11_0.isInit then
		return
	end

	for iter_11_0, iter_11_1 in ipairs(arg_11_0:GetAllUnits()) do
		iter_11_1:Update()
	end

	for iter_11_2, iter_11_3 in ipairs(arg_11_0.views) do
		iter_11_3:Update()
	end

	for iter_11_4, iter_11_5 in ipairs(arg_11_0.pathfinders) do
		iter_11_5:Update()
	end

	if arg_11_0.needTryTrack then
		arg_11_0:TryTrack()
	end
end

function var_0_0.LateUpdate(arg_12_0)
	if not arg_12_0.isInit then
		return
	end

	for iter_12_0, iter_12_1 in ipairs(arg_12_0:GetAllUnits()) do
		iter_12_1:LateUpdate()
	end

	for iter_12_2, iter_12_3 in ipairs(arg_12_0.views) do
		iter_12_3:LateUpdate()
	end

	for iter_12_4, iter_12_5 in ipairs(arg_12_0.pathfinders) do
		iter_12_5:LateUpdate()
	end
end

function var_0_0.AddListeners(arg_13_0)
	arg_13_0:AddListener(ISLAND_EVT.GEN_UNIT, arg_13_0.OnGenUnit)
	arg_13_0:AddListener(ISLAND_EVT.RMOVE_UNIT, arg_13_0.OnRemoveUnit)
	arg_13_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_13_0.OnInterActionBegin)
	arg_13_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_13_0.OnInterActionEnd)
	arg_13_0:AddListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_13_0.OnStopUnit)
	arg_13_0:AddListener(ISLAND_EVT.MOVE_UNIT, arg_13_0.OnMoveUnit)
	arg_13_0:AddListener(ISLAND_EVT.INIT_FINISH, arg_13_0.OnSceneInited)
	arg_13_0:AddListener(ISLAND_EVT.MOVE_PLAYER, arg_13_0.OnPlayerMove)
	arg_13_0:AddListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_13_0.OnPlayerStopMove)
	arg_13_0:AddListener(ISLAND_EVT.JUMP_PLAYER, arg_13_0.OnPlayerJump)
	arg_13_0:AddListener(ISLAND_EVT.APPROACH_UNIT, arg_13_0.OnShowInterActionPanel)
	arg_13_0:AddListener(ISLAND_EVT.LEAVE_UNIT, arg_13_0.OnHideInterActionPanel)
	arg_13_0:AddListener(ISLAND_EVT.TRACKING, arg_13_0.OnTracking)
	arg_13_0:AddListener(ISLAND_EVT.UNTRACKING, arg_13_0.OnUnTracking)
	arg_13_0:AddListener(ISLAND_EVT.AREACHANGE, arg_13_0.OnPlayerAreaChange)
	arg_13_0:AddListener(ISLAND_EVT.PLAYERRUN, arg_13_0.OnPlayerPlayerRun)
	arg_13_0:AddListener(ISLAND_EVT.SPRINT_PLAYER, arg_13_0.OnPlayerPlayerSprint)
	arg_13_0:AddListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_13_0.OnStopPlayerSprint)
	arg_13_0:AddListener(ISLAND_EVT.CHANGE_DRESS, arg_13_0.OnChangeDress)
	arg_13_0:AddListener(ISLAND_EVT.RESET_UNIT_POS, arg_13_0.OnResetUnitPos)
	arg_13_0:AddListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_13_0.OnAnyPageOpen)
	arg_13_0:AddListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_13_0.OnAllPageClose)
	arg_13_0:AddListener(ISLAND_EVT.PLAY_BUBBLE, arg_13_0.OnPlayChatBubble)
	arg_13_0:AddListener(ISLAND_EVT.START_STORY, arg_13_0.OnStartStory)
	arg_13_0:AddListener(ISLAND_EVT.END_STORY, arg_13_0.OnEndStory)
	arg_13_0:AddListener(ISLAND_EVT.START_DEGATION, arg_13_0.OnStartDelegation)
	arg_13_0:AddListener(ISLAND_EVT.END_DEGATION, arg_13_0.OnEndDelegation)
	arg_13_0:AddListener(ISLAND_EVT.GEN_SYSTEM, arg_13_0.OnGenSystem)
	arg_13_0:AddListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_13_0.OnWorldObjectStartInteraction)
	arg_13_0:AddListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_13_0.OnWorldObjectEndInteraction)
	arg_13_0:AddListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_13_0.OnWorldObjectInitStatus)
	arg_13_0:AddListener(ISLAND_EVT.REFRESH_INTERACTION, arg_13_0.OnRefreshInteractionBtn)
	arg_13_0:AddListener(ISLAND_EVT.SHOW_UNIT_HUD, arg_13_0.OnShowUnitHud)
	arg_13_0:AddListener(ISLAND_EVT.HIDE_UNIT_HUD, arg_13_0.OnHideUnitHud)
	arg_13_0:AddListener(ISLAND_EVT.DETECTOR_CHANGED, arg_13_0.OnDetectorChanged)
	arg_13_0:AddListener(ISLAND_EVT.SELECTED_DETECTOR, arg_13_0.OnDetectorSelected)
	arg_13_0:AddListener(ISLAND_EVT.SET_PLAYER_WORK, arg_13_0.OnPlayerWork)
	arg_13_0:AddListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_13_0.OnPlayerDeviceStateChange)
	arg_13_0:AddListener(ISLAND_EVT.UPDATE_HUD, arg_13_0.OnUpdateHud)
	arg_13_0:AddListener(ISLAND_EVT.UPDATE_UNIT_HP, arg_13_0.OnUpdateUnitHp)
	arg_13_0:AddListener(ISLAND_EVT.START_DELEGATE_SLOT_PERFORM, arg_13_0.OnDelegateSlotStartPerform)
	arg_13_0:AddListener(ISLAND_EVT.LOAD_DELEGATE_SLOT_EFFECCT, arg_13_0.OnDelegateSlotEffectInit)
	arg_13_0:AddListener(ISLAND_EVT.DEFAULTDELEFFECT_SHOW, arg_13_0.OnDefaultSlotEffectShow)
	arg_13_0:AddListener(ISLAND_EVT.UPDATE_DELEGATION_EFFECT_POSITION, arg_13_0.OnUpdateEffectPos)
	arg_13_0:AddListener(ISLAND_EVT.SELECTDELEFFECT_SHOW, arg_13_0.OnSelectSlotEffectShow)
	arg_13_0:AddListener(ISLAND_EVT.START_MANAGE, arg_13_0.OnStartManage)
	arg_13_0:AddListener(ISLAND_EVT.END_MANAGE, arg_13_0.OnEndManage)
	arg_13_0:AddListener(ISLAND_EVT.SHOW_HUD, arg_13_0.OnShowHud)
	arg_13_0:AddListener(ISLAND_EVT.HIDE_HUD, arg_13_0.OnHideHud)
	arg_13_0:AddListener(ISLAND_EVT.REFRESH_HUD, arg_13_0.OnRefreshHud)
	arg_13_0:AddListener(ISLAND_EVT.START_GUIDE, arg_13_0.OnStartGuide)
	arg_13_0:AddListener(ISLAND_EVT.END_GUIDE, arg_13_0.OnEndGuide)
	arg_13_0:AddListener(ISLAND_EVT.START_PERFORMANCE, arg_13_0.OnStartPerformance)
	arg_13_0:AddListener(ISLAND_EVT.END_PERFORMANCE, arg_13_0.OnEndPerformance)
	arg_13_0:AddListener(ISLAND_EVT.DISABLE_INPUT, arg_13_0.DisableInput)
	arg_13_0:AddListener(ISLAND_EVT.ENABLE_INPUT, arg_13_0.EnableInput)
	arg_13_0:AddListener(ISLAND_EVT.GEN_PATH_FINDER, arg_13_0.OnGenPathFinder)
	arg_13_0:AddListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_13_0.OnActiveOrDisactiveUnit)
	arg_13_0:AddListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_13_0.OnOpenAniamtionOpPage)
	arg_13_0:AddListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_13_0.OnCloseAniamtionOpPage)
	arg_13_0:AddListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_13_0.OnMovePlayerBefore)
	arg_13_0:AddListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_13_0.OnRefreshTaskInfoHud)
end

function var_0_0.RemoveListeners(arg_14_0)
	arg_14_0:RemoveListener(ISLAND_EVT.GEN_UNIT, arg_14_0.OnGenUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.RMOVE_UNIT, arg_14_0.OnRemoveUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_14_0.OnInterActionBegin)
	arg_14_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_14_0.OnInterActionEnd)
	arg_14_0:RemoveListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_14_0.OnStopUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.MOVE_UNIT, arg_14_0.OnMoveUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.INIT_FINISH, arg_14_0.OnSceneInited)
	arg_14_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER, arg_14_0.OnPlayerMove)
	arg_14_0:RemoveListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_14_0.OnPlayerStopMove)
	arg_14_0:RemoveListener(ISLAND_EVT.JUMP_PLAYER, arg_14_0.OnPlayerJump)
	arg_14_0:RemoveListener(ISLAND_EVT.APPROACH_UNIT, arg_14_0.OnShowInterActionPanel)
	arg_14_0:RemoveListener(ISLAND_EVT.LEAVE_UNIT, arg_14_0.OnHideInterActionPanel)
	arg_14_0:RemoveListener(ISLAND_EVT.TRACKING, arg_14_0.OnTracking)
	arg_14_0:RemoveListener(ISLAND_EVT.UNTRACKING, arg_14_0.OnUnTracking)
	arg_14_0:RemoveListener(ISLAND_EVT.AREACHANGE, arg_14_0.OnPlayerAreaChange)
	arg_14_0:RemoveListener(ISLAND_EVT.PLAYERRUN, arg_14_0.OnPlayerPlayerRun)
	arg_14_0:RemoveListener(ISLAND_EVT.SPRINT_PLAYER, arg_14_0.OnPlayerPlayerSprint)
	arg_14_0:RemoveListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_14_0.OnStopPlayerSprint)
	arg_14_0:RemoveListener(ISLAND_EVT.CHANGE_DRESS, arg_14_0.OnChangeDress)
	arg_14_0:RemoveListener(ISLAND_EVT.RESET_UNIT_POS, arg_14_0.OnResetUnitPos)
	arg_14_0:RemoveListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_14_0.OnAnyPageOpen)
	arg_14_0:RemoveListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_14_0.OnAllPageClose)
	arg_14_0:RemoveListener(ISLAND_EVT.PLAY_BUBBLE, arg_14_0.OnPlayChatBubble)
	arg_14_0:RemoveListener(ISLAND_EVT.START_STORY, arg_14_0.OnStartStory)
	arg_14_0:RemoveListener(ISLAND_EVT.END_STORY, arg_14_0.OnEndStory)
	arg_14_0:RemoveListener(ISLAND_EVT.START_DEGATION, arg_14_0.OnStartDelegation)
	arg_14_0:RemoveListener(ISLAND_EVT.END_DEGATION, arg_14_0.OnEndDelegation)
	arg_14_0:RemoveListener(ISLAND_EVT.GEN_SYSTEM, arg_14_0.OnGenSystem)
	arg_14_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_14_0.OnWorldObjectStartInteraction)
	arg_14_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_14_0.OnWorldObjectEndInteraction)
	arg_14_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_14_0.OnWorldObjectInitStatus)
	arg_14_0:RemoveListener(ISLAND_EVT.REFRESH_INTERACTION, arg_14_0.OnRefreshInteractionBtn)
	arg_14_0:RemoveListener(ISLAND_EVT.SHOW_UNIT_HUD, arg_14_0.OnShowUnitHud)
	arg_14_0:RemoveListener(ISLAND_EVT.HIDE_UNIT_HUD, arg_14_0.OnHideUnitHud)
	arg_14_0:RemoveListener(ISLAND_EVT.DETECTOR_CHANGED, arg_14_0.OnDetectorChanged)
	arg_14_0:RemoveListener(ISLAND_EVT.SELECTED_DETECTOR, arg_14_0.OnDetectorSelected)
	arg_14_0:RemoveListener(ISLAND_EVT.SET_PLAYER_WORK, arg_14_0.OnPlayerWork)
	arg_14_0:RemoveListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_14_0.OnPlayerDeviceStateChange)
	arg_14_0:RemoveListener(ISLAND_EVT.UPDATE_HUD, arg_14_0.OnUpdateHud)
	arg_14_0:RemoveListener(ISLAND_EVT.UPDATE_UNIT_HP, arg_14_0.OnUpdateUnitHp)
	arg_14_0:RemoveListener(ISLAND_EVT.LOAD_DELEGATE_SLOT_EFFECCT, arg_14_0.OnDelegateSlotEffectInit)
	arg_14_0:RemoveListener(ISLAND_EVT.DEFAULTDELEFFECT_SHOW, arg_14_0.OnDefaultSlotEffectShow)
	arg_14_0:RemoveListener(ISLAND_EVT.UPDATE_DELEGATION_EFFECT_POSITION, arg_14_0.OnUpdateEffectPos)
	arg_14_0:RemoveListener(ISLAND_EVT.SELECTDELEFFECT_SHOW, arg_14_0.OnSelectSlotEffectShow)
	arg_14_0:RemoveListener(ISLAND_EVT.START_MANAGE, arg_14_0.OnStartManage)
	arg_14_0:RemoveListener(ISLAND_EVT.END_MANAGE, arg_14_0.OnEndManage)
	arg_14_0:RemoveListener(ISLAND_EVT.SHOW_HUD, arg_14_0.OnShowHud)
	arg_14_0:RemoveListener(ISLAND_EVT.HIDE_HUD, arg_14_0.OnHideHud)
	arg_14_0:RemoveListener(ISLAND_EVT.REFRESH_HUD, arg_14_0.OnRefreshHud)
	arg_14_0:RemoveListener(ISLAND_EVT.START_GUIDE, arg_14_0.OnStartGuide)
	arg_14_0:RemoveListener(ISLAND_EVT.END_GUIDE, arg_14_0.OnEndGuide)
	arg_14_0:RemoveListener(ISLAND_EVT.START_PERFORMANCE, arg_14_0.OnStartPerformance)
	arg_14_0:RemoveListener(ISLAND_EVT.END_PERFORMANCE, arg_14_0.OnEndPerformance)
	arg_14_0:RemoveListener(ISLAND_EVT.DISABLE_INPUT, arg_14_0.DisableInput)
	arg_14_0:RemoveListener(ISLAND_EVT.ENABLE_INPUT, arg_14_0.EnableInput)
	arg_14_0:RemoveListener(ISLAND_EVT.GEN_PATH_FINDER, arg_14_0.OnGenPathFinder)
	arg_14_0:RemoveListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_14_0.OnActiveOrDisactiveUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_14_0.OnOpenAniamtionOpPage)
	arg_14_0:RemoveListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_14_0.OnCloseAniamtionOpPage)
	arg_14_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_14_0.OnMovePlayerBefore)
	arg_14_0:RemoveListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_14_0.OnRefreshTaskInfoHud)
end

function var_0_0.OnOpenAniamtionOpPage(arg_15_0)
	arg_15_0:GetSubView(IslandAniamtionOpView):Show()
	arg_15_0:GetSubView(IslandOpView):Disable()
	arg_15_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_ANIMATION_OP)
end

function var_0_0.OnCloseAniamtionOpPage(arg_16_0)
	arg_16_0:GetSubView(IslandOpView):Enable()
	arg_16_0:NotifiyIsland(ISLAND_EX_EVT.CLOSE_ANIMATION_OP)
end

function var_0_0.OnGenPathFinder(arg_17_0, arg_17_1)
	local var_17_0 = IslandPathFinder.New(arg_17_0)
	local var_17_1 = defaultValue(arg_17_1.navData.waitUntilDone, false)

	var_17_0:Start(arg_17_1.navData, function()
		table.removebyvalue(arg_17_0.pathfinders, var_17_0)
		var_17_0:Dispose()
		arg_17_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH_DONE, arg_17_1.navData.index)

		if var_17_1 and arg_17_1.callback then
			arg_17_1.callback()
		end
	end)

	if not var_17_1 and arg_17_1.callback then
		arg_17_1.callback()
	end

	table.insert(arg_17_0.pathfinders, var_17_0)
end

function var_0_0.OnSceneInited(arg_19_0, arg_19_1)
	IslandCameraMgr.instance:LookAt(arg_19_0.player._tf)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraZoom)):SetMaxMinZoom(arg_19_1.min, arg_19_1.max, arg_19_1.value)
	arg_19_0:InitFocusCamera()

	for iter_19_0, iter_19_1 in ipairs(arg_19_0:GetAllUnits()) do
		iter_19_1:Start()
	end

	arg_19_0.isInit = true
end

function var_0_0.InitFocusCamera(arg_20_0)
	local var_20_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)

	var_20_0.Follow = arg_20_0.player._tf
	var_20_0.LookAt = arg_20_0.player._tf
end

function var_0_0.OnDetectorChanged(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.node

	if not var_21_0 then
		return
	end

	local var_21_1 = var_21_0:GetBlackboardVariable("DetectorList")

	for iter_21_0 = 1, var_21_1.Count do
		local var_21_2 = var_21_1[iter_21_0 - 1]
		local var_21_3, var_21_4 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_21_2)

		if var_21_3 == IslandConst.UNIT_LIST_OBJ then
			local var_21_5 = arg_21_0:GetUnitModuleWithType(var_21_3, var_21_4)

			if var_21_5 then
				arg_21_0:Op("NotifiyIsland", ISLAND_EX_EVT.APPROACH_OBJECT, var_21_5.id)
			end
		end
	end
end

function var_0_0.OnDetectorSelected(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.node

	if not var_22_0 then
		return
	end

	local var_22_1 = var_22_0:GetBlackboardVariable("SelectedObj")

	if not var_22_1 or var_22_1 == "" then
		arg_22_0:OnClearSelectedUnit()
	else
		local var_22_2, var_22_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_22_1)
		local var_22_4 = arg_22_0:GetUnitModuleWithType(var_22_2, var_22_3)

		arg_22_0:OnSelectedUnit(var_22_4)
	end
end

function var_0_0.OnClearSelectedUnit(arg_23_0)
	return
end

function var_0_0.OnSelectedUnit(arg_24_0, arg_24_1)
	return
end

function var_0_0.OnRefreshInteractionBtn(arg_25_0)
	arg_25_0:GetSubView(IslandOpView):RefreshInteractionBtns()
end

function var_0_0.OnStartStory(arg_26_0)
	arg_26_0.playingStory = true

	arg_26_0.player:StopMoveHandle()
	arg_26_0:GetSubView(IslandTopHeadHudView):Disable()
	arg_26_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_26_0:GetSubView(IslandOpView):Hide()
end

function var_0_0.OnEndStory(arg_27_0)
	arg_27_0.playingStory = false

	arg_27_0:GetSubView(IslandOpView):TryEnablePlayerOp()
	arg_27_0:GetSubView(IslandTopHeadHudView):Enable()
	arg_27_0:GetSubView(IslandOpView):Show()
end

function var_0_0.OnStartPerformance(arg_28_0)
	return
end

function var_0_0.OnEndPerformance(arg_29_0)
	arg_29_0:GetSubView(IslandOpView):ResetShowBalance()
end

function var_0_0.OnPlayChatBubble(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetAllUnits()

	arg_30_0:GetSubView(IslandTopHeadHudView):PlayBubble(arg_30_1.name, var_30_0, arg_30_1.callback)
end

function var_0_0.OnAnyPageOpen(arg_31_0, arg_31_1)
	arg_31_0.player:StopMoveHandle()
	arg_31_0:GetSubView(IslandTopHeadHudView):Disable()
	arg_31_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnAllPageClose(arg_32_0)
	arg_32_0:GetSubView(IslandTopHeadHudView):Enable()
	arg_32_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnInterActionBegin(arg_33_0)
	arg_33_0.player:StopMoveHandle()
	arg_33_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_34_0)
	arg_34_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_35_0, arg_35_1)
	arg_35_0.showInterObjId = arg_35_1.id

	arg_35_0:GetSubView(IslandOpView):ShowInterActionPanel(arg_35_1)
	arg_35_0:Op("NotifiyIsland", ISLAND_EX_EVT.SHOW_INTERACTION, arg_35_0.showInterObjId)
end

function var_0_0.OnHideInterActionPanel(arg_36_0, arg_36_1)
	if arg_36_0.showInterObjId ~= arg_36_1.id then
		return
	end

	arg_36_0.showInterObjId = nil

	arg_36_0:GetSubView(IslandOpView):HideInterActionPanel()
end

function var_0_0.OnStartGuide(arg_37_0)
	arg_37_0.player:StopMoveHandle()
	arg_37_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.OnEndGuide(arg_38_0)
	if arg_38_0.playingStory then
		return
	end

	arg_38_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.DisableInput(arg_39_0)
	arg_39_0.player:StopMoveHandle()
	arg_39_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.EnableInput(arg_40_0)
	arg_40_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.OnTracking(arg_41_0, arg_41_1)
	arg_41_0.trackId = tonumber(arg_41_1.id)
	arg_41_0.needTryTrack = true
end

function var_0_0.TryTrack(arg_42_0)
	local var_42_0 = arg_42_0:GetUnitModule(arg_42_0.trackId)

	if not var_42_0 or not var_42_0._go then
		return
	end

	arg_42_0:GetSubView(IslandOpView):SetTrackingTarget(arg_42_0.player, var_42_0, arg_42_0.trackId)

	arg_42_0.needTryTrack = false
end

function var_0_0.OnUnTracking(arg_43_0)
	arg_43_0.trackId = nil

	arg_43_0:GetSubView(IslandOpView):CancelTracking()
end

function var_0_0.OnGenUnit(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_0.unitBuilders[arg_44_1:GetType()]:Build(arg_44_1, arg_44_2)

	arg_44_0:AddUnit(var_44_0)

	if arg_44_1:IsPlayer() then
		arg_44_0.player = var_44_0
	end
end

function var_0_0.OnGenSystem(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0.systemBuilders[arg_45_1:GetType()]:Build(arg_45_1)

	arg_45_0:AddUnit(var_45_0)
end

function var_0_0.OnActiveOrDisactiveUnit(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = arg_46_0:GetUnitModuleWithType(arg_46_2, arg_46_1)

	if var_46_0 and arg_46_3 then
		var_46_0:Enable()
	end

	if var_46_0 and not arg_46_3 then
		var_46_0:Disable()
	end
end

function var_0_0.OnResetUnitPos(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = arg_47_0:GetUnitModule(arg_47_1)

	if var_47_0 then
		var_47_0._go.transform.position = arg_47_2
	end
end

function var_0_0.OnMoveUnit(arg_48_0, arg_48_1)
	assert(arg_48_1.type, "type should be exist")

	local var_48_0 = arg_48_0:GetUnitModuleWithType(arg_48_1.type, arg_48_1.id)

	if var_48_0 then
		var_48_0:SetDestination(arg_48_1.position, arg_48_1.speed)
	end
end

function var_0_0.OnStopUnit(arg_49_0, arg_49_1)
	assert(arg_49_1.type, "type should be exist")

	local var_49_0 = arg_49_0:GetUnitModuleWithType(arg_49_1.type, arg_49_1.id)

	if var_49_0 then
		var_49_0:StopMove()
	end
end

function var_0_0.OnRemoveUnit(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_0:GetUnitListByKey(arg_50_1)
	local var_50_1 = 0

	for iter_50_0, iter_50_1 in ipairs(var_50_0 or {}) do
		if iter_50_1.id == arg_50_2 then
			var_50_1 = iter_50_0

			break
		end
	end

	if var_50_1 > 0 then
		local var_50_2 = var_50_0[var_50_1]

		arg_50_0:RemoveUnit(var_50_2)
		var_50_2:Dispose()
		arg_50_0:OnHideUnitHud({
			id = var_50_2.id
		}, true)
		arg_50_0:GetSubView(IslandTopHeadHudView):HideHud({
			type = arg_50_1,
			id = arg_50_2
		})
		arg_50_0:GetSubView(IslandOpView):CloseInterActionPanelByUnitIdRemove(arg_50_2)
	end
end

function var_0_0.GetAllUnits(arg_51_0)
	table.clear(arg_51_0._unitList)

	for iter_51_0, iter_51_1 in pairs(arg_51_0:GetUnitListRegitser()) do
		for iter_51_2, iter_51_3 in pairs(iter_51_1) do
			table.insert(arg_51_0._unitList, iter_51_3)
		end
	end

	return arg_51_0._unitList
end

function var_0_0.GetUnitModuleWithType(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_0:GetUnitListByKey(arg_52_1)

	for iter_52_0, iter_52_1 in ipairs(var_52_0) do
		if iter_52_1.id == arg_52_2 then
			return iter_52_1
		end
	end

	return nil
end

function var_0_0.GetUnitModule(arg_53_0, arg_53_1)
	return arg_53_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_53_1)
end

function var_0_0.GetSystemModule(arg_54_0, arg_54_1)
	return arg_54_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_SYSTEM, arg_54_1)
end

function var_0_0.GetSystemUnitModule(arg_55_0, arg_55_1)
	return arg_55_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_55_1)
end

function var_0_0.GetStrollUnitModule(arg_56_0, arg_56_1)
	return arg_56_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_STROLL, arg_56_1)
end

function var_0_0.GetManageSystemModule(arg_57_0, arg_57_1)
	return arg_57_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_MANAGE_SYSTEM, arg_57_1)
end

function var_0_0.OnMovePlayerBefore(arg_58_0)
	arg_58_0:GetSubView(IslandAniamtionOpView):OnMovePlayerBefore()
end

function var_0_0.OnPlayerMove(arg_59_0, arg_59_1)
	arg_59_0.player:MoveHandle(arg_59_1.targetDir, arg_59_1.force)
end

function var_0_0.OnPlayerStopMove(arg_60_0)
	arg_60_0.player:StopMoveHandle()
end

function var_0_0.OnPlayerJump(arg_61_0)
	arg_61_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_62_0)
	arg_62_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_63_0)
	arg_63_0.player:OnPlayerPlayerSprint()
end

function var_0_0.OnStopPlayerSprint(arg_64_0)
	arg_64_0.player:OnStopPlayerSprint()
end

function var_0_0.OnPlayerWork(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	arg_65_0.player:WorkHandle(arg_65_1, arg_65_2, arg_65_3)
end

function var_0_0.OnPlayerDeviceStateChange(arg_66_0, arg_66_1)
	arg_66_0.player:DeviceStateHandle(arg_66_1)
end

function var_0_0.OnWorldObjectStartInteraction(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	local var_67_0 = arg_67_2:GetHostId()
	local var_67_1 = arg_67_2:GetUserId()
	local var_67_2 = arg_67_0:GetUnitModule(var_67_0)
	local var_67_3 = arg_67_0:GetUnitModule(var_67_1)
	local var_67_4 = arg_67_0.player == var_67_3

	if var_67_4 then
		arg_67_0:GetSubView(IslandOpView):StartInteraction()
	end

	local var_67_5 = arg_67_1:GetTimeline()[arg_67_3]
	local var_67_6 = arg_67_1:GetBlackboardParam()[arg_67_3]

	var_67_2:StartInteract(var_67_3, arg_67_2.id, arg_67_3, var_67_5, var_67_6, arg_67_1:AnySlotUsing(), var_67_4)
end

function var_0_0.OnWorldObjectEndInteraction(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = arg_68_2:GetHostId()
	local var_68_1 = arg_68_2:GetUserId()
	local var_68_2 = arg_68_0:GetUnitModule(var_68_0)
	local var_68_3 = arg_68_0:GetUnitModule(var_68_1)
	local var_68_4 = arg_68_0.player == var_68_3

	if var_68_4 then
		arg_68_0:GetSubView(IslandOpView):EndInteraction()
	end

	var_68_2:EndInteract(var_68_3, arg_68_2.id, not arg_68_1:AnySlotUsing(), var_68_4)
end

function var_0_0.OnWorldObjectInitStatus(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = arg_69_0:GetUnitModule(arg_69_1.id)
	local var_69_1 = arg_69_1:GetTimeline()[arg_69_2]
	local var_69_2 = arg_69_1:GetBlackboardParam()[arg_69_2]

	var_69_0:InitStatus(arg_69_2, var_69_1, var_69_2)
end

function var_0_0.OnPlayerAreaChange(arg_70_0)
	arg_70_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnChangeDress(arg_71_0, arg_71_1, arg_71_2)
	arg_71_0.player:OnChangeDress(arg_71_1, arg_71_2)
end

function var_0_0.OnStartDelegation(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = arg_72_0:GetSystemModule(arg_72_1.build_id)

	if var_72_0 then
		var_72_0:StartDelegation(arg_72_1)
	end
end

function var_0_0.OnEndDelegation(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_0:GetSystemModule(arg_73_1.build_id)

	if var_73_0 then
		var_73_0:EndDelegation(arg_73_1)
	end
end

function var_0_0.GetPlayerPosition(arg_74_0)
	return arg_74_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_0:GetUnitModule(arg_75_1)

	return var_75_0 and var_75_0._go.transform.position
end

function var_0_0.OnShowUnitHud(arg_76_0, arg_76_1)
	arg_76_0.currentHudUnitData = arg_76_1

	arg_76_0:GetSubView(IslandSlotHudView):ShowHud(arg_76_1.id, arg_76_1.height)
	arg_76_0:GetSubView(IslandOpView):UpdateOperationButton(arg_76_1.operationType, arg_76_1.id)

	if arg_76_1.isHighLightControl then
		arg_76_0.detectionSystem:HighLightUnitHandle(arg_76_1.id, true)
	end
end

function var_0_0.OnHideUnitHud(arg_77_0, arg_77_1, arg_77_2)
	if not arg_77_0.currentHudUnitData or arg_77_0.currentHudUnitData.id ~= arg_77_1.id then
		return
	end

	if not arg_77_2 then
		arg_77_0.currentHudUnitData = nil
	end

	arg_77_0:GetSubView(IslandSlotHudView):HideUnitHud(arg_77_1.id)
	arg_77_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, arg_77_1.id)

	if arg_77_1.isHighLightControl then
		arg_77_0.detectionSystem:HighLightUnitHandle(arg_77_1.id, false)
	end
end

function var_0_0.OnUpdateHud(arg_78_0, arg_78_1)
	if not arg_78_0.currentHudUnitData then
		return
	end

	if arg_78_1 ~= arg_78_0.currentHudUnitData.id then
		return
	end

	arg_78_0:GetSubView(IslandSlotHudView):UpdateHud(arg_78_0.currentHudUnitData.id)
	arg_78_0:GetSubView(IslandOpView):UpdateOperationButton(arg_78_0.currentHudUnitData.operationType, arg_78_0.currentHudUnitData.id)
end

function var_0_0.OnUpdateUnitHp(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_79_1)

	if var_79_0 then
		var_79_0:ResetHp()
	end
end

function var_0_0.OnShowHud(arg_80_0, arg_80_1)
	arg_80_0:GetSubView(IslandTopHeadHudView):ShowHud(arg_80_1)
	arg_80_0:GetSubView(IslandOpView):OnShowHud(arg_80_1.id)
end

function var_0_0.OnRefreshHud(arg_81_0, arg_81_1)
	arg_81_0:GetSubView(IslandTopHeadHudView):RefreshHud(arg_81_1)
end

function var_0_0.OnHideHud(arg_82_0, arg_82_1)
	arg_82_0:GetSubView(IslandTopHeadHudView):HideHud(arg_82_1)
	arg_82_0:GetSubView(IslandOpView):OnHideHud(arg_82_1.id)
end

function var_0_0.OnDelegateSlotStartPerform(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_0:GetUnitModuleWithType(arg_83_1.type, arg_83_1.id)

	if var_83_0 then
		var_83_0:DelegateSlotStartPerform()
	end
end

function var_0_0.OnDelegateSlotEffectInit(arg_84_0, arg_84_1, arg_84_2, arg_84_3)
	arg_84_0.effectMgr:GenEffect(arg_84_1, arg_84_2, arg_84_3)
end

function var_0_0.OnUpdateEffectPos(arg_85_0, arg_85_1, arg_85_2, arg_85_3)
	arg_85_0.effectMgr:UpdateEffect(arg_85_1, arg_85_2, arg_85_3)
end

function var_0_0.OnDefaultSlotEffectShow(arg_86_0, arg_86_1, arg_86_2)
	arg_86_0.effectMgr:OnDefaultSlotEffectShow(arg_86_1, arg_86_2)
end

function var_0_0.OnSelectSlotEffectShow(arg_87_0, arg_87_1, arg_87_2)
	arg_87_0.effectMgr:OnSelectSlotEffectShow(arg_87_1, arg_87_2)
end

function var_0_0.OnStartManage(arg_88_0, arg_88_1)
	local var_88_0 = arg_88_0:GetManageSystemModule(arg_88_1.id)

	if var_88_0 then
		var_88_0:StartManage(arg_88_1)
	end
end

function var_0_0.OnEndManage(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_0:GetManageSystemModule(arg_89_1.id)

	if var_89_0 then
		var_89_0:EndManage(arg_89_1)
	end
end

function var_0_0.OnRefreshTaskInfoHud(arg_90_0)
	arg_90_0:GetSubView(IslandTopHeadHudView):UpdateAllHud()
end

function var_0_0.OnDispose(arg_91_0)
	arg_91_0.detectionSystem:Dispose()
	arg_91_0.effectMgr:Dispose()

	for iter_91_0, iter_91_1 in ipairs(arg_91_0.views) do
		iter_91_1:Dispose()
	end

	for iter_91_2, iter_91_3 in ipairs(arg_91_0.pathfinders) do
		iter_91_3:Dispose()
	end

	for iter_91_4, iter_91_5 in ipairs(arg_91_0:GetAllUnits()) do
		iter_91_5:Dispose()
	end

	for iter_91_6, iter_91_7 in pairs(arg_91_0.unitBuilders) do
		iter_91_7:Dispose()
	end

	for iter_91_8, iter_91_9 in pairs(arg_91_0.systemBuilders) do
		iter_91_9:Dispose()
	end

	arg_91_0.pathfinders = nil
	arg_91_0.unitBuilders = nil
	arg_91_0.systemBuilders = nil
	arg_91_0.views = nil
	arg_91_0.player = nil
	arg_91_0.isInit = false
	arg_91_0._unitList = nil
	arg_91_0.detectionSystem = nil
	arg_91_0.effectMgr = nil
end

return var_0_0
