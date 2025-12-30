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
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_FISH_POINT)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_DELEGATE_UNIT)
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_PRODUCT_SYSTEM)

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
		[IslandConst.UNIT_TYPE_FIRST_TAKE_PHOTO_ITEM] = IslandTakePhotoBuilder.New(arg_1_0, IslandConst.UNIT_LIST_PHOTO),
		[IslandConst.UNIT_TYPE_FISH_POINT] = IslandStaticUnitBuilder.New(arg_1_0, IslandConst.UNIT_LIST_FISH_POINT),
		[IslandConst.UNIT_TYPE_DELEGATE_FISH] = IslandDelegationFishBuilder.New(arg_1_0, IslandConst.UNIT_LIST_DELEGATE_UNIT)
	}
	arg_1_0.systemBuilders = {
		[IslandConst.SYSTEM_TYPE_CHARACTER] = IslandSystemBuilder.New(arg_1_0, IslandCharacterSystem),
		[IslandConst.SYSTEM_TYPE_PRODUCT] = IslandSystemBuilder.New(arg_1_0, IslandProductSystem, IslandConst.UNIT_LIST_PRODUCT_SYSTEM),
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
	arg_1_0.fishingSynPlayers = {}
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

function var_0_0.DoEnter(arg_2_0)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0:GetAllUnits()) do
		table.insert(var_2_0, function(arg_3_0)
			iter_2_1:Start()

			if iter_2_0 % 3 == 0 then
				arg_3_0()
			else
				onNextTick(arg_3_0)
			end
		end)
	end

	seriesAsync(var_2_0, function()
		arg_2_0.isInit = true
	end)
end

function var_0_0.GetSubView(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.views or {}) do
		if isa(iter_5_1, arg_5_1) then
			return iter_5_1
		end
	end

	return nil
end

function var_0_0.CreateOpView(arg_6_0)
	return IslandOpView.New(arg_6_0)
end

function var_0_0.CreateSlotHudView(arg_7_0)
	return IslandSlotHudView.New(arg_7_0)
end

function var_0_0.CreateCancelAnimationOpView(arg_8_0)
	return IslandCancelAnimationOpView.New(arg_8_0)
end

function var_0_0.CreateTopHeadHudView(arg_9_0)
	return IslandTopHeadHudView.New(arg_9_0)
end

function var_0_0.CreateBottomHeadHudeView(arg_10_0)
	return IslandBottomHeadHudView.New(arg_10_0)
end

function var_0_0.CreateAnimationOpView(arg_11_0)
	return IslandAniamtionOpView.New(arg_11_0)
end

function var_0_0.CreateInteractionView(arg_12_0)
	return IslandInteractionView.New(arg_12_0)
end

function var_0_0.CreateDistanceView(arg_13_0)
	return IslandDistanceView.New(arg_13_0)
end

function var_0_0.CreateSeedOpView(arg_14_0)
	return IslandSeedOpView.New(arg_14_0)
end

function var_0_0.IsLoaded(arg_15_0)
	local var_15_0 = arg_15_0:GetAllUnits()

	return _.all(arg_15_0.views, function(arg_16_0)
		return arg_16_0:IsLoaded()
	end) and #var_15_0 > 0 and _.all(var_15_0, function(arg_17_0)
		return arg_17_0:IsLoaded()
	end)
end

function var_0_0.IsInit(arg_18_0)
	return arg_18_0.isInit
end

function var_0_0.Update(arg_19_0)
	if not arg_19_0.isInit then
		return
	end

	for iter_19_0, iter_19_1 in ipairs(arg_19_0:GetAllUnits()) do
		iter_19_1:Update()
	end

	for iter_19_2, iter_19_3 in ipairs(arg_19_0.views) do
		iter_19_3:Update()
	end

	for iter_19_4, iter_19_5 in ipairs(arg_19_0.pathfinders) do
		iter_19_5:Update()
	end

	if arg_19_0.needTryTrack then
		arg_19_0:TryTrack()
	end

	if arg_19_0.needTryMainTrack then
		arg_19_0:TryMainTrack()
	end
end

function var_0_0.LateUpdate(arg_20_0)
	if not arg_20_0.isInit then
		return
	end

	for iter_20_0, iter_20_1 in ipairs(arg_20_0:GetAllUnits()) do
		iter_20_1:LateUpdate()
	end

	for iter_20_2, iter_20_3 in ipairs(arg_20_0.views) do
		iter_20_3:LateUpdate()
	end

	for iter_20_4, iter_20_5 in ipairs(arg_20_0.pathfinders) do
		iter_20_5:LateUpdate()
	end
end

