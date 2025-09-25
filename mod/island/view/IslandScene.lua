local var_0_0 = class("IslandScene", import(".base.IslandBaseScene"))

var_0_0.ON_INVENTORY_FILTER = "IslandScene:ON_INVENTORY_FILTER"
var_0_0.ON_CHECK_ORDER_EXP_AWARD = "IslandScene:ON_CHECK_ORDER_EXP_AWARD"

function var_0_0.getUIName(arg_1_0)
	return "IslandUI"
end

function var_0_0.loadingQueue(arg_2_0)
	return function(arg_3_0)
		pg.SceneAnimMgr.GetInstance():CommonSceneChange("Dorm3DLoading", function(arg_4_0)
			return arg_3_0(arg_4_0)
		end)
	end
end

function var_0_0.GetIsland(arg_5_0)
	return getProxy(IslandProxy):GetIsland()
end

function var_0_0.init(arg_6_0)
	arg_6_0.visitorBtn = arg_6_0:findTF("top/visitor")
	arg_6_0.levelPanel = IslandLevelPanel.New(arg_6_0._tf, arg_6_0.event)
	arg_6_0.taskTrackPanel = Island3dTaskTrackPanel.New(arg_6_0._tf, arg_6_0.event)
	arg_6_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_6_0._tf, arg_6_0.event)
	arg_6_0.btnContainer = IslandMainBtnContainer.New(arg_6_0._tf:Find("top/btn_container"), arg_6_0.event)
end

function var_0_0.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0.visitorBtn, function()
		arg_7_0:OpenPage(IslandVisitorPage)
	end, SFX_PANEL)
	arg_7_0:SetUp()

	local var_7_0 = arg_7_0.contextData.resumeCallback

	arg_7_0.contextData.resumeCallback = nil

	existCall(var_7_0)
end

function var_0_0.SetUp(arg_9_0)
	seriesAsync({
		function(arg_10_0)
			arg_9_0:SetDressUpIsEmpty(arg_10_0)
		end
	}, function()
		arg_9_0:StartCore()
	end)
end

function var_0_0.SetNameIfIsEmpty(arg_12_0, arg_12_1)
	if not arg_12_0:GetIsland():IsNew() then
		arg_12_1()

		return
	end

	local var_12_0 = IslandSetNamePage.New(arg_12_0)

	var_12_0:ExecuteAction("Show", function()
		var_12_0:Destroy()
		arg_12_1()
	end)
end

function var_0_0.SetDressUpIsEmpty(arg_14_0, arg_14_1)
	if not arg_14_0:GetIsland():GetDressUpAgency():IsNew() then
		arg_14_1()

		return
	end

	arg_14_0:OpenPage(IslandShipFirstDressupPage, arg_14_1)
end

function var_0_0.AddListeners(arg_15_0)
	arg_15_0:AddListener(GAME.ISLAND_UPGRADE_DONE, arg_15_0.OnUpgrade)
	arg_15_0:AddListener(Island.EXP_ADD, arg_15_0.OnExpChange)
	arg_15_0:AddListener(GAME.ISLAND_SET_NAME_DONE, arg_15_0.OnModifyName)
	arg_15_0:AddListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_15_0.OnGetProsperityAward)
	arg_15_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_15_0.OnAddedTask)
	arg_15_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_15_0.OnUpdateTask)
	arg_15_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_15_0.OnRemoveTask)
	arg_15_0:AddListener(IslandAchievementAgency.NEW_CAN_GET, arg_15_0.OnNewAchievementCanGet)
	arg_15_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_15_0.OnFinishDelegation)
	arg_15_0:AddListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_15_0.OnUnlockTechnology)
	arg_15_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_15_0.OnAddShip)
	arg_15_0:AddListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_15_0.OnShipLevelUp)
	arg_15_0:AddListener(IslandCharacterAgency.SHIP_GET_STATE, arg_15_0.OnShipGetState)
	arg_15_0:AddListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_15_0.OnUnlockSystem)
	arg_15_0:AddListener(IslandVisitorAgency.PLAYER_ADD, arg_15_0.OnVisitorNumChange)
	arg_15_0:AddListener(IslandVisitorAgency.PLAYER_EXIT, arg_15_0.OnVisitorNumChange)
	arg_15_0:AddListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_15_0.OnAgoraEnterEditMode)
	arg_15_0:AddListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_15_0.OnAgoraExitEditMode)
	arg_15_0:AddListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_15_0.OnTriggerTask)
	arg_15_0:AddListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_15_0.OnSubmitTask)
	arg_15_0:AddListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_15_0.OnAddTaskProgress)
	arg_15_0:AddListener(ISLAND_EX_EVT.PLAY_STORY, arg_15_0.OnPlayStory)
	arg_15_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP, arg_15_0.OnSwitchMap)
	arg_15_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_15_0.OnSeekGameStart)
	arg_15_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_15_0.OnSeekGameEnd)
	arg_15_0:AddListener(ISLAND_EX_EVT.APPROACH_OBJECT, arg_15_0.OnApproachObject)
	arg_15_0:AddListener(ISLAND_EX_EVT.PLAY_PERFORMANCE, arg_15_0.OnPlayPerformance)
	arg_15_0:AddListener(ISLAND_EX_EVT.SHOW_INTERACTION, arg_15_0.OnShowInteraction)
	arg_15_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_15_0.OnSwitchMapByPoint)
	arg_15_0:AddListener(ISLAND_EX_EVT.NAV_PATH, arg_15_0.OnStartNavPath)
	arg_15_0:AddListener(ISLAND_EX_EVT.NAV_PATH_DONE, arg_15_0.OnNavPathDone)
