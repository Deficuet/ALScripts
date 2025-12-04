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

	function Live2dConst.UnLoadL2dPating()
		if not arg_2_0.reloadOnResume and arg_2_0.painting and isa(arg_2_0.painting, MainLive2dPainting) then
			arg_2_0.painting:SetContainerVisible(false)

			arg_2_0.reloadOnResume = true
		end
	end
end

function var_0_0.OnChatStateChange(arg_14_0, arg_14_1)
	if not arg_14_1 then
		arg_14_0.painting:StopChatAnimtion()
	end
end

function var_0_0.OnStopVoice(arg_15_0)
	if arg_15_0.painting then
		arg_15_0.painting:OnStopVoice()
	end
end

function var_0_0.IsLive2DState(arg_16_0)
	return var_0_0.STATE_L2D == arg_16_0.state
end

function var_0_0.IsLoading(arg_17_0)
	if arg_17_0.painting and arg_17_0.painting:IsLoading() then
		return true
	end

	return false
end

function var_0_0.Init(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_0:ShouldReLoad(arg_18_1) then
		arg_18_0:Reload(arg_18_1)
	else
		arg_18_0.painting:Resume()
	end

	arg_18_0.shift = arg_18_2 or arg_18_0.shift

	assert(arg_18_0.shift)

	if arg_18_3 then
		arg_18_0:AdjustPositionWithAnim(arg_18_1)
	else
		arg_18_0:AdjustPosition(arg_18_1)
	end

	arg_18_0.painting:SetShift(arg_18_0.shift)
end

function var_0_0.Reload(arg_19_0, arg_19_1)
	arg_19_0.ship = arg_19_1

	local var_19_0, var_19_1 = var_0_0.GetAssistantStatus(arg_19_1)
	local var_19_2 = arg_19_0.paintings[var_19_0]

	if arg_19_0.painting then
		arg_19_0.painting:Unload()
	end

	var_19_2:Load(arg_19_1)

	arg_19_0.painting = var_19_2
	arg_19_0.state = var_19_0
	arg_19_0.bgToggle = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_19_0.painting.paintingName, 0)
	arg_19_0.skinId = arg_19_1:getSkinId()
end

function var_0_0.Refresh(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0:Init(arg_20_1, arg_20_2)
end

function var_0_0.ShouldReLoad(arg_21_0, arg_21_1)
	if not arg_21_0.painting or not arg_21_0.ship or not arg_21_0.state or not arg_21_0.bgToggle then
		return true
	end

	local var_21_0 = var_0_0.GetAssistantStatus(arg_21_1)
	local var_21_1 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_21_0.painting.paintingName, 0)

	if arg_21_0.skinId == arg_21_0.ship:getSkinId() and arg_21_1.id == arg_21_0.ship.id and arg_21_0.state == var_21_0 and arg_21_0.bgToggle == var_21_1 and arg_21_1:GetRecordPosKey() == arg_21_0.ship:GetRecordPosKey() and not arg_21_0.reloadOnResume then
		return false
	else
		if arg_21_0.reloadOnResume then
			arg_21_0.reloadOnResume = false
		end

		return true
	end
end

function var_0_0.SetOnceLoadedCall(arg_22_0, arg_22_1)
	arg_22_0.painting:SetOnceLoadedCall(arg_22_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_23_0, arg_23_1)
	arg_23_0.painting:PlayChangeSkinActionIn(arg_23_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_24_0, arg_24_1)
	arg_24_0.painting:PlayChangeSkinActionOut(arg_24_1)
end

function var_0_0.Disable(arg_25_0)
	if arg_25_0.painting then
		arg_25_0.painting:Pause()
	end
end