function var_0_0.AddListeners(arg_21_0)
	arg_21_0:AddListener(ISLAND_EVT.GEN_UNIT, arg_21_0.OnGenUnit)
	arg_21_0:AddListener(ISLAND_EVT.RMOVE_UNIT, arg_21_0.OnRemoveUnit)
	arg_21_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_21_0.OnInterActionBegin)
	arg_21_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_21_0.OnInterActionEnd)
	arg_21_0:AddListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_21_0.OnStopUnit)
	arg_21_0:AddListener(ISLAND_EVT.MOVE_UNIT, arg_21_0.OnMoveUnit)
	arg_21_0:AddListener(ISLAND_EVT.INIT_FINISH, arg_21_0.OnSceneInited)
	arg_21_0:AddListener(ISLAND_EVT.MOVE_PLAYER, arg_21_0.OnPlayerMove)
	arg_21_0:AddListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_21_0.OnPlayerStopMoveHandle)
	arg_21_0:AddListener(ISLAND_EVT.JUMP_PLAYER, arg_21_0.OnPlayerJump)
	arg_21_0:AddListener(ISLAND_EVT.APPROACH_UNIT, arg_21_0.OnShowInterActionPanel)
	arg_21_0:AddListener(ISLAND_EVT.LEAVE_UNIT, arg_21_0.OnHideInterActionPanel)
	arg_21_0:AddListener(ISLAND_EVT.TRACKING, arg_21_0.OnTracking)
	arg_21_0:AddListener(ISLAND_EVT.UNTRACKING, arg_21_0.OnUnTracking)
	arg_21_0:AddListener(ISLAND_EVT.AREACHANGE, arg_21_0.OnPlayerAreaChange)
	arg_21_0:AddListener(ISLAND_EVT.PLAYERRUN, arg_21_0.OnPlayerPlayerRun)
	arg_21_0:AddListener(ISLAND_EVT.SPRINT_PLAYER, arg_21_0.OnPlayerPlayerSprint)
	arg_21_0:AddListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_21_0.OnStopPlayerSprint)
	arg_21_0:AddListener(ISLAND_EVT.CHANGE_DRESS, arg_21_0.OnChangeDress)
	arg_21_0:AddListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_21_0.OnCharacterChangeDress)
	arg_21_0:AddListener(ISLAND_EVT.RESET_UNIT_POS, arg_21_0.OnResetUnitPos)
	arg_21_0:AddListener(ISLAND_EVT.RESET_UNIT_ROT, arg_21_0.OnResetUnitRotation)
	arg_21_0:AddListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_21_0.OnAnyPageOpen)
	arg_21_0:AddListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_21_0.OnAllPageClose)
	arg_21_0:AddListener(ISLAND_EVT.Change_TakePhoto_Model, arg_21_0.OnChangeTakePhotoModel)
	arg_21_0:AddListener(ISLAND_EVT.Change_Photo_Height, arg_21_0.OnChange_Photo_Height)
	arg_21_0:AddListener(ISLAND_EVT.SetOpMoveBtnActve, arg_21_0.OnSetOpMoveBtnActve)
	arg_21_0:AddListener(ISLAND_EVT.PLAY_BUBBLE, arg_21_0.OnPlayChatBubble)
	arg_21_0:AddListener(ISLAND_EVT.RAW_PLAY_BUBBLE, arg_21_0.OnRawPlayChatBubble)
	arg_21_0:AddListener(ISLAND_EVT.RAW_STOP_BUBBLE, arg_21_0.OnRawStopChatBubble)
	arg_21_0:AddListener(ISLAND_EVT.START_STORY, arg_21_0.OnStartStory)
	arg_21_0:AddListener(ISLAND_EVT.END_STORY, arg_21_0.OnEndStory)
	arg_21_0:AddListener(ISLAND_EVT.START_DEGATION, arg_21_0.OnStartDelegation)
	arg_21_0:AddListener(ISLAND_EVT.END_DEGATION, arg_21_0.OnEndDelegation)
	arg_21_0:AddListener(ISLAND_EVT.GEN_SYSTEM, arg_21_0.OnGenSystem)
	arg_21_0:AddListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_21_0.OnWorldObjectStartInteraction)
	arg_21_0:AddListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_21_0.OnWorldObjectEndInteraction)
	arg_21_0:AddListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_21_0.OnWorldObjectInitStatus)
	arg_21_0:AddListener(ISLAND_EVT.INIT_INTERACTION_OP_VIEW, arg_21_0.InitInteractionOpView)
	arg_21_0:AddListener(ISLAND_EVT.REFRESH_INTERACTION, arg_21_0.OnRefreshInteractionBtn)
	arg_21_0:AddListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_21_0.OnShowUnitHudAndOpBtn)
	arg_21_0:AddListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_21_0.OnHideUnitHudAndOpBtn)
	arg_21_0:AddListener(ISLAND_EVT.DETECTOR_CHANGED, arg_21_0.OnDetectorChanged)
	arg_21_0:AddListener(ISLAND_EVT.SELECTED_DETECTOR, arg_21_0.OnDetectorSelected)
	arg_21_0:AddListener(ISLAND_EVT.FISHPOINT_DETECTOR, arg_21_0.OnFishPointSelected)
	arg_21_0:AddListener(ISLAND_EVT.NPC_DETECTED, arg_21_0.OnNpcDetectorSelected)
	arg_21_0:AddListener(ISLAND_EVT.NO_NPC_DETECTED, arg_21_0.OnNpcDetectorUnSelected)
	arg_21_0:AddListener(ISLAND_EVT.SET_PLAYER_WORK, arg_21_0.OnPlayerWork)
	arg_21_0:AddListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_21_0.OnPlayerDeviceStateChange)
	arg_21_0:AddListener(ISLAND_EVT.UPDATE_HUD, arg_21_0.OnUpdateHud)
	arg_21_0:AddListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_21_0.OnUpdateHandCollectUnit)
	arg_21_0:AddListener(ISLAND_EVT.START_DELEGATE_SLOT_PERFORM, arg_21_0.OnDelegateSlotStartPerform)
	arg_21_0:AddListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_21_0.OnRecycleAllSlotEffct)
	arg_21_0:AddListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_21_0.OnSelectSlotEffectShow)
	arg_21_0:AddListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_21_0.OnLoadDelegatePreviewRole)
	arg_21_0:AddListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_21_0.OnUnLoadDelegatePreviewRole)
	arg_21_0:AddListener(ISLAND_EVT.Take_Plant_Attact, arg_21_0.OnTakePlantAttack)
	arg_21_0:AddListener(ISLAND_EVT.START_MANAGE, arg_21_0.OnStartManage)
	arg_21_0:AddListener(ISLAND_EVT.END_MANAGE, arg_21_0.OnEndManage)
	arg_21_0:AddListener(ISLAND_EVT.SHOW_HUD, arg_21_0.OnShowHud)
	arg_21_0:AddListener(ISLAND_EVT.HIDE_HUD, arg_21_0.OnHideHud)
	arg_21_0:AddListener(ISLAND_EVT.REFRESH_HUD, arg_21_0.OnRefreshHud)
	arg_21_0:AddListener(ISLAND_EVT.START_GUIDE, arg_21_0.OnStartGuide)
	arg_21_0:AddListener(ISLAND_EVT.END_GUIDE, arg_21_0.OnEndGuide)
	arg_21_0:AddListener(ISLAND_EVT.START_PERFORMANCE, arg_21_0.OnStartPerformance)
	arg_21_0:AddListener(ISLAND_EVT.END_PERFORMANCE, arg_21_0.OnEndPerformance)
	arg_21_0:AddListener(ISLAND_EVT.DISABLE_INPUT, arg_21_0.DisableInput)
	arg_21_0:AddListener(ISLAND_EVT.ENABLE_INPUT, arg_21_0.EnableInput)
	arg_21_0:AddListener(ISLAND_EVT.GEN_PATH_FINDER, arg_21_0.OnGenPathFinder)
	arg_21_0:AddListener(ISLAND_EVT.REMOVE_PATH_FINDER, arg_21_0.OnRemovePathFinder)
	arg_21_0:AddListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_21_0.OnActiveOrDisactiveUnit)
	arg_21_0:AddListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_21_0.OnOpenAniamtionOpPage)
	arg_21_0:AddListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_21_0.OnCloseAniamtionOpPage)
	arg_21_0:AddListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_21_0.OnMovePlayerBefore)
	arg_21_0:AddListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_21_0.OnRefreshTaskInfoHud)
	arg_21_0:AddListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_21_0.OnResponAniamtionOp)
	arg_21_0:AddListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_21_0.OnChangeVisterDress)
	arg_21_0:AddListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_21_0.OnSetVisitorSyncData)
	arg_21_0:AddListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_21_0.OnShowNpcAniamtionBubble)
	arg_21_0:AddListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_21_0.OnHideNpcAniamtionBubble)
	arg_21_0:AddListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_21_0.OnPlaySingleAnimationEnd)
	arg_21_0:AddListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_21_0.OnUpdateCustomOpPositon)
	arg_21_0:AddListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_21_0.OnChatMsgUpdate)
	arg_21_0:AddListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_21_0.OnChatRoomChange)
	arg_21_0:AddListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_21_0.OnShowChatMsg)
	arg_21_0:AddListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_21_0.OnResetFollowRandomizer)
	arg_21_0:AddListener(ISLAND_EVT.ADD_FOLLOWER, arg_21_0.OnFollowerAdd)
	arg_21_0:AddListener(ISLAND_EVT.DEL_FOLLOWER, arg_21_0.OnFollowerDel)
	arg_21_0:AddListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_21_0.OnCoupleActionWithFollower)
	arg_21_0:AddListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_21_0.OnLockPlayerInput)
	arg_21_0:AddListener(ISLAND_EVT.START_COUPLE_ACTION, arg_21_0.OnStartCoupleAction)
	arg_21_0:AddListener(ISLAND_EVT.END_COUPLE_ACTION, arg_21_0.OnEndCoupleAction)
	arg_21_0:AddListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_21_0.OnRefreshWeatherSystem)
	arg_21_0:AddListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_21_0.OnSystemUnlock)
	arg_21_0:AddListener(ISLAND_EVT.START_DO_COUPLE_ACTION, arg_21_0.OnStartDoCoupleAction)
	arg_21_0:AddListener(ISLAND_EVT.END_DO_COUPLE_ACTION, arg_21_0.OnEndDoCoupleAction)
	arg_21_0:AddListener(ISLAND_EVT.CANCEL_COUPLE_ACTION, arg_21_0.OnCancelCoupleAction)
	arg_21_0:AddListener(ISLAND_EVT.BAIT_UPDATE, arg_21_0.OnBaitUpdate)
	arg_21_0:AddListener(ISLAND_EVT.START_FISHING, arg_21_0.OnStartFishing)
	arg_21_0:AddListener(ISLAND_EVT.FISHING_STATE_CHANGE, arg_21_0.OnFishingStateChange)
end

