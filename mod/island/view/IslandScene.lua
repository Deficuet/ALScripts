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
	arg_10_0.visitorBtn = arg_10_0:findTF("top/visitor")
	arg_10_0.levelPanel = IslandLevelPanel.New(arg_10_0._tf, arg_10_0.event)
	arg_10_0.taskTrackPanel = Island3dTaskTrackPanel.New(arg_10_0._tf, arg_10_0.event)
	arg_10_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_10_0._tf, arg_10_0.event)
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
	arg_20_0:RemoveListener(ISLAND_EX_EVT.APPROACH_OBJECT, arg_20_0.OnApproachObject)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.PLAY_PERFORMANCE, arg_20_0.OnPlayPerformance)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SHOW_INTERACTION, arg_20_0.OnShowInteraction)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_20_0.OnSwitchMapByPoint)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.NAV_PATH, arg_20_0.OnStartNavPath)
	arg_20_0:RemoveListener(ISLAND_EX_EVT.NAV_PATH_DONE, arg_20_0.OnNavPathDone)
end

function var_0_0.OnOpenAnimatonOpPage(arg_21_0)
	arg_21_0.btnContainer:ActiveOrDisactive(false)
end

function var_0_0.OnCloseAnimatonOpPage(arg_22_0)
	arg_22_0.btnContainer:ActiveOrDisactive(true)
end

function var_0_0.OnStartNavPath(arg_23_0, arg_23_1)
	if arg_23_1 then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_23_1
		})
	end
end

function var_0_0.OnNavPathDone(arg_24_0, arg_24_1)
	arg_24_0:GetIsland():DispatchEvent(IslandProxy.END_PATHFINDER)
end

