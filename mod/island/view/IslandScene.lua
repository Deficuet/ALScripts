local var_0_0 = class("IslandScene", import(".base.IslandBaseScene"))

var_0_0.ON_INVENTORY_FILTER = "IslandScene:ON_INVENTORY_FILTER"
var_0_0.ON_CHECK_ORDER_EXP_AWARD = "IslandScene:ON_CHECK_ORDER_EXP_AWARD"

function var_0_0.getUIName(arg_1_0)
	return "IslandUI"
end

function var_0_0.GetIsland(arg_2_0)
	return getProxy(IslandProxy):GetIsland()
end

function var_0_0.PlayBGM(arg_3_0)
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.init(arg_4_0)
	arg_4_0.visitorBtn = arg_4_0:findTF("top/visitor")
	arg_4_0.levelPanel = IslandLevelPanel.New(arg_4_0._tf, arg_4_0.event)
	arg_4_0.taskTrackPanel = Island3dTaskTrackPanel.New(arg_4_0._tf, arg_4_0.event)
	arg_4_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_4_0._tf, arg_4_0.event)
	arg_4_0.btnContainer = IslandMainBtnContainer.New(arg_4_0._tf:Find("top/btn_container"), arg_4_0.event)
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.visitorBtn, function()
		arg_5_0:OpenPage(IslandVisitorPage)
	end, SFX_PANEL)
	arg_5_0:SetUp()
end

function var_0_0.SetUp(arg_7_0)
	seriesAsync({
		function(arg_8_0)
			arg_7_0:SetDressUpIsEmpty(arg_8_0)
		end
	}, function()
		arg_7_0:StartCore()
	end)
end

function var_0_0.SetNameIfIsEmpty(arg_10_0, arg_10_1)
	if not arg_10_0:GetIsland():IsNew() then
		arg_10_1()

		return
	end

	local var_10_0 = IslandSetNamePage.New(arg_10_0)

	var_10_0:ExecuteAction("Show", function()
		var_10_0:Destroy()
		arg_10_1()
	end)
end

function var_0_0.SetDressUpIsEmpty(arg_12_0, arg_12_1)
	if not arg_12_0:GetIsland():GetDressUpAgency():IsNew() then
		arg_12_1()

		return
	end

	arg_12_0:OpenPage(IslandShipFirstDressupPage, arg_12_1)
end

function var_0_0.AddListeners(arg_13_0)
	arg_13_0:AddListener(GAME.ISLAND_UPGRADE_DONE, arg_13_0.OnUpgrade)
	arg_13_0:AddListener(Island.EXP_ADD, arg_13_0.OnExpChange)
	arg_13_0:AddListener(GAME.ISLAND_SET_NAME_DONE, arg_13_0.OnModifyName)
	arg_13_0:AddListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_13_0.OnGetProsperityAward)
	arg_13_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_13_0.OnAddedTask)
	arg_13_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_13_0.OnUpdateTask)
	arg_13_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_13_0.OnRemoveTask)
	arg_13_0:AddListener(IslandAchievementAgency.NEW_CAN_GET, arg_13_0.OnNewAchievementCanGet)
	arg_13_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_13_0.OnFinishDelegation)
	arg_13_0:AddListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_13_0.OnUnlockTechnology)
	arg_13_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_13_0.OnAddShip)
	arg_13_0:AddListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_13_0.OnShipLevelUp)
	arg_13_0:AddListener(IslandCharacterAgency.SHIP_GET_STATE, arg_13_0.OnShipGetState)
	arg_13_0:AddListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_13_0.OnUnlockSystem)
	arg_13_0:AddListener(IslandVisitorAgency.PLAYER_ADD, arg_13_0.OnVisitorNumChange)
	arg_13_0:AddListener(IslandVisitorAgency.PLAYER_EXIT, arg_13_0.OnVisitorNumChange)
	arg_13_0:AddListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_13_0.OnAgoraEnterEditMode)
	arg_13_0:AddListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_13_0.OnAgoraExitEditMode)
	arg_13_0:AddListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_13_0.OnTriggerTask)
	arg_13_0:AddListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_13_0.OnSubmitTask)
	arg_13_0:AddListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_13_0.OnAddTaskProgress)
	arg_13_0:AddListener(ISLAND_EX_EVT.PLAY_STORY, arg_13_0.OnPlayStory)
	arg_13_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP, arg_13_0.OnSwitchMap)
	arg_13_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_13_0.OnSeekGameStart)
	arg_13_0:AddListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_13_0.OnSeekGameEnd)
	arg_13_0:AddListener(ISLAND_EX_EVT.APPROACH_OBJECT, arg_13_0.OnApproachObject)
	arg_13_0:AddListener(ISLAND_EX_EVT.PLAY_PERFORMANCE, arg_13_0.OnPlayPerformance)
	arg_13_0:AddListener(ISLAND_EX_EVT.SHOW_INTERACTION, arg_13_0.OnShowInteraction)
	arg_13_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_13_0.OnSwitchMapByPoint)
	arg_13_0:AddListener(ISLAND_EX_EVT.NAV_PATH_DONE, arg_13_0.OnNavPathDone)
	arg_13_0:AddListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_13_0.OnOpenAnimatonOpPage)
	arg_13_0:AddListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_13_0.OnCloseAnimatonOpPage)
