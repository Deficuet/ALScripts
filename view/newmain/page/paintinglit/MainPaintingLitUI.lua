local var_0_0 = class("MainPaintingLitUI")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._parent = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._partBtnMaxNum = 3
end

function var_0_0.SetShip(arg_2_0, arg_2_1)
	arg_2_0._ship = arg_2_1
	arg_2_0._paintingName = arg_2_1:getPainting()
	arg_2_0._shipId = arg_2_1.id
	arg_2_0._skinId = arg_2_1:getSkinId()
	arg_2_0._uiName = nil

	local var_2_0 = SpinePaintingConst.painting_lit_data[arg_2_0._paintingName] and SpinePaintingConst.painting_lit_data[arg_2_0._paintingName].lit_ui

	if var_2_0 and var_2_0 ~= "" then
		arg_2_0._uiName = var_2_0
	else
		arg_2_0._uiName = "mainpaintinglitui"
	end

	arg_2_0._partNum = SpinePaintingConst.painting_lit_data[arg_2_0._paintingName] and SpinePaintingConst.painting_lit_data[arg_2_0._paintingName].part_num

	if not arg_2_0._partNum or arg_2_0._partNum == "" then
		arg_2_0._partNum = {}
	end

	arg_2_0:loadLitUI()
end

function var_0_0.loadLitUI(arg_3_0)
	if arg_3_0._loading then
		return
	end

	if arg_3_0._litUI then
		return
	end

	arg_3_0._loading = true

	PoolMgr.GetInstance():GetUI(arg_3_0._uiName, true, function(arg_4_0)
		if arg_3_0._isDispose then
			PoolMgr.GetInstance():ReturnUI(arg_3_0._uiName, arg_4_0)

			return
		end

		setParent(tf(arg_4_0), arg_3_0._parent)
		arg_3_0:initLitUI(tf(arg_4_0))

		arg_3_0._loading = false

		if arg_3_0._flushOnLoaded then
			arg_3_0:Flush()
			arg_3_0:Update()

			arg_3_0._flushOnLoaded = false
		end

		arg_3_0:SetVisible(false)
	end)
end

function var_0_0.initLitUI(arg_5_0, arg_5_1)
	arg_5_0._tf = arg_5_1
	arg_5_0._litUI = findTF(arg_5_1, "ad")
	arg_5_0._partBtnsTf = findTF(arg_5_0._litUI, "part_btns")
	arg_5_0._btnResetTf = findTF(arg_5_0._litUI, "btn_reset")
	arg_5_0._btnRemindTf = findTF(arg_5_0._litUI, "btn_remind")
	arg_5_0._sliderTf = findTF(arg_5_0._litUI, "slider")
	arg_5_0._sliderShowTf = findTF(arg_5_0._litUI, "slider_show")
	arg_5_0._fillMask = findTF(arg_5_0._litUI, "slider_show/mask")

	if arg_5_0._fillMask then
		arg_5_0._fillImg = GetComponent(arg_5_0._fillMask, typeof(Image))
	end

	arg_5_0._fillMaskR = findTF(arg_5_0._litUI, "slider_show/mask_r")

	if arg_5_0._fillMaskR then
		arg_5_0._fillImageR = GetComponent(arg_5_0._fillMaskR, typeof(Image))
	end

	arg_5_0._fillBarAnimator = GetComponent(findTF(arg_5_0._litUI, "slider_show/bar"), typeof(Animator))
	arg_5_0._fillBarAnimatorName = arg_5_0._fillBarAnimator.runtimeAnimatorController.animationClips[0].name
	arg_5_0._slider = findTF(arg_5_0._litUI, "slider")

	setSlider(arg_5_0._slider, 0, 1, SpinePaintingConst.painting_lit_value)
	onSlider(arg_5_0._event, findTF(arg_5_0._litUI, "slider"), function(arg_6_0)
		arg_5_0:onSliderValueUpdate(arg_6_0)
	end)
	onButton(arg_5_0._event, findTF(arg_5_0._litUI, "btn_reset"), function()
		arg_5_0:ClickResetBtn()
	end)

	for iter_5_0 = 1, arg_5_0._partBtnMaxNum do
		local var_5_0 = iter_5_0

		if var_5_0 <= #arg_5_0._partNum then
			setActive(findTF(arg_5_0._litUI, "part_btns/" .. var_5_0), true)
			onButton(arg_5_0._event, findTF(arg_5_0._litUI, "part_btns/" .. var_5_0), function()
				if var_5_0 <= #arg_5_0._partNum then
					SpinePaintingConst.painting_lit_value = arg_5_0._partNum[var_5_0]

					SpinePaintingDrag.SetPaintingLite(arg_5_0._paintingName, arg_5_0._shipId, SpinePaintingConst.painting_lit_value)

					arg_5_0._selectPart = var_5_0

					arg_5_0:Update()
				end
			end)
		else
			setActive(findTF(arg_5_0._litUI, "part_btns/" .. var_5_0), false)
		end
	end
