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

function var_0_0.DontGC(arg_3_0)
	return true
end

function var_0_0.forceGC(arg_4_0)
	return false
end

function var_0_0.GCWhenAwake(arg_5_0)
	return false
end

function var_0_0.PlayBGM(arg_6_0)
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.preload(arg_7_0, arg_7_1)
	local var_7_0 = {}

	table.insert(var_7_0, function(arg_8_0)
		arg_7_0:LoadUIContainer(arg_8_0)
	end)
	table.insert(var_7_0, function(arg_9_0)
		arg_7_0.poolMgr = IslandPoolMgr.New(arg_7_0.poolContainer)

		arg_7_0.poolMgr:Init(arg_9_0)
	end)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.cacheAbList) do
		table.insert(var_7_0, function(arg_10_0)
			AssetBundleHelper.StoreAssetBundle(iter_7_1, true, false, function(arg_11_0)
				arg_10_0()
			end)
		end)
	end

	seriesAsync(var_7_0, arg_7_1)
end

function var_0_0.getResource(arg_12_0)
	local var_12_0 = var_0_0.super.getResource(arg_12_0)
	local var_12_1 = {
		"UI/UIIsland"
	}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.cacheAbList or {}) do
		if not table.contains(var_12_0, iter_12_1) then
			table.insert(var_12_0, iter_12_1)
		end
	end

	for iter_12_2, iter_12_3 in ipairs(var_12_1) do
		if noEmptyStr(iter_12_3) and not table.contains(var_12_0, iter_12_3) then
			table.insert(var_12_0, iter_12_3)
		end
	end

	return var_12_0
end

function var_0_0.LoadUIContainer(arg_13_0, arg_13_1)
	ResourceMgr.Inst:getAssetAsync("UI/UIIsland", "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_14_0)
		IslandHelper.InstantiateAsyncGameObject(arg_14_0, function(arg_15_0)
			arg_13_0._container = arg_15_0.transform
			arg_13_0.canvasGroup = GetOrAddComponent(arg_13_0._container, typeof(CanvasGroup))
			arg_13_0.uiLayer1 = arg_13_0._container:Find("layer1")
			arg_13_0.uiLayer2 = arg_13_0._container:Find("layer2")
			arg_13_0.uiContainer = arg_13_0._container:Find("layer1/ui")
			arg_13_0.opContainer = arg_13_0._container:Find("layer1/op")
			arg_13_0.pageContainer = arg_13_0._container:Find("layer1/page")
			arg_13_0.poolContainer = arg_13_0._container:Find("_pool_")
			arg_13_0._container.name = "UIIsland"

			setParent(arg_13_0._container, pg.UIMgr.GetInstance().UICanvas)
			arg_13_1()
		end)
	end), true, true)
end

function var_0_0.SetUIParent(arg_16_0, arg_16_1)
	arg_16_1.transform:SetParent(arg_16_0.uiContainer, false)
end

function var_0_0.emit(arg_17_0, arg_17_1, ...)
	if arg_17_1 == BaseUI.ON_HOME or arg_17_1 == IslandMediator.CHANGE_SCENE then
		if ISLAND_PLAYER_TESTING then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_home_btn_cant_use"))

			return
		end

		arg_17_0:ExitProcess(arg_17_1, nil, ...)
	else
		var_0_0.super.emit(arg_17_0, arg_17_1, ...)
	end
end

function var_0_0.emitCoreController(arg_18_0, arg_18_1, ...)
	arg_18_0:emit(var_0_0.LINK_CORE_EVENT, arg_18_1, ...)
end

function var_0_0.emitCore(arg_19_0, arg_19_1, ...)
	arg_19_0:emit(var_0_0.LINK_CORE_EVENT, IslandProxy.LINK_CORE, arg_19_1, ...)
end

function var_0_0.ExitProcess(arg_20_0, arg_20_1, arg_20_2, ...)
	local var_20_0 = packEx(...)
	local var_20_1 = arg_20_0:GetIsland()

	seriesAsync({
		function(arg_21_0)
			arg_20_0:emit(IslandBaseMediator.RECORD_PLAYER_POS)
			pg.m02:sendNotification(GAME.ISLAND_EXIT, {
				id = var_20_1.id,
				callback = arg_21_0
			})
		end
	}, function()
		var_0_0.super.emit(arg_20_0, arg_20_1, unpackEx(var_20_0))

		if arg_20_2 then
			arg_20_2()
		end
	end)
end

