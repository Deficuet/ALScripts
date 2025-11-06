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
	arg_1_0.coupleNpcWordPlayer = IslandCoupleNpcWordPlayer.New(arg_1_0)
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

	if arg_16_0.needTryMainTrack then
		arg_16_0:TryMainTrack()
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
	arg_18_0:AddListener(ISLAND_EVT.RAW_PLAY_BUBBLE, arg_18_0.OnRawPlayChatBubble)
	arg_18_0:AddListener(ISLAND_EVT.RAW_STOP_BUBBLE, arg_18_0.OnRawStopChatBubble)
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
	arg_19_0:RemoveListener(ISLAND_EVT.RAW_PLAY_BUBBLE, arg_19_0.OnRawPlayChatBubble)
	arg_19_0:RemoveListener(ISLAND_EVT.RAW_STOP_BUBBLE, arg_19_0.OnRawStopChatBubble)
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

function var_0_0.OnFollowerAdd(arg_26_0, arg_26_1)
	arg_26_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_26_0.coupleNpcWordPlayer:Play(arg_26_1)
end

function var_0_0.OnFollowerDel(arg_27_0, arg_27_1)
	arg_27_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_27_0.coupleNpcWordPlayer:Stop(arg_27_1)
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

	arg_46_0:GetSubView(IslandOpView):LaterInit()

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

	local var_49_1 = var_49_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	arg_49_0.selectedNpcId = var_49_1

	arg_49_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_49_1, true)
	arg_49_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_49_1, true)
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

	arg_51_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_51_1)
	arg_51_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_51_1)

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

function var_0_0.OnRawPlayChatBubble(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_0:GetAllUnits()

	arg_64_0:GetSubView(IslandTopHeadHudView):RawPlayBubble(arg_64_1.info, var_64_0, arg_64_1.callback)
end

function var_0_0.OnRawStopChatBubble(arg_65_0, arg_65_1)
	arg_65_0:GetSubView(IslandTopHeadHudView):RawStopBubble(arg_65_1.info)
end

function var_0_0.OnAnyPageOpen(arg_66_0, arg_66_1)
	arg_66_0.anyPageOpen = true

	arg_66_0.player:StopMoveHandle()
	arg_66_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_66_0:GetSubView(IslandSlotHudView):TryDisable()
	arg_66_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_66_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_66_0:GetSubView(IslandAniamtionOpView):CloseAndReset()
end

function var_0_0.OnAllPageClose(arg_67_0)
	arg_67_0.anyPageOpen = false

	arg_67_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_67_0:GetSubView(IslandSlotHudView):TryEnable()
	arg_67_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_67_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnChange_Photo_Height(arg_68_0, arg_68_1, arg_68_2)
	arg_68_0.takePhotoModel = arg_68_1

	if arg_68_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		-- block empty
	elseif arg_68_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_68_0.thirdTakePhotoItem:ChangeHeight(arg_68_2)
	end
end

function var_0_0.OnChangeTakePhotoModel(arg_69_0, arg_69_1)
	arg_69_0.takePhotoModel = arg_69_1

	if arg_69_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_69_0.firstTakePhotoItem:Enable()

		arg_69_0.firstTakePhotoItem._tf.position = arg_69_0.player._tf.position
		arg_69_0.firstTakePhotoItem._tf.rotation = arg_69_0.player._tf.rotation

		arg_69_0.firstTakePhotoItem:SetTargetRotation(arg_69_0.player._tf.rotation)
		arg_69_0.player:SetActiveByLayer(false)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook)):SetPosAndRotationByTargetDir(arg_69_0.player._tf.forward)
	elseif arg_69_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_69_0.thirdTakePhotoItem:Enable()

		arg_69_0.player._tf.position = arg_69_0.firstTakePhotoItem._tf.position
		arg_69_0.player._tf.rotation = arg_69_0.firstTakePhotoItem._tf.rotation

		arg_69_0.player:SetTargetRotation(arg_69_0.firstTakePhotoItem._tf.rotation)
		arg_69_0.player:SetActiveByLayer(true)

		arg_69_0.thirdTakePhotoItem._tf.position = arg_69_0.firstTakePhotoItem._tf:TransformPoint(Vector3(0, 0, -5))
		arg_69_0.thirdTakePhotoItem._tf.rotation = arg_69_0.firstTakePhotoItem._tf.rotation

		arg_69_0.thirdTakePhotoItem:SetTargetRotation(arg_69_0.firstTakePhotoItem._tf.rotation)

		local var_69_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook))
		local var_69_1 = arg_69_0.player._tf.position + Vector3(0, 0.5, 0)
		local var_69_2 = arg_69_0.thirdTakePhotoItem._tf.position + Vector3(0, 1, 0)

		var_69_0:SetPosAndRotationByTargetDir((var_69_1 - var_69_2).normalized)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)
	else
		arg_69_0.firstTakePhotoItem:Disable()
		arg_69_0.thirdTakePhotoItem:Disable()

		arg_69_0.player._tf.position = arg_69_0.firstTakePhotoItem._tf.position
		arg_69_0.player._tf.rotation = arg_69_0.firstTakePhotoItem._tf.rotation

		arg_69_0.player:SetTargetRotation(arg_69_0.firstTakePhotoItem._tf.rotation)
		arg_69_0.player:SetActiveByLayer(true)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraLook)):ResetCameraPos()
	end

	arg_69_0:GetSubView(IslandOpView):ChangeTakePhotoModel(arg_69_1)
