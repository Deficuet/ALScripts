local var_0_0 = class("IslandBaseScene", import("view.base.BaseUI"))

var_0_0.ON_SCENE_LOADED = "IslandBaseScene:ON_SCENE_LOADED"
var_0_0.LINK_CORE_EVENT = "IslandBaseScene:LINK_CORE_EVENT"

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.sceneMgr = IslandSceneMgr.New(arg_1_0)
	arg_1_0.__callbacks__ = {}
	arg_1_0.showBalance = 1
	arg_1_0.cacheAbList = {
		"ui/islandui_atlas",
		"ui/islandcommonui_atlas",
		"island/IslandInteractionBtns"
	}
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = {}

	table.insert(var_2_0, function(arg_3_0)
		arg_2_0:LoadUIContainer(arg_3_0)
	end)
	table.insert(var_2_0, function(arg_4_0)
		arg_2_0.poolMgr = IslandPoolMgr.New(arg_2_0.poolContainer)

		arg_2_0.poolMgr:Init(arg_4_0)
	end)

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.cacheAbList) do
		table.insert(var_2_0, function(arg_5_0)
			AssetBundleHelper.StoreAssetBundle(iter_2_1, true, false, function(arg_6_0)
				arg_5_0()
			end)
		end)
	end

	seriesAsync(var_2_0, arg_2_1)
end

function var_0_0.LoadUIContainer(arg_7_0, arg_7_1)
	ResourceMgr.Inst:getAssetAsync("UI/UIIsland", "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_8_0)
		arg_7_0._container = Object.Instantiate(arg_8_0).transform
		arg_7_0.uiContainer = arg_7_0._container:Find("ui")
		arg_7_0.opContainer = arg_7_0._container:Find("op")
		arg_7_0.pageContainer = arg_7_0._container:Find("page")
		arg_7_0.poolContainer = arg_7_0._container:Find("_pool_")
		arg_7_0._container.name = "UIIsland"

		setParent(arg_7_0._container, pg.UIMgr.GetInstance().UICanvas)
		arg_7_1()
	end), true, true)
end

function var_0_0.SetUIParent(arg_9_0, arg_9_1)
	arg_9_1.transform:SetParent(arg_9_0.uiContainer, false)
end

function var_0_0.emit(arg_10_0, ...)
	if unpack({
		...
	}) == BaseUI.ON_HOME then
		if ISLAND_PLAYER_TESTING then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_home_btn_cant_use"))

			return
		end

		arg_10_0:ExitIsland()
	else
		var_0_0.super.emit(arg_10_0, ...)
	end
end

function var_0_0.emitCoreEvt(arg_11_0, arg_11_1, ...)
	arg_11_0:emit(var_0_0.LINK_CORE_EVENT, arg_11_1, ...)
end

function var_0_0.emitCore(arg_12_0, arg_12_1, ...)
	arg_12_0:emit(var_0_0.LINK_CORE_EVENT, IslandProxy.LINK_CORE, arg_12_1, ...)
end

function var_0_0.ExitIsland(arg_13_0)
	local var_13_0 = arg_13_0:GetIsland()

	seriesAsync({
		function(arg_14_0)
			arg_13_0:emit(IslandBaseMediator.RECORD_PLAYER_POS)
			pg.m02:sendNotification(GAME.ISLAND_EXIT, {
				id = var_13_0.id,
				callback = arg_14_0
			})
		end
	}, function()
		var_0_0.super.emit(arg_13_0, BaseUI.ON_HOME)
	end)
end

function var_0_0.GetIsland(arg_16_0)
	assert(false, "overwrite me !!!!")
end

function var_0_0.onUILoaded(arg_17_0, arg_17_1)
	var_0_0.super.onUILoaded(arg_17_0, arg_17_1)

	arg_17_0.canvasGroup = GetOrAddComponent(arg_17_0._tf, typeof(CanvasGroup))
	arg_17_0.canvasGroup.alpha = 0
	arg_17_0.canvasGroup.blocksRaycasts = false
	arg_17_0.subViews = {
		IslandMsgBox.New(pg.UIMgr.GetInstance().OverlayMain, arg_17_0.event),
		IslandToast.New(pg.UIMgr.GetInstance().OverlayToast, arg_17_0.event),
		IslandStoryMgr.New(pg.UIMgr.GetInstance().OverlayToast, arg_17_0.event),
		IslandAwardDisplayPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_17_0.event),
		IslandQueueUpMsgBox.New(pg.UIMgr.GetInstance().OverlayToast, arg_17_0.event),
		IslandTimelineMgr.New(arg_17_0:GetPoolMgr(), pg.UIMgr.GetInstance().OverlayToast, arg_17_0.event),
		Island3dTaskAcceptPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_17_0.event)
	}
	arg_17_0.monitors = {
		IslandPlayerDataMonitor.New(arg_17_0:GetIsland()),
		IslandSyncDataMonitor.New(arg_17_0:GetIsland())
	}
	arg_17_0.poppingQueue = IslandPoppingQueue.New(arg_17_0)

	arg_17_0:AddListeners()
	arg_17_0:AddListener(ISLAND_EX_EVT.EMIT, arg_17_0.OnEmit)
	arg_17_0:AddListener(ISLAND_EX_EVT.INIT_FINISH, arg_17_0.OnSceneLoaded)
	arg_17_0:AddListener(ISLAND_EX_EVT.SHOW_MSG, arg_17_0.OnShowMsgBox)
	arg_17_0:AddListener(ISLAND_EX_EVT.OPEN_PAGE, arg_17_0.OnOpenPage)
	arg_17_0:AddListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_17_0.OnPlayTimeline)
	arg_17_0:AddListener(var_0_0.LINK_CORE_EVENT, arg_17_0.OnLinkCoreEvent)