function var_0_0.GetIsland(arg_23_0)
	assert(false, "overwrite me !!!!")
end

function var_0_0.onUILoaded(arg_24_0, arg_24_1)
	var_0_0.super.onUILoaded(arg_24_0, arg_24_1)

	arg_24_0.subViews = {
		IslandMsgBox.New(pg.UIMgr.GetInstance().OverlayMain, arg_24_0.event),
		IslandToast.New(pg.UIMgr.GetInstance().OverlayToast, arg_24_0.event),
		IslandStoryMgr.New(pg.UIMgr.GetInstance().OverlayToast, arg_24_0.event),
		IslandAwardDisplayPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_24_0.event),
		IslandQueueUpMsgBox.New(pg.UIMgr.GetInstance().OverlayToast, arg_24_0.event),
		IslandTimelineMgr.New(arg_24_0:GetPoolMgr(), pg.UIMgr.GetInstance().OverlayToast, arg_24_0.event),
		Island3dTaskAcceptPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_24_0.event),
		IslandSystemUnlockPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_24_0.event)
	}
	arg_24_0.monitors = {
		IslandPlayerDataMonitor.New(arg_24_0:GetIsland()),
		IslandSyncDataMonitor.New(arg_24_0:GetIsland()),
		IslandCheaterTavernMonitor.New(arg_24_0:GetIsland())
	}
	arg_24_0.poppingQueue = IslandPoppingQueue.New(arg_24_0)

	arg_24_0:AddCommonListeners()
	arg_24_0:AddListeners()

	for iter_24_0, iter_24_1 in pairs(arg_24_0.subViews) do
		iter_24_1:RegisterView(arg_24_0)
	end
end

function var_0_0.AddCommonListeners(arg_25_0)
	arg_25_0:AddListener(ISLAND_EX_EVT.EMIT, arg_25_0.OnEmit)
	arg_25_0:AddListener(ISLAND_EX_EVT.INIT_FINISH, arg_25_0.OnSceneLoaded)
	arg_25_0:AddListener(ISLAND_EX_EVT.SHOW_MSG, arg_25_0.OnShowMsgBox)
	arg_25_0:AddListener(ISLAND_EX_EVT.OPEN_PAGE, arg_25_0.OnOpenPage)
	arg_25_0:AddListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_25_0.OnPlayTimeline)
	arg_25_0:AddListener(var_0_0.LINK_CORE_EVENT, arg_25_0.OnLinkCoreEvent)
	arg_25_0:AddListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_25_0.OnOpenAnimatonOpPage)
	arg_25_0:AddListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_25_0.OnCloseAnimatonOpPage)
end

function var_0_0.GetSubView(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.subViews) do
		if isa(iter_26_1, arg_26_1) then
			return iter_26_1
		end
	end

	return nil
end

function var_0_0.GetPoolMgr(arg_27_0)
	return arg_27_0.poolMgr
end

function var_0_0.OnOpenAnimatonOpPage(arg_28_0)
	return
end

function var_0_0.OnCloseAnimatonOpPage(arg_29_0)
	return
end

function var_0_0.OnLinkCoreEvent(arg_30_0, arg_30_1, ...)
	arg_30_0:GetIsland():DispatchEvent(arg_30_1, ...)
end

function var_0_0.OnSetUpCore(arg_31_0, arg_31_1, arg_31_2)
	return
end

function var_0_0.OnOpenPage(arg_32_0, arg_32_1, ...)
	arg_32_0:OpenPage(arg_32_1, ...)
end

function var_0_0.OnShowMsgBox(arg_33_0, arg_33_1)
	arg_33_0:ShowMsgbox(arg_33_1)
end

