local var_0_0 = class("IslandView", import(".IslandBaseView"))

function var_0_0.Init(arg_1_0)
	arg_1_0._unitList = {}
	arg_1_0.isInit = false

	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_PLAYER)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_OBJ)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_SYSTEM)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_DELEGATION)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_STROLL)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_MANAGE_SYSTEM)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_MANAGE)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_DELEGATION_ANIMATION)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_FOLLOW)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_DELAY)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_PHOTO)

	arg_1_0.unitBuilders = {
		[IslandConst.UNIT_TYPE_ITEM] = IslandStaticUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_CHAR] = IslandNpcBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
		[IslandConst.UNIT_TYPE_VISITOR] = IslandVisitorBuilder.New(arg_1_0, IslandConst.UNIT_LIST_PLAYER),
		[IslandConst.UNIT_TYPE_PLAYER] = IslandPlayerBuilder.New(arg_1_0, IslandConst.UNIT_LIST_PLAYER),
		[IslandConst.UNIT_TYPE_VIRTUAL_INTERACT] = IslandVirtualInteractBuilder.New(arg_1_0, IslandConst.UNIT_LIST_OBJ),
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
		[IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION] = IslandSystemDelegationUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_DELEGATION_ANIMATION),
		[IslandConst.UNIT_TYPE_FOLLOWER] = IslandFollowNpcBuilder.New(arg_1_0, IslandConst.UNIT_LIST_FOLLOW),
		[IslandConst.UNIT_TYPE_ITEM_DELAY_RECYCLE] = IslandDelayRecycleUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_DELAY),
		[IslandConst.UNIT_TYPE_FIRST_TAKE_PHOTO_ITEM] = IslandTakePhotoBuilder.New(arg_1_0, IslandConst.UNIT_LIST_PHOTO)
	}
	arg_1_0.systemBuilders = {
		[IslandConst.SYSTEM_TYPE_CHARACTER] = IslandSystemBuilder.New(arg_1_0, IslandCharacterSystem),
		[IslandConst.SYSTEM_TYPE_PRODUCT] = IslandSystemBuilder.New(arg_1_0, IslandCharacterSystem),
		[IslandConst.SYSTEM_TYPE_SEEKGAME] = IslandSystemBuilder.New(arg_1_0, IslandSeekGameSystem),
		[IslandConst.SYSTEM_TYPE_GROUND] = IslandGroundSystemBuilder.New(arg_1_0, IslandGoundLayerSystem),
		[IslandConst.SYSTEM_TYPE_GRASSLAND] = IslandSystemBuilder.New(arg_1_0, IslandGrassLandSystem),
		[IslandConst.SYSTEM_TYPE_MANAGE] = IslandManageSystemBuilder.New(arg_1_0, IslandManageSystem)
	}
	arg_1_0.detectionSystem = IslandDetectionSystem.New(arg_1_0)
	arg_1_0.effectMgr = IslandDelegateEffectMgr.New(arg_1_0)
	arg_1_0.coupleActionPlayer = IslandCoupleActionPlayer.New(arg_1_0)
	arg_1_0.coupleAction4FollowerPlayer = IslandCoupleAction4FollowerPlayer.New(arg_1_0)
	arg_1_0.npcActionPlayer = IslandNpcActionPlayer.New(arg_1_0)
	arg_1_0.weatherSystem = IslandWeatherSystem.New(arg_1_0)
	arg_1_0.pathfinders = {}
	arg_1_0.views = {
		arg_1_0:CreateInteractionView(),
		arg_1_0:CreateDistanceView(),
		arg_1_0:CreateSeedOpView(),
		arg_1_0:CreateOpView(),
		arg_1_0:CreateSlotHudView(),
		arg_1_0:CreateTopHeadHudView(),
		arg_1_0:CreateBottomHeadHudeView(),
		arg_1_0:CreateCancelAnimationOpView(),
		arg_1_0:CreateAnimationOpView()
	}
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

function var_0_0.CreateCancelAnimationOpView(arg_5_0)
	return IslandCancelAnimationOpView.New(arg_5_0)
end

function var_0_0.CreateTopHeadHudView(arg_6_0)
	return IslandTopHeadHudView.New(arg_6_0)
end

function var_0_0.CreateBottomHeadHudeView(arg_7_0)
	return IslandBottomHeadHudView.New(arg_7_0)
end

function var_0_0.CreateAnimationOpView(arg_8_0)
	return IslandAniamtionOpView.New(arg_8_0)
end

function var_0_0.CreateInteractionView(arg_9_0)
	return IslandInteractionView.New(arg_9_0)
end

function var_0_0.CreateDistanceView(arg_10_0)
	return IslandDistanceView.New(arg_10_0)
end

function var_0_0.CreateSeedOpView(arg_11_0)
	return IslandSeedOpView.New(arg_11_0)
end

function var_0_0.IsLoaded(arg_12_0)
	local var_12_0 = arg_12_0:GetAllUnits()

	return _.all(arg_12_0.views, function(arg_13_0)
		return arg_13_0:IsLoaded()
	end) and #var_12_0 > 0 and _.all(var_12_0, function(arg_14_0)
		return arg_14_0:IsLoaded()
	end)
end

function var_0_0.IsInit(arg_15_0)
	return arg_15_0.isInit
end

function var_0_0.Update(arg_16_0)
	if not arg_16_0.isInit then
		return
	end

	for iter_16_0, iter_16_1 in ipairs(arg_16_0:GetAllUnits()) do
		iter_16_1:Update()
	end

	for iter_16_2, iter_16_3 in ipairs(arg_16_0.views) do
		iter_16_3:Update()
	end

	for iter_16_4, iter_16_5 in ipairs(arg_16_0.pathfinders) do
		iter_16_5:Update()
	end

	if arg_16_0.needTryTrack then
		arg_16_0:TryTrack()
	end
end

function var_0_0.LateUpdate(arg_17_0)
	if not arg_17_0.isInit then
		return
	end

	for iter_17_0, iter_17_1 in ipairs(arg_17_0:GetAllUnits()) do
		iter_17_1:LateUpdate()
	end

	for iter_17_2, iter_17_3 in ipairs(arg_17_0.views) do
		iter_17_3:LateUpdate()
	end

	for iter_17_4, iter_17_5 in ipairs(arg_17_0.pathfinders) do
		iter_17_5:LateUpdate()
	end
end