end

function var_0_0.RemoveListeners(arg_16_0)
	arg_16_0:RemoveListener(GAME.ISLAND_UPGRADE_DONE, arg_16_0.OnUpgrade)
	arg_16_0:RemoveListener(Island.EXP_ADD, arg_16_0.OnExpChange)
	arg_16_0:RemoveListener(GAME.ISLAND_SET_NAME_DONE, arg_16_0.OnModifyName)
	arg_16_0:RemoveListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_16_0.OnGetProsperityAward)
	arg_16_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_16_0.OnAddedTask)
	arg_16_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_16_0.OnUpdateTask)
	arg_16_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_16_0.OnRemoveTask)
	arg_16_0:RemoveListener(IslandAchievementAgency.NEW_CAN_GET, arg_16_0.OnNewAchievementCanGet)
	arg_16_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_16_0.OnFinishDelegation)
	arg_16_0:RemoveListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_16_0.OnUnlockTechnology)
	arg_16_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_16_0.OnAddShip)
	arg_16_0:RemoveListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_16_0.OnShipLevelUp)
	arg_16_0:RemoveListener(IslandCharacterAgency.SHIP_GET_STATE, arg_16_0.OnShipGetState)
	arg_16_0:RemoveListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_16_0.OnUnlockSystem)
	arg_16_0:RemoveListener(IslandVisitorAgency.PLAYER_ADD, arg_16_0.OnVisitorNumChange)
	arg_16_0:RemoveListener(IslandVisitorAgency.PLAYER_EXIT, arg_16_0.OnVisitorNumChange)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_16_0.OnAgoraEnterEditMode)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_16_0.OnAgoraExitEditMode)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_16_0.OnTriggerTask)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_16_0.OnSubmitTask)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_16_0.OnAddTaskProgress)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.PLAY_STORY, arg_16_0.OnPlayStory)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP, arg_16_0.OnSwitchMap)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_16_0.OnSeekGameStart)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_16_0.OnSeekGameEnd)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.APPROACH_OBJECT, arg_16_0.OnApproachObject)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.PLAY_PERFORMANCE, arg_16_0.OnPlayPerformance)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.SHOW_INTERACTION, arg_16_0.OnShowInteraction)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_16_0.OnSwitchMapByPoint)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.NAV_PATH, arg_16_0.OnStartNavPath)
	arg_16_0:RemoveListener(ISLAND_EX_EVT.NAV_PATH_DONE, arg_16_0.OnNavPathDone)
end

function var_0_0.OnOpenAnimatonOpPage(arg_17_0)
	arg_17_0.btnContainer:ActiveOrDisactive(false)
end

function var_0_0.OnCloseAnimatonOpPage(arg_18_0)
	arg_18_0.btnContainer:ActiveOrDisactive(true)
end

function var_0_0.OnStartNavPath(arg_19_0, arg_19_1)
	if arg_19_1 then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_19_1
		})
	end