function var_0_0.OnPlayTimeline(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	arg_34_0:PlayTimeline(arg_34_1, arg_34_2, arg_34_3)
end

function var_0_0.OnSceneLoaded(arg_35_0)
	arg_35_0:emit(var_0_0.ON_SCENE_LOADED)
end

function var_0_0.OnEmit(arg_36_0, arg_36_1, ...)
	arg_36_0:emit(arg_36_1, ...)
end

function var_0_0.StartCore(arg_37_0)
	arg_37_0:emit(IslandBaseMediator.SET_UP)
end

function var_0_0.setVisible(arg_38_0, arg_38_1)
	local var_38_0 = GetOrAddComponent(arg_38_0._tf, typeof(CanvasGroup))

	var_38_0.alpha = arg_38_1 and 1 or 0
	var_38_0.blocksRaycasts = arg_38_1

	if arg_38_1 then
		arg_38_0:OnVisible()
	else
		arg_38_0:OnDisVisible()
	end
end

function var_0_0.TryVisible(arg_39_0)
	arg_39_0.showBalance = arg_39_0.showBalance + 1

	if arg_39_0.showBalance == 1 then
		arg_39_0:setVisible(true)
	end
end

function var_0_0.TryDisVisible(arg_40_0)
	arg_40_0.showBalance = arg_40_0.showBalance - 1

	if arg_40_0.showBalance == 0 then
		arg_40_0:setVisible(false)
	end
end

function var_0_0.OpenPage(arg_41_0, arg_41_1, ...)
	IslandGuideChecker.CheckOnOpenPage(arg_41_1.__cname)

	return arg_41_0.sceneMgr:OpenPage(arg_41_0, arg_41_1, ...)
end

function var_0_0.ClosePage(arg_42_0, arg_42_1)
	arg_42_0.sceneMgr:ClosePage(arg_42_1)
end

function var_0_0.GetPage(arg_43_0, arg_43_1)
	return arg_43_0.sceneMgr:GetPage(arg_43_1)
end

function var_0_0.GetSubPage(arg_44_0, arg_44_1)
	return arg_44_0.sceneMgr:GetSubPage(arg_44_1)
end

function var_0_0.ShowToast(arg_45_0, arg_45_1)
	arg_45_0:GetSubView(IslandToast):ExecuteAction("Show", arg_45_1)
end

function var_0_0.DisplayAward(arg_46_0, arg_46_1)
	arg_46_0:GetSubView(IslandAwardDisplayPage):ExecuteAction("Show", arg_46_1)
end

function var_0_0.PlayTimeline(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	arg_47_0:GetSubView(IslandTimelineMgr):ExecuteAction("Show", arg_47_1, arg_47_2, arg_47_3)
end

function var_0_0.PlayGetShipTimeline(arg_48_0, arg_48_1, arg_48_2)
	arg_48_0:PlayTimeline(2, {
		arg_48_1
	}, arg_48_2)
end

function var_0_0.PlayStory(arg_49_0, arg_49_1)
	arg_49_0.poppingQueue:Enqueue(IslandPoppingQueue.STORY, arg_49_1)
end

function var_0_0.ShowMsgbox(arg_50_0, arg_50_1)
	arg_50_0.poppingQueue:Enqueue(IslandPoppingQueue.MSGBOX, arg_50_1)
end

function var_0_0.PlayPerformance(arg_51_0, arg_51_1)
	arg_51_0.poppingQueue:Enqueue(IslandPoppingQueue.PERFORMANCE, arg_51_1)
end

function var_0_0.DisplaySystemUnlock(arg_52_0, arg_52_1, arg_52_2)
	if not arg_52_1 or #arg_52_1 <= 0 then
		arg_52_2()

		return
	end

	local var_52_0 = _.select(arg_52_1, function(arg_53_0)
		return pg.island_ability_template[arg_53_0.id].show_pop == 1
	end)

	if #var_52_0 <= 0 then
		arg_52_2()

		return
	end

	local var_52_1 = {}

	for iter_52_0, iter_52_1 in ipairs(var_52_0) do
		table.insert(var_52_1, function(arg_54_0)
			arg_52_0:GetSubView(IslandSystemUnlockPage):ExecuteAction("Show", iter_52_1.id, function()
				onNextTick(arg_54_0)
			end)
		end)
	end

	seriesAsync(var_52_1, arg_52_2)
end

function var_0_0.HandleAwardDisplay(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	local var_56_0 = {
		dropData = arg_56_1,
		callback = arg_56_2,
		displayType = arg_56_3
	}

	arg_56_0.poppingQueue:Enqueue(IslandPoppingQueue.DISPLAY_AWARD, var_56_0)
end

function var_0_0.ShowTaskAcceptPage(arg_57_0, arg_57_1)
	arg_57_0.poppingQueue:Enqueue(IslandPoppingQueue.TASK_ACCEPT_PAGE, arg_57_1)
end

function var_0_0.ShowQueueUpMsgBox(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0:GetSubView(IslandQueueUpMsgBox):ExecuteAction("Show", arg_58_1, arg_58_2)
end

function var_0_0.AddListener(arg_59_0, arg_59_1, arg_59_2)
	local function var_59_0(arg_60_0, ...)
		arg_59_2(arg_59_0, ...)
	end

	local var_59_1 = arg_59_0:bind(arg_59_1, var_59_0)

	arg_59_0.__callbacks__[arg_59_1] = var_59_1

	arg_59_0:GetIsland():AddListener(arg_59_1, var_59_0)
end

function var_0_0.RemoveListener(arg_61_0, arg_61_1, arg_61_2)
	local var_61_0 = arg_61_0.__callbacks__[arg_61_1]

	if var_61_0 then
		local var_61_1 = arg_61_0.eventStore[var_61_0]

		arg_61_0:GetIsland():RemoveListener(arg_61_1, var_61_1.callback)
		arg_61_0:disconnect(var_61_0)

		arg_61_0.__callbacks__[arg_61_1] = nil
	end
end

function var_0_0.onBackPressed(arg_62_0)
	local var_62_0 = arg_62_0:GetSubView(IslandTimelineMgr)

	if var_62_0:GetLoaded() and var_62_0:isShowing() then
		return
	end

	if arg_62_0:GetSubView(IslandStoryMgr):onBackPressed() then
		return
	end

	for iter_62_0, iter_62_1 in ipairs(arg_62_0.subViews) do
		if iter_62_1:GetLoaded() and iter_62_1:isShowing() then
			if isa(iter_62_1, IslandMsgBox) then
				iter_62_1:HideWindow()
			else
				iter_62_1:Hide()
			end

			return
		end
	end

	if arg_62_0.sceneMgr:OnBackPressed() then
		return
	end

	var_0_0.super.onBackPressed(arg_62_0)
end

function var_0_0.RemoveCommonListeners(arg_63_0)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.EMIT, arg_63_0.OnEmit)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.INIT_FINISH, arg_63_0.OnSceneLoaded)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.SHOW_MSG, arg_63_0.OnShowMsgBox)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.OPEN_PAGE, arg_63_0.OnOpenPage)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.PLAY_TIMELINE, arg_63_0.OnPlayTimeline)
	arg_63_0:RemoveListener(var_0_0.LINK_CORE_EVENT, arg_63_0.OnLinkCoreEvent)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.OPEN_ANIMATION_OP, arg_63_0.OnOpenAnimatonOpPage)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.CLOSE_ANIMATION_OP, arg_63_0.OnCloseAnimatonOpPage)
