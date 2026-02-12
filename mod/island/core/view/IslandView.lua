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
	arg_21_0:AddListener(ISLAND_EVT.WILL_DEL_FOLLOWER, arg_21_0.OnFollowerWillDelStep1)
	arg_21_0:AddListener(ISLAND_EVT.DO_DEL_FOLLOWER, arg_21_0.OnFollowerWillDelStep2)
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
	arg_21_0:AddListener(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, arg_21_0.OnAllDailyOrWeeklyFinish)
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
	arg_22_0:RemoveListener(ISLAND_EVT.WILL_DEL_FOLLOWER, arg_22_0.OnFollowerWillDelStep1)
	arg_22_0:RemoveListener(ISLAND_EVT.DO_DEL_FOLLOWER, arg_22_0.OnFollowerWillDelStep2)
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
	arg_22_0:RemoveListener(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, arg_22_0.OnAllDailyOrWeeklyFinish)
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

function var_0_0.OnAllDailyOrWeeklyFinish(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_25_1 = {}

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		if not iter_25_1:IsExitState() then
			table.insert(var_25_1, iter_25_1)
		end
	end

	if #var_25_1 <= 0 then
		return
	end

	for iter_25_2, iter_25_3 in ipairs(var_25_1) do
		iter_25_3:StopMove()
		iter_25_3:PlayAnimation(arg_25_1)
	end
end

function var_0_0.OnSystemUnlock(arg_26_0, arg_26_1)
	if arg_26_1 == IslandAblityAgency.ANIMATION_OP_ID then
		arg_26_0:GetSubView(IslandOpView):UpdateAnimationOpBtn()
	end
end

function var_0_0.SelectedFishPoint(arg_27_0, arg_27_1)
	if not arg_27_0:GetSelfIsland():GetAblityAgency():IsUnlockFishing() or arg_27_1:GetUnitType() ~= IslandConst.UNIT_LIST_FISH_POINT or arg_27_0.player:StandOnWorldObject() or not arg_27_0.player:OnGrouded() then
		return
	end

	arg_27_0:UnSelectedFishPoint()

	arg_27_0.selectedFishPointId = arg_27_1.id

	arg_27_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.Fishing, arg_27_1.id)
end

function var_0_0.UnSelectedFishPoint(arg_28_0)
	if arg_28_0.selectedFishPointId then
		local var_28_0 = arg_28_0.selectedFishPointId

		arg_28_0.selectedFishPointId = nil

		arg_28_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, var_28_0)
	end
end