function var_0_0.AdjustPositionWithAnim(arg_26_0, arg_26_1)
	LeanTween.cancel(go(arg_26_0._tf))
	LeanTween.cancel(go(arg_26_0._bgTf))

	local var_26_0 = arg_26_0:GetPositionAndScale(arg_26_1)

	LeanTween.moveLocal(go(arg_26_0._tf), var_26_0, 0.3):setEase(LeanTweenType.easeInOutExpo)
	LeanTween.moveLocal(go(arg_26_0._bgTf), var_26_0, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_26_1, var_26_2 = arg_26_0.shift:GetSpineShift()

	LeanTween.moveLocal(go(arg_26_0.spineContainer), var_26_1, 0.3):setEase(LeanTweenType.easeInOutExpo)

	local var_26_3, var_26_4 = arg_26_0.shift:GetL2dShift()

	if arg_26_0.painting:IslimitYPos() then
		var_26_3.y = arg_26_0.painting:GetHalfBodyOffsetY()
	end

	LeanTween.moveLocal(go(arg_26_0.l2dContainer), var_26_3, 0.3):setEase(LeanTweenType.easeInOutExpo):setOnComplete(System.Action(function()
		arg_26_0:AdjustPosition(arg_26_1)
	end))
end

function var_0_0.AdjustPosition(arg_28_0, arg_28_1)
	local var_28_0, var_28_1 = arg_28_0:GetPositionAndScale(arg_28_1)

	arg_28_0._tf.anchoredPosition = var_28_0
	arg_28_0._bgTf.anchoredPosition = var_28_0

	local var_28_2, var_28_3 = arg_28_0.shift:GetL2dShift()

	if arg_28_0.painting:IslimitYPos() then
		var_28_2.y = arg_28_0.painting:GetHalfBodyOffsetY()
	end

	arg_28_0.l2dContainer.anchoredPosition = var_28_2

	local var_28_4, var_28_5 = arg_28_0.shift:GetSpineShift()

	arg_28_0.spineContainer.anchoredPosition = var_28_4

	local var_28_6, var_28_7, var_28_8 = getProxy(SettingsProxy):getSkinPosSetting(arg_28_1)

	if var_28_8 then
		arg_28_0._bgTf.localScale = Vector3(var_28_8, var_28_8, 1)
		arg_28_0._tf.localScale = Vector3(var_28_8, var_28_8, 1)
	elseif arg_28_0.state == var_0_0.STATE_L2D then
		arg_28_0._bgTf.localScale = var_28_3
		arg_28_0._tf.localScale = var_28_3
	elseif arg_28_0.state == var_0_0.STATE_SPINE_PAINTING then
		arg_28_0._bgTf.localScale = var_28_5
		arg_28_0._tf.localScale = var_28_5
	else
		arg_28_0._bgTf.localScale = var_28_1
		arg_28_0._tf.localScale = var_28_1
	end
end

function var_0_0.GetPositionAndScale(arg_29_0, arg_29_1)
	local var_29_0, var_29_1, var_29_2 = getProxy(SettingsProxy):getSkinPosSetting(arg_29_1)
	local var_29_3 = Vector3(0, 0, 0)
	local var_29_4 = Vector3(1, 1, 1)

	if var_29_0 then
		var_29_3 = Vector3(var_29_0, var_29_1, 0)
		var_29_4 = Vector3(var_29_2, var_29_2, 1)
	else
		local var_29_5, var_29_6 = arg_29_0.shift:GetMeshImageShift()

		var_29_3 = var_29_5
		var_29_4 = var_29_6
	end

	return var_29_3, var_29_4
end

function var_0_0.GetAssistantStatus(arg_30_0)
	local var_30_0 = arg_30_0:getPainting()
	local var_30_1 = getProxy(SettingsProxy)
	local var_30_2 = HXSet.autoHxShiftPath("spinepainting/" .. var_30_0)
	local var_30_3 = checkABExist(var_30_2)
	local var_30_4 = HXSet.autoHxShiftPath("live2d/" .. var_30_0)
	local var_30_5 = var_0_0.Live2dIsDownload(var_30_4) and checkABExist(var_30_4)
	local var_30_6 = var_30_1:getCharacterSetting(arg_30_0.id, SHIP_FLAG_BG)

	if var_30_1:getCharacterSetting(arg_30_0.id, SHIP_FLAG_L2D) and var_30_5 then
		return isa(arg_30_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_L2D or var_0_0.STATE_L2D, var_30_6
	elseif var_30_1:getCharacterSetting(arg_30_0.id, SHIP_FLAG_SP) and var_30_3 then
		return isa(arg_30_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_SPINE or var_0_0.STATE_SPINE_PAINTING, var_30_6
	else
		return isa(arg_30_0, VirtualEducateCharShip) and var_0_0.STATE_EDUCATE_CHAR or var_0_0.STATE_PAINTING, var_30_6
	end
end

function var_0_0.Live2dIsDownload(arg_31_0)
	local var_31_0 = GroupHelper.GetGroupMgrByName("L2D"):CheckF(arg_31_0)

	return var_31_0 == DownloadState.None or var_31_0 == DownloadState.UpdateSuccess
end

function var_0_0.Fold(arg_32_0, arg_32_1, arg_32_2)
	LeanTween.cancel(arg_32_0._tf.gameObject)
	LeanTween.cancel(arg_32_0._bgTf.gameObject)

	if arg_32_1 and not arg_32_0.silentFlag then
		local var_32_0 = arg_32_0._tf.localPosition - arg_32_0._bgTf.localPosition
		local var_32_1 = arg_32_0.shift:GetMeshImageShift()
		local var_32_2 = Vector3(0 - arg_32_0.painting:GetOffset(), var_32_1.y, 0)

		LeanTween.moveLocal(arg_32_0._tf.gameObject, var_32_2, arg_32_2):setEase(LeanTweenType.easeInOutExpo)

		local var_32_3 = var_32_2 - var_32_0

		LeanTween.moveLocal(arg_32_0._bgTf.gameObject, var_32_3, arg_32_2):setEase(LeanTweenType.easeInOutExpo):setOnComplete(System.Action(function()
			arg_32_0.painting:Fold(arg_32_1, arg_32_2)
		end))
	elseif arg_32_0.ship then
		local var_32_4 = arg_32_0:GetPositionAndScale(arg_32_0.ship)

		LeanTween.moveLocal(arg_32_0._tf.gameObject, var_32_4, arg_32_2):setEase(LeanTweenType.easeInOutExpo)
		LeanTween.moveLocal(arg_32_0._bgTf.gameObject, var_32_4, arg_32_2):setEase(LeanTweenType.easeInOutExpo):setOnComplete(System.Action(function()
			if arg_32_0.exited then
				return
			end

			arg_32_0.painting:Fold(arg_32_1, arg_32_2)
		end))
	end
end

function var_0_0.EnableOrDisableScale(arg_35_0, arg_35_1)
	arg_35_0.painting:EnableOrDisableMove(arg_35_1)
	arg_35_0.painting:OnEnablePartScale(arg_35_1)
end

function var_0_0.EnableOrDisableMove(arg_36_0, arg_36_1)
	arg_36_0.painting:EnableOrDisableMove(arg_36_1)

	if arg_36_1 then
		arg_36_0:EnableDragAndZoom()
	else
		arg_36_0:DisableDragAndZoom()
	end
end

function var_0_0.EnableDragAndZoom(arg_37_0)
	arg_37_0.isEnableDrag = true

	local var_37_0 = arg_37_0._tf.parent.gameObject
	local var_37_1 = GetOrAddComponent(var_37_0, typeof(PinchZoom))
	local var_37_2 = GetOrAddComponent(var_37_0, typeof(EventTriggerListener))
	local var_37_3 = Vector3(0, 0, 0)

	var_37_2:AddBeginDragFunc(function(arg_38_0, arg_38_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_37_1.processing then
			return
		end

		setButtonEnabled(var_37_0, false)

		if Input.touchCount > 1 then
			return
		end

		local var_38_0 = var_0_0.Screen2Local(var_37_0.transform.parent, arg_38_1.position)

		var_37_3 = arg_37_0._tf.localPosition - var_38_0
	end)
	var_37_2:AddDragFunc(function(arg_39_0, arg_39_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_37_1.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_39_0 = var_0_0.Screen2Local(var_37_0.transform.parent, arg_39_1.position)
		local var_39_1

		if arg_37_0.painting:IslimitYPos() then
			var_39_1 = Vector3(var_39_0.x, arg_37_0._tf.localPosition.y, 0) + Vector3(var_37_3.x, 0, 0)
		else
			var_39_1 = Vector3(var_39_0.x, var_39_0.y, 0) + var_37_3
		end

		arg_37_0._tf.localPosition = var_39_1
		arg_37_0._bgTf.localPosition = arg_37_0.bgOffset + arg_37_0._tf.localPosition
	end)
	var_37_2:AddDragEndFunc(function()
		setButtonEnabled(var_37_0, true)
	end)

	if not arg_37_0.painting:IslimitYPos() then
		var_37_1.enabled = true
	end

	var_37_2.enabled = true
	Input.multiTouchEnabled = true
	arg_37_0.cg.blocksRaycasts = false

	arg_37_0:AdjustPosition(arg_37_0.ship)
end

function var_0_0.DisableDragAndZoom(arg_41_0)
	if arg_41_0.isEnableDrag then
		local var_41_0 = arg_41_0._tf.parent:GetComponent(typeof(EventTriggerListener))

		ClearEventTrigger(var_41_0)

		var_41_0.enabled = false
		arg_41_0._tf.parent:GetComponent(typeof(PinchZoom)).enabled = false
		arg_41_0.cg.blocksRaycasts = true
		arg_41_0.isEnableDrag = false
	end

	arg_41_0:AdjustPosition(arg_41_0.ship)
end

function var_0_0.Dispose(arg_42_0)
	var_0_0.super.Dispose(arg_42_0)
	arg_42_0:DisableDragAndZoom()

	if arg_42_0.painting then
		arg_42_0.painting:Unload()
	end

	arg_42_0.painting = nil

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.paintings) do
		iter_42_1:Dispose()
	end

	arg_42_0.paintings = nil
end

function var_0_0.Screen2Local(arg_43_0, arg_43_1)
	local var_43_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_43_1 = arg_43_0:GetComponent("RectTransform")
	local var_43_2 = LuaHelper.ScreenToLocal(var_43_1, arg_43_1, var_43_0)

	return Vector3(var_43_2.x, var_43_2.y, 0)
end

return var_0_0