function var_0_0.AddListeners(arg_18_0)
	arg_18_0:AddListener(ISLAND_EVT.GEN_UNIT, arg_18_0.OnGenUnit)
	arg_18_0:AddListener(ISLAND_EVT.RMOVE_UNIT, arg_18_0.OnRemoveUnit)
	arg_18_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_18_0.OnInterActionBegin)
	arg_18_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_18_0.OnInterActionEnd)
	arg_18_0:AddListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_18_0.OnStopUnit)
	arg_18_0:AddListener(ISLAND_EVT.MOVE_UNIT, arg_18_0.OnMoveUnit)
	arg_18_0:AddListener(ISLAND_EVT.INIT_FINISH, arg_18_0.OnSceneInited)
	arg_18_0:AddListener(ISLAND_EVT.MOVE_PLAYER, arg_18_0.OnPlayerMove)
	arg_18_0:AddListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_18_0.OnPlayerStopMoveHandle)
	arg_18_0:AddListener(ISLAND_EVT.JUMP_PLAYER, arg_18_0.OnPlayerJump)
	arg_18_0:AddListener(ISLAND_EVT.APPROACH_UNIT, arg_18_0.OnShowInterActionPanel)
	arg_18_0:AddListener(ISLAND_EVT.LEAVE_UNIT, arg_18_0.OnHideInterActionPanel)
	arg_18_0:AddListener(ISLAND_EVT.TRACKING, arg_18_0.OnTracking)
	arg_18_0:AddListener(ISLAND_EVT.UNTRACKING, arg_18_0.OnUnTracking)
	arg_18_0:AddListener(ISLAND_EVT.AREACHANGE, arg_18_0.OnPlayerAreaChange)
	arg_18_0:AddListener(ISLAND_EVT.PLAYERRUN, arg_18_0.OnPlayerPlayerRun)
	arg_18_0:AddListener(ISLAND_EVT.SPRINT_PLAYER, arg_18_0.OnPlayerPlayerSprint)
	arg_18_0:AddListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_18_0.OnStopPlayerSprint)
	arg_18_0:AddListener(ISLAND_EVT.CHANGE_DRESS, arg_18_0.OnChangeDress)
	arg_18_0:AddListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_18_0.OnCharacterChangeDress)
	arg_18_0:AddListener(ISLAND_EVT.RESET_UNIT_POS, arg_18_0.OnResetUnitPos)
	arg_18_0:AddListener(ISLAND_EVT.RESET_UNIT_ROT, arg_18_0.OnResetUnitRotation)
	arg_18_0:AddListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_18_0.OnAnyPageOpen)
	arg_18_0:AddListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_18_0.OnAllPageClose)
	arg_18_0:AddListener(ISLAND_EVT.Change_TakePhoto_Model, arg_18_0.OnChangeTakePhotoModel)
	arg_18_0:AddListener(ISLAND_EVT.Change_Photo_Height, arg_18_0.OnChange_Photo_Height)
	arg_18_0:AddListener(ISLAND_EVT.SetOpMoveBtnActve, arg_18_0.OnSetOpMoveBtnActve)
	arg_18_0:AddListener(ISLAND_EVT.PLAY_BUBBLE, arg_18_0.OnPlayChatBubble)
	arg_18_0:AddListener(ISLAND_EVT.START_STORY, arg_18_0.OnStartStory)
	arg_18_0:AddListener(ISLAND_EVT.END_STORY, arg_18_0.OnEndStory)
	arg_18_0:AddListener(ISLAND_EVT.START_DEGATION, arg_18_0.OnStartDelegation)
	arg_18_0:AddListener(ISLAND_EVT.END_DEGATION, arg_18_0.OnEndDelegation)
	arg_18_0:AddListener(ISLAND_EVT.GEN_SYSTEM, arg_18_0.OnGenSystem)
	arg_18_0:AddListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_18_0.OnWorldObjectStartInteraction)
	arg_18_0:AddListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_18_0.OnWorldObjectEndInteraction)
	arg_18_0:AddListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_18_0.OnWorldObjectInitStatus)
	arg_18_0:AddListener(ISLAND_EVT.REFRESH_INTERACTION, arg_18_0.OnRefreshInteractionBtn)
	arg_18_0:AddListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_18_0.OnShowUnitHudAndOpBtn)
	arg_18_0:AddListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_18_0.OnHideUnitHudAndOpBtn)
	arg_18_0:AddListener(ISLAND_EVT.DETECTOR_CHANGED, arg_18_0.OnDetectorChanged)
	arg_18_0:AddListener(ISLAND_EVT.SELECTED_DETECTOR, arg_18_0.OnDetectorSelected)
	arg_18_0:AddListener(ISLAND_EVT.NPC_DETECTED, arg_18_0.OnNpcDetectorSelected)
	arg_18_0:AddListener(ISLAND_EVT.NO_NPC_DETECTED, arg_18_0.OnNpcDetectorUnSelected)
	arg_18_0:AddListener(ISLAND_EVT.SET_PLAYER_WORK, arg_18_0.OnPlayerWork)
	arg_18_0:AddListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_18_0.OnPlayerDeviceStateChange)
	arg_18_0:AddListener(ISLAND_EVT.UPDATE_HUD, arg_18_0.OnUpdateHud)
	arg_18_0:AddListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_18_0.OnUpdateHandCollectUnit)
	arg_18_0:AddListener(ISLAND_EVT.START_DELEGATE_SLOT_PERFORM, arg_18_0.OnDelegateSlotStartPerform)
	arg_18_0:AddListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_18_0.OnRecycleAllSlotEffct)
	arg_18_0:AddListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_18_0.OnSelectSlotEffectShow)
	arg_18_0:AddListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_18_0.OnLoadDelegatePreviewRole)
	arg_18_0:AddListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_18_0.OnUnLoadDelegatePreviewRole)
	arg_18_0:AddListener(ISLAND_EVT.Take_Plant_Attact, arg_18_0.OnTakePlantAttack)
	arg_18_0:AddListener(ISLAND_EVT.START_MANAGE, arg_18_0.OnStartManage)
	arg_18_0:AddListener(ISLAND_EVT.END_MANAGE, arg_18_0.OnEndManage)
	arg_18_0:AddListener(ISLAND_EVT.SHOW_HUD, arg_18_0.OnShowHud)
	arg_18_0:AddListener(ISLAND_EVT.HIDE_HUD, arg_18_0.OnHideHud)
	arg_18_0:AddListener(ISLAND_EVT.REFRESH_HUD, arg_18_0.OnRefreshHud)
	arg_18_0:AddListener(ISLAND_EVT.START_GUIDE, arg_18_0.OnStartGuide)
	arg_18_0:AddListener(ISLAND_EVT.END_GUIDE, arg_18_0.OnEndGuide)
	arg_18_0:AddListener(ISLAND_EVT.START_PERFORMANCE, arg_18_0.OnStartPerformance)
	arg_18_0:AddListener(ISLAND_EVT.END_PERFORMANCE, arg_18_0.OnEndPerformance)
	arg_18_0:AddListener(ISLAND_EVT.DISABLE_INPUT, arg_18_0.DisableInput)
	arg_18_0:AddListener(ISLAND_EVT.ENABLE_INPUT, arg_18_0.EnableInput)
	arg_18_0:AddListener(ISLAND_EVT.GEN_PATH_FINDER, arg_18_0.OnGenPathFinder)
	arg_18_0:AddListener(ISLAND_EVT.REMOVE_PATH_FINDER, arg_18_0.OnRemovePathFinder)
	arg_18_0:AddListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_18_0.OnActiveOrDisactiveUnit)
	arg_18_0:AddListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_18_0.OnOpenAniamtionOpPage)
	arg_18_0:AddListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_18_0.OnCloseAniamtionOpPage)
	arg_18_0:AddListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_18_0.OnMovePlayerBefore)
	arg_18_0:AddListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_18_0.OnRefreshTaskInfoHud)
	arg_18_0:AddListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_18_0.OnResponAniamtionOp)
	arg_18_0:AddListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_18_0.OnChangeVisterDress)
	arg_18_0:AddListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_18_0.OnSetVisitorSyncData)
	arg_18_0:AddListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_18_0.OnShowNpcAniamtionBubble)
	arg_18_0:AddListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_18_0.OnHideNpcAniamtionBubble)
	arg_18_0:AddListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_18_0.OnPlaySingleAnimationEnd)
	arg_18_0:AddListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_18_0.OnUpdateCustomOpPositon)
	arg_18_0:AddListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_18_0.OnChatMsgUpdate)
	arg_18_0:AddListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_18_0.OnChatRoomChange)
	arg_18_0:AddListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_18_0.OnShowChatMsg)
	arg_18_0:AddListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_18_0.OnResetFollowRandomizer)
	arg_18_0:AddListener(ISLAND_EVT.ADD_FOLLOWER, arg_18_0.OnFollowerAdd)
	arg_18_0:AddListener(ISLAND_EVT.DEL_FOLLOWER, arg_18_0.OnFollowerDel)
	arg_18_0:AddListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_18_0.OnCoupleActionWithFollower)
	arg_18_0:AddListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_18_0.OnLockPlayerInput)
	arg_18_0:AddListener(ISLAND_EVT.START_COUPLE_ACTION, arg_18_0.OnStartCoupleAction)
	arg_18_0:AddListener(ISLAND_EVT.END_COUPLE_ACTION, arg_18_0.OnEndCoupleAction)
	arg_18_0:AddListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_18_0.OnRefreshWeatherSystem)
	arg_18_0:AddListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_18_0.OnSystemUnlock)
	arg_18_0:AddListener(ISLAND_EVT.START_DO_COUPLE_ACTION, arg_18_0.OnStartDoCoupleAction)
	arg_18_0:AddListener(ISLAND_EVT.END_DO_COUPLE_ACTION, arg_18_0.OnEndDoCoupleAction)
	arg_18_0:AddListener(ISLAND_EVT.CANCEL_COUPLE_ACTION, arg_18_0.OnCancelCoupleAction)
end