end

function var_0_0.exit(arg_64_0)
	arg_64_0:RemoveListeners()
	arg_64_0:RemoveCommonListeners()

	for iter_64_0, iter_64_1 in ipairs(arg_64_0.cacheAbList) do
		AssetBundleHelper.UnstoreAssetBundle(iter_64_1, true)
	end

	for iter_64_2, iter_64_3 in ipairs(arg_64_0.subViews) do
		if iter_64_3:GetLoaded() then
			iter_64_3:Destroy()
		end
	end

	for iter_64_4, iter_64_5 in ipairs(arg_64_0.monitors) do
		iter_64_5:Dispose()
	end

	arg_64_0:GetIsland():ClearListeners()
	arg_64_0.poolMgr:Dispose()
	arg_64_0.poppingQueue:Dispose()
	arg_64_0:disposeEvent()
	arg_64_0.sceneMgr:Dispose()
	getProxy(IslandProxy):ClearAllPlayerDataCache()
	getProxy(IslandProxy):ClearAllGiftTagInfo()

	arg_64_0.subViews = nil
	arg_64_0.cacheAbList = nil
	arg_64_0.poppingQueue = nil
	arg_64_0.sceneMgr = nil
	arg_64_0.poolMgr = nil
	arg_64_0.monitors = nil
	arg_64_0.uiContainer = nil
	arg_64_0.opContainer = nil
	arg_64_0.pageContainer = nil
	IslandSceneLoader.lastMapId = nil
	arg_64_0.contextData = {}

	GraphicsInterface.Instance:ReleaseAsyncLoadedResources()
	var_0_0.super.exit(arg_64_0)
end

function var_0_0.detach(arg_65_0, arg_65_1)
	var_0_0.super.detach(arg_65_0, arg_65_1)

	if not IsNil(arg_65_0._container) then
		Object.Destroy(arg_65_0._container.gameObject)

		arg_65_0._container = nil
	end
end

function var_0_0.AddListeners(arg_66_0)
	return
end

function var_0_0.RemoveListeners(arg_67_0)
	return
end

function var_0_0.OnUnloadScene(arg_68_0)
	return
end

return var_0_0
