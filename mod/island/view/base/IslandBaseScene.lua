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

function var_0_0.GCWhenAwake(arg_4_0)
	return false
end

function var_0_0.PlayBGM(arg_5_0)
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.preload(arg_6_0, arg_6_1)
	local var_6_0 = {}

	table.insert(var_6_0, function(arg_7_0)
		arg_6_0:LoadUIContainer(arg_7_0)
	end)
	table.insert(var_6_0, function(arg_8_0)
		arg_6_0.poolMgr = IslandPoolMgr.New(arg_6_0.poolContainer)

		arg_6_0.poolMgr:Init(arg_8_0)
	end)

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.cacheAbList) do
		table.insert(var_6_0, function(arg_9_0)
			AssetBundleHelper.StoreAssetBundle(iter_6_1, true, false, function(arg_10_0)
				arg_9_0()
			end)
		end)
	end

	seriesAsync(var_6_0, arg_6_1)
end

function var_0_0.LoadUIContainer(arg_11_0, arg_11_1)
	ResourceMgr.Inst:getAssetAsync("UI/UIIsland", "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_12_0)
		IslandHelper.InstantiateAsyncGameObject(arg_12_0, function(arg_13_0)
			arg_11_0._container = arg_13_0.transform
			arg_11_0.canvasGroup = GetOrAddComponent(arg_11_0._container, typeof(CanvasGroup))
			arg_11_0.uiLayer1 = arg_11_0._container:Find("layer1")
			arg_11_0.uiLayer2 = arg_11_0._container:Find("layer2")
			arg_11_0.uiContainer = arg_11_0._container:Find("layer1/ui")
			arg_11_0.opContainer = arg_11_0._container:Find("layer1/op")
			arg_11_0.pageContainer = arg_11_0._container:Find("layer1/page")
			arg_11_0.poolContainer = arg_11_0._container:Find("_pool_")
			arg_11_0._container.name = "UIIsland"

			setParent(arg_11_0._container, pg.UIMgr.GetInstance().UICanvas)
			arg_11_1()
		end)
	end), true, true)
end

function var_0_0.SetUIParent(arg_14_0, arg_14_1)
	arg_14_1.transform:SetParent(arg_14_0.uiContainer, false)
end

function var_0_0.emit(arg_15_0, arg_15_1, ...)
	if arg_15_1 == BaseUI.ON_HOME or arg_15_1 == IslandMediator.CHANGE_SCENE then
		if ISLAND_PLAYER_TESTING then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_home_btn_cant_use"))

			return
		end

		arg_15_0:ExitProcess(arg_15_1, nil, ...)
	else
		var_0_0.super.emit(arg_15_0, arg_15_1, ...)
	end
end

function var_0_0.emitCoreEvt(arg_16_0, arg_16_1, ...)
	arg_16_0:emit(var_0_0.LINK_CORE_EVENT, arg_16_1, ...)
end

function var_0_0.emitCore(arg_17_0, arg_17_1, ...)
	arg_17_0:emit(var_0_0.LINK_CORE_EVENT, IslandProxy.LINK_CORE, arg_17_1, ...)
end

function var_0_0.ExitProcess(arg_18_0, arg_18_1, arg_18_2, ...)
	local var_18_0 = packEx(...)
	local var_18_1 = arg_18_0:GetIsland()

	seriesAsync({
		function(arg_19_0)
			arg_18_0:emit(IslandBaseMediator.RECORD_PLAYER_POS)
			pg.m02:sendNotification(GAME.ISLAND_EXIT, {
				id = var_18_1.id,
				callback = arg_19_0
			})
		end
	}, function()
		var_0_0.super.emit(arg_18_0, arg_18_1, unpackEx(var_18_0))

		if arg_18_2 then
			arg_18_2()
		end
	end)
end

function var_0_0.GetIsland(arg_21_0)
	assert(false, "overwrite me !!!!")
end