function var_0_0.RemoveListeners(arg_22_0)
	arg_22_0:RemoveListener(ISLAND_EVT.GEN_UNIT, arg_22_0.OnGenUnit)
	arg_22_0:RemoveListener(ISLAND_EVT.RMOVE_UNIT, arg_22_0.OnRemoveUnit)
	arg_22_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_22_0.OnInterActionBegin)
	arg_22_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_22_0.OnInterActionEnd)
	arg_22_0:RemoveListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_22_0.OnStopUnit)
	arg_22_0:RemoveListener(ISLAND_EVT.MOVE_UNIT, arg_22_0.OnMoveUnit)
	arg_22_0:RemoveListener(ISLAND_EVT.INIT_FINISH, arg_22_0.OnSceneInited)
	arg_22_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER, arg_22_0.OnPlayerMove)
	arg_22_0:RemoveListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_22_0.OnPlayerStopMoveHandle)
	arg_22_0:RemoveListener(ISLAND_EVT.JUMP_PLAYER, arg_22_0.OnPlayerJump)
	arg_22_0:RemoveListener(ISLAND_EVT.APPROACH_UNIT, arg_22_0.OnShowInterActionPanel)
	arg_22_0:RemoveListener(ISLAND_EVT.LEAVE_UNIT, arg_22_0.OnHideInterActionPanel)
	arg_22_0:RemoveListener(ISLAND_EVT.TRACKING, arg_22_0.OnTracking)
	arg_22_0:RemoveListener(ISLAND_EVT.UNTRACKING, arg_22_0.OnUnTracking)
	arg_22_0:RemoveListener(ISLAND_EVT.AREACHANGE, arg_22_0.OnPlayerAreaChange)
	arg_22_0:RemoveListener(ISLAND_EVT.PLAYERRUN, arg_22_0.OnPlayerPlayerRun)
	arg_22_0:RemoveListener(ISLAND_EVT.SPRINT_PLAYER, arg_22_0.OnPlayerPlayerSprint)
	arg_22_0:RemoveListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_22_0.OnStopPlayerSprint)
	arg_22_0:RemoveListener(ISLAND_EVT.CHANGE_DRESS, arg_22_0.OnChangeDress)
	arg_22_0:RemoveListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_22_0.OnCharacterChangeDress)
	arg_22_0:RemoveListener(ISLAND_EVT.RESET_UNIT_POS, arg_22_0.OnResetUnitPos)
	arg_22_0:RemoveListener(ISLAND_EVT.RESET_UNIT_ROT, arg_22_0.OnResetUnitRotation)
	arg_22_0:RemoveListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_22_0.OnAnyPageOpen)
	arg_22_0:RemoveListener(ISLAND_EVT.Change_TakePhoto_Model, arg_22_0.OnChangeTakePhotoModel)
	arg_22_0:RemoveListener(ISLAND_EVT.Change_Photo_Height, arg_22_0.OnChange_Photo_Height)
	arg_22_0:RemoveListener(ISLAND_EVT.SetOpMoveBtnActve, arg_22_0.OnSetOpMoveBtnActve)
	arg_22_0:RemoveListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_22_0.OnAllPageClose)
	arg_22_0:RemoveListener(ISLAND_EVT.PLAY_BUBBLE, arg_22_0.OnPlayChatBubble)
	arg_22_0:RemoveListener(ISLAND_EVT.RAW_PLAY_BUBBLE, arg_22_0.OnRawPlayChatBubble)
	arg_22_0:RemoveListener(ISLAND_EVT.RAW_STOP_BUBBLE, arg_22_0.OnRawStopChatBubble)
	arg_22_0:RemoveListener(ISLAND_EVT.START_STORY, arg_22_0.OnStartStory)
	arg_22_0:RemoveListener(ISLAND_EVT.END_STORY, arg_22_0.OnEndStory)
	arg_22_0:RemoveListener(ISLAND_EVT.START_DEGATION, arg_22_0.OnStartDelegation)
	arg_22_0:RemoveListener(ISLAND_EVT.END_DEGATION, arg_22_0.OnEndDelegation)
	arg_22_0:RemoveListener(ISLAND_EVT.GEN_SYSTEM, arg_22_0.OnGenSystem)
	arg_22_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_22_0.OnWorldObjectStartInteraction)
	arg_22_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_22_0.OnWorldObjectEndInteraction)
	arg_22_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_22_0.OnWorldObjectInitStatus)
	arg_22_0:RemoveListener(ISLAND_EVT.INIT_INTERACTION_OP_VIEW, arg_22_0.InitInteractionOpView)
	arg_22_0:RemoveListener(ISLAND_EVT.REFRESH_INTERACTION, arg_22_0.OnRefreshInteractionBtn)
	arg_22_0:RemoveListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_22_0.OnShowUnitHudAndOpBtn)
	arg_22_0:RemoveListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_22_0.OnHideUnitHudAndOpBtn)
	arg_22_0:RemoveListener(ISLAND_EVT.DETECTOR_CHANGED, arg_22_0.OnDetectorChanged)
	arg_22_0:RemoveListener(ISLAND_EVT.SELECTED_DETECTOR, arg_22_0.OnDetectorSelected)
	arg_22_0:RemoveListener(ISLAND_EVT.FISHPOINT_DETECTOR, arg_22_0.OnFishPointSelected)
	arg_22_0:RemoveListener(ISLAND_EVT.NPC_DETECTED, arg_22_0.OnNpcDetectorSelected)
	arg_22_0:RemoveListener(ISLAND_EVT.NO_NPC_DETECTED, arg_22_0.OnNpcDetectorUnSelected)
	arg_22_0:RemoveListener(ISLAND_EVT.SET_PLAYER_WORK, arg_22_0.OnPlayerWork)
	arg_22_0:RemoveListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_22_0.OnPlayerDeviceStateChange)
	arg_22_0:RemoveListener(ISLAND_EVT.UPDATE_HUD, arg_22_0.OnUpdateHud)
	arg_22_0:RemoveListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_22_0.OnUpdateHandCollectUnit)
	arg_22_0:RemoveListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_22_0.OnRecycleAllSlotEffct)
	arg_22_0:RemoveListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_22_0.OnSelectSlotEffectShow)
	arg_22_0:RemoveListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_22_0.OnLoadDelegatePreviewRole)
	arg_22_0:RemoveListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_22_0.OnUnLoadDelegatePreviewRole)
	arg_22_0:RemoveListener(ISLAND_EVT.Take_Plant_Attact, arg_22_0.OnTakePlantAttack)
	arg_22_0:RemoveListener(ISLAND_EVT.START_MANAGE, arg_22_0.OnStartManage)
	arg_22_0:RemoveListener(ISLAND_EVT.END_MANAGE, arg_22_0.OnEndManage)
	arg_22_0:RemoveListener(ISLAND_EVT.SHOW_HUD, arg_22_0.OnShowHud)
	arg_22_0:RemoveListener(ISLAND_EVT.HIDE_HUD, arg_22_0.OnHideHud)
	arg_22_0:RemoveListener(ISLAND_EVT.REFRESH_HUD, arg_22_0.OnRefreshHud)
	arg_22_0:RemoveListener(ISLAND_EVT.START_GUIDE, arg_22_0.OnStartGuide)
	arg_22_0:RemoveListener(ISLAND_EVT.END_GUIDE, arg_22_0.OnEndGuide)
	arg_22_0:RemoveListener(ISLAND_EVT.START_PERFORMANCE, arg_22_0.OnStartPerformance)
	arg_22_0:RemoveListener(ISLAND_EVT.END_PERFORMANCE, arg_22_0.OnEndPerformance)
	arg_22_0:RemoveListener(ISLAND_EVT.DISABLE_INPUT, arg_22_0.DisableInput)
	arg_22_0:RemoveListener(ISLAND_EVT.ENABLE_INPUT, arg_22_0.EnableInput)
	arg_22_0:RemoveListener(ISLAND_EVT.GEN_PATH_FINDER, arg_22_0.OnGenPathFinder)
	arg_22_0:RemoveListener(ISLAND_EVT.REMOVE_PATH_FINDER, arg_22_0.OnRemovePathFinder)
	arg_22_0:RemoveListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_22_0.OnActiveOrDisactiveUnit)
	arg_22_0:RemoveListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_22_0.OnOpenAniamtionOpPage)
	arg_22_0:RemoveListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_22_0.OnCloseAniamtionOpPage)
	arg_22_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_22_0.OnMovePlayerBefore)
	arg_22_0:RemoveListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_22_0.OnRefreshTaskInfoHud)
	arg_22_0:RemoveListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_22_0.OnResponAniamtionOp)
	arg_22_0:RemoveListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_22_0.OnChangeVisterDress)
	arg_22_0:RemoveListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_22_0.OnSetVisitorSyncData)
	arg_22_0:RemoveListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_22_0.OnShowNpcAniamtionBubble)
	arg_22_0:RemoveListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_22_0.OnHideNpcAniamtionBubble)
	arg_22_0:RemoveListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_22_0.OnPlaySingleAnimationEnd)
	arg_22_0:RemoveListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_22_0.OnUpdateCustomOpPositon)
	arg_22_0:RemoveListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_22_0.OnChatMsgUpdate)
	arg_22_0:RemoveListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_22_0.OnChatRoomChange)
	arg_22_0:RemoveListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_22_0.OnShowChatMsg)
	arg_22_0:RemoveListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_22_0.OnResetFollowRandomizer)
	arg_22_0:RemoveListener(ISLAND_EVT.ADD_FOLLOWER, arg_22_0.OnFollowerAdd)
	arg_22_0:RemoveListener(ISLAND_EVT.DEL_FOLLOWER, arg_22_0.OnFollowerDel)
	arg_22_0:RemoveListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_22_0.OnCoupleActionWithFollower)
	arg_22_0:RemoveListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_22_0.OnLockPlayerInput)
	arg_22_0:RemoveListener(ISLAND_EVT.START_COUPLE_ACTION, arg_22_0.OnStartCoupleAction)
	arg_22_0:RemoveListener(ISLAND_EVT.END_COUPLE_ACTION, arg_22_0.OnEndCoupleAction)
	arg_22_0:RemoveListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_22_0.OnRefreshWeatherSystem)
	arg_22_0:RemoveListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_22_0.OnSystemUnlock)
	arg_22_0:RemoveListener(ISLAND_EVT.START_DO_COUPLE_ACTION, arg_22_0.OnStartDoCoupleAction)
	arg_22_0:RemoveListener(ISLAND_EVT.END_DO_COUPLE_ACTION, arg_22_0.OnEndDoCoupleAction)
	arg_22_0:RemoveListener(ISLAND_EVT.CANCEL_COUPLE_ACTION, arg_22_0.OnCancelCoupleAction)
	arg_22_0:RemoveListener(ISLAND_EVT.BAIT_UPDATE, arg_22_0.OnBaitUpdate)
	arg_22_0:RemoveListener(ISLAND_EVT.START_FISHING, arg_22_0.OnStartFishing)
	arg_22_0:RemoveListener(ISLAND_EVT.FISHING_STATE_CHANGE, arg_22_0.OnFishingStateChange)
end

function var_0_0.OnBaitUpdate(arg_23_0, arg_23_1)
	arg_23_0:GetSubView(IslandOpView):UpdateLureBtn()
end

function var_0_0.OnFishPointSelected(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1.node

	if not var_24_0 then
		return
	end

	local var_24_1 = var_24_0:GetBlackboardVariable("FishPoint")

	if not var_24_1 or var_24_1 == "" then
		arg_24_0:UnSelectedFishPoint()
	else
		local var_24_2, var_24_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_24_1)
		local var_24_4 = arg_24_0:GetUnitModuleWithType(var_24_2, var_24_3)

		if var_24_4 then
			arg_24_0:SelectedFishPoint(var_24_4)
		end
	end
end