end

function var_0_0.OnSetOpMoveBtnActve(arg_70_0, arg_70_1, arg_70_2)
	arg_70_0:GetSubView(IslandOpView):ShowOrHideMoveBtn(arg_70_1, arg_70_2)
end

function var_0_0.OnInterActionBegin(arg_71_0)
	arg_71_0.player:StopMoveHandle()
	arg_71_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_72_0)
	arg_72_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_73_0, arg_73_1)
	arg_73_0.showInterObjId = arg_73_1.id

	arg_73_0:GetSubView(IslandInteractionView):ShowInterActionPanel(arg_73_1)
	arg_73_0:Op("NotifiyIsland", ISLAND_EX_EVT.SHOW_INTERACTION, arg_73_0.showInterObjId)
end

function var_0_0.OnHideInterActionPanel(arg_74_0, arg_74_1)
	if arg_74_0.showInterObjId ~= arg_74_1.id then
		return
	end

	arg_74_0.showInterObjId = nil

	arg_74_0:GetSubView(IslandInteractionView):HideInterActionPanel()
end

function var_0_0.OnStartGuide(arg_75_0)
	arg_75_0.player:StopMoveHandle()
	arg_75_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.OnEndGuide(arg_76_0)
	if arg_76_0.playingStory then
		return
	end

	arg_76_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.DisableInput(arg_77_0)
	arg_77_0.player:StopMoveHandle()
	arg_77_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.EnableInput(arg_78_0)
	arg_78_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.OnTracking(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_1.trackType

	if var_79_0 == IslandTaskTrackCard.TYPES.MAIN then
		arg_79_0.mainTrackId = tonumber(arg_79_1.id)
		arg_79_0.needTryMainTrack = true
	elseif var_79_0 == IslandTaskTrackCard.TYPES.OTHER then
		arg_79_0.trackId = tonumber(arg_79_1.id)
		arg_79_0.trackType = arg_79_1.typ or IslandTaskType.MAIN
		arg_79_0.needTryTrack = true
	end
end

function var_0_0.TryTrack(arg_80_0)
	arg_80_0:TrySetTrack(arg_80_0.trackId)
end

function var_0_0.TrySetTrack(arg_81_0, arg_81_1)
	local var_81_0 = arg_81_0:GetOptTrackingTarget(arg_81_1)

	if not var_81_0 or not var_81_0._go then
		return
	end

	arg_81_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_81_0.player, var_81_0, arg_81_1, arg_81_0.trackType, IslandTaskTrackCard.TYPES.OTHER)

	arg_81_0.needTryTrack = false