end

function var_0_0.RemoveListeners(arg_14_0)
	arg_14_0:RemoveListener(GAME.ISLAND_UPGRADE_DONE, arg_14_0.OnUpgrade)
	arg_14_0:RemoveListener(Island.EXP_ADD, arg_14_0.OnExpChange)
	arg_14_0:RemoveListener(GAME.ISLAND_SET_NAME_DONE, arg_14_0.OnModifyName)
	arg_14_0:RemoveListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_14_0.OnGetProsperityAward)
	arg_14_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_14_0.OnAddedTask)
	arg_14_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_14_0.OnUpdateTask)
	arg_14_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_14_0.OnRemoveTask)
	arg_14_0:RemoveListener(IslandAchievementAgency.NEW_CAN_GET, arg_14_0.OnNewAchievementCanGet)
	arg_14_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_14_0.OnFinishDelegation)
	arg_14_0:RemoveListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_14_0.OnUnlockTechnology)
	arg_14_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_14_0.OnAddShip)
	arg_14_0:RemoveListener(IslandCharacterAgency.SHIP_LEVEL_UP, arg_14_0.OnShipLevelUp)
	arg_14_0:RemoveListener(IslandCharacterAgency.SHIP_GET_STATE, arg_14_0.OnShipGetState)
	arg_14_0:RemoveListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_14_0.OnUnlockSystem)
	arg_14_0:RemoveListener(IslandVisitorAgency.PLAYER_ADD, arg_14_0.OnVisitorNumChange)
	arg_14_0:RemoveListener(IslandVisitorAgency.PLAYER_EXIT, arg_14_0.OnVisitorNumChange)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.ENTER_EDIT_AGORA, arg_14_0.OnAgoraEnterEditMode)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.EXIT_EDIT_AGORA, arg_14_0.OnAgoraExitEditMode)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.TRIGGER_TASK, arg_14_0.OnTriggerTask)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.SUBMIT_TASK, arg_14_0.OnSubmitTask)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.ADD_TASK_PROGRESS, arg_14_0.OnAddTaskProgress)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.PLAY_STORY, arg_14_0.OnPlayStory)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP, arg_14_0.OnSwitchMap)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_START, arg_14_0.OnSeekGameStart)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.SEEK_GAME_END, arg_14_0.OnSeekGameEnd)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.APPROACH_OBJECT, arg_14_0.OnApproachObject)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.PLAY_PERFORMANCE, arg_14_0.OnPlayPerformance)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.SHOW_INTERACTION, arg_14_0.OnShowInteraction)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_14_0.OnSwitchMapByPoint)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.NAV_PATH_DONE, arg_14_0.OnNavPathDone)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_14_0.OnOpenAnimatonOpPage)
	arg_14_0:RemoveListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_14_0.OnCloseAnimatonOpPage)
end

function var_0_0.OnOpenAnimatonOpPage(arg_15_0)
	arg_15_0.btnContainer:ActiveOrDisactive(false)
end