function var_0_0.OnStartFishing(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.unitId
	local var_29_1 = arg_29_0:GetPlayerUnitModule(var_29_0)

	if not var_29_1 then
		return
	end

	if not isa(var_29_1, IslandVisitorUnit) then
		return
	end

	var_29_1:Sleep()

	local var_29_2 = arg_29_1.fishPointId
	local var_29_3 = arg_29_1.rodId
	local var_29_4 = arg_29_1.fishId
	local var_29_5 = pg.island_fish_rod[var_29_3].attachment_id
	local var_29_6 = IslandVistorFishingPlayer.New(arg_29_0, var_29_1, var_29_2, var_29_5, var_29_4)

	var_29_6:Play()

	arg_29_0.fishingSynPlayers[var_29_0] = var_29_6
end

function var_0_0.OnFishingStateChange(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1.op
	local var_30_1 = arg_30_1.unitId
	local var_30_2 = arg_30_0:GetPlayerUnitModule(var_30_1)
	local var_30_3 = arg_30_0.fishingSynPlayers[var_30_1]

	if not isa(var_30_2, IslandVisitorUnit) then
		return
	end

	if not var_30_3 or not var_30_3:IsSameFishPoint(arg_30_1.fishPointId) then
		return
	end

	local function var_30_4()
		var_30_2:WakeUp()
		arg_30_0.fishingSynPlayers[var_30_1]:Dispose()

		arg_30_0.fishingSynPlayers[var_30_1] = nil
	end

	if var_30_0 == IslandConst.FISHING_OP_CANCEL then
		var_30_3:OnCancel(var_30_4)
	elseif var_30_0 == IslandConst.FISHING_OP_FAILD then
		var_30_3:OnFailed(var_30_4)
	elseif var_30_0 == IslandConst.FISHING_OP_SUCCESS then
		var_30_3:OnSuccess(var_30_4)
	end
end

function var_0_0.OnStartCoupleAction(arg_32_0)
	arg_32_0:UnBlockLayer1Event(false)
	arg_32_0:GetSubView(IslandAniamtionOpView):OnStartCoupleAction()
end

function var_0_0.OnEndCoupleAction(arg_33_0)
	arg_33_0:UnBlockLayer1Event(true)
	arg_33_0:GetSubView(IslandAniamtionOpView):OnEndCoupleAction()
end

function var_0_0.OnCancelCoupleAction(arg_34_0)
	if arg_34_0.coupleActionPlayer and arg_34_0.coupleActionPlayer:IsPlaying() then
		arg_34_0.coupleActionPlayer:Stop()
	end

	if arg_34_0.coupleAction4FollowerPlayer and arg_34_0.coupleAction4FollowerPlayer:IsPlaying() then
		arg_34_0.coupleAction4FollowerPlayer:Stop()
	end

	arg_34_0:OnEndCoupleAction()
end

function var_0_0.OnCoupleActionWithFollower(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_35_1 = arg_35_0:GetPlayerPosition()
	local var_35_2 = pg.island_set.action_bubble_range.key_value_int
	local var_35_3 = _.select(var_35_0, function(arg_36_0)
		return not arg_36_0:IsExitState() and Vector3.Distance(arg_36_0:GetPosition(), var_35_1) <= var_35_2
	end)

	if #var_35_3 <= 0 then
		return
	end

	local var_35_4 = var_35_3[math.random(1, #var_35_3)]
	local var_35_5 = pg.island_action[arg_35_1]

	arg_35_0.coupleAction4FollowerPlayer:Play(var_35_4, arg_35_0.player, var_35_5)
	arg_35_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
end

function var_0_0.OnFollowerAdd(arg_37_0, arg_37_1)
	if arg_37_0:GetSelectedNpcId() then
		local var_37_0, var_37_1 = IslandCalcUtil.GetTypeAndIdByUniqueId(arg_37_0:GetSelectedNpcId())

		if var_37_1 == arg_37_1 then
			arg_37_0.selectedNpcId = nil
		end
	end

	arg_37_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_37_0.coupleNpcWordPlayer:Play(arg_37_1)
end

function var_0_0.OnFollowerWillDelStep1(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_38_1

	for iter_38_0, iter_38_1 in ipairs(var_38_0) do
		if iter_38_1:GetDataVO():IsSameShip(arg_38_1) then
			var_38_1 = iter_38_1

			break
		end
	end

	if not var_38_1 or var_38_1:IsExitState() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_follower_exiting_tip"))

		return
	end

	var_38_1:DoExitHandle()
end

function var_0_0.OnFollowerWillDelStep2(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_1.node

	if not var_39_0 then
		return
	end

	local var_39_1 = var_39_0:GetComponent(typeof(WorldObjectItem)).uniqueId
	local var_39_2, var_39_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_39_1)
	local var_39_4 = arg_39_0:GetUnitModuleWithType(var_39_2, var_39_3)

	if not var_39_4 then
		return
	end

	arg_39_0:NotifiyMeditor(IslandMediator.DEL_FOLLOWER, var_39_4:GetDataVO():GetShipId())
end

function var_0_0.OnFollowerDel(arg_40_0, arg_40_1)
	arg_40_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_40_0.coupleNpcWordPlayer:Stop(arg_40_1)
end

function var_0_0.OnResetFollowRandomizer(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0:GetFollowerModule(arg_41_1)

	if not var_41_0 then
		return
	end

	var_41_0:SetBtRandomizer()
end

function var_0_0.OnShowChatMsg(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1.player.id
	local var_42_1 = arg_42_0:GetPlayerUnitModule(var_42_0)

	if not var_42_1 then
		return
	end

	arg_42_0:GetSubView(IslandTopHeadHudView):PlayChat(var_42_1, arg_42_1.emojiId, arg_42_1.content, nil)
end

function var_0_0.OnChatRoomChange(arg_43_0)
	arg_43_0:GetSubView(IslandAniamtionOpView):UpdateChatRoom()
end

function var_0_0.OnChatMsgUpdate(arg_44_0)
	arg_44_0:GetSubView(IslandAniamtionOpView):UpdateMsgList()
end

function var_0_0.OnPlaySingleAnimationEnd(arg_45_0, arg_45_1)
	if not arg_45_0:GetSelectedNpcId() then
		arg_45_0.npcActionPlayer:ResoponByRandom(arg_45_0.player, arg_45_1)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_45_1, 0, 0, 0, 0))

		return
	end

	local var_45_0 = arg_45_0:GetSelectedNpcId()
	local var_45_1, var_45_2 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_45_0)
	local var_45_3 = arg_45_0:GetUnitModuleWithType(var_45_1, var_45_2)

	if isa(var_45_3, IslandStrollNpcUnit) and var_45_3:GetDataVO():ExistActionFeedback() then
		arg_45_0.npcActionPlayer:Resopon(var_45_3, arg_45_0.player, arg_45_1)
	else
		arg_45_0.npcActionPlayer:ResoponByRandom(arg_45_0.player, arg_45_1)
	end
end

function var_0_0.OnShowNpcAniamtionBubble(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0:GetStrollUnitModule(arg_46_1.id)

	if not var_46_0 then
		return
	end

	local var_46_1 = arg_46_1:GetActionFeedback()

	arg_46_0:GetSubView(IslandBottomHeadHudView):ShowAnimationOp(var_46_0, var_46_1)
end

function var_0_0.OnHideNpcAniamtionBubble(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:GetStrollUnitModule(arg_47_1.id)

	arg_47_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_47_0)
end

function var_0_0.OnStartDoCoupleAction(arg_48_0)
	arg_48_0:GetSubView(IslandCancelAnimationOpView):ShowCancelableAnimationOp(arg_48_0.player)
end

function var_0_0.OnEndDoCoupleAction(arg_49_0)
	arg_49_0:GetSubView(IslandCancelAnimationOpView):HideCancelableAnimationOp(arg_49_0.player)
end

function var_0_0.OnResponAniamtionOp(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1.id
	local var_50_1 = arg_50_1.targetId
	local var_50_2 = arg_50_1.actionId
	local var_50_3 = arg_50_0:GetPlayerUnitModule(var_50_0)

	if not var_50_3 then
		return
	end

	if var_50_2 == 0 then
		if not arg_50_0:IsPlayer(var_50_0) then
			arg_50_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_50_3)
		else
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_50_2, 1, 0, 0, 0))
		end

		return
	end

	local var_50_4 = pg.island_action[var_50_2]

	if var_50_1 == 0 and var_50_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_50_0:IsPlayer(var_50_0) then
		arg_50_0:GetSubView(IslandTopHeadHudView):ShowAnimationOp(var_50_3, var_50_2)
	elseif var_50_1 > 0 and var_50_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_50_0:IsPlayer(var_50_1) then
		local var_50_5 = arg_50_0:GetPlayerUnitModule(var_50_1)

		arg_50_0.coupleActionPlayer:Play(var_50_3, var_50_5, var_50_4)
		arg_50_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_50_5)
	elseif var_50_1 > 0 and var_50_4.type == IslandConst.ANIMATION_OP_DOUBLE and arg_50_0:IsPlayer(var_50_1) then
		local var_50_6 = arg_50_0:GetPlayerUnitModule(var_50_1)

		arg_50_0.coupleActionPlayer:Play(var_50_3, var_50_6, var_50_4)
		arg_50_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_50_2, 1, var_50_1, 0, 1))
	end
end

function var_0_0.OnShowChatMsg(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.player.id
	local var_51_1 = arg_51_0:GetPlayerUnitModule(var_51_0)

	if not var_51_1 then
		return
	end

	arg_51_0:GetSubView(IslandTopHeadHudView):PlayChat(var_51_1, arg_51_1.emojiId, arg_51_1.content, nil)
end

function var_0_0.OnChatRoomChange(arg_52_0)
	arg_52_0:GetSubView(IslandAniamtionOpView):UpdateChatRoom()
end

function var_0_0.OnChatMsgUpdate(arg_53_0)
	arg_53_0:GetSubView(IslandAniamtionOpView):UpdateMsgList()
end

function var_0_0.OnFollowerAdd(arg_54_0, arg_54_1)
	arg_54_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_54_0.coupleNpcWordPlayer:Play(arg_54_1)
end

function var_0_0.OnFollowerDel(arg_55_0, arg_55_1)
	arg_55_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_55_0.coupleNpcWordPlayer:Stop(arg_55_1)
end

function var_0_0.OnResetFollowRandomizer(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:GetFollowerModule(arg_56_1)

	if not var_56_0 then
		return
	end

	var_56_0:SetBtRandomizer()
end

function var_0_0.OnGenPathFinder(arg_57_0, arg_57_1)
	local var_57_0 = IslandPathFinder.New(arg_57_0)
	local var_57_1 = defaultValue(arg_57_1.navData.waitUntilDone, false)

	var_57_0:Start(arg_57_1.navData, function()
		table.removebyvalue(arg_57_0.pathfinders, var_57_0)
		var_57_0:Dispose()

		if arg_57_1.onEndAction then
			arg_57_1.onEndAction()
		end

		arg_57_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH_DONE, arg_57_1.navData.index)

		if var_57_1 and arg_57_1.callback then
			arg_57_1.callback()
		end
	end)
	arg_57_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH, arg_57_1.navData.index)

	if not var_57_1 and arg_57_1.callback then
		arg_57_1.callback()
	end

	table.insert(arg_57_0.pathfinders, var_57_0)
end

function var_0_0.OnRemovePathFinder(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0:GetUnitModuleWithType(arg_59_1.unitType, arg_59_1.unitId)
	local var_59_1 = _.detect(arg_59_0.pathfinders, function(arg_60_0)
		return arg_60_0:IsSameUnit(var_59_0)
	end)

	if not var_59_1 then
		return
	end

	var_59_1:Stop()
	var_59_1:Dispose()
	table.removebyvalue(arg_59_0.pathfinders, var_59_1)
end

function var_0_0.OnTracking(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1.trackType

	if var_61_0 == IslandTaskTrackCard.TYPES.MAIN then
		arg_61_0.mainTrackId = tonumber(arg_61_1.id)
		arg_61_0.needTryMainTrack = true
	elseif var_61_0 == IslandTaskTrackCard.TYPES.OTHER then
		arg_61_0.trackId = tonumber(arg_61_1.id)
		arg_61_0.trackType = arg_61_1.typ or IslandTaskType.MAIN
		arg_61_0.needTryTrack = true
	end
end

function var_0_0.TryTrack(arg_62_0)
	arg_62_0:TrySetTrack(arg_62_0.trackId)
end

function var_0_0.TrySetTrack(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0:GetOptTrackingTarget(arg_63_1)

	if not var_63_0 or not var_63_0._go then
		return
	end

	arg_63_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_63_0.player, var_63_0, arg_63_1, arg_63_0.trackType, IslandTaskTrackCard.TYPES.OTHER)

	arg_63_0.needTryTrack = false
end

function var_0_0.TryMainTrack(arg_64_0)
	arg_64_0:TrySetMainTrack(arg_64_0.mainTrackId)
end

function var_0_0.TrySetMainTrack(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0:GetOptTrackingTarget(arg_65_1)

	if not var_65_0 or not var_65_0._go then
		return
	end

	arg_65_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_65_0.player, var_65_0, arg_65_1, IslandTaskType.MAIN, IslandTaskTrackCard.TYPES.MAIN)

	arg_65_0.needTryMainTrack = false
end

function var_0_0.OnUnTracking(arg_66_0, arg_66_1)
	if arg_66_1 == IslandTaskTrackCard.TYPES.MAIN then
		arg_66_0.mainTrackId = nil
	elseif arg_66_1 == IslandTaskTrackCard.TYPES.OTHER then
		arg_66_0.trackId = nil
	end

	arg_66_0:GetSubView(IslandDistanceView):CancelTracking(arg_66_1)
end

local function var_0_1(arg_67_0, arg_67_1)
	local var_67_0 = pg.island_world_objects[arg_67_0]

	if not var_67_0 then
		return
	end

	return var_67_0.mapId == arg_67_1
end

local function var_0_2(arg_68_0, arg_68_1, arg_68_2)
	for iter_68_0, iter_68_1 in ipairs(arg_68_0) do
		for iter_68_2, iter_68_3 in ipairs(iter_68_1[2]) do
			local var_68_0 = pg.island_interaction[iter_68_3]

			if var_68_0.type == arg_68_2 and var_0_1(tonumber(var_68_0.param), arg_68_1) then
				return iter_68_1[1]
			end
		end
	end

	return nil
end

local function var_0_3(arg_69_0)
	local var_69_0 = {}
	local var_69_1 = {}

	for iter_69_0, iter_69_1 in ipairs(arg_69_0) do
		for iter_69_2, iter_69_3 in ipairs(iter_69_1[2]) do
			local var_69_2 = pg.island_interaction[iter_69_3]

			if var_69_2.type == IslandInteractionUntil.TYPE_TRANSFER then
				table.insert(var_69_0, iter_69_1[1])
			elseif var_69_2.type == IslandInteractionUntil.TYPE_SP_TRANSFER then
				table.insert(var_69_1, iter_69_1[1])
			end
		end
	end

	if #var_69_1 > 0 then
		return var_69_1[1]
	end

	if #var_69_0 > 0 then
		return var_69_0[1]
	end

	return nil
end

function var_0_0.GetOptTrackingTarget(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0:GetUnitModule(arg_70_1)

	if var_70_0 then
		return var_70_0
	end

	local var_70_1 = pg.island_world_objects[arg_70_1]

	if not var_70_1 then
		return nil
	end

	local var_70_2 = {}

	for iter_70_0, iter_70_1 in ipairs(arg_70_0:GetUnitListByKey(IslandConst.UNIT_LIST_OBJ)) do
		local var_70_3, var_70_4 = iter_70_1:IsMapTransfer()

		if var_70_3 then
			table.insert(var_70_2, {
				iter_70_1,
				var_70_4
			})
		end
	end

	local var_70_5
	local var_70_6 = var_0_2(var_70_2, var_70_1.mapId, IslandInteractionUntil.TYPE_TRANSFER) or var_0_2(var_70_2, var_70_1.mapId, IslandInteractionUntil.TYPE_SP_TRANSFER)

	var_70_6 = var_70_6 or var_0_3(var_70_2)

	return var_70_6
end

function var_0_0.OnOpenAniamtionOpPage(arg_71_0)
	arg_71_0:GetSubView(IslandAniamtionOpView):TryEnable()
	arg_71_0:GetSubView(IslandOpView):TryDisable()
	arg_71_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_ANIMATION_OP)
end

function var_0_0.OnCloseAniamtionOpPage(arg_72_0)
	arg_72_0:GetSubView(IslandOpView):TryEnable()
	arg_72_0:NotifiyIsland(ISLAND_EX_EVT.CLOSE_ANIMATION_OP)
end

function var_0_0.OnAnyPageOpen(arg_73_0, arg_73_1)
	arg_73_0.anyPageOpen = true

	arg_73_0.player:StopMoveHandle()
	arg_73_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_73_0:GetSubView(IslandSlotHudView):TryDisable()
	arg_73_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_73_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_73_0:GetSubView(IslandAniamtionOpView):CloseAndReset()
end

function var_0_0.OnAllPageClose(arg_74_0)
	arg_74_0.anyPageOpen = false

	arg_74_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_74_0:GetSubView(IslandSlotHudView):TryEnable()
	arg_74_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_74_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnStartStory(arg_75_0)
	arg_75_0.playingStory = true

	arg_75_0:DisablePlayerOp()
end

function var_0_0.OnEndStory(arg_76_0)
	arg_76_0.playingStory = false

	arg_76_0:EnablePlayerOp()
end

function var_0_0.OnStartPerformance(arg_77_0)
	return
end

function var_0_0.OnEndPerformance(arg_78_0)
	if not arg_78_0.anyPageOpen then
		arg_78_0:GetSubView(IslandOpView):ResetShowBalance()
	end
end

function var_0_0.OnStartGuide(arg_79_0)
	arg_79_0.player:StopMoveHandle()
	arg_79_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.OnEndGuide(arg_80_0)
	if arg_80_0.playingStory then
		return
	end

	arg_80_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.InitFocusCamera(arg_81_0)
	local var_81_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)

	var_81_0.Follow = arg_81_0.player._tf
	var_81_0.LookAt = arg_81_0.player._tf
end

function var_0_0.InitTakePhotoCamera(arg_82_0)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).Follow = arg_82_0.firstTakePhotoItem._tf

	local var_82_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)

	var_82_0.Follow = arg_82_0.thirdTakePhotoItem._tf
	var_82_0.LookAt = arg_82_0.thirdTakePhotoItem._tf