function var_0_0.onUILoaded(arg_22_0, arg_22_1)
	var_0_0.super.onUILoaded(arg_22_0, arg_22_1)

	arg_22_0.subViews = {
		IslandMsgBox.New(pg.UIMgr.GetInstance().OverlayMain, arg_22_0.event),
		IslandToast.New(pg.UIMgr.GetInstance().OverlayToast, arg_22_0.event),
		IslandStoryMgr.New(pg.UIMgr.GetInstance().OverlayToast, arg_22_0.event),
		IslandAwardDisplayPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_22_0.event),
		IslandQueueUpMsgBox.New(pg.UIMgr.GetInstance().OverlayToast, arg_22_0.event),
		IslandTimelineMgr.New(arg_22_0:GetPoolMgr(), pg.UIMgr.GetInstance().OverlayToast, arg_22_0.event),
		Island3dTaskAcceptPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_22_0.event),
		IslandSystemUnlockPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_22_0.event)
	}
	arg_22_0.monitors = {
		IslandPlayerDataMonitor.New(arg_22_0:GetIsland()),
		IslandSyncDataMonitor.New(arg_22_0:GetIsland())
	}
	arg_22_0.poppingQueue = IslandPoppingQueue.New(arg_22_0)

	arg_22_0:AddCommonListeners()
	arg_22_0:AddListeners()
end

function var_0_0.AddCommonListeners(arg_23_0)
	arg_23_0:AddListener(ISLAND_EX_EVT.EMIT, arg_23_0.OnEmit)
	arg_23_0:AddListener(ISLAND_EX_EVT.INIT_FINISH, arg_23_0.OnSceneLoaded)
	arg_23_0:AddListener(ISLAND_EX_EVT.SHOW_MSG, arg_23_0.OnShowMsgBox)
	arg_23_0:AddListener(ISLAND_EX_EVT.OPEN_PAGE, arg_23_0.OnOpenPage)
	arg_23_0:AddListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_23_0.OnPlayTimeline)
	arg_23_0:AddListener(var_0_0.LINK_CORE_EVENT, arg_23_0.OnLinkCoreEvent)
	arg_23_0:AddListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_23_0.OnOpenAnimatonOpPage)
	arg_23_0:AddListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_23_0.OnCloseAnimatonOpPage)
end

function var_0_0.GetSubView(arg_24_0, arg_24_1)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.subViews) do
		if isa(iter_24_1, arg_24_1) then
			return iter_24_1
		end
	end

	return nil
end

function var_0_0.GetPoolMgr(arg_25_0)
	return arg_25_0.poolMgr
end

function var_0_0.OnOpenAnimatonOpPage(arg_26_0)
	return
end

function var_0_0.OnCloseAnimatonOpPage(arg_27_0)
	return
end

function var_0_0.OnLinkCoreEvent(arg_28_0, arg_28_1, ...)
	arg_28_0:GetIsland():DispatchEvent(arg_28_1, ...)
end

function var_0_0.OnSetUpCore(arg_29_0, arg_29_1, arg_29_2)
	return
end

function var_0_0.OnOpenPage(arg_30_0, arg_30_1, ...)
	arg_30_0:OpenPage(arg_30_1, ...)
end

function var_0_0.OnShowMsgBox(arg_31_0, arg_31_1)
	arg_31_0:ShowMsgbox(arg_31_1)
end