function var_0_0.RemoveListeners(arg_19_0)
	arg_19_0:RemoveListener(ISLAND_EVT.GEN_UNIT, arg_19_0.OnGenUnit)
	arg_19_0:RemoveListener(ISLAND_EVT.RMOVE_UNIT, arg_19_0.OnRemoveUnit)
	arg_19_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_19_0.OnInterActionBegin)
	arg_19_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_19_0.OnInterActionEnd)
	arg_19_0:RemoveListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_19_0.OnStopUnit)
	arg_19_0:RemoveListener(ISLAND_EVT.MOVE_UNIT, arg_19_0.OnMoveUnit)
	arg_19_0:RemoveListener(ISLAND_EVT.INIT_FINISH, arg_19_0.OnSceneInited)
	arg_19_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER, arg_19_0.OnPlayerMove)
	arg_19_0:RemoveListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_19_0.OnPlayerStopMoveHandle)
	arg_19_0:RemoveListener(ISLAND_EVT.JUMP_PLAYER, arg_19_0.OnPlayerJump)
	arg_19_0:RemoveListener(ISLAND_EVT.APPROACH_UNIT, arg_19_0.OnShowInterActionPanel)
	arg_19_0:RemoveListener(ISLAND_EVT.LEAVE_UNIT, arg_19_0.OnHideInterActionPanel)
	arg_19_0:RemoveListener(ISLAND_EVT.TRACKING, arg_19_0.OnTracking)
	arg_19_0:RemoveListener(ISLAND_EVT.UNTRACKING, arg_19_0.OnUnTracking)
	arg_19_0:RemoveListener(ISLAND_EVT.AREACHANGE, arg_19_0.OnPlayerAreaChange)
	arg_19_0:RemoveListener(ISLAND_EVT.PLAYERRUN, arg_19_0.OnPlayerPlayerRun)
	arg_19_0:RemoveListener(ISLAND_EVT.SPRINT_PLAYER, arg_19_0.OnPlayerPlayerSprint)
	arg_19_0:RemoveListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_19_0.OnStopPlayerSprint)
	arg_19_0:RemoveListener(ISLAND_EVT.CHANGE_DRESS, arg_19_0.OnChangeDress)
	arg_19_0:RemoveListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_19_0.OnCharacterChangeDress)
	arg_19_0:RemoveListener(ISLAND_EVT.RESET_UNIT_POS, arg_19_0.OnResetUnitPos)
	arg_19_0:RemoveListener(ISLAND_EVT.RESET_UNIT_ROT, arg_19_0.OnResetUnitRotation)
	arg_19_0:RemoveListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_19_0.OnAnyPageOpen)
	arg_19_0:RemoveListener(ISLAND_EVT.Change_TakePhoto_Model, arg_19_0.OnChangeTakePhotoModel)
	arg_19_0:RemoveListener(ISLAND_EVT.Change_Photo_Height, arg_19_0.OnChange_Photo_Height)
	arg_19_0:RemoveListener(ISLAND_EVT.SetOpMoveBtnActve, arg_19_0.OnSetOpMoveBtnActve)
	arg_19_0:RemoveListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_19_0.OnAllPageClose)
	arg_19_0:RemoveListener(ISLAND_EVT.PLAY_BUBBLE, arg_19_0.OnPlayChatBubble)
	arg_19_0:RemoveListener(ISLAND_EVT.START_STORY, arg_19_0.OnStartStory)
	arg_19_0:RemoveListener(ISLAND_EVT.END_STORY, arg_19_0.OnEndStory)
	arg_19_0:RemoveListener(ISLAND_EVT.START_DEGATION, arg_19_0.OnStartDelegation)
	arg_19_0:RemoveListener(ISLAND_EVT.END_DEGATION, arg_19_0.OnEndDelegation)
	arg_19_0:RemoveListener(ISLAND_EVT.GEN_SYSTEM, arg_19_0.OnGenSystem)
	arg_19_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_19_0.OnWorldObjectStartInteraction)
	arg_19_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_19_0.OnWorldObjectEndInteraction)
	arg_19_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_19_0.OnWorldObjectInitStatus)
	arg_19_0:RemoveListener(ISLAND_EVT.REFRESH_INTERACTION, arg_19_0.OnRefreshInteractionBtn)
	arg_19_0:RemoveListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_19_0.OnShowUnitHudAndOpBtn)
	arg_19_0:RemoveListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_19_0.OnHideUnitHudAndOpBtn)
	arg_19_0:RemoveListener(ISLAND_EVT.DETECTOR_CHANGED, arg_19_0.OnDetectorChanged)
	arg_19_0:RemoveListener(ISLAND_EVT.SELECTED_DETECTOR, arg_19_0.OnDetectorSelected)
	arg_19_0:RemoveListener(ISLAND_EVT.NPC_DETECTED, arg_19_0.OnNpcDetectorSelected)
	arg_19_0:RemoveListener(ISLAND_EVT.NO_NPC_DETECTED, arg_19_0.OnNpcDetectorUnSelected)
	arg_19_0:RemoveListener(ISLAND_EVT.SET_PLAYER_WORK, arg_19_0.OnPlayerWork)
	arg_19_0:RemoveListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_19_0.OnPlayerDeviceStateChange)
	arg_19_0:RemoveListener(ISLAND_EVT.UPDATE_HUD, arg_19_0.OnUpdateHud)
	arg_19_0:RemoveListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_19_0.OnUpdateHandCollectUnit)
	arg_19_0:RemoveListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_19_0.OnRecycleAllSlotEffct)
	arg_19_0:RemoveListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_19_0.OnSelectSlotEffectShow)
	arg_19_0:RemoveListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_19_0.OnLoadDelegatePreviewRole)
	arg_19_0:RemoveListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_19_0.OnUnLoadDelegatePreviewRole)
	arg_19_0:RemoveListener(ISLAND_EVT.Take_Plant_Attact, arg_19_0.OnTakePlantAttack)
	arg_19_0:RemoveListener(ISLAND_EVT.START_MANAGE, arg_19_0.OnStartManage)
	arg_19_0:RemoveListener(ISLAND_EVT.END_MANAGE, arg_19_0.OnEndManage)
	arg_19_0:RemoveListener(ISLAND_EVT.SHOW_HUD, arg_19_0.OnShowHud)
	arg_19_0:RemoveListener(ISLAND_EVT.HIDE_HUD, arg_19_0.OnHideHud)
	arg_19_0:RemoveListener(ISLAND_EVT.REFRESH_HUD, arg_19_0.OnRefreshHud)
	arg_19_0:RemoveListener(ISLAND_EVT.START_GUIDE, arg_19_0.OnStartGuide)
	arg_19_0:RemoveListener(ISLAND_EVT.END_GUIDE, arg_19_0.OnEndGuide)
	arg_19_0:RemoveListener(ISLAND_EVT.START_PERFORMANCE, arg_19_0.OnStartPerformance)
	arg_19_0:RemoveListener(ISLAND_EVT.END_PERFORMANCE, arg_19_0.OnEndPerformance)
	arg_19_0:RemoveListener(ISLAND_EVT.DISABLE_INPUT, arg_19_0.DisableInput)
	arg_19_0:RemoveListener(ISLAND_EVT.ENABLE_INPUT, arg_19_0.EnableInput)
	arg_19_0:RemoveListener(ISLAND_EVT.GEN_PATH_FINDER, arg_19_0.OnGenPathFinder)
	arg_19_0:RemoveListener(ISLAND_EVT.REMOVE_PATH_FINDER, arg_19_0.OnRemovePathFinder)
	arg_19_0:RemoveListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_19_0.OnActiveOrDisactiveUnit)
	arg_19_0:RemoveListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_19_0.OnOpenAniamtionOpPage)
	arg_19_0:RemoveListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_19_0.OnCloseAniamtionOpPage)
	arg_19_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_19_0.OnMovePlayerBefore)
	arg_19_0:RemoveListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_19_0.OnRefreshTaskInfoHud)
	arg_19_0:RemoveListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_19_0.OnResponAniamtionOp)
	arg_19_0:RemoveListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_19_0.OnChangeVisterDress)
	arg_19_0:RemoveListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_19_0.OnSetVisitorSyncData)
	arg_19_0:RemoveListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_19_0.OnShowNpcAniamtionBubble)
	arg_19_0:RemoveListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_19_0.OnHideNpcAniamtionBubble)
	arg_19_0:RemoveListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_19_0.OnPlaySingleAnimationEnd)
	arg_19_0:RemoveListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_19_0.OnUpdateCustomOpPositon)
	arg_19_0:RemoveListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_19_0.OnChatMsgUpdate)
	arg_19_0:RemoveListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_19_0.OnChatRoomChange)
	arg_19_0:RemoveListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_19_0.OnShowChatMsg)
	arg_19_0:RemoveListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_19_0.OnResetFollowRandomizer)
	arg_19_0:RemoveListener(ISLAND_EVT.ADD_FOLLOWER, arg_19_0.OnFollowerAdd)
	arg_19_0:RemoveListener(ISLAND_EVT.DEL_FOLLOWER, arg_19_0.OnFollowerDel)
	arg_19_0:RemoveListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_19_0.OnCoupleActionWithFollower)
	arg_19_0:RemoveListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_19_0.OnLockPlayerInput)
	arg_19_0:RemoveListener(ISLAND_EVT.START_COUPLE_ACTION, arg_19_0.OnStartCoupleAction)
	arg_19_0:RemoveListener(ISLAND_EVT.END_COUPLE_ACTION, arg_19_0.OnEndCoupleAction)
	arg_19_0:RemoveListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_19_0.OnRefreshWeatherSystem)
	arg_19_0:RemoveListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_19_0.OnSystemUnlock)
	arg_19_0:RemoveListener(ISLAND_EVT.START_DO_COUPLE_ACTION, arg_19_0.OnStartDoCoupleAction)
	arg_19_0:RemoveListener(ISLAND_EVT.END_DO_COUPLE_ACTION, arg_19_0.OnEndDoCoupleAction)
	arg_19_0:RemoveListener(ISLAND_EVT.CANCEL_COUPLE_ACTION, arg_19_0.OnCancelCoupleAction)