end

function var_0_0.DisablePlayerOp(arg_83_0)
	arg_83_0.player:StopMoveHandle()
	arg_83_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_83_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_83_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_83_0:GetSubView(IslandOpView):TryDisable()
end

function var_0_0.EnablePlayerOp(arg_84_0)
	arg_84_0:GetSubView(IslandOpView):TryEnablePlayerOp()
	arg_84_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_84_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_84_0:GetSubView(IslandOpView):TryEnable()
end

function var_0_0.OnInterActionBegin(arg_85_0)
	arg_85_0.player:StopMoveHandle()
	arg_85_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_86_0)
	arg_86_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_87_0, arg_87_1)
	arg_87_0.showInterObjId = arg_87_1.id

	arg_87_0:GetSubView(IslandInteractionView):ShowInterActionPanel(arg_87_1)
	arg_87_0:Op("NotifiyIsland", ISLAND_EX_EVT.SHOW_INTERACTION, arg_87_0.showInterObjId)
end

function var_0_0.OnHideInterActionPanel(arg_88_0, arg_88_1)
	if arg_88_0.showInterObjId ~= arg_88_1.id then
		return
	end

	arg_88_0.showInterObjId = nil

	arg_88_0:GetSubView(IslandInteractionView):HideInterActionPanel()
