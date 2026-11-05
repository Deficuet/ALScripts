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
end

function var_0_0.step(arg_3_0)
	if arg_3_0._delayCallbackTime and arg_3_0._delayCallbackTime >= 0 then
		arg_3_0._delayCallbackTime = arg_3_0._delayCallbackTime - Time.deltaTime

		if arg_3_0._delayCallbackTime <= 0 then
			if arg_3_0._delayCallback then
				local var_3_0 = arg_3_0._delayCallback

				arg_3_0._delayCallback = nil

				var_3_0()
			end

			arg_3_0._delayCallbackTime = nil
		end
	end
end

function var_0_0.ResizeRenderTexture(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0._rt and arg_4_0._rt.width == arg_4_1 and arg_4_0._rt.height == arg_4_2 then
		return
	end

	arg_4_0:ClearRendererTexture()

	arg_4_0._rt = UnityEngine.RenderTexture.New(arg_4_1, arg_4_2, 0)
	arg_4_0._camera.targetTexture = arg_4_0._rt

	if arg_4_0._rawImage then
		arg_4_0._rawImage.texture = arg_4_0._rt
	end
end

function var_0_0.SetPaintingContainerOffset(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_0._meshContent.anchoredPosition = arg_5_3
	arg_5_0._spineContent.anchoredPosition = arg_5_2
	arg_5_0._live2dContent.anchoredPosition = arg_5_1
end

function var_0_0.SetContainerOffset(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._paintingContainerTF.anchoredPosition = arg_6_1
	arg_6_0._paintingContainerTF.localScale = arg_6_2
end

function var_0_0.GetContainerTF(arg_7_0)
	return arg_7_0._paintingContainerTF
end

function var_0_0.GetSpinePaintingContainer(arg_8_0)
	return arg_8_0._spineContent
end

function var_0_0.DisablePainting(arg_9_0)
	if arg_9_0._paintingTF then
		SetParent(arg_9_0._paintingTF, arg_9_0._paintingPreParent, false)

		arg_9_0._paintingTF = nil
		arg_9_0._paintingPreParent = nil
	end
end

function var_0_0.SetPaintingAlphaTween(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if arg_10_0._delayCallback then
		arg_10_0._delayCallback()

		arg_10_0._delayCallback = nil
		arg_10_0._delayCallbackTime = nil
	end

	print("set painting alpha tween value = " .. arg_10_1 .. " time = " .. arg_10_2)

	arg_10_0._delayCallback = arg_10_3
	arg_10_0._delayCallbackTime = arg_10_2

	local var_10_0 = 0

	arg_10_0:ClearAlphaTween()
	arg_10_0:SetPaitningAlphaContent()
	LeanTween.value(arg_10_0._go, arg_10_0._rawImage.color.a, arg_10_1, arg_10_2):setEase(LeanTweenType.linear):setOnUpdate(System.Action_float(function(arg_11_0)
		if var_10_0 > 0 then
			arg_10_0:SetRawImageAlpha(arg_11_0)
		end

		var_10_0 = var_10_0 + 1
	end)):setOnComplete(System.Action(function()
		arg_10_0:SetRawImageAlpha(arg_10_1)

		if arg_10_1 == 1 then
			arg_10_0:RevertPaintingContent()
		end

		if arg_10_0._delayCallback then
			arg_10_0._delayCallback()

			arg_10_0._delayCallback = nil
			arg_10_0._delayCallbackTime = nil
		end
	end))
end

function var_0_0.SetPaitningAlphaContent(arg_13_0)
	if arg_13_0._paintingTF and arg_13_0._paintingContent then
		SetParent(arg_13_0._paintingTF, arg_13_0._paintingContent, false)
	end
end

function var_0_0.RevertPaintingContent(arg_14_0)
	if arg_14_0._paintingTF and arg_14_0._paintingPreParent then
		SetParent(arg_14_0._paintingTF, arg_14_0._paintingPreParent, false)
	end
end

function var_0_0.SetRawImage(arg_15_0, arg_15_1)
	arg_15_0._rawImage = arg_15_1
	arg_15_0._rawImage.texture = arg_15_0._rt
end

function var_0_0.SetRawImageAlpha(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0._rawImage.color

	var_16_0.a = Mathf.Clamp01(arg_16_1)
	arg_16_0._rawImage.color = var_16_0
end

function var_0_0.ClearAlphaTween(arg_17_0)
	if LeanTween.isTweening(arg_17_0._go) then
		LeanTween.cancel(arg_17_0._go)
	end
end

function var_0_0.SetMeshPaintingFillter(arg_18_0, arg_18_1)
	local var_18_0 = GetOrAddComponent(arg_18_0._meshContent, "PaintingScaler")

	var_18_0.FrameName = arg_18_1
	var_18_0.Tween = 1
end

function var_0_0.SetMeshPainting(arg_19_0, arg_19_1)
	if arg_19_1 then
		arg_19_0._paintingTF = arg_19_1
		arg_19_0._paintingPreParent = arg_19_1.parent
		arg_19_0._paintingContent = arg_19_0._meshContent

		SetParent(arg_19_1, arg_19_0._meshContent, false)
	end

	arg_19_0:SetRawImageAlpha(1)
end

function var_0_0.SetSpinePainting(arg_20_0, arg_20_1)
	if arg_20_1 then
		arg_20_0._paintingTF = arg_20_1

		if arg_20_1.parent then
			arg_20_0._paintingPreParent = arg_20_1.parent
		end

		arg_20_0._paintingContent = arg_20_0._spineContent

		SetParent(arg_20_1, arg_20_0._spineContent, false)
	end

	arg_20_0:SetRawImageAlpha(1)
end

function var_0_0.SetLive2DPainting(arg_21_0, arg_21_1)
	if arg_21_1 then
		arg_21_0._paintingTF = arg_21_1

		if arg_21_1.parent then
			arg_21_0._paintingPreParent = arg_21_1.parent
		end

		arg_21_0._paintingContent = arg_21_0._live2dContent

		SetParent(arg_21_1, arg_21_0._live2dContent, false)
	end

	arg_21_0:SetRawImageAlpha(1)
end

function var_0_0.ClearRendererTexture(arg_22_0)
	if not arg_22_0._rt then
		return
	end

	arg_22_0._camera.targetTexture = nil

	arg_22_0._rt:Release()
	UnityEngine.Object.Destroy(arg_22_0._rt)

	arg_22_0._rt = nil
end

function var_0_0.GetCanvasTF(arg_23_0)
	return arg_23_0._canvasTF
end

function var_0_0.Dispose(arg_24_0)
	if arg_24_0._delayCallback then
		local var_24_0 = arg_24_0._delayCallback

		arg_24_0._delayCallback = nil

		var_24_0()
	end

	if arg_24_0.timer then
		arg_24_0.timer:Stop()

		arg_24_0.timer = nil
	end

	arg_24_0:ClearAlphaTween()
	arg_24_0:ClearRendererTexture()
	Destroy(arg_24_0._go)
end

return var_0_0
