pg = pg or {}

local var_0_0 = singletonClass("UIMgr")

pg.UIMgr = var_0_0

local var_0_1 = pg

var_0_0._loadPanel = nil
var_0_0.CameraUI = 1
var_0_0.CameraLevel = 2
var_0_0.CameraOverlay = 3
var_0_0.OptimizedBlur = 1
var_0_0.PartialBlur = 2

local function var_0_2(arg_1_0)
	if arg_1_0 == nil then
		return
	end

	arg_1_0.downsample = 2
	arg_1_0.blurSize = 1
	arg_1_0.blurIteration = 2
end

local function var_0_3(arg_2_0)
	if arg_2_0 == nil then
		return
	end

	arg_2_0.downsample = 2
	arg_2_0.blurSize = 1
	arg_2_0.blurIteration = 4
end

local function var_0_4(arg_3_0)
	if arg_3_0 == nil then
		return
	end

	arg_3_0.downsample = 2
	arg_3_0.blurSize = 1
	arg_3_0.blurIteration = 1
end

local function var_0_5(arg_4_0)
	if arg_4_0 == nil then
		return
	end

	arg_4_0.downsample = 2
	arg_4_0.blurSize = 1
	arg_4_0.blurIteration = 1
end

function var_0_0.Init(arg_5_0, arg_5_1)
	print("initializing ui manager...")

	arg_5_0.mainCamera = GameObject.Find("MainCamera")

	setActive(arg_5_0.mainCamera, false)

	arg_5_0.mainCameraComp = arg_5_0.mainCamera:GetComponent("Camera")
	arg_5_0.uiCamera = tf(GameObject.Find("UICamera"))
	arg_5_0.uiCameraComp = arg_5_0.uiCamera:GetComponent("Camera")
	arg_5_0.uiCameraComp.allowMSAA = false
	arg_5_0.levelCamera = tf(GameObject.Find("LevelCamera"))
	arg_5_0.levelCameraComp = arg_5_0.levelCamera:GetComponent("Camera")
	arg_5_0.levelCameraComp.allowMSAA = false
	arg_5_0.overlayCamera = tf(GameObject.Find("OverlayCamera"))
	arg_5_0.overlayCameraComp = arg_5_0.overlayCamera:GetComponent("Camera")
	arg_5_0.overlayCameraComp.allowMSAA = false
	arg_5_0.uiCameraComp = arg_5_0.uiCamera:GetComponent("Camera")
	arg_5_0.UICanvas = arg_5_0.uiCamera:Find("Canvas")
	arg_5_0.UIMain = arg_5_0.uiCamera:Find("Canvas/UIMain")
	arg_5_0.LevelMain = arg_5_0.levelCamera:Find("Canvas/UIMain")
	arg_5_0.OverlayMain = arg_5_0.overlayCamera:Find("Overlay/UIMain")
	arg_5_0.OverlayToast = arg_5_0.overlayCamera:Find("Overlay/UIOverlay")
	arg_5_0.OverlayEffect = arg_5_0.overlayCamera:Find("Overlay/UIEffect")
	arg_5_0._normalUIMain = nil
	arg_5_0._cameraBlurPartial = arg_5_0.uiCamera:GetComponent("UIPartialBlur")
	arg_5_0._levelCameraPartial = arg_5_0.levelCamera:GetComponent("UIPartialBlur")
	arg_5_0.cameraBlurs = {
		[var_0_0.CameraUI] = {
			arg_5_0.uiCamera:GetComponent("BlurOptimized"),
			arg_5_0._cameraBlurPartial
		},
		[var_0_0.CameraLevel] = {
			arg_5_0.levelCamera:GetComponent("BlurOptimized"),
			arg_5_0._levelCameraPartial
		},
		[var_0_0.CameraOverlay] = {
			(arg_5_0.overlayCamera:GetComponent("BlurOptimized"))
		}
	}
	arg_5_0.camLockStatus = {
		[var_0_0.CameraUI] = false,
		[var_0_0.CameraLevel] = false,
		[var_0_0.CameraOverlay] = false
	}

	local var_5_0 = DevicePerformanceUtil.GetDeviceLevel()

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.cameraBlurs) do
		if var_5_0 == DevicePerformanceLevel.Low then
			var_0_4(iter_5_1[var_0_0.OptimizedBlur])
			var_0_5(iter_5_1[var_0_0.PartialBlur])
		else
			var_0_2(iter_5_1[var_0_0.OptimizedBlur])
			var_0_3(iter_5_1[var_0_0.PartialBlur])
		end
	end

	arg_5_0.defaultMaterial = Material.New(Shader.Find("UI/Default"))
	arg_5_0.partialBlurMaterial = Material.New(Shader.Find("UI/PartialBlur"))
	arg_5_0._debugPanel = DebugPanel.New()

	setActive(arg_5_0.uiCamera, false)
	seriesAsync({
		function(arg_6_0)
			setActive(arg_5_0.uiCamera, true)

			arg_5_0._loadPanel = LoadingPanel.New(arg_6_0)
		end
	}, arg_5_1)
