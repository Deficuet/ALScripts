local var_0_0 = class("IslandBasePage", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.islandScene = arg_1_1

	local var_1_0 = arg_1_1.event
	local var_1_1 = arg_1_1.contextData

	var_0_0.super.Ctor(arg_1_0, arg_1_2, var_1_0, var_1_1)

	arg_1_0.__callbacks__ = {}
end

function var_0_0.emit(arg_2_0, ...)
	arg_2_0.islandScene:emit(...)
end

function var_0_0.emitCore(arg_3_0, arg_3_1, ...)
	arg_3_0.islandScene:emitCore(arg_3_1, ...)
end

function var_0_0.NeedCache(arg_4_0)
	return true
end

function var_0_0.GetIsland(arg_5_0)
	return arg_5_0.islandScene:GetIsland()
end

function var_0_0.GetPoolMgr(arg_6_0)
	return arg_6_0.islandScene.poolMgr
end

function var_0_0.Show(arg_7_0, ...)
	arg_7_0:AddListeners()
	var_0_0.super.Show(arg_7_0)
	arg_7_0:OnShow(...)
end

function var_0_0.Hide(arg_8_0)
	arg_8_0:ClosePage(arg_8_0)
	arg_8_0:RemoveListeners()
	arg_8_0:OnHide()
end

function var_0_0.Enable(arg_9_0)
	var_0_0.super.Show(arg_9_0)

	arg_9_0.isVisible = true

	arg_9_0:OnEnable()
end

function var_0_0.Disable(arg_10_0)
	var_0_0.super.Hide(arg_10_0)

	arg_10_0.isVisible = false

	arg_10_0:OnDisable()
end

function var_0_0.BlurPanel(arg_11_0, arg_11_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_11_0._tf, {
		weight = arg_11_1 or LayerWeightConst.TOP_LAYER
	})
end

function var_0_0.UnBlurPanel(arg_12_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_12_0._tf, arg_12_0._parentTf)
end

function var_0_0.ShowMsgBox(arg_13_0, arg_13_1)
	return arg_13_0.islandScene:ShowMsgbox(arg_13_1)
end

function var_0_0.PlayStory(arg_14_0, arg_14_1)
	return arg_14_0.islandScene:PlayStory(arg_14_1)
end

function var_0_0.PlayGetShipTimeline(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.islandScene:PlayGetShipTimeline(arg_15_1, arg_15_2)
end

function var_0_0.OpenPage(arg_16_0, arg_16_1, ...)
	return arg_16_0.islandScene.sceneMgr:OpenPage(arg_16_0, arg_16_1, ...)
end

function var_0_0.OpenScenePage(arg_17_0, arg_17_1, ...)
	return arg_17_0.islandScene:OpenPage(arg_17_1, ...)
end

function var_0_0.ClosePage(arg_18_0, arg_18_1)
	arg_18_0.islandScene.sceneMgr:ClosePage(arg_18_1)
end

function var_0_0.AddListener(arg_19_0, arg_19_1, arg_19_2)
	local function var_19_0(arg_20_0, ...)
		arg_19_2(arg_19_0, ...)
	end

	local var_19_1 = arg_19_0:bind(arg_19_1, var_19_0)

	arg_19_0.__callbacks__[arg_19_1] = var_19_1

	arg_19_0:GetIsland():AddListener(arg_19_1, var_19_0)
end

function var_0_0.RemoveListener(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.__callbacks__[arg_21_1]

	if var_21_0 then
		local var_21_1 = arg_21_0.eventStore[var_21_0]

		arg_21_0:GetIsland():RemoveListener(arg_21_1, var_21_1.callback)
		arg_21_0:disconnect(var_21_0)

		arg_21_0.__callbacks__[arg_21_1] = nil
	end
end

function var_0_0.Destroy(arg_22_0)
	if arg_22_0:GetLoaded() then
		arg_22_0:Hide()
	end

	arg_22_0.__callbacks__ = {}

	var_0_0.super.Destroy(arg_22_0)
	arg_22_0:Reset()
end

function var_0_0.SetVisible(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = GetOrAddComponent(arg_23_1, typeof(CanvasGroup))

	var_23_0.alpha = arg_23_2 and 1 or 0
	var_23_0.blocksRaycasts = arg_23_2
end

function var_0_0.AddListeners(arg_24_0)
	return
end

function var_0_0.RemoveListeners(arg_25_0)
	return
end

function var_0_0.Preload(arg_26_0, arg_26_1)
	arg_26_1()
end

function var_0_0.OnShow(arg_27_0)
	return
end

function var_0_0.OnHide(arg_28_0)
	return
end

function var_0_0.OnEnable(arg_29_0)
	return
end

function var_0_0.OnDisable(arg_30_0)
	return
end

return var_0_0
