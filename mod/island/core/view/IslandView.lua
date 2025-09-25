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

function var_0_0.CreateTopHeadHudView(arg_5_0)
	return IslandTopHeadHudView.New(arg_5_0)
end

function var_0_0.CreateBottomHeadHudeView(arg_6_0)
	return IslandBottomHeadHudView.New(arg_6_0)
end

function var_0_0.CreateAnimationOpView(arg_7_0)
	return IslandAniamtionOpView.New(arg_7_0)
end

function var_0_0.CreateInteractionView(arg_8_0)
	return IslandInteractionView.New(arg_8_0)
end

function var_0_0.CreateDistanceView(arg_9_0)
	return IslandDistanceView.New(arg_9_0)
end

function var_0_0.CreateSeedOpView(arg_10_0)
	return IslandSeedOpView.New(arg_10_0)
end

function var_0_0.IsLoaded(arg_11_0)
	local var_11_0 = arg_11_0:GetAllUnits()

	return _.all(arg_11_0.views, function(arg_12_0)
		return arg_12_0:IsLoaded()
	end) and #var_11_0 > 0 and _.all(var_11_0, function(arg_13_0)
		return arg_13_0:IsLoaded()
	end)
end

function var_0_0.IsInit(arg_14_0)
	return arg_14_0.isInit
end

function var_0_0.Update(arg_15_0)
	if not arg_15_0.isInit then
		return
	end

	for iter_15_0, iter_15_1 in ipairs(arg_15_0:GetAllUnits()) do
		iter_15_1:Update()
	end

	for iter_15_2, iter_15_3 in ipairs(arg_15_0.views) do
		iter_15_3:Update()
	end

	for iter_15_4, iter_15_5 in ipairs(arg_15_0.pathfinders) do
		iter_15_5:Update()
	end

	if arg_15_0.needTryTrack then
		arg_15_0:TryTrack()
	end
end

function var_0_0.LateUpdate(arg_16_0)
	if not arg_16_0.isInit then
		return
	end

	for iter_16_0, iter_16_1 in ipairs(arg_16_0:GetAllUnits()) do
		iter_16_1:LateUpdate()
	end

	for iter_16_2, iter_16_3 in ipairs(arg_16_0.views) do
		iter_16_3:LateUpdate()
	end

	for iter_16_4, iter_16_5 in ipairs(arg_16_0.pathfinders) do
		iter_16_5:LateUpdate()
	end
end

function var_0_0.AddListeners(arg_17_0)
	arg_17_0:AddListener(ISLAND_EVT.GEN_UNIT, arg_17_0.OnGenUnit)
	arg_17_0:AddListener(ISLAND_EVT.RMOVE_UNIT, arg_17_0.OnRemoveUnit)
	arg_17_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_17_0.OnInterActionBegin)
	arg_17_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_17_0.OnInterActionEnd)
	arg_17_0:AddListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_17_0.OnStopUnit)
	arg_17_0:AddListener(ISLAND_EVT.MOVE_UNIT, arg_17_0.OnMoveUnit)
	arg_17_0:AddListener(ISLAND_EVT.INIT_FINISH, arg_17_0.OnSceneInited)
	arg_17_0:AddListener(ISLAND_EVT.MOVE_PLAYER, arg_17_0.OnPlayerMove)
	arg_17_0:AddListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_17_0.OnPlayerStopMove)
	arg_17_0:AddListener(ISLAND_EVT.JUMP_PLAYER, arg_17_0.OnPlayerJump)
	arg_17_0:AddListener(ISLAND_EVT.APPROACH_UNIT, arg_17_0.OnShowInterActionPanel)
	arg_17_0:AddListener(ISLAND_EVT.LEAVE_UNIT, arg_17_0.OnHideInterActionPanel)
	arg_17_0:AddListener(ISLAND_EVT.TRACKING, arg_17_0.OnTracking)
	arg_17_0:AddListener(ISLAND_EVT.UNTRACKING, arg_17_0.OnUnTracking)
	arg_17_0:AddListener(ISLAND_EVT.AREACHANGE, arg_17_0.OnPlayerAreaChange)
	arg_17_0:AddListener(ISLAND_EVT.PLAYERRUN, arg_17_0.OnPlayerPlayerRun)
	arg_17_0:AddListener(ISLAND_EVT.SPRINT_PLAYER, arg_17_0.OnPlayerPlayerSprint)
	arg_17_0:AddListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_17_0.OnStopPlayerSprint)
	arg_17_0:AddListener(ISLAND_EVT.CHANGE_DRESS, arg_17_0.OnChangeDress)
	arg_17_0:AddListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_17_0.OnCharacterChangeDress)
	arg_17_0:AddListener(ISLAND_EVT.RESET_UNIT_POS, arg_17_0.OnResetUnitPos)
	arg_17_0:AddListener(ISLAND_EVT.RESET_UNIT_ROT, arg_17_0.OnResetUnitRotation)
	arg_17_0:AddListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_17_0.OnAnyPageOpen)
	arg_17_0:AddListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_17_0.OnAllPageClose)
	arg_17_0:AddListener(ISLAND_EVT.Change_TakePhoto_Model, arg_17_0.OnChangeTakePhotoModel)
	arg_17_0:AddListener(ISLAND_EVT.Change_Photo_Height, arg_17_0.OnChange_Photo_Height)
	arg_17_0:AddListener(ISLAND_EVT.SetOpMoveBtnActve, arg_17_0.OnSetOpMoveBtnActve)
	arg_17_0:AddListener(ISLAND_EVT.PLAY_BUBBLE, arg_17_0.OnPlayChatBubble)
	arg_17_0:AddListener(ISLAND_EVT.START_STORY, arg_17_0.OnStartStory)
	arg_17_0:AddListener(ISLAND_EVT.END_STORY, arg_17_0.OnEndStory)
	arg_17_0:AddListener(ISLAND_EVT.START_DEGATION, arg_17_0.OnStartDelegation)
	arg_17_0:AddListener(ISLAND_EVT.END_DEGATION, arg_17_0.OnEndDelegation)
	arg_17_0:AddListener(ISLAND_EVT.GEN_SYSTEM, arg_17_0.OnGenSystem)
	arg_17_0:AddListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_17_0.OnWorldObjectStartInteraction)
	arg_17_0:AddListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_17_0.OnWorldObjectEndInteraction)
	arg_17_0:AddListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_17_0.OnWorldObjectInitStatus)
	arg_17_0:AddListener(ISLAND_EVT.REFRESH_INTERACTION, arg_17_0.OnRefreshInteractionBtn)
	arg_17_0:AddListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_17_0.OnShowUnitHudAndOpBtn)
	arg_17_0:AddListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_17_0.OnHideUnitHudAndOpBtn)
	arg_17_0:AddListener(ISLAND_EVT.DETECTOR_CHANGED, arg_17_0.OnDetectorChanged)
	arg_17_0:AddListener(ISLAND_EVT.SELECTED_DETECTOR, arg_17_0.OnDetectorSelected)
	arg_17_0:AddListener(ISLAND_EVT.NPC_DETECTED, arg_17_0.OnNpcDetectorSelected)
	arg_17_0:AddListener(ISLAND_EVT.NO_NPC_DETECTED, arg_17_0.OnNpcDetectorUnSelected)
	arg_17_0:AddListener(ISLAND_EVT.SET_PLAYER_WORK, arg_17_0.OnPlayerWork)
	arg_17_0:AddListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_17_0.OnPlayerDeviceStateChange)
	arg_17_0:AddListener(ISLAND_EVT.UPDATE_HUD, arg_17_0.OnUpdateHud)
	arg_17_0:AddListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_17_0.OnUpdateHandCollectUnit)
	arg_17_0:AddListener(ISLAND_EVT.START_DELEGATE_SLOT_PERFORM, arg_17_0.OnDelegateSlotStartPerform)
	arg_17_0:AddListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_17_0.OnRecycleAllSlotEffct)
	arg_17_0:AddListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_17_0.OnSelectSlotEffectShow)
	arg_17_0:AddListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_17_0.OnLoadDelegatePreviewRole)
	arg_17_0:AddListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_17_0.OnUnLoadDelegatePreviewRole)
	arg_17_0:AddListener(ISLAND_EVT.Take_Plant_Attact, arg_17_0.OnTakePlantAttack)
	arg_17_0:AddListener(ISLAND_EVT.START_MANAGE, arg_17_0.OnStartManage)
	arg_17_0:AddListener(ISLAND_EVT.END_MANAGE, arg_17_0.OnEndManage)
	arg_17_0:AddListener(ISLAND_EVT.SHOW_HUD, arg_17_0.OnShowHud)
	arg_17_0:AddListener(ISLAND_EVT.HIDE_HUD, arg_17_0.OnHideHud)
	arg_17_0:AddListener(ISLAND_EVT.REFRESH_HUD, arg_17_0.OnRefreshHud)
	arg_17_0:AddListener(ISLAND_EVT.START_GUIDE, arg_17_0.OnStartGuide)
	arg_17_0:AddListener(ISLAND_EVT.END_GUIDE, arg_17_0.OnEndGuide)
	arg_17_0:AddListener(ISLAND_EVT.START_PERFORMANCE, arg_17_0.OnStartPerformance)
	arg_17_0:AddListener(ISLAND_EVT.END_PERFORMANCE, arg_17_0.OnEndPerformance)
	arg_17_0:AddListener(ISLAND_EVT.DISABLE_INPUT, arg_17_0.DisableInput)
	arg_17_0:AddListener(ISLAND_EVT.ENABLE_INPUT, arg_17_0.EnableInput)
	arg_17_0:AddListener(ISLAND_EVT.GEN_PATH_FINDER, arg_17_0.OnGenPathFinder)
	arg_17_0:AddListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_17_0.OnActiveOrDisactiveUnit)
	arg_17_0:AddListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_17_0.OnOpenAniamtionOpPage)
	arg_17_0:AddListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_17_0.OnCloseAniamtionOpPage)
	arg_17_0:AddListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_17_0.OnMovePlayerBefore)
	arg_17_0:AddListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_17_0.OnRefreshTaskInfoHud)
	arg_17_0:AddListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_17_0.OnResponAniamtionOp)
	arg_17_0:AddListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_17_0.OnChangeVisterDress)
	arg_17_0:AddListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_17_0.OnSetVisitorSyncData)
	arg_17_0:AddListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_17_0.OnShowNpcAniamtionBubble)
	arg_17_0:AddListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_17_0.OnHideNpcAniamtionBubble)
	arg_17_0:AddListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_17_0.OnPlaySingleAnimationEnd)
	arg_17_0:AddListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_17_0.OnUpdateCustomOpPositon)
	arg_17_0:AddListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_17_0.OnChatMsgUpdate)
	arg_17_0:AddListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_17_0.OnChatRoomChange)
	arg_17_0:AddListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_17_0.OnShowChatMsg)
	arg_17_0:AddListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_17_0.OnResetFollowRandomizer)
	arg_17_0:AddListener(ISLAND_EVT.ADD_FOLLOWER, arg_17_0.OnFollowerAdd)
	arg_17_0:AddListener(ISLAND_EVT.DEL_FOLLOWER, arg_17_0.OnFollowerDel)
	arg_17_0:AddListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_17_0.OnCoupleActionWithFollower)
	arg_17_0:AddListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_17_0.OnLockPlayerInput)
	arg_17_0:AddListener(ISLAND_EVT.START_COUPLE_ACTION, arg_17_0.OnStartCoupleAction)
	arg_17_0:AddListener(ISLAND_EVT.END_COUPLE_ACTION, arg_17_0.OnEndCoupleAction)
	arg_17_0:AddListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_17_0.OnRefreshWeatherSystem)
	arg_17_0:AddListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_17_0.OnSystemUnlock)
