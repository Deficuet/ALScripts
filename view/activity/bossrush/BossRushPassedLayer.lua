local var_0_0 = class("BossRushPassedLayer", import("view.challenge.ChallengePassedLayer"))

var_0_0.GROW_TIME = 0.55

function var_0_0.getUIName(arg_1_0)
	return "BossRushPassedUI"
end

function var_0_0.didEnter(arg_2_0)
	arg_2_0.tweenObjs = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_2_0._tf)
	arg_2_0:updateSlider(arg_2_0.curIndex)
	arg_2_0:moveSlider(arg_2_0.curIndex)
	onButton(arg_2_0, arg_2_0._tf, function()
		arg_2_0:emit(var_0_0.ON_CLOSE)
	end)
	arg_2_0._tf:GetComponent("DftAniEvent"):SetEndEvent(function(arg_4_0)
		arg_2_0:emit(var_0_0.ON_CLOSE)
	end)
end

function var_0_0.willExit(arg_5_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_5_0._tf)
	LeanTween.cancel(go(arg_5_0.slider))

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.tweenObjs) do
		LeanTween.cancel(iter_5_1)
	end

	arg_5_0.tweenObjs = {}
end

function var_0_0.onBackPressed(arg_6_0)
	triggerButton(arg_6_0._tf)
end

function var_0_0.initData(arg_7_0)
	arg_7_0.curIndex = arg_7_0.contextData.curIndex
end

function var_0_0.updateSlider(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1 or arg_8_0.curIndex
	local var_8_1 = arg_8_0.contextData.maxIndex

	if var_8_1 < var_8_0 then
		var_8_0 = var_8_0 % var_8_1 == 0 and var_8_1 or var_8_0 % var_8_1
	end

	local var_8_2 = 1 / (var_8_1 - 1)
	local var_8_3 = (var_8_0 - 1) * var_8_2

	arg_8_0.sliderSC.value = var_8_3

	local var_8_4 = GetComponent(arg_8_0.squareTpl, typeof(LayoutElement)).preferredWidth
	local var_8_5 = var_8_4 * 0.5
	local var_8_6 = (arg_8_0.squareContainer.rect.width - var_8_4) * var_8_2

	arg_8_0.squareList:make(function(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = arg_9_2:Find("UnFinished")
		local var_9_1 = arg_9_2:Find("Finished")
		local var_9_2 = arg_9_2:Find("Challengeing")
		local var_9_3 = arg_9_2:Find("Arrow")

		local function var_9_4()
			setActive(var_9_1, true)
			setActive(var_9_0, false)
			setActive(var_9_2, false)
		end

		local function var_9_5()
			setActive(var_9_1, false)
			setActive(var_9_0, true)
			setActive(var_9_2, false)
		end

		local function var_9_6()
			setActive(var_9_1, false)
			setActive(var_9_0, false)
			setActive(var_9_2, true)
		end

		if arg_9_0 == UIItemList.EventUpdate then
			if arg_9_1 + 1 < var_8_0 then
				setActive(var_9_3, false)
				var_9_4()
			elseif arg_9_1 + 1 == var_8_0 then
				setActive(var_9_3, true)
				var_9_6()
			elseif arg_9_1 + 1 > var_8_0 then
				setActive(var_9_3, false)
				var_9_5()
			end

			setAnchoredPosition(arg_9_2, {
				y = 0,
				x = var_8_5 + var_8_6 * arg_9_1
			})
		end
	end)
	arg_8_0.squareList:align(var_8_1)
end

function var_0_0.moveSlider(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1 or arg_13_0.curIndex
	local var_13_1 = arg_13_0.contextData.maxIndex

	if var_13_1 < var_13_0 then
		var_13_0 = var_13_0 % var_13_1 == 0 and var_13_1 or var_13_0 % var_13_1
	end

	local var_13_2 = 1 / (var_13_1 - 1)
	local var_13_3 = (var_13_0 - 1) * var_13_2
	local var_13_4 = var_13_0 * var_13_2

	LeanTween.value(go(arg_13_0.slider), var_13_3, var_13_4, var_0_0.GROW_TIME):setDelay(1.4):setOnUpdate(System.Action_float(function(arg_14_0)
		arg_13_0.sliderSC.value = arg_14_0
	end)):setOnComplete(System.Action(function()
		arg_13_0:updateSlider(var_13_0 + 1)
	end))
end

return var_0_0
