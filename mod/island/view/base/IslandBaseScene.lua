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

function var_0_0.getDefaultUI(arg_2_0)
	return arg_2_0._container
end

function var_0_0.forceGC(arg_3_0)
	return true
end

function var_0_0.PlayBGM(arg_4_0)
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.preload(arg_5_0, arg_5_1)
	local var_5_0 = {}

	table.insert(var_5_0, function(arg_6_0)
		arg_5_0:LoadUIContainer(arg_6_0)
	end)
	table.insert(var_5_0, function(arg_7_0)
		arg_5_0.poolMgr = IslandPoolMgr.New(arg_5_0.poolContainer)

		arg_5_0.poolMgr:Init(arg_7_0)
	end)

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.cacheAbList) do
		table.insert(var_5_0, function(arg_8_0)
			AssetBundleHelper.StoreAssetBundle(iter_5_1, true, false, function(arg_9_0)
				arg_8_0()
			end)
		end)
	end

	seriesAsync(var_5_0, arg_5_1)
end

function var_0_0.LoadUIContainer(arg_10_0, arg_10_1)
	ResourceMgr.Inst:getAssetAsync("UI/UIIsland", "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_11_0)
		IslandHelper.InstantiateAsyncGameObject(arg_11_0, function(arg_12_0)
			arg_10_0._container = arg_12_0.transform
			arg_10_0.canvasGroup = GetOrAddComponent(arg_10_0._container, typeof(CanvasGroup))
			arg_10_0.uiLayer1 = arg_10_0._container:Find("layer1")
			arg_10_0.uiLayer2 = arg_10_0._container:Find("layer2")
			arg_10_0.uiContainer = arg_10_0._container:Find("layer1/ui")
			arg_10_0.opContainer = arg_10_0._container:Find("layer1/op")
			arg_10_0.pageContainer = arg_10_0._container:Find("layer1/page")
			arg_10_0.poolContainer = arg_10_0._container:Find("_pool_")
			arg_10_0._container.name = "UIIsland"

			setParent(arg_10_0._container, pg.UIMgr.GetInstance().UICanvas)
			arg_10_1()
		end)
	end), true, true)
end

function var_0_0.SetUIParent(arg_13_0, arg_13_1)
	arg_13_1.transform:SetParent(arg_13_0.uiContainer, false)
end

function var_0_0.emit(arg_14_0, arg_14_1, ...)
	if arg_14_1 == BaseUI.ON_HOME or arg_14_1 == IslandMediator.CHANGE_SCENE then
		if ISLAND_PLAYER_TESTING then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_home_btn_cant_use"))

			return
		end

		arg_14_0:ExitProcess(arg_14_1, nil, ...)
	else
		var_0_0.super.emit(arg_14_0, arg_14_1, ...)
	end
end

function var_0_0.emitCoreEvt(arg_15_0, arg_15_1, ...)
	arg_15_0:emit(var_0_0.LINK_CORE_EVENT, arg_15_1, ...)
end

function var_0_0.emitCore(arg_16_0, arg_16_1, ...)
	arg_16_0:emit(var_0_0.LINK_CORE_EVENT, IslandProxy.LINK_CORE, arg_16_1, ...)
end

function var_0_0.ExitProcess(arg_17_0, arg_17_1, arg_17_2, ...)
	local var_17_0 = packEx(...)
	local var_17_1 = arg_17_0:GetIsland()

	seriesAsync({
		function(arg_18_0)
			arg_17_0:emit(IslandBaseMediator.RECORD_PLAYER_POS)
			pg.m02:sendNotification(GAME.ISLAND_EXIT, {
				id = var_17_1.id,
				callback = arg_18_0
			})
		end
	}, function()
		var_0_0.super.emit(arg_17_0, arg_17_1, unpackEx(var_17_0))

		if arg_17_2 then
			arg_17_2()
		end
	end)
end

function var_0_0.GetIsland(arg_20_0)
	assert(false, "overwrite me !!!!")
end