function var_0_0.OnExpChange(arg_25_0)
	arg_25_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.ShowExpAdd(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.levelPanel:ExecuteAction("ShowExpAdd", arg_26_1, arg_26_2)
end

function var_0_0.OnSwitchMapByPoint(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1.mapId

	arg_27_0:GetIsland():SetLastExitPosition(arg_27_1.mapId, arg_27_1.position, arg_27_1.rotation)
	arg_27_0:emit(IslandBaseMediator.SWITCH_MAP, var_27_0)
end

function var_0_0.OnShowInteraction(arg_28_0, arg_28_1)
	IslandGuideChecker.CheckOnShowInteraction(arg_28_1)
end

function var_0_0.OnPlayPerformance(arg_29_0, arg_29_1)
	arg_29_0:PlayPerformance(arg_29_1)
end

function var_0_0.OnSeekGameStart(arg_30_0)
	arg_30_0:TryDisVisible()
end

function var_0_0.OnSeekGameEnd(arg_31_0)
	arg_31_0:TryVisible()
end

function var_0_0.OnSwitchMap(arg_32_0, arg_32_1)
	local var_32_0 = pg.island_world_objects[arg_32_1].mapId

	arg_32_0:emit(IslandBaseMediator.SWITCH_MAP, var_32_0, arg_32_1)
end

function var_0_0.OnPlayStory(arg_33_0, arg_33_1)
	arg_33_0:PlayStory(arg_33_1)
end

function var_0_0.OnTriggerTask(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetIsland():GetTaskAgency():GetFutureTask(arg_34_1)

	if var_34_0 and var_34_0:IsUnlock() then
		arg_34_0:emit(IslandMediator.ON_ACCEPT_TASK, {
			arg_34_1
		})
	end
end

function var_0_0.OnSubmitTask(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0:GetIsland():GetTaskAgency():GetTask(arg_35_1)

	if var_35_0 and var_35_0:IsFinish() then
		arg_35_0:emit(IslandMediator.ON_SUBMIT_TASK, arg_35_1)
	end
end

function var_0_0.OnAddTaskProgress(arg_36_0, arg_36_1, arg_36_2)
	IslandTaskHelper.UpdateClientTaskProgress(arg_36_1, arg_36_2)
end

function var_0_0.OnApproachObject(arg_37_0, arg_37_1)
	IslandTaskHelper.OnApproach(arg_37_1)
end

function var_0_0.OnUpdateTrackTask(arg_38_0, arg_38_1)
	arg_38_0.traceTaskId = arg_38_1

	if arg_38_0.traceTaskId ~= 0 then
		if not arg_38_0.taskTrackPanel:isShowing() then
			arg_38_0.taskTrackPanel:ExecuteAction("Show")
		else
			arg_38_0.taskTrackPanel:ExecuteAction("UpdateTask")
		end
	end

	arg_38_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnAddedTask(arg_39_0, arg_39_1)
	arg_39_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnUpdateTask(arg_40_0, arg_40_1)
	if arg_40_0.traceTaskId and arg_40_0.traceTaskId ~= arg_40_1.id then
		return
	end

	arg_40_0.taskTrackPanel:ExecuteAction("UpdateProgress", arg_40_1)
	arg_40_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnRemoveTask(arg_41_0, arg_41_1)
	if arg_41_0.traceTaskId and arg_41_0.traceTaskId ~= arg_41_1.id then
		return
	end

	arg_41_0.taskTrackPanel:ExecuteAction("RemoveTask")
	arg_41_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.UpdateTaskInfo(arg_42_0)
	local var_42_0 = arg_42_0:GetIsland():GetTaskAgency():GetTraceTask()

	if var_42_0 then
		arg_42_0.traceTaskId = var_42_0.id
	end

	if arg_42_0.traceTaskId and arg_42_0.traceTaskId ~= 0 then
		arg_42_0.taskTrackPanel:ExecuteAction("Show")
	else
		arg_42_0.taskTrackPanel:ExecuteAction("Hide")
	end

	arg_42_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnSetUpCore(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0.approachSpawnPointId = arg_43_2
end

function var_0_0.OnAgoraEnterEditMode(arg_44_0)
	setActive(arg_44_0._tf, false)
end

function var_0_0.OnAgoraExitEditMode(arg_45_0)
	setActive(arg_45_0._tf, true)
end

function var_0_0.OnShipGetState(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1.ship
	local var_46_1 = arg_46_1.status
	local var_46_2 = var_46_0:GetName()

	arg_46_0:ShowToast({
		type = IslandToast.TYPE_STATE,
		content = i18n("island_toast_status", var_46_1:GetName(), var_46_2)
	})
end

function var_0_0.OnShipLevelUp(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_1:GetName()
	local var_47_1 = arg_47_1:GetLevel()

	arg_47_0:ShowToast({
		content = i18n("island_toast_level", var_47_1, var_47_0)
	})
end

function var_0_0.OnAddShip(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_1:GetName()
	local var_48_1 = arg_48_0:GetIsland():GetName()

	arg_48_0:ShowToast({
		content = i18n("island_toast_ship", var_48_1, var_48_0)
	})
end

function var_0_0.OnNewAchievementCanGet(arg_49_0, arg_49_1)
	if not IslandMainBtnTipHelper.IsUnlock("achievement") then
		return
	end

	arg_49_0:ShowToast({
		content = i18n("island_achv_finish_tip", arg_49_1:getConfig("name"))
	})
end

function var_0_0.OnFinishDelegation(arg_50_0)
	arg_50_0.btnContainer:OnFinishDelegation()
end

function var_0_0.OnUnlockTechnology(arg_51_0)
	arg_51_0.btnContainer:OnUnlockTechnology()
end

function var_0_0.OnUpgrade(arg_52_0, arg_52_1)
	arg_52_0.levelPanel:ExecuteAction("UpdateTip")
	arg_52_0.levelPanel:ExecuteAction("UpdateIslandInfo")
	arg_52_0:OpenPage(IslandUpgradeDisplayPage, arg_52_1.dropData.abilitys, arg_52_1.callback)
end

function var_0_0.OnModifyName(arg_53_0)
	arg_53_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.OnGetProsperityAward(arg_54_0)
	arg_54_0.levelPanel:ExecuteAction("UpdateTip")
end

function var_0_0.OnUnlockSystem(arg_55_0, arg_55_1)
	arg_55_0.btnContainer:OnUnlockSystem(arg_55_1)
	switch(arg_55_1, {
		[pg.island_set.main_page_function_unlock.key_value_varchar[1]] = function()
			arg_55_0.levelPanel:ExecuteAction("Show")
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[2]] = function()
			arg_55_0.unlockTask = true

			arg_55_0.taskTrackPanel:ExecuteAction("SetUnlock")
			arg_55_0:UpdateTaskInfo()
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[3]] = function()
			setActive(arg_55_0.visitorBtn, true)
			arg_55_0:UpdateVisitorBtn()
		end
	}, function()
		return
	end)
end

function var_0_0.OnVisitorNumChange(arg_60_0)
	arg_60_0:UpdateVisitorBtn()
end

function var_0_0.OnSceneLoaded(arg_61_0)
	arg_61_0:HandleAwardDisplay({})
	var_0_0.super.OnSceneLoaded(arg_61_0)

	local var_61_0 = arg_61_0:GetIsland():GetAblityAgency()

	if var_61_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[1]) then
		arg_61_0.levelPanel:ExecuteAction("Show")
	end

	arg_61_0.unlockTask = var_61_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[2])

	if arg_61_0.unlockTask then
		arg_61_0:UpdateTaskInfo()
	end

	local var_61_1 = var_61_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[3])

	setActive(arg_61_0.visitorBtn, var_61_1)

	if var_61_1 then
		arg_61_0:UpdateVisitorBtn()
	end

	if arg_61_0.approachSpawnPointId then
		arg_61_0:OnApproachObject(arg_61_0.approachSpawnPointId)

		arg_61_0.approachSpawnPointId = nil
	end

	arg_61_0:SequenceCheck()
end

function var_0_0.SequenceCheck(arg_62_0)
	seriesAsync({
		function(arg_63_0)
			if pg.NewStoryMgr.GetInstance():IsPlayed("ISLAND1001001_1") then
				arg_63_0()
			else
				arg_62_0:PlayPerformance({
					name = "ISLANDPERFORMANCE1",
					callback = arg_63_0
				})
			end
		end,
		function(arg_64_0)
			if arg_62_0:GetIsland():GetSeasonAgency():NeedReset() then
				arg_62_0:emit(IslandMediator.ON_RESET_SEASON, arg_64_0)
			else
				arg_64_0()
			end
		end,
		function(arg_65_0)
			local var_65_0, var_65_1, var_65_2 = arg_62_0:GetIsland():GetSeasonAgency():IsShowResetTip()

			if var_65_0 then
				local var_65_3 = var_65_1 > 0 and i18n("island_season_window_end2", var_65_1) or i18n("island_season_window_end")

				arg_62_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_SEASON_TIP,
					tipTitle = var_65_3,
					content = i18n("island_season_window_rule"),
					onHide = function()
						arg_62_0:GetIsland():GetSeasonAgency():SetResetTipFlag(var_65_1)
						arg_65_0()
					end
				})
			else
				arg_65_0()
			end
		end,
		function(arg_67_0)
			local var_67_0 = arg_62_0:GetIsland():GetTicketAgency():GetExpiredTickets()

			if #var_67_0 > 0 then
				arg_62_0:emit(IslandMediator.REMOVE_EXPIRED_TICKETS, var_67_0, arg_67_0)
			else
				arg_67_0()
			end
		end,
		function(arg_68_0)
			local var_68_0 = arg_62_0:GetIsland():GetTicketAgency():GetExpireRemindTickets()

			if #var_68_0 > 0 then
				arg_62_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_TICKET_EXPIRED,
					body = {
						type = IslandTicketExpiredMsgBoxWindow.TYPES.REMIND,
						tickets = var_68_0
					},
					onHide = function()
						arg_62_0:GetIsland():GetTicketAgency():SetRemindFlag()
						arg_68_0()
					end
				})
			else
				arg_68_0()
			end
		end,
		function(arg_70_0)
			arg_62_0:GetIsland():GetTaskAgency():TrySubmitAutoTasks(arg_70_0)
		end,
		function(arg_71_0)
			arg_62_0:GetIsland():GetTaskAgency():TryAcceptAutoTasks(arg_71_0)
		end
	}, function()
		IslandGuideChecker.CheckOnLoaded(arg_62_0:GetIsland():GetMapId())
	end)
