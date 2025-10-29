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

function var_0_0.CanEsc(arg_5_0)
	return true
end

function var_0_0.NeedCache(arg_6_0)
	return true
end

function var_0_0.GetIsland(arg_7_0)
	return arg_7_0.islandScene:GetIsland()
end

function var_0_0.GetPoolMgr(arg_8_0)
	return arg_8_0.islandScene.poolMgr
end

function var_0_0.Show(arg_9_0, ...)
	arg_9_0:AddListeners()
	arg_9_0.islandUIController:Show(true)
	arg_9_0:OnShow(...)
end

function var_0_0.Hide(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = defaultValue(arg_10_1, true)
	local var_10_1 = {}

	if var_10_0 then
		table.insert(var_10_1, function(arg_11_0)
			arg_10_0.islandUIController:Hide(true, arg_11_0)
		end)
	end

	seriesAsync(var_10_1, function()
		arg_10_0:RemoveListeners()
		arg_10_0:OnHide()
		arg_10_0:ClosePage(arg_10_0)

		if not arg_10_2 then
			arg_10_0:OnExit()
		end
	end)
end

function var_0_0.Enable(arg_13_0)
	arg_13_0.islandUIController:Show(true)

	arg_13_0.isVisible = true

	arg_13_0:OnEnable()
end

function var_0_0.Disable(arg_14_0, arg_14_1)
	arg_14_0.islandUIController:Hide(true, arg_14_1)

	arg_14_0.isVisible = false

	arg_14_0:OnDisable()
end

function var_0_0.BlurPanel(arg_15_0)
	arg_15_0.isBluring = true

	arg_15_0.viewComponent:BlurPanel(arg_15_0._tf)
end

function var_0_0.UnBlurPanel(arg_16_0)
	if arg_16_0.isBluring then
		arg_16_0.viewComponent:UnOverlayPanel(arg_16_0._tf, arg_16_0._parentTf)

		arg_16_0.isBluring = false
	end
end

function var_0_0.ShowMsgBox(arg_17_0, arg_17_1)
	return arg_17_0.islandScene:ShowMsgbox(arg_17_1)
end

function var_0_0.PlayStory(arg_18_0, arg_18_1)
	return arg_18_0.islandScene:PlayStory(arg_18_1)
end

function var_0_0.PlayGetShipTimeline(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.islandScene:PlayGetShipTimeline(arg_19_1, arg_19_2)
end

function var_0_0.OpenPage(arg_20_0, arg_20_1, ...)
	return arg_20_0.islandScene.sceneMgr:OpenPage(arg_20_0, arg_20_1, ...)
end

function var_0_0.OpenScenePage(arg_21_0, arg_21_1, ...)
	return arg_21_0.islandScene:OpenPage(arg_21_1, ...)
end

function var_0_0.ClosePage(arg_22_0, arg_22_1)
	arg_22_0.islandScene.sceneMgr:ClosePage(arg_22_1)
end

function var_0_0.AddListener(arg_23_0, arg_23_1, arg_23_2)
	local function var_23_0(arg_24_0, ...)
		arg_23_2(arg_23_0, ...)
	end

	local var_23_1 = arg_23_0:bind(arg_23_1, var_23_0)

	arg_23_0.__callbacks__[arg_23_1] = var_23_1

	arg_23_0:GetIsland():AddListener(arg_23_1, var_23_0)
end

function var_0_0.RemoveListener(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.__callbacks__[arg_25_1]

	if var_25_0 then
		local var_25_1 = arg_25_0.eventStore[var_25_0]

		arg_25_0:GetIsland():RemoveListener(arg_25_1, var_25_1.callback)
		arg_25_0:disconnect(var_25_0)

		arg_25_0.__callbacks__[arg_25_1] = nil
	end
end

function var_0_0.Destroy(arg_26_0, arg_26_1)
	if arg_26_0:isShowing() then
		arg_26_0:Hide(false, arg_26_1)
	end

	arg_26_0.__callbacks__ = {}

	var_0_0.super.Destroy(arg_26_0)
	arg_26_0:Reset()
end

function var_0_0.SetVisible(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = GetOrAddComponent(arg_27_1, typeof(CanvasGroup))

	var_27_0.alpha = arg_27_2 and 1 or 0
	var_27_0.blocksRaycasts = arg_27_2
end

function var_0_0.ActiveOrDisactive(arg_28_0, arg_28_1)
	if not IsNil(arg_28_0._tf) then
		setActive(arg_28_0._tf, arg_28_1)
	end
end

function var_0_0.AddListeners(arg_29_0)
	return
end

function var_0_0.RemoveListeners(arg_30_0)
	return
end

function var_0_0.Preload(arg_31_0, arg_31_1)
	arg_31_1()
end

function var_0_0.OnShow(arg_32_0)
	return
end

function var_0_0.OnHide(arg_33_0)
	return
end

function var_0_0.OnExit(arg_34_0)
	return
end

function var_0_0.OnEnable(arg_35_0)
	return
end

function var_0_0.OnDisable(arg_36_0)
	return
end

function var_0_0.GetEnterAnimationName(arg_37_0)
	return ""
end

function var_0_0.GetExitAnimationName(arg_38_0)
	return ""
end

return var_0_0
