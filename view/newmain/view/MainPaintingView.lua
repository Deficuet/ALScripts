local var_0_0 = class("MainPaintingView", import("..base.MainBaseView"))

var_0_0.STATE_PAINTING = 1
var_0_0.STATE_L2D = 2
var_0_0.STATE_SPINE_PAINTING = 3
var_0_0.STATE_EDUCATE_CHAR = 4
var_0_0.STATE_EDUCATE_SPINE = 5
var_0_0.STATE_EDUCATE_L2D = 6
var_0_0.MESH_POSITION_X_OFFSET = 145

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_3)

	arg_1_0._bgTf = arg_1_2
	arg_1_0._bgGo = arg_1_2.gameObject
	arg_1_0.l2dContainer = arg_1_1:Find("live2d")
	arg_1_0.spineContainer = arg_1_1:Find("spinePainting")
	arg_1_0.meshContainer = arg_1_1:Find("fitter")
	arg_1_0.bgOffset = arg_1_0._bgTf.localPosition - arg_1_0._tf.localPosition
	arg_1_0.cg = arg_1_0._tf:GetComponent(typeof(CanvasGroup))
	arg_1_0.paintings = {
		MainMeshImagePainting.New(arg_1_0._tf, arg_1_0.event),
		MainLive2dPainting.New(arg_1_0._tf, arg_1_0.event),
		MainSpinePainting.New(arg_1_0._tf, arg_1_0.event, arg_1_0._bgGo),
		MainEducateCharPainting.New(arg_1_0._tf, arg_1_0.event),
		MainEducateSpinePainting.New(arg_1_0._tf, arg_1_0.event, arg_1_0._bgGo)
	}

	arg_1_0:Register()
end

function var_0_0.Register(arg_2_0)
	arg_2_0:bind(TaskProxy.TASK_ADDED, function(arg_3_0)
		arg_2_0:OnStopVoice()
	end)
	arg_2_0:bind(NewMainScene.CHAT_STATE_CHANGE, function(arg_4_0, arg_4_1)
		arg_2_0:OnChatStateChange(arg_4_1)
	end)
	arg_2_0:bind(NewMainScene.ENABLE_PAITING_MOVE, function(arg_5_0, arg_5_1)
		arg_2_0:EnableOrDisableMove(arg_5_1)
	end)
	arg_2_0:bind(NewMainScene.SAVE_PART_SCALE, function(arg_6_0, arg_6_1)
		arg_2_0.painting:SavePartScaleData()
	end)
	arg_2_0:bind(NewMainScene.ENABLE_PAITING_SCALE, function(arg_7_0, arg_7_1)
		arg_2_0:EnableOrDisableScale(arg_7_1)
	end)
	arg_2_0:bind(NewMainScene.RESET_PAITING_SCALE, function(arg_8_0, arg_8_1)
		arg_2_0.painting:ResetPartScale()
	end)
	arg_2_0:bind(NewMainScene.ON_ENTER_DONE, function(arg_9_0)
		if arg_2_0.painting then
			arg_2_0.painting:TriggerEventAtFirstTime()
		end
	end)
	arg_2_0:bind(NewMainScene.ENTER_SILENT_VIEW, function()
		arg_2_0.cg.blocksRaycasts = false
		arg_2_0.silentFlag = true

		for iter_10_0, iter_10_1 in ipairs(arg_2_0.paintings) do
			iter_10_1:PauseForSilent()
		end
	end)
	arg_2_0:bind(NewMainScene.EXIT_SILENT_VIEW, function()
		arg_2_0.cg.blocksRaycasts = true
		arg_2_0.silentFlag = false

		for iter_11_0, iter_11_1 in ipairs(arg_2_0.paintings) do
			iter_11_1:ResumeForSilent()
		end
	end)
	arg_2_0:bind(NewMainScene.RESET_L2D, function()
		if not arg_2_0.painting then
			return
		end

		if not isa(arg_2_0.painting, MainLive2dPainting) then
			return
		end

		arg_2_0.painting:ResetState()
	end)
	arg_2_0:bind(NewMainScene.STORY_BEGIN, function()
		if arg_2_0.painting then
			arg_2_0.painting:Pause()
		end
	end)
	arg_2_0:bind(NewMainScene.STORY_END, function()
		if arg_2_0.painting then
			arg_2_0.painting:Resume()
		end
	end)
	arg_2_0:bind(NewMainScene.PAINTING_LOAD_COMPLETE, function()
		arg_2_0:MakePaintingFadeIn()
	end)
end