function var_0_0.SelectedFishPoint(arg_25_0, arg_25_1)
	if not arg_25_0:GetSelfIsland():GetAblityAgency():IsUnlockFishing() or arg_25_1:GetUnitType() ~= IslandConst.UNIT_LIST_FISH_POINT or arg_25_0.player:StandOnWorldObject() or not arg_25_0.player:OnGrouded() then
		return
	end

	arg_25_0:UnSelectedFishPoint()

	arg_25_0.selectedFishPointId = arg_25_1.id

	arg_25_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.Fishing, arg_25_1.id)
end

function var_0_0.UnSelectedFishPoint(arg_26_0)
	if arg_26_0.selectedFishPointId then
		local var_26_0 = arg_26_0.selectedFishPointId

		arg_26_0.selectedFishPointId = nil

		arg_26_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, var_26_0)
	end
end

function var_0_0.OnStartFishing(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1.unitId
	local var_27_1 = arg_27_0:GetPlayerUnitModule(var_27_0)

	if not var_27_1 then
		return
	end

	if not isa(var_27_1, IslandVisitorUnit) then
		return
	end

	var_27_1:Sleep()

	local var_27_2 = arg_27_1.fishPointId
	local var_27_3 = arg_27_1.rodId
	local var_27_4 = arg_27_1.fishId
	local var_27_5 = pg.island_fish_rod[var_27_3].attachment_id
	local var_27_6 = IslandVistorFishingPlayer.New(arg_27_0, var_27_1, var_27_2, var_27_5, var_27_4)

	var_27_6:Play()

	arg_27_0.fishingSynPlayers[var_27_0] = var_27_6
end

function var_0_0.OnFishingStateChange(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.op
	local var_28_1 = arg_28_1.unitId
	local var_28_2 = arg_28_0:GetPlayerUnitModule(var_28_1)
	local var_28_3 = arg_28_0.fishingSynPlayers[var_28_1]

	if not isa(var_28_2, IslandVisitorUnit) then
		return
	end

	if not var_28_3 or not var_28_3:IsSameFishPoint(arg_28_1.fishPointId) then
		return
	end

	local function var_28_4()
		var_28_2:WakeUp()
		arg_28_0.fishingSynPlayers[var_28_1]:Dispose()

		arg_28_0.fishingSynPlayers[var_28_1] = nil
	end

	if var_28_0 == IslandConst.FISHING_OP_CANCEL then
		var_28_3:OnCancel(var_28_4)
	elseif var_28_0 == IslandConst.FISHING_OP_FAILD then
		var_28_3:OnFailed(var_28_4)
	elseif var_28_0 == IslandConst.FISHING_OP_SUCCESS then
		var_28_3:OnSuccess(var_28_4)
	end
end

function var_0_0.OnStartCoupleAction(arg_30_0)
	arg_30_0:UnBlockLayer1Event(false)
	arg_30_0:GetSubView(IslandAniamtionOpView):OnStartCoupleAction()
end

function var_0_0.OnEndCoupleAction(arg_31_0)
	arg_31_0:UnBlockLayer1Event(true)
	arg_31_0:GetSubView(IslandAniamtionOpView):OnEndCoupleAction()
end

function var_0_0.OnCancelCoupleAction(arg_32_0)
	if arg_32_0.coupleActionPlayer and arg_32_0.coupleActionPlayer:IsPlaying() then
		arg_32_0.coupleActionPlayer:Stop()
	end

	if arg_32_0.coupleAction4FollowerPlayer and arg_32_0.coupleAction4FollowerPlayer:IsPlaying() then
		arg_32_0.coupleAction4FollowerPlayer:Stop()
	end

	arg_32_0:OnEndCoupleAction()
end

function var_0_0.OnCoupleActionWithFollower(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_33_1 = arg_33_0:GetPlayerPosition()
	local var_33_2 = pg.island_set.action_bubble_range.key_value_int
	local var_33_3 = _.select(var_33_0, function(arg_34_0)
		return Vector3.Distance(arg_34_0:GetPosition(), var_33_1) <= var_33_2
	end)

	if #var_33_3 <= 0 then
		return
	end

	local var_33_4 = var_33_3[math.random(1, #var_33_3)]
	local var_33_5 = pg.island_action[arg_33_1]

	arg_33_0.coupleAction4FollowerPlayer:Play(var_33_4, arg_33_0.player, var_33_5)
	arg_33_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
end

function var_0_0.OnPlaySingleAnimationEnd(arg_35_0, arg_35_1)
	if not arg_35_0:GetSelectedNpcId() then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_35_1, 0, 0, 0, 0))

		return
	end

	local var_35_0 = arg_35_0:GetSelectedNpcId()
	local var_35_1, var_35_2 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_35_0)
	local var_35_3 = arg_35_0:GetUnitModuleWithType(var_35_1, var_35_2)

	arg_35_0.npcActionPlayer:Play(var_35_3, arg_35_0.player, arg_35_1)
end

function var_0_0.OnShowNpcAniamtionBubble(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0:GetStrollUnitModule(arg_36_1.id)

	if not var_36_0 then
		return
	end

	local var_36_1 = arg_36_1:GetActionFeedback()

	arg_36_0:GetSubView(IslandBottomHeadHudView):ShowAnimationOp(var_36_0, var_36_1)
end

function var_0_0.OnHideNpcAniamtionBubble(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:GetStrollUnitModule(arg_37_1.id)

	arg_37_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_37_0)
end

function var_0_0.OnStartDoCoupleAction(arg_38_0)
	arg_38_0:GetSubView(IslandCancelAnimationOpView):ShowCancelableAnimationOp(arg_38_0.player)
end

function var_0_0.OnEndDoCoupleAction(arg_39_0)
	arg_39_0:GetSubView(IslandCancelAnimationOpView):HideCancelableAnimationOp(arg_39_0.player)
end

function var_0_0.OnResponAniamtionOp(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1.id
	local var_40_1 = arg_40_1.targetId
	local var_40_2 = arg_40_1.actionId
	local var_40_3 = arg_40_0:GetPlayerUnitModule(var_40_0)

	if not var_40_3 then
		return
	end

	if var_40_2 == 0 then
		if not arg_40_0:IsPlayer(var_40_0) then
			arg_40_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_40_3)
		else
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_40_2, 1, 0, 0, 0))
		end

		return
	end

	local var_40_4 = pg.island_action[var_40_2]

	if var_40_1 == 0 and var_40_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_40_0:IsPlayer(var_40_0) then
		arg_40_0:GetSubView(IslandTopHeadHudView):ShowAnimationOp(var_40_3, var_40_2)
	elseif var_40_1 > 0 and var_40_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_40_0:IsPlayer(var_40_1) then
		local var_40_5 = arg_40_0:GetPlayerUnitModule(var_40_1)

		arg_40_0.coupleActionPlayer:Play(var_40_3, var_40_5, var_40_4)
		arg_40_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_40_5)
	elseif var_40_1 > 0 and var_40_4.type == IslandConst.ANIMATION_OP_DOUBLE and arg_40_0:IsPlayer(var_40_1) then
		local var_40_6 = arg_40_0:GetPlayerUnitModule(var_40_1)

		arg_40_0.coupleActionPlayer:Play(var_40_3, var_40_6, var_40_4)
		arg_40_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_40_2, 1, var_40_1, 0, 1))
	end
end

function var_0_0.OnShowChatMsg(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1.player.id
	local var_41_1 = arg_41_0:GetPlayerUnitModule(var_41_0)

	if not var_41_1 then
		return
	end

	arg_41_0:GetSubView(IslandTopHeadHudView):PlayChat(var_41_1, arg_41_1.emojiId, arg_41_1.content, nil)
end

function var_0_0.OnChatRoomChange(arg_42_0)
	arg_42_0:GetSubView(IslandAniamtionOpView):UpdateChatRoom()
end

function var_0_0.OnChatMsgUpdate(arg_43_0)
	arg_43_0:GetSubView(IslandAniamtionOpView):UpdateMsgList()
end

function var_0_0.OnFollowerAdd(arg_44_0, arg_44_1)
	arg_44_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_44_0.coupleNpcWordPlayer:Play(arg_44_1)
end

function var_0_0.OnFollowerDel(arg_45_0, arg_45_1)
	arg_45_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_45_0.coupleNpcWordPlayer:Stop(arg_45_1)
end

function var_0_0.OnResetFollowRandomizer(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0:GetFollowerModule(arg_46_1)

	if not var_46_0 then
		return
	end

	var_46_0:SetBtRandomizer()
end

function var_0_0.OnGenPathFinder(arg_47_0, arg_47_1)
	local var_47_0 = IslandPathFinder.New(arg_47_0)
	local var_47_1 = defaultValue(arg_47_1.navData.waitUntilDone, false)

	var_47_0:Start(arg_47_1.navData, function()
		table.removebyvalue(arg_47_0.pathfinders, var_47_0)
		var_47_0:Dispose()

		if arg_47_1.onEndAction then
			arg_47_1.onEndAction()
		end

		arg_47_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH_DONE, arg_47_1.navData.index)

		if var_47_1 and arg_47_1.callback then
			arg_47_1.callback()
		end
	end)
	arg_47_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH, arg_47_1.navData.index)

	if not var_47_1 and arg_47_1.callback then
		arg_47_1.callback()
	end

	table.insert(arg_47_0.pathfinders, var_47_0)
end