end

function var_0_0.RemoveListeners(arg_18_0)
	arg_18_0:RemoveListener(ISLAND_EVT.GEN_UNIT, arg_18_0.OnGenUnit)
	arg_18_0:RemoveListener(ISLAND_EVT.RMOVE_UNIT, arg_18_0.OnRemoveUnit)
	arg_18_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_18_0.OnInterActionBegin)
	arg_18_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_18_0.OnInterActionEnd)
	arg_18_0:RemoveListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_18_0.OnStopUnit)
	arg_18_0:RemoveListener(ISLAND_EVT.MOVE_UNIT, arg_18_0.OnMoveUnit)
	arg_18_0:RemoveListener(ISLAND_EVT.INIT_FINISH, arg_18_0.OnSceneInited)
	arg_18_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER, arg_18_0.OnPlayerMove)
	arg_18_0:RemoveListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_18_0.OnPlayerStopMove)
	arg_18_0:RemoveListener(ISLAND_EVT.JUMP_PLAYER, arg_18_0.OnPlayerJump)
	arg_18_0:RemoveListener(ISLAND_EVT.APPROACH_UNIT, arg_18_0.OnShowInterActionPanel)
	arg_18_0:RemoveListener(ISLAND_EVT.LEAVE_UNIT, arg_18_0.OnHideInterActionPanel)
	arg_18_0:RemoveListener(ISLAND_EVT.TRACKING, arg_18_0.OnTracking)
	arg_18_0:RemoveListener(ISLAND_EVT.UNTRACKING, arg_18_0.OnUnTracking)
	arg_18_0:RemoveListener(ISLAND_EVT.AREACHANGE, arg_18_0.OnPlayerAreaChange)
	arg_18_0:RemoveListener(ISLAND_EVT.PLAYERRUN, arg_18_0.OnPlayerPlayerRun)
	arg_18_0:RemoveListener(ISLAND_EVT.SPRINT_PLAYER, arg_18_0.OnPlayerPlayerSprint)
	arg_18_0:RemoveListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_18_0.OnStopPlayerSprint)
	arg_18_0:RemoveListener(ISLAND_EVT.CHANGE_DRESS, arg_18_0.OnChangeDress)
	arg_18_0:RemoveListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_18_0.OnCharacterChangeDress)
	arg_18_0:RemoveListener(ISLAND_EVT.RESET_UNIT_POS, arg_18_0.OnResetUnitPos)
	arg_18_0:RemoveListener(ISLAND_EVT.RESET_UNIT_ROT, arg_18_0.OnResetUnitRotation)
	arg_18_0:RemoveListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_18_0.OnAnyPageOpen)
	arg_18_0:RemoveListener(ISLAND_EVT.Change_TakePhoto_Model, arg_18_0.OnChangeTakePhotoModel)
	arg_18_0:RemoveListener(ISLAND_EVT.Change_Photo_Height, arg_18_0.OnChange_Photo_Height)
	arg_18_0:RemoveListener(ISLAND_EVT.SetOpMoveBtnActve, arg_18_0.OnSetOpMoveBtnActve)
	arg_18_0:RemoveListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_18_0.OnAllPageClose)
	arg_18_0:RemoveListener(ISLAND_EVT.PLAY_BUBBLE, arg_18_0.OnPlayChatBubble)
	arg_18_0:RemoveListener(ISLAND_EVT.START_STORY, arg_18_0.OnStartStory)
	arg_18_0:RemoveListener(ISLAND_EVT.END_STORY, arg_18_0.OnEndStory)
	arg_18_0:RemoveListener(ISLAND_EVT.START_DEGATION, arg_18_0.OnStartDelegation)
	arg_18_0:RemoveListener(ISLAND_EVT.END_DEGATION, arg_18_0.OnEndDelegation)
	arg_18_0:RemoveListener(ISLAND_EVT.GEN_SYSTEM, arg_18_0.OnGenSystem)
	arg_18_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_18_0.OnWorldObjectStartInteraction)
	arg_18_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_18_0.OnWorldObjectEndInteraction)
	arg_18_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_18_0.OnWorldObjectInitStatus)
	arg_18_0:RemoveListener(ISLAND_EVT.REFRESH_INTERACTION, arg_18_0.OnRefreshInteractionBtn)
	arg_18_0:RemoveListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_18_0.OnShowUnitHudAndOpBtn)
	arg_18_0:RemoveListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_18_0.OnHideUnitHudAndOpBtn)
	arg_18_0:RemoveListener(ISLAND_EVT.DETECTOR_CHANGED, arg_18_0.OnDetectorChanged)
	arg_18_0:RemoveListener(ISLAND_EVT.SELECTED_DETECTOR, arg_18_0.OnDetectorSelected)
	arg_18_0:RemoveListener(ISLAND_EVT.NPC_DETECTED, arg_18_0.OnNpcDetectorSelected)
	arg_18_0:RemoveListener(ISLAND_EVT.NO_NPC_DETECTED, arg_18_0.OnNpcDetectorUnSelected)
	arg_18_0:RemoveListener(ISLAND_EVT.SET_PLAYER_WORK, arg_18_0.OnPlayerWork)
	arg_18_0:RemoveListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_18_0.OnPlayerDeviceStateChange)
	arg_18_0:RemoveListener(ISLAND_EVT.UPDATE_HUD, arg_18_0.OnUpdateHud)
	arg_18_0:RemoveListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_18_0.OnUpdateHandCollectUnit)
	arg_18_0:RemoveListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_18_0.OnRecycleAllSlotEffct)
	arg_18_0:RemoveListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_18_0.OnSelectSlotEffectShow)
	arg_18_0:RemoveListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_18_0.OnLoadDelegatePreviewRole)
	arg_18_0:RemoveListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_18_0.OnUnLoadDelegatePreviewRole)
	arg_18_0:RemoveListener(ISLAND_EVT.Take_Plant_Attact, arg_18_0.OnTakePlantAttack)
	arg_18_0:RemoveListener(ISLAND_EVT.START_MANAGE, arg_18_0.OnStartManage)
	arg_18_0:RemoveListener(ISLAND_EVT.END_MANAGE, arg_18_0.OnEndManage)
	arg_18_0:RemoveListener(ISLAND_EVT.SHOW_HUD, arg_18_0.OnShowHud)
	arg_18_0:RemoveListener(ISLAND_EVT.HIDE_HUD, arg_18_0.OnHideHud)
	arg_18_0:RemoveListener(ISLAND_EVT.REFRESH_HUD, arg_18_0.OnRefreshHud)
	arg_18_0:RemoveListener(ISLAND_EVT.START_GUIDE, arg_18_0.OnStartGuide)
	arg_18_0:RemoveListener(ISLAND_EVT.END_GUIDE, arg_18_0.OnEndGuide)
	arg_18_0:RemoveListener(ISLAND_EVT.START_PERFORMANCE, arg_18_0.OnStartPerformance)
	arg_18_0:RemoveListener(ISLAND_EVT.END_PERFORMANCE, arg_18_0.OnEndPerformance)
	arg_18_0:RemoveListener(ISLAND_EVT.DISABLE_INPUT, arg_18_0.DisableInput)
	arg_18_0:RemoveListener(ISLAND_EVT.ENABLE_INPUT, arg_18_0.EnableInput)
	arg_18_0:RemoveListener(ISLAND_EVT.GEN_PATH_FINDER, arg_18_0.OnGenPathFinder)
	arg_18_0:RemoveListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_18_0.OnActiveOrDisactiveUnit)
	arg_18_0:RemoveListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_18_0.OnOpenAniamtionOpPage)
	arg_18_0:RemoveListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_18_0.OnCloseAniamtionOpPage)
	arg_18_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_18_0.OnMovePlayerBefore)
	arg_18_0:RemoveListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_18_0.OnRefreshTaskInfoHud)
	arg_18_0:RemoveListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_18_0.OnResponAniamtionOp)
	arg_18_0:RemoveListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_18_0.OnChangeVisterDress)
	arg_18_0:RemoveListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_18_0.OnSetVisitorSyncData)
	arg_18_0:RemoveListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_18_0.OnShowNpcAniamtionBubble)
	arg_18_0:RemoveListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_18_0.OnHideNpcAniamtionBubble)
	arg_18_0:RemoveListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_18_0.OnPlaySingleAnimationEnd)
	arg_18_0:RemoveListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_18_0.OnUpdateCustomOpPositon)
	arg_18_0:RemoveListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_18_0.OnChatMsgUpdate)
	arg_18_0:RemoveListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_18_0.OnChatRoomChange)
	arg_18_0:RemoveListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_18_0.OnShowChatMsg)
	arg_18_0:RemoveListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_18_0.OnResetFollowRandomizer)
	arg_18_0:RemoveListener(ISLAND_EVT.ADD_FOLLOWER, arg_18_0.OnFollowerAdd)
	arg_18_0:RemoveListener(ISLAND_EVT.DEL_FOLLOWER, arg_18_0.OnFollowerDel)
	arg_18_0:RemoveListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_18_0.OnCoupleActionWithFollower)
	arg_18_0:RemoveListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_18_0.OnLockPlayerInput)
	arg_18_0:RemoveListener(ISLAND_EVT.START_COUPLE_ACTION, arg_18_0.OnStartCoupleAction)
	arg_18_0:RemoveListener(ISLAND_EVT.END_COUPLE_ACTION, arg_18_0.OnEndCoupleAction)
	arg_18_0:RemoveListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_18_0.OnRefreshWeatherSystem)
	arg_18_0:RemoveListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_18_0.OnSystemUnlock)
