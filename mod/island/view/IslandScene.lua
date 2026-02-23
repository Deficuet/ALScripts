local var_0_0 = class("IslandScene", import(".base.IslandBaseScene"))

var_0_0.ON_INVENTORY_FILTER = "IslandScene:ON_INVENTORY_FILTER"
var_0_0.ON_CHECK_ORDER_EXP_AWARD = "IslandScene:ON_CHECK_ORDER_EXP_AWARD"

function var_0_0.getUIName(arg_1_0)
	return "IslandUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	seriesAsync({
		function(arg_3_0)
			var_0_0.super.preload(arg_2_0, arg_3_0)
		end,
		function(arg_4_0)
			IslandTaskHelper.FixTaskLinksStory(arg_4_0)
		end
	}, function()
		arg_2_1()
	end)
end

function var_0_0.loadingQueue(arg_6_0)
	return function(arg_7_0)
		pg.SceneAnimMgr.GetInstance():CommonSceneChange("Dorm3DLoading", function(arg_8_0)
			return arg_7_0(arg_8_0)
		end)
	end
end

function var_0_0.GetIsland(arg_9_0)
	return getProxy(IslandProxy):GetIsland()
end

function var_0_0.init(arg_10_0)
	arg_10_0.visitorBtn = arg_10_0._tf:Find("top/visitor")
	arg_10_0.levelPanel = IslandLevelPanel.New(arg_10_0._tf, arg_10_0.event)
	arg_10_0.taskTrackPanel = Island3dTaskTrackPanel.New(arg_10_0._tf:Find("track_container"), arg_10_0.event)
	arg_10_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_10_0._tf, arg_10_0.event, setmetatable({
		needAdapt = true
	}, {
		__index = arg_10_0.contextData
	}))
	arg_10_0.btnContainer = IslandMainBtnContainer.New(arg_10_0._tf:Find("top/btn_container"), arg_10_0.event)
end

function var_0_0.didEnter(arg_11_0)
	onButton(arg_11_0, arg_11_0.visitorBtn, function()
		arg_11_0:OpenPage(IslandVisitorPage)
	end, SFX_PANEL)
	arg_11_0:SetUp()

	local var_11_0 = arg_11_0.contextData.resumeCallback

	arg_11_0.contextData.resumeCallback = nil

	existCall(var_11_0)
end

function var_0_0.SetUp(arg_13_0)
	seriesAsync({
		function(arg_14_0)
			arg_13_0:SetDressUpIsEmpty(arg_14_0)
		end
	}, function()
		arg_13_0:StartCore()
	end)
end

function var_0_0.SetNameIfIsEmpty(arg_16_0, arg_16_1)
	if not arg_16_0:GetIsland():IsNew() then
		arg_16_1()

		return
	end

	local var_16_0 = IslandSetNamePage.New(arg_16_0)

	var_16_0:ExecuteAction("Show", function()
		var_16_0:Destroy()
		arg_16_1()
	end)
end

function var_0_0.SetDressUpIsEmpty(arg_18_0, arg_18_1)
	if not arg_18_0:GetIsland():GetDressUpAgency():IsNew() then
		arg_18_1()

		return
	end

	arg_18_0:OpenPage(IslandShipFirstDressupPage, arg_18_1)
end