function var_0_0.OnRemovePathFinder(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_0:GetUnitModuleWithType(arg_49_1.unitType, arg_49_1.unitId)
	local var_49_1 = _.detect(arg_49_0.pathfinders, function(arg_50_0)
		return arg_50_0:IsSameUnit(var_49_0)
	end)

	if not var_49_1 then
		return
	end

	var_49_1:Stop()
	var_49_1:Dispose()
	table.removebyvalue(arg_49_0.pathfinders, var_49_1)
end

function var_0_0.OnTracking(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.trackType

	if var_51_0 == IslandTaskTrackCard.TYPES.MAIN then
		arg_51_0.mainTrackId = tonumber(arg_51_1.id)
		arg_51_0.needTryMainTrack = true
	elseif var_51_0 == IslandTaskTrackCard.TYPES.OTHER then
		arg_51_0.trackId = tonumber(arg_51_1.id)
		arg_51_0.trackType = arg_51_1.typ or IslandTaskType.MAIN
		arg_51_0.needTryTrack = true
	end
end

function var_0_0.TryTrack(arg_52_0)
	arg_52_0:TrySetTrack(arg_52_0.trackId)
end

function var_0_0.TrySetTrack(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0:GetOptTrackingTarget(arg_53_1)

	if not var_53_0 or not var_53_0._go then
		return
	end

	arg_53_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_53_0.player, var_53_0, arg_53_1, arg_53_0.trackType, IslandTaskTrackCard.TYPES.OTHER)

	arg_53_0.needTryTrack = false
end

function var_0_0.TryMainTrack(arg_54_0)
	arg_54_0:TrySetMainTrack(arg_54_0.mainTrackId)
end

function var_0_0.TrySetMainTrack(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_0:GetOptTrackingTarget(arg_55_1)

	if not var_55_0 or not var_55_0._go then
		return
	end

	arg_55_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_55_0.player, var_55_0, arg_55_1, IslandTaskType.MAIN, IslandTaskTrackCard.TYPES.MAIN)

	arg_55_0.needTryMainTrack = false
end

function var_0_0.OnUnTracking(arg_56_0, arg_56_1)
	if arg_56_1 == IslandTaskTrackCard.TYPES.MAIN then
		arg_56_0.mainTrackId = nil
	elseif arg_56_1 == IslandTaskTrackCard.TYPES.OTHER then
		arg_56_0.trackId = nil
	end

	arg_56_0:GetSubView(IslandDistanceView):CancelTracking(arg_56_1)
end

local function var_0_1(arg_57_0, arg_57_1)
	local var_57_0 = pg.island_world_objects[arg_57_0]

	if not var_57_0 then
		return
	end

	return var_57_0.mapId == arg_57_1
end

local function var_0_2(arg_58_0, arg_58_1, arg_58_2)
	for iter_58_0, iter_58_1 in ipairs(arg_58_0) do
		for iter_58_2, iter_58_3 in ipairs(iter_58_1[2]) do
			local var_58_0 = pg.island_interaction[iter_58_3]

			if var_58_0.type == arg_58_2 and var_0_1(tonumber(var_58_0.param), arg_58_1) then
				return iter_58_1[1]
			end
		end
	end

	return nil
end

local function var_0_3(arg_59_0)
	local var_59_0 = {}
	local var_59_1 = {}

	for iter_59_0, iter_59_1 in ipairs(arg_59_0) do
		for iter_59_2, iter_59_3 in ipairs(iter_59_1[2]) do
			local var_59_2 = pg.island_interaction[iter_59_3]

			if var_59_2.type == IslandInteractionUntil.TYPE_TRANSFER then
				table.insert(var_59_0, iter_59_1[1])
			elseif var_59_2.type == IslandInteractionUntil.TYPE_SP_TRANSFER then
				table.insert(var_59_1, iter_59_1[1])
			end
		end
	end

	if #var_59_1 > 0 then
		return var_59_1[1]
	end

	if #var_59_0 > 0 then
		return var_59_0[1]
	end

	return nil
end

function var_0_0.GetOptTrackingTarget(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0:GetUnitModule(arg_60_1)

	if var_60_0 then
		return var_60_0
	end

	local var_60_1 = pg.island_world_objects[arg_60_1]

	if not var_60_1 then
		return nil
	end

	local var_60_2 = {}

	for iter_60_0, iter_60_1 in ipairs(arg_60_0:GetUnitListByKey(IslandConst.UNIT_LIST_OBJ)) do
		local var_60_3, var_60_4 = iter_60_1:IsMapTransfer()

		if var_60_3 then
			table.insert(var_60_2, {
				iter_60_1,
				var_60_4
			})
		end
	end

	local var_60_5
	local var_60_6 = var_0_2(var_60_2, var_60_1.mapId, IslandInteractionUntil.TYPE_TRANSFER) or var_0_2(var_60_2, var_60_1.mapId, IslandInteractionUntil.TYPE_SP_TRANSFER)

	var_60_6 = var_60_6 or var_0_3(var_60_2)

	return var_60_6
end

function var_0_0.OnOpenAniamtionOpPage(arg_61_0)
	arg_61_0:GetSubView(IslandAniamtionOpView):TryEnable()
	arg_61_0:GetSubView(IslandOpView):TryDisable()
	arg_61_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_ANIMATION_OP)
end

function var_0_0.OnCloseAniamtionOpPage(arg_62_0)
	arg_62_0:GetSubView(IslandOpView):TryEnable()
	arg_62_0:NotifiyIsland(ISLAND_EX_EVT.CLOSE_ANIMATION_OP)
end

function var_0_0.OnAnyPageOpen(arg_63_0, arg_63_1)
	arg_63_0.anyPageOpen = true

	arg_63_0.player:StopMoveHandle()
	arg_63_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_63_0:GetSubView(IslandSlotHudView):TryDisable()
	arg_63_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_63_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_63_0:GetSubView(IslandAniamtionOpView):CloseAndReset()
end

function var_0_0.OnAllPageClose(arg_64_0)
	arg_64_0.anyPageOpen = false

	arg_64_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_64_0:GetSubView(IslandSlotHudView):TryEnable()
	arg_64_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_64_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnStartStory(arg_65_0)
	arg_65_0.playingStory = true

	arg_65_0:DisablePlayerOp()
end

function var_0_0.OnEndStory(arg_66_0)
	arg_66_0.playingStory = false

	arg_66_0:EnablePlayerOp()
end

function var_0_0.OnStartPerformance(arg_67_0)
	return
end

function var_0_0.OnEndPerformance(arg_68_0)
	if not arg_68_0.anyPageOpen then
		arg_68_0:GetSubView(IslandOpView):ResetShowBalance()
	end
end

function var_0_0.OnStartGuide(arg_69_0)
	arg_69_0.player:StopMoveHandle()
	arg_69_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.OnEndGuide(arg_70_0)
	if arg_70_0.playingStory then
		return
	end

	arg_70_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.InitFocusCamera(arg_71_0)
	local var_71_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)

	var_71_0.Follow = arg_71_0.player._tf
	var_71_0.LookAt = arg_71_0.player._tf
end

function var_0_0.InitTakePhotoCamera(arg_72_0)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).Follow = arg_72_0.firstTakePhotoItem._tf

	local var_72_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)

	var_72_0.Follow = arg_72_0.thirdTakePhotoItem._tf
	var_72_0.LookAt = arg_72_0.thirdTakePhotoItem._tf
end

function var_0_0.DisablePlayerOp(arg_73_0)
	arg_73_0.player:StopMoveHandle()
	arg_73_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_73_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_73_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_73_0:GetSubView(IslandOpView):TryDisable()
end

function var_0_0.EnablePlayerOp(arg_74_0)
	arg_74_0:GetSubView(IslandOpView):TryEnablePlayerOp()
	arg_74_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_74_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_74_0:GetSubView(IslandOpView):TryEnable()
end

function var_0_0.OnInterActionBegin(arg_75_0)
	arg_75_0.player:StopMoveHandle()
	arg_75_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_76_0)
	arg_76_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_77_0, arg_77_1)
	arg_77_0.showInterObjId = arg_77_1.id

	arg_77_0:GetSubView(IslandInteractionView):ShowInterActionPanel(arg_77_1)
	arg_77_0:Op("NotifiyIsland", ISLAND_EX_EVT.SHOW_INTERACTION, arg_77_0.showInterObjId)
end

function var_0_0.OnHideInterActionPanel(arg_78_0, arg_78_1)
	if arg_78_0.showInterObjId ~= arg_78_1.id then
		return
	end

	arg_78_0.showInterObjId = nil

	arg_78_0:GetSubView(IslandInteractionView):HideInterActionPanel()
end

function var_0_0.OnRefreshInteractionBtn(arg_79_0)
	arg_79_0:GetSubView(IslandInteractionView):RefreshInteractionBtns()
end

function var_0_0.OnSetOpMoveBtnActve(arg_80_0, arg_80_1, arg_80_2)
	arg_80_0:GetSubView(IslandOpView):ShowOrHideMoveBtn(arg_80_1, arg_80_2)
end

function var_0_0.DisableInput(arg_81_0)
	arg_81_0.player:StopMoveHandle()
	arg_81_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.EnableInput(arg_82_0)
	arg_82_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.OnUpdateCustomOpPositon(arg_83_0)
	arg_83_0:GetSubView(IslandOpView):InitOpCustumPositon()
