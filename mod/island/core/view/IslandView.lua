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
	arg_1_0:RegisterUnitList(IslandConst.UNIT_LIST_CHEATER_ITEM)

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
		[IslandConst.UNIT_TYPE_DELEGATE_FISH] = IslandDelegationFishBuilder.New(arg_1_0, IslandConst.UNIT_LIST_DELEGATE_UNIT),
		[IslandConst.UNIT_TYPE_CHEATERTAVERN_PLAYER] = IslandCheaterTavernPlayerBuilder.New(arg_1_0, IslandConst.UNIT_LIST_PLAYER),
		[IslandConst.UNIT_TYPE_CHEATERTAVERN_TABLE] = IslandCheaterTavernTableBuilder.New(arg_1_0, IslandConst.UNIT_LIST_CHEATER_ITEM),
		[IslandConst.UNIT_TYPE_CHEATERTAVERN_CHAIR] = IslandCheaterTavernChairBuilder.New(arg_1_0, IslandConst.UNIT_LIST_CHEATER_ITEM)
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

	arg_1_0:CreateViews()
end

function var_0_0.CreateViews(arg_2_0)
	arg_2_0.views = {
		arg_2_0:CreateInteractionView(),
		arg_2_0:CreateDistanceView(),
		arg_2_0:CreateSeedOpView(),
		arg_2_0:CreateOpView(),
		arg_2_0:CreateSlotHudView(),
		arg_2_0:CreateTopHeadHudView(),
		arg_2_0:CreateBottomHeadHudeView(),
		arg_2_0:CreateCancelAnimationOpView(),
		arg_2_0:CreateAnimationOpView()
	}
end

function var_0_0.DoEnter(arg_3_0)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0:GetAllUnits()) do
		table.insert(var_3_0, function(arg_4_0)
			iter_3_1:Start()

			if iter_3_0 % 3 == 0 then
				arg_4_0()
			else
				onNextTick(arg_4_0)
			end
		end)
	end

	seriesAsync(var_3_0, function()
		arg_3_0.isInit = true
	end)
end

function var_0_0.GetSubView(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.views or {}) do
		if isa(iter_6_1, arg_6_1) then
			return iter_6_1
		end
	end

	return nil
end

function var_0_0.CreateOpView(arg_7_0)
	return IslandOpView.New(arg_7_0)
end

function var_0_0.CreateSlotHudView(arg_8_0)
	return IslandSlotHudView.New(arg_8_0)
end

function var_0_0.CreateCancelAnimationOpView(arg_9_0)
	return IslandCancelAnimationOpView.New(arg_9_0)
end

function var_0_0.CreateTopHeadHudView(arg_10_0)
	return IslandTopHeadHudView.New(arg_10_0)
end

function var_0_0.CreateBottomHeadHudeView(arg_11_0)
	return IslandBottomHeadHudView.New(arg_11_0)
end

function var_0_0.CreateAnimationOpView(arg_12_0)
	return IslandAniamtionOpView.New(arg_12_0)
end

function var_0_0.CreateInteractionView(arg_13_0)
	return IslandInteractionView.New(arg_13_0)
end

function var_0_0.CreateDistanceView(arg_14_0)
	return IslandDistanceView.New(arg_14_0)
end

function var_0_0.CreateSeedOpView(arg_15_0)
	return IslandSeedOpView.New(arg_15_0)
end

function var_0_0.IsLoaded(arg_16_0)
	local var_16_0 = arg_16_0:GetAllUnits()

	return _.all(arg_16_0.views, function(arg_17_0)
		return arg_17_0:IsLoaded()
	end) and #var_16_0 > 0 and _.all(var_16_0, function(arg_18_0)
		return arg_18_0:IsLoaded()
	end)
end

function var_0_0.IsInit(arg_19_0)
	return arg_19_0.isInit
end

function var_0_0.Update(arg_20_0)
	if not arg_20_0.isInit then
		return
	end

	for iter_20_0, iter_20_1 in ipairs(arg_20_0:GetAllUnits()) do
		iter_20_1:Update()
	end

	for iter_20_2, iter_20_3 in ipairs(arg_20_0.views) do
		iter_20_3:Update()
	end

	for iter_20_4, iter_20_5 in ipairs(arg_20_0.pathfinders) do
		iter_20_5:Update()
	end

	if arg_20_0.needTryTrack then
		arg_20_0:TryTrack()
	end

	if arg_20_0.needTryMainTrack then
		arg_20_0:TryMainTrack()
	end
end

function var_0_0.LateUpdate(arg_21_0)
	if not arg_21_0.isInit then
		return
	end

	for iter_21_0, iter_21_1 in ipairs(arg_21_0:GetAllUnits()) do
		iter_21_1:LateUpdate()
	end

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.views) do
		iter_21_3:LateUpdate()
	end

	for iter_21_4, iter_21_5 in ipairs(arg_21_0.pathfinders) do
		iter_21_5:LateUpdate()
	end
end