function var_0_0.OnChatStateChange(arg_16_0, arg_16_1)
	if not arg_16_1 then
		arg_16_0.painting:StopChatAnimtion()
	end
end

function var_0_0.OnStopVoice(arg_17_0)
	if arg_17_0.painting then
		arg_17_0.painting:OnStopVoice()
	end
end

function var_0_0.MakePaintingFadeIn(arg_18_0)
	if not arg_18_0.painting then
		return
	end

	if not arg_18_0._paintingManager then
		return
	end

	local var_18_0 = arg_18_0.painting:GetPaintingTransform()

	if var_18_0 == nil then
		return
	end

	local var_18_1 = arg_18_0:getPaintingManagerType()
	local var_18_2 = arg_18_0:getPaintingContainer()

	arg_18_0._paintingManager:SetOpacityPainting(var_18_0, var_18_2, var_18_1)
	arg_18_0.painting:OnPaintingFade(true)
	print("painting fade in ")

	if arg_18_0._firstPaintingLoading then
		arg_18_0._firstPaintingLoading = false

		arg_18_0._paintingManager:RevertPaintingContainer()
		arg_18_0._paintingManager:SetPaintingAlpha(1)
		arg_18_0.painting:OnPaintingFade(false)
	else
		arg_18_0._paintingManager:SetPaintingAlpha(0)
		arg_18_0._paintingManager:SetPaintingFadeIn(function()
			arg_18_0.painting:OnPaintingFade(false)
		end)
	end
end

function var_0_0.getPaintingManagerType(arg_20_0)
	local var_20_0 = arg_20_0.state
	local var_20_1

	if var_20_0 == var_0_0.STATE_L2D or var_20_0 == var_0_0.STATE_EDUCATE_L2D then
		var_20_1 = arg_20_0._paintingManager.PAINTING_TYPE.LIVE2D
	elseif var_20_0 == var_0_0.STATE_SPINE_PAINTING or var_20_0 == var_0_0.STATE_EDUCATE_SPINE then
		var_20_1 = arg_20_0._paintingManager.PAINTING_TYPE.SPINE
	else
		var_20_1 = arg_20_0._paintingManager.PAINTING_TYPE.MESH
	end

	return var_20_1
end

function var_0_0.getPaintingContainer(arg_21_0)
	local var_21_0 = arg_21_0.state
	local var_21_1

	if var_21_0 == var_0_0.STATE_L2D or var_21_0 == var_0_0.STATE_EDUCATE_L2D then
		return arg_21_0.l2dContainer
	elseif var_21_0 == var_0_0.STATE_SPINE_PAINTING or var_21_0 == var_0_0.STATE_EDUCATE_SPINE then
		return arg_21_0.spineContainer
	else
		return arg_21_0.meshContainer
	end
end

function var_0_0.IsLive2DState(arg_22_0)
	return var_0_0.STATE_L2D == arg_22_0.state
end

function var_0_0.IsLoading(arg_23_0)
	if arg_23_0.painting and arg_23_0.painting:IsLoading() then
		return true
	end

	return false
end

function var_0_0.Init(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
	print("初始化舰船 = " .. arg_24_1:getPainting())

	if arg_24_0:ShouldReLoad(arg_24_1) then
		arg_24_0.shift = arg_24_2 or arg_24_0.shift

		assert(arg_24_0.shift)

		arg_24_0.ship = arg_24_1
		arg_24_0.anim = arg_24_3

		local var_24_0, var_24_1 = var_0_0.GetAssistantStatus(arg_24_1)

		arg_24_0.painting = arg_24_0.paintings[var_24_0]
		arg_24_0.state = var_24_0
		arg_24_0.skinId = arg_24_0.ship:getSkinId()
		arg_24_0.bgToggle = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_24_1:getPainting(), 0)

		arg_24_0:Reload(function()
			if arg_24_0._paintingManager and arg_24_0.painting then
				local var_25_0 = arg_24_0.painting:GetPaintingTransform()
				local var_25_1 = arg_24_0:getPaintingManagerType()
				local var_25_2 = arg_24_0:getPaintingContainer()

				if var_25_0 then
					arg_24_0._paintingManager:SetOpacityPainting(var_25_0, var_25_2, var_25_1)
					arg_24_0.painting:OnPaintingFade(true)
				end
			end

			arg_24_0:InitShipShift()

			if arg_24_4 then
				arg_24_4()

				arg_24_4 = nil
			end
		end)
	else
		arg_24_0.painting:Resume()
		arg_24_0:InitShipShift()

		if arg_24_4 then
			arg_24_4()

			arg_24_4 = nil
		end
	end
