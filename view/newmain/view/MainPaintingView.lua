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

	local var_18_0 = arg_18_0.state
	local var_18_1
	local var_18_2 = arg_18_0.painting:GetPaintingTransform()

	if var_18_0 == var_0_0.STATE_L2D or var_18_0 == var_0_0.STATE_EDUCATE_L2D then
		var_18_1 = arg_18_0._paintingManager.PAINTING_TYPE.LIVE2D
	elseif var_18_0 == var_0_0.STATE_SPINE_PAINTING or var_18_0 == var_0_0.STATE_EDUCATE_SPINE then
		var_18_1 = arg_18_0._paintingManager.PAINTING_TYPE.SPINE
	else
		var_18_1 = arg_18_0._paintingManager.PAINTING_TYPE.MESH
	end

	if var_18_2 == nil then
		return
	end

	arg_18_0._paintingManager:SetOpacityPainting(var_18_2, var_18_1)

	if arg_18_0._firstPaintingLoading then
		arg_18_0._firstPaintingLoading = false

		arg_18_0._paintingManager:RevertPaintingContainer()
		arg_18_0._paintingManager:SetPaintingAlpha(1)
		arg_18_0.painting:OnPaintingFade(false)
	else
		arg_18_0._paintingManager:SetPaintingFadeIn(function()
			arg_18_0.painting:OnPaintingFade(false)
		end)
	end
end

function var_0_0.IsLive2DState(arg_20_0)
	return var_0_0.STATE_L2D == arg_20_0.state
end

function var_0_0.IsLoading(arg_21_0)
	if arg_21_0.painting and arg_21_0.painting:IsLoading() then
		return true
	end

	return false
end

function var_0_0.Init(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if not arg_22_0._paintingManager then
		arg_22_0._paintingManager = PaintingFadeManager.New()

		arg_22_0._paintingManager:SetRawPaintingContainer(arg_22_0._tf)

		for iter_22_0, iter_22_1 in pairs(arg_22_0.paintings) do
			iter_22_1:SetTargetContainer(arg_22_0._paintingManager:GetPaintingContainer())
		end

		arg_22_0._firstPaintingLoading = true
	end

	print("初始化舰船 = " .. arg_22_1:getPainting())

	if arg_22_0:ShouldReLoad(arg_22_1) then
		arg_22_0.shift = arg_22_2 or arg_22_0.shift

		assert(arg_22_0.shift)

		arg_22_0.ship = arg_22_1
		arg_22_0.anim = arg_22_3

		local var_22_0, var_22_1 = var_0_0.GetAssistantStatus(arg_22_1)

		arg_22_0.painting = arg_22_0.paintings[var_22_0]
		arg_22_0.state = var_22_0
		arg_22_0.skinId = arg_22_0.ship:getSkinId()
		arg_22_0.bgToggle = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_22_1:getPainting(), 0)

		arg_22_0:Reload(function()
			arg_22_0:InitShipShift()
		end)
	else
		arg_22_0.painting:Resume()
		arg_22_0:InitShipShift()
	end
end

function var_0_0.InitShipShift(arg_24_0)
	local var_24_0 = arg_24_0.shift
	local var_24_1 = arg_24_0.ship

	if arg_24_0.anim then
		arg_24_0:AdjustPositionWithAnim(var_24_1)
	else
		arg_24_0:AdjustPosition(var_24_1)
	end

	arg_24_0.painting:SetShift(arg_24_0.shift)
end

function var_0_0.Reload(arg_25_0, arg_25_1)
	local function var_25_0()
		print("开始加载舰船 = " .. arg_25_0.ship:getPainting())

		if arg_25_0._loadingPainting then
			if arg_25_0._paintingManager then
				arg_25_0._paintingManager:DisablePainting()
			end

			arg_25_0._loadingPainting:Unload()
		end

		arg_25_0.painting:Load(arg_25_0.ship, arg_25_0.state)

		if arg_25_1 then
			arg_25_1()

			arg_25_1 = nil
		end

		arg_25_0._loadingPainting = arg_25_0.painting
	end

	if arg_25_0._paintingManager then
		arg_25_0.painting:OnPaintingFade(true)

		if not arg_25_0._paintingFadeFlag then
			arg_25_0._paintingFadeFlag = true

			arg_25_0._paintingManager:SetPaintingFadeOut(function()
				arg_25_0._paintingFadeFlag = false

				var_25_0()
			end)
		end
	else
		var_25_0()
	end
