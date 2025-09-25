local var_0_0 = class("IslandBasePage", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1.event
	local var_1_1 = arg_1_1.contextData

	var_0_0.super.Ctor(arg_1_0, arg_1_2, var_1_0, var_1_1)
	arg_1_0:RegisterView(arg_1_1)

	arg_1_0.islandScene = arg_1_1
	arg_1_0.__callbacks__ = {}
	arg_1_0.isBlur = false
end

function var_0_0.Loaded(arg_2_0, arg_2_1)
	var_0_0.super.Loaded(arg_2_0, arg_2_1)

	arg_2_0.islandUIController = GetOrAddComponent(arg_2_1, typeof(IslandUIController))
	arg_2_0.cg = arg_2_1:GetComponent(typeof(CanvasGroup))
end

function var_0_0.emit(arg_3_0, ...)
	arg_3_0.islandScene:emit(...)
end

function var_0_0.emitCore(arg_4_0, arg_4_1, ...)
	arg_4_0.islandScene:emitCore(arg_4_1, ...)
end

function var_0_0.NeedCache(arg_5_0)
	return true
end

function var_0_0.GetIsland(arg_6_0)
	return arg_6_0.islandScene:GetIsland()
end

function var_0_0.GetPoolMgr(arg_7_0)
	return arg_7_0.islandScene.poolMgr
end

function var_0_0.Show(arg_8_0, ...)
	arg_8_0:AddListeners()
	arg_8_0.islandUIController:Show(true)
	arg_8_0:OnShow(...)
end

function var_0_0.Hide(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = defaultValue(arg_9_1, true)
	local var_9_1 = {}

	if var_9_0 then
		table.insert(var_9_1, function(arg_10_0)
			arg_9_0.islandUIController:Hide(true, arg_10_0)
		end)
	end

	seriesAsync(var_9_1, function()
		arg_9_0:RemoveListeners()
		arg_9_0:OnHide()
		arg_9_0:ClosePage(arg_9_0)

		if not arg_9_2 then
			arg_9_0:OnExit()
		end
	end)
end

function var_0_0.Enable(arg_12_0)
	arg_12_0.islandUIController:Show(true)

	arg_12_0.isVisible = true

	arg_12_0:OnEnable()
end

function var_0_0.Disable(arg_13_0, arg_13_1)
	arg_13_0.islandUIController:Hide(true, arg_13_1)

	arg_13_0.isVisible = false

	arg_13_0:OnDisable()
end

function var_0_0.BlurPanel(arg_14_0)
	arg_14_0.viewComponent:BlurPanel(arg_14_0._tf)
end

function var_0_0.UnBlurPanel(arg_15_0)
	arg_15_0.viewComponent:UnOverlayPanel(arg_15_0._tf, arg_15_0._parentTf)
end

function var_0_0.ShowMsgBox(arg_16_0, arg_16_1)
	return arg_16_0.islandScene:ShowMsgbox(arg_16_1)
end

function var_0_0.PlayStory(arg_17_0, arg_17_1)
	return arg_17_0.islandScene:PlayStory(arg_17_1)
end

function var_0_0.PlayGetShipTimeline(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.islandScene:PlayGetShipTimeline(arg_18_1, arg_18_2)
end

function var_0_0.OpenPage(arg_19_0, arg_19_1, ...)
	return arg_19_0.islandScene.sceneMgr:OpenPage(arg_19_0, arg_19_1, ...)
end

function var_0_0.OpenScenePage(arg_20_0, arg_20_1, ...)
	return arg_20_0.islandScene:OpenPage(arg_20_1, ...)
end

function var_0_0.ClosePage(arg_21_0, arg_21_1)
	arg_21_0.islandScene.sceneMgr:ClosePage(arg_21_1)
end

function var_0_0.AddListener(arg_22_0, arg_22_1, arg_22_2)
	local function var_22_0(arg_23_0, ...)
		arg_22_2(arg_22_0, ...)
	end

	local var_22_1 = arg_22_0:bind(arg_22_1, var_22_0)

	arg_22_0.__callbacks__[arg_22_1] = var_22_1

	arg_22_0:GetIsland():AddListener(arg_22_1, var_22_0)
end

function var_0_0.RemoveListener(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.__callbacks__[arg_24_1]

	if var_24_0 then
		local var_24_1 = arg_24_0.eventStore[var_24_0]

		arg_24_0:GetIsland():RemoveListener(arg_24_1, var_24_1.callback)
		arg_24_0:disconnect(var_24_0)

		arg_24_0.__callbacks__[arg_24_1] = nil
	end
end

function var_0_0.Destroy(arg_25_0, arg_25_1)
	if arg_25_0:isShowing() then
		arg_25_0:Hide(false, arg_25_1)
	end

	arg_25_0.__callbacks__ = {}

	var_0_0.super.Destroy(arg_25_0)
	arg_25_0:Reset()
end

function var_0_0.SetVisible(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = GetOrAddComponent(arg_26_1, typeof(CanvasGroup))

	var_26_0.alpha = arg_26_2 and 1 or 0
	var_26_0.blocksRaycasts = arg_26_2
end

function var_0_0.AddListeners(arg_27_0)
	return
end

function var_0_0.RemoveListeners(arg_28_0)
	return
end

function var_0_0.Preload(arg_29_0, arg_29_1)
	arg_29_1()
end

function var_0_0.OnShow(arg_30_0)
	return
end

function var_0_0.OnHide(arg_31_0)
	return
end

function var_0_0.OnExit(arg_32_0)
	return
end

function var_0_0.OnEnable(arg_33_0)
	return
end

function var_0_0.OnDisable(arg_34_0)
	return
end

function var_0_0.GetEnterAnimationName(arg_35_0)
	return ""
end

function var_0_0.GetExitAnimationName(arg_36_0)
	return ""
end

return var_0_0