end

function var_0_0.TryMainTrack(arg_82_0)
	arg_82_0:TrySetMainTrack(arg_82_0.mainTrackId)
end

function var_0_0.TrySetMainTrack(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_0:GetOptTrackingTarget(arg_83_1)

	if not var_83_0 or not var_83_0._go then
		return
	end

	arg_83_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_83_0.player, var_83_0, arg_83_1, IslandTaskType.MAIN, IslandTaskTrackCard.TYPES.MAIN)

	arg_83_0.needTryMainTrack = false
end

function var_0_0.OnUnTracking(arg_84_0, arg_84_1)
	if arg_84_1 == IslandTaskTrackCard.TYPES.MAIN then
		arg_84_0.mainTrackId = nil
	elseif arg_84_1 == IslandTaskTrackCard.TYPES.OTHER then
		arg_84_0.trackId = nil
	end

	arg_84_0:GetSubView(IslandDistanceView):CancelTracking(arg_84_1)
end

local function var_0_1(arg_85_0, arg_85_1)
	local var_85_0 = pg.island_world_objects[arg_85_0]

	if not var_85_0 then
		return
	end

	return var_85_0.mapId == arg_85_1
end

local function var_0_2(arg_86_0, arg_86_1, arg_86_2)
	for iter_86_0, iter_86_1 in ipairs(arg_86_0) do
		for iter_86_2, iter_86_3 in ipairs(iter_86_1[2]) do
			local var_86_0 = pg.island_interaction[iter_86_3]

			if var_86_0.type == arg_86_2 and var_0_1(tonumber(var_86_0.param), arg_86_1) then
				return iter_86_1[1]
			end
		end
	end

	return nil
end

local function var_0_3(arg_87_0)
	local var_87_0 = {}
	local var_87_1 = {}

	for iter_87_0, iter_87_1 in ipairs(arg_87_0) do
		for iter_87_2, iter_87_3 in ipairs(iter_87_1[2]) do
			local var_87_2 = pg.island_interaction[iter_87_3]

			if var_87_2.type == IslandInteractionUntil.TYPE_TRANSFER then
				table.insert(var_87_0, iter_87_1[1])
			elseif var_87_2.type == IslandInteractionUntil.TYPE_SP_TRANSFER then
				table.insert(var_87_1, iter_87_1[1])
			end
		end
	end

	if #var_87_1 > 0 then
		return var_87_1[1]
	end

	if #var_87_0 > 0 then
		return var_87_0[1]
	end

	return nil
end

function var_0_0.GetOptTrackingTarget(arg_88_0, arg_88_1)
	local var_88_0 = arg_88_0:GetUnitModule(arg_88_1)

	if var_88_0 then
		return var_88_0
	end

	local var_88_1 = pg.island_world_objects[arg_88_1]

	if not var_88_1 then
		return nil
	end

	local var_88_2 = {}

	for iter_88_0, iter_88_1 in ipairs(arg_88_0:GetUnitListByKey(IslandConst.UNIT_LIST_OBJ)) do
		local var_88_3, var_88_4 = iter_88_1:IsMapTransfer()

		if var_88_3 then
			table.insert(var_88_2, {
				iter_88_1,
				var_88_4
			})
		end
	end

	local var_88_5
	local var_88_6 = var_0_2(var_88_2, var_88_1.mapId, IslandInteractionUntil.TYPE_TRANSFER) or var_0_2(var_88_2, var_88_1.mapId, IslandInteractionUntil.TYPE_SP_TRANSFER)

	var_88_6 = var_88_6 or var_0_3(var_88_2)

	return var_88_6
end

function var_0_0.OnUpdateCustomOpPositon(arg_89_0)
	arg_89_0:GetSubView(IslandOpView):InitOpCustumPositon()
