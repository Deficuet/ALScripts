local var_0_0 = class("YingxiV3FramePage", import(".TemplatePage.NewFrameTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.gotTag = arg_1_0._tf:Find("AD/switcher/phase2/got")
end

function var_0_0.Switch(arg_2_0, arg_2_1)
	arg_2_0.isSwitching = true

	local var_2_0
	local var_2_1

	if arg_2_1 then
		var_2_0, var_2_1 = arg_2_0.phases[1], arg_2_0.phases[2]
	else
		var_2_0, var_2_1 = arg_2_0.phases[2], arg_2_0.phases[1]
	end

	local var_2_2 = GetOrAddComponent(var_2_0, typeof(CanvasGroup))
	local var_2_3 = var_2_0.localPosition
	local var_2_4 = var_2_1.localPosition

	var_2_1:SetAsLastSibling()
	setActive(var_2_0:Find("Image"), false)
	setLocalPosition(go(var_2_0), var_2_4)
	setActive(var_2_0:Find("label"), true)
	LeanTween.value(go(var_2_0), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_3_0)
		var_2_2.alpha = arg_3_0
	end))
	setActive(var_2_1:Find("Image"), true)

	local var_2_5 = GetOrAddComponent(var_2_1, typeof(CanvasGroup))

	LeanTween.value(go(var_2_1), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_4_0)
		var_2_5.alpha = arg_4_0
	end))
	setActive(var_2_1:Find("label"), false)
	setLocalPosition(go(var_2_1), var_2_3)

	arg_2_0.isSwitching = nil
end

return var_0_0