end

function var_0_0.OnSystemUnlock(arg_19_0, arg_19_1)
	if arg_19_1 == IslandAblityAgency.ANIMATION_OP_ID then
		arg_19_0:GetSubView(IslandOpView):UpdateAnimationOpBtn()
	end
end

function var_0_0.OnStartCoupleAction(arg_20_0)
	arg_20_0:UnBlockLayer1Event(false)
	arg_20_0:GetSubView(IslandAniamtionOpView):OnStartCoupleAction()
end

function var_0_0.OnEndCoupleAction(arg_21_0)
	arg_21_0:UnBlockLayer1Event(true)
	arg_21_0:GetSubView(IslandAniamtionOpView):OnEndCoupleAction()
end

function var_0_0.OnCoupleActionWithFollower(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_22_1 = arg_22_0:GetPlayerPosition()
	local var_22_2 = pg.island_set.action_bubble_range.key_value_int
	local var_22_3 = _.select(var_22_0, function(arg_23_0)
		return Vector3.Distance(arg_23_0:GetPosition(), var_22_1) <= var_22_2
	end)

	if #var_22_3 <= 0 then
		return
	end

	local var_22_4 = var_22_3[math.random(1, #var_22_3)]
	local var_22_5 = pg.island_action[arg_22_1]

	arg_22_0.coupleAction4FollowerPlayer:Play(var_22_4, arg_22_0.player, var_22_5)
	arg_22_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
end

function var_0_0.OnFollowerAdd(arg_24_0)
	arg_24_0:GetSubView(IslandOpView):FlushFollowerList()
end

function var_0_0.OnFollowerDel(arg_25_0)
	arg_25_0:GetSubView(IslandOpView):FlushFollowerList()
end

function var_0_0.OnResetFollowRandomizer(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0:GetFollowerModule(arg_26_1)

	if not var_26_0 then
		return
	end

	var_26_0:SetBtRandomizer()
end

function var_0_0.OnShowChatMsg(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1.player.id
	local var_27_1 = arg_27_0:GetPlayerUnitModule(var_27_0)

	if not var_27_1 then
		return
	end

	arg_27_0:GetSubView(IslandTopHeadHudView):PlayChat(var_27_1, arg_27_1.emojiId, arg_27_1.content, nil)
end

function var_0_0.OnChatRoomChange(arg_28_0)
	arg_28_0:GetSubView(IslandAniamtionOpView):UpdateChatRoom()
end

function var_0_0.OnChatMsgUpdate(arg_29_0)
	arg_29_0:GetSubView(IslandAniamtionOpView):UpdateMsgList()
end

function var_0_0.OnPlaySingleAnimationEnd(arg_30_0, arg_30_1)
	if not arg_30_0:GetSelectedNpcId() then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_30_1, 0, 0, 0, 0))

		return
	end

	local var_30_0 = arg_30_0:GetSelectedNpcId()
	local var_30_1, var_30_2 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_30_0)
	local var_30_3 = arg_30_0:GetUnitModuleWithType(var_30_1, var_30_2)

	arg_30_0.npcActionPlayer:Play(var_30_3, arg_30_0.player, arg_30_1)
end

function var_0_0.OnShowNpcAniamtionBubble(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:GetStrollUnitModule(arg_31_1.id)

	if not var_31_0 then
		return
	end

	local var_31_1 = arg_31_1:GetActionFeedback()

	arg_31_0:GetSubView(IslandBottomHeadHudView):ShowAnimationOp(var_31_0, var_31_1)
end

function var_0_0.OnHideNpcAniamtionBubble(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:GetStrollUnitModule(arg_32_1.id)

	arg_32_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_32_0)
end

function var_0_0.OnResponAniamtionOp(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1.id
	local var_33_1 = arg_33_1.targetId
	local var_33_2 = arg_33_1.actionId
	local var_33_3 = arg_33_0:GetPlayerUnitModule(var_33_0)

	if not var_33_3 then
		return
	end

	if var_33_2 == 0 then
		if not arg_33_0:IsPlayer(var_33_0) then
			arg_33_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_33_3)
		else
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_33_2, 1, 0, 0, 0))
		end

		return
	end

	local var_33_4 = pg.island_action[var_33_2]

	if var_33_1 == 0 and var_33_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_33_0:IsPlayer(var_33_0) then
		arg_33_0:GetSubView(IslandTopHeadHudView):ShowAnimationOp(var_33_3, var_33_2)
	elseif var_33_1 > 0 and var_33_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_33_0:IsPlayer(var_33_1) then
		local var_33_5 = arg_33_0:GetPlayerUnitModule(var_33_1)

		arg_33_0.coupleActionPlayer:Play(var_33_3, var_33_5, var_33_4)
		arg_33_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_33_5)
	elseif var_33_1 > 0 and var_33_4.type == IslandConst.ANIMATION_OP_DOUBLE and arg_33_0:IsPlayer(var_33_1) then
		local var_33_6 = arg_33_0:GetPlayerUnitModule(var_33_1)

		arg_33_0.coupleActionPlayer:Play(var_33_3, var_33_6, var_33_4)
		arg_33_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_33_2, 1, var_33_1, 0, 1))
	end