end

function var_0_0.OnRefreshInteractionBtn(arg_89_0)
	arg_89_0:GetSubView(IslandInteractionView):RefreshInteractionBtns()
end

function var_0_0.OnSetOpMoveBtnActve(arg_90_0, arg_90_1, arg_90_2)
	arg_90_0:GetSubView(IslandOpView):ShowOrHideMoveBtn(arg_90_1, arg_90_2)
end

function var_0_0.DisableInput(arg_91_0)
	arg_91_0.player:StopMoveHandle()
	arg_91_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.EnableInput(arg_92_0)
	arg_92_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.OnUpdateCustomOpPositon(arg_93_0)
	arg_93_0:GetSubView(IslandOpView):InitOpCustumPositon()
end

function var_0_0.OnChange_Photo_Height(arg_94_0, arg_94_1, arg_94_2)
	arg_94_0.takePhotoModel = arg_94_1

	if arg_94_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		-- block empty
	elseif arg_94_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_94_0.thirdTakePhotoItem:ChangeHeight(arg_94_2)
	end
end

function var_0_0.OnChangeTakePhotoModel(arg_95_0, arg_95_1, arg_95_2)
	arg_95_0.takePhotoModel = arg_95_1

	if arg_95_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_95_0.firstTakePhotoItem:Enable()

		arg_95_0.firstTakePhotoItem._tf.position = arg_95_0.player._tf.position
		arg_95_0.firstTakePhotoItem._tf.rotation = arg_95_0.player._tf.rotation

		arg_95_0.firstTakePhotoItem:SetTargetRotation(arg_95_0.player._tf.rotation)
		arg_95_0.player:SetActiveByLayer(false)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook)):SetPosAndRotationByTargetDir(arg_95_0.player._tf.forward)
	elseif arg_95_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_95_0.thirdTakePhotoItem:Enable()

		arg_95_0.player._tf.position = arg_95_0.firstTakePhotoItem._tf.position
		arg_95_0.player._tf.rotation = arg_95_0.firstTakePhotoItem._tf.rotation

		arg_95_0.player:SetTargetRotation(arg_95_0.firstTakePhotoItem._tf.rotation)
		arg_95_0.player:SetActiveByLayer(true)

		arg_95_0.thirdTakePhotoItem._tf.position = arg_95_0.firstTakePhotoItem._tf:TransformPoint(Vector3(0, 0, -5))
		arg_95_0.thirdTakePhotoItem._tf.rotation = arg_95_0.firstTakePhotoItem._tf.rotation

		arg_95_0.thirdTakePhotoItem:SetTargetRotation(arg_95_0.firstTakePhotoItem._tf.rotation)

		local var_95_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook))
		local var_95_1 = arg_95_0.player._tf.position + Vector3(0, 0.5, 0)
		local var_95_2 = arg_95_0.thirdTakePhotoItem._tf.position + Vector3(0, 1, 0)

		var_95_0:SetPosAndRotationByTargetDir((var_95_1 - var_95_2).normalized)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)
	else
		arg_95_0.firstTakePhotoItem:Disable()
		arg_95_0.thirdTakePhotoItem:Disable()

		arg_95_0.player._tf.position = arg_95_0.firstTakePhotoItem._tf.position
		arg_95_0.player._tf.rotation = arg_95_0.firstTakePhotoItem._tf.rotation

		arg_95_0.player:SetTargetRotation(arg_95_0.firstTakePhotoItem._tf.rotation)
		arg_95_0.player:SetActiveByLayer(true)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraLook)):ResetCameraPos()
	end

	arg_95_0:GetSubView(IslandOpView):ChangeTakePhotoModel(arg_95_1, arg_95_2)