function var_0_0.AddListeners(arg_22_0)
	arg_22_0:AddListener(ISLAND_EVT.GEN_UNIT, arg_22_0.OnGenUnit)
	arg_22_0:AddListener(ISLAND_EVT.RMOVE_UNIT, arg_22_0.OnRemoveUnit)
	arg_22_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_22_0.OnInterActionBegin)
	arg_22_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_22_0.OnInterActionEnd)
	arg_22_0:AddListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_22_0.OnStopUnit)
	arg_22_0:AddListener(ISLAND_EVT.MOVE_UNIT, arg_22_0.OnMoveUnit)
	arg_22_0:AddListener(ISLAND_EVT.INIT_FINISH, arg_22_0.OnSceneInited)
	arg_22_0:AddListener(ISLAND_EVT.MOVE_PLAYER, arg_22_0.OnPlayerMove)
	arg_22_0:AddListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_22_0.OnPlayerStopMoveHandle)
	arg_22_0:AddListener(ISLAND_EVT.JUMP_PLAYER, arg_22_0.OnPlayerJump)
	arg_22_0:AddListener(ISLAND_EVT.APPROACH_UNIT, arg_22_0.OnShowInterActionPanel)
	arg_22_0:AddListener(ISLAND_EVT.LEAVE_UNIT, arg_22_0.OnHideInterActionPanel)
	arg_22_0:AddListener(ISLAND_EVT.TRACKING, arg_22_0.OnTracking)
	arg_22_0:AddListener(ISLAND_EVT.UNTRACKING, arg_22_0.OnUnTracking)
	arg_22_0:AddListener(ISLAND_EVT.AREACHANGE, arg_22_0.OnPlayerAreaChange)
	arg_22_0:AddListener(ISLAND_EVT.PLAYERRUN, arg_22_0.OnPlayerPlayerRun)
	arg_22_0:AddListener(ISLAND_EVT.SPRINT_PLAYER, arg_22_0.OnPlayerPlayerSprint)
	arg_22_0:AddListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_22_0.OnStopPlayerSprint)
	arg_22_0:AddListener(ISLAND_EVT.CHANGE_DRESS, arg_22_0.OnChangeDress)
	arg_22_0:AddListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_22_0.OnCharacterChangeDress)
	arg_22_0:AddListener(ISLAND_EVT.RESET_UNIT_POS, arg_22_0.OnResetUnitPos)
	arg_22_0:AddListener(ISLAND_EVT.RESET_UNIT_ROT, arg_22_0.OnResetUnitRotation)
	arg_22_0:AddListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_22_0.OnAnyPageOpen)
	arg_22_0:AddListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_22_0.OnAllPageClose)
	arg_22_0:AddListener(ISLAND_EVT.Change_TakePhoto_Model, arg_22_0.OnChangeTakePhotoModel)
	arg_22_0:AddListener(ISLAND_EVT.Change_Photo_Height, arg_22_0.OnChange_Photo_Height)
	arg_22_0:AddListener(ISLAND_EVT.SetOpMoveBtnActve, arg_22_0.OnSetOpMoveBtnActve)
	arg_22_0:AddListener(ISLAND_EVT.PLAY_BUBBLE, arg_22_0.OnPlayChatBubble)
	arg_22_0:AddListener(ISLAND_EVT.RAW_PLAY_BUBBLE, arg_22_0.OnRawPlayChatBubble)
	arg_22_0:AddListener(ISLAND_EVT.RAW_STOP_BUBBLE, arg_22_0.OnRawStopChatBubble)
	arg_22_0:AddListener(ISLAND_EVT.START_STORY, arg_22_0.OnStartStory)
	arg_22_0:AddListener(ISLAND_EVT.END_STORY, arg_22_0.OnEndStory)
	arg_22_0:AddListener(ISLAND_EVT.START_DEGATION, arg_22_0.OnStartDelegation)
	arg_22_0:AddListener(ISLAND_EVT.END_DEGATION, arg_22_0.OnEndDelegation)
	arg_22_0:AddListener(ISLAND_EVT.GEN_SYSTEM, arg_22_0.OnGenSystem)
	arg_22_0:AddListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_22_0.OnWorldObjectStartInteraction)
	arg_22_0:AddListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_22_0.OnWorldObjectEndInteraction)
	arg_22_0:AddListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_22_0.OnWorldObjectInitStatus)
	arg_22_0:AddListener(ISLAND_EVT.INIT_INTERACTION_OP_VIEW, arg_22_0.InitInteractionOpView)
	arg_22_0:AddListener(ISLAND_EVT.REFRESH_INTERACTION, arg_22_0.OnRefreshInteractionBtn)
	arg_22_0:AddListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_22_0.OnShowUnitHudAndOpBtn)
	arg_22_0:AddListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_22_0.OnHideUnitHudAndOpBtn)
	arg_22_0:AddListener(ISLAND_EVT.DETECTOR_CHANGED, arg_22_0.OnDetectorChanged)
	arg_22_0:AddListener(ISLAND_EVT.SELECTED_DETECTOR, arg_22_0.OnDetectorSelected)
	arg_22_0:AddListener(ISLAND_EVT.FISHPOINT_DETECTOR, arg_22_0.OnFishPointSelected)
	arg_22_0:AddListener(ISLAND_EVT.NPC_DETECTED, arg_22_0.OnNpcDetectorSelected)
	arg_22_0:AddListener(ISLAND_EVT.NO_NPC_DETECTED, arg_22_0.OnNpcDetectorUnSelected)
	arg_22_0:AddListener(ISLAND_EVT.SET_PLAYER_WORK, arg_22_0.OnPlayerWork)
	arg_22_0:AddListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_22_0.OnPlayerDeviceStateChange)
	arg_22_0:AddListener(ISLAND_EVT.UPDATE_HUD, arg_22_0.OnUpdateHud)
	arg_22_0:AddListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_22_0.OnUpdateHandCollectUnit)
	arg_22_0:AddListener(ISLAND_EVT.START_DELEGATE_SLOT_PERFORM, arg_22_0.OnDelegateSlotStartPerform)
	arg_22_0:AddListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_22_0.OnRecycleAllSlotEffct)
	arg_22_0:AddListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_22_0.OnSelectSlotEffectShow)
	arg_22_0:AddListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_22_0.OnLoadDelegatePreviewRole)
	arg_22_0:AddListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_22_0.OnUnLoadDelegatePreviewRole)
	arg_22_0:AddListener(ISLAND_EVT.Take_Plant_Attact, arg_22_0.OnTakePlantAttack)
	arg_22_0:AddListener(ISLAND_EVT.START_MANAGE, arg_22_0.OnStartManage)
	arg_22_0:AddListener(ISLAND_EVT.END_MANAGE, arg_22_0.OnEndManage)
	arg_22_0:AddListener(ISLAND_EVT.SHOW_HUD, arg_22_0.OnShowHud)
	arg_22_0:AddListener(ISLAND_EVT.HIDE_HUD, arg_22_0.OnHideHud)
	arg_22_0:AddListener(ISLAND_EVT.REFRESH_HUD, arg_22_0.OnRefreshHud)
	arg_22_0:AddListener(ISLAND_EVT.START_GUIDE, arg_22_0.OnStartGuide)
	arg_22_0:AddListener(ISLAND_EVT.END_GUIDE, arg_22_0.OnEndGuide)
	arg_22_0:AddListener(ISLAND_EVT.START_PERFORMANCE, arg_22_0.OnStartPerformance)
	arg_22_0:AddListener(ISLAND_EVT.END_PERFORMANCE, arg_22_0.OnEndPerformance)
	arg_22_0:AddListener(ISLAND_EVT.DISABLE_INPUT, arg_22_0.DisableInput)
	arg_22_0:AddListener(ISLAND_EVT.ENABLE_INPUT, arg_22_0.EnableInput)
	arg_22_0:AddListener(ISLAND_EVT.GEN_PATH_FINDER, arg_22_0.OnGenPathFinder)
	arg_22_0:AddListener(ISLAND_EVT.REMOVE_PATH_FINDER, arg_22_0.OnRemovePathFinder)
	arg_22_0:AddListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_22_0.OnActiveOrDisactiveUnit)
	arg_22_0:AddListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_22_0.OnOpenAniamtionOpPage)
	arg_22_0:AddListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_22_0.OnCloseAniamtionOpPage)
	arg_22_0:AddListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_22_0.OnMovePlayerBefore)
	arg_22_0:AddListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_22_0.OnRefreshTaskInfoHud)
	arg_22_0:AddListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_22_0.OnResponAniamtionOp)
	arg_22_0:AddListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_22_0.OnChangeVisterDress)
	arg_22_0:AddListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_22_0.OnSetVisitorSyncData)
	arg_22_0:AddListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_22_0.OnShowNpcAniamtionBubble)
	arg_22_0:AddListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_22_0.OnHideNpcAniamtionBubble)
	arg_22_0:AddListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_22_0.OnPlaySingleAnimationEnd)
	arg_22_0:AddListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_22_0.OnUpdateCustomOpPositon)
	arg_22_0:AddListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_22_0.OnChatMsgUpdate)
	arg_22_0:AddListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_22_0.OnChatRoomChange)
	arg_22_0:AddListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_22_0.OnShowChatMsg)
	arg_22_0:AddListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_22_0.OnResetFollowRandomizer)
	arg_22_0:AddListener(ISLAND_EVT.ADD_FOLLOWER, arg_22_0.OnFollowerAdd)
	arg_22_0:AddListener(ISLAND_EVT.WILL_DEL_FOLLOWER, arg_22_0.OnFollowerWillDelStep1)
	arg_22_0:AddListener(ISLAND_EVT.DO_DEL_FOLLOWER, arg_22_0.OnFollowerWillDelStep2)
	arg_22_0:AddListener(ISLAND_EVT.DEL_FOLLOWER, arg_22_0.OnFollowerDel)
	arg_22_0:AddListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_22_0.OnCoupleActionWithFollower)
	arg_22_0:AddListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_22_0.OnLockPlayerInput)
	arg_22_0:AddListener(ISLAND_EVT.START_COUPLE_ACTION, arg_22_0.OnStartCoupleAction)
	arg_22_0:AddListener(ISLAND_EVT.END_COUPLE_ACTION, arg_22_0.OnEndCoupleAction)
	arg_22_0:AddListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_22_0.OnRefreshWeatherSystem)
	arg_22_0:AddListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_22_0.OnSystemUnlock)
	arg_22_0:AddListener(ISLAND_EVT.START_DO_COUPLE_ACTION, arg_22_0.OnStartDoCoupleAction)
	arg_22_0:AddListener(ISLAND_EVT.END_DO_COUPLE_ACTION, arg_22_0.OnEndDoCoupleAction)
	arg_22_0:AddListener(ISLAND_EVT.CANCEL_COUPLE_ACTION, arg_22_0.OnCancelCoupleAction)
	arg_22_0:AddListener(ISLAND_EVT.BAIT_UPDATE, arg_22_0.OnBaitUpdate)
	arg_22_0:AddListener(ISLAND_EVT.START_FISHING, arg_22_0.OnStartFishing)
	arg_22_0:AddListener(ISLAND_EVT.FISHING_STATE_CHANGE, arg_22_0.OnFishingStateChange)
	arg_22_0:AddListener(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, arg_22_0.OnAllDailyOrWeeklyFinish)
end

