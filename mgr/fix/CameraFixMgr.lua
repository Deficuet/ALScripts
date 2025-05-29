pg = pg or {}
pg.CameraFixMgr = singletonClass("CameraFixMgr", import("view.base.BaseEventLogic"))

local var_0_0 = pg.CameraFixMgr

var_0_0.ASPECT_RATIO_UPDATE = "aspect_ratio_update"

local var_0_1 = 211

function var_0_0.Init(arg_1_0, arg_1_1)
	arg_1_0.orientation = Screen.orientation
	arg_1_0.adpterTr = GameObject.Find("UICamera/Adpter").transform
	arg_1_0.adpterCanvas = arg_1_0.adpterTr:GetComponent("Canvas")
	arg_1_0.leftPanel = arg_1_0.adpterTr:Find("left")
	arg_1_0.rightPanel = arg_1_0.adpterTr:Find("right")
	arg_1_0.topPanel = arg_1_0.adpterTr:Find("top")
	arg_1_0.bottomPanel = arg_1_0.adpterTr:Find("bottom")
	arg_1_0.cameraMgr = CameraMgr.instance
	arg_1_0.paddingCanvas = arg_1_0.adpterTr
	arg_1_0.mainCam = arg_1_0.cameraMgr.mainCamera
	arg_1_0.shouldFix = false
	arg_1_0.aspectRatio = 1.7777777777777777
	arg_1_0.targetRatio = arg_1_0.aspectRatio
	arg_1_0.maxAspectRatio = 2.3

	arg_1_0:AddListener()

	arg_1_0.currentWidth = Screen.width
	arg_1_0.currentHeight = Screen.height

	arg_1_0:Adapt()
	arg_1_0:SetMaskAsTopLayer(false)
	arg_1_1()
end

function var_0_0.SetMaskAsTopLayer(arg_2_0, arg_2_1)
	if arg_2_1 then
		arg_2_0.adpterCanvas.sortingOrder = 1000
	else
		arg_2_0.adpterCanvas.sortingOrder = LayerWeightConst.UI_ADPTER_LAYER
	end
end

function var_0_0.AddListener(arg_3_0)
	arg_3_0:Clear()

	if not arg_3_0.handle then
		arg_3_0.cameraMgr.AutoAdapt = false
		arg_3_0.handle = LateUpdateBeat:CreateListener(arg_3_0.LateUpdate, arg_3_0)
	end

	LateUpdateBeat:AddListener(arg_3_0.handle)
end

function var_0_0.LateUpdate(arg_4_0)
	if arg_4_0.shouldFix then
		arg_4_0.shouldFix = false

		arg_4_0:Adapt()
	end

	local var_4_0 = Screen.width
	local var_4_1 = Screen.height

	if arg_4_0.currentWidth ~= var_4_0 or arg_4_0.currentHeight ~= var_4_1 or Screen.orientation ~= arg_4_0.orientation then
		arg_4_0.shouldFix = true
		arg_4_0.orientation = Screen.orientation
		arg_4_0.currentWidth = var_4_0
		arg_4_0.currentHeight = var_4_1
	end
end

function var_0_0.Adapt(arg_5_0)
	local var_5_0 = arg_5_0.currentWidth / arg_5_0.currentHeight
	local var_5_1 = false

	if var_5_0 > arg_5_0.aspectRatio then
		var_5_1 = true
	end

	arg_5_0.targetRatio = arg_5_0.aspectRatio

	if var_5_1 then
		if var_5_0 < arg_5_0.aspectRatio then
			arg_5_0.targetRatio = arg_5_0.aspectRatio
		else
			arg_5_0.targetRatio = math.min(var_5_0, arg_5_0.maxAspectRatio)
		end

		arg_5_0:AdaptTo(arg_5_0.mainCam, arg_5_0.targetRatio)
		arg_5_0:Padding()
	else
		arg_5_0:AdaptTo(arg_5_0.mainCam, arg_5_0.targetRatio)
		arg_5_0:Padding()
	end

	arg_5_0:emit(var_0_0.ASPECT_RATIO_UPDATE, arg_5_0.targetRatio)