function var_0_0.onUILoaded(arg_21_0, arg_21_1)
	var_0_0.super.onUILoaded(arg_21_0, arg_21_1)

	arg_21_0.subViews = {
		IslandMsgBox.New(pg.UIMgr.GetInstance().OverlayMain, arg_21_0.event),
		IslandToast.New(pg.UIMgr.GetInstance().OverlayToast, arg_21_0.event),
		IslandStoryMgr.New(pg.UIMgr.GetInstance().OverlayToast, arg_21_0.event),
		IslandAwardDisplayPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_21_0.event),
		IslandQueueUpMsgBox.New(pg.UIMgr.GetInstance().OverlayToast, arg_21_0.event),
		IslandTimelineMgr.New(arg_21_0:GetPoolMgr(), pg.UIMgr.GetInstance().OverlayToast, arg_21_0.event),
		Island3dTaskAcceptPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_21_0.event)
	}
	arg_21_0.monitors = {
		IslandPlayerDataMonitor.New(arg_21_0:GetIsland()),
		IslandSyncDataMonitor.New(arg_21_0:GetIsland())
	}
	arg_21_0.poppingQueue = IslandPoppingQueue.New(arg_21_0)

	arg_21_0:AddCommonListeners()
	arg_21_0:AddListeners()
end

function var_0_0.AddCommonListeners(arg_22_0)
	arg_22_0:AddListener(ISLAND_EX_EVT.EMIT, arg_22_0.OnEmit)
	arg_22_0:AddListener(ISLAND_EX_EVT.INIT_FINISH, arg_22_0.OnSceneLoaded)
	arg_22_0:AddListener(ISLAND_EX_EVT.SHOW_MSG, arg_22_0.OnShowMsgBox)
	arg_22_0:AddListener(ISLAND_EX_EVT.OPEN_PAGE, arg_22_0.OnOpenPage)
	arg_22_0:AddListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_22_0.OnPlayTimeline)
	arg_22_0:AddListener(var_0_0.LINK_CORE_EVENT, arg_22_0.OnLinkCoreEvent)
	arg_22_0:AddListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_22_0.OnOpenAnimatonOpPage)
	arg_22_0:AddListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_22_0.OnCloseAnimatonOpPage)
end

function var_0_0.GetSubView(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.subViews) do
		if isa(iter_23_1, arg_23_1) then
			return iter_23_1
		end
	end

	return nil
end

function var_0_0.GetPoolMgr(arg_24_0)
	return arg_24_0.poolMgr
end

function var_0_0.OnOpenAnimatonOpPage(arg_25_0)
	return
end

function var_0_0.OnCloseAnimatonOpPage(arg_26_0)
	return
end

function var_0_0.OnLinkCoreEvent(arg_27_0, arg_27_1, ...)
	arg_27_0:GetIsland():DispatchEvent(arg_27_1, ...)
end

function var_0_0.OnSetUpCore(arg_28_0, arg_28_1, arg_28_2)
	return
end

function var_0_0.OnOpenPage(arg_29_0, arg_29_1, ...)
	arg_29_0:OpenPage(arg_29_1, ...)
end

function var_0_0.OnShowMsgBox(arg_30_0, arg_30_1)
	arg_30_0:ShowMsgbox(arg_30_1)
end