function var_0_0.RemoveListeners(arg_23_0)
	arg_23_0:RemoveListener(ISLAND_EVT.GEN_UNIT, arg_23_0.OnGenUnit)
	arg_23_0:RemoveListener(ISLAND_EVT.RMOVE_UNIT, arg_23_0.OnRemoveUnit)
	arg_23_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_23_0.OnInterActionBegin)
	arg_23_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_23_0.OnInterActionEnd)
	arg_23_0:RemoveListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_23_0.OnStopUnit)
	arg_23_0:RemoveListener(ISLAND_EVT.MOVE_UNIT, arg_23_0.OnMoveUnit)
	arg_23_0:RemoveListener(ISLAND_EVT.INIT_FINISH, arg_23_0.OnSceneInited)
	arg_23_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER, arg_23_0.OnPlayerMove)
	arg_23_0:RemoveListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_23_0.OnPlayerStopMoveHandle)
	arg_23_0:RemoveListener(ISLAND_EVT.JUMP_PLAYER, arg_23_0.OnPlayerJump)
	arg_23_0:RemoveListener(ISLAND_EVT.APPROACH_UNIT, arg_23_0.OnShowInterActionPanel)
	arg_23_0:RemoveListener(ISLAND_EVT.LEAVE_UNIT, arg_23_0.OnHideInterActionPanel)
	arg_23_0:RemoveListener(ISLAND_EVT.TRACKING, arg_23_0.OnTracking)
	arg_23_0:RemoveListener(ISLAND_EVT.UNTRACKING, arg_23_0.OnUnTracking)
	arg_23_0:RemoveListener(ISLAND_EVT.AREACHANGE, arg_23_0.OnPlayerAreaChange)
	arg_23_0:RemoveListener(ISLAND_EVT.PLAYERRUN, arg_23_0.OnPlayerPlayerRun)
	arg_23_0:RemoveListener(ISLAND_EVT.SPRINT_PLAYER, arg_23_0.OnPlayerPlayerSprint)
	arg_23_0:RemoveListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_23_0.OnStopPlayerSprint)
	arg_23_0:RemoveListener(ISLAND_EVT.CHANGE_DRESS, arg_23_0.OnChangeDress)
	arg_23_0:RemoveListener(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_23_0.OnCharacterChangeDress)
	arg_23_0:RemoveListener(ISLAND_EVT.RESET_UNIT_POS, arg_23_0.OnResetUnitPos)
	arg_23_0:RemoveListener(ISLAND_EVT.RESET_UNIT_ROT, arg_23_0.OnResetUnitRotation)
	arg_23_0:RemoveListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_23_0.OnAnyPageOpen)
	arg_23_0:RemoveListener(ISLAND_EVT.Change_TakePhoto_Model, arg_23_0.OnChangeTakePhotoModel)
	arg_23_0:RemoveListener(ISLAND_EVT.Change_Photo_Height, arg_23_0.OnChange_Photo_Height)
	arg_23_0:RemoveListener(ISLAND_EVT.SetOpMoveBtnActve, arg_23_0.OnSetOpMoveBtnActve)
	arg_23_0:RemoveListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_23_0.OnAllPageClose)
	arg_23_0:RemoveListener(ISLAND_EVT.PLAY_BUBBLE, arg_23_0.OnPlayChatBubble)
	arg_23_0:RemoveListener(ISLAND_EVT.RAW_PLAY_BUBBLE, arg_23_0.OnRawPlayChatBubble)
	arg_23_0:RemoveListener(ISLAND_EVT.RAW_STOP_BUBBLE, arg_23_0.OnRawStopChatBubble)
	arg_23_0:RemoveListener(ISLAND_EVT.START_STORY, arg_23_0.OnStartStory)
	arg_23_0:RemoveListener(ISLAND_EVT.END_STORY, arg_23_0.OnEndStory)
	arg_23_0:RemoveListener(ISLAND_EVT.START_DEGATION, arg_23_0.OnStartDelegation)
	arg_23_0:RemoveListener(ISLAND_EVT.END_DEGATION, arg_23_0.OnEndDelegation)
	arg_23_0:RemoveListener(ISLAND_EVT.GEN_SYSTEM, arg_23_0.OnGenSystem)
	arg_23_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, arg_23_0.OnWorldObjectStartInteraction)
	arg_23_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, arg_23_0.OnWorldObjectEndInteraction)
	arg_23_0:RemoveListener(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, arg_23_0.OnWorldObjectInitStatus)
	arg_23_0:RemoveListener(ISLAND_EVT.INIT_INTERACTION_OP_VIEW, arg_23_0.InitInteractionOpView)
	arg_23_0:RemoveListener(ISLAND_EVT.REFRESH_INTERACTION, arg_23_0.OnRefreshInteractionBtn)
	arg_23_0:RemoveListener(ISLAND_EVT.SHOW_UNIT_HUD_OP, arg_23_0.OnShowUnitHudAndOpBtn)
	arg_23_0:RemoveListener(ISLAND_EVT.HIDE_UNIT_HUD_OP, arg_23_0.OnHideUnitHudAndOpBtn)
	arg_23_0:RemoveListener(ISLAND_EVT.DETECTOR_CHANGED, arg_23_0.OnDetectorChanged)
	arg_23_0:RemoveListener(ISLAND_EVT.SELECTED_DETECTOR, arg_23_0.OnDetectorSelected)
	arg_23_0:RemoveListener(ISLAND_EVT.FISHPOINT_DETECTOR, arg_23_0.OnFishPointSelected)
	arg_23_0:RemoveListener(ISLAND_EVT.NPC_DETECTED, arg_23_0.OnNpcDetectorSelected)
	arg_23_0:RemoveListener(ISLAND_EVT.NO_NPC_DETECTED, arg_23_0.OnNpcDetectorUnSelected)
	arg_23_0:RemoveListener(ISLAND_EVT.SET_PLAYER_WORK, arg_23_0.OnPlayerWork)
	arg_23_0:RemoveListener(ISLAND_EVT.DEVIEE_STATE_CHANGE, arg_23_0.OnPlayerDeviceStateChange)
	arg_23_0:RemoveListener(ISLAND_EVT.UPDATE_HUD, arg_23_0.OnUpdateHud)
	arg_23_0:RemoveListener(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, arg_23_0.OnUpdateHandCollectUnit)
	arg_23_0:RemoveListener(ISLAND_EVT.RECYCLE_ALL_SLOTDELEEFFECT, arg_23_0.OnRecycleAllSlotEffct)
	arg_23_0:RemoveListener(ISLAND_EVT.SELECTDELEEFFECT_SHOW, arg_23_0.OnSelectSlotEffectShow)
	arg_23_0:RemoveListener(ISLAND_EVT.LOAD_DELEGATE_PREVIEW_ROLE, arg_23_0.OnLoadDelegatePreviewRole)
	arg_23_0:RemoveListener(ISLAND_EVT.UN_LOAD_DELEGATE_PREVIEW_ROLE, arg_23_0.OnUnLoadDelegatePreviewRole)
	arg_23_0:RemoveListener(ISLAND_EVT.Take_Plant_Attact, arg_23_0.OnTakePlantAttack)
	arg_23_0:RemoveListener(ISLAND_EVT.START_MANAGE, arg_23_0.OnStartManage)
	arg_23_0:RemoveListener(ISLAND_EVT.END_MANAGE, arg_23_0.OnEndManage)
	arg_23_0:RemoveListener(ISLAND_EVT.SHOW_HUD, arg_23_0.OnShowHud)
	arg_23_0:RemoveListener(ISLAND_EVT.HIDE_HUD, arg_23_0.OnHideHud)
	arg_23_0:RemoveListener(ISLAND_EVT.REFRESH_HUD, arg_23_0.OnRefreshHud)
	arg_23_0:RemoveListener(ISLAND_EVT.START_GUIDE, arg_23_0.OnStartGuide)
	arg_23_0:RemoveListener(ISLAND_EVT.END_GUIDE, arg_23_0.OnEndGuide)
	arg_23_0:RemoveListener(ISLAND_EVT.START_PERFORMANCE, arg_23_0.OnStartPerformance)
	arg_23_0:RemoveListener(ISLAND_EVT.END_PERFORMANCE, arg_23_0.OnEndPerformance)
	arg_23_0:RemoveListener(ISLAND_EVT.DISABLE_INPUT, arg_23_0.DisableInput)
	arg_23_0:RemoveListener(ISLAND_EVT.ENABLE_INPUT, arg_23_0.EnableInput)
	arg_23_0:RemoveListener(ISLAND_EVT.GEN_PATH_FINDER, arg_23_0.OnGenPathFinder)
	arg_23_0:RemoveListener(ISLAND_EVT.REMOVE_PATH_FINDER, arg_23_0.OnRemovePathFinder)
	arg_23_0:RemoveListener(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_23_0.OnActiveOrDisactiveUnit)
	arg_23_0:RemoveListener(ISLAND_EVT.OPEN_ANIMATION_OP, arg_23_0.OnOpenAniamtionOpPage)
	arg_23_0:RemoveListener(ISLAND_EVT.CLOSE_ANIMATION_OP, arg_23_0.OnCloseAniamtionOpPage)
	arg_23_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER_BEFORE, arg_23_0.OnMovePlayerBefore)
	arg_23_0:RemoveListener(ISLAND_EVT.REFRESH_TASK_HUD_INFO, arg_23_0.OnRefreshTaskInfoHud)
	arg_23_0:RemoveListener(ISLAND_EVT.RESPON_ANIMATION_OP, arg_23_0.OnResponAniamtionOp)
	arg_23_0:RemoveListener(ISLAND_EVT.CHANGE_VISTER_DRESS, arg_23_0.OnChangeVisterDress)
	arg_23_0:RemoveListener(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_23_0.OnSetVisitorSyncData)
	arg_23_0:RemoveListener(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, arg_23_0.OnShowNpcAniamtionBubble)
	arg_23_0:RemoveListener(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, arg_23_0.OnHideNpcAniamtionBubble)
	arg_23_0:RemoveListener(ISLAND_EVT.PLAY_SIGNLE_ANIMATION_END, arg_23_0.OnPlaySingleAnimationEnd)
	arg_23_0:RemoveListener(ISLAND_EVT.UPDATE_CUSTOM_OP_POSITON, arg_23_0.OnUpdateCustomOpPositon)
	arg_23_0:RemoveListener(ISLAND_EVT.CHAT_MSG_UPDATE, arg_23_0.OnChatMsgUpdate)
	arg_23_0:RemoveListener(ISLAND_EVT.CHAT_ROOM_UPDATE, arg_23_0.OnChatRoomChange)
	arg_23_0:RemoveListener(ISLAND_EVT.SHOW_CHAT_MSG, arg_23_0.OnShowChatMsg)
	arg_23_0:RemoveListener(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, arg_23_0.OnResetFollowRandomizer)
	arg_23_0:RemoveListener(ISLAND_EVT.ADD_FOLLOWER, arg_23_0.OnFollowerAdd)
	arg_23_0:RemoveListener(ISLAND_EVT.WILL_DEL_FOLLOWER, arg_23_0.OnFollowerWillDelStep1)
	arg_23_0:RemoveListener(ISLAND_EVT.DO_DEL_FOLLOWER, arg_23_0.OnFollowerWillDelStep2)
	arg_23_0:RemoveListener(ISLAND_EVT.DEL_FOLLOWER, arg_23_0.OnFollowerDel)
	arg_23_0:RemoveListener(ISLAND_EVT.COUPLE_ACTION_WITH_FOLLOWER, arg_23_0.OnCoupleActionWithFollower)
	arg_23_0:RemoveListener(ISLAND_EVT.LOCK_PLAYER_INPUT, arg_23_0.OnLockPlayerInput)
	arg_23_0:RemoveListener(ISLAND_EVT.START_COUPLE_ACTION, arg_23_0.OnStartCoupleAction)
	arg_23_0:RemoveListener(ISLAND_EVT.END_COUPLE_ACTION, arg_23_0.OnEndCoupleAction)
	arg_23_0:RemoveListener(ISLAND_EVT.REFRESH_WEATHER_SYSTEM, arg_23_0.OnRefreshWeatherSystem)
	arg_23_0:RemoveListener(ISLAND_EVT.SYSTEM_UNLOCK, arg_23_0.OnSystemUnlock)
	arg_23_0:RemoveListener(ISLAND_EVT.START_DO_COUPLE_ACTION, arg_23_0.OnStartDoCoupleAction)
	arg_23_0:RemoveListener(ISLAND_EVT.END_DO_COUPLE_ACTION, arg_23_0.OnEndDoCoupleAction)
	arg_23_0:RemoveListener(ISLAND_EVT.CANCEL_COUPLE_ACTION, arg_23_0.OnCancelCoupleAction)
	arg_23_0:RemoveListener(ISLAND_EVT.BAIT_UPDATE, arg_23_0.OnBaitUpdate)
	arg_23_0:RemoveListener(ISLAND_EVT.START_FISHING, arg_23_0.OnStartFishing)
	arg_23_0:RemoveListener(ISLAND_EVT.FISHING_STATE_CHANGE, arg_23_0.OnFishingStateChange)
	arg_23_0:RemoveListener(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, arg_23_0.OnAllDailyOrWeeklyFinish)
end

function var_0_0.OnBaitUpdate(arg_24_0, arg_24_1)
	arg_24_0:GetSubView(IslandOpView):UpdateLureBtn()
end

function var_0_0.OnFishPointSelected(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1.node

	if not var_25_0 then
		return
	end

	local var_25_1 = var_25_0:GetBlackboardVariable("FishPoint")

	if not var_25_1 or var_25_1 == "" then
		arg_25_0:UnSelectedFishPoint()
	else
		local var_25_2, var_25_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_25_1)
		local var_25_4 = arg_25_0:GetUnitModuleWithType(var_25_2, var_25_3)

		if var_25_4 then
			arg_25_0:SelectedFishPoint(var_25_4)
		end
	end
end