end

function var_0_0.OnNavPathDone(arg_20_0, arg_20_1)
	if arg_20_1 then
		arg_20_0:GetIsland():DispatchEvent(IslandProxy.END_PATHFINDER)
	end
end

function var_0_0.OnExpChange(arg_21_0)
	arg_21_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.ShowExpAdd(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.levelPanel:ExecuteAction("ShowExpAdd", arg_22_1, arg_22_2)
end

function var_0_0.OnSwitchMapByPoint(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1.mapId

	arg_23_0:GetIsland():SetLastExitPosition(arg_23_1.mapId, arg_23_1.position, arg_23_1.rotation)
	arg_23_0:emit(IslandBaseMediator.SWITCH_MAP, var_23_0)
end

function var_0_0.OnShowInteraction(arg_24_0, arg_24_1)
	IslandGuideChecker.CheckOnShowInteraction(arg_24_1)
end

function var_0_0.OnPlayPerformance(arg_25_0, arg_25_1)
	arg_25_0:PlayPerformance(arg_25_1)
end

function var_0_0.OnSeekGameStart(arg_26_0)
	arg_26_0:TryDisVisible()
end

function var_0_0.OnSeekGameEnd(arg_27_0)
	arg_27_0:TryVisible()
end

function var_0_0.OnSwitchMap(arg_28_0, arg_28_1)
	local var_28_0 = pg.island_world_objects[arg_28_1].mapId

	arg_28_0:emit(IslandBaseMediator.SWITCH_MAP, var_28_0, arg_28_1)
end

function var_0_0.OnPlayStory(arg_29_0, arg_29_1)
	arg_29_0:PlayStory(arg_29_1)
end

function var_0_0.OnTriggerTask(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetIsland():GetTaskAgency():GetFutureTask(arg_30_1)

	if var_30_0 and var_30_0:IsUnlock() then
		arg_30_0:emit(IslandMediator.ON_ACCEPT_TASK, {
			arg_30_1
		})
	end
end

function var_0_0.OnSubmitTask(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:GetIsland():GetTaskAgency():GetTask(arg_31_1)

	if var_31_0 and var_31_0:IsFinish() then
		arg_31_0:emit(IslandMediator.ON_SUBMIT_TASK, arg_31_1)
	end
end

function var_0_0.OnAddTaskProgress(arg_32_0, arg_32_1, arg_32_2)
	IslandTaskHelper.UpdateClientTaskProgress(arg_32_1, arg_32_2)
end

function var_0_0.OnApproachObject(arg_33_0, arg_33_1)
	IslandTaskHelper.OnApproach(arg_33_1)
end

function var_0_0.OnUpdateTrackTask(arg_34_0, arg_34_1)
	arg_34_0.traceTaskId = arg_34_1

	if arg_34_0.traceTaskId ~= 0 then
		if not arg_34_0.taskTrackPanel:isShowing() then
			arg_34_0.taskTrackPanel:ExecuteAction("Show")
		else
			arg_34_0.taskTrackPanel:ExecuteAction("UpdateTask")
		end
	end

	arg_34_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnAddedTask(arg_35_0, arg_35_1)
	arg_35_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnUpdateTask(arg_36_0, arg_36_1)
	if arg_36_0.traceTaskId and arg_36_0.traceTaskId ~= arg_36_1.id then
		return
	end

	arg_36_0.taskTrackPanel:ExecuteAction("UpdateProgress", arg_36_1)
	arg_36_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnRemoveTask(arg_37_0, arg_37_1)
	if arg_37_0.traceTaskId and arg_37_0.traceTaskId ~= arg_37_1.id then
		return
	end

	arg_37_0.taskTrackPanel:ExecuteAction("RemoveTask")
	arg_37_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.UpdateTaskInfo(arg_38_0)
	local var_38_0 = arg_38_0:GetIsland():GetTaskAgency():GetTraceTask()

	if var_38_0 then
		arg_38_0.traceTaskId = var_38_0.id
	end

	if arg_38_0.traceTaskId and arg_38_0.traceTaskId ~= 0 then
		arg_38_0.taskTrackPanel:ExecuteAction("Show")
	else
		arg_38_0.taskTrackPanel:ExecuteAction("Hide")
	end

	arg_38_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnSetUpCore(arg_39_0, arg_39_1, arg_39_2)
	arg_39_0.approachSpawnPointId = arg_39_2
end

function var_0_0.OnAgoraEnterEditMode(arg_40_0)
	setActive(arg_40_0._tf, false)
end

function var_0_0.OnAgoraExitEditMode(arg_41_0)
	setActive(arg_41_0._tf, true)
end

function var_0_0.OnShipGetState(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1.ship
	local var_42_1 = arg_42_1.status
	local var_42_2 = var_42_0:GetName()

	arg_42_0:ShowToast({
		type = IslandToast.TYPE_STATE,
		content = i18n("island_toast_status", var_42_1:GetName(), var_42_2)
	})
end

function var_0_0.OnShipLevelUp(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1:GetName()
	local var_43_1 = arg_43_1:GetLevel()

	arg_43_0:ShowToast({
		content = i18n("island_toast_level", var_43_1, var_43_0)
	})
end

function var_0_0.OnAddShip(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1:GetName()
	local var_44_1 = arg_44_0:GetIsland():GetName()

	arg_44_0:ShowToast({
		content = i18n("island_toast_ship", var_44_1, var_44_0)
	})
end

function var_0_0.OnNewAchievementCanGet(arg_45_0, arg_45_1)
	if not IslandMainBtnTipHelper.IsUnlock("achievement") then
		return
	end

	arg_45_0:ShowToast({
		content = i18n("island_achv_finish_tip", arg_45_1:getConfig("name"))
	})
end

function var_0_0.OnFinishDelegation(arg_46_0)
	arg_46_0.btnContainer:OnFinishDelegation()
end

function var_0_0.OnUnlockTechnology(arg_47_0)
	arg_47_0.btnContainer:OnUnlockTechnology()
end

function var_0_0.OnUpgrade(arg_48_0, arg_48_1)
	arg_48_0.levelPanel:ExecuteAction("UpdateTip")
	arg_48_0.levelPanel:ExecuteAction("UpdateIslandInfo")
	arg_48_0:OpenPage(IslandUpgradeDisplayPage, arg_48_1.dropData.abilitys, arg_48_1.callback)
end

function var_0_0.OnModifyName(arg_49_0)
	arg_49_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.OnGetProsperityAward(arg_50_0)
	arg_50_0.levelPanel:ExecuteAction("UpdateTip")
end

function var_0_0.OnUnlockSystem(arg_51_0, arg_51_1)
	arg_51_0.btnContainer:OnUnlockSystem(arg_51_1)
	switch(arg_51_1, {
		[pg.island_set.main_page_function_unlock.key_value_varchar[1]] = function()
			arg_51_0.levelPanel:ExecuteAction("Show")
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[2]] = function()
			arg_51_0.unlockTask = true

			arg_51_0.taskTrackPanel:ExecuteAction("SetUnlock")
			arg_51_0:UpdateTaskInfo()
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[3]] = function()
			setActive(arg_51_0.visitorBtn, true)
			arg_51_0:UpdateVisitorBtn()
		end
	}, function()
		return
	end)
end

function var_0_0.OnVisitorNumChange(arg_56_0)
	arg_56_0:UpdateVisitorBtn()
end

function var_0_0.OnSceneLoaded(arg_57_0)
	arg_57_0:HandleAwardDisplay({})
	var_0_0.super.OnSceneLoaded(arg_57_0)

	local var_57_0 = arg_57_0:GetIsland():GetAblityAgency()

	if var_57_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[1]) then
		arg_57_0.levelPanel:ExecuteAction("Show")
	end

	arg_57_0.unlockTask = var_57_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[2])

	if arg_57_0.unlockTask then
		arg_57_0:UpdateTaskInfo()
	end

	local var_57_1 = var_57_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[3])

	setActive(arg_57_0.visitorBtn, var_57_1)

	if var_57_1 then
		arg_57_0:UpdateVisitorBtn()
	end

	if arg_57_0.approachSpawnPointId then
		arg_57_0:OnApproachObject(arg_57_0.approachSpawnPointId)

		arg_57_0.approachSpawnPointId = nil
	end

	arg_57_0:SequenceCheck()
end

function var_0_0.SequenceCheck(arg_58_0)
	seriesAsync({
		function(arg_59_0)
			if pg.NewStoryMgr.GetInstance():IsPlayed("ISLAND1001001_1") then
				arg_59_0()
			else
				arg_58_0:PlayPerformance({
					name = "ISLANDPERFORMANCE1",
					callback = arg_59_0
				})
			end
		end,
		function(arg_60_0)
			if arg_58_0:GetIsland():GetSeasonAgency():NeedReset() then
				arg_58_0:emit(IslandMediator.ON_RESET_SEASON, arg_60_0)
			else
				arg_60_0()
			end
		end,
		function(arg_61_0)
			local var_61_0, var_61_1, var_61_2 = arg_58_0:GetIsland():GetSeasonAgency():IsShowResetTip()

			if var_61_0 then
				local var_61_3 = var_61_1 > 0 and i18n("island_season_window_end2", var_61_1) or i18n("island_season_window_end")

				arg_58_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_SEASON_TIP,
					tipTitle = var_61_3,
					content = i18n("island_season_window_rule"),
					onHide = function()
						arg_58_0:GetIsland():GetSeasonAgency():SetResetTipFlag(var_61_1)
						arg_61_0()
					end
				})
			else
				arg_61_0()
			end
		end,
		function(arg_63_0)
			local var_63_0 = arg_58_0:GetIsland():GetTicketAgency():GetExpiredTickets()

			if #var_63_0 > 0 then
				arg_58_0:emit(IslandMediator.REMOVE_EXPIRED_TICKETS, var_63_0, arg_63_0)
			else
				arg_63_0()
			end
		end,
		function(arg_64_0)
			local var_64_0 = arg_58_0:GetIsland():GetTicketAgency():GetExpireRemindTickets()

			if #var_64_0 > 0 then
				arg_58_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_TICKET_EXPIRED,
					body = {
						type = IslandTicketExpiredMsgBoxWindow.TYPES.REMIND,
						tickets = var_64_0
					},
					onHide = function()
						arg_58_0:GetIsland():GetTicketAgency():SetRemindFlag()
						arg_64_0()
					end
				})
			else
				arg_64_0()
			end
		end,
		function(arg_66_0)
			arg_58_0:GetIsland():GetTaskAgency():TrySubmitAutoTasks(arg_66_0)
		end,
		function(arg_67_0)
			arg_58_0:GetIsland():GetTaskAgency():TryAcceptAutoTasks(arg_67_0)
		end
	}, function()
		IslandGuideChecker.CheckOnLoaded(arg_58_0:GetIsland():GetMapId())
	end)