end

function var_0_0.OnNpcDetectorSelected(arg_96_0, arg_96_1)
	if arg_96_0.selectedNpcId then
		return
	end

	local var_96_0 = arg_96_1.node

	if not var_96_0 then
		return
	end

	local var_96_1 = var_96_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	arg_96_0.selectedNpcId = var_96_1

	arg_96_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_96_1, true)
	arg_96_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_96_1, true)
end

function var_0_0.GetSelectedNpcId(arg_97_0)
	return arg_97_0.selectedNpcId
end

function var_0_0.OnNpcDetectorUnSelected(arg_98_0, arg_98_1)
	local var_98_0 = arg_98_1.node

	if not var_98_0 then
		return
	end

	local var_98_1 = var_98_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	arg_98_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_98_1)
	arg_98_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_98_1)

	if arg_98_0.selectedNpcId ~= var_98_1 then
		return
	end

	arg_98_0.selectedNpcId = nil
end

function var_0_0.OnDetectorChanged(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1.node

	if not var_99_0 then
		return
	end

	local var_99_1 = var_99_0:GetBlackboardVariable("DetectorList")

	for iter_99_0 = 1, var_99_1.Count do
		local var_99_2 = var_99_1[iter_99_0 - 1]
		local var_99_3, var_99_4 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_99_2)

		if var_99_3 == IslandConst.UNIT_LIST_OBJ then
			local var_99_5 = arg_99_0:GetUnitModuleWithType(var_99_3, var_99_4)

			if var_99_5 then
				arg_99_0:Op("NotifiyIsland", ISLAND_EX_EVT.APPROACH_OBJECT, var_99_5.id)
			end
		end
	end
end

function var_0_0.OnDetectorSelected(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_1.node

	if not var_100_0 then
		return
	end

	local var_100_1 = var_100_0:GetBlackboardVariable("AnyOne")

	if not var_100_1 or var_100_1 == "" then
		arg_100_0:OnClearSelectedUnit()
	else
		local var_100_2, var_100_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_100_1)
		local var_100_4 = arg_100_0:GetUnitModuleWithType(var_100_2, var_100_3)

		if var_100_4 then
			arg_100_0:OnSelectedUnit(var_100_4)
		end
	end
end

function var_0_0.OnClearSelectedUnit(arg_101_0)
	return
end

function var_0_0.OnSelectedUnit(arg_102_0, arg_102_1)
	return
end

function var_0_0.OnPlayChatBubble(arg_103_0, arg_103_1)
	local var_103_0 = arg_103_0:GetAllUnits()

	arg_103_0:GetSubView(IslandTopHeadHudView):PlayBubble(arg_103_1.name, var_103_0, arg_103_1.callback)
end

function var_0_0.OnRawPlayChatBubble(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_0:GetAllUnits()

	arg_104_0:GetSubView(IslandTopHeadHudView):RawPlayBubble(arg_104_1.info, var_104_0, arg_104_1.callback)
end

function var_0_0.OnRawStopChatBubble(arg_105_0, arg_105_1)
	arg_105_0:GetSubView(IslandTopHeadHudView):RawStopBubble(arg_105_1.info)
end

function var_0_0.OnChangeVisterDress(arg_106_0, arg_106_1)
	local var_106_0 = arg_106_1.id

	if arg_106_0:IsPlayer(var_106_0) then
		return
	end

	local var_106_1 = arg_106_0:GetPlayerUnitModule(var_106_0)

	if var_106_1 then
		var_106_1:OnChangeDress(arg_106_1.changeDressData)
	end
end

function var_0_0.OnSystemUnlock(arg_107_0, arg_107_1)
	if arg_107_1 == IslandAblityAgency.ANIMATION_OP_ID then
		arg_107_0:GetSubView(IslandOpView):UpdateAnimationOpBtn()
	end
end

function var_0_0.OnSceneInited(arg_108_0, arg_108_1)
	IslandCameraMgr.instance:LookAt(arg_108_0.player._tf)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraZoom)):SetMaxMinZoom(arg_108_1.min, arg_108_1.max, arg_108_1.value)
	arg_108_0:InitFocusCamera()
	arg_108_0:InitTakePhotoCamera()
	arg_108_0:GetSubView(IslandOpView):LaterInit()
end

function var_0_0.OnGenUnit(arg_109_0, arg_109_1, arg_109_2)
	local var_109_0 = arg_109_0.unitBuilders[arg_109_1:GetType()]:Build(arg_109_1, arg_109_2)

	arg_109_0:AddUnit(var_109_0)

	if arg_109_1:IsPlayer() then
		arg_109_0.player = var_109_0
	end

	if arg_109_1:IsFirstTakePhoto() then
		arg_109_0.firstTakePhotoItem = var_109_0
	end

	if arg_109_1:IsThirdTakePhoto() then
		arg_109_0.thirdTakePhotoItem = var_109_0
	end
end