function var_0_0.OnAllDailyOrWeeklyFinish(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_26_1 = {}

	for iter_26_0, iter_26_1 in ipairs(var_26_0) do
		if not iter_26_1:IsExitState() then
			table.insert(var_26_1, iter_26_1)
		end
	end

	if #var_26_1 <= 0 then
		return
	end

	for iter_26_2, iter_26_3 in ipairs(var_26_1) do
		iter_26_3:StopMove()
		iter_26_3:PlayAnimation(arg_26_1)
	end
end

function var_0_0.OnSystemUnlock(arg_27_0, arg_27_1)
	if arg_27_1 == IslandAblityAgency.ANIMATION_OP_ID then
		arg_27_0:GetSubView(IslandOpView):UpdateAnimationOpBtn()
	end
end

function var_0_0.SelectedFishPoint(arg_28_0, arg_28_1)
	if not arg_28_0:GetSelfIsland():GetAblityAgency():IsUnlockFishing() or arg_28_1:GetUnitType() ~= IslandConst.UNIT_LIST_FISH_POINT or arg_28_0.player:StandOnWorldObject() or not arg_28_0.player:OnGrouded() then
		return
	end

	arg_28_0:UnSelectedFishPoint()

	arg_28_0.selectedFishPointId = arg_28_1.id

	arg_28_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.Fishing, arg_28_1.id)
end

function var_0_0.UnSelectedFishPoint(arg_29_0)
	if arg_29_0.selectedFishPointId then
		local var_29_0 = arg_29_0.selectedFishPointId

		arg_29_0.selectedFishPointId = nil

		arg_29_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, var_29_0)
	end
end