function var_0_0.AddListeners(arg_19_0)
	arg_19_0:AddListener(GAME.ISLAND_UPGRADE_DONE, arg_19_0.OnUpgrade)
	arg_19_0:AddListener(Island.EXP_ADD, arg_19_0.OnExpChange)
	arg_19_0:AddListener(GAME.ISLAND_SET_NAME_DONE, arg_19_0.OnModifyName)
	arg_19_0:AddListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_19_0.OnGetProsperityAward)
	arg_19_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_19_0.OnAddedTask)
	arg_19_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_19_0.OnUpdateTask)
	arg_19_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_19_0.OnRemoveTask)
	arg_19_0:AddListener(IslandAchievementAgency.NEW_CAN_GET, arg_19_0.OnNewAchievementCanGet)
	arg_19_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_19_0.OnFinishDelegation)
	arg_19_0:AddListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_19_0.OnUnlockTechnology)
	arg_19_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_19_0.OnAddShip)
	arg_19_0:AddListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_19_0.OnShipLevelUp)
	arg_19_0:AddListener(IslandCharacterAgency.SHIP_GET_STATE, arg_19_0.OnShipGetState)
	arg_19_0:AddListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_19_0.OnUnlockSystem)
	arg_19_0:AddListener(IslandVisitorAgency.PLAYER_ADD, arg_19_0.OnVisitorNumChange)
	arg_19_0:AddListener(IslandVisitorAgency.PLAYER_EXIT, arg_19_0.OnVisitorNumChange)
	arg_19_0:AddListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_19_0.OnAgoraEnterEditMode)
	arg_19_0:AddListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_19_0.OnAgoraExitEditMode)
	arg_19_0:AddListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_19_0.OnTriggerTask)
	arg_19_0:AddListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_19_0.OnSubmitTask)
	arg_19_0:AddListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_19_0.OnAddTaskProgress)
	arg_19_0:AddListener(ISLAND_EX_EVT.PLAY_STORY, arg_19_0.OnPlayStory)
	arg_19_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP, arg_19_0.OnSwitchMap)
	arg_19_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_19_0.OnSeekGameStart)
	arg_19_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_19_0.OnSeekGameEnd)
	arg_19_0:AddListener(ISLAND_EX_EVT.ENTER_FISH_POINT, arg_19_0.OnEnterFishPoint)
	arg_19_0:AddListener(ISLAND_EX_EVT.EXIT_FISH_POINT, arg_19_0.OnExitFishPoint)
	arg_19_0:AddListener(ISLAND_EX_EVT.APPROACH_OBJECT, arg_19_0.OnApproachObject)
	arg_19_0:AddListener(ISLAND_EX_EVT.PLAY_PERFORMANCE, arg_19_0.OnPlayPerformance)
	arg_19_0:AddListener(ISLAND_EX_EVT.SHOW_INTERACTION, arg_19_0.OnShowInteraction)
	arg_19_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_19_0.OnSwitchMapByPoint)
	arg_19_0:AddListener(ISLAND_EX_EVT.NAV_PATH, arg_19_0.OnStartNavPath)
	arg_19_0:AddListener(ISLAND_EX_EVT.NAV_PATH_DONE, arg_19_0.OnNavPathDone)
end

function var_0_0.RemoveListeners(arg_20_0)
	arg_20_0:RemoveListener(GAME.ISLAND_UPGRADE_DONE, arg_20_0.OnUpgrade)
	arg_20_0:RemoveListener(Island.EXP_ADD, arg_20_0.OnExpChange)
	arg_20_0:RemoveListener(GAME.ISLAND_SET_NAME_DONE, arg_20_0.OnModifyName)
	arg_20_0:RemoveListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_20_0.OnGetProsperityAward)
	arg_20_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_20_0.OnAddedTask)
	arg_20_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_20_0.OnUpdateTask)
	arg_20_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_20_0.OnRemoveTask)
	arg_20_0:RemoveListener(IslandAchievementAgency.NEW_CAN_GET, arg_20_0.OnNewAchievementCanGet)
	arg_20_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_20_0.OnFinishDelegation)
	arg_20_0:RemoveListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_20_0.OnUnlockTechnology)
	arg_20_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_20_0.OnAddShip)
	arg_20_0:RemoveListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_20_0.OnShipLevelUp)
	arg_20_0:RemoveListener(IslandCharacterAgency.SHIP_GET_STATE, arg_20_0.OnShipGetState)
	arg_20_0:RemoveListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_20_0.OnUnlockSystem)
	arg_20_0:RemoveListener(IslandVisitorAgency.PLAYER_ADD, arg_20_0.OnVisitorNumChange)
	arg_20_0:RemoveListener(IslandVisitorAgency.PLAYER_EXIT, arg_20_0.OnVisitorNumChange)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_20_0.OnAgoraEnterEditMode)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_20_0.OnAgoraExitEditMode)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_20_0.OnTriggerTask)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_20_0.OnSubmitTask)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_20_0.OnAddTaskProgress)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.PLAY_STORY, arg_20_0.OnPlayStory)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP, arg_20_0.OnSwitchMap)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_20_0.OnSeekGameStart)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_20_0.OnSeekGameEnd)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.ENTER_FISH_POINT, arg_20_0.OnEnterFishPoint)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.EXIT_FISH_POINT, arg_20_0.OnExitFishPoint)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.APPROACH_OBJECT, arg_20_0.OnApproachObject)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.PLAY_PERFORMANCE, arg_20_0.OnPlayPerformance)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SHOW_INTERACTION, arg_20_0.OnShowInteraction)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_20_0.OnSwitchMapByPoint)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.NAV_PATH, arg_20_0.OnStartNavPath)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.NAV_PATH_DONE, arg_20_0.OnNavPathDone)