end

function var_0_0.OnChangeVisterDress(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_1.id

	if arg_34_0:IsPlayer(var_34_0) then
		return
	end

	local var_34_1 = arg_34_0:GetPlayerUnitModule(var_34_0)

	if var_34_1 then
		var_34_1:OnChangeDress(arg_34_1.changeDressData)
	end
end

function var_0_0.IsPlayer(arg_35_0, arg_35_1)
	return arg_35_0.player.id == arg_35_1
end

function var_0_0.OnOpenAniamtionOpPage(arg_36_0)
	arg_36_0:GetSubView(IslandAniamtionOpView):TryEnable()
	arg_36_0:GetSubView(IslandOpView):TryDisable()
	arg_36_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_ANIMATION_OP)
end

function var_0_0.OnCloseAniamtionOpPage(arg_37_0)
	arg_37_0:GetSubView(IslandOpView):TryEnable()
	arg_37_0:NotifiyIsland(ISLAND_EX_EVT.CLOSE_ANIMATION_OP)
end

function var_0_0.OnGenPathFinder(arg_38_0, arg_38_1)
	local var_38_0 = IslandPathFinder.New(arg_38_0)
	local var_38_1 = defaultValue(arg_38_1.navData.waitUntilDone, false)

	var_38_0:Start(arg_38_1.navData, function()
		table.removebyvalue(arg_38_0.pathfinders, var_38_0)
		var_38_0:Dispose()
		arg_38_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH_DONE, arg_38_1.navData.index)

		if var_38_1 and arg_38_1.callback then
			arg_38_1.callback()
		end
	end)
	arg_38_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH, arg_38_1.navData.index)

	if not var_38_1 and arg_38_1.callback then
		arg_38_1.callback()
	end

	table.insert(arg_38_0.pathfinders, var_38_0)
end