function var_0_0.OnStartFishing(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1.unitId
	local var_30_1 = arg_30_0:GetPlayerUnitModule(var_30_0)

	if not var_30_1 then
		return
	end

	if not isa(var_30_1, IslandVisitorUnit) then
		return
	end

	var_30_1:Sleep()

	local var_30_2 = arg_30_1.fishPointId
	local var_30_3 = arg_30_1.rodId
	local var_30_4 = arg_30_1.fishId
	local var_30_5 = pg.island_fish_rod[var_30_3].attachment_id
	local var_30_6 = IslandVistorFishingPlayer.New(arg_30_0, var_30_1, var_30_2, var_30_5, var_30_4)

	var_30_6:Play()

	arg_30_0.fishingSynPlayers[var_30_0] = var_30_6
end

function var_0_0.OnFishingStateChange(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1.op
	local var_31_1 = arg_31_1.unitId
	local var_31_2 = arg_31_0:GetPlayerUnitModule(var_31_1)
	local var_31_3 = arg_31_0.fishingSynPlayers[var_31_1]

	if not isa(var_31_2, IslandVisitorUnit) then
		return
	end

	if not var_31_3 or not var_31_3:IsSameFishPoint(arg_31_1.fishPointId) then
		return
	end

	local function var_31_4()
		var_31_2:WakeUp()
		arg_31_0.fishingSynPlayers[var_31_1]:Dispose()

		arg_31_0.fishingSynPlayers[var_31_1] = nil
	end

	if var_31_0 == IslandConst.FISHING_OP_CANCEL then
		var_31_3:OnCancel(var_31_4)
	elseif var_31_0 == IslandConst.FISHING_OP_FAILD then
		var_31_3:OnFailed(var_31_4)
	elseif var_31_0 == IslandConst.FISHING_OP_SUCCESS then
		var_31_3:OnSuccess(var_31_4)
	end
end

function var_0_0.OnStartCoupleAction(arg_33_0)
	arg_33_0:UnBlockLayer1Event(false)
	arg_33_0:GetSubView(IslandAniamtionOpView):OnStartCoupleAction()
end

function var_0_0.OnEndCoupleAction(arg_34_0)
	arg_34_0:UnBlockLayer1Event(true)
	arg_34_0:GetSubView(IslandAniamtionOpView):OnEndCoupleAction()
end

function var_0_0.OnCancelCoupleAction(arg_35_0)
	if arg_35_0.coupleActionPlayer and arg_35_0.coupleActionPlayer:IsPlaying() then
		arg_35_0.coupleActionPlayer:Stop()
	end

	if arg_35_0.coupleAction4FollowerPlayer and arg_35_0.coupleAction4FollowerPlayer:IsPlaying() then
		arg_35_0.coupleAction4FollowerPlayer:Stop()
	end

	arg_35_0:OnEndCoupleAction()
end

function var_0_0.OnCoupleActionWithFollower(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_36_1 = arg_36_0:GetPlayerPosition()
	local var_36_2 = pg.island_set.action_bubble_range.key_value_int
	local var_36_3 = _.select(var_36_0, function(arg_37_0)
		return not arg_37_0:IsExitState() and Vector3.Distance(arg_37_0:GetPosition(), var_36_1) <= var_36_2
	end)

	if #var_36_3 <= 0 then
		return
	end

	local var_36_4 = var_36_3[math.random(1, #var_36_3)]
	local var_36_5 = pg.island_action[arg_36_1]

	arg_36_0.coupleAction4FollowerPlayer:Play(var_36_4, arg_36_0.player, var_36_5)
	arg_36_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
end

function var_0_0.OnFollowerAdd(arg_38_0, arg_38_1)
	if arg_38_0:GetSelectedNpcId() then
		local var_38_0, var_38_1 = IslandCalcUtil.GetTypeAndIdByUniqueId(arg_38_0:GetSelectedNpcId())

		if var_38_1 == arg_38_1 then
			arg_38_0.selectedNpcId = nil
		end
	end

	arg_38_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_38_0.coupleNpcWordPlayer:Play(arg_38_1)
end

function var_0_0.OnFollowerWillDelStep1(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)
	local var_39_1

	for iter_39_0, iter_39_1 in ipairs(var_39_0) do
		if iter_39_1:GetDataVO():IsSameShip(arg_39_1) then
			var_39_1 = iter_39_1

			break
		end
	end

	if not var_39_1 or var_39_1:IsExitState() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_follower_exiting_tip"))

		return
	end

	var_39_1:DoExitHandle()
end

function var_0_0.OnFollowerWillDelStep2(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1.node

	if not var_40_0 then
		return
	end

	local var_40_1 = var_40_0:GetComponent(typeof(WorldObjectItem)).uniqueId
	local var_40_2, var_40_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_40_1)
	local var_40_4 = arg_40_0:GetUnitModuleWithType(var_40_2, var_40_3)

	if not var_40_4 then
		return
	end

	arg_40_0:NotifiyMeditor(IslandMediator.DEL_FOLLOWER, var_40_4:GetDataVO():GetShipId())
end

function var_0_0.OnFollowerDel(arg_41_0, arg_41_1)
	arg_41_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_41_0.coupleNpcWordPlayer:Stop(arg_41_1)
end

function var_0_0.OnResetFollowRandomizer(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0:GetFollowerModule(arg_42_1)

	if not var_42_0 then
		return
	end

	var_42_0:SetBtRandomizer()
end

function var_0_0.OnShowChatMsg(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1.player.id
	local var_43_1 = arg_43_0:GetPlayerUnitModule(var_43_0)

	if not var_43_1 then
		return
	end

	arg_43_0:GetSubView(IslandTopHeadHudView):PlayChat(var_43_1, arg_43_1.emojiId, arg_43_1.content, nil)
end

function var_0_0.OnChatRoomChange(arg_44_0)
	arg_44_0:GetSubView(IslandAniamtionOpView):UpdateChatRoom()
end

function var_0_0.OnChatMsgUpdate(arg_45_0)
	arg_45_0:GetSubView(IslandAniamtionOpView):UpdateMsgList()
end

function var_0_0.OnPlaySingleAnimationEnd(arg_46_0, arg_46_1)
	if not arg_46_0:GetSelectedNpcId() then
		arg_46_0.npcActionPlayer:ResoponByRandom(arg_46_0.player, arg_46_1)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(1, arg_46_1, 0, 0, 0, 0))

		return
	end

	local var_46_0 = arg_46_0:GetSelectedNpcId()
	local var_46_1, var_46_2 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_46_0)
	local var_46_3 = arg_46_0:GetUnitModuleWithType(var_46_1, var_46_2)

	if isa(var_46_3, IslandStrollNpcUnit) and var_46_3:GetDataVO():ExistActionFeedback() then
		arg_46_0.npcActionPlayer:Resopon(var_46_3, arg_46_0.player, arg_46_1)
	else
		arg_46_0.npcActionPlayer:ResoponByRandom(arg_46_0.player, arg_46_1)
	end
end

function var_0_0.OnShowNpcAniamtionBubble(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:GetStrollUnitModule(arg_47_1.id)

	if not var_47_0 then
		return
	end

	local var_47_1 = arg_47_1:GetActionFeedback()

	arg_47_0:GetSubView(IslandBottomHeadHudView):ShowAnimationOp(var_47_0, var_47_1)
end

function var_0_0.OnHideNpcAniamtionBubble(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0:GetStrollUnitModule(arg_48_1.id)

	arg_48_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_48_0)
end

function var_0_0.OnStartDoCoupleAction(arg_49_0)
	arg_49_0:GetSubView(IslandCancelAnimationOpView):ShowCancelableAnimationOp(arg_49_0.player)
end

function var_0_0.OnEndDoCoupleAction(arg_50_0)
	arg_50_0:GetSubView(IslandCancelAnimationOpView):HideCancelableAnimationOp(arg_50_0.player)
end

function var_0_0.OnResponAniamtionOp(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.id
	local var_51_1 = arg_51_1.targetId
	local var_51_2 = arg_51_1.actionId
	local var_51_3 = arg_51_0:GetPlayerUnitModule(var_51_0)

	if not var_51_3 then
		return
	end

	if var_51_2 == 0 then
		if not arg_51_0:IsPlayer(var_51_0) then
			arg_51_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_51_3)
		else
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_51_2, 1, 0, 0, 0))
		end

		return
	end

	local var_51_4 = pg.island_action[var_51_2]

	if var_51_1 == 0 and var_51_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_51_0:IsPlayer(var_51_0) then
		arg_51_0:GetSubView(IslandTopHeadHudView):ShowAnimationOp(var_51_3, var_51_2)
	elseif var_51_1 > 0 and var_51_4.type == IslandConst.ANIMATION_OP_DOUBLE and not arg_51_0:IsPlayer(var_51_1) then
		local var_51_5 = arg_51_0:GetPlayerUnitModule(var_51_1)

		arg_51_0.coupleActionPlayer:Play(var_51_3, var_51_5, var_51_4)
		arg_51_0:GetSubView(IslandTopHeadHudView):HideAnimationOp(var_51_5)
	elseif var_51_1 > 0 and var_51_4.type == IslandConst.ANIMATION_OP_DOUBLE and arg_51_0:IsPlayer(var_51_1) then
		local var_51_6 = arg_51_0:GetPlayerUnitModule(var_51_1)

		arg_51_0.coupleActionPlayer:Play(var_51_3, var_51_6, var_51_4)
		arg_51_0:GetSubView(IslandAniamtionOpView):RemoveWaitTimer(false)
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildActionOp(2, var_51_2, 1, var_51_1, 0, 1))
	end
end

function var_0_0.OnShowChatMsg(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1.player.id
	local var_52_1 = arg_52_0:GetPlayerUnitModule(var_52_0)

	if not var_52_1 then
		return
	end

	arg_52_0:GetSubView(IslandTopHeadHudView):PlayChat(var_52_1, arg_52_1.emojiId, arg_52_1.content, nil)
end

function var_0_0.OnChatRoomChange(arg_53_0)
	arg_53_0:GetSubView(IslandAniamtionOpView):UpdateChatRoom()
end

function var_0_0.OnChatMsgUpdate(arg_54_0)
	arg_54_0:GetSubView(IslandAniamtionOpView):UpdateMsgList()
end

function var_0_0.OnFollowerAdd(arg_55_0, arg_55_1)
	arg_55_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_55_0.coupleNpcWordPlayer:Play(arg_55_1)
end

function var_0_0.OnFollowerDel(arg_56_0, arg_56_1)
	arg_56_0:GetSubView(IslandOpView):FlushFollowerList()
	arg_56_0.coupleNpcWordPlayer:Stop(arg_56_1)
end

function var_0_0.OnResetFollowRandomizer(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0:GetFollowerModule(arg_57_1)

	if not var_57_0 then
		return
	end

	var_57_0:SetBtRandomizer()
end

function var_0_0.OnGenPathFinder(arg_58_0, arg_58_1)
	local var_58_0 = IslandPathFinder.New(arg_58_0)
	local var_58_1 = defaultValue(arg_58_1.navData.waitUntilDone, false)

	var_58_0:Start(arg_58_1.navData, function()
		table.removebyvalue(arg_58_0.pathfinders, var_58_0)
		var_58_0:Dispose()

		if arg_58_1.onEndAction then
			arg_58_1.onEndAction()
		end

		arg_58_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH_DONE, arg_58_1.navData.index)

		if var_58_1 and arg_58_1.callback then
			arg_58_1.callback()
		end
	end)
	arg_58_0:NotifiyIsland(ISLAND_EX_EVT.NAV_PATH, arg_58_1.navData.index)

	if not var_58_1 and arg_58_1.callback then
		arg_58_1.callback()
	end

	table.insert(arg_58_0.pathfinders, var_58_0)
end

function var_0_0.OnRemovePathFinder(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0:GetUnitModuleWithType(arg_60_1.unitType, arg_60_1.unitId)
	local var_60_1 = _.detect(arg_60_0.pathfinders, function(arg_61_0)
		return arg_61_0:IsSameUnit(var_60_0)
	end)

	if not var_60_1 then
		return
	end

	var_60_1:Stop()
	var_60_1:Dispose()
	table.removebyvalue(arg_60_0.pathfinders, var_60_1)
end

function var_0_0.OnTracking(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_1.trackType

	if var_62_0 == IslandTaskTrackCard.TYPES.MAIN then
		arg_62_0.mainTrackId = tonumber(arg_62_1.id)
		arg_62_0.needTryMainTrack = true
	elseif var_62_0 == IslandTaskTrackCard.TYPES.OTHER then
		arg_62_0.trackId = tonumber(arg_62_1.id)
		arg_62_0.trackType = arg_62_1.typ or IslandTaskType.MAIN
		arg_62_0.needTryTrack = true
	end
end

function var_0_0.TryTrack(arg_63_0)
	arg_63_0:TrySetTrack(arg_63_0.trackId)
end

function var_0_0.TrySetTrack(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_0:GetOptTrackingTarget(arg_64_1)

	if not var_64_0 or not var_64_0._go then
		return
	end

	arg_64_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_64_0.player, var_64_0, arg_64_1, arg_64_0.trackType, IslandTaskTrackCard.TYPES.OTHER)

	arg_64_0.needTryTrack = false
end

function var_0_0.TryMainTrack(arg_65_0)
	arg_65_0:TrySetMainTrack(arg_65_0.mainTrackId)
end

function var_0_0.TrySetMainTrack(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0:GetOptTrackingTarget(arg_66_1)

	if not var_66_0 or not var_66_0._go then
		return
	end

	arg_66_0:GetSubView(IslandDistanceView):SetTrackingTarget(arg_66_0.player, var_66_0, arg_66_1, IslandTaskType.MAIN, IslandTaskTrackCard.TYPES.MAIN)

	arg_66_0.needTryMainTrack = false
end

function var_0_0.OnUnTracking(arg_67_0, arg_67_1)
	if arg_67_1 == IslandTaskTrackCard.TYPES.MAIN then
		arg_67_0.mainTrackId = nil
	elseif arg_67_1 == IslandTaskTrackCard.TYPES.OTHER then
		arg_67_0.trackId = nil
	end

	arg_67_0:GetSubView(IslandDistanceView):CancelTracking(arg_67_1)
end

local function var_0_1(arg_68_0, arg_68_1)
	local var_68_0 = pg.island_world_objects[arg_68_0]

	if not var_68_0 then
		return
	end

	return var_68_0.mapId == arg_68_1
end

local function var_0_2(arg_69_0, arg_69_1, arg_69_2)
	for iter_69_0, iter_69_1 in ipairs(arg_69_0) do
		for iter_69_2, iter_69_3 in ipairs(iter_69_1[2]) do
			local var_69_0 = pg.island_interaction[iter_69_3]

			if var_69_0.type == arg_69_2 and var_0_1(tonumber(var_69_0.param), arg_69_1) then
				return iter_69_1[1]
			end
		end
	end

	return nil
end

local function var_0_3(arg_70_0)
	local var_70_0 = {}
	local var_70_1 = {}

	for iter_70_0, iter_70_1 in ipairs(arg_70_0) do
		for iter_70_2, iter_70_3 in ipairs(iter_70_1[2]) do
			local var_70_2 = pg.island_interaction[iter_70_3]

			if var_70_2.type == IslandInteractionUntil.TYPE_TRANSFER then
				table.insert(var_70_0, iter_70_1[1])
			elseif var_70_2.type == IslandInteractionUntil.TYPE_SP_TRANSFER then
				table.insert(var_70_1, iter_70_1[1])
			end
		end
	end

	if #var_70_1 > 0 then
		return var_70_1[1]
	end

	if #var_70_0 > 0 then
		return var_70_0[1]
	end

	return nil
end

function var_0_0.GetOptTrackingTarget(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:GetUnitModule(arg_71_1)

	if var_71_0 then
		return var_71_0
	end

	local var_71_1 = pg.island_world_objects[arg_71_1]

	if not var_71_1 then
		return nil
	end

	local var_71_2 = {}

	for iter_71_0, iter_71_1 in ipairs(arg_71_0:GetUnitListByKey(IslandConst.UNIT_LIST_OBJ)) do
		local var_71_3, var_71_4 = iter_71_1:IsMapTransfer()

		if var_71_3 then
			table.insert(var_71_2, {
				iter_71_1,
				var_71_4
			})
		end
	end

	local var_71_5
	local var_71_6 = var_0_2(var_71_2, var_71_1.mapId, IslandInteractionUntil.TYPE_TRANSFER) or var_0_2(var_71_2, var_71_1.mapId, IslandInteractionUntil.TYPE_SP_TRANSFER)

	var_71_6 = var_71_6 or var_0_3(var_71_2)

	return var_71_6
end

function var_0_0.OnOpenAniamtionOpPage(arg_72_0)
	arg_72_0:GetSubView(IslandAniamtionOpView):TryEnable()
	arg_72_0:GetSubView(IslandOpView):TryDisable()
	arg_72_0:NotifiyIsland(ISLAND_EX_EVT.OPEN_ANIMATION_OP)
end

function var_0_0.OnCloseAniamtionOpPage(arg_73_0)
	arg_73_0:GetSubView(IslandOpView):TryEnable()
	arg_73_0:NotifiyIsland(ISLAND_EX_EVT.CLOSE_ANIMATION_OP)
end

function var_0_0.OnAnyPageOpen(arg_74_0, arg_74_1)
	arg_74_0.anyPageOpen = true

	arg_74_0.player:StopMoveHandle()
	arg_74_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_74_0:GetSubView(IslandSlotHudView):TryDisable()
	arg_74_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_74_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_74_0:GetSubView(IslandAniamtionOpView):CloseAndReset()
end

function var_0_0.OnAllPageClose(arg_75_0)
	arg_75_0.anyPageOpen = false

	arg_75_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_75_0:GetSubView(IslandSlotHudView):TryEnable()
	arg_75_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_75_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnStartStory(arg_76_0)
	arg_76_0.playingStory = true

	arg_76_0:DisablePlayerOp()
end

function var_0_0.OnEndStory(arg_77_0)
	arg_77_0.playingStory = false

	arg_77_0:EnablePlayerOp()
end

function var_0_0.OnStartPerformance(arg_78_0)
	return
end

function var_0_0.OnEndPerformance(arg_79_0)
	if not arg_79_0.anyPageOpen then
		arg_79_0:GetSubView(IslandOpView):ResetShowBalance()
	end
end

function var_0_0.OnStartGuide(arg_80_0)
	arg_80_0.player:StopMoveHandle()
	arg_80_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.OnEndGuide(arg_81_0)
	if arg_81_0.playingStory then
		return
	end

	arg_81_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.InitFocusCamera(arg_82_0)
	local var_82_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOCUS_CAMERA_NAME)

	var_82_0.Follow = arg_82_0.player._tf
	var_82_0.LookAt = arg_82_0.player._tf
end

function var_0_0.InitTakePhotoCamera(arg_83_0)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).Follow = arg_83_0.firstTakePhotoItem._tf

	local var_83_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)

	var_83_0.Follow = arg_83_0.thirdTakePhotoItem._tf
	var_83_0.LookAt = arg_83_0.thirdTakePhotoItem._tf
end

function var_0_0.DisablePlayerOp(arg_84_0)
	arg_84_0.player:StopMoveHandle()
	arg_84_0:GetSubView(IslandTopHeadHudView):TryDisable()
	arg_84_0:GetSubView(IslandBottomHeadHudView):TryDisable()
	arg_84_0:GetSubView(IslandOpView):TryDisablePlayerOp()
	arg_84_0:GetSubView(IslandOpView):TryDisable()
end

function var_0_0.EnablePlayerOp(arg_85_0)
	arg_85_0:GetSubView(IslandOpView):TryEnablePlayerOp()
	arg_85_0:GetSubView(IslandTopHeadHudView):TryEnable()
	arg_85_0:GetSubView(IslandBottomHeadHudView):TryEnable()
	arg_85_0:GetSubView(IslandOpView):TryEnable()
end

function var_0_0.OnInterActionBegin(arg_86_0)
	arg_86_0.player:StopMoveHandle()
	arg_86_0:GetSubView(IslandOpView):TryDisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_87_0)
	arg_87_0:GetSubView(IslandOpView):TryEnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_88_0, arg_88_1)
	arg_88_0.showInterObjId = arg_88_1.id

	arg_88_0:GetSubView(IslandInteractionView):ShowInterActionPanel(arg_88_1)
	arg_88_0:Op("NotifiyIsland", ISLAND_EX_EVT.SHOW_INTERACTION, arg_88_0.showInterObjId)
end

function var_0_0.OnHideInterActionPanel(arg_89_0, arg_89_1)
	if arg_89_0.showInterObjId ~= arg_89_1.id then
		return
	end

	arg_89_0.showInterObjId = nil

	arg_89_0:GetSubView(IslandInteractionView):HideInterActionPanel()
end

function var_0_0.OnRefreshInteractionBtn(arg_90_0)
	arg_90_0:GetSubView(IslandInteractionView):RefreshInteractionBtns()
end

function var_0_0.OnSetOpMoveBtnActve(arg_91_0, arg_91_1, arg_91_2)
	arg_91_0:GetSubView(IslandOpView):ShowOrHideMoveBtn(arg_91_1, arg_91_2)
end

function var_0_0.DisableInput(arg_92_0)
	arg_92_0.player:StopMoveHandle()
	arg_92_0:GetSubView(IslandOpView):DisableInput()
end

function var_0_0.EnableInput(arg_93_0)
	arg_93_0:GetSubView(IslandOpView):EnableInput()
end

function var_0_0.OnUpdateCustomOpPositon(arg_94_0)
	arg_94_0:GetSubView(IslandOpView):InitOpCustumPositon()
end

function var_0_0.OnChange_Photo_Height(arg_95_0, arg_95_1, arg_95_2)
	arg_95_0.takePhotoModel = arg_95_1

	if arg_95_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		-- block empty
	elseif arg_95_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_95_0.thirdTakePhotoItem:ChangeHeight(arg_95_2)
	end
end

function var_0_0.OnChangeTakePhotoModel(arg_96_0, arg_96_1, arg_96_2)
	arg_96_0.takePhotoModel = arg_96_1

	if arg_96_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_96_0.firstTakePhotoItem:Enable()

		arg_96_0.firstTakePhotoItem._tf.position = arg_96_0.player._tf.position
		arg_96_0.firstTakePhotoItem._tf.rotation = arg_96_0.player._tf.rotation

		arg_96_0.firstTakePhotoItem:SetTargetRotation(arg_96_0.player._tf.rotation)
		arg_96_0.player:SetActiveByLayer(false)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FIRST_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook)):SetPosAndRotationByTargetDir(arg_96_0.player._tf.forward)
	elseif arg_96_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_96_0.thirdTakePhotoItem:Enable()

		arg_96_0.player._tf.position = arg_96_0.firstTakePhotoItem._tf.position
		arg_96_0.player._tf.rotation = arg_96_0.firstTakePhotoItem._tf.rotation

		arg_96_0.player:SetTargetRotation(arg_96_0.firstTakePhotoItem._tf.rotation)
		arg_96_0.player:SetActiveByLayer(true)

		arg_96_0.thirdTakePhotoItem._tf.position = arg_96_0.firstTakePhotoItem._tf:TransformPoint(Vector3(0, 0, -5))
		arg_96_0.thirdTakePhotoItem._tf.rotation = arg_96_0.firstTakePhotoItem._tf.rotation

		arg_96_0.thirdTakePhotoItem:SetTargetRotation(arg_96_0.firstTakePhotoItem._tf.rotation)

		local var_96_0 = IslandCameraMgr.instance:GetVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME).gameObject:GetComponent(typeof(CameraPovLook))
		local var_96_1 = arg_96_0.player._tf.position + Vector3(0, 0.5, 0)
		local var_96_2 = arg_96_0.thirdTakePhotoItem._tf.position + Vector3(0, 1, 0)

		var_96_0:SetPosAndRotationByTargetDir((var_96_1 - var_96_2).normalized)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.Third_PERSON_TAKE_PHOTO_CAMERA_NAME)
	else
		arg_96_0.firstTakePhotoItem:Disable()
		arg_96_0.thirdTakePhotoItem:Disable()

		arg_96_0.player._tf.position = arg_96_0.firstTakePhotoItem._tf.position
		arg_96_0.player._tf.rotation = arg_96_0.firstTakePhotoItem._tf.rotation

		arg_96_0.player:SetTargetRotation(arg_96_0.firstTakePhotoItem._tf.rotation)
		arg_96_0.player:SetActiveByLayer(true)
		IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
		IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraLook)):ResetCameraPos()
	end

	arg_96_0:GetSubView(IslandOpView):ChangeTakePhotoModel(arg_96_1, arg_96_2)