end

function var_0_0.InitShipShift(arg_26_0)
	local var_26_0 = arg_26_0.shift
	local var_26_1 = arg_26_0.ship

	if arg_26_0.anim then
		arg_26_0:AdjustPositionWithAnim(var_26_1)
	else
		arg_26_0:AdjustPosition(var_26_1)
	end

	arg_26_0.painting:SetShift(arg_26_0.shift)
end

function var_0_0.Reload(arg_27_0, arg_27_1)
	local function var_27_0()
		print("开始加载舰船 = " .. arg_27_0.ship:getPainting())

		arg_27_0._paintingFadeFlag = false

		if arg_27_0._loadingPainting then
			if arg_27_0._paintingManager then
				arg_27_0._paintingManager:DisablePainting()
			end

			arg_27_0._loadingPainting:Unload()
		end

		arg_27_0.painting:Load(arg_27_0.ship, arg_27_1)

		arg_27_0._loadingPainting = arg_27_0.painting
	end

	if arg_27_0._paintingManager and not arg_27_0._paintingFadeFlag then
		arg_27_0.painting:OnPaintingFade(true)
		arg_27_0._paintingManager:SetLoading(true)
		seriesAsync({
			function(arg_29_0)
				onDelayTick(arg_29_0, 0.2)
			end,
			function(arg_30_0)
				if isa(arg_27_0.painting, MainLive2dPainting) then
					pg.Live2DMgr.GetInstance():preloadL2dModelAsync(arg_27_0.ship:getPainting(), arg_30_0)
				else
					arg_30_0()
				end
			end,
			function(arg_31_0)
				if arg_27_0._paintingManager then
					arg_27_0._paintingManager:SetLoading(false)

					arg_27_0._paintingFadeFlag = true

					arg_27_0._paintingManager:SetPaintingFadeOut(arg_31_0)
					arg_27_0.painting:OnPaintingFade(false)
				end
			end
		}, var_27_0)
	else
		var_27_0()
	end
end

function var_0_0.Refresh(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	arg_32_0:Init(arg_32_1, arg_32_2, nil, arg_32_3)
end

function var_0_0.Disable(arg_33_0)
	if arg_33_0._paintingManager then
		arg_33_0._paintingManager:Dispose()

		arg_33_0._paintingManager = nil
		arg_33_0._paintingFadeFlag = false
	end

	if arg_33_0.painting then
		arg_33_0.painting:Pause()
	end
end

function var_0_0.ShouldReLoad(arg_34_0, arg_34_1)
	if not arg_34_0.painting or not arg_34_0._loadingPainting or not arg_34_0.ship or not arg_34_0.state or not arg_34_0.bgToggle then
		return true
	end

	local var_34_0 = var_0_0.GetAssistantStatus(arg_34_1)
	local var_34_1 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_34_0._loadingPainting.paintingName, 0)

	if arg_34_0.skinId == arg_34_0.ship:getSkinId() and arg_34_1.id == arg_34_0.ship.id and arg_34_0.state == var_34_0 and arg_34_0.bgToggle == var_34_1 and arg_34_1:GetRecordPosKey() == arg_34_0.ship:GetRecordPosKey() and not arg_34_0.reloadOnResume then
		print("不加载舰船 = " .. arg_34_1:getPainting())

		return false
	else
		if arg_34_0.reloadOnResume then
			arg_34_0.reloadOnResume = false
		end

		return true
	end
end

function var_0_0.SetOnceLoadedCall(arg_35_0, arg_35_1)
	arg_35_0.painting:SetOnceLoadedCall(arg_35_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_36_0, arg_36_1)
	arg_36_0.painting:PlayChangeSkinActionIn(arg_36_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_37_0, arg_37_1)
	arg_37_0.painting:PlayChangeSkinActionOut(arg_37_1)
end

