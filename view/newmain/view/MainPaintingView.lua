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

	function Live2dConst.UnLoadL2dPating()
		if not arg_2_0.reloadOnResume and arg_2_0.painting and isa(arg_2_0.painting, MainLive2dPainting) then
			arg_2_0.painting:SetContainerVisible(false)

			arg_2_0.reloadOnResume = true
		end
	end
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

function var_0_0.IsLive2DState(arg_18_0)
	return var_0_0.STATE_L2D == arg_18_0.state
end

function var_0_0.IsLoading(arg_19_0)
	if arg_19_0.painting and arg_19_0.painting:IsLoading() then
		return true
	end

	return false
end

function var_0_0.Init(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	if arg_20_0:ShouldReLoad(arg_20_1) then
		arg_20_0:Reload(arg_20_1)
	else
		arg_20_0.painting:Resume()
	end

	arg_20_0.shift = arg_20_2 or arg_20_0.shift

	assert(arg_20_0.shift)

	if arg_20_3 then
		arg_20_0:AdjustPositionWithAnim(arg_20_1)
	else
		arg_20_0:AdjustPosition(arg_20_1)
	end

	arg_20_0.painting:SetShift(arg_20_0.shift)
end

function var_0_0.Reload(arg_21_0, arg_21_1)
	arg_21_0.ship = arg_21_1

	local var_21_0, var_21_1 = var_0_0.GetAssistantStatus(arg_21_1)
	local var_21_2 = arg_21_0.paintings[var_21_0]

	if arg_21_0.painting then
		arg_21_0.painting:Unload()
	end

	var_21_2:Load(arg_21_1)

	arg_21_0.painting = var_21_2
	arg_21_0.state = var_21_0
	arg_21_0.bgToggle = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_21_0.painting.paintingName, 0)
	arg_21_0.skinId = arg_21_1:getSkinId()
end

function var_0_0.Refresh(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0:Init(arg_22_1, arg_22_2)
end

function var_0_0.ShouldReLoad(arg_23_0, arg_23_1)
	if not arg_23_0.painting or not arg_23_0.ship or not arg_23_0.state or not arg_23_0.bgToggle then
		return true
	end

	local var_23_0 = var_0_0.GetAssistantStatus(arg_23_1)
	local var_23_1 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_23_0.painting.paintingName, 0)

	if arg_23_0.skinId == arg_23_0.ship:getSkinId() and arg_23_1.id == arg_23_0.ship.id and arg_23_0.state == var_23_0 and arg_23_0.bgToggle == var_23_1 and arg_23_1:GetRecordPosKey() == arg_23_0.ship:GetRecordPosKey() and not arg_23_0.reloadOnResume then
		return false
	else
		if arg_23_0.reloadOnResume then
			arg_23_0.reloadOnResume = false
		end

		return true
	end
end

function var_0_0.SetOnceLoadedCall(arg_24_0, arg_24_1)
	arg_24_0.painting:SetOnceLoadedCall(arg_24_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_25_0, arg_25_1)
	arg_25_0.painting:PlayChangeSkinActionIn(arg_25_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_26_0, arg_26_1)
	arg_26_0.painting:PlayChangeSkinActionOut(arg_26_1)
end

function var_0_0.Disable(arg_27_0)
	if arg_27_0.painting then
		arg_27_0.painting:Pause()
	end
end