end

function var_0_0.OnGenUnit(arg_90_0, arg_90_1, arg_90_2)
	local var_90_0 = arg_90_0.unitBuilders[arg_90_1:GetType()]:Build(arg_90_1, arg_90_2)

	arg_90_0:AddUnit(var_90_0)

	if arg_90_1:IsPlayer() then
		arg_90_0.player = var_90_0
	end

	if arg_90_1:IsFirstTakePhoto() then
		arg_90_0.firstTakePhotoItem = var_90_0
	end

	if arg_90_1:IsThirdTakePhoto() then
		arg_90_0.thirdTakePhotoItem = var_90_0
	end
end

function var_0_0.OnGenSystem(arg_91_0, arg_91_1)
	local var_91_0 = arg_91_0.systemBuilders[arg_91_1:GetType()]:Build(arg_91_1)

	arg_91_0:AddUnit(var_91_0)
end

function var_0_0.OnActiveOrDisactiveUnit(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	local var_92_0

	if arg_92_1 == 0 then
		var_92_0 = arg_92_0.player
	else
		var_92_0 = arg_92_0:GetUnitModuleWithType(arg_92_2, arg_92_1)
	end

	if var_92_0 and arg_92_3 then
		var_92_0:Enable()
	end

	if var_92_0 and not arg_92_3 then
		var_92_0:Disable()
	end
end

function var_0_0.OnResetUnitPos(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	local var_93_0 = arg_93_0:GetUnitModuleWithType(arg_93_2, arg_93_1)

	if var_93_0 then
		var_93_0._go.transform.position = arg_93_3
	end
end

function var_0_0.OnResetUnitRotation(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	local var_94_0 = arg_94_0:GetUnitModuleWithType(arg_94_2, arg_94_1)

	if var_94_0 then
		var_94_0._go.transform.eulerAngles = arg_94_3
	end
end

function var_0_0.OnMoveUnit(arg_95_0, arg_95_1)
	assert(arg_95_1.type, "type should be exist")

	local var_95_0 = arg_95_0:GetUnitModuleWithType(arg_95_1.type, arg_95_1.id)

	if var_95_0 then
		var_95_0:SetDestination(arg_95_1.position, arg_95_1.speed, nil, arg_95_1.charaRadius)
	end
end

function var_0_0.OnStopUnit(arg_96_0, arg_96_1)
	assert(arg_96_1.type, "type should be exist")

	local var_96_0 = arg_96_0:GetUnitModuleWithType(arg_96_1.type, arg_96_1.id)

	if var_96_0 then
		var_96_0:StopMove()
	end
end

function var_0_0.OnRemoveUnit(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0 = arg_97_0:GetUnitListByKey(arg_97_1)
	local var_97_1 = 0

	for iter_97_0, iter_97_1 in ipairs(var_97_0 or {}) do
		if iter_97_1.id == arg_97_2 then
			var_97_1 = iter_97_0

			break
		end
	end

	if var_97_1 > 0 then
		local var_97_2 = var_97_0[var_97_1]

		for iter_97_2 = #arg_97_0.pathfinders, 1, -1 do
			local var_97_3 = arg_97_0.pathfinders[iter_97_2]

			if var_97_3:IsSameUnit(var_97_2) then
				var_97_3:Dispose()
				table.remove(arg_97_0.pathfinders, iter_97_2)
			end
		end

		arg_97_0:RemoveUnit(var_97_2)
		var_97_2:Dispose()
		arg_97_0:OnHideUnitHudAndOpBtn({
			type = arg_97_1,
			id = var_97_2.id
		}, true)
		arg_97_0:GetSubView(IslandTopHeadHudView):HideHud({
			type = arg_97_1,
			id = arg_97_2
		})
		arg_97_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_97_2)
		arg_97_0:GetSubView(IslandInteractionView):CloseInterActionPanelByUnitIdRemove(arg_97_2)
	end
end

function var_0_0.GetAllUnits(arg_98_0)
	table.clear(arg_98_0._unitList)

	for iter_98_0, iter_98_1 in pairs(arg_98_0:GetUnitListRegitser()) do
		for iter_98_2, iter_98_3 in pairs(iter_98_1) do
			table.insert(arg_98_0._unitList, iter_98_3)
		end
	end

	return arg_98_0._unitList
end

function var_0_0.GetUnitModuleWithType(arg_99_0, arg_99_1, arg_99_2)
	if arg_99_1 == IslandConst.UNIT_LIST_PLAYER and arg_99_2 == 0 then
		return arg_99_0.player
	end

	local var_99_0 = arg_99_0:GetUnitListByKey(arg_99_1)

	for iter_99_0, iter_99_1 in ipairs(var_99_0) do
		if iter_99_1.id == arg_99_2 then
			return iter_99_1
		end
	end

	return nil
end

function var_0_0.GetPlayerUnitModule(arg_100_0, arg_100_1)
	return arg_100_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_100_1)
end

function var_0_0.GetUnitModule(arg_101_0, arg_101_1)
	return arg_101_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_101_1)
end

function var_0_0.GetSystemModule(arg_102_0, arg_102_1)
	return arg_102_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_SYSTEM, arg_102_1)