end

function var_0_0.GetSubView(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.subViews) do
		if isa(iter_18_1, arg_18_1) then
			return iter_18_1
		end
	end

	return nil
end

function var_0_0.GetPoolMgr(arg_19_0)
	return arg_19_0.poolMgr
end

function var_0_0.OnLinkCoreEvent(arg_20_0, arg_20_1, ...)
	arg_20_0:GetIsland():DispatchEvent(arg_20_1, ...)
end

function var_0_0.OnSetUpCore(arg_21_0, arg_21_1, arg_21_2)
	return
end

function var_0_0.OnOpenPage(arg_22_0, arg_22_1, ...)
	arg_22_0:OpenPage(arg_22_1, ...)
end

function var_0_0.OnShowMsgBox(arg_23_0, arg_23_1)
	arg_23_0:ShowMsgbox(arg_23_1)
end

function var_0_0.OnPlayTimeline(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	arg_24_0:PlayTimeline(arg_24_1, arg_24_2, arg_24_3)
end

function var_0_0.OnSceneLoaded(arg_25_0)
	arg_25_0:emit(var_0_0.ON_SCENE_LOADED)

	arg_25_0.canvasGroup.alpha = 1
	arg_25_0.canvasGroup.blocksRaycasts = true
end

function var_0_0.OnEmit(arg_26_0, arg_26_1, ...)
	arg_26_0:emit(arg_26_1, ...)
end

function var_0_0.StartCore(arg_27_0)
	arg_27_0:emit(IslandBaseMediator.SET_UP)
end

function var_0_0.setVisible(arg_28_0, arg_28_1)
	arg_28_0:ShowOrHideResUI(arg_28_1)

	if arg_28_1 then
		arg_28_0:OnVisible()
	else
		arg_28_0:OnDisVisible()
	end

	setActive(arg_28_0._tf, arg_28_1)
end

function var_0_0.TryVisible(arg_29_0)
	arg_29_0.showBalance = arg_29_0.showBalance + 1

	if arg_29_0.showBalance == 1 then
		arg_29_0:setVisible(true)
	end
end

function var_0_0.TryDisVisible(arg_30_0)
	arg_30_0.showBalance = arg_30_0.showBalance - 1

	if arg_30_0.showBalance == 0 then
		arg_30_0:setVisible(false)
	end
end

function var_0_0.OpenPage(arg_31_0, arg_31_1, ...)
	IslandGuideChecker.CheckOnOpenPage(arg_31_1.__cname)

	return arg_31_0.sceneMgr:OpenPage(arg_31_0, arg_31_1, ...)
end

function var_0_0.ClosePage(arg_32_0, arg_32_1)
	arg_32_0.sceneMgr:ClosePage(arg_32_1)
end

function var_0_0.ShowToast(arg_33_0, arg_33_1)
	arg_33_0:GetSubView(IslandToast):ExecuteAction("Show", arg_33_1)
end

function var_0_0.DisplayAward(arg_34_0, arg_34_1)
	arg_34_0:GetSubView(IslandAwardDisplayPage):ExecuteAction("Show", arg_34_1)
end

function var_0_0.PlayTimeline(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	arg_35_0:GetSubView(IslandTimelineMgr):ExecuteAction("Show", arg_35_1, arg_35_2, arg_35_3)
end

function var_0_0.PlayGetShipTimeline(arg_36_0, arg_36_1, arg_36_2)
	arg_36_0:PlayTimeline(2, {
		arg_36_1
	}, arg_36_2)
end

function var_0_0.PlayStory(arg_37_0, arg_37_1)
	arg_37_0.poppingQueue:Enqueue(IslandPoppingQueue.STORY, arg_37_1)
end

function var_0_0.ShowMsgbox(arg_38_0, arg_38_1)
	arg_38_0.poppingQueue:Enqueue(IslandPoppingQueue.MSGBOX, arg_38_1)
end

function var_0_0.PlayPerformance(arg_39_0, arg_39_1)
	arg_39_0.poppingQueue:Enqueue(IslandPoppingQueue.PERFORMANCE, arg_39_1)
end

function var_0_0.HandleAwardDisplay(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	local var_40_0 = {
		dropData = arg_40_1,
		callback = arg_40_2,
		displayType = arg_40_3
	}

	arg_40_0.poppingQueue:Enqueue(IslandPoppingQueue.DISPLAY_AWARD, var_40_0)
end

function var_0_0.ShowTaskAcceptPage(arg_41_0, arg_41_1)
	arg_41_0.poppingQueue:Enqueue(IslandPoppingQueue.TASK_ACCEPT_PAGE, arg_41_1)
end

function var_0_0.ShowQueueUpMsgBox(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0:GetSubView(IslandQueueUpMsgBox):ExecuteAction("Show", arg_42_1, arg_42_2)
end

function var_0_0.AddListener(arg_43_0, arg_43_1, arg_43_2)
	local function var_43_0(arg_44_0, ...)
		arg_43_2(arg_43_0, ...)
	end

	local var_43_1 = arg_43_0:bind(arg_43_1, var_43_0)

	arg_43_0.__callbacks__[arg_43_1] = var_43_1

	arg_43_0:GetIsland():AddListener(arg_43_1, var_43_0)
end

function var_0_0.RemoveListener(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_0.__callbacks__[arg_45_1]

	if var_45_0 then
		local var_45_1 = arg_45_0.eventStore[var_45_0]

		arg_45_0:GetIsland():RemoveListener(arg_45_1, var_45_1.callback)
		arg_45_0:disconnect(var_45_0)

		arg_45_0.__callbacks__[arg_45_1] = nil
	end
end

function var_0_0.onBackPressed(arg_46_0)
	local var_46_0 = arg_46_0:GetSubView(IslandTimelineMgr)

	if var_46_0:GetLoaded() and var_46_0:isShowing() then
		return
	end

	if arg_46_0:GetSubView(IslandStoryMgr):onBackPressed() then
		return
	end

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.subViews) do
		if iter_46_1:GetLoaded() and iter_46_1:isShowing() then
			iter_46_1:Hide()

			return
		end
	end

	if arg_46_0.sceneMgr:OnBackPressed() then
		return
	end

	var_0_0.super.onBackPressed(arg_46_0)
end

function var_0_0.exit(arg_47_0)
	arg_47_0:RemoveListeners()
	arg_47_0:RemoveListener(ISLAND_EX_EVT.EMIT, arg_47_0.OnEmit)
	arg_47_0:RemoveListener(ISLAND_EX_EVT.INIT_FINISH, arg_47_0.OnSceneLoaded)
	arg_47_0:RemoveListener(ISLAND_EX_EVT.SHOW_MSG, arg_47_0.OnShowMsgBox)
	arg_47_0:RemoveListener(ISLAND_EX_EVT.OPEN_PAGE, arg_47_0.OnOpenPage)
	arg_47_0:RemoveListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_47_0.OnPlayTimeline)
	arg_47_0:RemoveListener(var_0_0.LINK_CORE_EVENT, arg_47_0.OnLinkCoreEvent)

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.cacheAbList) do
		AssetBundleHelper.UnstoreAssetBundle(iter_47_1, true)
	end

	arg_47_0.cacheAbList = nil

	for iter_47_2, iter_47_3 in ipairs(arg_47_0.subViews) do
		if iter_47_3:GetLoaded() then
			iter_47_3:Destroy()
		end
	end

	arg_47_0.subViews = nil

	for iter_47_4, iter_47_5 in ipairs(arg_47_0.monitors) do
		iter_47_5:Dispose()
	end

	arg_47_0.monitors = nil

	arg_47_0:GetIsland():ClearListeners()

	if not IsNil(arg_47_0._container) then
		Object.Destroy(arg_47_0._container.gameObject)
	end

	arg_47_0._container = nil
	arg_47_0.uiContainer = nil
	arg_47_0.opContainer = nil
	arg_47_0.pageContainer = nil

	arg_47_0.poolMgr:Dispose()

	arg_47_0.poolMgr = nil

	arg_47_0.poppingQueue:Dispose()

	arg_47_0.poppingQueue = nil

	arg_47_0:disposeEvent()
	arg_47_0.sceneMgr:Dispose()

	arg_47_0.sceneMgr = nil

	getProxy(IslandProxy):ClearAllPlayerDataCache()
	getProxy(IslandProxy):ClearAllGiftTagInfo()
	var_0_0.super.exit(arg_47_0)
	gcAll(false)
end

function var_0_0.AddListeners(arg_48_0)
	return
end

function var_0_0.RemoveListeners(arg_49_0)
	return
end

function var_0_0.OnUnloadScene(arg_50_0)
	return
end

return var_0_0