end

function var_0_0.ClickResetBtn(arg_9_0)
	if arg_9_0._partNum and #arg_9_0._partNum > 0 then
		triggerButton(findTF(arg_9_0._litUI, "part_btns/" .. 1))
	else
		SpinePaintingConst.painting_lit_value = 0.5
		arg_9_0._selectPart = 0

		SpinePaintingDrag.SetPaintingLite(arg_9_0._paintingName, arg_9_0._shipId, SpinePaintingConst.painting_lit_value)
		setSlider(arg_9_0._slider, 0, 1, SpinePaintingConst.painting_lit_value)
		arg_9_0:Update()
	end
end

function var_0_0.onSliderValueUpdate(arg_10_0, arg_10_1)
	LeanTween.cancel(go(arg_10_0._slider))

	local var_10_0 = SpinePaintingConst.painting_lit_value

	arg_10_0._selectPart = 0

	LeanTween.value(go(arg_10_0._slider), var_10_0, arg_10_1, 0.3):setOnUpdate(System.Action_float(function(arg_11_0)
		SpinePaintingConst.painting_lit_value = arg_11_0

		SpinePaintingDrag.SetPaintingLite(arg_10_0._paintingName, arg_10_0._shipId, arg_11_0)
		arg_10_0:Update()
	end))
end

function var_0_0.Flush(arg_12_0)
	if arg_12_0._litUI then
		arg_12_0._selectPart = 0
	else
		arg_12_0._flushOnLoaded = true
	end
end

function var_0_0.SetVisible(arg_13_0, arg_13_1)
	if not arg_13_0._tf then
		return
	end

	setActive(arg_13_0._tf, arg_13_1)
	LeanTween.cancel(go(arg_13_0._slider))

	if arg_13_1 then
		arg_13_0:Update()
	end
end

function var_0_0.Update(arg_14_0)
	if arg_14_0._litUI then
		arg_14_0:UpdateLit()
	end
end

function var_0_0.UpdateLit(arg_15_0)
	arg_15_0:updateFillAmountBar()
	arg_15_0:updateFillImage()
	arg_15_0:updateFillImageR()
	arg_15_0:updateSelectPartBtn()
	arg_15_0:updateUIPosition()
end

function var_0_0.updateSelectPartBtn(arg_16_0)
	for iter_16_0 = 1, #arg_16_0._partNum do
		setActive(findTF(arg_16_0._litUI, "part_btns/" .. iter_16_0 .. "/text_on"), arg_16_0._selectPart == iter_16_0)
		setActive(findTF(arg_16_0._litUI, "part_btns/" .. iter_16_0 .. "/text_off"), arg_16_0._selectPart ~= iter_16_0)
		setActive(findTF(arg_16_0._litUI, "part_btns/" .. iter_16_0 .. "/bg/on"), arg_16_0._selectPart == iter_16_0)
	end
end

function var_0_0.updateUIPosition(arg_17_0)
	local var_17_0 = getProxy(SettingsProxy):GetMainSceneThemeStyle()
	local var_17_1 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	local var_17_2

	if var_17_0 == NewMainScene.THEME_MELLOW then
		var_17_2 = Vector2(Screen.width / 2, Screen.height / 2)
	else
		var_17_2 = Vector2(Screen.width / 2 - 700, Screen.height / 2)
	end

	local var_17_3 = var_17_1:ScreenToWorldPoint(var_17_2)
	local var_17_4 = arg_17_0._parent:InverseTransformPoint(var_17_3)

	arg_17_0._litUI.anchoredPosition = var_17_4
end

function var_0_0.updateFillAmountBar(arg_18_0)
	arg_18_0._fillBarAnimator:Play(arg_18_0._fillBarAnimatorName, -1, math.clamp(SpinePaintingConst.painting_lit_value, 0, 1))
end

function var_0_0.updateFillImage(arg_19_0)
	if arg_19_0._fillImg then
		arg_19_0._fillImg.fillAmount = math.clamp(SpinePaintingConst.painting_lit_value, 0, 1)
	end
end

function var_0_0.updateFillImageR(arg_20_0)
	if arg_20_0._fillImageR then
		arg_20_0._fillImageR.fillAmount = math.clamp(1 - SpinePaintingConst.painting_lit_value, 0, 1)
	end
end

function var_0_0.GetSkinId(arg_21_0)
	return arg_21_0._skinId
end

function var_0_0.Dispose(arg_22_0)
	if arg_22_0._slider and LeanTween.isTweening(arg_22_0._slider) then
		LeanTween.cancel(go(arg_22_0._slider))
	end

	if arg_22_0._litUI then
		PoolMgr.GetInstance():ReturnUI(arg_22_0._uiName, arg_22_0._tf)

		arg_22_0._litUI = nil
		arg_22_0._uiName = nil
	end

	arg_22_0._ship = nil
	arg_22_0._isDispose = true
end

return var_0_0