function var_0_0.OnPlayTimeline(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	arg_31_0:PlayTimeline(arg_31_1, arg_31_2, arg_31_3)
end

function var_0_0.OnSceneLoaded(arg_32_0)
	arg_32_0:emit(var_0_0.ON_SCENE_LOADED)
end

function var_0_0.OnEmit(arg_33_0, arg_33_1, ...)
	arg_33_0:emit(arg_33_1, ...)
end

function var_0_0.StartCore(arg_34_0)
	arg_34_0:emit(IslandBaseMediator.SET_UP)
end

function var_0_0.setVisible(arg_35_0, arg_35_1)
	local var_35_0 = GetOrAddComponent(arg_35_0._tf, typeof(CanvasGroup))

	var_35_0.alpha = arg_35_1 and 1 or 0
	var_35_0.blocksRaycasts = arg_35_1

	if arg_35_1 then
		arg_35_0:OnVisible()
	else
		arg_35_0:OnDisVisible()
	end
end

function var_0_0.TryVisible(arg_36_0)
	arg_36_0.showBalance = arg_36_0.showBalance + 1

	if arg_36_0.showBalance == 1 then
		arg_36_0:setVisible(true)
	end
end

function var_0_0.TryDisVisible(arg_37_0)
	arg_37_0.showBalance = arg_37_0.showBalance - 1

	if arg_37_0.showBalance == 0 then
		arg_37_0:setVisible(false)
	end
end

function var_0_0.OpenPage(arg_38_0, arg_38_1, ...)
	IslandGuideChecker.CheckOnOpenPage(arg_38_1.__cname)

	return arg_38_0.sceneMgr:OpenPage(arg_38_0, arg_38_1, ...)
end

function var_0_0.ClosePage(arg_39_0, arg_39_1)
	arg_39_0.sceneMgr:ClosePage(arg_39_1)
end

function var_0_0.ShowToast(arg_40_0, arg_40_1)
	arg_40_0:GetSubView(IslandToast):ExecuteAction("Show", arg_40_1)
end

function var_0_0.DisplayAward(arg_41_0, arg_41_1)
	arg_41_0:GetSubView(IslandAwardDisplayPage):ExecuteAction("Show", arg_41_1)
end

function var_0_0.PlayTimeline(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	arg_42_0:GetSubView(IslandTimelineMgr):ExecuteAction("Show", arg_42_1, arg_42_2, arg_42_3)
end

function var_0_0.PlayGetShipTimeline(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0:PlayTimeline(2, {
		arg_43_1
	}, arg_43_2)
end

function var_0_0.PlayStory(arg_44_0, arg_44_1)
	arg_44_0.poppingQueue:Enqueue(IslandPoppingQueue.STORY, arg_44_1)
end

function var_0_0.ShowMsgbox(arg_45_0, arg_45_1)
	arg_45_0.poppingQueue:Enqueue(IslandPoppingQueue.MSGBOX, arg_45_1)
end

function var_0_0.PlayPerformance(arg_46_0, arg_46_1)
	arg_46_0.poppingQueue:Enqueue(IslandPoppingQueue.PERFORMANCE, arg_46_1)
end

function var_0_0.HandleAwardDisplay(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = {
		dropData = arg_47_1,
		callback = arg_47_2,
		displayType = arg_47_3
	}

	arg_47_0.poppingQueue:Enqueue(IslandPoppingQueue.DISPLAY_AWARD, var_47_0)
end

function var_0_0.ShowTaskAcceptPage(arg_48_0, arg_48_1)
	arg_48_0.poppingQueue:Enqueue(IslandPoppingQueue.TASK_ACCEPT_PAGE, arg_48_1)
end

function var_0_0.ShowQueueUpMsgBox(arg_49_0, arg_49_1, arg_49_2)
	arg_49_0:GetSubView(IslandQueueUpMsgBox):ExecuteAction("Show", arg_49_1, arg_49_2)
end

function var_0_0.AddListener(arg_50_0, arg_50_1, arg_50_2)
	local function var_50_0(arg_51_0, ...)
		arg_50_2(arg_50_0, ...)
	end

	local var_50_1 = arg_50_0:bind(arg_50_1, var_50_0)

	arg_50_0.__callbacks__[arg_50_1] = var_50_1

	arg_50_0:GetIsland():AddListener(arg_50_1, var_50_0)
end

function var_0_0.RemoveListener(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_0.__callbacks__[arg_52_1]

	if var_52_0 then
		local var_52_1 = arg_52_0.eventStore[var_52_0]

		arg_52_0:GetIsland():RemoveListener(arg_52_1, var_52_1.callback)
		arg_52_0:disconnect(var_52_0)

		arg_52_0.__callbacks__[arg_52_1] = nil
	end
end

function var_0_0.onBackPressed(arg_53_0)
	local var_53_0 = arg_53_0:GetSubView(IslandTimelineMgr)

	if var_53_0:GetLoaded() and var_53_0:isShowing() then
		return
	end

	if arg_53_0:GetSubView(IslandStoryMgr):onBackPressed() then
		return
	end

	for iter_53_0, iter_53_1 in ipairs(arg_53_0.subViews) do
		if iter_53_1:GetLoaded() and iter_53_1:isShowing() then
			if isa(iter_53_1, IslandMsgBox) then
				iter_53_1:HideWindow()
			else
				iter_53_1:Hide()
			end

			return
		end
	end

	if arg_53_0.sceneMgr:OnBackPressed() then
		return
	end

	var_0_0.super.onBackPressed(arg_53_0)
end

function var_0_0.RemoveCommonListeners(arg_54_0)
	arg_54_0:RemoveListener(ISLAND_EX_EVT.EMIT, arg_54_0.OnEmit)
	arg_54_0:RemoveListener(ISLAND_EX_EVT.INIT_FINISH, arg_54_0.OnSceneLoaded)
	arg_54_0:RemoveListener(ISLAND_EX_EVT.SHOW_MSG, arg_54_0.OnShowMsgBox)
	arg_54_0:RemoveListener(ISLAND_EX_EVT.OPEN_PAGE, arg_54_0.OnOpenPage)
	arg_54_0:RemoveListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_54_0.OnPlayTimeline)
	arg_54_0:RemoveListener(var_0_0.LINK_CORE_EVENT, arg_54_0.OnLinkCoreEvent)
	arg_54_0:RemoveListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_54_0.OnOpenAnimatonOpPage)
	arg_54_0:RemoveListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_54_0.OnCloseAnimatonOpPage)
end

function var_0_0.exit(arg_55_0)
	arg_55_0:RemoveListeners()
	arg_55_0:RemoveCommonListeners()

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.cacheAbList) do
		AssetBundleHelper.UnstoreAssetBundle(iter_55_1, true)
	end

	for iter_55_2, iter_55_3 in ipairs(arg_55_0.subViews) do
		if iter_55_3:GetLoaded() then
			iter_55_3:Destroy()
		end
	end

	for iter_55_4, iter_55_5 in ipairs(arg_55_0.monitors) do
		iter_55_5:Dispose()
	end

	arg_55_0:GetIsland():ClearListeners()
	arg_55_0.poolMgr:Dispose()
	arg_55_0.poppingQueue:Dispose()
	arg_55_0:disposeEvent()
	arg_55_0.sceneMgr:Dispose()
	getProxy(IslandProxy):ClearAllPlayerDataCache()
	getProxy(IslandProxy):ClearAllGiftTagInfo()

	arg_55_0.subViews = nil
	arg_55_0.cacheAbList = nil
	arg_55_0.poppingQueue = nil
	arg_55_0.sceneMgr = nil
	arg_55_0.poolMgr = nil
	arg_55_0.monitors = nil
	arg_55_0.uiContainer = nil
	arg_55_0.opContainer = nil
	arg_55_0.pageContainer = nil
	IslandSceneLoader.lastMapId = nil
	arg_55_0.contextData = {}

	GraphicsInterface.Instance:ReleaseAsyncLoadedResources()
	var_0_0.super.exit(arg_55_0)
end

function var_0_0.detach(arg_56_0, arg_56_1)
	var_0_0.super.detach(arg_56_0, arg_56_1)

	if not IsNil(arg_56_0._container) then
		Object.Destroy(arg_56_0._container.gameObject)

		arg_56_0._container = nil
	end
end

function var_0_0.AddListeners(arg_57_0)
	return
end

function var_0_0.RemoveListeners(arg_58_0)
	return
end

function var_0_0.OnUnloadScene(arg_59_0)
	return
end

return var_0_0