end

function var_0_0.GetSystemUnitModule(arg_103_0, arg_103_1)
	return arg_103_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_103_1)
end

function var_0_0.GetStrollUnitModule(arg_104_0, arg_104_1)
	return arg_104_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_STROLL, arg_104_1)
end

function var_0_0.GetManageSystemModule(arg_105_0, arg_105_1)
	return arg_105_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_MANAGE_SYSTEM, arg_105_1)
end

function var_0_0.GetFollowerModule(arg_106_0, arg_106_1)
	return arg_106_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_FOLLOW, arg_106_1)
end

function var_0_0.OnMovePlayerBefore(arg_107_0)
	if arg_107_0.player:CheckMovement() and arg_107_0.isLockPlayInput then
		arg_107_0.isLockPlayInput = false
	end

	arg_107_0:GetSubView(IslandAniamtionOpView):OnMovePlayerBefore()
end

function var_0_0.OnLockPlayerInput(arg_108_0)
	if arg_108_0.playerInputing then
		arg_108_0.isLockPlayInput = true

		arg_108_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerMove(arg_109_0, arg_109_1)
	if arg_109_0.isLockPlayInput then
		return
	end

	arg_109_0.playerInputing = true

	if arg_109_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_109_0.firstTakePhotoItem:MoveHandle(arg_109_1.targetDir, arg_109_1.force)
	elseif arg_109_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_109_0.thirdTakePhotoItem:MoveHandle(arg_109_1.targetDir, arg_109_1.force)
	else
		arg_109_0.player:MoveHandle(arg_109_1.targetDir, arg_109_1.force)
	end
end

function var_0_0.OnPlayerStopMove(arg_110_0)
	if arg_110_0.isLockPlayInput then
		arg_110_0.isLockPlayInput = false
	end

	arg_110_0.playerInputing = true

	if arg_110_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_110_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_110_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_110_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_110_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerStopMoveHandle(arg_111_0)
	if arg_111_0.isLockPlayInput then
		arg_111_0.isLockPlayInput = false
	end

	arg_111_0.playerInputing = true

	if arg_111_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_111_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_111_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_111_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_111_0.player:StopMoveHandleByInput()
	end
end

function var_0_0.OnPlayerJump(arg_112_0)
	if arg_112_0.takePhotoModel == IslandConst.TakePhotoModel.First or arg_112_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		return
	end

	arg_112_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_113_0)
	arg_113_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_114_0)
	if arg_114_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_114_0.firstTakePhotoItem:OnPlayerPlayerSprint()
	elseif arg_114_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		-- block empty
	else
		arg_114_0.player:OnPlayerPlayerSprint()
	end
end