end

function var_0_0.OnSystemUnlock(arg_20_0, arg_20_1)
	if arg_20_1 == IslandAblityAgency.ANIMATION_OP_ID then
		arg_20_0:GetSubView(IslandOpView):UpdateAnimationOpBtn()
	end
end

function var_0_0.OnStartCoupleAction(arg_21_0)
	arg_21_0:UnBlockLayer1Event(false)
	arg_21_0:GetSubView(IslandAniamtionOpView):OnStartCoupleAction()
end

function var_0_0.OnEndCoupleAction(arg_22_0)
	arg_22_0:UnBlockLayer1Event(true)
	arg_22_0:GetSubView(IslandAniamtionOpView):OnEndCoupleAction()
end

function var_0_0.OnCancelCoupleAction(arg_23_0)
	if arg_23_0.coupleActionPlayer and arg_23_0.coupleActionPlayer:IsPlaying() then
		arg_23_0.coupleActionPlayer:Stop()
	end

	if arg_23_0.coupleAction4FollowerPlayer and arg_23_0.coupleAction4FollowerPlayer:IsPlaying() then
		arg_23_0.coupleAction4FollowerPlayer:Stop()
	end

	arg_23_0:OnEndCoupleAction()
end

function var_0_0.OnCoupleActionWithFollower(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_24_1 = arg_24_0:GetPlayerPosition()
	local var_24_2 = pg.island_set.action_bubble_range.key_value_int
	local var_24_3 = _.select(var_24_0, function(arg_25_0)
		return Vector3.Distance(arg_25_0:GetPosition(), var_24_1) <= var_24_2
	end)

	if #var_24_3 <= 0 then
		return
	end

	local var_24_4 = var_24_3[math.random(1, #var_24_3)]
	local var_24_5 = pg.island_action[arg_24_1]

	arg_24_0.coupleAction4FollowerPlayer:Play(var_24_4, arg_24_0.player, var_24_5)
	arg_24_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
end

function var_0_0.OnFollowerAdd(arg_26_0)
	arg_26_0:GetSubView(IslandOpView):FlushFollowerList()
end

function var_0_0.OnFollowerDel(arg_27_0)
	arg_27_0:GetSubView(IslandOpView):FlushFollowerList()
end

function var_0_0.OnResetFollowRandomizer(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0:GetFollowerModule(arg_28_1)

	if not var_28_0 then
		return
	end

	var_28_0:SetBtRandomizer()
end

function var_0_0.OnShowChatMsg(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.player.id
	local var_29_1 = arg_29_0:GetPlayerUnitModule(var_29_0)

	if not var_29_1 then
		return
	end

	arg_29_0:GetSubView(IslandTopHeadHudView):PlayChat(var_29_1, arg_29_1.emojiId, arg_29_1.content, nil)
end

function var_0_0.OnChatRoomChange(arg_30_0)
	arg_30_0:GetSubView(IslandAniamtionOpView):UpdateChatRoom()
end

function var_0_0.OnChatMsgUpdate(arg_31_0)
	arg_31_0:GetSubView(IslandAniamtionOpView):UpdateMsgList()
end

function var_0_0.OnPlaySingleAnimationEnd(arg_32_0, arg_32_1)
	if not arg_32_0:GetSelectedNpcId() then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_32_1, 0, 0, 0, 0))

		return
	end

	local var_32_0 = arg_32_0:GetSelectedNpcId()
	local var_32_1, var_32_2 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_32_0)
	local var_32_3 = arg_32_0:GetUnitModuleWithType(var_32_1, var_32_2)

	arg_32_0.npcActionPlayer:Play(var_32_3, arg_32_0.player, arg_32_1)
end

function var_0_0.OnShowNpcAniamtionBubble(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:GetStrollUnitModule(arg_33_1.id)

	if not var_33_0 then
		return
	end

	local var_33_1 = arg_33_1:GetActionFeedback()

	arg_33_0:GetSubView(IslandBottomHeadHudView):ShowAnimationOp(var_33_0, var_33_1)
end

function var_0_0.OnHideNpcAniamtionBubble(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetStrollUnitModule(arg_34_1.id)

	arg_34_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_34_0)
end

function var_0_0.OnStartDoCoupleAction(arg_35_0)
	arg_35_0:GetSubView(IslandCancelAnimationOpView):ShowCancelableAnimationOp(arg_35_0.player)
end

function var_0_0.OnEndDoCoupleAction(arg_36_0)
	arg_36_0:GetSubView(IslandCancelAnimationOpView):HideCancelableAnimationOp(arg_36_0.player)
end

function var_0_0.OnResponAniamtionOp(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1.id
	local var_37_1 = arg_37_1.targetId
	local var_37_2 = arg_37_1.actionId
	local var_37_3 = arg_37_0:GetPlayerUnitModule(var_37_0)

	if not var_37_3 then
		return
	end

	if var_37_2 == 0 then
		if not arg_37_0:IsPlayer(var_37_0) then
			arg_37_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_37_3)
		else
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_37_2, 1, 0, 0, 0))
		end

		return
	end

	local var_37_4 = pg.island_action[var_37_2]

	if var_37_1 == 0 and var_37_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_37_0:IsPlayer(var_37_0) then
		arg_37_0:GetSubView(IslandTopHeadHudView):ShowAnimationOp(var_37_3, var_37_2)
	elseif var_37_1 > 0 and var_37_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_37_0:IsPlayer(var_37_1) then
		local var_37_5 = arg_37_0:GetPlayerUnitModule(var_37_1)

		arg_37_0.coupleActionPlayer:Play(var_37_3, var_37_5, var_37_4)
		arg_37_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_37_5)
	elseif var_37_1 > 0 and var_37_4.type == IslandConst.ANIMATION_OP_DOUBLE and arg_37_0:IsPlayer(var_37_1) then
		local var_37_6 = arg_37_0:GetPlayerUnitModule(var_37_1)

		arg_37_0.coupleActionPlayer:Play(var_37_3, var_37_6, var_37_4)
		arg_37_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_37_2, 1, var_37_1, 0, 1))
	end
end

function var_0_0.OnChangeVisterDress(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1.id

	if arg_38_0:IsPlayer(var_38_0) then
		return
	end

	local var_38_1 = arg_38_0:GetPlayerUnitModule(var_38_0)

	if var_38_1 then
		var_38_1:OnChangeDress(arg_38_1.changeDressData)
	end
end

function var_0_0.IsPlayer(arg_39_0, arg_39_1)
	return arg_39_0.player.id == arg_39_1
end

function var_0_0.OnOpenAniamtionOpPage(arg_40_0)
	arg_40_0:GetSubView(IslandAniamtionOpView):TryEnable()
	arg_40_0:GetSubView(IslandOpView):TryDisable()
	arg_40_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_ANIMATION_OP)
end