function var_0_0.OnSceneInited(arg_40_0, arg_40_1)
	IslandCameraMgr.instance:LookAt(arg_40_0.player._tf)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraZoom)):SetMaxMinZoom(arg_40_1.min, arg_40_1.max, arg_40_1.value)
	arg_40_0:InitFocusCamera()
	arg_40_0:InitTakePhotoCamera()

	for iter_40_0, iter_40_1 in ipairs(arg_40_0:GetAllUnits()) do
		iter_40_1:Start()
	end

	arg_40_0.isInit = true
end

function var_0_0.InitFocusCamera(arg_41_0)
	local var_41_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)

	var_41_0.Follow = arg_41_0.player._tf
	var_41_0.LookAt = arg_41_0.player._tf
end

function var_0_0.InitTakePhotoCamera(arg_42_0)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).Follow = arg_42_0.firstTakePhotoItem._tf

	local var_42_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)

	var_42_0.Follow = arg_42_0.thirdTakePhotoItem._tf
	var_42_0.LookAt = arg_42_0.thirdTakePhotoItem._tf
end

function var_0_0.OnNpcDetectorSelected(arg_43_0, arg_43_1)
	if arg_43_0.selectedNpcId then
		return
	end

	local var_43_0 = arg_43_1.node

	if not var_43_0 then
		return
	end

	arg_43_0.selectedNpcId = var_43_0:GetComponent(typeof(WorldObjectItem)).uniqueId
end

function var_0_0.GetSelectedNpcId(arg_44_0)
	return arg_44_0.selectedNpcId
end

function var_0_0.OnNpcDetectorUnSelected(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_1.node

	if not var_45_0 then
		return
	end

	local var_45_1 = var_45_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	if arg_45_0.selectedNpcId ~= var_45_1 then
		return
	end

	arg_45_0.selectedNpcId = nil
end

function var_0_0.OnDetectorChanged(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1.node

	if not var_46_0 then
		return
	end

	local var_46_1 = var_46_0:GetBlackboardVariable("DetectorList")

	for iter_46_0 = 1, var_46_1.Count do
		local var_46_2 = var_46_1[iter_46_0 - 1]
		local var_46_3, var_46_4 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_46_2)

		if var_46_3 == IslandConst.UNIT_LIST_OBJ then
			local var_46_5 = arg_46_0:GetUnitModuleWithType(var_46_3, var_46_4)

			if var_46_5 then
				arg_46_0:Op("NotifiyIsland", ISLAND_EX_EVT.APPROACH_OBJECT, var_46_5.id)
			end
		end
	end
end

function var_0_0.OnDetectorSelected(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_1.node

	if not var_47_0 then
		return
	end

	local var_47_1 = var_47_0:GetBlackboardVariable("SelectedObj")

	if not var_47_1 or var_47_1 == "" then
		arg_47_0:OnClearSelectedUnit()
	else
		local var_47_2, var_47_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_47_1)
		local var_47_4 = arg_47_0:GetUnitModuleWithType(var_47_2, var_47_3)

		if var_47_4 then
			arg_47_0:OnSelectedUnit(var_47_4)
		end
	end
end

function var_0_0.OnClearSelectedUnit(arg_48_0)
	return
end

function var_0_0.OnSelectedUnit(arg_49_0, arg_49_1)
	return
end

function var_0_0.OnRefreshInteractionBtn(arg_50_0)
	arg_50_0:GetSubView(IslandInteractionView):RefreshInteractionBtns()
end

function var_0_0.OnStartStory(arg_51_0)
	arg_51_0.playingStory = true

	arg_51_0:DisablePlayerOp()
end

function var_0_0.OnEndStory(arg_52_0)
	arg_52_0.playingStory = false

	arg_52_0:EnablePlayerOp()
end

function var_0_0.DisablePlayerOp(arg_53_0)
	arg_53_0.player:StopMoveHandle()
	arg_53_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_53_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_53_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_53_0:GetSubView(IslandOpView):TryDisable()
end

function var_0_0.EnablePlayerOp(arg_54_0)
	arg_54_0:GetSubView(IslandOpView):TryEnablePlayerOp()
	arg_54_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_54_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_54_0:GetSubView(IslandOpView):TryEnable()
end

function var_0_0.OnStartPerformance(arg_55_0)
	return
end

function var_0_0.OnEndPerformance(arg_56_0)
	if not arg_56_0.anyPageOpen then
		arg_56_0:GetSubView(IslandOpView):ResetShowBalance()
	end
end

function var_0_0.OnPlayChatBubble(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0:GetAllUnits()

	arg_57_0:GetSubView(IslandTopHeadHudView):PlayBubble(arg_57_1.name, var_57_0, arg_57_1.callback)
end

function var_0_0.OnAnyPageOpen(arg_58_0, arg_58_1)
	arg_58_0.anyPageOpen = true

	arg_58_0.player:StopMoveHandle()
	arg_58_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_58_0:GetSubView(IslandSlotHudView):TryDisable()
	arg_58_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_58_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_58_0:GetSubView(IslandAniamtionOpView):CloseAndReset()
end

function var_0_0.OnAllPageClose(arg_59_0)
	arg_59_0.anyPageOpen = false

	arg_59_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_59_0:GetSubView(IslandSlotHudView):TryEnable()
	arg_59_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_59_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnChange_Photo_Height(arg_60_0, arg_60_1, arg_60_2)
	arg_60_0.takePhotoModel = arg_60_1

	if arg_60_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		-- block empty
	elseif arg_60_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_60_0.thirdTakePhotoItem:ChangeHeight(arg_60_2)
	end
end

function var_0_0.OnChangeTakePhotoModel(arg_61_0, arg_61_1)
	arg_61_0.takePhotoModel = arg_61_1

	if arg_61_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_61_0.firstTakePhotoItem:Enable()

		arg_61_0.firstTakePhotoItem._tf.position = arg_61_0.player._tf.position
		arg_61_0.firstTakePhotoItem._tf.rotation = arg_61_0.player._tf.rotation

		arg_61_0.firstTakePhotoItem:SetTargetRotation(arg_61_0.player._tf.rotation)
		arg_61_0.player:SetActiveByLayer(false)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook)):SetPosAndRotationByTargetDir(arg_61_0.player._tf.forward)
	elseif arg_61_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_61_0.thirdTakePhotoItem:Enable()

		arg_61_0.player._tf.position = arg_61_0.firstTakePhotoItem._tf.position
		arg_61_0.player._tf.rotation = arg_61_0.firstTakePhotoItem._tf.rotation

		arg_61_0.player:SetTargetRotation(arg_61_0.firstTakePhotoItem._tf.rotation)
		arg_61_0.player:SetActiveByLayer(true)

		arg_61_0.thirdTakePhotoItem._tf.position = arg_61_0.firstTakePhotoItem._tf:TransformPoint(Vector3(0, 0, -5))
		arg_61_0.thirdTakePhotoItem._tf.rotation = arg_61_0.firstTakePhotoItem._tf.rotation

		arg_61_0.thirdTakePhotoItem:SetTargetRotation(arg_61_0.firstTakePhotoItem._tf.rotation)

		local var_61_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook))
		local var_61_1 = arg_61_0.player._tf.position + Vector3(0, 0.5, 0)
		local var_61_2 = arg_61_0.thirdTakePhotoItem._tf.position + Vector3(0, 1, 0)

		var_61_0:SetPosAndRotationByTargetDir((var_61_1 - var_61_2).normalized)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)
	else
		arg_61_0.firstTakePhotoItem:Disable()
		arg_61_0.thirdTakePhotoItem:Disable()

		arg_61_0.player._tf.position = arg_61_0.firstTakePhotoItem._tf.position
		arg_61_0.player._tf.rotation = arg_61_0.firstTakePhotoItem._tf.rotation

		arg_61_0.player:SetTargetRotation(arg_61_0.firstTakePhotoItem._tf.rotation)
		arg_61_0.player:SetActiveByLayer(true)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraLook)):ResetCameraPos()
	end

	arg_61_0:GetSubView(IslandOpView):ChangeTakePhotoModel(arg_61_1)