function var_0_0.AdjustPositionWithAnim(arg_38_0, arg_38_1)
	LeanTween.cancel(go(arg_38_0._tf))
	LeanTween.cancel(go(arg_38_0._bgTf))

	local var_38_0 = arg_38_0:GetPositionAndScale(arg_38_1)

	LeanTween.moveLocal(go(arg_38_0._tf), var_38_0, 0.3):setEase(LeanTweenType.easeInOutExpo)
	LeanTween.moveLocal(go(arg_38_0._bgTf), var_38_0, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_38_1, var_38_2 = arg_38_0.shift:GetSpineShift()

	LeanTween.moveLocal(go(arg_38_0.spineContainer), var_38_1, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_38_3, var_38_4 = arg_38_0.shift:GetL2dShift()

	if arg_38_0.painting:IslimitYPos() then
		var_38_3.y = arg_38_0.painting:GetHalfBodyOffsetY()
	end

	LeanTween.moveLocal(go(arg_38_0.l2dContainer), var_38_3, 0.3):setEase(LeanTweenType.easeInOutExpo):setOnComplete(System.Action(function()
		arg_38_0:AdjustPosition(arg_38_1)
	end))
end

function var_0_0.AdjustPosition(arg_40_0, arg_40_1)
	local var_40_0, var_40_1 = arg_40_0:GetPositionAndScale(arg_40_1)

	arg_40_0._tf.anchoredPosition = var_40_0
	arg_40_0._bgTf.anchoredPosition = var_40_0

	local var_40_2, var_40_3 = arg_40_0.shift:GetL2dShift()

	if arg_40_0.painting:IslimitYPos() then
		var_40_2.y = arg_40_0.painting:GetHalfBodyOffsetY()
	end

	arg_40_0.l2dContainer.anchoredPosition = var_40_2

	local var_40_4, var_40_5 = arg_40_0.shift:GetSpineShift()

	arg_40_0.spineContainer.anchoredPosition = var_40_4

	local var_40_6, var_40_7, var_40_8 = getProxy(SettingsProxy):getSkinPosSetting(arg_40_1)

	if var_40_8 then
		arg_40_0._bgTf.localScale = Vector3(var_40_8, var_40_8, 1)
		arg_40_0._tf.localScale = Vector3(var_40_8, var_40_8, 1)
	elseif arg_40_0.state == var_0_0.STATE_L2D then
		arg_40_0._bgTf.localScale = var_40_3
		arg_40_0._tf.localScale = var_40_3
	elseif arg_40_0.state == var_0_0.STATE_SPINE_PAINTING then
		arg_40_0._bgTf.localScale = var_40_5
		arg_40_0._tf.localScale = var_40_5
	else
		arg_40_0._bgTf.localScale = var_40_1
		arg_40_0._tf.localScale = var_40_1
	end

	if arg_40_0._paintingManager then
		arg_40_0._paintingManager:ResetPaintingContainerOffset(arg_40_0.l2dContainer.anchoredPosition, arg_40_0.spineContainer.anchoredPosition, arg_40_0.meshContainer.anchoredPosition)
	end
end

function var_0_0.GetPositionAndScale(arg_41_0, arg_41_1)
	local var_41_0, var_41_1, var_41_2 = getProxy(SettingsProxy):getSkinPosSetting(arg_41_1)
	local var_41_3 = Vector3(0, 0, 0)
	local var_41_4 = Vector3(1, 1, 1)

	if var_41_0 then
		var_41_3 = Vector3(var_41_0, var_41_1, 0)
		var_41_4 = Vector3(var_41_2, var_41_2, 1)
	else
		local var_41_5, var_41_6 = arg_41_0.shift:GetMeshImageShift()

		var_41_3 = var_41_5
		var_41_4 = var_41_6
	end

	return var_41_3, var_41_4
end

function var_0_0.GetAssistantStatus(arg_42_0)
	local var_42_0 = arg_42_0:getPainting()
	local var_42_1 = getProxy(SettingsProxy)
	local var_42_2 = HXSet.autoHxShiftPath("spinepainting/" .. var_42_0)
	local var_42_3 = checkABExist(var_42_2)
	local var_42_4 = HXSet.autoHxShiftPath("live2d/" .. var_42_0)
	local var_42_5 = var_0_0.Live2dIsDownload(var_42_4) and checkABExist(var_42_4)
	local var_42_6 = var_42_1:getCharacterSetting(arg_42_0.id, SHIP_FLAG_BG)

	if var_42_1:getCharacterSetting(arg_42_0.id, SHIP_FLAG_L2D) and var_42_5 then
		return isa(arg_42_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_L2D or var_0_0.STATE_L2D, var_42_6
	elseif var_42_1:getCharacterSetting(arg_42_0.id, SHIP_FLAG_SP) and var_42_3 then
		return isa(arg_42_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_SPINE or var_0_0.STATE_SPINE_PAINTING, var_42_6
	else
		return isa(arg_42_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_CHAR or var_0_0.STATE_PAINTING, var_42_6
	end
end

function var_0_0.OnBoundChange(arg_43_0)
	if arg_43_0.painting then
		arg_43_0.painting:UpdateBound()
	end
end

function var_0_0.Live2dIsDownload(arg_44_0)
	local var_44_0 = GroupHelper.GetGroupMgrByName("L2D"):CheckF(arg_44_0)

	return var_44_0 == DownloadState.None or var_44_0 == DownloadState.UpdateSuccess
end

function var_0_0.Fold(arg_45_0, arg_45_1, arg_45_2)
	return
end

function var_0_0.EnableOrDisableScale(arg_46_0, arg_46_1)
	arg_46_0.painting:EnableOrDisableMove(arg_46_1)
	arg_46_0.painting:OnEnablePartScale(arg_46_1)
end

function var_0_0.EnableOrDisableMove(arg_47_0, arg_47_1)
	arg_47_0.painting:EnableOrDisableMove(arg_47_1)

	if arg_47_1 then
		arg_47_0:EnableDragAndZoom()
	else
		arg_47_0:DisableDragAndZoom()
	end
end

function var_0_0.OnAsmrTurnning(arg_48_0, arg_48_1)
	arg_48_0.painting:OnAsmrTurnning(arg_48_1)
end

function var_0_0.EnableDragAndZoom(arg_49_0)
	arg_49_0.isEnableDrag = true

	local var_49_0 = arg_49_0._tf.parent.gameObject
	local var_49_1 = GetOrAddComponent(var_49_0, typeof(PinchZoom))
	local var_49_2 = GetOrAddComponent(var_49_0, typeof(EventTriggerListener))
	local var_49_3 = Vector3(0, 0, 0)

	var_49_2:AddBeginDragFunc(function(arg_50_0, arg_50_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_49_1.processing then
			return
		end

		setButtonEnabled(var_49_0, false)

		if Input.touchCount > 1 then
			return
		end

		local var_50_0 = var_0_0.Screen2Local(var_49_0.transform.parent, arg_50_1.position)

		var_49_3 = arg_49_0._tf.localPosition - var_50_0
	end)
	var_49_2:AddDragFunc(function(arg_51_0, arg_51_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_49_1.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_51_0 = var_0_0.Screen2Local(var_49_0.transform.parent, arg_51_1.position)
		local var_51_1

		if arg_49_0.painting:IslimitYPos() then
			var_51_1 = Vector3(var_51_0.x, arg_49_0._tf.localPosition.y, 0) + Vector3(var_49_3.x, 0, 0)
		else
			var_51_1 = Vector3(var_51_0.x, var_51_0.y, 0) + var_49_3
		end

		arg_49_0._tf.localPosition = var_51_1
		arg_49_0._bgTf.localPosition = arg_49_0.bgOffset + arg_49_0._tf.localPosition
	end)
	var_49_2:AddDragEndFunc(function()
		setButtonEnabled(var_49_0, true)
	end)

	if not arg_49_0.painting:IslimitYPos() then
		var_49_1.enabled = true
	end

	var_49_2.enabled = true
	Input.multiTouchEnabled = true
	arg_49_0.cg.blocksRaycasts = false

	arg_49_0:AdjustPosition(arg_49_0.ship)
end

function var_0_0.DisableDragAndZoom(arg_53_0)
	if arg_53_0.isEnableDrag then
		local var_53_0 = arg_53_0._tf.parent:GetComponent(typeof(EventTriggerListener))

		ClearEventTrigger(var_53_0)

		var_53_0.enabled = false
		arg_53_0._tf.parent:GetComponent(typeof(PinchZoom)).enabled = false
		arg_53_0.cg.blocksRaycasts = true
		arg_53_0.isEnableDrag = false
	end

	arg_53_0:AdjustPosition(arg_53_0.ship)
end

function var_0_0.Dispose(arg_54_0)
	var_0_0.super.Dispose(arg_54_0)

	if arg_54_0._paintingManager then
		arg_54_0._paintingManager:Dispose()

		arg_54_0._paintingManager = nil
	end

	arg_54_0:DisableDragAndZoom()

	if arg_54_0.painting then
		arg_54_0.painting:Unload()
	end

	arg_54_0.painting = nil
	arg_54_0._loadingPainting = nil

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.paintings) do
		iter_54_1:Dispose()
	end

	arg_54_0.paintings = nil
end

function var_0_0.Screen2Local(arg_55_0, arg_55_1)
	local var_55_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_55_1 = arg_55_0:GetComponent("RectTransform")
	local var_55_2 = LuaHelper.ScreenToLocal(var_55_1, arg_55_1, var_55_0)

	return Vector3(var_55_2.x, var_55_2.y, 0)
end

return var_0_0
