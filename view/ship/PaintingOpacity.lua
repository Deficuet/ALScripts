local var_0_0 = class("PaintingOpacity")
local var_0_1 = 0.03333333333333333

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1

	arg_1_0._go.transform:SetParent(nil, false)

	arg_1_0._camera = arg_1_0._go:GetComponent(typeof(UnityEngine.Camera))
	arg_1_0._canvas = findTF(arg_1_0._go, "Canvas"):GetComponent(typeof(UnityEngine.Canvas))
	arg_1_0._canvasTF = arg_1_0._canvas.gameObject.transform
	arg_1_0._paintingContainerTF = findTF(arg_1_0._go, "Canvas/paint")
	arg_1_0._meshContent = findTF(arg_1_0._paintingContainerTF, "fitter")
	arg_1_0._spineContent = findTF(arg_1_0._paintingContainerTF, "spinePainting")
	arg_1_0._live2dContent = findTF(arg_1_0._paintingContainerTF, "live2d")
	arg_1_0.timer = Timer.New(function()
		arg_1_0:step()
	end, var_0_1, -1)

	arg_1_0.timer:Start()
	arg_1_0:SetVisible(false)
end

function var_0_0.step(arg_3_0)
	if arg_3_0._delayCallbackTime and arg_3_0._delayCallbackTime >= 0 then
		arg_3_0._delayCallbackTime = arg_3_0._delayCallbackTime - Time.deltaTime

		if arg_3_0._delayCallbackTime <= 0 then
			arg_3_0:InvokeDelayCallback()
		end
	end
end

function var_0_0.InvokeDelayCallback(arg_4_0)
	local var_4_0 = arg_4_0._delayCallback

	arg_4_0._delayCallback = nil
	arg_4_0._delayCallbackTime = nil

	if var_4_0 then
		var_4_0()
	end
end

