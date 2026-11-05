local var_0_0 = class("PaintingFadeManager")
local var_0_1 = 0.35
local var_0_2 = 0.35

var_0_0.PAINTING_TYPE = {
	MESH = 1,
	LIVE2D = 3,
	SPINE = 2
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._fadeInTime = arg_1_1 or var_0_1
	arg_1_0._fadeOutTime = arg_1_2 or var_0_2
	arg_1_0._uiCanvasTF = GameObject.Find("UICamera/Canvas").transform

	arg_1_0:CreateRawImage()
	parallelAsync({
		function(arg_2_0)
			pg.PoolMgr.GetInstance():GetPrefab("ui/paintingopacityui", "", false, function(arg_3_0)
				arg_1_0._paintingOpacity = PaintingOpacity.New(arg_3_0)

				arg_1_0._paintingOpacity:SetRawImage(arg_1_0._rawImageCom)
				setActive(arg_1_0._rawImageGo, true)
				arg_2_0()
			end)
		end,
		function(arg_4_0)
			pg.PoolMgr.GetInstance():GetPrefab("ui/paintingopacityprogressui", "", false, function(arg_5_0)
				arg_1_0._progressUI = tf(arg_5_0)

				setActive(arg_1_0._progressUI, false)
				arg_4_0()
			end)
		end
	})

	arg_1_0._screenTimer = Timer.New(function()
		arg_1_0:OnScreenSizeChange()
		arg_1_0:UpdateContainerOffset()
	end, 0.03333333333333333, -1)

	arg_1_0._screenTimer:Start()
end

function var_0_0.OnScreenSizeChange(arg_7_0)
	if arg_7_0._paintingOpacity then
		local var_7_0 = math.ceil(arg_7_0._uiCanvasTF.sizeDelta.x)
		local var_7_1 = math.ceil(arg_7_0._uiCanvasTF.sizeDelta.y)

		if arg_7_0._rawImageGo.transform.sizeDelta.x ~= var_7_0 or arg_7_0._rawImageGo.transform.sizeDelta.y ~= var_7_1 then
			arg_7_0._paintingOpacity:ResizeRenderTexture(var_7_0, var_7_1)

			arg_7_0._rawImageGo.transform.sizeDelta = Vector2(var_7_0, var_7_1)
		end
	end
end

function var_0_0.CreateRawImage(arg_8_0)
	arg_8_0._rawImageGo = GameObject.New("PaintingRawImage")

	arg_8_0._rawImageGo:AddComponent(typeof(UnityEngine.UI.RawImage))

	arg_8_0._rawImageCom = GetComponent(arg_8_0._rawImageGo, "UnityEngine.UI.RawImage")
	arg_8_0._rawImageCom.raycastTarget = false

	setActive(arg_8_0._rawImageGo, false)
end

function var_0_0.ResetPaintingContainerOffset(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if arg_9_0._paintingOpacity then
		arg_9_0._paintingOpacity:SetPaintingContainerOffset(arg_9_1, arg_9_2, arg_9_3)
	end

	arg_9_0:ResetRawImageOffset()
end

function var_0_0.UpdateContainerOffset(arg_10_0)
	if arg_10_0._paintingOpacity then
		local var_10_0 = arg_10_0._rawPaintingContiner.anchoredPosition
		local var_10_1 = arg_10_0._rawPaintingContiner.localScale

		arg_10_0._paintingOpacity:SetContainerOffset(var_10_0, var_10_1)
	end
end

function var_0_0.GetPaintingContainer(arg_11_0)
	return arg_11_0._paintingOpacity:GetContainerTF()
end

function var_0_0.GetSpinePaintingContainer(arg_12_0)
	return arg_12_0._paintingOpacity:GetSpinePaintingContainer()
end

function var_0_0.onLoadingCallback(arg_13_0, arg_13_1)
	if arg_13_0._isDispose then
		return
	end

	if arg_13_1 then
		if not arg_13_0._overlay then
			arg_13_0._overlay = true

			pg.UIMgr.GetInstance():OverlayPanel(arg_13_0._progressUI, {
				type = LayerWeightConst.UI_TYPE_SUB
			})
		end

		setActive(arg_13_0._progressUI, true)
	else
		if arg_13_0._overlay then
			arg_13_0._overlay = false

			pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._progressUI)
		end

		setActive(arg_13_0._progressUI, false)
	end
end

function var_0_0.SetRawPaintingContainer(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0._rawPaintingContiner = arg_14_1
	arg_14_0._rawImageContainer = arg_14_2 or arg_14_0._rawPaintingContiner.parent

	setParent(arg_14_0._rawImageGo.transform, arg_14_0._rawImageContainer, false)
	arg_14_0:ResetRawImageOffset()
end

function var_0_0.ResetRawImageOffset(arg_15_0)
	local var_15_0 = GameObject.Find("UICamera"):GetComponent(typeof(UnityEngine.Camera))
	local var_15_1 = Vector3(Screen.width / 2, Screen.height / 2)
	local var_15_2 = var_15_0:ScreenToWorldPoint(var_15_1)
	local var_15_3 = arg_15_0._rawImageContainer:InverseTransformPoint(var_15_2)

	var_15_3.z = 0
	arg_15_0._rawImageGo.transform.localPosition = var_15_3
end

function var_0_0.SetOpacityPainting(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_2 == arg_16_0.PAINTING_TYPE.MESH then
		arg_16_0._paintingOpacity:SetMeshPainting(arg_16_1)
	elseif arg_16_2 == arg_16_0.PAINTING_TYPE.SPINE then
		arg_16_0._paintingOpacity:SetSpinePainting(arg_16_1)
	elseif arg_16_2 == arg_16_0.PAINTING_TYPE.LIVE2D then
		arg_16_0._paintingOpacity:SetLive2DPainting(arg_16_1)
	end
end

function var_0_0.DisablePainting(arg_17_0)
	if arg_17_0._paintingOpacity then
		arg_17_0._paintingOpacity:DisablePainting()
	end
end

function var_0_0.SetPaintingFadeOut(arg_18_0, arg_18_1)
	if arg_18_0._paintingOpacity then
		arg_18_0._paintingOpacity:SetRawImageAlpha(1)
		arg_18_0._paintingOpacity:SetPaintingAlphaTween(0, arg_18_0._fadeOutTime, arg_18_1)
		arg_18_0:onLoadingCallback(true)
	elseif arg_18_1 then
		arg_18_1()

		arg_18_1 = nil
	end

	arg_18_0._paintingFadeFlag = true
end

function var_0_0.SetPaintingFadeIn(arg_19_0, arg_19_1)
	if arg_19_0._paintingOpacity then
		arg_19_0._paintingOpacity:SetRawImageAlpha(0)
		arg_19_0._paintingOpacity:SetPaintingAlphaTween(1, arg_19_0._fadeInTime, arg_19_1)
	elseif arg_19_1 then
		arg_19_1()

		arg_19_1 = nil
	end

	arg_19_0:onLoadingCallback(false)

	arg_19_0._paintingFadeFlag = true
end

function var_0_0.SetPaintingAlpha(arg_20_0, arg_20_1)
	print("change painting alpha to " .. arg_20_1)
	arg_20_0._paintingOpacity:ClearAlphaTween()
	arg_20_0._paintingOpacity:SetRawImageAlpha(arg_20_1)
	arg_20_0:onLoadingCallback(arg_20_1 <= 0)
end

function var_0_0.SetMeshPaintingFillter(arg_21_0, arg_21_1)
	if arg_21_0._paintingOpacity then
		arg_21_0._paintingOpacity:SetMeshPaintingFillter(arg_21_1)
	end
end

function var_0_0.RevertPaintingContainer(arg_22_0)
	arg_22_0._paintingOpacity:RevertPaintingContent()
end

function var_0_0.Dispose(arg_23_0)
	arg_23_0._isDispose = true
	arg_23_0._rawPaintingContiner = nil
	arg_23_0._bgContiner = nil

	if arg_23_0._progressUI then
		if arg_23_0._overlay then
			arg_23_0._overlay = false

			pg.UIMgr.GetInstance():UnOverlayPanel(arg_23_0._progressUI)
		end

		Destroy(arg_23_0._progressUI)
	end

	if arg_23_0._screenTimer then
		arg_23_0._screenTimer:Stop()

		arg_23_0._screenTimer = nil
	end

	if arg_23_0._paintingOpacity then
		arg_23_0._paintingOpacity:Dispose()

		arg_23_0._paintingOpacity = nil
	end

	if arg_23_0._rawImageGo then
		Destroy(arg_23_0._rawImageGo)

		arg_23_0._rawImageGo = nil
	end
end

return var_0_0