end

function var_0_0.OnEnterFishPoint(arg_21_0)
	arg_21_0:TryDisVisible()
end

function var_0_0.OnExitFishPoint(arg_22_0)
	arg_22_0:TryVisible()
end

function var_0_0.OnOpenAnimatonOpPage(arg_23_0)
	arg_23_0.btnContainer:ActiveOrDisactive(false)
end

function var_0_0.OnCloseAnimatonOpPage(arg_24_0)
	arg_24_0.btnContainer:ActiveOrDisactive(true)
end

function var_0_0.OnStartNavPath(arg_25_0, arg_25_1)
	if arg_25_1 then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_25_1
		})
	end
end

function var_0_0.OnNavPathDone(arg_26_0, arg_26_1)
	arg_26_0:GetIsland():DispatchEvent(IslandProxy.END_PATHFINDER)
end

function var_0_0.OnExpChange(arg_27_0)
	arg_27_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.ShowExpAdd(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0.levelPanel:ExecuteAction("ShowExpAdd", arg_28_1, arg_28_2)
end

function var_0_0.OnSwitchMapByPoint(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.mapId

	arg_29_0:GetIsland():SetLastExitPosition(arg_29_1.mapId, arg_29_1.position, arg_29_1.rotation)
	arg_29_0:emit(IslandBaseMediator.SWITCH_MAP, var_29_0)
end

function var_0_0.OnShowInteraction(arg_30_0, arg_30_1)
	IslandGuideChecker.CheckOnShowInteraction(arg_30_1)
end

function var_0_0.OnPlayPerformance(arg_31_0, arg_31_1)
	arg_31_0:PlayPerformance(arg_31_1)
end

function var_0_0.OnSeekGameStart(arg_32_0)
	arg_32_0:TryDisVisible()
end

function var_0_0.OnSeekGameEnd(arg_33_0)
	arg_33_0:TryVisible()
end

function var_0_0.OnSwitchMap(arg_34_0, arg_34_1)
	local var_34_0 = pg.island_world_objects[arg_34_1].mapId

	arg_34_0:emit(IslandBaseMediator.SWITCH_MAP, var_34_0, arg_34_1)
end

function var_0_0.OnPlayStory(arg_35_0, arg_35_1)
	arg_35_0:PlayStory(arg_35_1)
end

function var_0_0.OnTriggerTask(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0:GetIsland():GetTaskAgency():GetFutureTask(arg_36_1)

	if var_36_0 and var_36_0:IsUnlock() then
		arg_36_0:emit(IslandMediator.ON_ACCEPT_TASK, {
			arg_36_1
		})
	end
end

function var_0_0.OnSubmitTask(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:GetIsland():GetTaskAgency():GetTask(arg_37_1)

	if var_37_0 and var_37_0:IsFinish() then
		arg_37_0:emit(IslandMediator.ON_SUBMIT_TASK, arg_37_1)
	end
end

function var_0_0.OnAddTaskProgress(arg_38_0, arg_38_1, arg_38_2)
	IslandTaskHelper.UpdateClientTaskProgress(arg_38_1, arg_38_2)
end

function var_0_0.OnApproachObject(arg_39_0, arg_39_1)
	IslandTaskHelper.OnApproach(arg_39_1)
end

function var_0_0.OnUpdateTrackTask(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_2 == IslandTaskTrackCard.TYPES.MAIN then
		arg_40_0.mainTraceTaskId = arg_40_1
	elseif arg_40_2 == IslandTaskTrackCard.TYPES.OTHER then
		arg_40_0.otherTraceTaskId = arg_40_1
	end

	if arg_40_0.mainTraceTaskId and arg_40_0.mainTraceTaskId ~= 0 or arg_40_0.otherTraceTaskId and arg_40_0.otherTraceTaskId ~= 0 then
		arg_40_0.taskTrackPanel:ExecuteAction("Show")
	end

	arg_40_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnAddedTask(arg_41_0, arg_41_1)
	return
end

function var_0_0.OnUpdateTask(arg_42_0, arg_42_1)
	if arg_42_0.mainTraceTaskId and arg_42_0.mainTraceTaskId == arg_42_1.id then
		arg_42_0.taskTrackPanel:ExecuteAction("UpdateProgress", IslandTaskTrackCard.TYPES.MAIN)
		arg_42_0.btnContainer:OnTrackTaskChange()
	elseif arg_42_0.otherTraceTaskId and arg_42_0.otherTraceTaskId == arg_42_1.id then
		arg_42_0.taskTrackPanel:ExecuteAction("UpdateProgress", IslandTaskTrackCard.TYPES.OTHER)
		arg_42_0.btnContainer:OnTrackTaskChange()
	end
end

function var_0_0.OnRemoveTask(arg_43_0, arg_43_1)
	if arg_43_0.mainTraceTaskId and arg_43_0.mainTraceTaskId == arg_43_1.id then
		arg_43_0.taskTrackPanel:ExecuteAction("RemoveTask", IslandTaskTrackCard.TYPES.MAIN)
		arg_43_0.btnContainer:OnTrackTaskChange()
	elseif arg_43_0.otherTraceTaskId and arg_43_0.otherTraceTaskId == arg_43_1.id then
		arg_43_0.taskTrackPanel:ExecuteAction("RemoveTask", IslandTaskTrackCard.TYPES.OTHER)
		arg_43_0.btnContainer:OnTrackTaskChange()
	end
end

function var_0_0.UpdateTaskInfo(arg_44_0)
	local var_44_0 = arg_44_0:GetIsland():GetTaskAgency():GetMainTraceTask()
	local var_44_1 = arg_44_0:GetIsland():GetTaskAgency():GetTraceTask()

	if var_44_0 then
		arg_44_0.mainTraceTaskId = var_44_0.id
	end

	if var_44_1 then
		arg_44_0.otherTraceTaskId = var_44_1.id
	end

	if arg_44_0.otherTraceTaskId and arg_44_0.otherTraceTaskId ~= 0 or arg_44_0.mainTraceTaskId and arg_44_0.mainTraceTaskId ~= 0 then
		arg_44_0.taskTrackPanel:ExecuteAction("Show")
	else
		arg_44_0.taskTrackPanel:ExecuteAction("Hide")
	end

	arg_44_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnSetUpCore(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0.approachSpawnPointId = arg_45_2
end

function var_0_0.OnAgoraEnterEditMode(arg_46_0)
	setActive(arg_46_0._tf, false)
end

function var_0_0.OnAgoraExitEditMode(arg_47_0)
	setActive(arg_47_0._tf, true)
end

function var_0_0.OnShipGetState(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_1.ship
	local var_48_1 = arg_48_1.status
	local var_48_2 = var_48_0:GetName()

	arg_48_0:ShowToast({
		type = IslandToast.TYPE_STATE,
		content = i18n("island_toast_status", var_48_1:GetName(), var_48_2)
	})
end

function var_0_0.OnShipLevelUp(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_1:GetName()
	local var_49_1 = arg_49_1:GetLevel()

	arg_49_0:ShowToast({
		content = i18n("island_toast_level", var_49_1, var_49_0)
	})
end

function var_0_0.OnAddShip(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1:GetName()
	local var_50_1 = arg_50_0:GetIsland():GetName()

	arg_50_0:ShowToast({
		content = i18n("island_toast_ship", var_50_1, var_50_0)
	})
end

function var_0_0.OnNewAchievementCanGet(arg_51_0, arg_51_1)
	if not IslandMainBtnTipHelper.IsUnlock("achievement") then
		return
	end

	arg_51_0:ShowToast({
		content = i18n("island_achv_finish_tip", arg_51_1:getConfig("name"))
	})
end

function var_0_0.OnFinishDelegation(arg_52_0)
	arg_52_0.btnContainer:OnFinishDelegation()
end

function var_0_0.OnUnlockTechnology(arg_53_0)
	arg_53_0.btnContainer:OnUnlockTechnology()
end

function var_0_0.OnUpgrade(arg_54_0, arg_54_1)
	arg_54_0.levelPanel:ExecuteAction("UpdateTip")
	arg_54_0.levelPanel:ExecuteAction("UpdateIslandInfo")

	local var_54_0 = {}

	seriesAsync({
		function(arg_55_0)
			arg_54_0:OpenPage(IslandUpgradeDisplayPage, arg_54_1.dropData.abilitys, arg_55_0)
		end,
		function(arg_56_0)
			arg_54_0:DisplaySystemUnlock(arg_54_1.dropData.abilitys, arg_56_0)
		end
	}, arg_54_1.callback)
end

function var_0_0.OnModifyName(arg_57_0)
	arg_57_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.OnGetProsperityAward(arg_58_0)
	arg_58_0.levelPanel:ExecuteAction("UpdateTip")
end

function var_0_0.OnUnlockSystem(arg_59_0, arg_59_1)
	arg_59_0.btnContainer:OnUnlockSystem(arg_59_1)
	switch(arg_59_1, {
		[pg.island_set.main_page_function_unlock.key_value_varchar[1]] = function()
			arg_59_0.levelPanel:ExecuteAction("Show")
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[2]] = function()
			arg_59_0.unlockTask = true

			arg_59_0.taskTrackPanel:ExecuteAction("SetUnlock")
			arg_59_0:UpdateTaskInfo()
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[3]] = function()
			setActive(arg_59_0.visitorBtn, true)
			arg_59_0:UpdateVisitorBtn()
		end
	}, function()
		return
	end)
end

function var_0_0.OnVisitorNumChange(arg_64_0)
	arg_64_0:UpdateVisitorBtn()
end

function var_0_0.OnSceneLoaded(arg_65_0)
	arg_65_0:HandleAwardDisplay({})
	var_0_0.super.OnSceneLoaded(arg_65_0)

	local var_65_0 = arg_65_0:GetIsland():GetAblityAgency()

	if var_65_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[1]) then
		arg_65_0.levelPanel:ExecuteAction("Show")
	end

	arg_65_0.unlockTask = var_65_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[2])

	if arg_65_0.unlockTask then
		arg_65_0:UpdateTaskInfo()
	end

	local var_65_1 = var_65_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[3])

	setActive(arg_65_0.visitorBtn, var_65_1)

	if var_65_1 then
		arg_65_0:UpdateVisitorBtn()
	end

	if arg_65_0.approachSpawnPointId then
		arg_65_0:OnApproachObject(arg_65_0.approachSpawnPointId)

		arg_65_0.approachSpawnPointId = nil
	end

	arg_65_0:SequenceCheck()
end

function var_0_0.SequenceCheck(arg_66_0)
	seriesAsync({
		function(arg_67_0)
			if pg.NewStoryMgr.GetInstance():IsPlayed("ISLAND1001001_1") then
				arg_67_0()
			else
				arg_66_0:PlayPerformance({
					name = "ISLANDPERFORMANCE1",
					callback = arg_67_0
				})
			end
		end,
		function(arg_68_0)
			arg_66_0:SeasonResetCheck(arg_68_0)
		end,
		function(arg_69_0)
			local var_69_0, var_69_1, var_69_2 = arg_66_0:GetIsland():GetSeasonAgency():IsShowResetTip()

			if var_69_0 then
				local var_69_3 = var_69_1 > 0 and i18n("island_season_window_end2", var_69_1) or i18n("island_season_window_end")

				arg_66_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_SEASON_TIP,
					tipTitle = var_69_3,
					content = i18n("island_season_window_rule"),
					onHide = function()
						arg_66_0:GetIsland():GetSeasonAgency():SetResetTipFlag(var_69_1)
						arg_69_0()
					end
				})
			else
				arg_69_0()
			end
		end,
		function(arg_71_0)
			local var_71_0 = arg_66_0:GetIsland():GetTicketAgency():GetExpiredTickets()

			if #var_71_0 > 0 then
				arg_66_0:emit(IslandMediator.REMOVE_EXPIRED_TICKETS, var_71_0, arg_71_0)
			else
				arg_71_0()
			end
		end,
		function(arg_72_0)
			local var_72_0 = arg_66_0:GetIsland():GetTicketAgency():GetExpireRemindTickets()

			if #var_72_0 > 0 then
				arg_66_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_TICKET_EXPIRED,
					body = {
						type = IslandTicketExpiredMsgBoxWindow.TYPES.REMIND,
						tickets = var_72_0
					},
					onHide = function()
						arg_66_0:GetIsland():GetTicketAgency():SetRemindFlag()
						arg_72_0()
					end
				})
			else
				arg_72_0()
			end
		end,
		function(arg_74_0)
			arg_66_0:GetIsland():GetTaskAgency():TrySubmitAutoTasks(arg_74_0)
		end,
		function(arg_75_0)
			arg_66_0:GetIsland():GetTaskAgency():TryAcceptAutoTasks(arg_75_0)
		end
	}, function()
		IslandGuideChecker.CheckOnLoaded(arg_66_0:GetIsland():GetMapId())
	end)