function var_0_0.OnCloseAniamtionOpPage(arg_41_0)
	arg_41_0:GetSubView(IslandOpView):TryEnable()
	arg_41_0:NotifiyIsland(ISLAND_EX_EVT.CLOSE_ANIMATION_OP)
end

function var_0_0.OnGenPathFinder(arg_42_0, arg_42_1)
	local var_42_0 = IslandPathFinder.New(arg_42_0)
	local var_42_1 = defaultValue(arg_42_1.navData.waitUntilDone, false)

	var_42_0:Start(arg_42_1.navData, function()
		table.removebyvalue(arg_42_0.pathfinders, var_42_0)
		var_42_0:Dispose()

		if arg_42_1.onEndAction then
			arg_42_1.onEndAction()
		end

		arg_42_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH_DONE, arg_42_1.navData.index)

		if var_42_1 and arg_42_1.callback then
			arg_42_1.callback()
		end
	end)
	arg_42_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH, arg_42_1.navData.index)

	if not var_42_1 and arg_42_1.callback then
		arg_42_1.callback()
	end

	table.insert(arg_42_0.pathfinders, var_42_0)
end

function var_0_0.OnRemovePathFinder(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0:GetUnitModuleWithType(arg_44_1.unitType, arg_44_1.unitId)
	local var_44_1 = _.detect(arg_44_0.pathfinders, function(arg_45_0)
		return arg_45_0:IsSameUnit(var_44_0)
	end)

	if not var_44_1 then
		return
	end

	var_44_1:Stop()
	var_44_1:Dispose()
	table.removebyvalue(arg_44_0.pathfinders, var_44_1)
end

function var_0_0.OnSceneInited(arg_46_0, arg_46_1)
	IslandCameraMgr.instance:LookAt(arg_46_0.player._tf)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraZoom)):SetMaxMinZoom(arg_46_1.min, arg_46_1.max, arg_46_1.value)
	arg_46_0:InitFocusCamera()
	arg_46_0:InitTakePhotoCamera()

	for iter_46_0, iter_46_1 in ipairs(arg_46_0:GetAllUnits()) do
		iter_46_1:Start()
	end

	arg_46_0.isInit = true
end

function var_0_0.InitFocusCamera(arg_47_0)
	local var_47_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)

	var_47_0.Follow = arg_47_0.player._tf
	var_47_0.LookAt = arg_47_0.player._tf
end

function var_0_0.InitTakePhotoCamera(arg_48_0)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).Follow = arg_48_0.firstTakePhotoItem._tf

	local var_48_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)

	var_48_0.Follow = arg_48_0.thirdTakePhotoItem._tf
	var_48_0.LookAt = arg_48_0.thirdTakePhotoItem._tf
end

function var_0_0.OnNpcDetectorSelected(arg_49_0, arg_49_1)
	if arg_49_0.selectedNpcId then
		return
	end

	local var_49_0 = arg_49_1.node

	if not var_49_0 then
		return
	end

	arg_49_0.selectedNpcId = var_49_0:GetComponent(typeof(WorldObjectItem)).uniqueId
end

function var_0_0.GetSelectedNpcId(arg_50_0)
	return arg_50_0.selectedNpcId
end

function var_0_0.OnNpcDetectorUnSelected(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.node

	if not var_51_0 then
		return
	end

	local var_51_1 = var_51_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	if arg_51_0.selectedNpcId ~= var_51_1 then
		return
	end

	arg_51_0.selectedNpcId = nil
end

function var_0_0.OnDetectorChanged(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1.node

	if not var_52_0 then
		return
	end

	local var_52_1 = var_52_0:GetBlackboardVariable("DetectorList")

	for iter_52_0 = 1, var_52_1.Count do
		local var_52_2 = var_52_1[iter_52_0 - 1]
		local var_52_3, var_52_4 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_52_2)

		if var_52_3 == IslandConst.UNIT_LIST_OBJ then
			local var_52_5 = arg_52_0:GetUnitModuleWithType(var_52_3, var_52_4)

			if var_52_5 then
				arg_52_0:Op("NotifiyIsland", ISLAND_EX_EVT.APPROACH_OBJECT, var_52_5.id)
			end
		end
	end
end

function var_0_0.OnDetectorSelected(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.node

	if not var_53_0 then
		return
	end

	local var_53_1 = var_53_0:GetBlackboardVariable("SelectedObj")

	if not var_53_1 or var_53_1 == "" then
		arg_53_0:OnClearSelectedUnit()
	else
		local var_53_2, var_53_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_53_1)
		local var_53_4 = arg_53_0:GetUnitModuleWithType(var_53_2, var_53_3)

		if var_53_4 then
			arg_53_0:OnSelectedUnit(var_53_4)
		end
	end
end

function var_0_0.OnClearSelectedUnit(arg_54_0)
	return
end

function var_0_0.OnSelectedUnit(arg_55_0, arg_55_1)
	return
end

function var_0_0.OnRefreshInteractionBtn(arg_56_0)
	arg_56_0:GetSubView(IslandInteractionView):RefreshInteractionBtns()
end

function var_0_0.OnStartStory(arg_57_0)
	arg_57_0.playingStory = true

	arg_57_0:DisablePlayerOp()
end

function var_0_0.OnEndStory(arg_58_0)
	arg_58_0.playingStory = false

	arg_58_0:EnablePlayerOp()
end

function var_0_0.DisablePlayerOp(arg_59_0)
	arg_59_0.player:StopMoveHandle()
	arg_59_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_59_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_59_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_59_0:GetSubView(IslandOpView):TryDisable()
end

function var_0_0.EnablePlayerOp(arg_60_0)
	arg_60_0:GetSubView(IslandOpView):TryEnablePlayerOp()
	arg_60_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_60_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_60_0:GetSubView(IslandOpView):TryEnable()
end

function var_0_0.OnStartPerformance(arg_61_0)
	return
end

function var_0_0.OnEndPerformance(arg_62_0)
	if not arg_62_0.anyPageOpen then
		arg_62_0:GetSubView(IslandOpView):ResetShowBalance()
	end
end

function var_0_0.OnPlayChatBubble(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0:GetAllUnits()

	arg_63_0:GetSubView(IslandTopHeadHudView):PlayBubble(arg_63_1.name, var_63_0, arg_63_1.callback)
end

function var_0_0.OnAnyPageOpen(arg_64_0, arg_64_1)
	arg_64_0.anyPageOpen = true

	arg_64_0.player:StopMoveHandle()
	arg_64_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_64_0:GetSubView(IslandSlotHudView):TryDisable()
	arg_64_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_64_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_64_0:GetSubView(IslandAniamtionOpView):CloseAndReset()
end

function var_0_0.OnAllPageClose(arg_65_0)
	arg_65_0.anyPageOpen = false

	arg_65_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_65_0:GetSubView(IslandSlotHudView):TryEnable()
	arg_65_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_65_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnChange_Photo_Height(arg_66_0, arg_66_1, arg_66_2)
	arg_66_0.takePhotoModel = arg_66_1

	if arg_66_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		-- block empty
	elseif arg_66_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_66_0.thirdTakePhotoItem:ChangeHeight(arg_66_2)
	end
end

function var_0_0.OnChangeTakePhotoModel(arg_67_0, arg_67_1)
	arg_67_0.takePhotoModel = arg_67_1

	if arg_67_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_67_0.firstTakePhotoItem:Enable()

		arg_67_0.firstTakePhotoItem._tf.position = arg_67_0.player._tf.position
		arg_67_0.firstTakePhotoItem._tf.rotation = arg_67_0.player._tf.rotation

		arg_67_0.firstTakePhotoItem:SetTargetRotation(arg_67_0.player._tf.rotation)
		arg_67_0.player:SetActiveByLayer(false)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook)):SetPosAndRotationByTargetDir(arg_67_0.player._tf.forward)
	elseif arg_67_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_67_0.thirdTakePhotoItem:Enable()

		arg_67_0.player._tf.position = arg_67_0.firstTakePhotoItem._tf.position
		arg_67_0.player._tf.rotation = arg_67_0.firstTakePhotoItem._tf.rotation

		arg_67_0.player:SetTargetRotation(arg_67_0.firstTakePhotoItem._tf.rotation)
		arg_67_0.player:SetActiveByLayer(true)

		arg_67_0.thirdTakePhotoItem._tf.position = arg_67_0.firstTakePhotoItem._tf:TransformPoint(Vector3(0, 0, -5))
		arg_67_0.thirdTakePhotoItem._tf.rotation = arg_67_0.firstTakePhotoItem._tf.rotation

		arg_67_0.thirdTakePhotoItem:SetTargetRotation(arg_67_0.firstTakePhotoItem._tf.rotation)

		local var_67_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook))
		local var_67_1 = arg_67_0.player._tf.position + Vector3(0, 0.5, 0)
		local var_67_2 = arg_67_0.thirdTakePhotoItem._tf.position + Vector3(0, 1, 0)

		var_67_0:SetPosAndRotationByTargetDir((var_67_1 - var_67_2).normalized)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)
	else
		arg_67_0.firstTakePhotoItem:Disable()
		arg_67_0.thirdTakePhotoItem:Disable()

		arg_67_0.player._tf.position = arg_67_0.firstTakePhotoItem._tf.position
		arg_67_0.player._tf.rotation = arg_67_0.firstTakePhotoItem._tf.rotation

		arg_67_0.player:SetTargetRotation(arg_67_0.firstTakePhotoItem._tf.rotation)
		arg_67_0.player:SetActiveByLayer(true)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraLook)):ResetCameraPos()
	end

	arg_67_0:GetSubView(IslandOpView):ChangeTakePhotoModel(arg_67_1)