function var_0_0.OnGenSystem(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_0.systemBuilders[arg_110_1:GetType()]:Build(arg_110_1)

	arg_110_0:AddUnit(var_110_0)
end

function var_0_0.IsPlayer(arg_111_0, arg_111_1)
	return arg_111_0.player.id == arg_111_1
end

function var_0_0.OnActiveOrDisactiveUnit(arg_112_0, arg_112_1, arg_112_2, arg_112_3)
	local var_112_0

	if arg_112_1 == 0 then
		var_112_0 = arg_112_0.player
	else
		var_112_0 = arg_112_0:GetUnitModuleWithType(arg_112_2, arg_112_1)
	end

	if var_112_0 and arg_112_3 then
		var_112_0:Enable()
	end

	if var_112_0 and not arg_112_3 then
		var_112_0:Disable()
	end
end

function var_0_0.OnResetUnitPos(arg_113_0, arg_113_1, arg_113_2, arg_113_3)
	local var_113_0 = arg_113_0:GetUnitModuleWithType(arg_113_2, arg_113_1)

	if var_113_0 then
		var_113_0._go.transform.position = arg_113_3
	end
end

function var_0_0.OnResetUnitRotation(arg_114_0, arg_114_1, arg_114_2, arg_114_3)
	local var_114_0 = arg_114_0:GetUnitModuleWithType(arg_114_2, arg_114_1)

	if var_114_0 then
		var_114_0._go.transform.eulerAngles = arg_114_3
	end
end

function var_0_0.OnMoveUnit(arg_115_0, arg_115_1)
	assert(arg_115_1.type, "type should be exist")

	local var_115_0 = arg_115_0:GetUnitModuleWithType(arg_115_1.type, arg_115_1.id)

	if var_115_0 then
		var_115_0:SetDestination(arg_115_1.position, arg_115_1.speed, nil, arg_115_1.charaRadius)
	end
end

function var_0_0.OnStopUnit(arg_116_0, arg_116_1)
	assert(arg_116_1.type, "type should be exist")

	local var_116_0 = arg_116_0:GetUnitModuleWithType(arg_116_1.type, arg_116_1.id)

	if var_116_0 then
		var_116_0:StopMove()
	end
end

function var_0_0.OnRemoveUnit(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = arg_117_0:GetUnitListByKey(arg_117_1)
	local var_117_1 = 0

	for iter_117_0, iter_117_1 in ipairs(var_117_0 or {}) do
		if iter_117_1.id == arg_117_2 then
			var_117_1 = iter_117_0

			break
		end
	end

	if var_117_1 > 0 then
		local var_117_2 = var_117_0[var_117_1]

		for iter_117_2 = #arg_117_0.pathfinders, 1, -1 do
			local var_117_3 = arg_117_0.pathfinders[iter_117_2]

			if var_117_3:IsSameUnit(var_117_2) then
				var_117_3:Dispose()
				table.remove(arg_117_0.pathfinders, iter_117_2)
			end
		end

		arg_117_0:RemoveUnit(var_117_2)
		var_117_2:Dispose()
		arg_117_0:OnHideUnitHudAndOpBtn({
			type = arg_117_1,
			id = var_117_2.id
		}, true)
		arg_117_0:GetSubView(IslandTopHeadHudView):HideHud({
			type = arg_117_1,
			id = arg_117_2
		})
		arg_117_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_117_2)
		arg_117_0:GetSubView(IslandInteractionView):CloseInterActionPanelByUnitIdRemove(arg_117_2)
	end
end

function var_0_0.GetAllUnits(arg_118_0)
	table.clear(arg_118_0._unitList)

	for iter_118_0, iter_118_1 in pairs(arg_118_0:GetUnitListRegitser()) do
		for iter_118_2, iter_118_3 in pairs(iter_118_1) do
			table.insert(arg_118_0._unitList, iter_118_3)
		end
	end

	return arg_118_0._unitList
end

function var_0_0.GetUnitModuleWithType(arg_119_0, arg_119_1, arg_119_2)
	if arg_119_1 == IslandConst.UNIT_LIST_PLAYER and arg_119_2 == 0 then
		return arg_119_0.player
	end

	local var_119_0 = arg_119_0:GetUnitListByKey(arg_119_1)

	for iter_119_0, iter_119_1 in ipairs(var_119_0) do
		if iter_119_1.id == arg_119_2 then
			return iter_119_1
		end
	end

	return nil
end

function var_0_0.GetPlayerUnitModule(arg_120_0, arg_120_1)
	return arg_120_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_120_1)
end

function var_0_0.GetUnitModule(arg_121_0, arg_121_1)
	return arg_121_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_121_1)
end

function var_0_0.GetSystemModule(arg_122_0, arg_122_1)
	return arg_122_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_SYSTEM, arg_122_1)
end

function var_0_0.GetProductSystemModule(arg_123_0, arg_123_1)
	return arg_123_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PRODUCT_SYSTEM, arg_123_1)
end

function var_0_0.GetSystemUnitModule(arg_124_0, arg_124_1)
	return arg_124_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_124_1)
end

function var_0_0.GetStrollUnitModule(arg_125_0, arg_125_1)
	return arg_125_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_STROLL, arg_125_1)
end

function var_0_0.GetManageSystemModule(arg_126_0, arg_126_1)
	return arg_126_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_MANAGE_SYSTEM, arg_126_1)
end

function var_0_0.GetFollowerModule(arg_127_0, arg_127_1)
	return arg_127_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_FOLLOW, arg_127_1)
end

function var_0_0.OnMovePlayerBefore(arg_128_0)
	if arg_128_0.player:CheckMovement() and arg_128_0.isLockPlayInput then
		arg_128_0.isLockPlayInput = false
	end

	arg_128_0:GetSubView(IslandAniamtionOpView):OnMovePlayerBefore()
end

function var_0_0.OnLockPlayerInput(arg_129_0)
	if arg_129_0.playerInputing then
		arg_129_0.isLockPlayInput = true

		arg_129_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerMove(arg_130_0, arg_130_1)
	if arg_130_0.isLockPlayInput then
		return
	end

	arg_130_0.playerInputing = true

	if arg_130_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_130_0.firstTakePhotoItem:MoveHandle(arg_130_1.targetDir, arg_130_1.force)
	elseif arg_130_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_130_0.thirdTakePhotoItem:MoveHandle(arg_130_1.targetDir, arg_130_1.force)
	else
		arg_130_0.player:MoveHandle(arg_130_1.targetDir, arg_130_1.force)
	end
end

function var_0_0.OnPlayerStopMove(arg_131_0)
	if arg_131_0.isLockPlayInput then
		arg_131_0.isLockPlayInput = false
	end

	arg_131_0.playerInputing = true

	if arg_131_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_131_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_131_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_131_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_131_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerStopMoveHandle(arg_132_0)
	if arg_132_0.isLockPlayInput then
		arg_132_0.isLockPlayInput = false
	end

	arg_132_0.playerInputing = true

	if arg_132_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_132_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_132_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_132_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_132_0.player:StopMoveHandleByInput()
	end
end