function var_0_0.OnStopPlayerSprint(arg_115_0)
	if arg_115_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_115_0.firstTakePhotoItem:OnStopPlayerSprint()
	elseif arg_115_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_115_0.thirdTakePhotoItem:OnStopPlayerSprint()
	else
		arg_115_0.player:OnStopPlayerSprint()
	end
end

function var_0_0.OnPlayerWork(arg_116_0, arg_116_1, arg_116_2)
	arg_116_0.player:WorkHandle(arg_116_1, arg_116_2)
end

function var_0_0.OnPlayerDeviceStateChange(arg_117_0, arg_117_1)
	arg_117_0.player:DeviceStateHandle(arg_117_1)
end

function var_0_0.OnSetVisitorSyncData(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = arg_118_0:GetPlayerUnitModule(arg_118_1)

	if var_118_0 then
		var_118_0:UpdateSyncData(arg_118_2)
	end
end

function var_0_0.OnWorldObjectStartInteraction(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	local var_119_0 = arg_119_2:GetHostId()
	local var_119_1 = arg_119_2:GetUserId()
	local var_119_2 = arg_119_0:GetUnitModule(var_119_0)
	local var_119_3 = arg_119_0:GetPlayerUnitModule(var_119_1)
	local var_119_4 = arg_119_0.player == var_119_3

	if var_119_4 then
		arg_119_0:GetSubView(IslandOpView):StartInteraction()
	end

	local var_119_5 = arg_119_1:GetTimeline()[arg_119_3]
	local var_119_6 = arg_119_1:GetBlackboardParam()[arg_119_3]

	var_119_2:StartInteract(var_119_3, arg_119_2.id, arg_119_3, var_119_5, var_119_6, arg_119_1:AnySlotUsing(), var_119_4)
end

function var_0_0.OnWorldObjectEndInteraction(arg_120_0, arg_120_1, arg_120_2)
	local var_120_0 = arg_120_2:GetHostId()
	local var_120_1 = arg_120_2:GetUserId()
	local var_120_2 = arg_120_0:GetUnitModule(var_120_0)
	local var_120_3 = arg_120_0:GetPlayerUnitModule(var_120_1)
	local var_120_4 = arg_120_0.player == var_120_3

	if var_120_4 then
		arg_120_0:GetSubView(IslandOpView):EndInteraction()
	end

	var_120_2:EndInteract(var_120_3, arg_120_2.id, not arg_120_1:AnySlotUsing(), var_120_4)
end

function var_0_0.OnWorldObjectInitStatus(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = arg_121_0:GetUnitModule(arg_121_1.id)
	local var_121_1 = arg_121_1:GetTimeline()[arg_121_2]
	local var_121_2 = arg_121_1:GetBlackboardParam()[arg_121_2]

	var_121_0:InitStatus(arg_121_2, var_121_1, var_121_2)
end

function var_0_0.OnPlayerAreaChange(arg_122_0)
	arg_122_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnChangeDress(arg_123_0, arg_123_1, arg_123_2)
	arg_123_0.player:OnChangeDress(arg_123_1, arg_123_2)
end

function var_0_0.OnCharacterChangeDress(arg_124_0, arg_124_1, arg_124_2, arg_124_3, arg_124_4)
	local var_124_0 = arg_124_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_124_1)

	if var_124_0 then
		var_124_0:OnCharacterChangeDress(arg_124_2, arg_124_3, arg_124_4)
	end

	local var_124_1 = arg_124_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)

	for iter_124_0, iter_124_1 in ipairs(var_124_1) do
		if iter_124_1:GetDataVO():IsSameShip(arg_124_1) then
			iter_124_1:OnCharacterChangeDress(arg_124_2, arg_124_3, arg_124_4)
		end
	end

	local var_124_2 = arg_124_0:GetUnitListByKey(IslandConst.UNIT_LIST_STROLL)

	for iter_124_2, iter_124_3 in ipairs(var_124_2) do
		if iter_124_3:GetDataVO():IsSameShip(arg_124_1) then
			iter_124_3:OnCharacterChangeDress(arg_124_2, arg_124_3, arg_124_4)
		end
	end
end

function var_0_0.OnStartDelegation(arg_125_0, arg_125_1, arg_125_2)
	local var_125_0 = arg_125_0:GetSystemModule(arg_125_1.build_id)

	if var_125_0 then
		var_125_0:StartDelegation(arg_125_1)
	end
end

function var_0_0.OnEndDelegation(arg_126_0, arg_126_1, arg_126_2)
	local var_126_0 = arg_126_0:GetSystemModule(arg_126_1.build_id)

	if var_126_0 then
		var_126_0:EndDelegation(arg_126_1)
	end
end

function var_0_0.GetPlayerPosition(arg_127_0)
	return arg_127_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_128_0, arg_128_1)
	local var_128_0 = arg_128_0:GetUnitModule(arg_128_1)

	return var_128_0 and var_128_0._go.transform.position