end

function var_0_0.OnSetOpMoveBtnActve(arg_68_0, arg_68_1, arg_68_2)
	arg_68_0:GetSubView(IslandOpView):ShowOrHideMoveBtn(arg_68_1, arg_68_2)
end

function var_0_0.OnInterActionBegin(arg_69_0)
	arg_69_0.player:StopMoveHandle()
	arg_69_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_70_0)
	arg_70_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_71_0, arg_71_1)
	arg_71_0.showInterObjId = arg_71_1.id

	arg_71_0:GetSubView(IslandInteractionView):ShowInterActionPanel(arg_71_1)
	arg_71_0:Op("NotifiyIsland", ISLAND_EX_EVT.SHOW_INTERACTION, arg_71_0.showInterObjId)
end

function var_0_0.OnHideInterActionPanel(arg_72_0, arg_72_1)
	if arg_72_0.showInterObjId ~= arg_72_1.id then
		return
	end

	arg_72_0.showInterObjId = nil

	arg_72_0:GetSubView(IslandInteractionView):HideInterActionPanel()
end

function var_0_0.OnStartGuide(arg_73_0)
	arg_73_0.player:StopMoveHandle()
	arg_73_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.OnEndGuide(arg_74_0)
	if arg_74_0.playingStory then
		return
	end

	arg_74_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.DisableInput(arg_75_0)
	arg_75_0.player:StopMoveHandle()
	arg_75_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.EnableInput(arg_76_0)
	arg_76_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.OnTracking(arg_77_0, arg_77_1)
	arg_77_0.trackId = tonumber(arg_77_1.id)
	arg_77_0.needTryTrack = true
end

function var_0_0.TryTrack(arg_78_0)
	arg_78_0:TrySetTrack(arg_78_0.trackId)
end

function var_0_0.TrySetTrack(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_0:GetOptTrackingTarget(arg_79_1)

	if not var_79_0 or not var_79_0._go then
		return
	end

	arg_79_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_79_0.player, var_79_0, arg_79_1)

	arg_79_0.needTryTrack = false
end

local function var_0_1(arg_80_0, arg_80_1)
	local var_80_0 = pg.island_world_objects[arg_80_0]

	if not var_80_0 then
		return
	end

	return var_80_0.mapId == arg_80_1
end

local function var_0_2(arg_81_0, arg_81_1, arg_81_2)
	for iter_81_0, iter_81_1 in ipairs(arg_81_0) do
		for iter_81_2, iter_81_3 in ipairs(iter_81_1[2]) do
			local var_81_0 = pg.island_interaction[iter_81_3]

			if var_81_0.type == arg_81_2 and var_0_1(tonumber(var_81_0.param), arg_81_1) then
				return iter_81_1[1]
			end
		end
	end

	return nil
end

local function var_0_3(arg_82_0)
	local var_82_0 = {}
	local var_82_1 = {}

	for iter_82_0, iter_82_1 in ipairs(arg_82_0) do
		for iter_82_2, iter_82_3 in ipairs(iter_82_1[2]) do
			local var_82_2 = pg.island_interaction[iter_82_3]

			if var_82_2.type == IslandInteractionUntil.TYPE_TRANSFER then
				table.insert(var_82_0, iter_82_1[1])
			elseif var_82_2.type == IslandInteractionUntil.TYPE_SP_TRANSFER then
				table.insert(var_82_1, iter_82_1[1])
			end
		end
	end

	if #var_82_1 > 0 then
		return var_82_1[1]
	end

	if #var_82_0 > 0 then
		return var_82_0[1]
	end

	return nil
end

function var_0_0.GetOptTrackingTarget(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_0:GetUnitModule(arg_83_1)

	if var_83_0 then
		return var_83_0
	end

	local var_83_1 = pg.island_world_objects[arg_83_1]

	if not var_83_1 then
		return nil
	end

	local var_83_2 = {}

	for iter_83_0, iter_83_1 in ipairs(arg_83_0:GetUnitListByKey(IslandConst.UNIT_LIST_OBJ)) do
		local var_83_3, var_83_4 = iter_83_1:IsMapTransfer()

		if var_83_3 then
			table.insert(var_83_2, {
				iter_83_1,
				var_83_4
			})
		end
	end

	local var_83_5
	local var_83_6 = var_0_2(var_83_2, var_83_1.mapId, IslandInteractionUntil.TYPE_TRANSFER) or var_0_2(var_83_2, var_83_1.mapId, IslandInteractionUntil.TYPE_SP_TRANSFER)

	var_83_6 = var_83_6 or var_0_3(var_83_2)

	return var_83_6
end

function var_0_0.OnUnTracking(arg_84_0)
	arg_84_0.trackId = nil

	arg_84_0:GetSubView(IslandDistanceView):CancelTracking()
end

function var_0_0.OnUpdateCustomOpPositon(arg_85_0)
	arg_85_0:GetSubView(IslandOpView):InitOpCustumPositon()
end

function var_0_0.OnGenUnit(arg_86_0, arg_86_1, arg_86_2)
	local var_86_0 = arg_86_0.unitBuilders[arg_86_1:GetType()]:Build(arg_86_1, arg_86_2)

	arg_86_0:AddUnit(var_86_0)

	if arg_86_1:IsPlayer() then
		arg_86_0.player = var_86_0
	end

	if arg_86_1:IsFirstTakePhoto() then
		arg_86_0.firstTakePhotoItem = var_86_0
	end

	if arg_86_1:IsThirdTakePhoto() then
		arg_86_0.thirdTakePhotoItem = var_86_0
	end
end

function var_0_0.OnGenSystem(arg_87_0, arg_87_1)
	local var_87_0 = arg_87_0.systemBuilders[arg_87_1:GetType()]:Build(arg_87_1)

	arg_87_0:AddUnit(var_87_0)
end

function var_0_0.OnActiveOrDisactiveUnit(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
	local var_88_0

	if arg_88_1 == 0 then
		var_88_0 = arg_88_0.player
	else
		var_88_0 = arg_88_0:GetUnitModuleWithType(arg_88_2, arg_88_1)
	end

	if var_88_0 and arg_88_3 then
		var_88_0:Enable()
	end

	if var_88_0 and not arg_88_3 then
		var_88_0:Disable()
	end
end

function var_0_0.OnResetUnitPos(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	local var_89_0 = arg_89_0:GetUnitModuleWithType(arg_89_2, arg_89_1)

	if var_89_0 then
		var_89_0._go.transform.position = arg_89_3
	end
end

function var_0_0.OnResetUnitRotation(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
	local var_90_0 = arg_90_0:GetUnitModuleWithType(arg_90_2, arg_90_1)

	if var_90_0 then
		var_90_0._go.transform.eulerAngles = arg_90_3
	end
end

function var_0_0.OnMoveUnit(arg_91_0, arg_91_1)
	assert(arg_91_1.type, "type should be exist")

	local var_91_0 = arg_91_0:GetUnitModuleWithType(arg_91_1.type, arg_91_1.id)

	if var_91_0 then
		var_91_0:SetDestination(arg_91_1.position, arg_91_1.speed, nil, arg_91_1.charaRadius)
	end
end

function var_0_0.OnStopUnit(arg_92_0, arg_92_1)
	assert(arg_92_1.type, "type should be exist")

	local var_92_0 = arg_92_0:GetUnitModuleWithType(arg_92_1.type, arg_92_1.id)

	if var_92_0 then
		var_92_0:StopMove()
	end
end

function var_0_0.OnRemoveUnit(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0 = arg_93_0:GetUnitListByKey(arg_93_1)
	local var_93_1 = 0

	for iter_93_0, iter_93_1 in ipairs(var_93_0 or {}) do
		if iter_93_1.id == arg_93_2 then
			var_93_1 = iter_93_0

			break
		end
	end

	if var_93_1 > 0 then
		local var_93_2 = var_93_0[var_93_1]

		for iter_93_2 = #arg_93_0.pathfinders, 1, -1 do
			local var_93_3 = arg_93_0.pathfinders[iter_93_2]

			if var_93_3:IsSameUnit(var_93_2) then
				var_93_3:Dispose()
				table.remove(arg_93_0.pathfinders, iter_93_2)
			end
		end

		arg_93_0:RemoveUnit(var_93_2)
		var_93_2:Dispose()
		arg_93_0:OnHideUnitHudAndOpBtn({
			type = arg_93_1,
			id = var_93_2.id
		}, true)
		arg_93_0:GetSubView(IslandTopHeadHudView):HideHud({
			type = arg_93_1,
			id = arg_93_2
		})
		arg_93_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_93_2)
		arg_93_0:GetSubView(IslandInteractionView):CloseInterActionPanelByUnitIdRemove(arg_93_2)
	end
end

function var_0_0.GetAllUnits(arg_94_0)
	table.clear(arg_94_0._unitList)

	for iter_94_0, iter_94_1 in pairs(arg_94_0:GetUnitListRegitser()) do
		for iter_94_2, iter_94_3 in pairs(iter_94_1) do
			table.insert(arg_94_0._unitList, iter_94_3)
		end
	end

	return arg_94_0._unitList
end

function var_0_0.GetUnitModuleWithType(arg_95_0, arg_95_1, arg_95_2)
	local var_95_0 = arg_95_0:GetUnitListByKey(arg_95_1)

	for iter_95_0, iter_95_1 in ipairs(var_95_0) do
		if iter_95_1.id == arg_95_2 then
			return iter_95_1
		end
	end

	return nil
end

function var_0_0.GetPlayerUnitModule(arg_96_0, arg_96_1)
	return arg_96_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_96_1)
end

function var_0_0.GetUnitModule(arg_97_0, arg_97_1)
	return arg_97_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_97_1)
end

function var_0_0.GetSystemModule(arg_98_0, arg_98_1)
	return arg_98_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_SYSTEM, arg_98_1)
end

function var_0_0.GetSystemUnitModule(arg_99_0, arg_99_1)
	return arg_99_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_99_1)