end

function var_0_0.OnChange_Photo_Height(arg_84_0, arg_84_1, arg_84_2)
	arg_84_0.takePhotoModel = arg_84_1

	if arg_84_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		-- block empty
	elseif arg_84_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_84_0.thirdTakePhotoItem:ChangeHeight(arg_84_2)
	end
end

function var_0_0.OnChangeTakePhotoModel(arg_85_0, arg_85_1)
	arg_85_0.takePhotoModel = arg_85_1

	if arg_85_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_85_0.firstTakePhotoItem:Enable()

		arg_85_0.firstTakePhotoItem._tf.position = arg_85_0.player._tf.position
		arg_85_0.firstTakePhotoItem._tf.rotation = arg_85_0.player._tf.rotation

		arg_85_0.firstTakePhotoItem:SetTargetRotation(arg_85_0.player._tf.rotation)
		arg_85_0.player:SetActiveByLayer(false)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook)):SetPosAndRotationByTargetDir(arg_85_0.player._tf.forward)
	elseif arg_85_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_85_0.thirdTakePhotoItem:Enable()

		arg_85_0.player._tf.position = arg_85_0.firstTakePhotoItem._tf.position
		arg_85_0.player._tf.rotation = arg_85_0.firstTakePhotoItem._tf.rotation

		arg_85_0.player:SetTargetRotation(arg_85_0.firstTakePhotoItem._tf.rotation)
		arg_85_0.player:SetActiveByLayer(true)

		arg_85_0.thirdTakePhotoItem._tf.position = arg_85_0.firstTakePhotoItem._tf:TransformPoint(Vector3(0, 0, -5))
		arg_85_0.thirdTakePhotoItem._tf.rotation = arg_85_0.firstTakePhotoItem._tf.rotation

		arg_85_0.thirdTakePhotoItem:SetTargetRotation(arg_85_0.firstTakePhotoItem._tf.rotation)

		local var_85_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook))
		local var_85_1 = arg_85_0.player._tf.position + Vector3(0, 0.5, 0)
		local var_85_2 = arg_85_0.thirdTakePhotoItem._tf.position + Vector3(0, 1, 0)

		var_85_0:SetPosAndRotationByTargetDir((var_85_1 - var_85_2).normalized)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)
	else
		arg_85_0.firstTakePhotoItem:Disable()
		arg_85_0.thirdTakePhotoItem:Disable()

		arg_85_0.player._tf.position = arg_85_0.firstTakePhotoItem._tf.position
		arg_85_0.player._tf.rotation = arg_85_0.firstTakePhotoItem._tf.rotation

		arg_85_0.player:SetTargetRotation(arg_85_0.firstTakePhotoItem._tf.rotation)
		arg_85_0.player:SetActiveByLayer(true)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraLook)):ResetCameraPos()
	end

	arg_85_0:GetSubView(IslandOpView):ChangeTakePhotoModel(arg_85_1)
end

function var_0_0.OnNpcDetectorSelected(arg_86_0, arg_86_1)
	if arg_86_0.selectedNpcId then
		return
	end

	local var_86_0 = arg_86_1.node

	if not var_86_0 then
		return
	end

	local var_86_1 = var_86_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	arg_86_0.selectedNpcId = var_86_1

	arg_86_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_86_1, true)
	arg_86_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_86_1, true)
end

function var_0_0.GetSelectedNpcId(arg_87_0)
	return arg_87_0.selectedNpcId
end

function var_0_0.OnNpcDetectorUnSelected(arg_88_0, arg_88_1)
	local var_88_0 = arg_88_1.node

	if not var_88_0 then
		return
	end

	local var_88_1 = var_88_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	arg_88_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_88_1)
	arg_88_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_88_1)

	if arg_88_0.selectedNpcId ~= var_88_1 then
		return
	end

	arg_88_0.selectedNpcId = nil
end

function var_0_0.OnDetectorChanged(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_1.node

	if not var_89_0 then
		return
	end

	local var_89_1 = var_89_0:GetBlackboardVariable("DetectorList")

	for iter_89_0 = 1, var_89_1.Count do
		local var_89_2 = var_89_1[iter_89_0 - 1]
		local var_89_3, var_89_4 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_89_2)

		if var_89_3 == IslandConst.UNIT_LIST_OBJ then
			local var_89_5 = arg_89_0:GetUnitModuleWithType(var_89_3, var_89_4)

			if var_89_5 then
				arg_89_0:Op("NotifiyIsland", ISLAND_EX_EVT.APPROACH_OBJECT, var_89_5.id)
			end
		end
	end
end

function var_0_0.OnDetectorSelected(arg_90_0, arg_90_1)
	local var_90_0 = arg_90_1.node

	if not var_90_0 then
		return
	end

	local var_90_1 = var_90_0:GetBlackboardVariable("AnyOne")

	if not var_90_1 or var_90_1 == "" then
		arg_90_0:OnClearSelectedUnit()
	else
		local var_90_2, var_90_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_90_1)
		local var_90_4 = arg_90_0:GetUnitModuleWithType(var_90_2, var_90_3)

		if var_90_4 then
			arg_90_0:OnSelectedUnit(var_90_4)
		end
	end
end

function var_0_0.OnClearSelectedUnit(arg_91_0)
	return
end

function var_0_0.OnSelectedUnit(arg_92_0, arg_92_1)
	return
end

function var_0_0.OnPlayChatBubble(arg_93_0, arg_93_1)
	local var_93_0 = arg_93_0:GetAllUnits()

	arg_93_0:GetSubView(IslandTopHeadHudView):PlayBubble(arg_93_1.name, var_93_0, arg_93_1.callback)
end

function var_0_0.OnRawPlayChatBubble(arg_94_0, arg_94_1)
	local var_94_0 = arg_94_0:GetAllUnits()

	arg_94_0:GetSubView(IslandTopHeadHudView):RawPlayBubble(arg_94_1.info, var_94_0, arg_94_1.callback)
end

function var_0_0.OnRawStopChatBubble(arg_95_0, arg_95_1)
	arg_95_0:GetSubView(IslandTopHeadHudView):RawStopBubble(arg_95_1.info)
end

function var_0_0.OnChangeVisterDress(arg_96_0, arg_96_1)
	local var_96_0 = arg_96_1.id

	if arg_96_0:IsPlayer(var_96_0) then
		return
	end

	local var_96_1 = arg_96_0:GetPlayerUnitModule(var_96_0)

	if var_96_1 then
		var_96_1:OnChangeDress(arg_96_1.changeDressData)
	end
end

function var_0_0.OnSystemUnlock(arg_97_0, arg_97_1)
	if arg_97_1 == IslandAblityAgency.ANIMATION_OP_ID then
		arg_97_0:GetSubView(IslandOpView):UpdateAnimationOpBtn()
	end
end

function var_0_0.OnSceneInited(arg_98_0, arg_98_1)
	IslandCameraMgr.instance:LookAt(arg_98_0.player._tf)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraZoom)):SetMaxMinZoom(arg_98_1.min, arg_98_1.max, arg_98_1.value)
	arg_98_0:InitFocusCamera()
	arg_98_0:InitTakePhotoCamera()
	arg_98_0:GetSubView(IslandOpView):LaterInit()
end

function var_0_0.OnGenUnit(arg_99_0, arg_99_1, arg_99_2)
	local var_99_0 = arg_99_0.unitBuilders[arg_99_1:GetType()]:Build(arg_99_1, arg_99_2)

	arg_99_0:AddUnit(var_99_0)

	if arg_99_1:IsPlayer() then
		arg_99_0.player = var_99_0
	end

	if arg_99_1:IsFirstTakePhoto() then
		arg_99_0.firstTakePhotoItem = var_99_0
	end

	if arg_99_1:IsThirdTakePhoto() then
		arg_99_0.thirdTakePhotoItem = var_99_0
	end
end