end

function var_0_0.OnSetOpMoveBtnActve(arg_62_0, arg_62_1, arg_62_2)
	arg_62_0:GetSubView(IslandOpView):ShowOrHideMoveBtn(arg_62_1, arg_62_2)
end

function var_0_0.OnInterActionBegin(arg_63_0)
	arg_63_0.player:StopMoveHandle()
	arg_63_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_64_0)
	arg_64_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_65_0, arg_65_1)
	arg_65_0.showInterObjId = arg_65_1.id

	arg_65_0:GetSubView(IslandInteractionView):ShowInterActionPanel(arg_65_1)
	arg_65_0:Op("NotifiyIsland", ISLAND_EX_EVT.SHOW_INTERACTION, arg_65_0.showInterObjId)
end

function var_0_0.OnHideInterActionPanel(arg_66_0, arg_66_1)
	if arg_66_0.showInterObjId ~= arg_66_1.id then
		return
	end

	arg_66_0.showInterObjId = nil

	arg_66_0:GetSubView(IslandInteractionView):HideInterActionPanel()
end

function var_0_0.OnStartGuide(arg_67_0)
	arg_67_0.player:StopMoveHandle()
	arg_67_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.OnEndGuide(arg_68_0)
	if arg_68_0.playingStory then
		return
	end

	arg_68_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.DisableInput(arg_69_0)
	arg_69_0.player:StopMoveHandle()
	arg_69_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.EnableInput(arg_70_0)
	arg_70_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.OnTracking(arg_71_0, arg_71_1)
	arg_71_0.trackId = tonumber(arg_71_1.id)
	arg_71_0.needTryTrack = true
end

function var_0_0.TryTrack(arg_72_0)
	local var_72_0 = arg_72_0:GetUnitModule(arg_72_0.trackId)

	if not var_72_0 or not var_72_0._go then
		return
	end

	arg_72_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_72_0.player, var_72_0, arg_72_0.trackId)

	arg_72_0.needTryTrack = false
end

function var_0_0.OnUnTracking(arg_73_0)
	arg_73_0.trackId = nil

	arg_73_0:GetSubView(IslandDistanceView):CancelTracking()
end

function var_0_0.OnUpdateCustomOpPositon(arg_74_0)
	arg_74_0:GetSubView(IslandOpView):InitOpCustumPositon()
end

function var_0_0.OnGenUnit(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0.unitBuilders[arg_75_1:GetType()]:Build(arg_75_1, arg_75_2)

	arg_75_0:AddUnit(var_75_0)

	if arg_75_1:IsPlayer() then
		arg_75_0.player = var_75_0
	end

	if arg_75_1:IsFirstTakePhoto() then
		arg_75_0.firstTakePhotoItem = var_75_0
	end

	if arg_75_1:IsThirdTakePhoto() then
		arg_75_0.thirdTakePhotoItem = var_75_0
	end
end

function var_0_0.OnGenSystem(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_0.systemBuilders[arg_76_1:GetType()]:Build(arg_76_1)

	arg_76_0:AddUnit(var_76_0)
end

function var_0_0.OnActiveOrDisactiveUnit(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
	local var_77_0

	if arg_77_1 == 0 then
		var_77_0 = arg_77_0.player
	else
		var_77_0 = arg_77_0:GetUnitModuleWithType(arg_77_2, arg_77_1)
	end

	if var_77_0 and arg_77_3 then
		var_77_0:Enable()
	end

	if var_77_0 and not arg_77_3 then
		var_77_0:Disable()
	end
end

function var_0_0.OnResetUnitPos(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	local var_78_0 = arg_78_0:GetUnitModuleWithType(arg_78_2, arg_78_1)

	if var_78_0 then
		var_78_0._go.transform.position = arg_78_3
	end
end

function var_0_0.OnResetUnitRotation(arg_79_0, arg_79_1, arg_79_2, arg_79_3)
	local var_79_0 = arg_79_0:GetUnitModuleWithType(arg_79_2, arg_79_1)

	if var_79_0 then
		var_79_0._go.transform.eulerAngles = arg_79_3
	end
end

function var_0_0.OnMoveUnit(arg_80_0, arg_80_1)
	assert(arg_80_1.type, "type should be exist")

	local var_80_0 = arg_80_0:GetUnitModuleWithType(arg_80_1.type, arg_80_1.id)

	if var_80_0 then
		var_80_0:SetDestination(arg_80_1.position, arg_80_1.speed, nil, arg_80_1.charaRadius)
	end
end

function var_0_0.OnStopUnit(arg_81_0, arg_81_1)
	assert(arg_81_1.type, "type should be exist")

	local var_81_0 = arg_81_0:GetUnitModuleWithType(arg_81_1.type, arg_81_1.id)

	if var_81_0 then
		var_81_0:StopMove()
	end
end

function var_0_0.OnRemoveUnit(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_0:GetUnitListByKey(arg_82_1)
	local var_82_1 = 0

	for iter_82_0, iter_82_1 in ipairs(var_82_0 or {}) do
		if iter_82_1.id == arg_82_2 then
			var_82_1 = iter_82_0

			break
		end
	end

	if var_82_1 > 0 then
		local var_82_2 = var_82_0[var_82_1]

		for iter_82_2 = #arg_82_0.pathfinders, 1, -1 do
			local var_82_3 = arg_82_0.pathfinders[iter_82_2]

			if var_82_3:IsSameUnit(var_82_2) then
				var_82_3:Dispose()
				table.remove(arg_82_0.pathfinders, iter_82_2)
			end
		end

		arg_82_0:RemoveUnit(var_82_2)
		var_82_2:Dispose()
		arg_82_0:OnHideUnitHudAndOpBtn({
			type = arg_82_1,
			id = var_82_2.id
		}, true)
		arg_82_0:GetSubView(IslandTopHeadHudView):HideHud({
			type = arg_82_1,
			id = arg_82_2
		})
		arg_82_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_82_2)
		arg_82_0:GetSubView(IslandInteractionView):CloseInterActionPanelByUnitIdRemove(arg_82_2)
	end
end

function var_0_0.GetAllUnits(arg_83_0)
	table.clear(arg_83_0._unitList)

	for iter_83_0, iter_83_1 in pairs(arg_83_0:GetUnitListRegitser()) do
		for iter_83_2, iter_83_3 in pairs(iter_83_1) do
			table.insert(arg_83_0._unitList, iter_83_3)
		end
	end

	return arg_83_0._unitList
end

function var_0_0.GetUnitModuleWithType(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = arg_84_0:GetUnitListByKey(arg_84_1)

	for iter_84_0, iter_84_1 in ipairs(var_84_0) do
		if iter_84_1.id == arg_84_2 then
			return iter_84_1
		end
	end

	return nil
end

function var_0_0.GetPlayerUnitModule(arg_85_0, arg_85_1)
	return arg_85_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_85_1)
end

function var_0_0.GetUnitModule(arg_86_0, arg_86_1)
	return arg_86_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_86_1)
end

function var_0_0.GetSystemModule(arg_87_0, arg_87_1)
	return arg_87_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_SYSTEM, arg_87_1)
end

function var_0_0.GetSystemUnitModule(arg_88_0, arg_88_1)
	return arg_88_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_88_1)
end

function var_0_0.GetStrollUnitModule(arg_89_0, arg_89_1)
	return arg_89_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_STROLL, arg_89_1)