end

function var_0_0.GetStrollUnitModule(arg_100_0, arg_100_1)
	return arg_100_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_STROLL, arg_100_1)
end

function var_0_0.GetManageSystemModule(arg_101_0, arg_101_1)
	return arg_101_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_MANAGE_SYSTEM, arg_101_1)
end

function var_0_0.GetFollowerModule(arg_102_0, arg_102_1)
	return arg_102_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_FOLLOW, arg_102_1)
end

function var_0_0.OnMovePlayerBefore(arg_103_0)
	if arg_103_0.player:CheckMovement() and arg_103_0.isLockPlayInput then
		arg_103_0.isLockPlayInput = false
	end

	arg_103_0:GetSubView(IslandAniamtionOpView):OnMovePlayerBefore()
end

function var_0_0.OnLockPlayerInput(arg_104_0)
	if arg_104_0.playerInputing then
		arg_104_0.isLockPlayInput = true

		arg_104_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerMove(arg_105_0, arg_105_1)
	if arg_105_0.isLockPlayInput then
		return
	end

	arg_105_0.playerInputing = true

	if arg_105_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_105_0.firstTakePhotoItem:MoveHandle(arg_105_1.targetDir, arg_105_1.force)
	elseif arg_105_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_105_0.thirdTakePhotoItem:MoveHandle(arg_105_1.targetDir, arg_105_1.force)
	else
		arg_105_0.player:MoveHandle(arg_105_1.targetDir, arg_105_1.force)
	end
end

function var_0_0.OnPlayerStopMove(arg_106_0)
	if arg_106_0.isLockPlayInput then
		arg_106_0.isLockPlayInput = false
	end

	arg_106_0.playerInputing = true

	if arg_106_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_106_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_106_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_106_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_106_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerStopMoveHandle(arg_107_0)
	if arg_107_0.isLockPlayInput then
		arg_107_0.isLockPlayInput = false
	end

	arg_107_0.playerInputing = true

	if arg_107_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_107_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_107_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_107_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_107_0.player:StopMoveHandleByInput()
	end
end

function var_0_0.OnPlayerJump(arg_108_0)
	if arg_108_0.takePhotoModel == IslandConst.TakePhotoModel.First or arg_108_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		return
	end

	arg_108_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_109_0)
	arg_109_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_110_0)
	if arg_110_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_110_0.firstTakePhotoItem:OnPlayerPlayerSprint()
	elseif arg_110_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		-- block empty
	else
		arg_110_0.player:OnPlayerPlayerSprint()
	end
end

function var_0_0.OnStopPlayerSprint(arg_111_0)
	if arg_111_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_111_0.firstTakePhotoItem:OnStopPlayerSprint()
	elseif arg_111_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_111_0.thirdTakePhotoItem:OnStopPlayerSprint()
	else
		arg_111_0.player:OnStopPlayerSprint()
	end
end

function var_0_0.OnPlayerWork(arg_112_0, arg_112_1, arg_112_2)
	arg_112_0.player:WorkHandle(arg_112_1, arg_112_2)
end

function var_0_0.OnPlayerDeviceStateChange(arg_113_0, arg_113_1)
	arg_113_0.player:DeviceStateHandle(arg_113_1)
end

function var_0_0.OnSetVisitorSyncData(arg_114_0, arg_114_1, arg_114_2)
	local var_114_0 = arg_114_0:GetPlayerUnitModule(arg_114_1)

	if var_114_0 then
		var_114_0:UpdateSyncData(arg_114_2)
	end
end