end

function var_0_0.Loading(arg_7_0, arg_7_1)
	arg_7_0._loadPanel:appendInfo(arg_7_1)
end

function var_0_0.LoadingOn(arg_8_0, arg_8_1)
	arg_8_0._loadPanel:on(arg_8_1)
end

function var_0_0.displayLoadingBG(arg_9_0, arg_9_1)
	if tobool(arg_9_0.showBG) == arg_9_1 then
		return
	end

	arg_9_0._loadPanel:displayBG(arg_9_1)

	arg_9_0.showBG = arg_9_1

	if arg_9_0.showBG then
		var_0_1.UIMgr.GetInstance():LoadingOn()
	else
		var_0_1.UIMgr.GetInstance():LoadingOff()
	end
end

function var_0_0.LoadingOff(arg_10_0)
	arg_10_0._loadPanel:off()
end

function var_0_0.OnLoading(arg_11_0)
	return arg_11_0._loadPanel:onLoading()
end

function var_0_0.LoadingRetainCount(arg_12_0)
	return arg_12_0._loadPanel:getRetainCount()
end

function var_0_0.AddDebugButton(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0._debugPanel:addCustomBtn(arg_13_1, arg_13_2)
end

function var_0_0.AddWorldTestButton(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0._debugPanel:addCustomBtn(arg_14_1, function()
		arg_14_0._debugPanel:hidePanel()
		arg_14_2()
	end)
end

var_0_0._maxbianjie = 50
var_0_0._maxbianjieInv = 0.02
var_0_0._maxbianjieSqr = 2500
var_0_0._followRange = 0
var_0_0._stick = nil
var_0_0._areaImg = nil
var_0_0._stickImg = nil
var_0_0._stickCom = nil
var_0_0._normalColor = Color(255, 255, 255, 1)
var_0_0._darkColor = Color(255, 255, 255, 0.5)
var_0_0._firstPos = Vector3.zero

function var_0_0.AttachStickOb(arg_16_0, arg_16_1)
	arg_16_0.hrz = 0
	arg_16_0.vtc = 0
	arg_16_0.fingerId = -1

	local var_16_0 = arg_16_1:Find("Area")

	arg_16_0._stick = var_16_0:Find("Stick")
	arg_16_0._areaImg = var_16_0:GetComponent(typeof(Image))
	arg_16_0._stickImg = arg_16_0._stick:GetComponent(typeof(Image))
	arg_16_0._stickCom = arg_16_1:GetComponent(typeof(StickController))
	arg_16_0._stickCom.StickBorderRate = 1

	arg_16_0._stickCom:SetStickFunc(function(arg_17_0, arg_17_1)
		arg_16_0:UpdateStick(arg_17_0, arg_17_1)
	end)

	arg_16_0._firstPos = var_16_0.localPosition
	arg_16_0.vtc = 0
	arg_16_0._stickTailPS = arg_16_0._stick:Find("tailGizmos")

	arg_16_0:SetActive(true)
end

function var_0_0.SetActive(arg_18_0, arg_18_1)
	arg_18_0._stickActive = arg_18_1
end

function var_0_0.Marching(arg_19_0)
	local var_19_0 = ys.Battle.BattleConfig

	LeanTween.value(go(arg_19_0._stick), 0, 0.625, 1.8):setOnUpdate(System.Action_float(function(arg_20_0)
		arg_19_0.hrz = var_19_0.START_SPEED_CONST_B * (arg_20_0 - var_19_0.START_SPEED_CONST_A) * (arg_20_0 - var_19_0.START_SPEED_CONST_A)
	end)):setOnComplete(System.Action(function()
		arg_19_0.hrz = 0
	end))
end

function var_0_0.UpdateStick(arg_22_0, arg_22_1, arg_22_2)
	if not arg_22_0._stickActive then
		return
	end

	if arg_22_0._stickTailPS then
		if arg_22_2 == -1 then
			if arg_22_2 ~= arg_22_0.fingerId then
				setActive(arg_22_0._stickTailPS, false)
			end
		elseif arg_22_2 >= 0 and arg_22_2 ~= arg_22_0.fingerId then
			setActive(arg_22_0._stickTailPS, true)
		end
	end

	if arg_22_2 == -2 then
		arg_22_0:SetOutput(arg_22_1.x, arg_22_1.y, -2)

		return
	elseif arg_22_2 == -1 then
		arg_22_0:SetOutput(0, 0, arg_22_2)

		return
	end

	local var_22_0 = arg_22_1

	var_22_0.z = 0

	local var_22_1 = var_22_0:SqrMagnitude()

	if var_22_1 > arg_22_0._maxbianjieSqr then
		var_22_0 = var_22_0 / math.sqrt(var_22_1)

		local var_22_2 = var_22_0 * arg_22_0._maxbianjie

		if arg_22_1 - var_22_2 ~= arg_22_0._firstPos then
			local var_22_3 = arg_22_0._firstPos
		end

		arg_22_0._stick.localPosition = var_22_2

		arg_22_0:SetOutput(var_22_0.x, var_22_0.y, arg_22_2)
	else
		arg_22_0._stick.localPosition = arg_22_1

		arg_22_0:SetOutput(var_22_0.x * arg_22_0._maxbianjieInv, var_22_0.y * arg_22_0._maxbianjieInv, arg_22_2)
	end
end

function var_0_0.SetOutput(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	arg_23_0.hrz = arg_23_1
	arg_23_0.vtc = arg_23_2

	local var_23_0 = (arg_23_3 >= 0 and 1 or 0) - (arg_23_0.fingerId >= 0 and 1 or 0)

	if var_23_0 ~= 0 and arg_23_0._areaImg and arg_23_0._stickImg then
		arg_23_0._areaImg.color = var_23_0 > 0 and var_0_0._normalColor or var_0_0._darkColor
		arg_23_0._stickImg.color = var_23_0 > 0 and var_0_0._normalColor or var_0_0._darkColor
	end

	if arg_23_3 < 0 then
		arg_23_0._stick.localPosition = Vector3.zero
	end

	arg_23_0.fingerId = arg_23_3
end

function var_0_0.ClearStick(arg_24_0)
	arg_24_0._stick.localPosition = Vector3.zero

	arg_24_0._stickCom:ClearStickFunc()

	arg_24_0._stick = nil
	arg_24_0._areaImg = nil
	arg_24_0._stickImg = nil
	arg_24_0._stickCom = nil
end

local var_0_6 = {}
local var_0_7 = false

function var_0_0.OverlayPanel(arg_25_0, arg_25_1, arg_25_2)
	arg_25_2 = arg_25_2 or {}
	arg_25_2.globalBlur = false

	var_0_1.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, arg_25_1, arg_25_2)
end

function var_0_0.UnOverlayPanel(arg_26_0, arg_26_1, arg_26_2)
	var_0_1.LayerWeightMgr.GetInstance():DelFromOverlay(arg_26_1, arg_26_2 or arg_26_0.UIMain)
end

function var_0_0.BlurPanel(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_3 = arg_27_3 or {}
	arg_27_3.globalBlur = true
	arg_27_3.staticBlur = arg_27_2

	var_0_1.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, arg_27_1, arg_27_3)
end

function var_0_0.UnblurPanel(arg_28_0, arg_28_1, arg_28_2)
	var_0_1.LayerWeightMgr.GetInstance():DelFromOverlay(arg_28_1, arg_28_2 or arg_28_0.UIMain)
end

function var_0_0.OverlayPanelPB(arg_29_0, arg_29_1, arg_29_2)
	arg_29_2 = arg_29_2 or {}
	arg_29_2.globalBlur = false

	var_0_1.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, arg_29_1, arg_29_2)
end

function var_0_0.PartialBlurTfs(arg_30_0, arg_30_1)
	var_0_7 = true
	var_0_6 = arg_30_1

	arg_30_0:UpdatePBEnable(true)
end

function var_0_0.ShutdownPartialBlur(arg_31_0, arg_31_1)
	var_0_7 = false
	var_0_6 = arg_31_1 or {}

	arg_31_0:UpdatePBEnable(false)
end

function var_0_0.RevertPBMaterial(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in ipairs(arg_32_1) do
		local var_32_0 = iter_32_1:GetComponent(typeof(Image))

		assert(var_32_0, "mask should be an image.")

		var_32_0.material = arg_32_0.defaultMaterial
	end
end

function var_0_0.UpdatePBEnable(arg_33_0, arg_33_1)
	if var_0_6 ~= nil then
		for iter_33_0, iter_33_1 in ipairs(var_0_6) do
			local var_33_0 = iter_33_1:GetComponent(typeof(Image))

			assert(var_33_0, "mask should be an image.")

			var_33_0.material = arg_33_1 and arg_33_0.partialBlurMaterial or nil
		end
	end

	if arg_33_1 then
		if arg_33_0.levelCameraComp.enabled then
			arg_33_0.cameraBlurs[var_0_0.CameraLevel][var_0_0.PartialBlur].enabled = true
			arg_33_0.cameraBlurs[var_0_0.CameraUI][var_0_0.PartialBlur].enabled = false
		else
			arg_33_0.cameraBlurs[var_0_0.CameraLevel][var_0_0.PartialBlur].enabled = false
			arg_33_0.cameraBlurs[var_0_0.CameraUI][var_0_0.PartialBlur].enabled = true
		end
	else
		for iter_33_2, iter_33_3 in ipairs(arg_33_0.cameraBlurs) do
			if iter_33_3[var_0_0.PartialBlur] then
				iter_33_3[var_0_0.PartialBlur].enabled = false
			end
		end
	end
end

local var_0_8

function var_0_0.TempOverlayPanelPB(arg_34_0, arg_34_1, arg_34_2)
	arg_34_0:OverlayPanel(arg_34_1, setmetatable({}, {
		__index = function(arg_35_0, arg_35_1)
			if arg_35_1 == "pbList" then
				return nil
			end

			return arg_34_2[arg_35_1]
		end
	}))

	var_0_6 = arg_34_2.pbList

	local var_34_0 = arg_34_2.baseCamera

	var_0_8 = {
		var_34_0:GetComponent("BlurOptimized"),
		var_34_0:GetComponent("UIPartialBlur")
	}

	if DevicePerformanceUtil.GetDeviceLevel() == DevicePerformanceLevel.Low then
		var_0_4(var_0_8[var_0_0.OptimizedBlur])
		var_0_5(var_0_8[var_0_0.PartialBlur])
	else
		var_0_2(var_0_8[var_0_0.OptimizedBlur])
		var_0_3(var_0_8[var_0_0.PartialBlur])
	end

	var_0_8[var_0_0.PartialBlur].maskCam = arg_34_0.overlayCamera:GetComponent("Camera")

	arg_34_0:UpdateOtherPBEnable(true, var_0_8)
end

function var_0_0.TempUnblurPanel(arg_36_0, arg_36_1, arg_36_2)
	arg_36_0:UnOverlayPanel(arg_36_1, arg_36_2)
	arg_36_0:UpdateOtherPBEnable(false, var_0_8)

	var_0_8 = nil

	setParent(arg_36_1, arg_36_2)
end

function var_0_0.UpdateOtherPBEnable(arg_37_0, arg_37_1, arg_37_2)
	if var_0_6 ~= nil then
		for iter_37_0, iter_37_1 in ipairs(var_0_6) do
			local var_37_0 = iter_37_1:GetComponent(typeof(Image))

			assert(var_37_0, "mask should be an image.")

			var_37_0.material = arg_37_1 and arg_37_0.partialBlurMaterial or nil
		end
	end

	arg_37_2[var_0_0.PartialBlur].enabled = arg_37_1
end

function var_0_0.BlurCamera(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	if not arg_38_0.camLockStatus[arg_38_1] or arg_38_3 then
		local var_38_0 = arg_38_0.cameraBlurs[arg_38_1][var_0_0.OptimizedBlur]

		if arg_38_2 then
			var_38_0.enabled = true
			var_38_0.staticBlur = true
		else
			if var_38_0.enabled == true and var_38_0.staticBlur == true then
				var_38_0.enabled = false
			end

			var_38_0.enabled = true
			var_38_0.staticBlur = false
		end

		if arg_38_3 then
			arg_38_0.camLockStatus[arg_38_1] = true
		end
	end
end

function var_0_0.UnblurCamera(arg_39_0, arg_39_1, arg_39_2)
	if not arg_39_0.camLockStatus[arg_39_1] or arg_39_2 then
		arg_39_0.cameraBlurs[arg_39_1][var_0_0.OptimizedBlur].enabled = false

		if arg_39_2 then
			arg_39_0.camLockStatus[arg_39_1] = false
		end
	end
end

function var_0_0.SetMainCamBlurTexture(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.mainCamera:GetComponent(typeof(Camera))
	local var_40_1 = ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.RenderTexture"), "GetTemporary", {
		typeof("System.Int32"),
		typeof("System.Int32"),
		typeof("System.Int32")
	}, {
		Screen.width,
		Screen.height,
		0
	})

	var_40_0.targetTexture = var_40_1

	var_40_0:Render()

	local var_40_2 = var_0_1.ShaderMgr.GetInstance():BlurTexture(var_40_1)

	var_40_0.targetTexture = nil

	ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.RenderTexture"), "ReleaseTemporary", {
		typeof("UnityEngine.RenderTexture")
	}, {
		var_40_1
	})

	arg_40_1.uvRect = var_40_0.rect
	arg_40_1.texture = var_40_2

	return var_40_2
end

function var_0_0.GetMainCamera(arg_41_0)
	return arg_41_0.mainCamera
end