end

function var_0_0.SeasonResetCheck(arg_77_0, arg_77_1)
	local var_77_0, var_77_1 = IslandSeasonAgency.CheckReset()

	if var_77_0 then
		seriesAsync({
			function(arg_78_0)
				arg_77_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_season_reset"),
					onHide = arg_78_0
				})
			end
		}, function()
			arg_77_0:ShowMsgbox({
				type = IslandMsgBox.TYPE_SEASON_RESET,
				body = var_77_1,
				onHide = arg_77_1
			})
		end)
	else
		arg_77_1()
	end
end

function var_0_0.UpdateVisitorBtn(arg_80_0)
	setText(arg_80_0.visitorBtn:Find("num"), arg_80_0:GetIsland():GetVisitorAgency():GetVisitorCnt())
	setText(arg_80_0.visitorBtn:Find("Text"), i18n("island_visitor_button"))
end

function var_0_0.UpdateMainAwardReward(arg_81_0, arg_81_1)
	arg_81_0.awardDisplayPanel:ExecuteAction("ShowAwards", arg_81_1)
end

function var_0_0.OnUnloadScene(arg_82_0)
	return
end

function var_0_0.OnVisible(arg_83_0)
	arg_83_0:UpdateTaskInfo()
	arg_83_0.btnContainer:Flush()

	if not arg_83_0:GetSubView(IslandStoryMgr):IsRunning() and not arg_83_0.poppingQueue:AnyPlayerIsRunning() then
		IslandGuideChecker.CheckOnLoaded(arg_83_0:GetIsland():GetMapId())
	end
end

function var_0_0.willExit(arg_84_0)
	if arg_84_0.btnContainer then
		arg_84_0.btnContainer:Dispose()

		arg_84_0.btnContainer = nil
	end

	if arg_84_0.levelPanel then
		arg_84_0.levelPanel:Destroy()

		arg_84_0.levelPanel = nil
	end

	if arg_84_0.taskTrackPanel then
		arg_84_0.taskTrackPanel:Destroy()

		arg_84_0.taskTrackPanel = nil
	end

	if arg_84_0.awardDisplayPanel then
		arg_84_0.awardDisplayPanel:Destroy()

		arg_84_0.awardDisplayPanel = nil
	end
end

return var_0_0