end

function var_0_0.Refresh(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0:Init(arg_28_1, arg_28_2)
end

function var_0_0.Disable(arg_29_0)
	if arg_29_0._paintingManager then
		arg_29_0._paintingManager:Dispose()

		arg_29_0._paintingManager = nil
		arg_29_0._paintingFadeFlag = false
	end

	if arg_29_0.painting then
		arg_29_0.painting:Pause()
	end
end

function var_0_0.ShouldReLoad(arg_30_0, arg_30_1)
	if not arg_30_0.painting or not arg_30_0._loadingPainting or not arg_30_0.ship or not arg_30_0.state or not arg_30_0.bgToggle then
		return true
	end

	local var_30_0 = var_0_0.GetAssistantStatus(arg_30_1)
	local var_30_1 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_30_0._loadingPainting.paintingName, 0)

	if arg_30_0.skinId == arg_30_0.ship:getSkinId() and arg_30_1.id == arg_30_0.ship.id and arg_30_0.state == var_30_0 and arg_30_0.bgToggle == var_30_1 and arg_30_1:GetRecordPosKey() == arg_30_0.ship:GetRecordPosKey() and not arg_30_0.reloadOnResume then
		print("不加载舰船 = " .. arg_30_1:getPainting())

		return false
	else
		if arg_30_0.reloadOnResume then
			arg_30_0.reloadOnResume = false
		end

		return true
	end
end

function var_0_0.SetOnceLoadedCall(arg_31_0, arg_31_1)
	arg_31_0.painting:SetOnceLoadedCall(arg_31_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_32_0, arg_32_1)
	arg_32_0.painting:PlayChangeSkinActionIn(arg_32_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_33_0, arg_33_1)
	arg_33_0.painting:PlayChangeSkinActionOut(arg_33_1)
end