function var_0_0.AdjustPositionWithAnim(arg_28_0, arg_28_1)
	LeanTween.cancel(go(arg_28_0._tf))
	LeanTween.cancel(go(arg_28_0._bgTf))

	local var_28_0 = arg_28_0:GetPositionAndScale(arg_28_1)

	LeanTween.moveLocal(go(arg_28_0._tf), var_28_0, 0.3):setEase(LeanTweenType.easeInOutExpo)
	LeanTween.moveLocal(go(arg_28_0._bgTf), var_28_0, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_28_1, var_28_2 = arg_28_0.shift:GetSpineShift()

	LeanTween.moveLocal(go(arg_28_0.spineContainer), var_28_1, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_28_3, var_28_4 = arg_28_0.shift:GetL2dShift()

	if arg_28_0.painting:IslimitYPos() then
		var_28_3.y = arg_28_0.painting:GetHalfBodyOffsetY()
	end

	LeanTween.moveLocal(go(arg_28_0.l2dContainer), var_28_3, 0.3):setEase(LeanTweenType.easeInOutExpo):setOnComplete(System.Action(function()
		arg_28_0:AdjustPosition(arg_28_1)
	end))
end

function var_0_0.AdjustPosition(arg_30_0, arg_30_1)
	local var_30_0, var_30_1 = arg_30_0:GetPositionAndScale(arg_30_1)

	arg_30_0._tf.anchoredPosition = var_30_0
	arg_30_0._bgTf.anchoredPosition = var_30_0

	local var_30_2, var_30_3 = arg_30_0.shift:GetL2dShift()

	if arg_30_0.painting:IslimitYPos() then
		var_30_2.y = arg_30_0.painting:GetHalfBodyOffsetY()
	end

	arg_30_0.l2dContainer.anchoredPosition = var_30_2

	local var_30_4, var_30_5 = arg_30_0.shift:GetSpineShift()

	arg_30_0.spineContainer.anchoredPosition = var_30_4

	local var_30_6, var_30_7, var_30_8 = getProxy(SettingsProxy):getSkinPosSetting(arg_30_1)

	if var_30_8 then
		arg_30_0._bgTf.localScale = Vector3(var_30_8, var_30_8, 1)
		arg_30_0._tf.localScale = Vector3(var_30_8, var_30_8, 1)
	elseif arg_30_0.state == var_0_0.STATE_L2D then
		arg_30_0._bgTf.localScale = var_30_3
		arg_30_0._tf.localScale = var_30_3
	elseif arg_30_0.state == var_0_0.STATE_SPINE_PAINTING then
		arg_30_0._bgTf.localScale = var_30_5
		arg_30_0._tf.localScale = var_30_5
	else
		arg_30_0._bgTf.localScale = var_30_1
		arg_30_0._tf.localScale = var_30_1
	end
end

function var_0_0.GetPositionAndScale(arg_31_0, arg_31_1)
	local var_31_0, var_31_1, var_31_2 = getProxy(SettingsProxy):getSkinPosSetting(arg_31_1)
	local var_31_3 = Vector3(0, 0, 0)
	local var_31_4 = Vector3(1, 1, 1)

	if var_31_0 then
		var_31_3 = Vector3(var_31_0, var_31_1, 0)
		var_31_4 = Vector3(var_31_2, var_31_2, 1)
	else
		local var_31_5, var_31_6 = arg_31_0.shift:GetMeshImageShift()

		var_31_3 = var_31_5
		var_31_4 = var_31_6
	end

	return var_31_3, var_31_4
end

function var_0_0.GetAssistantStatus(arg_32_0)
	local var_32_0 = arg_32_0:getPainting()
	local var_32_1 = getProxy(SettingsProxy)
	local var_32_2 = HXSet.autoHxShiftPath("spinepainting/" .. var_32_0)
	local var_32_3 = checkABExist(var_32_2)
	local var_32_4 = HXSet.autoHxShiftPath("live2d/" .. var_32_0)
	local var_32_5 = var_0_0.Live2dIsDownload(var_32_4) and checkABExist(var_32_4)
	local var_32_6 = var_32_1:getCharacterSetting(arg_32_0.id, SHIP_FLAG_BG)

	if var_32_1:getCharacterSetting(arg_32_0.id, SHIP_FLAG_L2D) and var_32_5 then
		return isa(arg_32_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_L2D or var_0_0.STATE_L2D, var_32_6
	elseif var_32_1:getCharacterSetting(arg_32_0.id, SHIP_FLAG_SP) and var_32_3 then
		return isa(arg_32_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_SPINE or var_0_0.STATE_SPINE_PAINTING, var_32_6
	else
		return isa(arg_32_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_CHAR or var_0_0.STATE_PAINTING, var_32_6
	end
end

function var_0_0.OnBoundChange(arg_33_0)
	if arg_33_0.painting then
		arg_33_0.painting:UpdateBound()
	end
end

function var_0_0.Live2dIsDownload(arg_34_0)
	local var_34_0 = GroupHelper.GetGroupMgrByName("L2D"):CheckF(arg_34_0)

	return var_34_0 == DownloadState.None or var_34_0 == DownloadState.UpdateSuccess
end

function var_0_0.Fold(arg_35_0, arg_35_1, arg_35_2)
	return
end

function var_0_0.EnableOrDisableScale(arg_36_0, arg_36_1)
	arg_36_0.painting:EnableOrDisableMove(arg_36_1)
	arg_36_0.painting:OnEnablePartScale(arg_36_1)
end

function var_0_0.EnableOrDisableMove(arg_37_0, arg_37_1)
	arg_37_0.painting:EnableOrDisableMove(arg_37_1)

	if arg_37_1 then
		arg_37_0:EnableDragAndZoom()
	else
		arg_37_0:DisableDragAndZoom()
	end
end

function var_0_0.OnAsmrTurnning(arg_38_0, arg_38_1)
	arg_38_0.painting:OnAsmrTurnning(arg_38_1)
end

function var_0_0.EnableDragAndZoom(arg_39_0)
	arg_39_0.isEnableDrag = true

	local var_39_0 = arg_39_0._tf.parent.gameObject
	local var_39_1 = GetOrAddComponent(var_39_0, typeof(PinchZoom))
	local var_39_2 = GetOrAddComponent(var_39_0, typeof(EventTriggerListener))
	local var_39_3 = Vector3(0, 0, 0)

	var_39_2:AddBeginDragFunc(function(arg_40_0, arg_40_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_39_1.processing then
			return
		end

		setButtonEnabled(var_39_0, false)

		if Input.touchCount > 1 then
			return
		end

		local var_40_0 = var_0_0.Screen2Local(var_39_0.transform.parent, arg_40_1.position)

		var_39_3 = arg_39_0._tf.localPosition - var_40_0
	end)
	var_39_2:AddDragFunc(function(arg_41_0, arg_41_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_39_1.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_41_0 = var_0_0.Screen2Local(var_39_0.transform.parent, arg_41_1.position)
		local var_41_1

		if arg_39_0.painting:IslimitYPos() then
			var_41_1 = Vector3(var_41_0.x, arg_39_0._tf.localPosition.y, 0) + Vector3(var_39_3.x, 0, 0)
		else
			var_41_1 = Vector3(var_41_0.x, var_41_0.y, 0) + var_39_3
		end

		arg_39_0._tf.localPosition = var_41_1
		arg_39_0._bgTf.localPosition = arg_39_0.bgOffset + arg_39_0._tf.localPosition
	end)
	var_39_2:AddDragEndFunc(function()
		setButtonEnabled(var_39_0, true)
	end)

	if not arg_39_0.painting:IslimitYPos() then
		var_39_1.enabled = true
	end

	var_39_2.enabled = true
	Input.multiTouchEnabled = true
	arg_39_0.cg.blocksRaycasts = false

	arg_39_0:AdjustPosition(arg_39_0.ship)
end

function var_0_0.DisableDragAndZoom(arg_43_0)
	if arg_43_0.isEnableDrag then
		local var_43_0 = arg_43_0._tf.parent:GetComponent(typeof(EventTriggerListener))

		ClearEventTrigger(var_43_0)

		var_43_0.enabled = false
		arg_43_0._tf.parent:GetComponent(typeof(PinchZoom)).enabled = false
		arg_43_0.cg.blocksRaycasts = true
		arg_43_0.isEnableDrag = false
	end

	arg_43_0:AdjustPosition(arg_43_0.ship)
end

function var_0_0.Dispose(arg_44_0)
	var_0_0.super.Dispose(arg_44_0)
	arg_44_0:DisableDragAndZoom()

	if arg_44_0.painting then
		arg_44_0.painting:Unload()
	end

	arg_44_0.painting = nil

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.paintings) do
		iter_44_1:Dispose()
	end

	arg_44_0.paintings = nil
end

function var_0_0.Screen2Local(arg_45_0, arg_45_1)
	local var_45_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_45_1 = arg_45_0:GetComponent("RectTransform")
	local var_45_2 = LuaHelper.ScreenToLocal(var_45_1, arg_45_1, var_45_0)

	return Vector3(var_45_2.x, var_45_2.y, 0)
end

return var_0_0