function var_0_0.OnPlayerJump(arg_133_0)
	if arg_133_0.takePhotoModel == IslandConst.TakePhotoModel.First or arg_133_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		return
	end

	arg_133_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_134_0)
	arg_134_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_135_0)
	if arg_135_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_135_0.firstTakePhotoItem:OnPlayerPlayerSprint()
	elseif arg_135_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		-- block empty
	else
		arg_135_0.player:OnPlayerPlayerSprint()
	end
end

function var_0_0.OnStopPlayerSprint(arg_136_0)
	if arg_136_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_136_0.firstTakePhotoItem:OnStopPlayerSprint()
	elseif arg_136_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_136_0.thirdTakePhotoItem:OnStopPlayerSprint()
	else
		arg_136_0.player:OnStopPlayerSprint()
	end
end

function var_0_0.OnPlayerWork(arg_137_0, arg_137_1, arg_137_2)
	arg_137_0.player:WorkHandle(arg_137_1, arg_137_2)
end

function var_0_0.OnPlayerDeviceStateChange(arg_138_0, arg_138_1)
	arg_138_0.player:DeviceStateHandle(arg_138_1)
end

function var_0_0.OnSetVisitorSyncData(arg_139_0, arg_139_1, arg_139_2)
	local var_139_0 = arg_139_0:GetPlayerUnitModule(arg_139_1)

	if var_139_0 then
		var_139_0:UpdateSyncData(arg_139_2)
	end
end

function var_0_0.OnWorldObjectStartInteraction(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	local var_140_0 = arg_140_2:GetHostId()
	local var_140_1 = arg_140_2:GetUserId()
	local var_140_2 = arg_140_0:GetUnitModule(var_140_0)
	local var_140_3 = arg_140_0:GetPlayerUnitModule(var_140_1)
	local var_140_4 = arg_140_0.player == var_140_3

	if var_140_4 then
		arg_140_0:GetSubView(IslandOpView):StartInteraction()
	end

	local var_140_5 = arg_140_1:GetTimeline()[arg_140_3]
	local var_140_6 = arg_140_1:GetBlackboardParam()[arg_140_3]

	var_140_2:StartInteract(var_140_3, arg_140_2.id, arg_140_3, var_140_5, var_140_6, arg_140_1:AnySlotUsing(), var_140_4)
end

function var_0_0.OnWorldObjectEndInteraction(arg_141_0, arg_141_1, arg_141_2)
	local var_141_0 = arg_141_2:GetHostId()
	local var_141_1 = arg_141_2:GetUserId()
	local var_141_2 = arg_141_0:GetUnitModule(var_141_0)
	local var_141_3 = arg_141_0:GetPlayerUnitModule(var_141_1)
	local var_141_4 = arg_141_0.player == var_141_3

	if var_141_4 then
		arg_141_0:GetSubView(IslandOpView):EndInteraction()
	end

	var_141_2:EndInteract(var_141_3, arg_141_2.id, not arg_141_1:AnySlotUsing(), var_141_4)
end

function var_0_0.OnWorldObjectInitStatus(arg_142_0, arg_142_1, arg_142_2)
	local var_142_0 = arg_142_0:GetUnitModule(arg_142_1.id)
	local var_142_1 = arg_142_1:GetTimeline()[arg_142_2]
	local var_142_2 = arg_142_1:GetBlackboardParam()[arg_142_2]

	var_142_0:InitStatus(arg_142_2, var_142_1, var_142_2)
end

function var_0_0.InitInteractionOpView(arg_143_0)
	arg_143_0:GetSubView(IslandOpView):EndInteraction()
end

function var_0_0.OnPlayerAreaChange(arg_144_0)
	arg_144_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnChangeDress(arg_145_0, arg_145_1, arg_145_2)
	arg_145_0.player:OnChangeDress(arg_145_1, arg_145_2)
end

function var_0_0.OnCharacterChangeDress(arg_146_0, arg_146_1, arg_146_2, arg_146_3, arg_146_4)
	local var_146_0 = arg_146_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_146_1)

	if var_146_0 then
		var_146_0:OnCharacterChangeDress(arg_146_2, arg_146_3, arg_146_4)
	end

	local var_146_1 = arg_146_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)

	for iter_146_0, iter_146_1 in ipairs(var_146_1) do
		if iter_146_1:GetDataVO():IsSameShip(arg_146_1) then
			iter_146_1:OnCharacterChangeDress(arg_146_2, arg_146_3, arg_146_4)
		end
	end

	local var_146_2 = arg_146_0:GetUnitListByKey(IslandConst.UNIT_LIST_STROLL)

	for iter_146_2, iter_146_3 in ipairs(var_146_2) do
		if iter_146_3:GetDataVO():IsSameShip(arg_146_1) then
			iter_146_3:OnCharacterChangeDress(arg_146_2, arg_146_3, arg_146_4)
		end
	end
end

function var_0_0.OnStartDelegation(arg_147_0, arg_147_1, arg_147_2)
	local var_147_0 = arg_147_0:GetSystemModule(arg_147_1.build_id)

	if var_147_0 then
		var_147_0:StartDelegation(arg_147_1)
	end

	local var_147_1 = arg_147_0:GetProductSystemModule(arg_147_1.build_id)

	if var_147_1 then
		var_147_1:StartDelegation(arg_147_2)
	end
end

function var_0_0.OnEndDelegation(arg_148_0, arg_148_1, arg_148_2)
	local var_148_0 = arg_148_0:GetSystemModule(arg_148_1.build_id)

	if var_148_0 then
		var_148_0:EndDelegation(arg_148_1)
	end
end

function var_0_0.GetPlayerPosition(arg_149_0)
	return arg_149_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_150_0, arg_150_1)
	local var_150_0 = arg_150_0:GetUnitModule(arg_150_1)

	return var_150_0 and var_150_0._go.transform.position
end

function var_0_0.OnShowUnitHudAndOpBtn(arg_151_0, arg_151_1)
	arg_151_0.currentHudUnitData = arg_151_1

	arg_151_0:GetSubView(IslandSlotHudView):ShowHud(arg_151_1.id, arg_151_1.height)
	arg_151_0:GetSubView(IslandOpView):UpdateOperationButton(arg_151_1.operationType, arg_151_1.id)

	if arg_151_1.isHighLightControl then
		arg_151_0.detectionSystem:HighLightUnitHandle(arg_151_1.id, true)
	end
end