end

function var_0_0.GetManageSystemModule(arg_90_0, arg_90_1)
	return arg_90_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_MANAGE_SYSTEM, arg_90_1)
end

function var_0_0.GetFollowerModule(arg_91_0, arg_91_1)
	return arg_91_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_FOLLOW, arg_91_1)
end

function var_0_0.OnMovePlayerBefore(arg_92_0)
	if arg_92_0.player:CheckMovement() and arg_92_0.isLockPlayInput then
		arg_92_0.isLockPlayInput = false
	end

	arg_92_0:GetSubView(IslandAniamtionOpView):OnMovePlayerBefore()
end

function var_0_0.OnLockPlayerInput(arg_93_0)
	if arg_93_0.playerInputing then
		arg_93_0.isLockPlayInput = true

		arg_93_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerMove(arg_94_0, arg_94_1)
	if arg_94_0.isLockPlayInput then
		return
	end

	arg_94_0.playerInputing = true

	if arg_94_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_94_0.firstTakePhotoItem:MoveHandle(arg_94_1.targetDir, arg_94_1.force)
	elseif arg_94_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_94_0.thirdTakePhotoItem:MoveHandle(arg_94_1.targetDir, arg_94_1.force)
	else
		arg_94_0.player:MoveHandle(arg_94_1.targetDir, arg_94_1.force)
	end
end

function var_0_0.OnPlayerStopMove(arg_95_0)
	if arg_95_0.isLockPlayInput then
		arg_95_0.isLockPlayInput = false
	end

	arg_95_0.playerInputing = true

	if arg_95_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_95_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_95_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_95_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_95_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerJump(arg_96_0)
	if arg_96_0.takePhotoModel == IslandConst.TakePhotoModel.First or arg_96_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		return
	end

	arg_96_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_97_0)
	arg_97_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_98_0)
	if arg_98_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_98_0.firstTakePhotoItem:OnPlayerPlayerSprint()
	elseif arg_98_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		-- block empty
	else
		arg_98_0.player:OnPlayerPlayerSprint()
	end
end

function var_0_0.OnStopPlayerSprint(arg_99_0)
	if arg_99_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_99_0.firstTakePhotoItem:OnStopPlayerSprint()
	elseif arg_99_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_99_0.thirdTakePhotoItem:OnStopPlayerSprint()
	else
		arg_99_0.player:OnStopPlayerSprint()
	end
end

function var_0_0.OnPlayerWork(arg_100_0, arg_100_1, arg_100_2)
	arg_100_0.player:WorkHandle(arg_100_1, arg_100_2)
end

function var_0_0.OnPlayerDeviceStateChange(arg_101_0, arg_101_1)
	arg_101_0.player:DeviceStateHandle(arg_101_1)
end

function var_0_0.OnSetVisitorSyncData(arg_102_0, arg_102_1, arg_102_2)
	local var_102_0 = arg_102_0:GetPlayerUnitModule(arg_102_1)

	if var_102_0 then
		var_102_0:UpdateSyncData(arg_102_2)
	end
end

function var_0_0.OnWorldObjectStartInteraction(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	local var_103_0 = arg_103_2:GetHostId()
	local var_103_1 = arg_103_2:GetUserId()
	local var_103_2 = arg_103_0:GetUnitModule(var_103_0)
	local var_103_3 = arg_103_0:GetPlayerUnitModule(var_103_1)
	local var_103_4 = arg_103_0.player == var_103_3

	if var_103_4 then
		arg_103_0:GetSubView(IslandOpView):StartInteraction()
	end

	local var_103_5 = arg_103_1:GetTimeline()[arg_103_3]
	local var_103_6 = arg_103_1:GetBlackboardParam()[arg_103_3]

	var_103_2:StartInteract(var_103_3, arg_103_2.id, arg_103_3, var_103_5, var_103_6, arg_103_1:AnySlotUsing(), var_103_4)
end

function var_0_0.OnWorldObjectEndInteraction(arg_104_0, arg_104_1, arg_104_2)
	local var_104_0 = arg_104_2:GetHostId()
	local var_104_1 = arg_104_2:GetUserId()
	local var_104_2 = arg_104_0:GetUnitModule(var_104_0)
	local var_104_3 = arg_104_0:GetPlayerUnitModule(var_104_1)
	local var_104_4 = arg_104_0.player == var_104_3

	if var_104_4 then
		arg_104_0:GetSubView(IslandOpView):EndInteraction()
	end

	var_104_2:EndInteract(var_104_3, arg_104_2.id, not arg_104_1:AnySlotUsing(), var_104_4)
end

function var_0_0.OnWorldObjectInitStatus(arg_105_0, arg_105_1, arg_105_2)
	local var_105_0 = arg_105_0:GetUnitModule(arg_105_1.id)
	local var_105_1 = arg_105_1:GetTimeline()[arg_105_2]
	local var_105_2 = arg_105_1:GetBlackboardParam()[arg_105_2]

	var_105_0:InitStatus(arg_105_2, var_105_1, var_105_2)
end

function var_0_0.OnPlayerAreaChange(arg_106_0)
	arg_106_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnChangeDress(arg_107_0, arg_107_1, arg_107_2)
	arg_107_0.player:OnChangeDress(arg_107_1, arg_107_2)
end

function var_0_0.OnCharacterChangeDress(arg_108_0, arg_108_1, arg_108_2, arg_108_3, arg_108_4)
	local var_108_0 = arg_108_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_108_1)

	if var_108_0 then
		var_108_0:OnCharacterChangeDress(arg_108_2, arg_108_3, arg_108_4)
	end

	local var_108_1 = arg_108_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)

	for iter_108_0, iter_108_1 in ipairs(var_108_1) do
		if iter_108_1:GetDataVO():IsSameShip(arg_108_1) then
			iter_108_1:OnCharacterChangeDress(arg_108_2, arg_108_3, arg_108_4)
		end
	end

	local var_108_2 = arg_108_0:GetUnitListByKey(IslandConst.UNIT_LIST_STROLL)

	for iter_108_2, iter_108_3 in ipairs(var_108_2) do
		if iter_108_3:GetDataVO():IsSameShip(arg_108_1) then
			iter_108_3:OnCharacterChangeDress(arg_108_2, arg_108_3, arg_108_4)
		end
	end
end

