local var_0_0 = class("NewMainSceneBaseTheme", import("view.base.BaseSubView"))

function var_0_0.OnLoaded(arg_1_0)
	arg_1_0.mainCG = GetOrAddComponent(arg_1_0._tf, typeof(CanvasGroup))
	arg_1_0.mainCG.alpha = 0
	arg_1_0.panels = {
		arg_1_0:GetTopPanel(),
		arg_1_0:GetRightPanel(),
		arg_1_0:GetLeftPanel(),
		arg_1_0:GetBottomPanel()
	}
	arg_1_0.tagView = arg_1_0:GetTagView()
	arg_1_0.iconView = arg_1_0:GetIconView()
	arg_1_0.chatRoomView = arg_1_0:GetChatRoomView()
	arg_1_0.bannerView = arg_1_0:GetBannerView()
	arg_1_0.actBtnView = arg_1_0:GetActBtnView()
	arg_1_0.buffView = arg_1_0:GetBuffView()
	arg_1_0.wordView = arg_1_0:GetWordView()
	arg_1_0.changeView = arg_1_0:GetChangeSkinView()

	pg.redDotHelper:Init(arg_1_0:GetRedDots())
end

function var_0_0.Show(arg_2_0, arg_2_1)
	arg_2_1()
	var_0_0.super.Show(arg_2_0)
end

function var_0_0.PlayEnterAnimation(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.bannerView:Init()
	arg_3_0.actBtnView:Init()
	arg_3_0:_FoldPanels(true, 0)

	arg_3_0.mainCG.alpha = 1

	arg_3_0:_FoldPanels(false, 0.5)
	onDelayTick(arg_3_2, 0.51)
end

function var_0_0.init(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.panels) do
		iter_4_1:Init()
	end

	arg_4_0.iconView:Init(arg_4_1)
	arg_4_0.chatRoomView:Init()
	arg_4_0.buffView:Init()
	arg_4_0.tagView:Init()
	arg_4_0.changeView:Init(arg_4_1)
	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_OVERLAY_FOREVER, arg_4_0._tf, {
		pbList = arg_4_0:GetPbList(),
		weight = LayerWeightConst.BASE_LAYER + 1
	})
end

function var_0_0._FoldPanels(arg_5_0, arg_5_1, arg_5_2)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.panels) do
		iter_5_1:Fold(arg_5_1, arg_5_2)
	end

	arg_5_0.iconView:Fold(arg_5_1, arg_5_2)
	arg_5_0.chatRoomView:Fold(arg_5_1, arg_5_2)
	arg_5_0.bannerView:Fold(arg_5_1, arg_5_2)
	arg_5_0.actBtnView:Fold(arg_5_1, arg_5_2)
	arg_5_0.buffView:Fold(arg_5_1, arg_5_2)
	arg_5_0.wordView:Fold(arg_5_1, arg_5_2)
	arg_5_0.tagView:Fold(arg_5_1, arg_5_2)
	arg_5_0.changeView:Fold(arg_5_1, arg_5_2)
end

function var_0_0.OnFoldPanels(arg_6_0, arg_6_1)
	if arg_6_1 then
		arg_6_0.mainCG.blocksRaycasts = false
	else
		Timer.New(function()
			if arg_6_0.mainCG then
				arg_6_0.mainCG.blocksRaycasts = true
			end
		end, 0.5, 1):Start()
	end

	arg_6_0:_FoldPanels(arg_6_1, 0.5)
end

function var_0_0.OnSwitchToNextShip(arg_8_0, arg_8_1)
	arg_8_0.iconView:Refresh(arg_8_1)
	arg_8_0.changeView:Refresh(arg_8_1)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.panels) do
		iter_8_1:Refresh()
	end
end