function var_0_0.OnHideUnitHudAndOpBtn(arg_152_0, arg_152_1, arg_152_2)
	if not arg_152_0.currentHudUnitData then
		return
	end

	if arg_152_0.currentHudUnitData.id ~= arg_152_1.id or arg_152_0.currentHudUnitData.type ~= arg_152_1.type then
		return
	end

	if not arg_152_2 then
		arg_152_0.currentHudUnitData = nil
	end

	arg_152_0:GetSubView(IslandSlotHudView):HideUnitHud(arg_152_1.id)
	arg_152_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, arg_152_1.id)

	if arg_152_1.isHighLightControl then
		arg_152_0.detectionSystem:HighLightUnitHandle(arg_152_1.id, false)
	end
end

function var_0_0.OnUpdateHud(arg_153_0, arg_153_1)
	if not arg_153_0.currentHudUnitData then
		return
	end

	if arg_153_1 ~= arg_153_0.currentHudUnitData.id then
		return
	end

	arg_153_0:GetSubView(IslandSlotHudView):UpdateHud(arg_153_0.currentHudUnitData.id, arg_153_0.currentHudUnitData.height)
	arg_153_0:GetSubView(IslandOpView):UpdateOperationButton(arg_153_0.currentHudUnitData.operationType, arg_153_0.currentHudUnitData.id)
end

function var_0_0.OnUpdateHandCollectUnit(arg_154_0, arg_154_1)
	local var_154_0 = arg_154_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_154_1)

	if var_154_0 then
		var_154_0:UpdateHandCollet()
		var_154_0:ResetHp()
	end
end

function var_0_0.OnShowHud(arg_155_0, arg_155_1)
	arg_155_0:GetSubView(IslandTopHeadHudView):ShowHud(arg_155_1)
	arg_155_0:GetSubView(IslandDistanceView):ShowHud(arg_155_1.id)
end

function var_0_0.OnRefreshHud(arg_156_0, arg_156_1)
	arg_156_0:GetSubView(IslandTopHeadHudView):RefreshHud(arg_156_1)
end

function var_0_0.OnHideHud(arg_157_0, arg_157_1)
	arg_157_0:GetSubView(IslandTopHeadHudView):HideHud(arg_157_1)
	arg_157_0:GetSubView(IslandDistanceView):HideHud(arg_157_1.id)
end

function var_0_0.OnDelegateSlotStartPerform(arg_158_0, arg_158_1)
	local var_158_0 = arg_158_0:GetUnitModuleWithType(arg_158_1.type, arg_158_1.id)

	if var_158_0 then
		var_158_0:DelegateSlotStartPerform()
	end
end

function var_0_0.OnRecycleAllSlotEffct(arg_159_0)
	arg_159_0.effectMgr:RecycleAllSlotEffct()
end

function var_0_0.OnLoadDelegatePreviewRole(arg_160_0, arg_160_1, arg_160_2)
	arg_160_0.effectMgr:LoadDelegatePreviewRole(arg_160_1, arg_160_2)
end

function var_0_0.OnUnLoadDelegatePreviewRole(arg_161_0)
	arg_161_0.effectMgr:UnLoadDelegatePreviewRole()
end

function var_0_0.OnSelectSlotEffectShow(arg_162_0, arg_162_1, arg_162_2, arg_162_3, arg_162_4)
	arg_162_0.effectMgr:SelectSlotEffectShow(arg_162_1, arg_162_2, arg_162_3, arg_162_4)
end

function var_0_0.OnTakePlantAttack(arg_163_0, arg_163_1)
	local var_163_0 = arg_163_0:GetUnitModuleWithType(arg_163_1.type, arg_163_1.id)

	if var_163_0 then
		var_163_0:TakeAttack()
	end
end

function var_0_0.OnStartManage(arg_164_0, arg_164_1)
	local var_164_0 = arg_164_0:GetManageSystemModule(arg_164_1.id)

	if var_164_0 then
		var_164_0:StartManage(arg_164_1)
	end
end

function var_0_0.OnEndManage(arg_165_0, arg_165_1)
	local var_165_0 = arg_165_0:GetManageSystemModule(arg_165_1.id)

	if var_165_0 then
		var_165_0:EndManage(arg_165_1)
	end
end

function var_0_0.OnRefreshTaskInfoHud(arg_166_0)
	arg_166_0:GetSubView(IslandTopHeadHudView):UpdateAllHud()
end

function var_0_0.OnRefreshWeatherSystem(arg_167_0)
	arg_167_0.weatherSystem:Play()
end

function var_0_0.OnDispose(arg_168_0)
	arg_168_0.detectionSystem:Dispose()
	arg_168_0.effectMgr:Dispose()
	arg_168_0.coupleActionPlayer:Dispose()
	arg_168_0.coupleAction4FollowerPlayer:Dispose()
	arg_168_0.npcActionPlayer:Dispose()
	arg_168_0.weatherSystem:Dispose()
	arg_168_0.coupleNpcWordPlayer:Dispose()
	arg_168_0:GetPoolMgr():ClearFishingEffect()

	for iter_168_0, iter_168_1 in ipairs(arg_168_0.views) do
		iter_168_1:Dispose()
	end

	for iter_168_2, iter_168_3 in ipairs(arg_168_0.pathfinders) do
		iter_168_3:Dispose()
	end

	for iter_168_4, iter_168_5 in ipairs(arg_168_0:GetAllUnits()) do
		iter_168_5:Dispose()
	end

	for iter_168_6, iter_168_7 in pairs(arg_168_0.unitBuilders) do
		iter_168_7:Dispose()
	end

	for iter_168_8, iter_168_9 in pairs(arg_168_0.systemBuilders) do
		iter_168_9:Dispose()
	end

	for iter_168_10, iter_168_11 in pairs(arg_168_0.fishingSynPlayers) do
		iter_168_11:Dispose()
	end

	arg_168_0.fishingSynPlayers = nil
	arg_168_0.npcActionPlayer = nil
	arg_168_0.coupleActionPlayer = nil
	arg_168_0.coupleAction4FollowerPlayer = nil
	arg_168_0.pathfinders = nil
	arg_168_0.unitBuilders = nil
	arg_168_0.systemBuilders = nil
	arg_168_0.views = nil
	arg_168_0.player = nil
	arg_168_0.isInit = false
	arg_168_0._unitList = nil
	arg_168_0.detectionSystem = nil
	arg_168_0.effectMgr = nil
	arg_168_0.coupleNpcWordPlayer = nil
end

return var_0_0