function var_0_0.OnStartDelegation(arg_109_0, arg_109_1, arg_109_2)
	local var_109_0 = arg_109_0:GetSystemModule(arg_109_1.build_id)

	if var_109_0 then
		var_109_0:StartDelegation(arg_109_1)
	end
end

function var_0_0.OnEndDelegation(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0 = arg_110_0:GetSystemModule(arg_110_1.build_id)

	if var_110_0 then
		var_110_0:EndDelegation(arg_110_1)
	end
end

function var_0_0.GetPlayerPosition(arg_111_0)
	return arg_111_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0:GetUnitModule(arg_112_1)

	return var_112_0 and var_112_0._go.transform.position
end

function var_0_0.OnShowUnitHudAndOpBtn(arg_113_0, arg_113_1)
	arg_113_0.currentHudUnitData = arg_113_1

	arg_113_0:GetSubView(IslandSlotHudView):ShowHud(arg_113_1.id, arg_113_1.height)
	arg_113_0:GetSubView(IslandOpView):UpdateOperationButton(arg_113_1.operationType, arg_113_1.id)

	if arg_113_1.isHighLightControl then
		arg_113_0.detectionSystem:HighLightUnitHandle(arg_113_1.id, true)
	end
end

function var_0_0.OnHideUnitHudAndOpBtn(arg_114_0, arg_114_1, arg_114_2)
	if not arg_114_0.currentHudUnitData then
		return
	end

	if arg_114_0.currentHudUnitData.id ~= arg_114_1.id or arg_114_0.currentHudUnitData.type ~= arg_114_1.type then
		return
	end

	if not arg_114_2 then
		arg_114_0.currentHudUnitData = nil
	end

	arg_114_0:GetSubView(IslandSlotHudView):HideUnitHud(arg_114_1.id)
	arg_114_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, arg_114_1.id)

	if arg_114_1.isHighLightControl then
		arg_114_0.detectionSystem:HighLightUnitHandle(arg_114_1.id, false)
	end
end

function var_0_0.OnUpdateHud(arg_115_0, arg_115_1)
	if not arg_115_0.currentHudUnitData then
		return
	end

	if arg_115_1 ~= arg_115_0.currentHudUnitData.id then
		return
	end

	arg_115_0:GetSubView(IslandSlotHudView):UpdateHud(arg_115_0.currentHudUnitData.id, arg_115_0.currentHudUnitData.height)
	arg_115_0:GetSubView(IslandOpView):UpdateOperationButton(arg_115_0.currentHudUnitData.operationType, arg_115_0.currentHudUnitData.id)
end

function var_0_0.OnUpdateHandCollectUnit(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_116_1)

	if var_116_0 then
		var_116_0:UpdateHandCollet()
		var_116_0:ResetHp()
	end
end

function var_0_0.OnShowHud(arg_117_0, arg_117_1)
	arg_117_0:GetSubView(IslandTopHeadHudView):ShowHud(arg_117_1)
	arg_117_0:GetSubView(IslandDistanceView):ShowHud(arg_117_1.id)
end

function var_0_0.OnRefreshHud(arg_118_0, arg_118_1)
	arg_118_0:GetSubView(IslandTopHeadHudView):RefreshHud(arg_118_1)
end

function var_0_0.OnHideHud(arg_119_0, arg_119_1)
	arg_119_0:GetSubView(IslandTopHeadHudView):HideHud(arg_119_1)
	arg_119_0:GetSubView(IslandDistanceView):HideHud(arg_119_1.id)
end

function var_0_0.OnDelegateSlotStartPerform(arg_120_0, arg_120_1)
	local var_120_0 = arg_120_0:GetUnitModuleWithType(arg_120_1.type, arg_120_1.id)

	if var_120_0 then
		var_120_0:DelegateSlotStartPerform()
	end
end

function var_0_0.OnRecycleAllSlotEffct(arg_121_0)
	arg_121_0.effectMgr:RecycleAllSlotEffct()
end

function var_0_0.OnLoadDelegatePreviewRole(arg_122_0, arg_122_1, arg_122_2)
	arg_122_0.effectMgr:LoadDelegatePreviewRole(arg_122_1, arg_122_2)
end

function var_0_0.OnUnLoadDelegatePreviewRole(arg_123_0)
	arg_123_0.effectMgr:UnLoadDelegatePreviewRole()
end

function var_0_0.OnSelectSlotEffectShow(arg_124_0, arg_124_1, arg_124_2, arg_124_3, arg_124_4)
	arg_124_0.effectMgr:SelectSlotEffectShow(arg_124_1, arg_124_2, arg_124_3, arg_124_4)
end

function var_0_0.OnTakePlantAttack(arg_125_0, arg_125_1)
	local var_125_0 = arg_125_0:GetUnitModuleWithType(arg_125_1.type, arg_125_1.id)

	if var_125_0 then
		var_125_0:TakeAttack()
	end
end

function var_0_0.OnStartManage(arg_126_0, arg_126_1)
	local var_126_0 = arg_126_0:GetManageSystemModule(arg_126_1.id)

	if var_126_0 then
		var_126_0:StartManage(arg_126_1)
	end
end

function var_0_0.OnEndManage(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_0:GetManageSystemModule(arg_127_1.id)

	if var_127_0 then
		var_127_0:EndManage(arg_127_1)
	end
end

function var_0_0.OnRefreshTaskInfoHud(arg_128_0)
	arg_128_0:GetSubView(IslandTopHeadHudView):UpdateAllHud()
end

function var_0_0.OnRefreshWeatherSystem(arg_129_0)
	arg_129_0.weatherSystem:Play()
end

function var_0_0.OnDispose(arg_130_0)
	arg_130_0.detectionSystem:Dispose()
	arg_130_0.effectMgr:Dispose()
	arg_130_0.coupleActionPlayer:Dispose()
	arg_130_0.coupleAction4FollowerPlayer:Dispose()
	arg_130_0.npcActionPlayer:Dispose()
	arg_130_0.weatherSystem:Dispose()

	for iter_130_0, iter_130_1 in ipairs(arg_130_0.views) do
		iter_130_1:Dispose()
	end

	for iter_130_2, iter_130_3 in ipairs(arg_130_0.pathfinders) do
		iter_130_3:Dispose()
	end

	for iter_130_4, iter_130_5 in ipairs(arg_130_0:GetAllUnits()) do
		iter_130_5:Dispose()
	end

	for iter_130_6, iter_130_7 in pairs(arg_130_0.unitBuilders) do
		iter_130_7:Dispose()
	end

	for iter_130_8, iter_130_9 in pairs(arg_130_0.systemBuilders) do
		iter_130_9:Dispose()
	end

	arg_130_0.npcActionPlayer = nil
	arg_130_0.coupleActionPlayer = nil
	arg_130_0.coupleAction4FollowerPlayer = nil
	arg_130_0.pathfinders = nil
	arg_130_0.unitBuilders = nil
	arg_130_0.systemBuilders = nil
	arg_130_0.views = nil
	arg_130_0.player = nil
	arg_130_0.isInit = false
	arg_130_0._unitList = nil
	arg_130_0.detectionSystem = nil
	arg_130_0.effectMgr = nil
end

return var_0_0