function var_0_0.OnPlayTimeline(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	arg_32_0:PlayTimeline(arg_32_1, arg_32_2, arg_32_3)
end

function var_0_0.OnSceneLoaded(arg_33_0)
	arg_33_0:emit(var_0_0.ON_SCENE_LOADED)
end

function var_0_0.OnEmit(arg_34_0, arg_34_1, ...)
	arg_34_0:emit(arg_34_1, ...)
end

function var_0_0.StartCore(arg_35_0)
	arg_35_0:emit(IslandBaseMediator.SET_UP)
end

function var_0_0.setVisible(arg_36_0, arg_36_1)
	local var_36_0 = GetOrAddComponent(arg_36_0._tf, typeof(CanvasGroup))

	var_36_0.alpha = arg_36_1 and 1 or 0
	var_36_0.blocksRaycasts = arg_36_1

	if arg_36_1 then
		arg_36_0:OnVisible()
	else
		arg_36_0:OnDisVisible()
	end
end

function var_0_0.TryVisible(arg_37_0)
	arg_37_0.showBalance = arg_37_0.showBalance + 1

	if arg_37_0.showBalance == 1 then
		arg_37_0:setVisible(true)
	end
end

function var_0_0.TryDisVisible(arg_38_0)
	arg_38_0.showBalance = arg_38_0.showBalance - 1

	if arg_38_0.showBalance == 0 then
		arg_38_0:setVisible(false)
	end
end

function var_0_0.OpenPage(arg_39_0, arg_39_1, ...)
	IslandGuideChecker.CheckOnOpenPage(arg_39_1.__cname)

	return arg_39_0.sceneMgr:OpenPage(arg_39_0, arg_39_1, ...)
end

function var_0_0.ClosePage(arg_40_0, arg_40_1)
	arg_40_0.sceneMgr:ClosePage(arg_40_1)
end

function var_0_0.ShowToast(arg_41_0, arg_41_1)
	arg_41_0:GetSubView(IslandToast):ExecuteAction("Show", arg_41_1)
end

function var_0_0.DisplayAward(arg_42_0, arg_42_1)
	arg_42_0:GetSubView(IslandAwardDisplayPage):ExecuteAction("Show", arg_42_1)
end

function var_0_0.PlayTimeline(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	arg_43_0:GetSubView(IslandTimelineMgr):ExecuteAction("Show", arg_43_1, arg_43_2, arg_43_3)
end

function var_0_0.PlayGetShipTimeline(arg_44_0, arg_44_1, arg_44_2)
	arg_44_0:PlayTimeline(2, {
		arg_44_1
	}, arg_44_2)
end

function var_0_0.PlayStory(arg_45_0, arg_45_1)
	arg_45_0.poppingQueue:Enqueue(IslandPoppingQueue.STORY, arg_45_1)
end

function var_0_0.ShowMsgbox(arg_46_0, arg_46_1)
	arg_46_0.poppingQueue:Enqueue(IslandPoppingQueue.MSGBOX, arg_46_1)
end

function var_0_0.PlayPerformance(arg_47_0, arg_47_1)
	arg_47_0.poppingQueue:Enqueue(IslandPoppingQueue.PERFORMANCE, arg_47_1)
end

function var_0_0.DisplaySystemUnlock(arg_48_0, arg_48_1, arg_48_2)
	if not arg_48_1 or #arg_48_1 <= 0 then
		arg_48_2()

		return
	end

	local var_48_0 = _.select(arg_48_1, function(arg_49_0)
		return pg.island_ability_template[arg_49_0.id].show_pop == 1
	end)

	if #var_48_0 <= 0 then
		arg_48_2()

		return
	end

	local var_48_1 = {}

	for iter_48_0, iter_48_1 in ipairs(var_48_0) do
		table.insert(var_48_1, function(arg_50_0)
			arg_48_0:GetSubView(IslandSystemUnlockPage):ExecuteAction("Show", iter_48_1.id, function()
				onNextTick(arg_50_0)
			end)
		end)
	end

	seriesAsync(var_48_1, arg_48_2)
end

function var_0_0.HandleAwardDisplay(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	local var_52_0 = {
		dropData = arg_52_1,
		callback = arg_52_2,
		displayType = arg_52_3
	}

	arg_52_0.poppingQueue:Enqueue(IslandPoppingQueue.DISPLAY_AWARD, var_52_0)
end

function var_0_0.ShowTaskAcceptPage(arg_53_0, arg_53_1)
	arg_53_0.poppingQueue:Enqueue(IslandPoppingQueue.TASK_ACCEPT_PAGE, arg_53_1)
end

function var_0_0.ShowQueueUpMsgBox(arg_54_0, arg_54_1, arg_54_2)
	arg_54_0:GetSubView(IslandQueueUpMsgBox):ExecuteAction("Show", arg_54_1, arg_54_2)
end

function var_0_0.AddListener(arg_55_0, arg_55_1, arg_55_2)
	local function var_55_0(arg_56_0, ...)
		arg_55_2(arg_55_0, ...)
	end

	local var_55_1 = arg_55_0:bind(arg_55_1, var_55_0)

	arg_55_0.__callbacks__[arg_55_1] = var_55_1

	arg_55_0:GetIsland():AddListener(arg_55_1, var_55_0)
end

function var_0_0.RemoveListener(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = arg_57_0.__callbacks__[arg_57_1]

	if var_57_0 then
		local var_57_1 = arg_57_0.eventStore[var_57_0]

		arg_57_0:GetIsland():RemoveListener(arg_57_1, var_57_1.callback)
		arg_57_0:disconnect(var_57_0)

		arg_57_0.__callbacks__[arg_57_1] = nil
	end
end

function var_0_0.onBackPressed(arg_58_0)
	local var_58_0 = arg_58_0:GetSubView(IslandTimelineMgr)

	if var_58_0:GetLoaded() and var_58_0:isShowing() then
		return
	end

	if arg_58_0:GetSubView(IslandStoryMgr):onBackPressed() then
		return
	end

	for iter_58_0, iter_58_1 in ipairs(arg_58_0.subViews) do
		if iter_58_1:GetLoaded() and iter_58_1:isShowing() then
			if isa(iter_58_1, IslandMsgBox) then
				iter_58_1:HideWindow()
			else
				iter_58_1:Hide()
			end

			return
		end
	end

	if arg_58_0.sceneMgr:OnBackPressed() then
		return
	end

	var_0_0.super.onBackPressed(arg_58_0)
end

function var_0_0.RemoveCommonListeners(arg_59_0)
	arg_59_0:RemoveListener(ISLAND_EX_EVT.EMIT, arg_59_0.OnEmit)
	arg_59_0:RemoveListener(ISLAND_EX_EVT.INIT_FINISH, arg_59_0.OnSceneLoaded)
	arg_59_0:RemoveListener(ISLAND_EX_EVT.SHOW_MSG, arg_59_0.OnShowMsgBox)
	arg_59_0:RemoveListener(ISLAND_EX_EVT.OPEN_PAGE, arg_59_0.OnOpenPage)
	arg_59_0:RemoveListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_59_0.OnPlayTimeline)
	arg_59_0:RemoveListener(var_0_0.LINK_CORE_EVENT, arg_59_0.OnLinkCoreEvent)
	arg_59_0:RemoveListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_59_0.OnOpenAnimatonOpPage)
	arg_59_0:RemoveListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_59_0.OnCloseAnimatonOpPage)
end

function var_0_0.exit(arg_60_0)
	arg_60_0:RemoveListeners()
	arg_60_0:RemoveCommonListeners()

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.cacheAbList) do
		AssetBundleHelper.UnstoreAssetBundle(iter_60_1, true)
	end

	for iter_60_2, iter_60_3 in ipairs(arg_60_0.subViews) do
		if iter_60_3:GetLoaded() then
			iter_60_3:Destroy()
		end
	end

	for iter_60_4, iter_60_5 in ipairs(arg_60_0.monitors) do
		iter_60_5:Dispose()
	end

	arg_60_0:GetIsland():ClearListeners()
	arg_60_0.poolMgr:Dispose()
	arg_60_0.poppingQueue:Dispose()
	arg_60_0:disposeEvent()
	arg_60_0.sceneMgr:Dispose()
	getProxy(IslandProxy):ClearAllPlayerDataCache()
	getProxy(IslandProxy):ClearAllGiftTagInfo()

	arg_60_0.subViews = nil
	arg_60_0.cacheAbList = nil
	arg_60_0.poppingQueue = nil
	arg_60_0.sceneMgr = nil
	arg_60_0.poolMgr = nil
	arg_60_0.monitors = nil
	arg_60_0.uiContainer = nil
	arg_60_0.opContainer = nil
	arg_60_0.pageContainer = nil
	IslandSceneLoader.lastMapId = nil
	arg_60_0.contextData = {}

	GraphicsInterface.Instance:ReleaseAsyncLoadedResources()
	var_0_0.super.exit(arg_60_0)
end

function var_0_0.detach(arg_61_0, arg_61_1)
	var_0_0.super.detach(arg_61_0, arg_61_1)

	if not IsNil(arg_61_0._container) then
		Object.Destroy(arg_61_0._container.gameObject)

		arg_61_0._container = nil
	end
end

function var_0_0.AddListeners(arg_62_0)
	return
end

function var_0_0.RemoveListeners(arg_63_0)
	return
end

function var_0_0.OnUnloadScene(arg_64_0)
	return
end

return var_0_0