function var_0_0.ResizeRenderTexture(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0._rt and arg_5_0._rt.width == arg_5_1 and arg_5_0._rt.height == arg_5_2 then
		return
	end

	arg_5_0:ClearRendererTexture()

	arg_5_0._rt = UnityEngine.RenderTexture.New(arg_5_1, arg_5_2, 0)
	arg_5_0._camera.targetTexture = arg_5_0._rt

	if arg_5_0._rawImage then
		arg_5_0._rawImage.texture = arg_5_0._rt
	end
end

function var_0_0.SetPaintingContainerOffset(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0._meshContent.anchoredPosition = arg_6_3
	arg_6_0._spineContent.anchoredPosition = arg_6_2
	arg_6_0._live2dContent.anchoredPosition = arg_6_1
end

function var_0_0.SetContainerOffset(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._paintingContainerTF.anchoredPosition = arg_7_1
	arg_7_0._paintingContainerTF.localScale = arg_7_2
end

function var_0_0.GetContainerTF(arg_8_0)
	return arg_8_0._paintingContainerTF
end

function var_0_0.GetSpinePaintingContainer(arg_9_0)
	return arg_9_0._spineContent
end

function var_0_0.DisablePainting(arg_10_0)
	print("disable painting")

	if not IsNil(arg_10_0._paintingTF) and not IsNil(arg_10_0._paintingPreParent) then
		SetParent(arg_10_0._paintingTF, arg_10_0._paintingPreParent, false)
	end

	arg_10_0._paintingTF = nil
	arg_10_0._paintingPreParent = nil
	arg_10_0._paintingContent = nil
end

function var_0_0.SetPaintingAlphaTween(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0:InvokeDelayCallback()

	if arg_11_0._isDispose then
		if arg_11_3 then
			arg_11_3()
		end

		return
	end

	print("set painting alpha tween value = " .. arg_11_1 .. " time = " .. arg_11_2)

	arg_11_0._delayCallback = arg_11_3

	local var_11_0 = 0

	arg_11_0:ClearAlphaTween()
	arg_11_0:SetPaitningAlphaContent()

	local var_11_1 = IsNil(arg_11_0._rawImage) and arg_11_1 or arg_11_0._rawImage.color.a

	LeanTween.value(arg_11_0._go, var_11_1, arg_11_1, arg_11_2):setEase(LeanTweenType.linear):setOnUpdate(System.Action_float(function(arg_12_0)
		if var_11_0 > 0 then
			arg_11_0:SetRawImageAlpha(arg_12_0)
		end

		var_11_0 = var_11_0 + 1
	end)):setOnComplete(System.Action(function()
		arg_11_0:SetRawImageAlpha(arg_11_1)

		if arg_11_1 == 1 then
			arg_11_0:RevertPaintingContent()
		end

		arg_11_0:InvokeDelayCallback()
	end))
end

function var_0_0.SetPaitningAlphaContent(arg_14_0)
	if not arg_14_0:GetVisible() then
		arg_14_0:SetVisible(true)
	end

	if not IsNil(arg_14_0._paintingTF) and not IsNil(arg_14_0._paintingContent) then
		SetParent(arg_14_0._paintingTF, arg_14_0._paintingContent, false)
	end
end

function var_0_0.RevertPaintingContent(arg_15_0)
	print("revert content")

	if not IsNil(arg_15_0._paintingTF) and not IsNil(arg_15_0._paintingPreParent) then
		SetParent(arg_15_0._paintingTF, arg_15_0._paintingPreParent, false)
	end
end

function var_0_0.SetRawImage(arg_16_0, arg_16_1)
	arg_16_0._rawImage = arg_16_1
	arg_16_0._rawImage.texture = arg_16_0._rt
end

function var_0_0.SetRawImageAlpha(arg_17_0, arg_17_1)
	if IsNil(arg_17_0._rawImage) then
		return
	end

	local var_17_0 = arg_17_0._rawImage.color

	var_17_0.a = Mathf.Clamp01(arg_17_1)
	arg_17_0._rawImage.color = var_17_0
end

function var_0_0.ClearAlphaTween(arg_18_0)
	if LeanTween.isTweening(arg_18_0._go) then
		LeanTween.cancel(arg_18_0._go)
	end
end

function var_0_0.SetMeshPaintingFillter(arg_19_0, arg_19_1)
	local var_19_0 = GetOrAddComponent(arg_19_0._meshContent, "PaintingScaler")

	var_19_0.FrameName = arg_19_1
	var_19_0.Tween = 1
end

function var_0_0.SetMeshPainting(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_1 then
		arg_20_0._paintingTF = arg_20_1
		arg_20_0._paintingPreParent = arg_20_2
		arg_20_0._paintingContent = arg_20_0._meshContent

		SetParent(arg_20_1, arg_20_0._meshContent, false)
	end

	arg_20_0:SetRawImageAlpha(1)
end

function var_0_0.SetSpinePainting(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_1 then
		arg_21_0._paintingTF = arg_21_1
		arg_21_0._paintingPreParent = arg_21_2
		arg_21_0._paintingContent = arg_21_0._spineContent

		SetParent(arg_21_1, arg_21_0._spineContent, false)
	end

	arg_21_0:SetRawImageAlpha(1)
end

function var_0_0.SetLive2DPainting(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_1 then
		arg_22_0._paintingTF = arg_22_1
		arg_22_0._paintingPreParent = arg_22_2
		arg_22_0._paintingContent = arg_22_0._live2dContent

		SetParent(arg_22_1, arg_22_0._live2dContent, false)
	end

	arg_22_0:SetRawImageAlpha(1)
end

function var_0_0.ClearRendererTexture(arg_23_0)
	if not arg_23_0._rt then
		return
	end

	arg_23_0._camera.targetTexture = nil

	arg_23_0._rt:Release()
	UnityEngine.Object.Destroy(arg_23_0._rt)

	arg_23_0._rt = nil
end

function var_0_0.GetCanvasTF(arg_24_0)
	return arg_24_0._canvasTF
end

function var_0_0.SetVisible(arg_25_0, arg_25_1)
	if IsNil(arg_25_0._go) then
		return
	end

	setActive(arg_25_0._go, arg_25_1)
	arg_25_0:SetRawImageAlpha(arg_25_1 and 1 or 0)
end

function var_0_0.GetVisible(arg_26_0)
	if IsNil(arg_26_0._go) then
		return false
	end

	return isActive(arg_26_0._go)
end

function var_0_0.Dispose(arg_27_0)
	if arg_27_0._isDispose then
		return
	end

	print("dispose opacity")

	arg_27_0._isDispose = true

	arg_27_0:DisablePainting()
	arg_27_0:InvokeDelayCallback()

	if arg_27_0.timer then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end

	arg_27_0:ClearAlphaTween()
	arg_27_0:ClearRendererTexture()
	Destroy(arg_27_0._go)
end

return var_0_0