function var_0_0.OnGenSystem(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_0.systemBuilders[arg_100_1:GetType()]:Build(arg_100_1)

	arg_100_0:AddUnit(var_100_0)
end

function var_0_0.IsPlayer(arg_101_0, arg_101_1)
	return arg_101_0.player.id == arg_101_1
end

function var_0_0.OnActiveOrDisactiveUnit(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
	local var_102_0

	if arg_102_1 == 0 then
		var_102_0 = arg_102_0.player
	else
		var_102_0 = arg_102_0:GetUnitModuleWithType(arg_102_2, arg_102_1)
	end

	if var_102_0 and arg_102_3 then
		var_102_0:Enable()
	end

	if var_102_0 and not arg_102_3 then
		var_102_0:Disable()
	end
end

function var_0_0.OnResetUnitPos(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	local var_103_0 = arg_103_0:GetUnitModuleWithType(arg_103_2, arg_103_1)

	if var_103_0 then
		var_103_0._go.transform.position = arg_103_3
	end
end

function var_0_0.OnResetUnitRotation(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	local var_104_0 = arg_104_0:GetUnitModuleWithType(arg_104_2, arg_104_1)

	if var_104_0 then
		var_104_0._go.transform.eulerAngles = arg_104_3
	end
end

function var_0_0.OnMoveUnit(arg_105_0, arg_105_1)
	assert(arg_105_1.type, "type should be exist")

	local var_105_0 = arg_105_0:GetUnitModuleWithType(arg_105_1.type, arg_105_1.id)

	if var_105_0 then
		var_105_0:SetDestination(arg_105_1.position, arg_105_1.speed, nil, arg_105_1.charaRadius)
	end
end

function var_0_0.OnStopUnit(arg_106_0, arg_106_1)
	assert(arg_106_1.type, "type should be exist")

	local var_106_0 = arg_106_0:GetUnitModuleWithType(arg_106_1.type, arg_106_1.id)

	if var_106_0 then
		var_106_0:StopMove()
	end
end

function var_0_0.OnRemoveUnit(arg_107_0, arg_107_1, arg_107_2)
	local var_107_0 = arg_107_0:GetUnitListByKey(arg_107_1)
	local var_107_1 = 0

	for iter_107_0, iter_107_1 in ipairs(var_107_0 or {}) do
		if iter_107_1.id == arg_107_2 then
			var_107_1 = iter_107_0

			break
		end
	end

	if var_107_1 > 0 then
		local var_107_2 = var_107_0[var_107_1]

		for iter_107_2 = #arg_107_0.pathfinders, 1, -1 do
			local var_107_3 = arg_107_0.pathfinders[iter_107_2]

			if var_107_3:IsSameUnit(var_107_2) then
				var_107_3:Dispose()
				table.remove(arg_107_0.pathfinders, iter_107_2)
			end
		end

		arg_107_0:RemoveUnit(var_107_2)
		var_107_2:Dispose()
		arg_107_0:OnHideUnitHudAndOpBtn({
			type = arg_107_1,
			id = var_107_2.id
		}, true)
		arg_107_0:GetSubView(IslandTopHeadHudView):HideHud({
			type = arg_107_1,
			id = arg_107_2
		})
		arg_107_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_107_2)
		arg_107_0:GetSubView(IslandInteractionView):CloseInterActionPanelByUnitIdRemove(arg_107_2)
	end
end

function var_0_0.GetAllUnits(arg_108_0)
	table.clear(arg_108_0._unitList)

	for iter_108_0, iter_108_1 in pairs(arg_108_0:GetUnitListRegitser()) do
		for iter_108_2, iter_108_3 in pairs(iter_108_1) do
			table.insert(arg_108_0._unitList, iter_108_3)
		end
	end

	return arg_108_0._unitList
end

function var_0_0.GetUnitModuleWithType(arg_109_0, arg_109_1, arg_109_2)
	if arg_109_1 == IslandConst.UNIT_LIST_PLAYER and arg_109_2 == 0 then
		return arg_109_0.player
	end

	local var_109_0 = arg_109_0:GetUnitListByKey(arg_109_1)

	for iter_109_0, iter_109_1 in ipairs(var_109_0) do
		if iter_109_1.id == arg_109_2 then
			return iter_109_1
		end
	end

	return nil
end

function var_0_0.GetPlayerUnitModule(arg_110_0, arg_110_1)
	return arg_110_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_110_1)
end

function var_0_0.GetUnitModule(arg_111_0, arg_111_1)
	return arg_111_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_111_1)
end

function var_0_0.GetSystemModule(arg_112_0, arg_112_1)
	return arg_112_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_SYSTEM, arg_112_1)
end

function var_0_0.GetProductSystemModule(arg_113_0, arg_113_1)
	return arg_113_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PRODUCT_SYSTEM, arg_113_1)
end

function var_0_0.GetSystemUnitModule(arg_114_0, arg_114_1)
	return arg_114_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_114_1)
end

function var_0_0.GetStrollUnitModule(arg_115_0, arg_115_1)
	return arg_115_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_STROLL, arg_115_1)
end

function var_0_0.GetManageSystemModule(arg_116_0, arg_116_1)
	return arg_116_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_MANAGE_SYSTEM, arg_116_1)
end

function var_0_0.GetFollowerModule(arg_117_0, arg_117_1)
	return arg_117_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_FOLLOW, arg_117_1)
end

function var_0_0.OnMovePlayerBefore(arg_118_0)
	if arg_118_0.player:CheckMovement() and arg_118_0.isLockPlayInput then
		arg_118_0.isLockPlayInput = false
	end

	arg_118_0:GetSubView(IslandAniamtionOpView):OnMovePlayerBefore()
end

function var_0_0.OnLockPlayerInput(arg_119_0)
	if arg_119_0.playerInputing then
		arg_119_0.isLockPlayInput = true

		arg_119_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerMove(arg_120_0, arg_120_1)
	if arg_120_0.isLockPlayInput then
		return
	end

	arg_120_0.playerInputing = true

	if arg_120_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_120_0.firstTakePhotoItem:MoveHandle(arg_120_1.targetDir, arg_120_1.force)
	elseif arg_120_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_120_0.thirdTakePhotoItem:MoveHandle(arg_120_1.targetDir, arg_120_1.force)
	else
		arg_120_0.player:MoveHandle(arg_120_1.targetDir, arg_120_1.force)
	end
end

function var_0_0.OnPlayerStopMove(arg_121_0)
	if arg_121_0.isLockPlayInput then
		arg_121_0.isLockPlayInput = false
	end

	arg_121_0.playerInputing = true

	if arg_121_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_121_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_121_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_121_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_121_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerStopMoveHandle(arg_122_0)
	if arg_122_0.isLockPlayInput then
		arg_122_0.isLockPlayInput = false
	end

	arg_122_0.playerInputing = true

	if arg_122_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_122_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_122_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_122_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_122_0.player:StopMoveHandleByInput()
	end
end

function var_0_0.OnPlayerJump(arg_123_0)
	if arg_123_0.takePhotoModel == IslandConst.TakePhotoModel.First or arg_123_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		return
	end

	arg_123_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_124_0)
	arg_124_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_125_0)
	if arg_125_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_125_0.firstTakePhotoItem:OnPlayerPlayerSprint()
	elseif arg_125_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		-- block empty
	else
		arg_125_0.player:OnPlayerPlayerSprint()
	end
end

function var_0_0.OnStopPlayerSprint(arg_126_0)
	if arg_126_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_126_0.firstTakePhotoItem:OnStopPlayerSprint()
	elseif arg_126_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_126_0.thirdTakePhotoItem:OnStopPlayerSprint()
	else
		arg_126_0.player:OnStopPlayerSprint()
	end
end

function var_0_0.OnPlayerWork(arg_127_0, arg_127_1, arg_127_2)
	arg_127_0.player:WorkHandle(arg_127_1, arg_127_2)
end

function var_0_0.OnPlayerDeviceStateChange(arg_128_0, arg_128_1)
	arg_128_0.player:DeviceStateHandle(arg_128_1)
end

function var_0_0.OnSetVisitorSyncData(arg_129_0, arg_129_1, arg_129_2)
	local var_129_0 = arg_129_0:GetPlayerUnitModule(arg_129_1)

	if var_129_0 then
		var_129_0:UpdateSyncData(arg_129_2)
	end
end

function var_0_0.OnWorldObjectStartInteraction(arg_130_0, arg_130_1, arg_130_2, arg_130_3)
	local var_130_0 = arg_130_2:GetHostId()
	local var_130_1 = arg_130_2:GetUserId()
	local var_130_2 = arg_130_0:GetUnitModule(var_130_0)
	local var_130_3 = arg_130_0:GetPlayerUnitModule(var_130_1)
	local var_130_4 = arg_130_0.player == var_130_3

	if var_130_4 then
		arg_130_0:GetSubView(IslandOpView):StartInteraction()
	end

	local var_130_5 = arg_130_1:GetTimeline()[arg_130_3]
	local var_130_6 = arg_130_1:GetBlackboardParam()[arg_130_3]

	var_130_2:StartInteract(var_130_3, arg_130_2.id, arg_130_3, var_130_5, var_130_6, arg_130_1:AnySlotUsing(), var_130_4)
end

function var_0_0.OnWorldObjectEndInteraction(arg_131_0, arg_131_1, arg_131_2)
	local var_131_0 = arg_131_2:GetHostId()
	local var_131_1 = arg_131_2:GetUserId()
	local var_131_2 = arg_131_0:GetUnitModule(var_131_0)
	local var_131_3 = arg_131_0:GetPlayerUnitModule(var_131_1)
	local var_131_4 = arg_131_0.player == var_131_3

	if var_131_4 then
		arg_131_0:GetSubView(IslandOpView):EndInteraction()
	end

	var_131_2:EndInteract(var_131_3, arg_131_2.id, not arg_131_1:AnySlotUsing(), var_131_4)
end

function var_0_0.OnWorldObjectInitStatus(arg_132_0, arg_132_1, arg_132_2)
	local var_132_0 = arg_132_0:GetUnitModule(arg_132_1.id)
	local var_132_1 = arg_132_1:GetTimeline()[arg_132_2]
	local var_132_2 = arg_132_1:GetBlackboardParam()[arg_132_2]

	var_132_0:InitStatus(arg_132_2, var_132_1, var_132_2)
end

function var_0_0.InitInteractionOpView(arg_133_0)
	arg_133_0:GetSubView(IslandOpView):EndInteraction()