function var_0_0.AdjustPositionWithAnim(arg_34_0, arg_34_1)
	LeanTween.cancel(go(arg_34_0._tf))
	LeanTween.cancel(go(arg_34_0._bgTf))

	local var_34_0 = arg_34_0:GetPositionAndScale(arg_34_1)

	LeanTween.moveLocal(go(arg_34_0._tf), var_34_0, 0.3):setEase(LeanTweenType.easeInOutExpo)
	LeanTween.moveLocal(go(arg_34_0._bgTf), var_34_0, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_34_1, var_34_2 = arg_34_0.shift:GetSpineShift()

	LeanTween.moveLocal(go(arg_34_0.spineContainer), var_34_1, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_34_3, var_34_4 = arg_34_0.shift:GetL2dShift()

	if arg_34_0.painting:IslimitYPos() then
		var_34_3.y = arg_34_0.painting:GetHalfBodyOffsetY()
	end

	LeanTween.moveLocal(go(arg_34_0.l2dContainer), var_34_3, 0.3):setEase(LeanTweenType.easeInOutExpo):setOnComplete(System.Action(function()
		arg_34_0:AdjustPosition(arg_34_1)
	end))
end

function var_0_0.AdjustPosition(arg_36_0, arg_36_1)
	local var_36_0, var_36_1 = arg_36_0:GetPositionAndScale(arg_36_1)

	arg_36_0._tf.anchoredPosition = var_36_0
	arg_36_0._bgTf.anchoredPosition = var_36_0

	local var_36_2, var_36_3 = arg_36_0.shift:GetL2dShift()

	if arg_36_0.painting:IslimitYPos() then
		var_36_2.y = arg_36_0.painting:GetHalfBodyOffsetY()
	end

	arg_36_0.l2dContainer.anchoredPosition = var_36_2

	local var_36_4, var_36_5 = arg_36_0.shift:GetSpineShift()

	arg_36_0.spineContainer.anchoredPosition = var_36_4

	local var_36_6, var_36_7, var_36_8 = getProxy(SettingsProxy):getSkinPosSetting(arg_36_1)

	if var_36_8 then
		arg_36_0._bgTf.localScale = Vector3(var_36_8, var_36_8, 1)
		arg_36_0._tf.localScale = Vector3(var_36_8, var_36_8, 1)
	elseif arg_36_0.state == var_0_0.STATE_L2D then
		arg_36_0._bgTf.localScale = var_36_3
		arg_36_0._tf.localScale = var_36_3
	elseif arg_36_0.state == var_0_0.STATE_SPINE_PAINTING then
		arg_36_0._bgTf.localScale = var_36_5
		arg_36_0._tf.localScale = var_36_5
	else
		arg_36_0._bgTf.localScale = var_36_1
		arg_36_0._tf.localScale = var_36_1
	end

	if arg_36_0._paintingManager then
		arg_36_0._paintingManager:ResetPaintingContainerOffset(arg_36_0.l2dContainer.anchoredPosition, arg_36_0.spineContainer.anchoredPosition, arg_36_0.meshContainer.anchoredPosition)
	end
end

function var_0_0.GetPositionAndScale(arg_37_0, arg_37_1)
	local var_37_0, var_37_1, var_37_2 = getProxy(SettingsProxy):getSkinPosSetting(arg_37_1)
	local var_37_3 = Vector3(0, 0, 0)
	local var_37_4 = Vector3(1, 1, 1)

	if var_37_0 then
		var_37_3 = Vector3(var_37_0, var_37_1, 0)
		var_37_4 = Vector3(var_37_2, var_37_2, 1)
	else
		local var_37_5, var_37_6 = arg_37_0.shift:GetMeshImageShift()

		var_37_3 = var_37_5
		var_37_4 = var_37_6
	end

	return var_37_3, var_37_4
end

function var_0_0.GetAssistantStatus(arg_38_0)
	local var_38_0 = arg_38_0:getPainting()
	local var_38_1 = getProxy(SettingsProxy)
	local var_38_2 = HXSet.autoHxShiftPath("spinepainting/" .. var_38_0)
	local var_38_3 = checkABExist(var_38_2)
	local var_38_4 = HXSet.autoHxShiftPath("live2d/" .. var_38_0)
	local var_38_5 = var_0_0.Live2dIsDownload(var_38_4) and checkABExist(var_38_4)
	local var_38_6 = var_38_1:getCharacterSetting(arg_38_0.id, SHIP_FLAG_BG)

	if var_38_1:getCharacterSetting(arg_38_0.id, SHIP_FLAG_L2D) and var_38_5 then
		return isa(arg_38_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_L2D or var_0_0.STATE_L2D, var_38_6
	elseif var_38_1:getCharacterSetting(arg_38_0.id, SHIP_FLAG_SP) and var_38_3 then
		return isa(arg_38_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_SPINE or var_0_0.STATE_SPINE_PAINTING, var_38_6
	else
		return isa(arg_38_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_CHAR or var_0_0.STATE_PAINTING, var_38_6
	end
end

function var_0_0.OnBoundChange(arg_39_0)
	if arg_39_0.painting then
		arg_39_0.painting:UpdateBound()
	end
end

function var_0_0.Live2dIsDownload(arg_40_0)
	local var_40_0 = GroupHelper.GetGroupMgrByName("L2D"):CheckF(arg_40_0)

	return var_40_0 == DownloadState.None or var_40_0 == DownloadState.UpdateSuccess
end

function var_0_0.Fold(arg_41_0, arg_41_1, arg_41_2)
	return
end

function var_0_0.EnableOrDisableScale(arg_42_0, arg_42_1)
	arg_42_0.painting:EnableOrDisableMove(arg_42_1)
	arg_42_0.painting:OnEnablePartScale(arg_42_1)
end

function var_0_0.EnableOrDisableMove(arg_43_0, arg_43_1)
	arg_43_0.painting:EnableOrDisableMove(arg_43_1)

	if arg_43_1 then
		arg_43_0:EnableDragAndZoom()
	else
		arg_43_0:DisableDragAndZoom()
	end
end

function var_0_0.OnAsmrTurnning(arg_44_0, arg_44_1)
	arg_44_0.painting:OnAsmrTurnning(arg_44_1)
end

function var_0_0.EnableDragAndZoom(arg_45_0)
	arg_45_0.isEnableDrag = true

	local var_45_0 = arg_45_0._tf.parent.gameObject
	local var_45_1 = GetOrAddComponent(var_45_0, typeof(PinchZoom))
	local var_45_2 = GetOrAddComponent(var_45_0, typeof(EventTriggerListener))
	local var_45_3 = Vector3(0, 0, 0)

	var_45_2:AddBeginDragFunc(function(arg_46_0, arg_46_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_45_1.processing then
			return
		end

		setButtonEnabled(var_45_0, false)

		if Input.touchCount > 1 then
			return
		end

		local var_46_0 = var_0_0.Screen2Local(var_45_0.transform.parent, arg_46_1.position)

		var_45_3 = arg_45_0._tf.localPosition - var_46_0
	end)
	var_45_2:AddDragFunc(function(arg_47_0, arg_47_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_45_1.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_47_0 = var_0_0.Screen2Local(var_45_0.transform.parent, arg_47_1.position)
		local var_47_1

		if arg_45_0.painting:IslimitYPos() then
			var_47_1 = Vector3(var_47_0.x, arg_45_0._tf.localPosition.y, 0) + Vector3(var_45_3.x, 0, 0)
		else
			var_47_1 = Vector3(var_47_0.x, var_47_0.y, 0) + var_45_3
		end

		arg_45_0._tf.localPosition = var_47_1
		arg_45_0._bgTf.localPosition = arg_45_0.bgOffset + arg_45_0._tf.localPosition
	end)
	var_45_2:AddDragEndFunc(function()
		setButtonEnabled(var_45_0, true)
	end)

	if not arg_45_0.painting:IslimitYPos() then
		var_45_1.enabled = true
	end

	var_45_2.enabled = true
	Input.multiTouchEnabled = true
	arg_45_0.cg.blocksRaycasts = false

	arg_45_0:AdjustPosition(arg_45_0.ship)
end

function var_0_0.DisableDragAndZoom(arg_49_0)
	if arg_49_0.isEnableDrag then
		local var_49_0 = arg_49_0._tf.parent:GetComponent(typeof(EventTriggerListener))

		ClearEventTrigger(var_49_0)

		var_49_0.enabled = false
		arg_49_0._tf.parent:GetComponent(typeof(PinchZoom)).enabled = false
		arg_49_0.cg.blocksRaycasts = true
		arg_49_0.isEnableDrag = false
	end

	arg_49_0:AdjustPosition(arg_49_0.ship)
end

function var_0_0.Dispose(arg_50_0)
	var_0_0.super.Dispose(arg_50_0)

	if arg_50_0._paintingManager then
		arg_50_0._paintingManager:Dispose()
	end

	arg_50_0:DisableDragAndZoom()

	if arg_50_0.painting then
		arg_50_0.painting:Unload()
	end

	arg_50_0.painting = nil
	arg_50_0._loadingPainting = nil

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.paintings) do
		iter_50_1:Dispose()
	end

	arg_50_0.paintings = nil
end

function var_0_0.Screen2Local(arg_51_0, arg_51_1)
	local var_51_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_51_1 = arg_51_0:GetComponent("RectTransform")
	local var_51_2 = LuaHelper.ScreenToLocal(var_51_1, arg_51_1, var_51_0)

	return Vector3(var_51_2.x, var_51_2.y, 0)
end

return var_0_0