end

function var_0_0.UpdateVisitorBtn(arg_69_0)
	setText(arg_69_0.visitorBtn:Find("num"), arg_69_0:GetIsland():GetVisitorAgency():GetVisitorCnt())
	setText(arg_69_0.visitorBtn:Find("Text"), i18n("island_visitor_button"))
end

function var_0_0.UpdateMainAwardReward(arg_70_0, arg_70_1)
	arg_70_0.awardDisplayPanel:ExecuteAction("ShowAwards", arg_70_1)
end

function var_0_0.OnUnloadScene(arg_71_0)
	return
end

function var_0_0.OnVisible(arg_72_0)
	arg_72_0:UpdateTaskInfo()
	arg_72_0.btnContainer:Flush()

	if not arg_72_0:GetSubView(IslandStoryMgr):IsRunning() and not arg_72_0.poppingQueue:AnyPlayerIsRunning() then
		IslandGuideChecker.CheckOnLoaded(arg_72_0:GetIsland():GetMapId())
	end
end

function var_0_0.willExit(arg_73_0)
	if arg_73_0.btnContainer then
		arg_73_0.btnContainer:Dispose()

		arg_73_0.btnContainer = nil
	end

	if arg_73_0.levelPanel then
		arg_73_0.levelPanel:Destroy()

		arg_73_0.levelPanel = nil
	end

	if arg_73_0.taskTrackPanel then
		arg_73_0.taskTrackPanel:Destroy()

		arg_73_0.taskTrackPanel = nil
	end

	if arg_73_0.awardDisplayPanel then
		arg_73_0.awardDisplayPanel:Destroy()

		arg_73_0.awardDisplayPanel = nil
	end
end

return var_0_0