end

function var_0_0.OnPlayerAreaChange(arg_134_0)
	arg_134_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnChangeDress(arg_135_0, arg_135_1, arg_135_2)
	arg_135_0.player:OnChangeDress(arg_135_1, arg_135_2)
end

function var_0_0.OnCharacterChangeDress(arg_136_0, arg_136_1, arg_136_2, arg_136_3, arg_136_4)
	local var_136_0 = arg_136_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_136_1)

	if var_136_0 then
		var_136_0:OnCharacterChangeDress(arg_136_2, arg_136_3, arg_136_4)
	end

	local var_136_1 = arg_136_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)

	for iter_136_0, iter_136_1 in ipairs(var_136_1) do
		if iter_136_1:GetDataVO():IsSameShip(arg_136_1) then
			iter_136_1:OnCharacterChangeDress(arg_136_2, arg_136_3, arg_136_4)
		end
	end

	local var_136_2 = arg_136_0:GetUnitListByKey(IslandConst.UNIT_LIST_STROLL)

	for iter_136_2, iter_136_3 in ipairs(var_136_2) do
		if iter_136_3:GetDataVO():IsSameShip(arg_136_1) then
			iter_136_3:OnCharacterChangeDress(arg_136_2, arg_136_3, arg_136_4)
		end
	end
end

function var_0_0.OnStartDelegation(arg_137_0, arg_137_1, arg_137_2)
	local var_137_0 = arg_137_0:GetSystemModule(arg_137_1.build_id)

	if var_137_0 then
		var_137_0:StartDelegation(arg_137_1)
	end

	local var_137_1 = arg_137_0:GetProductSystemModule(arg_137_1.build_id)

	if var_137_1 then
		var_137_1:StartDelegation(arg_137_2)
	end
end

function var_0_0.OnEndDelegation(arg_138_0, arg_138_1, arg_138_2)
	local var_138_0 = arg_138_0:GetSystemModule(arg_138_1.build_id)

	if var_138_0 then
		var_138_0:EndDelegation(arg_138_1)
	end
end

function var_0_0.GetPlayerPosition(arg_139_0)
	return arg_139_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_140_0, arg_140_1)
	local var_140_0 = arg_140_0:GetUnitModule(arg_140_1)

	return var_140_0 and var_140_0._go.transform.position
end

function var_0_0.OnShowUnitHudAndOpBtn(arg_141_0, arg_141_1)
	arg_141_0.currentHudUnitData = arg_141_1

	arg_141_0:GetSubView(IslandSlotHudView):ShowHud(arg_141_1.id, arg_141_1.height)
	arg_141_0:GetSubView(IslandOpView):UpdateOperationButton(arg_141_1.operationType, arg_141_1.id)

	if arg_141_1.isHighLightControl then
		arg_141_0.detectionSystem:HighLightUnitHandle(arg_141_1.id, true)
	end
end

function var_0_0.OnHideUnitHudAndOpBtn(arg_142_0, arg_142_1, arg_142_2)
	if not arg_142_0.currentHudUnitData then
		return
	end

	if arg_142_0.currentHudUnitData.id ~= arg_142_1.id or arg_142_0.currentHudUnitData.type ~= arg_142_1.type then
		return
	end

	if not arg_142_2 then
		arg_142_0.currentHudUnitData = nil
	end

	arg_142_0:GetSubView(IslandSlotHudView):HideUnitHud(arg_142_1.id)
	arg_142_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, arg_142_1.id)

	if arg_142_1.isHighLightControl then
		arg_142_0.detectionSystem:HighLightUnitHandle(arg_142_1.id, false)
	end
end

function var_0_0.OnUpdateHud(arg_143_0, arg_143_1)
	if not arg_143_0.currentHudUnitData then
		return
	end

	if arg_143_1 ~= arg_143_0.currentHudUnitData.id then
		return
	end

	arg_143_0:GetSubView(IslandSlotHudView):UpdateHud(arg_143_0.currentHudUnitData.id, arg_143_0.currentHudUnitData.height)
	arg_143_0:GetSubView(IslandOpView):UpdateOperationButton(arg_143_0.currentHudUnitData.operationType, arg_143_0.currentHudUnitData.id)
end

function var_0_0.OnUpdateHandCollectUnit(arg_144_0, arg_144_1)
	local var_144_0 = arg_144_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_144_1)

	if var_144_0 then
		var_144_0:UpdateHandCollet()
		var_144_0:ResetHp()
	end
end

function var_0_0.OnShowHud(arg_145_0, arg_145_1)
	arg_145_0:GetSubView(IslandTopHeadHudView):ShowHud(arg_145_1)
	arg_145_0:GetSubView(IslandDistanceView):ShowHud(arg_145_1.id)
end

function var_0_0.OnRefreshHud(arg_146_0, arg_146_1)
	arg_146_0:GetSubView(IslandTopHeadHudView):RefreshHud(arg_146_1)
end

function var_0_0.OnHideHud(arg_147_0, arg_147_1)
	arg_147_0:GetSubView(IslandTopHeadHudView):HideHud(arg_147_1)
	arg_147_0:GetSubView(IslandDistanceView):HideHud(arg_147_1.id)
end

function var_0_0.OnDelegateSlotStartPerform(arg_148_0, arg_148_1)
	local var_148_0 = arg_148_0:GetUnitModuleWithType(arg_148_1.type, arg_148_1.id)

	if var_148_0 then
		var_148_0:DelegateSlotStartPerform()
	end
end

function var_0_0.OnRecycleAllSlotEffct(arg_149_0)
	arg_149_0.effectMgr:RecycleAllSlotEffct()
end

function var_0_0.OnLoadDelegatePreviewRole(arg_150_0, arg_150_1, arg_150_2)
	arg_150_0.effectMgr:LoadDelegatePreviewRole(arg_150_1, arg_150_2)
end

function var_0_0.OnUnLoadDelegatePreviewRole(arg_151_0)
	arg_151_0.effectMgr:UnLoadDelegatePreviewRole()
end

function var_0_0.OnSelectSlotEffectShow(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4)
	arg_152_0.effectMgr:SelectSlotEffectShow(arg_152_1, arg_152_2, arg_152_3, arg_152_4)
end

function var_0_0.OnTakePlantAttack(arg_153_0, arg_153_1)
	local var_153_0 = arg_153_0:GetUnitModuleWithType(arg_153_1.type, arg_153_1.id)

	if var_153_0 then
		var_153_0:TakeAttack()
	end
end

function var_0_0.OnStartManage(arg_154_0, arg_154_1)
	local var_154_0 = arg_154_0:GetManageSystemModule(arg_154_1.id)

	if var_154_0 then
		var_154_0:StartManage(arg_154_1)
	end
end

function var_0_0.OnEndManage(arg_155_0, arg_155_1)
	local var_155_0 = arg_155_0:GetManageSystemModule(arg_155_1.id)

	if var_155_0 then
		var_155_0:EndManage(arg_155_1)
	end
end

function var_0_0.OnRefreshTaskInfoHud(arg_156_0)
	arg_156_0:GetSubView(IslandTopHeadHudView):UpdateAllHud()
end

function var_0_0.OnRefreshWeatherSystem(arg_157_0)
	arg_157_0.weatherSystem:Play()
end

function var_0_0.OnDispose(arg_158_0)
	arg_158_0.detectionSystem:Dispose()
	arg_158_0.effectMgr:Dispose()
	arg_158_0.coupleActionPlayer:Dispose()
	arg_158_0.coupleAction4FollowerPlayer:Dispose()
	arg_158_0.npcActionPlayer:Dispose()
	arg_158_0.weatherSystem:Dispose()
	arg_158_0.coupleNpcWordPlayer:Dispose()
	arg_158_0:GetPoolMgr():ClearFishingEffect()

	for iter_158_0, iter_158_1 in ipairs(arg_158_0.views) do
		iter_158_1:Dispose()
	end

	for iter_158_2, iter_158_3 in ipairs(arg_158_0.pathfinders) do
		iter_158_3:Dispose()
	end

	for iter_158_4, iter_158_5 in ipairs(arg_158_0:GetAllUnits()) do
		iter_158_5:Dispose()
	end

	for iter_158_6, iter_158_7 in pairs(arg_158_0.unitBuilders) do
		iter_158_7:Dispose()
	end

	for iter_158_8, iter_158_9 in pairs(arg_158_0.systemBuilders) do
		iter_158_9:Dispose()
	end

	for iter_158_10, iter_158_11 in pairs(arg_158_0.fishingSynPlayers) do
		iter_158_11:Dispose()
	end

	arg_158_0.fishingSynPlayers = nil
	arg_158_0.npcActionPlayer = nil
	arg_158_0.coupleActionPlayer = nil
	arg_158_0.coupleAction4FollowerPlayer = nil
	arg_158_0.pathfinders = nil
	arg_158_0.unitBuilders = nil
	arg_158_0.systemBuilders = nil
	arg_158_0.views = nil
	arg_158_0.player = nil
	arg_158_0.isInit = false
	arg_158_0._unitList = nil
	arg_158_0.detectionSystem = nil
	arg_158_0.effectMgr = nil
	arg_158_0.coupleNpcWordPlayer = nil
end

return var_0_0