end

function var_0_0.UpdateVisitorBtn(arg_73_0)
	setText(arg_73_0.visitorBtn:Find("num"), arg_73_0:GetIsland():GetVisitorAgency():GetVisitorCnt())
	setText(arg_73_0.visitorBtn:Find("Text"), i18n("island_visitor_button"))
end

function var_0_0.UpdateMainAwardReward(arg_74_0, arg_74_1)
	arg_74_0.awardDisplayPanel:ExecuteAction("ShowAwards", arg_74_1)
end

function var_0_0.OnUnloadScene(arg_75_0)
	return
end

function var_0_0.OnVisible(arg_76_0)
	arg_76_0:UpdateTaskInfo()
	arg_76_0.btnContainer:Flush()

	if not arg_76_0:GetSubView(IslandStoryMgr):IsRunning() and not arg_76_0.poppingQueue:AnyPlayerIsRunning() then
		IslandGuideChecker.CheckOnLoaded(arg_76_0:GetIsland():GetMapId())
	end
end

function var_0_0.willExit(arg_77_0)
	if arg_77_0.btnContainer then
		arg_77_0.btnContainer:Dispose()

		arg_77_0.btnContainer = nil
	end

	if arg_77_0.levelPanel then
		arg_77_0.levelPanel:Destroy()

		arg_77_0.levelPanel = nil
	end

	if arg_77_0.taskTrackPanel then
		arg_77_0.taskTrackPanel:Destroy()

		arg_77_0.taskTrackPanel = nil
	end

	if arg_77_0.awardDisplayPanel then
		arg_77_0.awardDisplayPanel:Destroy()

		arg_77_0.awardDisplayPanel = nil
	end
end

return var_0_0
