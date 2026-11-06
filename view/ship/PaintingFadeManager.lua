local var_0_0 = class("PaintingFadeManager")
local var_0_1 = 1
local var_0_2 = 0.3
local var_0_3 = 0.3

var_0_0.PAINTING_TYPE = {
	MESH = 1,
	LIVE2D = 3,
	SPINE = 2
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._fadeInTime = arg_1_1 or var_0_2
	arg_1_0._fadeOutTime = arg_1_2 or var_0_3
	arg_1_0._uiCanvasTF = GameObject.Find("UICamera/Canvas").transform

	arg_1_0:CreateRawImage()
	parallelAsync({
		function(arg_2_0)
			pg.PoolMgr.GetInstance():GetPrefab("ui/paintingopacityui", "", false, function(arg_3_0)
				arg_1_0._paintingOpacity = PaintingOpacity.New(arg_3_0)

				arg_1_0._paintingOpacity:SetRawImage(arg_1_0._rawImageCom)
				setActive(arg_1_0._rawImageGo, false)
				arg_2_0()
			end)
		end,
		function(arg_4_0)
			pg.PoolMgr.GetInstance():GetPrefab("ui/paintingopacityprogressui", "", false, function(arg_5_0)
				arg_1_0._progressUI = tf(arg_5_0)
				arg_1_0._progressText = findTF(arg_1_0._progressUI, "text")

				setActive(arg_1_0._progressUI, false)
				arg_4_0()
			end)
		end
	})

	arg_1_0._screenTimer = Timer.New(function()
		arg_1_0:OnScreenSizeChange()
		arg_1_0:UpdateContainerOffset()
		arg_1_0:UpdateProgress()
	end, 0.03333333333333333, -1)

	arg_1_0._screenTimer:Start()
end

function var_0_0.UpdateProgress(arg_7_0)
	if arg_7_0._progressNum and arg_7_0._progressNum < 100 then
		arg_7_0._progressNum = arg_7_0._progressNum + math.random(3, 7)
		arg_7_0._progressNum = math.min(arg_7_0._progressNum, 100)
	end

	if arg_7_0._progressText then
		setText(arg_7_0._progressText, tostring(arg_7_0._progressNum) .. "%")
	end
end

function var_0_0.OnScreenSizeChange(arg_8_0)
	if arg_8_0._paintingOpacity then
		local var_8_0 = math.ceil(arg_8_0._uiCanvasTF.sizeDelta.x)
		local var_8_1 = math.ceil(arg_8_0._uiCanvasTF.sizeDelta.y)

		if arg_8_0._rawImageGo.transform.sizeDelta.x ~= var_8_0 or arg_8_0._rawImageGo.transform.sizeDelta.y ~= var_8_1 then
			arg_8_0._paintingOpacity:ResizeRenderTexture(var_8_0, var_8_1)

			arg_8_0._rawImageGo.transform.sizeDelta = Vector2(var_8_0, var_8_1)
		end
	end
end

function var_0_0.CreateRawImage(arg_9_0)
	arg_9_0._rawImageGo = GameObject.New("PaintingRawImage")

	arg_9_0._rawImageGo:AddComponent(typeof(UnityEngine.UI.RawImage))

	arg_9_0._rawImageCom = GetComponent(arg_9_0._rawImageGo, "UnityEngine.UI.RawImage")
	arg_9_0._rawImageCom.raycastTarget = false

	setActive(arg_9_0._rawImageGo, false)
end

function var_0_0.ResetPaintingContainerOffset(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if arg_10_0._paintingOpacity then
		arg_10_0._paintingOpacity:SetPaintingContainerOffset(arg_10_1, arg_10_2, arg_10_3)
	end

	arg_10_0:ResetRawImageOffset()
end

function var_0_0.UpdateContainerOffset(arg_11_0)
	if arg_11_0._paintingOpacity then
		local var_11_0 = arg_11_0._rawPaintingContiner.anchoredPosition
		local var_11_1 = arg_11_0._rawPaintingContiner.localScale

		arg_11_0._paintingOpacity:SetContainerOffset(var_11_0, var_11_1)
	end
end

function var_0_0.GetPaintingContainer(arg_12_0)
	return arg_12_0._paintingOpacity:GetContainerTF()
end

function var_0_0.GetSpinePaintingContainer(arg_13_0)
	return arg_13_0._paintingOpacity:GetSpinePaintingContainer()
end

function var_0_0.SetLoading(arg_14_0, arg_14_1)
	if arg_14_0._isDispose then
		return
	end

	arg_14_0._progressNum = math.random(0, 80)

	if arg_14_1 then
		if not arg_14_0._overlay then
			arg_14_0._overlay = true

			pg.UIMgr.GetInstance():OverlayPanel(arg_14_0._progressUI, {
				type = LayerWeightConst.UI_TYPE_SUB
			})
		end

		setActive(arg_14_0._progressUI, true)
		arg_14_0:UpdateProgress()
	else
		if arg_14_0._overlay then
			arg_14_0._overlay = false

			pg.UIMgr.GetInstance():UnOverlayPanel(arg_14_0._progressUI)
		end

		setActive(arg_14_0._progressUI, false)
	end
end

function var_0_0.SetRawPaintingContainer(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._rawPaintingContiner = arg_15_1
	arg_15_0._rawImageContainer = arg_15_2 or arg_15_0._rawPaintingContiner.parent

	setParent(arg_15_0._rawImageGo.transform, arg_15_0._rawImageContainer, false)
	arg_15_0:ResetRawImageOffset()
end

function var_0_0.ResetRawImageOffset(arg_16_0)
	local var_16_0 = GameObject.Find("UICamera"):GetComponent(typeof(UnityEngine.Camera))
	local var_16_1 = Vector3(Screen.width / 2, Screen.height / 2)
	local var_16_2 = var_16_0:ScreenToWorldPoint(var_16_1)
	local var_16_3 = arg_16_0._rawImageContainer:InverseTransformPoint(var_16_2)

	var_16_3.z = 0
	arg_16_0._rawImageGo.transform.localPosition = var_16_3
end

function var_0_0.SetOpacityPainting(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_0.type = arg_17_3

	if arg_17_3 == arg_17_0.PAINTING_TYPE.MESH then
		arg_17_0._paintingOpacity:SetMeshPainting(arg_17_1, arg_17_2)
	elseif arg_17_3 == arg_17_0.PAINTING_TYPE.SPINE then
		arg_17_0._paintingOpacity:SetSpinePainting(arg_17_1, arg_17_2)
	elseif arg_17_3 == arg_17_0.PAINTING_TYPE.LIVE2D then
		arg_17_0._paintingOpacity:SetLive2DPainting(arg_17_1, arg_17_2)
	end
end

function var_0_0.DisablePainting(arg_18_0)
	if arg_18_0._paintingOpacity then
		arg_18_0._paintingOpacity:DisablePainting()
	end
end

function var_0_0.SetPaintingFadeOut(arg_19_0, arg_19_1)
	if arg_19_0._paintingOpacity then
		if not isActive(arg_19_0._rawImageGo) then
			setActive(arg_19_0._rawImageGo, true)
		end

		arg_19_0._paintingOpacity:SetRawImageAlpha(1)
		arg_19_0._paintingOpacity:SetPaintingAlphaTween(0, arg_19_0._fadeOutTime, arg_19_1)
	elseif arg_19_1 then
		arg_19_1()

		arg_19_1 = nil
	end

	arg_19_0._paintingFadeFlag = true
end

function var_0_0.SetPaintingFadeIn(arg_20_0, arg_20_1)
	if arg_20_0._paintingOpacity then
		if not isActive(arg_20_0._rawImageGo) then
			setActive(arg_20_0._rawImageGo, true)
		end

		arg_20_0._paintingOpacity:SetRawImageAlpha(0)

		local var_20_0 = arg_20_0.type == arg_20_0.PAINTING_TYPE.LIVE2D and var_0_1 or arg_20_0._fadeInTime

		arg_20_0._paintingOpacity:SetPaintingAlphaTween(1, var_20_0, arg_20_1)
	elseif arg_20_1 then
		arg_20_1()

		arg_20_1 = nil
	end

	arg_20_0._paintingFadeFlag = true
end

function var_0_0.SetPaintingAlpha(arg_21_0, arg_21_1)
	print("change painting alpha to " .. arg_21_1)

	if not isActive(arg_21_0._rawImageGo) then
		setActive(arg_21_0._rawImageGo, true)
	end

	arg_21_0._paintingOpacity:ClearAlphaTween()
	arg_21_0._paintingOpacity:SetRawImageAlpha(arg_21_1)
end

function var_0_0.SetMeshPaintingFillter(arg_22_0, arg_22_1)
	if arg_22_0._paintingOpacity then
		arg_22_0._paintingOpacity:SetMeshPaintingFillter(arg_22_1)
	end
end

function var_0_0.RevertPaintingContainer(arg_23_0)
	arg_23_0._paintingOpacity:RevertPaintingContent()
end

function var_0_0.Dispose(arg_24_0)
	arg_24_0._isDispose = true
	arg_24_0._rawPaintingContiner = nil
	arg_24_0._bgContiner = nil

	if arg_24_0._progressUI then
		if arg_24_0._overlay then
			arg_24_0._overlay = false

			pg.UIMgr.GetInstance():UnOverlayPanel(arg_24_0._progressUI)
		end

		Destroy(arg_24_0._progressUI)
	end

	if arg_24_0._screenTimer then
		arg_24_0._screenTimer:Stop()

		arg_24_0._screenTimer = nil
	end

	if arg_24_0._paintingOpacity then
		arg_24_0._paintingOpacity:Dispose()

		arg_24_0._paintingOpacity = nil
	end

	if arg_24_0._rawImageGo then
		Destroy(arg_24_0._rawImageGo)

		arg_24_0._rawImageGo = nil
	end
end

return var_0_0