end

function var_0_0.OnShowUnitHudAndOpBtn(arg_129_0, arg_129_1)
	arg_129_0.currentHudUnitData = arg_129_1

	arg_129_0:GetSubView(IslandSlotHudView):ShowHud(arg_129_1.id, arg_129_1.height)
	arg_129_0:GetSubView(IslandOpView):UpdateOperationButton(arg_129_1.operationType, arg_129_1.id)

	if arg_129_1.isHighLightControl then
		arg_129_0.detectionSystem:HighLightUnitHandle(arg_129_1.id, true)
	end
end

function var_0_0.OnHideUnitHudAndOpBtn(arg_130_0, arg_130_1, arg_130_2)
	if not arg_130_0.currentHudUnitData then
		return
	end

	if arg_130_0.currentHudUnitData.id ~= arg_130_1.id or arg_130_0.currentHudUnitData.type ~= arg_130_1.type then
		return
	end

	if not arg_130_2 then
		arg_130_0.currentHudUnitData = nil
	end

	arg_130_0:GetSubView(IslandSlotHudView):HideUnitHud(arg_130_1.id)
	arg_130_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, arg_130_1.id)

	if arg_130_1.isHighLightControl then
		arg_130_0.detectionSystem:HighLightUnitHandle(arg_130_1.id, false)
	end
end

function var_0_0.OnUpdateHud(arg_131_0, arg_131_1)
	if not arg_131_0.currentHudUnitData then
		return
	end

	if arg_131_1 ~= arg_131_0.currentHudUnitData.id then
		return
	end

	arg_131_0:GetSubView(IslandSlotHudView):UpdateHud(arg_131_0.currentHudUnitData.id, arg_131_0.currentHudUnitData.height)
	arg_131_0:GetSubView(IslandOpView):UpdateOperationButton(arg_131_0.currentHudUnitData.operationType, arg_131_0.currentHudUnitData.id)
end

function var_0_0.OnUpdateHandCollectUnit(arg_132_0, arg_132_1)
	local var_132_0 = arg_132_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_132_1)

	if var_132_0 then
		var_132_0:UpdateHandCollet()
		var_132_0:ResetHp()
	end
end

function var_0_0.OnShowHud(arg_133_0, arg_133_1)
	arg_133_0:GetSubView(IslandTopHeadHudView):ShowHud(arg_133_1)
	arg_133_0:GetSubView(IslandDistanceView):ShowHud(arg_133_1.id)
end

function var_0_0.OnRefreshHud(arg_134_0, arg_134_1)
	arg_134_0:GetSubView(IslandTopHeadHudView):RefreshHud(arg_134_1)
end

function var_0_0.OnHideHud(arg_135_0, arg_135_1)
	arg_135_0:GetSubView(IslandTopHeadHudView):HideHud(arg_135_1)
	arg_135_0:GetSubView(IslandDistanceView):HideHud(arg_135_1.id)
end