function var_0_0.OnCloseAnimatonOpPage(arg_16_0)
	arg_16_0.btnContainer:ActiveOrDisactive(true)
end

function var_0_0.OnNavPathDone(arg_17_0, arg_17_1)
	if arg_17_1 then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_17_1,
			callback = function()
				arg_17_0:GetIsland():DispatchEvent(IslandProxy.END_PATHFINDER)
			end
		})
	end
end

function var_0_0.OnExpChange(arg_19_0)
	arg_19_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.ShowExpAdd(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.levelPanel:ExecuteAction("ShowExpAdd", arg_20_1, arg_20_2)
end

function var_0_0.OnSwitchMapByPoint(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.mapId

	arg_21_0:GetIsland():SetLastExitPosition(arg_21_1.mapId, arg_21_1.position, arg_21_1.rotation)
	arg_21_0:emit(IslandBaseMediator.SWITCH_MAP, var_21_0)
end

function var_0_0.OnShowInteraction(arg_22_0, arg_22_1)
	IslandGuideChecker.CheckOnShowInteraction(arg_22_1)
end

function var_0_0.OnPlayPerformance(arg_23_0, arg_23_1)
	arg_23_0:PlayPerformance(arg_23_1)
end

function var_0_0.OnSeekGameStart(arg_24_0)
	arg_24_0:TryDisVisible()
end

function var_0_0.OnSeekGameEnd(arg_25_0)
	arg_25_0:TryVisible()
end

function var_0_0.OnSwitchMap(arg_26_0, arg_26_1)
	local var_26_0 = pg.island_world_objects[arg_26_1].mapId

	arg_26_0:emit(IslandBaseMediator.SWITCH_MAP, var_26_0, arg_26_1)
end

function var_0_0.OnPlayStory(arg_27_0, arg_27_1)
	arg_27_0:PlayStory(arg_27_1)
end

function var_0_0.OnTriggerTask(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0:GetIsland():GetTaskAgency():GetFutureTask(arg_28_1)

	if var_28_0 and var_28_0:IsUnlock() then
		arg_28_0:emit(IslandMediator.ON_ACCEPT_TASK, {
			arg_28_1
		})
	end
end

function var_0_0.OnSubmitTask(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:GetIsland():GetTaskAgency():GetTask(arg_29_1)

	if var_29_0 and var_29_0:IsFinish() then
		arg_29_0:emit(IslandMediator.ON_SUBMIT_TASK, arg_29_1)
	end
end

function var_0_0.OnAddTaskProgress(arg_30_0, arg_30_1, arg_30_2)
	IslandTaskHelper.UpdateClientTaskProgress(arg_30_1, arg_30_2)
end

function var_0_0.OnApproachObject(arg_31_0, arg_31_1)
	IslandTaskHelper.OnApproach(arg_31_1)
end

function var_0_0.OnUpdateTrackTask(arg_32_0, arg_32_1)
	arg_32_0.traceTaskId = arg_32_1

	if arg_32_0.traceTaskId ~= 0 then
		if not arg_32_0.taskTrackPanel:isShowing() then
			arg_32_0.taskTrackPanel:ExecuteAction("Show")
		else
			arg_32_0.taskTrackPanel:ExecuteAction("UpdateTask")
		end
	end

	arg_32_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnAddedTask(arg_33_0, arg_33_1)
	arg_33_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnUpdateTask(arg_34_0, arg_34_1)
	if arg_34_0.traceTaskId and arg_34_0.traceTaskId ~= arg_34_1.id then
		return
	end

	arg_34_0.taskTrackPanel:ExecuteAction("UpdateProgress", arg_34_1)
	arg_34_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnRemoveTask(arg_35_0, arg_35_1)
	if arg_35_0.traceTaskId and arg_35_0.traceTaskId ~= arg_35_1.id then
		return
	end

	arg_35_0.taskTrackPanel:ExecuteAction("RemoveTask")
	arg_35_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.UpdateTaskInfo(arg_36_0)
	local var_36_0 = arg_36_0:GetIsland():GetTaskAgency():GetTraceTask()

	if var_36_0 then
		arg_36_0.traceTaskId = var_36_0.id
	end

	if arg_36_0.traceTaskId and arg_36_0.traceTaskId ~= 0 then
		arg_36_0.taskTrackPanel:ExecuteAction("Show")
	else
		arg_36_0.taskTrackPanel:ExecuteAction("Hide")
	end

	arg_36_0.btnContainer:OnTrackTaskChange()
end

function var_0_0.OnSetUpCore(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0.approachSpawnPointId = arg_37_2
end

function var_0_0.OnAgoraEnterEditMode(arg_38_0)
	setActive(arg_38_0._tf, false)
end

function var_0_0.OnAgoraExitEditMode(arg_39_0)
	setActive(arg_39_0._tf, true)
end

function var_0_0.OnShipGetState(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1.ship
	local var_40_1 = arg_40_1.status
	local var_40_2 = var_40_0:GetName()

	arg_40_0:ShowToast({
		type = IslandToast.TYPE_STATE,
		content = i18n("island_toast_status", var_40_1:GetName(), var_40_2)
	})
end

function var_0_0.OnShipLevelUp(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1:GetName()
	local var_41_1 = arg_41_1:GetLevel()

	arg_41_0:ShowToast({
		content = i18n("island_toast_level", var_41_1, var_41_0)
	})
end

function var_0_0.OnAddShip(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1:GetName()
	local var_42_1 = arg_42_0:GetIsland():GetName()

	arg_42_0:ShowToast({
		content = i18n("island_toast_ship", var_42_1, var_42_0)
	})
end

function var_0_0.OnNewAchievementCanGet(arg_43_0, arg_43_1)
	arg_43_0:ShowToast({
		content = i18n("island_achv_finish_tip", arg_43_1:getConfig("name"))
	})
end

function var_0_0.OnFinishDelegation(arg_44_0)
	arg_44_0.btnContainer:OnFinishDelegation()
end

function var_0_0.OnUnlockTechnology(arg_45_0)
	arg_45_0.btnContainer:OnUnlockTechnology()
end

function var_0_0.OnUpgrade(arg_46_0, arg_46_1)
	arg_46_0.levelPanel:ExecuteAction("UpdateTip")
	arg_46_0.levelPanel:ExecuteAction("UpdateIslandInfo")
	arg_46_0:OpenPage(IslandUpgradeDisplayPage, arg_46_1.dropData.abilitys, arg_46_1.callback)
	IslandGuideChecker.CheckGuide("ISLAND_GUIDE_5")
end

function var_0_0.OnModifyName(arg_47_0)
	arg_47_0.levelPanel:ExecuteAction("UpdateIslandInfo")
end

function var_0_0.OnGetProsperityAward(arg_48_0)
	arg_48_0.levelPanel:ExecuteAction("UpdateTip")
end

function var_0_0.OnUnlockSystem(arg_49_0, arg_49_1)
	arg_49_0.btnContainer:OnUnlockSystem(arg_49_1)
	switch(arg_49_1, {
		[pg.island_set.main_page_function_unlock.key_value_varchar[1]] = function()
			arg_49_0.levelPanel:ExecuteAction("Show")
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[2]] = function()
			arg_49_0.unlockTask = true

			arg_49_0.taskTrackPanel:ExecuteAction("SetUnlock")
			arg_49_0:UpdateTaskInfo()
		end,
		[pg.island_set.main_page_function_unlock.key_value_varchar[3]] = function()
			setActive(arg_49_0.visitorBtn, true)
			arg_49_0:UpdateVisitorBtn()
		end
	}, function()
		return
	end)
end

function var_0_0.OnVisitorNumChange(arg_54_0)
	arg_54_0:UpdateVisitorBtn()
end

function var_0_0.OnSceneLoaded(arg_55_0)
	arg_55_0:HandleAwardDisplay({})
	var_0_0.super.OnSceneLoaded(arg_55_0)

	local var_55_0 = arg_55_0:GetIsland():GetAblityAgency()

	if var_55_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[1]) then
		arg_55_0.levelPanel:ExecuteAction("Show")
	end

	arg_55_0.unlockTask = var_55_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[2])

	if arg_55_0.unlockTask then
		arg_55_0:UpdateTaskInfo()
	end

	local var_55_1 = var_55_0:HasAbility(pg.island_set.main_page_function_unlock.key_value_varchar[3])

	setActive(arg_55_0.visitorBtn, var_55_1)

	if var_55_1 then
		arg_55_0:UpdateVisitorBtn()
	end

	if arg_55_0.approachSpawnPointId then
		arg_55_0:OnApproachObject(arg_55_0.approachSpawnPointId)

		arg_55_0.approachSpawnPointId = nil
	end

	arg_55_0:SequenceCheck()
end

function var_0_0.SequenceCheck(arg_56_0)
	seriesAsync({
		function(arg_57_0)
			if pg.NewStoryMgr.GetInstance():IsPlayed("ISLAND1001000") then
				arg_57_0()
			else
				pg.NewStoryMgr.GetInstance():Play("ISLAND1001000", arg_57_0)
			end
		end,
		function(arg_58_0)
			if pg.NewStoryMgr.GetInstance():IsPlayed("ISLAND1001001_1") then
				arg_58_0()
			else
				arg_56_0:PlayPerformance({
					name = "ISLANDPERFORMANCE1",
					callback = arg_58_0
				})
			end
		end,
		function(arg_59_0)
			if arg_56_0:GetIsland():GetSeasonAgency():NeedReset() then
				arg_56_0:emit(IslandMediator.ON_RESET_SEASON, arg_59_0)
			else
				arg_59_0()
			end
		end,
		function(arg_60_0)
			local var_60_0, var_60_1, var_60_2 = arg_56_0:GetIsland():GetSeasonAgency():IsShowResetTip()

			if var_60_0 then
				local var_60_3 = var_60_1 > 0 and i18n("island_season_window_end2", var_60_1) or i18n("island_season_window_end")

				arg_56_0:ShowMsgbox({
					hideNo = true,
					type = IslandMsgBox.TYPE_SEASON_TIP,
					tipTitle = var_60_3,
					content = i18n("island_season_window_rule"),
					onHide = function()
						arg_56_0:GetIsland():GetSeasonAgency():SetResetTipFlag(var_60_1)
						arg_60_0()
					end
				})
			else
				arg_60_0()
			end
		end,
		function(arg_62_0)
			arg_56_0:GetIsland():GetTaskAgency():TrySubmitAutoTasks(arg_62_0)
		end,
		function(arg_63_0)
			arg_56_0:GetIsland():GetTaskAgency():TryAcceptAutoTasks(arg_63_0)
		end
	}, function()
		IslandGuideChecker.CheckOnLoaded(arg_56_0:GetIsland():GetMapId())
	end)
end

function var_0_0.UpdateVisitorBtn(arg_65_0)
	setText(arg_65_0.visitorBtn:Find("num"), arg_65_0:GetIsland():GetVisitorAgency():GetVisitorCnt())
end

function var_0_0.UpdateMainAwardReward(arg_66_0, arg_66_1)
	arg_66_0.awardDisplayPanel:ExecuteAction("ShowAwards", arg_66_1)
end

function var_0_0.OnUnloadScene(arg_67_0)
	return
end

function var_0_0.OnVisible(arg_68_0)
	arg_68_0:UpdateTaskInfo()
	arg_68_0.btnContainer:Flush()

	if not arg_68_0:GetSubView(IslandStoryMgr):IsRunning() and not arg_68_0.poppingQueue:AnyPlayerIsRunning() then
		IslandGuideChecker.CheckOnLoaded(arg_68_0:GetIsland():GetMapId())
	end
end

function var_0_0.willExit(arg_69_0)
	if arg_69_0.btnContainer then
		arg_69_0.btnContainer:Dispose()

		arg_69_0.btnContainer = nil
	end

	if arg_69_0.levelPanel then
		arg_69_0.levelPanel:Destroy()

		arg_69_0.levelPanel = nil
	end

	if arg_69_0.taskTrackPanel then
		arg_69_0.taskTrackPanel:Destroy()

		arg_69_0.taskTrackPanel = nil
	end

	if arg_69_0.awardDisplayPanel then
		arg_69_0.awardDisplayPanel:Destroy()

		arg_69_0.awardDisplayPanel = nil
	end
end

return var_0_0