end

function var_0_0.OnNpcDetectorSelected(arg_97_0, arg_97_1)
	if arg_97_0.selectedNpcId then
		return
	end

	local var_97_0 = arg_97_1.node

	if not var_97_0 then
		return
	end

	local var_97_1 = var_97_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	arg_97_0.selectedNpcId = var_97_1

	arg_97_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_97_1, true)
	arg_97_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_97_1, true)
end

function var_0_0.GetSelectedNpcId(arg_98_0)
	return arg_98_0.selectedNpcId
end

function var_0_0.OnNpcDetectorUnSelected(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1.node

	if not var_99_0 then
		return
	end

	local var_99_1 = var_99_0:GetComponent(typeof(WorldObjectItem)).uniqueId

	arg_99_0:GetSubView(IslandOpView):UpdateAnimationOpEffect(var_99_1)
	arg_99_0:GetSubView(IslandBottomHeadHudView):UpdateAnimationOpEffect(var_99_1)

	if arg_99_0.selectedNpcId ~= var_99_1 then
		return
	end

	arg_99_0.selectedNpcId = nil
end

function var_0_0.OnDetectorChanged(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_1.node

	if not var_100_0 then
		return
	end

	local var_100_1 = var_100_0:GetBlackboardVariable("DetectorList")

	for iter_100_0 = 1, var_100_1.Count do
		local var_100_2 = var_100_1[iter_100_0 - 1]
		local var_100_3, var_100_4 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_100_2)

		if var_100_3 == IslandConst.UNIT_LIST_OBJ then
			local var_100_5 = arg_100_0:GetUnitModuleWithType(var_100_3, var_100_4)

			if var_100_5 then
				arg_100_0:Op("NotifiyIsland", ISLAND_EX_EVT.APPROACH_OBJECT, var_100_5.id)
			end
		end
	end
end

function var_0_0.OnDetectorSelected(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_1.node

	if not var_101_0 then
		return
	end

	local var_101_1 = var_101_0:GetBlackboardVariable("AnyOne")

	if not var_101_1 or var_101_1 == "" then
		arg_101_0:OnClearSelectedUnit()
	else
		local var_101_2, var_101_3 = IslandCalcUtil.GetTypeAndIdByUniqueId(var_101_1)
		local var_101_4 = arg_101_0:GetUnitModuleWithType(var_101_2, var_101_3)

		if var_101_4 then
			arg_101_0:OnSelectedUnit(var_101_4)
		end
	end
end

function var_0_0.OnClearSelectedUnit(arg_102_0)
	return
end

function var_0_0.OnSelectedUnit(arg_103_0, arg_103_1)
	return
end

function var_0_0.OnPlayChatBubble(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_0:GetAllUnits()

	arg_104_0:GetSubView(IslandTopHeadHudView):PlayBubble(arg_104_1.name, var_104_0, arg_104_1.callback)
end

function var_0_0.OnRawPlayChatBubble(arg_105_0, arg_105_1)
	local var_105_0 = arg_105_0:GetAllUnits()

	arg_105_0:GetSubView(IslandTopHeadHudView):RawPlayBubble(arg_105_1.info, var_105_0, arg_105_1.callback)
end

function var_0_0.OnRawStopChatBubble(arg_106_0, arg_106_1)
	arg_106_0:GetSubView(IslandTopHeadHudView):RawStopBubble(arg_106_1.info)
end

function var_0_0.OnChangeVisterDress(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_1.id

	if arg_107_0:IsPlayer(var_107_0) then
		return
	end

	local var_107_1 = arg_107_0:GetPlayerUnitModule(var_107_0)

	if var_107_1 then
		var_107_1:OnChangeDress(arg_107_1.changeDressData)
	end
end

function var_0_0.OnSystemUnlock(arg_108_0, arg_108_1)
	if arg_108_1 == IslandAblityAgency.ANIMATION_OP_ID then
		arg_108_0:GetSubView(IslandOpView):UpdateAnimationOpBtn()
	end
end

function var_0_0.OnSceneInited(arg_109_0, arg_109_1)
	IslandCameraMgr.instance:LookAt(arg_109_0.player._tf)
	IslandCameraMgr.instance:GetVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME).gameObject:GetComponent(typeof(CameraZoom)):SetMaxMinZoom(arg_109_1.min, arg_109_1.max, arg_109_1.value)
	arg_109_0:InitFocusCamera()
	arg_109_0:InitTakePhotoCamera()
	arg_109_0:GetSubView(IslandOpView):LaterInit()
end

function var_0_0.OnGenUnit(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0 = arg_110_0.unitBuilders[arg_110_1:GetType()]:Build(arg_110_1, arg_110_2)

	arg_110_0:AddUnit(var_110_0)

	if arg_110_1:IsPlayer() then
		arg_110_0.player = var_110_0
	end

	if arg_110_1:IsFirstTakePhoto() then
		arg_110_0.firstTakePhotoItem = var_110_0
	end

	if arg_110_1:IsThirdTakePhoto() then
		arg_110_0.thirdTakePhotoItem = var_110_0
	end
end

function var_0_0.OnGenSystem(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_0.systemBuilders[arg_111_1:GetType()]:Build(arg_111_1)

	arg_111_0:AddUnit(var_111_0)
end

function var_0_0.IsPlayer(arg_112_0, arg_112_1)
	return arg_112_0.player.id == arg_112_1
end

function var_0_0.OnActiveOrDisactiveUnit(arg_113_0, arg_113_1, arg_113_2, arg_113_3)
	local var_113_0

	if arg_113_1 == 0 then
		var_113_0 = arg_113_0.player
	else
		var_113_0 = arg_113_0:GetUnitModuleWithType(arg_113_2, arg_113_1)
	end

	if var_113_0 and arg_113_3 then
		var_113_0:Enable()
	end

	if var_113_0 and not arg_113_3 then
		var_113_0:Disable()
	end
end

function var_0_0.OnResetUnitPos(arg_114_0, arg_114_1, arg_114_2, arg_114_3)
	local var_114_0 = arg_114_0:GetUnitModuleWithType(arg_114_2, arg_114_1)

	if var_114_0 then
		var_114_0._go.transform.position = arg_114_3
	end
end

function var_0_0.OnResetUnitRotation(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	local var_115_0 = arg_115_0:GetUnitModuleWithType(arg_115_2, arg_115_1)

	if var_115_0 then
		var_115_0._go.transform.eulerAngles = arg_115_3
	end
end

function var_0_0.OnMoveUnit(arg_116_0, arg_116_1)
	assert(arg_116_1.type, "type should be exist")

	local var_116_0 = arg_116_0:GetUnitModuleWithType(arg_116_1.type, arg_116_1.id)

	if var_116_0 then
		var_116_0:SetDestination(arg_116_1.position, arg_116_1.speed, nil, arg_116_1.charaRadius)
	end
end

function var_0_0.OnStopUnit(arg_117_0, arg_117_1)
	assert(arg_117_1.type, "type should be exist")

	local var_117_0 = arg_117_0:GetUnitModuleWithType(arg_117_1.type, arg_117_1.id)

	if var_117_0 then
		var_117_0:StopMove()
	end
end

function var_0_0.OnRemoveUnit(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = arg_118_0:GetUnitListByKey(arg_118_1)
	local var_118_1 = 0

	for iter_118_0, iter_118_1 in ipairs(var_118_0 or {}) do
		if iter_118_1.id == arg_118_2 then
			var_118_1 = iter_118_0

			break
		end
	end

	if var_118_1 > 0 then
		local var_118_2 = var_118_0[var_118_1]

		for iter_118_2 = #arg_118_0.pathfinders, 1, -1 do
			local var_118_3 = arg_118_0.pathfinders[iter_118_2]

			if var_118_3:IsSameUnit(var_118_2) then
				var_118_3:Dispose()
				table.remove(arg_118_0.pathfinders, iter_118_2)
			end
		end

		arg_118_0:RemoveUnit(var_118_2)
		var_118_2:Dispose()
		arg_118_0:OnHideUnitHudAndOpBtn({
			type = arg_118_1,
			id = var_118_2.id
		}, true)
		arg_118_0:GetSubView(IslandTopHeadHudView):HideHud({
			type = arg_118_1,
			id = arg_118_2
		})
		arg_118_0:GetSubView(IslandBottomHeadHudView):HideAnimationOp(var_118_2)
		arg_118_0:GetSubView(IslandInteractionView):CloseInterActionPanelByUnitIdRemove(arg_118_2)
	end
end

function var_0_0.GetAllUnits(arg_119_0)
	table.clear(arg_119_0._unitList)

	for iter_119_0, iter_119_1 in pairs(arg_119_0:GetUnitListRegitser()) do
		for iter_119_2, iter_119_3 in pairs(iter_119_1) do
			table.insert(arg_119_0._unitList, iter_119_3)
		end
	end

	return arg_119_0._unitList
end

function var_0_0.GetUnitModuleWithType(arg_120_0, arg_120_1, arg_120_2)
	if arg_120_1 == IslandConst.UNIT_LIST_PLAYER and arg_120_2 == 0 then
		return arg_120_0.player
	end

	local var_120_0 = arg_120_0:GetUnitListByKey(arg_120_1)

	for iter_120_0, iter_120_1 in ipairs(var_120_0) do
		if iter_120_1.id == arg_120_2 then
			return iter_120_1
		end
	end

	return nil
end

function var_0_0.GetPlayerUnitModule(arg_121_0, arg_121_1)
	return arg_121_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PLAYER, arg_121_1)
end

function var_0_0.GetUnitModule(arg_122_0, arg_122_1)
	return arg_122_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_122_1)
end

function var_0_0.GetSystemModule(arg_123_0, arg_123_1)
	return arg_123_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_SYSTEM, arg_123_1)
end

function var_0_0.GetProductSystemModule(arg_124_0, arg_124_1)
	return arg_124_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_PRODUCT_SYSTEM, arg_124_1)
end

function var_0_0.GetSystemUnitModule(arg_125_0, arg_125_1)
	return arg_125_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_125_1)
end

function var_0_0.GetStrollUnitModule(arg_126_0, arg_126_1)
	return arg_126_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_STROLL, arg_126_1)
end

function var_0_0.GetManageSystemModule(arg_127_0, arg_127_1)
	return arg_127_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_MANAGE_SYSTEM, arg_127_1)