function var_0_0.OnDelegateSlotStartPerform(arg_136_0, arg_136_1)
	local var_136_0 = arg_136_0:GetUnitModuleWithType(arg_136_1.type, arg_136_1.id)

	if var_136_0 then
		var_136_0:DelegateSlotStartPerform()
	end
end

function var_0_0.OnRecycleAllSlotEffct(arg_137_0)
	arg_137_0.effectMgr:RecycleAllSlotEffct()
end

function var_0_0.OnLoadDelegatePreviewRole(arg_138_0, arg_138_1, arg_138_2)
	arg_138_0.effectMgr:LoadDelegatePreviewRole(arg_138_1, arg_138_2)
end

function var_0_0.OnUnLoadDelegatePreviewRole(arg_139_0)
	arg_139_0.effectMgr:UnLoadDelegatePreviewRole()
end

function var_0_0.OnSelectSlotEffectShow(arg_140_0, arg_140_1, arg_140_2, arg_140_3, arg_140_4)
	arg_140_0.effectMgr:SelectSlotEffectShow(arg_140_1, arg_140_2, arg_140_3, arg_140_4)
end

function var_0_0.OnTakePlantAttack(arg_141_0, arg_141_1)
	local var_141_0 = arg_141_0:GetUnitModuleWithType(arg_141_1.type, arg_141_1.id)

	if var_141_0 then
		var_141_0:TakeAttack()
	end
end

function var_0_0.OnStartManage(arg_142_0, arg_142_1)
	local var_142_0 = arg_142_0:GetManageSystemModule(arg_142_1.id)

	if var_142_0 then
		var_142_0:StartManage(arg_142_1)
	end
end

function var_0_0.OnEndManage(arg_143_0, arg_143_1)
	local var_143_0 = arg_143_0:GetManageSystemModule(arg_143_1.id)

	if var_143_0 then
		var_143_0:EndManage(arg_143_1)
	end
end

function var_0_0.OnRefreshTaskInfoHud(arg_144_0)
	arg_144_0:GetSubView(IslandTopHeadHudView):UpdateAllHud()
end

function var_0_0.OnRefreshWeatherSystem(arg_145_0)
	arg_145_0.weatherSystem:Play()
end

function var_0_0.OnDispose(arg_146_0)
	arg_146_0.detectionSystem:Dispose()
	arg_146_0.effectMgr:Dispose()
	arg_146_0.coupleActionPlayer:Dispose()
	arg_146_0.coupleAction4FollowerPlayer:Dispose()
	arg_146_0.npcActionPlayer:Dispose()
	arg_146_0.weatherSystem:Dispose()
	arg_146_0.coupleNpcWordPlayer:Dispose()

	for iter_146_0, iter_146_1 in ipairs(arg_146_0.views) do
		iter_146_1:Dispose()
	end

	for iter_146_2, iter_146_3 in ipairs(arg_146_0.pathfinders) do
		iter_146_3:Dispose()
	end

	for iter_146_4, iter_146_5 in ipairs(arg_146_0:GetAllUnits()) do
		iter_146_5:Dispose()
	end

	for iter_146_6, iter_146_7 in pairs(arg_146_0.unitBuilders) do
		iter_146_7:Dispose()
	end

	for iter_146_8, iter_146_9 in pairs(arg_146_0.systemBuilders) do
		iter_146_9:Dispose()
	end

	arg_146_0.npcActionPlayer = nil
	arg_146_0.coupleActionPlayer = nil
	arg_146_0.coupleAction4FollowerPlayer = nil
	arg_146_0.pathfinders = nil
	arg_146_0.unitBuilders = nil
	arg_146_0.systemBuilders = nil
	arg_146_0.views = nil
	arg_146_0.player = nil
	arg_146_0.isInit = false
	arg_146_0._unitList = nil
	arg_146_0.detectionSystem = nil
	arg_146_0.effectMgr = nil
	arg_146_0.coupleNpcWordPlayer = nil
end

return var_0_0