end

function var_0_0.AdaptTo(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.currentWidth / arg_6_0.currentHeight
	local var_6_1 = NotchAdapt.CheckNotchRatio

	if var_6_0 <= arg_6_2 then
		local var_6_2 = 0
		local var_6_3 = 1
		local var_6_4 = Mathf.Clamp01(var_6_3 * var_6_0 / arg_6_2)
		local var_6_5 = Mathf.Clamp01((1 - var_6_4) * 0.5)

		arg_6_0.sizeRate = var_6_3 / var_6_4

		arg_6_0:SetCameraOrthographicSize(arg_6_1, arg_6_0:GetCameraOrthographicSize(arg_6_1))

		arg_6_1.rect = UnityEngine.Rect.New(0, 0, 1, 1)
		arg_6_0.actualWidth = arg_6_0.currentWidth
		arg_6_0.actualHeight = arg_6_0.currentWidth / arg_6_2

		local var_6_6 = (arg_6_0.currentHeight - arg_6_0.actualHeight) * 0.5

		arg_6_0.leftBottomVector = Vector3(0, var_6_6, 0)
		arg_6_0.rightTopVector = Vector3(arg_6_0.currentWidth, arg_6_0.currentHeight - var_6_6, 0)
		CameraMgr.instance.finalWidth = arg_6_0.actualWidth
		CameraMgr.instance.finalHeight = arg_6_0.actualHeight
	else
		local var_6_7 = 0
		local var_6_8 = 1
		local var_6_9 = Mathf.Clamp01(var_6_8 * arg_6_2 / var_6_0)
		local var_6_10 = Mathf.Clamp01((1 - var_6_9) * 0.5)

		arg_6_0.sizeRate = var_6_9 / var_6_8

		arg_6_0:SetCameraOrthographicSize(arg_6_1, arg_6_0:GetCameraOrthographicSize(arg_6_1))

		arg_6_1.rect = UnityEngine.Rect.New(0, 0, 1, 1)
		arg_6_0.actualWidth = arg_6_0.currentHeight * arg_6_2
		arg_6_0.actualHeight = arg_6_0.currentHeight

		local var_6_11 = (arg_6_0.currentWidth - arg_6_0.actualWidth) * 0.5

		arg_6_0.leftBottomVector = Vector3(var_6_11, 0, 0)
		arg_6_0.rightTopVector = Vector3(arg_6_0.currentWidth - var_6_11, arg_6_0.currentHeight, 0)
		CameraMgr.instance.finalHeight = arg_6_0.actualHeight
		CameraMgr.instance.finalWidth = arg_6_0.actualWidth
	end

	if var_6_0 > ADAPT_NOTICE and var_6_1 < arg_6_2 then
		arg_6_0.notchAdaptWidth = arg_6_0.currentHeight * var_6_1
		arg_6_0.notchAdaptHeight = arg_6_0.currentHeight

		local var_6_12 = (arg_6_0.currentWidth - arg_6_0.notchAdaptWidth) * 0.5

		arg_6_0.notchAdaptLBVector = Vector3(var_6_12, 0, 0)
		arg_6_0.notchAdaptRTVector = Vector3(arg_6_0.currentWidth - var_6_12, arg_6_0.currentHeight, 0)
	else
		arg_6_0.notchAdaptWidth = arg_6_0.actualWidth
		arg_6_0.notchAdaptHeight = arg_6_0.actualHeight
		arg_6_0.notchAdaptLBVector = arg_6_0.leftBottomVector
		arg_6_0.notchAdaptRTVector = arg_6_0.rightTopVector
	end
end

function var_0_0.Padding(arg_7_0)
	local var_7_0 = arg_7_0.aspectRatio
	local var_7_1 = arg_7_0.paddingCanvas.sizeDelta.x
	local var_7_2 = arg_7_0.paddingCanvas.sizeDelta.y
	local var_7_3 = 0
	local var_7_4 = 0
	local var_7_5 = arg_7_0.currentWidth / arg_7_0.currentHeight

	if var_7_5 <= var_7_0 then
		var_7_3 = var_7_1
		var_7_4 = var_7_1 / var_7_0
	elseif var_7_5 > arg_7_0.maxAspectRatio then
		var_7_4 = var_7_2
		var_7_3 = var_7_2 * arg_7_0.maxAspectRatio
	else
		var_7_4 = var_7_2
		var_7_3 = var_7_1
	end

	local var_7_6 = (var_7_1 - var_7_3) * 0.5
	local var_7_7 = (var_7_2 - var_7_4) * 0.5

	if var_7_7 > 0 then
		local var_7_8 = math.max(var_7_7, var_0_1)

		arg_7_0.topPanel.sizeDelta = Vector2(var_7_8, var_7_1)
		arg_7_0.bottomPanel.sizeDelta = Vector2(var_7_8, var_7_1)

		if var_7_7 < var_0_1 then
			local var_7_9 = var_0_1 - var_7_7 - 1

			arg_7_0.topPanel.anchoredPosition3D = Vector3(0, var_7_9, 0)
			arg_7_0.bottomPanel.anchoredPosition3D = Vector3(0, -var_7_9, 0)
		else
			arg_7_0.topPanel.anchoredPosition3D = Vector3(0, 0, 0)
			arg_7_0.bottomPanel.anchoredPosition3D = Vector3(0, 0, 0)
		end
	else
		arg_7_0.topPanel.sizeDelta = Vector2.zero
		arg_7_0.bottomPanel.sizeDelta = Vector2.zero
	end

	if var_7_6 > 0 then
		local var_7_10 = math.max(var_7_6, var_0_1)

		arg_7_0.leftPanel.sizeDelta = Vector2(var_7_10, var_7_2)
		arg_7_0.rightPanel.sizeDelta = Vector2(var_7_10, var_7_2)

		if var_7_6 < var_0_1 then
			local var_7_11 = var_0_1 - var_7_6

			arg_7_0.leftPanel.anchoredPosition3D = Vector3(-var_7_11, 0, 0)
			arg_7_0.rightPanel.anchoredPosition3D = Vector3(var_7_11, 0, 0)
		else
			arg_7_0.leftPanel.anchoredPosition3D = Vector3(0, 0, 0)
			arg_7_0.rightPanel.anchoredPosition3D = Vector3(0, 0, 0)
		end
	else
		arg_7_0.leftPanel.sizeDelta = Vector2.zero
		arg_7_0.rightPanel.sizeDelta = Vector2.zero
	end
end

function var_0_0.ResetPadding(arg_8_0)
	arg_8_0.topPanel.sizeDelta = Vector2.zero
	arg_8_0.bottomPanel.sizeDelta = Vector2.zero
	arg_8_0.leftPanel.sizeDelta = Vector2.zero
	arg_8_0.rightPanel.sizeDelta = Vector2.zero
end

function var_0_0.GetBattleUIRatio(arg_9_0)
	if arg_9_0.currentWidth / arg_9_0.currentHeight > ADAPT_NOTICE and NotchAdapt.CheckNotchRatio < arg_9_0.targetRatio then
		return NotchAdapt.CheckNotchRatio
	end

	return arg_9_0.targetRatio
end

function var_0_0.GetCurrentWidth(arg_10_0)
	return arg_10_0.currentWidth
end

function var_0_0.GetCurrentHeight(arg_11_0)
	return arg_11_0.currentHeight
end

local var_0_2 = {}

function var_0_0.SetCameraOrthographicSize(arg_12_0, arg_12_1, arg_12_2)
	if not arg_12_0.sizeRate or not arg_12_2 then
		return
	end

	var_0_2[arg_12_1] = arg_12_2
	arg_12_1.orthographicSize = arg_12_2 * arg_12_0.sizeRate
end

function var_0_0.GetCameraOrthographicSize(arg_13_0, arg_13_1)
	return var_0_2[arg_13_1]
end

function var_0_0.Clear(arg_14_0)
	if arg_14_0.handle then
		LateUpdateBeat:RemoveListener(arg_14_0.handle)
	end
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:Clear()
end