end

function var_0_0.GetFollowerModule(arg_128_0, arg_128_1)
	return arg_128_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_FOLLOW, arg_128_1)
end

function var_0_0.OnMovePlayerBefore(arg_129_0)
	if arg_129_0.player:CheckMovement() and arg_129_0.isLockPlayInput then
		arg_129_0.isLockPlayInput = false
	end

	arg_129_0:GetSubView(IslandAniamtionOpView):OnMovePlayerBefore()
end

function var_0_0.OnLockPlayerInput(arg_130_0)
	if arg_130_0.playerInputing then
		arg_130_0.isLockPlayInput = true

		arg_130_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerMove(arg_131_0, arg_131_1)
	if arg_131_0.isLockPlayInput then
		return
	end

	arg_131_0.playerInputing = true

	if arg_131_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_131_0.firstTakePhotoItem:MoveHandle(arg_131_1.targetDir, arg_131_1.force)
	elseif arg_131_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_131_0.thirdTakePhotoItem:MoveHandle(arg_131_1.targetDir, arg_131_1.force)
	else
		arg_131_0.player:MoveHandle(arg_131_1.targetDir, arg_131_1.force)
	end
end

function var_0_0.OnPlayerStopMove(arg_132_0)
	if arg_132_0.isLockPlayInput then
		arg_132_0.isLockPlayInput = false
	end

	arg_132_0.playerInputing = true

	if arg_132_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_132_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_132_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_132_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_132_0.player:StopMoveHandle()
	end
end

function var_0_0.OnPlayerStopMoveHandle(arg_133_0)
	if arg_133_0.isLockPlayInput then
		arg_133_0.isLockPlayInput = false
	end

	arg_133_0.playerInputing = true

	if arg_133_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_133_0.firstTakePhotoItem:StopMoveHandle()
	elseif arg_133_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_133_0.thirdTakePhotoItem:StopMoveHandle()
	else
		arg_133_0.player:StopMoveHandleByInput()
	end
end

function var_0_0.OnPlayerJump(arg_134_0)
	if arg_134_0.takePhotoModel == IslandConst.TakePhotoModel.First or arg_134_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		return
	end

	arg_134_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_135_0)
	arg_135_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_136_0)
	if arg_136_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_136_0.firstTakePhotoItem:OnPlayerPlayerSprint()
	elseif arg_136_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		-- block empty
	else
		arg_136_0.player:OnPlayerPlayerSprint()
	end
end

function var_0_0.OnStopPlayerSprint(arg_137_0)
	if arg_137_0.takePhotoModel == IslandConst.TakePhotoModel.First then
		arg_137_0.firstTakePhotoItem:OnStopPlayerSprint()
	elseif arg_137_0.takePhotoModel == IslandConst.TakePhotoModel.Third then
		arg_137_0.thirdTakePhotoItem:OnStopPlayerSprint()
	else
		arg_137_0.player:OnStopPlayerSprint()
	end
end

function var_0_0.OnPlayerWork(arg_138_0, arg_138_1, arg_138_2)
	arg_138_0.player:WorkHandle(arg_138_1, arg_138_2)
end

function var_0_0.OnPlayerDeviceStateChange(arg_139_0, arg_139_1)
	arg_139_0.player:DeviceStateHandle(arg_139_1)
end

function var_0_0.OnSetVisitorSyncData(arg_140_0, arg_140_1, arg_140_2)
	local var_140_0 = arg_140_0:GetPlayerUnitModule(arg_140_1)

	if var_140_0 then
		var_140_0:UpdateSyncData(arg_140_2)
	end
end