function var_0_0.Refresh(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.panels) do
		iter_9_1:Refresh()
	end

	arg_9_0.iconView:Refresh(arg_9_1)
	arg_9_0.chatRoomView:Refresh()
	arg_9_0.buffView:Refresh()
	arg_9_0.actBtnView:Refresh()
	arg_9_0.bannerView:Refresh()
	arg_9_0.tagView:Refresh()
	arg_9_0.changeView:Refresh(arg_9_1)
	pg.LayerWeightMgr.GetInstance():SetVisibleViaLayer(arg_9_0._tf, true)
end

function var_0_0.Disable(arg_10_0)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.panels) do
		iter_10_1:Disable()
	end

	arg_10_0.iconView:Disable()
	arg_10_0.chatRoomView:Disable()
	arg_10_0.buffView:Disable()
	arg_10_0.actBtnView:Disable()
	arg_10_0.bannerView:Disable()
	arg_10_0.wordView:Disable()
	arg_10_0.changeView:Disable()
	pg.LayerWeightMgr.GetInstance():SetVisibleViaLayer(arg_10_0._tf, false)
end

function var_0_0.SetEffectPanelVisible(arg_11_0, arg_11_1)
	return
end

function var_0_0.OnDestroy(arg_12_0)
	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_12_0._tf, arg_12_0._parentTf)

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.panels or {}) do
		iter_12_1:Dispose()
	end

	arg_12_0.panels = nil

	if arg_12_0.iconView then
		arg_12_0.iconView:Dispose()

		arg_12_0.iconView = nil
	end

	if arg_12_0.chatRoomView then
		arg_12_0.chatRoomView:Dispose()

		arg_12_0.chatRoomView = nil
	end

	if arg_12_0.bannerView then
		arg_12_0.bannerView:Dispose()

		arg_12_0.bannerView = nil
	end

	if arg_12_0.actBtnView then
		arg_12_0.actBtnView:Dispose()

		arg_12_0.actBtnView = nil
	end

	if arg_12_0.buffView then
		arg_12_0.buffView:Dispose()

		arg_12_0.buffView = nil
	end

	if arg_12_0.tagView then
		arg_12_0.tagView:Dispose()

		arg_12_0.tagView = nil
	end

	if arg_12_0.wordView then
		arg_12_0.wordView:Dispose()

		arg_12_0.wordView = nil
	end

	if arg_12_0.changeView then
		arg_12_0.changeView:Dispose()

		arg_12_0.changeView = nil
	end

	pg.redDotHelper:Clear()
end

function var_0_0.GetPbList(arg_13_0)
	return {}
end

function var_0_0.GetCalibrationBG(arg_14_0)
	assert(false)
end

function var_0_0.GetPaintingOffset(arg_15_0, arg_15_1)
	return MainPaintingShift.New({
		0,
		-10,
		0,
		0,
		0,
		0,
		1,
		1,
		1
	})
end

function var_0_0.ApplyDefaultResUI(arg_16_0)
	return true
end

function var_0_0.GetWordView(arg_17_0)
	assert(false)
end

function var_0_0.GetTagView(arg_18_0)
	assert(false)
end

function var_0_0.GetTopPanel(arg_19_0)
	assert(false)
end

function var_0_0.GetRightPanel(arg_20_0)
	assert(false)
end

function var_0_0.GetLeftPanel(arg_21_0)
	assert(false)
end

function var_0_0.GetBottomPanel(arg_22_0)
	assert(false)
end

function var_0_0.GetIconView(arg_23_0)
	assert(false)
end

function var_0_0.GetChatRoomView(arg_24_0)
	assert(false)
end

function var_0_0.GetBannerView(arg_25_0)
	assert(false)
end

function var_0_0.GetActBtnView(arg_26_0)
	assert(false)
end

function var_0_0.GetBuffView(arg_27_0)
	assert(false)
end

function var_0_0.GetChangeSkinView(arg_28_0)
	assert(false)
end

function var_0_0.GetRedDots(arg_29_0)
	return {}
end

return var_0_0