function var_0_0.OnWorldObjectStartInteraction(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	local var_115_0 = arg_115_2:GetHostId()
	local var_115_1 = arg_115_2:GetUserId()
	local var_115_2 = arg_115_0:GetUnitModule(var_115_0)
	local var_115_3 = arg_115_0:GetPlayerUnitModule(var_115_1)
	local var_115_4 = arg_115_0.player == var_115_3

	if var_115_4 then
		arg_115_0:GetSubView(IslandOpView):StartInteraction()
	end

	local var_115_5 = arg_115_1:GetTimeline()[arg_115_3]
	local var_115_6 = arg_115_1:GetBlackboardParam()[arg_115_3]

	var_115_2:StartInteract(var_115_3, arg_115_2.id, arg_115_3, var_115_5, var_115_6, arg_115_1:AnySlotUsing(), var_115_4)
end

function var_0_0.OnWorldObjectEndInteraction(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = arg_116_2:GetHostId()
	local var_116_1 = arg_116_2:GetUserId()
	local var_116_2 = arg_116_0:GetUnitModule(var_116_0)
	local var_116_3 = arg_116_0:GetPlayerUnitModule(var_116_1)
	local var_116_4 = arg_116_0.player == var_116_3

	if var_116_4 then
		arg_116_0:GetSubView(IslandOpView):EndInteraction()
	end

	var_116_2:EndInteract(var_116_3, arg_116_2.id, not arg_116_1:AnySlotUsing(), var_116_4)
end

function var_0_0.OnWorldObjectInitStatus(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = arg_117_0:GetUnitModule(arg_117_1.id)
	local var_117_1 = arg_117_1:GetTimeline()[arg_117_2]
	local var_117_2 = arg_117_1:GetBlackboardParam()[arg_117_2]

	var_117_0:InitStatus(arg_117_2, var_117_1, var_117_2)
end

function var_0_0.OnPlayerAreaChange(arg_118_0)
	arg_118_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnChangeDress(arg_119_0, arg_119_1, arg_119_2)
	arg_119_0.player:OnChangeDress(arg_119_1, arg_119_2)
end

function var_0_0.OnCharacterChangeDress(arg_120_0, arg_120_1, arg_120_2, arg_120_3, arg_120_4)
	local var_120_0 = arg_120_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_120_1)

	if var_120_0 then
		var_120_0:OnCharacterChangeDress(arg_120_2, arg_120_3, arg_120_4)
	end

	local var_120_1 = arg_120_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)

	for iter_120_0, iter_120_1 in ipairs(var_120_1) do
		if iter_120_1:GetDataVO():IsSameShip(arg_120_1) then
			iter_120_1:OnCharacterChangeDress(arg_120_2, arg_120_3, arg_120_4)
		end
	end

	local var_120_2 = arg_120_0:GetUnitListByKey(IslandConst.UNIT_LIST_STROLL)

	for iter_120_2, iter_120_3 in ipairs(var_120_2) do
		if iter_120_3:GetDataVO():IsSameShip(arg_120_1) then
			iter_120_3:OnCharacterChangeDress(arg_120_2, arg_120_3, arg_120_4)
		end
	end
end

function var_0_0.OnStartDelegation(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = arg_121_0:GetSystemModule(arg_121_1.build_id)

	if var_121_0 then
		var_121_0:StartDelegation(arg_121_1)
	end
end

function var_0_0.OnEndDelegation(arg_122_0, arg_122_1, arg_122_2)
	local var_122_0 = arg_122_0:GetSystemModule(arg_122_1.build_id)

	if var_122_0 then
		var_122_0:EndDelegation(arg_122_1)
	end
end

function var_0_0.GetPlayerPosition(arg_123_0)
	return arg_123_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_0:GetUnitModule(arg_124_1)

	return var_124_0 and var_124_0._go.transform.position
end

function var_0_0.OnShowUnitHudAndOpBtn(arg_125_0, arg_125_1)
	arg_125_0.currentHudUnitData = arg_125_1

	arg_125_0:GetSubView(IslandSlotHudView):ShowHud(arg_125_1.id, arg_125_1.height)
	arg_125_0:GetSubView(IslandOpView):UpdateOperationButton(arg_125_1.operationType, arg_125_1.id)

	if arg_125_1.isHighLightControl then
		arg_125_0.detectionSystem:HighLightUnitHandle(arg_125_1.id, true)
	end
end

function var_0_0.OnHideUnitHudAndOpBtn(arg_126_0, arg_126_1, arg_126_2)
	if not arg_126_0.currentHudUnitData then
		return
	end

	if arg_126_0.currentHudUnitData.id ~= arg_126_1.id or arg_126_0.currentHudUnitData.type ~= arg_126_1.type then
		return
	end

	if not arg_126_2 then
		arg_126_0.currentHudUnitData = nil
	end

	arg_126_0:GetSubView(IslandSlotHudView):HideUnitHud(arg_126_1.id)
	arg_126_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, arg_126_1.id)

	if arg_126_1.isHighLightControl then
		arg_126_0.detectionSystem:HighLightUnitHandle(arg_126_1.id, false)
	end
end

function var_0_0.OnUpdateHud(arg_127_0, arg_127_1)
	if not arg_127_0.currentHudUnitData then
		return
	end

	if arg_127_1 ~= arg_127_0.currentHudUnitData.id then
		return
	end

	arg_127_0:GetSubView(IslandSlotHudView):UpdateHud(arg_127_0.currentHudUnitData.id, arg_127_0.currentHudUnitData.height)
	arg_127_0:GetSubView(IslandOpView):UpdateOperationButton(arg_127_0.currentHudUnitData.operationType, arg_127_0.currentHudUnitData.id)
end

function var_0_0.OnUpdateHandCollectUnit(arg_128_0, arg_128_1)
	local var_128_0 = arg_128_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_128_1)

	if var_128_0 then
		var_128_0:UpdateHandCollet()
		var_128_0:ResetHp()
	end
end

function var_0_0.OnShowHud(arg_129_0, arg_129_1)
	arg_129_0:GetSubView(IslandTopHeadHudView):ShowHud(arg_129_1)
	arg_129_0:GetSubView(IslandDistanceView):ShowHud(arg_129_1.id)
end

function var_0_0.OnRefreshHud(arg_130_0, arg_130_1)
	arg_130_0:GetSubView(IslandTopHeadHudView):RefreshHud(arg_130_1)
end

function var_0_0.OnHideHud(arg_131_0, arg_131_1)
	arg_131_0:GetSubView(IslandTopHeadHudView):HideHud(arg_131_1)
	arg_131_0:GetSubView(IslandDistanceView):HideHud(arg_131_1.id)
end

function var_0_0.OnDelegateSlotStartPerform(arg_132_0, arg_132_1)
	local var_132_0 = arg_132_0:GetUnitModuleWithType(arg_132_1.type, arg_132_1.id)

	if var_132_0 then
		var_132_0:DelegateSlotStartPerform()
	end
end

function var_0_0.OnRecycleAllSlotEffct(arg_133_0)
	arg_133_0.effectMgr:RecycleAllSlotEffct()
end

function var_0_0.OnLoadDelegatePreviewRole(arg_134_0, arg_134_1, arg_134_2)
	arg_134_0.effectMgr:LoadDelegatePreviewRole(arg_134_1, arg_134_2)
end

function var_0_0.OnUnLoadDelegatePreviewRole(arg_135_0)
	arg_135_0.effectMgr:UnLoadDelegatePreviewRole()
end

function var_0_0.OnSelectSlotEffectShow(arg_136_0, arg_136_1, arg_136_2, arg_136_3, arg_136_4)
	arg_136_0.effectMgr:SelectSlotEffectShow(arg_136_1, arg_136_2, arg_136_3, arg_136_4)
end

function var_0_0.OnTakePlantAttack(arg_137_0, arg_137_1)
	local var_137_0 = arg_137_0:GetUnitModuleWithType(arg_137_1.type, arg_137_1.id)

	if var_137_0 then
		var_137_0:TakeAttack()
	end
end

function var_0_0.OnStartManage(arg_138_0, arg_138_1)
	local var_138_0 = arg_138_0:GetManageSystemModule(arg_138_1.id)

	if var_138_0 then
		var_138_0:StartManage(arg_138_1)
	end
end

function var_0_0.OnEndManage(arg_139_0, arg_139_1)
	local var_139_0 = arg_139_0:GetManageSystemModule(arg_139_1.id)

	if var_139_0 then
		var_139_0:EndManage(arg_139_1)
	end
end

function var_0_0.OnRefreshTaskInfoHud(arg_140_0)
	arg_140_0:GetSubView(IslandTopHeadHudView):UpdateAllHud()
end

function var_0_0.OnRefreshWeatherSystem(arg_141_0)
	arg_141_0.weatherSystem:Play()
end

function var_0_0.OnDispose(arg_142_0)
	arg_142_0.detectionSystem:Dispose()
	arg_142_0.effectMgr:Dispose()
	arg_142_0.coupleActionPlayer:Dispose()
	arg_142_0.coupleAction4FollowerPlayer:Dispose()
	arg_142_0.npcActionPlayer:Dispose()
	arg_142_0.weatherSystem:Dispose()

	for iter_142_0, iter_142_1 in ipairs(arg_142_0.views) do
		iter_142_1:Dispose()
	end

	for iter_142_2, iter_142_3 in ipairs(arg_142_0.pathfinders) do
		iter_142_3:Dispose()
	end

	for iter_142_4, iter_142_5 in ipairs(arg_142_0:GetAllUnits()) do
		iter_142_5:Dispose()
	end

	for iter_142_6, iter_142_7 in pairs(arg_142_0.unitBuilders) do
		iter_142_7:Dispose()
	end

	for iter_142_8, iter_142_9 in pairs(arg_142_0.systemBuilders) do
		iter_142_9:Dispose()
	end

	arg_142_0.npcActionPlayer = nil
	arg_142_0.coupleActionPlayer = nil
	arg_142_0.coupleAction4FollowerPlayer = nil
	arg_142_0.pathfinders = nil
	arg_142_0.unitBuilders = nil
	arg_142_0.systemBuilders = nil
	arg_142_0.views = nil
	arg_142_0.player = nil
	arg_142_0.isInit = false
	arg_142_0._unitList = nil
	arg_142_0.detectionSystem = nil
	arg_142_0.effectMgr = nil
end

return var_0_0