function var_0_0.OnWorldObjectStartInteraction(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	local var_141_0 = arg_141_2:GetHostId()
	local var_141_1 = arg_141_2:GetUserId()
	local var_141_2 = arg_141_0:GetUnitModule(var_141_0)
	local var_141_3 = arg_141_0:GetPlayerUnitModule(var_141_1)
	local var_141_4 = arg_141_0.player == var_141_3

	if var_141_4 then
		arg_141_0:GetSubView(IslandOpView):StartInteraction()
	end

	local var_141_5 = arg_141_1:GetTimeline()[arg_141_3]
	local var_141_6 = arg_141_1:GetBlackboardParam()[arg_141_3]

	var_141_2:StartInteract(var_141_3, arg_141_2.id, arg_141_3, var_141_5, var_141_6, arg_141_1:AnySlotUsing(), var_141_4)
end

function var_0_0.OnWorldObjectEndInteraction(arg_142_0, arg_142_1, arg_142_2)
	local var_142_0 = arg_142_2:GetHostId()
	local var_142_1 = arg_142_2:GetUserId()
	local var_142_2 = arg_142_0:GetUnitModule(var_142_0)
	local var_142_3 = arg_142_0:GetPlayerUnitModule(var_142_1)
	local var_142_4 = arg_142_0.player == var_142_3

	if var_142_4 then
		arg_142_0:GetSubView(IslandOpView):EndInteraction()
	end

	var_142_2:EndInteract(var_142_3, arg_142_2.id, not arg_142_1:AnySlotUsing(), var_142_4)
end

function var_0_0.OnWorldObjectInitStatus(arg_143_0, arg_143_1, arg_143_2)
	local var_143_0 = arg_143_0:GetUnitModule(arg_143_1.id)
	local var_143_1 = arg_143_1:GetTimeline()[arg_143_2]
	local var_143_2 = arg_143_1:GetBlackboardParam()[arg_143_2]

	var_143_0:InitStatus(arg_143_2, var_143_1, var_143_2)
end

function var_0_0.InitInteractionOpView(arg_144_0)
	arg_144_0:GetSubView(IslandOpView):EndInteraction()
end

function var_0_0.OnPlayerAreaChange(arg_145_0)
	arg_145_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnChangeDress(arg_146_0, arg_146_1, arg_146_2)
	arg_146_0.player:OnChangeDress(arg_146_1, arg_146_2)
end

function var_0_0.OnCharacterChangeDress(arg_147_0, arg_147_1, arg_147_2, arg_147_3, arg_147_4)
	local var_147_0 = arg_147_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATION, arg_147_1)

	if var_147_0 then
		var_147_0:OnCharacterChangeDress(arg_147_2, arg_147_3, arg_147_4)
	end

	local var_147_1 = arg_147_0:GetUnitListByKey(IslandConst.UNIT_LIST_FOLLOW)

	for iter_147_0, iter_147_1 in ipairs(var_147_1) do
		if iter_147_1:GetDataVO():IsSameShip(arg_147_1) then
			iter_147_1:OnCharacterChangeDress(arg_147_2, arg_147_3, arg_147_4)
		end
	end

	local var_147_2 = arg_147_0:GetUnitListByKey(IslandConst.UNIT_LIST_STROLL)

	for iter_147_2, iter_147_3 in ipairs(var_147_2) do
		if iter_147_3:GetDataVO():IsSameShip(arg_147_1) then
			iter_147_3:OnCharacterChangeDress(arg_147_2, arg_147_3, arg_147_4)
		end
	end
end

function var_0_0.OnStartDelegation(arg_148_0, arg_148_1, arg_148_2)
	local var_148_0 = arg_148_0:GetSystemModule(arg_148_1.build_id)

	if var_148_0 then
		var_148_0:StartDelegation(arg_148_1)
	end

	local var_148_1 = arg_148_0:GetProductSystemModule(arg_148_1.build_id)

	if var_148_1 then
		var_148_1:StartDelegation(arg_148_2)
	end
end

function var_0_0.OnEndDelegation(arg_149_0, arg_149_1, arg_149_2)
	local var_149_0 = arg_149_0:GetSystemModule(arg_149_1.build_id)

	if var_149_0 then
		var_149_0:EndDelegation(arg_149_1)
	end
end

function var_0_0.GetPlayerPosition(arg_150_0)
	return arg_150_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_151_0, arg_151_1)
	local var_151_0 = arg_151_0:GetUnitModule(arg_151_1)

	return var_151_0 and var_151_0._go.transform.position
end

function var_0_0.OnShowUnitHudAndOpBtn(arg_152_0, arg_152_1)
	arg_152_0.currentHudUnitData = arg_152_1

	arg_152_0:GetSubView(IslandSlotHudView):ShowHud(arg_152_1.id, arg_152_1.height)
	arg_152_0:GetSubView(IslandOpView):UpdateOperationButton(arg_152_1.operationType, arg_152_1.id)

	if arg_152_1.isHighLightControl then
		arg_152_0.detectionSystem:HighLightUnitHandle(arg_152_1.id, true)
	end
end

function var_0_0.OnHideUnitHudAndOpBtn(arg_153_0, arg_153_1, arg_153_2)
	if not arg_153_0.currentHudUnitData then
		return
	end

	if arg_153_0.currentHudUnitData.id ~= arg_153_1.id or arg_153_0.currentHudUnitData.type ~= arg_153_1.type then
		return
	end

	if not arg_153_2 then
		arg_153_0.currentHudUnitData = nil
	end

	arg_153_0:GetSubView(IslandSlotHudView):HideUnitHud(arg_153_1.id)
	arg_153_0:GetSubView(IslandOpView):UpdateOperationButton(IslandOpView.OperationType.None, arg_153_1.id)

	if arg_153_1.isHighLightControl then
		arg_153_0.detectionSystem:HighLightUnitHandle(arg_153_1.id, false)
	end
end

function var_0_0.OnUpdateHud(arg_154_0, arg_154_1)
	if not arg_154_0.currentHudUnitData then
		return
	end

	if arg_154_1 ~= arg_154_0.currentHudUnitData.id then
		return
	end

	arg_154_0:GetSubView(IslandSlotHudView):UpdateHud(arg_154_0.currentHudUnitData.id, arg_154_0.currentHudUnitData.height)
	arg_154_0:GetSubView(IslandOpView):UpdateOperationButton(arg_154_0.currentHudUnitData.operationType, arg_154_0.currentHudUnitData.id)
end

function var_0_0.OnUpdateHandCollectUnit(arg_155_0, arg_155_1)
	local var_155_0 = arg_155_0:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_155_1)

	if var_155_0 then
		var_155_0:UpdateHandCollet()
		var_155_0:ResetHp()
	end
end

function var_0_0.OnShowHud(arg_156_0, arg_156_1)
	arg_156_0:GetSubView(IslandTopHeadHudView):ShowHud(arg_156_1)
	arg_156_0:GetSubView(IslandDistanceView):ShowHud(arg_156_1.id)
end

function var_0_0.OnRefreshHud(arg_157_0, arg_157_1)
	arg_157_0:GetSubView(IslandTopHeadHudView):RefreshHud(arg_157_1)
end

function var_0_0.OnHideHud(arg_158_0, arg_158_1)
	arg_158_0:GetSubView(IslandTopHeadHudView):HideHud(arg_158_1)
	arg_158_0:GetSubView(IslandDistanceView):HideHud(arg_158_1.id)
end

function var_0_0.OnDelegateSlotStartPerform(arg_159_0, arg_159_1)
	local var_159_0 = arg_159_0:GetUnitModuleWithType(arg_159_1.type, arg_159_1.id)

	if var_159_0 then
		var_159_0:DelegateSlotStartPerform()
	end
end

function var_0_0.OnRecycleAllSlotEffct(arg_160_0)
	arg_160_0.effectMgr:RecycleAllSlotEffct()
end

function var_0_0.OnLoadDelegatePreviewRole(arg_161_0, arg_161_1, arg_161_2)
	arg_161_0.effectMgr:LoadDelegatePreviewRole(arg_161_1, arg_161_2)
end

function var_0_0.OnUnLoadDelegatePreviewRole(arg_162_0)
	arg_162_0.effectMgr:UnLoadDelegatePreviewRole()
end

function var_0_0.OnSelectSlotEffectShow(arg_163_0, arg_163_1, arg_163_2, arg_163_3, arg_163_4)
	arg_163_0.effectMgr:SelectSlotEffectShow(arg_163_1, arg_163_2, arg_163_3, arg_163_4)
end

function var_0_0.OnTakePlantAttack(arg_164_0, arg_164_1)
	local var_164_0 = arg_164_0:GetUnitModuleWithType(arg_164_1.type, arg_164_1.id)

	if var_164_0 then
		var_164_0:TakeAttack()
	end
end

function var_0_0.OnStartManage(arg_165_0, arg_165_1)
	local var_165_0 = arg_165_0:GetManageSystemModule(arg_165_1.id)

	if var_165_0 then
		var_165_0:StartManage(arg_165_1)
	end
end

function var_0_0.OnEndManage(arg_166_0, arg_166_1)
	local var_166_0 = arg_166_0:GetManageSystemModule(arg_166_1.id)

	if var_166_0 then
		var_166_0:EndManage(arg_166_1)
	end
end

function var_0_0.OnRefreshTaskInfoHud(arg_167_0)
	arg_167_0:GetSubView(IslandTopHeadHudView):UpdateAllHud()
end

function var_0_0.OnRefreshWeatherSystem(arg_168_0)
	arg_168_0.weatherSystem:Play()
end

function var_0_0.OnDispose(arg_169_0)
	arg_169_0.detectionSystem:Dispose()
	arg_169_0.effectMgr:Dispose()
	arg_169_0.coupleActionPlayer:Dispose()
	arg_169_0.coupleAction4FollowerPlayer:Dispose()
	arg_169_0.npcActionPlayer:Dispose()
	arg_169_0.weatherSystem:Dispose()
	arg_169_0.coupleNpcWordPlayer:Dispose()
	arg_169_0:GetPoolMgr():ClearFishingEffect()

	for iter_169_0, iter_169_1 in ipairs(arg_169_0.views) do
		iter_169_1:Dispose()
	end

	for iter_169_2, iter_169_3 in ipairs(arg_169_0.pathfinders) do
		iter_169_3:Dispose()
	end

	for iter_169_4, iter_169_5 in ipairs(arg_169_0:GetAllUnits()) do
		iter_169_5:Dispose()
	end

	for iter_169_6, iter_169_7 in pairs(arg_169_0.unitBuilders) do
		iter_169_7:Dispose()
	end

	for iter_169_8, iter_169_9 in pairs(arg_169_0.systemBuilders) do
		iter_169_9:Dispose()
	end

	for iter_169_10, iter_169_11 in pairs(arg_169_0.fishingSynPlayers) do
		iter_169_11:Dispose()
	end

	arg_169_0.fishingSynPlayers = nil
	arg_169_0.npcActionPlayer = nil
	arg_169_0.coupleActionPlayer = nil
	arg_169_0.coupleAction4FollowerPlayer = nil
	arg_169_0.pathfinders = nil
	arg_169_0.unitBuilders = nil
	arg_169_0.systemBuilders = nil
	arg_169_0.views = nil
	arg_169_0.player = nil
	arg_169_0.isInit = false
	arg_169_0._unitList = nil
	arg_169_0.detectionSystem = nil
	arg_169_0.effectMgr = nil
	arg_169_0.coupleNpcWordPlayer = nil
	arg_169_0.weatherSystem = nil
end

return var_0_0
